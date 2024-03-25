import 'package:transfer_flutter/state/app_state.dart';
import 'package:flutter/material.dart';

import '../helpers/themes.dart';
import '../models/user_model_data.dart';

class AppStateNotifier extends StatefulWidget {
  const AppStateNotifier({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  State<AppStateNotifier> createState() => _AppStateNotifierState();
}

class _AppStateNotifierState extends State<AppStateNotifier> {
  late int _selectedUserIndex;
  late ValueNotifier<UsersData> _userSelectedNotifier;
  late int _selectedPageIndex;
  late List<Color?> _colorsList;

  @override
  void initState() {
    super.initState();
    _selectedUserIndex = -1;
    _userSelectedNotifier = ValueNotifier<UsersData>(UsersData.blankDefaultValues());
    _selectedPageIndex = 0;
    _colorsList = RandomColorList.colors();
  }

  void _setSelectedUserIndex(int index) {
    setState(() {
      _selectedUserIndex = index;
    });
  }

  void _setSelectedPageIndex(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppState(
      selectedUserIndex: _selectedUserIndex,
      userSelectedNotifier: _userSelectedNotifier,
      selectedPageIndex: _selectedPageIndex,
      colorsList: _colorsList,
      setUserIndex: _setSelectedUserIndex,
      setPageIndex: _setSelectedPageIndex,
      child: widget.child,
    );
  }
}