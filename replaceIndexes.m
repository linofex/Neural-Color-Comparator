function [newOut, goodIndexes] = replaceIndexes(fuzzy_inputs, out)
%REPLACEINDEXES 
%This function selects the colors that do not require DE adjustment
    goodIndexes = [];
    for i = 1 : size(out, 1)
        % If the input does NOT corresponds to a fuzzy rule, take the index  
        if not((fuzzy_inputs(i,1) < 11) || ...
            (fuzzy_inputs(i,1) > 11 && fuzzy_inputs(i,2) > 50 && (fuzzy_inputs(i,3) < 130 && fuzzy_inputs(i,3) > 50)  && fuzzy_inputs(i,4) > 1.5) || ...
            (fuzzy_inputs(i,1) > 11 && fuzzy_inputs(i,2) > 50 && (fuzzy_inputs(i,3) < 325 && fuzzy_inputs(i,3) > 225) && fuzzy_inputs(i,4) > 0 && fuzzy_inputs(i,4) < 4) || ...
            (fuzzy_inputs(i,1) > 11 && fuzzy_inputs(i,2) > 50 && (fuzzy_inputs(i,3) < 360 && fuzzy_inputs(i,3) > 285) && fuzzy_inputs(i,4) > 0 && fuzzy_inputs(i,4) < 4) || ...
            (fuzzy_inputs(i,1) > 11 && fuzzy_inputs(i,2) < 50 && fuzzy_inputs(i,4) > 0 && fuzzy_inputs(i,4) < 4))
            goodIndexes = [goodIndexes; i];
        end
    end
    % use the DE of the part1 for the indexes goodIndexes
    out(goodIndexes) = fuzzy_inputs(goodIndexes, 4);
    newOut = out;    
end
