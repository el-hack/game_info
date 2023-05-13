import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:game_info/app/constant/appColors.dart';
import 'package:game_info/app/modules/home/views/detail_game_view.dart';
import 'package:game_info/widgets/CardGamePath.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../setting/controllers/setting_controller.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final SettingController settingController = Get.put(SettingController());

    final GlobalKey<ScaffoldState> _key = GlobalKey();
    Get.put(HomeController());
    GlobalKey wrapKey = GlobalKey();
    final wrapWidget = wrapKey.currentWidget;
    return Scaffold(
      key: _key,
      backgroundColor: AppColors.colorDark,
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        backgroundColor: AppColors.colorDark,
        centerTitle: true,
      ),
      endDrawer: Drawer(
        child: Column(
          children: [
            Expanded(
              child: ListView(
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
                  const ExpansionTile(
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
                  ),
                  const ExpansionTile(
                    title: Text(
                      "Tags",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
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
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () {
                _key.currentState!.closeEndDrawer();
              },
              child: Container(
                alignment: Alignment.center,
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 50,
        width: 50,
        decoration: const BoxDecoration(
            color: AppColors.primary, shape: BoxShape.circle),
        child: const Icon(Icons.abc),
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xff2A2828),
        notchMargin: 4,
        shape: const CircularNotchedRectangle(),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          unselectedItemColor: Colors.white,
          unselectedLabelStyle: const TextStyle(fontFamily: "InriaSans"),
          selectedLabelStyle: const TextStyle(fontFamily: "InriaSans"),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Recherche',
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 70),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: const Color(0xff2A2828),
                        borderRadius: BorderRadius.circular(7)),
                    child: TextField(
                      controller: controller.query,
                      onChanged: (value) async {
                        await controller.fetchGame(value);
                      },
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: "InriaSans",
                      ),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Recherche",
                        hintStyle: TextStyle(
                            color: Colors.white, fontFamily: "InriaSans"),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    //open drawer
                    _key.currentState!.openEndDrawer();

                    // Get.to(const FilterView());
                    // Scaffold.of(context).openDrawer();
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: const Color(0xff2A2828),
                        borderRadius: BorderRadius.circular(7)),
                    child: const Icon(
                      Icons.filter_1_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),

            /// Creating a horizontal list of OngletSelected.

            // Container(
            //   height: 50,
            //   alignment: Alignment.centerLeft,
            //   child: ListView.builder(
            //     shrinkWrap: true,
            //     physics: const BouncingScrollPhysics(),
            //     scrollDirection: Axis.horizontal,
            //     itemCount: controller.ongletSelectedList.length,
            //     itemBuilder: (context, index) {
            //       return controller.ongletSelectedList[index];
            //     },
            //   ),
            // ),
            //FIN

            // Align(
            //   alignment: Alignment.centerLeft,
            //   child: Text(
            //     "Jeux",
            //     style: const TextStyle(
            //       fontFamily: "InriaSans",
            //       fontSize: 30,
            //       color: Colors.white,
            //     ),
            //   ),
            // ),
            Expanded(
              child: Obx(
                () => controller.load.value
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primary,
                        ),
                      )
                    : controller.gameList.isEmpty
                        ? const Center(
                            child: Text(
                              "No data",
                              style: TextStyle(
                                fontFamily: "InriaSans",
                                color: Colors.white,
                              ),
                            ),
                          )
                        : GridView.builder(
                            physics: const BouncingScrollPhysics(),
                            controller: controller.scrollController,
                            itemCount: controller.gameList.length + 2,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                    mainAxisExtent: 270),
                            itemBuilder: (context, index) {
                              if (index < controller.gameList.length) {
                                return GestureDetector(
                                  onTap: () {
                                    Get.to(DetailGameView(
                                        controller.gameList[index], index));
                                  },
                                  // color: Colors.cyan,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(7),
                                    child: ClipPath(
                                      clipper: CustomPathClipper(),
                                      child: Container(
                                        // width: 173,
                                        height: 140,
                                        color: AppColors.colorDarkGrey,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Hero(
                                                tag: "game$index",
                                                child: Container(
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    color: const Color.fromARGB(
                                                        65, 138, 136, 136),
                                                    image: DecorationImage(
                                                      image:
                                                          CachedNetworkImageProvider(
                                                        controller
                                                                    .gameList[
                                                                        index]
                                                                    .backgroundImage
                                                                    .toString() !=
                                                                "null"
                                                            ? controller
                                                                .gameList[index]
                                                                .backgroundImage
                                                                .toString()
                                                            : "https://cdn5.vectorstock.com/i/1000x1000/73/49/404-error-page-not-found-miss-paper-with-white-vector-20577349.jpg"
                                                                .toString(),
                                                      ),
                                                      fit: BoxFit.cover,
                                                    ),
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(7),
                                                      bottomRight:
                                                          Radius.circular(7),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              padding: const EdgeInsets.only(
                                                  left: 7, top: 7, bottom: 7),
                                              // alignment: Alignment.centerLeft,
                                              // height: 100,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    controller
                                                        .gameList[index].name!,
                                                    style: const TextStyle(
                                                      fontFamily: "InriaSans",
                                                      color: Colors.white,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontSize: 17,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 7,
                                                  ),
                                                  Container(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: RichText(
                                                      text: TextSpan(
                                                        text:
                                                            "Date de sortir: ",
                                                        style: const TextStyle(
                                                            fontFamily:
                                                                "InriaSans",
                                                            fontSize: 15,
                                                            color:
                                                                Colors.white),
                                                        children: [
                                                          TextSpan(
                                                            text: controller
                                                                        .gameList[
                                                                            index]
                                                                        .released ==
                                                                    null
                                                                ? ""
                                                                : DateFormat(
                                                                        'dd-MM-yyyy')
                                                                    .format(
                                                                      controller
                                                                          .gameList[
                                                                              index]
                                                                          .released!,
                                                                    )
                                                                    .toString(),
                                                            style:
                                                                const TextStyle(
                                                              fontFamily:
                                                                  "InriaSans",
                                                              color:
                                                                  Colors.grey,
                                                              fontSize: 15,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 7,
                                                  ),
                                                  RatingBar.builder(
                                                    initialRating: controller
                                                        .gameList[index]
                                                        .rating!,
                                                    minRating: 1,
                                                    direction: Axis.horizontal,
                                                    allowHalfRating: true,
                                                    itemCount: 5,
                                                    unratedColor:
                                                        const Color.fromARGB(
                                                            255, 197, 196, 196),
                                                    itemSize: 20,
                                                    // itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                                                    itemBuilder: (context, _) =>
                                                        const Icon(
                                                      Icons.star,
                                                      color: Colors.amber,
                                                      size: 10,
                                                    ),
                                                    onRatingUpdate: (rating) {
                                                      print(rating);
                                                    },
                                                  ),
                                                  const SizedBox(
                                                    height: 7,
                                                  ),

                                                  // Container(
                                                  //   alignment:
                                                  //       Alignment.centerLeft,
                                                  //   padding:
                                                  //       const EdgeInsets.all(7),
                                                  //   child: RichText(
                                                  //     text: TextSpan(
                                                  //       text: "Date de sortir: ",
                                                  //       style: const TextStyle(
                                                  //           fontFamily:
                                                  //               "InriaSans",
                                                  //           color: Colors.grey),
                                                  //       children: [
                                                  //         TextSpan(
                                                  //           text: controller
                                                  //                       .gameList[
                                                  //                           index]
                                                  //                       .released ==
                                                  //                   null
                                                  //               ? ""
                                                  //               : DateFormat(
                                                  //                       'dd-MM-yyyy')
                                                  //                   .format(
                                                  //                     controller
                                                  //                         .gameList[
                                                  //                             index]
                                                  //                         .released!,
                                                  //                   )
                                                  //                   .toString(),
                                                  //           style:
                                                  //               const TextStyle(
                                                  //             fontFamily:
                                                  //                 "InriaSans",
                                                  //             color: Colors.white,
                                                  //             fontSize: 15,
                                                  //           ),
                                                  //         ),
                                                  //       ],
                                                  //     ),
                                                  //   ),
                                                  // ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 7),
                                                    child: Wrap(
                                                      spacing: 7,
                                                      children: [
                                                        ...controller
                                                            .gameList[index]
                                                            .parentPlatforms!
                                                            .map(
                                                          (e) => controller.icons[e
                                                                      .platform
                                                                      .slug] ==
                                                                  null
                                                              ? Container()
                                                              : SvgPicture
                                                                  .asset(
                                                                  controller
                                                                      .icons[e
                                                                          .platform
                                                                          .slug]
                                                                      .toString(),
                                                                  height: 20,
                                                                ),
                                                        ),
                                                        // Text(
                                                        //  wrapWidget.children.length.toString(),
                                                        //   style: TextStyle(
                                                        //     color:
                                                        //         Color.fromARGB(
                                                        //             165,
                                                        //             255,
                                                        //             255,
                                                        //             255),
                                                        //   ),
                                                        // )
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
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              } else {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            },
                          ),
              ),
            )
          ],
        ),
      ),
    );
  }
}