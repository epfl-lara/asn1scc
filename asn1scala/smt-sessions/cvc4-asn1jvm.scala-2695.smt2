; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66050 () Bool)

(assert start!66050)

(declare-fun b!296114 () Bool)

(declare-fun e!211827 () Bool)

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(assert (=> b!296114 (= e!211827 (or (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!505 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!474 from!505) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!296115 () Bool)

(declare-datatypes ((array!17718 0))(
  ( (array!17719 (arr!8736 (Array (_ BitVec 32) (_ BitVec 8))) (size!7677 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13358 0))(
  ( (BitStream!13359 (buf!7740 array!17718) (currentByte!14261 (_ BitVec 32)) (currentBit!14256 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!20639 0))(
  ( (Unit!20640) )
))
(declare-datatypes ((tuple3!1870 0))(
  ( (tuple3!1871 (_1!13031 Unit!20639) (_2!13031 BitStream!13358) (_3!1385 array!17718)) )
))
(declare-fun lt!431273 () tuple3!1870)

(declare-fun arr!273 () array!17718)

(declare-fun thiss!1728 () BitStream!13358)

(declare-fun e!211825 () Bool)

(assert (=> b!296115 (= e!211825 (and (= (buf!7740 thiss!1728) (buf!7740 (_2!13031 lt!431273))) (= (size!7677 arr!273) (size!7677 (_3!1385 lt!431273)))))))

(declare-fun b!296116 () Bool)

(declare-fun e!211821 () Bool)

(declare-fun array_inv!7289 (array!17718) Bool)

(assert (=> b!296116 (= e!211821 (array_inv!7289 (buf!7740 thiss!1728)))))

(declare-fun b!296117 () Bool)

(declare-fun res!244476 () Bool)

(declare-fun e!211823 () Bool)

(assert (=> b!296117 (=> (not res!244476) (not e!211823))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!296117 (= res!244476 (validate_offset_bits!1 ((_ sign_extend 32) (size!7677 (buf!7740 thiss!1728))) ((_ sign_extend 32) (currentByte!14261 thiss!1728)) ((_ sign_extend 32) (currentBit!14256 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!296118 () Bool)

(declare-fun e!211822 () Bool)

(declare-fun lt!431276 () Bool)

(declare-datatypes ((tuple2!23292 0))(
  ( (tuple2!23293 (_1!13032 Bool) (_2!13032 BitStream!13358)) )
))
(declare-fun lt!431274 () tuple2!23292)

(assert (=> b!296118 (= e!211822 (= lt!431276 (_1!13032 lt!431274)))))

(declare-fun res!244474 () Bool)

(assert (=> start!66050 (=> (not res!244474) (not e!211823))))

(assert (=> start!66050 (= res!244474 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7677 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!66050 e!211823))

(declare-fun inv!12 (BitStream!13358) Bool)

(assert (=> start!66050 (and (inv!12 thiss!1728) e!211821)))

(assert (=> start!66050 true))

(assert (=> start!66050 (array_inv!7289 arr!273)))

(declare-fun b!296119 () Bool)

(declare-fun res!244472 () Bool)

(assert (=> b!296119 (=> (not res!244472) (not e!211823))))

(assert (=> b!296119 (= res!244472 (bvslt from!505 to!474))))

(declare-fun b!296120 () Bool)

(declare-fun res!244475 () Bool)

(assert (=> b!296120 (=> res!244475 e!211827)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!296120 (= res!244475 (not (invariant!0 (currentBit!14256 (_2!13031 lt!431273)) (currentByte!14261 (_2!13031 lt!431273)) (size!7677 (buf!7740 (_2!13031 lt!431273))))))))

(declare-fun b!296121 () Bool)

(assert (=> b!296121 (= e!211823 (not e!211827))))

(declare-fun res!244477 () Bool)

(assert (=> b!296121 (=> res!244477 e!211827)))

(declare-datatypes ((tuple2!23294 0))(
  ( (tuple2!23295 (_1!13033 BitStream!13358) (_2!13033 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!13358) tuple2!23294)

(assert (=> b!296121 (= res!244477 (not (= lt!431276 (_2!13033 (readBitPure!0 thiss!1728)))))))

(assert (=> b!296121 e!211822))

(declare-fun res!244478 () Bool)

(assert (=> b!296121 (=> (not res!244478) (not e!211822))))

(declare-fun lt!431268 () array!17718)

(declare-fun bitAt!0 (array!17718 (_ BitVec 64)) Bool)

(assert (=> b!296121 (= res!244478 (= (bitAt!0 lt!431268 from!505) lt!431276))))

(assert (=> b!296121 (= lt!431276 (bitAt!0 (_3!1385 lt!431273) from!505))))

(declare-fun lt!431272 () Unit!20639)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17718 array!17718 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20639)

(assert (=> b!296121 (= lt!431272 (arrayBitRangesEqImpliesEq!0 lt!431268 (_3!1385 lt!431273) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun arrayBitRangesEq!0 (array!17718 array!17718 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!296121 (arrayBitRangesEq!0 arr!273 (_3!1385 lt!431273) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!431277 () Unit!20639)

(declare-fun arrayBitRangesEqTransitive!0 (array!17718 array!17718 array!17718 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20639)

(assert (=> b!296121 (= lt!431277 (arrayBitRangesEqTransitive!0 arr!273 lt!431268 (_3!1385 lt!431273) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!296121 (arrayBitRangesEq!0 arr!273 lt!431268 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!431271 () Unit!20639)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17718 (_ BitVec 64) Bool) Unit!20639)

(assert (=> b!296121 (= lt!431271 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!13032 lt!431274)))))

(assert (=> b!296121 e!211825))

(declare-fun res!244473 () Bool)

(assert (=> b!296121 (=> (not res!244473) (not e!211825))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!296121 (= res!244473 (= (bvsub (bvadd (bitIndex!0 (size!7677 (buf!7740 thiss!1728)) (currentByte!14261 thiss!1728) (currentBit!14256 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7677 (buf!7740 (_2!13031 lt!431273))) (currentByte!14261 (_2!13031 lt!431273)) (currentBit!14256 (_2!13031 lt!431273)))))))

(declare-fun readBitsLoop!0 (BitStream!13358 (_ BitVec 64) array!17718 (_ BitVec 64) (_ BitVec 64)) tuple3!1870)

(assert (=> b!296121 (= lt!431273 (readBitsLoop!0 (_2!13032 lt!431274) nBits!523 lt!431268 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!296121 (validate_offset_bits!1 ((_ sign_extend 32) (size!7677 (buf!7740 (_2!13032 lt!431274)))) ((_ sign_extend 32) (currentByte!14261 (_2!13032 lt!431274))) ((_ sign_extend 32) (currentBit!14256 (_2!13032 lt!431274))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!431269 () Unit!20639)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13358 BitStream!13358 (_ BitVec 64) (_ BitVec 64)) Unit!20639)

(assert (=> b!296121 (= lt!431269 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!13032 lt!431274) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!431270 () (_ BitVec 32))

(declare-fun lt!431275 () (_ BitVec 32))

(assert (=> b!296121 (= lt!431268 (array!17719 (store (arr!8736 arr!273) lt!431275 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8736 arr!273) lt!431275)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!431270)))) ((_ sign_extend 24) (ite (_1!13032 lt!431274) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!431270) #b00000000))))) (size!7677 arr!273)))))

(assert (=> b!296121 (= lt!431270 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!296121 (= lt!431275 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!13358) tuple2!23292)

(assert (=> b!296121 (= lt!431274 (readBit!0 thiss!1728))))

(assert (= (and start!66050 res!244474) b!296117))

(assert (= (and b!296117 res!244476) b!296119))

(assert (= (and b!296119 res!244472) b!296121))

(assert (= (and b!296121 res!244473) b!296115))

(assert (= (and b!296121 res!244478) b!296118))

(assert (= (and b!296121 (not res!244477)) b!296120))

(assert (= (and b!296120 (not res!244475)) b!296114))

(assert (= start!66050 b!296116))

(declare-fun m!433949 () Bool)

(assert (=> b!296120 m!433949))

(declare-fun m!433951 () Bool)

(assert (=> b!296117 m!433951))

(declare-fun m!433953 () Bool)

(assert (=> start!66050 m!433953))

(declare-fun m!433955 () Bool)

(assert (=> start!66050 m!433955))

(declare-fun m!433957 () Bool)

(assert (=> b!296116 m!433957))

(declare-fun m!433959 () Bool)

(assert (=> b!296121 m!433959))

(declare-fun m!433961 () Bool)

(assert (=> b!296121 m!433961))

(declare-fun m!433963 () Bool)

(assert (=> b!296121 m!433963))

(declare-fun m!433965 () Bool)

(assert (=> b!296121 m!433965))

(declare-fun m!433967 () Bool)

(assert (=> b!296121 m!433967))

(declare-fun m!433969 () Bool)

(assert (=> b!296121 m!433969))

(declare-fun m!433971 () Bool)

(assert (=> b!296121 m!433971))

(declare-fun m!433973 () Bool)

(assert (=> b!296121 m!433973))

(declare-fun m!433975 () Bool)

(assert (=> b!296121 m!433975))

(declare-fun m!433977 () Bool)

(assert (=> b!296121 m!433977))

(declare-fun m!433979 () Bool)

(assert (=> b!296121 m!433979))

(declare-fun m!433981 () Bool)

(assert (=> b!296121 m!433981))

(declare-fun m!433983 () Bool)

(assert (=> b!296121 m!433983))

(declare-fun m!433985 () Bool)

(assert (=> b!296121 m!433985))

(declare-fun m!433987 () Bool)

(assert (=> b!296121 m!433987))

(declare-fun m!433989 () Bool)

(assert (=> b!296121 m!433989))

(declare-fun m!433991 () Bool)

(assert (=> b!296121 m!433991))

(push 1)

(assert (not b!296116))

(assert (not start!66050))

(assert (not b!296120))

(assert (not b!296121))

(assert (not b!296117))

(check-sat)

(pop 1)

(push 1)

(check-sat)

