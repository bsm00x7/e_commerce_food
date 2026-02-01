import 'package:e_commerce_food/manger/mager_image.dart';
import 'package:e_commerce_food/manger/manger_name.dart';
import 'package:e_commerce_food/services_ads_storage_local/preference_manager.dart';
import 'package:e_commerce_food/viwes/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnbordingScreenName extends StatefulWidget {
  const OnbordingScreenName({super.key});

  @override
  State<OnbordingScreenName> createState() => _OnbordingScreenNameState();
}

class _OnbordingScreenNameState extends State<OnbordingScreenName> {
  late final TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 60),
          Container(
            height: size.height * 0.6,
            width: size.width,
            decoration: BoxDecoration(color: Color(0xffFFA451)),
            child: Center(
              child: Image.asset(
                ManagerImage.kisspngFruitBasket,
                height: 400,
                width: 500,
              ),
            ),
          ),
          SizedBox(height: size.height * 0.04),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "What is your First Name?",
                style: GoogleFonts.roboto(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff27214D),
                ),
              ),
              SizedBox(height: 40),
              SizedBox(
                width: size.width * 0.9,
                child: TextField(
                  controller: _nameController,
                  style: TextStyle(fontSize: 20),
                  autocorrect: true,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                    hintText: 'Exemple : Bassem',
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 40,
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.08),
              ElevatedButton(
                onPressed: () {
                  if (_nameController.text.trim().isNotEmpty) {
                    PreferenceManager().setString(
                      MangerName.firstName,
                      _nameController.text.trim(),
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Please enter your name",
                          style: TextStyle(fontSize: 23),
                        ),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffFFA451),
                  foregroundColor: Color(0XFFFFFFFF),
                  minimumSize: Size(size.width * 0.9, 70),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text("Let's Continue", style: TextStyle(fontSize: 24)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
