; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15044 () Bool)

(assert start!15044)

(declare-fun b!76999 () Bool)

(declare-fun res!63624 () Bool)

(declare-fun e!50505 () Bool)

(assert (=> b!76999 (=> (not res!63624) (not e!50505))))

(declare-datatypes ((array!3206 0))(
  ( (array!3207 (arr!2091 (Array (_ BitVec 32) (_ BitVec 8))) (size!1490 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2554 0))(
  ( (BitStream!2555 (buf!1880 array!3206) (currentByte!3691 (_ BitVec 32)) (currentBit!3686 (_ BitVec 32))) )
))
(declare-fun thiss!1090 () BitStream!2554)

(declare-datatypes ((Unit!5071 0))(
  ( (Unit!5072) )
))
(declare-datatypes ((tuple2!6722 0))(
  ( (tuple2!6723 (_1!3495 Unit!5071) (_2!3495 BitStream!2554)) )
))
(declare-fun lt!123395 () tuple2!6722)

(declare-fun isPrefixOf!0 (BitStream!2554 BitStream!2554) Bool)

(assert (=> b!76999 (= res!63624 (isPrefixOf!0 thiss!1090 (_2!3495 lt!123395)))))

(declare-fun res!63622 () Bool)

(declare-fun e!50508 () Bool)

(assert (=> start!15044 (=> (not res!63622) (not e!50508))))

(declare-fun nBits!322 () (_ BitVec 64))

(assert (=> start!15044 (= res!63622 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!322) (bvsle nBits!322 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15044 e!50508))

(assert (=> start!15044 true))

(declare-fun e!50506 () Bool)

(declare-fun inv!12 (BitStream!2554) Bool)

(assert (=> start!15044 (and (inv!12 thiss!1090) e!50506)))

(declare-fun b!77000 () Bool)

(declare-datatypes ((tuple2!6724 0))(
  ( (tuple2!6725 (_1!3496 BitStream!2554) (_2!3496 Bool)) )
))
(declare-fun lt!123396 () tuple2!6724)

(declare-datatypes ((tuple2!6726 0))(
  ( (tuple2!6727 (_1!3497 BitStream!2554) (_2!3497 BitStream!2554)) )
))
(declare-fun lt!123389 () tuple2!6726)

(assert (=> b!77000 (= e!50505 (not (or (not (_2!3496 lt!123396)) (not (= (_1!3496 lt!123396) (_2!3497 lt!123389))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!2554 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!6724)

(assert (=> b!77000 (= lt!123396 (checkBitsLoopPure!0 (_1!3497 lt!123389) nBits!322 false #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!77000 (validate_offset_bits!1 ((_ sign_extend 32) (size!1490 (buf!1880 (_2!3495 lt!123395)))) ((_ sign_extend 32) (currentByte!3691 thiss!1090)) ((_ sign_extend 32) (currentBit!3686 thiss!1090)) nBits!322)))

(declare-fun lt!123390 () Unit!5071)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2554 array!3206 (_ BitVec 64)) Unit!5071)

(assert (=> b!77000 (= lt!123390 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1090 (buf!1880 (_2!3495 lt!123395)) nBits!322))))

(declare-fun reader!0 (BitStream!2554 BitStream!2554) tuple2!6726)

(assert (=> b!77000 (= lt!123389 (reader!0 thiss!1090 (_2!3495 lt!123395)))))

(declare-fun b!77001 () Bool)

(declare-fun res!63623 () Bool)

(assert (=> b!77001 (=> (not res!63623) (not e!50505))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!77001 (= res!63623 (= (bitIndex!0 (size!1490 (buf!1880 (_2!3495 lt!123395))) (currentByte!3691 (_2!3495 lt!123395)) (currentBit!3686 (_2!3495 lt!123395))) (bvadd (bitIndex!0 (size!1490 (buf!1880 thiss!1090)) (currentByte!3691 thiss!1090) (currentBit!3686 thiss!1090)) nBits!322)))))

(declare-fun b!77002 () Bool)

(declare-fun res!63625 () Bool)

(assert (=> b!77002 (=> (not res!63625) (not e!50508))))

(assert (=> b!77002 (= res!63625 (validate_offset_bits!1 ((_ sign_extend 32) (size!1490 (buf!1880 thiss!1090))) ((_ sign_extend 32) (currentByte!3691 thiss!1090)) ((_ sign_extend 32) (currentBit!3686 thiss!1090)) nBits!322))))

(declare-fun b!77003 () Bool)

(assert (=> b!77003 (= e!50508 (not true))))

(declare-fun lt!123392 () tuple2!6726)

(assert (=> b!77003 (= lt!123392 (reader!0 thiss!1090 (_2!3495 lt!123395)))))

(declare-fun lt!123394 () Bool)

(assert (=> b!77003 (= lt!123394 (isPrefixOf!0 thiss!1090 (_2!3495 lt!123395)))))

(declare-fun lt!123393 () (_ BitVec 64))

(assert (=> b!77003 (= lt!123393 (bitIndex!0 (size!1490 (buf!1880 (_2!3495 lt!123395))) (currentByte!3691 (_2!3495 lt!123395)) (currentBit!3686 (_2!3495 lt!123395))))))

(declare-fun lt!123391 () (_ BitVec 64))

(assert (=> b!77003 (= lt!123391 (bitIndex!0 (size!1490 (buf!1880 thiss!1090)) (currentByte!3691 thiss!1090) (currentBit!3686 thiss!1090)))))

(assert (=> b!77003 e!50505))

(declare-fun res!63621 () Bool)

(assert (=> b!77003 (=> (not res!63621) (not e!50505))))

(assert (=> b!77003 (= res!63621 (= (size!1490 (buf!1880 thiss!1090)) (size!1490 (buf!1880 (_2!3495 lt!123395)))))))

(declare-fun appendNBits!0 (BitStream!2554 (_ BitVec 64) Bool) tuple2!6722)

(assert (=> b!77003 (= lt!123395 (appendNBits!0 thiss!1090 nBits!322 false))))

(declare-fun b!77004 () Bool)

(declare-fun array_inv!1336 (array!3206) Bool)

(assert (=> b!77004 (= e!50506 (array_inv!1336 (buf!1880 thiss!1090)))))

(assert (= (and start!15044 res!63622) b!77002))

(assert (= (and b!77002 res!63625) b!77003))

(assert (= (and b!77003 res!63621) b!77001))

(assert (= (and b!77001 res!63623) b!76999))

(assert (= (and b!76999 res!63624) b!77000))

(assert (= start!15044 b!77004))

(declare-fun m!122369 () Bool)

(assert (=> b!77003 m!122369))

(declare-fun m!122371 () Bool)

(assert (=> b!77003 m!122371))

(declare-fun m!122373 () Bool)

(assert (=> b!77003 m!122373))

(declare-fun m!122375 () Bool)

(assert (=> b!77003 m!122375))

(declare-fun m!122377 () Bool)

(assert (=> b!77003 m!122377))

(assert (=> b!77001 m!122373))

(assert (=> b!77001 m!122377))

(declare-fun m!122379 () Bool)

(assert (=> b!77002 m!122379))

(declare-fun m!122381 () Bool)

(assert (=> b!77000 m!122381))

(declare-fun m!122383 () Bool)

(assert (=> b!77000 m!122383))

(declare-fun m!122385 () Bool)

(assert (=> b!77000 m!122385))

(assert (=> b!77000 m!122375))

(declare-fun m!122387 () Bool)

(assert (=> b!77004 m!122387))

(declare-fun m!122389 () Bool)

(assert (=> start!15044 m!122389))

(assert (=> b!76999 m!122369))

(push 1)

(assert (not b!77004))

(assert (not start!15044))

(assert (not b!77003))

(assert (not b!76999))

(assert (not b!77000))

(assert (not b!77001))

(assert (not b!77002))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

