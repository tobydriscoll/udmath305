---
layout: note
title: "Oscillators"
chapter: "Linear equations"
---
* TOC
{:toc}

## Physical models

*See section 4.1.*

A mass hanging from a spring satisfies the ODE

$$my'' + \gamma y' + ky = F(t).$$

(As is typical, all the named constants are nonnegative.) Here $m$ is the mass, $\gamma$ is a coefficient of friction or other damping forces, and $k$ is a characteristic constant of the spring. The nonhomogeneous term $F(t)$ represents an external driving force. If we have initial conditions, they give values for $y$ and $y'$. 

The model is really just a statement of Newton's 2nd Law:

$$my'' = -ky - \gamma y' + F(t).$$

Unless the spring is overstretched, it tends to produce a restoring force proportional and opposed to its displacement. It's this oppositional character that creates oscillatory motion. The damping force opposes motion. 

There are many analogous physical situations. In some cases, molecular bonds can be well modeled as linear springs. And when displacements are small, the gravitational restoring force on a pendulum bob has the same mathematical form,

$$\theta'' + \gamma \theta' + \frac{g}{L}\theta = F(t).$$

### RLC circuit

A seemingly entirely different physical situation is an AC circuit having a resistor, capacitor, and inductor in series with a generator providing voltage $E(t)$. The capacitor gets a time-varying charge $q(t)$, and all elements experience a current $I(t)=q'(t)$. Kirchoff's laws lead to 

$$
Lq'' + Rq' + \frac{1}{C}q = E(t),
$$

where $L$, $R$, and $C$ are inductance, resistance, and capacitance. It's often more convenient to differentiate and get an ODE for the current:

$$
LI'' + RI' + \frac{1}{C}I = E'(t).
$$

As you can see, it's mathematically identical to the mechanical oscillator. Understanding in one domain translates immediately to the other.

## Undamped oscillations

We'll stick with the mechanical names, $$my'' + \gamma y' + ky = F(t)$$, and first consider what happens in the idealized case of no damping, $\gamma=0$. 

The homogeneous problem is $my'' +ky=0$, and this has roots $\pm\sqrt{k/m}$. We define

$$
\omega_0 = \sqrt{\frac{k}{m}},
$$

which is the *natural frequency*{:.def} of the oscillator.

*(About the term "frequency": In math we mean the multiplier of $t$ inside the sin or cos function. Engineers sometimes call this "angular frequency" or "circular frequency", and use frequency to mean angular frequency over $2\pi$. In particular, this is what is meant by Hz units.)*

The complementary solution is therefore

$$y_c = A \cos(\omega_0 t) + B\sin(\omega_0 t).$$

However, we sometimes prefer an alternate form, 

$$y_c = R\cos(\omega_0 t - \delta),$$

in which the free parameters are the *amplitude*{:.def} $R$ and the *phase*{:.def} $\delta$. Here's how to show they are equivalent. The right-hand side of the last equation is

$$
\text{Re}\Bigl[ R e^{i(\omega_0t-\delta)} \Bigr] = \text{Re}\Bigl[ R e^{-i\delta} e^{i\omega_0t} \Bigr].
$$

Suppose we change the expression of the leading two terms from complex polar to complex Cartesian:

$$
R e^{-i\delta} = A - iB.
$$

Applying Euler's identity, we get

$$
\text{Re}\Bigl[ (A - iB) ( \cos(\omega_0 t) + i\sin(\omega_0 t))  \Bigr]
= A \cos(\omega_0 t) + B\sin(\omega_0 t).
$$

Thus the two forms of the general solution are identical, connected by $R e^{i\delta} = A + iB$. We can use either form, for theory or to match up with initial data.

#### Example

> A 4 lb weight stretches a spring 8 in. The mass is stretched another 6 in and set in motion from that position with a downward velocity of 12 in/s. Ignore damping effects. Find the frequency, period, and amplitude of the motion.

This problem is in freedom units. You'll want to use ft, sec, and $g=32$ ft/sec$^2$.

At rest, $F=-ky$, so we find $k=(4 \text{lb})/(2/3 \text{ft})=6$. The motion is thus governed by $(4/32)y'' + 6y = 0$, or $y'' +48y=0$. The natural frequency is $\omega_0=\sqrt{48}=4\sqrt{3}$, for a period of $\pi/(2\sqrt{3})$. The general solution is

