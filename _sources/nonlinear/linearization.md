(section-nl-linearization)=
# Linearization

A pendulum with length $L$ and angle of deflection $\theta(t)$ from the vertical is governed by the nonlinear second-order equation

:::{math}
\ddd{\theta}{t} + \frac{g}{L} \sin(\theta) = 0,
:::

where $g$ is gravitational acceleration. It's standard to argue that as long as $|\theta|$ remains small, a good approximation is the linear problem 

:::{math}
\ddd{\theta}{t} + \frac{g}{L} \theta = 0,
:::

because $\sin \theta \approx \theta$.  We want to get more systematic with this process. 


First note that we can recast the nonlinear second-order problem as a first-order system in two variables, just as we did for linear equations. Define $x=\theta$ and $y=\theta'$. Then

\begin{align*}
	\dd{x}{t} & = y, \\
	\dd{y}{t} & = -\frac{g}{L}\sin(x).
\end{align*}

This trick works for any nonlinear second-order equation $\theta''=g(t,\theta,\theta')$. Thus we can focus on problems in the general form 

\begin{align*}
	\dd{x}{t} & = F(x,y), \\
	\dd{y}{t} & = G(x,y).
\end{align*}


As we did with single scalar equations, we will pay close attention to steady states or fixed points of these systems. Here this means finding constants $(\hat{x},\hat{y})$ such that 

$$
F(\hat{x},\hat{y})=G(\hat{x},\hat{y})=0.
$$

For the nonlinear pendulum, both $(0,0)$ (straight down, at rest) and $(\pi,0)$ (straight up, at rest) are steady states. 

We are interested in the stability of fixed points, i.e., the dynamics close to them. We will use linear approximations of the functions $F$ and $G$ near a fixed point:

\begin{align*}
	F(x,y) & \approx F(\hat{x},\hat{y}) + \pp{F}{x}\cdot (x-\hat{x}) + \pp{F}{y} \cdot (y-\hat{y}),\\
	G(x,y) & \approx G(\hat{x},\hat{y}) + \pp{G}{x} \cdot (x-\hat{x}) + \pp{G}{y} \cdot (y-\hat{y}),\\
\end{align*}

where it is understood for brevity that the partial derivatives are all evaluated at $(\hat{x},\hat{y})$. Given that $(\hat{x},\hat{y})$ is a fixed point, $F(\hat{x},\hat{y})=G(\hat{x},\hat{y})=0$. 

Now define 

$$
u_1(t)=x(t)-\hat{x},\quad u_2(t)=y(t)-\hat{y}.
$$

Then 

\begin{align*}
	\dd{u_1}{t} = \dd{x}{t} & \approx \pp{F}{x} u_1 + \pp{F}{y} u_2, \\
	\dd{u_2}{t} = \dd{y}{t} & \approx \pp{G}{x} u_1 + \pp{G}{y} u_2. 
\end{align*}

This inspires the following definition.

:::{index} Jacobian matrix
:::

(nl-def-jacobian)=
::::{proof:definition} Jacobian matrix

The {term}`Jacobian matrix` of the system $x'=F(x,y),\, y'=G(x,y)$ is 

:::{math}
:label: nl-eq-jacobian
\mathbf{J}(x,y) = \twomat{\displaystyle \pp{F}{x}}{\displaystyle \pp{F}{y}}{\displaystyle \pp{G}{x}}{\displaystyle \pp{G}{y}}.
:::
::::

The Jacobian matrix is essentially the derivative of a 2D vector field. As such, it is also a function of the variables $x$ and $y$.

## Stability

Let's summarize. In the neighborhood of a fixed point $(\hat{x},\hat{y})$, we can define the *deviation from equilibrium* by the variables $u_1(t)=x(t)-\hat{x}$, $u_2(t)=y(t)-\hat{y}$. These variables approximately satisfy $\mathbf{u}'=\mathbf{J}(\hat{x},\hat{y})\mathbf{u}$, which is a linear, constant-coefficient system in two dimensions. Thus, **near a steady state, dynamics are mostly linear.** 

We are now right back into the phase plane we studied earlier. In particular: 

:::{proof:observation}
The stability of a steady state is (usually) determined by the eigenvalues of the Jacobian matrix at the steady state. 
:::

::::{admonition} Example
:class: tip

Let's examine the steady states of a pendulum with damping, 

:::{math}
\ddd{\theta}{t} + \gamma \theta' + \frac{g}{L} \sin(\theta) = 0,
:::

with $\gamma > 0$. It transforms into the first-order system

\begin{align*}
	\dd{x}{t} & = y, \\
	\dd{y}{t} & = -\frac{g}{L}\sin(x) - \gamma y.
\end{align*}

These define $F(x,y)$ and $G(x,y)$. From here we note all the first partial derivatives: 

\begin{align*}
\pp{F}{x} = 0, & \qquad \pp{F}{y} = 1,\\
\pp{G}{x} = - \frac{g}{L}\cos(x), & \qquad \pp{G}{y} = -\gamma.
\end{align*}

The first steady state we consider is at the origin. Here the Jacobian matrix is 

:::{math}
\begin{bmatrix} 
0 & 1 \\ -g/L & -\gamma
\end{bmatrix}.
:::

The eigenvalues are roots of $\lambda^2 +\gamma \lambda + \frac{g}{L}$, the same as a linear oscillator with $\omega_0 = \sqrt{g/L}$ and $Z = \gamma/2\omega_0$. If $Z<1$, we get a stable spiral. If $Z\ge 1$, we get a stable node. This all agrees well with our experience with a pendulum hanging straight down.

The other steady state is at $(\pi,0)$. Now the Jacobian is

:::{math}
\begin{bmatrix} 
0 & 1 \\ g/L & -\gamma
\end{bmatrix},
:::

with characteristic polynomial $\lambda^2 + \gamma \lambda - \frac{g}{L}$. The eigenvalues are 

$$
\lambda_1 = -\gamma + \sqrt{\gamma^2+4\frac{g}{L}}, \quad \lambda_2 = -\gamma - \sqrt{\gamma^2+4\frac{g}{L}}.
$$

It's obvious that $\lambda_2 < 0$. Since $\gamma^2+\frac{4g}{L} > \gamma^2$, it follows that $\lambda_1 > 0$. Hence this equilibrium is a saddle point.
::::

The caveat on using eigenvalues for stability is when they both have zero real part, which is weakly stable in the linear sense. In such cases the details of the nonlinear terms of the system can swing the stability either way. 

::::{admonition} Example
:class: tip

The system 

\begin{align*}
\frac{dx}{dt} &= 3x-\frac{xy}{2}\\
\frac{dy}{dt} &= -y+\frac{xy}{4}\\
\end{align*}

is called a {term}`predator–prey` equation. If species $y$ is set to zero, species $x$ would grow exponentially on its own (the prey). Similarly, species $y$ would die off on its own (predator). We assume that encounters between the species are jointly proportional to the population of each, and they subtract from the prey and add to the predators. 


We find fixed points when $3x-(x y/2)=(x y/4)-y=0$, which has two solutions, $(0,0)$ and $(4,6)$. The Jacobian matrix of the system is 

:::{math}
\mathbf{J}(x,y) = \begin{bmatrix} F_x & F_y  \\ G_x & G_y \end{bmatrix} = \begin{bmatrix} 3-y/2 & -x/2 \\ y/4 & -1+x/4 \end{bmatrix}.
:::

At the origin, the Jacobian becomes

:::{math}
\mathbf{J}(0,0) = \begin{bmatrix} 3 & 0 \\ 0 & -1 \end{bmatrix}.
:::

The eigenvalues of a diagonal matrix (in fact, any triangular matrix) are the diagonal entries. Hence the origin is a saddle point. 

At the other steady state we have

:::{math}
\mathbf{J}(4,6) = \twomat{0}{-2}{3/2}{0}.
:::

The characteristic polynomial is $\lambda^2 + 3$, so the eigenvalues are $\pm i\sqrt{3}$. Close to the point, the orbits are impossible to tell apart from those of a linear center: 

![linear center](linearized_center1.svg)

However, as we zoom out, the nonlinearity of the system makes its influence felt:

![nonlinear center](linearized_center2.svg)

For a different system, however, the nonlinearity could cause this point to be asymptotically stable or unstable.
::::

<div style="max-width:608px"><div style="position:relative;padding-bottom:66.118421052632%"><iframe id="kaltura_player" src="https://cdnapisec.kaltura.com/p/2358381/sp/235838100/embedIframeJs/uiconf_id/43030021/partner_id/2358381?iframeembed=true&playerId=kaltura_player&entry_id=1_703u26n1&flashvars[streamerType]=auto&amp;flashvars[localizationCode]=en&amp;flashvars[leadWithHTML5]=true&amp;flashvars[sideBarContainer.plugin]=true&amp;flashvars[sideBarContainer.position]=left&amp;flashvars[sideBarContainer.clickToClose]=true&amp;flashvars[chapters.plugin]=true&amp;flashvars[chapters.layout]=vertical&amp;flashvars[chapters.thumbnailRotator]=false&amp;flashvars[streamSelector.plugin]=true&amp;flashvars[EmbedPlayer.SpinnerTarget]=videoHolder&amp;flashvars[dualScreen.plugin]=true&amp;flashvars[Kaltura.addCrossoriginToIframe]=true&amp;&wid=1_kplxqi9v" width="608" height="402" allowfullscreen webkitallowfullscreen mozAllowFullScreen allow="autoplay *; fullscreen *; encrypted-media *" sandbox="allow-forms allow-same-origin allow-scripts allow-top-navigation allow-pointer-lock allow-popups allow-modals allow-orientation-lock allow-popups-to-escape-sandbox allow-presentation allow-top-navigation-by-user-activation" frameborder="0" title="Kaltura Player" style="position:absolute;top:0;left:0;width:100%;height:100%"></iframe></div></div>
