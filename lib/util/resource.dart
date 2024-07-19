import 'package:equatable/equatable.dart';

sealed class Resource<T> extends Equatable {
  const Resource();

  const factory Resource.idle() = Idle;
  const factory Resource.loading() = Loading;
  const factory Resource.success(T data) = Success;
  const factory Resource.failure(String message) = Failure;

  @override
  List<Object?> get props => [];
}

class Idle<T> extends Resource<T> {
  const Idle();
}

class Loading<T> extends Resource<T> {
  const Loading();
}

class Success<T> extends Resource<T> {
  final T data;

  const Success(this.data);

  @override
  List<Object?> get props => [data];
}

class Failure<T> extends Resource<T> {
  final String message;

  const Failure(this.message);

  @override
  List<Object?> get props => [message];
}
