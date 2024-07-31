import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:music_app/core/theme/pallete.dart';
import 'package:music_app/core/utils.dart';
import 'package:music_app/core/widgets/text_field.dart';

class UploadSong extends ConsumerStatefulWidget {
  const UploadSong({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UploadSongState();
}

class _UploadSongState extends ConsumerState<UploadSong> {
  File? selectedImage;
  File? selectedAudio;
  Color selectedColor = Pallete.cardColor;

  void selectAudio() async {
    final audio = await pickAudio();
    if (audio != null) {
      setState(() {
        selectedAudio = audio;
      });
    }
  }

  void selectImage() async {
    final image = await pickImage();
    if (image != null) {
      setState(() {
        selectedImage = image;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final querry = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload Song"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.check),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: querry.width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: selectImage,
                child: selectedImage != null
                    ? SizedBox(
                        height: querry.height * 0.14,
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.file(
                            selectedImage!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    : DottedBorder(
                        color: Pallete.borderColor,
                        radius: const Radius.circular(10),
                        borderType: BorderType.RRect,
                        dashPattern: const [10, 4],
                        strokeCap: StrokeCap.round,
                        child: SizedBox(
                          height: querry.height * 0.14,
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.folder_open,
                                size: 40,
                              ),
                              SizedBox(height: querry.height * 0.03),
                              const Text(
                                'Select the thumbnail for your song',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
              ),
              SizedBox(height: querry.height * 0.03),
              CustomTextField(
                hint: 'Pick Song',
                controller: null,
                readOnly: true,
                onTap: selectAudio,
              ),
              SizedBox(height: querry.height * 0.03),
              const CustomTextField(
                hint: 'Artist',
                controller: null,
              ),
              SizedBox(height: querry.height * 0.03),
              const CustomTextField(
                hint: 'Song Name',
                controller: null,
              ),
              SizedBox(height: querry.height * 0.02),
              ColorPicker(
                heading: const Text("Pick a Color"),
                pickersEnabled: const {
                  ColorPickerType.wheel: true,
                },
                color: selectedColor,
                onColorChanged: (Color color) {
                  setState(() {
                    selectedColor = color;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
