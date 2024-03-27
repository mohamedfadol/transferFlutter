import 'package:transfer_flutter/blocs/authentication/auth_bloc.dart';
import 'package:transfer_flutter/pages/auth/otp_screen.dart';
import 'package:transfer_flutter/pages/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constants/constant.dart';
import '../widgets/CustomImageWidget.dart';
import '../widgets/custom_app_bar.dart';

class LoginPage extends StatefulWidget {

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin{
  TextEditingController email = TextEditingController(text: 'test@test.com');
  TextEditingController password = TextEditingController(text: 'test@test.com');
  AuthBloc? authBloc;

  late AnimationController _controller;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authBloc = BlocProvider.of<AuthBloc>(context);
    // Animation setup
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2), // Adjust the duration as needed
    );
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    // Print statements for debugging
    _controller.addListener(() {
      print("Animation value: ${_controller.value}");
    });
    // Start the animation when the page is first loaded
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final logo = AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          print("Builder Animation value: ${_controller.value}");
          return Opacity(
            opacity: _opacityAnimation.value,
            child: Center(
              child: Image.asset('assets/logos/logo.png',
                width: 150.0, // Adjust the size as needed
                height: 150.0,
              ), // Adjust the path accordingly
            ),
          );
        }
    );

    final msg = BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state){
                        if(state is AuthErrorState){
                            return CustomText(text: state.message);
                        }else if(state is AuthLoadingState){
                          return const Center(child: CircularProgressIndicator(color: Colors.green,),);
                        }else {
                          return Container();
                        }
                    }
                );

    final loginButton = ElevatedButton(
      style: ElevatedButton.styleFrom(
        shadowColor: Colors.lightBlueAccent,
        elevation: 1,
        backgroundColor: backGroundColorAppBar,
        fixedSize: const Size(200.0, 50.2),
        shape: const StadiumBorder(),
      ),
      onPressed: () { authBloc!.add(LoginEvent(email: email.text, password: password.text)); },
      child: Container(
                      width: double.infinity,
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
                      child: Center(child: CustomText(text:'Login',textStyle: const TextStyle(fontFamily: 'Pacifico',fontWeight: FontWeight.normal, fontSize: 20.0, color: textColor),))
                  ),
    );

    final username = TextFormField(
      controller: email,
      validator: (String?  value){
        String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
        RegExp regex = RegExp(pattern);
        if(value!.isEmpty){return 'please enter your email';}
        else if(!regex.hasMatch(value!)){return 'Enter valid email address';}else {email = value as TextEditingController;}
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.mail, color: backGroundColorAppBar,),
          filled: true,
          fillColor: const Color(0xFFF2F3F5),
          focusColor: backGroundColorAppBar,
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: const BorderSide(color: backGroundColorAppBar),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            // borderSide: BorderSide(color: backGroundColorAppBar),
          ),
          labelText: 'E-mail',
          hintStyle: const TextStyle(fontWeight: FontWeight.bold, color: backGroundColorAppBar)
      ),
    );

    final pass = TextFormField(
      controller: password,
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.lock, color: backGroundColorAppBar,),
          filled: true,
          fillColor: const Color(0xFFF2F3F5),
          focusColor: backGroundColorAppBar,
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(color: backGroundColorAppBar),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            // borderSide: BorderSide(color: backGroundColorAppBar),
          ),
          labelText: 'Password',
          hintStyle: const TextStyle(fontWeight: FontWeight.bold, color: backGroundColorAppBar)
      ),

    );

    final forgetPassword = InkWell(
      child: CustomText(text: "Forget Password",textStyle: const TextStyle(fontFamily: 'Pacifico',fontWeight: FontWeight.normal, fontSize: 20.0, color: backGroundColorAppBar)),
      onTap: (){},
    );

    final orSignby = InkWell(
      child: Center(child: CustomText(text: "OR",textStyle: const TextStyle(fontFamily: 'Pacifico',fontWeight: FontWeight.normal, fontSize: 20.0, color: backGroundColorAppBar))),
      onTap: (){},
    );

    final socialButtonLogin = Row(

      children: [
        Expanded(
          child: Container(
            height: 50.0,
            padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 5.0),
            decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.grey,
                  width : 1.0
              ),
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            ),
            child: const Center(child: CustomImageWidget(imagePath: 'assets/icons/apple.svg',width: 80,height: 80,fit: BoxFit.contain,),),
          ),
        ),
        const SizedBox(width: 10.0,),
        Expanded(child: Container(
          height: 50.0,
          padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 5.0),
          decoration:  BoxDecoration(
            border: Border.all(
                color: Colors.grey,
                width : 1.0
            ),
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          ),
          child: const Center(
            child: CustomImageWidget(imagePath: 'assets/icons/google.svg',width: 80,height: 80,fit: BoxFit.contain,),),
        ),)

    ],);

    return SafeArea(
      child: AnnotatedRegion(
        value: const SystemUiOverlayStyle(
          statusBarColor: backGroundColorBackAppBar,
          statusBarIconBrightness: Brightness.dark,
        ),
      child: Scaffold(
        backgroundColor: backGroundColor,
        appBar: const CustomAppBar(),
        body: BlocListener<AuthBloc, AuthState>(
          listener: (context, state){
            if(state is AuthSuccessState){
              // Navigator.pushNamed(context, '/home');
              Navigator.push(context,MaterialPageRoute(builder: (context) => OTPScreen()),);
              _showDynamicInfoSnackBar(context,'Login Have Successfully 👏', Colors.white, Icons.gpp_good, Colors.green);
            }else if(state is AuthLoadingState){
               const Center(child: CircularProgressIndicator(color: Colors.green,),);
            }else if(state is AuthErrorState){
              _showDynamicInfoSnackBar(context, 'Login Have Wrong 😅',Colors.white , Icons.error_outline ,Colors.red);
            }
          },
          child: Center(
            child: ListView(
              shrinkWrap: true,
              padding:  const EdgeInsets.all(16.0),
              children: [
                msg,
                const SizedBox(height: 16.0),
                username,
                const SizedBox(height: 9.0),
                pass,
                const SizedBox(height: 30.0),
                loginButton,
                const SizedBox(height: 13.0,),
                forgetPassword,
                const SizedBox(height: 15.0,),
                orSignby,
                const SizedBox(height: 15.0,),
                socialButtonLogin
              ],
            ),
          ),
        ),
      ),
    ),
    );
  }



  void _showDynamicInfoSnackBar(BuildContext context,String text, Color? backgroundColor , IconData? icon, Color? iconColor) {
    ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(
           duration: const Duration(seconds: 2),
            elevation: 1,
            backgroundColor: backgroundColor,
            content: Center(
                child: Center(
                  child: Stack(
                    alignment: AlignmentDirectional.topCenter,
                    clipBehavior: Clip.none,
                    children: [
                      Card(
                        color: Colors.green.shade50,
                        child:  Padding(
                          padding: const EdgeInsets.fromLTRB(32, 56, 32, 32),
                          child: CustomText(text: text, textStyle: const TextStyle(fontSize: 15.0, color: Colors.black,fontWeight: FontWeight.bold,)),
                        ),
                      ),
                      Positioned(
                        top: -40,
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.green.shade50, width: 4),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(icon, color: iconColor, size: 48),
                        ),
                      )
                    ],
                  ),
                )
            )
        )
    );
  }



}

