# 等价类和商集

## 等价关系

> 在数学中，等价关系（英语：Equivalence relation）是具有自反性，对称性，传递性的二元关系。

如果一个二元关系 \\(R : A \to A \to Prop_{\mathcal{U}}\\) 满足：

1. 自反性：\\(\Pi_{(x : A)} R(x , x)\\)
2. 对称性：\\(\Pi_{(x , y : A)} R(x , y) \to R(y , x)\\)
3. 传递性：\\(\Pi_{(x , y , z : A)} R(x , y) \to R(y , z) \to R(x , z)\\)

则称 \\(R\\) 是 \\(A\\) 上的一个等价关系。

## 等价类

简单来说就是某个 等价关系下 的所有 和某个元素等价的元素。

$$
\text{is-equivalence-class}(P) := ∃(x:A)∀(y:A) 𝑃(y) ↔ R(x, y)
$$

$$
A/R := Σ_{(𝑃:A→Prop_{\mathcal{U}})}\text{is-equivalence-class}(P)
$$

某个元素 x 的等价类：

$$
[x]_R := R(x)
$$

因此 \\(𝑥 ↦ [𝑥]_R\\) 的类型就是 \\(A → A/R\\)。

## set quotient

如果对于一个映射 \\(f : A → B\\)，其中 B 为 Set，且对任意 x 和 y，有 \\(𝑅(𝑥, 𝑦) → (𝑞(𝑥) = 𝑞(𝑦))\\) ，我们称 q 是 R 的 set quotient。
