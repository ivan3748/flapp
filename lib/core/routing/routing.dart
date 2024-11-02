import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/routing/routes.dart';
import 'package:movie/features/auth/login/presentation/logic/cubit/login_user_cubit.dart';
import 'package:movie/features/auth/login/presentation/views/login_view.dart';
import 'package:movie/features/auth/signin/presentation/view/sigin_view.dart';
import 'package:movie/features/home/presentation/views/home_view.dart';

import '../../features/auth/signin/presentation/logic/cubit/create_user_cubit.dart';
import '../api_services/fire_base_helpers/firebase_helper.dart';

class Routing {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (context) => const HomeView());

      case Routes.login:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => LoginUserCubit(FirebaseHelper()),
                  child: const LoginView(),
                ));
      case Routes.signUp:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => CreateUserCubit(FirebaseHelper()),
                  child: const SiginView(),
                ));
      default:
        return MaterialPageRoute(builder: (context) => const NoRouteScreen());
    }
  }
}

class NoRouteScreen extends StatelessWidget {
  const NoRouteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('No route Screen'),
      ),
    );
  }
}
