; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38494 () Bool)

(assert start!38494)

(declare-fun res!143250 () Bool)

(declare-fun e!120829 () Bool)

(assert (=> start!38494 (=> (not res!143250) (not e!120829))))

(declare-fun nBits!340 () (_ BitVec 32))

(assert (=> start!38494 (= res!143250 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000)))))

(assert (=> start!38494 e!120829))

(assert (=> start!38494 true))

(declare-datatypes ((array!9300 0))(
  ( (array!9301 (arr!5034 (Array (_ BitVec 32) (_ BitVec 8))) (size!4104 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7316 0))(
  ( (BitStream!7317 (buf!4532 array!9300) (currentByte!8619 (_ BitVec 32)) (currentBit!8614 (_ BitVec 32))) )
))
(declare-fun thiss!1187 () BitStream!7316)

(declare-fun e!120827 () Bool)

(declare-fun inv!12 (BitStream!7316) Bool)

(assert (=> start!38494 (and (inv!12 thiss!1187) e!120827)))

(declare-fun b!172959 () Bool)

(declare-fun e!120826 () Bool)

(assert (=> b!172959 (= e!120829 e!120826)))

(declare-fun res!143249 () Bool)

(assert (=> b!172959 (=> (not res!143249) (not e!120826))))

(declare-datatypes ((Unit!12377 0))(
  ( (Unit!12378) )
))
(declare-datatypes ((tuple2!14870 0))(
  ( (tuple2!14871 (_1!8077 Unit!12377) (_2!8077 BitStream!7316)) )
))
(declare-fun lt!266597 () tuple2!14870)

(assert (=> b!172959 (= res!143249 (= (size!4104 (buf!4532 (_2!8077 lt!266597))) (size!4104 (buf!4532 thiss!1187))))))

(declare-fun v!186 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7316 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!14870)

(assert (=> b!172959 (= lt!266597 (appendBitsLSBFirstLoopTR!0 thiss!1187 v!186 nBits!340 #b00000000000000000000000000000000))))

(declare-fun b!172960 () Bool)

(declare-fun array_inv!3845 (array!9300) Bool)

(assert (=> b!172960 (= e!120827 (array_inv!3845 (buf!4532 thiss!1187)))))

(declare-fun b!172961 () Bool)

(declare-fun res!143245 () Bool)

(assert (=> b!172961 (=> (not res!143245) (not e!120826))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!172961 (= res!143245 (= (bitIndex!0 (size!4104 (buf!4532 (_2!8077 lt!266597))) (currentByte!8619 (_2!8077 lt!266597)) (currentBit!8614 (_2!8077 lt!266597))) (bvadd (bitIndex!0 (size!4104 (buf!4532 thiss!1187)) (currentByte!8619 thiss!1187) (currentBit!8614 thiss!1187)) ((_ sign_extend 32) nBits!340))))))

(declare-fun b!172962 () Bool)

(declare-fun res!143247 () Bool)

(assert (=> b!172962 (=> (not res!143247) (not e!120829))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!172962 (= res!143247 (validate_offset_bits!1 ((_ sign_extend 32) (size!4104 (buf!4532 thiss!1187))) ((_ sign_extend 32) (currentByte!8619 thiss!1187)) ((_ sign_extend 32) (currentBit!8614 thiss!1187)) ((_ sign_extend 32) nBits!340)))))

(declare-fun b!172963 () Bool)

(declare-fun res!143248 () Bool)

(assert (=> b!172963 (=> (not res!143248) (not e!120826))))

(assert (=> b!172963 (= res!143248 (= (size!4104 (buf!4532 thiss!1187)) (size!4104 (buf!4532 (_2!8077 lt!266597)))))))

(declare-fun b!172964 () Bool)

(declare-fun res!143246 () Bool)

(assert (=> b!172964 (=> (not res!143246) (not e!120829))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!172964 (= res!143246 (invariant!0 (currentBit!8614 thiss!1187) (currentByte!8619 thiss!1187) (size!4104 (buf!4532 thiss!1187))))))

(declare-fun b!172965 () Bool)

(assert (=> b!172965 (= e!120826 false)))

(declare-fun lt!266596 () Bool)

(declare-fun isPrefixOf!0 (BitStream!7316 BitStream!7316) Bool)

(assert (=> b!172965 (= lt!266596 (isPrefixOf!0 thiss!1187 (_2!8077 lt!266597)))))

(assert (= (and start!38494 res!143250) b!172962))

(assert (= (and b!172962 res!143247) b!172964))

(assert (= (and b!172964 res!143246) b!172959))

(assert (= (and b!172959 res!143249) b!172961))

(assert (= (and b!172961 res!143245) b!172963))

(assert (= (and b!172963 res!143248) b!172965))

(assert (= start!38494 b!172960))

(declare-fun m!272117 () Bool)

(assert (=> b!172964 m!272117))

(declare-fun m!272119 () Bool)

(assert (=> start!38494 m!272119))

(declare-fun m!272121 () Bool)

(assert (=> b!172962 m!272121))

(declare-fun m!272123 () Bool)

(assert (=> b!172960 m!272123))

(declare-fun m!272125 () Bool)

(assert (=> b!172959 m!272125))

(declare-fun m!272127 () Bool)

(assert (=> b!172965 m!272127))

(declare-fun m!272129 () Bool)

(assert (=> b!172961 m!272129))

(declare-fun m!272131 () Bool)

(assert (=> b!172961 m!272131))

(push 1)

(assert (not b!172960))

(assert (not b!172959))

(assert (not b!172962))

(assert (not start!38494))

(assert (not b!172964))

(assert (not b!172961))

(assert (not b!172965))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

