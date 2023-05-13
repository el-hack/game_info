import 'package:flutter/material.dart';
import 'package:game_info/app/constant/appColors.dart';
import 'package:game_info/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

class OngletSelected extends StatelessWidget {
  const OngletSelected({
    super.key,
    required this.label,
    this.isSelected = false,
    this.callback,
  });
  final String label;
  final bool? isSelected;
  final Function()? callback;

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    return GestureDetector(
      onTap: () {
        homeController.setOngletSelected(label);
        callback;
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontFamily: "InriaSans",
                  fontSize: 17,
                  color: homeController.ongletSelected.contains(label)
                      ? AppColors.primary
                      : Colors.white,
                ),
              ),
              homeController.ongletSelected.contains(label)
                  ? Container(
                      margin: const EdgeInsets.only(top: 3),
                      width: 50,
                      height: 2,
                      decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(100)),
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}
