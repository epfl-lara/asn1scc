; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64934 () Bool)

(assert start!64934)

(declare-fun b!291446 () Bool)

(declare-fun e!207714 () Bool)

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!291446 (= e!207714 (bvslt from!505 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 (bvsub to!474 from!505))))))

(declare-fun b!291447 () Bool)

(declare-fun e!207718 () Bool)

(declare-datatypes ((array!17298 0))(
  ( (array!17299 (arr!8508 (Array (_ BitVec 32) (_ BitVec 8))) (size!7488 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12986 0))(
  ( (BitStream!12987 (buf!7554 array!17298) (currentByte!13988 (_ BitVec 32)) (currentBit!13983 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12986)

(declare-fun array_inv!7100 (array!17298) Bool)

(assert (=> b!291447 (= e!207718 (array_inv!7100 (buf!7554 thiss!1728)))))

(declare-fun b!291448 () Bool)

(declare-fun res!240765 () Bool)

(assert (=> b!291448 (=> res!240765 e!207714)))

(declare-datatypes ((Unit!20253 0))(
  ( (Unit!20254) )
))
(declare-datatypes ((tuple3!1720 0))(
  ( (tuple3!1721 (_1!12733 Unit!20253) (_2!12733 BitStream!12986) (_3!1283 array!17298)) )
))
(declare-fun lt!423571 () tuple3!1720)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!291448 (= res!240765 (not (invariant!0 (currentBit!13983 (_2!12733 lt!423571)) (currentByte!13988 (_2!12733 lt!423571)) (size!7488 (buf!7554 (_2!12733 lt!423571))))))))

(declare-fun b!291449 () Bool)

(declare-fun res!240767 () Bool)

(declare-fun e!207720 () Bool)

(assert (=> b!291449 (=> (not res!240767) (not e!207720))))

(assert (=> b!291449 (= res!240767 (bvslt from!505 to!474))))

(declare-fun b!291450 () Bool)

(declare-fun res!240764 () Bool)

(assert (=> b!291450 (=> (not res!240764) (not e!207720))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!291450 (= res!240764 (validate_offset_bits!1 ((_ sign_extend 32) (size!7488 (buf!7554 thiss!1728))) ((_ sign_extend 32) (currentByte!13988 thiss!1728)) ((_ sign_extend 32) (currentBit!13983 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun res!240766 () Bool)

(assert (=> start!64934 (=> (not res!240766) (not e!207720))))

(declare-fun arr!273 () array!17298)

(assert (=> start!64934 (= res!240766 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7488 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64934 e!207720))

(declare-fun inv!12 (BitStream!12986) Bool)

(assert (=> start!64934 (and (inv!12 thiss!1728) e!207718)))

(assert (=> start!64934 true))

(assert (=> start!64934 (array_inv!7100 arr!273)))

(declare-fun b!291451 () Bool)

(assert (=> b!291451 (= e!207720 (not e!207714))))

(declare-fun res!240769 () Bool)

(assert (=> b!291451 (=> res!240769 e!207714)))

(declare-fun lt!423572 () Bool)

(declare-datatypes ((tuple2!22900 0))(
  ( (tuple2!22901 (_1!12734 BitStream!12986) (_2!12734 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!12986) tuple2!22900)

(assert (=> b!291451 (= res!240769 (not (= lt!423572 (_2!12734 (readBitPure!0 thiss!1728)))))))

(declare-fun e!207716 () Bool)

(assert (=> b!291451 e!207716))

(declare-fun res!240768 () Bool)

(assert (=> b!291451 (=> (not res!240768) (not e!207716))))

(declare-fun lt!423568 () array!17298)

(declare-fun bitAt!0 (array!17298 (_ BitVec 64)) Bool)

(assert (=> b!291451 (= res!240768 (= (bitAt!0 lt!423568 from!505) lt!423572))))

(assert (=> b!291451 (= lt!423572 (bitAt!0 (_3!1283 lt!423571) from!505))))

(declare-fun lt!423569 () Unit!20253)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17298 array!17298 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20253)

(assert (=> b!291451 (= lt!423569 (arrayBitRangesEqImpliesEq!0 lt!423568 (_3!1283 lt!423571) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun arrayBitRangesEq!0 (array!17298 array!17298 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!291451 (arrayBitRangesEq!0 arr!273 (_3!1283 lt!423571) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!423564 () Unit!20253)

(declare-fun arrayBitRangesEqTransitive!0 (array!17298 array!17298 array!17298 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20253)

(assert (=> b!291451 (= lt!423564 (arrayBitRangesEqTransitive!0 arr!273 lt!423568 (_3!1283 lt!423571) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!291451 (arrayBitRangesEq!0 arr!273 lt!423568 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!423567 () Unit!20253)

(declare-datatypes ((tuple2!22902 0))(
  ( (tuple2!22903 (_1!12735 Bool) (_2!12735 BitStream!12986)) )
))
(declare-fun lt!423565 () tuple2!22902)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17298 (_ BitVec 64) Bool) Unit!20253)

(assert (=> b!291451 (= lt!423567 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12735 lt!423565)))))

(declare-fun e!207717 () Bool)

(assert (=> b!291451 e!207717))

(declare-fun res!240770 () Bool)

(assert (=> b!291451 (=> (not res!240770) (not e!207717))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!291451 (= res!240770 (= (bvsub (bvadd (bitIndex!0 (size!7488 (buf!7554 thiss!1728)) (currentByte!13988 thiss!1728) (currentBit!13983 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7488 (buf!7554 (_2!12733 lt!423571))) (currentByte!13988 (_2!12733 lt!423571)) (currentBit!13983 (_2!12733 lt!423571)))))))

(declare-fun readBitsLoop!0 (BitStream!12986 (_ BitVec 64) array!17298 (_ BitVec 64) (_ BitVec 64)) tuple3!1720)

(assert (=> b!291451 (= lt!423571 (readBitsLoop!0 (_2!12735 lt!423565) nBits!523 lt!423568 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!291451 (validate_offset_bits!1 ((_ sign_extend 32) (size!7488 (buf!7554 (_2!12735 lt!423565)))) ((_ sign_extend 32) (currentByte!13988 (_2!12735 lt!423565))) ((_ sign_extend 32) (currentBit!13983 (_2!12735 lt!423565))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!423566 () Unit!20253)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12986 BitStream!12986 (_ BitVec 64) (_ BitVec 64)) Unit!20253)

(assert (=> b!291451 (= lt!423566 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12735 lt!423565) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!423573 () (_ BitVec 32))

(declare-fun lt!423570 () (_ BitVec 32))

(assert (=> b!291451 (= lt!423568 (array!17299 (store (arr!8508 arr!273) lt!423573 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8508 arr!273) lt!423573)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!423570)))) ((_ sign_extend 24) (ite (_1!12735 lt!423565) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!423570) #b00000000))))) (size!7488 arr!273)))))

(assert (=> b!291451 (= lt!423570 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!291451 (= lt!423573 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!12986) tuple2!22902)

(assert (=> b!291451 (= lt!423565 (readBit!0 thiss!1728))))

(declare-fun b!291452 () Bool)

(assert (=> b!291452 (= e!207717 (and (= (buf!7554 thiss!1728) (buf!7554 (_2!12733 lt!423571))) (= (size!7488 arr!273) (size!7488 (_3!1283 lt!423571)))))))

(declare-fun b!291453 () Bool)

(assert (=> b!291453 (= e!207716 (= lt!423572 (_1!12735 lt!423565)))))

(assert (= (and start!64934 res!240766) b!291450))

(assert (= (and b!291450 res!240764) b!291449))

(assert (= (and b!291449 res!240767) b!291451))

(assert (= (and b!291451 res!240770) b!291452))

(assert (= (and b!291451 res!240768) b!291453))

(assert (= (and b!291451 (not res!240769)) b!291448))

(assert (= (and b!291448 (not res!240765)) b!291446))

(assert (= start!64934 b!291447))

(declare-fun m!426485 () Bool)

(assert (=> b!291451 m!426485))

(declare-fun m!426487 () Bool)

(assert (=> b!291451 m!426487))

(declare-fun m!426489 () Bool)

(assert (=> b!291451 m!426489))

(declare-fun m!426491 () Bool)

(assert (=> b!291451 m!426491))

(declare-fun m!426493 () Bool)

(assert (=> b!291451 m!426493))

(declare-fun m!426495 () Bool)

(assert (=> b!291451 m!426495))

(declare-fun m!426497 () Bool)

(assert (=> b!291451 m!426497))

(declare-fun m!426499 () Bool)

(assert (=> b!291451 m!426499))

(declare-fun m!426501 () Bool)

(assert (=> b!291451 m!426501))

(declare-fun m!426503 () Bool)

(assert (=> b!291451 m!426503))

(declare-fun m!426505 () Bool)

(assert (=> b!291451 m!426505))

(declare-fun m!426507 () Bool)

(assert (=> b!291451 m!426507))

(declare-fun m!426509 () Bool)

(assert (=> b!291451 m!426509))

(declare-fun m!426511 () Bool)

(assert (=> b!291451 m!426511))

(declare-fun m!426513 () Bool)

(assert (=> b!291451 m!426513))

(declare-fun m!426515 () Bool)

(assert (=> b!291451 m!426515))

(declare-fun m!426517 () Bool)

(assert (=> b!291451 m!426517))

(declare-fun m!426519 () Bool)

(assert (=> start!64934 m!426519))

(declare-fun m!426521 () Bool)

(assert (=> start!64934 m!426521))

(declare-fun m!426523 () Bool)

(assert (=> b!291448 m!426523))

(declare-fun m!426525 () Bool)

(assert (=> b!291447 m!426525))

(declare-fun m!426527 () Bool)

(assert (=> b!291450 m!426527))

(push 1)

(assert (not b!291451))

(assert (not start!64934))

(assert (not b!291447))

(assert (not b!291450))

(assert (not b!291448))

(check-sat)

(pop 1)

(push 1)

(check-sat)

