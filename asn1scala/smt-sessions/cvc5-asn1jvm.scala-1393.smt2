; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38436 () Bool)

(assert start!38436)

(declare-fun b!172600 () Bool)

(declare-fun res!142955 () Bool)

(declare-fun e!120608 () Bool)

(assert (=> b!172600 (=> (not res!142955) (not e!120608))))

(declare-datatypes ((array!9275 0))(
  ( (array!9276 (arr!5023 (Array (_ BitVec 32) (_ BitVec 8))) (size!4093 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7294 0))(
  ( (BitStream!7295 (buf!4521 array!9275) (currentByte!8599 (_ BitVec 32)) (currentBit!8594 (_ BitVec 32))) )
))
(declare-fun thiss!1187 () BitStream!7294)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!172600 (= res!142955 (invariant!0 (currentBit!8594 thiss!1187) (currentByte!8599 thiss!1187) (size!4093 (buf!4521 thiss!1187))))))

(declare-fun b!172601 () Bool)

(assert (=> b!172601 (= e!120608 false)))

(declare-fun nBits!340 () (_ BitVec 32))

(declare-fun v!186 () (_ BitVec 64))

(declare-datatypes ((Unit!12333 0))(
  ( (Unit!12334) )
))
(declare-datatypes ((tuple2!14836 0))(
  ( (tuple2!14837 (_1!8060 Unit!12333) (_2!8060 BitStream!7294)) )
))
(declare-fun lt!265961 () tuple2!14836)

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7294 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!14836)

(assert (=> b!172601 (= lt!265961 (appendBitsLSBFirstLoopTR!0 thiss!1187 v!186 nBits!340 #b00000000000000000000000000000000))))

(declare-fun b!172599 () Bool)

(declare-fun res!142956 () Bool)

(assert (=> b!172599 (=> (not res!142956) (not e!120608))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!172599 (= res!142956 (validate_offset_bits!1 ((_ sign_extend 32) (size!4093 (buf!4521 thiss!1187))) ((_ sign_extend 32) (currentByte!8599 thiss!1187)) ((_ sign_extend 32) (currentBit!8594 thiss!1187)) ((_ sign_extend 32) nBits!340)))))

(declare-fun b!172602 () Bool)

(declare-fun e!120609 () Bool)

(declare-fun array_inv!3834 (array!9275) Bool)

(assert (=> b!172602 (= e!120609 (array_inv!3834 (buf!4521 thiss!1187)))))

(declare-fun res!142954 () Bool)

(assert (=> start!38436 (=> (not res!142954) (not e!120608))))

(assert (=> start!38436 (= res!142954 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000)))))

(assert (=> start!38436 e!120608))

(assert (=> start!38436 true))

(declare-fun inv!12 (BitStream!7294) Bool)

(assert (=> start!38436 (and (inv!12 thiss!1187) e!120609)))

(assert (= (and start!38436 res!142954) b!172599))

(assert (= (and b!172599 res!142956) b!172600))

(assert (= (and b!172600 res!142955) b!172601))

(assert (= start!38436 b!172602))

(declare-fun m!271765 () Bool)

(assert (=> b!172601 m!271765))

(declare-fun m!271767 () Bool)

(assert (=> b!172599 m!271767))

(declare-fun m!271769 () Bool)

(assert (=> b!172600 m!271769))

(declare-fun m!271771 () Bool)

(assert (=> b!172602 m!271771))

(declare-fun m!271773 () Bool)

(assert (=> start!38436 m!271773))

(push 1)

(assert (not b!172602))

(assert (not b!172601))

(assert (not b!172599))

(assert (not b!172600))

(assert (not start!38436))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

