import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:game_info/app/data/GameApi.dart';
import 'package:game_info/app/models/gameModel.dart';
import 'package:game_info/widgets/ongletSelected.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final imagesString = <String>[].obs;
  final ScrollController scrollController = ScrollController();
  final listImageGame = <String>[].obs;
  var pageApi = 1;
  final loadMore = false.obs;
  var nexUrl = "".obs;
  final ongletSelected = "".obs;
  TextEditingController query = TextEditingController();
  final Map<String, String> icons = {
    "pc": "assets/icons/windows.svg",
    "playstation": "assets/icons/ps.svg",
    "xbox": "assets/icons/xbox.svg",
  };
  var gameList = <ResultGame>[].obs;
  var load = false.obs;
  final ongletSelectedList = const <OngletSelected>[
    OngletSelected(
      label: 'Populaire',
    ),
    OngletSelected(
      label: 'Nouveau',
    ),
    OngletSelected(
      label: 'Gratuit',
    ),
  ];
  setOngletSelected(String value) {
    ongletSelected.value = value;
  }

  void _scrollListener() async {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
          pageApi++;
      if (!loadMore.value) {
        var newData = await GameApi.all("", pageApi) as List<ResultGame>;
        gameList.addAll(newData);
      }
    }
  }

  @override
  void onInit() async {
    // Get.to(FilterView());
    await fetchGame("");
    scrollController.addListener(_scrollListener);
    super.onInit();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  fetchGame(String searchText) async {
    load(true);
    log('message');
    log(nexUrl.value.toString());
    gameList.value = await GameApi.all(searchText, pageApi) as List<ResultGame>;
    load(false);
  }

  convertImageString(List<ShortScreenshot> images) {
    imagesString.value = images.map((e) => e.image!).toList();
  }
}
