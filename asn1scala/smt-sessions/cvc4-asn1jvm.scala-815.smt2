; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24156 () Bool)

(assert start!24156)

(declare-fun b!122196 () Bool)

(declare-fun e!80034 () Bool)

(declare-fun e!80035 () Bool)

(assert (=> b!122196 (= e!80034 e!80035)))

(declare-fun res!101236 () Bool)

(assert (=> b!122196 (=> (not res!101236) (not e!80035))))

(declare-fun lt!192093 () (_ BitVec 64))

(declare-fun lt!192099 () (_ BitVec 64))

(assert (=> b!122196 (= res!101236 (= lt!192093 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!192099)))))

(declare-datatypes ((array!5406 0))(
  ( (array!5407 (arr!3038 (Array (_ BitVec 32) (_ BitVec 8))) (size!2445 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4364 0))(
  ( (BitStream!4365 (buf!2885 array!5406) (currentByte!5582 (_ BitVec 32)) (currentBit!5577 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!7529 0))(
  ( (Unit!7530) )
))
(declare-datatypes ((tuple2!10280 0))(
  ( (tuple2!10281 (_1!5405 Unit!7529) (_2!5405 BitStream!4364)) )
))
(declare-fun lt!192104 () tuple2!10280)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!122196 (= lt!192093 (bitIndex!0 (size!2445 (buf!2885 (_2!5405 lt!192104))) (currentByte!5582 (_2!5405 lt!192104)) (currentBit!5577 (_2!5405 lt!192104))))))

(declare-fun thiss!1305 () BitStream!4364)

(assert (=> b!122196 (= lt!192099 (bitIndex!0 (size!2445 (buf!2885 thiss!1305)) (currentByte!5582 thiss!1305) (currentBit!5577 thiss!1305)))))

(declare-fun e!80033 () Bool)

(declare-fun lt!192097 () (_ BitVec 64))

(declare-datatypes ((tuple2!10282 0))(
  ( (tuple2!10283 (_1!5406 BitStream!4364) (_2!5406 BitStream!4364)) )
))
(declare-fun lt!192086 () tuple2!10282)

(declare-fun b!122197 () Bool)

(declare-fun lt!192095 () (_ BitVec 64))

(declare-fun lt!192077 () tuple2!10282)

(declare-fun lt!192078 () BitStream!4364)

(declare-datatypes ((tuple2!10284 0))(
  ( (tuple2!10285 (_1!5407 BitStream!4364) (_2!5407 (_ BitVec 64))) )
))
(declare-fun lt!192083 () tuple2!10284)

(declare-fun lt!192082 () tuple2!10284)

(assert (=> b!122197 (= e!80033 (and (= lt!192095 (bvsub lt!192097 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!5406 lt!192077) lt!192078)) (and (= (_2!5407 lt!192083) (_2!5407 lt!192082)) (= (_1!5407 lt!192083) (_2!5406 lt!192086))))))))

(declare-fun b!122198 () Bool)

(declare-fun res!101241 () Bool)

(declare-fun e!80043 () Bool)

(assert (=> b!122198 (=> (not res!101241) (not e!80043))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!122198 (= res!101241 (invariant!0 (currentBit!5577 thiss!1305) (currentByte!5582 thiss!1305) (size!2445 (buf!2885 (_2!5405 lt!192104)))))))

(declare-fun b!122199 () Bool)

(declare-fun e!80036 () Bool)

(declare-fun e!80042 () Bool)

(assert (=> b!122199 (= e!80036 (not e!80042))))

(declare-fun res!101235 () Bool)

(assert (=> b!122199 (=> res!101235 e!80042)))

(assert (=> b!122199 (= res!101235 (not (= (_1!5407 lt!192082) (_2!5406 lt!192077))))))

(declare-fun lt!192103 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4364 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!10284)

(assert (=> b!122199 (= lt!192082 (readNLeastSignificantBitsLoopPure!0 (_1!5406 lt!192077) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!192103))))

(declare-fun lt!192087 () tuple2!10280)

