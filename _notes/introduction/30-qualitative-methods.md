---
layout: note
chapter: "Introduction"
title: "Qualitative methods"
---
* TOC
{:toc}

*(See section 1.2, pp 12-13, 21-25 only.)*

In this section we consider **first-order problems only**. 

## Equilibria  

Suppose $y'=f(y)$ (FlASh) and that there is some value $y_e$ such that $f(y_e)=0$. Then the solution satisfies $y'=0$ if it ever achieves the value $y_e$; it is stuck there forever. We call such a value an *equilibrium*{:.def}. 

Instinctively you know that not all equilibria are the same. A ball sitting at the bottom of a valley will sit there happily forever, while one sitting at the top of a hill might be technically motionless but will roll off at the slightest breeze. More relevantly, you are very likely to see a ball come to rest at the bottom of a valley, but you will never see one come to rest at the top of a hill! We call the relevant property *stability*{:.def}. The valley has it; the hill does not. 

Suppose the system is at an equilibrium $y_e$ and we nudge it ever so slightly to a larger value of $y$. For stability, we want the resulting $y'$ to be negative, that is, we want $f(y)<0$ for $y>y_e$ in the neighborhood. Similarly, if we nudge $y$ to be smaller, we want $f(y)>0$. So for stability we want $f$ to be a decreasing function at $y_e$, i.e., $f'(y_e)<0$. If instead $f'(y_e)>0$, then we will have an unstable equilibrium. 

### Example

*Find and classify the equilibria of $y'=y-y^3/3$.*

We have $f(y)=y-y^3/3=y(1-y^2/3)$, so $y=0$ and $y=\pm\sqrt{3}$ are the equilibria. We find

* $f'(0) = 1-0 = 1 > 0$ (unstable)
* $f'(\pm\sqrt{3}) = 1-3 = -2 <0$ (stable)

## Slope field / Direction field

Suppose now $y'=f(t,y)$ (FlaSh). (This includes the previous case, of course.) One device for getting some understanding of the solutions is the *slope field*{:.def} or direction field of the ODE. At points in the $(t,y)$ plane, we evaluate $f$. Since that gives the slope of the solution there, we draw a tiny tangent line having that slope. The result gives a good idea of how solutions will look.

See the [MATLAB code](https://www.dropbox.com/s/ch2lbv7m6u3spst/slopefield.m?dl=0) for `slopefield`.

### Examples

```matlab
slopefield(@(t,y) y,[0 3],[-1 1])
slopefield(@(t,y) -y,[0 3],[-1 1])
slopefield(@(t,y) t^2-y,[0 2],[-1 1])
slopefield(@(t,y) y-y^3/3,[0 3],[-2 2])
```

