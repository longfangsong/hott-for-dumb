# 函数之间的等于：同伦与函数外延性公理

我们之前介绍的 identity type 给了我们表达两个 term 之间的相等的能力，然而我们该如何构造两个类型为 函数 的 term 之间的 identity type 呢？

一个容易想到的方式是，如果两个函数在所有输入上的输出都相等，那么这两个函数就是相等的：

$$
\Pi_{(x : A)} f(x) = g(x) \to f = g
$$

当然我们并没有办法证明这个命题，只能将其作为公理加入到我们的理论中。

这个公理被称为函数外延性公理（function extensionality axiom）。

## 讨论：外延与内涵

内涵（intension）和外延（extension）是两个逻辑学上的概念：

> 内涵经常与外延一起讨论的。内涵称谓一个词能描述一下的所有可能的事物的集合。相反的，外延或指称 称谓一个词实际上描述的所有真实的事物的集合。例如，“轿车”的内涵是所有可能的轿车（包括巧克力造的一千米高的轿车）。但是“轿车”的外延是所有真实的（过去现在和未来）轿车，这可能会总计为数以亿计的轿车。 —— Wikipedia

比如说，集合 \\(\\{1, 3, 5, 7, 9\\}\\) 也可以定义为 \\(\\{x | x ∈ N ∧ x < 10 ∧ x\\ mod\\ 2 = 1\\}\\)，其中第一种定义是通过外延定义的，第二种定义是通过内涵定义的。

在公理化集合论中有一条相关的[外延公理](https://zh.wikipedia.org/wiki/%E5%A4%96%E5%BB%B6%E5%85%AC%E7%90%86)。

### 内涵相等和外延相等

例如下面两个函数：

$$
\begin{align}
    f(n) &= (n + 5) * 2 \\\\
    g(n) &= 2 * n + 10
\end{align}
$$

由于这两个函数的定义不同，他们的内涵是不相等的，但是他们的输出在所有输入上都相等，因此他们的外延是相等的。

在不引入函数外延性等公理的情况下，我们所有的 identity type 表达的都是内涵相等，而函数外延性公理（以损害了一些计算性质为代价[^1]）给了我们一种引入外延相等的方式。

## 同伦

函数外延性公理中 \\(\to\\) 的左边是函数 \\(f\\) 和 \\(g\\) 同伦的定义[^2]，记为：

$$
f \sim g := \Pi_{(x : A)} f(x) = g(x)
$$

\\(f \sim g\\) 是一个类型，称为 \\(f\\) 和 \\(g\\) 之间的同伦类型。

### 和拓扑学中的同伦的关系

> 两个定义在拓扑空间之间的连续函数，如果其中一个能“连续地形变”为另一个，则这两个函数称为同伦的。 —— Wikipedia

![homotopy between f and g](./homotopy.gif)

容易想象，如果两个函数在所有输入值上的输出都相等，那么我们可以各种“拉伸”其中某一个函数来得到另一个函数，就像扯一根根两端固定好了的线[^3]，这就符合了拓扑学中同伦的概念。

### 同伦的性质

类似 Identity 类型，同伦也是一个广群，即满足自反性、对称性和传递性。

$$
\begin{align}
\text{refl-htpy}  &: \Pi_{(f : \Pi_{(x:A)} B(x))} f \sim f \\\\
\text{refl-htpy}(f)  &:= \lambda x. \text{refl}\_{f(x)} \\\\
\text{sym-htpy}   &: \Pi_{(f, g : \Pi_{(x:A)} B(x))} f \sim g \to g \sim f \\\\
\text{sym-htpy}(H)   &:= \lambda x. sym(H(x))  \\\\
\text{trans-htpy} &: \Pi_{(f, g, h : \Pi_{(x:A)} B(x))} f \sim g \to g \sim h \to f \sim h \\\\
\text{trans-htpy}(H, K) &:= \lambda x. H(x) ⋅ K(x)
\end{align}
$$

\\(\text{sym-htpy}(H)\\) 常写作 \\(H^{-1}\\)。

\\(\text{trans-htpy}(H, K)\\) 常写作 \\(H ⋅ K\\)。

我们也可以把 identity type 的 \\(cong\\) 推广到同伦上：

$$
\begin{align}
f \sim g \to h ∘ f \sim h ∘ g \\\\
f \sim g \to f ∘ h \sim g ∘ h
\end{align}
$$

这个操作称为 whiskering。

给定 \\(H : f \sim g\\) 和函数 \\(h\\)，我们将他们间的 whiskering 记作：
$$
\begin{align}
h · H &:= 𝜆 x. cong_h(H(x)) &: h ∘ f \sim h ∘ g \\\\
H ⋅ h &:= 𝜆 x. H(h(x)) &: f ∘ h \sim g ∘ h
\end{align}
$$

[^1]: Ref: <https://guest0x0.xyz/notes-on-equality-in-TT.pdf>

[^2]: 同伦一定程度上可以被视为函数的 Observational Equal。

[^3]: 即使出现了两根线交叉的情况，我们也可以从更高维的空间中任意交换这两根线的上下关系。
