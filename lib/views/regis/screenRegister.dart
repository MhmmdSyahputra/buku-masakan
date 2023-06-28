import 'dart:math';

import 'package:flutter/material.dart';
import 'package:foodies/model/LoginModel.dart';
import 'package:foodies/providers/LoginRegisProvider.dart';
import 'package:foodies/utils/myColorApp.dart';
import 'package:foodies/views/login/screenLogin.dart';
import 'package:provider/provider.dart';

class ScreenRegister extends StatefulWidget {
  const ScreenRegister({super.key});

  @override
  State<ScreenRegister> createState() => _ScreenRegisterState();
}

class _ScreenRegisterState extends State<ScreenRegister> {
  final TextEditingController _inputUsernameController =
      TextEditingController();
  final TextEditingController _inputEmailController = TextEditingController();
  final TextEditingController _inputPasswordController =
      TextEditingController();

  int generateId() {
    DateTime now = DateTime.now();
    int milliseconds = now.millisecondsSinceEpoch;
    // membuat nilai acak berdasarkan waktu dalam milidetik dan tanggal
    Random random = Random(milliseconds);
    return random.nextInt(100);
  }

  @override
  Widget build(BuildContext context) {
    final provUser = Provider.of<UserLoginProvider>(context);

    return Scaffold(
      backgroundColor: ColorConstants.primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Column(
                children: [
                  Text(
                    'Buat AKun Baru',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 70,
            ),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  child: TextField(
                    controller: _inputUsernameController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            20), // Ganti dengan radius yang diinginkan
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Username',
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  child: TextField(
                    controller: _inputEmailController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.mail),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            20), // Ganti dengan radius yang diinginkan
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Email',
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  child: TextField(
                    controller: _inputPasswordController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            20), // Ganti dengan radius yang diinginkan
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Password',
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: Text('Register')),
                ),
                Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                    width: double.infinity,
                    height: 70,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_inputUsernameController.text != '' ||
                            _inputEmailController.text != '' ||
                            _inputPasswordController.text != '') {
                          provUser.register(UserLoginModel(
                              id: generateId().toString(),
                              username: _inputUsernameController.text,
                              email: _inputEmailController.text,
                              password: _inputPasswordController.text));

                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ScreenLogin()));

                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                child: Stack(
                                  alignment: Alignment.center,
                                  clipBehavior: Clip.none,
                                  children: [
                                    Container(
                                      height: 180,
                                      width: 250,
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(5, 50, 5, 5),
                                        child: Column(
                                          children: [
                                            Text('Berhasil',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                textAlign: TextAlign.center),
                                            SizedBox(height: 10),
                                            Text('Registrasi Akun Berhasil',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                ),
                                                textAlign: TextAlign.center),
                                            SizedBox(height: 20),
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text('OK'),
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.green,
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 15,
                                                      horizontal: 35)),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                        top: -30,
                                        child: CircleAvatar(
                                          radius: 30,
                                          backgroundColor: Colors.white,
                                          child: CircleAvatar(
                                            backgroundColor: Colors.green,
                                            radius: 26,
                                            child: Icon(Icons.check,
                                                size: 30, color: Colors.white),
                                          ),
                                        )),
                                  ],
                                ),
                              );
                            },
                          );
                        } else {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                child: Stack(
                                  alignment: Alignment.center,
                                  clipBehavior: Clip.none,
                                  children: [
                                    Container(
                                      height: 180,
                                      width: 250,
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(5, 50, 5, 5),
                                        child: Column(
                                          children: [
                                            Text('Gagal!',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                textAlign: TextAlign.center),
                                            SizedBox(height: 10),
                                            Text('Lengkapi Data Anda Dahulu!',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                ),
                                                textAlign: TextAlign.center),
                                            SizedBox(height: 20),
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text('OK'),
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.red,
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 15,
                                                      horizontal: 35)),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                        top: -30,
                                        child: CircleAvatar(
                                          radius: 30,
                                          backgroundColor: Colors.white,
                                          child: CircleAvatar(
                                            backgroundColor: Colors.red,
                                            radius: 26,
                                            child: Icon(Icons.close,
                                                size: 30, color: Colors.white),
                                          ),
                                        )),
                                  ],
                                ),
                              );
                            },
                          );
                        }
                      },
                      child: Text(
                        'Buat Akun',
                        style: TextStyle(fontSize: 18),
                      ),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          primary: Colors.blue),
                    )),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: InkWell(
                    onTap: () => Navigator.of(context).pop(MaterialPageRoute(
                        builder: (context) => ScreenRegister())),
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
