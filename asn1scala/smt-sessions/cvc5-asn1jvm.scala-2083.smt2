; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52754 () Bool)

(assert start!52754)

(declare-fun b!244201 () Bool)

(declare-fun e!169261 () Bool)

(declare-datatypes ((array!13373 0))(
  ( (array!13374 (arr!6850 (Array (_ BitVec 32) (_ BitVec 8))) (size!5863 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10648 0))(
  ( (BitStream!10649 (buf!6335 array!13373) (currentByte!11713 (_ BitVec 32)) (currentBit!11708 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!20940 0))(
  ( (tuple2!20941 (_1!11392 BitStream!10648) (_2!11392 Bool)) )
))
(declare-fun lt!380615 () tuple2!20940)

(declare-fun lt!380605 () tuple2!20940)

(assert (=> b!244201 (= e!169261 (= (_2!11392 lt!380615) (_2!11392 lt!380605)))))

(declare-fun b!244202 () Bool)

(declare-fun e!169253 () Bool)

(declare-fun e!169258 () Bool)

(assert (=> b!244202 (= e!169253 e!169258)))

(declare-fun res!204086 () Bool)

(assert (=> b!244202 (=> (not res!204086) (not e!169258))))

(declare-fun lt!380613 () tuple2!20940)

(declare-datatypes ((Unit!17821 0))(
  ( (Unit!17822) )
))
(declare-datatypes ((tuple2!20942 0))(
  ( (tuple2!20943 (_1!11393 Unit!17821) (_2!11393 BitStream!10648)) )
))
(declare-fun lt!380618 () tuple2!20942)

(declare-fun bit!26 () Bool)

(assert (=> b!244202 (= res!204086 (and (= (_2!11392 lt!380613) bit!26) (= (_1!11392 lt!380613) (_2!11393 lt!380618))))))

(declare-fun thiss!1005 () BitStream!10648)

(declare-fun readBitPure!0 (BitStream!10648) tuple2!20940)

(declare-fun readerFrom!0 (BitStream!10648 (_ BitVec 32) (_ BitVec 32)) BitStream!10648)

(assert (=> b!244202 (= lt!380613 (readBitPure!0 (readerFrom!0 (_2!11393 lt!380618) (currentBit!11708 thiss!1005) (currentByte!11713 thiss!1005))))))

(declare-fun b!244203 () Bool)

(declare-fun e!169262 () Bool)

(declare-fun lt!380614 () tuple2!20940)

(declare-datatypes ((tuple2!20944 0))(
  ( (tuple2!20945 (_1!11394 BitStream!10648) (_2!11394 BitStream!10648)) )
))
(declare-fun lt!380621 () tuple2!20944)

(assert (=> b!244203 (= e!169262 (not (or (not (_2!11392 lt!380614)) (not (= (_1!11392 lt!380614) (_2!11394 lt!380621))))))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun checkBitsLoopPure!0 (BitStream!10648 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20940)

(assert (=> b!244203 (= lt!380614 (checkBitsLoopPure!0 (_1!11394 lt!380621) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!380619 () tuple2!20942)

(declare-fun lt!380622 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!244203 (validate_offset_bits!1 ((_ sign_extend 32) (size!5863 (buf!6335 (_2!11393 lt!380619)))) ((_ sign_extend 32) (currentByte!11713 (_2!11393 lt!380618))) ((_ sign_extend 32) (currentBit!11708 (_2!11393 lt!380618))) lt!380622)))

(declare-fun lt!380608 () Unit!17821)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10648 array!13373 (_ BitVec 64)) Unit!17821)

(assert (=> b!244203 (= lt!380608 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11393 lt!380618) (buf!6335 (_2!11393 lt!380619)) lt!380622))))

(declare-fun reader!0 (BitStream!10648 BitStream!10648) tuple2!20944)

(assert (=> b!244203 (= lt!380621 (reader!0 (_2!11393 lt!380618) (_2!11393 lt!380619)))))

(declare-fun b!244204 () Bool)

(declare-fun lt!380610 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!244204 (= e!169258 (= (bitIndex!0 (size!5863 (buf!6335 (_1!11392 lt!380613))) (currentByte!11713 (_1!11392 lt!380613)) (currentBit!11708 (_1!11392 lt!380613))) lt!380610))))

(declare-fun res!204084 () Bool)

(declare-fun e!169255 () Bool)

(assert (=> start!52754 (=> (not res!204084) (not e!169255))))

(assert (=> start!52754 (= res!204084 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52754 e!169255))

(assert (=> start!52754 true))

(declare-fun e!169259 () Bool)

(declare-fun inv!12 (BitStream!10648) Bool)

(assert (=> start!52754 (and (inv!12 thiss!1005) e!169259)))

(declare-fun b!244205 () Bool)

(declare-fun res!204090 () Bool)

(assert (=> b!244205 (=> (not res!204090) (not e!169255))))

(assert (=> b!244205 (= res!204090 (validate_offset_bits!1 ((_ sign_extend 32) (size!5863 (buf!6335 thiss!1005))) ((_ sign_extend 32) (currentByte!11713 thiss!1005)) ((_ sign_extend 32) (currentBit!11708 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!244206 () Bool)

(declare-fun e!169260 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!244206 (= e!169260 (invariant!0 (currentBit!11708 thiss!1005) (currentByte!11713 thiss!1005) (size!5863 (buf!6335 (_2!11393 lt!380619)))))))

(declare-fun b!244207 () Bool)

(declare-fun res!204094 () Bool)

(assert (=> b!244207 (=> (not res!204094) (not e!169255))))

(assert (=> b!244207 (= res!204094 (bvslt from!289 nBits!297))))

(declare-fun b!244208 () Bool)

(declare-fun res!204092 () Bool)

(assert (=> b!244208 (=> (not res!204092) (not e!169253))))

(declare-fun isPrefixOf!0 (BitStream!10648 BitStream!10648) Bool)

(assert (=> b!244208 (= res!204092 (isPrefixOf!0 thiss!1005 (_2!11393 lt!380618)))))

(declare-fun b!244209 () Bool)

(declare-fun e!169256 () Bool)

(assert (=> b!244209 (= e!169256 e!169262)))

(declare-fun res!204096 () Bool)

(assert (=> b!244209 (=> (not res!204096) (not e!169262))))

(assert (=> b!244209 (= res!204096 (= (bitIndex!0 (size!5863 (buf!6335 (_2!11393 lt!380619))) (currentByte!11713 (_2!11393 lt!380619)) (currentBit!11708 (_2!11393 lt!380619))) (bvadd (bitIndex!0 (size!5863 (buf!6335 (_2!11393 lt!380618))) (currentByte!11713 (_2!11393 lt!380618)) (currentBit!11708 (_2!11393 lt!380618))) lt!380622)))))

(assert (=> b!244209 (= lt!380622 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!244210 () Bool)

(declare-fun e!169257 () Bool)

(assert (=> b!244210 (= e!169257 e!169253)))

(declare-fun res!204093 () Bool)

(assert (=> b!244210 (=> (not res!204093) (not e!169253))))

(declare-fun lt!380604 () (_ BitVec 64))

(assert (=> b!244210 (= res!204093 (= lt!380610 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!380604)))))

(assert (=> b!244210 (= lt!380610 (bitIndex!0 (size!5863 (buf!6335 (_2!11393 lt!380618))) (currentByte!11713 (_2!11393 lt!380618)) (currentBit!11708 (_2!11393 lt!380618))))))

(assert (=> b!244210 (= lt!380604 (bitIndex!0 (size!5863 (buf!6335 thiss!1005)) (currentByte!11713 thiss!1005) (currentBit!11708 thiss!1005)))))

(declare-fun b!244211 () Bool)

(declare-fun res!204088 () Bool)

(assert (=> b!244211 (=> (not res!204088) (not e!169262))))

(assert (=> b!244211 (= res!204088 (isPrefixOf!0 (_2!11393 lt!380618) (_2!11393 lt!380619)))))

(declare-fun b!244212 () Bool)

(declare-fun res!204091 () Bool)

(assert (=> b!244212 (=> (not res!204091) (not e!169260))))

(assert (=> b!244212 (= res!204091 (invariant!0 (currentBit!11708 thiss!1005) (currentByte!11713 thiss!1005) (size!5863 (buf!6335 (_2!11393 lt!380618)))))))

(declare-fun b!244213 () Bool)

(assert (=> b!244213 (= e!169255 (not true))))

(declare-fun lt!380606 () tuple2!20944)

(declare-fun lt!380620 () tuple2!20940)

(assert (=> b!244213 (= lt!380620 (checkBitsLoopPure!0 (_1!11394 lt!380606) nBits!297 bit!26 from!289))))

(assert (=> b!244213 (validate_offset_bits!1 ((_ sign_extend 32) (size!5863 (buf!6335 (_2!11393 lt!380619)))) ((_ sign_extend 32) (currentByte!11713 thiss!1005)) ((_ sign_extend 32) (currentBit!11708 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!380617 () Unit!17821)

(assert (=> b!244213 (= lt!380617 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6335 (_2!11393 lt!380619)) (bvsub nBits!297 from!289)))))

(assert (=> b!244213 (= (_2!11392 (readBitPure!0 (_1!11394 lt!380606))) bit!26)))

(declare-fun lt!380611 () tuple2!20944)

(assert (=> b!244213 (= lt!380611 (reader!0 (_2!11393 lt!380618) (_2!11393 lt!380619)))))

(assert (=> b!244213 (= lt!380606 (reader!0 thiss!1005 (_2!11393 lt!380619)))))

(assert (=> b!244213 e!169261))

(declare-fun res!204085 () Bool)

(assert (=> b!244213 (=> (not res!204085) (not e!169261))))

(assert (=> b!244213 (= res!204085 (= (bitIndex!0 (size!5863 (buf!6335 (_1!11392 lt!380615))) (currentByte!11713 (_1!11392 lt!380615)) (currentBit!11708 (_1!11392 lt!380615))) (bitIndex!0 (size!5863 (buf!6335 (_1!11392 lt!380605))) (currentByte!11713 (_1!11392 lt!380605)) (currentBit!11708 (_1!11392 lt!380605)))))))

(declare-fun lt!380609 () Unit!17821)

(declare-fun lt!380616 () BitStream!10648)

(declare-fun readBitPrefixLemma!0 (BitStream!10648 BitStream!10648) Unit!17821)

(assert (=> b!244213 (= lt!380609 (readBitPrefixLemma!0 lt!380616 (_2!11393 lt!380619)))))

(assert (=> b!244213 (= lt!380605 (readBitPure!0 (BitStream!10649 (buf!6335 (_2!11393 lt!380619)) (currentByte!11713 thiss!1005) (currentBit!11708 thiss!1005))))))

(assert (=> b!244213 (= lt!380615 (readBitPure!0 lt!380616))))

(assert (=> b!244213 (= lt!380616 (BitStream!10649 (buf!6335 (_2!11393 lt!380618)) (currentByte!11713 thiss!1005) (currentBit!11708 thiss!1005)))))

(assert (=> b!244213 e!169260))

(declare-fun res!204089 () Bool)

(assert (=> b!244213 (=> (not res!204089) (not e!169260))))

(assert (=> b!244213 (= res!204089 (isPrefixOf!0 thiss!1005 (_2!11393 lt!380619)))))

(declare-fun lt!380607 () Unit!17821)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10648 BitStream!10648 BitStream!10648) Unit!17821)

(assert (=> b!244213 (= lt!380607 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11393 lt!380618) (_2!11393 lt!380619)))))

(assert (=> b!244213 e!169256))

(declare-fun res!204095 () Bool)

(assert (=> b!244213 (=> (not res!204095) (not e!169256))))

(assert (=> b!244213 (= res!204095 (= (size!5863 (buf!6335 (_2!11393 lt!380618))) (size!5863 (buf!6335 (_2!11393 lt!380619)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10648 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20942)

(assert (=> b!244213 (= lt!380619 (appendNBitsLoop!0 (_2!11393 lt!380618) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!244213 (validate_offset_bits!1 ((_ sign_extend 32) (size!5863 (buf!6335 (_2!11393 lt!380618)))) ((_ sign_extend 32) (currentByte!11713 (_2!11393 lt!380618))) ((_ sign_extend 32) (currentBit!11708 (_2!11393 lt!380618))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!380612 () Unit!17821)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10648 BitStream!10648 (_ BitVec 64) (_ BitVec 64)) Unit!17821)

(assert (=> b!244213 (= lt!380612 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11393 lt!380618) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!244213 e!169257))

(declare-fun res!204087 () Bool)

(assert (=> b!244213 (=> (not res!204087) (not e!169257))))

(assert (=> b!244213 (= res!204087 (= (size!5863 (buf!6335 thiss!1005)) (size!5863 (buf!6335 (_2!11393 lt!380618)))))))

(declare-fun appendBit!0 (BitStream!10648 Bool) tuple2!20942)

(assert (=> b!244213 (= lt!380618 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!244214 () Bool)

(declare-fun array_inv!5604 (array!13373) Bool)

(assert (=> b!244214 (= e!169259 (array_inv!5604 (buf!6335 thiss!1005)))))

(assert (= (and start!52754 res!204084) b!244205))

(assert (= (and b!244205 res!204090) b!244207))

(assert (= (and b!244207 res!204094) b!244213))

(assert (= (and b!244213 res!204087) b!244210))

(assert (= (and b!244210 res!204093) b!244208))

(assert (= (and b!244208 res!204092) b!244202))

(assert (= (and b!244202 res!204086) b!244204))

(assert (= (and b!244213 res!204095) b!244209))

(assert (= (and b!244209 res!204096) b!244211))

(assert (= (and b!244211 res!204088) b!244203))

(assert (= (and b!244213 res!204089) b!244212))

(assert (= (and b!244212 res!204091) b!244206))

(assert (= (and b!244213 res!204085) b!244201))

(assert (= start!52754 b!244214))

(declare-fun m!368021 () Bool)

(assert (=> b!244208 m!368021))

(declare-fun m!368023 () Bool)

(assert (=> b!244209 m!368023))

(declare-fun m!368025 () Bool)

(assert (=> b!244209 m!368025))

(declare-fun m!368027 () Bool)

(assert (=> b!244203 m!368027))

(declare-fun m!368029 () Bool)

(assert (=> b!244203 m!368029))

(declare-fun m!368031 () Bool)

(assert (=> b!244203 m!368031))

(declare-fun m!368033 () Bool)

(assert (=> b!244203 m!368033))

(declare-fun m!368035 () Bool)

(assert (=> b!244213 m!368035))

(declare-fun m!368037 () Bool)

(assert (=> b!244213 m!368037))

(declare-fun m!368039 () Bool)

(assert (=> b!244213 m!368039))

(declare-fun m!368041 () Bool)

(assert (=> b!244213 m!368041))

(declare-fun m!368043 () Bool)

(assert (=> b!244213 m!368043))

(declare-fun m!368045 () Bool)

(assert (=> b!244213 m!368045))

(declare-fun m!368047 () Bool)

(assert (=> b!244213 m!368047))

(declare-fun m!368049 () Bool)

(assert (=> b!244213 m!368049))

(declare-fun m!368051 () Bool)

(assert (=> b!244213 m!368051))

(declare-fun m!368053 () Bool)

(assert (=> b!244213 m!368053))

(declare-fun m!368055 () Bool)

(assert (=> b!244213 m!368055))

(declare-fun m!368057 () Bool)

(assert (=> b!244213 m!368057))

(declare-fun m!368059 () Bool)

(assert (=> b!244213 m!368059))

(declare-fun m!368061 () Bool)

(assert (=> b!244213 m!368061))

(declare-fun m!368063 () Bool)

(assert (=> b!244213 m!368063))

(assert (=> b!244213 m!368033))

(declare-fun m!368065 () Bool)

(assert (=> b!244213 m!368065))

(declare-fun m!368067 () Bool)

(assert (=> start!52754 m!368067))

(declare-fun m!368069 () Bool)

(assert (=> b!244206 m!368069))

(declare-fun m!368071 () Bool)

(assert (=> b!244212 m!368071))

(declare-fun m!368073 () Bool)

(assert (=> b!244205 m!368073))

(declare-fun m!368075 () Bool)

(assert (=> b!244202 m!368075))

(assert (=> b!244202 m!368075))

(declare-fun m!368077 () Bool)

(assert (=> b!244202 m!368077))

(declare-fun m!368079 () Bool)

(assert (=> b!244214 m!368079))

(declare-fun m!368081 () Bool)

(assert (=> b!244211 m!368081))

(assert (=> b!244210 m!368025))

(declare-fun m!368083 () Bool)

(assert (=> b!244210 m!368083))

(declare-fun m!368085 () Bool)

(assert (=> b!244204 m!368085))

(push 1)

(assert (not b!244212))

(assert (not b!244205))

(assert (not b!244213))

(assert (not start!52754))

(assert (not b!244209))

(assert (not b!244214))

(assert (not b!244206))

(assert (not b!244211))

(assert (not b!244204))

(assert (not b!244210))

(assert (not b!244202))

(assert (not b!244208))

(assert (not b!244203))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

