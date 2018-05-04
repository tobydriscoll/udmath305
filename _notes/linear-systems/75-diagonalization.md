---
layout: note
title: "Diagonalization"
chapter: "Linear systems"
---
* TOC
{:toc}


We have yet another way to look at the solution of $\mathbf{x}'=\mathbf{A}\mathbf{x}$ in terms of eigenvalues and eigenvectors. To continue with our practice, we assume the system is 2-dimensional, but everything is essentially the same in $n$ dimensions. However, it *is* important for us to assume in what follows that $\mathbf{A}$ is not defective.

## Eigenvalue decomposition

Since $\mathbf{A}$ is nondefective by assumption, we have

$$ \mathbf{A} \mathbf{v}_1 = \lambda_1 \mathbf{v}_1, \qquad
\mathbf{A} \mathbf{v}_2 = \lambda_2 \mathbf{v}_2, $$

and $\mathbf{v}_1$ and $\mathbf{v}_2$ are nonzero and not multiples of one another. (If they were, then $\lambda_1=\lambda_2$, but we have assumed nondefectiveness, so we can choose a different $\mathbf{v}_2$ that fills the bill.) Put these two statements together in corresponding columns of matrices:

$$ \begin{bmatrix} \mathbf{A} \mathbf{v}_1 & \mathbf{A} \mathbf{v}_2 \end{bmatrix} = \begin{bmatrix} \lambda_1 \mathbf{v}_1 & \lambda_2 \mathbf{v}_2 \end{bmatrix}. $$

Now for some linear algebra magic:

$$ \begin{aligned}
\mathbf{A}  \begin{bmatrix} \mathbf{v}_1 & \mathbf{v}_2 \end{bmatrix} & = \begin{bmatrix} \mathbf{v}_1 & \mathbf{v}_2 \end{bmatrix} \begin{bmatrix} \lambda_1 & 0 \\ 0 & \lambda_2 \end{bmatrix} \\
\mathbf{A} \mathbf{V} &= \mathbf{V} \mathbf{D} \end{aligned}$$