$$
y = A \cos( \sqrt{48}t ) + B\sin(\sqrt{48}t).
$$

In this setup we define the *downward* direction as positive. So we have

$$
\begin{align}
0.5 &= y(0) = A + 0B, \\
1 &= y'(0) = 0A + \sqrt{48}B. 
\end{align}
$$

So $y = \frac{1}{2}\cos( \sqrt{48}t ) + \frac{1}{\sqrt{48}}\sin( \sqrt{48}t ).$ We can express this in amplitude-phase form via

$$
R e^{i\phi} = \frac{1}{2} + i \frac{1}{\sqrt{48}}.
$$

Hence $R^2=(1/4)+(1/48) = 13/48$, and $R=\sqrt{13/48}\approx 0.5204$ is the amplitude.  



### Forced motion

Things get interesting when we introduce a periodic forcing term, $y'' +\omega_0^2y = A\cos(\omega t)$. Here $\omega$ is the driving frequency. The method of particular solutions leads directly to

$$y_p = \frac{A}{\omega_0^2 - \omega^2} \cos(\omega t),$$

valid for $\omega\neq \omega_0$. This suggests that when $\omega\approx \omega_0$, the amplitude of the solution can be quite large. 

To be specific, suppose initially $y(0)=y'(0)=0$. Then the general solution $y_c+y_p$ boils down to

$$y = \frac{A}{\omega_0^2 - \omega^2} (\cos(\omega t) - \cos(\omega_0 t)).$$

Now, say $\omega = \omega_0 + 2\epsilon$ for some $\epsilon\approx 0$. Some trig magic gives 

$$y = \left[ \frac{-2A}{\omega_0^2 - \omega^2} \sin (\epsilon t) \right] \cos((\omega_0+\epsilon) t).$$

We can think of the term inside the square brackets as an amplitude that varies at low frequency $\epsilon$. This phenomenon is called *beating*{:.def} and is how experienced musicians can hear when they're slightly out of tune. 

```matlab
t=linspace(0,4,30000);
sound(cos(3000*t)-cos(2990*t))
```

#### Example

> A mass of $2 kg$ is hanging at rest from a spring of constant $k=12$ N/m. Then it is subjected to a driving force of $\cos(\omega t)$. For what value(s) of $\omega$ is the amplitude of the motion equal to $50$ cm? Neglect damping effects.

We can go straight to the solution above, $y_c = \cos(\omega t)/(\omega_0^2 - \omega^2)$. We have $\omega_0^2=k/m=6$. We have to solve $0.5=1/\|6-\omega^2\|$. There are two possibilities:

$$
\frac{1}{2} = \frac{1}{6-\omega^2}, \Longrightarrow \omega^2=4.  
$$

$$
\frac{1}{2} = \frac{1}{\omega^2-6}, \Longrightarrow \omega^2=8. 
$$

So $\omega=2$ or $\omega=2\sqrt{2}$. 



### Resonance

Perhaps no one topic has been linked to more Nobel prizes in physics than resonance. 

What happens to our particular solution when $\omega=\omega_0$? This is the case where our naive version of undetermined coefficients fails. It works out instead that

$$y_p = \frac{A}{2\omega_0} t \sin(\omega_0 t).$$

The amplitude increases without bound, forever. This is a "pure" resonance, where the input can be infinitely amplified. The driving force constantly inputs energy to the system with perfect efficiency, and there is no friction or damping to take out energy. 

```matlab
clf
dom = [0 30];
lbl = {};
for omega = [2.7 2.85 2.94 3.1]
    N = chebop(@(t,u) diff(u,2)+9*u-cos(omega*t), dom, [0;0], []);
    y = N\0;
    plot(y)
    hold on, xlabel('t'), ylabel('y')
    title('Natural frequency \omega_0=3')
    lbl{end+1} = ['\omega = ',num2str(omega)];
    legend(lbl{:})
    shg, pause
end
yr = chebfun(@(t) t.*sin(3*t)/6,[0 30]);
plot(yr,'k')
lbl{end+1} = 'resonance';
legend(lbl{:})
```

