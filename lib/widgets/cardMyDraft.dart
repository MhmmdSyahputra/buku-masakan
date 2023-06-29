import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:foodies/utils/myColorApp.dart';
import 'package:foodies/views/addMenu/resep/screenTambahResep.dart';

class CardMyDraft extends StatefulWidget {
  final data;
  const CardMyDraft({super.key, this.data});

  @override
  State<CardMyDraft> createState() => _CardMyDraftState();
}

class _CardMyDraftState extends State<CardMyDraft> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ScreenTambahResep(data: widget.data))),
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: Color(0xFF374259),
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
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
                      image: AssetImage('assets/images/imgResep/Spaghetti.png'),
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
                        Container(
                          child: Icon(
                            Icons.remove_circle_outline,
                            color: Colors.red,
                          ),
                        )
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
