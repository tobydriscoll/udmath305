---
layout: note
chapter: "Introduction"
title: "Classifications"
---
* TOC
{:toc}

*(See section 1.3.)*

A differential equation is an equation that contains derivatives of an unknown function. The unknown quantity is the *dependent variable*{:.def}, and it depends on an *independent variable*{:.def}. For clarity we often use $y$ and $t$ for these, respectively. 

There are a number of important things to characterize about a differential equation. These properties can tell us a lot about the structure of solutions, even before we attempt to analyze the problem. 

## Ordinary/Partial

If the problem has more than one independent variable, then we need to use partial derivatives of the solution. Then we call the problem a *partial differential equation (PDE)*{:.def}. Otherwise it is an *ordinary differential equation (ODE)*{:.def}. 

This is the most important distinction to make. ODEs aren't easy, but PDEs make them look like Pong. We'll exclusively be looking at ODEs.

| $\displaystyle\frac{\partial u}{\partial t} = \frac{\partial^2 u}{\partial x^2} + \frac{\partial^2 u}{\partial y^2}$  | $\displaystyle\frac{d^2y}{dt^2} + y = 1$ | 

Note: When the independent variable is $t$, sometimes you'll see dots used to mean derivatives, as in $\ddot{y}+y=1$. 

## First order/High-order

The *order*{:.def} of an ODE is the order of the highest derivative of the dependent variable. First-order ODEs are the ones that we can most often solve. Of the higher-order problems, second-order make up 95% of applications. 

| $y' + \sin(y) = 0$ | $y'' + ty = 0$ | 

## Linear/Nonlinear

The ODE is *linear*{:.def} if the terms $y$, $y'$, $y''$, and so on appear only linearly, that is, without powers, wrapped in functions, multiplied together, etc. Otherwise the problem is *nonlinear*{:.def}. 

| $y'' + y' + \sin(t) y = 0$ | $ y'' + yy' = 0 $ | 

Linear problems can always be solved, at least in principle and certainly with computer help. They also have a great deal of structure that is valuable even before the solution is known. 

Some nonlinear first-order problems are solvable, and a few higher-order ones are as well. But nonlinear problems aren't even certain to have a solution, or a unique solution. It's a wild world. 

## Autonomous/Nonautonomous

The solution always depends on $t$ (the independent variable). But if the *problem statement* doesn't, then it is called *autonomous*{:.def}. 

| $y'' + y' + \sin(y) = 0$ | $ y'' + ty' + \sin(y) = 0 $ | 

In an autonomous problem, the meaning of "$t=0"$ is completely arbitrary. Otherwise, the external world has a clock that matters somehow. 

## Scalar/Vector

The dependent variable may be a scalar or a vector quantity. If more than one dependent scalar variable is named, we can bundle them together as components of a vector. There should be one scalar equation per scalar dependent variable. 

| $y'' + y' + \sin(y) = 0$ | $ u' = v,\quad v'+v - \sin(u) = 0 $ | 

## Homogeneous/Nonhomogeneous

If you group all the $y$-related terms on one side, and the other side of the equation is zero, we call the problem *homogeneous*{:.def}. (This term doesn't always have a clear meaning in nonlinear problems.)

| $y'' + y' + \sin(y) = 0$ | $ y'' + y' + y = \sin(t) $ | 

In the linear case, the distinction of a homogeneous problem is like that of a line or plane that goes through the origin.

## IVP/Other

An ODE may be given all by itself, in which case there are typically one or more arbitrary constants in the solution.

If a problem of order $n$ also specifies values for $y,y',\ldots,y^{(n-1)}$ at a single value of $t$, we call it an *initial-value problem (IVP)*{:.def}. An IVP typically (but not always) has a unique solution.

You may instead be given the same data but at two values of $t$. In that case you have a *boundary-value problem (BVP).*{:.def} In an IVP, time $t$ flows in one direction, but in a BVP, $t$ flows in both directions and is actually therefore more likely a space variable. We may do a little bit with BVPs if we have time (pun intended). 

| $y'' + y' + \sin(y) = 0,\quad y(0)=1,\, y'(0)=0$ | $ y'' + y' + \sin(y) = 0, \quad y(0)=1,\, y(4)=0$  | 

## The FLASHI scheme

Except for the ordinary/partial distinction, each one of the traits above can be tracked by what we will call the FLASHI scheme. Each letter is capitalized when its corresponding property is true:

* **F**irst order?
* **L**inear?
* **A**utonomous?
* **S**calar?
* **H**omogeneous?
* **I**VP? (We leave this letter off altogether if it's a bare ODE with no extra conditions.)

Thus,

| $y'' + y' + \sin(y) = 0$ | flASH | 
| $ y'' + y' + y = \sin(t) $ | fLaSh |
| $ u' = v,\quad v'+v - \sin(u) = 0 $ | FlAsH |
| $y'+ty=1$, $y(2)=0$ | FLaShI |

In every case, the capitalized form is easier than the lowercase form. In fact, the lowercase form is typically a generalization of the uppercase form. Thus, theoretical statements about fLaSh problems should also technically be applicable to FLASh problems, for example. The exception is I; while IVPs are easier than BVPs for the most part, the relationship is not one of special case/generalization. 
