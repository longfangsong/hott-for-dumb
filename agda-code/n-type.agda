open import Agda.Primitive
open import Relation.Binary.PropositionalEquality using (_≡_)
open import Data.Product

module n-type where
    is-contr : {l : Level} → (A : Set l) → Set l
    is-contr A = Σ A (λ c → (x : A) → x ≡ c)

    data 𝕋 : Set where
        neg-two : 𝕋
        suc : 𝕋 → 𝕋

    neg-one : 𝕋
    neg-one = suc neg-two
    
    0𝕋 : 𝕋
    0𝕋 = suc neg-one

    1𝕋 : 𝕋
    1𝕋 = suc 0𝕋

    is-_-type : {l : Level} → 𝕋 → (A : Set l) → Set l
    is- neg-two -type = is-contr
    is- (suc n) -type  A = (x y : A) → is- n -type (x ≡ y)

    _Type : {l : Level} → 𝕋 → Set (lsuc l)
    _Type {l = l} n = Σ (Set l) (λ A → is- n -type A)

    underling-type : {l : Level} → {n : 𝕋} → (n Type) → Set l
    underling-type {n = n} (A , _) = A

    is-groupoid : {l : Level} → (A : Set l) → Set l
    is-groupoid = is- 1𝕋 -type

    Groupoid : {l : Level} → Set (lsuc l)
    Groupoid = 1𝕋 Type

    data ||_||_ {l : Level} (A : Set l) (t : 𝕋) : Set (lsuc l) where
        squash : A → || A || t

    postulate
        is-k-Type-after-squash : {l : Level} → (k : 𝕋) → (A : Set l) → is- k -type (|| A || k)