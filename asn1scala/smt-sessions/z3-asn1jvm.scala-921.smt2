; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25818 () Bool)

(assert start!25818)

(declare-fun b!131993 () Bool)

(declare-fun e!87518 () Bool)

(declare-datatypes ((array!6093 0))(
  ( (array!6094 (arr!3388 (Array (_ BitVec 32) (_ BitVec 8))) (size!2759 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4782 0))(
  ( (BitStream!4783 (buf!3126 array!6093) (currentByte!5905 (_ BitVec 32)) (currentBit!5900 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!11442 0))(
  ( (tuple2!11443 (_1!6024 BitStream!4782) (_2!6024 (_ BitVec 8))) )
))
(declare-fun lt!203566 () tuple2!11442)

(declare-fun lt!203574 () tuple2!11442)

(assert (=> b!131993 (= e!87518 (= (_2!6024 lt!203566) (_2!6024 lt!203574)))))

(declare-fun e!87519 () Bool)

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((tuple2!11444 0))(
  ( (tuple2!11445 (_1!6025 BitStream!4782) (_2!6025 BitStream!4782)) )
))
(declare-fun lt!203561 () tuple2!11444)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun b!131994 () Bool)

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!131994 (= e!87519 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2759 (buf!3126 (_1!6025 lt!203561)))) ((_ sign_extend 32) (currentByte!5905 (_1!6025 lt!203561))) ((_ sign_extend 32) (currentBit!5900 (_1!6025 lt!203561))) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!131995 () Bool)

(declare-fun lt!203563 () tuple2!11444)

(declare-fun e!87516 () Bool)

(declare-fun arr!237 () array!6093)

(declare-fun lt!203575 () tuple2!11442)

(assert (=> b!131995 (= e!87516 (and (= (_2!6024 lt!203575) (select (arr!3388 arr!237) from!447)) (= (_1!6024 lt!203575) (_2!6025 lt!203563))))))

(declare-fun readBytePure!0 (BitStream!4782) tuple2!11442)

(assert (=> b!131995 (= lt!203575 (readBytePure!0 (_1!6025 lt!203563)))))

(declare-fun thiss!1634 () BitStream!4782)

(declare-datatypes ((Unit!8141 0))(
  ( (Unit!8142) )
))
(declare-datatypes ((tuple2!11446 0))(
  ( (tuple2!11447 (_1!6026 Unit!8141) (_2!6026 BitStream!4782)) )
))
(declare-fun lt!203578 () tuple2!11446)

(declare-fun reader!0 (BitStream!4782 BitStream!4782) tuple2!11444)

(assert (=> b!131995 (= lt!203563 (reader!0 thiss!1634 (_2!6026 lt!203578)))))

(declare-fun res!109560 () Bool)

(declare-fun e!87524 () Bool)

(assert (=> start!25818 (=> (not res!109560) (not e!87524))))

(assert (=> start!25818 (= res!109560 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2759 arr!237))))))

(assert (=> start!25818 e!87524))

(assert (=> start!25818 true))

(declare-fun array_inv!2548 (array!6093) Bool)

(assert (=> start!25818 (array_inv!2548 arr!237)))

(declare-fun e!87521 () Bool)

(declare-fun inv!12 (BitStream!4782) Bool)

(assert (=> start!25818 (and (inv!12 thiss!1634) e!87521)))

(declare-fun b!131996 () Bool)

(declare-fun e!87523 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!131996 (= e!87523 (invariant!0 (currentBit!5900 thiss!1634) (currentByte!5905 thiss!1634) (size!2759 (buf!3126 (_2!6026 lt!203578)))))))

(declare-fun b!131997 () Bool)

(declare-fun e!87520 () Bool)

(declare-fun e!87515 () Bool)

(assert (=> b!131997 (= e!87520 e!87515)))

(declare-fun res!109567 () Bool)

(assert (=> b!131997 (=> (not res!109567) (not e!87515))))

(declare-fun lt!203565 () tuple2!11446)

(declare-fun lt!203569 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!131997 (= res!109567 (= (bitIndex!0 (size!2759 (buf!3126 (_2!6026 lt!203565))) (currentByte!5905 (_2!6026 lt!203565)) (currentBit!5900 (_2!6026 lt!203565))) (bvadd (bitIndex!0 (size!2759 (buf!3126 (_2!6026 lt!203578))) (currentByte!5905 (_2!6026 lt!203578)) (currentBit!5900 (_2!6026 lt!203578))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!203569))))))

