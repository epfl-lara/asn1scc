; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25512 () Bool)

(assert start!25512)

(declare-fun b!129473 () Bool)

(declare-fun e!85815 () Bool)

(declare-fun e!85819 () Bool)

(assert (=> b!129473 (= e!85815 (not e!85819))))

(declare-fun res!107232 () Bool)

(assert (=> b!129473 (=> res!107232 e!85819)))

(declare-datatypes ((array!5997 0))(
  ( (array!5998 (arr!3331 (Array (_ BitVec 32) (_ BitVec 8))) (size!2714 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4692 0))(
  ( (BitStream!4693 (buf!3072 array!5997) (currentByte!5833 (_ BitVec 32)) (currentBit!5828 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!11070 0))(
  ( (tuple2!11071 (_1!5832 BitStream!4692) (_2!5832 array!5997)) )
))
(declare-fun lt!200086 () tuple2!11070)

(declare-fun arr!237 () array!5997)

(declare-datatypes ((tuple2!11072 0))(
  ( (tuple2!11073 (_1!5833 BitStream!4692) (_2!5833 BitStream!4692)) )
))
(declare-fun lt!200093 () tuple2!11072)

(assert (=> b!129473 (= res!107232 (or (not (= (size!2714 (_2!5832 lt!200086)) (size!2714 arr!237))) (not (= (_1!5832 lt!200086) (_2!5833 lt!200093)))))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun readByteArrayLoopPure!0 (BitStream!4692 array!5997 (_ BitVec 32) (_ BitVec 32)) tuple2!11070)

(assert (=> b!129473 (= lt!200086 (readByteArrayLoopPure!0 (_1!5833 lt!200093) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-datatypes ((Unit!8033 0))(
  ( (Unit!8034) )
))
(declare-datatypes ((tuple2!11074 0))(
  ( (tuple2!11075 (_1!5834 Unit!8033) (_2!5834 BitStream!4692)) )
))
(declare-fun lt!200092 () tuple2!11074)

(declare-fun lt!200091 () tuple2!11074)

(declare-fun lt!200089 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!129473 (validate_offset_bits!1 ((_ sign_extend 32) (size!2714 (buf!3072 (_2!5834 lt!200092)))) ((_ sign_extend 32) (currentByte!5833 (_2!5834 lt!200091))) ((_ sign_extend 32) (currentBit!5828 (_2!5834 lt!200091))) lt!200089)))

(declare-fun lt!200087 () Unit!8033)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4692 array!5997 (_ BitVec 64)) Unit!8033)

(assert (=> b!129473 (= lt!200087 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5834 lt!200091) (buf!3072 (_2!5834 lt!200092)) lt!200089))))

(declare-fun reader!0 (BitStream!4692 BitStream!4692) tuple2!11072)

(assert (=> b!129473 (= lt!200093 (reader!0 (_2!5834 lt!200091) (_2!5834 lt!200092)))))

(declare-fun b!129474 () Bool)

(declare-fun e!85820 () Bool)

(declare-fun thiss!1634 () BitStream!4692)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!129474 (= e!85820 (invariant!0 (currentBit!5828 thiss!1634) (currentByte!5833 thiss!1634) (size!2714 (buf!3072 (_2!5834 lt!200091)))))))

(declare-fun b!129475 () Bool)

(declare-fun e!85818 () Bool)

(assert (=> b!129475 (= e!85818 e!85815)))

(declare-fun res!107241 () Bool)

(assert (=> b!129475 (=> (not res!107241) (not e!85815))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!129475 (= res!107241 (= (bitIndex!0 (size!2714 (buf!3072 (_2!5834 lt!200092))) (currentByte!5833 (_2!5834 lt!200092)) (currentBit!5828 (_2!5834 lt!200092))) (bvadd (bitIndex!0 (size!2714 (buf!3072 (_2!5834 lt!200091))) (currentByte!5833 (_2!5834 lt!200091)) (currentBit!5828 (_2!5834 lt!200091))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!200089))))))

(assert (=> b!129475 (= lt!200089 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!129476 () Bool)

(declare-fun res!107239 () Bool)

(declare-fun e!85814 () Bool)

(assert (=> b!129476 (=> (not res!107239) (not e!85814))))

(assert (=> b!129476 (= res!107239 (invariant!0 (currentBit!5828 thiss!1634) (currentByte!5833 thiss!1634) (size!2714 (buf!3072 thiss!1634))))))

(declare-fun b!129477 () Bool)

(declare-fun res!107237 () Bool)

(assert (=> b!129477 (=> (not res!107237) (not e!85815))))

(declare-fun isPrefixOf!0 (BitStream!4692 BitStream!4692) Bool)

(assert (=> b!129477 (= res!107237 (isPrefixOf!0 (_2!5834 lt!200091) (_2!5834 lt!200092)))))

(declare-fun b!129478 () Bool)

(declare-fun res!107233 () Bool)

(assert (=> b!129478 (=> (not res!107233) (not e!85814))))

(assert (=> b!129478 (= res!107233 (bvslt from!447 to!404))))

(declare-fun b!129479 () Bool)

(declare-fun e!85811 () Bool)

(assert (=> b!129479 (= e!85814 (not e!85811))))

(declare-fun res!107234 () Bool)

(assert (=> b!129479 (=> res!107234 e!85811)))

(declare-fun lt!200088 () (_ BitVec 64))

(assert (=> b!129479 (= res!107234 (bvsgt lt!200088 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2714 (buf!3072 (_2!5834 lt!200091)))))))))

