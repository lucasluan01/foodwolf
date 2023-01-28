import 'package:flutter/material.dart';
import 'package:foodwolf/config/theme/app_colors.dart';
import 'package:foodwolf/enum/notification_enum.dart';

class SnackBarCustom {

  void showSnackbar({required BuildContext context, required String message, required InformationEnum typeNotification}) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: typeNotification == InformationEnum.success ? AppColors.success : Theme.of(context).colorScheme.error,
        content: Text(message),
        action: SnackBarAction(
          label: 'Fechar',
          textColor: Colors.white,
          onPressed: () {
            ScaffoldMessenger.of(context).removeCurrentSnackBar();
          },
        ),
      ));
    });
  }
}
