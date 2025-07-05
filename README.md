# Linear-Phase-FIR-LPF-Filter
This repo contains code for creating and simulating a LPF in verilog
# FIR Low-Pass Filter in Verilog

## Overview  
This project implements a 32-tap Finite Impulse Response (FIR) Low-Pass Filter using Verilog HDL. The filter is designed to cleanly attenuate high-frequency components from an 8-bit digital input signal. The design supports coefficient loading from an external file and is suitable for FPGA-based implementations or behavioral simulations.

## Description  
The FIR filter uses a standard multiply-and-accumulate (MAC) architecture. It delays each input sample, multiplies it with a corresponding coefficient, and accumulates the results to form the output. The filter coefficients are generated externally using MATLAB's FDA Tool.

## Specifications

| Parameter              | Value                          |
|------------------------|----------------------------------|
| Filter Type            | FIR Low-Pass Filter             |
| Number of Taps         | 32                              |
| Input Width            | 8 bits                          |
| Output Width           | 17 bits                         |
| Coefficient Format     | 8-bit signed (2's complement)   |
| Clocked Operation      | Yes (posedge)                   |
| Reset Support          | Synchronous                     |
| Coefficient Loading    | From external .hex file         |
| Test Input             | Sine wave (from testbench)      |

## Working

 **Coefficient Generation**  
 1.  Coefficeints were  generated using Matlab's FDA tool with the following parameters:
![image](https://github.com/user-attachments/assets/b7d66ca3-0bb9-452b-a91a-eedc657736ce)

  2. Click on File, then Generate Matlab code.

  3. Add disp(b) in your Matlab generated code, to display your filter's coefficeint on command window.

2. **Coefficient Pre-Processing**  
  With the filter coefficients, I did following steps:
    i. Multiply all each coefficeint by scaling factor of 2^8 = 255 (as bits width was 8).
    ii. Rounded floating no.s to fixed point integers.
    iii. Took 2's complement of all negative numbers.

4. **MAC Operation**  
   The current input and delayed samples are multiplied with their respective coefficients and summed to generate the output.

5. **Output**  
   The final output is a 17-bit result of the weighted sum, representing the filtered signal.


