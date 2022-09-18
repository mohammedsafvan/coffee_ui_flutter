import 'package:flutter/material.dart';

class CoffeeType extends StatelessWidget {
  const CoffeeType(
      {super.key,
      required this.coffeeType,
      required this.onTap,
      this.isSelected});

  final String coffeeType;
  final bool? isSelected;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, top: 10, right: 5),
      child: GestureDetector(
        onTap: onTap,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Text(
            coffeeType,
            style: isSelected == true
                ? const TextStyle(
                    color: Color(0xffd17842), fontWeight: FontWeight.w900)
                : const TextStyle(color: Colors.white),
          ),
          Visibility(
              visible: isSelected == true,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  height: 5,
                  width: 5,
                  decoration:const  BoxDecoration(
                      color: Color(0xffd17842), shape: BoxShape.circle),
                ),
              ))
        ]),
      ),
    );
  }
}
