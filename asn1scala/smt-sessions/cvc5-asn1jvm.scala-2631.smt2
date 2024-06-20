; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64936 () Bool)

(assert start!64936)

(declare-fun b!291470 () Bool)

(declare-fun e!207735 () Bool)

(declare-datatypes ((array!17300 0))(
  ( (array!17301 (arr!8509 (Array (_ BitVec 32) (_ BitVec 8))) (size!7489 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12988 0))(
  ( (BitStream!12989 (buf!7555 array!17300) (currentByte!13989 (_ BitVec 32)) (currentBit!13984 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12988)

(declare-fun array_inv!7101 (array!17300) Bool)

(assert (=> b!291470 (= e!207735 (array_inv!7101 (buf!7555 thiss!1728)))))

(declare-fun b!291471 () Bool)

(declare-fun res!240786 () Bool)

(declare-fun e!207738 () Bool)

(assert (=> b!291471 (=> res!240786 e!207738)))

(declare-datatypes ((Unit!20255 0))(
  ( (Unit!20256) )
))
(declare-datatypes ((tuple3!1722 0))(
  ( (tuple3!1723 (_1!12736 Unit!20255) (_2!12736 BitStream!12988) (_3!1284 array!17300)) )
))
(declare-fun lt!423602 () tuple3!1722)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!291471 (= res!240786 (not (invariant!0 (currentBit!13984 (_2!12736 lt!423602)) (currentByte!13989 (_2!12736 lt!423602)) (size!7489 (buf!7555 (_2!12736 lt!423602))))))))

(declare-fun res!240791 () Bool)

(declare-fun e!207736 () Bool)

(assert (=> start!64936 (=> (not res!240791) (not e!207736))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun arr!273 () array!17300)

(assert (=> start!64936 (= res!240791 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7489 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64936 e!207736))

(declare-fun inv!12 (BitStream!12988) Bool)

(assert (=> start!64936 (and (inv!12 thiss!1728) e!207735)))

(assert (=> start!64936 true))

(assert (=> start!64936 (array_inv!7101 arr!273)))

(declare-fun b!291472 () Bool)

(assert (=> b!291472 (= e!207738 (or (bvsge from!505 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 (bvsub to!474 from!505))) (bvsle (bvadd from!505 (bvsub to!474 from!505)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7489 (_3!1284 lt!423602)))))))))

(declare-fun b!291473 () Bool)

(assert (=> b!291473 (= e!207736 (not e!207738))))

(declare-fun res!240785 () Bool)

(assert (=> b!291473 (=> res!240785 e!207738)))

(declare-fun lt!423595 () Bool)

(declare-datatypes ((tuple2!22904 0))(
  ( (tuple2!22905 (_1!12737 BitStream!12988) (_2!12737 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!12988) tuple2!22904)

(assert (=> b!291473 (= res!240785 (not (= lt!423595 (_2!12737 (readBitPure!0 thiss!1728)))))))

(declare-fun e!207739 () Bool)

(assert (=> b!291473 e!207739))

(declare-fun res!240787 () Bool)

(assert (=> b!291473 (=> (not res!240787) (not e!207739))))

(declare-fun lt!423599 () array!17300)

(declare-fun bitAt!0 (array!17300 (_ BitVec 64)) Bool)

(assert (=> b!291473 (= res!240787 (= (bitAt!0 lt!423599 from!505) lt!423595))))

(assert (=> b!291473 (= lt!423595 (bitAt!0 (_3!1284 lt!423602) from!505))))

(declare-fun lt!423600 () Unit!20255)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17300 array!17300 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20255)

(assert (=> b!291473 (= lt!423600 (arrayBitRangesEqImpliesEq!0 lt!423599 (_3!1284 lt!423602) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun arrayBitRangesEq!0 (array!17300 array!17300 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!291473 (arrayBitRangesEq!0 arr!273 (_3!1284 lt!423602) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!423603 () Unit!20255)

(declare-fun arrayBitRangesEqTransitive!0 (array!17300 array!17300 array!17300 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20255)

(assert (=> b!291473 (= lt!423603 (arrayBitRangesEqTransitive!0 arr!273 lt!423599 (_3!1284 lt!423602) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!291473 (arrayBitRangesEq!0 arr!273 lt!423599 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((tuple2!22906 0))(
  ( (tuple2!22907 (_1!12738 Bool) (_2!12738 BitStream!12988)) )
))
(declare-fun lt!423596 () tuple2!22906)

(declare-fun lt!423594 () Unit!20255)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17300 (_ BitVec 64) Bool) Unit!20255)

(assert (=> b!291473 (= lt!423594 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12738 lt!423596)))))

(declare-fun e!207740 () Bool)

(assert (=> b!291473 e!207740))

(declare-fun res!240790 () Bool)

(assert (=> b!291473 (=> (not res!240790) (not e!207740))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!291473 (= res!240790 (= (bvsub (bvadd (bitIndex!0 (size!7489 (buf!7555 thiss!1728)) (currentByte!13989 thiss!1728) (currentBit!13984 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7489 (buf!7555 (_2!12736 lt!423602))) (currentByte!13989 (_2!12736 lt!423602)) (currentBit!13984 (_2!12736 lt!423602)))))))

(declare-fun readBitsLoop!0 (BitStream!12988 (_ BitVec 64) array!17300 (_ BitVec 64) (_ BitVec 64)) tuple3!1722)

(assert (=> b!291473 (= lt!423602 (readBitsLoop!0 (_2!12738 lt!423596) nBits!523 lt!423599 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!291473 (validate_offset_bits!1 ((_ sign_extend 32) (size!7489 (buf!7555 (_2!12738 lt!423596)))) ((_ sign_extend 32) (currentByte!13989 (_2!12738 lt!423596))) ((_ sign_extend 32) (currentBit!13984 (_2!12738 lt!423596))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!423597 () Unit!20255)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12988 BitStream!12988 (_ BitVec 64) (_ BitVec 64)) Unit!20255)

(assert (=> b!291473 (= lt!423597 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12738 lt!423596) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!423601 () (_ BitVec 32))

(declare-fun lt!423598 () (_ BitVec 32))

(assert (=> b!291473 (= lt!423599 (array!17301 (store (arr!8509 arr!273) lt!423601 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8509 arr!273) lt!423601)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!423598)))) ((_ sign_extend 24) (ite (_1!12738 lt!423596) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!423598) #b00000000))))) (size!7489 arr!273)))))

(assert (=> b!291473 (= lt!423598 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!291473 (= lt!423601 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!12988) tuple2!22906)

(assert (=> b!291473 (= lt!423596 (readBit!0 thiss!1728))))

(declare-fun b!291474 () Bool)

(assert (=> b!291474 (= e!207740 (and (= (buf!7555 thiss!1728) (buf!7555 (_2!12736 lt!423602))) (= (size!7489 arr!273) (size!7489 (_3!1284 lt!423602)))))))

(declare-fun b!291475 () Bool)

(declare-fun res!240788 () Bool)

(assert (=> b!291475 (=> (not res!240788) (not e!207736))))

(assert (=> b!291475 (= res!240788 (bvslt from!505 to!474))))

(declare-fun b!291476 () Bool)

(declare-fun res!240789 () Bool)

(assert (=> b!291476 (=> (not res!240789) (not e!207736))))

(assert (=> b!291476 (= res!240789 (validate_offset_bits!1 ((_ sign_extend 32) (size!7489 (buf!7555 thiss!1728))) ((_ sign_extend 32) (currentByte!13989 thiss!1728)) ((_ sign_extend 32) (currentBit!13984 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!291477 () Bool)

(assert (=> b!291477 (= e!207739 (= lt!423595 (_1!12738 lt!423596)))))

(assert (= (and start!64936 res!240791) b!291476))

(assert (= (and b!291476 res!240789) b!291475))

(assert (= (and b!291475 res!240788) b!291473))

(assert (= (and b!291473 res!240790) b!291474))

(assert (= (and b!291473 res!240787) b!291477))

(assert (= (and b!291473 (not res!240785)) b!291471))

(assert (= (and b!291471 (not res!240786)) b!291472))

(assert (= start!64936 b!291470))

(declare-fun m!426529 () Bool)

(assert (=> b!291476 m!426529))

(declare-fun m!426531 () Bool)

(assert (=> b!291470 m!426531))

(declare-fun m!426533 () Bool)

(assert (=> b!291473 m!426533))

(declare-fun m!426535 () Bool)

(assert (=> b!291473 m!426535))

(declare-fun m!426537 () Bool)

(assert (=> b!291473 m!426537))

(declare-fun m!426539 () Bool)

(assert (=> b!291473 m!426539))

(declare-fun m!426541 () Bool)

(assert (=> b!291473 m!426541))

(declare-fun m!426543 () Bool)

(assert (=> b!291473 m!426543))

(declare-fun m!426545 () Bool)

(assert (=> b!291473 m!426545))

(declare-fun m!426547 () Bool)

(assert (=> b!291473 m!426547))

(declare-fun m!426549 () Bool)

(assert (=> b!291473 m!426549))

(declare-fun m!426551 () Bool)

(assert (=> b!291473 m!426551))

(declare-fun m!426553 () Bool)

(assert (=> b!291473 m!426553))

(declare-fun m!426555 () Bool)

(assert (=> b!291473 m!426555))

(declare-fun m!426557 () Bool)

(assert (=> b!291473 m!426557))

(declare-fun m!426559 () Bool)

(assert (=> b!291473 m!426559))

(declare-fun m!426561 () Bool)

(assert (=> b!291473 m!426561))

(declare-fun m!426563 () Bool)

(assert (=> b!291473 m!426563))

(declare-fun m!426565 () Bool)

(assert (=> b!291473 m!426565))

(declare-fun m!426567 () Bool)

(assert (=> start!64936 m!426567))

(declare-fun m!426569 () Bool)

(assert (=> start!64936 m!426569))

(declare-fun m!426571 () Bool)

(assert (=> b!291471 m!426571))

(push 1)

(assert (not start!64936))

(assert (not b!291476))

(assert (not b!291473))

(assert (not b!291471))

(assert (not b!291470))

(check-sat)

(pop 1)

(push 1)

(check-sat)

