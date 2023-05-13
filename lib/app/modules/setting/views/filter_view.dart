import 'package:flutter/material.dart';
import 'package:game_info/app/constant/appColors.dart';
import 'package:game_info/app/modules/home/views/detail_game_view.dart';
import 'package:game_info/app/modules/setting/controllers/setting_controller.dart';
import 'package:get/get.dart';

class FilterView extends GetView {
  const FilterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final SettingController settingController = Get.put(SettingController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.close,
          ),
        ),
        title: const Text('Personalisé votre recherche'),
        centerTitle: true,
        backgroundColor: AppColors.colorDarkGrey,
        elevation: 0,
      ),
      bottomSheet: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        height: 50,
        // width: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.colorDark),
        child: const Text(
          "Valider",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        // scrollDirection: Axis.horizontal,
        children: [
          ...settingController.filterList.map((e) {
            return const ExpansionTile(
              title: Row(
                children: [
                  Text(
                    "Genres",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                  // Icon(Icons.)
                ],
              ),
              children: [
                Wrap(
                  runAlignment: WrapAlignment.start,
                  spacing: 5,
                  runSpacing: 5,
                  children: [
                    ShapeGenre(title: "Action"),
                    ShapeGenre(title: "Aventure"),
                    ShapeGenre(title: "Jeux"),
                  ],
                )
              ],
            );
          }),
          // ExpansionTile(
          //   title: Row(
          //     children: const [
          //       Text(
          //         "Genres",
          //         style: TextStyle(
          //             fontSize: 20,
          //             fontWeight: FontWeight.w400,
          //             color: Colors.black),
          //       ),
          //       // Icon(Icons.)
          //     ],
          //   ),
          //   children: [
          //     Wrap(
          //       runAlignment: WrapAlignment.start,
          //       spacing: 5,
          //       runSpacing: 5,
          //       children: const [
          //         ShapeGenre(title: "Action"),
          //         ShapeGenre(title: "Aventure"),
          //         ShapeGenre(title: "Jeux"),
          //       ],
          //     )
          //   ],
          // ),
          // ExpansionTile(
          //   title: const Text(
          //     "Tags",
          //     style: TextStyle(
          //         fontSize: 20,
          //         fontWeight: FontWeight.w400,
          //         color: Colors.black),
          //   ),
          //   children: [
          //     Wrap(
          //       runAlignment: WrapAlignment.start,
          //       spacing: 5,
          //       runSpacing: 5,
          //       children: const [
          //         ShapeGenre(title: "Action"),
          //         ShapeGenre(title: "Aventure"),
          //         ShapeGenre(title: "Jeux"),
          //       ],
          //     )
          //   ],
          // )
        ],
      ),
    );
  }
}
