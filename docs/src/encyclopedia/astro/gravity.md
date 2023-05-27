# Gravitational Models

## Ephemeris Restricted N-Body Problem

Astrodynamics is mainly concerned with the study of the motion of artificial objects. Therefore, simplifications to the Full N-Body Problem can be introduced. In fact, assuming that the mass of the test particle $i$ is such that $M_i \ll M_j$, where $j$ are the other bodies in the model, its gravitational effect on the other bodies may be neglected. 

```@raw html
<p align="center">
    <img src="https://user-images.githubusercontent.com/56970512/193584643-0f9e6b0b-c6ca-4eb4-8db3-24ba80b12a91.png" alt="Image" width="400" />
</p>
```

Moreover, it is more useful to describe the motion of the particle interest with respect to some central body, $\mathcal{P}_k$, instead of a generic point, $\mathcal{O}$. Therefore, the relative formulation of the Restricted N-Body can be expressed as:

```math
\begin{equation*}
    \boldsymbol{\ddot{R}}_{ki} = - \frac{\mu_k}{R_{ki}^3} \,\boldsymbol{R}_{ki} + \sum_{\substack{j=1 \\ j\neq i,k}}^{\text{N}}\, \mu_j\left(\frac{\boldsymbol{R}_{ij}}{{R}_{ij}^3} - \frac{\boldsymbol{R}_{kj}}{{R}_{kj}^3} \right)
\end{equation*}
```
where the motion of the particle $\mathcal{P}_i$, with respect to the central body $\mathcal{P}_k$, under the gravitational influence of the point masses $\mathcal{P}_j$ is modelled.

If the relative position vector $\boldsymbol{R}_{kj}$, that represents the location of the $j$-th perturbing body with respect to the central body is obtained from high-fidelity ephemerides, recovering the Ephemeris Restricted N-Body Problem. Note that here the relative position vector $\boldsymbol{R}_{ij}$ is computed by vector subtraction as:

```math
\begin{equation*}
    \boldsymbol{R}_{ji} = \boldsymbol{R}_{kj} - \boldsymbol{R}_{ki}
\end{equation*}
```

and represents the location of the perturbing body $\mathcal{P}_j$ with respect to the particle of interest, $\mathcal{P}_i$

## Spherical Harmonics 

A possibile way to represent the exterior gravitational field of non-spherical objects is by exploiting a spherical harmonics expansion of its field. 

```math
V(r,\lambda,\varphi) = \sum_{m=0}^N\sum_{n=0}^N V_{nm}(r,\lambda,\varphi)
```
where 
```math
\begin{equation*}
V_{nm}(r,\lambda,\varphi) = \frac{\mu}{a}\left(\frac{a}{r}\right)^{n+1}\left(\bar{C}_{nm}\cos(m\lambda) + \bar{S}_{nm}\sin(m\lambda)\right)\,\bar{P}_{nm}(\sin\varphi)
\end{equation*}
```
with dimensionless coefficients $\bar{C}_{nm}$ and $\bar{S}_{nm}$. Where $a$ is the semimajor axis of the reference ellipsoid belonging to the model, $\mu$ the gravitational parameter and $\bar{P}_{nm}$ the fully normalized associated Legendre polynomials of degree $n$ and order $m$.

Then, denoting the cartesian coordinates of the satellite position $(x,y,z)$ in the body frame of the body, their relation with the spherical coordinates used here are:
```math
\begin{align*}
    x &= r\cos\varphi\cos\lambda \\
    y &= r\cos\varphi\sin\lambda \\
    z &= r\sin\varphi
\end{align*}
```
where here $r\geq 0$, $\varphi\in [-\pi/2, \pi/2]$ and $\lambda\in[0, 2\pi]$. In the literature instead of $\varphi$, mostly the **colatitude** $\vartheta=\pi/2-\varphi$ is used. Here the **latitude** is preferred because its domain coincides with the range of the inverse trigonometric functions arcsin and most notably arctan. As fourth cartesian coordinate we make use of the radius of the parallel of latitude:

