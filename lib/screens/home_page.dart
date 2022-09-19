import 'package:flutter/material.dart';

import '../widgets/coffee_tile.dart';
import '../widgets/coffee_type.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<List<dynamic>> coffeTypes = [
    ["Cappucino", true],
    ['Arabica', false],
    ['Espresso', false],
    ['Latte', false],
    ['Decafe', false],
    ['Robusta', false]
  ];

  void coffeeTypeSelected(int index) {
    setState(() {
      for (var i = 0; i < coffeTypes.length; i++) {
        coffeTypes[i][1] = false;
      }
      coffeTypes[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 14.0),
            child: Icon(Icons.person),
          )
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: BottomNavigationBar(
        
          selectedItemColor: const Color(0xffd17842),
          backgroundColor: const Color(0xFF191719),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_rounded), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag_rounded), label: ''),
          ]),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Text(
                  "Find the best coffee for you",
                  style: TextStyle(fontSize: 36, color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7.0),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFF141921),
                    hintText: "Find your coffee...",
                    hintStyle: const TextStyle(color: Color(0xff52555a)),
                    prefixIcon: const Icon(Icons.search),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                  height: 50,
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return CoffeeType(
                          coffeeType: coffeTypes[index][0].toString(),
                          isSelected: coffeTypes[index][1],
                          onTap: () => coffeeTypeSelected(index),
                        );
                      })),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: double.infinity,
                height: 305,
                child: ListView(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: const [
                    CoffeeTile(
                      imgPath: "assets/images/pic1.jpg",
                      cost: "4.00",
                      name: "Cappucino",
                      desc: "With Almond milk",
                    ),
                    CoffeeTile(
                      imgPath: "assets/images/pic2.jpg",
                      cost: "3.00",
                      name: "Cappucino",
                      desc: "With Oat milk",
                    ),
                    CoffeeTile(
                      imgPath: "assets/images/pic3.jpg",
                      cost: "3.50",
                      name: "Cappucino",
                      desc: "With Chocolate",
                    ),
                    CoffeeTile(
                      imgPath: "assets/images/pic1.jpg",
                      cost: "4.50",
                      name: "Cappucino",
                      desc: "With Almond milk",
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
