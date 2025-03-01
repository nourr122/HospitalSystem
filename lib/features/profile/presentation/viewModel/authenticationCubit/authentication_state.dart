part of 'authentication_cubit.dart';

abstract class AuthenticationState extends Equatable {
@override
List<Object?> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

class RegisterLoading extends AuthenticationState {}

class RegisterSuccess extends AuthenticationState {
final UserModel user;

RegisterSuccess(this.user);

@override
List<Object?> get props => [user];
}

class RegisterFailure extends AuthenticationState {
final String error;

RegisterFailure(this.error);

@override
List<Object?> get props => [error];
}
class ProfileLoading extends AuthenticationState {}

class ProfileSuccess extends AuthenticationState {
  final UserModel user;
  ProfileSuccess(this.user);

  @override
  List<Object?> get props => [user];
}

class ProfileFailure extends AuthenticationState {
  final String error;
  ProfileFailure(this.error);

  @override
  List<Object?> get props => [error];
}
