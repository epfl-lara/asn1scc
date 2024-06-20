; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35710 () Bool)

(assert start!35710)

(declare-fun res!138553 () Bool)

(declare-fun e!115244 () Bool)

(assert (=> start!35710 (=> (not res!138553) (not e!115244))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!35710 (= res!138553 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35710 e!115244))

(assert (=> start!35710 true))

(declare-datatypes ((array!8494 0))(
  ( (array!8495 (arr!4707 (Array (_ BitVec 32) (_ BitVec 8))) (size!3786 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6728 0))(
  ( (BitStream!6729 (buf!4238 array!8494) (currentByte!7969 (_ BitVec 32)) (currentBit!7964 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6728)

(declare-fun e!115245 () Bool)

(declare-fun inv!12 (BitStream!6728) Bool)

(assert (=> start!35710 (and (inv!12 thiss!1577) e!115245)))

(declare-fun b!166384 () Bool)

(declare-fun res!138554 () Bool)

(assert (=> b!166384 (=> (not res!138554) (not e!115244))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!166384 (= res!138554 (validate_offset_bits!1 ((_ sign_extend 32) (size!3786 (buf!4238 thiss!1577))) ((_ sign_extend 32) (currentByte!7969 thiss!1577)) ((_ sign_extend 32) (currentBit!7964 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!166385 () Bool)

(assert (=> b!166385 (= e!115244 (and (bvsgt (bvadd (currentBit!7964 thiss!1577) nBits!511) #b00000000000000000000000000001000) (= (bvand (currentByte!7969 thiss!1577) #b10000000000000000000000000000000) #b00000000000000000000000000000000) (not (= (bvand (currentByte!7969 thiss!1577) #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 (currentByte!7969 thiss!1577)) #b10000000000000000000000000000000)))))))

(declare-fun b!166386 () Bool)

(declare-fun array_inv!3527 (array!8494) Bool)

(assert (=> b!166386 (= e!115245 (array_inv!3527 (buf!4238 thiss!1577)))))

(assert (= (and start!35710 res!138553) b!166384))

(assert (= (and b!166384 res!138554) b!166385))

(assert (= start!35710 b!166386))

(declare-fun m!264355 () Bool)

(assert (=> start!35710 m!264355))

(declare-fun m!264357 () Bool)

(assert (=> b!166384 m!264357))

(declare-fun m!264359 () Bool)

(assert (=> b!166386 m!264359))

(push 1)

(assert (not start!35710))

(assert (not b!166384))

(assert (not b!166386))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!57969 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!57969 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7964 thiss!1577) (currentByte!7969 thiss!1577) (size!3786 (buf!4238 thiss!1577))))))

(declare-fun bs!14376 () Bool)

(assert (= bs!14376 d!57969))

(declare-fun m!264365 () Bool)

(assert (=> bs!14376 m!264365))

(assert (=> start!35710 d!57969))

(declare-fun d!57975 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!57975 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3786 (buf!4238 thiss!1577))) ((_ sign_extend 32) (currentByte!7969 thiss!1577)) ((_ sign_extend 32) (currentBit!7964 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3786 (buf!4238 thiss!1577))) ((_ sign_extend 32) (currentByte!7969 thiss!1577)) ((_ sign_extend 32) (currentBit!7964 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14378 () Bool)

(assert (= bs!14378 d!57975))

(declare-fun m!264369 () Bool)

(assert (=> bs!14378 m!264369))

(assert (=> b!166384 d!57975))

(declare-fun d!57979 () Bool)

(assert (=> d!57979 (= (array_inv!3527 (buf!4238 thiss!1577)) (bvsge (size!3786 (buf!4238 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!166386 d!57979))

(push 1)

(assert (not d!57969))

(assert (not d!57975))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!57989 () Bool)

(assert (=> d!57989 (= (invariant!0 (currentBit!7964 thiss!1577) (currentByte!7969 thiss!1577) (size!3786 (buf!4238 thiss!1577))) (and (bvsge (currentBit!7964 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentBit!7964 thiss!1577) #b00000000000000000000000000001000) (bvsge (currentByte!7969 thiss!1577) #b00000000000000000000000000000000) (or (bvslt (currentByte!7969 thiss!1577) (size!3786 (buf!4238 thiss!1577))) (and (= (currentBit!7964 thiss!1577) #b00000000000000000000000000000000) (= (currentByte!7969 thiss!1577) (size!3786 (buf!4238 thiss!1577)))))))))

(assert (=> d!57969 d!57989))

(declare-fun d!57993 () Bool)

(assert (=> d!57993 (= (remainingBits!0 ((_ sign_extend 32) (size!3786 (buf!4238 thiss!1577))) ((_ sign_extend 32) (currentByte!7969 thiss!1577)) ((_ sign_extend 32) (currentBit!7964 thiss!1577))) (bvsub (bvmul ((_ sign_extend 32) (size!3786 (buf!4238 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7969 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7964 thiss!1577)))))))

(assert (=> d!57975 d!57993))

(push 1)

(check-sat)

(pop 1)

