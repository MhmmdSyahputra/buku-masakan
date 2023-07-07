import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:foodies/providers/resepProvider.dart';
import 'package:foodies/utils/myColorApp.dart';
import 'package:foodies/widgets/cardListProduct.dart';
import 'package:provider/provider.dart';

class ScreenListResep extends StatefulWidget {
  const ScreenListResep({super.key});

  @override
  State<ScreenListResep> createState() => _ScreenListResepState();
}

class _ScreenListResepState extends State<ScreenListResep> {
  @override
  Widget build(BuildContext context) {
    final provResep = Provider.of<ResepProvider>(context);

    return Scaffold(
      backgroundColor: ColorConstants.themeColor,
      appBar: AppBar(
        title: Text(
          'Semua Resep',
          style: TextStyle(color: ColorConstants.textWhite),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: provResep.resepList.map((res) {
              return CardListProduct(action: 'view', data: res);
            }).toList(),
          ),
        ),
      ),
    );
  }
}
