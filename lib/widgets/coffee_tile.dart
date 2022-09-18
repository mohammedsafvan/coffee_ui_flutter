import 'package:coffee_ui/screens/details_page.dart';
import 'package:flutter/material.dart';

class CoffeeTile extends StatelessWidget {
  final String imgPath;
  final String name;
  final String cost;
  final String desc;

  const CoffeeTile(
      {Key? key,
      required this.imgPath,
      required this.name,
      required this.cost,
      required this.desc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, bottom: 15, right: 10),
      child: InkWell(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => DetailsPage()));
        },
        child: Container(
          padding: const EdgeInsets.all(12),
          width: 170,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0x9F262B33), Color(0xFF0C1015)]),
            // color: Color(0xff242830),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  imgPath,
                  // height: 150,
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      desc,
                      style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                        text: TextSpan(
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                            children: [
                          const TextSpan(
                              text: "\$ ",
                              style: TextStyle(color: Color(0xffd17842))),
                          TextSpan(text: cost)
                        ])),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: Color(0xffd17842),
                          borderRadius: BorderRadius.circular(13)),
                      child: const Icon(Icons.add_rounded),
                    )
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
