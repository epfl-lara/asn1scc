; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65810 () Bool)

(assert start!65810)

(declare-fun b!295235 () Bool)

(declare-fun res!243767 () Bool)

(declare-fun e!211133 () Bool)

(assert (=> b!295235 (=> (not res!243767) (not e!211133))))

(declare-datatypes ((array!17685 0))(
  ( (array!17686 (arr!8706 (Array (_ BitVec 32) (_ BitVec 8))) (size!7665 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13334 0))(
  ( (BitStream!13335 (buf!7728 array!17685) (currentByte!14231 (_ BitVec 32)) (currentBit!14226 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13334)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!295235 (= res!243767 (validate_offset_bits!1 ((_ sign_extend 32) (size!7665 (buf!7728 thiss!1728))) ((_ sign_extend 32) (currentByte!14231 thiss!1728)) ((_ sign_extend 32) (currentBit!14226 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun res!243764 () Bool)

(assert (=> start!65810 (=> (not res!243764) (not e!211133))))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun arr!273 () array!17685)

(assert (=> start!65810 (= res!243764 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7665 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65810 e!211133))

(declare-fun e!211130 () Bool)

(declare-fun inv!12 (BitStream!13334) Bool)

(assert (=> start!65810 (and (inv!12 thiss!1728) e!211130)))

(assert (=> start!65810 true))

(declare-fun array_inv!7277 (array!17685) Bool)

(assert (=> start!65810 (array_inv!7277 arr!273)))

(declare-fun e!211131 () Bool)

(declare-datatypes ((Unit!20579 0))(
  ( (Unit!20580) )
))
(declare-datatypes ((tuple3!1846 0))(
  ( (tuple3!1847 (_1!12978 Unit!20579) (_2!12978 BitStream!13334) (_3!1364 array!17685)) )
))
(declare-fun lt!429184 () tuple3!1846)

(declare-fun b!295236 () Bool)

(assert (=> b!295236 (= e!211131 (and (= (buf!7728 thiss!1728) (buf!7728 (_2!12978 lt!429184))) (= (size!7665 arr!273) (size!7665 (_3!1364 lt!429184)))))))

(declare-fun b!295237 () Bool)

(assert (=> b!295237 (= e!211130 (array_inv!7277 (buf!7728 thiss!1728)))))

(declare-fun b!295238 () Bool)

(assert (=> b!295238 (= e!211133 (not true))))

(declare-fun lt!429189 () array!17685)

(declare-fun bitAt!0 (array!17685 (_ BitVec 64)) Bool)

(assert (=> b!295238 (= (bitAt!0 lt!429189 from!505) (bitAt!0 (_3!1364 lt!429184) from!505))))

(declare-fun lt!429182 () Unit!20579)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17685 array!17685 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20579)

(assert (=> b!295238 (= lt!429182 (arrayBitRangesEqImpliesEq!0 lt!429189 (_3!1364 lt!429184) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun arrayBitRangesEq!0 (array!17685 array!17685 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!295238 (arrayBitRangesEq!0 arr!273 (_3!1364 lt!429184) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!429183 () Unit!20579)

(declare-fun arrayBitRangesEqTransitive!0 (array!17685 array!17685 array!17685 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20579)

(assert (=> b!295238 (= lt!429183 (arrayBitRangesEqTransitive!0 arr!273 lt!429189 (_3!1364 lt!429184) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!295238 (arrayBitRangesEq!0 arr!273 lt!429189 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!429181 () Unit!20579)

(declare-datatypes ((tuple2!23228 0))(
  ( (tuple2!23229 (_1!12979 Bool) (_2!12979 BitStream!13334)) )
))
(declare-fun lt!429185 () tuple2!23228)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17685 (_ BitVec 64) Bool) Unit!20579)

(assert (=> b!295238 (= lt!429181 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12979 lt!429185)))))

(assert (=> b!295238 e!211131))

(declare-fun res!243766 () Bool)

(assert (=> b!295238 (=> (not res!243766) (not e!211131))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!295238 (= res!243766 (= (bvsub (bvadd (bitIndex!0 (size!7665 (buf!7728 thiss!1728)) (currentByte!14231 thiss!1728) (currentBit!14226 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7665 (buf!7728 (_2!12978 lt!429184))) (currentByte!14231 (_2!12978 lt!429184)) (currentBit!14226 (_2!12978 lt!429184)))))))

(declare-fun readBitsLoop!0 (BitStream!13334 (_ BitVec 64) array!17685 (_ BitVec 64) (_ BitVec 64)) tuple3!1846)

(assert (=> b!295238 (= lt!429184 (readBitsLoop!0 (_2!12979 lt!429185) nBits!523 lt!429189 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!295238 (validate_offset_bits!1 ((_ sign_extend 32) (size!7665 (buf!7728 (_2!12979 lt!429185)))) ((_ sign_extend 32) (currentByte!14231 (_2!12979 lt!429185))) ((_ sign_extend 32) (currentBit!14226 (_2!12979 lt!429185))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!429186 () Unit!20579)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13334 BitStream!13334 (_ BitVec 64) (_ BitVec 64)) Unit!20579)

(assert (=> b!295238 (= lt!429186 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12979 lt!429185) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!429188 () (_ BitVec 32))

(declare-fun lt!429187 () (_ BitVec 32))

(assert (=> b!295238 (= lt!429189 (array!17686 (store (arr!8706 arr!273) lt!429188 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8706 arr!273) lt!429188)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!429187)))) ((_ sign_extend 24) (ite (_1!12979 lt!429185) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!429187) #b00000000))))) (size!7665 arr!273)))))

(assert (=> b!295238 (= lt!429187 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!295238 (= lt!429188 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!13334) tuple2!23228)

(assert (=> b!295238 (= lt!429185 (readBit!0 thiss!1728))))

(declare-fun b!295239 () Bool)

(declare-fun res!243765 () Bool)

(assert (=> b!295239 (=> (not res!243765) (not e!211133))))

(assert (=> b!295239 (= res!243765 (bvslt from!505 to!474))))

(assert (= (and start!65810 res!243764) b!295235))

(assert (= (and b!295235 res!243767) b!295239))

(assert (= (and b!295239 res!243765) b!295238))

(assert (= (and b!295238 res!243766) b!295236))

(assert (= start!65810 b!295237))

(declare-fun m!432291 () Bool)

(assert (=> b!295235 m!432291))

(declare-fun m!432293 () Bool)

(assert (=> start!65810 m!432293))

(declare-fun m!432295 () Bool)

(assert (=> start!65810 m!432295))

(declare-fun m!432297 () Bool)

(assert (=> b!295237 m!432297))

(declare-fun m!432299 () Bool)

(assert (=> b!295238 m!432299))

(declare-fun m!432301 () Bool)

(assert (=> b!295238 m!432301))

(declare-fun m!432303 () Bool)

(assert (=> b!295238 m!432303))

(declare-fun m!432305 () Bool)

(assert (=> b!295238 m!432305))

(declare-fun m!432307 () Bool)

(assert (=> b!295238 m!432307))

(declare-fun m!432309 () Bool)

(assert (=> b!295238 m!432309))

(declare-fun m!432311 () Bool)

(assert (=> b!295238 m!432311))

(declare-fun m!432313 () Bool)

(assert (=> b!295238 m!432313))

(declare-fun m!432315 () Bool)

(assert (=> b!295238 m!432315))

(declare-fun m!432317 () Bool)

(assert (=> b!295238 m!432317))

(declare-fun m!432319 () Bool)

(assert (=> b!295238 m!432319))

(declare-fun m!432321 () Bool)

(assert (=> b!295238 m!432321))

(declare-fun m!432323 () Bool)

(assert (=> b!295238 m!432323))

(declare-fun m!432325 () Bool)

(assert (=> b!295238 m!432325))

(declare-fun m!432327 () Bool)

(assert (=> b!295238 m!432327))

(declare-fun m!432329 () Bool)

(assert (=> b!295238 m!432329))

(push 1)

