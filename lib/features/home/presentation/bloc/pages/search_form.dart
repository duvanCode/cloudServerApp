import 'package:flutter/material.dart';
import 'package:cloudserver/core/widgets/inputs/custom_text_field.dart';
import 'package:cloudserver/shared/constants/app_colors.dart';
import 'package:cloudserver/shared/constants/app_dimensions.dart';
import 'package:cloudserver/shared/utils/string_custom_methods.dart';

class SearchFrom extends StatefulWidget {
  final String userName;
  const SearchFrom({super.key,required this.userName});
  
  @override
  State<SearchFrom> createState() => _SearchFromState();
}

class _SearchFromState extends State<SearchFrom> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext contenxt) {
    return Form(
      child: Container(
        padding: const EdgeInsets.all(AppDimensions.paddingSmall),
        color: AppColors.inputBackground,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: CustomTextField(
                controller: _searchController,
                hintText: 'Search Clound',
                prefixIcon: Icon(Icons.search),
                prefixIconColor: AppColors.white,
                widthBorder: 1,
                contentPadding: EdgeInsets.symmetric(
                  vertical: AppDimensions.paddingSmall,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppDimensions.paddingSmall),
              child: Text('0GB', style: TextStyle(color: AppColors.primaryBlue)),
            ),
            TextButton(
              onPressed: () {},
              style: ButtonStyle(
                overlayColor: WidgetStateProperty.all(AppColors.overlayColor),
              ),
              child: Container(
                padding: const EdgeInsets.all(1.0),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(
                    AppDimensions.borderRadiusLarge,
                  ),
                ),
                child: CircleAvatar(
                  backgroundColor: AppColors.blueGrey,
                  child: Text(
                    StringCustomMethods.getSiglasName(widget.userName),
                    style: TextStyle(color: AppColors.primaryBlue),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
