; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!23106 () Bool)

(assert start!23106)

(declare-fun b!117230 () Bool)

(declare-fun e!76848 () Bool)

(declare-fun e!76843 () Bool)

(assert (=> b!117230 (= e!76848 e!76843)))

(declare-fun res!96968 () Bool)

(assert (=> b!117230 (=> (not res!96968) (not e!76843))))

(declare-datatypes ((array!5277 0))(
  ( (array!5278 (arr!2987 (Array (_ BitVec 32) (_ BitVec 8))) (size!2394 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4262 0))(
  ( (BitStream!4263 (buf!2807 array!5277) (currentByte!5450 (_ BitVec 32)) (currentBit!5445 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!9764 0))(
  ( (tuple2!9765 (_1!5147 BitStream!4262) (_2!5147 Bool)) )
))
(declare-fun lt!179497 () tuple2!9764)

(declare-datatypes ((Unit!7211 0))(
  ( (Unit!7212) )
))
(declare-datatypes ((tuple2!9766 0))(
  ( (tuple2!9767 (_1!5148 Unit!7211) (_2!5148 BitStream!4262)) )
))
(declare-fun lt!179488 () tuple2!9766)

(declare-fun lt!179492 () Bool)

(assert (=> b!117230 (= res!96968 (and (= (_2!5147 lt!179497) lt!179492) (= (_1!5147 lt!179497) (_2!5148 lt!179488))))))

(declare-fun thiss!1305 () BitStream!4262)

(declare-fun readBitPure!0 (BitStream!4262) tuple2!9764)

(declare-fun readerFrom!0 (BitStream!4262 (_ BitVec 32) (_ BitVec 32)) BitStream!4262)

(assert (=> b!117230 (= lt!179497 (readBitPure!0 (readerFrom!0 (_2!5148 lt!179488) (currentBit!5445 thiss!1305) (currentByte!5450 thiss!1305))))))

(declare-fun e!76844 () Bool)

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun lt!179493 () tuple2!9766)

(declare-fun b!117231 () Bool)

(assert (=> b!117231 (= e!76844 (not (or (not (= (size!2394 (buf!2807 (_2!5148 lt!179488))) (size!2394 (buf!2807 (_2!5148 lt!179493))))) (bvsge ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun v!199 () (_ BitVec 64))

(declare-datatypes ((tuple2!9768 0))(
  ( (tuple2!9769 (_1!5149 BitStream!4262) (_2!5149 (_ BitVec 64))) )
))
(declare-fun lt!179487 () tuple2!9768)

(declare-datatypes ((tuple2!9770 0))(
  ( (tuple2!9771 (_1!5150 BitStream!4262) (_2!5150 BitStream!4262)) )
))
(declare-fun lt!179489 () tuple2!9770)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4262 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9768)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!117231 (= lt!179487 (readNLeastSignificantBitsLoopPure!0 (_1!5150 lt!179489) nBits!396 i!615 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615))))))))

(declare-fun lt!179500 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!117231 (validate_offset_bits!1 ((_ sign_extend 32) (size!2394 (buf!2807 (_2!5148 lt!179493)))) ((_ sign_extend 32) (currentByte!5450 thiss!1305)) ((_ sign_extend 32) (currentBit!5445 thiss!1305)) lt!179500)))

(declare-fun lt!179502 () Unit!7211)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4262 array!5277 (_ BitVec 64)) Unit!7211)

(assert (=> b!117231 (= lt!179502 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2807 (_2!5148 lt!179493)) lt!179500))))

(assert (=> b!117231 (= (_2!5147 (readBitPure!0 (_1!5150 lt!179489))) lt!179492)))

(declare-fun lt!179491 () tuple2!9770)

(declare-fun reader!0 (BitStream!4262 BitStream!4262) tuple2!9770)

(assert (=> b!117231 (= lt!179491 (reader!0 (_2!5148 lt!179488) (_2!5148 lt!179493)))))

(assert (=> b!117231 (= lt!179489 (reader!0 thiss!1305 (_2!5148 lt!179493)))))

(declare-fun e!76845 () Bool)

(assert (=> b!117231 e!76845))

(declare-fun res!96966 () Bool)

(assert (=> b!117231 (=> (not res!96966) (not e!76845))))

(declare-fun lt!179501 () tuple2!9764)

(declare-fun lt!179490 () tuple2!9764)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!117231 (= res!96966 (= (bitIndex!0 (size!2394 (buf!2807 (_1!5147 lt!179501))) (currentByte!5450 (_1!5147 lt!179501)) (currentBit!5445 (_1!5147 lt!179501))) (bitIndex!0 (size!2394 (buf!2807 (_1!5147 lt!179490))) (currentByte!5450 (_1!5147 lt!179490)) (currentBit!5445 (_1!5147 lt!179490)))))))

(declare-fun lt!179499 () Unit!7211)