(declare-fun lt!192079 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!122199 (validate_offset_bits!1 ((_ sign_extend 32) (size!2445 (buf!2885 (_2!5405 lt!192087)))) ((_ sign_extend 32) (currentByte!5582 (_2!5405 lt!192104))) ((_ sign_extend 32) (currentBit!5577 (_2!5405 lt!192104))) lt!192079)))

(declare-fun lt!192091 () Unit!7529)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4364 array!5406 (_ BitVec 64)) Unit!7529)

(assert (=> b!122199 (= lt!192091 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5405 lt!192104) (buf!2885 (_2!5405 lt!192087)) lt!192079))))

(assert (=> b!122199 (= lt!192079 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!10286 0))(
  ( (tuple2!10287 (_1!5408 BitStream!4364) (_2!5408 Bool)) )
))
(declare-fun lt!192080 () tuple2!10286)

(declare-fun lt!192092 () (_ BitVec 64))

(declare-fun lt!192088 () (_ BitVec 64))

(assert (=> b!122199 (= lt!192103 (bvor lt!192092 (ite (_2!5408 lt!192080) lt!192088 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!122199 (= lt!192083 (readNLeastSignificantBitsLoopPure!0 (_1!5406 lt!192086) nBits!396 i!615 lt!192092))))

(declare-fun lt!192085 () (_ BitVec 64))

(assert (=> b!122199 (validate_offset_bits!1 ((_ sign_extend 32) (size!2445 (buf!2885 (_2!5405 lt!192087)))) ((_ sign_extend 32) (currentByte!5582 thiss!1305)) ((_ sign_extend 32) (currentBit!5577 thiss!1305)) lt!192085)))

(declare-fun lt!192089 () Unit!7529)

(assert (=> b!122199 (= lt!192089 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2885 (_2!5405 lt!192087)) lt!192085))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!122199 (= lt!192092 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(declare-fun lt!192105 () Bool)

(assert (=> b!122199 (= (_2!5408 lt!192080) lt!192105)))

(declare-fun readBitPure!0 (BitStream!4364) tuple2!10286)

(assert (=> b!122199 (= lt!192080 (readBitPure!0 (_1!5406 lt!192086)))))

(declare-fun reader!0 (BitStream!4364 BitStream!4364) tuple2!10282)

(assert (=> b!122199 (= lt!192077 (reader!0 (_2!5405 lt!192104) (_2!5405 lt!192087)))))

(assert (=> b!122199 (= lt!192086 (reader!0 thiss!1305 (_2!5405 lt!192087)))))

(declare-fun e!80038 () Bool)

(assert (=> b!122199 e!80038))

(declare-fun res!101238 () Bool)

(assert (=> b!122199 (=> (not res!101238) (not e!80038))))

(declare-fun lt!192084 () tuple2!10286)

(declare-fun lt!192081 () tuple2!10286)

(assert (=> b!122199 (= res!101238 (= (bitIndex!0 (size!2445 (buf!2885 (_1!5408 lt!192084))) (currentByte!5582 (_1!5408 lt!192084)) (currentBit!5577 (_1!5408 lt!192084))) (bitIndex!0 (size!2445 (buf!2885 (_1!5408 lt!192081))) (currentByte!5582 (_1!5408 lt!192081)) (currentBit!5577 (_1!5408 lt!192081)))))))

(declare-fun lt!192094 () Unit!7529)

(declare-fun lt!192096 () BitStream!4364)

(declare-fun readBitPrefixLemma!0 (BitStream!4364 BitStream!4364) Unit!7529)

(assert (=> b!122199 (= lt!192094 (readBitPrefixLemma!0 lt!192096 (_2!5405 lt!192087)))))

(assert (=> b!122199 (= lt!192081 (readBitPure!0 (BitStream!4365 (buf!2885 (_2!5405 lt!192087)) (currentByte!5582 thiss!1305) (currentBit!5577 thiss!1305))))))

(assert (=> b!122199 (= lt!192084 (readBitPure!0 lt!192096))))

(assert (=> b!122199 (= lt!192096 (BitStream!4365 (buf!2885 (_2!5405 lt!192104)) (currentByte!5582 thiss!1305) (currentBit!5577 thiss!1305)))))

(assert (=> b!122199 e!80043))

(declare-fun res!101242 () Bool)

(assert (=> b!122199 (=> (not res!101242) (not e!80043))))

(declare-fun isPrefixOf!0 (BitStream!4364 BitStream!4364) Bool)

(assert (=> b!122199 (= res!101242 (isPrefixOf!0 thiss!1305 (_2!5405 lt!192087)))))

(declare-fun lt!192101 () Unit!7529)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4364 BitStream!4364 BitStream!4364) Unit!7529)

(assert (=> b!122199 (= lt!192101 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5405 lt!192104) (_2!5405 lt!192087)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4364 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!10280)

(assert (=> b!122199 (= lt!192087 (appendNLeastSignificantBitsLoop!0 (_2!5405 lt!192104) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!122199 e!80034))

(declare-fun res!101237 () Bool)

(assert (=> b!122199 (=> (not res!101237) (not e!80034))))

(assert (=> b!122199 (= res!101237 (= (size!2445 (buf!2885 thiss!1305)) (size!2445 (buf!2885 (_2!5405 lt!192104)))))))

(declare-fun appendBit!0 (BitStream!4364 Bool) tuple2!10280)

(assert (=> b!122199 (= lt!192104 (appendBit!0 thiss!1305 lt!192105))))

(assert (=> b!122199 (= lt!192105 (not (= (bvand v!199 lt!192088) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!122199 (= lt!192088 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!122200 () Bool)

(declare-fun e!80040 () Bool)

(assert (=> b!122200 (= e!80035 e!80040)))

(declare-fun res!101246 () Bool)

(assert (=> b!122200 (=> (not res!101246) (not e!80040))))

(declare-fun lt!192098 () tuple2!10286)

(assert (=> b!122200 (= res!101246 (and (= (_2!5408 lt!192098) lt!192105) (= (_1!5408 lt!192098) (_2!5405 lt!192104))))))

(declare-fun readerFrom!0 (BitStream!4364 (_ BitVec 32) (_ BitVec 32)) BitStream!4364)

(assert (=> b!122200 (= lt!192098 (readBitPure!0 (readerFrom!0 (_2!5405 lt!192104) (currentBit!5577 thiss!1305) (currentByte!5582 thiss!1305))))))

(declare-fun res!101240 () Bool)

(declare-fun e!80041 () Bool)

(assert (=> start!24156 (=> (not res!101240) (not e!80041))))

(assert (=> start!24156 (= res!101240 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!24156 e!80041))

(assert (=> start!24156 true))

(declare-fun e!80037 () Bool)

(declare-fun inv!12 (BitStream!4364) Bool)

(assert (=> start!24156 (and (inv!12 thiss!1305) e!80037)))

(declare-fun b!122201 () Bool)

(assert (=> b!122201 (= e!80041 e!80036)))

(declare-fun res!101247 () Bool)

(assert (=> b!122201 (=> (not res!101247) (not e!80036))))

(assert (=> b!122201 (= res!101247 (validate_offset_bits!1 ((_ sign_extend 32) (size!2445 (buf!2885 thiss!1305))) ((_ sign_extend 32) (currentByte!5582 thiss!1305)) ((_ sign_extend 32) (currentBit!5577 thiss!1305)) lt!192085))))

(assert (=> b!122201 (= lt!192085 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun lt!192102 () (_ BitVec 64))

(declare-fun b!122202 () Bool)

(assert (=> b!122202 (= e!80042 (or (not (= (_1!5406 lt!192077) lt!192078)) (not (= (size!2445 (buf!2885 thiss!1305)) (size!2445 (buf!2885 (_2!5405 lt!192087))))) (not (= lt!192102 (bvadd lt!192095 lt!192085))) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand i!615 #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 i!615) #b10000000000000000000000000000000))))))

(assert (=> b!122202 e!80033))

(declare-fun res!101243 () Bool)

(assert (=> b!122202 (=> (not res!101243) (not e!80033))))

(declare-fun withMovedBitIndex!0 (BitStream!4364 (_ BitVec 64)) BitStream!4364)

(assert (=> b!122202 (= res!101243 (= (_1!5406 lt!192077) (withMovedBitIndex!0 (_2!5406 lt!192077) (bvsub lt!192097 lt!192102))))))

(assert (=> b!122202 (= lt!192097 (bitIndex!0 (size!2445 (buf!2885 (_2!5405 lt!192104))) (currentByte!5582 (_2!5405 lt!192104)) (currentBit!5577 (_2!5405 lt!192104))))))

(assert (=> b!122202 (= (_1!5406 lt!192086) (withMovedBitIndex!0 (_2!5406 lt!192086) (bvsub lt!192095 lt!192102)))))

(assert (=> b!122202 (= lt!192102 (bitIndex!0 (size!2445 (buf!2885 (_2!5405 lt!192087))) (currentByte!5582 (_2!5405 lt!192087)) (currentBit!5577 (_2!5405 lt!192087))))))

(assert (=> b!122202 (= lt!192095 (bitIndex!0 (size!2445 (buf!2885 thiss!1305)) (currentByte!5582 thiss!1305) (currentBit!5577 thiss!1305)))))

(declare-fun lt!192090 () tuple2!10284)

(assert (=> b!122202 (and (= (_2!5407 lt!192083) (_2!5407 lt!192090)) (= (_1!5407 lt!192083) (_1!5407 lt!192090)))))

(declare-fun lt!192100 () Unit!7529)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4364 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!7529)

(assert (=> b!122202 (= lt!192100 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5406 lt!192086) nBits!396 i!615 lt!192092))))

(assert (=> b!122202 (= lt!192090 (readNLeastSignificantBitsLoopPure!0 lt!192078 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!192103))))

(assert (=> b!122202 (= lt!192078 (withMovedBitIndex!0 (_1!5406 lt!192086) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!122203 () Bool)

(assert (=> b!122203 (= e!80040 (= (bitIndex!0 (size!2445 (buf!2885 (_1!5408 lt!192098))) (currentByte!5582 (_1!5408 lt!192098)) (currentBit!5577 (_1!5408 lt!192098))) lt!192093))))

(declare-fun b!122204 () Bool)

(declare-fun res!101239 () Bool)

(assert (=> b!122204 (=> (not res!101239) (not e!80035))))

(assert (=> b!122204 (= res!101239 (isPrefixOf!0 thiss!1305 (_2!5405 lt!192104)))))

(declare-fun b!122205 () Bool)

(declare-fun res!101245 () Bool)

(assert (=> b!122205 (=> (not res!101245) (not e!80036))))

(assert (=> b!122205 (= res!101245 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!122206 () Bool)

(declare-fun res!101244 () Bool)

(assert (=> b!122206 (=> (not res!101244) (not e!80036))))

(assert (=> b!122206 (= res!101244 (bvslt i!615 nBits!396))))

(declare-fun b!122207 () Bool)

(assert (=> b!122207 (= e!80038 (= (_2!5408 lt!192084) (_2!5408 lt!192081)))))

(declare-fun b!122208 () Bool)

(assert (=> b!122208 (= e!80043 (invariant!0 (currentBit!5577 thiss!1305) (currentByte!5582 thiss!1305) (size!2445 (buf!2885 (_2!5405 lt!192087)))))))

(declare-fun b!122209 () Bool)

(declare-fun array_inv!2247 (array!5406) Bool)

(assert (=> b!122209 (= e!80037 (array_inv!2247 (buf!2885 thiss!1305)))))

(assert (= (and start!24156 res!101240) b!122201))

(assert (= (and b!122201 res!101247) b!122205))

(assert (= (and b!122205 res!101245) b!122206))

(assert (= (and b!122206 res!101244) b!122199))

(assert (= (and b!122199 res!101237) b!122196))

(assert (= (and b!122196 res!101236) b!122204))

(assert (= (and b!122204 res!101239) b!122200))

(assert (= (and b!122200 res!101246) b!122203))

(assert (= (and b!122199 res!101242) b!122198))

(assert (= (and b!122198 res!101241) b!122208))

(assert (= (and b!122199 res!101238) b!122207))

(assert (= (and b!122199 (not res!101235)) b!122202))

(assert (= (and b!122202 res!101243) b!122197))

(assert (= start!24156 b!122209))

(declare-fun m!185529 () Bool)

(assert (=> b!122199 m!185529))

(declare-fun m!185531 () Bool)

(assert (=> b!122199 m!185531))

(declare-fun m!185533 () Bool)

(assert (=> b!122199 m!185533))

(declare-fun m!185535 () Bool)

(assert (=> b!122199 m!185535))

(declare-fun m!185537 () Bool)

(assert (=> b!122199 m!185537))

(declare-fun m!185539 () Bool)

(assert (=> b!122199 m!185539))

(declare-fun m!185541 () Bool)

(assert (=> b!122199 m!185541))

(declare-fun m!185543 () Bool)

(assert (=> b!122199 m!185543))

(declare-fun m!185545 () Bool)

(assert (=> b!122199 m!185545))

(declare-fun m!185547 () Bool)

(assert (=> b!122199 m!185547))

(declare-fun m!185549 () Bool)

(assert (=> b!122199 m!185549))

(declare-fun m!185551 () Bool)

(assert (=> b!122199 m!185551))

(declare-fun m!185553 () Bool)

(assert (=> b!122199 m!185553))

(declare-fun m!185555 () Bool)

(assert (=> b!122199 m!185555))

(declare-fun m!185557 () Bool)

(assert (=> b!122199 m!185557))

(declare-fun m!185559 () Bool)

(assert (=> b!122199 m!185559))

(declare-fun m!185561 () Bool)

(assert (=> b!122199 m!185561))

(declare-fun m!185563 () Bool)

(assert (=> b!122199 m!185563))

(declare-fun m!185565 () Bool)

(assert (=> b!122199 m!185565))

(declare-fun m!185567 () Bool)

(assert (=> b!122208 m!185567))

(declare-fun m!185569 () Bool)

(assert (=> b!122202 m!185569))

(declare-fun m!185571 () Bool)

(assert (=> b!122202 m!185571))

(declare-fun m!185573 () Bool)

(assert (=> b!122202 m!185573))

(declare-fun m!185575 () Bool)

(assert (=> b!122202 m!185575))

(declare-fun m!185577 () Bool)

(assert (=> b!122202 m!185577))

(declare-fun m!185579 () Bool)

(assert (=> b!122202 m!185579))

(declare-fun m!185581 () Bool)

(assert (=> b!122202 m!185581))

(declare-fun m!185583 () Bool)

(assert (=> b!122202 m!185583))

(declare-fun m!185585 () Bool)

(assert (=> b!122198 m!185585))

(declare-fun m!185587 () Bool)

(assert (=> b!122204 m!185587))

(declare-fun m!185589 () Bool)

(assert (=> b!122200 m!185589))

(assert (=> b!122200 m!185589))

(declare-fun m!185591 () Bool)

(assert (=> b!122200 m!185591))

(declare-fun m!185593 () Bool)

(assert (=> start!24156 m!185593))

(declare-fun m!185595 () Bool)

(assert (=> b!122201 m!185595))

(declare-fun m!185597 () Bool)

(assert (=> b!122203 m!185597))

(declare-fun m!185599 () Bool)

(assert (=> b!122209 m!185599))

(declare-fun m!185601 () Bool)

(assert (=> b!122205 m!185601))

(assert (=> b!122196 m!185577))

(assert (=> b!122196 m!185573))

(push 1)

(assert (not b!122209))

(assert (not b!122199))

(assert (not start!24156))

(assert (not b!122202))

(assert (not b!122208))

(assert (not b!122198))

(assert (not b!122200))

(assert (not b!122203))

(assert (not b!122201))

(assert (not b!122205))

(assert (not b!122196))

(assert (not b!122204))

(check-sat)

(pop 1)

(push 1)

(check-sat)

