import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_bloc/pages/home_page.dart';

import 'blocks/list_mock_state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pattern - BloC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),


      home: MultiBlocProvider(providers: [
        BlocProvider(create: (context) => ListMockCubit()),
        BlocProvider(create: (context) => ListMockCubit()),
      ], child: HomePage()),
    );
  }
}