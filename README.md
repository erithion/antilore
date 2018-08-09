# antilore
An experimental VideoLAN audio-filter


## Matlab modelling notes

A 2nd order transfer function of a cutting IIR filter derived graphically from a zero-pole plot of the modified leaky integrator

<a href="https://www.codecogs.com/eqnedit.php?latex=H(z)=&space;\frac{(1-e^{-i\omega&space;_{0}}z^{-1})(1-e^{i\omega&space;_{0}}z^{-1})}{(1-\lambda&space;e^{-i\omega&space;_{0}}z^{-1})(1-\lambda&space;e^{i\omega&space;_{0}}z^{-1})}" target="_blank"><img src="https://latex.codecogs.com/gif.latex?H(z)=&space;\frac{(1-e^{-i\omega&space;_{0}}z^{-1})(1-e^{i\omega&space;_{0}}z^{-1})}{(1-\lambda&space;e^{-i\omega&space;_{0}}z^{-1})(1-\lambda&space;e^{i\omega&space;_{0}}z^{-1})}" title="H(z)= \frac{(1-e^{-i\omega _{0}}z^{-1})(1-e^{i\omega _{0}}z^{-1})}{(1-\lambda e^{-i\omega _{0}}z^{-1})(1-\lambda e^{i\omega _{0}}z^{-1})}" /></a>

An inverse z-transform of the above gives a CCDE

<a href="https://www.codecogs.com/eqnedit.php?latex=y_{n}-2\cdot\lambda\cdot\cos\omega_{0}\cdot&space;y_{n-1}&plus;\lambda^{2}\cdot&space;y_{n-2}=x_{n}-2\cdot&space;\cos\omega_{0}\cdot&space;x_{n-1}&plus;x_{n-2}" target="_blank"><img src="https://latex.codecogs.com/gif.latex?y_{n}-2\cdot\lambda\cdot\cos\omega_{0}\cdot&space;y_{n-1}&plus;\lambda^{2}\cdot&space;y_{n-2}=x_{n}-2\cdot&space;\cos\omega_{0}\cdot&space;x_{n-1}&plus;x_{n-2}" title="y_{n}-2\cdot\lambda\cdot\cos\omega_{0}\cdot y_{n-1}+\lambda^{2}\cdot y_{n-2}=x_{n}-2\cdot \cos\omega_{0}\cdot x_{n-1}+x_{n-2}" /></a>

### A two frequencies signal
![Filter in Matlab](https://github.com/erithion/antilore/raw/master/doc/matlab_cut_filter.png  "Filter in Matlab")

### Modulation within
![Filter in Matlab](https://github.com/erithion/antilore/raw/master/doc/matlab_cut_filter_modulated.png  "Filter in Matlab")
