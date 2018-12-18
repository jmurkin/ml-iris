function sim = gaussianKernel(x1, x2, sigma)
%convert x1 and x2 to column vectors
x1 = x1(:); x2 = x2(:);
sim = exp(-(((norm(x1 - x2))^2)/(2*sigma^2)));

end
