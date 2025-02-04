class Entrepreneur{
  String software;
  String hardware;
  String ai;
  String cyberSecurity;
  String lOT;
  String other;

  Entrepreneur({
    required this.software,
    required this.hardware,
    required this.ai,
    required this.cyberSecurity,
    required this.lOT,
    required this.other
});
}

class Investor{
  String software;
  String hardware;
  String ai;
  String cyberSecurity;
  String lOT;
  String other;

  Investor({
    required this.software,
    required this.hardware,
    required this.ai,
    required this.cyberSecurity,
    required this.lOT,
    required this.other
  });
}


class EntrepreneurCategory {
  String categoryName;
  List<Entrepreneur> entrepreneurs;

  EntrepreneurCategory({
    required this.categoryName,
    required this.entrepreneurs,
  });
}

class InvestorCategory {
  String categoryName;
  List<Investor> investors;

  InvestorCategory({
    required this.categoryName,
    required this.investors,
  });
}

List<EntrepreneurCategory> entrepreneurCategories = [
  EntrepreneurCategory(
    categoryName: 'Tech Entrepreneur',
    entrepreneurs: [
      Entrepreneur(
          software: 'Software development',
          hardware: 'Hardware innovation',
          ai: 'Artificial Intelligence',
          cyberSecurity: 'Cyber Security',
          lOT: 'Internet of Things (IoT)',
          other: 'Other'
      ),
    ],
  ),
  EntrepreneurCategory(
    categoryName: 'Biotech Entrepreneur',
    entrepreneurs: [
      Entrepreneur(
          software: 'Food Delivery Apps',
          hardware: 'Smart Kitchen Devices',
          ai: 'AI-based Food Recommendations',
          cyberSecurity: 'Data Protection in Food Tech',
          lOT: 'IoT in Smart Restaurants',
          other: 'Other'
      ),
    ],
  ),
  EntrepreneurCategory(
    categoryName: 'Food Entrepreneur',
    entrepreneurs: [
      Entrepreneur(
          software: 'Food Delivery Apps',
          hardware: 'Smart Kitchen Devices',
          ai: 'AI-based Food Recommendations',
          cyberSecurity: 'Data Protection in Food Tech',
          lOT: 'IoT in Smart Restaurants',
          other: 'Other'
      ),
    ],
  ),
];

List<InvestorCategory> investorCategories = [
  InvestorCategory(
    categoryName: 'Tech Investor',
    investors: [
      Investor(
          software: 'Software Startups',
          hardware: 'Hardware Ventures',
          ai: 'AI Investments',
          cyberSecurity: 'Cyber Security Startups',
          lOT: 'IoT Ventures',
          other: 'Other'
      ),
    ],
  ),
  InvestorCategory(
    categoryName: 'Real Estate Investor',
    investors: [
      Investor(
          software: 'Property Management Software',
          hardware: 'Construction Innovations',
          ai: 'AI in Real Estate Pricing',
          cyberSecurity: 'Security in Smart Homes',
          lOT: 'IoT in Smart Buildings',
          other: 'Other'
      ),
    ],
  ),
];
