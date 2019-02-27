function f_inputs = fuzzy_inputs(L, C, H, delta, copies)
%    fuzzy_inputs(L, C, H, delta, copies)
% This function creates the input for the fuzzy set
    if nargin < 5
         disp("usage:  fuzzy_inputs(L, C, H, delta, copies)")
        return
    end
    if size(L,1) ~= size(C,1) || size(L,1) ~= size(H,1)
        disp("Different size of array")
        return 
    end
    if size(L,1)*copies ~= size(delta,1)
        disp("delta array and number of copies are not equal")
        return 
    end
    f_inputs = [];
    for i = 1:copies
        f_inputs = [f_inputs; L, C, H];
    end
    f_inputs = [f_inputs, delta];
end
