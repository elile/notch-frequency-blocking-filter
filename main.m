%
%  This project was designed by: Eli Levi.
%  I would like to thank Mr. David Marcelo Martin for his help and his guidance.
%
%
%  ******************* main( )  **********************************

clear all;
clc;
% ------- this code call one time in the beggening ---------
% [ y , fs ] = wavread('thinking.wav'); 
% sound(y,fs);
% y_with_noise = add_noise(y,fs);
% wavwrite(y_with_noise,fs,'thinking_with_noise.wav');
% sound(y_with_noise,fs);
% --------------------------------------------------------------------------

global    y1;
global    y2;

% -------we start here, so i read the 2 sound 
[ y_original , fs1 ] = readAndSound('thinking.wav'); 
[ y_noiseAdd , fs2 ] = readAndSound('thinking_with_noise.wav');

% ------- if we want to see the noise , need to do fft 
[ f1,wave_fft_origin,f2,wave_fft_noise ]=FFT_for_the_2Signals_andPlot(y_original , fs1  , y_noiseAdd , fs2 );

% -------- found the 2 max values , this is the noise
 Noise1 =   420;
 Noise2 =   1730;
 
 % -------normalized noise 
 Fnoise1 = Noise1/fs1;
 Fnoise2 = Noise2/fs2;

 % -------theta normal freq..
 thetaNoise1=(Fnoise1*2*pi);
 thetaNoise2=(Fnoise2*2*pi);
 
% -------- real time filter
  [h1,p1,y1]=notch(thetaNoise1,y_noiseAdd);
  [h2,p2,y2]=notch(thetaNoise2,y1);

  % --------we can play only the noise
    %soundNoise(Noise2);
    %soundNoise(Noise1);
   

 sound(y2,fs2);
 figure(1);
 hold on;
 plot (0:fs2/(length(y2)-1):fs2,abs(fft(y2)).^2,'black');% in black is the final signal filtered
 
 % print the fvtool of H(z) function 
 [b1,a1] = zp2tf(h1,p1,1);
 [b2,a2] = zp2tf(h2,p2,1);
 fvtool(b1,a1,b2,a2);
 
 % than we see the Normalized-GD
 Normalized_GD=831+210; %adding from 2 filters
 real_GD = Normalized_GD/fs1;
 real_GD




