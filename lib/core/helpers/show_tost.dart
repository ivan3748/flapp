import 'package:fluttertoast/fluttertoast.dart';

import '../utils/my_colors.dart';

showTost({required String msg}) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: MyColors.secondary,
      textColor: MyColors.primary,
      fontSize: 16.0);
}
