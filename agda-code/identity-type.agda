{-# OPTIONS --cubical --cubical-compatible #-}

open import Agda.Primitive
open import Relation.Binary.PropositionalEquality using (_≡_; refl)

module identity-type where
    postulate
        J' : {l1 l2 : Level} {A : Set l1} → {a : A} → {P : (x : A) → (a ≡ x) → Set l2} → 
                P a refl → (x : A) → (p : a ≡ x) → P x p

    J : {l1 l2 : Level} {A : Set l1} → {C : (x y : A) → (x ≡ y) → Set l2} → 
        (x : A)               → C x x refl → 
        (y : A) → (p : x ≡ y) → C x y p
    J {C = C} x base-holds y p = J' {a = x} {P = C x} base-holds y p

    _⋅_ : {l : Level} {A : Set l} → {x y z : A} → x ≡ y → y ≡ z → x ≡ z
    _⋅_ {A = A} {x} {y} {z} x≡y y≡z = J {C = λ (x : A) (y : A) (p : x ≡ y) → (y ≡ z) → (x ≡ z)} x (λ x≡z → x≡z) y x≡y y≡z

    infixr 40 _⋅_

    sym : {l : Level} {A : Set l} → {x y : A} → x ≡ y → y ≡ x
    sym {l} {A} {x = x} {y = y} x≡y = J {C = λ (x : A) (y : A) (p : x ≡ y) → y ≡ x} x (refl {x = x}) y x≡y 

    cong : {l1 l2 : Level} {A : Set l1} {B : Set l2} → (f : A → B) → {x y : A} → x ≡ y → f x ≡ f y
    cong {A = A} f {x} {y} x≡y = J {C = λ (x : A) (y : A) (p : x ≡ y) → f x ≡ f y} x (refl {x = f x}) y x≡y

    subst : {l1 l2 : Level} {A : Set l1} {P : A → Set l2} → {x y : A} → x ≡ y → P x → P y
    subst {A = A} {P = P} {x = x} {y = y} x≡y = J {C = λ (x : A) (y : A) (p : x ≡ y) → P x → P y} x (λ t → t) y x≡y

