import 'dart:math';
import 'package:flutter/material.dart';
import 'package:foodies/model/LoginModel.dart';
import 'package:foodies/providers/LoginRegisProvider.dart';
import 'package:foodies/utils/globalFunction.dart';
import 'package:foodies/utils/myColorApp.dart';
import 'package:foodies/views/login/screenLogin.dart';
import 'package:foodies/widgets/customDialog.dart';
import 'package:provider/provider.dart';

void showCustomDialog(BuildContext context, String title, String subtile,
    Color color, Icon icon) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return CustomDialog(
          title: title, subtile: subtile, color: color, icon: icon);
    },
  );
}

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

  @override
  Widget build(BuildContext context) {
    final provUser = Provider.of<UserLoginProvider>(context);

    return Scaffold(
      backgroundColor: ColorConstants.primaryColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Buat akun baru',
                      style: TextStyle(
                          fontSize: 20,
                          color: ColorConstants.textWhite,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                        width: 150,
                        child: Image.asset(
                            'assets/images/imgApp/logo-text-h.png')),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
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
                      obscureText: mounted,
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
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 30),
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
                                password: _inputPasswordController.text,
                                mySave: []));

                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ScreenLogin()));

                            showCustomDialog(
                                context,
                                'Berhasil',
                                'Akun Berhasil Terdaftar',
                                Colors.green,
                                Icon(Icons.check));
                          } else {
                            showCustomDialog(
                                context,
                                'Gagal',
                                'Lengkapi data anda dahulu!',
                                Colors.red,
                                Icon(Icons.close));
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
      ),
    );
  }
}
