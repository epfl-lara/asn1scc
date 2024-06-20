; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35598 () Bool)

(assert start!35598)

(declare-fun res!138478 () Bool)

(declare-fun e!115144 () Bool)

(assert (=> start!35598 (=> (not res!138478) (not e!115144))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!35598 (= res!138478 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35598 e!115144))

(assert (=> start!35598 true))

(declare-datatypes ((array!8463 0))(
  ( (array!8464 (arr!4696 (Array (_ BitVec 32) (_ BitVec 8))) (size!3775 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6706 0))(
  ( (BitStream!6707 (buf!4227 array!8463) (currentByte!7931 (_ BitVec 32)) (currentBit!7926 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6706)

(declare-fun e!115146 () Bool)

(declare-fun inv!12 (BitStream!6706) Bool)

(assert (=> start!35598 (and (inv!12 thiss!1577) e!115146)))

(declare-fun b!166276 () Bool)

(declare-fun res!138479 () Bool)

(assert (=> b!166276 (=> (not res!138479) (not e!115144))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!166276 (= res!138479 (validate_offset_bits!1 ((_ sign_extend 32) (size!3775 (buf!4227 thiss!1577))) ((_ sign_extend 32) (currentByte!7931 thiss!1577)) ((_ sign_extend 32) (currentBit!7926 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!166277 () Bool)

(assert (=> b!166277 (= e!115144 (and (bvsgt (bvadd (currentBit!7926 thiss!1577) nBits!511) #b00000000000000000000000000001000) (bvsgt (bvsub (bvadd (currentBit!7926 thiss!1577) nBits!511) #b00000000000000000000000000001000) #b00000000000000000000000000100000)))))

(declare-fun b!166278 () Bool)

(declare-fun array_inv!3516 (array!8463) Bool)

(assert (=> b!166278 (= e!115146 (array_inv!3516 (buf!4227 thiss!1577)))))

(assert (= (and start!35598 res!138478) b!166276))

(assert (= (and b!166276 res!138479) b!166277))

(assert (= start!35598 b!166278))

(declare-fun m!264217 () Bool)

(assert (=> start!35598 m!264217))

(declare-fun m!264219 () Bool)

(assert (=> b!166276 m!264219))

(declare-fun m!264221 () Bool)

(assert (=> b!166278 m!264221))

(push 1)

(assert (not b!166278))

(assert (not start!35598))

(assert (not b!166276))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!57857 () Bool)

(assert (=> d!57857 (= (array_inv!3516 (buf!4227 thiss!1577)) (bvsge (size!3775 (buf!4227 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!166278 d!57857))

(declare-fun d!57859 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!57859 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7926 thiss!1577) (currentByte!7931 thiss!1577) (size!3775 (buf!4227 thiss!1577))))))

(declare-fun bs!14344 () Bool)

(assert (= bs!14344 d!57859))

(declare-fun m!264235 () Bool)

(assert (=> bs!14344 m!264235))

(assert (=> start!35598 d!57859))

(declare-fun d!57863 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!57863 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3775 (buf!4227 thiss!1577))) ((_ sign_extend 32) (currentByte!7931 thiss!1577)) ((_ sign_extend 32) (currentBit!7926 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3775 (buf!4227 thiss!1577))) ((_ sign_extend 32) (currentByte!7931 thiss!1577)) ((_ sign_extend 32) (currentBit!7926 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14345 () Bool)

(assert (= bs!14345 d!57863))

(declare-fun m!264237 () Bool)

(assert (=> bs!14345 m!264237))

(assert (=> b!166276 d!57863))

(push 1)

(assert (not d!57863))

(assert (not d!57859))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!57871 () Bool)

(assert (=> d!57871 (= (remainingBits!0 ((_ sign_extend 32) (size!3775 (buf!4227 thiss!1577))) ((_ sign_extend 32) (currentByte!7931 thiss!1577)) ((_ sign_extend 32) (currentBit!7926 thiss!1577))) (bvsub (bvmul ((_ sign_extend 32) (size!3775 (buf!4227 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7931 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7926 thiss!1577)))))))

(assert (=> d!57863 d!57871))

(declare-fun d!57877 () Bool)

(assert (=> d!57877 (= (invariant!0 (currentBit!7926 thiss!1577) (currentByte!7931 thiss!1577) (size!3775 (buf!4227 thiss!1577))) (and (bvsge (currentBit!7926 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentBit!7926 thiss!1577) #b00000000000000000000000000001000) (bvsge (currentByte!7931 thiss!1577) #b00000000000000000000000000000000) (or (bvslt (currentByte!7931 thiss!1577) (size!3775 (buf!4227 thiss!1577))) (and (= (currentBit!7926 thiss!1577) #b00000000000000000000000000000000) (= (currentByte!7931 thiss!1577) (size!3775 (buf!4227 thiss!1577)))))))))

(assert (=> d!57859 d!57877))

(push 1)

(check-sat)

