import 'package:flutter/material.dart';
import 'package:whatsapp_clone/components/colors.dart';
import 'package:whatsapp_clone/components/entity/chat_user.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    users.sort((a, b) => a.isRead ? 1 : -1);
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.height * .07,
                child: Row(
                  children: [
                    SizedBox(
                      width: size.width * .2,
                      child: const Icon(
                        Icons.archive_outlined,
                        color: ColorConstant.headerColor,
                        size: 23,
                      ),
                    ),
                    Container(
                      width: size.width * .8,
                      padding: EdgeInsets.only(right: size.width * .06),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Archived',
                            style: TextStyle(
                              fontFamily: 'Helvetica',
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            '1',
                            style: TextStyle(
                                fontFamily: 'Helvetica',
                                fontSize: 15,
                                color: ColorConstant.tealGreen
                                //fontWeight: FontWeight.w600,
                                ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Column(
                children: users.map(
                  (e) {
                    return userChatList(e, context);
                  },
                ).toList(),
              ),
            ],
          ),
        ),
        Positioned(
          right: 20,
          bottom: 15,
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: const BoxDecoration(
              color: ColorConstant.tealGreen,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.message,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget userChatList(ChatUser e, BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * .11,
      child: Row(
        children: [
          //user page images
          SizedBox(
            width: size.width * .22,
            child: Container(
              height: 52,
              width: 52,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage(
                    e.image,
                  ),
                ),
              ),
            ),
          ),
          //chat details
          Container(
            width: size.width * .78,
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        e.name,
                        style: const TextStyle(
                          fontFamily: 'Helvetica',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        e.message,
                        style: const TextStyle(
                          fontFamily: 'Helvetica',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: ColorConstant.headerColor,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      e.time,
                      style: const TextStyle(
                        fontFamily: 'Helvetica',
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: ColorConstant.headerColor,
                      ),
                    ),
                    const SizedBox(height: 3),
                    e.unreadCount != null
                        ? Container(
                            padding: const EdgeInsets.all(6),
                            decoration: const BoxDecoration(
                              color: ColorConstant.tealGreen,
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              "${e.unreadCount}",
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          )
                        : const Padding(padding: EdgeInsets.only(top: 10)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
