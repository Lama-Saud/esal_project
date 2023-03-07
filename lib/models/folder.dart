import 'package:flutter/material.dart';

class Folder {
  final String id;
  final String folderName;
  final int folderIcon;

  Folder({
    required this.id,
    required this.folderIcon,
    required this.folderName,
  });

  factory Folder.fromMap(Map<String, dynamic> map) {
    return Folder(
      folderIcon: map['folderIcon'],
      folderName: map['folderName'],
      id: map['id'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'folderIcon': folderIcon,
      'folderName': folderName,
      'id': id,
    };
  }
}

final List<Folder> folders = [
  Folder(folderIcon: Icons.devices.codePoint, folderName: 'أجهزة', id: '1'),
  Folder(folderIcon: Icons.work_outline.codePoint, folderName: 'العمل', id: '2'),
  Folder(folderIcon: Icons.chair_outlined.codePoint, folderName: 'أثاث', id: '3'),
  Folder(folderIcon: Icons.drive_eta_outlined.codePoint, folderName: 'المواصلات', id: '4'),
  Folder(folderIcon: Icons.phone_enabled_outlined.codePoint, folderName: 'خدمات الهاتف', id: '5'),
];
