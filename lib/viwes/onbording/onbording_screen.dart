import 'package:e_commerce_food/manger/mager_image.dart';
import 'package:e_commerce_food/viwes/onbording/onbording_name.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnbordingScreen extends StatelessWidget {
  const OnbordingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: .center,
        children: [
          SizedBox(height: 60),
          Container(
            height: size.height * 0.6,
            width: size.width,
            decoration: BoxDecoration(color: Color(0xffFFA451)),
            child: Center(
              child: Image.asset(
                ManagerImage.fruitBasket,
                height: 300,
                width: 300,
              ),
            ),
          ),
          SizedBox(height: size.height * 0.04),
          Column(
            crossAxisAlignment: .start,
            children: [
              Text(
                "Get The Freshest Fruit Salad Combo",
                style: GoogleFonts.roboto(
                  fontSize: 29,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff27214D),
                ),
              ),
              SizedBox(height: 10),
              Text(
                "We deliver the best and freshest fruit salad  \n in town. Order for a combo today!!!",
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff5D577E),
                ),
              ),
              SizedBox(height: size.height * 0.1),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OnbordingScreenName(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffFFA451),
                  foregroundColor: Color(0XFFFFFFFF),
                  minimumSize: Size(size.width * 0.9, 70),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text("Let’s Continue", style: TextStyle(fontSize: 24)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
