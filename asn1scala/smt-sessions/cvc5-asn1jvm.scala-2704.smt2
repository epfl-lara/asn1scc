; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66340 () Bool)

(assert start!66340)

(declare-fun b!297273 () Bool)

(declare-fun res!245367 () Bool)

(declare-fun e!212765 () Bool)

(assert (=> b!297273 (=> (not res!245367) (not e!212765))))

(declare-datatypes ((array!17777 0))(
  ( (array!17778 (arr!8782 (Array (_ BitVec 32) (_ BitVec 8))) (size!7702 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13408 0))(
  ( (BitStream!13409 (buf!7765 array!17777) (currentByte!14307 (_ BitVec 32)) (currentBit!14302 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13408)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297273 (= res!245367 (validate_offset_bits!1 ((_ sign_extend 32) (size!7702 (buf!7765 thiss!1728))) ((_ sign_extend 32) (currentByte!14307 thiss!1728)) ((_ sign_extend 32) (currentBit!14302 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!297276 () Bool)

(declare-fun e!212766 () Bool)

(declare-fun array_inv!7314 (array!17777) Bool)

(assert (=> b!297276 (= e!212766 (array_inv!7314 (buf!7765 thiss!1728)))))

(declare-fun b!297275 () Bool)

(assert (=> b!297275 (= e!212765 (not true))))

(declare-fun arr!273 () array!17777)

(declare-fun arrayBitRangesEq!0 (array!17777 array!17777 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297275 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7702 arr!273))))))

(declare-datatypes ((Unit!20725 0))(
  ( (Unit!20726) )
))
(declare-fun lt!433638 () Unit!20725)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17777) Unit!20725)

(assert (=> b!297275 (= lt!433638 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun res!245368 () Bool)

(assert (=> start!66340 (=> (not res!245368) (not e!212765))))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> start!66340 (= res!245368 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7702 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!66340 e!212765))

(declare-fun inv!12 (BitStream!13408) Bool)

(assert (=> start!66340 (and (inv!12 thiss!1728) e!212766)))

(assert (=> start!66340 true))

(assert (=> start!66340 (array_inv!7314 arr!273)))

(declare-fun b!297274 () Bool)

(declare-fun res!245369 () Bool)

(assert (=> b!297274 (=> (not res!245369) (not e!212765))))

(assert (=> b!297274 (= res!245369 (bvsge from!505 to!474))))

(assert (= (and start!66340 res!245368) b!297273))

(assert (= (and b!297273 res!245367) b!297274))

(assert (= (and b!297274 res!245369) b!297275))

(assert (= start!66340 b!297276))

(declare-fun m!436093 () Bool)

(assert (=> b!297273 m!436093))

(declare-fun m!436095 () Bool)

(assert (=> b!297276 m!436095))

(declare-fun m!436097 () Bool)

(assert (=> b!297275 m!436097))

(declare-fun m!436099 () Bool)

(assert (=> b!297275 m!436099))

(declare-fun m!436101 () Bool)

(assert (=> start!66340 m!436101))

(declare-fun m!436103 () Bool)

(assert (=> start!66340 m!436103))

(push 1)

(assert (not b!297273))

(assert (not b!297275))

(assert (not b!297276))

(assert (not start!66340))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

