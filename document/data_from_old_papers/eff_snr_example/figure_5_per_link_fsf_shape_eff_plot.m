#! /usr/bin/octave -qf

# figure was generated using expt-8-ofdm, src 3, dest 5, rate idx 6, txpower 20
# plot the fsf shape for two given links

if nargin < 5
	printf("Usage: cmd <path> <src> <dest> <txpower> <rateidx>\n");
	exit(1);
endif

args = argv();
path = args{1};
src = str2num(args{2});
dest = str2num(args{3});
txpower = str2num(args{4});

rateidx = str2num(args{5});
rate = ["0x410", num2str(rateidx - 1)];
mask = "1";

total_pkts = 1702;

addpath("~/iwlwifi/octave/link-characterisation/");
data = get_eff_snr_all_rates_per_link([path, "/traces"], src, dest, rateidx, txpower, mask, total_pkts);

# index vector to ease plotting
idxvec = [-28 -26 -24 -22 -20 -18 -16 -14 -12 -10 -8 -6 -4 -2 -1 1 3 5 7 9 11 13 15 17 19 21 23 25 27 28];

# plots

# scales
ymax = max(data.fsf) + 1;
ymin = min(min(data.fsf), min(data.eff)) - 1;

figure(1);
newplot();
subplot(2, 2, 1);

# subcarrier series
plot(idxvec, data.fsf, "linewidth", 3.5,
     idxvec, ones(1, 30) * data.rssi, "linewidth", 2, 
     idxvec, ones(1, 30) * data.eff(4), "-x", "linewidth", 2,
     idxvec, ones(1, 30) * data.eff(3), "-+", "linewidth", 2,
     idxvec, ones(1, 30) * data.eff(2), "-o", "linewidth", 2,
     idxvec, ones(1, 30) * data.eff(1), "-*", "linewidth", 2);

#plot(data.fsf, idxvec,
#     ones(1, 30) * data.rssi, idxvec,
#     ones(1, 30) * data.eff(4), idxvec, "-x",
#     ones(1, 30) * data.eff(3), idxvec, "-+",
#     ones(1, 30) * data.eff(2), idxvec, "-o",
#     ones(1, 30) * data.eff(1), idxvec, "-*");


#legend('Subcarrier gains', 
       #'Packet SNR', 
       %['Eff SNR - QAM 64, BER ', num2str(data.ber(4)), '%'],   
       %['Eff SNR - QAM 16, BER ', num2str(data.ber(3)), '%'], 
       %['Eff SNR - QPSK, BER ', num2str(data.ber(2)), '%'], 
       %['Eff SNR - BPSK, BER ', num2str(data.ber(1)), '%']);
       #'QAM 64',               
       #'QAM 16',
       #'QPSK',
       #'BPSK'
#	1);

text(10, 9, '{\fontsize{12}BPSK}');
text(10, 12, '{\fontsize{12}QPSK}');
text(10, 14.5, '{\fontsize{12}QAM-16}');
text(-10, 16.8, '{\fontsize{12}QAM-64}');
text(-10, 18.8, '{\fontsize{12}Packet SNR}');
text(-19, 22, '{\fontsize{12}Subcarrier SNRs}');


# for src 3, dest 5, txpower 20, in expt-8-ofdm
axis([-28, 28, 8, 24]);
set(gca, 'ytick', [8:4:24]);
set(gca, 'yticklabel', {'8', '12', '16', '20', '24'});


set(gca, 'xtick', [-28:14:28]);
set(gca, 'xticklabel', {'-28', '-14', '0', '14', '28'});

#axis([-28, 28, ymin, ymax + 15]);
#axis([ymin, ymax + 15, -28, 28]);

ylabel('{\fontsize{16}SNR (dB)}');
xlabel('{\fontsize{16}Subcarrier index}');

set(gca, 'dataaspectratio', [0.52381 1 1]);
#get(gca, 'dataaspectratio')

#lines = get(gca, 'children');
#for each = 1:length(lines)
#        set(lines(each), 'linewidth', 2);
#	%set(lines(each), 'markersize', 1.5);
#end


print([path, "/plots/fsf-shape-eff-snr-s", num2str(src), "d", num2str(dest), "-txpower-", num2str(txpower), ".eps"], "-deps");
 		 
