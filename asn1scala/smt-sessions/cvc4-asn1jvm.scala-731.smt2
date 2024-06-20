; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20366 () Bool)

(assert start!20366)

(declare-fun b!102570 () Bool)

(declare-fun e!67137 () Bool)

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!102570 (= e!67137 (not (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-datatypes ((array!4810 0))(
  ( (array!4811 (arr!2789 (Array (_ BitVec 32) (_ BitVec 8))) (size!2196 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3866 0))(
  ( (BitStream!3867 (buf!2556 array!4810) (currentByte!5029 (_ BitVec 32)) (currentBit!5024 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!6288 0))(
  ( (Unit!6289) )
))
(declare-datatypes ((tuple2!8390 0))(
  ( (tuple2!8391 (_1!4450 Unit!6288) (_2!4450 BitStream!3866)) )
))
(declare-fun lt!149196 () tuple2!8390)

(declare-fun lt!149199 () tuple2!8390)

(declare-fun lt!149203 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!102570 (validate_offset_bits!1 ((_ sign_extend 32) (size!2196 (buf!2556 (_2!4450 lt!149196)))) ((_ sign_extend 32) (currentByte!5029 (_2!4450 lt!149199))) ((_ sign_extend 32) (currentBit!5024 (_2!4450 lt!149199))) lt!149203)))

(declare-fun lt!149193 () Unit!6288)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3866 array!4810 (_ BitVec 64)) Unit!6288)

(assert (=> b!102570 (= lt!149193 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4450 lt!149199) (buf!2556 (_2!4450 lt!149196)) lt!149203))))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> b!102570 (= lt!149203 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!8392 0))(
  ( (tuple2!8393 (_1!4451 BitStream!3866) (_2!4451 BitStream!3866)) )
))
(declare-fun lt!149192 () tuple2!8392)

(declare-datatypes ((tuple2!8394 0))(
  ( (tuple2!8395 (_1!4452 BitStream!3866) (_2!4452 (_ BitVec 64))) )
))
(declare-fun lt!149189 () tuple2!8394)

(declare-fun v!199 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3866 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8394)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!102570 (= lt!149189 (readNLeastSignificantBitsLoopPure!0 (_1!4451 lt!149192) nBits!396 i!615 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615))))))))

(declare-fun thiss!1305 () BitStream!3866)

(declare-fun lt!149198 () (_ BitVec 64))

(assert (=> b!102570 (validate_offset_bits!1 ((_ sign_extend 32) (size!2196 (buf!2556 (_2!4450 lt!149196)))) ((_ sign_extend 32) (currentByte!5029 thiss!1305)) ((_ sign_extend 32) (currentBit!5024 thiss!1305)) lt!149198)))

(declare-fun lt!149195 () Unit!6288)

(assert (=> b!102570 (= lt!149195 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2556 (_2!4450 lt!149196)) lt!149198))))

(declare-fun lt!149194 () Bool)

(declare-datatypes ((tuple2!8396 0))(
  ( (tuple2!8397 (_1!4453 BitStream!3866) (_2!4453 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!3866) tuple2!8396)

(assert (=> b!102570 (= (_2!4453 (readBitPure!0 (_1!4451 lt!149192))) lt!149194)))

(declare-fun lt!149201 () tuple2!8392)

(declare-fun reader!0 (BitStream!3866 BitStream!3866) tuple2!8392)

(assert (=> b!102570 (= lt!149201 (reader!0 (_2!4450 lt!149199) (_2!4450 lt!149196)))))

(assert (=> b!102570 (= lt!149192 (reader!0 thiss!1305 (_2!4450 lt!149196)))))

(declare-fun e!67133 () Bool)

(assert (=> b!102570 e!67133))

(declare-fun res!84354 () Bool)

(assert (=> b!102570 (=> (not res!84354) (not e!67133))))

(declare-fun lt!149190 () tuple2!8396)

(declare-fun lt!149197 () tuple2!8396)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!102570 (= res!84354 (= (bitIndex!0 (size!2196 (buf!2556 (_1!4453 lt!149190))) (currentByte!5029 (_1!4453 lt!149190)) (currentBit!5024 (_1!4453 lt!149190))) (bitIndex!0 (size!2196 (buf!2556 (_1!4453 lt!149197))) (currentByte!5029 (_1!4453 lt!149197)) (currentBit!5024 (_1!4453 lt!149197)))))))

(declare-fun lt!149191 () Unit!6288)

(declare-fun lt!149204 () BitStream!3866)

(declare-fun readBitPrefixLemma!0 (BitStream!3866 BitStream!3866) Unit!6288)

(assert (=> b!102570 (= lt!149191 (readBitPrefixLemma!0 lt!149204 (_2!4450 lt!149196)))))

(assert (=> b!102570 (= lt!149197 (readBitPure!0 (BitStream!3867 (buf!2556 (_2!4450 lt!149196)) (currentByte!5029 thiss!1305) (currentBit!5024 thiss!1305))))))

(assert (=> b!102570 (= lt!149190 (readBitPure!0 lt!149204))))

(assert (=> b!102570 (= lt!149204 (BitStream!3867 (buf!2556 (_2!4450 lt!149199)) (currentByte!5029 thiss!1305) (currentBit!5024 thiss!1305)))))

(declare-fun e!67129 () Bool)

(assert (=> b!102570 e!67129))

(declare-fun res!84355 () Bool)

(assert (=> b!102570 (=> (not res!84355) (not e!67129))))

(declare-fun isPrefixOf!0 (BitStream!3866 BitStream!3866) Bool)

(assert (=> b!102570 (= res!84355 (isPrefixOf!0 thiss!1305 (_2!4450 lt!149196)))))

(declare-fun lt!149200 () Unit!6288)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3866 BitStream!3866 BitStream!3866) Unit!6288)

