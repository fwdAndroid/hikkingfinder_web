import 'package:carousel_slider/carousel_slider.dart';
import 'package:flag/flag_enum.dart';
import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hikkingfinder_web/event_page.dart';
import 'package:hikkingfinder_web/tab_screen.dart';

class SiteDetail extends StatefulWidget {
  const SiteDetail({super.key});

  @override
  State<SiteDetail> createState() => _SiteDetailState();
}

class _SiteDetailState extends State<SiteDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2a2a2a),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            SizedBox(
              height: 200,
              child: Stack(
                children: [
                  Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            stops: [
                              0.1,
                              0.4,
                              0.6,
                              0.9,
                            ],
                            colors: [
                              Color(0xff2A2A2A00),
                              Color(0xff2A2A2AE6),
                              Color(0xff2A2A2A),
                              Color(0xff2A2A2A),
                            ],
                          )),
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      child: CarouselSlider(
                          options: CarouselOptions(
                            aspectRatio: 2.0,
                            autoPlay: true,
                            enlargeCenterPage: true,
                            enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                            enlargeFactor: 0.4,
                          ),
                          items: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                "assets/m.png",
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ].toList())),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 30, left: 20),
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Text(
                'Hikking Laklout together',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 24),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 196,
                    width: 711,
                    child: Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.white.withOpacity(.8),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.location_pin,
                              color: Color(0xffffff00),
                              size: 15,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text("Laklouk, Mount lebanon   ",
                                style: GoogleFonts.poppins(
                                    color: Color(0xffA0A0A0),
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.calendar_month,
                                color: Color(0xffffff00),
                                size: 15,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text("Saturday,12 June,6:00 am",
                                  style: GoogleFonts.poppins(
                                      color: Color(0xffA0A0A0),
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10, bottom: 10),
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  Image.asset("assets/lc.png"),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "Distance",
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          color: Color(0xffA0A0A0),
                                        ),
                                      ),
                                      Text(
                                        "32 KM",
                                        style: TextStyle(
                                          color: Color(0xffffff00),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Row(
                                children: [
                                  Image.asset("assets/lp.png"),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "Elevation",
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          color: Color(0xffA0A0A0),
                                        ),
                                      ),
                                      Text(
                                        "2456 M",
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: Color(0xffffff00),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Row(
                                children: [
                                  Image.asset("assets/lg.png"),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "Time",
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          color: Color(0xffA0A0A0),
                                        ),
                                      ),
                                      Text(
                                        "8 h",
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: Color(0xffffff00),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Center(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(1000, 38),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0)),
                        backgroundColor: Color(0xffffff00)),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (builder) => EventPage()));
                    },
                    child: Text(
                      "Go to Event Page",
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    )),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              color: Color(0xffaca7a7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Other Events By the same organizer:",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Container(
                    height: 200,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: ((context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (builder) => SiteDetail()));
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
                                                  builder: (builder) =>
                                                      SiteDetail()));
                                        },
                                        child: Card(
                                          child: Image.asset(
                                            "assets/m.png",
                                            width: 150,
                                            height: 200,
                                            fit: BoxFit.fill,
                                            filterQuality: FilterQuality.high,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 80,
                                        child: Container(
                                          margin: EdgeInsets.only(top: 10),
                                          decoration: BoxDecoration(
                                              color: Color(0xffffff00),
                                              borderRadius:
                                                  BorderRadius.circular(40)),
                                          width: 60,
                                          height: 30,
                                          child: Center(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "35",
                                                  style: GoogleFonts.poppins(
                                                      color: Colors.black,
                                                      fontSize: 9,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  textAlign: TextAlign.center,
                                                ),
                                                const SizedBox(
                                                  width: 3,
                                                ),
                                                Text(
                                                  "KM",
                                                  style: GoogleFonts.poppins(
                                                      color: Colors.black,
                                                      fontSize: 9,
                                                      fontWeight:
                                                          FontWeight.normal),
                                                  textAlign: TextAlign.center,
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
                                            margin: EdgeInsets.only(left: 20),
                                            child: Text(
                                              "Hikking\nLakout\ntogether",
                                              style: GoogleFonts.poppins(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              left: 10, bottom: 25),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Icon(
                                                Icons.location_pin,
                                                color: Color(0xffffff00),
                                                size: 12,
                                              ),
                                              Text(
                                                "Laklouk, Mnt Leb.",
                                                style: GoogleFonts.poppins(
                                                    color: Colors.white,
                                                    fontSize: 9,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                            ),
                          );
                        })),
                  ),
                ],
              ),
            ),
            Center(
              child: Container(
                height: 84,
                width: 714,
                child: Center(
                    child: Text(
                  "CopyRight: 2023 - Hikking App",
                  style: TextStyle(color: Colors.white, fontSize: 10),
                  textAlign: TextAlign.center,
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
