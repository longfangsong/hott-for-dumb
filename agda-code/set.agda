{-# OPTIONS --cubical --cubical-compatible #-}

open import Agda.Primitive
open import Relation.Binary.PropositionalEquality using (_≡_; refl; trans; sym; cong; trans-injectiveˡ)
open import Data.Product
open import Data.Empty using (⊥)
open import Data.Sum using (_⊎_)

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

    axiom-K : {l : Level} → (A : Set l) → Set l
    axiom-K A = (x : A) → (p : x ≡ x) → p ≡ refl

    set-satisfies-axiom-K : {l : Level} → (A : SetIn l) → axiom-K (underling-type A)
    set-satisfies-axiom-K (A , A-is-set) x p = A-is-set x x p refl

    satisfies-axiom-K-is-set : {l : Level} → (A : Set l) → axiom-K A → is-set A
    satisfies-axiom-K-is-set A axiom-K-A x y p q = 
        trans-injectiveˡ (sym q) (trans p·q-1 (sym q·q-1))
        where
            p·q-1 = axiom-K-A x (trans p (sym q))
            q·q-1 = axiom-K-A x (trans q (sym q))
