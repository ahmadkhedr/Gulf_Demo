// To parse this JSON data, do
//
//     final imageSliderModel = imageSliderModelFromJson(jsonString);

import 'dart:convert';

ImageSliderModel imageSliderModelFromJson(String str) => ImageSliderModel.fromJson(json.decode(str));

String imageSliderModelToJson(ImageSliderModel data) => json.encode(data.toJson());

class ImageSliderModel {
  ImageSliderModel({
    this.responseCode,
    this.responseMessageEn,
    this.responseMessageAr,
    this.responseMessage,
    this.responseRemark,
    this.data,
  });

  int responseCode;
  String responseMessageEn;
  String responseMessageAr;
  String responseMessage;
  String responseRemark;
  List<Datum> data;

  factory ImageSliderModel.fromJson(Map<String, dynamic> json) => ImageSliderModel(
    responseCode: json["responseCode"] == null ? null : json["responseCode"],
    responseMessageEn: json["responseMessageEn"] == null ? null : json["responseMessageEn"],
    responseMessageAr: json["responseMessageAr"] == null ? null : json["responseMessageAr"],
    responseMessage: json["responseMessage"] == null ? null : json["responseMessage"],
    responseRemark: json["responseRemark"] == null ? null : json["responseRemark"],
    data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "responseCode": responseCode == null ? null : responseCode,
    "responseMessageEn": responseMessageEn == null ? null : responseMessageEn,
    "responseMessageAr": responseMessageAr == null ? null : responseMessageAr,
    "responseMessage": responseMessage == null ? null : responseMessage,
    "responseRemark": responseRemark == null ? null : responseRemark,
    "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.rowNum,
    this.id,
    this.unitRef,
    this.unitNo,
    this.floorNumber,
    this.title,
    this.price,
    this.phone,
    this.email,
    this.address,
    this.category,
    this.area,
    this.bedRoom,
    this.bathRoom,
    this.parking,
    this.distanceFromMe,
    this.latitude,
    this.longtiude,
    this.isFavourit,
    this.areaSpace,
    this.serviceCharge,
    this.isRented,
    this.rentAmount,
    this.mortirage,
    this.expireDate,
    this.isHotDeals,
    this.isFeatured,
    this.isMap,
    this.status,
    this.isSold,
    this.propertyImages,
    this.propertyType,
    this.amenities,
    this.description,
    this.shareLink,
    this.furnishing,
    this.primaryView,
    this.smsNo,
  });

  dynamic rowNum;
  dynamic id;
  String unitRef;
  String unitNo;
  String floorNumber;
  String title;
  String price;
  String phone;
  String email;
  String address;
  String category;
  dynamic area;
  dynamic bedRoom;
  dynamic bathRoom;
  dynamic parking;
  dynamic distanceFromMe;
  double latitude;
  double longtiude;
  bool isFavourit;
  dynamic areaSpace;
  dynamic serviceCharge;
  bool isRented;
  dynamic rentAmount;
  bool mortirage;
  dynamic expireDate;
  bool isHotDeals;
  bool isFeatured;
  bool isMap;
  dynamic status;
  bool isSold;
  List<PropertyImage> propertyImages;
  PropertyType propertyType;
  List<Amenity> amenities;
  String description;
  String shareLink;
  String furnishing;
  PrimaryView primaryView;
  dynamic smsNo;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    rowNum: json["rowNum"] == null ? null : json["rowNum"],
    id: json["id"] == null ? null : json["id"],
    unitRef: json["unitRef"] == null ? null : json["unitRef"],
    unitNo: json["unitNo"] == null ? null : json["unitNo"],
    floorNumber: json["floorNumber"] == null ? null : json["floorNumber"],
    title: json["title"] == null ? null : json["title"],
    price: json["price"] == null ? null : json["price"],
    phone: json["phone"] == null ? null : json["phone"],
    email: json["email"] == null ? null : json["email"],
    address: json["address"] == null ? null : json["address"],
    category: json["category"] == null ? null : json["category"],
    area: json["area"],
    bedRoom: json["bedRoom"],
    bathRoom: json["bathRoom"],
    parking: json["parking"] == null ? null : json["parking"],
    distanceFromMe: json["distanceFromMe"],
    latitude: json["latitude"] == null ? null : json["latitude"].toDouble(),
    longtiude: json["longtiude"] == null ? null : json["longtiude"].toDouble(),
    isFavourit: json["isFavourit"] == null ? null : json["isFavourit"],
    areaSpace: json["areaSpace"],
    serviceCharge: json["serviceCharge"] ,
    isRented: json["isRented"] == null ? null : json["isRented"],
    rentAmount: json["rentAmount"] == null ? null : json["rentAmount"],
    mortirage: json["mortirage"] == null ? null : json["mortirage"],
    expireDate: json["expireDate"],
    isHotDeals: json["isHotDeals"] == null ? null : json["isHotDeals"],
    isFeatured: json["isFeatured"] == null ? null : json["isFeatured"],
    isMap: json["isMap"] == null ? null : json["isMap"],
    status: json["status"],
    isSold: json["isSold"] == null ? null : json["isSold"],
    propertyImages: json["propertyImages"] == null ? null : List<PropertyImage>.from(json["propertyImages"].map((x) => PropertyImage.fromJson(x))),
    propertyType: json["propertyType"] == null ? null : PropertyType.fromJson(json["propertyType"]),
    amenities: json["amenities"] == null ? null : List<Amenity>.from(json["amenities"].map((x) => Amenity.fromJson(x))),
    description: json["description"] == null ? null : json["description"],
    shareLink: json["shareLink"] == null ? null : json["shareLink"],
    furnishing: json["furnishing"] == null ? null : json["furnishing"],
    primaryView: json["primaryView"] == null ? null : PrimaryView.fromJson(json["primaryView"]),
    smsNo: json["smsNo"],
  );

  Map<String, dynamic> toJson() => {
    "rowNum": rowNum == null ? null : rowNum,
    "id": id == null ? null : id,
    "unitRef": unitRef == null ? null : unitRef,
    "unitNo": unitNo == null ? null : unitNo,
    "floorNumber": floorNumber == null ? null : floorNumber,
    "title": title == null ? null : title,
    "price": price == null ? null : price,
    "phone": phone == null ? null : phone,
    "email": email == null ? null : email,
    "address": address == null ? null : address,
    "category": category == null ? null : category,
    "area": area == null ? null : area,
    "bedRoom": bedRoom == null ? null : bedRoom,
    "bathRoom": bathRoom == null ? null : bathRoom,
    "parking": parking == null ? null : parking,
    "distanceFromMe": distanceFromMe,
    "latitude": latitude == null ? null : latitude,
    "longtiude": longtiude == null ? null : longtiude,
    "isFavourit": isFavourit == null ? null : isFavourit,
    "areaSpace": areaSpace == null ? null : areaSpace,
    "serviceCharge": serviceCharge == null ? null : serviceCharge,
    "isRented": isRented == null ? null : isRented,
    "rentAmount": rentAmount == null ? null : rentAmount,
    "mortirage": mortirage == null ? null : mortirage,
    "expireDate": expireDate,
    "isHotDeals": isHotDeals == null ? null : isHotDeals,
    "isFeatured": isFeatured == null ? null : isFeatured,
    "isMap": isMap == null ? null : isMap,
    "status": status,
    "isSold": isSold == null ? null : isSold,
    "propertyImages": propertyImages == null ? null : List<dynamic>.from(propertyImages.map((x) => x.toJson())),
    "propertyType": propertyType == null ? null : propertyType.toJson(),
    "amenities": amenities == null ? null : List<dynamic>.from(amenities.map((x) => x.toJson())),
    "description": description == null ? null : description,
    "shareLink": shareLink == null ? null : shareLink,
    "furnishing": furnishing == null ? null : furnishing,
    "primaryView": primaryView == null ? null : primaryView.toJson(),
    "smsNo": smsNo,
  };
}

