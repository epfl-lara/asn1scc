; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25934 () Bool)

(assert start!25934)

(declare-fun b!132455 () Bool)

(declare-fun e!87815 () Bool)

(declare-fun e!87819 () Bool)

(assert (=> b!132455 (= e!87815 e!87819)))

(declare-fun res!109975 () Bool)

(assert (=> b!132455 (=> (not res!109975) (not e!87819))))

(declare-datatypes ((array!6104 0))(
  ( (array!6105 (arr!3398 (Array (_ BitVec 32) (_ BitVec 8))) (size!2763 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4790 0))(
  ( (BitStream!4791 (buf!3136 array!6104) (currentByte!5921 (_ BitVec 32)) (currentBit!5916 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!8158 0))(
  ( (Unit!8159) )
))
(declare-datatypes ((tuple2!11480 0))(
  ( (tuple2!11481 (_1!6046 Unit!8158) (_2!6046 BitStream!4790)) )
))
(declare-fun lt!204500 () tuple2!11480)

(declare-fun lt!204504 () (_ BitVec 64))

(declare-fun lt!204513 () tuple2!11480)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!132455 (= res!109975 (= (bitIndex!0 (size!2763 (buf!3136 (_2!6046 lt!204513))) (currentByte!5921 (_2!6046 lt!204513)) (currentBit!5916 (_2!6046 lt!204513))) (bvadd (bitIndex!0 (size!2763 (buf!3136 (_2!6046 lt!204500))) (currentByte!5921 (_2!6046 lt!204500)) (currentBit!5916 (_2!6046 lt!204500))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!204504))))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun from!447 () (_ BitVec 32))

(assert (=> b!132455 (= lt!204504 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!132456 () Bool)

(declare-fun res!109979 () Bool)

(declare-fun e!87811 () Bool)

(assert (=> b!132456 (=> (not res!109979) (not e!87811))))

(declare-fun thiss!1634 () BitStream!4790)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!132456 (= res!109979 (invariant!0 (currentBit!5916 thiss!1634) (currentByte!5921 thiss!1634) (size!2763 (buf!3136 thiss!1634))))))

(declare-fun b!132458 () Bool)

(declare-fun e!87818 () Bool)

(declare-datatypes ((tuple2!11482 0))(
  ( (tuple2!11483 (_1!6047 BitStream!4790) (_2!6047 (_ BitVec 8))) )
))
(declare-fun lt!204518 () tuple2!11482)

(declare-fun lt!204515 () tuple2!11482)

(assert (=> b!132458 (= e!87818 (= (_2!6047 lt!204518) (_2!6047 lt!204515)))))

(declare-fun e!87821 () Bool)

(declare-fun b!132459 () Bool)

(declare-datatypes ((tuple2!11484 0))(
  ( (tuple2!11485 (_1!6048 BitStream!4790) (_2!6048 BitStream!4790)) )
))
(declare-fun lt!204501 () tuple2!11484)

(declare-fun arr!237 () array!6104)

(declare-datatypes ((tuple2!11486 0))(
  ( (tuple2!11487 (_1!6049 BitStream!4790) (_2!6049 array!6104)) )
))
(declare-fun readByteArrayLoopPure!0 (BitStream!4790 array!6104 (_ BitVec 32) (_ BitVec 32)) tuple2!11486)

(assert (=> b!132459 (= e!87821 (= (_1!6049 (readByteArrayLoopPure!0 (_1!6048 lt!204501) arr!237 from!447 to!404)) (_2!6048 lt!204501)))))

(declare-fun b!132460 () Bool)

(declare-fun res!109978 () Bool)

(declare-fun e!87820 () Bool)

(assert (=> b!132460 (=> (not res!109978) (not e!87820))))

(assert (=> b!132460 (= res!109978 (= (bitIndex!0 (size!2763 (buf!3136 (_2!6046 lt!204500))) (currentByte!5921 (_2!6046 lt!204500)) (currentBit!5916 (_2!6046 lt!204500))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2763 (buf!3136 thiss!1634)) (currentByte!5921 thiss!1634) (currentBit!5916 thiss!1634)))))))

(declare-fun b!132461 () Bool)

(declare-fun res!109976 () Bool)

(assert (=> b!132461 (=> (not res!109976) (not e!87811))))

(assert (=> b!132461 (= res!109976 (bvslt from!447 to!404))))

(declare-fun b!132462 () Bool)

(declare-fun e!87817 () Bool)

(assert (=> b!132462 (= e!87817 (invariant!0 (currentBit!5916 thiss!1634) (currentByte!5921 thiss!1634) (size!2763 (buf!3136 (_2!6046 lt!204500)))))))

(declare-fun b!132463 () Bool)

(declare-fun e!87816 () Bool)

(assert (=> b!132463 (= e!87819 (not e!87816))))

(declare-fun res!109987 () Bool)

(assert (=> b!132463 (=> res!109987 e!87816)))

(declare-fun lt!204498 () tuple2!11484)

(declare-fun lt!204503 () tuple2!11486)

(assert (=> b!132463 (= res!109987 (or (not (= (size!2763 (_2!6049 lt!204503)) (size!2763 arr!237))) (not (= (_1!6049 lt!204503) (_2!6048 lt!204498)))))))

(assert (=> b!132463 (= lt!204503 (readByteArrayLoopPure!0 (_1!6048 lt!204498) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!132463 (validate_offset_bits!1 ((_ sign_extend 32) (size!2763 (buf!3136 (_2!6046 lt!204513)))) ((_ sign_extend 32) (currentByte!5921 (_2!6046 lt!204500))) ((_ sign_extend 32) (currentBit!5916 (_2!6046 lt!204500))) lt!204504)))

(declare-fun lt!204517 () Unit!8158)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4790 array!6104 (_ BitVec 64)) Unit!8158)

(assert (=> b!132463 (= lt!204517 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6046 lt!204500) (buf!3136 (_2!6046 lt!204513)) lt!204504))))

