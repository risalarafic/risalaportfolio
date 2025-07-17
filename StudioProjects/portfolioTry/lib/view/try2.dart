// import 'package:url_launcher/url_launcher.dart';
//
// Widget _buildContactInfo() {
//   return Container(
//     width: 500,
//     padding: EdgeInsets.all(30),
//     decoration: BoxDecoration(
//       color: Color(0xFFFEFEF5),
//       borderRadius: BorderRadius.circular(15),
//       border: Border.all(color: Color(0xFFEA7435).withOpacity(0.3)),
//     ),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Text(
//           'Contact Information',
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         SizedBox(height: 25),
//         _buildContactItem(
//           Icons.email,
//           'Email',
//           '', // We'll replace this with clickable email
//           customChild: InkWell(
//             onTap: () async {
//               final Uri emailLaunchUri = Uri(
//                 scheme: 'mailto',
//                 path: 'risalarafic@gmail.com',
//               );
//               if (await canLaunchUrl(emailLaunchUri)) {
//                 await launchUrl(emailLaunchUri);
//               }
//             },
//             child: Text(
//               '   risalarafic@gmail.com',
//               style: TextStyle(
//                 color: Colors.black,
//                 decoration: TextDecoration.underline,
//               ),
//             ),
//           ),
//         ),
//         SizedBox(height: 20),
//         _buildContactItem(Icons.phone, 'Phone', '   +91-8086136129'),
//         SizedBox(height: 20),
//         _buildContactItem(Icons.location_on, 'Location', '   Ernakulam, Kerala, India'),
//         SizedBox(height: 20),
//         _buildContactItem(Icons.language, 'Website', '   www.risala.dev'),
//       ],
//     ),
//   );
// }
