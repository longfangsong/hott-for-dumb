{-# OPTIONS --cubical --cubical-compatible #-}

-- We need to use _≡_ in Cubical Agda because the one in Relation.Binary.PropositionalEquality
-- does not capture the path structure of identity type.
open import Cubical.Foundations.Prelude using (i0; i1; transport) renaming (_≡_ to _≡p_; refl to reflp)
open import Cubical.Foundations.Isomorphism using (Iso; iso; section; retract; isoToPath)
open import Relation.Binary.PropositionalEquality using (_≡_; refl; sym; cong; subst)
open import Relation.Nullary using (¬_)
open import Data.Bool
open import Data.Product
open import Function.Base

open import homotopy
open import equivalence

module circle where
    data S¹ : Set where
        base : S¹
        loop : base ≡p base

    postulate
        upgrade-≡ : ∀ {A : Set} {x y : A} → x ≡ y → x ≡p y
        downgrade-≡p : ∀ {A : Set} {x y : A} → x ≡p y → x ≡ y

    NotIso : Iso Bool Bool
    NotIso = iso not not section-not retract-not
        where 
            section-not : section not not
            section-not false i = false
            section-not true i = true
            retract-not : retract not not
            retract-not false i = false
            retract-not true i = true
    -- Bool-≃-by-neg : Bool ≃ Bool
    -- Bool-≃-by-neg = not , (not , λ { true → refl ; false → refl  }) , not , λ { true → refl ; false → refl  }

    -- Bool-≃-by-id : Bool ≃ Bool
    -- Bool-≃-by-id = id , (id , λ { true → refl ; false → refl  }) , id , λ { true → refl ; false → refl  }

    -- Bool-≡-by-neg : Bool ≡ Bool
    -- Bool-≡-by-neg = ua Bool-≃-by-neg
    
    -- Bool-≡-by-id : Bool ≡ Bool
    -- Bool-≡-by-id = ua Bool-≃-by-id

    -- Bool-≡-by-neg≢Bool-≡-by-id : ¬ (Bool-≃-by-neg ≡ Bool-≃-by-id)
    -- Bool-≡-by-neg≢Bool-≡-by-id Bool-≃-by-neg≡Bool-≃-by-id = {!!}

    postulate
        true≢false : ¬ (true ≡p false)

    loop≢refl : ¬ (loop ≡p reflp)
    loop≢refl loop≡prefl = {! transport (isoToPath NotIso) true !}

