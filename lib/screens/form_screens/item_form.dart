import 'dart:ui';

import 'package:flutter/material.dart';

class ItemFormScreen extends StatefulWidget {
  @override
  _ItemFormScreenState createState() => _ItemFormScreenState();
}

class _ItemFormScreenState extends State<ItemFormScreen> {
  final _imageEditingCOntroler = TextEditingController();

  void dispose() {
    _imageEditingCOntroler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      // margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.01),
              child: InkWell(
                child: Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.black,
                  size: 50,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Center(
              child: Text(
                "Item Form",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              child: Form(
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Item name'),
                      textInputAction: TextInputAction.next,
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Item Description'),
                      maxLines: 3,
                      // textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.multiline,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Container(
                        height: 150,
                        width: 350,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: 150,
                              height: 150,
                              child: TextFormField(
                                decoration: InputDecoration(labelText: 'Image Url'),
                                keyboardType: TextInputType.url,
                                controller: _imageEditingCOntroler,
                                textInputAction: TextInputAction.next,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                border: Border.all(width: 1, color: Colors.black),
                              ),
                              child: FittedBox(
                                child: _imageEditingCOntroler.text.isEmpty
                                    ? Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Text(
                                          "Add Image Url",
                                          style: TextStyle(fontSize: 5),
                                        ),
                                      )
                                    : Image.network(_imageEditingCOntroler.text),
                              ),
                            ),
                            Container(
                              width: 15,
                              child: IconButton(onPressed: null, icon: Icon(Icons.plus_one)),
                            )
                          ],
                        ),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 150,
                          child: TextFormField(
                            decoration: InputDecoration(labelText: 'Cast Name'),
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: 150,
                          child: TextFormField(
                            decoration: InputDecoration(labelText: 'Actor name'),
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                        Container(
                          width: 15,
                          child: IconButton(onPressed: null, icon: Icon(Icons.plus_one)),
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 150,
                          child: TextFormField(
                            decoration: InputDecoration(labelText: 'Name'),
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: 150,
                          child: TextFormField(
                            decoration: InputDecoration(labelText: 'Role'),
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                        Container(
                          width: 15,
                          child: IconButton(onPressed: null, icon: Icon(Icons.plus_one)),
                        )
                      ],
                    ),
                    Row(children: <Widget>[
                      Container(
                        width: 320,
                        child: TextFormField(
                          decoration: InputDecoration(labelText: 'Genre Type'),
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                      Container(
                        width: 15,
                        child: IconButton(onPressed: null, icon: Icon(Icons.plus_one)),
                      )
                    ]),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
