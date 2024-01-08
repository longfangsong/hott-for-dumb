{-# OPTIONS --cubical --cubical-compatible #-}

open import Function.Base
open import Agda.Primitive
open import Agda.Builtin.Sigma using (Σ; _,_)
open import Data.Nat
open import Data.Product
open import Relation.Binary.PropositionalEquality using (_≡_; refl; cong; sym; module ≡-Reasoning)
open import identity-type using (J; _⋅_)
open import Data.Unit using (⊤; tt)
open import Data.Empty using (⊥)

open import homotopy
open import n-type
open import equivalence

module natural-number where
    0-is-right-unit : ∀ n → 0 + n ≡ n
    0-is-right-unit n = refl

    0-is-left-unit : ∀ n → n + 0 ≡ n
    0-is-left-unit zero = refl
    0-is-left-unit (suc n) = cong suc (0-is-left-unit n)

    m+1+n≡m+n+1 : ∀ m n → (suc m) + n ≡ suc (m + n)
    m+1+n≡m+n+1 m n = refl

    m+n≡n+m : ∀ m n → m + n ≡ n + m 
    m+n≡n+m zero n = sym (0-is-left-unit n)  
    m+n≡n+m (suc m) zero = cong suc (0-is-left-unit m) 
    m+n≡n+m (suc m) (suc n) = cong suc (begin 
            m + suc n   ≡⟨ m+n≡n+m m (suc n) ⟩
            (suc n) + m ≡⟨ m+1+n≡m+n+1 n m ⟩
            suc (n + m) ≡⟨ cong suc (m+n≡n+m n m) ⟩
            suc (m + n) ≡⟨ sym (m+1+n≡m+n+1 m n) ⟩
            (suc m) + n ≡⟨ m+n≡n+m (suc m) n ⟩
            n + suc m
        ∎)
        where open ≡-Reasoning

    Eq : ℕ → ℕ → Set
    Eq zero zero = ⊤
    Eq zero (suc n) = ⊥
    Eq (suc m) zero = ⊥
    Eq (suc m) (suc n) = Eq m n

    refl-Eq : ∀ n → Eq n n
    refl-Eq zero = tt
    refl-Eq (suc n) = refl-Eq n

    suc-Eq : {m : ℕ} {n : ℕ} → Eq m n → Eq (suc m) (suc n)
    suc-Eq {zero} {zero} = λ _ → tt
    suc-Eq {zero} {suc n} = λ z → z
    suc-Eq {suc m} {zero} = λ z → z
    suc-Eq {suc m} {suc n} = λ z → z

    suc-Eq-on-pointed : {m : ℕ} → Σ ℕ (Eq m) → Σ ℕ (Eq (suc m))
    suc-Eq-on-pointed (n , e) = (suc n , e)
    
    contract-Σ-ℕ-Eq : ∀ (m : ℕ) (x : Σ ℕ (Eq m)) → x ≡ (m , refl-Eq m)
    contract-Σ-ℕ-Eq (zero) (zero , _) = refl
    contract-Σ-ℕ-Eq (suc m) (suc n , e) = cong suc-Eq-on-pointed (contract-Σ-ℕ-Eq m (n , e))

    is-contr-Σ-ℕ-Eq : (m : ℕ) → is-contr (Σ ℕ (Eq m))
    is-contr-Σ-ℕ-Eq m = (m , refl-Eq m) , contract-Σ-ℕ-Eq m

    ≡→Eq : {x y : ℕ} → x ≡ y → Eq x y
    ≡→Eq {x} {.x} refl = refl-Eq x
    
    Eq→≡ : {x y : ℕ} → Eq x y → x ≡ y
    Eq→≡ {zero} {zero} eqnxy = refl
    Eq→≡ {suc x} {suc y} eqnxy = cong suc (Eq→≡ {x} {y} eqnxy)
