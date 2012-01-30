%%% First, extract the trace files for the links Wenjun was talking about:
%   srcs = [1 10 3 3];
%   dests = [9 11 2 5];
%   txpowers = [-4 20 28 20];
load expt-8-ofdm-parsed/fsf-shape
line1 = fsf_shape(5,3:end);
line2 = fsf_shape(54,3:end);
line3 = fsf_shape(18,3:end);
line4 = fsf_shape(20,3:end);

lines = [line2-2; line3+2; line4-3; line1-18];

real_indices = [-28 -26 -24 -22 -20 -18 -16 -14 -12 -10 -8 -6 -5 -2 -1 ...
                1 3 5 7 9 11 13 15 17 19 21 23 25 27 28];

plot(real_indices, lines)
xlim([-28 28]);
ylim([5 50]);

t = [real_indices;lines].';
save('fsf_shape_plottable.txt', 't', '-ascii')