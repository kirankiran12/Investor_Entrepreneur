import 'package:flutter/material.dart';
import 'package:investorentrepreneur/common/customtext.dart';
import 'package:investorentrepreneur/screen/home/Setting/paymentmethod/addcard.dart';

class Paymentscreen extends StatefulWidget {
  const Paymentscreen({super.key});

  @override
  State<Paymentscreen> createState() => _PaymentscreenState();
}

class _PaymentscreenState extends State<Paymentscreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.05),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.chevron_left_rounded,
                        size: screenWidth * 0.08, color: Colors.black),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  CustomText(
                    text: "Payment Method",
                    fontSize: screenWidth * 0.06,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              CustomText(
                text: "Payment Method",
                fontSize: screenWidth * 0.06,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: screenHeight * 0.03),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      _showBottomSheet(context);
                    },
                    child: Text(
                      "Add Payment Method",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth * 0.045,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.chevron_right,
                      size: screenWidth * 0.06, color: Colors.blue),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomText(
                text: "Add Payment Method",
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              ListTile(
                leading: const Icon(Icons.payment_outlined, color: Colors.blue),
                title: const Text("Credit or debit Card"),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Addcard()));
                },
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.paypal,
                    color: Color.fromARGB(255, 3, 46, 121)),
                title: const Text("Paypal"),
                onTap: () {},
              ),
              const Divider(),
              ListTile(
                leading:
                    const Icon(Icons.payments_outlined, color: Colors.orange),
                title: const Text("Apple pay"),
                onTap: () {},
              ),
            ],
          ),
        );
      },
    );
  }
}
