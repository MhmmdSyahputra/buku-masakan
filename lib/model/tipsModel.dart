import 'package:flutter/material.dart';

class TipsModel {
  final String id;
  final List user;
  final String judul;
  final List step;
  List? gambarStep;

  TipsModel({
    required this.id,
    required this.user,
    required this.judul,
    required this.step,
    this.gambarStep,
  });
}
