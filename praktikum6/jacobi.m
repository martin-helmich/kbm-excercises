function [ j ] = jacobi( e )

j = diag(4./(exp(2.*e).*(1./exp(2.*e) + 1).^2));

end

