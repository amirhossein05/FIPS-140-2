function [is_random, p_value, num_ones] = Monobit(sequence)
    % Perform monobit test
    num_ones = sum(sequence);
    n = length(find(sequence==0));
    S = abs(num_ones - n);
    p_value = erfc(S / sqrt(2*n));
    
    % Determine if sequence is random
    if p_value < 0.01
        is_random = false;
    else
        is_random = true;
    end
    
    % Plot probability distribution function
%     max_ones = length(sequence);
%     x_values = 0:max_ones;
%     binomial_prob = binopdf(x_values, length(sequence), 0.5); % Assuming fair coin (p=0.5)
%     
%     figure;
%     bar(x_values, binomial_prob);
%     xlabel('Number of Ones');
%     ylabel('Probability');
%     title('Probability Distribution of Number of Ones in Sequence');
%     grid on;
%     
%     % Mark specific points on the plot
%     hold on;
%     markers = [9725, 10275]; % Values to mark on the plot
%     for i = 1:length(markers)
%         marker_idx = find(x_values == markers(i));
%         plot(x_values(marker_idx), binomial_prob(marker_idx), 'ro', 'MarkerSize', 10);
%     end
%     hold off;
end
