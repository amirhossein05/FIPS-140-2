clc
clear all
close all


x=zeros(20000,1);
x(1)=0.00001;
f = zeros(1,16);

gama = 1.90001;

%%

      for n=1:1:20000
    x(n+1)= 3.988*x(n)*(1-x(n));   %logistic
    end
    
    
%      for n=1:1:20000
%     x(n+1)= 3.7833*sin(pi*x(n));   %sine
%     end



%      for n=1:1:20000
%                if x(n)>=0
%     x(n+1)= 1.90001*x(n)-0.5;   %bernoulli
%          end 
%          if  x(n)<0
%     x(n+1)=1.90001*x(n)+0.5;   %bernoulli
%          end
%     end


    
%%  A to D
    
    
   
trshold = sum(x)/20000;

for n=1:1:20000
    
    if  x(n) >=  trshold
        b1(n)=1;
        end
    if  x(n) <  trshold
      b1(n)=0;  
    end
end
   




%%  Poker test

    


%  Divide the bit stream into 5000 consecutive 4-bit segments
segments = reshape(b1, 4,5000);
    
% Count the number of occurrences of each of the 16 possible 4-bit values
decimal = bi2de(segments');

for i=1:1:length(decimal)
    
     if decimal(i)== 0
        f(1) = f(1)+1;
    end
       if decimal(i)== 1
        f(2) = f(2)+1;
       end
       if decimal(i)== 2
        f(3) = f(3)+1;
       end
       if decimal(i)== 3
        f(4) = f(4)+1;
       end
       if decimal(i)== 4
        f(5) = f(5)+1;
       end
       if decimal(i)== 5
        f(6) = f(6)+1;
       end
       if decimal(i)== 6
        f(7) = f(7)+1;
       end
       if decimal(i)== 7
        f(8) = f(8)+1;
       end
        if decimal(i)== 8
        f(9) = f(9)+1;
        end
        if decimal(i)== 10
        f(10) = f(10)+1;
        end
        if decimal(i)== 11
        f(12) = f(12)+1;
        end
        if decimal(i)== 12
        f(13) = f(13)+1;
        end
        if decimal(i)== 13
        f(14) = f(14)+1;
        end
        if decimal(i)== 14
        f(15) = f(15)+1;
        end
        if decimal(i)== 15
        f(16) = f(16)+1;
        end
    
end


% Evaluate the Poker Test using a formula that takes into account the number of occurrences of each value
counts = norm(f).^2;
poker_test = ((16/5000) * counts) - (5000)


