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
        addBonusPoints(students);
        break;
      case '4':
        addComment(students);
        break;
      case '5':
        viewAllStudents(students); // ← now wired up
        break;
      case '6':
        viewReportCard(students);  // ← now wired up
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

  if (student['bonus'] != null) {
    print('⚠️  Bonus already set to ${student["bonus"]} for ${student["name"]}. Cannot overwrite.');
  } else {
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
  String? comment = stdin.readLineSync();
  student['comment'] = comment;

  String display =
      (student['comment'] as String?)?.toUpperCase() ?? 'No comment provided';

  print('✅ Comment saved. Preview: $display');
}

// ── OPTION 5: View All Students ───────────────────
void viewAllStudents(List<Map<String, dynamic>> students) {
  if (students.isEmpty) {
    print('No students yet. Add a student first.');
    return;
  }

  print('\n===== ALL STUDENTS =====');

  // 16. for-in loop – iterate over all students
  for (var student in students) {
    var scores = student['scores'] as List<int>;

    // 22. Collection if – conditionally add bonus tag
    var tags = [
      '${student["name"]}',
      '${scores.length} score(s)',
      if (student['bonus'] != null) '⭐ Has Bonus',
    ];

    print('→ ${tags.join(" | ")}');
  }

  print('========================\n');
}

// ── HELPER: Calculate average ──────────────────────
double calculateAvg(Map<String, dynamic> student) {
  var scores = student['scores'] as List<int>;
  if (scores.isEmpty) return 0.0;

  // 8. Arithmetic operators – sum then divide
  var sum = 0;
  for (var s in scores) {
    sum += s;
  }

  var rawAvg = sum / scores.length;

  // 5. ?? – use 0 if bonus is null
  var finalAvg = rawAvg + (student['bonus'] ?? 0);

  // 9. Relational – cap at 100
  if (finalAvg > 100) finalAvg = 100;

  return finalAvg;
}

// ── OPTION 6: View Report Card ────────────────────
void viewReportCard(List<Map<String, dynamic>> students) {
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
  var scores = student['scores'] as List<int>;
  var finalAvg = calculateAvg(student);

  // 13. if / else if / else + 9. Relational – grade assignment
  String grade;
  if (finalAvg >= 90) {
    grade = 'A';
  } else if (finalAvg >= 80) {
    grade = 'B';
  } else if (finalAvg >= 70) {
    grade = 'C';
  } else if (finalAvg >= 60) {
    grade = 'D';
  } else {
    grade = 'F';
  }

  // 14. switch expression – feedback line with pattern matching
  String feedback = switch (grade) {
    'A' => 'Outstanding performance!',
    'B' => 'Good work, keep it up!',
    'C' => 'Satisfactory. Room to improve.',
    'D' => 'Needs improvement.',
    'F' => 'Failing. Please seek help.',
    _   => 'Unknown grade.',
  };

  // 7. ?. + 5. ?? – safe comment display
  String comment =
      (student['comment'] as String?)?.toUpperCase() ?? 'No comment provided';

  var bonusDisplay = student['bonus'] != null ? '+${student["bonus"]}' : 'None';

  // 12. Multi-line string + 11. String interpolation – report card output
  print('''
+--------------------------------+
|          REPORT CARD           |
+--------------------------------+
| Name:    ${student["name"].toString().padRight(21)}|
| Scores:  ${scores.toString().padRight(21)}|
| Bonus:   ${bonusDisplay.padRight(21)}|
| Average: ${finalAvg.toStringAsFixed(1).padRight(21)}|
| Grade:   ${grade.padRight(21)}|
| Comment: ${comment.padRight(21)}|
+--------------------------------+
📝 Feedback: $feedback
''');
}

import 'dart:io';

// 3. const – App title constant
const String appTitle = 'Student Grader v1.0';

// 2. final + 20. Set – Available subjects (read-only)
final Set<String> availableSubjects = {'Math', 'English', 'Science', 'History'};

