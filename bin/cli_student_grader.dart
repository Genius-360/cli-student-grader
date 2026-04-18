import 'dart:io';

// 3. const – App title
const String appTitle = 'Student Grader v1.0';

// 2. final + 20. Set – Available subjects
final Set<String> availableSubjects = {'Math', 'English', 'Science', 'History'};

void main() {
  // 1. var – Mutable student list
  var students = <Map<String, dynamic>>[];

  var choice = ''; // loop control

  // 18. do-while – Runs at least once, stops on Exit
  do {
    // 12. Multi-line string + 11. String interpolation
    print('''
===== $appTitle =====

1. Add Student
2. Record Score
3. Add Bonus Points
4. Add Comment
5. View All Students
6. View Report Card
7. Class Summary
8. Exit

Choose an option:''');

    choice = stdin.readLineSync() ?? ''; // 5. ??

    // 14. switch – Route each option
    switch (choice) {
      case '1':
        print('Coming soon: Add Student');
        break;
      case '2':
        print('Coming soon: Record Score');
        break;
      case '3':
        print('Coming soon: Add Bonus Points');
        break;
      case '4':
        print('Coming soon: Add Comment');
        break;
      case '5':
        print('Coming soon: View All Students');
        break;
      case '6':
        print('Coming soon: View Report Card');
        break;
      case '7':
        print('Coming soon: Class Summary');
        break;
      case '8':
        print('Goodbye! See you next time.');
        break;
      default:
        print('Invalid option. Please choose 1–8.');
    }
  } while (choice != '8');
}

import 'dart:io';

const String appTitle = 'Student Grader v1.0';
final Set<String> availableSubjects = {'Math', 'English', 'Science', 'History'};

void main() {
  var students = <Map<String, dynamic>>[];
  var choice = '';

  do {
    print('''
===== $appTitle =====

1. Add Student
2. Record Score
3. Add Bonus Points
4. Add Comment
5. View All Students
6. View Report Card
7. Class Summary
8. Exit

Choose an option:''');

    choice = stdin.readLineSync() ?? '';

    switch (choice) {
      case '1':
        addStudent(students); // ← now wired up
        break;
      case '2':
        print('Coming soon: Record Score');
        break;
      case '3':
        print('Coming soon: Add Bonus Points');
        break;
      case '4':
        print('Coming soon: Add Comment');
        break;
      case '5':
        print('Coming soon: View All Students');
        break;
      case '6':
        print('Coming soon: View Report Card');
        break;
      case '7':
        print('Coming soon: Class Summary');
        break;
      case '8':
        print('Goodbye! See you next time.');
        break;
      default:
        print('Invalid option. Please choose 1–8.');
    }
  } while (choice != '8');
}

// ── OPTION 1: Add Student ──────────────────────────
void addStudent(List<Map<String, dynamic>> students) {
  print('\nEnter student name:');
  var name = stdin.readLineSync() ?? '';

  // 13. if/else – input check
  if (name.isEmpty) {
    print('Name cannot be empty.');
    return;
  }

  // 21. Map – student record
  // 24. Spread operator – copy subjects set
  // 4. int? / String? – nullable fields
  var student = <String, dynamic>{
    'name': name,
    'scores': <int>[],               // 19. List
    'subjects': {...availableSubjects}, // 20. Set + 24. Spread
    'bonus': null,                   // int?
    'comment': null,                 // String?
  };

  students.add(student);

  // 11. String interpolation
  print('✅ Student "$name" has been added!');
}

import 'dart:io';

const String appTitle = 'Student Grader v1.0';
final Set<String> availableSubjects = {'Math', 'English', 'Science', 'History'};

