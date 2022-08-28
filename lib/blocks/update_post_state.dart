
import 'package:equatable/equatable.dart';

abstract class UpdateMockState extends Equatable {
  @override
  List<Object> get props => [];
}

class UpdateMockInit extends UpdateMockState {}

class UpdateMockLoading extends UpdateMockState {}

class UpdateMockLoaded extends UpdateMockState {
  final bool? isUpdated;

  UpdateMockLoaded({this.isUpdated});
}

class UpdateMockError extends UpdateMockState {
  final String error;
  UpdateMockError({required this.error});
}