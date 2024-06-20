; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64346 () Bool)

(assert start!64346)

(declare-datatypes ((array!17044 0))(
  ( (array!17045 (arr!8367 (Array (_ BitVec 32) (_ BitVec 8))) (size!7371 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12752 0))(
  ( (BitStream!12753 (buf!7437 array!17044) (currentByte!13824 (_ BitVec 32)) (currentBit!13819 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12752)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun arr!273 () array!17044)

(assert (=> start!64346 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7371 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523) (or (bvsgt ((_ sign_extend 32) (size!7371 (buf!7437 thiss!1728))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!13824 thiss!1728)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!13819 thiss!1728)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(declare-fun e!205354 () Bool)

(declare-fun inv!12 (BitStream!12752) Bool)

(assert (=> start!64346 (and (inv!12 thiss!1728) e!205354)))

(assert (=> start!64346 true))

(declare-fun array_inv!6983 (array!17044) Bool)

(assert (=> start!64346 (array_inv!6983 arr!273)))

(declare-fun b!288879 () Bool)

(assert (=> b!288879 (= e!205354 (array_inv!6983 (buf!7437 thiss!1728)))))

(assert (= start!64346 b!288879))

(declare-fun m!421587 () Bool)

(assert (=> start!64346 m!421587))

(declare-fun m!421589 () Bool)

(assert (=> start!64346 m!421589))

(declare-fun m!421591 () Bool)

(assert (=> b!288879 m!421591))

(push 1)

(assert (not b!288879))

(assert (not start!64346))

(check-sat)

(pop 1)

(push 1)

(check-sat)

