function c_perc = c2cperc(L,C)
    if size(L,1) ~= size(C,1)
        c_perc = [];
        return
    end
    c_perc = zeros(size(L,1),1);
    for i = 1:size(L,1)
        C_max = sqrt((1-((L(i) - 50)^2/50^2)) *127^2);

        c_perc(i) = (C(i)/C_max)*100;
    end
end