```math
\begin{equation*}
    \rho = \sqrt{x^2 + y^2} = r\cos\varphi
\end{equation*}
```

Moreover, it is convenient to define the following normalized cartesian coordinates:
```math
\begin{equation*}
    \bar{x} = \frac{x}{r},\quad \bar{y} = \frac{y}{r},\, \quad \bar{z} = \frac{z}{r}=\sin\varphi,\, \quad \bar{\rho} = \frac{\rho}{r}=\cos\varphi
\end{equation*}
```

Note that outside an arbitrary small neighborhood of the poles the transformation:
```math
\begin{equation*}
    \varphi \mapsto \bar{z}=\sin\varphi,\quad \frac{\partial}{\partial\varphi} = \cos\varphi\frac{\partial}{\partial\bar{z}} = \bar{\rho}\frac{\partial}{\partial\bar{z}}
\end{equation*}
```

is strictly monotonous and continuously differentiable. Thus, we may replace the coordinate $\varphi$ by $\bar{z} = \cos\varphi$.

Therefore, to transform the potential gradient from spherical to cartesian coordinates, it is possible to apply:
```math
\begin{align*}
    r\frac{\partial V}{\partial x} &= \bar{x}\left(r\frac{\partial V}{\partial r} - \bar{z}\frac{\partial V}{\partial \bar{z}}\right) - \bar{y}\left(\frac{1}{\bar{\rho}^2}\frac{\partial V}{\partial \lambda}\right) \\
    r\frac{\partial V}{\partial y} &= \bar{y}\left(r\frac{\partial V}{\partial r} - \bar{z}\frac{\partial V}{\partial \bar{z}}\right) + \bar{x}\left(\frac{1}{\bar{\rho}^2}\frac{\partial V}{\partial \lambda}\right) \\
    r\frac{\partial V}{\partial z} &= \bar{z}\left(r\frac{\partial V}{\partial r} - \bar{z}\frac{\partial V}{\partial \bar{z}}\right) + \frac{\partial V}{\partial \bar{z}} \\
\end{align*}
```
where:
```math
\begin{align*}
\frac{\partial V_{nm}}{\partial\lambda} &= m\,\frac{\mu}{a}\left(\frac{a}{r}\right)^{n+1}(-\bar{C}_{nm}\sin(m\lambda) + \bar{S}_{nm}\cos(m\lambda))\,\bar{P}_{nm}(\bar{z}) \\ 
\frac{\partial V_{nm}}{\partial r} &= -\frac{\mu}{a^2}(n+1)\left(\frac{a}{r}\right)^{n+2}(\bar{C}_{nm}\cos(m\lambda) + \bar{S}_{nm}\sin(m\lambda))\,\bar{P}_{nm}(\bar{z}) \\ 
\frac{\partial V_{nm}}{\partial \bar{z}} &= \frac{\mu}{a}\left(\frac{a}{r}\right)^{n+1}\left(\bar{C}_{nm}\cos(m\lambda) + \bar{S}_{nm}\sin(m\lambda)\right)\,\frac{d\bar{P}_{nm}(\bar{z})}{d\bar{z}}
\end{align*}
```

### Fully Normalized ALF

The recursion of fully normalized functions are:

```math
\begin{align*}
    \bar{P}_{00} &= 1, \quad \bar{P}_{mm} = \nu_{mm}\sqrt{1-\bar{z}^2}\,\bar{P}_{m-1, m-1} \\ 
    \bar{P}_{m-1, m} & = 0\, \quad \bar{P}_{nm} = \nu_{nm}\left(\bar{z}\bar{P}_{n-1, m} - \frac{\bar{P}_{n-2, m}}{\nu_{n-1,m}}\right)
\end{align*}
```

with factors:

```math
\begin{align*}
    \nu_{00} = \sqrt{3}, \quad \nu_{mm} = \sqrt{\frac{2m+1}{2m}}, \quad\nu_{nm} = \sqrt{\frac{(2n-1)(2n+1)}{(n-m)(n+m)}}
\end{align*}
```

