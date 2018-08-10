# antilore
An experimental VideoLAN audio-filter


## Matlab modelling notes

A 2nd order transfer function of a cutting IIR filter derived graphically from a zero-pole plot of the modified leaky integrator

<a href="https://www.codecogs.com/eqnedit.php?latex=H(z)=&space;\frac{(1-e^{-i\omega&space;_{0}}z^{-1})(1-e^{i\omega&space;_{0}}z^{-1})}{(1-\lambda&space;e^{-i\omega&space;_{0}}z^{-1})(1-\lambda&space;e^{i\omega&space;_{0}}z^{-1})}" target="_blank"><img src="https://latex.codecogs.com/gif.latex?H(z)=&space;\frac{(1-e^{-i\omega&space;_{0}}z^{-1})(1-e^{i\omega&space;_{0}}z^{-1})}{(1-\lambda&space;e^{-i\omega&space;_{0}}z^{-1})(1-\lambda&space;e^{i\omega&space;_{0}}z^{-1})}" title="H(z)= \frac{(1-e^{-i\omega _{0}}z^{-1})(1-e^{i\omega _{0}}z^{-1})}{(1-\lambda e^{-i\omega _{0}}z^{-1})(1-\lambda e^{i\omega _{0}}z^{-1})}" /></a>

An inverse z-transform of the above gives a CCDE


<a href="https://www.codecogs.com/eqnedit.php?latex=y_{n}-2\cdot\lambda\cdot\cos\omega_{0}\cdot&space;y_{n-1}&plus;\lambda^{2}\cdot&space;y_{n-2}=x_{n}-2\cdot&space;\cos\omega_{0}\cdot&space;x_{n-1}&plus;x_{n-2}" target="_blank"><img src="https://latex.codecogs.com/gif.latex?y_{n}-2\cdot\lambda\cdot\cos\omega_{0}\cdot&space;y_{n-1}&plus;\lambda^{2}\cdot&space;y_{n-2}=x_{n}-2\cdot&space;\cos\omega_{0}\cdot&space;x_{n-1}&plus;x_{n-2}" title="y_{n}-2\cdot\lambda\cdot\cos\omega_{0}\cdot y_{n-1}+\lambda^{2}\cdot y_{n-2}=x_{n}-2\cdot \cos\omega_{0}\cdot x_{n-1}+x_{n-2}" /></a>

