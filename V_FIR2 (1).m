function Hd = V_FIR2

clc;
clear all;
close all;
%V_FIR2 Returns a discrete-time filter object with fixed-point 8-bit coefficients.

% Sampling Frequency in kHz
Fs = 1000;

% FIR Filter Parameters
N     = 32;   % Filter Order
Fpass = 100;  % Passband Frequency (kHz)
Fstop = 150;  % Stopband Frequency (kHz)
Wpass = 1;    % Passband Weight
Wstop = 1;    % Stopband Weight
dens  = 20;   % Density Factor

% Scaling factor (2^8 for 8-bit)
scale_factor = 2^8;

% Design the FIR filter using firpm
b  = firpm(N, [0 Fpass Fstop Fs/2]/(Fs/2), [1 1 0 0], [Wpass Wstop], ...
           {dens});
Hd = dfilt.dffir(b);

%% 1. Display Original Coefficients
disp('Original Coefficients:');
disp(b);

%% 2. Multiply by scaling factor
b_scaled = b * scale_factor;
disp('Scaled Coefficients (Before Quantization):');
disp(b_scaled);

%% 3. Convert negative numbers to 2''s complement (8-bit fixed-point)
b_fixed = round(b_scaled);
b_fixed_2c = mod(b_fixed, 256);  % Handles 2's complement conversion
disp('Fixed-point Quantized Coefficients (2''s complement, 8-bit):');
disp(b_fixed_2c);

%% 4. Show binary (8-bit)
b_binary = arrayfun(@(x) dec2bin(x, 8), b_fixed_2c, 'UniformOutput', false);
disp('Binary Coefficients (8-bit, 2''s complement):');
disp(b_binary');

%% 5. Save to file (one per line)
fileID = fopen('coefficients_j4.txt', 'w');
fprintf(fileID, '%s\n', b_binary{:});
fclose(fileID);

disp('Coefficients saved to "coefficients_j4.txt".');

% [EOF]
