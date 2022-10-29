import numpy as np
import pandas as pd


# Read dataset
path = '' # insert local path to dataset
data = pd.read_csv(path + 'movie_bd_v5.csv')

# Preprocessing start
answers = {} # create dictionary for answers

# Function to get film name and film id (imdb_id)
def get_title(row):
    return row.original_title.iloc[0] + ' (' + row.imdb_id.iloc[0] + ')'

# Function to get month name by date
def get_release_month(date):
    month = date[0:date.find('/')]
    if month == '1':
        return 'January'
    elif month == '2':
        return 'February'
    elif month == '3':
        return 'March'
    elif month == '4':
        return 'April'
    elif month == '5':
        return 'May'
    elif month == '6':
        return 'June'
    elif month == '7':
        return 'July'
    elif month == '8':
        return 'August'
    elif month == '9':
        return 'September'
    elif month == '10':
        return 'October'
    elif month == '11':
        return 'November'
    elif month == '12':
        return 'December'
    else:
        return 'ERROR'

# Function for creating datasets with splitted values by |
# Example: 1 row with value 'test1|test2' will be splitted to 2 rows with values: 'test1', 'test2'
# Dataset contains 2 columns: column 2 is imdb_id
def create_dataset_for_list_column(column):
    serie_column = data[column].str.split('|').explode()
    serie_id = data.imdb_id
    df_result = pd.DataFrame({column + '_split' : serie_column, 'imdb_id' : serie_id})
    return df_result

# Add column profit
data['profit'] = data.revenue - data.budget
# Add column release_month
data['release_month'] = data.release_date.apply(get_release_month)

data_cast = create_dataset_for_list_column('cast')
data_genres = create_dataset_for_list_column('genres')
data_director = create_dataset_for_list_column('director')
data_companies = create_dataset_for_list_column('production_companies')
# Preprocessing end

# Answers start
#1. Which movie on the list has the biggest budget?
max_budget = data[data.budget == data['budget'].max()]
answers['1'] = get_title(max_budget)

# 2. Which movie is the longest (in minutes)?
max_runtime = data[data.runtime == data.runtime.max()]
answers['2'] = get_title(max_runtime)

# 3. Which movie is the shortest (in minutes)?
min_runtime = data[data.runtime == data.runtime.min()]
answers['3'] = get_title(min_runtime)

# 4. What is the average length of films?
mean_runtime = data.runtime.mean()
answers['4'] = round(mean_runtime)

# 5. What is the median length of the films?
median_runtime = data.runtime.median()
answers['5'] = round(median_runtime)

# 6. Which movie is the most profitable?
# Hereinafter, "profit" refers to the difference between the revenue and the budget of the film. 
# In the dataset it is (profit = revenue - budget)
max_profit = data[data.profit == data.profit.max()]
answers['6'] = get_title(max_profit)

# 7. Which movie is the most unprofitable?
min_profit = data[data.profit == data.profit.min()]
answers['7'] = get_title(min_profit)

# 8. How many of the movies in the dataset were revenue above budget?
data_profit_cnt = data[data.profit > 0].imdb_id.count()
answers['8'] = data_profit_cnt

# 9. What was the highest grossing movie of 2008?
film_2008 = data[data.release_year == 2008]
max_profit_2008 = film_2008[film_2008.profit == film_2008.profit.max()]
answers['9'] = get_title(max_profit_2008)

# 10. The most unprofitable movie for the period from 2012 to 2014 (inclusive)?
film_2012_2014 = data.query('2012 <= release_year <= 2014')
min_profit_2012_2014 = film_2012_2014[film_2012_2014.profit == film_2012_2014.profit.min()]
answers['10'] = get_title(min_profit_2012_2014)

# 11. What movie genre is the most represented in the database?
dataframe = data_genres.merge(data, on="imdb_id", how="inner")
answers['11'] = dataframe.groupby(['genres_split']).imdb_id.count().sort_values(ascending=False).index[0]

# 11 Option 2
# 1. Created a list for genres
# 2. Taken the column genres, for each row performed the actions described on steps 3 and 4:
# 3. Converted the genres value to a '|' delimited list, removed duplicates from the list
# 4. Each value from the list is added to the general list of genres
# 5. The resulting large list is converted into a dictionary by the actions described in steps 6 and 7:
# 6. Using the zip function, created a tuple of 2 lists: a list of genres and a list of the number of films in this genre
# 7. Using the dict function, we convert the tuple into a dictionary. Duplicates are removed.
# 8. Got a dictionary, choosed the pair with the maximum value

genres_list_all_filmes = []

for genres_row in data.genres:
    genres_row_upd = [*set(genres_row.split('|'))]
    for genre in genres_row_upd:
        genres_list_all_filmes.append(genre)

# Created a dict from 2 lists: list of genres, list of count of films of genre
genres_unique = dict(zip(genres_list_all_filmes,[genres_list_all_filmes.count(i) for i in genres_list_all_filmes]))

max_val = max(genres_unique.values())
max_pair = {k:v for k, v in genres_unique.items() if v == max_val}
answers['11.1'] = list(max_pair)[0]

# 12. Movies of which genre become profitable most often?
# The genre with the largest number of films with profit > 0
dataframe = data_genres.merge(data, on="imdb_id", how="inner")
answers['12'] =  dataframe[dataframe.profit > 0].groupby(['genres_split']).imdb_id.count().sort_values(ascending=False).index[0]

# 13. Which director has the highest total revenue?
answers['13'] = data.groupby('director')['revenue'].sum().sort_values(ascending=False).index[0]

