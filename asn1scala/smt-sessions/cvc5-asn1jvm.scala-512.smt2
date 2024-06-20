; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15050 () Bool)

(assert start!15050)

(declare-fun res!63670 () Bool)

(declare-fun e!50544 () Bool)

(assert (=> start!15050 (=> (not res!63670) (not e!50544))))

(declare-fun nBits!322 () (_ BitVec 64))

(assert (=> start!15050 (= res!63670 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!322) (bvsle nBits!322 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15050 e!50544))

(assert (=> start!15050 true))

(declare-datatypes ((array!3212 0))(
  ( (array!3213 (arr!2094 (Array (_ BitVec 32) (_ BitVec 8))) (size!1493 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2560 0))(
  ( (BitStream!2561 (buf!1883 array!3212) (currentByte!3694 (_ BitVec 32)) (currentBit!3689 (_ BitVec 32))) )
))
(declare-fun thiss!1090 () BitStream!2560)

(declare-fun e!50541 () Bool)

(declare-fun inv!12 (BitStream!2560) Bool)

(assert (=> start!15050 (and (inv!12 thiss!1090) e!50541)))

(declare-fun b!77053 () Bool)

(declare-fun res!63667 () Bool)

(declare-fun e!50543 () Bool)

(assert (=> b!77053 (=> (not res!63667) (not e!50543))))

(declare-datatypes ((Unit!5077 0))(
  ( (Unit!5078) )
))
(declare-datatypes ((tuple2!6740 0))(
  ( (tuple2!6741 (_1!3504 Unit!5077) (_2!3504 BitStream!2560)) )
))
(declare-fun lt!123465 () tuple2!6740)

(declare-fun isPrefixOf!0 (BitStream!2560 BitStream!2560) Bool)

(assert (=> b!77053 (= res!63667 (isPrefixOf!0 thiss!1090 (_2!3504 lt!123465)))))

(declare-fun b!77054 () Bool)

(declare-fun array_inv!1339 (array!3212) Bool)

(assert (=> b!77054 (= e!50541 (array_inv!1339 (buf!1883 thiss!1090)))))

(declare-fun b!77055 () Bool)

(declare-datatypes ((tuple2!6742 0))(
  ( (tuple2!6743 (_1!3505 BitStream!2560) (_2!3505 Bool)) )
))
(declare-fun lt!123462 () tuple2!6742)

(declare-datatypes ((tuple2!6744 0))(
  ( (tuple2!6745 (_1!3506 BitStream!2560) (_2!3506 BitStream!2560)) )
))
(declare-fun lt!123466 () tuple2!6744)

(assert (=> b!77055 (= e!50543 (not (or (not (_2!3505 lt!123462)) (not (= (_1!3505 lt!123462) (_2!3506 lt!123466))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!2560 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!6742)

(assert (=> b!77055 (= lt!123462 (checkBitsLoopPure!0 (_1!3506 lt!123466) nBits!322 false #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!77055 (validate_offset_bits!1 ((_ sign_extend 32) (size!1493 (buf!1883 (_2!3504 lt!123465)))) ((_ sign_extend 32) (currentByte!3694 thiss!1090)) ((_ sign_extend 32) (currentBit!3689 thiss!1090)) nBits!322)))

(declare-fun lt!123467 () Unit!5077)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2560 array!3212 (_ BitVec 64)) Unit!5077)

(assert (=> b!77055 (= lt!123467 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1090 (buf!1883 (_2!3504 lt!123465)) nBits!322))))

(declare-fun reader!0 (BitStream!2560 BitStream!2560) tuple2!6744)

(assert (=> b!77055 (= lt!123466 (reader!0 thiss!1090 (_2!3504 lt!123465)))))

(declare-fun b!77056 () Bool)

(declare-fun res!63669 () Bool)

(assert (=> b!77056 (=> (not res!63669) (not e!50543))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!77056 (= res!63669 (= (bitIndex!0 (size!1493 (buf!1883 (_2!3504 lt!123465))) (currentByte!3694 (_2!3504 lt!123465)) (currentBit!3689 (_2!3504 lt!123465))) (bvadd (bitIndex!0 (size!1493 (buf!1883 thiss!1090)) (currentByte!3694 thiss!1090) (currentBit!3689 thiss!1090)) nBits!322)))))

(declare-fun b!77057 () Bool)

(declare-fun res!63668 () Bool)

(assert (=> b!77057 (=> (not res!63668) (not e!50544))))

(assert (=> b!77057 (= res!63668 (validate_offset_bits!1 ((_ sign_extend 32) (size!1493 (buf!1883 thiss!1090))) ((_ sign_extend 32) (currentByte!3694 thiss!1090)) ((_ sign_extend 32) (currentBit!3689 thiss!1090)) nBits!322))))

(declare-fun b!77058 () Bool)

(assert (=> b!77058 (= e!50544 (not true))))

(declare-fun lt!123464 () tuple2!6744)

(assert (=> b!77058 (= lt!123464 (reader!0 thiss!1090 (_2!3504 lt!123465)))))

(declare-fun lt!123468 () Bool)

(assert (=> b!77058 (= lt!123468 (isPrefixOf!0 thiss!1090 (_2!3504 lt!123465)))))

(declare-fun lt!123463 () (_ BitVec 64))

(assert (=> b!77058 (= lt!123463 (bitIndex!0 (size!1493 (buf!1883 (_2!3504 lt!123465))) (currentByte!3694 (_2!3504 lt!123465)) (currentBit!3689 (_2!3504 lt!123465))))))

(declare-fun lt!123461 () (_ BitVec 64))

(assert (=> b!77058 (= lt!123461 (bitIndex!0 (size!1493 (buf!1883 thiss!1090)) (currentByte!3694 thiss!1090) (currentBit!3689 thiss!1090)))))

(assert (=> b!77058 e!50543))

(declare-fun res!63666 () Bool)

(assert (=> b!77058 (=> (not res!63666) (not e!50543))))

(assert (=> b!77058 (= res!63666 (= (size!1493 (buf!1883 thiss!1090)) (size!1493 (buf!1883 (_2!3504 lt!123465)))))))

(declare-fun appendNBits!0 (BitStream!2560 (_ BitVec 64) Bool) tuple2!6740)

(assert (=> b!77058 (= lt!123465 (appendNBits!0 thiss!1090 nBits!322 false))))

(assert (= (and start!15050 res!63670) b!77057))

(assert (= (and b!77057 res!63668) b!77058))

(assert (= (and b!77058 res!63666) b!77056))

(assert (= (and b!77056 res!63669) b!77053))

(assert (= (and b!77053 res!63667) b!77055))

(assert (= start!15050 b!77054))

(declare-fun m!122435 () Bool)

(assert (=> b!77056 m!122435))

(declare-fun m!122437 () Bool)

(assert (=> b!77056 m!122437))

(declare-fun m!122439 () Bool)

(assert (=> start!15050 m!122439))

(declare-fun m!122441 () Bool)

(assert (=> b!77057 m!122441))

(declare-fun m!122443 () Bool)

(assert (=> b!77055 m!122443))

(declare-fun m!122445 () Bool)

(assert (=> b!77055 m!122445))

(declare-fun m!122447 () Bool)

(assert (=> b!77055 m!122447))

(declare-fun m!122449 () Bool)

(assert (=> b!77055 m!122449))

(assert (=> b!77058 m!122437))

(assert (=> b!77058 m!122449))

(declare-fun m!122451 () Bool)

(assert (=> b!77058 m!122451))

(assert (=> b!77058 m!122435))

(declare-fun m!122453 () Bool)

(assert (=> b!77058 m!122453))

(declare-fun m!122455 () Bool)

(assert (=> b!77054 m!122455))

(assert (=> b!77053 m!122451))

(push 1)

(assert (not start!15050))

(assert (not b!77055))

(assert (not b!77058))

(assert (not b!77054))

(assert (not b!77056))

(assert (not b!77057))

(assert (not b!77053))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

