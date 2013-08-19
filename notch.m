function [h,p,yn] = notch( theta0,xn)

    w0Ts=((-2)/(tan(theta0)))+(2*(sqrt(1+(1/(power(tan(theta0),2))))) );
    zeda=0.01;
    yn(1)=xn(1);
    yn(2)=xn(2);
    b2=4+power(w0Ts,2);
    b1=2*power(w0Ts,2)-8;
    b0=b2;
    a2=4-4*zeda*w0Ts+power(w0Ts,2);
    a1=b1;
    a0=power(w0Ts,2)+4*zeda*w0Ts+4;
    for i=3:length(xn)
              yn(i)=(b2*xn(i-2)+b1*xn(i-1)+b0*xn(i)-a2*yn(i-2)-a1*yn(i-1))/a0;
    end
    % calc the transmission h function
       num=[b0 b1 b2];
       den=[a0 a1 a2];
       [h,p]=tf2zp(num,den);
       

end

