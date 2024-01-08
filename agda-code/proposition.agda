{-# OPTIONS --cubical --cubical-compatible #-}

open import Agda.Primitive
open import Relation.Binary.PropositionalEquality using (_≡_; refl; cong; cong₂; cong-app; trans; sym)
open import Data.Product using (Σ; _,_; proj₁; proj₂; _×_)
open import Data.Sum using (_⊎_)
open import Data.Empty using (⊥)
open import Function.Base

open import n-type using (fib)
open import equivalence
open import homotopy
open import n-type using (is-contr)
open import identity-type using (J)

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

    ∃ : {l1 l2 : Level} (A : Set l1) → (B : A → Set l2) → Set (l1 ⊔ l2)
    ∃ A B = || Σ A B ||

    is-surj : {l1 l2 : Level} {A : Set l1} {B : Set l2} → (f : A → B) → Set (l1 ⊔ l2)
    is-surj {B = B} f = (b : B) → || fib f b ||
    
    is-emb : {l1 l2 : Level} {A : Set l1} {B : Set l2} (f : A → B) → Set (l1 ⊔ l2)
    is-emb {l1} {l2} {A} f = (x y : A) → is-equiv (cong f {x} {y})
