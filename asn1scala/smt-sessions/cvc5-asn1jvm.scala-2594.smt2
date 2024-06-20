; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64372 () Bool)

(assert start!64372)

(declare-fun res!238733 () Bool)

(declare-fun e!205429 () Bool)

(assert (=> start!64372 (=> (not res!238733) (not e!205429))))

(declare-datatypes ((array!17060 0))(
  ( (array!17061 (arr!8374 (Array (_ BitVec 32) (_ BitVec 8))) (size!7378 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12766 0))(
  ( (BitStream!12767 (buf!7444 array!17060) (currentByte!13833 (_ BitVec 32)) (currentBit!13828 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12766)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun arr!273 () array!17060)

(assert (=> start!64372 (= res!238733 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7378 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523) (bvsle ((_ sign_extend 32) (size!7378 (buf!7444 thiss!1728))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!13833 thiss!1728)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!13828 thiss!1728)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!7378 (buf!7444 thiss!1728))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!13833 thiss!1728)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!13828 thiss!1728)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!64372 e!205429))

(declare-fun e!205431 () Bool)

(declare-fun inv!12 (BitStream!12766) Bool)

(assert (=> start!64372 (and (inv!12 thiss!1728) e!205431)))

(assert (=> start!64372 true))

(declare-fun array_inv!6990 (array!17060) Bool)

(assert (=> start!64372 (array_inv!6990 arr!273)))

(declare-fun b!288913 () Bool)

(declare-fun res!238732 () Bool)

(assert (=> b!288913 (=> (not res!238732) (not e!205429))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!288913 (= res!238732 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!13828 thiss!1728))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!13833 thiss!1728))) ((_ extract 31 0) ((_ sign_extend 32) (size!7378 (buf!7444 thiss!1728))))))))

(declare-fun b!288914 () Bool)

(assert (=> b!288914 (= e!205429 (bvslt (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!288915 () Bool)

(assert (=> b!288915 (= e!205431 (array_inv!6990 (buf!7444 thiss!1728)))))

(assert (= (and start!64372 res!238733) b!288913))

(assert (= (and b!288913 res!238732) b!288914))

(assert (= start!64372 b!288915))

(declare-fun m!421639 () Bool)

(assert (=> start!64372 m!421639))

(declare-fun m!421641 () Bool)

(assert (=> start!64372 m!421641))

(declare-fun m!421643 () Bool)

(assert (=> b!288913 m!421643))

(declare-fun m!421645 () Bool)

(assert (=> b!288915 m!421645))

(push 1)

(assert (not b!288913))

(assert (not start!64372))

(assert (not b!288915))

(check-sat)

(pop 1)

(push 1)

(check-sat)

