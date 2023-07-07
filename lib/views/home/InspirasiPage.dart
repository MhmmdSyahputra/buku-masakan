import 'dart:math';
import 'package:flutter/material.dart';
import 'package:foodies/model/resepModel.dart';
import 'package:foodies/providers/LoginRegisProvider.dart';
import 'package:foodies/providers/resepProvider.dart';
import 'package:foodies/providers/tipsProvider.dart';
import 'package:foodies/utils/data.dart';
import 'package:foodies/utils/myColorApp.dart';
import 'package:foodies/views/addMenu/resep/screenListResep.dart';
import 'package:foodies/widgets/bannerResep.dart';
import 'package:foodies/widgets/cardResep.dart';
import 'package:foodies/widgets/cardTips.dart';
import 'package:provider/provider.dart';

class PageInspirasi extends StatefulWidget {
  const PageInspirasi({super.key});

  @override
  State<PageInspirasi> createState() => _PageInspirasiState();
}

class _PageInspirasiState extends State<PageInspirasi> {
  final TextEditingController _inputSeacrhController = TextEditingController();

  String? _valueIsiKulkas;
  List<ResepModel> dataWithChip = [];
  List _chipSelected = [];

  @override
  Widget build(BuildContext context) {
    final provIdUser = Provider.of<UserLoginProvider>(context);
    final user = Provider.of<UserLoginProvider>(context)
        .getUserById(provIdUser.idUserDoLogin);
    final provResep = Provider.of<ResepProvider>(context);
    final provTips = Provider.of<TipsProvider>(context);

    List shuffledList =
        List.from(provResep.resepList); // Salin daftar resep ke daftar baru
    shuffledList.shuffle(Random()); // Acak urutan elemen dalam daftar baru

    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Halo ${user.username}',
                        style: TextStyle(
                            fontSize: 14, color: ColorConstants.textWhite),
                      ),
                      Text(
                        'Apa isi Kulkasmu?',
                        style: TextStyle(
                            fontSize: 14, color: ColorConstants.textWhite),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        children: listIsiKulkas.map((res) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3),
                        child: ChoiceChip(
                          backgroundColor: Color(0xFF9DB2BF),
                          selectedColor: _chipSelected.contains(res['name'])
                              ? ColorConstants.primaryColor
                              : Color(0xFF9DB2BF),
                          label: Text(
                            res['name'],
                            style: TextStyle(color: Colors.white),
                          ),
                          selected: _chipSelected.contains(res['name']),
                          onSelected: (bool selected) {
                            setState(() {
                              if (selected) {
                                _chipSelected.add(res['name']);
                              } else {
                                _chipSelected.remove(res['name']);
                              }
                              // _valueIsiKulkas = selected ? res['name'] : null;

                              dataWithChip = provResep.resepList
                                  .where((res) => res.status == 'publish')
                                  .where((entry) => _chipSelected.every(
                                      (chip) => entry.bahan.any((bahan) => bahan
                                          .toLowerCase()
                                          .contains(chip.toLowerCase()))))
                                  .toList();
                            });
                          },
                        ),
                      );
                    }).toList()),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 3, color: ColorConstants.primaryColor))),
                  child: Text(
                    'Semua',
                    style: TextStyle(
                        fontSize: 14, color: ColorConstants.textWhite),
                  ),
                ),
                _chipSelected.length != 0
                    ? dataWithChip.length != 0
                        ? Container(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: dataWithChip.map((res) {
                                  return BannerResep(data: res);
                                }).toList(),
                              ),
                            ),
                          )
                        : Center(
                            child: Container(
                              width: 200,
                              height: 200,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/notfound.png'))),
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: Text(
                                  'Data Tidak ada',
                                  style: TextStyle(
                                      color: ColorConstants.textWhite,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          )
                    : Container(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: provResep.resepList
                                .where((res) => res.status == 'publish')
                                .map((res) {
                              return BannerResep(data: res);
                            }).toList(),
                          ),
                        ),
                      ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => ScreenListResep())),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.search,
                                color: ColorConstants.textBlack,
                              ),
                              Text(
                                'Temukan Ide Lainnya',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: ColorConstants.textBlack),
                              ),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              primary: Color(0XFFF0F0F0)),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ingin Makan Apa?',
                        style: TextStyle(
                            fontSize: 14, color: ColorConstants.textWhite),
                      ),
                      Text(
                        'Belum yakin? Yuk lihat ide dari kami',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: GridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    childAspectRatio: 1.4,
                    children: shuffledList
                        .where((res) => res.status == 'publish')
                        .take(4)
                        .map((res) {
                      return CardResep(data: res);
                    }).toList(),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => setState(() {}),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.refresh_sharp,
                                color: ColorConstants.textBlack,
                              ),
                              Text(
                                'Pilihin Dong',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: ColorConstants.textBlack),
                              ),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              primary: Color(0XFFF0F0F0)),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    'Tips untuk dapur mu',
                    style: TextStyle(
                        fontSize: 14, color: ColorConstants.textWhite),
                  ),
                ),
                Container(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: provTips.tipsList.map((res) {
                        return CardTips(data: res);
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
