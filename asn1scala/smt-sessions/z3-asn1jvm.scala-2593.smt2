; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64362 () Bool)

(assert start!64362)

(declare-fun res!238724 () Bool)

(declare-fun e!205406 () Bool)

(assert (=> start!64362 (=> (not res!238724) (not e!205406))))

(declare-datatypes ((array!17055 0))(
  ( (array!17056 (arr!8372 (Array (_ BitVec 32) (_ BitVec 8))) (size!7376 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12762 0))(
  ( (BitStream!12763 (buf!7442 array!17055) (currentByte!13830 (_ BitVec 32)) (currentBit!13825 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12762)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun arr!273 () array!17055)

(assert (=> start!64362 (= res!238724 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7376 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523) (bvsle ((_ sign_extend 32) (size!7376 (buf!7442 thiss!1728))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!13830 thiss!1728)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!13825 thiss!1728)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!7376 (buf!7442 thiss!1728))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!13830 thiss!1728)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!13825 thiss!1728)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!64362 e!205406))

(declare-fun e!205404 () Bool)

(declare-fun inv!12 (BitStream!12762) Bool)

(assert (=> start!64362 (and (inv!12 thiss!1728) e!205404)))

(assert (=> start!64362 true))

(declare-fun array_inv!6988 (array!17055) Bool)

(assert (=> start!64362 (array_inv!6988 arr!273)))

(declare-fun b!288899 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!288899 (= e!205406 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!13825 thiss!1728))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!13830 thiss!1728))) ((_ extract 31 0) ((_ sign_extend 32) (size!7376 (buf!7442 thiss!1728)))))))))

(declare-fun b!288900 () Bool)

(assert (=> b!288900 (= e!205404 (array_inv!6988 (buf!7442 thiss!1728)))))

(assert (= (and start!64362 res!238724) b!288899))

(assert (= start!64362 b!288900))

(declare-fun m!421621 () Bool)

(assert (=> start!64362 m!421621))

(declare-fun m!421623 () Bool)

(assert (=> start!64362 m!421623))

(declare-fun m!421625 () Bool)

(assert (=> b!288899 m!421625))

(declare-fun m!421627 () Bool)

(assert (=> b!288900 m!421627))

(check-sat (not start!64362) (not b!288900) (not b!288899))
(check-sat)
(get-model)

(declare-fun d!98142 () Bool)

(assert (=> d!98142 (= (inv!12 thiss!1728) (invariant!0 (currentBit!13825 thiss!1728) (currentByte!13830 thiss!1728) (size!7376 (buf!7442 thiss!1728))))))

(declare-fun bs!24941 () Bool)

(assert (= bs!24941 d!98142))

(declare-fun m!421637 () Bool)

(assert (=> bs!24941 m!421637))

(assert (=> start!64362 d!98142))

(declare-fun d!98144 () Bool)

(assert (=> d!98144 (= (array_inv!6988 arr!273) (bvsge (size!7376 arr!273) #b00000000000000000000000000000000))))

(assert (=> start!64362 d!98144))

(declare-fun d!98146 () Bool)

(assert (=> d!98146 (= (array_inv!6988 (buf!7442 thiss!1728)) (bvsge (size!7376 (buf!7442 thiss!1728)) #b00000000000000000000000000000000))))

(assert (=> b!288900 d!98146))

(declare-fun d!98148 () Bool)

(assert (=> d!98148 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!13825 thiss!1728))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!13830 thiss!1728))) ((_ extract 31 0) ((_ sign_extend 32) (size!7376 (buf!7442 thiss!1728))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!13825 thiss!1728))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!13825 thiss!1728))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!13830 thiss!1728))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!13830 thiss!1728))) ((_ extract 31 0) ((_ sign_extend 32) (size!7376 (buf!7442 thiss!1728))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!13825 thiss!1728))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!13830 thiss!1728))) ((_ extract 31 0) ((_ sign_extend 32) (size!7376 (buf!7442 thiss!1728)))))))))))

(assert (=> b!288899 d!98148))

(check-sat (not d!98142))
(check-sat)
