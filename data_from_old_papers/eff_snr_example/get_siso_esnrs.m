function ret=get_siso_esnrs(csi)
    %% Calc RSSI
    rssi = mean_db(csi);
    
    %% Calc BPSK ESNR
    bpsk_snrs = dbinv(csi);
    bpsk_bers = bpsk_ber(bpsk_snrs);
    bpsk_eber = mean(bpsk_bers);
    fprintf('BPSK: %e\n', bpsk_eber);
    bpsk_esnr = db(bpsk_berinv(bpsk_eber), 'pow');

    %% Calc QPSK ESNR
    qpsk_snrs = dbinv(csi);
    qpsk_bers = qpsk_ber(qpsk_snrs);
    qpsk_eber = mean(qpsk_bers);
    fprintf('QPSK: %e\n', qpsk_eber);
    qpsk_esnr = db(qpsk_berinv(qpsk_eber), 'pow');

    %% Calc 16-QAM ESNR
    qam16_snrs = dbinv(csi);
    qam16_bers = qam16_ber(qam16_snrs);
    qam16_eber = mean(qam16_bers);
    fprintf('16-QAM: %e\n', qam16_eber);
    qam16_esnr = db(qam16_berinv(qam16_eber), 'pow');

    %% Calc 64-QAM ESNR
    qam64_snrs = dbinv(csi);
    qam64_bers = qam64_ber(qam64_snrs);
    qam64_eber = mean(qam64_bers);
    fprintf('64-QAM: %e\n', qam64_eber);
    qam64_esnr = db(qam64_berinv(qam64_eber), 'pow');

    %% Assemble values
    ret = [rssi, bpsk_esnr, qpsk_esnr, qam16_esnr, qam64_esnr];
end