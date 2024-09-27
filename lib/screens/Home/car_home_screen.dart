import 'package:car_rental_app/screens/Profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:car_rental_app/Common/card_list.dart';
import 'package:car_rental_app/constants.dart';
import 'package:car_rental_app/model/car.dart';
import 'package:car_rental_app/screens/Detail/car_detail_screen.dart';

class CarHomeScreen extends StatefulWidget {
  const CarHomeScreen({super.key});

  @override
  _CarHomeScreenState createState() => _CarHomeScreenState();
}

class _CarHomeScreenState extends State<CarHomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2), // Total duration of the animation
    );

    // Start the animation when the page loads
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF203e5a),
        automaticallyImplyLeading: false,
        leading:  GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: const Text(
          "Cars for Rent",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.white,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> ProfileScreen()));
            },
            child: Container(
              height: 50,
              width: 50,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image(
                  image: AssetImage('Images/gh.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 20,
          )

        ]
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: carList.length,
        itemBuilder: (context, index) {
          final car = carList[index];

          // Delaying each item's animation based on its index
          final Animation<Offset> slideAnimation = Tween<Offset>(
            begin: const Offset(0, -1), // Start from above
            end: Offset.zero, // Slide down to the final position
          ).animate(CurvedAnimation(
            parent: _controller,
            curve: Interval((1 / carList.length) * index, 1.0, curve: Curves.easeOut),
          ));

          final Animation<double> fadeAnimation = Tween<double>(
            begin: 0.0, // Start transparent
            end: 1.0, // Fully opaque
          ).animate(CurvedAnimation(
            parent: _controller,
            curve: Interval((1 / carList.length) * index, 1.0, curve: Curves.easeIn),
          ));

          return AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return FadeTransition(
                opacity: fadeAnimation,
                child: SlideTransition(
                  position: slideAnimation,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CarDetailScreen(car)));
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.only(left: 24, right: 24, top: 50),
                            padding: const EdgeInsets.only(
                                left: 25, bottom: 15, right: 20, top: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: cardColor,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "\$${car.price.toString()}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    color: Colors.white,
                                  ),
                                ),
                                const Text(
                                  "price/hr",
                                  style: TextStyle(
                                      color: Colors.white, fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CarItems(name: "Brand", value: car.brand),
                                    CarItems(name: "Model No", value: car.model),
                                    CarItems(name: "CO2", value: car.co2),
                                    CarItems(name: "Fuel Cons", value: car.fuelCons),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            right: 30,
                            child: Hero(
                              tag: car.image,
                              child: Container(
                                height: 100,
                                width: 200,
                                child: Image.asset(
                                  car.image,
                                  height: 135,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
