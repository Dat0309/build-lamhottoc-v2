import 'package:babershop_managerment/constant/colors.dart';
import 'package:babershop_managerment/controller/order_controller.dart';
import 'package:babershop_managerment/util/dimensions.dart';
import 'package:babershop_managerment/views/Managerment/widgets/history_service_2_widget.dart';
import 'package:babershop_managerment/views/Managerment/widgets/history_service_widget.dart';
import 'package:babershop_managerment/widgets/big_text.dart';
import 'package:babershop_managerment/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BabershopOrderStatisticWidet extends StatefulWidget {
  const BabershopOrderStatisticWidet({super.key});

  @override
  State<BabershopOrderStatisticWidet> createState() =>
      _BabershopOrderStatisticWidetState();
}

class _BabershopOrderStatisticWidetState
    extends State<BabershopOrderStatisticWidet> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<OrderController>().adminGetAllOrderOfBabershop();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            Get.to(() => const HistoryServiceWidget());
          },
          child: Container(
            padding: EdgeInsets.all(Dimensions.widthPadding15),
            margin: EdgeInsets.only(
                left: Dimensions.widthPadding25,
                right: Dimensions.widthPadding25,
                bottom: Dimensions.widthPadding25),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(Dimensions.radius15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(
                      text: 'Thống kê hoá đơn tiệm 1',
                      size: Dimensions.font24,
                    ),
                    const SmallText(
                      text: 'Xem tất cả hoá đơn của tiệm 1',
                      color: AppColors.secondaryColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Get.to(() => const HistoryService2Widget());
          },
          child: Container(
            padding: EdgeInsets.all(Dimensions.widthPadding15),
            margin: EdgeInsets.only(
                left: Dimensions.widthPadding25,
                right: Dimensions.widthPadding25,
                bottom: Dimensions.widthPadding25),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(Dimensions.radius15),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(
                      text: 'Thống kê hoá đơn tiệm 2',
                      size: Dimensions.font24,
                    ),
                    const SmallText(
                      text: 'Xem tất cả hoá đơn của tiệm 2',
                      color: AppColors.secondaryColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
