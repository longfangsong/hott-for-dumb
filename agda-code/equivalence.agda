open import Agda.Primitive
open import Agda.Builtin.Sigma using (Σ)
open import Relation.Binary.PropositionalEquality using (_≡_; refl)
open import Function.Base
open import Data.Product

open import homotopy

module equivalence where
    sec : {l1 l2 : Level} {A : Set l1} {B : Set l2} (f : A → B) → Set (l1 ⊔ l2)
    sec {_} {_} {A} {B} f = Σ (B → A) (λ g → ((f ∘ g) ~ id))
    
    retr : {l1 l2 : Level} {A : Set l1} {B : Set l2} (f : A → B) → Set (l1 ⊔ l2)
    retr {_} {_} {A} {B} f = Σ (B → A) (λ h → ((h ∘ f) ~ id))
    
    is-equiv : {l1 l2 : Level} {A : Set l1} {B : Set l2} (f : A → B) → Set (l1 ⊔ l2)
    is-equiv {_} {_} {A} {B} f = sec f × retr f
    
    _≃_ : {l1 l2 : Level} (A : Set l1) (B : Set l2) → Set (l1 ⊔ l2)
    A ≃ B = Σ (A → B) (λ f → is-equiv f)

    has-inverse : {l1 l2 : Level} {A : Set l1} {B : Set l2} (f : A → B) → Set (l1 ⊔ l2)
    has-inverse {_} {_} {A} {B} f = Σ (B → A) (λ g → ((f ∘ g) ~ id) × ((g ∘ f) ~ id))

    has-inverse-to-is-equiv : {l1 l2 : Level} {A : Set l1} {B : Set l2} {f : A → B} → has-inverse f → is-equiv f
    has-inverse-to-is-equiv (inv , (r-homo , l-homo)) = (inv , r-homo) , (inv , l-homo)

    is-equiv-to-has-inverse : {l1 l2 : Level} {A : Set l1} {B : Set l2} {f : A → B} → is-equiv f → has-inverse f
    is-equiv-to-has-inverse {f = f} ((r-inv , r-homo), (l-inv , l-homo)) = 
        r-inv , (r-homo , 
            sym-htpy (sym-htpy 
                l-homo · (
                    H-chain-f (H-chain-f l-homo r-inv · f-chain-H l-inv r-homo) f
                )
            )
        )
    
    refl-≃ : {i : Level} {A : Set i} → A ≃ A
    refl-≃ = id (id , (id , (λ x → refl)) , id , (λ x → refl))
    
    trans-≃ : {i : Level} {A B C : Set i} → A ≃ B → B ≃ C → A ≃ C
    trans-≃ A≃B B≃C = 
        B→C ∘ A→B , has-inverse-to-is-equiv (B→A ∘ C→B , 
            f-chain-H B→C (λ x → A→B∘B→A~id (C→B x)) · B→C∘C→B~id , 
            f-chain-H B→A (λ x → C→B∘B→C~id (A→B x)) · B→A∘A→B~id
        ) where 
            A→B = proj₁ A≃B
            is-equiv-A→B = proj₂ A≃B
            has-inverse-A→B = is-equiv-to-has-inverse is-equiv-A→B
            B→A = proj₁ has-inverse-A→B
            A→B∘B→A~id : (A→B ∘ B→A) ~ id
            A→B∘B→A~id = proj₁ (proj₂ has-inverse-A→B)
            B→A∘A→B~id : (B→A ∘ A→B) ~ id
            B→A∘A→B~id = proj₂ (proj₂ (has-inverse-A→B))
            B→C = proj₁ B≃C
            is-equiv-B→C = proj₂ B≃C
            has-inverse-B→C = is-equiv-to-has-inverse is-equiv-B→C
            C→B = proj₁ has-inverse-B→C
            B→C∘C→B~id = proj₁ (proj₂ has-inverse-B→C)
            C→B∘B→C~id = proj₂ (proj₂ has-inverse-B→C)

    sym-≃ : {l1 l2 : Level} {A : Set l1} {B : Set l2} → (A ≃ B) → (B ≃ A)
    sym-≃ (f , is-equiv-f) = inv , 
        (f , is-linv-evidence) , 
        (f , is-rinv-evidence)
        where
            has-inverse-f = is-equiv-to-has-inverse is-equiv-f
            inv = proj₁ has-inverse-f
            has-inverse-ev = proj₂ has-inverse-f
            is-rinv-evidence = proj₁ has-inverse-ev
            is-linv-evidence = proj₂ has-inverse-ev

