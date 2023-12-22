{-# OPTIONS --cubical --cubical-compatible #-}

open import Agda.Primitive
open import Relation.Binary using (Rel)
open import Relation.Binary.PropositionalEquality using (_≡_; refl; sym; cong; subst)
open import Data.Product
open import equivalence

module category where
    record Category (o ℓ : Level) : Set (lsuc (o ⊔ ℓ)) where
        infix  4 _⇒_
        infixr 9 _∘_

        field
          Obj : Set o
          _⇒_ : Rel Obj ℓ

          id  : ∀ {A} → (A ⇒ A)
          _∘_ : ∀ {A B C} → (B ⇒ C) → (A ⇒ B) → (A ⇒ C)

        field
          assoc     : ∀ {A B C D} {f : A ⇒ B} {g : B ⇒ C} {h : C ⇒ D} → (h ∘ g) ∘ f ≡ h ∘ (g ∘ f)
          identityˡ : ∀ {A B} {f : A ⇒ B} → id ∘ f ≡ f
          identityʳ : ∀ {A B} {f : A ⇒ B} → f ∘ id ≡ f

    is-isomorphism : {o h : Level} → {C : Category o h} 
      {A B : Category.Obj C} 
      (f : Category._⇒_ C A B) → Set h
    is-isomorphism {C = C} {A = A} {B = B} f = 
      Σ (Category._⇒_ C B A) 
        (λ g → (Category._∘_ C g f ≡ Category.id C) × (Category._∘_ C f g ≡ Category.id C))

    _≅_ : {o h : Level} → {C : Category o h} → Category.Obj C → Category.Obj C → Set h
    _≅_ {C = C} A B = Σ (Category._⇒_ C A B) (is-isomorphism {C = C})
    
    ≡→≅ : {o h : Level} → {C : Category o h} → {A B : Category.Obj C} → A ≡ B → _≅_ {C = C} A B
    ≡→≅ {C = C} refl = Category.id C , Category.id C , Category.identityˡ C , Category.identityʳ C

    is-category : ∀ {o ℓ} (C : Category o ℓ) → Set (o ⊔ ℓ)
    is-category C = (A B : Category.Obj C) → is-equiv (≡→≅ {C = C} {A = A} {B = B})
