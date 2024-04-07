# Introduction

Gravitational models play a crucial role in engineering applications related to space 
missions, satellite operations, and celestial mechanics. These models provide a mathematical 
representation of the gravitational field of celestial bodies, enabling engineers to accurately 
predict orbits, plan trajectories, and design spacecraft missions with precision.

Various gravitational models are employed to meet specific requirements and account for 
different levels of complexity. One commonly used model is the **Two-Body Problem**, which assumes 
that the gravitational interaction between two celestial bodies, such as a satellite and 
a planet, is the dominant force affecting their motion. This simplified model is often 
leveraged for preliminary orbit design.

For more accurate calculations, more sophisticated models are required, such as the 
**n-Body Problem**: it considers the gravitational interactions among multiple celestial 
bodies, accounting for the gravitational influences of planets, moons, and other significant 
objects within a celestial system.

The gravity field of most of the bodies, however, is not usually well represented by one of 
a spherically symmetric body, when in vicinity of the body. For this reason, more accurate gravitational 
field representations are required, as the **Spherical Harmonics Expansion** or the 
**Constant Density Polyhedron**. The former is a gravity field expansion using spherical harmonics 
coefficients, the latter exploit a meshed representation of the body shape and compute
the gravity field analytically, exploiting surface and line integrals.

The aim of this part of the documentation is to provide a concise, clear and mathematically accurate 
representation of gravitational models available within the JSMD ecosystem.
