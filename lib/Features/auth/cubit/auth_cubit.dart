import 'package:autism_app/Core/constants/app_constants.dart';
import 'package:autism_app/Core/models/user_model.dart';
import 'package:autism_app/Core/remot/dio_helper.dart';
import 'package:autism_app/Features/auth/cubit/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  AuthResponseModel? authResponseModel;
  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    try {
      await DioHelper.postData(
          url: 'auth/login',
          data: {"email": email, "password": password}).then((response) {
        print(response?.data);
        if (response != null) {
          authResponseModel = AuthResponseModel.fromJson(response.data);
          token = authResponseModel?.token ?? "";
          emit(AuthAuthenticated());
        } else {
          emit(AuthError('Login failed'));
        }
      });
    } catch (e) {
      emit(AuthError('Login failed'));
    }
  }

  Future<void> sign(
      {String? username,
      String? password,
      String? email,
      String? confirmation}) async {
    emit(AuthLoading());
    try {
      await DioHelper.postData(url: 'auth/sign', data: {
        "username": username,
        "email": email,
        "password": password,
        "confirmPassword": confirmation
      }).then((response) {
        print(response?.data);
        if (response != null) {
          authResponseModel = AuthResponseModel.fromJson(response.data);
          token = authResponseModel?.token ?? "";
          emit(AuthAuthenticated());
        } else {
          emit(AuthError('Login failed'));
        }
      });
    } catch (e) {
      emit(AuthError('Login failed'));
    }
  }

  void logout() {
    emit(AuthUnauthenticated());
  }
}
