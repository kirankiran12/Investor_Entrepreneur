import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:investorentrepreneur/common/app_color.dart';
import 'package:investorentrepreneur/widget/custom_elevated_button.dart';
import 'package:investorentrepreneur/widget/custom_textformfield.dart';

class Cardscreen extends StatefulWidget {
  final String image;
  final String carName;
  final String bookingDate;
  const Cardscreen(
      {super.key,
      required this.image,
      required this.carName,
      required this.bookingDate});

  @override
  State<Cardscreen> createState() => _CardscreenState();
}

class _CardscreenState extends State<Cardscreen> {
  final _cardNameController = TextEditingController();
  final _cardNumberController = TextEditingController();
  final _expiryDateController = TextEditingController();
  final _securityCodeController = TextEditingController();
  final _zipCodeController = TextEditingController();
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();

  String generateBookingId() {
    const String chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    Random random = Random();

    // Random 4-letter string
    String randomAlpha = String.fromCharCodes(
      List.generate(
          4, (index) => chars.codeUnitAt(random.nextInt(chars.length))),
    );

    // Random 6-digit number
    int randomNumber =
        random.nextInt(900000) + 100000; // Ensures 6-digit number

    return '$randomAlpha$randomNumber'; // Combine string and number
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: AppColor.primaryColor,
            leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                )),
            floating: false,
            pinned: true,
            snap: false,
            expandedHeight: 220,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                widget.image,
                fit: BoxFit.cover,
              ),
              title: Text(
                'Payment',
                style: TextStyle(color: AppColor.whiteColor),
              ),
              centerTitle: true,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // Credit Card UI
                  _buildCreditCardUI(),
                  const SizedBox(height: 20),
                  // Payment Form
                  _buildTextField(
                    'Name on Card',
                    "Cardholder's Name",
                    _cardNameController,
                    icon: Icons.person_outline,
                    onChanged: (_) => setState(() {}),
                  ),
                  _buildTextField(
                    'Card number',
                    "Card number",
                    _cardNumberController,
                    icon: Icons.credit_card,
                    keyboardType: TextInputType.number,
                    onChanged: (_) => setState(() {}),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: _buildTextField(
                          'Expiry date',
                          "MM/YY",
                          _expiryDateController,
                          icon: Icons.calendar_today,
                          keyboardType: TextInputType.datetime,
                          onChanged: (_) => setState(() {}),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _buildTextField(
                          'Security code',
                          "CVV",
                          _securityCodeController,
                          icon: Icons.lock_outline,
                          keyboardType: TextInputType.number,
                          obscureText: true,
                          onChanged: (_) => setState(() {}),
                        ),
                      ),
                    ],
                  ),
                  _buildTextField(
                    'Zip Code',
                    "Enter zip code",
                    _zipCodeController,
                    icon: Icons.location_on_outlined,
                    keyboardType: TextInputType.number,
                    onChanged: (_) => setState(() {}),
                  ),
                  const SizedBox(height: 30),
                  // Pay Now Button
                  CustomElevatedButton(
                      isLoading: isLoading,
                      onPressed: () {
                        setState(() {
                          isLoading = true;
                        });
                        // Navigator.pushReplacement(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => BookingConfirmationScreen(
                        //           carName: widget.carName,
                        //           bookingDate: widget.bookingDate,
                        //           bookingId: generateBookingId()),
                        //     ));
                        print('AHMAD');
                        if (_formKey.currentState?.validate() ?? false) {
                          // _showPaymentResult(context);
                          print('RAZZAQ');
                        } else {
                          setState(() {
                            isLoading = false;
                          });
                        }
                      },
                      text: 'Pay Now'),
                  SizedBox(height: 10),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(fontSize: 16, color: Colors.black),
                        children: [
                          TextSpan(
                              text: 'If you have made a booking and want to '),
                          TextSpan(
                            text: 'Cancel Booking',
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => CancelBookingScreen(),
                                //   ),
                                // );
                              },
                          ),
                          TextSpan(text: ', click here.'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Build Credit Card UI
  Widget _buildCreditCardUI() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColor.primaryColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Credit Card',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            _cardNumberController.text.isEmpty
                ? 'XXXX XXXX XXXX XXXX'
                : _cardNumberController.text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Cardholder Name',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      _cardNameController.text.isEmpty
                          ? 'Your Name'
                          : _cardNameController.text,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Expiry Date',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      _expiryDateController.text.isEmpty
                          ? 'MM/YY'
                          : _expiryDateController.text,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Build Text Field
  Widget _buildTextField(
    String label,
    String hint,
    TextEditingController controller, {
    TextInputType? keyboardType,
    IconData? icon,
    bool obscureText = false,
    Function(String)? onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 5),
        CustomTextFormField(
          keyboardType: keyboardType,
          controller: controller,
          hint: hint,
          obscureText: obscureText,
          // validator: (value) =>
          //     Validation.fieldValidation(value, 'This field is required'),
          prefixIcon: Icon(icon),
          onChanged: onChanged,
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  // Show Payment Result
  void _showPaymentResult(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Payment Status'),
        content: const Text('Your payment was successful!'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
