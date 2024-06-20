; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65038 () Bool)

(assert start!65038)

(declare-fun b!291879 () Bool)

(declare-fun res!241124 () Bool)

(declare-fun e!208071 () Bool)

(assert (=> b!291879 (=> (not res!241124) (not e!208071))))

(declare-datatypes ((array!17321 0))(
  ( (array!17322 (arr!8524 (Array (_ BitVec 32) (_ BitVec 8))) (size!7498 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13006 0))(
  ( (BitStream!13007 (buf!7564 array!17321) (currentByte!14007 (_ BitVec 32)) (currentBit!14002 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13006)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!291879 (= res!241124 (validate_offset_bits!1 ((_ sign_extend 32) (size!7498 (buf!7564 thiss!1728))) ((_ sign_extend 32) (currentByte!14007 thiss!1728)) ((_ sign_extend 32) (currentBit!14002 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!291881 () Bool)

(assert (=> b!291881 (= e!208071 (not true))))

(declare-fun arr!273 () array!17321)

(declare-fun arrayBitRangesEq!0 (array!17321 array!17321 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!291881 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7498 arr!273))))))

(declare-datatypes ((Unit!20285 0))(
  ( (Unit!20286) )
))
(declare-fun lt!424422 () Unit!20285)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17321) Unit!20285)

(assert (=> b!291881 (= lt!424422 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun b!291880 () Bool)

(declare-fun res!241122 () Bool)

(assert (=> b!291880 (=> (not res!241122) (not e!208071))))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!291880 (= res!241122 (bvsge from!505 to!474))))

(declare-fun res!241123 () Bool)

(assert (=> start!65038 (=> (not res!241123) (not e!208071))))

(assert (=> start!65038 (= res!241123 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7498 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65038 e!208071))

(declare-fun e!208069 () Bool)

(declare-fun inv!12 (BitStream!13006) Bool)

(assert (=> start!65038 (and (inv!12 thiss!1728) e!208069)))

(assert (=> start!65038 true))

(declare-fun array_inv!7110 (array!17321) Bool)

(assert (=> start!65038 (array_inv!7110 arr!273)))

(declare-fun b!291882 () Bool)

(assert (=> b!291882 (= e!208069 (array_inv!7110 (buf!7564 thiss!1728)))))

(assert (= (and start!65038 res!241123) b!291879))

(assert (= (and b!291879 res!241124) b!291880))

(assert (= (and b!291880 res!241122) b!291881))

(assert (= start!65038 b!291882))

(declare-fun m!427309 () Bool)

(assert (=> b!291879 m!427309))

(declare-fun m!427311 () Bool)

(assert (=> b!291881 m!427311))

(declare-fun m!427313 () Bool)

(assert (=> b!291881 m!427313))

(declare-fun m!427315 () Bool)

(assert (=> start!65038 m!427315))

(declare-fun m!427317 () Bool)

(assert (=> start!65038 m!427317))

(declare-fun m!427319 () Bool)

(assert (=> b!291882 m!427319))

(push 1)

(assert (not b!291881))

(assert (not b!291882))

(assert (not start!65038))

(assert (not b!291879))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

