; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64360 () Bool)

(assert start!64360)

(declare-fun res!238721 () Bool)

(declare-fun e!205393 () Bool)

(assert (=> start!64360 (=> (not res!238721) (not e!205393))))

(declare-datatypes ((array!17053 0))(
  ( (array!17054 (arr!8371 (Array (_ BitVec 32) (_ BitVec 8))) (size!7375 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12760 0))(
  ( (BitStream!12761 (buf!7441 array!17053) (currentByte!13829 (_ BitVec 32)) (currentBit!13824 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12760)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun arr!273 () array!17053)

(assert (=> start!64360 (= res!238721 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7375 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523) (bvsle ((_ sign_extend 32) (size!7375 (buf!7441 thiss!1728))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!13829 thiss!1728)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!13824 thiss!1728)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!7375 (buf!7441 thiss!1728))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!13829 thiss!1728)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!13824 thiss!1728)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!64360 e!205393))

(declare-fun e!205395 () Bool)

(declare-fun inv!12 (BitStream!12760) Bool)

(assert (=> start!64360 (and (inv!12 thiss!1728) e!205395)))

(assert (=> start!64360 true))

(declare-fun array_inv!6987 (array!17053) Bool)

(assert (=> start!64360 (array_inv!6987 arr!273)))

(declare-fun b!288893 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!288893 (= e!205393 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!13824 thiss!1728))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!13829 thiss!1728))) ((_ extract 31 0) ((_ sign_extend 32) (size!7375 (buf!7441 thiss!1728)))))))))

(declare-fun b!288894 () Bool)

(assert (=> b!288894 (= e!205395 (array_inv!6987 (buf!7441 thiss!1728)))))

(assert (= (and start!64360 res!238721) b!288893))

(assert (= start!64360 b!288894))

(declare-fun m!421613 () Bool)

(assert (=> start!64360 m!421613))

(declare-fun m!421615 () Bool)

(assert (=> start!64360 m!421615))

(declare-fun m!421617 () Bool)

(assert (=> b!288893 m!421617))

(declare-fun m!421619 () Bool)

(assert (=> b!288894 m!421619))

(push 1)

(assert (not b!288893))

(assert (not b!288894))

(assert (not start!64360))

(check-sat)

(pop 1)

(push 1)

(check-sat)

