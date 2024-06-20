; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65066 () Bool)

(assert start!65066)

(declare-fun b!292050 () Bool)

(declare-fun e!208238 () Bool)

(declare-datatypes ((array!17349 0))(
  ( (array!17350 (arr!8538 (Array (_ BitVec 32) (_ BitVec 8))) (size!7512 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13034 0))(
  ( (BitStream!13035 (buf!7578 array!17349) (currentByte!14021 (_ BitVec 32)) (currentBit!14016 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13034)

(declare-fun array_inv!7124 (array!17349) Bool)

(assert (=> b!292050 (= e!208238 (array_inv!7124 (buf!7578 thiss!1728)))))

(declare-fun b!292049 () Bool)

(declare-fun e!208239 () Bool)

(assert (=> b!292049 (= e!208239 (not true))))

(declare-fun arr!273 () array!17349)

(declare-fun arrayBitRangesEq!0 (array!17349 array!17349 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292049 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7512 arr!273))))))

(declare-datatypes ((Unit!20313 0))(
  ( (Unit!20314) )
))
(declare-fun lt!424464 () Unit!20313)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17349) Unit!20313)

(assert (=> b!292049 (= lt!424464 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun res!241248 () Bool)

(assert (=> start!65066 (=> (not res!241248) (not e!208239))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(assert (=> start!65066 (= res!241248 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7512 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65066 e!208239))

(declare-fun inv!12 (BitStream!13034) Bool)

(assert (=> start!65066 (and (inv!12 thiss!1728) e!208238)))

(assert (=> start!65066 true))

(assert (=> start!65066 (array_inv!7124 arr!273)))

(declare-fun b!292047 () Bool)

(declare-fun res!241249 () Bool)

(assert (=> b!292047 (=> (not res!241249) (not e!208239))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292047 (= res!241249 (validate_offset_bits!1 ((_ sign_extend 32) (size!7512 (buf!7578 thiss!1728))) ((_ sign_extend 32) (currentByte!14021 thiss!1728)) ((_ sign_extend 32) (currentBit!14016 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!292048 () Bool)

(declare-fun res!241250 () Bool)

(assert (=> b!292048 (=> (not res!241250) (not e!208239))))

(assert (=> b!292048 (= res!241250 (bvsge from!505 to!474))))

(assert (= (and start!65066 res!241248) b!292047))

(assert (= (and b!292047 res!241249) b!292048))

(assert (= (and b!292048 res!241250) b!292049))

(assert (= start!65066 b!292050))

(declare-fun m!427477 () Bool)

(assert (=> b!292050 m!427477))

(declare-fun m!427479 () Bool)

(assert (=> b!292049 m!427479))

(declare-fun m!427481 () Bool)

(assert (=> b!292049 m!427481))

(declare-fun m!427483 () Bool)

(assert (=> start!65066 m!427483))

(declare-fun m!427485 () Bool)

(assert (=> start!65066 m!427485))

(declare-fun m!427487 () Bool)

(assert (=> b!292047 m!427487))

(push 1)

(assert (not b!292049))

(assert (not b!292050))

(assert (not start!65066))

(assert (not b!292047))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

