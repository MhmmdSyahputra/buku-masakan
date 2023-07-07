import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:foodies/providers/LoginRegisProvider.dart';
import 'package:foodies/utils/data.dart';
import 'package:foodies/utils/myColorApp.dart';
import 'package:foodies/widgets/cardResep.dart';
import 'package:provider/provider.dart';

class PageMengikuti extends StatefulWidget {
  const PageMengikuti({super.key});

  @override
  State<PageMengikuti> createState() => _PageMengikutiState();
}

class _PageMengikutiState extends State<PageMengikuti> {
  @override
  Widget build(BuildContext context) {
    final provAlluser = Provider.of<UserLoginProvider>(context);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Column(
                children: [
                  Container(
                    width: 200,
                    child: Image.asset('assets/images/imgApp/logo.png',
                        fit: BoxFit.fill),
                  ),
                  Text(
                    'Perluas jaringanmu',
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
                    'Ikuti pengguna favoritmu untuk melihat resep terbaru, Foodsnap, dan lebih banyak lagi.',
                    style: TextStyle(
                      color: ColorConstants.textWhite,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 40, bottom: 20),
              child: Column(
                children: [
                  Text(
                    'Yuk ikuti pengguna ini!',
                    style: TextStyle(
                        color: ColorConstants.textWhite,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            Container(
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: provAlluser.userLoginList.map((res) {
                        return SizedBox(
                          height: 310,
                          width: MediaQuery.of(context).size.width / 1.2,
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.white,
                                width: 2,
                              ),
                            ),
                            child: Card(
                              color: Colors.transparent,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 15,
                                  horizontal: 10,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 20,
                                          child: Icon(
                                            Icons.person,
                                            size: 20,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${res.username}',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              '${res.email}',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.symmetric(vertical: 10),
                                      padding: EdgeInsets.only(left: 50),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.fastfood,
                                            color: ColorConstants.textWhite,
                                          ),
                                          Text(
                                            '130 resep',
                                            style: TextStyle(
                                                color: ColorConstants.textWhite,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: listResep.take(2).map((res) {
                                          return Padding(
                                            padding: const EdgeInsets.all(5),
                                            child: Container(
                                              width: 120,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image:
                                                      AssetImage(res['cover']),
                                                ),
                                              ),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  gradient: LinearGradient(
                                                    begin: Alignment.topCenter,
                                                    end: Alignment.bottomCenter,
                                                    colors: [
                                                      Colors.transparent,
                                                      Colors.black
                                                          .withOpacity(0.7),
                                                    ],
                                                  ),
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.all(10),
                                                        child: Text(
                                                          '${res['judul']}',
                                                          style: TextStyle(
                                                              color:
                                                                  ColorConstants
                                                                      .textWhite,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        )),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                    Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 30),
                                        width: double.infinity,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Ikuti',
                                            style: TextStyle(
                                                fontSize: 18,
                                                color:
                                                    ColorConstants.textBlack),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              primary: Color(0XFFF0F0F0)),
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ))),
            // Align(
            //   alignment: Alignment.center,
            //   child:
            // ),
          ],
        ),
      ),
    );
  }
}
