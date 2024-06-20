; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64562 () Bool)

(assert start!64562)

(declare-fun b!289658 () Bool)

(declare-fun e!206114 () Bool)

(assert (=> b!289658 (= e!206114 (not true))))

(declare-datatypes ((array!17151 0))(
  ( (array!17152 (arr!8421 (Array (_ BitVec 32) (_ BitVec 8))) (size!7419 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17151)

(declare-fun lt!420072 () array!17151)

(declare-fun from!505 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!17151 array!17151 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!289658 (arrayBitRangesEq!0 arr!273 lt!420072 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((Unit!20079 0))(
  ( (Unit!20080) )
))
(declare-fun lt!420069 () Unit!20079)

(declare-datatypes ((BitStream!12848 0))(
  ( (BitStream!12849 (buf!7485 array!17151) (currentByte!13892 (_ BitVec 32)) (currentBit!13887 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!22712 0))(
  ( (tuple2!22713 (_1!12561 Bool) (_2!12561 BitStream!12848)) )
))
(declare-fun lt!420071 () tuple2!22712)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17151 (_ BitVec 64) Bool) Unit!20079)

(assert (=> b!289658 (= lt!420069 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12561 lt!420071)))))

(declare-fun e!206116 () Bool)

(assert (=> b!289658 e!206116))

(declare-fun res!239320 () Bool)

(assert (=> b!289658 (=> (not res!239320) (not e!206116))))

(declare-datatypes ((tuple3!1582 0))(
  ( (tuple3!1583 (_1!12562 Unit!20079) (_2!12562 BitStream!12848) (_3!1205 array!17151)) )
))
(declare-fun lt!420067 () tuple3!1582)

(declare-fun thiss!1728 () BitStream!12848)

(declare-fun to!474 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!289658 (= res!239320 (= (bvsub (bvadd (bitIndex!0 (size!7419 (buf!7485 thiss!1728)) (currentByte!13892 thiss!1728) (currentBit!13887 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7419 (buf!7485 (_2!12562 lt!420067))) (currentByte!13892 (_2!12562 lt!420067)) (currentBit!13887 (_2!12562 lt!420067)))))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun readBitsLoop!0 (BitStream!12848 (_ BitVec 64) array!17151 (_ BitVec 64) (_ BitVec 64)) tuple3!1582)

(assert (=> b!289658 (= lt!420067 (readBitsLoop!0 (_2!12561 lt!420071) nBits!523 lt!420072 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!289658 (validate_offset_bits!1 ((_ sign_extend 32) (size!7419 (buf!7485 (_2!12561 lt!420071)))) ((_ sign_extend 32) (currentByte!13892 (_2!12561 lt!420071))) ((_ sign_extend 32) (currentBit!13887 (_2!12561 lt!420071))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420066 () Unit!20079)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12848 BitStream!12848 (_ BitVec 64) (_ BitVec 64)) Unit!20079)

(assert (=> b!289658 (= lt!420066 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12561 lt!420071) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420068 () (_ BitVec 32))

(declare-fun lt!420070 () (_ BitVec 32))

(assert (=> b!289658 (= lt!420072 (array!17152 (store (arr!8421 arr!273) lt!420068 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8421 arr!273) lt!420068)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420070)))) ((_ sign_extend 24) (ite (_1!12561 lt!420071) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420070) #b00000000))))) (size!7419 arr!273)))))

(assert (=> b!289658 (= lt!420070 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!289658 (= lt!420068 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!12848) tuple2!22712)

(assert (=> b!289658 (= lt!420071 (readBit!0 thiss!1728))))

(declare-fun b!289659 () Bool)

(declare-fun res!239321 () Bool)

(assert (=> b!289659 (=> (not res!239321) (not e!206114))))

(assert (=> b!289659 (= res!239321 (validate_offset_bits!1 ((_ sign_extend 32) (size!7419 (buf!7485 thiss!1728))) ((_ sign_extend 32) (currentByte!13892 thiss!1728)) ((_ sign_extend 32) (currentBit!13887 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!289661 () Bool)

(declare-fun res!239318 () Bool)

(assert (=> b!289661 (=> (not res!239318) (not e!206114))))

(assert (=> b!289661 (= res!239318 (bvslt from!505 to!474))))

(declare-fun b!289662 () Bool)

(assert (=> b!289662 (= e!206116 (and (= (buf!7485 thiss!1728) (buf!7485 (_2!12562 lt!420067))) (= (size!7419 arr!273) (size!7419 (_3!1205 lt!420067)))))))

(declare-fun res!239319 () Bool)

(assert (=> start!64562 (=> (not res!239319) (not e!206114))))

(assert (=> start!64562 (= res!239319 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7419 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64562 e!206114))

(declare-fun e!206118 () Bool)

(declare-fun inv!12 (BitStream!12848) Bool)

(assert (=> start!64562 (and (inv!12 thiss!1728) e!206118)))

(assert (=> start!64562 true))

(declare-fun array_inv!7031 (array!17151) Bool)

(assert (=> start!64562 (array_inv!7031 arr!273)))

(declare-fun b!289660 () Bool)

(assert (=> b!289660 (= e!206118 (array_inv!7031 (buf!7485 thiss!1728)))))

(assert (= (and start!64562 res!239319) b!289659))

(assert (= (and b!289659 res!239321) b!289661))

(assert (= (and b!289661 res!239318) b!289658))

(assert (= (and b!289658 res!239320) b!289662))

(assert (= start!64562 b!289660))

(declare-fun m!422791 () Bool)

(assert (=> b!289658 m!422791))

(declare-fun m!422793 () Bool)

(assert (=> b!289658 m!422793))

(declare-fun m!422795 () Bool)

(assert (=> b!289658 m!422795))

(declare-fun m!422797 () Bool)

(assert (=> b!289658 m!422797))

(declare-fun m!422799 () Bool)

(assert (=> b!289658 m!422799))

(declare-fun m!422801 () Bool)

(assert (=> b!289658 m!422801))

(declare-fun m!422803 () Bool)

(assert (=> b!289658 m!422803))

(declare-fun m!422805 () Bool)

(assert (=> b!289658 m!422805))

(declare-fun m!422807 () Bool)

(assert (=> b!289658 m!422807))

(declare-fun m!422809 () Bool)

(assert (=> b!289658 m!422809))

(declare-fun m!422811 () Bool)

(assert (=> b!289658 m!422811))

(declare-fun m!422813 () Bool)

(assert (=> b!289659 m!422813))

(declare-fun m!422815 () Bool)

(assert (=> start!64562 m!422815))

(declare-fun m!422817 () Bool)

(assert (=> start!64562 m!422817))

(declare-fun m!422819 () Bool)

(assert (=> b!289660 m!422819))

(push 1)

(assert (not b!289660))

(assert (not b!289659))

(assert (not b!289658))

(assert (not start!64562))

(check-sat)

