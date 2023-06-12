import 'package:carvendor/constants.dart';
import 'package:carvendor/home_screen.dart';
import 'package:carvendor/privacy_policy.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class SigninScreen extends StatefulWidget {
  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: SingleChildScrollView(
                child: Container(
                    color: Colors.white,
                    margin: EdgeInsets.only(left: 20, right: 20),
                    height: MediaQuery.of(context).size.height - 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        Center(
                            child: Image.asset('assets/logo.png',height: 200,
                        )),
                        SizedBox(
                          height: 10,
                        ),

                        Form(
                            key: _formkey,
                            autovalidateMode: AutovalidateMode.disabled,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Email',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(height: 2),
                                TextFormField(
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter username';
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(16),
                                      border: customBorder,
                                      fillColor: Colors.white,
                                      filled: true,
                                      hintText: 'Email',
                                      errorBorder: customerrorBorder,
                                      focusedBorder: customfocusBorder,
                                      enabledBorder: customBorder),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  'Password',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(height: 2),
                                TextFormField(
                                  obscureText: true,
                                  validator: (value) {
                                    if (value!.trim().isEmpty) {
                                      return 'Please enter password';
                                    }

                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(16),
                                      border: customBorder,
                                      fillColor: Colors.white,
                                      filled: true,
                                      hintText: 'Password',
                                      suffixIcon: IconButton(
                                          icon: Icon(
                                               Icons.visibility,
                                              color: Colors.black),
                                          onPressed: () {
                                          }),
                                      errorBorder: customerrorBorder,
                                      focusedBorder: customfocusBorder,
                                      enabledBorder: customBorder),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Forget password?',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                        child: MaterialButton(
                                          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                                          color: Colors.amber,
                                          shape: kShape,
                                          onPressed: () {
                                            Get.to(HomeScreen());
                                          },
                                          child: const Text(
                                            'Login',
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black,
                                            ),
                                          ),
                                        )),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Checkbox(
                                        side: BorderSide(
                                          color: Colors.deepOrangeAccent,
                                          width: 1.5,
                                        ),
                                        checkColor: Colors.white,
                                        value: false,
                                        activeColor: Colors.deepOrangeAccent,
                                        onChanged: (value) {
                                         // siginInController.toogleCheckbox();
                                        },
                                      ),
                                      Expanded(child: PrivacyPolicy()),
                                    ])
                              ],
                            )),
                      ],
                    )))),
      );
  }
}
