; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62072 () Bool)

(assert start!62072)

(declare-fun b!278160 () Bool)

(declare-datatypes ((Unit!19459 0))(
  ( (Unit!19460) )
))
(declare-fun e!198038 () Unit!19459)

(declare-fun Unit!19461 () Unit!19459)

(assert (=> b!278160 (= e!198038 Unit!19461)))

(declare-fun b!278161 () Bool)

(declare-fun Unit!19462 () Unit!19459)

(assert (=> b!278161 (= e!198038 Unit!19462)))

(declare-datatypes ((array!15993 0))(
  ( (array!15994 (arr!7913 (Array (_ BitVec 32) (_ BitVec 8))) (size!6917 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!15993)

(declare-fun a2!699 () array!15993)

(declare-datatypes ((tuple4!620 0))(
  ( (tuple4!621 (_1!12385 (_ BitVec 32)) (_2!12385 (_ BitVec 32)) (_3!1090 (_ BitVec 32)) (_4!310 (_ BitVec 32))) )
))
(declare-fun lt!415815 () tuple4!620)

(declare-fun arrayRangesEq!1203 (array!15993 array!15993 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!278161 (arrayRangesEq!1203 a1!699 a2!699 (_1!12385 lt!415815) (_2!12385 lt!415815))))

(declare-fun lt!415818 () Unit!19459)

(declare-fun arrayRangesEqSymmetricLemma!122 (array!15993 array!15993 (_ BitVec 32) (_ BitVec 32)) Unit!19459)

(assert (=> b!278161 (= lt!415818 (arrayRangesEqSymmetricLemma!122 a1!699 a2!699 (_1!12385 lt!415815) (_2!12385 lt!415815)))))

(assert (=> b!278161 (arrayRangesEq!1203 a2!699 a1!699 (_1!12385 lt!415815) (_2!12385 lt!415815))))

(declare-fun b!278162 () Bool)

(declare-fun res!230999 () Bool)

(declare-fun e!198039 () Bool)

(assert (=> b!278162 (=> (not res!230999) (not e!198039))))

(declare-fun from!822 () (_ BitVec 64))

(declare-fun to!789 () (_ BitVec 64))

(assert (=> b!278162 (= res!230999 (bvslt from!822 to!789))))

(declare-fun b!278163 () Bool)

(declare-fun lt!415817 () (_ BitVec 32))

(assert (=> b!278163 (= e!198039 (and (not (= (_3!1090 lt!415815) (_4!310 lt!415815))) (or (bvsgt #b00000000000000000000000000000000 lt!415817) (bvsgt lt!415817 #b00000000000000000000000000001000))))))

(declare-fun lt!415816 () Unit!19459)

(assert (=> b!278163 (= lt!415816 e!198038)))

(declare-fun c!12753 () Bool)

(assert (=> b!278163 (= c!12753 (bvslt (_1!12385 lt!415815) (_2!12385 lt!415815)))))

(assert (=> b!278163 (= lt!415817 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!620)

(assert (=> b!278163 (= lt!415815 (arrayBitIndices!0 from!822 to!789))))

(declare-fun res!230997 () Bool)

(assert (=> start!62072 (=> (not res!230997) (not e!198039))))

(assert (=> start!62072 (= res!230997 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6917 a1!699) (size!6917 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6917 a1!699))))))))

(assert (=> start!62072 e!198039))

(assert (=> start!62072 true))

(declare-fun array_inv!6641 (array!15993) Bool)

(assert (=> start!62072 (array_inv!6641 a1!699)))

(assert (=> start!62072 (array_inv!6641 a2!699)))

(declare-fun b!278164 () Bool)

(declare-fun res!230998 () Bool)

(assert (=> b!278164 (=> (not res!230998) (not e!198039))))

(declare-fun arrayBitRangesEq!0 (array!15993 array!15993 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!278164 (= res!230998 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(assert (= (and start!62072 res!230997) b!278164))

(assert (= (and b!278164 res!230998) b!278162))

(assert (= (and b!278162 res!230999) b!278163))

(assert (= (and b!278163 c!12753) b!278161))

(assert (= (and b!278163 (not c!12753)) b!278160))

(declare-fun m!411273 () Bool)

(assert (=> b!278161 m!411273))

(declare-fun m!411275 () Bool)

(assert (=> b!278161 m!411275))

(declare-fun m!411277 () Bool)

(assert (=> b!278161 m!411277))

(declare-fun m!411279 () Bool)

(assert (=> b!278163 m!411279))

(declare-fun m!411281 () Bool)

(assert (=> start!62072 m!411281))

(declare-fun m!411283 () Bool)

(assert (=> start!62072 m!411283))

(declare-fun m!411285 () Bool)

(assert (=> b!278164 m!411285))

(check-sat (not b!278161) (not start!62072) (not b!278163) (not b!278164))
(check-sat)
