%x = [0 1 1 0 1 0 1]
%Digital signal plotting
Transmitted_Message='Nus'
x = asc2bin(Transmitted_Message);
bp = 1
bit = [];
for n=1:1:length(x)
    if x(n)==1;
        se = 3*ones(1, 100);
    else x(n)==0
        se = zeros(1,100);
    end
    bit = [ bit se ];
end
t1 = bp/100:bp/100:100*length(x)*(bp/100);

subplot(4,1,1);
plot(t1,bit,'Linewidth',2.5);
grid on;
%axis([0 bp*length(x) -.5 1.5]);
ylabel('amplitude(volt)');
xlabel('time(sec)');
title('Transmetting signal at Transmitter');
%b = bin2asc(x)

%FSK modulation using sin
A1=1;
br=1/bp;
f1=br*4;
f2=br*10;
t2=bp/99:bp/99:bp;
ss=length(t2);
m=[];
for (i=1:1:length(x))
 if (x(i)==1)
 y=A1*sin(2*pi*f1*t2);
 else
 y=A1*sin(2*pi*f2*t2);
 end
 m=[m y];
end
t3=bp/99:bp/99:bp*length(x);
subplot(4,1,2);
plot(t3,m);
axis([ 0 bp*length(x) -1.3 1.3]);
xlabel('time(sec)');
ylabel('amplitude(volt)');
title('Transmitting signal after FSK Modulation');

%Adding noise
mr=awgn(m,18);
subplot(4,1,3);
plot(t3,mr);
axis([ 0 bp*length(x) -1.3 1.3]);
xlabel('time(sec)');
ylabel('amplitude(volt)');
title('Received signal at Receiver');

%FSK demodulation
mn=[];
for n=ss:ss:length(mr)
 t=bp/99:bp/99:bp;
 y1=A1*sin(2*pi*f1*t);
 y2=A1*sin(2*pi*f2*t);
 mm=y1.*mr((n-(ss-1)):n);
 mmm=y2.*mr((n-(ss-1)):n);
 t4=bp/99:bp/99:bp;
 z1=trapz(t4,mm);
 z2=trapz(t4,mmm) ;
 zz1=round((2*z1/bp));
 zz2=round((2*z2/bp));
 if(zz1>A1/2);
 a=1;
 else (zz2 >A1/2);
 a=0;
 end
 mn=[mn a];
end
%Digital signal after transmission
bit1=[];
for n=1:1:length(mn)
 if mn(n)==1;
 se1=3*ones(1,100);
 else x(n)==0;
 se1=zeros(1,100);
 end
 bit1=[bit1 se1];
end
t5=bp/100:bp/100:100*length(mn)*(bp/100);
subplot(4,1,4)
plot(t1,bit,'lineWidth',2.5);
grid on;
ylabel('amplitude(volt)');
xlabel(' time(sec)');
title('Demodulated signal at Receiver');

%msgbox({'Transmitted_Message- Nus';'Binary information at receiver :';'Received Message';'ans = '; bin2asc(mn)})
%DISPLAYING THE RESULT
disp('Transmitted_Message- Nus')
disp('Binary information at receiver :')
disp('Received Message')
ans = bin2asc(mn)