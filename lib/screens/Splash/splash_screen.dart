import 'package:car_rental_app/constants.dart';
import 'package:car_rental_app/screens/Home/car_home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          // Car Image Positioned
          Positioned(
            top: -25,
            right: 55,
            child: Container(
              height: 700,
              width: 500,
              child: Image(
                image: AssetImage('Images/image 27.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Title Text Positioned
          Positioned(
            bottom: 200,
            left: 20, // Directly use left instead of wrapping in Padding
            child: Text(
              'Premium cars. \nEnjoy the luxury',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Description Text Positioned
          Positioned(
            bottom: 140,
            left: 21, // Same here, using left instead of wrapping in Padding
            child: Text(
              'Premium and prestige car daily rental.\nExperience the thrill at a lower price',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          // Button Positioned
          Positioned(
            bottom: 40,
            left: 50, // Same for the button position
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => CarHomeScreen()));
              },
              child: Container(
                height: 60,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Text(
                    "Let's Go",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
