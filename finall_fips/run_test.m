function run_test(bits)
    % Perform Run test
    runs = diff([0, find(diff(bits) ~= 0), numel(bits)]);
    num_runs = length(runs);
    
    % Determine acceptance regions for different run lengths
    acceptance_regions = [2315 2685; % Length of runs 1
                          1114 1386; % Length of runs 2
                          527 723;   % Length of runs 3
                          240 384;   % Length of runs 4
                          103 209;   % Length of runs 5
                          103 209];  % Length of runs 6 or greater
                      
    % Check if each run length falls within its acceptance region
    passed_test = true;
    for i = 1:num_runs
        if runs(i) <= 6
            length_idx = runs(i);
        else
            length_idx = 6;
        end
        
        if runs(i) < 1
            continue; % Skip zero-length runs
        end
        
        if runs(i) >= 1 && runs(i) <= 6
            if runs(i) < acceptance_regions(length_idx, 1) || runs(i) > acceptance_regions(length_idx, 2)
                passed_test = false;
                break;
            end
        else
            if runs(i) < acceptance_regions(6, 1) || runs(i) > acceptance_regions(6, 2)
                passed_test = false;
                break;
            end
        end
    end
    
    % Plot the probability distribution function (PDF)
    unique_runs = unique(runs);
    counts = histc(runs, unique_runs);
    pdf_values = counts / sum(counts);
    
    % Plotting the PDF for each run length
    figure;
    for i = 1:length(unique_runs)
        subplot(length(unique_runs), 1, i);
        bar(unique_runs(i), pdf_values(i));
        xlabel(['Length of Runs: ' num2str(unique_runs(i))]);
        ylabel('Probability');
        title(['PDF for Length of Runs: ' num2str(unique_runs(i))]);
    end
    
    % Display results
    disp(['Run Test Result: ' num2str(passed_test)]);
end
