; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72510 () Bool)

(assert start!72510)

(declare-fun res!266089 () Bool)

(declare-fun e!233626 () Bool)

(assert (=> start!72510 (=> (not res!266089) (not e!233626))))

(declare-datatypes ((array!20780 0))(
  ( (array!20781 (arr!10131 (Array (_ BitVec 32) (_ BitVec 8))) (size!9039 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14240 0))(
  ( (BitStream!14241 (buf!8181 array!20780) (currentByte!15103 (_ BitVec 32)) (currentBit!15098 (_ BitVec 32))) )
))
(declare-fun thiss!1702 () BitStream!14240)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!72510 (= res!266089 (validate_offset_bit!0 ((_ sign_extend 32) (size!9039 (buf!8181 thiss!1702))) ((_ sign_extend 32) (currentByte!15103 thiss!1702)) ((_ sign_extend 32) (currentBit!15098 thiss!1702))))))

(assert (=> start!72510 e!233626))

(declare-fun e!233627 () Bool)

(declare-fun inv!12 (BitStream!14240) Bool)

(assert (=> start!72510 (and (inv!12 thiss!1702) e!233627)))

(declare-fun b!324186 () Bool)

(assert (=> b!324186 (= e!233626 (or (bvslt (currentByte!15103 thiss!1702) #b00000000000000000000000000000000) (bvsge (currentByte!15103 thiss!1702) (size!9039 (buf!8181 thiss!1702)))))))

(declare-fun b!324187 () Bool)

(declare-fun array_inv!8591 (array!20780) Bool)

(assert (=> b!324187 (= e!233627 (array_inv!8591 (buf!8181 thiss!1702)))))

(assert (= (and start!72510 res!266089) b!324186))

(assert (= start!72510 b!324187))

(declare-fun m!462281 () Bool)

(assert (=> start!72510 m!462281))

(declare-fun m!462283 () Bool)

(assert (=> start!72510 m!462283))

(declare-fun m!462285 () Bool)

(assert (=> b!324187 m!462285))

(push 1)

(assert (not b!324187))

(assert (not start!72510))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!106460 () Bool)

(assert (=> d!106460 (= (array_inv!8591 (buf!8181 thiss!1702)) (bvsge (size!9039 (buf!8181 thiss!1702)) #b00000000000000000000000000000000))))

(assert (=> b!324187 d!106460))

(declare-fun d!106464 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!106464 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!9039 (buf!8181 thiss!1702))) ((_ sign_extend 32) (currentByte!15103 thiss!1702)) ((_ sign_extend 32) (currentBit!15098 thiss!1702))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!9039 (buf!8181 thiss!1702))) ((_ sign_extend 32) (currentByte!15103 thiss!1702)) ((_ sign_extend 32) (currentBit!15098 thiss!1702))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!28043 () Bool)

(assert (= bs!28043 d!106464))

(declare-fun m!462295 () Bool)

(assert (=> bs!28043 m!462295))

(assert (=> start!72510 d!106464))

(declare-fun d!106466 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!106466 (= (inv!12 thiss!1702) (invariant!0 (currentBit!15098 thiss!1702) (currentByte!15103 thiss!1702) (size!9039 (buf!8181 thiss!1702))))))

(declare-fun bs!28044 () Bool)

(assert (= bs!28044 d!106466))

(declare-fun m!462297 () Bool)

(assert (=> bs!28044 m!462297))

(assert (=> start!72510 d!106466))

(push 1)

(assert (not d!106466))

(assert (not d!106464))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!106476 () Bool)

(assert (=> d!106476 (= (invariant!0 (currentBit!15098 thiss!1702) (currentByte!15103 thiss!1702) (size!9039 (buf!8181 thiss!1702))) (and (bvsge (currentBit!15098 thiss!1702) #b00000000000000000000000000000000) (bvslt (currentBit!15098 thiss!1702) #b00000000000000000000000000001000) (bvsge (currentByte!15103 thiss!1702) #b00000000000000000000000000000000) (or (bvslt (currentByte!15103 thiss!1702) (size!9039 (buf!8181 thiss!1702))) (and (= (currentBit!15098 thiss!1702) #b00000000000000000000000000000000) (= (currentByte!15103 thiss!1702) (size!9039 (buf!8181 thiss!1702)))))))))

(assert (=> d!106466 d!106476))

(declare-fun d!106478 () Bool)

(assert (=> d!106478 (= (remainingBits!0 ((_ sign_extend 32) (size!9039 (buf!8181 thiss!1702))) ((_ sign_extend 32) (currentByte!15103 thiss!1702)) ((_ sign_extend 32) (currentBit!15098 thiss!1702))) (bvsub (bvmul ((_ sign_extend 32) (size!9039 (buf!8181 thiss!1702))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15103 thiss!1702)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15098 thiss!1702)))))))

(assert (=> d!106464 d!106478))

(push 1)

(check-sat)

(pop 1)