## Damped oscillations

![Damping]({{ site.baseurl }}/assets/images/damping.jpg)
{:.meme}

We now turn on the damping term and consider the homogeneous problem $my'' + \gamma y' + k y = 0$. Obviously, everything comes down to how the characteristic roots depend on $\gamma$:

$$r_{1,2} = \frac{ -\gamma \pm \sqrt{ \gamma^2 - 4mk} }{2m}
= -c \pm \sqrt{ c^2 - \omega_0^2},$$

where $c=\gamma/2m$ and (as before) $\omega_0^2=k/m$. We get pure imaginary/pure oscillation roots $\pm i \omega_0$ in the undamped case. If damping is positive but very small, then we introduce an exponential envelope and decrease frequency a tad:

$$y_c = c_1 e^{-ct} \sin(t\sqrt{\omega_0^2-c^2}) + c_2 e^{-ct} \cos(t\sqrt{\omega_0^2-c^2}).$$

(Technically, it's a pseudofrequency, as the solution isn't periodic.) Alternative form:

$$y_c = R e^{-ct} \cos(t\sqrt{\omega_0^2-c^2}) - \delta).$$

This situation is called *underdamped*{:.def} and is the most typical physically.

### Example

> Examine the phase plane for an oscillator $0.25 y'' + \gamma y' + 4y=0$, where $0\le \gamma \le 1$.

The system is underdamped so long as $c<\omega_0$, or $\gamma/0.5 < \sqrt{16}$. We'll do it numerically.

```matlab
dom = [0 8];
for gamma = [0 0.1 0.2 0.3 0.4 0.5]
    clf
    N = chebop(@(t,y) 0.25*diff(y,2)+gamma*diff(y) + 4*y, dom, [4;0], []);
    for y0 = [5 4 3]
        N.lbc = [y0;0];
        y = N\0;
        arrowplot(y,diff(y))
        hold on, xlabel('y'), ylabel('y''')
    end
    title(['Damping \gamma = ',num2str(gamma)])
    axis equal
    shg, pause
end
```	

---


If we let $\gamma$ continue to increase, then when $c=\omega_0$ the complex roots fuse into a single repeated root, $r=-c$, and the solution becomes

$$y_c = c_1 e^{-ct} + c_2 t e^{-ct}.$$

This situation is called *critically damped*{:.def}. 

Finally, as $\gamma$ continues to increase, the roots become distinct, real, and negative. We get $y_c = c_1 e^{r_1t} + c_2 e^{r_2t}$ for $r_1 < -c < r_2 < 0.$ This is called the *overdamped*{:.def} case. 

Note that whatever the nonzero damping level is, the fate of all solutions is $y_c\to 0$ as $t\to\infty$. Damping removes energy, and there's nothing to replace it.

### Example

> Continue the previous example to $1.5 \le \gamma \le 3$.

The system is critically damped at $\gamma=2$ and overdamped after that. 

```matlab
dom = [0 8];
for gamma = [1.5 1.9 2 2.3 3]
    clf
    N = chebop(@(t,y) 0.25*diff(y,2)+gamma*diff(y) + 4*y, dom, [4;0], []);
    for y0 = [5 4 3]
        N.lbc = [y0;0];
        y = N\0;
        arrowplot(y,diff(y))
        hold on, xlabel('y'), ylabel('y''')
    end
    title(['Damping \gamma = ',num2str(gamma)])
    axis equal
    shg, pause
end
```


## Frequency response

Now for the full monty. We include everything. We'll use a complex representation for the driving force (it lets us handle both cos and sin cases simultaneously, by real and imaginary parts). Our equation is 

$$y'' + 2c y' + \omega_0^2 y = A e^{i\omega t}.$$

The general solution will be $y_c+y_p$. As noted above, we know that $y_c\to 0$ as $t$ increases, and we call this the *transient solution*{:.def}. We're more interested in the particular part. Plugging in $y_p=Ce^{i\omega t}$ leads to

$$y_p(t) = \frac{A}{(i\omega)^2+2c(i\omega)+\omega_0^2} e^{i\omega t}.$$

We call this the (slight misnomer) *steady-state response*{:.def} or the forced response. Once the transient has (exponentially) died away, this is all that's left. 

