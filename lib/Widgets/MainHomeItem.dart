import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gulf_demo/Models/MainDataModel.dart';
import 'package:gulf_demo/Style/SizeConfig.dart';
import 'package:gulf_demo/Widgets/ItemImageSlider.dart';
import 'package:gulf_demo/Models/MainDataModel.dart' as mainnn;

class MainHomeItem extends StatelessWidget {
  mainnn.Datum HomeItem;


  MainHomeItem(this.HomeItem);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
      height: SizeConfig.heightMultiplier * 20,
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 6,
        child: Row(
          children: [
            Container(
              width: SizeConfig.widthMultiplier * 40,
              height: SizeConfig.heightMultiplier * 20,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      topLeft: Radius.circular(15)),
//                  image: DecorationImage(
//                      image: NetworkImage(
//                          HomeItem.data[index].propertyImages[0].url),
//                      fit: BoxFit.cover)
              ),
              child: ItemImageSlider(HomeItem),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0,top:8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: SizeConfig.widthMultiplier * 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          HomeItem.category,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.grey,),
                        ),
                        Icon(Icons.favorite_border,color: Colors.grey)
                      ],
                    ),
                  ),
                  Text("${HomeItem.price} AED",style: TextStyle(color: Colors.black),),
                  SizedBox(
                    width: SizeConfig.widthMultiplier * 50,
                    child: Text(
                      HomeItem.address,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.king_bed_outlined,color: Colors.grey),
                          Text(HomeItem.bedRoom.toString(),style: TextStyle(color: Colors.grey),)
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:10.0),
                        child: Row(
                          children: [
                            Icon(Icons.bathtub_outlined,color: Colors.grey),
                            Text(HomeItem.bathRoom.toString(),style: TextStyle(color: Colors.grey),)
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:10.0),
                        child: Row(
                          children: [
                            Icon(Icons.square_foot,color: Colors.grey),
                            Text(HomeItem.areaSpace.toString(),style: TextStyle(color: Colors.grey),)
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),


    );
  }
}
