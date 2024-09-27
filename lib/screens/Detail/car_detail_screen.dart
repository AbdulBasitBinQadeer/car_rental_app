import 'package:car_rental_app/constants.dart';
import 'package:car_rental_app/model/car.dart';
import 'package:flutter/material.dart';

import '../../Common/card_list.dart';

class CarDetailScreen extends StatefulWidget {
  const CarDetailScreen(this.car, {super.key});
  final Car car;

  @override
  _CarDetailScreenState createState() => _CarDetailScreenState();
}

class _CarDetailScreenState extends State<CarDetailScreen> {

  // Function to show the dialog with car image and text
  void showBookingPopup() {
    showDialog(
      context: context,
      builder: (context) {
        return Stack(
          alignment: Alignment.center,
          children: [
            AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              contentPadding: const EdgeInsets.only(top: 100), // space for the car image
              content: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "There is no car free at this time",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black),
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 40,
                        width: 80,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child:  Center(child: Text("OK", style: TextStyle(color: Colors.white))),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Positioning the car image on top of the dialog using Stack
            Positioned(
              top: MediaQuery.of(context).size.height * 0.3, // adjust based on screen height
              child: Image.asset(
                widget.car.image,
                height: 100,
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // for image
          Image.asset(
            "Images/map.png",
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          // for back button ,name and menu icon
          carDetailAppbar(context),
          Positioned(
            left: 10,
            right: 10,
            bottom: 25,
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.only(top: 45),
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      cardInformation(),
                      const Divider(
                        height: 15,
                        color: Colors.white70,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 140,
                            width: 120,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                "Images/hod.jpg",
                                fit: BoxFit.cover,
                                height: 150,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                              child: Column(
                                children: [
                                  const Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Jesica Smith",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                          Text(
                                            "License: NWR 369852",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "369",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                color: Colors.white),
                                          ),
                                          Text(
                                            "Ride",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 12),
                                  const Row(
                                    children: [
                                      Text(
                                        "5.0",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      SizedBox(width: 6),
                                      Icon(Icons.star,
                                          color: Colors.white, size: 16),
                                      Icon(Icons.star,
                                          color: Colors.white, size: 16),
                                      Icon(Icons.star,
                                          color: Colors.white, size: 16),
                                      Icon(Icons.star,
                                          color: Colors.white, size: 16),
                                      Icon(Icons.star,
                                          color: Colors.white, size: 16)
                                    ],
                                  ),
                                  const SizedBox(height: 12),
                                  // Call and Book Now button
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 20),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          color: cardColor,
                                        ),
                                        child: const Text(
                                          "Call",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: showBookingPopup, // Call popup function
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 20),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(20),
                                            color: cardColor,
                                          ),
                                          child: const Text(
                                            "Book Now",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
                // for car image
                Positioned(
                  right: 60,
                  top: 0, // no tween animation here
                  child: Hero(
                    tag: widget.car.image,
                    child: Image.asset(
                      widget.car.image,
                      height: 115,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column cardInformation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "\$${widget.car.price.toString()}",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.white,
          ),
        ),
        const Text(
          "price/hr",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CarItems(
                name: "Brand", value: widget.car.brand, textColor: Colors.black),
            CarItems(
                name: "Model No",
                value: widget.car.model,
                textColor: Colors.black),
            CarItems(name: "CO2", value: widget.car.co2, textColor: Colors.black),
            CarItems(
                name: "Fuel Cons",
                value: widget.car.fuelCons,
                textColor: Colors.black),
          ],
        ),
      ],
    );
  }

  SafeArea carDetailAppbar(BuildContext context) {
    return SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
            const Text(
              "Car Detail",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
            ),
          ],
        ));
  }
}
