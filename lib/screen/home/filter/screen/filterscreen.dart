import 'package:flutter/material.dart';
import 'package:investorentrepreneur/screen/home/filter/model/filter_model.dart';
import 'package:investorentrepreneur/screen/home/filter/provider/filter_provider.dart';
import 'package:investorentrepreneur/screen/home/filter/widgets/entrepreneur_widget.dart';
import 'package:investorentrepreneur/screen/home/filter/widgets/investor_widget.dart';

import 'package:provider/provider.dart';

class Filterscreen extends StatefulWidget {
  const Filterscreen({super.key});

  @override
  State<Filterscreen> createState() => _FilterscreenState();
}

class _FilterscreenState extends State<Filterscreen> {
  String selectedFilter = "Both";
  String selectedFilterNavBar = "Reset Filters";
  bool _isExpanded = false;
  String? selectedItem;
  String selectBottamButton = "Reset Filters";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 10,
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white
          ),
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: _buildFilterButtonNavBar("Reset Filters",height: 55,width: double.infinity)),
              SizedBox(width: 10,),
              Expanded(child: _buildFilterButtonNavBar("Apply Filters",height: 55,width: double.infinity)),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
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
              SizedBox(height: 10),
              _buildFilterContent(),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildFilterButton(String filter,{double? height, double? width, double? borderRadius} ) {
    bool isSelected = selectedFilter == filter;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedFilter = filter; // Update UI when a tab is clicked
        });
      },
      child: Container(
        height: height,
        width: width,
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 8),
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

  Widget _buildFilterButtonNavBar(String filter,{double? height, double? width, double? borderRadius} ) {
    bool isSelected = selectedFilterNavBar == filter;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedFilterNavBar = filter; // Update UI when a tab is clicked
        });
      },
      child: Container(
        height: 60,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
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
        child: Center(
          child: Text(
            filter,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFilterContent(){
    if(selectedFilter == 'Both'){
      return Column(
        children: [
        _buildEntrepreneurSection(),
          SizedBox(height:  10,),
          _buildInvestorSection(),
        ],
      );
    }else if(selectedFilter == 'Entrepreneur'){
      return _buildEntrepreneurSection();
    }else if(selectedFilter == "Investor"){
      return _buildInvestorSection();
    }
    return Container();
  }

  Widget _buildEntrepreneurSection() {
    return Column(
      children: entrepreneurCategories.map((category) {
        return _buildExpansionTileEntrepreneur(
          title: category.categoryName,
          dataList: category.entrepreneurs,
        );
      }).toList(),
    );
  }

  Widget _buildInvestorSection() {
    return Column(
      children: investorCategories.map((category) {
        return _buildExpansionTileInvestor(
          title: category.categoryName,
          dataList: category.investors,
        );
      }).toList(),
    );
  }

  Widget _buildExpansionTileEntrepreneur({required String title, required List<dynamic> dataList}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: _isExpanded ? null : Border.all(color: Colors.transparent),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
        ),
        child: ExpansionTile(
          title: Text(title),
          onExpansionChanged: (bool expanded) {
            setState(() {
              _isExpanded = expanded;
            });
          },
          children: dataList.map((data) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EntrepreneurButtonWidget(text: data.software, onTap: () {
                  Provider.of<ExpansionTileState>(context, listen: false).updateSelectedItem(title, data.software);
                },
                  isSelected: Provider.of<ExpansionTileState>(context).getSelectedItem(title) == data.software),
                EntrepreneurButtonWidget(text: data.hardware, onTap: () {
                  Provider.of<ExpansionTileState>(context, listen: false).updateSelectedItem(title, data.hardware);
                },
                    isSelected: Provider.of<ExpansionTileState>(context).getSelectedItem(title) == data.hardware),
                EntrepreneurButtonWidget(text: data.ai, onTap: () {
                  Provider.of<ExpansionTileState>(context, listen: false).updateSelectedItem(title, data.ai);
                },

                    isSelected: Provider.of<ExpansionTileState>(context).getSelectedItem(title) == data.ai),
                 EntrepreneurButtonWidget(text: data.cyberSecurity, onTap: () {
            Provider.of<ExpansionTileState>(context, listen: false).updateSelectedItem(title, data.cyberSecurity);
            },
            isSelected: Provider.of<ExpansionTileState>(context).getSelectedItem(title) == data.cyberSecurity),
                EntrepreneurButtonWidget(text: data.lOT, onTap: () {
            Provider.of<ExpansionTileState>(context, listen: false).updateSelectedItem(title, data.lOT);
            },
            isSelected: Provider.of<ExpansionTileState>(context).getSelectedItem(title) == data.lOT),
                EntrepreneurButtonWidget(text: data.other, onTap: () {
                  Provider.of<ExpansionTileState>(context, listen: false).updateSelectedItem(title, data.other);
                },
                    isSelected: Provider.of<ExpansionTileState>(context).getSelectedItem(title) == data.other),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
  Widget _buildExpansionTileInvestor({required String title, required List<dynamic> dataList}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: _isExpanded ? null : Border.all(color: Colors.transparent),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
        ),
        child: ExpansionTile(
          title: Text(title),
          onExpansionChanged: (bool expanded) {
            setState(() {
              _isExpanded = expanded;
            });
          },
          children: dataList.map((data) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                alignment: WrapAlignment.start,
                spacing: 10.0,
                runSpacing: 10.0,
                children: [
                  InvestorButtonWidget(
                      text: data.software, onTap: () {
                    Provider.of<ExpansionTileState>(context, listen: false).updateSelectedItem(title, data.software);
                  },isSelected: Provider.of<ExpansionTileState>(context).getSelectedItem(title) == data.software),
                  InvestorButtonWidget(text: data.hardware, onTap: () {
                    Provider.of<ExpansionTileState>(context, listen: false).updateSelectedItem(title, data.hardware);
                  }, isSelected: Provider.of<ExpansionTileState>(context).getSelectedItem(title) == data.hardware),
                  InvestorButtonWidget(text: data.ai, onTap: () {
                    Provider.of<ExpansionTileState>(context, listen: false).updateSelectedItem(title, data.ai);
                  }, isSelected: Provider.of<ExpansionTileState>(context).getSelectedItem(title) == data.ai),
                  InvestorButtonWidget(text: data.cyberSecurity, onTap: () {
                    Provider.of<ExpansionTileState>(context, listen: false).updateSelectedItem(title, data.cyberSecurity);
                  }, isSelected: Provider.of<ExpansionTileState>(context).getSelectedItem(title) == data.cyberSecurity),
                  InvestorButtonWidget(text:data.lOT, onTap: () {
                    Provider.of<ExpansionTileState>(context, listen: false).updateSelectedItem(title, data.lOT);
                  }, isSelected: Provider.of<ExpansionTileState>(context).getSelectedItem(title) == data.lOT),
                  InvestorButtonWidget(text: data.other, onTap: () {
                    Provider.of<ExpansionTileState>(context, listen: false).updateSelectedItem(title, data.other);
                  }, isSelected: Provider.of<ExpansionTileState>(context).getSelectedItem(title) == data.other),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
