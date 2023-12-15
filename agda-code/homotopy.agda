open import Agda.Primitive
open import Relation.Binary.PropositionalEquality using (_≡_; refl; sym; trans; cong)
open import Function.Base

module homotopy where
    _~_ : {l1 l2 : Level} {A : Set l1} {B : A → Set l2} (f g : (x : A) → B x) → Set (l1 ⊔ l2)
    _~_ {A = A} f g = (x : A) → f x ≡ g x

    refl-htpy : {l1 l2 : Level} {A : Set l1} {B : A → Set l2} {f : (x : A) → B x} → f ~ f
    refl-htpy x = refl
    
    sym-htpy : {l1 l2 : Level} {A : Set l1} {B : A → Set l2} {f g : (x : A) → B x} → f ~ g → g ~ f
    sym-htpy htpy = λ x → sym (htpy x)
    
    trans-htpy : {l1 l2 : Level} {A : Set l1} {B : A → Set l2} {f g h : (x : A) → B x} → f ~ g → g ~ h → f ~ h
    trans-htpy htpy1 htpy2 = λ x → trans (htpy1 x) (htpy2 x)
    
    _·_ : {l1 l2 : Level} {A : Set l1} {B : A → Set l2} {f g h : (x : A) → B x} → f ~ g → g ~ h → f ~ h
    _·_ = trans-htpy

    infixr 20 _·_
    
    f-chain-H : {l1 l2 l3 : Level} {A : Set l1} {B : Set l2} {C : Set l3} {f g : A → B} (h : B → C) (H : f ~ g) → ((h ∘ f) ~ (h ∘ g))
    f-chain-H h H = λ x → cong h (H x)
    
    H-chain-f : {l1 l2 l3 : Level} {A : Set l1} {B : Set l2} {C : Set l3} {g h : B → C} (H : g ~ h) (f : A → B) → ((h ∘ f) ~ (g ∘ f))
    H-chain-f H f = λ x → sym (H (f x))