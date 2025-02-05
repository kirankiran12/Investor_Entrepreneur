
import 'package:flutter/material.dart';
import 'package:investorentrepreneur/common/customtext.dart';
import 'package:investorentrepreneur/screen/event/participant.dart';
import 'package:investorentrepreneur/widget/custom_elevated_button.dart';

class Eventdetail extends StatefulWidget {
  const Eventdetail({super.key});

  @override
  _EventdetailState createState() => _EventdetailState();
}

class _EventdetailState extends State<Eventdetail> {
  @override
  Widget build(BuildContext context) {
   
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.05, vertical: screenHeight * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios,
                          size: screenWidth * 0.07, color: Colors.black),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    CustomText(
                      text: "Event Detail",
                      fontSize: screenWidth * 0.06,
                      fontWeight: FontWeight.bold,
                    ),
                    CircleAvatar(
                      radius: screenWidth * 0.06,
                      backgroundImage: AssetImage('assets/images/men.jpeg'),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                ClipRRect(
                  borderRadius: BorderRadius.circular(screenWidth * 0.03),
                  child: Image.asset(
                    'assets/images/eventdetail.jpeg',
                    width: screenWidth * 0.9,
                    height: screenWidth * 0.5,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'Risk tolerant for higher return',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth * 0.05,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.share_outlined,
                          size: screenWidth * 0.07, color: Colors.black),
                      onPressed: () {},
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.location_on_outlined,
                        size: screenWidth * 0.07, color: Colors.black),
                    SizedBox(width: screenWidth * 0.02),
                    Expanded(
                      child: Text(
                        'Grand hall, street 3223, sdasdassdasgh UK',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: screenWidth * 0.035,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.01),
                Row(
                  children: [
                    Icon(Icons.event_available,
                        size: screenWidth * 0.07, color: Colors.black),
                    SizedBox(width: screenWidth * 0.02),
                    Text(
                      'Thursday, 10.0pm - 20.0am',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: screenWidth * 0.035,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.03),
                Text(
                  'About Event',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth * 0.045,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  '''Lorem is a simply dummy text of the printing and typewriting industry. Lorem Ipsum has been the industry's standard dummy text over the 1500s. It may type of spacemen book.''',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: screenWidth * 0.04,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                Row(
                  children: [
                    _buildPersonButton('Host', screenWidth),
                    SizedBox(width: screenWidth * 0.02),
                    _buildPersonButton('Guest', screenWidth),
                    SizedBox(width: screenWidth * 0.02),
                    _buildPersonButton('Guest', screenWidth),
                  ],
                ),
                SizedBox(height: screenHeight * 0.070),
                Center(
                  child: CustomElevatedButton(
                    onPressed: () {
                        Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Participant()),
                      );
                    },
                    text: 'Buy Ticket',
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildPersonButton(String label, double screenWidth) {
    return ElevatedButton(
      onPressed: () {
      
      },
      child: Row(
        children: [
          CircleAvatar(
            radius: screenWidth * 0.03,
            backgroundImage: AssetImage('assets/images/men.jpeg'),
          ),
          SizedBox(width: screenWidth * 0.02),
          Text(
            label,
            style: TextStyle(
              fontSize: screenWidth * 0.04,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.04,
          vertical: screenWidth * 0.025,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(screenWidth * 0.05),
        ),
      ),
    );
  }
}
