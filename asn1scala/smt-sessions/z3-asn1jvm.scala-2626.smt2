; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64830 () Bool)

(assert start!64830)

(declare-datatypes ((array!17269 0))(
  ( (array!17270 (arr!8489 (Array (_ BitVec 32) (_ BitVec 8))) (size!7475 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12960 0))(
  ( (BitStream!12961 (buf!7541 array!17269) (currentByte!13966 (_ BitVec 32)) (currentBit!13961 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12960)

(declare-datatypes ((Unit!20215 0))(
  ( (Unit!20216) )
))
(declare-datatypes ((tuple3!1694 0))(
  ( (tuple3!1695 (_1!12690 Unit!20215) (_2!12690 BitStream!12960) (_3!1267 array!17269)) )
))
(declare-fun lt!422604 () tuple3!1694)

(declare-fun b!290977 () Bool)

(declare-fun e!207315 () Bool)

(declare-fun arr!273 () array!17269)

(assert (=> b!290977 (= e!207315 (and (= (buf!7541 thiss!1728) (buf!7541 (_2!12690 lt!422604))) (= (size!7475 arr!273) (size!7475 (_3!1267 lt!422604)))))))

(declare-fun b!290978 () Bool)

(declare-fun res!240381 () Bool)

(declare-fun e!207318 () Bool)

(assert (=> b!290978 (=> (not res!240381) (not e!207318))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!290978 (= res!240381 (validate_offset_bits!1 ((_ sign_extend 32) (size!7475 (buf!7541 thiss!1728))) ((_ sign_extend 32) (currentByte!13966 thiss!1728)) ((_ sign_extend 32) (currentBit!13961 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!290979 () Bool)

(declare-fun e!207316 () Bool)

(declare-fun array_inv!7087 (array!17269) Bool)

(assert (=> b!290979 (= e!207316 (array_inv!7087 (buf!7541 thiss!1728)))))

(declare-fun res!240380 () Bool)

(assert (=> start!64830 (=> (not res!240380) (not e!207318))))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> start!64830 (= res!240380 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7475 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64830 e!207318))

(declare-fun inv!12 (BitStream!12960) Bool)

(assert (=> start!64830 (and (inv!12 thiss!1728) e!207316)))

(assert (=> start!64830 true))

(assert (=> start!64830 (array_inv!7087 arr!273)))

(declare-fun b!290980 () Bool)

(declare-fun res!240382 () Bool)

(assert (=> b!290980 (=> (not res!240382) (not e!207318))))

(assert (=> b!290980 (= res!240382 (bvslt from!505 to!474))))

(declare-fun b!290981 () Bool)

(assert (=> b!290981 (= e!207318 (not (bvslt from!505 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7475 (_3!1267 lt!422604)))))))))

(declare-fun e!207317 () Bool)

(assert (=> b!290981 e!207317))

(declare-fun res!240379 () Bool)

(assert (=> b!290981 (=> (not res!240379) (not e!207317))))

(declare-fun lt!422599 () Bool)

(declare-fun lt!422606 () array!17269)

(declare-fun bitAt!0 (array!17269 (_ BitVec 64)) Bool)

(assert (=> b!290981 (= res!240379 (= (bitAt!0 lt!422606 from!505) lt!422599))))

(assert (=> b!290981 (= lt!422599 (bitAt!0 (_3!1267 lt!422604) from!505))))

(declare-fun lt!422602 () Unit!20215)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17269 array!17269 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20215)

(assert (=> b!290981 (= lt!422602 (arrayBitRangesEqImpliesEq!0 lt!422606 (_3!1267 lt!422604) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun arrayBitRangesEq!0 (array!17269 array!17269 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!290981 (arrayBitRangesEq!0 arr!273 (_3!1267 lt!422604) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!422598 () Unit!20215)

(declare-fun arrayBitRangesEqTransitive!0 (array!17269 array!17269 array!17269 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20215)

(assert (=> b!290981 (= lt!422598 (arrayBitRangesEqTransitive!0 arr!273 lt!422606 (_3!1267 lt!422604) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!290981 (arrayBitRangesEq!0 arr!273 lt!422606 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!422603 () Unit!20215)

(declare-datatypes ((tuple2!22846 0))(
  ( (tuple2!22847 (_1!12691 Bool) (_2!12691 BitStream!12960)) )
))
(declare-fun lt!422601 () tuple2!22846)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17269 (_ BitVec 64) Bool) Unit!20215)

(assert (=> b!290981 (= lt!422603 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12691 lt!422601)))))

(assert (=> b!290981 e!207315))

(declare-fun res!240383 () Bool)

(assert (=> b!290981 (=> (not res!240383) (not e!207315))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!290981 (= res!240383 (= (bvsub (bvadd (bitIndex!0 (size!7475 (buf!7541 thiss!1728)) (currentByte!13966 thiss!1728) (currentBit!13961 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7475 (buf!7541 (_2!12690 lt!422604))) (currentByte!13966 (_2!12690 lt!422604)) (currentBit!13961 (_2!12690 lt!422604)))))))

(declare-fun readBitsLoop!0 (BitStream!12960 (_ BitVec 64) array!17269 (_ BitVec 64) (_ BitVec 64)) tuple3!1694)

(assert (=> b!290981 (= lt!422604 (readBitsLoop!0 (_2!12691 lt!422601) nBits!523 lt!422606 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!290981 (validate_offset_bits!1 ((_ sign_extend 32) (size!7475 (buf!7541 (_2!12691 lt!422601)))) ((_ sign_extend 32) (currentByte!13966 (_2!12691 lt!422601))) ((_ sign_extend 32) (currentBit!13961 (_2!12691 lt!422601))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!422607 () Unit!20215)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12960 BitStream!12960 (_ BitVec 64) (_ BitVec 64)) Unit!20215)

(assert (=> b!290981 (= lt!422607 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12691 lt!422601) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!422605 () (_ BitVec 32))

(declare-fun lt!422600 () (_ BitVec 32))

(assert (=> b!290981 (= lt!422606 (array!17270 (store (arr!8489 arr!273) lt!422605 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8489 arr!273) lt!422605)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!422600)))) ((_ sign_extend 24) (ite (_1!12691 lt!422601) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!422600) #b00000000))))) (size!7475 arr!273)))))

(assert (=> b!290981 (= lt!422600 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!290981 (= lt!422605 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!12960) tuple2!22846)

(assert (=> b!290981 (= lt!422601 (readBit!0 thiss!1728))))

(declare-fun b!290982 () Bool)

(assert (=> b!290982 (= e!207317 (= lt!422599 (_1!12691 lt!422601)))))

(assert (= (and start!64830 res!240380) b!290978))

(assert (= (and b!290978 res!240381) b!290980))

(assert (= (and b!290980 res!240382) b!290981))

(assert (= (and b!290981 res!240383) b!290977))

(assert (= (and b!290981 res!240379) b!290982))

(assert (= start!64830 b!290979))

(declare-fun m!425555 () Bool)

(assert (=> b!290978 m!425555))

(declare-fun m!425557 () Bool)

(assert (=> b!290979 m!425557))

(declare-fun m!425559 () Bool)

(assert (=> start!64830 m!425559))

(declare-fun m!425561 () Bool)

(assert (=> start!64830 m!425561))

(declare-fun m!425563 () Bool)

(assert (=> b!290981 m!425563))

(declare-fun m!425565 () Bool)

(assert (=> b!290981 m!425565))

(declare-fun m!425567 () Bool)

(assert (=> b!290981 m!425567))

(declare-fun m!425569 () Bool)

(assert (=> b!290981 m!425569))

(declare-fun m!425571 () Bool)

(assert (=> b!290981 m!425571))

(declare-fun m!425573 () Bool)

(assert (=> b!290981 m!425573))

(declare-fun m!425575 () Bool)

(assert (=> b!290981 m!425575))

(declare-fun m!425577 () Bool)

(assert (=> b!290981 m!425577))

(declare-fun m!425579 () Bool)

(assert (=> b!290981 m!425579))

(declare-fun m!425581 () Bool)

(assert (=> b!290981 m!425581))

(declare-fun m!425583 () Bool)

(assert (=> b!290981 m!425583))

(declare-fun m!425585 () Bool)

(assert (=> b!290981 m!425585))

(declare-fun m!425587 () Bool)

(assert (=> b!290981 m!425587))

(declare-fun m!425589 () Bool)

(assert (=> b!290981 m!425589))

(declare-fun m!425591 () Bool)

(assert (=> b!290981 m!425591))

(declare-fun m!425593 () Bool)

(assert (=> b!290981 m!425593))

(check-sat (not b!290981) (not start!64830) (not b!290979) (not b!290978))
(check-sat)
