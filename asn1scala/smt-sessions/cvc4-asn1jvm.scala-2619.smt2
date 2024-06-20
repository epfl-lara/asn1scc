; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64634 () Bool)

(assert start!64634)

(declare-fun b!290198 () Bool)

(declare-fun res!239753 () Bool)

(declare-fun e!206654 () Bool)

(assert (=> b!290198 (=> (not res!239753) (not e!206654))))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!290198 (= res!239753 (bvslt from!505 to!474))))

(declare-datatypes ((array!17223 0))(
  ( (array!17224 (arr!8457 (Array (_ BitVec 32) (_ BitVec 8))) (size!7455 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12920 0))(
  ( (BitStream!12921 (buf!7521 array!17223) (currentByte!13928 (_ BitVec 32)) (currentBit!13923 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12920)

(declare-datatypes ((Unit!20151 0))(
  ( (Unit!20152) )
))
(declare-datatypes ((tuple3!1654 0))(
  ( (tuple3!1655 (_1!12633 Unit!20151) (_2!12633 BitStream!12920) (_3!1241 array!17223)) )
))
(declare-fun lt!420903 () tuple3!1654)

(declare-fun b!290199 () Bool)

(declare-fun e!206656 () Bool)

(declare-fun arr!273 () array!17223)

(assert (=> b!290199 (= e!206656 (and (= (buf!7521 thiss!1728) (buf!7521 (_2!12633 lt!420903))) (= (size!7455 arr!273) (size!7455 (_3!1241 lt!420903)))))))

(declare-fun b!290200 () Bool)

(declare-fun res!239752 () Bool)

(assert (=> b!290200 (=> (not res!239752) (not e!206654))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!290200 (= res!239752 (validate_offset_bits!1 ((_ sign_extend 32) (size!7455 (buf!7521 thiss!1728))) ((_ sign_extend 32) (currentByte!13928 thiss!1728)) ((_ sign_extend 32) (currentBit!13923 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun res!239750 () Bool)

(assert (=> start!64634 (=> (not res!239750) (not e!206654))))

(assert (=> start!64634 (= res!239750 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7455 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64634 e!206654))

(declare-fun e!206658 () Bool)

(declare-fun inv!12 (BitStream!12920) Bool)

(assert (=> start!64634 (and (inv!12 thiss!1728) e!206658)))

(assert (=> start!64634 true))

(declare-fun array_inv!7067 (array!17223) Bool)

(assert (=> start!64634 (array_inv!7067 arr!273)))

(declare-fun b!290201 () Bool)

(assert (=> b!290201 (= e!206654 (not true))))

(declare-fun lt!420902 () array!17223)

(declare-fun bitAt!0 (array!17223 (_ BitVec 64)) Bool)

(assert (=> b!290201 (= (bitAt!0 lt!420902 from!505) (bitAt!0 (_3!1241 lt!420903) from!505))))

(declare-fun lt!420901 () Unit!20151)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17223 array!17223 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20151)

(assert (=> b!290201 (= lt!420901 (arrayBitRangesEqImpliesEq!0 lt!420902 (_3!1241 lt!420903) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun arrayBitRangesEq!0 (array!17223 array!17223 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!290201 (arrayBitRangesEq!0 arr!273 (_3!1241 lt!420903) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!420906 () Unit!20151)

(declare-fun arrayBitRangesEqTransitive!0 (array!17223 array!17223 array!17223 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20151)

(assert (=> b!290201 (= lt!420906 (arrayBitRangesEqTransitive!0 arr!273 lt!420902 (_3!1241 lt!420903) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!290201 (arrayBitRangesEq!0 arr!273 lt!420902 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!420904 () Unit!20151)

(declare-datatypes ((tuple2!22784 0))(
  ( (tuple2!22785 (_1!12634 Bool) (_2!12634 BitStream!12920)) )
))
(declare-fun lt!420905 () tuple2!22784)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17223 (_ BitVec 64) Bool) Unit!20151)

(assert (=> b!290201 (= lt!420904 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12634 lt!420905)))))

(assert (=> b!290201 e!206656))

(declare-fun res!239751 () Bool)

(assert (=> b!290201 (=> (not res!239751) (not e!206656))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!290201 (= res!239751 (= (bvsub (bvadd (bitIndex!0 (size!7455 (buf!7521 thiss!1728)) (currentByte!13928 thiss!1728) (currentBit!13923 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7455 (buf!7521 (_2!12633 lt!420903))) (currentByte!13928 (_2!12633 lt!420903)) (currentBit!13923 (_2!12633 lt!420903)))))))

(declare-fun readBitsLoop!0 (BitStream!12920 (_ BitVec 64) array!17223 (_ BitVec 64) (_ BitVec 64)) tuple3!1654)

(assert (=> b!290201 (= lt!420903 (readBitsLoop!0 (_2!12634 lt!420905) nBits!523 lt!420902 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!290201 (validate_offset_bits!1 ((_ sign_extend 32) (size!7455 (buf!7521 (_2!12634 lt!420905)))) ((_ sign_extend 32) (currentByte!13928 (_2!12634 lt!420905))) ((_ sign_extend 32) (currentBit!13923 (_2!12634 lt!420905))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420908 () Unit!20151)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12920 BitStream!12920 (_ BitVec 64) (_ BitVec 64)) Unit!20151)

(assert (=> b!290201 (= lt!420908 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12634 lt!420905) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420907 () (_ BitVec 32))

(declare-fun lt!420909 () (_ BitVec 32))

(assert (=> b!290201 (= lt!420902 (array!17224 (store (arr!8457 arr!273) lt!420909 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8457 arr!273) lt!420909)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420907)))) ((_ sign_extend 24) (ite (_1!12634 lt!420905) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420907) #b00000000))))) (size!7455 arr!273)))))

(assert (=> b!290201 (= lt!420907 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!290201 (= lt!420909 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!12920) tuple2!22784)

(assert (=> b!290201 (= lt!420905 (readBit!0 thiss!1728))))

(declare-fun b!290202 () Bool)

(assert (=> b!290202 (= e!206658 (array_inv!7067 (buf!7521 thiss!1728)))))

(assert (= (and start!64634 res!239750) b!290200))

(assert (= (and b!290200 res!239752) b!290198))

(assert (= (and b!290198 res!239753) b!290201))

(assert (= (and b!290201 res!239751) b!290199))

(assert (= start!64634 b!290202))

(declare-fun m!423975 () Bool)

(assert (=> b!290200 m!423975))

(declare-fun m!423977 () Bool)

(assert (=> start!64634 m!423977))

(declare-fun m!423979 () Bool)

(assert (=> start!64634 m!423979))

(declare-fun m!423981 () Bool)

(assert (=> b!290201 m!423981))

(declare-fun m!423983 () Bool)

(assert (=> b!290201 m!423983))

(declare-fun m!423985 () Bool)

(assert (=> b!290201 m!423985))

(declare-fun m!423987 () Bool)

(assert (=> b!290201 m!423987))

(declare-fun m!423989 () Bool)

(assert (=> b!290201 m!423989))

(declare-fun m!423991 () Bool)

(assert (=> b!290201 m!423991))

(declare-fun m!423993 () Bool)

(assert (=> b!290201 m!423993))

(declare-fun m!423995 () Bool)

(assert (=> b!290201 m!423995))

(declare-fun m!423997 () Bool)

(assert (=> b!290201 m!423997))

(declare-fun m!423999 () Bool)

(assert (=> b!290201 m!423999))

(declare-fun m!424001 () Bool)

(assert (=> b!290201 m!424001))

(declare-fun m!424003 () Bool)

(assert (=> b!290201 m!424003))

(declare-fun m!424005 () Bool)

(assert (=> b!290201 m!424005))

(declare-fun m!424007 () Bool)

(assert (=> b!290201 m!424007))

(declare-fun m!424009 () Bool)

(assert (=> b!290201 m!424009))

(declare-fun m!424011 () Bool)

(assert (=> b!290201 m!424011))

(declare-fun m!424013 () Bool)

(assert (=> b!290202 m!424013))

(push 1)

(assert (not b!290200))

(assert (not b!290201))

(assert (not b!290202))

(assert (not start!64634))

(check-sat)

(pop 1)

