; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64578 () Bool)

(assert start!64578)

(declare-datatypes ((array!17167 0))(
  ( (array!17168 (arr!8429 (Array (_ BitVec 32) (_ BitVec 8))) (size!7427 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12864 0))(
  ( (BitStream!12865 (buf!7493 array!17167) (currentByte!13900 (_ BitVec 32)) (currentBit!13895 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12864)

(declare-fun e!206235 () Bool)

(declare-datatypes ((Unit!20095 0))(
  ( (Unit!20096) )
))
(declare-datatypes ((tuple3!1598 0))(
  ( (tuple3!1599 (_1!12577 Unit!20095) (_2!12577 BitStream!12864) (_3!1213 array!17167)) )
))
(declare-fun lt!420236 () tuple3!1598)

(declare-fun b!289778 () Bool)

(declare-fun arr!273 () array!17167)

(assert (=> b!289778 (= e!206235 (and (= (buf!7493 thiss!1728) (buf!7493 (_2!12577 lt!420236))) (= (size!7427 arr!273) (size!7427 (_3!1213 lt!420236)))))))

(declare-fun b!289779 () Bool)

(declare-fun res!239414 () Bool)

(declare-fun e!206237 () Bool)

(assert (=> b!289779 (=> (not res!239414) (not e!206237))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!289779 (= res!239414 (validate_offset_bits!1 ((_ sign_extend 32) (size!7427 (buf!7493 thiss!1728))) ((_ sign_extend 32) (currentByte!13900 thiss!1728)) ((_ sign_extend 32) (currentBit!13895 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!289780 () Bool)

(assert (=> b!289780 (= e!206237 (not true))))

(declare-fun lt!420237 () array!17167)

(declare-fun arrayBitRangesEq!0 (array!17167 array!17167 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!289780 (arrayBitRangesEq!0 arr!273 lt!420237 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!420239 () Unit!20095)

(declare-datatypes ((tuple2!22728 0))(
  ( (tuple2!22729 (_1!12578 Bool) (_2!12578 BitStream!12864)) )
))
(declare-fun lt!420240 () tuple2!22728)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17167 (_ BitVec 64) Bool) Unit!20095)

(assert (=> b!289780 (= lt!420239 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12578 lt!420240)))))

(assert (=> b!289780 e!206235))

(declare-fun res!239415 () Bool)

(assert (=> b!289780 (=> (not res!239415) (not e!206235))))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!289780 (= res!239415 (= (bvsub (bvadd (bitIndex!0 (size!7427 (buf!7493 thiss!1728)) (currentByte!13900 thiss!1728) (currentBit!13895 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7427 (buf!7493 (_2!12577 lt!420236))) (currentByte!13900 (_2!12577 lt!420236)) (currentBit!13895 (_2!12577 lt!420236)))))))

(declare-fun readBitsLoop!0 (BitStream!12864 (_ BitVec 64) array!17167 (_ BitVec 64) (_ BitVec 64)) tuple3!1598)

(assert (=> b!289780 (= lt!420236 (readBitsLoop!0 (_2!12578 lt!420240) nBits!523 lt!420237 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!289780 (validate_offset_bits!1 ((_ sign_extend 32) (size!7427 (buf!7493 (_2!12578 lt!420240)))) ((_ sign_extend 32) (currentByte!13900 (_2!12578 lt!420240))) ((_ sign_extend 32) (currentBit!13895 (_2!12578 lt!420240))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420238 () Unit!20095)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12864 BitStream!12864 (_ BitVec 64) (_ BitVec 64)) Unit!20095)

(assert (=> b!289780 (= lt!420238 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12578 lt!420240) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420235 () (_ BitVec 32))

(declare-fun lt!420234 () (_ BitVec 32))

(assert (=> b!289780 (= lt!420237 (array!17168 (store (arr!8429 arr!273) lt!420235 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8429 arr!273) lt!420235)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420234)))) ((_ sign_extend 24) (ite (_1!12578 lt!420240) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420234) #b00000000))))) (size!7427 arr!273)))))

(assert (=> b!289780 (= lt!420234 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!289780 (= lt!420235 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!12864) tuple2!22728)

(assert (=> b!289780 (= lt!420240 (readBit!0 thiss!1728))))

(declare-fun b!289781 () Bool)

(declare-fun e!206238 () Bool)

(declare-fun array_inv!7039 (array!17167) Bool)

(assert (=> b!289781 (= e!206238 (array_inv!7039 (buf!7493 thiss!1728)))))

(declare-fun b!289782 () Bool)

(declare-fun res!239417 () Bool)

(assert (=> b!289782 (=> (not res!239417) (not e!206237))))

(assert (=> b!289782 (= res!239417 (bvslt from!505 to!474))))

(declare-fun res!239416 () Bool)

(assert (=> start!64578 (=> (not res!239416) (not e!206237))))

(assert (=> start!64578 (= res!239416 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7427 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64578 e!206237))

(declare-fun inv!12 (BitStream!12864) Bool)

(assert (=> start!64578 (and (inv!12 thiss!1728) e!206238)))

(assert (=> start!64578 true))

(assert (=> start!64578 (array_inv!7039 arr!273)))

(assert (= (and start!64578 res!239416) b!289779))

(assert (= (and b!289779 res!239414) b!289782))

(assert (= (and b!289782 res!239417) b!289780))

(assert (= (and b!289780 res!239415) b!289778))

(assert (= start!64578 b!289781))

(declare-fun m!423031 () Bool)

(assert (=> b!289779 m!423031))

(declare-fun m!423033 () Bool)

(assert (=> b!289780 m!423033))

(declare-fun m!423035 () Bool)

(assert (=> b!289780 m!423035))

(declare-fun m!423037 () Bool)

(assert (=> b!289780 m!423037))

(declare-fun m!423039 () Bool)

(assert (=> b!289780 m!423039))

(declare-fun m!423041 () Bool)

(assert (=> b!289780 m!423041))

(declare-fun m!423043 () Bool)

(assert (=> b!289780 m!423043))

(declare-fun m!423045 () Bool)

(assert (=> b!289780 m!423045))

(declare-fun m!423047 () Bool)

(assert (=> b!289780 m!423047))

(declare-fun m!423049 () Bool)

(assert (=> b!289780 m!423049))

(declare-fun m!423051 () Bool)

(assert (=> b!289780 m!423051))

(declare-fun m!423053 () Bool)

(assert (=> b!289780 m!423053))

(declare-fun m!423055 () Bool)

(assert (=> b!289781 m!423055))

(declare-fun m!423057 () Bool)

(assert (=> start!64578 m!423057))

(declare-fun m!423059 () Bool)

(assert (=> start!64578 m!423059))

(check-sat (not b!289779) (not start!64578) (not b!289781) (not b!289780))
