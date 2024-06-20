; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65616 () Bool)

(assert start!65616)

(declare-fun b!294149 () Bool)

(declare-fun e!210169 () Bool)

(declare-datatypes ((array!17599 0))(
  ( (array!17600 (arr!8660 (Array (_ BitVec 32) (_ BitVec 8))) (size!7625 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13254 0))(
  ( (BitStream!13255 (buf!7688 array!17599) (currentByte!14179 (_ BitVec 32)) (currentBit!14174 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13254)

(declare-fun array_inv!7237 (array!17599) Bool)

(assert (=> b!294149 (= e!210169 (array_inv!7237 (buf!7688 thiss!1728)))))

(declare-fun b!294150 () Bool)

(declare-fun e!210170 () Bool)

(declare-fun from!505 () (_ BitVec 64))

(assert (=> b!294150 (= e!210170 (not (or (not (= (bvand from!505 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (bvand from!505 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun arr!273 () array!17599)

(declare-fun lt!427159 () array!17599)

(declare-fun arrayBitRangesEq!0 (array!17599 array!17599 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!294150 (arrayBitRangesEq!0 arr!273 lt!427159 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((tuple2!23124 0))(
  ( (tuple2!23125 (_1!12880 Bool) (_2!12880 BitStream!13254)) )
))
(declare-fun lt!427157 () tuple2!23124)

(declare-datatypes ((Unit!20475 0))(
  ( (Unit!20476) )
))
(declare-fun lt!427155 () Unit!20475)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17599 (_ BitVec 64) Bool) Unit!20475)

(assert (=> b!294150 (= lt!427155 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12880 lt!427157)))))

(declare-fun e!210168 () Bool)

(assert (=> b!294150 e!210168))

(declare-fun res!242897 () Bool)

(assert (=> b!294150 (=> (not res!242897) (not e!210168))))

(declare-datatypes ((tuple3!1766 0))(
  ( (tuple3!1767 (_1!12881 Unit!20475) (_2!12881 BitStream!13254) (_3!1318 array!17599)) )
))
(declare-fun lt!427156 () tuple3!1766)

(declare-fun to!474 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!294150 (= res!242897 (= (bvsub (bvadd (bitIndex!0 (size!7625 (buf!7688 thiss!1728)) (currentByte!14179 thiss!1728) (currentBit!14174 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7625 (buf!7688 (_2!12881 lt!427156))) (currentByte!14179 (_2!12881 lt!427156)) (currentBit!14174 (_2!12881 lt!427156)))))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun readBitsLoop!0 (BitStream!13254 (_ BitVec 64) array!17599 (_ BitVec 64) (_ BitVec 64)) tuple3!1766)

(assert (=> b!294150 (= lt!427156 (readBitsLoop!0 (_2!12880 lt!427157) nBits!523 lt!427159 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!294150 (validate_offset_bits!1 ((_ sign_extend 32) (size!7625 (buf!7688 (_2!12880 lt!427157)))) ((_ sign_extend 32) (currentByte!14179 (_2!12880 lt!427157))) ((_ sign_extend 32) (currentBit!14174 (_2!12880 lt!427157))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!427161 () Unit!20475)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13254 BitStream!13254 (_ BitVec 64) (_ BitVec 64)) Unit!20475)

(assert (=> b!294150 (= lt!427161 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12880 lt!427157) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!427160 () (_ BitVec 32))

(declare-fun lt!427158 () (_ BitVec 32))

(assert (=> b!294150 (= lt!427159 (array!17600 (store (arr!8660 arr!273) lt!427158 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8660 arr!273) lt!427158)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!427160)))) ((_ sign_extend 24) (ite (_1!12880 lt!427157) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!427160) #b00000000))))) (size!7625 arr!273)))))

(assert (=> b!294150 (= lt!427160 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!294150 (= lt!427158 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!13254) tuple2!23124)

(assert (=> b!294150 (= lt!427157 (readBit!0 thiss!1728))))

(declare-fun res!242895 () Bool)

(assert (=> start!65616 (=> (not res!242895) (not e!210170))))

(assert (=> start!65616 (= res!242895 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7625 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65616 e!210170))

(declare-fun inv!12 (BitStream!13254) Bool)

(assert (=> start!65616 (and (inv!12 thiss!1728) e!210169)))

(assert (=> start!65616 true))

(assert (=> start!65616 (array_inv!7237 arr!273)))

(declare-fun b!294151 () Bool)

(declare-fun res!242894 () Bool)

(assert (=> b!294151 (=> (not res!242894) (not e!210170))))

(assert (=> b!294151 (= res!242894 (validate_offset_bits!1 ((_ sign_extend 32) (size!7625 (buf!7688 thiss!1728))) ((_ sign_extend 32) (currentByte!14179 thiss!1728)) ((_ sign_extend 32) (currentBit!14174 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!294152 () Bool)

(assert (=> b!294152 (= e!210168 (and (= (buf!7688 thiss!1728) (buf!7688 (_2!12881 lt!427156))) (= (size!7625 arr!273) (size!7625 (_3!1318 lt!427156)))))))

(declare-fun b!294153 () Bool)

(declare-fun res!242896 () Bool)

(assert (=> b!294153 (=> (not res!242896) (not e!210170))))

(assert (=> b!294153 (= res!242896 (bvslt from!505 to!474))))

(assert (= (and start!65616 res!242895) b!294151))

(assert (= (and b!294151 res!242894) b!294153))

(assert (= (and b!294153 res!242896) b!294150))

(assert (= (and b!294150 res!242897) b!294152))

(assert (= start!65616 b!294149))

(declare-fun m!430195 () Bool)

(assert (=> b!294149 m!430195))

(declare-fun m!430197 () Bool)

(assert (=> b!294150 m!430197))

(declare-fun m!430199 () Bool)

(assert (=> b!294150 m!430199))

(declare-fun m!430201 () Bool)

(assert (=> b!294150 m!430201))

(declare-fun m!430203 () Bool)

(assert (=> b!294150 m!430203))

(declare-fun m!430205 () Bool)

(assert (=> b!294150 m!430205))

(declare-fun m!430207 () Bool)

(assert (=> b!294150 m!430207))

(declare-fun m!430209 () Bool)

(assert (=> b!294150 m!430209))

(declare-fun m!430211 () Bool)

(assert (=> b!294150 m!430211))

(declare-fun m!430213 () Bool)

(assert (=> b!294150 m!430213))

(declare-fun m!430215 () Bool)

(assert (=> b!294150 m!430215))

(declare-fun m!430217 () Bool)

(assert (=> b!294150 m!430217))

(declare-fun m!430219 () Bool)

(assert (=> start!65616 m!430219))

(declare-fun m!430221 () Bool)

(assert (=> start!65616 m!430221))

(declare-fun m!430223 () Bool)

(assert (=> b!294151 m!430223))

(check-sat (not b!294149) (not b!294150) (not start!65616) (not b!294151))
(check-sat)
