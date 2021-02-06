fs=1000;
t=0:1/fs:1-1/fs;
x1=10*sin(2*pi*(350)*t);
fx1=fft(x1);
fx1=fftshift(fx1)/(fs/2);
f=fs/2*linspace(-1,1,fs);
plot(f,abs(fx1));
