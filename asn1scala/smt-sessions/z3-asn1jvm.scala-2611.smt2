; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64584 () Bool)

(assert start!64584)

(declare-fun b!289823 () Bool)

(declare-fun e!206282 () Bool)

(assert (=> b!289823 (= e!206282 (not true))))

(declare-datatypes ((array!17173 0))(
  ( (array!17174 (arr!8432 (Array (_ BitVec 32) (_ BitVec 8))) (size!7430 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17173)

(declare-fun lt!420302 () array!17173)

(declare-fun from!505 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!17173 array!17173 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!289823 (arrayBitRangesEq!0 arr!273 lt!420302 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((BitStream!12870 0))(
  ( (BitStream!12871 (buf!7496 array!17173) (currentByte!13903 (_ BitVec 32)) (currentBit!13898 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!22734 0))(
  ( (tuple2!22735 (_1!12583 Bool) (_2!12583 BitStream!12870)) )
))
(declare-fun lt!420303 () tuple2!22734)

(declare-datatypes ((Unit!20101 0))(
  ( (Unit!20102) )
))
(declare-fun lt!420297 () Unit!20101)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17173 (_ BitVec 64) Bool) Unit!20101)

(assert (=> b!289823 (= lt!420297 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12583 lt!420303)))))

(declare-fun e!206283 () Bool)

(assert (=> b!289823 e!206283))

(declare-fun res!239450 () Bool)

(assert (=> b!289823 (=> (not res!239450) (not e!206283))))

(declare-fun thiss!1728 () BitStream!12870)

(declare-datatypes ((tuple3!1604 0))(
  ( (tuple3!1605 (_1!12584 Unit!20101) (_2!12584 BitStream!12870) (_3!1216 array!17173)) )
))
(declare-fun lt!420298 () tuple3!1604)

(declare-fun to!474 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!289823 (= res!239450 (= (bvsub (bvadd (bitIndex!0 (size!7430 (buf!7496 thiss!1728)) (currentByte!13903 thiss!1728) (currentBit!13898 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7430 (buf!7496 (_2!12584 lt!420298))) (currentByte!13903 (_2!12584 lt!420298)) (currentBit!13898 (_2!12584 lt!420298)))))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun readBitsLoop!0 (BitStream!12870 (_ BitVec 64) array!17173 (_ BitVec 64) (_ BitVec 64)) tuple3!1604)

(assert (=> b!289823 (= lt!420298 (readBitsLoop!0 (_2!12583 lt!420303) nBits!523 lt!420302 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!289823 (validate_offset_bits!1 ((_ sign_extend 32) (size!7430 (buf!7496 (_2!12583 lt!420303)))) ((_ sign_extend 32) (currentByte!13903 (_2!12583 lt!420303))) ((_ sign_extend 32) (currentBit!13898 (_2!12583 lt!420303))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420300 () Unit!20101)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12870 BitStream!12870 (_ BitVec 64) (_ BitVec 64)) Unit!20101)

(assert (=> b!289823 (= lt!420300 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12583 lt!420303) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420299 () (_ BitVec 32))

(declare-fun lt!420301 () (_ BitVec 32))

(assert (=> b!289823 (= lt!420302 (array!17174 (store (arr!8432 arr!273) lt!420299 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8432 arr!273) lt!420299)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420301)))) ((_ sign_extend 24) (ite (_1!12583 lt!420303) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420301) #b00000000))))) (size!7430 arr!273)))))

(assert (=> b!289823 (= lt!420301 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!289823 (= lt!420299 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!12870) tuple2!22734)

(assert (=> b!289823 (= lt!420303 (readBit!0 thiss!1728))))

(declare-fun b!289824 () Bool)

(declare-fun res!239452 () Bool)

(assert (=> b!289824 (=> (not res!239452) (not e!206282))))

(assert (=> b!289824 (= res!239452 (validate_offset_bits!1 ((_ sign_extend 32) (size!7430 (buf!7496 thiss!1728))) ((_ sign_extend 32) (currentByte!13903 thiss!1728)) ((_ sign_extend 32) (currentBit!13898 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!289825 () Bool)

(declare-fun res!239453 () Bool)

(assert (=> b!289825 (=> (not res!239453) (not e!206282))))

(assert (=> b!289825 (= res!239453 (bvslt from!505 to!474))))

(declare-fun b!289826 () Bool)

(declare-fun e!206281 () Bool)

(declare-fun array_inv!7042 (array!17173) Bool)

(assert (=> b!289826 (= e!206281 (array_inv!7042 (buf!7496 thiss!1728)))))

(declare-fun res!239451 () Bool)

(assert (=> start!64584 (=> (not res!239451) (not e!206282))))

(assert (=> start!64584 (= res!239451 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7430 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64584 e!206282))

(declare-fun inv!12 (BitStream!12870) Bool)

(assert (=> start!64584 (and (inv!12 thiss!1728) e!206281)))

(assert (=> start!64584 true))

(assert (=> start!64584 (array_inv!7042 arr!273)))

(declare-fun b!289827 () Bool)

(assert (=> b!289827 (= e!206283 (and (= (buf!7496 thiss!1728) (buf!7496 (_2!12584 lt!420298))) (= (size!7430 arr!273) (size!7430 (_3!1216 lt!420298)))))))

(assert (= (and start!64584 res!239451) b!289824))

(assert (= (and b!289824 res!239452) b!289825))

(assert (= (and b!289825 res!239453) b!289823))

(assert (= (and b!289823 res!239450) b!289827))

(assert (= start!64584 b!289826))

(declare-fun m!423121 () Bool)

(assert (=> b!289823 m!423121))

(declare-fun m!423123 () Bool)

(assert (=> b!289823 m!423123))

(declare-fun m!423125 () Bool)

(assert (=> b!289823 m!423125))

(declare-fun m!423127 () Bool)

(assert (=> b!289823 m!423127))

(declare-fun m!423129 () Bool)

(assert (=> b!289823 m!423129))

(declare-fun m!423131 () Bool)

(assert (=> b!289823 m!423131))

(declare-fun m!423133 () Bool)

(assert (=> b!289823 m!423133))

(declare-fun m!423135 () Bool)

(assert (=> b!289823 m!423135))

(declare-fun m!423137 () Bool)

(assert (=> b!289823 m!423137))

(declare-fun m!423139 () Bool)

(assert (=> b!289823 m!423139))

(declare-fun m!423141 () Bool)

(assert (=> b!289823 m!423141))

(declare-fun m!423143 () Bool)

(assert (=> b!289824 m!423143))

(declare-fun m!423145 () Bool)

(assert (=> b!289826 m!423145))

(declare-fun m!423147 () Bool)

(assert (=> start!64584 m!423147))

(declare-fun m!423149 () Bool)

(assert (=> start!64584 m!423149))

(check-sat (not b!289824) (not b!289823) (not start!64584) (not b!289826))
