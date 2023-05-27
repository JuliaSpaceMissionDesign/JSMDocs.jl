# ICRF, GCRF and ITRF
## Introduction
The _International Rotation and Reference System Service_ (__IERS__) is the 
organisation responsible of defining and maintaing the 
_International Celestial Reference System_ (__ICRS__), whose realisation is the 
_International Celestial Reference Frame_ (ICRF). The ICRF is defined using a 
set of precise coordinates of compact extragalactic radio sources, and is periodically 
updated to improve the stability of its axes. The system has the origin at the 
barycenter of the Solary System and its axes were defined to closely match those 
of the older J2000/FK5 reference frame. The rotational offset between the J2000 
frame and the ICRF is below 0.1 arcseconds.

The _Geocentric Celestial Reference Frame_ (__GCRS__) is obtained translating 
the ICRS origin to the centre of the whole Earth system body (i.e., oceans and 
atmosphere included). As of IAU 2000 Resolution B1.3, the GCRS is recognised as 
Earth official space-time coordinate system. On the other hand, the 
_International Terrestrial Reference System_ (__ITRS__) is a spatial reference 
system co-rotating with the Earth in its diurnal motion in space. In particular, 
in the ITRS, points attached to the solid surface of the Earth have coordinates 
which undergo only small variations with time, due to geophysical effects 
(tectonic and tidal deformations).

Different ICRS realizations have been released throughout the years: 
- __ICRF1__: The first realization of the ICRS was constructed in 1995 using the positions of 212 _defining_ compact extragalactic radio sources. ICRF1 officially replaced the J2000/FK reference frame in 1997.
- __ICRF2__: The second realisation of the International Celestial Reference Frame was constructed in 2008 using positions of 295 new _defining_ compact extragalactic radio sources. It also contains accurate positions of an additional 3119 extragalactic sources. It superseded ICRF1 on January 2010 and was the fundamental realization of the ICRS until January 2019.
- __ICRF3__: The latest realization of the the ICRF was presented by the IAU in 2018. For the first time, the model includes the effect of the galactocentric acceleration of the solary system. It uses 4536 extragalactic sources, of which 303 are identified as _defining sources_ for the axes of the frame. ICRF3 has replaced ICRF2 on January 1 2019.

!!! note 
    The axes directions among different ICRF realizations are unchanged. 

