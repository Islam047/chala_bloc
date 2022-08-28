import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../blocks/create_cubit_state.dart';
import '../model/post_model.dart';

Widget viewOfCreate(bool isLoading, BuildContext context,
    TextEditingController titleController,
    TextEditingController numberController,
    TextEditingController bodyController) {
  return Container(
    padding: const EdgeInsets.all(30),
    child: Stack(
      children: [
        Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                  hintText: "Name", hintStyle: TextStyle(color: Colors.grey)),
            ),
            TextField(
              controller: bodyController,
              decoration: const InputDecoration(
                  hintText: "SureName", hintStyle: TextStyle(color: Colors.grey)),
            ),
            TextField(
              controller: numberController,
              decoration: const InputDecoration(
                  hintText: "PhoneNumber", hintStyle: TextStyle(color: Colors.grey)),
            ),
            const SizedBox(
              height: 10,
            ),
            MaterialButton(
              onPressed: () {
                Student student = Student(
                    name: titleController.text.toString(),
                    sureName: bodyController.text.toString(),
                    number: numberController.text.toString(),
                    id : '1',
                );
                BlocProvider.of<CreateMockCubit>(context).apiPostCreate(student);
              },
              color: Colors.blue,
              child: const Text(
                "Create a Post",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        isLoading
            ? const Center(
          child: CircularProgressIndicator(),
        )
            : const SizedBox.shrink(),
      ],
    ),
  );
}