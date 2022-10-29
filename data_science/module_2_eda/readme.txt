EDA - exploratory data analysis

Task Description

You have been invited to participate in one of the projects of UNICEF, the international arm of the United Nations whose mission is to improve the well-being of children around the world. 
The essence of the project is to track the impact of the living conditions of students aged 15 to 22 on their performance in mathematics in order to identify students at risk at an early stage.
This can be done using a model that would predict the results of the state exam in mathematics for each student in the school. To determine the parameters of the future model, perform the exploratory data analysis and compile a report on its results.

Dataset for EDA: stud_math.csv

Let's look at the columns that the dataset contains:
1. school — abbreviation of the school in which the student studies
2. gender — student gender ('F' - female, 'M' - male)
3. age - the age of the student (from 15 to 22)
4. address — student's address type ('U' - urban, 'R' - out of town)
5. famsize — family size('LE3' <= 3, 'GT3' >3)
6. pstatus - residence status of parents ('T' - living together 'A' - separated)
7. medu - mother's education (0 - no, 1 - 4 grades, 2 - 5-9 grades, 3 - secondary special or 11 grades, 4 - higher)
8. fedu - father's education (0 - no, 1 - 4th grade, 2 - 5-9 grades, 3 - secondary special or 11 grades, 4 - higher)
9. mprof — mother's profession ('teacher' - teacher, 'health' - healthcare, 'services' - civil service, 'at_home' - not working, 'other' - other)
10. fprof — father's profession ('teacher' - teacher, 'health' - healthcare, 'services' - civil service, 'at_home' - not working, 'other' - other)
11. reason — the reason for choosing the school ('home' - proximity to home, 'reputation' - reputation of the school, 'course' - educational program, 'other' - other)
12. custodian - custodian ('mother' - mother, 'father' - father, 'other' - other)
13. traveltime - travel time to school (1 - <15 min., 2 - 15-30 min., 3 - 30-60 min., 4 - >60 min.)
14. studytime - the amount of time spent on extracurricular lessons (1 - <2 hours, 2 - 2-5 hours, 3 - 5-10 hours, 4 - >10 hours)
15. failures — number of extracurricular failures (n if 1<=n<=3, otherwise 0)
16. schoolsup - additional educational support (yes or no)
17. famsup - family educational support (yes or no)
18. paid - additional paid math classes (yes or no)
19. activities - additional extracurricular activities (yes or no)
20. nursery - attended kindergarten (yes or no)
21. higher - wants to get a higher education (yes or no)
22. internet - the presence of the Internet at home (yes or no)
23. romantic - in a romantic relationship (yes or no)
24. famrel - family relationships (from 1 - very bad to 5 - very good)
25. freetime - the amount of free time remaining after the lessons at school (from 1 - very little to 5 - very much)
26. goout - the amount of time spent with friends (from 1 - very little to 5 - a lot)
27. health - current health status (from 1 - very bad to 5 - very good)
28. absences - the number of missed classes
29. score - scores for the state exam in mathematics


Files Created

module_2.ipynb - jupiter notebook format, analysis of dataset, data processing
module_2_processing_script.py - python format, single script for data processing
stud_math.csv - initial dataset
