function ret = mean_db(X, n)
error(nargchk(1,2,nargin));
X_lin = 10.^(X/10);
if nargin == 1
    ret = db(mean(X_lin), 'power');
else
    ret = db(mean(X_lin, n), 'power');
end
end