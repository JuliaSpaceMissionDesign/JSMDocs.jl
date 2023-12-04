var documenterSearchIndex = {"docs":
[{"location":"api/#API","page":"API","title":"API","text":"","category":"section"},{"location":"api/","page":"API","title":"API","text":"Modules = [CalcephEphemeris]\nOrder = [:type, :function]","category":"page"},{"location":"api/#CalcephEphemeris.CalcephProvider","page":"API","title":"CalcephEphemeris.CalcephProvider","text":"CalcephProvider(file::String)\nCalcephProvider(files::Vector{String})\n\nCreate a CalcephProvider instance by loading a single or multiples ephemeris kernel  files specified by files.\n\nnote: Note\nSince this object is immutable, kernels cannot be added nor removed from the generated CalcephProvider instance.  \n\nExample\n\njulia> eph1 = CalcephProvider(\"PATH_TO_KERNEL\")\nCalcephProvider(CALCEPH.Ephem(Ptr{Nothing} [...]))\n\njulia> eph2 = CalcephProvider([\"PATH_TO_KERNEL_1\", \"PATH_TO_KERNEL_2\"])\nCalcephProvider(CALCEPH.Ephem(Ptr{Nothing} [...]))\n\n\n\n\n\n","category":"type"},{"location":"api/#JSMDInterfaces.Ephemeris.ephem_available_axes-Tuple{CalcephProvider}","page":"API","title":"JSMDInterfaces.Ephemeris.ephem_available_axes","text":"ephem_available_points(eph::CalcephProvider)\n\nReturn a list of Frame IDs representing axes with available orientation data. \n\n\n\n\n\n","category":"method"},{"location":"api/#JSMDInterfaces.Ephemeris.ephem_available_points-Tuple{CalcephProvider}","page":"API","title":"JSMDInterfaces.Ephemeris.ephem_available_points","text":"ephem_available_points(eph::CalcephProvider)\n\nReturn a list of NAIFIds representing bodies with available ephemeris data. \n\n\n\n\n\n","category":"method"},{"location":"api/#JSMDInterfaces.Ephemeris.ephem_compute!-Tuple{Any, CalcephProvider, Number, Number, Int64, Int64, Int64}","page":"API","title":"JSMDInterfaces.Ephemeris.ephem_compute!","text":"ephem_compute!(res, eph, jd0, time, target, center, order)\n\nInterpolate the position and/or its derivatives up to order for one body target relative  to another center at the time jd0 + time, expressed as a Julian Date. This function reads  the ephemeris files associated to eph and stores the results to res.\n\nThe returned array res must be large enough to store the results. The size of this array  must be equal to 3*order: \n\nres[1:3] contain the position (x, y, z) and is always valid \nres[4:6] contain the velocity (dx/dt, dy/dt, dz/dt) for order ≥ 1 \nres[7:9] contain the acceleration (d²x/dt², d²y/dt², d²z/dt²) for order ≥ 2\nres[10:12] contain the jerk (d³x/dt³, d³y/dt³, d³z/dt³) for order ≥ 3\n\nThe values stores in res are always returned in km, km/s, km/s², km/s³\n\nSee also\n\nSee also ephem_orient!\n\n\n\n\n\n","category":"method"},{"location":"api/#JSMDInterfaces.Ephemeris.ephem_orient!-Tuple{Any, CalcephProvider, Number, Number, Int64, Int64}","page":"API","title":"JSMDInterfaces.Ephemeris.ephem_orient!","text":"ephem_orient!(res, eph, jd0, time, target, order)\n\nInterpolate the orientation and its derivatives up to order for the target body at the  time jd0 + time, expressed as a Julian Date. This function reads the ephemeris files  associated to eph and stores the results to res.\n\nThe returned array res must be large enough to store the results. The size of this array  must be equal to 3*order: \n\nres[1:3] contain the angles \nres[4:6] contain the 1st derivative  for order ≥ 1 \nres[7:9] contain the 2nd derivative for order ≥ 2\nres[10:12] contain the 3rd derivative for order ≥ 3\n\nThe values stores in res are always returned in rad, rad/s, rad/s², rad/s³\n\nSee also\n\nSee also ephem_orient!\n\n\n\n\n\n","category":"method"},{"location":"api/#JSMDInterfaces.Ephemeris.ephem_orient_records-Tuple{CalcephProvider}","page":"API","title":"JSMDInterfaces.Ephemeris.ephem_orient_records","text":"ephem_orient_records(eph::CalcephProvider)\n\nGet an array of jEph.EphemAxesRecord, providing detailed  informations on the orientation content of the ephemeris file.\n\n\n\n\n\n","category":"method"},{"location":"api/#JSMDInterfaces.Ephemeris.ephem_position_records-Tuple{CalcephProvider}","page":"API","title":"JSMDInterfaces.Ephemeris.ephem_position_records","text":"ephem_position_records(eph::CalcephProvider)\n\nGet an array of jEph.EphemPointRecord, providing detailed informations on the  position content of the ephemeris file.\n\n\n\n\n\n","category":"method"},{"location":"api/#JSMDInterfaces.Ephemeris.ephem_timescale-Tuple{CalcephProvider}","page":"API","title":"JSMDInterfaces.Ephemeris.ephem_timescale","text":"ephem_timescale(eph::CalcephProvider)\n\nRetrieve a timescale ID associated with the ephemeris handler eph.  It returns 1 for Barycentric Dynamical Time (TDB) and 2 for Barycentric Coordinate Time (TCB).\n\nwarning: Warning\nAn error is thrown if the timescale is neither TDB nor TCB.\n\n\n\n\n\n","category":"method"},{"location":"api/#JSMDInterfaces.Ephemeris.ephem_timespan-Tuple{CalcephProvider}","page":"API","title":"JSMDInterfaces.Ephemeris.ephem_timespan","text":"ephem_timespan(eph::CalcephProvider)\n\nReturns the first and last time available in the ephemeris file associated to  an ephemeris file. It returns a tuple containing:\n\nfirsttime – Julian date of the first time.\nlasttime – Julian date of the last time.\ncontinuous – Information about the availability of the quantities over the                  time span. It equals:\n1: if the quantities of all bodies are available for any time between    the first and last time.\n2: if the quantities of some bodies are available on discontinuous time    intervals between the first and last time.\n3: if the quantities of each body are available on a continuous time    interval between the first and last time, but not available for any    time between the first and last time.\n\n\n\n\n\n","category":"method"},{"location":"#CalcephEphemeris.jl-API","page":"Home","title":"CalcephEphemeris.jl API","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"A lightweight CALCEPH.jl wrapper for the JSMD ecosystem. ","category":"page"},{"location":"","page":"Home","title":"Home","text":"This package is a lightweight wrapper around CALCEPH.jl  that implements the JSMDInterfaces.jl  interfaces to extract data from SPICE and INPOP ephemeris kernels. ","category":"page"},{"location":"","page":"Home","title":"Home","text":"The CALCEPH is a C++ library written by the research team Astronomie et systèmes dynamiques  (CNRS/Observatoire de Paris/IMCCE). For further information on CALCEPH visit its  official website or its original  Julia wrapper.","category":"page"}]
}
