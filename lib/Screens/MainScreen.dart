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

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homeState = Provider.of<HomeState>(context, listen: false);
    TextEditingController SearchController = TextEditingController();
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      floatingActionButton:
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Color(0xFF026B7E),
        ),
        width: 60.0,
        height: 40.0,

        child: Center(child: Row(
          children: [
            Icon(Icons.location_on,color: Colors.white,),
            Text("Map",style: TextStyle(color: Colors.white),),
          ],
        )),

      ),



      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 64.0),
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
                                itemCount: state.MainModel.data.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return MainHomeItem(state.MainModel, index);
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
            padding: const EdgeInsets.only(top: 120.0,right:5.0),
            child: Align(
              alignment: Alignment.topRight,
              child:Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: Colors.white,
                ),
                width: 60.0,
                height: 40.0,

                child: Center(child: Row(
                  children: [
                    Icon(Icons.compare,color: Color(0xFF026B7E),),
                    Text("Sort",style: TextStyle(color:Color(0xFF026B7E),),
                    )],
                )),

              ),
            ),
          ),
//          Align(
//            alignment: Alignment.bottomRight,
//            child: FloatingActionButton(
//                heroTag: null,
//                onPressed: () {  },
//                child: Text("top"),),
//          ),
        ],
      ),
    );
  }

  Widget ListViewItem(
      BuildContext context, int index, ImageSliderModel sliderModel) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
//        height: 15 * SizeConfig.heightMultiplier,
//        width: 90 * SizeConfig.widthMultiplier,

        decoration: BoxDecoration(
            color: Colors.green,
            image: DecorationImage(
                image:
                    NetworkImage(sliderModel.data[index].propertyImages[0].url),
                fit: BoxFit.fill)),
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
        onFieldSubmitted: (value) {
//          Navigator.push(
//              context,
//              MaterialPageRoute(
//                  builder: (context) => previewScan(
//                      SearchController.value.text.toString())));
        },
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