### A two frequencies signal
![Filter in Matlab](https://github.com/erithion/antilore/raw/master/doc/matlab_cut_filter.png  "Filter in Matlab")

### A modulation within
![Filter in Matlab](https://github.com/erithion/antilore/raw/master/doc/matlab_cut_filter_modulated.png  "Filter in Matlab")

### Cutting of 2 frequencies at one stroke

![Filter in Matlab](https://github.com/erithion/antilore/raw/master/doc/matlab_cut_2freq_filter_modulated_zp_plot.png  "Filter in Matlab")

<a href="https://www.codecogs.com/eqnedit.php?latex=H(z)=H_{1}(z)\cdot&space;H_{2}(z)\Rightarrow" target="_blank"><img src="https://latex.codecogs.com/gif.latex?H(z)=H_{1}(z)\cdot&space;H_{2}(z)\Rightarrow" title="H(z)=H_{1}(z)\cdot H_{2}(z)\Rightarrow" /></a>

<a href="https://www.codecogs.com/eqnedit.php?latex=B(z)=1-2\cdot(\cos\omega_{0}&space;&plus;&space;\cos\omega_{1})\cdot&space;z^{-1}&plus;2\cdot(1&space;&plus;&space;2\cdot&space;\cos\omega_{0}\cdot&space;\cos\omega_{1})\cdot&space;z^{-2}-2\cdot(\cos\omega_{0}&space;&plus;&space;\cos\omega_{1})\cdot&space;z^{-3}&plus;&space;z^{-4}" target="_blank"><img src="https://latex.codecogs.com/gif.latex?B(z)=1-2\cdot(\cos\omega_{0}&space;&plus;&space;\cos\omega_{1})\cdot&space;z^{-1}&plus;2\cdot(1&space;&plus;&space;2\cdot&space;\cos\omega_{0}\cdot&space;\cos\omega_{1})\cdot&space;z^{-2}-2\cdot(\cos\omega_{0}&space;&plus;&space;\cos\omega_{1})\cdot&space;z^{-3}&plus;&space;z^{-4}" title="B(z)=1-2\cdot(\cos\omega_{0} + \cos\omega_{1})\cdot z^{-1}+2\cdot(1 + 2\cdot \cos\omega_{0}\cdot \cos\omega_{1})\cdot z^{-2}-2\cdot(\cos\omega_{0} + \cos\omega_{1})\cdot z^{-3}+ z^{-4}" /></a>

<a href="https://www.codecogs.com/eqnedit.php?latex=A(z)=1-2\cdot\lambda\cdot(\cos\omega_{0}&space;&plus;&space;\cos\omega_{1})\cdot&space;z^{-1}&plus;2\cdot\lambda^{2}\cdot(1&space;&plus;&space;2\cdot&space;\cos\omega_{0}\cdot&space;\cos\omega_{1})\cdot&space;z^{-2}-2\cdot\lambda^{3}\cdot(\cos\omega_{0}&space;&plus;&space;\cos\omega_{1})\cdot&space;z^{-3}&plus;\lambda^{4}\cdot&space;z^{-4}" target="_blank"><img src="https://latex.codecogs.com/gif.latex?A(z)=1-2\cdot\lambda\cdot(\cos\omega_{0}&space;&plus;&space;\cos\omega_{1})\cdot&space;z^{-1}&plus;2\cdot\lambda^{2}\cdot(1&space;&plus;&space;2\cdot&space;\cos\omega_{0}\cdot&space;\cos\omega_{1})\cdot&space;z^{-2}-2\cdot\lambda^{3}\cdot(\cos\omega_{0}&space;&plus;&space;\cos\omega_{1})\cdot&space;z^{-3}&plus;\lambda^{4}\cdot&space;z^{-4}" title="A(z)=1-2\cdot\lambda\cdot(\cos\omega_{0} + \cos\omega_{1})\cdot z^{-1}+2\cdot\lambda^{2}\cdot(1 + 2\cdot \cos\omega_{0}\cdot \cos\omega_{1})\cdot z^{-2}-2\cdot\lambda^{3}\cdot(\cos\omega_{0} + \cos\omega_{1})\cdot z^{-3}+\lambda^{4}\cdot z^{-4}" /></a>


hence the CCDE is

<a href="https://www.codecogs.com/eqnedit.php?latex=y_{n}-2\cdot\lambda\cdot(\cos\omega_{0}&space;&plus;&space;\cos\omega_{1})\cdot&space;y_{n-1}&plus;2\cdot\lambda^{2}\cdot(1&space;&plus;&space;2\cdot&space;\cos\omega_{0}\cdot&space;\cos\omega_{1})\cdot&space;y_{n-2}-2\cdot\lambda^{3}\cdot(\cos\omega_{0}&space;&plus;&space;\cos\omega_{1})\cdot&space;y_{n-3}&plus;\lambda^{4}\cdot&space;y_{n-4}=x_{n}-2\cdot(\cos\omega_{0}&space;&plus;&space;\cos\omega_{1})\cdot&space;x_{n-1}&plus;2\cdot(1&space;&plus;&space;2\cdot&space;\cos\omega_{0}\cdot&space;\cos\omega_{1})\cdot&space;x_{n-2}-2\cdot(\cos\omega_{0}&space;&plus;&space;\cos\omega_{1})\cdot&space;x_{n-3}&plus;&space;x_{n-4}" target="_blank"><img src="https://latex.codecogs.com/gif.latex?y_{n}-2\cdot\lambda\cdot(\cos\omega_{0}&space;&plus;&space;\cos\omega_{1})\cdot&space;y_{n-1}&plus;2\cdot\lambda^{2}\cdot(1&space;&plus;&space;2\cdot&space;\cos\omega_{0}\cdot&space;\cos\omega_{1})\cdot&space;y_{n-2}-2\cdot\lambda^{3}\cdot(\cos\omega_{0}&space;&plus;&space;\cos\omega_{1})\cdot&space;y_{n-3}&plus;\lambda^{4}\cdot&space;y_{n-4}=x_{n}-2\cdot(\cos\omega_{0}&space;&plus;&space;\cos\omega_{1})\cdot&space;x_{n-1}&plus;2\cdot(1&space;&plus;&space;2\cdot&space;\cos\omega_{0}\cdot&space;\cos\omega_{1})\cdot&space;x_{n-2}-2\cdot(\cos\omega_{0}&space;&plus;&space;\cos\omega_{1})\cdot&space;x_{n-3}&plus;&space;x_{n-4}" title="y_{n}-2\cdot\lambda\cdot(\cos\omega_{0} + \cos\omega_{1})\cdot y_{n-1}+2\cdot\lambda^{2}\cdot(1 + 2\cdot \cos\omega_{0}\cdot \cos\omega_{1})\cdot y_{n-2}-2\cdot\lambda^{3}\cdot(\cos\omega_{0} + \cos\omega_{1})\cdot y_{n-3}+\lambda^{4}\cdot y_{n-4}=x_{n}-2\cdot(\cos\omega_{0} + \cos\omega_{1})\cdot x_{n-1}+2\cdot(1 + 2\cdot \cos\omega_{0}\cdot \cos\omega_{1})\cdot x_{n-2}-2\cdot(\cos\omega_{0} + \cos\omega_{1})\cdot x_{n-3}+ x_{n-4}" /></a>

![Filter in Matlab](https://github.com/erithion/antilore/raw/master/doc/matlab_cut_2freq_filter_modulated.png  "Filter in Matlab")

