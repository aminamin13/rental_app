import 'package:flutter/material.dart';
import 'package:rental_app/data/models/car_model.dart';

class MoreCard extends StatelessWidget {
  const MoreCard({super.key, required this.car});
  final CarModel car;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xff212020),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(color: Colors.black54, blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                car.model,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 5),

              Row(
                children: [
                  Icon(Icons.directions_car, color: Colors.white, size: 16),

                  SizedBox(width: 5),
                  Text(
                    "> ${car.distance.toStringAsFixed(0)} km",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  SizedBox(width: 5),
                  Icon(Icons.battery_full, color: Colors.white, size: 16),
                  SizedBox(width: 5),
                  Text(
                    "${car.fuelCapacity.toStringAsFixed(0)} L",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
          Icon(Icons.arrow_forward_ios, color: Colors.white, size: 24),
        ],
      ),
    );
  }
}
