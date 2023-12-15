open import Agda.Primitive
open import Relation.Binary.PropositionalEquality using (_≡_)
open import Data.Product
open import Data.Sum using (_⊎_)

module proposition where
    is-prop : {l1 : Level} → (A : Set l1) → Set l1
    is-prop A = (x y : A) → x ≡ y

    -- The name Prop is taken by Agda itself
    PropIn : (l : Level) → Set (lsuc l)
    PropIn l = Σ (Set l) (λ A → is-prop A)

    underling-type : ∀ {l : Level} → PropIn l → Set l
    underling-type (A , _) = A

    data ||_|| {l : Level} (A : Set l) : Set l where
        squash : A → || A ||

    postulate
        is-prop-after-squash : {l : Level} → (A : Set l) → is-prop || A ||
        squash-element : {l : Level} → {A : Set l} → A → || A ||

    _∨_ : {l1 l2 : Level} → Set l1 → Set l2 → Set (l1 ⊔ l2)
    A ∨ B = || A ⊎ B ||