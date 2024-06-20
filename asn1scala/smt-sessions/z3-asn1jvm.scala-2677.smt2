; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65610 () Bool)

(assert start!65610)

(declare-fun b!294104 () Bool)

(declare-fun res!242861 () Bool)

(declare-fun e!210122 () Bool)

(assert (=> b!294104 (=> (not res!242861) (not e!210122))))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!294104 (= res!242861 (bvslt from!505 to!474))))

(declare-fun res!242860 () Bool)

(assert (=> start!65610 (=> (not res!242860) (not e!210122))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-datatypes ((array!17593 0))(
  ( (array!17594 (arr!8657 (Array (_ BitVec 32) (_ BitVec 8))) (size!7622 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17593)

(assert (=> start!65610 (= res!242860 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7622 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65610 e!210122))

(declare-datatypes ((BitStream!13248 0))(
  ( (BitStream!13249 (buf!7685 array!17593) (currentByte!14176 (_ BitVec 32)) (currentBit!14171 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13248)

(declare-fun e!210125 () Bool)

(declare-fun inv!12 (BitStream!13248) Bool)

(assert (=> start!65610 (and (inv!12 thiss!1728) e!210125)))

(assert (=> start!65610 true))

(declare-fun array_inv!7234 (array!17593) Bool)

(assert (=> start!65610 (array_inv!7234 arr!273)))

(declare-fun b!294105 () Bool)

(assert (=> b!294105 (= e!210125 (array_inv!7234 (buf!7685 thiss!1728)))))

(declare-fun b!294106 () Bool)

(assert (=> b!294106 (= e!210122 (not (bvslt from!505 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7622 arr!273))))))))

(declare-fun e!210123 () Bool)

(assert (=> b!294106 e!210123))

(declare-fun res!242859 () Bool)

(assert (=> b!294106 (=> (not res!242859) (not e!210123))))

(declare-datatypes ((Unit!20469 0))(
  ( (Unit!20470) )
))
(declare-datatypes ((tuple3!1760 0))(
  ( (tuple3!1761 (_1!12874 Unit!20469) (_2!12874 BitStream!13248) (_3!1315 array!17593)) )
))
(declare-fun lt!427103 () tuple3!1760)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!294106 (= res!242859 (= (bvsub (bvadd (bitIndex!0 (size!7622 (buf!7685 thiss!1728)) (currentByte!14176 thiss!1728) (currentBit!14171 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7622 (buf!7685 (_2!12874 lt!427103))) (currentByte!14176 (_2!12874 lt!427103)) (currentBit!14171 (_2!12874 lt!427103)))))))

(declare-datatypes ((tuple2!23118 0))(
  ( (tuple2!23119 (_1!12875 Bool) (_2!12875 BitStream!13248)) )
))
(declare-fun lt!427104 () tuple2!23118)

(declare-fun lt!427102 () (_ BitVec 32))

(declare-fun lt!427101 () (_ BitVec 32))

(declare-fun readBitsLoop!0 (BitStream!13248 (_ BitVec 64) array!17593 (_ BitVec 64) (_ BitVec 64)) tuple3!1760)

(assert (=> b!294106 (= lt!427103 (readBitsLoop!0 (_2!12875 lt!427104) nBits!523 (array!17594 (store (arr!8657 arr!273) lt!427101 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8657 arr!273) lt!427101)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!427102)))) ((_ sign_extend 24) (ite (_1!12875 lt!427104) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!427102) #b00000000))))) (size!7622 arr!273)) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!294106 (validate_offset_bits!1 ((_ sign_extend 32) (size!7622 (buf!7685 (_2!12875 lt!427104)))) ((_ sign_extend 32) (currentByte!14176 (_2!12875 lt!427104))) ((_ sign_extend 32) (currentBit!14171 (_2!12875 lt!427104))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!427100 () Unit!20469)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13248 BitStream!13248 (_ BitVec 64) (_ BitVec 64)) Unit!20469)

(assert (=> b!294106 (= lt!427100 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12875 lt!427104) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!294106 (= lt!427102 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!294106 (= lt!427101 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!13248) tuple2!23118)

(assert (=> b!294106 (= lt!427104 (readBit!0 thiss!1728))))

(declare-fun b!294107 () Bool)

(declare-fun res!242858 () Bool)

(assert (=> b!294107 (=> (not res!242858) (not e!210122))))

(assert (=> b!294107 (= res!242858 (validate_offset_bits!1 ((_ sign_extend 32) (size!7622 (buf!7685 thiss!1728))) ((_ sign_extend 32) (currentByte!14176 thiss!1728)) ((_ sign_extend 32) (currentBit!14171 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!294108 () Bool)

(assert (=> b!294108 (= e!210123 (and (= (buf!7685 thiss!1728) (buf!7685 (_2!12874 lt!427103))) (= (size!7622 arr!273) (size!7622 (_3!1315 lt!427103)))))))

(assert (= (and start!65610 res!242860) b!294107))

(assert (= (and b!294107 res!242858) b!294104))

(assert (= (and b!294104 res!242861) b!294106))

(assert (= (and b!294106 res!242859) b!294108))

(assert (= start!65610 b!294105))

(declare-fun m!430113 () Bool)

(assert (=> start!65610 m!430113))

(declare-fun m!430115 () Bool)

(assert (=> start!65610 m!430115))

(declare-fun m!430117 () Bool)

(assert (=> b!294105 m!430117))

(declare-fun m!430119 () Bool)

(assert (=> b!294106 m!430119))

(declare-fun m!430121 () Bool)

(assert (=> b!294106 m!430121))

(declare-fun m!430123 () Bool)

(assert (=> b!294106 m!430123))

(declare-fun m!430125 () Bool)

(assert (=> b!294106 m!430125))

(declare-fun m!430127 () Bool)

(assert (=> b!294106 m!430127))

(declare-fun m!430129 () Bool)

(assert (=> b!294106 m!430129))

(declare-fun m!430131 () Bool)

(assert (=> b!294106 m!430131))

(declare-fun m!430133 () Bool)

(assert (=> b!294106 m!430133))

(declare-fun m!430135 () Bool)

(assert (=> b!294106 m!430135))

(declare-fun m!430137 () Bool)

(assert (=> b!294107 m!430137))

(check-sat (not b!294106) (not b!294105) (not start!65610) (not b!294107))
(check-sat)
