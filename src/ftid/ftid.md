# 建立 Observational Equal 和 Propositional Equal 的联系

我们已经介绍了 Propositional Equal 和 Observational Equal 的定义，并在自然数的例子中看到了这两种等于的例子。现在我们来看看这两种等于之间的联系。

显而易见的，我们可以定义出两种等于之间的函数：

```agda
≡→Eq : {x y : ℕ} → x ≡ y → Eq x y
≡→Eq {x} {.x} refl = refl-Eq x

Eq→≡ : {x y : ℕ} → Eq x y → x ≡ y
Eq→≡ {zero} {zero} eqnxy = refl
Eq→≡ {suc x} {suc y} eqnxy = cong suc (Eq→≡ {x} {y} eqnxy)
```

如果证明其中任何一个是一个 equivalence，那么我们就能证明这两种 Equal 是等价的。

证明的一种方案是使用 equivalence 的某一个等价定义：

> 存在一个 fiber（可以看作每一个像对应的原像）是 contractible 的的函数

所以我们只需证明 \\(Σ_{(n : ℕ)} Eq(m,n)\\) 是 contractible 即可，即证明所有的
\\(Σ_{(n : ℕ)} Eq(m,n)\\) 类型的变量都等于 \\((m , \text{refl-Eq}(m))\\)。

我们可以对 m 和 n 使用归纳法证明，详见代码，重点是构造 \\(Eq(m,n) → Eq(suc(m), suc(n))\\) 和 \\(Σ_{(n:ℕ)} (Eq( m,n)) → Σ_{(sn:ℕ)} (Eq (suc (m), sn))\\) 两个函数。

这样我们就证明了 \\(=_ℕ\\) 和 \\(Eq\\) 是等价的。

类似地，对任意类型 A，研究 \\(x =_A y\\) 的一个方式是研究 A 上的一个 type family \\(Eq_A(x, y)\\) 。

或者固定其中一个元素 \\(a : A\\)，研究 \\(a =_A x\\) 的一个方式是研究 A 上的一个 dependent type \\(B(x)\\) 。

这种固定了其中一个元素的 Observational Equal 可以被称为 identity system。

## identity system

一个在 a 点的 identity system 是一个 type family \\(R : A → \mathcal{U} \\) ，且：

- 存在 \\(r : R(a)\\)，这实际上就要求了对应的 Observational Equal 是 reflexive 的。
- 对于任何 type family \\(D : ∏_{(b:A)} R(b) → \mathcal{U}\\) 和 \\(d : D(a, r)\\)，
  存在 \\(f : ∏_{(b:A)} ∏_{(rb: R(b))} D(b, rb)\\) ，使得 \\(f(a, r) = d\\) ，这实际上就是说对所有符合 predicate D 的 \\((某元素, 该元素和 a 的 Observational\ Equal 关系)\\)，都可以将其“归结到” \\((a, \text{refl-Eq}(a))\\) 上，这有些类似 path induction。

参考上面的证明，我们还可以得到一个等价定义：

$$
\text{is-contr}(∑_{(b:A)} R(b))
$$
inhabitants，则 \\(R\\) 是一个 identity system。

考虑到我们引入 identity system 的作用，我们可以得到第三个等价定义：

$$
(a =_A x) ≃ R(x)
$$

对任意 a 成立。
