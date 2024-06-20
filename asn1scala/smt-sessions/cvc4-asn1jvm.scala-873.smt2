; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25162 () Bool)

(assert start!25162)

(declare-fun noOfBytes!1 () (_ BitVec 32))

(declare-fun b!127523 () Bool)

(declare-fun e!84225 () Bool)

(declare-datatypes ((array!5787 0))(
  ( (array!5788 (arr!3236 (Array (_ BitVec 32) (_ BitVec 8))) (size!2619 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4562 0))(
  ( (BitStream!4563 (buf!3007 array!5787) (currentByte!5752 (_ BitVec 32)) (currentBit!5747 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!10762 0))(
  ( (tuple2!10763 (_1!5669 BitStream!4562) (_2!5669 array!5787)) )
))
(declare-fun lt!198881 () tuple2!10762)

(declare-fun arr!227 () array!5787)

(declare-fun arrayRangesEq!103 (array!5787 array!5787 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!127523 (= e!84225 (not (arrayRangesEq!103 arr!227 (_2!5669 lt!198881) #b00000000000000000000000000000000 noOfBytes!1)))))

(declare-fun b!127524 () Bool)

(declare-fun res!105728 () Bool)

(declare-fun e!84223 () Bool)

(assert (=> b!127524 (=> (not res!105728) (not e!84223))))

(declare-fun thiss!1614 () BitStream!4562)

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!127524 (= res!105728 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2619 (buf!3007 thiss!1614))) ((_ sign_extend 32) (currentByte!5752 thiss!1614)) ((_ sign_extend 32) (currentBit!5747 thiss!1614)) noOfBytes!1))))

(declare-fun b!127525 () Bool)

(declare-fun res!105726 () Bool)

(declare-fun e!84220 () Bool)

(assert (=> b!127525 (=> (not res!105726) (not e!84220))))

(declare-datatypes ((Unit!7841 0))(
  ( (Unit!7842) )
))
(declare-datatypes ((tuple2!10764 0))(
  ( (tuple2!10765 (_1!5670 Unit!7841) (_2!5670 BitStream!4562)) )
))
(declare-fun lt!198878 () tuple2!10764)

(declare-fun isPrefixOf!0 (BitStream!4562 BitStream!4562) Bool)

(assert (=> b!127525 (= res!105726 (isPrefixOf!0 thiss!1614 (_2!5670 lt!198878)))))

(declare-fun b!127526 () Bool)

(declare-fun e!84226 () Bool)

(declare-fun array_inv!2408 (array!5787) Bool)

(assert (=> b!127526 (= e!84226 (array_inv!2408 (buf!3007 thiss!1614)))))

(declare-fun b!127527 () Bool)

(declare-fun e!84227 () Bool)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!127527 (= e!84227 (validate_offset_bits!1 ((_ sign_extend 32) (size!2619 (buf!3007 thiss!1614))) ((_ sign_extend 32) (currentByte!5752 thiss!1614)) ((_ sign_extend 32) (currentBit!5747 thiss!1614)) ((_ sign_extend 32) noOfBytes!1)))))

(declare-fun b!127528 () Bool)

(declare-fun e!84221 () Bool)

(assert (=> b!127528 (= e!84221 e!84220)))

(declare-fun res!105733 () Bool)

(assert (=> b!127528 (=> (not res!105733) (not e!84220))))

(declare-fun lt!198877 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!127528 (= res!105733 (= (bitIndex!0 (size!2619 (buf!3007 (_2!5670 lt!198878))) (currentByte!5752 (_2!5670 lt!198878)) (currentBit!5747 (_2!5670 lt!198878))) (bvadd (bitIndex!0 (size!2619 (buf!3007 thiss!1614)) (currentByte!5752 thiss!1614) (currentBit!5747 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!198877))))))

(assert (=> b!127528 (= lt!198877 ((_ sign_extend 32) noOfBytes!1))))

(declare-fun b!127529 () Bool)

(declare-fun e!84222 () Bool)

(assert (=> b!127529 (= e!84222 e!84227)))

(declare-fun res!105725 () Bool)

(assert (=> b!127529 (=> res!105725 e!84227)))

(assert (=> b!127529 (= res!105725 (bvslt ((_ sign_extend 32) noOfBytes!1) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!10766 0))(
  ( (tuple2!10767 (_1!5671 BitStream!4562) (_2!5671 BitStream!4562)) )
))
(declare-fun lt!198879 () tuple2!10766)

(declare-fun reader!0 (BitStream!4562 BitStream!4562) tuple2!10766)

(assert (=> b!127529 (= lt!198879 (reader!0 thiss!1614 (_2!5670 lt!198878)))))

(declare-fun res!105730 () Bool)

(assert (=> start!25162 (=> (not res!105730) (not e!84223))))

(assert (=> start!25162 (= res!105730 (and (bvsle #b00000000000000000000000000000000 noOfBytes!1) (bvsle noOfBytes!1 (size!2619 arr!227))))))

(assert (=> start!25162 e!84223))

(assert (=> start!25162 true))

(assert (=> start!25162 (array_inv!2408 arr!227)))

(declare-fun inv!12 (BitStream!4562) Bool)

(assert (=> start!25162 (and (inv!12 thiss!1614) e!84226)))

(declare-fun b!127530 () Bool)

(assert (=> b!127530 (= e!84220 (not e!84225))))

(declare-fun res!105727 () Bool)

(assert (=> b!127530 (=> res!105727 e!84225)))

(declare-fun lt!198880 () tuple2!10766)

(assert (=> b!127530 (= res!105727 (or (not (= (size!2619 (_2!5669 lt!198881)) (size!2619 arr!227))) (not (= (_1!5669 lt!198881) (_2!5671 lt!198880)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4562 array!5787 (_ BitVec 32) (_ BitVec 32)) tuple2!10762)

(assert (=> b!127530 (= lt!198881 (readByteArrayLoopPure!0 (_1!5671 lt!198880) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(assert (=> b!127530 (validate_offset_bits!1 ((_ sign_extend 32) (size!2619 (buf!3007 (_2!5670 lt!198878)))) ((_ sign_extend 32) (currentByte!5752 thiss!1614)) ((_ sign_extend 32) (currentBit!5747 thiss!1614)) lt!198877)))

(declare-fun lt!198876 () Unit!7841)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4562 array!5787 (_ BitVec 64)) Unit!7841)

(assert (=> b!127530 (= lt!198876 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!3007 (_2!5670 lt!198878)) lt!198877))))

(assert (=> b!127530 (= lt!198880 (reader!0 thiss!1614 (_2!5670 lt!198878)))))

(declare-fun b!127531 () Bool)

(assert (=> b!127531 (= e!84223 (not e!84222))))

(declare-fun res!105731 () Bool)

(assert (=> b!127531 (=> res!105731 e!84222)))

(assert (=> b!127531 (= res!105731 (not (= (bitIndex!0 (size!2619 (buf!3007 (_2!5670 lt!198878))) (currentByte!5752 (_2!5670 lt!198878)) (currentBit!5747 (_2!5670 lt!198878))) (bvadd (bitIndex!0 (size!2619 (buf!3007 thiss!1614)) (currentByte!5752 thiss!1614) (currentBit!5747 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) noOfBytes!1))))))))

(assert (=> b!127531 e!84221))

(declare-fun res!105732 () Bool)

(assert (=> b!127531 (=> (not res!105732) (not e!84221))))

(assert (=> b!127531 (= res!105732 (= (size!2619 (buf!3007 thiss!1614)) (size!2619 (buf!3007 (_2!5670 lt!198878)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4562 array!5787 (_ BitVec 32) (_ BitVec 32)) tuple2!10764)

(assert (=> b!127531 (= lt!198878 (appendByteArrayLoop!0 thiss!1614 arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun b!127532 () Bool)

(declare-fun res!105729 () Bool)

(assert (=> b!127532 (=> res!105729 e!84222)))

(assert (=> b!127532 (= res!105729 (not (isPrefixOf!0 thiss!1614 (_2!5670 lt!198878))))))

(assert (= (and start!25162 res!105730) b!127524))

(assert (= (and b!127524 res!105728) b!127531))

(assert (= (and b!127531 res!105732) b!127528))

(assert (= (and b!127528 res!105733) b!127525))

(assert (= (and b!127525 res!105726) b!127530))

(assert (= (and b!127530 (not res!105727)) b!127523))

(assert (= (and b!127531 (not res!105731)) b!127532))

(assert (= (and b!127532 (not res!105729)) b!127529))

(assert (= (and b!127529 (not res!105725)) b!127527))

(assert (= start!25162 b!127526))

(declare-fun m!193211 () Bool)

(assert (=> b!127532 m!193211))

(declare-fun m!193213 () Bool)

(assert (=> start!25162 m!193213))

(declare-fun m!193215 () Bool)

(assert (=> start!25162 m!193215))

(assert (=> b!127525 m!193211))

(declare-fun m!193217 () Bool)

(assert (=> b!127528 m!193217))

(declare-fun m!193219 () Bool)

(assert (=> b!127528 m!193219))

(declare-fun m!193221 () Bool)

(assert (=> b!127526 m!193221))

(assert (=> b!127531 m!193217))

(assert (=> b!127531 m!193219))

(declare-fun m!193223 () Bool)

(assert (=> b!127531 m!193223))

(declare-fun m!193225 () Bool)

(assert (=> b!127527 m!193225))

(declare-fun m!193227 () Bool)

(assert (=> b!127523 m!193227))

(declare-fun m!193229 () Bool)

(assert (=> b!127524 m!193229))

(declare-fun m!193231 () Bool)

(assert (=> b!127529 m!193231))

(declare-fun m!193233 () Bool)

(assert (=> b!127530 m!193233))

(declare-fun m!193235 () Bool)

(assert (=> b!127530 m!193235))

(declare-fun m!193237 () Bool)

(assert (=> b!127530 m!193237))

(assert (=> b!127530 m!193231))

(push 1)

(assert (not b!127531))

(assert (not b!127526))

(assert (not b!127523))

(assert (not b!127527))

(assert (not start!25162))

(assert (not b!127530))

(assert (not b!127532))

(assert (not b!127525))

(assert (not b!127529))

(assert (not b!127528))

(assert (not b!127524))

(check-sat)

(pop 1)

(push 1)

(check-sat)

