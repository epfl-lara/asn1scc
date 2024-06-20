; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22988 () Bool)

(assert start!22988)

(declare-fun b!116522 () Bool)

(declare-fun e!76378 () Bool)

(declare-datatypes ((array!5252 0))(
  ( (array!5253 (arr!2976 (Array (_ BitVec 32) (_ BitVec 8))) (size!2383 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4240 0))(
  ( (BitStream!4241 (buf!2793 array!5252) (currentByte!5430 (_ BitVec 32)) (currentBit!5425 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4240)

(declare-datatypes ((Unit!7171 0))(
  ( (Unit!7172) )
))
(declare-datatypes ((tuple2!9664 0))(
  ( (tuple2!9665 (_1!5097 Unit!7171) (_2!5097 BitStream!4240)) )
))
(declare-fun lt!178076 () tuple2!9664)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!116522 (= e!76378 (invariant!0 (currentBit!5425 thiss!1305) (currentByte!5430 thiss!1305) (size!2383 (buf!2793 (_2!5097 lt!178076)))))))

(declare-fun b!116523 () Bool)

(declare-fun res!96355 () Bool)

(declare-fun e!76386 () Bool)

(assert (=> b!116523 (=> (not res!96355) (not e!76386))))

(declare-fun lt!178062 () tuple2!9664)

(declare-fun isPrefixOf!0 (BitStream!4240 BitStream!4240) Bool)

(assert (=> b!116523 (= res!96355 (isPrefixOf!0 thiss!1305 (_2!5097 lt!178062)))))

(declare-fun b!116524 () Bool)

(declare-fun e!76385 () Bool)

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!116524 (= e!76385 (not (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand i!615 #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 i!615) #b10000000000000000000000000000000)))))))

(declare-fun v!199 () (_ BitVec 64))

(declare-datatypes ((tuple2!9666 0))(
  ( (tuple2!9667 (_1!5098 BitStream!4240) (_2!5098 (_ BitVec 64))) )
))
(declare-fun lt!178072 () tuple2!9666)

(declare-datatypes ((tuple2!9668 0))(
  ( (tuple2!9669 (_1!5099 BitStream!4240) (_2!5099 BitStream!4240)) )
))
(declare-fun lt!178069 () tuple2!9668)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4240 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9666)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!116524 (= lt!178072 (readNLeastSignificantBitsLoopPure!0 (_1!5099 lt!178069) nBits!396 i!615 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615))))))))

(declare-fun lt!178066 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!116524 (validate_offset_bits!1 ((_ sign_extend 32) (size!2383 (buf!2793 (_2!5097 lt!178076)))) ((_ sign_extend 32) (currentByte!5430 thiss!1305)) ((_ sign_extend 32) (currentBit!5425 thiss!1305)) lt!178066)))

(declare-fun lt!178073 () Unit!7171)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4240 array!5252 (_ BitVec 64)) Unit!7171)

(assert (=> b!116524 (= lt!178073 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2793 (_2!5097 lt!178076)) lt!178066))))

(declare-fun lt!178063 () Bool)

(declare-datatypes ((tuple2!9670 0))(
  ( (tuple2!9671 (_1!5100 BitStream!4240) (_2!5100 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!4240) tuple2!9670)

(assert (=> b!116524 (= (_2!5100 (readBitPure!0 (_1!5099 lt!178069))) lt!178063)))

(declare-fun lt!178067 () tuple2!9668)

(declare-fun reader!0 (BitStream!4240 BitStream!4240) tuple2!9668)

(assert (=> b!116524 (= lt!178067 (reader!0 (_2!5097 lt!178062) (_2!5097 lt!178076)))))

(assert (=> b!116524 (= lt!178069 (reader!0 thiss!1305 (_2!5097 lt!178076)))))

(declare-fun e!76383 () Bool)

(assert (=> b!116524 e!76383))

(declare-fun res!96352 () Bool)

(assert (=> b!116524 (=> (not res!96352) (not e!76383))))

(declare-fun lt!178077 () tuple2!9670)

(declare-fun lt!178064 () tuple2!9670)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!116524 (= res!96352 (= (bitIndex!0 (size!2383 (buf!2793 (_1!5100 lt!178077))) (currentByte!5430 (_1!5100 lt!178077)) (currentBit!5425 (_1!5100 lt!178077))) (bitIndex!0 (size!2383 (buf!2793 (_1!5100 lt!178064))) (currentByte!5430 (_1!5100 lt!178064)) (currentBit!5425 (_1!5100 lt!178064)))))))

(declare-fun lt!178075 () Unit!7171)

(declare-fun lt!178068 () BitStream!4240)

(declare-fun readBitPrefixLemma!0 (BitStream!4240 BitStream!4240) Unit!7171)

(assert (=> b!116524 (= lt!178075 (readBitPrefixLemma!0 lt!178068 (_2!5097 lt!178076)))))

(assert (=> b!116524 (= lt!178064 (readBitPure!0 (BitStream!4241 (buf!2793 (_2!5097 lt!178076)) (currentByte!5430 thiss!1305) (currentBit!5425 thiss!1305))))))

(assert (=> b!116524 (= lt!178077 (readBitPure!0 lt!178068))))

(assert (=> b!116524 (= lt!178068 (BitStream!4241 (buf!2793 (_2!5097 lt!178062)) (currentByte!5430 thiss!1305) (currentBit!5425 thiss!1305)))))

(assert (=> b!116524 e!76378))

(declare-fun res!96351 () Bool)

(assert (=> b!116524 (=> (not res!96351) (not e!76378))))

(assert (=> b!116524 (= res!96351 (isPrefixOf!0 thiss!1305 (_2!5097 lt!178076)))))

(declare-fun lt!178065 () Unit!7171)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4240 BitStream!4240 BitStream!4240) Unit!7171)

