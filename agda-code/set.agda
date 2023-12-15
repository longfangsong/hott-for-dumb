open import Agda.Primitive
open import Relation.Binary.PropositionalEquality using (_≡_)
open import Data.Product

open import proposition using (is-prop)

module set where
    is-set : {l : Level} → (A : Set l) → Set l
    is-set A = (x y : A) → is-prop (x ≡ y)

    SetIn : (l : Level) → Set (lsuc l)
    SetIn l = Σ (Set l) (λ A → is-set A)

    underling-type : {l : Level} → SetIn l → Set l
    underling-type (A , _) = A

    data ||_||₀ {l : Level} (A : Set l) : Set (lsuc l) where
        squash : A → || A ||₀

    postulate
        is-set-after-squash : {l : Level} → (A : Set l) → is-set || A ||₀