# 14. Which director has created the biggest number of Action films?
genres_director_action_dict = {} # dictionary with pairs {director : number of Action films}
dataframe_prep = data_genres.merge(data_director, on="imdb_id", how="outer")
dataframe = dataframe_prep.merge(data, on="imdb_id", how="inner")
res_prep = dataframe[dataframe.genres_split == 'Action'].groupby(['director_split']).genres_split.count()
answers['14'] = res_prep.sort_values(ascending=False).index[0]

# 15. Which actor's films were the highest grossing in 2012?
dataframe = data_cast.merge(data, on="imdb_id", how="inner")
res_prep = dataframe.query('release_year == 2012').groupby(['cast_split']).revenue.sum()
answers['15'] = res_prep.sort_values(ascending=False).index[0]

# 16. Which actor has starred in the highest number of high budget films?
# Films with a budget above average are taken
dataframe = data_cast.merge(data, on="imdb_id", how="inner")
res_prep = dataframe[dataframe.budget > dataframe.budget.mean()].groupby(['cast_split']).imdb_id.count()
answers['16'] = res_prep.sort_values(ascending=False).index[0]

# 17. In what genre of films did Nicolas Cage most often star?
dataframe_prep = data_genres.merge(data_cast, on="imdb_id", how="outer")
dataframe = dataframe_prep.merge(data, on="imdb_id", how="inner")
res_prep = dataframe.query('cast_split == "Nicolas Cage"').groupby(['genres_split']).imdb_id.count()
answers['17'] = res_prep.sort_values(ascending=False).index[0]

# 18. The least profitable movie of Paramount Pictures?
dataframe = data_companies.merge(data, on="imdb_id", how="inner")
paramount = dataframe[dataframe.production_companies_split == 'Paramount Pictures']
res = paramount[paramount.profit == paramount.profit.min()]
answers['18'] = get_title(res)

# 19. What year was the most successful in terms of total revenue?
answers['19'] = data.groupby(['release_year']).revenue.sum().sort_values(ascending=False).index[0]

# 20. What is the most profitable year for Warner Bros?
dataframe = data_companies.merge(data, on="imdb_id", how="inner")
warnerbros = dataframe[dataframe.production_companies_split.str.contains('Warner Bros')]
answers['20'] = warnerbros.groupby(['release_year']).profit.sum().sort_values(ascending=False).index[0]

# 21. Of all the years summarily, which month was the most fruitful in terms of movie release?
answers['21'] = data.groupby(['release_month']).imdb_id.count().sort_values(ascending=False).index[0]

# 22. How many films were released in total in the summer? (for June, July, August)
answers['22'] = data.query('release_month in ("June","July","August")').imdb_id.count()

# 23. For which director is winter the most productive season?
# Director who released the most films in winter
dataframe = data_director.merge(data, on="imdb_id", how="inner")
res_prep = dataframe.query('release_month in ("December","January","February")').groupby(['director_split']).imdb_id.count()
answers['23'] = res_prep.sort_values(ascending=False).index[0]

# How many directors have released more films in winter than at other times of the year?
# Pivot table: number of films for each director released in each month
dir_mnth_df = dataframe.pivot_table(
columns='release_month',
index='director_split',
values='imdb_id',
aggfunc='count',
fill_value=0
)

# Let's calculate how many directors have more films released in winter than in any other season
dir_mnth_df_s = pd.DataFrame()
dir_mnth_df_s['Winter'] = dir_mnth_df.December + dir_mnth_df.January + dir_mnth_df.February
dir_mnth_df_s['Spring'] = dir_mnth_df.March + dir_mnth_df.April + dir_mnth_df.May
dir_mnth_df_s['Summer'] = dir_mnth_df.June + dir_mnth_df.July + dir_mnth_df.August
dir_mnth_df_s['Autumn'] = dir_mnth_df.September + dir_mnth_df.October + dir_mnth_df.November
answers['23.1'] = dir_mnth_df_s.query('(Winter > Spring) & (Winter > Summer) & (Winter > Autumn)').Winter.count()

# 24. Which studio gives the longest titles to their movies by character count?
dataframe = data_companies.merge(data, on='imdb_id', how='inner')
dataframe['mean_cnt_title'] = dataframe.original_title.str.len()
result = dataframe.groupby(['production_companies_split']).mean_cnt_title.mean()
answers['24'] = result.sort_values(ascending=False).index[0]

# 25. Which studio's film descriptions have the longest average word count?
dataframe = data_companies.merge(data, on='imdb_id', how='inner')
dataframe['mean_cnt_overview'] = dataframe.overview.str.len()
result = dataframe.groupby(['production_companies_split']).mean_cnt_overview.mean()
answers['25'] = result.sort_values(ascending=False).index[0]

# 26. What films are in the top 0.1 percent by vote average?
qnt999 = data.vote_average.quantile(0.999)
answers['26'] = data[data.vote_average >= qnt999].original_title.tolist()

# 27. Which actors most often star in the same movie together?
df = data_cast.merge(data_cast, on='imdb_id', how='outer')
df = df[df.cast_split_x != df.cast_split_y]
df['pair'] = df.apply(lambda x: min(x.cast_split_x,x.cast_split_y) + ' & ' + max(x.cast_split_x,x.cast_split_y), axis=1)
groupped = pd.DataFrame(df.groupby(['pair']).pair.count().sort_values(ascending=False))
answers['27'] = groupped[groupped.pair == groupped.pair.max()].pair.index.tolist()

# Submission
# See all the answers to the questions
print(answers)

# Answers end