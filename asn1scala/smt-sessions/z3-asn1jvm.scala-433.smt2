; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!11792 () Bool)

(assert start!11792)

(declare-fun b!58236 () Bool)

(declare-fun res!48354 () Bool)

(declare-fun e!38600 () Bool)

(assert (=> b!58236 (=> res!48354 e!38600)))

(declare-datatypes ((array!2649 0))(
  ( (array!2650 (arr!1764 (Array (_ BitVec 32) (_ BitVec 8))) (size!1200 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2088 0))(
  ( (BitStream!2089 (buf!1581 array!2649) (currentByte!3199 (_ BitVec 32)) (currentBit!3194 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!4023 0))(
  ( (Unit!4024) )
))
(declare-datatypes ((tuple2!5298 0))(
  ( (tuple2!5299 (_1!2760 Unit!4023) (_2!2760 BitStream!2088)) )
))
(declare-fun lt!92195 () tuple2!5298)

(declare-fun lt!92199 () tuple2!5298)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!58236 (= res!48354 (not (invariant!0 (currentBit!3194 (_2!2760 lt!92195)) (currentByte!3199 (_2!2760 lt!92195)) (size!1200 (buf!1581 (_2!2760 lt!92199))))))))

(declare-fun b!58237 () Bool)

(declare-fun e!38607 () Bool)

(declare-fun e!38608 () Bool)

(assert (=> b!58237 (= e!38607 e!38608)))

(declare-fun res!48352 () Bool)

(assert (=> b!58237 (=> res!48352 e!38608)))

(declare-fun lt!92192 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun lt!92200 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!58237 (= res!48352 (not (= lt!92192 (bvsub (bvadd lt!92200 to!314) i!635))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!58237 (= lt!92192 (bitIndex!0 (size!1200 (buf!1581 (_2!2760 lt!92199))) (currentByte!3199 (_2!2760 lt!92199)) (currentBit!3194 (_2!2760 lt!92199))))))

(declare-fun res!48360 () Bool)

(declare-fun e!38602 () Bool)

(assert (=> start!11792 (=> (not res!48360) (not e!38602))))

(declare-fun srcBuffer!2 () array!2649)

(assert (=> start!11792 (= res!48360 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1200 srcBuffer!2))))))))

(assert (=> start!11792 e!38602))

(assert (=> start!11792 true))

(declare-fun array_inv!1103 (array!2649) Bool)

(assert (=> start!11792 (array_inv!1103 srcBuffer!2)))

(declare-fun thiss!1379 () BitStream!2088)

(declare-fun e!38606 () Bool)

(declare-fun inv!12 (BitStream!2088) Bool)

(assert (=> start!11792 (and (inv!12 thiss!1379) e!38606)))

(declare-fun b!58238 () Bool)

(assert (=> b!58238 (= e!38608 e!38600)))

(declare-fun res!48351 () Bool)

(assert (=> b!58238 (=> res!48351 e!38600)))

(assert (=> b!58238 (= res!48351 (not (= (size!1200 (buf!1581 (_2!2760 lt!92195))) (size!1200 (buf!1581 (_2!2760 lt!92199))))))))

(declare-fun e!38601 () Bool)

(assert (=> b!58238 e!38601))

(declare-fun res!48348 () Bool)

(assert (=> b!58238 (=> (not res!48348) (not e!38601))))

(assert (=> b!58238 (= res!48348 (= (size!1200 (buf!1581 (_2!2760 lt!92199))) (size!1200 (buf!1581 thiss!1379))))))

(declare-fun b!58239 () Bool)

(assert (=> b!58239 (= e!38606 (array_inv!1103 (buf!1581 thiss!1379)))))

(declare-fun b!58240 () Bool)

(declare-fun res!48353 () Bool)

