; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62074 () Bool)

(assert start!62074)

(declare-fun b!278175 () Bool)

(declare-fun res!231008 () Bool)

(declare-fun e!198049 () Bool)

(assert (=> b!278175 (=> (not res!231008) (not e!198049))))

(declare-fun from!822 () (_ BitVec 64))

(declare-datatypes ((array!15995 0))(
  ( (array!15996 (arr!7914 (Array (_ BitVec 32) (_ BitVec 8))) (size!6918 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!15995)

(declare-fun a2!699 () array!15995)

(declare-fun to!789 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!15995 array!15995 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!278175 (= res!231008 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun res!231007 () Bool)

(assert (=> start!62074 (=> (not res!231007) (not e!198049))))

(assert (=> start!62074 (= res!231007 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6918 a1!699) (size!6918 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6918 a1!699))))))))

(assert (=> start!62074 e!198049))

(assert (=> start!62074 true))

(declare-fun array_inv!6642 (array!15995) Bool)

(assert (=> start!62074 (array_inv!6642 a1!699)))

(assert (=> start!62074 (array_inv!6642 a2!699)))

(declare-fun b!278176 () Bool)

(declare-datatypes ((tuple4!622 0))(
  ( (tuple4!623 (_1!12386 (_ BitVec 32)) (_2!12386 (_ BitVec 32)) (_3!1091 (_ BitVec 32)) (_4!311 (_ BitVec 32))) )
))
(declare-fun lt!415827 () tuple4!622)

(declare-fun lt!415829 () (_ BitVec 32))

(assert (=> b!278176 (= e!198049 (and (not (= (_3!1091 lt!415827) (_4!311 lt!415827))) (or (bvsgt #b00000000000000000000000000000000 lt!415829) (bvsgt lt!415829 #b00000000000000000000000000001000))))))

(declare-datatypes ((Unit!19463 0))(
  ( (Unit!19464) )
))
(declare-fun lt!415828 () Unit!19463)

(declare-fun e!198051 () Unit!19463)

(assert (=> b!278176 (= lt!415828 e!198051)))

(declare-fun c!12756 () Bool)

(assert (=> b!278176 (= c!12756 (bvslt (_1!12386 lt!415827) (_2!12386 lt!415827)))))

(assert (=> b!278176 (= lt!415829 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!622)

(assert (=> b!278176 (= lt!415827 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!278177 () Bool)

(declare-fun res!231006 () Bool)

(assert (=> b!278177 (=> (not res!231006) (not e!198049))))

(assert (=> b!278177 (= res!231006 (bvslt from!822 to!789))))

(declare-fun b!278178 () Bool)

(declare-fun Unit!19465 () Unit!19463)

(assert (=> b!278178 (= e!198051 Unit!19465)))

(declare-fun b!278179 () Bool)

(declare-fun Unit!19466 () Unit!19463)

(assert (=> b!278179 (= e!198051 Unit!19466)))

(declare-fun arrayRangesEq!1204 (array!15995 array!15995 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!278179 (arrayRangesEq!1204 a1!699 a2!699 (_1!12386 lt!415827) (_2!12386 lt!415827))))

(declare-fun lt!415830 () Unit!19463)

(declare-fun arrayRangesEqSymmetricLemma!123 (array!15995 array!15995 (_ BitVec 32) (_ BitVec 32)) Unit!19463)

(assert (=> b!278179 (= lt!415830 (arrayRangesEqSymmetricLemma!123 a1!699 a2!699 (_1!12386 lt!415827) (_2!12386 lt!415827)))))

(assert (=> b!278179 (arrayRangesEq!1204 a2!699 a1!699 (_1!12386 lt!415827) (_2!12386 lt!415827))))

(assert (= (and start!62074 res!231007) b!278175))

(assert (= (and b!278175 res!231008) b!278177))

(assert (= (and b!278177 res!231006) b!278176))

(assert (= (and b!278176 c!12756) b!278179))

(assert (= (and b!278176 (not c!12756)) b!278178))

(declare-fun m!411287 () Bool)

(assert (=> b!278175 m!411287))

(declare-fun m!411289 () Bool)

(assert (=> start!62074 m!411289))

(declare-fun m!411291 () Bool)

(assert (=> start!62074 m!411291))

(declare-fun m!411293 () Bool)

(assert (=> b!278176 m!411293))

(declare-fun m!411295 () Bool)

(assert (=> b!278179 m!411295))

(declare-fun m!411297 () Bool)

(assert (=> b!278179 m!411297))

(declare-fun m!411299 () Bool)

(assert (=> b!278179 m!411299))

(push 1)

(assert (not b!278176))

(assert (not start!62074))

(assert (not b!278179))

(assert (not b!278175))

(check-sat)

(pop 1)

(push 1)

(check-sat)