class Amenity {
  Amenity({
    this.id,
    this.name,
    this.imageUrl,
  });

  int id;
  String name;
  String imageUrl;

  factory Amenity.fromJson(Map<String, dynamic> json) => Amenity(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    imageUrl: json["imageUrl"] == null ? null : json["imageUrl"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "imageUrl": imageUrl == null ? null : imageUrl,
  };
}

class PrimaryView {
  PrimaryView({
    this.id,
    this.name,
  });

  int id;
  String name;

  factory PrimaryView.fromJson(Map<String, dynamic> json) => PrimaryView(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
  };
}

class PropertyImage {
  PropertyImage({
    this.id,
    this.url,
    this.isMain,
    this.type,
    this.isIntegration,
  });

  int id;
  String url;
  bool isMain;
  String type;
  bool isIntegration;

  factory PropertyImage.fromJson(Map<String, dynamic> json) => PropertyImage(
    id: json["id"] == null ? null : json["id"],
    url: json["url"] == null ? null : json["url"],
    isMain: json["isMain"] == null ? null : json["isMain"],
    type: json["type"] == null ? null : json["type"],
    isIntegration: json["isIntegration"] == null ? null : json["isIntegration"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "url": url == null ? null : url,
    "isMain": isMain == null ? null : isMain,
    "type": type == null ? null : type,
    "isIntegration": isIntegration == null ? null : isIntegration,
  };
}

class PropertyType {
  PropertyType({
    this.id,
    this.name,
    this.propertyType,
  });

  int id;
  String name;
  int propertyType;

  factory PropertyType.fromJson(Map<String, dynamic> json) => PropertyType(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    propertyType: json["propertyType"] == null ? null : json["propertyType"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "propertyType": propertyType == null ? null : propertyType,
  };
}
