import 'package:flutter/material.dart';
import 'package:veneem/constants/colors.dart';
import 'package:veneem/constants/icons.dart';





class SearchBar extends StatelessWidget {

  final TextEditingController searchController;
  final String hintText;
  final Function(String)? onChanged;

  const SearchBar({
    Key? key,
    required this.searchController,
    required this.hintText,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      width: MediaQuery.of(context).size.width,
      child: TextField(
        style: const TextStyle(
          color: Colors.black,
          fontSize: 17,
        ),
        onChanged: onChanged,
        controller: searchController,
        decoration: InputDecoration(

          isDense: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),

          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey, width: 1.3),
              borderRadius: BorderRadius.circular(30.0)
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: mainColor, width: 1.3),
              borderRadius: BorderRadius.circular(30.0)
          ),

          prefixIcon: Container(
            margin: const EdgeInsets.all(5.0),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: mainColor,
            ),
            child: const Icon(searchIcon, color: Colors.white),
          ),
          hintText: hintText,
          fillColor: Colors.white70,
          filled: true,
        ),
        textInputAction: TextInputAction.search,
      ),
    );
  }
}
