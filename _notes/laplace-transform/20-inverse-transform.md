---
layout: note
title: "Inverse transform"
chapter: "Laplace transform"
---
* TOC
{:toc}

So you can "solve" an IVP like the undamped oscillator, getting an expression like

$$ Y(s) = \frac{\omega + s(s^2+\omega^2)}{(ms^2+k)(s^2+\omega^2)}.$$

The real goal is to recover $y(t)$ from this. Here's what we have to work with:

![transform table](transform-table.jpeg)

(So far we've only covered items 1, 2, 3, 5, 6, 14, 17, and 18. You could say that 9, 10, and 11 all follow from 14.) Now the game is a matter of pattern-matching from the given $F(s)$ to something in the table. 

### Examples

> *Invert for $F(s) = \displaystyle \frac{24}{(s+2)^4}$.*

Check out line 11 of the table with $n=3$, $a=-2$. We get $4e^{-2t}t^3$. 


---

## Partial fractions


Our secret weapon in the cause is an idea that popped up when you learned integration. You'll notice that the transforms we work with are almost exclusively rational functions. Just as factoring is an important way to dissect a polynomial, the *partial fraction* expansion is a natural dissection of a rational function.

### Example (real partial fractions)

*(see Example 6, section 5.3)*

> *Invert $F(s) = \displaystyle \frac{s-2}{s^2+4s-5}$.*

The denominator is $(s+5)(s-1)$, so we should have

$$\frac{s-2}{s^2+4s-5} = \frac{A}{s+5} + \frac{B}{s-1}.$$

Clear denominators:

$$s-2 = A(s-1) + B(s+5).$$

This is meant to be an identity in $s$, so we can choose any values of $s$ that we like. Since we're super smart, we'll choose $s=1$, to get $B=-1/6$, and $s=-5$, to get $A=7/6$. Thus $f(t) = (7/6) e^{-5t} - (1/6)e^{t}$. 

---

![Unpopular complex numbers]({{ site.baseurl }}/assets/images/partial-complex.jpg)
{:.meme}

**WARNING! I am about to do things differently from the way the book, and apparently most books, do this. Hang on!**

### Example (complex partial fractions)

> *Invert $F(s)=\displaystyle\frac{s+1}{s^2+2s+5}$.*

This is a little trickier. The roots of the denominator are $-1\pm 2i$, so

$$
\displaystyle\frac{s+1}{s^2+2s+5} = \frac{A}{s-(-1+2i)} + \frac{B}{s-(-1-2i)}.
$$

Clear denominators:

$$
s+1 = A(s-(-1-2i)) + B(s-(-1+2i)).
$$

Set $s=-1+2i$ and you get $2i=A(4i)$, or $A=1/2$. We could solve for $B$ in the usual way, but it's going to be the conjugate of $A$, so $B=1/2$. Then, after inverting,

$$
f(t) = \frac{1}{2}e^{(-1+2i)t} + \frac{1}{2}e^{(-1-2i)t} = \frac{1}{2} e^{-t} ( e^{2it}+e^{-2it})
$$

$$
= e^{-t}\cos(2t).
$$

---

Generally speaking, we want to get 

$$ F(s)=\frac{P(s)}{Q(s)} = \frac{a_1}{s-z_1} + \frac{a_2}{s-z_2} + \cdots + \frac{a_n}{s-z_n},$$

where the $z_j$ are the roots of $Q$, and the numerator has degree less than $n$.


The quantities $z_j$ are called *poles* and the $a_j$ are *residues*. They may be complex numbers--but those do not scare us. 

The command `residue` in MATLAB will find the poles and residues for us. From there, inversion is trivial; the $j$th term produces $a_j e^{z_jt}$. 


### Example (PF using matlab)

*(see Example 6, section 5.3)*

> *Invert $F(s) = \displaystyle \frac{s-2}{s^2+4s-5}$.*

This was done by hand above. Now, by the machine. Note the use of `format rat` to get nice rational numbers. Also, polynomials in MATLAB are given as vectors of coefficients, in descending degree order.

```matlab
format rat
[r,z] = residue([1 -2],[1 4 -5])
```

This produces the output

```
r =
       7/6     
      -1/6     
z =
      -5       
       1       
```

which confirms what we got by hand.

---

### Example (PF using matlab)

*(see Example 8, section 5.3)*

> Invert $F(s) = \displaystyle \frac{14s^2+70s+134}{(2s+1)(s^2+6s+13)}$.

This problem gets easier if you know that you can multiply polynomials using the enigmatically named `conv`.

```matlab
format rat
P = [14 70 134];
Q = conv([2 1],[1 6 13]);
[r,z] = residue(P,Q)
```

```
r =
       1        +    1/2i    
       1        -    1/2i    
       5        +    0i      
z =
      -3        +    2i      
      -3        -    2i      
      -1/2      +    0i      
```

The term with pole at $-1/2$ is no problem; it will produce $5e^{-t/2}$. What about the complex terms? Again, since everything started real, this will end up real too--note the conjugates. Look at

$$ (1+\frac{1}{2}i) e^{(-3+2i)t} + (1-\frac{1}{2}i) e^{(-3-2i)t} $$

We have a quantity plus its conjugate. This always gives twice the real part of that quantity. 

$$ 2 e^{-3t}\text{Re} \left[  ( 1\cos(2t) - \frac{1}{2} \sin(2t)) + ...   \right]$$

We needn't worry about the ... terms, as they're all imaginary. The inverse transform is now (adding back in the contribution from the third pole)

$$2e^{-3t}\cos(2t)-e^{-3t}\sin(2t)+ 5e^{-t/2}.$$

![PFD]({{ site.baseurl }}/assets/images/shut-up-pfd.jpg)
{:.meme}


## Repeated poles

We have to make a slight change when the denominator has a repeated root, because the partial fraction expansion gets terms like

$$ \frac{1}{s-z_j}, \; \frac{1}{(s-z_j)^2}, \; \cdots \;
\frac{1}{(s-z_j)^k} $$

when there are $k$ copies of the pole. The terms are straightforward to invert using line 11 of the table, as the inverse of $1/(s-z_j)^m$ is $t^{m-1}e^{z_jt}/(m-1)!$. 

The slight issue here is that finding the poles is what we call a badly conditioned numerical problem: it's highly sensitive to the roundoff error that's in MATLAB's arithmetic. You may have to use some judgment. In practice you probably won't have much trouble, since we tend to stick to integers and simple rational numbers for the answers. 

### Example (repeated poles)

*(see Example 7 of section 5.3)*

> Invert $F(s)=\displaystyle \frac{s^2+20s+31}{(s-3)(s^2+4s+4)}$.

```matlab
format rat
P = [1 20 31];
Q = conv([1 -3],[1 4 4]);
[r,z] = residue(P,Q)
```

```
r =
       4       
      -3       
       1       
z =
       3       
      -2       
      -2       
```

So the answer is $f(t)=4e^{3t} - 3e^{-2t} +1te^{-2t}$. 

## Example

> Invert $F(s) = \displaystyle \frac{s^3+3s^2+3s+1}{(s^2+2s+5)^2}$.

Here you can see from the form that we will either get two double poles, or a 4th-order pole.

```matlab
format long
P = [1 3 3 1];
Q = conv([1 2 5],[1 2 5]);
[r,z] = residue(P,Q)
```

```
r =
  0.500000000000000 - 0.000000000000000i
  0.000000000000000 + 0.500000000000001i
  0.500000000000000 + 0.000000000000000i
  0.000000000000000 - 0.500000000000001i


z =
 -0.999999999999999 + 2.000000000000002i
 -0.999999999999999 + 2.000000000000002i
 -0.999999999999999 - 2.000000000000002i
 -0.999999999999999 - 2.000000000000002i
```

Those poles are clearly supposed to be at $-1\pm 2i$. Note that each one is repeated. The first residue corresponds to $1/(s-z_j)$, the second to $1/(s-z_j)^2$, and so on, for as many repeats as are given. 

$$ 2e^{-t}\text{Re}[ (1/2) e^{2it} ] + 2t e^{-t}\text{Re}[ (i/2) e^{2it} ]
= e^{-t} \cos(2t) -te^{-t} \sin(2t).$$

If you have the time and fortitude (or better yet, a computer), you can check the result by taking the forward transform. To compare complicated expressions, try to simplify their difference to zero. 
