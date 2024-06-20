; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64586 () Bool)

(assert start!64586)

(declare-fun b!289838 () Bool)

(declare-fun e!206298 () Bool)

(declare-datatypes ((array!17175 0))(
  ( (array!17176 (arr!8433 (Array (_ BitVec 32) (_ BitVec 8))) (size!7431 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12872 0))(
  ( (BitStream!12873 (buf!7497 array!17175) (currentByte!13904 (_ BitVec 32)) (currentBit!13899 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12872)

(declare-fun array_inv!7043 (array!17175) Bool)

(assert (=> b!289838 (= e!206298 (array_inv!7043 (buf!7497 thiss!1728)))))

(declare-fun res!239463 () Bool)

(declare-fun e!206295 () Bool)

(assert (=> start!64586 (=> (not res!239463) (not e!206295))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun arr!273 () array!17175)

(declare-fun from!505 () (_ BitVec 64))

(assert (=> start!64586 (= res!239463 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7431 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64586 e!206295))

(declare-fun inv!12 (BitStream!12872) Bool)

(assert (=> start!64586 (and (inv!12 thiss!1728) e!206298)))

(assert (=> start!64586 true))

(assert (=> start!64586 (array_inv!7043 arr!273)))

(declare-fun b!289839 () Bool)

(assert (=> b!289839 (= e!206295 (not true))))

(declare-fun lt!420318 () array!17175)

(declare-fun arrayBitRangesEq!0 (array!17175 array!17175 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!289839 (arrayBitRangesEq!0 arr!273 lt!420318 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((Unit!20103 0))(
  ( (Unit!20104) )
))
(declare-fun lt!420319 () Unit!20103)

(declare-datatypes ((tuple2!22736 0))(
  ( (tuple2!22737 (_1!12585 Bool) (_2!12585 BitStream!12872)) )
))
(declare-fun lt!420324 () tuple2!22736)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17175 (_ BitVec 64) Bool) Unit!20103)

(assert (=> b!289839 (= lt!420319 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12585 lt!420324)))))

(declare-fun e!206296 () Bool)

(assert (=> b!289839 e!206296))

(declare-fun res!239465 () Bool)

(assert (=> b!289839 (=> (not res!239465) (not e!206296))))

(declare-datatypes ((tuple3!1606 0))(
  ( (tuple3!1607 (_1!12586 Unit!20103) (_2!12586 BitStream!12872) (_3!1217 array!17175)) )
))
(declare-fun lt!420323 () tuple3!1606)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!289839 (= res!239465 (= (bvsub (bvadd (bitIndex!0 (size!7431 (buf!7497 thiss!1728)) (currentByte!13904 thiss!1728) (currentBit!13899 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7431 (buf!7497 (_2!12586 lt!420323))) (currentByte!13904 (_2!12586 lt!420323)) (currentBit!13899 (_2!12586 lt!420323)))))))

(declare-fun readBitsLoop!0 (BitStream!12872 (_ BitVec 64) array!17175 (_ BitVec 64) (_ BitVec 64)) tuple3!1606)

(assert (=> b!289839 (= lt!420323 (readBitsLoop!0 (_2!12585 lt!420324) nBits!523 lt!420318 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!289839 (validate_offset_bits!1 ((_ sign_extend 32) (size!7431 (buf!7497 (_2!12585 lt!420324)))) ((_ sign_extend 32) (currentByte!13904 (_2!12585 lt!420324))) ((_ sign_extend 32) (currentBit!13899 (_2!12585 lt!420324))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420322 () Unit!20103)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12872 BitStream!12872 (_ BitVec 64) (_ BitVec 64)) Unit!20103)

(assert (=> b!289839 (= lt!420322 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12585 lt!420324) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420321 () (_ BitVec 32))

(declare-fun lt!420320 () (_ BitVec 32))

(assert (=> b!289839 (= lt!420318 (array!17176 (store (arr!8433 arr!273) lt!420321 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8433 arr!273) lt!420321)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420320)))) ((_ sign_extend 24) (ite (_1!12585 lt!420324) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420320) #b00000000))))) (size!7431 arr!273)))))

(assert (=> b!289839 (= lt!420320 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!289839 (= lt!420321 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!12872) tuple2!22736)

(assert (=> b!289839 (= lt!420324 (readBit!0 thiss!1728))))

(declare-fun b!289840 () Bool)

(declare-fun res!239464 () Bool)

(assert (=> b!289840 (=> (not res!239464) (not e!206295))))

(assert (=> b!289840 (= res!239464 (bvslt from!505 to!474))))

(declare-fun b!289841 () Bool)

(declare-fun res!239462 () Bool)

(assert (=> b!289841 (=> (not res!239462) (not e!206295))))

(assert (=> b!289841 (= res!239462 (validate_offset_bits!1 ((_ sign_extend 32) (size!7431 (buf!7497 thiss!1728))) ((_ sign_extend 32) (currentByte!13904 thiss!1728)) ((_ sign_extend 32) (currentBit!13899 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!289842 () Bool)

(assert (=> b!289842 (= e!206296 (and (= (buf!7497 thiss!1728) (buf!7497 (_2!12586 lt!420323))) (= (size!7431 arr!273) (size!7431 (_3!1217 lt!420323)))))))

(assert (= (and start!64586 res!239463) b!289841))

(assert (= (and b!289841 res!239462) b!289840))

(assert (= (and b!289840 res!239464) b!289839))

(assert (= (and b!289839 res!239465) b!289842))

(assert (= start!64586 b!289838))

(declare-fun m!423151 () Bool)

(assert (=> b!289838 m!423151))

(declare-fun m!423153 () Bool)

(assert (=> start!64586 m!423153))

(declare-fun m!423155 () Bool)

(assert (=> start!64586 m!423155))

(declare-fun m!423157 () Bool)

(assert (=> b!289839 m!423157))

(declare-fun m!423159 () Bool)

(assert (=> b!289839 m!423159))

(declare-fun m!423161 () Bool)

(assert (=> b!289839 m!423161))

(declare-fun m!423163 () Bool)

(assert (=> b!289839 m!423163))

(declare-fun m!423165 () Bool)

(assert (=> b!289839 m!423165))

(declare-fun m!423167 () Bool)

(assert (=> b!289839 m!423167))

(declare-fun m!423169 () Bool)

(assert (=> b!289839 m!423169))

(declare-fun m!423171 () Bool)

(assert (=> b!289839 m!423171))

(declare-fun m!423173 () Bool)

(assert (=> b!289839 m!423173))

(declare-fun m!423175 () Bool)

(assert (=> b!289839 m!423175))

(declare-fun m!423177 () Bool)

(assert (=> b!289839 m!423177))

(declare-fun m!423179 () Bool)

(assert (=> b!289841 m!423179))

(push 1)

(assert (not b!289841))

(assert (not b!289839))

(assert (not b!289838))

(assert (not start!64586))

(check-sat)

(pop 1)

