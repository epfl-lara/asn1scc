; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64618 () Bool)

(assert start!64618)

(declare-fun b!290078 () Bool)

(declare-fun e!206535 () Bool)

(assert (=> b!290078 (= e!206535 (not true))))

(declare-datatypes ((array!17207 0))(
  ( (array!17208 (arr!8449 (Array (_ BitVec 32) (_ BitVec 8))) (size!7447 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17207)

(declare-datatypes ((BitStream!12904 0))(
  ( (BitStream!12905 (buf!7513 array!17207) (currentByte!13920 (_ BitVec 32)) (currentBit!13915 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!20135 0))(
  ( (Unit!20136) )
))
(declare-datatypes ((tuple3!1638 0))(
  ( (tuple3!1639 (_1!12617 Unit!20135) (_2!12617 BitStream!12904) (_3!1233 array!17207)) )
))
(declare-fun lt!420707 () tuple3!1638)

(declare-fun from!505 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!17207 array!17207 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!290078 (arrayBitRangesEq!0 arr!273 (_3!1233 lt!420707) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!420702 () array!17207)

(declare-fun lt!420708 () Unit!20135)

(declare-fun arrayBitRangesEqTransitive!0 (array!17207 array!17207 array!17207 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20135)

(assert (=> b!290078 (= lt!420708 (arrayBitRangesEqTransitive!0 arr!273 lt!420702 (_3!1233 lt!420707) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!290078 (arrayBitRangesEq!0 arr!273 lt!420702 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((tuple2!22768 0))(
  ( (tuple2!22769 (_1!12618 Bool) (_2!12618 BitStream!12904)) )
))
(declare-fun lt!420706 () tuple2!22768)

(declare-fun lt!420703 () Unit!20135)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17207 (_ BitVec 64) Bool) Unit!20135)

(assert (=> b!290078 (= lt!420703 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12618 lt!420706)))))

(declare-fun e!206537 () Bool)

(assert (=> b!290078 e!206537))

(declare-fun res!239657 () Bool)

(assert (=> b!290078 (=> (not res!239657) (not e!206537))))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun thiss!1728 () BitStream!12904)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!290078 (= res!239657 (= (bvsub (bvadd (bitIndex!0 (size!7447 (buf!7513 thiss!1728)) (currentByte!13920 thiss!1728) (currentBit!13915 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7447 (buf!7513 (_2!12617 lt!420707))) (currentByte!13920 (_2!12617 lt!420707)) (currentBit!13915 (_2!12617 lt!420707)))))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun readBitsLoop!0 (BitStream!12904 (_ BitVec 64) array!17207 (_ BitVec 64) (_ BitVec 64)) tuple3!1638)

(assert (=> b!290078 (= lt!420707 (readBitsLoop!0 (_2!12618 lt!420706) nBits!523 lt!420702 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!290078 (validate_offset_bits!1 ((_ sign_extend 32) (size!7447 (buf!7513 (_2!12618 lt!420706)))) ((_ sign_extend 32) (currentByte!13920 (_2!12618 lt!420706))) ((_ sign_extend 32) (currentBit!13915 (_2!12618 lt!420706))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420704 () Unit!20135)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12904 BitStream!12904 (_ BitVec 64) (_ BitVec 64)) Unit!20135)

(assert (=> b!290078 (= lt!420704 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12618 lt!420706) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420701 () (_ BitVec 32))

(declare-fun lt!420705 () (_ BitVec 32))

(assert (=> b!290078 (= lt!420702 (array!17208 (store (arr!8449 arr!273) lt!420705 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8449 arr!273) lt!420705)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420701)))) ((_ sign_extend 24) (ite (_1!12618 lt!420706) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420701) #b00000000))))) (size!7447 arr!273)))))

(assert (=> b!290078 (= lt!420701 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!290078 (= lt!420705 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!12904) tuple2!22768)

(assert (=> b!290078 (= lt!420706 (readBit!0 thiss!1728))))

(declare-fun b!290079 () Bool)

(declare-fun res!239654 () Bool)

(assert (=> b!290079 (=> (not res!239654) (not e!206535))))

(assert (=> b!290079 (= res!239654 (validate_offset_bits!1 ((_ sign_extend 32) (size!7447 (buf!7513 thiss!1728))) ((_ sign_extend 32) (currentByte!13920 thiss!1728)) ((_ sign_extend 32) (currentBit!13915 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun res!239656 () Bool)

(assert (=> start!64618 (=> (not res!239656) (not e!206535))))

(assert (=> start!64618 (= res!239656 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7447 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64618 e!206535))

(declare-fun e!206538 () Bool)

(declare-fun inv!12 (BitStream!12904) Bool)

(assert (=> start!64618 (and (inv!12 thiss!1728) e!206538)))

(assert (=> start!64618 true))

(declare-fun array_inv!7059 (array!17207) Bool)

(assert (=> start!64618 (array_inv!7059 arr!273)))

(declare-fun b!290080 () Bool)

(declare-fun res!239655 () Bool)

(assert (=> b!290080 (=> (not res!239655) (not e!206535))))

(assert (=> b!290080 (= res!239655 (bvslt from!505 to!474))))

(declare-fun b!290081 () Bool)

(assert (=> b!290081 (= e!206537 (and (= (buf!7513 thiss!1728) (buf!7513 (_2!12617 lt!420707))) (= (size!7447 arr!273) (size!7447 (_3!1233 lt!420707)))))))

(declare-fun b!290082 () Bool)

(assert (=> b!290082 (= e!206538 (array_inv!7059 (buf!7513 thiss!1728)))))

(assert (= (and start!64618 res!239656) b!290079))

(assert (= (and b!290079 res!239654) b!290080))

(assert (= (and b!290080 res!239655) b!290078))

(assert (= (and b!290078 res!239657) b!290081))

(assert (= start!64618 b!290082))

(declare-fun m!423691 () Bool)

(assert (=> b!290078 m!423691))

(declare-fun m!423693 () Bool)

(assert (=> b!290078 m!423693))

(declare-fun m!423695 () Bool)

(assert (=> b!290078 m!423695))

(declare-fun m!423697 () Bool)

(assert (=> b!290078 m!423697))

(declare-fun m!423699 () Bool)

(assert (=> b!290078 m!423699))

(declare-fun m!423701 () Bool)

(assert (=> b!290078 m!423701))

(declare-fun m!423703 () Bool)

(assert (=> b!290078 m!423703))

(declare-fun m!423705 () Bool)

(assert (=> b!290078 m!423705))

(declare-fun m!423707 () Bool)

(assert (=> b!290078 m!423707))

(declare-fun m!423709 () Bool)

(assert (=> b!290078 m!423709))

(declare-fun m!423711 () Bool)

(assert (=> b!290078 m!423711))

(declare-fun m!423713 () Bool)

(assert (=> b!290078 m!423713))

(declare-fun m!423715 () Bool)

(assert (=> b!290078 m!423715))

(declare-fun m!423717 () Bool)

(assert (=> b!290079 m!423717))

(declare-fun m!423719 () Bool)

(assert (=> start!64618 m!423719))

(declare-fun m!423721 () Bool)

(assert (=> start!64618 m!423721))

(declare-fun m!423723 () Bool)

(assert (=> b!290082 m!423723))

(push 1)

(assert (not start!64618))

(assert (not b!290079))

(assert (not b!290082))

(assert (not b!290078))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

