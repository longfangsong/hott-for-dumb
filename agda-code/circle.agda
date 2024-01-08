{-# OPTIONS --cubical --cubical-compatible #-}

open import Agda.Primitive
open import Cubical.Foundations.Prelude using (i0; i1; transport; subst; cong; sym; _∙_; _≡_; refl)
open import Cubical.Foundations.Isomorphism using (Iso; iso; section; retract; isoToPath)
open import Relation.Binary.PropositionalEquality using () renaming (_≡_ to _≡t_; refl to reflt)
open import Relation.Nullary using (¬_)
open import Data.Bool
open import Data.Product
open import Data.Nat using (zero) renaming (suc to suc-ℕ)
open import Data.Integer
open import Function.Base


module circle where
    data S¹ : Set where
        base : S¹
        loop : base ≡ base

    postulate
        upgrade-≡ : ∀ {A : Set} {x y : A} → x ≡t y → x ≡ y
        downgrade-≡ : ∀ {A : Set} {x y : A} → x ≡ y → x ≡t y

    IsomorphismNot : Iso Bool Bool
    IsomorphismNot = iso not not section-not retract-not
        where 
            section-not : section not not
            section-not false i = false
            section-not true i = true
            retract-not : retract not not
            retract-not false i = false
            retract-not true i = true

    notPath : Bool ≡ Bool
    notPath = isoToPath IsomorphismNot

    postulate
        true≢false : ¬ (true ≡ false)

    not-cover : S¹ → Set
    not-cover base = Bool
    not-cover (loop i) = notPath i

    -- Take a bool, transport it along the corresponding path in not-cover
    -- for example:
    --     lift-to-cover true loop = false, means 
    --         if transport `true` along the corresponding path of `loop`, ie. notPath, we get `false`
    --     lift-to-cover true refl = true
    --         if transport `true` along `refl`, we get true
    lift-to-cover : Bool → base ≡ base → not-cover base
    lift-to-cover b p = subst not-cover p b

    loop≢refl : ¬ (loop ≡ refl)
    loop≢refl loop≡refl = true≢false (cong (lift-to-cover true) (sym loop≡refl))

    IsomorphismSuc : Iso ℤ ℤ
    IsomorphismSuc = iso suc pred suc-pred pred-suc
        where 
            suc-pred : (b : ℤ) → suc (pred b) ≡ b
            suc-pred (+ zero) i = + zero
            suc-pred +[1+ n ] i = +[1+ n ] 
            suc-pred (-[1+ n ]) i = -[1+ n ]

            pred-suc : (b : ℤ) → pred (suc b) ≡ b
            pred-suc (+ n) i = + n
            pred-suc (-[1+ zero ]) i = -[1+ zero ]
            pred-suc (-[1+ (suc-ℕ n) ] ) i = -[1+ (suc-ℕ n) ]
    
    sucPath : ℤ ≡ ℤ
    sucPath = isoToPath IsomorphismSuc

    loop_times : ℤ → base ≡ base
    loop + zero times = refl
    loop +[1+ n ] times = loop ∙ (loop + n times)
    loop -[1+ zero ] times = sym loop
    loop -[1+ (suc-ℕ n) ] times = sym loop ∙ loop -[1+ n ] times

    -- code
    ℤ-cover : S¹ → Set
    ℤ-cover base = ℤ
    ℤ-cover (loop i) = sucPath i

    lift-base-to-cover-ℤ : ℤ → base ≡ base → ℤ-cover base
    lift-base-to-cover-ℤ n p = subst ℤ-cover p n

    lift-to-cover-ℤ : ℤ → (x : S¹) → base ≡ x → ℤ-cover x
    lift-to-cover-ℤ n x p = subst ℤ-cover p n

    -- encode
    lift-to-cover-0ℤ = lift-to-cover-ℤ (+ zero)

    -- decode
    inv-lift-to-cover-0ℤ : (x : S¹) → ℤ-cover x → base ≡ x
    inv-lift-to-cover-0ℤ base = loop_times
    inv-lift-to-cover-0ℤ (loop i) = λ x i₁ → {!   !}

    IsomorphismSCover-ℤ : Iso ℤ (base ≡ base)
    IsomorphismSCover-ℤ = iso loop_times {!   !} {!   !} {!   !}

    loop-space-is-ℤ : (base ≡ base) ≡ ℤ
    loop-space-is-ℤ = {!   !}
  