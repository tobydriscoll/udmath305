---
layout: note
chapter: "Introduction"
title: "Models and solutions"
---
* TOC
{:toc}

## Sexy models

See Keynote.

* Beer, FitzHugh-Nagumo, Circulatory system
* Numerical solutions
* Modeling/solution/simulation 

## Exponential growth/decay

*(See section 1.1 for much of this.)*

The very simplest nontrivial ODE is 

$$\frac{dy}{dt} = ky,$$

where $k$ is a constant. Many phenomena obey such a model, at least approximately:

* **Population.** A population $y(t)$ of organisms has a constant net per capita birth (or death) rate. *(See p. 7.)*
* **Interest.** Here $y(t)$ is an amount invested with fixed positive interest rate $k$.
* **Radioactivity.** $y(t)$ is the mass of a radioactive isotope, and $k<0$. 
* **Pharmacokinetics.** $y(t)$ is the amount of a drug being metabolized in the body (called first-order kinetics).
* **Cooling.** If $y(t)$ is the temperature of a body kept in an
  environment at fixed temperature $E$, let $z(t)=y(t)-E$. Then
  $z'=kz$ for cooling rate $k<0$; temperature tends toward $E$
  exponentially. This is *Newton's Law of Cooling*. *(See Example 1,
  section 1.1.)*

## Verifying solutions

Even if we don't know how to come up with the solution of an ODE, it's easy to check that it's correct. For instance, we can show that $y=Ce^{kt}$ is a solution of $y'=ky$ for any value of $C$:

$$y' = kCe^{kt}=ky.$$

## General solution, integral curves

As a matter of fact, *all* solutions have the form $y=Ce^{kt}$. Hence we call this the *general solution*. 

Graphically, "the" solution $y=Ce^{kt}$ is actually a family of
curves, called *integral curves*, parameterized by $C$. *(See pp. 5-6.)*

```matlab
k = -0.5;
for C = -3:3
    y = @(t) C*exp(k*t);
    fplot(y,[-4 4],'linewidth',2)
    hold on
end
ylim([-10 10])
xlabel t, ylabel y
```

![integral curves](10-example1.svg)

## Initial-value problem (IVP)

We may be given additional information, such as the *initial condition* $y(0)=y_0$. The ODE together with this condition is an *initial-value problem*. In this IVP, only one value of $C$ will work, and the solution is $y=y_0e^{kt}$. 

The solution of the problem is unbounded exponential growth (or decrease) as $t\to\infty$ if $k>0$, and exponential decay to zero if $k<0$. At the boundary case $k=0$, the solution is constant. 


*Show in Chebfun GUI.*

### Case study: Caffeine

*Reference: R. Newton et al., “Plasma and salivary pharmacokinetics of caffeine in man,” European Journal of Clinical Pharmacology 21 (1981), pp. 45–52.*

Let $y(t)$ denote the amount of caffeine in the bloodstream. Experimentally this satisfies first-order kinetics, $y'=-ky$, for a positive rate constant $k$. The constant is most often expressed as a *half-life* $t_H$, the time at which the amount has been reduced by a factor of 2. Thus, $e^{-kt_H}=1/2$, so

$$k=\ln(2)/t_H.$$

Although it varies widely, a reasonable value for $t_H$ is 6 hours. Hence $k=\ln(2)/6\approx 0.116$ per hour.

Experiments show that a 300 mg oral dose of caffeine, such as might be found in a large mug of drip-brewed coffee, creates a concentration of about 8 μg/mL in the blood plasma. Here's how that decays over time.

*Show in chebgui.* 

