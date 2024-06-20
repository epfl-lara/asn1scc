; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15194 () Bool)

(assert start!15194)

(declare-fun b!77641 () Bool)

(declare-fun res!64164 () Bool)

(declare-fun e!50889 () Bool)

(assert (=> b!77641 (=> (not res!64164) (not e!50889))))

(declare-datatypes ((array!3254 0))(
  ( (array!3255 (arr!2112 (Array (_ BitVec 32) (_ BitVec 8))) (size!1511 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2596 0))(
  ( (BitStream!2597 (buf!1907 array!3254) (currentByte!3724 (_ BitVec 32)) (currentBit!3719 (_ BitVec 32))) )
))
(declare-fun thiss!1090 () BitStream!2596)

(declare-fun nBits!322 () (_ BitVec 64))

(declare-datatypes ((Unit!5119 0))(
  ( (Unit!5120) )
))
(declare-datatypes ((tuple2!6860 0))(
  ( (tuple2!6861 (_1!3564 Unit!5119) (_2!3564 BitStream!2596)) )
))
(declare-fun lt!124555 () tuple2!6860)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!77641 (= res!64164 (= (bitIndex!0 (size!1511 (buf!1907 (_2!3564 lt!124555))) (currentByte!3724 (_2!3564 lt!124555)) (currentBit!3719 (_2!3564 lt!124555))) (bvadd (bitIndex!0 (size!1511 (buf!1907 thiss!1090)) (currentByte!3724 thiss!1090) (currentBit!3719 thiss!1090)) nBits!322)))))

(declare-fun b!77642 () Bool)

(declare-fun res!64165 () Bool)

(declare-fun e!50890 () Bool)

(assert (=> b!77642 (=> (not res!64165) (not e!50890))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!77642 (= res!64165 (validate_offset_bits!1 ((_ sign_extend 32) (size!1511 (buf!1907 thiss!1090))) ((_ sign_extend 32) (currentByte!3724 thiss!1090)) ((_ sign_extend 32) (currentBit!3719 thiss!1090)) nBits!322))))

(declare-fun res!64166 () Bool)

(assert (=> start!15194 (=> (not res!64166) (not e!50890))))