void main() {
  var students = <Map<String, dynamic>>[];
  var choice = '';

  do {
    print('''
===== $appTitle =====

1. Add Student
2. Record Score
3. Add Bonus Points
4. Add Comment
5. View All Students
6. View Report Card
7. Class Summary
8. Exit

Choose an option:''');

    choice = stdin.readLineSync() ?? '';

    switch (choice) {
      case '1':
        addStudent(students);
        break;
      case '2':
        recordScore(students); // ← now wired up
        break;
      case '3':
        print('Coming soon: Add Bonus Points');
        break;
      case '4':
        print('Coming soon: Add Comment');
        break;
      case '5':
        print('Coming soon: View All Students');
        break;
      case '6':
        print('Coming soon: View Report Card');
        break;
      case '7':
        print('Coming soon: Class Summary');
        break;
      case '8':
        print('Goodbye! See you next time.');
        break;
      default:
        print('Invalid option. Please choose 1–8.');
    }
  } while (choice != '8');
}

// ── OPTION 1: Add Student ──────────────────────────
void addStudent(List<Map<String, dynamic>> students) {
  print('\nEnter student name:');
  var name = stdin.readLineSync() ?? '';

  if (name.isEmpty) {
    print('Name cannot be empty.');
    return;
  }

  var student = <String, dynamic>{
    'name': name,
    'scores': <int>[],
    'subjects': {...availableSubjects},
    'bonus': null,
    'comment': null,
  };

  students.add(student);
  print('✅ Student "$name" has been added!');
}

// ── OPTION 2: Record Score ─────────────────────────
void recordScore(List<Map<String, dynamic>> students) {
  if (students.isEmpty) {
    print('No students yet. Add a student first.');
    return;
  }

  print('\nSelect a student:');

  // 15. for loop (indexed) – numbered list
  for (int i = 0; i < students.length; i++) {
    print('${i + 1}. ${students[i]["name"]}');
  }

  print('Enter student number:');
  var input = stdin.readLineSync() ?? '';
  var index = int.tryParse(input);

  // 9. Relational operators – bounds check
  if (index == null || index < 1 || index > students.length) {
    print('Invalid selection.');
    return;
  }

  var student = students[index - 1];

  print('Available subjects: ${student["subjects"]}');
  print('Enter subject name:');
  stdin.readLineSync();

  var score = -1;

  // 17. while loop – re-prompt until score is valid (0–100)
  while (score < 0 || score > 100) {
    print('Enter score (0–100):');
    var scoreInput = stdin.readLineSync() ?? '';
    score = int.tryParse(scoreInput) ?? -1; // 5. ??

    if (score < 0 || score > 100) {
      print('❌ Score must be between 0 and 100. Try again.');
    }
  }

  // 19. List .add()
  (student['scores'] as List<int>).add(score);
  print('✅ Score $score recorded for ${student["name"]}!');
}

import 'dart:io';

const String appTitle = 'Student Grader v1.0';
final Set<String> availableSubjects = {'Math', 'English', 'Science', 'History'};

void main() {
  var students = <Map<String, dynamic>>[];
  var choice = '';

  do {
    print('''
===== $appTitle =====

1. Add Student
2. Record Score
3. Add Bonus Points
4. Add Comment
5. View All Students
6. View Report Card
7. Class Summary
8. Exit

Choose an option:''');

    choice = stdin.readLineSync() ?? '';

    switch (choice) {
      case '1':
        addStudent(students);
        break;
      case '2':
        recordScore(students);
        break;
      case '3':
        addBonusPoints(students); // ← now wired up
        break;
      case '4':
        addComment(students);     // ← now wired up
        break;
      case '5':
        print('Coming soon: View All Students');
        break;
      case '6':
        print('Coming soon: View Report Card');
        break;
      case '7':
        print('Coming soon: Class Summary');
        break;
      case '8':
        print('Goodbye! See you next time.');
        break;
      default:
        print('Invalid option. Please choose 1–8.');
    }
  } while (choice != '8');
}

