import 'package:flutter/material.dart';
import 'package:whatsapp_clone/components/colors.dart';

class HomeOptionNavigator extends StatefulWidget {
  final PageController pageController;
  final Function callbackFunction;
  final int selectedIndex;
  const HomeOptionNavigator({
    Key? key,
    required this.callbackFunction,
    required this.selectedIndex,
    required this.pageController,
  }) : super(key: key);

  @override
  State<HomeOptionNavigator> createState() => _HomeOptionNavigatorState();
}

List<String> options = ["CHATS", "STATUS", "CALLS"];

class _HomeOptionNavigatorState extends State<HomeOptionNavigator> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          width: size.width * .13,
          margin: const EdgeInsets.only(bottom: 17),
          child: const Align(
            alignment: Alignment.center,
            child: Icon(
              Icons.photo_camera_rounded,
              color: ColorConstant.headerColor,
              size: 25,
            ),
          ),
        ),
        SizedBox(
          width: size.width * .87,
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: options.map((e) {
              int index = options.indexOf(e);
              return homeOptionBuilder(e, index);
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget homeOptionBuilder(String option, int index) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        setState(() {
          widget.pageController.jumpToPage(index);
          widget.callbackFunction(index);
        });
      },
      child: Container(
        padding: const EdgeInsets.only(top: 7),
        width: size.width * .29,
        //color: ColorConstant.lightGreen,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  option,
                  style: TextStyle(
                      fontFamily: "Helvetica",
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: widget.selectedIndex == index
                          ? ColorConstant.tealGreen
                          : ColorConstant.headerColor),
                ),
                option == 'CHATS'
                    ? const SizedBox(width: 7)
                    : const SizedBox(width: 0),
                option == 'CHATS'
                    ? Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: widget.selectedIndex == index
                              ? ColorConstant.tealGreen
                              : ColorConstant.headerColor,
                          shape: BoxShape.circle,
                        ),
                        child: const Text(
                          "3",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      )
                    : const Padding(padding: EdgeInsets.only(top: 24)),
              ],
            ),
            widget.selectedIndex == index
                ? Container(
                    margin: const EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: ColorConstant.tealGreen,
                        width: 1.7,
                      ),
                    ),
                  )
                : Container(
                    margin: const EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.transparent,
                        width: 1.7,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
