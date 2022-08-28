import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_bloc/model/post_model.dart';

import '../pages/create_page.dart';
import '../pages/update_page.dart';
import '../services/network_service.dart';
import 'list_post_state.dart';

class ListMockCubit extends Cubit<ListMockState> {
  ListMockCubit() : super(ListMockInit());

  void apiMockList() async {
    emit(ListMockLoading());
    final response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
    if (response != null) {
      emit(ListMockLoaded(student: Network.parseMockList(response)));
    } else {
      emit(ListMockError(error: "Couldn't fetch posts"));
    }
  }

  void apiMockDelete(Student student) async {
    emit(ListMockLoading());
    final response = await Network.DEL(
        Network.API_DELETE + student.id.toString(), Network.paramsEmpty());
    if (response != null) {
      apiMockList();
    } else {
      emit(ListMockError(error: "Couldn't delete post"));
    }
  }

  void callCreatePage(BuildContext context) async {
    var results = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const CreatePage()));
    if (results != null) {
      apiMockList();
    }
  }

  void callUpdatePage(BuildContext context, Student student) async {
    var results = await Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => UpdatePage(student: student)));
    if (results != null) {
        apiMockList();
     }
  }
}