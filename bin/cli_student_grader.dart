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
