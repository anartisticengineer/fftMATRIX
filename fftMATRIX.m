%{
    fftMATRIX:

    An FFT implementation that uses a Radix-2 Cooley-Tukey Algorithm
    without for loops (only using matrix operations provided in MATLAB).

    -Justin Johnson
    -4/17/18
%}
function [ Xk_out ] = fftMATRIX( x_in )
    %check to see if input is a vector, and if the length is a power of 2
    
    if ~isvector(x_in)
        error('Input x_in must be a vector');
    end
    
    %get length of input
    N = length(x_in);
    
    if ((floor(log2(N)) - log2(N)) ~= 0)
        error('Input must be a power of two');
    end

    %setup matrices containing twiddle factor rotations
    wn_even = exp(((2*pi*-1j)/N)*(0:2:N-1).*(0:N-1)');
    wn_odd = exp(((2*pi*-1j)/N)*(1:2:N-1).*(0:N-1)');
    %split the sequence into even and odd where,...
    %~~~~~~~xn_even = x_in(1:2:N)~~~~~~~~~~~~~;
    %~~~~~~~xn_odd = x_in(2:2:N)~~~~~~~~~~~~~~;
    %...and perform matrix multiplication with even and odd sequences
    Xk_even = x_in(1:2:N).*wn_even; 
    Xk_odd = x_in(2:2:N).*wn_odd;
    %add the even and odd sequences to form the full FFT
    Xk_out = (sum(Xk_even,2) + sum(Xk_odd,2))';
end

