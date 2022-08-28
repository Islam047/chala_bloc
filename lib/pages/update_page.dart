import 'package:flutter/material.dart';
import '../blocks/update_post_cubit.dart';
import '../blocks/update_post_state.dart';
import '../model/post_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/scheduler.dart';
import '../views/view_of_update.dart';

class UpdatePage extends StatefulWidget {
 final Student? student;

  const UpdatePage({Key? key, this.student}) : super(key: key);

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  _finish(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Navigator.pop(context, "result");
    });
  }

  @override
  void initState() {
    super.initState();
    titleController.text = widget.student!.name;
    bodyController.text = widget.student!.sureName;
    phoneController.text = widget.student!.number;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateMockCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Update a Post"),
        ),
        body: BlocBuilder<UpdateMockCubit, UpdateMockState>(
          builder: (BuildContext context, UpdateMockState state) {
            if (state is UpdateMockLoading) {
              String title = titleController.text.toString();
              String body = bodyController.text.toString();
              Student student = Student(
                  id: widget.student!.id,
                  name: title,
                  sureName: body,
                  number: widget.student!.number);
              return viewOfUpdate(
                  true, context, student, titleController, bodyController,phoneController);
            }
            if (state is UpdateMockLoaded) {
              _finish(context);
            }
            if (state is UpdateMockError) {}
            return viewOfUpdate(
                false, context, widget.student!, titleController, bodyController,phoneController);
          },
        ),
      ),
    );
  }
}