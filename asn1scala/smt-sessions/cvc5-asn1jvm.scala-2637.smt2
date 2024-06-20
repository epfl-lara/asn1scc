; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65056 () Bool)

(assert start!65056)

(declare-fun b!291990 () Bool)

(declare-fun e!208177 () Bool)

(declare-datatypes ((array!17339 0))(
  ( (array!17340 (arr!8533 (Array (_ BitVec 32) (_ BitVec 8))) (size!7507 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13024 0))(
  ( (BitStream!13025 (buf!7573 array!17339) (currentByte!14016 (_ BitVec 32)) (currentBit!14011 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13024)

(declare-fun array_inv!7119 (array!17339) Bool)

(assert (=> b!291990 (= e!208177 (array_inv!7119 (buf!7573 thiss!1728)))))

(declare-fun b!291988 () Bool)

(declare-fun res!241204 () Bool)

(declare-fun e!208179 () Bool)

(assert (=> b!291988 (=> (not res!241204) (not e!208179))))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!291988 (= res!241204 (bvsge from!505 to!474))))

(declare-fun b!291987 () Bool)

(declare-fun res!241205 () Bool)

(assert (=> b!291987 (=> (not res!241205) (not e!208179))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!291987 (= res!241205 (validate_offset_bits!1 ((_ sign_extend 32) (size!7507 (buf!7573 thiss!1728))) ((_ sign_extend 32) (currentByte!14016 thiss!1728)) ((_ sign_extend 32) (currentBit!14011 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun res!241203 () Bool)

(assert (=> start!65056 (=> (not res!241203) (not e!208179))))

(declare-fun arr!273 () array!17339)

(assert (=> start!65056 (= res!241203 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7507 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65056 e!208179))

(declare-fun inv!12 (BitStream!13024) Bool)

(assert (=> start!65056 (and (inv!12 thiss!1728) e!208177)))

(assert (=> start!65056 true))

(assert (=> start!65056 (array_inv!7119 arr!273)))

(declare-fun b!291989 () Bool)

(assert (=> b!291989 (= e!208179 (not true))))

(declare-fun arrayBitRangesEq!0 (array!17339 array!17339 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!291989 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7507 arr!273))))))

(declare-datatypes ((Unit!20303 0))(
  ( (Unit!20304) )
))
(declare-fun lt!424449 () Unit!20303)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17339) Unit!20303)

(assert (=> b!291989 (= lt!424449 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(assert (= (and start!65056 res!241203) b!291987))

(assert (= (and b!291987 res!241205) b!291988))

(assert (= (and b!291988 res!241204) b!291989))

(assert (= start!65056 b!291990))

(declare-fun m!427417 () Bool)

(assert (=> b!291990 m!427417))

(declare-fun m!427419 () Bool)

(assert (=> b!291987 m!427419))

(declare-fun m!427421 () Bool)

(assert (=> start!65056 m!427421))

(declare-fun m!427423 () Bool)

(assert (=> start!65056 m!427423))

(declare-fun m!427425 () Bool)

(assert (=> b!291989 m!427425))

(declare-fun m!427427 () Bool)

(assert (=> b!291989 m!427427))

(push 1)

(assert (not b!291990))

(assert (not start!65056))

(assert (not b!291987))

(assert (not b!291989))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

