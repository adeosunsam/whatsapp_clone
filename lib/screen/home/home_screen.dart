import 'package:flutter/material.dart';
import 'package:whatsapp_clone/components/colors.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({Key? key}) : super(key: key);

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  ScrollController homeScrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            child: Container(
              width: double.infinity,
              height: size.height * .15,
              color: ColorConstant.header,
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
                            fontSize: 23,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 215, 215, 215),
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.search,
                              color: Color.fromARGB(255, 215, 215, 215),
                              size: 27,
                            ),
                            const SizedBox(width: 10),
                            PopupMenuButton<MenuAction>(
                              icon: const Icon(
                                Icons.more_vert,
                                color: Color.fromARGB(255, 215, 215, 215),
                                size: 27,
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
                                        color:
                                            Color.fromARGB(255, 215, 215, 215),
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
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      SizedBox(
                        width: size.width * .1,
                        child: const Align(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            Icons.photo_camera_rounded,
                            color: Color.fromARGB(255, 215, 215, 215),
                            size: 25,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: size.width * .9,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            Text(
                              "CHATS",
                              style: TextStyle(
                                fontFamily: "Helvetica",
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(255, 215, 215, 215),
                              ),
                            ),
                            Text(
                              "STATUS",
                              style: TextStyle(
                                fontFamily: "Helvetica",
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(255, 215, 215, 215),
                              ),
                            ),
                            Text(
                              "CALLS",
                              style: TextStyle(
                                fontFamily: "Helvetica",
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(255, 215, 215, 215),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

enum MenuAction {
  logout,
}
