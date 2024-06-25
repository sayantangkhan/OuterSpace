/-
# Marked Graphs

This file defines the notion of a marked graph, which is a finite graph,
along with the choice of a spanning tree, and orientations on the labeled complementary
edges.

This gives a map betweeen a marked graph, and a presentation of its fundamental group.
-/

import Mathlib.Combinatorics.SimpleGraph.Basic
import Mathlib.Data.Fintype.Basic

-- V will denote the finite vertex sets/types of our graphs
variable {V : Type*} [Fintype V]

/-
The data of a `MarkedGraph` is given as a bundle of a SimpleGraph,
along with a spanning tree, and a labeling and orientation on the complementary edges.
The labeling will be a pair of maps `⟨source, dest⟩ ` on the complementary edges to the leaf
vertices, such that for all the complementary edges `e`, `Adj (source e) (dest e)` is true.
-/

structure MarkedGraph where
  Underlying : SimpleGraph V
