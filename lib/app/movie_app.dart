import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/core/utils/my_colors.dart';

import '../core/routing/routes.dart';
import '../core/routing/routing.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({super.key, required this.routing});

  final Routing routing;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Stream Everywhere',
        theme: ThemeData(
          scaffoldBackgroundColor: MyColors.primary,
          useMaterial3: true,
        ),
        initialRoute: Routes.login,
        onGenerateRoute: routing.generateRoute,
      ),
    );
  }
}
