// import 'package:flutter/material.dart';
// import 'package:healthcare_mobile/modules/chat_gpt/widget/custom_text_widget.dart';
// import 'package:healthcare_mobile/modules/chat_gpt/widget/drop_down.dart';


// class Services {
//   static Future<void> showBottomSheet({required context}) async {
//     await showModalBottomSheet(
//       backgroundColor: Color(0xff343541),
//       shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
//       context: context,
//       builder: (context) {
//         return Padding(
//           padding: const EdgeInsets.all(16),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: const [
//               Flexible(
//                 child: CustomTextWidget(
//                   label: "Choose Model:",
//                   fontSize: 16,
//                 ),
//               ),
//               Flexible(flex: 2, child: CustomDropDownButton())
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
