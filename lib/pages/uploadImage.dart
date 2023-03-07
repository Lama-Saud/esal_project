import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class UploadImageToDB extends StatefulWidget {
  static var getImgUrl;

  const UploadImageToDB({super.key});

  @override
  State<UploadImageToDB> createState() => _UploadImageToDBState();
}

class _UploadImageToDBState extends State<UploadImageToDB> {
  var storage = FirebaseStorage.instance;
  late List<AssetImage> listOfImage;
  bool clicked = false;
  List<String?> listOfStr = [];
  String? images;
  bool isLoading = false;
  /////////////////

  // String getImgUrl() {
  //   return imURL;
  // }

  static String imURL = '';

  @override
  void initState() {
    super.initState();
    getImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //height: 400,
        //width: 690,
        child: Column(
          children: <Widget>[
            GridView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.all(0),
              itemCount: listOfImage.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 6, mainAxisSpacing: 3.0, crossAxisSpacing: 3.0),
              itemBuilder: (BuildContext context, int index) {
                return GridTile(
                  child: Material(
                    child: GestureDetector(
                      child: Stack(children: <Widget>[
                        this.images == listOfImage[index].assetName || listOfStr.contains(listOfImage[index].assetName)
                            ? Positioned.fill(
                                child: Opacity(
                                opacity: 0.7,
                                child: Image.asset(
                                  listOfImage[index].assetName,
                                  fit: BoxFit.fill,
                                ),
                              ))
                            : Positioned.fill(
                                child: Opacity(
                                opacity: 1.0,
                                child: Image.asset(
                                  listOfImage[index].assetName,
                                  fit: BoxFit.fill,
                                ),
                              )),
                        this.images == listOfImage[index].assetName || listOfStr.contains(listOfImage[index].assetName)
                            ? const Positioned(
                                left: 0,
                                bottom: 0,
                                child: Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                ))
                            : const Visibility(
                                visible: false,
                                child: Icon(
                                  Icons.check_circle_outline,
                                  color: Colors.black,
                                ),
                              )
                      ]),
                      onTap: () {
                        setState(() {
                          if (listOfStr.contains(listOfImage[index].assetName)) {
                            this.clicked = false;
                            listOfStr.remove(listOfImage[index].assetName);
                            this.images = null;
                          } else {
                            this.images = listOfImage[index].assetName;
                            listOfStr.add(this.images);
                            this.clicked = true;
                          }
                        });
                      },
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Builder(builder: (context) {
                    return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF46A788),
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                            textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                        child: const Text("حفظ الصورة"),
                        onPressed: () {
                          setState(() {
                            this.isLoading = true;
                          });
                          listOfStr.forEach((img) async {
                            String imageName =
                                img!.substring(img.lastIndexOf("/"), img.lastIndexOf(".")).replaceAll("/", "");

                            final Directory systemTempDir = Directory.systemTemp;
                            final byteData = await rootBundle.load(img);

                            final file = File('${systemTempDir.path}/$imageName.jpeg');
                            await file.writeAsBytes(
                                byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
                            TaskSnapshot snapshot = await storage.ref().child("images/$imageName").putFile(file);
                            if (snapshot.state == TaskState.success) {
                              final String downloadUrl = await snapshot.ref.getDownloadURL();
                              ///////////////////////////////////////////
                              setState(() {
                                UploadImageToDB.getImgUrl = downloadUrl;
                              });
                              print(UploadImageToDB.getImgUrl);

                              await FirebaseFirestore.instance
                                  .collection("images")
                                  .add({"url": downloadUrl, "name": imageName});
                              setState(() {
                                isLoading = false;
                              });
                              const snackBar = SnackBar(content: Text('تم إضافة الصورة بنجاح '));
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            } else {
                              print('Error from image repo ${snapshot.state.toString()}');
                              throw ('This file is not an image');
                            }
                          });
                        });
                  }),
                  const SizedBox(
                    width: 20,
                  ),
                  // Row(
                  //   children: [
                  //     Column(
                  //       children: [
                  //         TextButton(
                  //           onPressed: () => showDialog<String>(
                  //             context: context,
                  //             builder: (BuildContext context) => AlertDialog(
                  //               //title: const Text('AlertDialog Title'),
                  //               insetPadding: EdgeInsets.zero,
                  //               contentPadding: EdgeInsets.zero,
                  //               clipBehavior: Clip.antiAliasWithSaveLayer,

                  //               content: UploadImageToDB(),
                  //               actions: <Widget>[
                  //                 TextButton(
                  //                   onPressed: () =>
                  //                       Navigator.pop(context, 'Cancel'),
                  //                   child: const Text('Cancel'),
                  //                 ),
                  //                 TextButton(
                  //                   onPressed: () =>
                  //                       Navigator.pop(context, 'OK'),
                  //                   child: const Text('OK'),
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //           child: const Text('Show Dialog'),
                  //         ),
                  //       ],
                  //     ),
                  //   ],
                  // ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF46A788),
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                        textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                    child: const Text("أضف صورة  +"),
                    onPressed: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                        // content: Container(
                        //     height: 400,
                        //     child: Padding(
                        //       padding: const EdgeInsets.all(20),
                        //       child: SecondPage(),
                        //     )),
                        // actions: <Widget>[
                        //   TextButton(
                        //     onPressed: () => Navigator.pop(context, 'Cancel'),
                        //     child: const Text('Cancel'),
                        //   ),
                        //   TextButton(
                        //     onPressed: () => Navigator.pop(context, 'OK'),
                        //     child: const Text('OK'),
                        //   ),
                        // ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            isLoading ? const CircularProgressIndicator() : const Visibility(visible: false, child: Text("test")),
          ],
        ),
      ),
    );
  }

  void getImages() {
    listOfImage = [];
    for (int i = 0; i < 6; i++) {
      listOfImage.add(AssetImage('assets/images/travelimage$i.jpeg'));

      ///Users/rahaf/Desktop/flutter-2/project4/assets/images/travelimage0.jpeg
    }
  }
}
