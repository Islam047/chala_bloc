import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocks/update_post_cubit.dart';
import '../model/post_model.dart';

Widget viewOfUpdate(bool isLoading, BuildContext context, Student student, TextEditingController titleController, TextEditingController bodyController,TextEditingController phoneNumber) {
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
              controller: phoneNumber,
              decoration: const InputDecoration(
                  hintText: "Number", hintStyle: TextStyle(color: Colors.grey)),
            ),
            const SizedBox(
              height: 10,
            ),
            MaterialButton(
              onPressed: () {
                student.name = titleController.text.toString();
                student.sureName = bodyController.text.toString();
                student.number = phoneNumber.text.toString();
                BlocProvider.of<UpdateMockCubit>(context).apiMockUpdate(student);
              },
              color: Colors.blue,
              child: const Text(
                "Update a Student",
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