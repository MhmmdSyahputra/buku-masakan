import 'dart:math';
import 'package:flutter/material.dart';
import 'package:foodies/providers/LoginRegisProvider.dart';
import 'package:foodies/providers/resepProvider.dart';
import 'package:foodies/utils/myColorApp.dart';
import 'package:foodies/views/addMenu/resep/screenDetailResep.dart';
import 'package:provider/provider.dart';

class BannerResep extends StatefulWidget {
  final data;
  const BannerResep({super.key, this.data});

  @override
  State<BannerResep> createState() => _BannerResepState();
}

class _BannerResepState extends State<BannerResep> {
  int like = Random().nextInt(100) + 50;
  bool statusLike = false;
  int disLike = Random().nextInt(60) + 20;
  bool statusDisLike = false;
  @override
  Widget build(BuildContext context) {
    final provUser = Provider.of<UserLoginProvider>(context);
    final user = Provider.of<UserLoginProvider>(context)
        .getUserById(provUser.idUserDoLogin);

    final provResep = Provider.of<ResepProvider>(context);

    // simpan list iditem yg disimpan di akun user yg login
    List mySaveId = provUser.userLoginList
        .where((res) => res.id == user.id)
        .expand((res) => res.mySave)
        .toList();

    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ScreenDetailResep(data: widget.data))),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        height: 220,
        width: MediaQuery.of(context).size.width - 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: widget.data.cover != '' || widget.data.cover != null
                ? AssetImage(widget.data.cover)
                : widget.data.cover2,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black.withOpacity(0.7),
              ],
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 12,
                      child: Icon(
                        Icons.person,
                        size: 15,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      widget.data.user[0],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 30, bottom: 10),
                child: Text(
                  widget.data.judul,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () => setState(() {
                        if (!statusLike) {
                          like++;
                          statusLike = true;
                        } else {
                          statusLike = false;
                          like--;
                        }
                      }),
                      child: Container(
                        child: Row(
                          children: [
                            Icon(
                              Icons.thumb_up,
                              size: 20,
                              color: statusLike
                                  ? ColorConstants.primaryColor
                                  : Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '${like}',
                              style: TextStyle(
                                  color: ColorConstants.textWhite,
                                  fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      onTap: () => setState(() {
                        if (!statusDisLike) {
                          disLike++;
                          statusDisLike = true;
                        } else {
                          statusDisLike = false;
                          disLike--;
                        }
                      }),
                      child: Container(
                        child: Row(
                          children: [
                            Icon(
                              Icons.thumb_down,
                              size: 20,
                              color: statusDisLike
                                  ? ColorConstants.primaryColor
                                  : Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '${disLike}',
                              style: TextStyle(
                                  color: ColorConstants.textWhite,
                                  fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                        child: InkWell(
                      onTap: () => provUser.saveItem(user.id, widget.data.id),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            mySaveId.contains(widget.data.id)
                                ? Icons.bookmark
                                : Icons.bookmark_add_outlined,
                            size: 20,
                            color: mySaveId.contains(widget.data.id)
                                ? ColorConstants.primaryColor
                                : Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ))
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
