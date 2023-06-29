import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:foodies/utils/myColorApp.dart';
import 'package:foodies/views/profile/tersimpan/myDraftProfile.dart';

import 'tersimpanProfile.dart';

class TersimpanMainProfile extends StatefulWidget {
  const TersimpanMainProfile({super.key});

  @override
  State<TersimpanMainProfile> createState() => _TersimpanMainProfileState();
}

class _TersimpanMainProfileState extends State<TersimpanMainProfile> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            child: Row(
              children: [
                InkWell(
                  onTap: () => setState(() {
                    _selectedIndex = 0;
                  }),
                  child: Container(
                    decoration: BoxDecoration(
                      color: _selectedIndex == 0
                          ? ColorConstants.primaryColor
                          : Colors.transparent,
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.bookmark,
                          color: ColorConstants.textWhite,
                        ),
                        SizedBox(width: 5.0),
                        Text(
                          'Tersimpan',
                          style: TextStyle(color: ColorConstants.textWhite),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10.0),
                InkWell(
                  onTap: () => setState(() {
                    _selectedIndex = 1;
                  }),
                  child: Container(
                    decoration: BoxDecoration(
                      color: _selectedIndex == 1
                          ? ColorConstants.primaryColor
                          : Colors.transparent,
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.drafts,
                          color: ColorConstants.textWhite,
                        ),
                        SizedBox(width: 5.0),
                        Text('My Draft',
                            style: TextStyle(color: ColorConstants.textWhite)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: _selectedIndex == 0 ? TersimpanProfile() : FoodSnapProfile(),
          )
        ],
      ),
    );
  }
}
