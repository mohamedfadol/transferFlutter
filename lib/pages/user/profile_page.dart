import 'package:flutter/material.dart';
import '../../constants/constant.dart';
import '../widgets/custom_text.dart';
import 'package:intl/intl.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  TextEditingController emailInput = TextEditingController();
  TextEditingController passwordInput = TextEditingController();
  TextEditingController usernameInput = TextEditingController();
  TextEditingController dateInput = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final emailForm = TextFormField(
      controller: emailInput,
      validator: (String?  value){
        String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
        RegExp regex = RegExp(pattern);
        if(value!.isEmpty){return 'please enter your email';}
        else if(!regex.hasMatch(value!)){return 'Enter valid email address';}else {emailInput = value as TextEditingController;}
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.mail, color: backGroundColorAppBar,),
          filled: true,
          fillColor: const Color(0xFFF2F3F5),
          focusColor: backGroundColorAppBar,
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: backGroundColorAppBar),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            // borderSide: BorderSide(color: backGroundColorAppBar),
          ),
          labelText: 'E-mail',
          hintStyle: const TextStyle(fontWeight: FontWeight.bold, color: backGroundColorAppBar)
      ),
    );

    final username = TextFormField(
      controller: usernameInput,
      validator: (String?  value){
        if(value!.isEmpty){return 'please enter your Username';}
        else {
          return null;
        }
      },
      keyboardType: TextInputType.name,
      autofocus: false,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.person, color: backGroundColorAppBar,),
          filled: true,
          fillColor: const Color(0xFFF2F3F5),
          focusColor: backGroundColorAppBar,
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: backGroundColorAppBar),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            // borderSide: BorderSide(color: backGroundColorAppBar),
          ),
          labelText: 'Username',
          hintStyle: const TextStyle(fontWeight: FontWeight.bold, color: backGroundColorAppBar)
      ),
    );

    final passForm = TextFormField(
      controller: passwordInput,
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

    final dateForm =  TextField(
      controller: dateInput, //editing controller of this TextField
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.calendar_today, color: backGroundColorAppBar,),
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
          labelText: 'Enter Age',
          hintStyle: const TextStyle(fontWeight: FontWeight.bold, color: backGroundColorAppBar)
      ),
      readOnly: true,  //set it true, so that user will not able to edit text
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
            context: context, initialDate: DateTime.now(),
            firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
            lastDate: DateTime(2101)
        );

        if(pickedDate != null ){
          print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
          String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
          print(formattedDate); //formatted date output using intl package =>  2021-03-16
          //you can implement different kind of Date Format here according to your requirement

          setState(() {
            dateInput.text = formattedDate; //set output date to TextField value.
          });
        }else{
          print("Date is not selected");
        }
      },
    );

    final loginButton = ElevatedButton(
      style: ElevatedButton.styleFrom(
        shadowColor: Colors.lightBlueAccent,
        elevation: 1,
        backgroundColor: backGroundColorAppBar,
        fixedSize: const Size(200.0, 50.2),
        shape: const StadiumBorder(),
      ),
      onPressed: () {
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
          child: Center(child: CustomText(text:'Update ',textStyle: const TextStyle(fontFamily: 'Pacifico',fontWeight: FontWeight.normal, fontSize: 20.0, color: textColor),))
      ),
    );

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
            children: [
                const Padding(
                  padding: EdgeInsets.only(right: 270.0),
                 child: ProfileImageWidget(imageUrl: 'https://avatars.githubusercontent.com/u/38283140?s=400&u=eecfd119c5df7ca270f0a666908a0005dc64de1b&v=4'),

              ),
                const SizedBox(height: 16.0),
                username,
                const SizedBox(height: 16.0),
                emailForm,
                const SizedBox(height: 16.0),
                passForm,
                const SizedBox(height: 16.0),
                dateForm,
                const SizedBox(height: 16.0),
                loginButton
            ],
        ),
      ),
    );
  }
}


class ProfileImageWidget extends StatelessWidget {
  final String imageUrl;

  const ProfileImageWidget({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 52.0,
      backgroundColor: Colors.red,
      // onBackgroundImageError: (e, s) {
      //   debugPrint('image issue, $e,$s');
      // },
      child: Container(
        decoration:  BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: backGroundColorBackAppBar, // Shadow color
              spreadRadius: 3,
              blurRadius: 7,
              offset: Offset(0, 3), // Changes the position of the shadow
            ),
          ],
          borderRadius: BorderRadius.circular(30.0),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.1, 1.0],
            colors: [
              backGroundColorBackAppBar,
              backGroundColorAppBar,
            ],
          ),
        ),
        child: ClipOval(
          child: Image.network(
            imageUrl,
            width: 100.0,
            height: 100.0,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
