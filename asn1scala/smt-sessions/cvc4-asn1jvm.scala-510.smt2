; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15042 () Bool)

(assert start!15042)

(declare-fun b!76981 () Bool)

(declare-fun e!50495 () Bool)

(declare-datatypes ((array!3204 0))(
  ( (array!3205 (arr!2090 (Array (_ BitVec 32) (_ BitVec 8))) (size!1489 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2552 0))(
  ( (BitStream!2553 (buf!1879 array!3204) (currentByte!3690 (_ BitVec 32)) (currentBit!3685 (_ BitVec 32))) )
))
(declare-fun thiss!1090 () BitStream!2552)

(declare-fun array_inv!1335 (array!3204) Bool)

(assert (=> b!76981 (= e!50495 (array_inv!1335 (buf!1879 thiss!1090)))))

(declare-fun b!76982 () Bool)

(declare-fun res!63609 () Bool)

(declare-fun e!50496 () Bool)

(assert (=> b!76982 (=> (not res!63609) (not e!50496))))

(declare-datatypes ((Unit!5069 0))(
  ( (Unit!5070) )
))
(declare-datatypes ((tuple2!6716 0))(
  ( (tuple2!6717 (_1!3492 Unit!5069) (_2!3492 BitStream!2552)) )
))
(declare-fun lt!123369 () tuple2!6716)

(declare-fun isPrefixOf!0 (BitStream!2552 BitStream!2552) Bool)

(assert (=> b!76982 (= res!63609 (isPrefixOf!0 thiss!1090 (_2!3492 lt!123369)))))

(declare-fun b!76983 () Bool)

(declare-fun e!50494 () Bool)

(assert (=> b!76983 (= e!50494 (not true))))

(declare-fun lt!123372 () Bool)

(assert (=> b!76983 (= lt!123372 (isPrefixOf!0 thiss!1090 (_2!3492 lt!123369)))))

(declare-fun lt!123368 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!76983 (= lt!123368 (bitIndex!0 (size!1489 (buf!1879 (_2!3492 lt!123369))) (currentByte!3690 (_2!3492 lt!123369)) (currentBit!3685 (_2!3492 lt!123369))))))

(declare-fun lt!123370 () (_ BitVec 64))

(assert (=> b!76983 (= lt!123370 (bitIndex!0 (size!1489 (buf!1879 thiss!1090)) (currentByte!3690 thiss!1090) (currentBit!3685 thiss!1090)))))

(assert (=> b!76983 e!50496))

(declare-fun res!63606 () Bool)

(assert (=> b!76983 (=> (not res!63606) (not e!50496))))

(assert (=> b!76983 (= res!63606 (= (size!1489 (buf!1879 thiss!1090)) (size!1489 (buf!1879 (_2!3492 lt!123369)))))))

(declare-fun nBits!322 () (_ BitVec 64))

(declare-fun appendNBits!0 (BitStream!2552 (_ BitVec 64) Bool) tuple2!6716)

(assert (=> b!76983 (= lt!123369 (appendNBits!0 thiss!1090 nBits!322 false))))

(declare-fun res!63610 () Bool)

(assert (=> start!15042 (=> (not res!63610) (not e!50494))))

(assert (=> start!15042 (= res!63610 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!322) (bvsle nBits!322 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15042 e!50494))

(assert (=> start!15042 true))

(declare-fun inv!12 (BitStream!2552) Bool)

(assert (=> start!15042 (and (inv!12 thiss!1090) e!50495)))

(declare-fun b!76984 () Bool)

(declare-datatypes ((tuple2!6718 0))(
  ( (tuple2!6719 (_1!3493 BitStream!2552) (_2!3493 Bool)) )
))
(declare-fun lt!123366 () tuple2!6718)

(declare-datatypes ((tuple2!6720 0))(
  ( (tuple2!6721 (_1!3494 BitStream!2552) (_2!3494 BitStream!2552)) )
))
(declare-fun lt!123367 () tuple2!6720)

(assert (=> b!76984 (= e!50496 (not (or (not (_2!3493 lt!123366)) (not (= (_1!3493 lt!123366) (_2!3494 lt!123367))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!2552 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!6718)

(assert (=> b!76984 (= lt!123366 (checkBitsLoopPure!0 (_1!3494 lt!123367) nBits!322 false #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!76984 (validate_offset_bits!1 ((_ sign_extend 32) (size!1489 (buf!1879 (_2!3492 lt!123369)))) ((_ sign_extend 32) (currentByte!3690 thiss!1090)) ((_ sign_extend 32) (currentBit!3685 thiss!1090)) nBits!322)))

(declare-fun lt!123371 () Unit!5069)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2552 array!3204 (_ BitVec 64)) Unit!5069)

(assert (=> b!76984 (= lt!123371 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1090 (buf!1879 (_2!3492 lt!123369)) nBits!322))))

(declare-fun reader!0 (BitStream!2552 BitStream!2552) tuple2!6720)

(assert (=> b!76984 (= lt!123367 (reader!0 thiss!1090 (_2!3492 lt!123369)))))

(declare-fun b!76985 () Bool)

(declare-fun res!63608 () Bool)

(assert (=> b!76985 (=> (not res!63608) (not e!50496))))

(assert (=> b!76985 (= res!63608 (= (bitIndex!0 (size!1489 (buf!1879 (_2!3492 lt!123369))) (currentByte!3690 (_2!3492 lt!123369)) (currentBit!3685 (_2!3492 lt!123369))) (bvadd (bitIndex!0 (size!1489 (buf!1879 thiss!1090)) (currentByte!3690 thiss!1090) (currentBit!3685 thiss!1090)) nBits!322)))))

(declare-fun b!76986 () Bool)

(declare-fun res!63607 () Bool)

(assert (=> b!76986 (=> (not res!63607) (not e!50494))))

(assert (=> b!76986 (= res!63607 (validate_offset_bits!1 ((_ sign_extend 32) (size!1489 (buf!1879 thiss!1090))) ((_ sign_extend 32) (currentByte!3690 thiss!1090)) ((_ sign_extend 32) (currentBit!3685 thiss!1090)) nBits!322))))

(assert (= (and start!15042 res!63610) b!76986))

(assert (= (and b!76986 res!63607) b!76983))

(assert (= (and b!76983 res!63606) b!76985))

(assert (= (and b!76985 res!63608) b!76982))

(assert (= (and b!76982 res!63609) b!76984))

(assert (= start!15042 b!76981))

(declare-fun m!122347 () Bool)

(assert (=> b!76984 m!122347))

(declare-fun m!122349 () Bool)

(assert (=> b!76984 m!122349))

(declare-fun m!122351 () Bool)

(assert (=> b!76984 m!122351))

(declare-fun m!122353 () Bool)

(assert (=> b!76984 m!122353))

(declare-fun m!122355 () Bool)

(assert (=> start!15042 m!122355))

(declare-fun m!122357 () Bool)

(assert (=> b!76981 m!122357))

(declare-fun m!122359 () Bool)

(assert (=> b!76985 m!122359))

(declare-fun m!122361 () Bool)

(assert (=> b!76985 m!122361))

(declare-fun m!122363 () Bool)

(assert (=> b!76982 m!122363))

(declare-fun m!122365 () Bool)

(assert (=> b!76986 m!122365))

(assert (=> b!76983 m!122363))

(assert (=> b!76983 m!122359))

(assert (=> b!76983 m!122361))

(declare-fun m!122367 () Bool)

(assert (=> b!76983 m!122367))

(push 1)

(assert (not b!76983))

(assert (not start!15042))

(assert (not b!76981))

(assert (not b!76986))

(assert (not b!76984))

(assert (not b!76985))

(assert (not b!76982))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

