import 'package:transfer_flutter/pages/auth/loginUi.dart';
import 'package:transfer_flutter/pages/dashboard/dashboard_home.dart';
import 'package:transfer_flutter/pages/home/home_app_screen.dart';
import 'package:transfer_flutter/pages/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../constants/constant.dart';
import '../user/profile_page.dart';
import '../widgets/custom_list_tile.dart';
class HomeScreen extends StatefulWidget {
   HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final storage =  const FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final searchForm = TextFormField(
      cursorColor: appColor,
      style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 20.0, color: textColor),
      decoration:  InputDecoration(
        hintText: 'Search...',
        prefixIcon: const Icon(Icons.search, color: appColor,),
        hintStyle: const TextStyle(fontFamily: 'Pacifico',fontWeight: FontWeight.normal, fontSize: 20.0, color: appColor),
        contentPadding: const EdgeInsets.all(10.0),
        filled: true,
        fillColor: const Color(0xFFF2F3F5),
        focusColor: backGroundColorAppBar,
        suffixIcon: const Icon(Icons.light_sharp, color: appColor,),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
      ),
    );
    final darkMode = Ink(
    padding: const EdgeInsets.all(0.0),
    decoration: const ShapeDecoration(
      color: Colors.white,
      shape: CircleBorder(),
      shadows: [
        BoxShadow(
          // color: Colors.black.withOpacity(0.3),
          spreadRadius: 0.1,
          blurRadius: 2,
          offset: Offset(0, 2),
        ),
      ],
    ),
    child: IconButton(
        focusColor: backGroundColorBackAppBar,
        autofocus: true,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(backGroundColorBackAppBar)
        ),
        onPressed:() async{
        },
        icon: const Icon(Icons.mode_night_outlined, color: iconColor,size: 20.0,)
    ),
  );
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: searchForm,
        elevation: 1.0,
        actions: [
          Ink(
            padding: const EdgeInsets.all(0.0),
            decoration: const ShapeDecoration(
              color: Colors.white,
              shape: CircleBorder(),
              shadows: [
                BoxShadow(
                  // color: Colors.black.withOpacity(0.3),
                  spreadRadius: 0.1,
                  blurRadius: 2,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: IconButton(
                focusColor: backGroundColorBackAppBar,
                autofocus: true,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(backGroundColorBackAppBar)
                ),
                onPressed:() async{
                },
                icon: const Icon(Icons.notification_add, color: iconColor,size: 20.0,)
            ),
          ),
          const SizedBox(width: 5.0,),
          Ink(
            padding: const EdgeInsets.all(0.0),
            decoration: const ShapeDecoration(
              color: Colors.white,
              shape: CircleBorder(),
              shadows: [
                BoxShadow(
                  // color: Colors.black.withOpacity(0.3),
                  spreadRadius: 0.1,
                  blurRadius: 2,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: IconButton(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(backGroundColorBackAppBar)
                ),
                onPressed:() async{
                    String token = (await storage.read(key: "token"))!;
                    print('removed');
                    await storage.delete(key: token!);
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
                  },
                icon: const Icon(Icons.logout, color: iconColor,size: 25.0,)
            ),
          ),
        ],
        centerTitle: true,
      ),
      drawer:  Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
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
              child: UserAccountsDrawerHeader(
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
                  arrowColor: backGroundColorBackAppBar,
                  currentAccountPicture: Padding(
                    padding: const EdgeInsets.only(bottom: 25.0),
                    child: CircleAvatar(
                      radius: 18.0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: offWhiteColor,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: ClipOval(
                          child: Image.network("https://avatars.githubusercontent.com/u/38283140?s=96&v=4"),
                        ),
                      ),
                    ),
                  ),

                  accountName: CustomText(text: 'Mohamed Fadol', textStyle: const TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold)),
                  accountEmail: CustomText(text: 'mohamedtapo@gmail.com', textStyle: const TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold))
              ),
            ),

            CustomListTile(
              leading: const Icon(Icons.account_balance_wallet_outlined, color: backGroundColorAppBar, size: 25.0,),
              title:  CustomText(text: "My Wallet", textStyle: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal, color: backGroundColorAppBar)),
              trailing: const Icon(Icons.arrow_forward_ios_outlined,color: backGroundColorAppBar,),
              onTap: () {},
            ),
            CustomListTile(
              leading: const Icon(Icons.settings_input_composite_outlined, color: backGroundColorAppBar, size: 25.0,),
              title:  CustomText(text: "Portofilo", textStyle: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal, color: backGroundColorAppBar)),
              trailing: const Icon(Icons.arrow_forward_ios_outlined,color: backGroundColorAppBar,),
              onTap: () {},
            ),
            CustomListTile(
              leading: const Icon(Icons.query_stats_outlined, color: backGroundColorAppBar, size: 25.0,),
              title:  CustomText(text: "Statistic", textStyle: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal, color: backGroundColorAppBar)),
              trailing: const Icon(Icons.arrow_forward_ios_outlined,color: backGroundColorAppBar,),
              onTap: () {},
            ),
            CustomListTile(
              leading: const Icon(Icons.money, color: backGroundColorAppBar, size: 25.0,),
              title:  CustomText(text: "Transfer", textStyle: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal, color: backGroundColorAppBar)),
              trailing: const Icon(Icons.arrow_forward_ios_outlined,color: backGroundColorAppBar,),
              onTap: () {},
            ),
            CustomListTile(
              leading: const Icon(Icons.money_outlined, color: backGroundColorAppBar, size: 25.0,),
              title:  CustomText(text: "Withdraw", textStyle: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal, color: backGroundColorAppBar)),
              trailing: const Icon(Icons.arrow_forward_ios_outlined,color: backGroundColorAppBar,),
              onTap: () {},
            ),
            CustomListTile(
              leading: const Icon(Icons.settings, color: backGroundColorAppBar, size: 25.0,),
              title:  CustomText(text: "Settings", textStyle: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal, color: backGroundColorAppBar)),
              trailing: const Icon(Icons.arrow_forward_ios_outlined,color: backGroundColorAppBar,),
              onTap: () {},
            ),
            CustomListTile(
              leading: const Icon(Icons.newspaper, color: backGroundColorAppBar, size: 25.0,),
              title:  CustomText(text: "News List", textStyle: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal, color: backGroundColorAppBar)),
              trailing: const Icon(Icons.arrow_forward_ios_outlined,color: backGroundColorAppBar,),
              onTap: () {},
            ),
              SizedBox(),
            CustomListTile(
              title:  CustomText(text: "Logout", textStyle: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: backGroundColorAppBar)),
              trailing: const Icon(Icons.login_outlined,color: backGroundColorAppBar,),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: const AppNavigatorScreen(),
    );
  }
}



class AppNavigatorScreen extends StatefulWidget {
  const AppNavigatorScreen({super.key});

  @override
  _AppNavigatorScreenState createState() => _AppNavigatorScreenState();
}
class _AppNavigatorScreenState extends State<AppNavigatorScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeAppScren(),
    const DashboardHome(),
    const HomeAppScren(),
    const ProfilePage(),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
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
        child: BottomNavigationBar(
          elevation: 2,
          enableFeedback: true,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: const TextStyle(color: textColor, fontFamily: 'Pacifico', fontSize: 20.0),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white54,
          backgroundColor: Colors.transparent,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              print(index);
            });
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}



