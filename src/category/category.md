# 范畴

通过之前的几章，我们已经知道了“类型”是一个比集合更“大”的概念，一部分类型是集合，但是还有一部分类型不是集合。如果你熟悉范畴论的话，你可能会觉得“类型”和范畴论中的“类”很像。

事实上我们确实可以利用类型论定义出范畴，然后运用类型论的方式研究范畴论。

## 范畴的定义

### 前范畴（precategory）

我们直接看 Wikipedia 上的定义：

> 一个范畴 C 包括：
>
> - 一个由物件所构成的类 ob(C)
> - 物件间的态射所构成的类 hom(C)。每一个态射f都会有唯一个“源物件” a 和“目标物件” b ，且 a 和 b 都在 ob(C) 之内。因此写成 f: a → b，且称f为由a至b的态射。所有由a至b的态射所构成的“态射类”，其标记为\\(hom(a, b)\\) （或 \\(hom_C(a, b)\\)）。
> 对任三个物件a、b和c，二元运算 \\(hom(a, b)×hom(b, c)→hom(a, c)\\) 称之为态射复合；\\(f : a → b\\)和 \\(g : b → c\\)的复合写成 \\(g ∘ f\\)或gf。
>
> 此态射复合满足下列公理：
>
> - （结合律）若\\(f : a → b\\)、\\(g : b → c\\)且\\(h : c → d\\)，则\\(h ∘ (g ∘ f) = (h ∘ g) ∘ f\\)；
> - （单位元）对任一物件x，存在一态射\\(1_x : x → x\\)，使得每一态射\\(f : a → b\\)，都会有\\(1_b ∘ f = f = f ∘ 1_a\\)。此一态射称为“x的单位态射”。

于是我们似乎可以直接定义出范畴：

```agda
record Category (o ℓ : Level) : Set (lsuc (o ⊔ ℓ)) where
    infix  4 _⇒_
    infixr 9 _∘_
    field
      Obj : Set o
      _⇒_ : Rel Obj ℓ
      id  : ∀ {A} → (A ⇒ A)
      _∘_ : ∀ {A B C} → (B ⇒ C) → (A ⇒ B) → (A ⇒ C)
    field
      Hom-set : (x y : Obj) → is-set (x ⇒ y)
      assoc     : ∀ {A B C D} {f : A ⇒ B} {g : B ⇒ C} {h : C ⇒ D} → (h ∘ g) ∘ f ≡ h ∘ (g ∘ f)
      identityˡ : ∀ {A B} {f : A ⇒ B} → id ∘ f ≡ f
      identityʳ : ∀ {A B} {f : A ⇒ B} → f ∘ id ≡ f
```

然而这里有一个问题：我们直接使用了 Identity Type 作为这里的等于（等价/类型相等、同伦/函数相等），而经典范畴论中的等于（集合相等、函数相等）是一个更强的关系。

我们将上面定义出的比传统范畴更弱的结构称为“前范畴”。

### 同构（isomorphism）

在**一个范畴内**，如果存在两个物件之间的态射，使得它们的复合是单位态射，那么我们称这两个物件是同构的。

$$
\begin{align}
    \text{is-isomorphism}(f) &:= Σ_{(g : B ⇒ A)} (g ∘ f = id) × (f ∘ g = id) \\\\
    A ≅ B &:= Σ_{(f : A ⇒ B)} \text{is-isomorphism}(f)
\end{align}
$$

自然地，相等的物件是同构的：

$$
≡→≅ : (a = b) → (a ≅ b)
$$

### 范畴（category）

如果一个前范畴中，同构的物件是相等的，即 \\(≡→≅\\) 是一个 equivalence，那么我们称这个前范畴是一个范畴。

$$
\begin{align}
    \text{is-category}(C) &:= \Pi_{(A, B : C.\text{Obj})} \text{is-equivalence}(≡→≅) \\\\
    \text{Category} &:= Σ_{(C : \text{Precategory})} \text{is-category}(C)
\end{align}
$$

### 同构的性质

#### 同构类型是集合

#### 不同范畴上的同构

- 拓扑空间之间的的同构是同胚
- 集合之间的同构是置换

### 范畴的性质

#### 范畴的物件是 1-类型

