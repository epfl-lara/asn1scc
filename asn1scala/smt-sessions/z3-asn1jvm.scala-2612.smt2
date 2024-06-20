; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64590 () Bool)

(assert start!64590)

(declare-datatypes ((array!17179 0))(
  ( (array!17180 (arr!8435 (Array (_ BitVec 32) (_ BitVec 8))) (size!7433 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12876 0))(
  ( (BitStream!12877 (buf!7499 array!17179) (currentByte!13906 (_ BitVec 32)) (currentBit!13901 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12876)

(declare-datatypes ((Unit!20107 0))(
  ( (Unit!20108) )
))
(declare-datatypes ((tuple3!1610 0))(
  ( (tuple3!1611 (_1!12589 Unit!20107) (_2!12589 BitStream!12876) (_3!1219 array!17179)) )
))
(declare-fun lt!420367 () tuple3!1610)

(declare-fun e!206326 () Bool)

(declare-fun b!289868 () Bool)

(declare-fun arr!273 () array!17179)

(assert (=> b!289868 (= e!206326 (and (= (buf!7499 thiss!1728) (buf!7499 (_2!12589 lt!420367))) (= (size!7433 arr!273) (size!7433 (_3!1219 lt!420367)))))))

(declare-fun res!239486 () Bool)

(declare-fun e!206324 () Bool)

(assert (=> start!64590 (=> (not res!239486) (not e!206324))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(assert (=> start!64590 (= res!239486 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7433 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64590 e!206324))

(declare-fun e!206328 () Bool)

(declare-fun inv!12 (BitStream!12876) Bool)

(assert (=> start!64590 (and (inv!12 thiss!1728) e!206328)))

(assert (=> start!64590 true))

(declare-fun array_inv!7045 (array!17179) Bool)

(assert (=> start!64590 (array_inv!7045 arr!273)))

(declare-fun b!289869 () Bool)

(declare-fun res!239489 () Bool)

(assert (=> b!289869 (=> (not res!239489) (not e!206324))))

(assert (=> b!289869 (= res!239489 (bvslt from!505 to!474))))

(declare-fun b!289870 () Bool)

(declare-fun res!239487 () Bool)

(assert (=> b!289870 (=> (not res!239487) (not e!206324))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!289870 (= res!239487 (validate_offset_bits!1 ((_ sign_extend 32) (size!7433 (buf!7499 thiss!1728))) ((_ sign_extend 32) (currentByte!13906 thiss!1728)) ((_ sign_extend 32) (currentBit!13901 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!289871 () Bool)

(assert (=> b!289871 (= e!206324 (not true))))

(declare-fun arrayBitRangesEq!0 (array!17179 array!17179 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!289871 (arrayBitRangesEq!0 arr!273 (_3!1219 lt!420367) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!420368 () array!17179)

(declare-fun lt!420369 () Unit!20107)

(declare-fun arrayBitRangesEqTransitive!0 (array!17179 array!17179 array!17179 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20107)

(assert (=> b!289871 (= lt!420369 (arrayBitRangesEqTransitive!0 arr!273 lt!420368 (_3!1219 lt!420367) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!289871 (arrayBitRangesEq!0 arr!273 lt!420368 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!420365 () Unit!20107)

(declare-datatypes ((tuple2!22740 0))(
  ( (tuple2!22741 (_1!12590 Bool) (_2!12590 BitStream!12876)) )
))
(declare-fun lt!420366 () tuple2!22740)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17179 (_ BitVec 64) Bool) Unit!20107)

(assert (=> b!289871 (= lt!420365 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12590 lt!420366)))))

(assert (=> b!289871 e!206326))

(declare-fun res!239488 () Bool)

(assert (=> b!289871 (=> (not res!239488) (not e!206326))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!289871 (= res!239488 (= (bvsub (bvadd (bitIndex!0 (size!7433 (buf!7499 thiss!1728)) (currentByte!13906 thiss!1728) (currentBit!13901 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7433 (buf!7499 (_2!12589 lt!420367))) (currentByte!13906 (_2!12589 lt!420367)) (currentBit!13901 (_2!12589 lt!420367)))))))

(declare-fun readBitsLoop!0 (BitStream!12876 (_ BitVec 64) array!17179 (_ BitVec 64) (_ BitVec 64)) tuple3!1610)

(assert (=> b!289871 (= lt!420367 (readBitsLoop!0 (_2!12590 lt!420366) nBits!523 lt!420368 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!289871 (validate_offset_bits!1 ((_ sign_extend 32) (size!7433 (buf!7499 (_2!12590 lt!420366)))) ((_ sign_extend 32) (currentByte!13906 (_2!12590 lt!420366))) ((_ sign_extend 32) (currentBit!13901 (_2!12590 lt!420366))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420372 () Unit!20107)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12876 BitStream!12876 (_ BitVec 64) (_ BitVec 64)) Unit!20107)

(assert (=> b!289871 (= lt!420372 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12590 lt!420366) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420371 () (_ BitVec 32))

(declare-fun lt!420370 () (_ BitVec 32))

(assert (=> b!289871 (= lt!420368 (array!17180 (store (arr!8435 arr!273) lt!420371 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8435 arr!273) lt!420371)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420370)))) ((_ sign_extend 24) (ite (_1!12590 lt!420366) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420370) #b00000000))))) (size!7433 arr!273)))))

(assert (=> b!289871 (= lt!420370 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!289871 (= lt!420371 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!12876) tuple2!22740)

(assert (=> b!289871 (= lt!420366 (readBit!0 thiss!1728))))

(declare-fun b!289872 () Bool)

(assert (=> b!289872 (= e!206328 (array_inv!7045 (buf!7499 thiss!1728)))))

(assert (= (and start!64590 res!239486) b!289870))

(assert (= (and b!289870 res!239487) b!289869))

(assert (= (and b!289869 res!239489) b!289871))

(assert (= (and b!289871 res!239488) b!289868))

(assert (= start!64590 b!289872))

(declare-fun m!423215 () Bool)

(assert (=> start!64590 m!423215))

(declare-fun m!423217 () Bool)

(assert (=> start!64590 m!423217))

(declare-fun m!423219 () Bool)

(assert (=> b!289870 m!423219))

(declare-fun m!423221 () Bool)

(assert (=> b!289871 m!423221))

(declare-fun m!423223 () Bool)

(assert (=> b!289871 m!423223))

(declare-fun m!423225 () Bool)

(assert (=> b!289871 m!423225))

(declare-fun m!423227 () Bool)

(assert (=> b!289871 m!423227))

(declare-fun m!423229 () Bool)

(assert (=> b!289871 m!423229))

(declare-fun m!423231 () Bool)

(assert (=> b!289871 m!423231))

(declare-fun m!423233 () Bool)

(assert (=> b!289871 m!423233))

(declare-fun m!423235 () Bool)

(assert (=> b!289871 m!423235))

(declare-fun m!423237 () Bool)

(assert (=> b!289871 m!423237))

(declare-fun m!423239 () Bool)

(assert (=> b!289871 m!423239))

(declare-fun m!423241 () Bool)

(assert (=> b!289871 m!423241))

(declare-fun m!423243 () Bool)

(assert (=> b!289871 m!423243))

(declare-fun m!423245 () Bool)

(assert (=> b!289871 m!423245))

(declare-fun m!423247 () Bool)

(assert (=> b!289872 m!423247))

(check-sat (not b!289872) (not b!289871) (not b!289870) (not start!64590))
