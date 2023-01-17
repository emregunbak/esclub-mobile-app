import 'dart:convert';
import 'package:esclub/components/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:lottie/lottie.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _Register();
}

class _Register extends State<Register> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String username = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "EsClub",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("EsClub"),
          centerTitle: true,
          backgroundColor: Colors.red[900],
        ),
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: 250,
                  child: Lottie.asset("assets/animations/register.json"),
                ),
                Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.red[900], fontSize: 30),
                    )),
                Container(
                    margin: const EdgeInsets.only(top: 5.0, bottom: 10.0),
                    alignment: Alignment.center,
                    child: const Text(
                      'Create an Account, It is free!',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: 15),
                    )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Username",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextField(
                      onSubmitted: (String value) {
                        setState(() {
                          username = value;
                        });
                      },
                      obscureText: true,
                      decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Password",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextField(
                      onSubmitted: (String value) {
                        setState(() {
                          password = value;
                        });
                      },
                      obscureText: true,
                      decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                ),
                Container(
                    height: 50,
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red[900],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40))),
                      child: const Text('Sign Up'),
                      onPressed: () async {
                        Response response = await post(
                          Uri.parse(
                              'http://10.0.2.2:8080/api/v1/auth/register'),
                          headers: <String, String>{
                            'Content-Type': 'application/json; charset=UTF-8',
                          },
                          body: jsonEncode(<String, String>{
                            'username': username,
                            'email': "$username@gmail.com",
                            'password': password,
                            'role': "USER"
                          }),
                        );
                        if (response.statusCode == 201) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Home()),
                          );
                        } else {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  scrollable: true,
                                  title: const Text('Failed'),
                                  actions: [
                                    ElevatedButton(
                                        child: const Text("Ok"),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const Register()),
                                          );
                                        })
                                  ],
                                  content: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(response.body)),
                                );
                              });
                        }
                      },
                    )),
              ],
            )),
      ),
    );
  }
}
