; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52044 () Bool)

(assert start!52044)

(declare-fun res!200202 () Bool)

(declare-fun e!166281 () Bool)

(assert (=> start!52044 (=> (not res!200202) (not e!166281))))

(declare-fun nBits!288 () (_ BitVec 64))

(declare-datatypes ((array!13099 0))(
  ( (array!13100 (arr!6725 (Array (_ BitVec 32) (_ BitVec 8))) (size!5738 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10398 0))(
  ( (BitStream!10399 (buf!6192 array!13099) (currentByte!11532 (_ BitVec 32)) (currentBit!11527 (_ BitVec 32))) )
))
(declare-fun thiss!982 () BitStream!10398)

(assert (=> start!52044 (= res!200202 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!288) (bvsle nBits!288 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle ((_ sign_extend 32) (size!5738 (buf!6192 thiss!982))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!11532 thiss!982)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!11527 thiss!982)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!5738 (buf!6192 thiss!982))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!11532 thiss!982)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!11527 thiss!982)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!52044 e!166281))

(assert (=> start!52044 true))

(declare-fun e!166282 () Bool)

(declare-fun inv!12 (BitStream!10398) Bool)

(assert (=> start!52044 (and (inv!12 thiss!982) e!166282)))

(declare-fun b!239824 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!239824 (= e!166281 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!11527 thiss!982))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!11532 thiss!982))) ((_ extract 31 0) ((_ sign_extend 32) (size!5738 (buf!6192 thiss!982)))))))))

(declare-fun b!239825 () Bool)

(declare-fun array_inv!5479 (array!13099) Bool)

(assert (=> b!239825 (= e!166282 (array_inv!5479 (buf!6192 thiss!982)))))

(assert (= (and start!52044 res!200202) b!239824))

(assert (= start!52044 b!239825))

(declare-fun m!362141 () Bool)

(assert (=> start!52044 m!362141))

(declare-fun m!362143 () Bool)

(assert (=> b!239824 m!362143))

(declare-fun m!362145 () Bool)

(assert (=> b!239825 m!362145))

(check-sat (not start!52044) (not b!239825) (not b!239824))
(check-sat)
(get-model)

(declare-fun d!81140 () Bool)

(assert (=> d!81140 (= (inv!12 thiss!982) (invariant!0 (currentBit!11527 thiss!982) (currentByte!11532 thiss!982) (size!5738 (buf!6192 thiss!982))))))

(declare-fun bs!20454 () Bool)

(assert (= bs!20454 d!81140))

(declare-fun m!362153 () Bool)

(assert (=> bs!20454 m!362153))

(assert (=> start!52044 d!81140))

(declare-fun d!81146 () Bool)

(assert (=> d!81146 (= (array_inv!5479 (buf!6192 thiss!982)) (bvsge (size!5738 (buf!6192 thiss!982)) #b00000000000000000000000000000000))))

(assert (=> b!239825 d!81146))

(declare-fun d!81148 () Bool)

(assert (=> d!81148 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!11527 thiss!982))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!11532 thiss!982))) ((_ extract 31 0) ((_ sign_extend 32) (size!5738 (buf!6192 thiss!982))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!11527 thiss!982))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!11527 thiss!982))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!11532 thiss!982))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!11532 thiss!982))) ((_ extract 31 0) ((_ sign_extend 32) (size!5738 (buf!6192 thiss!982))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!11527 thiss!982))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!11532 thiss!982))) ((_ extract 31 0) ((_ sign_extend 32) (size!5738 (buf!6192 thiss!982)))))))))))

(assert (=> b!239824 d!81148))

