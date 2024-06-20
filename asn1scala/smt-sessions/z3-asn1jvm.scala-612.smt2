; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17422 () Bool)

(assert start!17422)

(declare-fun nBits!333 () (_ BitVec 32))

(declare-datatypes ((array!3959 0))(
  ( (array!3960 (arr!2431 (Array (_ BitVec 32) (_ BitVec 8))) (size!1794 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3150 0))(
  ( (BitStream!3151 (buf!2184 array!3959) (currentByte!4339 (_ BitVec 32)) (currentBit!4334 (_ BitVec 32))) )
))
(declare-fun thiss!1136 () BitStream!3150)

(assert (=> start!17422 (and (bvsge nBits!333 #b00000000000000000000000000000000) (bvsle nBits!333 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!1794 (buf!2184 thiss!1136))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!4339 thiss!1136)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!4334 thiss!1136)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!1794 (buf!2184 thiss!1136))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!4339 thiss!1136)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!4334 thiss!1136)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!17422 true))

(declare-fun e!56195 () Bool)

(declare-fun inv!12 (BitStream!3150) Bool)

(assert (=> start!17422 (and (inv!12 thiss!1136) e!56195)))

(declare-fun b!84091 () Bool)

(declare-fun array_inv!1640 (array!3959) Bool)

(assert (=> b!84091 (= e!56195 (array_inv!1640 (buf!2184 thiss!1136)))))

(assert (= start!17422 b!84091))

(declare-fun m!130795 () Bool)

(assert (=> start!17422 m!130795))

(declare-fun m!130797 () Bool)

(assert (=> b!84091 m!130797))

(check-sat (not start!17422) (not b!84091))
(check-sat)
(get-model)

(declare-fun d!27070 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!27070 (= (inv!12 thiss!1136) (invariant!0 (currentBit!4334 thiss!1136) (currentByte!4339 thiss!1136) (size!1794 (buf!2184 thiss!1136))))))

(declare-fun bs!6691 () Bool)

(assert (= bs!6691 d!27070))

(declare-fun m!130803 () Bool)

(assert (=> bs!6691 m!130803))

(assert (=> start!17422 d!27070))

(declare-fun d!27072 () Bool)

(assert (=> d!27072 (= (array_inv!1640 (buf!2184 thiss!1136)) (bvsge (size!1794 (buf!2184 thiss!1136)) #b00000000000000000000000000000000))))

(assert (=> b!84091 d!27072))

(check-sat (not d!27070))
(check-sat)
(get-model)

(declare-fun d!27074 () Bool)

(assert (=> d!27074 (= (invariant!0 (currentBit!4334 thiss!1136) (currentByte!4339 thiss!1136) (size!1794 (buf!2184 thiss!1136))) (and (bvsge (currentBit!4334 thiss!1136) #b00000000000000000000000000000000) (bvslt (currentBit!4334 thiss!1136) #b00000000000000000000000000001000) (bvsge (currentByte!4339 thiss!1136) #b00000000000000000000000000000000) (or (bvslt (currentByte!4339 thiss!1136) (size!1794 (buf!2184 thiss!1136))) (and (= (currentBit!4334 thiss!1136) #b00000000000000000000000000000000) (= (currentByte!4339 thiss!1136) (size!1794 (buf!2184 thiss!1136)))))))))

(assert (=> d!27070 d!27074))

(check-sat)
