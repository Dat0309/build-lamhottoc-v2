import 'package:babershop_managerment/constant/colors.dart';
import 'package:babershop_managerment/controller/order_controller.dart';
import 'package:babershop_managerment/util/dimensions.dart';
import 'package:babershop_managerment/views/Managerment/widgets/history_service_card.dart';
import 'package:babershop_managerment/views/hairStyle/widgets/hair_style_header.dart';
import 'package:babershop_managerment/widgets/big_text.dart';
import 'package:babershop_managerment/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryServiceWidget extends StatefulWidget {
  const HistoryServiceWidget({super.key});

  @override
  State<HistoryServiceWidget> createState() => _HistoryServiceWidgetState();
}

class _HistoryServiceWidgetState extends State<HistoryServiceWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(
            left: Dimensions.defaultPadding,
            right: Dimensions.defaultPadding,
            top: Dimensions.defaultPadding,
          ),
          child: GetBuilder<OrderController>(builder: (orderController) {
            return orderController.adminLoadedBaberOrder
                ? SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const HairStyleHeader(),
                        Container(
                          margin: EdgeInsets.only(
                              left: Dimensions.widthPadding25,
                              right: Dimensions.widthPadding25),
                          child: Expanded(
                            child: ListView.builder(
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                itemCount: orderController.orders1.length,
                                itemBuilder: (context, index) =>
                                    HistoryServiceCart(
                                        image: 'assets/images/LOGOV2.jpg',
                                        serviceName: orderController
                                            .orders1[index].servicesItems
                                            .map((e) => e['name'].toString())
                                            .join(", "),
                                        time:
                                            orderController
                                                .orders1[index].createdAt
                                                .toString()
                                                .split("T")[0],
                                        amout: orderController.orders1[index]
                                            .serviceTotalPrice,
                                        paymentMethod: orderController
                                            .orders1[index].paymentMethod)),
                          ),
                        ),
                      ],
                    ),
                  )
                : Container();
          }),
        ),
      ),
    );
  }
}
