# CLI Student Grader — Step-by-Step Git Commit Guide

Follow these steps IN ORDER. Each step = one commit.

---

## ONE-TIME SETUP (do this first, only once)

```bash
# 1. Create the Dart project
dart create -t console cli_student_grader

# 2. Go into the project folder
cd cli_student_grader

# 3. Initialize git and link to your GitHub repo
git init
git remote add origin https://github.com/YOUR_USERNAME/cli-student-grader.git
```

---

## COMMIT 1 — feat: add menu loop and switch routing

**What to do:**
Replace everything inside `bin/cli_student_grader.dart` with the code from `commit1.dart`.

**What this code has:**
- `const` app title
- `final` subjects Set
- `do-while` menu loop
- `switch` routing (all options print "Coming soon")

**Git commands:**
```bash
git add bin/cli_student_grader.dart
git commit -m "feat: add menu loop and switch routing"
```

---

## COMMIT 2 — feat: add student creation with spread operator

**What to do:**
Replace the file with code from `commit2.dart`.

**What this adds:**
- `addStudent()` function
- `Map` student record
- Spread operator `{...availableSubjects}`
- Nullable `int?` and `String?` fields
- Case 1 now calls `addStudent()`

**Git commands:**
```bash
git add bin/cli_student_grader.dart
git commit -m "feat: add student creation with spread operator"
```

---

## COMMIT 3 — feat: record scores with validation loop

**What to do:**
Replace the file with code from `commit3.dart`.

**What this adds:**
- `recordScore()` function
- Indexed `for` loop (numbered student list)
- `while` loop for score validation (0–100)
- `List.add()` to store the score
- Case 2 now calls `recordScore()`

**Git commands:**
```bash
git add bin/cli_student_grader.dart
git commit -m "feat: record scores with validation loop"
```

---

## COMMIT 4 — feat: add bonus and comment with null-aware operators

**What to do:**
Replace the file with code from `commit4.dart`.

**What this adds:**
- `addBonusPoints()` — uses `??=` to only assign if null
- `addComment()` — uses `?.` and `??` for safe display
- `String?` nullable comment type
- Cases 3 and 4 now wired up

**Git commands:**
```bash
git add bin/cli_student_grader.dart
git commit -m "feat: add bonus and comment with null-aware operators"
```

---

## COMMIT 5 — feat: generate report card with grade calculation

**What to do:**
Replace the file with code from `commit5.dart`.

**What this adds:**
- `viewAllStudents()` — uses `for-in` loop and collection `if`
- `calculateAvg()` helper — arithmetic operators, `??` for bonus
- `viewReportCard()` — `if/else if/else` grade, `switch` expression feedback
- Multi-line string report card output
- Cases 5 and 6 now wired up

**Git commands:**
```bash
git add bin/cli_student_grader.dart
git commit -m "feat: generate report card with grade calculation"
```

---

## COMMIT 6 — feat: add class summary with collection for/if

**What to do:**
Replace the file with code from `commit6.dart`.
This is the FINAL complete file.

**What this adds:**
- `classSummary()` — logical operators `&&`, collection `for`, `Set` for unique grades
- Case 7 now wired up
- All 24 concepts covered ✅

**Git commands:**
```bash
git add bin/cli_student_grader.dart
git commit -m "feat: add class summary with collection for/if"
```

---

## PUSH TO GITHUB (do this at the end)

```bash
git push -u origin main
```

> If it says "main" doesn't exist, try: `git push -u origin master`

---

## HOW TO RUN THE APP

```bash
dart run
```

---

## CHECKLIST — All 24 Concepts

| # | Concept       | Where                              |
|---|---------------|------------------------------------|
| 1 | var           | students, choice, score            |
| 2 | final         | availableSubjects                  |
| 3 | const         | appTitle                           |
| 4 | int? / String?| bonus and comment fields           |
| 5 | ??            | null fallback everywhere           |
| 6 | ??=           | Bonus only assigned if null        |
| 7 | ?.            | comment?.toUpperCase()             |
| 8 | Arithmetic    | Average calculation                |
| 9 | Relational    | Grade thresholds, bounds checks    |
|10 | Logical &&    | Pass-count filter                  |
|11 | Interpolation | Every print statement              |
|12 | Multi-line    | Menu + Report Card                 |
|13 | if/else if    | Grade assignment                   |
|14 | switch        | Menu routing + feedback expression |
|15 | for (indexed) | Numbered student list              |
|16 | for-in        | View All Students                  |
|17 | while         | Score validation loop              |
|18 | do-while      | Main menu loop                     |
|19 | List          | Scores list                        |
|20 | Set           | Subjects + unique grades           |
|21 | Map           | Student record                     |
|22 | Collection if | Bonus tag in View All              |
|23 | Collection for| Summary lines                      |
|24 | Spread ...    | Copy subjects into new student     |
