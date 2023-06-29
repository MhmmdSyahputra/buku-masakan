import 'package:flutter/material.dart';
import 'package:foodies/providers/LoginRegisProvider.dart';
import 'package:foodies/utils/myColorApp.dart';
import 'package:foodies/views/bottomNavigation.dart';
import 'package:foodies/views/regis/screenRegister.dart';
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                      'Selamat Datang di',
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
                      controller: _inputEmailController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
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
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 30),
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
                                  user.password ==
                                      _inputPasswordController.text,
                            );

                            //simpan id user yg login
                            provLogin.userDoLogin(dataUser.id);

                            // lempar dia ke halaman utama
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => BottomNavMain()));
                            return;
                          } else {
                            showCustomDialog(
                                context,
                                'Gagal',
                                'Email/Password Salah!',
                                Colors.red,
                                Icon(Icons.close));
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
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 30),
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
      ),
    );
  }
}
