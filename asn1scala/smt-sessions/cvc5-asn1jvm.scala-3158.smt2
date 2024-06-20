; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72542 () Bool)

(assert start!72542)

(declare-fun res!266092 () Bool)

(declare-fun e!233635 () Bool)

(assert (=> start!72542 (=> (not res!266092) (not e!233635))))

(declare-datatypes ((array!20785 0))(
  ( (array!20786 (arr!10132 (Array (_ BitVec 32) (_ BitVec 8))) (size!9040 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14242 0))(
  ( (BitStream!14243 (buf!8182 array!20785) (currentByte!15113 (_ BitVec 32)) (currentBit!15108 (_ BitVec 32))) )
))
(declare-fun thiss!1702 () BitStream!14242)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!72542 (= res!266092 (validate_offset_bit!0 ((_ sign_extend 32) (size!9040 (buf!8182 thiss!1702))) ((_ sign_extend 32) (currentByte!15113 thiss!1702)) ((_ sign_extend 32) (currentBit!15108 thiss!1702))))))

(assert (=> start!72542 e!233635))

(declare-fun e!233636 () Bool)

(declare-fun inv!12 (BitStream!14242) Bool)

(assert (=> start!72542 (and (inv!12 thiss!1702) e!233636)))

(declare-fun b!324192 () Bool)

(assert (=> b!324192 (= e!233635 (or (bvslt (currentBit!15108 thiss!1702) #b00000000000000000000000000000000) (bvsge (currentBit!15108 thiss!1702) #b00000000000000000000000000001000)))))

(declare-fun b!324193 () Bool)

(declare-fun array_inv!8592 (array!20785) Bool)

(assert (=> b!324193 (= e!233636 (array_inv!8592 (buf!8182 thiss!1702)))))

(assert (= (and start!72542 res!266092) b!324192))

(assert (= start!72542 b!324193))

(declare-fun m!462299 () Bool)

(assert (=> start!72542 m!462299))

(declare-fun m!462301 () Bool)

(assert (=> start!72542 m!462301))

(declare-fun m!462303 () Bool)

(assert (=> b!324193 m!462303))

(push 1)

(assert (not start!72542))

(assert (not b!324193))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!106488 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!106488 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!9040 (buf!8182 thiss!1702))) ((_ sign_extend 32) (currentByte!15113 thiss!1702)) ((_ sign_extend 32) (currentBit!15108 thiss!1702))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!9040 (buf!8182 thiss!1702))) ((_ sign_extend 32) (currentByte!15113 thiss!1702)) ((_ sign_extend 32) (currentBit!15108 thiss!1702))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!28050 () Bool)

(assert (= bs!28050 d!106488))

(declare-fun m!462321 () Bool)

(assert (=> bs!28050 m!462321))

(assert (=> start!72542 d!106488))

(declare-fun d!106492 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!106492 (= (inv!12 thiss!1702) (invariant!0 (currentBit!15108 thiss!1702) (currentByte!15113 thiss!1702) (size!9040 (buf!8182 thiss!1702))))))

(declare-fun bs!28052 () Bool)

(assert (= bs!28052 d!106492))

(declare-fun m!462325 () Bool)

(assert (=> bs!28052 m!462325))

(assert (=> start!72542 d!106492))

(declare-fun d!106498 () Bool)

(assert (=> d!106498 (= (array_inv!8592 (buf!8182 thiss!1702)) (bvsge (size!9040 (buf!8182 thiss!1702)) #b00000000000000000000000000000000))))

(assert (=> b!324193 d!106498))

(push 1)

(assert (not d!106492))

(assert (not d!106488))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!106504 () Bool)

(assert (=> d!106504 (= (invariant!0 (currentBit!15108 thiss!1702) (currentByte!15113 thiss!1702) (size!9040 (buf!8182 thiss!1702))) (and (bvsge (currentBit!15108 thiss!1702) #b00000000000000000000000000000000) (bvslt (currentBit!15108 thiss!1702) #b00000000000000000000000000001000) (bvsge (currentByte!15113 thiss!1702) #b00000000000000000000000000000000) (or (bvslt (currentByte!15113 thiss!1702) (size!9040 (buf!8182 thiss!1702))) (and (= (currentBit!15108 thiss!1702) #b00000000000000000000000000000000) (= (currentByte!15113 thiss!1702) (size!9040 (buf!8182 thiss!1702)))))))))

(assert (=> d!106492 d!106504))

(declare-fun d!106506 () Bool)

(assert (=> d!106506 (= (remainingBits!0 ((_ sign_extend 32) (size!9040 (buf!8182 thiss!1702))) ((_ sign_extend 32) (currentByte!15113 thiss!1702)) ((_ sign_extend 32) (currentBit!15108 thiss!1702))) (bvsub (bvmul ((_ sign_extend 32) (size!9040 (buf!8182 thiss!1702))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15113 thiss!1702)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15108 thiss!1702)))))))

(assert (=> d!106488 d!106506))

(push 1)

(check-sat)

(pop 1)

