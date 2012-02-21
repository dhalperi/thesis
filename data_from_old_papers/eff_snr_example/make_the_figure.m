%%% First, extract the trace files for the links Wenjun was talking about:
%   srcs = [3];
%   dests = [5];
%   txpowers = [20];
load ../fsf_shape_figure/expt-8-ofdm-parsed/fsf-shape
line = fsf_shape(20,3:end).'-3;

% 802.11n-2009 Table 7-25f on page 50
real_indices = [-28 -26 -24 -22 -20 -18 -16 -14 -12 -10 -8 -6 -4 -2 -1 ...
                1 3 5 7 9 11 13 15 17 19 21 23 25 27 28].';

%% Get RSSI and ESNRs
esnrs = get_siso_esnrs(line);
            
%% Verify that this is the line I want
plot(real_indices, [line repmat(esnrs, size(real_indices))]);
legend('Link 3-5', 'RSSI', 'BPSK', 'QPSK', '16-QAM', '64-QAM', 'Location', 'Best');
xlim([-28 28]);
ylim([5 25]);

%% Save data to file
t = [real_indices line repmat(esnrs, size(real_indices))];
save('esnr_example_data.txt', 't', '-ascii')