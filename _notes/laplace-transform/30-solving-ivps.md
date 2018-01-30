---
layout: note
title: "Solving IVPs"
chapter: "Laplace transform"
---
* TOC
{:toc}

*(See section 5.4, but skip pp. 325-327.)*

Laplace transforms are good at solving some fLaShI problems, particularly those with constant coefficients on the $y$ terms.

![distracted]({{ site.baseurl }}/assets/images/distracted.jpg)

## Example
> *Solve $y'' +y = \sin(t)$, with $y(0)=0$ and $y'(0)=1$.*

Transform party! 

$$ (s^2Y(s)-sy(0)-y'(0)) + Y(s) = \frac{s}{s^2+1} $$

$$ (s^2+1) Y(s) = 1 + \frac{s}{s^2+1} = \frac{s^2 + s + 1}{s^2+1} $$

$$Y(s) = \frac{(s^2 + s + 1)}{(s^2+1)^2}$$

```matlab
format rat
P = [1 1 1];
Q = conv([1 0 1],[1 0 1]);
[r,z] = residue(P,Q)
```

```
r =
      -1/144115188075855776 -    1/2i    
      -1/12009599006321320 -    1/4i    
      -1/144115188075855776 +    1/2i    
      -1/12009599006321320 +    1/4i    
z =
       1/10293942005418276 +    1i      
       1/10293942005418276 +    1i      
       1/10293942005418276 -    1i      
       1/10293942005418276 -    1i      
```

So $y(t) = 2\text{Re}[(-i/2)e^{it}] + 2t \text{Re}[(-i/4)e^{it}]$, or $y(t)= \sin(t) +\frac{1}{2} t\sin(t)$. 

## Revenge of the oscillator

You may have noticed that by the time we get done inverting transforms, we see the usual suspects from our study of oscillators. This is no coincidence.

Take $y'' +2cy' + \omega_0^2 y = A e^{i\omega t}$, which was our general resonance problem. Upon transformation,

$$ (s^2Y(s)-sy(0)-y'(0)) + 2c( sY(s)-y(0)) + \omega_0^2 Y(s) = \frac{A}{s-i\omega},$$

which leads to 

$$ Y(s) = \frac{(s+2c)y(0)+ y'(0)}{s^2+2cs+\omega_0^2} + \frac{A}{(s-i\omega)(s^2+2cs+\omega_0^2)}.$$

For both pieces, we need to find roots of $s^2+2cs+\omega_0^2$. This is our old friend, the characteristic equation. Each root gives us a related exponential solution, unless one root is repeated, in which case we also get the secular solution. This is just what we have seen using ILTs as well. 

The split in terms above is equivalent to $y_c$ and $y_p$. Note that in $y_p$, we get the same two exponential terms as in $y_c$--that is, the transient solution. Only the term associated with the pure imaginary pole $i\omega$ survives in the long run. In the PFE

$$\frac{1}{(s-i\omega)(s^2+2cs+\omega_0^2)} = \frac{B}{s-i\omega} + \cdots $$

we get $B$ by multiplying through and setting $s=i\omega$: 

$$ B = \frac{1}{(i\omega)^2 + 2c(i\omega) + \omega_0^2}. $$

If this looks familiar, that's because it's exactly the frequency response function.

