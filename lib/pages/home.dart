import 'package:flutter/material.dart';
import '../helpers/constants.dart';
import '../responsive/desktop_web.dart';
import '../responsive/mobile_tablet.dart';
import '../responsive/responsive_layout_builder.dart';
import '../state/app_state_notifier.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // TIP: UserState remembers selected user and allows refresh of detail page
    return AppStateNotifier(
      child: ResponsiveLayoutBuilder(
        mobile: MobileTablet(
          selectedPage: SelectedPage.bodySelectedPage,
        ),
        tablet: MobileTablet(
          selectedPage: SelectedPage.bodySelectedPageSplitScreen,
        ),
        desktopWeb: DesktopWeb(
          selectedPage: SelectedPage.bodySelectedPageSplitScreen,
        ),
      ),
    );
  }
}