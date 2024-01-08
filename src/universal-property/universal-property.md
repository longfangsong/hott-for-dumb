# 米田（Yoneda）引理和泛性质

> 人是一切社会关系的总和。——《马克思论费尔巴哈》

我们之前在定义数学对象时，常常通过直接描述其具有的特性来定义。

比如我们定义笛卡尔积 \\(A \times B\\) 时，我们是通过定义这个类型的：

- formation rules：把 \\(A\\) 类型和 \\(B\\) 类型放在一起，用 \\(×\\) 隔开，得到 \\(A \times B\\) 类型。
- constructor：把 \\(A\\) 和 \\(B\\) 的元素放在一起，用\\(,\\) 隔开，得到 \\(A \times B\\) 的一个元素。
- eliminator：给定一个 \\(A \times B\\) 的元素，可以用 \\(\pi_1\\) 和 \\(\pi_2\\) 分别得到类型 \\(A\\) 和 \\(B\\) 的元素。
- computation rule（β-reduction）：给定 \\((a, b)\\)，得到 \\(\pi_1(a, b) = a\\) 和 \\(\pi_2(a, b) = b\\)。
- uniqueness principle（η-conversion）：\\( (\pi_1(a, b), \pi_2(a, b)) = (a , b) \\)

来定义的。

然而，范畴论告诉我们，我们也可以通过定义其他类型到这个类型的所有映射的性质来定义这个类型，即：

## 米田（Yoneda）引理

