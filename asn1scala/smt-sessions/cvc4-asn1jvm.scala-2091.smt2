; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53106 () Bool)

(assert start!53106)

(declare-fun b!246202 () Bool)

(declare-fun res!205934 () Bool)

(declare-fun e!170567 () Bool)

(assert (=> b!246202 (=> (not res!205934) (not e!170567))))

(declare-datatypes ((array!13434 0))(
  ( (array!13435 (arr!6876 (Array (_ BitVec 32) (_ BitVec 8))) (size!5889 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10700 0))(
  ( (BitStream!10701 (buf!6370 array!13434) (currentByte!11766 (_ BitVec 32)) (currentBit!11761 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!17890 0))(
  ( (Unit!17891) )
))
(declare-datatypes ((tuple2!21114 0))(
  ( (tuple2!21115 (_1!11479 Unit!17890) (_2!11479 BitStream!10700)) )
))
(declare-fun lt!384119 () tuple2!21114)

(declare-fun lt!384124 () tuple2!21114)

(declare-fun isPrefixOf!0 (BitStream!10700 BitStream!10700) Bool)

(assert (=> b!246202 (= res!205934 (isPrefixOf!0 (_2!11479 lt!384119) (_2!11479 lt!384124)))))

(declare-fun b!246203 () Bool)

(declare-fun e!170572 () Bool)

(declare-fun e!170562 () Bool)

(assert (=> b!246203 (= e!170572 e!170562)))

(declare-fun res!205936 () Bool)

(assert (=> b!246203 (=> (not res!205936) (not e!170562))))

(declare-datatypes ((tuple2!21116 0))(
  ( (tuple2!21117 (_1!11480 BitStream!10700) (_2!11480 Bool)) )
))
(declare-fun lt!384116 () tuple2!21116)

(declare-fun bit!26 () Bool)

(assert (=> b!246203 (= res!205936 (and (= (_2!11480 lt!384116) bit!26) (= (_1!11480 lt!384116) (_2!11479 lt!384119))))))

(declare-fun thiss!1005 () BitStream!10700)

(declare-fun readBitPure!0 (BitStream!10700) tuple2!21116)

(declare-fun readerFrom!0 (BitStream!10700 (_ BitVec 32) (_ BitVec 32)) BitStream!10700)

(assert (=> b!246203 (= lt!384116 (readBitPure!0 (readerFrom!0 (_2!11479 lt!384119) (currentBit!11761 thiss!1005) (currentByte!11766 thiss!1005))))))

(declare-fun b!246204 () Bool)

(declare-fun e!170566 () Bool)

(assert (=> b!246204 (= e!170566 e!170567)))

(declare-fun res!205944 () Bool)

(assert (=> b!246204 (=> (not res!205944) (not e!170567))))

(declare-fun lt!384120 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!246204 (= res!205944 (= (bitIndex!0 (size!5889 (buf!6370 (_2!11479 lt!384124))) (currentByte!11766 (_2!11479 lt!384124)) (currentBit!11761 (_2!11479 lt!384124))) (bvadd (bitIndex!0 (size!5889 (buf!6370 (_2!11479 lt!384119))) (currentByte!11766 (_2!11479 lt!384119)) (currentBit!11761 (_2!11479 lt!384119))) lt!384120)))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> b!246204 (= lt!384120 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!246206 () Bool)

(declare-fun lt!384123 () tuple2!21116)

(declare-datatypes ((tuple2!21118 0))(
  ( (tuple2!21119 (_1!11481 BitStream!10700) (_2!11481 BitStream!10700)) )
))
(declare-fun lt!384112 () tuple2!21118)

(assert (=> b!246206 (= e!170567 (not (or (not (_2!11480 lt!384123)) (not (= (_1!11480 lt!384123) (_2!11481 lt!384112))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10700 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21116)

(assert (=> b!246206 (= lt!384123 (checkBitsLoopPure!0 (_1!11481 lt!384112) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!246206 (validate_offset_bits!1 ((_ sign_extend 32) (size!5889 (buf!6370 (_2!11479 lt!384124)))) ((_ sign_extend 32) (currentByte!11766 (_2!11479 lt!384119))) ((_ sign_extend 32) (currentBit!11761 (_2!11479 lt!384119))) lt!384120)))

(declare-fun lt!384104 () Unit!17890)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10700 array!13434 (_ BitVec 64)) Unit!17890)

(assert (=> b!246206 (= lt!384104 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11479 lt!384119) (buf!6370 (_2!11479 lt!384124)) lt!384120))))

(declare-fun reader!0 (BitStream!10700 BitStream!10700) tuple2!21118)

(assert (=> b!246206 (= lt!384112 (reader!0 (_2!11479 lt!384119) (_2!11479 lt!384124)))))

(declare-fun b!246207 () Bool)

(declare-fun e!170568 () Bool)

(assert (=> b!246207 (= e!170568 e!170572)))

(declare-fun res!205941 () Bool)

(assert (=> b!246207 (=> (not res!205941) (not e!170572))))

(declare-fun lt!384108 () (_ BitVec 64))

(declare-fun lt!384118 () (_ BitVec 64))

(assert (=> b!246207 (= res!205941 (= lt!384108 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!384118)))))

(assert (=> b!246207 (= lt!384108 (bitIndex!0 (size!5889 (buf!6370 (_2!11479 lt!384119))) (currentByte!11766 (_2!11479 lt!384119)) (currentBit!11761 (_2!11479 lt!384119))))))

(assert (=> b!246207 (= lt!384118 (bitIndex!0 (size!5889 (buf!6370 thiss!1005)) (currentByte!11766 thiss!1005) (currentBit!11761 thiss!1005)))))

(declare-fun b!246208 () Bool)

(declare-fun e!170564 () Bool)

(declare-fun array_inv!5630 (array!13434) Bool)

(assert (=> b!246208 (= e!170564 (array_inv!5630 (buf!6370 thiss!1005)))))

(declare-fun b!246209 () Bool)

(declare-fun res!205943 () Bool)

(declare-fun e!170563 () Bool)

(assert (=> b!246209 (=> res!205943 e!170563)))

(declare-fun lt!384105 () tuple2!21118)

(declare-fun lt!384117 () tuple2!21118)

(declare-fun withMovedBitIndex!0 (BitStream!10700 (_ BitVec 64)) BitStream!10700)

(assert (=> b!246209 (= res!205943 (not (= (_1!11481 lt!384105) (withMovedBitIndex!0 (_1!11481 lt!384117) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!246210 () Bool)

(declare-fun e!170569 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!246210 (= e!170569 (invariant!0 (currentBit!11761 thiss!1005) (currentByte!11766 thiss!1005) (size!5889 (buf!6370 (_2!11479 lt!384124)))))))

(declare-fun b!246211 () Bool)

(declare-fun e!170571 () Bool)

(assert (=> b!246211 (= e!170571 (not e!170563))))

(declare-fun res!205946 () Bool)

(assert (=> b!246211 (=> res!205946 e!170563)))

(declare-fun lt!384125 () tuple2!21116)

(assert (=> b!246211 (= res!205946 (not (= (_1!11480 lt!384125) (_2!11481 lt!384105))))))

(assert (=> b!246211 (= lt!384125 (checkBitsLoopPure!0 (_1!11481 lt!384105) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!384113 () (_ BitVec 64))

(assert (=> b!246211 (validate_offset_bits!1 ((_ sign_extend 32) (size!5889 (buf!6370 (_2!11479 lt!384124)))) ((_ sign_extend 32) (currentByte!11766 (_2!11479 lt!384119))) ((_ sign_extend 32) (currentBit!11761 (_2!11479 lt!384119))) lt!384113)))

(declare-fun lt!384103 () Unit!17890)

(assert (=> b!246211 (= lt!384103 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11479 lt!384119) (buf!6370 (_2!11479 lt!384124)) lt!384113))))

(declare-fun lt!384106 () tuple2!21116)

(assert (=> b!246211 (= lt!384106 (checkBitsLoopPure!0 (_1!11481 lt!384117) nBits!297 bit!26 from!289))))

(assert (=> b!246211 (validate_offset_bits!1 ((_ sign_extend 32) (size!5889 (buf!6370 (_2!11479 lt!384124)))) ((_ sign_extend 32) (currentByte!11766 thiss!1005)) ((_ sign_extend 32) (currentBit!11761 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!384107 () Unit!17890)

(assert (=> b!246211 (= lt!384107 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6370 (_2!11479 lt!384124)) (bvsub nBits!297 from!289)))))

(assert (=> b!246211 (= (_2!11480 (readBitPure!0 (_1!11481 lt!384117))) bit!26)))

(assert (=> b!246211 (= lt!384105 (reader!0 (_2!11479 lt!384119) (_2!11479 lt!384124)))))

(assert (=> b!246211 (= lt!384117 (reader!0 thiss!1005 (_2!11479 lt!384124)))))

(declare-fun e!170565 () Bool)

(assert (=> b!246211 e!170565))

(declare-fun res!205947 () Bool)

(assert (=> b!246211 (=> (not res!205947) (not e!170565))))

(declare-fun lt!384122 () tuple2!21116)

(declare-fun lt!384110 () tuple2!21116)

(assert (=> b!246211 (= res!205947 (= (bitIndex!0 (size!5889 (buf!6370 (_1!11480 lt!384122))) (currentByte!11766 (_1!11480 lt!384122)) (currentBit!11761 (_1!11480 lt!384122))) (bitIndex!0 (size!5889 (buf!6370 (_1!11480 lt!384110))) (currentByte!11766 (_1!11480 lt!384110)) (currentBit!11761 (_1!11480 lt!384110)))))))

(declare-fun lt!384114 () Unit!17890)

(declare-fun lt!384115 () BitStream!10700)

(declare-fun readBitPrefixLemma!0 (BitStream!10700 BitStream!10700) Unit!17890)

(assert (=> b!246211 (= lt!384114 (readBitPrefixLemma!0 lt!384115 (_2!11479 lt!384124)))))

(assert (=> b!246211 (= lt!384110 (readBitPure!0 (BitStream!10701 (buf!6370 (_2!11479 lt!384124)) (currentByte!11766 thiss!1005) (currentBit!11761 thiss!1005))))))

(assert (=> b!246211 (= lt!384122 (readBitPure!0 lt!384115))))

(assert (=> b!246211 (= lt!384115 (BitStream!10701 (buf!6370 (_2!11479 lt!384119)) (currentByte!11766 thiss!1005) (currentBit!11761 thiss!1005)))))

(assert (=> b!246211 e!170569))

(declare-fun res!205938 () Bool)

(assert (=> b!246211 (=> (not res!205938) (not e!170569))))

(assert (=> b!246211 (= res!205938 (isPrefixOf!0 thiss!1005 (_2!11479 lt!384124)))))

(declare-fun lt!384109 () Unit!17890)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10700 BitStream!10700 BitStream!10700) Unit!17890)

(assert (=> b!246211 (= lt!384109 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11479 lt!384119) (_2!11479 lt!384124)))))

(assert (=> b!246211 e!170566))

(declare-fun res!205933 () Bool)

(assert (=> b!246211 (=> (not res!205933) (not e!170566))))

(assert (=> b!246211 (= res!205933 (= (size!5889 (buf!6370 (_2!11479 lt!384119))) (size!5889 (buf!6370 (_2!11479 lt!384124)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10700 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21114)

(assert (=> b!246211 (= lt!384124 (appendNBitsLoop!0 (_2!11479 lt!384119) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!246211 (validate_offset_bits!1 ((_ sign_extend 32) (size!5889 (buf!6370 (_2!11479 lt!384119)))) ((_ sign_extend 32) (currentByte!11766 (_2!11479 lt!384119))) ((_ sign_extend 32) (currentBit!11761 (_2!11479 lt!384119))) lt!384113)))

(assert (=> b!246211 (= lt!384113 (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!384126 () Unit!17890)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10700 BitStream!10700 (_ BitVec 64) (_ BitVec 64)) Unit!17890)

(assert (=> b!246211 (= lt!384126 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11479 lt!384119) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!246211 e!170568))

(declare-fun res!205940 () Bool)

(assert (=> b!246211 (=> (not res!205940) (not e!170568))))

(assert (=> b!246211 (= res!205940 (= (size!5889 (buf!6370 thiss!1005)) (size!5889 (buf!6370 (_2!11479 lt!384119)))))))

(declare-fun appendBit!0 (BitStream!10700 Bool) tuple2!21114)

(assert (=> b!246211 (= lt!384119 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!246212 () Bool)

(declare-fun res!205932 () Bool)

(assert (=> b!246212 (=> (not res!205932) (not e!170569))))

(assert (=> b!246212 (= res!205932 (invariant!0 (currentBit!11761 thiss!1005) (currentByte!11766 thiss!1005) (size!5889 (buf!6370 (_2!11479 lt!384119)))))))

(declare-fun b!246213 () Bool)

(declare-fun e!170570 () Bool)

(assert (=> b!246213 (= e!170570 true)))

(declare-fun lt!384121 () (_ BitVec 64))

(assert (=> b!246213 (= lt!384121 (bitIndex!0 (size!5889 (buf!6370 (_2!11479 lt!384124))) (currentByte!11766 (_2!11479 lt!384124)) (currentBit!11761 (_2!11479 lt!384124))))))

(declare-fun lt!384111 () (_ BitVec 64))

(assert (=> b!246213 (= lt!384111 (bitIndex!0 (size!5889 (buf!6370 thiss!1005)) (currentByte!11766 thiss!1005) (currentBit!11761 thiss!1005)))))

(declare-fun b!246214 () Bool)

(assert (=> b!246214 (= e!170563 e!170570)))

(declare-fun res!205935 () Bool)

(assert (=> b!246214 (=> res!205935 e!170570)))

(assert (=> b!246214 (= res!205935 (not (= (size!5889 (buf!6370 thiss!1005)) (size!5889 (buf!6370 (_2!11479 lt!384124))))))))

(assert (=> b!246214 (and (= (_2!11480 lt!384106) (_2!11480 lt!384125)) (= (_1!11480 lt!384106) (_2!11481 lt!384117)))))

(declare-fun b!246205 () Bool)

(declare-fun res!205937 () Bool)

(assert (=> b!246205 (=> (not res!205937) (not e!170571))))

(assert (=> b!246205 (= res!205937 (validate_offset_bits!1 ((_ sign_extend 32) (size!5889 (buf!6370 thiss!1005))) ((_ sign_extend 32) (currentByte!11766 thiss!1005)) ((_ sign_extend 32) (currentBit!11761 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun res!205945 () Bool)

(assert (=> start!53106 (=> (not res!205945) (not e!170571))))

(assert (=> start!53106 (= res!205945 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53106 e!170571))

(assert (=> start!53106 true))

(declare-fun inv!12 (BitStream!10700) Bool)

(assert (=> start!53106 (and (inv!12 thiss!1005) e!170564)))

(declare-fun b!246215 () Bool)

(declare-fun res!205942 () Bool)

(assert (=> b!246215 (=> (not res!205942) (not e!170571))))

(assert (=> b!246215 (= res!205942 (bvslt from!289 nBits!297))))

(declare-fun b!246216 () Bool)

(assert (=> b!246216 (= e!170565 (= (_2!11480 lt!384122) (_2!11480 lt!384110)))))

(declare-fun b!246217 () Bool)

(declare-fun res!205939 () Bool)

(assert (=> b!246217 (=> (not res!205939) (not e!170572))))

(assert (=> b!246217 (= res!205939 (isPrefixOf!0 thiss!1005 (_2!11479 lt!384119)))))

(declare-fun b!246218 () Bool)

(assert (=> b!246218 (= e!170562 (= (bitIndex!0 (size!5889 (buf!6370 (_1!11480 lt!384116))) (currentByte!11766 (_1!11480 lt!384116)) (currentBit!11761 (_1!11480 lt!384116))) lt!384108))))

(assert (= (and start!53106 res!205945) b!246205))

(assert (= (and b!246205 res!205937) b!246215))

(assert (= (and b!246215 res!205942) b!246211))

(assert (= (and b!246211 res!205940) b!246207))

(assert (= (and b!246207 res!205941) b!246217))

(assert (= (and b!246217 res!205939) b!246203))

(assert (= (and b!246203 res!205936) b!246218))

(assert (= (and b!246211 res!205933) b!246204))

(assert (= (and b!246204 res!205944) b!246202))

(assert (= (and b!246202 res!205934) b!246206))

(assert (= (and b!246211 res!205938) b!246212))

(assert (= (and b!246212 res!205932) b!246210))

(assert (= (and b!246211 res!205947) b!246216))

(assert (= (and b!246211 (not res!205946)) b!246209))

(assert (= (and b!246209 (not res!205943)) b!246214))

(assert (= (and b!246214 (not res!205935)) b!246213))

(assert (= start!53106 b!246208))

(declare-fun m!371331 () Bool)

(assert (=> b!246212 m!371331))

(declare-fun m!371333 () Bool)

(assert (=> b!246205 m!371333))

(declare-fun m!371335 () Bool)

(assert (=> b!246218 m!371335))

(declare-fun m!371337 () Bool)

(assert (=> b!246208 m!371337))

(declare-fun m!371339 () Bool)

(assert (=> b!246204 m!371339))

(declare-fun m!371341 () Bool)

(assert (=> b!246204 m!371341))

(declare-fun m!371343 () Bool)

(assert (=> b!246209 m!371343))

(declare-fun m!371345 () Bool)

(assert (=> b!246217 m!371345))

(declare-fun m!371347 () Bool)

(assert (=> b!246202 m!371347))

(assert (=> b!246207 m!371341))

(declare-fun m!371349 () Bool)

(assert (=> b!246207 m!371349))

(declare-fun m!371351 () Bool)

(assert (=> start!53106 m!371351))

(declare-fun m!371353 () Bool)

(assert (=> b!246211 m!371353))

(declare-fun m!371355 () Bool)

(assert (=> b!246211 m!371355))

(declare-fun m!371357 () Bool)

(assert (=> b!246211 m!371357))

(declare-fun m!371359 () Bool)

(assert (=> b!246211 m!371359))

(declare-fun m!371361 () Bool)

(assert (=> b!246211 m!371361))

(declare-fun m!371363 () Bool)

(assert (=> b!246211 m!371363))

(declare-fun m!371365 () Bool)

(assert (=> b!246211 m!371365))

(declare-fun m!371367 () Bool)

(assert (=> b!246211 m!371367))

(declare-fun m!371369 () Bool)

(assert (=> b!246211 m!371369))

(declare-fun m!371371 () Bool)

(assert (=> b!246211 m!371371))

(declare-fun m!371373 () Bool)

(assert (=> b!246211 m!371373))

(declare-fun m!371375 () Bool)

(assert (=> b!246211 m!371375))

(declare-fun m!371377 () Bool)

(assert (=> b!246211 m!371377))

(declare-fun m!371379 () Bool)

(assert (=> b!246211 m!371379))

(declare-fun m!371381 () Bool)

(assert (=> b!246211 m!371381))

(declare-fun m!371383 () Bool)

(assert (=> b!246211 m!371383))

(declare-fun m!371385 () Bool)

(assert (=> b!246211 m!371385))

(declare-fun m!371387 () Bool)

(assert (=> b!246211 m!371387))

(declare-fun m!371389 () Bool)

(assert (=> b!246211 m!371389))

(declare-fun m!371391 () Bool)

(assert (=> b!246211 m!371391))

(declare-fun m!371393 () Bool)

(assert (=> b!246210 m!371393))

(declare-fun m!371395 () Bool)

(assert (=> b!246206 m!371395))

(declare-fun m!371397 () Bool)

(assert (=> b!246206 m!371397))

(declare-fun m!371399 () Bool)

(assert (=> b!246206 m!371399))

(assert (=> b!246206 m!371359))

(assert (=> b!246213 m!371339))

(assert (=> b!246213 m!371349))

(declare-fun m!371401 () Bool)

(assert (=> b!246203 m!371401))

(assert (=> b!246203 m!371401))

(declare-fun m!371403 () Bool)

(assert (=> b!246203 m!371403))

(push 1)

(assert (not b!246211))

(assert (not start!53106))

(assert (not b!246210))

(assert (not b!246205))

(assert (not b!246204))

(assert (not b!246218))

(assert (not b!246207))

(assert (not b!246203))

(assert (not b!246212))

(assert (not b!246209))

(assert (not b!246217))

(assert (not b!246208))

(assert (not b!246213))

(assert (not b!246206))

(assert (not b!246202))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

