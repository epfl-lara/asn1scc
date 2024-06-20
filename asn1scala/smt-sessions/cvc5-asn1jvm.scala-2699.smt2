; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66070 () Bool)

(assert start!66070)

(declare-datatypes ((array!17738 0))(
  ( (array!17739 (arr!8746 (Array (_ BitVec 32) (_ BitVec 8))) (size!7687 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13378 0))(
  ( (BitStream!13379 (buf!7750 array!17738) (currentByte!14271 (_ BitVec 32)) (currentBit!14266 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13378)

(declare-fun e!212013 () Bool)

(declare-datatypes ((Unit!20659 0))(
  ( (Unit!20660) )
))
(declare-datatypes ((tuple3!1890 0))(
  ( (tuple3!1891 (_1!13055 Unit!20659) (_2!13055 BitStream!13378) (_3!1395 array!17738)) )
))
(declare-fun lt!431575 () tuple3!1890)

(declare-fun b!296314 () Bool)

(declare-fun arr!273 () array!17738)

(assert (=> b!296314 (= e!212013 (and (= (buf!7750 thiss!1728) (buf!7750 (_2!13055 lt!431575))) (= (size!7687 arr!273) (size!7687 (_3!1395 lt!431575)))))))

(declare-fun b!296315 () Bool)

(declare-fun e!212014 () Bool)

(declare-fun lt!431574 () Bool)

(declare-datatypes ((tuple2!23320 0))(
  ( (tuple2!23321 (_1!13056 Bool) (_2!13056 BitStream!13378)) )
))
(declare-fun lt!431577 () tuple2!23320)

(assert (=> b!296315 (= e!212014 (= lt!431574 (_1!13056 lt!431577)))))

(declare-fun b!296316 () Bool)

(declare-fun e!212011 () Bool)

(assert (=> b!296316 (= e!212011 (not true))))

(assert (=> b!296316 e!212014))

(declare-fun res!244645 () Bool)

(assert (=> b!296316 (=> (not res!244645) (not e!212014))))

(declare-fun lt!431573 () array!17738)

(declare-fun from!505 () (_ BitVec 64))

(declare-fun bitAt!0 (array!17738 (_ BitVec 64)) Bool)

(assert (=> b!296316 (= res!244645 (= (bitAt!0 lt!431573 from!505) lt!431574))))

(assert (=> b!296316 (= lt!431574 (bitAt!0 (_3!1395 lt!431575) from!505))))

(declare-fun lt!431572 () Unit!20659)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17738 array!17738 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20659)

(assert (=> b!296316 (= lt!431572 (arrayBitRangesEqImpliesEq!0 lt!431573 (_3!1395 lt!431575) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun arrayBitRangesEq!0 (array!17738 array!17738 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!296316 (arrayBitRangesEq!0 arr!273 (_3!1395 lt!431575) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!431568 () Unit!20659)

(declare-fun arrayBitRangesEqTransitive!0 (array!17738 array!17738 array!17738 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20659)

(assert (=> b!296316 (= lt!431568 (arrayBitRangesEqTransitive!0 arr!273 lt!431573 (_3!1395 lt!431575) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!296316 (arrayBitRangesEq!0 arr!273 lt!431573 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!431576 () Unit!20659)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17738 (_ BitVec 64) Bool) Unit!20659)

(assert (=> b!296316 (= lt!431576 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!13056 lt!431577)))))

(assert (=> b!296316 e!212013))

(declare-fun res!244644 () Bool)

(assert (=> b!296316 (=> (not res!244644) (not e!212013))))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!296316 (= res!244644 (= (bvsub (bvadd (bitIndex!0 (size!7687 (buf!7750 thiss!1728)) (currentByte!14271 thiss!1728) (currentBit!14266 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7687 (buf!7750 (_2!13055 lt!431575))) (currentByte!14271 (_2!13055 lt!431575)) (currentBit!14266 (_2!13055 lt!431575)))))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun readBitsLoop!0 (BitStream!13378 (_ BitVec 64) array!17738 (_ BitVec 64) (_ BitVec 64)) tuple3!1890)

(assert (=> b!296316 (= lt!431575 (readBitsLoop!0 (_2!13056 lt!431577) nBits!523 lt!431573 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!296316 (validate_offset_bits!1 ((_ sign_extend 32) (size!7687 (buf!7750 (_2!13056 lt!431577)))) ((_ sign_extend 32) (currentByte!14271 (_2!13056 lt!431577))) ((_ sign_extend 32) (currentBit!14266 (_2!13056 lt!431577))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!431569 () Unit!20659)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13378 BitStream!13378 (_ BitVec 64) (_ BitVec 64)) Unit!20659)

(assert (=> b!296316 (= lt!431569 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!13056 lt!431577) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!431571 () (_ BitVec 32))

(declare-fun lt!431570 () (_ BitVec 32))

(assert (=> b!296316 (= lt!431573 (array!17739 (store (arr!8746 arr!273) lt!431570 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8746 arr!273) lt!431570)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!431571)))) ((_ sign_extend 24) (ite (_1!13056 lt!431577) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!431571) #b00000000))))) (size!7687 arr!273)))))

(assert (=> b!296316 (= lt!431571 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!296316 (= lt!431570 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!13378) tuple2!23320)

(assert (=> b!296316 (= lt!431577 (readBit!0 thiss!1728))))

(declare-fun b!296317 () Bool)

(declare-fun e!212012 () Bool)

(declare-fun array_inv!7299 (array!17738) Bool)

(assert (=> b!296317 (= e!212012 (array_inv!7299 (buf!7750 thiss!1728)))))

(declare-fun res!244646 () Bool)

(assert (=> start!66070 (=> (not res!244646) (not e!212011))))

(assert (=> start!66070 (= res!244646 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7687 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!66070 e!212011))

(declare-fun inv!12 (BitStream!13378) Bool)

(assert (=> start!66070 (and (inv!12 thiss!1728) e!212012)))

(assert (=> start!66070 true))

(assert (=> start!66070 (array_inv!7299 arr!273)))

(declare-fun b!296318 () Bool)

(declare-fun res!244643 () Bool)

(assert (=> b!296318 (=> (not res!244643) (not e!212011))))

(assert (=> b!296318 (= res!244643 (bvslt from!505 to!474))))

(declare-fun b!296319 () Bool)

(declare-fun res!244642 () Bool)

(assert (=> b!296319 (=> (not res!244642) (not e!212011))))

(assert (=> b!296319 (= res!244642 (validate_offset_bits!1 ((_ sign_extend 32) (size!7687 (buf!7750 thiss!1728))) ((_ sign_extend 32) (currentByte!14271 thiss!1728)) ((_ sign_extend 32) (currentBit!14266 thiss!1728)) (bvsub nBits!523 from!505)))))

(assert (= (and start!66070 res!244646) b!296319))

(assert (= (and b!296319 res!244642) b!296318))

(assert (= (and b!296318 res!244643) b!296316))

(assert (= (and b!296316 res!244644) b!296314))

(assert (= (and b!296316 res!244645) b!296315))

(assert (= start!66070 b!296317))

(declare-fun m!434365 () Bool)

(assert (=> b!296316 m!434365))

(declare-fun m!434367 () Bool)

(assert (=> b!296316 m!434367))

(declare-fun m!434369 () Bool)

(assert (=> b!296316 m!434369))

(declare-fun m!434371 () Bool)

(assert (=> b!296316 m!434371))

(declare-fun m!434373 () Bool)

(assert (=> b!296316 m!434373))

(declare-fun m!434375 () Bool)

(assert (=> b!296316 m!434375))

(declare-fun m!434377 () Bool)

(assert (=> b!296316 m!434377))

(declare-fun m!434379 () Bool)

(assert (=> b!296316 m!434379))

(declare-fun m!434381 () Bool)

(assert (=> b!296316 m!434381))

(declare-fun m!434383 () Bool)

(assert (=> b!296316 m!434383))

(declare-fun m!434385 () Bool)

(assert (=> b!296316 m!434385))

(declare-fun m!434387 () Bool)

(assert (=> b!296316 m!434387))

(declare-fun m!434389 () Bool)

(assert (=> b!296316 m!434389))

(declare-fun m!434391 () Bool)

(assert (=> b!296316 m!434391))

(declare-fun m!434393 () Bool)

(assert (=> b!296316 m!434393))

(declare-fun m!434395 () Bool)

(assert (=> b!296316 m!434395))

(declare-fun m!434397 () Bool)

(assert (=> b!296317 m!434397))

(declare-fun m!434399 () Bool)

(assert (=> start!66070 m!434399))

(declare-fun m!434401 () Bool)

(assert (=> start!66070 m!434401))

(declare-fun m!434403 () Bool)

(assert (=> b!296319 m!434403))

(push 1)

(assert (not b!296316))

(assert (not b!296317))

(assert (not start!66070))

(assert (not b!296319))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

