; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25520 () Bool)

(assert start!25520)

(declare-fun b!129665 () Bool)

(declare-fun e!85931 () Bool)

(declare-fun e!85936 () Bool)

(assert (=> b!129665 (= e!85931 (not e!85936))))

(declare-fun res!107418 () Bool)

(assert (=> b!129665 (=> res!107418 e!85936)))

(declare-fun lt!200245 () (_ BitVec 64))

(declare-datatypes ((array!6005 0))(
  ( (array!6006 (arr!3335 (Array (_ BitVec 32) (_ BitVec 8))) (size!2718 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4700 0))(
  ( (BitStream!4701 (buf!3076 array!6005) (currentByte!5837 (_ BitVec 32)) (currentBit!5832 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!8041 0))(
  ( (Unit!8042) )
))
(declare-datatypes ((tuple2!11102 0))(
  ( (tuple2!11103 (_1!5848 Unit!8041) (_2!5848 BitStream!4700)) )
))
(declare-fun lt!200247 () tuple2!11102)

(assert (=> b!129665 (= res!107418 (bvsgt lt!200245 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2718 (buf!3076 (_2!5848 lt!200247)))))))))

(declare-fun thiss!1634 () BitStream!4700)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!129665 (= lt!200245 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2718 (buf!3076 (_2!5848 lt!200247))) (currentByte!5837 thiss!1634) (currentBit!5832 thiss!1634))))))

(declare-fun e!85938 () Bool)

(assert (=> b!129665 e!85938))

(declare-fun res!107416 () Bool)

(assert (=> b!129665 (=> (not res!107416) (not e!85938))))

(declare-fun lt!200241 () tuple2!11102)

(declare-fun isPrefixOf!0 (BitStream!4700 BitStream!4700) Bool)

(assert (=> b!129665 (= res!107416 (isPrefixOf!0 thiss!1634 (_2!5848 lt!200241)))))

(declare-fun lt!200249 () Unit!8041)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4700 BitStream!4700 BitStream!4700) Unit!8041)

(assert (=> b!129665 (= lt!200249 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!5848 lt!200247) (_2!5848 lt!200241)))))

(declare-fun e!85935 () Bool)

(assert (=> b!129665 e!85935))

(declare-fun res!107413 () Bool)

(assert (=> b!129665 (=> (not res!107413) (not e!85935))))

(assert (=> b!129665 (= res!107413 (= (size!2718 (buf!3076 (_2!5848 lt!200247))) (size!2718 (buf!3076 (_2!5848 lt!200241)))))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun arr!237 () array!6005)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun appendByteArrayLoop!0 (BitStream!4700 array!6005 (_ BitVec 32) (_ BitVec 32)) tuple2!11102)

(assert (=> b!129665 (= lt!200241 (appendByteArrayLoop!0 (_2!5848 lt!200247) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!129665 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2718 (buf!3076 (_2!5848 lt!200247)))) ((_ sign_extend 32) (currentByte!5837 (_2!5848 lt!200247))) ((_ sign_extend 32) (currentBit!5832 (_2!5848 lt!200247))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!200242 () Unit!8041)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4700 BitStream!4700 (_ BitVec 64) (_ BitVec 32)) Unit!8041)

