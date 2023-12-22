{-# OPTIONS --cubical --cubical-compatible #-}

open import Agda.Primitive
open import Relation.Binary.PropositionalEquality using (_≡_; refl)
open import Data.Nat
open import Data.Product

module loop-space where
    PointedType : {l : Level} → Set (lsuc l)
    PointedType {l} = Σ (Set l) λ A → A

    underling-type : ∀ {l : Level} → PointedType {l} → Set l
    underling-type (A , _) = A

    point : ∀ {l : Level} → (T : PointedType {l}) → underling-type T
    point (_ , a) = a

    Ω : {l : Level} → PointedType {l = l} → PointedType {l = l}
    Ω (A , a) = ((a ≡ a) , refl {x = a})

    Ω^ : {l : Level} → (n : ℕ) → (A : PointedType {l = l}) → PointedType {l = l}
    Ω^ zero A = A
    Ω^ (suc n) A = Ω^ n (Ω A)