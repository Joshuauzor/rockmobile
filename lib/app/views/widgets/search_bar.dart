import 'package:flutter/material.dart';
import 'package:rockapp/app/styles/colors.dart';
import 'package:rockapp/core/constant/constant.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    required TextEditingController searchController,
  })  : _searchController = searchController,
        super(key: key);

  final TextEditingController _searchController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.homeMenuBox,
            blurRadius: 8,
            spreadRadius: 0,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: TextFormField(
        controller: _searchController,
        keyboardType: TextInputType.text,
        decoration: const InputDecoration(
          hintText: 'Search...',
          hintStyle: TextStyle(
            fontFamily: AppFonts.poppins,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.searchColor,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: AppColors.primaryColor,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide.none,
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide.none,
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
