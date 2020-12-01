import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:gulf_demo/Models/ImageSliderModel.dart';
import 'package:gulf_demo/States/HomeState.dart';
import 'package:gulf_demo/Style/SizeConfig.dart';
import 'package:gulf_demo/Widgets/MainHomeItem.dart';
import 'package:gulf_demo/Widgets/SliderWidget.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        final homeState = Provider.of<HomeState>(context, listen: false);
        homeState.loadMore();
      }
    });
    //loadNextPage();
  }

  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

//  Future<void> _onScrollUpdated() async {
//    var maxScroll = _controller.position.maxScrollExtent;
//    var currentPosition = _controller.position.pixels;
//    if (currentPosition == maxScroll) {
//
//      //todoService.loadNextPage();
//      print("Hi");
//    }
//  }

  @override
  Widget build(BuildContext context) {
    final homeState = Provider.of<HomeState>(context, listen: false);
    //homeState.reachBottom();
    TextEditingController SearchController = TextEditingController();
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Color(0xFF026B7E),
        ),
        width: 60.0,
        height: 40.0,
        child: Center(
            child: Row(
          children: [
            Icon(
              Icons.location_on,
              color: Colors.white,
            ),
            Text(
              "Map",
              style: TextStyle(color: Colors.white),
            ),
          ],
        )),
      ),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 64.0),
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
//SLIDER
                  Consumer<HomeState>(builder: (_, state, __) {
                    return state.isFetching
                        ? Padding(
                            padding: const EdgeInsets.only(top: 64.0),
                            child: SpinKitFoldingCube(
                                color: Colors.grey,
                                size: 10 * SizeConfig.imageSizeMultiplier),
                          )
                        : Padding(
                            padding: const EdgeInsets.only(top: 64.0),
                            child: HomeImageSlider(state.sliderModel),
                          );
                  }),
                  //Main Data
                  Consumer<HomeState>(builder: (_, state, __) {
                    return state.isFetching2
                        ? Padding(
                            padding: const EdgeInsets.only(top: 64.0),
                            child: SpinKitFoldingCube(
                                color: Colors.grey,
                                size: 10 * SizeConfig.imageSizeMultiplier),
                          )
                        : Container(
                            width: double.infinity,
                            child: ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: state.homeList.length + 1,
                                itemBuilder: (context, i) {
                                  if (i == state.homeList.length) {
                                    return CupertinoActivityIndicator();
                                  }
                                  return MainHomeItem(state.homeList[i]);
                                }));
                  }),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              //margin: EdgeInsets.only(top: 20),
              alignment: Alignment.center,
              height: 120,
              width: double.infinity,
              color: Color(0xFFFAFAFA),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Rent",
                              style: TextStyle(
                                  color: Color(0xFF146174), fontSize: 20.0)),
                          Icon(
                            Icons.arrow_drop_down,
                            color: Color(0xFF146174),
                            size: 8 * SizeConfig.imageSizeMultiplier,
                          ),
                        ],
                      ),
                    ),
                  ),
                  searchAppBar(context, SearchController),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 120.0, right: 5.0),
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: Colors.white,
                ),
                width: 60.0,
                height: 40.0,
                child: Center(
                    child: Row(
                  children: [
                    Icon(
                      Icons.compare,
                      color: Color(0xFF026B7E),
                    ),
                    Text(
                      "Sort",
                      style: TextStyle(
                        color: Color(0xFF026B7E),
                      ),
                    )
                  ],
                )),
              ),
            ),
          ),
          Consumer<HomeState>(builder: (_, state, __) {
            return state.isFetching3
                ? Align(
                    alignment: Alignment.bottomCenter,
                    child: CircularProgressIndicator())
                : Container(height: 1.0);
          }),
        ],
      ),
    );
  }

  Widget searchAppBar(
      BuildContext context, TextEditingController SearchController) {
    return Container(
      // height: 50.0,
      width: 90 * SizeConfig.widthMultiplier,
      child: TextFormField(
        cursorColor: Colors.black,
        controller: SearchController,
        textAlign: TextAlign.start,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.normal,
          fontSize: 2.0 * SizeConfig.textMultiplier,
        ),
        onFieldSubmitted: (value) {},
        keyboardType: TextInputType.text,
        decoration: new InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey,
          ),
          suffixIcon: Icon(
            Icons.sort,
            color: Colors.grey,
          ),
          suffixText: "Filter",
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(
              color: Colors.grey,
              width: 2.0,
            ),
          ),
          hintText: "e.g. Abu Dhabi",
          contentPadding:
              new EdgeInsets.symmetric(vertical: 3.0, horizontal: 25.0),
        ),
      ),
    );
  }
}
