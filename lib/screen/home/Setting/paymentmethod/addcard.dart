import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:investorentrepreneur/common/customtext.dart';
import 'package:investorentrepreneur/screen/home/Setting/paymentmethod/cardscreen.dart';
import 'package:investorentrepreneur/widget/custom_elevated_button.dart';

import 'package:investorentrepreneur/widget/custom_textformfield.dart';

class Addcard extends StatefulWidget {
  const Addcard ({super.key});

  @override
  State<Addcard > createState() => _AddcardState();
}

class _AddcardState extends State<Addcard > {
  final nameController = TextEditingController();
  final postalController = TextEditingController();
    final cityController = TextEditingController();
  final noController = TextEditingController();
  final dateController = TextEditingController();
   final cvvController = TextEditingController();
  final passwordController = TextEditingController();
 String selectedCountry = 'Select Country';



  void _showCountryPicker() {
    showCountryPicker(
      context: context,
      showPhoneCode: false,
      searchAutofocus: true,
      countryListTheme: CountryListThemeData(
        borderRadius: BorderRadius.circular(15),
        
        inputDecoration: InputDecoration(
          labelText: 'Search',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      onSelect: (Country country) {
        setState(() {
          selectedCountry = '${country.flagEmoji} ${country.name} (+${country.phoneCode})';
        });
      },
    );
  }

  String? selectedCountryCode; 
  String? phoneNumber;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
        body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05,
          vertical: screenHeight * 0.03,
        ),
        child: Column(children: [
          const SizedBox(height: 30),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.chevron_right_sharp,
                    size: 30, color: Colors.black),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Row(
                children: [
                  CustomText(
                    text: "Add Card",
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                         
                        },
                        
                        child: Container(margin: EdgeInsets.only(left: 120),
                          child: const Text(
                            "Save",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                     
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Add card',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            const SizedBox(height: 15),
            Align(
              alignment: Alignment.centerLeft,
              child: const Text(
                'Card number*',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            CustomTextFormField(
              controller: noController,
              hint: 'Enter title',
            ),
            const SizedBox(height: 15),
 const SizedBox(height: 15),
                  Row(
                    children: [
                      const Text(
                        'MM/YY',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      const SizedBox(width: 80),
                      Container(margin: EdgeInsets.only(left: 50),
                        child: const Text(
                          'CVV',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                    Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: dateController,
                          decoration: InputDecoration(
                            hintText: 'Enter title',
                           
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.withOpacity(0.3),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.withOpacity(0.3),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                         
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: TextFormField(
                          controller:cvvController,
                          decoration: InputDecoration(
                            hintText: 'Enter title',
                         
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.withOpacity(0.3),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.withOpacity(0.3),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          
                        ),
                      ),
                    ],
                  ),

             const SizedBox(height: 15),
            Align(
              alignment: Alignment.centerLeft,
              child: const Text(
                'Billing Address',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: const Text(
                'Full Name',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            CustomTextFormField(
              controller: nameController,
              hint: 'Enter title',
            ),
            const SizedBox(height: 15),
            Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector.new(
                 onTap: _showCountryPicker,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
                child: Row(
                  children: [
                    Text(
                       selectedCountry,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),Spacer(),
                    Icon(Icons.arrow_forward_ios_outlined,size: 15,)
                  ],
                ),
              ),
            ),),
            const SizedBox(height: 15),
            Align(
              alignment: Alignment.centerLeft,
              child: const Text(
                'Address',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            CustomTextFormField(
              controller: cityController,
              hint: 'Enter title',
            ),
            const SizedBox(height: 15),
            Align(
              alignment: Alignment.centerLeft,
              child: const Text(
                'City/Town',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            CustomTextFormField(
              controller: noController,
              hint: 'Enter title',
            ),
            const SizedBox(height: 15),
            Align(
              alignment: Alignment.centerLeft,
              child: const Text(
                'Postal Code',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            CustomTextFormField(
              controller: postalController,
              hint: 'Enter Code',
            ),
            const SizedBox(height: 15),


             SizedBox(height: screenHeight * 0.05),
                Center(
                  child: CustomElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Cardscreen(
                        image: '',
                        carName: '',
                       bookingDate: '',)));
                    },
                    text: 'Add card',
                  ),
                ),
          ]),
        ]),
      ),
    ));
  }
}
