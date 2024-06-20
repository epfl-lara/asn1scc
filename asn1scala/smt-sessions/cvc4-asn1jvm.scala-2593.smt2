; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64364 () Bool)

(assert start!64364)

(declare-fun res!238727 () Bool)

(declare-fun e!205419 () Bool)

(assert (=> start!64364 (=> (not res!238727) (not e!205419))))

(declare-datatypes ((array!17057 0))(
  ( (array!17058 (arr!8373 (Array (_ BitVec 32) (_ BitVec 8))) (size!7377 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12764 0))(
  ( (BitStream!12765 (buf!7443 array!17057) (currentByte!13831 (_ BitVec 32)) (currentBit!13826 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12764)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun arr!273 () array!17057)

(assert (=> start!64364 (= res!238727 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7377 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523) (bvsle ((_ sign_extend 32) (size!7377 (buf!7443 thiss!1728))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!13831 thiss!1728)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!13826 thiss!1728)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!7377 (buf!7443 thiss!1728))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!13831 thiss!1728)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!13826 thiss!1728)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!64364 e!205419))

(declare-fun e!205418 () Bool)

(declare-fun inv!12 (BitStream!12764) Bool)

(assert (=> start!64364 (and (inv!12 thiss!1728) e!205418)))

(assert (=> start!64364 true))

(declare-fun array_inv!6989 (array!17057) Bool)

(assert (=> start!64364 (array_inv!6989 arr!273)))

(declare-fun b!288905 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!288905 (= e!205419 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!13826 thiss!1728))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!13831 thiss!1728))) ((_ extract 31 0) ((_ sign_extend 32) (size!7377 (buf!7443 thiss!1728)))))))))

(declare-fun b!288906 () Bool)

(assert (=> b!288906 (= e!205418 (array_inv!6989 (buf!7443 thiss!1728)))))

(assert (= (and start!64364 res!238727) b!288905))

(assert (= start!64364 b!288906))

(declare-fun m!421629 () Bool)

(assert (=> start!64364 m!421629))

(declare-fun m!421631 () Bool)

(assert (=> start!64364 m!421631))

(declare-fun m!421633 () Bool)

(assert (=> b!288905 m!421633))

(declare-fun m!421635 () Bool)

(assert (=> b!288906 m!421635))

(push 1)

(assert (not b!288906))

(assert (not start!64364))

(assert (not b!288905))

(check-sat)

(pop 1)

(push 1)

(check-sat)

