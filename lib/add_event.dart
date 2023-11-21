import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:hikkingfinder_web/main_screen.dart';
import 'package:hikkingfinder_web/services/firestore_methods.dart';
import 'package:hikkingfinder_web/utils/controllers.dart';
import 'package:hikkingfinder_web/utils/image.dart';
import 'package:hikkingfinder_web/utils/snakbar.dart';
import 'package:image_picker/image_picker.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({super.key});

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  Uint8List? _eventPhoto;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffa0a0a0),
      appBar: AppBar(
        backgroundColor: Colors.black,
        leadingWidth: 180,
        toolbarHeight: 120,
        leading: Image.asset(
          "assets/logo.png",
          height: 67,
          width: 121,
        ),
        title: Text(
          "Admin Page",
          style: TextStyle(
              color: Colors.white, fontSize: 38, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  height: 700,
                  width: 375,
                  color: Colors.black,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Event List",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Divider(
                          color: Colors.white,
                        ),
                      ),
                      ListTile(
                        leading: Column(
                          children: [
                            Text(
                              "11",
                              style: TextStyle(
                                  color: Color(0xffFFFF00),
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "July",
                              style: TextStyle(
                                  color: Color(0xffFFFF00), fontSize: 10),
                            )
                          ],
                        ),
                        title: Text(
                          "Snow Hike",
                          style: TextStyle(
                              color: Color(0xffFFFF00),
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        subtitle: Text(
                          "Laklouk, Mount lebanon",
                          style:
                              TextStyle(color: Color(0xffFFFF00), fontSize: 10),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios,
                            color: Color(0xffFFFF00)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Divider(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  margin: EdgeInsets.only(top: 120, bottom: 20),
                  color: Colors.black,
                  width: 600,
                  height: 800,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Event List",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Divider(
                            color: Colors.white,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Title",
                              style: TextStyle(
                                  color: Color(0xffFFFF00),
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: eventNameController,
                              decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: "Snow Hike",
                                  hintStyle: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 26)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Divider(
                            color: Colors.white,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Photo",
                              style: TextStyle(
                                  color: Color(0xffFFFF00),
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: _eventPhoto != null
                              ? InkWell(
                                  onTap: selectImage,
                                  child: Image.memory(
                                    _eventPhoto!,
                                    width: 335,
                                    height: 100,
                                    fit: BoxFit.fitHeight,
                                  ),
                                )
                              : InkWell(
                                  onTap: selectImage,
                                  child: Image.asset(
                                    "assets/m.png",
                                    height: 100,
                                  )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Divider(
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                  fixedSize: Size(176, 31),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(16.0)),
                                  backgroundColor: Color(0xff02D80A)),
                              onPressed: selectImage,
                              icon: Icon(
                                Icons.add_circle,
                                color: Colors.black,
                              ),
                              label: Text(
                                "Add Photo",
                                style: TextStyle(
                                    color: Color(0xff343434), fontSize: 10),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Divider(
                            color: Colors.white,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Description",
                              style: TextStyle(
                                  color: Color(0xffFFFF00),
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: eventDescriptionController,
                              maxLines: 6,
                              decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: "Write a Description",
                                  hintStyle: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Divider(
                            color: Colors.white,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Location",
                              style: TextStyle(
                                  color: Color(0xffFFFF00),
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: eventlocationController,
                              decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: "Eden Garden",
                                  hintStyle: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Divider(
                            color: Colors.white,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Date",
                              style: TextStyle(
                                  color: Color(0xffFFFF00),
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          width: 292,
                          margin: EdgeInsets.only(left: 20, right: 20),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: eventDateController,
                              decoration: InputDecoration(
                                  suffixIcon: Icon(Icons.calendar_month),
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: "23 Decemeber 2023",
                                  hintStyle: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Divider(
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Distance:",
                                      style: TextStyle(
                                          color: Color(0xffFFFF00),
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 170,
                                  margin: EdgeInsets.only(
                                    left: 20,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      controller: eventDistanceController,
                                      decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          filled: true,
                                          hintText: "23 KM",
                                          hintStyle: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Elevation",
                                      style: TextStyle(
                                          color: Color(0xffFFFF00),
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 170,
                                  margin: EdgeInsets.only(
                                    left: 20,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      controller: eventElevationControler,
                                      decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          filled: true,
                                          hintText: "1200 m",
                                          hintStyle: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Time",
                                      style: TextStyle(
                                          color: Color(0xffFFFF00),
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 170,
                                  margin: EdgeInsets.only(
                                    left: 20,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      controller: eventtimeController,
                                      decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          filled: true,
                                          hintText: "2 hr",
                                          hintStyle: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16)),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Divider(
                            color: Colors.white,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Event Page Link",
                              style: TextStyle(
                                  color: Color(0xffFFFF00),
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: eventPageController,
                              decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText:
                                      "www.facebook.com/eventlinkhere.com",
                                  hintStyle: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16)),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        fixedSize: Size(300, 66),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(16.0)),
                                        backgroundColor: Color(0xff02D80A)),
                                    onPressed: createEvent,
                                    child: _isLoading
                                        ? Center(
                                            child: CircularProgressIndicator(),
                                          )
                                        : Text(
                                            "Approve/ Publish",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16),
                                          )),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        fixedSize: Size(200, 66),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(16.0)),
                                        backgroundColor: Colors.red),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "Delete Event",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    )),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  //Functions
  void selectImage() async {
    Uint8List ui = await pickImage(ImageSource.gallery);
    setState(() {
      _eventPhoto = ui;
    });
  }

  void createEvent() async {
    setState(() {
      _isLoading = true;
    });
    String rse = await FirebaseMethods().createEvent(
        _eventPhoto!,
        eventlocationController.text,
        eventDateController.text,
        eventDescriptionController.text,
        eventNameController.text,
        eventElevationControler.text,
        eventDistanceController.text,
        eventtimeController.text,
        eventPageController.text);

    print(rse);
    setState(() {
      _isLoading = false;
    });
    if (rse != 'sucess') {
      showSnakBar(rse, context);
      eventlocationController.clear();
      eventNameController.clear();
      eventDescriptionController.clear();
      eventElevationControler.clear();
      eventDistanceController.clear();
      eventtimeController.clear();
      eventDateController.clear();
      eventPageController.clear();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (builder) => MainScreen()));
    } else {
      eventlocationController.clear();
      eventNameController.clear();
      eventDescriptionController.clear();
      eventElevationControler.clear();
      eventDistanceController.clear();
      eventtimeController.clear();
      eventDateController.clear();
      eventPageController.clear();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (builder) => MainScreen()));
    }
  }
}
// Future<void> addItems(List<String> itemList) async {
//   await itemsCollection.add({'values': itemList});
// }
