; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40420 () Bool)

(assert start!40420)

(declare-fun b!185572 () Bool)

(declare-fun e!128466 () Bool)

(declare-datatypes ((array!9807 0))(
  ( (array!9808 (arr!5255 (Array (_ BitVec 32) (_ BitVec 8))) (size!4325 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7758 0))(
  ( (BitStream!7759 (buf!4785 array!9807) (currentByte!9029 (_ BitVec 32)) (currentBit!9024 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7758)

(declare-fun array_inv!4066 (array!9807) Bool)

(assert (=> b!185572 (= e!128466 (array_inv!4066 (buf!4785 thiss!1204)))))

(declare-fun b!185573 () Bool)

(declare-fun res!154465 () Bool)

(declare-fun e!128470 () Bool)

(assert (=> b!185573 (=> res!154465 e!128470)))

(declare-datatypes ((Unit!13280 0))(
  ( (Unit!13281) )
))
(declare-datatypes ((tuple2!16056 0))(
  ( (tuple2!16057 (_1!8673 Unit!13280) (_2!8673 BitStream!7758)) )
))
(declare-fun lt!286219 () tuple2!16056)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!185573 (= res!154465 (not (invariant!0 (currentBit!9024 (_2!8673 lt!286219)) (currentByte!9029 (_2!8673 lt!286219)) (size!4325 (buf!4785 (_2!8673 lt!286219))))))))

(declare-fun b!185574 () Bool)

(declare-fun e!128468 () Bool)

(declare-fun e!128476 () Bool)

(assert (=> b!185574 (= e!128468 e!128476)))

(declare-fun res!154452 () Bool)

(assert (=> b!185574 (=> (not res!154452) (not e!128476))))

(declare-fun lt!286216 () Bool)

(declare-datatypes ((tuple2!16058 0))(
  ( (tuple2!16059 (_1!8674 BitStream!7758) (_2!8674 Bool)) )
))
(declare-fun lt!286212 () tuple2!16058)

(declare-fun lt!286210 () tuple2!16056)

(assert (=> b!185574 (= res!154452 (and (= (_2!8674 lt!286212) lt!286216) (= (_1!8674 lt!286212) (_2!8673 lt!286210))))))

(declare-fun readBitPure!0 (BitStream!7758) tuple2!16058)

(declare-fun readerFrom!0 (BitStream!7758 (_ BitVec 32) (_ BitVec 32)) BitStream!7758)

(assert (=> b!185574 (= lt!286212 (readBitPure!0 (readerFrom!0 (_2!8673 lt!286210) (currentBit!9024 thiss!1204) (currentByte!9029 thiss!1204))))))

(declare-fun b!185575 () Bool)

(declare-fun e!128474 () Bool)

(assert (=> b!185575 (= e!128474 e!128468)))

(declare-fun res!154460 () Bool)

(assert (=> b!185575 (=> (not res!154460) (not e!128468))))

(declare-fun lt!286221 () (_ BitVec 64))

(declare-fun lt!286202 () (_ BitVec 64))

(assert (=> b!185575 (= res!154460 (= lt!286221 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!286202)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!185575 (= lt!286221 (bitIndex!0 (size!4325 (buf!4785 (_2!8673 lt!286210))) (currentByte!9029 (_2!8673 lt!286210)) (currentBit!9024 (_2!8673 lt!286210))))))

(assert (=> b!185575 (= lt!286202 (bitIndex!0 (size!4325 (buf!4785 thiss!1204)) (currentByte!9029 thiss!1204) (currentBit!9024 thiss!1204)))))

(declare-datatypes ((tuple2!16060 0))(
  ( (tuple2!16061 (_1!8675 BitStream!7758) (_2!8675 BitStream!7758)) )
))
(declare-fun lt!286214 () tuple2!16060)

(declare-fun lt!286209 () (_ BitVec 64))

(declare-fun e!128465 () Bool)

(declare-fun lt!286220 () (_ BitVec 64))

(declare-fun b!185576 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!7758 (_ BitVec 64)) BitStream!7758)

(assert (=> b!185576 (= e!128465 (= (_1!8675 lt!286214) (withMovedBitIndex!0 (_2!8675 lt!286214) (bvsub lt!286209 lt!286220))))))

(declare-fun res!154458 () Bool)

(declare-fun e!128471 () Bool)

(assert (=> start!40420 (=> (not res!154458) (not e!128471))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!40420 (= res!154458 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!40420 e!128471))

(assert (=> start!40420 true))

(declare-fun inv!12 (BitStream!7758) Bool)

(assert (=> start!40420 (and (inv!12 thiss!1204) e!128466)))

(declare-fun b!185577 () Bool)

(declare-fun res!154461 () Bool)

(assert (=> b!185577 (=> res!154461 e!128470)))

(declare-fun isPrefixOf!0 (BitStream!7758 BitStream!7758) Bool)

(assert (=> b!185577 (= res!154461 (not (isPrefixOf!0 thiss!1204 (_2!8673 lt!286210))))))

(declare-fun b!185578 () Bool)

(assert (=> b!185578 (= e!128476 (= (bitIndex!0 (size!4325 (buf!4785 (_1!8674 lt!286212))) (currentByte!9029 (_1!8674 lt!286212)) (currentBit!9024 (_1!8674 lt!286212))) lt!286221))))

(declare-fun b!185579 () Bool)

(declare-fun res!154451 () Bool)

(assert (=> b!185579 (=> res!154451 e!128470)))

(assert (=> b!185579 (= res!154451 (not (isPrefixOf!0 (_2!8673 lt!286210) (_2!8673 lt!286219))))))

(declare-fun b!185580 () Bool)

(declare-fun e!128464 () Bool)

(assert (=> b!185580 (= e!128464 e!128470)))

(declare-fun res!154454 () Bool)

(assert (=> b!185580 (=> res!154454 e!128470)))

(declare-fun lt!286199 () (_ BitVec 64))

(assert (=> b!185580 (= res!154454 (not (= lt!286220 (bvsub (bvsub (bvadd lt!286199 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!185580 (= lt!286220 (bitIndex!0 (size!4325 (buf!4785 (_2!8673 lt!286219))) (currentByte!9029 (_2!8673 lt!286219)) (currentBit!9024 (_2!8673 lt!286219))))))

(assert (=> b!185580 (isPrefixOf!0 thiss!1204 (_2!8673 lt!286219))))

(declare-fun lt!286205 () Unit!13280)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7758 BitStream!7758 BitStream!7758) Unit!13280)

(assert (=> b!185580 (= lt!286205 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8673 lt!286210) (_2!8673 lt!286219)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7758 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!16056)

(assert (=> b!185580 (= lt!286219 (appendBitsLSBFirstLoopTR!0 (_2!8673 lt!286210) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!185581 () Bool)

(declare-fun res!154464 () Bool)

(declare-fun e!128473 () Bool)

(assert (=> b!185581 (=> (not res!154464) (not e!128473))))

(assert (=> b!185581 (= res!154464 (not (= i!590 nBits!348)))))

(declare-fun b!185582 () Bool)

(declare-fun res!154462 () Bool)

(assert (=> b!185582 (=> (not res!154462) (not e!128468))))

(assert (=> b!185582 (= res!154462 (isPrefixOf!0 thiss!1204 (_2!8673 lt!286210)))))

(declare-fun b!185583 () Bool)

(declare-fun e!128467 () Bool)

(assert (=> b!185583 (= e!128467 (invariant!0 (currentBit!9024 thiss!1204) (currentByte!9029 thiss!1204) (size!4325 (buf!4785 (_2!8673 lt!286219)))))))

(declare-fun b!185584 () Bool)

(declare-fun res!154467 () Bool)

(assert (=> b!185584 (=> res!154467 e!128470)))

(assert (=> b!185584 (= res!154467 (or (not (= (size!4325 (buf!4785 (_2!8673 lt!286219))) (size!4325 (buf!4785 thiss!1204)))) (not (= lt!286220 (bvsub (bvadd lt!286209 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!185585 () Bool)

(assert (=> b!185585 (= e!128471 e!128473)))

(declare-fun res!154453 () Bool)

(assert (=> b!185585 (=> (not res!154453) (not e!128473))))

(declare-fun lt!286204 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!185585 (= res!154453 (validate_offset_bits!1 ((_ sign_extend 32) (size!4325 (buf!4785 thiss!1204))) ((_ sign_extend 32) (currentByte!9029 thiss!1204)) ((_ sign_extend 32) (currentBit!9024 thiss!1204)) lt!286204))))

(assert (=> b!185585 (= lt!286204 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!185586 () Bool)

(declare-fun e!128472 () Bool)

(declare-fun lt!286224 () tuple2!16058)

(declare-fun lt!286208 () tuple2!16058)

(assert (=> b!185586 (= e!128472 (= (_2!8674 lt!286224) (_2!8674 lt!286208)))))

(declare-fun b!185587 () Bool)

(assert (=> b!185587 (= e!128473 (not e!128464))))

(declare-fun res!154457 () Bool)

(assert (=> b!185587 (=> res!154457 e!128464)))

(assert (=> b!185587 (= res!154457 (not (= lt!286199 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!286209))))))

(assert (=> b!185587 (= lt!286199 (bitIndex!0 (size!4325 (buf!4785 (_2!8673 lt!286210))) (currentByte!9029 (_2!8673 lt!286210)) (currentBit!9024 (_2!8673 lt!286210))))))

(assert (=> b!185587 (= lt!286209 (bitIndex!0 (size!4325 (buf!4785 thiss!1204)) (currentByte!9029 thiss!1204) (currentBit!9024 thiss!1204)))))

(assert (=> b!185587 e!128474))

(declare-fun res!154450 () Bool)

(assert (=> b!185587 (=> (not res!154450) (not e!128474))))

(assert (=> b!185587 (= res!154450 (= (size!4325 (buf!4785 thiss!1204)) (size!4325 (buf!4785 (_2!8673 lt!286210)))))))

(declare-fun appendBit!0 (BitStream!7758 Bool) tuple2!16056)

(assert (=> b!185587 (= lt!286210 (appendBit!0 thiss!1204 lt!286216))))

(declare-fun lt!286223 () (_ BitVec 64))

(assert (=> b!185587 (= lt!286216 (not (= (bvand v!189 lt!286223) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!185587 (= lt!286223 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!185588 () Bool)

(declare-fun e!128469 () Bool)

(assert (=> b!185588 (= e!128470 e!128469)))

(declare-fun res!154455 () Bool)

(assert (=> b!185588 (=> res!154455 e!128469)))

(declare-fun lt!286211 () tuple2!16060)

(declare-fun lt!286207 () (_ BitVec 64))

(declare-datatypes ((tuple2!16062 0))(
  ( (tuple2!16063 (_1!8676 BitStream!7758) (_2!8676 (_ BitVec 64))) )
))
(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7758 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16062)

(assert (=> b!185588 (= res!154455 (not (= (_1!8676 (readNBitsLSBFirstsLoopPure!0 (_1!8675 lt!286211) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!286207)) (_2!8675 lt!286211))))))

(declare-fun lt!286215 () (_ BitVec 64))

(assert (=> b!185588 (validate_offset_bits!1 ((_ sign_extend 32) (size!4325 (buf!4785 (_2!8673 lt!286219)))) ((_ sign_extend 32) (currentByte!9029 (_2!8673 lt!286210))) ((_ sign_extend 32) (currentBit!9024 (_2!8673 lt!286210))) lt!286215)))

(declare-fun lt!286222 () Unit!13280)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7758 array!9807 (_ BitVec 64)) Unit!13280)

(assert (=> b!185588 (= lt!286222 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8673 lt!286210) (buf!4785 (_2!8673 lt!286219)) lt!286215))))

(assert (=> b!185588 (= lt!286215 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!286218 () tuple2!16058)

(declare-fun lt!286201 () (_ BitVec 64))

(assert (=> b!185588 (= lt!286207 (bvor lt!286201 (ite (_2!8674 lt!286218) lt!286223 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!286225 () tuple2!16062)

(assert (=> b!185588 (= lt!286225 (readNBitsLSBFirstsLoopPure!0 (_1!8675 lt!286214) nBits!348 i!590 lt!286201))))

(assert (=> b!185588 (validate_offset_bits!1 ((_ sign_extend 32) (size!4325 (buf!4785 (_2!8673 lt!286219)))) ((_ sign_extend 32) (currentByte!9029 thiss!1204)) ((_ sign_extend 32) (currentBit!9024 thiss!1204)) lt!286204)))

(declare-fun lt!286206 () Unit!13280)

(assert (=> b!185588 (= lt!286206 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4785 (_2!8673 lt!286219)) lt!286204))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!185588 (= lt!286201 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!185588 (= (_2!8674 lt!286218) lt!286216)))

(assert (=> b!185588 (= lt!286218 (readBitPure!0 (_1!8675 lt!286214)))))

(declare-fun reader!0 (BitStream!7758 BitStream!7758) tuple2!16060)

(assert (=> b!185588 (= lt!286211 (reader!0 (_2!8673 lt!286210) (_2!8673 lt!286219)))))

(assert (=> b!185588 (= lt!286214 (reader!0 thiss!1204 (_2!8673 lt!286219)))))

(assert (=> b!185588 e!128472))

(declare-fun res!154463 () Bool)

(assert (=> b!185588 (=> (not res!154463) (not e!128472))))

(assert (=> b!185588 (= res!154463 (= (bitIndex!0 (size!4325 (buf!4785 (_1!8674 lt!286224))) (currentByte!9029 (_1!8674 lt!286224)) (currentBit!9024 (_1!8674 lt!286224))) (bitIndex!0 (size!4325 (buf!4785 (_1!8674 lt!286208))) (currentByte!9029 (_1!8674 lt!286208)) (currentBit!9024 (_1!8674 lt!286208)))))))

(declare-fun lt!286203 () Unit!13280)

(declare-fun lt!286217 () BitStream!7758)

(declare-fun readBitPrefixLemma!0 (BitStream!7758 BitStream!7758) Unit!13280)

(assert (=> b!185588 (= lt!286203 (readBitPrefixLemma!0 lt!286217 (_2!8673 lt!286219)))))

(assert (=> b!185588 (= lt!286208 (readBitPure!0 (BitStream!7759 (buf!4785 (_2!8673 lt!286219)) (currentByte!9029 thiss!1204) (currentBit!9024 thiss!1204))))))

(assert (=> b!185588 (= lt!286224 (readBitPure!0 lt!286217))))

(assert (=> b!185588 e!128467))

(declare-fun res!154459 () Bool)

(assert (=> b!185588 (=> (not res!154459) (not e!128467))))

(assert (=> b!185588 (= res!154459 (invariant!0 (currentBit!9024 thiss!1204) (currentByte!9029 thiss!1204) (size!4325 (buf!4785 (_2!8673 lt!286210)))))))

(assert (=> b!185588 (= lt!286217 (BitStream!7759 (buf!4785 (_2!8673 lt!286210)) (currentByte!9029 thiss!1204) (currentBit!9024 thiss!1204)))))

(declare-fun b!185589 () Bool)

(assert (=> b!185589 (= e!128469 true)))

(assert (=> b!185589 e!128465))

(declare-fun res!154466 () Bool)

(assert (=> b!185589 (=> (not res!154466) (not e!128465))))

(declare-fun lt!286213 () tuple2!16062)

(assert (=> b!185589 (= res!154466 (and (= (_2!8676 lt!286225) (_2!8676 lt!286213)) (= (_1!8676 lt!286225) (_1!8676 lt!286213))))))

(declare-fun lt!286200 () Unit!13280)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7758 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13280)

(assert (=> b!185589 (= lt!286200 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8675 lt!286214) nBits!348 i!590 lt!286201))))

(assert (=> b!185589 (= lt!286213 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8675 lt!286214) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!286207))))

(declare-fun b!185590 () Bool)

(declare-fun res!154456 () Bool)

(assert (=> b!185590 (=> (not res!154456) (not e!128473))))

(assert (=> b!185590 (= res!154456 (invariant!0 (currentBit!9024 thiss!1204) (currentByte!9029 thiss!1204) (size!4325 (buf!4785 thiss!1204))))))

(assert (= (and start!40420 res!154458) b!185585))

(assert (= (and b!185585 res!154453) b!185590))

(assert (= (and b!185590 res!154456) b!185581))

(assert (= (and b!185581 res!154464) b!185587))

(assert (= (and b!185587 res!154450) b!185575))

(assert (= (and b!185575 res!154460) b!185582))

(assert (= (and b!185582 res!154462) b!185574))

(assert (= (and b!185574 res!154452) b!185578))

(assert (= (and b!185587 (not res!154457)) b!185580))

(assert (= (and b!185580 (not res!154454)) b!185573))

(assert (= (and b!185573 (not res!154465)) b!185584))

(assert (= (and b!185584 (not res!154467)) b!185579))

(assert (= (and b!185579 (not res!154451)) b!185577))

(assert (= (and b!185577 (not res!154461)) b!185588))

(assert (= (and b!185588 res!154459) b!185583))

(assert (= (and b!185588 res!154463) b!185586))

(assert (= (and b!185588 (not res!154455)) b!185589))

(assert (= (and b!185589 res!154466) b!185576))

(assert (= start!40420 b!185572))

(declare-fun m!288455 () Bool)

(assert (=> b!185588 m!288455))

(declare-fun m!288457 () Bool)

(assert (=> b!185588 m!288457))

(declare-fun m!288459 () Bool)

(assert (=> b!185588 m!288459))

(declare-fun m!288461 () Bool)

(assert (=> b!185588 m!288461))

(declare-fun m!288463 () Bool)

(assert (=> b!185588 m!288463))

(declare-fun m!288465 () Bool)

(assert (=> b!185588 m!288465))

(declare-fun m!288467 () Bool)

(assert (=> b!185588 m!288467))

(declare-fun m!288469 () Bool)

(assert (=> b!185588 m!288469))

(declare-fun m!288471 () Bool)

(assert (=> b!185588 m!288471))

(declare-fun m!288473 () Bool)

(assert (=> b!185588 m!288473))

(declare-fun m!288475 () Bool)

(assert (=> b!185588 m!288475))

(declare-fun m!288477 () Bool)

(assert (=> b!185588 m!288477))

(declare-fun m!288479 () Bool)

(assert (=> b!185588 m!288479))

(declare-fun m!288481 () Bool)

(assert (=> b!185588 m!288481))

(declare-fun m!288483 () Bool)

(assert (=> b!185588 m!288483))

(declare-fun m!288485 () Bool)

(assert (=> b!185588 m!288485))

(declare-fun m!288487 () Bool)

(assert (=> b!185583 m!288487))

(declare-fun m!288489 () Bool)

(assert (=> b!185585 m!288489))

(declare-fun m!288491 () Bool)

(assert (=> b!185577 m!288491))

(declare-fun m!288493 () Bool)

(assert (=> b!185574 m!288493))

(assert (=> b!185574 m!288493))

(declare-fun m!288495 () Bool)

(assert (=> b!185574 m!288495))

(declare-fun m!288497 () Bool)

(assert (=> start!40420 m!288497))

(declare-fun m!288499 () Bool)

(assert (=> b!185578 m!288499))

(declare-fun m!288501 () Bool)

(assert (=> b!185573 m!288501))

(declare-fun m!288503 () Bool)

(assert (=> b!185589 m!288503))

(declare-fun m!288505 () Bool)

(assert (=> b!185589 m!288505))

(assert (=> b!185589 m!288505))

(declare-fun m!288507 () Bool)

(assert (=> b!185589 m!288507))

(declare-fun m!288509 () Bool)

(assert (=> b!185587 m!288509))

(declare-fun m!288511 () Bool)

(assert (=> b!185587 m!288511))

(declare-fun m!288513 () Bool)

(assert (=> b!185587 m!288513))

(assert (=> b!185582 m!288491))

(assert (=> b!185575 m!288509))

(assert (=> b!185575 m!288511))

(declare-fun m!288515 () Bool)

(assert (=> b!185576 m!288515))

(declare-fun m!288517 () Bool)

(assert (=> b!185590 m!288517))

(declare-fun m!288519 () Bool)

(assert (=> b!185572 m!288519))

(declare-fun m!288521 () Bool)

(assert (=> b!185580 m!288521))

(declare-fun m!288523 () Bool)

(assert (=> b!185580 m!288523))

(declare-fun m!288525 () Bool)

(assert (=> b!185580 m!288525))

(declare-fun m!288527 () Bool)

(assert (=> b!185580 m!288527))

(declare-fun m!288529 () Bool)

(assert (=> b!185579 m!288529))

(check-sat (not b!185582) (not b!185574) (not b!185577) (not b!185575) (not b!185578) (not b!185587) (not b!185583) (not b!185588) (not b!185579) (not start!40420) (not b!185580) (not b!185573) (not b!185590) (not b!185585) (not b!185576) (not b!185589) (not b!185572))
