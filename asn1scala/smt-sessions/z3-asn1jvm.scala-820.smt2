; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24184 () Bool)

(assert start!24184)

(declare-fun b!122784 () Bool)

(declare-fun res!101788 () Bool)

(declare-fun e!80495 () Bool)

(assert (=> b!122784 (=> (not res!101788) (not e!80495))))

(declare-datatypes ((array!5434 0))(
  ( (array!5435 (arr!3052 (Array (_ BitVec 32) (_ BitVec 8))) (size!2459 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4392 0))(
  ( (BitStream!4393 (buf!2899 array!5434) (currentByte!5596 (_ BitVec 32)) (currentBit!5591 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4392)

(declare-datatypes ((Unit!7557 0))(
  ( (Unit!7558) )
))
(declare-datatypes ((tuple2!10392 0))(
  ( (tuple2!10393 (_1!5461 Unit!7557) (_2!5461 BitStream!4392)) )
))
(declare-fun lt!193323 () tuple2!10392)

(declare-fun isPrefixOf!0 (BitStream!4392 BitStream!4392) Bool)

(assert (=> b!122784 (= res!101788 (isPrefixOf!0 thiss!1305 (_2!5461 lt!193323)))))

(declare-fun b!122785 () Bool)

(declare-fun e!80496 () Bool)

(declare-fun e!80503 () Bool)

(assert (=> b!122785 (= e!80496 e!80503)))

(declare-fun res!101786 () Bool)

(assert (=> b!122785 (=> (not res!101786) (not e!80503))))

(declare-fun lt!193313 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!122785 (= res!101786 (validate_offset_bits!1 ((_ sign_extend 32) (size!2459 (buf!2899 thiss!1305))) ((_ sign_extend 32) (currentByte!5596 thiss!1305)) ((_ sign_extend 32) (currentBit!5591 thiss!1305)) lt!193313))))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!122785 (= lt!193313 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!122786 () Bool)

(declare-fun res!101784 () Bool)

(declare-fun e!80501 () Bool)

(assert (=> b!122786 (=> (not res!101784) (not e!80501))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!122786 (= res!101784 (invariant!0 (currentBit!5591 thiss!1305) (currentByte!5596 thiss!1305) (size!2459 (buf!2899 (_2!5461 lt!193323)))))))

(declare-fun b!122787 () Bool)

(declare-fun res!101789 () Bool)

(assert (=> b!122787 (=> (not res!101789) (not e!80503))))

(assert (=> b!122787 (= res!101789 (bvslt i!615 nBits!396))))

(declare-fun b!122788 () Bool)

(declare-fun e!80504 () Bool)

(assert (=> b!122788 (= e!80503 (not e!80504))))

(declare-fun res!101783 () Bool)

(assert (=> b!122788 (=> res!101783 e!80504)))

(declare-datatypes ((tuple2!10394 0))(
  ( (tuple2!10395 (_1!5462 BitStream!4392) (_2!5462 (_ BitVec 64))) )
))
(declare-fun lt!193299 () tuple2!10394)

(declare-datatypes ((tuple2!10396 0))(
  ( (tuple2!10397 (_1!5463 BitStream!4392) (_2!5463 BitStream!4392)) )
))
(declare-fun lt!193304 () tuple2!10396)

(assert (=> b!122788 (= res!101783 (not (= (_1!5462 lt!193299) (_2!5463 lt!193304))))))

(declare-fun lt!193302 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4392 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!10394)

(assert (=> b!122788 (= lt!193299 (readNLeastSignificantBitsLoopPure!0 (_1!5463 lt!193304) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!193302))))

(declare-fun lt!193308 () tuple2!10392)

(declare-fun lt!193319 () (_ BitVec 64))

(assert (=> b!122788 (validate_offset_bits!1 ((_ sign_extend 32) (size!2459 (buf!2899 (_2!5461 lt!193308)))) ((_ sign_extend 32) (currentByte!5596 (_2!5461 lt!193323))) ((_ sign_extend 32) (currentBit!5591 (_2!5461 lt!193323))) lt!193319)))

(declare-fun lt!193306 () Unit!7557)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4392 array!5434 (_ BitVec 64)) Unit!7557)

(assert (=> b!122788 (= lt!193306 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5461 lt!193323) (buf!2899 (_2!5461 lt!193308)) lt!193319))))

(assert (=> b!122788 (= lt!193319 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!10398 0))(
  ( (tuple2!10399 (_1!5464 BitStream!4392) (_2!5464 Bool)) )
))
(declare-fun lt!193315 () tuple2!10398)

(declare-fun lt!193303 () (_ BitVec 64))

(declare-fun lt!193309 () (_ BitVec 64))

(assert (=> b!122788 (= lt!193302 (bvor lt!193309 (ite (_2!5464 lt!193315) lt!193303 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!193305 () tuple2!10396)

(declare-fun lt!193317 () tuple2!10394)

(assert (=> b!122788 (= lt!193317 (readNLeastSignificantBitsLoopPure!0 (_1!5463 lt!193305) nBits!396 i!615 lt!193309))))

(assert (=> b!122788 (validate_offset_bits!1 ((_ sign_extend 32) (size!2459 (buf!2899 (_2!5461 lt!193308)))) ((_ sign_extend 32) (currentByte!5596 thiss!1305)) ((_ sign_extend 32) (currentBit!5591 thiss!1305)) lt!193313)))

(declare-fun lt!193310 () Unit!7557)

(assert (=> b!122788 (= lt!193310 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2899 (_2!5461 lt!193308)) lt!193313))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!122788 (= lt!193309 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(declare-fun lt!193298 () Bool)

(assert (=> b!122788 (= (_2!5464 lt!193315) lt!193298)))

(declare-fun readBitPure!0 (BitStream!4392) tuple2!10398)

(assert (=> b!122788 (= lt!193315 (readBitPure!0 (_1!5463 lt!193305)))))

(declare-fun reader!0 (BitStream!4392 BitStream!4392) tuple2!10396)

(assert (=> b!122788 (= lt!193304 (reader!0 (_2!5461 lt!193323) (_2!5461 lt!193308)))))

(assert (=> b!122788 (= lt!193305 (reader!0 thiss!1305 (_2!5461 lt!193308)))))

(declare-fun e!80502 () Bool)

(assert (=> b!122788 e!80502))

(declare-fun res!101785 () Bool)

(assert (=> b!122788 (=> (not res!101785) (not e!80502))))

(declare-fun lt!193301 () tuple2!10398)

(declare-fun lt!193297 () tuple2!10398)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!122788 (= res!101785 (= (bitIndex!0 (size!2459 (buf!2899 (_1!5464 lt!193301))) (currentByte!5596 (_1!5464 lt!193301)) (currentBit!5591 (_1!5464 lt!193301))) (bitIndex!0 (size!2459 (buf!2899 (_1!5464 lt!193297))) (currentByte!5596 (_1!5464 lt!193297)) (currentBit!5591 (_1!5464 lt!193297)))))))

(declare-fun lt!193318 () Unit!7557)

(declare-fun lt!193300 () BitStream!4392)

(declare-fun readBitPrefixLemma!0 (BitStream!4392 BitStream!4392) Unit!7557)

(assert (=> b!122788 (= lt!193318 (readBitPrefixLemma!0 lt!193300 (_2!5461 lt!193308)))))

(assert (=> b!122788 (= lt!193297 (readBitPure!0 (BitStream!4393 (buf!2899 (_2!5461 lt!193308)) (currentByte!5596 thiss!1305) (currentBit!5591 thiss!1305))))))

(assert (=> b!122788 (= lt!193301 (readBitPure!0 lt!193300))))

(assert (=> b!122788 (= lt!193300 (BitStream!4393 (buf!2899 (_2!5461 lt!193323)) (currentByte!5596 thiss!1305) (currentBit!5591 thiss!1305)))))

(assert (=> b!122788 e!80501))

(declare-fun res!101793 () Bool)

(assert (=> b!122788 (=> (not res!101793) (not e!80501))))

(assert (=> b!122788 (= res!101793 (isPrefixOf!0 thiss!1305 (_2!5461 lt!193308)))))

(declare-fun lt!193321 () Unit!7557)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4392 BitStream!4392 BitStream!4392) Unit!7557)

(assert (=> b!122788 (= lt!193321 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5461 lt!193323) (_2!5461 lt!193308)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4392 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!10392)

(assert (=> b!122788 (= lt!193308 (appendNLeastSignificantBitsLoop!0 (_2!5461 lt!193323) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!80497 () Bool)

(assert (=> b!122788 e!80497))

(declare-fun res!101781 () Bool)

(assert (=> b!122788 (=> (not res!101781) (not e!80497))))

(assert (=> b!122788 (= res!101781 (= (size!2459 (buf!2899 thiss!1305)) (size!2459 (buf!2899 (_2!5461 lt!193323)))))))

(declare-fun appendBit!0 (BitStream!4392 Bool) tuple2!10392)

(assert (=> b!122788 (= lt!193323 (appendBit!0 thiss!1305 lt!193298))))

(assert (=> b!122788 (= lt!193298 (not (= (bvand v!199 lt!193303) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!122788 (= lt!193303 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun lt!193295 () BitStream!4392)

(declare-fun e!80498 () Bool)

(declare-fun lt!193314 () (_ BitVec 64))

(declare-fun lt!193312 () (_ BitVec 64))

(declare-fun b!122789 () Bool)

(assert (=> b!122789 (= e!80498 (and (= lt!193314 (bvsub lt!193312 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!5463 lt!193304) lt!193295)) (and (= (_2!5462 lt!193317) (_2!5462 lt!193299)) (= (_1!5462 lt!193317) (_2!5463 lt!193305))))))))

(declare-fun res!101792 () Bool)

(assert (=> start!24184 (=> (not res!101792) (not e!80496))))

(assert (=> start!24184 (= res!101792 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!24184 e!80496))

(assert (=> start!24184 true))

(declare-fun e!80499 () Bool)

(declare-fun inv!12 (BitStream!4392) Bool)

(assert (=> start!24184 (and (inv!12 thiss!1305) e!80499)))

(declare-fun b!122790 () Bool)

(declare-fun array_inv!2261 (array!5434) Bool)

(assert (=> b!122790 (= e!80499 (array_inv!2261 (buf!2899 thiss!1305)))))

(declare-fun b!122791 () Bool)

(declare-fun e!80500 () Bool)

(assert (=> b!122791 (= e!80495 e!80500)))

(declare-fun res!101791 () Bool)

(assert (=> b!122791 (=> (not res!101791) (not e!80500))))

(declare-fun lt!193296 () tuple2!10398)

(assert (=> b!122791 (= res!101791 (and (= (_2!5464 lt!193296) lt!193298) (= (_1!5464 lt!193296) (_2!5461 lt!193323))))))

(declare-fun readerFrom!0 (BitStream!4392 (_ BitVec 32) (_ BitVec 32)) BitStream!4392)

(assert (=> b!122791 (= lt!193296 (readBitPure!0 (readerFrom!0 (_2!5461 lt!193323) (currentBit!5591 thiss!1305) (currentByte!5596 thiss!1305))))))

(declare-fun b!122792 () Bool)

(assert (=> b!122792 (= e!80502 (= (_2!5464 lt!193301) (_2!5464 lt!193297)))))

(declare-fun b!122793 () Bool)

(assert (=> b!122793 (= e!80497 e!80495)))

(declare-fun res!101787 () Bool)

(assert (=> b!122793 (=> (not res!101787) (not e!80495))))

(declare-fun lt!193311 () (_ BitVec 64))

(declare-fun lt!193307 () (_ BitVec 64))

(assert (=> b!122793 (= res!101787 (= lt!193311 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!193307)))))

(assert (=> b!122793 (= lt!193311 (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193323))) (currentByte!5596 (_2!5461 lt!193323)) (currentBit!5591 (_2!5461 lt!193323))))))

(assert (=> b!122793 (= lt!193307 (bitIndex!0 (size!2459 (buf!2899 thiss!1305)) (currentByte!5596 thiss!1305) (currentBit!5591 thiss!1305)))))

(declare-fun b!122794 () Bool)

(assert (=> b!122794 (= e!80501 (invariant!0 (currentBit!5591 thiss!1305) (currentByte!5596 thiss!1305) (size!2459 (buf!2899 (_2!5461 lt!193308)))))))

(declare-fun b!122795 () Bool)

(assert (=> b!122795 (= e!80500 (= (bitIndex!0 (size!2459 (buf!2899 (_1!5464 lt!193296))) (currentByte!5596 (_1!5464 lt!193296)) (currentBit!5591 (_1!5464 lt!193296))) lt!193311))))

(declare-fun b!122796 () Bool)

(declare-fun lt!193316 () (_ BitVec 64))

(assert (=> b!122796 (= e!80504 (or (not (= (_1!5463 lt!193304) lt!193295)) (and (= (size!2459 (buf!2899 thiss!1305)) (size!2459 (buf!2899 (_2!5461 lt!193308)))) (= lt!193316 (bvadd lt!193314 lt!193313)) (= (_2!5462 lt!193317) v!199))))))

(assert (=> b!122796 e!80498))

(declare-fun res!101790 () Bool)

(assert (=> b!122796 (=> (not res!101790) (not e!80498))))

(declare-fun withMovedBitIndex!0 (BitStream!4392 (_ BitVec 64)) BitStream!4392)

(assert (=> b!122796 (= res!101790 (= (_1!5463 lt!193304) (withMovedBitIndex!0 (_2!5463 lt!193304) (bvsub lt!193312 lt!193316))))))

(assert (=> b!122796 (= lt!193312 (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193323))) (currentByte!5596 (_2!5461 lt!193323)) (currentBit!5591 (_2!5461 lt!193323))))))

(assert (=> b!122796 (= (_1!5463 lt!193305) (withMovedBitIndex!0 (_2!5463 lt!193305) (bvsub lt!193314 lt!193316)))))

(assert (=> b!122796 (= lt!193316 (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193308))) (currentByte!5596 (_2!5461 lt!193308)) (currentBit!5591 (_2!5461 lt!193308))))))

(assert (=> b!122796 (= lt!193314 (bitIndex!0 (size!2459 (buf!2899 thiss!1305)) (currentByte!5596 thiss!1305) (currentBit!5591 thiss!1305)))))

(declare-fun lt!193322 () tuple2!10394)

(assert (=> b!122796 (and (= (_2!5462 lt!193317) (_2!5462 lt!193322)) (= (_1!5462 lt!193317) (_1!5462 lt!193322)))))

(declare-fun lt!193320 () Unit!7557)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4392 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!7557)

(assert (=> b!122796 (= lt!193320 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5463 lt!193305) nBits!396 i!615 lt!193309))))

(assert (=> b!122796 (= lt!193322 (readNLeastSignificantBitsLoopPure!0 lt!193295 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!193302))))

(assert (=> b!122796 (= lt!193295 (withMovedBitIndex!0 (_1!5463 lt!193305) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!122797 () Bool)

(declare-fun res!101782 () Bool)

(assert (=> b!122797 (=> (not res!101782) (not e!80503))))

(assert (=> b!122797 (= res!101782 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(assert (= (and start!24184 res!101792) b!122785))

(assert (= (and b!122785 res!101786) b!122797))

(assert (= (and b!122797 res!101782) b!122787))

(assert (= (and b!122787 res!101789) b!122788))

(assert (= (and b!122788 res!101781) b!122793))

(assert (= (and b!122793 res!101787) b!122784))

(assert (= (and b!122784 res!101788) b!122791))

(assert (= (and b!122791 res!101791) b!122795))

(assert (= (and b!122788 res!101793) b!122786))

(assert (= (and b!122786 res!101784) b!122794))

(assert (= (and b!122788 res!101785) b!122792))

(assert (= (and b!122788 (not res!101783)) b!122796))

(assert (= (and b!122796 res!101790) b!122789))

(assert (= start!24184 b!122790))

(declare-fun m!186565 () Bool)

(assert (=> b!122796 m!186565))

(declare-fun m!186567 () Bool)

(assert (=> b!122796 m!186567))

(declare-fun m!186569 () Bool)

(assert (=> b!122796 m!186569))

(declare-fun m!186571 () Bool)

(assert (=> b!122796 m!186571))

(declare-fun m!186573 () Bool)

(assert (=> b!122796 m!186573))

(declare-fun m!186575 () Bool)

(assert (=> b!122796 m!186575))

(declare-fun m!186577 () Bool)

(assert (=> b!122796 m!186577))

(declare-fun m!186579 () Bool)

(assert (=> b!122796 m!186579))

(declare-fun m!186581 () Bool)

(assert (=> b!122794 m!186581))

(declare-fun m!186583 () Bool)

(assert (=> b!122785 m!186583))

(declare-fun m!186585 () Bool)

(assert (=> b!122791 m!186585))

(assert (=> b!122791 m!186585))

(declare-fun m!186587 () Bool)

(assert (=> b!122791 m!186587))

(declare-fun m!186589 () Bool)

(assert (=> start!24184 m!186589))

(declare-fun m!186591 () Bool)

(assert (=> b!122795 m!186591))

(declare-fun m!186593 () Bool)

(assert (=> b!122788 m!186593))

(declare-fun m!186595 () Bool)

(assert (=> b!122788 m!186595))

(declare-fun m!186597 () Bool)

(assert (=> b!122788 m!186597))

(declare-fun m!186599 () Bool)

(assert (=> b!122788 m!186599))

(declare-fun m!186601 () Bool)

(assert (=> b!122788 m!186601))

(declare-fun m!186603 () Bool)

(assert (=> b!122788 m!186603))

(declare-fun m!186605 () Bool)

(assert (=> b!122788 m!186605))

(declare-fun m!186607 () Bool)

(assert (=> b!122788 m!186607))

(declare-fun m!186609 () Bool)

(assert (=> b!122788 m!186609))

(declare-fun m!186611 () Bool)

(assert (=> b!122788 m!186611))

(declare-fun m!186613 () Bool)

(assert (=> b!122788 m!186613))

(declare-fun m!186615 () Bool)

(assert (=> b!122788 m!186615))

(declare-fun m!186617 () Bool)

(assert (=> b!122788 m!186617))

(declare-fun m!186619 () Bool)

(assert (=> b!122788 m!186619))

(declare-fun m!186621 () Bool)

(assert (=> b!122788 m!186621))

(declare-fun m!186623 () Bool)

(assert (=> b!122788 m!186623))

(declare-fun m!186625 () Bool)

(assert (=> b!122788 m!186625))

(declare-fun m!186627 () Bool)

(assert (=> b!122788 m!186627))

(declare-fun m!186629 () Bool)

(assert (=> b!122788 m!186629))

(declare-fun m!186631 () Bool)

(assert (=> b!122786 m!186631))

(declare-fun m!186633 () Bool)

(assert (=> b!122784 m!186633))

(declare-fun m!186635 () Bool)

(assert (=> b!122790 m!186635))

(declare-fun m!186637 () Bool)

(assert (=> b!122797 m!186637))

(assert (=> b!122793 m!186565))

(assert (=> b!122793 m!186569))

(check-sat (not b!122785) (not start!24184) (not b!122786) (not b!122784) (not b!122796) (not b!122795) (not b!122790) (not b!122788) (not b!122791) (not b!122797) (not b!122793) (not b!122794))
(check-sat)
(get-model)

(declare-fun d!39462 () Bool)

(declare-fun e!80541 () Bool)

(assert (=> d!39462 e!80541))

(declare-fun res!101838 () Bool)

(assert (=> d!39462 (=> (not res!101838) (not e!80541))))

(declare-fun lt!193427 () (_ BitVec 64))

(declare-fun lt!193426 () (_ BitVec 64))

(declare-fun lt!193423 () (_ BitVec 64))

(assert (=> d!39462 (= res!101838 (= lt!193423 (bvsub lt!193427 lt!193426)))))

(assert (=> d!39462 (or (= (bvand lt!193427 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!193426 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!193427 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!193427 lt!193426) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!39462 (= lt!193426 (remainingBits!0 ((_ sign_extend 32) (size!2459 (buf!2899 (_2!5461 lt!193323)))) ((_ sign_extend 32) (currentByte!5596 (_2!5461 lt!193323))) ((_ sign_extend 32) (currentBit!5591 (_2!5461 lt!193323)))))))

(declare-fun lt!193428 () (_ BitVec 64))

(declare-fun lt!193425 () (_ BitVec 64))

(assert (=> d!39462 (= lt!193427 (bvmul lt!193428 lt!193425))))

(assert (=> d!39462 (or (= lt!193428 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!193425 (bvsdiv (bvmul lt!193428 lt!193425) lt!193428)))))

(assert (=> d!39462 (= lt!193425 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!39462 (= lt!193428 ((_ sign_extend 32) (size!2459 (buf!2899 (_2!5461 lt!193323)))))))

(assert (=> d!39462 (= lt!193423 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5596 (_2!5461 lt!193323))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5591 (_2!5461 lt!193323)))))))

(assert (=> d!39462 (invariant!0 (currentBit!5591 (_2!5461 lt!193323)) (currentByte!5596 (_2!5461 lt!193323)) (size!2459 (buf!2899 (_2!5461 lt!193323))))))

(assert (=> d!39462 (= (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193323))) (currentByte!5596 (_2!5461 lt!193323)) (currentBit!5591 (_2!5461 lt!193323))) lt!193423)))

(declare-fun b!122844 () Bool)

(declare-fun res!101837 () Bool)

(assert (=> b!122844 (=> (not res!101837) (not e!80541))))

(assert (=> b!122844 (= res!101837 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!193423))))

(declare-fun b!122845 () Bool)

(declare-fun lt!193424 () (_ BitVec 64))

(assert (=> b!122845 (= e!80541 (bvsle lt!193423 (bvmul lt!193424 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!122845 (or (= lt!193424 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!193424 #b0000000000000000000000000000000000000000000000000000000000001000) lt!193424)))))

(assert (=> b!122845 (= lt!193424 ((_ sign_extend 32) (size!2459 (buf!2899 (_2!5461 lt!193323)))))))

(assert (= (and d!39462 res!101838) b!122844))

(assert (= (and b!122844 res!101837) b!122845))

(declare-fun m!186713 () Bool)

(assert (=> d!39462 m!186713))

(declare-fun m!186715 () Bool)

(assert (=> d!39462 m!186715))

(assert (=> b!122793 d!39462))

(declare-fun d!39464 () Bool)

(declare-fun e!80542 () Bool)

(assert (=> d!39464 e!80542))

(declare-fun res!101840 () Bool)

(assert (=> d!39464 (=> (not res!101840) (not e!80542))))

(declare-fun lt!193429 () (_ BitVec 64))

(declare-fun lt!193433 () (_ BitVec 64))

(declare-fun lt!193432 () (_ BitVec 64))

(assert (=> d!39464 (= res!101840 (= lt!193429 (bvsub lt!193433 lt!193432)))))

(assert (=> d!39464 (or (= (bvand lt!193433 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!193432 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!193433 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!193433 lt!193432) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39464 (= lt!193432 (remainingBits!0 ((_ sign_extend 32) (size!2459 (buf!2899 thiss!1305))) ((_ sign_extend 32) (currentByte!5596 thiss!1305)) ((_ sign_extend 32) (currentBit!5591 thiss!1305))))))

(declare-fun lt!193434 () (_ BitVec 64))

(declare-fun lt!193431 () (_ BitVec 64))

(assert (=> d!39464 (= lt!193433 (bvmul lt!193434 lt!193431))))

(assert (=> d!39464 (or (= lt!193434 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!193431 (bvsdiv (bvmul lt!193434 lt!193431) lt!193434)))))

(assert (=> d!39464 (= lt!193431 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!39464 (= lt!193434 ((_ sign_extend 32) (size!2459 (buf!2899 thiss!1305))))))

(assert (=> d!39464 (= lt!193429 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5596 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5591 thiss!1305))))))

(assert (=> d!39464 (invariant!0 (currentBit!5591 thiss!1305) (currentByte!5596 thiss!1305) (size!2459 (buf!2899 thiss!1305)))))

(assert (=> d!39464 (= (bitIndex!0 (size!2459 (buf!2899 thiss!1305)) (currentByte!5596 thiss!1305) (currentBit!5591 thiss!1305)) lt!193429)))

(declare-fun b!122846 () Bool)

(declare-fun res!101839 () Bool)

(assert (=> b!122846 (=> (not res!101839) (not e!80542))))

(assert (=> b!122846 (= res!101839 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!193429))))

(declare-fun b!122847 () Bool)

(declare-fun lt!193430 () (_ BitVec 64))

(assert (=> b!122847 (= e!80542 (bvsle lt!193429 (bvmul lt!193430 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!122847 (or (= lt!193430 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!193430 #b0000000000000000000000000000000000000000000000000000000000001000) lt!193430)))))

(assert (=> b!122847 (= lt!193430 ((_ sign_extend 32) (size!2459 (buf!2899 thiss!1305))))))

(assert (= (and d!39464 res!101840) b!122846))

(assert (= (and b!122846 res!101839) b!122847))

(declare-fun m!186717 () Bool)

(assert (=> d!39464 m!186717))

(declare-fun m!186719 () Bool)

(assert (=> d!39464 m!186719))

(assert (=> b!122793 d!39464))

(declare-fun d!39466 () Bool)

(declare-fun res!101849 () Bool)

(declare-fun e!80548 () Bool)

(assert (=> d!39466 (=> (not res!101849) (not e!80548))))

(assert (=> d!39466 (= res!101849 (= (size!2459 (buf!2899 thiss!1305)) (size!2459 (buf!2899 (_2!5461 lt!193323)))))))

(assert (=> d!39466 (= (isPrefixOf!0 thiss!1305 (_2!5461 lt!193323)) e!80548)))

(declare-fun b!122854 () Bool)

(declare-fun res!101847 () Bool)

(assert (=> b!122854 (=> (not res!101847) (not e!80548))))

(assert (=> b!122854 (= res!101847 (bvsle (bitIndex!0 (size!2459 (buf!2899 thiss!1305)) (currentByte!5596 thiss!1305) (currentBit!5591 thiss!1305)) (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193323))) (currentByte!5596 (_2!5461 lt!193323)) (currentBit!5591 (_2!5461 lt!193323)))))))

(declare-fun b!122855 () Bool)

(declare-fun e!80547 () Bool)

(assert (=> b!122855 (= e!80548 e!80547)))

(declare-fun res!101848 () Bool)

(assert (=> b!122855 (=> res!101848 e!80547)))

(assert (=> b!122855 (= res!101848 (= (size!2459 (buf!2899 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!122856 () Bool)

(declare-fun arrayBitRangesEq!0 (array!5434 array!5434 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!122856 (= e!80547 (arrayBitRangesEq!0 (buf!2899 thiss!1305) (buf!2899 (_2!5461 lt!193323)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2459 (buf!2899 thiss!1305)) (currentByte!5596 thiss!1305) (currentBit!5591 thiss!1305))))))

(assert (= (and d!39466 res!101849) b!122854))

(assert (= (and b!122854 res!101847) b!122855))

(assert (= (and b!122855 (not res!101848)) b!122856))

(assert (=> b!122854 m!186569))

(assert (=> b!122854 m!186565))

(assert (=> b!122856 m!186569))

(assert (=> b!122856 m!186569))

(declare-fun m!186721 () Bool)

(assert (=> b!122856 m!186721))

(assert (=> b!122784 d!39466))

(declare-fun d!39468 () Bool)

(assert (=> d!39468 (= (invariant!0 (currentBit!5591 thiss!1305) (currentByte!5596 thiss!1305) (size!2459 (buf!2899 (_2!5461 lt!193308)))) (and (bvsge (currentBit!5591 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5591 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5596 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5596 thiss!1305) (size!2459 (buf!2899 (_2!5461 lt!193308)))) (and (= (currentBit!5591 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5596 thiss!1305) (size!2459 (buf!2899 (_2!5461 lt!193308))))))))))

(assert (=> b!122794 d!39468))

(declare-fun d!39470 () Bool)

(assert (=> d!39470 (= (array_inv!2261 (buf!2899 thiss!1305)) (bvsge (size!2459 (buf!2899 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!122790 d!39470))

(declare-fun d!39472 () Bool)

(declare-datatypes ((tuple2!10408 0))(
  ( (tuple2!10409 (_1!5469 Bool) (_2!5469 BitStream!4392)) )
))
(declare-fun lt!193437 () tuple2!10408)

(declare-fun readBit!0 (BitStream!4392) tuple2!10408)

(assert (=> d!39472 (= lt!193437 (readBit!0 (readerFrom!0 (_2!5461 lt!193323) (currentBit!5591 thiss!1305) (currentByte!5596 thiss!1305))))))

(assert (=> d!39472 (= (readBitPure!0 (readerFrom!0 (_2!5461 lt!193323) (currentBit!5591 thiss!1305) (currentByte!5596 thiss!1305))) (tuple2!10399 (_2!5469 lt!193437) (_1!5469 lt!193437)))))

(declare-fun bs!9557 () Bool)

(assert (= bs!9557 d!39472))

(assert (=> bs!9557 m!186585))

(declare-fun m!186723 () Bool)

(assert (=> bs!9557 m!186723))

(assert (=> b!122791 d!39472))

(declare-fun d!39474 () Bool)

(declare-fun e!80551 () Bool)

(assert (=> d!39474 e!80551))

(declare-fun res!101853 () Bool)

(assert (=> d!39474 (=> (not res!101853) (not e!80551))))

(assert (=> d!39474 (= res!101853 (invariant!0 (currentBit!5591 (_2!5461 lt!193323)) (currentByte!5596 (_2!5461 lt!193323)) (size!2459 (buf!2899 (_2!5461 lt!193323)))))))

(assert (=> d!39474 (= (readerFrom!0 (_2!5461 lt!193323) (currentBit!5591 thiss!1305) (currentByte!5596 thiss!1305)) (BitStream!4393 (buf!2899 (_2!5461 lt!193323)) (currentByte!5596 thiss!1305) (currentBit!5591 thiss!1305)))))

(declare-fun b!122859 () Bool)

(assert (=> b!122859 (= e!80551 (invariant!0 (currentBit!5591 thiss!1305) (currentByte!5596 thiss!1305) (size!2459 (buf!2899 (_2!5461 lt!193323)))))))

(assert (= (and d!39474 res!101853) b!122859))

(assert (=> d!39474 m!186715))

(assert (=> b!122859 m!186631))

(assert (=> b!122791 d!39474))

(declare-fun d!39476 () Bool)

(declare-fun e!80552 () Bool)

(assert (=> d!39476 e!80552))

(declare-fun res!101855 () Bool)

(assert (=> d!39476 (=> (not res!101855) (not e!80552))))

(declare-fun lt!193441 () (_ BitVec 64))

(declare-fun lt!193442 () (_ BitVec 64))

(declare-fun lt!193438 () (_ BitVec 64))

(assert (=> d!39476 (= res!101855 (= lt!193438 (bvsub lt!193442 lt!193441)))))

(assert (=> d!39476 (or (= (bvand lt!193442 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!193441 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!193442 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!193442 lt!193441) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39476 (= lt!193441 (remainingBits!0 ((_ sign_extend 32) (size!2459 (buf!2899 (_1!5464 lt!193301)))) ((_ sign_extend 32) (currentByte!5596 (_1!5464 lt!193301))) ((_ sign_extend 32) (currentBit!5591 (_1!5464 lt!193301)))))))

(declare-fun lt!193443 () (_ BitVec 64))

(declare-fun lt!193440 () (_ BitVec 64))

(assert (=> d!39476 (= lt!193442 (bvmul lt!193443 lt!193440))))

(assert (=> d!39476 (or (= lt!193443 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!193440 (bvsdiv (bvmul lt!193443 lt!193440) lt!193443)))))

(assert (=> d!39476 (= lt!193440 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!39476 (= lt!193443 ((_ sign_extend 32) (size!2459 (buf!2899 (_1!5464 lt!193301)))))))

(assert (=> d!39476 (= lt!193438 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5596 (_1!5464 lt!193301))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5591 (_1!5464 lt!193301)))))))

(assert (=> d!39476 (invariant!0 (currentBit!5591 (_1!5464 lt!193301)) (currentByte!5596 (_1!5464 lt!193301)) (size!2459 (buf!2899 (_1!5464 lt!193301))))))

(assert (=> d!39476 (= (bitIndex!0 (size!2459 (buf!2899 (_1!5464 lt!193301))) (currentByte!5596 (_1!5464 lt!193301)) (currentBit!5591 (_1!5464 lt!193301))) lt!193438)))

(declare-fun b!122860 () Bool)

(declare-fun res!101854 () Bool)

(assert (=> b!122860 (=> (not res!101854) (not e!80552))))

(assert (=> b!122860 (= res!101854 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!193438))))

(declare-fun b!122861 () Bool)

(declare-fun lt!193439 () (_ BitVec 64))

(assert (=> b!122861 (= e!80552 (bvsle lt!193438 (bvmul lt!193439 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!122861 (or (= lt!193439 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!193439 #b0000000000000000000000000000000000000000000000000000000000001000) lt!193439)))))

(assert (=> b!122861 (= lt!193439 ((_ sign_extend 32) (size!2459 (buf!2899 (_1!5464 lt!193301)))))))

(assert (= (and d!39476 res!101855) b!122860))

(assert (= (and b!122860 res!101854) b!122861))

(declare-fun m!186725 () Bool)

(assert (=> d!39476 m!186725))

(declare-fun m!186727 () Bool)

(assert (=> d!39476 m!186727))

(assert (=> b!122788 d!39476))

(declare-fun d!39478 () Bool)

(declare-fun lt!193444 () tuple2!10408)

(assert (=> d!39478 (= lt!193444 (readBit!0 lt!193300))))

(assert (=> d!39478 (= (readBitPure!0 lt!193300) (tuple2!10399 (_2!5469 lt!193444) (_1!5469 lt!193444)))))

(declare-fun bs!9558 () Bool)

(assert (= bs!9558 d!39478))

(declare-fun m!186729 () Bool)

(assert (=> bs!9558 m!186729))

(assert (=> b!122788 d!39478))

(declare-fun d!39480 () Bool)

(assert (=> d!39480 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2459 (buf!2899 (_2!5461 lt!193308)))) ((_ sign_extend 32) (currentByte!5596 (_2!5461 lt!193323))) ((_ sign_extend 32) (currentBit!5591 (_2!5461 lt!193323))) lt!193319) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2459 (buf!2899 (_2!5461 lt!193308)))) ((_ sign_extend 32) (currentByte!5596 (_2!5461 lt!193323))) ((_ sign_extend 32) (currentBit!5591 (_2!5461 lt!193323)))) lt!193319))))

(declare-fun bs!9559 () Bool)

(assert (= bs!9559 d!39480))

(declare-fun m!186731 () Bool)

(assert (=> bs!9559 m!186731))

(assert (=> b!122788 d!39480))

(declare-fun d!39482 () Bool)

(assert (=> d!39482 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2459 (buf!2899 (_2!5461 lt!193308)))) ((_ sign_extend 32) (currentByte!5596 thiss!1305)) ((_ sign_extend 32) (currentBit!5591 thiss!1305)) lt!193313) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2459 (buf!2899 (_2!5461 lt!193308)))) ((_ sign_extend 32) (currentByte!5596 thiss!1305)) ((_ sign_extend 32) (currentBit!5591 thiss!1305))) lt!193313))))

(declare-fun bs!9560 () Bool)

(assert (= bs!9560 d!39482))

(declare-fun m!186733 () Bool)

(assert (=> bs!9560 m!186733))

(assert (=> b!122788 d!39482))

(declare-fun d!39484 () Bool)

(assert (=> d!39484 (validate_offset_bits!1 ((_ sign_extend 32) (size!2459 (buf!2899 (_2!5461 lt!193308)))) ((_ sign_extend 32) (currentByte!5596 (_2!5461 lt!193323))) ((_ sign_extend 32) (currentBit!5591 (_2!5461 lt!193323))) lt!193319)))

(declare-fun lt!193447 () Unit!7557)

(declare-fun choose!9 (BitStream!4392 array!5434 (_ BitVec 64) BitStream!4392) Unit!7557)

(assert (=> d!39484 (= lt!193447 (choose!9 (_2!5461 lt!193323) (buf!2899 (_2!5461 lt!193308)) lt!193319 (BitStream!4393 (buf!2899 (_2!5461 lt!193308)) (currentByte!5596 (_2!5461 lt!193323)) (currentBit!5591 (_2!5461 lt!193323)))))))

(assert (=> d!39484 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5461 lt!193323) (buf!2899 (_2!5461 lt!193308)) lt!193319) lt!193447)))

(declare-fun bs!9561 () Bool)

(assert (= bs!9561 d!39484))

(assert (=> bs!9561 m!186603))

(declare-fun m!186735 () Bool)

(assert (=> bs!9561 m!186735))

(assert (=> b!122788 d!39484))

(declare-fun d!39486 () Bool)

(declare-fun lt!193448 () tuple2!10408)

(assert (=> d!39486 (= lt!193448 (readBit!0 (_1!5463 lt!193305)))))

(assert (=> d!39486 (= (readBitPure!0 (_1!5463 lt!193305)) (tuple2!10399 (_2!5469 lt!193448) (_1!5469 lt!193448)))))

(declare-fun bs!9562 () Bool)

(assert (= bs!9562 d!39486))

(declare-fun m!186737 () Bool)

(assert (=> bs!9562 m!186737))

(assert (=> b!122788 d!39486))

(declare-fun b!122973 () Bool)

(declare-fun e!80620 () Bool)

(declare-fun lt!193823 () tuple2!10398)

(declare-fun lt!193831 () tuple2!10398)

(assert (=> b!122973 (= e!80620 (= (_2!5464 lt!193823) (_2!5464 lt!193831)))))

(declare-fun b!122974 () Bool)

(declare-fun e!80621 () Bool)

(declare-fun lt!193826 () tuple2!10398)

(declare-fun lt!193832 () tuple2!10392)

(assert (=> b!122974 (= e!80621 (= (bitIndex!0 (size!2459 (buf!2899 (_1!5464 lt!193826))) (currentByte!5596 (_1!5464 lt!193826)) (currentBit!5591 (_1!5464 lt!193826))) (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193832))) (currentByte!5596 (_2!5461 lt!193832)) (currentBit!5591 (_2!5461 lt!193832)))))))

(declare-fun b!122975 () Bool)

(declare-fun res!101956 () Bool)

(declare-fun e!80622 () Bool)

(assert (=> b!122975 (=> (not res!101956) (not e!80622))))

(declare-fun lt!193842 () tuple2!10392)

(assert (=> b!122975 (= res!101956 (isPrefixOf!0 (_2!5461 lt!193323) (_2!5461 lt!193842)))))

(declare-fun b!122976 () Bool)

(assert (=> b!122976 (= lt!193826 (readBitPure!0 (readerFrom!0 (_2!5461 lt!193832) (currentBit!5591 (_2!5461 lt!193323)) (currentByte!5596 (_2!5461 lt!193323)))))))

(declare-fun lt!193798 () Bool)

(declare-fun res!101955 () Bool)

(assert (=> b!122976 (= res!101955 (and (= (_2!5464 lt!193826) lt!193798) (= (_1!5464 lt!193826) (_2!5461 lt!193832))))))

(assert (=> b!122976 (=> (not res!101955) (not e!80621))))

(declare-fun e!80623 () Bool)

(assert (=> b!122976 (= e!80623 e!80621)))

(declare-fun call!1601 () Bool)

(declare-fun bm!1598 () Bool)

(declare-fun lt!193810 () BitStream!4392)

(declare-fun lt!193817 () tuple2!10392)

(declare-fun c!7340 () Bool)

(assert (=> bm!1598 (= call!1601 (isPrefixOf!0 (ite c!7340 (_2!5461 lt!193323) lt!193810) (ite c!7340 (_2!5461 lt!193817) lt!193810)))))

(declare-fun b!122977 () Bool)

(declare-fun res!101952 () Bool)

(assert (=> b!122977 (= res!101952 (isPrefixOf!0 (_2!5461 lt!193323) (_2!5461 lt!193832)))))

(assert (=> b!122977 (=> (not res!101952) (not e!80623))))

(declare-fun b!122978 () Bool)

(declare-fun e!80618 () (_ BitVec 64))

(assert (=> b!122978 (= e!80618 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun d!39488 () Bool)

(assert (=> d!39488 e!80622))

(declare-fun res!101959 () Bool)

(assert (=> d!39488 (=> (not res!101959) (not e!80622))))

(assert (=> d!39488 (= res!101959 (= (size!2459 (buf!2899 (_2!5461 lt!193323))) (size!2459 (buf!2899 (_2!5461 lt!193842)))))))

(declare-fun e!80617 () tuple2!10392)

(assert (=> d!39488 (= lt!193842 e!80617)))

(assert (=> d!39488 (= c!7340 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!39488 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!39488 (= (appendNLeastSignificantBitsLoop!0 (_2!5461 lt!193323) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!193842)))

(declare-fun b!122979 () Bool)

(declare-fun lt!193820 () Unit!7557)

(assert (=> b!122979 (= e!80617 (tuple2!10393 lt!193820 (_2!5461 lt!193323)))))

(assert (=> b!122979 (= lt!193810 (_2!5461 lt!193323))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4392) Unit!7557)

(assert (=> b!122979 (= lt!193820 (lemmaIsPrefixRefl!0 lt!193810))))

(assert (=> b!122979 call!1601))

(declare-fun lt!193841 () tuple2!10396)

(declare-fun lt!193802 () tuple2!10394)

(declare-fun b!122980 () Bool)

(assert (=> b!122980 (= e!80622 (and (= (_2!5462 lt!193802) v!199) (= (_1!5462 lt!193802) (_2!5463 lt!193841))))))

(declare-fun lt!193815 () (_ BitVec 64))

(assert (=> b!122980 (= lt!193802 (readNLeastSignificantBitsLoopPure!0 (_1!5463 lt!193841) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!193815))))

(declare-fun lt!193830 () Unit!7557)

(declare-fun lt!193803 () Unit!7557)

(assert (=> b!122980 (= lt!193830 lt!193803)))

(declare-fun lt!193799 () (_ BitVec 64))

(assert (=> b!122980 (validate_offset_bits!1 ((_ sign_extend 32) (size!2459 (buf!2899 (_2!5461 lt!193842)))) ((_ sign_extend 32) (currentByte!5596 (_2!5461 lt!193323))) ((_ sign_extend 32) (currentBit!5591 (_2!5461 lt!193323))) lt!193799)))

(assert (=> b!122980 (= lt!193803 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5461 lt!193323) (buf!2899 (_2!5461 lt!193842)) lt!193799))))

(declare-fun e!80619 () Bool)

(assert (=> b!122980 e!80619))

(declare-fun res!101957 () Bool)

(assert (=> b!122980 (=> (not res!101957) (not e!80619))))

(assert (=> b!122980 (= res!101957 (and (= (size!2459 (buf!2899 (_2!5461 lt!193323))) (size!2459 (buf!2899 (_2!5461 lt!193842)))) (bvsge lt!193799 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!122980 (= lt!193799 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!122980 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!122980 (= lt!193815 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!122980 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!122980 (= lt!193841 (reader!0 (_2!5461 lt!193323) (_2!5461 lt!193842)))))

(declare-fun b!122981 () Bool)

(declare-fun res!101954 () Bool)

(assert (=> b!122981 (=> (not res!101954) (not e!80622))))

(declare-fun lt!193805 () (_ BitVec 64))

(declare-fun lt!193809 () (_ BitVec 64))

(assert (=> b!122981 (= res!101954 (= (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193842))) (currentByte!5596 (_2!5461 lt!193842)) (currentBit!5591 (_2!5461 lt!193842))) (bvadd lt!193805 lt!193809)))))

(assert (=> b!122981 (or (not (= (bvand lt!193805 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!193809 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!193805 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!193805 lt!193809) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!122981 (= lt!193809 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!122981 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!122981 (= lt!193805 (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193323))) (currentByte!5596 (_2!5461 lt!193323)) (currentBit!5591 (_2!5461 lt!193323))))))

(declare-fun b!122982 () Bool)

(assert (=> b!122982 (= e!80619 (validate_offset_bits!1 ((_ sign_extend 32) (size!2459 (buf!2899 (_2!5461 lt!193323)))) ((_ sign_extend 32) (currentByte!5596 (_2!5461 lt!193323))) ((_ sign_extend 32) (currentBit!5591 (_2!5461 lt!193323))) lt!193799))))

(declare-fun b!122983 () Bool)

(declare-fun Unit!7561 () Unit!7557)

(assert (=> b!122983 (= e!80617 (tuple2!10393 Unit!7561 (_2!5461 lt!193817)))))

(assert (=> b!122983 (= lt!193798 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!122983 (= lt!193832 (appendBit!0 (_2!5461 lt!193323) lt!193798))))

(declare-fun res!101958 () Bool)

(assert (=> b!122983 (= res!101958 (= (size!2459 (buf!2899 (_2!5461 lt!193323))) (size!2459 (buf!2899 (_2!5461 lt!193832)))))))

(assert (=> b!122983 (=> (not res!101958) (not e!80623))))

(assert (=> b!122983 e!80623))

(declare-fun lt!193800 () tuple2!10392)

(assert (=> b!122983 (= lt!193800 lt!193832)))

(assert (=> b!122983 (= lt!193817 (appendNLeastSignificantBitsLoop!0 (_2!5461 lt!193800) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!193812 () Unit!7557)

(assert (=> b!122983 (= lt!193812 (lemmaIsPrefixTransitive!0 (_2!5461 lt!193323) (_2!5461 lt!193800) (_2!5461 lt!193817)))))

(assert (=> b!122983 call!1601))

(declare-fun lt!193818 () Unit!7557)

(assert (=> b!122983 (= lt!193818 lt!193812)))

(assert (=> b!122983 (invariant!0 (currentBit!5591 (_2!5461 lt!193323)) (currentByte!5596 (_2!5461 lt!193323)) (size!2459 (buf!2899 (_2!5461 lt!193800))))))

(declare-fun lt!193828 () BitStream!4392)

(assert (=> b!122983 (= lt!193828 (BitStream!4393 (buf!2899 (_2!5461 lt!193800)) (currentByte!5596 (_2!5461 lt!193323)) (currentBit!5591 (_2!5461 lt!193323))))))

(assert (=> b!122983 (invariant!0 (currentBit!5591 lt!193828) (currentByte!5596 lt!193828) (size!2459 (buf!2899 (_2!5461 lt!193817))))))

(declare-fun lt!193829 () BitStream!4392)

(assert (=> b!122983 (= lt!193829 (BitStream!4393 (buf!2899 (_2!5461 lt!193817)) (currentByte!5596 lt!193828) (currentBit!5591 lt!193828)))))

(assert (=> b!122983 (= lt!193823 (readBitPure!0 lt!193828))))

(assert (=> b!122983 (= lt!193831 (readBitPure!0 lt!193829))))

(declare-fun lt!193801 () Unit!7557)

(assert (=> b!122983 (= lt!193801 (readBitPrefixLemma!0 lt!193828 (_2!5461 lt!193817)))))

(declare-fun res!101951 () Bool)

(assert (=> b!122983 (= res!101951 (= (bitIndex!0 (size!2459 (buf!2899 (_1!5464 lt!193823))) (currentByte!5596 (_1!5464 lt!193823)) (currentBit!5591 (_1!5464 lt!193823))) (bitIndex!0 (size!2459 (buf!2899 (_1!5464 lt!193831))) (currentByte!5596 (_1!5464 lt!193831)) (currentBit!5591 (_1!5464 lt!193831)))))))

(assert (=> b!122983 (=> (not res!101951) (not e!80620))))

(assert (=> b!122983 e!80620))

(declare-fun lt!193839 () Unit!7557)

(assert (=> b!122983 (= lt!193839 lt!193801)))

(declare-fun lt!193824 () tuple2!10396)

(assert (=> b!122983 (= lt!193824 (reader!0 (_2!5461 lt!193323) (_2!5461 lt!193817)))))

(declare-fun lt!193822 () tuple2!10396)

(assert (=> b!122983 (= lt!193822 (reader!0 (_2!5461 lt!193800) (_2!5461 lt!193817)))))

(declare-fun lt!193833 () tuple2!10398)

(assert (=> b!122983 (= lt!193833 (readBitPure!0 (_1!5463 lt!193824)))))

(assert (=> b!122983 (= (_2!5464 lt!193833) lt!193798)))

(declare-fun lt!193813 () Unit!7557)

(declare-fun Unit!7562 () Unit!7557)

(assert (=> b!122983 (= lt!193813 Unit!7562)))

(declare-fun lt!193816 () (_ BitVec 64))

(assert (=> b!122983 (= lt!193816 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!193819 () (_ BitVec 64))

(assert (=> b!122983 (= lt!193819 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!193840 () Unit!7557)

(assert (=> b!122983 (= lt!193840 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5461 lt!193323) (buf!2899 (_2!5461 lt!193817)) lt!193819))))

(assert (=> b!122983 (validate_offset_bits!1 ((_ sign_extend 32) (size!2459 (buf!2899 (_2!5461 lt!193817)))) ((_ sign_extend 32) (currentByte!5596 (_2!5461 lt!193323))) ((_ sign_extend 32) (currentBit!5591 (_2!5461 lt!193323))) lt!193819)))

(declare-fun lt!193837 () Unit!7557)

(assert (=> b!122983 (= lt!193837 lt!193840)))

(declare-fun lt!193827 () tuple2!10394)

(assert (=> b!122983 (= lt!193827 (readNLeastSignificantBitsLoopPure!0 (_1!5463 lt!193824) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!193816))))

(declare-fun lt!193807 () (_ BitVec 64))

(assert (=> b!122983 (= lt!193807 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!193804 () Unit!7557)

(assert (=> b!122983 (= lt!193804 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5461 lt!193800) (buf!2899 (_2!5461 lt!193817)) lt!193807))))

(assert (=> b!122983 (validate_offset_bits!1 ((_ sign_extend 32) (size!2459 (buf!2899 (_2!5461 lt!193817)))) ((_ sign_extend 32) (currentByte!5596 (_2!5461 lt!193800))) ((_ sign_extend 32) (currentBit!5591 (_2!5461 lt!193800))) lt!193807)))

(declare-fun lt!193811 () Unit!7557)

(assert (=> b!122983 (= lt!193811 lt!193804)))

(declare-fun lt!193834 () tuple2!10394)

(assert (=> b!122983 (= lt!193834 (readNLeastSignificantBitsLoopPure!0 (_1!5463 lt!193822) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!193816 (ite (_2!5464 lt!193833) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!193806 () tuple2!10394)

(assert (=> b!122983 (= lt!193806 (readNLeastSignificantBitsLoopPure!0 (_1!5463 lt!193824) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!193816))))

(declare-fun c!7339 () Bool)

(assert (=> b!122983 (= c!7339 (_2!5464 (readBitPure!0 (_1!5463 lt!193824))))))

(declare-fun lt!193836 () tuple2!10394)

(assert (=> b!122983 (= lt!193836 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!5463 lt!193824) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!193816 e!80618)))))

(declare-fun lt!193814 () Unit!7557)

(assert (=> b!122983 (= lt!193814 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5463 lt!193824) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!193816))))

(assert (=> b!122983 (and (= (_2!5462 lt!193806) (_2!5462 lt!193836)) (= (_1!5462 lt!193806) (_1!5462 lt!193836)))))

(declare-fun lt!193821 () Unit!7557)

(assert (=> b!122983 (= lt!193821 lt!193814)))

(assert (=> b!122983 (= (_1!5463 lt!193824) (withMovedBitIndex!0 (_2!5463 lt!193824) (bvsub (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193323))) (currentByte!5596 (_2!5461 lt!193323)) (currentBit!5591 (_2!5461 lt!193323))) (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193817))) (currentByte!5596 (_2!5461 lt!193817)) (currentBit!5591 (_2!5461 lt!193817))))))))

(declare-fun lt!193835 () Unit!7557)

(declare-fun Unit!7563 () Unit!7557)

(assert (=> b!122983 (= lt!193835 Unit!7563)))

(assert (=> b!122983 (= (_1!5463 lt!193822) (withMovedBitIndex!0 (_2!5463 lt!193822) (bvsub (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193800))) (currentByte!5596 (_2!5461 lt!193800)) (currentBit!5591 (_2!5461 lt!193800))) (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193817))) (currentByte!5596 (_2!5461 lt!193817)) (currentBit!5591 (_2!5461 lt!193817))))))))

(declare-fun lt!193808 () Unit!7557)

(declare-fun Unit!7564 () Unit!7557)

(assert (=> b!122983 (= lt!193808 Unit!7564)))

(assert (=> b!122983 (= (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193323))) (currentByte!5596 (_2!5461 lt!193323)) (currentBit!5591 (_2!5461 lt!193323))) (bvsub (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193800))) (currentByte!5596 (_2!5461 lt!193800)) (currentBit!5591 (_2!5461 lt!193800))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!193838 () Unit!7557)

(declare-fun Unit!7565 () Unit!7557)

(assert (=> b!122983 (= lt!193838 Unit!7565)))

(assert (=> b!122983 (= (_2!5462 lt!193827) (_2!5462 lt!193834))))

(declare-fun lt!193825 () Unit!7557)

(declare-fun Unit!7566 () Unit!7557)

(assert (=> b!122983 (= lt!193825 Unit!7566)))

(assert (=> b!122983 (= (_1!5462 lt!193827) (_2!5463 lt!193824))))

(declare-fun b!122984 () Bool)

(declare-fun res!101953 () Bool)

(assert (=> b!122984 (= res!101953 (= (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193832))) (currentByte!5596 (_2!5461 lt!193832)) (currentBit!5591 (_2!5461 lt!193832))) (bvadd (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193323))) (currentByte!5596 (_2!5461 lt!193323)) (currentBit!5591 (_2!5461 lt!193323))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!122984 (=> (not res!101953) (not e!80623))))

(declare-fun b!122985 () Bool)

(assert (=> b!122985 (= e!80618 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (= (and d!39488 c!7340) b!122983))

(assert (= (and d!39488 (not c!7340)) b!122979))

(assert (= (and b!122983 res!101958) b!122984))

(assert (= (and b!122984 res!101953) b!122977))

(assert (= (and b!122977 res!101952) b!122976))

(assert (= (and b!122976 res!101955) b!122974))

(assert (= (and b!122983 res!101951) b!122973))

(assert (= (and b!122983 c!7339) b!122978))

(assert (= (and b!122983 (not c!7339)) b!122985))

(assert (= (or b!122983 b!122979) bm!1598))

(assert (= (and d!39488 res!101959) b!122981))

(assert (= (and b!122981 res!101954) b!122975))

(assert (= (and b!122975 res!101956) b!122980))

(assert (= (and b!122980 res!101957) b!122982))

(declare-fun m!186943 () Bool)

(assert (=> b!122981 m!186943))

(assert (=> b!122981 m!186565))

(declare-fun m!186945 () Bool)

(assert (=> b!122984 m!186945))

(assert (=> b!122984 m!186565))

(declare-fun m!186947 () Bool)

(assert (=> b!122974 m!186947))

(assert (=> b!122974 m!186945))

(declare-fun m!186949 () Bool)

(assert (=> bm!1598 m!186949))

(declare-fun m!186951 () Bool)

(assert (=> b!122979 m!186951))

(declare-fun m!186953 () Bool)

(assert (=> b!122976 m!186953))

(assert (=> b!122976 m!186953))

(declare-fun m!186955 () Bool)

(assert (=> b!122976 m!186955))

(declare-fun m!186957 () Bool)

(assert (=> b!122975 m!186957))

(declare-fun m!186959 () Bool)

(assert (=> b!122982 m!186959))

(declare-fun m!186961 () Bool)

(assert (=> b!122983 m!186961))

(declare-fun m!186963 () Bool)

(assert (=> b!122983 m!186963))

(declare-fun m!186965 () Bool)

(assert (=> b!122983 m!186965))

(declare-fun m!186967 () Bool)

(assert (=> b!122983 m!186967))

(declare-fun m!186969 () Bool)

(assert (=> b!122983 m!186969))

(declare-fun m!186971 () Bool)

(assert (=> b!122983 m!186971))

(declare-fun m!186973 () Bool)

(assert (=> b!122983 m!186973))

(declare-fun m!186975 () Bool)

(assert (=> b!122983 m!186975))

(declare-fun m!186977 () Bool)

(assert (=> b!122983 m!186977))

(declare-fun m!186979 () Bool)

(assert (=> b!122983 m!186979))

(declare-fun m!186981 () Bool)

(assert (=> b!122983 m!186981))

(declare-fun m!186983 () Bool)

(assert (=> b!122983 m!186983))

(declare-fun m!186985 () Bool)

(assert (=> b!122983 m!186985))

(declare-fun m!186987 () Bool)

(assert (=> b!122983 m!186987))

(declare-fun m!186989 () Bool)

(assert (=> b!122983 m!186989))

(assert (=> b!122983 m!186565))

(assert (=> b!122983 m!186985))

(declare-fun m!186991 () Bool)

(assert (=> b!122983 m!186991))

(declare-fun m!186993 () Bool)

(assert (=> b!122983 m!186993))

(declare-fun m!186995 () Bool)

(assert (=> b!122983 m!186995))

(declare-fun m!186997 () Bool)

(assert (=> b!122983 m!186997))

(declare-fun m!186999 () Bool)

(assert (=> b!122983 m!186999))

(declare-fun m!187001 () Bool)

(assert (=> b!122983 m!187001))

(declare-fun m!187003 () Bool)

(assert (=> b!122983 m!187003))

(declare-fun m!187005 () Bool)

(assert (=> b!122983 m!187005))

(declare-fun m!187007 () Bool)

(assert (=> b!122983 m!187007))

(declare-fun m!187009 () Bool)

(assert (=> b!122983 m!187009))

(declare-fun m!187011 () Bool)

(assert (=> b!122983 m!187011))

(declare-fun m!187013 () Bool)

(assert (=> b!122983 m!187013))

(assert (=> b!122980 m!186963))

(declare-fun m!187015 () Bool)

(assert (=> b!122980 m!187015))

(declare-fun m!187017 () Bool)

(assert (=> b!122980 m!187017))

(declare-fun m!187019 () Bool)

(assert (=> b!122980 m!187019))

(declare-fun m!187021 () Bool)

(assert (=> b!122980 m!187021))

(declare-fun m!187023 () Bool)

(assert (=> b!122977 m!187023))

(assert (=> b!122788 d!39488))

(declare-fun d!39590 () Bool)

(declare-fun lt!193843 () tuple2!10408)

(assert (=> d!39590 (= lt!193843 (readBit!0 (BitStream!4393 (buf!2899 (_2!5461 lt!193308)) (currentByte!5596 thiss!1305) (currentBit!5591 thiss!1305))))))

(assert (=> d!39590 (= (readBitPure!0 (BitStream!4393 (buf!2899 (_2!5461 lt!193308)) (currentByte!5596 thiss!1305) (currentBit!5591 thiss!1305))) (tuple2!10399 (_2!5469 lt!193843) (_1!5469 lt!193843)))))

(declare-fun bs!9586 () Bool)

(assert (= bs!9586 d!39590))

(declare-fun m!187025 () Bool)

(assert (=> bs!9586 m!187025))

(assert (=> b!122788 d!39590))

(declare-fun d!39592 () Bool)

(declare-fun res!101962 () Bool)

(declare-fun e!80625 () Bool)

(assert (=> d!39592 (=> (not res!101962) (not e!80625))))

(assert (=> d!39592 (= res!101962 (= (size!2459 (buf!2899 thiss!1305)) (size!2459 (buf!2899 (_2!5461 lt!193308)))))))

(assert (=> d!39592 (= (isPrefixOf!0 thiss!1305 (_2!5461 lt!193308)) e!80625)))

(declare-fun b!122986 () Bool)

(declare-fun res!101960 () Bool)

(assert (=> b!122986 (=> (not res!101960) (not e!80625))))

(assert (=> b!122986 (= res!101960 (bvsle (bitIndex!0 (size!2459 (buf!2899 thiss!1305)) (currentByte!5596 thiss!1305) (currentBit!5591 thiss!1305)) (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193308))) (currentByte!5596 (_2!5461 lt!193308)) (currentBit!5591 (_2!5461 lt!193308)))))))

(declare-fun b!122987 () Bool)

(declare-fun e!80624 () Bool)

(assert (=> b!122987 (= e!80625 e!80624)))

(declare-fun res!101961 () Bool)

(assert (=> b!122987 (=> res!101961 e!80624)))

(assert (=> b!122987 (= res!101961 (= (size!2459 (buf!2899 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!122988 () Bool)

(assert (=> b!122988 (= e!80624 (arrayBitRangesEq!0 (buf!2899 thiss!1305) (buf!2899 (_2!5461 lt!193308)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2459 (buf!2899 thiss!1305)) (currentByte!5596 thiss!1305) (currentBit!5591 thiss!1305))))))

(assert (= (and d!39592 res!101962) b!122986))

(assert (= (and b!122986 res!101960) b!122987))

(assert (= (and b!122987 (not res!101961)) b!122988))

(assert (=> b!122986 m!186569))

(assert (=> b!122986 m!186577))

(assert (=> b!122988 m!186569))

(assert (=> b!122988 m!186569))

(declare-fun m!187027 () Bool)

(assert (=> b!122988 m!187027))

(assert (=> b!122788 d!39592))

(declare-fun d!39594 () Bool)

(declare-fun e!80628 () Bool)

(assert (=> d!39594 e!80628))

(declare-fun res!101965 () Bool)

(assert (=> d!39594 (=> (not res!101965) (not e!80628))))

(declare-fun lt!193855 () tuple2!10398)

(declare-fun lt!193853 () tuple2!10398)

(assert (=> d!39594 (= res!101965 (= (bitIndex!0 (size!2459 (buf!2899 (_1!5464 lt!193855))) (currentByte!5596 (_1!5464 lt!193855)) (currentBit!5591 (_1!5464 lt!193855))) (bitIndex!0 (size!2459 (buf!2899 (_1!5464 lt!193853))) (currentByte!5596 (_1!5464 lt!193853)) (currentBit!5591 (_1!5464 lt!193853)))))))

(declare-fun lt!193854 () BitStream!4392)

(declare-fun lt!193852 () Unit!7557)

(declare-fun choose!50 (BitStream!4392 BitStream!4392 BitStream!4392 tuple2!10398 tuple2!10398 BitStream!4392 Bool tuple2!10398 tuple2!10398 BitStream!4392 Bool) Unit!7557)

(assert (=> d!39594 (= lt!193852 (choose!50 lt!193300 (_2!5461 lt!193308) lt!193854 lt!193855 (tuple2!10399 (_1!5464 lt!193855) (_2!5464 lt!193855)) (_1!5464 lt!193855) (_2!5464 lt!193855) lt!193853 (tuple2!10399 (_1!5464 lt!193853) (_2!5464 lt!193853)) (_1!5464 lt!193853) (_2!5464 lt!193853)))))

(assert (=> d!39594 (= lt!193853 (readBitPure!0 lt!193854))))

(assert (=> d!39594 (= lt!193855 (readBitPure!0 lt!193300))))

(assert (=> d!39594 (= lt!193854 (BitStream!4393 (buf!2899 (_2!5461 lt!193308)) (currentByte!5596 lt!193300) (currentBit!5591 lt!193300)))))

(assert (=> d!39594 (invariant!0 (currentBit!5591 lt!193300) (currentByte!5596 lt!193300) (size!2459 (buf!2899 (_2!5461 lt!193308))))))

(assert (=> d!39594 (= (readBitPrefixLemma!0 lt!193300 (_2!5461 lt!193308)) lt!193852)))

(declare-fun b!122991 () Bool)

(assert (=> b!122991 (= e!80628 (= (_2!5464 lt!193855) (_2!5464 lt!193853)))))

(assert (= (and d!39594 res!101965) b!122991))

(declare-fun m!187029 () Bool)

(assert (=> d!39594 m!187029))

(declare-fun m!187031 () Bool)

(assert (=> d!39594 m!187031))

(declare-fun m!187033 () Bool)

(assert (=> d!39594 m!187033))

(assert (=> d!39594 m!186625))

(declare-fun m!187035 () Bool)

(assert (=> d!39594 m!187035))

(declare-fun m!187037 () Bool)

(assert (=> d!39594 m!187037))

(assert (=> b!122788 d!39594))

(declare-fun d!39596 () Bool)

(assert (=> d!39596 (= (onesLSBLong!0 (bvsub nBits!396 i!615)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 i!615)))))))

(assert (=> b!122788 d!39596))

(declare-fun b!123004 () Bool)

(declare-fun e!80633 () Bool)

(declare-fun lt!193865 () tuple2!10398)

(declare-fun lt!193867 () tuple2!10392)

(assert (=> b!123004 (= e!80633 (= (bitIndex!0 (size!2459 (buf!2899 (_1!5464 lt!193865))) (currentByte!5596 (_1!5464 lt!193865)) (currentBit!5591 (_1!5464 lt!193865))) (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193867))) (currentByte!5596 (_2!5461 lt!193867)) (currentBit!5591 (_2!5461 lt!193867)))))))

(declare-fun b!123001 () Bool)

(declare-fun res!101974 () Bool)

(declare-fun e!80634 () Bool)

(assert (=> b!123001 (=> (not res!101974) (not e!80634))))

(declare-fun lt!193866 () (_ BitVec 64))

(declare-fun lt!193864 () (_ BitVec 64))

(assert (=> b!123001 (= res!101974 (= (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193867))) (currentByte!5596 (_2!5461 lt!193867)) (currentBit!5591 (_2!5461 lt!193867))) (bvadd lt!193864 lt!193866)))))

(assert (=> b!123001 (or (not (= (bvand lt!193864 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!193866 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!193864 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!193864 lt!193866) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!123001 (= lt!193866 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!123001 (= lt!193864 (bitIndex!0 (size!2459 (buf!2899 thiss!1305)) (currentByte!5596 thiss!1305) (currentBit!5591 thiss!1305)))))

(declare-fun d!39598 () Bool)

(assert (=> d!39598 e!80634))

(declare-fun res!101976 () Bool)

(assert (=> d!39598 (=> (not res!101976) (not e!80634))))

(assert (=> d!39598 (= res!101976 (= (size!2459 (buf!2899 thiss!1305)) (size!2459 (buf!2899 (_2!5461 lt!193867)))))))

(declare-fun choose!16 (BitStream!4392 Bool) tuple2!10392)

(assert (=> d!39598 (= lt!193867 (choose!16 thiss!1305 lt!193298))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!39598 (validate_offset_bit!0 ((_ sign_extend 32) (size!2459 (buf!2899 thiss!1305))) ((_ sign_extend 32) (currentByte!5596 thiss!1305)) ((_ sign_extend 32) (currentBit!5591 thiss!1305)))))

(assert (=> d!39598 (= (appendBit!0 thiss!1305 lt!193298) lt!193867)))

(declare-fun b!123002 () Bool)

(declare-fun res!101975 () Bool)

(assert (=> b!123002 (=> (not res!101975) (not e!80634))))

(assert (=> b!123002 (= res!101975 (isPrefixOf!0 thiss!1305 (_2!5461 lt!193867)))))

(declare-fun b!123003 () Bool)

(assert (=> b!123003 (= e!80634 e!80633)))

(declare-fun res!101977 () Bool)

(assert (=> b!123003 (=> (not res!101977) (not e!80633))))

(assert (=> b!123003 (= res!101977 (and (= (_2!5464 lt!193865) lt!193298) (= (_1!5464 lt!193865) (_2!5461 lt!193867))))))

(assert (=> b!123003 (= lt!193865 (readBitPure!0 (readerFrom!0 (_2!5461 lt!193867) (currentBit!5591 thiss!1305) (currentByte!5596 thiss!1305))))))

(assert (= (and d!39598 res!101976) b!123001))

(assert (= (and b!123001 res!101974) b!123002))

(assert (= (and b!123002 res!101975) b!123003))

(assert (= (and b!123003 res!101977) b!123004))

(declare-fun m!187039 () Bool)

(assert (=> b!123004 m!187039))

(declare-fun m!187041 () Bool)

(assert (=> b!123004 m!187041))

(declare-fun m!187043 () Bool)

(assert (=> b!123003 m!187043))

(assert (=> b!123003 m!187043))

(declare-fun m!187045 () Bool)

(assert (=> b!123003 m!187045))

(declare-fun m!187047 () Bool)

(assert (=> b!123002 m!187047))

(declare-fun m!187049 () Bool)

(assert (=> d!39598 m!187049))

(declare-fun m!187051 () Bool)

(assert (=> d!39598 m!187051))

(assert (=> b!123001 m!187041))

(assert (=> b!123001 m!186569))

(assert (=> b!122788 d!39598))

(declare-datatypes ((tuple2!10410 0))(
  ( (tuple2!10411 (_1!5470 (_ BitVec 64)) (_2!5470 BitStream!4392)) )
))
(declare-fun lt!193870 () tuple2!10410)

(declare-fun d!39600 () Bool)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!4392 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!10410)

(assert (=> d!39600 (= lt!193870 (readNLeastSignificantBitsLoop!0 (_1!5463 lt!193305) nBits!396 i!615 lt!193309))))

(assert (=> d!39600 (= (readNLeastSignificantBitsLoopPure!0 (_1!5463 lt!193305) nBits!396 i!615 lt!193309) (tuple2!10395 (_2!5470 lt!193870) (_1!5470 lt!193870)))))

(declare-fun bs!9587 () Bool)

(assert (= bs!9587 d!39600))

(declare-fun m!187053 () Bool)

(assert (=> bs!9587 m!187053))

(assert (=> b!122788 d!39600))

(declare-fun lt!193921 () (_ BitVec 64))

(declare-fun b!123015 () Bool)

(declare-fun lt!193926 () (_ BitVec 64))

(declare-fun e!80639 () Bool)

(declare-fun lt!193920 () tuple2!10396)

(assert (=> b!123015 (= e!80639 (= (_1!5463 lt!193920) (withMovedBitIndex!0 (_2!5463 lt!193920) (bvsub lt!193921 lt!193926))))))

(assert (=> b!123015 (or (= (bvand lt!193921 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!193926 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!193921 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!193921 lt!193926) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!123015 (= lt!193926 (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193308))) (currentByte!5596 (_2!5461 lt!193308)) (currentBit!5591 (_2!5461 lt!193308))))))

(assert (=> b!123015 (= lt!193921 (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193323))) (currentByte!5596 (_2!5461 lt!193323)) (currentBit!5591 (_2!5461 lt!193323))))))

(declare-fun b!123017 () Bool)

(declare-fun res!101986 () Bool)

(assert (=> b!123017 (=> (not res!101986) (not e!80639))))

(assert (=> b!123017 (= res!101986 (isPrefixOf!0 (_1!5463 lt!193920) (_2!5461 lt!193323)))))

(declare-fun b!123018 () Bool)

(declare-fun res!101985 () Bool)

(assert (=> b!123018 (=> (not res!101985) (not e!80639))))

(assert (=> b!123018 (= res!101985 (isPrefixOf!0 (_2!5463 lt!193920) (_2!5461 lt!193308)))))

(declare-fun b!123019 () Bool)

(declare-fun e!80640 () Unit!7557)

(declare-fun Unit!7567 () Unit!7557)

(assert (=> b!123019 (= e!80640 Unit!7567)))

(declare-fun b!123016 () Bool)

(declare-fun lt!193928 () Unit!7557)

(assert (=> b!123016 (= e!80640 lt!193928)))

(declare-fun lt!193916 () (_ BitVec 64))

(assert (=> b!123016 (= lt!193916 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!193917 () (_ BitVec 64))

(assert (=> b!123016 (= lt!193917 (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193323))) (currentByte!5596 (_2!5461 lt!193323)) (currentBit!5591 (_2!5461 lt!193323))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!5434 array!5434 (_ BitVec 64) (_ BitVec 64)) Unit!7557)

(assert (=> b!123016 (= lt!193928 (arrayBitRangesEqSymmetric!0 (buf!2899 (_2!5461 lt!193323)) (buf!2899 (_2!5461 lt!193308)) lt!193916 lt!193917))))

(assert (=> b!123016 (arrayBitRangesEq!0 (buf!2899 (_2!5461 lt!193308)) (buf!2899 (_2!5461 lt!193323)) lt!193916 lt!193917)))

(declare-fun d!39602 () Bool)

(assert (=> d!39602 e!80639))

(declare-fun res!101984 () Bool)

(assert (=> d!39602 (=> (not res!101984) (not e!80639))))

(assert (=> d!39602 (= res!101984 (isPrefixOf!0 (_1!5463 lt!193920) (_2!5463 lt!193920)))))

(declare-fun lt!193927 () BitStream!4392)

(assert (=> d!39602 (= lt!193920 (tuple2!10397 lt!193927 (_2!5461 lt!193308)))))

(declare-fun lt!193930 () Unit!7557)

(declare-fun lt!193912 () Unit!7557)

(assert (=> d!39602 (= lt!193930 lt!193912)))

(assert (=> d!39602 (isPrefixOf!0 lt!193927 (_2!5461 lt!193308))))

(assert (=> d!39602 (= lt!193912 (lemmaIsPrefixTransitive!0 lt!193927 (_2!5461 lt!193308) (_2!5461 lt!193308)))))

(declare-fun lt!193915 () Unit!7557)

(declare-fun lt!193918 () Unit!7557)

(assert (=> d!39602 (= lt!193915 lt!193918)))

(assert (=> d!39602 (isPrefixOf!0 lt!193927 (_2!5461 lt!193308))))

(assert (=> d!39602 (= lt!193918 (lemmaIsPrefixTransitive!0 lt!193927 (_2!5461 lt!193323) (_2!5461 lt!193308)))))

(declare-fun lt!193924 () Unit!7557)

(assert (=> d!39602 (= lt!193924 e!80640)))

(declare-fun c!7343 () Bool)

(assert (=> d!39602 (= c!7343 (not (= (size!2459 (buf!2899 (_2!5461 lt!193323))) #b00000000000000000000000000000000)))))

(declare-fun lt!193911 () Unit!7557)

(declare-fun lt!193925 () Unit!7557)

(assert (=> d!39602 (= lt!193911 lt!193925)))

(assert (=> d!39602 (isPrefixOf!0 (_2!5461 lt!193308) (_2!5461 lt!193308))))

(assert (=> d!39602 (= lt!193925 (lemmaIsPrefixRefl!0 (_2!5461 lt!193308)))))

(declare-fun lt!193913 () Unit!7557)

(declare-fun lt!193923 () Unit!7557)

(assert (=> d!39602 (= lt!193913 lt!193923)))

(assert (=> d!39602 (= lt!193923 (lemmaIsPrefixRefl!0 (_2!5461 lt!193308)))))

(declare-fun lt!193919 () Unit!7557)

(declare-fun lt!193929 () Unit!7557)

(assert (=> d!39602 (= lt!193919 lt!193929)))

(assert (=> d!39602 (isPrefixOf!0 lt!193927 lt!193927)))

(assert (=> d!39602 (= lt!193929 (lemmaIsPrefixRefl!0 lt!193927))))

(declare-fun lt!193914 () Unit!7557)

(declare-fun lt!193922 () Unit!7557)

(assert (=> d!39602 (= lt!193914 lt!193922)))

(assert (=> d!39602 (isPrefixOf!0 (_2!5461 lt!193323) (_2!5461 lt!193323))))

(assert (=> d!39602 (= lt!193922 (lemmaIsPrefixRefl!0 (_2!5461 lt!193323)))))

(assert (=> d!39602 (= lt!193927 (BitStream!4393 (buf!2899 (_2!5461 lt!193308)) (currentByte!5596 (_2!5461 lt!193323)) (currentBit!5591 (_2!5461 lt!193323))))))

(assert (=> d!39602 (isPrefixOf!0 (_2!5461 lt!193323) (_2!5461 lt!193308))))

(assert (=> d!39602 (= (reader!0 (_2!5461 lt!193323) (_2!5461 lt!193308)) lt!193920)))

(assert (= (and d!39602 c!7343) b!123016))

(assert (= (and d!39602 (not c!7343)) b!123019))

(assert (= (and d!39602 res!101984) b!123017))

(assert (= (and b!123017 res!101986) b!123018))

(assert (= (and b!123018 res!101985) b!123015))

(declare-fun m!187055 () Bool)

(assert (=> d!39602 m!187055))

(declare-fun m!187057 () Bool)

(assert (=> d!39602 m!187057))

(declare-fun m!187059 () Bool)

(assert (=> d!39602 m!187059))

(declare-fun m!187061 () Bool)

(assert (=> d!39602 m!187061))

(declare-fun m!187063 () Bool)

(assert (=> d!39602 m!187063))

(declare-fun m!187065 () Bool)

(assert (=> d!39602 m!187065))

(declare-fun m!187067 () Bool)

(assert (=> d!39602 m!187067))

(declare-fun m!187069 () Bool)

(assert (=> d!39602 m!187069))

(declare-fun m!187071 () Bool)

(assert (=> d!39602 m!187071))

(declare-fun m!187073 () Bool)

(assert (=> d!39602 m!187073))

(declare-fun m!187075 () Bool)

(assert (=> d!39602 m!187075))

(declare-fun m!187077 () Bool)

(assert (=> b!123015 m!187077))

(assert (=> b!123015 m!186577))

(assert (=> b!123015 m!186565))

(declare-fun m!187079 () Bool)

(assert (=> b!123017 m!187079))

(declare-fun m!187081 () Bool)

(assert (=> b!123018 m!187081))

(assert (=> b!123016 m!186565))

(declare-fun m!187083 () Bool)

(assert (=> b!123016 m!187083))

(declare-fun m!187085 () Bool)

(assert (=> b!123016 m!187085))

(assert (=> b!122788 d!39602))

(declare-fun d!39604 () Bool)

(assert (=> d!39604 (isPrefixOf!0 thiss!1305 (_2!5461 lt!193308))))

(declare-fun lt!193933 () Unit!7557)

(declare-fun choose!30 (BitStream!4392 BitStream!4392 BitStream!4392) Unit!7557)

(assert (=> d!39604 (= lt!193933 (choose!30 thiss!1305 (_2!5461 lt!193323) (_2!5461 lt!193308)))))

(assert (=> d!39604 (isPrefixOf!0 thiss!1305 (_2!5461 lt!193323))))

(assert (=> d!39604 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5461 lt!193323) (_2!5461 lt!193308)) lt!193933)))

(declare-fun bs!9588 () Bool)

(assert (= bs!9588 d!39604))

(assert (=> bs!9588 m!186615))

(declare-fun m!187087 () Bool)

(assert (=> bs!9588 m!187087))

(assert (=> bs!9588 m!186633))

(assert (=> b!122788 d!39604))

(declare-fun lt!193943 () tuple2!10396)

(declare-fun lt!193944 () (_ BitVec 64))

(declare-fun e!80641 () Bool)

(declare-fun lt!193949 () (_ BitVec 64))

(declare-fun b!123020 () Bool)

(assert (=> b!123020 (= e!80641 (= (_1!5463 lt!193943) (withMovedBitIndex!0 (_2!5463 lt!193943) (bvsub lt!193944 lt!193949))))))

(assert (=> b!123020 (or (= (bvand lt!193944 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!193949 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!193944 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!193944 lt!193949) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!123020 (= lt!193949 (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193308))) (currentByte!5596 (_2!5461 lt!193308)) (currentBit!5591 (_2!5461 lt!193308))))))

(assert (=> b!123020 (= lt!193944 (bitIndex!0 (size!2459 (buf!2899 thiss!1305)) (currentByte!5596 thiss!1305) (currentBit!5591 thiss!1305)))))

(declare-fun b!123022 () Bool)

(declare-fun res!101989 () Bool)

(assert (=> b!123022 (=> (not res!101989) (not e!80641))))

(assert (=> b!123022 (= res!101989 (isPrefixOf!0 (_1!5463 lt!193943) thiss!1305))))

(declare-fun b!123023 () Bool)

(declare-fun res!101988 () Bool)

(assert (=> b!123023 (=> (not res!101988) (not e!80641))))

(assert (=> b!123023 (= res!101988 (isPrefixOf!0 (_2!5463 lt!193943) (_2!5461 lt!193308)))))

(declare-fun b!123024 () Bool)

(declare-fun e!80642 () Unit!7557)

(declare-fun Unit!7568 () Unit!7557)

(assert (=> b!123024 (= e!80642 Unit!7568)))

(declare-fun b!123021 () Bool)

(declare-fun lt!193951 () Unit!7557)

(assert (=> b!123021 (= e!80642 lt!193951)))

(declare-fun lt!193939 () (_ BitVec 64))

(assert (=> b!123021 (= lt!193939 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!193940 () (_ BitVec 64))

(assert (=> b!123021 (= lt!193940 (bitIndex!0 (size!2459 (buf!2899 thiss!1305)) (currentByte!5596 thiss!1305) (currentBit!5591 thiss!1305)))))

(assert (=> b!123021 (= lt!193951 (arrayBitRangesEqSymmetric!0 (buf!2899 thiss!1305) (buf!2899 (_2!5461 lt!193308)) lt!193939 lt!193940))))

(assert (=> b!123021 (arrayBitRangesEq!0 (buf!2899 (_2!5461 lt!193308)) (buf!2899 thiss!1305) lt!193939 lt!193940)))

(declare-fun d!39606 () Bool)

(assert (=> d!39606 e!80641))

(declare-fun res!101987 () Bool)

(assert (=> d!39606 (=> (not res!101987) (not e!80641))))

(assert (=> d!39606 (= res!101987 (isPrefixOf!0 (_1!5463 lt!193943) (_2!5463 lt!193943)))))

(declare-fun lt!193950 () BitStream!4392)

(assert (=> d!39606 (= lt!193943 (tuple2!10397 lt!193950 (_2!5461 lt!193308)))))

(declare-fun lt!193953 () Unit!7557)

(declare-fun lt!193935 () Unit!7557)

(assert (=> d!39606 (= lt!193953 lt!193935)))

(assert (=> d!39606 (isPrefixOf!0 lt!193950 (_2!5461 lt!193308))))

(assert (=> d!39606 (= lt!193935 (lemmaIsPrefixTransitive!0 lt!193950 (_2!5461 lt!193308) (_2!5461 lt!193308)))))

(declare-fun lt!193938 () Unit!7557)

(declare-fun lt!193941 () Unit!7557)

(assert (=> d!39606 (= lt!193938 lt!193941)))

(assert (=> d!39606 (isPrefixOf!0 lt!193950 (_2!5461 lt!193308))))

(assert (=> d!39606 (= lt!193941 (lemmaIsPrefixTransitive!0 lt!193950 thiss!1305 (_2!5461 lt!193308)))))

(declare-fun lt!193947 () Unit!7557)

(assert (=> d!39606 (= lt!193947 e!80642)))

(declare-fun c!7344 () Bool)

(assert (=> d!39606 (= c!7344 (not (= (size!2459 (buf!2899 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!193934 () Unit!7557)

(declare-fun lt!193948 () Unit!7557)

(assert (=> d!39606 (= lt!193934 lt!193948)))

(assert (=> d!39606 (isPrefixOf!0 (_2!5461 lt!193308) (_2!5461 lt!193308))))

(assert (=> d!39606 (= lt!193948 (lemmaIsPrefixRefl!0 (_2!5461 lt!193308)))))

(declare-fun lt!193936 () Unit!7557)

(declare-fun lt!193946 () Unit!7557)

(assert (=> d!39606 (= lt!193936 lt!193946)))

(assert (=> d!39606 (= lt!193946 (lemmaIsPrefixRefl!0 (_2!5461 lt!193308)))))

(declare-fun lt!193942 () Unit!7557)

(declare-fun lt!193952 () Unit!7557)

(assert (=> d!39606 (= lt!193942 lt!193952)))

(assert (=> d!39606 (isPrefixOf!0 lt!193950 lt!193950)))

(assert (=> d!39606 (= lt!193952 (lemmaIsPrefixRefl!0 lt!193950))))

(declare-fun lt!193937 () Unit!7557)

(declare-fun lt!193945 () Unit!7557)

(assert (=> d!39606 (= lt!193937 lt!193945)))

(assert (=> d!39606 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!39606 (= lt!193945 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!39606 (= lt!193950 (BitStream!4393 (buf!2899 (_2!5461 lt!193308)) (currentByte!5596 thiss!1305) (currentBit!5591 thiss!1305)))))

(assert (=> d!39606 (isPrefixOf!0 thiss!1305 (_2!5461 lt!193308))))

(assert (=> d!39606 (= (reader!0 thiss!1305 (_2!5461 lt!193308)) lt!193943)))

(assert (= (and d!39606 c!7344) b!123021))

(assert (= (and d!39606 (not c!7344)) b!123024))

(assert (= (and d!39606 res!101987) b!123022))

(assert (= (and b!123022 res!101989) b!123023))

(assert (= (and b!123023 res!101988) b!123020))

(assert (=> d!39606 m!187055))

(declare-fun m!187089 () Bool)

(assert (=> d!39606 m!187089))

(declare-fun m!187091 () Bool)

(assert (=> d!39606 m!187091))

(declare-fun m!187093 () Bool)

(assert (=> d!39606 m!187093))

(declare-fun m!187095 () Bool)

(assert (=> d!39606 m!187095))

(declare-fun m!187097 () Bool)

(assert (=> d!39606 m!187097))

(declare-fun m!187099 () Bool)

(assert (=> d!39606 m!187099))

(declare-fun m!187101 () Bool)

(assert (=> d!39606 m!187101))

(declare-fun m!187103 () Bool)

(assert (=> d!39606 m!187103))

(assert (=> d!39606 m!187073))

(assert (=> d!39606 m!186615))

(declare-fun m!187105 () Bool)

(assert (=> b!123020 m!187105))

(assert (=> b!123020 m!186577))

(assert (=> b!123020 m!186569))

(declare-fun m!187107 () Bool)

(assert (=> b!123022 m!187107))

(declare-fun m!187109 () Bool)

(assert (=> b!123023 m!187109))

(assert (=> b!123021 m!186569))

(declare-fun m!187111 () Bool)

(assert (=> b!123021 m!187111))

(declare-fun m!187113 () Bool)

(assert (=> b!123021 m!187113))

(assert (=> b!122788 d!39606))

(declare-fun d!39608 () Bool)

(declare-fun lt!193954 () tuple2!10410)

(assert (=> d!39608 (= lt!193954 (readNLeastSignificantBitsLoop!0 (_1!5463 lt!193304) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!193302))))

(assert (=> d!39608 (= (readNLeastSignificantBitsLoopPure!0 (_1!5463 lt!193304) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!193302) (tuple2!10395 (_2!5470 lt!193954) (_1!5470 lt!193954)))))

(declare-fun bs!9589 () Bool)

(assert (= bs!9589 d!39608))

(declare-fun m!187115 () Bool)

(assert (=> bs!9589 m!187115))

(assert (=> b!122788 d!39608))

(declare-fun d!39610 () Bool)

(assert (=> d!39610 (validate_offset_bits!1 ((_ sign_extend 32) (size!2459 (buf!2899 (_2!5461 lt!193308)))) ((_ sign_extend 32) (currentByte!5596 thiss!1305)) ((_ sign_extend 32) (currentBit!5591 thiss!1305)) lt!193313)))

(declare-fun lt!193955 () Unit!7557)

(assert (=> d!39610 (= lt!193955 (choose!9 thiss!1305 (buf!2899 (_2!5461 lt!193308)) lt!193313 (BitStream!4393 (buf!2899 (_2!5461 lt!193308)) (currentByte!5596 thiss!1305) (currentBit!5591 thiss!1305))))))

(assert (=> d!39610 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2899 (_2!5461 lt!193308)) lt!193313) lt!193955)))

(declare-fun bs!9590 () Bool)

(assert (= bs!9590 d!39610))

(assert (=> bs!9590 m!186601))

(declare-fun m!187117 () Bool)

(assert (=> bs!9590 m!187117))

(assert (=> b!122788 d!39610))

(declare-fun d!39612 () Bool)

(declare-fun e!80643 () Bool)

(assert (=> d!39612 e!80643))

(declare-fun res!101991 () Bool)

(assert (=> d!39612 (=> (not res!101991) (not e!80643))))

(declare-fun lt!193956 () (_ BitVec 64))

(declare-fun lt!193959 () (_ BitVec 64))

(declare-fun lt!193960 () (_ BitVec 64))

(assert (=> d!39612 (= res!101991 (= lt!193956 (bvsub lt!193960 lt!193959)))))

(assert (=> d!39612 (or (= (bvand lt!193960 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!193959 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!193960 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!193960 lt!193959) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39612 (= lt!193959 (remainingBits!0 ((_ sign_extend 32) (size!2459 (buf!2899 (_1!5464 lt!193297)))) ((_ sign_extend 32) (currentByte!5596 (_1!5464 lt!193297))) ((_ sign_extend 32) (currentBit!5591 (_1!5464 lt!193297)))))))

(declare-fun lt!193961 () (_ BitVec 64))

(declare-fun lt!193958 () (_ BitVec 64))

(assert (=> d!39612 (= lt!193960 (bvmul lt!193961 lt!193958))))

(assert (=> d!39612 (or (= lt!193961 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!193958 (bvsdiv (bvmul lt!193961 lt!193958) lt!193961)))))

(assert (=> d!39612 (= lt!193958 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!39612 (= lt!193961 ((_ sign_extend 32) (size!2459 (buf!2899 (_1!5464 lt!193297)))))))

(assert (=> d!39612 (= lt!193956 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5596 (_1!5464 lt!193297))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5591 (_1!5464 lt!193297)))))))

(assert (=> d!39612 (invariant!0 (currentBit!5591 (_1!5464 lt!193297)) (currentByte!5596 (_1!5464 lt!193297)) (size!2459 (buf!2899 (_1!5464 lt!193297))))))

(assert (=> d!39612 (= (bitIndex!0 (size!2459 (buf!2899 (_1!5464 lt!193297))) (currentByte!5596 (_1!5464 lt!193297)) (currentBit!5591 (_1!5464 lt!193297))) lt!193956)))

(declare-fun b!123025 () Bool)

(declare-fun res!101990 () Bool)

(assert (=> b!123025 (=> (not res!101990) (not e!80643))))

(assert (=> b!123025 (= res!101990 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!193956))))

(declare-fun b!123026 () Bool)

(declare-fun lt!193957 () (_ BitVec 64))

(assert (=> b!123026 (= e!80643 (bvsle lt!193956 (bvmul lt!193957 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123026 (or (= lt!193957 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!193957 #b0000000000000000000000000000000000000000000000000000000000001000) lt!193957)))))

(assert (=> b!123026 (= lt!193957 ((_ sign_extend 32) (size!2459 (buf!2899 (_1!5464 lt!193297)))))))

(assert (= (and d!39612 res!101991) b!123025))

(assert (= (and b!123025 res!101990) b!123026))

(declare-fun m!187119 () Bool)

(assert (=> d!39612 m!187119))

(declare-fun m!187121 () Bool)

(assert (=> d!39612 m!187121))

(assert (=> b!122788 d!39612))

(declare-fun d!39614 () Bool)

(assert (=> d!39614 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5591 thiss!1305) (currentByte!5596 thiss!1305) (size!2459 (buf!2899 thiss!1305))))))

(declare-fun bs!9591 () Bool)

(assert (= bs!9591 d!39614))

(assert (=> bs!9591 m!186719))

(assert (=> start!24184 d!39614))

(declare-fun d!39616 () Bool)

(declare-fun e!80646 () Bool)

(assert (=> d!39616 e!80646))

(declare-fun res!101994 () Bool)

(assert (=> d!39616 (=> (not res!101994) (not e!80646))))

(declare-fun lt!193966 () BitStream!4392)

(declare-fun lt!193967 () (_ BitVec 64))

(assert (=> d!39616 (= res!101994 (= (bvadd lt!193967 (bvsub lt!193314 lt!193316)) (bitIndex!0 (size!2459 (buf!2899 lt!193966)) (currentByte!5596 lt!193966) (currentBit!5591 lt!193966))))))

(assert (=> d!39616 (or (not (= (bvand lt!193967 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!193314 lt!193316) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!193967 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!193967 (bvsub lt!193314 lt!193316)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39616 (= lt!193967 (bitIndex!0 (size!2459 (buf!2899 (_2!5463 lt!193305))) (currentByte!5596 (_2!5463 lt!193305)) (currentBit!5591 (_2!5463 lt!193305))))))

(declare-fun moveBitIndex!0 (BitStream!4392 (_ BitVec 64)) tuple2!10392)

(assert (=> d!39616 (= lt!193966 (_2!5461 (moveBitIndex!0 (_2!5463 lt!193305) (bvsub lt!193314 lt!193316))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!4392 (_ BitVec 64)) Bool)

(assert (=> d!39616 (moveBitIndexPrecond!0 (_2!5463 lt!193305) (bvsub lt!193314 lt!193316))))

(assert (=> d!39616 (= (withMovedBitIndex!0 (_2!5463 lt!193305) (bvsub lt!193314 lt!193316)) lt!193966)))

(declare-fun b!123029 () Bool)

(assert (=> b!123029 (= e!80646 (= (size!2459 (buf!2899 (_2!5463 lt!193305))) (size!2459 (buf!2899 lt!193966))))))

(assert (= (and d!39616 res!101994) b!123029))

(declare-fun m!187123 () Bool)

(assert (=> d!39616 m!187123))

(declare-fun m!187125 () Bool)

(assert (=> d!39616 m!187125))

(declare-fun m!187127 () Bool)

(assert (=> d!39616 m!187127))

(declare-fun m!187129 () Bool)

(assert (=> d!39616 m!187129))

(assert (=> b!122796 d!39616))

(declare-fun d!39618 () Bool)

(declare-fun lt!193968 () tuple2!10410)

(assert (=> d!39618 (= lt!193968 (readNLeastSignificantBitsLoop!0 lt!193295 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!193302))))

(assert (=> d!39618 (= (readNLeastSignificantBitsLoopPure!0 lt!193295 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!193302) (tuple2!10395 (_2!5470 lt!193968) (_1!5470 lt!193968)))))

(declare-fun bs!9592 () Bool)

(assert (= bs!9592 d!39618))

(declare-fun m!187131 () Bool)

(assert (=> bs!9592 m!187131))

(assert (=> b!122796 d!39618))

(assert (=> b!122796 d!39462))

(declare-fun d!39620 () Bool)

(declare-fun e!80647 () Bool)

(assert (=> d!39620 e!80647))

(declare-fun res!101995 () Bool)

(assert (=> d!39620 (=> (not res!101995) (not e!80647))))

(declare-fun lt!193970 () (_ BitVec 64))

(declare-fun lt!193969 () BitStream!4392)

(assert (=> d!39620 (= res!101995 (= (bvadd lt!193970 (bvsub lt!193312 lt!193316)) (bitIndex!0 (size!2459 (buf!2899 lt!193969)) (currentByte!5596 lt!193969) (currentBit!5591 lt!193969))))))

(assert (=> d!39620 (or (not (= (bvand lt!193970 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!193312 lt!193316) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!193970 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!193970 (bvsub lt!193312 lt!193316)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39620 (= lt!193970 (bitIndex!0 (size!2459 (buf!2899 (_2!5463 lt!193304))) (currentByte!5596 (_2!5463 lt!193304)) (currentBit!5591 (_2!5463 lt!193304))))))

(assert (=> d!39620 (= lt!193969 (_2!5461 (moveBitIndex!0 (_2!5463 lt!193304) (bvsub lt!193312 lt!193316))))))

(assert (=> d!39620 (moveBitIndexPrecond!0 (_2!5463 lt!193304) (bvsub lt!193312 lt!193316))))

(assert (=> d!39620 (= (withMovedBitIndex!0 (_2!5463 lt!193304) (bvsub lt!193312 lt!193316)) lt!193969)))

(declare-fun b!123030 () Bool)

(assert (=> b!123030 (= e!80647 (= (size!2459 (buf!2899 (_2!5463 lt!193304))) (size!2459 (buf!2899 lt!193969))))))

(assert (= (and d!39620 res!101995) b!123030))

(declare-fun m!187133 () Bool)

(assert (=> d!39620 m!187133))

(declare-fun m!187135 () Bool)

(assert (=> d!39620 m!187135))

(declare-fun m!187137 () Bool)

(assert (=> d!39620 m!187137))

(declare-fun m!187139 () Bool)

(assert (=> d!39620 m!187139))

(assert (=> b!122796 d!39620))

(declare-fun d!39622 () Bool)

(declare-fun e!80648 () Bool)

(assert (=> d!39622 e!80648))

(declare-fun res!101996 () Bool)

(assert (=> d!39622 (=> (not res!101996) (not e!80648))))

(declare-fun lt!193972 () (_ BitVec 64))

(declare-fun lt!193971 () BitStream!4392)

(assert (=> d!39622 (= res!101996 (= (bvadd lt!193972 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!2459 (buf!2899 lt!193971)) (currentByte!5596 lt!193971) (currentBit!5591 lt!193971))))))

(assert (=> d!39622 (or (not (= (bvand lt!193972 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!193972 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!193972 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39622 (= lt!193972 (bitIndex!0 (size!2459 (buf!2899 (_1!5463 lt!193305))) (currentByte!5596 (_1!5463 lt!193305)) (currentBit!5591 (_1!5463 lt!193305))))))

(assert (=> d!39622 (= lt!193971 (_2!5461 (moveBitIndex!0 (_1!5463 lt!193305) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!39622 (moveBitIndexPrecond!0 (_1!5463 lt!193305) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!39622 (= (withMovedBitIndex!0 (_1!5463 lt!193305) #b0000000000000000000000000000000000000000000000000000000000000001) lt!193971)))

(declare-fun b!123031 () Bool)

(assert (=> b!123031 (= e!80648 (= (size!2459 (buf!2899 (_1!5463 lt!193305))) (size!2459 (buf!2899 lt!193971))))))

(assert (= (and d!39622 res!101996) b!123031))

(declare-fun m!187141 () Bool)

(assert (=> d!39622 m!187141))

(declare-fun m!187143 () Bool)

(assert (=> d!39622 m!187143))

(declare-fun m!187145 () Bool)

(assert (=> d!39622 m!187145))

(declare-fun m!187147 () Bool)

(assert (=> d!39622 m!187147))

(assert (=> b!122796 d!39622))

(assert (=> b!122796 d!39464))

(declare-fun d!39624 () Bool)

(declare-fun lt!193990 () tuple2!10394)

(declare-fun lt!193989 () tuple2!10394)

(assert (=> d!39624 (and (= (_2!5462 lt!193990) (_2!5462 lt!193989)) (= (_1!5462 lt!193990) (_1!5462 lt!193989)))))

(declare-fun lt!193988 () BitStream!4392)

(declare-fun lt!193986 () Unit!7557)

(declare-fun lt!193985 () (_ BitVec 64))

(declare-fun lt!193987 () Bool)

(declare-fun choose!45 (BitStream!4392 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!10394 tuple2!10394 BitStream!4392 (_ BitVec 64) Bool BitStream!4392 (_ BitVec 64) tuple2!10394 tuple2!10394 BitStream!4392 (_ BitVec 64)) Unit!7557)

(assert (=> d!39624 (= lt!193986 (choose!45 (_1!5463 lt!193305) nBits!396 i!615 lt!193309 lt!193990 (tuple2!10395 (_1!5462 lt!193990) (_2!5462 lt!193990)) (_1!5462 lt!193990) (_2!5462 lt!193990) lt!193987 lt!193988 lt!193985 lt!193989 (tuple2!10395 (_1!5462 lt!193989) (_2!5462 lt!193989)) (_1!5462 lt!193989) (_2!5462 lt!193989)))))

(assert (=> d!39624 (= lt!193989 (readNLeastSignificantBitsLoopPure!0 lt!193988 nBits!396 (bvadd i!615 #b00000000000000000000000000000001) lt!193985))))

(assert (=> d!39624 (= lt!193985 (bvor lt!193309 (ite lt!193987 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39624 (= lt!193988 (withMovedBitIndex!0 (_1!5463 lt!193305) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!39624 (= lt!193987 (_2!5464 (readBitPure!0 (_1!5463 lt!193305))))))

(assert (=> d!39624 (= lt!193990 (readNLeastSignificantBitsLoopPure!0 (_1!5463 lt!193305) nBits!396 i!615 lt!193309))))

(assert (=> d!39624 (= (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5463 lt!193305) nBits!396 i!615 lt!193309) lt!193986)))

(declare-fun bs!9594 () Bool)

(assert (= bs!9594 d!39624))

(assert (=> bs!9594 m!186621))

(assert (=> bs!9594 m!186595))

(assert (=> bs!9594 m!186579))

(declare-fun m!187149 () Bool)

(assert (=> bs!9594 m!187149))

(declare-fun m!187151 () Bool)

(assert (=> bs!9594 m!187151))

(assert (=> b!122796 d!39624))

(declare-fun d!39626 () Bool)

(declare-fun e!80649 () Bool)

(assert (=> d!39626 e!80649))

(declare-fun res!101998 () Bool)

(assert (=> d!39626 (=> (not res!101998) (not e!80649))))

(declare-fun lt!193994 () (_ BitVec 64))

(declare-fun lt!193991 () (_ BitVec 64))

(declare-fun lt!193995 () (_ BitVec 64))

(assert (=> d!39626 (= res!101998 (= lt!193991 (bvsub lt!193995 lt!193994)))))

(assert (=> d!39626 (or (= (bvand lt!193995 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!193994 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!193995 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!193995 lt!193994) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39626 (= lt!193994 (remainingBits!0 ((_ sign_extend 32) (size!2459 (buf!2899 (_2!5461 lt!193308)))) ((_ sign_extend 32) (currentByte!5596 (_2!5461 lt!193308))) ((_ sign_extend 32) (currentBit!5591 (_2!5461 lt!193308)))))))

(declare-fun lt!193996 () (_ BitVec 64))

(declare-fun lt!193993 () (_ BitVec 64))

(assert (=> d!39626 (= lt!193995 (bvmul lt!193996 lt!193993))))

(assert (=> d!39626 (or (= lt!193996 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!193993 (bvsdiv (bvmul lt!193996 lt!193993) lt!193996)))))

(assert (=> d!39626 (= lt!193993 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!39626 (= lt!193996 ((_ sign_extend 32) (size!2459 (buf!2899 (_2!5461 lt!193308)))))))

(assert (=> d!39626 (= lt!193991 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5596 (_2!5461 lt!193308))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5591 (_2!5461 lt!193308)))))))

(assert (=> d!39626 (invariant!0 (currentBit!5591 (_2!5461 lt!193308)) (currentByte!5596 (_2!5461 lt!193308)) (size!2459 (buf!2899 (_2!5461 lt!193308))))))

(assert (=> d!39626 (= (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193308))) (currentByte!5596 (_2!5461 lt!193308)) (currentBit!5591 (_2!5461 lt!193308))) lt!193991)))

(declare-fun b!123032 () Bool)

(declare-fun res!101997 () Bool)

(assert (=> b!123032 (=> (not res!101997) (not e!80649))))

(assert (=> b!123032 (= res!101997 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!193991))))

(declare-fun b!123033 () Bool)

(declare-fun lt!193992 () (_ BitVec 64))

(assert (=> b!123033 (= e!80649 (bvsle lt!193991 (bvmul lt!193992 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123033 (or (= lt!193992 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!193992 #b0000000000000000000000000000000000000000000000000000000000001000) lt!193992)))))

(assert (=> b!123033 (= lt!193992 ((_ sign_extend 32) (size!2459 (buf!2899 (_2!5461 lt!193308)))))))

(assert (= (and d!39626 res!101998) b!123032))

(assert (= (and b!123032 res!101997) b!123033))

(declare-fun m!187153 () Bool)

(assert (=> d!39626 m!187153))

(declare-fun m!187155 () Bool)

(assert (=> d!39626 m!187155))

(assert (=> b!122796 d!39626))

(declare-fun d!39628 () Bool)

(assert (=> d!39628 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2459 (buf!2899 thiss!1305))) ((_ sign_extend 32) (currentByte!5596 thiss!1305)) ((_ sign_extend 32) (currentBit!5591 thiss!1305)) lt!193313) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2459 (buf!2899 thiss!1305))) ((_ sign_extend 32) (currentByte!5596 thiss!1305)) ((_ sign_extend 32) (currentBit!5591 thiss!1305))) lt!193313))))

(declare-fun bs!9595 () Bool)

(assert (= bs!9595 d!39628))

(assert (=> bs!9595 m!186717))

(assert (=> b!122785 d!39628))

(declare-fun d!39630 () Bool)

(declare-fun e!80650 () Bool)

(assert (=> d!39630 e!80650))

(declare-fun res!102000 () Bool)

(assert (=> d!39630 (=> (not res!102000) (not e!80650))))

(declare-fun lt!193997 () (_ BitVec 64))

(declare-fun lt!194001 () (_ BitVec 64))

(declare-fun lt!194000 () (_ BitVec 64))

(assert (=> d!39630 (= res!102000 (= lt!193997 (bvsub lt!194001 lt!194000)))))

(assert (=> d!39630 (or (= (bvand lt!194001 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!194000 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!194001 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!194001 lt!194000) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39630 (= lt!194000 (remainingBits!0 ((_ sign_extend 32) (size!2459 (buf!2899 (_1!5464 lt!193296)))) ((_ sign_extend 32) (currentByte!5596 (_1!5464 lt!193296))) ((_ sign_extend 32) (currentBit!5591 (_1!5464 lt!193296)))))))

(declare-fun lt!194002 () (_ BitVec 64))

(declare-fun lt!193999 () (_ BitVec 64))

(assert (=> d!39630 (= lt!194001 (bvmul lt!194002 lt!193999))))

(assert (=> d!39630 (or (= lt!194002 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!193999 (bvsdiv (bvmul lt!194002 lt!193999) lt!194002)))))

(assert (=> d!39630 (= lt!193999 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!39630 (= lt!194002 ((_ sign_extend 32) (size!2459 (buf!2899 (_1!5464 lt!193296)))))))

(assert (=> d!39630 (= lt!193997 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5596 (_1!5464 lt!193296))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5591 (_1!5464 lt!193296)))))))

(assert (=> d!39630 (invariant!0 (currentBit!5591 (_1!5464 lt!193296)) (currentByte!5596 (_1!5464 lt!193296)) (size!2459 (buf!2899 (_1!5464 lt!193296))))))

(assert (=> d!39630 (= (bitIndex!0 (size!2459 (buf!2899 (_1!5464 lt!193296))) (currentByte!5596 (_1!5464 lt!193296)) (currentBit!5591 (_1!5464 lt!193296))) lt!193997)))

(declare-fun b!123034 () Bool)

(declare-fun res!101999 () Bool)

(assert (=> b!123034 (=> (not res!101999) (not e!80650))))

(assert (=> b!123034 (= res!101999 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!193997))))

(declare-fun b!123035 () Bool)

(declare-fun lt!193998 () (_ BitVec 64))

(assert (=> b!123035 (= e!80650 (bvsle lt!193997 (bvmul lt!193998 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123035 (or (= lt!193998 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!193998 #b0000000000000000000000000000000000000000000000000000000000001000) lt!193998)))))

(assert (=> b!123035 (= lt!193998 ((_ sign_extend 32) (size!2459 (buf!2899 (_1!5464 lt!193296)))))))

(assert (= (and d!39630 res!102000) b!123034))

(assert (= (and b!123034 res!101999) b!123035))

(declare-fun m!187157 () Bool)

(assert (=> d!39630 m!187157))

(declare-fun m!187159 () Bool)

(assert (=> d!39630 m!187159))

(assert (=> b!122795 d!39630))

(declare-fun d!39632 () Bool)

(assert (=> d!39632 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!122797 d!39632))

(declare-fun d!39634 () Bool)

(assert (=> d!39634 (= (invariant!0 (currentBit!5591 thiss!1305) (currentByte!5596 thiss!1305) (size!2459 (buf!2899 (_2!5461 lt!193323)))) (and (bvsge (currentBit!5591 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5591 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5596 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5596 thiss!1305) (size!2459 (buf!2899 (_2!5461 lt!193323)))) (and (= (currentBit!5591 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5596 thiss!1305) (size!2459 (buf!2899 (_2!5461 lt!193323))))))))))

(assert (=> b!122786 d!39634))

(check-sat (not d!39602) (not b!122976) (not b!123017) (not b!123018) (not bm!1598) (not b!123021) (not b!123002) (not d!39620) (not d!39614) (not d!39606) (not d!39608) (not d!39610) (not b!122979) (not d!39616) (not b!123015) (not d!39630) (not b!123004) (not d!39474) (not d!39478) (not b!122856) (not b!123022) (not d!39618) (not d!39480) (not d!39464) (not b!122982) (not d!39482) (not d!39604) (not b!122977) (not d!39472) (not b!122983) (not d!39598) (not d!39628) (not b!123023) (not d!39600) (not d!39612) (not d!39622) (not d!39476) (not b!122980) (not d!39462) (not b!122974) (not d!39484) (not d!39590) (not d!39624) (not b!123016) (not b!122975) (not b!122986) (not d!39486) (not d!39626) (not b!122981) (not b!122854) (not b!122984) (not b!122988) (not b!123020) (not d!39594) (not b!122859) (not b!123001) (not b!123003))
(check-sat)
(get-model)

(declare-fun d!39684 () Bool)

(declare-fun e!80731 () Bool)

(assert (=> d!39684 e!80731))

(declare-fun res!102108 () Bool)

(assert (=> d!39684 (=> (not res!102108) (not e!80731))))

(declare-fun increaseBitIndex!0 (BitStream!4392) tuple2!10392)

(assert (=> d!39684 (= res!102108 (= (buf!2899 (_2!5461 (increaseBitIndex!0 (_1!5463 lt!193305)))) (buf!2899 (_1!5463 lt!193305))))))

(declare-fun lt!194429 () Bool)

(assert (=> d!39684 (= lt!194429 (not (= (bvand ((_ sign_extend 24) (select (arr!3052 (buf!2899 (_1!5463 lt!193305))) (currentByte!5596 (_1!5463 lt!193305)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5591 (_1!5463 lt!193305))))) #b00000000000000000000000000000000)))))

(declare-fun lt!194425 () tuple2!10408)

(assert (=> d!39684 (= lt!194425 (tuple2!10409 (not (= (bvand ((_ sign_extend 24) (select (arr!3052 (buf!2899 (_1!5463 lt!193305))) (currentByte!5596 (_1!5463 lt!193305)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5591 (_1!5463 lt!193305))))) #b00000000000000000000000000000000)) (_2!5461 (increaseBitIndex!0 (_1!5463 lt!193305)))))))

(assert (=> d!39684 (validate_offset_bit!0 ((_ sign_extend 32) (size!2459 (buf!2899 (_1!5463 lt!193305)))) ((_ sign_extend 32) (currentByte!5596 (_1!5463 lt!193305))) ((_ sign_extend 32) (currentBit!5591 (_1!5463 lt!193305))))))

(assert (=> d!39684 (= (readBit!0 (_1!5463 lt!193305)) lt!194425)))

(declare-fun b!123175 () Bool)

(declare-fun lt!194430 () (_ BitVec 64))

(declare-fun lt!194424 () (_ BitVec 64))

(assert (=> b!123175 (= e!80731 (= (bitIndex!0 (size!2459 (buf!2899 (_2!5461 (increaseBitIndex!0 (_1!5463 lt!193305))))) (currentByte!5596 (_2!5461 (increaseBitIndex!0 (_1!5463 lt!193305)))) (currentBit!5591 (_2!5461 (increaseBitIndex!0 (_1!5463 lt!193305))))) (bvadd lt!194430 lt!194424)))))

(assert (=> b!123175 (or (not (= (bvand lt!194430 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!194424 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!194430 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!194430 lt!194424) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!123175 (= lt!194424 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!123175 (= lt!194430 (bitIndex!0 (size!2459 (buf!2899 (_1!5463 lt!193305))) (currentByte!5596 (_1!5463 lt!193305)) (currentBit!5591 (_1!5463 lt!193305))))))

(declare-fun lt!194428 () Bool)

(assert (=> b!123175 (= lt!194428 (not (= (bvand ((_ sign_extend 24) (select (arr!3052 (buf!2899 (_1!5463 lt!193305))) (currentByte!5596 (_1!5463 lt!193305)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5591 (_1!5463 lt!193305))))) #b00000000000000000000000000000000)))))

(declare-fun lt!194427 () Bool)

(assert (=> b!123175 (= lt!194427 (not (= (bvand ((_ sign_extend 24) (select (arr!3052 (buf!2899 (_1!5463 lt!193305))) (currentByte!5596 (_1!5463 lt!193305)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5591 (_1!5463 lt!193305))))) #b00000000000000000000000000000000)))))

(declare-fun lt!194426 () Bool)

(assert (=> b!123175 (= lt!194426 (not (= (bvand ((_ sign_extend 24) (select (arr!3052 (buf!2899 (_1!5463 lt!193305))) (currentByte!5596 (_1!5463 lt!193305)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5591 (_1!5463 lt!193305))))) #b00000000000000000000000000000000)))))

(assert (= (and d!39684 res!102108) b!123175))

(declare-fun m!187445 () Bool)

(assert (=> d!39684 m!187445))

(declare-fun m!187447 () Bool)

(assert (=> d!39684 m!187447))

(declare-fun m!187449 () Bool)

(assert (=> d!39684 m!187449))

(declare-fun m!187451 () Bool)

(assert (=> d!39684 m!187451))

(assert (=> b!123175 m!187143))

(assert (=> b!123175 m!187445))

(assert (=> b!123175 m!187447))

(declare-fun m!187453 () Bool)

(assert (=> b!123175 m!187453))

(assert (=> b!123175 m!187449))

(assert (=> d!39486 d!39684))

(declare-fun d!39686 () Bool)

(declare-fun e!80732 () Bool)

(assert (=> d!39686 e!80732))

(declare-fun res!102109 () Bool)

(assert (=> d!39686 (=> (not res!102109) (not e!80732))))

(declare-fun lt!194432 () (_ BitVec 64))

(declare-fun lt!194431 () BitStream!4392)

(assert (=> d!39686 (= res!102109 (= (bvadd lt!194432 (bvsub lt!193944 lt!193949)) (bitIndex!0 (size!2459 (buf!2899 lt!194431)) (currentByte!5596 lt!194431) (currentBit!5591 lt!194431))))))

(assert (=> d!39686 (or (not (= (bvand lt!194432 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!193944 lt!193949) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!194432 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!194432 (bvsub lt!193944 lt!193949)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39686 (= lt!194432 (bitIndex!0 (size!2459 (buf!2899 (_2!5463 lt!193943))) (currentByte!5596 (_2!5463 lt!193943)) (currentBit!5591 (_2!5463 lt!193943))))))

(assert (=> d!39686 (= lt!194431 (_2!5461 (moveBitIndex!0 (_2!5463 lt!193943) (bvsub lt!193944 lt!193949))))))

(assert (=> d!39686 (moveBitIndexPrecond!0 (_2!5463 lt!193943) (bvsub lt!193944 lt!193949))))

(assert (=> d!39686 (= (withMovedBitIndex!0 (_2!5463 lt!193943) (bvsub lt!193944 lt!193949)) lt!194431)))

(declare-fun b!123176 () Bool)

(assert (=> b!123176 (= e!80732 (= (size!2459 (buf!2899 (_2!5463 lt!193943))) (size!2459 (buf!2899 lt!194431))))))

(assert (= (and d!39686 res!102109) b!123176))

(declare-fun m!187455 () Bool)

(assert (=> d!39686 m!187455))

(declare-fun m!187457 () Bool)

(assert (=> d!39686 m!187457))

(declare-fun m!187459 () Bool)

(assert (=> d!39686 m!187459))

(declare-fun m!187461 () Bool)

(assert (=> d!39686 m!187461))

(assert (=> b!123020 d!39686))

(assert (=> b!123020 d!39626))

(assert (=> b!123020 d!39464))

(assert (=> d!39610 d!39482))

(declare-fun d!39688 () Bool)

(assert (=> d!39688 (validate_offset_bits!1 ((_ sign_extend 32) (size!2459 (buf!2899 (_2!5461 lt!193308)))) ((_ sign_extend 32) (currentByte!5596 thiss!1305)) ((_ sign_extend 32) (currentBit!5591 thiss!1305)) lt!193313)))

(assert (=> d!39688 true))

(declare-fun _$6!256 () Unit!7557)

(assert (=> d!39688 (= (choose!9 thiss!1305 (buf!2899 (_2!5461 lt!193308)) lt!193313 (BitStream!4393 (buf!2899 (_2!5461 lt!193308)) (currentByte!5596 thiss!1305) (currentBit!5591 thiss!1305))) _$6!256)))

(declare-fun bs!9605 () Bool)

(assert (= bs!9605 d!39688))

(assert (=> bs!9605 m!186601))

(assert (=> d!39610 d!39688))

(declare-fun d!39690 () Bool)

(assert (=> d!39690 (= (invariant!0 (currentBit!5591 (_2!5461 lt!193323)) (currentByte!5596 (_2!5461 lt!193323)) (size!2459 (buf!2899 (_2!5461 lt!193323)))) (and (bvsge (currentBit!5591 (_2!5461 lt!193323)) #b00000000000000000000000000000000) (bvslt (currentBit!5591 (_2!5461 lt!193323)) #b00000000000000000000000000001000) (bvsge (currentByte!5596 (_2!5461 lt!193323)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5596 (_2!5461 lt!193323)) (size!2459 (buf!2899 (_2!5461 lt!193323)))) (and (= (currentBit!5591 (_2!5461 lt!193323)) #b00000000000000000000000000000000) (= (currentByte!5596 (_2!5461 lt!193323)) (size!2459 (buf!2899 (_2!5461 lt!193323))))))))))

(assert (=> d!39474 d!39690))

(declare-fun d!39692 () Bool)

(assert (=> d!39692 (= (invariant!0 (currentBit!5591 thiss!1305) (currentByte!5596 thiss!1305) (size!2459 (buf!2899 thiss!1305))) (and (bvsge (currentBit!5591 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5591 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5596 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5596 thiss!1305) (size!2459 (buf!2899 thiss!1305))) (and (= (currentBit!5591 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5596 thiss!1305) (size!2459 (buf!2899 thiss!1305)))))))))

(assert (=> d!39614 d!39692))

(declare-fun d!39694 () Bool)

(assert (=> d!39694 (= (remainingBits!0 ((_ sign_extend 32) (size!2459 (buf!2899 (_2!5461 lt!193308)))) ((_ sign_extend 32) (currentByte!5596 (_2!5461 lt!193323))) ((_ sign_extend 32) (currentBit!5591 (_2!5461 lt!193323)))) (bvsub (bvmul ((_ sign_extend 32) (size!2459 (buf!2899 (_2!5461 lt!193308)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5596 (_2!5461 lt!193323))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5591 (_2!5461 lt!193323))))))))

(assert (=> d!39480 d!39694))

(declare-fun d!39696 () Bool)

(assert (=> d!39696 (isPrefixOf!0 lt!193950 (_2!5461 lt!193308))))

(declare-fun lt!194433 () Unit!7557)

(assert (=> d!39696 (= lt!194433 (choose!30 lt!193950 thiss!1305 (_2!5461 lt!193308)))))

(assert (=> d!39696 (isPrefixOf!0 lt!193950 thiss!1305)))

(assert (=> d!39696 (= (lemmaIsPrefixTransitive!0 lt!193950 thiss!1305 (_2!5461 lt!193308)) lt!194433)))

(declare-fun bs!9606 () Bool)

(assert (= bs!9606 d!39696))

(assert (=> bs!9606 m!187091))

(declare-fun m!187463 () Bool)

(assert (=> bs!9606 m!187463))

(declare-fun m!187465 () Bool)

(assert (=> bs!9606 m!187465))

(assert (=> d!39606 d!39696))

(declare-fun d!39698 () Bool)

(assert (=> d!39698 (isPrefixOf!0 thiss!1305 thiss!1305)))

(declare-fun lt!194436 () Unit!7557)

(declare-fun choose!11 (BitStream!4392) Unit!7557)

(assert (=> d!39698 (= lt!194436 (choose!11 thiss!1305))))

(assert (=> d!39698 (= (lemmaIsPrefixRefl!0 thiss!1305) lt!194436)))

(declare-fun bs!9608 () Bool)

(assert (= bs!9608 d!39698))

(assert (=> bs!9608 m!187097))

(declare-fun m!187467 () Bool)

(assert (=> bs!9608 m!187467))

(assert (=> d!39606 d!39698))

(declare-fun d!39700 () Bool)

(assert (=> d!39700 (isPrefixOf!0 lt!193950 (_2!5461 lt!193308))))

(declare-fun lt!194437 () Unit!7557)

(assert (=> d!39700 (= lt!194437 (choose!30 lt!193950 (_2!5461 lt!193308) (_2!5461 lt!193308)))))

(assert (=> d!39700 (isPrefixOf!0 lt!193950 (_2!5461 lt!193308))))

(assert (=> d!39700 (= (lemmaIsPrefixTransitive!0 lt!193950 (_2!5461 lt!193308) (_2!5461 lt!193308)) lt!194437)))

(declare-fun bs!9609 () Bool)

(assert (= bs!9609 d!39700))

(assert (=> bs!9609 m!187091))

(declare-fun m!187469 () Bool)

(assert (=> bs!9609 m!187469))

(assert (=> bs!9609 m!187091))

(assert (=> d!39606 d!39700))

(declare-fun d!39702 () Bool)

(declare-fun res!102112 () Bool)

(declare-fun e!80734 () Bool)

(assert (=> d!39702 (=> (not res!102112) (not e!80734))))

(assert (=> d!39702 (= res!102112 (= (size!2459 (buf!2899 (_1!5463 lt!193943))) (size!2459 (buf!2899 (_2!5463 lt!193943)))))))

(assert (=> d!39702 (= (isPrefixOf!0 (_1!5463 lt!193943) (_2!5463 lt!193943)) e!80734)))

(declare-fun b!123177 () Bool)

(declare-fun res!102110 () Bool)

(assert (=> b!123177 (=> (not res!102110) (not e!80734))))

(assert (=> b!123177 (= res!102110 (bvsle (bitIndex!0 (size!2459 (buf!2899 (_1!5463 lt!193943))) (currentByte!5596 (_1!5463 lt!193943)) (currentBit!5591 (_1!5463 lt!193943))) (bitIndex!0 (size!2459 (buf!2899 (_2!5463 lt!193943))) (currentByte!5596 (_2!5463 lt!193943)) (currentBit!5591 (_2!5463 lt!193943)))))))

(declare-fun b!123178 () Bool)

(declare-fun e!80733 () Bool)

(assert (=> b!123178 (= e!80734 e!80733)))

(declare-fun res!102111 () Bool)

(assert (=> b!123178 (=> res!102111 e!80733)))

(assert (=> b!123178 (= res!102111 (= (size!2459 (buf!2899 (_1!5463 lt!193943))) #b00000000000000000000000000000000))))

(declare-fun b!123179 () Bool)

(assert (=> b!123179 (= e!80733 (arrayBitRangesEq!0 (buf!2899 (_1!5463 lt!193943)) (buf!2899 (_2!5463 lt!193943)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2459 (buf!2899 (_1!5463 lt!193943))) (currentByte!5596 (_1!5463 lt!193943)) (currentBit!5591 (_1!5463 lt!193943)))))))

(assert (= (and d!39702 res!102112) b!123177))

(assert (= (and b!123177 res!102110) b!123178))

(assert (= (and b!123178 (not res!102111)) b!123179))

(declare-fun m!187471 () Bool)

(assert (=> b!123177 m!187471))

(assert (=> b!123177 m!187457))

(assert (=> b!123179 m!187471))

(assert (=> b!123179 m!187471))

(declare-fun m!187473 () Bool)

(assert (=> b!123179 m!187473))

(assert (=> d!39606 d!39702))

(declare-fun d!39704 () Bool)

(assert (=> d!39704 (isPrefixOf!0 (_2!5461 lt!193308) (_2!5461 lt!193308))))

(declare-fun lt!194438 () Unit!7557)

(assert (=> d!39704 (= lt!194438 (choose!11 (_2!5461 lt!193308)))))

(assert (=> d!39704 (= (lemmaIsPrefixRefl!0 (_2!5461 lt!193308)) lt!194438)))

(declare-fun bs!9610 () Bool)

(assert (= bs!9610 d!39704))

(assert (=> bs!9610 m!187073))

(declare-fun m!187475 () Bool)

(assert (=> bs!9610 m!187475))

(assert (=> d!39606 d!39704))

(declare-fun d!39706 () Bool)

(declare-fun res!102115 () Bool)

(declare-fun e!80736 () Bool)

(assert (=> d!39706 (=> (not res!102115) (not e!80736))))

(assert (=> d!39706 (= res!102115 (= (size!2459 (buf!2899 lt!193950)) (size!2459 (buf!2899 lt!193950))))))

(assert (=> d!39706 (= (isPrefixOf!0 lt!193950 lt!193950) e!80736)))

(declare-fun b!123180 () Bool)

(declare-fun res!102113 () Bool)

(assert (=> b!123180 (=> (not res!102113) (not e!80736))))

(assert (=> b!123180 (= res!102113 (bvsle (bitIndex!0 (size!2459 (buf!2899 lt!193950)) (currentByte!5596 lt!193950) (currentBit!5591 lt!193950)) (bitIndex!0 (size!2459 (buf!2899 lt!193950)) (currentByte!5596 lt!193950) (currentBit!5591 lt!193950))))))

(declare-fun b!123181 () Bool)

(declare-fun e!80735 () Bool)

(assert (=> b!123181 (= e!80736 e!80735)))

(declare-fun res!102114 () Bool)

(assert (=> b!123181 (=> res!102114 e!80735)))

(assert (=> b!123181 (= res!102114 (= (size!2459 (buf!2899 lt!193950)) #b00000000000000000000000000000000))))

(declare-fun b!123182 () Bool)

(assert (=> b!123182 (= e!80735 (arrayBitRangesEq!0 (buf!2899 lt!193950) (buf!2899 lt!193950) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2459 (buf!2899 lt!193950)) (currentByte!5596 lt!193950) (currentBit!5591 lt!193950))))))

(assert (= (and d!39706 res!102115) b!123180))

(assert (= (and b!123180 res!102113) b!123181))

(assert (= (and b!123181 (not res!102114)) b!123182))

(declare-fun m!187477 () Bool)

(assert (=> b!123180 m!187477))

(assert (=> b!123180 m!187477))

(assert (=> b!123182 m!187477))

(assert (=> b!123182 m!187477))

(declare-fun m!187479 () Bool)

(assert (=> b!123182 m!187479))

(assert (=> d!39606 d!39706))

(declare-fun d!39708 () Bool)

(declare-fun res!102118 () Bool)

(declare-fun e!80738 () Bool)

(assert (=> d!39708 (=> (not res!102118) (not e!80738))))

(assert (=> d!39708 (= res!102118 (= (size!2459 (buf!2899 thiss!1305)) (size!2459 (buf!2899 thiss!1305))))))

(assert (=> d!39708 (= (isPrefixOf!0 thiss!1305 thiss!1305) e!80738)))

(declare-fun b!123183 () Bool)

(declare-fun res!102116 () Bool)

(assert (=> b!123183 (=> (not res!102116) (not e!80738))))

(assert (=> b!123183 (= res!102116 (bvsle (bitIndex!0 (size!2459 (buf!2899 thiss!1305)) (currentByte!5596 thiss!1305) (currentBit!5591 thiss!1305)) (bitIndex!0 (size!2459 (buf!2899 thiss!1305)) (currentByte!5596 thiss!1305) (currentBit!5591 thiss!1305))))))

(declare-fun b!123184 () Bool)

(declare-fun e!80737 () Bool)

(assert (=> b!123184 (= e!80738 e!80737)))

(declare-fun res!102117 () Bool)

(assert (=> b!123184 (=> res!102117 e!80737)))

(assert (=> b!123184 (= res!102117 (= (size!2459 (buf!2899 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!123185 () Bool)

(assert (=> b!123185 (= e!80737 (arrayBitRangesEq!0 (buf!2899 thiss!1305) (buf!2899 thiss!1305) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2459 (buf!2899 thiss!1305)) (currentByte!5596 thiss!1305) (currentBit!5591 thiss!1305))))))

(assert (= (and d!39708 res!102118) b!123183))

(assert (= (and b!123183 res!102116) b!123184))

(assert (= (and b!123184 (not res!102117)) b!123185))

(assert (=> b!123183 m!186569))

(assert (=> b!123183 m!186569))

(assert (=> b!123185 m!186569))

(assert (=> b!123185 m!186569))

(declare-fun m!187481 () Bool)

(assert (=> b!123185 m!187481))

(assert (=> d!39606 d!39708))

(assert (=> d!39606 d!39592))

(declare-fun d!39710 () Bool)

(declare-fun res!102121 () Bool)

(declare-fun e!80740 () Bool)

(assert (=> d!39710 (=> (not res!102121) (not e!80740))))

(assert (=> d!39710 (= res!102121 (= (size!2459 (buf!2899 lt!193950)) (size!2459 (buf!2899 (_2!5461 lt!193308)))))))

(assert (=> d!39710 (= (isPrefixOf!0 lt!193950 (_2!5461 lt!193308)) e!80740)))

(declare-fun b!123186 () Bool)

(declare-fun res!102119 () Bool)

(assert (=> b!123186 (=> (not res!102119) (not e!80740))))

(assert (=> b!123186 (= res!102119 (bvsle (bitIndex!0 (size!2459 (buf!2899 lt!193950)) (currentByte!5596 lt!193950) (currentBit!5591 lt!193950)) (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193308))) (currentByte!5596 (_2!5461 lt!193308)) (currentBit!5591 (_2!5461 lt!193308)))))))

(declare-fun b!123187 () Bool)

(declare-fun e!80739 () Bool)

(assert (=> b!123187 (= e!80740 e!80739)))

(declare-fun res!102120 () Bool)

(assert (=> b!123187 (=> res!102120 e!80739)))

(assert (=> b!123187 (= res!102120 (= (size!2459 (buf!2899 lt!193950)) #b00000000000000000000000000000000))))

(declare-fun b!123188 () Bool)

(assert (=> b!123188 (= e!80739 (arrayBitRangesEq!0 (buf!2899 lt!193950) (buf!2899 (_2!5461 lt!193308)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2459 (buf!2899 lt!193950)) (currentByte!5596 lt!193950) (currentBit!5591 lt!193950))))))

(assert (= (and d!39710 res!102121) b!123186))

(assert (= (and b!123186 res!102119) b!123187))

(assert (= (and b!123187 (not res!102120)) b!123188))

(assert (=> b!123186 m!187477))

(assert (=> b!123186 m!186577))

(assert (=> b!123188 m!187477))

(assert (=> b!123188 m!187477))

(declare-fun m!187483 () Bool)

(assert (=> b!123188 m!187483))

(assert (=> d!39606 d!39710))

(declare-fun d!39712 () Bool)

(declare-fun res!102124 () Bool)

(declare-fun e!80742 () Bool)

(assert (=> d!39712 (=> (not res!102124) (not e!80742))))

(assert (=> d!39712 (= res!102124 (= (size!2459 (buf!2899 (_2!5461 lt!193308))) (size!2459 (buf!2899 (_2!5461 lt!193308)))))))

(assert (=> d!39712 (= (isPrefixOf!0 (_2!5461 lt!193308) (_2!5461 lt!193308)) e!80742)))

(declare-fun b!123189 () Bool)

(declare-fun res!102122 () Bool)

(assert (=> b!123189 (=> (not res!102122) (not e!80742))))

(assert (=> b!123189 (= res!102122 (bvsle (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193308))) (currentByte!5596 (_2!5461 lt!193308)) (currentBit!5591 (_2!5461 lt!193308))) (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193308))) (currentByte!5596 (_2!5461 lt!193308)) (currentBit!5591 (_2!5461 lt!193308)))))))

(declare-fun b!123190 () Bool)

(declare-fun e!80741 () Bool)

(assert (=> b!123190 (= e!80742 e!80741)))

(declare-fun res!102123 () Bool)

(assert (=> b!123190 (=> res!102123 e!80741)))

(assert (=> b!123190 (= res!102123 (= (size!2459 (buf!2899 (_2!5461 lt!193308))) #b00000000000000000000000000000000))))

(declare-fun b!123191 () Bool)

(assert (=> b!123191 (= e!80741 (arrayBitRangesEq!0 (buf!2899 (_2!5461 lt!193308)) (buf!2899 (_2!5461 lt!193308)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193308))) (currentByte!5596 (_2!5461 lt!193308)) (currentBit!5591 (_2!5461 lt!193308)))))))

(assert (= (and d!39712 res!102124) b!123189))

(assert (= (and b!123189 res!102122) b!123190))

(assert (= (and b!123190 (not res!102123)) b!123191))

(assert (=> b!123189 m!186577))

(assert (=> b!123189 m!186577))

(assert (=> b!123191 m!186577))

(assert (=> b!123191 m!186577))

(declare-fun m!187485 () Bool)

(assert (=> b!123191 m!187485))

(assert (=> d!39606 d!39712))

(declare-fun d!39714 () Bool)

(assert (=> d!39714 (isPrefixOf!0 lt!193950 lt!193950)))

(declare-fun lt!194439 () Unit!7557)

(assert (=> d!39714 (= lt!194439 (choose!11 lt!193950))))

(assert (=> d!39714 (= (lemmaIsPrefixRefl!0 lt!193950) lt!194439)))

(declare-fun bs!9611 () Bool)

(assert (= bs!9611 d!39714))

(assert (=> bs!9611 m!187093))

(declare-fun m!187487 () Bool)

(assert (=> bs!9611 m!187487))

(assert (=> d!39606 d!39714))

(declare-fun d!39716 () Bool)

(assert (=> d!39716 (= (remainingBits!0 ((_ sign_extend 32) (size!2459 (buf!2899 (_1!5464 lt!193301)))) ((_ sign_extend 32) (currentByte!5596 (_1!5464 lt!193301))) ((_ sign_extend 32) (currentBit!5591 (_1!5464 lt!193301)))) (bvsub (bvmul ((_ sign_extend 32) (size!2459 (buf!2899 (_1!5464 lt!193301)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5596 (_1!5464 lt!193301))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5591 (_1!5464 lt!193301))))))))

(assert (=> d!39476 d!39716))

(declare-fun d!39718 () Bool)

(assert (=> d!39718 (= (invariant!0 (currentBit!5591 (_1!5464 lt!193301)) (currentByte!5596 (_1!5464 lt!193301)) (size!2459 (buf!2899 (_1!5464 lt!193301)))) (and (bvsge (currentBit!5591 (_1!5464 lt!193301)) #b00000000000000000000000000000000) (bvslt (currentBit!5591 (_1!5464 lt!193301)) #b00000000000000000000000000001000) (bvsge (currentByte!5596 (_1!5464 lt!193301)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5596 (_1!5464 lt!193301)) (size!2459 (buf!2899 (_1!5464 lt!193301)))) (and (= (currentBit!5591 (_1!5464 lt!193301)) #b00000000000000000000000000000000) (= (currentByte!5596 (_1!5464 lt!193301)) (size!2459 (buf!2899 (_1!5464 lt!193301))))))))))

(assert (=> d!39476 d!39718))

(declare-fun d!39720 () Bool)

(assert (=> d!39720 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2459 (buf!2899 (_2!5461 lt!193323)))) ((_ sign_extend 32) (currentByte!5596 (_2!5461 lt!193323))) ((_ sign_extend 32) (currentBit!5591 (_2!5461 lt!193323))) lt!193799) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2459 (buf!2899 (_2!5461 lt!193323)))) ((_ sign_extend 32) (currentByte!5596 (_2!5461 lt!193323))) ((_ sign_extend 32) (currentBit!5591 (_2!5461 lt!193323)))) lt!193799))))

(declare-fun bs!9612 () Bool)

(assert (= bs!9612 d!39720))

(assert (=> bs!9612 m!186713))

(assert (=> b!122982 d!39720))

(declare-fun d!39722 () Bool)

(declare-fun e!80743 () Bool)

(assert (=> d!39722 e!80743))

(declare-fun res!102126 () Bool)

(assert (=> d!39722 (=> (not res!102126) (not e!80743))))

(declare-fun lt!194443 () (_ BitVec 64))

(declare-fun lt!194440 () (_ BitVec 64))

(declare-fun lt!194444 () (_ BitVec 64))

(assert (=> d!39722 (= res!102126 (= lt!194440 (bvsub lt!194444 lt!194443)))))

(assert (=> d!39722 (or (= (bvand lt!194444 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!194443 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!194444 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!194444 lt!194443) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39722 (= lt!194443 (remainingBits!0 ((_ sign_extend 32) (size!2459 (buf!2899 (_1!5464 lt!193865)))) ((_ sign_extend 32) (currentByte!5596 (_1!5464 lt!193865))) ((_ sign_extend 32) (currentBit!5591 (_1!5464 lt!193865)))))))

(declare-fun lt!194445 () (_ BitVec 64))

(declare-fun lt!194442 () (_ BitVec 64))

(assert (=> d!39722 (= lt!194444 (bvmul lt!194445 lt!194442))))

(assert (=> d!39722 (or (= lt!194445 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!194442 (bvsdiv (bvmul lt!194445 lt!194442) lt!194445)))))

(assert (=> d!39722 (= lt!194442 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!39722 (= lt!194445 ((_ sign_extend 32) (size!2459 (buf!2899 (_1!5464 lt!193865)))))))

(assert (=> d!39722 (= lt!194440 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5596 (_1!5464 lt!193865))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5591 (_1!5464 lt!193865)))))))

(assert (=> d!39722 (invariant!0 (currentBit!5591 (_1!5464 lt!193865)) (currentByte!5596 (_1!5464 lt!193865)) (size!2459 (buf!2899 (_1!5464 lt!193865))))))

(assert (=> d!39722 (= (bitIndex!0 (size!2459 (buf!2899 (_1!5464 lt!193865))) (currentByte!5596 (_1!5464 lt!193865)) (currentBit!5591 (_1!5464 lt!193865))) lt!194440)))

(declare-fun b!123192 () Bool)

(declare-fun res!102125 () Bool)

(assert (=> b!123192 (=> (not res!102125) (not e!80743))))

(assert (=> b!123192 (= res!102125 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!194440))))

(declare-fun b!123193 () Bool)

(declare-fun lt!194441 () (_ BitVec 64))

(assert (=> b!123193 (= e!80743 (bvsle lt!194440 (bvmul lt!194441 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123193 (or (= lt!194441 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!194441 #b0000000000000000000000000000000000000000000000000000000000001000) lt!194441)))))

(assert (=> b!123193 (= lt!194441 ((_ sign_extend 32) (size!2459 (buf!2899 (_1!5464 lt!193865)))))))

(assert (= (and d!39722 res!102126) b!123192))

(assert (= (and b!123192 res!102125) b!123193))

(declare-fun m!187489 () Bool)

(assert (=> d!39722 m!187489))

(declare-fun m!187491 () Bool)

(assert (=> d!39722 m!187491))

(assert (=> b!123004 d!39722))

(declare-fun d!39724 () Bool)

(declare-fun e!80744 () Bool)

(assert (=> d!39724 e!80744))

(declare-fun res!102128 () Bool)

(assert (=> d!39724 (=> (not res!102128) (not e!80744))))

(declare-fun lt!194449 () (_ BitVec 64))

(declare-fun lt!194450 () (_ BitVec 64))

(declare-fun lt!194446 () (_ BitVec 64))

(assert (=> d!39724 (= res!102128 (= lt!194446 (bvsub lt!194450 lt!194449)))))

(assert (=> d!39724 (or (= (bvand lt!194450 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!194449 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!194450 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!194450 lt!194449) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39724 (= lt!194449 (remainingBits!0 ((_ sign_extend 32) (size!2459 (buf!2899 (_2!5461 lt!193867)))) ((_ sign_extend 32) (currentByte!5596 (_2!5461 lt!193867))) ((_ sign_extend 32) (currentBit!5591 (_2!5461 lt!193867)))))))

(declare-fun lt!194451 () (_ BitVec 64))

(declare-fun lt!194448 () (_ BitVec 64))

(assert (=> d!39724 (= lt!194450 (bvmul lt!194451 lt!194448))))

(assert (=> d!39724 (or (= lt!194451 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!194448 (bvsdiv (bvmul lt!194451 lt!194448) lt!194451)))))

(assert (=> d!39724 (= lt!194448 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!39724 (= lt!194451 ((_ sign_extend 32) (size!2459 (buf!2899 (_2!5461 lt!193867)))))))

(assert (=> d!39724 (= lt!194446 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5596 (_2!5461 lt!193867))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5591 (_2!5461 lt!193867)))))))

(assert (=> d!39724 (invariant!0 (currentBit!5591 (_2!5461 lt!193867)) (currentByte!5596 (_2!5461 lt!193867)) (size!2459 (buf!2899 (_2!5461 lt!193867))))))

(assert (=> d!39724 (= (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193867))) (currentByte!5596 (_2!5461 lt!193867)) (currentBit!5591 (_2!5461 lt!193867))) lt!194446)))

(declare-fun b!123194 () Bool)

(declare-fun res!102127 () Bool)

(assert (=> b!123194 (=> (not res!102127) (not e!80744))))

(assert (=> b!123194 (= res!102127 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!194446))))

(declare-fun b!123195 () Bool)

(declare-fun lt!194447 () (_ BitVec 64))

(assert (=> b!123195 (= e!80744 (bvsle lt!194446 (bvmul lt!194447 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123195 (or (= lt!194447 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!194447 #b0000000000000000000000000000000000000000000000000000000000001000) lt!194447)))))

(assert (=> b!123195 (= lt!194447 ((_ sign_extend 32) (size!2459 (buf!2899 (_2!5461 lt!193867)))))))

(assert (= (and d!39724 res!102128) b!123194))

(assert (= (and b!123194 res!102127) b!123195))

(declare-fun m!187493 () Bool)

(assert (=> d!39724 m!187493))

(declare-fun m!187495 () Bool)

(assert (=> d!39724 m!187495))

(assert (=> b!123004 d!39724))

(declare-fun d!39726 () Bool)

(assert (=> d!39726 (= (remainingBits!0 ((_ sign_extend 32) (size!2459 (buf!2899 (_1!5464 lt!193296)))) ((_ sign_extend 32) (currentByte!5596 (_1!5464 lt!193296))) ((_ sign_extend 32) (currentBit!5591 (_1!5464 lt!193296)))) (bvsub (bvmul ((_ sign_extend 32) (size!2459 (buf!2899 (_1!5464 lt!193296)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5596 (_1!5464 lt!193296))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5591 (_1!5464 lt!193296))))))))

(assert (=> d!39630 d!39726))

(declare-fun d!39728 () Bool)

(assert (=> d!39728 (= (invariant!0 (currentBit!5591 (_1!5464 lt!193296)) (currentByte!5596 (_1!5464 lt!193296)) (size!2459 (buf!2899 (_1!5464 lt!193296)))) (and (bvsge (currentBit!5591 (_1!5464 lt!193296)) #b00000000000000000000000000000000) (bvslt (currentBit!5591 (_1!5464 lt!193296)) #b00000000000000000000000000001000) (bvsge (currentByte!5596 (_1!5464 lt!193296)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5596 (_1!5464 lt!193296)) (size!2459 (buf!2899 (_1!5464 lt!193296)))) (and (= (currentBit!5591 (_1!5464 lt!193296)) #b00000000000000000000000000000000) (= (currentByte!5596 (_1!5464 lt!193296)) (size!2459 (buf!2899 (_1!5464 lt!193296))))))))))

(assert (=> d!39630 d!39728))

(declare-fun d!39730 () Bool)

(declare-fun e!80745 () Bool)

(assert (=> d!39730 e!80745))

(declare-fun res!102130 () Bool)

(assert (=> d!39730 (=> (not res!102130) (not e!80745))))

(declare-fun lt!194456 () (_ BitVec 64))

(declare-fun lt!194452 () (_ BitVec 64))

(declare-fun lt!194455 () (_ BitVec 64))

(assert (=> d!39730 (= res!102130 (= lt!194452 (bvsub lt!194456 lt!194455)))))

(assert (=> d!39730 (or (= (bvand lt!194456 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!194455 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!194456 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!194456 lt!194455) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39730 (= lt!194455 (remainingBits!0 ((_ sign_extend 32) (size!2459 (buf!2899 (_2!5461 lt!193832)))) ((_ sign_extend 32) (currentByte!5596 (_2!5461 lt!193832))) ((_ sign_extend 32) (currentBit!5591 (_2!5461 lt!193832)))))))

(declare-fun lt!194457 () (_ BitVec 64))

(declare-fun lt!194454 () (_ BitVec 64))

(assert (=> d!39730 (= lt!194456 (bvmul lt!194457 lt!194454))))

(assert (=> d!39730 (or (= lt!194457 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!194454 (bvsdiv (bvmul lt!194457 lt!194454) lt!194457)))))

(assert (=> d!39730 (= lt!194454 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!39730 (= lt!194457 ((_ sign_extend 32) (size!2459 (buf!2899 (_2!5461 lt!193832)))))))

(assert (=> d!39730 (= lt!194452 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5596 (_2!5461 lt!193832))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5591 (_2!5461 lt!193832)))))))

(assert (=> d!39730 (invariant!0 (currentBit!5591 (_2!5461 lt!193832)) (currentByte!5596 (_2!5461 lt!193832)) (size!2459 (buf!2899 (_2!5461 lt!193832))))))

(assert (=> d!39730 (= (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193832))) (currentByte!5596 (_2!5461 lt!193832)) (currentBit!5591 (_2!5461 lt!193832))) lt!194452)))

(declare-fun b!123196 () Bool)

(declare-fun res!102129 () Bool)

(assert (=> b!123196 (=> (not res!102129) (not e!80745))))

(assert (=> b!123196 (= res!102129 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!194452))))

(declare-fun b!123197 () Bool)

(declare-fun lt!194453 () (_ BitVec 64))

(assert (=> b!123197 (= e!80745 (bvsle lt!194452 (bvmul lt!194453 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123197 (or (= lt!194453 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!194453 #b0000000000000000000000000000000000000000000000000000000000001000) lt!194453)))))

(assert (=> b!123197 (= lt!194453 ((_ sign_extend 32) (size!2459 (buf!2899 (_2!5461 lt!193832)))))))

(assert (= (and d!39730 res!102130) b!123196))

(assert (= (and b!123196 res!102129) b!123197))

(declare-fun m!187497 () Bool)

(assert (=> d!39730 m!187497))

(declare-fun m!187499 () Bool)

(assert (=> d!39730 m!187499))

(assert (=> b!122984 d!39730))

(assert (=> b!122984 d!39462))

(assert (=> d!39484 d!39480))

(declare-fun d!39732 () Bool)

(assert (=> d!39732 (validate_offset_bits!1 ((_ sign_extend 32) (size!2459 (buf!2899 (_2!5461 lt!193308)))) ((_ sign_extend 32) (currentByte!5596 (_2!5461 lt!193323))) ((_ sign_extend 32) (currentBit!5591 (_2!5461 lt!193323))) lt!193319)))

(assert (=> d!39732 true))

(declare-fun _$6!257 () Unit!7557)

(assert (=> d!39732 (= (choose!9 (_2!5461 lt!193323) (buf!2899 (_2!5461 lt!193308)) lt!193319 (BitStream!4393 (buf!2899 (_2!5461 lt!193308)) (currentByte!5596 (_2!5461 lt!193323)) (currentBit!5591 (_2!5461 lt!193323)))) _$6!257)))

(declare-fun bs!9613 () Bool)

(assert (= bs!9613 d!39732))

(assert (=> bs!9613 m!186603))

(assert (=> d!39484 d!39732))

(declare-fun d!39734 () Bool)

(assert (=> d!39734 (= (remainingBits!0 ((_ sign_extend 32) (size!2459 (buf!2899 thiss!1305))) ((_ sign_extend 32) (currentByte!5596 thiss!1305)) ((_ sign_extend 32) (currentBit!5591 thiss!1305))) (bvsub (bvmul ((_ sign_extend 32) (size!2459 (buf!2899 thiss!1305))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5596 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5591 thiss!1305)))))))

(assert (=> d!39464 d!39734))

(assert (=> d!39464 d!39692))

(assert (=> d!39628 d!39734))

(declare-fun d!39736 () Bool)

(declare-fun res!102133 () Bool)

(declare-fun e!80747 () Bool)

(assert (=> d!39736 (=> (not res!102133) (not e!80747))))

(assert (=> d!39736 (= res!102133 (= (size!2459 (buf!2899 (_1!5463 lt!193920))) (size!2459 (buf!2899 (_2!5461 lt!193323)))))))

(assert (=> d!39736 (= (isPrefixOf!0 (_1!5463 lt!193920) (_2!5461 lt!193323)) e!80747)))

(declare-fun b!123198 () Bool)

(declare-fun res!102131 () Bool)

(assert (=> b!123198 (=> (not res!102131) (not e!80747))))

(assert (=> b!123198 (= res!102131 (bvsle (bitIndex!0 (size!2459 (buf!2899 (_1!5463 lt!193920))) (currentByte!5596 (_1!5463 lt!193920)) (currentBit!5591 (_1!5463 lt!193920))) (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193323))) (currentByte!5596 (_2!5461 lt!193323)) (currentBit!5591 (_2!5461 lt!193323)))))))

(declare-fun b!123199 () Bool)

(declare-fun e!80746 () Bool)

(assert (=> b!123199 (= e!80747 e!80746)))

(declare-fun res!102132 () Bool)

(assert (=> b!123199 (=> res!102132 e!80746)))

(assert (=> b!123199 (= res!102132 (= (size!2459 (buf!2899 (_1!5463 lt!193920))) #b00000000000000000000000000000000))))

(declare-fun b!123200 () Bool)

(assert (=> b!123200 (= e!80746 (arrayBitRangesEq!0 (buf!2899 (_1!5463 lt!193920)) (buf!2899 (_2!5461 lt!193323)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2459 (buf!2899 (_1!5463 lt!193920))) (currentByte!5596 (_1!5463 lt!193920)) (currentBit!5591 (_1!5463 lt!193920)))))))

(assert (= (and d!39736 res!102133) b!123198))

(assert (= (and b!123198 res!102131) b!123199))

(assert (= (and b!123199 (not res!102132)) b!123200))

(declare-fun m!187501 () Bool)

(assert (=> b!123198 m!187501))

(assert (=> b!123198 m!186565))

(assert (=> b!123200 m!187501))

(assert (=> b!123200 m!187501))

(declare-fun m!187503 () Bool)

(assert (=> b!123200 m!187503))

(assert (=> b!123017 d!39736))

(assert (=> b!123001 d!39724))

(assert (=> b!123001 d!39464))

(declare-fun d!39738 () Bool)

(declare-fun e!80748 () Bool)

(assert (=> d!39738 e!80748))

(declare-fun res!102135 () Bool)

(assert (=> d!39738 (=> (not res!102135) (not e!80748))))

(declare-fun lt!194458 () (_ BitVec 64))

(declare-fun lt!194461 () (_ BitVec 64))

(declare-fun lt!194462 () (_ BitVec 64))

(assert (=> d!39738 (= res!102135 (= lt!194458 (bvsub lt!194462 lt!194461)))))

(assert (=> d!39738 (or (= (bvand lt!194462 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!194461 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!194462 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!194462 lt!194461) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39738 (= lt!194461 (remainingBits!0 ((_ sign_extend 32) (size!2459 (buf!2899 (_2!5461 lt!193842)))) ((_ sign_extend 32) (currentByte!5596 (_2!5461 lt!193842))) ((_ sign_extend 32) (currentBit!5591 (_2!5461 lt!193842)))))))

(declare-fun lt!194463 () (_ BitVec 64))

(declare-fun lt!194460 () (_ BitVec 64))

(assert (=> d!39738 (= lt!194462 (bvmul lt!194463 lt!194460))))

(assert (=> d!39738 (or (= lt!194463 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!194460 (bvsdiv (bvmul lt!194463 lt!194460) lt!194463)))))

(assert (=> d!39738 (= lt!194460 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!39738 (= lt!194463 ((_ sign_extend 32) (size!2459 (buf!2899 (_2!5461 lt!193842)))))))

(assert (=> d!39738 (= lt!194458 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5596 (_2!5461 lt!193842))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5591 (_2!5461 lt!193842)))))))

(assert (=> d!39738 (invariant!0 (currentBit!5591 (_2!5461 lt!193842)) (currentByte!5596 (_2!5461 lt!193842)) (size!2459 (buf!2899 (_2!5461 lt!193842))))))

(assert (=> d!39738 (= (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193842))) (currentByte!5596 (_2!5461 lt!193842)) (currentBit!5591 (_2!5461 lt!193842))) lt!194458)))

(declare-fun b!123201 () Bool)

(declare-fun res!102134 () Bool)

(assert (=> b!123201 (=> (not res!102134) (not e!80748))))

(assert (=> b!123201 (= res!102134 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!194458))))

(declare-fun b!123202 () Bool)

(declare-fun lt!194459 () (_ BitVec 64))

(assert (=> b!123202 (= e!80748 (bvsle lt!194458 (bvmul lt!194459 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123202 (or (= lt!194459 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!194459 #b0000000000000000000000000000000000000000000000000000000000001000) lt!194459)))))

(assert (=> b!123202 (= lt!194459 ((_ sign_extend 32) (size!2459 (buf!2899 (_2!5461 lt!193842)))))))

(assert (= (and d!39738 res!102135) b!123201))

(assert (= (and b!123201 res!102134) b!123202))

(declare-fun m!187505 () Bool)

(assert (=> d!39738 m!187505))

(declare-fun m!187507 () Bool)

(assert (=> d!39738 m!187507))

(assert (=> b!122981 d!39738))

(assert (=> b!122981 d!39462))

(declare-fun d!39740 () Bool)

(declare-fun e!80749 () Bool)

(assert (=> d!39740 e!80749))

(declare-fun res!102137 () Bool)

(assert (=> d!39740 (=> (not res!102137) (not e!80749))))

(declare-fun lt!194468 () (_ BitVec 64))

(declare-fun lt!194467 () (_ BitVec 64))

(declare-fun lt!194464 () (_ BitVec 64))

(assert (=> d!39740 (= res!102137 (= lt!194464 (bvsub lt!194468 lt!194467)))))

(assert (=> d!39740 (or (= (bvand lt!194468 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!194467 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!194468 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!194468 lt!194467) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39740 (= lt!194467 (remainingBits!0 ((_ sign_extend 32) (size!2459 (buf!2899 lt!193971))) ((_ sign_extend 32) (currentByte!5596 lt!193971)) ((_ sign_extend 32) (currentBit!5591 lt!193971))))))

(declare-fun lt!194469 () (_ BitVec 64))

(declare-fun lt!194466 () (_ BitVec 64))

(assert (=> d!39740 (= lt!194468 (bvmul lt!194469 lt!194466))))

(assert (=> d!39740 (or (= lt!194469 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!194466 (bvsdiv (bvmul lt!194469 lt!194466) lt!194469)))))

(assert (=> d!39740 (= lt!194466 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!39740 (= lt!194469 ((_ sign_extend 32) (size!2459 (buf!2899 lt!193971))))))

(assert (=> d!39740 (= lt!194464 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5596 lt!193971)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5591 lt!193971))))))

(assert (=> d!39740 (invariant!0 (currentBit!5591 lt!193971) (currentByte!5596 lt!193971) (size!2459 (buf!2899 lt!193971)))))

(assert (=> d!39740 (= (bitIndex!0 (size!2459 (buf!2899 lt!193971)) (currentByte!5596 lt!193971) (currentBit!5591 lt!193971)) lt!194464)))

(declare-fun b!123203 () Bool)

(declare-fun res!102136 () Bool)

(assert (=> b!123203 (=> (not res!102136) (not e!80749))))

(assert (=> b!123203 (= res!102136 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!194464))))

(declare-fun b!123204 () Bool)

(declare-fun lt!194465 () (_ BitVec 64))

(assert (=> b!123204 (= e!80749 (bvsle lt!194464 (bvmul lt!194465 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123204 (or (= lt!194465 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!194465 #b0000000000000000000000000000000000000000000000000000000000001000) lt!194465)))))

(assert (=> b!123204 (= lt!194465 ((_ sign_extend 32) (size!2459 (buf!2899 lt!193971))))))

(assert (= (and d!39740 res!102137) b!123203))

(assert (= (and b!123203 res!102136) b!123204))

(declare-fun m!187509 () Bool)

(assert (=> d!39740 m!187509))

(declare-fun m!187511 () Bool)

(assert (=> d!39740 m!187511))

(assert (=> d!39622 d!39740))

(declare-fun d!39742 () Bool)

(declare-fun e!80750 () Bool)

(assert (=> d!39742 e!80750))

(declare-fun res!102139 () Bool)

(assert (=> d!39742 (=> (not res!102139) (not e!80750))))

(declare-fun lt!194473 () (_ BitVec 64))

(declare-fun lt!194470 () (_ BitVec 64))

(declare-fun lt!194474 () (_ BitVec 64))

(assert (=> d!39742 (= res!102139 (= lt!194470 (bvsub lt!194474 lt!194473)))))

(assert (=> d!39742 (or (= (bvand lt!194474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!194473 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!194474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!194474 lt!194473) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39742 (= lt!194473 (remainingBits!0 ((_ sign_extend 32) (size!2459 (buf!2899 (_1!5463 lt!193305)))) ((_ sign_extend 32) (currentByte!5596 (_1!5463 lt!193305))) ((_ sign_extend 32) (currentBit!5591 (_1!5463 lt!193305)))))))

(declare-fun lt!194475 () (_ BitVec 64))

(declare-fun lt!194472 () (_ BitVec 64))

(assert (=> d!39742 (= lt!194474 (bvmul lt!194475 lt!194472))))

(assert (=> d!39742 (or (= lt!194475 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!194472 (bvsdiv (bvmul lt!194475 lt!194472) lt!194475)))))

(assert (=> d!39742 (= lt!194472 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!39742 (= lt!194475 ((_ sign_extend 32) (size!2459 (buf!2899 (_1!5463 lt!193305)))))))

(assert (=> d!39742 (= lt!194470 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5596 (_1!5463 lt!193305))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5591 (_1!5463 lt!193305)))))))

(assert (=> d!39742 (invariant!0 (currentBit!5591 (_1!5463 lt!193305)) (currentByte!5596 (_1!5463 lt!193305)) (size!2459 (buf!2899 (_1!5463 lt!193305))))))

(assert (=> d!39742 (= (bitIndex!0 (size!2459 (buf!2899 (_1!5463 lt!193305))) (currentByte!5596 (_1!5463 lt!193305)) (currentBit!5591 (_1!5463 lt!193305))) lt!194470)))

(declare-fun b!123205 () Bool)

(declare-fun res!102138 () Bool)

(assert (=> b!123205 (=> (not res!102138) (not e!80750))))

(assert (=> b!123205 (= res!102138 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!194470))))

(declare-fun b!123206 () Bool)

(declare-fun lt!194471 () (_ BitVec 64))

(assert (=> b!123206 (= e!80750 (bvsle lt!194470 (bvmul lt!194471 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123206 (or (= lt!194471 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!194471 #b0000000000000000000000000000000000000000000000000000000000001000) lt!194471)))))

(assert (=> b!123206 (= lt!194471 ((_ sign_extend 32) (size!2459 (buf!2899 (_1!5463 lt!193305)))))))

(assert (= (and d!39742 res!102139) b!123205))

(assert (= (and b!123205 res!102138) b!123206))

(declare-fun m!187513 () Bool)

(assert (=> d!39742 m!187513))

(declare-fun m!187515 () Bool)

(assert (=> d!39742 m!187515))

(assert (=> d!39622 d!39742))

(declare-fun d!39744 () Bool)

(declare-fun lt!194493 () (_ BitVec 32))

(assert (=> d!39744 (= lt!194493 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!194491 () (_ BitVec 32))

(assert (=> d!39744 (= lt!194491 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!80756 () Bool)

(assert (=> d!39744 e!80756))

(declare-fun res!102144 () Bool)

(assert (=> d!39744 (=> (not res!102144) (not e!80756))))

(assert (=> d!39744 (= res!102144 (moveBitIndexPrecond!0 (_1!5463 lt!193305) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun Unit!7585 () Unit!7557)

(declare-fun Unit!7586 () Unit!7557)

(declare-fun Unit!7587 () Unit!7557)

(assert (=> d!39744 (= (moveBitIndex!0 (_1!5463 lt!193305) #b0000000000000000000000000000000000000000000000000000000000000001) (ite (bvslt (bvadd (currentBit!5591 (_1!5463 lt!193305)) lt!194493) #b00000000000000000000000000000000) (tuple2!10393 Unit!7585 (BitStream!4393 (buf!2899 (_1!5463 lt!193305)) (bvsub (bvadd (currentByte!5596 (_1!5463 lt!193305)) lt!194491) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!194493 (currentBit!5591 (_1!5463 lt!193305))))) (ite (bvsge (bvadd (currentBit!5591 (_1!5463 lt!193305)) lt!194493) #b00000000000000000000000000001000) (tuple2!10393 Unit!7586 (BitStream!4393 (buf!2899 (_1!5463 lt!193305)) (bvadd (currentByte!5596 (_1!5463 lt!193305)) lt!194491 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!5591 (_1!5463 lt!193305)) lt!194493) #b00000000000000000000000000001000))) (tuple2!10393 Unit!7587 (BitStream!4393 (buf!2899 (_1!5463 lt!193305)) (bvadd (currentByte!5596 (_1!5463 lt!193305)) lt!194491) (bvadd (currentBit!5591 (_1!5463 lt!193305)) lt!194493))))))))

(declare-fun b!123211 () Bool)

(declare-fun e!80755 () Bool)

(assert (=> b!123211 (= e!80756 e!80755)))

(declare-fun res!102145 () Bool)

(assert (=> b!123211 (=> (not res!102145) (not e!80755))))

(declare-fun lt!194492 () (_ BitVec 64))

(declare-fun lt!194490 () tuple2!10392)

(assert (=> b!123211 (= res!102145 (= (bvadd lt!194492 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!194490))) (currentByte!5596 (_2!5461 lt!194490)) (currentBit!5591 (_2!5461 lt!194490)))))))

(assert (=> b!123211 (or (not (= (bvand lt!194492 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!194492 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!194492 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!123211 (= lt!194492 (bitIndex!0 (size!2459 (buf!2899 (_1!5463 lt!193305))) (currentByte!5596 (_1!5463 lt!193305)) (currentBit!5591 (_1!5463 lt!193305))))))

(declare-fun lt!194489 () (_ BitVec 32))

(declare-fun lt!194488 () (_ BitVec 32))

(declare-fun Unit!7588 () Unit!7557)

(declare-fun Unit!7589 () Unit!7557)

(declare-fun Unit!7590 () Unit!7557)

(assert (=> b!123211 (= lt!194490 (ite (bvslt (bvadd (currentBit!5591 (_1!5463 lt!193305)) lt!194488) #b00000000000000000000000000000000) (tuple2!10393 Unit!7588 (BitStream!4393 (buf!2899 (_1!5463 lt!193305)) (bvsub (bvadd (currentByte!5596 (_1!5463 lt!193305)) lt!194489) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!194488 (currentBit!5591 (_1!5463 lt!193305))))) (ite (bvsge (bvadd (currentBit!5591 (_1!5463 lt!193305)) lt!194488) #b00000000000000000000000000001000) (tuple2!10393 Unit!7589 (BitStream!4393 (buf!2899 (_1!5463 lt!193305)) (bvadd (currentByte!5596 (_1!5463 lt!193305)) lt!194489 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!5591 (_1!5463 lt!193305)) lt!194488) #b00000000000000000000000000001000))) (tuple2!10393 Unit!7590 (BitStream!4393 (buf!2899 (_1!5463 lt!193305)) (bvadd (currentByte!5596 (_1!5463 lt!193305)) lt!194489) (bvadd (currentBit!5591 (_1!5463 lt!193305)) lt!194488))))))))

(assert (=> b!123211 (= lt!194488 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123211 (= lt!194489 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!123212 () Bool)

(assert (=> b!123212 (= e!80755 (and (= (size!2459 (buf!2899 (_1!5463 lt!193305))) (size!2459 (buf!2899 (_2!5461 lt!194490)))) (= (buf!2899 (_1!5463 lt!193305)) (buf!2899 (_2!5461 lt!194490)))))))

(assert (= (and d!39744 res!102144) b!123211))

(assert (= (and b!123211 res!102145) b!123212))

(assert (=> d!39744 m!187147))

(declare-fun m!187517 () Bool)

(assert (=> b!123211 m!187517))

(assert (=> b!123211 m!187143))

(assert (=> d!39622 d!39744))

(declare-fun d!39748 () Bool)

(declare-fun res!102148 () Bool)

(declare-fun e!80759 () Bool)

(assert (=> d!39748 (=> (not res!102148) (not e!80759))))

(assert (=> d!39748 (= res!102148 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!2459 (buf!2899 (_1!5463 lt!193305))))) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2459 (buf!2899 (_1!5463 lt!193305))))))))))

(assert (=> d!39748 (= (moveBitIndexPrecond!0 (_1!5463 lt!193305) #b0000000000000000000000000000000000000000000000000000000000000001) e!80759)))

(declare-fun b!123216 () Bool)

(declare-fun lt!194496 () (_ BitVec 64))

(assert (=> b!123216 (= e!80759 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!194496) (bvsle lt!194496 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2459 (buf!2899 (_1!5463 lt!193305))))))))))

(assert (=> b!123216 (= lt!194496 (bvadd (bitIndex!0 (size!2459 (buf!2899 (_1!5463 lt!193305))) (currentByte!5596 (_1!5463 lt!193305)) (currentBit!5591 (_1!5463 lt!193305))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (= (and d!39748 res!102148) b!123216))

(assert (=> b!123216 m!187143))

(assert (=> d!39622 d!39748))

(declare-fun d!39750 () Bool)

(declare-fun e!80768 () Bool)

(assert (=> d!39750 e!80768))

(declare-fun res!102159 () Bool)

(assert (=> d!39750 (=> (not res!102159) (not e!80768))))

(declare-fun lt!194523 () tuple2!10410)

(assert (=> d!39750 (= res!102159 (= (buf!2899 (_2!5470 lt!194523)) (buf!2899 lt!193295)))))

(declare-fun e!80767 () tuple2!10410)

(assert (=> d!39750 (= lt!194523 e!80767)))

(declare-fun c!7363 () Bool)

(assert (=> d!39750 (= c!7363 (= nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> d!39750 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!39750 (= (readNLeastSignificantBitsLoop!0 lt!193295 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!193302) lt!194523)))

(declare-fun b!123231 () Bool)

(assert (=> b!123231 (= e!80767 (tuple2!10411 lt!193302 lt!193295))))

(declare-fun lt!194522 () (_ BitVec 64))

(declare-fun e!80766 () Bool)

(declare-fun b!123232 () Bool)

(assert (=> b!123232 (= e!80766 (= (= (bvand (bvlshr (_1!5470 lt!194523) lt!194522) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!5464 (readBitPure!0 lt!193295))))))

(assert (=> b!123232 (and (bvsge lt!194522 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!194522 #b0000000000000000000000000000000000000000000000000000000001000000))))

(declare-fun lt!194517 () (_ BitVec 32))

(assert (=> b!123232 (= lt!194522 ((_ sign_extend 32) (bvsub lt!194517 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!123232 (or (= (bvand lt!194517 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand lt!194517 #b10000000000000000000000000000000) (bvand (bvsub lt!194517 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!123232 (= lt!194517 (bvsub nBits!396 #b00000000000000000000000000000001))))

(assert (=> b!123232 (or (= (bvand nBits!396 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))

(declare-fun b!123233 () Bool)

(declare-fun lt!194518 () tuple2!10410)

(assert (=> b!123233 (= e!80767 (tuple2!10411 (_1!5470 lt!194518) (_2!5470 lt!194518)))))

(declare-fun lt!194515 () tuple2!10408)

(assert (=> b!123233 (= lt!194515 (readBit!0 lt!193295))))

(assert (=> b!123233 (= lt!194518 (readNLeastSignificantBitsLoop!0 (_2!5469 lt!194515) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!193302 (ite (_1!5469 lt!194515) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!123234 () Bool)

(declare-fun res!102160 () Bool)

(assert (=> b!123234 (=> (not res!102160) (not e!80768))))

(declare-fun lt!194519 () (_ BitVec 64))

(declare-fun lt!194520 () (_ BitVec 64))

(assert (=> b!123234 (= res!102160 (= (bitIndex!0 (size!2459 (buf!2899 (_2!5470 lt!194523))) (currentByte!5596 (_2!5470 lt!194523)) (currentBit!5591 (_2!5470 lt!194523))) (bvadd lt!194519 lt!194520)))))

(assert (=> b!123234 (or (not (= (bvand lt!194519 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!194520 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!194519 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!194519 lt!194520) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!123234 (= lt!194520 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!123234 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!123234 (= lt!194519 (bitIndex!0 (size!2459 (buf!2899 lt!193295)) (currentByte!5596 lt!193295) (currentBit!5591 lt!193295)))))

(declare-fun b!123235 () Bool)

(declare-fun res!102162 () Bool)

(assert (=> b!123235 (=> (not res!102162) (not e!80768))))

(assert (=> b!123235 (= res!102162 (= (bvand (_1!5470 lt!194523) (onesLSBLong!0 nBits!396)) (_1!5470 lt!194523)))))

(declare-fun b!123236 () Bool)

(declare-fun res!102161 () Bool)

(assert (=> b!123236 (=> (not res!102161) (not e!80768))))

(declare-fun lt!194516 () (_ BitVec 64))

(declare-fun lt!194521 () (_ BitVec 64))

(assert (=> b!123236 (= res!102161 (= (bvlshr (_1!5470 lt!194523) lt!194521) (bvlshr lt!193302 lt!194516)))))

(assert (=> b!123236 (and (bvsge lt!194516 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!194516 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!123236 (= lt!194516 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!123236 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!123236 (and (bvsge lt!194521 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!194521 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!123236 (= lt!194521 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!123236 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(declare-fun b!123237 () Bool)

(assert (=> b!123237 (= e!80768 e!80766)))

(declare-fun res!102163 () Bool)

(assert (=> b!123237 (=> res!102163 e!80766)))

(assert (=> b!123237 (= res!102163 (bvsge (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (= (and d!39750 c!7363) b!123231))

(assert (= (and d!39750 (not c!7363)) b!123233))

(assert (= (and d!39750 res!102159) b!123234))

(assert (= (and b!123234 res!102160) b!123236))

(assert (= (and b!123236 res!102161) b!123235))

(assert (= (and b!123235 res!102162) b!123237))

(assert (= (and b!123237 (not res!102163)) b!123232))

(declare-fun m!187519 () Bool)

(assert (=> b!123232 m!187519))

(declare-fun m!187521 () Bool)

(assert (=> b!123233 m!187521))

(declare-fun m!187523 () Bool)

(assert (=> b!123233 m!187523))

(declare-fun m!187525 () Bool)

(assert (=> b!123234 m!187525))

(declare-fun m!187527 () Bool)

(assert (=> b!123234 m!187527))

(assert (=> b!123235 m!186637))

(assert (=> d!39618 d!39750))

(declare-fun d!39752 () Bool)

(declare-fun res!102166 () Bool)

(declare-fun e!80770 () Bool)

(assert (=> d!39752 (=> (not res!102166) (not e!80770))))

(assert (=> d!39752 (= res!102166 (= (size!2459 (buf!2899 (_2!5461 lt!193323))) (size!2459 (buf!2899 (_2!5461 lt!193832)))))))

(assert (=> d!39752 (= (isPrefixOf!0 (_2!5461 lt!193323) (_2!5461 lt!193832)) e!80770)))

(declare-fun b!123238 () Bool)

(declare-fun res!102164 () Bool)

(assert (=> b!123238 (=> (not res!102164) (not e!80770))))

(assert (=> b!123238 (= res!102164 (bvsle (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193323))) (currentByte!5596 (_2!5461 lt!193323)) (currentBit!5591 (_2!5461 lt!193323))) (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193832))) (currentByte!5596 (_2!5461 lt!193832)) (currentBit!5591 (_2!5461 lt!193832)))))))

(declare-fun b!123239 () Bool)

(declare-fun e!80769 () Bool)

(assert (=> b!123239 (= e!80770 e!80769)))

(declare-fun res!102165 () Bool)

(assert (=> b!123239 (=> res!102165 e!80769)))

(assert (=> b!123239 (= res!102165 (= (size!2459 (buf!2899 (_2!5461 lt!193323))) #b00000000000000000000000000000000))))

(declare-fun b!123240 () Bool)

(assert (=> b!123240 (= e!80769 (arrayBitRangesEq!0 (buf!2899 (_2!5461 lt!193323)) (buf!2899 (_2!5461 lt!193832)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193323))) (currentByte!5596 (_2!5461 lt!193323)) (currentBit!5591 (_2!5461 lt!193323)))))))

(assert (= (and d!39752 res!102166) b!123238))

(assert (= (and b!123238 res!102164) b!123239))

(assert (= (and b!123239 (not res!102165)) b!123240))

(assert (=> b!123238 m!186565))

(assert (=> b!123238 m!186945))

(assert (=> b!123240 m!186565))

(assert (=> b!123240 m!186565))

(declare-fun m!187529 () Bool)

(assert (=> b!123240 m!187529))

(assert (=> b!122977 d!39752))

(declare-fun d!39754 () Bool)

(declare-fun e!80773 () Bool)

(assert (=> d!39754 e!80773))

(declare-fun res!102167 () Bool)

(assert (=> d!39754 (=> (not res!102167) (not e!80773))))

(declare-fun lt!194532 () tuple2!10410)

(assert (=> d!39754 (= res!102167 (= (buf!2899 (_2!5470 lt!194532)) (buf!2899 (_1!5463 lt!193305))))))

(declare-fun e!80772 () tuple2!10410)

(assert (=> d!39754 (= lt!194532 e!80772)))

(declare-fun c!7364 () Bool)

(assert (=> d!39754 (= c!7364 (= nBits!396 i!615))))

(assert (=> d!39754 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!39754 (= (readNLeastSignificantBitsLoop!0 (_1!5463 lt!193305) nBits!396 i!615 lt!193309) lt!194532)))

(declare-fun b!123241 () Bool)

(assert (=> b!123241 (= e!80772 (tuple2!10411 lt!193309 (_1!5463 lt!193305)))))

(declare-fun b!123242 () Bool)

(declare-fun e!80771 () Bool)

(declare-fun lt!194531 () (_ BitVec 64))

(assert (=> b!123242 (= e!80771 (= (= (bvand (bvlshr (_1!5470 lt!194532) lt!194531) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!5464 (readBitPure!0 (_1!5463 lt!193305)))))))

(assert (=> b!123242 (and (bvsge lt!194531 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!194531 #b0000000000000000000000000000000000000000000000000000000001000000))))

(declare-fun lt!194526 () (_ BitVec 32))

(assert (=> b!123242 (= lt!194531 ((_ sign_extend 32) (bvsub lt!194526 i!615)))))

(assert (=> b!123242 (or (= (bvand lt!194526 #b10000000000000000000000000000000) (bvand i!615 #b10000000000000000000000000000000)) (= (bvand lt!194526 #b10000000000000000000000000000000) (bvand (bvsub lt!194526 i!615) #b10000000000000000000000000000000)))))

(assert (=> b!123242 (= lt!194526 (bvsub nBits!396 #b00000000000000000000000000000001))))

(assert (=> b!123242 (or (= (bvand nBits!396 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))

(declare-fun b!123243 () Bool)

(declare-fun lt!194527 () tuple2!10410)

(assert (=> b!123243 (= e!80772 (tuple2!10411 (_1!5470 lt!194527) (_2!5470 lt!194527)))))

(declare-fun lt!194524 () tuple2!10408)

(assert (=> b!123243 (= lt!194524 (readBit!0 (_1!5463 lt!193305)))))

(assert (=> b!123243 (= lt!194527 (readNLeastSignificantBitsLoop!0 (_2!5469 lt!194524) nBits!396 (bvadd i!615 #b00000000000000000000000000000001) (bvor lt!193309 (ite (_1!5469 lt!194524) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!123244 () Bool)

(declare-fun res!102168 () Bool)

(assert (=> b!123244 (=> (not res!102168) (not e!80773))))

(declare-fun lt!194528 () (_ BitVec 64))

(declare-fun lt!194529 () (_ BitVec 64))

(assert (=> b!123244 (= res!102168 (= (bitIndex!0 (size!2459 (buf!2899 (_2!5470 lt!194532))) (currentByte!5596 (_2!5470 lt!194532)) (currentBit!5591 (_2!5470 lt!194532))) (bvadd lt!194528 lt!194529)))))

(assert (=> b!123244 (or (not (= (bvand lt!194528 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!194529 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!194528 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!194528 lt!194529) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!123244 (= lt!194529 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(assert (=> b!123244 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand i!615 #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 i!615) #b10000000000000000000000000000000)))))

(assert (=> b!123244 (= lt!194528 (bitIndex!0 (size!2459 (buf!2899 (_1!5463 lt!193305))) (currentByte!5596 (_1!5463 lt!193305)) (currentBit!5591 (_1!5463 lt!193305))))))

(declare-fun b!123245 () Bool)

(declare-fun res!102170 () Bool)

(assert (=> b!123245 (=> (not res!102170) (not e!80773))))

(assert (=> b!123245 (= res!102170 (= (bvand (_1!5470 lt!194532) (onesLSBLong!0 nBits!396)) (_1!5470 lt!194532)))))

(declare-fun b!123246 () Bool)

(declare-fun res!102169 () Bool)

(assert (=> b!123246 (=> (not res!102169) (not e!80773))))

(declare-fun lt!194525 () (_ BitVec 64))

(declare-fun lt!194530 () (_ BitVec 64))

(assert (=> b!123246 (= res!102169 (= (bvlshr (_1!5470 lt!194532) lt!194530) (bvlshr lt!193309 lt!194525)))))

(assert (=> b!123246 (and (bvsge lt!194525 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!194525 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!123246 (= lt!194525 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(assert (=> b!123246 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand i!615 #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 i!615) #b10000000000000000000000000000000)))))

(assert (=> b!123246 (and (bvsge lt!194530 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!194530 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!123246 (= lt!194530 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(assert (=> b!123246 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand i!615 #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 i!615) #b10000000000000000000000000000000)))))

(declare-fun b!123247 () Bool)

(assert (=> b!123247 (= e!80773 e!80771)))

(declare-fun res!102171 () Bool)

(assert (=> b!123247 (=> res!102171 e!80771)))

(assert (=> b!123247 (= res!102171 (bvsge i!615 nBits!396))))

(assert (= (and d!39754 c!7364) b!123241))

(assert (= (and d!39754 (not c!7364)) b!123243))

(assert (= (and d!39754 res!102167) b!123244))

(assert (= (and b!123244 res!102168) b!123246))

(assert (= (and b!123246 res!102169) b!123245))

(assert (= (and b!123245 res!102170) b!123247))

(assert (= (and b!123247 (not res!102171)) b!123242))

(assert (=> b!123242 m!186595))

(assert (=> b!123243 m!186737))

(declare-fun m!187531 () Bool)

(assert (=> b!123243 m!187531))

(declare-fun m!187533 () Bool)

(assert (=> b!123244 m!187533))

(assert (=> b!123244 m!187143))

(assert (=> b!123245 m!186637))

(assert (=> d!39600 d!39754))

(declare-fun d!39756 () Bool)

(declare-fun e!80774 () Bool)

(assert (=> d!39756 e!80774))

(declare-fun res!102172 () Bool)

(assert (=> d!39756 (=> (not res!102172) (not e!80774))))

(declare-fun lt!194534 () (_ BitVec 64))

(declare-fun lt!194533 () BitStream!4392)

(assert (=> d!39756 (= res!102172 (= (bvadd lt!194534 (bvsub lt!193921 lt!193926)) (bitIndex!0 (size!2459 (buf!2899 lt!194533)) (currentByte!5596 lt!194533) (currentBit!5591 lt!194533))))))

(assert (=> d!39756 (or (not (= (bvand lt!194534 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!193921 lt!193926) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!194534 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!194534 (bvsub lt!193921 lt!193926)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39756 (= lt!194534 (bitIndex!0 (size!2459 (buf!2899 (_2!5463 lt!193920))) (currentByte!5596 (_2!5463 lt!193920)) (currentBit!5591 (_2!5463 lt!193920))))))

(assert (=> d!39756 (= lt!194533 (_2!5461 (moveBitIndex!0 (_2!5463 lt!193920) (bvsub lt!193921 lt!193926))))))

(assert (=> d!39756 (moveBitIndexPrecond!0 (_2!5463 lt!193920) (bvsub lt!193921 lt!193926))))

(assert (=> d!39756 (= (withMovedBitIndex!0 (_2!5463 lt!193920) (bvsub lt!193921 lt!193926)) lt!194533)))

(declare-fun b!123248 () Bool)

(assert (=> b!123248 (= e!80774 (= (size!2459 (buf!2899 (_2!5463 lt!193920))) (size!2459 (buf!2899 lt!194533))))))

(assert (= (and d!39756 res!102172) b!123248))

(declare-fun m!187535 () Bool)

(assert (=> d!39756 m!187535))

(declare-fun m!187537 () Bool)

(assert (=> d!39756 m!187537))

(declare-fun m!187539 () Bool)

(assert (=> d!39756 m!187539))

(declare-fun m!187541 () Bool)

(assert (=> d!39756 m!187541))

(assert (=> b!123015 d!39756))

(assert (=> b!123015 d!39626))

(assert (=> b!123015 d!39462))

(declare-fun d!39758 () Bool)

(assert (=> d!39758 (= (remainingBits!0 ((_ sign_extend 32) (size!2459 (buf!2899 (_2!5461 lt!193323)))) ((_ sign_extend 32) (currentByte!5596 (_2!5461 lt!193323))) ((_ sign_extend 32) (currentBit!5591 (_2!5461 lt!193323)))) (bvsub (bvmul ((_ sign_extend 32) (size!2459 (buf!2899 (_2!5461 lt!193323)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5596 (_2!5461 lt!193323))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5591 (_2!5461 lt!193323))))))))

(assert (=> d!39462 d!39758))

(assert (=> d!39462 d!39690))

(declare-fun d!39760 () Bool)

(assert (=> d!39760 (isPrefixOf!0 lt!193810 lt!193810)))

(declare-fun lt!194535 () Unit!7557)

(assert (=> d!39760 (= lt!194535 (choose!11 lt!193810))))

(assert (=> d!39760 (= (lemmaIsPrefixRefl!0 lt!193810) lt!194535)))

(declare-fun bs!9614 () Bool)

(assert (= bs!9614 d!39760))

(declare-fun m!187543 () Bool)

(assert (=> bs!9614 m!187543))

(declare-fun m!187545 () Bool)

(assert (=> bs!9614 m!187545))

(assert (=> b!122979 d!39760))

(declare-fun d!39762 () Bool)

(declare-fun lt!194536 () tuple2!10408)

(assert (=> d!39762 (= lt!194536 (readBit!0 (readerFrom!0 (_2!5461 lt!193832) (currentBit!5591 (_2!5461 lt!193323)) (currentByte!5596 (_2!5461 lt!193323)))))))

(assert (=> d!39762 (= (readBitPure!0 (readerFrom!0 (_2!5461 lt!193832) (currentBit!5591 (_2!5461 lt!193323)) (currentByte!5596 (_2!5461 lt!193323)))) (tuple2!10399 (_2!5469 lt!194536) (_1!5469 lt!194536)))))

(declare-fun bs!9615 () Bool)

(assert (= bs!9615 d!39762))

(assert (=> bs!9615 m!186953))

(declare-fun m!187547 () Bool)

(assert (=> bs!9615 m!187547))

(assert (=> b!122976 d!39762))

(declare-fun d!39764 () Bool)

(declare-fun e!80775 () Bool)

(assert (=> d!39764 e!80775))

(declare-fun res!102173 () Bool)

(assert (=> d!39764 (=> (not res!102173) (not e!80775))))

(assert (=> d!39764 (= res!102173 (invariant!0 (currentBit!5591 (_2!5461 lt!193832)) (currentByte!5596 (_2!5461 lt!193832)) (size!2459 (buf!2899 (_2!5461 lt!193832)))))))

(assert (=> d!39764 (= (readerFrom!0 (_2!5461 lt!193832) (currentBit!5591 (_2!5461 lt!193323)) (currentByte!5596 (_2!5461 lt!193323))) (BitStream!4393 (buf!2899 (_2!5461 lt!193832)) (currentByte!5596 (_2!5461 lt!193323)) (currentBit!5591 (_2!5461 lt!193323))))))

(declare-fun b!123249 () Bool)

(assert (=> b!123249 (= e!80775 (invariant!0 (currentBit!5591 (_2!5461 lt!193323)) (currentByte!5596 (_2!5461 lt!193323)) (size!2459 (buf!2899 (_2!5461 lt!193832)))))))

(assert (= (and d!39764 res!102173) b!123249))

(assert (=> d!39764 m!187499))

(declare-fun m!187549 () Bool)

(assert (=> b!123249 m!187549))

(assert (=> b!122976 d!39764))

(assert (=> d!39624 d!39600))

(declare-fun d!39766 () Bool)

(declare-fun lt!194537 () tuple2!10410)

(assert (=> d!39766 (= lt!194537 (readNLeastSignificantBitsLoop!0 lt!193988 nBits!396 (bvadd i!615 #b00000000000000000000000000000001) lt!193985))))

(assert (=> d!39766 (= (readNLeastSignificantBitsLoopPure!0 lt!193988 nBits!396 (bvadd i!615 #b00000000000000000000000000000001) lt!193985) (tuple2!10395 (_2!5470 lt!194537) (_1!5470 lt!194537)))))

(declare-fun bs!9616 () Bool)

(assert (= bs!9616 d!39766))

(declare-fun m!187551 () Bool)

(assert (=> bs!9616 m!187551))

(assert (=> d!39624 d!39766))

(declare-fun d!39768 () Bool)

(declare-fun lt!194543 () tuple2!10394)

(declare-fun lt!194542 () tuple2!10394)

(assert (=> d!39768 (and (= (_2!5462 lt!194543) (_2!5462 lt!194542)) (= (_1!5462 lt!194543) (_1!5462 lt!194542)))))

(declare-fun e!80778 () (_ BitVec 64))

(assert (=> d!39768 (= lt!194542 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!5463 lt!193305) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd i!615 #b00000000000000000000000000000001) (bvor lt!193309 e!80778)))))

(declare-fun c!7367 () Bool)

(assert (=> d!39768 (= c!7367 (_2!5464 (readBitPure!0 (_1!5463 lt!193305))))))

(assert (=> d!39768 (= lt!194543 (readNLeastSignificantBitsLoopPure!0 (_1!5463 lt!193305) nBits!396 i!615 lt!193309))))

(assert (=> d!39768 true))

(declare-fun _$11!47 () Unit!7557)

(assert (=> d!39768 (= (choose!45 (_1!5463 lt!193305) nBits!396 i!615 lt!193309 lt!193990 (tuple2!10395 (_1!5462 lt!193990) (_2!5462 lt!193990)) (_1!5462 lt!193990) (_2!5462 lt!193990) lt!193987 lt!193988 lt!193985 lt!193989 (tuple2!10395 (_1!5462 lt!193989) (_2!5462 lt!193989)) (_1!5462 lt!193989) (_2!5462 lt!193989)) _$11!47)))

(declare-fun b!123254 () Bool)

(assert (=> b!123254 (= e!80778 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!123255 () Bool)

(assert (=> b!123255 (= e!80778 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (= (and d!39768 c!7367) b!123254))

(assert (= (and d!39768 (not c!7367)) b!123255))

(assert (=> d!39768 m!186579))

(assert (=> d!39768 m!186579))

(declare-fun m!187553 () Bool)

(assert (=> d!39768 m!187553))

(assert (=> d!39768 m!186595))

(assert (=> d!39768 m!186621))

(assert (=> d!39624 d!39768))

(assert (=> d!39624 d!39622))

(assert (=> d!39624 d!39486))

(declare-fun d!39770 () Bool)

(declare-fun e!80779 () Bool)

(assert (=> d!39770 e!80779))

(declare-fun res!102174 () Bool)

(assert (=> d!39770 (=> (not res!102174) (not e!80779))))

(assert (=> d!39770 (= res!102174 (= (buf!2899 (_2!5461 (increaseBitIndex!0 (readerFrom!0 (_2!5461 lt!193323) (currentBit!5591 thiss!1305) (currentByte!5596 thiss!1305))))) (buf!2899 (readerFrom!0 (_2!5461 lt!193323) (currentBit!5591 thiss!1305) (currentByte!5596 thiss!1305)))))))

(declare-fun lt!194549 () Bool)

(assert (=> d!39770 (= lt!194549 (not (= (bvand ((_ sign_extend 24) (select (arr!3052 (buf!2899 (readerFrom!0 (_2!5461 lt!193323) (currentBit!5591 thiss!1305) (currentByte!5596 thiss!1305)))) (currentByte!5596 (readerFrom!0 (_2!5461 lt!193323) (currentBit!5591 thiss!1305) (currentByte!5596 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5591 (readerFrom!0 (_2!5461 lt!193323) (currentBit!5591 thiss!1305) (currentByte!5596 thiss!1305)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!194545 () tuple2!10408)

(assert (=> d!39770 (= lt!194545 (tuple2!10409 (not (= (bvand ((_ sign_extend 24) (select (arr!3052 (buf!2899 (readerFrom!0 (_2!5461 lt!193323) (currentBit!5591 thiss!1305) (currentByte!5596 thiss!1305)))) (currentByte!5596 (readerFrom!0 (_2!5461 lt!193323) (currentBit!5591 thiss!1305) (currentByte!5596 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5591 (readerFrom!0 (_2!5461 lt!193323) (currentBit!5591 thiss!1305) (currentByte!5596 thiss!1305)))))) #b00000000000000000000000000000000)) (_2!5461 (increaseBitIndex!0 (readerFrom!0 (_2!5461 lt!193323) (currentBit!5591 thiss!1305) (currentByte!5596 thiss!1305))))))))

(assert (=> d!39770 (validate_offset_bit!0 ((_ sign_extend 32) (size!2459 (buf!2899 (readerFrom!0 (_2!5461 lt!193323) (currentBit!5591 thiss!1305) (currentByte!5596 thiss!1305))))) ((_ sign_extend 32) (currentByte!5596 (readerFrom!0 (_2!5461 lt!193323) (currentBit!5591 thiss!1305) (currentByte!5596 thiss!1305)))) ((_ sign_extend 32) (currentBit!5591 (readerFrom!0 (_2!5461 lt!193323) (currentBit!5591 thiss!1305) (currentByte!5596 thiss!1305)))))))

(assert (=> d!39770 (= (readBit!0 (readerFrom!0 (_2!5461 lt!193323) (currentBit!5591 thiss!1305) (currentByte!5596 thiss!1305))) lt!194545)))

(declare-fun lt!194550 () (_ BitVec 64))

(declare-fun b!123256 () Bool)

(declare-fun lt!194544 () (_ BitVec 64))

(assert (=> b!123256 (= e!80779 (= (bitIndex!0 (size!2459 (buf!2899 (_2!5461 (increaseBitIndex!0 (readerFrom!0 (_2!5461 lt!193323) (currentBit!5591 thiss!1305) (currentByte!5596 thiss!1305)))))) (currentByte!5596 (_2!5461 (increaseBitIndex!0 (readerFrom!0 (_2!5461 lt!193323) (currentBit!5591 thiss!1305) (currentByte!5596 thiss!1305))))) (currentBit!5591 (_2!5461 (increaseBitIndex!0 (readerFrom!0 (_2!5461 lt!193323) (currentBit!5591 thiss!1305) (currentByte!5596 thiss!1305)))))) (bvadd lt!194550 lt!194544)))))

(assert (=> b!123256 (or (not (= (bvand lt!194550 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!194544 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!194550 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!194550 lt!194544) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!123256 (= lt!194544 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!123256 (= lt!194550 (bitIndex!0 (size!2459 (buf!2899 (readerFrom!0 (_2!5461 lt!193323) (currentBit!5591 thiss!1305) (currentByte!5596 thiss!1305)))) (currentByte!5596 (readerFrom!0 (_2!5461 lt!193323) (currentBit!5591 thiss!1305) (currentByte!5596 thiss!1305))) (currentBit!5591 (readerFrom!0 (_2!5461 lt!193323) (currentBit!5591 thiss!1305) (currentByte!5596 thiss!1305)))))))

(declare-fun lt!194548 () Bool)

(assert (=> b!123256 (= lt!194548 (not (= (bvand ((_ sign_extend 24) (select (arr!3052 (buf!2899 (readerFrom!0 (_2!5461 lt!193323) (currentBit!5591 thiss!1305) (currentByte!5596 thiss!1305)))) (currentByte!5596 (readerFrom!0 (_2!5461 lt!193323) (currentBit!5591 thiss!1305) (currentByte!5596 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5591 (readerFrom!0 (_2!5461 lt!193323) (currentBit!5591 thiss!1305) (currentByte!5596 thiss!1305)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!194547 () Bool)

(assert (=> b!123256 (= lt!194547 (not (= (bvand ((_ sign_extend 24) (select (arr!3052 (buf!2899 (readerFrom!0 (_2!5461 lt!193323) (currentBit!5591 thiss!1305) (currentByte!5596 thiss!1305)))) (currentByte!5596 (readerFrom!0 (_2!5461 lt!193323) (currentBit!5591 thiss!1305) (currentByte!5596 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5591 (readerFrom!0 (_2!5461 lt!193323) (currentBit!5591 thiss!1305) (currentByte!5596 thiss!1305)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!194546 () Bool)

(assert (=> b!123256 (= lt!194546 (not (= (bvand ((_ sign_extend 24) (select (arr!3052 (buf!2899 (readerFrom!0 (_2!5461 lt!193323) (currentBit!5591 thiss!1305) (currentByte!5596 thiss!1305)))) (currentByte!5596 (readerFrom!0 (_2!5461 lt!193323) (currentBit!5591 thiss!1305) (currentByte!5596 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5591 (readerFrom!0 (_2!5461 lt!193323) (currentBit!5591 thiss!1305) (currentByte!5596 thiss!1305)))))) #b00000000000000000000000000000000)))))

(assert (= (and d!39770 res!102174) b!123256))

(assert (=> d!39770 m!186585))

(declare-fun m!187555 () Bool)

(assert (=> d!39770 m!187555))

(declare-fun m!187557 () Bool)

(assert (=> d!39770 m!187557))

(declare-fun m!187559 () Bool)

(assert (=> d!39770 m!187559))

(declare-fun m!187561 () Bool)

(assert (=> d!39770 m!187561))

(declare-fun m!187563 () Bool)

(assert (=> b!123256 m!187563))

(assert (=> b!123256 m!186585))

(assert (=> b!123256 m!187555))

(assert (=> b!123256 m!187557))

(declare-fun m!187565 () Bool)

(assert (=> b!123256 m!187565))

(assert (=> b!123256 m!187559))

(assert (=> d!39472 d!39770))

(declare-fun d!39772 () Bool)

(assert (=> d!39772 (= (remainingBits!0 ((_ sign_extend 32) (size!2459 (buf!2899 (_1!5464 lt!193297)))) ((_ sign_extend 32) (currentByte!5596 (_1!5464 lt!193297))) ((_ sign_extend 32) (currentBit!5591 (_1!5464 lt!193297)))) (bvsub (bvmul ((_ sign_extend 32) (size!2459 (buf!2899 (_1!5464 lt!193297)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5596 (_1!5464 lt!193297))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5591 (_1!5464 lt!193297))))))))

(assert (=> d!39612 d!39772))

(declare-fun d!39774 () Bool)

(assert (=> d!39774 (= (invariant!0 (currentBit!5591 (_1!5464 lt!193297)) (currentByte!5596 (_1!5464 lt!193297)) (size!2459 (buf!2899 (_1!5464 lt!193297)))) (and (bvsge (currentBit!5591 (_1!5464 lt!193297)) #b00000000000000000000000000000000) (bvslt (currentBit!5591 (_1!5464 lt!193297)) #b00000000000000000000000000001000) (bvsge (currentByte!5596 (_1!5464 lt!193297)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5596 (_1!5464 lt!193297)) (size!2459 (buf!2899 (_1!5464 lt!193297)))) (and (= (currentBit!5591 (_1!5464 lt!193297)) #b00000000000000000000000000000000) (= (currentByte!5596 (_1!5464 lt!193297)) (size!2459 (buf!2899 (_1!5464 lt!193297))))))))))

(assert (=> d!39612 d!39774))

(declare-fun d!39776 () Bool)

(declare-fun e!80780 () Bool)

(assert (=> d!39776 e!80780))

(declare-fun res!102176 () Bool)

(assert (=> d!39776 (=> (not res!102176) (not e!80780))))

(declare-fun lt!194551 () (_ BitVec 64))

(declare-fun lt!194555 () (_ BitVec 64))

(declare-fun lt!194554 () (_ BitVec 64))

(assert (=> d!39776 (= res!102176 (= lt!194551 (bvsub lt!194555 lt!194554)))))

(assert (=> d!39776 (or (= (bvand lt!194555 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!194554 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!194555 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!194555 lt!194554) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39776 (= lt!194554 (remainingBits!0 ((_ sign_extend 32) (size!2459 (buf!2899 (_1!5464 lt!193826)))) ((_ sign_extend 32) (currentByte!5596 (_1!5464 lt!193826))) ((_ sign_extend 32) (currentBit!5591 (_1!5464 lt!193826)))))))

(declare-fun lt!194556 () (_ BitVec 64))

(declare-fun lt!194553 () (_ BitVec 64))

(assert (=> d!39776 (= lt!194555 (bvmul lt!194556 lt!194553))))

(assert (=> d!39776 (or (= lt!194556 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!194553 (bvsdiv (bvmul lt!194556 lt!194553) lt!194556)))))

(assert (=> d!39776 (= lt!194553 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!39776 (= lt!194556 ((_ sign_extend 32) (size!2459 (buf!2899 (_1!5464 lt!193826)))))))

(assert (=> d!39776 (= lt!194551 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5596 (_1!5464 lt!193826))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5591 (_1!5464 lt!193826)))))))

(assert (=> d!39776 (invariant!0 (currentBit!5591 (_1!5464 lt!193826)) (currentByte!5596 (_1!5464 lt!193826)) (size!2459 (buf!2899 (_1!5464 lt!193826))))))

(assert (=> d!39776 (= (bitIndex!0 (size!2459 (buf!2899 (_1!5464 lt!193826))) (currentByte!5596 (_1!5464 lt!193826)) (currentBit!5591 (_1!5464 lt!193826))) lt!194551)))

(declare-fun b!123257 () Bool)

(declare-fun res!102175 () Bool)

(assert (=> b!123257 (=> (not res!102175) (not e!80780))))

(assert (=> b!123257 (= res!102175 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!194551))))

(declare-fun b!123258 () Bool)

(declare-fun lt!194552 () (_ BitVec 64))

(assert (=> b!123258 (= e!80780 (bvsle lt!194551 (bvmul lt!194552 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123258 (or (= lt!194552 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!194552 #b0000000000000000000000000000000000000000000000000000000000001000) lt!194552)))))

(assert (=> b!123258 (= lt!194552 ((_ sign_extend 32) (size!2459 (buf!2899 (_1!5464 lt!193826)))))))

(assert (= (and d!39776 res!102176) b!123257))

(assert (= (and b!123257 res!102175) b!123258))

(declare-fun m!187567 () Bool)

(assert (=> d!39776 m!187567))

(declare-fun m!187569 () Bool)

(assert (=> d!39776 m!187569))

(assert (=> b!122974 d!39776))

(assert (=> b!122974 d!39730))

(declare-fun d!39778 () Bool)

(declare-fun res!102179 () Bool)

(declare-fun e!80782 () Bool)

(assert (=> d!39778 (=> (not res!102179) (not e!80782))))

(assert (=> d!39778 (= res!102179 (= (size!2459 (buf!2899 (_1!5463 lt!193943))) (size!2459 (buf!2899 thiss!1305))))))

(assert (=> d!39778 (= (isPrefixOf!0 (_1!5463 lt!193943) thiss!1305) e!80782)))

(declare-fun b!123259 () Bool)

(declare-fun res!102177 () Bool)

(assert (=> b!123259 (=> (not res!102177) (not e!80782))))

(assert (=> b!123259 (= res!102177 (bvsle (bitIndex!0 (size!2459 (buf!2899 (_1!5463 lt!193943))) (currentByte!5596 (_1!5463 lt!193943)) (currentBit!5591 (_1!5463 lt!193943))) (bitIndex!0 (size!2459 (buf!2899 thiss!1305)) (currentByte!5596 thiss!1305) (currentBit!5591 thiss!1305))))))

(declare-fun b!123260 () Bool)

(declare-fun e!80781 () Bool)

(assert (=> b!123260 (= e!80782 e!80781)))

(declare-fun res!102178 () Bool)

(assert (=> b!123260 (=> res!102178 e!80781)))

(assert (=> b!123260 (= res!102178 (= (size!2459 (buf!2899 (_1!5463 lt!193943))) #b00000000000000000000000000000000))))

(declare-fun b!123261 () Bool)

(assert (=> b!123261 (= e!80781 (arrayBitRangesEq!0 (buf!2899 (_1!5463 lt!193943)) (buf!2899 thiss!1305) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2459 (buf!2899 (_1!5463 lt!193943))) (currentByte!5596 (_1!5463 lt!193943)) (currentBit!5591 (_1!5463 lt!193943)))))))

(assert (= (and d!39778 res!102179) b!123259))

(assert (= (and b!123259 res!102177) b!123260))

(assert (= (and b!123260 (not res!102178)) b!123261))

(assert (=> b!123259 m!187471))

(assert (=> b!123259 m!186569))

(assert (=> b!123261 m!187471))

(assert (=> b!123261 m!187471))

(declare-fun m!187571 () Bool)

(assert (=> b!123261 m!187571))

(assert (=> b!123022 d!39778))

(declare-fun d!39780 () Bool)

(declare-fun e!80783 () Bool)

(assert (=> d!39780 e!80783))

(declare-fun res!102181 () Bool)

(assert (=> d!39780 (=> (not res!102181) (not e!80783))))

(declare-fun lt!194560 () (_ BitVec 64))

(declare-fun lt!194557 () (_ BitVec 64))

(declare-fun lt!194561 () (_ BitVec 64))

(assert (=> d!39780 (= res!102181 (= lt!194557 (bvsub lt!194561 lt!194560)))))

(assert (=> d!39780 (or (= (bvand lt!194561 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!194560 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!194561 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!194561 lt!194560) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39780 (= lt!194560 (remainingBits!0 ((_ sign_extend 32) (size!2459 (buf!2899 lt!193966))) ((_ sign_extend 32) (currentByte!5596 lt!193966)) ((_ sign_extend 32) (currentBit!5591 lt!193966))))))

(declare-fun lt!194562 () (_ BitVec 64))

(declare-fun lt!194559 () (_ BitVec 64))

(assert (=> d!39780 (= lt!194561 (bvmul lt!194562 lt!194559))))

(assert (=> d!39780 (or (= lt!194562 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!194559 (bvsdiv (bvmul lt!194562 lt!194559) lt!194562)))))

(assert (=> d!39780 (= lt!194559 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!39780 (= lt!194562 ((_ sign_extend 32) (size!2459 (buf!2899 lt!193966))))))

(assert (=> d!39780 (= lt!194557 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5596 lt!193966)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5591 lt!193966))))))

(assert (=> d!39780 (invariant!0 (currentBit!5591 lt!193966) (currentByte!5596 lt!193966) (size!2459 (buf!2899 lt!193966)))))

(assert (=> d!39780 (= (bitIndex!0 (size!2459 (buf!2899 lt!193966)) (currentByte!5596 lt!193966) (currentBit!5591 lt!193966)) lt!194557)))

(declare-fun b!123262 () Bool)

(declare-fun res!102180 () Bool)

(assert (=> b!123262 (=> (not res!102180) (not e!80783))))

(assert (=> b!123262 (= res!102180 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!194557))))

(declare-fun b!123263 () Bool)

(declare-fun lt!194558 () (_ BitVec 64))

(assert (=> b!123263 (= e!80783 (bvsle lt!194557 (bvmul lt!194558 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123263 (or (= lt!194558 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!194558 #b0000000000000000000000000000000000000000000000000000000000001000) lt!194558)))))

(assert (=> b!123263 (= lt!194558 ((_ sign_extend 32) (size!2459 (buf!2899 lt!193966))))))

(assert (= (and d!39780 res!102181) b!123262))

(assert (= (and b!123262 res!102180) b!123263))

(declare-fun m!187573 () Bool)

(assert (=> d!39780 m!187573))

(declare-fun m!187575 () Bool)

(assert (=> d!39780 m!187575))

(assert (=> d!39616 d!39780))

(declare-fun d!39782 () Bool)

(declare-fun e!80784 () Bool)

(assert (=> d!39782 e!80784))

(declare-fun res!102183 () Bool)

(assert (=> d!39782 (=> (not res!102183) (not e!80784))))

(declare-fun lt!194566 () (_ BitVec 64))

(declare-fun lt!194567 () (_ BitVec 64))

(declare-fun lt!194563 () (_ BitVec 64))

(assert (=> d!39782 (= res!102183 (= lt!194563 (bvsub lt!194567 lt!194566)))))

(assert (=> d!39782 (or (= (bvand lt!194567 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!194566 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!194567 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!194567 lt!194566) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39782 (= lt!194566 (remainingBits!0 ((_ sign_extend 32) (size!2459 (buf!2899 (_2!5463 lt!193305)))) ((_ sign_extend 32) (currentByte!5596 (_2!5463 lt!193305))) ((_ sign_extend 32) (currentBit!5591 (_2!5463 lt!193305)))))))

(declare-fun lt!194568 () (_ BitVec 64))

(declare-fun lt!194565 () (_ BitVec 64))

(assert (=> d!39782 (= lt!194567 (bvmul lt!194568 lt!194565))))

(assert (=> d!39782 (or (= lt!194568 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!194565 (bvsdiv (bvmul lt!194568 lt!194565) lt!194568)))))

(assert (=> d!39782 (= lt!194565 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!39782 (= lt!194568 ((_ sign_extend 32) (size!2459 (buf!2899 (_2!5463 lt!193305)))))))

(assert (=> d!39782 (= lt!194563 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5596 (_2!5463 lt!193305))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5591 (_2!5463 lt!193305)))))))

(assert (=> d!39782 (invariant!0 (currentBit!5591 (_2!5463 lt!193305)) (currentByte!5596 (_2!5463 lt!193305)) (size!2459 (buf!2899 (_2!5463 lt!193305))))))

(assert (=> d!39782 (= (bitIndex!0 (size!2459 (buf!2899 (_2!5463 lt!193305))) (currentByte!5596 (_2!5463 lt!193305)) (currentBit!5591 (_2!5463 lt!193305))) lt!194563)))

(declare-fun b!123264 () Bool)

(declare-fun res!102182 () Bool)

(assert (=> b!123264 (=> (not res!102182) (not e!80784))))

(assert (=> b!123264 (= res!102182 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!194563))))

(declare-fun b!123265 () Bool)

(declare-fun lt!194564 () (_ BitVec 64))

(assert (=> b!123265 (= e!80784 (bvsle lt!194563 (bvmul lt!194564 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123265 (or (= lt!194564 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!194564 #b0000000000000000000000000000000000000000000000000000000000001000) lt!194564)))))

(assert (=> b!123265 (= lt!194564 ((_ sign_extend 32) (size!2459 (buf!2899 (_2!5463 lt!193305)))))))

(assert (= (and d!39782 res!102183) b!123264))

(assert (= (and b!123264 res!102182) b!123265))

(declare-fun m!187577 () Bool)

(assert (=> d!39782 m!187577))

(declare-fun m!187579 () Bool)

(assert (=> d!39782 m!187579))

(assert (=> d!39616 d!39782))

(declare-fun d!39784 () Bool)

(declare-fun lt!194574 () (_ BitVec 32))

(assert (=> d!39784 (= lt!194574 ((_ extract 31 0) (bvsrem (bvsub lt!193314 lt!193316) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!194572 () (_ BitVec 32))

(assert (=> d!39784 (= lt!194572 ((_ extract 31 0) (bvsdiv (bvsub lt!193314 lt!193316) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!80786 () Bool)

(assert (=> d!39784 e!80786))

(declare-fun res!102184 () Bool)

(assert (=> d!39784 (=> (not res!102184) (not e!80786))))

(assert (=> d!39784 (= res!102184 (moveBitIndexPrecond!0 (_2!5463 lt!193305) (bvsub lt!193314 lt!193316)))))

(declare-fun Unit!7591 () Unit!7557)

(declare-fun Unit!7592 () Unit!7557)

(declare-fun Unit!7593 () Unit!7557)

(assert (=> d!39784 (= (moveBitIndex!0 (_2!5463 lt!193305) (bvsub lt!193314 lt!193316)) (ite (bvslt (bvadd (currentBit!5591 (_2!5463 lt!193305)) lt!194574) #b00000000000000000000000000000000) (tuple2!10393 Unit!7591 (BitStream!4393 (buf!2899 (_2!5463 lt!193305)) (bvsub (bvadd (currentByte!5596 (_2!5463 lt!193305)) lt!194572) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!194574 (currentBit!5591 (_2!5463 lt!193305))))) (ite (bvsge (bvadd (currentBit!5591 (_2!5463 lt!193305)) lt!194574) #b00000000000000000000000000001000) (tuple2!10393 Unit!7592 (BitStream!4393 (buf!2899 (_2!5463 lt!193305)) (bvadd (currentByte!5596 (_2!5463 lt!193305)) lt!194572 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!5591 (_2!5463 lt!193305)) lt!194574) #b00000000000000000000000000001000))) (tuple2!10393 Unit!7593 (BitStream!4393 (buf!2899 (_2!5463 lt!193305)) (bvadd (currentByte!5596 (_2!5463 lt!193305)) lt!194572) (bvadd (currentBit!5591 (_2!5463 lt!193305)) lt!194574))))))))

(declare-fun b!123266 () Bool)

(declare-fun e!80785 () Bool)

(assert (=> b!123266 (= e!80786 e!80785)))

(declare-fun res!102185 () Bool)

(assert (=> b!123266 (=> (not res!102185) (not e!80785))))

(declare-fun lt!194571 () tuple2!10392)

(declare-fun lt!194573 () (_ BitVec 64))

(assert (=> b!123266 (= res!102185 (= (bvadd lt!194573 (bvsub lt!193314 lt!193316)) (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!194571))) (currentByte!5596 (_2!5461 lt!194571)) (currentBit!5591 (_2!5461 lt!194571)))))))

(assert (=> b!123266 (or (not (= (bvand lt!194573 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!193314 lt!193316) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!194573 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!194573 (bvsub lt!193314 lt!193316)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!123266 (= lt!194573 (bitIndex!0 (size!2459 (buf!2899 (_2!5463 lt!193305))) (currentByte!5596 (_2!5463 lt!193305)) (currentBit!5591 (_2!5463 lt!193305))))))

(declare-fun lt!194569 () (_ BitVec 32))

(declare-fun lt!194570 () (_ BitVec 32))

(declare-fun Unit!7594 () Unit!7557)

(declare-fun Unit!7595 () Unit!7557)

(declare-fun Unit!7596 () Unit!7557)

(assert (=> b!123266 (= lt!194571 (ite (bvslt (bvadd (currentBit!5591 (_2!5463 lt!193305)) lt!194569) #b00000000000000000000000000000000) (tuple2!10393 Unit!7594 (BitStream!4393 (buf!2899 (_2!5463 lt!193305)) (bvsub (bvadd (currentByte!5596 (_2!5463 lt!193305)) lt!194570) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!194569 (currentBit!5591 (_2!5463 lt!193305))))) (ite (bvsge (bvadd (currentBit!5591 (_2!5463 lt!193305)) lt!194569) #b00000000000000000000000000001000) (tuple2!10393 Unit!7595 (BitStream!4393 (buf!2899 (_2!5463 lt!193305)) (bvadd (currentByte!5596 (_2!5463 lt!193305)) lt!194570 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!5591 (_2!5463 lt!193305)) lt!194569) #b00000000000000000000000000001000))) (tuple2!10393 Unit!7596 (BitStream!4393 (buf!2899 (_2!5463 lt!193305)) (bvadd (currentByte!5596 (_2!5463 lt!193305)) lt!194570) (bvadd (currentBit!5591 (_2!5463 lt!193305)) lt!194569))))))))

(assert (=> b!123266 (= lt!194569 ((_ extract 31 0) (bvsrem (bvsub lt!193314 lt!193316) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123266 (= lt!194570 ((_ extract 31 0) (bvsdiv (bvsub lt!193314 lt!193316) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!123267 () Bool)

(assert (=> b!123267 (= e!80785 (and (= (size!2459 (buf!2899 (_2!5463 lt!193305))) (size!2459 (buf!2899 (_2!5461 lt!194571)))) (= (buf!2899 (_2!5463 lt!193305)) (buf!2899 (_2!5461 lt!194571)))))))

(assert (= (and d!39784 res!102184) b!123266))

(assert (= (and b!123266 res!102185) b!123267))

(assert (=> d!39784 m!187129))

(declare-fun m!187581 () Bool)

(assert (=> b!123266 m!187581))

(assert (=> b!123266 m!187125))

(assert (=> d!39616 d!39784))

(declare-fun d!39786 () Bool)

(declare-fun res!102186 () Bool)

(declare-fun e!80787 () Bool)

(assert (=> d!39786 (=> (not res!102186) (not e!80787))))

(assert (=> d!39786 (= res!102186 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!2459 (buf!2899 (_2!5463 lt!193305))))) (bvsub lt!193314 lt!193316)) (bvsle (bvsub lt!193314 lt!193316) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2459 (buf!2899 (_2!5463 lt!193305))))))))))

(assert (=> d!39786 (= (moveBitIndexPrecond!0 (_2!5463 lt!193305) (bvsub lt!193314 lt!193316)) e!80787)))

(declare-fun b!123268 () Bool)

(declare-fun lt!194575 () (_ BitVec 64))

(assert (=> b!123268 (= e!80787 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!194575) (bvsle lt!194575 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2459 (buf!2899 (_2!5463 lt!193305))))))))))

(assert (=> b!123268 (= lt!194575 (bvadd (bitIndex!0 (size!2459 (buf!2899 (_2!5463 lt!193305))) (currentByte!5596 (_2!5463 lt!193305)) (currentBit!5591 (_2!5463 lt!193305))) (bvsub lt!193314 lt!193316)))))

(assert (= (and d!39786 res!102186) b!123268))

(assert (=> b!123268 m!187125))

(assert (=> d!39616 d!39786))

(assert (=> d!39604 d!39592))

(declare-fun d!39788 () Bool)

(assert (=> d!39788 (isPrefixOf!0 thiss!1305 (_2!5461 lt!193308))))

(assert (=> d!39788 true))

(declare-fun _$15!192 () Unit!7557)

(assert (=> d!39788 (= (choose!30 thiss!1305 (_2!5461 lt!193323) (_2!5461 lt!193308)) _$15!192)))

(declare-fun bs!9618 () Bool)

(assert (= bs!9618 d!39788))

(assert (=> bs!9618 m!186615))

(assert (=> d!39604 d!39788))

(assert (=> d!39604 d!39466))

(assert (=> d!39602 d!39712))

(declare-fun d!39790 () Bool)

(assert (=> d!39790 (isPrefixOf!0 lt!193927 (_2!5461 lt!193308))))

(declare-fun lt!194576 () Unit!7557)

(assert (=> d!39790 (= lt!194576 (choose!30 lt!193927 (_2!5461 lt!193308) (_2!5461 lt!193308)))))

(assert (=> d!39790 (isPrefixOf!0 lt!193927 (_2!5461 lt!193308))))

(assert (=> d!39790 (= (lemmaIsPrefixTransitive!0 lt!193927 (_2!5461 lt!193308) (_2!5461 lt!193308)) lt!194576)))

(declare-fun bs!9619 () Bool)

(assert (= bs!9619 d!39790))

(assert (=> bs!9619 m!187059))

(declare-fun m!187583 () Bool)

(assert (=> bs!9619 m!187583))

(assert (=> bs!9619 m!187059))

(assert (=> d!39602 d!39790))

(declare-fun d!39792 () Bool)

(declare-fun res!102189 () Bool)

(declare-fun e!80789 () Bool)

(assert (=> d!39792 (=> (not res!102189) (not e!80789))))

(assert (=> d!39792 (= res!102189 (= (size!2459 (buf!2899 (_1!5463 lt!193920))) (size!2459 (buf!2899 (_2!5463 lt!193920)))))))

(assert (=> d!39792 (= (isPrefixOf!0 (_1!5463 lt!193920) (_2!5463 lt!193920)) e!80789)))

(declare-fun b!123269 () Bool)

(declare-fun res!102187 () Bool)

(assert (=> b!123269 (=> (not res!102187) (not e!80789))))

(assert (=> b!123269 (= res!102187 (bvsle (bitIndex!0 (size!2459 (buf!2899 (_1!5463 lt!193920))) (currentByte!5596 (_1!5463 lt!193920)) (currentBit!5591 (_1!5463 lt!193920))) (bitIndex!0 (size!2459 (buf!2899 (_2!5463 lt!193920))) (currentByte!5596 (_2!5463 lt!193920)) (currentBit!5591 (_2!5463 lt!193920)))))))

(declare-fun b!123270 () Bool)

(declare-fun e!80788 () Bool)

(assert (=> b!123270 (= e!80789 e!80788)))

(declare-fun res!102188 () Bool)

(assert (=> b!123270 (=> res!102188 e!80788)))

(assert (=> b!123270 (= res!102188 (= (size!2459 (buf!2899 (_1!5463 lt!193920))) #b00000000000000000000000000000000))))

(declare-fun b!123271 () Bool)

(assert (=> b!123271 (= e!80788 (arrayBitRangesEq!0 (buf!2899 (_1!5463 lt!193920)) (buf!2899 (_2!5463 lt!193920)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2459 (buf!2899 (_1!5463 lt!193920))) (currentByte!5596 (_1!5463 lt!193920)) (currentBit!5591 (_1!5463 lt!193920)))))))

(assert (= (and d!39792 res!102189) b!123269))

(assert (= (and b!123269 res!102187) b!123270))

(assert (= (and b!123270 (not res!102188)) b!123271))

(assert (=> b!123269 m!187501))

(assert (=> b!123269 m!187537))

(assert (=> b!123271 m!187501))

(assert (=> b!123271 m!187501))

(declare-fun m!187585 () Bool)

(assert (=> b!123271 m!187585))

(assert (=> d!39602 d!39792))

(declare-fun d!39794 () Bool)

(assert (=> d!39794 (isPrefixOf!0 lt!193927 lt!193927)))

(declare-fun lt!194577 () Unit!7557)

(assert (=> d!39794 (= lt!194577 (choose!11 lt!193927))))

(assert (=> d!39794 (= (lemmaIsPrefixRefl!0 lt!193927) lt!194577)))

(declare-fun bs!9620 () Bool)

(assert (= bs!9620 d!39794))

(assert (=> bs!9620 m!187061))

(declare-fun m!187587 () Bool)

(assert (=> bs!9620 m!187587))

(assert (=> d!39602 d!39794))

(declare-fun d!39796 () Bool)

(assert (=> d!39796 (isPrefixOf!0 lt!193927 (_2!5461 lt!193308))))

(declare-fun lt!194578 () Unit!7557)

(assert (=> d!39796 (= lt!194578 (choose!30 lt!193927 (_2!5461 lt!193323) (_2!5461 lt!193308)))))

(assert (=> d!39796 (isPrefixOf!0 lt!193927 (_2!5461 lt!193323))))

(assert (=> d!39796 (= (lemmaIsPrefixTransitive!0 lt!193927 (_2!5461 lt!193323) (_2!5461 lt!193308)) lt!194578)))

(declare-fun bs!9621 () Bool)

(assert (= bs!9621 d!39796))

(assert (=> bs!9621 m!187059))

(declare-fun m!187589 () Bool)

(assert (=> bs!9621 m!187589))

(declare-fun m!187591 () Bool)

(assert (=> bs!9621 m!187591))

(assert (=> d!39602 d!39796))

(assert (=> d!39602 d!39704))

(declare-fun d!39798 () Bool)

(declare-fun res!102192 () Bool)

(declare-fun e!80791 () Bool)

(assert (=> d!39798 (=> (not res!102192) (not e!80791))))

(assert (=> d!39798 (= res!102192 (= (size!2459 (buf!2899 lt!193927)) (size!2459 (buf!2899 (_2!5461 lt!193308)))))))

(assert (=> d!39798 (= (isPrefixOf!0 lt!193927 (_2!5461 lt!193308)) e!80791)))

(declare-fun b!123272 () Bool)

(declare-fun res!102190 () Bool)

(assert (=> b!123272 (=> (not res!102190) (not e!80791))))

(assert (=> b!123272 (= res!102190 (bvsle (bitIndex!0 (size!2459 (buf!2899 lt!193927)) (currentByte!5596 lt!193927) (currentBit!5591 lt!193927)) (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193308))) (currentByte!5596 (_2!5461 lt!193308)) (currentBit!5591 (_2!5461 lt!193308)))))))

(declare-fun b!123273 () Bool)

(declare-fun e!80790 () Bool)

(assert (=> b!123273 (= e!80791 e!80790)))

(declare-fun res!102191 () Bool)

(assert (=> b!123273 (=> res!102191 e!80790)))

(assert (=> b!123273 (= res!102191 (= (size!2459 (buf!2899 lt!193927)) #b00000000000000000000000000000000))))

(declare-fun b!123274 () Bool)

(assert (=> b!123274 (= e!80790 (arrayBitRangesEq!0 (buf!2899 lt!193927) (buf!2899 (_2!5461 lt!193308)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2459 (buf!2899 lt!193927)) (currentByte!5596 lt!193927) (currentBit!5591 lt!193927))))))

(assert (= (and d!39798 res!102192) b!123272))

(assert (= (and b!123272 res!102190) b!123273))

(assert (= (and b!123273 (not res!102191)) b!123274))

(declare-fun m!187593 () Bool)

(assert (=> b!123272 m!187593))

(assert (=> b!123272 m!186577))

(assert (=> b!123274 m!187593))

(assert (=> b!123274 m!187593))

(declare-fun m!187595 () Bool)

(assert (=> b!123274 m!187595))

(assert (=> d!39602 d!39798))

(declare-fun d!39800 () Bool)

(declare-fun res!102195 () Bool)

(declare-fun e!80793 () Bool)

(assert (=> d!39800 (=> (not res!102195) (not e!80793))))

(assert (=> d!39800 (= res!102195 (= (size!2459 (buf!2899 (_2!5461 lt!193323))) (size!2459 (buf!2899 (_2!5461 lt!193308)))))))

(assert (=> d!39800 (= (isPrefixOf!0 (_2!5461 lt!193323) (_2!5461 lt!193308)) e!80793)))

(declare-fun b!123275 () Bool)

(declare-fun res!102193 () Bool)

(assert (=> b!123275 (=> (not res!102193) (not e!80793))))

(assert (=> b!123275 (= res!102193 (bvsle (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193323))) (currentByte!5596 (_2!5461 lt!193323)) (currentBit!5591 (_2!5461 lt!193323))) (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193308))) (currentByte!5596 (_2!5461 lt!193308)) (currentBit!5591 (_2!5461 lt!193308)))))))

(declare-fun b!123276 () Bool)

(declare-fun e!80792 () Bool)

(assert (=> b!123276 (= e!80793 e!80792)))

(declare-fun res!102194 () Bool)

(assert (=> b!123276 (=> res!102194 e!80792)))

(assert (=> b!123276 (= res!102194 (= (size!2459 (buf!2899 (_2!5461 lt!193323))) #b00000000000000000000000000000000))))

(declare-fun b!123277 () Bool)

(assert (=> b!123277 (= e!80792 (arrayBitRangesEq!0 (buf!2899 (_2!5461 lt!193323)) (buf!2899 (_2!5461 lt!193308)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193323))) (currentByte!5596 (_2!5461 lt!193323)) (currentBit!5591 (_2!5461 lt!193323)))))))

(assert (= (and d!39800 res!102195) b!123275))

(assert (= (and b!123275 res!102193) b!123276))

(assert (= (and b!123276 (not res!102194)) b!123277))

(assert (=> b!123275 m!186565))

(assert (=> b!123275 m!186577))

(assert (=> b!123277 m!186565))

(assert (=> b!123277 m!186565))

(declare-fun m!187597 () Bool)

(assert (=> b!123277 m!187597))

(assert (=> d!39602 d!39800))

(declare-fun d!39802 () Bool)

(declare-fun res!102198 () Bool)

(declare-fun e!80795 () Bool)

(assert (=> d!39802 (=> (not res!102198) (not e!80795))))

(assert (=> d!39802 (= res!102198 (= (size!2459 (buf!2899 lt!193927)) (size!2459 (buf!2899 lt!193927))))))

(assert (=> d!39802 (= (isPrefixOf!0 lt!193927 lt!193927) e!80795)))

(declare-fun b!123278 () Bool)

(declare-fun res!102196 () Bool)

(assert (=> b!123278 (=> (not res!102196) (not e!80795))))

(assert (=> b!123278 (= res!102196 (bvsle (bitIndex!0 (size!2459 (buf!2899 lt!193927)) (currentByte!5596 lt!193927) (currentBit!5591 lt!193927)) (bitIndex!0 (size!2459 (buf!2899 lt!193927)) (currentByte!5596 lt!193927) (currentBit!5591 lt!193927))))))

(declare-fun b!123279 () Bool)

(declare-fun e!80794 () Bool)

(assert (=> b!123279 (= e!80795 e!80794)))

(declare-fun res!102197 () Bool)

(assert (=> b!123279 (=> res!102197 e!80794)))

(assert (=> b!123279 (= res!102197 (= (size!2459 (buf!2899 lt!193927)) #b00000000000000000000000000000000))))

(declare-fun b!123280 () Bool)

(assert (=> b!123280 (= e!80794 (arrayBitRangesEq!0 (buf!2899 lt!193927) (buf!2899 lt!193927) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2459 (buf!2899 lt!193927)) (currentByte!5596 lt!193927) (currentBit!5591 lt!193927))))))

(assert (= (and d!39802 res!102198) b!123278))

(assert (= (and b!123278 res!102196) b!123279))

(assert (= (and b!123279 (not res!102197)) b!123280))

(assert (=> b!123278 m!187593))

(assert (=> b!123278 m!187593))

(assert (=> b!123280 m!187593))

(assert (=> b!123280 m!187593))

(declare-fun m!187599 () Bool)

(assert (=> b!123280 m!187599))

(assert (=> d!39602 d!39802))

(declare-fun d!39804 () Bool)

(assert (=> d!39804 (isPrefixOf!0 (_2!5461 lt!193323) (_2!5461 lt!193323))))

(declare-fun lt!194579 () Unit!7557)

(assert (=> d!39804 (= lt!194579 (choose!11 (_2!5461 lt!193323)))))

(assert (=> d!39804 (= (lemmaIsPrefixRefl!0 (_2!5461 lt!193323)) lt!194579)))

(declare-fun bs!9622 () Bool)

(assert (= bs!9622 d!39804))

(assert (=> bs!9622 m!187065))

(declare-fun m!187601 () Bool)

(assert (=> bs!9622 m!187601))

(assert (=> d!39602 d!39804))

(declare-fun d!39806 () Bool)

(declare-fun res!102201 () Bool)

(declare-fun e!80797 () Bool)

(assert (=> d!39806 (=> (not res!102201) (not e!80797))))

(assert (=> d!39806 (= res!102201 (= (size!2459 (buf!2899 (_2!5461 lt!193323))) (size!2459 (buf!2899 (_2!5461 lt!193323)))))))

(assert (=> d!39806 (= (isPrefixOf!0 (_2!5461 lt!193323) (_2!5461 lt!193323)) e!80797)))

(declare-fun b!123281 () Bool)

(declare-fun res!102199 () Bool)

(assert (=> b!123281 (=> (not res!102199) (not e!80797))))

(assert (=> b!123281 (= res!102199 (bvsle (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193323))) (currentByte!5596 (_2!5461 lt!193323)) (currentBit!5591 (_2!5461 lt!193323))) (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193323))) (currentByte!5596 (_2!5461 lt!193323)) (currentBit!5591 (_2!5461 lt!193323)))))))

(declare-fun b!123282 () Bool)

(declare-fun e!80796 () Bool)

(assert (=> b!123282 (= e!80797 e!80796)))

(declare-fun res!102200 () Bool)

(assert (=> b!123282 (=> res!102200 e!80796)))

(assert (=> b!123282 (= res!102200 (= (size!2459 (buf!2899 (_2!5461 lt!193323))) #b00000000000000000000000000000000))))

(declare-fun b!123283 () Bool)

(assert (=> b!123283 (= e!80796 (arrayBitRangesEq!0 (buf!2899 (_2!5461 lt!193323)) (buf!2899 (_2!5461 lt!193323)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193323))) (currentByte!5596 (_2!5461 lt!193323)) (currentBit!5591 (_2!5461 lt!193323)))))))

(assert (= (and d!39806 res!102201) b!123281))

(assert (= (and b!123281 res!102199) b!123282))

(assert (= (and b!123282 (not res!102200)) b!123283))

(assert (=> b!123281 m!186565))

(assert (=> b!123281 m!186565))

(assert (=> b!123283 m!186565))

(assert (=> b!123283 m!186565))

(declare-fun m!187603 () Bool)

(assert (=> b!123283 m!187603))

(assert (=> d!39602 d!39806))

(declare-fun d!39808 () Bool)

(declare-fun e!80798 () Bool)

(assert (=> d!39808 e!80798))

(declare-fun res!102203 () Bool)

(assert (=> d!39808 (=> (not res!102203) (not e!80798))))

(declare-fun lt!194584 () (_ BitVec 64))

(declare-fun lt!194580 () (_ BitVec 64))

(declare-fun lt!194583 () (_ BitVec 64))

(assert (=> d!39808 (= res!102203 (= lt!194580 (bvsub lt!194584 lt!194583)))))

(assert (=> d!39808 (or (= (bvand lt!194584 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!194583 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!194584 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!194584 lt!194583) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39808 (= lt!194583 (remainingBits!0 ((_ sign_extend 32) (size!2459 (buf!2899 lt!193969))) ((_ sign_extend 32) (currentByte!5596 lt!193969)) ((_ sign_extend 32) (currentBit!5591 lt!193969))))))

(declare-fun lt!194585 () (_ BitVec 64))

(declare-fun lt!194582 () (_ BitVec 64))

(assert (=> d!39808 (= lt!194584 (bvmul lt!194585 lt!194582))))

(assert (=> d!39808 (or (= lt!194585 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!194582 (bvsdiv (bvmul lt!194585 lt!194582) lt!194585)))))

(assert (=> d!39808 (= lt!194582 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!39808 (= lt!194585 ((_ sign_extend 32) (size!2459 (buf!2899 lt!193969))))))

(assert (=> d!39808 (= lt!194580 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5596 lt!193969)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5591 lt!193969))))))

(assert (=> d!39808 (invariant!0 (currentBit!5591 lt!193969) (currentByte!5596 lt!193969) (size!2459 (buf!2899 lt!193969)))))

(assert (=> d!39808 (= (bitIndex!0 (size!2459 (buf!2899 lt!193969)) (currentByte!5596 lt!193969) (currentBit!5591 lt!193969)) lt!194580)))

(declare-fun b!123284 () Bool)

(declare-fun res!102202 () Bool)

(assert (=> b!123284 (=> (not res!102202) (not e!80798))))

(assert (=> b!123284 (= res!102202 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!194580))))

(declare-fun b!123285 () Bool)

(declare-fun lt!194581 () (_ BitVec 64))

(assert (=> b!123285 (= e!80798 (bvsle lt!194580 (bvmul lt!194581 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123285 (or (= lt!194581 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!194581 #b0000000000000000000000000000000000000000000000000000000000001000) lt!194581)))))

(assert (=> b!123285 (= lt!194581 ((_ sign_extend 32) (size!2459 (buf!2899 lt!193969))))))

(assert (= (and d!39808 res!102203) b!123284))

(assert (= (and b!123284 res!102202) b!123285))

(declare-fun m!187605 () Bool)

(assert (=> d!39808 m!187605))

(declare-fun m!187607 () Bool)

(assert (=> d!39808 m!187607))

(assert (=> d!39620 d!39808))

(declare-fun d!39810 () Bool)

(declare-fun e!80799 () Bool)

(assert (=> d!39810 e!80799))

(declare-fun res!102205 () Bool)

(assert (=> d!39810 (=> (not res!102205) (not e!80799))))

(declare-fun lt!194586 () (_ BitVec 64))

(declare-fun lt!194589 () (_ BitVec 64))

(declare-fun lt!194590 () (_ BitVec 64))

(assert (=> d!39810 (= res!102205 (= lt!194586 (bvsub lt!194590 lt!194589)))))

(assert (=> d!39810 (or (= (bvand lt!194590 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!194589 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!194590 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!194590 lt!194589) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39810 (= lt!194589 (remainingBits!0 ((_ sign_extend 32) (size!2459 (buf!2899 (_2!5463 lt!193304)))) ((_ sign_extend 32) (currentByte!5596 (_2!5463 lt!193304))) ((_ sign_extend 32) (currentBit!5591 (_2!5463 lt!193304)))))))

(declare-fun lt!194591 () (_ BitVec 64))

(declare-fun lt!194588 () (_ BitVec 64))

(assert (=> d!39810 (= lt!194590 (bvmul lt!194591 lt!194588))))

(assert (=> d!39810 (or (= lt!194591 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!194588 (bvsdiv (bvmul lt!194591 lt!194588) lt!194591)))))

(assert (=> d!39810 (= lt!194588 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!39810 (= lt!194591 ((_ sign_extend 32) (size!2459 (buf!2899 (_2!5463 lt!193304)))))))

(assert (=> d!39810 (= lt!194586 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5596 (_2!5463 lt!193304))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5591 (_2!5463 lt!193304)))))))

(assert (=> d!39810 (invariant!0 (currentBit!5591 (_2!5463 lt!193304)) (currentByte!5596 (_2!5463 lt!193304)) (size!2459 (buf!2899 (_2!5463 lt!193304))))))

(assert (=> d!39810 (= (bitIndex!0 (size!2459 (buf!2899 (_2!5463 lt!193304))) (currentByte!5596 (_2!5463 lt!193304)) (currentBit!5591 (_2!5463 lt!193304))) lt!194586)))

(declare-fun b!123286 () Bool)

(declare-fun res!102204 () Bool)

(assert (=> b!123286 (=> (not res!102204) (not e!80799))))

(assert (=> b!123286 (= res!102204 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!194586))))

(declare-fun b!123287 () Bool)

(declare-fun lt!194587 () (_ BitVec 64))

(assert (=> b!123287 (= e!80799 (bvsle lt!194586 (bvmul lt!194587 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123287 (or (= lt!194587 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!194587 #b0000000000000000000000000000000000000000000000000000000000001000) lt!194587)))))

(assert (=> b!123287 (= lt!194587 ((_ sign_extend 32) (size!2459 (buf!2899 (_2!5463 lt!193304)))))))

(assert (= (and d!39810 res!102205) b!123286))

(assert (= (and b!123286 res!102204) b!123287))

(declare-fun m!187609 () Bool)

(assert (=> d!39810 m!187609))

(declare-fun m!187611 () Bool)

(assert (=> d!39810 m!187611))

(assert (=> d!39620 d!39810))

(declare-fun d!39812 () Bool)

(declare-fun lt!194597 () (_ BitVec 32))

(assert (=> d!39812 (= lt!194597 ((_ extract 31 0) (bvsrem (bvsub lt!193312 lt!193316) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!194595 () (_ BitVec 32))

(assert (=> d!39812 (= lt!194595 ((_ extract 31 0) (bvsdiv (bvsub lt!193312 lt!193316) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!80801 () Bool)

(assert (=> d!39812 e!80801))

(declare-fun res!102206 () Bool)

(assert (=> d!39812 (=> (not res!102206) (not e!80801))))

(assert (=> d!39812 (= res!102206 (moveBitIndexPrecond!0 (_2!5463 lt!193304) (bvsub lt!193312 lt!193316)))))

(declare-fun Unit!7597 () Unit!7557)

(declare-fun Unit!7598 () Unit!7557)

(declare-fun Unit!7599 () Unit!7557)

(assert (=> d!39812 (= (moveBitIndex!0 (_2!5463 lt!193304) (bvsub lt!193312 lt!193316)) (ite (bvslt (bvadd (currentBit!5591 (_2!5463 lt!193304)) lt!194597) #b00000000000000000000000000000000) (tuple2!10393 Unit!7597 (BitStream!4393 (buf!2899 (_2!5463 lt!193304)) (bvsub (bvadd (currentByte!5596 (_2!5463 lt!193304)) lt!194595) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!194597 (currentBit!5591 (_2!5463 lt!193304))))) (ite (bvsge (bvadd (currentBit!5591 (_2!5463 lt!193304)) lt!194597) #b00000000000000000000000000001000) (tuple2!10393 Unit!7598 (BitStream!4393 (buf!2899 (_2!5463 lt!193304)) (bvadd (currentByte!5596 (_2!5463 lt!193304)) lt!194595 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!5591 (_2!5463 lt!193304)) lt!194597) #b00000000000000000000000000001000))) (tuple2!10393 Unit!7599 (BitStream!4393 (buf!2899 (_2!5463 lt!193304)) (bvadd (currentByte!5596 (_2!5463 lt!193304)) lt!194595) (bvadd (currentBit!5591 (_2!5463 lt!193304)) lt!194597))))))))

(declare-fun b!123288 () Bool)

(declare-fun e!80800 () Bool)

(assert (=> b!123288 (= e!80801 e!80800)))

(declare-fun res!102207 () Bool)

(assert (=> b!123288 (=> (not res!102207) (not e!80800))))

(declare-fun lt!194594 () tuple2!10392)

(declare-fun lt!194596 () (_ BitVec 64))

(assert (=> b!123288 (= res!102207 (= (bvadd lt!194596 (bvsub lt!193312 lt!193316)) (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!194594))) (currentByte!5596 (_2!5461 lt!194594)) (currentBit!5591 (_2!5461 lt!194594)))))))

(assert (=> b!123288 (or (not (= (bvand lt!194596 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!193312 lt!193316) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!194596 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!194596 (bvsub lt!193312 lt!193316)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!123288 (= lt!194596 (bitIndex!0 (size!2459 (buf!2899 (_2!5463 lt!193304))) (currentByte!5596 (_2!5463 lt!193304)) (currentBit!5591 (_2!5463 lt!193304))))))

(declare-fun lt!194592 () (_ BitVec 32))

(declare-fun lt!194593 () (_ BitVec 32))

(declare-fun Unit!7600 () Unit!7557)

(declare-fun Unit!7601 () Unit!7557)

(declare-fun Unit!7602 () Unit!7557)

(assert (=> b!123288 (= lt!194594 (ite (bvslt (bvadd (currentBit!5591 (_2!5463 lt!193304)) lt!194592) #b00000000000000000000000000000000) (tuple2!10393 Unit!7600 (BitStream!4393 (buf!2899 (_2!5463 lt!193304)) (bvsub (bvadd (currentByte!5596 (_2!5463 lt!193304)) lt!194593) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!194592 (currentBit!5591 (_2!5463 lt!193304))))) (ite (bvsge (bvadd (currentBit!5591 (_2!5463 lt!193304)) lt!194592) #b00000000000000000000000000001000) (tuple2!10393 Unit!7601 (BitStream!4393 (buf!2899 (_2!5463 lt!193304)) (bvadd (currentByte!5596 (_2!5463 lt!193304)) lt!194593 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!5591 (_2!5463 lt!193304)) lt!194592) #b00000000000000000000000000001000))) (tuple2!10393 Unit!7602 (BitStream!4393 (buf!2899 (_2!5463 lt!193304)) (bvadd (currentByte!5596 (_2!5463 lt!193304)) lt!194593) (bvadd (currentBit!5591 (_2!5463 lt!193304)) lt!194592))))))))

(assert (=> b!123288 (= lt!194592 ((_ extract 31 0) (bvsrem (bvsub lt!193312 lt!193316) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123288 (= lt!194593 ((_ extract 31 0) (bvsdiv (bvsub lt!193312 lt!193316) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!123289 () Bool)

(assert (=> b!123289 (= e!80800 (and (= (size!2459 (buf!2899 (_2!5463 lt!193304))) (size!2459 (buf!2899 (_2!5461 lt!194594)))) (= (buf!2899 (_2!5463 lt!193304)) (buf!2899 (_2!5461 lt!194594)))))))

(assert (= (and d!39812 res!102206) b!123288))

(assert (= (and b!123288 res!102207) b!123289))

(assert (=> d!39812 m!187139))

(declare-fun m!187613 () Bool)

(assert (=> b!123288 m!187613))

(assert (=> b!123288 m!187135))

(assert (=> d!39620 d!39812))

(declare-fun d!39814 () Bool)

(declare-fun res!102208 () Bool)

(declare-fun e!80802 () Bool)

(assert (=> d!39814 (=> (not res!102208) (not e!80802))))

(assert (=> d!39814 (= res!102208 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!2459 (buf!2899 (_2!5463 lt!193304))))) (bvsub lt!193312 lt!193316)) (bvsle (bvsub lt!193312 lt!193316) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2459 (buf!2899 (_2!5463 lt!193304))))))))))

(assert (=> d!39814 (= (moveBitIndexPrecond!0 (_2!5463 lt!193304) (bvsub lt!193312 lt!193316)) e!80802)))

(declare-fun b!123290 () Bool)

(declare-fun lt!194598 () (_ BitVec 64))

(assert (=> b!123290 (= e!80802 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!194598) (bvsle lt!194598 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2459 (buf!2899 (_2!5463 lt!193304))))))))))

(assert (=> b!123290 (= lt!194598 (bvadd (bitIndex!0 (size!2459 (buf!2899 (_2!5463 lt!193304))) (currentByte!5596 (_2!5463 lt!193304)) (currentBit!5591 (_2!5463 lt!193304))) (bvsub lt!193312 lt!193316)))))

(assert (= (and d!39814 res!102208) b!123290))

(assert (=> b!123290 m!187135))

(assert (=> d!39620 d!39814))

(declare-fun d!39816 () Bool)

(declare-fun lt!194599 () tuple2!10408)

(assert (=> d!39816 (= lt!194599 (readBit!0 (readerFrom!0 (_2!5461 lt!193867) (currentBit!5591 thiss!1305) (currentByte!5596 thiss!1305))))))

(assert (=> d!39816 (= (readBitPure!0 (readerFrom!0 (_2!5461 lt!193867) (currentBit!5591 thiss!1305) (currentByte!5596 thiss!1305))) (tuple2!10399 (_2!5469 lt!194599) (_1!5469 lt!194599)))))

(declare-fun bs!9623 () Bool)

(assert (= bs!9623 d!39816))

(assert (=> bs!9623 m!187043))

(declare-fun m!187615 () Bool)

(assert (=> bs!9623 m!187615))

(assert (=> b!123003 d!39816))

(declare-fun d!39818 () Bool)

(declare-fun e!80803 () Bool)

(assert (=> d!39818 e!80803))

(declare-fun res!102209 () Bool)

(assert (=> d!39818 (=> (not res!102209) (not e!80803))))

(assert (=> d!39818 (= res!102209 (invariant!0 (currentBit!5591 (_2!5461 lt!193867)) (currentByte!5596 (_2!5461 lt!193867)) (size!2459 (buf!2899 (_2!5461 lt!193867)))))))

(assert (=> d!39818 (= (readerFrom!0 (_2!5461 lt!193867) (currentBit!5591 thiss!1305) (currentByte!5596 thiss!1305)) (BitStream!4393 (buf!2899 (_2!5461 lt!193867)) (currentByte!5596 thiss!1305) (currentBit!5591 thiss!1305)))))

(declare-fun b!123291 () Bool)

(assert (=> b!123291 (= e!80803 (invariant!0 (currentBit!5591 thiss!1305) (currentByte!5596 thiss!1305) (size!2459 (buf!2899 (_2!5461 lt!193867)))))))

(assert (= (and d!39818 res!102209) b!123291))

(assert (=> d!39818 m!187495))

(declare-fun m!187617 () Bool)

(assert (=> b!123291 m!187617))

(assert (=> b!123003 d!39818))

(declare-fun d!39820 () Bool)

(declare-fun e!80804 () Bool)

(assert (=> d!39820 e!80804))

(declare-fun res!102211 () Bool)

(assert (=> d!39820 (=> (not res!102211) (not e!80804))))

(declare-fun lt!194603 () (_ BitVec 64))

(declare-fun lt!194600 () (_ BitVec 64))

(declare-fun lt!194604 () (_ BitVec 64))

(assert (=> d!39820 (= res!102211 (= lt!194600 (bvsub lt!194604 lt!194603)))))

(assert (=> d!39820 (or (= (bvand lt!194604 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!194603 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!194604 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!194604 lt!194603) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39820 (= lt!194603 (remainingBits!0 ((_ sign_extend 32) (size!2459 (buf!2899 (_1!5464 lt!193831)))) ((_ sign_extend 32) (currentByte!5596 (_1!5464 lt!193831))) ((_ sign_extend 32) (currentBit!5591 (_1!5464 lt!193831)))))))

(declare-fun lt!194605 () (_ BitVec 64))

(declare-fun lt!194602 () (_ BitVec 64))

(assert (=> d!39820 (= lt!194604 (bvmul lt!194605 lt!194602))))

(assert (=> d!39820 (or (= lt!194605 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!194602 (bvsdiv (bvmul lt!194605 lt!194602) lt!194605)))))

(assert (=> d!39820 (= lt!194602 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!39820 (= lt!194605 ((_ sign_extend 32) (size!2459 (buf!2899 (_1!5464 lt!193831)))))))

(assert (=> d!39820 (= lt!194600 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5596 (_1!5464 lt!193831))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5591 (_1!5464 lt!193831)))))))

(assert (=> d!39820 (invariant!0 (currentBit!5591 (_1!5464 lt!193831)) (currentByte!5596 (_1!5464 lt!193831)) (size!2459 (buf!2899 (_1!5464 lt!193831))))))

(assert (=> d!39820 (= (bitIndex!0 (size!2459 (buf!2899 (_1!5464 lt!193831))) (currentByte!5596 (_1!5464 lt!193831)) (currentBit!5591 (_1!5464 lt!193831))) lt!194600)))

(declare-fun b!123292 () Bool)

(declare-fun res!102210 () Bool)

(assert (=> b!123292 (=> (not res!102210) (not e!80804))))

(assert (=> b!123292 (= res!102210 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!194600))))

(declare-fun b!123293 () Bool)

(declare-fun lt!194601 () (_ BitVec 64))

(assert (=> b!123293 (= e!80804 (bvsle lt!194600 (bvmul lt!194601 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123293 (or (= lt!194601 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!194601 #b0000000000000000000000000000000000000000000000000000000000001000) lt!194601)))))

(assert (=> b!123293 (= lt!194601 ((_ sign_extend 32) (size!2459 (buf!2899 (_1!5464 lt!193831)))))))

(assert (= (and d!39820 res!102211) b!123292))

(assert (= (and b!123292 res!102210) b!123293))

(declare-fun m!187619 () Bool)

(assert (=> d!39820 m!187619))

(declare-fun m!187621 () Bool)

(assert (=> d!39820 m!187621))

(assert (=> b!122983 d!39820))

(declare-fun d!39822 () Bool)

(declare-fun lt!194606 () tuple2!10410)

(assert (=> d!39822 (= lt!194606 (readNLeastSignificantBitsLoop!0 (_1!5463 lt!193822) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!193816 (ite (_2!5464 lt!193833) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!39822 (= (readNLeastSignificantBitsLoopPure!0 (_1!5463 lt!193822) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!193816 (ite (_2!5464 lt!193833) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!10395 (_2!5470 lt!194606) (_1!5470 lt!194606)))))

(declare-fun bs!9624 () Bool)

(assert (= bs!9624 d!39822))

(declare-fun m!187623 () Bool)

(assert (=> bs!9624 m!187623))

(assert (=> b!122983 d!39822))

(declare-fun d!39824 () Bool)

(assert (=> d!39824 (= (invariant!0 (currentBit!5591 (_2!5461 lt!193323)) (currentByte!5596 (_2!5461 lt!193323)) (size!2459 (buf!2899 (_2!5461 lt!193800)))) (and (bvsge (currentBit!5591 (_2!5461 lt!193323)) #b00000000000000000000000000000000) (bvslt (currentBit!5591 (_2!5461 lt!193323)) #b00000000000000000000000000001000) (bvsge (currentByte!5596 (_2!5461 lt!193323)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5596 (_2!5461 lt!193323)) (size!2459 (buf!2899 (_2!5461 lt!193800)))) (and (= (currentBit!5591 (_2!5461 lt!193323)) #b00000000000000000000000000000000) (= (currentByte!5596 (_2!5461 lt!193323)) (size!2459 (buf!2899 (_2!5461 lt!193800))))))))))

(assert (=> b!122983 d!39824))

(declare-fun d!39826 () Bool)

(declare-fun e!80805 () Bool)

(assert (=> d!39826 e!80805))

(declare-fun res!102212 () Bool)

(assert (=> d!39826 (=> (not res!102212) (not e!80805))))

(declare-fun lt!194608 () (_ BitVec 64))

(declare-fun lt!194607 () BitStream!4392)

(assert (=> d!39826 (= res!102212 (= (bvadd lt!194608 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!2459 (buf!2899 lt!194607)) (currentByte!5596 lt!194607) (currentBit!5591 lt!194607))))))

(assert (=> d!39826 (or (not (= (bvand lt!194608 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!194608 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!194608 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39826 (= lt!194608 (bitIndex!0 (size!2459 (buf!2899 (_1!5463 lt!193824))) (currentByte!5596 (_1!5463 lt!193824)) (currentBit!5591 (_1!5463 lt!193824))))))

(assert (=> d!39826 (= lt!194607 (_2!5461 (moveBitIndex!0 (_1!5463 lt!193824) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!39826 (moveBitIndexPrecond!0 (_1!5463 lt!193824) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!39826 (= (withMovedBitIndex!0 (_1!5463 lt!193824) #b0000000000000000000000000000000000000000000000000000000000000001) lt!194607)))

(declare-fun b!123294 () Bool)

(assert (=> b!123294 (= e!80805 (= (size!2459 (buf!2899 (_1!5463 lt!193824))) (size!2459 (buf!2899 lt!194607))))))

(assert (= (and d!39826 res!102212) b!123294))

(declare-fun m!187625 () Bool)

(assert (=> d!39826 m!187625))

(declare-fun m!187627 () Bool)

(assert (=> d!39826 m!187627))

(declare-fun m!187629 () Bool)

(assert (=> d!39826 m!187629))

(declare-fun m!187631 () Bool)

(assert (=> d!39826 m!187631))

(assert (=> b!122983 d!39826))

(declare-fun d!39828 () Bool)

(declare-fun lt!194609 () tuple2!10408)

(assert (=> d!39828 (= lt!194609 (readBit!0 (_1!5463 lt!193824)))))

(assert (=> d!39828 (= (readBitPure!0 (_1!5463 lt!193824)) (tuple2!10399 (_2!5469 lt!194609) (_1!5469 lt!194609)))))

(declare-fun bs!9625 () Bool)

(assert (= bs!9625 d!39828))

(declare-fun m!187633 () Bool)

(assert (=> bs!9625 m!187633))

(assert (=> b!122983 d!39828))

(declare-fun lt!194610 () tuple2!10410)

(declare-fun d!39830 () Bool)

(assert (=> d!39830 (= lt!194610 (readNLeastSignificantBitsLoop!0 (withMovedBitIndex!0 (_1!5463 lt!193824) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!193816 e!80618)))))

(assert (=> d!39830 (= (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!5463 lt!193824) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!193816 e!80618)) (tuple2!10395 (_2!5470 lt!194610) (_1!5470 lt!194610)))))

(declare-fun bs!9626 () Bool)

(assert (= bs!9626 d!39830))

(assert (=> bs!9626 m!186985))

(declare-fun m!187635 () Bool)

(assert (=> bs!9626 m!187635))

(assert (=> b!122983 d!39830))

(declare-fun d!39832 () Bool)

(declare-fun e!80806 () Bool)

(assert (=> d!39832 e!80806))

(declare-fun res!102213 () Bool)

(assert (=> d!39832 (=> (not res!102213) (not e!80806))))

(declare-fun lt!194614 () tuple2!10398)

(declare-fun lt!194612 () tuple2!10398)

(assert (=> d!39832 (= res!102213 (= (bitIndex!0 (size!2459 (buf!2899 (_1!5464 lt!194614))) (currentByte!5596 (_1!5464 lt!194614)) (currentBit!5591 (_1!5464 lt!194614))) (bitIndex!0 (size!2459 (buf!2899 (_1!5464 lt!194612))) (currentByte!5596 (_1!5464 lt!194612)) (currentBit!5591 (_1!5464 lt!194612)))))))

(declare-fun lt!194613 () BitStream!4392)

(declare-fun lt!194611 () Unit!7557)

(assert (=> d!39832 (= lt!194611 (choose!50 lt!193828 (_2!5461 lt!193817) lt!194613 lt!194614 (tuple2!10399 (_1!5464 lt!194614) (_2!5464 lt!194614)) (_1!5464 lt!194614) (_2!5464 lt!194614) lt!194612 (tuple2!10399 (_1!5464 lt!194612) (_2!5464 lt!194612)) (_1!5464 lt!194612) (_2!5464 lt!194612)))))

(assert (=> d!39832 (= lt!194612 (readBitPure!0 lt!194613))))

(assert (=> d!39832 (= lt!194614 (readBitPure!0 lt!193828))))

(assert (=> d!39832 (= lt!194613 (BitStream!4393 (buf!2899 (_2!5461 lt!193817)) (currentByte!5596 lt!193828) (currentBit!5591 lt!193828)))))

(assert (=> d!39832 (invariant!0 (currentBit!5591 lt!193828) (currentByte!5596 lt!193828) (size!2459 (buf!2899 (_2!5461 lt!193817))))))

(assert (=> d!39832 (= (readBitPrefixLemma!0 lt!193828 (_2!5461 lt!193817)) lt!194611)))

(declare-fun b!123295 () Bool)

(assert (=> b!123295 (= e!80806 (= (_2!5464 lt!194614) (_2!5464 lt!194612)))))

(assert (= (and d!39832 res!102213) b!123295))

(declare-fun m!187637 () Bool)

(assert (=> d!39832 m!187637))

(declare-fun m!187639 () Bool)

(assert (=> d!39832 m!187639))

(declare-fun m!187641 () Bool)

(assert (=> d!39832 m!187641))

(assert (=> d!39832 m!186973))

(assert (=> d!39832 m!187007))

(declare-fun m!187643 () Bool)

(assert (=> d!39832 m!187643))

(assert (=> b!122983 d!39832))

(declare-fun d!39834 () Bool)

(declare-fun e!80807 () Bool)

(assert (=> d!39834 e!80807))

(declare-fun res!102215 () Bool)

(assert (=> d!39834 (=> (not res!102215) (not e!80807))))

(declare-fun lt!194619 () (_ BitVec 64))

(declare-fun lt!194615 () (_ BitVec 64))

(declare-fun lt!194618 () (_ BitVec 64))

(assert (=> d!39834 (= res!102215 (= lt!194615 (bvsub lt!194619 lt!194618)))))

(assert (=> d!39834 (or (= (bvand lt!194619 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!194618 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!194619 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!194619 lt!194618) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39834 (= lt!194618 (remainingBits!0 ((_ sign_extend 32) (size!2459 (buf!2899 (_2!5461 lt!193800)))) ((_ sign_extend 32) (currentByte!5596 (_2!5461 lt!193800))) ((_ sign_extend 32) (currentBit!5591 (_2!5461 lt!193800)))))))

(declare-fun lt!194620 () (_ BitVec 64))

(declare-fun lt!194617 () (_ BitVec 64))

(assert (=> d!39834 (= lt!194619 (bvmul lt!194620 lt!194617))))

(assert (=> d!39834 (or (= lt!194620 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!194617 (bvsdiv (bvmul lt!194620 lt!194617) lt!194620)))))

(assert (=> d!39834 (= lt!194617 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!39834 (= lt!194620 ((_ sign_extend 32) (size!2459 (buf!2899 (_2!5461 lt!193800)))))))

(assert (=> d!39834 (= lt!194615 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5596 (_2!5461 lt!193800))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5591 (_2!5461 lt!193800)))))))

(assert (=> d!39834 (invariant!0 (currentBit!5591 (_2!5461 lt!193800)) (currentByte!5596 (_2!5461 lt!193800)) (size!2459 (buf!2899 (_2!5461 lt!193800))))))

(assert (=> d!39834 (= (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193800))) (currentByte!5596 (_2!5461 lt!193800)) (currentBit!5591 (_2!5461 lt!193800))) lt!194615)))

(declare-fun b!123296 () Bool)

(declare-fun res!102214 () Bool)

(assert (=> b!123296 (=> (not res!102214) (not e!80807))))

(assert (=> b!123296 (= res!102214 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!194615))))

(declare-fun b!123297 () Bool)

(declare-fun lt!194616 () (_ BitVec 64))

(assert (=> b!123297 (= e!80807 (bvsle lt!194615 (bvmul lt!194616 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123297 (or (= lt!194616 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!194616 #b0000000000000000000000000000000000000000000000000000000000001000) lt!194616)))))

(assert (=> b!123297 (= lt!194616 ((_ sign_extend 32) (size!2459 (buf!2899 (_2!5461 lt!193800)))))))

(assert (= (and d!39834 res!102215) b!123296))

(assert (= (and b!123296 res!102214) b!123297))

(declare-fun m!187645 () Bool)

(assert (=> d!39834 m!187645))

(declare-fun m!187647 () Bool)

(assert (=> d!39834 m!187647))

(assert (=> b!122983 d!39834))

(declare-fun d!39836 () Bool)

(declare-fun lt!194626 () tuple2!10394)

(declare-fun lt!194625 () tuple2!10394)

(assert (=> d!39836 (and (= (_2!5462 lt!194626) (_2!5462 lt!194625)) (= (_1!5462 lt!194626) (_1!5462 lt!194625)))))

(declare-fun lt!194622 () Unit!7557)

(declare-fun lt!194621 () (_ BitVec 64))

(declare-fun lt!194624 () BitStream!4392)

(declare-fun lt!194623 () Bool)

(assert (=> d!39836 (= lt!194622 (choose!45 (_1!5463 lt!193824) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!193816 lt!194626 (tuple2!10395 (_1!5462 lt!194626) (_2!5462 lt!194626)) (_1!5462 lt!194626) (_2!5462 lt!194626) lt!194623 lt!194624 lt!194621 lt!194625 (tuple2!10395 (_1!5462 lt!194625) (_2!5462 lt!194625)) (_1!5462 lt!194625) (_2!5462 lt!194625)))))

(assert (=> d!39836 (= lt!194625 (readNLeastSignificantBitsLoopPure!0 lt!194624 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) lt!194621))))

(assert (=> d!39836 (= lt!194621 (bvor lt!193816 (ite lt!194623 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39836 (= lt!194624 (withMovedBitIndex!0 (_1!5463 lt!193824) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!39836 (= lt!194623 (_2!5464 (readBitPure!0 (_1!5463 lt!193824))))))

(assert (=> d!39836 (= lt!194626 (readNLeastSignificantBitsLoopPure!0 (_1!5463 lt!193824) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!193816))))

(assert (=> d!39836 (= (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5463 lt!193824) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!193816) lt!194622)))

(declare-fun bs!9627 () Bool)

(assert (= bs!9627 d!39836))

(assert (=> bs!9627 m!186993))

(assert (=> bs!9627 m!187003))

(assert (=> bs!9627 m!186985))

(declare-fun m!187649 () Bool)

(assert (=> bs!9627 m!187649))

(declare-fun m!187651 () Bool)

(assert (=> bs!9627 m!187651))

(assert (=> b!122983 d!39836))

(declare-fun b!123298 () Bool)

(declare-fun e!80811 () Bool)

(declare-fun lt!194652 () tuple2!10398)

(declare-fun lt!194660 () tuple2!10398)

(assert (=> b!123298 (= e!80811 (= (_2!5464 lt!194652) (_2!5464 lt!194660)))))

(declare-fun b!123299 () Bool)

(declare-fun e!80812 () Bool)

(declare-fun lt!194655 () tuple2!10398)

(declare-fun lt!194661 () tuple2!10392)

(assert (=> b!123299 (= e!80812 (= (bitIndex!0 (size!2459 (buf!2899 (_1!5464 lt!194655))) (currentByte!5596 (_1!5464 lt!194655)) (currentBit!5591 (_1!5464 lt!194655))) (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!194661))) (currentByte!5596 (_2!5461 lt!194661)) (currentBit!5591 (_2!5461 lt!194661)))))))

(declare-fun b!123300 () Bool)

(declare-fun res!102221 () Bool)

(declare-fun e!80813 () Bool)

(assert (=> b!123300 (=> (not res!102221) (not e!80813))))

(declare-fun lt!194671 () tuple2!10392)

(assert (=> b!123300 (= res!102221 (isPrefixOf!0 (_2!5461 lt!193800) (_2!5461 lt!194671)))))

(declare-fun b!123301 () Bool)

(assert (=> b!123301 (= lt!194655 (readBitPure!0 (readerFrom!0 (_2!5461 lt!194661) (currentBit!5591 (_2!5461 lt!193800)) (currentByte!5596 (_2!5461 lt!193800)))))))

(declare-fun res!102220 () Bool)

(declare-fun lt!194627 () Bool)

(assert (=> b!123301 (= res!102220 (and (= (_2!5464 lt!194655) lt!194627) (= (_1!5464 lt!194655) (_2!5461 lt!194661))))))

(assert (=> b!123301 (=> (not res!102220) (not e!80812))))

(declare-fun e!80814 () Bool)

(assert (=> b!123301 (= e!80814 e!80812)))

(declare-fun lt!194646 () tuple2!10392)

(declare-fun call!1608 () Bool)

(declare-fun c!7369 () Bool)

(declare-fun lt!194639 () BitStream!4392)

(declare-fun bm!1605 () Bool)

(assert (=> bm!1605 (= call!1608 (isPrefixOf!0 (ite c!7369 (_2!5461 lt!193800) lt!194639) (ite c!7369 (_2!5461 lt!194646) lt!194639)))))

(declare-fun b!123302 () Bool)

(declare-fun res!102217 () Bool)

(assert (=> b!123302 (= res!102217 (isPrefixOf!0 (_2!5461 lt!193800) (_2!5461 lt!194661)))))

(assert (=> b!123302 (=> (not res!102217) (not e!80814))))

(declare-fun b!123303 () Bool)

(declare-fun e!80809 () (_ BitVec 64))

(assert (=> b!123303 (= e!80809 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))))

(declare-fun d!39838 () Bool)

(assert (=> d!39838 e!80813))

(declare-fun res!102224 () Bool)

(assert (=> d!39838 (=> (not res!102224) (not e!80813))))

(assert (=> d!39838 (= res!102224 (= (size!2459 (buf!2899 (_2!5461 lt!193800))) (size!2459 (buf!2899 (_2!5461 lt!194671)))))))

(declare-fun e!80808 () tuple2!10392)

(assert (=> d!39838 (= lt!194671 e!80808)))

(assert (=> d!39838 (= c!7369 (bvslt (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) nBits!396))))

(assert (=> d!39838 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)) (bvsle (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!39838 (= (appendNLeastSignificantBitsLoop!0 (_2!5461 lt!193800) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)) lt!194671)))

(declare-fun b!123304 () Bool)

(declare-fun lt!194649 () Unit!7557)

(assert (=> b!123304 (= e!80808 (tuple2!10393 lt!194649 (_2!5461 lt!193800)))))

(assert (=> b!123304 (= lt!194639 (_2!5461 lt!193800))))

(assert (=> b!123304 (= lt!194649 (lemmaIsPrefixRefl!0 lt!194639))))

(assert (=> b!123304 call!1608))

(declare-fun lt!194631 () tuple2!10394)

(declare-fun b!123305 () Bool)

(declare-fun lt!194670 () tuple2!10396)

(assert (=> b!123305 (= e!80813 (and (= (_2!5462 lt!194631) v!199) (= (_1!5462 lt!194631) (_2!5463 lt!194670))))))

(declare-fun lt!194644 () (_ BitVec 64))

(assert (=> b!123305 (= lt!194631 (readNLeastSignificantBitsLoopPure!0 (_1!5463 lt!194670) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) lt!194644))))

(declare-fun lt!194659 () Unit!7557)

(declare-fun lt!194632 () Unit!7557)

(assert (=> b!123305 (= lt!194659 lt!194632)))

(declare-fun lt!194628 () (_ BitVec 64))

(assert (=> b!123305 (validate_offset_bits!1 ((_ sign_extend 32) (size!2459 (buf!2899 (_2!5461 lt!194671)))) ((_ sign_extend 32) (currentByte!5596 (_2!5461 lt!193800))) ((_ sign_extend 32) (currentBit!5591 (_2!5461 lt!193800))) lt!194628)))

(assert (=> b!123305 (= lt!194632 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5461 lt!193800) (buf!2899 (_2!5461 lt!194671)) lt!194628))))

(declare-fun e!80810 () Bool)

(assert (=> b!123305 e!80810))

(declare-fun res!102222 () Bool)

(assert (=> b!123305 (=> (not res!102222) (not e!80810))))

(assert (=> b!123305 (= res!102222 (and (= (size!2459 (buf!2899 (_2!5461 lt!193800))) (size!2459 (buf!2899 (_2!5461 lt!194671)))) (bvsge lt!194628 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!123305 (= lt!194628 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001))))))

(assert (=> b!123305 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!123305 (= lt!194644 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001))))))))

(assert (=> b!123305 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!123305 (= lt!194670 (reader!0 (_2!5461 lt!193800) (_2!5461 lt!194671)))))

(declare-fun b!123306 () Bool)

(declare-fun res!102219 () Bool)

(assert (=> b!123306 (=> (not res!102219) (not e!80813))))

(declare-fun lt!194638 () (_ BitVec 64))

(declare-fun lt!194634 () (_ BitVec 64))

(assert (=> b!123306 (= res!102219 (= (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!194671))) (currentByte!5596 (_2!5461 lt!194671)) (currentBit!5591 (_2!5461 lt!194671))) (bvadd lt!194634 lt!194638)))))

(assert (=> b!123306 (or (not (= (bvand lt!194634 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!194638 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!194634 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!194634 lt!194638) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!123306 (= lt!194638 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001))))))

(assert (=> b!123306 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!123306 (= lt!194634 (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193800))) (currentByte!5596 (_2!5461 lt!193800)) (currentBit!5591 (_2!5461 lt!193800))))))

(declare-fun b!123307 () Bool)

(assert (=> b!123307 (= e!80810 (validate_offset_bits!1 ((_ sign_extend 32) (size!2459 (buf!2899 (_2!5461 lt!193800)))) ((_ sign_extend 32) (currentByte!5596 (_2!5461 lt!193800))) ((_ sign_extend 32) (currentBit!5591 (_2!5461 lt!193800))) lt!194628))))

(declare-fun b!123308 () Bool)

(declare-fun Unit!7603 () Unit!7557)

(assert (=> b!123308 (= e!80808 (tuple2!10393 Unit!7603 (_2!5461 lt!194646)))))

(assert (=> b!123308 (= lt!194627 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!123308 (= lt!194661 (appendBit!0 (_2!5461 lt!193800) lt!194627))))

(declare-fun res!102223 () Bool)

(assert (=> b!123308 (= res!102223 (= (size!2459 (buf!2899 (_2!5461 lt!193800))) (size!2459 (buf!2899 (_2!5461 lt!194661)))))))

(assert (=> b!123308 (=> (not res!102223) (not e!80814))))

(assert (=> b!123308 e!80814))

(declare-fun lt!194629 () tuple2!10392)

(assert (=> b!123308 (= lt!194629 lt!194661)))

(assert (=> b!123308 (= lt!194646 (appendNLeastSignificantBitsLoop!0 (_2!5461 lt!194629) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(declare-fun lt!194641 () Unit!7557)

(assert (=> b!123308 (= lt!194641 (lemmaIsPrefixTransitive!0 (_2!5461 lt!193800) (_2!5461 lt!194629) (_2!5461 lt!194646)))))

(assert (=> b!123308 call!1608))

(declare-fun lt!194647 () Unit!7557)

(assert (=> b!123308 (= lt!194647 lt!194641)))

(assert (=> b!123308 (invariant!0 (currentBit!5591 (_2!5461 lt!193800)) (currentByte!5596 (_2!5461 lt!193800)) (size!2459 (buf!2899 (_2!5461 lt!194629))))))

(declare-fun lt!194657 () BitStream!4392)

(assert (=> b!123308 (= lt!194657 (BitStream!4393 (buf!2899 (_2!5461 lt!194629)) (currentByte!5596 (_2!5461 lt!193800)) (currentBit!5591 (_2!5461 lt!193800))))))

(assert (=> b!123308 (invariant!0 (currentBit!5591 lt!194657) (currentByte!5596 lt!194657) (size!2459 (buf!2899 (_2!5461 lt!194646))))))

(declare-fun lt!194658 () BitStream!4392)

(assert (=> b!123308 (= lt!194658 (BitStream!4393 (buf!2899 (_2!5461 lt!194646)) (currentByte!5596 lt!194657) (currentBit!5591 lt!194657)))))

(assert (=> b!123308 (= lt!194652 (readBitPure!0 lt!194657))))

(assert (=> b!123308 (= lt!194660 (readBitPure!0 lt!194658))))

(declare-fun lt!194630 () Unit!7557)

(assert (=> b!123308 (= lt!194630 (readBitPrefixLemma!0 lt!194657 (_2!5461 lt!194646)))))

(declare-fun res!102216 () Bool)

(assert (=> b!123308 (= res!102216 (= (bitIndex!0 (size!2459 (buf!2899 (_1!5464 lt!194652))) (currentByte!5596 (_1!5464 lt!194652)) (currentBit!5591 (_1!5464 lt!194652))) (bitIndex!0 (size!2459 (buf!2899 (_1!5464 lt!194660))) (currentByte!5596 (_1!5464 lt!194660)) (currentBit!5591 (_1!5464 lt!194660)))))))

(assert (=> b!123308 (=> (not res!102216) (not e!80811))))

(assert (=> b!123308 e!80811))

(declare-fun lt!194668 () Unit!7557)

(assert (=> b!123308 (= lt!194668 lt!194630)))

(declare-fun lt!194653 () tuple2!10396)

(assert (=> b!123308 (= lt!194653 (reader!0 (_2!5461 lt!193800) (_2!5461 lt!194646)))))

(declare-fun lt!194651 () tuple2!10396)

(assert (=> b!123308 (= lt!194651 (reader!0 (_2!5461 lt!194629) (_2!5461 lt!194646)))))

(declare-fun lt!194662 () tuple2!10398)

(assert (=> b!123308 (= lt!194662 (readBitPure!0 (_1!5463 lt!194653)))))

(assert (=> b!123308 (= (_2!5464 lt!194662) lt!194627)))

(declare-fun lt!194642 () Unit!7557)

(declare-fun Unit!7604 () Unit!7557)

(assert (=> b!123308 (= lt!194642 Unit!7604)))

(declare-fun lt!194645 () (_ BitVec 64))

(assert (=> b!123308 (= lt!194645 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001))))))))

(declare-fun lt!194648 () (_ BitVec 64))

(assert (=> b!123308 (= lt!194648 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001))))))

(declare-fun lt!194669 () Unit!7557)

(assert (=> b!123308 (= lt!194669 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5461 lt!193800) (buf!2899 (_2!5461 lt!194646)) lt!194648))))

(assert (=> b!123308 (validate_offset_bits!1 ((_ sign_extend 32) (size!2459 (buf!2899 (_2!5461 lt!194646)))) ((_ sign_extend 32) (currentByte!5596 (_2!5461 lt!193800))) ((_ sign_extend 32) (currentBit!5591 (_2!5461 lt!193800))) lt!194648)))

(declare-fun lt!194666 () Unit!7557)

(assert (=> b!123308 (= lt!194666 lt!194669)))

(declare-fun lt!194656 () tuple2!10394)

(assert (=> b!123308 (= lt!194656 (readNLeastSignificantBitsLoopPure!0 (_1!5463 lt!194653) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) lt!194645))))

(declare-fun lt!194636 () (_ BitVec 64))

(assert (=> b!123308 (= lt!194636 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))))

(declare-fun lt!194633 () Unit!7557)

(assert (=> b!123308 (= lt!194633 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5461 lt!194629) (buf!2899 (_2!5461 lt!194646)) lt!194636))))

(assert (=> b!123308 (validate_offset_bits!1 ((_ sign_extend 32) (size!2459 (buf!2899 (_2!5461 lt!194646)))) ((_ sign_extend 32) (currentByte!5596 (_2!5461 lt!194629))) ((_ sign_extend 32) (currentBit!5591 (_2!5461 lt!194629))) lt!194636)))

(declare-fun lt!194640 () Unit!7557)

(assert (=> b!123308 (= lt!194640 lt!194633)))

(declare-fun lt!194663 () tuple2!10394)

(assert (=> b!123308 (= lt!194663 (readNLeastSignificantBitsLoopPure!0 (_1!5463 lt!194651) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvor lt!194645 (ite (_2!5464 lt!194662) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!194635 () tuple2!10394)

(assert (=> b!123308 (= lt!194635 (readNLeastSignificantBitsLoopPure!0 (_1!5463 lt!194653) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) lt!194645))))

(declare-fun c!7368 () Bool)

(assert (=> b!123308 (= c!7368 (_2!5464 (readBitPure!0 (_1!5463 lt!194653))))))

(declare-fun lt!194665 () tuple2!10394)

(assert (=> b!123308 (= lt!194665 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!5463 lt!194653) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvor lt!194645 e!80809)))))

(declare-fun lt!194643 () Unit!7557)

(assert (=> b!123308 (= lt!194643 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5463 lt!194653) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) lt!194645))))

(assert (=> b!123308 (and (= (_2!5462 lt!194635) (_2!5462 lt!194665)) (= (_1!5462 lt!194635) (_1!5462 lt!194665)))))

(declare-fun lt!194650 () Unit!7557)

(assert (=> b!123308 (= lt!194650 lt!194643)))

(assert (=> b!123308 (= (_1!5463 lt!194653) (withMovedBitIndex!0 (_2!5463 lt!194653) (bvsub (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193800))) (currentByte!5596 (_2!5461 lt!193800)) (currentBit!5591 (_2!5461 lt!193800))) (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!194646))) (currentByte!5596 (_2!5461 lt!194646)) (currentBit!5591 (_2!5461 lt!194646))))))))

(declare-fun lt!194664 () Unit!7557)

(declare-fun Unit!7605 () Unit!7557)

(assert (=> b!123308 (= lt!194664 Unit!7605)))

(assert (=> b!123308 (= (_1!5463 lt!194651) (withMovedBitIndex!0 (_2!5463 lt!194651) (bvsub (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!194629))) (currentByte!5596 (_2!5461 lt!194629)) (currentBit!5591 (_2!5461 lt!194629))) (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!194646))) (currentByte!5596 (_2!5461 lt!194646)) (currentBit!5591 (_2!5461 lt!194646))))))))

(declare-fun lt!194637 () Unit!7557)

(declare-fun Unit!7606 () Unit!7557)

(assert (=> b!123308 (= lt!194637 Unit!7606)))

(assert (=> b!123308 (= (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193800))) (currentByte!5596 (_2!5461 lt!193800)) (currentBit!5591 (_2!5461 lt!193800))) (bvsub (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!194629))) (currentByte!5596 (_2!5461 lt!194629)) (currentBit!5591 (_2!5461 lt!194629))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!194667 () Unit!7557)

(declare-fun Unit!7607 () Unit!7557)

(assert (=> b!123308 (= lt!194667 Unit!7607)))

(assert (=> b!123308 (= (_2!5462 lt!194656) (_2!5462 lt!194663))))

(declare-fun lt!194654 () Unit!7557)

(declare-fun Unit!7608 () Unit!7557)

(assert (=> b!123308 (= lt!194654 Unit!7608)))

(assert (=> b!123308 (= (_1!5462 lt!194656) (_2!5463 lt!194653))))

(declare-fun b!123309 () Bool)

(declare-fun res!102218 () Bool)

(assert (=> b!123309 (= res!102218 (= (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!194661))) (currentByte!5596 (_2!5461 lt!194661)) (currentBit!5591 (_2!5461 lt!194661))) (bvadd (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193800))) (currentByte!5596 (_2!5461 lt!193800)) (currentBit!5591 (_2!5461 lt!193800))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!123309 (=> (not res!102218) (not e!80814))))

(declare-fun b!123310 () Bool)

(assert (=> b!123310 (= e!80809 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (= (and d!39838 c!7369) b!123308))

(assert (= (and d!39838 (not c!7369)) b!123304))

(assert (= (and b!123308 res!102223) b!123309))

(assert (= (and b!123309 res!102218) b!123302))

(assert (= (and b!123302 res!102217) b!123301))

(assert (= (and b!123301 res!102220) b!123299))

(assert (= (and b!123308 res!102216) b!123298))

(assert (= (and b!123308 c!7368) b!123303))

(assert (= (and b!123308 (not c!7368)) b!123310))

(assert (= (or b!123308 b!123304) bm!1605))

(assert (= (and d!39838 res!102224) b!123306))

(assert (= (and b!123306 res!102219) b!123300))

(assert (= (and b!123300 res!102221) b!123305))

(assert (= (and b!123305 res!102222) b!123307))

(declare-fun m!187653 () Bool)

(assert (=> b!123306 m!187653))

(assert (=> b!123306 m!187001))

(declare-fun m!187655 () Bool)

(assert (=> b!123309 m!187655))

(assert (=> b!123309 m!187001))

(declare-fun m!187657 () Bool)

(assert (=> b!123299 m!187657))

(assert (=> b!123299 m!187655))

(declare-fun m!187659 () Bool)

(assert (=> bm!1605 m!187659))

(declare-fun m!187661 () Bool)

(assert (=> b!123304 m!187661))

(declare-fun m!187663 () Bool)

(assert (=> b!123301 m!187663))

(assert (=> b!123301 m!187663))

(declare-fun m!187665 () Bool)

(assert (=> b!123301 m!187665))

(declare-fun m!187667 () Bool)

(assert (=> b!123300 m!187667))

(declare-fun m!187669 () Bool)

(assert (=> b!123307 m!187669))

(declare-fun m!187671 () Bool)

(assert (=> b!123308 m!187671))

(declare-fun m!187673 () Bool)

(assert (=> b!123308 m!187673))

(declare-fun m!187675 () Bool)

(assert (=> b!123308 m!187675))

(declare-fun m!187677 () Bool)

(assert (=> b!123308 m!187677))

(declare-fun m!187679 () Bool)

(assert (=> b!123308 m!187679))

(declare-fun m!187681 () Bool)

(assert (=> b!123308 m!187681))

(declare-fun m!187683 () Bool)

(assert (=> b!123308 m!187683))

(declare-fun m!187685 () Bool)

(assert (=> b!123308 m!187685))

(declare-fun m!187687 () Bool)

(assert (=> b!123308 m!187687))

(declare-fun m!187689 () Bool)

(assert (=> b!123308 m!187689))

(declare-fun m!187691 () Bool)

(assert (=> b!123308 m!187691))

(declare-fun m!187693 () Bool)

(assert (=> b!123308 m!187693))

(declare-fun m!187695 () Bool)

(assert (=> b!123308 m!187695))

(declare-fun m!187697 () Bool)

(assert (=> b!123308 m!187697))

(declare-fun m!187699 () Bool)

(assert (=> b!123308 m!187699))

(assert (=> b!123308 m!187001))

(assert (=> b!123308 m!187695))

(declare-fun m!187701 () Bool)

(assert (=> b!123308 m!187701))

(declare-fun m!187703 () Bool)

(assert (=> b!123308 m!187703))

(declare-fun m!187705 () Bool)

(assert (=> b!123308 m!187705))

(declare-fun m!187707 () Bool)

(assert (=> b!123308 m!187707))

(declare-fun m!187709 () Bool)

(assert (=> b!123308 m!187709))

(declare-fun m!187711 () Bool)

(assert (=> b!123308 m!187711))

(declare-fun m!187713 () Bool)

(assert (=> b!123308 m!187713))

(declare-fun m!187715 () Bool)

(assert (=> b!123308 m!187715))

(declare-fun m!187717 () Bool)

(assert (=> b!123308 m!187717))

(declare-fun m!187719 () Bool)

(assert (=> b!123308 m!187719))

(declare-fun m!187721 () Bool)

(assert (=> b!123308 m!187721))

(declare-fun m!187723 () Bool)

(assert (=> b!123308 m!187723))

(assert (=> b!123305 m!187673))

(declare-fun m!187725 () Bool)

(assert (=> b!123305 m!187725))

(declare-fun m!187727 () Bool)

(assert (=> b!123305 m!187727))

(declare-fun m!187729 () Bool)

(assert (=> b!123305 m!187729))

(declare-fun m!187731 () Bool)

(assert (=> b!123305 m!187731))

(declare-fun m!187733 () Bool)

(assert (=> b!123302 m!187733))

(assert (=> b!122983 d!39838))

(declare-fun b!123314 () Bool)

(declare-fun e!80815 () Bool)

(declare-fun lt!194673 () tuple2!10398)

(declare-fun lt!194675 () tuple2!10392)

(assert (=> b!123314 (= e!80815 (= (bitIndex!0 (size!2459 (buf!2899 (_1!5464 lt!194673))) (currentByte!5596 (_1!5464 lt!194673)) (currentBit!5591 (_1!5464 lt!194673))) (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!194675))) (currentByte!5596 (_2!5461 lt!194675)) (currentBit!5591 (_2!5461 lt!194675)))))))

(declare-fun b!123311 () Bool)

(declare-fun res!102225 () Bool)

(declare-fun e!80816 () Bool)

(assert (=> b!123311 (=> (not res!102225) (not e!80816))))

(declare-fun lt!194674 () (_ BitVec 64))

(declare-fun lt!194672 () (_ BitVec 64))

(assert (=> b!123311 (= res!102225 (= (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!194675))) (currentByte!5596 (_2!5461 lt!194675)) (currentBit!5591 (_2!5461 lt!194675))) (bvadd lt!194672 lt!194674)))))

(assert (=> b!123311 (or (not (= (bvand lt!194672 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!194674 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!194672 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!194672 lt!194674) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!123311 (= lt!194674 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!123311 (= lt!194672 (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193323))) (currentByte!5596 (_2!5461 lt!193323)) (currentBit!5591 (_2!5461 lt!193323))))))

(declare-fun d!39840 () Bool)

(assert (=> d!39840 e!80816))

(declare-fun res!102227 () Bool)

(assert (=> d!39840 (=> (not res!102227) (not e!80816))))

(assert (=> d!39840 (= res!102227 (= (size!2459 (buf!2899 (_2!5461 lt!193323))) (size!2459 (buf!2899 (_2!5461 lt!194675)))))))

(assert (=> d!39840 (= lt!194675 (choose!16 (_2!5461 lt!193323) lt!193798))))

(assert (=> d!39840 (validate_offset_bit!0 ((_ sign_extend 32) (size!2459 (buf!2899 (_2!5461 lt!193323)))) ((_ sign_extend 32) (currentByte!5596 (_2!5461 lt!193323))) ((_ sign_extend 32) (currentBit!5591 (_2!5461 lt!193323))))))

(assert (=> d!39840 (= (appendBit!0 (_2!5461 lt!193323) lt!193798) lt!194675)))

(declare-fun b!123312 () Bool)

(declare-fun res!102226 () Bool)

(assert (=> b!123312 (=> (not res!102226) (not e!80816))))

(assert (=> b!123312 (= res!102226 (isPrefixOf!0 (_2!5461 lt!193323) (_2!5461 lt!194675)))))

(declare-fun b!123313 () Bool)

(assert (=> b!123313 (= e!80816 e!80815)))

(declare-fun res!102228 () Bool)

(assert (=> b!123313 (=> (not res!102228) (not e!80815))))

(assert (=> b!123313 (= res!102228 (and (= (_2!5464 lt!194673) lt!193798) (= (_1!5464 lt!194673) (_2!5461 lt!194675))))))

(assert (=> b!123313 (= lt!194673 (readBitPure!0 (readerFrom!0 (_2!5461 lt!194675) (currentBit!5591 (_2!5461 lt!193323)) (currentByte!5596 (_2!5461 lt!193323)))))))

(assert (= (and d!39840 res!102227) b!123311))

(assert (= (and b!123311 res!102225) b!123312))

(assert (= (and b!123312 res!102226) b!123313))

(assert (= (and b!123313 res!102228) b!123314))

(declare-fun m!187735 () Bool)

(assert (=> b!123314 m!187735))

(declare-fun m!187737 () Bool)

(assert (=> b!123314 m!187737))

(declare-fun m!187739 () Bool)

(assert (=> b!123313 m!187739))

(assert (=> b!123313 m!187739))

(declare-fun m!187741 () Bool)

(assert (=> b!123313 m!187741))

(declare-fun m!187743 () Bool)

(assert (=> b!123312 m!187743))

(declare-fun m!187745 () Bool)

(assert (=> d!39840 m!187745))

(declare-fun m!187747 () Bool)

(assert (=> d!39840 m!187747))

(assert (=> b!123311 m!187737))

(assert (=> b!123311 m!186565))

(assert (=> b!122983 d!39840))

(declare-fun d!39842 () Bool)

(assert (=> d!39842 (validate_offset_bits!1 ((_ sign_extend 32) (size!2459 (buf!2899 (_2!5461 lt!193817)))) ((_ sign_extend 32) (currentByte!5596 (_2!5461 lt!193800))) ((_ sign_extend 32) (currentBit!5591 (_2!5461 lt!193800))) lt!193807)))

(declare-fun lt!194676 () Unit!7557)

(assert (=> d!39842 (= lt!194676 (choose!9 (_2!5461 lt!193800) (buf!2899 (_2!5461 lt!193817)) lt!193807 (BitStream!4393 (buf!2899 (_2!5461 lt!193817)) (currentByte!5596 (_2!5461 lt!193800)) (currentBit!5591 (_2!5461 lt!193800)))))))

(assert (=> d!39842 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5461 lt!193800) (buf!2899 (_2!5461 lt!193817)) lt!193807) lt!194676)))

(declare-fun bs!9628 () Bool)

(assert (= bs!9628 d!39842))

(assert (=> bs!9628 m!187005))

(declare-fun m!187749 () Bool)

(assert (=> bs!9628 m!187749))

(assert (=> b!122983 d!39842))

(declare-fun d!39844 () Bool)

(declare-fun e!80817 () Bool)

(assert (=> d!39844 e!80817))

(declare-fun res!102230 () Bool)

(assert (=> d!39844 (=> (not res!102230) (not e!80817))))

(declare-fun lt!194680 () (_ BitVec 64))

(declare-fun lt!194677 () (_ BitVec 64))

(declare-fun lt!194681 () (_ BitVec 64))

(assert (=> d!39844 (= res!102230 (= lt!194677 (bvsub lt!194681 lt!194680)))))

(assert (=> d!39844 (or (= (bvand lt!194681 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!194680 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!194681 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!194681 lt!194680) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39844 (= lt!194680 (remainingBits!0 ((_ sign_extend 32) (size!2459 (buf!2899 (_2!5461 lt!193817)))) ((_ sign_extend 32) (currentByte!5596 (_2!5461 lt!193817))) ((_ sign_extend 32) (currentBit!5591 (_2!5461 lt!193817)))))))

(declare-fun lt!194682 () (_ BitVec 64))

(declare-fun lt!194679 () (_ BitVec 64))

(assert (=> d!39844 (= lt!194681 (bvmul lt!194682 lt!194679))))

(assert (=> d!39844 (or (= lt!194682 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!194679 (bvsdiv (bvmul lt!194682 lt!194679) lt!194682)))))

(assert (=> d!39844 (= lt!194679 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!39844 (= lt!194682 ((_ sign_extend 32) (size!2459 (buf!2899 (_2!5461 lt!193817)))))))

(assert (=> d!39844 (= lt!194677 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5596 (_2!5461 lt!193817))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5591 (_2!5461 lt!193817)))))))

(assert (=> d!39844 (invariant!0 (currentBit!5591 (_2!5461 lt!193817)) (currentByte!5596 (_2!5461 lt!193817)) (size!2459 (buf!2899 (_2!5461 lt!193817))))))

(assert (=> d!39844 (= (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193817))) (currentByte!5596 (_2!5461 lt!193817)) (currentBit!5591 (_2!5461 lt!193817))) lt!194677)))

(declare-fun b!123315 () Bool)

(declare-fun res!102229 () Bool)

(assert (=> b!123315 (=> (not res!102229) (not e!80817))))

(assert (=> b!123315 (= res!102229 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!194677))))

(declare-fun b!123316 () Bool)

(declare-fun lt!194678 () (_ BitVec 64))

(assert (=> b!123316 (= e!80817 (bvsle lt!194677 (bvmul lt!194678 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123316 (or (= lt!194678 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!194678 #b0000000000000000000000000000000000000000000000000000000000001000) lt!194678)))))

(assert (=> b!123316 (= lt!194678 ((_ sign_extend 32) (size!2459 (buf!2899 (_2!5461 lt!193817)))))))

(assert (= (and d!39844 res!102230) b!123315))

(assert (= (and b!123315 res!102229) b!123316))

(declare-fun m!187751 () Bool)

(assert (=> d!39844 m!187751))

(declare-fun m!187753 () Bool)

(assert (=> d!39844 m!187753))

(assert (=> b!122983 d!39844))

(declare-fun d!39846 () Bool)

(declare-fun lt!194683 () tuple2!10408)

(assert (=> d!39846 (= lt!194683 (readBit!0 lt!193829))))

(assert (=> d!39846 (= (readBitPure!0 lt!193829) (tuple2!10399 (_2!5469 lt!194683) (_1!5469 lt!194683)))))

(declare-fun bs!9629 () Bool)

(assert (= bs!9629 d!39846))

(declare-fun m!187755 () Bool)

(assert (=> bs!9629 m!187755))

(assert (=> b!122983 d!39846))

(declare-fun d!39848 () Bool)

(assert (=> d!39848 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2459 (buf!2899 (_2!5461 lt!193817)))) ((_ sign_extend 32) (currentByte!5596 (_2!5461 lt!193323))) ((_ sign_extend 32) (currentBit!5591 (_2!5461 lt!193323))) lt!193819) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2459 (buf!2899 (_2!5461 lt!193817)))) ((_ sign_extend 32) (currentByte!5596 (_2!5461 lt!193323))) ((_ sign_extend 32) (currentBit!5591 (_2!5461 lt!193323)))) lt!193819))))

(declare-fun bs!9630 () Bool)

(assert (= bs!9630 d!39848))

(declare-fun m!187757 () Bool)

(assert (=> bs!9630 m!187757))

(assert (=> b!122983 d!39848))

(declare-fun d!39850 () Bool)

(declare-fun e!80818 () Bool)

(assert (=> d!39850 e!80818))

(declare-fun res!102231 () Bool)

(assert (=> d!39850 (=> (not res!102231) (not e!80818))))

(declare-fun lt!194685 () (_ BitVec 64))

(declare-fun lt!194684 () BitStream!4392)

(assert (=> d!39850 (= res!102231 (= (bvadd lt!194685 (bvsub (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193800))) (currentByte!5596 (_2!5461 lt!193800)) (currentBit!5591 (_2!5461 lt!193800))) (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193817))) (currentByte!5596 (_2!5461 lt!193817)) (currentBit!5591 (_2!5461 lt!193817))))) (bitIndex!0 (size!2459 (buf!2899 lt!194684)) (currentByte!5596 lt!194684) (currentBit!5591 lt!194684))))))

(assert (=> d!39850 (or (not (= (bvand lt!194685 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193800))) (currentByte!5596 (_2!5461 lt!193800)) (currentBit!5591 (_2!5461 lt!193800))) (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193817))) (currentByte!5596 (_2!5461 lt!193817)) (currentBit!5591 (_2!5461 lt!193817)))) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!194685 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!194685 (bvsub (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193800))) (currentByte!5596 (_2!5461 lt!193800)) (currentBit!5591 (_2!5461 lt!193800))) (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193817))) (currentByte!5596 (_2!5461 lt!193817)) (currentBit!5591 (_2!5461 lt!193817))))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39850 (= lt!194685 (bitIndex!0 (size!2459 (buf!2899 (_2!5463 lt!193822))) (currentByte!5596 (_2!5463 lt!193822)) (currentBit!5591 (_2!5463 lt!193822))))))

(assert (=> d!39850 (= lt!194684 (_2!5461 (moveBitIndex!0 (_2!5463 lt!193822) (bvsub (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193800))) (currentByte!5596 (_2!5461 lt!193800)) (currentBit!5591 (_2!5461 lt!193800))) (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193817))) (currentByte!5596 (_2!5461 lt!193817)) (currentBit!5591 (_2!5461 lt!193817)))))))))

(assert (=> d!39850 (moveBitIndexPrecond!0 (_2!5463 lt!193822) (bvsub (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193800))) (currentByte!5596 (_2!5461 lt!193800)) (currentBit!5591 (_2!5461 lt!193800))) (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193817))) (currentByte!5596 (_2!5461 lt!193817)) (currentBit!5591 (_2!5461 lt!193817)))))))

(assert (=> d!39850 (= (withMovedBitIndex!0 (_2!5463 lt!193822) (bvsub (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193800))) (currentByte!5596 (_2!5461 lt!193800)) (currentBit!5591 (_2!5461 lt!193800))) (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193817))) (currentByte!5596 (_2!5461 lt!193817)) (currentBit!5591 (_2!5461 lt!193817))))) lt!194684)))

(declare-fun b!123317 () Bool)

(assert (=> b!123317 (= e!80818 (= (size!2459 (buf!2899 (_2!5463 lt!193822))) (size!2459 (buf!2899 lt!194684))))))

(assert (= (and d!39850 res!102231) b!123317))

(declare-fun m!187759 () Bool)

(assert (=> d!39850 m!187759))

(declare-fun m!187761 () Bool)

(assert (=> d!39850 m!187761))

(declare-fun m!187763 () Bool)

(assert (=> d!39850 m!187763))

(declare-fun m!187765 () Bool)

(assert (=> d!39850 m!187765))

(assert (=> b!122983 d!39850))

(declare-fun lt!194696 () (_ BitVec 64))

(declare-fun lt!194695 () tuple2!10396)

(declare-fun e!80819 () Bool)

(declare-fun b!123318 () Bool)

(declare-fun lt!194701 () (_ BitVec 64))

(assert (=> b!123318 (= e!80819 (= (_1!5463 lt!194695) (withMovedBitIndex!0 (_2!5463 lt!194695) (bvsub lt!194696 lt!194701))))))

(assert (=> b!123318 (or (= (bvand lt!194696 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!194701 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!194696 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!194696 lt!194701) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!123318 (= lt!194701 (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193817))) (currentByte!5596 (_2!5461 lt!193817)) (currentBit!5591 (_2!5461 lt!193817))))))

(assert (=> b!123318 (= lt!194696 (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193323))) (currentByte!5596 (_2!5461 lt!193323)) (currentBit!5591 (_2!5461 lt!193323))))))

(declare-fun b!123320 () Bool)

(declare-fun res!102234 () Bool)

(assert (=> b!123320 (=> (not res!102234) (not e!80819))))

(assert (=> b!123320 (= res!102234 (isPrefixOf!0 (_1!5463 lt!194695) (_2!5461 lt!193323)))))

(declare-fun b!123321 () Bool)

(declare-fun res!102233 () Bool)

(assert (=> b!123321 (=> (not res!102233) (not e!80819))))

(assert (=> b!123321 (= res!102233 (isPrefixOf!0 (_2!5463 lt!194695) (_2!5461 lt!193817)))))

(declare-fun b!123322 () Bool)

(declare-fun e!80820 () Unit!7557)

(declare-fun Unit!7609 () Unit!7557)

(assert (=> b!123322 (= e!80820 Unit!7609)))

(declare-fun b!123319 () Bool)

(declare-fun lt!194703 () Unit!7557)

(assert (=> b!123319 (= e!80820 lt!194703)))

(declare-fun lt!194691 () (_ BitVec 64))

(assert (=> b!123319 (= lt!194691 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!194692 () (_ BitVec 64))

(assert (=> b!123319 (= lt!194692 (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193323))) (currentByte!5596 (_2!5461 lt!193323)) (currentBit!5591 (_2!5461 lt!193323))))))

(assert (=> b!123319 (= lt!194703 (arrayBitRangesEqSymmetric!0 (buf!2899 (_2!5461 lt!193323)) (buf!2899 (_2!5461 lt!193817)) lt!194691 lt!194692))))

(assert (=> b!123319 (arrayBitRangesEq!0 (buf!2899 (_2!5461 lt!193817)) (buf!2899 (_2!5461 lt!193323)) lt!194691 lt!194692)))

(declare-fun d!39852 () Bool)

(assert (=> d!39852 e!80819))

(declare-fun res!102232 () Bool)

(assert (=> d!39852 (=> (not res!102232) (not e!80819))))

(assert (=> d!39852 (= res!102232 (isPrefixOf!0 (_1!5463 lt!194695) (_2!5463 lt!194695)))))

(declare-fun lt!194702 () BitStream!4392)

(assert (=> d!39852 (= lt!194695 (tuple2!10397 lt!194702 (_2!5461 lt!193817)))))

(declare-fun lt!194705 () Unit!7557)

(declare-fun lt!194687 () Unit!7557)

(assert (=> d!39852 (= lt!194705 lt!194687)))

(assert (=> d!39852 (isPrefixOf!0 lt!194702 (_2!5461 lt!193817))))

(assert (=> d!39852 (= lt!194687 (lemmaIsPrefixTransitive!0 lt!194702 (_2!5461 lt!193817) (_2!5461 lt!193817)))))

(declare-fun lt!194690 () Unit!7557)

(declare-fun lt!194693 () Unit!7557)

(assert (=> d!39852 (= lt!194690 lt!194693)))

(assert (=> d!39852 (isPrefixOf!0 lt!194702 (_2!5461 lt!193817))))

(assert (=> d!39852 (= lt!194693 (lemmaIsPrefixTransitive!0 lt!194702 (_2!5461 lt!193323) (_2!5461 lt!193817)))))

(declare-fun lt!194699 () Unit!7557)

(assert (=> d!39852 (= lt!194699 e!80820)))

(declare-fun c!7370 () Bool)

(assert (=> d!39852 (= c!7370 (not (= (size!2459 (buf!2899 (_2!5461 lt!193323))) #b00000000000000000000000000000000)))))

(declare-fun lt!194686 () Unit!7557)

(declare-fun lt!194700 () Unit!7557)

(assert (=> d!39852 (= lt!194686 lt!194700)))

(assert (=> d!39852 (isPrefixOf!0 (_2!5461 lt!193817) (_2!5461 lt!193817))))

(assert (=> d!39852 (= lt!194700 (lemmaIsPrefixRefl!0 (_2!5461 lt!193817)))))

(declare-fun lt!194688 () Unit!7557)

(declare-fun lt!194698 () Unit!7557)

(assert (=> d!39852 (= lt!194688 lt!194698)))

(assert (=> d!39852 (= lt!194698 (lemmaIsPrefixRefl!0 (_2!5461 lt!193817)))))

(declare-fun lt!194694 () Unit!7557)

(declare-fun lt!194704 () Unit!7557)

(assert (=> d!39852 (= lt!194694 lt!194704)))

(assert (=> d!39852 (isPrefixOf!0 lt!194702 lt!194702)))

(assert (=> d!39852 (= lt!194704 (lemmaIsPrefixRefl!0 lt!194702))))

(declare-fun lt!194689 () Unit!7557)

(declare-fun lt!194697 () Unit!7557)

(assert (=> d!39852 (= lt!194689 lt!194697)))

(assert (=> d!39852 (isPrefixOf!0 (_2!5461 lt!193323) (_2!5461 lt!193323))))

(assert (=> d!39852 (= lt!194697 (lemmaIsPrefixRefl!0 (_2!5461 lt!193323)))))

(assert (=> d!39852 (= lt!194702 (BitStream!4393 (buf!2899 (_2!5461 lt!193817)) (currentByte!5596 (_2!5461 lt!193323)) (currentBit!5591 (_2!5461 lt!193323))))))

(assert (=> d!39852 (isPrefixOf!0 (_2!5461 lt!193323) (_2!5461 lt!193817))))

(assert (=> d!39852 (= (reader!0 (_2!5461 lt!193323) (_2!5461 lt!193817)) lt!194695)))

(assert (= (and d!39852 c!7370) b!123319))

(assert (= (and d!39852 (not c!7370)) b!123322))

(assert (= (and d!39852 res!102232) b!123320))

(assert (= (and b!123320 res!102234) b!123321))

(assert (= (and b!123321 res!102233) b!123318))

(declare-fun m!187767 () Bool)

(assert (=> d!39852 m!187767))

(declare-fun m!187769 () Bool)

(assert (=> d!39852 m!187769))

(declare-fun m!187771 () Bool)

(assert (=> d!39852 m!187771))

(declare-fun m!187773 () Bool)

(assert (=> d!39852 m!187773))

(declare-fun m!187775 () Bool)

(assert (=> d!39852 m!187775))

(assert (=> d!39852 m!187065))

(declare-fun m!187777 () Bool)

(assert (=> d!39852 m!187777))

(assert (=> d!39852 m!187069))

(declare-fun m!187779 () Bool)

(assert (=> d!39852 m!187779))

(declare-fun m!187781 () Bool)

(assert (=> d!39852 m!187781))

(declare-fun m!187783 () Bool)

(assert (=> d!39852 m!187783))

(declare-fun m!187785 () Bool)

(assert (=> b!123318 m!187785))

(assert (=> b!123318 m!186965))

(assert (=> b!123318 m!186565))

(declare-fun m!187787 () Bool)

(assert (=> b!123320 m!187787))

(declare-fun m!187789 () Bool)

(assert (=> b!123321 m!187789))

(assert (=> b!123319 m!186565))

(declare-fun m!187791 () Bool)

(assert (=> b!123319 m!187791))

(declare-fun m!187793 () Bool)

(assert (=> b!123319 m!187793))

(assert (=> b!122983 d!39852))

(declare-fun b!123323 () Bool)

(declare-fun e!80821 () Bool)

(declare-fun lt!194721 () (_ BitVec 64))

(declare-fun lt!194716 () (_ BitVec 64))

(declare-fun lt!194715 () tuple2!10396)

(assert (=> b!123323 (= e!80821 (= (_1!5463 lt!194715) (withMovedBitIndex!0 (_2!5463 lt!194715) (bvsub lt!194716 lt!194721))))))

(assert (=> b!123323 (or (= (bvand lt!194716 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!194721 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!194716 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!194716 lt!194721) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!123323 (= lt!194721 (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193817))) (currentByte!5596 (_2!5461 lt!193817)) (currentBit!5591 (_2!5461 lt!193817))))))

(assert (=> b!123323 (= lt!194716 (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193800))) (currentByte!5596 (_2!5461 lt!193800)) (currentBit!5591 (_2!5461 lt!193800))))))

(declare-fun b!123325 () Bool)

(declare-fun res!102237 () Bool)

(assert (=> b!123325 (=> (not res!102237) (not e!80821))))

(assert (=> b!123325 (= res!102237 (isPrefixOf!0 (_1!5463 lt!194715) (_2!5461 lt!193800)))))

(declare-fun b!123326 () Bool)

(declare-fun res!102236 () Bool)

(assert (=> b!123326 (=> (not res!102236) (not e!80821))))

(assert (=> b!123326 (= res!102236 (isPrefixOf!0 (_2!5463 lt!194715) (_2!5461 lt!193817)))))

(declare-fun b!123327 () Bool)

(declare-fun e!80822 () Unit!7557)

(declare-fun Unit!7610 () Unit!7557)

(assert (=> b!123327 (= e!80822 Unit!7610)))

(declare-fun b!123324 () Bool)

(declare-fun lt!194723 () Unit!7557)

(assert (=> b!123324 (= e!80822 lt!194723)))

(declare-fun lt!194711 () (_ BitVec 64))

(assert (=> b!123324 (= lt!194711 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!194712 () (_ BitVec 64))

(assert (=> b!123324 (= lt!194712 (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193800))) (currentByte!5596 (_2!5461 lt!193800)) (currentBit!5591 (_2!5461 lt!193800))))))

(assert (=> b!123324 (= lt!194723 (arrayBitRangesEqSymmetric!0 (buf!2899 (_2!5461 lt!193800)) (buf!2899 (_2!5461 lt!193817)) lt!194711 lt!194712))))

(assert (=> b!123324 (arrayBitRangesEq!0 (buf!2899 (_2!5461 lt!193817)) (buf!2899 (_2!5461 lt!193800)) lt!194711 lt!194712)))

(declare-fun d!39854 () Bool)

(assert (=> d!39854 e!80821))

(declare-fun res!102235 () Bool)

(assert (=> d!39854 (=> (not res!102235) (not e!80821))))

(assert (=> d!39854 (= res!102235 (isPrefixOf!0 (_1!5463 lt!194715) (_2!5463 lt!194715)))))

(declare-fun lt!194722 () BitStream!4392)

(assert (=> d!39854 (= lt!194715 (tuple2!10397 lt!194722 (_2!5461 lt!193817)))))

(declare-fun lt!194725 () Unit!7557)

(declare-fun lt!194707 () Unit!7557)

(assert (=> d!39854 (= lt!194725 lt!194707)))

(assert (=> d!39854 (isPrefixOf!0 lt!194722 (_2!5461 lt!193817))))

(assert (=> d!39854 (= lt!194707 (lemmaIsPrefixTransitive!0 lt!194722 (_2!5461 lt!193817) (_2!5461 lt!193817)))))

(declare-fun lt!194710 () Unit!7557)

(declare-fun lt!194713 () Unit!7557)

(assert (=> d!39854 (= lt!194710 lt!194713)))

(assert (=> d!39854 (isPrefixOf!0 lt!194722 (_2!5461 lt!193817))))

(assert (=> d!39854 (= lt!194713 (lemmaIsPrefixTransitive!0 lt!194722 (_2!5461 lt!193800) (_2!5461 lt!193817)))))

(declare-fun lt!194719 () Unit!7557)

(assert (=> d!39854 (= lt!194719 e!80822)))

(declare-fun c!7371 () Bool)

(assert (=> d!39854 (= c!7371 (not (= (size!2459 (buf!2899 (_2!5461 lt!193800))) #b00000000000000000000000000000000)))))

(declare-fun lt!194706 () Unit!7557)

(declare-fun lt!194720 () Unit!7557)

(assert (=> d!39854 (= lt!194706 lt!194720)))

(assert (=> d!39854 (isPrefixOf!0 (_2!5461 lt!193817) (_2!5461 lt!193817))))

(assert (=> d!39854 (= lt!194720 (lemmaIsPrefixRefl!0 (_2!5461 lt!193817)))))

(declare-fun lt!194708 () Unit!7557)

(declare-fun lt!194718 () Unit!7557)

(assert (=> d!39854 (= lt!194708 lt!194718)))

(assert (=> d!39854 (= lt!194718 (lemmaIsPrefixRefl!0 (_2!5461 lt!193817)))))

(declare-fun lt!194714 () Unit!7557)

(declare-fun lt!194724 () Unit!7557)

(assert (=> d!39854 (= lt!194714 lt!194724)))

(assert (=> d!39854 (isPrefixOf!0 lt!194722 lt!194722)))

(assert (=> d!39854 (= lt!194724 (lemmaIsPrefixRefl!0 lt!194722))))

(declare-fun lt!194709 () Unit!7557)

(declare-fun lt!194717 () Unit!7557)

(assert (=> d!39854 (= lt!194709 lt!194717)))

(assert (=> d!39854 (isPrefixOf!0 (_2!5461 lt!193800) (_2!5461 lt!193800))))

(assert (=> d!39854 (= lt!194717 (lemmaIsPrefixRefl!0 (_2!5461 lt!193800)))))

(assert (=> d!39854 (= lt!194722 (BitStream!4393 (buf!2899 (_2!5461 lt!193817)) (currentByte!5596 (_2!5461 lt!193800)) (currentBit!5591 (_2!5461 lt!193800))))))

(assert (=> d!39854 (isPrefixOf!0 (_2!5461 lt!193800) (_2!5461 lt!193817))))

(assert (=> d!39854 (= (reader!0 (_2!5461 lt!193800) (_2!5461 lt!193817)) lt!194715)))

(assert (= (and d!39854 c!7371) b!123324))

(assert (= (and d!39854 (not c!7371)) b!123327))

(assert (= (and d!39854 res!102235) b!123325))

(assert (= (and b!123325 res!102237) b!123326))

(assert (= (and b!123326 res!102236) b!123323))

(assert (=> d!39854 m!187767))

(declare-fun m!187795 () Bool)

(assert (=> d!39854 m!187795))

(declare-fun m!187797 () Bool)

(assert (=> d!39854 m!187797))

(declare-fun m!187799 () Bool)

(assert (=> d!39854 m!187799))

(declare-fun m!187801 () Bool)

(assert (=> d!39854 m!187801))

(declare-fun m!187803 () Bool)

(assert (=> d!39854 m!187803))

(declare-fun m!187805 () Bool)

(assert (=> d!39854 m!187805))

(declare-fun m!187807 () Bool)

(assert (=> d!39854 m!187807))

(declare-fun m!187809 () Bool)

(assert (=> d!39854 m!187809))

(assert (=> d!39854 m!187781))

(declare-fun m!187811 () Bool)

(assert (=> d!39854 m!187811))

(declare-fun m!187813 () Bool)

(assert (=> b!123323 m!187813))

(assert (=> b!123323 m!186965))

(assert (=> b!123323 m!187001))

(declare-fun m!187815 () Bool)

(assert (=> b!123325 m!187815))

(declare-fun m!187817 () Bool)

(assert (=> b!123326 m!187817))

(assert (=> b!123324 m!187001))

(declare-fun m!187819 () Bool)

(assert (=> b!123324 m!187819))

(declare-fun m!187821 () Bool)

(assert (=> b!123324 m!187821))

(assert (=> b!122983 d!39854))

(declare-fun d!39856 () Bool)

(assert (=> d!39856 (= (invariant!0 (currentBit!5591 lt!193828) (currentByte!5596 lt!193828) (size!2459 (buf!2899 (_2!5461 lt!193817)))) (and (bvsge (currentBit!5591 lt!193828) #b00000000000000000000000000000000) (bvslt (currentBit!5591 lt!193828) #b00000000000000000000000000001000) (bvsge (currentByte!5596 lt!193828) #b00000000000000000000000000000000) (or (bvslt (currentByte!5596 lt!193828) (size!2459 (buf!2899 (_2!5461 lt!193817)))) (and (= (currentBit!5591 lt!193828) #b00000000000000000000000000000000) (= (currentByte!5596 lt!193828) (size!2459 (buf!2899 (_2!5461 lt!193817))))))))))

(assert (=> b!122983 d!39856))

(assert (=> b!122983 d!39462))

(declare-fun d!39858 () Bool)

(declare-fun lt!194726 () tuple2!10410)

(assert (=> d!39858 (= lt!194726 (readNLeastSignificantBitsLoop!0 (_1!5463 lt!193824) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!193816))))

(assert (=> d!39858 (= (readNLeastSignificantBitsLoopPure!0 (_1!5463 lt!193824) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!193816) (tuple2!10395 (_2!5470 lt!194726) (_1!5470 lt!194726)))))

(declare-fun bs!9631 () Bool)

(assert (= bs!9631 d!39858))

(declare-fun m!187823 () Bool)

(assert (=> bs!9631 m!187823))

(assert (=> b!122983 d!39858))

(declare-fun d!39860 () Bool)

(assert (=> d!39860 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2459 (buf!2899 (_2!5461 lt!193817)))) ((_ sign_extend 32) (currentByte!5596 (_2!5461 lt!193800))) ((_ sign_extend 32) (currentBit!5591 (_2!5461 lt!193800))) lt!193807) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2459 (buf!2899 (_2!5461 lt!193817)))) ((_ sign_extend 32) (currentByte!5596 (_2!5461 lt!193800))) ((_ sign_extend 32) (currentBit!5591 (_2!5461 lt!193800)))) lt!193807))))

(declare-fun bs!9632 () Bool)

(assert (= bs!9632 d!39860))

(declare-fun m!187825 () Bool)

(assert (=> bs!9632 m!187825))

(assert (=> b!122983 d!39860))

(declare-fun d!39862 () Bool)

(assert (=> d!39862 (validate_offset_bits!1 ((_ sign_extend 32) (size!2459 (buf!2899 (_2!5461 lt!193817)))) ((_ sign_extend 32) (currentByte!5596 (_2!5461 lt!193323))) ((_ sign_extend 32) (currentBit!5591 (_2!5461 lt!193323))) lt!193819)))

(declare-fun lt!194727 () Unit!7557)

(assert (=> d!39862 (= lt!194727 (choose!9 (_2!5461 lt!193323) (buf!2899 (_2!5461 lt!193817)) lt!193819 (BitStream!4393 (buf!2899 (_2!5461 lt!193817)) (currentByte!5596 (_2!5461 lt!193323)) (currentBit!5591 (_2!5461 lt!193323)))))))

(assert (=> d!39862 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5461 lt!193323) (buf!2899 (_2!5461 lt!193817)) lt!193819) lt!194727)))

(declare-fun bs!9633 () Bool)

(assert (= bs!9633 d!39862))

(assert (=> bs!9633 m!186969))

(declare-fun m!187827 () Bool)

(assert (=> bs!9633 m!187827))

(assert (=> b!122983 d!39862))

(declare-fun d!39864 () Bool)

(assert (=> d!39864 (= (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!122983 d!39864))

(declare-fun d!39866 () Bool)

(assert (=> d!39866 (isPrefixOf!0 (_2!5461 lt!193323) (_2!5461 lt!193817))))

(declare-fun lt!194728 () Unit!7557)

(assert (=> d!39866 (= lt!194728 (choose!30 (_2!5461 lt!193323) (_2!5461 lt!193800) (_2!5461 lt!193817)))))

(assert (=> d!39866 (isPrefixOf!0 (_2!5461 lt!193323) (_2!5461 lt!193800))))

(assert (=> d!39866 (= (lemmaIsPrefixTransitive!0 (_2!5461 lt!193323) (_2!5461 lt!193800) (_2!5461 lt!193817)) lt!194728)))

(declare-fun bs!9634 () Bool)

(assert (= bs!9634 d!39866))

(assert (=> bs!9634 m!187783))

(declare-fun m!187829 () Bool)

(assert (=> bs!9634 m!187829))

(declare-fun m!187831 () Bool)

(assert (=> bs!9634 m!187831))

(assert (=> b!122983 d!39866))

(declare-fun d!39868 () Bool)

(declare-fun e!80823 () Bool)

(assert (=> d!39868 e!80823))

(declare-fun res!102239 () Bool)

(assert (=> d!39868 (=> (not res!102239) (not e!80823))))

(declare-fun lt!194732 () (_ BitVec 64))

(declare-fun lt!194729 () (_ BitVec 64))

(declare-fun lt!194733 () (_ BitVec 64))

(assert (=> d!39868 (= res!102239 (= lt!194729 (bvsub lt!194733 lt!194732)))))

(assert (=> d!39868 (or (= (bvand lt!194733 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!194732 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!194733 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!194733 lt!194732) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39868 (= lt!194732 (remainingBits!0 ((_ sign_extend 32) (size!2459 (buf!2899 (_1!5464 lt!193823)))) ((_ sign_extend 32) (currentByte!5596 (_1!5464 lt!193823))) ((_ sign_extend 32) (currentBit!5591 (_1!5464 lt!193823)))))))

(declare-fun lt!194734 () (_ BitVec 64))

(declare-fun lt!194731 () (_ BitVec 64))

(assert (=> d!39868 (= lt!194733 (bvmul lt!194734 lt!194731))))

(assert (=> d!39868 (or (= lt!194734 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!194731 (bvsdiv (bvmul lt!194734 lt!194731) lt!194734)))))

(assert (=> d!39868 (= lt!194731 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!39868 (= lt!194734 ((_ sign_extend 32) (size!2459 (buf!2899 (_1!5464 lt!193823)))))))

(assert (=> d!39868 (= lt!194729 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5596 (_1!5464 lt!193823))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5591 (_1!5464 lt!193823)))))))

(assert (=> d!39868 (invariant!0 (currentBit!5591 (_1!5464 lt!193823)) (currentByte!5596 (_1!5464 lt!193823)) (size!2459 (buf!2899 (_1!5464 lt!193823))))))

(assert (=> d!39868 (= (bitIndex!0 (size!2459 (buf!2899 (_1!5464 lt!193823))) (currentByte!5596 (_1!5464 lt!193823)) (currentBit!5591 (_1!5464 lt!193823))) lt!194729)))

(declare-fun b!123328 () Bool)

(declare-fun res!102238 () Bool)

(assert (=> b!123328 (=> (not res!102238) (not e!80823))))

(assert (=> b!123328 (= res!102238 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!194729))))

(declare-fun b!123329 () Bool)

(declare-fun lt!194730 () (_ BitVec 64))

(assert (=> b!123329 (= e!80823 (bvsle lt!194729 (bvmul lt!194730 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123329 (or (= lt!194730 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!194730 #b0000000000000000000000000000000000000000000000000000000000001000) lt!194730)))))

(assert (=> b!123329 (= lt!194730 ((_ sign_extend 32) (size!2459 (buf!2899 (_1!5464 lt!193823)))))))

(assert (= (and d!39868 res!102239) b!123328))

(assert (= (and b!123328 res!102238) b!123329))

(declare-fun m!187833 () Bool)

(assert (=> d!39868 m!187833))

(declare-fun m!187835 () Bool)

(assert (=> d!39868 m!187835))

(assert (=> b!122983 d!39868))

(declare-fun d!39870 () Bool)

(declare-fun lt!194735 () tuple2!10408)

(assert (=> d!39870 (= lt!194735 (readBit!0 lt!193828))))

(assert (=> d!39870 (= (readBitPure!0 lt!193828) (tuple2!10399 (_2!5469 lt!194735) (_1!5469 lt!194735)))))

(declare-fun bs!9635 () Bool)

(assert (= bs!9635 d!39870))

(declare-fun m!187837 () Bool)

(assert (=> bs!9635 m!187837))

(assert (=> b!122983 d!39870))

(declare-fun d!39872 () Bool)

(declare-fun e!80824 () Bool)

(assert (=> d!39872 e!80824))

(declare-fun res!102240 () Bool)

(assert (=> d!39872 (=> (not res!102240) (not e!80824))))

(declare-fun lt!194737 () (_ BitVec 64))

(declare-fun lt!194736 () BitStream!4392)

(assert (=> d!39872 (= res!102240 (= (bvadd lt!194737 (bvsub (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193323))) (currentByte!5596 (_2!5461 lt!193323)) (currentBit!5591 (_2!5461 lt!193323))) (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193817))) (currentByte!5596 (_2!5461 lt!193817)) (currentBit!5591 (_2!5461 lt!193817))))) (bitIndex!0 (size!2459 (buf!2899 lt!194736)) (currentByte!5596 lt!194736) (currentBit!5591 lt!194736))))))

(assert (=> d!39872 (or (not (= (bvand lt!194737 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193323))) (currentByte!5596 (_2!5461 lt!193323)) (currentBit!5591 (_2!5461 lt!193323))) (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193817))) (currentByte!5596 (_2!5461 lt!193817)) (currentBit!5591 (_2!5461 lt!193817)))) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!194737 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!194737 (bvsub (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193323))) (currentByte!5596 (_2!5461 lt!193323)) (currentBit!5591 (_2!5461 lt!193323))) (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193817))) (currentByte!5596 (_2!5461 lt!193817)) (currentBit!5591 (_2!5461 lt!193817))))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39872 (= lt!194737 (bitIndex!0 (size!2459 (buf!2899 (_2!5463 lt!193824))) (currentByte!5596 (_2!5463 lt!193824)) (currentBit!5591 (_2!5463 lt!193824))))))

(assert (=> d!39872 (= lt!194736 (_2!5461 (moveBitIndex!0 (_2!5463 lt!193824) (bvsub (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193323))) (currentByte!5596 (_2!5461 lt!193323)) (currentBit!5591 (_2!5461 lt!193323))) (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193817))) (currentByte!5596 (_2!5461 lt!193817)) (currentBit!5591 (_2!5461 lt!193817)))))))))

(assert (=> d!39872 (moveBitIndexPrecond!0 (_2!5463 lt!193824) (bvsub (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193323))) (currentByte!5596 (_2!5461 lt!193323)) (currentBit!5591 (_2!5461 lt!193323))) (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193817))) (currentByte!5596 (_2!5461 lt!193817)) (currentBit!5591 (_2!5461 lt!193817)))))))

(assert (=> d!39872 (= (withMovedBitIndex!0 (_2!5463 lt!193824) (bvsub (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193323))) (currentByte!5596 (_2!5461 lt!193323)) (currentBit!5591 (_2!5461 lt!193323))) (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193817))) (currentByte!5596 (_2!5461 lt!193817)) (currentBit!5591 (_2!5461 lt!193817))))) lt!194736)))

(declare-fun b!123330 () Bool)

(assert (=> b!123330 (= e!80824 (= (size!2459 (buf!2899 (_2!5463 lt!193824))) (size!2459 (buf!2899 lt!194736))))))

(assert (= (and d!39872 res!102240) b!123330))

(declare-fun m!187839 () Bool)

(assert (=> d!39872 m!187839))

(declare-fun m!187841 () Bool)

(assert (=> d!39872 m!187841))

(declare-fun m!187843 () Bool)

(assert (=> d!39872 m!187843))

(declare-fun m!187845 () Bool)

(assert (=> d!39872 m!187845))

(assert (=> b!122983 d!39872))

(declare-fun d!39874 () Bool)

(declare-fun e!80825 () Bool)

(assert (=> d!39874 e!80825))

(declare-fun res!102241 () Bool)

(assert (=> d!39874 (=> (not res!102241) (not e!80825))))

(assert (=> d!39874 (= res!102241 (= (buf!2899 (_2!5461 (increaseBitIndex!0 (BitStream!4393 (buf!2899 (_2!5461 lt!193308)) (currentByte!5596 thiss!1305) (currentBit!5591 thiss!1305))))) (buf!2899 (BitStream!4393 (buf!2899 (_2!5461 lt!193308)) (currentByte!5596 thiss!1305) (currentBit!5591 thiss!1305)))))))

(declare-fun lt!194743 () Bool)

(assert (=> d!39874 (= lt!194743 (not (= (bvand ((_ sign_extend 24) (select (arr!3052 (buf!2899 (BitStream!4393 (buf!2899 (_2!5461 lt!193308)) (currentByte!5596 thiss!1305) (currentBit!5591 thiss!1305)))) (currentByte!5596 (BitStream!4393 (buf!2899 (_2!5461 lt!193308)) (currentByte!5596 thiss!1305) (currentBit!5591 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5591 (BitStream!4393 (buf!2899 (_2!5461 lt!193308)) (currentByte!5596 thiss!1305) (currentBit!5591 thiss!1305)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!194739 () tuple2!10408)

(assert (=> d!39874 (= lt!194739 (tuple2!10409 (not (= (bvand ((_ sign_extend 24) (select (arr!3052 (buf!2899 (BitStream!4393 (buf!2899 (_2!5461 lt!193308)) (currentByte!5596 thiss!1305) (currentBit!5591 thiss!1305)))) (currentByte!5596 (BitStream!4393 (buf!2899 (_2!5461 lt!193308)) (currentByte!5596 thiss!1305) (currentBit!5591 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5591 (BitStream!4393 (buf!2899 (_2!5461 lt!193308)) (currentByte!5596 thiss!1305) (currentBit!5591 thiss!1305)))))) #b00000000000000000000000000000000)) (_2!5461 (increaseBitIndex!0 (BitStream!4393 (buf!2899 (_2!5461 lt!193308)) (currentByte!5596 thiss!1305) (currentBit!5591 thiss!1305))))))))

(assert (=> d!39874 (validate_offset_bit!0 ((_ sign_extend 32) (size!2459 (buf!2899 (BitStream!4393 (buf!2899 (_2!5461 lt!193308)) (currentByte!5596 thiss!1305) (currentBit!5591 thiss!1305))))) ((_ sign_extend 32) (currentByte!5596 (BitStream!4393 (buf!2899 (_2!5461 lt!193308)) (currentByte!5596 thiss!1305) (currentBit!5591 thiss!1305)))) ((_ sign_extend 32) (currentBit!5591 (BitStream!4393 (buf!2899 (_2!5461 lt!193308)) (currentByte!5596 thiss!1305) (currentBit!5591 thiss!1305)))))))

(assert (=> d!39874 (= (readBit!0 (BitStream!4393 (buf!2899 (_2!5461 lt!193308)) (currentByte!5596 thiss!1305) (currentBit!5591 thiss!1305))) lt!194739)))

(declare-fun lt!194744 () (_ BitVec 64))

(declare-fun lt!194738 () (_ BitVec 64))

(declare-fun b!123331 () Bool)

(assert (=> b!123331 (= e!80825 (= (bitIndex!0 (size!2459 (buf!2899 (_2!5461 (increaseBitIndex!0 (BitStream!4393 (buf!2899 (_2!5461 lt!193308)) (currentByte!5596 thiss!1305) (currentBit!5591 thiss!1305)))))) (currentByte!5596 (_2!5461 (increaseBitIndex!0 (BitStream!4393 (buf!2899 (_2!5461 lt!193308)) (currentByte!5596 thiss!1305) (currentBit!5591 thiss!1305))))) (currentBit!5591 (_2!5461 (increaseBitIndex!0 (BitStream!4393 (buf!2899 (_2!5461 lt!193308)) (currentByte!5596 thiss!1305) (currentBit!5591 thiss!1305)))))) (bvadd lt!194744 lt!194738)))))

(assert (=> b!123331 (or (not (= (bvand lt!194744 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!194738 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!194744 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!194744 lt!194738) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!123331 (= lt!194738 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!123331 (= lt!194744 (bitIndex!0 (size!2459 (buf!2899 (BitStream!4393 (buf!2899 (_2!5461 lt!193308)) (currentByte!5596 thiss!1305) (currentBit!5591 thiss!1305)))) (currentByte!5596 (BitStream!4393 (buf!2899 (_2!5461 lt!193308)) (currentByte!5596 thiss!1305) (currentBit!5591 thiss!1305))) (currentBit!5591 (BitStream!4393 (buf!2899 (_2!5461 lt!193308)) (currentByte!5596 thiss!1305) (currentBit!5591 thiss!1305)))))))

(declare-fun lt!194742 () Bool)

(assert (=> b!123331 (= lt!194742 (not (= (bvand ((_ sign_extend 24) (select (arr!3052 (buf!2899 (BitStream!4393 (buf!2899 (_2!5461 lt!193308)) (currentByte!5596 thiss!1305) (currentBit!5591 thiss!1305)))) (currentByte!5596 (BitStream!4393 (buf!2899 (_2!5461 lt!193308)) (currentByte!5596 thiss!1305) (currentBit!5591 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5591 (BitStream!4393 (buf!2899 (_2!5461 lt!193308)) (currentByte!5596 thiss!1305) (currentBit!5591 thiss!1305)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!194741 () Bool)

(assert (=> b!123331 (= lt!194741 (not (= (bvand ((_ sign_extend 24) (select (arr!3052 (buf!2899 (BitStream!4393 (buf!2899 (_2!5461 lt!193308)) (currentByte!5596 thiss!1305) (currentBit!5591 thiss!1305)))) (currentByte!5596 (BitStream!4393 (buf!2899 (_2!5461 lt!193308)) (currentByte!5596 thiss!1305) (currentBit!5591 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5591 (BitStream!4393 (buf!2899 (_2!5461 lt!193308)) (currentByte!5596 thiss!1305) (currentBit!5591 thiss!1305)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!194740 () Bool)

(assert (=> b!123331 (= lt!194740 (not (= (bvand ((_ sign_extend 24) (select (arr!3052 (buf!2899 (BitStream!4393 (buf!2899 (_2!5461 lt!193308)) (currentByte!5596 thiss!1305) (currentBit!5591 thiss!1305)))) (currentByte!5596 (BitStream!4393 (buf!2899 (_2!5461 lt!193308)) (currentByte!5596 thiss!1305) (currentBit!5591 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5591 (BitStream!4393 (buf!2899 (_2!5461 lt!193308)) (currentByte!5596 thiss!1305) (currentBit!5591 thiss!1305)))))) #b00000000000000000000000000000000)))))

(assert (= (and d!39874 res!102241) b!123331))

(declare-fun m!187847 () Bool)

(assert (=> d!39874 m!187847))

(declare-fun m!187849 () Bool)

(assert (=> d!39874 m!187849))

(declare-fun m!187851 () Bool)

(assert (=> d!39874 m!187851))

(declare-fun m!187853 () Bool)

(assert (=> d!39874 m!187853))

(declare-fun m!187855 () Bool)

(assert (=> b!123331 m!187855))

(assert (=> b!123331 m!187847))

(assert (=> b!123331 m!187849))

(declare-fun m!187857 () Bool)

(assert (=> b!123331 m!187857))

(assert (=> b!123331 m!187851))

(assert (=> d!39590 d!39874))

(declare-fun d!39876 () Bool)

(assert (=> d!39876 (= (remainingBits!0 ((_ sign_extend 32) (size!2459 (buf!2899 (_2!5461 lt!193308)))) ((_ sign_extend 32) (currentByte!5596 (_2!5461 lt!193308))) ((_ sign_extend 32) (currentBit!5591 (_2!5461 lt!193308)))) (bvsub (bvmul ((_ sign_extend 32) (size!2459 (buf!2899 (_2!5461 lt!193308)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5596 (_2!5461 lt!193308))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5591 (_2!5461 lt!193308))))))))

(assert (=> d!39626 d!39876))

(declare-fun d!39878 () Bool)

(assert (=> d!39878 (= (invariant!0 (currentBit!5591 (_2!5461 lt!193308)) (currentByte!5596 (_2!5461 lt!193308)) (size!2459 (buf!2899 (_2!5461 lt!193308)))) (and (bvsge (currentBit!5591 (_2!5461 lt!193308)) #b00000000000000000000000000000000) (bvslt (currentBit!5591 (_2!5461 lt!193308)) #b00000000000000000000000000001000) (bvsge (currentByte!5596 (_2!5461 lt!193308)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5596 (_2!5461 lt!193308)) (size!2459 (buf!2899 (_2!5461 lt!193308)))) (and (= (currentBit!5591 (_2!5461 lt!193308)) #b00000000000000000000000000000000) (= (currentByte!5596 (_2!5461 lt!193308)) (size!2459 (buf!2899 (_2!5461 lt!193308))))))))))

(assert (=> d!39626 d!39878))

(declare-fun b!123343 () Bool)

(declare-fun res!102252 () Bool)

(declare-fun e!80837 () Bool)

(assert (=> b!123343 (=> (not res!102252) (not e!80837))))

(declare-fun _$19!117 () tuple2!10392)

(assert (=> b!123343 (= res!102252 (= (bitIndex!0 (size!2459 (buf!2899 (_2!5461 _$19!117))) (currentByte!5596 (_2!5461 _$19!117)) (currentBit!5591 (_2!5461 _$19!117))) (bvadd (bitIndex!0 (size!2459 (buf!2899 thiss!1305)) (currentByte!5596 thiss!1305) (currentBit!5591 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!123344 () Bool)

(declare-fun res!102250 () Bool)

(assert (=> b!123344 (=> (not res!102250) (not e!80837))))

(assert (=> b!123344 (= res!102250 (isPrefixOf!0 thiss!1305 (_2!5461 _$19!117)))))

(declare-fun b!123345 () Bool)

(declare-fun e!80836 () Bool)

(assert (=> b!123345 (= e!80836 (array_inv!2261 (buf!2899 (_2!5461 _$19!117))))))

(declare-fun d!39880 () Bool)

(assert (=> d!39880 e!80837))

(declare-fun res!102251 () Bool)

(assert (=> d!39880 (=> (not res!102251) (not e!80837))))

(assert (=> d!39880 (= res!102251 (= (size!2459 (buf!2899 thiss!1305)) (size!2459 (buf!2899 (_2!5461 _$19!117)))))))

(assert (=> d!39880 (and (inv!12 (_2!5461 _$19!117)) e!80836)))

(assert (=> d!39880 (= (choose!16 thiss!1305 lt!193298) _$19!117)))

(declare-fun b!123346 () Bool)

(declare-fun e!80834 () Bool)

(declare-fun lt!194747 () tuple2!10398)

(assert (=> b!123346 (= e!80834 (= (bitIndex!0 (size!2459 (buf!2899 (_1!5464 lt!194747))) (currentByte!5596 (_1!5464 lt!194747)) (currentBit!5591 (_1!5464 lt!194747))) (bitIndex!0 (size!2459 (buf!2899 (_2!5461 _$19!117))) (currentByte!5596 (_2!5461 _$19!117)) (currentBit!5591 (_2!5461 _$19!117)))))))

(declare-fun b!123347 () Bool)

(assert (=> b!123347 (= e!80837 e!80834)))

(declare-fun res!102253 () Bool)

(assert (=> b!123347 (=> (not res!102253) (not e!80834))))

(assert (=> b!123347 (= res!102253 (and (= (_2!5464 lt!194747) lt!193298) (= (_1!5464 lt!194747) (_2!5461 _$19!117))))))

(assert (=> b!123347 (= lt!194747 (readBitPure!0 (readerFrom!0 (_2!5461 _$19!117) (currentBit!5591 thiss!1305) (currentByte!5596 thiss!1305))))))

(assert (= d!39880 b!123345))

(assert (= (and d!39880 res!102251) b!123343))

(assert (= (and b!123343 res!102252) b!123344))

(assert (= (and b!123344 res!102250) b!123347))

(assert (= (and b!123347 res!102253) b!123346))

(declare-fun m!187859 () Bool)

(assert (=> b!123346 m!187859))

(declare-fun m!187861 () Bool)

(assert (=> b!123346 m!187861))

(declare-fun m!187863 () Bool)

(assert (=> b!123347 m!187863))

(assert (=> b!123347 m!187863))

(declare-fun m!187865 () Bool)

(assert (=> b!123347 m!187865))

(declare-fun m!187867 () Bool)

(assert (=> b!123345 m!187867))

(assert (=> b!123343 m!187861))

(assert (=> b!123343 m!186569))

(declare-fun m!187869 () Bool)

(assert (=> b!123344 m!187869))

(declare-fun m!187871 () Bool)

(assert (=> d!39880 m!187871))

(assert (=> d!39598 d!39880))

(declare-fun d!39882 () Bool)

(assert (=> d!39882 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!2459 (buf!2899 thiss!1305))) ((_ sign_extend 32) (currentByte!5596 thiss!1305)) ((_ sign_extend 32) (currentBit!5591 thiss!1305))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2459 (buf!2899 thiss!1305))) ((_ sign_extend 32) (currentByte!5596 thiss!1305)) ((_ sign_extend 32) (currentBit!5591 thiss!1305))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!9636 () Bool)

(assert (= bs!9636 d!39882))

(assert (=> bs!9636 m!186717))

(assert (=> d!39598 d!39882))

(assert (=> d!39594 d!39478))

(declare-fun d!39884 () Bool)

(declare-fun lt!194748 () tuple2!10408)

(assert (=> d!39884 (= lt!194748 (readBit!0 lt!193854))))

(assert (=> d!39884 (= (readBitPure!0 lt!193854) (tuple2!10399 (_2!5469 lt!194748) (_1!5469 lt!194748)))))

(declare-fun bs!9637 () Bool)

(assert (= bs!9637 d!39884))

(declare-fun m!187873 () Bool)

(assert (=> bs!9637 m!187873))

(assert (=> d!39594 d!39884))

(declare-fun d!39886 () Bool)

(assert (=> d!39886 (= (invariant!0 (currentBit!5591 lt!193300) (currentByte!5596 lt!193300) (size!2459 (buf!2899 (_2!5461 lt!193308)))) (and (bvsge (currentBit!5591 lt!193300) #b00000000000000000000000000000000) (bvslt (currentBit!5591 lt!193300) #b00000000000000000000000000001000) (bvsge (currentByte!5596 lt!193300) #b00000000000000000000000000000000) (or (bvslt (currentByte!5596 lt!193300) (size!2459 (buf!2899 (_2!5461 lt!193308)))) (and (= (currentBit!5591 lt!193300) #b00000000000000000000000000000000) (= (currentByte!5596 lt!193300) (size!2459 (buf!2899 (_2!5461 lt!193308))))))))))

(assert (=> d!39594 d!39886))

(declare-fun d!39888 () Bool)

(declare-fun e!80840 () Bool)

(assert (=> d!39888 e!80840))

(declare-fun res!102256 () Bool)

(assert (=> d!39888 (=> (not res!102256) (not e!80840))))

(declare-fun lt!194755 () tuple2!10398)

(declare-fun lt!194756 () tuple2!10398)

(assert (=> d!39888 (= res!102256 (= (bitIndex!0 (size!2459 (buf!2899 (_1!5464 lt!194755))) (currentByte!5596 (_1!5464 lt!194755)) (currentBit!5591 (_1!5464 lt!194755))) (bitIndex!0 (size!2459 (buf!2899 (_1!5464 lt!194756))) (currentByte!5596 (_1!5464 lt!194756)) (currentBit!5591 (_1!5464 lt!194756)))))))

(declare-fun lt!194757 () BitStream!4392)

(assert (=> d!39888 (= lt!194756 (readBitPure!0 lt!194757))))

(assert (=> d!39888 (= lt!194755 (readBitPure!0 lt!193300))))

(assert (=> d!39888 (= lt!194757 (BitStream!4393 (buf!2899 (_2!5461 lt!193308)) (currentByte!5596 lt!193300) (currentBit!5591 lt!193300)))))

(assert (=> d!39888 (invariant!0 (currentBit!5591 lt!193300) (currentByte!5596 lt!193300) (size!2459 (buf!2899 (_2!5461 lt!193308))))))

(assert (=> d!39888 true))

(declare-fun _$9!60 () Unit!7557)

(assert (=> d!39888 (= (choose!50 lt!193300 (_2!5461 lt!193308) lt!193854 lt!193855 (tuple2!10399 (_1!5464 lt!193855) (_2!5464 lt!193855)) (_1!5464 lt!193855) (_2!5464 lt!193855) lt!193853 (tuple2!10399 (_1!5464 lt!193853) (_2!5464 lt!193853)) (_1!5464 lt!193853) (_2!5464 lt!193853)) _$9!60)))

(declare-fun b!123350 () Bool)

(assert (=> b!123350 (= e!80840 (= (_2!5464 lt!194755) (_2!5464 lt!194756)))))

(assert (= (and d!39888 res!102256) b!123350))

(assert (=> d!39888 m!186625))

(declare-fun m!187875 () Bool)

(assert (=> d!39888 m!187875))

(declare-fun m!187877 () Bool)

(assert (=> d!39888 m!187877))

(assert (=> d!39888 m!187035))

(declare-fun m!187879 () Bool)

(assert (=> d!39888 m!187879))

(assert (=> d!39594 d!39888))

(declare-fun d!39890 () Bool)

(declare-fun e!80841 () Bool)

(assert (=> d!39890 e!80841))

(declare-fun res!102258 () Bool)

(assert (=> d!39890 (=> (not res!102258) (not e!80841))))

(declare-fun lt!194762 () (_ BitVec 64))

(declare-fun lt!194758 () (_ BitVec 64))

(declare-fun lt!194761 () (_ BitVec 64))

(assert (=> d!39890 (= res!102258 (= lt!194758 (bvsub lt!194762 lt!194761)))))

(assert (=> d!39890 (or (= (bvand lt!194762 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!194761 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!194762 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!194762 lt!194761) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39890 (= lt!194761 (remainingBits!0 ((_ sign_extend 32) (size!2459 (buf!2899 (_1!5464 lt!193855)))) ((_ sign_extend 32) (currentByte!5596 (_1!5464 lt!193855))) ((_ sign_extend 32) (currentBit!5591 (_1!5464 lt!193855)))))))

(declare-fun lt!194763 () (_ BitVec 64))

(declare-fun lt!194760 () (_ BitVec 64))

(assert (=> d!39890 (= lt!194762 (bvmul lt!194763 lt!194760))))

(assert (=> d!39890 (or (= lt!194763 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!194760 (bvsdiv (bvmul lt!194763 lt!194760) lt!194763)))))

(assert (=> d!39890 (= lt!194760 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!39890 (= lt!194763 ((_ sign_extend 32) (size!2459 (buf!2899 (_1!5464 lt!193855)))))))

(assert (=> d!39890 (= lt!194758 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5596 (_1!5464 lt!193855))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5591 (_1!5464 lt!193855)))))))

(assert (=> d!39890 (invariant!0 (currentBit!5591 (_1!5464 lt!193855)) (currentByte!5596 (_1!5464 lt!193855)) (size!2459 (buf!2899 (_1!5464 lt!193855))))))

(assert (=> d!39890 (= (bitIndex!0 (size!2459 (buf!2899 (_1!5464 lt!193855))) (currentByte!5596 (_1!5464 lt!193855)) (currentBit!5591 (_1!5464 lt!193855))) lt!194758)))

(declare-fun b!123351 () Bool)

(declare-fun res!102257 () Bool)

(assert (=> b!123351 (=> (not res!102257) (not e!80841))))

(assert (=> b!123351 (= res!102257 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!194758))))

(declare-fun b!123352 () Bool)

(declare-fun lt!194759 () (_ BitVec 64))

(assert (=> b!123352 (= e!80841 (bvsle lt!194758 (bvmul lt!194759 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123352 (or (= lt!194759 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!194759 #b0000000000000000000000000000000000000000000000000000000000001000) lt!194759)))))

(assert (=> b!123352 (= lt!194759 ((_ sign_extend 32) (size!2459 (buf!2899 (_1!5464 lt!193855)))))))

(assert (= (and d!39890 res!102258) b!123351))

(assert (= (and b!123351 res!102257) b!123352))

(declare-fun m!187881 () Bool)

(assert (=> d!39890 m!187881))

(declare-fun m!187883 () Bool)

(assert (=> d!39890 m!187883))

(assert (=> d!39594 d!39890))

(declare-fun d!39892 () Bool)

(declare-fun e!80842 () Bool)

(assert (=> d!39892 e!80842))

(declare-fun res!102260 () Bool)

(assert (=> d!39892 (=> (not res!102260) (not e!80842))))

(declare-fun lt!194764 () (_ BitVec 64))

(declare-fun lt!194768 () (_ BitVec 64))

(declare-fun lt!194767 () (_ BitVec 64))

(assert (=> d!39892 (= res!102260 (= lt!194764 (bvsub lt!194768 lt!194767)))))

(assert (=> d!39892 (or (= (bvand lt!194768 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!194767 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!194768 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!194768 lt!194767) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39892 (= lt!194767 (remainingBits!0 ((_ sign_extend 32) (size!2459 (buf!2899 (_1!5464 lt!193853)))) ((_ sign_extend 32) (currentByte!5596 (_1!5464 lt!193853))) ((_ sign_extend 32) (currentBit!5591 (_1!5464 lt!193853)))))))

(declare-fun lt!194769 () (_ BitVec 64))

(declare-fun lt!194766 () (_ BitVec 64))

(assert (=> d!39892 (= lt!194768 (bvmul lt!194769 lt!194766))))

(assert (=> d!39892 (or (= lt!194769 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!194766 (bvsdiv (bvmul lt!194769 lt!194766) lt!194769)))))

(assert (=> d!39892 (= lt!194766 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!39892 (= lt!194769 ((_ sign_extend 32) (size!2459 (buf!2899 (_1!5464 lt!193853)))))))

(assert (=> d!39892 (= lt!194764 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5596 (_1!5464 lt!193853))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5591 (_1!5464 lt!193853)))))))

(assert (=> d!39892 (invariant!0 (currentBit!5591 (_1!5464 lt!193853)) (currentByte!5596 (_1!5464 lt!193853)) (size!2459 (buf!2899 (_1!5464 lt!193853))))))

(assert (=> d!39892 (= (bitIndex!0 (size!2459 (buf!2899 (_1!5464 lt!193853))) (currentByte!5596 (_1!5464 lt!193853)) (currentBit!5591 (_1!5464 lt!193853))) lt!194764)))

(declare-fun b!123353 () Bool)

(declare-fun res!102259 () Bool)

(assert (=> b!123353 (=> (not res!102259) (not e!80842))))

(assert (=> b!123353 (= res!102259 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!194764))))

(declare-fun b!123354 () Bool)

(declare-fun lt!194765 () (_ BitVec 64))

(assert (=> b!123354 (= e!80842 (bvsle lt!194764 (bvmul lt!194765 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123354 (or (= lt!194765 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!194765 #b0000000000000000000000000000000000000000000000000000000000001000) lt!194765)))))

(assert (=> b!123354 (= lt!194765 ((_ sign_extend 32) (size!2459 (buf!2899 (_1!5464 lt!193853)))))))

(assert (= (and d!39892 res!102260) b!123353))

(assert (= (and b!123353 res!102259) b!123354))

(declare-fun m!187885 () Bool)

(assert (=> d!39892 m!187885))

(declare-fun m!187887 () Bool)

(assert (=> d!39892 m!187887))

(assert (=> d!39594 d!39892))

(assert (=> b!122854 d!39464))

(assert (=> b!122854 d!39462))

(declare-fun d!39894 () Bool)

(assert (=> d!39894 (validate_offset_bits!1 ((_ sign_extend 32) (size!2459 (buf!2899 (_2!5461 lt!193842)))) ((_ sign_extend 32) (currentByte!5596 (_2!5461 lt!193323))) ((_ sign_extend 32) (currentBit!5591 (_2!5461 lt!193323))) lt!193799)))

(declare-fun lt!194770 () Unit!7557)

(assert (=> d!39894 (= lt!194770 (choose!9 (_2!5461 lt!193323) (buf!2899 (_2!5461 lt!193842)) lt!193799 (BitStream!4393 (buf!2899 (_2!5461 lt!193842)) (currentByte!5596 (_2!5461 lt!193323)) (currentBit!5591 (_2!5461 lt!193323)))))))

(assert (=> d!39894 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5461 lt!193323) (buf!2899 (_2!5461 lt!193842)) lt!193799) lt!194770)))

(declare-fun bs!9638 () Bool)

(assert (= bs!9638 d!39894))

(assert (=> bs!9638 m!187017))

(declare-fun m!187889 () Bool)

(assert (=> bs!9638 m!187889))

(assert (=> b!122980 d!39894))

(declare-fun e!80843 () Bool)

(declare-fun lt!194781 () (_ BitVec 64))

(declare-fun lt!194780 () tuple2!10396)

(declare-fun b!123355 () Bool)

(declare-fun lt!194786 () (_ BitVec 64))

(assert (=> b!123355 (= e!80843 (= (_1!5463 lt!194780) (withMovedBitIndex!0 (_2!5463 lt!194780) (bvsub lt!194781 lt!194786))))))

(assert (=> b!123355 (or (= (bvand lt!194781 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!194786 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!194781 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!194781 lt!194786) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!123355 (= lt!194786 (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193842))) (currentByte!5596 (_2!5461 lt!193842)) (currentBit!5591 (_2!5461 lt!193842))))))

(assert (=> b!123355 (= lt!194781 (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193323))) (currentByte!5596 (_2!5461 lt!193323)) (currentBit!5591 (_2!5461 lt!193323))))))

(declare-fun b!123357 () Bool)

(declare-fun res!102263 () Bool)

(assert (=> b!123357 (=> (not res!102263) (not e!80843))))

(assert (=> b!123357 (= res!102263 (isPrefixOf!0 (_1!5463 lt!194780) (_2!5461 lt!193323)))))

(declare-fun b!123358 () Bool)

(declare-fun res!102262 () Bool)

(assert (=> b!123358 (=> (not res!102262) (not e!80843))))

(assert (=> b!123358 (= res!102262 (isPrefixOf!0 (_2!5463 lt!194780) (_2!5461 lt!193842)))))

(declare-fun b!123359 () Bool)

(declare-fun e!80844 () Unit!7557)

(declare-fun Unit!7611 () Unit!7557)

(assert (=> b!123359 (= e!80844 Unit!7611)))

(declare-fun b!123356 () Bool)

(declare-fun lt!194788 () Unit!7557)

(assert (=> b!123356 (= e!80844 lt!194788)))

(declare-fun lt!194776 () (_ BitVec 64))

(assert (=> b!123356 (= lt!194776 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!194777 () (_ BitVec 64))

(assert (=> b!123356 (= lt!194777 (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193323))) (currentByte!5596 (_2!5461 lt!193323)) (currentBit!5591 (_2!5461 lt!193323))))))

(assert (=> b!123356 (= lt!194788 (arrayBitRangesEqSymmetric!0 (buf!2899 (_2!5461 lt!193323)) (buf!2899 (_2!5461 lt!193842)) lt!194776 lt!194777))))

(assert (=> b!123356 (arrayBitRangesEq!0 (buf!2899 (_2!5461 lt!193842)) (buf!2899 (_2!5461 lt!193323)) lt!194776 lt!194777)))

(declare-fun d!39896 () Bool)

(assert (=> d!39896 e!80843))

(declare-fun res!102261 () Bool)

(assert (=> d!39896 (=> (not res!102261) (not e!80843))))

(assert (=> d!39896 (= res!102261 (isPrefixOf!0 (_1!5463 lt!194780) (_2!5463 lt!194780)))))

(declare-fun lt!194787 () BitStream!4392)

(assert (=> d!39896 (= lt!194780 (tuple2!10397 lt!194787 (_2!5461 lt!193842)))))

(declare-fun lt!194790 () Unit!7557)

(declare-fun lt!194772 () Unit!7557)

(assert (=> d!39896 (= lt!194790 lt!194772)))

(assert (=> d!39896 (isPrefixOf!0 lt!194787 (_2!5461 lt!193842))))

(assert (=> d!39896 (= lt!194772 (lemmaIsPrefixTransitive!0 lt!194787 (_2!5461 lt!193842) (_2!5461 lt!193842)))))

(declare-fun lt!194775 () Unit!7557)

(declare-fun lt!194778 () Unit!7557)

(assert (=> d!39896 (= lt!194775 lt!194778)))

(assert (=> d!39896 (isPrefixOf!0 lt!194787 (_2!5461 lt!193842))))

(assert (=> d!39896 (= lt!194778 (lemmaIsPrefixTransitive!0 lt!194787 (_2!5461 lt!193323) (_2!5461 lt!193842)))))

(declare-fun lt!194784 () Unit!7557)

(assert (=> d!39896 (= lt!194784 e!80844)))

(declare-fun c!7372 () Bool)

(assert (=> d!39896 (= c!7372 (not (= (size!2459 (buf!2899 (_2!5461 lt!193323))) #b00000000000000000000000000000000)))))

(declare-fun lt!194771 () Unit!7557)

(declare-fun lt!194785 () Unit!7557)

(assert (=> d!39896 (= lt!194771 lt!194785)))

(assert (=> d!39896 (isPrefixOf!0 (_2!5461 lt!193842) (_2!5461 lt!193842))))

(assert (=> d!39896 (= lt!194785 (lemmaIsPrefixRefl!0 (_2!5461 lt!193842)))))

(declare-fun lt!194773 () Unit!7557)

(declare-fun lt!194783 () Unit!7557)

(assert (=> d!39896 (= lt!194773 lt!194783)))

(assert (=> d!39896 (= lt!194783 (lemmaIsPrefixRefl!0 (_2!5461 lt!193842)))))

(declare-fun lt!194779 () Unit!7557)

(declare-fun lt!194789 () Unit!7557)

(assert (=> d!39896 (= lt!194779 lt!194789)))

(assert (=> d!39896 (isPrefixOf!0 lt!194787 lt!194787)))

(assert (=> d!39896 (= lt!194789 (lemmaIsPrefixRefl!0 lt!194787))))

(declare-fun lt!194774 () Unit!7557)

(declare-fun lt!194782 () Unit!7557)

(assert (=> d!39896 (= lt!194774 lt!194782)))

(assert (=> d!39896 (isPrefixOf!0 (_2!5461 lt!193323) (_2!5461 lt!193323))))

(assert (=> d!39896 (= lt!194782 (lemmaIsPrefixRefl!0 (_2!5461 lt!193323)))))

(assert (=> d!39896 (= lt!194787 (BitStream!4393 (buf!2899 (_2!5461 lt!193842)) (currentByte!5596 (_2!5461 lt!193323)) (currentBit!5591 (_2!5461 lt!193323))))))

(assert (=> d!39896 (isPrefixOf!0 (_2!5461 lt!193323) (_2!5461 lt!193842))))

(assert (=> d!39896 (= (reader!0 (_2!5461 lt!193323) (_2!5461 lt!193842)) lt!194780)))

(assert (= (and d!39896 c!7372) b!123356))

(assert (= (and d!39896 (not c!7372)) b!123359))

(assert (= (and d!39896 res!102261) b!123357))

(assert (= (and b!123357 res!102263) b!123358))

(assert (= (and b!123358 res!102262) b!123355))

(declare-fun m!187891 () Bool)

(assert (=> d!39896 m!187891))

(declare-fun m!187893 () Bool)

(assert (=> d!39896 m!187893))

(declare-fun m!187895 () Bool)

(assert (=> d!39896 m!187895))

(declare-fun m!187897 () Bool)

(assert (=> d!39896 m!187897))

(declare-fun m!187899 () Bool)

(assert (=> d!39896 m!187899))

(assert (=> d!39896 m!187065))

(declare-fun m!187901 () Bool)

(assert (=> d!39896 m!187901))

(assert (=> d!39896 m!187069))

(declare-fun m!187903 () Bool)

(assert (=> d!39896 m!187903))

(declare-fun m!187905 () Bool)

(assert (=> d!39896 m!187905))

(assert (=> d!39896 m!186957))

(declare-fun m!187907 () Bool)

(assert (=> b!123355 m!187907))

(assert (=> b!123355 m!186943))

(assert (=> b!123355 m!186565))

(declare-fun m!187909 () Bool)

(assert (=> b!123357 m!187909))

(declare-fun m!187911 () Bool)

(assert (=> b!123358 m!187911))

(assert (=> b!123356 m!186565))

(declare-fun m!187913 () Bool)

(assert (=> b!123356 m!187913))

(declare-fun m!187915 () Bool)

(assert (=> b!123356 m!187915))

(assert (=> b!122980 d!39896))

(assert (=> b!122980 d!39864))

(declare-fun d!39898 () Bool)

(assert (=> d!39898 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2459 (buf!2899 (_2!5461 lt!193842)))) ((_ sign_extend 32) (currentByte!5596 (_2!5461 lt!193323))) ((_ sign_extend 32) (currentBit!5591 (_2!5461 lt!193323))) lt!193799) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2459 (buf!2899 (_2!5461 lt!193842)))) ((_ sign_extend 32) (currentByte!5596 (_2!5461 lt!193323))) ((_ sign_extend 32) (currentBit!5591 (_2!5461 lt!193323)))) lt!193799))))

(declare-fun bs!9639 () Bool)

(assert (= bs!9639 d!39898))

(declare-fun m!187917 () Bool)

(assert (=> bs!9639 m!187917))

(assert (=> b!122980 d!39898))

(declare-fun lt!194791 () tuple2!10410)

(declare-fun d!39900 () Bool)

(assert (=> d!39900 (= lt!194791 (readNLeastSignificantBitsLoop!0 (_1!5463 lt!193841) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!193815))))

(assert (=> d!39900 (= (readNLeastSignificantBitsLoopPure!0 (_1!5463 lt!193841) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!193815) (tuple2!10395 (_2!5470 lt!194791) (_1!5470 lt!194791)))))

(declare-fun bs!9640 () Bool)

(assert (= bs!9640 d!39900))

(declare-fun m!187919 () Bool)

(assert (=> bs!9640 m!187919))

(assert (=> b!122980 d!39900))

(declare-fun d!39902 () Bool)

(declare-fun res!102266 () Bool)

(declare-fun e!80846 () Bool)

(assert (=> d!39902 (=> (not res!102266) (not e!80846))))

(assert (=> d!39902 (= res!102266 (= (size!2459 (buf!2899 (_2!5463 lt!193920))) (size!2459 (buf!2899 (_2!5461 lt!193308)))))))

(assert (=> d!39902 (= (isPrefixOf!0 (_2!5463 lt!193920) (_2!5461 lt!193308)) e!80846)))

(declare-fun b!123360 () Bool)

(declare-fun res!102264 () Bool)

(assert (=> b!123360 (=> (not res!102264) (not e!80846))))

(assert (=> b!123360 (= res!102264 (bvsle (bitIndex!0 (size!2459 (buf!2899 (_2!5463 lt!193920))) (currentByte!5596 (_2!5463 lt!193920)) (currentBit!5591 (_2!5463 lt!193920))) (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193308))) (currentByte!5596 (_2!5461 lt!193308)) (currentBit!5591 (_2!5461 lt!193308)))))))

(declare-fun b!123361 () Bool)

(declare-fun e!80845 () Bool)

(assert (=> b!123361 (= e!80846 e!80845)))

(declare-fun res!102265 () Bool)

(assert (=> b!123361 (=> res!102265 e!80845)))

(assert (=> b!123361 (= res!102265 (= (size!2459 (buf!2899 (_2!5463 lt!193920))) #b00000000000000000000000000000000))))

(declare-fun b!123362 () Bool)

(assert (=> b!123362 (= e!80845 (arrayBitRangesEq!0 (buf!2899 (_2!5463 lt!193920)) (buf!2899 (_2!5461 lt!193308)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2459 (buf!2899 (_2!5463 lt!193920))) (currentByte!5596 (_2!5463 lt!193920)) (currentBit!5591 (_2!5463 lt!193920)))))))

(assert (= (and d!39902 res!102266) b!123360))

(assert (= (and b!123360 res!102264) b!123361))

(assert (= (and b!123361 (not res!102265)) b!123362))

(assert (=> b!123360 m!187537))

(assert (=> b!123360 m!186577))

(assert (=> b!123362 m!187537))

(assert (=> b!123362 m!187537))

(declare-fun m!187921 () Bool)

(assert (=> b!123362 m!187921))

(assert (=> b!123018 d!39902))

(declare-fun d!39904 () Bool)

(declare-fun res!102269 () Bool)

(declare-fun e!80848 () Bool)

(assert (=> d!39904 (=> (not res!102269) (not e!80848))))

(assert (=> d!39904 (= res!102269 (= (size!2459 (buf!2899 thiss!1305)) (size!2459 (buf!2899 (_2!5461 lt!193867)))))))

(assert (=> d!39904 (= (isPrefixOf!0 thiss!1305 (_2!5461 lt!193867)) e!80848)))

(declare-fun b!123363 () Bool)

(declare-fun res!102267 () Bool)

(assert (=> b!123363 (=> (not res!102267) (not e!80848))))

(assert (=> b!123363 (= res!102267 (bvsle (bitIndex!0 (size!2459 (buf!2899 thiss!1305)) (currentByte!5596 thiss!1305) (currentBit!5591 thiss!1305)) (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193867))) (currentByte!5596 (_2!5461 lt!193867)) (currentBit!5591 (_2!5461 lt!193867)))))))

(declare-fun b!123364 () Bool)

(declare-fun e!80847 () Bool)

(assert (=> b!123364 (= e!80848 e!80847)))

(declare-fun res!102268 () Bool)

(assert (=> b!123364 (=> res!102268 e!80847)))

(assert (=> b!123364 (= res!102268 (= (size!2459 (buf!2899 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!123365 () Bool)

(assert (=> b!123365 (= e!80847 (arrayBitRangesEq!0 (buf!2899 thiss!1305) (buf!2899 (_2!5461 lt!193867)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2459 (buf!2899 thiss!1305)) (currentByte!5596 thiss!1305) (currentBit!5591 thiss!1305))))))

(assert (= (and d!39904 res!102269) b!123363))

(assert (= (and b!123363 res!102267) b!123364))

(assert (= (and b!123364 (not res!102268)) b!123365))

(assert (=> b!123363 m!186569))

(assert (=> b!123363 m!187041))

(assert (=> b!123365 m!186569))

(assert (=> b!123365 m!186569))

(declare-fun m!187923 () Bool)

(assert (=> b!123365 m!187923))

(assert (=> b!123002 d!39904))

(declare-fun b!123380 () Bool)

(declare-fun res!102280 () Bool)

(declare-fun lt!194798 () (_ BitVec 32))

(assert (=> b!123380 (= res!102280 (= lt!194798 #b00000000000000000000000000000000))))

(declare-fun e!80864 () Bool)

(assert (=> b!123380 (=> res!102280 e!80864)))

(declare-fun e!80863 () Bool)

(assert (=> b!123380 (= e!80863 e!80864)))

(declare-fun bm!1608 () Bool)

(declare-fun call!1611 () Bool)

(declare-fun lt!194799 () (_ BitVec 32))

(declare-fun c!7375 () Bool)

(declare-datatypes ((tuple4!88 0))(
  ( (tuple4!89 (_1!5475 (_ BitVec 32)) (_2!5475 (_ BitVec 32)) (_3!265 (_ BitVec 32)) (_4!44 (_ BitVec 32))) )
))
(declare-fun lt!194800 () tuple4!88)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!1608 (= call!1611 (byteRangesEq!0 (ite c!7375 (select (arr!3052 (buf!2899 thiss!1305)) (_3!265 lt!194800)) (select (arr!3052 (buf!2899 thiss!1305)) (_4!44 lt!194800))) (ite c!7375 (select (arr!3052 (buf!2899 (_2!5461 lt!193323))) (_3!265 lt!194800)) (select (arr!3052 (buf!2899 (_2!5461 lt!193323))) (_4!44 lt!194800))) (ite c!7375 lt!194799 #b00000000000000000000000000000000) lt!194798))))

(declare-fun b!123381 () Bool)

(declare-fun e!80865 () Bool)

(declare-fun e!80861 () Bool)

(assert (=> b!123381 (= e!80865 e!80861)))

(assert (=> b!123381 (= c!7375 (= (_3!265 lt!194800) (_4!44 lt!194800)))))

(declare-fun b!123382 () Bool)

(assert (=> b!123382 (= e!80861 call!1611)))

(declare-fun d!39906 () Bool)

(declare-fun res!102283 () Bool)

(declare-fun e!80866 () Bool)

(assert (=> d!39906 (=> res!102283 e!80866)))

(assert (=> d!39906 (= res!102283 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2459 (buf!2899 thiss!1305)) (currentByte!5596 thiss!1305) (currentBit!5591 thiss!1305))))))

(assert (=> d!39906 (= (arrayBitRangesEq!0 (buf!2899 thiss!1305) (buf!2899 (_2!5461 lt!193323)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2459 (buf!2899 thiss!1305)) (currentByte!5596 thiss!1305) (currentBit!5591 thiss!1305))) e!80866)))

(declare-fun e!80862 () Bool)

(declare-fun b!123383 () Bool)

(declare-fun arrayRangesEq!45 (array!5434 array!5434 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!123383 (= e!80862 (arrayRangesEq!45 (buf!2899 thiss!1305) (buf!2899 (_2!5461 lt!193323)) (_1!5475 lt!194800) (_2!5475 lt!194800)))))

(declare-fun b!123384 () Bool)

(assert (=> b!123384 (= e!80866 e!80865)))

(declare-fun res!102284 () Bool)

(assert (=> b!123384 (=> (not res!102284) (not e!80865))))

(assert (=> b!123384 (= res!102284 e!80862)))

(declare-fun res!102282 () Bool)

(assert (=> b!123384 (=> res!102282 e!80862)))

(assert (=> b!123384 (= res!102282 (bvsge (_1!5475 lt!194800) (_2!5475 lt!194800)))))

(assert (=> b!123384 (= lt!194798 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!2459 (buf!2899 thiss!1305)) (currentByte!5596 thiss!1305) (currentBit!5591 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123384 (= lt!194799 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!88)

(assert (=> b!123384 (= lt!194800 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2459 (buf!2899 thiss!1305)) (currentByte!5596 thiss!1305) (currentBit!5591 thiss!1305))))))

(declare-fun b!123385 () Bool)

(assert (=> b!123385 (= e!80861 e!80863)))

(declare-fun res!102281 () Bool)

(assert (=> b!123385 (= res!102281 (byteRangesEq!0 (select (arr!3052 (buf!2899 thiss!1305)) (_3!265 lt!194800)) (select (arr!3052 (buf!2899 (_2!5461 lt!193323))) (_3!265 lt!194800)) lt!194799 #b00000000000000000000000000001000))))

(assert (=> b!123385 (=> (not res!102281) (not e!80863))))

(declare-fun b!123386 () Bool)

(assert (=> b!123386 (= e!80864 call!1611)))

(assert (= (and d!39906 (not res!102283)) b!123384))

(assert (= (and b!123384 (not res!102282)) b!123383))

(assert (= (and b!123384 res!102284) b!123381))

(assert (= (and b!123381 c!7375) b!123382))

(assert (= (and b!123381 (not c!7375)) b!123385))

(assert (= (and b!123385 res!102281) b!123380))

(assert (= (and b!123380 (not res!102280)) b!123386))

(assert (= (or b!123382 b!123386) bm!1608))

(declare-fun m!187925 () Bool)

(assert (=> bm!1608 m!187925))

(declare-fun m!187927 () Bool)

(assert (=> bm!1608 m!187927))

(declare-fun m!187929 () Bool)

(assert (=> bm!1608 m!187929))

(declare-fun m!187931 () Bool)

(assert (=> bm!1608 m!187931))

(declare-fun m!187933 () Bool)

(assert (=> bm!1608 m!187933))

(declare-fun m!187935 () Bool)

(assert (=> b!123383 m!187935))

(assert (=> b!123384 m!186569))

(declare-fun m!187937 () Bool)

(assert (=> b!123384 m!187937))

(assert (=> b!123385 m!187929))

(assert (=> b!123385 m!187927))

(assert (=> b!123385 m!187929))

(assert (=> b!123385 m!187927))

(declare-fun m!187939 () Bool)

(assert (=> b!123385 m!187939))

(assert (=> b!122856 d!39906))

(assert (=> b!122856 d!39464))

(assert (=> b!122859 d!39634))

(declare-fun d!39908 () Bool)

(declare-fun e!80869 () Bool)

(assert (=> d!39908 e!80869))

(declare-fun res!102285 () Bool)

(assert (=> d!39908 (=> (not res!102285) (not e!80869))))

(declare-fun lt!194809 () tuple2!10410)

(assert (=> d!39908 (= res!102285 (= (buf!2899 (_2!5470 lt!194809)) (buf!2899 (_1!5463 lt!193304))))))

(declare-fun e!80868 () tuple2!10410)

(assert (=> d!39908 (= lt!194809 e!80868)))

(declare-fun c!7376 () Bool)

(assert (=> d!39908 (= c!7376 (= nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> d!39908 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!39908 (= (readNLeastSignificantBitsLoop!0 (_1!5463 lt!193304) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!193302) lt!194809)))

(declare-fun b!123387 () Bool)

(assert (=> b!123387 (= e!80868 (tuple2!10411 lt!193302 (_1!5463 lt!193304)))))

(declare-fun b!123388 () Bool)

(declare-fun e!80867 () Bool)

(declare-fun lt!194808 () (_ BitVec 64))

(assert (=> b!123388 (= e!80867 (= (= (bvand (bvlshr (_1!5470 lt!194809) lt!194808) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!5464 (readBitPure!0 (_1!5463 lt!193304)))))))

(assert (=> b!123388 (and (bvsge lt!194808 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!194808 #b0000000000000000000000000000000000000000000000000000000001000000))))

(declare-fun lt!194803 () (_ BitVec 32))

(assert (=> b!123388 (= lt!194808 ((_ sign_extend 32) (bvsub lt!194803 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!123388 (or (= (bvand lt!194803 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand lt!194803 #b10000000000000000000000000000000) (bvand (bvsub lt!194803 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!123388 (= lt!194803 (bvsub nBits!396 #b00000000000000000000000000000001))))

(assert (=> b!123388 (or (= (bvand nBits!396 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))

(declare-fun b!123389 () Bool)

(declare-fun lt!194804 () tuple2!10410)

(assert (=> b!123389 (= e!80868 (tuple2!10411 (_1!5470 lt!194804) (_2!5470 lt!194804)))))

(declare-fun lt!194801 () tuple2!10408)

(assert (=> b!123389 (= lt!194801 (readBit!0 (_1!5463 lt!193304)))))

(assert (=> b!123389 (= lt!194804 (readNLeastSignificantBitsLoop!0 (_2!5469 lt!194801) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!193302 (ite (_1!5469 lt!194801) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!123390 () Bool)

(declare-fun res!102286 () Bool)

(assert (=> b!123390 (=> (not res!102286) (not e!80869))))

(declare-fun lt!194805 () (_ BitVec 64))

(declare-fun lt!194806 () (_ BitVec 64))

(assert (=> b!123390 (= res!102286 (= (bitIndex!0 (size!2459 (buf!2899 (_2!5470 lt!194809))) (currentByte!5596 (_2!5470 lt!194809)) (currentBit!5591 (_2!5470 lt!194809))) (bvadd lt!194805 lt!194806)))))

(assert (=> b!123390 (or (not (= (bvand lt!194805 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!194806 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!194805 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!194805 lt!194806) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!123390 (= lt!194806 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!123390 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!123390 (= lt!194805 (bitIndex!0 (size!2459 (buf!2899 (_1!5463 lt!193304))) (currentByte!5596 (_1!5463 lt!193304)) (currentBit!5591 (_1!5463 lt!193304))))))

(declare-fun b!123391 () Bool)

(declare-fun res!102288 () Bool)

(assert (=> b!123391 (=> (not res!102288) (not e!80869))))

(assert (=> b!123391 (= res!102288 (= (bvand (_1!5470 lt!194809) (onesLSBLong!0 nBits!396)) (_1!5470 lt!194809)))))

(declare-fun b!123392 () Bool)

(declare-fun res!102287 () Bool)

(assert (=> b!123392 (=> (not res!102287) (not e!80869))))

(declare-fun lt!194807 () (_ BitVec 64))

(declare-fun lt!194802 () (_ BitVec 64))

(assert (=> b!123392 (= res!102287 (= (bvlshr (_1!5470 lt!194809) lt!194807) (bvlshr lt!193302 lt!194802)))))

(assert (=> b!123392 (and (bvsge lt!194802 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!194802 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!123392 (= lt!194802 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!123392 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!123392 (and (bvsge lt!194807 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!194807 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!123392 (= lt!194807 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!123392 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(declare-fun b!123393 () Bool)

(assert (=> b!123393 (= e!80869 e!80867)))

(declare-fun res!102289 () Bool)

(assert (=> b!123393 (=> res!102289 e!80867)))

(assert (=> b!123393 (= res!102289 (bvsge (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (= (and d!39908 c!7376) b!123387))

(assert (= (and d!39908 (not c!7376)) b!123389))

(assert (= (and d!39908 res!102285) b!123390))

(assert (= (and b!123390 res!102286) b!123392))

(assert (= (and b!123392 res!102287) b!123391))

(assert (= (and b!123391 res!102288) b!123393))

(assert (= (and b!123393 (not res!102289)) b!123388))

(declare-fun m!187941 () Bool)

(assert (=> b!123388 m!187941))

(declare-fun m!187943 () Bool)

(assert (=> b!123389 m!187943))

(declare-fun m!187945 () Bool)

(assert (=> b!123389 m!187945))

(declare-fun m!187947 () Bool)

(assert (=> b!123390 m!187947))

(declare-fun m!187949 () Bool)

(assert (=> b!123390 m!187949))

(assert (=> b!123391 m!186637))

(assert (=> d!39608 d!39908))

(declare-fun d!39910 () Bool)

(declare-fun e!80870 () Bool)

(assert (=> d!39910 e!80870))

(declare-fun res!102290 () Bool)

(assert (=> d!39910 (=> (not res!102290) (not e!80870))))

(assert (=> d!39910 (= res!102290 (= (buf!2899 (_2!5461 (increaseBitIndex!0 lt!193300))) (buf!2899 lt!193300)))))

(declare-fun lt!194815 () Bool)

(assert (=> d!39910 (= lt!194815 (not (= (bvand ((_ sign_extend 24) (select (arr!3052 (buf!2899 lt!193300)) (currentByte!5596 lt!193300))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5591 lt!193300)))) #b00000000000000000000000000000000)))))

(declare-fun lt!194811 () tuple2!10408)

(assert (=> d!39910 (= lt!194811 (tuple2!10409 (not (= (bvand ((_ sign_extend 24) (select (arr!3052 (buf!2899 lt!193300)) (currentByte!5596 lt!193300))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5591 lt!193300)))) #b00000000000000000000000000000000)) (_2!5461 (increaseBitIndex!0 lt!193300))))))

(assert (=> d!39910 (validate_offset_bit!0 ((_ sign_extend 32) (size!2459 (buf!2899 lt!193300))) ((_ sign_extend 32) (currentByte!5596 lt!193300)) ((_ sign_extend 32) (currentBit!5591 lt!193300)))))

(assert (=> d!39910 (= (readBit!0 lt!193300) lt!194811)))

(declare-fun lt!194816 () (_ BitVec 64))

(declare-fun lt!194810 () (_ BitVec 64))

(declare-fun b!123394 () Bool)

(assert (=> b!123394 (= e!80870 (= (bitIndex!0 (size!2459 (buf!2899 (_2!5461 (increaseBitIndex!0 lt!193300)))) (currentByte!5596 (_2!5461 (increaseBitIndex!0 lt!193300))) (currentBit!5591 (_2!5461 (increaseBitIndex!0 lt!193300)))) (bvadd lt!194816 lt!194810)))))

(assert (=> b!123394 (or (not (= (bvand lt!194816 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!194810 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!194816 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!194816 lt!194810) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!123394 (= lt!194810 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!123394 (= lt!194816 (bitIndex!0 (size!2459 (buf!2899 lt!193300)) (currentByte!5596 lt!193300) (currentBit!5591 lt!193300)))))

(declare-fun lt!194814 () Bool)

(assert (=> b!123394 (= lt!194814 (not (= (bvand ((_ sign_extend 24) (select (arr!3052 (buf!2899 lt!193300)) (currentByte!5596 lt!193300))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5591 lt!193300)))) #b00000000000000000000000000000000)))))

(declare-fun lt!194813 () Bool)

(assert (=> b!123394 (= lt!194813 (not (= (bvand ((_ sign_extend 24) (select (arr!3052 (buf!2899 lt!193300)) (currentByte!5596 lt!193300))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5591 lt!193300)))) #b00000000000000000000000000000000)))))

(declare-fun lt!194812 () Bool)

(assert (=> b!123394 (= lt!194812 (not (= (bvand ((_ sign_extend 24) (select (arr!3052 (buf!2899 lt!193300)) (currentByte!5596 lt!193300))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5591 lt!193300)))) #b00000000000000000000000000000000)))))

(assert (= (and d!39910 res!102290) b!123394))

(declare-fun m!187951 () Bool)

(assert (=> d!39910 m!187951))

(declare-fun m!187953 () Bool)

(assert (=> d!39910 m!187953))

(declare-fun m!187955 () Bool)

(assert (=> d!39910 m!187955))

(declare-fun m!187957 () Bool)

(assert (=> d!39910 m!187957))

(declare-fun m!187959 () Bool)

(assert (=> b!123394 m!187959))

(assert (=> b!123394 m!187951))

(assert (=> b!123394 m!187953))

(declare-fun m!187961 () Bool)

(assert (=> b!123394 m!187961))

(assert (=> b!123394 m!187955))

(assert (=> d!39478 d!39910))

(assert (=> b!123016 d!39462))

(declare-fun d!39912 () Bool)

(assert (=> d!39912 (arrayBitRangesEq!0 (buf!2899 (_2!5461 lt!193308)) (buf!2899 (_2!5461 lt!193323)) lt!193916 lt!193917)))

(declare-fun lt!194819 () Unit!7557)

(declare-fun choose!8 (array!5434 array!5434 (_ BitVec 64) (_ BitVec 64)) Unit!7557)

(assert (=> d!39912 (= lt!194819 (choose!8 (buf!2899 (_2!5461 lt!193323)) (buf!2899 (_2!5461 lt!193308)) lt!193916 lt!193917))))

(assert (=> d!39912 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!193916) (bvsle lt!193916 lt!193917))))

(assert (=> d!39912 (= (arrayBitRangesEqSymmetric!0 (buf!2899 (_2!5461 lt!193323)) (buf!2899 (_2!5461 lt!193308)) lt!193916 lt!193917) lt!194819)))

(declare-fun bs!9641 () Bool)

(assert (= bs!9641 d!39912))

(assert (=> bs!9641 m!187085))

(declare-fun m!187963 () Bool)

(assert (=> bs!9641 m!187963))

(assert (=> b!123016 d!39912))

(declare-fun b!123395 () Bool)

(declare-fun res!102291 () Bool)

(declare-fun lt!194820 () (_ BitVec 32))

(assert (=> b!123395 (= res!102291 (= lt!194820 #b00000000000000000000000000000000))))

(declare-fun e!80874 () Bool)

(assert (=> b!123395 (=> res!102291 e!80874)))

(declare-fun e!80873 () Bool)

(assert (=> b!123395 (= e!80873 e!80874)))

(declare-fun lt!194822 () tuple4!88)

(declare-fun bm!1609 () Bool)

(declare-fun call!1612 () Bool)

(declare-fun c!7377 () Bool)

(declare-fun lt!194821 () (_ BitVec 32))

(assert (=> bm!1609 (= call!1612 (byteRangesEq!0 (ite c!7377 (select (arr!3052 (buf!2899 (_2!5461 lt!193308))) (_3!265 lt!194822)) (select (arr!3052 (buf!2899 (_2!5461 lt!193308))) (_4!44 lt!194822))) (ite c!7377 (select (arr!3052 (buf!2899 (_2!5461 lt!193323))) (_3!265 lt!194822)) (select (arr!3052 (buf!2899 (_2!5461 lt!193323))) (_4!44 lt!194822))) (ite c!7377 lt!194821 #b00000000000000000000000000000000) lt!194820))))

(declare-fun b!123396 () Bool)

(declare-fun e!80875 () Bool)

(declare-fun e!80871 () Bool)

(assert (=> b!123396 (= e!80875 e!80871)))

(assert (=> b!123396 (= c!7377 (= (_3!265 lt!194822) (_4!44 lt!194822)))))

(declare-fun b!123397 () Bool)

(assert (=> b!123397 (= e!80871 call!1612)))

(declare-fun d!39914 () Bool)

(declare-fun res!102294 () Bool)

(declare-fun e!80876 () Bool)

(assert (=> d!39914 (=> res!102294 e!80876)))

(assert (=> d!39914 (= res!102294 (bvsge lt!193916 lt!193917))))

(assert (=> d!39914 (= (arrayBitRangesEq!0 (buf!2899 (_2!5461 lt!193308)) (buf!2899 (_2!5461 lt!193323)) lt!193916 lt!193917) e!80876)))

(declare-fun e!80872 () Bool)

(declare-fun b!123398 () Bool)

(assert (=> b!123398 (= e!80872 (arrayRangesEq!45 (buf!2899 (_2!5461 lt!193308)) (buf!2899 (_2!5461 lt!193323)) (_1!5475 lt!194822) (_2!5475 lt!194822)))))

(declare-fun b!123399 () Bool)

(assert (=> b!123399 (= e!80876 e!80875)))

(declare-fun res!102295 () Bool)

(assert (=> b!123399 (=> (not res!102295) (not e!80875))))

(assert (=> b!123399 (= res!102295 e!80872)))

(declare-fun res!102293 () Bool)

(assert (=> b!123399 (=> res!102293 e!80872)))

(assert (=> b!123399 (= res!102293 (bvsge (_1!5475 lt!194822) (_2!5475 lt!194822)))))

(assert (=> b!123399 (= lt!194820 ((_ extract 31 0) (bvsrem lt!193917 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123399 (= lt!194821 ((_ extract 31 0) (bvsrem lt!193916 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123399 (= lt!194822 (arrayBitIndices!0 lt!193916 lt!193917))))

(declare-fun b!123400 () Bool)

(assert (=> b!123400 (= e!80871 e!80873)))

(declare-fun res!102292 () Bool)

(assert (=> b!123400 (= res!102292 (byteRangesEq!0 (select (arr!3052 (buf!2899 (_2!5461 lt!193308))) (_3!265 lt!194822)) (select (arr!3052 (buf!2899 (_2!5461 lt!193323))) (_3!265 lt!194822)) lt!194821 #b00000000000000000000000000001000))))

(assert (=> b!123400 (=> (not res!102292) (not e!80873))))

(declare-fun b!123401 () Bool)

(assert (=> b!123401 (= e!80874 call!1612)))

(assert (= (and d!39914 (not res!102294)) b!123399))

(assert (= (and b!123399 (not res!102293)) b!123398))

(assert (= (and b!123399 res!102295) b!123396))

(assert (= (and b!123396 c!7377) b!123397))

(assert (= (and b!123396 (not c!7377)) b!123400))

(assert (= (and b!123400 res!102292) b!123395))

(assert (= (and b!123395 (not res!102291)) b!123401))

(assert (= (or b!123397 b!123401) bm!1609))

(declare-fun m!187965 () Bool)

(assert (=> bm!1609 m!187965))

(declare-fun m!187967 () Bool)

(assert (=> bm!1609 m!187967))

(declare-fun m!187969 () Bool)

(assert (=> bm!1609 m!187969))

(declare-fun m!187971 () Bool)

(assert (=> bm!1609 m!187971))

(declare-fun m!187973 () Bool)

(assert (=> bm!1609 m!187973))

(declare-fun m!187975 () Bool)

(assert (=> b!123398 m!187975))

(declare-fun m!187977 () Bool)

(assert (=> b!123399 m!187977))

(assert (=> b!123400 m!187969))

(assert (=> b!123400 m!187967))

(assert (=> b!123400 m!187969))

(assert (=> b!123400 m!187967))

(declare-fun m!187979 () Bool)

(assert (=> b!123400 m!187979))

(assert (=> b!123016 d!39914))

(assert (=> b!122986 d!39464))

(assert (=> b!122986 d!39626))

(declare-fun d!39916 () Bool)

(declare-fun res!102298 () Bool)

(declare-fun e!80878 () Bool)

(assert (=> d!39916 (=> (not res!102298) (not e!80878))))

(assert (=> d!39916 (= res!102298 (= (size!2459 (buf!2899 (_2!5461 lt!193323))) (size!2459 (buf!2899 (_2!5461 lt!193842)))))))

(assert (=> d!39916 (= (isPrefixOf!0 (_2!5461 lt!193323) (_2!5461 lt!193842)) e!80878)))

(declare-fun b!123402 () Bool)

(declare-fun res!102296 () Bool)

(assert (=> b!123402 (=> (not res!102296) (not e!80878))))

(assert (=> b!123402 (= res!102296 (bvsle (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193323))) (currentByte!5596 (_2!5461 lt!193323)) (currentBit!5591 (_2!5461 lt!193323))) (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193842))) (currentByte!5596 (_2!5461 lt!193842)) (currentBit!5591 (_2!5461 lt!193842)))))))

(declare-fun b!123403 () Bool)

(declare-fun e!80877 () Bool)

(assert (=> b!123403 (= e!80878 e!80877)))

(declare-fun res!102297 () Bool)

(assert (=> b!123403 (=> res!102297 e!80877)))

(assert (=> b!123403 (= res!102297 (= (size!2459 (buf!2899 (_2!5461 lt!193323))) #b00000000000000000000000000000000))))

(declare-fun b!123404 () Bool)

(assert (=> b!123404 (= e!80877 (arrayBitRangesEq!0 (buf!2899 (_2!5461 lt!193323)) (buf!2899 (_2!5461 lt!193842)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193323))) (currentByte!5596 (_2!5461 lt!193323)) (currentBit!5591 (_2!5461 lt!193323)))))))

(assert (= (and d!39916 res!102298) b!123402))

(assert (= (and b!123402 res!102296) b!123403))

(assert (= (and b!123403 (not res!102297)) b!123404))

(assert (=> b!123402 m!186565))

(assert (=> b!123402 m!186943))

(assert (=> b!123404 m!186565))

(assert (=> b!123404 m!186565))

(declare-fun m!187981 () Bool)

(assert (=> b!123404 m!187981))

(assert (=> b!122975 d!39916))

(declare-fun d!39918 () Bool)

(assert (=> d!39918 (= (remainingBits!0 ((_ sign_extend 32) (size!2459 (buf!2899 (_2!5461 lt!193308)))) ((_ sign_extend 32) (currentByte!5596 thiss!1305)) ((_ sign_extend 32) (currentBit!5591 thiss!1305))) (bvsub (bvmul ((_ sign_extend 32) (size!2459 (buf!2899 (_2!5461 lt!193308)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5596 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5591 thiss!1305)))))))

(assert (=> d!39482 d!39918))

(declare-fun b!123405 () Bool)

(declare-fun res!102299 () Bool)

(declare-fun lt!194823 () (_ BitVec 32))

(assert (=> b!123405 (= res!102299 (= lt!194823 #b00000000000000000000000000000000))))

(declare-fun e!80882 () Bool)

(assert (=> b!123405 (=> res!102299 e!80882)))

(declare-fun e!80881 () Bool)

(assert (=> b!123405 (= e!80881 e!80882)))

(declare-fun bm!1610 () Bool)

(declare-fun lt!194824 () (_ BitVec 32))

(declare-fun c!7378 () Bool)

(declare-fun call!1613 () Bool)

(declare-fun lt!194825 () tuple4!88)

(assert (=> bm!1610 (= call!1613 (byteRangesEq!0 (ite c!7378 (select (arr!3052 (buf!2899 thiss!1305)) (_3!265 lt!194825)) (select (arr!3052 (buf!2899 thiss!1305)) (_4!44 lt!194825))) (ite c!7378 (select (arr!3052 (buf!2899 (_2!5461 lt!193308))) (_3!265 lt!194825)) (select (arr!3052 (buf!2899 (_2!5461 lt!193308))) (_4!44 lt!194825))) (ite c!7378 lt!194824 #b00000000000000000000000000000000) lt!194823))))

(declare-fun b!123406 () Bool)

(declare-fun e!80883 () Bool)

(declare-fun e!80879 () Bool)

(assert (=> b!123406 (= e!80883 e!80879)))

(assert (=> b!123406 (= c!7378 (= (_3!265 lt!194825) (_4!44 lt!194825)))))

(declare-fun b!123407 () Bool)

(assert (=> b!123407 (= e!80879 call!1613)))

(declare-fun d!39920 () Bool)

(declare-fun res!102302 () Bool)

(declare-fun e!80884 () Bool)

(assert (=> d!39920 (=> res!102302 e!80884)))

(assert (=> d!39920 (= res!102302 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2459 (buf!2899 thiss!1305)) (currentByte!5596 thiss!1305) (currentBit!5591 thiss!1305))))))

(assert (=> d!39920 (= (arrayBitRangesEq!0 (buf!2899 thiss!1305) (buf!2899 (_2!5461 lt!193308)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2459 (buf!2899 thiss!1305)) (currentByte!5596 thiss!1305) (currentBit!5591 thiss!1305))) e!80884)))

(declare-fun e!80880 () Bool)

(declare-fun b!123408 () Bool)

(assert (=> b!123408 (= e!80880 (arrayRangesEq!45 (buf!2899 thiss!1305) (buf!2899 (_2!5461 lt!193308)) (_1!5475 lt!194825) (_2!5475 lt!194825)))))

(declare-fun b!123409 () Bool)

(assert (=> b!123409 (= e!80884 e!80883)))

(declare-fun res!102303 () Bool)

(assert (=> b!123409 (=> (not res!102303) (not e!80883))))

(assert (=> b!123409 (= res!102303 e!80880)))

(declare-fun res!102301 () Bool)

(assert (=> b!123409 (=> res!102301 e!80880)))

(assert (=> b!123409 (= res!102301 (bvsge (_1!5475 lt!194825) (_2!5475 lt!194825)))))

(assert (=> b!123409 (= lt!194823 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!2459 (buf!2899 thiss!1305)) (currentByte!5596 thiss!1305) (currentBit!5591 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123409 (= lt!194824 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123409 (= lt!194825 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2459 (buf!2899 thiss!1305)) (currentByte!5596 thiss!1305) (currentBit!5591 thiss!1305))))))

(declare-fun b!123410 () Bool)

(assert (=> b!123410 (= e!80879 e!80881)))

(declare-fun res!102300 () Bool)

(assert (=> b!123410 (= res!102300 (byteRangesEq!0 (select (arr!3052 (buf!2899 thiss!1305)) (_3!265 lt!194825)) (select (arr!3052 (buf!2899 (_2!5461 lt!193308))) (_3!265 lt!194825)) lt!194824 #b00000000000000000000000000001000))))

(assert (=> b!123410 (=> (not res!102300) (not e!80881))))

(declare-fun b!123411 () Bool)

(assert (=> b!123411 (= e!80882 call!1613)))

(assert (= (and d!39920 (not res!102302)) b!123409))

(assert (= (and b!123409 (not res!102301)) b!123408))

(assert (= (and b!123409 res!102303) b!123406))

(assert (= (and b!123406 c!7378) b!123407))

(assert (= (and b!123406 (not c!7378)) b!123410))

(assert (= (and b!123410 res!102300) b!123405))

(assert (= (and b!123405 (not res!102299)) b!123411))

(assert (= (or b!123407 b!123411) bm!1610))

(declare-fun m!187983 () Bool)

(assert (=> bm!1610 m!187983))

(declare-fun m!187985 () Bool)

(assert (=> bm!1610 m!187985))

(declare-fun m!187987 () Bool)

(assert (=> bm!1610 m!187987))

(declare-fun m!187989 () Bool)

(assert (=> bm!1610 m!187989))

(declare-fun m!187991 () Bool)

(assert (=> bm!1610 m!187991))

(declare-fun m!187993 () Bool)

(assert (=> b!123408 m!187993))

(assert (=> b!123409 m!186569))

(assert (=> b!123409 m!187937))

(assert (=> b!123410 m!187987))

(assert (=> b!123410 m!187985))

(assert (=> b!123410 m!187987))

(assert (=> b!123410 m!187985))

(declare-fun m!187995 () Bool)

(assert (=> b!123410 m!187995))

(assert (=> b!122988 d!39920))

(assert (=> b!122988 d!39464))

(declare-fun d!39922 () Bool)

(declare-fun res!102306 () Bool)

(declare-fun e!80886 () Bool)

(assert (=> d!39922 (=> (not res!102306) (not e!80886))))

(assert (=> d!39922 (= res!102306 (= (size!2459 (buf!2899 (ite c!7340 (_2!5461 lt!193323) lt!193810))) (size!2459 (buf!2899 (ite c!7340 (_2!5461 lt!193817) lt!193810)))))))

(assert (=> d!39922 (= (isPrefixOf!0 (ite c!7340 (_2!5461 lt!193323) lt!193810) (ite c!7340 (_2!5461 lt!193817) lt!193810)) e!80886)))

(declare-fun b!123412 () Bool)

(declare-fun res!102304 () Bool)

(assert (=> b!123412 (=> (not res!102304) (not e!80886))))

(assert (=> b!123412 (= res!102304 (bvsle (bitIndex!0 (size!2459 (buf!2899 (ite c!7340 (_2!5461 lt!193323) lt!193810))) (currentByte!5596 (ite c!7340 (_2!5461 lt!193323) lt!193810)) (currentBit!5591 (ite c!7340 (_2!5461 lt!193323) lt!193810))) (bitIndex!0 (size!2459 (buf!2899 (ite c!7340 (_2!5461 lt!193817) lt!193810))) (currentByte!5596 (ite c!7340 (_2!5461 lt!193817) lt!193810)) (currentBit!5591 (ite c!7340 (_2!5461 lt!193817) lt!193810)))))))

(declare-fun b!123413 () Bool)

(declare-fun e!80885 () Bool)

(assert (=> b!123413 (= e!80886 e!80885)))

(declare-fun res!102305 () Bool)

(assert (=> b!123413 (=> res!102305 e!80885)))

(assert (=> b!123413 (= res!102305 (= (size!2459 (buf!2899 (ite c!7340 (_2!5461 lt!193323) lt!193810))) #b00000000000000000000000000000000))))

(declare-fun b!123414 () Bool)

(assert (=> b!123414 (= e!80885 (arrayBitRangesEq!0 (buf!2899 (ite c!7340 (_2!5461 lt!193323) lt!193810)) (buf!2899 (ite c!7340 (_2!5461 lt!193817) lt!193810)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2459 (buf!2899 (ite c!7340 (_2!5461 lt!193323) lt!193810))) (currentByte!5596 (ite c!7340 (_2!5461 lt!193323) lt!193810)) (currentBit!5591 (ite c!7340 (_2!5461 lt!193323) lt!193810)))))))

(assert (= (and d!39922 res!102306) b!123412))

(assert (= (and b!123412 res!102304) b!123413))

(assert (= (and b!123413 (not res!102305)) b!123414))

(declare-fun m!187997 () Bool)

(assert (=> b!123412 m!187997))

(declare-fun m!187999 () Bool)

(assert (=> b!123412 m!187999))

(assert (=> b!123414 m!187997))

(assert (=> b!123414 m!187997))

(declare-fun m!188001 () Bool)

(assert (=> b!123414 m!188001))

(assert (=> bm!1598 d!39922))

(assert (=> b!123021 d!39464))

(declare-fun d!39924 () Bool)

(assert (=> d!39924 (arrayBitRangesEq!0 (buf!2899 (_2!5461 lt!193308)) (buf!2899 thiss!1305) lt!193939 lt!193940)))

(declare-fun lt!194826 () Unit!7557)

(assert (=> d!39924 (= lt!194826 (choose!8 (buf!2899 thiss!1305) (buf!2899 (_2!5461 lt!193308)) lt!193939 lt!193940))))

(assert (=> d!39924 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!193939) (bvsle lt!193939 lt!193940))))

(assert (=> d!39924 (= (arrayBitRangesEqSymmetric!0 (buf!2899 thiss!1305) (buf!2899 (_2!5461 lt!193308)) lt!193939 lt!193940) lt!194826)))

(declare-fun bs!9642 () Bool)

(assert (= bs!9642 d!39924))

(assert (=> bs!9642 m!187113))

(declare-fun m!188003 () Bool)

(assert (=> bs!9642 m!188003))

(assert (=> b!123021 d!39924))

(declare-fun b!123415 () Bool)

(declare-fun res!102307 () Bool)

(declare-fun lt!194827 () (_ BitVec 32))

(assert (=> b!123415 (= res!102307 (= lt!194827 #b00000000000000000000000000000000))))

(declare-fun e!80890 () Bool)

(assert (=> b!123415 (=> res!102307 e!80890)))

(declare-fun e!80889 () Bool)

(assert (=> b!123415 (= e!80889 e!80890)))

(declare-fun lt!194828 () (_ BitVec 32))

(declare-fun lt!194829 () tuple4!88)

(declare-fun bm!1611 () Bool)

(declare-fun call!1614 () Bool)

(declare-fun c!7379 () Bool)

(assert (=> bm!1611 (= call!1614 (byteRangesEq!0 (ite c!7379 (select (arr!3052 (buf!2899 (_2!5461 lt!193308))) (_3!265 lt!194829)) (select (arr!3052 (buf!2899 (_2!5461 lt!193308))) (_4!44 lt!194829))) (ite c!7379 (select (arr!3052 (buf!2899 thiss!1305)) (_3!265 lt!194829)) (select (arr!3052 (buf!2899 thiss!1305)) (_4!44 lt!194829))) (ite c!7379 lt!194828 #b00000000000000000000000000000000) lt!194827))))

(declare-fun b!123416 () Bool)

(declare-fun e!80891 () Bool)

(declare-fun e!80887 () Bool)

(assert (=> b!123416 (= e!80891 e!80887)))

(assert (=> b!123416 (= c!7379 (= (_3!265 lt!194829) (_4!44 lt!194829)))))

(declare-fun b!123417 () Bool)

(assert (=> b!123417 (= e!80887 call!1614)))

(declare-fun d!39926 () Bool)

(declare-fun res!102310 () Bool)

(declare-fun e!80892 () Bool)

(assert (=> d!39926 (=> res!102310 e!80892)))

(assert (=> d!39926 (= res!102310 (bvsge lt!193939 lt!193940))))

(assert (=> d!39926 (= (arrayBitRangesEq!0 (buf!2899 (_2!5461 lt!193308)) (buf!2899 thiss!1305) lt!193939 lt!193940) e!80892)))

(declare-fun b!123418 () Bool)

(declare-fun e!80888 () Bool)

(assert (=> b!123418 (= e!80888 (arrayRangesEq!45 (buf!2899 (_2!5461 lt!193308)) (buf!2899 thiss!1305) (_1!5475 lt!194829) (_2!5475 lt!194829)))))

(declare-fun b!123419 () Bool)

(assert (=> b!123419 (= e!80892 e!80891)))

(declare-fun res!102311 () Bool)

(assert (=> b!123419 (=> (not res!102311) (not e!80891))))

(assert (=> b!123419 (= res!102311 e!80888)))

(declare-fun res!102309 () Bool)

(assert (=> b!123419 (=> res!102309 e!80888)))

(assert (=> b!123419 (= res!102309 (bvsge (_1!5475 lt!194829) (_2!5475 lt!194829)))))

(assert (=> b!123419 (= lt!194827 ((_ extract 31 0) (bvsrem lt!193940 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123419 (= lt!194828 ((_ extract 31 0) (bvsrem lt!193939 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123419 (= lt!194829 (arrayBitIndices!0 lt!193939 lt!193940))))

(declare-fun b!123420 () Bool)

(assert (=> b!123420 (= e!80887 e!80889)))

(declare-fun res!102308 () Bool)

(assert (=> b!123420 (= res!102308 (byteRangesEq!0 (select (arr!3052 (buf!2899 (_2!5461 lt!193308))) (_3!265 lt!194829)) (select (arr!3052 (buf!2899 thiss!1305)) (_3!265 lt!194829)) lt!194828 #b00000000000000000000000000001000))))

(assert (=> b!123420 (=> (not res!102308) (not e!80889))))

(declare-fun b!123421 () Bool)

(assert (=> b!123421 (= e!80890 call!1614)))

(assert (= (and d!39926 (not res!102310)) b!123419))

(assert (= (and b!123419 (not res!102309)) b!123418))

(assert (= (and b!123419 res!102311) b!123416))

(assert (= (and b!123416 c!7379) b!123417))

(assert (= (and b!123416 (not c!7379)) b!123420))

(assert (= (and b!123420 res!102308) b!123415))

(assert (= (and b!123415 (not res!102307)) b!123421))

(assert (= (or b!123417 b!123421) bm!1611))

(declare-fun m!188005 () Bool)

(assert (=> bm!1611 m!188005))

(declare-fun m!188007 () Bool)

(assert (=> bm!1611 m!188007))

(declare-fun m!188009 () Bool)

(assert (=> bm!1611 m!188009))

(declare-fun m!188011 () Bool)

(assert (=> bm!1611 m!188011))

(declare-fun m!188013 () Bool)

(assert (=> bm!1611 m!188013))

(declare-fun m!188015 () Bool)

(assert (=> b!123418 m!188015))

(declare-fun m!188017 () Bool)

(assert (=> b!123419 m!188017))

(assert (=> b!123420 m!188009))

(assert (=> b!123420 m!188007))

(assert (=> b!123420 m!188009))

(assert (=> b!123420 m!188007))

(declare-fun m!188019 () Bool)

(assert (=> b!123420 m!188019))

(assert (=> b!123021 d!39926))

(declare-fun d!39928 () Bool)

(declare-fun res!102314 () Bool)

(declare-fun e!80894 () Bool)

(assert (=> d!39928 (=> (not res!102314) (not e!80894))))

(assert (=> d!39928 (= res!102314 (= (size!2459 (buf!2899 (_2!5463 lt!193943))) (size!2459 (buf!2899 (_2!5461 lt!193308)))))))

(assert (=> d!39928 (= (isPrefixOf!0 (_2!5463 lt!193943) (_2!5461 lt!193308)) e!80894)))

(declare-fun b!123422 () Bool)

(declare-fun res!102312 () Bool)

(assert (=> b!123422 (=> (not res!102312) (not e!80894))))

(assert (=> b!123422 (= res!102312 (bvsle (bitIndex!0 (size!2459 (buf!2899 (_2!5463 lt!193943))) (currentByte!5596 (_2!5463 lt!193943)) (currentBit!5591 (_2!5463 lt!193943))) (bitIndex!0 (size!2459 (buf!2899 (_2!5461 lt!193308))) (currentByte!5596 (_2!5461 lt!193308)) (currentBit!5591 (_2!5461 lt!193308)))))))

(declare-fun b!123423 () Bool)

(declare-fun e!80893 () Bool)

(assert (=> b!123423 (= e!80894 e!80893)))

(declare-fun res!102313 () Bool)

(assert (=> b!123423 (=> res!102313 e!80893)))

(assert (=> b!123423 (= res!102313 (= (size!2459 (buf!2899 (_2!5463 lt!193943))) #b00000000000000000000000000000000))))

(declare-fun b!123424 () Bool)

(assert (=> b!123424 (= e!80893 (arrayBitRangesEq!0 (buf!2899 (_2!5463 lt!193943)) (buf!2899 (_2!5461 lt!193308)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2459 (buf!2899 (_2!5463 lt!193943))) (currentByte!5596 (_2!5463 lt!193943)) (currentBit!5591 (_2!5463 lt!193943)))))))

(assert (= (and d!39928 res!102314) b!123422))

(assert (= (and b!123422 res!102312) b!123423))

(assert (= (and b!123423 (not res!102313)) b!123424))

(assert (=> b!123422 m!187457))

(assert (=> b!123422 m!186577))

(assert (=> b!123424 m!187457))

(assert (=> b!123424 m!187457))

(declare-fun m!188021 () Bool)

(assert (=> b!123424 m!188021))

(assert (=> b!123023 d!39928))

(check-sat (not b!123243) (not d!39700) (not b!123388) (not b!123389) (not b!123309) (not b!123422) (not b!123234) (not b!123414) (not b!123326) (not d!39850) (not b!123188) (not d!39892) (not d!39760) (not b!123383) (not d!39720) (not b!123419) (not b!123304) (not d!39732) (not b!123189) (not b!123272) (not b!123283) (not d!39810) (not b!123200) (not d!39816) (not b!123281) (not b!123402) (not d!39842) (not d!39882) (not d!39884) (not d!39768) (not b!123268) (not d!39860) (not d!39714) (not b!123400) (not d!39688) (not d!39880) (not d!39910) (not b!123346) (not b!123409) (not b!123256) (not d!39788) (not d!39818) (not b!123385) (not b!123216) (not b!123331) (not d!39724) (not d!39784) (not b!123183) (not d!39796) (not d!39756) (not b!123245) (not d!39866) (not d!39804) (not d!39828) (not b!123211) (not b!123344) (not b!123259) (not b!123185) (not d!39812) (not b!123280) (not d!39836) (not b!123398) (not b!123300) (not b!123420) (not d!39840) (not d!39696) (not b!123404) (not d!39832) (not b!123307) (not d!39870) (not b!123299) (not b!123312) (not b!123288) (not b!123318) (not b!123198) (not b!123233) (not d!39900) (not d!39684) (not d!39846) (not b!123271) (not d!39782) (not b!123182) (not b!123345) (not b!123408) (not b!123347) (not d!39874) (not d!39698) (not d!39770) (not b!123301) (not d!39858) (not b!123269) (not b!123305) (not d!39822) (not b!123356) (not b!123186) (not d!39852) (not d!39830) (not d!39766) (not d!39834) (not b!123391) (not d!39740) (not b!123390) (not d!39820) (not b!123302) (not d!39872) (not b!123320) (not bm!1611) (not d!39744) (not bm!1610) (not bm!1608) (not b!123191) (not b!123291) (not b!123358) (not b!123238) (not d!39888) (not b!123325) (not b!123424) (not b!123365) (not d!39912) (not b!123275) (not d!39844) (not b!123410) (not b!123363) (not bm!1605) (not b!123244) (not b!123314) (not b!123242) (not b!123277) (not d!39764) (not d!39854) (not b!123175) (not b!123360) (not d!39890) (not bm!1609) (not b!123290) (not b!123261) (not b!123177) (not d!39780) (not b!123180) (not b!123235) (not b!123324) (not d!39776) (not b!123278) (not b!123321) (not d!39924) (not d!39894) (not d!39742) (not b!123343) (not b!123357) (not d!39848) (not b!123323) (not b!123313) (not b!123240) (not d!39738) (not b!123412) (not d!39826) (not b!123418) (not b!123306) (not d!39862) (not b!123179) (not d!39868) (not d!39686) (not b!123399) (not d!39808) (not d!39730) (not b!123362) (not d!39794) (not b!123266) (not d!39898) (not b!123319) (not b!123232) (not d!39704) (not b!123274) (not b!123249) (not d!39896) (not b!123308) (not b!123355) (not b!123384) (not b!123311) (not d!39722) (not d!39790) (not b!123394) (not d!39762))
(check-sat)
