; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65704 () Bool)

(assert start!65704)

(declare-fun b!294641 () Bool)

(declare-fun res!243293 () Bool)

(declare-fun e!210603 () Bool)

(assert (=> b!294641 (=> (not res!243293) (not e!210603))))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!294641 (= res!243293 (bvslt from!505 to!474))))

(declare-fun b!294642 () Bool)

(declare-fun e!210602 () Bool)

(declare-datatypes ((array!17636 0))(
  ( (array!17637 (arr!8680 (Array (_ BitVec 32) (_ BitVec 8))) (size!7642 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13288 0))(
  ( (BitStream!13289 (buf!7705 array!17636) (currentByte!14202 (_ BitVec 32)) (currentBit!14197 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13288)

(declare-fun array_inv!7254 (array!17636) Bool)

(assert (=> b!294642 (= e!210602 (array_inv!7254 (buf!7705 thiss!1728)))))

(declare-fun res!243292 () Bool)

(assert (=> start!65704 (=> (not res!243292) (not e!210603))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun arr!273 () array!17636)

(assert (=> start!65704 (= res!243292 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7642 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65704 e!210603))

(declare-fun inv!12 (BitStream!13288) Bool)

(assert (=> start!65704 (and (inv!12 thiss!1728) e!210602)))

(assert (=> start!65704 true))

(assert (=> start!65704 (array_inv!7254 arr!273)))

(declare-fun b!294643 () Bool)

(declare-fun res!243290 () Bool)

(assert (=> b!294643 (=> (not res!243290) (not e!210603))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!294643 (= res!243290 (validate_offset_bits!1 ((_ sign_extend 32) (size!7642 (buf!7705 thiss!1728))) ((_ sign_extend 32) (currentByte!14202 thiss!1728)) ((_ sign_extend 32) (currentBit!14197 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!294644 () Bool)

(assert (=> b!294644 (= e!210603 (not true))))

(declare-datatypes ((Unit!20521 0))(
  ( (Unit!20522) )
))
(declare-datatypes ((tuple3!1800 0))(
  ( (tuple3!1801 (_1!12923 Unit!20521) (_2!12923 BitStream!13288) (_3!1338 array!17636)) )
))
(declare-fun lt!428065 () tuple3!1800)

(declare-fun arrayBitRangesEq!0 (array!17636 array!17636 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!294644 (arrayBitRangesEq!0 arr!273 (_3!1338 lt!428065) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!428066 () Unit!20521)

(declare-fun lt!428069 () array!17636)

(declare-fun arrayBitRangesEqTransitive!0 (array!17636 array!17636 array!17636 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20521)

(assert (=> b!294644 (= lt!428066 (arrayBitRangesEqTransitive!0 arr!273 lt!428069 (_3!1338 lt!428065) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!294644 (arrayBitRangesEq!0 arr!273 lt!428069 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((tuple2!23170 0))(
  ( (tuple2!23171 (_1!12924 Bool) (_2!12924 BitStream!13288)) )
))
(declare-fun lt!428070 () tuple2!23170)

(declare-fun lt!428068 () Unit!20521)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17636 (_ BitVec 64) Bool) Unit!20521)

(assert (=> b!294644 (= lt!428068 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12924 lt!428070)))))

(declare-fun e!210599 () Bool)

(assert (=> b!294644 e!210599))

(declare-fun res!243291 () Bool)

(assert (=> b!294644 (=> (not res!243291) (not e!210599))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!294644 (= res!243291 (= (bvsub (bvadd (bitIndex!0 (size!7642 (buf!7705 thiss!1728)) (currentByte!14202 thiss!1728) (currentBit!14197 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7642 (buf!7705 (_2!12923 lt!428065))) (currentByte!14202 (_2!12923 lt!428065)) (currentBit!14197 (_2!12923 lt!428065)))))))

(declare-fun readBitsLoop!0 (BitStream!13288 (_ BitVec 64) array!17636 (_ BitVec 64) (_ BitVec 64)) tuple3!1800)

(assert (=> b!294644 (= lt!428065 (readBitsLoop!0 (_2!12924 lt!428070) nBits!523 lt!428069 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!294644 (validate_offset_bits!1 ((_ sign_extend 32) (size!7642 (buf!7705 (_2!12924 lt!428070)))) ((_ sign_extend 32) (currentByte!14202 (_2!12924 lt!428070))) ((_ sign_extend 32) (currentBit!14197 (_2!12924 lt!428070))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!428067 () Unit!20521)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13288 BitStream!13288 (_ BitVec 64) (_ BitVec 64)) Unit!20521)

(assert (=> b!294644 (= lt!428067 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12924 lt!428070) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!428063 () (_ BitVec 32))

(declare-fun lt!428064 () (_ BitVec 32))

(assert (=> b!294644 (= lt!428069 (array!17637 (store (arr!8680 arr!273) lt!428063 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8680 arr!273) lt!428063)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!428064)))) ((_ sign_extend 24) (ite (_1!12924 lt!428070) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!428064) #b00000000))))) (size!7642 arr!273)))))

(assert (=> b!294644 (= lt!428064 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!294644 (= lt!428063 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!13288) tuple2!23170)

(assert (=> b!294644 (= lt!428070 (readBit!0 thiss!1728))))

(declare-fun b!294645 () Bool)

(assert (=> b!294645 (= e!210599 (and (= (buf!7705 thiss!1728) (buf!7705 (_2!12923 lt!428065))) (= (size!7642 arr!273) (size!7642 (_3!1338 lt!428065)))))))

(assert (= (and start!65704 res!243292) b!294643))

(assert (= (and b!294643 res!243290) b!294641))

(assert (= (and b!294641 res!243293) b!294644))

(assert (= (and b!294644 res!243291) b!294645))

(assert (= start!65704 b!294642))

(declare-fun m!431077 () Bool)

(assert (=> b!294642 m!431077))

(declare-fun m!431079 () Bool)

(assert (=> start!65704 m!431079))

(declare-fun m!431081 () Bool)

(assert (=> start!65704 m!431081))

(declare-fun m!431083 () Bool)

(assert (=> b!294643 m!431083))

(declare-fun m!431085 () Bool)

(assert (=> b!294644 m!431085))

(declare-fun m!431087 () Bool)

(assert (=> b!294644 m!431087))

(declare-fun m!431089 () Bool)

(assert (=> b!294644 m!431089))

(declare-fun m!431091 () Bool)

(assert (=> b!294644 m!431091))

(declare-fun m!431093 () Bool)

(assert (=> b!294644 m!431093))

(declare-fun m!431095 () Bool)

(assert (=> b!294644 m!431095))

(declare-fun m!431097 () Bool)

(assert (=> b!294644 m!431097))

(declare-fun m!431099 () Bool)

(assert (=> b!294644 m!431099))

(declare-fun m!431101 () Bool)

(assert (=> b!294644 m!431101))

(declare-fun m!431103 () Bool)

(assert (=> b!294644 m!431103))

(declare-fun m!431105 () Bool)

(assert (=> b!294644 m!431105))

(declare-fun m!431107 () Bool)

(assert (=> b!294644 m!431107))

(declare-fun m!431109 () Bool)

(assert (=> b!294644 m!431109))

(push 1)

(assert (not b!294644))

(assert (not b!294642))

(assert (not b!294643))

(assert (not start!65704))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

