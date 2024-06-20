; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65050 () Bool)

(assert start!65050)

(declare-fun res!241176 () Bool)

(declare-fun e!208143 () Bool)

(assert (=> start!65050 (=> (not res!241176) (not e!208143))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-datatypes ((array!17333 0))(
  ( (array!17334 (arr!8530 (Array (_ BitVec 32) (_ BitVec 8))) (size!7504 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17333)

(assert (=> start!65050 (= res!241176 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7504 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65050 e!208143))

(declare-datatypes ((BitStream!13018 0))(
  ( (BitStream!13019 (buf!7570 array!17333) (currentByte!14013 (_ BitVec 32)) (currentBit!14008 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13018)

(declare-fun e!208141 () Bool)

(declare-fun inv!12 (BitStream!13018) Bool)

(assert (=> start!65050 (and (inv!12 thiss!1728) e!208141)))

(assert (=> start!65050 true))

(declare-fun array_inv!7116 (array!17333) Bool)

(assert (=> start!65050 (array_inv!7116 arr!273)))

(declare-fun b!291952 () Bool)

(declare-fun res!241177 () Bool)

(assert (=> b!291952 (=> (not res!241177) (not e!208143))))

(assert (=> b!291952 (= res!241177 (bvsge from!505 to!474))))

(declare-fun b!291954 () Bool)

(assert (=> b!291954 (= e!208141 (array_inv!7116 (buf!7570 thiss!1728)))))

(declare-fun b!291953 () Bool)

(assert (=> b!291953 (= e!208143 (not true))))

(declare-fun arrayBitRangesEq!0 (array!17333 array!17333 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!291953 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7504 arr!273))))))

(declare-datatypes ((Unit!20297 0))(
  ( (Unit!20298) )
))
(declare-fun lt!424440 () Unit!20297)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17333) Unit!20297)

(assert (=> b!291953 (= lt!424440 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun b!291951 () Bool)

(declare-fun res!241178 () Bool)

(assert (=> b!291951 (=> (not res!241178) (not e!208143))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!291951 (= res!241178 (validate_offset_bits!1 ((_ sign_extend 32) (size!7504 (buf!7570 thiss!1728))) ((_ sign_extend 32) (currentByte!14013 thiss!1728)) ((_ sign_extend 32) (currentBit!14008 thiss!1728)) (bvsub nBits!523 from!505)))))

(assert (= (and start!65050 res!241176) b!291951))

(assert (= (and b!291951 res!241178) b!291952))

(assert (= (and b!291952 res!241177) b!291953))

(assert (= start!65050 b!291954))

(declare-fun m!427381 () Bool)

(assert (=> start!65050 m!427381))

(declare-fun m!427383 () Bool)

(assert (=> start!65050 m!427383))

(declare-fun m!427385 () Bool)

(assert (=> b!291954 m!427385))

(declare-fun m!427387 () Bool)

(assert (=> b!291953 m!427387))

(declare-fun m!427389 () Bool)

(assert (=> b!291953 m!427389))

(declare-fun m!427391 () Bool)

(assert (=> b!291951 m!427391))

(push 1)

(assert (not b!291953))

(assert (not b!291954))

(assert (not start!65050))

(assert (not b!291951))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

