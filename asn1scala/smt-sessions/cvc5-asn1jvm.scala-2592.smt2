; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64348 () Bool)

(assert start!64348)

(declare-datatypes ((array!17046 0))(
  ( (array!17047 (arr!8368 (Array (_ BitVec 32) (_ BitVec 8))) (size!7372 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12754 0))(
  ( (BitStream!12755 (buf!7438 array!17046) (currentByte!13825 (_ BitVec 32)) (currentBit!13820 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12754)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun arr!273 () array!17046)

(assert (=> start!64348 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7372 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523) (bvsle ((_ sign_extend 32) (size!7372 (buf!7438 thiss!1728))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!13825 thiss!1728)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!13820 thiss!1728)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!7372 (buf!7438 thiss!1728))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!13825 thiss!1728)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!13820 thiss!1728)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!205363 () Bool)

(declare-fun inv!12 (BitStream!12754) Bool)

(assert (=> start!64348 (and (inv!12 thiss!1728) e!205363)))

(assert (=> start!64348 true))

(declare-fun array_inv!6984 (array!17046) Bool)

(assert (=> start!64348 (array_inv!6984 arr!273)))

(declare-fun b!288882 () Bool)

(assert (=> b!288882 (= e!205363 (array_inv!6984 (buf!7438 thiss!1728)))))

(assert (= start!64348 b!288882))

(declare-fun m!421593 () Bool)

(assert (=> start!64348 m!421593))

(declare-fun m!421595 () Bool)

(assert (=> start!64348 m!421595))

(declare-fun m!421597 () Bool)

(assert (=> b!288882 m!421597))

(push 1)

(assert (not b!288882))

(assert (not start!64348))

(check-sat)

(pop 1)

(push 1)

(check-sat)

