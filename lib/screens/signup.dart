import 'dart:convert';

import 'package:batik_srikandi/screens/login.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;

import '../global.dart';

class SignupScreen extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordconfirmationController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    register() async {
      String name = nameController.text;
      String email = emailController.text;
      String password = passwordController.text;
      String password_confirmation = passwordconfirmationController.text;
      Uri url = Uri.parse("http://10.0.2.2:8000/api/register");
      var hasilResponse = await http.post(
        url,
        body: {
          "name": name,
          "email": email,
          "password": password,
          "password_confirmation": password_confirmation,
        },
        headers: {
          "Acceept": "application/json",
        },
      );
      print(hasilResponse.statusCode);
      if (hasilResponse.statusCode == 201) {
/**
* hasilnya adalah {"token":"QpwL5tke4Pnpja7X4"}
*/
        print(hasilResponse.body);
/**
* dilakukan proses decode untuk 
* mendapatkan nilai dari variabel token
*/
        var result = json.decode(hasilResponse.body);
        var token = result['token'];
        print(token);

        AlertDialog alert = AlertDialog(
          title: Text("Register Berhasil"),
          content: Container(
            child: Text("Selamat anda sudah berhasil register!"),
          ),
          actions: [
            TextButton(
              child: Text(
                'Ok',
                style: TextStyle(color: Colors.yellow),
              ),
              onPressed: () => Navigator.of(context)
                  .pop(MaterialPageRoute(builder: (context) {
                return LoginScreen();
              })),
            ),
          ],
        );

        showDialog(context: context, builder: (context) => alert);
        return;
      } else {
        AlertDialog alert = AlertDialog(
          title: Text("Register Gagal"),
          content: Container(
            child: Text("Cek koneksi anda"),
          ),
          actions: [
            TextButton(
              child: Text(
                'Ok',
                style: TextStyle(color: Colors.yellow),
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );

        showDialog(context: context, builder: (context) => alert);
        return;
      }
    }

    return Scaffold(
      backgroundColor: backgroudColor,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 50, left: 12, right: 12),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Lottie.network(
                          'https://assets10.lottiefiles.com/packages/lf20_wd1udlcz.json')),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "Register",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    width: MediaQuery.of(context).size.width - 50,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: cardColor),
                    child: Column(
                      children: [
                        Card(
                          elevation: 3,
                          child: TextField(
                            controller: nameController,
                            style: const TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 17),
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(10),
                                fillColor: Colors.amber,
                                focusColor: Colors.amber,
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w300),
                                hintText: "Username"),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Card(
                          elevation: 3,
                          child: TextField(
                            controller: emailController,
                            style: const TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 17),
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(10),
                                fillColor: Colors.amber,
                                focusColor: Colors.amber,
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w300),
                                hintText: "Email"),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Card(
                          elevation: 3,
                          child: TextField(
                            controller: passwordController,
                            obscureText: true,
                            style: const TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 17),
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(10),
                                fillColor: Colors.amber,
                                focusColor: Colors.amber,
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w300),
                                hintText: "Password"),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Card(
                          elevation: 3,
                          child: TextField(
                            controller: passwordconfirmationController,
                            obscureText: true,
                            style: const TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 17),
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(10),
                                fillColor: Colors.amber,
                                focusColor: Colors.amber,
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w300),
                                hintText: "Confirm Password"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                            text: 'Sudah memiliki akun?',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 18),
                            children: <TextSpan>[
                              TextSpan(
                                  text: ' Login',
                                  style: const TextStyle(
                                      color: Colors.indigo, fontSize: 18),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pop(context);
                                    })
                            ]),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 18, 24, 192),
                        ),
                        onPressed: () {
                          register();
                        },
                        child: const Text('Register'),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