(assert (=> b!58240 (=> (not res!48353) (not e!38602))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!58240 (= res!48353 (validate_offset_bits!1 ((_ sign_extend 32) (size!1200 (buf!1581 thiss!1379))) ((_ sign_extend 32) (currentByte!3199 thiss!1379)) ((_ sign_extend 32) (currentBit!3194 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!58241 () Bool)

(declare-fun e!38604 () Bool)

(declare-fun e!38599 () Bool)

(assert (=> b!58241 (= e!38604 e!38599)))

(declare-fun res!48358 () Bool)

(assert (=> b!58241 (=> res!48358 e!38599)))

(declare-fun isPrefixOf!0 (BitStream!2088 BitStream!2088) Bool)

(assert (=> b!58241 (= res!48358 (not (isPrefixOf!0 thiss!1379 (_2!2760 lt!92195))))))

(assert (=> b!58241 (validate_offset_bits!1 ((_ sign_extend 32) (size!1200 (buf!1581 (_2!2760 lt!92195)))) ((_ sign_extend 32) (currentByte!3199 (_2!2760 lt!92195))) ((_ sign_extend 32) (currentBit!3194 (_2!2760 lt!92195))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!92194 () Unit!4023)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2088 BitStream!2088 (_ BitVec 64) (_ BitVec 64)) Unit!4023)

(assert (=> b!58241 (= lt!92194 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2760 lt!92195) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2088 (_ BitVec 8) (_ BitVec 32)) tuple2!5298)

(assert (=> b!58241 (= lt!92195 (appendBitFromByte!0 thiss!1379 (select (arr!1764 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!58242 () Bool)

(assert (=> b!58242 (= e!38602 (not e!38604))))

(declare-fun res!48355 () Bool)

(assert (=> b!58242 (=> res!48355 e!38604)))

(assert (=> b!58242 (= res!48355 (bvsge i!635 to!314))))

(assert (=> b!58242 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!92196 () Unit!4023)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2088) Unit!4023)

(assert (=> b!58242 (= lt!92196 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!58242 (= lt!92200 (bitIndex!0 (size!1200 (buf!1581 thiss!1379)) (currentByte!3199 thiss!1379) (currentBit!3194 thiss!1379)))))

(declare-fun b!58243 () Bool)

(assert (=> b!58243 (= e!38600 true)))

(declare-datatypes ((tuple2!5300 0))(
  ( (tuple2!5301 (_1!2761 BitStream!2088) (_2!2761 BitStream!2088)) )
))
(declare-fun lt!92191 () tuple2!5300)

(declare-fun reader!0 (BitStream!2088 BitStream!2088) tuple2!5300)

(assert (=> b!58243 (= lt!92191 (reader!0 thiss!1379 (_2!2760 lt!92199)))))

(declare-fun b!58244 () Bool)

(declare-fun res!48356 () Bool)

(assert (=> b!58244 (=> res!48356 e!38608)))

(assert (=> b!58244 (= res!48356 (not (invariant!0 (currentBit!3194 (_2!2760 lt!92199)) (currentByte!3199 (_2!2760 lt!92199)) (size!1200 (buf!1581 (_2!2760 lt!92199))))))))

(declare-fun b!58245 () Bool)

(declare-fun res!48357 () Bool)

(assert (=> b!58245 (=> res!48357 e!38608)))

(assert (=> b!58245 (= res!48357 (not (= (size!1200 (buf!1581 thiss!1379)) (size!1200 (buf!1581 (_2!2760 lt!92199))))))))

(declare-fun b!58246 () Bool)

(declare-fun res!48359 () Bool)

(assert (=> b!58246 (=> res!48359 e!38600)))

(assert (=> b!58246 (= res!48359 (not (invariant!0 (currentBit!3194 (_2!2760 lt!92195)) (currentByte!3199 (_2!2760 lt!92195)) (size!1200 (buf!1581 (_2!2760 lt!92195))))))))

(declare-fun e!38603 () Bool)

(declare-fun lt!92193 () tuple2!5300)

(declare-fun b!58247 () Bool)

(declare-datatypes ((List!619 0))(
  ( (Nil!616) (Cons!615 (h!734 Bool) (t!1369 List!619)) )
))
(declare-fun head!438 (List!619) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2088 array!2649 (_ BitVec 64) (_ BitVec 64)) List!619)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2088 BitStream!2088 (_ BitVec 64)) List!619)

(assert (=> b!58247 (= e!38603 (= (head!438 (byteArrayBitContentToList!0 (_2!2760 lt!92195) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!438 (bitStreamReadBitsIntoList!0 (_2!2760 lt!92195) (_1!2761 lt!92193) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!58248 () Bool)

(assert (=> b!58248 (= e!38599 e!38607)))

(declare-fun res!48349 () Bool)

(assert (=> b!58248 (=> res!48349 e!38607)))

(assert (=> b!58248 (= res!48349 (not (isPrefixOf!0 (_2!2760 lt!92195) (_2!2760 lt!92199))))))

(assert (=> b!58248 (isPrefixOf!0 thiss!1379 (_2!2760 lt!92199))))

(declare-fun lt!92198 () Unit!4023)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2088 BitStream!2088 BitStream!2088) Unit!4023)

(assert (=> b!58248 (= lt!92198 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2760 lt!92195) (_2!2760 lt!92199)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2088 array!2649 (_ BitVec 64) (_ BitVec 64)) tuple2!5298)

(assert (=> b!58248 (= lt!92199 (appendBitsMSBFirstLoop!0 (_2!2760 lt!92195) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!58248 e!38603))

(declare-fun res!48350 () Bool)

(assert (=> b!58248 (=> (not res!48350) (not e!38603))))

(assert (=> b!58248 (= res!48350 (validate_offset_bits!1 ((_ sign_extend 32) (size!1200 (buf!1581 (_2!2760 lt!92195)))) ((_ sign_extend 32) (currentByte!3199 thiss!1379)) ((_ sign_extend 32) (currentBit!3194 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!92197 () Unit!4023)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2088 array!2649 (_ BitVec 64)) Unit!4023)

(assert (=> b!58248 (= lt!92197 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1581 (_2!2760 lt!92195)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!58248 (= lt!92193 (reader!0 thiss!1379 (_2!2760 lt!92195)))))

(declare-fun b!58249 () Bool)

(assert (=> b!58249 (= e!38601 (= lt!92192 (bvsub (bvsub (bvadd (bitIndex!0 (size!1200 (buf!1581 (_2!2760 lt!92195))) (currentByte!3199 (_2!2760 lt!92195)) (currentBit!3194 (_2!2760 lt!92195))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and start!11792 res!48360) b!58240))

(assert (= (and b!58240 res!48353) b!58242))

(assert (= (and b!58242 (not res!48355)) b!58241))

(assert (= (and b!58241 (not res!48358)) b!58248))

(assert (= (and b!58248 res!48350) b!58247))

(assert (= (and b!58248 (not res!48349)) b!58237))

(assert (= (and b!58237 (not res!48352)) b!58244))

(assert (= (and b!58244 (not res!48356)) b!58245))

(assert (= (and b!58245 (not res!48357)) b!58238))

(assert (= (and b!58238 res!48348) b!58249))

(assert (= (and b!58238 (not res!48351)) b!58246))

(assert (= (and b!58246 (not res!48359)) b!58236))

(assert (= (and b!58236 (not res!48354)) b!58243))

(assert (= start!11792 b!58239))

(declare-fun m!91793 () Bool)

(assert (=> b!58249 m!91793))

(declare-fun m!91795 () Bool)

(assert (=> start!11792 m!91795))

(declare-fun m!91797 () Bool)

(assert (=> start!11792 m!91797))

(declare-fun m!91799 () Bool)

(assert (=> b!58241 m!91799))

(declare-fun m!91801 () Bool)

(assert (=> b!58241 m!91801))

(assert (=> b!58241 m!91799))

(declare-fun m!91803 () Bool)

(assert (=> b!58241 m!91803))

(declare-fun m!91805 () Bool)

(assert (=> b!58241 m!91805))

(declare-fun m!91807 () Bool)

(assert (=> b!58241 m!91807))

(declare-fun m!91809 () Bool)

(assert (=> b!58243 m!91809))

(declare-fun m!91811 () Bool)

(assert (=> b!58248 m!91811))

(declare-fun m!91813 () Bool)

(assert (=> b!58248 m!91813))

(declare-fun m!91815 () Bool)

(assert (=> b!58248 m!91815))

(declare-fun m!91817 () Bool)

(assert (=> b!58248 m!91817))

(declare-fun m!91819 () Bool)

(assert (=> b!58248 m!91819))

(declare-fun m!91821 () Bool)

(assert (=> b!58248 m!91821))

(declare-fun m!91823 () Bool)

(assert (=> b!58248 m!91823))

(declare-fun m!91825 () Bool)

(assert (=> b!58240 m!91825))

(declare-fun m!91827 () Bool)

(assert (=> b!58239 m!91827))

(declare-fun m!91829 () Bool)

(assert (=> b!58244 m!91829))

(declare-fun m!91831 () Bool)

(assert (=> b!58246 m!91831))

(declare-fun m!91833 () Bool)

(assert (=> b!58236 m!91833))

(declare-fun m!91835 () Bool)

(assert (=> b!58247 m!91835))

(assert (=> b!58247 m!91835))

(declare-fun m!91837 () Bool)

(assert (=> b!58247 m!91837))

(declare-fun m!91839 () Bool)

(assert (=> b!58247 m!91839))

(assert (=> b!58247 m!91839))

(declare-fun m!91841 () Bool)

(assert (=> b!58247 m!91841))

(declare-fun m!91843 () Bool)

(assert (=> b!58237 m!91843))

(declare-fun m!91845 () Bool)

(assert (=> b!58242 m!91845))

(declare-fun m!91847 () Bool)

(assert (=> b!58242 m!91847))

(declare-fun m!91849 () Bool)

(assert (=> b!58242 m!91849))

(check-sat (not b!58243) (not b!58239) (not b!58247) (not b!58244) (not b!58237) (not b!58240) (not b!58242) (not b!58249) (not start!11792) (not b!58241) (not b!58246) (not b!58236) (not b!58248))
