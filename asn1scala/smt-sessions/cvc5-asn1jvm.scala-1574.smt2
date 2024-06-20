; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44682 () Bool)

(assert start!44682)

(declare-fun b!213553 () Bool)

(declare-fun e!145452 () Bool)

(declare-fun e!145460 () Bool)

(assert (=> b!213553 (= e!145452 e!145460)))

(declare-fun res!179478 () Bool)

(assert (=> b!213553 (=> (not res!179478) (not e!145460))))

(declare-datatypes ((array!10550 0))(
  ( (array!10551 (arr!5563 (Array (_ BitVec 32) (_ BitVec 8))) (size!4633 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8374 0))(
  ( (BitStream!8375 (buf!5165 array!10550) (currentByte!9737 (_ BitVec 32)) (currentBit!9732 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8374)

(declare-fun lt!337149 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!213553 (= res!179478 (validate_offset_bits!1 ((_ sign_extend 32) (size!4633 (buf!5165 thiss!1204))) ((_ sign_extend 32) (currentByte!9737 thiss!1204)) ((_ sign_extend 32) (currentBit!9732 thiss!1204)) lt!337149))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!213553 (= lt!337149 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun lt!337160 () (_ BitVec 64))

(declare-fun b!213554 () Bool)

(declare-fun e!145459 () Bool)

(declare-fun lt!337175 () (_ BitVec 64))

(assert (=> b!213554 (= e!145459 (or (= lt!337160 (bvand ((_ sign_extend 32) i!590) #b1000000000000000000000000000000000000000000000000000000000000000)) (= lt!337160 (bvand lt!337175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!337145 () (_ BitVec 64))

(assert (=> b!213554 (= lt!337160 (bvand lt!337145 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!15211 0))(
  ( (Unit!15212) )
))
(declare-datatypes ((tuple2!18278 0))(
  ( (tuple2!18279 (_1!9794 Unit!15211) (_2!9794 BitStream!8374)) )
))
(declare-fun lt!337152 () tuple2!18278)

(assert (=> b!213554 (= (size!4633 (buf!5165 thiss!1204)) (size!4633 (buf!5165 (_2!9794 lt!337152))))))

(declare-fun b!213555 () Bool)

(declare-fun res!179477 () Bool)

(declare-fun e!145453 () Bool)

(assert (=> b!213555 (=> res!179477 e!145453)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!213555 (= res!179477 (not (invariant!0 (currentBit!9732 (_2!9794 lt!337152)) (currentByte!9737 (_2!9794 lt!337152)) (size!4633 (buf!5165 (_2!9794 lt!337152))))))))

(declare-fun b!213556 () Bool)

(declare-fun e!145447 () Bool)

(assert (=> b!213556 (= e!145460 (not e!145447))))

(declare-fun res!179471 () Bool)

(assert (=> b!213556 (=> res!179471 e!145447)))

(declare-fun lt!337163 () (_ BitVec 64))

(declare-fun lt!337162 () (_ BitVec 64))

(assert (=> b!213556 (= res!179471 (not (= lt!337163 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!337162))))))

(declare-fun lt!337166 () tuple2!18278)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!213556 (= lt!337163 (bitIndex!0 (size!4633 (buf!5165 (_2!9794 lt!337166))) (currentByte!9737 (_2!9794 lt!337166)) (currentBit!9732 (_2!9794 lt!337166))))))

(assert (=> b!213556 (= lt!337162 (bitIndex!0 (size!4633 (buf!5165 thiss!1204)) (currentByte!9737 thiss!1204) (currentBit!9732 thiss!1204)))))

(declare-fun e!145451 () Bool)

(assert (=> b!213556 e!145451))

(declare-fun res!179491 () Bool)

(assert (=> b!213556 (=> (not res!179491) (not e!145451))))

(assert (=> b!213556 (= res!179491 (= (size!4633 (buf!5165 thiss!1204)) (size!4633 (buf!5165 (_2!9794 lt!337166)))))))

(declare-fun lt!337157 () Bool)

(declare-fun appendBit!0 (BitStream!8374 Bool) tuple2!18278)

(assert (=> b!213556 (= lt!337166 (appendBit!0 thiss!1204 lt!337157))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun lt!337161 () (_ BitVec 64))

(assert (=> b!213556 (= lt!337157 (not (= (bvand v!189 lt!337161) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!213556 (= lt!337161 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!213557 () Bool)

(declare-fun res!179492 () Bool)

(declare-fun e!145458 () Bool)

(assert (=> b!213557 (=> res!179492 e!145458)))

(declare-fun isPrefixOf!0 (BitStream!8374 BitStream!8374) Bool)

(assert (=> b!213557 (= res!179492 (not (isPrefixOf!0 (_2!9794 lt!337166) (_2!9794 lt!337152))))))

(declare-fun b!213558 () Bool)

(declare-fun e!145456 () Bool)

(declare-fun e!145454 () Bool)

(assert (=> b!213558 (= e!145456 e!145454)))

(declare-fun res!179483 () Bool)

(assert (=> b!213558 (=> (not res!179483) (not e!145454))))

(declare-datatypes ((tuple2!18280 0))(
  ( (tuple2!18281 (_1!9795 BitStream!8374) (_2!9795 Bool)) )
))
(declare-fun lt!337156 () tuple2!18280)

(assert (=> b!213558 (= res!179483 (and (= (_2!9795 lt!337156) lt!337157) (= (_1!9795 lt!337156) (_2!9794 lt!337166))))))

(declare-fun readBitPure!0 (BitStream!8374) tuple2!18280)

(declare-fun readerFrom!0 (BitStream!8374 (_ BitVec 32) (_ BitVec 32)) BitStream!8374)

(assert (=> b!213558 (= lt!337156 (readBitPure!0 (readerFrom!0 (_2!9794 lt!337166) (currentBit!9732 thiss!1204) (currentByte!9737 thiss!1204))))))

(declare-fun res!179476 () Bool)

(assert (=> start!44682 (=> (not res!179476) (not e!145452))))

(assert (=> start!44682 (= res!179476 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!44682 e!145452))

(assert (=> start!44682 true))

(declare-fun e!145457 () Bool)

(declare-fun inv!12 (BitStream!8374) Bool)

(assert (=> start!44682 (and (inv!12 thiss!1204) e!145457)))

(declare-fun b!213559 () Bool)

(declare-fun array_inv!4374 (array!10550) Bool)

(assert (=> b!213559 (= e!145457 (array_inv!4374 (buf!5165 thiss!1204)))))

(declare-fun b!213560 () Bool)

(assert (=> b!213560 (= e!145447 e!145453)))

(declare-fun res!179484 () Bool)

(assert (=> b!213560 (=> res!179484 e!145453)))

(declare-fun lt!337154 () (_ BitVec 64))

(assert (=> b!213560 (= res!179484 (not (= lt!337154 (bvsub (bvsub (bvadd lt!337163 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!213560 (= lt!337154 (bitIndex!0 (size!4633 (buf!5165 (_2!9794 lt!337152))) (currentByte!9737 (_2!9794 lt!337152)) (currentBit!9732 (_2!9794 lt!337152))))))

(assert (=> b!213560 (isPrefixOf!0 thiss!1204 (_2!9794 lt!337152))))

(declare-fun lt!337170 () Unit!15211)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8374 BitStream!8374 BitStream!8374) Unit!15211)

(assert (=> b!213560 (= lt!337170 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9794 lt!337166) (_2!9794 lt!337152)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8374 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!18278)

(assert (=> b!213560 (= lt!337152 (appendBitsLSBFirstLoopTR!0 (_2!9794 lt!337166) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!213561 () Bool)

(declare-fun res!179486 () Bool)

(assert (=> b!213561 (=> res!179486 e!145453)))

(assert (=> b!213561 (= res!179486 (not (= (size!4633 (buf!5165 (_2!9794 lt!337152))) (size!4633 (buf!5165 thiss!1204)))))))

(declare-fun b!213562 () Bool)

(declare-fun res!179487 () Bool)

(assert (=> b!213562 (=> (not res!179487) (not e!145460))))

(assert (=> b!213562 (= res!179487 (not (= i!590 nBits!348)))))

(declare-fun b!213563 () Bool)

(assert (=> b!213563 (= e!145453 e!145458)))

(declare-fun res!179490 () Bool)

(assert (=> b!213563 (=> res!179490 e!145458)))

(assert (=> b!213563 (= res!179490 (not (= lt!337154 lt!337175)))))

(assert (=> b!213563 (= lt!337175 (bvsub lt!337145 ((_ sign_extend 32) i!590)))))

(assert (=> b!213563 (= lt!337145 (bvadd lt!337162 ((_ sign_extend 32) nBits!348)))))

(declare-fun b!213564 () Bool)

(declare-fun e!145450 () Bool)

(assert (=> b!213564 (= e!145450 (invariant!0 (currentBit!9732 thiss!1204) (currentByte!9737 thiss!1204) (size!4633 (buf!5165 (_2!9794 lt!337152)))))))

(declare-fun b!213565 () Bool)

(declare-fun res!179473 () Bool)

(assert (=> b!213565 (=> (not res!179473) (not e!145460))))

(assert (=> b!213565 (= res!179473 (invariant!0 (currentBit!9732 thiss!1204) (currentByte!9737 thiss!1204) (size!4633 (buf!5165 thiss!1204))))))

(declare-fun b!213566 () Bool)

(declare-fun res!179470 () Bool)

(assert (=> b!213566 (=> res!179470 e!145458)))

(assert (=> b!213566 (= res!179470 (not (isPrefixOf!0 thiss!1204 (_2!9794 lt!337166))))))

(declare-fun b!213567 () Bool)

(declare-fun res!179479 () Bool)

(declare-fun e!145455 () Bool)

(assert (=> b!213567 (=> (not res!179479) (not e!145455))))

(declare-datatypes ((tuple2!18282 0))(
  ( (tuple2!18283 (_1!9796 BitStream!8374) (_2!9796 BitStream!8374)) )
))
(declare-fun lt!337168 () tuple2!18282)

(declare-fun withMovedBitIndex!0 (BitStream!8374 (_ BitVec 64)) BitStream!8374)

(assert (=> b!213567 (= res!179479 (= (_1!9796 lt!337168) (withMovedBitIndex!0 (_2!9796 lt!337168) (bvsub lt!337163 lt!337154))))))

(declare-fun b!213568 () Bool)

(declare-fun e!145448 () Bool)

(declare-fun lt!337158 () tuple2!18280)

(declare-fun lt!337155 () tuple2!18280)

(assert (=> b!213568 (= e!145448 (= (_2!9795 lt!337158) (_2!9795 lt!337155)))))

(declare-fun b!213569 () Bool)

(declare-fun e!145461 () Bool)

(assert (=> b!213569 (= e!145461 e!145459)))

(declare-fun res!179480 () Bool)

(assert (=> b!213569 (=> res!179480 e!145459)))

(declare-fun lt!337144 () BitStream!8374)

(assert (=> b!213569 (= res!179480 (not (= (_1!9796 lt!337168) lt!337144)))))

(assert (=> b!213569 e!145455))

(declare-fun res!179489 () Bool)

(assert (=> b!213569 (=> (not res!179489) (not e!145455))))

(declare-datatypes ((tuple2!18284 0))(
  ( (tuple2!18285 (_1!9797 BitStream!8374) (_2!9797 (_ BitVec 64))) )
))
(declare-fun lt!337153 () tuple2!18284)

(declare-fun lt!337172 () tuple2!18284)

(assert (=> b!213569 (= res!179489 (and (= (_2!9797 lt!337153) (_2!9797 lt!337172)) (= (_1!9797 lt!337153) (_1!9797 lt!337172))))))

(declare-fun lt!337150 () tuple2!18282)

(declare-fun lt!337174 () (_ BitVec 64))

(declare-fun lt!337146 () Unit!15211)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8374 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!15211)

(assert (=> b!213569 (= lt!337146 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9796 lt!337150) nBits!348 i!590 lt!337174))))

(declare-fun lt!337167 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8374 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18284)

(assert (=> b!213569 (= lt!337172 (readNBitsLSBFirstsLoopPure!0 lt!337144 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!337167))))

(assert (=> b!213569 (= lt!337144 (withMovedBitIndex!0 (_1!9796 lt!337150) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!213570 () Bool)

(declare-fun lt!337148 () tuple2!18284)

(assert (=> b!213570 (= e!145455 (and (= lt!337162 (bvsub lt!337163 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!9796 lt!337168) lt!337144)) (= (_2!9797 lt!337153) (_2!9797 lt!337148)))))))

(declare-fun b!213571 () Bool)

(declare-fun res!179475 () Bool)

(assert (=> b!213571 (=> (not res!179475) (not e!145456))))

(assert (=> b!213571 (= res!179475 (isPrefixOf!0 thiss!1204 (_2!9794 lt!337166)))))

(declare-fun b!213572 () Bool)

(assert (=> b!213572 (= e!145458 e!145461)))

(declare-fun res!179472 () Bool)

(assert (=> b!213572 (=> res!179472 e!145461)))

(assert (=> b!213572 (= res!179472 (not (= (_1!9797 lt!337148) (_2!9796 lt!337168))))))

(assert (=> b!213572 (= lt!337148 (readNBitsLSBFirstsLoopPure!0 (_1!9796 lt!337168) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!337167))))

(declare-fun lt!337151 () (_ BitVec 64))

(assert (=> b!213572 (validate_offset_bits!1 ((_ sign_extend 32) (size!4633 (buf!5165 (_2!9794 lt!337152)))) ((_ sign_extend 32) (currentByte!9737 (_2!9794 lt!337166))) ((_ sign_extend 32) (currentBit!9732 (_2!9794 lt!337166))) lt!337151)))

(declare-fun lt!337171 () Unit!15211)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8374 array!10550 (_ BitVec 64)) Unit!15211)

(assert (=> b!213572 (= lt!337171 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9794 lt!337166) (buf!5165 (_2!9794 lt!337152)) lt!337151))))

(assert (=> b!213572 (= lt!337151 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!337165 () tuple2!18280)

(assert (=> b!213572 (= lt!337167 (bvor lt!337174 (ite (_2!9795 lt!337165) lt!337161 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!213572 (= lt!337153 (readNBitsLSBFirstsLoopPure!0 (_1!9796 lt!337150) nBits!348 i!590 lt!337174))))

(assert (=> b!213572 (validate_offset_bits!1 ((_ sign_extend 32) (size!4633 (buf!5165 (_2!9794 lt!337152)))) ((_ sign_extend 32) (currentByte!9737 thiss!1204)) ((_ sign_extend 32) (currentBit!9732 thiss!1204)) lt!337149)))

(declare-fun lt!337169 () Unit!15211)

(assert (=> b!213572 (= lt!337169 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5165 (_2!9794 lt!337152)) lt!337149))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!213572 (= lt!337174 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!213572 (= (_2!9795 lt!337165) lt!337157)))

(assert (=> b!213572 (= lt!337165 (readBitPure!0 (_1!9796 lt!337150)))))

(declare-fun reader!0 (BitStream!8374 BitStream!8374) tuple2!18282)

(assert (=> b!213572 (= lt!337168 (reader!0 (_2!9794 lt!337166) (_2!9794 lt!337152)))))

(assert (=> b!213572 (= lt!337150 (reader!0 thiss!1204 (_2!9794 lt!337152)))))

(assert (=> b!213572 e!145448))

(declare-fun res!179488 () Bool)

(assert (=> b!213572 (=> (not res!179488) (not e!145448))))

(assert (=> b!213572 (= res!179488 (= (bitIndex!0 (size!4633 (buf!5165 (_1!9795 lt!337158))) (currentByte!9737 (_1!9795 lt!337158)) (currentBit!9732 (_1!9795 lt!337158))) (bitIndex!0 (size!4633 (buf!5165 (_1!9795 lt!337155))) (currentByte!9737 (_1!9795 lt!337155)) (currentBit!9732 (_1!9795 lt!337155)))))))

(declare-fun lt!337173 () Unit!15211)

(declare-fun lt!337147 () BitStream!8374)

(declare-fun readBitPrefixLemma!0 (BitStream!8374 BitStream!8374) Unit!15211)

(assert (=> b!213572 (= lt!337173 (readBitPrefixLemma!0 lt!337147 (_2!9794 lt!337152)))))

(assert (=> b!213572 (= lt!337155 (readBitPure!0 (BitStream!8375 (buf!5165 (_2!9794 lt!337152)) (currentByte!9737 thiss!1204) (currentBit!9732 thiss!1204))))))

(assert (=> b!213572 (= lt!337158 (readBitPure!0 lt!337147))))

(assert (=> b!213572 e!145450))

(declare-fun res!179482 () Bool)

(assert (=> b!213572 (=> (not res!179482) (not e!145450))))

(assert (=> b!213572 (= res!179482 (invariant!0 (currentBit!9732 thiss!1204) (currentByte!9737 thiss!1204) (size!4633 (buf!5165 (_2!9794 lt!337166)))))))

(assert (=> b!213572 (= lt!337147 (BitStream!8375 (buf!5165 (_2!9794 lt!337166)) (currentByte!9737 thiss!1204) (currentBit!9732 thiss!1204)))))

(declare-fun b!213573 () Bool)

(assert (=> b!213573 (= e!145451 e!145456)))

(declare-fun res!179481 () Bool)

(assert (=> b!213573 (=> (not res!179481) (not e!145456))))

(declare-fun lt!337159 () (_ BitVec 64))

(declare-fun lt!337164 () (_ BitVec 64))

(assert (=> b!213573 (= res!179481 (= lt!337159 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!337164)))))

(assert (=> b!213573 (= lt!337159 (bitIndex!0 (size!4633 (buf!5165 (_2!9794 lt!337166))) (currentByte!9737 (_2!9794 lt!337166)) (currentBit!9732 (_2!9794 lt!337166))))))

(assert (=> b!213573 (= lt!337164 (bitIndex!0 (size!4633 (buf!5165 thiss!1204)) (currentByte!9737 thiss!1204) (currentBit!9732 thiss!1204)))))

(declare-fun b!213574 () Bool)

(declare-fun res!179485 () Bool)

(assert (=> b!213574 (=> (not res!179485) (not e!145455))))

(assert (=> b!213574 (= res!179485 (= (_1!9796 lt!337150) (withMovedBitIndex!0 (_2!9796 lt!337150) (bvsub lt!337162 lt!337154))))))

(declare-fun b!213575 () Bool)

(assert (=> b!213575 (= e!145454 (= (bitIndex!0 (size!4633 (buf!5165 (_1!9795 lt!337156))) (currentByte!9737 (_1!9795 lt!337156)) (currentBit!9732 (_1!9795 lt!337156))) lt!337159))))

(declare-fun b!213576 () Bool)

(declare-fun res!179474 () Bool)

(assert (=> b!213576 (=> res!179474 e!145459)))

(assert (=> b!213576 (= res!179474 (not (= (bitIndex!0 (size!4633 (buf!5165 (_1!9797 lt!337153))) (currentByte!9737 (_1!9797 lt!337153)) (currentBit!9732 (_1!9797 lt!337153))) (bitIndex!0 (size!4633 (buf!5165 (_2!9796 lt!337150))) (currentByte!9737 (_2!9796 lt!337150)) (currentBit!9732 (_2!9796 lt!337150))))))))

(assert (= (and start!44682 res!179476) b!213553))

(assert (= (and b!213553 res!179478) b!213565))

(assert (= (and b!213565 res!179473) b!213562))

(assert (= (and b!213562 res!179487) b!213556))

(assert (= (and b!213556 res!179491) b!213573))

(assert (= (and b!213573 res!179481) b!213571))

(assert (= (and b!213571 res!179475) b!213558))

(assert (= (and b!213558 res!179483) b!213575))

(assert (= (and b!213556 (not res!179471)) b!213560))

(assert (= (and b!213560 (not res!179484)) b!213555))

(assert (= (and b!213555 (not res!179477)) b!213561))

(assert (= (and b!213561 (not res!179486)) b!213563))

(assert (= (and b!213563 (not res!179490)) b!213557))

(assert (= (and b!213557 (not res!179492)) b!213566))

(assert (= (and b!213566 (not res!179470)) b!213572))

(assert (= (and b!213572 res!179482) b!213564))

(assert (= (and b!213572 res!179488) b!213568))

(assert (= (and b!213572 (not res!179472)) b!213569))

(assert (= (and b!213569 res!179489) b!213574))

(assert (= (and b!213574 res!179485) b!213567))

(assert (= (and b!213567 res!179479) b!213570))

(assert (= (and b!213569 (not res!179480)) b!213576))

(assert (= (and b!213576 (not res!179474)) b!213554))

(assert (= start!44682 b!213559))

(declare-fun m!329133 () Bool)

(assert (=> b!213564 m!329133))

(declare-fun m!329135 () Bool)

(assert (=> b!213555 m!329135))

(declare-fun m!329137 () Bool)

(assert (=> b!213571 m!329137))

(declare-fun m!329139 () Bool)

(assert (=> b!213559 m!329139))

(declare-fun m!329141 () Bool)

(assert (=> b!213558 m!329141))

(assert (=> b!213558 m!329141))

(declare-fun m!329143 () Bool)

(assert (=> b!213558 m!329143))

(declare-fun m!329145 () Bool)

(assert (=> b!213557 m!329145))

(declare-fun m!329147 () Bool)

(assert (=> b!213567 m!329147))

(declare-fun m!329149 () Bool)

(assert (=> b!213560 m!329149))

(declare-fun m!329151 () Bool)

(assert (=> b!213560 m!329151))

(declare-fun m!329153 () Bool)

(assert (=> b!213560 m!329153))

(declare-fun m!329155 () Bool)

(assert (=> b!213560 m!329155))

(declare-fun m!329157 () Bool)

(assert (=> start!44682 m!329157))

(declare-fun m!329159 () Bool)

(assert (=> b!213565 m!329159))

(declare-fun m!329161 () Bool)

(assert (=> b!213573 m!329161))

(declare-fun m!329163 () Bool)

(assert (=> b!213573 m!329163))

(declare-fun m!329165 () Bool)

(assert (=> b!213575 m!329165))

(declare-fun m!329167 () Bool)

(assert (=> b!213569 m!329167))

(declare-fun m!329169 () Bool)

(assert (=> b!213569 m!329169))

(declare-fun m!329171 () Bool)

(assert (=> b!213569 m!329171))

(declare-fun m!329173 () Bool)

(assert (=> b!213572 m!329173))

(declare-fun m!329175 () Bool)

(assert (=> b!213572 m!329175))

(declare-fun m!329177 () Bool)

(assert (=> b!213572 m!329177))

(declare-fun m!329179 () Bool)

(assert (=> b!213572 m!329179))

(declare-fun m!329181 () Bool)

(assert (=> b!213572 m!329181))

(declare-fun m!329183 () Bool)

(assert (=> b!213572 m!329183))

(declare-fun m!329185 () Bool)

(assert (=> b!213572 m!329185))

(declare-fun m!329187 () Bool)

(assert (=> b!213572 m!329187))

(declare-fun m!329189 () Bool)

(assert (=> b!213572 m!329189))

(declare-fun m!329191 () Bool)

(assert (=> b!213572 m!329191))

(declare-fun m!329193 () Bool)

(assert (=> b!213572 m!329193))

(declare-fun m!329195 () Bool)

(assert (=> b!213572 m!329195))

(declare-fun m!329197 () Bool)

(assert (=> b!213572 m!329197))

(declare-fun m!329199 () Bool)

(assert (=> b!213572 m!329199))

(declare-fun m!329201 () Bool)

(assert (=> b!213572 m!329201))

(declare-fun m!329203 () Bool)

(assert (=> b!213572 m!329203))

(declare-fun m!329205 () Bool)

(assert (=> b!213574 m!329205))

(declare-fun m!329207 () Bool)

(assert (=> b!213553 m!329207))

(assert (=> b!213556 m!329161))

(assert (=> b!213556 m!329163))

(declare-fun m!329209 () Bool)

(assert (=> b!213556 m!329209))

(assert (=> b!213566 m!329137))

(declare-fun m!329211 () Bool)

(assert (=> b!213576 m!329211))

(declare-fun m!329213 () Bool)

(assert (=> b!213576 m!329213))

(push 1)

(assert (not b!213560))

(assert (not start!44682))

(assert (not b!213553))

(assert (not b!213567))

(assert (not b!213572))

(assert (not b!213555))

(assert (not b!213559))

(assert (not b!213575))

(assert (not b!213571))

(assert (not b!213565))

(assert (not b!213576))

(assert (not b!213558))

(assert (not b!213564))

(assert (not b!213569))

(assert (not b!213573))

(assert (not b!213574))

(assert (not b!213557))

(assert (not b!213566))

(assert (not b!213556))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!72269 () Bool)

(assert (=> d!72269 (= (invariant!0 (currentBit!9732 thiss!1204) (currentByte!9737 thiss!1204) (size!4633 (buf!5165 (_2!9794 lt!337152)))) (and (bvsge (currentBit!9732 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9732 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9737 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9737 thiss!1204) (size!4633 (buf!5165 (_2!9794 lt!337152)))) (and (= (currentBit!9732 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9737 thiss!1204) (size!4633 (buf!5165 (_2!9794 lt!337152))))))))))

(assert (=> b!213564 d!72269))

(declare-fun d!72271 () Bool)

(declare-fun e!145585 () Bool)

(assert (=> d!72271 e!145585))

(declare-fun res!179683 () Bool)

(assert (=> d!72271 (=> (not res!179683) (not e!145585))))

(declare-fun lt!337544 () (_ BitVec 64))

(declare-fun lt!337547 () (_ BitVec 64))

(declare-fun lt!337549 () (_ BitVec 64))

(assert (=> d!72271 (= res!179683 (= lt!337544 (bvsub lt!337547 lt!337549)))))

(assert (=> d!72271 (or (= (bvand lt!337547 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!337549 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!337547 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!337547 lt!337549) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!72271 (= lt!337549 (remainingBits!0 ((_ sign_extend 32) (size!4633 (buf!5165 (_1!9795 lt!337156)))) ((_ sign_extend 32) (currentByte!9737 (_1!9795 lt!337156))) ((_ sign_extend 32) (currentBit!9732 (_1!9795 lt!337156)))))))

(declare-fun lt!337546 () (_ BitVec 64))

(declare-fun lt!337545 () (_ BitVec 64))

(assert (=> d!72271 (= lt!337547 (bvmul lt!337546 lt!337545))))

(assert (=> d!72271 (or (= lt!337546 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!337545 (bvsdiv (bvmul lt!337546 lt!337545) lt!337546)))))

(assert (=> d!72271 (= lt!337545 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72271 (= lt!337546 ((_ sign_extend 32) (size!4633 (buf!5165 (_1!9795 lt!337156)))))))

(assert (=> d!72271 (= lt!337544 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9737 (_1!9795 lt!337156))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9732 (_1!9795 lt!337156)))))))

(assert (=> d!72271 (invariant!0 (currentBit!9732 (_1!9795 lt!337156)) (currentByte!9737 (_1!9795 lt!337156)) (size!4633 (buf!5165 (_1!9795 lt!337156))))))

(assert (=> d!72271 (= (bitIndex!0 (size!4633 (buf!5165 (_1!9795 lt!337156))) (currentByte!9737 (_1!9795 lt!337156)) (currentBit!9732 (_1!9795 lt!337156))) lt!337544)))

(declare-fun b!213780 () Bool)

(declare-fun res!179682 () Bool)

(assert (=> b!213780 (=> (not res!179682) (not e!145585))))

(assert (=> b!213780 (= res!179682 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!337544))))

(declare-fun b!213781 () Bool)

(declare-fun lt!337548 () (_ BitVec 64))

(assert (=> b!213781 (= e!145585 (bvsle lt!337544 (bvmul lt!337548 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!213781 (or (= lt!337548 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!337548 #b0000000000000000000000000000000000000000000000000000000000001000) lt!337548)))))

(assert (=> b!213781 (= lt!337548 ((_ sign_extend 32) (size!4633 (buf!5165 (_1!9795 lt!337156)))))))

(assert (= (and d!72271 res!179683) b!213780))

(assert (= (and b!213780 res!179682) b!213781))

(declare-fun m!329503 () Bool)

(assert (=> d!72271 m!329503))

(declare-fun m!329505 () Bool)

(assert (=> d!72271 m!329505))

(assert (=> b!213575 d!72271))

(declare-fun d!72273 () Bool)

(assert (=> d!72273 (= (invariant!0 (currentBit!9732 thiss!1204) (currentByte!9737 thiss!1204) (size!4633 (buf!5165 thiss!1204))) (and (bvsge (currentBit!9732 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9732 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9737 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9737 thiss!1204) (size!4633 (buf!5165 thiss!1204))) (and (= (currentBit!9732 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9737 thiss!1204) (size!4633 (buf!5165 thiss!1204)))))))))

(assert (=> b!213565 d!72273))

(declare-fun d!72275 () Bool)

(declare-fun e!145588 () Bool)

(assert (=> d!72275 e!145588))

(declare-fun res!179686 () Bool)

(assert (=> d!72275 (=> (not res!179686) (not e!145588))))

(declare-fun lt!337554 () BitStream!8374)

(declare-fun lt!337555 () (_ BitVec 64))

(assert (=> d!72275 (= res!179686 (= (bvadd lt!337555 (bvsub lt!337162 lt!337154)) (bitIndex!0 (size!4633 (buf!5165 lt!337554)) (currentByte!9737 lt!337554) (currentBit!9732 lt!337554))))))

(assert (=> d!72275 (or (not (= (bvand lt!337555 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!337162 lt!337154) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!337555 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!337555 (bvsub lt!337162 lt!337154)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72275 (= lt!337555 (bitIndex!0 (size!4633 (buf!5165 (_2!9796 lt!337150))) (currentByte!9737 (_2!9796 lt!337150)) (currentBit!9732 (_2!9796 lt!337150))))))

(declare-fun moveBitIndex!0 (BitStream!8374 (_ BitVec 64)) tuple2!18278)

(assert (=> d!72275 (= lt!337554 (_2!9794 (moveBitIndex!0 (_2!9796 lt!337150) (bvsub lt!337162 lt!337154))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!8374 (_ BitVec 64)) Bool)

(assert (=> d!72275 (moveBitIndexPrecond!0 (_2!9796 lt!337150) (bvsub lt!337162 lt!337154))))

(assert (=> d!72275 (= (withMovedBitIndex!0 (_2!9796 lt!337150) (bvsub lt!337162 lt!337154)) lt!337554)))

(declare-fun b!213784 () Bool)

(assert (=> b!213784 (= e!145588 (= (size!4633 (buf!5165 (_2!9796 lt!337150))) (size!4633 (buf!5165 lt!337554))))))

(assert (= (and d!72275 res!179686) b!213784))

(declare-fun m!329507 () Bool)

(assert (=> d!72275 m!329507))

(assert (=> d!72275 m!329213))

(declare-fun m!329509 () Bool)

(assert (=> d!72275 m!329509))

(declare-fun m!329511 () Bool)

(assert (=> d!72275 m!329511))

(assert (=> b!213574 d!72275))

(declare-fun d!72277 () Bool)

(assert (=> d!72277 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4633 (buf!5165 thiss!1204))) ((_ sign_extend 32) (currentByte!9737 thiss!1204)) ((_ sign_extend 32) (currentBit!9732 thiss!1204)) lt!337149) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4633 (buf!5165 thiss!1204))) ((_ sign_extend 32) (currentByte!9737 thiss!1204)) ((_ sign_extend 32) (currentBit!9732 thiss!1204))) lt!337149))))

(declare-fun bs!17725 () Bool)

(assert (= bs!17725 d!72277))

(declare-fun m!329513 () Bool)

(assert (=> bs!17725 m!329513))

(assert (=> b!213553 d!72277))

(declare-fun d!72279 () Bool)

(assert (=> d!72279 (= (invariant!0 (currentBit!9732 thiss!1204) (currentByte!9737 thiss!1204) (size!4633 (buf!5165 (_2!9794 lt!337166)))) (and (bvsge (currentBit!9732 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9732 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9737 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9737 thiss!1204) (size!4633 (buf!5165 (_2!9794 lt!337166)))) (and (= (currentBit!9732 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9737 thiss!1204) (size!4633 (buf!5165 (_2!9794 lt!337166))))))))))

(assert (=> b!213572 d!72279))

(declare-fun b!213806 () Bool)

(declare-fun e!145601 () Unit!15211)

(declare-fun Unit!15230 () Unit!15211)

(assert (=> b!213806 (= e!145601 Unit!15230)))

(declare-fun d!72281 () Bool)

(declare-fun e!145600 () Bool)

(assert (=> d!72281 e!145600))

(declare-fun res!179705 () Bool)

(assert (=> d!72281 (=> (not res!179705) (not e!145600))))

(declare-fun lt!337629 () tuple2!18282)

(assert (=> d!72281 (= res!179705 (isPrefixOf!0 (_1!9796 lt!337629) (_2!9796 lt!337629)))))

(declare-fun lt!337642 () BitStream!8374)

(assert (=> d!72281 (= lt!337629 (tuple2!18283 lt!337642 (_2!9794 lt!337152)))))

(declare-fun lt!337640 () Unit!15211)

(declare-fun lt!337645 () Unit!15211)

(assert (=> d!72281 (= lt!337640 lt!337645)))

(assert (=> d!72281 (isPrefixOf!0 lt!337642 (_2!9794 lt!337152))))

(assert (=> d!72281 (= lt!337645 (lemmaIsPrefixTransitive!0 lt!337642 (_2!9794 lt!337152) (_2!9794 lt!337152)))))

(declare-fun lt!337644 () Unit!15211)

(declare-fun lt!337634 () Unit!15211)

(assert (=> d!72281 (= lt!337644 lt!337634)))

(assert (=> d!72281 (isPrefixOf!0 lt!337642 (_2!9794 lt!337152))))

(assert (=> d!72281 (= lt!337634 (lemmaIsPrefixTransitive!0 lt!337642 (_2!9794 lt!337166) (_2!9794 lt!337152)))))

(declare-fun lt!337627 () Unit!15211)

(assert (=> d!72281 (= lt!337627 e!145601)))

(declare-fun c!10485 () Bool)

(assert (=> d!72281 (= c!10485 (not (= (size!4633 (buf!5165 (_2!9794 lt!337166))) #b00000000000000000000000000000000)))))

(declare-fun lt!337641 () Unit!15211)

(declare-fun lt!337643 () Unit!15211)

(assert (=> d!72281 (= lt!337641 lt!337643)))

(assert (=> d!72281 (isPrefixOf!0 (_2!9794 lt!337152) (_2!9794 lt!337152))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8374) Unit!15211)

(assert (=> d!72281 (= lt!337643 (lemmaIsPrefixRefl!0 (_2!9794 lt!337152)))))

(declare-fun lt!337626 () Unit!15211)

(declare-fun lt!337639 () Unit!15211)

(assert (=> d!72281 (= lt!337626 lt!337639)))

(assert (=> d!72281 (= lt!337639 (lemmaIsPrefixRefl!0 (_2!9794 lt!337152)))))

(declare-fun lt!337635 () Unit!15211)

(declare-fun lt!337638 () Unit!15211)

(assert (=> d!72281 (= lt!337635 lt!337638)))

(assert (=> d!72281 (isPrefixOf!0 lt!337642 lt!337642)))

(assert (=> d!72281 (= lt!337638 (lemmaIsPrefixRefl!0 lt!337642))))

(declare-fun lt!337636 () Unit!15211)

(declare-fun lt!337633 () Unit!15211)

(assert (=> d!72281 (= lt!337636 lt!337633)))

(assert (=> d!72281 (isPrefixOf!0 (_2!9794 lt!337166) (_2!9794 lt!337166))))

(assert (=> d!72281 (= lt!337633 (lemmaIsPrefixRefl!0 (_2!9794 lt!337166)))))

(assert (=> d!72281 (= lt!337642 (BitStream!8375 (buf!5165 (_2!9794 lt!337152)) (currentByte!9737 (_2!9794 lt!337166)) (currentBit!9732 (_2!9794 lt!337166))))))

(assert (=> d!72281 (isPrefixOf!0 (_2!9794 lt!337166) (_2!9794 lt!337152))))

(assert (=> d!72281 (= (reader!0 (_2!9794 lt!337166) (_2!9794 lt!337152)) lt!337629)))

(declare-fun b!213807 () Bool)

(declare-fun lt!337628 () Unit!15211)

(assert (=> b!213807 (= e!145601 lt!337628)))

(declare-fun lt!337637 () (_ BitVec 64))

(assert (=> b!213807 (= lt!337637 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!337632 () (_ BitVec 64))

(assert (=> b!213807 (= lt!337632 (bitIndex!0 (size!4633 (buf!5165 (_2!9794 lt!337166))) (currentByte!9737 (_2!9794 lt!337166)) (currentBit!9732 (_2!9794 lt!337166))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!10550 array!10550 (_ BitVec 64) (_ BitVec 64)) Unit!15211)

(assert (=> b!213807 (= lt!337628 (arrayBitRangesEqSymmetric!0 (buf!5165 (_2!9794 lt!337166)) (buf!5165 (_2!9794 lt!337152)) lt!337637 lt!337632))))

(declare-fun arrayBitRangesEq!0 (array!10550 array!10550 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!213807 (arrayBitRangesEq!0 (buf!5165 (_2!9794 lt!337152)) (buf!5165 (_2!9794 lt!337166)) lt!337637 lt!337632)))

(declare-fun b!213808 () Bool)

(declare-fun res!179704 () Bool)

(assert (=> b!213808 (=> (not res!179704) (not e!145600))))

(assert (=> b!213808 (= res!179704 (isPrefixOf!0 (_1!9796 lt!337629) (_2!9794 lt!337166)))))

(declare-fun lt!337631 () (_ BitVec 64))

(declare-fun lt!337630 () (_ BitVec 64))

(declare-fun b!213809 () Bool)

(assert (=> b!213809 (= e!145600 (= (_1!9796 lt!337629) (withMovedBitIndex!0 (_2!9796 lt!337629) (bvsub lt!337631 lt!337630))))))

(assert (=> b!213809 (or (= (bvand lt!337631 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!337630 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!337631 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!337631 lt!337630) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!213809 (= lt!337630 (bitIndex!0 (size!4633 (buf!5165 (_2!9794 lt!337152))) (currentByte!9737 (_2!9794 lt!337152)) (currentBit!9732 (_2!9794 lt!337152))))))

(assert (=> b!213809 (= lt!337631 (bitIndex!0 (size!4633 (buf!5165 (_2!9794 lt!337166))) (currentByte!9737 (_2!9794 lt!337166)) (currentBit!9732 (_2!9794 lt!337166))))))

(declare-fun b!213810 () Bool)

(declare-fun res!179706 () Bool)

(assert (=> b!213810 (=> (not res!179706) (not e!145600))))

(assert (=> b!213810 (= res!179706 (isPrefixOf!0 (_2!9796 lt!337629) (_2!9794 lt!337152)))))

(assert (= (and d!72281 c!10485) b!213807))

(assert (= (and d!72281 (not c!10485)) b!213806))

(assert (= (and d!72281 res!179705) b!213808))

(assert (= (and b!213808 res!179704) b!213810))

(assert (= (and b!213810 res!179706) b!213809))

(assert (=> b!213807 m!329161))

(declare-fun m!329529 () Bool)

(assert (=> b!213807 m!329529))

(declare-fun m!329531 () Bool)

(assert (=> b!213807 m!329531))

(declare-fun m!329533 () Bool)

(assert (=> d!72281 m!329533))

(declare-fun m!329535 () Bool)

(assert (=> d!72281 m!329535))

(declare-fun m!329537 () Bool)

(assert (=> d!72281 m!329537))

(declare-fun m!329539 () Bool)

(assert (=> d!72281 m!329539))

(assert (=> d!72281 m!329145))

(declare-fun m!329541 () Bool)

(assert (=> d!72281 m!329541))

(declare-fun m!329543 () Bool)

(assert (=> d!72281 m!329543))

(declare-fun m!329545 () Bool)

(assert (=> d!72281 m!329545))

(declare-fun m!329547 () Bool)

(assert (=> d!72281 m!329547))

(declare-fun m!329549 () Bool)

(assert (=> d!72281 m!329549))

(declare-fun m!329551 () Bool)

(assert (=> d!72281 m!329551))

(declare-fun m!329553 () Bool)

(assert (=> b!213810 m!329553))

(declare-fun m!329555 () Bool)

(assert (=> b!213808 m!329555))

(declare-fun m!329557 () Bool)

(assert (=> b!213809 m!329557))

(assert (=> b!213809 m!329149))

(assert (=> b!213809 m!329161))

(assert (=> b!213572 d!72281))

(declare-fun d!72291 () Bool)

(assert (=> d!72291 (validate_offset_bits!1 ((_ sign_extend 32) (size!4633 (buf!5165 (_2!9794 lt!337152)))) ((_ sign_extend 32) (currentByte!9737 (_2!9794 lt!337166))) ((_ sign_extend 32) (currentBit!9732 (_2!9794 lt!337166))) lt!337151)))

(declare-fun lt!337648 () Unit!15211)

(declare-fun choose!9 (BitStream!8374 array!10550 (_ BitVec 64) BitStream!8374) Unit!15211)

(assert (=> d!72291 (= lt!337648 (choose!9 (_2!9794 lt!337166) (buf!5165 (_2!9794 lt!337152)) lt!337151 (BitStream!8375 (buf!5165 (_2!9794 lt!337152)) (currentByte!9737 (_2!9794 lt!337166)) (currentBit!9732 (_2!9794 lt!337166)))))))

(assert (=> d!72291 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9794 lt!337166) (buf!5165 (_2!9794 lt!337152)) lt!337151) lt!337648)))

(declare-fun bs!17726 () Bool)

(assert (= bs!17726 d!72291))

(assert (=> bs!17726 m!329191))

(declare-fun m!329559 () Bool)

(assert (=> bs!17726 m!329559))

(assert (=> b!213572 d!72291))

(declare-fun d!72293 () Bool)

(declare-fun e!145608 () Bool)

(assert (=> d!72293 e!145608))

(declare-fun res!179717 () Bool)

(assert (=> d!72293 (=> (not res!179717) (not e!145608))))

(declare-fun lt!337668 () tuple2!18280)

(declare-fun lt!337665 () tuple2!18280)

(assert (=> d!72293 (= res!179717 (= (bitIndex!0 (size!4633 (buf!5165 (_1!9795 lt!337668))) (currentByte!9737 (_1!9795 lt!337668)) (currentBit!9732 (_1!9795 lt!337668))) (bitIndex!0 (size!4633 (buf!5165 (_1!9795 lt!337665))) (currentByte!9737 (_1!9795 lt!337665)) (currentBit!9732 (_1!9795 lt!337665)))))))

(declare-fun lt!337666 () Unit!15211)

(declare-fun lt!337667 () BitStream!8374)

(declare-fun choose!50 (BitStream!8374 BitStream!8374 BitStream!8374 tuple2!18280 tuple2!18280 BitStream!8374 Bool tuple2!18280 tuple2!18280 BitStream!8374 Bool) Unit!15211)

(assert (=> d!72293 (= lt!337666 (choose!50 lt!337147 (_2!9794 lt!337152) lt!337667 lt!337668 (tuple2!18281 (_1!9795 lt!337668) (_2!9795 lt!337668)) (_1!9795 lt!337668) (_2!9795 lt!337668) lt!337665 (tuple2!18281 (_1!9795 lt!337665) (_2!9795 lt!337665)) (_1!9795 lt!337665) (_2!9795 lt!337665)))))

(assert (=> d!72293 (= lt!337665 (readBitPure!0 lt!337667))))

(assert (=> d!72293 (= lt!337668 (readBitPure!0 lt!337147))))

(assert (=> d!72293 (= lt!337667 (BitStream!8375 (buf!5165 (_2!9794 lt!337152)) (currentByte!9737 lt!337147) (currentBit!9732 lt!337147)))))

(assert (=> d!72293 (invariant!0 (currentBit!9732 lt!337147) (currentByte!9737 lt!337147) (size!4633 (buf!5165 (_2!9794 lt!337152))))))

(assert (=> d!72293 (= (readBitPrefixLemma!0 lt!337147 (_2!9794 lt!337152)) lt!337666)))

(declare-fun b!213822 () Bool)

(assert (=> b!213822 (= e!145608 (= (_2!9795 lt!337668) (_2!9795 lt!337665)))))

(assert (= (and d!72293 res!179717) b!213822))

(declare-fun m!329561 () Bool)

(assert (=> d!72293 m!329561))

(declare-fun m!329563 () Bool)

(assert (=> d!72293 m!329563))

(declare-fun m!329565 () Bool)

(assert (=> d!72293 m!329565))

(declare-fun m!329567 () Bool)

(assert (=> d!72293 m!329567))

(assert (=> d!72293 m!329173))

(declare-fun m!329569 () Bool)

(assert (=> d!72293 m!329569))

(assert (=> b!213572 d!72293))

(declare-fun d!72295 () Bool)

(declare-datatypes ((tuple2!18306 0))(
  ( (tuple2!18307 (_1!9808 (_ BitVec 64)) (_2!9808 BitStream!8374)) )
))
(declare-fun lt!337681 () tuple2!18306)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!8374 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18306)

(assert (=> d!72295 (= lt!337681 (readNBitsLSBFirstsLoop!0 (_1!9796 lt!337150) nBits!348 i!590 lt!337174))))

(assert (=> d!72295 (= (readNBitsLSBFirstsLoopPure!0 (_1!9796 lt!337150) nBits!348 i!590 lt!337174) (tuple2!18285 (_2!9808 lt!337681) (_1!9808 lt!337681)))))

(declare-fun bs!17727 () Bool)

(assert (= bs!17727 d!72295))

(declare-fun m!329585 () Bool)

(assert (=> bs!17727 m!329585))

(assert (=> b!213572 d!72295))

(declare-fun d!72299 () Bool)

(declare-fun e!145612 () Bool)

(assert (=> d!72299 e!145612))

(declare-fun res!179725 () Bool)

(assert (=> d!72299 (=> (not res!179725) (not e!145612))))

(declare-fun lt!337687 () (_ BitVec 64))

(declare-fun lt!337682 () (_ BitVec 64))

(declare-fun lt!337685 () (_ BitVec 64))

(assert (=> d!72299 (= res!179725 (= lt!337682 (bvsub lt!337685 lt!337687)))))

(assert (=> d!72299 (or (= (bvand lt!337685 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!337687 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!337685 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!337685 lt!337687) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72299 (= lt!337687 (remainingBits!0 ((_ sign_extend 32) (size!4633 (buf!5165 (_1!9795 lt!337155)))) ((_ sign_extend 32) (currentByte!9737 (_1!9795 lt!337155))) ((_ sign_extend 32) (currentBit!9732 (_1!9795 lt!337155)))))))

(declare-fun lt!337684 () (_ BitVec 64))

(declare-fun lt!337683 () (_ BitVec 64))

(assert (=> d!72299 (= lt!337685 (bvmul lt!337684 lt!337683))))

(assert (=> d!72299 (or (= lt!337684 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!337683 (bvsdiv (bvmul lt!337684 lt!337683) lt!337684)))))

(assert (=> d!72299 (= lt!337683 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72299 (= lt!337684 ((_ sign_extend 32) (size!4633 (buf!5165 (_1!9795 lt!337155)))))))

(assert (=> d!72299 (= lt!337682 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9737 (_1!9795 lt!337155))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9732 (_1!9795 lt!337155)))))))

(assert (=> d!72299 (invariant!0 (currentBit!9732 (_1!9795 lt!337155)) (currentByte!9737 (_1!9795 lt!337155)) (size!4633 (buf!5165 (_1!9795 lt!337155))))))

(assert (=> d!72299 (= (bitIndex!0 (size!4633 (buf!5165 (_1!9795 lt!337155))) (currentByte!9737 (_1!9795 lt!337155)) (currentBit!9732 (_1!9795 lt!337155))) lt!337682)))

(declare-fun b!213829 () Bool)

(declare-fun res!179724 () Bool)

(assert (=> b!213829 (=> (not res!179724) (not e!145612))))

(assert (=> b!213829 (= res!179724 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!337682))))

(declare-fun b!213830 () Bool)

(declare-fun lt!337686 () (_ BitVec 64))

(assert (=> b!213830 (= e!145612 (bvsle lt!337682 (bvmul lt!337686 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!213830 (or (= lt!337686 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!337686 #b0000000000000000000000000000000000000000000000000000000000001000) lt!337686)))))

(assert (=> b!213830 (= lt!337686 ((_ sign_extend 32) (size!4633 (buf!5165 (_1!9795 lt!337155)))))))

(assert (= (and d!72299 res!179725) b!213829))

(assert (= (and b!213829 res!179724) b!213830))

(declare-fun m!329589 () Bool)

(assert (=> d!72299 m!329589))

(declare-fun m!329591 () Bool)

(assert (=> d!72299 m!329591))

(assert (=> b!213572 d!72299))

(declare-fun d!72303 () Bool)

(assert (=> d!72303 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4633 (buf!5165 (_2!9794 lt!337152)))) ((_ sign_extend 32) (currentByte!9737 thiss!1204)) ((_ sign_extend 32) (currentBit!9732 thiss!1204)) lt!337149) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4633 (buf!5165 (_2!9794 lt!337152)))) ((_ sign_extend 32) (currentByte!9737 thiss!1204)) ((_ sign_extend 32) (currentBit!9732 thiss!1204))) lt!337149))))

(declare-fun bs!17728 () Bool)

(assert (= bs!17728 d!72303))

(declare-fun m!329593 () Bool)

(assert (=> bs!17728 m!329593))

(assert (=> b!213572 d!72303))

(declare-fun d!72305 () Bool)

(assert (=> d!72305 (validate_offset_bits!1 ((_ sign_extend 32) (size!4633 (buf!5165 (_2!9794 lt!337152)))) ((_ sign_extend 32) (currentByte!9737 thiss!1204)) ((_ sign_extend 32) (currentBit!9732 thiss!1204)) lt!337149)))

(declare-fun lt!337688 () Unit!15211)

(assert (=> d!72305 (= lt!337688 (choose!9 thiss!1204 (buf!5165 (_2!9794 lt!337152)) lt!337149 (BitStream!8375 (buf!5165 (_2!9794 lt!337152)) (currentByte!9737 thiss!1204) (currentBit!9732 thiss!1204))))))

(assert (=> d!72305 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5165 (_2!9794 lt!337152)) lt!337149) lt!337688)))

(declare-fun bs!17729 () Bool)

(assert (= bs!17729 d!72305))

(assert (=> bs!17729 m!329177))

(declare-fun m!329595 () Bool)

(assert (=> bs!17729 m!329595))

(assert (=> b!213572 d!72305))

(declare-fun lt!337689 () tuple2!18306)

(declare-fun d!72307 () Bool)

(assert (=> d!72307 (= lt!337689 (readNBitsLSBFirstsLoop!0 (_1!9796 lt!337168) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!337167))))

(assert (=> d!72307 (= (readNBitsLSBFirstsLoopPure!0 (_1!9796 lt!337168) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!337167) (tuple2!18285 (_2!9808 lt!337689) (_1!9808 lt!337689)))))

(declare-fun bs!17730 () Bool)

(assert (= bs!17730 d!72307))

(declare-fun m!329597 () Bool)

(assert (=> bs!17730 m!329597))

(assert (=> b!213572 d!72307))

(declare-fun d!72309 () Bool)

(declare-datatypes ((tuple2!18308 0))(
  ( (tuple2!18309 (_1!9809 Bool) (_2!9809 BitStream!8374)) )
))
(declare-fun lt!337692 () tuple2!18308)

(declare-fun readBit!0 (BitStream!8374) tuple2!18308)

(assert (=> d!72309 (= lt!337692 (readBit!0 (_1!9796 lt!337150)))))

(assert (=> d!72309 (= (readBitPure!0 (_1!9796 lt!337150)) (tuple2!18281 (_2!9809 lt!337692) (_1!9809 lt!337692)))))

(declare-fun bs!17731 () Bool)

(assert (= bs!17731 d!72309))

(declare-fun m!329599 () Bool)

(assert (=> bs!17731 m!329599))

(assert (=> b!213572 d!72309))

(declare-fun b!213837 () Bool)

(declare-fun e!145618 () Unit!15211)

(declare-fun Unit!15231 () Unit!15211)

(assert (=> b!213837 (= e!145618 Unit!15231)))

(declare-fun d!72311 () Bool)

(declare-fun e!145617 () Bool)

(assert (=> d!72311 e!145617))

(declare-fun res!179733 () Bool)

(assert (=> d!72311 (=> (not res!179733) (not e!145617))))

(declare-fun lt!337696 () tuple2!18282)

(assert (=> d!72311 (= res!179733 (isPrefixOf!0 (_1!9796 lt!337696) (_2!9796 lt!337696)))))

(declare-fun lt!337709 () BitStream!8374)

(assert (=> d!72311 (= lt!337696 (tuple2!18283 lt!337709 (_2!9794 lt!337152)))))

(declare-fun lt!337707 () Unit!15211)

(declare-fun lt!337712 () Unit!15211)

(assert (=> d!72311 (= lt!337707 lt!337712)))

(assert (=> d!72311 (isPrefixOf!0 lt!337709 (_2!9794 lt!337152))))

(assert (=> d!72311 (= lt!337712 (lemmaIsPrefixTransitive!0 lt!337709 (_2!9794 lt!337152) (_2!9794 lt!337152)))))

(declare-fun lt!337711 () Unit!15211)

(declare-fun lt!337701 () Unit!15211)

(assert (=> d!72311 (= lt!337711 lt!337701)))

(assert (=> d!72311 (isPrefixOf!0 lt!337709 (_2!9794 lt!337152))))

(assert (=> d!72311 (= lt!337701 (lemmaIsPrefixTransitive!0 lt!337709 thiss!1204 (_2!9794 lt!337152)))))

(declare-fun lt!337694 () Unit!15211)

(assert (=> d!72311 (= lt!337694 e!145618)))

(declare-fun c!10486 () Bool)

(assert (=> d!72311 (= c!10486 (not (= (size!4633 (buf!5165 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!337708 () Unit!15211)

(declare-fun lt!337710 () Unit!15211)

(assert (=> d!72311 (= lt!337708 lt!337710)))

(assert (=> d!72311 (isPrefixOf!0 (_2!9794 lt!337152) (_2!9794 lt!337152))))

(assert (=> d!72311 (= lt!337710 (lemmaIsPrefixRefl!0 (_2!9794 lt!337152)))))

(declare-fun lt!337693 () Unit!15211)

(declare-fun lt!337706 () Unit!15211)

(assert (=> d!72311 (= lt!337693 lt!337706)))

(assert (=> d!72311 (= lt!337706 (lemmaIsPrefixRefl!0 (_2!9794 lt!337152)))))

(declare-fun lt!337702 () Unit!15211)

(declare-fun lt!337705 () Unit!15211)

(assert (=> d!72311 (= lt!337702 lt!337705)))

(assert (=> d!72311 (isPrefixOf!0 lt!337709 lt!337709)))

(assert (=> d!72311 (= lt!337705 (lemmaIsPrefixRefl!0 lt!337709))))

(declare-fun lt!337703 () Unit!15211)

(declare-fun lt!337700 () Unit!15211)

(assert (=> d!72311 (= lt!337703 lt!337700)))

(assert (=> d!72311 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!72311 (= lt!337700 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!72311 (= lt!337709 (BitStream!8375 (buf!5165 (_2!9794 lt!337152)) (currentByte!9737 thiss!1204) (currentBit!9732 thiss!1204)))))

(assert (=> d!72311 (isPrefixOf!0 thiss!1204 (_2!9794 lt!337152))))

(assert (=> d!72311 (= (reader!0 thiss!1204 (_2!9794 lt!337152)) lt!337696)))

(declare-fun b!213838 () Bool)

(declare-fun lt!337695 () Unit!15211)

(assert (=> b!213838 (= e!145618 lt!337695)))

(declare-fun lt!337704 () (_ BitVec 64))

(assert (=> b!213838 (= lt!337704 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!337699 () (_ BitVec 64))

(assert (=> b!213838 (= lt!337699 (bitIndex!0 (size!4633 (buf!5165 thiss!1204)) (currentByte!9737 thiss!1204) (currentBit!9732 thiss!1204)))))

(assert (=> b!213838 (= lt!337695 (arrayBitRangesEqSymmetric!0 (buf!5165 thiss!1204) (buf!5165 (_2!9794 lt!337152)) lt!337704 lt!337699))))

(assert (=> b!213838 (arrayBitRangesEq!0 (buf!5165 (_2!9794 lt!337152)) (buf!5165 thiss!1204) lt!337704 lt!337699)))

(declare-fun b!213839 () Bool)

(declare-fun res!179732 () Bool)

(assert (=> b!213839 (=> (not res!179732) (not e!145617))))

(assert (=> b!213839 (= res!179732 (isPrefixOf!0 (_1!9796 lt!337696) thiss!1204))))

(declare-fun lt!337698 () (_ BitVec 64))

(declare-fun b!213840 () Bool)

(declare-fun lt!337697 () (_ BitVec 64))

(assert (=> b!213840 (= e!145617 (= (_1!9796 lt!337696) (withMovedBitIndex!0 (_2!9796 lt!337696) (bvsub lt!337698 lt!337697))))))

(assert (=> b!213840 (or (= (bvand lt!337698 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!337697 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!337698 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!337698 lt!337697) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!213840 (= lt!337697 (bitIndex!0 (size!4633 (buf!5165 (_2!9794 lt!337152))) (currentByte!9737 (_2!9794 lt!337152)) (currentBit!9732 (_2!9794 lt!337152))))))

(assert (=> b!213840 (= lt!337698 (bitIndex!0 (size!4633 (buf!5165 thiss!1204)) (currentByte!9737 thiss!1204) (currentBit!9732 thiss!1204)))))

(declare-fun b!213841 () Bool)

(declare-fun res!179734 () Bool)

(assert (=> b!213841 (=> (not res!179734) (not e!145617))))

(assert (=> b!213841 (= res!179734 (isPrefixOf!0 (_2!9796 lt!337696) (_2!9794 lt!337152)))))

(assert (= (and d!72311 c!10486) b!213838))

(assert (= (and d!72311 (not c!10486)) b!213837))

(assert (= (and d!72311 res!179733) b!213839))

(assert (= (and b!213839 res!179732) b!213841))

(assert (= (and b!213841 res!179734) b!213840))

(assert (=> b!213838 m!329163))

(declare-fun m!329603 () Bool)

(assert (=> b!213838 m!329603))

(declare-fun m!329605 () Bool)

(assert (=> b!213838 m!329605))

(declare-fun m!329607 () Bool)

(assert (=> d!72311 m!329607))

(assert (=> d!72311 m!329535))

(declare-fun m!329609 () Bool)

(assert (=> d!72311 m!329609))

(declare-fun m!329611 () Bool)

(assert (=> d!72311 m!329611))

(assert (=> d!72311 m!329151))

(assert (=> d!72311 m!329541))

(declare-fun m!329613 () Bool)

(assert (=> d!72311 m!329613))

(declare-fun m!329615 () Bool)

(assert (=> d!72311 m!329615))

(declare-fun m!329617 () Bool)

(assert (=> d!72311 m!329617))

(declare-fun m!329619 () Bool)

(assert (=> d!72311 m!329619))

(declare-fun m!329621 () Bool)

(assert (=> d!72311 m!329621))

(declare-fun m!329623 () Bool)

(assert (=> b!213841 m!329623))

(declare-fun m!329625 () Bool)

(assert (=> b!213839 m!329625))

(declare-fun m!329627 () Bool)

(assert (=> b!213840 m!329627))

(assert (=> b!213840 m!329149))

(assert (=> b!213840 m!329163))

(assert (=> b!213572 d!72311))

(declare-fun d!72315 () Bool)

(declare-fun e!145621 () Bool)

(assert (=> d!72315 e!145621))

(declare-fun res!179739 () Bool)

(assert (=> d!72315 (=> (not res!179739) (not e!145621))))

(declare-fun lt!337716 () (_ BitVec 64))

(declare-fun lt!337718 () (_ BitVec 64))

(declare-fun lt!337713 () (_ BitVec 64))

(assert (=> d!72315 (= res!179739 (= lt!337713 (bvsub lt!337716 lt!337718)))))

(assert (=> d!72315 (or (= (bvand lt!337716 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!337718 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!337716 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!337716 lt!337718) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72315 (= lt!337718 (remainingBits!0 ((_ sign_extend 32) (size!4633 (buf!5165 (_1!9795 lt!337158)))) ((_ sign_extend 32) (currentByte!9737 (_1!9795 lt!337158))) ((_ sign_extend 32) (currentBit!9732 (_1!9795 lt!337158)))))))

(declare-fun lt!337715 () (_ BitVec 64))

(declare-fun lt!337714 () (_ BitVec 64))

(assert (=> d!72315 (= lt!337716 (bvmul lt!337715 lt!337714))))

(assert (=> d!72315 (or (= lt!337715 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!337714 (bvsdiv (bvmul lt!337715 lt!337714) lt!337715)))))

(assert (=> d!72315 (= lt!337714 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72315 (= lt!337715 ((_ sign_extend 32) (size!4633 (buf!5165 (_1!9795 lt!337158)))))))

(assert (=> d!72315 (= lt!337713 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9737 (_1!9795 lt!337158))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9732 (_1!9795 lt!337158)))))))

(assert (=> d!72315 (invariant!0 (currentBit!9732 (_1!9795 lt!337158)) (currentByte!9737 (_1!9795 lt!337158)) (size!4633 (buf!5165 (_1!9795 lt!337158))))))

(assert (=> d!72315 (= (bitIndex!0 (size!4633 (buf!5165 (_1!9795 lt!337158))) (currentByte!9737 (_1!9795 lt!337158)) (currentBit!9732 (_1!9795 lt!337158))) lt!337713)))

(declare-fun b!213845 () Bool)

(declare-fun res!179738 () Bool)

(assert (=> b!213845 (=> (not res!179738) (not e!145621))))

(assert (=> b!213845 (= res!179738 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!337713))))

(declare-fun b!213846 () Bool)

(declare-fun lt!337717 () (_ BitVec 64))

(assert (=> b!213846 (= e!145621 (bvsle lt!337713 (bvmul lt!337717 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!213846 (or (= lt!337717 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!337717 #b0000000000000000000000000000000000000000000000000000000000001000) lt!337717)))))

(assert (=> b!213846 (= lt!337717 ((_ sign_extend 32) (size!4633 (buf!5165 (_1!9795 lt!337158)))))))

(assert (= (and d!72315 res!179739) b!213845))

(assert (= (and b!213845 res!179738) b!213846))

(declare-fun m!329629 () Bool)

(assert (=> d!72315 m!329629))

(declare-fun m!329631 () Bool)

(assert (=> d!72315 m!329631))

(assert (=> b!213572 d!72315))

(declare-fun d!72317 () Bool)

(declare-fun lt!337719 () tuple2!18308)

(assert (=> d!72317 (= lt!337719 (readBit!0 lt!337147))))

(assert (=> d!72317 (= (readBitPure!0 lt!337147) (tuple2!18281 (_2!9809 lt!337719) (_1!9809 lt!337719)))))

(declare-fun bs!17732 () Bool)

(assert (= bs!17732 d!72317))

(declare-fun m!329633 () Bool)

(assert (=> bs!17732 m!329633))

(assert (=> b!213572 d!72317))

(declare-fun d!72319 () Bool)

(declare-fun lt!337720 () tuple2!18308)

(assert (=> d!72319 (= lt!337720 (readBit!0 (BitStream!8375 (buf!5165 (_2!9794 lt!337152)) (currentByte!9737 thiss!1204) (currentBit!9732 thiss!1204))))))

(assert (=> d!72319 (= (readBitPure!0 (BitStream!8375 (buf!5165 (_2!9794 lt!337152)) (currentByte!9737 thiss!1204) (currentBit!9732 thiss!1204))) (tuple2!18281 (_2!9809 lt!337720) (_1!9809 lt!337720)))))

(declare-fun bs!17733 () Bool)

(assert (= bs!17733 d!72319))

(declare-fun m!329635 () Bool)

(assert (=> bs!17733 m!329635))

(assert (=> b!213572 d!72319))

(declare-fun d!72321 () Bool)

(assert (=> d!72321 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4633 (buf!5165 (_2!9794 lt!337152)))) ((_ sign_extend 32) (currentByte!9737 (_2!9794 lt!337166))) ((_ sign_extend 32) (currentBit!9732 (_2!9794 lt!337166))) lt!337151) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4633 (buf!5165 (_2!9794 lt!337152)))) ((_ sign_extend 32) (currentByte!9737 (_2!9794 lt!337166))) ((_ sign_extend 32) (currentBit!9732 (_2!9794 lt!337166)))) lt!337151))))

(declare-fun bs!17734 () Bool)

(assert (= bs!17734 d!72321))

(declare-fun m!329637 () Bool)

(assert (=> bs!17734 m!329637))

(assert (=> b!213572 d!72321))

(declare-fun d!72323 () Bool)

(assert (=> d!72323 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!213572 d!72323))

(declare-fun d!72325 () Bool)

(declare-fun e!145622 () Bool)

(assert (=> d!72325 e!145622))

(declare-fun res!179741 () Bool)

(assert (=> d!72325 (=> (not res!179741) (not e!145622))))

(declare-fun lt!337726 () (_ BitVec 64))

(declare-fun lt!337724 () (_ BitVec 64))

(declare-fun lt!337721 () (_ BitVec 64))

(assert (=> d!72325 (= res!179741 (= lt!337721 (bvsub lt!337724 lt!337726)))))

(assert (=> d!72325 (or (= (bvand lt!337724 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!337726 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!337724 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!337724 lt!337726) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72325 (= lt!337726 (remainingBits!0 ((_ sign_extend 32) (size!4633 (buf!5165 (_2!9794 lt!337166)))) ((_ sign_extend 32) (currentByte!9737 (_2!9794 lt!337166))) ((_ sign_extend 32) (currentBit!9732 (_2!9794 lt!337166)))))))

(declare-fun lt!337723 () (_ BitVec 64))

(declare-fun lt!337722 () (_ BitVec 64))

(assert (=> d!72325 (= lt!337724 (bvmul lt!337723 lt!337722))))

(assert (=> d!72325 (or (= lt!337723 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!337722 (bvsdiv (bvmul lt!337723 lt!337722) lt!337723)))))

(assert (=> d!72325 (= lt!337722 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72325 (= lt!337723 ((_ sign_extend 32) (size!4633 (buf!5165 (_2!9794 lt!337166)))))))

(assert (=> d!72325 (= lt!337721 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9737 (_2!9794 lt!337166))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9732 (_2!9794 lt!337166)))))))

(assert (=> d!72325 (invariant!0 (currentBit!9732 (_2!9794 lt!337166)) (currentByte!9737 (_2!9794 lt!337166)) (size!4633 (buf!5165 (_2!9794 lt!337166))))))

(assert (=> d!72325 (= (bitIndex!0 (size!4633 (buf!5165 (_2!9794 lt!337166))) (currentByte!9737 (_2!9794 lt!337166)) (currentBit!9732 (_2!9794 lt!337166))) lt!337721)))

(declare-fun b!213847 () Bool)

(declare-fun res!179740 () Bool)

(assert (=> b!213847 (=> (not res!179740) (not e!145622))))

(assert (=> b!213847 (= res!179740 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!337721))))

(declare-fun b!213848 () Bool)

(declare-fun lt!337725 () (_ BitVec 64))

(assert (=> b!213848 (= e!145622 (bvsle lt!337721 (bvmul lt!337725 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!213848 (or (= lt!337725 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!337725 #b0000000000000000000000000000000000000000000000000000000000001000) lt!337725)))))

(assert (=> b!213848 (= lt!337725 ((_ sign_extend 32) (size!4633 (buf!5165 (_2!9794 lt!337166)))))))

(assert (= (and d!72325 res!179741) b!213847))

(assert (= (and b!213847 res!179740) b!213848))

(declare-fun m!329639 () Bool)

(assert (=> d!72325 m!329639))

(declare-fun m!329641 () Bool)

(assert (=> d!72325 m!329641))

(assert (=> b!213573 d!72325))

(declare-fun d!72327 () Bool)

(declare-fun e!145623 () Bool)

(assert (=> d!72327 e!145623))

(declare-fun res!179743 () Bool)

(assert (=> d!72327 (=> (not res!179743) (not e!145623))))

(declare-fun lt!337733 () (_ BitVec 64))

(declare-fun lt!337730 () (_ BitVec 64))

(declare-fun lt!337735 () (_ BitVec 64))

(assert (=> d!72327 (= res!179743 (= lt!337730 (bvsub lt!337733 lt!337735)))))

(assert (=> d!72327 (or (= (bvand lt!337733 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!337735 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!337733 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!337733 lt!337735) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72327 (= lt!337735 (remainingBits!0 ((_ sign_extend 32) (size!4633 (buf!5165 thiss!1204))) ((_ sign_extend 32) (currentByte!9737 thiss!1204)) ((_ sign_extend 32) (currentBit!9732 thiss!1204))))))

(declare-fun lt!337732 () (_ BitVec 64))

(declare-fun lt!337731 () (_ BitVec 64))

(assert (=> d!72327 (= lt!337733 (bvmul lt!337732 lt!337731))))

(assert (=> d!72327 (or (= lt!337732 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!337731 (bvsdiv (bvmul lt!337732 lt!337731) lt!337732)))))

(assert (=> d!72327 (= lt!337731 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72327 (= lt!337732 ((_ sign_extend 32) (size!4633 (buf!5165 thiss!1204))))))

(assert (=> d!72327 (= lt!337730 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9737 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9732 thiss!1204))))))

(assert (=> d!72327 (invariant!0 (currentBit!9732 thiss!1204) (currentByte!9737 thiss!1204) (size!4633 (buf!5165 thiss!1204)))))

(assert (=> d!72327 (= (bitIndex!0 (size!4633 (buf!5165 thiss!1204)) (currentByte!9737 thiss!1204) (currentBit!9732 thiss!1204)) lt!337730)))

(declare-fun b!213849 () Bool)

(declare-fun res!179742 () Bool)

(assert (=> b!213849 (=> (not res!179742) (not e!145623))))

(assert (=> b!213849 (= res!179742 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!337730))))

(declare-fun b!213850 () Bool)

(declare-fun lt!337734 () (_ BitVec 64))

(assert (=> b!213850 (= e!145623 (bvsle lt!337730 (bvmul lt!337734 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!213850 (or (= lt!337734 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!337734 #b0000000000000000000000000000000000000000000000000000000000001000) lt!337734)))))

(assert (=> b!213850 (= lt!337734 ((_ sign_extend 32) (size!4633 (buf!5165 thiss!1204))))))

(assert (= (and d!72327 res!179743) b!213849))

(assert (= (and b!213849 res!179742) b!213850))

(assert (=> d!72327 m!329513))

(assert (=> d!72327 m!329159))

(assert (=> b!213573 d!72327))

(declare-fun d!72331 () Bool)

(declare-fun e!145624 () Bool)

(assert (=> d!72331 e!145624))

(declare-fun res!179745 () Bool)

(assert (=> d!72331 (=> (not res!179745) (not e!145624))))

(declare-fun lt!337739 () (_ BitVec 64))

(declare-fun lt!337741 () (_ BitVec 64))

(declare-fun lt!337736 () (_ BitVec 64))

(assert (=> d!72331 (= res!179745 (= lt!337736 (bvsub lt!337739 lt!337741)))))

(assert (=> d!72331 (or (= (bvand lt!337739 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!337741 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!337739 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!337739 lt!337741) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72331 (= lt!337741 (remainingBits!0 ((_ sign_extend 32) (size!4633 (buf!5165 (_2!9794 lt!337152)))) ((_ sign_extend 32) (currentByte!9737 (_2!9794 lt!337152))) ((_ sign_extend 32) (currentBit!9732 (_2!9794 lt!337152)))))))

(declare-fun lt!337738 () (_ BitVec 64))

(declare-fun lt!337737 () (_ BitVec 64))

(assert (=> d!72331 (= lt!337739 (bvmul lt!337738 lt!337737))))

(assert (=> d!72331 (or (= lt!337738 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!337737 (bvsdiv (bvmul lt!337738 lt!337737) lt!337738)))))

(assert (=> d!72331 (= lt!337737 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72331 (= lt!337738 ((_ sign_extend 32) (size!4633 (buf!5165 (_2!9794 lt!337152)))))))

(assert (=> d!72331 (= lt!337736 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9737 (_2!9794 lt!337152))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9732 (_2!9794 lt!337152)))))))

(assert (=> d!72331 (invariant!0 (currentBit!9732 (_2!9794 lt!337152)) (currentByte!9737 (_2!9794 lt!337152)) (size!4633 (buf!5165 (_2!9794 lt!337152))))))

(assert (=> d!72331 (= (bitIndex!0 (size!4633 (buf!5165 (_2!9794 lt!337152))) (currentByte!9737 (_2!9794 lt!337152)) (currentBit!9732 (_2!9794 lt!337152))) lt!337736)))

(declare-fun b!213851 () Bool)

(declare-fun res!179744 () Bool)

(assert (=> b!213851 (=> (not res!179744) (not e!145624))))

(assert (=> b!213851 (= res!179744 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!337736))))

(declare-fun b!213852 () Bool)

(declare-fun lt!337740 () (_ BitVec 64))

(assert (=> b!213852 (= e!145624 (bvsle lt!337736 (bvmul lt!337740 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!213852 (or (= lt!337740 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!337740 #b0000000000000000000000000000000000000000000000000000000000001000) lt!337740)))))

(assert (=> b!213852 (= lt!337740 ((_ sign_extend 32) (size!4633 (buf!5165 (_2!9794 lt!337152)))))))

(assert (= (and d!72331 res!179745) b!213851))

(assert (= (and b!213851 res!179744) b!213852))

(declare-fun m!329645 () Bool)

(assert (=> d!72331 m!329645))

(assert (=> d!72331 m!329135))

(assert (=> b!213560 d!72331))

(declare-fun d!72333 () Bool)

(declare-fun res!179752 () Bool)

(declare-fun e!145630 () Bool)

(assert (=> d!72333 (=> (not res!179752) (not e!145630))))

(assert (=> d!72333 (= res!179752 (= (size!4633 (buf!5165 thiss!1204)) (size!4633 (buf!5165 (_2!9794 lt!337152)))))))

(assert (=> d!72333 (= (isPrefixOf!0 thiss!1204 (_2!9794 lt!337152)) e!145630)))

(declare-fun b!213859 () Bool)

(declare-fun res!179754 () Bool)

(assert (=> b!213859 (=> (not res!179754) (not e!145630))))

(assert (=> b!213859 (= res!179754 (bvsle (bitIndex!0 (size!4633 (buf!5165 thiss!1204)) (currentByte!9737 thiss!1204) (currentBit!9732 thiss!1204)) (bitIndex!0 (size!4633 (buf!5165 (_2!9794 lt!337152))) (currentByte!9737 (_2!9794 lt!337152)) (currentBit!9732 (_2!9794 lt!337152)))))))

(declare-fun b!213860 () Bool)

(declare-fun e!145629 () Bool)

(assert (=> b!213860 (= e!145630 e!145629)))

(declare-fun res!179753 () Bool)

(assert (=> b!213860 (=> res!179753 e!145629)))

(assert (=> b!213860 (= res!179753 (= (size!4633 (buf!5165 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!213861 () Bool)

(assert (=> b!213861 (= e!145629 (arrayBitRangesEq!0 (buf!5165 thiss!1204) (buf!5165 (_2!9794 lt!337152)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4633 (buf!5165 thiss!1204)) (currentByte!9737 thiss!1204) (currentBit!9732 thiss!1204))))))

(assert (= (and d!72333 res!179752) b!213859))

(assert (= (and b!213859 res!179754) b!213860))

(assert (= (and b!213860 (not res!179753)) b!213861))

(assert (=> b!213859 m!329163))

(assert (=> b!213859 m!329149))

(assert (=> b!213861 m!329163))

(assert (=> b!213861 m!329163))

(declare-fun m!329647 () Bool)

(assert (=> b!213861 m!329647))

(assert (=> b!213560 d!72333))

(declare-fun d!72335 () Bool)

(assert (=> d!72335 (isPrefixOf!0 thiss!1204 (_2!9794 lt!337152))))

(declare-fun lt!337744 () Unit!15211)

(declare-fun choose!30 (BitStream!8374 BitStream!8374 BitStream!8374) Unit!15211)

(assert (=> d!72335 (= lt!337744 (choose!30 thiss!1204 (_2!9794 lt!337166) (_2!9794 lt!337152)))))

(assert (=> d!72335 (isPrefixOf!0 thiss!1204 (_2!9794 lt!337166))))

(assert (=> d!72335 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9794 lt!337166) (_2!9794 lt!337152)) lt!337744)))

(declare-fun bs!17736 () Bool)

(assert (= bs!17736 d!72335))

(assert (=> bs!17736 m!329151))

(declare-fun m!329649 () Bool)

(assert (=> bs!17736 m!329649))

(assert (=> bs!17736 m!329137))

(assert (=> b!213560 d!72335))

(declare-fun b!213966 () Bool)

(declare-fun e!145694 () (_ BitVec 64))

(assert (=> b!213966 (= e!145694 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!213967 () Bool)

(declare-fun e!145698 () Bool)

(declare-fun lt!338104 () (_ BitVec 64))

(assert (=> b!213967 (= e!145698 (validate_offset_bits!1 ((_ sign_extend 32) (size!4633 (buf!5165 (_2!9794 lt!337166)))) ((_ sign_extend 32) (currentByte!9737 (_2!9794 lt!337166))) ((_ sign_extend 32) (currentBit!9732 (_2!9794 lt!337166))) lt!338104))))

(declare-fun d!72337 () Bool)

(declare-fun e!145696 () Bool)

(assert (=> d!72337 e!145696))

(declare-fun res!179839 () Bool)

(assert (=> d!72337 (=> (not res!179839) (not e!145696))))

(declare-fun lt!338099 () tuple2!18278)

(assert (=> d!72337 (= res!179839 (invariant!0 (currentBit!9732 (_2!9794 lt!338099)) (currentByte!9737 (_2!9794 lt!338099)) (size!4633 (buf!5165 (_2!9794 lt!338099)))))))

(declare-fun e!145693 () tuple2!18278)

(assert (=> d!72337 (= lt!338099 e!145693)))

(declare-fun c!10498 () Bool)

(assert (=> d!72337 (= c!10498 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!72337 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!72337 (= (appendBitsLSBFirstLoopTR!0 (_2!9794 lt!337166) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!338099)))

(declare-fun b!213968 () Bool)

(declare-fun e!145690 () Bool)

(declare-fun lt!338089 () tuple2!18284)

(declare-fun lt!338086 () tuple2!18282)

(assert (=> b!213968 (= e!145690 (= (_1!9797 lt!338089) (_2!9796 lt!338086)))))

(declare-fun b!213969 () Bool)

(declare-fun e!145695 () Bool)

(declare-fun lt!338085 () tuple2!18284)

(declare-fun lt!338091 () tuple2!18282)

(assert (=> b!213969 (= e!145695 (= (_1!9797 lt!338085) (_2!9796 lt!338091)))))

(declare-fun b!213970 () Bool)

(declare-fun e!145691 () Bool)

(declare-fun lt!338125 () tuple2!18280)

(declare-fun lt!338083 () tuple2!18278)

(assert (=> b!213970 (= e!145691 (= (bitIndex!0 (size!4633 (buf!5165 (_1!9795 lt!338125))) (currentByte!9737 (_1!9795 lt!338125)) (currentBit!9732 (_1!9795 lt!338125))) (bitIndex!0 (size!4633 (buf!5165 (_2!9794 lt!338083))) (currentByte!9737 (_2!9794 lt!338083)) (currentBit!9732 (_2!9794 lt!338083)))))))

(declare-fun b!213971 () Bool)

(declare-fun res!179840 () Bool)

(assert (=> b!213971 (= res!179840 (= (bitIndex!0 (size!4633 (buf!5165 (_2!9794 lt!338083))) (currentByte!9737 (_2!9794 lt!338083)) (currentBit!9732 (_2!9794 lt!338083))) (bvadd (bitIndex!0 (size!4633 (buf!5165 (_2!9794 lt!337166))) (currentByte!9737 (_2!9794 lt!337166)) (currentBit!9732 (_2!9794 lt!337166))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun e!145692 () Bool)

(assert (=> b!213971 (=> (not res!179840) (not e!145692))))

(declare-fun b!213972 () Bool)

(declare-fun res!179850 () Bool)

(assert (=> b!213972 (=> (not res!179850) (not e!145696))))

(assert (=> b!213972 (= res!179850 (= (size!4633 (buf!5165 (_2!9794 lt!337166))) (size!4633 (buf!5165 (_2!9794 lt!338099)))))))

(declare-fun b!213973 () Bool)

(declare-fun e!145697 () Bool)

(declare-fun lt!338115 () tuple2!18280)

(declare-fun lt!338071 () tuple2!18280)

(assert (=> b!213973 (= e!145697 (= (_2!9795 lt!338115) (_2!9795 lt!338071)))))

(declare-fun b!213974 () Bool)

(assert (=> b!213974 (= lt!338125 (readBitPure!0 (readerFrom!0 (_2!9794 lt!338083) (currentBit!9732 (_2!9794 lt!337166)) (currentByte!9737 (_2!9794 lt!337166)))))))

(declare-fun lt!338110 () Bool)

(declare-fun res!179848 () Bool)

(assert (=> b!213974 (= res!179848 (and (= (_2!9795 lt!338125) lt!338110) (= (_1!9795 lt!338125) (_2!9794 lt!338083))))))

(assert (=> b!213974 (=> (not res!179848) (not e!145691))))

(assert (=> b!213974 (= e!145692 e!145691)))

(declare-fun b!213975 () Bool)

(declare-fun res!179843 () Bool)

(assert (=> b!213975 (=> (not res!179843) (not e!145696))))

(declare-fun lt!338120 () (_ BitVec 64))

(declare-fun lt!338080 () (_ BitVec 64))

(assert (=> b!213975 (= res!179843 (= (bitIndex!0 (size!4633 (buf!5165 (_2!9794 lt!338099))) (currentByte!9737 (_2!9794 lt!338099)) (currentBit!9732 (_2!9794 lt!338099))) (bvsub lt!338080 lt!338120)))))

(assert (=> b!213975 (or (= (bvand lt!338080 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!338120 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!338080 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!338080 lt!338120) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!213975 (= lt!338120 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!338114 () (_ BitVec 64))

(declare-fun lt!338094 () (_ BitVec 64))

(assert (=> b!213975 (= lt!338080 (bvadd lt!338114 lt!338094))))

(assert (=> b!213975 (or (not (= (bvand lt!338114 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!338094 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!338114 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!338114 lt!338094) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!213975 (= lt!338094 ((_ sign_extend 32) nBits!348))))

(assert (=> b!213975 (= lt!338114 (bitIndex!0 (size!4633 (buf!5165 (_2!9794 lt!337166))) (currentByte!9737 (_2!9794 lt!337166)) (currentBit!9732 (_2!9794 lt!337166))))))

(declare-fun b!213976 () Bool)

(declare-fun Unit!15232 () Unit!15211)

(assert (=> b!213976 (= e!145693 (tuple2!18279 Unit!15232 (_2!9794 lt!337166)))))

(declare-fun lt!338097 () Unit!15211)

(assert (=> b!213976 (= lt!338097 (lemmaIsPrefixRefl!0 (_2!9794 lt!337166)))))

(declare-fun call!3357 () Bool)

(assert (=> b!213976 call!3357))

(declare-fun lt!338087 () Unit!15211)

(assert (=> b!213976 (= lt!338087 lt!338097)))

(declare-fun lt!338073 () tuple2!18278)

(declare-fun bm!3354 () Bool)

(assert (=> bm!3354 (= call!3357 (isPrefixOf!0 (_2!9794 lt!337166) (ite c!10498 (_2!9794 lt!337166) (_2!9794 lt!338073))))))

(declare-fun b!213977 () Bool)

(declare-fun res!179844 () Bool)

(assert (=> b!213977 (= res!179844 (isPrefixOf!0 (_2!9794 lt!337166) (_2!9794 lt!338083)))))

(assert (=> b!213977 (=> (not res!179844) (not e!145692))))

(declare-fun b!213978 () Bool)

(assert (=> b!213978 (= e!145694 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!213979 () Bool)

(assert (=> b!213979 (= e!145696 e!145690)))

(declare-fun res!179847 () Bool)

(assert (=> b!213979 (=> (not res!179847) (not e!145690))))

(assert (=> b!213979 (= res!179847 (= (_2!9797 lt!338089) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!213979 (= lt!338089 (readNBitsLSBFirstsLoopPure!0 (_1!9796 lt!338086) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!338111 () Unit!15211)

(declare-fun lt!338093 () Unit!15211)

(assert (=> b!213979 (= lt!338111 lt!338093)))

(assert (=> b!213979 (validate_offset_bits!1 ((_ sign_extend 32) (size!4633 (buf!5165 (_2!9794 lt!338099)))) ((_ sign_extend 32) (currentByte!9737 (_2!9794 lt!337166))) ((_ sign_extend 32) (currentBit!9732 (_2!9794 lt!337166))) lt!338104)))

(assert (=> b!213979 (= lt!338093 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9794 lt!337166) (buf!5165 (_2!9794 lt!338099)) lt!338104))))

(assert (=> b!213979 e!145698))

(declare-fun res!179846 () Bool)

(assert (=> b!213979 (=> (not res!179846) (not e!145698))))

(assert (=> b!213979 (= res!179846 (and (= (size!4633 (buf!5165 (_2!9794 lt!337166))) (size!4633 (buf!5165 (_2!9794 lt!338099)))) (bvsge lt!338104 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!213979 (= lt!338104 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!213979 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!213979 (= lt!338086 (reader!0 (_2!9794 lt!337166) (_2!9794 lt!338099)))))

(declare-fun b!213980 () Bool)

(assert (=> b!213980 (= e!145693 (tuple2!18279 (_1!9794 lt!338073) (_2!9794 lt!338073)))))

(assert (=> b!213980 (= lt!338110 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!213980 (= lt!338083 (appendBit!0 (_2!9794 lt!337166) lt!338110))))

(declare-fun res!179841 () Bool)

(assert (=> b!213980 (= res!179841 (= (size!4633 (buf!5165 (_2!9794 lt!337166))) (size!4633 (buf!5165 (_2!9794 lt!338083)))))))

(assert (=> b!213980 (=> (not res!179841) (not e!145692))))

(assert (=> b!213980 e!145692))

(declare-fun lt!338095 () tuple2!18278)

(assert (=> b!213980 (= lt!338095 lt!338083)))

(assert (=> b!213980 (= lt!338073 (appendBitsLSBFirstLoopTR!0 (_2!9794 lt!338095) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!338103 () Unit!15211)

(assert (=> b!213980 (= lt!338103 (lemmaIsPrefixTransitive!0 (_2!9794 lt!337166) (_2!9794 lt!338095) (_2!9794 lt!338073)))))

(assert (=> b!213980 call!3357))

(declare-fun lt!338090 () Unit!15211)

(assert (=> b!213980 (= lt!338090 lt!338103)))

(assert (=> b!213980 (invariant!0 (currentBit!9732 (_2!9794 lt!337166)) (currentByte!9737 (_2!9794 lt!337166)) (size!4633 (buf!5165 (_2!9794 lt!338095))))))

(declare-fun lt!338088 () BitStream!8374)

(assert (=> b!213980 (= lt!338088 (BitStream!8375 (buf!5165 (_2!9794 lt!338095)) (currentByte!9737 (_2!9794 lt!337166)) (currentBit!9732 (_2!9794 lt!337166))))))

(assert (=> b!213980 (invariant!0 (currentBit!9732 lt!338088) (currentByte!9737 lt!338088) (size!4633 (buf!5165 (_2!9794 lt!338073))))))

(declare-fun lt!338076 () BitStream!8374)

(assert (=> b!213980 (= lt!338076 (BitStream!8375 (buf!5165 (_2!9794 lt!338073)) (currentByte!9737 lt!338088) (currentBit!9732 lt!338088)))))

(assert (=> b!213980 (= lt!338115 (readBitPure!0 lt!338088))))

(assert (=> b!213980 (= lt!338071 (readBitPure!0 lt!338076))))

(declare-fun lt!338096 () Unit!15211)

(assert (=> b!213980 (= lt!338096 (readBitPrefixLemma!0 lt!338088 (_2!9794 lt!338073)))))

(declare-fun res!179845 () Bool)

(assert (=> b!213980 (= res!179845 (= (bitIndex!0 (size!4633 (buf!5165 (_1!9795 lt!338115))) (currentByte!9737 (_1!9795 lt!338115)) (currentBit!9732 (_1!9795 lt!338115))) (bitIndex!0 (size!4633 (buf!5165 (_1!9795 lt!338071))) (currentByte!9737 (_1!9795 lt!338071)) (currentBit!9732 (_1!9795 lt!338071)))))))

(assert (=> b!213980 (=> (not res!179845) (not e!145697))))

(assert (=> b!213980 e!145697))

(declare-fun lt!338092 () Unit!15211)

(assert (=> b!213980 (= lt!338092 lt!338096)))

(declare-fun lt!338081 () tuple2!18282)

(assert (=> b!213980 (= lt!338081 (reader!0 (_2!9794 lt!337166) (_2!9794 lt!338073)))))

(declare-fun lt!338106 () tuple2!18282)

(assert (=> b!213980 (= lt!338106 (reader!0 (_2!9794 lt!338095) (_2!9794 lt!338073)))))

(declare-fun lt!338124 () tuple2!18280)

(assert (=> b!213980 (= lt!338124 (readBitPure!0 (_1!9796 lt!338081)))))

(assert (=> b!213980 (= (_2!9795 lt!338124) lt!338110)))

(declare-fun lt!338101 () Unit!15211)

(declare-fun Unit!15233 () Unit!15211)

(assert (=> b!213980 (= lt!338101 Unit!15233)))

(declare-fun lt!338112 () (_ BitVec 64))

(assert (=> b!213980 (= lt!338112 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!338126 () (_ BitVec 64))

(assert (=> b!213980 (= lt!338126 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!338098 () Unit!15211)

(assert (=> b!213980 (= lt!338098 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9794 lt!337166) (buf!5165 (_2!9794 lt!338073)) lt!338126))))

(assert (=> b!213980 (validate_offset_bits!1 ((_ sign_extend 32) (size!4633 (buf!5165 (_2!9794 lt!338073)))) ((_ sign_extend 32) (currentByte!9737 (_2!9794 lt!337166))) ((_ sign_extend 32) (currentBit!9732 (_2!9794 lt!337166))) lt!338126)))

(declare-fun lt!338084 () Unit!15211)

(assert (=> b!213980 (= lt!338084 lt!338098)))

(declare-fun lt!338105 () tuple2!18284)

(assert (=> b!213980 (= lt!338105 (readNBitsLSBFirstsLoopPure!0 (_1!9796 lt!338081) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!338112))))

(declare-fun lt!338113 () (_ BitVec 64))

(assert (=> b!213980 (= lt!338113 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!338108 () Unit!15211)

(assert (=> b!213980 (= lt!338108 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9794 lt!338095) (buf!5165 (_2!9794 lt!338073)) lt!338113))))

(assert (=> b!213980 (validate_offset_bits!1 ((_ sign_extend 32) (size!4633 (buf!5165 (_2!9794 lt!338073)))) ((_ sign_extend 32) (currentByte!9737 (_2!9794 lt!338095))) ((_ sign_extend 32) (currentBit!9732 (_2!9794 lt!338095))) lt!338113)))

(declare-fun lt!338079 () Unit!15211)

(assert (=> b!213980 (= lt!338079 lt!338108)))

(declare-fun lt!338074 () tuple2!18284)

(assert (=> b!213980 (= lt!338074 (readNBitsLSBFirstsLoopPure!0 (_1!9796 lt!338106) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!338112 (ite (_2!9795 lt!338124) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!338075 () tuple2!18284)

(assert (=> b!213980 (= lt!338075 (readNBitsLSBFirstsLoopPure!0 (_1!9796 lt!338081) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!338112))))

(declare-fun c!10497 () Bool)

(assert (=> b!213980 (= c!10497 (_2!9795 (readBitPure!0 (_1!9796 lt!338081))))))

(declare-fun lt!338123 () tuple2!18284)

(assert (=> b!213980 (= lt!338123 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9796 lt!338081) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!338112 e!145694)))))

(declare-fun lt!338119 () Unit!15211)

(assert (=> b!213980 (= lt!338119 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9796 lt!338081) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!338112))))

(assert (=> b!213980 (and (= (_2!9797 lt!338075) (_2!9797 lt!338123)) (= (_1!9797 lt!338075) (_1!9797 lt!338123)))))

(declare-fun lt!338107 () Unit!15211)

(assert (=> b!213980 (= lt!338107 lt!338119)))

(assert (=> b!213980 (= (_1!9796 lt!338081) (withMovedBitIndex!0 (_2!9796 lt!338081) (bvsub (bitIndex!0 (size!4633 (buf!5165 (_2!9794 lt!337166))) (currentByte!9737 (_2!9794 lt!337166)) (currentBit!9732 (_2!9794 lt!337166))) (bitIndex!0 (size!4633 (buf!5165 (_2!9794 lt!338073))) (currentByte!9737 (_2!9794 lt!338073)) (currentBit!9732 (_2!9794 lt!338073))))))))

(declare-fun lt!338109 () Unit!15211)

(declare-fun Unit!15234 () Unit!15211)

(assert (=> b!213980 (= lt!338109 Unit!15234)))

(assert (=> b!213980 (= (_1!9796 lt!338106) (withMovedBitIndex!0 (_2!9796 lt!338106) (bvsub (bitIndex!0 (size!4633 (buf!5165 (_2!9794 lt!338095))) (currentByte!9737 (_2!9794 lt!338095)) (currentBit!9732 (_2!9794 lt!338095))) (bitIndex!0 (size!4633 (buf!5165 (_2!9794 lt!338073))) (currentByte!9737 (_2!9794 lt!338073)) (currentBit!9732 (_2!9794 lt!338073))))))))

(declare-fun lt!338102 () Unit!15211)

(declare-fun Unit!15235 () Unit!15211)

(assert (=> b!213980 (= lt!338102 Unit!15235)))

(assert (=> b!213980 (= (bitIndex!0 (size!4633 (buf!5165 (_2!9794 lt!337166))) (currentByte!9737 (_2!9794 lt!337166)) (currentBit!9732 (_2!9794 lt!337166))) (bvsub (bitIndex!0 (size!4633 (buf!5165 (_2!9794 lt!338095))) (currentByte!9737 (_2!9794 lt!338095)) (currentBit!9732 (_2!9794 lt!338095))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!338072 () Unit!15211)

(declare-fun Unit!15236 () Unit!15211)

(assert (=> b!213980 (= lt!338072 Unit!15236)))

(assert (=> b!213980 (= (_2!9797 lt!338105) (_2!9797 lt!338074))))

(declare-fun lt!338078 () Unit!15211)

(declare-fun Unit!15237 () Unit!15211)

(assert (=> b!213980 (= lt!338078 Unit!15237)))

(assert (=> b!213980 (invariant!0 (currentBit!9732 (_2!9794 lt!338073)) (currentByte!9737 (_2!9794 lt!338073)) (size!4633 (buf!5165 (_2!9794 lt!338073))))))

(declare-fun lt!338100 () Unit!15211)

(declare-fun Unit!15238 () Unit!15211)

(assert (=> b!213980 (= lt!338100 Unit!15238)))

(assert (=> b!213980 (= (size!4633 (buf!5165 (_2!9794 lt!337166))) (size!4633 (buf!5165 (_2!9794 lt!338073))))))

(declare-fun lt!338082 () Unit!15211)

(declare-fun Unit!15239 () Unit!15211)

(assert (=> b!213980 (= lt!338082 Unit!15239)))

(assert (=> b!213980 (= (bitIndex!0 (size!4633 (buf!5165 (_2!9794 lt!338073))) (currentByte!9737 (_2!9794 lt!338073)) (currentBit!9732 (_2!9794 lt!338073))) (bvsub (bvadd (bitIndex!0 (size!4633 (buf!5165 (_2!9794 lt!337166))) (currentByte!9737 (_2!9794 lt!337166)) (currentBit!9732 (_2!9794 lt!337166))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!338122 () Unit!15211)

(declare-fun Unit!15240 () Unit!15211)

(assert (=> b!213980 (= lt!338122 Unit!15240)))

(declare-fun lt!338118 () Unit!15211)

(declare-fun Unit!15241 () Unit!15211)

(assert (=> b!213980 (= lt!338118 Unit!15241)))

(assert (=> b!213980 (= lt!338091 (reader!0 (_2!9794 lt!337166) (_2!9794 lt!338073)))))

(declare-fun lt!338116 () (_ BitVec 64))

(assert (=> b!213980 (= lt!338116 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!338121 () Unit!15211)

(assert (=> b!213980 (= lt!338121 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9794 lt!337166) (buf!5165 (_2!9794 lt!338073)) lt!338116))))

(assert (=> b!213980 (validate_offset_bits!1 ((_ sign_extend 32) (size!4633 (buf!5165 (_2!9794 lt!338073)))) ((_ sign_extend 32) (currentByte!9737 (_2!9794 lt!337166))) ((_ sign_extend 32) (currentBit!9732 (_2!9794 lt!337166))) lt!338116)))

(declare-fun lt!338077 () Unit!15211)

(assert (=> b!213980 (= lt!338077 lt!338121)))

(assert (=> b!213980 (= lt!338085 (readNBitsLSBFirstsLoopPure!0 (_1!9796 lt!338091) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!179842 () Bool)

(assert (=> b!213980 (= res!179842 (= (_2!9797 lt!338085) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!213980 (=> (not res!179842) (not e!145695))))

(assert (=> b!213980 e!145695))

(declare-fun lt!338117 () Unit!15211)

(declare-fun Unit!15242 () Unit!15211)

(assert (=> b!213980 (= lt!338117 Unit!15242)))

(declare-fun b!213981 () Bool)

(declare-fun res!179849 () Bool)

(assert (=> b!213981 (=> (not res!179849) (not e!145696))))

(assert (=> b!213981 (= res!179849 (isPrefixOf!0 (_2!9794 lt!337166) (_2!9794 lt!338099)))))

(assert (= (and d!72337 c!10498) b!213976))

(assert (= (and d!72337 (not c!10498)) b!213980))

(assert (= (and b!213980 res!179841) b!213971))

(assert (= (and b!213971 res!179840) b!213977))

(assert (= (and b!213977 res!179844) b!213974))

(assert (= (and b!213974 res!179848) b!213970))

(assert (= (and b!213980 res!179845) b!213973))

(assert (= (and b!213980 c!10497) b!213978))

(assert (= (and b!213980 (not c!10497)) b!213966))

(assert (= (and b!213980 res!179842) b!213969))

(assert (= (or b!213976 b!213980) bm!3354))

(assert (= (and d!72337 res!179839) b!213972))

(assert (= (and b!213972 res!179850) b!213975))

(assert (= (and b!213975 res!179843) b!213981))

(assert (= (and b!213981 res!179849) b!213979))

(assert (= (and b!213979 res!179846) b!213967))

(assert (= (and b!213979 res!179847) b!213968))

(declare-fun m!329783 () Bool)

(assert (=> b!213981 m!329783))

(declare-fun m!329785 () Bool)

(assert (=> b!213970 m!329785))

(declare-fun m!329787 () Bool)

(assert (=> b!213970 m!329787))

(assert (=> b!213976 m!329545))

(declare-fun m!329789 () Bool)

(assert (=> b!213967 m!329789))

(declare-fun m!329791 () Bool)

(assert (=> b!213980 m!329791))

(declare-fun m!329793 () Bool)

(assert (=> b!213980 m!329793))

(declare-fun m!329795 () Bool)

(assert (=> b!213980 m!329795))

(declare-fun m!329797 () Bool)

(assert (=> b!213980 m!329797))

(declare-fun m!329799 () Bool)

(assert (=> b!213980 m!329799))

(declare-fun m!329801 () Bool)

(assert (=> b!213980 m!329801))

(declare-fun m!329803 () Bool)

(assert (=> b!213980 m!329803))

(declare-fun m!329805 () Bool)

(assert (=> b!213980 m!329805))

(declare-fun m!329807 () Bool)

(assert (=> b!213980 m!329807))

(declare-fun m!329809 () Bool)

(assert (=> b!213980 m!329809))

(declare-fun m!329811 () Bool)

(assert (=> b!213980 m!329811))

(declare-fun m!329813 () Bool)

(assert (=> b!213980 m!329813))

(declare-fun m!329815 () Bool)

(assert (=> b!213980 m!329815))

(declare-fun m!329817 () Bool)

(assert (=> b!213980 m!329817))

(declare-fun m!329819 () Bool)

(assert (=> b!213980 m!329819))

(declare-fun m!329821 () Bool)

(assert (=> b!213980 m!329821))

(assert (=> b!213980 m!329161))

(declare-fun m!329823 () Bool)

(assert (=> b!213980 m!329823))

(declare-fun m!329825 () Bool)

(assert (=> b!213980 m!329825))

(declare-fun m!329827 () Bool)

(assert (=> b!213980 m!329827))

(declare-fun m!329829 () Bool)

(assert (=> b!213980 m!329829))

(declare-fun m!329831 () Bool)

(assert (=> b!213980 m!329831))

(declare-fun m!329833 () Bool)

(assert (=> b!213980 m!329833))

(declare-fun m!329835 () Bool)

(assert (=> b!213980 m!329835))

(declare-fun m!329837 () Bool)

(assert (=> b!213980 m!329837))

(declare-fun m!329839 () Bool)

(assert (=> b!213980 m!329839))

(declare-fun m!329841 () Bool)

(assert (=> b!213980 m!329841))

(declare-fun m!329843 () Bool)

(assert (=> b!213980 m!329843))

(declare-fun m!329845 () Bool)

(assert (=> b!213980 m!329845))

(declare-fun m!329847 () Bool)

(assert (=> b!213980 m!329847))

(declare-fun m!329849 () Bool)

(assert (=> b!213980 m!329849))

(declare-fun m!329851 () Bool)

(assert (=> b!213980 m!329851))

(assert (=> b!213980 m!329791))

(declare-fun m!329853 () Bool)

(assert (=> b!213980 m!329853))

(assert (=> b!213971 m!329787))

(assert (=> b!213971 m!329161))

(declare-fun m!329855 () Bool)

(assert (=> d!72337 m!329855))

(declare-fun m!329857 () Bool)

(assert (=> b!213977 m!329857))

(declare-fun m!329859 () Bool)

(assert (=> bm!3354 m!329859))

(declare-fun m!329861 () Bool)

(assert (=> b!213975 m!329861))

(assert (=> b!213975 m!329161))

(assert (=> b!213979 m!329815))

(declare-fun m!329863 () Bool)

(assert (=> b!213979 m!329863))

(declare-fun m!329865 () Bool)

(assert (=> b!213979 m!329865))

(declare-fun m!329867 () Bool)

(assert (=> b!213979 m!329867))

(assert (=> b!213979 m!329801))

(declare-fun m!329869 () Bool)

(assert (=> b!213979 m!329869))

(declare-fun m!329871 () Bool)

(assert (=> b!213974 m!329871))

(assert (=> b!213974 m!329871))

(declare-fun m!329873 () Bool)

(assert (=> b!213974 m!329873))

(assert (=> b!213560 d!72337))

(declare-fun d!72367 () Bool)

(declare-fun res!179861 () Bool)

(declare-fun e!145708 () Bool)

(assert (=> d!72367 (=> (not res!179861) (not e!145708))))

(assert (=> d!72367 (= res!179861 (= (size!4633 (buf!5165 thiss!1204)) (size!4633 (buf!5165 (_2!9794 lt!337166)))))))

(assert (=> d!72367 (= (isPrefixOf!0 thiss!1204 (_2!9794 lt!337166)) e!145708)))

(declare-fun b!213996 () Bool)

(declare-fun res!179863 () Bool)

(assert (=> b!213996 (=> (not res!179863) (not e!145708))))

(assert (=> b!213996 (= res!179863 (bvsle (bitIndex!0 (size!4633 (buf!5165 thiss!1204)) (currentByte!9737 thiss!1204) (currentBit!9732 thiss!1204)) (bitIndex!0 (size!4633 (buf!5165 (_2!9794 lt!337166))) (currentByte!9737 (_2!9794 lt!337166)) (currentBit!9732 (_2!9794 lt!337166)))))))

(declare-fun b!213997 () Bool)

(declare-fun e!145707 () Bool)

(assert (=> b!213997 (= e!145708 e!145707)))

(declare-fun res!179862 () Bool)

(assert (=> b!213997 (=> res!179862 e!145707)))

(assert (=> b!213997 (= res!179862 (= (size!4633 (buf!5165 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!213998 () Bool)

(assert (=> b!213998 (= e!145707 (arrayBitRangesEq!0 (buf!5165 thiss!1204) (buf!5165 (_2!9794 lt!337166)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4633 (buf!5165 thiss!1204)) (currentByte!9737 thiss!1204) (currentBit!9732 thiss!1204))))))

(assert (= (and d!72367 res!179861) b!213996))

(assert (= (and b!213996 res!179863) b!213997))

(assert (= (and b!213997 (not res!179862)) b!213998))

(assert (=> b!213996 m!329163))

(assert (=> b!213996 m!329161))

(assert (=> b!213998 m!329163))

(assert (=> b!213998 m!329163))

(declare-fun m!329875 () Bool)

(assert (=> b!213998 m!329875))

(assert (=> b!213571 d!72367))

(declare-fun d!72369 () Bool)

(assert (=> d!72369 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9732 thiss!1204) (currentByte!9737 thiss!1204) (size!4633 (buf!5165 thiss!1204))))))

(declare-fun bs!17743 () Bool)

(assert (= bs!17743 d!72369))

(assert (=> bs!17743 m!329159))

(assert (=> start!44682 d!72369))

(declare-fun d!72371 () Bool)

(assert (=> d!72371 (= (array_inv!4374 (buf!5165 thiss!1204)) (bvsge (size!4633 (buf!5165 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!213559 d!72371))

(declare-fun d!72373 () Bool)

(declare-fun lt!338183 () tuple2!18308)

(assert (=> d!72373 (= lt!338183 (readBit!0 (readerFrom!0 (_2!9794 lt!337166) (currentBit!9732 thiss!1204) (currentByte!9737 thiss!1204))))))

(assert (=> d!72373 (= (readBitPure!0 (readerFrom!0 (_2!9794 lt!337166) (currentBit!9732 thiss!1204) (currentByte!9737 thiss!1204))) (tuple2!18281 (_2!9809 lt!338183) (_1!9809 lt!338183)))))

(declare-fun bs!17744 () Bool)

(assert (= bs!17744 d!72373))

(assert (=> bs!17744 m!329141))

(declare-fun m!329877 () Bool)

(assert (=> bs!17744 m!329877))

(assert (=> b!213558 d!72373))

(declare-fun d!72375 () Bool)

(declare-fun e!145713 () Bool)

(assert (=> d!72375 e!145713))

(declare-fun res!179867 () Bool)

(assert (=> d!72375 (=> (not res!179867) (not e!145713))))

(assert (=> d!72375 (= res!179867 (invariant!0 (currentBit!9732 (_2!9794 lt!337166)) (currentByte!9737 (_2!9794 lt!337166)) (size!4633 (buf!5165 (_2!9794 lt!337166)))))))

(assert (=> d!72375 (= (readerFrom!0 (_2!9794 lt!337166) (currentBit!9732 thiss!1204) (currentByte!9737 thiss!1204)) (BitStream!8375 (buf!5165 (_2!9794 lt!337166)) (currentByte!9737 thiss!1204) (currentBit!9732 thiss!1204)))))

(declare-fun b!214005 () Bool)

(assert (=> b!214005 (= e!145713 (invariant!0 (currentBit!9732 thiss!1204) (currentByte!9737 thiss!1204) (size!4633 (buf!5165 (_2!9794 lt!337166)))))))

(assert (= (and d!72375 res!179867) b!214005))

(assert (=> d!72375 m!329641))

(assert (=> b!214005 m!329193))

(assert (=> b!213558 d!72375))

(declare-fun d!72377 () Bool)

(declare-fun lt!338256 () tuple2!18284)

(declare-fun lt!338254 () tuple2!18284)

(assert (=> d!72377 (and (= (_2!9797 lt!338256) (_2!9797 lt!338254)) (= (_1!9797 lt!338256) (_1!9797 lt!338254)))))

(declare-fun lt!338257 () BitStream!8374)

(declare-fun lt!338252 () Unit!15211)

(declare-fun lt!338255 () Bool)

(declare-fun lt!338253 () (_ BitVec 64))

(declare-fun choose!56 (BitStream!8374 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!18284 tuple2!18284 BitStream!8374 (_ BitVec 64) Bool BitStream!8374 (_ BitVec 64) tuple2!18284 tuple2!18284 BitStream!8374 (_ BitVec 64)) Unit!15211)

(assert (=> d!72377 (= lt!338252 (choose!56 (_1!9796 lt!337150) nBits!348 i!590 lt!337174 lt!338256 (tuple2!18285 (_1!9797 lt!338256) (_2!9797 lt!338256)) (_1!9797 lt!338256) (_2!9797 lt!338256) lt!338255 lt!338257 lt!338253 lt!338254 (tuple2!18285 (_1!9797 lt!338254) (_2!9797 lt!338254)) (_1!9797 lt!338254) (_2!9797 lt!338254)))))

(assert (=> d!72377 (= lt!338254 (readNBitsLSBFirstsLoopPure!0 lt!338257 nBits!348 (bvadd i!590 #b00000000000000000000000000000001) lt!338253))))

(assert (=> d!72377 (= lt!338253 (bvor lt!337174 (ite lt!338255 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72377 (= lt!338257 (withMovedBitIndex!0 (_1!9796 lt!337150) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!72377 (= lt!338255 (_2!9795 (readBitPure!0 (_1!9796 lt!337150))))))

(assert (=> d!72377 (= lt!338256 (readNBitsLSBFirstsLoopPure!0 (_1!9796 lt!337150) nBits!348 i!590 lt!337174))))

(assert (=> d!72377 (= (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9796 lt!337150) nBits!348 i!590 lt!337174) lt!338252)))

(declare-fun bs!17746 () Bool)

(assert (= bs!17746 d!72377))

(declare-fun m!329879 () Bool)

(assert (=> bs!17746 m!329879))

(assert (=> bs!17746 m!329171))

(assert (=> bs!17746 m!329175))

(assert (=> bs!17746 m!329203))

(declare-fun m!329881 () Bool)

(assert (=> bs!17746 m!329881))

(assert (=> b!213569 d!72377))

(declare-fun d!72379 () Bool)

(declare-fun lt!338258 () tuple2!18306)

(assert (=> d!72379 (= lt!338258 (readNBitsLSBFirstsLoop!0 lt!337144 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!337167))))

(assert (=> d!72379 (= (readNBitsLSBFirstsLoopPure!0 lt!337144 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!337167) (tuple2!18285 (_2!9808 lt!338258) (_1!9808 lt!338258)))))

(declare-fun bs!17747 () Bool)

(assert (= bs!17747 d!72379))

(declare-fun m!329883 () Bool)

(assert (=> bs!17747 m!329883))

(assert (=> b!213569 d!72379))

(declare-fun d!72381 () Bool)

(declare-fun e!145722 () Bool)

(assert (=> d!72381 e!145722))

(declare-fun res!179882 () Bool)

(assert (=> d!72381 (=> (not res!179882) (not e!145722))))

(declare-fun lt!338260 () (_ BitVec 64))

(declare-fun lt!338259 () BitStream!8374)

(assert (=> d!72381 (= res!179882 (= (bvadd lt!338260 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4633 (buf!5165 lt!338259)) (currentByte!9737 lt!338259) (currentBit!9732 lt!338259))))))

(assert (=> d!72381 (or (not (= (bvand lt!338260 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!338260 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!338260 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72381 (= lt!338260 (bitIndex!0 (size!4633 (buf!5165 (_1!9796 lt!337150))) (currentByte!9737 (_1!9796 lt!337150)) (currentBit!9732 (_1!9796 lt!337150))))))

(assert (=> d!72381 (= lt!338259 (_2!9794 (moveBitIndex!0 (_1!9796 lt!337150) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!72381 (moveBitIndexPrecond!0 (_1!9796 lt!337150) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!72381 (= (withMovedBitIndex!0 (_1!9796 lt!337150) #b0000000000000000000000000000000000000000000000000000000000000001) lt!338259)))

(declare-fun b!214020 () Bool)

(assert (=> b!214020 (= e!145722 (= (size!4633 (buf!5165 (_1!9796 lt!337150))) (size!4633 (buf!5165 lt!338259))))))

(assert (= (and d!72381 res!179882) b!214020))

(declare-fun m!329885 () Bool)

(assert (=> d!72381 m!329885))

(declare-fun m!329887 () Bool)

(assert (=> d!72381 m!329887))

(declare-fun m!329889 () Bool)

(assert (=> d!72381 m!329889))

(declare-fun m!329891 () Bool)

(assert (=> d!72381 m!329891))

(assert (=> b!213569 d!72381))

(assert (=> b!213556 d!72325))

(assert (=> b!213556 d!72327))

(declare-fun b!214049 () Bool)

(declare-fun res!179908 () Bool)

(declare-fun e!145739 () Bool)

(assert (=> b!214049 (=> (not res!179908) (not e!145739))))

(declare-fun lt!338326 () tuple2!18278)

(declare-fun lt!338328 () (_ BitVec 64))

(declare-fun lt!338327 () (_ BitVec 64))

(assert (=> b!214049 (= res!179908 (= (bitIndex!0 (size!4633 (buf!5165 (_2!9794 lt!338326))) (currentByte!9737 (_2!9794 lt!338326)) (currentBit!9732 (_2!9794 lt!338326))) (bvadd lt!338327 lt!338328)))))

(assert (=> b!214049 (or (not (= (bvand lt!338327 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!338328 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!338327 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!338327 lt!338328) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!214049 (= lt!338328 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!214049 (= lt!338327 (bitIndex!0 (size!4633 (buf!5165 thiss!1204)) (currentByte!9737 thiss!1204) (currentBit!9732 thiss!1204)))))

(declare-fun b!214051 () Bool)

(declare-fun e!145738 () Bool)

(assert (=> b!214051 (= e!145739 e!145738)))

(declare-fun res!179909 () Bool)

(assert (=> b!214051 (=> (not res!179909) (not e!145738))))

(declare-fun lt!338325 () tuple2!18280)

(assert (=> b!214051 (= res!179909 (and (= (_2!9795 lt!338325) lt!337157) (= (_1!9795 lt!338325) (_2!9794 lt!338326))))))

(assert (=> b!214051 (= lt!338325 (readBitPure!0 (readerFrom!0 (_2!9794 lt!338326) (currentBit!9732 thiss!1204) (currentByte!9737 thiss!1204))))))

(declare-fun b!214050 () Bool)

(declare-fun res!179907 () Bool)

(assert (=> b!214050 (=> (not res!179907) (not e!145739))))

(assert (=> b!214050 (= res!179907 (isPrefixOf!0 thiss!1204 (_2!9794 lt!338326)))))

(declare-fun b!214052 () Bool)

(assert (=> b!214052 (= e!145738 (= (bitIndex!0 (size!4633 (buf!5165 (_1!9795 lt!338325))) (currentByte!9737 (_1!9795 lt!338325)) (currentBit!9732 (_1!9795 lt!338325))) (bitIndex!0 (size!4633 (buf!5165 (_2!9794 lt!338326))) (currentByte!9737 (_2!9794 lt!338326)) (currentBit!9732 (_2!9794 lt!338326)))))))

(declare-fun d!72383 () Bool)

(assert (=> d!72383 e!145739))

(declare-fun res!179906 () Bool)

(assert (=> d!72383 (=> (not res!179906) (not e!145739))))

(assert (=> d!72383 (= res!179906 (= (size!4633 (buf!5165 thiss!1204)) (size!4633 (buf!5165 (_2!9794 lt!338326)))))))

(declare-fun choose!16 (BitStream!8374 Bool) tuple2!18278)

(assert (=> d!72383 (= lt!338326 (choose!16 thiss!1204 lt!337157))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!72383 (validate_offset_bit!0 ((_ sign_extend 32) (size!4633 (buf!5165 thiss!1204))) ((_ sign_extend 32) (currentByte!9737 thiss!1204)) ((_ sign_extend 32) (currentBit!9732 thiss!1204)))))

(assert (=> d!72383 (= (appendBit!0 thiss!1204 lt!337157) lt!338326)))

(assert (= (and d!72383 res!179906) b!214049))

(assert (= (and b!214049 res!179908) b!214050))

(assert (= (and b!214050 res!179907) b!214051))

(assert (= (and b!214051 res!179909) b!214052))

(declare-fun m!329989 () Bool)

(assert (=> d!72383 m!329989))

(declare-fun m!329991 () Bool)

(assert (=> d!72383 m!329991))

(declare-fun m!329993 () Bool)

(assert (=> b!214052 m!329993))

(declare-fun m!329995 () Bool)

(assert (=> b!214052 m!329995))

(declare-fun m!329997 () Bool)

(assert (=> b!214051 m!329997))

(assert (=> b!214051 m!329997))

(declare-fun m!329999 () Bool)

(assert (=> b!214051 m!329999))

(declare-fun m!330001 () Bool)

(assert (=> b!214050 m!330001))

(assert (=> b!214049 m!329995))

(assert (=> b!214049 m!329163))

(assert (=> b!213556 d!72383))

(declare-fun d!72395 () Bool)

(declare-fun e!145740 () Bool)

(assert (=> d!72395 e!145740))

(declare-fun res!179910 () Bool)

(assert (=> d!72395 (=> (not res!179910) (not e!145740))))

(declare-fun lt!338332 () BitStream!8374)

(declare-fun lt!338333 () (_ BitVec 64))

(assert (=> d!72395 (= res!179910 (= (bvadd lt!338333 (bvsub lt!337163 lt!337154)) (bitIndex!0 (size!4633 (buf!5165 lt!338332)) (currentByte!9737 lt!338332) (currentBit!9732 lt!338332))))))

(assert (=> d!72395 (or (not (= (bvand lt!338333 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!337163 lt!337154) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!338333 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!338333 (bvsub lt!337163 lt!337154)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72395 (= lt!338333 (bitIndex!0 (size!4633 (buf!5165 (_2!9796 lt!337168))) (currentByte!9737 (_2!9796 lt!337168)) (currentBit!9732 (_2!9796 lt!337168))))))

(assert (=> d!72395 (= lt!338332 (_2!9794 (moveBitIndex!0 (_2!9796 lt!337168) (bvsub lt!337163 lt!337154))))))

(assert (=> d!72395 (moveBitIndexPrecond!0 (_2!9796 lt!337168) (bvsub lt!337163 lt!337154))))

(assert (=> d!72395 (= (withMovedBitIndex!0 (_2!9796 lt!337168) (bvsub lt!337163 lt!337154)) lt!338332)))

(declare-fun b!214053 () Bool)

(assert (=> b!214053 (= e!145740 (= (size!4633 (buf!5165 (_2!9796 lt!337168))) (size!4633 (buf!5165 lt!338332))))))

(assert (= (and d!72395 res!179910) b!214053))

(declare-fun m!330005 () Bool)

(assert (=> d!72395 m!330005))

(declare-fun m!330007 () Bool)

(assert (=> d!72395 m!330007))

(declare-fun m!330009 () Bool)

(assert (=> d!72395 m!330009))

(declare-fun m!330011 () Bool)

(assert (=> d!72395 m!330011))

(assert (=> b!213567 d!72395))

(declare-fun d!72399 () Bool)

(declare-fun res!179912 () Bool)

(declare-fun e!145742 () Bool)

(assert (=> d!72399 (=> (not res!179912) (not e!145742))))

(assert (=> d!72399 (= res!179912 (= (size!4633 (buf!5165 (_2!9794 lt!337166))) (size!4633 (buf!5165 (_2!9794 lt!337152)))))))

(assert (=> d!72399 (= (isPrefixOf!0 (_2!9794 lt!337166) (_2!9794 lt!337152)) e!145742)))

(declare-fun b!214054 () Bool)

(declare-fun res!179914 () Bool)

(assert (=> b!214054 (=> (not res!179914) (not e!145742))))

(assert (=> b!214054 (= res!179914 (bvsle (bitIndex!0 (size!4633 (buf!5165 (_2!9794 lt!337166))) (currentByte!9737 (_2!9794 lt!337166)) (currentBit!9732 (_2!9794 lt!337166))) (bitIndex!0 (size!4633 (buf!5165 (_2!9794 lt!337152))) (currentByte!9737 (_2!9794 lt!337152)) (currentBit!9732 (_2!9794 lt!337152)))))))

(declare-fun b!214055 () Bool)

(declare-fun e!145741 () Bool)

(assert (=> b!214055 (= e!145742 e!145741)))

(declare-fun res!179913 () Bool)

(assert (=> b!214055 (=> res!179913 e!145741)))

(assert (=> b!214055 (= res!179913 (= (size!4633 (buf!5165 (_2!9794 lt!337166))) #b00000000000000000000000000000000))))

(declare-fun b!214056 () Bool)

(assert (=> b!214056 (= e!145741 (arrayBitRangesEq!0 (buf!5165 (_2!9794 lt!337166)) (buf!5165 (_2!9794 lt!337152)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4633 (buf!5165 (_2!9794 lt!337166))) (currentByte!9737 (_2!9794 lt!337166)) (currentBit!9732 (_2!9794 lt!337166)))))))

(assert (= (and d!72399 res!179912) b!214054))

(assert (= (and b!214054 res!179914) b!214055))

(assert (= (and b!214055 (not res!179913)) b!214056))

(assert (=> b!214054 m!329161))

(assert (=> b!214054 m!329149))

(assert (=> b!214056 m!329161))

(assert (=> b!214056 m!329161))

(declare-fun m!330013 () Bool)

(assert (=> b!214056 m!330013))

(assert (=> b!213557 d!72399))

(declare-fun d!72401 () Bool)

(declare-fun e!145743 () Bool)

(assert (=> d!72401 e!145743))

(declare-fun res!179916 () Bool)

(assert (=> d!72401 (=> (not res!179916) (not e!145743))))

(declare-fun lt!338334 () (_ BitVec 64))

(declare-fun lt!338339 () (_ BitVec 64))

(declare-fun lt!338337 () (_ BitVec 64))

(assert (=> d!72401 (= res!179916 (= lt!338334 (bvsub lt!338337 lt!338339)))))

(assert (=> d!72401 (or (= (bvand lt!338337 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!338339 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!338337 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!338337 lt!338339) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72401 (= lt!338339 (remainingBits!0 ((_ sign_extend 32) (size!4633 (buf!5165 (_1!9797 lt!337153)))) ((_ sign_extend 32) (currentByte!9737 (_1!9797 lt!337153))) ((_ sign_extend 32) (currentBit!9732 (_1!9797 lt!337153)))))))

(declare-fun lt!338336 () (_ BitVec 64))

(declare-fun lt!338335 () (_ BitVec 64))

(assert (=> d!72401 (= lt!338337 (bvmul lt!338336 lt!338335))))

(assert (=> d!72401 (or (= lt!338336 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!338335 (bvsdiv (bvmul lt!338336 lt!338335) lt!338336)))))

(assert (=> d!72401 (= lt!338335 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72401 (= lt!338336 ((_ sign_extend 32) (size!4633 (buf!5165 (_1!9797 lt!337153)))))))

(assert (=> d!72401 (= lt!338334 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9737 (_1!9797 lt!337153))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9732 (_1!9797 lt!337153)))))))

(assert (=> d!72401 (invariant!0 (currentBit!9732 (_1!9797 lt!337153)) (currentByte!9737 (_1!9797 lt!337153)) (size!4633 (buf!5165 (_1!9797 lt!337153))))))

(assert (=> d!72401 (= (bitIndex!0 (size!4633 (buf!5165 (_1!9797 lt!337153))) (currentByte!9737 (_1!9797 lt!337153)) (currentBit!9732 (_1!9797 lt!337153))) lt!338334)))

(declare-fun b!214057 () Bool)

(declare-fun res!179915 () Bool)

(assert (=> b!214057 (=> (not res!179915) (not e!145743))))

(assert (=> b!214057 (= res!179915 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!338334))))

(declare-fun b!214058 () Bool)

(declare-fun lt!338338 () (_ BitVec 64))

(assert (=> b!214058 (= e!145743 (bvsle lt!338334 (bvmul lt!338338 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!214058 (or (= lt!338338 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!338338 #b0000000000000000000000000000000000000000000000000000000000001000) lt!338338)))))

(assert (=> b!214058 (= lt!338338 ((_ sign_extend 32) (size!4633 (buf!5165 (_1!9797 lt!337153)))))))

(assert (= (and d!72401 res!179916) b!214057))

(assert (= (and b!214057 res!179915) b!214058))

(declare-fun m!330015 () Bool)

(assert (=> d!72401 m!330015))

(declare-fun m!330017 () Bool)

(assert (=> d!72401 m!330017))

(assert (=> b!213576 d!72401))

(declare-fun d!72403 () Bool)

(declare-fun e!145746 () Bool)

(assert (=> d!72403 e!145746))

(declare-fun res!179920 () Bool)

(assert (=> d!72403 (=> (not res!179920) (not e!145746))))

(declare-fun lt!338343 () (_ BitVec 64))

(declare-fun lt!338340 () (_ BitVec 64))

(declare-fun lt!338345 () (_ BitVec 64))

(assert (=> d!72403 (= res!179920 (= lt!338340 (bvsub lt!338343 lt!338345)))))

(assert (=> d!72403 (or (= (bvand lt!338343 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!338345 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!338343 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!338343 lt!338345) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72403 (= lt!338345 (remainingBits!0 ((_ sign_extend 32) (size!4633 (buf!5165 (_2!9796 lt!337150)))) ((_ sign_extend 32) (currentByte!9737 (_2!9796 lt!337150))) ((_ sign_extend 32) (currentBit!9732 (_2!9796 lt!337150)))))))

(declare-fun lt!338342 () (_ BitVec 64))

(declare-fun lt!338341 () (_ BitVec 64))

(assert (=> d!72403 (= lt!338343 (bvmul lt!338342 lt!338341))))

(assert (=> d!72403 (or (= lt!338342 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!338341 (bvsdiv (bvmul lt!338342 lt!338341) lt!338342)))))

(assert (=> d!72403 (= lt!338341 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72403 (= lt!338342 ((_ sign_extend 32) (size!4633 (buf!5165 (_2!9796 lt!337150)))))))

(assert (=> d!72403 (= lt!338340 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9737 (_2!9796 lt!337150))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9732 (_2!9796 lt!337150)))))))

(assert (=> d!72403 (invariant!0 (currentBit!9732 (_2!9796 lt!337150)) (currentByte!9737 (_2!9796 lt!337150)) (size!4633 (buf!5165 (_2!9796 lt!337150))))))

(assert (=> d!72403 (= (bitIndex!0 (size!4633 (buf!5165 (_2!9796 lt!337150))) (currentByte!9737 (_2!9796 lt!337150)) (currentBit!9732 (_2!9796 lt!337150))) lt!338340)))

(declare-fun b!214061 () Bool)

(declare-fun res!179919 () Bool)

(assert (=> b!214061 (=> (not res!179919) (not e!145746))))

(assert (=> b!214061 (= res!179919 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!338340))))

(declare-fun b!214062 () Bool)

(declare-fun lt!338344 () (_ BitVec 64))

(assert (=> b!214062 (= e!145746 (bvsle lt!338340 (bvmul lt!338344 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!214062 (or (= lt!338344 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!338344 #b0000000000000000000000000000000000000000000000000000000000001000) lt!338344)))))

(assert (=> b!214062 (= lt!338344 ((_ sign_extend 32) (size!4633 (buf!5165 (_2!9796 lt!337150)))))))

(assert (= (and d!72403 res!179920) b!214061))

(assert (= (and b!214061 res!179919) b!214062))

(declare-fun m!330019 () Bool)

(assert (=> d!72403 m!330019))

(declare-fun m!330021 () Bool)

(assert (=> d!72403 m!330021))

(assert (=> b!213576 d!72403))

(declare-fun d!72405 () Bool)

(assert (=> d!72405 (= (invariant!0 (currentBit!9732 (_2!9794 lt!337152)) (currentByte!9737 (_2!9794 lt!337152)) (size!4633 (buf!5165 (_2!9794 lt!337152)))) (and (bvsge (currentBit!9732 (_2!9794 lt!337152)) #b00000000000000000000000000000000) (bvslt (currentBit!9732 (_2!9794 lt!337152)) #b00000000000000000000000000001000) (bvsge (currentByte!9737 (_2!9794 lt!337152)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9737 (_2!9794 lt!337152)) (size!4633 (buf!5165 (_2!9794 lt!337152)))) (and (= (currentBit!9732 (_2!9794 lt!337152)) #b00000000000000000000000000000000) (= (currentByte!9737 (_2!9794 lt!337152)) (size!4633 (buf!5165 (_2!9794 lt!337152))))))))))

(assert (=> b!213555 d!72405))

(assert (=> b!213566 d!72367))

(push 1)

(assert (not d!72315))

(assert (not b!214052))

(assert (not b!213980))

(assert (not b!213808))

(assert (not b!213810))

(assert (not d!72327))

(assert (not d!72381))

(assert (not b!213809))

(assert (not d!72395))

(assert (not d!72377))

(assert (not d!72317))

(assert (not d!72295))

(assert (not d!72335))

(assert (not b!213976))

(assert (not b!214050))

(assert (not d!72373))

(assert (not bm!3354))

(assert (not d!72379))

(assert (not b!214056))

(assert (not b!213840))

(assert (not b!214049))

(assert (not d!72331))

(assert (not b!213839))

(assert (not d!72369))

(assert (not b!213974))

(assert (not d!72275))

(assert (not b!213977))

(assert (not d!72291))

(assert (not d!72277))

(assert (not b!213861))

(assert (not d!72307))

(assert (not b!213967))

(assert (not d!72311))

(assert (not d!72299))

(assert (not b!214005))

(assert (not b!213807))

(assert (not d!72337))

(assert (not b!213838))

(assert (not d!72401))

(assert (not d!72305))

(assert (not b!213981))

(assert (not d!72325))

(assert (not d!72375))

(assert (not b!213841))

(assert (not b!213859))

(assert (not b!214054))

(assert (not b!214051))

(assert (not b!213996))

(assert (not d!72271))

(assert (not d!72403))

(assert (not d!72303))

(assert (not d!72281))

(assert (not d!72383))

(assert (not b!213998))

(assert (not d!72319))

(assert (not d!72293))

(assert (not b!213979))

(assert (not b!213975))

(assert (not b!213971))

(assert (not d!72321))

(assert (not b!213970))

(assert (not d!72309))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