(assert (=> b!131997 (= lt!203569 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!131998 () Bool)

(declare-datatypes ((tuple2!11448 0))(
  ( (tuple2!11449 (_1!6027 BitStream!4782) (_2!6027 array!6093)) )
))
(declare-fun lt!203570 () tuple2!11448)

(declare-fun e!87517 () Bool)

(declare-fun arrayRangesEq!162 (array!6093 array!6093 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!131998 (= e!87517 (not (arrayRangesEq!162 arr!237 (_2!6027 lt!203570) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!131999 () Bool)

(declare-fun res!109565 () Bool)

(assert (=> b!131999 (=> (not res!109565) (not e!87524))))

(assert (=> b!131999 (= res!109565 (invariant!0 (currentBit!5900 thiss!1634) (currentByte!5905 thiss!1634) (size!2759 (buf!3126 thiss!1634))))))

(declare-fun b!132000 () Bool)

(assert (=> b!132000 (= e!87515 (not e!87517))))

(declare-fun res!109557 () Bool)

(assert (=> b!132000 (=> res!109557 e!87517)))

(declare-fun lt!203564 () tuple2!11444)

(assert (=> b!132000 (= res!109557 (or (not (= (size!2759 (_2!6027 lt!203570)) (size!2759 arr!237))) (not (= (_1!6027 lt!203570) (_2!6025 lt!203564)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4782 array!6093 (_ BitVec 32) (_ BitVec 32)) tuple2!11448)

(assert (=> b!132000 (= lt!203570 (readByteArrayLoopPure!0 (_1!6025 lt!203564) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!132000 (validate_offset_bits!1 ((_ sign_extend 32) (size!2759 (buf!3126 (_2!6026 lt!203565)))) ((_ sign_extend 32) (currentByte!5905 (_2!6026 lt!203578))) ((_ sign_extend 32) (currentBit!5900 (_2!6026 lt!203578))) lt!203569)))

(declare-fun lt!203577 () Unit!8141)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4782 array!6093 (_ BitVec 64)) Unit!8141)

(assert (=> b!132000 (= lt!203577 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6026 lt!203578) (buf!3126 (_2!6026 lt!203565)) lt!203569))))

(assert (=> b!132000 (= lt!203564 (reader!0 (_2!6026 lt!203578) (_2!6026 lt!203565)))))

(declare-fun b!132001 () Bool)

(declare-fun res!109555 () Bool)

(assert (=> b!132001 (=> (not res!109555) (not e!87524))))

(assert (=> b!132001 (= res!109555 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2759 (buf!3126 thiss!1634))) ((_ sign_extend 32) (currentByte!5905 thiss!1634)) ((_ sign_extend 32) (currentBit!5900 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!132002 () Bool)

(assert (=> b!132002 (= e!87524 (not e!87519))))

(declare-fun res!109559 () Bool)

(assert (=> b!132002 (=> res!109559 e!87519)))

(assert (=> b!132002 (= res!109559 (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!203573 () (_ BitVec 32))

(assert (=> b!132002 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2759 (buf!3126 (_2!6026 lt!203565)))) ((_ sign_extend 32) (currentByte!5905 (_2!6026 lt!203578))) ((_ sign_extend 32) (currentBit!5900 (_2!6026 lt!203578))) lt!203573)))

(declare-fun lt!203568 () Unit!8141)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4782 array!6093 (_ BitVec 32)) Unit!8141)

(assert (=> b!132002 (= lt!203568 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6026 lt!203578) (buf!3126 (_2!6026 lt!203565)) lt!203573))))

(declare-fun e!87522 () Bool)

(assert (=> b!132002 e!87522))

(declare-fun res!109558 () Bool)

(assert (=> b!132002 (=> (not res!109558) (not e!87522))))

(assert (=> b!132002 (= res!109558 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2759 (buf!3126 (_2!6026 lt!203565)))) ((_ sign_extend 32) (currentByte!5905 thiss!1634)) ((_ sign_extend 32) (currentBit!5900 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun lt!203576 () Unit!8141)

(assert (=> b!132002 (= lt!203576 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3126 (_2!6026 lt!203565)) (bvsub to!404 from!447)))))

(declare-fun lt!203579 () tuple2!11444)

(assert (=> b!132002 (= (_2!6024 (readBytePure!0 (_1!6025 lt!203579))) (select (arr!3388 arr!237) from!447))))

(assert (=> b!132002 (= lt!203561 (reader!0 (_2!6026 lt!203578) (_2!6026 lt!203565)))))

(assert (=> b!132002 (= lt!203579 (reader!0 thiss!1634 (_2!6026 lt!203565)))))

(assert (=> b!132002 e!87518))

(declare-fun res!109562 () Bool)

(assert (=> b!132002 (=> (not res!109562) (not e!87518))))

(assert (=> b!132002 (= res!109562 (= (bitIndex!0 (size!2759 (buf!3126 (_1!6024 lt!203566))) (currentByte!5905 (_1!6024 lt!203566)) (currentBit!5900 (_1!6024 lt!203566))) (bitIndex!0 (size!2759 (buf!3126 (_1!6024 lt!203574))) (currentByte!5905 (_1!6024 lt!203574)) (currentBit!5900 (_1!6024 lt!203574)))))))

(declare-fun lt!203567 () Unit!8141)

(declare-fun lt!203562 () BitStream!4782)

(declare-fun readBytePrefixLemma!0 (BitStream!4782 BitStream!4782) Unit!8141)

(assert (=> b!132002 (= lt!203567 (readBytePrefixLemma!0 lt!203562 (_2!6026 lt!203565)))))

(assert (=> b!132002 (= lt!203574 (readBytePure!0 (BitStream!4783 (buf!3126 (_2!6026 lt!203565)) (currentByte!5905 thiss!1634) (currentBit!5900 thiss!1634))))))

(assert (=> b!132002 (= lt!203566 (readBytePure!0 lt!203562))))

(assert (=> b!132002 (= lt!203562 (BitStream!4783 (buf!3126 (_2!6026 lt!203578)) (currentByte!5905 thiss!1634) (currentBit!5900 thiss!1634)))))

(assert (=> b!132002 e!87523))

(declare-fun res!109561 () Bool)

(assert (=> b!132002 (=> (not res!109561) (not e!87523))))

(declare-fun isPrefixOf!0 (BitStream!4782 BitStream!4782) Bool)

(assert (=> b!132002 (= res!109561 (isPrefixOf!0 thiss!1634 (_2!6026 lt!203565)))))

(declare-fun lt!203572 () Unit!8141)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4782 BitStream!4782 BitStream!4782) Unit!8141)

(assert (=> b!132002 (= lt!203572 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6026 lt!203578) (_2!6026 lt!203565)))))

(assert (=> b!132002 e!87520))

(declare-fun res!109554 () Bool)

(assert (=> b!132002 (=> (not res!109554) (not e!87520))))

(assert (=> b!132002 (= res!109554 (= (size!2759 (buf!3126 (_2!6026 lt!203578))) (size!2759 (buf!3126 (_2!6026 lt!203565)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4782 array!6093 (_ BitVec 32) (_ BitVec 32)) tuple2!11446)

(assert (=> b!132002 (= lt!203565 (appendByteArrayLoop!0 (_2!6026 lt!203578) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!132002 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2759 (buf!3126 (_2!6026 lt!203578)))) ((_ sign_extend 32) (currentByte!5905 (_2!6026 lt!203578))) ((_ sign_extend 32) (currentBit!5900 (_2!6026 lt!203578))) lt!203573)))

(assert (=> b!132002 (= lt!203573 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!203571 () Unit!8141)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4782 BitStream!4782 (_ BitVec 64) (_ BitVec 32)) Unit!8141)

(assert (=> b!132002 (= lt!203571 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6026 lt!203578) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!132002 e!87516))

(declare-fun res!109556 () Bool)

(assert (=> b!132002 (=> (not res!109556) (not e!87516))))

(assert (=> b!132002 (= res!109556 (= (size!2759 (buf!3126 thiss!1634)) (size!2759 (buf!3126 (_2!6026 lt!203578)))))))

(declare-fun appendByte!0 (BitStream!4782 (_ BitVec 8)) tuple2!11446)

(assert (=> b!132002 (= lt!203578 (appendByte!0 thiss!1634 (select (arr!3388 arr!237) from!447)))))

(declare-fun b!132003 () Bool)

(declare-fun res!109563 () Bool)

(assert (=> b!132003 (=> (not res!109563) (not e!87516))))

(assert (=> b!132003 (= res!109563 (isPrefixOf!0 thiss!1634 (_2!6026 lt!203578)))))

(declare-fun b!132004 () Bool)

(assert (=> b!132004 (= e!87521 (array_inv!2548 (buf!3126 thiss!1634)))))

(declare-fun b!132005 () Bool)

(declare-fun res!109564 () Bool)

(assert (=> b!132005 (=> (not res!109564) (not e!87515))))

(assert (=> b!132005 (= res!109564 (isPrefixOf!0 (_2!6026 lt!203578) (_2!6026 lt!203565)))))

(declare-fun b!132006 () Bool)

(declare-fun res!109553 () Bool)

(assert (=> b!132006 (=> (not res!109553) (not e!87516))))

(assert (=> b!132006 (= res!109553 (= (bitIndex!0 (size!2759 (buf!3126 (_2!6026 lt!203578))) (currentByte!5905 (_2!6026 lt!203578)) (currentBit!5900 (_2!6026 lt!203578))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2759 (buf!3126 thiss!1634)) (currentByte!5905 thiss!1634) (currentBit!5900 thiss!1634)))))))

(declare-fun b!132007 () Bool)

(assert (=> b!132007 (= e!87522 (= (_1!6027 (readByteArrayLoopPure!0 (_1!6025 lt!203579) arr!237 from!447 to!404)) (_2!6025 lt!203579)))))

(declare-fun b!132008 () Bool)

(declare-fun res!109566 () Bool)

(assert (=> b!132008 (=> (not res!109566) (not e!87524))))

(assert (=> b!132008 (= res!109566 (bvslt from!447 to!404))))

(assert (= (and start!25818 res!109560) b!132001))

(assert (= (and b!132001 res!109555) b!132008))

(assert (= (and b!132008 res!109566) b!131999))

(assert (= (and b!131999 res!109565) b!132002))

(assert (= (and b!132002 res!109556) b!132006))

(assert (= (and b!132006 res!109553) b!132003))

(assert (= (and b!132003 res!109563) b!131995))

(assert (= (and b!132002 res!109554) b!131997))

(assert (= (and b!131997 res!109567) b!132005))

(assert (= (and b!132005 res!109564) b!132000))

(assert (= (and b!132000 (not res!109557)) b!131998))

(assert (= (and b!132002 res!109561) b!131996))

(assert (= (and b!132002 res!109562) b!131993))

(assert (= (and b!132002 res!109558) b!132007))

(assert (= (and b!132002 (not res!109559)) b!131994))

(assert (= start!25818 b!132004))

(declare-fun m!199271 () Bool)

(assert (=> b!131995 m!199271))

(declare-fun m!199273 () Bool)

(assert (=> b!131995 m!199273))

(declare-fun m!199275 () Bool)

(assert (=> b!131995 m!199275))

(declare-fun m!199277 () Bool)

(assert (=> b!131996 m!199277))

(declare-fun m!199279 () Bool)

(assert (=> b!131998 m!199279))

(declare-fun m!199281 () Bool)

(assert (=> b!131997 m!199281))

(declare-fun m!199283 () Bool)

(assert (=> b!131997 m!199283))

(declare-fun m!199285 () Bool)

(assert (=> start!25818 m!199285))

(declare-fun m!199287 () Bool)

(assert (=> start!25818 m!199287))

(declare-fun m!199289 () Bool)

(assert (=> b!132004 m!199289))

(declare-fun m!199291 () Bool)

(assert (=> b!131994 m!199291))

(declare-fun m!199293 () Bool)

(assert (=> b!132003 m!199293))

(declare-fun m!199295 () Bool)

(assert (=> b!132001 m!199295))

(declare-fun m!199297 () Bool)

(assert (=> b!132005 m!199297))

(declare-fun m!199299 () Bool)

(assert (=> b!131999 m!199299))

(declare-fun m!199301 () Bool)

(assert (=> b!132007 m!199301))

(declare-fun m!199303 () Bool)

(assert (=> b!132000 m!199303))

(declare-fun m!199305 () Bool)

(assert (=> b!132000 m!199305))

(declare-fun m!199307 () Bool)

(assert (=> b!132000 m!199307))

(declare-fun m!199309 () Bool)

(assert (=> b!132000 m!199309))

(declare-fun m!199311 () Bool)

(assert (=> b!132002 m!199311))

(declare-fun m!199313 () Bool)

(assert (=> b!132002 m!199313))

(declare-fun m!199315 () Bool)

(assert (=> b!132002 m!199315))

(declare-fun m!199317 () Bool)

(assert (=> b!132002 m!199317))

(declare-fun m!199319 () Bool)

(assert (=> b!132002 m!199319))

(declare-fun m!199321 () Bool)

(assert (=> b!132002 m!199321))

(declare-fun m!199323 () Bool)

(assert (=> b!132002 m!199323))

(assert (=> b!132002 m!199309))

(declare-fun m!199325 () Bool)

(assert (=> b!132002 m!199325))

(assert (=> b!132002 m!199271))

(declare-fun m!199327 () Bool)

(assert (=> b!132002 m!199327))

(declare-fun m!199329 () Bool)

(assert (=> b!132002 m!199329))

(declare-fun m!199331 () Bool)

(assert (=> b!132002 m!199331))

(declare-fun m!199333 () Bool)

(assert (=> b!132002 m!199333))

(declare-fun m!199335 () Bool)

(assert (=> b!132002 m!199335))

(declare-fun m!199337 () Bool)

(assert (=> b!132002 m!199337))

(declare-fun m!199339 () Bool)

(assert (=> b!132002 m!199339))

(declare-fun m!199341 () Bool)

(assert (=> b!132002 m!199341))

(declare-fun m!199343 () Bool)

(assert (=> b!132002 m!199343))

(assert (=> b!132002 m!199271))

(assert (=> b!132006 m!199283))

(declare-fun m!199345 () Bool)

(assert (=> b!132006 m!199345))

(check-sat (not b!132004) (not b!131994) (not b!132007) (not b!132005) (not b!132003) (not b!131997) (not b!132000) (not b!132006) (not b!131999) (not b!132002) (not b!132001) (not b!131996) (not start!25818) (not b!131998) (not b!131995))
(check-sat)
(get-model)

(declare-datatypes ((tuple3!500 0))(
  ( (tuple3!501 (_1!6036 Unit!8141) (_2!6036 BitStream!4782) (_3!305 array!6093)) )
))
(declare-fun lt!204089 () tuple3!500)

(declare-fun d!42084 () Bool)

(declare-fun readByteArrayLoop!0 (BitStream!4782 array!6093 (_ BitVec 32) (_ BitVec 32)) tuple3!500)

(assert (=> d!42084 (= lt!204089 (readByteArrayLoop!0 (_1!6025 lt!203564) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!42084 (= (readByteArrayLoopPure!0 (_1!6025 lt!203564) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!11449 (_2!6036 lt!204089) (_3!305 lt!204089)))))

(declare-fun bs!10279 () Bool)

(assert (= bs!10279 d!42084))

(declare-fun m!199775 () Bool)

(assert (=> bs!10279 m!199775))

(assert (=> b!132000 d!42084))

(declare-fun d!42086 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!42086 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2759 (buf!3126 (_2!6026 lt!203565)))) ((_ sign_extend 32) (currentByte!5905 (_2!6026 lt!203578))) ((_ sign_extend 32) (currentBit!5900 (_2!6026 lt!203578))) lt!203569) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2759 (buf!3126 (_2!6026 lt!203565)))) ((_ sign_extend 32) (currentByte!5905 (_2!6026 lt!203578))) ((_ sign_extend 32) (currentBit!5900 (_2!6026 lt!203578)))) lt!203569))))

(declare-fun bs!10280 () Bool)

(assert (= bs!10280 d!42086))

(declare-fun m!199777 () Bool)

(assert (=> bs!10280 m!199777))

(assert (=> b!132000 d!42086))

(declare-fun d!42088 () Bool)

(assert (=> d!42088 (validate_offset_bits!1 ((_ sign_extend 32) (size!2759 (buf!3126 (_2!6026 lt!203565)))) ((_ sign_extend 32) (currentByte!5905 (_2!6026 lt!203578))) ((_ sign_extend 32) (currentBit!5900 (_2!6026 lt!203578))) lt!203569)))

(declare-fun lt!204092 () Unit!8141)

(declare-fun choose!9 (BitStream!4782 array!6093 (_ BitVec 64) BitStream!4782) Unit!8141)

(assert (=> d!42088 (= lt!204092 (choose!9 (_2!6026 lt!203578) (buf!3126 (_2!6026 lt!203565)) lt!203569 (BitStream!4783 (buf!3126 (_2!6026 lt!203565)) (currentByte!5905 (_2!6026 lt!203578)) (currentBit!5900 (_2!6026 lt!203578)))))))

(assert (=> d!42088 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6026 lt!203578) (buf!3126 (_2!6026 lt!203565)) lt!203569) lt!204092)))

(declare-fun bs!10281 () Bool)

(assert (= bs!10281 d!42088))

(assert (=> bs!10281 m!199305))

(declare-fun m!199779 () Bool)

(assert (=> bs!10281 m!199779))

(assert (=> b!132000 d!42088))

(declare-fun d!42090 () Bool)

(declare-fun e!87668 () Bool)

(assert (=> d!42090 e!87668))

(declare-fun res!109781 () Bool)

(assert (=> d!42090 (=> (not res!109781) (not e!87668))))

(declare-fun lt!204134 () tuple2!11444)

(assert (=> d!42090 (= res!109781 (isPrefixOf!0 (_1!6025 lt!204134) (_2!6025 lt!204134)))))

(declare-fun lt!204141 () BitStream!4782)

(assert (=> d!42090 (= lt!204134 (tuple2!11445 lt!204141 (_2!6026 lt!203565)))))

(declare-fun lt!204135 () Unit!8141)

(declare-fun lt!204138 () Unit!8141)

(assert (=> d!42090 (= lt!204135 lt!204138)))

(assert (=> d!42090 (isPrefixOf!0 lt!204141 (_2!6026 lt!203565))))

(assert (=> d!42090 (= lt!204138 (lemmaIsPrefixTransitive!0 lt!204141 (_2!6026 lt!203565) (_2!6026 lt!203565)))))

(declare-fun lt!204149 () Unit!8141)

(declare-fun lt!204146 () Unit!8141)

(assert (=> d!42090 (= lt!204149 lt!204146)))

(assert (=> d!42090 (isPrefixOf!0 lt!204141 (_2!6026 lt!203565))))

(assert (=> d!42090 (= lt!204146 (lemmaIsPrefixTransitive!0 lt!204141 (_2!6026 lt!203578) (_2!6026 lt!203565)))))

(declare-fun lt!204143 () Unit!8141)

(declare-fun e!87667 () Unit!8141)

(assert (=> d!42090 (= lt!204143 e!87667)))

(declare-fun c!7582 () Bool)

