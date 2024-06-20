; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70284 () Bool)

(assert start!70284)

(declare-fun res!261584 () Bool)

(declare-fun e!228700 () Bool)

(assert (=> start!70284 (=> (not res!261584) (not e!228700))))

(declare-datatypes ((array!19782 0))(
  ( (array!19783 (arr!9698 (Array (_ BitVec 32) (_ BitVec 8))) (size!8612 (_ BitVec 32))) )
))
(declare-fun a2!721 () array!19782)

(declare-fun a1!721 () array!19782)

(declare-fun from!846 () (_ BitVec 64))

(declare-fun to!813 () (_ BitVec 64))

(assert (=> start!70284 (= res!261584 (and (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 from!846) (bvsle from!846 to!813) (= (size!8612 a1!721) (size!8612 a2!721)) (bvsle to!813 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8612 a1!721))))))))

(assert (=> start!70284 e!228700))

(assert (=> start!70284 true))

(declare-fun array_inv!8164 (array!19782) Bool)

(assert (=> start!70284 (array_inv!8164 a1!721)))

(assert (=> start!70284 (array_inv!8164 a2!721)))

(declare-fun b!318502 () Bool)

(declare-fun res!261583 () Bool)

(assert (=> b!318502 (=> (not res!261583) (not e!228700))))

(declare-fun arrayBitRangesEq!0 (array!19782 array!19782 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!318502 (= res!261583 (arrayBitRangesEq!0 a1!721 a2!721 from!846 to!813))))

(declare-fun b!318503 () Bool)

(declare-fun res!261582 () Bool)

(assert (=> b!318503 (=> (not res!261582) (not e!228700))))

(declare-fun bitAt!0 (array!19782 (_ BitVec 64)) Bool)

(assert (=> b!318503 (= res!261582 (= (bitAt!0 a1!721 (bvsub from!846 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitAt!0 a2!721 (bvsub from!846 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!318504 () Bool)

(assert (=> b!318504 (= e!228700 (bvsgt (bvsub from!846 #b0000000000000000000000000000000000000000000000000000000000000001) to!813))))

(assert (= (and start!70284 res!261584) b!318502))

(assert (= (and b!318502 res!261583) b!318503))

(assert (= (and b!318503 res!261582) b!318504))

(declare-fun m!456585 () Bool)

(assert (=> start!70284 m!456585))

(declare-fun m!456587 () Bool)

(assert (=> start!70284 m!456587))

(declare-fun m!456589 () Bool)

(assert (=> b!318502 m!456589))

(declare-fun m!456591 () Bool)

(assert (=> b!318503 m!456591))

(declare-fun m!456593 () Bool)

(assert (=> b!318503 m!456593))

(check-sat (not start!70284) (not b!318503) (not b!318502))
(check-sat)
