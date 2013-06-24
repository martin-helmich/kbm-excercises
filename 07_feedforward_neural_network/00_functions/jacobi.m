function[j] = jacobi(e)
    % TODO: This still contains the hardcoded derivative of the tansig
    % function!
    j = diag(4./(exp(2.*e).*(1./exp(2.*e) + 1).^2));
end

