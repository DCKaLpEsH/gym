import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool otpPressed = false;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
        maxHeight: MediaQuery.of(context).size.height,
      ),
      designSize: const Size(375, 812),
      context: context,
      minTextAdapt: true,
      orientation: Orientation.portrait,
    );
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(
            FocusNode(),
          );
        },
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFF48CA6),
                Color(0xFFEA3A6A),
                Color(0xFFBF0B4C),
              ],
              begin: Alignment(-0.3, -1),
              end: Alignment(-1.3, 1.3),
            ),
          ),
          child: Stack(
            children: [
              Center(
                child: SvgPicture.asset(
                  "assets/svgs/login_container.svg",
                  // width: 327.w,
                  // height: 449.h,
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 48.w),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello !",
                          style: GoogleFonts.comfortaa(
                            fontSize: 24.sp,
                            color: const Color(0xFFBF0B4C),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 48.h,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            border: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFACACAC),
                              ),
                            ),
                            hintText: "   Username",
                            alignLabelWithHint: true,
                            hintStyle: GoogleFonts.comfortaa(
                              fontSize: 16,
                              color: const Color(0xFF686666),
                              fontWeight: FontWeight.bold,
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFBF0B4C),
                              ),
                            ),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFACACAC),
                              ),
                            ),
                            errorBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFACACAC),
                              ),
                            ),
                            prefixIcon: SvgPicture.asset(
                              "assets/svgs/person.svg",
                              fit: BoxFit.contain,
                            ),
                            prefixIconConstraints: BoxConstraints(
                              maxHeight: 24.h,
                              maxWidth: 30.w,
                            ),
                          ),
                          cursorColor: const Color(0xFFBF0B4C),
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        TextField(
                          cursorColor: const Color(0xFFBF0B4C),
                          decoration: InputDecoration(
                            border: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFACACAC),
                              ),
                            ),
                            hintText: "   Password",
                            hintStyle: GoogleFonts.comfortaa(
                              fontSize: 16,
                              color: const Color(0xFF686666),
                              fontWeight: FontWeight.bold,
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFACACAC),
                              ),
                            ),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFACACAC),
                              ),
                            ),
                            errorBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFACACAC),
                              ),
                            ),
                            prefixIcon: SvgPicture.asset(
                              "assets/svgs/lock.svg",
                              fit: BoxFit.contain,
                            ),
                            prefixIconConstraints: BoxConstraints(
                              maxHeight: 24.h,
                              maxWidth: 24.w,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        Text(
                          "Forgot Password?",
                          style: GoogleFonts.comfortaa(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF686666),
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        InkWell(
                          onTap: () {
                            print(
                              "pushed",
                            );
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomeScreen(),
                                ));
                          },
                          child: Container(
                            height: 70.h,
                            width: 280.w,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xFFEA3A6A),
                                  Color(0xFFBF0B4C),
                                  Color(0xFFEA3A6A),
                                ],
                                begin: Alignment(1.5, -1.3),
                                end: Alignment(-1.5, 1.3),
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(50),
                              ),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              'Login',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.comfortaa(
                                color: const Color.fromRGBO(248, 248, 248, 1),
                                fontSize: 16.sp,
                                fontWeight: FontWeight.normal,
                                height: 1,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        // SingleChildScrollView(
        //   padding: EdgeInsets.symmetric(
        //     horizontal: 47.w,
        //   ),
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       Center(
        //         child: Text(
        //           "Enter your Phone Number",
        //           style: TextStyle(
        //             color: const Color(0xFF1C3144),
        //             fontSize: 32.sp,
        //             fontWeight: FontWeight.bold,
        //           ),
        //         ),
        //       ),
        //       SizedBox(
        //         height: 62.h,
        //       ),
        //       Text(
        //         "Phone Number",
        //         style: TextStyle(
        //           color: const Color(0xFF1C3144),
        //           fontSize: 26.sp,
        //           fontWeight: FontWeight.bold,
        //         ),
        //       ),
        //       SizedBox(
        //         height: 20.h,
        //       ),
        //       TextField(
        //         decoration: const InputDecoration(
        //           border: UnderlineInputBorder(),
        //           focusedBorder: UnderlineInputBorder(),
        //           enabledBorder: UnderlineInputBorder(),
        //           errorBorder: UnderlineInputBorder(),
        //         ),
        //         style: TextStyle(
        //           color: const Color(0xFF49EEAF),
        //           fontSize: 24.sp,
        //         ),
        //         keyboardType: TextInputType.number,
        //       ),
        //       SizedBox(
        //         height: 62.h,
        //       ),
        //       Text(
        //         "Enter OTP",
        //         style: TextStyle(
        //           color: const Color(0xFF1C3144),
        //           fontSize: 26.sp,
        //           fontWeight: FontWeight.bold,
        //         ),
        //       ),
        //       SizedBox(
        //         height: 20.h,
        //       ),
        //       TextField(
        //         decoration: const InputDecoration(
        //           border: UnderlineInputBorder(),
        //           focusedBorder: UnderlineInputBorder(),
        //           enabledBorder: UnderlineInputBorder(),
        //           errorBorder: UnderlineInputBorder(),
        //         ),
        //         style: TextStyle(
        //           color: const Color(0xFF49EEAF),
        //           fontSize: 24.sp,
        //         ),
        //         keyboardType: TextInputType.number,
        //       ),
        //       SizedBox(
        //         height: 20.h,
        //       ),
        //       SizedBox(
        //         width: double.maxFinite,
        //         child: ElevatedButton(
        //           style: ButtonStyle(
        //             shape: MaterialStateProperty.all(
        //               const StadiumBorder(),
        //             ),
        //             backgroundColor: MaterialStateProperty.all(
        //               const Color(0xFF49EEAF),
        //             ),
        //           ),
        //           onPressed: () {
        //             setState(() {
        //               otpPressed = true;
        //             });
        //             if (otpPressed) {
        //               Navigator.push(
        //                 context,
        //                 MaterialPageRoute(
        //                   builder: (context) => const HomeScreen(),
        //                 ),
        //               );
        //             }
        //           },
        //           child: Text(
        //             otpPressed ? "Sign In" : "Get OTP",
        //             style: TextStyle(
        //               color: Colors.white,
        //               fontSize: 24.sp,
        //             ),
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}

// class RectClipper extends CustomClipper<RRect> {
//   @override
//   RRect getClip(Size size) {
//     RRect rect = RRect();
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<RRect> oldClipper) {
//     return true;
//   }
// }