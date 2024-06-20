; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4694 () Bool)

(assert start!4694)

(declare-fun res!16439 () Bool)

(declare-fun e!12091 () Bool)

(assert (=> start!4694 (=> (not res!16439) (not e!12091))))

(declare-fun bits!97 () (_ BitVec 64))

(declare-datatypes ((array!1291 0))(
  ( (array!1292 (arr!986 (Array (_ BitVec 32) (_ BitVec 8))) (size!545 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!924 0))(
  ( (BitStream!925 (buf!845 array!1291) (currentByte!2109 (_ BitVec 32)) (currentBit!2104 (_ BitVec 32))) )
))
(declare-fun thiss!912 () BitStream!924)

(assert (=> start!4694 (= res!16439 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!97) (bvsle ((_ sign_extend 32) (size!545 (buf!845 thiss!912))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!2109 thiss!912)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!2104 thiss!912)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!545 (buf!845 thiss!912))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!2109 thiss!912)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!2104 thiss!912)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!4694 e!12091))

(assert (=> start!4694 true))

(declare-fun e!12092 () Bool)

(declare-fun inv!12 (BitStream!924) Bool)

(assert (=> start!4694 (and (inv!12 thiss!912) e!12092)))

(declare-fun b!18745 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!18745 (= e!12091 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!2104 thiss!912))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!2109 thiss!912))) ((_ extract 31 0) ((_ sign_extend 32) (size!545 (buf!845 thiss!912)))))))))

(declare-fun b!18746 () Bool)

(declare-fun array_inv!515 (array!1291) Bool)

(assert (=> b!18746 (= e!12092 (array_inv!515 (buf!845 thiss!912)))))

(assert (= (and start!4694 res!16439) b!18745))

(assert (= start!4694 b!18746))

(declare-fun m!25169 () Bool)

(assert (=> start!4694 m!25169))

(declare-fun m!25171 () Bool)

(assert (=> b!18745 m!25171))

(declare-fun m!25173 () Bool)

(assert (=> b!18746 m!25173))

(check-sat (not b!18746) (not start!4694) (not b!18745))
(check-sat)
(get-model)

(declare-fun d!6204 () Bool)

(assert (=> d!6204 (= (array_inv!515 (buf!845 thiss!912)) (bvsge (size!545 (buf!845 thiss!912)) #b00000000000000000000000000000000))))

(assert (=> b!18746 d!6204))

(declare-fun d!6206 () Bool)

(assert (=> d!6206 (= (inv!12 thiss!912) (invariant!0 (currentBit!2104 thiss!912) (currentByte!2109 thiss!912) (size!545 (buf!845 thiss!912))))))

(declare-fun bs!1787 () Bool)

(assert (= bs!1787 d!6206))

(declare-fun m!25181 () Bool)

(assert (=> bs!1787 m!25181))

(assert (=> start!4694 d!6206))

(declare-fun d!6208 () Bool)

(assert (=> d!6208 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!2104 thiss!912))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!2109 thiss!912))) ((_ extract 31 0) ((_ sign_extend 32) (size!545 (buf!845 thiss!912))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!2104 thiss!912))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!2104 thiss!912))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!2109 thiss!912))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!2109 thiss!912))) ((_ extract 31 0) ((_ sign_extend 32) (size!545 (buf!845 thiss!912))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!2104 thiss!912))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!2109 thiss!912))) ((_ extract 31 0) ((_ sign_extend 32) (size!545 (buf!845 thiss!912)))))))))))

(assert (=> b!18745 d!6208))

(check-sat (not d!6206))
(check-sat)
