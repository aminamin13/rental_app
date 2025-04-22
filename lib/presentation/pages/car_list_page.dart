import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rental_app/presentation/bloc/car_bloc.dart';
import 'package:rental_app/presentation/bloc/car_state.dart';
import 'package:rental_app/presentation/pages/car_details_page.dart';
import 'package:rental_app/presentation/widget/car_card.dart';

class CarListPage extends StatelessWidget {
  const CarListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Choose a car"),
        backgroundColor: Color(0xfff3f3f3),
        foregroundColor: Colors.black,
      ),
      body: BlocBuilder<CarBloc, CarState>(
        builder: (context, state) {
          if (state is CarLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CarLoaded) {
            return ListView.builder(
              itemCount: state.cars.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap:
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) =>
                                  CarDetailsPage(car: state.cars[index]),
                        ),
                      ),
                  child: CarCard(car: state.cars[index]),
                );
              },
            );
          } else if (state is CarError) {
            return Center(child: Text(state.message));
          }
          return Container();
        },
      ),
    );
  }
}
