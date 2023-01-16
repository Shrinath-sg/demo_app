import 'dart:developer';

import 'package:demo_project/provider/my_provider.dart';
import 'package:demo_project/screens/home_screen.dart';
import 'package:demo_project/utils/colors.dart';
import 'package:demo_project/utils/globals.dart';
import 'package:demo_project/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pinput/pinput.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = '/loginScreen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _mobileCtl = TextEditingController();
  final TextEditingController _pinCtl = TextEditingController();
  @override
  void initState() {
  
    super.initState();
  }


  @override
  void dispose() {
    _mobileCtl.dispose();
    _pinCtl.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MyProvider>(
      context,
    );
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: primaryColor,
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * 0.30,
                  child: Text(
                    'INFO ASSURE',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.67,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      // mainAxisAlignment: Main,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Login",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        const Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Mobile number:')),
                        TextFormField(
                          controller: _mobileCtl,
                          keyboardType: TextInputType.number,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty || value.length < 10) {
                              return "Enter mobile number";
                            }
                            return null;
                          },
                        ),
                        Row(
                          children: [
                            const Align(
                                alignment: Alignment.centerLeft,
                                child: Text('PIN:')),
                            // const SizedBox(
                            //   width: 25,
                            // ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Pinput(
                                validator: (value) {
                                  if (value!.isEmpty || value.length < 4) {
                                    return "Enter Pin";
                                  }
                                  return null;
                                },
                                defaultPinTheme: const PinTheme(
                                  width: 56,
                                  height: 56,
                                  decoration: BoxDecoration(),
                                ),
                                preFilledWidget: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      width: 56,
                                      height: 2,
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ],
                                ),
                                length: 4,
                                cursor: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      width: 56,
                                      height: 3,
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ],
                                ),

                                pinAnimationType: PinAnimationType.slide,
                                controller: _pinCtl,
                                // showCursor: true,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            provider.isLoading
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : Expanded(
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                          foregroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.white),
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  primaryColor),
                                          shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                              const RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(20)),
                                                  side: BorderSide(
                                                      color: primaryColor)))),
                                      onPressed: () async {
                                        FocusScope.of(context).unfocus();
                                        if (_formKey.currentState!.validate()) {
                                          log("validated");

                                          final _result = await provider.login(
                                              _mobileCtl.text.trim(),
                                              _pinCtl.text);

                                          if (_result) {
                                            // ignore: use_build_context_synchronously
                                            Navigator.pushNamedAndRemoveUntil(
                                              context,
                                              HomeScreen.routeName,
                                              (route) => false,
                                            );
                                          }
                                        }
                                      },
                                      child: Text("LOGIN".toUpperCase(),
                                          style: const TextStyle(fontSize: 14)),
                                    ),
                                  ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text('First Time User? Register Here'),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text('Forgot Password/Pin',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: primaryColor)),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('Powered By:'),
                            ),
                            SizedBox(
                                height: 20,
                                child: Image.asset(
                                    "assets/images/infotrack-logo.jpg")),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