(assert (=> b!129479 (= lt!200088 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2714 (buf!3072 (_2!5834 lt!200091))) (currentByte!5833 thiss!1634) (currentBit!5828 thiss!1634))))))

(assert (=> b!129479 e!85820))

(declare-fun res!107236 () Bool)

(assert (=> b!129479 (=> (not res!107236) (not e!85820))))

(assert (=> b!129479 (= res!107236 (isPrefixOf!0 thiss!1634 (_2!5834 lt!200092)))))

(declare-fun lt!200083 () Unit!8033)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4692 BitStream!4692 BitStream!4692) Unit!8033)

(assert (=> b!129479 (= lt!200083 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!5834 lt!200091) (_2!5834 lt!200092)))))

(assert (=> b!129479 e!85818))

(declare-fun res!107228 () Bool)

(assert (=> b!129479 (=> (not res!107228) (not e!85818))))

(assert (=> b!129479 (= res!107228 (= (size!2714 (buf!3072 (_2!5834 lt!200091))) (size!2714 (buf!3072 (_2!5834 lt!200092)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4692 array!5997 (_ BitVec 32) (_ BitVec 32)) tuple2!11074)

(assert (=> b!129479 (= lt!200092 (appendByteArrayLoop!0 (_2!5834 lt!200091) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!129479 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2714 (buf!3072 (_2!5834 lt!200091)))) ((_ sign_extend 32) (currentByte!5833 (_2!5834 lt!200091))) ((_ sign_extend 32) (currentBit!5828 (_2!5834 lt!200091))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!200081 () Unit!8033)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4692 BitStream!4692 (_ BitVec 64) (_ BitVec 32)) Unit!8033)

(assert (=> b!129479 (= lt!200081 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!5834 lt!200091) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(declare-fun e!85817 () Bool)

(assert (=> b!129479 e!85817))

(declare-fun res!107229 () Bool)

(assert (=> b!129479 (=> (not res!107229) (not e!85817))))

(assert (=> b!129479 (= res!107229 (= (size!2714 (buf!3072 thiss!1634)) (size!2714 (buf!3072 (_2!5834 lt!200091)))))))

(declare-fun appendByte!0 (BitStream!4692 (_ BitVec 8)) tuple2!11074)

(assert (=> b!129479 (= lt!200091 (appendByte!0 thiss!1634 (select (arr!3331 arr!237) from!447)))))

(declare-fun lt!200090 () tuple2!11072)

(declare-datatypes ((tuple2!11076 0))(
  ( (tuple2!11077 (_1!5835 BitStream!4692) (_2!5835 (_ BitVec 8))) )
))
(declare-fun lt!200085 () tuple2!11076)

(declare-fun b!129480 () Bool)

(assert (=> b!129480 (= e!85817 (and (= (_2!5835 lt!200085) (select (arr!3331 arr!237) from!447)) (= (_1!5835 lt!200085) (_2!5833 lt!200090))))))

(declare-fun readBytePure!0 (BitStream!4692) tuple2!11076)

(assert (=> b!129480 (= lt!200085 (readBytePure!0 (_1!5833 lt!200090)))))

(assert (=> b!129480 (= lt!200090 (reader!0 thiss!1634 (_2!5834 lt!200091)))))

(declare-fun b!129481 () Bool)

(declare-fun res!107238 () Bool)

(assert (=> b!129481 (=> res!107238 e!85811)))

(declare-fun arrayBitRangesEq!0 (array!5997 array!5997 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!129481 (= res!107238 (not (arrayBitRangesEq!0 (buf!3072 (_2!5834 lt!200091)) (buf!3072 (_2!5834 lt!200092)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!200088)))))

(declare-fun b!129482 () Bool)

(declare-fun res!107230 () Bool)

(assert (=> b!129482 (=> res!107230 e!85811)))

(assert (=> b!129482 (= res!107230 (bvsgt lt!200088 (bitIndex!0 (size!2714 (buf!3072 (_2!5834 lt!200092))) (currentByte!5833 (_2!5834 lt!200092)) (currentBit!5828 (_2!5834 lt!200092)))))))

(declare-fun b!129483 () Bool)

(declare-fun res!107242 () Bool)

(assert (=> b!129483 (=> (not res!107242) (not e!85817))))

(assert (=> b!129483 (= res!107242 (= (bitIndex!0 (size!2714 (buf!3072 (_2!5834 lt!200091))) (currentByte!5833 (_2!5834 lt!200091)) (currentBit!5828 (_2!5834 lt!200091))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2714 (buf!3072 thiss!1634)) (currentByte!5833 thiss!1634) (currentBit!5828 thiss!1634)))))))

(declare-fun b!129484 () Bool)

(declare-fun arrayRangesEq!117 (array!5997 array!5997 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!129484 (= e!85819 (not (arrayRangesEq!117 arr!237 (_2!5832 lt!200086) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!129485 () Bool)

(declare-fun res!107240 () Bool)

(assert (=> b!129485 (=> (not res!107240) (not e!85814))))

(assert (=> b!129485 (= res!107240 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2714 (buf!3072 thiss!1634))) ((_ sign_extend 32) (currentByte!5833 thiss!1634)) ((_ sign_extend 32) (currentBit!5828 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!129486 () Bool)

(declare-fun res!107231 () Bool)

(assert (=> b!129486 (=> (not res!107231) (not e!85817))))

(assert (=> b!129486 (= res!107231 (isPrefixOf!0 thiss!1634 (_2!5834 lt!200091)))))

(declare-fun b!129487 () Bool)

(assert (=> b!129487 (= e!85811 true)))

(declare-fun lt!200082 () tuple2!11076)

(assert (=> b!129487 (= lt!200082 (readBytePure!0 (BitStream!4693 (buf!3072 (_2!5834 lt!200092)) (currentByte!5833 thiss!1634) (currentBit!5828 thiss!1634))))))

(declare-fun lt!200084 () tuple2!11076)

(assert (=> b!129487 (= lt!200084 (readBytePure!0 (BitStream!4693 (buf!3072 (_2!5834 lt!200091)) (currentByte!5833 thiss!1634) (currentBit!5828 thiss!1634))))))

(declare-fun res!107235 () Bool)

(assert (=> start!25512 (=> (not res!107235) (not e!85814))))

(assert (=> start!25512 (= res!107235 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2714 arr!237))))))

(assert (=> start!25512 e!85814))

(assert (=> start!25512 true))

(declare-fun array_inv!2503 (array!5997) Bool)

(assert (=> start!25512 (array_inv!2503 arr!237)))

(declare-fun e!85813 () Bool)

(declare-fun inv!12 (BitStream!4692) Bool)

(assert (=> start!25512 (and (inv!12 thiss!1634) e!85813)))

(declare-fun b!129488 () Bool)

(assert (=> b!129488 (= e!85813 (array_inv!2503 (buf!3072 thiss!1634)))))

(assert (= (and start!25512 res!107235) b!129485))

(assert (= (and b!129485 res!107240) b!129478))

(assert (= (and b!129478 res!107233) b!129476))

(assert (= (and b!129476 res!107239) b!129479))

(assert (= (and b!129479 res!107229) b!129483))

(assert (= (and b!129483 res!107242) b!129486))

(assert (= (and b!129486 res!107231) b!129480))

(assert (= (and b!129479 res!107228) b!129475))

(assert (= (and b!129475 res!107241) b!129477))

(assert (= (and b!129477 res!107237) b!129473))

(assert (= (and b!129473 (not res!107232)) b!129484))

(assert (= (and b!129479 res!107236) b!129474))

(assert (= (and b!129479 (not res!107234)) b!129482))

(assert (= (and b!129482 (not res!107230)) b!129481))

(assert (= (and b!129481 (not res!107238)) b!129487))

(assert (= start!25512 b!129488))

(declare-fun m!195317 () Bool)

(assert (=> b!129483 m!195317))

(declare-fun m!195319 () Bool)

(assert (=> b!129483 m!195319))

(declare-fun m!195321 () Bool)

(assert (=> b!129481 m!195321))

(declare-fun m!195323 () Bool)

(assert (=> b!129477 m!195323))

(declare-fun m!195325 () Bool)

(assert (=> b!129488 m!195325))

(declare-fun m!195327 () Bool)

(assert (=> b!129479 m!195327))

(declare-fun m!195329 () Bool)

(assert (=> b!129479 m!195329))

(declare-fun m!195331 () Bool)

(assert (=> b!129479 m!195331))

(declare-fun m!195333 () Bool)

(assert (=> b!129479 m!195333))

(declare-fun m!195335 () Bool)

(assert (=> b!129479 m!195335))

(declare-fun m!195337 () Bool)

(assert (=> b!129479 m!195337))

(assert (=> b!129479 m!195333))

(declare-fun m!195339 () Bool)

(assert (=> b!129479 m!195339))

(declare-fun m!195341 () Bool)

(assert (=> b!129479 m!195341))

(declare-fun m!195343 () Bool)

(assert (=> b!129476 m!195343))

(declare-fun m!195345 () Bool)

(assert (=> b!129486 m!195345))

(declare-fun m!195347 () Bool)

(assert (=> b!129487 m!195347))

(declare-fun m!195349 () Bool)

(assert (=> b!129487 m!195349))

(declare-fun m!195351 () Bool)

(assert (=> b!129485 m!195351))

(declare-fun m!195353 () Bool)

(assert (=> b!129475 m!195353))

(assert (=> b!129475 m!195317))

(declare-fun m!195355 () Bool)

(assert (=> b!129474 m!195355))

(assert (=> b!129480 m!195333))

(declare-fun m!195357 () Bool)

(assert (=> b!129480 m!195357))

(declare-fun m!195359 () Bool)

(assert (=> b!129480 m!195359))

(assert (=> b!129482 m!195353))

(declare-fun m!195361 () Bool)

(assert (=> b!129484 m!195361))

(declare-fun m!195363 () Bool)

(assert (=> b!129473 m!195363))

(declare-fun m!195365 () Bool)

(assert (=> b!129473 m!195365))

(declare-fun m!195367 () Bool)

(assert (=> b!129473 m!195367))

(declare-fun m!195369 () Bool)

(assert (=> b!129473 m!195369))

(declare-fun m!195371 () Bool)

(assert (=> start!25512 m!195371))

(declare-fun m!195373 () Bool)

(assert (=> start!25512 m!195373))

(check-sat (not b!129488) (not b!129473) (not b!129477) (not b!129485) (not b!129484) (not b!129475) (not b!129482) (not b!129486) (not b!129481) (not start!25512) (not b!129480) (not b!129487) (not b!129476) (not b!129479) (not b!129483) (not b!129474))
