function ret = compute_eff_snr(csi, denom)
    error(nargchk(2,2,nargin));
    num_coeffs = size(csi, 1);
    if num_coeffs ~= 30
        error('Bad dimensions on csi matrix');
    end
    
    snrs = csi.^2;
    bers = qfunc(sqrt(snrs / denom));
    ret = qfuncinv(mean(bers))*sqrt(denom);
end