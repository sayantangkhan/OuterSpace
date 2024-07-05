import Mathlib.Data.Rel
import Mathlib.Data.Set.Finite
import Mathlib.Data.Sym.Sym2
import Mathlib.Data.Finset.Basic

universe u


@[ext]
structure MultiGraph (V : Type u) where
  Adj : V → V → ℕ
  symm : ∀ v w, Adj v w = Adj w v

/-- Need a constructor for a multigraph -/
def MultiGraph.mk' {V : Type u} : { adj : V → V → ℕ // (∀ (x y : V), adj x y = adj y x) } ↪ MultiGraph V where
  toFun f := ⟨f.1, f.2⟩
  inj' := by
    rintro ⟨adj, _⟩ ⟨adj', _⟩
    simp only [mk.injEq, Subtype.mk.injEq]
    simp

namespace MultiGraph

@[ext]
structure Subgraph {V : Type u} (G : MultiGraph V) where
  verts : Set V
  Adj : verts → verts → Finset ℕ
  Adj_bound : ∀ (v w : verts), ∀ (edge : Adj v w), edge < G.Adj v w
  symm : ∀ v w, Adj v w = Adj w v

namespace Subgraph

variable {G : MultiGraph V} {G₁ G₂ : G.Subgraph} {a b : V}


/-- A subgraph is called a *spanning subgraph* if it contains all the vertices of `G`. -/
def IsSpanning (G' : Subgraph G) : Prop :=
  ∀ v : V, v ∈ G'.verts

/-- Coercion from `G' : Subgraph G` to a `MultiGraph G'.verts`. -/
-- @[simps]
protected def coe (G' : Subgraph G) : MultiGraph G'.verts where
  Adj v w := (G'.Adj v w).card
  symm := by
    intro v w
    simp
    rw [(G'.symm v w)]
