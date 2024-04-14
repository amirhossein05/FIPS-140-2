function poker_test(sequence)
% Calculate the number of bits in each poker hand (4 bits per hand)
M = 4; % (4 bits per hand)
num_hands = floor(length(sequence) / M);

% Initialize an array to store the frequency of each poker hand
poker_freq = zeros(1, num_hands); % 16 possible poker hands

% Count the frequency of each poker hand in the sequence
for i = 1:num_hands
    hand_bits = sequence((i-1)*4+1:i*4);
    poker_freq(i) = sum(hand_bits) / M;
    %         hand_value = bi2de(hand_bits, 'left-msb') + 1; % Convert binary to decimal
    %         poker_freq(hand_value) = poker_freq(hand_value) + 1;
end

% Calculate the expected frequency for each poker hand (for a random sequence)
% expected_freq = num_hands / M;
expected_freq = 1/2;

% Calculate the chi-square value
% chi_square = sum((poker_freq - expected_freq).^2 / expected_freq);
chi_square = 4 * M * sum((poker_freq - expected_freq).^2 );

% Calculate the p-value using the chi-square distribution
% p_value = 1 - chi2cdf(chi_square, 2); % Degrees of freedom = 16 - 1 = 15
p_value = gammainc(chi_square/2,num_hands/2,'upper');

% Determine if the sequence passes the poker test
if p_value < 0.01
    result = 'Rejected'; % Not random
else
    result = 'Accepted'; % Random
end

% Display the test result
disp(['Poker Test Result: ' result]);

% Plot the probability distribution function f(x) with chi-square value
x = 0:0.1:30; % Range of chi-square values for plotting
y = chi2pdf(x, 15); % Chi-square PDF with 15 degrees of freedom
figure;
plot(x, y, 'b', 'LineWidth', 1.5);
%     hold on;
%     plot(chi_square, chi2pdf(chi_square, 15), 'ro', 'MarkerSize', 10);
xlabel('Chi-Square Value');
ylabel('Probability Density');
title(' Poker Test ');
%     legend('Chi-Square PDF', 'Test Chi-Square Value');
grid on;
%     hold off;
end
