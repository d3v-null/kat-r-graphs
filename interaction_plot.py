# -*- coding: utf-8 -*-
import pandas as pd
import numpy as np
from ggplot import *

import string

# from copy import copy

data_path = 'locof.csv'

locof_df = pd.read_csv(data_path)

def stupid_sex_plotting_hack(df, _aes=None):
    if not _aes: _aes = aes(x='sex', y='dist')
    x_axis = _aes['x']
    df[x_axis] = df[x_axis].str.translate(string.maketrans("MF", "01")).astype('int64')
    g = ggplot(df, _aes)
    g+= scale_x_discrete(name='Gender',breaks=[0, 1],labels=['Male', 'Female'])
    # g+= scale_x_discrete(name='Gender',breaks=[0, 1],labels=['♂ Male', '♀ Female'])
    return g

locof_lines_df = locof_df.groupby(['sex', 'line'],as_index=False).mean()
locof_lines_df['line'] = locof_lines_df['line'].astype('string')

g = stupid_sex_plotting_hack(locof_lines_df, aes(x='sex', y='dist', group='line'))
g = stupid_sex_plotting_hack(locof_lines_df, aes(x='sex', y='dist', color='line'))
g+= geom_point()
scale_color_funfetti()
g+= geom_line()
g.show()
