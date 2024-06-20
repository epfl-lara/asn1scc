; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72392 () Bool)

(assert start!72392)

(declare-fun res!265978 () Bool)

(declare-fun e!233488 () Bool)

(assert (=> start!72392 (=> (not res!265978) (not e!233488))))

(declare-datatypes ((array!20749 0))(
  ( (array!20750 (arr!10120 (Array (_ BitVec 32) (_ BitVec 8))) (size!9028 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14218 0))(
  ( (BitStream!14219 (buf!8170 array!20749) (currentByte!15068 (_ BitVec 32)) (currentBit!15063 (_ BitVec 32))) )
))
(declare-fun thiss!1702 () BitStream!14218)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!72392 (= res!265978 (validate_offset_bit!0 ((_ sign_extend 32) (size!9028 (buf!8170 thiss!1702))) ((_ sign_extend 32) (currentByte!15068 thiss!1702)) ((_ sign_extend 32) (currentBit!15063 thiss!1702))))))

(assert (=> start!72392 e!233488))

(declare-fun e!233489 () Bool)

(declare-fun inv!12 (BitStream!14218) Bool)

(assert (=> start!72392 (and (inv!12 thiss!1702) e!233489)))

(declare-fun b!324042 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!324042 (= e!233488 (bvsle (remainingBits!0 ((_ sign_extend 32) (size!9028 (buf!8170 thiss!1702))) ((_ sign_extend 32) (currentByte!15068 thiss!1702)) ((_ sign_extend 32) (currentBit!15063 thiss!1702))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!324043 () Bool)

(declare-fun array_inv!8580 (array!20749) Bool)

(assert (=> b!324043 (= e!233489 (array_inv!8580 (buf!8170 thiss!1702)))))

(assert (= (and start!72392 res!265978) b!324042))

(assert (= start!72392 b!324043))

(declare-fun m!462119 () Bool)

(assert (=> start!72392 m!462119))

(declare-fun m!462121 () Bool)

(assert (=> start!72392 m!462121))

(declare-fun m!462123 () Bool)

(assert (=> b!324042 m!462123))

(declare-fun m!462125 () Bool)

(assert (=> b!324043 m!462125))

(push 1)

(assert (not b!324042))

(assert (not start!72392))

(assert (not b!324043))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!106332 () Bool)

(assert (=> d!106332 (= (remainingBits!0 ((_ sign_extend 32) (size!9028 (buf!8170 thiss!1702))) ((_ sign_extend 32) (currentByte!15068 thiss!1702)) ((_ sign_extend 32) (currentBit!15063 thiss!1702))) (bvsub (bvmul ((_ sign_extend 32) (size!9028 (buf!8170 thiss!1702))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15068 thiss!1702)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15063 thiss!1702)))))))

(assert (=> b!324042 d!106332))

(declare-fun d!106342 () Bool)

(assert (=> d!106342 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!9028 (buf!8170 thiss!1702))) ((_ sign_extend 32) (currentByte!15068 thiss!1702)) ((_ sign_extend 32) (currentBit!15063 thiss!1702))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!9028 (buf!8170 thiss!1702))) ((_ sign_extend 32) (currentByte!15068 thiss!1702)) ((_ sign_extend 32) (currentBit!15063 thiss!1702))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!28014 () Bool)

(assert (= bs!28014 d!106342))

(assert (=> bs!28014 m!462123))

(assert (=> start!72392 d!106342))

(declare-fun d!106348 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!106348 (= (inv!12 thiss!1702) (invariant!0 (currentBit!15063 thiss!1702) (currentByte!15068 thiss!1702) (size!9028 (buf!8170 thiss!1702))))))

(declare-fun bs!28017 () Bool)

(assert (= bs!28017 d!106348))

(declare-fun m!462147 () Bool)

(assert (=> bs!28017 m!462147))

(assert (=> start!72392 d!106348))

(declare-fun d!106352 () Bool)

(assert (=> d!106352 (= (array_inv!8580 (buf!8170 thiss!1702)) (bvsge (size!9028 (buf!8170 thiss!1702)) #b00000000000000000000000000000000))))

(assert (=> b!324043 d!106352))

(push 1)

(assert (not d!106342))

(assert (not d!106348))

(check-sat)

(pop 1)

(push 1)

(check-sat)

