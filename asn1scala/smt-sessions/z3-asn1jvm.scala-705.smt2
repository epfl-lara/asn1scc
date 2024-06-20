; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19862 () Bool)

(assert start!19862)

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-datatypes ((array!4635 0))(
  ( (array!4636 (arr!2710 (Array (_ BitVec 32) (_ BitVec 8))) (size!2117 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3708 0))(
  ( (BitStream!3709 (buf!2474 array!4635) (currentByte!4910 (_ BitVec 32)) (currentBit!4905 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!3708)

(assert (=> start!19862 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!2117 (buf!2474 thiss!1305))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!4910 thiss!1305)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!4905 thiss!1305)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!2117 (buf!2474 thiss!1305))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!4910 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!4905 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!19862 true))

(declare-fun e!64793 () Bool)

(declare-fun inv!12 (BitStream!3708) Bool)

(assert (=> start!19862 (and (inv!12 thiss!1305) e!64793)))

(declare-fun b!99059 () Bool)

(declare-fun array_inv!1919 (array!4635) Bool)

(assert (=> b!99059 (= e!64793 (array_inv!1919 (buf!2474 thiss!1305)))))

(assert (= start!19862 b!99059))

(declare-fun m!144493 () Bool)

(assert (=> start!19862 m!144493))

(declare-fun m!144495 () Bool)

(assert (=> b!99059 m!144495))

(check-sat (not start!19862) (not b!99059))
(check-sat)
(get-model)

(declare-fun d!31254 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!31254 (= (inv!12 thiss!1305) (invariant!0 (currentBit!4905 thiss!1305) (currentByte!4910 thiss!1305) (size!2117 (buf!2474 thiss!1305))))))

(declare-fun bs!7649 () Bool)

(assert (= bs!7649 d!31254))

(declare-fun m!144501 () Bool)

(assert (=> bs!7649 m!144501))

(assert (=> start!19862 d!31254))

(declare-fun d!31256 () Bool)

(assert (=> d!31256 (= (array_inv!1919 (buf!2474 thiss!1305)) (bvsge (size!2117 (buf!2474 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!99059 d!31256))

(check-sat (not d!31254))
(check-sat)
(get-model)

(declare-fun d!31258 () Bool)

(assert (=> d!31258 (= (invariant!0 (currentBit!4905 thiss!1305) (currentByte!4910 thiss!1305) (size!2117 (buf!2474 thiss!1305))) (and (bvsge (currentBit!4905 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!4905 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!4910 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!4910 thiss!1305) (size!2117 (buf!2474 thiss!1305))) (and (= (currentBit!4905 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!4910 thiss!1305) (size!2117 (buf!2474 thiss!1305)))))))))

(assert (=> d!31254 d!31258))

(check-sat)
