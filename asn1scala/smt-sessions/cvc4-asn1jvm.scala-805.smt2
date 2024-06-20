; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!23340 () Bool)

(assert start!23340)

(declare-fun b!118663 () Bool)

(declare-fun res!98218 () Bool)

(declare-fun e!77808 () Bool)

(assert (=> b!118663 (=> (not res!98218) (not e!77808))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!118663 (= res!98218 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!118664 () Bool)

(declare-fun e!77804 () Bool)

(declare-fun e!77801 () Bool)

(assert (=> b!118664 (= e!77804 e!77801)))

(declare-fun res!98212 () Bool)

(assert (=> b!118664 (=> (not res!98212) (not e!77801))))

(declare-datatypes ((array!5325 0))(
  ( (array!5326 (arr!3008 (Array (_ BitVec 32) (_ BitVec 8))) (size!2415 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4304 0))(
  ( (BitStream!4305 (buf!2834 array!5325) (currentByte!5489 (_ BitVec 32)) (currentBit!5484 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!7301 0))(
  ( (Unit!7302) )
))
(declare-datatypes ((tuple2!9956 0))(
  ( (tuple2!9957 (_1!5243 Unit!7301) (_2!5243 BitStream!4304)) )
))
(declare-fun lt!182621 () tuple2!9956)

(declare-fun lt!182618 () Bool)

(declare-datatypes ((tuple2!9958 0))(
  ( (tuple2!9959 (_1!5244 BitStream!4304) (_2!5244 Bool)) )
))
(declare-fun lt!182619 () tuple2!9958)

(assert (=> b!118664 (= res!98212 (and (= (_2!5244 lt!182619) lt!182618) (= (_1!5244 lt!182619) (_2!5243 lt!182621))))))

(declare-fun thiss!1305 () BitStream!4304)

(declare-fun readBitPure!0 (BitStream!4304) tuple2!9958)

(declare-fun readerFrom!0 (BitStream!4304 (_ BitVec 32) (_ BitVec 32)) BitStream!4304)

(assert (=> b!118664 (= lt!182619 (readBitPure!0 (readerFrom!0 (_2!5243 lt!182621) (currentBit!5484 thiss!1305) (currentByte!5489 thiss!1305))))))

(declare-fun b!118665 () Bool)

(declare-fun e!77806 () Bool)

(assert (=> b!118665 (= e!77806 e!77804)))

(declare-fun res!98220 () Bool)

(assert (=> b!118665 (=> (not res!98220) (not e!77804))))

(declare-fun lt!182616 () (_ BitVec 64))

(declare-fun lt!182611 () (_ BitVec 64))

(assert (=> b!118665 (= res!98220 (= lt!182616 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!182611)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!118665 (= lt!182616 (bitIndex!0 (size!2415 (buf!2834 (_2!5243 lt!182621))) (currentByte!5489 (_2!5243 lt!182621)) (currentBit!5484 (_2!5243 lt!182621))))))

(assert (=> b!118665 (= lt!182611 (bitIndex!0 (size!2415 (buf!2834 thiss!1305)) (currentByte!5489 thiss!1305) (currentBit!5484 thiss!1305)))))

(declare-fun res!98213 () Bool)

(declare-fun e!77807 () Bool)

(assert (=> start!23340 (=> (not res!98213) (not e!77807))))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> start!23340 (= res!98213 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!23340 e!77807))

(assert (=> start!23340 true))

(declare-fun e!77799 () Bool)

(declare-fun inv!12 (BitStream!4304) Bool)

(assert (=> start!23340 (and (inv!12 thiss!1305) e!77799)))

(declare-fun b!118666 () Bool)

(declare-fun e!77803 () Bool)

(declare-fun lt!182632 () tuple2!9956)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!118666 (= e!77803 (invariant!0 (currentBit!5484 thiss!1305) (currentByte!5489 thiss!1305) (size!2415 (buf!2834 (_2!5243 lt!182632)))))))

(declare-fun b!118667 () Bool)

(assert (=> b!118667 (= e!77807 e!77808)))

(declare-fun res!98221 () Bool)

(assert (=> b!118667 (=> (not res!98221) (not e!77808))))

(declare-fun lt!182613 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!118667 (= res!98221 (validate_offset_bits!1 ((_ sign_extend 32) (size!2415 (buf!2834 thiss!1305))) ((_ sign_extend 32) (currentByte!5489 thiss!1305)) ((_ sign_extend 32) (currentBit!5484 thiss!1305)) lt!182613))))

(assert (=> b!118667 (= lt!182613 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!118668 () Bool)

(declare-fun array_inv!2217 (array!5325) Bool)

(assert (=> b!118668 (= e!77799 (array_inv!2217 (buf!2834 thiss!1305)))))

(declare-fun lt!182630 () (_ BitVec 64))

(declare-fun b!118669 () Bool)

(declare-fun lt!182627 () (_ BitVec 64))

(declare-fun lt!182612 () (_ BitVec 64))

(declare-fun e!77805 () Bool)

(assert (=> b!118669 (= e!77805 (or (= lt!182627 (bvand lt!182630 #b1000000000000000000000000000000000000000000000000000000000000000)) (= lt!182627 (bvand (bvsub lt!182612 lt!182630) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!118669 (= lt!182627 (bvand lt!182612 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!118669 (= lt!182630 (bitIndex!0 (size!2415 (buf!2834 (_2!5243 lt!182632))) (currentByte!5489 (_2!5243 lt!182632)) (currentBit!5484 (_2!5243 lt!182632))))))

(assert (=> b!118669 (= lt!182612 (bitIndex!0 (size!2415 (buf!2834 thiss!1305)) (currentByte!5489 thiss!1305) (currentBit!5484 thiss!1305)))))

(declare-datatypes ((tuple2!9960 0))(
  ( (tuple2!9961 (_1!5245 BitStream!4304) (_2!5245 (_ BitVec 64))) )
))
(declare-fun lt!182625 () tuple2!9960)

(declare-fun lt!182634 () tuple2!9960)

(assert (=> b!118669 (and (= (_2!5245 lt!182625) (_2!5245 lt!182634)) (= (_1!5245 lt!182625) (_1!5245 lt!182634)))))

(declare-fun lt!182622 () Unit!7301)

(declare-fun lt!182614 () (_ BitVec 64))

(declare-datatypes ((tuple2!9962 0))(
  ( (tuple2!9963 (_1!5246 BitStream!4304) (_2!5246 BitStream!4304)) )
))
(declare-fun lt!182628 () tuple2!9962)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4304 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!7301)

(assert (=> b!118669 (= lt!182622 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5246 lt!182628) nBits!396 i!615 lt!182614))))

(declare-fun lt!182629 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4304 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9960)

(declare-fun withMovedBitIndex!0 (BitStream!4304 (_ BitVec 64)) BitStream!4304)

(assert (=> b!118669 (= lt!182634 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!5246 lt!182628) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!182629))))

(declare-fun b!118670 () Bool)

(declare-fun res!98214 () Bool)

(assert (=> b!118670 (=> (not res!98214) (not e!77803))))

(assert (=> b!118670 (= res!98214 (invariant!0 (currentBit!5484 thiss!1305) (currentByte!5489 thiss!1305) (size!2415 (buf!2834 (_2!5243 lt!182621)))))))

(declare-fun b!118671 () Bool)

(assert (=> b!118671 (= e!77801 (= (bitIndex!0 (size!2415 (buf!2834 (_1!5244 lt!182619))) (currentByte!5489 (_1!5244 lt!182619)) (currentBit!5484 (_1!5244 lt!182619))) lt!182616))))

(declare-fun b!118672 () Bool)

(declare-fun res!98217 () Bool)

(assert (=> b!118672 (=> (not res!98217) (not e!77804))))

(declare-fun isPrefixOf!0 (BitStream!4304 BitStream!4304) Bool)

(assert (=> b!118672 (= res!98217 (isPrefixOf!0 thiss!1305 (_2!5243 lt!182621)))))

(declare-fun b!118673 () Bool)

(declare-fun e!77800 () Bool)

(declare-fun lt!182631 () tuple2!9958)

(declare-fun lt!182623 () tuple2!9958)

(assert (=> b!118673 (= e!77800 (= (_2!5244 lt!182631) (_2!5244 lt!182623)))))

(declare-fun b!118674 () Bool)

(declare-fun res!98216 () Bool)

(assert (=> b!118674 (=> (not res!98216) (not e!77808))))

(assert (=> b!118674 (= res!98216 (bvslt i!615 nBits!396))))

(declare-fun b!118675 () Bool)

(assert (=> b!118675 (= e!77808 (not e!77805))))

(declare-fun res!98222 () Bool)

(assert (=> b!118675 (=> res!98222 e!77805)))

(declare-fun lt!182620 () tuple2!9962)

(assert (=> b!118675 (= res!98222 (not (= (_1!5245 (readNLeastSignificantBitsLoopPure!0 (_1!5246 lt!182620) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!182629)) (_2!5246 lt!182620))))))

(declare-fun lt!182633 () (_ BitVec 64))

(assert (=> b!118675 (validate_offset_bits!1 ((_ sign_extend 32) (size!2415 (buf!2834 (_2!5243 lt!182632)))) ((_ sign_extend 32) (currentByte!5489 (_2!5243 lt!182621))) ((_ sign_extend 32) (currentBit!5484 (_2!5243 lt!182621))) lt!182633)))

(declare-fun lt!182615 () Unit!7301)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4304 array!5325 (_ BitVec 64)) Unit!7301)

(assert (=> b!118675 (= lt!182615 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5243 lt!182621) (buf!2834 (_2!5243 lt!182632)) lt!182633))))

(assert (=> b!118675 (= lt!182633 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!182610 () (_ BitVec 64))

(declare-fun lt!182626 () tuple2!9958)

(assert (=> b!118675 (= lt!182629 (bvor lt!182614 (ite (_2!5244 lt!182626) lt!182610 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!118675 (= lt!182625 (readNLeastSignificantBitsLoopPure!0 (_1!5246 lt!182628) nBits!396 i!615 lt!182614))))

(assert (=> b!118675 (validate_offset_bits!1 ((_ sign_extend 32) (size!2415 (buf!2834 (_2!5243 lt!182632)))) ((_ sign_extend 32) (currentByte!5489 thiss!1305)) ((_ sign_extend 32) (currentBit!5484 thiss!1305)) lt!182613)))

(declare-fun lt!182609 () Unit!7301)

(assert (=> b!118675 (= lt!182609 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2834 (_2!5243 lt!182632)) lt!182613))))

(assert (=> b!118675 (= lt!182614 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(assert (=> b!118675 (= (_2!5244 lt!182626) lt!182618)))

(assert (=> b!118675 (= lt!182626 (readBitPure!0 (_1!5246 lt!182628)))))

(declare-fun reader!0 (BitStream!4304 BitStream!4304) tuple2!9962)

(assert (=> b!118675 (= lt!182620 (reader!0 (_2!5243 lt!182621) (_2!5243 lt!182632)))))

(assert (=> b!118675 (= lt!182628 (reader!0 thiss!1305 (_2!5243 lt!182632)))))

(assert (=> b!118675 e!77800))

(declare-fun res!98223 () Bool)

(assert (=> b!118675 (=> (not res!98223) (not e!77800))))

(assert (=> b!118675 (= res!98223 (= (bitIndex!0 (size!2415 (buf!2834 (_1!5244 lt!182631))) (currentByte!5489 (_1!5244 lt!182631)) (currentBit!5484 (_1!5244 lt!182631))) (bitIndex!0 (size!2415 (buf!2834 (_1!5244 lt!182623))) (currentByte!5489 (_1!5244 lt!182623)) (currentBit!5484 (_1!5244 lt!182623)))))))

(declare-fun lt!182624 () Unit!7301)

(declare-fun lt!182608 () BitStream!4304)

(declare-fun readBitPrefixLemma!0 (BitStream!4304 BitStream!4304) Unit!7301)

(assert (=> b!118675 (= lt!182624 (readBitPrefixLemma!0 lt!182608 (_2!5243 lt!182632)))))

(assert (=> b!118675 (= lt!182623 (readBitPure!0 (BitStream!4305 (buf!2834 (_2!5243 lt!182632)) (currentByte!5489 thiss!1305) (currentBit!5484 thiss!1305))))))

(assert (=> b!118675 (= lt!182631 (readBitPure!0 lt!182608))))

(assert (=> b!118675 (= lt!182608 (BitStream!4305 (buf!2834 (_2!5243 lt!182621)) (currentByte!5489 thiss!1305) (currentBit!5484 thiss!1305)))))

(assert (=> b!118675 e!77803))

(declare-fun res!98215 () Bool)

(assert (=> b!118675 (=> (not res!98215) (not e!77803))))

(assert (=> b!118675 (= res!98215 (isPrefixOf!0 thiss!1305 (_2!5243 lt!182632)))))

(declare-fun lt!182617 () Unit!7301)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4304 BitStream!4304 BitStream!4304) Unit!7301)

(assert (=> b!118675 (= lt!182617 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5243 lt!182621) (_2!5243 lt!182632)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4304 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9956)

(assert (=> b!118675 (= lt!182632 (appendNLeastSignificantBitsLoop!0 (_2!5243 lt!182621) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!118675 e!77806))

(declare-fun res!98219 () Bool)

(assert (=> b!118675 (=> (not res!98219) (not e!77806))))

(assert (=> b!118675 (= res!98219 (= (size!2415 (buf!2834 thiss!1305)) (size!2415 (buf!2834 (_2!5243 lt!182621)))))))

(declare-fun appendBit!0 (BitStream!4304 Bool) tuple2!9956)

(assert (=> b!118675 (= lt!182621 (appendBit!0 thiss!1305 lt!182618))))

(assert (=> b!118675 (= lt!182618 (not (= (bvand v!199 lt!182610) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!118675 (= lt!182610 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(assert (= (and start!23340 res!98213) b!118667))

(assert (= (and b!118667 res!98221) b!118663))

(assert (= (and b!118663 res!98218) b!118674))

(assert (= (and b!118674 res!98216) b!118675))

(assert (= (and b!118675 res!98219) b!118665))

(assert (= (and b!118665 res!98220) b!118672))

(assert (= (and b!118672 res!98217) b!118664))

(assert (= (and b!118664 res!98212) b!118671))

(assert (= (and b!118675 res!98215) b!118670))

(assert (= (and b!118670 res!98214) b!118666))

(assert (= (and b!118675 res!98223) b!118673))

(assert (= (and b!118675 (not res!98222)) b!118669))

(assert (= start!23340 b!118668))

(declare-fun m!178297 () Bool)

(assert (=> b!118668 m!178297))

(declare-fun m!178299 () Bool)

(assert (=> b!118669 m!178299))

(declare-fun m!178301 () Bool)

(assert (=> b!118669 m!178301))

(declare-fun m!178303 () Bool)

(assert (=> b!118669 m!178303))

(declare-fun m!178305 () Bool)

(assert (=> b!118669 m!178305))

(assert (=> b!118669 m!178301))

(declare-fun m!178307 () Bool)

(assert (=> b!118669 m!178307))

(declare-fun m!178309 () Bool)

(assert (=> b!118665 m!178309))

(assert (=> b!118665 m!178303))

(declare-fun m!178311 () Bool)

(assert (=> b!118663 m!178311))

(declare-fun m!178313 () Bool)

(assert (=> b!118672 m!178313))

(declare-fun m!178315 () Bool)

(assert (=> b!118670 m!178315))

(declare-fun m!178317 () Bool)

(assert (=> b!118667 m!178317))

(declare-fun m!178319 () Bool)

(assert (=> b!118666 m!178319))

(declare-fun m!178321 () Bool)

(assert (=> b!118671 m!178321))

(declare-fun m!178323 () Bool)

(assert (=> start!23340 m!178323))

(declare-fun m!178325 () Bool)

(assert (=> b!118675 m!178325))

(declare-fun m!178327 () Bool)

(assert (=> b!118675 m!178327))

(declare-fun m!178329 () Bool)

(assert (=> b!118675 m!178329))

(declare-fun m!178331 () Bool)

(assert (=> b!118675 m!178331))

(declare-fun m!178333 () Bool)

(assert (=> b!118675 m!178333))

(declare-fun m!178335 () Bool)

(assert (=> b!118675 m!178335))

(declare-fun m!178337 () Bool)

(assert (=> b!118675 m!178337))

(declare-fun m!178339 () Bool)

(assert (=> b!118675 m!178339))

(declare-fun m!178341 () Bool)

(assert (=> b!118675 m!178341))

(declare-fun m!178343 () Bool)

(assert (=> b!118675 m!178343))

(declare-fun m!178345 () Bool)

(assert (=> b!118675 m!178345))

(declare-fun m!178347 () Bool)

(assert (=> b!118675 m!178347))

(declare-fun m!178349 () Bool)

(assert (=> b!118675 m!178349))

(declare-fun m!178351 () Bool)

(assert (=> b!118675 m!178351))

(declare-fun m!178353 () Bool)

(assert (=> b!118675 m!178353))

(declare-fun m!178355 () Bool)

(assert (=> b!118675 m!178355))

(declare-fun m!178357 () Bool)

(assert (=> b!118675 m!178357))

(declare-fun m!178359 () Bool)

(assert (=> b!118675 m!178359))

(declare-fun m!178361 () Bool)

(assert (=> b!118675 m!178361))

(declare-fun m!178363 () Bool)

(assert (=> b!118664 m!178363))

(assert (=> b!118664 m!178363))

(declare-fun m!178365 () Bool)

(assert (=> b!118664 m!178365))

(push 1)

(assert (not b!118671))

(assert (not b!118675))

(assert (not b!118667))

(assert (not b!118665))

(assert (not start!23340))

(assert (not b!118668))

(assert (not b!118669))

(assert (not b!118664))

(assert (not b!118663))

(assert (not b!118672))

(assert (not b!118666))

(assert (not b!118670))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!37926 () Bool)

(declare-fun res!98256 () Bool)

(declare-fun e!77830 () Bool)

(assert (=> d!37926 (=> (not res!98256) (not e!77830))))

(assert (=> d!37926 (= res!98256 (= (size!2415 (buf!2834 thiss!1305)) (size!2415 (buf!2834 (_2!5243 lt!182621)))))))

(assert (=> d!37926 (= (isPrefixOf!0 thiss!1305 (_2!5243 lt!182621)) e!77830)))

(declare-fun b!118714 () Bool)

(declare-fun res!98255 () Bool)

(assert (=> b!118714 (=> (not res!98255) (not e!77830))))

(assert (=> b!118714 (= res!98255 (bvsle (bitIndex!0 (size!2415 (buf!2834 thiss!1305)) (currentByte!5489 thiss!1305) (currentBit!5484 thiss!1305)) (bitIndex!0 (size!2415 (buf!2834 (_2!5243 lt!182621))) (currentByte!5489 (_2!5243 lt!182621)) (currentBit!5484 (_2!5243 lt!182621)))))))

(declare-fun b!118715 () Bool)

(declare-fun e!77831 () Bool)

(assert (=> b!118715 (= e!77830 e!77831)))

(declare-fun res!98257 () Bool)

(assert (=> b!118715 (=> res!98257 e!77831)))

(assert (=> b!118715 (= res!98257 (= (size!2415 (buf!2834 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!118716 () Bool)

(declare-fun arrayBitRangesEq!0 (array!5325 array!5325 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!118716 (= e!77831 (arrayBitRangesEq!0 (buf!2834 thiss!1305) (buf!2834 (_2!5243 lt!182621)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2415 (buf!2834 thiss!1305)) (currentByte!5489 thiss!1305) (currentBit!5484 thiss!1305))))))

(assert (= (and d!37926 res!98256) b!118714))

(assert (= (and b!118714 res!98255) b!118715))

(assert (= (and b!118715 (not res!98257)) b!118716))

(assert (=> b!118714 m!178303))

(assert (=> b!118714 m!178309))

(assert (=> b!118716 m!178303))

(assert (=> b!118716 m!178303))

(declare-fun m!178451 () Bool)

(assert (=> b!118716 m!178451))

(assert (=> b!118672 d!37926))

(declare-fun d!37928 () Bool)

(assert (=> d!37928 (= (invariant!0 (currentBit!5484 thiss!1305) (currentByte!5489 thiss!1305) (size!2415 (buf!2834 (_2!5243 lt!182621)))) (and (bvsge (currentBit!5484 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5484 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5489 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5489 thiss!1305) (size!2415 (buf!2834 (_2!5243 lt!182621)))) (and (= (currentBit!5484 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5489 thiss!1305) (size!2415 (buf!2834 (_2!5243 lt!182621))))))))))

(assert (=> b!118670 d!37928))

(declare-fun d!37930 () Bool)

(declare-fun e!77842 () Bool)

(assert (=> d!37930 e!77842))

(declare-fun res!98279 () Bool)

(assert (=> d!37930 (=> (not res!98279) (not e!77842))))

(declare-fun lt!182791 () (_ BitVec 64))

(declare-fun lt!182796 () (_ BitVec 64))

(declare-fun lt!182792 () (_ BitVec 64))

(assert (=> d!37930 (= res!98279 (= lt!182792 (bvsub lt!182791 lt!182796)))))

(assert (=> d!37930 (or (= (bvand lt!182791 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!182796 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!182791 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!182791 lt!182796) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!37930 (= lt!182796 (remainingBits!0 ((_ sign_extend 32) (size!2415 (buf!2834 (_1!5244 lt!182619)))) ((_ sign_extend 32) (currentByte!5489 (_1!5244 lt!182619))) ((_ sign_extend 32) (currentBit!5484 (_1!5244 lt!182619)))))))

(declare-fun lt!182795 () (_ BitVec 64))

(declare-fun lt!182793 () (_ BitVec 64))

(assert (=> d!37930 (= lt!182791 (bvmul lt!182795 lt!182793))))

(assert (=> d!37930 (or (= lt!182795 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!182793 (bvsdiv (bvmul lt!182795 lt!182793) lt!182795)))))

(assert (=> d!37930 (= lt!182793 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37930 (= lt!182795 ((_ sign_extend 32) (size!2415 (buf!2834 (_1!5244 lt!182619)))))))

(assert (=> d!37930 (= lt!182792 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5489 (_1!5244 lt!182619))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5484 (_1!5244 lt!182619)))))))

(assert (=> d!37930 (invariant!0 (currentBit!5484 (_1!5244 lt!182619)) (currentByte!5489 (_1!5244 lt!182619)) (size!2415 (buf!2834 (_1!5244 lt!182619))))))

(assert (=> d!37930 (= (bitIndex!0 (size!2415 (buf!2834 (_1!5244 lt!182619))) (currentByte!5489 (_1!5244 lt!182619)) (currentBit!5484 (_1!5244 lt!182619))) lt!182792)))

(declare-fun b!118738 () Bool)

(declare-fun res!98278 () Bool)

(assert (=> b!118738 (=> (not res!98278) (not e!77842))))

(assert (=> b!118738 (= res!98278 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!182792))))

(declare-fun b!118739 () Bool)

(declare-fun lt!182794 () (_ BitVec 64))

(assert (=> b!118739 (= e!77842 (bvsle lt!182792 (bvmul lt!182794 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!118739 (or (= lt!182794 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!182794 #b0000000000000000000000000000000000000000000000000000000000001000) lt!182794)))))

(assert (=> b!118739 (= lt!182794 ((_ sign_extend 32) (size!2415 (buf!2834 (_1!5244 lt!182619)))))))

(assert (= (and d!37930 res!98279) b!118738))

(assert (= (and b!118738 res!98278) b!118739))

(declare-fun m!178475 () Bool)

(assert (=> d!37930 m!178475))

(declare-fun m!178477 () Bool)

(assert (=> d!37930 m!178477))

(assert (=> b!118671 d!37930))

(declare-fun d!37938 () Bool)

(assert (=> d!37938 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5484 thiss!1305) (currentByte!5489 thiss!1305) (size!2415 (buf!2834 thiss!1305))))))

(declare-fun bs!9181 () Bool)

(assert (= bs!9181 d!37938))

(declare-fun m!178479 () Bool)

(assert (=> bs!9181 m!178479))

(assert (=> start!23340 d!37938))

(declare-datatypes ((tuple2!9968 0))(
  ( (tuple2!9969 (_1!5249 (_ BitVec 64)) (_2!5249 BitStream!4304)) )
))
(declare-fun lt!182799 () tuple2!9968)

(declare-fun d!37940 () Bool)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!4304 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9968)

(assert (=> d!37940 (= lt!182799 (readNLeastSignificantBitsLoop!0 (withMovedBitIndex!0 (_1!5246 lt!182628) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!182629))))

(assert (=> d!37940 (= (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!5246 lt!182628) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!182629) (tuple2!9961 (_2!5249 lt!182799) (_1!5249 lt!182799)))))

(declare-fun bs!9182 () Bool)

(assert (= bs!9182 d!37940))

(assert (=> bs!9182 m!178301))

(declare-fun m!178481 () Bool)

(assert (=> bs!9182 m!178481))

(assert (=> b!118669 d!37940))

(declare-fun d!37942 () Bool)

(declare-fun e!77843 () Bool)

(assert (=> d!37942 e!77843))

(declare-fun res!98281 () Bool)

(assert (=> d!37942 (=> (not res!98281) (not e!77843))))

(declare-fun lt!182805 () (_ BitVec 64))

(declare-fun lt!182801 () (_ BitVec 64))

(declare-fun lt!182800 () (_ BitVec 64))

(assert (=> d!37942 (= res!98281 (= lt!182801 (bvsub lt!182800 lt!182805)))))

(assert (=> d!37942 (or (= (bvand lt!182800 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!182805 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!182800 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!182800 lt!182805) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37942 (= lt!182805 (remainingBits!0 ((_ sign_extend 32) (size!2415 (buf!2834 (_2!5243 lt!182632)))) ((_ sign_extend 32) (currentByte!5489 (_2!5243 lt!182632))) ((_ sign_extend 32) (currentBit!5484 (_2!5243 lt!182632)))))))

(declare-fun lt!182804 () (_ BitVec 64))

(declare-fun lt!182802 () (_ BitVec 64))

(assert (=> d!37942 (= lt!182800 (bvmul lt!182804 lt!182802))))

(assert (=> d!37942 (or (= lt!182804 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!182802 (bvsdiv (bvmul lt!182804 lt!182802) lt!182804)))))

(assert (=> d!37942 (= lt!182802 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37942 (= lt!182804 ((_ sign_extend 32) (size!2415 (buf!2834 (_2!5243 lt!182632)))))))

(assert (=> d!37942 (= lt!182801 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5489 (_2!5243 lt!182632))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5484 (_2!5243 lt!182632)))))))

(assert (=> d!37942 (invariant!0 (currentBit!5484 (_2!5243 lt!182632)) (currentByte!5489 (_2!5243 lt!182632)) (size!2415 (buf!2834 (_2!5243 lt!182632))))))

(assert (=> d!37942 (= (bitIndex!0 (size!2415 (buf!2834 (_2!5243 lt!182632))) (currentByte!5489 (_2!5243 lt!182632)) (currentBit!5484 (_2!5243 lt!182632))) lt!182801)))

(declare-fun b!118740 () Bool)

(declare-fun res!98280 () Bool)

(assert (=> b!118740 (=> (not res!98280) (not e!77843))))

(assert (=> b!118740 (= res!98280 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!182801))))

(declare-fun b!118741 () Bool)

(declare-fun lt!182803 () (_ BitVec 64))

(assert (=> b!118741 (= e!77843 (bvsle lt!182801 (bvmul lt!182803 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!118741 (or (= lt!182803 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!182803 #b0000000000000000000000000000000000000000000000000000000000001000) lt!182803)))))

(assert (=> b!118741 (= lt!182803 ((_ sign_extend 32) (size!2415 (buf!2834 (_2!5243 lt!182632)))))))

(assert (= (and d!37942 res!98281) b!118740))

(assert (= (and b!118740 res!98280) b!118741))

(declare-fun m!178483 () Bool)

(assert (=> d!37942 m!178483))

(declare-fun m!178485 () Bool)

(assert (=> d!37942 m!178485))

(assert (=> b!118669 d!37942))

(declare-fun d!37944 () Bool)

(declare-fun e!77846 () Bool)

(assert (=> d!37944 e!77846))

(declare-fun res!98284 () Bool)

(assert (=> d!37944 (=> (not res!98284) (not e!77846))))

(declare-fun lt!182811 () (_ BitVec 64))

(declare-fun lt!182810 () BitStream!4304)

(assert (=> d!37944 (= res!98284 (= (bvadd lt!182811 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!2415 (buf!2834 lt!182810)) (currentByte!5489 lt!182810) (currentBit!5484 lt!182810))))))

(assert (=> d!37944 (or (not (= (bvand lt!182811 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!182811 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!182811 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37944 (= lt!182811 (bitIndex!0 (size!2415 (buf!2834 (_1!5246 lt!182628))) (currentByte!5489 (_1!5246 lt!182628)) (currentBit!5484 (_1!5246 lt!182628))))))

(declare-fun moveBitIndex!0 (BitStream!4304 (_ BitVec 64)) tuple2!9956)

(assert (=> d!37944 (= lt!182810 (_2!5243 (moveBitIndex!0 (_1!5246 lt!182628) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!4304 (_ BitVec 64)) Bool)

(assert (=> d!37944 (moveBitIndexPrecond!0 (_1!5246 lt!182628) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!37944 (= (withMovedBitIndex!0 (_1!5246 lt!182628) #b0000000000000000000000000000000000000000000000000000000000000001) lt!182810)))

(declare-fun b!118744 () Bool)

(assert (=> b!118744 (= e!77846 (= (size!2415 (buf!2834 (_1!5246 lt!182628))) (size!2415 (buf!2834 lt!182810))))))

(assert (= (and d!37944 res!98284) b!118744))

(declare-fun m!178487 () Bool)

(assert (=> d!37944 m!178487))

(declare-fun m!178489 () Bool)

(assert (=> d!37944 m!178489))

(declare-fun m!178491 () Bool)

(assert (=> d!37944 m!178491))

(declare-fun m!178493 () Bool)

(assert (=> d!37944 m!178493))

(assert (=> b!118669 d!37944))

(declare-fun d!37946 () Bool)

(declare-fun lt!182829 () tuple2!9960)

(declare-fun lt!182824 () tuple2!9960)

(assert (=> d!37946 (and (= (_2!5245 lt!182829) (_2!5245 lt!182824)) (= (_1!5245 lt!182829) (_1!5245 lt!182824)))))

(declare-fun lt!182827 () (_ BitVec 64))

(declare-fun lt!182826 () Unit!7301)

(declare-fun lt!182825 () BitStream!4304)

(declare-fun lt!182828 () Bool)

(declare-fun choose!45 (BitStream!4304 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!9960 tuple2!9960 BitStream!4304 (_ BitVec 64) Bool BitStream!4304 (_ BitVec 64) tuple2!9960 tuple2!9960 BitStream!4304 (_ BitVec 64)) Unit!7301)

(assert (=> d!37946 (= lt!182826 (choose!45 (_1!5246 lt!182628) nBits!396 i!615 lt!182614 lt!182829 (tuple2!9961 (_1!5245 lt!182829) (_2!5245 lt!182829)) (_1!5245 lt!182829) (_2!5245 lt!182829) lt!182828 lt!182825 lt!182827 lt!182824 (tuple2!9961 (_1!5245 lt!182824) (_2!5245 lt!182824)) (_1!5245 lt!182824) (_2!5245 lt!182824)))))

(assert (=> d!37946 (= lt!182824 (readNLeastSignificantBitsLoopPure!0 lt!182825 nBits!396 (bvadd i!615 #b00000000000000000000000000000001) lt!182827))))

(assert (=> d!37946 (= lt!182827 (bvor lt!182614 (ite lt!182828 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37946 (= lt!182825 (withMovedBitIndex!0 (_1!5246 lt!182628) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!37946 (= lt!182828 (_2!5244 (readBitPure!0 (_1!5246 lt!182628))))))

(assert (=> d!37946 (= lt!182829 (readNLeastSignificantBitsLoopPure!0 (_1!5246 lt!182628) nBits!396 i!615 lt!182614))))

(assert (=> d!37946 (= (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5246 lt!182628) nBits!396 i!615 lt!182614) lt!182826)))

(declare-fun bs!9184 () Bool)

(assert (= bs!9184 d!37946))

(declare-fun m!178495 () Bool)

(assert (=> bs!9184 m!178495))

(declare-fun m!178497 () Bool)

(assert (=> bs!9184 m!178497))

(assert (=> bs!9184 m!178345))

(assert (=> bs!9184 m!178349))

(assert (=> bs!9184 m!178301))

(assert (=> b!118669 d!37946))

(declare-fun d!37948 () Bool)

(declare-fun e!77847 () Bool)

(assert (=> d!37948 e!77847))

(declare-fun res!98286 () Bool)

(assert (=> d!37948 (=> (not res!98286) (not e!77847))))

(declare-fun lt!182831 () (_ BitVec 64))

(declare-fun lt!182830 () (_ BitVec 64))

(declare-fun lt!182835 () (_ BitVec 64))

(assert (=> d!37948 (= res!98286 (= lt!182831 (bvsub lt!182830 lt!182835)))))

(assert (=> d!37948 (or (= (bvand lt!182830 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!182835 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!182830 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!182830 lt!182835) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37948 (= lt!182835 (remainingBits!0 ((_ sign_extend 32) (size!2415 (buf!2834 thiss!1305))) ((_ sign_extend 32) (currentByte!5489 thiss!1305)) ((_ sign_extend 32) (currentBit!5484 thiss!1305))))))

(declare-fun lt!182834 () (_ BitVec 64))

(declare-fun lt!182832 () (_ BitVec 64))

(assert (=> d!37948 (= lt!182830 (bvmul lt!182834 lt!182832))))

(assert (=> d!37948 (or (= lt!182834 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!182832 (bvsdiv (bvmul lt!182834 lt!182832) lt!182834)))))

(assert (=> d!37948 (= lt!182832 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37948 (= lt!182834 ((_ sign_extend 32) (size!2415 (buf!2834 thiss!1305))))))

(assert (=> d!37948 (= lt!182831 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5489 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5484 thiss!1305))))))

(assert (=> d!37948 (invariant!0 (currentBit!5484 thiss!1305) (currentByte!5489 thiss!1305) (size!2415 (buf!2834 thiss!1305)))))

(assert (=> d!37948 (= (bitIndex!0 (size!2415 (buf!2834 thiss!1305)) (currentByte!5489 thiss!1305) (currentBit!5484 thiss!1305)) lt!182831)))

(declare-fun b!118745 () Bool)

(declare-fun res!98285 () Bool)

(assert (=> b!118745 (=> (not res!98285) (not e!77847))))

(assert (=> b!118745 (= res!98285 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!182831))))

(declare-fun b!118746 () Bool)

(declare-fun lt!182833 () (_ BitVec 64))

(assert (=> b!118746 (= e!77847 (bvsle lt!182831 (bvmul lt!182833 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!118746 (or (= lt!182833 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!182833 #b0000000000000000000000000000000000000000000000000000000000001000) lt!182833)))))

(assert (=> b!118746 (= lt!182833 ((_ sign_extend 32) (size!2415 (buf!2834 thiss!1305))))))

(assert (= (and d!37948 res!98286) b!118745))

(assert (= (and b!118745 res!98285) b!118746))

(declare-fun m!178499 () Bool)

(assert (=> d!37948 m!178499))

(assert (=> d!37948 m!178479))

(assert (=> b!118669 d!37948))

(declare-fun d!37950 () Bool)

(assert (=> d!37950 (= (array_inv!2217 (buf!2834 thiss!1305)) (bvsge (size!2415 (buf!2834 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!118668 d!37950))

(declare-fun d!37952 () Bool)

(assert (=> d!37952 (= (invariant!0 (currentBit!5484 thiss!1305) (currentByte!5489 thiss!1305) (size!2415 (buf!2834 (_2!5243 lt!182632)))) (and (bvsge (currentBit!5484 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5484 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5489 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5489 thiss!1305) (size!2415 (buf!2834 (_2!5243 lt!182632)))) (and (= (currentBit!5484 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5489 thiss!1305) (size!2415 (buf!2834 (_2!5243 lt!182632))))))))))

(assert (=> b!118666 d!37952))

(declare-fun d!37954 () Bool)

(assert (=> d!37954 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2415 (buf!2834 thiss!1305))) ((_ sign_extend 32) (currentByte!5489 thiss!1305)) ((_ sign_extend 32) (currentBit!5484 thiss!1305)) lt!182613) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2415 (buf!2834 thiss!1305))) ((_ sign_extend 32) (currentByte!5489 thiss!1305)) ((_ sign_extend 32) (currentBit!5484 thiss!1305))) lt!182613))))

(declare-fun bs!9185 () Bool)

(assert (= bs!9185 d!37954))

(assert (=> bs!9185 m!178499))

(assert (=> b!118667 d!37954))

(declare-fun d!37956 () Bool)

(declare-fun e!77848 () Bool)

(assert (=> d!37956 e!77848))

(declare-fun res!98288 () Bool)

(assert (=> d!37956 (=> (not res!98288) (not e!77848))))

(declare-fun lt!182837 () (_ BitVec 64))

(declare-fun lt!182841 () (_ BitVec 64))

(declare-fun lt!182836 () (_ BitVec 64))

(assert (=> d!37956 (= res!98288 (= lt!182837 (bvsub lt!182836 lt!182841)))))

(assert (=> d!37956 (or (= (bvand lt!182836 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!182841 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!182836 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!182836 lt!182841) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37956 (= lt!182841 (remainingBits!0 ((_ sign_extend 32) (size!2415 (buf!2834 (_2!5243 lt!182621)))) ((_ sign_extend 32) (currentByte!5489 (_2!5243 lt!182621))) ((_ sign_extend 32) (currentBit!5484 (_2!5243 lt!182621)))))))

(declare-fun lt!182840 () (_ BitVec 64))

(declare-fun lt!182838 () (_ BitVec 64))

(assert (=> d!37956 (= lt!182836 (bvmul lt!182840 lt!182838))))

(assert (=> d!37956 (or (= lt!182840 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!182838 (bvsdiv (bvmul lt!182840 lt!182838) lt!182840)))))

(assert (=> d!37956 (= lt!182838 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37956 (= lt!182840 ((_ sign_extend 32) (size!2415 (buf!2834 (_2!5243 lt!182621)))))))

(assert (=> d!37956 (= lt!182837 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5489 (_2!5243 lt!182621))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5484 (_2!5243 lt!182621)))))))

(assert (=> d!37956 (invariant!0 (currentBit!5484 (_2!5243 lt!182621)) (currentByte!5489 (_2!5243 lt!182621)) (size!2415 (buf!2834 (_2!5243 lt!182621))))))

(assert (=> d!37956 (= (bitIndex!0 (size!2415 (buf!2834 (_2!5243 lt!182621))) (currentByte!5489 (_2!5243 lt!182621)) (currentBit!5484 (_2!5243 lt!182621))) lt!182837)))

(declare-fun b!118747 () Bool)

(declare-fun res!98287 () Bool)

(assert (=> b!118747 (=> (not res!98287) (not e!77848))))

(assert (=> b!118747 (= res!98287 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!182837))))

(declare-fun b!118748 () Bool)

(declare-fun lt!182839 () (_ BitVec 64))

(assert (=> b!118748 (= e!77848 (bvsle lt!182837 (bvmul lt!182839 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!118748 (or (= lt!182839 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!182839 #b0000000000000000000000000000000000000000000000000000000000001000) lt!182839)))))

(assert (=> b!118748 (= lt!182839 ((_ sign_extend 32) (size!2415 (buf!2834 (_2!5243 lt!182621)))))))

(assert (= (and d!37956 res!98288) b!118747))

(assert (= (and b!118747 res!98287) b!118748))

(declare-fun m!178501 () Bool)

(assert (=> d!37956 m!178501))

(declare-fun m!178503 () Bool)

(assert (=> d!37956 m!178503))

(assert (=> b!118665 d!37956))

(assert (=> b!118665 d!37948))

(declare-fun d!37958 () Bool)

(assert (=> d!37958 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2415 (buf!2834 (_2!5243 lt!182632)))) ((_ sign_extend 32) (currentByte!5489 thiss!1305)) ((_ sign_extend 32) (currentBit!5484 thiss!1305)) lt!182613) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2415 (buf!2834 (_2!5243 lt!182632)))) ((_ sign_extend 32) (currentByte!5489 thiss!1305)) ((_ sign_extend 32) (currentBit!5484 thiss!1305))) lt!182613))))

(declare-fun bs!9186 () Bool)

(assert (= bs!9186 d!37958))

(declare-fun m!178505 () Bool)

(assert (=> bs!9186 m!178505))

(assert (=> b!118675 d!37958))

(declare-fun lt!182842 () tuple2!9968)

(declare-fun d!37960 () Bool)

(assert (=> d!37960 (= lt!182842 (readNLeastSignificantBitsLoop!0 (_1!5246 lt!182620) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!182629))))

(assert (=> d!37960 (= (readNLeastSignificantBitsLoopPure!0 (_1!5246 lt!182620) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!182629) (tuple2!9961 (_2!5249 lt!182842) (_1!5249 lt!182842)))))

(declare-fun bs!9187 () Bool)

(assert (= bs!9187 d!37960))

(declare-fun m!178507 () Bool)

(assert (=> bs!9187 m!178507))

(assert (=> b!118675 d!37960))

(declare-fun d!37962 () Bool)

(declare-datatypes ((tuple2!9970 0))(
  ( (tuple2!9971 (_1!5250 Bool) (_2!5250 BitStream!4304)) )
))
(declare-fun lt!182845 () tuple2!9970)

(declare-fun readBit!0 (BitStream!4304) tuple2!9970)

(assert (=> d!37962 (= lt!182845 (readBit!0 (_1!5246 lt!182628)))))

(assert (=> d!37962 (= (readBitPure!0 (_1!5246 lt!182628)) (tuple2!9959 (_2!5250 lt!182845) (_1!5250 lt!182845)))))

(declare-fun bs!9188 () Bool)

(assert (= bs!9188 d!37962))

(declare-fun m!178509 () Bool)

(assert (=> bs!9188 m!178509))

(assert (=> b!118675 d!37962))

(declare-fun d!37964 () Bool)

(declare-fun e!77849 () Bool)

(assert (=> d!37964 e!77849))

(declare-fun res!98290 () Bool)

(assert (=> d!37964 (=> (not res!98290) (not e!77849))))

(declare-fun lt!182846 () (_ BitVec 64))

(declare-fun lt!182847 () (_ BitVec 64))

(declare-fun lt!182851 () (_ BitVec 64))

(assert (=> d!37964 (= res!98290 (= lt!182847 (bvsub lt!182846 lt!182851)))))

(assert (=> d!37964 (or (= (bvand lt!182846 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!182851 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!182846 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!182846 lt!182851) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37964 (= lt!182851 (remainingBits!0 ((_ sign_extend 32) (size!2415 (buf!2834 (_1!5244 lt!182623)))) ((_ sign_extend 32) (currentByte!5489 (_1!5244 lt!182623))) ((_ sign_extend 32) (currentBit!5484 (_1!5244 lt!182623)))))))

(declare-fun lt!182850 () (_ BitVec 64))

(declare-fun lt!182848 () (_ BitVec 64))

(assert (=> d!37964 (= lt!182846 (bvmul lt!182850 lt!182848))))

(assert (=> d!37964 (or (= lt!182850 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!182848 (bvsdiv (bvmul lt!182850 lt!182848) lt!182850)))))

(assert (=> d!37964 (= lt!182848 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37964 (= lt!182850 ((_ sign_extend 32) (size!2415 (buf!2834 (_1!5244 lt!182623)))))))

(assert (=> d!37964 (= lt!182847 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5489 (_1!5244 lt!182623))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5484 (_1!5244 lt!182623)))))))

(assert (=> d!37964 (invariant!0 (currentBit!5484 (_1!5244 lt!182623)) (currentByte!5489 (_1!5244 lt!182623)) (size!2415 (buf!2834 (_1!5244 lt!182623))))))

(assert (=> d!37964 (= (bitIndex!0 (size!2415 (buf!2834 (_1!5244 lt!182623))) (currentByte!5489 (_1!5244 lt!182623)) (currentBit!5484 (_1!5244 lt!182623))) lt!182847)))

(declare-fun b!118749 () Bool)

(declare-fun res!98289 () Bool)

(assert (=> b!118749 (=> (not res!98289) (not e!77849))))

(assert (=> b!118749 (= res!98289 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!182847))))

(declare-fun b!118750 () Bool)

(declare-fun lt!182849 () (_ BitVec 64))

(assert (=> b!118750 (= e!77849 (bvsle lt!182847 (bvmul lt!182849 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!118750 (or (= lt!182849 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!182849 #b0000000000000000000000000000000000000000000000000000000000001000) lt!182849)))))

(assert (=> b!118750 (= lt!182849 ((_ sign_extend 32) (size!2415 (buf!2834 (_1!5244 lt!182623)))))))

(assert (= (and d!37964 res!98290) b!118749))

(assert (= (and b!118749 res!98289) b!118750))

(declare-fun m!178511 () Bool)

(assert (=> d!37964 m!178511))

(declare-fun m!178513 () Bool)

(assert (=> d!37964 m!178513))

(assert (=> b!118675 d!37964))

(declare-fun d!37966 () Bool)

(declare-fun e!77850 () Bool)

(assert (=> d!37966 e!77850))

(declare-fun res!98292 () Bool)

(assert (=> d!37966 (=> (not res!98292) (not e!77850))))

(declare-fun lt!182857 () (_ BitVec 64))

(declare-fun lt!182853 () (_ BitVec 64))

(declare-fun lt!182852 () (_ BitVec 64))

(assert (=> d!37966 (= res!98292 (= lt!182853 (bvsub lt!182852 lt!182857)))))

(assert (=> d!37966 (or (= (bvand lt!182852 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!182857 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!182852 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!182852 lt!182857) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37966 (= lt!182857 (remainingBits!0 ((_ sign_extend 32) (size!2415 (buf!2834 (_1!5244 lt!182631)))) ((_ sign_extend 32) (currentByte!5489 (_1!5244 lt!182631))) ((_ sign_extend 32) (currentBit!5484 (_1!5244 lt!182631)))))))

(declare-fun lt!182856 () (_ BitVec 64))

(declare-fun lt!182854 () (_ BitVec 64))

(assert (=> d!37966 (= lt!182852 (bvmul lt!182856 lt!182854))))

(assert (=> d!37966 (or (= lt!182856 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!182854 (bvsdiv (bvmul lt!182856 lt!182854) lt!182856)))))

(assert (=> d!37966 (= lt!182854 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37966 (= lt!182856 ((_ sign_extend 32) (size!2415 (buf!2834 (_1!5244 lt!182631)))))))

(assert (=> d!37966 (= lt!182853 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5489 (_1!5244 lt!182631))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5484 (_1!5244 lt!182631)))))))

(assert (=> d!37966 (invariant!0 (currentBit!5484 (_1!5244 lt!182631)) (currentByte!5489 (_1!5244 lt!182631)) (size!2415 (buf!2834 (_1!5244 lt!182631))))))

(assert (=> d!37966 (= (bitIndex!0 (size!2415 (buf!2834 (_1!5244 lt!182631))) (currentByte!5489 (_1!5244 lt!182631)) (currentBit!5484 (_1!5244 lt!182631))) lt!182853)))

(declare-fun b!118751 () Bool)

(declare-fun res!98291 () Bool)

(assert (=> b!118751 (=> (not res!98291) (not e!77850))))

(assert (=> b!118751 (= res!98291 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!182853))))

(declare-fun b!118752 () Bool)

(declare-fun lt!182855 () (_ BitVec 64))

(assert (=> b!118752 (= e!77850 (bvsle lt!182853 (bvmul lt!182855 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!118752 (or (= lt!182855 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!182855 #b0000000000000000000000000000000000000000000000000000000000001000) lt!182855)))))

(assert (=> b!118752 (= lt!182855 ((_ sign_extend 32) (size!2415 (buf!2834 (_1!5244 lt!182631)))))))

(assert (= (and d!37966 res!98292) b!118751))

(assert (= (and b!118751 res!98291) b!118752))

(declare-fun m!178515 () Bool)

(assert (=> d!37966 m!178515))

(declare-fun m!178517 () Bool)

(assert (=> d!37966 m!178517))

(assert (=> b!118675 d!37966))

(declare-fun d!37968 () Bool)

(assert (=> d!37968 (isPrefixOf!0 thiss!1305 (_2!5243 lt!182632))))

(declare-fun lt!182860 () Unit!7301)

(declare-fun choose!30 (BitStream!4304 BitStream!4304 BitStream!4304) Unit!7301)

(assert (=> d!37968 (= lt!182860 (choose!30 thiss!1305 (_2!5243 lt!182621) (_2!5243 lt!182632)))))

(assert (=> d!37968 (isPrefixOf!0 thiss!1305 (_2!5243 lt!182621))))

(assert (=> d!37968 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5243 lt!182621) (_2!5243 lt!182632)) lt!182860)))

(declare-fun bs!9189 () Bool)

(assert (= bs!9189 d!37968))

(assert (=> bs!9189 m!178357))

(declare-fun m!178519 () Bool)

(assert (=> bs!9189 m!178519))

(assert (=> bs!9189 m!178313))

(assert (=> b!118675 d!37968))

(declare-fun d!37970 () Bool)

(assert (=> d!37970 (validate_offset_bits!1 ((_ sign_extend 32) (size!2415 (buf!2834 (_2!5243 lt!182632)))) ((_ sign_extend 32) (currentByte!5489 (_2!5243 lt!182621))) ((_ sign_extend 32) (currentBit!5484 (_2!5243 lt!182621))) lt!182633)))

(declare-fun lt!182863 () Unit!7301)

(declare-fun choose!9 (BitStream!4304 array!5325 (_ BitVec 64) BitStream!4304) Unit!7301)

(assert (=> d!37970 (= lt!182863 (choose!9 (_2!5243 lt!182621) (buf!2834 (_2!5243 lt!182632)) lt!182633 (BitStream!4305 (buf!2834 (_2!5243 lt!182632)) (currentByte!5489 (_2!5243 lt!182621)) (currentBit!5484 (_2!5243 lt!182621)))))))

(assert (=> d!37970 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5243 lt!182621) (buf!2834 (_2!5243 lt!182632)) lt!182633) lt!182863)))

(declare-fun bs!9190 () Bool)

(assert (= bs!9190 d!37970))

(assert (=> bs!9190 m!178325))

(declare-fun m!178521 () Bool)

(assert (=> bs!9190 m!178521))

(assert (=> b!118675 d!37970))

(declare-fun d!37972 () Bool)

(declare-fun e!77856 () Bool)

(assert (=> d!37972 e!77856))

(declare-fun res!98299 () Bool)

(assert (=> d!37972 (=> (not res!98299) (not e!77856))))

(declare-fun lt!182915 () tuple2!9962)

(assert (=> d!37972 (= res!98299 (isPrefixOf!0 (_1!5246 lt!182915) (_2!5246 lt!182915)))))

(declare-fun lt!182911 () BitStream!4304)

(assert (=> d!37972 (= lt!182915 (tuple2!9963 lt!182911 (_2!5243 lt!182632)))))

(declare-fun lt!182905 () Unit!7301)

(declare-fun lt!182921 () Unit!7301)

(assert (=> d!37972 (= lt!182905 lt!182921)))

(assert (=> d!37972 (isPrefixOf!0 lt!182911 (_2!5243 lt!182632))))

(assert (=> d!37972 (= lt!182921 (lemmaIsPrefixTransitive!0 lt!182911 (_2!5243 lt!182632) (_2!5243 lt!182632)))))

(declare-fun lt!182904 () Unit!7301)

(declare-fun lt!182912 () Unit!7301)

(assert (=> d!37972 (= lt!182904 lt!182912)))

(assert (=> d!37972 (isPrefixOf!0 lt!182911 (_2!5243 lt!182632))))

(assert (=> d!37972 (= lt!182912 (lemmaIsPrefixTransitive!0 lt!182911 (_2!5243 lt!182621) (_2!5243 lt!182632)))))

(declare-fun lt!182922 () Unit!7301)

(declare-fun e!77855 () Unit!7301)

(assert (=> d!37972 (= lt!182922 e!77855)))

(declare-fun c!7127 () Bool)

(assert (=> d!37972 (= c!7127 (not (= (size!2415 (buf!2834 (_2!5243 lt!182621))) #b00000000000000000000000000000000)))))

(declare-fun lt!182919 () Unit!7301)

(declare-fun lt!182907 () Unit!7301)

(assert (=> d!37972 (= lt!182919 lt!182907)))

(assert (=> d!37972 (isPrefixOf!0 (_2!5243 lt!182632) (_2!5243 lt!182632))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4304) Unit!7301)

(assert (=> d!37972 (= lt!182907 (lemmaIsPrefixRefl!0 (_2!5243 lt!182632)))))

(declare-fun lt!182908 () Unit!7301)

(declare-fun lt!182916 () Unit!7301)

(assert (=> d!37972 (= lt!182908 lt!182916)))

(assert (=> d!37972 (= lt!182916 (lemmaIsPrefixRefl!0 (_2!5243 lt!182632)))))

(declare-fun lt!182914 () Unit!7301)

(declare-fun lt!182909 () Unit!7301)

(assert (=> d!37972 (= lt!182914 lt!182909)))

(assert (=> d!37972 (isPrefixOf!0 lt!182911 lt!182911)))

(assert (=> d!37972 (= lt!182909 (lemmaIsPrefixRefl!0 lt!182911))))

(declare-fun lt!182906 () Unit!7301)

(declare-fun lt!182913 () Unit!7301)

(assert (=> d!37972 (= lt!182906 lt!182913)))

(assert (=> d!37972 (isPrefixOf!0 (_2!5243 lt!182621) (_2!5243 lt!182621))))

(assert (=> d!37972 (= lt!182913 (lemmaIsPrefixRefl!0 (_2!5243 lt!182621)))))

(assert (=> d!37972 (= lt!182911 (BitStream!4305 (buf!2834 (_2!5243 lt!182632)) (currentByte!5489 (_2!5243 lt!182621)) (currentBit!5484 (_2!5243 lt!182621))))))

(assert (=> d!37972 (isPrefixOf!0 (_2!5243 lt!182621) (_2!5243 lt!182632))))

(assert (=> d!37972 (= (reader!0 (_2!5243 lt!182621) (_2!5243 lt!182632)) lt!182915)))

(declare-fun b!118763 () Bool)

(declare-fun Unit!7311 () Unit!7301)

(assert (=> b!118763 (= e!77855 Unit!7311)))

(declare-fun b!118764 () Bool)

(declare-fun lt!182918 () (_ BitVec 64))

(declare-fun lt!182910 () (_ BitVec 64))

(assert (=> b!118764 (= e!77856 (= (_1!5246 lt!182915) (withMovedBitIndex!0 (_2!5246 lt!182915) (bvsub lt!182910 lt!182918))))))

(assert (=> b!118764 (or (= (bvand lt!182910 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!182918 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!182910 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!182910 lt!182918) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!118764 (= lt!182918 (bitIndex!0 (size!2415 (buf!2834 (_2!5243 lt!182632))) (currentByte!5489 (_2!5243 lt!182632)) (currentBit!5484 (_2!5243 lt!182632))))))

(assert (=> b!118764 (= lt!182910 (bitIndex!0 (size!2415 (buf!2834 (_2!5243 lt!182621))) (currentByte!5489 (_2!5243 lt!182621)) (currentBit!5484 (_2!5243 lt!182621))))))

(declare-fun b!118765 () Bool)

(declare-fun res!98300 () Bool)

(assert (=> b!118765 (=> (not res!98300) (not e!77856))))

(assert (=> b!118765 (= res!98300 (isPrefixOf!0 (_1!5246 lt!182915) (_2!5243 lt!182621)))))

(declare-fun b!118766 () Bool)

(declare-fun lt!182920 () Unit!7301)

(assert (=> b!118766 (= e!77855 lt!182920)))

(declare-fun lt!182923 () (_ BitVec 64))

(assert (=> b!118766 (= lt!182923 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!182917 () (_ BitVec 64))

(assert (=> b!118766 (= lt!182917 (bitIndex!0 (size!2415 (buf!2834 (_2!5243 lt!182621))) (currentByte!5489 (_2!5243 lt!182621)) (currentBit!5484 (_2!5243 lt!182621))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!5325 array!5325 (_ BitVec 64) (_ BitVec 64)) Unit!7301)

(assert (=> b!118766 (= lt!182920 (arrayBitRangesEqSymmetric!0 (buf!2834 (_2!5243 lt!182621)) (buf!2834 (_2!5243 lt!182632)) lt!182923 lt!182917))))

(assert (=> b!118766 (arrayBitRangesEq!0 (buf!2834 (_2!5243 lt!182632)) (buf!2834 (_2!5243 lt!182621)) lt!182923 lt!182917)))

(declare-fun b!118767 () Bool)

(declare-fun res!98301 () Bool)

(assert (=> b!118767 (=> (not res!98301) (not e!77856))))

(assert (=> b!118767 (= res!98301 (isPrefixOf!0 (_2!5246 lt!182915) (_2!5243 lt!182632)))))

(assert (= (and d!37972 c!7127) b!118766))

(assert (= (and d!37972 (not c!7127)) b!118763))

(assert (= (and d!37972 res!98299) b!118765))

(assert (= (and b!118765 res!98300) b!118767))

(assert (= (and b!118767 res!98301) b!118764))

(declare-fun m!178523 () Bool)

(assert (=> b!118765 m!178523))

(declare-fun m!178525 () Bool)

(assert (=> b!118767 m!178525))

(assert (=> b!118766 m!178309))

(declare-fun m!178527 () Bool)

(assert (=> b!118766 m!178527))

(declare-fun m!178529 () Bool)

(assert (=> b!118766 m!178529))

(declare-fun m!178531 () Bool)

(assert (=> b!118764 m!178531))

(assert (=> b!118764 m!178299))

(assert (=> b!118764 m!178309))

(declare-fun m!178533 () Bool)

(assert (=> d!37972 m!178533))

(declare-fun m!178535 () Bool)

(assert (=> d!37972 m!178535))

(declare-fun m!178537 () Bool)

(assert (=> d!37972 m!178537))

(declare-fun m!178539 () Bool)

(assert (=> d!37972 m!178539))

(declare-fun m!178541 () Bool)

(assert (=> d!37972 m!178541))

(declare-fun m!178543 () Bool)

(assert (=> d!37972 m!178543))

(declare-fun m!178545 () Bool)

(assert (=> d!37972 m!178545))

(declare-fun m!178547 () Bool)

(assert (=> d!37972 m!178547))

(declare-fun m!178549 () Bool)

(assert (=> d!37972 m!178549))

(declare-fun m!178551 () Bool)

(assert (=> d!37972 m!178551))

(declare-fun m!178553 () Bool)

(assert (=> d!37972 m!178553))

(assert (=> b!118675 d!37972))

(declare-fun d!37974 () Bool)

(declare-fun lt!182924 () tuple2!9970)

(assert (=> d!37974 (= lt!182924 (readBit!0 lt!182608))))

(assert (=> d!37974 (= (readBitPure!0 lt!182608) (tuple2!9959 (_2!5250 lt!182924) (_1!5250 lt!182924)))))

(declare-fun bs!9191 () Bool)

(assert (= bs!9191 d!37974))

(declare-fun m!178555 () Bool)

(assert (=> bs!9191 m!178555))

(assert (=> b!118675 d!37974))

(declare-fun d!37976 () Bool)

(declare-fun res!98303 () Bool)

(declare-fun e!77857 () Bool)

(assert (=> d!37976 (=> (not res!98303) (not e!77857))))

(assert (=> d!37976 (= res!98303 (= (size!2415 (buf!2834 thiss!1305)) (size!2415 (buf!2834 (_2!5243 lt!182632)))))))

(assert (=> d!37976 (= (isPrefixOf!0 thiss!1305 (_2!5243 lt!182632)) e!77857)))

(declare-fun b!118768 () Bool)

(declare-fun res!98302 () Bool)

(assert (=> b!118768 (=> (not res!98302) (not e!77857))))

(assert (=> b!118768 (= res!98302 (bvsle (bitIndex!0 (size!2415 (buf!2834 thiss!1305)) (currentByte!5489 thiss!1305) (currentBit!5484 thiss!1305)) (bitIndex!0 (size!2415 (buf!2834 (_2!5243 lt!182632))) (currentByte!5489 (_2!5243 lt!182632)) (currentBit!5484 (_2!5243 lt!182632)))))))

(declare-fun b!118769 () Bool)

(declare-fun e!77858 () Bool)

(assert (=> b!118769 (= e!77857 e!77858)))

(declare-fun res!98304 () Bool)

(assert (=> b!118769 (=> res!98304 e!77858)))

(assert (=> b!118769 (= res!98304 (= (size!2415 (buf!2834 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!118770 () Bool)

(assert (=> b!118770 (= e!77858 (arrayBitRangesEq!0 (buf!2834 thiss!1305) (buf!2834 (_2!5243 lt!182632)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2415 (buf!2834 thiss!1305)) (currentByte!5489 thiss!1305) (currentBit!5484 thiss!1305))))))

(assert (= (and d!37976 res!98303) b!118768))

(assert (= (and b!118768 res!98302) b!118769))

(assert (= (and b!118769 (not res!98304)) b!118770))

(assert (=> b!118768 m!178303))

(assert (=> b!118768 m!178299))

(assert (=> b!118770 m!178303))

(assert (=> b!118770 m!178303))

(declare-fun m!178557 () Bool)

(assert (=> b!118770 m!178557))

(assert (=> b!118675 d!37976))

(declare-fun d!37978 () Bool)

(assert (=> d!37978 (validate_offset_bits!1 ((_ sign_extend 32) (size!2415 (buf!2834 (_2!5243 lt!182632)))) ((_ sign_extend 32) (currentByte!5489 thiss!1305)) ((_ sign_extend 32) (currentBit!5484 thiss!1305)) lt!182613)))

(declare-fun lt!182925 () Unit!7301)

(assert (=> d!37978 (= lt!182925 (choose!9 thiss!1305 (buf!2834 (_2!5243 lt!182632)) lt!182613 (BitStream!4305 (buf!2834 (_2!5243 lt!182632)) (currentByte!5489 thiss!1305) (currentBit!5484 thiss!1305))))))

(assert (=> d!37978 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2834 (_2!5243 lt!182632)) lt!182613) lt!182925)))

(declare-fun bs!9192 () Bool)

(assert (= bs!9192 d!37978))

(assert (=> bs!9192 m!178361))

(declare-fun m!178559 () Bool)

(assert (=> bs!9192 m!178559))

(assert (=> b!118675 d!37978))

(declare-fun d!37980 () Bool)

(declare-fun e!77861 () Bool)

(assert (=> d!37980 e!77861))

(declare-fun res!98307 () Bool)

(assert (=> d!37980 (=> (not res!98307) (not e!77861))))

(declare-fun lt!182935 () tuple2!9958)

(declare-fun lt!182934 () tuple2!9958)

(assert (=> d!37980 (= res!98307 (= (bitIndex!0 (size!2415 (buf!2834 (_1!5244 lt!182935))) (currentByte!5489 (_1!5244 lt!182935)) (currentBit!5484 (_1!5244 lt!182935))) (bitIndex!0 (size!2415 (buf!2834 (_1!5244 lt!182934))) (currentByte!5489 (_1!5244 lt!182934)) (currentBit!5484 (_1!5244 lt!182934)))))))

(declare-fun lt!182936 () Unit!7301)

(declare-fun lt!182937 () BitStream!4304)

(declare-fun choose!50 (BitStream!4304 BitStream!4304 BitStream!4304 tuple2!9958 tuple2!9958 BitStream!4304 Bool tuple2!9958 tuple2!9958 BitStream!4304 Bool) Unit!7301)

(assert (=> d!37980 (= lt!182936 (choose!50 lt!182608 (_2!5243 lt!182632) lt!182937 lt!182935 (tuple2!9959 (_1!5244 lt!182935) (_2!5244 lt!182935)) (_1!5244 lt!182935) (_2!5244 lt!182935) lt!182934 (tuple2!9959 (_1!5244 lt!182934) (_2!5244 lt!182934)) (_1!5244 lt!182934) (_2!5244 lt!182934)))))

(assert (=> d!37980 (= lt!182934 (readBitPure!0 lt!182937))))

(assert (=> d!37980 (= lt!182935 (readBitPure!0 lt!182608))))

(assert (=> d!37980 (= lt!182937 (BitStream!4305 (buf!2834 (_2!5243 lt!182632)) (currentByte!5489 lt!182608) (currentBit!5484 lt!182608)))))

(assert (=> d!37980 (invariant!0 (currentBit!5484 lt!182608) (currentByte!5489 lt!182608) (size!2415 (buf!2834 (_2!5243 lt!182632))))))

(assert (=> d!37980 (= (readBitPrefixLemma!0 lt!182608 (_2!5243 lt!182632)) lt!182936)))

(declare-fun b!118773 () Bool)

(assert (=> b!118773 (= e!77861 (= (_2!5244 lt!182935) (_2!5244 lt!182934)))))

(assert (= (and d!37980 res!98307) b!118773))

(declare-fun m!178561 () Bool)

(assert (=> d!37980 m!178561))

(declare-fun m!178563 () Bool)

(assert (=> d!37980 m!178563))

(declare-fun m!178565 () Bool)

(assert (=> d!37980 m!178565))

(declare-fun m!178567 () Bool)

(assert (=> d!37980 m!178567))

(assert (=> d!37980 m!178341))

(declare-fun m!178569 () Bool)

(assert (=> d!37980 m!178569))

(assert (=> b!118675 d!37980))

(declare-fun d!37982 () Bool)

(declare-fun e!77863 () Bool)

(assert (=> d!37982 e!77863))

(declare-fun res!98308 () Bool)

(assert (=> d!37982 (=> (not res!98308) (not e!77863))))

(declare-fun lt!182949 () tuple2!9962)

(assert (=> d!37982 (= res!98308 (isPrefixOf!0 (_1!5246 lt!182949) (_2!5246 lt!182949)))))

(declare-fun lt!182945 () BitStream!4304)

(assert (=> d!37982 (= lt!182949 (tuple2!9963 lt!182945 (_2!5243 lt!182632)))))

(declare-fun lt!182939 () Unit!7301)

(declare-fun lt!182955 () Unit!7301)

(assert (=> d!37982 (= lt!182939 lt!182955)))

(assert (=> d!37982 (isPrefixOf!0 lt!182945 (_2!5243 lt!182632))))

(assert (=> d!37982 (= lt!182955 (lemmaIsPrefixTransitive!0 lt!182945 (_2!5243 lt!182632) (_2!5243 lt!182632)))))

(declare-fun lt!182938 () Unit!7301)

(declare-fun lt!182946 () Unit!7301)

(assert (=> d!37982 (= lt!182938 lt!182946)))

(assert (=> d!37982 (isPrefixOf!0 lt!182945 (_2!5243 lt!182632))))

(assert (=> d!37982 (= lt!182946 (lemmaIsPrefixTransitive!0 lt!182945 thiss!1305 (_2!5243 lt!182632)))))

(declare-fun lt!182956 () Unit!7301)

(declare-fun e!77862 () Unit!7301)

(assert (=> d!37982 (= lt!182956 e!77862)))

(declare-fun c!7128 () Bool)

(assert (=> d!37982 (= c!7128 (not (= (size!2415 (buf!2834 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!182953 () Unit!7301)

(declare-fun lt!182941 () Unit!7301)

(assert (=> d!37982 (= lt!182953 lt!182941)))

(assert (=> d!37982 (isPrefixOf!0 (_2!5243 lt!182632) (_2!5243 lt!182632))))

(assert (=> d!37982 (= lt!182941 (lemmaIsPrefixRefl!0 (_2!5243 lt!182632)))))

(declare-fun lt!182942 () Unit!7301)

(declare-fun lt!182950 () Unit!7301)

(assert (=> d!37982 (= lt!182942 lt!182950)))

(assert (=> d!37982 (= lt!182950 (lemmaIsPrefixRefl!0 (_2!5243 lt!182632)))))

(declare-fun lt!182948 () Unit!7301)

(declare-fun lt!182943 () Unit!7301)

(assert (=> d!37982 (= lt!182948 lt!182943)))

(assert (=> d!37982 (isPrefixOf!0 lt!182945 lt!182945)))

(assert (=> d!37982 (= lt!182943 (lemmaIsPrefixRefl!0 lt!182945))))

(declare-fun lt!182940 () Unit!7301)

(declare-fun lt!182947 () Unit!7301)

(assert (=> d!37982 (= lt!182940 lt!182947)))

(assert (=> d!37982 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!37982 (= lt!182947 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!37982 (= lt!182945 (BitStream!4305 (buf!2834 (_2!5243 lt!182632)) (currentByte!5489 thiss!1305) (currentBit!5484 thiss!1305)))))

(assert (=> d!37982 (isPrefixOf!0 thiss!1305 (_2!5243 lt!182632))))

(assert (=> d!37982 (= (reader!0 thiss!1305 (_2!5243 lt!182632)) lt!182949)))

(declare-fun b!118774 () Bool)

(declare-fun Unit!7312 () Unit!7301)

(assert (=> b!118774 (= e!77862 Unit!7312)))

(declare-fun b!118775 () Bool)

(declare-fun lt!182944 () (_ BitVec 64))

(declare-fun lt!182952 () (_ BitVec 64))

(assert (=> b!118775 (= e!77863 (= (_1!5246 lt!182949) (withMovedBitIndex!0 (_2!5246 lt!182949) (bvsub lt!182944 lt!182952))))))

(assert (=> b!118775 (or (= (bvand lt!182944 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!182952 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!182944 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!182944 lt!182952) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!118775 (= lt!182952 (bitIndex!0 (size!2415 (buf!2834 (_2!5243 lt!182632))) (currentByte!5489 (_2!5243 lt!182632)) (currentBit!5484 (_2!5243 lt!182632))))))

(assert (=> b!118775 (= lt!182944 (bitIndex!0 (size!2415 (buf!2834 thiss!1305)) (currentByte!5489 thiss!1305) (currentBit!5484 thiss!1305)))))

(declare-fun b!118776 () Bool)

(declare-fun res!98309 () Bool)

(assert (=> b!118776 (=> (not res!98309) (not e!77863))))

(assert (=> b!118776 (= res!98309 (isPrefixOf!0 (_1!5246 lt!182949) thiss!1305))))

(declare-fun b!118777 () Bool)

(declare-fun lt!182954 () Unit!7301)

(assert (=> b!118777 (= e!77862 lt!182954)))

(declare-fun lt!182957 () (_ BitVec 64))

(assert (=> b!118777 (= lt!182957 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!182951 () (_ BitVec 64))

(assert (=> b!118777 (= lt!182951 (bitIndex!0 (size!2415 (buf!2834 thiss!1305)) (currentByte!5489 thiss!1305) (currentBit!5484 thiss!1305)))))

(assert (=> b!118777 (= lt!182954 (arrayBitRangesEqSymmetric!0 (buf!2834 thiss!1305) (buf!2834 (_2!5243 lt!182632)) lt!182957 lt!182951))))

(assert (=> b!118777 (arrayBitRangesEq!0 (buf!2834 (_2!5243 lt!182632)) (buf!2834 thiss!1305) lt!182957 lt!182951)))

(declare-fun b!118778 () Bool)

(declare-fun res!98310 () Bool)

(assert (=> b!118778 (=> (not res!98310) (not e!77863))))

(assert (=> b!118778 (= res!98310 (isPrefixOf!0 (_2!5246 lt!182949) (_2!5243 lt!182632)))))

(assert (= (and d!37982 c!7128) b!118777))

(assert (= (and d!37982 (not c!7128)) b!118774))

(assert (= (and d!37982 res!98308) b!118776))

(assert (= (and b!118776 res!98309) b!118778))

(assert (= (and b!118778 res!98310) b!118775))

(declare-fun m!178571 () Bool)

(assert (=> b!118776 m!178571))

(declare-fun m!178573 () Bool)

(assert (=> b!118778 m!178573))

(assert (=> b!118777 m!178303))

(declare-fun m!178575 () Bool)

(assert (=> b!118777 m!178575))

(declare-fun m!178577 () Bool)

(assert (=> b!118777 m!178577))

(declare-fun m!178579 () Bool)

(assert (=> b!118775 m!178579))

(assert (=> b!118775 m!178299))

(assert (=> b!118775 m!178303))

(declare-fun m!178581 () Bool)

(assert (=> d!37982 m!178581))

(declare-fun m!178583 () Bool)

(assert (=> d!37982 m!178583))

(declare-fun m!178585 () Bool)

(assert (=> d!37982 m!178585))

(declare-fun m!178587 () Bool)

(assert (=> d!37982 m!178587))

(assert (=> d!37982 m!178541))

(assert (=> d!37982 m!178543))

(declare-fun m!178589 () Bool)

(assert (=> d!37982 m!178589))

(declare-fun m!178591 () Bool)

(assert (=> d!37982 m!178591))

(declare-fun m!178593 () Bool)

(assert (=> d!37982 m!178593))

(assert (=> d!37982 m!178357))

(declare-fun m!178595 () Bool)

(assert (=> d!37982 m!178595))

(assert (=> b!118675 d!37982))

(declare-fun d!37984 () Bool)

(assert (=> d!37984 (= (onesLSBLong!0 (bvsub nBits!396 i!615)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 i!615)))))))

(assert (=> b!118675 d!37984))

(declare-fun d!37986 () Bool)

(declare-fun lt!182958 () tuple2!9968)

(assert (=> d!37986 (= lt!182958 (readNLeastSignificantBitsLoop!0 (_1!5246 lt!182628) nBits!396 i!615 lt!182614))))

(assert (=> d!37986 (= (readNLeastSignificantBitsLoopPure!0 (_1!5246 lt!182628) nBits!396 i!615 lt!182614) (tuple2!9961 (_2!5249 lt!182958) (_1!5249 lt!182958)))))

(declare-fun bs!9193 () Bool)

(assert (= bs!9193 d!37986))

(declare-fun m!178597 () Bool)

(assert (=> bs!9193 m!178597))

(assert (=> b!118675 d!37986))

(declare-fun d!37988 () Bool)

(declare-fun lt!182959 () tuple2!9970)

(assert (=> d!37988 (= lt!182959 (readBit!0 (BitStream!4305 (buf!2834 (_2!5243 lt!182632)) (currentByte!5489 thiss!1305) (currentBit!5484 thiss!1305))))))

(assert (=> d!37988 (= (readBitPure!0 (BitStream!4305 (buf!2834 (_2!5243 lt!182632)) (currentByte!5489 thiss!1305) (currentBit!5484 thiss!1305))) (tuple2!9959 (_2!5250 lt!182959) (_1!5250 lt!182959)))))

(declare-fun bs!9194 () Bool)

(assert (= bs!9194 d!37988))

(declare-fun m!178599 () Bool)

(assert (=> bs!9194 m!178599))

(assert (=> b!118675 d!37988))

(declare-fun d!37990 () Bool)

(assert (=> d!37990 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2415 (buf!2834 (_2!5243 lt!182632)))) ((_ sign_extend 32) (currentByte!5489 (_2!5243 lt!182621))) ((_ sign_extend 32) (currentBit!5484 (_2!5243 lt!182621))) lt!182633) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2415 (buf!2834 (_2!5243 lt!182632)))) ((_ sign_extend 32) (currentByte!5489 (_2!5243 lt!182621))) ((_ sign_extend 32) (currentBit!5484 (_2!5243 lt!182621)))) lt!182633))))

(declare-fun bs!9195 () Bool)

(assert (= bs!9195 d!37990))

(declare-fun m!178601 () Bool)

(assert (=> bs!9195 m!178601))

(assert (=> b!118675 d!37990))

(declare-fun b!118865 () Bool)

(declare-fun e!77917 () tuple2!9956)

(declare-fun lt!183236 () tuple2!9956)

(declare-fun Unit!7313 () Unit!7301)

(assert (=> b!118865 (= e!77917 (tuple2!9957 Unit!7313 (_2!5243 lt!183236)))))

(declare-fun lt!183278 () Bool)

(assert (=> b!118865 (= lt!183278 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!183242 () tuple2!9956)

(assert (=> b!118865 (= lt!183242 (appendBit!0 (_2!5243 lt!182621) lt!183278))))

(declare-fun res!98383 () Bool)

(assert (=> b!118865 (= res!98383 (= (size!2415 (buf!2834 (_2!5243 lt!182621))) (size!2415 (buf!2834 (_2!5243 lt!183242)))))))

(declare-fun e!77919 () Bool)

(assert (=> b!118865 (=> (not res!98383) (not e!77919))))

(assert (=> b!118865 e!77919))

(declare-fun lt!183258 () tuple2!9956)

(assert (=> b!118865 (= lt!183258 lt!183242)))

(assert (=> b!118865 (= lt!183236 (appendNLeastSignificantBitsLoop!0 (_2!5243 lt!183258) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!183253 () Unit!7301)

(assert (=> b!118865 (= lt!183253 (lemmaIsPrefixTransitive!0 (_2!5243 lt!182621) (_2!5243 lt!183258) (_2!5243 lt!183236)))))

(assert (=> b!118865 (isPrefixOf!0 (_2!5243 lt!182621) (_2!5243 lt!183236))))

(declare-fun lt!183239 () Unit!7301)

(assert (=> b!118865 (= lt!183239 lt!183253)))

(assert (=> b!118865 (invariant!0 (currentBit!5484 (_2!5243 lt!182621)) (currentByte!5489 (_2!5243 lt!182621)) (size!2415 (buf!2834 (_2!5243 lt!183258))))))

(declare-fun lt!183251 () BitStream!4304)

(assert (=> b!118865 (= lt!183251 (BitStream!4305 (buf!2834 (_2!5243 lt!183258)) (currentByte!5489 (_2!5243 lt!182621)) (currentBit!5484 (_2!5243 lt!182621))))))

(assert (=> b!118865 (invariant!0 (currentBit!5484 lt!183251) (currentByte!5489 lt!183251) (size!2415 (buf!2834 (_2!5243 lt!183236))))))

(declare-fun lt!183256 () BitStream!4304)

(assert (=> b!118865 (= lt!183256 (BitStream!4305 (buf!2834 (_2!5243 lt!183236)) (currentByte!5489 lt!183251) (currentBit!5484 lt!183251)))))

(declare-fun lt!183267 () tuple2!9958)

(assert (=> b!118865 (= lt!183267 (readBitPure!0 lt!183251))))

(declare-fun lt!183270 () tuple2!9958)

(assert (=> b!118865 (= lt!183270 (readBitPure!0 lt!183256))))

(declare-fun lt!183259 () Unit!7301)

(assert (=> b!118865 (= lt!183259 (readBitPrefixLemma!0 lt!183251 (_2!5243 lt!183236)))))

(declare-fun res!98378 () Bool)

(assert (=> b!118865 (= res!98378 (= (bitIndex!0 (size!2415 (buf!2834 (_1!5244 lt!183267))) (currentByte!5489 (_1!5244 lt!183267)) (currentBit!5484 (_1!5244 lt!183267))) (bitIndex!0 (size!2415 (buf!2834 (_1!5244 lt!183270))) (currentByte!5489 (_1!5244 lt!183270)) (currentBit!5484 (_1!5244 lt!183270)))))))

(declare-fun e!77916 () Bool)

(assert (=> b!118865 (=> (not res!98378) (not e!77916))))

(assert (=> b!118865 e!77916))

(declare-fun lt!183277 () Unit!7301)

(assert (=> b!118865 (= lt!183277 lt!183259)))

(declare-fun lt!183250 () tuple2!9962)

(assert (=> b!118865 (= lt!183250 (reader!0 (_2!5243 lt!182621) (_2!5243 lt!183236)))))

(declare-fun lt!183241 () tuple2!9962)

(assert (=> b!118865 (= lt!183241 (reader!0 (_2!5243 lt!183258) (_2!5243 lt!183236)))))

(declare-fun lt!183276 () tuple2!9958)

(assert (=> b!118865 (= lt!183276 (readBitPure!0 (_1!5246 lt!183250)))))

(assert (=> b!118865 (= (_2!5244 lt!183276) lt!183278)))

(declare-fun lt!183261 () Unit!7301)

(declare-fun Unit!7314 () Unit!7301)

(assert (=> b!118865 (= lt!183261 Unit!7314)))

(declare-fun lt!183274 () (_ BitVec 64))

(assert (=> b!118865 (= lt!183274 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!183266 () (_ BitVec 64))

(assert (=> b!118865 (= lt!183266 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!183269 () Unit!7301)

(assert (=> b!118865 (= lt!183269 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5243 lt!182621) (buf!2834 (_2!5243 lt!183236)) lt!183266))))

(assert (=> b!118865 (validate_offset_bits!1 ((_ sign_extend 32) (size!2415 (buf!2834 (_2!5243 lt!183236)))) ((_ sign_extend 32) (currentByte!5489 (_2!5243 lt!182621))) ((_ sign_extend 32) (currentBit!5484 (_2!5243 lt!182621))) lt!183266)))

(declare-fun lt!183257 () Unit!7301)

(assert (=> b!118865 (= lt!183257 lt!183269)))

(declare-fun lt!183252 () tuple2!9960)

(assert (=> b!118865 (= lt!183252 (readNLeastSignificantBitsLoopPure!0 (_1!5246 lt!183250) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!183274))))

(declare-fun lt!183240 () (_ BitVec 64))

(assert (=> b!118865 (= lt!183240 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!183243 () Unit!7301)

(assert (=> b!118865 (= lt!183243 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5243 lt!183258) (buf!2834 (_2!5243 lt!183236)) lt!183240))))

(assert (=> b!118865 (validate_offset_bits!1 ((_ sign_extend 32) (size!2415 (buf!2834 (_2!5243 lt!183236)))) ((_ sign_extend 32) (currentByte!5489 (_2!5243 lt!183258))) ((_ sign_extend 32) (currentBit!5484 (_2!5243 lt!183258))) lt!183240)))

(declare-fun lt!183238 () Unit!7301)

(assert (=> b!118865 (= lt!183238 lt!183243)))

(declare-fun lt!183247 () tuple2!9960)

(assert (=> b!118865 (= lt!183247 (readNLeastSignificantBitsLoopPure!0 (_1!5246 lt!183241) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!183274 (ite (_2!5244 lt!183276) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!183262 () tuple2!9960)

(assert (=> b!118865 (= lt!183262 (readNLeastSignificantBitsLoopPure!0 (_1!5246 lt!183250) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!183274))))

(declare-fun c!7140 () Bool)

(assert (=> b!118865 (= c!7140 (_2!5244 (readBitPure!0 (_1!5246 lt!183250))))))

(declare-fun lt!183255 () tuple2!9960)

(declare-fun e!77914 () (_ BitVec 64))

(assert (=> b!118865 (= lt!183255 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!5246 lt!183250) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!183274 e!77914)))))

(declare-fun lt!183248 () Unit!7301)

(assert (=> b!118865 (= lt!183248 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5246 lt!183250) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!183274))))

(assert (=> b!118865 (and (= (_2!5245 lt!183262) (_2!5245 lt!183255)) (= (_1!5245 lt!183262) (_1!5245 lt!183255)))))

(declare-fun lt!183245 () Unit!7301)

(assert (=> b!118865 (= lt!183245 lt!183248)))

(assert (=> b!118865 (= (_1!5246 lt!183250) (withMovedBitIndex!0 (_2!5246 lt!183250) (bvsub (bitIndex!0 (size!2415 (buf!2834 (_2!5243 lt!182621))) (currentByte!5489 (_2!5243 lt!182621)) (currentBit!5484 (_2!5243 lt!182621))) (bitIndex!0 (size!2415 (buf!2834 (_2!5243 lt!183236))) (currentByte!5489 (_2!5243 lt!183236)) (currentBit!5484 (_2!5243 lt!183236))))))))

(declare-fun lt!183275 () Unit!7301)

(declare-fun Unit!7315 () Unit!7301)

(assert (=> b!118865 (= lt!183275 Unit!7315)))

(assert (=> b!118865 (= (_1!5246 lt!183241) (withMovedBitIndex!0 (_2!5246 lt!183241) (bvsub (bitIndex!0 (size!2415 (buf!2834 (_2!5243 lt!183258))) (currentByte!5489 (_2!5243 lt!183258)) (currentBit!5484 (_2!5243 lt!183258))) (bitIndex!0 (size!2415 (buf!2834 (_2!5243 lt!183236))) (currentByte!5489 (_2!5243 lt!183236)) (currentBit!5484 (_2!5243 lt!183236))))))))

(declare-fun lt!183265 () Unit!7301)

(declare-fun Unit!7316 () Unit!7301)

(assert (=> b!118865 (= lt!183265 Unit!7316)))

(assert (=> b!118865 (= (bitIndex!0 (size!2415 (buf!2834 (_2!5243 lt!182621))) (currentByte!5489 (_2!5243 lt!182621)) (currentBit!5484 (_2!5243 lt!182621))) (bvsub (bitIndex!0 (size!2415 (buf!2834 (_2!5243 lt!183258))) (currentByte!5489 (_2!5243 lt!183258)) (currentBit!5484 (_2!5243 lt!183258))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!183263 () Unit!7301)

(declare-fun Unit!7317 () Unit!7301)

(assert (=> b!118865 (= lt!183263 Unit!7317)))

(assert (=> b!118865 (= (_2!5245 lt!183252) (_2!5245 lt!183247))))

(declare-fun lt!183235 () Unit!7301)

(declare-fun Unit!7318 () Unit!7301)

(assert (=> b!118865 (= lt!183235 Unit!7318)))

(assert (=> b!118865 (= (_1!5245 lt!183252) (_2!5246 lt!183250))))

(declare-fun b!118866 () Bool)

(declare-fun res!98385 () Bool)

(declare-fun e!77918 () Bool)

(assert (=> b!118866 (=> (not res!98385) (not e!77918))))

(declare-fun lt!183244 () tuple2!9956)

(declare-fun lt!183271 () (_ BitVec 64))

(declare-fun lt!183237 () (_ BitVec 64))

(assert (=> b!118866 (= res!98385 (= (bitIndex!0 (size!2415 (buf!2834 (_2!5243 lt!183244))) (currentByte!5489 (_2!5243 lt!183244)) (currentBit!5484 (_2!5243 lt!183244))) (bvadd lt!183237 lt!183271)))))

(assert (=> b!118866 (or (not (= (bvand lt!183237 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!183271 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!183237 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!183237 lt!183271) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!118866 (= lt!183271 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!118866 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!118866 (= lt!183237 (bitIndex!0 (size!2415 (buf!2834 (_2!5243 lt!182621))) (currentByte!5489 (_2!5243 lt!182621)) (currentBit!5484 (_2!5243 lt!182621))))))

(declare-fun b!118867 () Bool)

(assert (=> b!118867 (= e!77916 (= (_2!5244 lt!183267) (_2!5244 lt!183270)))))

(declare-fun b!118868 () Bool)

(declare-fun res!98377 () Bool)

(assert (=> b!118868 (= res!98377 (= (bitIndex!0 (size!2415 (buf!2834 (_2!5243 lt!183242))) (currentByte!5489 (_2!5243 lt!183242)) (currentBit!5484 (_2!5243 lt!183242))) (bvadd (bitIndex!0 (size!2415 (buf!2834 (_2!5243 lt!182621))) (currentByte!5489 (_2!5243 lt!182621)) (currentBit!5484 (_2!5243 lt!182621))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!118868 (=> (not res!98377) (not e!77919))))

(declare-fun b!118870 () Bool)

(declare-fun lt!183264 () Unit!7301)

(assert (=> b!118870 (= e!77917 (tuple2!9957 lt!183264 (_2!5243 lt!182621)))))

(declare-fun lt!183254 () BitStream!4304)

(assert (=> b!118870 (= lt!183254 (_2!5243 lt!182621))))

(assert (=> b!118870 (= lt!183264 (lemmaIsPrefixRefl!0 lt!183254))))

(declare-fun call!1541 () Bool)

(assert (=> b!118870 call!1541))

(declare-fun b!118871 () Bool)

(declare-fun res!98382 () Bool)

(assert (=> b!118871 (=> (not res!98382) (not e!77918))))

(assert (=> b!118871 (= res!98382 (isPrefixOf!0 (_2!5243 lt!182621) (_2!5243 lt!183244)))))

(declare-fun b!118872 () Bool)

(declare-fun e!77915 () Bool)

(declare-fun lt!183279 () tuple2!9958)

(assert (=> b!118872 (= e!77915 (= (bitIndex!0 (size!2415 (buf!2834 (_1!5244 lt!183279))) (currentByte!5489 (_1!5244 lt!183279)) (currentBit!5484 (_1!5244 lt!183279))) (bitIndex!0 (size!2415 (buf!2834 (_2!5243 lt!183242))) (currentByte!5489 (_2!5243 lt!183242)) (currentBit!5484 (_2!5243 lt!183242)))))))

(declare-fun b!118873 () Bool)

(assert (=> b!118873 (= e!77914 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun bm!1538 () Bool)

(declare-fun c!7139 () Bool)

(assert (=> bm!1538 (= call!1541 (isPrefixOf!0 (ite c!7139 (_2!5243 lt!182621) lt!183254) (ite c!7139 (_2!5243 lt!183242) lt!183254)))))

(declare-fun lt!183273 () tuple2!9960)

(declare-fun b!118874 () Bool)

(declare-fun lt!183268 () tuple2!9962)

(assert (=> b!118874 (= e!77918 (and (= (_2!5245 lt!183273) v!199) (= (_1!5245 lt!183273) (_2!5246 lt!183268))))))

(declare-fun lt!183272 () (_ BitVec 64))

(assert (=> b!118874 (= lt!183273 (readNLeastSignificantBitsLoopPure!0 (_1!5246 lt!183268) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!183272))))

(declare-fun lt!183260 () Unit!7301)

(declare-fun lt!183249 () Unit!7301)

(assert (=> b!118874 (= lt!183260 lt!183249)))

(declare-fun lt!183246 () (_ BitVec 64))

(assert (=> b!118874 (validate_offset_bits!1 ((_ sign_extend 32) (size!2415 (buf!2834 (_2!5243 lt!183244)))) ((_ sign_extend 32) (currentByte!5489 (_2!5243 lt!182621))) ((_ sign_extend 32) (currentBit!5484 (_2!5243 lt!182621))) lt!183246)))

(assert (=> b!118874 (= lt!183249 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5243 lt!182621) (buf!2834 (_2!5243 lt!183244)) lt!183246))))

(declare-fun e!77913 () Bool)

(assert (=> b!118874 e!77913))

(declare-fun res!98380 () Bool)

(assert (=> b!118874 (=> (not res!98380) (not e!77913))))

(assert (=> b!118874 (= res!98380 (and (= (size!2415 (buf!2834 (_2!5243 lt!182621))) (size!2415 (buf!2834 (_2!5243 lt!183244)))) (bvsge lt!183246 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!118874 (= lt!183246 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!118874 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!118874 (= lt!183272 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!118874 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!118874 (= lt!183268 (reader!0 (_2!5243 lt!182621) (_2!5243 lt!183244)))))

(declare-fun b!118875 () Bool)

(assert (=> b!118875 (= lt!183279 (readBitPure!0 (readerFrom!0 (_2!5243 lt!183242) (currentBit!5484 (_2!5243 lt!182621)) (currentByte!5489 (_2!5243 lt!182621)))))))

(declare-fun res!98384 () Bool)

(assert (=> b!118875 (= res!98384 (and (= (_2!5244 lt!183279) lt!183278) (= (_1!5244 lt!183279) (_2!5243 lt!183242))))))

(assert (=> b!118875 (=> (not res!98384) (not e!77915))))

(assert (=> b!118875 (= e!77919 e!77915)))

(declare-fun d!37992 () Bool)

(assert (=> d!37992 e!77918))

(declare-fun res!98381 () Bool)

(assert (=> d!37992 (=> (not res!98381) (not e!77918))))

(assert (=> d!37992 (= res!98381 (= (size!2415 (buf!2834 (_2!5243 lt!182621))) (size!2415 (buf!2834 (_2!5243 lt!183244)))))))

(assert (=> d!37992 (= lt!183244 e!77917)))

(assert (=> d!37992 (= c!7139 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!37992 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!37992 (= (appendNLeastSignificantBitsLoop!0 (_2!5243 lt!182621) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!183244)))

(declare-fun b!118869 () Bool)

(declare-fun res!98379 () Bool)

(assert (=> b!118869 (= res!98379 call!1541)))

(assert (=> b!118869 (=> (not res!98379) (not e!77919))))

(declare-fun b!118876 () Bool)

(assert (=> b!118876 (= e!77914 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun b!118877 () Bool)

(assert (=> b!118877 (= e!77913 (validate_offset_bits!1 ((_ sign_extend 32) (size!2415 (buf!2834 (_2!5243 lt!182621)))) ((_ sign_extend 32) (currentByte!5489 (_2!5243 lt!182621))) ((_ sign_extend 32) (currentBit!5484 (_2!5243 lt!182621))) lt!183246))))

(assert (= (and d!37992 c!7139) b!118865))

(assert (= (and d!37992 (not c!7139)) b!118870))

(assert (= (and b!118865 res!98383) b!118868))

(assert (= (and b!118868 res!98377) b!118869))

(assert (= (and b!118869 res!98379) b!118875))

(assert (= (and b!118875 res!98384) b!118872))

(assert (= (and b!118865 res!98378) b!118867))

(assert (= (and b!118865 c!7140) b!118876))

(assert (= (and b!118865 (not c!7140)) b!118873))

(assert (= (or b!118869 b!118870) bm!1538))

(assert (= (and d!37992 res!98381) b!118866))

(assert (= (and b!118866 res!98385) b!118871))

(assert (= (and b!118871 res!98382) b!118874))

(assert (= (and b!118874 res!98380) b!118877))

(declare-fun m!178725 () Bool)

(assert (=> b!118870 m!178725))

(declare-fun m!178727 () Bool)

(assert (=> b!118874 m!178727))

(declare-fun m!178729 () Bool)

(assert (=> b!118874 m!178729))

(declare-fun m!178731 () Bool)

(assert (=> b!118874 m!178731))

(declare-fun m!178733 () Bool)

(assert (=> b!118874 m!178733))

(declare-fun m!178735 () Bool)

(assert (=> b!118874 m!178735))

(declare-fun m!178737 () Bool)

(assert (=> b!118868 m!178737))

(assert (=> b!118868 m!178309))

(declare-fun m!178739 () Bool)

(assert (=> b!118871 m!178739))

(declare-fun m!178741 () Bool)

(assert (=> b!118865 m!178741))

(declare-fun m!178743 () Bool)

(assert (=> b!118865 m!178743))

(declare-fun m!178745 () Bool)

(assert (=> b!118865 m!178745))

(declare-fun m!178747 () Bool)

(assert (=> b!118865 m!178747))

(assert (=> b!118865 m!178309))

(declare-fun m!178749 () Bool)

(assert (=> b!118865 m!178749))

(declare-fun m!178751 () Bool)

(assert (=> b!118865 m!178751))

(declare-fun m!178753 () Bool)

(assert (=> b!118865 m!178753))

(declare-fun m!178755 () Bool)

(assert (=> b!118865 m!178755))

(declare-fun m!178757 () Bool)

(assert (=> b!118865 m!178757))

(declare-fun m!178759 () Bool)

(assert (=> b!118865 m!178759))

(declare-fun m!178761 () Bool)

(assert (=> b!118865 m!178761))

(declare-fun m!178763 () Bool)

(assert (=> b!118865 m!178763))

(declare-fun m!178765 () Bool)

(assert (=> b!118865 m!178765))

(declare-fun m!178767 () Bool)

(assert (=> b!118865 m!178767))

(declare-fun m!178769 () Bool)

(assert (=> b!118865 m!178769))

(declare-fun m!178771 () Bool)

(assert (=> b!118865 m!178771))

(assert (=> b!118865 m!178765))

(assert (=> b!118865 m!178729))

(declare-fun m!178773 () Bool)

(assert (=> b!118865 m!178773))

(declare-fun m!178775 () Bool)

(assert (=> b!118865 m!178775))

(declare-fun m!178777 () Bool)

(assert (=> b!118865 m!178777))

(declare-fun m!178779 () Bool)

(assert (=> b!118865 m!178779))

(declare-fun m!178781 () Bool)

(assert (=> b!118865 m!178781))

(declare-fun m!178783 () Bool)

(assert (=> b!118865 m!178783))

(declare-fun m!178785 () Bool)

(assert (=> b!118865 m!178785))

(declare-fun m!178787 () Bool)

(assert (=> b!118865 m!178787))

(declare-fun m!178789 () Bool)

(assert (=> b!118865 m!178789))

(declare-fun m!178791 () Bool)

(assert (=> b!118865 m!178791))

(declare-fun m!178793 () Bool)

(assert (=> b!118865 m!178793))

(declare-fun m!178795 () Bool)

(assert (=> b!118875 m!178795))

(assert (=> b!118875 m!178795))

(declare-fun m!178797 () Bool)

(assert (=> b!118875 m!178797))

(declare-fun m!178799 () Bool)

(assert (=> b!118877 m!178799))

(declare-fun m!178801 () Bool)

(assert (=> bm!1538 m!178801))

(declare-fun m!178803 () Bool)

(assert (=> b!118866 m!178803))

(assert (=> b!118866 m!178309))

(declare-fun m!178805 () Bool)

(assert (=> b!118872 m!178805))

(assert (=> b!118872 m!178737))

(assert (=> b!118675 d!37992))

(declare-fun b!118887 () Bool)

(declare-fun res!98395 () Bool)

(declare-fun e!77925 () Bool)

(assert (=> b!118887 (=> (not res!98395) (not e!77925))))

(declare-fun lt!183290 () (_ BitVec 64))

(declare-fun lt!183291 () (_ BitVec 64))

(declare-fun lt!183288 () tuple2!9956)

(assert (=> b!118887 (= res!98395 (= (bitIndex!0 (size!2415 (buf!2834 (_2!5243 lt!183288))) (currentByte!5489 (_2!5243 lt!183288)) (currentBit!5484 (_2!5243 lt!183288))) (bvadd lt!183290 lt!183291)))))

(assert (=> b!118887 (or (not (= (bvand lt!183290 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!183291 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!183290 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!183290 lt!183291) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!118887 (= lt!183291 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!118887 (= lt!183290 (bitIndex!0 (size!2415 (buf!2834 thiss!1305)) (currentByte!5489 thiss!1305) (currentBit!5484 thiss!1305)))))

(declare-fun b!118890 () Bool)

(declare-fun e!77924 () Bool)

(declare-fun lt!183289 () tuple2!9958)

(assert (=> b!118890 (= e!77924 (= (bitIndex!0 (size!2415 (buf!2834 (_1!5244 lt!183289))) (currentByte!5489 (_1!5244 lt!183289)) (currentBit!5484 (_1!5244 lt!183289))) (bitIndex!0 (size!2415 (buf!2834 (_2!5243 lt!183288))) (currentByte!5489 (_2!5243 lt!183288)) (currentBit!5484 (_2!5243 lt!183288)))))))

(declare-fun b!118888 () Bool)

(declare-fun res!98397 () Bool)

(assert (=> b!118888 (=> (not res!98397) (not e!77925))))

(assert (=> b!118888 (= res!98397 (isPrefixOf!0 thiss!1305 (_2!5243 lt!183288)))))

(declare-fun d!38034 () Bool)

(assert (=> d!38034 e!77925))

(declare-fun res!98396 () Bool)

(assert (=> d!38034 (=> (not res!98396) (not e!77925))))

(assert (=> d!38034 (= res!98396 (= (size!2415 (buf!2834 thiss!1305)) (size!2415 (buf!2834 (_2!5243 lt!183288)))))))

(declare-fun choose!16 (BitStream!4304 Bool) tuple2!9956)

(assert (=> d!38034 (= lt!183288 (choose!16 thiss!1305 lt!182618))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!38034 (validate_offset_bit!0 ((_ sign_extend 32) (size!2415 (buf!2834 thiss!1305))) ((_ sign_extend 32) (currentByte!5489 thiss!1305)) ((_ sign_extend 32) (currentBit!5484 thiss!1305)))))

(assert (=> d!38034 (= (appendBit!0 thiss!1305 lt!182618) lt!183288)))

(declare-fun b!118889 () Bool)

(assert (=> b!118889 (= e!77925 e!77924)))

(declare-fun res!98394 () Bool)

(assert (=> b!118889 (=> (not res!98394) (not e!77924))))

(assert (=> b!118889 (= res!98394 (and (= (_2!5244 lt!183289) lt!182618) (= (_1!5244 lt!183289) (_2!5243 lt!183288))))))

(assert (=> b!118889 (= lt!183289 (readBitPure!0 (readerFrom!0 (_2!5243 lt!183288) (currentBit!5484 thiss!1305) (currentByte!5489 thiss!1305))))))

(assert (= (and d!38034 res!98396) b!118887))

(assert (= (and b!118887 res!98395) b!118888))

(assert (= (and b!118888 res!98397) b!118889))

(assert (= (and b!118889 res!98394) b!118890))

(declare-fun m!178807 () Bool)

(assert (=> b!118889 m!178807))

(assert (=> b!118889 m!178807))

(declare-fun m!178809 () Bool)

(assert (=> b!118889 m!178809))

(declare-fun m!178811 () Bool)

(assert (=> b!118887 m!178811))

(assert (=> b!118887 m!178303))

(declare-fun m!178813 () Bool)

(assert (=> b!118890 m!178813))

(assert (=> b!118890 m!178811))

(declare-fun m!178815 () Bool)

(assert (=> d!38034 m!178815))

(declare-fun m!178817 () Bool)

(assert (=> d!38034 m!178817))

(declare-fun m!178819 () Bool)

(assert (=> b!118888 m!178819))

(assert (=> b!118675 d!38034))

(declare-fun d!38036 () Bool)

(declare-fun lt!183292 () tuple2!9970)

(assert (=> d!38036 (= lt!183292 (readBit!0 (readerFrom!0 (_2!5243 lt!182621) (currentBit!5484 thiss!1305) (currentByte!5489 thiss!1305))))))

(assert (=> d!38036 (= (readBitPure!0 (readerFrom!0 (_2!5243 lt!182621) (currentBit!5484 thiss!1305) (currentByte!5489 thiss!1305))) (tuple2!9959 (_2!5250 lt!183292) (_1!5250 lt!183292)))))

(declare-fun bs!9207 () Bool)

(assert (= bs!9207 d!38036))

(assert (=> bs!9207 m!178363))

(declare-fun m!178821 () Bool)

(assert (=> bs!9207 m!178821))

(assert (=> b!118664 d!38036))

(declare-fun d!38038 () Bool)

(declare-fun e!77928 () Bool)

(assert (=> d!38038 e!77928))

(declare-fun res!98401 () Bool)

(assert (=> d!38038 (=> (not res!98401) (not e!77928))))

(assert (=> d!38038 (= res!98401 (invariant!0 (currentBit!5484 (_2!5243 lt!182621)) (currentByte!5489 (_2!5243 lt!182621)) (size!2415 (buf!2834 (_2!5243 lt!182621)))))))

(assert (=> d!38038 (= (readerFrom!0 (_2!5243 lt!182621) (currentBit!5484 thiss!1305) (currentByte!5489 thiss!1305)) (BitStream!4305 (buf!2834 (_2!5243 lt!182621)) (currentByte!5489 thiss!1305) (currentBit!5484 thiss!1305)))))

(declare-fun b!118893 () Bool)

(assert (=> b!118893 (= e!77928 (invariant!0 (currentBit!5484 thiss!1305) (currentByte!5489 thiss!1305) (size!2415 (buf!2834 (_2!5243 lt!182621)))))))

(assert (= (and d!38038 res!98401) b!118893))

(assert (=> d!38038 m!178503))

(assert (=> b!118893 m!178315))

(assert (=> b!118664 d!38038))

(declare-fun d!38040 () Bool)

(assert (=> d!38040 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!118663 d!38040))

(push 1)

(assert (not d!37958))

(assert (not d!37938))

(assert (not b!118868))

(assert (not b!118770))

(assert (not d!37970))

(assert (not b!118776))

(assert (not b!118866))

(assert (not b!118714))

(assert (not d!37986))

(assert (not d!37964))

(assert (not b!118865))

(assert (not b!118890))

(assert (not d!38038))

(assert (not b!118874))

(assert (not d!37978))

(assert (not d!37930))

(assert (not d!37968))

(assert (not b!118716))

(assert (not b!118889))

(assert (not d!37960))

(assert (not d!37956))

(assert (not b!118775))

(assert (not d!37988))

(assert (not d!37942))

(assert (not b!118765))

(assert (not d!37966))

(assert (not d!37962))

(assert (not d!37974))

(assert (not b!118875))

(assert (not d!38036))

(assert (not d!37982))

(assert (not b!118872))

(assert (not d!37946))

(assert (not b!118778))

(assert (not b!118877))

(assert (not b!118888))

(assert (not b!118893))

(assert (not b!118871))

(assert (not d!37940))

(assert (not d!37948))

(assert (not b!118870))

(assert (not b!118764))

(assert (not d!37980))

(assert (not d!38034))

(assert (not d!37972))

(assert (not b!118887))

(assert (not b!118767))

(assert (not d!37954))

(assert (not bm!1538))

(assert (not b!118768))

(assert (not d!37944))

(assert (not d!37990))

(assert (not b!118766))

(assert (not b!118777))

(check-sat)

(pop 1)

(push 1)

(check-sat)

