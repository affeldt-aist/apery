From mathcomp Require Import all_ssreflect ssralg ssrnum ssrint rat.
Require Import tactics binomialz seq_defs.

Set Implicit Arguments.
Unset Strict Implicit.
Unset Printing Implicit Defensive.

Import Order.TTheory GRing.Theory Num.Theory.

Local Open Scope ring_scope.

(**** Properties of the sequence c ****)

Fact lt_0_c (i j : int) : 0 <= j <= i -> 0 < c i j.
Proof.
case/andP=> h0j hji; rewrite /c -expfzMl.
by apply/exprz_gt0/mulr_gt0; rewrite ltr0z binz_gt0; lia.
Qed.

(* c is monotonic wrt its first argument *)
Fact c_incr (n m i : int) : 0 <= n -> 0 <= i -> i <= n -> n <= m ->
                            c n i <= c m i.
Proof.
case: n m i => [] // n [] // m [] // i _ _ lein lenm; rewrite /c.
rewrite -!PoszD !binz_nat_nat -!expfzMl -!rmorphM /= !exprz_pintl // ler_nat.
by apply: leq_mul; apply: leq_mul; apply: leq_bin2l; lia.
Qed.