(declare-fun lt!179498 () BitStream!4262)

(declare-fun readBitPrefixLemma!0 (BitStream!4262 BitStream!4262) Unit!7211)

(assert (=> b!117231 (= lt!179499 (readBitPrefixLemma!0 lt!179498 (_2!5148 lt!179493)))))

(assert (=> b!117231 (= lt!179490 (readBitPure!0 (BitStream!4263 (buf!2807 (_2!5148 lt!179493)) (currentByte!5450 thiss!1305) (currentBit!5445 thiss!1305))))))

(assert (=> b!117231 (= lt!179501 (readBitPure!0 lt!179498))))

(assert (=> b!117231 (= lt!179498 (BitStream!4263 (buf!2807 (_2!5148 lt!179488)) (currentByte!5450 thiss!1305) (currentBit!5445 thiss!1305)))))

(declare-fun e!76849 () Bool)

(assert (=> b!117231 e!76849))

(declare-fun res!96969 () Bool)

(assert (=> b!117231 (=> (not res!96969) (not e!76849))))

(declare-fun isPrefixOf!0 (BitStream!4262 BitStream!4262) Bool)

(assert (=> b!117231 (= res!96969 (isPrefixOf!0 thiss!1305 (_2!5148 lt!179493)))))

(declare-fun lt!179494 () Unit!7211)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4262 BitStream!4262 BitStream!4262) Unit!7211)

