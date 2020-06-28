class DummyData {
  final List<int> _yearOfStudy = [1, 2, 3, 4, 5];

  final List<String> _genders = ['Male', 'Female'];

  final Map<String, List<String>> _specialisations = {
    'Information Systems': [
      'None',
      'Fintech',
      'Digital Innovation',
      'Ecommerce',
    ],
    'Computer Science': [
      'None',
      'AI',
      'Machine Learning',
      'Game development',
    ],
    'Economics': [
      'None',
      'Macro',
      'Micro',
    ],
    'Communications and News Media': [
      'None',
      'Social Media',
      'Newspaper',
    ],
    'Environmental Engineering': [
      'None',
    ],
    'Chemical Engineering': [
      'None',
    ],
    'Data Science': [
      'None',
    ],
    'Mathematics': [
      'None',
    ],
    'Accountancy': [
      'None',
    ],
  };

  final Map<String, List<String>> _courses = {
    'Computing': ['Information Systems', 'Computer Science'],
    'FASS': ['Economics', 'Communications and News Media'],
    'Engineering': ['Environmental Engineering', 'Chemical Engineering'],
    'Science': ['Data Science', 'Mathematics'],
    'Business': ['Accountancy'],
  };

  final List<String> _months = [
    'Jan',
    'Feb',
    'March',
    'April',
    'May',
    'June',
    'July',
    'Aug',
    'Sept',
    'Oct',
    'Nov',
    'Dec'
  ];

  final List<String> _schools = [
    'NUS',
    'NTU',
    'SIM',
    'SMU',
    'SP',
    'TP',
    'RP',
  ];

  final Map<String, List<String>> _faculties = {
    'NUS': [
      'Computing',
      'FASS',
      'Engineering',
      'Science',
      'Business',
    ],
    'NTU': [
      'Computing',
      'FASS',
      'Engineering',
      'Science',
      'Business',
    ],
    'SIM': [
      'Computing',
      'FASS',
      'Engineering',
      'Science',
      'Business',
    ],
    'SMU': [
      'Computing',
      'FASS',
      'Engineering',
      'Science',
      'Business',
    ],
    'SP': [
      'Computing',
      'FASS',
      'Engineering',
      'Science',
      'Business',
    ],
    'TP': [
      'Computing',
      'FASS',
      'Engineering',
      'Science',
      'Business',
    ],
    'RP': [
      'Computing',
      'FASS',
    ],
  };

  final List<String> _industries = [
    'Technology',
    'News Media',
    'Education',
    'Human Resource',
    'Advertising',
    'Communications',
    'Construction',
    'Entertainment',
    'Fashion',
    'Finance',
    'Hospitality',
    'Infrastructure',
    'Manufacturing',
    'Music',
    'Retail',
    'Service',
  ];

  List<int> get yearOfStudy {
    return _yearOfStudy;
  }

  List<String> get genders {
    return _genders;
  }

  Map<String, List<String>> get specialisations {
    return _specialisations;
  }

  Map<String, List<String>> get courses {
    return _courses;
  }

  List<String> get months {
    return _months;
  }

  List<String> get schools {
    return _schools;
  }

  Map<String, List<String>> get faculties {
    return _faculties;
  }

  List<String> get industries {
    return _industries;
  }
}
