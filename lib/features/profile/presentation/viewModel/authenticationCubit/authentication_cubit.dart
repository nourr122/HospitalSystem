import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/model/user_model.dart';
import '../../../data/repository/registerRepo.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final AuthenticationRepository authRepository;

  AuthenticationCubit(this.authRepository) : super(AuthenticationInitial());

  Future<void> register({
    required String firstName,
    required String lastName,
    required String mobile,
    required String email,
    required String gender,
    required String status,
    required String specialist,
    required UserType type,
    required String birthday,
    required String address,
    required String password,
  }) async {
    emit(RegisterLoading());

    try {
      final user = await authRepository.register(
        firstName: firstName,
        lastName: lastName,
        mobile: mobile,
        email: email,
        gender: gender,
        status: status,
        specialist: specialist,
        type: type,
        birthday: birthday,
        address: address,
        password: password,
      );

      emit(RegisterSuccess(user));
    } catch (e) {
      emit(RegisterFailure(e.toString()));
    }
  }
  Future<void> fetchUserProfile(int id) async {
    emit(ProfileLoading());
    try {
      UserModel user = await authRepository.getProfile(id: id);
      emit(ProfileSuccess(user));
    } catch (e) {
      emit(ProfileFailure(e.toString()));
    }
  }
}