(assert (=> start!15194 (= res!64166 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!322) (bvsle nBits!322 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15194 e!50890))

(assert (=> start!15194 true))

(declare-fun e!50891 () Bool)

(declare-fun inv!12 (BitStream!2596) Bool)

(assert (=> start!15194 (and (inv!12 thiss!1090) e!50891)))

(declare-fun b!77643 () Bool)

(assert (=> b!77643 (= e!50890 (not true))))

(declare-datatypes ((tuple2!6862 0))(
  ( (tuple2!6863 (_1!3565 BitStream!2596) (_2!3565 BitStream!2596)) )
))
(declare-fun lt!124554 () tuple2!6862)

(declare-fun reader!0 (BitStream!2596 BitStream!2596) tuple2!6862)

(assert (=> b!77643 (= lt!124554 (reader!0 thiss!1090 (_2!3564 lt!124555)))))

(declare-fun lt!124550 () Bool)

(declare-fun isPrefixOf!0 (BitStream!2596 BitStream!2596) Bool)

(assert (=> b!77643 (= lt!124550 (isPrefixOf!0 thiss!1090 (_2!3564 lt!124555)))))

(declare-fun lt!124553 () (_ BitVec 64))

(assert (=> b!77643 (= lt!124553 (bitIndex!0 (size!1511 (buf!1907 (_2!3564 lt!124555))) (currentByte!3724 (_2!3564 lt!124555)) (currentBit!3719 (_2!3564 lt!124555))))))

(declare-fun lt!124557 () (_ BitVec 64))

(assert (=> b!77643 (= lt!124557 (bitIndex!0 (size!1511 (buf!1907 thiss!1090)) (currentByte!3724 thiss!1090) (currentBit!3719 thiss!1090)))))

(assert (=> b!77643 e!50889))

(declare-fun res!64168 () Bool)

(assert (=> b!77643 (=> (not res!64168) (not e!50889))))

(assert (=> b!77643 (= res!64168 (= (size!1511 (buf!1907 thiss!1090)) (size!1511 (buf!1907 (_2!3564 lt!124555)))))))

(declare-fun appendNBits!0 (BitStream!2596 (_ BitVec 64) Bool) tuple2!6860)

(assert (=> b!77643 (= lt!124555 (appendNBits!0 thiss!1090 nBits!322 false))))

(declare-fun b!77644 () Bool)

(declare-datatypes ((tuple2!6864 0))(
  ( (tuple2!6865 (_1!3566 BitStream!2596) (_2!3566 Bool)) )
))
(declare-fun lt!124552 () tuple2!6864)

(declare-fun lt!124556 () tuple2!6862)

(assert (=> b!77644 (= e!50889 (not (or (not (_2!3566 lt!124552)) (not (= (_1!3566 lt!124552) (_2!3565 lt!124556))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!2596 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!6864)

(assert (=> b!77644 (= lt!124552 (checkBitsLoopPure!0 (_1!3565 lt!124556) nBits!322 false #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!77644 (validate_offset_bits!1 ((_ sign_extend 32) (size!1511 (buf!1907 (_2!3564 lt!124555)))) ((_ sign_extend 32) (currentByte!3724 thiss!1090)) ((_ sign_extend 32) (currentBit!3719 thiss!1090)) nBits!322)))

(declare-fun lt!124551 () Unit!5119)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2596 array!3254 (_ BitVec 64)) Unit!5119)

(assert (=> b!77644 (= lt!124551 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1090 (buf!1907 (_2!3564 lt!124555)) nBits!322))))

(assert (=> b!77644 (= lt!124556 (reader!0 thiss!1090 (_2!3564 lt!124555)))))

(declare-fun b!77645 () Bool)

(declare-fun res!64167 () Bool)

(assert (=> b!77645 (=> (not res!64167) (not e!50889))))

(assert (=> b!77645 (= res!64167 (isPrefixOf!0 thiss!1090 (_2!3564 lt!124555)))))

(declare-fun b!77646 () Bool)

(declare-fun array_inv!1357 (array!3254) Bool)

(assert (=> b!77646 (= e!50891 (array_inv!1357 (buf!1907 thiss!1090)))))

(assert (= (and start!15194 res!64166) b!77642))

(assert (= (and b!77642 res!64165) b!77643))

(assert (= (and b!77643 res!64168) b!77641))

(assert (= (and b!77641 res!64164) b!77645))

(assert (= (and b!77645 res!64167) b!77644))

(assert (= start!15194 b!77646))

(declare-fun m!123203 () Bool)

(assert (=> b!77644 m!123203))

(declare-fun m!123205 () Bool)

(assert (=> b!77644 m!123205))

(declare-fun m!123207 () Bool)

(assert (=> b!77644 m!123207))

(declare-fun m!123209 () Bool)

(assert (=> b!77644 m!123209))

(declare-fun m!123211 () Bool)

(assert (=> b!77641 m!123211))

(declare-fun m!123213 () Bool)

(assert (=> b!77641 m!123213))

(declare-fun m!123215 () Bool)

(assert (=> b!77642 m!123215))

(declare-fun m!123217 () Bool)

(assert (=> b!77643 m!123217))

(assert (=> b!77643 m!123209))

(assert (=> b!77643 m!123213))

(declare-fun m!123219 () Bool)

(assert (=> b!77643 m!123219))

(assert (=> b!77643 m!123211))

(assert (=> b!77645 m!123217))

(declare-fun m!123221 () Bool)

(assert (=> start!15194 m!123221))

(declare-fun m!123223 () Bool)

(assert (=> b!77646 m!123223))

(push 1)

(assert (not b!77642))

(assert (not b!77643))

(assert (not b!77645))

(assert (not b!77646))

(assert (not start!15194))

(assert (not b!77644))

(assert (not b!77641))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

