# Nonlinear ODEs

Given how much we have invested in understanding linear equations and systems, it may be a shock to realize that they pale in comparison to the possibilities in nonlinear problems. In a linear problem we can say a lot about the structure of solutions, and we do have solution formulas, though we may not be able to carry them out in closed form. 

By contrast, nonlinear IVPs don't even always have solutions, or unique ones. Even for those that do, calculating the solution exactly is more the exception than the rule. Hence we use other tools to draw some conclusions about the solutions of many problems.  

As with linear problems, nonlinear ODEs of order higher than one can be converted to first-order problems in a higher dimension. Therefore we can organize the discussion entirely around first-order problems. In the first few sections we limit ourselves to scalar (or one-dimensional) problems in the form $x'=f(t,x)$. Then we turn our attention to systems of two equations in two variables. The extension to still higher dimensions is closely related, but more complicated.

**Terms in this part**

:::{glossary}
Jacobian matrix
  Matrix of first partial derivatives of a nonlinear vector-valued function.

phase line diagram
  Plot for a scalar autonomous equation that reveals steady states and their stability.
:::