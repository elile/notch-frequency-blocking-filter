function [ y, fs ] = readAndSound( x )
    [y,fs] = wavread(x);
    sound(y,fs);
end

