; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15040 () Bool)

(assert start!15040)

(declare-fun b!76963 () Bool)

(declare-fun res!63593 () Bool)

(declare-fun e!50481 () Bool)

(assert (=> b!76963 (=> (not res!63593) (not e!50481))))

(declare-datatypes ((array!3202 0))(
  ( (array!3203 (arr!2089 (Array (_ BitVec 32) (_ BitVec 8))) (size!1488 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2550 0))(
  ( (BitStream!2551 (buf!1878 array!3202) (currentByte!3689 (_ BitVec 32)) (currentBit!3684 (_ BitVec 32))) )
))
(declare-fun thiss!1090 () BitStream!2550)

(declare-datatypes ((Unit!5067 0))(
  ( (Unit!5068) )
))
(declare-datatypes ((tuple2!6710 0))(
  ( (tuple2!6711 (_1!3489 Unit!5067) (_2!3489 BitStream!2550)) )
))
(declare-fun lt!123347 () tuple2!6710)

(declare-fun isPrefixOf!0 (BitStream!2550 BitStream!2550) Bool)

(assert (=> b!76963 (= res!63593 (isPrefixOf!0 thiss!1090 (_2!3489 lt!123347)))))

(declare-fun b!76964 () Bool)

(declare-datatypes ((tuple2!6712 0))(
  ( (tuple2!6713 (_1!3490 BitStream!2550) (_2!3490 Bool)) )
))
(declare-fun lt!123346 () tuple2!6712)

(declare-datatypes ((tuple2!6714 0))(
  ( (tuple2!6715 (_1!3491 BitStream!2550) (_2!3491 BitStream!2550)) )
))
(declare-fun lt!123350 () tuple2!6714)

(assert (=> b!76964 (= e!50481 (not (or (not (_2!3490 lt!123346)) (not (= (_1!3490 lt!123346) (_2!3491 lt!123350))))))))

(declare-fun nBits!322 () (_ BitVec 64))

(declare-fun checkBitsLoopPure!0 (BitStream!2550 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!6712)

(assert (=> b!76964 (= lt!123346 (checkBitsLoopPure!0 (_1!3491 lt!123350) nBits!322 false #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!76964 (validate_offset_bits!1 ((_ sign_extend 32) (size!1488 (buf!1878 (_2!3489 lt!123347)))) ((_ sign_extend 32) (currentByte!3689 thiss!1090)) ((_ sign_extend 32) (currentBit!3684 thiss!1090)) nBits!322)))

(declare-fun lt!123348 () Unit!5067)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2550 array!3202 (_ BitVec 64)) Unit!5067)

(assert (=> b!76964 (= lt!123348 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1090 (buf!1878 (_2!3489 lt!123347)) nBits!322))))

(declare-fun reader!0 (BitStream!2550 BitStream!2550) tuple2!6714)

(assert (=> b!76964 (= lt!123350 (reader!0 thiss!1090 (_2!3489 lt!123347)))))

(declare-fun b!76965 () Bool)

(declare-fun res!63595 () Bool)

(assert (=> b!76965 (=> (not res!63595) (not e!50481))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!76965 (= res!63595 (= (bitIndex!0 (size!1488 (buf!1878 (_2!3489 lt!123347))) (currentByte!3689 (_2!3489 lt!123347)) (currentBit!3684 (_2!3489 lt!123347))) (bvadd (bitIndex!0 (size!1488 (buf!1878 thiss!1090)) (currentByte!3689 thiss!1090) (currentBit!3684 thiss!1090)) nBits!322)))))

(declare-fun res!63592 () Bool)

(declare-fun e!50484 () Bool)

(assert (=> start!15040 (=> (not res!63592) (not e!50484))))

(assert (=> start!15040 (= res!63592 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!322) (bvsle nBits!322 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15040 e!50484))

(assert (=> start!15040 true))

(declare-fun e!50482 () Bool)

(declare-fun inv!12 (BitStream!2550) Bool)

(assert (=> start!15040 (and (inv!12 thiss!1090) e!50482)))

(declare-fun b!76966 () Bool)

(assert (=> b!76966 (= e!50484 (not true))))

(declare-fun lt!123349 () Bool)

(assert (=> b!76966 (= lt!123349 (isPrefixOf!0 thiss!1090 (_2!3489 lt!123347)))))

(declare-fun lt!123345 () (_ BitVec 64))

(assert (=> b!76966 (= lt!123345 (bitIndex!0 (size!1488 (buf!1878 (_2!3489 lt!123347))) (currentByte!3689 (_2!3489 lt!123347)) (currentBit!3684 (_2!3489 lt!123347))))))

(declare-fun lt!123351 () (_ BitVec 64))

(assert (=> b!76966 (= lt!123351 (bitIndex!0 (size!1488 (buf!1878 thiss!1090)) (currentByte!3689 thiss!1090) (currentBit!3684 thiss!1090)))))

(assert (=> b!76966 e!50481))

(declare-fun res!63594 () Bool)

(assert (=> b!76966 (=> (not res!63594) (not e!50481))))

(assert (=> b!76966 (= res!63594 (= (size!1488 (buf!1878 thiss!1090)) (size!1488 (buf!1878 (_2!3489 lt!123347)))))))

(declare-fun appendNBits!0 (BitStream!2550 (_ BitVec 64) Bool) tuple2!6710)

(assert (=> b!76966 (= lt!123347 (appendNBits!0 thiss!1090 nBits!322 false))))

(declare-fun b!76967 () Bool)

(declare-fun res!63591 () Bool)

(assert (=> b!76967 (=> (not res!63591) (not e!50484))))

(assert (=> b!76967 (= res!63591 (validate_offset_bits!1 ((_ sign_extend 32) (size!1488 (buf!1878 thiss!1090))) ((_ sign_extend 32) (currentByte!3689 thiss!1090)) ((_ sign_extend 32) (currentBit!3684 thiss!1090)) nBits!322))))

(declare-fun b!76968 () Bool)

(declare-fun array_inv!1334 (array!3202) Bool)

(assert (=> b!76968 (= e!50482 (array_inv!1334 (buf!1878 thiss!1090)))))

(assert (= (and start!15040 res!63592) b!76967))

(assert (= (and b!76967 res!63591) b!76966))

(assert (= (and b!76966 res!63594) b!76965))

(assert (= (and b!76965 res!63595) b!76963))

(assert (= (and b!76963 res!63593) b!76964))

(assert (= start!15040 b!76968))

(declare-fun m!122325 () Bool)

(assert (=> b!76966 m!122325))

(declare-fun m!122327 () Bool)

(assert (=> b!76966 m!122327))

(declare-fun m!122329 () Bool)

(assert (=> b!76966 m!122329))

(declare-fun m!122331 () Bool)

(assert (=> b!76966 m!122331))

(declare-fun m!122333 () Bool)

(assert (=> start!15040 m!122333))

(assert (=> b!76965 m!122327))

(assert (=> b!76965 m!122329))

(assert (=> b!76963 m!122325))

(declare-fun m!122335 () Bool)

(assert (=> b!76968 m!122335))

(declare-fun m!122337 () Bool)

(assert (=> b!76964 m!122337))

(declare-fun m!122339 () Bool)

(assert (=> b!76964 m!122339))

(declare-fun m!122341 () Bool)

(assert (=> b!76964 m!122341))

(declare-fun m!122343 () Bool)

(assert (=> b!76964 m!122343))

(declare-fun m!122345 () Bool)

(assert (=> b!76967 m!122345))

(check-sat (not b!76964) (not b!76966) (not b!76968) (not b!76963) (not b!76965) (not start!15040) (not b!76967))
