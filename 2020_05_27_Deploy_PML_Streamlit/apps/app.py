import streamlit as st
import pandas as pd
import numpy as np
import plotly.express as px
import pymc3 as pm
import matplotlib.pyplot as plt
from matplotlib import dates as mdates

# Streamlit encourages well-structured code, like starting execution in a main()
# function.
def main():

    st.title("Build Probabilistic Machine Learning Apps Using Streamlit: A Case "
             "Study of COVID-19 Reproduction Metric")

    st.sidebar.title("Select State")

    results, list_of_states = get_results()

    selected_state = st.sidebar.selectbox(
        label="Select State",
        options=list_of_states
        )

    if st.button('Display Results'):
        result = results[results['region'] == selected_state]
        c=(.3,.3,.3,1)
        ci=(0,0,0,.09)
        fig, ax = plt.subplots()
        ax.set_ylim(0.5, 1.6)
        ax.set_title(selected_state)
        ax.plot(result['median'],
                marker='o',
                markersize=4,
                markerfacecolor='w',
                lw=1.5,
                c=c,
                markevery=2,
                label='median')
        ax.fill_between(
            result.index,
            result['lower_90'].values,
            result['upper_90'].values,
            color=ci,
            lw=0,
            label='90% credible interval')
        ax.axhline(1.0, linestyle=':', lw=1.5)

        ax.xaxis.set_major_formatter(mdates.DateFormatter('%m/%d'))
        ax.xaxis.set_major_locator(mdates.WeekdayLocator(interval=2))
        ax.set_xlabel("Time"); ax.set_ylabel("Estimated R_t"); plt.legend()
        st.pyplot()
        # st.plotly_chart(fig)


@st.cache
def get_results():
    results = pd.read_csv('data/rt_2020_05_25_gp_small.csv',
                      parse_dates=['date'],
                      index_col=['date'])

    states = list(np.unique(results['region'].values))

    return results, states

if __name__ == "__main__":
    main()

