import 'package:drop_shadow/drop_shadow.dart';
import 'package:flag/flag_enum.dart';
import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hikkingfinder_web/event_page.dart';
import 'package:hikkingfinder_web/site_details.dart';

class TabSearch extends StatefulWidget {
  const TabSearch({super.key});

  @override
  State<TabSearch> createState() => _TabSearchState();
}

class _TabSearchState extends State<TabSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
              height: MediaQuery.of(context).size.height / 1.4,
              width: MediaQuery.of(context).size.width,
              // color: Color(0xffa8a8a8),
              color: Color(0xff2a2a2a),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Your search results for 'Hiking'",
                      style: TextStyle(color: Color(0xffFFFF00), fontSize: 10),
                    ),
                  ),
                  Container(
                      height: 200,
                      child: InkWell(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (builder) => SiteDetail()));
                        },
                        child: Container(
                            height: 200,
                            child: Stack(
                              children: [
                                InkWell(
                                  onTap: () {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (builder) =>
                                    //             SiteDetail()));
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
                                                fontWeight: FontWeight.bold),
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
                                                fontWeight: FontWeight.normal),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                                    margin:
                                        EdgeInsets.only(left: 10, bottom: 25),
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
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            )),
                      ))
                ],
              ),
            ),
            Container(
              height: 84,
              width: 700,
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
