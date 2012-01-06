snr_db = -1:0.1:30;
snr = dbinv(snr_db);
X = [snr_db; ber_bpsk; ber_qpsk; ber_16qam; ber_64qam].';
ber_bpsk = bpsk_ber(snr);
ber_qpsk = qpsk_ber(snr);
ber_16qam = qam16_ber(snr);
ber_64qam = qam64_ber(snr);
X = [snr_db; ber_bpsk; ber_qpsk; ber_16qam; ber_64qam].';
save('snr_ber.txt', 'X', '-ascii');