(assert (=> b!116524 (= lt!178065 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5097 lt!178062) (_2!5097 lt!178076)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4240 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9664)

(assert (=> b!116524 (= lt!178076 (appendNLeastSignificantBitsLoop!0 (_2!5097 lt!178062) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!76380 () Bool)

(assert (=> b!116524 e!76380))

(declare-fun res!96347 () Bool)

(assert (=> b!116524 (=> (not res!96347) (not e!76380))))

(assert (=> b!116524 (= res!96347 (= (size!2383 (buf!2793 thiss!1305)) (size!2383 (buf!2793 (_2!5097 lt!178062)))))))

(declare-fun appendBit!0 (BitStream!4240 Bool) tuple2!9664)

(assert (=> b!116524 (= lt!178062 (appendBit!0 thiss!1305 lt!178063))))

(assert (=> b!116524 (= lt!178063 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!116525 () Bool)

(declare-fun e!76384 () Bool)

(declare-fun array_inv!2185 (array!5252) Bool)

(assert (=> b!116525 (= e!76384 (array_inv!2185 (buf!2793 thiss!1305)))))

(declare-fun b!116527 () Bool)

(declare-fun e!76382 () Bool)

(declare-fun lt!178071 () tuple2!9670)

(declare-fun lt!178074 () (_ BitVec 64))

(assert (=> b!116527 (= e!76382 (= (bitIndex!0 (size!2383 (buf!2793 (_1!5100 lt!178071))) (currentByte!5430 (_1!5100 lt!178071)) (currentBit!5425 (_1!5100 lt!178071))) lt!178074))))

(declare-fun b!116528 () Bool)

(assert (=> b!116528 (= e!76380 e!76386)))

(declare-fun res!96353 () Bool)

(assert (=> b!116528 (=> (not res!96353) (not e!76386))))

(declare-fun lt!178070 () (_ BitVec 64))

(assert (=> b!116528 (= res!96353 (= lt!178074 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!178070)))))

(assert (=> b!116528 (= lt!178074 (bitIndex!0 (size!2383 (buf!2793 (_2!5097 lt!178062))) (currentByte!5430 (_2!5097 lt!178062)) (currentBit!5425 (_2!5097 lt!178062))))))

(assert (=> b!116528 (= lt!178070 (bitIndex!0 (size!2383 (buf!2793 thiss!1305)) (currentByte!5430 thiss!1305) (currentBit!5425 thiss!1305)))))

(declare-fun b!116529 () Bool)

(assert (=> b!116529 (= e!76383 (= (_2!5100 lt!178077) (_2!5100 lt!178064)))))

(declare-fun b!116530 () Bool)

(assert (=> b!116530 (= e!76386 e!76382)))

(declare-fun res!96350 () Bool)

(assert (=> b!116530 (=> (not res!96350) (not e!76382))))

(assert (=> b!116530 (= res!96350 (and (= (_2!5100 lt!178071) lt!178063) (= (_1!5100 lt!178071) (_2!5097 lt!178062))))))

(declare-fun readerFrom!0 (BitStream!4240 (_ BitVec 32) (_ BitVec 32)) BitStream!4240)

(assert (=> b!116530 (= lt!178071 (readBitPure!0 (readerFrom!0 (_2!5097 lt!178062) (currentBit!5425 thiss!1305) (currentByte!5430 thiss!1305))))))

(declare-fun b!116531 () Bool)

(declare-fun res!96348 () Bool)

(assert (=> b!116531 (=> (not res!96348) (not e!76378))))

(assert (=> b!116531 (= res!96348 (invariant!0 (currentBit!5425 thiss!1305) (currentByte!5430 thiss!1305) (size!2383 (buf!2793 (_2!5097 lt!178062)))))))

(declare-fun b!116532 () Bool)

(declare-fun res!96349 () Bool)

(assert (=> b!116532 (=> (not res!96349) (not e!76385))))

(assert (=> b!116532 (= res!96349 (bvslt i!615 nBits!396))))

(declare-fun b!116533 () Bool)

(declare-fun res!96356 () Bool)

(assert (=> b!116533 (=> (not res!96356) (not e!76385))))

(assert (=> b!116533 (= res!96356 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun res!96357 () Bool)

(declare-fun e!76381 () Bool)

(assert (=> start!22988 (=> (not res!96357) (not e!76381))))

(assert (=> start!22988 (= res!96357 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!22988 e!76381))

(assert (=> start!22988 true))

(declare-fun inv!12 (BitStream!4240) Bool)

(assert (=> start!22988 (and (inv!12 thiss!1305) e!76384)))

(declare-fun b!116526 () Bool)

(assert (=> b!116526 (= e!76381 e!76385)))

(declare-fun res!96354 () Bool)

(assert (=> b!116526 (=> (not res!96354) (not e!76385))))

(assert (=> b!116526 (= res!96354 (validate_offset_bits!1 ((_ sign_extend 32) (size!2383 (buf!2793 thiss!1305))) ((_ sign_extend 32) (currentByte!5430 thiss!1305)) ((_ sign_extend 32) (currentBit!5425 thiss!1305)) lt!178066))))

(assert (=> b!116526 (= lt!178066 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(assert (= (and start!22988 res!96357) b!116526))

(assert (= (and b!116526 res!96354) b!116533))

(assert (= (and b!116533 res!96356) b!116532))

(assert (= (and b!116532 res!96349) b!116524))

(assert (= (and b!116524 res!96347) b!116528))

(assert (= (and b!116528 res!96353) b!116523))

(assert (= (and b!116523 res!96355) b!116530))

(assert (= (and b!116530 res!96350) b!116527))

(assert (= (and b!116524 res!96351) b!116531))

(assert (= (and b!116531 res!96348) b!116522))

(assert (= (and b!116524 res!96352) b!116529))

(assert (= start!22988 b!116525))

(declare-fun m!174491 () Bool)

(assert (=> b!116522 m!174491))

(declare-fun m!174493 () Bool)

(assert (=> b!116526 m!174493))

(declare-fun m!174495 () Bool)

(assert (=> b!116530 m!174495))

(assert (=> b!116530 m!174495))

(declare-fun m!174497 () Bool)

(assert (=> b!116530 m!174497))

(declare-fun m!174499 () Bool)

(assert (=> b!116531 m!174499))

(declare-fun m!174501 () Bool)

(assert (=> b!116533 m!174501))

(declare-fun m!174503 () Bool)

(assert (=> b!116523 m!174503))

(declare-fun m!174505 () Bool)

(assert (=> b!116524 m!174505))

(declare-fun m!174507 () Bool)

(assert (=> b!116524 m!174507))

(declare-fun m!174509 () Bool)

(assert (=> b!116524 m!174509))

(declare-fun m!174511 () Bool)

(assert (=> b!116524 m!174511))

(declare-fun m!174513 () Bool)

(assert (=> b!116524 m!174513))

(declare-fun m!174515 () Bool)

(assert (=> b!116524 m!174515))

(declare-fun m!174517 () Bool)

(assert (=> b!116524 m!174517))

(declare-fun m!174519 () Bool)

(assert (=> b!116524 m!174519))

(declare-fun m!174521 () Bool)

(assert (=> b!116524 m!174521))

(declare-fun m!174523 () Bool)

(assert (=> b!116524 m!174523))

(declare-fun m!174525 () Bool)

(assert (=> b!116524 m!174525))

(declare-fun m!174527 () Bool)

(assert (=> b!116524 m!174527))

(declare-fun m!174529 () Bool)

(assert (=> b!116524 m!174529))

(declare-fun m!174531 () Bool)

(assert (=> b!116524 m!174531))

(declare-fun m!174533 () Bool)

(assert (=> b!116524 m!174533))

(declare-fun m!174535 () Bool)

(assert (=> b!116524 m!174535))

(declare-fun m!174537 () Bool)

(assert (=> b!116527 m!174537))

(declare-fun m!174539 () Bool)

(assert (=> b!116525 m!174539))

(declare-fun m!174541 () Bool)

(assert (=> start!22988 m!174541))

(declare-fun m!174543 () Bool)

(assert (=> b!116528 m!174543))

(declare-fun m!174545 () Bool)

(assert (=> b!116528 m!174545))

(push 1)

(assert (not b!116530))

(assert (not b!116526))

(assert (not b!116522))

(assert (not b!116524))

(assert (not b!116533))

(assert (not start!22988))

(assert (not b!116525))

(assert (not b!116527))

(assert (not b!116523))

(assert (not b!116528))

(assert (not b!116531))

(check-sat)

(pop 1)

(push 1)

(check-sat)

