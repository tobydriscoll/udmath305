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
{:.meme}

## Example

> Solve $y'' + 4y' + 4y = 8t^2$, $y(0)=0$, $y'(0)=-1$. 

Transform everything in the ODE.

$$
[s^2Y(s) - s y(0) - y'(0)] + 4[sY(s)-y(0)] + 4Y(s) = \frac{16}{s^3}.
$$

$$
Y(s) = \frac{1}{s^2+4s+4} \left[ -1 + \frac{16}{s^3} \right]
= \frac{-1}{s^2+4s+4} + \frac{16}{s^3(s^2+4s+4)}.
$$

The first term we should be able to deal with by hand. It has a double pole at $-2$, so

$$
Y_1(s) = \frac{-1}{s^2+4s+4} = \frac{A}{s+2} + \frac{B}{(s+2)^2}.
$$

No work is required here to see right away that $A=0$ and $B=-1$. So the inverse transform of this piece is $y_1(t) = -te^{-2t}$. 

For the other piece we'll use MATLAB to ease the algebra.

```matlab
>> [a,z] = residue(16,[1 4 4 0 0 0]);
>> [a z]

ans =

    -3    -2
    -2    -2
     3     0
    -4     0
     4     0
```

Hence

$$
Y_2(s) = \frac{-3}{s+2} + \frac{-2}{(s+2)^2} + \frac{3}{s} + \frac{-4}{s^2} + \frac{4}{s^3},$$

$$
y_2(t) = e^{-2t}(-3-2t) + 3 - 4t + 2t^2.
$$

The final answer is $y_1+y_2=e^{-2t}(-3-3t) + 3 - 4t + 2t^2$. 

---

Let's compare that last example to the method of undetermined coefficients. First we would find the roots of $r^2+4r+4$, and get a double root at $-2$. This implies

$$
y_c = c_1 e^{-2t} + c_2 t e^{-2t}.
$$

The forcing term implies $y_p=At^2+Bt+C$. We'd have to solve for those coefficients. Then $y=y_c+y_p = c_1 e^{-2t} + c_2 t e^{-2t} + At^2+Bt+C$ is the general solution. Finally, we'd apply the initial conditions to get values for $c_1$ and $c_2$. This is equivalent to the answer we got with Laplace transforms, and clearly $A=2$, $B=-4$, and so on came out as part of the inversion process. 

## Example (resonance)
> *Solve $y'' +y = \sin(t)$, with $y(0)=2$ and $y'(0)=1$.*

This is the case of perfect resonance, which we glossed over a bit with the M.U.C. But let's have a transform party! 

$$ (s^2Y(s)-sy(0)-y'(0)) + Y(s) = \frac{1}{s^2+1} $$

$$ (s^2+1) Y(s) = 2s + 1 + \frac{1}{s^2+1} $$

$$Y(s) = \frac{2s + 1}{s^2+1} +  \frac{1}{(s^2+1)^2} = Y_1(s) + Y_2(s)$$

Let's look at $Y_1$ first. It has two poles, so we can handle it manually (without a computer). In fact, we can just write it as

$$
Y_1(s) = 2 \frac{s}{s^2+1} + \frac{1}{s^2+1},
$$

so that $y_1(t) = 2\cos(t) + \sin(t)$. For $Y_2$, we are well served to use MATLAB for the PFD.

```matlab
Q = conv([1 0 1],[1 0 1]);
[a,z] = residue(1,Q)
```

```
a =

   0.0000 - 0.2500i
  -0.2500 + 0.0000i
   0.0000 + 0.2500i
  -0.2500 + 0.0000i


z =

   0.0000 + 1.0000i
   0.0000 + 1.0000i
   0.0000 - 1.0000i
   0.0000 - 1.0000i
```


So

$$
Y_2(s) = \frac{-i/4}{s-i} + \frac{-1/4}{(s-i)^2} + \frac{i/4}{s+i} + \frac{-1/4}{(s+i)^2}.
$$

It helps to recognize that the first and third terms are conjugates, as are the 2nd and 4th. So

$$
y_2(t) = 2\text{Re}\left[\frac{-i}{4}e^{it}\right] + 2 \text{Re}\left[\frac{-1}{4}te^{it}\right],
$$

or $y_2= \frac{1}{2} \sin(t) - \frac{1}{2}t\cos(t)$. Altogether, then,

$$
y = y_1 + y_2 = 2\cos(t) + \frac{3}{2} \sin(t) - \frac{1}{2}t\cos(t).
$$



## Revenge of the oscillator

You may have noticed that by the time we get done inverting transforms, we see the usual suspects from our study of oscillators. This is no coincidence.

Take $y'' +2cy' + \omega_0^2 y = e^{i\omega t}$, which was our most general linear oscillator problem. (For simplicity, assume $c>0$.) Upon transformation,

$$ [s^2Y(s)-sy(0)-y'(0)] + 2c[ sY(s)-y(0)] + \omega_0^2 Y(s) = \frac{1}{s-i\omega},$$

which leads to 

$$ Y(s) = \frac{(s+2c)y(0)+ y'(0)}{s^2+2cs+\omega_0^2} + \frac{1}{(s-i\omega)(s^2+2cs+\omega_0^2)}.$$

For both pieces of $Y$, we need to find roots of $s^2+2cs+\omega_0^2$. This is our old friend, the characteristic equation. As before, each root gives us a related exponential solution, unless one root is repeated, in which case we also get the secular solution.  

Only the first term in $Y(s)$ depends on initial conditions. Since the real parts of its poles are negative (free, damped oscillator), it's transient. The second term of $Y$ will produce three poles, two of which are the same as before and therefore transient. Only the term associated with the pure imaginary pole $i\omega$ survives in the long run, and its inverse is the steady response. We can find its residue by hand. In the PFD

$$\frac{1}{(s-i\omega)(s^2+2cs+\omega_0^2)} = \frac{G}{s-i\omega} + \cdots $$

we get $G$ by clearing the denominator and setting $s=i\omega$: 

$$ G = \frac{1}{(i\omega)^2 + 2c(i\omega) + \omega_0^2}. $$

If this looks familiar, that's because it's exactly the frequency response function we presented in the previous chapter. In the time domain, the steady response is $G(i\omega) e^{i\omega t}$. So $\|G\|$ is the gain, and so on.

## A 4th-order problem

We have the tools to go past 2nd order if we want. Suppose we want to solve

$$
y'''' -4y'''+6y''-4y'+y=0, \qquad y(0)=y''(0)=0,\; y'(0)=y'''(0)=1.
$$

Transform all the things.

$$
[s^4Y(s) -s^3y(0)-s^2y'(0)-sy''(0)-y'''(0)]-4[s^3Y(s) -s^2y(0)-sy'(0)-y''(0)]+6[s^2Y(s)-sy(0)-y'(0)]-4[sY(s)-y(0)]+Y(s) = 0
$$

$$
(s^4-4s^3+6s^2-4s+1)Y(s) = s^2+1-4(s) +6(1)
$$

$$
Y(s) = \frac{s^2-4s+7}{s^4-4s^3+6s^2-4s+1} = \frac{0}{s-1} + \frac{1}{(s-1)^2} + \frac{-2}{(s-1)^3} + \frac{4}{(s-1)^4}
$$

$$
y(t) = t e^t -2 \frac{t^2}{2!}e^t +4 \frac{t^3}{3!}e^t = e^t\left(t-t^2+\frac{2}{3}t^3\right).
$$
