import 'package:flutter/material.dart';

class Folder {
  final String folderName;
  final IconData folderIcon;

  Folder({
    required this.folderIcon,
    required this.folderName,
  });

  factory Folder.fromMap(Map<String, dynamic> map) {
    return Folder(
      folderIcon: map['folderIcon'],
      folderName: map['folderName'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'folderIcon': folderIcon,
      'folderName': folderName,
    };
  }

  static List<Folder> folders = [
    Folder(folderIcon: Icons.devices, folderName: 'أجهزة'),
    Folder(folderIcon: Icons.work_outline, folderName: 'العمل'),
    Folder(folderIcon: Icons.chair_outlined, folderName: 'أثاث'),
    Folder(folderIcon: Icons.drive_eta_outlined, folderName: 'المواصلات'),
    Folder(folderIcon: Icons.phone_enabled_outlined, folderName: 'خدمات الهاتف'),
  ];
}
