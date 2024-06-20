; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64622 () Bool)

(assert start!64622)

(declare-fun res!239678 () Bool)

(declare-fun e!206566 () Bool)

(assert (=> start!64622 (=> (not res!239678) (not e!206566))))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-datatypes ((array!17211 0))(
  ( (array!17212 (arr!8451 (Array (_ BitVec 32) (_ BitVec 8))) (size!7449 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17211)

(declare-fun nBits!523 () (_ BitVec 64))

(assert (=> start!64622 (= res!239678 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7449 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64622 e!206566))

(declare-datatypes ((BitStream!12908 0))(
  ( (BitStream!12909 (buf!7515 array!17211) (currentByte!13922 (_ BitVec 32)) (currentBit!13917 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12908)

(declare-fun e!206565 () Bool)

(declare-fun inv!12 (BitStream!12908) Bool)

(assert (=> start!64622 (and (inv!12 thiss!1728) e!206565)))

(assert (=> start!64622 true))

(declare-fun array_inv!7061 (array!17211) Bool)

(assert (=> start!64622 (array_inv!7061 arr!273)))

(declare-fun b!290108 () Bool)

(declare-fun e!206568 () Bool)

(declare-datatypes ((Unit!20139 0))(
  ( (Unit!20140) )
))
(declare-datatypes ((tuple3!1642 0))(
  ( (tuple3!1643 (_1!12621 Unit!20139) (_2!12621 BitStream!12908) (_3!1235 array!17211)) )
))
(declare-fun lt!420750 () tuple3!1642)

(assert (=> b!290108 (= e!206568 (and (= (buf!7515 thiss!1728) (buf!7515 (_2!12621 lt!420750))) (= (size!7449 arr!273) (size!7449 (_3!1235 lt!420750)))))))

(declare-fun b!290109 () Bool)

(declare-fun res!239679 () Bool)

(assert (=> b!290109 (=> (not res!239679) (not e!206566))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!290109 (= res!239679 (validate_offset_bits!1 ((_ sign_extend 32) (size!7449 (buf!7515 thiss!1728))) ((_ sign_extend 32) (currentByte!13922 thiss!1728)) ((_ sign_extend 32) (currentBit!13917 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!290110 () Bool)

(assert (=> b!290110 (= e!206565 (array_inv!7061 (buf!7515 thiss!1728)))))

(declare-fun b!290111 () Bool)

(declare-fun res!239680 () Bool)

(assert (=> b!290111 (=> (not res!239680) (not e!206566))))

(assert (=> b!290111 (= res!239680 (bvslt from!505 to!474))))

(declare-fun b!290112 () Bool)

(assert (=> b!290112 (= e!206566 (not true))))

(declare-fun arrayBitRangesEq!0 (array!17211 array!17211 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!290112 (arrayBitRangesEq!0 arr!273 (_3!1235 lt!420750) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!420752 () Unit!20139)

(declare-fun lt!420755 () array!17211)

(declare-fun arrayBitRangesEqTransitive!0 (array!17211 array!17211 array!17211 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20139)

(assert (=> b!290112 (= lt!420752 (arrayBitRangesEqTransitive!0 arr!273 lt!420755 (_3!1235 lt!420750) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!290112 (arrayBitRangesEq!0 arr!273 lt!420755 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!420751 () Unit!20139)

(declare-datatypes ((tuple2!22772 0))(
  ( (tuple2!22773 (_1!12622 Bool) (_2!12622 BitStream!12908)) )
))
(declare-fun lt!420754 () tuple2!22772)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17211 (_ BitVec 64) Bool) Unit!20139)

(assert (=> b!290112 (= lt!420751 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12622 lt!420754)))))

(assert (=> b!290112 e!206568))

(declare-fun res!239681 () Bool)

(assert (=> b!290112 (=> (not res!239681) (not e!206568))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!290112 (= res!239681 (= (bvsub (bvadd (bitIndex!0 (size!7449 (buf!7515 thiss!1728)) (currentByte!13922 thiss!1728) (currentBit!13917 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7449 (buf!7515 (_2!12621 lt!420750))) (currentByte!13922 (_2!12621 lt!420750)) (currentBit!13917 (_2!12621 lt!420750)))))))

(declare-fun readBitsLoop!0 (BitStream!12908 (_ BitVec 64) array!17211 (_ BitVec 64) (_ BitVec 64)) tuple3!1642)

(assert (=> b!290112 (= lt!420750 (readBitsLoop!0 (_2!12622 lt!420754) nBits!523 lt!420755 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!290112 (validate_offset_bits!1 ((_ sign_extend 32) (size!7449 (buf!7515 (_2!12622 lt!420754)))) ((_ sign_extend 32) (currentByte!13922 (_2!12622 lt!420754))) ((_ sign_extend 32) (currentBit!13917 (_2!12622 lt!420754))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420753 () Unit!20139)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12908 BitStream!12908 (_ BitVec 64) (_ BitVec 64)) Unit!20139)

(assert (=> b!290112 (= lt!420753 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12622 lt!420754) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420756 () (_ BitVec 32))

(declare-fun lt!420749 () (_ BitVec 32))

(assert (=> b!290112 (= lt!420755 (array!17212 (store (arr!8451 arr!273) lt!420756 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8451 arr!273) lt!420756)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420749)))) ((_ sign_extend 24) (ite (_1!12622 lt!420754) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420749) #b00000000))))) (size!7449 arr!273)))))

(assert (=> b!290112 (= lt!420749 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!290112 (= lt!420756 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!12908) tuple2!22772)

(assert (=> b!290112 (= lt!420754 (readBit!0 thiss!1728))))

(assert (= (and start!64622 res!239678) b!290109))

(assert (= (and b!290109 res!239679) b!290111))

(assert (= (and b!290111 res!239680) b!290112))

(assert (= (and b!290112 res!239681) b!290108))

(assert (= start!64622 b!290110))

(declare-fun m!423759 () Bool)

(assert (=> start!64622 m!423759))

(declare-fun m!423761 () Bool)

(assert (=> start!64622 m!423761))

(declare-fun m!423763 () Bool)

(assert (=> b!290109 m!423763))

(declare-fun m!423765 () Bool)

(assert (=> b!290110 m!423765))

(declare-fun m!423767 () Bool)

(assert (=> b!290112 m!423767))

(declare-fun m!423769 () Bool)

(assert (=> b!290112 m!423769))

(declare-fun m!423771 () Bool)

(assert (=> b!290112 m!423771))

(declare-fun m!423773 () Bool)

(assert (=> b!290112 m!423773))

(declare-fun m!423775 () Bool)

(assert (=> b!290112 m!423775))

(declare-fun m!423777 () Bool)

(assert (=> b!290112 m!423777))

(declare-fun m!423779 () Bool)

(assert (=> b!290112 m!423779))

(declare-fun m!423781 () Bool)

(assert (=> b!290112 m!423781))

(declare-fun m!423783 () Bool)

(assert (=> b!290112 m!423783))

(declare-fun m!423785 () Bool)

(assert (=> b!290112 m!423785))

(declare-fun m!423787 () Bool)

(assert (=> b!290112 m!423787))

(declare-fun m!423789 () Bool)

(assert (=> b!290112 m!423789))

(declare-fun m!423791 () Bool)

(assert (=> b!290112 m!423791))

(push 1)

(assert (not b!290109))

(assert (not b!290110))

(assert (not start!64622))

(assert (not b!290112))

(check-sat)

