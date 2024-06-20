; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61836 () Bool)

(assert start!61836)

(declare-fun res!230187 () Bool)

(declare-fun e!197129 () Bool)

(assert (=> start!61836 (=> (not res!230187) (not e!197129))))

(declare-fun from!822 () (_ BitVec 64))

(declare-datatypes ((array!15897 0))(
  ( (array!15898 (arr!7874 (Array (_ BitVec 32) (_ BitVec 8))) (size!6878 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!15897)

(declare-fun a2!699 () array!15897)

(declare-fun to!789 () (_ BitVec 64))

(assert (=> start!61836 (= res!230187 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6878 a1!699) (size!6878 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6878 a1!699))))))))

(assert (=> start!61836 e!197129))

(assert (=> start!61836 true))

(declare-fun array_inv!6602 (array!15897) Bool)

(assert (=> start!61836 (array_inv!6602 a1!699)))

(assert (=> start!61836 (array_inv!6602 a2!699)))

(declare-fun b!277160 () Bool)

(declare-fun res!230188 () Bool)

(assert (=> b!277160 (=> (not res!230188) (not e!197129))))

(declare-fun arrayBitRangesEq!0 (array!15897 array!15897 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!277160 (= res!230188 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!277161 () Bool)

(assert (=> b!277161 (= e!197129 (and (bvslt from!822 to!789) (bvsgt to!789 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (= (and start!61836 res!230187) b!277160))

(assert (= (and b!277160 res!230188) b!277161))

(declare-fun m!410375 () Bool)

(assert (=> start!61836 m!410375))

(declare-fun m!410377 () Bool)

(assert (=> start!61836 m!410377))

(declare-fun m!410379 () Bool)

(assert (=> b!277160 m!410379))

(check-sat (not b!277160) (not start!61836))
(check-sat)
