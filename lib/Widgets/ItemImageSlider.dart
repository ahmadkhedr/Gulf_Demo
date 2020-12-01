import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:gulf_demo/Models/MainDataModel.dart';
import 'package:gulf_demo/Style/SizeConfig.dart';
import 'package:gulf_demo/Models/MainDataModel.dart' as mainnn;

class ItemImageSlider extends StatelessWidget {
  mainnn.Datum ItemSliderList;

  ItemImageSlider(this.ItemSliderList);

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.blue,
      child: new ConstrainedBox(
          child: Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: new Swiper(
              autoplay: false,
              autoplayDelay: 8000,
              loop: false,
              index: 0,
//              scale: 0.6,
//              viewportFraction: 0.9,
              scrollDirection: Axis.horizontal,
              outer: false,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
//                      Navigator.push(
//                          context,
//                          MaterialPageRoute(
//                              builder: (context) => storyDetailsPage(
//                                  homeSliderList.results[index].newId)));
                  },
                  child: new Wrap(
                    runSpacing: 6.0,
                    children: [0].map((i) {
                      return Center(
                        child: Container(
                          width: SizeConfig.widthMultiplier * 40,
                          height: SizeConfig.heightMultiplier * 20,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              image: DecorationImage(
                                  image: NetworkImage(ItemSliderList.propertyImages[index].url),
                                  fit: BoxFit.cover)),
                        ),
                      );
                    }).toList(),
                  ),
                );
              },
              pagination: new SwiperPagination(
                  margin: new EdgeInsets.all(1.0),
                  builder: new DotSwiperPaginationBuilder(
                      size: 4.0,
                      activeSize: 5.0,
                      activeColor: Colors.white,
                      color: Colors.grey)),
              itemCount: ItemSliderList.propertyImages.length,
            ),
          ),
          constraints: new BoxConstraints.loose(new Size(
              SizeConfig.widthMultiplier * 40,
              SizeConfig.heightMultiplier * 20))),
    );

//
  }
}
