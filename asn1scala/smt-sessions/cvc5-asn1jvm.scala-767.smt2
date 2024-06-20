; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21880 () Bool)

(assert start!21880)

(declare-fun res!91206 () Bool)

(declare-fun e!72471 () Bool)

(assert (=> start!21880 (=> (not res!91206) (not e!72471))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> start!21880 (= res!91206 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21880 e!72471))

(assert (=> start!21880 true))

(declare-datatypes ((array!5060 0))(
  ( (array!5061 (arr!2895 (Array (_ BitVec 32) (_ BitVec 8))) (size!2302 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4078 0))(
  ( (BitStream!4079 (buf!2696 array!5060) (currentByte!5250 (_ BitVec 32)) (currentBit!5245 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4078)

(declare-fun e!72472 () Bool)

(declare-fun inv!12 (BitStream!4078) Bool)

(assert (=> start!21880 (and (inv!12 thiss!1305) e!72472)))

(declare-fun b!110486 () Bool)

(declare-fun res!91208 () Bool)

(declare-fun e!72473 () Bool)

(assert (=> b!110486 (=> (not res!91208) (not e!72473))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!110486 (= res!91208 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!110487 () Bool)

(declare-fun e!72470 () Bool)

(declare-datatypes ((tuple2!9198 0))(
  ( (tuple2!9199 (_1!4856 BitStream!4078) (_2!4856 BitStream!4078)) )
))
(declare-fun lt!167173 () tuple2!9198)

(declare-fun lt!167171 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!110487 (= e!72470 (validate_offset_bits!1 ((_ sign_extend 32) (size!2302 (buf!2696 (_1!4856 lt!167173)))) ((_ sign_extend 32) (currentByte!5250 (_1!4856 lt!167173))) ((_ sign_extend 32) (currentBit!5245 (_1!4856 lt!167173))) lt!167171))))

(declare-datatypes ((Unit!6769 0))(
  ( (Unit!6770) )
))
(declare-fun lt!167174 () Unit!6769)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4078 array!5060 (_ BitVec 64)) Unit!6769)

(assert (=> b!110487 (= lt!167174 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2696 thiss!1305) lt!167171))))

(declare-fun reader!0 (BitStream!4078 BitStream!4078) tuple2!9198)

(assert (=> b!110487 (= lt!167173 (reader!0 thiss!1305 thiss!1305))))

(declare-fun b!110488 () Bool)

(assert (=> b!110488 (= e!72473 (not e!72470))))

(declare-fun res!91209 () Bool)

(assert (=> b!110488 (=> res!91209 e!72470)))

(declare-fun lt!167170 () (_ BitVec 64))

(assert (=> b!110488 (= res!91209 (not (= lt!167170 (bvadd lt!167170 lt!167171))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!110488 (= lt!167170 (bitIndex!0 (size!2302 (buf!2696 thiss!1305)) (currentByte!5250 thiss!1305) (currentBit!5245 thiss!1305)))))

(declare-fun isPrefixOf!0 (BitStream!4078 BitStream!4078) Bool)

(assert (=> b!110488 (isPrefixOf!0 thiss!1305 thiss!1305)))

(declare-fun lt!167172 () Unit!6769)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4078) Unit!6769)

(assert (=> b!110488 (= lt!167172 (lemmaIsPrefixRefl!0 thiss!1305))))

(declare-fun b!110489 () Bool)

(assert (=> b!110489 (= e!72471 e!72473)))

(declare-fun res!91210 () Bool)

(assert (=> b!110489 (=> (not res!91210) (not e!72473))))

(assert (=> b!110489 (= res!91210 (validate_offset_bits!1 ((_ sign_extend 32) (size!2302 (buf!2696 thiss!1305))) ((_ sign_extend 32) (currentByte!5250 thiss!1305)) ((_ sign_extend 32) (currentBit!5245 thiss!1305)) lt!167171))))

(assert (=> b!110489 (= lt!167171 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!110490 () Bool)

(declare-fun array_inv!2104 (array!5060) Bool)

(assert (=> b!110490 (= e!72472 (array_inv!2104 (buf!2696 thiss!1305)))))

(declare-fun b!110491 () Bool)

(declare-fun res!91207 () Bool)

(assert (=> b!110491 (=> (not res!91207) (not e!72473))))

(assert (=> b!110491 (= res!91207 (bvsge i!615 nBits!396))))

(assert (= (and start!21880 res!91206) b!110489))

(assert (= (and b!110489 res!91210) b!110486))

(assert (= (and b!110486 res!91208) b!110491))

(assert (= (and b!110491 res!91207) b!110488))

(assert (= (and b!110488 (not res!91209)) b!110487))

(assert (= start!21880 b!110490))

(declare-fun m!164051 () Bool)

(assert (=> start!21880 m!164051))

(declare-fun m!164053 () Bool)

(assert (=> b!110487 m!164053))

(declare-fun m!164055 () Bool)

(assert (=> b!110487 m!164055))

(declare-fun m!164057 () Bool)

(assert (=> b!110487 m!164057))

(declare-fun m!164059 () Bool)

(assert (=> b!110490 m!164059))

(declare-fun m!164061 () Bool)

(assert (=> b!110486 m!164061))

(declare-fun m!164063 () Bool)

(assert (=> b!110489 m!164063))

(declare-fun m!164065 () Bool)

(assert (=> b!110488 m!164065))

(declare-fun m!164067 () Bool)

(assert (=> b!110488 m!164067))

(declare-fun m!164069 () Bool)

(assert (=> b!110488 m!164069))

(push 1)

(assert (not start!21880))

(assert (not b!110487))

(assert (not b!110486))

(assert (not b!110490))

(assert (not b!110488))

(assert (not b!110489))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!34760 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!34760 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5245 thiss!1305) (currentByte!5250 thiss!1305) (size!2302 (buf!2696 thiss!1305))))))

(declare-fun bs!8515 () Bool)

(assert (= bs!8515 d!34760))

(declare-fun m!164115 () Bool)

(assert (=> bs!8515 m!164115))

(assert (=> start!21880 d!34760))

(declare-fun d!34764 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!34764 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2302 (buf!2696 (_1!4856 lt!167173)))) ((_ sign_extend 32) (currentByte!5250 (_1!4856 lt!167173))) ((_ sign_extend 32) (currentBit!5245 (_1!4856 lt!167173))) lt!167171) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2302 (buf!2696 (_1!4856 lt!167173)))) ((_ sign_extend 32) (currentByte!5250 (_1!4856 lt!167173))) ((_ sign_extend 32) (currentBit!5245 (_1!4856 lt!167173)))) lt!167171))))

