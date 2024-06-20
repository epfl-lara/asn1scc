; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64350 () Bool)

(assert start!64350)

(declare-datatypes ((array!17048 0))(
  ( (array!17049 (arr!8369 (Array (_ BitVec 32) (_ BitVec 8))) (size!7373 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12756 0))(
  ( (BitStream!12757 (buf!7439 array!17048) (currentByte!13826 (_ BitVec 32)) (currentBit!13821 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12756)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun arr!273 () array!17048)

(assert (=> start!64350 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7373 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523) (bvsle ((_ sign_extend 32) (size!7373 (buf!7439 thiss!1728))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!13826 thiss!1728)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!13821 thiss!1728)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!7373 (buf!7439 thiss!1728))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!13826 thiss!1728)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!13821 thiss!1728)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!205372 () Bool)

(declare-fun inv!12 (BitStream!12756) Bool)

(assert (=> start!64350 (and (inv!12 thiss!1728) e!205372)))

(assert (=> start!64350 true))

(declare-fun array_inv!6985 (array!17048) Bool)

(assert (=> start!64350 (array_inv!6985 arr!273)))

(declare-fun b!288885 () Bool)

(assert (=> b!288885 (= e!205372 (array_inv!6985 (buf!7439 thiss!1728)))))

(assert (= start!64350 b!288885))

(declare-fun m!421599 () Bool)

(assert (=> start!64350 m!421599))

(declare-fun m!421601 () Bool)

(assert (=> start!64350 m!421601))

(declare-fun m!421603 () Bool)

(assert (=> b!288885 m!421603))

(check-sat (not start!64350) (not b!288885))
(check-sat)
(get-model)

(declare-fun d!98132 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!98132 (= (inv!12 thiss!1728) (invariant!0 (currentBit!13821 thiss!1728) (currentByte!13826 thiss!1728) (size!7373 (buf!7439 thiss!1728))))))

(declare-fun bs!24937 () Bool)

(assert (= bs!24937 d!98132))

(declare-fun m!421611 () Bool)

(assert (=> bs!24937 m!421611))

(assert (=> start!64350 d!98132))

(declare-fun d!98134 () Bool)

(assert (=> d!98134 (= (array_inv!6985 arr!273) (bvsge (size!7373 arr!273) #b00000000000000000000000000000000))))

(assert (=> start!64350 d!98134))

(declare-fun d!98136 () Bool)

(assert (=> d!98136 (= (array_inv!6985 (buf!7439 thiss!1728)) (bvsge (size!7373 (buf!7439 thiss!1728)) #b00000000000000000000000000000000))))

(assert (=> b!288885 d!98136))

(check-sat (not d!98132))
(check-sat)
(get-model)

(declare-fun d!98138 () Bool)

(assert (=> d!98138 (= (invariant!0 (currentBit!13821 thiss!1728) (currentByte!13826 thiss!1728) (size!7373 (buf!7439 thiss!1728))) (and (bvsge (currentBit!13821 thiss!1728) #b00000000000000000000000000000000) (bvslt (currentBit!13821 thiss!1728) #b00000000000000000000000000001000) (bvsge (currentByte!13826 thiss!1728) #b00000000000000000000000000000000) (or (bvslt (currentByte!13826 thiss!1728) (size!7373 (buf!7439 thiss!1728))) (and (= (currentBit!13821 thiss!1728) #b00000000000000000000000000000000) (= (currentByte!13826 thiss!1728) (size!7373 (buf!7439 thiss!1728)))))))))

(assert (=> d!98132 d!98138))

(check-sat)
