import 'package:cook_ease/utilities/constants.dart';
import 'package:flutter/material.dart';

class BannerToExplore extends StatelessWidget {
  const BannerToExplore({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      height: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Kbannercolor
      ),
      child: Stack(children: [
        Positioned(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Cook the best\nrecipe at home", style: TextStyle(
              fontSize: 22,
              height: 1.1,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),
            ),
            const SizedBox(height: 10,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 33),
                backgroundColor: Colors.white,
              ),
              onPressed: () {}, 
            child: const Text(
              "Explore",
              
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.black
            ),)
        ),
        ], 
        ))
      ],),
    );
  }
}