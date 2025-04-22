import 'package:flutter/material.dart';
import 'package:rental_app/data/models/car_model.dart';
import 'package:rental_app/presentation/pages/maps_details_page.dart';
import 'package:rental_app/presentation/widget/car_card.dart';
import 'package:rental_app/presentation/widget/more_card.dart';

class CarDetailsPage extends StatefulWidget {
  const CarDetailsPage({super.key, required this.car});
  final CarModel car;

  @override
  State<CarDetailsPage> createState() => _CarDetailsPageState();
}

class _CarDetailsPageState extends State<CarDetailsPage>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? animation;

  @override
  void initState() {
    // TODO: implement initState
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    animation = Tween<double>(begin: 1, end: 1.5).animate(controller!)
      ..addListener(() {
        setState(() {});
      });
    controller!.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller!.forward();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.info_outline),
            Text("Information", style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      body: Column(
        children: [
          CarCard(car: widget.car),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Color(0xfff3f3f3),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage("assets/user.png"),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Amine Amine",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "\$4,555",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => MapsDetailsPage(car: widget.car),
                        ),
                      );
                    },
                    child: Container(
                      height: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),

                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Transform.scale(
                          scale: animation!.value,
                          alignment: Alignment.center,
                          child: Image.asset(
                            "assets/maps.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              spacing: 5,
              children: [
                MoreCard(car: widget.car),
                MoreCard(car: widget.car),
                MoreCard(car: widget.car),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
