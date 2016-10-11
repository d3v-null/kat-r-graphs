import pandas as pd
import numpy as np
import ggplot as gp

data_fname = 'locof.csv'

locof_df = pd.read_csv(data_fname)

g = gp.ggplot(gp.aes(x='sex', y='dist', color='line'), data=locof_df)
g.show()
