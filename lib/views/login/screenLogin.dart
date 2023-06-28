import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:foodies/providers/LoginRegisProvider.dart';
import 'package:foodies/utils/myColorApp.dart';
import 'package:foodies/views/bottomNavigation.dart';
import 'package:foodies/views/regis/screenRegister.dart';
import 'package:provider/provider.dart';

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({super.key});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final TextEditingController _inputEmailController = TextEditingController();
  final TextEditingController _inputPasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    final provLogin = Provider.of<UserLoginProvider>(context);

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
                    'Selamat Datang di',
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
                    controller: _inputEmailController,
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
                    controller: _inputPasswordController,
                    obscureText: mounted,
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
                      child: InkWell(
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => ScreenRegister())),
                          child: Text('Register'))),
                ),
                Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                    width: double.infinity,
                    height: 70,
                    child: ElevatedButton(
                      onPressed: () {
                        //cari userlogin apakah ada atau tidak
                        final isFound = provLogin.userLoginList.any((user) =>
                            user.email == _inputEmailController.text &&
                            user.password == _inputPasswordController.text);

                        //jika ada maka
                        if (isFound) {
                          //ambil data yg login itu
                          final dataUser = provLogin.userLoginList.firstWhere(
                            (user) =>
                                user.email == _inputEmailController.text &&
                                user.password == _inputPasswordController.text,
                          );

                          //simpan id user yg login
                          provLogin.userDoLogin(dataUser.id);

                          // lempar dia ke halaman utama
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => BottomNavMain()));
                          return;
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
                                            Text('Username/Password Salah!',
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
                        'Masuk',
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
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                    width: double.infinity,
                    height: 70,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Masuk Dengan Akun Google',
                        style: TextStyle(
                            fontSize: 14, color: ColorConstants.textBlack),
                      ),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          primary: Color(0xFFE2A369)),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
