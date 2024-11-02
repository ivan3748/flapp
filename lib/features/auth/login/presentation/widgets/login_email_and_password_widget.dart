import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/features/auth/login/presentation/logic/cubit/login_user_cubit.dart';

import '../../../../../core/helpers/show_tost.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/utils/custom_text_style.dart';
import '../../../../../core/utils/my_colors.dart';
import '../../../../../core/widgets/my_button.dart';
import '../../../../../core/widgets/my_text_form_field.dart';
import 'forget_password.dart';
import 'my_not_amember.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({
    super.key,
  });

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginUserCubit, LoginUserState>(
      listener: (context, state) {
        if (state is LoginUserSuccess) {
          showTost(msg: 'تم تسجيل الدخول بنجاح');
          Navigator.pushReplacementNamed(context, Routes.home);
        } else if (state is LoginUserError) {
          showTost(msg: 'خطأ في تسجيل الدخول');
        }
      },
      builder: (context, state) {
        return Form(
          key: context.read<LoginUserCubit>().formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(160),
                Text(
                  'Welcome Back !',
                  style: CustomTextStyles.font28SemiBoldWith,
                ),
                verticalSpace(35),
                Text('Email', style: CustomTextStyles.font18SemiBoldWith),
                verticalSpace(10),
                MyTextFormField(
                  hintText: 'Enter Email',
                  controller: context.read<LoginUserCubit>().emailController,
                  isObscure: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Email';
                    }
                    return null;
                  },
                ),
                verticalSpace(20),
                Text('Password', style: CustomTextStyles.font18SemiBoldWith),
                verticalSpace(10),
                MyTextFormField(
                  hintText: 'Enter Password',
                  controller: context.read<LoginUserCubit>().passwordController,
                  isObscure: isObscure,
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
                verticalSpace(10),
                const ForgetPassword(),
                verticalSpace(30),
                state is LoginUserLoading
                    ? const Center(
                        child: CircularProgressIndicator(
                        color: MyColors.secondary,
                      ))
                    : MyButton(
                        onTap: () {
                          if (context
                              .read<LoginUserCubit>()
                              .formKey
                              .currentState!
                              .validate()) {
                            context.read<LoginUserCubit>().login();
                          }
                        },
                        text: 'Login',
                        color: MyColors.bg,
                      ),
                verticalSpace(20),
                const MyNotAMember(),
              ],
            ),
          ),
        );
      },
    );
  }
}
