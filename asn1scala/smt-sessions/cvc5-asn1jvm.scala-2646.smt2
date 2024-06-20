; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65194 () Bool)

(assert start!65194)

(declare-fun b!292498 () Bool)

(declare-fun res!241585 () Bool)

(declare-fun e!208662 () Bool)

(assert (=> b!292498 (=> (not res!241585) (not e!208662))))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!292498 (= res!241585 (bvsge from!505 to!474))))

(declare-fun res!241586 () Bool)

(assert (=> start!65194 (=> (not res!241586) (not e!208662))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-datatypes ((array!17399 0))(
  ( (array!17400 (arr!8560 (Array (_ BitVec 32) (_ BitVec 8))) (size!7534 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17399)

(assert (=> start!65194 (= res!241586 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7534 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65194 e!208662))

(declare-datatypes ((BitStream!13078 0))(
  ( (BitStream!13079 (buf!7600 array!17399) (currentByte!14055 (_ BitVec 32)) (currentBit!14050 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13078)

(declare-fun e!208663 () Bool)

(declare-fun inv!12 (BitStream!13078) Bool)

(assert (=> start!65194 (and (inv!12 thiss!1728) e!208663)))

(assert (=> start!65194 true))

(declare-fun array_inv!7146 (array!17399) Bool)

(assert (=> start!65194 (array_inv!7146 arr!273)))

(declare-fun b!292497 () Bool)

(declare-fun res!241584 () Bool)

(assert (=> b!292497 (=> (not res!241584) (not e!208662))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292497 (= res!241584 (validate_offset_bits!1 ((_ sign_extend 32) (size!7534 (buf!7600 thiss!1728))) ((_ sign_extend 32) (currentByte!14055 thiss!1728)) ((_ sign_extend 32) (currentBit!14050 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!292500 () Bool)

(assert (=> b!292500 (= e!208663 (array_inv!7146 (buf!7600 thiss!1728)))))

(declare-fun b!292499 () Bool)

(assert (=> b!292499 (= e!208662 (not true))))

(declare-fun lt!424808 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!292499 (= lt!424808 (bitIndex!0 (size!7534 (buf!7600 thiss!1728)) (currentByte!14055 thiss!1728) (currentBit!14050 thiss!1728)))))

(declare-fun arrayBitRangesEq!0 (array!17399 array!17399 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292499 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!424807 () (_ BitVec 64))

(declare-datatypes ((Unit!20357 0))(
  ( (Unit!20358) )
))
(declare-fun lt!424806 () Unit!20357)

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17399 array!17399 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20357)

(assert (=> b!292499 (= lt!424806 (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424807 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> b!292499 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424807)))

(assert (=> b!292499 (= lt!424807 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7534 arr!273))))))

(declare-fun lt!424809 () Unit!20357)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17399) Unit!20357)

(assert (=> b!292499 (= lt!424809 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(assert (= (and start!65194 res!241586) b!292497))

(assert (= (and b!292497 res!241584) b!292498))

(assert (= (and b!292498 res!241585) b!292499))

(assert (= start!65194 b!292500))

(declare-fun m!428041 () Bool)

(assert (=> start!65194 m!428041))

(declare-fun m!428043 () Bool)

(assert (=> start!65194 m!428043))

(declare-fun m!428045 () Bool)

(assert (=> b!292497 m!428045))

(declare-fun m!428047 () Bool)

(assert (=> b!292500 m!428047))

(declare-fun m!428049 () Bool)

(assert (=> b!292499 m!428049))

(declare-fun m!428051 () Bool)

(assert (=> b!292499 m!428051))

(declare-fun m!428053 () Bool)

(assert (=> b!292499 m!428053))

(declare-fun m!428055 () Bool)

(assert (=> b!292499 m!428055))

(declare-fun m!428057 () Bool)

(assert (=> b!292499 m!428057))

(push 1)

(assert (not start!65194))

(assert (not b!292497))

(assert (not b!292499))

(assert (not b!292500))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

