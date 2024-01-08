{-# OPTIONS --cubical --cubical-compatible #-}

open import Agda.Primitive
open import Agda.Builtin.Sigma using (Σ)
open import Relation.Binary.PropositionalEquality using (_≡_; refl; sym; cong; trans; subst; resp)
open import Function.Base
open import Data.Product

open import homotopy
open import n-type

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

    has-inverse→is-equiv : {l1 l2 : Level} {A : Set l1} {B : Set l2} {f : A → B} → has-inverse f → is-equiv f
    has-inverse→is-equiv (inv , (r-homo , l-homo)) = (inv , r-homo) , (inv , l-homo)

    is-equiv→has-inverse : {l1 l2 : Level} {A : Set l1} {B : Set l2} {f : A → B} → is-equiv f → has-inverse f
    is-equiv→has-inverse {f = f} ((r-inv , r-homo), (l-inv , l-homo)) = 
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
        B→C ∘ A→B , has-inverse→is-equiv (B→A ∘ C→B , 
            f-chain-H B→C (λ x → A→B∘B→A~id (C→B x)) · B→C∘C→B~id , 
            f-chain-H B→A (λ x → C→B∘B→C~id (A→B x)) · B→A∘A→B~id
        ) where 
            A→B = proj₁ A≃B
            is-equiv-A→B = proj₂ A≃B
            has-inverse-A→B = is-equiv→has-inverse is-equiv-A→B
            B→A = proj₁ has-inverse-A→B
            A→B∘B→A~id : (A→B ∘ B→A) ~ id
            A→B∘B→A~id = proj₁ (proj₂ has-inverse-A→B)
            B→A∘A→B~id : (B→A ∘ A→B) ~ id
            B→A∘A→B~id = proj₂ (proj₂ (has-inverse-A→B))
            B→C = proj₁ B≃C
            is-equiv-B→C = proj₂ B≃C
            has-inverse-B→C = is-equiv→has-inverse is-equiv-B→C
            C→B = proj₁ has-inverse-B→C
            B→C∘C→B~id = proj₁ (proj₂ has-inverse-B→C)
            C→B∘B→C~id = proj₂ (proj₂ has-inverse-B→C)

    sym-≃ : {l1 l2 : Level} {A : Set l1} {B : Set l2} → (A ≃ B) → (B ≃ A)
    sym-≃ (f , is-equiv-f) = inv , 
        (f , is-linv-evidence) , 
        (f , is-rinv-evidence)
        where
            has-inverse-f = is-equiv→has-inverse is-equiv-f
            inv = proj₁ has-inverse-f
            has-inverse-ev = proj₂ has-inverse-f
            is-rinv-evidence = proj₁ has-inverse-ev
            is-linv-evidence = proj₂ has-inverse-ev

    postulate
        ua : {l : Level} {A : Set l} {B : Set l} → A ≃ B → A ≡ B

    fib-contractable→is-equiv : {l1 l2 : Level} {A : Set l1} {B : Set l2} → {f : A → B} → ((b : B) → is-contr (fib f b)) → is-equiv f
    fib-contractable→is-equiv {B = B} {f = f} fib-at-b-contr = 
        has-inverse→is-equiv (f-inv , 
            (λ b → evidence-is-fib b) , 
            (λ a → sym (cong proj₁ (fib-at-b-contraction (f a) (a , refl))))
        )
        where
            fib-at-b-contr-center = λ (b : B) → proj₁ (fib-at-b-contr b)
            fib-at-b-contraction = λ (b : B) → proj₂ (fib-at-b-contr b)
            f-inv = λ (b : B) → proj₁ (fib-at-b-contr-center b)
            evidence-is-fib = λ (b : B) → proj₂ (fib-at-b-contr-center b)
    
    Eq-fib : {l1 l2 : Level} {A : Set l1} {B : Set l2} → (f : A → B) 
        → {y : B} → ((x , p) : fib f y) → ((x' , p') : fib f y)
        → Set (l1 ⊔ l2)
    Eq-fib f (x , p) (x' , p') = Σ (x ≡ x') (λ α → p ≡ trans (cong f α) p')

    postulate
        Eq-fib→≡-fib : {l1 l2 : Level} {A : Set l1} {B : Set l2} → (f : A → B) 
            → {y : B} → ((x , p) : fib f y) → ((x' , p') : fib f y)
            → Eq-fib f (x , p) (x' , p') → (x , p) ≡ (x' , p')
    

    uniqueness-refl : {i : Level} {A : Set i} 
        (a : A) (x : A) (p : a ≡ x) →
        ((a , refl {x = a}) ≡ (x , p))
    uniqueness-refl a a refl = refl
