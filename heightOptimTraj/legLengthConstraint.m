function [c, ceq] = legLengthConstraint(x,z)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
c = x.^2+z.^2-1.21;
ceq =[];
end

