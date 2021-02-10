---
jupytext:
  cell_metadata_filter: -all
  formats: md:myst
  text_representation:
    extension: .md
    format_name: myst
    format_version: '0.12'
    jupytext_version: 1.5.0
kernelspec:
  display_name: Matlab
  language: matlab
  name: matlab
---

# Complex numbers

*For a really smart and entertaining introduction to complex numbers, I recommend [this video series](https://youtu.be/T647CGsuOVU).*

We need to take a short but highly relevant detour to talk about complex numbers.

There's often a lot of uneasiness about complex numbers. Terminology is part of the reason. Using "real" and "imaginary" to label numbers is the residue of a value judgment that ruled mathematics for centuries. But complex numbers are actually just as "real" as so-called real numbers. If anything, they are actually *more* fundamental to the universe.

As a practical matter, you can pretty much always replace a complex value with two real ones, and vice versa. But sometimes the manipulations are a lot easier in the complex form. In particular, you may be able to replace trigonometry with algebra.

## The reality of imaginary numbers (optional)
`````{toggle}

Let's rewind a bit. We can probably take for granted the positive integers 1, 2, 3, and so on, and we'll throw in zero as well, though this too was controversial for centuries. It's not long before we want to solve a problem like $x+1=0$. Annoyingly, we can pose the problem using just nonnegative integers, but we can't solve it. So we accept the existence of the negative integers.

I can imagine quite a bit of skepticism about this historically. ("Sure, Wei. Ever seen a negative goat?") But if you've ever taken out a loan, you know that negative numbers can have very real consequences.

Eventually, the negative integers seem "obvious" and perfectly natural. But then we run into a problem like

```{math}
2x - 1 = 0.
```

We can pose this problem with integers, but we can't solve it. So we get used to accepting rational numbers, too.

Rational numbers are pretty weird. Between any pair of them, you have infinitely more rational numbers! Yet it turns out they have (huge) gaps as well. You can't solve

```{math}
x^2 - 2 = 0
```

using only rational numbers. So, you're willing to take on irrational numbers too. Talk about weird--every one of them has an infinite, non-repeating decimal expansion.

So much for the "real" numbers. At least we have filled in the so-called number line. But then you get to

```{math}
x^2 + 1 = 0,
```

which is purely "real" but insolvable. Solutions to this equation were widely resisted for a very long time (say, the 18th century), to the point they were called "imaginary" (looking at you here, Descartes).

Yet something amazing happens if you do accept imaginary numbers, and their expansion to the complex numbers. Namely, *The Fundamental Theorem of Algebra*, which states that if you write down a polynomial using complex numbers, it will have only complex numbers as solutions. So there's no infinite ladder of hypercomplex numbers that we have to ascend--just one rung past the "real" one is all we need to tidy things up perfectly.
`````
## Basic arithmetic

We can write a complex number $z\in \complex$ as $z=x+iy$, where $i^2=-1$ and $x$ and $y$ are real numbers known as the {term}`real part` and {term}`imaginary part` of $z$,

```{math}
z = x + i y \quad \Leftrightarrow \quad x = \Re(z), \quad y = \Im(z).
```

Writing a complex number this way is equivalent to using rectangular or Cartesian coordinates in the plane to specify a point $(x,y)$. Thus complex numbers are on a number *plane* rather than a number line.

There is a generalization of absolute value to complex numbers known as the {term}`modulus`, a real nonnegative quantity easily computed via

```{math}
|z|^2 = [\text{Re}(z)]^2 + [\text{Im}(z)]^2.
```

Like the absolute value, $|z|$ is the distance from $z$ to the origin, and $|w-z|$ is the distance between two complex numbers. Here, though, the distances are in the plane rather than on a line.

An important operation on complex numbers that has no real counterpart is the {term}`conjugate`,

```{math}
\bar{z} =\text{Re}(z) - i \,\text{Im}(z).
```

Geometrically this is a reflection across the real axis of the plane. No matter how complicated an expression is, you just replace $i$ by $-i$ everywhere to get the conjugate.

You add, subtract, and multiply complex numbers by applying the usual algebraic rules, applying $i^2=-1$ as needed. They should give little trouble. Division can be a little trickier, even though the rules are always the same. One trick is to give a complex ratio a purely real denominator:

```{math}
\frac{w}{z} = \frac{w \bar{z}}{z \bar{z}} = \frac{w \bar{z}}{|z|^2}.
```

This is a lot like rationalizing a denominator with square roots. 

::::{admonition} Example
:class: tip
$$
\frac{2-i}{3+2i} = \frac{2-i}{3+2i}\cdot \frac{3-2i}{3-2i}
= \frac{6-4i-3i+2i^2}{3^2+2^2} = \frac{4-7i}{13}.
$$
::::

::::{admonition} Example
:class: tip
Suppose that $|z|=1$. Then 

$$
\frac{1}{z} = \frac{1}{z}\cdot \frac{\bar{z}}{\bar{z}} = \frac{\bar{z}}{|z|^2} = \bar{z}.
$$
::::

```{tip}
Memorize the special case $\dfrac{1}{i} = -i$.
```

Here are some more simple rules to know:

````{proof:property} Complex arithmetic
For complex numbers $w$ and $z$,

1. $|\bar{z}| = |z|$
1. $|wz| = |w|\cdot |z|$
1. $|w+z|\le |w| + |z|$ (triangle inequality)
1. $\left| \dfrac{1}{z} \right| = \dfrac{1}{|z|}$
1. $\overline{wz}=\bar{w}\cdot \bar{z}$
1. $\overline{w+z}=\bar{w}+\bar{z}$
1. $\overline{\left(\dfrac{1}{z} \right)} = \dfrac{1}{\bar{z}}$
1. $|z|^2 = z\cdot \bar{z}$
````

More to come later on complex numbers, but this will be enough for now.

<div style="max-width:608px"><div style="position:relative;padding-bottom:66.118421052632%"><iframe id="kaltura_player" src="https://cdnapisec.kaltura.com/p/2358381/sp/235838100/embedIframeJs/uiconf_id/43030021/partner_id/2358381?iframeembed=true&playerId=kaltura_player&entry_id=1_flswsnsm&flashvars[streamerType]=auto&amp;flashvars[localizationCode]=en&amp;flashvars[leadWithHTML5]=true&amp;flashvars[sideBarContainer.plugin]=true&amp;flashvars[sideBarContainer.position]=left&amp;flashvars[sideBarContainer.clickToClose]=true&amp;flashvars[chapters.plugin]=true&amp;flashvars[chapters.layout]=vertical&amp;flashvars[chapters.thumbnailRotator]=false&amp;flashvars[streamSelector.plugin]=true&amp;flashvars[EmbedPlayer.SpinnerTarget]=videoHolder&amp;flashvars[dualScreen.plugin]=true&amp;flashvars[Kaltura.addCrossoriginToIframe]=true&amp;&wid=1_wn64do5u" width="608" height="402" allowfullscreen webkitallowfullscreen mozAllowFullScreen allow="autoplay *; fullscreen *; encrypted-media *" sandbox="allow-forms allow-same-origin allow-scripts allow-top-navigation allow-pointer-lock allow-popups allow-modals allow-orientation-lock allow-popups-to-escape-sandbox allow-presentation allow-top-navigation-by-user-activation" frameborder="0" title="Kaltura Player" style="position:absolute;top:0;left:0;width:100%;height:100%"></iframe></div></div>