### References 

- Gerstl, Michael. _Computing the Earth gravity field with spherical harmonics._ From Nano to Space. Springer, Berlin, Heidelberg, 2008. 277-294.

- Barthelmes, Franz. _Definition of functionals of the geopotential and their calculation from spherical harmonic models: theory and formulas used by the calculation service of the International Centre for Global Earth Models (ICGEM)_, http://icgem.gfz-potsdam.de (2009): 1-32.


## Constant Density Polyhedron

Among the different available techniques, one of the most effective for the computation
of the gravitational field of a body is the constant density polyhedron model. This models has been largely applied in literature and consider the fact that the potential of a constant density attractor can be derived from:

```math
\mathcal{U} = G\rho\int_V \frac{1}{r}\,dV
```

where $V$ is the overall volume and $r$ the modulus of the vector $\mathbf{r}$ between the field point and the infinitesimal mass element $dm = \rho dV$. Then, defining the unit vector:

```math
\hat{r} = \frac{\mathbf{r}}{r}
```

and exploiting the Gauss divergence theorem

```math
\mathcal{U} = \frac{1}{2}G\rho\int_V(\nabla \cdot\hat{r}) \,dV = \frac{1}{2}G\rho\int_S(\hat{n}\cdot\hat{r})\, dS
```

where $\hat{n}$ is the unit normal to the infinitesimal surface. This can be transformed, for a polyhedron model with a certain number of faces $n_f$ to:

```math
\mathcal{U} = \frac{1}{2}G\rho\sum_{faces} \hat{n}_f \cdot \mathbf{r}_f\int_S\frac{1}{r}dS
```

with $\mathbf{r}_f$ the vector from the field point to any point of the plane in which lies the tetrahedron’s face. Exploiting properties of the polygons and defining $\hat{n}_{e}^f$ the unit normal to tetrahedron’s edge $e$ lying on the face’s $e$ plane and $\mathbf{r}_e^f$ the vector from the field point to a generic point on the edge $e$ extension, then:

```math
\mathcal{U} = \frac{1}{2}G\rho\sum_{faces}\sum_{edges}(\mathbf{r}_f\cdot\hat{n}_f\hat{n}_{e}^f\cdot\mathbf{r}_{e}^fL_e^f) - \frac{1}{2}G\rho\sum_{faces}(\mathbf{r}_f\cdot\hat{n}_f\hat{n}_f\cdot\mathbf{r}_f\omega_f)
```

where here: 

```math
L_e^f = \ln\frac{l_1+ l_2+ e}{l_1+ l_2 -e}
```

with $l_1$ the distance from the field point to the first end of the edge, $l_2$ the distance
from the field point to the second end of the edge and e the length of the edge. Here,
also $\omega_f$ is intended to the be solid angle subtended by the face S, when viewed from
the field point and defined as:

```math
\omega_f = \int_S\frac{\Delta z}{r^3}\, dS
```

Therefore, defining the dyads:

```math
\mathbb{E} =\hat{n}_f\hat{n}_{e}^{f_1} + \hat{n}_f\hat{n}_{e}^{f_2}\quad\text{and}\quad \mathbb{F} = \hat{n}_f\hat{n}_f
```

we have:

```math
\begin{align*}
    \mathcal{U} &= \frac{1}{2}G\rho\sum_{edges} \mathbf{r}_e\cdot\mathbb{E}_e\cdot\mathbf{r}_eL_e - \frac{1}{2}G\rho\sum_{faces}\mathbf{r}_f\cdot\mathbb{F}_f\cdot\mathbf{r}_f\omega_f \\
    \nabla\mathcal{U} &= -G\rho\sum_{edges} \mathbb{E}_e\cdot\mathbf{r}_eL_e + G\rho\sum_{faces}\mathbb{F}_f\cdot\mathbf{r}_f\omega_f \\
    \nabla^2\mathcal{U} &= - G\rho\sum_{faces}\omega_f \\
\end{align*}
```
