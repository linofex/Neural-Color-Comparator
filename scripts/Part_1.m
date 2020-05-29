clear all
load("IS_dataset.mat");
load('200_indexes.mat');

addpath(genpath('optprop'));
rng(999);
master_project = spectra(:,indici_veri);
master_project = spectra;
disp("**********************");
disp("PART 1");
disp("**********************");
disp("Copies generation")
master = master_project;
master_rgb = roo2rgb(100*master', 'srgb', (380:1:800));
master_lab = roo2lab(master', 'D65/10', (380:1:800));
master_lab_100 = roo2lab(100*master','D65/10', (380:1:800));
master_extr = [];

for i = 1:1:size(master,2)   
    master_extr = [master_extr; feature_extraction(master(:,i),10)];
end

num_copies = 12;
noise_intervals = 10;
extraction_intervals = 10;
de_ranges = 4; 
range = 1;
target_de = [];
copy_rgb = [];
data_set = [];

for i = 1:num_copies
     if (i <= num_copies/de_ranges)
         range = 1;
     elseif (i <= 2*num_copies/de_ranges)
          range = 2;
     elseif (i <= 3*num_copies/de_ranges)
          range = 3;
     elseif (i <= 4*num_copies/de_ranges)
          range = 4;
     end
     
     [copy, copy_lab, de, ext, c_rgb] = master2copy(master,noise_intervals,10*range,extraction_intervals,range);

     target_de = [target_de; de];
     m_c = [master_extr, ext];
     data_set = [data_set; m_c]; 
     copy_rgb = [copy_rgb; c_rgb];
     out = sprintf('Copy number: %d', i);
     disp(out);
end
disp("Input normalization")
input_normalized = normalize(data_set);

features_to_select = 8;
indices = zeros(1,features_to_select);
indices(features_to_select/2) = size(input_normalized,2) + 1;

disp("Features selection")
while indices(features_to_select/2) > size(input_normalized,2)/2 || indices(features_to_select/2+1) < size(input_normalized,2)/2
    [fs, h] = feature_selection(input_normalized, target_de, features_to_select);
    indices = find(fs);
end

disp("Neural Network Fitting")
nn_input = input_normalized(:, fs);
p = fitNN(nn_input,target_de, 'trainlm',  10);

edge = [1 2 3.5 5 8];
histogram(target_de,edge)
