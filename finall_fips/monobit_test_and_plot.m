function monobit_test_and_plot(sequence)
    % Perform monobit test
    num_ones = sum(sequence);
    n = length(sequence);
    S = abs(num_ones - n/2);
    p_value = erfc(S / sqrt(2*n));
    
    % Determine the result based on the p-value
    if p_value < 0.01
        result = 'Rejected'; % Not random
    else
        result = 'Accepted'; % Random
    end
    
    % Plot probability distribution
    figure;
    histogram(sequence);
    xlabel('Number of Ones');
    ylabel('Probability');
    title('Probability Distribution of Sequence vs. Number of Ones');
    
    % Display monobit test result
    disp(['Monobit Test Result: ' result]);
end
