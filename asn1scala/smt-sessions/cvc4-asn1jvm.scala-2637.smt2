; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65060 () Bool)

(assert start!65060)

(declare-fun res!241222 () Bool)

(declare-fun e!208200 () Bool)

(assert (=> start!65060 (=> (not res!241222) (not e!208200))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-datatypes ((array!17343 0))(
  ( (array!17344 (arr!8535 (Array (_ BitVec 32) (_ BitVec 8))) (size!7509 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17343)

(assert (=> start!65060 (= res!241222 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7509 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65060 e!208200))

(declare-datatypes ((BitStream!13028 0))(
  ( (BitStream!13029 (buf!7575 array!17343) (currentByte!14018 (_ BitVec 32)) (currentBit!14013 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13028)

(declare-fun e!208201 () Bool)

(declare-fun inv!12 (BitStream!13028) Bool)

(assert (=> start!65060 (and (inv!12 thiss!1728) e!208201)))

(assert (=> start!65060 true))

(declare-fun array_inv!7121 (array!17343) Bool)

(assert (=> start!65060 (array_inv!7121 arr!273)))

(declare-fun b!292014 () Bool)

(assert (=> b!292014 (= e!208201 (array_inv!7121 (buf!7575 thiss!1728)))))

(declare-fun b!292011 () Bool)

(declare-fun res!241223 () Bool)

(assert (=> b!292011 (=> (not res!241223) (not e!208200))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292011 (= res!241223 (validate_offset_bits!1 ((_ sign_extend 32) (size!7509 (buf!7575 thiss!1728))) ((_ sign_extend 32) (currentByte!14018 thiss!1728)) ((_ sign_extend 32) (currentBit!14013 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!292012 () Bool)

(declare-fun res!241221 () Bool)

(assert (=> b!292012 (=> (not res!241221) (not e!208200))))

(assert (=> b!292012 (= res!241221 (bvsge from!505 to!474))))

(declare-fun b!292013 () Bool)

(assert (=> b!292013 (= e!208200 (not true))))

(declare-fun arrayBitRangesEq!0 (array!17343 array!17343 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292013 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7509 arr!273))))))

(declare-datatypes ((Unit!20307 0))(
  ( (Unit!20308) )
))
(declare-fun lt!424455 () Unit!20307)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17343) Unit!20307)

(assert (=> b!292013 (= lt!424455 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(assert (= (and start!65060 res!241222) b!292011))

(assert (= (and b!292011 res!241223) b!292012))

(assert (= (and b!292012 res!241221) b!292013))

(assert (= start!65060 b!292014))

(declare-fun m!427441 () Bool)

(assert (=> start!65060 m!427441))

(declare-fun m!427443 () Bool)

(assert (=> start!65060 m!427443))

(declare-fun m!427445 () Bool)

(assert (=> b!292014 m!427445))

(declare-fun m!427447 () Bool)

(assert (=> b!292011 m!427447))

(declare-fun m!427449 () Bool)

(assert (=> b!292013 m!427449))

(declare-fun m!427451 () Bool)

(assert (=> b!292013 m!427451))

(push 1)

(assert (not b!292013))

(assert (not b!292014))

(assert (not start!65060))

(assert (not b!292011))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

