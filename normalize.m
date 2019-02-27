function normalized_array = normalize(input)
%NORMALIZE 
%This function normalizes the input dataset with Zscore function
    normalized_array = [];
    for i = 1:size(input, 1)
        normalized_array = [normalized_array; zscore(input(i, :))];
    end