(declare-fun bs!8516 () Bool)

(assert (= bs!8516 d!34764))

(declare-fun m!164117 () Bool)

(assert (=> bs!8516 m!164117))

(assert (=> b!110487 d!34764))

(declare-fun d!34766 () Bool)

(assert (=> d!34766 (validate_offset_bits!1 ((_ sign_extend 32) (size!2302 (buf!2696 thiss!1305))) ((_ sign_extend 32) (currentByte!5250 thiss!1305)) ((_ sign_extend 32) (currentBit!5245 thiss!1305)) lt!167171)))

(declare-fun lt!167213 () Unit!6769)

(declare-fun choose!9 (BitStream!4078 array!5060 (_ BitVec 64) BitStream!4078) Unit!6769)

(assert (=> d!34766 (= lt!167213 (choose!9 thiss!1305 (buf!2696 thiss!1305) lt!167171 (BitStream!4079 (buf!2696 thiss!1305) (currentByte!5250 thiss!1305) (currentBit!5245 thiss!1305))))))

(assert (=> d!34766 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2696 thiss!1305) lt!167171) lt!167213)))

(declare-fun bs!8519 () Bool)

(assert (= bs!8519 d!34766))

(assert (=> bs!8519 m!164063))

(declare-fun m!164123 () Bool)

(assert (=> bs!8519 m!164123))

(assert (=> b!110487 d!34766))

(declare-fun d!34772 () Bool)

(declare-fun e!72520 () Bool)

(assert (=> d!34772 e!72520))

(declare-fun res!91265 () Bool)

(assert (=> d!34772 (=> (not res!91265) (not e!72520))))

(declare-fun lt!167374 () tuple2!9198)

(assert (=> d!34772 (= res!91265 (isPrefixOf!0 (_1!4856 lt!167374) (_2!4856 lt!167374)))))

(declare-fun lt!167393 () BitStream!4078)

(assert (=> d!34772 (= lt!167374 (tuple2!9199 lt!167393 thiss!1305))))

(declare-fun lt!167389 () Unit!6769)

(declare-fun lt!167379 () Unit!6769)

(assert (=> d!34772 (= lt!167389 lt!167379)))

(assert (=> d!34772 (isPrefixOf!0 lt!167393 thiss!1305)))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4078 BitStream!4078 BitStream!4078) Unit!6769)

(assert (=> d!34772 (= lt!167379 (lemmaIsPrefixTransitive!0 lt!167393 thiss!1305 thiss!1305))))

