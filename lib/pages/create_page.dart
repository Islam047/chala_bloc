import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocks/create_cubit_state.dart';
import '../blocks/create_mock_cubit.dart';
import '../views/view_of_create.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  _finish(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Navigator.pop(context, "result");
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateMockCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Add Post"),
        ),
        body: BlocBuilder<CreateMockCubit, CreateMockState>(
          builder: (BuildContext context, CreateMockState state) {
            if (state is CreateMockLoading) {
              return viewOfCreate(true, context, titleController, bodyController,numberController);
            }
            if (state is CreateMockLoaded) {
              _finish(context);
            }
            if (state is CreateMockError) {}
            return viewOfCreate(false, context, titleController, bodyController,numberController);
          },
        ),
      ),
    );
  }
}
