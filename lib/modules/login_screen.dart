

import 'package:book_app/modules/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../shared/component/component.dart';
import '../shared/constants.dart';
import 'language_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundColor,
     drawer: Padding(
       padding: const EdgeInsets.all(20.0),
     ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/1463.png'), fit: BoxFit.fill),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: IconButton(
                    icon: const Icon(Icons.menu),
                    iconSize: 35,
                    color: Colors.blue,
                    onPressed: () {
                      navigateTo(widget: LanguageScreen(), context: context);
                    },
                  ),
                ),
                SizedBox(
                  height: height * 0.1,
                ),
                const Center(
                    child: Text(
                  'Let\'s Read',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Colors.teal),
                )),
                SizedBox(
                  height: height * 0.09,
                ),
                const Text(
                  'Sign in ',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.teal,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                defaultTextFormField(
                  labelText: 'Name',
                  prefixIcon: Icons.person,
                  controller: nameController,
                  keyboardType: TextInputType.text,
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return 'please Enter your Name';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                defaultTextFormField(
                  labelText: 'Email',
                  prefixIcon: Icons.email,
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return 'please Enter your Email';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                defaultTextFormField(
                  labelText: 'Password',
                  prefixIcon: Icons.lock,
                  controller: passwordController,
                  keyboardType: TextInputType.text,
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return 'please Enter your password';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                DefaultTextButton(
                    fontSize: 20,
                    color: Colors.teal,
                    text: 'Sign in',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        navigateAndRemove(context, SplashScreen());
                      }
                    },
                    height: 40,
                    width: 50,
                    textColor: Colors.white,
                    radius: 10)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
