import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:game_info/app/constant/AppColors.dart';
import 'package:game_info/app/models/gameModel.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:game_info/app/modules/home/controllers/home_controller.dart';
import 'package:game_info/app/modules/home/views/detail_image_game_view.dart';
import 'package:intl/intl.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

class DetailGameView extends GetView<HomeController> {
  const DetailGameView(this.data, this.id, {Key? key}) : super(key: key);
  final ResultGame data;
  final int id;
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    controller.convertImageString(data.shortScreenshots!);
    return Scaffold(
      backgroundColor: AppColors.colorDark,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: "game$id",
              child: Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(DetailImageGameView(
                        id: id,
                        title: data.name!,
                        urls: [data.backgroundImage!],
                      ));
                    },
                    child: Container(
                      height: 300,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: CachedNetworkImageProvider(data
                                        .backgroundImage
                                        .toString() !=
                                    "null"
                                ? data.backgroundImage!
                                : "https://cdn5.vectorstock.com/i/1000x1000/73/49/404-error-page-not-found-miss-paper-with-white-vector-20577349.jpg"
                                    .toString()),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 50,
                    left: 10,
                    child: GestureDetector(
                      onTap: () => Get.back(),
                      child: Container(
                        height: 40,
                        width: 40,
                        // padding: const EdgeInsets.all(10),
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            color: AppColors.colorDarkGrey,
                            shape: BoxShape.circle),
                        child: const Icon(
                          Icons.arrow_back_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Wrap(
            //   children: [
            //     ...data.platforms!
            //         .map(
            //           (e) => Container(
            //             margin: EdgeInsets.all(5),
            //             height: 50,
            //             width: 50,
            //             decoration: BoxDecoration(
            //               shape: BoxShape.circle,
            //               image: DecorationImage(
            //                 image: CachedNetworkImageProvider(
            //                     e.platform!.imageBackground!),fit: BoxFit.cover
            //               ),
            //             ),
            //           ),
            //         )
            //         .toList()
            //   ],
            // )
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.name!,
                    style: const TextStyle(
                        fontFamily: "InriaSans",
                        color: Colors.white,
                        fontSize: 20),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  RatingBar.builder(
                    initialRating: data.rating!,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    unratedColor: const Color.fromARGB(255, 197, 196, 196),
                    itemSize: 25,
                    // itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 10,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    "Capture d'écran",
                    style: TextStyle(
                        fontFamily: "InriaSans",
                        color: Colors.white,
                        fontSize: 20),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(DetailImageGameView(
                        id: id,
                        title: data.name!,
                        urls: controller.imagesString,
                      ));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(data
                                  .shortScreenshots!.isNotEmpty
                              ? data.shortScreenshots![1].image.toString()
                              : "https://cdn5.vectorstock.com/i/1000x1000/73/49/404-error-page-not-found-miss-paper-with-white-vector-20577349.jpg"
                                  .toString()),
                          colorFilter: ColorFilter.mode(
                              Colors.grey[500]!, BlendMode.modulate),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Text(
                        "+${data.shortScreenshots!.length - 1}",
                        style: const TextStyle(
                          fontFamily: "InriaSans",
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  // Wrap(
                  //   children: [
                  //     ...data.shortScreenshots!
                  //         .map((e) => Container(
                  //               height: 100,
                  //               width: 100,
                  //               decoration: BoxDecoration(
                  //                   image: DecorationImage(
                  //                       image: CachedNetworkImageProvider(
                  //                           e.image!),
                  //                       fit: BoxFit.cover)),
                  //             ))
                  //         .toList()
                  //   ],
                  // ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    "Date de sortie :",
                    style: TextStyle(
                      fontFamily: "InriaSans",
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    DateFormat('dd-MM-yyyy').format(data.released!),
                    style: const TextStyle(
                      fontFamily: "InriaSans",
                      color: Color.fromARGB(255, 164, 162, 162),
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    "Dernière mise à jour :",
                    style: TextStyle(
                        fontFamily: "InriaSans",
                        color: Colors.white,
                        fontSize: 20),
                  ),
                  Text(
                    DateFormat('dd-MM-yyyy').format(data.updated!),
                    style: const TextStyle(
                      fontFamily: "InriaSans",
                      color: Color.fromARGB(255, 164, 162, 162),
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    "Note",
                    style: TextStyle(
                        fontFamily: "InriaSans",
                        color: Colors.white,
                        fontSize: 20),
                  ),

                  Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    children: [
                      ...data.ratings!
                          .map(
                            (e) => NoteProgress(
                              pourcent: e.percent!,
                              name: e.title!,
                            ),
                          )
                          .toList()
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    "Genre",
                    style: TextStyle(
                      fontFamily: "InriaSans",
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Wrap(
                    spacing: 10,
                    runSpacing: 7,
                    children: [
                      ...data.genres!
                          .map(
                            (e) => ShapeGenre(title: e.name!),
                          )
                          .toList()
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    "Platforme",
                    style: TextStyle(
                      fontFamily: "InriaSans",
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Wrap(
                    spacing: 7,
                    children: [
                      ...data.parentPlatforms!.map(
                        (e) => controller.icons[e.platform.slug] == null
                            ? Container()
                            : SvgPicture.asset(
                                controller.icons[e.platform.slug].toString(),
                                height: 20,
                              ),
                      )
                      // SvgPicture.asset(
                      //   "assets/icons/xbox.svg",
                      //   height: 20,
                      // ),
                      // SvgPicture.asset(
                      //   "assets/icons/windows.svg",
                      //   height: 20,
                      // ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    "Magasins",
                    style: TextStyle(
                      fontFamily: "InriaSans",
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      ...data.stores!.map(
                        (e) => Container(
                          alignment: Alignment.center,
                          height: 100,
                          width: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            image: DecorationImage(
                              colorFilter: ColorFilter.mode(
                                  Colors.grey[700]!, BlendMode.modulate),
                              image: CachedNetworkImageProvider(data
                                      .backgroundImage
                                      .toString()
                                      .isNotEmpty
                                  ? data.backgroundImage.toString()
                                  : "https://cdn5.vectorstock.com/i/1000x1000/73/49/404-error-page-not-found-miss-paper-with-white-vector-20577349.jpg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Text(
                            e.store!.name!,
                            style: const TextStyle(
                              fontFamily: "InriaSans",
                              color: Colors.white,
                              // fontSize: 20,
                            ),
                          ),
                        ),
                      )
                      // SvgPicture.asset(
                      //   "assets/icons/xbox.svg",
                      //   height: 20,
                      // ),
                      // SvgPicture.asset(
                      //   "assets/icons/windows.svg",
                      //   height: 20,
                      // ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ShapeGenre extends StatelessWidget {
  const ShapeGenre({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: AppColors.primary, borderRadius: BorderRadius.circular(20)),
      child: Text(
        title,
        style: const TextStyle(
          fontFamily: "InriaSans",
          color: Colors.black,
          fontSize: 20,
        ),
      ),
    );
  }
}

class NoteProgress extends StatelessWidget {
  const NoteProgress({
    super.key,
    required this.name,
    required this.pourcent,
  });
  final String name;
  final double pourcent;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(
                fontFamily: "InriaSans",
                color: Color.fromARGB(255, 164, 162, 162),
                fontSize: 20),
          ),
          const SizedBox(
            height: 5,
          ),
          LinearProgressIndicator(
            value: pourcent / 100,
            color: AppColors.primary,
            backgroundColor: AppColors.colorDarkGrey,
          )
        ],
      ),
    );
  }
}
