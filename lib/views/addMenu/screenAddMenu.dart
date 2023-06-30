import 'package:flutter/material.dart';
import 'package:foodies/utils/myColorApp.dart';
import 'package:foodies/views/addMenu/resep/screenTambahResep.dart';
import 'package:foodies/views/addMenu/tips/screenTambahTips.dart';

class ScreeenAddMenu extends StatefulWidget {
  const ScreeenAddMenu({super.key});

  @override
  State<ScreeenAddMenu> createState() => _ScreeenAddMenuState();
}

class _ScreeenAddMenuState extends State<ScreeenAddMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.themeColor,
      body: Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Container(
                      child: Icon(
                        Icons.fork_left,
                        size: 200,
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Text(
                            'Tulis Catatan Masakmu',
                            style: TextStyle(
                                color: ColorConstants.textWhite,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            'Bantu pengguna lain mendapatkan ide memasak',
                            style: TextStyle(
                              color: ColorConstants.textWhite,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(vertical: 30),
                        width: double.infinity,
                        height: 60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          ScreenTambahResep()));
                                },
                                child: Text(
                                  'Resep',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: ColorConstants.textBlack),
                                ),
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    primary: Color(0XFFF0F0F0)),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          ScreenTambahTips()));
                                },
                                child: Text(
                                  'Tips',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: ColorConstants.textBlack),
                                ),
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    primary: Color(0XFFF0F0F0)),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            // Expanded(
                            //   child: ElevatedButton(
                            //     onPressed: () {},
                            //     child: Text(
                            //       'Cookbook',
                            //       style: TextStyle(
                            //           fontSize: 18,
                            //           color: ColorConstants.textBlack),
                            //     ),
                            //     style: ElevatedButton.styleFrom(
                            //         shape: RoundedRectangleBorder(
                            //           borderRadius: BorderRadius.circular(15),
                            //         ),
                            //         primary: Color(0XFFF0F0F0)),
                            //   ),
                            // ),
                          ],
                        )),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
