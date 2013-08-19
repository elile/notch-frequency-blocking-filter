function yn=add_noise(y,Fs)
    n=[0:length(y)-1]';
    r=rand();
    rrr=2+2*rand();
    c=cos(2*pi*440*r*n/Fs)+cos(2*pi*440*rrr*n/Fs);
    yn=y+c/17;
    yn=yn/max(yn);
end 