(declare-fun reader!0 (BitStream!4790 BitStream!4790) tuple2!11484)

(assert (=> b!132463 (= lt!204498 (reader!0 (_2!6046 lt!204500) (_2!6046 lt!204513)))))

(declare-fun b!132464 () Bool)

(declare-fun e!87812 () Bool)

(assert (=> b!132464 (= e!87811 (not e!87812))))

(declare-fun res!109977 () Bool)

(assert (=> b!132464 (=> res!109977 e!87812)))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!132464 (= res!109977 (not (validate_offset_bytes!0 ((_ sign_extend 32) (size!2763 (buf!3136 (_1!6048 lt!204501)))) ((_ sign_extend 32) (currentByte!5921 (_1!6048 lt!204501))) ((_ sign_extend 32) (currentBit!5916 (_1!6048 lt!204501))) (bvsub to!404 from!447))))))

(declare-fun lt!204506 () array!6104)

(declare-fun lt!204505 () tuple2!11484)

(declare-fun lt!204507 () tuple2!11486)

(assert (=> b!132464 (= lt!204507 (readByteArrayLoopPure!0 (_1!6048 lt!204505) lt!204506 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!204511 () tuple2!11482)

(assert (=> b!132464 (= lt!204506 (array!6105 (store (arr!3398 arr!237) from!447 (_2!6047 lt!204511)) (size!2763 arr!237)))))

(declare-fun lt!204496 () (_ BitVec 32))

(assert (=> b!132464 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2763 (buf!3136 (_2!6046 lt!204513)))) ((_ sign_extend 32) (currentByte!5921 (_2!6046 lt!204500))) ((_ sign_extend 32) (currentBit!5916 (_2!6046 lt!204500))) lt!204496)))

(declare-fun lt!204508 () Unit!8158)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4790 array!6104 (_ BitVec 32)) Unit!8158)

(assert (=> b!132464 (= lt!204508 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6046 lt!204500) (buf!3136 (_2!6046 lt!204513)) lt!204496))))

(assert (=> b!132464 e!87821))

(declare-fun res!109974 () Bool)

(assert (=> b!132464 (=> (not res!109974) (not e!87821))))

(assert (=> b!132464 (= res!109974 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2763 (buf!3136 (_2!6046 lt!204513)))) ((_ sign_extend 32) (currentByte!5921 thiss!1634)) ((_ sign_extend 32) (currentBit!5916 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun lt!204499 () Unit!8158)

(assert (=> b!132464 (= lt!204499 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3136 (_2!6046 lt!204513)) (bvsub to!404 from!447)))))

