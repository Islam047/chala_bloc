import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_bloc/blocks/update_post_state.dart';
import 'package:online_bloc/model/post_model.dart';

import '../services/network_service.dart';

class UpdateMockCubit extends Cubit<UpdateMockState>  {
  UpdateMockCubit() : super(UpdateMockInit());


  void apiMockUpdate(Student student) async{
    emit(UpdateMockLoading());
    final response = await Network.PUT(Network.API_UPDATE + student.id.toString(), Network.paramsUpdate(student));
     print(response);
    if (response != null) {
      emit(UpdateMockLoaded(isUpdated: true));

    } else {
      emit(UpdateMockError(error: "Couldn't update student"));
    }
  }
}