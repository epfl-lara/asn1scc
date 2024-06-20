; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64624 () Bool)

(assert start!64624)

(declare-fun b!290123 () Bool)

(declare-fun res!239693 () Bool)

(declare-fun e!206583 () Bool)

(assert (=> b!290123 (=> (not res!239693) (not e!206583))))

(declare-datatypes ((array!17213 0))(
  ( (array!17214 (arr!8452 (Array (_ BitVec 32) (_ BitVec 8))) (size!7450 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12910 0))(
  ( (BitStream!12911 (buf!7516 array!17213) (currentByte!13923 (_ BitVec 32)) (currentBit!13918 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12910)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!290123 (= res!239693 (validate_offset_bits!1 ((_ sign_extend 32) (size!7450 (buf!7516 thiss!1728))) ((_ sign_extend 32) (currentByte!13923 thiss!1728)) ((_ sign_extend 32) (currentBit!13918 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!290124 () Bool)

(declare-datatypes ((Unit!20141 0))(
  ( (Unit!20142) )
))
(declare-datatypes ((tuple3!1644 0))(
  ( (tuple3!1645 (_1!12623 Unit!20141) (_2!12623 BitStream!12910) (_3!1236 array!17213)) )
))
(declare-fun lt!420773 () tuple3!1644)

(declare-fun e!206580 () Bool)

(declare-fun arr!273 () array!17213)

(assert (=> b!290124 (= e!206580 (and (= (buf!7516 thiss!1728) (buf!7516 (_2!12623 lt!420773))) (= (size!7450 arr!273) (size!7450 (_3!1236 lt!420773)))))))

(declare-fun b!290125 () Bool)

(assert (=> b!290125 (= e!206583 (not true))))

(declare-fun arrayBitRangesEq!0 (array!17213 array!17213 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!290125 (arrayBitRangesEq!0 arr!273 (_3!1236 lt!420773) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!420778 () Unit!20141)

(declare-fun lt!420779 () array!17213)

(declare-fun arrayBitRangesEqTransitive!0 (array!17213 array!17213 array!17213 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20141)

(assert (=> b!290125 (= lt!420778 (arrayBitRangesEqTransitive!0 arr!273 lt!420779 (_3!1236 lt!420773) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!290125 (arrayBitRangesEq!0 arr!273 lt!420779 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((tuple2!22774 0))(
  ( (tuple2!22775 (_1!12624 Bool) (_2!12624 BitStream!12910)) )
))
(declare-fun lt!420777 () tuple2!22774)

(declare-fun lt!420780 () Unit!20141)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17213 (_ BitVec 64) Bool) Unit!20141)

(assert (=> b!290125 (= lt!420780 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12624 lt!420777)))))

(assert (=> b!290125 e!206580))

(declare-fun res!239692 () Bool)

(assert (=> b!290125 (=> (not res!239692) (not e!206580))))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!290125 (= res!239692 (= (bvsub (bvadd (bitIndex!0 (size!7450 (buf!7516 thiss!1728)) (currentByte!13923 thiss!1728) (currentBit!13918 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7450 (buf!7516 (_2!12623 lt!420773))) (currentByte!13923 (_2!12623 lt!420773)) (currentBit!13918 (_2!12623 lt!420773)))))))

(declare-fun readBitsLoop!0 (BitStream!12910 (_ BitVec 64) array!17213 (_ BitVec 64) (_ BitVec 64)) tuple3!1644)

(assert (=> b!290125 (= lt!420773 (readBitsLoop!0 (_2!12624 lt!420777) nBits!523 lt!420779 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!290125 (validate_offset_bits!1 ((_ sign_extend 32) (size!7450 (buf!7516 (_2!12624 lt!420777)))) ((_ sign_extend 32) (currentByte!13923 (_2!12624 lt!420777))) ((_ sign_extend 32) (currentBit!13918 (_2!12624 lt!420777))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420775 () Unit!20141)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12910 BitStream!12910 (_ BitVec 64) (_ BitVec 64)) Unit!20141)

(assert (=> b!290125 (= lt!420775 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12624 lt!420777) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420774 () (_ BitVec 32))

(declare-fun lt!420776 () (_ BitVec 32))

(assert (=> b!290125 (= lt!420779 (array!17214 (store (arr!8452 arr!273) lt!420774 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8452 arr!273) lt!420774)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420776)))) ((_ sign_extend 24) (ite (_1!12624 lt!420777) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420776) #b00000000))))) (size!7450 arr!273)))))

(assert (=> b!290125 (= lt!420776 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!290125 (= lt!420774 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!12910) tuple2!22774)

(assert (=> b!290125 (= lt!420777 (readBit!0 thiss!1728))))

(declare-fun b!290126 () Bool)

(declare-fun res!239690 () Bool)

(assert (=> b!290126 (=> (not res!239690) (not e!206583))))

(assert (=> b!290126 (= res!239690 (bvslt from!505 to!474))))

(declare-fun res!239691 () Bool)

(assert (=> start!64624 (=> (not res!239691) (not e!206583))))

(assert (=> start!64624 (= res!239691 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7450 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64624 e!206583))

(declare-fun e!206579 () Bool)

(declare-fun inv!12 (BitStream!12910) Bool)

(assert (=> start!64624 (and (inv!12 thiss!1728) e!206579)))

(assert (=> start!64624 true))

(declare-fun array_inv!7062 (array!17213) Bool)

(assert (=> start!64624 (array_inv!7062 arr!273)))

(declare-fun b!290127 () Bool)

(assert (=> b!290127 (= e!206579 (array_inv!7062 (buf!7516 thiss!1728)))))

(assert (= (and start!64624 res!239691) b!290123))

(assert (= (and b!290123 res!239693) b!290126))

(assert (= (and b!290126 res!239690) b!290125))

(assert (= (and b!290125 res!239692) b!290124))

(assert (= start!64624 b!290127))

(declare-fun m!423793 () Bool)

(assert (=> b!290123 m!423793))

(declare-fun m!423795 () Bool)

(assert (=> b!290125 m!423795))

(declare-fun m!423797 () Bool)

(assert (=> b!290125 m!423797))

(declare-fun m!423799 () Bool)

(assert (=> b!290125 m!423799))

(declare-fun m!423801 () Bool)

(assert (=> b!290125 m!423801))

(declare-fun m!423803 () Bool)

(assert (=> b!290125 m!423803))

(declare-fun m!423805 () Bool)

(assert (=> b!290125 m!423805))

(declare-fun m!423807 () Bool)

(assert (=> b!290125 m!423807))

(declare-fun m!423809 () Bool)

(assert (=> b!290125 m!423809))

(declare-fun m!423811 () Bool)

(assert (=> b!290125 m!423811))

(declare-fun m!423813 () Bool)

(assert (=> b!290125 m!423813))

(declare-fun m!423815 () Bool)

(assert (=> b!290125 m!423815))

(declare-fun m!423817 () Bool)

(assert (=> b!290125 m!423817))

(declare-fun m!423819 () Bool)

(assert (=> b!290125 m!423819))

(declare-fun m!423821 () Bool)

(assert (=> start!64624 m!423821))

(declare-fun m!423823 () Bool)

(assert (=> start!64624 m!423823))

(declare-fun m!423825 () Bool)

(assert (=> b!290127 m!423825))

(push 1)

(assert (not b!290123))

(assert (not b!290125))

(assert (not start!64624))

(assert (not b!290127))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

