# tinyalu

32-bit alu that can add, sub, div, mul and compare integers and IEEE-754 floating point numbers.

## IEEE-754

This is a method for representing floating point numbers.

```
(32 bit)
sign: 1 bit
exponent: 8 bit
mantissa: 23 bit
```

### sign
Float is positive if sign is 0, else negative.

### exponent

$$
IEEEexponent = exponent + bias
$$

for 32 bit, bias = 127

Bias is used to shift the representation of digits. If we are using 2's compliment, the list of possible numbers with given bits(n), starts with positive values. If the bias is $$ \frac{2^n}{2} - 1$$ then the list will start with negative numbers. This allows ALU's to use their unsigned int comperator while comparing the mantissas of 2 floats. No additional circuitry is required.

```
BIN   DEC   2S   BIAS(bias=3)
000    0     0       -3
001    1     1       -2
010    2     2       -1
011    3     3        0
100    4    -4        1
101    5    -3        2
110    6    -2        3
111    7    -1        4
```

### mantissa

$$
    23.5 = 10111.01001100
         = 1.011101001100 * 2^4
$$

If we drop the leading 1(before the decimal) and take the part which is after the decimal, we get the mantissa.<br>
NOTE: Mantissa assumes a leading 1.

$$
    (-1)^{sign}*(1.mantissa)*2^{exponent-127}
$$

## ALU
ALU takes 3 inputs, 2 numbers and 1 instruction. It outputs a number and ZE(set to high when division by zero).
```
.... E D C B A

CBA: represents the operation
     000: add
     001: sub
     011: mul
     111: div
     110: grt
     100: equal
     101: less
D:  float if set, else int(input)
E:  signed if set, else unsigned(input)
    don't care if D is set
```