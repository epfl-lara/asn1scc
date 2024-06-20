; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35858 () Bool)

(assert start!35858)

(declare-fun res!138658 () Bool)

(declare-fun e!115387 () Bool)

(assert (=> start!35858 (=> (not res!138658) (not e!115387))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!35858 (= res!138658 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35858 e!115387))

(assert (=> start!35858 true))

(declare-datatypes ((array!8538 0))(
  ( (array!8539 (arr!4723 (Array (_ BitVec 32) (_ BitVec 8))) (size!3802 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6760 0))(
  ( (BitStream!6761 (buf!4254 array!8538) (currentByte!8019 (_ BitVec 32)) (currentBit!8014 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6760)

(declare-fun e!115389 () Bool)

(declare-fun inv!12 (BitStream!6760) Bool)

(assert (=> start!35858 (and (inv!12 thiss!1577) e!115389)))

(declare-fun b!166537 () Bool)

(declare-fun res!138659 () Bool)

(assert (=> b!166537 (=> (not res!138659) (not e!115387))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!166537 (= res!138659 (validate_offset_bits!1 ((_ sign_extend 32) (size!3802 (buf!4254 thiss!1577))) ((_ sign_extend 32) (currentByte!8019 thiss!1577)) ((_ sign_extend 32) (currentBit!8014 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!166538 () Bool)

(assert (=> b!166538 (= e!115387 (and (bvsgt (bvadd (currentBit!8014 thiss!1577) nBits!511) #b00000000000000000000000000001000) (or (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!8019 thiss!1577)) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 (currentByte!8019 thiss!1577)) (size!3802 (buf!4254 thiss!1577))))))))

(declare-fun b!166539 () Bool)

(declare-fun array_inv!3543 (array!8538) Bool)

(assert (=> b!166539 (= e!115389 (array_inv!3543 (buf!4254 thiss!1577)))))

(assert (= (and start!35858 res!138658) b!166537))

(assert (= (and b!166537 res!138659) b!166538))

(assert (= start!35858 b!166539))

(declare-fun m!264553 () Bool)

(assert (=> start!35858 m!264553))

(declare-fun m!264555 () Bool)

(assert (=> b!166537 m!264555))

(declare-fun m!264557 () Bool)

(assert (=> b!166539 m!264557))

(push 1)

(assert (not start!35858))

(assert (not b!166539))

(assert (not b!166537))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!58107 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!58107 (= (inv!12 thiss!1577) (invariant!0 (currentBit!8014 thiss!1577) (currentByte!8019 thiss!1577) (size!3802 (buf!4254 thiss!1577))))))

(declare-fun bs!14419 () Bool)

(assert (= bs!14419 d!58107))

(declare-fun m!264571 () Bool)

(assert (=> bs!14419 m!264571))

(assert (=> start!35858 d!58107))

(declare-fun d!58109 () Bool)

(assert (=> d!58109 (= (array_inv!3543 (buf!4254 thiss!1577)) (bvsge (size!3802 (buf!4254 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!166539 d!58109))

(declare-fun d!58113 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!58113 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3802 (buf!4254 thiss!1577))) ((_ sign_extend 32) (currentByte!8019 thiss!1577)) ((_ sign_extend 32) (currentBit!8014 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3802 (buf!4254 thiss!1577))) ((_ sign_extend 32) (currentByte!8019 thiss!1577)) ((_ sign_extend 32) (currentBit!8014 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14421 () Bool)

(assert (= bs!14421 d!58113))

(declare-fun m!264575 () Bool)

(assert (=> bs!14421 m!264575))

(assert (=> b!166537 d!58113))

(push 1)

(assert (not d!58107))

(assert (not d!58113))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!58123 () Bool)

(assert (=> d!58123 (= (invariant!0 (currentBit!8014 thiss!1577) (currentByte!8019 thiss!1577) (size!3802 (buf!4254 thiss!1577))) (and (bvsge (currentBit!8014 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentBit!8014 thiss!1577) #b00000000000000000000000000001000) (bvsge (currentByte!8019 thiss!1577) #b00000000000000000000000000000000) (or (bvslt (currentByte!8019 thiss!1577) (size!3802 (buf!4254 thiss!1577))) (and (= (currentBit!8014 thiss!1577) #b00000000000000000000000000000000) (= (currentByte!8019 thiss!1577) (size!3802 (buf!4254 thiss!1577)))))))))

(assert (=> d!58107 d!58123))

(declare-fun d!58129 () Bool)

(assert (=> d!58129 (= (remainingBits!0 ((_ sign_extend 32) (size!3802 (buf!4254 thiss!1577))) ((_ sign_extend 32) (currentByte!8019 thiss!1577)) ((_ sign_extend 32) (currentBit!8014 thiss!1577))) (bvsub (bvmul ((_ sign_extend 32) (size!3802 (buf!4254 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!8019 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8014 thiss!1577)))))))

(assert (=> d!58113 d!58129))

(push 1)

(check-sat)

