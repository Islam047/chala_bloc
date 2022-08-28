import 'package:equatable/equatable.dart';
import 'package:online_bloc/model/post_model.dart';

abstract class ListMockState extends Equatable {
  @override
  List<Object> get props => [];
}

class ListMockInit extends ListMockState {}

class ListMockLoading extends ListMockState {}

class ListMockLoaded extends ListMockState {
  final List<Student>? student;
  final bool? isDeleted;

  ListMockLoaded({this.student,this.isDeleted});
}

class ListMockError extends ListMockState {
  final error;

  ListMockError({this.error});
}