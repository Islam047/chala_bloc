
import 'package:equatable/equatable.dart';

abstract class CreateMockState extends Equatable {
  @override
  List<Object> get props => [];
}

class CreateMockInit extends CreateMockState {}

class CreateMockLoading extends CreateMockState {}

class CreateMockLoaded extends CreateMockState {
  final bool? isCreated;

  CreateMockLoaded({this.isCreated});
}

class CreateMockError extends CreateMockState {
  final String error;
  CreateMockError({required this.error});
}