import 'package:flutter/material.dart';
import '../helpers/constants.dart';
import '../pages/user/user_detail.dart';
import '../pages/user/user_list.dart';

class SplitScreen extends StatelessWidget {
  const SplitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        // List
        SizedBox(
          width: Sizes.listWidth,
          child: UserList(),
        ),

        VerticalDivider(width: Sizes.verticalDividerWidth),

        // Details
        Expanded(child: UserDetail()),
      ],
    );
  }
}