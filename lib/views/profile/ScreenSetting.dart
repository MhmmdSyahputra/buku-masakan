import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:foodies/utils/data.dart';
import 'package:foodies/utils/myColorApp.dart';
import 'package:foodies/views/login/screenLogin.dart';

class ScreenSetting extends StatefulWidget {
  const ScreenSetting({super.key});

  @override
  State<ScreenSetting> createState() => _ScreenSettingState();
}

class _ScreenSettingState extends State<ScreenSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.themeColor,
      appBar: AppBar(
        backgroundColor: ColorConstants.themeColor,
        title: Text('Pengaturan'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Column(
                children: listSetting.map((res) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        res['icon'],
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          '${res['name']}',
                          style: TextStyle(
                              color: ColorConstants.textWhite, fontSize: 15),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
              Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ScreenLogin()));
                    },
                    child: Text(
                      'keluar',
                      style: TextStyle(
                          fontSize: 18, color: ColorConstants.textBlack),
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        primary: Color(0XFFF0F0F0)),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
