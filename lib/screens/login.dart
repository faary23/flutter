import 'dart:convert';

import 'package:batik_srikandi/global.dart';
import 'package:batik_srikandi/screens/signup.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:batik_srikandi/screens/home_page.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    loginProcess() async {
      String email = emailController.text;
      String password = passwordController.text;
      Uri url = Uri.parse("http://10.0.2.2:8000/api/login");
      var hasilResponse = await http.post(
        url,
        body: {
          "email": email,
          "password": password,
        },
        headers: {
          "Acceept": "application/json",
        },
      );
      print(hasilResponse.statusCode);
      if (hasilResponse.statusCode == 200) {
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
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => HomePage(
                  email: email,
                  password: password,
                )));
      } else {
        AlertDialog alert = AlertDialog(
          title: Text("Login Gagal"),
          content: Container(
            child: Text("Cek detail login anda"),
          ),
          actions: [
            TextButton(
              child: Text(
                'Ok',
                style: TextStyle(color: Colors.blue),
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
                          'https://assets2.lottiefiles.com/packages/lf20_mjlh3hcy.json')),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "Login",
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
                        Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                                onPressed: () {},
                                child: const Text(
                                  "Forgot Password?",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),
                                )))
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                            text: 'Belum memiliki akun?',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 18),
                            children: <TextSpan>[
                              TextSpan(
                                  text: ' Register',
                                  style: const TextStyle(
                                      color: Color.fromARGB(255, 223, 228, 229),
                                      fontSize: 18),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SignupScreen()));
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
                          primary: Color.fromARGB(255, 136, 87, 14),
                        ),
                        onPressed: () {
                          loginProcess();
                        },
                        child: const Text('Login'),
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
