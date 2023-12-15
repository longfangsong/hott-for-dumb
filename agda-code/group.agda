open import Agda.Primitive
open import Relation.Binary.PropositionalEquality using (_≡_)
open import Function.Base
open import Data.Product

open import set using (SetIn) renaming (underling-type to Set-underling-type)

module group where
    AssociativeRelationOn : {l : Level} (A : Set l) → Set l
    AssociativeRelationOn A = Σ (A → A → A) 
        (λ m → (x y z : A) → (m (m x y) z) ≡ (m x (m y z)))

    SemiGroup : {l : Level} → Set (lsuc l)
    SemiGroup {l} = Σ (SetIn l) (λ s → AssociativeRelationOn (Set-underling-type s))

    SemiGroup-underling-type : {l : Level} → (G : SemiGroup {l = l}) → Set l
    SemiGroup-underling-type (S , _) = Set-underling-type S
    
    SemiGroup-relation-part : {l : Level} → (G : SemiGroup {l = l}) 
        → (SemiGroup-underling-type G → SemiGroup-underling-type G → SemiGroup-underling-type G)
    SemiGroup-relation-part G = proj₁ (proj₂ G)

    is-unital : {l : Level} → SemiGroup {l = l} → Set l
    is-unital G =
        Σ (SemiGroup-underling-type G)
            (λ u →
                ((y : SemiGroup-underling-type G) → (SemiGroup-relation-part G u y) ≡ y) ×
                ((x : SemiGroup-underling-type G) → (SemiGroup-relation-part G x u) ≡ x))

    Monoid : {l : Level} → Set (lsuc l)
    Monoid {l} = Σ (SemiGroup {l = l}) is-unital
    --           (semi-group,          (unit, evident))

    Monoid-underling-type : {l : Level} → (M : Monoid {l = l}) → Set l
    Monoid-underling-type (m , _) = SemiGroup-underling-type m

    Monoid-relation-part : {l : Level} → (M : Monoid {l = l}) 
        → (Monoid-underling-type M → Monoid-underling-type M → Monoid-underling-type M)
    Monoid-relation-part M = SemiGroup-relation-part (proj₁ M)

    Monoid-unit-element : {l : Level} → (M : Monoid {l = l}) → SemiGroup-underling-type (proj₁ M)
    Monoid-unit-element (m , is-unitial-G) = proj₁ is-unitial-G

    -- x |→ (inv-x , proof)
    is-group : {l : Level} → (M : Monoid {l = l}) → Set l
    is-group {l = l} M = (x : Monoid-underling-type M) → Σ (Monoid-underling-type M) 
            (λ y → 
                (Monoid-relation-part M x y) ≡ (Monoid-unit-element M) ×
                (Monoid-relation-part M y x) ≡ (Monoid-unit-element M)
            )

    Group : {l : Level} → Set (lsuc l)
    Group {l} = Σ (Monoid {l = l}) is-group

    Group-underling-type : {l : Level} → (M : Group {l = l}) → Set l
    Group-underling-type (m , _) = Monoid-underling-type m

