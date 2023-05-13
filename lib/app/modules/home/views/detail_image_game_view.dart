import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:game_info/app/constant/AppColors.dart';

import 'package:get/get.dart';

class DetailImageGameView extends GetView {
  final List? urls;
  final int id;
  final String title;
  const DetailImageGameView({
    super.key,
    required this.id,
    required this.title,
    this.urls,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorDark,
      body: Stack(
        children: [
          PageView(
            scrollDirection: Axis.horizontal,
            children: [
             ...urls!.map((e) => Hero(
                tag: "game$id",
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: CachedNetworkImageProvider(e)),
                  ),
                ),
              )),
            ],
          ),
          Positioned(
            top: 50,
            left: 20,
            child: GestureDetector(
              onTap: () => Get.back(),
              child: Container(
                height: 40,
                width: 40,
                // padding: const EdgeInsets.all(10),
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    color: AppColors.colorDarkGrey, shape: BoxShape.circle),
                child: const Icon(
                  Icons.arrow_back_outlined,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          // Positioned(
          //   left: 50,
          //   bottom: 100,
          //   child: Container(
          //     // width: 200,
          //     padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          //     decoration: BoxDecoration(
          //         color: AppColors.primary,
          //         borderRadius: BorderRadius.circular(20)),
          //     child: Text(
          //       title,
          //       style: const TextStyle(
          //         fontFamily: "InriaSans",
          //         color: Colors.black,
          //         overflow: TextOverflow.fade,
          //         fontSize: 20,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
