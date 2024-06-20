; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52028 () Bool)

(assert start!52028)

(declare-fun nBits!288 () (_ BitVec 64))

(declare-datatypes ((array!13091 0))(
  ( (array!13092 (arr!6722 (Array (_ BitVec 32) (_ BitVec 8))) (size!5735 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10392 0))(
  ( (BitStream!10393 (buf!6189 array!13091) (currentByte!11528 (_ BitVec 32)) (currentBit!11523 (_ BitVec 32))) )
))
(declare-fun thiss!982 () BitStream!10392)

(assert (=> start!52028 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!288) (bvsle nBits!288 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle ((_ sign_extend 32) (size!5735 (buf!6189 thiss!982))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!11528 thiss!982)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!11523 thiss!982)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!5735 (buf!6189 thiss!982))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!11528 thiss!982)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!11523 thiss!982)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!52028 true))

(declare-fun e!166258 () Bool)

(declare-fun inv!12 (BitStream!10392) Bool)

(assert (=> start!52028 (and (inv!12 thiss!982) e!166258)))

(declare-fun b!239810 () Bool)

(declare-fun array_inv!5476 (array!13091) Bool)

(assert (=> b!239810 (= e!166258 (array_inv!5476 (buf!6189 thiss!982)))))

(assert (= start!52028 b!239810))

(declare-fun m!362123 () Bool)

(assert (=> start!52028 m!362123))

(declare-fun m!362125 () Bool)

(assert (=> b!239810 m!362125))

(check-sat (not b!239810) (not start!52028))
(check-sat)
(get-model)

(declare-fun d!81128 () Bool)

(assert (=> d!81128 (= (array_inv!5476 (buf!6189 thiss!982)) (bvsge (size!5735 (buf!6189 thiss!982)) #b00000000000000000000000000000000))))

(assert (=> b!239810 d!81128))

(declare-fun d!81130 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!81130 (= (inv!12 thiss!982) (invariant!0 (currentBit!11523 thiss!982) (currentByte!11528 thiss!982) (size!5735 (buf!6189 thiss!982))))))

(declare-fun bs!20449 () Bool)

(assert (= bs!20449 d!81130))

(declare-fun m!362131 () Bool)

(assert (=> bs!20449 m!362131))

(assert (=> start!52028 d!81130))

(check-sat (not d!81130))
(check-sat)
(get-model)

(declare-fun d!81132 () Bool)

(assert (=> d!81132 (= (invariant!0 (currentBit!11523 thiss!982) (currentByte!11528 thiss!982) (size!5735 (buf!6189 thiss!982))) (and (bvsge (currentBit!11523 thiss!982) #b00000000000000000000000000000000) (bvslt (currentBit!11523 thiss!982) #b00000000000000000000000000001000) (bvsge (currentByte!11528 thiss!982) #b00000000000000000000000000000000) (or (bvslt (currentByte!11528 thiss!982) (size!5735 (buf!6189 thiss!982))) (and (= (currentBit!11523 thiss!982) #b00000000000000000000000000000000) (= (currentByte!11528 thiss!982) (size!5735 (buf!6189 thiss!982)))))))))

(assert (=> d!81130 d!81132))

(check-sat)