// ── OPTION 1: Add Student ──────────────────────────
void addStudent(List<Map<String, dynamic>> students) {
  print('\nEnter student name:');
  var name = stdin.readLineSync() ?? '';

  if (name.isEmpty) {
    print('Name cannot be empty.');
    return;
  }

  var student = <String, dynamic>{
    'name': name,
    'scores': <int>[],
    'subjects': {...availableSubjects},
    'bonus': null,
    'comment': null,
  };

  students.add(student);
  print('✅ Student "$name" has been added!');
}

// ── OPTION 2: Record Score ─────────────────────────
void recordScore(List<Map<String, dynamic>> students) {
  if (students.isEmpty) {
    print('No students yet. Add a student first.');
    return;
  }

  print('\nSelect a student:');
  for (int i = 0; i < students.length; i++) {
    print('${i + 1}. ${students[i]["name"]}');
  }

  print('Enter student number:');
  var input = stdin.readLineSync() ?? '';
  var index = int.tryParse(input);

  if (index == null || index < 1 || index > students.length) {
    print('Invalid selection.');
    return;
  }

  var student = students[index - 1];

  print('Available subjects: ${student["subjects"]}');
  print('Enter subject name:');
  stdin.readLineSync();

  var score = -1;
  while (score < 0 || score > 100) {
    print('Enter score (0–100):');
    var scoreInput = stdin.readLineSync() ?? '';
    score = int.tryParse(scoreInput) ?? -1;

    if (score < 0 || score > 100) {
      print('❌ Score must be between 0 and 100. Try again.');
    }
  }

  (student['scores'] as List<int>).add(score);
  print('✅ Score $score recorded for ${student["name"]}!');
}

// ── OPTION 3: Add Bonus Points ─────────────────────
void addBonusPoints(List<Map<String, dynamic>> students) {
  if (students.isEmpty) {
    print('No students yet. Add a student first.');
    return;
  }

  print('\nSelect a student:');
  for (int i = 0; i < students.length; i++) {
    print('${i + 1}. ${students[i]["name"]}');
  }

  print('Enter student number:');
  var input = stdin.readLineSync() ?? '';
  var index = int.tryParse(input);

  if (index == null || index < 1 || index > students.length) {
    print('Invalid selection.');
    return;
  }

  var student = students[index - 1];

  print('Enter bonus points (1–10):');
  var bonusInput = stdin.readLineSync() ?? '';
  var bonusValue = int.tryParse(bonusInput);

  if (bonusValue == null || bonusValue < 1 || bonusValue > 10) {
    print('Invalid bonus. Must be 1–10.');
    return;
  }

  // 13. if/else – check if bonus already set
  if (student['bonus'] != null) {
    print('⚠️  Bonus already set to ${student["bonus"]} for ${student["name"]}. Cannot overwrite.');
  } else {
    // 6. ??= – only assigns if bonus is currently null
    student['bonus'] ??= bonusValue;
    print('✅ Bonus of $bonusValue points added to ${student["name"]}!');
  }
}

// ── OPTION 4: Add Comment ──────────────────────────
void addComment(List<Map<String, dynamic>> students) {
  if (students.isEmpty) {
    print('No students yet. Add a student first.');
    return;
  }

  print('\nSelect a student:');
  for (int i = 0; i < students.length; i++) {
    print('${i + 1}. ${students[i]["name"]}');
  }

  print('Enter student number:');
  var input = stdin.readLineSync() ?? '';
  var index = int.tryParse(input);

  if (index == null || index < 1 || index > students.length) {
    print('Invalid selection.');
    return;
  }

  var student = students[index - 1];

  print('Enter comment:');
  // 4. String? – nullable comment
  String? comment = stdin.readLineSync();
  student['comment'] = comment;

  // 7. ?. (null-aware access) + 5. ?? (null fallback)
  String display =
      (student['comment'] as String?)?.toUpperCase() ?? 'No comment provided';

  print('✅ Comment saved. Preview: $display');
}
