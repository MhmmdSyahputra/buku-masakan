import 'package:flutter/material.dart';
import 'package:foodies/model/tipsModel.dart';
import 'package:foodies/utils/data.dart';

class TipsProvider with ChangeNotifier {
  List<TipsModel> _tipsList = [];

  List<TipsModel> get tipsList => _tipsList;

  TipsProvider() {
    _tipsList = listTips.map((res) {
      return TipsModel(
        id: res['id'],
        user: res['user'],
        judul: res['judul'],
        step: res['step'],
      );
    }).toList();
  }

  void addTips(TipsModel data) {
    _tipsList.add(data);
    ChangeNotifier();
  }
}
