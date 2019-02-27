function [copy, copy_lab, De, copy_extraction, copy_rgb] = master2copy(master,  noise_range, noise, exctract_ranges_num, DE_range)
%    master2copy(master,master_lab,  ranges_number,noise_type, noise,
%    ectract_ranges_num)
% This function creates a copy of the master color and returns:
% - copy spectra
% - copy lab
% - copy RGB
% - DE between master and the copy
% - the copy extraction 
if nargin < 2
    disp("usage: master2copy(master,master_lab,noise, exctract_ranges_num)")
    return;
end

copy_extraction = [];
copy= zeros(size(master));
master_lab = roo2lab(100*master', 'D65/10', (380:1:800));
%master_lab = roo2lab(master', 'D65/10', (380:1:800));

number_of_samples = size(master, 2);

% DE range choice
switch DE_range
    case 1
        % rule 1
        min = 1;
        max = 2;
    case 2
        % rule 2
        min = 2;
        max = 3.5;
    case 3
        % rule 3
        min = 3.5;
        max = 5;       
    case 4
        % rule 4
        min = 5;
        max = 7; %8        
    otherwise
        disp("Range not allowed!")
        return;
end

for i = 1:number_of_samples
    vector = master(:,i);
    n_flag = false;
    bad_n = 0;
    % while the DeltaE doesn not respect the DE range
     while (n_flag == false)
         % add noice with percentage --> noise
         n_vector = add_noise(vector,noise_range, noise);
         lab = roo2lab(100*n_vector','D65/10',(380:1:800));
         % euclidian distance
         DE = de(master_lab(i,:), lab);
         if DE >= min && DE <= max
             copy(:,i) = n_vector;
             n_flag = true;
         else
             bad_n = bad_n + 1;
             if bad_n > 100

             end
         end
 
    end
end

% lab and RGB coordinates
copy_lab= roo2lab(100*copy', 'D65/10', (380:1:800));
copy_rgb = roo2rgb(100*copy', 'srgb',(380:1:800));

% euclidian distance for all master - copy
De = euclidian_d(master_lab, copy_lab);

% copy extraction
for i = 1:1: size(copy,2)
    copy_extraction = [copy_extraction; feature_extraction(copy(:, i),exctract_ranges_num)];
end
    