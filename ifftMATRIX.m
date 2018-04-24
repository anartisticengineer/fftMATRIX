%{
    The IFFT Matrix Function to perform the Inverse FFT with the same
    method as the 'fftMATRIX' function.
    Justin Johnson
    4/24/18
%}
function [ xn_out ] = ifftMATRIX( X_in )
    if ~isvector(X_in)
        error('Input X_in must be a vector');
    end
    
    %get length of input
    N = length(X_in);
    
    if ((floor(log2(N)) - log2(N)) ~= 0)
        error('Input must be a power of two');
    end
    
    %setup matrices containing twiddle factor rotations
    wn_even = exp(((2*pi*1j)/N)*(0:2:N-1).*(0:N-1)'); %(2k)*n
    wn_odd = exp(((2*pi*1j)/N)*(1:2:N-1).*(0:N-1)'); %(2k+1)*n
    xn_even = X_in(1:2:N).*wn_even; 
    xn_odd = X_in(2:2:N).*wn_odd;
    %get time-domain waveform
    
    %Note: OUTPUT WILL BE COMPLEX. You can extract the real/imaginary parts
    %as needed with Matlab's built-in 'real' or 'imag' functions.
    
    xn_out = (1/N)*((sum(xn_even,2) + sum(xn_odd,2))');
end

