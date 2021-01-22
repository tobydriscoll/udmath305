# Overview

A **differential equation** is an equation that includes one or more derivatives of an unknown function. In this course we limit ourselves to **ordinary differential equations**, in which the unknown function depends only on one variable. Often, that variable is time, and some of our language is influenced by that, but the variable can be anything physical or abstract.

It turns out that while calculus is good at computing some answers, it's *really* good at posing the right questions. In the study of dynamics, we usually don't know a formula for the thing of interest; rather, we know a differential equation that the thing satisfies at least approximately.

Normally there is a cyclical process:

1. Derive a mathematical model based on assumptions and observations.
2. Analyze the model using symbolic and computational tools.
3. Gain insight about the model's behavior and limitations.
4. If necessary, revisit assumptions and return to step 1.

In this course we spend most of our time on step 2. In fact, we focus on symbolic methods for finding and applying solution formulas to certain canonical problems. These problems are not nearly as complex as models of most real-world phenomena, but the seeds of the full behavior can be found in the simpler cases. Understanding them is a useful step toward getting the most from numerical simulations that are necessary for just about every realistic model.

Our starting point will be differential equations that include only the first derivative of the unknown. We will rapidly see that these equations are all about growth and decay processes.

## Glossary

```{glossary}
autonomous
  ODE that does not contain an explicit dependence on time (e.g., in the coefficient or forcing functions); also called time-invariant.

coefficient function
  Term in a first-order linear ODE that multiplies the solution.

continuously stirred tank reactor
  Chamber in which the contents are stirred so rapidly that perfect instantaneous mixing is assumed.

dependent variable
  Unknown quantity to be solved for in an ODE.

doubling time
  In a linear growth problem, the time taken for the solution to double.

first-order ODE
  An ordinary differential equation in which only the first derivative of the dependent variable appears.

first-order linear ODE
  A first-order ODE described by a linear operator, i.e., in which the dependent variable appears only linearly.

forcing function
  Term in a first-order linear ODE that does not multiply the solution.

general solution
  Formula that expresses every possible solution to an ODE.

half-life
  In a linear decay process, the time taken for half of the solution to decay away.

homogeneous
  A linear ODE with zero forcing.

independent variable
  Quantity on which the dependent variable in an ODE depends.

initial condition
  Given value of the solution at a particular time.

initial-value problem
  Combination of a first-order ODE and an initial condition.

integrating factor
  Multiplicative factor that transforms one side of a first-order linear ODE into an exact derivative of a product.

linear operator
  Map from functions to functions that obeys the properties of a linear operation.

method of undetermined coefficients
  In a linear problem with contant coefficient and simple forcing, a method to find a particular solution without integration.

parameter
  Quantity that affects the solution of an ODE but remains fixed throughout the solution.

relaxation time
  In a linear decay process, the reciprocal of the absolute value of the rate constant.

solution
  Function that makes an ODE (and possible initial condition) true when used to replace the dependent variable.

variation of parameters
  Method for finding a particular solution in a linear ODE, given a homogeneous solution.

```
