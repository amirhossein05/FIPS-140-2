clc
clear all
close all

f = zeros(1,16);
r = 4;
x=zeros(20000,1);
y=zeros(20000,1);
init=0.00001;
A=9725;
B=10275;


%%
x(1)=init;
y(1)=init;

%% MAP DEFENITION
     
    for n=1:1:20000
    x(n+1)= 3.988*x(n)*(1-x(n));   %logistic
    end
    
    
%   for n=1:1:20000
%     x(n+1)= 3.7833*sin(pi*x(n));   %sine
%     end



%     for n=1:1:20000
%                if x(n)>=0
%     x(n+1)= 1.90001*x(n)-0.5;   %bernoulli
%          end 
%          if  x(n)<0
%     x(n+1)=1.90001*x(n)+0.5;   %bernoulli
%          end
%     end



    
%% A to D


trshold = sum(x)/20000;
% trshold2 = sum(y)/20000;

for n=1:1:20000
    
    if  x(n+1) >=  trshold
        b1(n)=1;
        end
    if  x(n+1) <  trshold
      b1(n)=0;  
    end

end

%% mono bit test

 count = sum(b1);



A
count
B

