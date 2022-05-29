import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whatsapp_clone/components/colors.dart';
import 'package:whatsapp_clone/components/enum/menu_action.dart';
import 'package:whatsapp_clone/screen/home/components/home_option_navigator.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({Key? key}) : super(key: key);

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  final PageController _pageController = PageController();
  ScrollController homeScrollController = ScrollController();
  int currentIndex = 0;

  callback(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: ColorConstant.header,
        statusBarIconBrightness: Brightness.light, // For Android (dark icons)
        // statusBarBrightness: Brightness.light, // For iOS (dark icons)
      ),
      child: Scaffold(
        body: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: ColorConstant.header,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                    blurRadius: 2.0,
                    spreadRadius: 0.0,
                    offset: Offset(2.0, 2.0), // shadow direction: bottom right
                  )
                ],
              ),
              width: double.infinity,
              height: size.height * .2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "WhatsApp Business",
                          style: TextStyle(
                            fontFamily: "Helvetica",
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: ColorConstant.headerColor,
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.search,
                              color: Color.fromARGB(255, 215, 215, 215),
                              size: 25,
                            ),
                            const SizedBox(width: 10),
                            PopupMenuButton<MenuAction>(
                              icon: const Icon(
                                Icons.more_vert,
                                color: ColorConstant.headerColor,
                                size: 25,
                              ),
                              onSelected: (value) async {
                                switch (value) {
                                  case MenuAction.logout:
                                    break;
                                }
                              },
                              itemBuilder: (context) {
                                return [
                                  const PopupMenuItem<MenuAction>(
                                    value: MenuAction.logout,
                                    child: Text(
                                      'Log out',
                                      style: TextStyle(
                                        color: ColorConstant.headerColor,
                                      ),
                                    ),
                                  ),
                                ];
                              },
                              color: ColorConstant.backGround,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  //const SizedBox(height: 5),
                  HomeOptionNavigator(
                    selectedIndex: currentIndex,
                    callbackFunction: callback,
                    pageController: _pageController,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * .8,
              child: PageView(
                controller: _pageController,
                onPageChanged: (page) {
                  setState(() {
                    currentIndex = page;
                  });
                },
                children: [
                  SingleChildScrollView(
                    controller: homeScrollController,
                    child: Column(
                      children: const [
                        Text("Allos 1"),
                        SizedBox(height: 100),
                        Text("Allos 1"),
                        SizedBox(height: 100),
                        Text("Allos 1"),
                        SizedBox(height: 100),
                        Text("Allos 1"),
                        SizedBox(height: 100),
                        Text("Allos 1"),
                        SizedBox(height: 100),
                        Text("Allos 1"),
                        SizedBox(height: 100),
                        Text("Allos 1"),
                        SizedBox(height: 100),
                        Text("Allos 1"),
                      ],
                    ),
                  ),
                  Container(
                    child: const Text("Allos 2"),
                  ),
                  Container(
                    child: const Text("Allos 3"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
