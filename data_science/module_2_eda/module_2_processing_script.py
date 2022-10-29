import pandas as pd


# Load data from the original dataset:
path = '' # insert local path to dataset
stud_model = pd.read_csv(path + 'stud_math.csv')

# Function to replace "" to None:
def replace_to_none(df, col):
    df[col] = df[col].apply(lambda x: None if (pd.isnull(x) or x.lower() == 'nan') else x)     
    
# Replace empty values to None in string variables:
str_col_list = ['school', 'gender', 'address', 'famsize', 'pstatus', 'mprof', 'fprof', 'reason', 'custodian', 'schoolsup', 
                'famsup', 'paid', 'activities', 'nursery', 'higher', 'internet', 'romantic']
for col in str_col_list:
    replace_to_none(stud_model, col)
    
# Group data, add new columns:
stud_model['gr_studytime'] = stud_model.studytime.apply(lambda x: 0 if x<3 else 1)
stud_model['gr_failures'] = stud_model.failures.apply(lambda x: 0 if x == 0 else 1)
stud_model['gr_health'] = stud_model.health.apply(lambda x: 0 if x < 3 else 1)
stud_model['dbl_absences'] = stud_model.absences.apply(lambda x: x+1 if x%2 == 1 else x)
                                                       
# Remove non-informative columns:
stud_model = stud_model[['age', 'address', 'medu', 'mprof', 'schoolsup', 'goout', 'score', 
                         'gr_studytime', 'gr_failures', 'gr_health', 'dbl_absences']]
         
# The model is completed:
print(stud_model.head(10))