// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:babershop_managerment/constant/colors.dart';
import 'package:babershop_managerment/util/dimensions.dart';
import 'package:flutter/cupertino.dart';

class NoDataPage extends StatelessWidget {
  final String text;
  final String image;

  const NoDataPage({
    Key? key,
    required this.text,
    this.image = "assets/images/error.png",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          image,
          height: Dimensions.screenHeight * 0.22,
          width: Dimensions.screenWidth * 0.22,
        ),
        SizedBox(
          height: Dimensions.screenHeight * 0.03,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: Dimensions.screenHeight * 0.0175,
            color: AppColors.pargColor,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
