%% Define your sequence here (0s and 1s)
% sequence = randi([0 1],1,20000);
clc
clear
close all force
%% ------------------- Initialization -------------------
k = 512;
n = 1024;
t = 50;
sum_diagonal = 0;       % Sum diagonal
iter = 0;               % Number of iterations required to find a matrix suitable for systematizing.
%% ------------------- Transform to systematic form -------------------
%%%%%%%%%%%%% Modify Lower of Identity Part %%%%%%%%%%%%%
while sum_diagonal ~= n-k  % Check it is systematic or not.
    sum_diagonal = 0;
    j = 0;
    H = randi([0, 1], n-k, n); % Generate random parity-check matrix
    H_non_sys = H;
    onesD = [];
    for i = n-k+1 : n
        j = j+1;
        onesD = find(H(j+1:end,i) == 1);
        onesD = onesD + j;
        if H(j,i) == 0
            if ~isempty(onesD)
                H(j,:) = mod(H(j,:)+H(onesD(1),:),2);
                for j_2 = 1:size(onesD,1)
                    H(onesD(j_2),:) = mod(H(j,:) +  H(onesD(j_2),:),2);
                end
            end
        else
            for j_3 = 1:size(onesD,1)
                H(onesD(j_3),:) = mod(H(j,:) +  H(onesD(j_3),:),2);
            end
        end

    end
    diagonal = diag(H(1:n-k,n-k+1:n));
    sum_diagonal = sum(diagonal);
    iter = iter +1;
end
%%%%%%%%%%%%% Modify Upper of Identity Part %%%%%%%%%%%%%
col = n;
for i = n-k : -1 : 1
    onesU = find(H(1:i-1,col) == 1);
    for j_1 = 1:size(onesU,1)
        H(onesU(j_1),:) = mod(H(onesU(j_1),:) + H(i,:) ,2);
    end
    col = col - 1;
end
%% ------------------- Validation -------------------
P = H(1:n-k,1:n-k);
I = eye(k);
G = [I P'];
%%
r = randi([0 1],1,k);
%%
row_number = 12;
G_share_1 = zeros(row_number,n);
for i = 1:row_number
    index_G = find(r==1);
    for j = 1:size(index_G,2)
        G_share_1(i,:) = mod(G(index_G(j),:)+G_share_1(i,:),2);
    end
    r = circshift(r,1);
end
%%
G_share_2 = repmat(G_share_1,43,1);

% Remove the last row to get a 512x1024 matrix
G_share_2 = G_share_2(1:512,:);
%% 
r = randi([0 1],1,k);
e = generate_random_binary_vector(n,t);
cipher_text = mod(r*G_share_2+e,2);
len = length(cipher_text);
while len <= 20000
    r = randi([0 1],1,k);
    e = generate_random_binary_vector(n,t); 
    tempt_seq = mod(r*G_share_2+e,2);
    cipher_text = [cipher_text tempt_seq];
    len = length(cipher_text);
end
%% A to D
trshold = sum(cipher_text(1:20000))/20000;
% trshold2 = sum(y)/20000;

for n=1:1:20000
    
    if  cipher_text(n+1) >=  trshold
        b1(n)=1;
        end
    if  cipher_text(n+1) <  trshold
      b1(n)=0;  
    end

end

%% mono bit test

% count = sum(b1);
% count
%% Poker
f = zeros(1,16);

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
