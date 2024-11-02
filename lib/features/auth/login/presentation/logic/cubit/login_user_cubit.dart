import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/api_services/fire_base_helpers/firebase_helper.dart';

part 'login_user_state.dart';

class LoginUserCubit extends Cubit<LoginUserState> {
  LoginUserCubit(this.firebaseHelper) : super(LoginUserInitial());
  final FirebaseHelper firebaseHelper;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  login() async {
    emit(LoginUserLoading());
    try {
      await firebaseHelper
          .loginUser(
        emailController.text.trim(),
        passwordController.text.trim(),
      )
          .then((value) {
        emit(LoginUserSuccess());
      });
    } catch (e) {
      emit(LoginUserError());
    }
  }
}
