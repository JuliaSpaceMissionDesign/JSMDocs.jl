
# Ephemeris Restricted N-Body Problem

Astrodynamics is mainly concerned with the study of the motion of artificial objects. 
Therefore, simplifications to the Full N-Body Problem can be introduced. In fact, assuming 
that the mass of a test particle $i$ is such that $M_i \ll M_j$, where $j$ are the other 
bodies in the model, its gravitational effect on the other bodies may be neglected. 

```@raw html
<p align="center">
    <img src="https://user-images.githubusercontent.com/56970512/193584643-0f9e6b0b-c6ca-4eb4-8db3-24ba80b12a91.png" alt="Image" width="400" />
</p>
```

Moreover, it is more useful to describe the motion of the particle interest with respect to 
some central body, $\mathcal{P}_k$, instead of a generic point, $\mathcal{O}$. Therefore, 
the relative formulation of the Restricted N-Body can be expressed as:

```math
\begin{equation*}
    \boldsymbol{\ddot{R}}_{ki} = - \frac{\mu_k}{R_{ki}^3} \,\boldsymbol{R}_{ki} + \sum_{\substack{j=1 \\ j\neq i,k}}^{\text{N}}\, \mu_j\left(\frac{\boldsymbol{R}_{ij}}{{R}_{ij}^3} - \frac{\boldsymbol{R}_{kj}}{{R}_{kj}^3} \right)
\end{equation*}
```
where the motion of the particle $\mathcal{P}_i$, with respect to the central body 
$\mathcal{P}_k$, under the gravitational influence of the point masses $\mathcal{P}_j$ is modelled.

If the relative position vector $\boldsymbol{R}_{kj}$, that represents the location of the 
$j$-th perturbing body with respect to the central body is obtained from high-fidelity 
ephemerides, recovering the Ephemeris Restricted N-Body Problem. Note that here the relative 
position vector $\boldsymbol{R}_{ij}$ is computed by vector subtraction as:

```math
\begin{equation*}
    \boldsymbol{R}_{ji} = \boldsymbol{R}_{kj} - \boldsymbol{R}_{ki}
\end{equation*}
```

and represents the location of the perturbing body $\mathcal{P}_j$ with respect to the 
particle of interest, $\mathcal{P}_i$.