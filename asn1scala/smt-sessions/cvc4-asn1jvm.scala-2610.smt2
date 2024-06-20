; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64580 () Bool)

(assert start!64580)

(declare-fun b!289793 () Bool)

(declare-fun res!239429 () Bool)

(declare-fun e!206252 () Bool)

(assert (=> b!289793 (=> (not res!239429) (not e!206252))))

(declare-datatypes ((array!17169 0))(
  ( (array!17170 (arr!8430 (Array (_ BitVec 32) (_ BitVec 8))) (size!7428 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12866 0))(
  ( (BitStream!12867 (buf!7494 array!17169) (currentByte!13901 (_ BitVec 32)) (currentBit!13896 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12866)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!289793 (= res!239429 (validate_offset_bits!1 ((_ sign_extend 32) (size!7428 (buf!7494 thiss!1728))) ((_ sign_extend 32) (currentByte!13901 thiss!1728)) ((_ sign_extend 32) (currentBit!13896 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!289794 () Bool)

(declare-fun e!206250 () Bool)

(declare-fun array_inv!7040 (array!17169) Bool)

(assert (=> b!289794 (= e!206250 (array_inv!7040 (buf!7494 thiss!1728)))))

(declare-fun b!289795 () Bool)

(declare-datatypes ((Unit!20097 0))(
  ( (Unit!20098) )
))
(declare-datatypes ((tuple3!1600 0))(
  ( (tuple3!1601 (_1!12579 Unit!20097) (_2!12579 BitStream!12866) (_3!1214 array!17169)) )
))
(declare-fun lt!420259 () tuple3!1600)

(declare-fun e!206251 () Bool)

(declare-fun arr!273 () array!17169)

(assert (=> b!289795 (= e!206251 (and (= (buf!7494 thiss!1728) (buf!7494 (_2!12579 lt!420259))) (= (size!7428 arr!273) (size!7428 (_3!1214 lt!420259)))))))

(declare-fun b!289796 () Bool)

(declare-fun res!239426 () Bool)

(assert (=> b!289796 (=> (not res!239426) (not e!206252))))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!289796 (= res!239426 (bvslt from!505 to!474))))

(declare-fun b!289797 () Bool)

(assert (=> b!289797 (= e!206252 (not true))))

(declare-fun lt!420260 () array!17169)

(declare-fun arrayBitRangesEq!0 (array!17169 array!17169 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!289797 (arrayBitRangesEq!0 arr!273 lt!420260 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((tuple2!22730 0))(
  ( (tuple2!22731 (_1!12580 Bool) (_2!12580 BitStream!12866)) )
))
(declare-fun lt!420255 () tuple2!22730)

(declare-fun lt!420257 () Unit!20097)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17169 (_ BitVec 64) Bool) Unit!20097)

(assert (=> b!289797 (= lt!420257 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12580 lt!420255)))))

(assert (=> b!289797 e!206251))

(declare-fun res!239427 () Bool)

(assert (=> b!289797 (=> (not res!239427) (not e!206251))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!289797 (= res!239427 (= (bvsub (bvadd (bitIndex!0 (size!7428 (buf!7494 thiss!1728)) (currentByte!13901 thiss!1728) (currentBit!13896 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7428 (buf!7494 (_2!12579 lt!420259))) (currentByte!13901 (_2!12579 lt!420259)) (currentBit!13896 (_2!12579 lt!420259)))))))

(declare-fun readBitsLoop!0 (BitStream!12866 (_ BitVec 64) array!17169 (_ BitVec 64) (_ BitVec 64)) tuple3!1600)

(assert (=> b!289797 (= lt!420259 (readBitsLoop!0 (_2!12580 lt!420255) nBits!523 lt!420260 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!289797 (validate_offset_bits!1 ((_ sign_extend 32) (size!7428 (buf!7494 (_2!12580 lt!420255)))) ((_ sign_extend 32) (currentByte!13901 (_2!12580 lt!420255))) ((_ sign_extend 32) (currentBit!13896 (_2!12580 lt!420255))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420258 () Unit!20097)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12866 BitStream!12866 (_ BitVec 64) (_ BitVec 64)) Unit!20097)

(assert (=> b!289797 (= lt!420258 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12580 lt!420255) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420256 () (_ BitVec 32))

(declare-fun lt!420261 () (_ BitVec 32))

(assert (=> b!289797 (= lt!420260 (array!17170 (store (arr!8430 arr!273) lt!420256 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8430 arr!273) lt!420256)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420261)))) ((_ sign_extend 24) (ite (_1!12580 lt!420255) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420261) #b00000000))))) (size!7428 arr!273)))))

(assert (=> b!289797 (= lt!420261 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!289797 (= lt!420256 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!12866) tuple2!22730)

(assert (=> b!289797 (= lt!420255 (readBit!0 thiss!1728))))

(declare-fun res!239428 () Bool)

(assert (=> start!64580 (=> (not res!239428) (not e!206252))))

(assert (=> start!64580 (= res!239428 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7428 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64580 e!206252))

(declare-fun inv!12 (BitStream!12866) Bool)

(assert (=> start!64580 (and (inv!12 thiss!1728) e!206250)))

(assert (=> start!64580 true))

(assert (=> start!64580 (array_inv!7040 arr!273)))

(assert (= (and start!64580 res!239428) b!289793))

(assert (= (and b!289793 res!239429) b!289796))

(assert (= (and b!289796 res!239426) b!289797))

(assert (= (and b!289797 res!239427) b!289795))

(assert (= start!64580 b!289794))

(declare-fun m!423061 () Bool)

(assert (=> b!289793 m!423061))

(declare-fun m!423063 () Bool)

(assert (=> b!289794 m!423063))

(declare-fun m!423065 () Bool)

(assert (=> b!289797 m!423065))

(declare-fun m!423067 () Bool)

(assert (=> b!289797 m!423067))

(declare-fun m!423069 () Bool)

(assert (=> b!289797 m!423069))

(declare-fun m!423071 () Bool)

(assert (=> b!289797 m!423071))

(declare-fun m!423073 () Bool)

(assert (=> b!289797 m!423073))

(declare-fun m!423075 () Bool)

(assert (=> b!289797 m!423075))

(declare-fun m!423077 () Bool)

(assert (=> b!289797 m!423077))

(declare-fun m!423079 () Bool)

(assert (=> b!289797 m!423079))

(declare-fun m!423081 () Bool)

(assert (=> b!289797 m!423081))

(declare-fun m!423083 () Bool)

(assert (=> b!289797 m!423083))

(declare-fun m!423085 () Bool)

(assert (=> b!289797 m!423085))

(declare-fun m!423087 () Bool)

(assert (=> start!64580 m!423087))

(declare-fun m!423089 () Bool)

(assert (=> start!64580 m!423089))

(push 1)

(assert (not b!289793))

(assert (not b!289794))

(assert (not start!64580))

(assert (not b!289797))

(check-sat)

