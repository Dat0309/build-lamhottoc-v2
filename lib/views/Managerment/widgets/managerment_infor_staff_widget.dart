import 'package:babershop_managerment/constant/colors.dart';
import 'package:babershop_managerment/controller/order_controller.dart';
import 'package:babershop_managerment/util/dimensions.dart';
import 'package:babershop_managerment/views/Managerment/widgets/managerment_card_widget.dart';
import 'package:babershop_managerment/widgets/big_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class ManagermentInfoStaffWidget extends StatelessWidget {
  const ManagermentInfoStaffWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: Dimensions.widthPadding25,
        bottom: Dimensions.widthPadding25,
      ),
      child: GetBuilder<OrderController>(builder: (orderController) {
        return orderController.isLoadedStaffStatistics
            ? Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      bottom: Dimensions.heightPadding10,
                      left: Dimensions.widthPadding25,
                      right: Dimensions.widthPadding25,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BigText(
                          text: 'Giám sát doanh thu',
                          size: Dimensions.font24,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: Dimensions.widthPadding25,
                        right: Dimensions.widthPadding25),
                    child: SizedBox(
                      width: Dimensions.screenWidth,
                      child: Wrap(
                        spacing: Dimensions.widthPadding20,
                        runSpacing: Dimensions.widthPadding20,
                        alignment: WrapAlignment.spaceBetween,
                        children: [
                          ManagermentCardWidget(
                              icon: 'assets/icons/revenue.png',
                              label: 'Tổng doanh thu',
                              amount:
                                  '${orderController.staffStatisticsModel!.revenue} đ'),
                          ManagermentCardWidget(
                              icon: 'assets/icons/refund.png',
                              label: 'Tiền chi ra',
                              amount:
                                  '${orderController.staffStatisticsModel!.extraCost} đ'),
                          ManagermentCardWidget(
                              icon: 'assets/icons/salary.png',
                              label: 'Lương thợ',
                              amount:
                                  '${orderController.staffStatisticsModel!.staffSalary} đ'),
                          ManagermentCardWidget(
                              icon: 'assets/icons/sales.png',
                              label: 'Số dư',
                              amount: orderController
                                      .staffStatisticsModel!.surplus
                                      .toString() +
                                  ' đ'),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            : Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      bottom: Dimensions.heightPadding10,
                      left: Dimensions.widthPadding25,
                      right: Dimensions.widthPadding25,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BigText(
                          text: 'Giám sát doanh thu',
                          size: Dimensions.font24,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: Dimensions.widthPadding25,
                        right: Dimensions.widthPadding25),
                    child: SizedBox(
                      width: Dimensions.screenWidth,
                      child: Wrap(
                        spacing: Dimensions.widthPadding20,
                        runSpacing: Dimensions.widthPadding20,
                        alignment: WrapAlignment.spaceBetween,
                        children: [
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              width: Dimensions.width150 + 40,
                              height: Dimensions.width150 + 40,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.radius15),
                                color: AppColors.signColor,
                              ),
                            ),
                          ),
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              width: Dimensions.width150 + 40,
                              height: Dimensions.width150 + 40,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.radius15),
                                color: AppColors.signColor,
                              ),
                            ),
                          ),
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              width: Dimensions.width150 + 40,
                              height: Dimensions.width150 + 40,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.radius15),
                                color: AppColors.signColor,
                              ),
                            ),
                          ),
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              width: Dimensions.width150 + 40,
                              height: Dimensions.width150 + 40,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.radius15),
                                color: AppColors.signColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
      }),
    );
  }
}
