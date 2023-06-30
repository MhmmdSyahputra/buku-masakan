import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:foodies/model/tipsModel.dart';
import 'package:foodies/providers/LoginRegisProvider.dart';
import 'package:foodies/providers/tipsProvider.dart';
import 'package:foodies/utils/globalFunction.dart';
import 'package:foodies/utils/myColorApp.dart';
import 'package:foodies/widgets/customDialog.dart';
import 'package:provider/provider.dart';

void showCustomDialog(BuildContext context, String title, String subtile,
    Color color, Icon icon) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return CustomDialog(
          title: title, subtile: subtile, color: color, icon: icon);
    },
  );
}

class ScreenTambahTips extends StatefulWidget {
  const ScreenTambahTips({super.key});

  @override
  @override
  State<ScreenTambahTips> createState() => _ScreenTambahTipsState();
}

class _ScreenTambahTipsState extends State<ScreenTambahTips> {
  final TextEditingController _inputJudulController = TextEditingController();
  final List<TextEditingController> _inputLangkahControllerList = [];

  int _inputLangkah = 1;
  void _addInputLangkah() {
    setState(() {
      _inputLangkah++;
      _inputLangkahControllerList.add(TextEditingController());
    });
  }

  void initState() {
    super.initState();
    for (int i = 0; i < _inputLangkah; i++) {
      _inputLangkahControllerList.add(TextEditingController());
    }
  }

  @override
  void dispose() {
    for (var controller in _inputLangkahControllerList) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provTips = Provider.of<TipsProvider>(context);
    final provIdUser = Provider.of<UserLoginProvider>(context);
    final user = Provider.of<UserLoginProvider>(context)
        .getUserById(provIdUser.idUserDoLogin);
    return Scaffold(
      backgroundColor: ColorConstants.themeColor,
      appBar: AppBar(
        backgroundColor: ColorConstants.themeColor,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {
                  List<String> stepList = [];
                  for (var controller in _inputLangkahControllerList) {
                    stepList.add(controller.text);
                  }
                  provTips.addTips(TipsModel(
                      id: generateId().toString(),
                      user: [user.username, user.email],
                      judul: _inputJudulController.text,
                      step: stepList));
                  showCustomDialog(
                      context,
                      'Berhasil',
                      'Data Tips Berhasil Di Tambah',
                      Colors.green,
                      Icon(Icons.check));
                  Navigator.of(context).pop();
                },
                child: Text('Terbitkan'),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    primary: Colors.green,
                    padding: const EdgeInsets.symmetric(horizontal: 10))),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: TextField(
                  controller: _inputJudulController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          15), // Ganti dengan radius yang diinginkan
                    ),
                    filled: true,
                    fillColor: Colors.grey,
                    hintText: 'Judul: Cara Memotong Bawang Bombay',
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  ),
                ),
              ),
              Column(
                children: List.generate(_inputLangkah, (index) {
                  return Card(
                    color: ColorConstants.themeColor,
                    elevation: 8,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: TextField(
                            controller: _inputLangkahControllerList[index],
                            keyboardType: TextInputType.multiline,
                            minLines: 1,
                            maxLines: 10,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    15), // Ganti dengan radius yang diinginkan
                              ),
                              filled: true,
                              fillColor: Colors.grey,
                              hintText:
                                  'Mis : untuk memotong bawang bombay, mulailah dengan membelah bawang menjadi dua dari arah atas ke arah bawah..',
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 5),
                            ),
                          ),
                        ),
                        Card(
                          color: ColorConstants.themeColor,
                          child: Container(
                              width: double.infinity,
                              margin: EdgeInsets.symmetric(vertical: 10),
                              child: Icon(
                                Icons.camera_alt_outlined,
                                color: ColorConstants.textWhite,
                                size: 30,
                              )),
                        ),
                      ],
                    ),
                  );
                }),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: _addInputLangkah,
                      child: Container(
                        child: Row(
                          children: [
                            Icon(
                              Icons.add,
                              color: ColorConstants.textWhite,
                              size: 40,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Langkah',
                              style: TextStyle(
                                  color: ColorConstants.textWhite,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                      ),
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