If the driving force were $3\sin(6t)$, for example, we'd set $\omega=6$, $A=3$, and take the imaginary part of $y_p$. 

### Example

```matlab
clf
dom = [0 100];
gamma = 0.4;  % also try 1.5
lbl = {};
for omega = [2.4 2.6 2.8 3 3.2 3.4]
    N = chebop(@(t,y) diff(y,2)+gamma*diff(y)+9*y-cos(omega*t), dom, [0;0], []);
    y = N\0;
    %plot(y) % to show transient
    y = restrict(y,[50 100]);
    arrowplot(y,diff(y))
    hold on, xlabel('t'), ylabel('y')
    title(['Natural frequency \omega_0=3, damping \gamma=' num2str(gamma)])
    lbl{end+1} = ['\omega = ',num2str(omega)];
    legend(lbl{:})
    shg, pause
end
```

---

The ratio

$$G(i\omega) = \frac{y_p(t)}{Ae^{i\omega t}} = \frac{1}{(i\omega)^2+2c(i\omega)+\omega_0^2} = \frac{1}{2i\omega c +\omega_0^2-\omega^2}$$

is called the *frequency response*{:.def}. As a complex-valued function, it's best expressed in polar form,

$$ G(i\omega) = g(\omega) e^{-i\phi(\omega)}, $$

where $g(\omega)=\|G(i\omega)\|$ is the *gain*{:.def} and $\phi(\omega)$ is the *phase*{:.def}. 

### Example

```matlab
clf
lbl = {}; h = [];
omega0 = 3;
for c = [0.02 0.05 0.2 0.4]
    G = @(iom) 1/((iom+c)^2+omega0^2-c^2);
    g = chebfun(@(om) abs(G(1i*om)),[2.5 3.5]);
    h(end+1) = plot(g,'linewidth',2);
    hold on
    [gmax,ommax] = max(g)
    plot(ommax,gmax,'k*')
    lbl{end+1} = ['c = ',num2str(c)];
end
grid on
xlabel \omega, ylabel g
legend(h,lbl{:})
title('Gain in a driven damped oscillator, \omega_0=3')
```

---

We can see that resonance occurs even in the presence of damping, though with a finite rather than infinite gain. 

Things are beginning to get messy. It is possible to calculate

$$ g(\omega) = [ (\omega^2-\omega_0^2)^2 + 4c^2\omega^2]^{-1/2}.$$

And $g$ hits a max when the interior expression is a min. This occurs if

$$4\omega(\omega^2-\omega_0^2) + 8c^2\omega = 0,$$

or $\omega_r^2 = \omega_0^2-2c^2$. As long as $c$ is small, the maximally resonant frequency is just a bit less than the natural frequency. At $\omega_r$, the gain is approximately $1/(2c\omega_0)$, that is, inversely proportional to $c$.

The phase is also interesting. Look back at the response $G$, 

$$ G = \frac{1}{2i\omega c +\omega_0^2-\omega^2}.$$

Suppose $\omega$ is close to zero. The denominator is then nearly a positive real number, so the phase of $G$ will be nearly zero. Now suppose $\omega$ is very large. Then the denominator is roughly a negative number with phase $\pi$. Finally, it's clear that when $\omega=\omega_0$, $G$ is pure imaginary, and the phase is $\pi/2$. Thus, as $\omega$ increases, the phase increases from zero (in phase) to $\pi$ (out of phase), crossing over at the natural frequency (90 degree phase lag).

If $c$ is close to zero, it's a very quick change from a nearly positive number to a nearly negative one. The steepness of this transition softens as $c$ increases. 

### Example

```matlab
clf
lbl = {}; h = [];
omega0 = 3;
for c = [0.02 0.05 0.2 0.4]
    G = @(iom) 1/((iom+c)^2+omega0^2-c^2);
    phi = chebfun(@(om) angle(conj(G(1i*om))),[2.5 3.5]); 
    h(end+1) = plot(phi/pi,'linewidth',2);
    hold on
    lbl{end+1} = ['c = ',num2str(c)];
end
grid on
legend(h,lbl{:})
title('Phase in a driven damped oscillator, \omega_0=3')
xlabel \omega, ylabel \phi/\pi
```
