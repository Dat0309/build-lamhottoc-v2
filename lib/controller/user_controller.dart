// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';

import 'package:babershop_managerment/controller/order_controller.dart';
import 'package:babershop_managerment/models/ProfileModel.dart';
import 'package:babershop_managerment/services/preferences/user_preference.dart';
import 'package:babershop_managerment/services/reposiitory/user_repo.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final UserRepo userRepo;

  UserController({required this.userRepo});

  bool isLoadedProfile = false;
  bool isUpdateSalary = false;
  int tempSalary = 0;
  bool isUpdateSalaryHistory = false;

  late Profile? profile;

  Future<void> getTempSalary() async {
    await UserPreference().getTempSalary().then((value) {
      if (value != null) {
        tempSalary = value;
        update();
      }
    });
  }

  Future<void> getProfile() async {
    await userRepo.getProfile().then((value) {
      if (value.statusCode == 200) {
        Get.find<OrderController>().adminGetAllSalary();
        final Map<String, dynamic> res = json.decode(value.body);

        if (res.isNotEmpty) {
          profile = Profile.fromMap(res);

          isLoadedProfile = true;
          update();
        }
      } else {}
    });
  }

  Future<void> clearSalary() async {
    await UserPreference().setTempSalary(0);
  }

  Future<void> updateSalary(int salary) async {
    int tempSalary = await UserPreference().getTempSalary();
    await UserPreference().setTempSalary(tempSalary + salary);
  }

  Future<Map<String, dynamic>> updateSalaryHistory() async {
    var result;
    isUpdateSalaryHistory = false;
    await userRepo.updateSalaryHistory().then((value) {
      if ([200, 201].contains(value.statusCode)) {
        final Map<String, dynamic> res = json.decode(value.body);
        profile = Profile.fromMap(res);

        isUpdateSalaryHistory = true;
        result = {
          'status': true,
          'message': 'Successfull',
          'order': profile,
        };
        update();
      } else {
        result = {
          'status': false,
          'code': value.statusCode,
          'message': value.body,
        };
        update();
      }
    });
    return result;
  }
}
