import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:online_bloc/model/post_model.dart';

import '../blocks/list_mock_state.dart';

Widget itemsOfPost(BuildContext context,Student student) {
  return Slidable(
    key: ValueKey(student),
    startActionPane: ActionPane(
      extentRatio: 0.5,
      motion: const ScrollMotion(),
      children: [
        SlidableAction(
          onPressed: (context) {
  BlocProvider.of<ListMockCubit>(context).callUpdatePage(context, student);
  },
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          icon: Icons.update,
        ),
      ],
    ),
    endActionPane: ActionPane(
      extentRatio: 0.5,
      motion: const ScrollMotion(),
      children: [
        SlidableAction(
          onPressed: (context) {
            BlocProvider.of<ListMockCubit>(context).apiMockDelete(student);
          },
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          icon: Icons.delete_outline,
        ),
      ],
    ),
    child: Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              student.name.toUpperCase(),
              style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black, fontWeight: FontWeight.w900),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              student.sureName,
              style: const TextStyle(color: Colors.black,fontSize: 15),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              student.number,
              style: const TextStyle(color: Colors.black,fontSize: 15),
            ),
          ],
        ),
      )
    ),
  );
}