; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24152 () Bool)

(assert start!24152)

(declare-fun b!122112 () Bool)

(declare-fun e!79975 () Bool)

(declare-fun e!79974 () Bool)

(assert (=> b!122112 (= e!79975 e!79974)))

(declare-fun res!101162 () Bool)

(assert (=> b!122112 (=> (not res!101162) (not e!79974))))

(declare-datatypes ((array!5402 0))(
  ( (array!5403 (arr!3036 (Array (_ BitVec 32) (_ BitVec 8))) (size!2443 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4360 0))(
  ( (BitStream!4361 (buf!2883 array!5402) (currentByte!5580 (_ BitVec 32)) (currentBit!5575 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4360)

(declare-fun lt!191929 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!122112 (= res!101162 (validate_offset_bits!1 ((_ sign_extend 32) (size!2443 (buf!2883 thiss!1305))) ((_ sign_extend 32) (currentByte!5580 thiss!1305)) ((_ sign_extend 32) (currentBit!5575 thiss!1305)) lt!191929))))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!122112 (= lt!191929 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!122113 () Bool)

(declare-fun res!101169 () Bool)

(declare-fun e!79977 () Bool)

(assert (=> b!122113 (=> (not res!101169) (not e!79977))))

(declare-datatypes ((Unit!7525 0))(
  ( (Unit!7526) )
))
(declare-datatypes ((tuple2!10264 0))(
  ( (tuple2!10265 (_1!5397 Unit!7525) (_2!5397 BitStream!4360)) )
))
(declare-fun lt!191908 () tuple2!10264)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!122113 (= res!101169 (invariant!0 (currentBit!5575 thiss!1305) (currentByte!5580 thiss!1305) (size!2443 (buf!2883 (_2!5397 lt!191908)))))))

(declare-fun b!122114 () Bool)

(declare-fun res!101160 () Bool)

(assert (=> b!122114 (=> (not res!101160) (not e!79974))))

(assert (=> b!122114 (= res!101160 (bvslt i!615 nBits!396))))

(declare-datatypes ((tuple2!10266 0))(
  ( (tuple2!10267 (_1!5398 BitStream!4360) (_2!5398 (_ BitVec 64))) )
))
(declare-fun lt!191911 () tuple2!10266)

(declare-fun lt!191922 () (_ BitVec 64))

(declare-fun e!79969 () Bool)

(declare-fun lt!191916 () (_ BitVec 64))

(declare-datatypes ((tuple2!10268 0))(
  ( (tuple2!10269 (_1!5399 BitStream!4360) (_2!5399 BitStream!4360)) )
))
(declare-fun lt!191909 () tuple2!10268)

(declare-fun lt!191921 () BitStream!4360)

(declare-fun lt!191913 () tuple2!10266)

(declare-fun lt!191931 () tuple2!10268)

(declare-fun b!122115 () Bool)

(assert (=> b!122115 (= e!79969 (and (= lt!191922 (bvsub lt!191916 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!5399 lt!191909) lt!191921)) (and (= (_2!5398 lt!191911) (_2!5398 lt!191913)) (= (_1!5398 lt!191911) (_2!5399 lt!191931))))))))

(declare-fun b!122116 () Bool)

(declare-fun e!79968 () Bool)

(declare-fun array_inv!2245 (array!5402) Bool)

(assert (=> b!122116 (= e!79968 (array_inv!2245 (buf!2883 thiss!1305)))))

(declare-fun b!122117 () Bool)

(declare-fun e!79971 () Bool)

(declare-fun e!79970 () Bool)

(assert (=> b!122117 (= e!79971 e!79970)))

(declare-fun res!101157 () Bool)

(assert (=> b!122117 (=> (not res!101157) (not e!79970))))

(declare-datatypes ((tuple2!10270 0))(
  ( (tuple2!10271 (_1!5400 BitStream!4360) (_2!5400 Bool)) )
))
(declare-fun lt!191927 () tuple2!10270)

(declare-fun lt!191928 () Bool)

(assert (=> b!122117 (= res!101157 (and (= (_2!5400 lt!191927) lt!191928) (= (_1!5400 lt!191927) (_2!5397 lt!191908))))))

(declare-fun readBitPure!0 (BitStream!4360) tuple2!10270)

(declare-fun readerFrom!0 (BitStream!4360 (_ BitVec 32) (_ BitVec 32)) BitStream!4360)

(assert (=> b!122117 (= lt!191927 (readBitPure!0 (readerFrom!0 (_2!5397 lt!191908) (currentBit!5575 thiss!1305) (currentByte!5580 thiss!1305))))))

(declare-fun b!122118 () Bool)

(declare-fun res!101168 () Bool)

(assert (=> b!122118 (=> (not res!101168) (not e!79974))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!122118 (= res!101168 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun e!79967 () Bool)

(declare-fun lt!191917 () tuple2!10264)

(declare-fun lt!191915 () (_ BitVec 64))

(declare-fun b!122120 () Bool)

(assert (=> b!122120 (= e!79967 (or (not (= (_1!5399 lt!191909) lt!191921)) (not (= (size!2443 (buf!2883 thiss!1305)) (size!2443 (buf!2883 (_2!5397 lt!191917))))) (not (= lt!191915 (bvadd lt!191922 lt!191929))) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand i!615 #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 i!615) #b10000000000000000000000000000000))))))

(assert (=> b!122120 e!79969))

(declare-fun res!101164 () Bool)

(assert (=> b!122120 (=> (not res!101164) (not e!79969))))

(declare-fun withMovedBitIndex!0 (BitStream!4360 (_ BitVec 64)) BitStream!4360)

(assert (=> b!122120 (= res!101164 (= (_1!5399 lt!191909) (withMovedBitIndex!0 (_2!5399 lt!191909) (bvsub lt!191916 lt!191915))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!122120 (= lt!191916 (bitIndex!0 (size!2443 (buf!2883 (_2!5397 lt!191908))) (currentByte!5580 (_2!5397 lt!191908)) (currentBit!5575 (_2!5397 lt!191908))))))

(assert (=> b!122120 (= (_1!5399 lt!191931) (withMovedBitIndex!0 (_2!5399 lt!191931) (bvsub lt!191922 lt!191915)))))

(assert (=> b!122120 (= lt!191915 (bitIndex!0 (size!2443 (buf!2883 (_2!5397 lt!191917))) (currentByte!5580 (_2!5397 lt!191917)) (currentBit!5575 (_2!5397 lt!191917))))))

(assert (=> b!122120 (= lt!191922 (bitIndex!0 (size!2443 (buf!2883 thiss!1305)) (currentByte!5580 thiss!1305) (currentBit!5575 thiss!1305)))))

(declare-fun lt!191925 () tuple2!10266)

(assert (=> b!122120 (and (= (_2!5398 lt!191911) (_2!5398 lt!191925)) (= (_1!5398 lt!191911) (_1!5398 lt!191925)))))

(declare-fun lt!191914 () (_ BitVec 64))

(declare-fun lt!191904 () Unit!7525)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4360 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!7525)

(assert (=> b!122120 (= lt!191904 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5399 lt!191931) nBits!396 i!615 lt!191914))))

(declare-fun lt!191907 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4360 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!10266)

(assert (=> b!122120 (= lt!191925 (readNLeastSignificantBitsLoopPure!0 lt!191921 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!191907))))

(assert (=> b!122120 (= lt!191921 (withMovedBitIndex!0 (_1!5399 lt!191931) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!122121 () Bool)

(declare-fun lt!191903 () (_ BitVec 64))

(assert (=> b!122121 (= e!79970 (= (bitIndex!0 (size!2443 (buf!2883 (_1!5400 lt!191927))) (currentByte!5580 (_1!5400 lt!191927)) (currentBit!5575 (_1!5400 lt!191927))) lt!191903))))

(declare-fun b!122122 () Bool)

(declare-fun e!79976 () Bool)

(declare-fun lt!191906 () tuple2!10270)

(declare-fun lt!191919 () tuple2!10270)

(assert (=> b!122122 (= e!79976 (= (_2!5400 lt!191906) (_2!5400 lt!191919)))))

(declare-fun b!122123 () Bool)

(declare-fun e!79973 () Bool)

(assert (=> b!122123 (= e!79973 e!79971)))

(declare-fun res!101165 () Bool)

(assert (=> b!122123 (=> (not res!101165) (not e!79971))))

(declare-fun lt!191930 () (_ BitVec 64))

(assert (=> b!122123 (= res!101165 (= lt!191903 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!191930)))))

(assert (=> b!122123 (= lt!191903 (bitIndex!0 (size!2443 (buf!2883 (_2!5397 lt!191908))) (currentByte!5580 (_2!5397 lt!191908)) (currentBit!5575 (_2!5397 lt!191908))))))

(assert (=> b!122123 (= lt!191930 (bitIndex!0 (size!2443 (buf!2883 thiss!1305)) (currentByte!5580 thiss!1305) (currentBit!5575 thiss!1305)))))

(declare-fun b!122124 () Bool)

(declare-fun res!101163 () Bool)

(assert (=> b!122124 (=> (not res!101163) (not e!79971))))

(declare-fun isPrefixOf!0 (BitStream!4360 BitStream!4360) Bool)

(assert (=> b!122124 (= res!101163 (isPrefixOf!0 thiss!1305 (_2!5397 lt!191908)))))

(declare-fun b!122125 () Bool)

(assert (=> b!122125 (= e!79974 (not e!79967))))

(declare-fun res!101167 () Bool)

(assert (=> b!122125 (=> res!101167 e!79967)))

(assert (=> b!122125 (= res!101167 (not (= (_1!5398 lt!191913) (_2!5399 lt!191909))))))

(assert (=> b!122125 (= lt!191913 (readNLeastSignificantBitsLoopPure!0 (_1!5399 lt!191909) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!191907))))

(declare-fun lt!191918 () (_ BitVec 64))

(assert (=> b!122125 (validate_offset_bits!1 ((_ sign_extend 32) (size!2443 (buf!2883 (_2!5397 lt!191917)))) ((_ sign_extend 32) (currentByte!5580 (_2!5397 lt!191908))) ((_ sign_extend 32) (currentBit!5575 (_2!5397 lt!191908))) lt!191918)))

(declare-fun lt!191905 () Unit!7525)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4360 array!5402 (_ BitVec 64)) Unit!7525)

(assert (=> b!122125 (= lt!191905 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5397 lt!191908) (buf!2883 (_2!5397 lt!191917)) lt!191918))))

(assert (=> b!122125 (= lt!191918 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!191910 () (_ BitVec 64))

(declare-fun lt!191923 () tuple2!10270)

(assert (=> b!122125 (= lt!191907 (bvor lt!191914 (ite (_2!5400 lt!191923) lt!191910 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!122125 (= lt!191911 (readNLeastSignificantBitsLoopPure!0 (_1!5399 lt!191931) nBits!396 i!615 lt!191914))))

(assert (=> b!122125 (validate_offset_bits!1 ((_ sign_extend 32) (size!2443 (buf!2883 (_2!5397 lt!191917)))) ((_ sign_extend 32) (currentByte!5580 thiss!1305)) ((_ sign_extend 32) (currentBit!5575 thiss!1305)) lt!191929)))

(declare-fun lt!191926 () Unit!7525)

(assert (=> b!122125 (= lt!191926 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2883 (_2!5397 lt!191917)) lt!191929))))

(assert (=> b!122125 (= lt!191914 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(assert (=> b!122125 (= (_2!5400 lt!191923) lt!191928)))

(assert (=> b!122125 (= lt!191923 (readBitPure!0 (_1!5399 lt!191931)))))

(declare-fun reader!0 (BitStream!4360 BitStream!4360) tuple2!10268)

(assert (=> b!122125 (= lt!191909 (reader!0 (_2!5397 lt!191908) (_2!5397 lt!191917)))))

(assert (=> b!122125 (= lt!191931 (reader!0 thiss!1305 (_2!5397 lt!191917)))))

(assert (=> b!122125 e!79976))

(declare-fun res!101158 () Bool)

(assert (=> b!122125 (=> (not res!101158) (not e!79976))))

(assert (=> b!122125 (= res!101158 (= (bitIndex!0 (size!2443 (buf!2883 (_1!5400 lt!191906))) (currentByte!5580 (_1!5400 lt!191906)) (currentBit!5575 (_1!5400 lt!191906))) (bitIndex!0 (size!2443 (buf!2883 (_1!5400 lt!191919))) (currentByte!5580 (_1!5400 lt!191919)) (currentBit!5575 (_1!5400 lt!191919)))))))

(declare-fun lt!191920 () Unit!7525)

(declare-fun lt!191924 () BitStream!4360)

(declare-fun readBitPrefixLemma!0 (BitStream!4360 BitStream!4360) Unit!7525)

(assert (=> b!122125 (= lt!191920 (readBitPrefixLemma!0 lt!191924 (_2!5397 lt!191917)))))

(assert (=> b!122125 (= lt!191919 (readBitPure!0 (BitStream!4361 (buf!2883 (_2!5397 lt!191917)) (currentByte!5580 thiss!1305) (currentBit!5575 thiss!1305))))))

(assert (=> b!122125 (= lt!191906 (readBitPure!0 lt!191924))))

(assert (=> b!122125 (= lt!191924 (BitStream!4361 (buf!2883 (_2!5397 lt!191908)) (currentByte!5580 thiss!1305) (currentBit!5575 thiss!1305)))))

(assert (=> b!122125 e!79977))

(declare-fun res!101166 () Bool)

(assert (=> b!122125 (=> (not res!101166) (not e!79977))))

(assert (=> b!122125 (= res!101166 (isPrefixOf!0 thiss!1305 (_2!5397 lt!191917)))))

(declare-fun lt!191912 () Unit!7525)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4360 BitStream!4360 BitStream!4360) Unit!7525)

(assert (=> b!122125 (= lt!191912 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5397 lt!191908) (_2!5397 lt!191917)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4360 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!10264)

(assert (=> b!122125 (= lt!191917 (appendNLeastSignificantBitsLoop!0 (_2!5397 lt!191908) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!122125 e!79973))

(declare-fun res!101159 () Bool)

(assert (=> b!122125 (=> (not res!101159) (not e!79973))))

(assert (=> b!122125 (= res!101159 (= (size!2443 (buf!2883 thiss!1305)) (size!2443 (buf!2883 (_2!5397 lt!191908)))))))

(declare-fun appendBit!0 (BitStream!4360 Bool) tuple2!10264)

(assert (=> b!122125 (= lt!191908 (appendBit!0 thiss!1305 lt!191928))))

(assert (=> b!122125 (= lt!191928 (not (= (bvand v!199 lt!191910) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!122125 (= lt!191910 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!122119 () Bool)

(assert (=> b!122119 (= e!79977 (invariant!0 (currentBit!5575 thiss!1305) (currentByte!5580 thiss!1305) (size!2443 (buf!2883 (_2!5397 lt!191917)))))))

(declare-fun res!101161 () Bool)

(assert (=> start!24152 (=> (not res!101161) (not e!79975))))

(assert (=> start!24152 (= res!101161 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!24152 e!79975))

(assert (=> start!24152 true))

(declare-fun inv!12 (BitStream!4360) Bool)

(assert (=> start!24152 (and (inv!12 thiss!1305) e!79968)))

(assert (= (and start!24152 res!101161) b!122112))

(assert (= (and b!122112 res!101162) b!122118))

(assert (= (and b!122118 res!101168) b!122114))

(assert (= (and b!122114 res!101160) b!122125))

(assert (= (and b!122125 res!101159) b!122123))

(assert (= (and b!122123 res!101165) b!122124))

(assert (= (and b!122124 res!101163) b!122117))

(assert (= (and b!122117 res!101157) b!122121))

(assert (= (and b!122125 res!101166) b!122113))

(assert (= (and b!122113 res!101169) b!122119))

(assert (= (and b!122125 res!101158) b!122122))

(assert (= (and b!122125 (not res!101167)) b!122120))

(assert (= (and b!122120 res!101164) b!122115))

(assert (= start!24152 b!122116))

(declare-fun m!185381 () Bool)

(assert (=> b!122124 m!185381))

(declare-fun m!185383 () Bool)

(assert (=> b!122120 m!185383))

(declare-fun m!185385 () Bool)

(assert (=> b!122120 m!185385))

(declare-fun m!185387 () Bool)

(assert (=> b!122120 m!185387))

(declare-fun m!185389 () Bool)

(assert (=> b!122120 m!185389))

(declare-fun m!185391 () Bool)

(assert (=> b!122120 m!185391))

(declare-fun m!185393 () Bool)

(assert (=> b!122120 m!185393))

(declare-fun m!185395 () Bool)

(assert (=> b!122120 m!185395))

(declare-fun m!185397 () Bool)

(assert (=> b!122120 m!185397))

(declare-fun m!185399 () Bool)

(assert (=> b!122117 m!185399))

(assert (=> b!122117 m!185399))

(declare-fun m!185401 () Bool)

(assert (=> b!122117 m!185401))

(assert (=> b!122123 m!185397))

(assert (=> b!122123 m!185395))

(declare-fun m!185403 () Bool)

(assert (=> b!122116 m!185403))

(declare-fun m!185405 () Bool)

(assert (=> b!122125 m!185405))

(declare-fun m!185407 () Bool)

(assert (=> b!122125 m!185407))

(declare-fun m!185409 () Bool)

(assert (=> b!122125 m!185409))

(declare-fun m!185411 () Bool)

(assert (=> b!122125 m!185411))

(declare-fun m!185413 () Bool)

(assert (=> b!122125 m!185413))

(declare-fun m!185415 () Bool)

(assert (=> b!122125 m!185415))

(declare-fun m!185417 () Bool)

(assert (=> b!122125 m!185417))

(declare-fun m!185419 () Bool)

(assert (=> b!122125 m!185419))

(declare-fun m!185421 () Bool)

(assert (=> b!122125 m!185421))

(declare-fun m!185423 () Bool)

(assert (=> b!122125 m!185423))

(declare-fun m!185425 () Bool)

(assert (=> b!122125 m!185425))

(declare-fun m!185427 () Bool)

(assert (=> b!122125 m!185427))

(declare-fun m!185429 () Bool)

(assert (=> b!122125 m!185429))

(declare-fun m!185431 () Bool)

(assert (=> b!122125 m!185431))

(declare-fun m!185433 () Bool)

(assert (=> b!122125 m!185433))

(declare-fun m!185435 () Bool)

(assert (=> b!122125 m!185435))

(declare-fun m!185437 () Bool)

(assert (=> b!122125 m!185437))

(declare-fun m!185439 () Bool)

(assert (=> b!122125 m!185439))

(declare-fun m!185441 () Bool)

(assert (=> b!122125 m!185441))

(declare-fun m!185443 () Bool)

(assert (=> b!122118 m!185443))

(declare-fun m!185445 () Bool)

(assert (=> start!24152 m!185445))

(declare-fun m!185447 () Bool)

(assert (=> b!122112 m!185447))

(declare-fun m!185449 () Bool)

(assert (=> b!122119 m!185449))

(declare-fun m!185451 () Bool)

(assert (=> b!122113 m!185451))

(declare-fun m!185453 () Bool)

(assert (=> b!122121 m!185453))

(push 1)

(assert (not b!122113))

(assert (not b!122119))

(assert (not b!122121))

(assert (not b!122124))

(assert (not b!122112))

(assert (not b!122120))

(assert (not b!122118))

(assert (not b!122116))

(assert (not b!122125))

(assert (not b!122123))

(assert (not start!24152))

(assert (not b!122117))

(check-sat)

(pop 1)

(push 1)

(check-sat)

