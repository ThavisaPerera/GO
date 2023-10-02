// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, deprecated_member_use

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_app2/themes/theme_colors.dart';
import 'package:go_app2/views/buyers/nav_screens/widgets/intro_text_widget.dart';
import 'package:go_app2/views/buyers/nav_screens/widgets/search_input_widget.dart';
import 'package:go_app2/views/buyers/nav_screens/widgets/welcome_text_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkModeEnabled
          ? darkModeColors["darkBG"]
          : lightModeColors["lightBG"],
      body: Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + 15, left: 18, right: 18),
        child: SingleChildScrollView(
          child: Column(
            children: [
              WelcomeText(),
              SizedBox(
                height: 20,
              ),
              SearchInputWidget(),
              SizedBox(height: 20),
              IntroText(),
              SizedBox(
                height: 20,
              ),
              CarouselSlider(
                options: CarouselOptions(
                  height: 164,
                  aspectRatio: 16 / 9, // Adjust the aspect ratio as needed
                  viewportFraction: 1.0,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                ),
                items: const [
                  AssetImage('assets/images/electronics.jpg'),
                  AssetImage('assets/images/groceries.jpg'),
                  AssetImage('assets/images/phone.jpg'),
                  AssetImage('assets/images/shoes.jpg'),
                  AssetImage('assets/images/tools.jpeg'),
                  AssetImage('assets/images/cloth.jpg'),
                ].map((imageProvider) {
                  return Builder(
                    builder: (BuildContext context) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image(
                          image: imageProvider,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Categories',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: isDarkModeEnabled
                          ? darkModeColors["white"]
                          : lightModeColors["black"],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: isDarkModeEnabled
                                ? darkModeColors["purple"]
                                : lightModeColors["blue"],
                          ),
                          child: Center(
                              child: Text(
                            'Mobile',
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          )),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: isDarkModeEnabled
                                ? darkModeColors["purple"]
                                : lightModeColors["blue"],
                          ),
                          child: Center(
                              child: Text(
                            'Footwear',
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          )),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: isDarkModeEnabled
                                ? darkModeColors["purple"]
                                : lightModeColors["blue"],
                          ),
                          child: Center(
                              child: Text(
                            'Fashion',
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          )),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: isDarkModeEnabled
                                ? darkModeColors["purple"]
                                : lightModeColors["blue"],
                          ),
                          child: Center(
                              child: Text(
                            'Jewellery',
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          )),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: isDarkModeEnabled
                                ? darkModeColors["purple"]
                                : lightModeColors["blue"],
                          ),
                          child: Center(
                              child: Text(
                            'Beauty',
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          )),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: isDarkModeEnabled
                                ? darkModeColors["purple"]
                                : lightModeColors["blue"],
                          ),
                          child: Center(
                              child: Text(
                            'Toy',
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          )),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: isDarkModeEnabled
                                ? darkModeColors["purple"]
                                : lightModeColors["blue"],
                          ),
                          child: Center(
                              child: Text(
                            'Vehicle',
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          )),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: isDarkModeEnabled
                                ? darkModeColors["purple"]
                                : lightModeColors["blue"],
                          ),
                          child: Center(
                              child: Text(
                            'Electronics',
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    width: 152,
                    height: 240,
                    decoration: BoxDecoration(
                      color: isDarkModeEnabled
                        ? darkModeColors["black"]
                        : lightModeColors["white"],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: 152,
                          height: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/Arrack Made Me Do It Crew Neck T-Shirt.jpeg'),
                                fit: BoxFit.cover),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Printed T-shirt',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: isDarkModeEnabled
                                  ? darkModeColors["white"]
                                  : lightModeColors["black"],
                            ),
                          ),
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'RS.2000',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: isDarkModeEnabled
                                        ? darkModeColors["purple"]
                                        : lightModeColors["blue"],
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset(
                                'assets/icons/shopping_cart_FILL0_wght400_GRAD0_opsz48.svg',
                                width: 24,
                                height: 24,
                                color: isDarkModeEnabled
                                    ? darkModeColors["white"]
                                    : lightModeColors["black"],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: 152,
                    height: 240,
                    decoration: BoxDecoration(
                      color: isDarkModeEnabled
                        ? darkModeColors["black"]
                        : lightModeColors["white"],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: 152,
                          height: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/images/nike shoe.jpg'),
                                fit: BoxFit.cover),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Nike Air Shoe',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: isDarkModeEnabled
                                  ? darkModeColors["white"]
                                  : lightModeColors["black"],
                            ),
                          ),
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'RS.9000',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: isDarkModeEnabled
                                        ? darkModeColors["purple"]
                                        : lightModeColors["blue"],
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset(
                                'assets/icons/shopping_cart_FILL0_wght400_GRAD0_opsz48.svg',
                                width: 24,
                                height: 24,
                                color: isDarkModeEnabled
                                    ? darkModeColors["white"]
                                    : lightModeColors["black"],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    width: 152,
                    height: 240,
                    decoration: BoxDecoration(
                      color: isDarkModeEnabled
                        ? darkModeColors["black"]
                        : lightModeColors["white"],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: 152,
                          height: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/floral shirt.webp'),
                                fit: BoxFit.cover),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Floral shirt',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: isDarkModeEnabled
                                  ? darkModeColors["white"]
                                  : lightModeColors["black"],
                            ),
                          ),
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'RS.4500',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: isDarkModeEnabled
                                        ? darkModeColors["purple"]
                                        : lightModeColors["blue"],
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset(
                                'assets/icons/shopping_cart_FILL0_wght400_GRAD0_opsz48.svg',
                                width: 24,
                                height: 24,
                                color: isDarkModeEnabled
                                    ? darkModeColors["white"]
                                    : lightModeColors["black"],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: 152,
                    height: 240,
                    decoration: BoxDecoration(
                      color: isDarkModeEnabled
                        ? darkModeColors["black"]
                        : lightModeColors["white"],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: 152,
                          height: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/peach-long-frock.jpg'),
                                fit: BoxFit.cover),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Peach Long Frock',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: isDarkModeEnabled
                                  ? darkModeColors["white"]
                                  : lightModeColors["black"],
                            ),
                          ),
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'RS.6000',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: isDarkModeEnabled
                                        ? darkModeColors["purple"]
                                        : lightModeColors["blue"],
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset(
                                'assets/icons/shopping_cart_FILL0_wght400_GRAD0_opsz48.svg',
                                width: 24,
                                height: 24,
                                color: isDarkModeEnabled
                                    ? darkModeColors["white"]
                                    : lightModeColors["black"],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
