; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65042 () Bool)

(assert start!65042)

(declare-fun b!291905 () Bool)

(declare-fun e!208095 () Bool)

(assert (=> b!291905 (= e!208095 (not true))))

(declare-datatypes ((array!17325 0))(
  ( (array!17326 (arr!8526 (Array (_ BitVec 32) (_ BitVec 8))) (size!7500 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17325)

(declare-fun arrayBitRangesEq!0 (array!17325 array!17325 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!291905 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7500 arr!273))))))

(declare-datatypes ((Unit!20289 0))(
  ( (Unit!20290) )
))
(declare-fun lt!424428 () Unit!20289)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17325) Unit!20289)

(assert (=> b!291905 (= lt!424428 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun b!291904 () Bool)

(declare-fun res!241140 () Bool)

(assert (=> b!291904 (=> (not res!241140) (not e!208095))))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!291904 (= res!241140 (bvsge from!505 to!474))))

(declare-fun res!241142 () Bool)

(assert (=> start!65042 (=> (not res!241142) (not e!208095))))

(declare-fun nBits!523 () (_ BitVec 64))

(assert (=> start!65042 (= res!241142 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7500 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65042 e!208095))

(declare-datatypes ((BitStream!13010 0))(
  ( (BitStream!13011 (buf!7566 array!17325) (currentByte!14009 (_ BitVec 32)) (currentBit!14004 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13010)

(declare-fun e!208093 () Bool)

(declare-fun inv!12 (BitStream!13010) Bool)

(assert (=> start!65042 (and (inv!12 thiss!1728) e!208093)))

(assert (=> start!65042 true))

(declare-fun array_inv!7112 (array!17325) Bool)

(assert (=> start!65042 (array_inv!7112 arr!273)))

(declare-fun b!291906 () Bool)

(assert (=> b!291906 (= e!208093 (array_inv!7112 (buf!7566 thiss!1728)))))

(declare-fun b!291903 () Bool)

(declare-fun res!241141 () Bool)

(assert (=> b!291903 (=> (not res!241141) (not e!208095))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!291903 (= res!241141 (validate_offset_bits!1 ((_ sign_extend 32) (size!7500 (buf!7566 thiss!1728))) ((_ sign_extend 32) (currentByte!14009 thiss!1728)) ((_ sign_extend 32) (currentBit!14004 thiss!1728)) (bvsub nBits!523 from!505)))))

(assert (= (and start!65042 res!241142) b!291903))

(assert (= (and b!291903 res!241141) b!291904))

(assert (= (and b!291904 res!241140) b!291905))

(assert (= start!65042 b!291906))

(declare-fun m!427333 () Bool)

(assert (=> b!291905 m!427333))

(declare-fun m!427335 () Bool)

(assert (=> b!291905 m!427335))

(declare-fun m!427337 () Bool)

(assert (=> start!65042 m!427337))

(declare-fun m!427339 () Bool)

(assert (=> start!65042 m!427339))

(declare-fun m!427341 () Bool)

(assert (=> b!291906 m!427341))

(declare-fun m!427343 () Bool)

(assert (=> b!291903 m!427343))

(push 1)

(assert (not b!291903))

(assert (not b!291905))

(assert (not b!291906))

(assert (not start!65042))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

