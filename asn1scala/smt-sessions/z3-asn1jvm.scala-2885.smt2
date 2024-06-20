; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69078 () Bool)

(assert start!69078)

(declare-fun b!311184 () Bool)

(declare-fun e!223707 () Bool)

(declare-datatypes ((array!18996 0))(
  ( (array!18997 (arr!9323 (Array (_ BitVec 32) (_ BitVec 8))) (size!8243 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13590 0))(
  ( (BitStream!13591 (buf!7856 array!18996) (currentByte!14469 (_ BitVec 32)) (currentBit!14464 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13590)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!311184 (= e!223707 (not (invariant!0 (currentBit!14464 b1!97) (currentByte!14469 b1!97) (size!8243 (buf!7856 b1!97)))))))

(declare-fun b!311185 () Bool)

(declare-fun e!223709 () Bool)

(declare-fun array_inv!7795 (array!18996) Bool)

(assert (=> b!311185 (= e!223709 (array_inv!7795 (buf!7856 b1!97)))))

(declare-fun b!311186 () Bool)

(declare-fun e!223708 () Bool)

(declare-fun b2!97 () BitStream!13590)

(assert (=> b!311186 (= e!223708 (array_inv!7795 (buf!7856 b2!97)))))

(declare-fun b!311183 () Bool)

(declare-fun res!254962 () Bool)

(assert (=> b!311183 (=> (not res!254962) (not e!223707))))

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!311183 (= res!254962 (validate_offset_bits!1 ((_ sign_extend 32) (size!8243 (buf!7856 b1!97))) ((_ sign_extend 32) (currentByte!14469 b1!97)) ((_ sign_extend 32) (currentBit!14464 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun res!254961 () Bool)

(assert (=> start!69078 (=> (not res!254961) (not e!223707))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(assert (=> start!69078 (= res!254961 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8243 (buf!7856 b1!97)) (size!8243 (buf!7856 b2!97)))))))

(assert (=> start!69078 e!223707))

(assert (=> start!69078 true))

(declare-fun inv!12 (BitStream!13590) Bool)

(assert (=> start!69078 (and (inv!12 b1!97) e!223709)))

(assert (=> start!69078 (and (inv!12 b2!97) e!223708)))

(assert (= (and start!69078 res!254961) b!311183))

(assert (= (and b!311183 res!254962) b!311184))

(assert (= start!69078 b!311185))

(assert (= start!69078 b!311186))

(declare-fun m!449069 () Bool)

(assert (=> start!69078 m!449069))

(declare-fun m!449071 () Bool)

(assert (=> start!69078 m!449071))

(declare-fun m!449073 () Bool)

(assert (=> b!311186 m!449073))

(declare-fun m!449075 () Bool)

(assert (=> b!311184 m!449075))

(declare-fun m!449077 () Bool)

(assert (=> b!311185 m!449077))

(declare-fun m!449079 () Bool)

(assert (=> b!311183 m!449079))

(check-sat (not b!311184) (not b!311186) (not b!311183) (not b!311185) (not start!69078))
(check-sat)
(get-model)

(declare-fun d!103154 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!103154 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8243 (buf!7856 b1!97))) ((_ sign_extend 32) (currentByte!14469 b1!97)) ((_ sign_extend 32) (currentBit!14464 b1!97)) b1ValidateOffsetBits!10) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8243 (buf!7856 b1!97))) ((_ sign_extend 32) (currentByte!14469 b1!97)) ((_ sign_extend 32) (currentBit!14464 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun bs!26696 () Bool)

(assert (= bs!26696 d!103154))

(declare-fun m!449093 () Bool)

(assert (=> bs!26696 m!449093))

(assert (=> b!311183 d!103154))

(declare-fun d!103156 () Bool)

(assert (=> d!103156 (= (array_inv!7795 (buf!7856 b2!97)) (bvsge (size!8243 (buf!7856 b2!97)) #b00000000000000000000000000000000))))

(assert (=> b!311186 d!103156))

(declare-fun d!103158 () Bool)

(assert (=> d!103158 (= (array_inv!7795 (buf!7856 b1!97)) (bvsge (size!8243 (buf!7856 b1!97)) #b00000000000000000000000000000000))))

(assert (=> b!311185 d!103158))

(declare-fun d!103160 () Bool)

(assert (=> d!103160 (= (inv!12 b1!97) (invariant!0 (currentBit!14464 b1!97) (currentByte!14469 b1!97) (size!8243 (buf!7856 b1!97))))))

(declare-fun bs!26697 () Bool)

(assert (= bs!26697 d!103160))

(assert (=> bs!26697 m!449075))

(assert (=> start!69078 d!103160))

(declare-fun d!103162 () Bool)

(assert (=> d!103162 (= (inv!12 b2!97) (invariant!0 (currentBit!14464 b2!97) (currentByte!14469 b2!97) (size!8243 (buf!7856 b2!97))))))

(declare-fun bs!26698 () Bool)

(assert (= bs!26698 d!103162))

(declare-fun m!449095 () Bool)

(assert (=> bs!26698 m!449095))

(assert (=> start!69078 d!103162))

(declare-fun d!103164 () Bool)

(assert (=> d!103164 (= (invariant!0 (currentBit!14464 b1!97) (currentByte!14469 b1!97) (size!8243 (buf!7856 b1!97))) (and (bvsge (currentBit!14464 b1!97) #b00000000000000000000000000000000) (bvslt (currentBit!14464 b1!97) #b00000000000000000000000000001000) (bvsge (currentByte!14469 b1!97) #b00000000000000000000000000000000) (or (bvslt (currentByte!14469 b1!97) (size!8243 (buf!7856 b1!97))) (and (= (currentBit!14464 b1!97) #b00000000000000000000000000000000) (= (currentByte!14469 b1!97) (size!8243 (buf!7856 b1!97)))))))))

(assert (=> b!311184 d!103164))

(check-sat (not d!103160) (not d!103154) (not d!103162))
(check-sat)
