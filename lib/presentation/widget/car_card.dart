import 'package:flutter/material.dart';
import 'package:rental_app/data/models/car_model.dart';

class CarCard extends StatelessWidget {
  const CarCard({super.key, required this.car, this.onTap});
  final CarModel car;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Color(0xfff3f3f3),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 5),
          ],
        ),
        child: Column(
          children: [
            Image.asset("assets/car_image.png", height: 120),
            Text(
              car.model,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset("assets/gps.png"),
                        SizedBox(width: 5),

                        Text("${car.distance.toStringAsFixed(0)}km"),
                      ],
                    ),
                    SizedBox(width: 15),
                    Row(
                      children: [
                        Image.asset("assets/pump.png"),
                        SizedBox(width: 5),

                        Text("${car.fuelCapacity.toStringAsFixed(0)}L"),
                      ],
                    ),
                  ],
                ),

                Text(
                  "${car.pricePerHour.toStringAsFixed(0)}\$/Day ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
