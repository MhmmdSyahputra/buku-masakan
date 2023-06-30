import 'package:flutter/material.dart';
import 'package:foodies/model/resepModel.dart';
import 'package:foodies/providers/LoginRegisProvider.dart';
import 'package:foodies/providers/resepProvider.dart';
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

class ScreenTambahResep extends StatefulWidget {
  final data;
  const ScreenTambahResep({super.key, this.data});

  @override
  State<ScreenTambahResep> createState() => _ScreenTambahResepState();
}

class _ScreenTambahResepState extends State<ScreenTambahResep> {
  int _inputBahan = 2;
  int _inputStep = 1;

  final TextEditingController _inputJudulController = TextEditingController();
  final TextEditingController _inputCeritaController = TextEditingController();
  final TextEditingController _inputDaerahController = TextEditingController();
  final TextEditingController _inputPorsiController = TextEditingController();
  final TextEditingController _inputWaktuController = TextEditingController();

  final List<TextEditingController> _inputBahanControllerList = [];
  final List<TextEditingController> _inputStepControllerList = [];

  @override
  void initState() {
    super.initState();
    // Memasukkan data dari widget.data ke dalam TextEditingController jika widget.data ada
    if (widget.data != null) {
      _inputJudulController.text = widget.data.judul ?? '';
      _inputCeritaController.text = widget.data.cerita[0] ?? '';
      _inputDaerahController.text = widget.data.cerita[1] ?? '';
      _inputPorsiController.text = widget.data.porsi ?? '';
      _inputWaktuController.text = widget.data.lamaWaktu ?? '';

      _inputBahan = widget.data.bahan.length;
      // Memasukkan data bahan ke dalam TextEditingController
      for (int i = 0; i < _inputBahan; i++) {
        final controller = TextEditingController(
          text: i < widget.data.bahan.length ? widget.data.bahan[i] : '',
        );
        _inputBahanControllerList.add(controller);
      }

      _inputStep = widget.data.step.length;
      // Memasukkan data langkah ke dalam TextEditingController
      for (int i = 0; i < _inputStep; i++) {
        final controller = TextEditingController(
          text: i < widget.data.step.length ? widget.data.step[i] : '',
        );
        _inputStepControllerList.add(controller);
      }
      return;
    }

    for (int i = 0; i < _inputBahan; i++) {
      _inputBahanControllerList.add(TextEditingController());
    }
    for (int i = 0; i < _inputStep; i++) {
      _inputStepControllerList.add(TextEditingController());
    }
  }

  @override
  void dispose() {
    _inputJudulController.dispose();
    for (var controller in _inputBahanControllerList) {
      controller.dispose();
    }
    for (var controller in _inputStepControllerList) {
      controller.dispose();
    }
    super.dispose();
  }

  void _addInputBahan() {
    setState(() {
      _inputBahan++;
      _inputBahanControllerList.add(TextEditingController());
    });
  }

  void _addInputStep() {
    setState(() {
      _inputStep++;
      _inputStepControllerList.add(TextEditingController());
    });
  }

