; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64352 () Bool)

(assert start!64352)

(declare-datatypes ((array!17050 0))(
  ( (array!17051 (arr!8370 (Array (_ BitVec 32) (_ BitVec 8))) (size!7374 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12758 0))(
  ( (BitStream!12759 (buf!7440 array!17050) (currentByte!13827 (_ BitVec 32)) (currentBit!13822 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12758)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun arr!273 () array!17050)

(assert (=> start!64352 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7374 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523) (bvsle ((_ sign_extend 32) (size!7374 (buf!7440 thiss!1728))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!13827 thiss!1728)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!13822 thiss!1728)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!7374 (buf!7440 thiss!1728))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!13827 thiss!1728)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!13822 thiss!1728)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!205381 () Bool)

(declare-fun inv!12 (BitStream!12758) Bool)

(assert (=> start!64352 (and (inv!12 thiss!1728) e!205381)))

(assert (=> start!64352 true))

(declare-fun array_inv!6986 (array!17050) Bool)

(assert (=> start!64352 (array_inv!6986 arr!273)))

(declare-fun b!288888 () Bool)

(assert (=> b!288888 (= e!205381 (array_inv!6986 (buf!7440 thiss!1728)))))

(assert (= start!64352 b!288888))

(declare-fun m!421605 () Bool)

(assert (=> start!64352 m!421605))

(declare-fun m!421607 () Bool)

(assert (=> start!64352 m!421607))

(declare-fun m!421609 () Bool)

(assert (=> b!288888 m!421609))

(push 1)

(assert (not b!288888))

(assert (not start!64352))

(check-sat)

(pop 1)

(push 1)

(check-sat)

