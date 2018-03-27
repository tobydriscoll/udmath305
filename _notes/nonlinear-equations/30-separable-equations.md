---
layout: note
title: "Separable equations"
chapter: "Nonlinear equations"
---
* TOC
{:toc}

*(See section 2.1)*

This technique is for FlaSh problems only.

If we can contrive it so that $y' = f(t)g(y)$, then we can write 

$$ \int \frac{1}{g(y)}\, dy = \int f(t)\,dt.$$

An ODE that can be written this way is called *separable*{:.def}. Provided we can do the integrals--which is no sure thing--then we get solutions. Both integrals introduce an integration constant, but you only have to keep one of them.

## Example

> Solve $t^2y' = y-ty$ for $t>0$.

Sometimes you have to massage the problem a little to see the separated form.

$$ t\frac{dy}{dt} = y(1-t) $$

$$ \frac{dy}{y} = \frac{1-t}{t}\,dt $$

$$ \ln|y| = \ln(t) - t + C $$

$$ |y| = e^C te^{-t} \Rightarrow y = \pm e^C te^{-t}.$$

We have to be a little careful here. While $C$ is arbitrary, $e^C$ must be positive. So all we can say now is that $y=Ate^{-t}$ is a solution for any nonzero $A$. However, we can simply go back to the original problem and observe that $y\equiv 0$ is also a solution, so we can drop the restriction on $A$.

---

![Separated at birth]({{site.baseurl}}/assets/images/separated-at-birth.jpg)
{:.meme}


When we divide by expressions to get a separated form, we rule out any case in which those expressions could be zero. That's what happened in the example above. However, it's easy to check those cases after the fact.

Separable problems lead to implicit solutions when it's difficult to solve for $y$ after the integrations. 

## Example (implicit solution)

> Solve $\dfrac{dy}{dx} = \dfrac{3x^2}{3y^2-6}$, $y(0)=1$.

$$ (3y^2-6)\,dy = 3x^2\, dx $$

$$ y^3-6y = x^3 + C $$

We have to settle for the implicit solution, as there's no easy way to solve for $y$ here. However, we can still use the initial condition to eliminate the arbitrary $C$. 

$$ 1-6=C \Rightarrow y^3-6y-x^3 +5 = 0.$$


    
