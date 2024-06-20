; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64924 () Bool)

(assert start!64924)

(declare-fun res!240676 () Bool)

(declare-fun e!207617 () Bool)

(assert (=> start!64924 (=> (not res!240676) (not e!207617))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-datatypes ((array!17288 0))(
  ( (array!17289 (arr!8503 (Array (_ BitVec 32) (_ BitVec 8))) (size!7483 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17288)

(assert (=> start!64924 (= res!240676 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7483 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64924 e!207617))

(declare-datatypes ((BitStream!12976 0))(
  ( (BitStream!12977 (buf!7549 array!17288) (currentByte!13983 (_ BitVec 32)) (currentBit!13978 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12976)

(declare-fun e!207618 () Bool)

(declare-fun inv!12 (BitStream!12976) Bool)

(assert (=> start!64924 (and (inv!12 thiss!1728) e!207618)))

(assert (=> start!64924 true))

(declare-fun array_inv!7095 (array!17288) Bool)

(assert (=> start!64924 (array_inv!7095 arr!273)))

(declare-fun b!291340 () Bool)

(declare-fun res!240674 () Bool)

(assert (=> b!291340 (=> (not res!240674) (not e!207617))))

(assert (=> b!291340 (= res!240674 (bvslt from!505 to!474))))

(declare-fun e!207621 () Bool)

(declare-datatypes ((Unit!20243 0))(
  ( (Unit!20244) )
))
(declare-datatypes ((tuple3!1710 0))(
  ( (tuple3!1711 (_1!12718 Unit!20243) (_2!12718 BitStream!12976) (_3!1278 array!17288)) )
))
(declare-fun lt!423417 () tuple3!1710)

(declare-fun b!291341 () Bool)

(assert (=> b!291341 (= e!207621 (and (= (buf!7549 thiss!1728) (buf!7549 (_2!12718 lt!423417))) (= (size!7483 arr!273) (size!7483 (_3!1278 lt!423417)))))))

(declare-fun b!291342 () Bool)

(assert (=> b!291342 (= e!207618 (array_inv!7095 (buf!7549 thiss!1728)))))

(declare-fun b!291343 () Bool)

(declare-fun res!240677 () Bool)

(assert (=> b!291343 (=> (not res!240677) (not e!207617))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!291343 (= res!240677 (validate_offset_bits!1 ((_ sign_extend 32) (size!7483 (buf!7549 thiss!1728))) ((_ sign_extend 32) (currentByte!13983 thiss!1728)) ((_ sign_extend 32) (currentBit!13978 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!291344 () Bool)

(declare-fun e!207616 () Bool)

(declare-fun lt!423415 () Bool)

(declare-datatypes ((tuple2!22880 0))(
  ( (tuple2!22881 (_1!12719 Bool) (_2!12719 BitStream!12976)) )
))
(declare-fun lt!423409 () tuple2!22880)

(assert (=> b!291344 (= e!207616 (= lt!423415 (_1!12719 lt!423409)))))

(declare-fun b!291345 () Bool)

(assert (=> b!291345 (= e!207617 (not true))))

(declare-datatypes ((tuple2!22882 0))(
  ( (tuple2!22883 (_1!12720 BitStream!12976) (_2!12720 Bool)) )
))
(declare-fun lt!423414 () tuple2!22882)

(declare-fun readBitPure!0 (BitStream!12976) tuple2!22882)

(assert (=> b!291345 (= lt!423414 (readBitPure!0 thiss!1728))))

(assert (=> b!291345 e!207616))

(declare-fun res!240673 () Bool)

(assert (=> b!291345 (=> (not res!240673) (not e!207616))))

(declare-fun lt!423410 () array!17288)

(declare-fun bitAt!0 (array!17288 (_ BitVec 64)) Bool)

(assert (=> b!291345 (= res!240673 (= (bitAt!0 lt!423410 from!505) lt!423415))))

(assert (=> b!291345 (= lt!423415 (bitAt!0 (_3!1278 lt!423417) from!505))))

(declare-fun lt!423413 () Unit!20243)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17288 array!17288 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20243)

(assert (=> b!291345 (= lt!423413 (arrayBitRangesEqImpliesEq!0 lt!423410 (_3!1278 lt!423417) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun arrayBitRangesEq!0 (array!17288 array!17288 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!291345 (arrayBitRangesEq!0 arr!273 (_3!1278 lt!423417) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!423412 () Unit!20243)

(declare-fun arrayBitRangesEqTransitive!0 (array!17288 array!17288 array!17288 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20243)

(assert (=> b!291345 (= lt!423412 (arrayBitRangesEqTransitive!0 arr!273 lt!423410 (_3!1278 lt!423417) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!291345 (arrayBitRangesEq!0 arr!273 lt!423410 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!423411 () Unit!20243)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17288 (_ BitVec 64) Bool) Unit!20243)

(assert (=> b!291345 (= lt!423411 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12719 lt!423409)))))

(assert (=> b!291345 e!207621))

(declare-fun res!240675 () Bool)

(assert (=> b!291345 (=> (not res!240675) (not e!207621))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!291345 (= res!240675 (= (bvsub (bvadd (bitIndex!0 (size!7483 (buf!7549 thiss!1728)) (currentByte!13983 thiss!1728) (currentBit!13978 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7483 (buf!7549 (_2!12718 lt!423417))) (currentByte!13983 (_2!12718 lt!423417)) (currentBit!13978 (_2!12718 lt!423417)))))))

(declare-fun readBitsLoop!0 (BitStream!12976 (_ BitVec 64) array!17288 (_ BitVec 64) (_ BitVec 64)) tuple3!1710)

(assert (=> b!291345 (= lt!423417 (readBitsLoop!0 (_2!12719 lt!423409) nBits!523 lt!423410 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!291345 (validate_offset_bits!1 ((_ sign_extend 32) (size!7483 (buf!7549 (_2!12719 lt!423409)))) ((_ sign_extend 32) (currentByte!13983 (_2!12719 lt!423409))) ((_ sign_extend 32) (currentBit!13978 (_2!12719 lt!423409))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!423408 () Unit!20243)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12976 BitStream!12976 (_ BitVec 64) (_ BitVec 64)) Unit!20243)

(assert (=> b!291345 (= lt!423408 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12719 lt!423409) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!423416 () (_ BitVec 32))

(declare-fun lt!423407 () (_ BitVec 32))

(assert (=> b!291345 (= lt!423410 (array!17289 (store (arr!8503 arr!273) lt!423416 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8503 arr!273) lt!423416)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!423407)))) ((_ sign_extend 24) (ite (_1!12719 lt!423409) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!423407) #b00000000))))) (size!7483 arr!273)))))

(assert (=> b!291345 (= lt!423407 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!291345 (= lt!423416 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!12976) tuple2!22880)

(assert (=> b!291345 (= lt!423409 (readBit!0 thiss!1728))))

(assert (= (and start!64924 res!240676) b!291343))

(assert (= (and b!291343 res!240677) b!291340))

(assert (= (and b!291340 res!240674) b!291345))

(assert (= (and b!291345 res!240675) b!291341))

(assert (= (and b!291345 res!240673) b!291344))

(assert (= start!64924 b!291342))

(declare-fun m!426271 () Bool)

(assert (=> start!64924 m!426271))

(declare-fun m!426273 () Bool)

(assert (=> start!64924 m!426273))

(declare-fun m!426275 () Bool)

(assert (=> b!291342 m!426275))

(declare-fun m!426277 () Bool)

(assert (=> b!291343 m!426277))

(declare-fun m!426279 () Bool)

(assert (=> b!291345 m!426279))

(declare-fun m!426281 () Bool)

(assert (=> b!291345 m!426281))

(declare-fun m!426283 () Bool)

(assert (=> b!291345 m!426283))

(declare-fun m!426285 () Bool)

(assert (=> b!291345 m!426285))

(declare-fun m!426287 () Bool)

(assert (=> b!291345 m!426287))

(declare-fun m!426289 () Bool)

(assert (=> b!291345 m!426289))

(declare-fun m!426291 () Bool)

(assert (=> b!291345 m!426291))

(declare-fun m!426293 () Bool)

(assert (=> b!291345 m!426293))

(declare-fun m!426295 () Bool)

(assert (=> b!291345 m!426295))

(declare-fun m!426297 () Bool)

(assert (=> b!291345 m!426297))

(declare-fun m!426299 () Bool)

(assert (=> b!291345 m!426299))

(declare-fun m!426301 () Bool)

(assert (=> b!291345 m!426301))

(declare-fun m!426303 () Bool)

(assert (=> b!291345 m!426303))

(declare-fun m!426305 () Bool)

(assert (=> b!291345 m!426305))

(declare-fun m!426307 () Bool)

(assert (=> b!291345 m!426307))

(declare-fun m!426309 () Bool)

(assert (=> b!291345 m!426309))

(declare-fun m!426311 () Bool)

(assert (=> b!291345 m!426311))

(push 1)

(assert (not b!291342))

(assert (not start!64924))

(assert (not b!291345))

(assert (not b!291343))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