(Hang on a sec. Aren't $\mathbf{V}$ and $\mathbf{D}$ the names of the outputs from "eig" in MATLAB?)

We need one more observation here. Suppose $\mathbf{V}$ is singular. Then there is a nonzero solution of $\mathbf{V}\mathbf{x}=\boldsymbol{0}$. That is, $x_1 \mathbf{v}_1 = -x_2 \mathbf{v}_2$, and at least one of $x_1,x_2$ is not zero. Then either one of $\mathbf{v}_1$ or $\mathbf{v}_2$ is zero or (if both $x_j$ are nonzero) each is a scalar multiple of the other. This is something we ruled out above. By contradiction, then, $\mathbf{V}$ must not be singular. So finally we can write

$$ \mathbf{A} = \mathbf{V} \mathbf{D} \mathbf{V}^{-1}.$$

This is an *eigenvalue decomposition (EVD)*{:.def}. It's an important way to be able to express a nondefective matrix. 

### Example

> Find the EVD of
>
> $$\mathbf{A} =  \begin{bmatrix} 1 & 1 \\ 4 & 1 \end{bmatrix}$$.

We found the eigenvalues and eigenvectors of this guy a while back. We got $\lambda_1=3$ with $\mathbf{v}_1 = [1,2]$, and $\lambda_2=-1$ with $\mathbf{v}_2 = [1,-2]$. So we paint by numbers to get

$$ \mathbf{D} = \begin{bmatrix} 3 & 0 \\ 0 & -1 \end{bmatrix}, \qquad \mathbf{V} = \begin{bmatrix} 1 & 1 \\ 2 & -2 \end{bmatrix}.$$

We "just" need to invert $\mathbf{V}$; fortunately we're still only $2\times 2$.

$$ \mathbf{V}^{-1} = \frac{1}{-4} \begin{bmatrix} -2 & -1 \\ -2 & 1 \end{bmatrix} = \begin{bmatrix} 1/2 & 1/4 \\ 1/2 & -1/4 \end{bmatrix}.$$

Hence

$$ \mathbf{A} = \mathbf{V} \mathbf{D} \mathbf{V}^{-1} = \begin{bmatrix} 1 & 1 \\ 2 & -2 \end{bmatrix} \begin{bmatrix} 3 & 0 \\ 0 & -1 \end{bmatrix} \begin{bmatrix} 1/2 & 1/4 \\ 1/2 & -1/4 \end{bmatrix}. $$

---

It's worth a note here that the EVD is not unique. There's the arbitrary ordering of the eigenvalues, plus the fact that we can scale the eigenvectors as we like.


## Change of coordinates

So what does an EVD tell us about the linear ODE $\mathbf{x}'=\mathbf{A} \mathbf{x}$? Well,

$$ \mathbf{x}'=\mathbf{V} \mathbf{D} \mathbf{V}^{-1} \mathbf{x} $$

$$ \mathbf{V}^{-1} \mathbf{x}'=\mathbf{D} \mathbf{V}^{-1} \mathbf{x} $$

$$ (\mathbf{V}^{-1} \mathbf{x})'=\mathbf{D} (\mathbf{V}^{-1} \mathbf{x}).$$

Time for a change of variable. Let $\mathbf{u} = \mathbf{V}^{-1} \mathbf{x}.$ Then

$$ \mathbf{u}' = \mathbf{D} \mathbf{u} = \begin{bmatrix} \lambda_1 u_1 \\ \lambda_2 u_2 \end{bmatrix}.$$

In terms of the new variable, the ODE system is $u_1'=\lambda_1 u_1$ and $u_2'=\lambda_2 u_2$. That is, these components are decoupled from one another. Each evolves independently. More on that in a moment.

How are we to interpret $\mathbf{u} = \mathbf{V}^{-1} \mathbf{x}$? Well, $\mathbf{x} = \mathbf{V} \mathbf{u}$. That means that

$$ \mathbf{x} = u_1 \mathbf{v}_1 + u_2 \mathbf{v}_2.$$

Now, so far we always express vectors such as $\mathbf{x}$ relative to the standard coordinate axes. You can alternatively think of them as being expressed as a combination of $[1,0]$ and $[0,1]$. The equation above, though, expresses the original $\mathbf{x}$ in a new way, as a combination of the eigenvectors. We call the conversion of $\mathbf{x}$ to $\mathbf{u}$  a *change of coordinates*{:.def} or a *change of basis*.

In words, an expression of the original variables in coordinates determined by the eigenvectors of $\mathbf{A}$ converts the ODE system into a decoupled collection of scalar ODEs, each along one of the new coordinate directions.


## Revenge of the matrix exponential

The solution of our decoupled system $u_1'=\lambda_1 u_1$, $u_2'=\lambda_2 u_2$ is utterly trivial:

$$ u_1(t) = e^{\lambda_1 t} u_1(0), \qquad u_2(t) = e^{\lambda_2 t} u_2(0).$$

In vector form, we say that the solution of $\mathbf{u}' = \mathbf{D} \mathbf{u}$ is 

$$ \mathbf{u}(t) = \begin{bmatrix} e^{\lambda_1 t} & 0 \\ 0 &  e^{\lambda_2 t} \end{bmatrix} \mathbf{u}(0).$$

Of course, we already had a way of writing this solution, as $ e^{t\mathbf{D}} \mathbf{u}(0)$. Could it be that

$$ e^{t\mathbf{D}} = \begin{bmatrix} e^{\lambda_1 t} & 0 \\ 0 &  e^{\lambda_2 t} \end{bmatrix}?$$

Oh yes. First you have to realize that powers of a diagonal matrix are really easy:

$$ \mathbf{D}^2 = \begin{bmatrix} \lambda_1^2 & 0 \\ 0 &  \lambda_2^2 \end{bmatrix},
\quad \mathbf{D}^3 = \begin{bmatrix} \lambda_1^3 & 0 \\ 0 &  \lambda_2^3 \end{bmatrix}, $$

and so on. But then the series formula for $e^{t\mathbf{D}}$ falls right into place.

$$ e^{t \mathbf{D}} = \mathbf{I} + t \mathbf{D} + \frac{t^2}{2!} \mathbf{D}^2 + \frac{t^3}{3!} \mathbf{D}^3 + \cdots $$

$$ = \begin{bmatrix} 1 + t\lambda_1 + \frac{t^2}{2!}\lambda_1^2 + \frac{t^3}{3!}\lambda_1^3+\cdots  & 0 \\ 0 &  1 + t\lambda_2 + \frac{t^2}{2!}\lambda_2^2 + \frac{t^3}{3!}\lambda_2^3+\cdots \end{bmatrix}$$


$$ = \begin{bmatrix} e^{\lambda_1 t} & 0 \\ 0 &  e^{\lambda_2 t} \end{bmatrix}.$$

But wait, there's more! Returning to the original variables/coordinates,

$$ \mathbf{V}^{-1} \mathbf{x}(t) = e^{t \mathbf{D}}  \mathbf{V}^{-1} \mathbf{x}(0)$$

$$ \mathbf{x}(t) = \mathbf{V} e^{t \mathbf{D}}  \mathbf{V}^{-1} \mathbf{x}(0).$$

This suggests that

$$ e^{t\mathbf{A}} = \mathbf{V} e^{t \mathbf{D}}  \mathbf{V}^{-1}.$$

Can this be? Check this out: Since $\mathbf{A}=\mathbf{V} \mathbf{D} \mathbf{V}^{-1}$, we get

$$  \mathbf{A}^2 = (\mathbf{V} \mathbf{D} \mathbf{V}^{-1})(\mathbf{V} \mathbf{D} \mathbf{V}^{-1}) = \mathbf{V} \mathbf{D} (\mathbf{V}^{-1}\mathbf{V}) \mathbf{D} \mathbf{V}^{-1} = \mathbf{V} \mathbf{D}^2 \mathbf{V}^{-1},$$

$$ \mathbf{A}^3 = (\mathbf{V} \mathbf{D} \mathbf{V}^{-1})(\mathbf{V} \mathbf{D}^2 \mathbf{V}^{-1}) = \mathbf{V} \mathbf{D} (\mathbf{V}^{-1}\mathbf{V}) \mathbf{D}^2 \mathbf{V}^{-1} = \mathbf{V} \mathbf{D}^3 \mathbf{V}^{-1},$$

and so on. Thus

$$ e^{t \mathbf{A}} = \mathbf{I} + t \mathbf{A} + \frac{t^2}{2!} \mathbf{A}^2 + \frac{t^3}{3!} \mathbf{A}^3 + \cdots $$

$$ = \mathbf{V}\mathbf{I}\mathbf{V}^{-1} + t \mathbf{V} \mathbf{D} \mathbf{V}^{-1} + \frac{t^2}{2!} \mathbf{V} \mathbf{D}^2 \mathbf{V}^{-1} + \cdots$$

$$ =  \mathbf{V}\bigl( \mathbf{I} + t \mathbf{D} + \frac{t^2}{2!} \mathbf{D}^2 + \frac{t^3}{3!} \mathbf{D}^3 + \cdots \bigr) \mathbf{V}^{-1}$$

$$ = \mathbf{V} e^{t \mathbf{D}}  \mathbf{V}^{-1}.$$

Boys and girls, we have found ourselves a new way of computing the matrix exponential. 

### Example

> Find $e^{t\mathbf{A}}$ if 
>
> $$\mathbf{A} = \begin{bmatrix} 1 & 1 \\ 4 & 1 \end{bmatrix}$$.

This is the matrix above, where we found the EVD. It's all plug and play now.

$$ e^{t \mathbf{A}} = \mathbf{V} e^{t \mathbf{D}}  \mathbf{V}^{-1} = \begin{bmatrix} 1 & 1 \\ 2 & -2 \end{bmatrix} \begin{bmatrix} e^{3t} & 0 \\ 0 & e^{-t} \end{bmatrix} \begin{bmatrix} 1/2 & 1/4 \\ 1/2 & -1/4 \end{bmatrix}$$

$$ = \begin{bmatrix} e^{3t} & e^{-t} \\ 2e^{3t} & -2e^{-t} \end{bmatrix}  \begin{bmatrix} 1/2 & 1/4 \\ 1/2 & -1/4 \end{bmatrix}$$

$$ = \frac{1}{4} \begin{bmatrix} 2e^{3t}+2e^{-t} & e^{3t}-e^{-t} \\ 4e^{3t}-4e^{-t}& 2e^{3t}+2e^{-t} \end{bmatrix}.$$

Hey, it beats summing four infinite series, doesn't it? 

---

### Complex example

> Find $e^{t\mathbf{A}}$ if 
>
> $$ \mathbf{A} = \begin{bmatrix} 1 & -1 \\ 5 & -3 \end{bmatrix}. $$

We did the eigenstuff earlier, or you can chicken out and use MATLAB to get

$$ \mathbf{D} = \begin{bmatrix} -1+i & 0 \\ 0 & -1-i \end{bmatrix}, \qquad \mathbf{V} = \begin{bmatrix} 1 & 1 \\ 2-i & 2+i \end{bmatrix}.$$

Now

$$ \mathbf{V}^{-1} = \frac{1}{2+i-2+i} \begin{bmatrix} 2+i & -1 \\ -2+i & 1 \end{bmatrix} = \frac{i}{2} \begin{bmatrix} -2-i & 1 \\ 2-i & -1 \end{bmatrix}.$$

$$ e^{t \mathbf{A}} = \mathbf{V} e^{t \mathbf{D}}  \mathbf{V}^{-1} = e^{-t}\frac{i}{2} \begin{bmatrix} 1 & 1 \\ 2-i & 2+i \end{bmatrix} \begin{bmatrix} e^{it} & 0 \\ 0 & e^{-it} \end{bmatrix} \begin{bmatrix} -2-i & 1 \\ 2-i & -1 \end{bmatrix}$$

$$ = e^{-t}\frac{i}{2}\begin{bmatrix} e^{it} & e^{-it} \\ (2-i)e^{it} & (2+i)e^{-it} \end{bmatrix} \begin{bmatrix} -2-i & 1 \\ 2-i & -1 \end{bmatrix}$$

$$ = e^{-t}\frac{i}{2} \begin{bmatrix} -(2+i)e^{it}+(2-i) e^{-it} & e^{it}-e^{-it} \\ -(2-i)(2+i)e^{it}+(2+i)(2-i) e^{-it} & (2-i)e^{it}-(2+i) e^{-it} \end{bmatrix}. $$

Each entry is written in the form of a complex number minus its conjugate, which gives twice the imaginary part. This helps.

$$ = -e^{-t} \begin{bmatrix} -\cos(t)-2\sin(t) &  \sin(t)\\ -5\sin(t) & -\cos(t)+2\sin(t) \end{bmatrix}. $$

---

Let's get real (get it?). It's not recommended that we go through all this by hand. What's nice is that there's a completely algorithmic way for it to be done, and we just offload the manipulations to a computer. Anyway, it's rare that we will get a compact exact expression for larger matrices, and numerical methods come into the lead. 
