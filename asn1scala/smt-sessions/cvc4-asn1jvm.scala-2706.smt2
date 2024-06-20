; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66356 () Bool)

(assert start!66356)

(declare-fun b!297371 () Bool)

(declare-fun e!212861 () Bool)

(assert (=> b!297371 (= e!212861 (not true))))

(declare-datatypes ((array!17793 0))(
  ( (array!17794 (arr!8790 (Array (_ BitVec 32) (_ BitVec 8))) (size!7710 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17793)

(declare-fun arrayBitRangesEq!0 (array!17793 array!17793 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297371 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7710 arr!273))))))

(declare-datatypes ((Unit!20741 0))(
  ( (Unit!20742) )
))
(declare-fun lt!433671 () Unit!20741)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17793) Unit!20741)

(assert (=> b!297371 (= lt!433671 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun b!297369 () Bool)

(declare-fun res!245441 () Bool)

(assert (=> b!297369 (=> (not res!245441) (not e!212861))))

(declare-datatypes ((BitStream!13424 0))(
  ( (BitStream!13425 (buf!7773 array!17793) (currentByte!14315 (_ BitVec 32)) (currentBit!14310 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13424)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297369 (= res!245441 (validate_offset_bits!1 ((_ sign_extend 32) (size!7710 (buf!7773 thiss!1728))) ((_ sign_extend 32) (currentByte!14315 thiss!1728)) ((_ sign_extend 32) (currentBit!14310 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!297370 () Bool)

(declare-fun res!245440 () Bool)

(assert (=> b!297370 (=> (not res!245440) (not e!212861))))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!297370 (= res!245440 (bvsge from!505 to!474))))

(declare-fun b!297372 () Bool)

(declare-fun e!212862 () Bool)

(declare-fun array_inv!7322 (array!17793) Bool)

(assert (=> b!297372 (= e!212862 (array_inv!7322 (buf!7773 thiss!1728)))))

(declare-fun res!245439 () Bool)

(assert (=> start!66356 (=> (not res!245439) (not e!212861))))

(assert (=> start!66356 (= res!245439 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7710 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!66356 e!212861))

(declare-fun inv!12 (BitStream!13424) Bool)

(assert (=> start!66356 (and (inv!12 thiss!1728) e!212862)))

(assert (=> start!66356 true))

(assert (=> start!66356 (array_inv!7322 arr!273)))

(assert (= (and start!66356 res!245439) b!297369))

(assert (= (and b!297369 res!245441) b!297370))

(assert (= (and b!297370 res!245440) b!297371))

(assert (= start!66356 b!297372))

(declare-fun m!436189 () Bool)

(assert (=> b!297371 m!436189))

(declare-fun m!436191 () Bool)

(assert (=> b!297371 m!436191))

(declare-fun m!436193 () Bool)

(assert (=> b!297369 m!436193))

(declare-fun m!436195 () Bool)

(assert (=> b!297372 m!436195))

(declare-fun m!436197 () Bool)

(assert (=> start!66356 m!436197))

(declare-fun m!436199 () Bool)

(assert (=> start!66356 m!436199))

(push 1)

(assert (not b!297369))

(assert (not b!297371))

(assert (not b!297372))

(assert (not start!66356))

(check-sat)

(pop 1)

(push 1)

