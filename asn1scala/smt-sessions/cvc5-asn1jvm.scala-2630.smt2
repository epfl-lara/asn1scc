; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64930 () Bool)

(assert start!64930)

(declare-fun b!291398 () Bool)

(declare-fun res!240724 () Bool)

(declare-fun e!207675 () Bool)

(assert (=> b!291398 (=> (not res!240724) (not e!207675))))

(declare-datatypes ((array!17294 0))(
  ( (array!17295 (arr!8506 (Array (_ BitVec 32) (_ BitVec 8))) (size!7486 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12982 0))(
  ( (BitStream!12983 (buf!7552 array!17294) (currentByte!13986 (_ BitVec 32)) (currentBit!13981 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12982)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!291398 (= res!240724 (validate_offset_bits!1 ((_ sign_extend 32) (size!7486 (buf!7552 thiss!1728))) ((_ sign_extend 32) (currentByte!13986 thiss!1728)) ((_ sign_extend 32) (currentBit!13981 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!291399 () Bool)

(declare-fun res!240723 () Bool)

(declare-fun e!207672 () Bool)

(assert (=> b!291399 (=> res!240723 e!207672)))

(declare-datatypes ((Unit!20249 0))(
  ( (Unit!20250) )
))
(declare-datatypes ((tuple3!1716 0))(
  ( (tuple3!1717 (_1!12727 Unit!20249) (_2!12727 BitStream!12982) (_3!1281 array!17294)) )
))
(declare-fun lt!423513 () tuple3!1716)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!291399 (= res!240723 (not (invariant!0 (currentBit!13981 (_2!12727 lt!423513)) (currentByte!13986 (_2!12727 lt!423513)) (size!7486 (buf!7552 (_2!12727 lt!423513))))))))

(declare-fun b!291400 () Bool)

(assert (=> b!291400 (= e!207675 (not e!207672))))

(declare-fun res!240727 () Bool)

(assert (=> b!291400 (=> res!240727 e!207672)))

(declare-fun lt!423510 () Bool)

(declare-datatypes ((tuple2!22892 0))(
  ( (tuple2!22893 (_1!12728 BitStream!12982) (_2!12728 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!12982) tuple2!22892)

(assert (=> b!291400 (= res!240727 (not (= lt!423510 (_2!12728 (readBitPure!0 thiss!1728)))))))

(declare-fun e!207674 () Bool)

(assert (=> b!291400 e!207674))

(declare-fun res!240726 () Bool)

(assert (=> b!291400 (=> (not res!240726) (not e!207674))))

(declare-fun lt!423504 () array!17294)

(declare-fun bitAt!0 (array!17294 (_ BitVec 64)) Bool)

(assert (=> b!291400 (= res!240726 (= (bitAt!0 lt!423504 from!505) lt!423510))))

(assert (=> b!291400 (= lt!423510 (bitAt!0 (_3!1281 lt!423513) from!505))))

(declare-fun lt!423509 () Unit!20249)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17294 array!17294 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20249)

(assert (=> b!291400 (= lt!423509 (arrayBitRangesEqImpliesEq!0 lt!423504 (_3!1281 lt!423513) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun arr!273 () array!17294)

(declare-fun arrayBitRangesEq!0 (array!17294 array!17294 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!291400 (arrayBitRangesEq!0 arr!273 (_3!1281 lt!423513) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!423512 () Unit!20249)

(declare-fun arrayBitRangesEqTransitive!0 (array!17294 array!17294 array!17294 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20249)

(assert (=> b!291400 (= lt!423512 (arrayBitRangesEqTransitive!0 arr!273 lt!423504 (_3!1281 lt!423513) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!291400 (arrayBitRangesEq!0 arr!273 lt!423504 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((tuple2!22894 0))(
  ( (tuple2!22895 (_1!12729 Bool) (_2!12729 BitStream!12982)) )
))
(declare-fun lt!423511 () tuple2!22894)

(declare-fun lt!423507 () Unit!20249)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17294 (_ BitVec 64) Bool) Unit!20249)

(assert (=> b!291400 (= lt!423507 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12729 lt!423511)))))

(declare-fun e!207676 () Bool)

(assert (=> b!291400 e!207676))

(declare-fun res!240728 () Bool)

(assert (=> b!291400 (=> (not res!240728) (not e!207676))))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!291400 (= res!240728 (= (bvsub (bvadd (bitIndex!0 (size!7486 (buf!7552 thiss!1728)) (currentByte!13986 thiss!1728) (currentBit!13981 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7486 (buf!7552 (_2!12727 lt!423513))) (currentByte!13986 (_2!12727 lt!423513)) (currentBit!13981 (_2!12727 lt!423513)))))))

(declare-fun readBitsLoop!0 (BitStream!12982 (_ BitVec 64) array!17294 (_ BitVec 64) (_ BitVec 64)) tuple3!1716)

(assert (=> b!291400 (= lt!423513 (readBitsLoop!0 (_2!12729 lt!423511) nBits!523 lt!423504 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!291400 (validate_offset_bits!1 ((_ sign_extend 32) (size!7486 (buf!7552 (_2!12729 lt!423511)))) ((_ sign_extend 32) (currentByte!13986 (_2!12729 lt!423511))) ((_ sign_extend 32) (currentBit!13981 (_2!12729 lt!423511))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!423506 () Unit!20249)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12982 BitStream!12982 (_ BitVec 64) (_ BitVec 64)) Unit!20249)

(assert (=> b!291400 (= lt!423506 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12729 lt!423511) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!423508 () (_ BitVec 32))

(declare-fun lt!423505 () (_ BitVec 32))

(assert (=> b!291400 (= lt!423504 (array!17295 (store (arr!8506 arr!273) lt!423505 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8506 arr!273) lt!423505)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!423508)))) ((_ sign_extend 24) (ite (_1!12729 lt!423511) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!423508) #b00000000))))) (size!7486 arr!273)))))

(assert (=> b!291400 (= lt!423508 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!291400 (= lt!423505 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!12982) tuple2!22894)

(assert (=> b!291400 (= lt!423511 (readBit!0 thiss!1728))))

(declare-fun b!291401 () Bool)

(declare-fun res!240722 () Bool)

(assert (=> b!291401 (=> (not res!240722) (not e!207675))))

(assert (=> b!291401 (= res!240722 (bvslt from!505 to!474))))

(declare-fun b!291402 () Bool)

(assert (=> b!291402 (= e!207674 (= lt!423510 (_1!12729 lt!423511)))))

(declare-fun b!291403 () Bool)

(assert (=> b!291403 (= e!207676 (and (= (buf!7552 thiss!1728) (buf!7552 (_2!12727 lt!423513))) (= (size!7486 arr!273) (size!7486 (_3!1281 lt!423513)))))))

(declare-fun b!291404 () Bool)

(declare-fun e!207678 () Bool)

(declare-fun array_inv!7098 (array!17294) Bool)

(assert (=> b!291404 (= e!207678 (array_inv!7098 (buf!7552 thiss!1728)))))

(declare-fun res!240725 () Bool)

(assert (=> start!64930 (=> (not res!240725) (not e!207675))))

(assert (=> start!64930 (= res!240725 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7486 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64930 e!207675))

(declare-fun inv!12 (BitStream!12982) Bool)

(assert (=> start!64930 (and (inv!12 thiss!1728) e!207678)))

(assert (=> start!64930 true))

(assert (=> start!64930 (array_inv!7098 arr!273)))

(declare-fun b!291405 () Bool)

(assert (=> b!291405 (= e!207672 (bvslt from!505 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 (bvsub to!474 from!505))))))

(assert (= (and start!64930 res!240725) b!291398))

(assert (= (and b!291398 res!240724) b!291401))

(assert (= (and b!291401 res!240722) b!291400))

(assert (= (and b!291400 res!240728) b!291403))

(assert (= (and b!291400 res!240726) b!291402))

(assert (= (and b!291400 (not res!240727)) b!291399))

(assert (= (and b!291399 (not res!240723)) b!291405))

(assert (= start!64930 b!291404))

(declare-fun m!426397 () Bool)

(assert (=> b!291404 m!426397))

(declare-fun m!426399 () Bool)

(assert (=> b!291400 m!426399))

(declare-fun m!426401 () Bool)

(assert (=> b!291400 m!426401))

(declare-fun m!426403 () Bool)

(assert (=> b!291400 m!426403))

(declare-fun m!426405 () Bool)

(assert (=> b!291400 m!426405))

(declare-fun m!426407 () Bool)

(assert (=> b!291400 m!426407))

(declare-fun m!426409 () Bool)

(assert (=> b!291400 m!426409))

(declare-fun m!426411 () Bool)

(assert (=> b!291400 m!426411))

(declare-fun m!426413 () Bool)

(assert (=> b!291400 m!426413))

(declare-fun m!426415 () Bool)

(assert (=> b!291400 m!426415))

(declare-fun m!426417 () Bool)

(assert (=> b!291400 m!426417))

(declare-fun m!426419 () Bool)

(assert (=> b!291400 m!426419))

(declare-fun m!426421 () Bool)

(assert (=> b!291400 m!426421))

(declare-fun m!426423 () Bool)

(assert (=> b!291400 m!426423))

(declare-fun m!426425 () Bool)

(assert (=> b!291400 m!426425))

(declare-fun m!426427 () Bool)

(assert (=> b!291400 m!426427))

(declare-fun m!426429 () Bool)

(assert (=> b!291400 m!426429))

(declare-fun m!426431 () Bool)

(assert (=> b!291400 m!426431))

(declare-fun m!426433 () Bool)

(assert (=> b!291399 m!426433))

(declare-fun m!426435 () Bool)

(assert (=> b!291398 m!426435))

(declare-fun m!426437 () Bool)

(assert (=> start!64930 m!426437))

(declare-fun m!426439 () Bool)

(assert (=> start!64930 m!426439))

(push 1)

(assert (not b!291398))

(assert (not b!291400))

(assert (not start!64930))

(assert (not b!291399))

(assert (not b!291404))

(check-sat)

(pop 1)

(push 1)

(check-sat)

