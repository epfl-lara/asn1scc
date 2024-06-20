; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70572 () Bool)

(assert start!70572)

(declare-fun res!262579 () Bool)

(declare-fun e!229711 () Bool)

(assert (=> start!70572 (=> (not res!262579) (not e!229711))))

(declare-datatypes ((array!19977 0))(
  ( (array!19978 (arr!9797 (Array (_ BitVec 32) (_ BitVec 8))) (size!8705 (_ BitVec 32))) )
))
(declare-fun a2!726 () array!19977)

(declare-fun to!814 () (_ BitVec 64))

(declare-fun a1!726 () array!19977)

(declare-fun from!847 () (_ BitVec 64))

(assert (=> start!70572 (= res!262579 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!847) (bvslt from!847 to!814) (= (size!8705 a1!726) (size!8705 a2!726)) (bvsle to!814 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8705 a1!726))))))))

(assert (=> start!70572 e!229711))

(assert (=> start!70572 true))

(declare-fun array_inv!8257 (array!19977) Bool)

(assert (=> start!70572 (array_inv!8257 a1!726)))

(assert (=> start!70572 (array_inv!8257 a2!726)))

(declare-fun b!319576 () Bool)

(declare-fun res!262578 () Bool)

(assert (=> b!319576 (=> (not res!262578) (not e!229711))))

(declare-fun arrayBitRangesEq!0 (array!19977 array!19977 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!319576 (= res!262578 (arrayBitRangesEq!0 a1!726 a2!726 from!847 to!814))))

(declare-fun b!319577 () Bool)

(assert (=> b!319577 (= e!229711 (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!847)))))

(assert (= (and start!70572 res!262579) b!319576))

(assert (= (and b!319576 res!262578) b!319577))

(declare-fun m!457967 () Bool)

(assert (=> start!70572 m!457967))

(declare-fun m!457969 () Bool)

(assert (=> start!70572 m!457969))

(declare-fun m!457971 () Bool)

(assert (=> b!319576 m!457971))

(check-sat (not start!70572) (not b!319576))
(check-sat)
