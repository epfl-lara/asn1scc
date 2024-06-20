; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69004 () Bool)

(assert start!69004)

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-datatypes ((array!18964 0))(
  ( (array!18965 (arr!9311 (Array (_ BitVec 32) (_ BitVec 8))) (size!8231 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13566 0))(
  ( (BitStream!13567 (buf!7844 array!18964) (currentByte!14447 (_ BitVec 32)) (currentBit!14442 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13566)

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun b2!97 () BitStream!13566)

(assert (=> start!69004 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8231 (buf!7844 b1!97)) (size!8231 (buf!7844 b2!97))) (bvsle ((_ sign_extend 32) (size!8231 (buf!7844 b1!97))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!14447 b1!97)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!14442 b1!97)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!8231 (buf!7844 b1!97))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!14447 b1!97)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!14442 b1!97)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!69004 true))

(declare-fun e!223529 () Bool)

(declare-fun inv!12 (BitStream!13566) Bool)

(assert (=> start!69004 (and (inv!12 b1!97) e!223529)))

(declare-fun e!223531 () Bool)

(assert (=> start!69004 (and (inv!12 b2!97) e!223531)))

(declare-fun b!311056 () Bool)

(declare-fun array_inv!7783 (array!18964) Bool)

(assert (=> b!311056 (= e!223529 (array_inv!7783 (buf!7844 b1!97)))))

(declare-fun b!311057 () Bool)

(assert (=> b!311057 (= e!223531 (array_inv!7783 (buf!7844 b2!97)))))

(assert (= start!69004 b!311056))

(assert (= start!69004 b!311057))

(declare-fun m!448915 () Bool)

(assert (=> start!69004 m!448915))

(declare-fun m!448917 () Bool)

(assert (=> start!69004 m!448917))

(declare-fun m!448919 () Bool)

(assert (=> b!311056 m!448919))

(declare-fun m!448921 () Bool)

(assert (=> b!311057 m!448921))

(check-sat (not start!69004) (not b!311056) (not b!311057))
(check-sat)
(get-model)

(declare-fun d!103066 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!103066 (= (inv!12 b1!97) (invariant!0 (currentBit!14442 b1!97) (currentByte!14447 b1!97) (size!8231 (buf!7844 b1!97))))))

(declare-fun bs!26667 () Bool)

(assert (= bs!26667 d!103066))

(declare-fun m!448931 () Bool)

(assert (=> bs!26667 m!448931))

(assert (=> start!69004 d!103066))

(declare-fun d!103068 () Bool)

(assert (=> d!103068 (= (inv!12 b2!97) (invariant!0 (currentBit!14442 b2!97) (currentByte!14447 b2!97) (size!8231 (buf!7844 b2!97))))))

(declare-fun bs!26668 () Bool)

(assert (= bs!26668 d!103068))

(declare-fun m!448933 () Bool)

(assert (=> bs!26668 m!448933))

(assert (=> start!69004 d!103068))

(declare-fun d!103070 () Bool)

(assert (=> d!103070 (= (array_inv!7783 (buf!7844 b1!97)) (bvsge (size!8231 (buf!7844 b1!97)) #b00000000000000000000000000000000))))

(assert (=> b!311056 d!103070))

(declare-fun d!103072 () Bool)

(assert (=> d!103072 (= (array_inv!7783 (buf!7844 b2!97)) (bvsge (size!8231 (buf!7844 b2!97)) #b00000000000000000000000000000000))))

(assert (=> b!311057 d!103072))

(check-sat (not d!103066) (not d!103068))
(check-sat)
(get-model)

(declare-fun d!103082 () Bool)

(assert (=> d!103082 (= (invariant!0 (currentBit!14442 b1!97) (currentByte!14447 b1!97) (size!8231 (buf!7844 b1!97))) (and (bvsge (currentBit!14442 b1!97) #b00000000000000000000000000000000) (bvslt (currentBit!14442 b1!97) #b00000000000000000000000000001000) (bvsge (currentByte!14447 b1!97) #b00000000000000000000000000000000) (or (bvslt (currentByte!14447 b1!97) (size!8231 (buf!7844 b1!97))) (and (= (currentBit!14442 b1!97) #b00000000000000000000000000000000) (= (currentByte!14447 b1!97) (size!8231 (buf!7844 b1!97)))))))))

(assert (=> d!103066 d!103082))

(declare-fun d!103084 () Bool)

(assert (=> d!103084 (= (invariant!0 (currentBit!14442 b2!97) (currentByte!14447 b2!97) (size!8231 (buf!7844 b2!97))) (and (bvsge (currentBit!14442 b2!97) #b00000000000000000000000000000000) (bvslt (currentBit!14442 b2!97) #b00000000000000000000000000001000) (bvsge (currentByte!14447 b2!97) #b00000000000000000000000000000000) (or (bvslt (currentByte!14447 b2!97) (size!8231 (buf!7844 b2!97))) (and (= (currentBit!14442 b2!97) #b00000000000000000000000000000000) (= (currentByte!14447 b2!97) (size!8231 (buf!7844 b2!97)))))))))

(assert (=> d!103068 d!103084))

(check-sat)
