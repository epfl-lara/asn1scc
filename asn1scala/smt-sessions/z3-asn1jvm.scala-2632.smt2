; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64944 () Bool)

(assert start!64944)

(declare-fun res!240859 () Bool)

(declare-fun e!207818 () Bool)

(assert (=> start!64944 (=> (not res!240859) (not e!207818))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-datatypes ((array!17308 0))(
  ( (array!17309 (arr!8513 (Array (_ BitVec 32) (_ BitVec 8))) (size!7493 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17308)

(assert (=> start!64944 (= res!240859 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7493 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64944 e!207818))

(declare-datatypes ((BitStream!12996 0))(
  ( (BitStream!12997 (buf!7559 array!17308) (currentByte!13993 (_ BitVec 32)) (currentBit!13988 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12996)

(declare-fun e!207816 () Bool)

(declare-fun inv!12 (BitStream!12996) Bool)

(assert (=> start!64944 (and (inv!12 thiss!1728) e!207816)))

(assert (=> start!64944 true))

(declare-fun array_inv!7105 (array!17308) Bool)

(assert (=> start!64944 (array_inv!7105 arr!273)))

(declare-fun b!291556 () Bool)

(declare-fun res!240863 () Bool)

(assert (=> b!291556 (=> (not res!240863) (not e!207818))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!291556 (= res!240863 (validate_offset_bits!1 ((_ sign_extend 32) (size!7493 (buf!7559 thiss!1728))) ((_ sign_extend 32) (currentByte!13993 thiss!1728)) ((_ sign_extend 32) (currentBit!13988 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!291557 () Bool)

(declare-fun res!240860 () Bool)

(assert (=> b!291557 (=> (not res!240860) (not e!207818))))

(assert (=> b!291557 (= res!240860 (bvslt from!505 to!474))))

(declare-fun b!291558 () Bool)

(assert (=> b!291558 (= e!207818 (not true))))

(declare-datatypes ((tuple2!22920 0))(
  ( (tuple2!22921 (_1!12748 BitStream!12996) (_2!12748 Bool)) )
))
(declare-fun lt!423722 () tuple2!22920)

(declare-fun readBitPure!0 (BitStream!12996) tuple2!22920)

(assert (=> b!291558 (= lt!423722 (readBitPure!0 thiss!1728))))

(declare-fun e!207814 () Bool)

(assert (=> b!291558 e!207814))

(declare-fun res!240862 () Bool)

(assert (=> b!291558 (=> (not res!240862) (not e!207814))))

(declare-fun lt!423726 () Bool)

(declare-fun lt!423727 () array!17308)

(declare-fun bitAt!0 (array!17308 (_ BitVec 64)) Bool)

(assert (=> b!291558 (= res!240862 (= (bitAt!0 lt!423727 from!505) lt!423726))))

(declare-datatypes ((Unit!20263 0))(
  ( (Unit!20264) )
))
(declare-datatypes ((tuple3!1730 0))(
  ( (tuple3!1731 (_1!12749 Unit!20263) (_2!12749 BitStream!12996) (_3!1288 array!17308)) )
))
(declare-fun lt!423728 () tuple3!1730)

(assert (=> b!291558 (= lt!423726 (bitAt!0 (_3!1288 lt!423728) from!505))))

(declare-fun lt!423723 () Unit!20263)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17308 array!17308 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20263)

(assert (=> b!291558 (= lt!423723 (arrayBitRangesEqImpliesEq!0 lt!423727 (_3!1288 lt!423728) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun arrayBitRangesEq!0 (array!17308 array!17308 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!291558 (arrayBitRangesEq!0 arr!273 (_3!1288 lt!423728) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!423719 () Unit!20263)

(declare-fun arrayBitRangesEqTransitive!0 (array!17308 array!17308 array!17308 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20263)

(assert (=> b!291558 (= lt!423719 (arrayBitRangesEqTransitive!0 arr!273 lt!423727 (_3!1288 lt!423728) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!291558 (arrayBitRangesEq!0 arr!273 lt!423727 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!423721 () Unit!20263)

(declare-datatypes ((tuple2!22922 0))(
  ( (tuple2!22923 (_1!12750 Bool) (_2!12750 BitStream!12996)) )
))
(declare-fun lt!423729 () tuple2!22922)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17308 (_ BitVec 64) Bool) Unit!20263)

(assert (=> b!291558 (= lt!423721 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12750 lt!423729)))))

(declare-fun e!207817 () Bool)

(assert (=> b!291558 e!207817))

(declare-fun res!240861 () Bool)

(assert (=> b!291558 (=> (not res!240861) (not e!207817))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!291558 (= res!240861 (= (bvsub (bvadd (bitIndex!0 (size!7493 (buf!7559 thiss!1728)) (currentByte!13993 thiss!1728) (currentBit!13988 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7493 (buf!7559 (_2!12749 lt!423728))) (currentByte!13993 (_2!12749 lt!423728)) (currentBit!13988 (_2!12749 lt!423728)))))))

(declare-fun readBitsLoop!0 (BitStream!12996 (_ BitVec 64) array!17308 (_ BitVec 64) (_ BitVec 64)) tuple3!1730)

(assert (=> b!291558 (= lt!423728 (readBitsLoop!0 (_2!12750 lt!423729) nBits!523 lt!423727 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!291558 (validate_offset_bits!1 ((_ sign_extend 32) (size!7493 (buf!7559 (_2!12750 lt!423729)))) ((_ sign_extend 32) (currentByte!13993 (_2!12750 lt!423729))) ((_ sign_extend 32) (currentBit!13988 (_2!12750 lt!423729))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!423724 () Unit!20263)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12996 BitStream!12996 (_ BitVec 64) (_ BitVec 64)) Unit!20263)

(assert (=> b!291558 (= lt!423724 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12750 lt!423729) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!423725 () (_ BitVec 32))

(declare-fun lt!423720 () (_ BitVec 32))

(assert (=> b!291558 (= lt!423727 (array!17309 (store (arr!8513 arr!273) lt!423720 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8513 arr!273) lt!423720)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!423725)))) ((_ sign_extend 24) (ite (_1!12750 lt!423729) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!423725) #b00000000))))) (size!7493 arr!273)))))

(assert (=> b!291558 (= lt!423725 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!291558 (= lt!423720 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!12996) tuple2!22922)

(assert (=> b!291558 (= lt!423729 (readBit!0 thiss!1728))))

(declare-fun b!291559 () Bool)

(assert (=> b!291559 (= e!207814 (= lt!423726 (_1!12750 lt!423729)))))

(declare-fun b!291560 () Bool)

(assert (=> b!291560 (= e!207817 (and (= (buf!7559 thiss!1728) (buf!7559 (_2!12749 lt!423728))) (= (size!7493 arr!273) (size!7493 (_3!1288 lt!423728)))))))

(declare-fun b!291561 () Bool)

(assert (=> b!291561 (= e!207816 (array_inv!7105 (buf!7559 thiss!1728)))))

(assert (= (and start!64944 res!240859) b!291556))

(assert (= (and b!291556 res!240863) b!291557))

(assert (= (and b!291557 res!240860) b!291558))

(assert (= (and b!291558 res!240861) b!291560))

(assert (= (and b!291558 res!240862) b!291559))

(assert (= start!64944 b!291561))

(declare-fun m!426703 () Bool)

(assert (=> start!64944 m!426703))

(declare-fun m!426705 () Bool)

(assert (=> start!64944 m!426705))

(declare-fun m!426707 () Bool)

(assert (=> b!291556 m!426707))

(declare-fun m!426709 () Bool)

(assert (=> b!291558 m!426709))

(declare-fun m!426711 () Bool)

(assert (=> b!291558 m!426711))

(declare-fun m!426713 () Bool)

(assert (=> b!291558 m!426713))

(declare-fun m!426715 () Bool)

(assert (=> b!291558 m!426715))

(declare-fun m!426717 () Bool)

(assert (=> b!291558 m!426717))

(declare-fun m!426719 () Bool)

(assert (=> b!291558 m!426719))

(declare-fun m!426721 () Bool)

(assert (=> b!291558 m!426721))

(declare-fun m!426723 () Bool)

(assert (=> b!291558 m!426723))

(declare-fun m!426725 () Bool)

(assert (=> b!291558 m!426725))

(declare-fun m!426727 () Bool)

(assert (=> b!291558 m!426727))

(declare-fun m!426729 () Bool)

(assert (=> b!291558 m!426729))

(declare-fun m!426731 () Bool)

(assert (=> b!291558 m!426731))

(declare-fun m!426733 () Bool)

(assert (=> b!291558 m!426733))

(declare-fun m!426735 () Bool)

(assert (=> b!291558 m!426735))

(declare-fun m!426737 () Bool)

(assert (=> b!291558 m!426737))

(declare-fun m!426739 () Bool)

(assert (=> b!291558 m!426739))

(declare-fun m!426741 () Bool)

(assert (=> b!291558 m!426741))

(declare-fun m!426743 () Bool)

(assert (=> b!291561 m!426743))

(check-sat (not b!291558) (not start!64944) (not b!291561) (not b!291556))
