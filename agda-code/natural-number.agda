open import Agda.Primitive
open import Data.Nat
open import Relation.Binary.PropositionalEquality using (_≡_; refl; cong; sym; module ≡-Reasoning)
open import identity-type using (J; _⋅_)

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