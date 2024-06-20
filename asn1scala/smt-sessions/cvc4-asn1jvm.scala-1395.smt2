; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38488 () Bool)

(assert start!38488)

(declare-fun b!172898 () Bool)

(declare-fun e!120793 () Bool)

(declare-fun e!120792 () Bool)

(assert (=> b!172898 (= e!120793 e!120792)))

(declare-fun res!143196 () Bool)

(assert (=> b!172898 (=> (not res!143196) (not e!120792))))

(declare-datatypes ((array!9294 0))(
  ( (array!9295 (arr!5031 (Array (_ BitVec 32) (_ BitVec 8))) (size!4101 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7310 0))(
  ( (BitStream!7311 (buf!4529 array!9294) (currentByte!8616 (_ BitVec 32)) (currentBit!8611 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!12371 0))(
  ( (Unit!12372) )
))
(declare-datatypes ((tuple2!14864 0))(
  ( (tuple2!14865 (_1!8074 Unit!12371) (_2!8074 BitStream!7310)) )
))
(declare-fun lt!266579 () tuple2!14864)

(declare-fun thiss!1187 () BitStream!7310)

(assert (=> b!172898 (= res!143196 (= (size!4101 (buf!4529 (_2!8074 lt!266579))) (size!4101 (buf!4529 thiss!1187))))))

(declare-fun nBits!340 () (_ BitVec 32))

(declare-fun v!186 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7310 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!14864)

(assert (=> b!172898 (= lt!266579 (appendBitsLSBFirstLoopTR!0 thiss!1187 v!186 nBits!340 #b00000000000000000000000000000000))))

(declare-fun b!172899 () Bool)

(declare-fun e!120791 () Bool)

(declare-fun array_inv!3842 (array!9294) Bool)

(assert (=> b!172899 (= e!120791 (array_inv!3842 (buf!4529 thiss!1187)))))

(declare-fun b!172900 () Bool)

(assert (=> b!172900 (= e!120792 false)))

(declare-fun lt!266577 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!172900 (= lt!266577 (bitIndex!0 (size!4101 (buf!4529 (_2!8074 lt!266579))) (currentByte!8616 (_2!8074 lt!266579)) (currentBit!8611 (_2!8074 lt!266579))))))

(declare-fun lt!266578 () (_ BitVec 64))

(assert (=> b!172900 (= lt!266578 (bitIndex!0 (size!4101 (buf!4529 thiss!1187)) (currentByte!8616 thiss!1187) (currentBit!8611 thiss!1187)))))

(declare-fun res!143195 () Bool)

(assert (=> start!38488 (=> (not res!143195) (not e!120793))))

(assert (=> start!38488 (= res!143195 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000)))))

(assert (=> start!38488 e!120793))

(assert (=> start!38488 true))

(declare-fun inv!12 (BitStream!7310) Bool)

(assert (=> start!38488 (and (inv!12 thiss!1187) e!120791)))

(declare-fun b!172901 () Bool)

(declare-fun res!143193 () Bool)

(assert (=> b!172901 (=> (not res!143193) (not e!120793))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!172901 (= res!143193 (validate_offset_bits!1 ((_ sign_extend 32) (size!4101 (buf!4529 thiss!1187))) ((_ sign_extend 32) (currentByte!8616 thiss!1187)) ((_ sign_extend 32) (currentBit!8611 thiss!1187)) ((_ sign_extend 32) nBits!340)))))

(declare-fun b!172902 () Bool)

(declare-fun res!143194 () Bool)

(assert (=> b!172902 (=> (not res!143194) (not e!120793))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!172902 (= res!143194 (invariant!0 (currentBit!8611 thiss!1187) (currentByte!8616 thiss!1187) (size!4101 (buf!4529 thiss!1187))))))

(assert (= (and start!38488 res!143195) b!172901))

(assert (= (and b!172901 res!143193) b!172902))

(assert (= (and b!172902 res!143194) b!172898))

(assert (= (and b!172898 res!143196) b!172900))

(assert (= start!38488 b!172899))

(declare-fun m!272071 () Bool)

(assert (=> start!38488 m!272071))

(declare-fun m!272073 () Bool)

(assert (=> b!172900 m!272073))

(declare-fun m!272075 () Bool)

(assert (=> b!172900 m!272075))

(declare-fun m!272077 () Bool)

(assert (=> b!172899 m!272077))

(declare-fun m!272079 () Bool)

(assert (=> b!172901 m!272079))

(declare-fun m!272081 () Bool)

(assert (=> b!172898 m!272081))

(declare-fun m!272083 () Bool)

(assert (=> b!172902 m!272083))

(push 1)

(assert (not b!172898))

(assert (not b!172899))

(assert (not b!172901))

(assert (not start!38488))

(assert (not b!172902))

(assert (not b!172900))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

