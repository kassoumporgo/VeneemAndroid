import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:veneem/constants/colors.dart';
import '/ui/screens/category.dart';



class HomeCard extends StatelessWidget {

  final List data;
  final IconData icon;
  final String name;

  const HomeCard({
    Key? key,
    required this.data,
    required this.icon,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10.0)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            children: [
              Icon(icon, size: 40, color: mainColor),
              10.width,
              Text(
                name,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: mainColor,
                ),
              )
            ],
          ),

          7.height,

          Text(
            data.length.toString()+" actes disponibles.",
            style: const TextStyle(
              fontSize: 17,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),

        ],
      ),
    ).onTap(
      () => Get.to(
        ()=> CategoryScreen(
          data: data, name: name, icon: icon,
        )
      ),
      borderRadius: BorderRadius.circular(10.0),
    );
  }
}
