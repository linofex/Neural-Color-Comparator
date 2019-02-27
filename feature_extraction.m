function extraction = feature_extraction(input, ranges_num)
%FEATURE_EXTRACTION 
%This function selects FEATURE_NUM features from the input data set
    if nargin < 2
        disp("usage:  feature_extraction(input, ranges_num)")
        return
    end
    extraction = [];
    input_size = size(input,1);
    elements_for_interval = floor(input_size/ranges_num);
    for current_interval = 1:ranges_num
        if current_interval == ranges_num
            end_index = input_size;
        else
            end_index = current_interval*elements_for_interval;
        end
        start_index= (current_interval-1)*elements_for_interval + 1;
        extraction = [extraction mean(input(start_index:end_index))]; % mean
        extraction = [extraction var(input(start_index:end_index))];  % variance
        extraction = [extraction median(input(start_index:end_index))]; % median
        extraction = [extraction min(input(start_index:end_index))]; %minimum
        extraction = [extraction max(input(start_index:end_index))]; %maximum
        %extraction = [extraction skewness(input(start_index:end_index))];
        extraction = [extraction std(input(start_index:end_index))]; % standard deviation
    end
end

