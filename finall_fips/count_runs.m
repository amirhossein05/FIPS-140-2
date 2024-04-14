
function [num_runs, run_count] = count_runs(binary_sequence, run_length)
    num_runs = 0;
    run_count = [];
    current_run = 0;
    for i = 1:length(binary_sequence)
        if binary_sequence(i) == 1
            current_run = current_run + 1;
        else
            if current_run >= run_length
                num_runs = num_runs + 1;
                run_count = [run_count, current_run];
            end
            current_run = 0;
        end
    end
    if current_run >= run_length
        num_runs = num_runs + 1;
        run_count = [run_count, current_run];
    end
end

function expected = expected_runs(N, run_length)
    p = 0.5;
    expected = 2 * (N - run_length + 1) * p^run_length * (1 - p)^2;
end
