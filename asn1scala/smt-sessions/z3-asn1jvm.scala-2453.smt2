; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62216 () Bool)

(assert start!62216)

(declare-fun b!279048 () Bool)

(declare-fun e!198856 () Bool)

(declare-fun e!198855 () Bool)

(assert (=> b!279048 (= e!198856 e!198855)))

(declare-fun res!231713 () Bool)

(assert (=> b!279048 (=> (not res!231713) (not e!198855))))

(declare-datatypes ((tuple4!680 0))(
  ( (tuple4!681 (_1!12415 (_ BitVec 32)) (_2!12415 (_ BitVec 32)) (_3!1120 (_ BitVec 32)) (_4!340 (_ BitVec 32))) )
))
(declare-fun lt!416196 () tuple4!680)

(assert (=> b!279048 (= res!231713 (bvslt (_1!12415 lt!416196) (_2!12415 lt!416196)))))

(declare-fun from!822 () (_ BitVec 64))

(declare-fun to!789 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!680)

(assert (=> b!279048 (= lt!416196 (arrayBitIndices!0 from!822 to!789))))

(declare-fun res!231714 () Bool)

(assert (=> start!62216 (=> (not res!231714) (not e!198856))))

(declare-datatypes ((array!16095 0))(
  ( (array!16096 (arr!7961 (Array (_ BitVec 32) (_ BitVec 8))) (size!6965 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16095)

(declare-fun a2!699 () array!16095)

(assert (=> start!62216 (= res!231714 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6965 a1!699) (size!6965 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6965 a1!699))))))))

(assert (=> start!62216 e!198856))

(assert (=> start!62216 true))

(declare-fun array_inv!6689 (array!16095) Bool)

(assert (=> start!62216 (array_inv!6689 a1!699)))

(assert (=> start!62216 (array_inv!6689 a2!699)))

(declare-fun b!279046 () Bool)

(declare-fun res!231715 () Bool)

(assert (=> b!279046 (=> (not res!231715) (not e!198856))))

(declare-fun arrayBitRangesEq!0 (array!16095 array!16095 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!279046 (= res!231715 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!279047 () Bool)

(declare-fun res!231716 () Bool)

(assert (=> b!279047 (=> (not res!231716) (not e!198856))))

(assert (=> b!279047 (= res!231716 (bvslt from!822 to!789))))

(declare-fun b!279049 () Bool)

(assert (=> b!279049 (= e!198855 (not true))))

(declare-fun arrayRangesEq!1233 (array!16095 array!16095 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!279049 (arrayRangesEq!1233 a1!699 a2!699 (_1!12415 lt!416196) (_2!12415 lt!416196))))

(assert (= (and start!62216 res!231714) b!279046))

(assert (= (and b!279046 res!231715) b!279047))

(assert (= (and b!279047 res!231716) b!279048))

(assert (= (and b!279048 res!231713) b!279049))

(declare-fun m!412115 () Bool)

(assert (=> b!279048 m!412115))

(declare-fun m!412117 () Bool)

(assert (=> start!62216 m!412117))

(declare-fun m!412119 () Bool)

(assert (=> start!62216 m!412119))

(declare-fun m!412121 () Bool)

(assert (=> b!279046 m!412121))

(declare-fun m!412123 () Bool)

(assert (=> b!279049 m!412123))

(check-sat (not b!279046) (not b!279048) (not b!279049) (not start!62216))