(assert (=> d!42090 (= c!7582 (not (= (size!2759 (buf!3126 (_2!6026 lt!203578))) #b00000000000000000000000000000000)))))

(declare-fun lt!204139 () Unit!8141)

(declare-fun lt!204142 () Unit!8141)

(assert (=> d!42090 (= lt!204139 lt!204142)))

(assert (=> d!42090 (isPrefixOf!0 (_2!6026 lt!203565) (_2!6026 lt!203565))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4782) Unit!8141)

(assert (=> d!42090 (= lt!204142 (lemmaIsPrefixRefl!0 (_2!6026 lt!203565)))))

(declare-fun lt!204145 () Unit!8141)

(declare-fun lt!204144 () Unit!8141)

(assert (=> d!42090 (= lt!204145 lt!204144)))

(assert (=> d!42090 (= lt!204144 (lemmaIsPrefixRefl!0 (_2!6026 lt!203565)))))

(declare-fun lt!204133 () Unit!8141)

(declare-fun lt!204137 () Unit!8141)

(assert (=> d!42090 (= lt!204133 lt!204137)))

(assert (=> d!42090 (isPrefixOf!0 lt!204141 lt!204141)))

(assert (=> d!42090 (= lt!204137 (lemmaIsPrefixRefl!0 lt!204141))))

(declare-fun lt!204151 () Unit!8141)

(declare-fun lt!204150 () Unit!8141)

(assert (=> d!42090 (= lt!204151 lt!204150)))

(assert (=> d!42090 (isPrefixOf!0 (_2!6026 lt!203578) (_2!6026 lt!203578))))

(assert (=> d!42090 (= lt!204150 (lemmaIsPrefixRefl!0 (_2!6026 lt!203578)))))

(assert (=> d!42090 (= lt!204141 (BitStream!4783 (buf!3126 (_2!6026 lt!203565)) (currentByte!5905 (_2!6026 lt!203578)) (currentBit!5900 (_2!6026 lt!203578))))))

(assert (=> d!42090 (isPrefixOf!0 (_2!6026 lt!203578) (_2!6026 lt!203565))))

(assert (=> d!42090 (= (reader!0 (_2!6026 lt!203578) (_2!6026 lt!203565)) lt!204134)))

(declare-fun b!132247 () Bool)

(declare-fun res!109779 () Bool)

(assert (=> b!132247 (=> (not res!109779) (not e!87668))))

(assert (=> b!132247 (= res!109779 (isPrefixOf!0 (_2!6025 lt!204134) (_2!6026 lt!203565)))))

(declare-fun b!132248 () Bool)

(declare-fun Unit!8151 () Unit!8141)

(assert (=> b!132248 (= e!87667 Unit!8151)))

(declare-fun lt!204147 () (_ BitVec 64))

(declare-fun b!132249 () Bool)

(declare-fun lt!204136 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!4782 (_ BitVec 64)) BitStream!4782)

(assert (=> b!132249 (= e!87668 (= (_1!6025 lt!204134) (withMovedBitIndex!0 (_2!6025 lt!204134) (bvsub lt!204136 lt!204147))))))

(assert (=> b!132249 (or (= (bvand lt!204136 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!204147 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!204136 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!204136 lt!204147) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!132249 (= lt!204147 (bitIndex!0 (size!2759 (buf!3126 (_2!6026 lt!203565))) (currentByte!5905 (_2!6026 lt!203565)) (currentBit!5900 (_2!6026 lt!203565))))))

(assert (=> b!132249 (= lt!204136 (bitIndex!0 (size!2759 (buf!3126 (_2!6026 lt!203578))) (currentByte!5905 (_2!6026 lt!203578)) (currentBit!5900 (_2!6026 lt!203578))))))

(declare-fun b!132250 () Bool)

(declare-fun res!109780 () Bool)

(assert (=> b!132250 (=> (not res!109780) (not e!87668))))

(assert (=> b!132250 (= res!109780 (isPrefixOf!0 (_1!6025 lt!204134) (_2!6026 lt!203578)))))

(declare-fun b!132251 () Bool)

(declare-fun lt!204140 () Unit!8141)

(assert (=> b!132251 (= e!87667 lt!204140)))

(declare-fun lt!204152 () (_ BitVec 64))

(assert (=> b!132251 (= lt!204152 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!204148 () (_ BitVec 64))

(assert (=> b!132251 (= lt!204148 (bitIndex!0 (size!2759 (buf!3126 (_2!6026 lt!203578))) (currentByte!5905 (_2!6026 lt!203578)) (currentBit!5900 (_2!6026 lt!203578))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!6093 array!6093 (_ BitVec 64) (_ BitVec 64)) Unit!8141)

(assert (=> b!132251 (= lt!204140 (arrayBitRangesEqSymmetric!0 (buf!3126 (_2!6026 lt!203578)) (buf!3126 (_2!6026 lt!203565)) lt!204152 lt!204148))))

(declare-fun arrayBitRangesEq!0 (array!6093 array!6093 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!132251 (arrayBitRangesEq!0 (buf!3126 (_2!6026 lt!203565)) (buf!3126 (_2!6026 lt!203578)) lt!204152 lt!204148)))

(assert (= (and d!42090 c!7582) b!132251))

(assert (= (and d!42090 (not c!7582)) b!132248))

(assert (= (and d!42090 res!109781) b!132250))

(assert (= (and b!132250 res!109780) b!132247))

(assert (= (and b!132247 res!109779) b!132249))

(assert (=> b!132251 m!199283))

(declare-fun m!199781 () Bool)

(assert (=> b!132251 m!199781))

(declare-fun m!199783 () Bool)

(assert (=> b!132251 m!199783))

(declare-fun m!199785 () Bool)

(assert (=> d!42090 m!199785))

(declare-fun m!199787 () Bool)

(assert (=> d!42090 m!199787))

(assert (=> d!42090 m!199297))

(declare-fun m!199789 () Bool)

(assert (=> d!42090 m!199789))

(declare-fun m!199791 () Bool)

(assert (=> d!42090 m!199791))

(declare-fun m!199793 () Bool)

(assert (=> d!42090 m!199793))

(declare-fun m!199795 () Bool)

(assert (=> d!42090 m!199795))

(declare-fun m!199797 () Bool)

(assert (=> d!42090 m!199797))

(declare-fun m!199799 () Bool)

(assert (=> d!42090 m!199799))

(declare-fun m!199801 () Bool)

(assert (=> d!42090 m!199801))

(declare-fun m!199803 () Bool)

(assert (=> d!42090 m!199803))

(declare-fun m!199805 () Bool)

(assert (=> b!132247 m!199805))

(declare-fun m!199807 () Bool)

(assert (=> b!132249 m!199807))

(assert (=> b!132249 m!199281))

(assert (=> b!132249 m!199283))

(declare-fun m!199809 () Bool)

(assert (=> b!132250 m!199809))

(assert (=> b!132000 d!42090))

(declare-fun d!42092 () Bool)

(assert (=> d!42092 (= (invariant!0 (currentBit!5900 thiss!1634) (currentByte!5905 thiss!1634) (size!2759 (buf!3126 thiss!1634))) (and (bvsge (currentBit!5900 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!5900 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!5905 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!5905 thiss!1634) (size!2759 (buf!3126 thiss!1634))) (and (= (currentBit!5900 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!5905 thiss!1634) (size!2759 (buf!3126 thiss!1634)))))))))

(assert (=> b!131999 d!42092))

(declare-fun d!42094 () Bool)

(assert (=> d!42094 (= (array_inv!2548 arr!237) (bvsge (size!2759 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!25818 d!42094))

(declare-fun d!42096 () Bool)

(assert (=> d!42096 (= (inv!12 thiss!1634) (invariant!0 (currentBit!5900 thiss!1634) (currentByte!5905 thiss!1634) (size!2759 (buf!3126 thiss!1634))))))

(declare-fun bs!10282 () Bool)

(assert (= bs!10282 d!42096))

(assert (=> bs!10282 m!199299))

(assert (=> start!25818 d!42096))

(declare-fun d!42098 () Bool)

(declare-fun res!109790 () Bool)

(declare-fun e!87674 () Bool)

(assert (=> d!42098 (=> (not res!109790) (not e!87674))))

(assert (=> d!42098 (= res!109790 (= (size!2759 (buf!3126 thiss!1634)) (size!2759 (buf!3126 (_2!6026 lt!203578)))))))

(assert (=> d!42098 (= (isPrefixOf!0 thiss!1634 (_2!6026 lt!203578)) e!87674)))

(declare-fun b!132258 () Bool)

(declare-fun res!109788 () Bool)

(assert (=> b!132258 (=> (not res!109788) (not e!87674))))

(assert (=> b!132258 (= res!109788 (bvsle (bitIndex!0 (size!2759 (buf!3126 thiss!1634)) (currentByte!5905 thiss!1634) (currentBit!5900 thiss!1634)) (bitIndex!0 (size!2759 (buf!3126 (_2!6026 lt!203578))) (currentByte!5905 (_2!6026 lt!203578)) (currentBit!5900 (_2!6026 lt!203578)))))))

(declare-fun b!132259 () Bool)

(declare-fun e!87673 () Bool)

(assert (=> b!132259 (= e!87674 e!87673)))

(declare-fun res!109789 () Bool)

(assert (=> b!132259 (=> res!109789 e!87673)))

(assert (=> b!132259 (= res!109789 (= (size!2759 (buf!3126 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!132260 () Bool)

(assert (=> b!132260 (= e!87673 (arrayBitRangesEq!0 (buf!3126 thiss!1634) (buf!3126 (_2!6026 lt!203578)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2759 (buf!3126 thiss!1634)) (currentByte!5905 thiss!1634) (currentBit!5900 thiss!1634))))))

(assert (= (and d!42098 res!109790) b!132258))

(assert (= (and b!132258 res!109788) b!132259))

(assert (= (and b!132259 (not res!109789)) b!132260))

(assert (=> b!132258 m!199345))

(assert (=> b!132258 m!199283))

(assert (=> b!132260 m!199345))

(assert (=> b!132260 m!199345))

(declare-fun m!199811 () Bool)

(assert (=> b!132260 m!199811))

(assert (=> b!132003 d!42098))

(declare-fun d!42100 () Bool)

(assert (=> d!42100 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2759 (buf!3126 thiss!1634))) ((_ sign_extend 32) (currentByte!5905 thiss!1634)) ((_ sign_extend 32) (currentBit!5900 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2759 (buf!3126 thiss!1634))) ((_ sign_extend 32) (currentByte!5905 thiss!1634)) ((_ sign_extend 32) (currentBit!5900 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10283 () Bool)

(assert (= bs!10283 d!42100))

(declare-fun m!199813 () Bool)

(assert (=> bs!10283 m!199813))

(assert (=> b!132001 d!42100))

(declare-fun d!42102 () Bool)

(declare-datatypes ((tuple2!11462 0))(
  ( (tuple2!11463 (_1!6037 (_ BitVec 8)) (_2!6037 BitStream!4782)) )
))
(declare-fun lt!204155 () tuple2!11462)

(declare-fun readByte!0 (BitStream!4782) tuple2!11462)

(assert (=> d!42102 (= lt!204155 (readByte!0 lt!203562))))

(assert (=> d!42102 (= (readBytePure!0 lt!203562) (tuple2!11443 (_2!6037 lt!204155) (_1!6037 lt!204155)))))

(declare-fun bs!10284 () Bool)

(assert (= bs!10284 d!42102))

(declare-fun m!199815 () Bool)

(assert (=> bs!10284 m!199815))

(assert (=> b!132002 d!42102))

(assert (=> b!132002 d!42090))

(declare-fun b!132271 () Bool)

(declare-fun res!109803 () Bool)

(declare-fun e!87682 () Bool)

(assert (=> b!132271 (=> (not res!109803) (not e!87682))))

(declare-fun lt!204179 () tuple2!11446)

(assert (=> b!132271 (= res!109803 (isPrefixOf!0 (_2!6026 lt!203578) (_2!6026 lt!204179)))))

(declare-fun d!42104 () Bool)

(assert (=> d!42104 e!87682))

(declare-fun res!109805 () Bool)

(assert (=> d!42104 (=> (not res!109805) (not e!87682))))

(assert (=> d!42104 (= res!109805 (= (size!2759 (buf!3126 (_2!6026 lt!203578))) (size!2759 (buf!3126 (_2!6026 lt!204179)))))))

(declare-fun choose!64 (BitStream!4782 array!6093 (_ BitVec 32) (_ BitVec 32)) tuple2!11446)

(assert (=> d!42104 (= lt!204179 (choose!64 (_2!6026 lt!203578) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!42104 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!2759 arr!237)))))

(assert (=> d!42104 (= (appendByteArrayLoop!0 (_2!6026 lt!203578) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!204179)))

(declare-fun b!132272 () Bool)

(declare-fun e!87681 () Bool)

(declare-fun lt!204181 () (_ BitVec 64))

(assert (=> b!132272 (= e!87681 (validate_offset_bits!1 ((_ sign_extend 32) (size!2759 (buf!3126 (_2!6026 lt!203578)))) ((_ sign_extend 32) (currentByte!5905 (_2!6026 lt!203578))) ((_ sign_extend 32) (currentBit!5900 (_2!6026 lt!203578))) lt!204181))))

(declare-fun b!132273 () Bool)

(declare-fun e!87683 () Bool)

(assert (=> b!132273 (= e!87682 e!87683)))

(declare-fun res!109802 () Bool)

(assert (=> b!132273 (=> (not res!109802) (not e!87683))))

(declare-fun lt!204176 () tuple2!11448)

(declare-fun lt!204180 () tuple2!11444)

(assert (=> b!132273 (= res!109802 (and (= (size!2759 (_2!6027 lt!204176)) (size!2759 arr!237)) (= (_1!6027 lt!204176) (_2!6025 lt!204180))))))

(assert (=> b!132273 (= lt!204176 (readByteArrayLoopPure!0 (_1!6025 lt!204180) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!204177 () Unit!8141)

(declare-fun lt!204175 () Unit!8141)

(assert (=> b!132273 (= lt!204177 lt!204175)))

(assert (=> b!132273 (validate_offset_bits!1 ((_ sign_extend 32) (size!2759 (buf!3126 (_2!6026 lt!204179)))) ((_ sign_extend 32) (currentByte!5905 (_2!6026 lt!203578))) ((_ sign_extend 32) (currentBit!5900 (_2!6026 lt!203578))) lt!204181)))

(assert (=> b!132273 (= lt!204175 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6026 lt!203578) (buf!3126 (_2!6026 lt!204179)) lt!204181))))

(assert (=> b!132273 e!87681))

(declare-fun res!109801 () Bool)

(assert (=> b!132273 (=> (not res!109801) (not e!87681))))

(assert (=> b!132273 (= res!109801 (and (= (size!2759 (buf!3126 (_2!6026 lt!203578))) (size!2759 (buf!3126 (_2!6026 lt!204179)))) (bvsge lt!204181 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!132273 (= lt!204181 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!132273 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!132273 (= lt!204180 (reader!0 (_2!6026 lt!203578) (_2!6026 lt!204179)))))

(declare-fun b!132274 () Bool)

(declare-fun res!109804 () Bool)

(assert (=> b!132274 (=> (not res!109804) (not e!87682))))

(declare-fun lt!204174 () (_ BitVec 64))

(declare-fun lt!204182 () (_ BitVec 64))

(assert (=> b!132274 (= res!109804 (= (bitIndex!0 (size!2759 (buf!3126 (_2!6026 lt!204179))) (currentByte!5905 (_2!6026 lt!204179)) (currentBit!5900 (_2!6026 lt!204179))) (bvadd lt!204182 lt!204174)))))

(assert (=> b!132274 (or (not (= (bvand lt!204182 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!204174 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!204182 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!204182 lt!204174) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!204178 () (_ BitVec 64))

(assert (=> b!132274 (= lt!204174 (bvmul lt!204178 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!132274 (or (= lt!204178 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!204178 #b0000000000000000000000000000000000000000000000000000000000001000) lt!204178)))))

(assert (=> b!132274 (= lt!204178 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!132274 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!132274 (= lt!204182 (bitIndex!0 (size!2759 (buf!3126 (_2!6026 lt!203578))) (currentByte!5905 (_2!6026 lt!203578)) (currentBit!5900 (_2!6026 lt!203578))))))

(declare-fun b!132275 () Bool)

(assert (=> b!132275 (= e!87683 (arrayRangesEq!162 arr!237 (_2!6027 lt!204176) #b00000000000000000000000000000000 to!404))))

(assert (= (and d!42104 res!109805) b!132274))

(assert (= (and b!132274 res!109804) b!132271))

(assert (= (and b!132271 res!109803) b!132273))

(assert (= (and b!132273 res!109801) b!132272))

(assert (= (and b!132273 res!109802) b!132275))

(declare-fun m!199817 () Bool)

(assert (=> b!132275 m!199817))

(declare-fun m!199819 () Bool)

(assert (=> b!132274 m!199819))

(assert (=> b!132274 m!199283))

(declare-fun m!199821 () Bool)

(assert (=> d!42104 m!199821))

(declare-fun m!199823 () Bool)

(assert (=> b!132273 m!199823))

(declare-fun m!199825 () Bool)

(assert (=> b!132273 m!199825))

(declare-fun m!199827 () Bool)

(assert (=> b!132273 m!199827))

(declare-fun m!199829 () Bool)

(assert (=> b!132273 m!199829))

(declare-fun m!199831 () Bool)

(assert (=> b!132271 m!199831))

(declare-fun m!199833 () Bool)

(assert (=> b!132272 m!199833))

(assert (=> b!132002 d!42104))

(declare-fun d!42106 () Bool)

(declare-fun e!87686 () Bool)

(assert (=> d!42106 e!87686))

(declare-fun res!109811 () Bool)

(assert (=> d!42106 (=> (not res!109811) (not e!87686))))

(declare-fun lt!204197 () (_ BitVec 64))

(declare-fun lt!204198 () (_ BitVec 64))

(declare-fun lt!204195 () (_ BitVec 64))

(assert (=> d!42106 (= res!109811 (= lt!204195 (bvsub lt!204198 lt!204197)))))

(assert (=> d!42106 (or (= (bvand lt!204198 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!204197 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!204198 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!204198 lt!204197) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!42106 (= lt!204197 (remainingBits!0 ((_ sign_extend 32) (size!2759 (buf!3126 (_1!6024 lt!203574)))) ((_ sign_extend 32) (currentByte!5905 (_1!6024 lt!203574))) ((_ sign_extend 32) (currentBit!5900 (_1!6024 lt!203574)))))))

(declare-fun lt!204200 () (_ BitVec 64))

(declare-fun lt!204199 () (_ BitVec 64))

(assert (=> d!42106 (= lt!204198 (bvmul lt!204200 lt!204199))))

(assert (=> d!42106 (or (= lt!204200 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!204199 (bvsdiv (bvmul lt!204200 lt!204199) lt!204200)))))

(assert (=> d!42106 (= lt!204199 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!42106 (= lt!204200 ((_ sign_extend 32) (size!2759 (buf!3126 (_1!6024 lt!203574)))))))

(assert (=> d!42106 (= lt!204195 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5905 (_1!6024 lt!203574))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5900 (_1!6024 lt!203574)))))))

(assert (=> d!42106 (invariant!0 (currentBit!5900 (_1!6024 lt!203574)) (currentByte!5905 (_1!6024 lt!203574)) (size!2759 (buf!3126 (_1!6024 lt!203574))))))

(assert (=> d!42106 (= (bitIndex!0 (size!2759 (buf!3126 (_1!6024 lt!203574))) (currentByte!5905 (_1!6024 lt!203574)) (currentBit!5900 (_1!6024 lt!203574))) lt!204195)))

(declare-fun b!132280 () Bool)

(declare-fun res!109810 () Bool)

(assert (=> b!132280 (=> (not res!109810) (not e!87686))))

(assert (=> b!132280 (= res!109810 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!204195))))

(declare-fun b!132281 () Bool)

(declare-fun lt!204196 () (_ BitVec 64))

(assert (=> b!132281 (= e!87686 (bvsle lt!204195 (bvmul lt!204196 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!132281 (or (= lt!204196 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!204196 #b0000000000000000000000000000000000000000000000000000000000001000) lt!204196)))))

(assert (=> b!132281 (= lt!204196 ((_ sign_extend 32) (size!2759 (buf!3126 (_1!6024 lt!203574)))))))

(assert (= (and d!42106 res!109811) b!132280))

(assert (= (and b!132280 res!109810) b!132281))

(declare-fun m!199835 () Bool)

(assert (=> d!42106 m!199835))

(declare-fun m!199837 () Bool)

(assert (=> d!42106 m!199837))

(assert (=> b!132002 d!42106))

(declare-fun d!42108 () Bool)

(declare-fun e!87687 () Bool)

(assert (=> d!42108 e!87687))

(declare-fun res!109813 () Bool)

(assert (=> d!42108 (=> (not res!109813) (not e!87687))))

(declare-fun lt!204203 () (_ BitVec 64))

(declare-fun lt!204204 () (_ BitVec 64))

(declare-fun lt!204201 () (_ BitVec 64))

(assert (=> d!42108 (= res!109813 (= lt!204201 (bvsub lt!204204 lt!204203)))))

(assert (=> d!42108 (or (= (bvand lt!204204 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!204203 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!204204 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!204204 lt!204203) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!42108 (= lt!204203 (remainingBits!0 ((_ sign_extend 32) (size!2759 (buf!3126 (_1!6024 lt!203566)))) ((_ sign_extend 32) (currentByte!5905 (_1!6024 lt!203566))) ((_ sign_extend 32) (currentBit!5900 (_1!6024 lt!203566)))))))

(declare-fun lt!204206 () (_ BitVec 64))

(declare-fun lt!204205 () (_ BitVec 64))

(assert (=> d!42108 (= lt!204204 (bvmul lt!204206 lt!204205))))

(assert (=> d!42108 (or (= lt!204206 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!204205 (bvsdiv (bvmul lt!204206 lt!204205) lt!204206)))))

(assert (=> d!42108 (= lt!204205 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!42108 (= lt!204206 ((_ sign_extend 32) (size!2759 (buf!3126 (_1!6024 lt!203566)))))))

(assert (=> d!42108 (= lt!204201 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5905 (_1!6024 lt!203566))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5900 (_1!6024 lt!203566)))))))

(assert (=> d!42108 (invariant!0 (currentBit!5900 (_1!6024 lt!203566)) (currentByte!5905 (_1!6024 lt!203566)) (size!2759 (buf!3126 (_1!6024 lt!203566))))))

(assert (=> d!42108 (= (bitIndex!0 (size!2759 (buf!3126 (_1!6024 lt!203566))) (currentByte!5905 (_1!6024 lt!203566)) (currentBit!5900 (_1!6024 lt!203566))) lt!204201)))

(declare-fun b!132282 () Bool)

(declare-fun res!109812 () Bool)

(assert (=> b!132282 (=> (not res!109812) (not e!87687))))

(assert (=> b!132282 (= res!109812 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!204201))))

(declare-fun b!132283 () Bool)

(declare-fun lt!204202 () (_ BitVec 64))

(assert (=> b!132283 (= e!87687 (bvsle lt!204201 (bvmul lt!204202 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!132283 (or (= lt!204202 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!204202 #b0000000000000000000000000000000000000000000000000000000000001000) lt!204202)))))

(assert (=> b!132283 (= lt!204202 ((_ sign_extend 32) (size!2759 (buf!3126 (_1!6024 lt!203566)))))))

(assert (= (and d!42108 res!109813) b!132282))

(assert (= (and b!132282 res!109812) b!132283))

(declare-fun m!199839 () Bool)

(assert (=> d!42108 m!199839))

(declare-fun m!199841 () Bool)

(assert (=> d!42108 m!199841))

(assert (=> b!132002 d!42108))

(declare-fun d!42110 () Bool)

(assert (=> d!42110 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2759 (buf!3126 (_2!6026 lt!203565)))) ((_ sign_extend 32) (currentByte!5905 thiss!1634)) ((_ sign_extend 32) (currentBit!5900 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!204209 () Unit!8141)

(declare-fun choose!26 (BitStream!4782 array!6093 (_ BitVec 32) BitStream!4782) Unit!8141)

(assert (=> d!42110 (= lt!204209 (choose!26 thiss!1634 (buf!3126 (_2!6026 lt!203565)) (bvsub to!404 from!447) (BitStream!4783 (buf!3126 (_2!6026 lt!203565)) (currentByte!5905 thiss!1634) (currentBit!5900 thiss!1634))))))

(assert (=> d!42110 (= (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3126 (_2!6026 lt!203565)) (bvsub to!404 from!447)) lt!204209)))

(declare-fun bs!10285 () Bool)

(assert (= bs!10285 d!42110))

(assert (=> bs!10285 m!199315))

(declare-fun m!199843 () Bool)

(assert (=> bs!10285 m!199843))

(assert (=> b!132002 d!42110))

(declare-fun d!42112 () Bool)

(declare-fun e!87690 () Bool)

(assert (=> d!42112 e!87690))

(declare-fun res!109816 () Bool)

(assert (=> d!42112 (=> (not res!109816) (not e!87690))))

(declare-fun lt!204220 () tuple2!11442)

(declare-fun lt!204218 () tuple2!11442)

(assert (=> d!42112 (= res!109816 (= (bitIndex!0 (size!2759 (buf!3126 (_1!6024 lt!204220))) (currentByte!5905 (_1!6024 lt!204220)) (currentBit!5900 (_1!6024 lt!204220))) (bitIndex!0 (size!2759 (buf!3126 (_1!6024 lt!204218))) (currentByte!5905 (_1!6024 lt!204218)) (currentBit!5900 (_1!6024 lt!204218)))))))

(declare-fun lt!204221 () BitStream!4782)

(declare-fun lt!204219 () Unit!8141)

(declare-fun choose!14 (BitStream!4782 BitStream!4782 BitStream!4782 tuple2!11442 tuple2!11442 BitStream!4782 (_ BitVec 8) tuple2!11442 tuple2!11442 BitStream!4782 (_ BitVec 8)) Unit!8141)

(assert (=> d!42112 (= lt!204219 (choose!14 lt!203562 (_2!6026 lt!203565) lt!204221 lt!204220 (tuple2!11443 (_1!6024 lt!204220) (_2!6024 lt!204220)) (_1!6024 lt!204220) (_2!6024 lt!204220) lt!204218 (tuple2!11443 (_1!6024 lt!204218) (_2!6024 lt!204218)) (_1!6024 lt!204218) (_2!6024 lt!204218)))))

(assert (=> d!42112 (= lt!204218 (readBytePure!0 lt!204221))))

(assert (=> d!42112 (= lt!204220 (readBytePure!0 lt!203562))))

(assert (=> d!42112 (= lt!204221 (BitStream!4783 (buf!3126 (_2!6026 lt!203565)) (currentByte!5905 lt!203562) (currentBit!5900 lt!203562)))))

(assert (=> d!42112 (= (readBytePrefixLemma!0 lt!203562 (_2!6026 lt!203565)) lt!204219)))

(declare-fun b!132286 () Bool)

(assert (=> b!132286 (= e!87690 (= (_2!6024 lt!204220) (_2!6024 lt!204218)))))

(assert (= (and d!42112 res!109816) b!132286))

(declare-fun m!199845 () Bool)

(assert (=> d!42112 m!199845))

(declare-fun m!199847 () Bool)

(assert (=> d!42112 m!199847))

(assert (=> d!42112 m!199323))

(declare-fun m!199849 () Bool)

(assert (=> d!42112 m!199849))

(declare-fun m!199851 () Bool)

(assert (=> d!42112 m!199851))

(assert (=> b!132002 d!42112))

(declare-fun d!42114 () Bool)

(declare-fun e!87693 () Bool)

(assert (=> d!42114 e!87693))

(declare-fun res!109819 () Bool)

(assert (=> d!42114 (=> (not res!109819) (not e!87693))))

(assert (=> d!42114 (= res!109819 (and (or (let ((rhs!3094 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3094 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3094) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!42115 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!42115 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!42115 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3093 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3093 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3093) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!204230 () Unit!8141)

(declare-fun choose!57 (BitStream!4782 BitStream!4782 (_ BitVec 64) (_ BitVec 32)) Unit!8141)

(assert (=> d!42114 (= lt!204230 (choose!57 thiss!1634 (_2!6026 lt!203578) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> d!42114 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6026 lt!203578) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)) lt!204230)))

(declare-fun lt!204228 () (_ BitVec 32))

(declare-fun b!132289 () Bool)

(assert (=> b!132289 (= e!87693 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2759 (buf!3126 (_2!6026 lt!203578)))) ((_ sign_extend 32) (currentByte!5905 (_2!6026 lt!203578))) ((_ sign_extend 32) (currentBit!5900 (_2!6026 lt!203578))) (bvsub (bvsub to!404 from!447) lt!204228)))))

(assert (=> b!132289 (or (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand lt!204228 #b10000000000000000000000000000000)) (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!404 from!447) lt!204228) #b10000000000000000000000000000000)))))

(declare-fun lt!204229 () (_ BitVec 64))

(assert (=> b!132289 (= lt!204228 ((_ extract 31 0) lt!204229))))

(assert (=> b!132289 (and (bvslt lt!204229 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!204229 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!132289 (= lt!204229 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!42114 res!109819) b!132289))

(declare-fun m!199853 () Bool)

(assert (=> d!42114 m!199853))

(declare-fun m!199855 () Bool)

(assert (=> b!132289 m!199855))

(assert (=> b!132002 d!42114))

(declare-fun d!42117 () Bool)

(declare-fun e!87696 () Bool)

(assert (=> d!42117 e!87696))

(declare-fun res!109827 () Bool)

(assert (=> d!42117 (=> (not res!109827) (not e!87696))))

(declare-fun lt!204243 () tuple2!11446)

(assert (=> d!42117 (= res!109827 (= (size!2759 (buf!3126 thiss!1634)) (size!2759 (buf!3126 (_2!6026 lt!204243)))))))

(declare-fun choose!6 (BitStream!4782 (_ BitVec 8)) tuple2!11446)

(assert (=> d!42117 (= lt!204243 (choose!6 thiss!1634 (select (arr!3388 arr!237) from!447)))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!42117 (validate_offset_byte!0 ((_ sign_extend 32) (size!2759 (buf!3126 thiss!1634))) ((_ sign_extend 32) (currentByte!5905 thiss!1634)) ((_ sign_extend 32) (currentBit!5900 thiss!1634)))))

(assert (=> d!42117 (= (appendByte!0 thiss!1634 (select (arr!3388 arr!237) from!447)) lt!204243)))

(declare-fun b!132296 () Bool)

(declare-fun res!109826 () Bool)

(assert (=> b!132296 (=> (not res!109826) (not e!87696))))

(declare-fun lt!204244 () (_ BitVec 64))

(declare-fun lt!204241 () (_ BitVec 64))

(assert (=> b!132296 (= res!109826 (= (bitIndex!0 (size!2759 (buf!3126 (_2!6026 lt!204243))) (currentByte!5905 (_2!6026 lt!204243)) (currentBit!5900 (_2!6026 lt!204243))) (bvadd lt!204244 lt!204241)))))

(assert (=> b!132296 (or (not (= (bvand lt!204244 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!204241 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!204244 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!204244 lt!204241) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!132296 (= lt!204241 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!132296 (= lt!204244 (bitIndex!0 (size!2759 (buf!3126 thiss!1634)) (currentByte!5905 thiss!1634) (currentBit!5900 thiss!1634)))))

(declare-fun b!132297 () Bool)

(declare-fun res!109828 () Bool)

(assert (=> b!132297 (=> (not res!109828) (not e!87696))))

(assert (=> b!132297 (= res!109828 (isPrefixOf!0 thiss!1634 (_2!6026 lt!204243)))))

(declare-fun lt!204245 () tuple2!11444)

(declare-fun lt!204242 () tuple2!11442)

(declare-fun b!132298 () Bool)

(assert (=> b!132298 (= e!87696 (and (= (_2!6024 lt!204242) (select (arr!3388 arr!237) from!447)) (= (_1!6024 lt!204242) (_2!6025 lt!204245))))))

(assert (=> b!132298 (= lt!204242 (readBytePure!0 (_1!6025 lt!204245)))))

(assert (=> b!132298 (= lt!204245 (reader!0 thiss!1634 (_2!6026 lt!204243)))))

(assert (= (and d!42117 res!109827) b!132296))

(assert (= (and b!132296 res!109826) b!132297))

(assert (= (and b!132297 res!109828) b!132298))

(assert (=> d!42117 m!199271))

(declare-fun m!199857 () Bool)

(assert (=> d!42117 m!199857))

(declare-fun m!199859 () Bool)

(assert (=> d!42117 m!199859))

(declare-fun m!199861 () Bool)

(assert (=> b!132296 m!199861))

(assert (=> b!132296 m!199345))

(declare-fun m!199863 () Bool)

(assert (=> b!132297 m!199863))

(declare-fun m!199865 () Bool)

(assert (=> b!132298 m!199865))

(declare-fun m!199867 () Bool)

(assert (=> b!132298 m!199867))

(assert (=> b!132002 d!42117))

(declare-fun d!42119 () Bool)

(assert (=> d!42119 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2759 (buf!3126 (_2!6026 lt!203578)))) ((_ sign_extend 32) (currentByte!5905 (_2!6026 lt!203578))) ((_ sign_extend 32) (currentBit!5900 (_2!6026 lt!203578))) lt!203573) (bvsle ((_ sign_extend 32) lt!203573) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2759 (buf!3126 (_2!6026 lt!203578)))) ((_ sign_extend 32) (currentByte!5905 (_2!6026 lt!203578))) ((_ sign_extend 32) (currentBit!5900 (_2!6026 lt!203578)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10286 () Bool)

(assert (= bs!10286 d!42119))

(declare-fun m!199869 () Bool)

(assert (=> bs!10286 m!199869))

(assert (=> b!132002 d!42119))

(declare-fun d!42121 () Bool)

(assert (=> d!42121 (isPrefixOf!0 thiss!1634 (_2!6026 lt!203565))))

(declare-fun lt!204248 () Unit!8141)

(declare-fun choose!30 (BitStream!4782 BitStream!4782 BitStream!4782) Unit!8141)

(assert (=> d!42121 (= lt!204248 (choose!30 thiss!1634 (_2!6026 lt!203578) (_2!6026 lt!203565)))))

(assert (=> d!42121 (isPrefixOf!0 thiss!1634 (_2!6026 lt!203578))))

(assert (=> d!42121 (= (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6026 lt!203578) (_2!6026 lt!203565)) lt!204248)))

(declare-fun bs!10287 () Bool)

(assert (= bs!10287 d!42121))

(assert (=> bs!10287 m!199337))

(declare-fun m!199871 () Bool)

(assert (=> bs!10287 m!199871))

(assert (=> bs!10287 m!199293))

(assert (=> b!132002 d!42121))

(declare-fun d!42123 () Bool)

(declare-fun lt!204249 () tuple2!11462)

(assert (=> d!42123 (= lt!204249 (readByte!0 (BitStream!4783 (buf!3126 (_2!6026 lt!203565)) (currentByte!5905 thiss!1634) (currentBit!5900 thiss!1634))))))

(assert (=> d!42123 (= (readBytePure!0 (BitStream!4783 (buf!3126 (_2!6026 lt!203565)) (currentByte!5905 thiss!1634) (currentBit!5900 thiss!1634))) (tuple2!11443 (_2!6037 lt!204249) (_1!6037 lt!204249)))))

(declare-fun bs!10288 () Bool)

(assert (= bs!10288 d!42123))

(declare-fun m!199873 () Bool)

(assert (=> bs!10288 m!199873))

(assert (=> b!132002 d!42123))

(declare-fun d!42125 () Bool)

(assert (=> d!42125 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2759 (buf!3126 (_2!6026 lt!203565)))) ((_ sign_extend 32) (currentByte!5905 (_2!6026 lt!203578))) ((_ sign_extend 32) (currentBit!5900 (_2!6026 lt!203578))) lt!203573) (bvsle ((_ sign_extend 32) lt!203573) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2759 (buf!3126 (_2!6026 lt!203565)))) ((_ sign_extend 32) (currentByte!5905 (_2!6026 lt!203578))) ((_ sign_extend 32) (currentBit!5900 (_2!6026 lt!203578)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10289 () Bool)

(assert (= bs!10289 d!42125))

(assert (=> bs!10289 m!199777))

(assert (=> b!132002 d!42125))

(declare-fun d!42127 () Bool)

(declare-fun res!109831 () Bool)

(declare-fun e!87698 () Bool)

(assert (=> d!42127 (=> (not res!109831) (not e!87698))))

(assert (=> d!42127 (= res!109831 (= (size!2759 (buf!3126 thiss!1634)) (size!2759 (buf!3126 (_2!6026 lt!203565)))))))

(assert (=> d!42127 (= (isPrefixOf!0 thiss!1634 (_2!6026 lt!203565)) e!87698)))

(declare-fun b!132299 () Bool)

(declare-fun res!109829 () Bool)

(assert (=> b!132299 (=> (not res!109829) (not e!87698))))

(assert (=> b!132299 (= res!109829 (bvsle (bitIndex!0 (size!2759 (buf!3126 thiss!1634)) (currentByte!5905 thiss!1634) (currentBit!5900 thiss!1634)) (bitIndex!0 (size!2759 (buf!3126 (_2!6026 lt!203565))) (currentByte!5905 (_2!6026 lt!203565)) (currentBit!5900 (_2!6026 lt!203565)))))))

(declare-fun b!132300 () Bool)

(declare-fun e!87697 () Bool)

(assert (=> b!132300 (= e!87698 e!87697)))

(declare-fun res!109830 () Bool)

(assert (=> b!132300 (=> res!109830 e!87697)))

(assert (=> b!132300 (= res!109830 (= (size!2759 (buf!3126 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!132301 () Bool)

(assert (=> b!132301 (= e!87697 (arrayBitRangesEq!0 (buf!3126 thiss!1634) (buf!3126 (_2!6026 lt!203565)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2759 (buf!3126 thiss!1634)) (currentByte!5905 thiss!1634) (currentBit!5900 thiss!1634))))))

(assert (= (and d!42127 res!109831) b!132299))

(assert (= (and b!132299 res!109829) b!132300))

(assert (= (and b!132300 (not res!109830)) b!132301))

(assert (=> b!132299 m!199345))

(assert (=> b!132299 m!199281))

(assert (=> b!132301 m!199345))

(assert (=> b!132301 m!199345))

(declare-fun m!199875 () Bool)

(assert (=> b!132301 m!199875))

(assert (=> b!132002 d!42127))

(declare-fun d!42129 () Bool)

(declare-fun e!87700 () Bool)

(assert (=> d!42129 e!87700))

(declare-fun res!109834 () Bool)

(assert (=> d!42129 (=> (not res!109834) (not e!87700))))

(declare-fun lt!204251 () tuple2!11444)

(assert (=> d!42129 (= res!109834 (isPrefixOf!0 (_1!6025 lt!204251) (_2!6025 lt!204251)))))

(declare-fun lt!204258 () BitStream!4782)

(assert (=> d!42129 (= lt!204251 (tuple2!11445 lt!204258 (_2!6026 lt!203565)))))

(declare-fun lt!204252 () Unit!8141)

(declare-fun lt!204255 () Unit!8141)

(assert (=> d!42129 (= lt!204252 lt!204255)))

(assert (=> d!42129 (isPrefixOf!0 lt!204258 (_2!6026 lt!203565))))

(assert (=> d!42129 (= lt!204255 (lemmaIsPrefixTransitive!0 lt!204258 (_2!6026 lt!203565) (_2!6026 lt!203565)))))

(declare-fun lt!204266 () Unit!8141)

(declare-fun lt!204263 () Unit!8141)

(assert (=> d!42129 (= lt!204266 lt!204263)))

(assert (=> d!42129 (isPrefixOf!0 lt!204258 (_2!6026 lt!203565))))

(assert (=> d!42129 (= lt!204263 (lemmaIsPrefixTransitive!0 lt!204258 thiss!1634 (_2!6026 lt!203565)))))

(declare-fun lt!204260 () Unit!8141)

(declare-fun e!87699 () Unit!8141)

(assert (=> d!42129 (= lt!204260 e!87699)))

(declare-fun c!7583 () Bool)

(assert (=> d!42129 (= c!7583 (not (= (size!2759 (buf!3126 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!204256 () Unit!8141)

(declare-fun lt!204259 () Unit!8141)

(assert (=> d!42129 (= lt!204256 lt!204259)))

(assert (=> d!42129 (isPrefixOf!0 (_2!6026 lt!203565) (_2!6026 lt!203565))))

(assert (=> d!42129 (= lt!204259 (lemmaIsPrefixRefl!0 (_2!6026 lt!203565)))))

(declare-fun lt!204262 () Unit!8141)

(declare-fun lt!204261 () Unit!8141)

(assert (=> d!42129 (= lt!204262 lt!204261)))

(assert (=> d!42129 (= lt!204261 (lemmaIsPrefixRefl!0 (_2!6026 lt!203565)))))

(declare-fun lt!204250 () Unit!8141)

(declare-fun lt!204254 () Unit!8141)

(assert (=> d!42129 (= lt!204250 lt!204254)))

(assert (=> d!42129 (isPrefixOf!0 lt!204258 lt!204258)))

(assert (=> d!42129 (= lt!204254 (lemmaIsPrefixRefl!0 lt!204258))))

(declare-fun lt!204268 () Unit!8141)

(declare-fun lt!204267 () Unit!8141)

(assert (=> d!42129 (= lt!204268 lt!204267)))

(assert (=> d!42129 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!42129 (= lt!204267 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!42129 (= lt!204258 (BitStream!4783 (buf!3126 (_2!6026 lt!203565)) (currentByte!5905 thiss!1634) (currentBit!5900 thiss!1634)))))

(assert (=> d!42129 (isPrefixOf!0 thiss!1634 (_2!6026 lt!203565))))

(assert (=> d!42129 (= (reader!0 thiss!1634 (_2!6026 lt!203565)) lt!204251)))

(declare-fun b!132302 () Bool)

(declare-fun res!109832 () Bool)

(assert (=> b!132302 (=> (not res!109832) (not e!87700))))

(assert (=> b!132302 (= res!109832 (isPrefixOf!0 (_2!6025 lt!204251) (_2!6026 lt!203565)))))

(declare-fun b!132303 () Bool)

(declare-fun Unit!8152 () Unit!8141)

(assert (=> b!132303 (= e!87699 Unit!8152)))

(declare-fun lt!204264 () (_ BitVec 64))

(declare-fun lt!204253 () (_ BitVec 64))

(declare-fun b!132304 () Bool)

(assert (=> b!132304 (= e!87700 (= (_1!6025 lt!204251) (withMovedBitIndex!0 (_2!6025 lt!204251) (bvsub lt!204253 lt!204264))))))

(assert (=> b!132304 (or (= (bvand lt!204253 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!204264 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!204253 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!204253 lt!204264) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!132304 (= lt!204264 (bitIndex!0 (size!2759 (buf!3126 (_2!6026 lt!203565))) (currentByte!5905 (_2!6026 lt!203565)) (currentBit!5900 (_2!6026 lt!203565))))))

(assert (=> b!132304 (= lt!204253 (bitIndex!0 (size!2759 (buf!3126 thiss!1634)) (currentByte!5905 thiss!1634) (currentBit!5900 thiss!1634)))))

(declare-fun b!132305 () Bool)

(declare-fun res!109833 () Bool)

(assert (=> b!132305 (=> (not res!109833) (not e!87700))))

(assert (=> b!132305 (= res!109833 (isPrefixOf!0 (_1!6025 lt!204251) thiss!1634))))

(declare-fun b!132306 () Bool)

(declare-fun lt!204257 () Unit!8141)

(assert (=> b!132306 (= e!87699 lt!204257)))

(declare-fun lt!204269 () (_ BitVec 64))

(assert (=> b!132306 (= lt!204269 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!204265 () (_ BitVec 64))

(assert (=> b!132306 (= lt!204265 (bitIndex!0 (size!2759 (buf!3126 thiss!1634)) (currentByte!5905 thiss!1634) (currentBit!5900 thiss!1634)))))

(assert (=> b!132306 (= lt!204257 (arrayBitRangesEqSymmetric!0 (buf!3126 thiss!1634) (buf!3126 (_2!6026 lt!203565)) lt!204269 lt!204265))))

(assert (=> b!132306 (arrayBitRangesEq!0 (buf!3126 (_2!6026 lt!203565)) (buf!3126 thiss!1634) lt!204269 lt!204265)))

(assert (= (and d!42129 c!7583) b!132306))

(assert (= (and d!42129 (not c!7583)) b!132303))

(assert (= (and d!42129 res!109834) b!132305))

(assert (= (and b!132305 res!109833) b!132302))

(assert (= (and b!132302 res!109832) b!132304))

(assert (=> b!132306 m!199345))

(declare-fun m!199877 () Bool)

(assert (=> b!132306 m!199877))

(declare-fun m!199879 () Bool)

(assert (=> b!132306 m!199879))

(assert (=> d!42129 m!199785))

(declare-fun m!199881 () Bool)

(assert (=> d!42129 m!199881))

(assert (=> d!42129 m!199337))

(declare-fun m!199883 () Bool)

(assert (=> d!42129 m!199883))

(declare-fun m!199885 () Bool)

(assert (=> d!42129 m!199885))

(declare-fun m!199887 () Bool)

(assert (=> d!42129 m!199887))

(declare-fun m!199889 () Bool)

(assert (=> d!42129 m!199889))

(declare-fun m!199891 () Bool)

(assert (=> d!42129 m!199891))

(assert (=> d!42129 m!199799))

(declare-fun m!199893 () Bool)

(assert (=> d!42129 m!199893))

(declare-fun m!199895 () Bool)

(assert (=> d!42129 m!199895))

(declare-fun m!199897 () Bool)

(assert (=> b!132302 m!199897))

(declare-fun m!199899 () Bool)

(assert (=> b!132304 m!199899))

(assert (=> b!132304 m!199281))

(assert (=> b!132304 m!199345))

(declare-fun m!199901 () Bool)

(assert (=> b!132305 m!199901))

(assert (=> b!132002 d!42129))

(declare-fun d!42131 () Bool)

(assert (=> d!42131 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2759 (buf!3126 (_2!6026 lt!203565)))) ((_ sign_extend 32) (currentByte!5905 (_2!6026 lt!203578))) ((_ sign_extend 32) (currentBit!5900 (_2!6026 lt!203578))) lt!203573)))

(declare-fun lt!204270 () Unit!8141)

(assert (=> d!42131 (= lt!204270 (choose!26 (_2!6026 lt!203578) (buf!3126 (_2!6026 lt!203565)) lt!203573 (BitStream!4783 (buf!3126 (_2!6026 lt!203565)) (currentByte!5905 (_2!6026 lt!203578)) (currentBit!5900 (_2!6026 lt!203578)))))))

(assert (=> d!42131 (= (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6026 lt!203578) (buf!3126 (_2!6026 lt!203565)) lt!203573) lt!204270)))

(declare-fun bs!10290 () Bool)

(assert (= bs!10290 d!42131))

(assert (=> bs!10290 m!199321))

(declare-fun m!199903 () Bool)

(assert (=> bs!10290 m!199903))

(assert (=> b!132002 d!42131))

(declare-fun d!42133 () Bool)

(declare-fun lt!204271 () tuple2!11462)

(assert (=> d!42133 (= lt!204271 (readByte!0 (_1!6025 lt!203579)))))

(assert (=> d!42133 (= (readBytePure!0 (_1!6025 lt!203579)) (tuple2!11443 (_2!6037 lt!204271) (_1!6037 lt!204271)))))

(declare-fun bs!10291 () Bool)

(assert (= bs!10291 d!42133))

(declare-fun m!199905 () Bool)

(assert (=> bs!10291 m!199905))

(assert (=> b!132002 d!42133))

(declare-fun d!42135 () Bool)

(assert (=> d!42135 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2759 (buf!3126 (_2!6026 lt!203565)))) ((_ sign_extend 32) (currentByte!5905 thiss!1634)) ((_ sign_extend 32) (currentBit!5900 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2759 (buf!3126 (_2!6026 lt!203565)))) ((_ sign_extend 32) (currentByte!5905 thiss!1634)) ((_ sign_extend 32) (currentBit!5900 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10292 () Bool)

(assert (= bs!10292 d!42135))

(declare-fun m!199907 () Bool)

(assert (=> bs!10292 m!199907))

(assert (=> b!132002 d!42135))

(declare-fun d!42137 () Bool)

(declare-fun res!109837 () Bool)

(declare-fun e!87702 () Bool)

(assert (=> d!42137 (=> (not res!109837) (not e!87702))))

(assert (=> d!42137 (= res!109837 (= (size!2759 (buf!3126 (_2!6026 lt!203578))) (size!2759 (buf!3126 (_2!6026 lt!203565)))))))

(assert (=> d!42137 (= (isPrefixOf!0 (_2!6026 lt!203578) (_2!6026 lt!203565)) e!87702)))

(declare-fun b!132307 () Bool)

(declare-fun res!109835 () Bool)

(assert (=> b!132307 (=> (not res!109835) (not e!87702))))

(assert (=> b!132307 (= res!109835 (bvsle (bitIndex!0 (size!2759 (buf!3126 (_2!6026 lt!203578))) (currentByte!5905 (_2!6026 lt!203578)) (currentBit!5900 (_2!6026 lt!203578))) (bitIndex!0 (size!2759 (buf!3126 (_2!6026 lt!203565))) (currentByte!5905 (_2!6026 lt!203565)) (currentBit!5900 (_2!6026 lt!203565)))))))

(declare-fun b!132308 () Bool)

(declare-fun e!87701 () Bool)

(assert (=> b!132308 (= e!87702 e!87701)))

(declare-fun res!109836 () Bool)

(assert (=> b!132308 (=> res!109836 e!87701)))

(assert (=> b!132308 (= res!109836 (= (size!2759 (buf!3126 (_2!6026 lt!203578))) #b00000000000000000000000000000000))))

(declare-fun b!132309 () Bool)

(assert (=> b!132309 (= e!87701 (arrayBitRangesEq!0 (buf!3126 (_2!6026 lt!203578)) (buf!3126 (_2!6026 lt!203565)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2759 (buf!3126 (_2!6026 lt!203578))) (currentByte!5905 (_2!6026 lt!203578)) (currentBit!5900 (_2!6026 lt!203578)))))))

(assert (= (and d!42137 res!109837) b!132307))

(assert (= (and b!132307 res!109835) b!132308))

(assert (= (and b!132308 (not res!109836)) b!132309))

(assert (=> b!132307 m!199283))

(assert (=> b!132307 m!199281))

(assert (=> b!132309 m!199283))

(assert (=> b!132309 m!199283))

(declare-fun m!199909 () Bool)

(assert (=> b!132309 m!199909))

(assert (=> b!132005 d!42137))

(declare-fun d!42139 () Bool)

(declare-fun lt!204272 () tuple2!11462)

(assert (=> d!42139 (= lt!204272 (readByte!0 (_1!6025 lt!203563)))))

(assert (=> d!42139 (= (readBytePure!0 (_1!6025 lt!203563)) (tuple2!11443 (_2!6037 lt!204272) (_1!6037 lt!204272)))))

(declare-fun bs!10293 () Bool)

(assert (= bs!10293 d!42139))

(declare-fun m!199911 () Bool)

(assert (=> bs!10293 m!199911))

(assert (=> b!131995 d!42139))

(declare-fun d!42141 () Bool)

(declare-fun e!87704 () Bool)

(assert (=> d!42141 e!87704))

(declare-fun res!109840 () Bool)

(assert (=> d!42141 (=> (not res!109840) (not e!87704))))

(declare-fun lt!204274 () tuple2!11444)

(assert (=> d!42141 (= res!109840 (isPrefixOf!0 (_1!6025 lt!204274) (_2!6025 lt!204274)))))

(declare-fun lt!204281 () BitStream!4782)

(assert (=> d!42141 (= lt!204274 (tuple2!11445 lt!204281 (_2!6026 lt!203578)))))

(declare-fun lt!204275 () Unit!8141)

(declare-fun lt!204278 () Unit!8141)

(assert (=> d!42141 (= lt!204275 lt!204278)))

(assert (=> d!42141 (isPrefixOf!0 lt!204281 (_2!6026 lt!203578))))

(assert (=> d!42141 (= lt!204278 (lemmaIsPrefixTransitive!0 lt!204281 (_2!6026 lt!203578) (_2!6026 lt!203578)))))

(declare-fun lt!204289 () Unit!8141)

(declare-fun lt!204286 () Unit!8141)

(assert (=> d!42141 (= lt!204289 lt!204286)))

(assert (=> d!42141 (isPrefixOf!0 lt!204281 (_2!6026 lt!203578))))

(assert (=> d!42141 (= lt!204286 (lemmaIsPrefixTransitive!0 lt!204281 thiss!1634 (_2!6026 lt!203578)))))

(declare-fun lt!204283 () Unit!8141)

(declare-fun e!87703 () Unit!8141)

(assert (=> d!42141 (= lt!204283 e!87703)))

(declare-fun c!7584 () Bool)

(assert (=> d!42141 (= c!7584 (not (= (size!2759 (buf!3126 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!204279 () Unit!8141)

(declare-fun lt!204282 () Unit!8141)

(assert (=> d!42141 (= lt!204279 lt!204282)))

(assert (=> d!42141 (isPrefixOf!0 (_2!6026 lt!203578) (_2!6026 lt!203578))))

(assert (=> d!42141 (= lt!204282 (lemmaIsPrefixRefl!0 (_2!6026 lt!203578)))))

(declare-fun lt!204285 () Unit!8141)

(declare-fun lt!204284 () Unit!8141)

(assert (=> d!42141 (= lt!204285 lt!204284)))

(assert (=> d!42141 (= lt!204284 (lemmaIsPrefixRefl!0 (_2!6026 lt!203578)))))

(declare-fun lt!204273 () Unit!8141)

(declare-fun lt!204277 () Unit!8141)

(assert (=> d!42141 (= lt!204273 lt!204277)))

(assert (=> d!42141 (isPrefixOf!0 lt!204281 lt!204281)))

(assert (=> d!42141 (= lt!204277 (lemmaIsPrefixRefl!0 lt!204281))))

(declare-fun lt!204291 () Unit!8141)

(declare-fun lt!204290 () Unit!8141)

(assert (=> d!42141 (= lt!204291 lt!204290)))

(assert (=> d!42141 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!42141 (= lt!204290 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!42141 (= lt!204281 (BitStream!4783 (buf!3126 (_2!6026 lt!203578)) (currentByte!5905 thiss!1634) (currentBit!5900 thiss!1634)))))

(assert (=> d!42141 (isPrefixOf!0 thiss!1634 (_2!6026 lt!203578))))

(assert (=> d!42141 (= (reader!0 thiss!1634 (_2!6026 lt!203578)) lt!204274)))

(declare-fun b!132310 () Bool)

(declare-fun res!109838 () Bool)

(assert (=> b!132310 (=> (not res!109838) (not e!87704))))

(assert (=> b!132310 (= res!109838 (isPrefixOf!0 (_2!6025 lt!204274) (_2!6026 lt!203578)))))

(declare-fun b!132311 () Bool)

(declare-fun Unit!8153 () Unit!8141)

(assert (=> b!132311 (= e!87703 Unit!8153)))

(declare-fun b!132312 () Bool)

(declare-fun lt!204287 () (_ BitVec 64))

(declare-fun lt!204276 () (_ BitVec 64))

(assert (=> b!132312 (= e!87704 (= (_1!6025 lt!204274) (withMovedBitIndex!0 (_2!6025 lt!204274) (bvsub lt!204276 lt!204287))))))

(assert (=> b!132312 (or (= (bvand lt!204276 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!204287 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!204276 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!204276 lt!204287) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!132312 (= lt!204287 (bitIndex!0 (size!2759 (buf!3126 (_2!6026 lt!203578))) (currentByte!5905 (_2!6026 lt!203578)) (currentBit!5900 (_2!6026 lt!203578))))))

(assert (=> b!132312 (= lt!204276 (bitIndex!0 (size!2759 (buf!3126 thiss!1634)) (currentByte!5905 thiss!1634) (currentBit!5900 thiss!1634)))))

(declare-fun b!132313 () Bool)

(declare-fun res!109839 () Bool)

(assert (=> b!132313 (=> (not res!109839) (not e!87704))))

(assert (=> b!132313 (= res!109839 (isPrefixOf!0 (_1!6025 lt!204274) thiss!1634))))

(declare-fun b!132314 () Bool)

(declare-fun lt!204280 () Unit!8141)

(assert (=> b!132314 (= e!87703 lt!204280)))

(declare-fun lt!204292 () (_ BitVec 64))

(assert (=> b!132314 (= lt!204292 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!204288 () (_ BitVec 64))

(assert (=> b!132314 (= lt!204288 (bitIndex!0 (size!2759 (buf!3126 thiss!1634)) (currentByte!5905 thiss!1634) (currentBit!5900 thiss!1634)))))

(assert (=> b!132314 (= lt!204280 (arrayBitRangesEqSymmetric!0 (buf!3126 thiss!1634) (buf!3126 (_2!6026 lt!203578)) lt!204292 lt!204288))))

(assert (=> b!132314 (arrayBitRangesEq!0 (buf!3126 (_2!6026 lt!203578)) (buf!3126 thiss!1634) lt!204292 lt!204288)))

(assert (= (and d!42141 c!7584) b!132314))

(assert (= (and d!42141 (not c!7584)) b!132311))

(assert (= (and d!42141 res!109840) b!132313))

(assert (= (and b!132313 res!109839) b!132310))

(assert (= (and b!132310 res!109838) b!132312))

(assert (=> b!132314 m!199345))

(declare-fun m!199913 () Bool)

(assert (=> b!132314 m!199913))

(declare-fun m!199915 () Bool)

(assert (=> b!132314 m!199915))

(assert (=> d!42141 m!199801))

(declare-fun m!199917 () Bool)

(assert (=> d!42141 m!199917))

(assert (=> d!42141 m!199293))

(declare-fun m!199919 () Bool)

(assert (=> d!42141 m!199919))

(assert (=> d!42141 m!199885))

(declare-fun m!199921 () Bool)

(assert (=> d!42141 m!199921))

(declare-fun m!199923 () Bool)

(assert (=> d!42141 m!199923))

(declare-fun m!199925 () Bool)

(assert (=> d!42141 m!199925))

(assert (=> d!42141 m!199791))

(assert (=> d!42141 m!199893))

(declare-fun m!199927 () Bool)

(assert (=> d!42141 m!199927))

(declare-fun m!199929 () Bool)

(assert (=> b!132310 m!199929))

(declare-fun m!199931 () Bool)

(assert (=> b!132312 m!199931))

(assert (=> b!132312 m!199283))

(assert (=> b!132312 m!199345))

(declare-fun m!199933 () Bool)

(assert (=> b!132313 m!199933))

(assert (=> b!131995 d!42141))

(declare-fun d!42143 () Bool)

(declare-fun e!87705 () Bool)

(assert (=> d!42143 e!87705))

(declare-fun res!109842 () Bool)

(assert (=> d!42143 (=> (not res!109842) (not e!87705))))

(declare-fun lt!204296 () (_ BitVec 64))

(declare-fun lt!204295 () (_ BitVec 64))

(declare-fun lt!204293 () (_ BitVec 64))

(assert (=> d!42143 (= res!109842 (= lt!204293 (bvsub lt!204296 lt!204295)))))

(assert (=> d!42143 (or (= (bvand lt!204296 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!204295 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!204296 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!204296 lt!204295) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!42143 (= lt!204295 (remainingBits!0 ((_ sign_extend 32) (size!2759 (buf!3126 (_2!6026 lt!203578)))) ((_ sign_extend 32) (currentByte!5905 (_2!6026 lt!203578))) ((_ sign_extend 32) (currentBit!5900 (_2!6026 lt!203578)))))))

(declare-fun lt!204298 () (_ BitVec 64))

(declare-fun lt!204297 () (_ BitVec 64))

(assert (=> d!42143 (= lt!204296 (bvmul lt!204298 lt!204297))))

(assert (=> d!42143 (or (= lt!204298 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!204297 (bvsdiv (bvmul lt!204298 lt!204297) lt!204298)))))

(assert (=> d!42143 (= lt!204297 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!42143 (= lt!204298 ((_ sign_extend 32) (size!2759 (buf!3126 (_2!6026 lt!203578)))))))

(assert (=> d!42143 (= lt!204293 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5905 (_2!6026 lt!203578))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5900 (_2!6026 lt!203578)))))))

(assert (=> d!42143 (invariant!0 (currentBit!5900 (_2!6026 lt!203578)) (currentByte!5905 (_2!6026 lt!203578)) (size!2759 (buf!3126 (_2!6026 lt!203578))))))

(assert (=> d!42143 (= (bitIndex!0 (size!2759 (buf!3126 (_2!6026 lt!203578))) (currentByte!5905 (_2!6026 lt!203578)) (currentBit!5900 (_2!6026 lt!203578))) lt!204293)))

(declare-fun b!132315 () Bool)

(declare-fun res!109841 () Bool)

(assert (=> b!132315 (=> (not res!109841) (not e!87705))))

(assert (=> b!132315 (= res!109841 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!204293))))

(declare-fun b!132316 () Bool)

(declare-fun lt!204294 () (_ BitVec 64))

(assert (=> b!132316 (= e!87705 (bvsle lt!204293 (bvmul lt!204294 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!132316 (or (= lt!204294 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!204294 #b0000000000000000000000000000000000000000000000000000000000001000) lt!204294)))))

(assert (=> b!132316 (= lt!204294 ((_ sign_extend 32) (size!2759 (buf!3126 (_2!6026 lt!203578)))))))

(assert (= (and d!42143 res!109842) b!132315))

(assert (= (and b!132315 res!109841) b!132316))

(assert (=> d!42143 m!199869))

(declare-fun m!199935 () Bool)

(assert (=> d!42143 m!199935))

(assert (=> b!132006 d!42143))

(declare-fun d!42145 () Bool)

(declare-fun e!87706 () Bool)

(assert (=> d!42145 e!87706))

(declare-fun res!109844 () Bool)

(assert (=> d!42145 (=> (not res!109844) (not e!87706))))

(declare-fun lt!204299 () (_ BitVec 64))

(declare-fun lt!204301 () (_ BitVec 64))

(declare-fun lt!204302 () (_ BitVec 64))

(assert (=> d!42145 (= res!109844 (= lt!204299 (bvsub lt!204302 lt!204301)))))

(assert (=> d!42145 (or (= (bvand lt!204302 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!204301 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!204302 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!204302 lt!204301) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!42145 (= lt!204301 (remainingBits!0 ((_ sign_extend 32) (size!2759 (buf!3126 thiss!1634))) ((_ sign_extend 32) (currentByte!5905 thiss!1634)) ((_ sign_extend 32) (currentBit!5900 thiss!1634))))))

(declare-fun lt!204304 () (_ BitVec 64))

(declare-fun lt!204303 () (_ BitVec 64))

(assert (=> d!42145 (= lt!204302 (bvmul lt!204304 lt!204303))))

(assert (=> d!42145 (or (= lt!204304 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!204303 (bvsdiv (bvmul lt!204304 lt!204303) lt!204304)))))

(assert (=> d!42145 (= lt!204303 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!42145 (= lt!204304 ((_ sign_extend 32) (size!2759 (buf!3126 thiss!1634))))))

(assert (=> d!42145 (= lt!204299 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5905 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5900 thiss!1634))))))

(assert (=> d!42145 (invariant!0 (currentBit!5900 thiss!1634) (currentByte!5905 thiss!1634) (size!2759 (buf!3126 thiss!1634)))))

(assert (=> d!42145 (= (bitIndex!0 (size!2759 (buf!3126 thiss!1634)) (currentByte!5905 thiss!1634) (currentBit!5900 thiss!1634)) lt!204299)))

(declare-fun b!132317 () Bool)

(declare-fun res!109843 () Bool)

(assert (=> b!132317 (=> (not res!109843) (not e!87706))))

(assert (=> b!132317 (= res!109843 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!204299))))

(declare-fun b!132318 () Bool)

(declare-fun lt!204300 () (_ BitVec 64))

(assert (=> b!132318 (= e!87706 (bvsle lt!204299 (bvmul lt!204300 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!132318 (or (= lt!204300 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!204300 #b0000000000000000000000000000000000000000000000000000000000001000) lt!204300)))))

(assert (=> b!132318 (= lt!204300 ((_ sign_extend 32) (size!2759 (buf!3126 thiss!1634))))))

(assert (= (and d!42145 res!109844) b!132317))

(assert (= (and b!132317 res!109843) b!132318))

(assert (=> d!42145 m!199813))

(assert (=> d!42145 m!199299))

(assert (=> b!132006 d!42145))

(declare-fun d!42147 () Bool)

(assert (=> d!42147 (= (array_inv!2548 (buf!3126 thiss!1634)) (bvsge (size!2759 (buf!3126 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!132004 d!42147))

(declare-fun d!42149 () Bool)

(assert (=> d!42149 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2759 (buf!3126 (_1!6025 lt!203561)))) ((_ sign_extend 32) (currentByte!5905 (_1!6025 lt!203561))) ((_ sign_extend 32) (currentBit!5900 (_1!6025 lt!203561))) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))) (bvsle ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2759 (buf!3126 (_1!6025 lt!203561)))) ((_ sign_extend 32) (currentByte!5905 (_1!6025 lt!203561))) ((_ sign_extend 32) (currentBit!5900 (_1!6025 lt!203561)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10294 () Bool)

(assert (= bs!10294 d!42149))

(declare-fun m!199937 () Bool)

(assert (=> bs!10294 m!199937))

(assert (=> b!131994 d!42149))

(declare-fun d!42151 () Bool)

(declare-fun e!87707 () Bool)

(assert (=> d!42151 e!87707))

(declare-fun res!109846 () Bool)

(assert (=> d!42151 (=> (not res!109846) (not e!87707))))

(declare-fun lt!204308 () (_ BitVec 64))

(declare-fun lt!204307 () (_ BitVec 64))

(declare-fun lt!204305 () (_ BitVec 64))

(assert (=> d!42151 (= res!109846 (= lt!204305 (bvsub lt!204308 lt!204307)))))

(assert (=> d!42151 (or (= (bvand lt!204308 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!204307 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!204308 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!204308 lt!204307) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!42151 (= lt!204307 (remainingBits!0 ((_ sign_extend 32) (size!2759 (buf!3126 (_2!6026 lt!203565)))) ((_ sign_extend 32) (currentByte!5905 (_2!6026 lt!203565))) ((_ sign_extend 32) (currentBit!5900 (_2!6026 lt!203565)))))))

(declare-fun lt!204310 () (_ BitVec 64))

(declare-fun lt!204309 () (_ BitVec 64))

(assert (=> d!42151 (= lt!204308 (bvmul lt!204310 lt!204309))))

(assert (=> d!42151 (or (= lt!204310 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!204309 (bvsdiv (bvmul lt!204310 lt!204309) lt!204310)))))

(assert (=> d!42151 (= lt!204309 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!42151 (= lt!204310 ((_ sign_extend 32) (size!2759 (buf!3126 (_2!6026 lt!203565)))))))

(assert (=> d!42151 (= lt!204305 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5905 (_2!6026 lt!203565))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5900 (_2!6026 lt!203565)))))))

(assert (=> d!42151 (invariant!0 (currentBit!5900 (_2!6026 lt!203565)) (currentByte!5905 (_2!6026 lt!203565)) (size!2759 (buf!3126 (_2!6026 lt!203565))))))

(assert (=> d!42151 (= (bitIndex!0 (size!2759 (buf!3126 (_2!6026 lt!203565))) (currentByte!5905 (_2!6026 lt!203565)) (currentBit!5900 (_2!6026 lt!203565))) lt!204305)))

(declare-fun b!132319 () Bool)

(declare-fun res!109845 () Bool)

(assert (=> b!132319 (=> (not res!109845) (not e!87707))))

(assert (=> b!132319 (= res!109845 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!204305))))

(declare-fun b!132320 () Bool)

(declare-fun lt!204306 () (_ BitVec 64))

(assert (=> b!132320 (= e!87707 (bvsle lt!204305 (bvmul lt!204306 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!132320 (or (= lt!204306 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!204306 #b0000000000000000000000000000000000000000000000000000000000001000) lt!204306)))))

(assert (=> b!132320 (= lt!204306 ((_ sign_extend 32) (size!2759 (buf!3126 (_2!6026 lt!203565)))))))

(assert (= (and d!42151 res!109846) b!132319))

(assert (= (and b!132319 res!109845) b!132320))

(declare-fun m!199939 () Bool)

(assert (=> d!42151 m!199939))

(declare-fun m!199941 () Bool)

(assert (=> d!42151 m!199941))

(assert (=> b!131997 d!42151))

(assert (=> b!131997 d!42143))

(declare-fun d!42153 () Bool)

(declare-fun res!109851 () Bool)

(declare-fun e!87712 () Bool)

(assert (=> d!42153 (=> res!109851 e!87712)))

(assert (=> d!42153 (= res!109851 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!42153 (= (arrayRangesEq!162 arr!237 (_2!6027 lt!203570) #b00000000000000000000000000000000 to!404) e!87712)))

(declare-fun b!132325 () Bool)

(declare-fun e!87713 () Bool)

(assert (=> b!132325 (= e!87712 e!87713)))

(declare-fun res!109852 () Bool)

(assert (=> b!132325 (=> (not res!109852) (not e!87713))))

(assert (=> b!132325 (= res!109852 (= (select (arr!3388 arr!237) #b00000000000000000000000000000000) (select (arr!3388 (_2!6027 lt!203570)) #b00000000000000000000000000000000)))))

(declare-fun b!132326 () Bool)

(assert (=> b!132326 (= e!87713 (arrayRangesEq!162 arr!237 (_2!6027 lt!203570) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!42153 (not res!109851)) b!132325))

(assert (= (and b!132325 res!109852) b!132326))

(declare-fun m!199943 () Bool)

(assert (=> b!132325 m!199943))

(declare-fun m!199945 () Bool)

(assert (=> b!132325 m!199945))

(declare-fun m!199947 () Bool)

(assert (=> b!132326 m!199947))

(assert (=> b!131998 d!42153))

(declare-fun d!42155 () Bool)

(assert (=> d!42155 (= (invariant!0 (currentBit!5900 thiss!1634) (currentByte!5905 thiss!1634) (size!2759 (buf!3126 (_2!6026 lt!203578)))) (and (bvsge (currentBit!5900 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!5900 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!5905 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!5905 thiss!1634) (size!2759 (buf!3126 (_2!6026 lt!203578)))) (and (= (currentBit!5900 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!5905 thiss!1634) (size!2759 (buf!3126 (_2!6026 lt!203578))))))))))

(assert (=> b!131996 d!42155))

(declare-fun lt!204311 () tuple3!500)

(declare-fun d!42157 () Bool)

(assert (=> d!42157 (= lt!204311 (readByteArrayLoop!0 (_1!6025 lt!203579) arr!237 from!447 to!404))))

(assert (=> d!42157 (= (readByteArrayLoopPure!0 (_1!6025 lt!203579) arr!237 from!447 to!404) (tuple2!11449 (_2!6036 lt!204311) (_3!305 lt!204311)))))

(declare-fun bs!10295 () Bool)

(assert (= bs!10295 d!42157))

(declare-fun m!199949 () Bool)

(assert (=> bs!10295 m!199949))

(assert (=> b!132007 d!42157))

(check-sat (not d!42114) (not b!132304) (not b!132251) (not d!42119) (not b!132272) (not d!42149) (not b!132299) (not b!132249) (not d!42135) (not b!132298) (not b!132296) (not d!42139) (not d!42131) (not d!42117) (not d!42112) (not b!132273) (not b!132309) (not b!132275) (not b!132326) (not b!132307) (not b!132274) (not d!42100) (not d!42088) (not d!42123) (not b!132306) (not d!42143) (not b!132289) (not b!132305) (not b!132260) (not d!42121) (not b!132297) (not b!132258) (not b!132247) (not d!42086) (not b!132312) (not d!42106) (not b!132310) (not d!42102) (not b!132250) (not d!42145) (not d!42151) (not d!42104) (not b!132301) (not d!42090) (not d!42110) (not b!132313) (not d!42129) (not d!42096) (not d!42141) (not d!42108) (not b!132314) (not b!132271) (not d!42157) (not d!42084) (not d!42125) (not b!132302) (not d!42133))
(check-sat)
