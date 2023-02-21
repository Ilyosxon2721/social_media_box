// ignore_for_file: must_be_immutable, prefer_const_constructors, unused_local_variable

import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:android_path_provider/android_path_provider.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class BlurryDialog extends StatefulWidget {
  String title;

  Uint8List image;
  VoidCallback continueCallBack;

  BlurryDialog(this.title, this.image, this.continueCallBack, {super.key});

  @override
  State<BlurryDialog> createState() => _BlurryDialogState();
}

class _BlurryDialogState extends State<BlurryDialog> {
  bool process = false;
  TextStyle textStyle = const TextStyle(color: Colors.black);

  @override
  Widget build(BuildContext context) {
    final date = DateTime.now();
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
      child: AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: Text(
          widget.title,
        ),
        content: SizedBox(
          child: Card(
            elevation: 5.0,
            child: Image.memory(
              widget.image,
            ),
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Cancel'.tr,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
                if (process)
                  const Center(
                      child: CircularProgressIndicator(
                    color: Colors.blue,
                  ))
                else
                  InkWell(
                    onTap: () async {
                      setState(() {
                        process = true;
                      });
                      final storage = await Permission.storage.request();
                      final manage =
                          await Permission.manageExternalStorage.request();
                      if (storage.isGranted) {
                        final directory =
                            await AndroidPathProvider.picturesPath;
                        await Directory('$directory/sm_box')
                            .create()
                            .then((value) async {
                          final imagePath = await File(
                                  '$directory/sm_box/sm_box_screenshot_${date.day}${date.month}${date.year}_${date.hour}${date.minute}${date.second}.png')
                              .create();
                          await imagePath
                              .writeAsBytes(widget.image)
                              .then((value) {
                            setState(() {
                              process = false;
                            });
                            final snackBar = SnackBar(
                              /// need to set following properties for best effect of awesome_snackbar_content
                              elevation: 0,
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.transparent,
                              content: AwesomeSnackbarContent(
                                title: 'Success'.tr,
                                message:
                                    'File saved successfully! Path: $imagePath',

                                /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                                contentType: ContentType.success,
                              ),
                            );
                            ScaffoldMessenger.of(context)
                              ..hideCurrentSnackBar()
                              ..showSnackBar(snackBar);
                            Navigator.pop(context);
                          }).catchError((onError) {
                            final snackBar = SnackBar(
                              /// need to set following properties for best effect of awesome_snackbar_content
                              elevation: 0,
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.transparent,
                              content: AwesomeSnackbarContent(
                                title: 'Error'.tr,
                                message: onError,

                                /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                                contentType: ContentType.failure,
                              ),
                            );
                            ScaffoldMessenger.of(context)
                              ..hideCurrentSnackBar()
                              ..showSnackBar(snackBar);
                          });
                        });
                        // final isExist =
                        //     await Directory('$directory/sm_box/')
                        //         .exists()
                        //         .then((value) {
                        //   if (!value) {
                        //     Directory('$directory/sm_box/').create();
                        //   } else {}
                        // });

                        // Navigator.pop(context);
                      }
                    },
                    child: Text(
                      'Save'.tr,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w500),
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
