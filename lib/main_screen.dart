import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drop_shadow/drop_shadow.dart';
import 'package:flutter/material.dart';
import 'package:flag/flag.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hikkingfinder_web/add_event.dart';
import 'package:hikkingfinder_web/event_page.dart';
import 'package:hikkingfinder_web/site_details.dart';
import 'package:hikkingfinder_web/tab_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xffffff00),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (builder) => AddEvent()));
        },
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      backgroundColor: Color(0xff343434),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 135,
              color: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Image.asset(
                          "assets/logo.png",
                          height: 67,
                          width: 121,
                        ),
                      ),
                    ],
                  ),
                  Expanded(child: Container()),
                  Expanded(
                    child: Container(
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(8)),
                      width: 384,
                      height: 26,
                      child: TextField(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (builder) => TabSearch()));
                        },
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(top: 8, left: 8),
                            errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xffedeef0),
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xffedeef0),
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xffedeef0),
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            filled: true,
                            fillColor: Color(0xffedeef0),
                            hintText: "Search",
                            hintStyle: TextStyle(color: Color(0xffcfd2da)),
                            suffixIcon: Icon(
                              Icons.search,
                              color: Color(0xffcfd2da),
                            )),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Directionality(
                      textDirection: TextDirection.rtl,
                      child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              fixedSize: Size(147, 24),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              backgroundColor: Color(0xffffff00)),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (builder) => EventPage()));
                          },
                          icon: Icon(
                            Icons.calendar_month,
                            color: Colors.black,
                          ),
                          label: Text(
                            "Event Calender",
                            style: TextStyle(color: Colors.black, fontSize: 10),
                          ))),
                  SizedBox(
                    width: 10,
                  ),
                  Flag.fromCode(
                    FlagsCode.LB,
                    height: 50,
                    width: 50,
                    borderRadius: 50,
                    fit: BoxFit.fill,
                  ),
                ],
              ),
            ),
            Container(
              height: 84,
              width: 714,
              color: Color(0xffaca7a7),
              child: Center(
                  child: Text(
                "ADS HERE",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              )),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 1.4,
              width: MediaQuery.of(context).size.width,
              // color: Color(0xffa8a8a8),
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Hikking",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        ),
                      ),
                      Container(
                        height: 220,
                        child: StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection("events")
                                .snapshots(),
                            builder: (BuildContext context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              return ListView.builder(
                                  itemCount: snapshot.data!.docs.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: ((context, index) {
                                    var data = snapshot.data!.docs[index];

                                    return InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (builder) =>
                                                    SiteDetail(
                                                      name: data['eventName'],
                                                      date: data['eventDate'],
                                                      description: data[
                                                          'eventDescription'],
                                                      elevation: data[
                                                          'eventElevation'],
                                                      photo: data['eventPhoto'],
                                                      time: data['eventTime'],
                                                      distance:
                                                          data['eventDistance'],
                                                      location:
                                                          data['eventLocation'],
                                                    )));
                                      },
                                      child: Card(
                                        color: Colors.transparent,
                                        child: Container(
                                            height: 200,
                                            child: Stack(
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder:
                                                                (builder) =>
                                                                    SiteDetail(
                                                                      name: data[
                                                                          'eventName'],
                                                                      date: data[
                                                                          'eventDate'],
                                                                      description:
                                                                          data[
                                                                              'eventDescription'],
                                                                      elevation:
                                                                          data[
                                                                              'eventElevation'],
                                                                      photo: data[
                                                                          'eventPhoto'],
                                                                      time: data[
                                                                          'eventTime'],
                                                                      distance:
                                                                          data[
                                                                              'eventDistance'],
                                                                      location:
                                                                          data[
                                                                              'eventLocation'],
                                                                    )));
                                                  },
                                                  child: Card(
                                                    child: Image.network(
                                                      data['eventPhoto']
                                                          .toString(),
                                                      width: 150,
                                                      height: 200,
                                                      fit: BoxFit.fill,
                                                      filterQuality:
                                                          FilterQuality.high,
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  left: 80,
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        top: 10),
                                                    decoration: BoxDecoration(
                                                        color:
                                                            Color(0xffffff00),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(40)),
                                                    width: 60,
                                                    height: 30,
                                                    child: Center(
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            data[
                                                                'eventDistance'],
                                                            style: GoogleFonts
                                                                .poppins(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize: 9,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                          const SizedBox(
                                                            width: 3,
                                                          ),
                                                          Text(
                                                            "KM",
                                                            style: GoogleFonts.poppins(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 9,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal),
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          left: 20),
                                                      child: Text(
                                                        data['eventName'],
                                                        style:
                                                            GoogleFonts.poppins(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Align(
                                                  alignment:
                                                      Alignment.bottomLeft,
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        left: 10, bottom: 25),
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        Icon(
                                                          Icons.location_pin,
                                                          color:
                                                              Color(0xffffff00),
                                                          size: 12,
                                                        ),
                                                        Text(
                                                          data['eventLocation'],
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 9,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )),
                                      ),
                                    );
                                  }));
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Camping",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        ),
                      ),
                      Container(
                        height: 220,
                        child: StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection("events")
                                .snapshots(),
                            builder: (BuildContext context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              return ListView.builder(
                                  itemCount: snapshot.data!.docs.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: ((context, index) {
                                    var data = snapshot.data!.docs[index];

                                    return InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (builder) =>
                                                    SiteDetail(
                                                      name: data['eventName'],
                                                      date: data['eventDate'],
                                                      description: data[
                                                          'eventDescription'],
                                                      elevation: data[
                                                          'eventElevation'],
                                                      photo: data['eventPhoto'],
                                                      time: data['eventTime'],
                                                      distance:
                                                          data['eventDistance'],
                                                      location:
                                                          data['eventLocation'],
                                                    )));
                                      },
                                      child: Card(
                                        color: Colors.transparent,
                                        child: Container(
                                            height: 200,
                                            child: Stack(
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder:
                                                                (builder) =>
                                                                    SiteDetail(
                                                                      name: data[
                                                                          'eventName'],
                                                                      date: data[
                                                                          'eventDate'],
                                                                      description:
                                                                          data[
                                                                              'eventDescription'],
                                                                      elevation:
                                                                          data[
                                                                              'eventElevation'],
                                                                      photo: data[
                                                                          'eventPhoto'],
                                                                      time: data[
                                                                          'eventTime'],
                                                                      distance:
                                                                          data[
                                                                              'eventDistance'],
                                                                      location:
                                                                          data[
                                                                              'eventLocation'],
                                                                    )));
                                                  },
                                                  child: Card(
                                                    child: Image.network(
                                                      data['eventPhoto']
                                                          .toString(),
                                                      width: 150,
                                                      height: 200,
                                                      fit: BoxFit.fill,
                                                      filterQuality:
                                                          FilterQuality.high,
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  left: 80,
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        top: 10),
                                                    decoration: BoxDecoration(
                                                        color:
                                                            Color(0xffffff00),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(40)),
                                                    width: 60,
                                                    height: 30,
                                                    child: Center(
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            data[
                                                                'eventDistance'],
                                                            style: GoogleFonts
                                                                .poppins(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize: 9,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                          const SizedBox(
                                                            width: 3,
                                                          ),
                                                          Text(
                                                            "KM",
                                                            style: GoogleFonts.poppins(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 9,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal),
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          left: 20),
                                                      child: Text(
                                                        data['eventName'],
                                                        style:
                                                            GoogleFonts.poppins(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Align(
                                                  alignment:
                                                      Alignment.bottomLeft,
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        left: 10, bottom: 25),
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        Icon(
                                                          Icons.location_pin,
                                                          color:
                                                              Color(0xffffff00),
                                                          size: 12,
                                                        ),
                                                        Text(
                                                          data['eventLocation'],
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 9,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )),
                                      ),
                                    );
                                  }));
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Off-Roading",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        ),
                      ),
                      Container(
                        height: 220,
                        child: StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection("events")
                                .snapshots(),
                            builder: (BuildContext context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              return ListView.builder(
                                  itemCount: snapshot.data!.docs.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: ((context, index) {
                                    var data = snapshot.data!.docs[index];

                                    return InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (builder) =>
                                                    SiteDetail(
                                                      name: data['eventName'],
                                                      date: data['eventDate'],
                                                      description: data[
                                                          'eventDescription'],
                                                      elevation: data[
                                                          'eventElevation'],
                                                      photo: data['eventPhoto'],
                                                      time: data['eventTime'],
                                                      distance:
                                                          data['eventDistance'],
                                                      location:
                                                          data['eventLocation'],
                                                    )));
                                      },
                                      child: Card(
                                        color: Colors.transparent,
                                        child: Container(
                                            height: 200,
                                            child: Stack(
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder:
                                                                (builder) =>
                                                                    SiteDetail(
                                                                      name: data[
                                                                          'eventName'],
                                                                      date: data[
                                                                          'eventDate'],
                                                                      description:
                                                                          data[
                                                                              'eventDescription'],
                                                                      elevation:
                                                                          data[
                                                                              'eventElevation'],
                                                                      photo: data[
                                                                          'eventPhoto'],
                                                                      time: data[
                                                                          'eventTime'],
                                                                      distance:
                                                                          data[
                                                                              'eventDistance'],
                                                                      location:
                                                                          data[
                                                                              'eventLocation'],
                                                                    )));
                                                  },
                                                  child: Card(
                                                    child: Image.network(
                                                      data['eventPhoto']
                                                          .toString(),
                                                      width: 150,
                                                      height: 200,
                                                      fit: BoxFit.fill,
                                                      filterQuality:
                                                          FilterQuality.high,
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  left: 80,
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        top: 10),
                                                    decoration: BoxDecoration(
                                                        color:
                                                            Color(0xffffff00),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(40)),
                                                    width: 60,
                                                    height: 30,
                                                    child: Center(
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            data[
                                                                'eventDistance'],
                                                            style: GoogleFonts
                                                                .poppins(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize: 9,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                          const SizedBox(
                                                            width: 3,
                                                          ),
                                                          Text(
                                                            "KM",
                                                            style: GoogleFonts.poppins(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 9,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal),
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          left: 20),
                                                      child: Text(
                                                        data['eventName'],
                                                        style:
                                                            GoogleFonts.poppins(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Align(
                                                  alignment:
                                                      Alignment.bottomLeft,
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        left: 10, bottom: 25),
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        Icon(
                                                          Icons.location_pin,
                                                          color:
                                                              Color(0xffffff00),
                                                          size: 12,
                                                        ),
                                                        Text(
                                                          data['eventLocation'],
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 9,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )),
                                      ),
                                    );
                                  }));
                            }),
                      ),
                    ]),
              ),
            ),
            Container(
              height: 84,
              width: 714,
              color: Color(0xffaca7a7),
              child: Center(
                  child: Text(
                "ADS HERE",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              )),
            ),
            Container(
              height: 84,
              width: 714,
              child: Center(
                  child: Text(
                "CopyRight: 2023 - Hikking App",
                style: TextStyle(color: Colors.white, fontSize: 10),
                textAlign: TextAlign.center,
              )),
            ),
          ],
        ),
      ),
    );
  }
}
