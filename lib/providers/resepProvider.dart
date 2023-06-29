import 'package:flutter/material.dart';
import 'package:foodies/model/resepModel.dart';
import 'package:foodies/utils/data.dart';

class ResepProvider with ChangeNotifier {
  List<ResepModel> _resepList = [];

  List<ResepModel> get resepList => _resepList;

  ResepProvider() {
    _resepList = listResep.map((res) {
      return ResepModel(
        user: res['user'],
        judul: res['judul'],
        cerita: res['cerita'],
        porsi: res['porsi'],
        lamaWaktu: res['lamaWaktu'],
        status: res['status'],
        cover: res['cover'],
        bahan: res['bahan'],
        step: res['step'],
      );
    }).toList();
  }

  void addResep(ResepModel data) {
    _resepList.add(data);
    ChangeNotifier();
  }
}
