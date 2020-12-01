import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:gulf_demo/Models/ImageSliderModel.dart';
import 'package:gulf_demo/Style/SizeConfig.dart';

class HomeImageSlider extends StatelessWidget {
  ImageSliderModel homeSliderList;

  HomeImageSlider(this.homeSliderList);

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.blue,
      child: new ConstrainedBox(
          child: Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: new Swiper(
              autoplay: true,
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
                          height: 40 * SizeConfig.heightMultiplier,
                          width: MediaQuery.of(context).size.width * .98,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              image: DecorationImage(
                                  image: NetworkImage(homeSliderList
                                      .data[index].propertyImages[0].url),
                                  fit: BoxFit.cover)),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Opacity(
                              opacity: .65,
                              child: Container(
                                height:10 * SizeConfig.heightMultiplier,
                                width: MediaQuery.of(context).size.width * .98,
                                color: Color(0xFFF8F8F6),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            homeSliderList.data[index].category,
                                            style: TextStyle(fontSize: 16.0,color: Colors.black),
                                            maxLines: 1,
                                          ),
                                          Text(
                                            "${homeSliderList.data[index].price.toString()} AED",
                                            style: TextStyle(fontSize: 16.0,color: Colors.black,fontWeight: FontWeight.bold),
                                            maxLines: 2,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left:8.0),
                                      child: Text(homeSliderList.data[index].address,
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left:8.0),
                                      child: Row(
                                        children: [
                                          Row(
                                            children: [
                                              Icon(Icons.king_bed_outlined),
                                              Text(homeSliderList.data[index].bedRoom.toString())
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left:10.0),
                                            child: Row(
                                              children: [
                                                Icon(Icons.bathtub_outlined),
                                                Text(homeSliderList.data[index].bathRoom.toString())
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left:10.0),
                                            child: Row(
                                              children: [
                                                Icon(Icons.square_foot),
                                                Text(homeSliderList.data[index].areaSpace.toString())
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                );
              },
//                pagination: new SwiperPagination(
//                    margin: new EdgeInsets.all(5.0),
//                    builder: new DotSwiperPaginationBuilder(
//                        activeColor: AppColors.AppBlueColor, color: Colors.grey)),
              itemCount: homeSliderList.data.length,
            ),
          ),
          constraints: new BoxConstraints.loose(new Size(
              MediaQuery.of(context).size.width,
              41 * SizeConfig.heightMultiplier))),
    );

//
  }
}
