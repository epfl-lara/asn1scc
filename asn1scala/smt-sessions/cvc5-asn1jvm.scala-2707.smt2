; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66358 () Bool)

(assert start!66358)

(declare-fun b!297381 () Bool)

(declare-fun res!245448 () Bool)

(declare-fun e!212872 () Bool)

(assert (=> b!297381 (=> (not res!245448) (not e!212872))))

(declare-datatypes ((array!17795 0))(
  ( (array!17796 (arr!8791 (Array (_ BitVec 32) (_ BitVec 8))) (size!7711 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13426 0))(
  ( (BitStream!13427 (buf!7774 array!17795) (currentByte!14316 (_ BitVec 32)) (currentBit!14311 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13426)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297381 (= res!245448 (validate_offset_bits!1 ((_ sign_extend 32) (size!7711 (buf!7774 thiss!1728))) ((_ sign_extend 32) (currentByte!14316 thiss!1728)) ((_ sign_extend 32) (currentBit!14311 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun res!245450 () Bool)

(assert (=> start!66358 (=> (not res!245450) (not e!212872))))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun arr!273 () array!17795)

(assert (=> start!66358 (= res!245450 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7711 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!66358 e!212872))

(declare-fun e!212871 () Bool)

(declare-fun inv!12 (BitStream!13426) Bool)

(assert (=> start!66358 (and (inv!12 thiss!1728) e!212871)))

(assert (=> start!66358 true))

(declare-fun array_inv!7323 (array!17795) Bool)

(assert (=> start!66358 (array_inv!7323 arr!273)))

(declare-fun b!297383 () Bool)

(assert (=> b!297383 (= e!212872 (not true))))

(declare-fun arrayBitRangesEq!0 (array!17795 array!17795 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297383 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7711 arr!273))))))

(declare-datatypes ((Unit!20743 0))(
  ( (Unit!20744) )
))
(declare-fun lt!433674 () Unit!20743)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17795) Unit!20743)

(assert (=> b!297383 (= lt!433674 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun b!297384 () Bool)

(assert (=> b!297384 (= e!212871 (array_inv!7323 (buf!7774 thiss!1728)))))

(declare-fun b!297382 () Bool)

(declare-fun res!245449 () Bool)

(assert (=> b!297382 (=> (not res!245449) (not e!212872))))

(assert (=> b!297382 (= res!245449 (bvsge from!505 to!474))))

(assert (= (and start!66358 res!245450) b!297381))

(assert (= (and b!297381 res!245448) b!297382))

(assert (= (and b!297382 res!245449) b!297383))

(assert (= start!66358 b!297384))

(declare-fun m!436201 () Bool)

(assert (=> b!297381 m!436201))

(declare-fun m!436203 () Bool)

(assert (=> start!66358 m!436203))

(declare-fun m!436205 () Bool)

(assert (=> start!66358 m!436205))

(declare-fun m!436207 () Bool)

(assert (=> b!297383 m!436207))

(declare-fun m!436209 () Bool)

(assert (=> b!297383 m!436209))

(declare-fun m!436211 () Bool)

(assert (=> b!297384 m!436211))

(push 1)

(assert (not b!297383))

(assert (not b!297384))

(assert (not start!66358))

(assert (not b!297381))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

