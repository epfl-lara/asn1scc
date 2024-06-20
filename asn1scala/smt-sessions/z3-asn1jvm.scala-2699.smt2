; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66072 () Bool)

(assert start!66072)

(declare-datatypes ((array!17740 0))(
  ( (array!17741 (arr!8747 (Array (_ BitVec 32) (_ BitVec 8))) (size!7688 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13380 0))(
  ( (BitStream!13381 (buf!7751 array!17740) (currentByte!14272 (_ BitVec 32)) (currentBit!14267 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13380)

(declare-fun e!212034 () Bool)

(declare-datatypes ((Unit!20661 0))(
  ( (Unit!20662) )
))
(declare-datatypes ((tuple3!1892 0))(
  ( (tuple3!1893 (_1!13057 Unit!20661) (_2!13057 BitStream!13380) (_3!1396 array!17740)) )
))
(declare-fun lt!431605 () tuple3!1892)

(declare-fun arr!273 () array!17740)

(declare-fun b!296332 () Bool)

(assert (=> b!296332 (= e!212034 (and (= (buf!7751 thiss!1728) (buf!7751 (_2!13057 lt!431605))) (= (size!7688 arr!273) (size!7688 (_3!1396 lt!431605)))))))

(declare-fun b!296333 () Bool)

(declare-fun res!244660 () Bool)

(declare-fun e!212030 () Bool)

(assert (=> b!296333 (=> (not res!244660) (not e!212030))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!296333 (= res!244660 (validate_offset_bits!1 ((_ sign_extend 32) (size!7688 (buf!7751 thiss!1728))) ((_ sign_extend 32) (currentByte!14272 thiss!1728)) ((_ sign_extend 32) (currentBit!14267 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!296334 () Bool)

(declare-fun e!212033 () Bool)

(declare-fun array_inv!7300 (array!17740) Bool)

(assert (=> b!296334 (= e!212033 (array_inv!7300 (buf!7751 thiss!1728)))))

(declare-fun b!296335 () Bool)

(declare-fun e!212029 () Bool)

(declare-fun lt!431599 () Bool)

(declare-datatypes ((tuple2!23322 0))(
  ( (tuple2!23323 (_1!13058 Bool) (_2!13058 BitStream!13380)) )
))
(declare-fun lt!431606 () tuple2!23322)

(assert (=> b!296335 (= e!212029 (= lt!431599 (_1!13058 lt!431606)))))

(declare-fun res!244658 () Bool)

(assert (=> start!66072 (=> (not res!244658) (not e!212030))))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> start!66072 (= res!244658 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7688 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!66072 e!212030))

(declare-fun inv!12 (BitStream!13380) Bool)

(assert (=> start!66072 (and (inv!12 thiss!1728) e!212033)))

(assert (=> start!66072 true))

(assert (=> start!66072 (array_inv!7300 arr!273)))

(declare-fun b!296336 () Bool)

(assert (=> b!296336 (= e!212030 (not true))))

(assert (=> b!296336 e!212029))

(declare-fun res!244661 () Bool)

(assert (=> b!296336 (=> (not res!244661) (not e!212029))))

(declare-fun lt!431601 () array!17740)

(declare-fun bitAt!0 (array!17740 (_ BitVec 64)) Bool)

(assert (=> b!296336 (= res!244661 (= (bitAt!0 lt!431601 from!505) lt!431599))))

(assert (=> b!296336 (= lt!431599 (bitAt!0 (_3!1396 lt!431605) from!505))))

(declare-fun lt!431602 () Unit!20661)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17740 array!17740 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20661)

(assert (=> b!296336 (= lt!431602 (arrayBitRangesEqImpliesEq!0 lt!431601 (_3!1396 lt!431605) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun arrayBitRangesEq!0 (array!17740 array!17740 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!296336 (arrayBitRangesEq!0 arr!273 (_3!1396 lt!431605) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!431603 () Unit!20661)

(declare-fun arrayBitRangesEqTransitive!0 (array!17740 array!17740 array!17740 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20661)

(assert (=> b!296336 (= lt!431603 (arrayBitRangesEqTransitive!0 arr!273 lt!431601 (_3!1396 lt!431605) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!296336 (arrayBitRangesEq!0 arr!273 lt!431601 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!431607 () Unit!20661)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17740 (_ BitVec 64) Bool) Unit!20661)

(assert (=> b!296336 (= lt!431607 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!13058 lt!431606)))))

(assert (=> b!296336 e!212034))

(declare-fun res!244657 () Bool)

(assert (=> b!296336 (=> (not res!244657) (not e!212034))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!296336 (= res!244657 (= (bvsub (bvadd (bitIndex!0 (size!7688 (buf!7751 thiss!1728)) (currentByte!14272 thiss!1728) (currentBit!14267 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7688 (buf!7751 (_2!13057 lt!431605))) (currentByte!14272 (_2!13057 lt!431605)) (currentBit!14267 (_2!13057 lt!431605)))))))

(declare-fun readBitsLoop!0 (BitStream!13380 (_ BitVec 64) array!17740 (_ BitVec 64) (_ BitVec 64)) tuple3!1892)

(assert (=> b!296336 (= lt!431605 (readBitsLoop!0 (_2!13058 lt!431606) nBits!523 lt!431601 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!296336 (validate_offset_bits!1 ((_ sign_extend 32) (size!7688 (buf!7751 (_2!13058 lt!431606)))) ((_ sign_extend 32) (currentByte!14272 (_2!13058 lt!431606))) ((_ sign_extend 32) (currentBit!14267 (_2!13058 lt!431606))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!431598 () Unit!20661)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13380 BitStream!13380 (_ BitVec 64) (_ BitVec 64)) Unit!20661)

(assert (=> b!296336 (= lt!431598 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!13058 lt!431606) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!431604 () (_ BitVec 32))

(declare-fun lt!431600 () (_ BitVec 32))

(assert (=> b!296336 (= lt!431601 (array!17741 (store (arr!8747 arr!273) lt!431600 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8747 arr!273) lt!431600)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!431604)))) ((_ sign_extend 24) (ite (_1!13058 lt!431606) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!431604) #b00000000))))) (size!7688 arr!273)))))

(assert (=> b!296336 (= lt!431604 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!296336 (= lt!431600 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!13380) tuple2!23322)

(assert (=> b!296336 (= lt!431606 (readBit!0 thiss!1728))))

(declare-fun b!296337 () Bool)

(declare-fun res!244659 () Bool)

(assert (=> b!296337 (=> (not res!244659) (not e!212030))))

(assert (=> b!296337 (= res!244659 (bvslt from!505 to!474))))

(assert (= (and start!66072 res!244658) b!296333))

(assert (= (and b!296333 res!244660) b!296337))

(assert (= (and b!296337 res!244659) b!296336))

(assert (= (and b!296336 res!244657) b!296332))

(assert (= (and b!296336 res!244661) b!296335))

(assert (= start!66072 b!296334))

(declare-fun m!434405 () Bool)

(assert (=> b!296333 m!434405))

(declare-fun m!434407 () Bool)

(assert (=> b!296334 m!434407))

(declare-fun m!434409 () Bool)

(assert (=> start!66072 m!434409))

(declare-fun m!434411 () Bool)

(assert (=> start!66072 m!434411))

(declare-fun m!434413 () Bool)

(assert (=> b!296336 m!434413))

(declare-fun m!434415 () Bool)

(assert (=> b!296336 m!434415))

(declare-fun m!434417 () Bool)

(assert (=> b!296336 m!434417))

(declare-fun m!434419 () Bool)

(assert (=> b!296336 m!434419))

(declare-fun m!434421 () Bool)

(assert (=> b!296336 m!434421))

(declare-fun m!434423 () Bool)

(assert (=> b!296336 m!434423))

(declare-fun m!434425 () Bool)

(assert (=> b!296336 m!434425))

(declare-fun m!434427 () Bool)

(assert (=> b!296336 m!434427))

(declare-fun m!434429 () Bool)

(assert (=> b!296336 m!434429))

(declare-fun m!434431 () Bool)

(assert (=> b!296336 m!434431))

(declare-fun m!434433 () Bool)

(assert (=> b!296336 m!434433))

(declare-fun m!434435 () Bool)

(assert (=> b!296336 m!434435))

(declare-fun m!434437 () Bool)

(assert (=> b!296336 m!434437))

(declare-fun m!434439 () Bool)

(assert (=> b!296336 m!434439))

(declare-fun m!434441 () Bool)

(assert (=> b!296336 m!434441))

(declare-fun m!434443 () Bool)

(assert (=> b!296336 m!434443))

(check-sat (not b!296334) (not b!296336) (not start!66072) (not b!296333))
