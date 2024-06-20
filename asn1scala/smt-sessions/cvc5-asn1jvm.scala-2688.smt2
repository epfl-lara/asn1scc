; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65728 () Bool)

(assert start!65728)

(declare-fun b!294821 () Bool)

(declare-fun e!210781 () Bool)

(declare-fun from!505 () (_ BitVec 64))

(declare-datatypes ((array!17660 0))(
  ( (array!17661 (arr!8692 (Array (_ BitVec 32) (_ BitVec 8))) (size!7654 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17660)

(assert (=> b!294821 (= e!210781 (not (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bvsle (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7654 arr!273)))))))))

(declare-datatypes ((BitStream!13312 0))(
  ( (BitStream!13313 (buf!7717 array!17660) (currentByte!14214 (_ BitVec 32)) (currentBit!14209 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!20545 0))(
  ( (Unit!20546) )
))
(declare-datatypes ((tuple3!1824 0))(
  ( (tuple3!1825 (_1!12947 Unit!20545) (_2!12947 BitStream!13312) (_3!1350 array!17660)) )
))
(declare-fun lt!428355 () tuple3!1824)

(declare-fun arrayBitRangesEq!0 (array!17660 array!17660 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!294821 (arrayBitRangesEq!0 arr!273 (_3!1350 lt!428355) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!428351 () Unit!20545)

(declare-fun lt!428352 () array!17660)

(declare-fun arrayBitRangesEqTransitive!0 (array!17660 array!17660 array!17660 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20545)

(assert (=> b!294821 (= lt!428351 (arrayBitRangesEqTransitive!0 arr!273 lt!428352 (_3!1350 lt!428355) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!294821 (arrayBitRangesEq!0 arr!273 lt!428352 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!428356 () Unit!20545)

(declare-datatypes ((tuple2!23194 0))(
  ( (tuple2!23195 (_1!12948 Bool) (_2!12948 BitStream!13312)) )
))
(declare-fun lt!428358 () tuple2!23194)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17660 (_ BitVec 64) Bool) Unit!20545)

(assert (=> b!294821 (= lt!428356 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12948 lt!428358)))))

(declare-fun e!210779 () Bool)

(assert (=> b!294821 e!210779))

(declare-fun res!243434 () Bool)

(assert (=> b!294821 (=> (not res!243434) (not e!210779))))

(declare-fun thiss!1728 () BitStream!13312)

(declare-fun to!474 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!294821 (= res!243434 (= (bvsub (bvadd (bitIndex!0 (size!7654 (buf!7717 thiss!1728)) (currentByte!14214 thiss!1728) (currentBit!14209 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7654 (buf!7717 (_2!12947 lt!428355))) (currentByte!14214 (_2!12947 lt!428355)) (currentBit!14209 (_2!12947 lt!428355)))))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun readBitsLoop!0 (BitStream!13312 (_ BitVec 64) array!17660 (_ BitVec 64) (_ BitVec 64)) tuple3!1824)

(assert (=> b!294821 (= lt!428355 (readBitsLoop!0 (_2!12948 lt!428358) nBits!523 lt!428352 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!294821 (validate_offset_bits!1 ((_ sign_extend 32) (size!7654 (buf!7717 (_2!12948 lt!428358)))) ((_ sign_extend 32) (currentByte!14214 (_2!12948 lt!428358))) ((_ sign_extend 32) (currentBit!14209 (_2!12948 lt!428358))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!428354 () Unit!20545)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13312 BitStream!13312 (_ BitVec 64) (_ BitVec 64)) Unit!20545)

(assert (=> b!294821 (= lt!428354 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12948 lt!428358) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!428357 () (_ BitVec 32))

(declare-fun lt!428353 () (_ BitVec 32))

(assert (=> b!294821 (= lt!428352 (array!17661 (store (arr!8692 arr!273) lt!428357 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8692 arr!273) lt!428357)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!428353)))) ((_ sign_extend 24) (ite (_1!12948 lt!428358) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!428353) #b00000000))))) (size!7654 arr!273)))))

(assert (=> b!294821 (= lt!428353 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!294821 (= lt!428357 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!13312) tuple2!23194)

(assert (=> b!294821 (= lt!428358 (readBit!0 thiss!1728))))

(declare-fun b!294822 () Bool)

(declare-fun e!210783 () Bool)

(declare-fun array_inv!7266 (array!17660) Bool)

(assert (=> b!294822 (= e!210783 (array_inv!7266 (buf!7717 thiss!1728)))))

(declare-fun b!294823 () Bool)

(assert (=> b!294823 (= e!210779 (and (= (buf!7717 thiss!1728) (buf!7717 (_2!12947 lt!428355))) (= (size!7654 arr!273) (size!7654 (_3!1350 lt!428355)))))))

(declare-fun res!243436 () Bool)

(assert (=> start!65728 (=> (not res!243436) (not e!210781))))

(assert (=> start!65728 (= res!243436 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7654 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65728 e!210781))

(declare-fun inv!12 (BitStream!13312) Bool)

(assert (=> start!65728 (and (inv!12 thiss!1728) e!210783)))

(assert (=> start!65728 true))

(assert (=> start!65728 (array_inv!7266 arr!273)))

(declare-fun b!294824 () Bool)

(declare-fun res!243435 () Bool)

(assert (=> b!294824 (=> (not res!243435) (not e!210781))))

(assert (=> b!294824 (= res!243435 (bvslt from!505 to!474))))

(declare-fun b!294825 () Bool)

(declare-fun res!243437 () Bool)

(assert (=> b!294825 (=> (not res!243437) (not e!210781))))

(assert (=> b!294825 (= res!243437 (validate_offset_bits!1 ((_ sign_extend 32) (size!7654 (buf!7717 thiss!1728))) ((_ sign_extend 32) (currentByte!14214 thiss!1728)) ((_ sign_extend 32) (currentBit!14209 thiss!1728)) (bvsub nBits!523 from!505)))))

(assert (= (and start!65728 res!243436) b!294825))

(assert (= (and b!294825 res!243437) b!294824))

(assert (= (and b!294824 res!243435) b!294821))

(assert (= (and b!294821 res!243434) b!294823))

(assert (= start!65728 b!294822))

(declare-fun m!431485 () Bool)

(assert (=> b!294821 m!431485))

(declare-fun m!431487 () Bool)

(assert (=> b!294821 m!431487))

(declare-fun m!431489 () Bool)

(assert (=> b!294821 m!431489))

(declare-fun m!431491 () Bool)

(assert (=> b!294821 m!431491))

(declare-fun m!431493 () Bool)

(assert (=> b!294821 m!431493))

(declare-fun m!431495 () Bool)

(assert (=> b!294821 m!431495))

(declare-fun m!431497 () Bool)

(assert (=> b!294821 m!431497))

(declare-fun m!431499 () Bool)

(assert (=> b!294821 m!431499))

(declare-fun m!431501 () Bool)

(assert (=> b!294821 m!431501))

(declare-fun m!431503 () Bool)

(assert (=> b!294821 m!431503))

(declare-fun m!431505 () Bool)

(assert (=> b!294821 m!431505))

(declare-fun m!431507 () Bool)

(assert (=> b!294821 m!431507))

(declare-fun m!431509 () Bool)

(assert (=> b!294821 m!431509))

(declare-fun m!431511 () Bool)

(assert (=> b!294822 m!431511))

(declare-fun m!431513 () Bool)

(assert (=> start!65728 m!431513))

(declare-fun m!431515 () Bool)

(assert (=> start!65728 m!431515))

(declare-fun m!431517 () Bool)

(assert (=> b!294825 m!431517))

(push 1)

(assert (not b!294822))

(assert (not b!294821))

(assert (not b!294825))

(assert (not start!65728))

(check-sat)

(pop 1)

(push 1)

(check-sat)

