// ignore_for_file: sized_box_for_whitespace

import 'package:coffee_ui/category_model.dart';
import 'package:coffee_ui/widgets/items.dart';
import 'package:flutter/material.dart';
import 'package:sweet_nav_bar/sweet_nav_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Map<String, CategoryModel> categorys = {
    "ALL": CategoryModel(true, "ALL", "assets/images/all.png"),
    "Cappuccino":
        CategoryModel(false, "Cappuccino", "assets/images/cappuchino.png"),
    "Espresso": CategoryModel(false, "Espresso", "assets/images/expresso.png"),
    "Latte": CategoryModel(false, "Latte", "assets/images/latte.png"),
  };

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
      bottomNavigationBar: SweetNavBar(
        currentIndex: 0,

        items: [
          SweetNavBarItem(
              sweetActive: const Icon(
                Icons.home,
                color: Color(0xff531607),
              ),
              sweetIcon: const Icon(
                Icons.home_outlined,
              ),
              sweetLabel: 'Home',
              sweetBackground: Colors.transparent),
          SweetNavBarItem(
              sweetIcon: const Icon(
                Icons.search,
              ),sweetActive: const Icon(
                Icons.search,
                color: Color(0xff531607),
              ),
              sweetLabel: 'Serach'),
          SweetNavBarItem(
            sweetActive: const Icon(
              Icons.shopping_cart,
              color: Color(0xff531607),
            ),
            sweetLabel: 'Card',
            sweetIcon: const Icon(
              Icons.shopping_cart,
            ),
          ),
        ],
        // onTap: (index) {
        //   setState(() {
        //     cIndex = index;
        //   });
        // },
      ),
      body: SingleChildScrollView(
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
                  scrollDirection: Axis.horizontal,
                  itemCount: categorys.length,
                  itemBuilder: (context, index) {
                    final category = categorys.values.toList()[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CategoryItem(
                        name: category.name,
                        image: category.img,
                        isSelected: category.isSelected,
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
                            child: SizedBox(
                              width: 104,
                              height: 174,
                              child: Image.asset(
                                "assets/images/latte.png",
                                width: 104,
                                height: 174,
                              ),
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
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 177,
                            height: 191,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [Color(0x11583732), Color(0x7c583732)],
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
