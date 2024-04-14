
clc
clear all



x=zeros(20000,1);
count = zeros(length(x),1);
result = zeros(length(x),1);
n=1;
a=0;
bit=1;
r = 4;
init=0.00001;
%%
onee1=0;
zeroo1=0;
onee2=0;
zeroo2=0;
onee3=0;
zeroo3=0;
onee4=0;
zeroo4=0;
onee5=0;
zeroo5=0;
onee6=0;
zeroo6=0;

%%
A1=2343;      %1
B1=2657;

A2=1135;      %2
B2=1365;

A3=542;       %3
B3=708;

A4=251;       %4
B4=373;

A5=111;       %5
B5=201;

A6=111;       %6
B6=201;



  x(1)=init;
  
    
%%   chaos Maps
    
    
%     for h=1:1:20000
%     x(h+1)= 3.988*x(h)*(1-x(h));   %logistic
%     end

    
    
     for h=1:1:20000
    x(h+1)= 3.7833*sin(pi*x(h));   %sine
    end



%      for h=1:1:20000
%                if x(h)>=0
%     x(h+1)= 1.90001*x(h)-0.5;   %bernoulli
%          end 
%          if  x(h)<0
%     x(h+1)=1.90001*x(h)+0.5;   %bernoulli
%          end
%      end
    
     
     
%%  A to D

trshold = sum(x)/20000;

for h=1:1:20000
    
    if  x(h+1) >=  trshold
        cahos_seq(h)=1;
        end
    if  x(h+1) <  trshold
      cahos_seq(h)=0;  
    end  
end


%%  RUN test


for i=2:length(cahos_seq)
    if cahos_seq(i-1)~=  cahos_seq(i)
       count(i-1,1)= 1;   
    end
end
n=1;
a=0;
bit=1;


for d=1:length(cahos_seq)
    a=a+1;
    if  count(d,1)== 1
        result(n,1)=a;
      
            bit=xor(bit,1);      
            result(n,2)=bit;        
            a=0;
    end
    if a == 0
        n=n+1;     
    end
end


for u=1:n-1
   if result(u,1)==1
       if result(u,2)==1
           onee1 = onee1+1;
       end
       if result(u,2)==0
          zeroo1 = zeroo1+1;
       end
   end  
%    
     if result(u,1)==2
       if result(u,2)==1
           onee2 = onee2+1;
       end
       if result(u,2)==0
          zeroo2 = zeroo2+1;
       end
     end
%    
       if result(u,1)==3
       if result(u,2)==1
           onee3 = onee3+1;
       end
       if result(u,2)==0
          zeroo3 = zeroo3+1;
       end
       end
%    
         if result(u,1)==4
       if result(u,2)==1
           onee4 = onee4+1;
       end
       if result(u,2)==0
          zeroo4 = zeroo4+1;
       end
         end
   
%          
         if result(u,1)==5
       if result(u,2)==1
           onee5 = onee5+1;
       end
       if result(u,2)==0
          zeroo5 = zeroo5+1;
       end
         end
   
%          
           if result(u,1)>=6
       if result(u,2)==1
           onee6 = onee6+1;
       end
       if result(u,2)==0
          zeroo6 = zeroo6+1;
       end
           end     
           
           
                  if result(u,1)==26
       if result(u,2)==1
           onee26 = 1
       end
       if result(u,2)==0
          zeroo26 = 0
       end
                  end 
           
                  
              
end



%% Plot  
 
 


% A6
% % zeroo2
% onee6
% B6



