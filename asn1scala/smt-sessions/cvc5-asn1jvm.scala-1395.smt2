; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38484 () Bool)

(assert start!38484)

(declare-fun b!172868 () Bool)

(declare-fun res!143170 () Bool)

(declare-fun e!120768 () Bool)

(assert (=> b!172868 (=> (not res!143170) (not e!120768))))

(declare-datatypes ((array!9290 0))(
  ( (array!9291 (arr!5029 (Array (_ BitVec 32) (_ BitVec 8))) (size!4099 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7306 0))(
  ( (BitStream!7307 (buf!4527 array!9290) (currentByte!8614 (_ BitVec 32)) (currentBit!8609 (_ BitVec 32))) )
))
(declare-fun thiss!1187 () BitStream!7306)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!172868 (= res!143170 (invariant!0 (currentBit!8609 thiss!1187) (currentByte!8614 thiss!1187) (size!4099 (buf!4527 thiss!1187))))))

(declare-fun res!143171 () Bool)

(assert (=> start!38484 (=> (not res!143171) (not e!120768))))

(declare-fun nBits!340 () (_ BitVec 32))

(assert (=> start!38484 (= res!143171 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000)))))

(assert (=> start!38484 e!120768))

(assert (=> start!38484 true))

(declare-fun e!120766 () Bool)

(declare-fun inv!12 (BitStream!7306) Bool)

(assert (=> start!38484 (and (inv!12 thiss!1187) e!120766)))

(declare-fun b!172869 () Bool)

(declare-fun e!120769 () Bool)

(assert (=> b!172869 (= e!120768 e!120769)))

(declare-fun res!143169 () Bool)

(assert (=> b!172869 (=> (not res!143169) (not e!120769))))

(declare-datatypes ((Unit!12367 0))(
  ( (Unit!12368) )
))
(declare-datatypes ((tuple2!14860 0))(
  ( (tuple2!14861 (_1!8072 Unit!12367) (_2!8072 BitStream!7306)) )
))
(declare-fun lt!266560 () tuple2!14860)

(assert (=> b!172869 (= res!143169 (= (size!4099 (buf!4527 (_2!8072 lt!266560))) (size!4099 (buf!4527 thiss!1187))))))

(declare-fun v!186 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7306 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!14860)

(assert (=> b!172869 (= lt!266560 (appendBitsLSBFirstLoopTR!0 thiss!1187 v!186 nBits!340 #b00000000000000000000000000000000))))

(declare-fun b!172870 () Bool)

(assert (=> b!172870 (= e!120769 false)))

(declare-fun lt!266561 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!172870 (= lt!266561 (bitIndex!0 (size!4099 (buf!4527 (_2!8072 lt!266560))) (currentByte!8614 (_2!8072 lt!266560)) (currentBit!8609 (_2!8072 lt!266560))))))

(declare-fun lt!266559 () (_ BitVec 64))

(assert (=> b!172870 (= lt!266559 (bitIndex!0 (size!4099 (buf!4527 thiss!1187)) (currentByte!8614 thiss!1187) (currentBit!8609 thiss!1187)))))

(declare-fun b!172871 () Bool)

(declare-fun array_inv!3840 (array!9290) Bool)

(assert (=> b!172871 (= e!120766 (array_inv!3840 (buf!4527 thiss!1187)))))

(declare-fun b!172872 () Bool)

(declare-fun res!143172 () Bool)

(assert (=> b!172872 (=> (not res!143172) (not e!120768))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!172872 (= res!143172 (validate_offset_bits!1 ((_ sign_extend 32) (size!4099 (buf!4527 thiss!1187))) ((_ sign_extend 32) (currentByte!8614 thiss!1187)) ((_ sign_extend 32) (currentBit!8609 thiss!1187)) ((_ sign_extend 32) nBits!340)))))

(assert (= (and start!38484 res!143171) b!172872))

(assert (= (and b!172872 res!143172) b!172868))

(assert (= (and b!172868 res!143170) b!172869))

(assert (= (and b!172869 res!143169) b!172870))

(assert (= start!38484 b!172871))

(declare-fun m!272043 () Bool)

(assert (=> start!38484 m!272043))

(declare-fun m!272045 () Bool)

(assert (=> b!172870 m!272045))

(declare-fun m!272047 () Bool)

(assert (=> b!172870 m!272047))

(declare-fun m!272049 () Bool)

(assert (=> b!172871 m!272049))

(declare-fun m!272051 () Bool)

(assert (=> b!172868 m!272051))

(declare-fun m!272053 () Bool)

(assert (=> b!172869 m!272053))

(declare-fun m!272055 () Bool)

(assert (=> b!172872 m!272055))

(push 1)

(assert (not b!172872))

(assert (not start!38484))

(assert (not b!172870))

(assert (not b!172869))

(assert (not b!172871))

(assert (not b!172868))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

