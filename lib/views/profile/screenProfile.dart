import 'package:flutter/material.dart';
import 'package:foodies/providers/LoginRegisProvider.dart';
import 'package:foodies/utils/myColorApp.dart';
import 'package:foodies/views/login/screenLogin.dart';
import 'package:foodies/views/profile/resep/mainResepProfile.dart';
import 'package:foodies/views/profile/tersimpan/mainTersimpanProfile.dart';
import 'package:provider/provider.dart';

class ScreenProfile extends StatefulWidget {
  const ScreenProfile({super.key});

  @override
  State<ScreenProfile> createState() => _ScreenProfileState();
}

class _ScreenProfileState extends State<ScreenProfile> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final provIdUser = Provider.of<UserLoginProvider>(context);
    final user = Provider.of<UserLoginProvider>(context)
        .getUserById(provIdUser.idUserDoLogin);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: CircleAvatar(
            radius: 10,
            child: Icon(
              Icons.person,
              size: 20,
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${user.username}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
            Text(
              '${user.email}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.bar_chart),
            onPressed: () {
              // Aksi yang ingin dilakukan saat tombol di tekan
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Aksi yang ingin dilakukan saat tombol di tekan
            },
          ),
          PopupMenuButton<MenuItem>(
              onSelected: (value) {
                if (value == MenuItem.Profil) {
                } else if (value == MenuItem.Pengaturan) {
                } else if (value == MenuItem.Logout) {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ScreenLogin()));
                }
              },
              itemBuilder: (context) => [
                    PopupMenuItem(
                        value: MenuItem.Pengaturan, child: Text('Pengaturan')),
                    PopupMenuItem(
                        value: MenuItem.Pengaturan, child: Text('Pengaturan')),
                    PopupMenuItem(
                        value: MenuItem.Logout, child: Text('Logout')),
                  ])
        ],
      ),
      backgroundColor: ColorConstants.themeColor,
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            color: Colors.black,
            padding: EdgeInsets.only(top: 15),
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    width: _selectedIndex == 0 ? 3 : 0,
                    color: _selectedIndex == 0
                        ? ColorConstants.primaryColor
                        : Colors.transparent,
                  ))),
                  child: InkWell(
                    onTap: () => setState(() {
                      _selectedIndex = 0;
                    }),
                    child: Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Text(
                            'Tersimpan',
                            style: TextStyle(
                                fontSize: 18, color: ColorConstants.textWhite),
                          ),
                        )),
                  ),
                )),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    width: _selectedIndex == 1 ? 3 : 0,
                    color: _selectedIndex == 1
                        ? ColorConstants.primaryColor
                        : Colors.transparent,
                  ))),
                  child: InkWell(
                    onTap: () => setState(() {
                      _selectedIndex = 1;
                    }),
                    child: Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Text(
                            'Resep',
                            style: TextStyle(
                                fontSize: 18, color: ColorConstants.textWhite),
                          ),
                        )),
                  ),
                )),
              ],
            ),
          ),
          Container(
            child: _selectedIndex == 0
                ? TersimpanMainProfile()
                : ResepMainProfile(),
          )
        ],
      )),
    );
  }
}

enum MenuItem {
  Profil,
  Pengaturan,
  Logout,
}
