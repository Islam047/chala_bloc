import 'package:flutter/material.dart';
import 'package:online_bloc/views/view_of_post.dart';

import '../model/post_model.dart';

Widget viewOfHome(List<Student> items, bool isLoading) {
  return Stack(
    children: [
      ListView.builder(
        itemCount: items.length,
        itemBuilder: (ctx, index) {
          return itemsOfPost(ctx, items[index]);
        },
      ),
      isLoading
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : const SizedBox.shrink(),
    ],
  );
}