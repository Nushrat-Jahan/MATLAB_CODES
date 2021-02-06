close all;
clc;
f=5;
f2=10;
x=[ 1 1 0 0 1 0 1 0];
nx=size(x,2);
i=1;
while i<nx+1
    t=i:0.001:i+1;
    if x(i)==1
        ask=sin(2*pi*f*t);
        fsk=sin(2*pi*f*t);
        psk=sin(2*pi*f*t);
    else 
        ask=zeros(size(t));
        fsk=sin(2*pi*f2*t);
        psk=sin(2*pi*f*t+pi);
    end
    subplot(3,1,1);
    plot(t,ask);
    hold on;
    grid on;
    title('Amplitude Shift Key');
    axis([1 10 -1 1]);
    subplot(3,1,2);
    plot(t,fsk);
    hold on;
    grid on;
    title('Frequency Shift Key');
    axis([1 10 -1 1]);
    subplot(3,1,3);
    plot(t,psk);
    hold on;
    grid on;
    title('Phase Shift Key');
    axis([1 10 -1 1]);
    i=i+1;
end