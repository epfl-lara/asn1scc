; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65044 () Bool)

(assert start!65044)

(declare-fun b!291916 () Bool)

(declare-fun res!241151 () Bool)

(declare-fun e!208107 () Bool)

(assert (=> b!291916 (=> (not res!241151) (not e!208107))))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!291916 (= res!241151 (bvsge from!505 to!474))))

(declare-fun b!291917 () Bool)

(assert (=> b!291917 (= e!208107 (not true))))

(declare-datatypes ((array!17327 0))(
  ( (array!17328 (arr!8527 (Array (_ BitVec 32) (_ BitVec 8))) (size!7501 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17327)

(declare-fun arrayBitRangesEq!0 (array!17327 array!17327 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!291917 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7501 arr!273))))))

(declare-datatypes ((Unit!20291 0))(
  ( (Unit!20292) )
))
(declare-fun lt!424431 () Unit!20291)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17327) Unit!20291)

(assert (=> b!291917 (= lt!424431 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun b!291918 () Bool)

(declare-fun e!208106 () Bool)

(declare-datatypes ((BitStream!13012 0))(
  ( (BitStream!13013 (buf!7567 array!17327) (currentByte!14010 (_ BitVec 32)) (currentBit!14005 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13012)

(declare-fun array_inv!7113 (array!17327) Bool)

(assert (=> b!291918 (= e!208106 (array_inv!7113 (buf!7567 thiss!1728)))))

(declare-fun b!291915 () Bool)

(declare-fun res!241149 () Bool)

(assert (=> b!291915 (=> (not res!241149) (not e!208107))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!291915 (= res!241149 (validate_offset_bits!1 ((_ sign_extend 32) (size!7501 (buf!7567 thiss!1728))) ((_ sign_extend 32) (currentByte!14010 thiss!1728)) ((_ sign_extend 32) (currentBit!14005 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun res!241150 () Bool)

(assert (=> start!65044 (=> (not res!241150) (not e!208107))))

(assert (=> start!65044 (= res!241150 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7501 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65044 e!208107))

(declare-fun inv!12 (BitStream!13012) Bool)

(assert (=> start!65044 (and (inv!12 thiss!1728) e!208106)))

(assert (=> start!65044 true))

(assert (=> start!65044 (array_inv!7113 arr!273)))

(assert (= (and start!65044 res!241150) b!291915))

(assert (= (and b!291915 res!241149) b!291916))

(assert (= (and b!291916 res!241151) b!291917))

(assert (= start!65044 b!291918))

(declare-fun m!427345 () Bool)

(assert (=> b!291917 m!427345))

(declare-fun m!427347 () Bool)

(assert (=> b!291917 m!427347))

(declare-fun m!427349 () Bool)

(assert (=> b!291918 m!427349))

(declare-fun m!427351 () Bool)

(assert (=> b!291915 m!427351))

(declare-fun m!427353 () Bool)

(assert (=> start!65044 m!427353))

(declare-fun m!427355 () Bool)

(assert (=> start!65044 m!427355))

(push 1)

(assert (not b!291917))

(assert (not b!291918))

(assert (not start!65044))

(assert (not b!291915))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

