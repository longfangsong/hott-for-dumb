# Loop space

对于 n-类型，我们观察到他们的定义中都用到了高阶的 Identity type，比如，对于 Set，我们有：

$$
\begin{align}
isSet(A) :=& \Pi\_{(x, y : A)} isProp(x = y) \\\\
      ≐& \Pi\_{(x, y : A)} \Pi\_{(p, q : x =\_A y)} (p =\_{x = y} q)
\end{align}
$$

其中的 $p = q$ 就是一个高阶的 Identity type。

我们定义最基本的元素之间的 Identity type 为 1 阶 path （写作 1-path），即 \\(x =\_A y\\)，那么 \\(p =_{x = y} q\\) 就是 2 阶 path，以此类推，我们可以定义 n 阶 path。

在高阶 path 中，我们最感兴趣的是 首尾相连的 path，即 \\(x =\_A x\\)，我们称之为 loop。

## Loop space

给定一个类型 \\(A\\) 和其中的一个 item \\(a\\)，我们可以定义出 \\(A\\) 的 loop space 类型，定义为：

$$
\Omega(A, a) := (a =\_A a, \text{refl}_a)
$$

有时也简写为 \\(\Omega A\\)。

我们的 \\(refl_a\\) 就是一个 \\(\Omega(A, a)\\) 中的元素。

loop space 的 loop space 也是一个 loop space，写作：

$$
\Omega^2(A, a) := \Omega(\Omega(A, a), \text{refl}_a =\_{a =\_A a} \text{refl}_a)
$$

我们也可以一直往上定义，得到高阶 Loop space \\(\Omega^n(A, a)\\)：

$$
\Omega^{n+1}(A, a) := \Omega^n(\Omega(A, a))
$$

## 同伦群

我们定义 A 在 a 点的同伦群为：

$$
\pi_n(A, a) := ||\Omega^n(A, a)||_0，n \geq 1
$$

由于 \\(\Omega^n(A, a)\\) 上的 Identity type 具备交换、结合律和逆元，所以 \\(\pi_n(A, a)\\) 是一个群。

当 n > 1 时，这甚至是一个可交换群。

而其中 n = 1 的情况，我们称之为基本群。

<!-- ## 二阶 loop space 的性质

### 交换律

$$
α \cdot β = β \cdot α
$$

for any \\(α, β : Ω^2(A)\\) -->

<!-- <iframe class="quiver-embed" src="https://q.uiver.app/#q=WzAsMyxbMCwwLCJhIl0sWzIsMCwiYiJdLFs0LDAsImMiXSxbMCwxLCJwIiwwLHsib2Zmc2V0IjotMSwiY3VydmUiOi0zLCJzdHlsZSI6eyJoZWFkIjp7Im5hbWUiOiJub25lIn19fV0sWzAsMSwiIiwyLHsiY3VydmUiOi0zLCJzdHlsZSI6eyJoZWFkIjp7Im5hbWUiOiJub25lIn19fV0sWzAsMSwicSIsMix7ImN1cnZlIjozLCJzdHlsZSI6eyJoZWFkIjp7Im5hbWUiOiJub25lIn19fV0sWzAsMSwiIiwxLHsib2Zmc2V0IjotMSwiY3VydmUiOjMsInN0eWxlIjp7ImhlYWQiOnsibmFtZSI6Im5vbmUifX19XSxbMSwyLCJzIiwyLHsiY3VydmUiOjMsInN0eWxlIjp7ImhlYWQiOnsibmFtZSI6Im5vbmUifX19XSxbMSwyLCJyIiwwLHsiY3VydmUiOi0zLCJzdHlsZSI6eyJoZWFkIjp7Im5hbWUiOiJub25lIn19fV0sWzEsMiwiIiwyLHsib2Zmc2V0IjotMSwiY3VydmUiOjMsInN0eWxlIjp7ImhlYWQiOnsibmFtZSI6Im5vbmUifX19XSxbMSwyLCIiLDIseyJvZmZzZXQiOjEsImN1cnZlIjotMywic3R5bGUiOnsiaGVhZCI6eyJuYW1lIjoibm9uZSJ9fX1dLFs0LDYsIlxcYWxwaGEiLDIseyJzaG9ydGVuIjp7InNvdXJjZSI6MjAsInRhcmdldCI6MjB9LCJzdHlsZSI6eyJoZWFkIjp7Im5hbWUiOiJub25lIn19fV0sWzEwLDksIlxcYmV0YSIsMCx7InNob3J0ZW4iOnsic291cmNlIjoyMCwidGFyZ2V0IjoyMH0sInN0eWxlIjp7ImhlYWQiOnsibmFtZSI6Im5vbmUifX19XV0=&embed" width="688" height="176" style="border-radius: 8px; border: none;"></iframe> -->

<!-- ### horizontal composition

$$
\begin{align}
\alpha ⋆ \beta & : p \cdot r  = q \cdot s \\\\
\alpha ⋆ \beta & := (\alpha \cdot\_r r) \cdot (q \cdot\_l \beta)
\end{align}
$$

其中：

$$
\begin{align}
\alpha \cdot_r r &: p \cdot r = q \cdot r \\\\
q \cdot_l \beta &: q \cdot r = q \cdot s
\end{align}
$$

两者可以通过 r 和 q 为 refl 的 path induction 来构造。 -->

