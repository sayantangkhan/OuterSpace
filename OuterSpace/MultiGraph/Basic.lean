import Mathlib.Data.Rel
import Mathlib.Data.Set.Finite
import Mathlib.Data.Sym.Sym2

universe u

structure MultiGraph (V : Type u) where
  Adj : V → V → ℕ
  symm : ∀ v w, Adj v w = Adj w v

/-- Need a constructor for a multigraph -/
def MultiGraph.mk' {V : Type u} : MultiGraph V := sorry

-- /-- We can enumerate simple graphs by enumerating all functions `V → V → Nat`
-- and filtering on whether they are symmetric -/
-- instance {V : Type u} [Fintype V] [DecidableEq V] : Fintype (MultiGraph V) where
--   elems := Finset.univ.map MultiGraph.mk'
--   complete := by
--     classical
--     sorry
--     -- rintro ⟨Adj, hs, hi⟩
    -- simp only [mem_map, mem_univ, true_and, Subtype.exists, Bool.not_eq_true]
    -- refine ⟨fun v w ↦ Adj v w, ⟨?_, ?_⟩, ?_⟩
    -- · simp [hs.iff]
    -- · intro v; simp [hi v]
    -- · ext
    --   simp
