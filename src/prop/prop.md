# 命题

## 重新考虑 Curry-Howard 同构

我们已经知道 Curry-Howard 同构能够将命题和类型对应起来，但是在这种对应关系下，一个命题常常包含了比传统逻辑中的命题更多的信息，比如这个类型有几个项（有几种不同的证明）。而在传统逻辑中，一个命题只有真假两种情况，我们**不关心**证明的具体情况，证明是独立于命题的。

我们可以“抹去”类型中的信息，使得一个类型：

- 要么等于（同伦等价于）空（\\(\bot\\)）类型，代表这个命题是假的
- 要么等于（同伦等价于）单元（\\(\top\\)）类型，代表这个命题是真的

“抹去”信息后的类型就是一个命题，我们称之为 **h-Proposition** 或 **mere Proposition**。

## 命题的定义

$$
\begin{align}
isProp(P) &:= \Pi_{(x, y : P)} (x = y) \\\\
Prop &:= Σ_{(P : Type)} isProp(P)
\end{align}
$$

即这个类型（命题）的任何两个元素（证明）对我们来说都是相等的。

## 命题的性质

### “命题的逻辑等价”和“命题的同伦等价”逻辑等价

即：

$$
\begin{align}
P &: Prop \\\\
Q &: Prop \\\\
P \simeq Q &\leftrightarrow (P \leftrightarrow Q)
\end{align}
$$

### a map is an embedding if and only if its fibers are propositions

## 一些常见的命题

- \\(⊤\\)
- \\(⊥\\)
- If \\(A\\) is a prop, \\(A ≃ B\\), then $B$ is a prop. And vice versa, all props are equivalent to each other.
- Observational equal on $ℕ$ and Bool, ie. \\(\text{Eq-}ℕ(n, m)\\). Since it is equivalent to identity type on these types, identity type on these types is also a prop.
- A product of props is a prop，推到 \\(\Pi\\) 类型上也成立.
- Given a prop A and $\text{is-subtype}(B)$ of A, then $\text{is-prop}(Σ_{(x:A)} B(x))$
<!-- - \\(\text{is-equiv}(A)\\) 是 prop。 -->
- \\(\text{is-contr}(A)\\), \\(\text{is-prop}(A)\\), ..., \\(\text{is-k-type}(A)\\) 都是 prop。
- Given a prop B, \\(A → B\\) is a prop, a special case is, the negation of a type (\\(\neg A\\)) is a prop.


## 一般类型和命题的关系

对所有类型，我们都可以“抹去”它们的其他细节，得到一个命题，我们用 \\(|| A ||\\) 表示 \\(A\\) 类型抹去信息后得到的命题。

当然，有些类型本身已经是命题了，对于这些类型，\\(A ≃ ||A||\\)。

对类型中的一个元素，我们可以将其对应到命题中的**那一个**元素，我们用 \\(| a |\\) 表示 \\(a\\) 对应的那一个元素。

这种把一般类型硬转成命题的方式被称为 **proposition truncation**。

### Curry-Howard 同构，修复过的版本

在传统逻辑中，有两个运算通过普通的 Curry-Howard 同构 对应到类型论中时获得了一些额外的信息：

- \\(P∨Q\\) 对应到 \\(P+Q\\)，\\(P ∨ Q\\) 原本只需要知道 \\(P\\) 或 \\(Q\\) 为真，但是在类型论中，我们还需要知道 \\(P\\) 或 \\(Q\\) **哪一个**为真。
- \\(∃(x : A). P(x)\\) 对应到 \\(Σ_{(x : A)} P(x)\\)，\\(∃(x : A). P(x)\\) 原本只需要知道存在一个 \\(x\\) 使得 \\(P(x)\\) 为真，但是在类型论中，我们还需要知道这个 \\(x\\) 到底**是什么**。

为了修复这个问题，让我们对这两个对应到的东西使用 proposition truncation 吧！

- \\(P∨Q\\) 对应到 \\(|| P+Q ||\\)。
- \\(∃(x : A). P(x)\\) 对应到 \\(|| Σ_{(x : A)} P(x) ||\\)。

其他的运算符都不需要修复。

所以我们最新的 Curry-Howard 同构是：

|  逻辑   | 类型  |
|  ----  | ----  |
| \\(⊤\\)  | \\(⊤\\) |
| \\(⊥\\)  | \\(⊥\\) |
| \\(P ∧ Q\\)  | \\(P × Q \\) |
| \\(P ∨ Q\\)  | \\(\|\| P + Q \|\|\\) |
| \\(∃(x : A). P(x)\\) | \\(\|\| Σ_{(x : A)} P(x) \|\|\\) |
| \\(∀(x : A). P(x)\\) | \\(\Pi_{(x : A)} P(x)\\) |
