import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_bloc/model/post_model.dart';

import '../services/network_service.dart';
import 'create_mock_cubit.dart';

class CreateMockCubit extends Cubit<CreateMockState> {
  CreateMockCubit() : super(CreateMockInit());

  void apiPostCreate(Student student) async {
    print(student.toJson());
    emit(CreateMockLoading());
    final response =
        await Network.POST(Network.API_CREATE, Network.paramsCreate(student));
    print(response);
    if (response != null) {
      emit(CreateMockLoaded(isCreated: true));
    } else {
      emit(CreateMockError(error: "Couldn't create post"));
    }
  }
}
