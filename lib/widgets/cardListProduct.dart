import 'package:flutter/material.dart';
import 'package:foodies/utils/myColorApp.dart';
import 'package:foodies/views/addMenu/resep/screenDetailResep.dart';
import 'package:foodies/views/addMenu/resep/screenTambahResep.dart';

class CardListProduct extends StatefulWidget {
  final String action;
  final data;
  const CardListProduct({super.key, this.data, required this.action});

  @override
  State<CardListProduct> createState() => _CardListProductState();
}

class _CardListProductState extends State<CardListProduct> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.action == 'view'
          ? Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ScreenDetailResep(data: widget.data)))
          : Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ScreenTambahResep(data: widget.data))),
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: ColorConstants.themeColor,
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 130,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: widget.data.cover2 == null
                          ? AssetImage('${widget.data.cover}')
                          : widget.data.cover2,
                    ),
                  ),
                  margin: EdgeInsets.only(right: 10),
                ),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            '${widget.data.judul}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: ColorConstants.textWhite),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${widget.data.cerita[0]}',
                      style: TextStyle(
                          fontSize: 12, color: ColorConstants.textWhite),
                    ),
                  ],
                ))
              ],
            ),
          )),
    );
  }
}
