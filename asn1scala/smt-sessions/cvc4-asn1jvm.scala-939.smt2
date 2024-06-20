; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26708 () Bool)

(assert start!26708)

(declare-fun b!137101 () Bool)

(declare-fun e!91085 () Bool)

(declare-datatypes ((array!6217 0))(
  ( (array!6218 (arr!3500 (Array (_ BitVec 32) (_ BitVec 8))) (size!2814 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4892 0))(
  ( (BitStream!4893 (buf!3221 array!6217) (currentByte!6028 (_ BitVec 32)) (currentBit!6023 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4892)

(declare-datatypes ((Unit!8575 0))(
  ( (Unit!8576) )
))
(declare-datatypes ((tuple2!11922 0))(
  ( (tuple2!11923 (_1!6284 Unit!8575) (_2!6284 BitStream!4892)) )
))
(declare-fun lt!213540 () tuple2!11922)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!137101 (= e!91085 (invariant!0 (currentBit!6023 thiss!1634) (currentByte!6028 thiss!1634) (size!2814 (buf!3221 (_2!6284 lt!213540)))))))

(declare-fun b!137102 () Bool)

(declare-fun res!114139 () Bool)

(declare-fun e!91081 () Bool)

(assert (=> b!137102 (=> (not res!114139) (not e!91081))))

(declare-fun isPrefixOf!0 (BitStream!4892 BitStream!4892) Bool)

(assert (=> b!137102 (= res!114139 (isPrefixOf!0 thiss!1634 (_2!6284 lt!213540)))))

(declare-fun b!137103 () Bool)

(declare-datatypes ((tuple2!11924 0))(
  ( (tuple2!11925 (_1!6285 BitStream!4892) (_2!6285 BitStream!4892)) )
))
(declare-fun lt!213555 () tuple2!11924)

(declare-fun arr!237 () array!6217)

(declare-fun from!447 () (_ BitVec 32))

(declare-datatypes ((tuple2!11926 0))(
  ( (tuple2!11927 (_1!6286 BitStream!4892) (_2!6286 (_ BitVec 8))) )
))
(declare-fun lt!213549 () tuple2!11926)

(assert (=> b!137103 (= e!91081 (and (= (_2!6286 lt!213549) (select (arr!3500 arr!237) from!447)) (= (_1!6286 lt!213549) (_2!6285 lt!213555))))))

(declare-fun readBytePure!0 (BitStream!4892) tuple2!11926)

(assert (=> b!137103 (= lt!213549 (readBytePure!0 (_1!6285 lt!213555)))))

(declare-fun reader!0 (BitStream!4892 BitStream!4892) tuple2!11924)

(assert (=> b!137103 (= lt!213555 (reader!0 thiss!1634 (_2!6284 lt!213540)))))

(declare-fun b!137104 () Bool)

(declare-fun res!114138 () Bool)

(declare-fun e!91088 () Bool)

(assert (=> b!137104 (=> (not res!114138) (not e!91088))))

(assert (=> b!137104 (= res!114138 (invariant!0 (currentBit!6023 thiss!1634) (currentByte!6028 thiss!1634) (size!2814 (buf!3221 thiss!1634))))))

(declare-datatypes ((tuple2!11928 0))(
  ( (tuple2!11929 (_1!6287 BitStream!4892) (_2!6287 array!6217)) )
))
(declare-fun lt!213535 () tuple2!11928)

(declare-fun b!137105 () Bool)

(declare-fun to!404 () (_ BitVec 32))

(declare-fun e!91083 () Bool)

(declare-fun arrayRangesEq!217 (array!6217 array!6217 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!137105 (= e!91083 (not (arrayRangesEq!217 arr!237 (_2!6287 lt!213535) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!137106 () Bool)

(declare-fun e!91079 () Bool)

(assert (=> b!137106 (= e!91079 true)))

(declare-fun lt!213561 () tuple2!11928)

(assert (=> b!137106 (arrayRangesEq!217 arr!237 (_2!6287 lt!213561) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!213539 () tuple2!11928)

(declare-fun lt!213536 () Unit!8575)

(declare-fun arrayRangesEqTransitive!19 (array!6217 array!6217 array!6217 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8575)

(assert (=> b!137106 (= lt!213536 (arrayRangesEqTransitive!19 arr!237 (_2!6287 lt!213539) (_2!6287 lt!213561) #b00000000000000000000000000000000 to!404 to!404))))

(assert (=> b!137106 (arrayRangesEq!217 (_2!6287 lt!213539) (_2!6287 lt!213561) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!213550 () Unit!8575)

(declare-fun arrayRangesEqSymmetricLemma!30 (array!6217 array!6217 (_ BitVec 32) (_ BitVec 32)) Unit!8575)

(assert (=> b!137106 (= lt!213550 (arrayRangesEqSymmetricLemma!30 (_2!6287 lt!213561) (_2!6287 lt!213539) #b00000000000000000000000000000000 to!404))))

(declare-fun b!137107 () Bool)

(declare-fun e!91084 () Bool)

(declare-fun e!91082 () Bool)

(assert (=> b!137107 (= e!91084 e!91082)))

(declare-fun res!114143 () Bool)

(assert (=> b!137107 (=> (not res!114143) (not e!91082))))

(declare-fun lt!213553 () tuple2!11922)

(declare-fun lt!213557 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!137107 (= res!114143 (= (bitIndex!0 (size!2814 (buf!3221 (_2!6284 lt!213553))) (currentByte!6028 (_2!6284 lt!213553)) (currentBit!6023 (_2!6284 lt!213553))) (bvadd (bitIndex!0 (size!2814 (buf!3221 (_2!6284 lt!213540))) (currentByte!6028 (_2!6284 lt!213540)) (currentBit!6023 (_2!6284 lt!213540))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!213557))))))

(assert (=> b!137107 (= lt!213557 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!137108 () Bool)

(declare-fun e!91089 () Bool)

(declare-fun array_inv!2603 (array!6217) Bool)

(assert (=> b!137108 (= e!91089 (array_inv!2603 (buf!3221 thiss!1634)))))

(declare-fun b!137109 () Bool)

(declare-fun res!114135 () Bool)

(assert (=> b!137109 (=> (not res!114135) (not e!91088))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!137109 (= res!114135 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2814 (buf!3221 thiss!1634))) ((_ sign_extend 32) (currentByte!6028 thiss!1634)) ((_ sign_extend 32) (currentBit!6023 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun res!114140 () Bool)

(assert (=> start!26708 (=> (not res!114140) (not e!91088))))

(assert (=> start!26708 (= res!114140 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2814 arr!237))))))

(assert (=> start!26708 e!91088))

(assert (=> start!26708 true))

(assert (=> start!26708 (array_inv!2603 arr!237)))

(declare-fun inv!12 (BitStream!4892) Bool)

(assert (=> start!26708 (and (inv!12 thiss!1634) e!91089)))

(declare-fun b!137110 () Bool)

(declare-fun res!114134 () Bool)

(assert (=> b!137110 (=> (not res!114134) (not e!91081))))

(assert (=> b!137110 (= res!114134 (= (bitIndex!0 (size!2814 (buf!3221 (_2!6284 lt!213540))) (currentByte!6028 (_2!6284 lt!213540)) (currentBit!6023 (_2!6284 lt!213540))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2814 (buf!3221 thiss!1634)) (currentByte!6028 thiss!1634) (currentBit!6023 thiss!1634)))))))

(declare-fun b!137111 () Bool)

(assert (=> b!137111 (= e!91082 (not e!91083))))

(declare-fun res!114146 () Bool)

(assert (=> b!137111 (=> res!114146 e!91083)))

(declare-fun lt!213548 () tuple2!11924)

(assert (=> b!137111 (= res!114146 (or (not (= (size!2814 (_2!6287 lt!213535)) (size!2814 arr!237))) (not (= (_1!6287 lt!213535) (_2!6285 lt!213548)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4892 array!6217 (_ BitVec 32) (_ BitVec 32)) tuple2!11928)

(assert (=> b!137111 (= lt!213535 (readByteArrayLoopPure!0 (_1!6285 lt!213548) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!137111 (validate_offset_bits!1 ((_ sign_extend 32) (size!2814 (buf!3221 (_2!6284 lt!213553)))) ((_ sign_extend 32) (currentByte!6028 (_2!6284 lt!213540))) ((_ sign_extend 32) (currentBit!6023 (_2!6284 lt!213540))) lt!213557)))

(declare-fun lt!213559 () Unit!8575)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4892 array!6217 (_ BitVec 64)) Unit!8575)

(assert (=> b!137111 (= lt!213559 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6284 lt!213540) (buf!3221 (_2!6284 lt!213553)) lt!213557))))

(assert (=> b!137111 (= lt!213548 (reader!0 (_2!6284 lt!213540) (_2!6284 lt!213553)))))

(declare-fun b!137112 () Bool)

(declare-fun res!114147 () Bool)

(assert (=> b!137112 (=> (not res!114147) (not e!91088))))

(assert (=> b!137112 (= res!114147 (bvslt from!447 to!404))))

(declare-fun b!137113 () Bool)

(assert (=> b!137113 (= e!91088 (not e!91079))))

(declare-fun res!114144 () Bool)

(assert (=> b!137113 (=> res!114144 e!91079)))

(assert (=> b!137113 (= res!114144 (not (arrayRangesEq!217 (_2!6287 lt!213561) (_2!6287 lt!213539) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!213547 () tuple2!11928)

(assert (=> b!137113 (arrayRangesEq!217 (_2!6287 lt!213561) (_2!6287 lt!213547) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!213545 () Unit!8575)

(declare-fun lt!213558 () tuple2!11924)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!4892 array!6217 (_ BitVec 32) (_ BitVec 32)) Unit!8575)

(assert (=> b!137113 (= lt!213545 (readByteArrayLoopArrayPrefixLemma!0 (_1!6285 lt!213558) arr!237 from!447 to!404))))

(declare-fun lt!213560 () array!6217)

(declare-fun withMovedByteIndex!0 (BitStream!4892 (_ BitVec 32)) BitStream!4892)

(assert (=> b!137113 (= lt!213547 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6285 lt!213558) #b00000000000000000000000000000001) lt!213560 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!213546 () tuple2!11924)

(assert (=> b!137113 (= lt!213539 (readByteArrayLoopPure!0 (_1!6285 lt!213546) lt!213560 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!213544 () tuple2!11926)

(assert (=> b!137113 (= lt!213560 (array!6218 (store (arr!3500 arr!237) from!447 (_2!6286 lt!213544)) (size!2814 arr!237)))))

(declare-fun lt!213543 () (_ BitVec 32))

(assert (=> b!137113 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2814 (buf!3221 (_2!6284 lt!213553)))) ((_ sign_extend 32) (currentByte!6028 (_2!6284 lt!213540))) ((_ sign_extend 32) (currentBit!6023 (_2!6284 lt!213540))) lt!213543)))

(declare-fun lt!213541 () Unit!8575)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4892 array!6217 (_ BitVec 32)) Unit!8575)

(assert (=> b!137113 (= lt!213541 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6284 lt!213540) (buf!3221 (_2!6284 lt!213553)) lt!213543))))

(assert (=> b!137113 (= (_1!6287 lt!213561) (_2!6285 lt!213558))))

(assert (=> b!137113 (= lt!213561 (readByteArrayLoopPure!0 (_1!6285 lt!213558) arr!237 from!447 to!404))))

(assert (=> b!137113 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2814 (buf!3221 (_2!6284 lt!213553)))) ((_ sign_extend 32) (currentByte!6028 thiss!1634)) ((_ sign_extend 32) (currentBit!6023 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!213542 () Unit!8575)

(assert (=> b!137113 (= lt!213542 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3221 (_2!6284 lt!213553)) (bvsub to!404 from!447)))))

(assert (=> b!137113 (= (_2!6286 lt!213544) (select (arr!3500 arr!237) from!447))))

(assert (=> b!137113 (= lt!213544 (readBytePure!0 (_1!6285 lt!213558)))))

(assert (=> b!137113 (= lt!213546 (reader!0 (_2!6284 lt!213540) (_2!6284 lt!213553)))))

(assert (=> b!137113 (= lt!213558 (reader!0 thiss!1634 (_2!6284 lt!213553)))))

(declare-fun e!91087 () Bool)

(assert (=> b!137113 e!91087))

(declare-fun res!114137 () Bool)

(assert (=> b!137113 (=> (not res!114137) (not e!91087))))

(declare-fun lt!213551 () tuple2!11926)

(declare-fun lt!213552 () tuple2!11926)

(assert (=> b!137113 (= res!114137 (= (bitIndex!0 (size!2814 (buf!3221 (_1!6286 lt!213551))) (currentByte!6028 (_1!6286 lt!213551)) (currentBit!6023 (_1!6286 lt!213551))) (bitIndex!0 (size!2814 (buf!3221 (_1!6286 lt!213552))) (currentByte!6028 (_1!6286 lt!213552)) (currentBit!6023 (_1!6286 lt!213552)))))))

(declare-fun lt!213538 () Unit!8575)

(declare-fun lt!213537 () BitStream!4892)

(declare-fun readBytePrefixLemma!0 (BitStream!4892 BitStream!4892) Unit!8575)

(assert (=> b!137113 (= lt!213538 (readBytePrefixLemma!0 lt!213537 (_2!6284 lt!213553)))))

(assert (=> b!137113 (= lt!213552 (readBytePure!0 (BitStream!4893 (buf!3221 (_2!6284 lt!213553)) (currentByte!6028 thiss!1634) (currentBit!6023 thiss!1634))))))

(assert (=> b!137113 (= lt!213551 (readBytePure!0 lt!213537))))

(assert (=> b!137113 (= lt!213537 (BitStream!4893 (buf!3221 (_2!6284 lt!213540)) (currentByte!6028 thiss!1634) (currentBit!6023 thiss!1634)))))

(assert (=> b!137113 e!91085))

(declare-fun res!114145 () Bool)

(assert (=> b!137113 (=> (not res!114145) (not e!91085))))

(assert (=> b!137113 (= res!114145 (isPrefixOf!0 thiss!1634 (_2!6284 lt!213553)))))

(declare-fun lt!213554 () Unit!8575)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4892 BitStream!4892 BitStream!4892) Unit!8575)

(assert (=> b!137113 (= lt!213554 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6284 lt!213540) (_2!6284 lt!213553)))))

(assert (=> b!137113 e!91084))

(declare-fun res!114136 () Bool)

(assert (=> b!137113 (=> (not res!114136) (not e!91084))))

(assert (=> b!137113 (= res!114136 (= (size!2814 (buf!3221 (_2!6284 lt!213540))) (size!2814 (buf!3221 (_2!6284 lt!213553)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4892 array!6217 (_ BitVec 32) (_ BitVec 32)) tuple2!11922)

(assert (=> b!137113 (= lt!213553 (appendByteArrayLoop!0 (_2!6284 lt!213540) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!137113 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2814 (buf!3221 (_2!6284 lt!213540)))) ((_ sign_extend 32) (currentByte!6028 (_2!6284 lt!213540))) ((_ sign_extend 32) (currentBit!6023 (_2!6284 lt!213540))) lt!213543)))

(assert (=> b!137113 (= lt!213543 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!213556 () Unit!8575)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4892 BitStream!4892 (_ BitVec 64) (_ BitVec 32)) Unit!8575)

(assert (=> b!137113 (= lt!213556 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6284 lt!213540) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!137113 e!91081))

(declare-fun res!114142 () Bool)

(assert (=> b!137113 (=> (not res!114142) (not e!91081))))

(assert (=> b!137113 (= res!114142 (= (size!2814 (buf!3221 thiss!1634)) (size!2814 (buf!3221 (_2!6284 lt!213540)))))))

(declare-fun appendByte!0 (BitStream!4892 (_ BitVec 8)) tuple2!11922)

(assert (=> b!137113 (= lt!213540 (appendByte!0 thiss!1634 (select (arr!3500 arr!237) from!447)))))

(declare-fun b!137114 () Bool)

(assert (=> b!137114 (= e!91087 (= (_2!6286 lt!213551) (_2!6286 lt!213552)))))

(declare-fun b!137115 () Bool)

(declare-fun res!114141 () Bool)

(assert (=> b!137115 (=> (not res!114141) (not e!91082))))

(assert (=> b!137115 (= res!114141 (isPrefixOf!0 (_2!6284 lt!213540) (_2!6284 lt!213553)))))

(assert (= (and start!26708 res!114140) b!137109))

(assert (= (and b!137109 res!114135) b!137112))

(assert (= (and b!137112 res!114147) b!137104))

(assert (= (and b!137104 res!114138) b!137113))

(assert (= (and b!137113 res!114142) b!137110))

(assert (= (and b!137110 res!114134) b!137102))

(assert (= (and b!137102 res!114139) b!137103))

(assert (= (and b!137113 res!114136) b!137107))

(assert (= (and b!137107 res!114143) b!137115))

(assert (= (and b!137115 res!114141) b!137111))

(assert (= (and b!137111 (not res!114146)) b!137105))

(assert (= (and b!137113 res!114145) b!137101))

(assert (= (and b!137113 res!114137) b!137114))

(assert (= (and b!137113 (not res!114144)) b!137106))

(assert (= start!26708 b!137108))

(declare-fun m!210287 () Bool)

(assert (=> b!137102 m!210287))

(declare-fun m!210289 () Bool)

(assert (=> b!137111 m!210289))

(declare-fun m!210291 () Bool)

(assert (=> b!137111 m!210291))

(declare-fun m!210293 () Bool)

(assert (=> b!137111 m!210293))

(declare-fun m!210295 () Bool)

(assert (=> b!137111 m!210295))

(declare-fun m!210297 () Bool)

(assert (=> b!137106 m!210297))

(declare-fun m!210299 () Bool)

(assert (=> b!137106 m!210299))

(declare-fun m!210301 () Bool)

(assert (=> b!137106 m!210301))

(declare-fun m!210303 () Bool)

(assert (=> b!137106 m!210303))

(declare-fun m!210305 () Bool)

(assert (=> b!137115 m!210305))

(declare-fun m!210307 () Bool)

(assert (=> b!137107 m!210307))

(declare-fun m!210309 () Bool)

(assert (=> b!137107 m!210309))

(assert (=> b!137110 m!210309))

(declare-fun m!210311 () Bool)

(assert (=> b!137110 m!210311))

(declare-fun m!210313 () Bool)

(assert (=> b!137104 m!210313))

(declare-fun m!210315 () Bool)

(assert (=> b!137101 m!210315))

(declare-fun m!210317 () Bool)

(assert (=> b!137113 m!210317))

(declare-fun m!210319 () Bool)

(assert (=> b!137113 m!210319))

(declare-fun m!210321 () Bool)

(assert (=> b!137113 m!210321))

(declare-fun m!210323 () Bool)

(assert (=> b!137113 m!210323))

(declare-fun m!210325 () Bool)

(assert (=> b!137113 m!210325))

(declare-fun m!210327 () Bool)

(assert (=> b!137113 m!210327))

(declare-fun m!210329 () Bool)

(assert (=> b!137113 m!210329))

(declare-fun m!210331 () Bool)

(assert (=> b!137113 m!210331))

(declare-fun m!210333 () Bool)

(assert (=> b!137113 m!210333))

(declare-fun m!210335 () Bool)

(assert (=> b!137113 m!210335))

(declare-fun m!210337 () Bool)

(assert (=> b!137113 m!210337))

(declare-fun m!210339 () Bool)

(assert (=> b!137113 m!210339))

(declare-fun m!210341 () Bool)

(assert (=> b!137113 m!210341))

(declare-fun m!210343 () Bool)

(assert (=> b!137113 m!210343))

(declare-fun m!210345 () Bool)

(assert (=> b!137113 m!210345))

(declare-fun m!210347 () Bool)

(assert (=> b!137113 m!210347))

(declare-fun m!210349 () Bool)

(assert (=> b!137113 m!210349))

(assert (=> b!137113 m!210295))

(declare-fun m!210351 () Bool)

(assert (=> b!137113 m!210351))

(declare-fun m!210353 () Bool)

(assert (=> b!137113 m!210353))

(declare-fun m!210355 () Bool)

(assert (=> b!137113 m!210355))

(declare-fun m!210357 () Bool)

(assert (=> b!137113 m!210357))

(declare-fun m!210359 () Bool)

(assert (=> b!137113 m!210359))

(declare-fun m!210361 () Bool)

(assert (=> b!137113 m!210361))

(declare-fun m!210363 () Bool)

(assert (=> b!137113 m!210363))

(declare-fun m!210365 () Bool)

(assert (=> b!137113 m!210365))

(assert (=> b!137113 m!210343))

(declare-fun m!210367 () Bool)

(assert (=> b!137113 m!210367))

(assert (=> b!137113 m!210361))

(declare-fun m!210369 () Bool)

(assert (=> b!137108 m!210369))

(assert (=> b!137103 m!210343))

(declare-fun m!210371 () Bool)

(assert (=> b!137103 m!210371))

(declare-fun m!210373 () Bool)

(assert (=> b!137103 m!210373))

(declare-fun m!210375 () Bool)

(assert (=> b!137109 m!210375))

(declare-fun m!210377 () Bool)

(assert (=> b!137105 m!210377))

(declare-fun m!210379 () Bool)

(assert (=> start!26708 m!210379))

(declare-fun m!210381 () Bool)

(assert (=> start!26708 m!210381))

(push 1)

(assert (not start!26708))

(assert (not b!137110))

(assert (not b!137111))

(assert (not b!137113))

(assert (not b!137115))

(assert (not b!137106))

(assert (not b!137105))

(assert (not b!137104))

(assert (not b!137102))

(assert (not b!137107))

(assert (not b!137109))

(assert (not b!137101))

(assert (not b!137108))

(assert (not b!137103))

(check-sat)

