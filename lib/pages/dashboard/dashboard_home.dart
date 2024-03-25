import 'package:transfer_flutter/models/user_model_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/graph_bar.dart';

class DashboardHome extends StatefulWidget {
  const DashboardHome({super.key});

  @override
  State<DashboardHome> createState() => _DashboardHomeState();
}
typedef GroupedAges = Map<int, List<int>>;

class _DashboardHomeState extends State<DashboardHome> {
  final UsersModelDataData _usersList = UsersModelDataData.loadDataJson();
  final GroupedAges _groupedAges = {};

  @override
  void initState() {
    super.initState();
    _calculateTotals();
  }

  void _calculateTotals() {
    _usersList.users.sort((a, b) => a.dob.age.compareTo(b.dob.age));

    // TIP: The ~/ means Divide and return an integer
    for (var user in _usersList.users) {
      final int tensPlace = user.dob.age ~/ 10;
      if (!_groupedAges.containsKey(tensPlace)) {
        _groupedAges[tensPlace] = [];
      }
      _groupedAges[tensPlace]!.add(user.dob.age);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          // TIP: Use FittedBox for Desktop if user resizes window very small
          child: Center(
            child: FittedBox(
              child: Row(
                children: [
                  for (final group in _groupedAges.values) ...[
                    VerticalBarWidget(
                      icon: Icons.people,
                      numberToPlot: group.length,
                      numberToPlotMax: group.length + 1,
                      title: '${(group.first ~/ 10)}0\'s',
                    ),
                  ]
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
