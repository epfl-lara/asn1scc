; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24162 () Bool)

(assert start!24162)

(declare-fun b!122322 () Bool)

(declare-fun res!101352 () Bool)

(declare-fun e!80134 () Bool)

(assert (=> b!122322 (=> (not res!101352) (not e!80134))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> b!122322 (= res!101352 (bvslt i!615 nBits!396))))

(declare-fun b!122323 () Bool)

(declare-fun e!80133 () Bool)

(declare-datatypes ((array!5412 0))(
  ( (array!5413 (arr!3041 (Array (_ BitVec 32) (_ BitVec 8))) (size!2448 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4370 0))(
  ( (BitStream!4371 (buf!2888 array!5412) (currentByte!5585 (_ BitVec 32)) (currentBit!5580 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4370)

(declare-fun array_inv!2250 (array!5412) Bool)

(assert (=> b!122323 (= e!80133 (array_inv!2250 (buf!2888 thiss!1305)))))

(declare-fun b!122324 () Bool)

(declare-fun e!80140 () Bool)

(declare-fun e!80135 () Bool)

(assert (=> b!122324 (= e!80140 e!80135)))

(declare-fun res!101353 () Bool)

(assert (=> b!122324 (=> (not res!101353) (not e!80135))))

(declare-datatypes ((Unit!7535 0))(
  ( (Unit!7536) )
))
(declare-datatypes ((tuple2!10304 0))(
  ( (tuple2!10305 (_1!5417 Unit!7535) (_2!5417 BitStream!4370)) )
))
(declare-fun lt!192345 () tuple2!10304)

(declare-datatypes ((tuple2!10306 0))(
  ( (tuple2!10307 (_1!5418 BitStream!4370) (_2!5418 Bool)) )
))
(declare-fun lt!192364 () tuple2!10306)

(declare-fun lt!192363 () Bool)

(assert (=> b!122324 (= res!101353 (and (= (_2!5418 lt!192364) lt!192363) (= (_1!5418 lt!192364) (_2!5417 lt!192345))))))

(declare-fun readBitPure!0 (BitStream!4370) tuple2!10306)

(declare-fun readerFrom!0 (BitStream!4370 (_ BitVec 32) (_ BitVec 32)) BitStream!4370)

(assert (=> b!122324 (= lt!192364 (readBitPure!0 (readerFrom!0 (_2!5417 lt!192345) (currentBit!5580 thiss!1305) (currentByte!5585 thiss!1305))))))

(declare-fun b!122325 () Bool)

(declare-fun e!80142 () Bool)

(declare-fun lt!192359 () tuple2!10304)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!122325 (= e!80142 (invariant!0 (currentBit!5580 thiss!1305) (currentByte!5585 thiss!1305) (size!2448 (buf!2888 (_2!5417 lt!192359)))))))

(declare-fun b!122326 () Bool)

(declare-fun e!80139 () Bool)

(assert (=> b!122326 (= e!80139 e!80134)))

(declare-fun res!101359 () Bool)

(assert (=> b!122326 (=> (not res!101359) (not e!80134))))

(declare-fun lt!192352 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!122326 (= res!101359 (validate_offset_bits!1 ((_ sign_extend 32) (size!2448 (buf!2888 thiss!1305))) ((_ sign_extend 32) (currentByte!5585 thiss!1305)) ((_ sign_extend 32) (currentBit!5580 thiss!1305)) lt!192352))))

(assert (=> b!122326 (= lt!192352 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!122327 () Bool)

(declare-fun res!101358 () Bool)

(assert (=> b!122327 (=> (not res!101358) (not e!80142))))

(assert (=> b!122327 (= res!101358 (invariant!0 (currentBit!5580 thiss!1305) (currentByte!5585 thiss!1305) (size!2448 (buf!2888 (_2!5417 lt!192345)))))))

(declare-fun b!122328 () Bool)

(declare-fun e!80138 () Bool)

(assert (=> b!122328 (= e!80138 e!80140)))

(declare-fun res!101357 () Bool)

(assert (=> b!122328 (=> (not res!101357) (not e!80140))))

(declare-fun lt!192347 () (_ BitVec 64))

(declare-fun lt!192349 () (_ BitVec 64))

(assert (=> b!122328 (= res!101357 (= lt!192347 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!192349)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!122328 (= lt!192347 (bitIndex!0 (size!2448 (buf!2888 (_2!5417 lt!192345))) (currentByte!5585 (_2!5417 lt!192345)) (currentBit!5580 (_2!5417 lt!192345))))))

(assert (=> b!122328 (= lt!192349 (bitIndex!0 (size!2448 (buf!2888 thiss!1305)) (currentByte!5585 thiss!1305) (currentBit!5580 thiss!1305)))))

(declare-fun res!101360 () Bool)

(assert (=> start!24162 (=> (not res!101360) (not e!80139))))

(assert (=> start!24162 (= res!101360 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!24162 e!80139))

(assert (=> start!24162 true))

(declare-fun inv!12 (BitStream!4370) Bool)

(assert (=> start!24162 (and (inv!12 thiss!1305) e!80133)))

(declare-fun b!122329 () Bool)

(declare-fun e!80132 () Bool)

(declare-fun lt!192353 () tuple2!10306)

(declare-fun lt!192341 () tuple2!10306)

(assert (=> b!122329 (= e!80132 (= (_2!5418 lt!192353) (_2!5418 lt!192341)))))

(declare-fun b!122330 () Bool)

(declare-fun res!101363 () Bool)

(assert (=> b!122330 (=> (not res!101363) (not e!80140))))

(declare-fun isPrefixOf!0 (BitStream!4370 BitStream!4370) Bool)

(assert (=> b!122330 (= res!101363 (isPrefixOf!0 thiss!1305 (_2!5417 lt!192345)))))

(declare-fun b!122331 () Bool)

(declare-fun res!101356 () Bool)

(assert (=> b!122331 (=> (not res!101356) (not e!80134))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!122331 (= res!101356 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun lt!192357 () (_ BitVec 64))

(declare-fun e!80136 () Bool)

(declare-datatypes ((tuple2!10308 0))(
  ( (tuple2!10309 (_1!5419 BitStream!4370) (_2!5419 BitStream!4370)) )
))
(declare-fun lt!192340 () tuple2!10308)

(declare-fun lt!192354 () (_ BitVec 64))

(declare-fun b!122332 () Bool)

(declare-datatypes ((tuple2!10310 0))(
  ( (tuple2!10311 (_1!5420 BitStream!4370) (_2!5420 (_ BitVec 64))) )
))
(declare-fun lt!192366 () tuple2!10310)

(declare-fun lt!192339 () BitStream!4370)

(declare-fun lt!192351 () tuple2!10308)

(declare-fun lt!192360 () tuple2!10310)

(assert (=> b!122332 (= e!80136 (and (= lt!192354 (bvsub lt!192357 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!5419 lt!192351) lt!192339)) (and (= (_2!5420 lt!192360) (_2!5420 lt!192366)) (= (_1!5420 lt!192360) (_2!5419 lt!192340))))))))

(declare-fun b!122333 () Bool)

(assert (=> b!122333 (= e!80135 (= (bitIndex!0 (size!2448 (buf!2888 (_1!5418 lt!192364))) (currentByte!5585 (_1!5418 lt!192364)) (currentBit!5580 (_1!5418 lt!192364))) lt!192347))))

(declare-fun e!80137 () Bool)

(declare-fun b!122334 () Bool)

(declare-fun lt!192346 () (_ BitVec 64))

(assert (=> b!122334 (= e!80137 (or (not (= (_1!5419 lt!192351) lt!192339)) (not (= (size!2448 (buf!2888 thiss!1305)) (size!2448 (buf!2888 (_2!5417 lt!192359))))) (not (= lt!192346 (bvadd lt!192354 lt!192352))) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand i!615 #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 i!615) #b10000000000000000000000000000000))))))

(assert (=> b!122334 e!80136))

(declare-fun res!101364 () Bool)

(assert (=> b!122334 (=> (not res!101364) (not e!80136))))

(declare-fun withMovedBitIndex!0 (BitStream!4370 (_ BitVec 64)) BitStream!4370)

(assert (=> b!122334 (= res!101364 (= (_1!5419 lt!192351) (withMovedBitIndex!0 (_2!5419 lt!192351) (bvsub lt!192357 lt!192346))))))

(assert (=> b!122334 (= lt!192357 (bitIndex!0 (size!2448 (buf!2888 (_2!5417 lt!192345))) (currentByte!5585 (_2!5417 lt!192345)) (currentBit!5580 (_2!5417 lt!192345))))))

(assert (=> b!122334 (= (_1!5419 lt!192340) (withMovedBitIndex!0 (_2!5419 lt!192340) (bvsub lt!192354 lt!192346)))))

(assert (=> b!122334 (= lt!192346 (bitIndex!0 (size!2448 (buf!2888 (_2!5417 lt!192359))) (currentByte!5585 (_2!5417 lt!192359)) (currentBit!5580 (_2!5417 lt!192359))))))

(assert (=> b!122334 (= lt!192354 (bitIndex!0 (size!2448 (buf!2888 thiss!1305)) (currentByte!5585 thiss!1305) (currentBit!5580 thiss!1305)))))

(declare-fun lt!192350 () tuple2!10310)

(assert (=> b!122334 (and (= (_2!5420 lt!192360) (_2!5420 lt!192350)) (= (_1!5420 lt!192360) (_1!5420 lt!192350)))))

(declare-fun lt!192344 () (_ BitVec 64))

(declare-fun lt!192365 () Unit!7535)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4370 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!7535)

(assert (=> b!122334 (= lt!192365 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5419 lt!192340) nBits!396 i!615 lt!192344))))

(declare-fun lt!192342 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4370 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!10310)

(assert (=> b!122334 (= lt!192350 (readNLeastSignificantBitsLoopPure!0 lt!192339 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!192342))))

(assert (=> b!122334 (= lt!192339 (withMovedBitIndex!0 (_1!5419 lt!192340) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!122335 () Bool)

(assert (=> b!122335 (= e!80134 (not e!80137))))

(declare-fun res!101362 () Bool)

(assert (=> b!122335 (=> res!101362 e!80137)))

(assert (=> b!122335 (= res!101362 (not (= (_1!5420 lt!192366) (_2!5419 lt!192351))))))

(assert (=> b!122335 (= lt!192366 (readNLeastSignificantBitsLoopPure!0 (_1!5419 lt!192351) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!192342))))

(declare-fun lt!192358 () (_ BitVec 64))

(assert (=> b!122335 (validate_offset_bits!1 ((_ sign_extend 32) (size!2448 (buf!2888 (_2!5417 lt!192359)))) ((_ sign_extend 32) (currentByte!5585 (_2!5417 lt!192345))) ((_ sign_extend 32) (currentBit!5580 (_2!5417 lt!192345))) lt!192358)))

(declare-fun lt!192355 () Unit!7535)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4370 array!5412 (_ BitVec 64)) Unit!7535)

(assert (=> b!122335 (= lt!192355 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5417 lt!192345) (buf!2888 (_2!5417 lt!192359)) lt!192358))))

(assert (=> b!122335 (= lt!192358 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!192362 () tuple2!10306)

(declare-fun lt!192338 () (_ BitVec 64))

(assert (=> b!122335 (= lt!192342 (bvor lt!192344 (ite (_2!5418 lt!192362) lt!192338 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!122335 (= lt!192360 (readNLeastSignificantBitsLoopPure!0 (_1!5419 lt!192340) nBits!396 i!615 lt!192344))))

(assert (=> b!122335 (validate_offset_bits!1 ((_ sign_extend 32) (size!2448 (buf!2888 (_2!5417 lt!192359)))) ((_ sign_extend 32) (currentByte!5585 thiss!1305)) ((_ sign_extend 32) (currentBit!5580 thiss!1305)) lt!192352)))

(declare-fun lt!192348 () Unit!7535)

(assert (=> b!122335 (= lt!192348 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2888 (_2!5417 lt!192359)) lt!192352))))

(assert (=> b!122335 (= lt!192344 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(assert (=> b!122335 (= (_2!5418 lt!192362) lt!192363)))

(assert (=> b!122335 (= lt!192362 (readBitPure!0 (_1!5419 lt!192340)))))

(declare-fun reader!0 (BitStream!4370 BitStream!4370) tuple2!10308)

(assert (=> b!122335 (= lt!192351 (reader!0 (_2!5417 lt!192345) (_2!5417 lt!192359)))))

(assert (=> b!122335 (= lt!192340 (reader!0 thiss!1305 (_2!5417 lt!192359)))))

(assert (=> b!122335 e!80132))

(declare-fun res!101361 () Bool)

(assert (=> b!122335 (=> (not res!101361) (not e!80132))))

(assert (=> b!122335 (= res!101361 (= (bitIndex!0 (size!2448 (buf!2888 (_1!5418 lt!192353))) (currentByte!5585 (_1!5418 lt!192353)) (currentBit!5580 (_1!5418 lt!192353))) (bitIndex!0 (size!2448 (buf!2888 (_1!5418 lt!192341))) (currentByte!5585 (_1!5418 lt!192341)) (currentBit!5580 (_1!5418 lt!192341)))))))

(declare-fun lt!192356 () Unit!7535)

(declare-fun lt!192361 () BitStream!4370)

(declare-fun readBitPrefixLemma!0 (BitStream!4370 BitStream!4370) Unit!7535)

(assert (=> b!122335 (= lt!192356 (readBitPrefixLemma!0 lt!192361 (_2!5417 lt!192359)))))

(assert (=> b!122335 (= lt!192341 (readBitPure!0 (BitStream!4371 (buf!2888 (_2!5417 lt!192359)) (currentByte!5585 thiss!1305) (currentBit!5580 thiss!1305))))))

(assert (=> b!122335 (= lt!192353 (readBitPure!0 lt!192361))))

(assert (=> b!122335 (= lt!192361 (BitStream!4371 (buf!2888 (_2!5417 lt!192345)) (currentByte!5585 thiss!1305) (currentBit!5580 thiss!1305)))))

(assert (=> b!122335 e!80142))

(declare-fun res!101354 () Bool)

(assert (=> b!122335 (=> (not res!101354) (not e!80142))))

(assert (=> b!122335 (= res!101354 (isPrefixOf!0 thiss!1305 (_2!5417 lt!192359)))))

(declare-fun lt!192343 () Unit!7535)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4370 BitStream!4370 BitStream!4370) Unit!7535)

(assert (=> b!122335 (= lt!192343 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5417 lt!192345) (_2!5417 lt!192359)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4370 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!10304)

(assert (=> b!122335 (= lt!192359 (appendNLeastSignificantBitsLoop!0 (_2!5417 lt!192345) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!122335 e!80138))

(declare-fun res!101355 () Bool)

(assert (=> b!122335 (=> (not res!101355) (not e!80138))))

(assert (=> b!122335 (= res!101355 (= (size!2448 (buf!2888 thiss!1305)) (size!2448 (buf!2888 (_2!5417 lt!192345)))))))

(declare-fun appendBit!0 (BitStream!4370 Bool) tuple2!10304)

(assert (=> b!122335 (= lt!192345 (appendBit!0 thiss!1305 lt!192363))))

(assert (=> b!122335 (= lt!192363 (not (= (bvand v!199 lt!192338) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!122335 (= lt!192338 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(assert (= (and start!24162 res!101360) b!122326))

(assert (= (and b!122326 res!101359) b!122331))

(assert (= (and b!122331 res!101356) b!122322))

(assert (= (and b!122322 res!101352) b!122335))

(assert (= (and b!122335 res!101355) b!122328))

(assert (= (and b!122328 res!101357) b!122330))

(assert (= (and b!122330 res!101363) b!122324))

(assert (= (and b!122324 res!101353) b!122333))

(assert (= (and b!122335 res!101354) b!122327))

(assert (= (and b!122327 res!101358) b!122325))

(assert (= (and b!122335 res!101361) b!122329))

(assert (= (and b!122335 (not res!101362)) b!122334))

(assert (= (and b!122334 res!101364) b!122332))

(assert (= start!24162 b!122323))

(declare-fun m!185751 () Bool)

(assert (=> b!122334 m!185751))

(declare-fun m!185753 () Bool)

(assert (=> b!122334 m!185753))

(declare-fun m!185755 () Bool)

(assert (=> b!122334 m!185755))

(declare-fun m!185757 () Bool)

(assert (=> b!122334 m!185757))

(declare-fun m!185759 () Bool)

(assert (=> b!122334 m!185759))

(declare-fun m!185761 () Bool)

(assert (=> b!122334 m!185761))

(declare-fun m!185763 () Bool)

(assert (=> b!122334 m!185763))

(declare-fun m!185765 () Bool)

(assert (=> b!122334 m!185765))

(declare-fun m!185767 () Bool)

(assert (=> b!122335 m!185767))

(declare-fun m!185769 () Bool)

(assert (=> b!122335 m!185769))

(declare-fun m!185771 () Bool)

(assert (=> b!122335 m!185771))

(declare-fun m!185773 () Bool)

(assert (=> b!122335 m!185773))

(declare-fun m!185775 () Bool)

(assert (=> b!122335 m!185775))

(declare-fun m!185777 () Bool)

(assert (=> b!122335 m!185777))

(declare-fun m!185779 () Bool)

(assert (=> b!122335 m!185779))

(declare-fun m!185781 () Bool)

(assert (=> b!122335 m!185781))

(declare-fun m!185783 () Bool)

(assert (=> b!122335 m!185783))

(declare-fun m!185785 () Bool)

(assert (=> b!122335 m!185785))

(declare-fun m!185787 () Bool)

(assert (=> b!122335 m!185787))

(declare-fun m!185789 () Bool)

(assert (=> b!122335 m!185789))

(declare-fun m!185791 () Bool)

(assert (=> b!122335 m!185791))

(declare-fun m!185793 () Bool)

(assert (=> b!122335 m!185793))

(declare-fun m!185795 () Bool)

(assert (=> b!122335 m!185795))

(declare-fun m!185797 () Bool)

(assert (=> b!122335 m!185797))

(declare-fun m!185799 () Bool)

(assert (=> b!122335 m!185799))

(declare-fun m!185801 () Bool)

(assert (=> b!122335 m!185801))

(declare-fun m!185803 () Bool)

(assert (=> b!122335 m!185803))

(assert (=> b!122328 m!185763))

(assert (=> b!122328 m!185753))

(declare-fun m!185805 () Bool)

(assert (=> b!122333 m!185805))

(declare-fun m!185807 () Bool)

(assert (=> b!122323 m!185807))

(declare-fun m!185809 () Bool)

(assert (=> b!122325 m!185809))

(declare-fun m!185811 () Bool)

(assert (=> b!122326 m!185811))

(declare-fun m!185813 () Bool)

(assert (=> b!122330 m!185813))

(declare-fun m!185815 () Bool)

(assert (=> b!122331 m!185815))

(declare-fun m!185817 () Bool)

(assert (=> start!24162 m!185817))

(declare-fun m!185819 () Bool)

(assert (=> b!122324 m!185819))

(assert (=> b!122324 m!185819))

(declare-fun m!185821 () Bool)

(assert (=> b!122324 m!185821))

(declare-fun m!185823 () Bool)

(assert (=> b!122327 m!185823))

(push 1)

(assert (not b!122331))

(assert (not b!122327))

(assert (not b!122328))

(assert (not b!122334))

(assert (not b!122323))

(assert (not start!24162))

(assert (not b!122326))

(assert (not b!122330))

(assert (not b!122335))

(assert (not b!122324))

(assert (not b!122333))

(assert (not b!122325))

(check-sat)

(pop 1)

(push 1)

(check-sat)