(assert (=> b!129665 (= lt!200242 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!5848 lt!200247) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(declare-fun e!85934 () Bool)

(assert (=> b!129665 e!85934))

(declare-fun res!107421 () Bool)

(assert (=> b!129665 (=> (not res!107421) (not e!85934))))

(assert (=> b!129665 (= res!107421 (= (size!2718 (buf!3076 thiss!1634)) (size!2718 (buf!3076 (_2!5848 lt!200247)))))))

(declare-fun appendByte!0 (BitStream!4700 (_ BitVec 8)) tuple2!11102)

(assert (=> b!129665 (= lt!200247 (appendByte!0 thiss!1634 (select (arr!3335 arr!237) from!447)))))

(declare-fun b!129666 () Bool)

(declare-datatypes ((tuple2!11104 0))(
  ( (tuple2!11105 (_1!5849 BitStream!4700) (_2!5849 array!6005)) )
))
(declare-fun lt!200248 () tuple2!11104)

(declare-fun e!85940 () Bool)

(declare-fun arrayRangesEq!121 (array!6005 array!6005 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!129666 (= e!85940 (not (arrayRangesEq!121 arr!237 (_2!5849 lt!200248) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!129668 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!129668 (= e!85938 (invariant!0 (currentBit!5832 thiss!1634) (currentByte!5837 thiss!1634) (size!2718 (buf!3076 (_2!5848 lt!200247)))))))

(declare-fun b!129669 () Bool)

(declare-fun res!107411 () Bool)

(assert (=> b!129669 (=> (not res!107411) (not e!85934))))

(assert (=> b!129669 (= res!107411 (isPrefixOf!0 thiss!1634 (_2!5848 lt!200247)))))

(declare-fun b!129670 () Bool)

(declare-fun res!107417 () Bool)

(declare-fun e!85937 () Bool)

(assert (=> b!129670 (=> (not res!107417) (not e!85937))))

(assert (=> b!129670 (= res!107417 (isPrefixOf!0 (_2!5848 lt!200247) (_2!5848 lt!200241)))))

(declare-fun b!129671 () Bool)

(declare-fun res!107409 () Bool)

(assert (=> b!129671 (=> (not res!107409) (not e!85934))))

(assert (=> b!129671 (= res!107409 (= (bitIndex!0 (size!2718 (buf!3076 (_2!5848 lt!200247))) (currentByte!5837 (_2!5848 lt!200247)) (currentBit!5832 (_2!5848 lt!200247))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2718 (buf!3076 thiss!1634)) (currentByte!5837 thiss!1634) (currentBit!5832 thiss!1634)))))))

(declare-fun b!129672 () Bool)

(declare-fun res!107420 () Bool)

(assert (=> b!129672 (=> res!107420 e!85936)))

(declare-fun arrayBitRangesEq!0 (array!6005 array!6005 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!129672 (= res!107420 (not (arrayBitRangesEq!0 (buf!3076 (_2!5848 lt!200247)) (buf!3076 (_2!5848 lt!200241)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!200245)))))

(declare-fun b!129673 () Bool)

(declare-fun res!107412 () Bool)

(assert (=> b!129673 (=> (not res!107412) (not e!85931))))

(assert (=> b!129673 (= res!107412 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2718 (buf!3076 thiss!1634))) ((_ sign_extend 32) (currentByte!5837 thiss!1634)) ((_ sign_extend 32) (currentBit!5832 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!129674 () Bool)

(assert (=> b!129674 (= e!85936 true)))

(declare-datatypes ((tuple2!11106 0))(
  ( (tuple2!11107 (_1!5850 BitStream!4700) (_2!5850 (_ BitVec 8))) )
))
(declare-fun lt!200238 () tuple2!11106)

(declare-fun readBytePure!0 (BitStream!4700) tuple2!11106)

(assert (=> b!129674 (= lt!200238 (readBytePure!0 (BitStream!4701 (buf!3076 (_2!5848 lt!200241)) (currentByte!5837 thiss!1634) (currentBit!5832 thiss!1634))))))

(declare-fun lt!200239 () tuple2!11106)

(assert (=> b!129674 (= lt!200239 (readBytePure!0 (BitStream!4701 (buf!3076 (_2!5848 lt!200247)) (currentByte!5837 thiss!1634) (currentBit!5832 thiss!1634))))))

(declare-fun b!129675 () Bool)

(assert (=> b!129675 (= e!85937 (not e!85940))))

(declare-fun res!107410 () Bool)

(assert (=> b!129675 (=> res!107410 e!85940)))

(declare-datatypes ((tuple2!11108 0))(
  ( (tuple2!11109 (_1!5851 BitStream!4700) (_2!5851 BitStream!4700)) )
))
(declare-fun lt!200237 () tuple2!11108)

(assert (=> b!129675 (= res!107410 (or (not (= (size!2718 (_2!5849 lt!200248)) (size!2718 arr!237))) (not (= (_1!5849 lt!200248) (_2!5851 lt!200237)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4700 array!6005 (_ BitVec 32) (_ BitVec 32)) tuple2!11104)

(assert (=> b!129675 (= lt!200248 (readByteArrayLoopPure!0 (_1!5851 lt!200237) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!200240 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!129675 (validate_offset_bits!1 ((_ sign_extend 32) (size!2718 (buf!3076 (_2!5848 lt!200241)))) ((_ sign_extend 32) (currentByte!5837 (_2!5848 lt!200247))) ((_ sign_extend 32) (currentBit!5832 (_2!5848 lt!200247))) lt!200240)))

(declare-fun lt!200246 () Unit!8041)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4700 array!6005 (_ BitVec 64)) Unit!8041)

(assert (=> b!129675 (= lt!200246 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5848 lt!200247) (buf!3076 (_2!5848 lt!200241)) lt!200240))))

(declare-fun reader!0 (BitStream!4700 BitStream!4700) tuple2!11108)

(assert (=> b!129675 (= lt!200237 (reader!0 (_2!5848 lt!200247) (_2!5848 lt!200241)))))

(declare-fun lt!200243 () tuple2!11108)

(declare-fun b!129676 () Bool)

(declare-fun lt!200244 () tuple2!11106)

(assert (=> b!129676 (= e!85934 (and (= (_2!5850 lt!200244) (select (arr!3335 arr!237) from!447)) (= (_1!5850 lt!200244) (_2!5851 lt!200243))))))

(assert (=> b!129676 (= lt!200244 (readBytePure!0 (_1!5851 lt!200243)))))

(assert (=> b!129676 (= lt!200243 (reader!0 thiss!1634 (_2!5848 lt!200247)))))

(declare-fun b!129667 () Bool)

(declare-fun res!107419 () Bool)

(assert (=> b!129667 (=> (not res!107419) (not e!85931))))

(assert (=> b!129667 (= res!107419 (invariant!0 (currentBit!5832 thiss!1634) (currentByte!5837 thiss!1634) (size!2718 (buf!3076 thiss!1634))))))

(declare-fun res!107414 () Bool)

(assert (=> start!25520 (=> (not res!107414) (not e!85931))))

(assert (=> start!25520 (= res!107414 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2718 arr!237))))))

(assert (=> start!25520 e!85931))

(assert (=> start!25520 true))

(declare-fun array_inv!2507 (array!6005) Bool)

(assert (=> start!25520 (array_inv!2507 arr!237)))

(declare-fun e!85932 () Bool)

(declare-fun inv!12 (BitStream!4700) Bool)

(assert (=> start!25520 (and (inv!12 thiss!1634) e!85932)))

(declare-fun b!129677 () Bool)

(assert (=> b!129677 (= e!85935 e!85937)))

(declare-fun res!107422 () Bool)

(assert (=> b!129677 (=> (not res!107422) (not e!85937))))

(assert (=> b!129677 (= res!107422 (= (bitIndex!0 (size!2718 (buf!3076 (_2!5848 lt!200241))) (currentByte!5837 (_2!5848 lt!200241)) (currentBit!5832 (_2!5848 lt!200241))) (bvadd (bitIndex!0 (size!2718 (buf!3076 (_2!5848 lt!200247))) (currentByte!5837 (_2!5848 lt!200247)) (currentBit!5832 (_2!5848 lt!200247))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!200240))))))

(assert (=> b!129677 (= lt!200240 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!129678 () Bool)

(assert (=> b!129678 (= e!85932 (array_inv!2507 (buf!3076 thiss!1634)))))

(declare-fun b!129679 () Bool)

(declare-fun res!107415 () Bool)

(assert (=> b!129679 (=> res!107415 e!85936)))

(assert (=> b!129679 (= res!107415 (bvsgt lt!200245 (bitIndex!0 (size!2718 (buf!3076 (_2!5848 lt!200241))) (currentByte!5837 (_2!5848 lt!200241)) (currentBit!5832 (_2!5848 lt!200241)))))))

(declare-fun b!129680 () Bool)

(declare-fun res!107408 () Bool)

(assert (=> b!129680 (=> (not res!107408) (not e!85931))))

(assert (=> b!129680 (= res!107408 (bvslt from!447 to!404))))

(assert (= (and start!25520 res!107414) b!129673))

(assert (= (and b!129673 res!107412) b!129680))

(assert (= (and b!129680 res!107408) b!129667))

(assert (= (and b!129667 res!107419) b!129665))

(assert (= (and b!129665 res!107421) b!129671))

(assert (= (and b!129671 res!107409) b!129669))

(assert (= (and b!129669 res!107411) b!129676))

(assert (= (and b!129665 res!107413) b!129677))

(assert (= (and b!129677 res!107422) b!129670))

(assert (= (and b!129670 res!107417) b!129675))

(assert (= (and b!129675 (not res!107410)) b!129666))

(assert (= (and b!129665 res!107416) b!129668))

(assert (= (and b!129665 (not res!107418)) b!129679))

(assert (= (and b!129679 (not res!107415)) b!129672))

(assert (= (and b!129672 (not res!107420)) b!129674))

(assert (= start!25520 b!129678))

(declare-fun m!195549 () Bool)

(assert (=> b!129675 m!195549))

(declare-fun m!195551 () Bool)

(assert (=> b!129675 m!195551))

(declare-fun m!195553 () Bool)

(assert (=> b!129675 m!195553))

(declare-fun m!195555 () Bool)

(assert (=> b!129675 m!195555))

(declare-fun m!195557 () Bool)

(assert (=> b!129671 m!195557))

(declare-fun m!195559 () Bool)

(assert (=> b!129671 m!195559))

(declare-fun m!195561 () Bool)

(assert (=> start!25520 m!195561))

(declare-fun m!195563 () Bool)

(assert (=> start!25520 m!195563))

(declare-fun m!195565 () Bool)

(assert (=> b!129676 m!195565))

(declare-fun m!195567 () Bool)

(assert (=> b!129676 m!195567))

(declare-fun m!195569 () Bool)

(assert (=> b!129676 m!195569))

(declare-fun m!195571 () Bool)

(assert (=> b!129674 m!195571))

(declare-fun m!195573 () Bool)

(assert (=> b!129674 m!195573))

(declare-fun m!195575 () Bool)

(assert (=> b!129673 m!195575))

(declare-fun m!195577 () Bool)

(assert (=> b!129667 m!195577))

(declare-fun m!195579 () Bool)

(assert (=> b!129679 m!195579))

(declare-fun m!195581 () Bool)

(assert (=> b!129668 m!195581))

(assert (=> b!129677 m!195579))

(assert (=> b!129677 m!195557))

(declare-fun m!195583 () Bool)

(assert (=> b!129669 m!195583))

(declare-fun m!195585 () Bool)

(assert (=> b!129670 m!195585))

(declare-fun m!195587 () Bool)

(assert (=> b!129678 m!195587))

(declare-fun m!195589 () Bool)

(assert (=> b!129665 m!195589))

(declare-fun m!195591 () Bool)

(assert (=> b!129665 m!195591))

(declare-fun m!195593 () Bool)

(assert (=> b!129665 m!195593))

(declare-fun m!195595 () Bool)

(assert (=> b!129665 m!195595))

(declare-fun m!195597 () Bool)

(assert (=> b!129665 m!195597))

(declare-fun m!195599 () Bool)

(assert (=> b!129665 m!195599))

(assert (=> b!129665 m!195565))

(declare-fun m!195601 () Bool)

(assert (=> b!129665 m!195601))

(assert (=> b!129665 m!195565))

(declare-fun m!195603 () Bool)

(assert (=> b!129672 m!195603))

(declare-fun m!195605 () Bool)

(assert (=> b!129666 m!195605))

(push 1)

(assert (not b!129672))

(assert (not b!129671))

(assert (not b!129667))

(assert (not b!129666))

(assert (not b!129679))

(assert (not b!129676))

(assert (not b!129669))

(assert (not b!129675))

(assert (not b!129670))

(assert (not b!129673))

(assert (not b!129674))

(assert (not start!25520))

(assert (not b!129665))

(assert (not b!129678))

(assert (not b!129677))

(assert (not b!129668))

(check-sat)

