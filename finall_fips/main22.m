%% Define your sequence here (0s and 1s)
% sequence = randi([0 1],1,20000);
clc
clear
close all force
%% ------------------- Initialization -------------------
k = 512;
n_p = 1024;
t = 50;
sum_diagonal = 0;       % Sum diagonal
iter = 0;               % Number of iterations required to find a matrix suitable for systematizing.
%% ------------------- Transform to systematic form -------------------
%%%%%%%%%%%%% Modify Lower of Identity Part %%%%%%%%%%%%%
while sum_diagonal ~= n_p-k  % Check it is systematic or not.
    sum_diagonal = 0;
    j = 0;
    H = randi([0, 1], n_p-k, n_p); % Generate random parity-check matrix
    H_non_sys = H;
    onesD = [];
    for i = n_p-k+1 : n_p
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
    diagonal = diag(H(1:n_p-k,n_p-k+1:n_p));
    sum_diagonal = sum(diagonal);
    iter = iter +1;
end
%%%%%%%%%%%%% Modify Upper of Identity Part %%%%%%%%%%%%%
col = n_p;
for i = n_p-k : -1 : 1
    onesU = find(H(1:i-1,col) == 1);
    for j_1 = 1:size(onesU,1)
        H(onesU(j_1),:) = mod(H(onesU(j_1),:) + H(i,:) ,2);
    end
    col = col - 1;
end
%% ------------------- Validation -------------------
P = H(1:n_p-k,1:n_p-k);
I = eye(k);
G = [I P'];
%%
r_p = randi([0 1],1,k);
%%
row_number = 12;
G_share_1 = zeros(row_number,n_p);
for i = 1:row_number
    index_G = find(r_p==1);
    for j = 1:size(index_G,2)
        G_share_1(i,:) = mod(G(index_G(j),:)+G_share_1(i,:),2);
    end
    r_p = circshift(r_p,1);
end
%%
G_share_2 = repmat(G_share_1,43,1);

% Remove the last row to get a 512x1024 matrix
G_share_2 = G_share_2(1:512,:);
%%
r_p = randi([0 1],1,k);
% e = generate_random_binary_vector(n,t);
pre_pub = mod(r_p*G_share_2,2);
len = length(pre_pub);
while len <= 20000
    r_p = randi([0 1],1,k);
    %     e = generate_random_binary_vector(n,t);
    tempt_seq2 = mod(r_p*G_share_2,2);
    pre_pub = [pre_pub tempt_seq2];
    len = length(pre_pub);
end
%%
x_p=zeros(20000,1);
count_p = zeros(length(x_p),1);
result_p = zeros(length(x_p),1);
n_p=1;
a_p=0;
bit_p=1;
r_p = 4;
%%
onee1_p=0;
zeroo1_p=0;
onee2_p=0;
zeroo2_p=0;
onee3_p=0;
zeroo3_p=0;
onee4_p=0;
zeroo4_p=0;
onee5_p=0;
zeroo5_p=0;
onee6_p=0;
zeroo6_p=0;
%%  RUN test

pre_pub = pre_pub(1:20000);
for i=2:length(pre_pub)
    if pre_pub(i-1)~=  pre_pub(i)
        count_p(i-1,1)= 1;
    end
end
n_p=1;
a_p=0;
bit_p=1;


for d=1:length(pre_pub)
    a_p=a_p+1;
    if  count_p(d,1)== 1
        result_p(n_p,1)=a_p;

        bit_p=xor(bit_p,1);
        result_p(n_p,2)=bit_p;
        a_p=0;
    end
    if a_p == 0
        n_p=n_p+1;
    end
end


for u=1:n_p-1
    if result_p(u,1)==1
        if result_p(u,2)==1
            onee1_p = onee1_p+1;
        end
        if result_p(u,2)==0
            zeroo1_p = zeroo1_p+1;
        end
    end
    %
    if result_p(u,1)==2
        if result_p(u,2)==1
            onee2_p = onee2_p+1;
        end
        if result_p(u,2)==0
            zeroo2_p = zeroo2_p+1;
        end
    end
    %
    if result_p(u,1)==3
        if result_p(u,2)==1
            onee3_p = onee3_p+1;
        end
        if result_p(u,2)==0
            zeroo3_p = zeroo3_p+1;
        end
    end
    %
    if result_p(u,1)==4
        if result_p(u,2)==1
            onee4_p = onee4_p+1;
        end
        if result_p(u,2)==0
            zeroo4_p = zeroo4_p+1;
        end
    end

    %
    if result_p(u,1)==5
        if result_p(u,2)==1
            onee5_p = onee5_p+1;
        end
        if result_p(u,2)==0
            zeroo5_p = zeroo5_p+1;
        end
    end

    %
    if result_p(u,1)>=6
        if result_p(u,2)==1
            onee6_p = onee6_p+1;
        end
        if result_p(u,2)==0
            zeroo6_p = zeroo6_p+1;
        end
    end


    if result_p(u,1)==26
        if result_p(u,2)==1
            onee26 = 1
        end
        if result_p(u,2)==0
            zeroo26 = 0
        end
    end
end
