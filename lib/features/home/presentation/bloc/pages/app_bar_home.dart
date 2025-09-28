import 'package:cloudserver/shared/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppBarHome extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(context) {
    return AppBar(toolbarHeight: 0, backgroundColor: AppColors.inputBackground);
  }
}