#### References
 - Luzum, B. and Petit G. (2012). _The IERS Conventions (2010)_, [IERS Technical Note No. 36](https://www.iers.org/IERS/EN/Publications/TechnicalNotes/tn36.html) 
 - Charlot, P., et al. (2020). _The third realization of the International Celestial Reference Frame by very long baseline interferometry_, [DOI: 10.1051/0004-6361/202038368](https://doi.org/10.1051/0004-6361/202038368) 	


## Transformation between ITRS and GCRS

The celestial frame (GCRF) is related to a time-dependent terrestrial frame (ITRS) through an _Earth Orientation Model_ (EOM), calculated at the date $t$ as a standard matrix-multiplication sequence of rotations: 

```math 
\begin{equation*}
    \textbf{r}_{\text{GCRS}} = \boldsymbol{Q}(t)\boldsymbol{R}(t)\boldsymbol{W}(t)\;\textbf{r}_{\text{ITRS}}
\end{equation*}
```
where $\boldsymbol{Q}$ is the precession-nutation-bias matrix taking into account 
the motion of the celestial pole in the celestial reference system, $\boldsymbol{R}$ 
arises from the rotation of the Earth around the axis associated with the pole and 
$\boldsymbol{W}$ is the polar-motion matrix. Depending on the selected transformation 
model, the precession-nutation matrix can also be indicated as $\boldsymbol{PN}$. 
In particular, the _precession_ and _nutation_ transformation accounts for the 
changing orientation of the Earth's axis and defines the zero point for 
right-ascensions. Indeed, the equatorial plane of the Earth and the ecliptic 
plane undergo small changes in time, which have mathematically been divided into 
precessional (long period) and nutational (short period) oscillations. These 
effects are due to the gravitational forces of the planets, of the Sun and of the Moon. 
Additionally, since Earth is not spherical, the latter also induce a torque on 
the Earth and on its equatorial bulge. _Polar Motion_ is instead defined as the 
movement of the rotation axis with respect to the crust of the Earth [2].

### Available Transformation Models

Different approaches have been developed overtime to handle the inertial to Earth-fixed transformation. 

```@raw html
<p align="center">
    <img src="https://user-images.githubusercontent.com/85893254/198526044-56f39fa6-64d1-4ea5-84d0-f10ed5d0db9b.svg" alt="Image" width="100%" />
</p>
```

Most recently, the IAU 2000\2006 Resolutions have affected several aspects of 
the transformation between the ITRS and the GCRS:

- __Precession-Nutation__: Before IAU 2000 Resolutions, the default IAU precession-nutation model was based on the IAU 1976 precession model [1], and the IAU 1980 Theory of Nutation [2]. With IAU 2000 Resolution B1.6, two new models to account for precession and nutation effects were recommended, depending on the requested accuracy level. In particular, for high-precision applications (e.g., with accuracies measured in microarcseconds), the recommended model is the __IAU 2000A__ [3]. Since the large size of such model is often an unnecessary overhead and may exhaust the available resources, a shortened version called __IAU 2000B__ [4] has been developed with accuracies at the 1 mas level throughout 1995-2050. However, since the precession part of the IAU 2000A model consisted only of corrections to the precession rates of the IAU 1976 precession, IAU 2006 Resolution B1 recommended that the precession component of the IAU 2000A precession-nutation model should be replaced by the P03 precession theory of Capitaine [5] in order to be consistent with the dynamical theory. In the following documentation, the IAU precession-nutation model resulting from IAU 2000 Resolution B1.6 and IAU 2006 Resolution B1 is denoted the __IAU 2006/2000 precession nutation model__.
- __CIP__: IAU 2000 Resolution B1.7 recommends that the _Celestial Intermediate Pole_ (__CIP__) be implemented in place of the _Celestial Ephemeris Pole_ (CEP) starting from January 2003.
- __Earth Rotation Angle__: IAU 2000 Resolution B1.7 recommends that the transformation between the ITRS and GCRS be specified by the position of the CIP in the GCRS/ITRS and by the _Earth Rotation Angle_ (__ERA__), a linear function of UT1. This angle corresponds to the equinox-based _Greenwich Sidereal time_ (GST), which instead is a more complicated function of both UT1 and Terrestrial Time (TT).
 
!!! note
    The IERS Conventions define the standard reference systems to be used by the IERS. They contain conventional models, constants and standards. The latest issue of the IERS Conventions is called the IERS Conventions (2010).

The approaches can be grouped into two equivalent procedures named __equinox-based__ 
and __CIO-based__ transformations. The two differ by the origin that is adopted 
on the CIP equator. In particular, each of these procedures is based on a 
specific representation fo the transformation matrices $\boldsymbol{Q}$ and 
$\boldsymbol{R}$, while the representation of the matrix $\boldsymbol{W}$ is 
common to both. Although the IAU 76/FK5 has been superseded by the IAU 2000/2006 
theories, many programs are still based upon that transformation model. 
Therefore, according to the 2010 IERS Conventions, EOP corrections to the 
IAU-76/FK5 predictions are still published to permit its usage. 

!!! note 
    IAU 2000 Resolution B1.3, B1.6 and B1.7 as well as IAU 2006 B1 can be 
    implemented in any of these two procedures if certain requirements are 
    followed. However, only the CIO based procedure can be in agreement with 
    IAU 2000 Resolution B1.8, which requires the use of a _non-rotating_ origin.

The time parameter $t$ that enters all the following expressions, is defined by: 

```math 
\begin{equation*}
t = (\text{TT} - 2000 \text{January\;\;1d 12h TT})\;\;\text{in days}/36525
\end{equation*}
```

### CIO-Based Approach

#### Polar Motion 
The transformation matrix arising from polar motion, which relates ITRS and TIRS 
can be expressed as: 
```math
\boldsymbol{W}(t) = \boldsymbol{R}_3(-s')\boldsymbol{R}_2(x_p)\boldsymbol{R}_1(y_p)
```
with $x_p$ and $y_p$ the _polar coordinates_ of the Celestial Intermediate Pole 
(CIP) in the ITRS and $s'$ a quantity called the _TIO locator_, which provides 
the position of the Terrestrial Intermediate Origin (TIO) on the equator of the 
CIP. The exact expression of $s'$ as a function of the coordinates $x_p$ 
and $y_p$ is: 
```math
\begin{equation*}
    s'(t) = \frac{1}{2} \int_{t_0}^t (x_p\dot{y}_p - \dot{x}_py_p)dt 
\end{equation*}
```
However, since $s'$ is sensitive only to the largest variations in polar motion, 
the expression can be simplified to: 
```math
\begin{equation*}
    s' = -0.0015(a_c^2/1.2 + a_a^2) t
\end{equation*}
```
where $a_c$ and $a_a$ are the average amplitudes (in arcseconds) of the 
Chandlerian and annual wobbles, respectively, in the period considered. 
Using the current mean amplitudes, an expression for $s'$ with an accuracy 
of $1\;\;\mu\text{as}$ over the last 40 years is [6]: 
```math
\begin{equation*}
    s' = -47 \mu\text{as}\,t
\end{equation*}
```
The standard pole coordinates $x_p$ and $y_p$ are 
[published](https://www.iers.org/IERS/EN/Publications/Bulletins/bulletins.html) 
by the IERS. For high-precision applications, additional components must be added
 to the IERS quantities to account for the effect of ocean tides and forced 
 libration terms with periods less than two days in space: 
```math
\begin{equation*}
    (x_p, y_p) = (x, y)_{\text{IERS}} + (\Delta x, \Delta y)_{\text{ocean tides}} + (\Delta x, \Delta y)_{\text{libration}}
\end{equation*}
```
These additional terms are computed through trigonometrical series by the 
routines available on the website of the IERS Conventions [7].

#### Earth Rotation Angle 
The transformation arising from the rotation of the Earth around the axis of 
the CIP (_i.e._ relating TIRS and CIRS) can be expressed as: 
```math 
\begin{equation*}
\boldsymbol{R}(t) = \boldsymbol{R}_3(-ERA)
\end{equation*}
```
where $ERA$ is the Earth Rotation Angle $\theta_{\text{ERA}}$, which provides 
a rigorous definition of the sidereal rotation of the Earth and has a conventional 
linear relationship with UT1: 
```math
\begin{equation*}
\begin{aligned}
\theta(T_u) &= 2\pi(0.7790572732640 + 1.00273781191135448T_u) \\
            &= 2\pi(\text{UT1 Julian day fraction} + 0.7790572732640 + 0.00273781191135448T_u)
\end{aligned}
\end{equation*} 
```
where $T_u = (\text{Julia UT1 date} - 2451545.0)$. In practice, the second 
expression is often used to reduce possible rounding errors. UT1 is computed
 from UTC after adding the $\Delta$ UT1 provided by the IERS. However, similarly 
 to polar motion, for high-precision applications, additional components should
  be added to the values published by the IERS for UT1 and LOD to account for
   the effects of ocean tides and libration. These effects can be computed with 
   various sub-routines available on the IERS Conventions Centre Website at Chapter 8. 

#### Precession-Nutation 

The CIO based transformation matrix arising from the motion of the CIP, which 
relates CIRS and GCRS is expressed as: 
```math 
\begin{equation*}
\boldsymbol{Q}(t) = \boldsymbol{R}_3(-E)\boldsymbol{R}_2(-d)\boldsymbol{R}_3(E+s)
\end{equation*}
```
where $E$ and $d$ are the coordinates of the CIP in the GCRS: 
```math 
\begin{equation*}
X = \sin d\cos E \qquad Y = \sin d\sin E \qquad Z = \cos d 
\end{equation*}
```
where $X$ and $Y$ are a set of parameters computed through polynomial and
 trigonometric series whose coefficients are available on the IERS Conventions 
 Center [website](ftp://tai.bipm.org/iers/conv2010/chapter5/) in tables 
 _tab5.2a.txt_ and _tab5.2b.txt_, respectively. The IAU 2006/2000A developments 
 are as follows: 
```math 
\begin{equation*}
\begin{aligned}
X =&\;X_0 + X_1t + X_2t^2 + X_3t^3 + X_4t^4 + X_5t^5 \\
&+\sum_j\sum_i \Big[(a_{s, j})_it^j \sin(\text{\small{ARG}}) + (a_{c, j})_it^j\cos(\text{\small{ARG}})\Big] 
\end{aligned}
\end{equation*}
```
```math 
\begin{equation*}
\begin{aligned}
Y =&\;Y_0 + Y_1t + Y_2t^2 + Y_3t^3 + Y_4t^4 + Y_5t^5 \\
&+\sum_j\sum_i \Big[(b_{c, j})_it^j \cos(\text{\small{ARG}}) + (b_{s, j})_it^j\sin(\text{\small{ARG}})\Big] 
\end{aligned}
\end{equation*}
```
where $\text{\small{ARG}}$ stands for various linear combinations of the Fundamental 
Arguments $F_j$ of the nutation theory, including both luni-solar and planetary terms, 
in the form of: 
```math 
\begin{equation*}
\text{\small{ARG}} = \sum_{j=1}^{14}N_j'F_j' 
\end{equation*}
```
The expressions for $F_j$ are given in [7]. Note that, for practical reasons, 
the numerical values for X and Y are provided in arcseconds. 

!!! note 
    The coefficients of the IAU 2006/2000A model do not take into account the 
    Free Core Nutation (FCN), which is a free retrograde diurnal motion of the 
    Earth's rotation axis with respect to the Earth caused by the interaction of 
    the mantle and the fluid. As a result, a quasi-periodic un-modelled motion of 
    the CIP in the GCRS still exists after the IAU 2006/2000A model has been taken 
    into account, resulting in errors up to the 0.1-0.3 mas level. For most stringent 
    accuracy applications, this unmodelled motion can be corrected through the $dX$ 
    and $dY$ offsets published by the IERS.

The numerical development of the quantity $s$, named __CIO Locator__, is derived 
in a way similat to that of $X$ and $Y$. However, in practice the series coefficients 
are provided for the quantity $s + XY/2$, which requires fewer terms to reach the 
same accuracy than a direct development for $s$ [8]. The coefficients for that series 
are available on the IERS Conventions Center website in file _tab5.2d.txt_. 

### Equinox-Based Approach

In the classical equinox-based transformation, the polar motion is handled as in the 
CIO-based approach. On the other hand, the equinox-based transformation matrix $R(t)$ 
uses the Greenwich Sidereal Time (GST) to represent the Earth's angle of rotation, 
instead of the ERA. The two angles are simply related by the 
_equations of the origins_ (EO): $GST = ERA - EO$, whose constants can be found online. 
The precession-nutation matrix $Q(t)$ can be expressed in several ways corresponding
to different parameterization choices. For the IAU 2006 precession model, the recommended 
choice is the 4-rotation Fukushima-Williams method:

```math 
\begin{equation*}
\boldsymbol{Q}(t) = \boldsymbol{R}_1(-\epsilon)\boldsymbol{R}_3(-\psi)\boldsymbol{R}_1(\bar\phi)\boldsymbol{R}_3(\bar\gamma)
\end{equation*}
```
where the angles $\epsilon$ and $\psi$ are each obtained by summing the contributions 
from the bias, precession and nutation in obliquity and ecliptic longitude, respectively. 
$\bar\phi$ is the obliquity of the ecliptic of date and $\bar\gamma$ is the GCRS 
right ascension of the intersection of the ecliptic of date with the GCRS equator.
In particular, the starting Fukushima-William Precession-Bias (PB) angles $\bar\gamma$, 
 $\bar\phi$, $\bar\psi$, $\epsilon_A$ with respect to the GCRS are obtained with 
 a series in the form: 

```math 
\begin{equation*}
\alpha_i = \alpha_{i_0} + \alpha_{i_1}t + \alpha_{i_2}t^2 + \alpha_{i_3}t^3 + \alpha_{i_4}t^4 + \alpha_{i_5}t^5
\end{equation*}
```

The NPB angles $\bar\gamma$, $\bar\phi$, $\psi$, $\epsilon$ are instead retrieved 
by adding the IAU-2006-compatible nutations to the corresponding two angles: 

```math 
\begin{equation*}
\begin{aligned}
\psi &= \bar\psi + \Delta\psi \\
\epsilon &= \epsilon_A + \Delta\epsilon 
\end{aligned}
\end{equation*}
```

In turn, $\Delta\psi$ and $\Delta\epsilon$ are obtained after adding small corrections to 
the IAU 2000A nutation components from the luni-solar and planetary terms of the Mathews series [3]:

```math
\begin{equation*}
\begin{aligned}
\Delta\psi_{2000A} &= \sum_i (A_i + A_i't)\sin(\text{ARG}) + (A_i'' + A_i'''t)\cos(\text{ARG})\\
\Delta\epsilon_{2000A} &= \sum_i (B_i + B_i't)\cos(\text{ARG}) + (B_i'' + B_i'''t)\sin(\text{ARG}\\
\Delta\psi &= \Delta\psi_{2000A} + (0.4697 \times 10^{-6} + f)\Delta\psi_{2000A} \\
\Delta\epsilon &= (1+f)\Delta\epsilon_{2000A} \\
\end{aligned}
\end{equation*}
```

where $f = -2.774 \times 10^{-6}t$ account for Earth's $J_2$ rate effect, which 
was not taken into account in IAU 2000. Additional small changes to the nutation 
in longitude amplitudes are required to ensure compatibility with teh IAU 2006 
values for $\epsilon_0$. 

!!! note 
    The coefficients for $\Delta\psi_{2000A}$ and $\Delta\epsilon_{2000A}$ 
    available from the IERS tables already account for the amplitude change in 
    longitude, whereas the SOFA function _nut00a_ equals the original IAU 2000A series. 

!!! note 
    The SOFA implementation of the IAU 2000A nutation takes

#### Fundamental Arguments 

The fundamental arguments of the nutation theory are a set of parameters that account 
for luni-solar and planetary nutation contributions. The former, also known as 
_Delaunay arguments_ are the mean anomalies for the Moon and Sun, $l$ and $l'$, the mean 
argument of latitude of the Moon, $F$, measured on the ecliptic from the mean 
equinox of date, the mean elongation from the Sun $D$, and the right ascension of 
the ascending node of the mean lunar orbit, $\Omega$, measured along the ecliptic 
from the mean equinox of date. The arguments to compute the corrections for the 
planetary effects on the nutation and the obliquity of the ecliptic are the mean Heliocentric
longitudes of the planets ($\lambda_i$), and the general precession in longitude ($p_\lambda$). 
The numerical expressions of these arguments are available on the IERS Conventions 2010. 

!!! note 
    The original fundamental arguments are function of time $t$ measured in TDB. However, 
    changes in the nutation amplitudes resulting from the difference TDB-TT are responsible 
    for a difference in the CIP location that is less than 0.01 $\mu\text{as}$, which is 
    significantly below the required microarcseconds accuracy. Therefore, in pratice, 
    TT is often used in place of TDB.

!!! note 
    The SOFA library, which provides standard routines and algorithms for fundamental 
    astronomy, follows a strict compliance with the MHB2000 code for the IAU 2000A nutation 
    model. As a consequence, simplified and slightly different expressions for the Delaunay 
    variables and the longitude of Neptune are used. However, the maximum differences 
    caused by this divergence are about 0.013 $\mu\text{as}$ after one century. 

#### References 

1. Lieske, J. H. et al. (1977), _Expressions for the Precession Quantities Based upon the IAU (1976) System of Astronomical Constants_ [Full Text Source](https://ui.adsabs.harvard.edu/abs/1977A%26A....58....1L/abstract)
2. Seidelmann, P. K. (1982), _1980 IAU Theory of Nutation: The Final report of the IAU Working Group on Nutation_ [DOI: 10.1007/BF01228952](https://link.springer.com/article/10.1007/BF01228952)
3. Mathews, P. M. et al. (2002), _Modeling of nutation and precession: New nutation series for nonrigid Earth, and insights into the Earth's Interior_ [DOI: 10.1029/2001JB000390](https://doi.org/10.1029/2001JB000390)
4. McCarthy, D. D. and Luzum, B. J. (2003), _An Abridged Model of the Precession-Nutation of the Celestial Pole_ [DOI: 10.1023/A:1021762727016](https://link.springer.com/article/10.1023/A:1021762727016)
5. Capitaine, N. et al. (2003c), _Expressions for IAU 2000 precession quantities_ [DOI: 10.1051/0004-6361:20031539](https://doi.org/10.1051/0004-6361:20031539)
6. Lambert, S. and Bizouard C. (2002), _Positioning the Terrestrial Ephemeris Origin in the Terrestrial Reference Frame_, [DOI: 10.1051/0004-6361:20021139](https://www.aanda.org/articles/aa/pdf/2002/40/aa2747.pdf)
7. Luzum, B. and Petit G. (2012). _The IERS Conventions (2010)_, [IERS Technical Note No. 36](https://www.iers.org/IERS/EN/Publications/TechnicalNotes/tn36.html) 
8. Capitaine, N. and Wallace P.T. (2006), _High precision methods for locating the celestial intermediate pole and origin_ [DOI: 10.1051/0004-6361:20054550 ](https://www.aanda.org/articles/aa/abs/2006/17/aa4550-05/aa4550-05.html)
10. Wallace P.T. and Capitaine N. (2006), _Precession-nutation procedures consistent with IAU 2006 resolutions_
9. Vallado D. _Fundamentals of Astrodynamics_