(assert (=> b!132464 (= (_2!6047 lt!204511) (select (arr!3398 arr!237) from!447))))

(declare-fun readBytePure!0 (BitStream!4790) tuple2!11482)

(assert (=> b!132464 (= lt!204511 (readBytePure!0 (_1!6048 lt!204501)))))

(assert (=> b!132464 (= lt!204505 (reader!0 (_2!6046 lt!204500) (_2!6046 lt!204513)))))

(assert (=> b!132464 (= lt!204501 (reader!0 thiss!1634 (_2!6046 lt!204513)))))

(assert (=> b!132464 e!87818))

(declare-fun res!109973 () Bool)

(assert (=> b!132464 (=> (not res!109973) (not e!87818))))

(assert (=> b!132464 (= res!109973 (= (bitIndex!0 (size!2763 (buf!3136 (_1!6047 lt!204518))) (currentByte!5921 (_1!6047 lt!204518)) (currentBit!5916 (_1!6047 lt!204518))) (bitIndex!0 (size!2763 (buf!3136 (_1!6047 lt!204515))) (currentByte!5921 (_1!6047 lt!204515)) (currentBit!5916 (_1!6047 lt!204515)))))))

(declare-fun lt!204502 () Unit!8158)

(declare-fun lt!204497 () BitStream!4790)

(declare-fun readBytePrefixLemma!0 (BitStream!4790 BitStream!4790) Unit!8158)

(assert (=> b!132464 (= lt!204502 (readBytePrefixLemma!0 lt!204497 (_2!6046 lt!204513)))))

(assert (=> b!132464 (= lt!204515 (readBytePure!0 (BitStream!4791 (buf!3136 (_2!6046 lt!204513)) (currentByte!5921 thiss!1634) (currentBit!5916 thiss!1634))))))

(assert (=> b!132464 (= lt!204518 (readBytePure!0 lt!204497))))

(assert (=> b!132464 (= lt!204497 (BitStream!4791 (buf!3136 (_2!6046 lt!204500)) (currentByte!5921 thiss!1634) (currentBit!5916 thiss!1634)))))

(assert (=> b!132464 e!87817))

(declare-fun res!109985 () Bool)

(assert (=> b!132464 (=> (not res!109985) (not e!87817))))

(declare-fun isPrefixOf!0 (BitStream!4790 BitStream!4790) Bool)

(assert (=> b!132464 (= res!109985 (isPrefixOf!0 thiss!1634 (_2!6046 lt!204513)))))

(declare-fun lt!204512 () Unit!8158)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4790 BitStream!4790 BitStream!4790) Unit!8158)

(assert (=> b!132464 (= lt!204512 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6046 lt!204500) (_2!6046 lt!204513)))))

(assert (=> b!132464 e!87815))

(declare-fun res!109986 () Bool)

(assert (=> b!132464 (=> (not res!109986) (not e!87815))))

