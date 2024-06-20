; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4674 () Bool)

(assert start!4674)

(declare-fun bits!97 () (_ BitVec 64))

(declare-datatypes ((array!1282 0))(
  ( (array!1283 (arr!983 (Array (_ BitVec 32) (_ BitVec 8))) (size!542 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!918 0))(
  ( (BitStream!919 (buf!842 array!1282) (currentByte!2105 (_ BitVec 32)) (currentBit!2100 (_ BitVec 32))) )
))
(declare-fun thiss!912 () BitStream!918)

(assert (=> start!4674 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!97) (bvsle ((_ sign_extend 32) (size!542 (buf!842 thiss!912))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!2105 thiss!912)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!2100 thiss!912)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!542 (buf!842 thiss!912))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!2105 thiss!912)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!2100 thiss!912)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!4674 true))

(declare-fun e!12068 () Bool)

(declare-fun inv!12 (BitStream!918) Bool)

(assert (=> start!4674 (and (inv!12 thiss!912) e!12068)))

(declare-fun b!18731 () Bool)

(declare-fun array_inv!512 (array!1282) Bool)

(assert (=> b!18731 (= e!12068 (array_inv!512 (buf!842 thiss!912)))))

(assert (= start!4674 b!18731))

(declare-fun m!25151 () Bool)

(assert (=> start!4674 m!25151))

(declare-fun m!25153 () Bool)

(assert (=> b!18731 m!25153))

(check-sat (not b!18731) (not start!4674))
(check-sat)
(get-model)

(declare-fun d!6188 () Bool)

(assert (=> d!6188 (= (array_inv!512 (buf!842 thiss!912)) (bvsge (size!542 (buf!842 thiss!912)) #b00000000000000000000000000000000))))

(assert (=> b!18731 d!6188))

(declare-fun d!6190 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!6190 (= (inv!12 thiss!912) (invariant!0 (currentBit!2100 thiss!912) (currentByte!2105 thiss!912) (size!542 (buf!842 thiss!912))))))

(declare-fun bs!1782 () Bool)

(assert (= bs!1782 d!6190))

(declare-fun m!25159 () Bool)

(assert (=> bs!1782 m!25159))

(assert (=> start!4674 d!6190))

(check-sat (not d!6190))
(check-sat)
(get-model)

(declare-fun d!6194 () Bool)

(assert (=> d!6194 (= (invariant!0 (currentBit!2100 thiss!912) (currentByte!2105 thiss!912) (size!542 (buf!842 thiss!912))) (and (bvsge (currentBit!2100 thiss!912) #b00000000000000000000000000000000) (bvslt (currentBit!2100 thiss!912) #b00000000000000000000000000001000) (bvsge (currentByte!2105 thiss!912) #b00000000000000000000000000000000) (or (bvslt (currentByte!2105 thiss!912) (size!542 (buf!842 thiss!912))) (and (= (currentBit!2100 thiss!912) #b00000000000000000000000000000000) (= (currentByte!2105 thiss!912) (size!542 (buf!842 thiss!912)))))))))

(assert (=> d!6190 d!6194))

(check-sat)
