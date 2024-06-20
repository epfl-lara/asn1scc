; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28750 () Bool)

(assert start!28750)

(declare-fun b!148791 () Bool)

(declare-fun res!124570 () Bool)

(declare-fun e!99291 () Bool)

(assert (=> b!148791 (=> (not res!124570) (not e!99291))))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!148791 (= res!124570 (bvslt from!447 to!404))))

(declare-fun b!148792 () Bool)

(declare-fun e!99283 () Bool)

(declare-datatypes ((array!6672 0))(
  ( (array!6673 (arr!3802 (Array (_ BitVec 32) (_ BitVec 8))) (size!3018 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5294 0))(
  ( (BitStream!5295 (buf!3493 array!6672) (currentByte!6407 (_ BitVec 32)) (currentBit!6402 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5294)

(declare-datatypes ((Unit!9427 0))(
  ( (Unit!9428) )
))
(declare-datatypes ((tuple2!13222 0))(
  ( (tuple2!13223 (_1!6975 Unit!9427) (_2!6975 BitStream!5294)) )
))
(declare-fun lt!232030 () tuple2!13222)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!148792 (= e!99283 (invariant!0 (currentBit!6402 thiss!1634) (currentByte!6407 thiss!1634) (size!3018 (buf!3493 (_2!6975 lt!232030)))))))

(declare-fun b!148793 () Bool)

(declare-fun arr!237 () array!6672)

(declare-datatypes ((tuple2!13224 0))(
  ( (tuple2!13225 (_1!6976 BitStream!5294) (_2!6976 array!6672)) )
))
(declare-fun lt!232033 () tuple2!13224)

(declare-fun e!99282 () Bool)

(declare-fun arrayRangesEq!334 (array!6672 array!6672 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!148793 (= e!99282 (not (arrayRangesEq!334 arr!237 (_2!6976 lt!232033) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!148794 () Bool)

(declare-fun e!99286 () Bool)

(declare-fun array_inv!2807 (array!6672) Bool)

(assert (=> b!148794 (= e!99286 (array_inv!2807 (buf!3493 thiss!1634)))))

(declare-fun e!99284 () Bool)

(declare-fun lt!232051 () tuple2!13224)

(declare-fun b!148795 () Bool)

(declare-fun lt!232031 () tuple2!13224)

(assert (=> b!148795 (= e!99284 (or (bvsgt #b00000000000000000000000000000000 to!404) (bvsgt (size!3018 arr!237) (size!3018 (_2!6976 lt!232051))) (bvsgt (size!3018 (_2!6976 lt!232051)) (size!3018 (_2!6976 lt!232031))) (bvsle to!404 (size!3018 (_2!6976 lt!232051)))))))

(assert (=> b!148795 (arrayRangesEq!334 (_2!6976 lt!232051) (_2!6976 lt!232031) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!232036 () Unit!9427)

(declare-fun arrayRangesEqSymmetricLemma!66 (array!6672 array!6672 (_ BitVec 32) (_ BitVec 32)) Unit!9427)

(assert (=> b!148795 (= lt!232036 (arrayRangesEqSymmetricLemma!66 (_2!6976 lt!232031) (_2!6976 lt!232051) #b00000000000000000000000000000000 to!404))))

(declare-fun b!148796 () Bool)

(declare-fun res!124564 () Bool)

(assert (=> b!148796 (=> (not res!124564) (not e!99291))))

(assert (=> b!148796 (= res!124564 (invariant!0 (currentBit!6402 thiss!1634) (currentByte!6407 thiss!1634) (size!3018 (buf!3493 thiss!1634))))))

(declare-fun b!148797 () Bool)

(declare-fun res!124571 () Bool)

(assert (=> b!148797 (=> (not res!124571) (not e!99291))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!148797 (= res!124571 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3018 (buf!3493 thiss!1634))) ((_ sign_extend 32) (currentByte!6407 thiss!1634)) ((_ sign_extend 32) (currentBit!6402 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!148798 () Bool)

(declare-fun res!124569 () Bool)

(declare-fun e!99290 () Bool)

(assert (=> b!148798 (=> (not res!124569) (not e!99290))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!148798 (= res!124569 (= (bitIndex!0 (size!3018 (buf!3493 (_2!6975 lt!232030))) (currentByte!6407 (_2!6975 lt!232030)) (currentBit!6402 (_2!6975 lt!232030))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3018 (buf!3493 thiss!1634)) (currentByte!6407 thiss!1634) (currentBit!6402 thiss!1634)))))))

(declare-fun b!148799 () Bool)

(declare-fun e!99288 () Bool)

(declare-fun e!99292 () Bool)

(assert (=> b!148799 (= e!99288 e!99292)))

(declare-fun res!124574 () Bool)

(assert (=> b!148799 (=> (not res!124574) (not e!99292))))

(declare-fun lt!232037 () tuple2!13222)

(declare-fun lt!232053 () (_ BitVec 64))

(assert (=> b!148799 (= res!124574 (= (bitIndex!0 (size!3018 (buf!3493 (_2!6975 lt!232037))) (currentByte!6407 (_2!6975 lt!232037)) (currentBit!6402 (_2!6975 lt!232037))) (bvadd (bitIndex!0 (size!3018 (buf!3493 (_2!6975 lt!232030))) (currentByte!6407 (_2!6975 lt!232030)) (currentBit!6402 (_2!6975 lt!232030))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!232053))))))

(assert (=> b!148799 (= lt!232053 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun res!124576 () Bool)

(assert (=> start!28750 (=> (not res!124576) (not e!99291))))

(assert (=> start!28750 (= res!124576 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!3018 arr!237))))))

(assert (=> start!28750 e!99291))

(assert (=> start!28750 true))

(assert (=> start!28750 (array_inv!2807 arr!237)))

(declare-fun inv!12 (BitStream!5294) Bool)

(assert (=> start!28750 (and (inv!12 thiss!1634) e!99286)))

(declare-fun b!148800 () Bool)

(assert (=> b!148800 (= e!99292 (not e!99282))))

(declare-fun res!124572 () Bool)

(assert (=> b!148800 (=> res!124572 e!99282)))

(declare-datatypes ((tuple2!13226 0))(
  ( (tuple2!13227 (_1!6977 BitStream!5294) (_2!6977 BitStream!5294)) )
))
(declare-fun lt!232049 () tuple2!13226)

(assert (=> b!148800 (= res!124572 (or (not (= (size!3018 (_2!6976 lt!232033)) (size!3018 arr!237))) (not (= (_1!6976 lt!232033) (_2!6977 lt!232049)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!5294 array!6672 (_ BitVec 32) (_ BitVec 32)) tuple2!13224)

(assert (=> b!148800 (= lt!232033 (readByteArrayLoopPure!0 (_1!6977 lt!232049) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!148800 (validate_offset_bits!1 ((_ sign_extend 32) (size!3018 (buf!3493 (_2!6975 lt!232037)))) ((_ sign_extend 32) (currentByte!6407 (_2!6975 lt!232030))) ((_ sign_extend 32) (currentBit!6402 (_2!6975 lt!232030))) lt!232053)))

(declare-fun lt!232028 () Unit!9427)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5294 array!6672 (_ BitVec 64)) Unit!9427)

(assert (=> b!148800 (= lt!232028 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6975 lt!232030) (buf!3493 (_2!6975 lt!232037)) lt!232053))))

(declare-fun reader!0 (BitStream!5294 BitStream!5294) tuple2!13226)

(assert (=> b!148800 (= lt!232049 (reader!0 (_2!6975 lt!232030) (_2!6975 lt!232037)))))

(declare-fun b!148801 () Bool)

(assert (=> b!148801 (= e!99291 (not e!99284))))

(declare-fun res!124575 () Bool)

(assert (=> b!148801 (=> res!124575 e!99284)))

(assert (=> b!148801 (= res!124575 (not (arrayRangesEq!334 (_2!6976 lt!232031) (_2!6976 lt!232051) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!232052 () tuple2!13224)

(assert (=> b!148801 (arrayRangesEq!334 (_2!6976 lt!232031) (_2!6976 lt!232052) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!232042 () tuple2!13226)

(declare-fun lt!232038 () Unit!9427)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!5294 array!6672 (_ BitVec 32) (_ BitVec 32)) Unit!9427)

(assert (=> b!148801 (= lt!232038 (readByteArrayLoopArrayPrefixLemma!0 (_1!6977 lt!232042) arr!237 from!447 to!404))))

(declare-fun lt!232046 () array!6672)

(declare-fun withMovedByteIndex!0 (BitStream!5294 (_ BitVec 32)) BitStream!5294)

(assert (=> b!148801 (= lt!232052 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6977 lt!232042) #b00000000000000000000000000000001) lt!232046 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!232050 () tuple2!13226)

(assert (=> b!148801 (= lt!232051 (readByteArrayLoopPure!0 (_1!6977 lt!232050) lt!232046 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-datatypes ((tuple2!13228 0))(
  ( (tuple2!13229 (_1!6978 BitStream!5294) (_2!6978 (_ BitVec 8))) )
))
(declare-fun lt!232039 () tuple2!13228)

(assert (=> b!148801 (= lt!232046 (array!6673 (store (arr!3802 arr!237) from!447 (_2!6978 lt!232039)) (size!3018 arr!237)))))

(declare-fun lt!232045 () (_ BitVec 32))

(assert (=> b!148801 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3018 (buf!3493 (_2!6975 lt!232037)))) ((_ sign_extend 32) (currentByte!6407 (_2!6975 lt!232030))) ((_ sign_extend 32) (currentBit!6402 (_2!6975 lt!232030))) lt!232045)))

(declare-fun lt!232034 () Unit!9427)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!5294 array!6672 (_ BitVec 32)) Unit!9427)

(assert (=> b!148801 (= lt!232034 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6975 lt!232030) (buf!3493 (_2!6975 lt!232037)) lt!232045))))

(assert (=> b!148801 (= (_1!6976 lt!232031) (_2!6977 lt!232042))))

(assert (=> b!148801 (= lt!232031 (readByteArrayLoopPure!0 (_1!6977 lt!232042) arr!237 from!447 to!404))))

(assert (=> b!148801 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3018 (buf!3493 (_2!6975 lt!232037)))) ((_ sign_extend 32) (currentByte!6407 thiss!1634)) ((_ sign_extend 32) (currentBit!6402 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!232043 () Unit!9427)

(assert (=> b!148801 (= lt!232043 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3493 (_2!6975 lt!232037)) (bvsub to!404 from!447)))))

(assert (=> b!148801 (= (_2!6978 lt!232039) (select (arr!3802 arr!237) from!447))))

(declare-fun readBytePure!0 (BitStream!5294) tuple2!13228)

(assert (=> b!148801 (= lt!232039 (readBytePure!0 (_1!6977 lt!232042)))))

(assert (=> b!148801 (= lt!232050 (reader!0 (_2!6975 lt!232030) (_2!6975 lt!232037)))))

(assert (=> b!148801 (= lt!232042 (reader!0 thiss!1634 (_2!6975 lt!232037)))))

(declare-fun e!99285 () Bool)

(assert (=> b!148801 e!99285))

(declare-fun res!124577 () Bool)

(assert (=> b!148801 (=> (not res!124577) (not e!99285))))

(declare-fun lt!232048 () tuple2!13228)

(declare-fun lt!232029 () tuple2!13228)

(assert (=> b!148801 (= res!124577 (= (bitIndex!0 (size!3018 (buf!3493 (_1!6978 lt!232048))) (currentByte!6407 (_1!6978 lt!232048)) (currentBit!6402 (_1!6978 lt!232048))) (bitIndex!0 (size!3018 (buf!3493 (_1!6978 lt!232029))) (currentByte!6407 (_1!6978 lt!232029)) (currentBit!6402 (_1!6978 lt!232029)))))))

(declare-fun lt!232035 () Unit!9427)

(declare-fun lt!232047 () BitStream!5294)

(declare-fun readBytePrefixLemma!0 (BitStream!5294 BitStream!5294) Unit!9427)

(assert (=> b!148801 (= lt!232035 (readBytePrefixLemma!0 lt!232047 (_2!6975 lt!232037)))))

(assert (=> b!148801 (= lt!232029 (readBytePure!0 (BitStream!5295 (buf!3493 (_2!6975 lt!232037)) (currentByte!6407 thiss!1634) (currentBit!6402 thiss!1634))))))

(assert (=> b!148801 (= lt!232048 (readBytePure!0 lt!232047))))

(assert (=> b!148801 (= lt!232047 (BitStream!5295 (buf!3493 (_2!6975 lt!232030)) (currentByte!6407 thiss!1634) (currentBit!6402 thiss!1634)))))

(assert (=> b!148801 e!99283))

(declare-fun res!124565 () Bool)

(assert (=> b!148801 (=> (not res!124565) (not e!99283))))

(declare-fun isPrefixOf!0 (BitStream!5294 BitStream!5294) Bool)

(assert (=> b!148801 (= res!124565 (isPrefixOf!0 thiss!1634 (_2!6975 lt!232037)))))

(declare-fun lt!232041 () Unit!9427)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5294 BitStream!5294 BitStream!5294) Unit!9427)

(assert (=> b!148801 (= lt!232041 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6975 lt!232030) (_2!6975 lt!232037)))))

(assert (=> b!148801 e!99288))

(declare-fun res!124573 () Bool)

(assert (=> b!148801 (=> (not res!124573) (not e!99288))))

(assert (=> b!148801 (= res!124573 (= (size!3018 (buf!3493 (_2!6975 lt!232030))) (size!3018 (buf!3493 (_2!6975 lt!232037)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5294 array!6672 (_ BitVec 32) (_ BitVec 32)) tuple2!13222)

(assert (=> b!148801 (= lt!232037 (appendByteArrayLoop!0 (_2!6975 lt!232030) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!148801 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3018 (buf!3493 (_2!6975 lt!232030)))) ((_ sign_extend 32) (currentByte!6407 (_2!6975 lt!232030))) ((_ sign_extend 32) (currentBit!6402 (_2!6975 lt!232030))) lt!232045)))

(assert (=> b!148801 (= lt!232045 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!232032 () Unit!9427)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5294 BitStream!5294 (_ BitVec 64) (_ BitVec 32)) Unit!9427)

(assert (=> b!148801 (= lt!232032 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6975 lt!232030) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!148801 e!99290))

(declare-fun res!124566 () Bool)

(assert (=> b!148801 (=> (not res!124566) (not e!99290))))

(assert (=> b!148801 (= res!124566 (= (size!3018 (buf!3493 thiss!1634)) (size!3018 (buf!3493 (_2!6975 lt!232030)))))))

(declare-fun appendByte!0 (BitStream!5294 (_ BitVec 8)) tuple2!13222)

(assert (=> b!148801 (= lt!232030 (appendByte!0 thiss!1634 (select (arr!3802 arr!237) from!447)))))

(declare-fun b!148802 () Bool)

(declare-fun res!124568 () Bool)

(assert (=> b!148802 (=> (not res!124568) (not e!99290))))

(assert (=> b!148802 (= res!124568 (isPrefixOf!0 thiss!1634 (_2!6975 lt!232030)))))

(declare-fun b!148803 () Bool)

(assert (=> b!148803 (= e!99285 (= (_2!6978 lt!232048) (_2!6978 lt!232029)))))

(declare-fun lt!232044 () tuple2!13226)

(declare-fun lt!232040 () tuple2!13228)

(declare-fun b!148804 () Bool)

(assert (=> b!148804 (= e!99290 (and (= (_2!6978 lt!232040) (select (arr!3802 arr!237) from!447)) (= (_1!6978 lt!232040) (_2!6977 lt!232044))))))

(assert (=> b!148804 (= lt!232040 (readBytePure!0 (_1!6977 lt!232044)))))

(assert (=> b!148804 (= lt!232044 (reader!0 thiss!1634 (_2!6975 lt!232030)))))

(declare-fun b!148805 () Bool)

(declare-fun res!124567 () Bool)

(assert (=> b!148805 (=> (not res!124567) (not e!99292))))

(assert (=> b!148805 (= res!124567 (isPrefixOf!0 (_2!6975 lt!232030) (_2!6975 lt!232037)))))

(assert (= (and start!28750 res!124576) b!148797))

(assert (= (and b!148797 res!124571) b!148791))

(assert (= (and b!148791 res!124570) b!148796))

(assert (= (and b!148796 res!124564) b!148801))

(assert (= (and b!148801 res!124566) b!148798))

(assert (= (and b!148798 res!124569) b!148802))

(assert (= (and b!148802 res!124568) b!148804))

(assert (= (and b!148801 res!124573) b!148799))

(assert (= (and b!148799 res!124574) b!148805))

(assert (= (and b!148805 res!124567) b!148800))

(assert (= (and b!148800 (not res!124572)) b!148793))

(assert (= (and b!148801 res!124565) b!148792))

(assert (= (and b!148801 res!124577) b!148803))

(assert (= (and b!148801 (not res!124575)) b!148795))

(assert (= start!28750 b!148794))

(declare-fun m!231205 () Bool)

(assert (=> b!148800 m!231205))

(declare-fun m!231207 () Bool)

(assert (=> b!148800 m!231207))

(declare-fun m!231209 () Bool)

(assert (=> b!148800 m!231209))

(declare-fun m!231211 () Bool)

(assert (=> b!148800 m!231211))

(declare-fun m!231213 () Bool)

(assert (=> b!148804 m!231213))

(declare-fun m!231215 () Bool)

(assert (=> b!148804 m!231215))

(declare-fun m!231217 () Bool)

(assert (=> b!148804 m!231217))

(declare-fun m!231219 () Bool)

(assert (=> b!148802 m!231219))

(declare-fun m!231221 () Bool)

(assert (=> b!148797 m!231221))

(declare-fun m!231223 () Bool)

(assert (=> b!148795 m!231223))

(declare-fun m!231225 () Bool)

(assert (=> b!148795 m!231225))

(declare-fun m!231227 () Bool)

(assert (=> b!148794 m!231227))

(declare-fun m!231229 () Bool)

(assert (=> b!148805 m!231229))

(declare-fun m!231231 () Bool)

(assert (=> b!148801 m!231231))

(declare-fun m!231233 () Bool)

(assert (=> b!148801 m!231233))

(declare-fun m!231235 () Bool)

(assert (=> b!148801 m!231235))

(declare-fun m!231237 () Bool)

(assert (=> b!148801 m!231237))

(declare-fun m!231239 () Bool)

(assert (=> b!148801 m!231239))

(declare-fun m!231241 () Bool)

(assert (=> b!148801 m!231241))

(declare-fun m!231243 () Bool)

(assert (=> b!148801 m!231243))

(declare-fun m!231245 () Bool)

(assert (=> b!148801 m!231245))

(declare-fun m!231247 () Bool)

(assert (=> b!148801 m!231247))

(declare-fun m!231249 () Bool)

(assert (=> b!148801 m!231249))

(declare-fun m!231251 () Bool)

(assert (=> b!148801 m!231251))

(declare-fun m!231253 () Bool)

(assert (=> b!148801 m!231253))

(assert (=> b!148801 m!231213))

(declare-fun m!231255 () Bool)

(assert (=> b!148801 m!231255))

(declare-fun m!231257 () Bool)

(assert (=> b!148801 m!231257))

(declare-fun m!231259 () Bool)

(assert (=> b!148801 m!231259))

(declare-fun m!231261 () Bool)

(assert (=> b!148801 m!231261))

(declare-fun m!231263 () Bool)

(assert (=> b!148801 m!231263))

(declare-fun m!231265 () Bool)

(assert (=> b!148801 m!231265))

(declare-fun m!231267 () Bool)

(assert (=> b!148801 m!231267))

(assert (=> b!148801 m!231211))

(declare-fun m!231269 () Bool)

(assert (=> b!148801 m!231269))

(assert (=> b!148801 m!231245))

(declare-fun m!231271 () Bool)

(assert (=> b!148801 m!231271))

(declare-fun m!231273 () Bool)

(assert (=> b!148801 m!231273))

(declare-fun m!231275 () Bool)

(assert (=> b!148801 m!231275))

(declare-fun m!231277 () Bool)

(assert (=> b!148801 m!231277))

(declare-fun m!231279 () Bool)

(assert (=> b!148801 m!231279))

(assert (=> b!148801 m!231213))

(declare-fun m!231281 () Bool)

(assert (=> start!28750 m!231281))

(declare-fun m!231283 () Bool)

(assert (=> start!28750 m!231283))

(declare-fun m!231285 () Bool)

(assert (=> b!148798 m!231285))

(declare-fun m!231287 () Bool)

(assert (=> b!148798 m!231287))

(declare-fun m!231289 () Bool)

(assert (=> b!148799 m!231289))

(assert (=> b!148799 m!231285))

(declare-fun m!231291 () Bool)

(assert (=> b!148792 m!231291))

(declare-fun m!231293 () Bool)

(assert (=> b!148793 m!231293))

(declare-fun m!231295 () Bool)

(assert (=> b!148796 m!231295))

(push 1)

(assert (not b!148801))

(assert (not b!148805))

(assert (not b!148798))

(assert (not start!28750))

(assert (not b!148797))

(assert (not b!148802))

(assert (not b!148795))

(assert (not b!148800))

(assert (not b!148799))

(assert (not b!148793))

(assert (not b!148792))

(assert (not b!148804))

(assert (not b!148796))

(assert (not b!148794))

(check-sat)

(pop 1)

(push 1)

(check-sat)

