function [features_columns, history] = feature_selection(input, target, feature_num)
%FEATURE_SELECTION 
%This function selects FEATURE_NUM features from the input data set
    opt = statset('display', 'iter');
    [features_columns, history] = sequentialfs(@selection_NN, input, target, 'cv', 'none', 'opt', opt,'nfeatures', feature_num);
end
