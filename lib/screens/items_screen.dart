import 'package:drama_app/providers/cast_provider.dart';
import 'package:drama_app/providers/items_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ItemDetailsScreen extends StatelessWidget {
  final String id;
  final String title;
  final String category;
  final String imageUrl;

  ItemDetailsScreen(this.id, this.title, this.category, this.imageUrl);

  Widget buildingSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(text, style: Theme.of(context).textTheme.headline2),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 200,
      width: 300,
      child: child,
    );
  }

  final ratingValues = [4.5, 3, 5];

  final initialRatingValue = 1;

  arraySum(List arr) {
    var sum = 0.0;
    arr.forEach((element) {
      sum = sum + element;
    });
    return sum;
  }

  @override
  Widget build(BuildContext context) {
    final itemData = Provider.of<Items>(context);
    final items = itemData.items;

    final castData = Provider.of<Casts>(context);
    final itemsCast = castData.items;

    final roleData = Provider.of<Casts>(context);
    final itemsRoles = roleData.items;

    final selectedItem = items.firstWhere((item) => item.id == id);

    final selectedCast = [];

    itemsCast.forEach((cast) {
      selectedItem.cast.forEach((item) {
        if (cast.id == item) {
          selectedCast.add(cast);
        }
      });
    });

    final selectedProducer = itemsRoles.where((item) => item.id == selectedItem.producer);
    final selectedDirector = itemsRoles.where((item) => item.id == selectedItem.director);

    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: double.infinity,
                  child: Image.network(
                    // selectedItem.imageUrl,
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
                  child: InkWell(
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                      size: 50,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ]),
              // buildingSectionTitle(context, selectedItem.title),
              Center(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.only(top: 5),
                  child: Text(
                    selectedItem.title,
                    style: TextStyle(fontFamily: "RobotoCondensed-Light", fontWeight: FontWeight.w500, fontSize: 25),
                  ),
                ),
              ),
              ////////////////////////////////////////////////////////////////////////////////////////////////
              Center(
                child: RatingBar.builder(
                  itemSize: 25,
                  initialRating: 3,
                  // initialRating: selectedItem.ratings,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 6.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    ratingValues.add(rating);
                    print(ratingValues);
                    print(rating);
                    print(arraySum(ratingValues) / ratingValues.length);
                  },
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 3, bottom: 15),
                  child: Text(
                    "Ratings" + " (10)",
                    style: TextStyle(
                      fontFamily: "RobotoCondensed-Light",
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: Colors.grey[600]
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 25, bottom: 5),
                child: Text(
                  "Plot Summary",
                  style: TextStyle(
                    fontFamily: "RobotoCondensed-Light",
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 20, left: 25, right: 25),
                child: Text(
                  selectedItem.description,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontFamily: "RobotoCondensed-Light",
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: Colors.grey[700]
                  ),
                ),
              ),
              ////////////////////////////////////////////////////////////////////////////////////////////////
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                padding: EdgeInsets.only(left: 25),
                child: Text(
                  "Cast",
                  style: TextStyle(
                    fontFamily: "RobotoCondensed-Light",
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5, left: 2, right: 2),
                padding: EdgeInsets.only(left: 2, right: 2),
                height: 150,
                width: 400,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: selectedCast.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(5),
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(selectedCast[index].imageUrl),
                                maxRadius: 30,
                              ),
                            ),
                            Container(
                              width: 100,
                              child: Text(
                                selectedCast[index].name,
                                style: TextStyle(fontWeight: FontWeight.w600, color: Colors.grey[600]),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              ),
              //buildingSectionTitle(context, "Director"),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Director",
                  style: TextStyle(
                    fontFamily: "RobotoCondensed-Light",
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Text(
                selectedItem.director,
                //selectedDirector.name,
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: "RobotoCondensed-Light", fontWeight: FontWeight.w400, fontSize: 20),
              ),
              // buildingSectionTitle(context, "Producer"),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Producer",
                  style: TextStyle(
                    fontFamily: "RobotoCondensed-Light",
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Text(
                selectedItem.producer,
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: "RobotoCondensed-Light", fontWeight: FontWeight.w400, fontSize: 20),
              ),
              SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}
