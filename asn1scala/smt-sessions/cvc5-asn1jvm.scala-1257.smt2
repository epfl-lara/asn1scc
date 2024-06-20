; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35706 () Bool)

(assert start!35706)

(declare-fun res!138542 () Bool)

(declare-fun e!115225 () Bool)

(assert (=> start!35706 (=> (not res!138542) (not e!115225))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!35706 (= res!138542 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35706 e!115225))

(assert (=> start!35706 true))

(declare-datatypes ((array!8490 0))(
  ( (array!8491 (arr!4705 (Array (_ BitVec 32) (_ BitVec 8))) (size!3784 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6724 0))(
  ( (BitStream!6725 (buf!4236 array!8490) (currentByte!7967 (_ BitVec 32)) (currentBit!7962 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6724)

(declare-fun e!115226 () Bool)

(declare-fun inv!12 (BitStream!6724) Bool)

(assert (=> start!35706 (and (inv!12 thiss!1577) e!115226)))

(declare-fun b!166366 () Bool)

(declare-fun res!138541 () Bool)

(assert (=> b!166366 (=> (not res!138541) (not e!115225))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!166366 (= res!138541 (validate_offset_bits!1 ((_ sign_extend 32) (size!3784 (buf!4236 thiss!1577))) ((_ sign_extend 32) (currentByte!7967 thiss!1577)) ((_ sign_extend 32) (currentBit!7962 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!166367 () Bool)

(assert (=> b!166367 (= e!115225 (and (bvsgt (bvadd (currentBit!7962 thiss!1577) nBits!511) #b00000000000000000000000000001000) (= (bvand (currentByte!7967 thiss!1577) #b10000000000000000000000000000000) #b00000000000000000000000000000000) (not (= (bvand (currentByte!7967 thiss!1577) #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 (currentByte!7967 thiss!1577)) #b10000000000000000000000000000000)))))))

(declare-fun b!166368 () Bool)

(declare-fun array_inv!3525 (array!8490) Bool)

(assert (=> b!166368 (= e!115226 (array_inv!3525 (buf!4236 thiss!1577)))))

(assert (= (and start!35706 res!138542) b!166366))

(assert (= (and b!166366 res!138541) b!166367))

(assert (= start!35706 b!166368))

(declare-fun m!264343 () Bool)

(assert (=> start!35706 m!264343))

(declare-fun m!264345 () Bool)

(assert (=> b!166366 m!264345))

(declare-fun m!264347 () Bool)

(assert (=> b!166368 m!264347))

(push 1)

(assert (not start!35706))

(assert (not b!166366))

(assert (not b!166368))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!57967 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!57967 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7962 thiss!1577) (currentByte!7967 thiss!1577) (size!3784 (buf!4236 thiss!1577))))))

(declare-fun bs!14375 () Bool)

(assert (= bs!14375 d!57967))

(declare-fun m!264363 () Bool)

(assert (=> bs!14375 m!264363))

(assert (=> start!35706 d!57967))

(declare-fun d!57973 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!57973 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3784 (buf!4236 thiss!1577))) ((_ sign_extend 32) (currentByte!7967 thiss!1577)) ((_ sign_extend 32) (currentBit!7962 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3784 (buf!4236 thiss!1577))) ((_ sign_extend 32) (currentByte!7967 thiss!1577)) ((_ sign_extend 32) (currentBit!7962 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14377 () Bool)

(assert (= bs!14377 d!57973))

(declare-fun m!264367 () Bool)

(assert (=> bs!14377 m!264367))

(assert (=> b!166366 d!57973))

(declare-fun d!57977 () Bool)

(assert (=> d!57977 (= (array_inv!3525 (buf!4236 thiss!1577)) (bvsge (size!3784 (buf!4236 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!166368 d!57977))

(push 1)

(assert (not d!57973))

(assert (not d!57967))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!57985 () Bool)

(assert (=> d!57985 (= (remainingBits!0 ((_ sign_extend 32) (size!3784 (buf!4236 thiss!1577))) ((_ sign_extend 32) (currentByte!7967 thiss!1577)) ((_ sign_extend 32) (currentBit!7962 thiss!1577))) (bvsub (bvmul ((_ sign_extend 32) (size!3784 (buf!4236 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7967 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7962 thiss!1577)))))))

(assert (=> d!57973 d!57985))

(declare-fun d!57991 () Bool)

(assert (=> d!57991 (= (invariant!0 (currentBit!7962 thiss!1577) (currentByte!7967 thiss!1577) (size!3784 (buf!4236 thiss!1577))) (and (bvsge (currentBit!7962 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentBit!7962 thiss!1577) #b00000000000000000000000000001000) (bvsge (currentByte!7967 thiss!1577) #b00000000000000000000000000000000) (or (bvslt (currentByte!7967 thiss!1577) (size!3784 (buf!4236 thiss!1577))) (and (= (currentBit!7962 thiss!1577) #b00000000000000000000000000000000) (= (currentByte!7967 thiss!1577) (size!3784 (buf!4236 thiss!1577)))))))))

(assert (=> d!57967 d!57991))

(push 1)

(check-sat)

(pop 1)

