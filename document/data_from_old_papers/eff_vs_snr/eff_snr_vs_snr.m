% load data
load intel-expt-8-fsf-shape

% Make in col-maj order and remove src/dest
fsf = intel_expt_8_fsf_shape.';
fsf = fsf(3:end, :);
% Undo conversion to SNR
fsf = 10.^(fsf/20);

% Num of subcarriers
NSUB = size(fsf,1);

% normalize
mags = sqrt(sum(fsf.^2)/NSUB);
fsf = fsf./repmat(mags, NSUB, 1);
%plot(sort(fsf));

%plot(db(sqrt(30)*sort(fsf)), '.')

snr_db = 0:50;
snr = 10.^(snr_db/20);
result = NaN(length(snr_db), size(fsf, 2));

figure(1);
indices = [11 41 43 54 61 69];
denoms = 1;
for j = 1:length(denoms)
    for i=1:length(snr)
        s = snr(i);
        result(i,1:length(indices)) = compute_eff_snr(fsf(:,indices)*s, denoms(j));
    end
%    subplot(2,2,j)
    plot(snr_db, db(result), snr_db, repmat(4, size(snr_db)), 'k--', snr_db, repmat(8, size(snr_db)), 'k--')
    xlabel('Packet SNR (dB)');
    ylabel('Effective SNR (dB)');
    xlim([0 30]);
    ylim([0 10]);
end

output = [snr_db.' db(result)];
save('eff_vs_snr.txt', 'output', '-ascii');