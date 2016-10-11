# -*- coding: utf-8 -*-
import pandas as pd
import numpy as np

path = '/Users/andyprata/Documents/phd/python/katharine/'
fn = 'rawLocoPoco.csv'

# read raw csv data as a DataFrame
df = pd.read_csv(path+fn)

# find NaNs
bool_array = np.isnan(df['Computer'].values)
# find NaN indices
bool_index = np.where(bool_array == True)[0]
# remove rows where NaNs == True
df_clean = df.drop(df.index[[bool_index]])
# save 'clean' data as csv
df_clean.to_csv(path+'cleanLocoPoco.csv')

# make sure columns are numeric (i.e. not strings)
df_clean['Block'] = pd.to_numeric(df_clean['Block'])
df_clean['Day'] = pd.to_numeric(df_clean['Day'])
df_clean['Trial'] = pd.to_numeric(df_clean['Trial'])
df_clean['Computer'] = pd.to_numeric(df_clean['Computer'])
df_clean['start'] = pd.to_numeric(df_clean['start'])

# sort data by 'Block' then 'Day' then 'Trial' etc
df_sorted = df_clean.sort_values(['Block', 'Day', 'Trial', 'Computer', 'start', 'location'], ascending=True)
# save 'sorted' data to csv
df_sorted.to_csv(path+'cleanLocoPoco_sorted.csv')
