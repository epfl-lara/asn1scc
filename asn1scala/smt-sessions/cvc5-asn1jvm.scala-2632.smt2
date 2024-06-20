; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64942 () Bool)

(assert start!64942)

(declare-fun b!291538 () Bool)

(declare-fun e!207800 () Bool)

(declare-fun lt!423688 () Bool)

(declare-datatypes ((array!17306 0))(
  ( (array!17307 (arr!8512 (Array (_ BitVec 32) (_ BitVec 8))) (size!7492 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12994 0))(
  ( (BitStream!12995 (buf!7558 array!17306) (currentByte!13992 (_ BitVec 32)) (currentBit!13987 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!22916 0))(
  ( (tuple2!22917 (_1!12745 Bool) (_2!12745 BitStream!12994)) )
))
(declare-fun lt!423692 () tuple2!22916)

(assert (=> b!291538 (= e!207800 (= lt!423688 (_1!12745 lt!423692)))))

(declare-fun res!240847 () Bool)

(declare-fun e!207799 () Bool)

(assert (=> start!64942 (=> (not res!240847) (not e!207799))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun arr!273 () array!17306)

(assert (=> start!64942 (= res!240847 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7492 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64942 e!207799))

(declare-fun thiss!1728 () BitStream!12994)

(declare-fun e!207797 () Bool)

(declare-fun inv!12 (BitStream!12994) Bool)

(assert (=> start!64942 (and (inv!12 thiss!1728) e!207797)))

(assert (=> start!64942 true))

(declare-fun array_inv!7104 (array!17306) Bool)

(assert (=> start!64942 (array_inv!7104 arr!273)))

(declare-fun e!207796 () Bool)

(declare-fun b!291539 () Bool)

(declare-datatypes ((Unit!20261 0))(
  ( (Unit!20262) )
))
(declare-datatypes ((tuple3!1728 0))(
  ( (tuple3!1729 (_1!12746 Unit!20261) (_2!12746 BitStream!12994) (_3!1287 array!17306)) )
))
(declare-fun lt!423687 () tuple3!1728)

(assert (=> b!291539 (= e!207796 (and (= (buf!7558 thiss!1728) (buf!7558 (_2!12746 lt!423687))) (= (size!7492 arr!273) (size!7492 (_3!1287 lt!423687)))))))

(declare-fun b!291540 () Bool)

(assert (=> b!291540 (= e!207799 (not true))))

(declare-datatypes ((tuple2!22918 0))(
  ( (tuple2!22919 (_1!12747 BitStream!12994) (_2!12747 Bool)) )
))
(declare-fun lt!423693 () tuple2!22918)

(declare-fun readBitPure!0 (BitStream!12994) tuple2!22918)

(assert (=> b!291540 (= lt!423693 (readBitPure!0 thiss!1728))))

(assert (=> b!291540 e!207800))

(declare-fun res!240846 () Bool)

(assert (=> b!291540 (=> (not res!240846) (not e!207800))))

(declare-fun lt!423686 () array!17306)

(declare-fun bitAt!0 (array!17306 (_ BitVec 64)) Bool)

(assert (=> b!291540 (= res!240846 (= (bitAt!0 lt!423686 from!505) lt!423688))))

(assert (=> b!291540 (= lt!423688 (bitAt!0 (_3!1287 lt!423687) from!505))))

(declare-fun lt!423689 () Unit!20261)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17306 array!17306 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20261)

(assert (=> b!291540 (= lt!423689 (arrayBitRangesEqImpliesEq!0 lt!423686 (_3!1287 lt!423687) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun arrayBitRangesEq!0 (array!17306 array!17306 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!291540 (arrayBitRangesEq!0 arr!273 (_3!1287 lt!423687) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!423690 () Unit!20261)

(declare-fun arrayBitRangesEqTransitive!0 (array!17306 array!17306 array!17306 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20261)

(assert (=> b!291540 (= lt!423690 (arrayBitRangesEqTransitive!0 arr!273 lt!423686 (_3!1287 lt!423687) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!291540 (arrayBitRangesEq!0 arr!273 lt!423686 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!423694 () Unit!20261)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17306 (_ BitVec 64) Bool) Unit!20261)

(assert (=> b!291540 (= lt!423694 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12745 lt!423692)))))

(assert (=> b!291540 e!207796))

(declare-fun res!240848 () Bool)

(assert (=> b!291540 (=> (not res!240848) (not e!207796))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!291540 (= res!240848 (= (bvsub (bvadd (bitIndex!0 (size!7492 (buf!7558 thiss!1728)) (currentByte!13992 thiss!1728) (currentBit!13987 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7492 (buf!7558 (_2!12746 lt!423687))) (currentByte!13992 (_2!12746 lt!423687)) (currentBit!13987 (_2!12746 lt!423687)))))))

(declare-fun readBitsLoop!0 (BitStream!12994 (_ BitVec 64) array!17306 (_ BitVec 64) (_ BitVec 64)) tuple3!1728)

(assert (=> b!291540 (= lt!423687 (readBitsLoop!0 (_2!12745 lt!423692) nBits!523 lt!423686 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!291540 (validate_offset_bits!1 ((_ sign_extend 32) (size!7492 (buf!7558 (_2!12745 lt!423692)))) ((_ sign_extend 32) (currentByte!13992 (_2!12745 lt!423692))) ((_ sign_extend 32) (currentBit!13987 (_2!12745 lt!423692))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!423695 () Unit!20261)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12994 BitStream!12994 (_ BitVec 64) (_ BitVec 64)) Unit!20261)

(assert (=> b!291540 (= lt!423695 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12745 lt!423692) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!423696 () (_ BitVec 32))

(declare-fun lt!423691 () (_ BitVec 32))

(assert (=> b!291540 (= lt!423686 (array!17307 (store (arr!8512 arr!273) lt!423691 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8512 arr!273) lt!423691)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!423696)))) ((_ sign_extend 24) (ite (_1!12745 lt!423692) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!423696) #b00000000))))) (size!7492 arr!273)))))

(assert (=> b!291540 (= lt!423696 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!291540 (= lt!423691 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!12994) tuple2!22916)

(assert (=> b!291540 (= lt!423692 (readBit!0 thiss!1728))))

(declare-fun b!291541 () Bool)

(declare-fun res!240845 () Bool)

(assert (=> b!291541 (=> (not res!240845) (not e!207799))))

(assert (=> b!291541 (= res!240845 (bvslt from!505 to!474))))

(declare-fun b!291542 () Bool)

(assert (=> b!291542 (= e!207797 (array_inv!7104 (buf!7558 thiss!1728)))))

(declare-fun b!291543 () Bool)

(declare-fun res!240844 () Bool)

(assert (=> b!291543 (=> (not res!240844) (not e!207799))))

(assert (=> b!291543 (= res!240844 (validate_offset_bits!1 ((_ sign_extend 32) (size!7492 (buf!7558 thiss!1728))) ((_ sign_extend 32) (currentByte!13992 thiss!1728)) ((_ sign_extend 32) (currentBit!13987 thiss!1728)) (bvsub nBits!523 from!505)))))

(assert (= (and start!64942 res!240847) b!291543))

(assert (= (and b!291543 res!240844) b!291541))

(assert (= (and b!291541 res!240845) b!291540))

(assert (= (and b!291540 res!240848) b!291539))

(assert (= (and b!291540 res!240846) b!291538))

(assert (= start!64942 b!291542))

(declare-fun m!426661 () Bool)

(assert (=> start!64942 m!426661))

(declare-fun m!426663 () Bool)

(assert (=> start!64942 m!426663))

(declare-fun m!426665 () Bool)

(assert (=> b!291540 m!426665))

(declare-fun m!426667 () Bool)

(assert (=> b!291540 m!426667))

(declare-fun m!426669 () Bool)

(assert (=> b!291540 m!426669))

(declare-fun m!426671 () Bool)

(assert (=> b!291540 m!426671))

(declare-fun m!426673 () Bool)

(assert (=> b!291540 m!426673))

(declare-fun m!426675 () Bool)

(assert (=> b!291540 m!426675))

(declare-fun m!426677 () Bool)

(assert (=> b!291540 m!426677))

(declare-fun m!426679 () Bool)

(assert (=> b!291540 m!426679))

(declare-fun m!426681 () Bool)

(assert (=> b!291540 m!426681))

(declare-fun m!426683 () Bool)

(assert (=> b!291540 m!426683))

(declare-fun m!426685 () Bool)

(assert (=> b!291540 m!426685))

(declare-fun m!426687 () Bool)

(assert (=> b!291540 m!426687))

(declare-fun m!426689 () Bool)

(assert (=> b!291540 m!426689))

(declare-fun m!426691 () Bool)

(assert (=> b!291540 m!426691))

(declare-fun m!426693 () Bool)

(assert (=> b!291540 m!426693))

(declare-fun m!426695 () Bool)

(assert (=> b!291540 m!426695))

(declare-fun m!426697 () Bool)

(assert (=> b!291540 m!426697))

(declare-fun m!426699 () Bool)

(assert (=> b!291542 m!426699))

(declare-fun m!426701 () Bool)

(assert (=> b!291543 m!426701))

(push 1)

(assert (not b!291540))

(assert (not start!64942))

(assert (not b!291542))

(assert (not b!291543))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

