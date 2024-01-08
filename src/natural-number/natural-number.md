# 自然数

我们使用基于 皮亚诺算术 的自然数定义。

## 定义

我们使用第一条和第二条公理：

> 0 是自然数
> 每一个确定的自然数a，都有一个确定的后继数a' ，a' 也是自然数

给出自然数的定义：

```agda
data Nat : Set where
  zero : Nat
  suc  : (n : Nat) → Nat
```

## 加法运算

我们递归地定义自然数的加法运算：

### 定义

```agda
_+_ : Nat → Nat → Nat
zero  + m = m
suc n + m = suc (n + m)
```

### 性质

我们可以证明 0 是加法的单位元，交换律等，见 Agda 代码。

## Observational Equal

由 皮亚诺算术 第三公理：

> 对于每个自然数b、c，b=c当且仅当b的后继数=c的后继数；

我们可以定义自然数的等于关系：

```agda
Eq : ℕ → ℕ → Set
Eq zero zero = ⊤
Eq zero (suc n) = ⊥
Eq (suc m) zero = ⊥
Eq (suc m) (suc n) = Eq m n
```

注意：

- 我们使用了 `⊤` 和 `⊥` 表示真和假，因为 `⊤` 是有成员（证明）的，而 `⊥` 是没有成员（证明）的。
- 这是一个二元关系，即自然数类型上的 Observational Equal，而不是 Propositional Equal。

由于 Observational Equal 的计算性质非常好[^1]，用 Observational Equal 来证明一些性质会比用 Propositional Equal 来证明更加方便，我们将在之后的章节中研究如何建立 Observational Equal 和 Propositional Equal 之间的联系。

[^1]: 因为 Observational Equal 只要输入两个自然数就能直接通过计算判断出是否相等，并给出“证明”，而 Propositional Equality 则需要用 Axiom J 费老大劲才能搞出来。
