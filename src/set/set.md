# 集合

在 Agda 中非常讨厌的一点是 `Set` 关键字被用来表示类型，而不是集合。实际上这两个概念是完全不同的。

在公理化集合论中，[我们并不给出集合的具体定义](https://zh.wikipedia.org/zh-hans/%E9%9B%86%E5%90%88_(%E6%95%B0%E5%AD%A6)#%E5%85%AC%E7%90%86%E5%8C%96%E9%9B%86%E5%90%88%E8%AE%BA)。但我们可以“观察到”集合的一些性质：

- 无序性：集合中的元素是无序的，即 \\(\\{1, 2\\} = \\{2, 1\\}\\)。
- 互异性：集合中的元素是互异的，即 \\(\\{1, 1\\} = \\{1\\}\\)。
- 确定性：一个元素要么属于一个集合，要么不属于一个集合，不存在“模棱两可”的情况。

其中确定性和无序性对于任何一个类型是成立的，因为我们让所有元素都有一个类型（类型本身也有类型，即 Universe），且类型本身没有规定元素的顺序。

然而互异性这里却有一些问题，我们在说互异性的时候，实际上隐含了元素之间的“等于”关系，而且我们并**不关心**这个“等于”关系中的细节，我们只关心这个“等于”关系是否成立。

比如 `Bool` 类型，which 本身的类型是 \\(\mathcal{U}_0\\)，我们可以定义两种它和自身的等价关系[^1]：

- 由 \\(id\\) 函数，即 \\(true = true\\)，\\(false = false\\) 给出的类型之间的等价关系。
- 由 \\(not\\) 函数，即 \\(true = false\\)，\\(false = true\\) 给出的类型之间的等价关系。

（TBA：图片）

我们可以像在定义命题时那样，“抹去”相等关系中的细节（有几种和自身相等的关系等等），只关心相等关系是否成立，这样我们就可以得到一个“集合”，其上的元素要么相等（可以认为是一个元素），要么不相等，或者说，这个集合上元素之间的相等是一个命题。

“抹去”这些信息后的类型就是一个集合，我们称之为 **h-Set**。

## 集合的定义

$$
\begin{align}
isSet(A) &:= \Pi\_{(x, y : A)} isProp(x = y) \\\\
Set &:= Σ\_{(A : Type)} isSet(A)
\end{align}
$$

## 一般类型和命题的关系

和命题类似，对所有类型，我们都可以“抹去”它们上面的相等类型的其他细节，得到一个集合，我们用 \\(|| A ||_0\\) 表示 \\(A\\) 类型抹去这些信息后得到的集合。

当然，有些类型本身已经是集合了，对于这些类型，\\(A ≃ ||A||_0\\)。

对类型中的一个元素，我们可以将其对应到命题中的**那一个**元素，我们用 \\(| a |_0\\) 表示 \\(a\\) 对应的那一个元素。

这种把一般类型硬转成命题的方式被称为 **set truncation**。

我们将在之后某章中看到这里的 \\(_0\\) 的含义。

[^1]: 由 Univalence 公理，类型之间的等价就是相等。