; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65072 () Bool)

(assert start!65072)

(declare-fun b!292086 () Bool)

(declare-fun e!208272 () Bool)

(declare-datatypes ((array!17355 0))(
  ( (array!17356 (arr!8541 (Array (_ BitVec 32) (_ BitVec 8))) (size!7515 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13040 0))(
  ( (BitStream!13041 (buf!7581 array!17355) (currentByte!14024 (_ BitVec 32)) (currentBit!14019 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13040)

(declare-fun array_inv!7127 (array!17355) Bool)

(assert (=> b!292086 (= e!208272 (array_inv!7127 (buf!7581 thiss!1728)))))

(declare-fun b!292084 () Bool)

(declare-fun res!241275 () Bool)

(declare-fun e!208274 () Bool)

(assert (=> b!292084 (=> (not res!241275) (not e!208274))))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!292084 (= res!241275 (bvsge from!505 to!474))))

(declare-fun res!241277 () Bool)

(assert (=> start!65072 (=> (not res!241277) (not e!208274))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun arr!273 () array!17355)

(assert (=> start!65072 (= res!241277 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7515 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65072 e!208274))

(declare-fun inv!12 (BitStream!13040) Bool)

(assert (=> start!65072 (and (inv!12 thiss!1728) e!208272)))

(assert (=> start!65072 true))

(assert (=> start!65072 (array_inv!7127 arr!273)))

(declare-fun b!292085 () Bool)

(assert (=> b!292085 (= e!208274 (not true))))

(declare-fun arrayBitRangesEq!0 (array!17355 array!17355 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292085 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7515 arr!273))))))

(declare-datatypes ((Unit!20319 0))(
  ( (Unit!20320) )
))
(declare-fun lt!424473 () Unit!20319)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17355) Unit!20319)

(assert (=> b!292085 (= lt!424473 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun b!292083 () Bool)

(declare-fun res!241276 () Bool)

(assert (=> b!292083 (=> (not res!241276) (not e!208274))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292083 (= res!241276 (validate_offset_bits!1 ((_ sign_extend 32) (size!7515 (buf!7581 thiss!1728))) ((_ sign_extend 32) (currentByte!14024 thiss!1728)) ((_ sign_extend 32) (currentBit!14019 thiss!1728)) (bvsub nBits!523 from!505)))))

(assert (= (and start!65072 res!241277) b!292083))

(assert (= (and b!292083 res!241276) b!292084))

(assert (= (and b!292084 res!241275) b!292085))

(assert (= start!65072 b!292086))

(declare-fun m!427513 () Bool)

(assert (=> b!292086 m!427513))

(declare-fun m!427515 () Bool)

(assert (=> start!65072 m!427515))

(declare-fun m!427517 () Bool)

(assert (=> start!65072 m!427517))

(declare-fun m!427519 () Bool)

(assert (=> b!292085 m!427519))

(declare-fun m!427521 () Bool)

(assert (=> b!292085 m!427521))

(declare-fun m!427523 () Bool)

(assert (=> b!292083 m!427523))

(push 1)

(assert (not b!292085))

(assert (not b!292086))

(assert (not start!65072))

(assert (not b!292083))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

