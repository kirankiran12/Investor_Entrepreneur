import 'package:flutter/material.dart';
import 'package:investorentrepreneur/widget/custom_elevated_button.dart';
import 'package:investorentrepreneur/widget/outlinegradientbutton.dart';
import 'package:investorentrepreneur/widget/rectangleshapeElevated%20widget.dart';

class Filterscreen extends StatefulWidget {
  const Filterscreen({super.key});

  @override
  State<Filterscreen> createState() => _FilterscreenState();
}

class _FilterscreenState extends State<Filterscreen> {
  String selectedFilter = "Both"; // Default selected tab

  final Map<String, Widget> filterData = {
    "Both": Column(
      children: [
        Text(
          "Type of Entrepreneur", style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Tech Entrepreneur ',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 10),
            IconButton(
              icon: Icon(
                Icons.arrow_drop_up_outlined,
                size: 30,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
          ],
        ),
       
       
       SizedBox(height: 20,),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RectangleElevated(text: 'Software Development'),
            RectangleElevated(text: 'Hardware inovation'),
            RectangleElevated(text: 'Artificial Intelligence'),
            RectangleElevated(text: 'CyberSecurity'),
            RectangleElevated(text: 'Internet of Things(IOT)'),
            RectangleElevated(text: 'Other'),
          ],
        ),
         SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Tech Entrepreneur ',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 10),
            IconButton(
              icon: Icon(
                Icons.arrow_drop_down_sharp,
                size: 30,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Biotech Entrepreneur ',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 10),
            IconButton(
              icon: Icon(
                Icons.arrow_drop_down_sharp,
                size: 30,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Food Entrepreneur ',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 10),
            IconButton(
              icon: Icon(
                Icons.arrow_drop_down_sharp,
                size: 30,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Fashion Entrepreneur ',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 10),
            IconButton(
              icon: Icon(
                Icons.arrow_drop_down_sharp,
                size: 30,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
          ],
        ),
         SizedBox(height: 20,),
        Row(
          children: [
            CustomElevatedButton(onPressed: () {}, text: 'Apply Filters'),
            GradientOutlinedButton(
              onPressed: () {},
              text: "Reset Filters",
            ),
          ],
        ),
      ],
    ),
    "Entrepreneur": Column(
      children: [
        Text("Type of Entrepreneur", style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),),
 SizedBox(height: 20,),
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Tech Entrepreneur ',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 10),
            IconButton(
              icon: Icon(
                Icons.arrow_drop_up_outlined,
                size: 30,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
          ],
        ),
       SizedBox(height: 20,),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RectangleElevated(text: 'Software Development'),
            RectangleElevated(text: 'Hardware inovation'),
            RectangleElevated(text: 'Artificial Intelligence'),
            RectangleElevated(text: 'CyberSecurity'),
            RectangleElevated(text: 'Internet of Things(IOT)'),
            RectangleElevated(text: 'Other'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Tech Entrepreneur ',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 10),
            IconButton(
              icon: Icon(
                Icons.arrow_drop_down_sharp,
                size: 30,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Biotech Entrepreneur ',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 10),
            IconButton(
              icon: Icon(
                Icons.arrow_drop_down_sharp,
                size: 30,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
          ],
        ),
        Column(
          children: [
            RectangleElevated(text: 'Drug Development'),
             RectangleElevated(text: ' Medical devices'),
              RectangleElevated(text: 'Genetic Engineering'),
             
          ],
        ),
      
        Row(
          children: [
            CustomElevatedButton(onPressed: () {}, text: 'Apply Filters'),
            GradientOutlinedButton(
              onPressed: () {},
              text: "Reset Filters",
            ),
          ],
        ),
      ],
      
    ),

    "Investor": Column(
      children: [
        Text("Investor Questions",
         style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),),
               Text(" What's your investment criteria?",
                style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),),

        
        SizedBox(height: 20,),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                RectangleElevated(text: 'Market Potential'), RectangleElevated(text: 'Fanancial Matrics'),
              ],
            ),
             Row(
              children: [
                RectangleElevated(text: 'Team Eexpertise'), RectangleElevated(text: 'Growth Projection'),
              ],
            ),
            Row(
              children: [
                RectangleElevated(text: 'All of the above'), RectangleElevated(text: 'other'),
              ],
            ),  ],
        ),
         SizedBox(height: 20,),
         Text("Investor Involvement Level",
         style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),),
               Row(
              children: [
                RectangleElevated(text: 'very hands-on'), RectangleElevated(text: 'Moderatly involved'),
              ],
            ),
             SizedBox(height: 20,),
             Column(
              children: [
                RectangleElevated(text: 'prefer hands-off aproach'), 
                RectangleElevated(text: 'Depend on situation'),
                  RectangleElevated(text: 'willing to adopt based on company needs'),
                    RectangleElevated(text: 'other'),
              ],
            ),
        SizedBox(height: 20,),
        Text(" How long for investment return ?",
                style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),),
               SizedBox(height: 20,),
        Row(
          children: [
            CustomElevatedButton(onPressed: () {}, text: 'Apply Filters'),
            GradientOutlinedButton(
              onPressed: () {},
              text: "Reset Filters",
            ),
          ],
        ),
      ],
    ),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 30,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(width: 10),
                const Text(
                  'Filters',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            const Text(
              'Select filters',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),

            // Tab-like buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildFilterButton("Both"),
                _buildFilterButton("Entrepreneur"),
                _buildFilterButton("Investor"),
              ],
            ),

            SizedBox(height: 20),

            // Dynamic Content Based on Selected Tab
            Expanded(
              child: Center(
                child: filterData[selectedFilter] ?? Text("No data available"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to build a tab button
  Widget _buildFilterButton(String filter) {
    bool isSelected = selectedFilter == filter;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedFilter = filter; // Update UI when a tab is clicked
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: isSelected
              ? LinearGradient(
                  colors: [
                    Colors.blue,
                    Colors.purple,
                    Colors.red,
                    Colors.orange
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
          color: isSelected ? null : Colors.grey[300],
        ),
        child: Text(
          filter,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:investorentrepreneur/widget/custom_elevated_button.dart';
// import 'package:investorentrepreneur/widget/outlinegradientbutton.dart';
// // import 'package:investorentrepreneur/widget/rectangleshapeElevated%20widget.dart';

// class Filterscreen extends StatefulWidget {
//   const Filterscreen({super.key});

//   @override
//   State<Filterscreen> createState() => _FilterscreenState();
// }

// class _FilterscreenState extends State<Filterscreen> {
//   String selectedFilter = "Both"; 
//   Set<String> selectedButtons = {}; 

 
//   Widget _buildSelectableButton(String text) {
//     bool isSelected = selectedButtons.contains(text);
    
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           if (isSelected) {
//             selectedButtons.remove(text);
//           } else {
//             selectedButtons.add(text);
//           }
//         });
//       },
//       child: Container(
//         padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
//         margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5), // Spacing between buttons
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(8),
//           gradient: isSelected
//               ? LinearGradient(
//                   colors: [Colors.blue, Colors.purple, Colors.red, Colors.orange],
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                 )
//               : null,
//           color: isSelected ? null : Colors.grey[300],
//         ),
//         child: Text(
//           text,
//           style: TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//             color: isSelected ? Colors.white : Colors.black,
//           ),
//         ),
//       ),
//     );
//   }

//   final Map<String, Widget> filterData = {};

//   @override
//   void initState() {
//     super.initState();

//     // Populate filterData dynamically using _buildSelectableButton
//     filterData["Both"] = Column(
//       children: [
//         SizedBox(height: 10,),
//         Column(
//           children: [
//             Text(
//               "Type of Entrepreneur",
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
        
//          Text(
//           "Tech Entrepreneur",
//           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//         ),
//         ],
//         ),
//         SizedBox(height: 20,),
//         Column(
//         //   alignment: WrapAlignment.center,
//           children: [
//             _buildSelectableButton("Software Development"),
//             _buildSelectableButton("Hardware Innovation"),
//             _buildSelectableButton("Artificial Intelligence"),
//             _buildSelectableButton("Cyber Security"),
//             _buildSelectableButton("Internet of Things (IoT)"),
//             _buildSelectableButton("Other"),
//           ],
//         ),
//         SizedBox(height: 10),

//          Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             const Text(
//               'Tech Entrepreneur ',
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(width: 10),
//             IconButton(
//               icon: Icon(
//                 Icons.arrow_drop_down_sharp,
//                 size: 30,
//                 color: Colors.black,
//               ),
//               onPressed: () {},
//             ),
//           ],
//         ),
//         SizedBox(height: 20, width: 20,),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             const Text(
//               'Biotech Entrepreneur ',
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(width: 10),
//             IconButton(
//               icon: Icon(
//                 Icons.arrow_drop_down_sharp,
//                 size: 30,
//                 color: Colors.black,
//               ),
//               onPressed: () {},
//             ),
//           ],
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             const Text(
//               'Food Entrepreneur ',
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(width: 10),
//             IconButton(
//               icon: Icon(
//                 Icons.arrow_drop_down_sharp,
//                 size: 30,
//                 color: Colors.black,
//               ),
//               onPressed: () {},
//             ),
//           ],
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             const Text(
//               'Fashion Entrepreneur ',
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(width: 10),
//             IconButton(
//               icon: Icon(
//                 Icons.arrow_drop_down_sharp,
//                 size: 30,
//                 color: Colors.black,
//               ),
//               onPressed: () {},
//             ),
//           ],
//         ),
//         SizedBox(height: 10,),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             CustomElevatedButton(onPressed: () {}, text: 'Apply Filters'),
//             GradientOutlinedButton(onPressed: () {}, text: "Reset Filters"),
//           ],
//         ),
//       ],
//     );

//     filterData["Entrepreneur"] = Column(
//       children: [
//         Text(
//           "Type Entrepreneur ",
//           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//         ),
// SizedBox(height: 10,),
//  Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             const Text(
//               'Tech Entrepreneur ',
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(width: 10),
//             IconButton(
//               icon: Icon(
//                 Icons.arrow_drop_down_sharp,
//                 size: 30,
//                 color: Colors.black,
//               ),
//               onPressed: () {},
//             ),
//           ],
//         ),
//         SizedBox(height: 10,),
//  Column(
//         //   alignment: WrapAlignment.center,
//           children: [
//             _buildSelectableButton("Software Development"),
//             _buildSelectableButton("Hardware Innovation"),
//             _buildSelectableButton("Artificial Intelligence"),
//             _buildSelectableButton("Cyber Security"),
//             _buildSelectableButton("Internet of Things (IoT)"),
//             _buildSelectableButton("Other"),
//           ],
//         ),
// SizedBox(height: 10,),
// Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             const Text(
//               'Biotech Entrepreneur ',
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(width: 10),
//             IconButton(
//               icon: Icon(
//                 Icons.arrow_drop_down_sharp,
//                 size: 30,
//                 color: Colors.black,
//               ),
//               onPressed: () {},
//             ),
//           ],
//         ),

//         Column(
//         //   alignment: WrapAlignment.center,
//           children: [
//             _buildSelectableButton("Drug Development"),
//             _buildSelectableButton("Medical devices"),
//             _buildSelectableButton("Genetic Engineering"),
         
//           ],
//         ),
//         SizedBox(height: 10),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             CustomElevatedButton(onPressed: () {}, text: 'Apply Filters'),
//             GradientOutlinedButton(onPressed: () {}, text: "Reset Filters"),
//           ],
//         ),
//       ],
//     );

//     filterData["Investor"] = Column(
//       children: [
//         Text(
//           "Investor Questions",
//           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//         ),
//         Text(
//           "what's your investment criteria ?",
//           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//         ),
//         Column(
//         //   alignment: WrapAlignment.start,
//           children: [
//             _buildSelectableButton("Market Potential"),
//             _buildSelectableButton("Financial Metrics"),
//             _buildSelectableButton("Team Expertise"),
//             _buildSelectableButton("Growth Projection"),
//             _buildSelectableButton("All of the above"),
//             _buildSelectableButton("Other"),
//           ],
//         ),

//  Text("Investor Involvement Level",
//          style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),),
               




//  Wrap(
//           alignment: WrapAlignment.start,
//           children: [
//             _buildSelectableButton("very hands-on"),
//             _buildSelectableButton("Moderatly involved"),
//             _buildSelectableButton("Depend on situation"),
//             _buildSelectableButton("prefer hands-off aproach"),
//             _buildSelectableButton("Willing to adopt based on the company's needs"),
//             _buildSelectableButton("Other"),
//           ],
//         ),

//  Text(" How long for  Investment returns",
//          style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),),
               
//         SizedBox(height: 10),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             CustomElevatedButton(onPressed: () {}, text: 'Apply Filters'),
//             GradientOutlinedButton(onPressed: () {}, text: "Reset Filters"),
//           ],
//         ),
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(height: 50),
//             Row(
//               children: [
//                 IconButton(
//                   icon: Icon(Icons.arrow_back_ios, size: 30, color: Colors.black),
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                 ),
//                 SizedBox(width: 10),
//                 Text(
//                   'Filters',
//                   style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//                 ),
//               ],
//             ),
//             SizedBox(height: 10),
//             Text(
//               'Select filters',
//               style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 10),

//             // Tab-like buttons
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 _buildFilterButton("Both"),
//                 _buildFilterButton("Entrepreneur"),
//                 _buildFilterButton("Investor"),
//               ],
//             ),

//             SizedBox(height: 20),

//             // Dynamic Content Based on Selected Tab
//             Expanded(
//               child: Center(
//                 child: filterData[selectedFilter] ?? Text("No data available"),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // Function to build a tab button
//   Widget _buildFilterButton(String filter) {
//     bool isSelected = selectedFilter == filter;

//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           selectedFilter = filter;
//           selectedButtons.clear(); // Reset selected buttons when switching tabs
//         });
//       },
//       child: Container(
//         padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(8),
//           gradient: isSelected
//               ? LinearGradient(
//                   colors: [Colors.blue, Colors.purple, Colors.red, Colors.orange],
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                 )
//               : null,
//           color: isSelected ? null : Colors.grey[300],
//         ),
//         child: Text(
//           filter,
//           style: TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//             color: isSelected ? Colors.white : Colors.black,
//           ),
//         ),
//       ),
//     );
//   }
// }

// // import 'package:flutter/material.dart';
// // import 'package:investorentrepreneur/widget/custom_elevated_button.dart';
// // import 'package:investorentrepreneur/widget/outlinegradientbutton.dart';

// // class Filterscreen extends StatefulWidget {
// //   const Filterscreen({super.key});

// //   @override
// //   State<Filterscreen> createState() => _FilterscreenState();
// // }

// // class _FilterscreenState extends State<Filterscreen> {
// //   String selectedFilter = "Both"; 
// //   Set<String> selectedButtons = {}; 

// //   Widget _buildSelectableButton(String text) {
// //     bool isSelected = selectedButtons.contains(text);
    
// //     return GestureDetector(
// //       onTap: () {
// //         setState(() {
// //           if (isSelected) {
// //             selectedButtons.remove(text);
// //           } else {
// //             selectedButtons.add(text);
//           }
//         });
//       },
//       child: Container(
//         padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
//         margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5), // Spacing between buttons
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(8),
//           gradient: isSelected
//               ? LinearGradient(
//                   colors: [Colors.blue, Colors.purple, Colors.red, Colors.orange],
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                 )
//               : null,
//           color: isSelected ? null : Colors.grey[300],
//         ),
//         child: Text(
//           text,
//           style: TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//             color: isSelected ? Colors.white : Colors.black,
//           ),
//         ),
//       ),
//     );
//   }

//   final Map<String, Widget> filterData = {};

//   @override
//   void initState() {
//     super.initState();

//     filterData["Both"] = Column(
//       children: [
//         SizedBox(height: 10),
//         Text(
//           "Type of Entrepreneur",
//           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//         ),
//         SizedBox(height: 20),
//         Column(
//           children: [
//             _buildSelectableButton("Software Development"),
//             _buildSelectableButton("Hardware Innovation"),
//             _buildSelectableButton("Artificial Intelligence"),
//             _buildSelectableButton("Cyber Security"),
//             _buildSelectableButton("Internet of Things (IoT)"),
//             _buildSelectableButton("Other"),
//           ],
//         ),
//         SizedBox(height: 10),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text('Tech Entrepreneur', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//             IconButton(
//               icon: Icon(Icons.arrow_drop_down_sharp, size: 30, color: Colors.black),
//               onPressed: () {},
//             ),
//           ],
//         ),
//         SizedBox(height: 20),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text('Biotech Entrepreneur', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//             IconButton(
//               icon: Icon(Icons.arrow_drop_down_sharp, size: 30, color: Colors.black),
//               onPressed: () {},
//             ),
//           ],
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text('Food Entrepreneur', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//             IconButton(
//               icon: Icon(Icons.arrow_drop_down_sharp, size: 30, color: Colors.black),
//               onPressed: () {},
//             ),
//           ],
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text('Fashion Entrepreneur', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//             IconButton(
//               icon: Icon(Icons.arrow_drop_down_sharp, size: 30, color: Colors.black),
//               onPressed: () {},
//             ),
//           ],
//         ),
//         SizedBox(height: 10),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             CustomElevatedButton(onPressed: () {}, text: 'Apply Filters'),
//             GradientOutlinedButton(onPressed: () {}, text: "Reset Filters"),
//           ],
//         ),
//       ],
//     );

//     filterData["Entrepreneur"] = Column(
//       children: [
//         Text("Type Entrepreneur", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//         SizedBox(height: 10),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text('Tech Entrepreneur', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//             IconButton(
//               icon: Icon(Icons.arrow_drop_down_sharp, size: 30, color: Colors.black),
//               onPressed: () {},
//             ),
//           ],
//         ),
//         SizedBox(height: 10),
//         Column(
//           children: [
//             _buildSelectableButton("Software Development"),
//             _buildSelectableButton("Hardware Innovation"),
//             _buildSelectableButton("Artificial Intelligence"),
//             _buildSelectableButton("Cyber Security"),
//             _buildSelectableButton("Internet of Things (IoT)"),
//             _buildSelectableButton("Other"),
//           ],
//         ),
//         SizedBox(height: 10),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text('Biotech Entrepreneur', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//             IconButton(
//               icon: Icon(Icons.arrow_drop_down_sharp, size: 30, color: Colors.black),
//               onPressed: () {},
//             ),
//           ],
//         ),
//         Column(
//           children: [
//             _buildSelectableButton("Drug Development"),
//             _buildSelectableButton("Medical devices"),
//             _buildSelectableButton("Genetic Engineering"),
//           ],
//         ),
//         SizedBox(height: 10),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             CustomElevatedButton(onPressed: () {}, text: 'Apply Filters'),
//             GradientOutlinedButton(onPressed: () {}, text: "Reset Filters"),
//           ],
//         ),
//       ],
//     );

//     filterData["Investor"] = Column(
//       children: [
//         Text("Investor Questions", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//         Text("What's your investment criteria?", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//         Column(
//           children: [
//             _buildSelectableButton("Market Potential"),
//             _buildSelectableButton("Financial Metrics"),
//             _buildSelectableButton("Team Expertise"),
//             _buildSelectableButton("Growth Projection"),
//             _buildSelectableButton("All of the above"),
//             _buildSelectableButton("Other"),
//           ],
//         ),
//         Text("Investor Involvement Level", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//         Wrap(
//           alignment: WrapAlignment.start,
//           children: [
//             _buildSelectableButton("Very hands-on"),
//             _buildSelectableButton("Moderately involved"),
//             _buildSelectableButton("Depend on situation"),
//             _buildSelectableButton("Prefer hands-off approach"),
//             _buildSelectableButton("Willing to adopt based on the company's needs"),
//             _buildSelectableButton("Other"),
//           ],
//         ),
//         Text("How long for Investment returns?", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//         SizedBox(height: 10),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             CustomElevatedButton(onPressed: () {}, text: 'Apply Filters'),
//             GradientOutlinedButton(onPressed: () {}, text: "Reset Filters"),
//           ],
//         ),
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(height: 50),
//             Row(
//               children: [
//                 IconButton(
//                   icon: Icon(Icons.arrow_back_ios, size: 30, color: Colors.black),
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                 ),
//                 SizedBox(width: 10),
//                 Text(
//                   'Filters',
//                   style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//                 ),
//               ],
//             ),
//             SizedBox(height: 10),
//             Text(
//               'Select filters',
//               style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 10),

//             // Tab-like buttons
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 _buildFilterButton("Both"),
//                 _buildFilterButton("Entrepreneur"),
//                 _buildFilterButton("Investor"),
//               ],
//             ),

//             SizedBox(height: 20),

//             // Dynamic Content Based on Selected Tab
//             Expanded(
//               child: SingleChildScrollView(
//                 child: filterData[selectedFilter] ?? Text("No data available"),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // Function to build a tab button
//   Widget _buildFilterButton(String filter) {
//     bool isSelected = selectedFilter == filter;

//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           selectedFilter = filter;
//           selectedButtons.clear(); // Reset selected buttons when switching tabs
//         });
//       },
//       child: Container(
//         padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(8),
//           gradient: isSelected
//               ? LinearGradient(
//                   colors: [Colors.blue, Colors.purple, Colors.red, Colors.orange],
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                 )
//               : null,
//           color: isSelected ? null : Colors.grey[300],
//         ),
//         child: Text(
//           filter,
//           style: TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//             color: isSelected ? Colors.white : Colors.black,
//           ),
//         ),
//       ),
//     );
//   }
// }
