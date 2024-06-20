; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35602 () Bool)

(assert start!35602)

(declare-fun res!138490 () Bool)

(declare-fun e!115164 () Bool)

(assert (=> start!35602 (=> (not res!138490) (not e!115164))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!35602 (= res!138490 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35602 e!115164))

(assert (=> start!35602 true))

(declare-datatypes ((array!8467 0))(
  ( (array!8468 (arr!4698 (Array (_ BitVec 32) (_ BitVec 8))) (size!3777 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6710 0))(
  ( (BitStream!6711 (buf!4229 array!8467) (currentByte!7933 (_ BitVec 32)) (currentBit!7928 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6710)

(declare-fun e!115162 () Bool)

(declare-fun inv!12 (BitStream!6710) Bool)

(assert (=> start!35602 (and (inv!12 thiss!1577) e!115162)))

(declare-fun b!166294 () Bool)

(declare-fun res!138491 () Bool)

(assert (=> b!166294 (=> (not res!138491) (not e!115164))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!166294 (= res!138491 (validate_offset_bits!1 ((_ sign_extend 32) (size!3777 (buf!4229 thiss!1577))) ((_ sign_extend 32) (currentByte!7933 thiss!1577)) ((_ sign_extend 32) (currentBit!7928 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!166295 () Bool)

(assert (=> b!166295 (= e!115164 (and (bvsgt (bvadd (currentBit!7928 thiss!1577) nBits!511) #b00000000000000000000000000001000) (bvsgt (bvsub (bvadd (currentBit!7928 thiss!1577) nBits!511) #b00000000000000000000000000001000) #b00000000000000000000000000100000)))))

(declare-fun b!166296 () Bool)

(declare-fun array_inv!3518 (array!8467) Bool)

(assert (=> b!166296 (= e!115162 (array_inv!3518 (buf!4229 thiss!1577)))))

(assert (= (and start!35602 res!138490) b!166294))

(assert (= (and b!166294 res!138491) b!166295))

(assert (= start!35602 b!166296))

(declare-fun m!264229 () Bool)

(assert (=> start!35602 m!264229))

(declare-fun m!264231 () Bool)

(assert (=> b!166294 m!264231))

(declare-fun m!264233 () Bool)

(assert (=> b!166296 m!264233))

(push 1)

(assert (not start!35602))

(assert (not b!166294))

(assert (not b!166296))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!57869 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!57869 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7928 thiss!1577) (currentByte!7933 thiss!1577) (size!3777 (buf!4229 thiss!1577))))))

(declare-fun bs!14348 () Bool)

(assert (= bs!14348 d!57869))

(declare-fun m!264243 () Bool)

(assert (=> bs!14348 m!264243))

(assert (=> start!35602 d!57869))

(declare-fun d!57873 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!57873 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3777 (buf!4229 thiss!1577))) ((_ sign_extend 32) (currentByte!7933 thiss!1577)) ((_ sign_extend 32) (currentBit!7928 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3777 (buf!4229 thiss!1577))) ((_ sign_extend 32) (currentByte!7933 thiss!1577)) ((_ sign_extend 32) (currentBit!7928 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14349 () Bool)

(assert (= bs!14349 d!57873))

(declare-fun m!264245 () Bool)

(assert (=> bs!14349 m!264245))

(assert (=> b!166294 d!57873))

(declare-fun d!57875 () Bool)

(assert (=> d!57875 (= (array_inv!3518 (buf!4229 thiss!1577)) (bvsge (size!3777 (buf!4229 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!166296 d!57875))

(push 1)

(assert (not d!57873))

(assert (not d!57869))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!57883 () Bool)

(assert (=> d!57883 (= (remainingBits!0 ((_ sign_extend 32) (size!3777 (buf!4229 thiss!1577))) ((_ sign_extend 32) (currentByte!7933 thiss!1577)) ((_ sign_extend 32) (currentBit!7928 thiss!1577))) (bvsub (bvmul ((_ sign_extend 32) (size!3777 (buf!4229 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7933 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7928 thiss!1577)))))))

(assert (=> d!57873 d!57883))

(declare-fun d!57885 () Bool)

(assert (=> d!57885 (= (invariant!0 (currentBit!7928 thiss!1577) (currentByte!7933 thiss!1577) (size!3777 (buf!4229 thiss!1577))) (and (bvsge (currentBit!7928 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentBit!7928 thiss!1577) #b00000000000000000000000000001000) (bvsge (currentByte!7933 thiss!1577) #b00000000000000000000000000000000) (or (bvslt (currentByte!7933 thiss!1577) (size!3777 (buf!4229 thiss!1577))) (and (= (currentBit!7928 thiss!1577) #b00000000000000000000000000000000) (= (currentByte!7933 thiss!1577) (size!3777 (buf!4229 thiss!1577)))))))))

