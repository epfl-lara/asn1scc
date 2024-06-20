; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27986 () Bool)

(assert start!27986)

(declare-fun b!144485 () Bool)

(declare-fun res!120731 () Bool)

(declare-fun e!96273 () Bool)

(assert (=> b!144485 (=> (not res!120731) (not e!96273))))

(declare-datatypes ((array!6578 0))(
  ( (array!6579 (arr!3710 (Array (_ BitVec 32) (_ BitVec 8))) (size!2977 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5212 0))(
  ( (BitStream!5213 (buf!3416 array!6578) (currentByte!6306 (_ BitVec 32)) (currentBit!6301 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!9027 0))(
  ( (Unit!9028) )
))
(declare-datatypes ((tuple2!12858 0))(
  ( (tuple2!12859 (_1!6775 Unit!9027) (_2!6775 BitStream!5212)) )
))
(declare-fun lt!224095 () tuple2!12858)

(declare-fun thiss!1634 () BitStream!5212)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!144485 (= res!120731 (= (bitIndex!0 (size!2977 (buf!3416 (_2!6775 lt!224095))) (currentByte!6306 (_2!6775 lt!224095)) (currentBit!6301 (_2!6775 lt!224095))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2977 (buf!3416 thiss!1634)) (currentByte!6306 thiss!1634) (currentBit!6301 thiss!1634)))))))

(declare-fun b!144486 () Bool)

(declare-fun res!120729 () Bool)

(declare-fun e!96276 () Bool)

(assert (=> b!144486 (=> (not res!120729) (not e!96276))))

(declare-fun lt!224085 () tuple2!12858)

(declare-fun isPrefixOf!0 (BitStream!5212 BitStream!5212) Bool)

(assert (=> b!144486 (= res!120729 (isPrefixOf!0 (_2!6775 lt!224095) (_2!6775 lt!224085)))))

(declare-fun b!144487 () Bool)

(declare-fun res!120724 () Bool)

(declare-fun e!96272 () Bool)

(assert (=> b!144487 (=> (not res!120724) (not e!96272))))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!144487 (= res!120724 (bvslt from!447 to!404))))

(declare-fun b!144488 () Bool)

(declare-fun e!96280 () Bool)

(assert (=> b!144488 (= e!96280 e!96276)))

(declare-fun res!120735 () Bool)

(assert (=> b!144488 (=> (not res!120735) (not e!96276))))

(declare-fun lt!224092 () (_ BitVec 64))

(assert (=> b!144488 (= res!120735 (= (bitIndex!0 (size!2977 (buf!3416 (_2!6775 lt!224085))) (currentByte!6306 (_2!6775 lt!224085)) (currentBit!6301 (_2!6775 lt!224085))) (bvadd (bitIndex!0 (size!2977 (buf!3416 (_2!6775 lt!224095))) (currentByte!6306 (_2!6775 lt!224095)) (currentBit!6301 (_2!6775 lt!224095))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!224092))))))

