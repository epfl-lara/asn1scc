; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65332 () Bool)

(assert start!65332)

(declare-fun res!242040 () Bool)

(declare-fun e!209221 () Bool)

(assert (=> start!65332 (=> (not res!242040) (not e!209221))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-datatypes ((array!17480 0))(
  ( (array!17481 (arr!8599 (Array (_ BitVec 32) (_ BitVec 8))) (size!7573 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17480)

(assert (=> start!65332 (= res!242040 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7573 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65332 e!209221))

(declare-datatypes ((BitStream!13150 0))(
  ( (BitStream!13151 (buf!7636 array!17480) (currentByte!14100 (_ BitVec 32)) (currentBit!14095 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13150)

(declare-fun e!209220 () Bool)

(declare-fun inv!12 (BitStream!13150) Bool)

(assert (=> start!65332 (and (inv!12 thiss!1728) e!209220)))

(assert (=> start!65332 true))

(declare-fun array_inv!7185 (array!17480) Bool)

(assert (=> start!65332 (array_inv!7185 arr!273)))

(declare-fun b!293085 () Bool)

(declare-fun res!242042 () Bool)

(assert (=> b!293085 (=> (not res!242042) (not e!209221))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!293085 (= res!242042 (validate_offset_bits!1 ((_ sign_extend 32) (size!7573 (buf!7636 thiss!1728))) ((_ sign_extend 32) (currentByte!14100 thiss!1728)) ((_ sign_extend 32) (currentBit!14095 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!293086 () Bool)

(declare-fun res!242041 () Bool)

(assert (=> b!293086 (=> (not res!242041) (not e!209221))))

(assert (=> b!293086 (= res!242041 (bvslt from!505 to!474))))

(declare-fun b!293087 () Bool)

(assert (=> b!293087 (= e!209221 (bvsge (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000))))

(declare-datatypes ((tuple2!22976 0))(
  ( (tuple2!22977 (_1!12793 Bool) (_2!12793 BitStream!13150)) )
))
(declare-fun lt!425178 () tuple2!22976)

(declare-fun readBit!0 (BitStream!13150) tuple2!22976)

(assert (=> b!293087 (= lt!425178 (readBit!0 thiss!1728))))

(declare-fun b!293088 () Bool)

(assert (=> b!293088 (= e!209220 (array_inv!7185 (buf!7636 thiss!1728)))))

(assert (= (and start!65332 res!242040) b!293085))

(assert (= (and b!293085 res!242042) b!293086))

(assert (= (and b!293086 res!242041) b!293087))

(assert (= start!65332 b!293088))

(declare-fun m!428665 () Bool)

(assert (=> start!65332 m!428665))

(declare-fun m!428667 () Bool)

(assert (=> start!65332 m!428667))

(declare-fun m!428669 () Bool)

(assert (=> b!293085 m!428669))

(declare-fun m!428671 () Bool)

(assert (=> b!293087 m!428671))

(declare-fun m!428673 () Bool)

(assert (=> b!293088 m!428673))

(push 1)

(assert (not b!293087))

(assert (not b!293085))

(assert (not start!65332))

(assert (not b!293088))

(check-sat)

(pop 1)

(push 1)

(check-sat)

