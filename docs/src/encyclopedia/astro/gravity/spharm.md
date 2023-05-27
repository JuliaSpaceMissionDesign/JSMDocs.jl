# Spherical Harmonics 

A possibile way to represent the exterior gravitational field of non-spherical objects is 
by exploiting a spherical harmonics expansion of its field. 

```math
V(r,\lambda,\varphi) = \sum_{m=0}^N\sum_{n=0}^N V_{nm}(r,\lambda,\varphi)
```
where 
```math
\begin{equation*}
V_{nm}(r,\lambda,\varphi) = \frac{\mu}{a}\left(\frac{a}{r}\right)^{n+1}\left(\bar{C}_{nm}\cos(m\lambda) + \bar{S}_{nm}\sin(m\lambda)\right)\,\bar{P}_{nm}(\sin\varphi)
\end{equation*}
```
with dimensionless coefficients $\bar{C}_{nm}$ and $\bar{S}_{nm}$. Where $a$ is the semimajor 
axis of the reference ellipsoid belonging to the model, $\mu$ the gravitational parameter 
and $\bar{P}_{nm}$ the fully normalized associated Legendre polynomials of degree $n$ and order $m$.

Then, denoting the cartesian coordinates of the satellite position $(x,y,z)$ in the body 
frame of the body, their relation with the spherical coordinates used here are:
```math
\begin{align*}
    x &= r\cos\varphi\cos\lambda \\
    y &= r\cos\varphi\sin\lambda \\
    z &= r\sin\varphi
\end{align*}
```
where here $r\geq 0$, $\varphi\in [-\pi/2, \pi/2]$ and $\lambda\in[0, 2\pi]$. In the literature 
instead of $\varphi$, mostly the **colatitude** $\vartheta=\pi/2-\varphi$ is used. Here 
the **latitude** is preferred because its domain coincides with the range of the inverse 
trigonometric functions arcsin and most notably arctan. As fourth cartesian coordinate we 
make use of the radius of the parallel of latitude:

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

