import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:image_picker/image_picker.dart';

import '../../Manager/preference_manager/manager_preference.dart';
import '../../Model/user.dart';
import '../image_picker_controller.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  final _preferenceManager = PreferenceManager.instance;

  final _controller = Get.put<ImageOrGalleryPickerController>(ImageOrGalleryPickerController());
  late User? user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://images.pexels.com/photos/414612/pexels-photo-414612.jpeg?cs=srgb&dl=pexels-james-wheeler-414612.jpg&fm=jpg"),
              radius: 50,
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: (){
                showModalBottomSheet(context: context, builder: (context){
                  return Container(
                     height: MediaQuery.of(context).size.height/5,
                    width: double.infinity,
                    child:
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,children: [

                      Expanded(child: IconButton(onPressed: (){

                        _controller.getImage(ImageSource.camera);
                      }, icon: const Icon(Icons.camera,size: 40,))),
                      Expanded(child: IconButton(onPressed: (){
                        _controller.getImage(ImageSource.gallery);

                      }, icon: const Icon(Icons.photo_library_rounded,size: 40,)))

                    ],),
                  );
                });
              },
              child:  Obx(() =>  Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.green),borderRadius: BorderRadius.circular(20)),

                width: 200,
                height: 200,
                child: _controller.selectedImagePath.value != '' ? ClipRRect(borderRadius: BorderRadius.circular(20),child: Image.file(File(_controller.selectedImagePath.value),fit: BoxFit.cover),) : const Icon(Icons.cloud_upload,color: Colors.green,size: 100,),
              )),
            )
          ],
        ),
      ),
    );
  }
}
