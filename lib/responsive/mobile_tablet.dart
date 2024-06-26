import 'package:flutter/material.dart';

import '../pages/widgets/nav_bar.dart';
import '../state/app_state.dart';

class MobileTablet extends StatefulWidget {
  const MobileTablet({
    super.key,
    required this.selectedPage,
  });

  final List<Widget> selectedPage;

  @override
  State<MobileTablet> createState() => _MobileTabletState();
}

class _MobileTabletState extends State<MobileTablet> {
  late AppState _appState;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _appState = AppState.of(context)!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _appState.selectedPageIndex,
        children: widget.selectedPage,
      ),
      bottomNavigationBar: NavBar(
        selectedPageIndex: _appState.selectedPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _appState.setPageIndex(index);
          });
        },
      ),
    );
  }
}