; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65726 () Bool)

(assert start!65726)

(declare-fun b!294806 () Bool)

(declare-fun res!243425 () Bool)

(declare-fun e!210765 () Bool)

(assert (=> b!294806 (=> (not res!243425) (not e!210765))))

(declare-datatypes ((array!17658 0))(
  ( (array!17659 (arr!8691 (Array (_ BitVec 32) (_ BitVec 8))) (size!7653 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13310 0))(
  ( (BitStream!13311 (buf!7716 array!17658) (currentByte!14213 (_ BitVec 32)) (currentBit!14208 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13310)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!294806 (= res!243425 (validate_offset_bits!1 ((_ sign_extend 32) (size!7653 (buf!7716 thiss!1728))) ((_ sign_extend 32) (currentByte!14213 thiss!1728)) ((_ sign_extend 32) (currentBit!14208 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!294807 () Bool)

(declare-fun e!210764 () Bool)

(declare-fun array_inv!7265 (array!17658) Bool)

(assert (=> b!294807 (= e!210764 (array_inv!7265 (buf!7716 thiss!1728)))))

(declare-fun b!294808 () Bool)

(declare-fun res!243423 () Bool)

(assert (=> b!294808 (=> (not res!243423) (not e!210765))))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!294808 (= res!243423 (bvslt from!505 to!474))))

(declare-fun b!294809 () Bool)

(declare-datatypes ((Unit!20543 0))(
  ( (Unit!20544) )
))
(declare-datatypes ((tuple3!1822 0))(
  ( (tuple3!1823 (_1!12945 Unit!20543) (_2!12945 BitStream!13310) (_3!1349 array!17658)) )
))
(declare-fun lt!428333 () tuple3!1822)

(declare-fun e!210768 () Bool)

(declare-fun arr!273 () array!17658)

(assert (=> b!294809 (= e!210768 (and (= (buf!7716 thiss!1728) (buf!7716 (_2!12945 lt!428333))) (= (size!7653 arr!273) (size!7653 (_3!1349 lt!428333)))))))

(declare-fun res!243422 () Bool)

(assert (=> start!65726 (=> (not res!243422) (not e!210765))))

(assert (=> start!65726 (= res!243422 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7653 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65726 e!210765))

(declare-fun inv!12 (BitStream!13310) Bool)

(assert (=> start!65726 (and (inv!12 thiss!1728) e!210764)))

(assert (=> start!65726 true))

(assert (=> start!65726 (array_inv!7265 arr!273)))

(declare-fun b!294810 () Bool)

(assert (=> b!294810 (= e!210765 (not true))))

(declare-fun arrayBitRangesEq!0 (array!17658 array!17658 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!294810 (arrayBitRangesEq!0 arr!273 (_3!1349 lt!428333) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!428327 () array!17658)

(declare-fun lt!428332 () Unit!20543)

(declare-fun arrayBitRangesEqTransitive!0 (array!17658 array!17658 array!17658 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20543)

(assert (=> b!294810 (= lt!428332 (arrayBitRangesEqTransitive!0 arr!273 lt!428327 (_3!1349 lt!428333) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!294810 (arrayBitRangesEq!0 arr!273 lt!428327 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!428329 () Unit!20543)

(declare-datatypes ((tuple2!23192 0))(
  ( (tuple2!23193 (_1!12946 Bool) (_2!12946 BitStream!13310)) )
))
(declare-fun lt!428331 () tuple2!23192)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17658 (_ BitVec 64) Bool) Unit!20543)

(assert (=> b!294810 (= lt!428329 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12946 lt!428331)))))

(assert (=> b!294810 e!210768))

(declare-fun res!243424 () Bool)

(assert (=> b!294810 (=> (not res!243424) (not e!210768))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!294810 (= res!243424 (= (bvsub (bvadd (bitIndex!0 (size!7653 (buf!7716 thiss!1728)) (currentByte!14213 thiss!1728) (currentBit!14208 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7653 (buf!7716 (_2!12945 lt!428333))) (currentByte!14213 (_2!12945 lt!428333)) (currentBit!14208 (_2!12945 lt!428333)))))))

(declare-fun readBitsLoop!0 (BitStream!13310 (_ BitVec 64) array!17658 (_ BitVec 64) (_ BitVec 64)) tuple3!1822)

(assert (=> b!294810 (= lt!428333 (readBitsLoop!0 (_2!12946 lt!428331) nBits!523 lt!428327 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!294810 (validate_offset_bits!1 ((_ sign_extend 32) (size!7653 (buf!7716 (_2!12946 lt!428331)))) ((_ sign_extend 32) (currentByte!14213 (_2!12946 lt!428331))) ((_ sign_extend 32) (currentBit!14208 (_2!12946 lt!428331))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!428328 () Unit!20543)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13310 BitStream!13310 (_ BitVec 64) (_ BitVec 64)) Unit!20543)

(assert (=> b!294810 (= lt!428328 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12946 lt!428331) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!428334 () (_ BitVec 32))

(declare-fun lt!428330 () (_ BitVec 32))

(assert (=> b!294810 (= lt!428327 (array!17659 (store (arr!8691 arr!273) lt!428330 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8691 arr!273) lt!428330)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!428334)))) ((_ sign_extend 24) (ite (_1!12946 lt!428331) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!428334) #b00000000))))) (size!7653 arr!273)))))

(assert (=> b!294810 (= lt!428334 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!294810 (= lt!428330 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!13310) tuple2!23192)

(assert (=> b!294810 (= lt!428331 (readBit!0 thiss!1728))))

(assert (= (and start!65726 res!243422) b!294806))

(assert (= (and b!294806 res!243425) b!294808))

(assert (= (and b!294808 res!243423) b!294810))

(assert (= (and b!294810 res!243424) b!294809))

(assert (= start!65726 b!294807))

(declare-fun m!431451 () Bool)

(assert (=> b!294806 m!431451))

(declare-fun m!431453 () Bool)

(assert (=> b!294807 m!431453))

(declare-fun m!431455 () Bool)

(assert (=> start!65726 m!431455))

(declare-fun m!431457 () Bool)

(assert (=> start!65726 m!431457))

(declare-fun m!431459 () Bool)

(assert (=> b!294810 m!431459))

(declare-fun m!431461 () Bool)

(assert (=> b!294810 m!431461))

(declare-fun m!431463 () Bool)

(assert (=> b!294810 m!431463))

(declare-fun m!431465 () Bool)

(assert (=> b!294810 m!431465))

(declare-fun m!431467 () Bool)

(assert (=> b!294810 m!431467))

(declare-fun m!431469 () Bool)

(assert (=> b!294810 m!431469))

(declare-fun m!431471 () Bool)

(assert (=> b!294810 m!431471))

(declare-fun m!431473 () Bool)

(assert (=> b!294810 m!431473))

(declare-fun m!431475 () Bool)

(assert (=> b!294810 m!431475))

(declare-fun m!431477 () Bool)

(assert (=> b!294810 m!431477))

(declare-fun m!431479 () Bool)

(assert (=> b!294810 m!431479))

(declare-fun m!431481 () Bool)

(assert (=> b!294810 m!431481))

(declare-fun m!431483 () Bool)

(assert (=> b!294810 m!431483))

(push 1)

(assert (not start!65726))

(assert (not b!294807))

(assert (not b!294806))

(assert (not b!294810))

(check-sat)

(pop 1)

