import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_bloc/model/post_model.dart';
import '../blocks/list_mock_state.dart';
import '../blocks/list_post_state.dart';
import '../views/view_of_home.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Student> items = [];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ListMockCubit>(context).apiMockList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Pattern - BloC"),
        ),
        body: BlocBuilder<ListMockCubit, ListMockState>(
          builder: (BuildContext context, ListMockState state){
            if(state is ListMockError){
              return viewOfHome(items, true);
            }
            if(state is ListMockLoaded){
              items = state.student!;
              return viewOfHome(items, false);
            }
            return viewOfHome(items, true);
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          onPressed: () {
            BlocProvider.of<ListMockCubit>(context).callCreatePage(context);
          },
          child: Icon(Icons.add),
        ));
  }
}