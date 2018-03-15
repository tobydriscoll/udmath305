---
layout: note
title: "Step functions"
chapter: "Laplace transform"
---
* TOC
{:toc}

So far, LTs have supplied us with new tools to solve the same old problems. Things start to get interesting when we look at other kinds of forcing functions that were out of our league before. These functions happen to be very interesting and useful from an engineering point of view.

## Unit step function

*(See section 5.5)*

The *unit step function*{:.def} or [*Heaviside function*](https://youtu.be/pKH63cRJ3p4) is 

$$ u_0(t) = \begin{cases} 0, & t<0,\\ 1, & t\ge 0. \end{cases} $$

This represents "throwing a switch" at time $t=0$. We can turn it on at another time $c$ by using $u_c(t)=u_0(t-c)$. Also useful is the *indicator function*{:.def} $u_{cd}(t)=u_c(t)-u_d(t)$, which will be on only for $t\in[c,d)$. 

(Note: The precise value of $u_c$ at $t=c$ is not important. It has no effect on IVP solutions and can be ignored.) 

Steps allow us to express any piecewise continuous function easily.

### Example 

*(see Example 1 of section 5.5)*

> Express
>
> $$f(t) = \begin{cases} t, & 0< t < 2,\\ 1, & 2 < t < 3, \\ e^{-2t}, & t> 3. \end{cases}$$ 
>
> using unit step functions. 

We can use 

$$\begin{aligned}
f(t) &= tu_{02}(t) + u_{23}(t) + e^{-2t}u_3(t)\\
&= t[1-u_2(t)] + [u_2(t)-u_3(t)] + e^{-2t}u_3(t) \\
&= t + (1-t) u_2(t) + (e^{-2t}-1) u_3(t).
\end{aligned}$$

## Laplace transform of steps

Now for some yummy transforms.

$${\cal L}[u_c(t)] = \int_0^\infty u_c(t) e^{-st}\, dt 
= \int_c^\infty e^{-st}\, dt = \left[ \frac{e^{-st}}{-s} \right]_c^\infty = e^{-ct}\frac{1}{s}.$$

More generally, you can follow the same trail to get *(see Theorem 5.5.1)* 

$$ {\cal L}[u_c(t)f(t-c)] = e^{-cs} {\cal L}[f].$$

![Unit step]({{ site.baseurl }}/assets/images/unit-step.jpg)
{:.meme}

### Example (forward transform)

*(see Example 3 of section 5.5)*

> Transform the function from the previous example,
> 
> $$f(t) = t + (1-t) u_2(t) + (e^{-2t}-1) u_3(t).$$

The tricky bit is that to apply the transform formula on $u_c(t)f(t-c)$, we need the shift $c$ to be the same in both pieces. Use the add-and-subtract trick:

$$f(t) = t + (1-(t-2+2)) u_2(t) + (e^{-2[(t-3)+3]}-1) u_3(t)$$

$$f(t) = t + (-1-(t-2)) u_2(t) + (e^{-6}e^{-2(t-3)}-1) u_3(t)$$

$$f(t) = t - u_2(t) -(t-2) u_2(t) + e^{-6}e^{-2(t-3)}u_3(t) - u_3(t)$$

Now we're ready to roll. 

$$F(s) = \frac{1}{s^2} - \frac{e^{-2s}}{s}  - \frac{e^{-2s}}{s^2} 
+ e^{-6}\frac{e^{-3s}}{s+2} - \frac{e^{-3s}}{s}.$$

---

We have a new addition to the inversion library: exponentials in $F(s)$. 

### Example (inverse transform)

> *Invert $F(s) = \frac{6 e^{-5s}}{s^2+s-2}$.*

Write $F(s) = e^{-5s} G(s)$. Then $f(t) = g(t-5)u_5(t)$. 

We find residues of $(-2,2)$ at poles $(-2,1)$. So $g(t)=-2e^{-2t}+2e^{t}$. Then $f(t) = u_5(t)(-2e^{-2t+10}+2e^{t-5}).$


## IVPs with piecewise continuous forcing

Let's consider a case of *ramp loading*{:.def}, where a forcing ramps up from zero to a steady value. *(Similar to Example 1 of section 5.6.)*

> *Solve $y'' +4y=u_{04}(t)t + 4u_4(t)$, with $y(0)=y'(0)=0$.*

The transform of the forcing function $g(t)=t - (t-4) u_4(t) -4u_4(t) + 4u_4$ is 

$$G(s) = \frac{1}{s^2} - \frac{e^{-4s}}{s^2}.$$

$$G(s) = \frac{1-e^{-4s}}{s^2}.$$

To get $Y(s)$, we divide through by $(s^2+4)$. It's helpful to define $H(s)=1/[s^2(s^2+4)]$, because then 

$$Y(s) = H(s) - e^{-4s}H(s)$$

and $y(t) = h(t) - u_4(t)h(t-4)$. The residues of $H$ are $(i/16,-i/16,0,1/4)$ for poles $(2i,-2i,0,0)$. Thus

$$h(t) = \frac{2}{16}\text{Re}[ (i)e^{2it} ] + \frac{1}{4} t 
= \frac{1}{4}t - \frac{1}{8}\sin(2t).$$

First let's look at $h(t)$. 

```matlab
h = @(t) t/4 - sin(2*t)/8;
fplot(h,[0 25])
```

It looks like $y$ might grow forever, but that ignores an implicit cancellation in its formula. For $t>4$, the linear terms are $(t/4) - (t-4)/4 =1$, so that part of the response is steady. The rest is $(\sin(2t-8)-\sin(2t))/8$, which is an oscillation at the natural frequency $\omega_0=2$. 

```matlab
clf
h = @(t) t/4 - sin(2*t)/8;
u = @(t) (t>0); 
y = @(t) h(t) - u(t-4).*h(t-4);
fplot(y,[0 20])

y = chebfun(y,[0 16],'splitting','on');
[ymax,tmax] = max(y,'local');
tmax
hold on
plot(tmax,ymax,'*')
diff(tmax)/pi
```

### Some justification (optional)

*(See section 5.6)*

Of course we don't *really* turn things on instantaneously. It's an idealization. Does it even make sense in an ODE? 

Consider $y'=u_1(t)$, $y(0)=0$. The system sits at zero until $t=1$. Then,

$y(t) = 0 + \int_1^t  y'(\tau)\, d\tau = (t-1)$. 

The resulting solution, $y=(t-1)u_1(t)$, is continuous. It's even differentiable, everywhere but at $t=1$, where the derivative (of course) jumps.  

Now suppose we did $y'' =u_1(t)$. You'd integrate again to get $y=(t-1)^2/2 u_1(t)$. This function is continuous and differentiable, and the 2nd derivative has a jump. 

Solving an ODE is a smoothing process. The answers come out with more derivatives than the data (at least in the forcing term). 



## Sawtooths and square waves

A common signal in engineering is the *square wave*{:.def}, which we define as being $1$ in all the intervals $(2n,2n+1)$ for integer $n\ge 0$, and zero elsewhere. It alternates between on and off.

How do we like this?

$$f(t) = u_{01}(t) + u_{23}(t) + u_{45}(t) + \cdots$$

$$f(t) = 1 - u_{1}(t) + u_{2}(t) - u_3(t) + u_{4}(t) + \cdots$$

$$F(s) = \frac{1}{s} - \frac{e^{-s}}{s} + \frac{e^{2s}}{s} - \cdots$$

$$F(s) = s^{-1} ( 1  - e^{-s} + e^{2s} - e^{-3s} + \cdots )$$

Define $r=-e^{-s}$. 

$$F(s) = s^{-1}(1 + r + r^2 + r^3 + \cdots) = \frac{1}{s(1-r)} = \frac{1}{s(1+e^{-s})}.$$

If you want to do things this way, I love you. For the rest, we may need something more reliable. 

**Theorem** *(See Theorem 5.5.3)* Suppose $f$ is periodic with period $T$. Then 

$${\cal L}[f] = \frac{F_T(s)}{1-e^{-sT}} = \frac{\int_0^T e^{-st} f(t)\, dt}{1-e^{-sT}}.$$

#### Example

*(This is similar to, but not quite the same as, Example 6 of section 5.5.)*

> Transform the *sawtooth wave*{:.def} $f(t) = t \text{ mod } 1$.

This is just the line $y=t$ over $[0,1]$ then repeated over and over. 

$$F_T(s) = \int_0^1 te^{-st}\, dt = \frac{1 - e^{-s}(1+s)}{s^2}.$$

Hence $F(s) = \frac{1 - e^{-s}(1+s)}{s^2(1-e^{-s})}.$ 



### Square wave resonance

Consider an undamped oscillator $y'' + \pi^2 y =f(t)$. To date we have only considered sinusoidal forcing functions. But the square wave is a different kind of periodic forcing. Above we found that if

$$f(t) = u_{01}(t) + u_{23}(t) + u_{45}(t) + \cdots,$$

then

$$F(s) = \frac{1}{s(1+e^{-s})}.$$

Say $y(0)=y'(0)=0$, and transform the ODE. We solve for $Y$:

$$
Y(s) = \frac{1}{s(s^2+\pi^2)(1+e^{-s})} = \frac{1}{1+e^{-s}} G(s).
$$

Now $G$ is the kind of rational function we know what to do with. In the usual fashion we can find $g(t)=(1-\cos(\pi t))/\pi^2$. To make sense of $Y$ we have to go back through the geometric series that got us $F$ in the first place.

$$
Y(s) = \frac{1}{1+e^{-s}} G(s) = \left[ 1 - e^{-s} + e^{-2s} - e^{3s} + \cdots \right] G(s).
$$

From here we can see that $y(t)$ is a series of step/shifts of $g$:

$$
y(t) = g(t) - u_1(t)g(t-1) + u_2(t)g(t-2) - u_3(t)g(t-3) + \cdots.
$$

To get some feeling for what happens, let's evaluate at integer times. Note that $g(n)=(1-(-1)^n)/\pi^2$, which is zero for even $n$ and $2/\pi^2$ for odd $n$. So at an odd value of $n$,

$$
y(n) = (2/\pi^2)[1 +  u_2(n) + u_4(n) + \cdots].
$$

As we step from one odd value of $n$ to the next, a new step function in this series switches on. So the solution steadily increases at these times. Now at an even value of $n$,

$$
y(n) = (2/\pi^2)[-u_1(n) -  u_3(n) - u_5(n) - \cdots].
$$

So at even $n$ we get steadily decreasing values. In fact, the system is at resonance. Even though the forcing function is not sinusoidal, it does have the same period as the natural frequency of the system. 

```matlab
clf
dom = [0, 20];
N = chebop(@(t,u) diff(u,2)+pi.^2.*u, dom);
N.lbc = @(u) [u; diff(u)];
%%
t = chebfun('t',[0 20]);
sq = (mod(t,2)<1);
clf, plot(sq,'k')
%%
y = N\sq;
hold on, plot(y)
title('Square wave forcing'), xlabel('t'), ylabel('y')
```
