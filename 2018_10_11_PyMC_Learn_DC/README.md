-   [Custom PyMC3 nonparametric Bayesian models built on top of the scikit-learn API](#custom-pymc3-nonparametric-bayesian-models-built-on-top-of-the-scikit-learn-api)
    -   [Event Information](#event-information)
    -   [Content](#content)
    -   [Abstract](#abstract)
    -   [Pre-requisites:](#pre-requisites)
    -   [Speaker Bio:](#speaker-bio)

Custom PyMC3 nonparametric Bayesian models built on top of the scikit-learn API
================================================================================

Event Information
-----------------

Meetup.com: <https://www.meetup.com/Bayesian-Data-Science-DC/events/254613927/>

Date: October 11, 2018

Place: McLean, VA @ Haystax Technology

Speaker: Daniel Emaasit

Content
-------

-   [Slides HTML](https://slides.com/emaasit/pymc-learn-dc)
-   [Slides PDF](https://github.com/Emaasit/meetups/blob/master/2018_10_11_PyMC_Learn_DC/slides/pymc-learn-dc.pdf)
-   [![Binder](https://mybinder.org/badge.svg)](https://mybinder.org/v2/gh/Emaasit/meetups/master?urlpath=lab) for the code. 
-   [Code Repository](https://github.com/Emaasit/meetups/blob/master/2018_10_11_PyMC_Learn_DC/notebooks)

Abstract
--------

[PyMC3](http://docs.pymc.io/) is a Python package for probabilistic machine learning that enables users to build bespoke models for their specific problems using a probabilistic modeling framework. However, PyMC3 lacks the steps between creating a model and reusing it with new data in production. The missing steps include: scoring a model, saving a model for later use, and loading the model in production systems.

In contrast, "[scikit-learn](http://scikit-learn.org/)" which has become the standard library for machine learning provides a simple API that makes it very easy for users to train, score, save and load models in production. However, "scikit-learn" may not have the model for a user's specific problem. These limitations have led to the development of the open source "pymc3-models" library which provides a template to build bespoke PyMC3 models on top of the "scikit-learn" API and reuse them in production. This enables users to easily and quickly train, score, save and load their bespoke models just like in "scikit-learn".

Our current research and development leverage the template in "pymc3-models" to develop custom nonparametric Bayesian models. This allows users to leverage the flexibility of nonparametric Bayesian models in a simple workflow that mimics the "scikit-learn" API.

Pre-requisites:
---------------

Only a laptop with a modern web browser like Google chrome or Mozilla Firefox. Click this icon [![Binder](https://mybinder.org/badge.svg)](https://mybinder.org/v2/gh/Emaasit/meetups/master?urlpath=lab) to open the notebooks in a web browser without installing any software.

Speaker Bio:
------------

[Daniel Emaasit](http://www.danielemaasit.com/) is a Data Scientist at [Haystax Technology](https://www.haystax.com/). His interests involve developing principled [probabilistic models](http://mlg.eng.cam.ac.uk/zoubin/bayesian.html) for problems where training data are scarce by leveraging knowledge from subject-matter experts and context information. In particular, he interested in [flexible](http://mlg.eng.cam.ac.uk/pub/topics/#np) [probabilistic machine learning methods](http://mlg.eng.cam.ac.uk/zoubin/bayesian.html), such as Gaussian processes and Dirichlet processes, and data-efficient learning methods such as [Bayesian optimization](https://arxiv.org/abs/1012.2599) and [model-based reinforcement learning](https://arxiv.org/abs/1706.06491).

Daniel is also a Ph.D. Candidate of Transportation Engineering at [UNLV](http://www.unlv.edu/) where his research in [nonparametric Bayesian](http://mlg.eng.cam.ac.uk/pub/topics/#np) methods is focused on developing flexible-statistical models for traveler-behavior analytics.
