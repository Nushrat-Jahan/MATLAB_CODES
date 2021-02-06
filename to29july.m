fs=40e3;
fc=4e3;
t=0:1/fs:0.001;
x=0.5*sin(2*pi*fc*t);

n=8;
L=(2^n)-1;
delta=(max(x)-min(x))/L;
xq=min(x)+(round((x-min(x))/delta)).*delta;
subplot(3,1,1);
plot(t,x);
subplot(3,1,2);
stem(t,x,'R');
subplot(3,1,3);
stairs(t,xq,'b');