  @override
  Widget build(BuildContext context) {
    final provResep = Provider.of<ResepProvider>(context);
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
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    primary: ColorConstants.primaryColor,
                    padding: const EdgeInsets.symmetric(horizontal: 10)),
                onPressed: () {
                  // jika ada nerima data maka update data
                  if (widget.data != null) {
                    List<String> bahanList = [];
                    for (var controller in _inputBahanControllerList) {
                      bahanList.add(controller.text);
                    }
                    List<String> stepList = [];
                    for (var controller in _inputStepControllerList) {
                      stepList.add(controller.text);
                    }
                    provResep.updateResep(
                        widget.data.id,
                        ResepModel(
                          id: widget.data.id,
                          user: [user.username, user.email],
                          judul: _inputJudulController.text,
                          cerita: [
                            _inputCeritaController.text,
                            _inputDaerahController.text
                          ],
                          porsi: _inputPorsiController.text,
                          lamaWaktu: _inputWaktuController.text,
                          status: 'draft',
                          cover: 'cover',
                          bahan: bahanList,
                          step: stepList,
                        ));
                    showCustomDialog(
                        context,
                        'Berhasil',
                        'Data Resep Berhasil Di Update',
                        Colors.green,
                        Icon(Icons.check));
                    Navigator.of(context).pop();
                    return;
                  }

                  // jika tidak nerima data maka create  new data
                  List<String> bahanList = [];
                  for (var controller in _inputBahanControllerList) {
                    bahanList.add(controller.text);
                  }
                  List<String> stepList = [];
                  for (var controller in _inputStepControllerList) {
                    stepList.add(controller.text);
                  }
                  provResep.addResep(ResepModel(
                    id: generateId().toString(),
                    user: [user.username, user.email],
                    judul: _inputJudulController.text,
                    cerita: [
                      _inputCeritaController.text,
                      _inputDaerahController.text
                    ],
                    porsi: _inputPorsiController.text,
                    lamaWaktu: _inputWaktuController.text,
                    status: 'draft',
                    cover: 'cover',
                    bahan: bahanList,
                    step: stepList,
                  ));
                  showCustomDialog(
                      context,
                      'Berhasil',
                      'Data Resep Berhasil Di Tambah',
                      Colors.green,
                      Icon(Icons.check));
                  Navigator.of(context).pop();
                },
                child: Text('Simpan')),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                if (widget.data != null) {
                  List<String> bahanList = [];
                  for (var controller in _inputBahanControllerList) {
                    bahanList.add(controller.text);
                  }
                  List<String> stepList = [];
                  for (var controller in _inputStepControllerList) {
                    stepList.add(controller.text);
                  }
                  provResep.updateResep(
                      widget.data.id,
                      ResepModel(
                        id: widget.data.id,
                        user: [user.username, user.email],
                        judul: _inputJudulController.text,
                        cerita: [
                          _inputCeritaController.text,
                          _inputDaerahController.text
                        ],
                        porsi: _inputPorsiController.text,
                        lamaWaktu: _inputWaktuController.text,
                        status: 'publish',
                        cover: 'cover',
                        bahan: bahanList,
                        step: stepList,
                      ));
                  showCustomDialog(
                      context,
                      'Berhasil',
                      'Data Resep Berhasil Di Publish',
                      Colors.green,
                      Icon(Icons.check));
                  Navigator.of(context).pop();
                  return;
                }

                // jika tidak nerima data maka create  new data
                List<String> bahanList = [];
                for (var controller in _inputBahanControllerList) {
                  bahanList.add(controller.text);
                }
                List<String> stepList = [];
                for (var controller in _inputStepControllerList) {
                  stepList.add(controller.text);
                }
                provResep.addResep(ResepModel(
                  id: generateId().toString(),
                  user: [user.username, user.email],
                  judul: _inputJudulController.text,
                  cerita: [
                    _inputCeritaController.text,
                    _inputDaerahController.text
                  ],
                  porsi: _inputPorsiController.text,
                  lamaWaktu: _inputWaktuController.text,
                  status: 'publish',
                  cover: 'cover',
                  bahan: bahanList,
                  step: stepList,
                ));
                showCustomDialog(
                    context,
                    'Berhasil',
                    'Data Resep Berhasil Di Publish',
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
                  padding: const EdgeInsets.symmetric(horizontal: 10)),
            ),
          ),
          PopupMenuButton<MenuItem>(
              onSelected: (value) {
                if (value == MenuItem.Profil) {
                } else if (value == MenuItem.Pengaturan) {
                } else if (value == MenuItem.Logout) {}
              },
              itemBuilder: (context) => [
                    PopupMenuItem(
                        value: MenuItem.Pengaturan, child: Text('Pengaturan')),
                    PopupMenuItem(
                        value: MenuItem.Pengaturan, child: Text('Pengaturan')),
                    PopupMenuItem(
                        value: MenuItem.Logout, child: Text('Logout')),
                  ])
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    hintText: 'Judul: Sup Ayam',
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: TextField(
                  controller: _inputCeritaController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          15), // Ganti dengan radius yang diinginkan
                    ),
                    filled: true,
                    fillColor: Colors.grey,
                    hintText:
                        'Cerita di balik masakan ini. Apa atau siapa yang menginspirasimu? Apa yang membuatnya istimewa? Bagaimana caramu menikmatinya?',
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: TextField(
                  controller: _inputDaerahController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          15), // Ganti dengan radius yang diinginkan
                    ),
                    filled: true,
                    fillColor: Colors.grey,
                    hintText: 'Masukkan daerah asal resep',
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Container(
                      width: 150,
                      child: Text(
                        'Porsi',
                        style: TextStyle(
                            color: ColorConstants.textWhite,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: _inputPorsiController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                15), // Ganti dengan radius yang diinginkan
                          ),
                          filled: true,
                          fillColor: Colors.grey,
                          hintText: '2 orang',
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Container(
                      width: 150,
                      child: Text(
                        'Lama memasak',
                        style: TextStyle(
                            color: ColorConstants.textWhite,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: _inputWaktuController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                15), // Ganti dengan radius yang diinginkan
                          ),
                          filled: true,
                          fillColor: Colors.grey,
                          hintText: '1 jam 30 menit',
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.grey,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Bahan',
                  style: TextStyle(
                      color: ColorConstants.textWhite,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Column(
                children: List.generate(
                    _inputBahan,
                    (index) => Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: ListTile(
                            leading: Icon(
                              Icons.list,
                              color: ColorConstants.textWhite,
                            ),
                            title: TextFormField(
                              controller: _inputBahanControllerList[index],
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      15), // Ganti dengan radius yang diinginkan
                                ),
                                filled: true,
                                fillColor: Colors.grey,
                                hintText: 'Bahan ${index + 1}',
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 5),
                              ),
                            ),
                            trailing: Icon(
                              Icons.more_horiz,
                              color: ColorConstants.textWhite,
                            ),
                          ),
                        )),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: _addInputBahan,
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
                              'Bahan',
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
              Divider(
                color: Colors.grey,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Langkah',
                  style: TextStyle(
                      color: ColorConstants.textWhite,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Column(
                children: List.generate(
                    _inputStep,
                    (index) => Padding(
                          padding: EdgeInsets.all(10),
                          child: Container(
                            child: ListTile(
                              leading: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 15,
                                    child: Text('${index + 1}'),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Icon(
                                    Icons.list,
                                    color: ColorConstants.textWhite,
                                  )
                                ],
                              ),
                              title: TextFormField(
                                controller: _inputStepControllerList[index],
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        15), // Ganti dengan radius yang diinginkan
                                  ),
                                  filled: true,
                                  fillColor: Colors.grey,
                                  hintText: 'Step ${index + 1}',
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 5),
                                ),
                              ),
                            ),
                          ),
                        )),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: _addInputStep,
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

enum MenuItem {
  Profil,
  Pengaturan,
  Logout,
}
