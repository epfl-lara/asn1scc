; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38164 () Bool)

(assert start!38164)

(declare-fun res!142370 () Bool)

(declare-fun e!120068 () Bool)

(assert (=> start!38164 (=> (not res!142370) (not e!120068))))

(declare-fun nBits!575 () (_ BitVec 32))

(assert (=> start!38164 (= res!142370 (and (bvsge nBits!575 #b00000000000000000000000000000000) (bvsle nBits!575 #b00000000000000000000000001000000)))))

(assert (=> start!38164 e!120068))

(assert (=> start!38164 true))

(declare-datatypes ((array!9193 0))(
  ( (array!9194 (arr!4992 (Array (_ BitVec 32) (_ BitVec 8))) (size!4062 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7232 0))(
  ( (BitStream!7233 (buf!4490 array!9193) (currentByte!8527 (_ BitVec 32)) (currentBit!8522 (_ BitVec 32))) )
))
(declare-fun thiss!1817 () BitStream!7232)

(declare-fun e!120070 () Bool)

(declare-fun inv!12 (BitStream!7232) Bool)

(assert (=> start!38164 (and (inv!12 thiss!1817) e!120070)))

(declare-fun b!171808 () Bool)

(declare-fun res!142371 () Bool)

(assert (=> b!171808 (=> (not res!142371) (not e!120068))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!171808 (= res!142371 (validate_offset_bits!1 ((_ sign_extend 32) (size!4062 (buf!4490 thiss!1817))) ((_ sign_extend 32) (currentByte!8527 thiss!1817)) ((_ sign_extend 32) (currentBit!8522 thiss!1817)) ((_ sign_extend 32) nBits!575)))))

(declare-fun b!171809 () Bool)

(assert (=> b!171809 (= e!120068 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!4062 (buf!4490 thiss!1817))) ((_ sign_extend 32) (currentByte!8527 thiss!1817)) ((_ sign_extend 32) (currentBit!8522 thiss!1817)) ((_ sign_extend 32) nBits!575))))))

(declare-fun b!171810 () Bool)

(declare-fun array_inv!3803 (array!9193) Bool)

(assert (=> b!171810 (= e!120070 (array_inv!3803 (buf!4490 thiss!1817)))))

(assert (= (and start!38164 res!142370) b!171808))

(assert (= (and b!171808 res!142371) b!171809))

(assert (= start!38164 b!171810))

(declare-fun m!271049 () Bool)

(assert (=> start!38164 m!271049))

(declare-fun m!271051 () Bool)

(assert (=> b!171808 m!271051))

(assert (=> b!171809 m!271051))

(declare-fun m!271053 () Bool)

(assert (=> b!171810 m!271053))

(push 1)

(assert (not b!171808))

(assert (not start!38164))

(assert (not b!171809))

(assert (not b!171810))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

