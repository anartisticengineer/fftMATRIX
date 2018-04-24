# fftMATRIX

The algorithm here calculates the Discrete Fourier Transform (DFT) of a given discrete time domain input signal. With the function being a Fast Fourier Transform (FFT) as opposed to a normal DFT, this requires that the input signal vector be a length of a power of 2 (2,4,8,16,32,etc.).

This function will only accept vector inputs that fit this length criteria.
This algorithm takes advantage of the matrix operations that are provided in Matlab, and performs the calculations without any loops, hopefully speeding up the algorithm.

UPDATE - 4/24/17: I have added a similar function for the inverse FFT. Since the output will still be a complex array, even in the time domain, you can extract the real or imaginary parts with Matlab's built-in functions: 'real' and 'imag'.
