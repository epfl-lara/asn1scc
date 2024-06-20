; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65712 () Bool)

(assert start!65712)

(declare-fun b!294701 () Bool)

(declare-fun e!210661 () Bool)

(declare-datatypes ((array!17644 0))(
  ( (array!17645 (arr!8684 (Array (_ BitVec 32) (_ BitVec 8))) (size!7646 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13296 0))(
  ( (BitStream!13297 (buf!7709 array!17644) (currentByte!14206 (_ BitVec 32)) (currentBit!14201 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13296)

(declare-fun array_inv!7258 (array!17644) Bool)

(assert (=> b!294701 (= e!210661 (array_inv!7258 (buf!7709 thiss!1728)))))

(declare-fun b!294702 () Bool)

(declare-fun e!210663 () Bool)

(declare-fun from!505 () (_ BitVec 64))

(assert (=> b!294702 (= e!210663 (not (or (not (= (bvand from!505 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (bvand from!505 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun arr!273 () array!17644)

(declare-datatypes ((Unit!20529 0))(
  ( (Unit!20530) )
))
(declare-datatypes ((tuple3!1808 0))(
  ( (tuple3!1809 (_1!12931 Unit!20529) (_2!12931 BitStream!13296) (_3!1342 array!17644)) )
))
(declare-fun lt!428162 () tuple3!1808)

(declare-fun arrayBitRangesEq!0 (array!17644 array!17644 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!294702 (arrayBitRangesEq!0 arr!273 (_3!1342 lt!428162) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!428166 () Unit!20529)

(declare-fun lt!428160 () array!17644)

(declare-fun arrayBitRangesEqTransitive!0 (array!17644 array!17644 array!17644 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20529)

(assert (=> b!294702 (= lt!428166 (arrayBitRangesEqTransitive!0 arr!273 lt!428160 (_3!1342 lt!428162) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!294702 (arrayBitRangesEq!0 arr!273 lt!428160 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!428159 () Unit!20529)

(declare-datatypes ((tuple2!23178 0))(
  ( (tuple2!23179 (_1!12932 Bool) (_2!12932 BitStream!13296)) )
))
(declare-fun lt!428165 () tuple2!23178)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17644 (_ BitVec 64) Bool) Unit!20529)

(assert (=> b!294702 (= lt!428159 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12932 lt!428165)))))

(declare-fun e!210660 () Bool)

(assert (=> b!294702 e!210660))

(declare-fun res!243341 () Bool)

(assert (=> b!294702 (=> (not res!243341) (not e!210660))))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!294702 (= res!243341 (= (bvsub (bvadd (bitIndex!0 (size!7646 (buf!7709 thiss!1728)) (currentByte!14206 thiss!1728) (currentBit!14201 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7646 (buf!7709 (_2!12931 lt!428162))) (currentByte!14206 (_2!12931 lt!428162)) (currentBit!14201 (_2!12931 lt!428162)))))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun readBitsLoop!0 (BitStream!13296 (_ BitVec 64) array!17644 (_ BitVec 64) (_ BitVec 64)) tuple3!1808)

(assert (=> b!294702 (= lt!428162 (readBitsLoop!0 (_2!12932 lt!428165) nBits!523 lt!428160 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!294702 (validate_offset_bits!1 ((_ sign_extend 32) (size!7646 (buf!7709 (_2!12932 lt!428165)))) ((_ sign_extend 32) (currentByte!14206 (_2!12932 lt!428165))) ((_ sign_extend 32) (currentBit!14201 (_2!12932 lt!428165))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!428163 () Unit!20529)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13296 BitStream!13296 (_ BitVec 64) (_ BitVec 64)) Unit!20529)

(assert (=> b!294702 (= lt!428163 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12932 lt!428165) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!428164 () (_ BitVec 32))

(declare-fun lt!428161 () (_ BitVec 32))

(assert (=> b!294702 (= lt!428160 (array!17645 (store (arr!8684 arr!273) lt!428164 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8684 arr!273) lt!428164)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!428161)))) ((_ sign_extend 24) (ite (_1!12932 lt!428165) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!428161) #b00000000))))) (size!7646 arr!273)))))

(assert (=> b!294702 (= lt!428161 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!294702 (= lt!428164 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!13296) tuple2!23178)

(assert (=> b!294702 (= lt!428165 (readBit!0 thiss!1728))))

(declare-fun b!294703 () Bool)

(declare-fun res!243339 () Bool)

(assert (=> b!294703 (=> (not res!243339) (not e!210663))))

(assert (=> b!294703 (= res!243339 (validate_offset_bits!1 ((_ sign_extend 32) (size!7646 (buf!7709 thiss!1728))) ((_ sign_extend 32) (currentByte!14206 thiss!1728)) ((_ sign_extend 32) (currentBit!14201 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!294704 () Bool)

(assert (=> b!294704 (= e!210660 (and (= (buf!7709 thiss!1728) (buf!7709 (_2!12931 lt!428162))) (= (size!7646 arr!273) (size!7646 (_3!1342 lt!428162)))))))

(declare-fun b!294705 () Bool)

(declare-fun res!243338 () Bool)

(assert (=> b!294705 (=> (not res!243338) (not e!210663))))

(assert (=> b!294705 (= res!243338 (bvslt from!505 to!474))))

(declare-fun res!243340 () Bool)

(assert (=> start!65712 (=> (not res!243340) (not e!210663))))

(assert (=> start!65712 (= res!243340 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7646 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65712 e!210663))

(declare-fun inv!12 (BitStream!13296) Bool)

(assert (=> start!65712 (and (inv!12 thiss!1728) e!210661)))

(assert (=> start!65712 true))

(assert (=> start!65712 (array_inv!7258 arr!273)))

(assert (= (and start!65712 res!243340) b!294703))

(assert (= (and b!294703 res!243339) b!294705))

(assert (= (and b!294705 res!243338) b!294702))

(assert (= (and b!294702 res!243341) b!294704))

(assert (= start!65712 b!294701))

(declare-fun m!431213 () Bool)

(assert (=> b!294701 m!431213))

(declare-fun m!431215 () Bool)

(assert (=> b!294702 m!431215))

(declare-fun m!431217 () Bool)

(assert (=> b!294702 m!431217))

(declare-fun m!431219 () Bool)

(assert (=> b!294702 m!431219))

(declare-fun m!431221 () Bool)

(assert (=> b!294702 m!431221))

(declare-fun m!431223 () Bool)

(assert (=> b!294702 m!431223))

(declare-fun m!431225 () Bool)

(assert (=> b!294702 m!431225))

(declare-fun m!431227 () Bool)

(assert (=> b!294702 m!431227))

(declare-fun m!431229 () Bool)

(assert (=> b!294702 m!431229))

(declare-fun m!431231 () Bool)

(assert (=> b!294702 m!431231))

(declare-fun m!431233 () Bool)

(assert (=> b!294702 m!431233))

(declare-fun m!431235 () Bool)

(assert (=> b!294702 m!431235))

(declare-fun m!431237 () Bool)

(assert (=> b!294702 m!431237))

(declare-fun m!431239 () Bool)

(assert (=> b!294702 m!431239))

(declare-fun m!431241 () Bool)

(assert (=> b!294703 m!431241))

(declare-fun m!431243 () Bool)

(assert (=> start!65712 m!431243))

(declare-fun m!431245 () Bool)

(assert (=> start!65712 m!431245))

(check-sat (not b!294702) (not b!294703) (not start!65712) (not b!294701))
(check-sat)
