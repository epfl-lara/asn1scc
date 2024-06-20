; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35816 () Bool)

(assert start!35816)

(declare-fun res!138622 () Bool)

(declare-fun e!115333 () Bool)

(assert (=> start!35816 (=> (not res!138622) (not e!115333))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!35816 (= res!138622 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35816 e!115333))

(assert (=> start!35816 true))

(declare-datatypes ((array!8523 0))(
  ( (array!8524 (arr!4717 (Array (_ BitVec 32) (_ BitVec 8))) (size!3796 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6748 0))(
  ( (BitStream!6749 (buf!4248 array!8523) (currentByte!8004 (_ BitVec 32)) (currentBit!7999 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6748)

(declare-fun e!115334 () Bool)

(declare-fun inv!12 (BitStream!6748) Bool)

(assert (=> start!35816 (and (inv!12 thiss!1577) e!115334)))

(declare-fun b!166483 () Bool)

(declare-fun res!138623 () Bool)

(assert (=> b!166483 (=> (not res!138623) (not e!115333))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!166483 (= res!138623 (validate_offset_bits!1 ((_ sign_extend 32) (size!3796 (buf!4248 thiss!1577))) ((_ sign_extend 32) (currentByte!8004 thiss!1577)) ((_ sign_extend 32) (currentBit!7999 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!166484 () Bool)

(assert (=> b!166484 (= e!115333 (and (bvsgt (bvadd (currentBit!7999 thiss!1577) nBits!511) #b00000000000000000000000000001000) (or (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!8004 thiss!1577)) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 (currentByte!8004 thiss!1577)) (size!3796 (buf!4248 thiss!1577))))))))

(declare-fun b!166485 () Bool)

(declare-fun array_inv!3537 (array!8523) Bool)

(assert (=> b!166485 (= e!115334 (array_inv!3537 (buf!4248 thiss!1577)))))

(assert (= (and start!35816 res!138622) b!166483))

(assert (= (and b!166483 res!138623) b!166484))

(assert (= start!35816 b!166485))

(declare-fun m!264505 () Bool)

(assert (=> start!35816 m!264505))

(declare-fun m!264507 () Bool)

(assert (=> b!166483 m!264507))

(declare-fun m!264509 () Bool)

(assert (=> b!166485 m!264509))

(push 1)

(assert (not b!166483))

(assert (not start!35816))

(assert (not b!166485))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!58077 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!58077 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3796 (buf!4248 thiss!1577))) ((_ sign_extend 32) (currentByte!8004 thiss!1577)) ((_ sign_extend 32) (currentBit!7999 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3796 (buf!4248 thiss!1577))) ((_ sign_extend 32) (currentByte!8004 thiss!1577)) ((_ sign_extend 32) (currentBit!7999 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14409 () Bool)

(assert (= bs!14409 d!58077))

(declare-fun m!264527 () Bool)

(assert (=> bs!14409 m!264527))

(assert (=> b!166483 d!58077))

(declare-fun d!58079 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!58079 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7999 thiss!1577) (currentByte!8004 thiss!1577) (size!3796 (buf!4248 thiss!1577))))))

(declare-fun bs!14410 () Bool)

(assert (= bs!14410 d!58079))

(declare-fun m!264529 () Bool)

(assert (=> bs!14410 m!264529))

(assert (=> start!35816 d!58079))

(declare-fun d!58081 () Bool)

(assert (=> d!58081 (= (array_inv!3537 (buf!4248 thiss!1577)) (bvsge (size!3796 (buf!4248 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!166485 d!58081))

(push 1)

(assert (not d!58079))

(assert (not d!58077))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!58093 () Bool)

(assert (=> d!58093 (= (invariant!0 (currentBit!7999 thiss!1577) (currentByte!8004 thiss!1577) (size!3796 (buf!4248 thiss!1577))) (and (bvsge (currentBit!7999 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentBit!7999 thiss!1577) #b00000000000000000000000000001000) (bvsge (currentByte!8004 thiss!1577) #b00000000000000000000000000000000) (or (bvslt (currentByte!8004 thiss!1577) (size!3796 (buf!4248 thiss!1577))) (and (= (currentBit!7999 thiss!1577) #b00000000000000000000000000000000) (= (currentByte!8004 thiss!1577) (size!3796 (buf!4248 thiss!1577)))))))))

(assert (=> d!58079 d!58093))

(declare-fun d!58095 () Bool)

(assert (=> d!58095 (= (remainingBits!0 ((_ sign_extend 32) (size!3796 (buf!4248 thiss!1577))) ((_ sign_extend 32) (currentByte!8004 thiss!1577)) ((_ sign_extend 32) (currentBit!7999 thiss!1577))) (bvsub (bvmul ((_ sign_extend 32) (size!3796 (buf!4248 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!8004 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7999 thiss!1577)))))))

(assert (=> d!58077 d!58095))

(push 1)

(check-sat)

