; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64342 () Bool)

(assert start!64342)

(declare-datatypes ((array!17040 0))(
  ( (array!17041 (arr!8365 (Array (_ BitVec 32) (_ BitVec 8))) (size!7369 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12748 0))(
  ( (BitStream!12749 (buf!7435 array!17040) (currentByte!13822 (_ BitVec 32)) (currentBit!13817 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12748)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun arr!273 () array!17040)

(assert (=> start!64342 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7369 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523) (or (bvsgt ((_ sign_extend 32) (size!7369 (buf!7435 thiss!1728))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!13822 thiss!1728)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!13817 thiss!1728)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(declare-fun e!205336 () Bool)

(declare-fun inv!12 (BitStream!12748) Bool)

(assert (=> start!64342 (and (inv!12 thiss!1728) e!205336)))

(assert (=> start!64342 true))

(declare-fun array_inv!6981 (array!17040) Bool)

(assert (=> start!64342 (array_inv!6981 arr!273)))

(declare-fun b!288873 () Bool)

(assert (=> b!288873 (= e!205336 (array_inv!6981 (buf!7435 thiss!1728)))))

(assert (= start!64342 b!288873))

(declare-fun m!421575 () Bool)

(assert (=> start!64342 m!421575))

(declare-fun m!421577 () Bool)

(assert (=> start!64342 m!421577))

(declare-fun m!421579 () Bool)

(assert (=> b!288873 m!421579))

(push 1)

(assert (not b!288873))

(assert (not start!64342))

(check-sat)

(pop 1)

(push 1)

(check-sat)

