# Separable equations

:::{index} separable ODE
:::
All problems in the autonomous form $x'=f(x)$, and more generally in the form 

$$
x'=f(x)g(t),
$$ 

are called {term}`separable equations` and can be solved systematically (up to performing integrations). Rather than deriving a formula for them, it's best to just repeat a straightforward process for each new problem.

::::{admonition} Example
:class: tip

Solve the variable growth archetype $x'=2t x$. 

:::{dropdown} Solution
We express $x'$ as $dx/dt$ and then isolate the variables:

$$
\frac{d x}{x} = 2t\,d t.
$$

Integrating both sides leads to $\ln |x| = t^2 + C$, or $|x|=A e^{t^2}$ for a positive constant $A$ (since it is the exponential of a real constant). Taking the absolute value off of $x$ means that $A$ can be negative as well. Also, $A=0$ clearly leads to a solution. Finally, we conclude that $x=Ce^{t^2}$ for arbitrary $C$.
:::
::::

::::{admonition} Example
:class: tip

Solve $x'=t^2/(x^3-2)$, subject to $x(0)=4$.

:::{dropdown} Solution
Separation and integration lead to

$$
\int x^3\, dx = \int t^2\, dt,
$$

or 

$$
\frac{1}{4}x^4 - 2x  = C + \frac{1}{3}t^3.
$$

We could work hard to try to solve explicitly for $x$, but it's probably best to leave it in implicit form. This is a common limitation of separable solutions. Even in implicit form, though, we can solve for the arbitrary constant by setting $x=4$ and $t=0$ in the implicit equation, leading to

$$
4^4/4 - 2 \cdot 4 = C + 0.
$$

Hence $C=56$.
:::
::::

Sometimes the separable structure isn't immediately apparent, and you have to manipulate the expressions a bit.

::::{admonition} Example
:class: tip

Find the general solution of $t x' = x - t x$. 

:::{dropdown} Solution
Nothing happens until you see that you can factor out $x$ on the right side. Then we have

$$ 
\dd{x}{t} = \frac{x(1-t)}{t},
$$

or

$$
\frac{dx}{x} = (t^{-1}-1)\,dt.
$$

Thus $\ln|x| = \ln|t|-t+C$, or 

$$
|x| = e^C |t| e^{-t}.
$$ 

Once we take off the absolute values, we have

$$
x= \pm A t e^{-t} \quad (A>0).
$$ 

We divided the equation through by $x$ and therefore eliminated $x=0$ as a possibility, so we need to check that separately. We easily see that $x\equiv 0$ is a steady state, so $A=0$ is allowed as well in our solution formula.

Note that this problem is also linear, so it could be approached that way as well. Of course you must get the same solution either way!
:::
::::	

<div style="max-width:608px"><div style="position:relative;padding-bottom:66.118421052632%"><iframe id="kaltura_player" src="https://cdnapisec.kaltura.com/p/2358381/sp/235838100/embedIframeJs/uiconf_id/43030021/partner_id/2358381?iframeembed=true&playerId=kaltura_player&entry_id=1_ku9r9gn2&flashvars[streamerType]=auto&amp;flashvars[localizationCode]=en&amp;flashvars[leadWithHTML5]=true&amp;flashvars[sideBarContainer.plugin]=true&amp;flashvars[sideBarContainer.position]=left&amp;flashvars[sideBarContainer.clickToClose]=true&amp;flashvars[chapters.plugin]=true&amp;flashvars[chapters.layout]=vertical&amp;flashvars[chapters.thumbnailRotator]=false&amp;flashvars[streamSelector.plugin]=true&amp;flashvars[EmbedPlayer.SpinnerTarget]=videoHolder&amp;flashvars[dualScreen.plugin]=true&amp;flashvars[Kaltura.addCrossoriginToIframe]=true&amp;&wid=1_vaj9v5iq" width="608" height="402" allowfullscreen webkitallowfullscreen mozAllowFullScreen allow="autoplay *; fullscreen *; encrypted-media *" sandbox="allow-forms allow-same-origin allow-scripts allow-top-navigation allow-pointer-lock allow-popups allow-modals allow-orientation-lock allow-popups-to-escape-sandbox allow-presentation allow-top-navigation-by-user-activation" frameborder="0" title="Kaltura Player" style="position:absolute;top:0;left:0;width:100%;height:100%"></iframe></div></div>
