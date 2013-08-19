function [ ] = soundNoise( teder )
Fs = 22000;
t = 0:1/Fs:5;
f = teder;
Y = sin(2*pi*f*t);
sound(Y,Fs)
end

