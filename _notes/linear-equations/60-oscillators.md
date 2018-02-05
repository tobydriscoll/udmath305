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

Unless the string is overstretched, it tends to produce a restoring force proportional and opposed to its displacement. It's this oppositional character that creates oscillatory motion. The damping force opposes motion. 

There are many analogous physical situations. In some cases, molecular bonds can be well modeled as linear springs. And when displacements are small, the gravitational restoring force on a pendulum bob has the same mathematical form,

$$\theta'' + \gamma \theta' + \frac{g}{L}\theta = F(t).$$

### RLC circuit

A seemingly entirely different physical situation is an AC circuit having a resistor, capacitor, and inductor in series with a generator providing voltage $E(t)$. The capacitor gets a time-varying charge $q(t)$, and all elements experience a current $I(t)=q'(t)$. Kirchoff's laws lead to 

$$Lq'' + Rq' + \frac{1}{C}q = E(t)$$,

where $L$, $R$, and $C$ are inductance, resistance, and capacitance. It's often more convenient to differentiate and get an ODE for the current,

$$LI'' + RI' + \frac{1}{C}I = E'(t).$$

As you can see, it's mathematically identical to the mechanical oscillator. Understanding in one domain translates immediately to the other.

## Undamped oscillations

We'll stick with the mechanical names, $$my'' + \gamma y' + ky = F(t)$$, and first consider what happens in the idealized case of no damping, $\gamma=0$. 

The homogeneous problem is $my'' +ky=0$, and this has roots $\pm\sqrt{k/m}$. We're going to define

$$\omega_0 = \sqrt{\frac{k}{m}}$$,

which is the *natural frequency*{:.def} of the oscillator.

*(About the term "frequency": In math we mean the multiplier of $t$ inside the sin or cos function. Engineers sometimes call this "angular frequency" or "circular frequency", and use frequency to mean angular frequency over $2\pi$. In particular, this is what is meant by Hz units.)*

The complementary solution is therefore

$$y_c = A \cos(\omega_0 t) + B\sin(\omega_0 t).$$

However, we sometimes prefer an alternate form, 

$$y_c = R\cos(\omega_0 t - \delta),$$

in which the free parameters are the *amplitude*{:.def} $R$ and the *phase*{:.def} $\delta$. (Equivalence of the two forms is just some trig identity manipulation.) We can use either form, theoretically or to match up with initial data.

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

### Resonance

Perhaps no one topic has been linked to Nobel prizes in physics more than resonance. 

What happens to our particular solution when $\omega=\omega_0$? This is the case where our naive version of undetermined coefficients fails. It works out instead that

$$y_p = \frac{A}{2\omega_0} t \sin(\omega_0 t).$$

The amplitude increases without bound, forever. This is a "pure" resonance, where the input can be infinitely amplified. 

```matlab
dom = [0 30];
for omega = [2.5 2.7 2.85 2.92]
    N = chebop(@(t,u) diff(u,2)+9*u-cos(omega*t), dom, [0;0], []);
    y = N\0;
    plot(y)
    hold on, xlabel t, ylabel y
    pause
end
yr = chebfun(@(t) t.*sin(3*t)/6,[0 30]);
plot(yr,'k')
```

## Damped oscillations

![Damping]({{ site.baseurl }}/assets/images/damping.jpg)
{:.meme}

We now turn on the damping term and consider the homogeneous problem $my'' + \gamma y' + k y = 0$. Obviously, everything comes down to how the characteristic roots depend on $\gamma$:

$$r_{1,2} = \frac{ -\gamma \pm \sqrt{ \gamma^2 - 4mk} }{2m}
= -c \pm \sqrt{ c^2 - \omega_0^2},$$

where $c=\gamma/2m$ and (as before) $\omega_0^2=k/m$. We get pure imaginary/pure oscillation roots $\pm i \omega_0$ in the undamped case. If damping is positive but very small, then we introduce an exponential envelope and decrease frequency a tad:

$$y_c = c_1 e^{-ct} \sin(t\sqrt{\omega_0^2-c^2}) + c_2 e^{-ct} \cos(t\sqrt{\omega_0^2-c^2}),$$

or alternatively

$$y_c = R e^{-ct} \cos(t\sqrt{\omega_0^2-c^2}) - \delta).$$

(Technically, it's a pseudofrequency, as the solution isn't periodic.) This situation is called *underdamped*{:.def}. 

If we let $\gamma$ continue to increase, then when $c=\omega_0$ the complex roots fuse into a single repeated root, $r=-c$, and the solution becomes

$$y_c = c_1 e^{-ct} + c_2 t e^{-ct}.$$

This situation is called *critically damped*{:.def}. 

Finally, as $\gamma$ continues to increase, the roots become distinct, real, and negative. We get $y_c = c_1 e^{r_1t} + c_2 e^{r_2t}$ for $r_1 < -c < r_2 < 0.$ This is called the *overdamped*{:.def} case. 

Note that whatever the nonzero damping level is, the fate of all solutions is $y_c\to 0$ as $t\to\infty$. Damping removes energy, and there's nothing to replace it. 

## Frequency response

Now for the full monty. We'll use a complex representation for the driving force (it lets us handle both sin and cos driving simultaneously). Our equation is 

$$y'' + 2c y' + \omega_0^2 y = A e^{i\omega t}.$$

The general solution will be $y_c+y_p$. As noted above, we know that $y_c\to 0$ as $t$ increases, and we call this the *transient solution*. We're more interested in the particular part. Plugging in $y_p=Ce^{i\omega t}$ leads to

$$y_p(t) = \frac{A}{(i\omega)^2+2c(i\omega)+\omega_0^2} e^{i\omega t}.$$

We call this the (slight misnomer) *steady-state response*{:.def} or the forced response. Once the transient has (exponentially) died away, this is all that's left. 

If the driving force were $3\sin(6t)$, for example, we'd set $\omega=6$, $A=3$, and take the imaginary part of $y_p$. 

### Example

In chebgui, try $u'' +0.1u' + 9u = \sin(\omega t)$ over $[0,80]$. 

---

The ratio

$$G(i\omega) = \frac{y_p(t)}{Ae^{i\omega t}} = \frac{1}{(i\omega)^2+2c(i\omega)+\omega_0^2} = \frac{1}{2i\omega c +\omega_0^2-\omega^2}$$

is called the *frequency response*{:.def}. As a complex-valued function, it's best expressed in polar form,

$$ G(i\omega) = g(\omega) e^{-i\phi(\omega)}, $$

where $g(\omega)=\|G(i\omega)\|$ is the *gain*{:.def} and $\phi(\omega)$ is the *phase*{:.def}. 

### Example

```matlab
omega0 = 3;
for c = [0.02 0.05 0.2 0.4]
    G = @(iom) 1/((iom+c)^2+omega0^2-c^2);
    g = chebfun(@(om) abs(G(1i*om)),[2.5 3.5]);
    plot(g,'linewidth',2)
    hold on
    [gmax,ommax] = max(g)
    plot(ommax,gmax,'*')
end
grid on
xlabel \omega, ylabel g
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
omega0 = 3;
for c = [0.02 0.05 0.2 0.4]
    G = @(iom) 1/((iom+c)^2+omega0^2-c^2);
    phi = chebfun(@(om) angle(conj(G(1i*om))),[2.5 3.5]);
    plot(phi/pi,'linewidth',2)
    hold on
    ylim([0 1])
end
grid on
xlabel \omega, ylabel \phi/\pi
```
