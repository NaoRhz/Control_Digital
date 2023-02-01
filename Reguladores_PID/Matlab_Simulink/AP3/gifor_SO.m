function [gi] = gifor_SO(SO)
    gi = sqrt(((log(SO/100.0)^2))/((pi^2)+(log(SO/100.0)^2)));
end
