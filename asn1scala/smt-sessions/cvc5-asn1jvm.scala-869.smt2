; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25068 () Bool)

(assert start!25068)

(declare-fun res!105273 () Bool)

(declare-fun e!83803 () Bool)

(assert (=> start!25068 (=> (not res!105273) (not e!83803))))

(declare-fun noOfBytes!1 () (_ BitVec 32))

(declare-datatypes ((array!5756 0))(
  ( (array!5757 (arr!3216 (Array (_ BitVec 32) (_ BitVec 8))) (size!2605 (_ BitVec 32))) )
))
(declare-fun arr!227 () array!5756)

(assert (=> start!25068 (= res!105273 (and (bvsle #b00000000000000000000000000000000 noOfBytes!1) (bvsle noOfBytes!1 (size!2605 arr!227))))))

(assert (=> start!25068 e!83803))

(assert (=> start!25068 true))

(declare-fun array_inv!2394 (array!5756) Bool)

(assert (=> start!25068 (array_inv!2394 arr!227)))

(declare-datatypes ((BitStream!4534 0))(
  ( (BitStream!4535 (buf!2990 array!5756) (currentByte!5729 (_ BitVec 32)) (currentBit!5724 (_ BitVec 32))) )
))
(declare-fun thiss!1614 () BitStream!4534)

(declare-fun e!83801 () Bool)

(declare-fun inv!12 (BitStream!4534) Bool)

(assert (=> start!25068 (and (inv!12 thiss!1614) e!83801)))

(declare-fun b!127010 () Bool)

(declare-fun res!105275 () Bool)

(assert (=> b!127010 (=> (not res!105275) (not e!83803))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!127010 (= res!105275 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2605 (buf!2990 thiss!1614))) ((_ sign_extend 32) (currentByte!5729 thiss!1614)) ((_ sign_extend 32) (currentBit!5724 thiss!1614)) noOfBytes!1))))

(declare-fun b!127011 () Bool)

(declare-fun e!83798 () Bool)

(declare-fun e!83800 () Bool)

(assert (=> b!127011 (= e!83798 (not e!83800))))

(declare-fun res!105274 () Bool)

(assert (=> b!127011 (=> res!105274 e!83800)))

(declare-datatypes ((tuple2!10678 0))(
  ( (tuple2!10679 (_1!5624 BitStream!4534) (_2!5624 BitStream!4534)) )
))
(declare-fun lt!198255 () tuple2!10678)

(declare-datatypes ((tuple2!10680 0))(
  ( (tuple2!10681 (_1!5625 BitStream!4534) (_2!5625 array!5756)) )
))
(declare-fun lt!198256 () tuple2!10680)

(assert (=> b!127011 (= res!105274 (or (not (= (size!2605 (_2!5625 lt!198256)) (size!2605 arr!227))) (not (= (_1!5625 lt!198256) (_2!5624 lt!198255)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4534 array!5756 (_ BitVec 32) (_ BitVec 32)) tuple2!10680)

(assert (=> b!127011 (= lt!198256 (readByteArrayLoopPure!0 (_1!5624 lt!198255) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-datatypes ((Unit!7810 0))(
  ( (Unit!7811) )
))
(declare-datatypes ((tuple2!10682 0))(
  ( (tuple2!10683 (_1!5626 Unit!7810) (_2!5626 BitStream!4534)) )
))
(declare-fun lt!198259 () tuple2!10682)

(declare-fun lt!198260 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!127011 (validate_offset_bits!1 ((_ sign_extend 32) (size!2605 (buf!2990 (_2!5626 lt!198259)))) ((_ sign_extend 32) (currentByte!5729 thiss!1614)) ((_ sign_extend 32) (currentBit!5724 thiss!1614)) lt!198260)))

(declare-fun lt!198257 () Unit!7810)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4534 array!5756 (_ BitVec 64)) Unit!7810)

(assert (=> b!127011 (= lt!198257 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!2990 (_2!5626 lt!198259)) lt!198260))))

(declare-fun reader!0 (BitStream!4534 BitStream!4534) tuple2!10678)

(assert (=> b!127011 (= lt!198255 (reader!0 thiss!1614 (_2!5626 lt!198259)))))

(declare-fun b!127012 () Bool)

(declare-fun e!83802 () Bool)

(assert (=> b!127012 (= e!83802 e!83798)))

(declare-fun res!105277 () Bool)

(assert (=> b!127012 (=> (not res!105277) (not e!83798))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!127012 (= res!105277 (= (bitIndex!0 (size!2605 (buf!2990 (_2!5626 lt!198259))) (currentByte!5729 (_2!5626 lt!198259)) (currentBit!5724 (_2!5626 lt!198259))) (bvadd (bitIndex!0 (size!2605 (buf!2990 thiss!1614)) (currentByte!5729 thiss!1614) (currentBit!5724 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!198260))))))

(assert (=> b!127012 (= lt!198260 ((_ sign_extend 32) noOfBytes!1))))

(declare-fun b!127013 () Bool)

(assert (=> b!127013 (= e!83803 (not (or (= ((_ sign_extend 32) noOfBytes!1) #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) noOfBytes!1)) ((_ sign_extend 32) noOfBytes!1))))))))

(declare-fun lt!198258 () (_ BitVec 64))

(assert (=> b!127013 (= lt!198258 (bitIndex!0 (size!2605 (buf!2990 thiss!1614)) (currentByte!5729 thiss!1614) (currentBit!5724 thiss!1614)))))

(assert (=> b!127013 e!83802))

(declare-fun res!105272 () Bool)

(assert (=> b!127013 (=> (not res!105272) (not e!83802))))

(assert (=> b!127013 (= res!105272 (= (size!2605 (buf!2990 thiss!1614)) (size!2605 (buf!2990 (_2!5626 lt!198259)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4534 array!5756 (_ BitVec 32) (_ BitVec 32)) tuple2!10682)

(assert (=> b!127013 (= lt!198259 (appendByteArrayLoop!0 thiss!1614 arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun b!127014 () Bool)

(declare-fun arrayRangesEq!89 (array!5756 array!5756 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!127014 (= e!83800 (not (arrayRangesEq!89 arr!227 (_2!5625 lt!198256) #b00000000000000000000000000000000 noOfBytes!1)))))

(declare-fun b!127015 () Bool)

(declare-fun res!105276 () Bool)

(assert (=> b!127015 (=> (not res!105276) (not e!83798))))

(declare-fun isPrefixOf!0 (BitStream!4534 BitStream!4534) Bool)

(assert (=> b!127015 (= res!105276 (isPrefixOf!0 thiss!1614 (_2!5626 lt!198259)))))

(declare-fun b!127016 () Bool)

(assert (=> b!127016 (= e!83801 (array_inv!2394 (buf!2990 thiss!1614)))))

(assert (= (and start!25068 res!105273) b!127010))

(assert (= (and b!127010 res!105275) b!127013))

(assert (= (and b!127013 res!105272) b!127012))

(assert (= (and b!127012 res!105277) b!127015))

(assert (= (and b!127015 res!105276) b!127011))

(assert (= (and b!127011 (not res!105274)) b!127014))

(assert (= start!25068 b!127016))

(declare-fun m!192633 () Bool)

(assert (=> b!127011 m!192633))

(declare-fun m!192635 () Bool)

(assert (=> b!127011 m!192635))

(declare-fun m!192637 () Bool)

(assert (=> b!127011 m!192637))

(declare-fun m!192639 () Bool)

(assert (=> b!127011 m!192639))

(declare-fun m!192641 () Bool)

(assert (=> b!127015 m!192641))

(declare-fun m!192643 () Bool)

(assert (=> b!127016 m!192643))

(declare-fun m!192645 () Bool)

(assert (=> b!127012 m!192645))

(declare-fun m!192647 () Bool)

(assert (=> b!127012 m!192647))

(declare-fun m!192649 () Bool)

(assert (=> start!25068 m!192649))

(declare-fun m!192651 () Bool)

(assert (=> start!25068 m!192651))

(declare-fun m!192653 () Bool)

(assert (=> b!127010 m!192653))

(declare-fun m!192655 () Bool)

(assert (=> b!127014 m!192655))

(assert (=> b!127013 m!192647))

(declare-fun m!192657 () Bool)

(assert (=> b!127013 m!192657))

(push 1)

(assert (not start!25068))

(assert (not b!127016))

(assert (not b!127015))

(assert (not b!127012))

(assert (not b!127011))

(assert (not b!127010))

(assert (not b!127013))

(assert (not b!127014))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

