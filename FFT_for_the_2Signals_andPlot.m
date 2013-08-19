function [ f1, wave_fft_origin,f2, wave_fft_noise  ] = FFT_for_the_2Signals_andPlot(  y_original , fs1  , y_noiseAdd , fs2  )
   
    n1=length(y_original)-1; 
    f1=0:fs1/n1:fs1;
    wave_fft_origin=abs(fft(y_original)).^2;     
    n2=length(y_noiseAdd)-1; 
    f2=0:fs2/n2:fs2;
    wave_fft_noise=abs(fft(y_noiseAdd)).^2;  
    figure(1);
    plot (f1,wave_fft_noise,'red', f2,wave_fft_origin, 'DisplayName', 'f1,wave_fft_noise,''red'', f2,wave_fft_origin'); 
    

end

