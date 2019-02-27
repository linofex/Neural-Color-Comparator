function noise = add_noise(input_vector, num_of_intervals, noise)
% add_noise(input_vector, num_of_intervals, noise) 
%This function adds some noise to a color (its spectrum) 
    if nargin < 3
        disp("usage: add_noise(input_vector, num_of_intervals, noise)")
        return;
    end
    
    array_len = size(input_vector, 1);
    noise_vector = zeros(1, array_len);
    elements_for_interval = floor(array_len/num_of_intervals);
    unif_noise = random('unif', -noise/100, noise/100);
    for current_interval = 1:num_of_intervals
        normal_noise = random('normal', 1, 0.1) * unif_noise;
        if current_interval == num_of_intervals
            end_index = array_len;
        else
            end_index = current_interval*elements_for_interval;
        end
        start_index= (current_interval-1)*elements_for_interval + 1; 
        % noise applied to the range
        noise_range = (input_vector(start_index:end_index))' + ((input_vector(start_index:end_index)')*normal_noise);
        noise_vector(start_index:end_index) =  noise_range;
        
        % smoothness operation to reduce the step
        if(current_interval > 1)
                smooth_noise = [];
                % 15% before and 15% after the step
                left_index = floor(start_index - elements_for_interval*15/100);
                right_index  = floor(start_index + elements_for_interval*15/100);
                smooth_noise = smooth(noise_vector(left_index:right_index),20);  
                noise_vector(left_index:right_index) = smooth_noise;
        end
    end
    noise = noise_vector';
end

        