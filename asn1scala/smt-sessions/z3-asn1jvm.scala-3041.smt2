; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70584 () Bool)

(assert start!70584)

(declare-fun res!262597 () Bool)

(declare-fun e!229756 () Bool)

(assert (=> start!70584 (=> (not res!262597) (not e!229756))))

(declare-datatypes ((array!19989 0))(
  ( (array!19990 (arr!9803 (Array (_ BitVec 32) (_ BitVec 8))) (size!8711 (_ BitVec 32))) )
))
(declare-fun a2!726 () array!19989)

(declare-fun to!814 () (_ BitVec 64))

(declare-fun a1!726 () array!19989)

(declare-fun from!847 () (_ BitVec 64))

(assert (=> start!70584 (= res!262597 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!847) (bvslt from!847 to!814) (= (size!8711 a1!726) (size!8711 a2!726)) (bvsle to!814 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8711 a1!726))))))))

(assert (=> start!70584 e!229756))

(assert (=> start!70584 true))

(declare-fun array_inv!8263 (array!19989) Bool)

(assert (=> start!70584 (array_inv!8263 a1!726)))

(assert (=> start!70584 (array_inv!8263 a2!726)))

(declare-fun b!319594 () Bool)

(declare-fun res!262596 () Bool)

(assert (=> b!319594 (=> (not res!262596) (not e!229756))))

(declare-fun arrayBitRangesEq!0 (array!19989 array!19989 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!319594 (= res!262596 (arrayBitRangesEq!0 a1!726 a2!726 from!847 to!814))))

(declare-fun b!319595 () Bool)

(assert (=> b!319595 (= e!229756 (and (= (bvand from!847 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand from!847 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!847) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and start!70584 res!262597) b!319594))

(assert (= (and b!319594 res!262596) b!319595))

(declare-fun m!457997 () Bool)

(assert (=> start!70584 m!457997))

(declare-fun m!457999 () Bool)

(assert (=> start!70584 m!457999))

(declare-fun m!458001 () Bool)

(assert (=> b!319594 m!458001))

(check-sat (not start!70584) (not b!319594))
(check-sat)
