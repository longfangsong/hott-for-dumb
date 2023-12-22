# 类型之间的等于：等价与 Univalence 公理

现在让我们来思考如何构造两个 类型 之间的 identity type。

直觉上，如果两个类型的元素可以一一对应，那么这两个类型就是相等的。

关于“一一对应”，你可能会想到“双射” (bijection) 或者“同构” (isomorphism) 之类的概念，但注意我们处理的是类型，而不是集合或者范畴。我们现在还没有定义出（类型论下的）集合或者范畴，未来定义出相关概念后，我们将会研究等价、双射、同构等概念之间的关系。

![isomorphism](isomorphism.gif)

我们可以把“一一对应”这个东西拆成“两个互逆的函数”：

![is-equiv-def](isomorphism.gif)

于是我们**直觉上地**得到了两个类型之间相等的构造方式：

$$
Σ_{(f : A \to B)} Σ_{(g : B \to A)} Π_{(x : A)} (g (f (x)) = x) × Π_{(y : B)} (f (g (y)) = y) → (A = B)
$$

后面这部分可以用函数之间的同伦来表示：

$$
Σ_{(f : A \to B)} Σ_{(g : B \to A)} (f ∘ g \sim id) × (g ∘ f \sim id) → (A = B)
$$

\\(→\\) 的左侧常常被称为 \\(A\\) 和 \\(B\\) 之间的等价，记作 \\(A \simeq B\\)。

这个构造方式也是无法证明的，这个公理（存在一一对应能推出类型相等）被称为 Univalence 公理。

## 上述“等价”的定义中的问题

不幸地是，为了正确地使用我们类型论中的定义来表达集合论或范畴论中的一一对应关系，我们需要采用一个和上述“等价”的定义**逻辑**等价，但**类型的内部结构**[^1]不等价的定义：

$$
A ≃ B := Σ_{(f : A \to B)} (Σ_{(g : B \to A)} f ∘ g \sim id × Σ_{(h : B \to A)} h ∘ f \sim id)
$$

其中 \\(g\\) 称为 \\(f\\) 的截面（section），\\(h\\) 称为 \\(f\\) 的收缩（retraction），所以上述定义也可以写作：

$$
\begin{align}
sec(f) &:= Σ_{(g : B \to A)} f ∘ g \sim id \\\\
retr(f) &:= Σ_{(h : B \to A)} h ∘ f \sim id \\\\
\text{is-equiv}(f) &:= sec(f) × retr(f) \\\\
A ≃ B &:= Σ_{(f : A \to B)} \text{is-equiv}(f)
\end{align}
$$

关于为何上面的定义比我们凭直觉得到的定义更好，我们将在接下来的几个章节中讨论。

我们把
$$
\Pi_{(x : A)} A ≃ B \to A = B
$$

称为 Univalence 公理，在引入这个公理后，我们可以证明函数外延性公理。

## 等价的性质

考虑我们原本的直觉上的等价的定义，我们记：

$$
\text{has-inverse}(f) := Σ_{(g : B \to A)} (f ∘ g \sim id) × (g ∘ f \sim id)
$$

\\(\text{is-equiv}\\)和\\(\text{has-inverse}\\)这两个 \\(f\\) 上的性质是**逻辑**等价的，即：

$$
\text{is-equiv}(f) ↔ \text{has-inverse}(f)
$$

类似 Identity 和同伦类型，等价也是一个广群，即满足自反性、对称性和传递性。

$$
\begin{align}
\text{refl-≃}  &: \Pi_{(A : Type)} A ≃ A \\\\
\text{sym-≃}   &: \Pi_{(A, B : Type)} A ≃ B \to B ≃ A \\\\
\text{trans-≃} &: \Pi_{(A, B, C : Type)} A ≃ B \to B ≃ C \to A ≃ C \\\\
\end{align}
$$

证明略，见代码。

[^1]: 是的，类型内部结构的等价就是我们目前正在试图定义的东西。
