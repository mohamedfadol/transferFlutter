import 'package:transfer_flutter/pages/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/constant.dart';

class OTPScreen extends StatefulWidget {
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  // Text editing controllers for each TextField
  final controllers = List.generate(5, (_) => TextEditingController());
  // Focus nodes for each TextField
  final focusNodes = List.generate(5, (_) => FocusNode());

  @override
  void dispose() {
    // Dispose controllers and focus nodes
    for (var controller in controllers) {
      controller.dispose();
    }
    for (var focusNode in focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final loginButton = ElevatedButton(
      style: ElevatedButton.styleFrom(
        shadowColor: Colors.lightBlueAccent,
        elevation: 1,
        backgroundColor: backGroundColorAppBar,
        fixedSize: const Size(200.0, 50.2),
        shape: const StadiumBorder(),
      ),
      onPressed: () {
          Navigator.pushNamed(context, '/home');
        // authBloc!.add(LoginEvent(email: email.text, password: password.text));
        },
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
          child: Center(child: CustomText(text:'Verification',textStyle: const TextStyle(fontFamily: 'Pacifico',fontWeight: FontWeight.normal, fontSize: 20.0, color: textColor),))
      ),
    );

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        automaticallyImplyLeading: false,
        leadingWidth: 35,
        centerTitle: false,
        leading: const BackButton(color: iconColor,),
        elevation: 2.0,
        title: CustomText(text: 'OTP Verification', textStyle: const TextStyle(color: textColor, fontSize: 15.0, fontWeight: FontWeight.bold),),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(-18.0), // i want to set second AppBar's height
          child: SizedBox(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Enter OTP', style: Theme.of(context).textTheme.headline4),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(5, (index) => buildTextField(index)),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Handle OTP submission
              },
              child: loginButton,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(int index) {
    return SizedBox(
      width: 45,
      child: TextField(
        controller: controllers[index],
        focusNode: focusNodes[index],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        decoration: const InputDecoration(
          counterText: "", // Hide counter text beneath the TextField
          border: OutlineInputBorder(),
        ),
        onChanged: (value) {
          if (value.length == 1) {
            // Move to next field
            if (index < 4) {
              FocusScope.of(context).requestFocus(focusNodes[index + 1]);
            }
          } else if (value.isEmpty) {
            // Move to previous field
            if (index > 0) {
              FocusScope.of(context).requestFocus(focusNodes[index - 1]);
            }
          }
        },
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
    );
  }
}
