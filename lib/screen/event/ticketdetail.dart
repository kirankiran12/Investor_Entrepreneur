import 'package:flutter/material.dart';
import 'package:investorentrepreneur/common/customtext.dart';
import 'package:investorentrepreneur/screen/event/checkout.dart';
import 'package:investorentrepreneur/widget/custom_elevated_button.dart';

class Ticketdetail extends StatefulWidget {
  const Ticketdetail({super.key});

  @override
  State<Ticketdetail> createState() => _TicketdetailState();
}

class _TicketdetailState extends State<Ticketdetail> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05,
            vertical: screenHeight * 0.03,
          ),
          child: Column(

            children: [
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  IconButton(
                    icon: Icon(Icons.arrow_back_ios,
                        size: screenWidth * 0.06, color: Colors.black),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  CustomText(
                    text: "Ticket Detail",
                    fontSize: screenWidth * 0.05,
                    fontWeight: FontWeight.bold,
                  ),
                  CircleAvatar(
                    radius: screenWidth * 0.06,
                    backgroundImage: AssetImage('assets/images/men.jpeg'),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.03),
              Container(
                padding: EdgeInsets.all(screenWidth * 0.03),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 199, 216, 247),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: screenHeight * 0.15,
                      width: screenWidth * 0.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          'assets/images/ticketdetail.jpeg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.05),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10,),
                          Text(
                            "Risk-tolerance for higher goal",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: screenWidth * 0.045,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.015),
                          Row(
                            children: [
                              Icon(Icons.date_range,
                                  size: screenWidth * 0.05,
                                  color: Colors.black),
                              SizedBox(width: screenWidth * 0.02),
                              Text(
                                'Jan 28, 2025',
                                style: TextStyle(
                                  fontSize: screenWidth * 0.035,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          Row(
                            children: [
                              Icon(Icons.event_available,
                                  size: screenWidth * 0.05,
                                  color: Colors.black),
                              SizedBox(width: screenWidth * 0.02),
                              Text(
                                '10:00 AM-12:00PM',
                                style: TextStyle(
                                  fontSize: screenWidth * 0.035,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Container(
                padding: EdgeInsets.all(screenWidth * 0.03),
                decoration: BoxDecoration(
               color: const Color.fromARGB(255, 199, 216, 247),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "General Admission",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: screenWidth * 0.045,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
                            shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(8)),
                          ),
                          onPressed: () {},
                          child: Icon(
                            Icons.add,
                            size: screenWidth * 0.05,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "1",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: screenWidth * 0.045,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8) ),
                          ),
                          onPressed: () {},
                          child: Icon(
                            Icons.remove,
                            size: screenWidth * 0.05,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Divider(color: Colors.grey,),
                    SizedBox(height: screenHeight * 0.01),
                    Row(
                     
                      children: [
                        Text(
                          r'$35.00',
                          style: TextStyle(
                            fontSize: screenWidth * 0.035,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          r'rd$50.00 free',
                          style: TextStyle(
                            fontSize: screenWidth * 0.03,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Text(
                      'Sales end on April 15, 2025',
                      style: TextStyle(
                        fontSize: screenWidth * 0.035,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),

               SizedBox(height: screenHeight * 0.02),
              Container(
                padding: EdgeInsets.all(screenWidth * 0.03),
                decoration: BoxDecoration(
               color: const Color.fromARGB(255, 199, 216, 247),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Premium Ticket",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: screenWidth * 0.045,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
                            shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(8)),
                          ),
                          onPressed: () {},
                          child: Icon(
                            Icons.add,
                            size: screenWidth * 0.05,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "0",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: screenWidth * 0.045,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8) ),
                          ),
                          onPressed: () {},
                          child: Icon(
                            Icons.remove,
                            size: screenWidth * 0.05,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Divider(color: Colors.grey,),
                    SizedBox(height: screenHeight * 0.01),
                    Row(
                     
                      children: [
                        Text(
                          r'$50.00',
                          style: TextStyle(
                            fontSize: screenWidth * 0.035,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          r'rd$50.00 free',
                          style: TextStyle(
                            fontSize: screenWidth * 0.03,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Text(
                      'Sales end on April 15, 2025',
                      style: TextStyle(
                        fontSize: screenWidth * 0.035,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
               SizedBox(height: screenHeight * 0.02),
              Container(
                padding: EdgeInsets.all(screenWidth * 0.03),
                decoration: BoxDecoration(
               color: const Color.fromARGB(255, 199, 216, 247),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Early Access",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: screenWidth * 0.045,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
                            shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(8)),
                          ),
                          onPressed: () {},
                          child: Icon(
                            Icons.add,
                            size: screenWidth * 0.05,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "0",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: screenWidth * 0.045,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8) ),
                          ),
                          onPressed: () {},
                          child: Icon(
                            Icons.remove,
                            size: screenWidth * 0.05,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                 Divider(color: Colors.grey,),
                    SizedBox(height: screenHeight * 0.01),
                    Row(
                     
                      children: [
                        Text(
                          r'$45.00',
                          style: TextStyle(
                            fontSize: screenWidth * 0.035,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          r'rd$50.00 free',
                          style: TextStyle(
                            fontSize: screenWidth * 0.03,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Text(
                      'Sales end on April 15, 2025',
                      style: TextStyle(
                        fontSize: screenWidth * 0.035,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
SizedBox(height: screenHeight * 0.030),
                Center(
                  child: CustomElevatedButton(
                    onPressed: () {
                        Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Checkout()),
                      );
                    },
                    text: 'Buy Ticket',
                  ),
                ),

            ],
          ),
        ),
      ),
    );
  }
}
