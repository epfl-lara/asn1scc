; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64946 () Bool)

(assert start!64946)

(declare-fun b!291574 () Bool)

(declare-fun res!240878 () Bool)

(declare-fun e!207836 () Bool)

(assert (=> b!291574 (=> (not res!240878) (not e!207836))))

(declare-datatypes ((array!17310 0))(
  ( (array!17311 (arr!8514 (Array (_ BitVec 32) (_ BitVec 8))) (size!7494 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12998 0))(
  ( (BitStream!12999 (buf!7560 array!17310) (currentByte!13994 (_ BitVec 32)) (currentBit!13989 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12998)

(declare-fun from!505 () (_ BitVec 64))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!291574 (= res!240878 (validate_offset_bits!1 ((_ sign_extend 32) (size!7494 (buf!7560 thiss!1728))) ((_ sign_extend 32) (currentByte!13994 thiss!1728)) ((_ sign_extend 32) (currentBit!13989 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!291575 () Bool)

(declare-fun e!207834 () Bool)

(declare-fun lt!423757 () Bool)

(declare-datatypes ((tuple2!22924 0))(
  ( (tuple2!22925 (_1!12751 Bool) (_2!12751 BitStream!12998)) )
))
(declare-fun lt!423759 () tuple2!22924)

(assert (=> b!291575 (= e!207834 (= lt!423757 (_1!12751 lt!423759)))))

(declare-fun e!207835 () Bool)

(declare-fun b!291576 () Bool)

(declare-datatypes ((Unit!20265 0))(
  ( (Unit!20266) )
))
(declare-datatypes ((tuple3!1732 0))(
  ( (tuple3!1733 (_1!12752 Unit!20265) (_2!12752 BitStream!12998) (_3!1289 array!17310)) )
))
(declare-fun lt!423761 () tuple3!1732)

(declare-fun arr!273 () array!17310)

(assert (=> b!291576 (= e!207835 (and (= (buf!7560 thiss!1728) (buf!7560 (_2!12752 lt!423761))) (= (size!7494 arr!273) (size!7494 (_3!1289 lt!423761)))))))

(declare-fun b!291578 () Bool)

(declare-fun e!207833 () Bool)

(declare-fun array_inv!7106 (array!17310) Bool)

(assert (=> b!291578 (= e!207833 (array_inv!7106 (buf!7560 thiss!1728)))))

(declare-fun b!291579 () Bool)

(declare-fun res!240877 () Bool)

(assert (=> b!291579 (=> (not res!240877) (not e!207836))))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!291579 (= res!240877 (bvslt from!505 to!474))))

(declare-fun b!291577 () Bool)

(assert (=> b!291577 (= e!207836 (not true))))

(declare-datatypes ((tuple2!22926 0))(
  ( (tuple2!22927 (_1!12753 BitStream!12998) (_2!12753 Bool)) )
))
(declare-fun lt!423762 () tuple2!22926)

(declare-fun readBitPure!0 (BitStream!12998) tuple2!22926)

(assert (=> b!291577 (= lt!423762 (readBitPure!0 thiss!1728))))

(assert (=> b!291577 e!207834))

(declare-fun res!240875 () Bool)

(assert (=> b!291577 (=> (not res!240875) (not e!207834))))

(declare-fun lt!423754 () array!17310)

(declare-fun bitAt!0 (array!17310 (_ BitVec 64)) Bool)

(assert (=> b!291577 (= res!240875 (= (bitAt!0 lt!423754 from!505) lt!423757))))

(assert (=> b!291577 (= lt!423757 (bitAt!0 (_3!1289 lt!423761) from!505))))

(declare-fun lt!423753 () Unit!20265)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17310 array!17310 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20265)

(assert (=> b!291577 (= lt!423753 (arrayBitRangesEqImpliesEq!0 lt!423754 (_3!1289 lt!423761) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun arrayBitRangesEq!0 (array!17310 array!17310 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!291577 (arrayBitRangesEq!0 arr!273 (_3!1289 lt!423761) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!423752 () Unit!20265)

(declare-fun arrayBitRangesEqTransitive!0 (array!17310 array!17310 array!17310 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20265)

(assert (=> b!291577 (= lt!423752 (arrayBitRangesEqTransitive!0 arr!273 lt!423754 (_3!1289 lt!423761) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!291577 (arrayBitRangesEq!0 arr!273 lt!423754 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!423758 () Unit!20265)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17310 (_ BitVec 64) Bool) Unit!20265)

(assert (=> b!291577 (= lt!423758 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12751 lt!423759)))))

(assert (=> b!291577 e!207835))

(declare-fun res!240874 () Bool)

(assert (=> b!291577 (=> (not res!240874) (not e!207835))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!291577 (= res!240874 (= (bvsub (bvadd (bitIndex!0 (size!7494 (buf!7560 thiss!1728)) (currentByte!13994 thiss!1728) (currentBit!13989 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7494 (buf!7560 (_2!12752 lt!423761))) (currentByte!13994 (_2!12752 lt!423761)) (currentBit!13989 (_2!12752 lt!423761)))))))

(declare-fun readBitsLoop!0 (BitStream!12998 (_ BitVec 64) array!17310 (_ BitVec 64) (_ BitVec 64)) tuple3!1732)

(assert (=> b!291577 (= lt!423761 (readBitsLoop!0 (_2!12751 lt!423759) nBits!523 lt!423754 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!291577 (validate_offset_bits!1 ((_ sign_extend 32) (size!7494 (buf!7560 (_2!12751 lt!423759)))) ((_ sign_extend 32) (currentByte!13994 (_2!12751 lt!423759))) ((_ sign_extend 32) (currentBit!13989 (_2!12751 lt!423759))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!423756 () Unit!20265)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12998 BitStream!12998 (_ BitVec 64) (_ BitVec 64)) Unit!20265)

(assert (=> b!291577 (= lt!423756 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12751 lt!423759) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!423755 () (_ BitVec 32))

(declare-fun lt!423760 () (_ BitVec 32))

(assert (=> b!291577 (= lt!423754 (array!17311 (store (arr!8514 arr!273) lt!423760 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8514 arr!273) lt!423760)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!423755)))) ((_ sign_extend 24) (ite (_1!12751 lt!423759) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!423755) #b00000000))))) (size!7494 arr!273)))))

(assert (=> b!291577 (= lt!423755 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!291577 (= lt!423760 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!12998) tuple2!22924)

(assert (=> b!291577 (= lt!423759 (readBit!0 thiss!1728))))

(declare-fun res!240876 () Bool)

(assert (=> start!64946 (=> (not res!240876) (not e!207836))))

(assert (=> start!64946 (= res!240876 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7494 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64946 e!207836))

(declare-fun inv!12 (BitStream!12998) Bool)

(assert (=> start!64946 (and (inv!12 thiss!1728) e!207833)))

(assert (=> start!64946 true))

(assert (=> start!64946 (array_inv!7106 arr!273)))

(assert (= (and start!64946 res!240876) b!291574))

(assert (= (and b!291574 res!240878) b!291579))

(assert (= (and b!291579 res!240877) b!291577))

(assert (= (and b!291577 res!240874) b!291576))

(assert (= (and b!291577 res!240875) b!291575))

(assert (= start!64946 b!291578))

(declare-fun m!426745 () Bool)

(assert (=> b!291574 m!426745))

(declare-fun m!426747 () Bool)

(assert (=> b!291578 m!426747))

(declare-fun m!426749 () Bool)

(assert (=> b!291577 m!426749))

(declare-fun m!426751 () Bool)

(assert (=> b!291577 m!426751))

(declare-fun m!426753 () Bool)

(assert (=> b!291577 m!426753))

(declare-fun m!426755 () Bool)

(assert (=> b!291577 m!426755))

(declare-fun m!426757 () Bool)

(assert (=> b!291577 m!426757))

(declare-fun m!426759 () Bool)

(assert (=> b!291577 m!426759))

(declare-fun m!426761 () Bool)

(assert (=> b!291577 m!426761))

(declare-fun m!426763 () Bool)

(assert (=> b!291577 m!426763))

(declare-fun m!426765 () Bool)

(assert (=> b!291577 m!426765))

(declare-fun m!426767 () Bool)

(assert (=> b!291577 m!426767))

(declare-fun m!426769 () Bool)

(assert (=> b!291577 m!426769))

(declare-fun m!426771 () Bool)

(assert (=> b!291577 m!426771))

(declare-fun m!426773 () Bool)

(assert (=> b!291577 m!426773))

(declare-fun m!426775 () Bool)

(assert (=> b!291577 m!426775))

(declare-fun m!426777 () Bool)

(assert (=> b!291577 m!426777))

(declare-fun m!426779 () Bool)

(assert (=> b!291577 m!426779))

(declare-fun m!426781 () Bool)

(assert (=> b!291577 m!426781))

(declare-fun m!426783 () Bool)

(assert (=> start!64946 m!426783))

(declare-fun m!426785 () Bool)

(assert (=> start!64946 m!426785))

(push 1)

(assert (not b!291574))

(assert (not b!291578))

(assert (not b!291577))

(assert (not start!64946))

(check-sat)