(declare-fun lt!167391 () Unit!6769)

(declare-fun lt!167383 () Unit!6769)

(assert (=> d!34772 (= lt!167391 lt!167383)))

(assert (=> d!34772 (isPrefixOf!0 lt!167393 thiss!1305)))

(assert (=> d!34772 (= lt!167383 (lemmaIsPrefixTransitive!0 lt!167393 thiss!1305 thiss!1305))))

(declare-fun lt!167390 () Unit!6769)

(declare-fun e!72521 () Unit!6769)

(assert (=> d!34772 (= lt!167390 e!72521)))

(declare-fun c!6728 () Bool)

(assert (=> d!34772 (= c!6728 (not (= (size!2302 (buf!2696 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!167387 () Unit!6769)

(declare-fun lt!167382 () Unit!6769)

(assert (=> d!34772 (= lt!167387 lt!167382)))

(assert (=> d!34772 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!34772 (= lt!167382 (lemmaIsPrefixRefl!0 thiss!1305))))

(declare-fun lt!167378 () Unit!6769)

(declare-fun lt!167392 () Unit!6769)

(assert (=> d!34772 (= lt!167378 lt!167392)))

(assert (=> d!34772 (= lt!167392 (lemmaIsPrefixRefl!0 thiss!1305))))

(declare-fun lt!167377 () Unit!6769)

(declare-fun lt!167376 () Unit!6769)

(assert (=> d!34772 (= lt!167377 lt!167376)))

(assert (=> d!34772 (isPrefixOf!0 lt!167393 lt!167393)))

(assert (=> d!34772 (= lt!167376 (lemmaIsPrefixRefl!0 lt!167393))))

(declare-fun lt!167388 () Unit!6769)

(declare-fun lt!167375 () Unit!6769)

(assert (=> d!34772 (= lt!167388 lt!167375)))

(assert (=> d!34772 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!34772 (= lt!167375 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!34772 (= lt!167393 (BitStream!4079 (buf!2696 thiss!1305) (currentByte!5250 thiss!1305) (currentBit!5245 thiss!1305)))))

(assert (=> d!34772 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!34772 (= (reader!0 thiss!1305 thiss!1305) lt!167374)))

(declare-fun b!110568 () Bool)

(declare-fun res!91267 () Bool)

(assert (=> b!110568 (=> (not res!91267) (not e!72520))))

(assert (=> b!110568 (= res!91267 (isPrefixOf!0 (_1!4856 lt!167374) thiss!1305))))

(declare-fun lt!167384 () (_ BitVec 64))

(declare-fun lt!167381 () (_ BitVec 64))

(declare-fun b!110569 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!4078 (_ BitVec 64)) BitStream!4078)

(assert (=> b!110569 (= e!72520 (= (_1!4856 lt!167374) (withMovedBitIndex!0 (_2!4856 lt!167374) (bvsub lt!167381 lt!167384))))))

(assert (=> b!110569 (or (= (bvand lt!167381 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!167384 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!167381 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!167381 lt!167384) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!110569 (= lt!167384 (bitIndex!0 (size!2302 (buf!2696 thiss!1305)) (currentByte!5250 thiss!1305) (currentBit!5245 thiss!1305)))))

(assert (=> b!110569 (= lt!167381 (bitIndex!0 (size!2302 (buf!2696 thiss!1305)) (currentByte!5250 thiss!1305) (currentBit!5245 thiss!1305)))))

(declare-fun b!110570 () Bool)

(declare-fun Unit!6776 () Unit!6769)

(assert (=> b!110570 (= e!72521 Unit!6776)))

(declare-fun b!110571 () Bool)

(declare-fun res!91266 () Bool)

(assert (=> b!110571 (=> (not res!91266) (not e!72520))))

(assert (=> b!110571 (= res!91266 (isPrefixOf!0 (_2!4856 lt!167374) thiss!1305))))

(declare-fun b!110572 () Bool)

(declare-fun lt!167386 () Unit!6769)

(assert (=> b!110572 (= e!72521 lt!167386)))

(declare-fun lt!167380 () (_ BitVec 64))

(assert (=> b!110572 (= lt!167380 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!167385 () (_ BitVec 64))

(assert (=> b!110572 (= lt!167385 (bitIndex!0 (size!2302 (buf!2696 thiss!1305)) (currentByte!5250 thiss!1305) (currentBit!5245 thiss!1305)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!5060 array!5060 (_ BitVec 64) (_ BitVec 64)) Unit!6769)

(assert (=> b!110572 (= lt!167386 (arrayBitRangesEqSymmetric!0 (buf!2696 thiss!1305) (buf!2696 thiss!1305) lt!167380 lt!167385))))

(declare-fun arrayBitRangesEq!0 (array!5060 array!5060 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!110572 (arrayBitRangesEq!0 (buf!2696 thiss!1305) (buf!2696 thiss!1305) lt!167380 lt!167385)))

(assert (= (and d!34772 c!6728) b!110572))

(assert (= (and d!34772 (not c!6728)) b!110570))

(assert (= (and d!34772 res!91265) b!110568))

(assert (= (and b!110568 res!91267) b!110571))

(assert (= (and b!110571 res!91266) b!110569))

(declare-fun m!164167 () Bool)

(assert (=> b!110571 m!164167))

(assert (=> b!110572 m!164065))

(declare-fun m!164169 () Bool)

(assert (=> b!110572 m!164169))

(declare-fun m!164173 () Bool)

(assert (=> b!110572 m!164173))

(assert (=> d!34772 m!164069))

(declare-fun m!164175 () Bool)

(assert (=> d!34772 m!164175))

(declare-fun m!164177 () Bool)

(assert (=> d!34772 m!164177))

(assert (=> d!34772 m!164069))

(declare-fun m!164179 () Bool)

(assert (=> d!34772 m!164179))

(assert (=> d!34772 m!164179))

(assert (=> d!34772 m!164067))

(assert (=> d!34772 m!164067))

(declare-fun m!164181 () Bool)

(assert (=> d!34772 m!164181))

(declare-fun m!164183 () Bool)

(assert (=> d!34772 m!164183))

(assert (=> d!34772 m!164067))

(declare-fun m!164185 () Bool)

(assert (=> b!110568 m!164185))

(declare-fun m!164187 () Bool)

(assert (=> b!110569 m!164187))

(assert (=> b!110569 m!164065))

(assert (=> b!110569 m!164065))

(assert (=> b!110487 d!34772))

(declare-fun d!34784 () Bool)

(assert (=> d!34784 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!110486 d!34784))

(declare-fun d!34788 () Bool)

(assert (=> d!34788 (= (array_inv!2104 (buf!2696 thiss!1305)) (bvsge (size!2302 (buf!2696 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!110490 d!34788))

(declare-fun d!34792 () Bool)

(declare-fun e!72530 () Bool)

(assert (=> d!34792 e!72530))

(declare-fun res!91285 () Bool)

(assert (=> d!34792 (=> (not res!91285) (not e!72530))))

(declare-fun lt!167442 () (_ BitVec 64))

(declare-fun lt!167446 () (_ BitVec 64))

(declare-fun lt!167447 () (_ BitVec 64))

(assert (=> d!34792 (= res!91285 (= lt!167447 (bvsub lt!167442 lt!167446)))))

(assert (=> d!34792 (or (= (bvand lt!167442 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!167446 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!167442 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!167442 lt!167446) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!34792 (= lt!167446 (remainingBits!0 ((_ sign_extend 32) (size!2302 (buf!2696 thiss!1305))) ((_ sign_extend 32) (currentByte!5250 thiss!1305)) ((_ sign_extend 32) (currentBit!5245 thiss!1305))))))

(declare-fun lt!167443 () (_ BitVec 64))

(declare-fun lt!167445 () (_ BitVec 64))

(assert (=> d!34792 (= lt!167442 (bvmul lt!167443 lt!167445))))

(assert (=> d!34792 (or (= lt!167443 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!167445 (bvsdiv (bvmul lt!167443 lt!167445) lt!167443)))))

(assert (=> d!34792 (= lt!167445 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!34792 (= lt!167443 ((_ sign_extend 32) (size!2302 (buf!2696 thiss!1305))))))

(assert (=> d!34792 (= lt!167447 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5250 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5245 thiss!1305))))))

(assert (=> d!34792 (invariant!0 (currentBit!5245 thiss!1305) (currentByte!5250 thiss!1305) (size!2302 (buf!2696 thiss!1305)))))

(assert (=> d!34792 (= (bitIndex!0 (size!2302 (buf!2696 thiss!1305)) (currentByte!5250 thiss!1305) (currentBit!5245 thiss!1305)) lt!167447)))

(declare-fun b!110589 () Bool)

(declare-fun res!91284 () Bool)

(assert (=> b!110589 (=> (not res!91284) (not e!72530))))

(assert (=> b!110589 (= res!91284 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!167447))))

(declare-fun b!110590 () Bool)

(declare-fun lt!167444 () (_ BitVec 64))

(assert (=> b!110590 (= e!72530 (bvsle lt!167447 (bvmul lt!167444 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!110590 (or (= lt!167444 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!167444 #b0000000000000000000000000000000000000000000000000000000000001000) lt!167444)))))

(assert (=> b!110590 (= lt!167444 ((_ sign_extend 32) (size!2302 (buf!2696 thiss!1305))))))

(assert (= (and d!34792 res!91285) b!110589))

(assert (= (and b!110589 res!91284) b!110590))

(declare-fun m!164193 () Bool)

(assert (=> d!34792 m!164193))

(assert (=> d!34792 m!164115))

(assert (=> b!110488 d!34792))

(declare-fun d!34798 () Bool)

(declare-fun res!91311 () Bool)

(declare-fun e!72547 () Bool)

(assert (=> d!34798 (=> (not res!91311) (not e!72547))))

(assert (=> d!34798 (= res!91311 (= (size!2302 (buf!2696 thiss!1305)) (size!2302 (buf!2696 thiss!1305))))))

(assert (=> d!34798 (= (isPrefixOf!0 thiss!1305 thiss!1305) e!72547)))

(declare-fun b!110615 () Bool)

(declare-fun res!91310 () Bool)

(assert (=> b!110615 (=> (not res!91310) (not e!72547))))

(assert (=> b!110615 (= res!91310 (bvsle (bitIndex!0 (size!2302 (buf!2696 thiss!1305)) (currentByte!5250 thiss!1305) (currentBit!5245 thiss!1305)) (bitIndex!0 (size!2302 (buf!2696 thiss!1305)) (currentByte!5250 thiss!1305) (currentBit!5245 thiss!1305))))))

(declare-fun b!110616 () Bool)

(declare-fun e!72548 () Bool)

(assert (=> b!110616 (= e!72547 e!72548)))

(declare-fun res!91312 () Bool)

(assert (=> b!110616 (=> res!91312 e!72548)))

(assert (=> b!110616 (= res!91312 (= (size!2302 (buf!2696 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!110617 () Bool)

(assert (=> b!110617 (= e!72548 (arrayBitRangesEq!0 (buf!2696 thiss!1305) (buf!2696 thiss!1305) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2302 (buf!2696 thiss!1305)) (currentByte!5250 thiss!1305) (currentBit!5245 thiss!1305))))))

(assert (= (and d!34798 res!91311) b!110615))

(assert (= (and b!110615 res!91310) b!110616))

(assert (= (and b!110616 (not res!91312)) b!110617))

(assert (=> b!110615 m!164065))

(assert (=> b!110615 m!164065))

(assert (=> b!110617 m!164065))

(assert (=> b!110617 m!164065))

(declare-fun m!164199 () Bool)

(assert (=> b!110617 m!164199))

(assert (=> b!110488 d!34798))

(declare-fun d!34804 () Bool)

(assert (=> d!34804 (isPrefixOf!0 thiss!1305 thiss!1305)))

(declare-fun lt!167456 () Unit!6769)

(declare-fun choose!11 (BitStream!4078) Unit!6769)

(assert (=> d!34804 (= lt!167456 (choose!11 thiss!1305))))

(assert (=> d!34804 (= (lemmaIsPrefixRefl!0 thiss!1305) lt!167456)))

(declare-fun bs!8529 () Bool)

(assert (= bs!8529 d!34804))

(assert (=> bs!8529 m!164067))

(declare-fun m!164205 () Bool)

(assert (=> bs!8529 m!164205))

(assert (=> b!110488 d!34804))

(declare-fun d!34808 () Bool)

(assert (=> d!34808 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2302 (buf!2696 thiss!1305))) ((_ sign_extend 32) (currentByte!5250 thiss!1305)) ((_ sign_extend 32) (currentBit!5245 thiss!1305)) lt!167171) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2302 (buf!2696 thiss!1305))) ((_ sign_extend 32) (currentByte!5250 thiss!1305)) ((_ sign_extend 32) (currentBit!5245 thiss!1305))) lt!167171))))

(declare-fun bs!8530 () Bool)

(assert (= bs!8530 d!34808))

(assert (=> bs!8530 m!164193))

(assert (=> b!110489 d!34808))

(push 1)

(assert (not d!34808))

(assert (not d!34764))

(assert (not d!34804))

(assert (not b!110615))

(assert (not d!34766))

(assert (not d!34772))

(assert (not d!34760))

(assert (not b!110568))

(assert (not b!110569))

(assert (not d!34792))

(assert (not b!110617))

(assert (not b!110571))

(assert (not b!110572))

(check-sat)

(pop 1)

(push 1)

(check-sat)

