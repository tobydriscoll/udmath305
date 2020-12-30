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

```{glossary}
```
