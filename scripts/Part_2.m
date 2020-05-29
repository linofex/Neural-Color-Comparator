clear C_perc fuzzy_inputs;
disp("**********************");
disp("PART 2");
disp("**********************");
[L,C,H] = lab2lch(master_lab);
[L_100, C_100, H_100] = lab2lch(master_lab_100);
disp("Calculate the C in percentage")
C_perc = c2cperc(L_100,C_100);
fuzzy_inputs = fuzzy_inputs(L_100, C_perc, H_100, target_de, 12);
fis = readfis('Color_fuzzy_part_2');
disp("Fuzzy inference system evaluation")
out = evalfis(fuzzy_inputs, fis);
disp("Indexes replacement");
[out, goodIndexes] = replaceIndexes(fuzzy_inputs, out);
size(goodIndexes)
features_to_select = 8;
indices_1 = zeros(1,features_to_select);
indices_1(features_to_select/2) = size(input_normalized,2) + 1;
disp("Features selection")
 while indices_1(features_to_select/2) > size(input_normalized,2)/2 || indices_1(features_to_select/2+1) < size(input_normalized,2)/2
     [fs, h] = feature_selection(input_normalized, out, features_to_select);
     indices_1 = find(fs);
 end
 disp("Neural Network Fitting")
 nn_input = input_normalized(:, fs);
 p = fitNN(nn_input, out,'trainlm',  10);