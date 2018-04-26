%matplotlib inline
%config InlineBackend.figure_format = 'retina'
from warnings import filterwarnings
filterwarnings("ignore")
import os
os.environ['MKL_THREADING_LAYER']='GNU'
os.environ['THEANO_FLAGS']='cuda.root=/usr/local/cuda,device=cuda*,floatX=float32,lib.cnmem=0'
import numpy as np
import pandas as pd
import qgrid                   # for beautiful tables
qgrid.set_defaults(show_toolbar = True)
import theano
import theano.tensor as tt
import pymc3 as pm
import dask.dataframe as dd
import pickle
import seaborn as sns             # for static plots
import matplotlib.pyplot as plt
from bqplot import *              # for interactive plots
from ipywidgets import interact, interactive, fixed, interact_manual
import ipywidgets as ipw
fig_layout = ipw.Layout(width = "100%", height = "600px")
sns.set_context('notebook', font_scale = 1.1)
np.random.seed(12345)
rc = {'xtick.labelsize': 20, 'ytick.labelsize': 20, 'axes.labelsize': 15, 'font.size': 20,
      'lines.linewidth': 4.0, 'lines.markersize': 40, 'font.family': "serif", 'font.serif': "cm",
      'savefig.dpi': 200, 'text.usetex': False, 'legend.fontsize': 20.0, 'axes.titlesize': 20, 
      "figure.figsize": [20, 12]}
sns.set(rc = rc)
sns.set_style("whitegrid") # or ticks
from IPython.core.interactiveshell import InteractiveShell
InteractiveShell.ast_node_interactivity = "all"