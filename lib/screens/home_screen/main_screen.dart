// ignore_for_file: sized_box_for_whitespace

import 'package:coffee_ui/category_model.dart';
import 'package:coffee_ui/screens/info_screen/info.dart';
import 'package:coffee_ui/widgets/items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Map<String, CategoryModel> categorys = {
    "ALL": CategoryModel("ALL", "assets/images/all.png"),
    "Cappuccino": CategoryModel("Cappuccino", "assets/images/cappuchino.png"),
    "Espresso": CategoryModel("Espresso", "assets/images/expresso.png"),
    "Latte": CategoryModel("Latte", "assets/images/latte.png"),
  };
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Hikmatillo",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xff583732),
            fontSize: 30,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset("assets/images/profile.jpg"),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color(0xffefeeee),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search ...",
                    hintStyle: TextStyle(
                      color: Color(0xffaca3a3),
                      fontSize: 22,
                    ),
                    prefixIcon: Icon(
                      Icons.search_rounded,
                      size: 25,
                      color: Color(0xffaca3a3),
                    ),
                  ),
                  style: TextStyle(
                    color: Color(0xff583732),
                    fontSize: 16,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 121,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: categorys.length,
                  itemBuilder: (context, index) {
                    final category = categorys.values.toList()[index];
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CategoryItem(
                          name: category.name,
                          image: category.img,
                          bacColor: currentIndex == index
                              ? const Color(0xff583732)
                              : const Color(0xffD9D9D9),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "Promotion",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xff583732),
                      fontSize: 28,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Container(
                    width: 374,
                    height: 160,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              width: 374,
                              height: 152,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: const LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Color(0xb2583732),
                                    Color(0x7c583732)
                                  ],
                                ),
                              ),
                              padding: const EdgeInsets.only(
                                left: 25,
                                right: 100,
                                top: 0,
                                bottom: 40,
                              ),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Tooday's Offer",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(height: 3.50),
                                  Text(
                                    "Free Bottle Of Coffee Latte",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: 3.50),
                                  Text(
                                    "on all orders above Rp.200.000",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Image.asset(
                              "assets/images/large_latte.png",
                              width: 104,
                              height: 174,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Popular",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xff583732),
                        fontSize: 28,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: 4,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => Get.to(const InfoScreen()),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 177,
                              height: 191,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color(0x11583732),
                                    Color(0x7c583732)
                                  ],
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 7,
                                  right: 12,
                                  top: 11,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: Container(
                                        width: 54,
                                        height: 90,
                                        child: Image.asset(
                                          "assets/images/expresso.png",
                                          width: 55,
                                          height: 90,
                                        ),
                                      ),
                                    ),
                                    const Text(
                                      "Creamy Latte ",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xff583732),
                                        fontSize: 16,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        const Text(
                                          "Rp. 40.000",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            // color: Color(0xffd8c61c),
                                            color: Colors.yellowAccent,
                                            fontSize: 16,
                                            fontFamily: "Poppins",
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Container(
                                            width: 27,
                                            height: 27,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              color: const Color(0xff531607),
                                            ),
                                            child: const Icon(
                                              Icons.add_outlined,
                                              color: Colors.white,
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
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
