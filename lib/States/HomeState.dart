import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gulf_demo/Models/ImageSliderModel.dart';
import 'package:gulf_demo/Models/MainDataModel.dart';
import 'package:gulf_demo/Models/MainDataModel.dart' as mainnn;
import 'package:gulf_demo/Provides/ApiProvider.dart';

class HomeState extends ChangeNotifier {
  ApiProvider request = new ApiProvider();
  ScrollController _scrollController = ScrollController();

  HomeState() {
    SliderRequest();
    MainDataRequest();
  }

  bool _isFetching = true;
  bool _isFetching2 = true;
  bool _isFetching3 = false;
  List<mainnn.Datum> _homeList = new List();

  bool get isFetching => _isFetching;

  bool get isFetching2 => _isFetching2;
  bool get isFetching3 => _isFetching3;

  List<mainnn.Datum> get homeList => _homeList;

  ScrollController get scrollController => _scrollController;
  int lastRowId = 0;
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
    await request.getHomeMAinData(lastRowId);
    if (request.homeBodyResponse.statusCode == 200) {

      _jsonMainDataResonse = request.homeBodyResponse.body;

      MainModel = MainDataModel.fromJson(json.decode(_jsonMainDataResonse));
      for (int i = 0; i < MainModel.data.length; i++) {
        _homeList.add(MainModel.data[i]);
      }
      print(_homeList.length);
      lastRowId = _homeList.length ;
      print(lastRowId);
      _isFetching2 = false;
      notifyListeners();
    }
    notifyListeners();
  }

  loadMore() async {
    _isFetching3 = true;
    await request.getHomeMAinData(lastRowId);
    if (request.homeBodyResponse.statusCode == 200) {
       _isFetching3 = false;
      _jsonMainDataResonse = request.homeBodyResponse.body;

      MainModel = MainDataModel.fromJson(json.decode(_jsonMainDataResonse));
      for (int i = 0; i < MainModel.data.length; i++) {
        _homeList.add(MainModel.data[i]);
        notifyListeners();
      }
      for(int i = 0 ; i < _homeList.length ; i ++){
        print(_homeList[i].rowNum);

      }
       lastRowId = _homeList.length ;
       print(lastRowId);


       notifyListeners();
    }
    notifyListeners();
  }


}
