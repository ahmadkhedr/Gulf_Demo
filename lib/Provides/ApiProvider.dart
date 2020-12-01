import 'dart:convert';

import 'package:gulf_demo/Models/ImageSliderModel.dart';
import 'package:gulf_demo/Models/MainDataModel.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  var root = "http://45.35.169.130/UGPRealEstate_Test/api/Property";

  var homesSliderResponse;
  var homeBodyResponse;

  Future<ImageSliderModel> getHomeSlider() async {
    homesSliderResponse = await http.post(
      "$root/SliderImagesProperty",
      body: jsonEncode({
        "appLanguage": "en",
        "deviceSerial": "DA3D4B85-2809-485D-A93B-3F0B582FBF72",
        "MeasureUnitId": 1,
        "appversion": "",
        "notificationToken":
            "e9JCuaNS-0ZWgE7jwEr3-9:APA91bGw_QzWLtCEGUA7zFRJoiySzFra1i4IXMZBhDQaH1z3QuyInt726Wb7en4Xcbt7sj4HOSLPQITmvg2s7w6p_aTJtjOHS3kRT3jPz-HqpdvC7qLoqmduvJl2pU3kver_-l9QjSVG",
        "deviceType": 1,
        "userId": 1140,
        "data": {},
        "ip": "",
        "CurrencyId": 1,
        "CountryId": 65946,
        "osversion": ""
      }),
      headers: {
        "content-type": "application/json",
      },
    );
  }
  Future<MainDataModel> getHomeMAinData() async {
    homeBodyResponse = await http.post(
      "$root/PropertyList",
      body: jsonEncode({
        "appLanguage": "en",
        "deviceSerial": "DA3D4B85-2809-485D-A93B-3F0B582FBF72",
        "MeasureUnitId": 1,
        "appversion": "",
        "notificationToken":
            "e9JCuaNS-0ZWgE7jwEr3-9:APA91bGw_QzWLtCEGUA7zFRJoiySzFra1i4IXMZBhDQaH1z3QuyInt726Wb7en4Xcbt7sj4HOSLPQITmvg2s7w6p_aTJtjOHS3kRT3jPz-HqpdvC7qLoqmduvJl2pU3kver_-l9QjSVG",
        "deviceType": 1,
        "userId": 1140,
        "data": {},
        "ip": "",
        "CurrencyId": 1,
        "CountryId": 65946,
        "osversion": ""
      }),
      headers: {
        "content-type": "application/json",
      },
    );
  }
}
