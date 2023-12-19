# 命题以下和集合以上：n-类型

我们可以发现 \\(Prop\\) 和 \\(Set\\) 有很多相似之处，比如它们都是一部分类型的属性，所有类型都可以被强行转换成它们，这个转换都是通过抹除类型，尤其是类型上的相等关系上的某些信息，等等。

我们重新观察一下这些类型的定义：

$$
\begin{align}
isProp(P) &:= \Pi_{(x, y : P)} (x = y) \\\\
isSet(A) &:= \Pi_{(x, y : A)} isProp(x = y)
\end{align}
$$

那么我们可以继续推广这种定义：

$$
\begin{align}
isProp(P) &:= \Pi_{(x, y : P)} (x = y) \\\\
isSet(A) &:= \Pi_{(x, y : A)} isProp(x = y) \\\\
is?(A) &:= \Pi_{(x, y : A)} isSet(x = y) \\\\
is??(A) &:= \Pi_{(x, y : A)} is?(x = y) \\\\
&\vdots
\end{align}
$$

这样我们就得到了一系列的类型，我们称之为 **n-类型**，表达的意思是我们多大程度上“抹去”或“不在意”了类型上的信息。

## 最底层的类型：contractible type

在 Prop 以下，我们有一个最底层的类型，即 contractible type，它的定义是：

$$
\begin{align}
\text{is-contr}(A) &:= Σ_{(a : A)} \Pi_{(x : A)} (a = x) \\\\
Contr &:= Σ_{(A : Type)} \text{is-contr}(A)
\end{align}
$$

简单来说，就是存在且仅存在一个元素的类型。

这是我们同伦等级中最底层的类型，这个类型不包含任何信息。

## Prop 和 Set

Prop 的等价定义是：

$$
\text{is-prop}(P) := \Pi\_{(x, y : P)} \text{is-contr}(x = y)
$$

可见，Prop 是其上的 Identity type 是 Contr 的类型，这个类型包含了其是否有元素的信息。

而 Set 是其上的 Identity type 是 Prop 的类型，这个类型包含了其上多个元素的信息。

以此类推，其上的 Identity type 是 Set 的类型，这个类型包含了其元素之间的 Identity type 的信息，有时会将这种类型称为 Groupoid [^1]，等等。

## h(omotopy)-level

我们可以定义一个类型的 **h-level**，表示这个类型上包含多少层的 Identity type 的信息。

比如 Contr 是 h-level 0，Prop 是 h-level 1，Set 是 h-level 2，等等。

## n-类型

为了让 Set 当 0，我们可以定义 n-类型，其中 n 为 h-level 的值 -2：

$$
\begin{align}
\text{is-\_-type}(-2) &:= \text{is-contr} \\\\
\text{is-\_-type}(n) &:= \Pi_{(x, y : A)} \text{is-\_-type}(n-1)(x = y)\ \text{for}\ n>-2 \\\\
\text{\_Type}(n) &:= Σ\_{(A : Type)} \text{is-\_-type}(A)
\end{align}
$$

因此，我们可以得到：

$$
\begin{align}
Contr &≐ \text{-2Type} \\\\
Prop &≐ \text{-1Type} \\\\
Set &≐ \text{0Type}
\end{align}
$$

## n-truncation

类似 Prop 和 Set，我们可以将任意类型转换成 n-类型，这个过程被称为 **n-truncation**，我们用 \\(|| A ||_n\\) 表示 \\(A\\) 类型转换成 n-类型后的类型。

[^1]: 由于 1-type 上的 identity type 是 set，我们又已经知道 identity type 是一个广群，所以 1-type 以及更高等级的类型中的 identity type 是非平凡的广群，因此 1-type 也被称为广群。
