; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64376 () Bool)

(assert start!64376)

(declare-fun res!238745 () Bool)

(declare-fun e!205452 () Bool)

(assert (=> start!64376 (=> (not res!238745) (not e!205452))))

(declare-datatypes ((array!17064 0))(
  ( (array!17065 (arr!8376 (Array (_ BitVec 32) (_ BitVec 8))) (size!7380 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12770 0))(
  ( (BitStream!12771 (buf!7446 array!17064) (currentByte!13835 (_ BitVec 32)) (currentBit!13830 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12770)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun arr!273 () array!17064)

(assert (=> start!64376 (= res!238745 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7380 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523) (bvsle ((_ sign_extend 32) (size!7380 (buf!7446 thiss!1728))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!13835 thiss!1728)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!13830 thiss!1728)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!7380 (buf!7446 thiss!1728))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!13835 thiss!1728)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!13830 thiss!1728)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!64376 e!205452))

(declare-fun e!205453 () Bool)

(declare-fun inv!12 (BitStream!12770) Bool)

(assert (=> start!64376 (and (inv!12 thiss!1728) e!205453)))

(assert (=> start!64376 true))

(declare-fun array_inv!6992 (array!17064) Bool)

(assert (=> start!64376 (array_inv!6992 arr!273)))

(declare-fun b!288931 () Bool)

(declare-fun res!238744 () Bool)

(assert (=> b!288931 (=> (not res!238744) (not e!205452))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!288931 (= res!238744 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!13830 thiss!1728))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!13835 thiss!1728))) ((_ extract 31 0) ((_ sign_extend 32) (size!7380 (buf!7446 thiss!1728))))))))

(declare-fun b!288932 () Bool)

(assert (=> b!288932 (= e!205452 (bvslt (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!288933 () Bool)

(assert (=> b!288933 (= e!205453 (array_inv!6992 (buf!7446 thiss!1728)))))

(assert (= (and start!64376 res!238745) b!288931))

(assert (= (and b!288931 res!238744) b!288932))

(assert (= start!64376 b!288933))

(declare-fun m!421655 () Bool)

(assert (=> start!64376 m!421655))

(declare-fun m!421657 () Bool)

(assert (=> start!64376 m!421657))

(declare-fun m!421659 () Bool)

(assert (=> b!288931 m!421659))

(declare-fun m!421661 () Bool)

(assert (=> b!288933 m!421661))

(push 1)

(assert (not start!64376))

(assert (not b!288933))

(assert (not b!288931))

(check-sat)

(pop 1)

(push 1)

(check-sat)

