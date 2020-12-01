import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gulf_demo/Models/ImageSliderModel.dart';
import 'package:gulf_demo/Models/MainDataModel.dart';
import 'package:gulf_demo/Provides/ApiProvider.dart';

class HomeState extends ChangeNotifier {
  ApiProvider request = new ApiProvider();
  bool _isFetching = true;
  bool _isFetching2 = true;
  bool get isFetching => _isFetching;
  bool get isFetching2 => _isFetching2;

  HomeState() {
    SliderRequest();
    MainDataRequest();
  }

  String _jsonSliderResonse = "";
  String _jsonMainDataResonse = "";
  ImageSliderModel sliderModel;
  MainDataModel MainModel;

  SliderRequest() async {
     _isFetching = true;
    await request.getHomeSlider();
    if (request.homesSliderResponse.statusCode == 200) {
      _isFetching = false;
      _jsonSliderResonse = request.homesSliderResponse.body;

      sliderModel = ImageSliderModel.fromJson(json.decode(_jsonSliderResonse));
      print(sliderModel.responseMessageAr.toString());

      notifyListeners();
    }
     notifyListeners();
  }
  MainDataRequest() async {
     _isFetching2 = true;
    await request.getHomeMAinData();
    if (request.homeBodyResponse.statusCode == 200) {
      _isFetching2 = false;
      _jsonMainDataResonse = request.homeBodyResponse.body;

      MainModel = MainDataModel.fromJson(json.decode(_jsonMainDataResonse));
      print(MainModel.responseMessageAr.toString());

      notifyListeners();
    }
     notifyListeners();
  }
}
