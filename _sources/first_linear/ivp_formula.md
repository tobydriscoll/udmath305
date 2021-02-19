---
jupytext:
  cell_metadata_filter: -all
  formats: md:myst
  text_representation:
    extension: .md
    format_name: myst
    format_version: '0.12'
    jupytext_version: 1.5.1
kernelspec:
  display_name: Matlab
  language: matlab
  name: matlab
---
# IVP formula

Let's recapitulate the solution strategy for $\opA[x]=f$ from start to finish when given the initial condition $x(t_0)=x_0$. Recall that we have the option of defining the homogeneous solution using a *definite* integral,

$$
\tilde{q}(t) = \int_{t_0}^t a(r)\, dr.
$$

This form has the property that $\tilde{q}(t_0)=0$, which turns out to be convenient. Then we define

$$
\tilde{g}(t) = \exp\bigl[ \tilde{q}(t) \bigr],
$$

so that $\tilde{g}(t_0)=1$. The VoP formula has another integral that we can also write in definite form,

$$
\tilde{k}(t) = \int_{t_0}^t \frac{f(s)}{\tilde{g}(s)}\, ds,
$$

such that $\tilde{k}(t_0)=0$. These definitions combine to produce a solution to the IVP with no unknown constants:

:::{math}
:label: firstlin-ivp-formula
x(t) = \tilde{g}(t) x_0 + \tilde{g}(t) \tilde{k}(t).
:::

This works because it's a combination of homogeneous and particular solutions that clearly satisfies $x(t_0)=x_0$. 

Equation {eq}`firstlin-ivp-formula` invites an interesting interpretation. The first term, $\tilde{g}(t) x_0$, represents the solution of $\opA[x]=0$ with initial value $x(t_0)=x_0$. This can be called the **free response**, meaning free from external forcing. The other term is the **forced response** of the system, starting from a zero initial value.

## Exponential form

It's worth replacing the $\tilde{g}$ references above with their exponential definitions. The particular solution part becomes

$$
x_p(t) = \exp \bigl[ \tilde{q}(t) \bigr] \int_{t_0}^t \exp \bigl[ -\tilde{q}(s) \bigr]\, f(s) \, ds.
$$

The exponential in front is constant as far as the integration is concerned (it does not depend on $s$). Thus

$$
x_p(t) = \int_{t_0}^t \exp \bigl[ \tilde{q}(t) -\tilde{q}(s) \bigr]\, f(s) \, ds.
$$

By elementary properties of integrals,

\begin{align*}
\tilde{q}(t) -\tilde{q}(s) & = \int_{t_0}^t a(r)\, dr - \int_{t_0}^s a(r)\, dr \\
&= \int_{t_0}^t a(r)\, dr + \int_s^{t_0} a(r)\, dr \\
&= \int_{s}^t a(r)\, dr.
\end{align*}

Here is a key new observation. The integrand of $x_p$,

$$
X(s) = \exp \left[ \tilde{q}(t) -\tilde{q}(s) \right]\, f(s) = \exp \left[ \int_{s}^t a(r)\, dr \right]\, f(s), 
$$

has the exact same form as 

$$
\tilde{g}(t) x_0 = \exp \left[ \int_{t_0}^t a(r)\, dr \right]\, x_0,
$$

except that it starts from $x(s)=f(s)$ rather than $x(t_0)=x_0$. Therefore $X(s)$ is the free response of the system at time $t$ due to the condition $x(s)=f(s)$, and the particular solution

$$
  x_p(t) = \int_{t_0}^t X(s) \, ds
$$

integrates (i.e., sums), over all the instants $s$ between $t_0$ and $t$, the free responses of the system due to $f(s)$. In fact, it's not much of a stretch to consider this formula a linear combination of free responses, just using a continuous coefficient function $f(s)$ rather than discrete coefficients! Finally, the complete solution to the IVP just adds the free response of the actual initial condition to the summed force responses. 

## The nature of linear solutions

The following summarizes the formulas above.

::::{proof:formula} Solution of 1st order, linear IVP
The solution of $x'-a(t)x=f(t)$, $x(t_0)=x_0$, is 

$$
x(t) = \exp \left[ \int_{t_0}^t a(r)\, dr \right]\, x_0 + \int_{t_0}^t  \exp \left[ \int_{s}^t a(r)\, dr \right]\, f(s)\, ds.
$$
::::

The formula becomes easier to read and parse in the case of a constant coefficient function $a$:

$$
x(t) = e^{a(t-t_0)} x_0 + \int_{t_0}^t e^{a(t-s)} f(s)\, ds.
$$

As solution formulas, these results are ultimately not harder nor easier to apply to a specific example than the steps we used to solve earlier examples. The real value here is in what is revealed about how linear systems actually work: you can decompose them into individual contributions, then add the results together. 

<div style="max-width:608px"><div style="position:relative;padding-bottom:66.118421052632%"><iframe id="kaltura_player" src="https://cdnapisec.kaltura.com/p/2358381/sp/235838100/embedIframeJs/uiconf_id/43030021/partner_id/2358381?iframeembed=true&playerId=kaltura_player&entry_id=1_gbz700v1&flashvars[streamerType]=auto&amp;flashvars[localizationCode]=en&amp;flashvars[leadWithHTML5]=true&amp;flashvars[sideBarContainer.plugin]=true&amp;flashvars[sideBarContainer.position]=left&amp;flashvars[sideBarContainer.clickToClose]=true&amp;flashvars[chapters.plugin]=true&amp;flashvars[chapters.layout]=vertical&amp;flashvars[chapters.thumbnailRotator]=false&amp;flashvars[streamSelector.plugin]=true&amp;flashvars[EmbedPlayer.SpinnerTarget]=videoHolder&amp;flashvars[dualScreen.plugin]=true&amp;flashvars[Kaltura.addCrossoriginToIframe]=true&amp;&wid=1_yntrpx88" width="608" height="402" allowfullscreen webkitallowfullscreen mozAllowFullScreen allow="autoplay *; fullscreen *; encrypted-media *" sandbox="allow-forms allow-same-origin allow-scripts allow-top-navigation allow-pointer-lock allow-popups allow-modals allow-orientation-lock allow-popups-to-escape-sandbox allow-presentation allow-top-navigation-by-user-activation" frameborder="0" title="Kaltura Player" style="position:absolute;top:0;left:0;width:100%;height:100%"></iframe></div></div>