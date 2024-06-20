; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31980 () Bool)

(assert start!31980)

(declare-datatypes ((array!7469 0))(
  ( (array!7470 (arr!4307 (Array (_ BitVec 32) (_ BitVec 8))) (size!3386 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5940 0))(
  ( (BitStream!5941 (buf!3844 array!7469) (currentByte!7054 (_ BitVec 32)) (currentBit!7049 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!5940)

(assert (=> start!31980 (and (bvsle ((_ sign_extend 32) (size!3386 (buf!3844 thiss!1602))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!7054 thiss!1602)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!7049 thiss!1602)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!3386 (buf!3844 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!7054 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!7049 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!108092 () Bool)

(declare-fun inv!12 (BitStream!5940) Bool)

(assert (=> start!31980 (and (inv!12 thiss!1602) e!108092)))

(declare-fun b!158727 () Bool)

(declare-fun array_inv!3133 (array!7469) Bool)

(assert (=> b!158727 (= e!108092 (array_inv!3133 (buf!3844 thiss!1602)))))

(assert (= start!31980 b!158727))

(declare-fun m!249281 () Bool)

(assert (=> start!31980 m!249281))

(declare-fun m!249283 () Bool)

(assert (=> b!158727 m!249283))

(check-sat (not start!31980) (not b!158727))
(check-sat)
(get-model)

(declare-fun d!53337 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!53337 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7049 thiss!1602) (currentByte!7054 thiss!1602) (size!3386 (buf!3844 thiss!1602))))))

(declare-fun bs!13197 () Bool)

(assert (= bs!13197 d!53337))

(declare-fun m!249289 () Bool)

(assert (=> bs!13197 m!249289))

(assert (=> start!31980 d!53337))

(declare-fun d!53339 () Bool)

(assert (=> d!53339 (= (array_inv!3133 (buf!3844 thiss!1602)) (bvsge (size!3386 (buf!3844 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!158727 d!53339))

(check-sat (not d!53337))
(check-sat)
(get-model)

(declare-fun d!53343 () Bool)

(assert (=> d!53343 (= (invariant!0 (currentBit!7049 thiss!1602) (currentByte!7054 thiss!1602) (size!3386 (buf!3844 thiss!1602))) (and (bvsge (currentBit!7049 thiss!1602) #b00000000000000000000000000000000) (bvslt (currentBit!7049 thiss!1602) #b00000000000000000000000000001000) (bvsge (currentByte!7054 thiss!1602) #b00000000000000000000000000000000) (or (bvslt (currentByte!7054 thiss!1602) (size!3386 (buf!3844 thiss!1602))) (and (= (currentBit!7049 thiss!1602) #b00000000000000000000000000000000) (= (currentByte!7054 thiss!1602) (size!3386 (buf!3844 thiss!1602)))))))))

(assert (=> d!53337 d!53343))

(check-sat)
