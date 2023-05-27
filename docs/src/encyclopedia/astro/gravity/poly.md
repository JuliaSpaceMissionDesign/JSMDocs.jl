# Constant Density Polyhedron

Among the different available techniques, one of the most effective for the computation
of the gravitational field of a body is the constant density polyhedron model. This models 
has been largely applied in literature and consider the fact that the potential of a constant 
density attractor can be derived from:

```math
\mathcal{U} = G\rho\int_V \frac{1}{r}\,dV
```

where $V$ is the overall volume and $r$ the modulus of the vector $\mathbf{r}$ between the 
field point and the infinitesimal mass element $dm = \rho dV$. Then, defining the unit vector:

```math
\hat{r} = \frac{\mathbf{r}}{r}
```

and exploiting the Gauss divergence theorem

```math
\mathcal{U} = \frac{1}{2}G\rho\int_V(\nabla \cdot\hat{r}) \,dV = \frac{1}{2}G\rho\int_S(\hat{n}\cdot\hat{r})\, dS
```

where $\hat{n}$ is the unit normal to the infinitesimal surface. This can be transformed, 
for a polyhedron model with a certain number of faces $n_f$ to:

```math
\mathcal{U} = \frac{1}{2}G\rho\sum_{faces} \hat{n}_f \cdot \mathbf{r}_f\int_S\frac{1}{r}dS
```

with $\mathbf{r}_f$ the vector from the field point to any point of the plane in which lies 
the tetrahedron’s face. Exploiting properties of the polygons and defining $\hat{n}_{e}^f$ 
the unit normal to tetrahedron’s edge $e$ lying on the face’s $e$ plane and $\mathbf{r}_e^f$ 
the vector from the field point to a generic point on the edge $e$ extension, then:

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
