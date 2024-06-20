; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64920 () Bool)

(assert start!64920)

(declare-fun b!291304 () Bool)

(declare-fun e!207580 () Bool)

(assert (=> b!291304 (= e!207580 (not true))))

(declare-datatypes ((array!17284 0))(
  ( (array!17285 (arr!8501 (Array (_ BitVec 32) (_ BitVec 8))) (size!7481 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12972 0))(
  ( (BitStream!12973 (buf!7547 array!17284) (currentByte!13981 (_ BitVec 32)) (currentBit!13976 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!22872 0))(
  ( (tuple2!22873 (_1!12712 BitStream!12972) (_2!12712 Bool)) )
))
(declare-fun lt!423341 () tuple2!22872)

(declare-fun thiss!1728 () BitStream!12972)

(declare-fun readBitPure!0 (BitStream!12972) tuple2!22872)

(assert (=> b!291304 (= lt!423341 (readBitPure!0 thiss!1728))))

(declare-fun e!207582 () Bool)

(assert (=> b!291304 e!207582))

(declare-fun res!240644 () Bool)

(assert (=> b!291304 (=> (not res!240644) (not e!207582))))

(declare-fun lt!423347 () Bool)

(declare-fun from!505 () (_ BitVec 64))

(declare-fun lt!423343 () array!17284)

(declare-fun bitAt!0 (array!17284 (_ BitVec 64)) Bool)

(assert (=> b!291304 (= res!240644 (= (bitAt!0 lt!423343 from!505) lt!423347))))

(declare-datatypes ((Unit!20239 0))(
  ( (Unit!20240) )
))
(declare-datatypes ((tuple3!1706 0))(
  ( (tuple3!1707 (_1!12713 Unit!20239) (_2!12713 BitStream!12972) (_3!1276 array!17284)) )
))
(declare-fun lt!423344 () tuple3!1706)

(assert (=> b!291304 (= lt!423347 (bitAt!0 (_3!1276 lt!423344) from!505))))

(declare-fun lt!423351 () Unit!20239)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17284 array!17284 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20239)

(assert (=> b!291304 (= lt!423351 (arrayBitRangesEqImpliesEq!0 lt!423343 (_3!1276 lt!423344) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun arr!273 () array!17284)

(declare-fun arrayBitRangesEq!0 (array!17284 array!17284 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!291304 (arrayBitRangesEq!0 arr!273 (_3!1276 lt!423344) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!423346 () Unit!20239)

(declare-fun arrayBitRangesEqTransitive!0 (array!17284 array!17284 array!17284 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20239)

(assert (=> b!291304 (= lt!423346 (arrayBitRangesEqTransitive!0 arr!273 lt!423343 (_3!1276 lt!423344) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!291304 (arrayBitRangesEq!0 arr!273 lt!423343 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((tuple2!22874 0))(
  ( (tuple2!22875 (_1!12714 Bool) (_2!12714 BitStream!12972)) )
))
(declare-fun lt!423348 () tuple2!22874)

(declare-fun lt!423342 () Unit!20239)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17284 (_ BitVec 64) Bool) Unit!20239)

(assert (=> b!291304 (= lt!423342 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12714 lt!423348)))))

(declare-fun e!207584 () Bool)

(assert (=> b!291304 e!207584))

(declare-fun res!240647 () Bool)

(assert (=> b!291304 (=> (not res!240647) (not e!207584))))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!291304 (= res!240647 (= (bvsub (bvadd (bitIndex!0 (size!7481 (buf!7547 thiss!1728)) (currentByte!13981 thiss!1728) (currentBit!13976 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7481 (buf!7547 (_2!12713 lt!423344))) (currentByte!13981 (_2!12713 lt!423344)) (currentBit!13976 (_2!12713 lt!423344)))))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun readBitsLoop!0 (BitStream!12972 (_ BitVec 64) array!17284 (_ BitVec 64) (_ BitVec 64)) tuple3!1706)

(assert (=> b!291304 (= lt!423344 (readBitsLoop!0 (_2!12714 lt!423348) nBits!523 lt!423343 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!291304 (validate_offset_bits!1 ((_ sign_extend 32) (size!7481 (buf!7547 (_2!12714 lt!423348)))) ((_ sign_extend 32) (currentByte!13981 (_2!12714 lt!423348))) ((_ sign_extend 32) (currentBit!13976 (_2!12714 lt!423348))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!423350 () Unit!20239)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12972 BitStream!12972 (_ BitVec 64) (_ BitVec 64)) Unit!20239)

(assert (=> b!291304 (= lt!423350 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12714 lt!423348) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!423345 () (_ BitVec 32))

(declare-fun lt!423349 () (_ BitVec 32))

(assert (=> b!291304 (= lt!423343 (array!17285 (store (arr!8501 arr!273) lt!423345 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8501 arr!273) lt!423345)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!423349)))) ((_ sign_extend 24) (ite (_1!12714 lt!423348) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!423349) #b00000000))))) (size!7481 arr!273)))))

(assert (=> b!291304 (= lt!423349 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!291304 (= lt!423345 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!12972) tuple2!22874)

(assert (=> b!291304 (= lt!423348 (readBit!0 thiss!1728))))

(declare-fun b!291305 () Bool)

(declare-fun e!207583 () Bool)

(declare-fun array_inv!7093 (array!17284) Bool)

(assert (=> b!291305 (= e!207583 (array_inv!7093 (buf!7547 thiss!1728)))))

(declare-fun b!291306 () Bool)

(declare-fun res!240643 () Bool)

(assert (=> b!291306 (=> (not res!240643) (not e!207580))))

(assert (=> b!291306 (= res!240643 (bvslt from!505 to!474))))

(declare-fun b!291307 () Bool)

(assert (=> b!291307 (= e!207582 (= lt!423347 (_1!12714 lt!423348)))))

(declare-fun res!240646 () Bool)

(assert (=> start!64920 (=> (not res!240646) (not e!207580))))

(assert (=> start!64920 (= res!240646 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7481 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64920 e!207580))

(declare-fun inv!12 (BitStream!12972) Bool)

(assert (=> start!64920 (and (inv!12 thiss!1728) e!207583)))

(assert (=> start!64920 true))

(assert (=> start!64920 (array_inv!7093 arr!273)))

(declare-fun b!291308 () Bool)

(declare-fun res!240645 () Bool)

(assert (=> b!291308 (=> (not res!240645) (not e!207580))))

(assert (=> b!291308 (= res!240645 (validate_offset_bits!1 ((_ sign_extend 32) (size!7481 (buf!7547 thiss!1728))) ((_ sign_extend 32) (currentByte!13981 thiss!1728)) ((_ sign_extend 32) (currentBit!13976 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!291309 () Bool)

(assert (=> b!291309 (= e!207584 (and (= (buf!7547 thiss!1728) (buf!7547 (_2!12713 lt!423344))) (= (size!7481 arr!273) (size!7481 (_3!1276 lt!423344)))))))

(assert (= (and start!64920 res!240646) b!291308))

(assert (= (and b!291308 res!240645) b!291306))

(assert (= (and b!291306 res!240643) b!291304))

(assert (= (and b!291304 res!240647) b!291309))

(assert (= (and b!291304 res!240644) b!291307))

(assert (= start!64920 b!291305))

(declare-fun m!426187 () Bool)

(assert (=> b!291304 m!426187))

(declare-fun m!426189 () Bool)

(assert (=> b!291304 m!426189))

(declare-fun m!426191 () Bool)

(assert (=> b!291304 m!426191))

(declare-fun m!426193 () Bool)

(assert (=> b!291304 m!426193))

(declare-fun m!426195 () Bool)

(assert (=> b!291304 m!426195))

(declare-fun m!426197 () Bool)

(assert (=> b!291304 m!426197))

(declare-fun m!426199 () Bool)

(assert (=> b!291304 m!426199))

(declare-fun m!426201 () Bool)

(assert (=> b!291304 m!426201))

(declare-fun m!426203 () Bool)

(assert (=> b!291304 m!426203))

(declare-fun m!426205 () Bool)

(assert (=> b!291304 m!426205))

(declare-fun m!426207 () Bool)

(assert (=> b!291304 m!426207))

(declare-fun m!426209 () Bool)

(assert (=> b!291304 m!426209))

(declare-fun m!426211 () Bool)

(assert (=> b!291304 m!426211))

(declare-fun m!426213 () Bool)

(assert (=> b!291304 m!426213))

(declare-fun m!426215 () Bool)

(assert (=> b!291304 m!426215))

(declare-fun m!426217 () Bool)

(assert (=> b!291304 m!426217))

(declare-fun m!426219 () Bool)

(assert (=> b!291304 m!426219))

(declare-fun m!426221 () Bool)

(assert (=> b!291305 m!426221))

(declare-fun m!426223 () Bool)

(assert (=> start!64920 m!426223))

(declare-fun m!426225 () Bool)

(assert (=> start!64920 m!426225))

(declare-fun m!426227 () Bool)

(assert (=> b!291308 m!426227))

(check-sat (not b!291305) (not start!64920) (not b!291304) (not b!291308))
