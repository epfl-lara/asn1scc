; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70272 () Bool)

(assert start!70272)

(declare-fun res!261537 () Bool)

(declare-fun e!228641 () Bool)

(assert (=> start!70272 (=> (not res!261537) (not e!228641))))

(declare-datatypes ((array!19770 0))(
  ( (array!19771 (arr!9692 (Array (_ BitVec 32) (_ BitVec 8))) (size!8606 (_ BitVec 32))) )
))
(declare-fun a2!721 () array!19770)

(declare-fun to!813 () (_ BitVec 64))

(declare-fun a1!721 () array!19770)

(declare-fun from!846 () (_ BitVec 64))

(assert (=> start!70272 (= res!261537 (and (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 from!846) (bvsle from!846 to!813) (= (size!8606 a1!721) (size!8606 a2!721))))))

(assert (=> start!70272 e!228641))

(assert (=> start!70272 true))

(declare-fun array_inv!8158 (array!19770) Bool)

(assert (=> start!70272 (array_inv!8158 a1!721)))

(assert (=> start!70272 (array_inv!8158 a2!721)))

(declare-fun b!318457 () Bool)

(declare-fun e!228640 () Bool)

(assert (=> b!318457 (= e!228641 e!228640)))

(declare-fun res!261538 () Bool)

(assert (=> b!318457 (=> (not res!261538) (not e!228640))))

(declare-fun lt!443390 () (_ BitVec 64))

(assert (=> b!318457 (= res!261538 (bvsle to!813 lt!443390))))

(assert (=> b!318457 (= lt!443390 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8606 a1!721))))))

(declare-fun b!318458 () Bool)

(declare-fun res!261539 () Bool)

(assert (=> b!318458 (=> (not res!261539) (not e!228640))))

(declare-fun arrayBitRangesEq!0 (array!19770 array!19770 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!318458 (= res!261539 (arrayBitRangesEq!0 a1!721 a2!721 from!846 to!813))))

(declare-fun b!318459 () Bool)

(assert (=> b!318459 (= e!228640 (bvsge (bvsub from!846 #b0000000000000000000000000000000000000000000000000000000000000001) lt!443390))))

(assert (= (and start!70272 res!261537) b!318457))

(assert (= (and b!318457 res!261538) b!318458))

(assert (= (and b!318458 res!261539) b!318459))

(declare-fun m!456545 () Bool)

(assert (=> start!70272 m!456545))

(declare-fun m!456547 () Bool)

(assert (=> start!70272 m!456547))

(declare-fun m!456549 () Bool)

(assert (=> b!318458 m!456549))

(check-sat (not start!70272) (not b!318458))
(check-sat)