void main() {
  // 1. var + 19. List – Mutable student list
  var students = <Map<String, dynamic>>[];
  var choice = '';

  // 18. do-while – Main menu loop
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

    // 14. switch – Route each option to its handler
    switch (choice) {
      case '1':
        addStudent(students);
        break;
      case '2':
        recordScore(students);
        break;
      case '3':
        addBonusPoints(students);
        break;
      case '4':
        addComment(students);
        break;
      case '5':
        viewAllStudents(students);
        break;
      case '6':
        viewReportCard(students);
        break;
      case '7':
        classSummary(students); // ← now wired up
        break;
      case '8':
        print('Goodbye! See you next time.');
        break;
      default:
        print('Invalid option. Please choose 1–8.');
    }
  } while (choice != '8');
}

// ════════════════════════════════════════
// OPTION 1 – Add Student
// ════════════════════════════════════════
void addStudent(List<Map<String, dynamic>> students) {
  print('\nEnter student name:');
  var name = stdin.readLineSync() ?? '';

  // 13. if/else – input check
  if (name.isEmpty) {
    print('Name cannot be empty.');
    return;
  }

  // 21. Map + 24. Spread operator + 4. int? / String?
  var student = <String, dynamic>{
    'name': name,
    'scores': <int>[],               // 19. List
    'subjects': {...availableSubjects}, // 20. Set + 24. Spread
    'bonus': null,                   // int?
    'comment': null,                 // String?
  };

  students.add(student);
  print('✅ Student "$name" has been added!'); // 11. String interpolation
}

// ════════════════════════════════════════
// OPTION 2 – Record Score
// ════════════════════════════════════════
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

  (student['scores'] as List<int>).add(score); // 19. List .add()
  print('✅ Score $score recorded for ${student["name"]}!');
}

// ════════════════════════════════════════
// OPTION 3 – Add Bonus Points
// ════════════════════════════════════════
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
    student['bonus'] ??= bonusValue; // 6. ??= – only assigns if null
    print('✅ Bonus of $bonusValue points added to ${student["name"]}!');
  }
}

// ════════════════════════════════════════
// OPTION 4 – Add Comment
// ════════════════════════════════════════
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
  String? comment = stdin.readLineSync(); // 4. String?
  student['comment'] = comment;

  // 7. ?. (null-aware access) + 5. ?? (null fallback)
  String display =
      (student['comment'] as String?)?.toUpperCase() ?? 'No comment provided';

  print('✅ Comment saved. Preview: $display');
}

// ════════════════════════════════════════
// OPTION 5 – View All Students
// ════════════════════════════════════════
void viewAllStudents(List<Map<String, dynamic>> students) {
  if (students.isEmpty) {
    print('No students yet. Add a student first.');
    return;
  }

  print('\n===== ALL STUDENTS =====');

  // 16. for-in loop – iterate over all students
  for (var student in students) {
    var scores = student['scores'] as List<int>;

    // 22. Collection if – conditionally include bonus tag
    var tags = [
      '${student["name"]}',
      '${scores.length} score(s)',
      if (student['bonus'] != null) '⭐ Has Bonus',
    ];

    print('→ ${tags.join(" | ")}');
  }

  print('========================\n');
}

// ════════════════════════════════════════
// HELPER – Calculate average
// ════════════════════════════════════════
double calculateAvg(Map<String, dynamic> student) {
  var scores = student['scores'] as List<int>;
  if (scores.isEmpty) return 0.0;

  // 8. Arithmetic operators – sum then divide
  var sum = 0;
  for (var s in scores) {
    sum += s;
  }
  var rawAvg = sum / scores.length;

  // 5. ?? – use 0 if bonus is null
  var finalAvg = rawAvg + (student['bonus'] ?? 0);

  if (finalAvg > 100) finalAvg = 100; // 9. Relational – cap at 100

  return finalAvg;
}

