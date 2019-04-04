# Singkeron
Matlab code to synchronice 2 sets of data at different sampling rate e.g. load data and DIC strain data
This Singkeron matlab file is used to synchronize 2 file obtained from different system with different sampling time.
So this code will read these 2 data either from CSV or XLSX, filter the noise using Savitzky Golay and Interpolated at the new sampliing time.
The interpolation used is based on the spline interpolation (instead of linear one).
