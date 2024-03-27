import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:transfer_flutter/pages/auth/loginUi.dart';
import 'package:transfer_flutter/repository/auth_repository.dart';
import 'package:transfer_flutter/repository/currency_repository.dart';
import 'package:transfer_flutter/repository/transaction_repository.dart';
import 'package:transfer_flutter/repository/user_repository.dart';
import 'package:transfer_flutter/utility/user_preferences.dart';
import 'blocs/authentication/auth_bloc.dart';
import 'blocs.currencies/currency_bloc.dart';
import 'blocs.transactions/transaction_bloc.dart';
import 'blocs.users/user_bloc.dart';
import 'constants/constant.dart';
import 'models/user_model.dart';
import 'pages/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    Future<UserModel> getUserData () => UserPreferences().getAuthUser();

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc(AuthRepository())),
        BlocProvider(create: (context) => TransactionBloc(TransactionRepository())),
        BlocProvider(create: (context) => UserBloc(UserRepository())),
        BlocProvider(create: (context) => CurrencyBloc(CurrencyRepository())),
      ],
      child: MaterialApp(
        title: 'Exchange Coin',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            color: backGroundColorBackAppBar,
          ),
          useMaterial3: true,
        ),
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.system,
        home: AnimatedSplashScreen(
          splash: 'assets/logos/logo.png',
          nextScreen: FutureBuilder(
              future: getUserData(),
              builder: (context,AsyncSnapshot<UserModel> snapshot) {
                // print(snapshot.data!.token);
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return const CircularProgressIndicator();
                  default:
                    if (snapshot.hasError) {
                      print(snapshot.error);
                      return LoginPage();
                    } else if (snapshot.data?.token == null) {
                      return LoginPage();
                    } else {
                      return  HomeScreen();
                    }
                    return  LoginPage();
                }
              }),
          splashTransition: SplashTransition.rotationTransition,
          pageTransitionType: PageTransitionType.fade,
          backgroundColor: backGroundColor,
        ),
        routes:   {
          '/login': (context) => LoginPage(),
          '/home': (context) =>  HomeScreen(),
        },
      ),
    );
  }
}

