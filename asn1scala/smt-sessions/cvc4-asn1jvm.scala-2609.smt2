; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64574 () Bool)

(assert start!64574)

(declare-fun b!289748 () Bool)

(declare-fun e!206206 () Bool)

(assert (=> b!289748 (= e!206206 (not true))))

(declare-datatypes ((array!17163 0))(
  ( (array!17164 (arr!8427 (Array (_ BitVec 32) (_ BitVec 8))) (size!7425 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17163)

(declare-fun lt!420195 () array!17163)

(declare-fun from!505 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!17163 array!17163 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!289748 (arrayBitRangesEq!0 arr!273 lt!420195 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((Unit!20091 0))(
  ( (Unit!20092) )
))
(declare-fun lt!420197 () Unit!20091)

(declare-datatypes ((BitStream!12860 0))(
  ( (BitStream!12861 (buf!7491 array!17163) (currentByte!13898 (_ BitVec 32)) (currentBit!13893 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!22724 0))(
  ( (tuple2!22725 (_1!12573 Bool) (_2!12573 BitStream!12860)) )
))
(declare-fun lt!420193 () tuple2!22724)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17163 (_ BitVec 64) Bool) Unit!20091)

(assert (=> b!289748 (= lt!420197 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12573 lt!420193)))))

(declare-fun e!206205 () Bool)

(assert (=> b!289748 e!206205))

(declare-fun res!239390 () Bool)

(assert (=> b!289748 (=> (not res!239390) (not e!206205))))

(declare-fun thiss!1728 () BitStream!12860)

(declare-datatypes ((tuple3!1594 0))(
  ( (tuple3!1595 (_1!12574 Unit!20091) (_2!12574 BitStream!12860) (_3!1211 array!17163)) )
))
(declare-fun lt!420194 () tuple3!1594)

(declare-fun to!474 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!289748 (= res!239390 (= (bvsub (bvadd (bitIndex!0 (size!7425 (buf!7491 thiss!1728)) (currentByte!13898 thiss!1728) (currentBit!13893 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7425 (buf!7491 (_2!12574 lt!420194))) (currentByte!13898 (_2!12574 lt!420194)) (currentBit!13893 (_2!12574 lt!420194)))))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun readBitsLoop!0 (BitStream!12860 (_ BitVec 64) array!17163 (_ BitVec 64) (_ BitVec 64)) tuple3!1594)

(assert (=> b!289748 (= lt!420194 (readBitsLoop!0 (_2!12573 lt!420193) nBits!523 lt!420195 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!289748 (validate_offset_bits!1 ((_ sign_extend 32) (size!7425 (buf!7491 (_2!12573 lt!420193)))) ((_ sign_extend 32) (currentByte!13898 (_2!12573 lt!420193))) ((_ sign_extend 32) (currentBit!13893 (_2!12573 lt!420193))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420192 () Unit!20091)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12860 BitStream!12860 (_ BitVec 64) (_ BitVec 64)) Unit!20091)

(assert (=> b!289748 (= lt!420192 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12573 lt!420193) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420198 () (_ BitVec 32))

(declare-fun lt!420196 () (_ BitVec 32))

(assert (=> b!289748 (= lt!420195 (array!17164 (store (arr!8427 arr!273) lt!420196 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8427 arr!273) lt!420196)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420198)))) ((_ sign_extend 24) (ite (_1!12573 lt!420193) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420198) #b00000000))))) (size!7425 arr!273)))))

(assert (=> b!289748 (= lt!420198 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!289748 (= lt!420196 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!12860) tuple2!22724)

(assert (=> b!289748 (= lt!420193 (readBit!0 thiss!1728))))

(declare-fun res!239391 () Bool)

(assert (=> start!64574 (=> (not res!239391) (not e!206206))))

(assert (=> start!64574 (= res!239391 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7425 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64574 e!206206))

(declare-fun e!206207 () Bool)

(declare-fun inv!12 (BitStream!12860) Bool)

(assert (=> start!64574 (and (inv!12 thiss!1728) e!206207)))

(assert (=> start!64574 true))

(declare-fun array_inv!7037 (array!17163) Bool)

(assert (=> start!64574 (array_inv!7037 arr!273)))

(declare-fun b!289749 () Bool)

(assert (=> b!289749 (= e!206207 (array_inv!7037 (buf!7491 thiss!1728)))))

(declare-fun b!289750 () Bool)

(declare-fun res!239392 () Bool)

(assert (=> b!289750 (=> (not res!239392) (not e!206206))))

(assert (=> b!289750 (= res!239392 (validate_offset_bits!1 ((_ sign_extend 32) (size!7425 (buf!7491 thiss!1728))) ((_ sign_extend 32) (currentByte!13898 thiss!1728)) ((_ sign_extend 32) (currentBit!13893 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!289751 () Bool)

(declare-fun res!239393 () Bool)

(assert (=> b!289751 (=> (not res!239393) (not e!206206))))

(assert (=> b!289751 (= res!239393 (bvslt from!505 to!474))))

(declare-fun b!289752 () Bool)

(assert (=> b!289752 (= e!206205 (and (= (buf!7491 thiss!1728) (buf!7491 (_2!12574 lt!420194))) (= (size!7425 arr!273) (size!7425 (_3!1211 lt!420194)))))))

(assert (= (and start!64574 res!239391) b!289750))

(assert (= (and b!289750 res!239392) b!289751))

(assert (= (and b!289751 res!239393) b!289748))

(assert (= (and b!289748 res!239390) b!289752))

(assert (= start!64574 b!289749))

(declare-fun m!422971 () Bool)

(assert (=> b!289748 m!422971))

(declare-fun m!422973 () Bool)

(assert (=> b!289748 m!422973))

(declare-fun m!422975 () Bool)

(assert (=> b!289748 m!422975))

(declare-fun m!422977 () Bool)

(assert (=> b!289748 m!422977))

(declare-fun m!422979 () Bool)

(assert (=> b!289748 m!422979))

(declare-fun m!422981 () Bool)

(assert (=> b!289748 m!422981))

(declare-fun m!422983 () Bool)

(assert (=> b!289748 m!422983))

(declare-fun m!422985 () Bool)

(assert (=> b!289748 m!422985))

(declare-fun m!422987 () Bool)

(assert (=> b!289748 m!422987))

(declare-fun m!422989 () Bool)

(assert (=> b!289748 m!422989))

(declare-fun m!422991 () Bool)

(assert (=> b!289748 m!422991))

(declare-fun m!422993 () Bool)

(assert (=> start!64574 m!422993))

(declare-fun m!422995 () Bool)

(assert (=> start!64574 m!422995))

(declare-fun m!422997 () Bool)

(assert (=> b!289749 m!422997))

(declare-fun m!422999 () Bool)

(assert (=> b!289750 m!422999))

(push 1)

(assert (not b!289749))

(assert (not start!64574))

(assert (not b!289748))

(assert (not b!289750))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

