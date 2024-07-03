/-
# Tree utilities

This will contain various definitions and lemmas related to tree that are not present in Mathlib that we
will need.
-/

import Mathlib.Combinatorics.SimpleGraph.Basic
import Mathlib.Combinatorics.SimpleGraph.Acyclic
import Mathlib.Data.Set.Card


/-
# Leaf nodes

For a simple graph with vertex type `V`, which is a also a tree, a leaf vertex is a vertex which has only one neighbour.
TODO: Look at how the edge set of a graph is defined for some ideas.
-/

variable {V : Type*}

structure Leaf {G : SimpleGraph V} (G_is_tree : G.IsTree) where
  -- A vertex of G
  v : V
  -- A vertex is a leaf if it has exactly one neighbour
  has_one_neighbour : (G.neighborSet v).encard = 1

-- Return the set of edges in G that are not in G'.
def complementaryEdgeSet (G : SimpleGraph V) (G' : G.Subgraph) : Set (Sym2 V) :=
  G.edgeSet \ G'.edgeSet
