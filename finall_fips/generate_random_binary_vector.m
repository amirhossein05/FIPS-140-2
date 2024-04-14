function e = generate_random_binary_vector(len, weight)
    % Generate a random binary vector with a specific number of ones
    if weight > len
        error('Number of ones cannot exceed vector length.');
    end
    
    e = zeros(1, len);
    idx_ones = randperm(len, weight);
    e(idx_ones) = 1;
end