// ════════════════════════════════════════
// OPTION 6 – View Report Card
// ════════════════════════════════════════
void viewReportCard(List<Map<String, dynamic>> students) {
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
  var scores = student['scores'] as List<int>;
  var finalAvg = calculateAvg(student);

  // 13. if / else if / else + 9. Relational – grade assignment
  String grade;
  if (finalAvg >= 90) {
    grade = 'A';
  } else if (finalAvg >= 80) {
    grade = 'B';
  } else if (finalAvg >= 70) {
    grade = 'C';
  } else if (finalAvg >= 60) {
    grade = 'D';
  } else {
    grade = 'F';
  }

  // 14. switch expression – feedback with pattern matching
  String feedback = switch (grade) {
    'A' => 'Outstanding performance!',
    'B' => 'Good work, keep it up!',
    'C' => 'Satisfactory. Room to improve.',
    'D' => 'Needs improvement.',
    'F' => 'Failing. Please seek help.',
    _   => 'Unknown grade.',
  };

  // 7. ?. + 5. ?? – safe comment display
  String comment =
      (student['comment'] as String?)?.toUpperCase() ?? 'No comment provided';

  var bonusDisplay = student['bonus'] != null ? '+${student["bonus"]}' : 'None';

  // 12. Multi-line string + 11. String interpolation
  print('''
+--------------------------------+
|          REPORT CARD           |
+--------------------------------+
| Name:    ${student["name"].toString().padRight(21)}|
| Scores:  ${scores.toString().padRight(21)}|
| Bonus:   ${bonusDisplay.padRight(21)}|
| Average: ${finalAvg.toStringAsFixed(1).padRight(21)}|
| Grade:   ${grade.padRight(21)}|
| Comment: ${comment.padRight(21)}|
+--------------------------------+
📝 Feedback: $feedback
''');
}

// ════════════════════════════════════════
// OPTION 7 – Class Summary
// ════════════════════════════════════════
void classSummary(List<Map<String, dynamic>> students) {
  if (students.isEmpty) {
    print('No students yet. Add a student first.');
    return;
  }

  var totalStudents = students.length;
  var totalAvg = 0.0;
  var highestAvg = 0.0;
  var lowestAvg = 101.0;
  var passCount = 0;

  // 20. Set – unique grade letters across the class
  var gradeSet = <String>{};

  for (var student in students) {
    var scores = student['scores'] as List<int>;
    var avg = calculateAvg(student);

    totalAvg += avg;

    if (avg > highestAvg) highestAvg = avg; // 9. Relational
    if (avg < lowestAvg) lowestAvg = avg;

    // 10. Logical operators (&&) – count passing students with scores
    if (scores.isNotEmpty && avg >= 60) {
      passCount++;
    }

    // Grade letter for set
    String grade;
    if (avg >= 90) {
      grade = 'A';
    } else if (avg >= 80) {
      grade = 'B';
    } else if (avg >= 70) {
      grade = 'C';
    } else if (avg >= 60) {
      grade = 'D';
    } else {
      grade = 'F';
    }

    gradeSet.add(grade); // 20. Set – only stores unique values
  }

  var classAvg = totalAvg / totalStudents; // 8. Arithmetic

  // 23. Collection for – build summary lines list
  var summaryLines = [
    for (var s in students)
      '${s["name"]}: ${calculateAvg(s).toStringAsFixed(1)} avg',
  ];

  // 12. Multi-line string + 11. String interpolation
  print('''
===== CLASS SUMMARY =====
Total Students  : $totalStudents
Class Average   : ${classAvg.toStringAsFixed(1)}
Highest Average : ${highestAvg.toStringAsFixed(1)}
Lowest Average  : ${lowestAvg.toStringAsFixed(1)}
Passing Students: $passCount
Grade Letters   : $gradeSet
=========================''');

  print('\nStudent Breakdown:');
  for (var line in summaryLines) {
    print('  • $line');
  }
  print('');
}
