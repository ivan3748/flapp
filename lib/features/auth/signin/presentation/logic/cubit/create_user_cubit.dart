import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/api_services/fire_base_helpers/firebase_helper.dart';

part 'create_user_state.dart';

class CreateUserCubit extends Cubit<CreateUserState> {
  CreateUserCubit(this.firebaseHelper) : super(CreateUserInitial());
  final FirebaseHelper firebaseHelper;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  createUser() async {
    emit(CreateUserLoading());
    try {
      await FirebaseFirestore.instance.collection("users").doc().set({
        "name": nameController.text.trim(),
        "email": emailController.text.trim(),
        "password": passwordController.text.trim(),
        "repassword": repasswordController.text.trim(),
        "image": "",
      }).then((value) {
        emit(CreateUserSuccess());
      });
    } catch (e) {
      emit(CreateUserError());
    }
  }
}
