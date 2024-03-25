import 'package:flutter/material.dart';

import '../../constants/constant.dart';
import 'custom_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.0, 1.0],
          colors: [
            backGroundColorBackAppBar,
            backGroundColorAppBar,
          ],
        ),
      ),
      child: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        elevation: 2,
        centerTitle: true,
        title: CustomText(text:'Login', textStyle: const TextStyle(fontFamily: 'Pacifico',fontWeight: FontWeight.bold, fontSize: 40.0, color: textColor),),

      ),
    );
  }

  @override
  Size get preferredSize => const Size(900, 56);
}