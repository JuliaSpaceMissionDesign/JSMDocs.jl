# Time Scales & Transformations

Calculations in any scientific discipline may involve precise time, but what 
sets astronomy apart is the number and variety of **time scales** that have to be used.
In fact, in astronomical applications the physical context of the “clock” matters,
whether it is on Earth, moving or stationary, or on a spacecraft.

```@raw html
<figure>
    <img src="https://user-images.githubusercontent.com/56970512/197333462-09a9af52-d111-41ca-a52a-5e06655bb8e9.png" alt="Image" width="600" />
    <figcaption> Time Conversions - The difference in each time is shown with 
    respect to TAI. Credits Vallado (2012). </figcaption>
</figure>
```

The most relevant time scales for these applications are:

- **UT1** (Universal Time 1): UT1 is a time scale based on the rotation of the Earth. 
    It is used to measure the positions of celestial objects relative to the Earth's 
    surface. UT1 is closely related to *Greenwich Mean Time (GMT)*, and the two time 
    scales are often used interchangeably.

- **TAI** (International Atomic Time): TAI is a time scale based on the average 
    frequency of a set of atomic clocks. It is used to measure the positions of 
    celestial objects relative to the Earth's surface.

- **TT** (Terrestrial Time): TT is a time scale based on the motion of celestial 
    objects around the solar system barycenter (the center of mass of the solar system). 
    It is used to measure the positions of celestial objects relative to the Earth's surface.

- **TDB** (Barycentric Dynamical Time): TDB is a time scale based on the motion of 
    celestial objects around the solar system barycenter (the center of mass of the 
    solar system). It is used to measure the positions of celestial objects relative 
    to the solar system barycenter.

- **TCB** (Barycentric Coordinate Time): TCB is a time scale based on the motion of 
    celestial objects around the solar system barycenter (the center of mass of the 
    solar system). It is used to measure the positions of celestial objects relative 
    to the solar system barycenter.

- **TCG** (Geocentric Coordinate Time): TCG is a time scale based on the rotation of 
    the Earth. It is used to measure the positions of celestial objects relative to the 
    Earth's surface.

- **Teph** (Ephemeris Time): Teph is a time scale based on the motion of celestial 
    objects around the solar system barycenter (the center of mass of the solar 
    system). It is used to measure the positions of celestial objects relative to 
    the solar system barycenter.

Of the seven time scales to be described here, one is atomic time (TAI), 
one is solar time (UT1), one is an atomic/solar hybrid (UTC) and four are 
dynamical times (TT, TCG, TCB, TDB). Other time scales of interest may also be the 
ones associated to the different positioning systems. In particular: **GPS** (Global 
Positioning System), **GLONASS** (Global Navigation Satellite System) and **GALILEO** 
(Global Navigation Satellite System) times could be defined as a constant offset with
respect to TAI.

!!! note 
    A particularly common mistake is to assume that there is just one sort of 
    precise time, namely UTC, compatible with everything from telescope pointing 
    (which actually requires UT1) to looking up planetary positions (which requires TDB, 
    which may be approximated by TT). In fact UTC itself is almost never the time 
    scale to use for astronomical calculations, except perhaps for record-keeping.


```@raw html
<script src="https://cdn.jsdelivr.net/npm/mermaid/dist/mermaid.min.js"></script>
<script>mermaid.initialize({startOnLoad:true});</script>
<figure>
    <div class="mermaid", width=600px>
        flowchart TD
            GPS -- +19.000s --> TAI
            TAI -- -ΔTA --> UTC
            UTC -- +ΔUT1 --> UT1
            TAI -- +ΔUT-ΔTA --> UT1
            UTC -- +ΔTT --> TT
            UT1 -- +ΔT --> TT
            TAI -- +32.184s --> TT
            TT -- linear --> TCG 
            TCG -- 4D --> TCB 
            TCB -- linear --> TDB
            TDB -- "func(TDB, UT1, site)" --> TT
    </div>
    <figcaption> Relationship between different scales of interest
    </figcaption>
</figure>
```

### References 

- https://www.iausofa.org/2021_0512_C/sofa/sofa_ts_c.pdf
