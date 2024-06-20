; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38402 () Bool)

(assert start!38402)

(declare-fun res!142826 () Bool)

(declare-fun e!120506 () Bool)

(assert (=> start!38402 (=> (not res!142826) (not e!120506))))

(declare-fun nBits!340 () (_ BitVec 32))

(assert (=> start!38402 (= res!142826 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000)))))

(assert (=> start!38402 e!120506))

(assert (=> start!38402 true))

(declare-datatypes ((array!9268 0))(
  ( (array!9269 (arr!5021 (Array (_ BitVec 32) (_ BitVec 8))) (size!4091 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7290 0))(
  ( (BitStream!7291 (buf!4519 array!9268) (currentByte!8591 (_ BitVec 32)) (currentBit!8586 (_ BitVec 32))) )
))
(declare-fun thiss!1187 () BitStream!7290)

(declare-fun e!120508 () Bool)

(declare-fun inv!12 (BitStream!7290) Bool)

(assert (=> start!38402 (and (inv!12 thiss!1187) e!120508)))

(declare-fun b!172427 () Bool)

(declare-fun res!142825 () Bool)

(assert (=> b!172427 (=> (not res!142825) (not e!120506))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!172427 (= res!142825 (validate_offset_bits!1 ((_ sign_extend 32) (size!4091 (buf!4519 thiss!1187))) ((_ sign_extend 32) (currentByte!8591 thiss!1187)) ((_ sign_extend 32) (currentBit!8586 thiss!1187)) ((_ sign_extend 32) nBits!340)))))

(declare-fun b!172428 () Bool)

(declare-fun res!142824 () Bool)

(assert (=> b!172428 (=> (not res!142824) (not e!120506))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!172428 (= res!142824 (invariant!0 (currentBit!8586 thiss!1187) (currentByte!8591 thiss!1187) (size!4091 (buf!4519 thiss!1187))))))

(declare-fun b!172429 () Bool)

(declare-fun e!120505 () Bool)

(declare-datatypes ((Unit!12307 0))(
  ( (Unit!12308) )
))
(declare-datatypes ((tuple2!14820 0))(
  ( (tuple2!14821 (_1!8052 Unit!12307) (_2!8052 BitStream!7290)) )
))
(declare-fun lt!265451 () tuple2!14820)

(assert (=> b!172429 (= e!120505 (not (invariant!0 (currentBit!8586 (_2!8052 lt!265451)) (currentByte!8591 (_2!8052 lt!265451)) (size!4091 (buf!4519 (_2!8052 lt!265451))))))))

(declare-fun b!172430 () Bool)

(assert (=> b!172430 (= e!120506 e!120505)))

(declare-fun res!142827 () Bool)

(assert (=> b!172430 (=> (not res!142827) (not e!120505))))

(assert (=> b!172430 (= res!142827 (= (size!4091 (buf!4519 (_2!8052 lt!265451))) (size!4091 (buf!4519 thiss!1187))))))

(declare-fun v!186 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7290 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!14820)

(assert (=> b!172430 (= lt!265451 (appendBitsLSBFirstLoopTR!0 thiss!1187 v!186 nBits!340 #b00000000000000000000000000000000))))

(declare-fun b!172431 () Bool)

(declare-fun array_inv!3832 (array!9268) Bool)

(assert (=> b!172431 (= e!120508 (array_inv!3832 (buf!4519 thiss!1187)))))

(assert (= (and start!38402 res!142826) b!172427))

(assert (= (and b!172427 res!142825) b!172428))

(assert (= (and b!172428 res!142824) b!172430))

(assert (= (and b!172430 res!142827) b!172429))

(assert (= start!38402 b!172431))

(declare-fun m!271543 () Bool)

(assert (=> b!172430 m!271543))

(declare-fun m!271545 () Bool)

(assert (=> b!172428 m!271545))

(declare-fun m!271547 () Bool)

(assert (=> b!172427 m!271547))

(declare-fun m!271549 () Bool)

(assert (=> start!38402 m!271549))

(declare-fun m!271551 () Bool)

(assert (=> b!172429 m!271551))

(declare-fun m!271553 () Bool)

(assert (=> b!172431 m!271553))

(check-sat (not b!172427) (not start!38402) (not b!172429) (not b!172428) (not b!172431) (not b!172430))
(check-sat)
(get-model)