> 范畴中的对象由所有别的对象到它的态射决定。—— [香蕉空间, Yoneda 引理页面](https://www.bananaspace.org/wiki/Yoneda_%E5%BC%95%E7%90%86)

> 米田引理断言一个对象 X，X的性质由它所表示的函子 \\(\mathrm{Hom}(X,-)\\) 或 \\(\mathrm{Hom}(-, X)\\)决定。—— [维基百科, 米田引理页面](https://zh.wikipedia.org/wiki/%E7%B1%B3%E7%94%B0%E5%BC%95%E7%90%86)

为了防止本书变成罗列一大堆只用一次的概念的无聊数学书，本书不会给出米田引理的详细定义，知道上面的大概意思就可以了。

## 泛性质

由于米田引理，为了构造某一未知的数学对象 X, 我们可以通过要求所有进入或离开 X 的映射都满足某一性质，这个性质就是 X 的泛性质。

比如，如果对一个集合 X，我们有：

- 对于任意一个集合 A，如果有两个映射 A → B 和 A → C，则可以唯一决定映射 A → X。

那么我们就可以确定 X 是（等价于）A × B。

## positive type & negative type

泛性质说明我们可以通过**进入**或**离开** X 的映射来定义 X。

如果某个类型的泛性质是通过**离开** X 的映射来定义 X，那么我们称这个类型是一个 positive type。

如果某个类型的泛性质是通过**进入** X 的映射来定义 X，那么我们称这个类型是一个 negative type。

当然，我们也可以说 positive type 是 先定义出 constructors，在针对每种 constructor 定义 eliminator 的类型，而 negative type 是先定义出 eliminator，在针对每种 eliminator 定义 constructor 的类型。

许多数学对象都既可以通过 positive type 来定义，也可以通过 negative type 来定义。

## 例子

### (Dependent) product type

#### 进入的映射/As a negative type

<iframe class="quiver-embed" src="https://q.uiver.app/#q=WzAsNSxbMCwwLCJBIFxcdGltZXMgQiJdLFswLDIsIlgiXSxbMiwwLCJBIixbMCw2MCw2MCwxXV0sWzQsMCwiQiIsWzAsNjAsNjAsMV1dLFszLDIsIlgiLFswLDYwLDYwLDFdXSxbMSwwLCJoIl0sWzQsMiwiZiIsMCx7ImNvbG91ciI6WzAsNjAsNjBdfSxbMCw2MCw2MCwxXV0sWzQsMywiZyIsMix7ImNvbG91ciI6WzAsNjAsNjBdfSxbMCw2MCw2MCwxXV0sWzAsMiwiXFxwaV8xIl0sWzAsMywiXFxwaV8yIiwwLHsiY3VydmUiOi0yfV0sWzUsNiwiXFxwaV8x4oiYLSIsMCx7Im9mZnNldCI6MSwic2hvcnRlbiI6eyJzb3VyY2UiOjEwLCJ0YXJnZXQiOjEwfX1dLFs1LDcsIlxccGlfMuKImC0iLDIseyJvZmZzZXQiOjIsImN1cnZlIjozLCJzaG9ydGVuIjp7InNvdXJjZSI6MTAsInRhcmdldCI6MTB9fV1d&embed" width="712" height="432" style="border-radius: 8px; border: none;"></iframe>

如图，对于任意一个类型 X 和 \\(f : X \to A\\)，\\(g : X \to B\\)，我们可以唯一决定 \\(h : X \to A \times B\\) ，我们这时就可以用 \\(f\\) 和 \\(g\\) 来定义 \\(h\\)，进而定义 \\(A \times B\\)。

这里 \\(\pi_1 \circ h = f\\) 和 \\(\pi_2 \circ h = g\\)

#### 离开的映射/As a positive type


<iframe class="quiver-embed" src="https://q.uiver.app/#q=WzAsNSxbMCwwLCJBIFxcdGltZXMgQiJdLFswLDIsIlgiXSxbMiwwLCJBIixbMCw2MCw2MCwxXV0sWzMsMCwiQiIsWzAsNjAsNjAsMV1dLFsyLDIsIlgiLFswLDYwLDYwLDFdXSxbMCwxLCJnIiwyXSxbMCwyLCJcXHBpXzEiXSxbMiwzLCIiLDAseyJjb2xvdXIiOlswLDYwLDYwXSwic3R5bGUiOnsiYm9keSI6eyJuYW1lIjoibm9uZSJ9LCJoZWFkIjp7Im5hbWUiOiJub25lIn19fV0sWzAsMywiXFxwaV8yIiwwLHsiY3VydmUiOi0yfV0sWzcsNCwiaCIsMix7ImN1cnZlIjotMSwic2hvcnRlbiI6eyJzb3VyY2UiOjIwfSwibGV2ZWwiOjEsImNvbG91ciI6WzAsNjAsNjBdfSxbMCw2MCw2MCwxXV0sWzUsOSwiXFxsYW1iZGEgZiwoeCwgeSkgXFx0byBmXFwgeFxcIHkiLDIseyJzaG9ydGVuIjp7InNvdXJjZSI6MjAsInRhcmdldCI6MjB9LCJsZXZlbCI6Mn1dXQ==&embed" width="584" height="432" style="border-radius: 8px; border: none;"></iframe>

类似地，对于任意一个类型 X 和 \\(h : A → B → X\\) ，我们可以唯一决定 \\(g : A \times B → X \\)，我们这时就可以用 \\(h\\) 来定义 \\(g\\)，进而定义 \\(A \times B\\)。

### Identity type

(TBA)

### empty type

### contractible type

### coproduct type

### disjunction

### Natural number

### Propositional truncation

对于类型 A 的 proposition truncation \\(||A||\\)，我们可以用离开它的映射来定义它：

<iframe class="quiver-embed" src="https://q.uiver.app/#q=WzAsMyxbMiwwLCJ8fEF8fCJdLFsyLDIsIkIiXSxbMCwwLCJBIl0sWzIsMSwiXFxmb3JhbGwgZiIsMV0sWzAsMSwiXFxmb3JhbGwgZyJdLFsyLDAsIlxcZXRhIiwwLHsiY29sb3VyIjpbMCwwLDc1XX0sWzAsMCw3NSwxXV0sWzMsNCwiIiwyLHsib2Zmc2V0IjoxLCJzaG9ydGVuIjp7InNvdXJjZSI6MjAsInRhcmdldCI6MTB9LCJsZXZlbCI6MSwic3R5bGUiOnsiaGVhZCI6eyJuYW1lIjoibm9uZSJ9fX1dLFszLDQsIiIsMCx7InNob3J0ZW4iOnsic291cmNlIjoyMCwidGFyZ2V0IjoxMH0sImxldmVsIjoxLCJzdHlsZSI6eyJib2R5Ijp7Im5hbWUiOiJzcXVpZ2dseSJ9LCJoZWFkIjp7Im5hbWUiOiJub25lIn19fV1d&embed" width="432" height="432" style="border-radius: 8px; border: none;"></iframe>

如图，对 proposition B ，如果类型 \\(A → B\\) 和 类型 \\(||A|| → B\\) 等价，则可以唯一决定 \\(A\\) 的 proposition truncation \\(||A||\\)，以及 A 到 \\(||A||\\) 的映射 \\(η\\)。

或者说，对 \\(–◦η : (||A|| → B) → (A → B)\\)，有 \\(\text{is-equiv}(–◦η)\\)

当然，任意一个 \\(A\\) 到 \\(B\\) 的映射其实也是一个 \\(A\\) 的 proposition truncation 函数，我们可以知道所有 proposition truncation 函数得到的 proposition 都是等价的。

实际上这个泛性质对 set truncation 也成立。

对于一个满足 universal property 的 propositional truncation 函数 \\(f\\)，我们可以知道 \\(f\\) 是一个 surjective map，反之亦然。

### surjective map

对于某个满射 \\(f : A → B\\)，研究 B 上的所有元素是否符合 propositions P，等价于研究 A 上的所有元素 x ， f(x) 是否符合 propositions P，即：

$$
-∘f : (Π_{(y:B)} P(y)) → (Π_{(x:A)} P(f(x)))
$$

是一个等价函数。

另外，可以推广到如果 𝑃 是 (𝑘 + 1)-type，则 \\(-∘f\\) 是 k-truncated 的。

### image of function

<iframe class="quiver-embed" src="https://q.uiver.app/#q=WzAsNCxbMCwyLCJBIl0sWzQsMiwiWCJdLFsyLDEsIkIiXSxbMiwwLCJJIl0sWzAsMiwicyIsMV0sWzAsMSwiZiIsMl0sWzIsMSwibSIsMSx7InN0eWxlIjp7InRhaWwiOnsibmFtZSI6Imhvb2siLCJzaWRlIjoidG9wIn19fV0sWzAsMywicSJdLFszLDEsImkiLDAseyJzdHlsZSI6eyJ0YWlsIjp7Im5hbWUiOiJob29rIiwic2lkZSI6InRvcCJ9fX1dLFszLDIsInIiLDAseyJjb2xvdXIiOlswLDYwLDYwXX0sWzAsNjAsNjAsMV1dXQ==&embed" width="688" height="432" style="border-radius: 8px; border: none;"></iframe>

如图，有 \\(f : A → X\\)，A 的 像（值域）实际上是 \\(I\\)，which is \\(X\\) 的一部分，这造成了存在一个 \\(i : I → X\\)，是一个嵌入。

我们可以另外寻找一个嵌入 \\(m : B ↪ X\\)，使得 \\(r,m,i\\) 这个 communicate triangle 和 \\(s,m,f\\) 这个 communicate triangle 等价 ，则利用 \\(r,m,i\\) 的性质就能研究 I，这就是利用离开 I 的映射来定义它。

### set quotients

<iframe class="quiver-embed" src="https://q.uiver.app/#q=WzAsMyxbMCwwLCJYIl0sWzIsMCwiWSJdLFswLDIsIlgvUiJdLFswLDEsImYiLDFdLFswLDIsInEiLDFdLFsyLDEsImciLDFdXQ==&embed" width="436" height="432" style="border-radius: 8px; border: none;"></iframe>

如图，有 \\(R : A → A → Prop_{\mathcal{U}}\\)，q 是 R 的 set quotient，我们可以通过一个任意的函数 \\(f : A → X\\) 来唯一确定 q，使得这个 diagram 交换。

### circle
