import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:location/location.dart' as l;
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Placemark> places = [];
  Future getLocation() async {
    LocationPermission permission;
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    final location = l.Location();
    late Position place;
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
    }
    if (serviceEnabled) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.always ||
          permission == LocationPermission.whileInUse) {
        // place = await location.getLocation();
        place = await Geolocator.getCurrentPosition();
      }
    }
    places = await placemarkFromCoordinates(
      place.latitude,
      place.longitude,
    );
    print(
      await placemarkFromCoordinates(
        place.latitude,
        place.longitude,
      )
        ..first.subLocality,
    );
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const SizedBox.shrink(),
        actions: [
          SizedBox(
            width: 24.w,
          ),
          Center(
            child: Text(
              'Exercises',
              textAlign: TextAlign.left,
              style: GoogleFonts.comfortaa(
                color: Color.fromRGBO(244, 244, 244, 1),
                fontSize: 24,
                fontWeight: FontWeight.normal,
                height: 1,
              ),
            ),
          ),
          const Spacer(),
          const Icon(
            Icons.search,
            color: Colors.white,
          ),
          SizedBox(
            width: 24.w,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 519,
                height: 300,
                color: Color(0xFFBF0B4C),
                child: Stack(
                  children: <Widget>[
                    // Positioned(top: 0, left: 0, child: null),
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                        width: 447,
                        height: 300,
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              top: 0,
                              left: 221,
                              child: Container(
                                width: 226,
                                height: 225,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color:
                                        const Color.fromRGBO(244, 140, 166, 1),
                                    width: 10,
                                  ),
                                  // color: Color(0xFFBF0B4C),
                                  borderRadius: const BorderRadius.all(
                                    Radius.elliptical(226, 225),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 7,
                              left: 0,
                              child: Container(
                                width: 293,
                                height: 293,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: const Color.fromRGBO(191, 11, 76, 1),
                                    width: 20,
                                  ),
                                  color:
                                      const Color(0xFFEA3A6A).withOpacity(0.5),
                                  borderRadius: const BorderRadius.all(
                                    Radius.elliptical(293, 293),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 150,
                  ),
                  CarouselSlider(
                    items: List.generate(
                      4,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.asset(
                            "assets/pngs/banner$index.jpg",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    options: CarouselOptions(
                      viewportFraction: 1,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "Top picks near you",
                    style: GoogleFonts.comfortaa(
                      color: const Color.fromRGBO(20, 20, 20, 1),
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      height: 1,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => SizedBox(
                        height: 184,
                        width: 257,
                        child: Card(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          elevation: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Image.asset(
                                  "assets/pngs/gym_${index + 1}.jpg",
                                  fit: BoxFit.cover,
                                  height: 128,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 9.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Gold's gym",
                                      style: GoogleFonts.comfortaa(
                                          color: Color.fromRGBO(20, 20, 20, 1),
                                          fontSize: 14,
                                          letterSpacing:
                                              0 /*percentages not used in flutter. defaulting to zero*/,
                                          fontWeight: FontWeight.normal,
                                          height: 1),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Rs. 40/day",
                                          style: GoogleFonts.comfortaa(
                                            color:
                                                Color.fromRGBO(47, 46, 46, 1),
                                            fontSize: 12,
                                            letterSpacing:
                                                0 /*percentages not used in flutter. defaulting to zero*/,
                                            fontWeight: FontWeight.normal,
                                            height: 1,
                                          ),
                                        ),
                                        const Spacer(),
                                        Text(
                                          "4.${index + 1}",
                                          style: GoogleFonts.comfortaa(
                                            color:
                                                Color.fromRGBO(47, 46, 46, 1),
                                            fontSize: 12,
                                            letterSpacing:
                                                0 /*percentages not used in flutter. defaulting to zero*/,
                                            fontWeight: FontWeight.normal,
                                            height: 1,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Text(
                    "Top Offers",
                    style: GoogleFonts.comfortaa(
                      color: const Color.fromRGBO(20, 20, 20, 1),
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      height: 1,
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4),
                    itemBuilder: (context, index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          "assets/banner$index",
                          height: 40,
                          width: 40,
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 220,
                    width: double.infinity,
                    child: ListView.builder(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => ConstrainedBox(
                        constraints: const BoxConstraints.tightFor(
                          height: 184,
                          width: 257,
                        ),
                        child: Card(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          elevation: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Image.asset(
                                  "assets/pngs/gym_${index + 1}.jpg",
                                  fit: BoxFit.cover,
                                  height: 128,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 9.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Gold's gym",
                                      style: GoogleFonts.comfortaa(
                                          color: Color.fromRGBO(20, 20, 20, 1),
                                          fontSize: 14,
                                          letterSpacing:
                                              0 /*percentages not used in flutter. defaulting to zero*/,
                                          fontWeight: FontWeight.normal,
                                          height: 1),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Rs. ${35 / (index + 1)}/day",
                                          style: GoogleFonts.comfortaa(
                                            color:
                                                Color.fromRGBO(47, 46, 46, 1),
                                            fontSize: 12,
                                            letterSpacing:
                                                0 /*percentages not used in flutter. defaulting to zero*/,
                                            fontWeight: FontWeight.normal,
                                            height: 1,
                                          ),
                                        ),
                                        const Spacer(),
                                        Text(
                                          "4.${index + 1}",
                                          style: GoogleFonts.comfortaa(
                                            color:
                                                Color.fromRGBO(47, 46, 46, 1),
                                            fontSize: 12,
                                            letterSpacing:
                                                0 /*percentages not used in flutter. defaulting to zero*/,
                                            fontWeight: FontWeight.normal,
                                            height: 1,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      //  Padding(
      //   padding: EdgeInsets.symmetric(horizontal: 16.w),
      //   child: SingleChildScrollView(
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         SizedBox(
      //           height: 250,
      //           child: CarouselSlider(
      //             items: [
      //               Padding(
      //                 padding: const EdgeInsets.all(8.0),
      //                 child: Image.asset(
      //                   "assets/pngs/banner1.jpg",
      //                   fit: BoxFit.cover,
      //                 ),
      //               ),
      //               Padding(
      //                 padding: const EdgeInsets.all(8.0),
      //                 child: Image.asset(
      //                   "assets/pngs/banner2.jpg",
      //                   fit: BoxFit.cover,
      //                 ),
      //               ),
      //               Padding(
      //                 padding: const EdgeInsets.all(8.0),
      //                 child: Image.asset(
      //                   "assets/pngs/banner3.jpg",
      //                   fit: BoxFit.cover,
      //                 ),
      //               ),
      //             ],
      //             options: CarouselOptions(),
      //           ),
      //         ),
      //         const SizedBox(
      //           height: 30,
      //         ),
      //         Align(
      //           alignment: Alignment.centerLeft,
      //           child: Text(
      //             "Top Gyms in your area",
      //             style: TextStyle(
      //               color: Colors.black,
      //               fontSize: 24.sp,
      //               fontWeight: FontWeight.bold,
      //             ),
      //           ),
      //         ),
      //         SizedBox(
      //           height: 100,
      //           width: double.infinity,
      //           child: SingleChildScrollView(
      //             scrollDirection: Axis.horizontal,
      //             child: Row(
      //               children: List.generate(
      //                 4,
      //                 (index) => Padding(
      //                   padding: const EdgeInsets.only(right: 8.0),
      //                   child: ClipRRect(
      //                     borderRadius: BorderRadius.circular(8.0),
      //                     child: Image.asset(
      //                       "assets/pngs/gym_${index + 1}.jpg",
      //                       height: 100,
      //                       width: 100,
      //                       fit: BoxFit.contain,
      //                     ),
      //                   ),
      //                 ),
      //               ),
      //             ),
      //           ),
      //         ),
      //         places.isEmpty || places == null
      //             ? const Center(
      //                 child: CircularProgressIndicator(
      //                   color: Color(0xFF49EEAF),
      //                 ),
      //               )
      //             : ListView.builder(
      //                 shrinkWrap: true,
      //                 physics: const NeverScrollableScrollPhysics(),
      //                 itemCount: 8,
      //                 itemBuilder: (context, index) {
      //                   return ListTile(
      //                     leading: Image.asset(
      //                       "assets/pngs/gym_${index + 1}.jpg",
      //                       // fit: BoxFit.cover,
      //                       width: 150,
      //                       height: 150,
      //                     ),
      //                     title: Text(
      //                       "Gym ${index + 1}",
      //                       style: const TextStyle(
      //                         color: Color(0xFF49EEAF),
      //                         // fontSize: 30.sp,
      //                         fontWeight: FontWeight.bold,
      //                       ),
      //                     ),
      //                     subtitle: Text(
      //                       "Place: ${places[index].locality}",
      //                       // style: TextStyle(
      //                       //   color: Colors.black,
      //                       //   fontSize: 24.sp,
      //                       // ),
      //                     ),
      //                     trailing: ElevatedButton(
      //                       onPressed: () {
      //                         showDatePicker(
      //                           context: context,
      //                           initialDate: DateTime.now(),
      //                           firstDate: DateTime.now(),
      //                           lastDate: DateTime(2023),
      //                         );
      //                       },
      //                       style: ElevatedButton.styleFrom(
      //                         primary: const Color(0xFF49EEAF),
      //                       ),
      //                       child: Text(
      //                         "Book Gym",
      //                         style: TextStyle(
      //                           color: Colors.white,
      //                           fontSize: 20.sp,
      //                         ),
      //                       ),
      //                     ),
      //                   );
      //                   // Card(
      //                   //   margin: EdgeInsets.only(
      //                   //     top: 30.h,
      //                   //   ),
      //                   //   child: Padding(
      //                   //     padding: const EdgeInsets.symmetric(
      //                   //       horizontal: 8.0,
      //                   //       vertical: 4.0,
      //                   //     ),
      //                   //     child: Column(
      //                   //       crossAxisAlignment: CrossAxisAlignment.start,
      //                   //       children: [
      //                   //         Image.asset(
      //                   //           "assets/pngs/gym_1.png",
      //                   //           height: 200,
      //                   //           width: double.maxFinite,
      //                   //         ),
      //                   //         SizedBox(
      //                   //           height: 10.h,
      //                   //         ),
      //                   //         Row(
      //                   //           children: [
      //                   //             Column(
      //                   //               crossAxisAlignment:
      //                   //                   CrossAxisAlignment.start,
      //                   //               children: [
      //                   // Text(
      //                   //   "Gym ${index + 1}",
      //                   //   style: TextStyle(
      //                   //     color: const Color(0xFF49EEAF),
      //                   //     fontSize: 30.sp,
      //                   //     fontWeight: FontWeight.bold,
      //                   //   ),
      //                   // ),
      //                   // Text(
      //                   //   "Place: ${places[index].locality}",
      //                   //   style: TextStyle(
      //                   //     color: Colors.black,
      //                   //     fontSize: 24.sp,
      //                   //   ),
      //                   // ),
      //                   //               ],
      //                   //             ),
      //                   //             const Spacer(),
      //                   // ElevatedButton(
      //                   //   onPressed: () {
      //                   //     showDatePicker(
      //                   //       context: context,
      //                   //       initialDate: DateTime.now(),
      //                   //       firstDate: DateTime.now(),
      //                   //       lastDate: DateTime(2023),
      //                   //     );
      //                   //   },
      //                   //   style: ElevatedButton.styleFrom(
      //                   //     primary: const Color(0xFF49EEAF),
      //                   //   ),
      //                   //   child: Text(
      //                   //     "Book Gym",
      //                   //     style: TextStyle(
      //                   //       color: Colors.white,
      //                   //       fontSize: 20.sp,
      //                   //     ),
      //                   //   ),
      //                   // ),
      //                   //           ],
      //                   //         ),
      //                   //       ],
      //                   //     ),
      //                   //   ),
      //                   // );
      //                 },
      //               ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
