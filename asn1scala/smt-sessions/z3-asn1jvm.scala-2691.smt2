; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65808 () Bool)

(assert start!65808)

(declare-fun e!211118 () Bool)

(declare-datatypes ((array!17683 0))(
  ( (array!17684 (arr!8705 (Array (_ BitVec 32) (_ BitVec 8))) (size!7664 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13332 0))(
  ( (BitStream!13333 (buf!7727 array!17683) (currentByte!14230 (_ BitVec 32)) (currentBit!14225 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13332)

(declare-fun b!295220 () Bool)

(declare-datatypes ((Unit!20577 0))(
  ( (Unit!20578) )
))
(declare-datatypes ((tuple3!1844 0))(
  ( (tuple3!1845 (_1!12976 Unit!20577) (_2!12976 BitStream!13332) (_3!1363 array!17683)) )
))
(declare-fun lt!429160 () tuple3!1844)

(declare-fun arr!273 () array!17683)

(assert (=> b!295220 (= e!211118 (and (= (buf!7727 thiss!1728) (buf!7727 (_2!12976 lt!429160))) (= (size!7664 arr!273) (size!7664 (_3!1363 lt!429160)))))))

(declare-fun b!295222 () Bool)

(declare-fun res!243752 () Bool)

(declare-fun e!211119 () Bool)

(assert (=> b!295222 (=> (not res!243752) (not e!211119))))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!295222 (= res!243752 (bvslt from!505 to!474))))

(declare-fun b!295223 () Bool)

(assert (=> b!295223 (= e!211119 (not true))))

(declare-fun lt!429155 () array!17683)

(declare-fun bitAt!0 (array!17683 (_ BitVec 64)) Bool)

(assert (=> b!295223 (= (bitAt!0 lt!429155 from!505) (bitAt!0 (_3!1363 lt!429160) from!505))))

(declare-fun lt!429158 () Unit!20577)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17683 array!17683 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20577)

(assert (=> b!295223 (= lt!429158 (arrayBitRangesEqImpliesEq!0 lt!429155 (_3!1363 lt!429160) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun arrayBitRangesEq!0 (array!17683 array!17683 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!295223 (arrayBitRangesEq!0 arr!273 (_3!1363 lt!429160) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!429157 () Unit!20577)

(declare-fun arrayBitRangesEqTransitive!0 (array!17683 array!17683 array!17683 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20577)

(assert (=> b!295223 (= lt!429157 (arrayBitRangesEqTransitive!0 arr!273 lt!429155 (_3!1363 lt!429160) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!295223 (arrayBitRangesEq!0 arr!273 lt!429155 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((tuple2!23226 0))(
  ( (tuple2!23227 (_1!12977 Bool) (_2!12977 BitStream!13332)) )
))
(declare-fun lt!429154 () tuple2!23226)

(declare-fun lt!429156 () Unit!20577)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17683 (_ BitVec 64) Bool) Unit!20577)

(assert (=> b!295223 (= lt!429156 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12977 lt!429154)))))

(assert (=> b!295223 e!211118))

(declare-fun res!243755 () Bool)

(assert (=> b!295223 (=> (not res!243755) (not e!211118))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!295223 (= res!243755 (= (bvsub (bvadd (bitIndex!0 (size!7664 (buf!7727 thiss!1728)) (currentByte!14230 thiss!1728) (currentBit!14225 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7664 (buf!7727 (_2!12976 lt!429160))) (currentByte!14230 (_2!12976 lt!429160)) (currentBit!14225 (_2!12976 lt!429160)))))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun readBitsLoop!0 (BitStream!13332 (_ BitVec 64) array!17683 (_ BitVec 64) (_ BitVec 64)) tuple3!1844)

(assert (=> b!295223 (= lt!429160 (readBitsLoop!0 (_2!12977 lt!429154) nBits!523 lt!429155 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!295223 (validate_offset_bits!1 ((_ sign_extend 32) (size!7664 (buf!7727 (_2!12977 lt!429154)))) ((_ sign_extend 32) (currentByte!14230 (_2!12977 lt!429154))) ((_ sign_extend 32) (currentBit!14225 (_2!12977 lt!429154))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!429162 () Unit!20577)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13332 BitStream!13332 (_ BitVec 64) (_ BitVec 64)) Unit!20577)

(assert (=> b!295223 (= lt!429162 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12977 lt!429154) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!429159 () (_ BitVec 32))

(declare-fun lt!429161 () (_ BitVec 32))

(assert (=> b!295223 (= lt!429155 (array!17684 (store (arr!8705 arr!273) lt!429161 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8705 arr!273) lt!429161)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!429159)))) ((_ sign_extend 24) (ite (_1!12977 lt!429154) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!429159) #b00000000))))) (size!7664 arr!273)))))

(assert (=> b!295223 (= lt!429159 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!295223 (= lt!429161 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!13332) tuple2!23226)

(assert (=> b!295223 (= lt!429154 (readBit!0 thiss!1728))))

(declare-fun b!295224 () Bool)

(declare-fun e!211115 () Bool)

(declare-fun array_inv!7276 (array!17683) Bool)

(assert (=> b!295224 (= e!211115 (array_inv!7276 (buf!7727 thiss!1728)))))

(declare-fun b!295221 () Bool)

(declare-fun res!243754 () Bool)

(assert (=> b!295221 (=> (not res!243754) (not e!211119))))

(assert (=> b!295221 (= res!243754 (validate_offset_bits!1 ((_ sign_extend 32) (size!7664 (buf!7727 thiss!1728))) ((_ sign_extend 32) (currentByte!14230 thiss!1728)) ((_ sign_extend 32) (currentBit!14225 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun res!243753 () Bool)

(assert (=> start!65808 (=> (not res!243753) (not e!211119))))

(assert (=> start!65808 (= res!243753 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7664 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65808 e!211119))

(declare-fun inv!12 (BitStream!13332) Bool)

(assert (=> start!65808 (and (inv!12 thiss!1728) e!211115)))

(assert (=> start!65808 true))

(assert (=> start!65808 (array_inv!7276 arr!273)))

(assert (= (and start!65808 res!243753) b!295221))

(assert (= (and b!295221 res!243754) b!295222))

(assert (= (and b!295222 res!243752) b!295223))

(assert (= (and b!295223 res!243755) b!295220))

(assert (= start!65808 b!295224))

(declare-fun m!432251 () Bool)

(assert (=> b!295223 m!432251))

(declare-fun m!432253 () Bool)

(assert (=> b!295223 m!432253))

(declare-fun m!432255 () Bool)

(assert (=> b!295223 m!432255))

(declare-fun m!432257 () Bool)

(assert (=> b!295223 m!432257))

(declare-fun m!432259 () Bool)

(assert (=> b!295223 m!432259))

(declare-fun m!432261 () Bool)

(assert (=> b!295223 m!432261))

(declare-fun m!432263 () Bool)

(assert (=> b!295223 m!432263))

(declare-fun m!432265 () Bool)

(assert (=> b!295223 m!432265))

(declare-fun m!432267 () Bool)

(assert (=> b!295223 m!432267))

(declare-fun m!432269 () Bool)

(assert (=> b!295223 m!432269))

(declare-fun m!432271 () Bool)

(assert (=> b!295223 m!432271))

(declare-fun m!432273 () Bool)

(assert (=> b!295223 m!432273))

(declare-fun m!432275 () Bool)

(assert (=> b!295223 m!432275))

(declare-fun m!432277 () Bool)

(assert (=> b!295223 m!432277))

(declare-fun m!432279 () Bool)

(assert (=> b!295223 m!432279))

(declare-fun m!432281 () Bool)

(assert (=> b!295223 m!432281))

(declare-fun m!432283 () Bool)

(assert (=> b!295224 m!432283))

(declare-fun m!432285 () Bool)

(assert (=> b!295221 m!432285))

(declare-fun m!432287 () Bool)

(assert (=> start!65808 m!432287))

(declare-fun m!432289 () Bool)

(assert (=> start!65808 m!432289))

(check-sat (not b!295224) (not b!295223) (not start!65808) (not b!295221))
