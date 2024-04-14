function [pValue, isRandom] = monobitTest(sequence)
    % Initialize variables
    n = length(sequence);
    onesCount = sum(sequence == 1);
    zerosCount = n - onesCount;
    
    % Calculate expected counts
    expectedOnes = n / 2;
    expectedZeros = n / 2;
    
    % Calculate chi-square statistic
    chiSquare = (onesCount - expectedOnes)^2 / expectedOnes + (zerosCount - expectedZeros)^2 / expectedZeros;
    
    % Calculate p-value
    pValue = 1 - gammainc(n/2, chiSquare/2);
    
    % Determine if the sequence is random
    isRandom = pValue > 0.05; % Assuming a significance level of 0.05
end
