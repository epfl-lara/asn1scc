; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38440 () Bool)

(assert start!38440)

(declare-fun res!142974 () Bool)

(declare-fun e!120627 () Bool)

(assert (=> start!38440 (=> (not res!142974) (not e!120627))))

(declare-fun nBits!340 () (_ BitVec 32))

(assert (=> start!38440 (= res!142974 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000)))))

(assert (=> start!38440 e!120627))

(assert (=> start!38440 true))

(declare-datatypes ((array!9279 0))(
  ( (array!9280 (arr!5025 (Array (_ BitVec 32) (_ BitVec 8))) (size!4095 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7298 0))(
  ( (BitStream!7299 (buf!4523 array!9279) (currentByte!8601 (_ BitVec 32)) (currentBit!8596 (_ BitVec 32))) )
))
(declare-fun thiss!1187 () BitStream!7298)

(declare-fun e!120626 () Bool)

(declare-fun inv!12 (BitStream!7298) Bool)

(assert (=> start!38440 (and (inv!12 thiss!1187) e!120626)))

(declare-fun b!172625 () Bool)

(assert (=> b!172625 (= e!120627 false)))

(declare-fun v!186 () (_ BitVec 64))

(declare-datatypes ((Unit!12337 0))(
  ( (Unit!12338) )
))
(declare-datatypes ((tuple2!14840 0))(
  ( (tuple2!14841 (_1!8062 Unit!12337) (_2!8062 BitStream!7298)) )
))
(declare-fun lt!265967 () tuple2!14840)

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7298 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!14840)

(assert (=> b!172625 (= lt!265967 (appendBitsLSBFirstLoopTR!0 thiss!1187 v!186 nBits!340 #b00000000000000000000000000000000))))

(declare-fun b!172624 () Bool)

(declare-fun res!142972 () Bool)

(assert (=> b!172624 (=> (not res!142972) (not e!120627))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!172624 (= res!142972 (invariant!0 (currentBit!8596 thiss!1187) (currentByte!8601 thiss!1187) (size!4095 (buf!4523 thiss!1187))))))

(declare-fun b!172626 () Bool)

(declare-fun array_inv!3836 (array!9279) Bool)

(assert (=> b!172626 (= e!120626 (array_inv!3836 (buf!4523 thiss!1187)))))

(declare-fun b!172623 () Bool)

(declare-fun res!142973 () Bool)

(assert (=> b!172623 (=> (not res!142973) (not e!120627))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!172623 (= res!142973 (validate_offset_bits!1 ((_ sign_extend 32) (size!4095 (buf!4523 thiss!1187))) ((_ sign_extend 32) (currentByte!8601 thiss!1187)) ((_ sign_extend 32) (currentBit!8596 thiss!1187)) ((_ sign_extend 32) nBits!340)))))

(assert (= (and start!38440 res!142974) b!172623))

(assert (= (and b!172623 res!142973) b!172624))

(assert (= (and b!172624 res!142972) b!172625))

(assert (= start!38440 b!172626))

(declare-fun m!271785 () Bool)

(assert (=> b!172626 m!271785))

(declare-fun m!271787 () Bool)

(assert (=> b!172624 m!271787))

(declare-fun m!271789 () Bool)

(assert (=> b!172625 m!271789))

(declare-fun m!271791 () Bool)

(assert (=> b!172623 m!271791))

(declare-fun m!271793 () Bool)

(assert (=> start!38440 m!271793))

(push 1)

(assert (not b!172623))

(assert (not b!172626))

(assert (not b!172625))

(assert (not b!172624))

(assert (not start!38440))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