(assert (=> b!132464 (= res!109986 (= (size!2763 (buf!3136 (_2!6046 lt!204500))) (size!2763 (buf!3136 (_2!6046 lt!204513)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4790 array!6104 (_ BitVec 32) (_ BitVec 32)) tuple2!11480)

(assert (=> b!132464 (= lt!204513 (appendByteArrayLoop!0 (_2!6046 lt!204500) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!132464 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2763 (buf!3136 (_2!6046 lt!204500)))) ((_ sign_extend 32) (currentByte!5921 (_2!6046 lt!204500))) ((_ sign_extend 32) (currentBit!5916 (_2!6046 lt!204500))) lt!204496)))

(assert (=> b!132464 (= lt!204496 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!204514 () Unit!8158)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4790 BitStream!4790 (_ BitVec 64) (_ BitVec 32)) Unit!8158)

(assert (=> b!132464 (= lt!204514 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6046 lt!204500) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!132464 e!87820))

(declare-fun res!109983 () Bool)

(assert (=> b!132464 (=> (not res!109983) (not e!87820))))

(assert (=> b!132464 (= res!109983 (= (size!2763 (buf!3136 thiss!1634)) (size!2763 (buf!3136 (_2!6046 lt!204500)))))))

(declare-fun appendByte!0 (BitStream!4790 (_ BitVec 8)) tuple2!11480)

(assert (=> b!132464 (= lt!204500 (appendByte!0 thiss!1634 (select (arr!3398 arr!237) from!447)))))

(declare-fun b!132465 () Bool)

(declare-fun res!109981 () Bool)

(assert (=> b!132465 (=> (not res!109981) (not e!87820))))

(assert (=> b!132465 (= res!109981 (isPrefixOf!0 thiss!1634 (_2!6046 lt!204500)))))

(declare-fun b!132466 () Bool)

(declare-fun lt!204516 () tuple2!11484)

(declare-fun lt!204509 () tuple2!11482)

(assert (=> b!132466 (= e!87820 (and (= (_2!6047 lt!204509) (select (arr!3398 arr!237) from!447)) (= (_1!6047 lt!204509) (_2!6048 lt!204516))))))

(assert (=> b!132466 (= lt!204509 (readBytePure!0 (_1!6048 lt!204516)))))

(assert (=> b!132466 (= lt!204516 (reader!0 thiss!1634 (_2!6046 lt!204500)))))

(declare-fun b!132467 () Bool)

(declare-fun res!109980 () Bool)

(assert (=> b!132467 (=> (not res!109980) (not e!87819))))

(assert (=> b!132467 (= res!109980 (isPrefixOf!0 (_2!6046 lt!204500) (_2!6046 lt!204513)))))

(declare-fun b!132468 () Bool)

(assert (=> b!132468 (= e!87812 true)))

(declare-fun lt!204510 () tuple2!11486)

(declare-fun withMovedByteIndex!0 (BitStream!4790 (_ BitVec 32)) BitStream!4790)

(assert (=> b!132468 (= lt!204510 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6048 lt!204501) #b00000000000000000000000000000001) lt!204506 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun res!109982 () Bool)

(assert (=> start!25934 (=> (not res!109982) (not e!87811))))

(assert (=> start!25934 (= res!109982 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2763 arr!237))))))

(assert (=> start!25934 e!87811))

(assert (=> start!25934 true))

(declare-fun array_inv!2552 (array!6104) Bool)

(assert (=> start!25934 (array_inv!2552 arr!237)))

(declare-fun e!87813 () Bool)

(declare-fun inv!12 (BitStream!4790) Bool)

(assert (=> start!25934 (and (inv!12 thiss!1634) e!87813)))

(declare-fun b!132457 () Bool)

(declare-fun arrayRangesEq!166 (array!6104 array!6104 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!132457 (= e!87816 (not (arrayRangesEq!166 arr!237 (_2!6049 lt!204503) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!132469 () Bool)

(declare-fun res!109984 () Bool)

(assert (=> b!132469 (=> (not res!109984) (not e!87811))))

(assert (=> b!132469 (= res!109984 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2763 (buf!3136 thiss!1634))) ((_ sign_extend 32) (currentByte!5921 thiss!1634)) ((_ sign_extend 32) (currentBit!5916 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!132470 () Bool)

(assert (=> b!132470 (= e!87813 (array_inv!2552 (buf!3136 thiss!1634)))))

(assert (= (and start!25934 res!109982) b!132469))

(assert (= (and b!132469 res!109984) b!132461))

(assert (= (and b!132461 res!109976) b!132456))

(assert (= (and b!132456 res!109979) b!132464))

(assert (= (and b!132464 res!109983) b!132460))

(assert (= (and b!132460 res!109978) b!132465))

(assert (= (and b!132465 res!109981) b!132466))

(assert (= (and b!132464 res!109986) b!132455))

(assert (= (and b!132455 res!109975) b!132467))

(assert (= (and b!132467 res!109980) b!132463))

(assert (= (and b!132463 (not res!109987)) b!132457))

(assert (= (and b!132464 res!109985) b!132462))

(assert (= (and b!132464 res!109973) b!132458))

(assert (= (and b!132464 res!109974) b!132459))

(assert (= (and b!132464 (not res!109977)) b!132468))

(assert (= start!25934 b!132470))

(declare-fun m!200119 () Bool)

(assert (=> b!132466 m!200119))

(declare-fun m!200121 () Bool)

(assert (=> b!132466 m!200121))

(declare-fun m!200123 () Bool)

(assert (=> b!132466 m!200123))

(declare-fun m!200125 () Bool)

(assert (=> b!132469 m!200125))

(declare-fun m!200127 () Bool)

(assert (=> b!132465 m!200127))

(declare-fun m!200129 () Bool)

(assert (=> b!132459 m!200129))

(declare-fun m!200131 () Bool)

(assert (=> b!132463 m!200131))

(declare-fun m!200133 () Bool)

(assert (=> b!132463 m!200133))

(declare-fun m!200135 () Bool)

(assert (=> b!132463 m!200135))

(declare-fun m!200137 () Bool)

(assert (=> b!132463 m!200137))

(declare-fun m!200139 () Bool)

(assert (=> b!132460 m!200139))

(declare-fun m!200141 () Bool)

(assert (=> b!132460 m!200141))

(declare-fun m!200143 () Bool)

(assert (=> b!132462 m!200143))

(declare-fun m!200145 () Bool)

(assert (=> start!25934 m!200145))

(declare-fun m!200147 () Bool)

(assert (=> start!25934 m!200147))

(declare-fun m!200149 () Bool)

(assert (=> b!132470 m!200149))

(declare-fun m!200151 () Bool)

(assert (=> b!132468 m!200151))

(assert (=> b!132468 m!200151))

(declare-fun m!200153 () Bool)

(assert (=> b!132468 m!200153))

(declare-fun m!200155 () Bool)

(assert (=> b!132467 m!200155))

(declare-fun m!200157 () Bool)

(assert (=> b!132457 m!200157))

(declare-fun m!200159 () Bool)

(assert (=> b!132464 m!200159))

(declare-fun m!200161 () Bool)

(assert (=> b!132464 m!200161))

(declare-fun m!200163 () Bool)

(assert (=> b!132464 m!200163))

(declare-fun m!200165 () Bool)

(assert (=> b!132464 m!200165))

(declare-fun m!200167 () Bool)

(assert (=> b!132464 m!200167))

(declare-fun m!200169 () Bool)

(assert (=> b!132464 m!200169))

(assert (=> b!132464 m!200137))

(declare-fun m!200171 () Bool)

(assert (=> b!132464 m!200171))

(declare-fun m!200173 () Bool)

(assert (=> b!132464 m!200173))

(declare-fun m!200175 () Bool)

(assert (=> b!132464 m!200175))

(declare-fun m!200177 () Bool)

(assert (=> b!132464 m!200177))

(declare-fun m!200179 () Bool)

(assert (=> b!132464 m!200179))

(declare-fun m!200181 () Bool)

(assert (=> b!132464 m!200181))

(declare-fun m!200183 () Bool)

(assert (=> b!132464 m!200183))

(assert (=> b!132464 m!200119))

(declare-fun m!200185 () Bool)

(assert (=> b!132464 m!200185))

(declare-fun m!200187 () Bool)

(assert (=> b!132464 m!200187))

(declare-fun m!200189 () Bool)

(assert (=> b!132464 m!200189))

(declare-fun m!200191 () Bool)

(assert (=> b!132464 m!200191))

(declare-fun m!200193 () Bool)

(assert (=> b!132464 m!200193))

(declare-fun m!200195 () Bool)

(assert (=> b!132464 m!200195))

(assert (=> b!132464 m!200119))

(declare-fun m!200197 () Bool)

(assert (=> b!132464 m!200197))

(declare-fun m!200199 () Bool)

(assert (=> b!132456 m!200199))

(declare-fun m!200201 () Bool)

(assert (=> b!132455 m!200201))

(assert (=> b!132455 m!200139))

(push 1)

(assert (not b!132469))

(assert (not b!132467))

(assert (not b!132455))

(assert (not b!132462))

(assert (not b!132457))

(assert (not start!25934))

(assert (not b!132466))

(assert (not b!132465))

(assert (not b!132468))

(assert (not b!132460))

(assert (not b!132459))

(assert (not b!132463))

(assert (not b!132456))

(assert (not b!132470))

(assert (not b!132464))

(check-sat)

(pop 1)

