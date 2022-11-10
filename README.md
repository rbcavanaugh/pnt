
### pnt: Computer adaptive forms of the Philadelphia Naming Test

An R package and web-app for administering the Computer Adaptive
Philadelphia Naming Test (PNT-CAT).

**[PNT-CAT Technical documentation](https://rbcavanaugh.github.io/pnt)**

### About

This application allows clinician users to administer adaptive (PNT-CAT)
and static versions of the Philadelphia Naming Test ([Roach et al.,
1996](https://mrri.org/philadelphia-naming-test/) and generate output
that provides scores on a common T-score metric, where the expected mean
and standard deviation of persons with aphasia are 50 and 10,
respectively. Users have the option of downloading performance data and
a pdf-report of the results. Please note that the app does not store any
data beyond a single user-session.

Comments, feedback, and bug reports are encouraged. Please submit as an
issue: <https://github.com/rbcavanaugh/pnt/issues>.

To cite in publications use:

Cavanaugh, R., Swiderski, A.M., Fergadiotis, G. & Hula, W.D. (2020).
pnt: Computer adaptive forms of the Philadelphia Naming Test. Version
0.1.1 Available from <https://github.com/rbcavanaugh/pnt>.

For users looking for a deeper dive into principles of item-response
theory and computer adaptive testing in aphasia, we recommend:

-   <a href="https://www.thieme-connect.com/products/ejournals/abstract/10.1055/s-0041-1727252" target="_blank">Fergadiotis,
    Casilio, Hula, and Swiderski, 2021</a>
-   <a href="https://aswiderski.shinyapps.io/IRTapp/ " target="_blank">https://aswiderski.shinyapps.io/IRTapp/</a>

### Acknowledgements

The development of this testing application was funded by National
Institute on Deafness and Other Communication Disorders Awards
R03DC014556 (PI: Fergadiotis) and R01DC018813 (MPIs: Fergadiotis &
Hula), VA Rehabilitation Research & Development Career Development Award
C7476W (PI: Hula), and the VA Pittsburgh Healthcare System Geriatric
Research, Education, and Clinical Center. We would also like to
acknowledge the support and assistance of Myrna Schwartz, Dan Mirman,
Adelyn Brecher, Erica Middleton, Patrick Doyle, Malcolm McNeil,
Christine Matthews, Angela Grzybowski, Brooke Swoyer, Maria Fenner,
Michelle Gravier, Alyssa Autenreith, Emily Boss, Haley Dresang, Lauren
Weerts, Hattie Olson, Kasey Graue, Chia-Ming Lei, Joann Silkes, Diane
Kendall, the staff of the VA Pittsburgh Healthcare System Audiology and
Speech Pathology Program.

### Installing & Using the application

There are a number of ways to use the application (see below). However,
please note that server resources are finite, and therefore **we ask
that researchers use option 2 for the following reasons:** (1) The
version of the app remains consistent throughout the research study
(option 1, 3, and 4 may change based on any updates to the app), (2)
There is an inactive time-out limitation on the free online version of
the app to keep server costs reasonable, which means that a long break
(\>15 minutes) without activity may cause you to lose your current
session. (3) Both the free online version and `shiny::runGithub()`
function require a stable internet connection and data will be lost if
an internet connection is lost.

**Detailed installation instructions can be found here:
<https://github.com/rbcavanaugh/pnt/wiki>**

#### 1. Online

The app is now online at <https://william-hula.shinyapps.io/pnt-cat/>

#### 2. Local Installation

The app can be installed locally via `remotes::install_github()`

#### 3. Local installation on RStudio Cloud

The app can be installed and run from RStudio Cloud
(<https://rstudio.cloud/>) if R/Rstudio can’t be installed locally.

#### 4. Remote access to the app, run locally

The app can also be accessed via `shiny::runGitHub()`

#### 5. Clone the repository

If desired, the repository can be cloned, and run locally.

    git clone https://github.com/rbcavanaugh/pnt.git

A helpful resource for this step is here: <https://happygitwithr.com/>
