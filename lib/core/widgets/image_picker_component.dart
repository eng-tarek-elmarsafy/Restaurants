// import 'dart:io';

// import 'package:flutter/material.dart';

// class ImagePickerComponent extends StatefulWidget {
//   const ImagePickerComponent({super.key, required this.onchang});
//   final Function(File value) onchang;

//   @override
//   State<ImagePickerComponent> createState() => _ImagePickerComponentState();
// }

// class _ImagePickerComponentState extends State<ImagePickerComponent> {
//   bool isLoading = false;
//   File? imageFile;
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Container(
//           // height: 150,
//           width: double.infinity,
//           decoration: BoxDecoration(
//             color: kNeutralColor,
//             border: Border.all(color: kSecondaryColor),
//           ),

//           child: IconButton(
//             onPressed: () async {
//               setState(() {
//                 isLoading = !isLoading;
//               });
//               ImagePicker picker = ImagePicker();
//               final XFile? image = await picker.pickImage(
//                 source: ImageSource.gallery,
//               );

//               if (image != null) {
//                 imageFile = File(image.path);
//                 widget.onchang(imageFile!);
//               }
//               setState(() {
//                 isLoading = !isLoading;
//               });
//             },
//             icon:
//                 imageFile != null
//                     ? Image.file(imageFile!, fit: BoxFit.fill)
//                     : isLoading
//                     ? LoadingIndicator(
//                       indicatorType: Indicator.ballPulse,
//                       colors: const [
//                         kPrimaryColor,
//                         kSecondaryColor,
//                         Color.fromARGB(255, 90, 140, 33),
//                       ],
//                     )
//                     : Icon(Icons.image, size: 130, color: kPrimaryColor),
//           ),

//           //
//         ),
//         Positioned(
//           top: 0,
//           left: 0,
//           child: Visibility(
//             visible: imageFile != null,
//             child: IconButton(
//               onPressed: () {
//                 setState(() {
//                   imageFile = null;
//                 });
//               },
//               icon: Icon(Icons.delete),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
