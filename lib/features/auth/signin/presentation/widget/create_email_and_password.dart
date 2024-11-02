import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:movie/features/auth/signin/presentation/logic/cubit/create_user_cubit.dart';
import 'package:movie/features/auth/signin/presentation/widget/already_have_an_account.dart';

import '../../../../../core/helpers/show_tost.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/utils/custom_text_style.dart';
import '../../../../../core/utils/my_colors.dart';
import '../../../../../core/widgets/my_button.dart';
import '../../../../../core/widgets/my_text_form_field.dart';

class CreateEmailAndPassword extends StatefulWidget {
  const CreateEmailAndPassword({super.key});

  @override
  State<CreateEmailAndPassword> createState() => _CreateEmailAndPasswordState();
}

class _CreateEmailAndPasswordState extends State<CreateEmailAndPassword> {
  bool isObscure = true;
  bool isObscure1 = true;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateUserCubit, CreateUserState>(
      listener: (context, state) {
        if (state is CreateUserSuccess) {
          showTost(msg: 'تم تسجيل الحساب بنجاح');
          Navigator.pushReplacementNamed(context, Routes.home);
        } else if (state is CreateUserError) {
          showTost(msg: 'خطأ في تسجيل الحساب');
        }
      },
      builder: (context, state) {
        return Form(
          key: context.read<CreateUserCubit>().formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(50),
                Text(
                  'Register Now !',
                  style: CustomTextStyles.font28SemiBoldWith,
                ),
                verticalSpace(35),
                Text('Name', style: CustomTextStyles.font18SemiBoldWith),
                verticalSpace(10),
                MyTextFormField(
                  hintText: 'Enter Name',
                  isObscure: false,
                  controller: context.read<CreateUserCubit>().nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Email';
                    }
                    return null;
                  },
                ),
                verticalSpace(20),
                Text('Email', style: CustomTextStyles.font18SemiBoldWith),
                verticalSpace(10),
                MyTextFormField(
                  hintText: 'Enter Email',
                  isObscure: false,
                  controller: context.read<CreateUserCubit>().emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Email';
                    }
                    return null;
                  },
                ),
                verticalSpace(20),
                Text(
                  'Password',
                  style: CustomTextStyles.font18SemiBoldWith,
                ),
                verticalSpace(10),
                MyTextFormField(
                  hintText: 'Enter Password',
                  isObscure: isObscure,
                  controller:
                      context.read<CreateUserCubit>().passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Password';
                    }
                    return null;
                  },
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    },
                    icon: isObscure
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                  ),
                ),
                verticalSpace(20),
                Text(
                  'Re-Password',
                  style: CustomTextStyles.font18SemiBoldWith,
                ),
                verticalSpace(10),
                MyTextFormField(
                  hintText: 'Enter Re-Password',
                  isObscure: isObscure1,
                  controller:
                      context.read<CreateUserCubit>().repasswordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Re-Password';
                    } else if (context
                            .read<CreateUserCubit>()
                            .repasswordController
                            .text
                            .trim() !=
                        context
                            .read<CreateUserCubit>()
                            .passwordController
                            .text
                            .trim()) {
                      return 'Password does not match';
                    }
                    return null;
                  },
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isObscure1 = !isObscure1;
                      });
                    },
                    icon: isObscure1
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                  ),
                ),
                verticalSpace(35),
                state is CreateUserLoading
                    ? Center(
                        child: LoadingAnimationWidget.flickr(
                          leftDotColor: MyColors.secondary,
                          rightDotColor: MyColors.bg,
                          size: 50,
                        ),
                      )
                    : MyButton(
                        onTap: () {
                          if (context
                              .read<CreateUserCubit>()
                              .formKey
                              .currentState!
                              .validate()) {
                            context.read<CreateUserCubit>().createUser();
                          }
                        },
                        text: 'Register',
                        color: MyColors.bg,
                      ),
                verticalSpace(20),
                const AlreadyHaveAnAccount(),
              ],
            ),
          ),
        );
      },
    );
  }
}
