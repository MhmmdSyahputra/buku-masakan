import 'package:flutter/material.dart';
import 'package:foodies/providers/LoginRegisProvider.dart';
import 'package:foodies/utils/myColorApp.dart';
import 'package:provider/provider.dart';

class ScreenUpdateProfile extends StatefulWidget {
  const ScreenUpdateProfile({super.key});

  @override
  State<ScreenUpdateProfile> createState() => _ScreenUpdateProfileState();
}

class _ScreenUpdateProfileState extends State<ScreenUpdateProfile> {
  @override
  Widget build(BuildContext context) {
    final provIdUser = Provider.of<UserLoginProvider>(context);
    final user = Provider.of<UserLoginProvider>(context)
        .getUserById(provIdUser.idUserDoLogin);

    return Scaffold(
      backgroundColor: ColorConstants.themeColor,
      appBar: AppBar(
        backgroundColor: ColorConstants.themeColor,
        title: Text('Update Data'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {},
                child: Text('Update'),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    primary: ColorConstants.primaryColor,
                    padding: const EdgeInsets.symmetric(horizontal: 10))),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: ListTile(
                  leading: Icon(
                    Icons.person,
                    size: 80,
                    color: ColorConstants.textWhite,
                  ),
                  title: Text(
                    '${user.username}',
                    style: TextStyle(
                        color: ColorConstants.textWhite, fontSize: 18),
                  ),
                  subtitle: Text(
                    '${user.email}',
                    style: TextStyle(
                        color: ColorConstants.textWhite, fontSize: 18),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nama',
                      style: TextStyle(color: ColorConstants.textWhite),
                    ),
                    Text(
                      '${user.username}',
                      style: TextStyle(
                          color: ColorConstants.textWhite,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    Divider(
                      color: ColorConstants.textWhite,
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ID Cookpad',
                      style: TextStyle(color: ColorConstants.textWhite),
                    ),
                    Text(
                      '@',
                      style: TextStyle(
                          color: ColorConstants.textWhite,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    Divider(
                      color: ColorConstants.textWhite,
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Email',
                      style: TextStyle(color: ColorConstants.textWhite),
                    ),
                    Text(
                      '${user.email}',
                      style: TextStyle(
                          color: ColorConstants.textWhite,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    Divider(
                      color: ColorConstants.textWhite,
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Lokasi',
                      style: TextStyle(color: ColorConstants.textWhite),
                    ),
                    Text(
                      '',
                      style: TextStyle(
                          color: ColorConstants.textWhite,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    Divider(
                      color: ColorConstants.textWhite,
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tentang kamu dan masakanmu',
                      style: TextStyle(color: ColorConstants.textWhite),
                    ),
                    Text(
                      '',
                      style: TextStyle(
                          color: ColorConstants.textWhite,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    Divider(
                      color: ColorConstants.textWhite,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
