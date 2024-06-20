; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38590 () Bool)

(assert start!38590)

(declare-fun res!143831 () Bool)

(declare-fun e!121200 () Bool)

(assert (=> start!38590 (=> (not res!143831) (not e!121200))))

(declare-fun nBits!340 () (_ BitVec 32))

(assert (=> start!38590 (= res!143831 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000)))))

(assert (=> start!38590 e!121200))

(assert (=> start!38590 true))

(declare-datatypes ((array!9345 0))(
  ( (array!9346 (arr!5055 (Array (_ BitVec 32) (_ BitVec 8))) (size!4125 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7358 0))(
  ( (BitStream!7359 (buf!4556 array!9345) (currentByte!8649 (_ BitVec 32)) (currentBit!8644 (_ BitVec 32))) )
))
(declare-fun thiss!1187 () BitStream!7358)

(declare-fun e!121201 () Bool)

(declare-fun inv!12 (BitStream!7358) Bool)

(assert (=> start!38590 (and (inv!12 thiss!1187) e!121201)))

(declare-fun b!173662 () Bool)

(declare-fun res!143832 () Bool)

(assert (=> b!173662 (=> (not res!143832) (not e!121200))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!173662 (= res!143832 (validate_offset_bits!1 ((_ sign_extend 32) (size!4125 (buf!4556 thiss!1187))) ((_ sign_extend 32) (currentByte!8649 thiss!1187)) ((_ sign_extend 32) (currentBit!8644 thiss!1187)) ((_ sign_extend 32) nBits!340)))))

(declare-fun b!173663 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!173663 (= e!121200 (not (invariant!0 (currentBit!8644 thiss!1187) (currentByte!8649 thiss!1187) (size!4125 (buf!4556 thiss!1187)))))))

(declare-fun b!173664 () Bool)

(declare-fun array_inv!3866 (array!9345) Bool)

(assert (=> b!173664 (= e!121201 (array_inv!3866 (buf!4556 thiss!1187)))))

(assert (= (and start!38590 res!143831) b!173662))

(assert (= (and b!173662 res!143832) b!173663))

(assert (= start!38590 b!173664))

(declare-fun m!272929 () Bool)

(assert (=> start!38590 m!272929))

(declare-fun m!272931 () Bool)

(assert (=> b!173662 m!272931))

(declare-fun m!272933 () Bool)

(assert (=> b!173663 m!272933))

(declare-fun m!272935 () Bool)

(assert (=> b!173664 m!272935))

(push 1)

(assert (not b!173663))

(assert (not start!38590))

(assert (not b!173662))

(assert (not b!173664))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!61301 () Bool)

(assert (=> d!61301 (= (invariant!0 (currentBit!8644 thiss!1187) (currentByte!8649 thiss!1187) (size!4125 (buf!4556 thiss!1187))) (and (bvsge (currentBit!8644 thiss!1187) #b00000000000000000000000000000000) (bvslt (currentBit!8644 thiss!1187) #b00000000000000000000000000001000) (bvsge (currentByte!8649 thiss!1187) #b00000000000000000000000000000000) (or (bvslt (currentByte!8649 thiss!1187) (size!4125 (buf!4556 thiss!1187))) (and (= (currentBit!8644 thiss!1187) #b00000000000000000000000000000000) (= (currentByte!8649 thiss!1187) (size!4125 (buf!4556 thiss!1187)))))))))

(assert (=> b!173663 d!61301))

(declare-fun d!61307 () Bool)

(assert (=> d!61307 (= (inv!12 thiss!1187) (invariant!0 (currentBit!8644 thiss!1187) (currentByte!8649 thiss!1187) (size!4125 (buf!4556 thiss!1187))))))

(declare-fun bs!15272 () Bool)

