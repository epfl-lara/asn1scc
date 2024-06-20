; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26356 () Bool)

(assert start!26356)

(declare-fun b!134886 () Bool)

(declare-fun e!89513 () Bool)

(assert (=> b!134886 (= e!89513 true)))

(declare-datatypes ((array!6156 0))(
  ( (array!6157 (arr!3451 (Array (_ BitVec 32) (_ BitVec 8))) (size!2786 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4836 0))(
  ( (BitStream!4837 (buf!3179 array!6156) (currentByte!5976 (_ BitVec 32)) (currentBit!5971 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!11684 0))(
  ( (tuple2!11685 (_1!6158 BitStream!4836) (_2!6158 array!6156)) )
))
(declare-fun lt!209292 () tuple2!11684)

(declare-fun lt!209289 () tuple2!11684)

(declare-fun to!404 () (_ BitVec 32))

(declare-fun arrayRangesEq!189 (array!6156 array!6156 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!134886 (arrayRangesEq!189 (_2!6158 lt!209292) (_2!6158 lt!209289) #b00000000000000000000000000000000 to!404)))

(declare-datatypes ((Unit!8410 0))(
  ( (Unit!8411) )
))
(declare-fun lt!209271 () Unit!8410)

(declare-fun arrayRangesEqSymmetricLemma!2 (array!6156 array!6156 (_ BitVec 32) (_ BitVec 32)) Unit!8410)

(assert (=> b!134886 (= lt!209271 (arrayRangesEqSymmetricLemma!2 (_2!6158 lt!209289) (_2!6158 lt!209292) #b00000000000000000000000000000000 to!404))))

(declare-datatypes ((tuple2!11686 0))(
  ( (tuple2!11687 (_1!6159 BitStream!4836) (_2!6159 BitStream!4836)) )
))
(declare-fun lt!209288 () tuple2!11686)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun b!134887 () Bool)

(declare-fun arr!237 () array!6156)

(declare-datatypes ((tuple2!11688 0))(
  ( (tuple2!11689 (_1!6160 BitStream!4836) (_2!6160 (_ BitVec 8))) )
))
(declare-fun lt!209283 () tuple2!11688)

(declare-fun e!89511 () Bool)

(assert (=> b!134887 (= e!89511 (and (= (_2!6160 lt!209283) (select (arr!3451 arr!237) from!447)) (= (_1!6160 lt!209283) (_2!6159 lt!209288))))))

(declare-fun readBytePure!0 (BitStream!4836) tuple2!11688)

(assert (=> b!134887 (= lt!209283 (readBytePure!0 (_1!6159 lt!209288)))))

(declare-fun thiss!1634 () BitStream!4836)

(declare-datatypes ((tuple2!11690 0))(
  ( (tuple2!11691 (_1!6161 Unit!8410) (_2!6161 BitStream!4836)) )
))
(declare-fun lt!209273 () tuple2!11690)

(declare-fun reader!0 (BitStream!4836 BitStream!4836) tuple2!11686)

(assert (=> b!134887 (= lt!209288 (reader!0 thiss!1634 (_2!6161 lt!209273)))))

(declare-fun b!134888 () Bool)

(declare-fun e!89515 () Bool)

(declare-fun e!89512 () Bool)

(assert (=> b!134888 (= e!89515 e!89512)))

(declare-fun res!112127 () Bool)

(assert (=> b!134888 (=> (not res!112127) (not e!89512))))

(declare-fun lt!209269 () tuple2!11690)

(declare-fun lt!209281 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!134888 (= res!112127 (= (bitIndex!0 (size!2786 (buf!3179 (_2!6161 lt!209269))) (currentByte!5976 (_2!6161 lt!209269)) (currentBit!5971 (_2!6161 lt!209269))) (bvadd (bitIndex!0 (size!2786 (buf!3179 (_2!6161 lt!209273))) (currentByte!5976 (_2!6161 lt!209273)) (currentBit!5971 (_2!6161 lt!209273))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!209281))))))

(assert (=> b!134888 (= lt!209281 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!134890 () Bool)

(declare-fun e!89516 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!134890 (= e!89516 (invariant!0 (currentBit!5971 thiss!1634) (currentByte!5976 thiss!1634) (size!2786 (buf!3179 (_2!6161 lt!209273)))))))

(declare-fun b!134891 () Bool)

(declare-fun res!112135 () Bool)

(declare-fun e!89509 () Bool)

(assert (=> b!134891 (=> (not res!112135) (not e!89509))))

(assert (=> b!134891 (= res!112135 (bvslt from!447 to!404))))

(declare-fun b!134892 () Bool)

(declare-fun res!112129 () Bool)

(assert (=> b!134892 (=> (not res!112129) (not e!89511))))

(assert (=> b!134892 (= res!112129 (= (bitIndex!0 (size!2786 (buf!3179 (_2!6161 lt!209273))) (currentByte!5976 (_2!6161 lt!209273)) (currentBit!5971 (_2!6161 lt!209273))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2786 (buf!3179 thiss!1634)) (currentByte!5976 thiss!1634) (currentBit!5971 thiss!1634)))))))

(declare-fun b!134893 () Bool)

(declare-fun res!112139 () Bool)

(assert (=> b!134893 (=> (not res!112139) (not e!89512))))

(declare-fun isPrefixOf!0 (BitStream!4836 BitStream!4836) Bool)

(assert (=> b!134893 (= res!112139 (isPrefixOf!0 (_2!6161 lt!209273) (_2!6161 lt!209269)))))

(declare-fun b!134894 () Bool)

(declare-fun e!89514 () Bool)

(assert (=> b!134894 (= e!89512 (not e!89514))))

(declare-fun res!112136 () Bool)

(assert (=> b!134894 (=> res!112136 e!89514)))

(declare-fun lt!209285 () tuple2!11684)

(declare-fun lt!209272 () tuple2!11686)

(assert (=> b!134894 (= res!112136 (or (not (= (size!2786 (_2!6158 lt!209285)) (size!2786 arr!237))) (not (= (_1!6158 lt!209285) (_2!6159 lt!209272)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4836 array!6156 (_ BitVec 32) (_ BitVec 32)) tuple2!11684)

(assert (=> b!134894 (= lt!209285 (readByteArrayLoopPure!0 (_1!6159 lt!209272) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!134894 (validate_offset_bits!1 ((_ sign_extend 32) (size!2786 (buf!3179 (_2!6161 lt!209269)))) ((_ sign_extend 32) (currentByte!5976 (_2!6161 lt!209273))) ((_ sign_extend 32) (currentBit!5971 (_2!6161 lt!209273))) lt!209281)))

(declare-fun lt!209284 () Unit!8410)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4836 array!6156 (_ BitVec 64)) Unit!8410)

(assert (=> b!134894 (= lt!209284 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6161 lt!209273) (buf!3179 (_2!6161 lt!209269)) lt!209281))))

(assert (=> b!134894 (= lt!209272 (reader!0 (_2!6161 lt!209273) (_2!6161 lt!209269)))))

(declare-fun b!134895 () Bool)

(declare-fun res!112137 () Bool)

(assert (=> b!134895 (=> (not res!112137) (not e!89509))))

(assert (=> b!134895 (= res!112137 (invariant!0 (currentBit!5971 thiss!1634) (currentByte!5976 thiss!1634) (size!2786 (buf!3179 thiss!1634))))))

(declare-fun b!134896 () Bool)

(assert (=> b!134896 (= e!89509 (not e!89513))))

(declare-fun res!112140 () Bool)

(assert (=> b!134896 (=> res!112140 e!89513)))

(assert (=> b!134896 (= res!112140 (not (arrayRangesEq!189 (_2!6158 lt!209289) (_2!6158 lt!209292) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!209277 () tuple2!11684)

(assert (=> b!134896 (arrayRangesEq!189 (_2!6158 lt!209289) (_2!6158 lt!209277) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!209274 () tuple2!11686)

(declare-fun lt!209280 () Unit!8410)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!4836 array!6156 (_ BitVec 32) (_ BitVec 32)) Unit!8410)

(assert (=> b!134896 (= lt!209280 (readByteArrayLoopArrayPrefixLemma!0 (_1!6159 lt!209274) arr!237 from!447 to!404))))

(declare-fun lt!209293 () array!6156)

(declare-fun withMovedByteIndex!0 (BitStream!4836 (_ BitVec 32)) BitStream!4836)

(assert (=> b!134896 (= lt!209277 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6159 lt!209274) #b00000000000000000000000000000001) lt!209293 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!209290 () tuple2!11686)

(assert (=> b!134896 (= lt!209292 (readByteArrayLoopPure!0 (_1!6159 lt!209290) lt!209293 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!209287 () tuple2!11688)

(assert (=> b!134896 (= lt!209293 (array!6157 (store (arr!3451 arr!237) from!447 (_2!6160 lt!209287)) (size!2786 arr!237)))))

(declare-fun lt!209276 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!134896 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2786 (buf!3179 (_2!6161 lt!209269)))) ((_ sign_extend 32) (currentByte!5976 (_2!6161 lt!209273))) ((_ sign_extend 32) (currentBit!5971 (_2!6161 lt!209273))) lt!209276)))

(declare-fun lt!209270 () Unit!8410)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4836 array!6156 (_ BitVec 32)) Unit!8410)

(assert (=> b!134896 (= lt!209270 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6161 lt!209273) (buf!3179 (_2!6161 lt!209269)) lt!209276))))

(assert (=> b!134896 (= (_1!6158 lt!209289) (_2!6159 lt!209274))))

(assert (=> b!134896 (= lt!209289 (readByteArrayLoopPure!0 (_1!6159 lt!209274) arr!237 from!447 to!404))))

(assert (=> b!134896 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2786 (buf!3179 (_2!6161 lt!209269)))) ((_ sign_extend 32) (currentByte!5976 thiss!1634)) ((_ sign_extend 32) (currentBit!5971 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!209278 () Unit!8410)

(assert (=> b!134896 (= lt!209278 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3179 (_2!6161 lt!209269)) (bvsub to!404 from!447)))))

(assert (=> b!134896 (= (_2!6160 lt!209287) (select (arr!3451 arr!237) from!447))))

(assert (=> b!134896 (= lt!209287 (readBytePure!0 (_1!6159 lt!209274)))))

(assert (=> b!134896 (= lt!209290 (reader!0 (_2!6161 lt!209273) (_2!6161 lt!209269)))))

(assert (=> b!134896 (= lt!209274 (reader!0 thiss!1634 (_2!6161 lt!209269)))))

(declare-fun e!89517 () Bool)

(assert (=> b!134896 e!89517))

(declare-fun res!112138 () Bool)

(assert (=> b!134896 (=> (not res!112138) (not e!89517))))

(declare-fun lt!209282 () tuple2!11688)

(declare-fun lt!209291 () tuple2!11688)

(assert (=> b!134896 (= res!112138 (= (bitIndex!0 (size!2786 (buf!3179 (_1!6160 lt!209282))) (currentByte!5976 (_1!6160 lt!209282)) (currentBit!5971 (_1!6160 lt!209282))) (bitIndex!0 (size!2786 (buf!3179 (_1!6160 lt!209291))) (currentByte!5976 (_1!6160 lt!209291)) (currentBit!5971 (_1!6160 lt!209291)))))))

(declare-fun lt!209268 () Unit!8410)

(declare-fun lt!209279 () BitStream!4836)

(declare-fun readBytePrefixLemma!0 (BitStream!4836 BitStream!4836) Unit!8410)

(assert (=> b!134896 (= lt!209268 (readBytePrefixLemma!0 lt!209279 (_2!6161 lt!209269)))))

(assert (=> b!134896 (= lt!209291 (readBytePure!0 (BitStream!4837 (buf!3179 (_2!6161 lt!209269)) (currentByte!5976 thiss!1634) (currentBit!5971 thiss!1634))))))

(assert (=> b!134896 (= lt!209282 (readBytePure!0 lt!209279))))

(assert (=> b!134896 (= lt!209279 (BitStream!4837 (buf!3179 (_2!6161 lt!209273)) (currentByte!5976 thiss!1634) (currentBit!5971 thiss!1634)))))

(assert (=> b!134896 e!89516))

(declare-fun res!112134 () Bool)

(assert (=> b!134896 (=> (not res!112134) (not e!89516))))

(assert (=> b!134896 (= res!112134 (isPrefixOf!0 thiss!1634 (_2!6161 lt!209269)))))

(declare-fun lt!209275 () Unit!8410)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4836 BitStream!4836 BitStream!4836) Unit!8410)

(assert (=> b!134896 (= lt!209275 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6161 lt!209273) (_2!6161 lt!209269)))))

(assert (=> b!134896 e!89515))

(declare-fun res!112133 () Bool)

(assert (=> b!134896 (=> (not res!112133) (not e!89515))))

(assert (=> b!134896 (= res!112133 (= (size!2786 (buf!3179 (_2!6161 lt!209273))) (size!2786 (buf!3179 (_2!6161 lt!209269)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4836 array!6156 (_ BitVec 32) (_ BitVec 32)) tuple2!11690)

(assert (=> b!134896 (= lt!209269 (appendByteArrayLoop!0 (_2!6161 lt!209273) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!134896 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2786 (buf!3179 (_2!6161 lt!209273)))) ((_ sign_extend 32) (currentByte!5976 (_2!6161 lt!209273))) ((_ sign_extend 32) (currentBit!5971 (_2!6161 lt!209273))) lt!209276)))

(assert (=> b!134896 (= lt!209276 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!209286 () Unit!8410)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4836 BitStream!4836 (_ BitVec 64) (_ BitVec 32)) Unit!8410)

(assert (=> b!134896 (= lt!209286 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6161 lt!209273) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!134896 e!89511))

(declare-fun res!112130 () Bool)

(assert (=> b!134896 (=> (not res!112130) (not e!89511))))

(assert (=> b!134896 (= res!112130 (= (size!2786 (buf!3179 thiss!1634)) (size!2786 (buf!3179 (_2!6161 lt!209273)))))))

(declare-fun appendByte!0 (BitStream!4836 (_ BitVec 8)) tuple2!11690)

(assert (=> b!134896 (= lt!209273 (appendByte!0 thiss!1634 (select (arr!3451 arr!237) from!447)))))

(declare-fun b!134897 () Bool)

(declare-fun res!112131 () Bool)

(assert (=> b!134897 (=> (not res!112131) (not e!89511))))

(assert (=> b!134897 (= res!112131 (isPrefixOf!0 thiss!1634 (_2!6161 lt!209273)))))

(declare-fun b!134898 () Bool)

(assert (=> b!134898 (= e!89514 (not (arrayRangesEq!189 arr!237 (_2!6158 lt!209285) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!134899 () Bool)

(declare-fun res!112132 () Bool)

(assert (=> b!134899 (=> (not res!112132) (not e!89509))))

(assert (=> b!134899 (= res!112132 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2786 (buf!3179 thiss!1634))) ((_ sign_extend 32) (currentByte!5976 thiss!1634)) ((_ sign_extend 32) (currentBit!5971 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!134900 () Bool)

(declare-fun e!89507 () Bool)

(declare-fun array_inv!2575 (array!6156) Bool)

(assert (=> b!134900 (= e!89507 (array_inv!2575 (buf!3179 thiss!1634)))))

(declare-fun res!112128 () Bool)

(assert (=> start!26356 (=> (not res!112128) (not e!89509))))

(assert (=> start!26356 (= res!112128 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2786 arr!237))))))

(assert (=> start!26356 e!89509))

(assert (=> start!26356 true))

(assert (=> start!26356 (array_inv!2575 arr!237)))

(declare-fun inv!12 (BitStream!4836) Bool)

(assert (=> start!26356 (and (inv!12 thiss!1634) e!89507)))

(declare-fun b!134889 () Bool)

(assert (=> b!134889 (= e!89517 (= (_2!6160 lt!209282) (_2!6160 lt!209291)))))

(assert (= (and start!26356 res!112128) b!134899))

(assert (= (and b!134899 res!112132) b!134891))

(assert (= (and b!134891 res!112135) b!134895))

(assert (= (and b!134895 res!112137) b!134896))

(assert (= (and b!134896 res!112130) b!134892))

(assert (= (and b!134892 res!112129) b!134897))

(assert (= (and b!134897 res!112131) b!134887))

(assert (= (and b!134896 res!112133) b!134888))

(assert (= (and b!134888 res!112127) b!134893))

(assert (= (and b!134893 res!112139) b!134894))

(assert (= (and b!134894 (not res!112136)) b!134898))

(assert (= (and b!134896 res!112134) b!134890))

(assert (= (and b!134896 res!112138) b!134889))

(assert (= (and b!134896 (not res!112140)) b!134886))

(assert (= start!26356 b!134900))

(declare-fun m!205491 () Bool)

(assert (=> b!134893 m!205491))

(declare-fun m!205493 () Bool)

(assert (=> b!134898 m!205493))

(declare-fun m!205495 () Bool)

(assert (=> b!134894 m!205495))

(declare-fun m!205497 () Bool)

(assert (=> b!134894 m!205497))

(declare-fun m!205499 () Bool)

(assert (=> b!134894 m!205499))

(declare-fun m!205501 () Bool)

(assert (=> b!134894 m!205501))

(declare-fun m!205503 () Bool)

(assert (=> b!134887 m!205503))

(declare-fun m!205505 () Bool)

(assert (=> b!134887 m!205505))

(declare-fun m!205507 () Bool)

(assert (=> b!134887 m!205507))

(declare-fun m!205509 () Bool)

(assert (=> b!134895 m!205509))

(declare-fun m!205511 () Bool)

(assert (=> b!134890 m!205511))

(declare-fun m!205513 () Bool)

(assert (=> b!134899 m!205513))

(declare-fun m!205515 () Bool)

(assert (=> b!134892 m!205515))

(declare-fun m!205517 () Bool)

(assert (=> b!134892 m!205517))

(declare-fun m!205519 () Bool)

(assert (=> b!134888 m!205519))

(assert (=> b!134888 m!205515))

(declare-fun m!205521 () Bool)

(assert (=> b!134897 m!205521))

(declare-fun m!205523 () Bool)

(assert (=> b!134886 m!205523))

(declare-fun m!205525 () Bool)

(assert (=> b!134886 m!205525))

(declare-fun m!205527 () Bool)

(assert (=> start!26356 m!205527))

(declare-fun m!205529 () Bool)

(assert (=> start!26356 m!205529))

(declare-fun m!205531 () Bool)

(assert (=> b!134900 m!205531))

(declare-fun m!205533 () Bool)

(assert (=> b!134896 m!205533))

(declare-fun m!205535 () Bool)

(assert (=> b!134896 m!205535))

(declare-fun m!205537 () Bool)

(assert (=> b!134896 m!205537))

(declare-fun m!205539 () Bool)

(assert (=> b!134896 m!205539))

(assert (=> b!134896 m!205501))

(declare-fun m!205541 () Bool)

(assert (=> b!134896 m!205541))

(declare-fun m!205543 () Bool)

(assert (=> b!134896 m!205543))

(declare-fun m!205545 () Bool)

(assert (=> b!134896 m!205545))

(declare-fun m!205547 () Bool)

(assert (=> b!134896 m!205547))

(declare-fun m!205549 () Bool)

(assert (=> b!134896 m!205549))

(declare-fun m!205551 () Bool)

(assert (=> b!134896 m!205551))

(declare-fun m!205553 () Bool)

(assert (=> b!134896 m!205553))

(declare-fun m!205555 () Bool)

(assert (=> b!134896 m!205555))

(declare-fun m!205557 () Bool)

(assert (=> b!134896 m!205557))

(declare-fun m!205559 () Bool)

(assert (=> b!134896 m!205559))

(declare-fun m!205561 () Bool)

(assert (=> b!134896 m!205561))

(declare-fun m!205563 () Bool)

(assert (=> b!134896 m!205563))

(declare-fun m!205565 () Bool)

(assert (=> b!134896 m!205565))

(declare-fun m!205567 () Bool)

(assert (=> b!134896 m!205567))

(declare-fun m!205569 () Bool)

(assert (=> b!134896 m!205569))

(declare-fun m!205571 () Bool)

(assert (=> b!134896 m!205571))

(declare-fun m!205573 () Bool)

(assert (=> b!134896 m!205573))

(declare-fun m!205575 () Bool)

(assert (=> b!134896 m!205575))

(declare-fun m!205577 () Bool)

(assert (=> b!134896 m!205577))

(declare-fun m!205579 () Bool)

(assert (=> b!134896 m!205579))

(assert (=> b!134896 m!205503))

(declare-fun m!205581 () Bool)

(assert (=> b!134896 m!205581))

(assert (=> b!134896 m!205541))

(assert (=> b!134896 m!205503))

(check-sat (not b!134895) (not b!134898) (not b!134890) (not b!134888) (not b!134900) (not b!134892) (not b!134896) (not b!134894) (not start!26356) (not b!134886) (not b!134887) (not b!134893) (not b!134897) (not b!134899))
