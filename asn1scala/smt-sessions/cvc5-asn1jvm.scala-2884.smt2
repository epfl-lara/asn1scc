; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69048 () Bool)

(assert start!69048)

(declare-fun b!311136 () Bool)

(declare-fun e!223649 () Bool)

(declare-datatypes ((array!18985 0))(
  ( (array!18986 (arr!9319 (Array (_ BitVec 32) (_ BitVec 8))) (size!8239 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13582 0))(
  ( (BitStream!13583 (buf!7852 array!18985) (currentByte!14459 (_ BitVec 32)) (currentBit!14454 (_ BitVec 32))) )
))
(declare-fun b2!97 () BitStream!13582)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!311136 (= e!223649 (not (invariant!0 (currentBit!14454 b2!97) (currentByte!14459 b2!97) (size!8239 (buf!7852 b2!97)))))))

(declare-fun b!311137 () Bool)

(declare-fun e!223647 () Bool)

(declare-fun b1!97 () BitStream!13582)

(declare-fun array_inv!7791 (array!18985) Bool)

(assert (=> b!311137 (= e!223647 (array_inv!7791 (buf!7852 b1!97)))))

(declare-fun res!254938 () Bool)

(assert (=> start!69048 (=> (not res!254938) (not e!223649))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(assert (=> start!69048 (= res!254938 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8239 (buf!7852 b1!97)) (size!8239 (buf!7852 b2!97)))))))

(assert (=> start!69048 e!223649))

(assert (=> start!69048 true))

(declare-fun inv!12 (BitStream!13582) Bool)

(assert (=> start!69048 (and (inv!12 b1!97) e!223647)))

(declare-fun e!223646 () Bool)

(assert (=> start!69048 (and (inv!12 b2!97) e!223646)))

(declare-fun b!311138 () Bool)

(assert (=> b!311138 (= e!223646 (array_inv!7791 (buf!7852 b2!97)))))

(declare-fun b!311135 () Bool)

(declare-fun res!254937 () Bool)

(assert (=> b!311135 (=> (not res!254937) (not e!223649))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!311135 (= res!254937 (validate_offset_bits!1 ((_ sign_extend 32) (size!8239 (buf!7852 b1!97))) ((_ sign_extend 32) (currentByte!14459 b1!97)) ((_ sign_extend 32) (currentBit!14454 b1!97)) b1ValidateOffsetBits!10))))

(assert (= (and start!69048 res!254938) b!311135))

(assert (= (and b!311135 res!254937) b!311136))

(assert (= start!69048 b!311137))

(assert (= start!69048 b!311138))

(declare-fun m!449011 () Bool)

(assert (=> b!311137 m!449011))

(declare-fun m!449013 () Bool)

(assert (=> b!311135 m!449013))

(declare-fun m!449015 () Bool)

(assert (=> b!311138 m!449015))

(declare-fun m!449017 () Bool)

(assert (=> start!69048 m!449017))

(declare-fun m!449019 () Bool)

(assert (=> start!69048 m!449019))

(declare-fun m!449021 () Bool)

(assert (=> b!311136 m!449021))

(push 1)

(assert (not b!311137))

(assert (not b!311138))

(assert (not b!311136))

(assert (not b!311135))

(assert (not start!69048))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!103122 () Bool)

(assert (=> d!103122 (= (array_inv!7791 (buf!7852 b2!97)) (bvsge (size!8239 (buf!7852 b2!97)) #b00000000000000000000000000000000))))

(assert (=> b!311138 d!103122))

(declare-fun d!103124 () Bool)

(assert (=> d!103124 (= (array_inv!7791 (buf!7852 b1!97)) (bvsge (size!8239 (buf!7852 b1!97)) #b00000000000000000000000000000000))))

(assert (=> b!311137 d!103124))

(declare-fun d!103126 () Bool)

(assert (=> d!103126 (= (inv!12 b1!97) (invariant!0 (currentBit!14454 b1!97) (currentByte!14459 b1!97) (size!8239 (buf!7852 b1!97))))))

(declare-fun bs!26686 () Bool)

(assert (= bs!26686 d!103126))

(declare-fun m!449047 () Bool)

(assert (=> bs!26686 m!449047))

(assert (=> start!69048 d!103126))

(declare-fun d!103130 () Bool)

(assert (=> d!103130 (= (inv!12 b2!97) (invariant!0 (currentBit!14454 b2!97) (currentByte!14459 b2!97) (size!8239 (buf!7852 b2!97))))))

(declare-fun bs!26687 () Bool)

(assert (= bs!26687 d!103130))

(assert (=> bs!26687 m!449021))

(assert (=> start!69048 d!103130))

(declare-fun d!103132 () Bool)

(assert (=> d!103132 (= (invariant!0 (currentBit!14454 b2!97) (currentByte!14459 b2!97) (size!8239 (buf!7852 b2!97))) (and (bvsge (currentBit!14454 b2!97) #b00000000000000000000000000000000) (bvslt (currentBit!14454 b2!97) #b00000000000000000000000000001000) (bvsge (currentByte!14459 b2!97) #b00000000000000000000000000000000) (or (bvslt (currentByte!14459 b2!97) (size!8239 (buf!7852 b2!97))) (and (= (currentBit!14454 b2!97) #b00000000000000000000000000000000) (= (currentByte!14459 b2!97) (size!8239 (buf!7852 b2!97)))))))))

(assert (=> b!311136 d!103132))

(declare-fun d!103138 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!103138 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8239 (buf!7852 b1!97))) ((_ sign_extend 32) (currentByte!14459 b1!97)) ((_ sign_extend 32) (currentBit!14454 b1!97)) b1ValidateOffsetBits!10) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8239 (buf!7852 b1!97))) ((_ sign_extend 32) (currentByte!14459 b1!97)) ((_ sign_extend 32) (currentBit!14454 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun bs!26690 () Bool)

(assert (= bs!26690 d!103138))

(declare-fun m!449051 () Bool)

(assert (=> bs!26690 m!449051))

(assert (=> b!311135 d!103138))

(push 1)

(assert (not d!103138))

(assert (not d!103130))

(assert (not d!103126))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

