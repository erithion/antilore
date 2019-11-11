# antilore
An experimental VideoLAN audio-filter

## Matlab modelling notes

A 2nd order transfer function of a cutting IIR filter derived graphically from a zero-pole plot of the modified leaky integrator

<!--  H(z)=\frac{(1-e^{-i\omega_{0}}z^{-1})(1-e^{i\omega_{0}}z^{-1})}{(1-\lambdae^{-i\omega_{0}}z^{-1})(1-\lambdae^{i\omega_{0}}z^{-1})} -->
![equation](http://www.sciweavers.org/tex2img.php?eq=%20H%28z%29%3D%5Cfrac%7B%281-e%5E%7B-i%5Comega_%7B0%7D%7Dz%5E%7B-1%7D%29%281-e%5E%7Bi%5Comega_%7B0%7D%7Dz%5E%7B-1%7D%29%7D%7B%281-%5Clambdae%5E%7B-i%5Comega_%7B0%7D%7Dz%5E%7B-1%7D%29%281-%5Clambdae%5E%7Bi%5Comega_%7B0%7D%7Dz%5E%7B-1%7D%29%7D&bc=White&fc=Black&im=png&fs=12&ff=arev&edit=0) 

An inverse z-transform of the above gives a CCDE

![equation](http://latex.codecogs.com/gif.latex?y_{n}-2\cdot\lambda\cdot\cos\omega_{0}\cdot&space;y_{n-1}&plus;\lambda^{2}\cdot&space;y_{n-2}=x_{n}-2\cdot&space;\cos\omega_{0}\cdot&space;x_{n-1}&plus;x_{n-2}) 

### A two frequencies signal
![Filter in Matlab](https://github.com/erithion/antilore/raw/master/doc/matlab_cut_filter.png  "Filter in Matlab")

### A modulation within
![Filter in Matlab](https://github.com/erithion/antilore/raw/master/doc/matlab_cut_filter_modulated.png  "Filter in Matlab")

### Cutting of 2 frequencies at one stroke

![Filter in Matlab](https://github.com/erithion/antilore/raw/master/doc/matlab_cut_2freq_filter_modulated_zp_plot.png  "Filter in Matlab")

![equation](http://latex.codecogs.com/gif.latex?H(z)=H_{1}(z)\cdot&space;H_{2}(z)\Rightarrow) 

![equation](http://latex.codecogs.com/gif.latex?B(z)=1-2\cdot(\cos\omega_{0}&space;&plus;&space;\cos\omega_{1})\cdot&space;z^{-1}&plus;2\cdot(1&space;&plus;&space;2\cdot&space;\cos\omega_{0}\cdot&space;\cos\omega_{1})\cdot&space;z^{-2}-2\cdot(\cos\omega_{0}&space;&plus;&space;\cos\omega_{1})\cdot&space;z^{-3}&plus;&space;z^{-4}) 

![equation](http://latex.codecogs.com/gif.latex?A(z)=1-2\cdot\lambda\cdot(\cos\omega_{0}&space;&plus;&space;\cos\omega_{1})\cdot&space;z^{-1}&plus;2\cdot\lambda^{2}\cdot(1&space;&plus;&space;2\cdot&space;\cos\omega_{0}\cdot&space;\cos\omega_{1})\cdot&space;z^{-2}-2\cdot\lambda^{3}\cdot(\cos\omega_{0}&space;&plus;&space;\cos\omega_{1})\cdot&space;z^{-3}&plus;\lambda^{4}\cdot&space;z^{-4})

hence the CCDE is

![equation](http://latex.codecogs.com/gif.latex?y_{n}-2\cdot\lambda\cdot(\cos\omega_{0}&space;&plus;&space;\cos\omega_{1})\cdot&space;y_{n-1}&plus;2\cdot\lambda^{2}\cdot(1&space;&plus;&space;2\cdot&space;\cos\omega_{0}\cdot&space;\cos\omega_{1})\cdot&space;y_{n-2}-2\cdot\lambda^{3}\cdot(\cos\omega_{0}&space;&plus;&space;\cos\omega_{1})\cdot&space;y_{n-3}&plus;\lambda^{4}\cdot&space;y_{n-4}=x_{n}-2\cdot(\cos\omega_{0}&space;&plus;&space;\cos\omega_{1})\cdot&space;x_{n-1}&plus;2\cdot(1&space;&plus;&space;2\cdot&space;\cos\omega_{0}\cdot&space;\cos\omega_{1})\cdot&space;x_{n-2}-2\cdot(\cos\omega_{0}&space;&plus;&space;\cos\omega_{1})\cdot&space;x_{n-3}&plus;&space;x_{n-4}) 

![Filter in Matlab](https://github.com/erithion/antilore/raw/master/doc/matlab_cut_2freq_filter_modulated.png  "Filter in Matlab")

## VLC plugin
*TBD*