(assert (=> b!144488 (= lt!224092 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!144489 () Bool)

(declare-fun e!96278 () Bool)

(assert (=> b!144489 (= e!96276 (not e!96278))))

(declare-fun res!120730 () Bool)

(assert (=> b!144489 (=> res!120730 e!96278)))

(declare-fun arr!237 () array!6578)

(declare-datatypes ((tuple2!12860 0))(
  ( (tuple2!12861 (_1!6776 BitStream!5212) (_2!6776 array!6578)) )
))
(declare-fun lt!224094 () tuple2!12860)

(declare-datatypes ((tuple2!12862 0))(
  ( (tuple2!12863 (_1!6777 BitStream!5212) (_2!6777 BitStream!5212)) )
))
(declare-fun lt!224099 () tuple2!12862)

(assert (=> b!144489 (= res!120730 (or (not (= (size!2977 (_2!6776 lt!224094)) (size!2977 arr!237))) (not (= (_1!6776 lt!224094) (_2!6777 lt!224099)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!5212 array!6578 (_ BitVec 32) (_ BitVec 32)) tuple2!12860)

(assert (=> b!144489 (= lt!224094 (readByteArrayLoopPure!0 (_1!6777 lt!224099) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!144489 (validate_offset_bits!1 ((_ sign_extend 32) (size!2977 (buf!3416 (_2!6775 lt!224085)))) ((_ sign_extend 32) (currentByte!6306 (_2!6775 lt!224095))) ((_ sign_extend 32) (currentBit!6301 (_2!6775 lt!224095))) lt!224092)))

(declare-fun lt!224096 () Unit!9027)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5212 array!6578 (_ BitVec 64)) Unit!9027)

(assert (=> b!144489 (= lt!224096 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6775 lt!224095) (buf!3416 (_2!6775 lt!224085)) lt!224092))))

(declare-fun reader!0 (BitStream!5212 BitStream!5212) tuple2!12862)

(assert (=> b!144489 (= lt!224099 (reader!0 (_2!6775 lt!224095) (_2!6775 lt!224085)))))

(declare-fun b!144490 () Bool)

(declare-fun e!96277 () Bool)

(declare-datatypes ((tuple2!12864 0))(
  ( (tuple2!12865 (_1!6778 BitStream!5212) (_2!6778 (_ BitVec 8))) )
))
(declare-fun lt!224097 () tuple2!12864)

(declare-fun lt!224101 () tuple2!12864)

(assert (=> b!144490 (= e!96277 (= (_2!6778 lt!224097) (_2!6778 lt!224101)))))

(declare-fun res!120728 () Bool)

(assert (=> start!27986 (=> (not res!120728) (not e!96272))))

(assert (=> start!27986 (= res!120728 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2977 arr!237))))))

(assert (=> start!27986 e!96272))

(assert (=> start!27986 true))

(declare-fun array_inv!2766 (array!6578) Bool)

(assert (=> start!27986 (array_inv!2766 arr!237)))

(declare-fun e!96279 () Bool)

(declare-fun inv!12 (BitStream!5212) Bool)

(assert (=> start!27986 (and (inv!12 thiss!1634) e!96279)))

(declare-fun b!144491 () Bool)

(declare-fun arrayRangesEq!293 (array!6578 array!6578 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!144491 (= e!96278 (not (arrayRangesEq!293 arr!237 (_2!6776 lt!224094) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!144492 () Bool)

(declare-fun res!120725 () Bool)

(assert (=> b!144492 (=> (not res!120725) (not e!96272))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!144492 (= res!120725 (invariant!0 (currentBit!6301 thiss!1634) (currentByte!6306 thiss!1634) (size!2977 (buf!3416 thiss!1634))))))

(declare-fun b!144493 () Bool)

(declare-fun res!120723 () Bool)

(assert (=> b!144493 (=> (not res!120723) (not e!96273))))

(assert (=> b!144493 (= res!120723 (isPrefixOf!0 thiss!1634 (_2!6775 lt!224095)))))

(declare-fun b!144494 () Bool)

(assert (=> b!144494 (= e!96279 (array_inv!2766 (buf!3416 thiss!1634)))))

(declare-fun lt!224091 () tuple2!12862)

(declare-fun b!144495 () Bool)

(declare-fun e!96275 () Bool)

(assert (=> b!144495 (= e!96275 (= (_1!6776 (readByteArrayLoopPure!0 (_1!6777 lt!224091) arr!237 from!447 to!404)) (_2!6777 lt!224091)))))

(declare-fun lt!224086 () tuple2!12864)

(declare-fun lt!224090 () tuple2!12862)

(declare-fun b!144496 () Bool)

(assert (=> b!144496 (= e!96273 (and (= (_2!6778 lt!224086) (select (arr!3710 arr!237) from!447)) (= (_1!6778 lt!224086) (_2!6777 lt!224090))))))

(declare-fun readBytePure!0 (BitStream!5212) tuple2!12864)

(assert (=> b!144496 (= lt!224086 (readBytePure!0 (_1!6777 lt!224090)))))

(assert (=> b!144496 (= lt!224090 (reader!0 thiss!1634 (_2!6775 lt!224095)))))

(declare-fun b!144497 () Bool)

(declare-fun e!96281 () Bool)

(assert (=> b!144497 (= e!96281 (invariant!0 (currentBit!6301 thiss!1634) (currentByte!6306 thiss!1634) (size!2977 (buf!3416 (_2!6775 lt!224095)))))))

(declare-fun b!144498 () Bool)

(declare-fun res!120734 () Bool)

(assert (=> b!144498 (=> (not res!120734) (not e!96272))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!144498 (= res!120734 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2977 (buf!3416 thiss!1634))) ((_ sign_extend 32) (currentByte!6306 thiss!1634)) ((_ sign_extend 32) (currentBit!6301 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!144499 () Bool)

(declare-fun lt!224103 () (_ BitVec 32))

(declare-fun lt!224102 () (_ BitVec 32))

(assert (=> b!144499 (= e!96272 (not (or (= lt!224103 #b00000000000000000000000000000000) (= lt!224103 (bvand lt!224102 #b10000000000000000000000000000000)))))))

(assert (=> b!144499 (= lt!224103 (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000))))

(assert (=> b!144499 e!96275))

(declare-fun res!120736 () Bool)

(assert (=> b!144499 (=> (not res!120736) (not e!96275))))

(assert (=> b!144499 (= res!120736 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2977 (buf!3416 (_2!6775 lt!224085)))) ((_ sign_extend 32) (currentByte!6306 thiss!1634)) ((_ sign_extend 32) (currentBit!6301 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun lt!224087 () Unit!9027)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!5212 array!6578 (_ BitVec 32)) Unit!9027)

(assert (=> b!144499 (= lt!224087 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3416 (_2!6775 lt!224085)) (bvsub to!404 from!447)))))

(assert (=> b!144499 (= (_2!6778 (readBytePure!0 (_1!6777 lt!224091))) (select (arr!3710 arr!237) from!447))))

(declare-fun lt!224098 () tuple2!12862)

(assert (=> b!144499 (= lt!224098 (reader!0 (_2!6775 lt!224095) (_2!6775 lt!224085)))))

(assert (=> b!144499 (= lt!224091 (reader!0 thiss!1634 (_2!6775 lt!224085)))))

(assert (=> b!144499 e!96277))

(declare-fun res!120733 () Bool)

(assert (=> b!144499 (=> (not res!120733) (not e!96277))))

(assert (=> b!144499 (= res!120733 (= (bitIndex!0 (size!2977 (buf!3416 (_1!6778 lt!224097))) (currentByte!6306 (_1!6778 lt!224097)) (currentBit!6301 (_1!6778 lt!224097))) (bitIndex!0 (size!2977 (buf!3416 (_1!6778 lt!224101))) (currentByte!6306 (_1!6778 lt!224101)) (currentBit!6301 (_1!6778 lt!224101)))))))

(declare-fun lt!224089 () Unit!9027)

(declare-fun lt!224100 () BitStream!5212)

(declare-fun readBytePrefixLemma!0 (BitStream!5212 BitStream!5212) Unit!9027)

(assert (=> b!144499 (= lt!224089 (readBytePrefixLemma!0 lt!224100 (_2!6775 lt!224085)))))

(assert (=> b!144499 (= lt!224101 (readBytePure!0 (BitStream!5213 (buf!3416 (_2!6775 lt!224085)) (currentByte!6306 thiss!1634) (currentBit!6301 thiss!1634))))))

(assert (=> b!144499 (= lt!224097 (readBytePure!0 lt!224100))))

(assert (=> b!144499 (= lt!224100 (BitStream!5213 (buf!3416 (_2!6775 lt!224095)) (currentByte!6306 thiss!1634) (currentBit!6301 thiss!1634)))))

(assert (=> b!144499 e!96281))

(declare-fun res!120726 () Bool)

(assert (=> b!144499 (=> (not res!120726) (not e!96281))))

(assert (=> b!144499 (= res!120726 (isPrefixOf!0 thiss!1634 (_2!6775 lt!224085)))))

(declare-fun lt!224093 () Unit!9027)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5212 BitStream!5212 BitStream!5212) Unit!9027)

(assert (=> b!144499 (= lt!224093 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6775 lt!224095) (_2!6775 lt!224085)))))

(assert (=> b!144499 e!96280))

(declare-fun res!120727 () Bool)

(assert (=> b!144499 (=> (not res!120727) (not e!96280))))

(assert (=> b!144499 (= res!120727 (= (size!2977 (buf!3416 (_2!6775 lt!224095))) (size!2977 (buf!3416 (_2!6775 lt!224085)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5212 array!6578 (_ BitVec 32) (_ BitVec 32)) tuple2!12858)

(assert (=> b!144499 (= lt!224085 (appendByteArrayLoop!0 (_2!6775 lt!224095) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!144499 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2977 (buf!3416 (_2!6775 lt!224095)))) ((_ sign_extend 32) (currentByte!6306 (_2!6775 lt!224095))) ((_ sign_extend 32) (currentBit!6301 (_2!6775 lt!224095))) lt!224102)))

(assert (=> b!144499 (= lt!224102 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!224088 () Unit!9027)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5212 BitStream!5212 (_ BitVec 64) (_ BitVec 32)) Unit!9027)

(assert (=> b!144499 (= lt!224088 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6775 lt!224095) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!144499 e!96273))

(declare-fun res!120732 () Bool)

(assert (=> b!144499 (=> (not res!120732) (not e!96273))))

(assert (=> b!144499 (= res!120732 (= (size!2977 (buf!3416 thiss!1634)) (size!2977 (buf!3416 (_2!6775 lt!224095)))))))

(declare-fun appendByte!0 (BitStream!5212 (_ BitVec 8)) tuple2!12858)

(assert (=> b!144499 (= lt!224095 (appendByte!0 thiss!1634 (select (arr!3710 arr!237) from!447)))))

(assert (= (and start!27986 res!120728) b!144498))

(assert (= (and b!144498 res!120734) b!144487))

(assert (= (and b!144487 res!120724) b!144492))

(assert (= (and b!144492 res!120725) b!144499))

(assert (= (and b!144499 res!120732) b!144485))

(assert (= (and b!144485 res!120731) b!144493))

(assert (= (and b!144493 res!120723) b!144496))

(assert (= (and b!144499 res!120727) b!144488))

(assert (= (and b!144488 res!120735) b!144486))

(assert (= (and b!144486 res!120729) b!144489))

(assert (= (and b!144489 (not res!120730)) b!144491))

(assert (= (and b!144499 res!120726) b!144497))

(assert (= (and b!144499 res!120733) b!144490))

(assert (= (and b!144499 res!120736) b!144495))

(assert (= start!27986 b!144494))

(declare-fun m!222221 () Bool)

(assert (=> b!144485 m!222221))

(declare-fun m!222223 () Bool)

(assert (=> b!144485 m!222223))

(declare-fun m!222225 () Bool)

(assert (=> b!144496 m!222225))

(declare-fun m!222227 () Bool)

(assert (=> b!144496 m!222227))

(declare-fun m!222229 () Bool)

(assert (=> b!144496 m!222229))

(declare-fun m!222231 () Bool)

(assert (=> b!144492 m!222231))

(declare-fun m!222233 () Bool)

(assert (=> b!144488 m!222233))

(assert (=> b!144488 m!222221))

(declare-fun m!222235 () Bool)

(assert (=> start!27986 m!222235))

(declare-fun m!222237 () Bool)

(assert (=> start!27986 m!222237))

(declare-fun m!222239 () Bool)

(assert (=> b!144495 m!222239))

(declare-fun m!222241 () Bool)

(assert (=> b!144497 m!222241))

(declare-fun m!222243 () Bool)

(assert (=> b!144486 m!222243))

(declare-fun m!222245 () Bool)

(assert (=> b!144499 m!222245))

(declare-fun m!222247 () Bool)

(assert (=> b!144499 m!222247))

(declare-fun m!222249 () Bool)

(assert (=> b!144499 m!222249))

(declare-fun m!222251 () Bool)

(assert (=> b!144499 m!222251))

(declare-fun m!222253 () Bool)

(assert (=> b!144499 m!222253))

(declare-fun m!222255 () Bool)

(assert (=> b!144499 m!222255))

(declare-fun m!222257 () Bool)

(assert (=> b!144499 m!222257))

(declare-fun m!222259 () Bool)

(assert (=> b!144499 m!222259))

(declare-fun m!222261 () Bool)

(assert (=> b!144499 m!222261))

(declare-fun m!222263 () Bool)

(assert (=> b!144499 m!222263))

(declare-fun m!222265 () Bool)

(assert (=> b!144499 m!222265))

(assert (=> b!144499 m!222225))

(declare-fun m!222267 () Bool)

(assert (=> b!144499 m!222267))

(declare-fun m!222269 () Bool)

(assert (=> b!144499 m!222269))

(declare-fun m!222271 () Bool)

(assert (=> b!144499 m!222271))

(declare-fun m!222273 () Bool)

(assert (=> b!144499 m!222273))

(declare-fun m!222275 () Bool)

(assert (=> b!144499 m!222275))

(assert (=> b!144499 m!222225))

(declare-fun m!222277 () Bool)

(assert (=> b!144489 m!222277))

(declare-fun m!222279 () Bool)

(assert (=> b!144489 m!222279))

(declare-fun m!222281 () Bool)

(assert (=> b!144489 m!222281))

(assert (=> b!144489 m!222261))

(declare-fun m!222283 () Bool)

(assert (=> b!144494 m!222283))

(declare-fun m!222285 () Bool)

(assert (=> b!144491 m!222285))

(declare-fun m!222287 () Bool)

(assert (=> b!144493 m!222287))

(declare-fun m!222289 () Bool)

(assert (=> b!144498 m!222289))

(push 1)

(assert (not b!144486))

(assert (not b!144489))

(assert (not b!144497))

(assert (not b!144491))

(assert (not b!144493))

(assert (not b!144498))

(assert (not b!144485))

(assert (not b!144492))

(assert (not b!144495))

(assert (not b!144499))

(assert (not start!27986))

(assert (not b!144488))

(assert (not b!144494))

(assert (not b!144496))

(check-sat)

(pop 1)

(push 1)

(check-sat)

