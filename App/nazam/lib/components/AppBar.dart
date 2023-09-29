import 'package:flutter/material.dart';
import 'package:nazam/pages/home.dart';
import 'package:nazam/pages/profile.dart';
import 'package:nazam/pages/viewIncident.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: IconButton(
        iconSize: 80.0,
        icon: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('images/logo.png'),
            ),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ),
          );
        },
      ),
      elevation: 1.5,
      backgroundColor: const Color.fromRGBO(238, 235, 235, 1),
      toolbarHeight: 100,
      centerTitle: true,
      leading: PopupMenuButton<String>(
        position: PopupMenuPosition.under,
        elevation: 8.0,
        icon: const Icon(
          Icons.menu,
          size: 50.0,
          color: Color.fromRGBO(43, 101, 109, 1),
        ),
        itemBuilder: (BuildContext context) {
          TextDirection.rtl;
          return [
            PopupMenuItem<String>(
              value: 'option1',
              child: Container(
                alignment: Alignment.centerRight,
                child: const Text(
                  ('الابلاغ عن حادثة'),
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            PopupMenuItem<String>(
              value: 'option2',
              child: Container(
                alignment: Alignment.centerRight,
                child: const Text(
                  ('عرض الحوادث'),
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            PopupMenuItem<String>(
              value: 'option3',
              child: Container(
                alignment: Alignment.centerRight,
                child: const Text(
                  ('الاعدادات'),
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ];
        },
        onSelected: (String value) {
          // Handle menu item selection
          if (value == 'option1') {
          } else if (value == 'option2') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ViewIncidentPage(),
              ),
            );
          } else if (value == 'option3') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ViewIncidentPage(),
              ),
            );
          }
        },
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: IconButton(
                  icon: const Icon(
                    Icons.message_rounded,
                    size: 35.0,
                    color: Color.fromRGBO(43, 101, 109, 1),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Profile(),
                      ),
                    );
                  },
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.account_circle,
                  size: 50.0,
                  color: Color.fromRGBO(43, 101, 109, 1),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Profile(),
                    ),
                  );
                },
              ),
            ],
          ),
        )
      ],
    );

    // actions: [
    //   Expanded(
    //     child: Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //       children: [
    //         IconButton(
    //           icon: const Icon(
    //             Icons.account_circle,
    //             size: 50.0,
    //             color: Color.fromRGBO(43, 101, 109, 1),
    //           ),
    //           onPressed: () {
    //             Navigator.push(
    //               context,
    //               MaterialPageRoute(
    //                 builder: (context) => const Profile(),
    //               ),
    //             );
    //           },
    //         ),
    //         IconButton(
    //           iconSize: 80.0,
    //           icon: Container(
    //             decoration: const BoxDecoration(
    //               image: DecorationImage(
    //                 fit: BoxFit.cover,
    //                 image: AssetImage('images/logo.png'),
    //               ),
    //             ),
    //           ),
    //           onPressed: () {
    //             Navigator.push(
    //               context,
    //               MaterialPageRoute(
    //                 builder: (context) => HomePage(),
    //               ),
    //             );
    //           },
    //         ),
    //         // PopupMenuButton<String>(
    //         //   position: PopupMenuPosition.under,
    //         //   elevation: 8.0,
    //         //   icon: const Icon(
    //         //     Icons.menu,
    //         //     size: 50.0,
    //         //     color: Color.fromRGBO(43, 101, 109, 1),
    //         //   ),
    //         //   itemBuilder: (BuildContext context) {
    //         //     TextDirection.rtl;
    //         //     return [
    //         //       PopupMenuItem<String>(
    //         //         value: 'option1',
    //         //         child: Container(
    //         //           alignment: Alignment.centerRight,
    //         //           child: const Text(
    //         //             ('الابلاغ عن حادثة'),
    //         //             style: TextStyle(
    //         //               color: Colors.black,
    //         //               fontWeight: FontWeight.w700,
    //         //             ),
    //         //           ),
    //         //         ),
    //         //       ),
    //         //       PopupMenuItem<String>(
    //         //         value: 'option2',
    //         //         child: Container(
    //         //           alignment: Alignment.centerRight,
    //         //           child: const Text(
    //         //             ('عرض الحوادث'),
    //         //             style: TextStyle(
    //         //               color: Colors.black,
    //         //               fontWeight: FontWeight.w700,
    //         //             ),
    //         //           ),
    //         //         ),
    //         //       ),
    //         //       PopupMenuItem<String>(
    //         //         value: 'option3',
    //         //         child: Container(
    //         //           alignment: Alignment.centerRight,
    //         //           child: const Text(
    //         //             ('الاعدادات'),
    //         //             style: TextStyle(
    //         //               color: Colors.black,
    //         //               fontWeight: FontWeight.w700,
    //         //             ),
    //         //           ),
    //         //         ),
    //         //       ),
    //         //     ];
    //         //   },
    //         //   onSelected: (String value) {
    //         //     // Handle menu item selection
    //         //     if (value == 'option1') {
    //         //     } else if (value == 'option2') {
    //         //       Navigator.push(
    //         //         context,
    //         //         MaterialPageRoute(
    //         //           builder: (context) => ViewIncidentPage(),
    //         //         ),
    //         //       );
    //         //     } else if (value == 'option3') {
    //         //       Navigator.push(
    //         //         context,
    //         //         MaterialPageRoute(
    //         //           builder: (context) => ViewIncidentPage(),
    //         //         ),
    //         //       );
    //         //     }
    //         //   },
    //         // ),
    //       ],
    //     ),
    //   ),
    // ],
  }
}