(assert (=> b!102570 (= lt!149200 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4450 lt!149199) (_2!4450 lt!149196)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3866 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8390)

(assert (=> b!102570 (= lt!149196 (appendNLeastSignificantBitsLoop!0 (_2!4450 lt!149199) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!67130 () Bool)

(assert (=> b!102570 e!67130))

(declare-fun res!84362 () Bool)

(assert (=> b!102570 (=> (not res!84362) (not e!67130))))

(assert (=> b!102570 (= res!84362 (= (size!2196 (buf!2556 thiss!1305)) (size!2196 (buf!2556 (_2!4450 lt!149199)))))))

(declare-fun appendBit!0 (BitStream!3866 Bool) tuple2!8390)

(assert (=> b!102570 (= lt!149199 (appendBit!0 thiss!1305 lt!149194))))

(assert (=> b!102570 (= lt!149194 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!102571 () Bool)

(declare-fun e!67132 () Bool)

(declare-fun e!67135 () Bool)

(assert (=> b!102571 (= e!67132 e!67135)))

(declare-fun res!84353 () Bool)

(assert (=> b!102571 (=> (not res!84353) (not e!67135))))

(declare-fun lt!149202 () tuple2!8396)

(assert (=> b!102571 (= res!84353 (and (= (_2!4453 lt!149202) lt!149194) (= (_1!4453 lt!149202) (_2!4450 lt!149199))))))

(declare-fun readerFrom!0 (BitStream!3866 (_ BitVec 32) (_ BitVec 32)) BitStream!3866)

(assert (=> b!102571 (= lt!149202 (readBitPure!0 (readerFrom!0 (_2!4450 lt!149199) (currentBit!5024 thiss!1305) (currentByte!5029 thiss!1305))))))

(declare-fun res!84356 () Bool)

(declare-fun e!67136 () Bool)

(assert (=> start!20366 (=> (not res!84356) (not e!67136))))

(assert (=> start!20366 (= res!84356 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20366 e!67136))

(assert (=> start!20366 true))

(declare-fun e!67134 () Bool)

(declare-fun inv!12 (BitStream!3866) Bool)

(assert (=> start!20366 (and (inv!12 thiss!1305) e!67134)))

(declare-fun b!102572 () Bool)

(assert (=> b!102572 (= e!67130 e!67132)))

(declare-fun res!84357 () Bool)

(assert (=> b!102572 (=> (not res!84357) (not e!67132))))

(declare-fun lt!149205 () (_ BitVec 64))

(declare-fun lt!149206 () (_ BitVec 64))

(assert (=> b!102572 (= res!84357 (= lt!149205 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!149206)))))

(assert (=> b!102572 (= lt!149205 (bitIndex!0 (size!2196 (buf!2556 (_2!4450 lt!149199))) (currentByte!5029 (_2!4450 lt!149199)) (currentBit!5024 (_2!4450 lt!149199))))))

(assert (=> b!102572 (= lt!149206 (bitIndex!0 (size!2196 (buf!2556 thiss!1305)) (currentByte!5029 thiss!1305) (currentBit!5024 thiss!1305)))))

(declare-fun b!102573 () Bool)

(declare-fun res!84352 () Bool)

(assert (=> b!102573 (=> (not res!84352) (not e!67137))))

(assert (=> b!102573 (= res!84352 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!102574 () Bool)

(declare-fun res!84359 () Bool)

(assert (=> b!102574 (=> (not res!84359) (not e!67137))))

(assert (=> b!102574 (= res!84359 (bvslt i!615 nBits!396))))

(declare-fun b!102575 () Bool)

(declare-fun res!84361 () Bool)

(assert (=> b!102575 (=> (not res!84361) (not e!67129))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!102575 (= res!84361 (invariant!0 (currentBit!5024 thiss!1305) (currentByte!5029 thiss!1305) (size!2196 (buf!2556 (_2!4450 lt!149199)))))))

(declare-fun b!102576 () Bool)

(assert (=> b!102576 (= e!67135 (= (bitIndex!0 (size!2196 (buf!2556 (_1!4453 lt!149202))) (currentByte!5029 (_1!4453 lt!149202)) (currentBit!5024 (_1!4453 lt!149202))) lt!149205))))

(declare-fun b!102577 () Bool)

(declare-fun res!84360 () Bool)

(assert (=> b!102577 (=> (not res!84360) (not e!67132))))

(assert (=> b!102577 (= res!84360 (isPrefixOf!0 thiss!1305 (_2!4450 lt!149199)))))

(declare-fun b!102578 () Bool)

(assert (=> b!102578 (= e!67129 (invariant!0 (currentBit!5024 thiss!1305) (currentByte!5029 thiss!1305) (size!2196 (buf!2556 (_2!4450 lt!149196)))))))

(declare-fun b!102579 () Bool)

(declare-fun array_inv!1998 (array!4810) Bool)

(assert (=> b!102579 (= e!67134 (array_inv!1998 (buf!2556 thiss!1305)))))

(declare-fun b!102580 () Bool)

(assert (=> b!102580 (= e!67136 e!67137)))

(declare-fun res!84358 () Bool)

(assert (=> b!102580 (=> (not res!84358) (not e!67137))))

(assert (=> b!102580 (= res!84358 (validate_offset_bits!1 ((_ sign_extend 32) (size!2196 (buf!2556 thiss!1305))) ((_ sign_extend 32) (currentByte!5029 thiss!1305)) ((_ sign_extend 32) (currentBit!5024 thiss!1305)) lt!149198))))

(assert (=> b!102580 (= lt!149198 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!102581 () Bool)

(assert (=> b!102581 (= e!67133 (= (_2!4453 lt!149190) (_2!4453 lt!149197)))))

(assert (= (and start!20366 res!84356) b!102580))

(assert (= (and b!102580 res!84358) b!102573))

(assert (= (and b!102573 res!84352) b!102574))

(assert (= (and b!102574 res!84359) b!102570))

(assert (= (and b!102570 res!84362) b!102572))

(assert (= (and b!102572 res!84357) b!102577))

(assert (= (and b!102577 res!84360) b!102571))

(assert (= (and b!102571 res!84353) b!102576))

(assert (= (and b!102570 res!84355) b!102575))

(assert (= (and b!102575 res!84361) b!102578))

(assert (= (and b!102570 res!84354) b!102581))

(assert (= start!20366 b!102579))

(declare-fun m!149395 () Bool)

(assert (=> b!102579 m!149395))

(declare-fun m!149397 () Bool)

(assert (=> b!102578 m!149397))

(declare-fun m!149399 () Bool)

(assert (=> b!102580 m!149399))

(declare-fun m!149401 () Bool)

(assert (=> b!102575 m!149401))

(declare-fun m!149403 () Bool)

(assert (=> b!102577 m!149403))

(declare-fun m!149405 () Bool)

(assert (=> b!102573 m!149405))

(declare-fun m!149407 () Bool)

(assert (=> b!102576 m!149407))

(declare-fun m!149409 () Bool)

(assert (=> b!102570 m!149409))

(declare-fun m!149411 () Bool)

(assert (=> b!102570 m!149411))

(declare-fun m!149413 () Bool)

(assert (=> b!102570 m!149413))

(declare-fun m!149415 () Bool)

(assert (=> b!102570 m!149415))

(declare-fun m!149417 () Bool)

(assert (=> b!102570 m!149417))

(declare-fun m!149419 () Bool)

(assert (=> b!102570 m!149419))

(declare-fun m!149421 () Bool)

(assert (=> b!102570 m!149421))

(declare-fun m!149423 () Bool)

(assert (=> b!102570 m!149423))

(declare-fun m!149425 () Bool)

(assert (=> b!102570 m!149425))

(declare-fun m!149427 () Bool)

(assert (=> b!102570 m!149427))

(declare-fun m!149429 () Bool)

(assert (=> b!102570 m!149429))

(declare-fun m!149431 () Bool)

(assert (=> b!102570 m!149431))

(declare-fun m!149433 () Bool)

(assert (=> b!102570 m!149433))

(declare-fun m!149435 () Bool)

(assert (=> b!102570 m!149435))

(declare-fun m!149437 () Bool)

(assert (=> b!102570 m!149437))

(declare-fun m!149439 () Bool)

(assert (=> b!102570 m!149439))

(declare-fun m!149441 () Bool)

(assert (=> b!102570 m!149441))

(declare-fun m!149443 () Bool)

(assert (=> b!102570 m!149443))

(declare-fun m!149445 () Bool)

(assert (=> start!20366 m!149445))

(declare-fun m!149447 () Bool)

(assert (=> b!102572 m!149447))

(declare-fun m!149449 () Bool)

(assert (=> b!102572 m!149449))

(declare-fun m!149451 () Bool)

(assert (=> b!102571 m!149451))

(assert (=> b!102571 m!149451))

(declare-fun m!149453 () Bool)

(assert (=> b!102571 m!149453))

(push 1)

(assert (not b!102580))

(assert (not b!102573))

(assert (not start!20366))

(assert (not b!102572))

(assert (not b!102578))

(assert (not b!102571))

(assert (not b!102579))

(assert (not b!102575))

(assert (not b!102577))

(assert (not b!102570))

(assert (not b!102576))

(check-sat)

(pop 1)

(push 1)

(check-sat)