(assert (=> b!117231 (= lt!179494 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5148 lt!179488) (_2!5148 lt!179493)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4262 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9766)

(assert (=> b!117231 (= lt!179493 (appendNLeastSignificantBitsLoop!0 (_2!5148 lt!179488) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!76850 () Bool)

(assert (=> b!117231 e!76850))

(declare-fun res!96971 () Bool)

(assert (=> b!117231 (=> (not res!96971) (not e!76850))))

(assert (=> b!117231 (= res!96971 (= (size!2394 (buf!2807 thiss!1305)) (size!2394 (buf!2807 (_2!5148 lt!179488)))))))

(declare-fun appendBit!0 (BitStream!4262 Bool) tuple2!9766)

(assert (=> b!117231 (= lt!179488 (appendBit!0 thiss!1305 lt!179492))))

(assert (=> b!117231 (= lt!179492 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!117232 () Bool)

(declare-fun res!96965 () Bool)

(assert (=> b!117232 (=> (not res!96965) (not e!76844))))

(assert (=> b!117232 (= res!96965 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!117233 () Bool)

(assert (=> b!117233 (= e!76845 (= (_2!5147 lt!179501) (_2!5147 lt!179490)))))

(declare-fun res!96970 () Bool)

(declare-fun e!76851 () Bool)

(assert (=> start!23106 (=> (not res!96970) (not e!76851))))

(assert (=> start!23106 (= res!96970 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!23106 e!76851))

(assert (=> start!23106 true))

(declare-fun e!76847 () Bool)

(declare-fun inv!12 (BitStream!4262) Bool)

(assert (=> start!23106 (and (inv!12 thiss!1305) e!76847)))

(declare-fun b!117234 () Bool)

(assert (=> b!117234 (= e!76850 e!76848)))

(declare-fun res!96972 () Bool)

(assert (=> b!117234 (=> (not res!96972) (not e!76848))))

(declare-fun lt!179496 () (_ BitVec 64))

(declare-fun lt!179495 () (_ BitVec 64))

(assert (=> b!117234 (= res!96972 (= lt!179496 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!179495)))))

(assert (=> b!117234 (= lt!179496 (bitIndex!0 (size!2394 (buf!2807 (_2!5148 lt!179488))) (currentByte!5450 (_2!5148 lt!179488)) (currentBit!5445 (_2!5148 lt!179488))))))

(assert (=> b!117234 (= lt!179495 (bitIndex!0 (size!2394 (buf!2807 thiss!1305)) (currentByte!5450 thiss!1305) (currentBit!5445 thiss!1305)))))

(declare-fun b!117235 () Bool)

(declare-fun res!96967 () Bool)

(assert (=> b!117235 (=> (not res!96967) (not e!76844))))

(assert (=> b!117235 (= res!96967 (bvslt i!615 nBits!396))))

(declare-fun b!117236 () Bool)

(declare-fun res!96962 () Bool)

(assert (=> b!117236 (=> (not res!96962) (not e!76849))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!117236 (= res!96962 (invariant!0 (currentBit!5445 thiss!1305) (currentByte!5450 thiss!1305) (size!2394 (buf!2807 (_2!5148 lt!179488)))))))

(declare-fun b!117237 () Bool)

(declare-fun res!96963 () Bool)

(assert (=> b!117237 (=> (not res!96963) (not e!76848))))

(assert (=> b!117237 (= res!96963 (isPrefixOf!0 thiss!1305 (_2!5148 lt!179488)))))

(declare-fun b!117238 () Bool)

(declare-fun array_inv!2196 (array!5277) Bool)

(assert (=> b!117238 (= e!76847 (array_inv!2196 (buf!2807 thiss!1305)))))

(declare-fun b!117239 () Bool)

(assert (=> b!117239 (= e!76849 (invariant!0 (currentBit!5445 thiss!1305) (currentByte!5450 thiss!1305) (size!2394 (buf!2807 (_2!5148 lt!179493)))))))

(declare-fun b!117240 () Bool)

(assert (=> b!117240 (= e!76843 (= (bitIndex!0 (size!2394 (buf!2807 (_1!5147 lt!179497))) (currentByte!5450 (_1!5147 lt!179497)) (currentBit!5445 (_1!5147 lt!179497))) lt!179496))))

(declare-fun b!117241 () Bool)

(assert (=> b!117241 (= e!76851 e!76844)))

(declare-fun res!96964 () Bool)

(assert (=> b!117241 (=> (not res!96964) (not e!76844))))

(assert (=> b!117241 (= res!96964 (validate_offset_bits!1 ((_ sign_extend 32) (size!2394 (buf!2807 thiss!1305))) ((_ sign_extend 32) (currentByte!5450 thiss!1305)) ((_ sign_extend 32) (currentBit!5445 thiss!1305)) lt!179500))))

(assert (=> b!117241 (= lt!179500 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(assert (= (and start!23106 res!96970) b!117241))

(assert (= (and b!117241 res!96964) b!117232))

(assert (= (and b!117232 res!96965) b!117235))

(assert (= (and b!117235 res!96967) b!117231))

(assert (= (and b!117231 res!96971) b!117234))

(assert (= (and b!117234 res!96972) b!117237))

(assert (= (and b!117237 res!96963) b!117230))

(assert (= (and b!117230 res!96968) b!117240))

(assert (= (and b!117231 res!96969) b!117236))

(assert (= (and b!117236 res!96962) b!117239))

(assert (= (and b!117231 res!96966) b!117233))

(assert (= start!23106 b!117238))

(declare-fun m!175725 () Bool)

(assert (=> b!117238 m!175725))

(declare-fun m!175727 () Bool)

(assert (=> b!117241 m!175727))

(declare-fun m!175729 () Bool)

(assert (=> b!117232 m!175729))

(declare-fun m!175731 () Bool)

(assert (=> b!117231 m!175731))

(declare-fun m!175733 () Bool)

(assert (=> b!117231 m!175733))

(declare-fun m!175735 () Bool)

(assert (=> b!117231 m!175735))

(declare-fun m!175737 () Bool)

(assert (=> b!117231 m!175737))

(declare-fun m!175739 () Bool)

(assert (=> b!117231 m!175739))

(declare-fun m!175741 () Bool)

(assert (=> b!117231 m!175741))

(declare-fun m!175743 () Bool)

(assert (=> b!117231 m!175743))

(declare-fun m!175745 () Bool)

(assert (=> b!117231 m!175745))

(declare-fun m!175747 () Bool)

(assert (=> b!117231 m!175747))

(declare-fun m!175749 () Bool)

(assert (=> b!117231 m!175749))

(declare-fun m!175751 () Bool)

(assert (=> b!117231 m!175751))

(declare-fun m!175753 () Bool)

(assert (=> b!117231 m!175753))

(declare-fun m!175755 () Bool)

(assert (=> b!117231 m!175755))

(declare-fun m!175757 () Bool)

(assert (=> b!117231 m!175757))

(declare-fun m!175759 () Bool)

(assert (=> b!117231 m!175759))

(declare-fun m!175761 () Bool)

(assert (=> b!117231 m!175761))

(declare-fun m!175763 () Bool)

(assert (=> b!117240 m!175763))

(declare-fun m!175765 () Bool)

(assert (=> b!117230 m!175765))

(assert (=> b!117230 m!175765))

(declare-fun m!175767 () Bool)

(assert (=> b!117230 m!175767))

(declare-fun m!175769 () Bool)

(assert (=> b!117239 m!175769))

(declare-fun m!175771 () Bool)

(assert (=> b!117236 m!175771))

(declare-fun m!175773 () Bool)

(assert (=> b!117234 m!175773))

(declare-fun m!175775 () Bool)

(assert (=> b!117234 m!175775))

(declare-fun m!175777 () Bool)

(assert (=> b!117237 m!175777))

(declare-fun m!175779 () Bool)

(assert (=> start!23106 m!175779))

(push 1)

(assert (not b!117240))

(assert (not b!117237))

(assert (not b!117230))

(assert (not b!117238))

(assert (not start!23106))

(assert (not b!117241))

(assert (not b!117234))

(assert (not b!117232))

(assert (not b!117236))

(assert (not b!117239))

(assert (not b!117231))

(check-sat)

(pop 1)

(push 1)

(check-sat)

