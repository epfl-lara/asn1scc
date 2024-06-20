; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41764 () Bool)

(assert start!41764)

(declare-fun res!164347 () Bool)

(declare-fun e!134996 () Bool)

(assert (=> start!41764 (=> (not res!164347) (not e!134996))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!41764 (= res!164347 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!41764 e!134996))

(assert (=> start!41764 true))

(declare-datatypes ((array!10075 0))(
  ( (array!10076 (arr!5372 (Array (_ BitVec 32) (_ BitVec 8))) (size!4442 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7992 0))(
  ( (BitStream!7993 (buf!4928 array!10075) (currentByte!9248 (_ BitVec 32)) (currentBit!9243 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7992)

(declare-fun e!134994 () Bool)

(declare-fun inv!12 (BitStream!7992) Bool)

(assert (=> start!41764 (and (inv!12 thiss!1204) e!134994)))

(declare-fun b!196422 () Bool)

(declare-fun res!164353 () Bool)

(assert (=> b!196422 (=> (not res!164353) (not e!134996))))

(assert (=> b!196422 (= res!164353 (not (= i!590 nBits!348)))))

(declare-fun b!196423 () Bool)

(declare-fun res!164355 () Bool)

(declare-fun e!134990 () Bool)

(assert (=> b!196423 (=> res!164355 e!134990)))

(declare-datatypes ((Unit!13883 0))(
  ( (Unit!13884) )
))
(declare-datatypes ((tuple2!16992 0))(
  ( (tuple2!16993 (_1!9141 Unit!13883) (_2!9141 BitStream!7992)) )
))
(declare-fun lt!305534 () tuple2!16992)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!196423 (= res!164355 (not (invariant!0 (currentBit!9243 (_2!9141 lt!305534)) (currentByte!9248 (_2!9141 lt!305534)) (size!4442 (buf!4928 (_2!9141 lt!305534))))))))

(declare-fun b!196424 () Bool)

(declare-fun array_inv!4183 (array!10075) Bool)

(assert (=> b!196424 (= e!134994 (array_inv!4183 (buf!4928 thiss!1204)))))

(declare-fun b!196425 () Bool)

(declare-fun res!164349 () Bool)

(declare-fun e!134989 () Bool)

(assert (=> b!196425 (=> (not res!164349) (not e!134989))))

(declare-fun lt!305536 () tuple2!16992)

(declare-fun isPrefixOf!0 (BitStream!7992 BitStream!7992) Bool)

(assert (=> b!196425 (= res!164349 (isPrefixOf!0 thiss!1204 (_2!9141 lt!305536)))))

(declare-fun b!196426 () Bool)

(declare-fun res!164352 () Bool)

(assert (=> b!196426 (=> (not res!164352) (not e!134996))))

(assert (=> b!196426 (= res!164352 (invariant!0 (currentBit!9243 thiss!1204) (currentByte!9248 thiss!1204) (size!4442 (buf!4928 thiss!1204))))))

(declare-fun b!196427 () Bool)

(declare-fun e!134995 () Bool)

(declare-datatypes ((tuple2!16994 0))(
  ( (tuple2!16995 (_1!9142 BitStream!7992) (_2!9142 Bool)) )
))
(declare-fun lt!305535 () tuple2!16994)

(declare-fun lt!305528 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!196427 (= e!134995 (= (bitIndex!0 (size!4442 (buf!4928 (_1!9142 lt!305535))) (currentByte!9248 (_1!9142 lt!305535)) (currentBit!9243 (_1!9142 lt!305535))) lt!305528))))

(declare-fun b!196428 () Bool)

(declare-fun e!134993 () Bool)

(assert (=> b!196428 (= e!134996 (not e!134993))))

(declare-fun res!164345 () Bool)

(assert (=> b!196428 (=> res!164345 e!134993)))

(declare-fun lt!305529 () (_ BitVec 64))

(declare-fun lt!305532 () (_ BitVec 64))

(assert (=> b!196428 (= res!164345 (not (= lt!305529 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!305532))))))

(assert (=> b!196428 (= lt!305529 (bitIndex!0 (size!4442 (buf!4928 (_2!9141 lt!305536))) (currentByte!9248 (_2!9141 lt!305536)) (currentBit!9243 (_2!9141 lt!305536))))))

(assert (=> b!196428 (= lt!305532 (bitIndex!0 (size!4442 (buf!4928 thiss!1204)) (currentByte!9248 thiss!1204) (currentBit!9243 thiss!1204)))))

(declare-fun e!134992 () Bool)

(assert (=> b!196428 e!134992))

(declare-fun res!164350 () Bool)

(assert (=> b!196428 (=> (not res!164350) (not e!134992))))

(assert (=> b!196428 (= res!164350 (= (size!4442 (buf!4928 thiss!1204)) (size!4442 (buf!4928 (_2!9141 lt!305536)))))))

(declare-fun lt!305533 () Bool)

(declare-fun appendBit!0 (BitStream!7992 Bool) tuple2!16992)

(assert (=> b!196428 (= lt!305536 (appendBit!0 thiss!1204 lt!305533))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!196428 (= lt!305533 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!196429 () Bool)

(assert (=> b!196429 (= e!134990 (= (size!4442 (buf!4928 (_2!9141 lt!305534))) (size!4442 (buf!4928 thiss!1204))))))

(declare-fun b!196430 () Bool)

(assert (=> b!196430 (= e!134993 e!134990)))

(declare-fun res!164354 () Bool)

(assert (=> b!196430 (=> res!164354 e!134990)))

(assert (=> b!196430 (= res!164354 (not (= (bitIndex!0 (size!4442 (buf!4928 (_2!9141 lt!305534))) (currentByte!9248 (_2!9141 lt!305534)) (currentBit!9243 (_2!9141 lt!305534))) (bvsub (bvsub (bvadd lt!305529 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!196430 (isPrefixOf!0 thiss!1204 (_2!9141 lt!305534))))

(declare-fun lt!305530 () Unit!13883)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7992 BitStream!7992 BitStream!7992) Unit!13883)

(assert (=> b!196430 (= lt!305530 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9141 lt!305536) (_2!9141 lt!305534)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7992 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!16992)

(assert (=> b!196430 (= lt!305534 (appendBitsLSBFirstLoopTR!0 (_2!9141 lt!305536) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!196431 () Bool)

(assert (=> b!196431 (= e!134992 e!134989)))

(declare-fun res!164346 () Bool)

(assert (=> b!196431 (=> (not res!164346) (not e!134989))))

(declare-fun lt!305531 () (_ BitVec 64))

(assert (=> b!196431 (= res!164346 (= lt!305528 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!305531)))))

(assert (=> b!196431 (= lt!305528 (bitIndex!0 (size!4442 (buf!4928 (_2!9141 lt!305536))) (currentByte!9248 (_2!9141 lt!305536)) (currentBit!9243 (_2!9141 lt!305536))))))

(assert (=> b!196431 (= lt!305531 (bitIndex!0 (size!4442 (buf!4928 thiss!1204)) (currentByte!9248 thiss!1204) (currentBit!9243 thiss!1204)))))

(declare-fun b!196432 () Bool)

(assert (=> b!196432 (= e!134989 e!134995)))

(declare-fun res!164348 () Bool)

(assert (=> b!196432 (=> (not res!164348) (not e!134995))))

(assert (=> b!196432 (= res!164348 (and (= (_2!9142 lt!305535) lt!305533) (= (_1!9142 lt!305535) (_2!9141 lt!305536))))))

(declare-fun readBitPure!0 (BitStream!7992) tuple2!16994)

(declare-fun readerFrom!0 (BitStream!7992 (_ BitVec 32) (_ BitVec 32)) BitStream!7992)

(assert (=> b!196432 (= lt!305535 (readBitPure!0 (readerFrom!0 (_2!9141 lt!305536) (currentBit!9243 thiss!1204) (currentByte!9248 thiss!1204))))))

(declare-fun b!196433 () Bool)

(declare-fun res!164351 () Bool)

(assert (=> b!196433 (=> (not res!164351) (not e!134996))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!196433 (= res!164351 (validate_offset_bits!1 ((_ sign_extend 32) (size!4442 (buf!4928 thiss!1204))) ((_ sign_extend 32) (currentByte!9248 thiss!1204)) ((_ sign_extend 32) (currentBit!9243 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(assert (= (and start!41764 res!164347) b!196433))

(assert (= (and b!196433 res!164351) b!196426))

(assert (= (and b!196426 res!164352) b!196422))

(assert (= (and b!196422 res!164353) b!196428))

(assert (= (and b!196428 res!164350) b!196431))

(assert (= (and b!196431 res!164346) b!196425))

(assert (= (and b!196425 res!164349) b!196432))

(assert (= (and b!196432 res!164348) b!196427))

(assert (= (and b!196428 (not res!164345)) b!196430))

(assert (= (and b!196430 (not res!164354)) b!196423))

(assert (= (and b!196423 (not res!164355)) b!196429))

(assert (= start!41764 b!196424))

(declare-fun m!303829 () Bool)

(assert (=> b!196430 m!303829))

(declare-fun m!303831 () Bool)

(assert (=> b!196430 m!303831))

(declare-fun m!303833 () Bool)

(assert (=> b!196430 m!303833))

(declare-fun m!303835 () Bool)

(assert (=> b!196430 m!303835))

(declare-fun m!303837 () Bool)

(assert (=> b!196433 m!303837))

(declare-fun m!303839 () Bool)

(assert (=> b!196426 m!303839))

(declare-fun m!303841 () Bool)

(assert (=> b!196431 m!303841))

(declare-fun m!303843 () Bool)

(assert (=> b!196431 m!303843))

(declare-fun m!303845 () Bool)

(assert (=> b!196425 m!303845))

(declare-fun m!303847 () Bool)

(assert (=> start!41764 m!303847))

(declare-fun m!303849 () Bool)

(assert (=> b!196427 m!303849))

(declare-fun m!303851 () Bool)

(assert (=> b!196424 m!303851))

(assert (=> b!196428 m!303841))

(assert (=> b!196428 m!303843))

(declare-fun m!303853 () Bool)

(assert (=> b!196428 m!303853))

(declare-fun m!303855 () Bool)

(assert (=> b!196432 m!303855))

(assert (=> b!196432 m!303855))

(declare-fun m!303857 () Bool)

(assert (=> b!196432 m!303857))

(declare-fun m!303859 () Bool)

(assert (=> b!196423 m!303859))

(check-sat (not b!196431) (not start!41764) (not b!196427) (not b!196425) (not b!196424) (not b!196433) (not b!196426) (not b!196430) (not b!196423) (not b!196432) (not b!196428))
(check-sat)
(get-model)

(declare-fun d!66445 () Bool)

(assert (=> d!66445 (= (invariant!0 (currentBit!9243 (_2!9141 lt!305534)) (currentByte!9248 (_2!9141 lt!305534)) (size!4442 (buf!4928 (_2!9141 lt!305534)))) (and (bvsge (currentBit!9243 (_2!9141 lt!305534)) #b00000000000000000000000000000000) (bvslt (currentBit!9243 (_2!9141 lt!305534)) #b00000000000000000000000000001000) (bvsge (currentByte!9248 (_2!9141 lt!305534)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9248 (_2!9141 lt!305534)) (size!4442 (buf!4928 (_2!9141 lt!305534)))) (and (= (currentBit!9243 (_2!9141 lt!305534)) #b00000000000000000000000000000000) (= (currentByte!9248 (_2!9141 lt!305534)) (size!4442 (buf!4928 (_2!9141 lt!305534))))))))))

(assert (=> b!196423 d!66445))

(declare-fun d!66447 () Bool)

(assert (=> d!66447 (= (array_inv!4183 (buf!4928 thiss!1204)) (bvsge (size!4442 (buf!4928 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!196424 d!66447))

(declare-fun d!66449 () Bool)

(declare-fun e!135023 () Bool)

(assert (=> d!66449 e!135023))

(declare-fun res!164393 () Bool)

(assert (=> d!66449 (=> (not res!164393) (not e!135023))))

(declare-fun lt!305579 () (_ BitVec 64))

(declare-fun lt!305581 () (_ BitVec 64))

(declare-fun lt!305580 () (_ BitVec 64))

(assert (=> d!66449 (= res!164393 (= lt!305580 (bvsub lt!305581 lt!305579)))))

(assert (=> d!66449 (or (= (bvand lt!305581 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!305579 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!305581 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!305581 lt!305579) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!66449 (= lt!305579 (remainingBits!0 ((_ sign_extend 32) (size!4442 (buf!4928 (_1!9142 lt!305535)))) ((_ sign_extend 32) (currentByte!9248 (_1!9142 lt!305535))) ((_ sign_extend 32) (currentBit!9243 (_1!9142 lt!305535)))))))

(declare-fun lt!305582 () (_ BitVec 64))

(declare-fun lt!305583 () (_ BitVec 64))

(assert (=> d!66449 (= lt!305581 (bvmul lt!305582 lt!305583))))

(assert (=> d!66449 (or (= lt!305582 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!305583 (bvsdiv (bvmul lt!305582 lt!305583) lt!305582)))))

(assert (=> d!66449 (= lt!305583 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66449 (= lt!305582 ((_ sign_extend 32) (size!4442 (buf!4928 (_1!9142 lt!305535)))))))

(assert (=> d!66449 (= lt!305580 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9248 (_1!9142 lt!305535))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9243 (_1!9142 lt!305535)))))))

(assert (=> d!66449 (invariant!0 (currentBit!9243 (_1!9142 lt!305535)) (currentByte!9248 (_1!9142 lt!305535)) (size!4442 (buf!4928 (_1!9142 lt!305535))))))

(assert (=> d!66449 (= (bitIndex!0 (size!4442 (buf!4928 (_1!9142 lt!305535))) (currentByte!9248 (_1!9142 lt!305535)) (currentBit!9243 (_1!9142 lt!305535))) lt!305580)))

(declare-fun b!196474 () Bool)

(declare-fun res!164394 () Bool)

(assert (=> b!196474 (=> (not res!164394) (not e!135023))))

(assert (=> b!196474 (= res!164394 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!305580))))

(declare-fun b!196475 () Bool)

(declare-fun lt!305584 () (_ BitVec 64))

(assert (=> b!196475 (= e!135023 (bvsle lt!305580 (bvmul lt!305584 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!196475 (or (= lt!305584 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!305584 #b0000000000000000000000000000000000000000000000000000000000001000) lt!305584)))))

(assert (=> b!196475 (= lt!305584 ((_ sign_extend 32) (size!4442 (buf!4928 (_1!9142 lt!305535)))))))

(assert (= (and d!66449 res!164393) b!196474))

(assert (= (and b!196474 res!164394) b!196475))

(declare-fun m!303895 () Bool)

(assert (=> d!66449 m!303895))

(declare-fun m!303897 () Bool)

(assert (=> d!66449 m!303897))

(assert (=> b!196427 d!66449))

(declare-fun d!66455 () Bool)

(declare-fun e!135024 () Bool)

(assert (=> d!66455 e!135024))

(declare-fun res!164396 () Bool)

(assert (=> d!66455 (=> (not res!164396) (not e!135024))))

(declare-fun lt!305587 () (_ BitVec 64))

(declare-fun lt!305585 () (_ BitVec 64))

(declare-fun lt!305586 () (_ BitVec 64))

(assert (=> d!66455 (= res!164396 (= lt!305586 (bvsub lt!305587 lt!305585)))))

(assert (=> d!66455 (or (= (bvand lt!305587 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!305585 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!305587 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!305587 lt!305585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66455 (= lt!305585 (remainingBits!0 ((_ sign_extend 32) (size!4442 (buf!4928 (_2!9141 lt!305536)))) ((_ sign_extend 32) (currentByte!9248 (_2!9141 lt!305536))) ((_ sign_extend 32) (currentBit!9243 (_2!9141 lt!305536)))))))

(declare-fun lt!305588 () (_ BitVec 64))

(declare-fun lt!305589 () (_ BitVec 64))

(assert (=> d!66455 (= lt!305587 (bvmul lt!305588 lt!305589))))

(assert (=> d!66455 (or (= lt!305588 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!305589 (bvsdiv (bvmul lt!305588 lt!305589) lt!305588)))))

(assert (=> d!66455 (= lt!305589 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66455 (= lt!305588 ((_ sign_extend 32) (size!4442 (buf!4928 (_2!9141 lt!305536)))))))

(assert (=> d!66455 (= lt!305586 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9248 (_2!9141 lt!305536))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9243 (_2!9141 lt!305536)))))))

(assert (=> d!66455 (invariant!0 (currentBit!9243 (_2!9141 lt!305536)) (currentByte!9248 (_2!9141 lt!305536)) (size!4442 (buf!4928 (_2!9141 lt!305536))))))

(assert (=> d!66455 (= (bitIndex!0 (size!4442 (buf!4928 (_2!9141 lt!305536))) (currentByte!9248 (_2!9141 lt!305536)) (currentBit!9243 (_2!9141 lt!305536))) lt!305586)))

(declare-fun b!196476 () Bool)

(declare-fun res!164397 () Bool)

(assert (=> b!196476 (=> (not res!164397) (not e!135024))))

(assert (=> b!196476 (= res!164397 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!305586))))

(declare-fun b!196477 () Bool)

(declare-fun lt!305590 () (_ BitVec 64))

(assert (=> b!196477 (= e!135024 (bvsle lt!305586 (bvmul lt!305590 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!196477 (or (= lt!305590 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!305590 #b0000000000000000000000000000000000000000000000000000000000001000) lt!305590)))))

(assert (=> b!196477 (= lt!305590 ((_ sign_extend 32) (size!4442 (buf!4928 (_2!9141 lt!305536)))))))

(assert (= (and d!66455 res!164396) b!196476))

(assert (= (and b!196476 res!164397) b!196477))

(declare-fun m!303899 () Bool)

(assert (=> d!66455 m!303899))

(declare-fun m!303901 () Bool)

(assert (=> d!66455 m!303901))

(assert (=> b!196428 d!66455))

(declare-fun d!66457 () Bool)

(declare-fun e!135025 () Bool)

(assert (=> d!66457 e!135025))

(declare-fun res!164398 () Bool)

(assert (=> d!66457 (=> (not res!164398) (not e!135025))))

(declare-fun lt!305591 () (_ BitVec 64))

(declare-fun lt!305593 () (_ BitVec 64))

(declare-fun lt!305592 () (_ BitVec 64))

(assert (=> d!66457 (= res!164398 (= lt!305592 (bvsub lt!305593 lt!305591)))))

(assert (=> d!66457 (or (= (bvand lt!305593 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!305591 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!305593 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!305593 lt!305591) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66457 (= lt!305591 (remainingBits!0 ((_ sign_extend 32) (size!4442 (buf!4928 thiss!1204))) ((_ sign_extend 32) (currentByte!9248 thiss!1204)) ((_ sign_extend 32) (currentBit!9243 thiss!1204))))))

(declare-fun lt!305594 () (_ BitVec 64))

(declare-fun lt!305595 () (_ BitVec 64))

(assert (=> d!66457 (= lt!305593 (bvmul lt!305594 lt!305595))))

(assert (=> d!66457 (or (= lt!305594 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!305595 (bvsdiv (bvmul lt!305594 lt!305595) lt!305594)))))

(assert (=> d!66457 (= lt!305595 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66457 (= lt!305594 ((_ sign_extend 32) (size!4442 (buf!4928 thiss!1204))))))

(assert (=> d!66457 (= lt!305592 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9248 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9243 thiss!1204))))))

(assert (=> d!66457 (invariant!0 (currentBit!9243 thiss!1204) (currentByte!9248 thiss!1204) (size!4442 (buf!4928 thiss!1204)))))

(assert (=> d!66457 (= (bitIndex!0 (size!4442 (buf!4928 thiss!1204)) (currentByte!9248 thiss!1204) (currentBit!9243 thiss!1204)) lt!305592)))

(declare-fun b!196478 () Bool)

(declare-fun res!164399 () Bool)

(assert (=> b!196478 (=> (not res!164399) (not e!135025))))

(assert (=> b!196478 (= res!164399 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!305592))))

(declare-fun b!196479 () Bool)

(declare-fun lt!305596 () (_ BitVec 64))

(assert (=> b!196479 (= e!135025 (bvsle lt!305592 (bvmul lt!305596 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!196479 (or (= lt!305596 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!305596 #b0000000000000000000000000000000000000000000000000000000000001000) lt!305596)))))

(assert (=> b!196479 (= lt!305596 ((_ sign_extend 32) (size!4442 (buf!4928 thiss!1204))))))

(assert (= (and d!66457 res!164398) b!196478))

(assert (= (and b!196478 res!164399) b!196479))

(declare-fun m!303903 () Bool)

(assert (=> d!66457 m!303903))

(assert (=> d!66457 m!303839))

(assert (=> b!196428 d!66457))

(declare-fun b!196512 () Bool)

(declare-fun e!135045 () Bool)

(declare-fun e!135046 () Bool)

(assert (=> b!196512 (= e!135045 e!135046)))

(declare-fun res!164430 () Bool)

(assert (=> b!196512 (=> (not res!164430) (not e!135046))))

(declare-fun lt!305629 () tuple2!16994)

(declare-fun lt!305627 () tuple2!16992)

(assert (=> b!196512 (= res!164430 (and (= (_2!9142 lt!305629) lt!305533) (= (_1!9142 lt!305629) (_2!9141 lt!305627))))))

(assert (=> b!196512 (= lt!305629 (readBitPure!0 (readerFrom!0 (_2!9141 lt!305627) (currentBit!9243 thiss!1204) (currentByte!9248 thiss!1204))))))

(declare-fun b!196510 () Bool)

(declare-fun res!164431 () Bool)

(assert (=> b!196510 (=> (not res!164431) (not e!135045))))

(declare-fun lt!305628 () (_ BitVec 64))

(declare-fun lt!305626 () (_ BitVec 64))

(assert (=> b!196510 (= res!164431 (= (bitIndex!0 (size!4442 (buf!4928 (_2!9141 lt!305627))) (currentByte!9248 (_2!9141 lt!305627)) (currentBit!9243 (_2!9141 lt!305627))) (bvadd lt!305628 lt!305626)))))

(assert (=> b!196510 (or (not (= (bvand lt!305628 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!305626 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!305628 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!305628 lt!305626) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!196510 (= lt!305626 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!196510 (= lt!305628 (bitIndex!0 (size!4442 (buf!4928 thiss!1204)) (currentByte!9248 thiss!1204) (currentBit!9243 thiss!1204)))))

(declare-fun b!196513 () Bool)

(assert (=> b!196513 (= e!135046 (= (bitIndex!0 (size!4442 (buf!4928 (_1!9142 lt!305629))) (currentByte!9248 (_1!9142 lt!305629)) (currentBit!9243 (_1!9142 lt!305629))) (bitIndex!0 (size!4442 (buf!4928 (_2!9141 lt!305627))) (currentByte!9248 (_2!9141 lt!305627)) (currentBit!9243 (_2!9141 lt!305627)))))))

(declare-fun b!196511 () Bool)

(declare-fun res!164432 () Bool)

(assert (=> b!196511 (=> (not res!164432) (not e!135045))))

(assert (=> b!196511 (= res!164432 (isPrefixOf!0 thiss!1204 (_2!9141 lt!305627)))))

(declare-fun d!66459 () Bool)

(assert (=> d!66459 e!135045))

(declare-fun res!164433 () Bool)

(assert (=> d!66459 (=> (not res!164433) (not e!135045))))

(assert (=> d!66459 (= res!164433 (= (size!4442 (buf!4928 thiss!1204)) (size!4442 (buf!4928 (_2!9141 lt!305627)))))))

(declare-fun choose!16 (BitStream!7992 Bool) tuple2!16992)

(assert (=> d!66459 (= lt!305627 (choose!16 thiss!1204 lt!305533))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!66459 (validate_offset_bit!0 ((_ sign_extend 32) (size!4442 (buf!4928 thiss!1204))) ((_ sign_extend 32) (currentByte!9248 thiss!1204)) ((_ sign_extend 32) (currentBit!9243 thiss!1204)))))

(assert (=> d!66459 (= (appendBit!0 thiss!1204 lt!305533) lt!305627)))

(assert (= (and d!66459 res!164433) b!196510))

(assert (= (and b!196510 res!164431) b!196511))

(assert (= (and b!196511 res!164432) b!196512))

(assert (= (and b!196512 res!164430) b!196513))

(declare-fun m!303919 () Bool)

(assert (=> d!66459 m!303919))

(declare-fun m!303921 () Bool)

(assert (=> d!66459 m!303921))

(declare-fun m!303923 () Bool)

(assert (=> b!196513 m!303923))

(declare-fun m!303925 () Bool)

(assert (=> b!196513 m!303925))

(declare-fun m!303927 () Bool)

(assert (=> b!196511 m!303927))

(assert (=> b!196510 m!303925))

(assert (=> b!196510 m!303843))

(declare-fun m!303929 () Bool)

(assert (=> b!196512 m!303929))

(assert (=> b!196512 m!303929))

(declare-fun m!303931 () Bool)

(assert (=> b!196512 m!303931))

(assert (=> b!196428 d!66459))

(declare-fun d!66477 () Bool)

(assert (=> d!66477 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4442 (buf!4928 thiss!1204))) ((_ sign_extend 32) (currentByte!9248 thiss!1204)) ((_ sign_extend 32) (currentBit!9243 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4442 (buf!4928 thiss!1204))) ((_ sign_extend 32) (currentByte!9248 thiss!1204)) ((_ sign_extend 32) (currentBit!9243 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!16516 () Bool)

(assert (= bs!16516 d!66477))

(assert (=> bs!16516 m!303903))

(assert (=> b!196433 d!66477))

(declare-fun d!66481 () Bool)

(assert (=> d!66481 (= (invariant!0 (currentBit!9243 thiss!1204) (currentByte!9248 thiss!1204) (size!4442 (buf!4928 thiss!1204))) (and (bvsge (currentBit!9243 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9243 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9248 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9248 thiss!1204) (size!4442 (buf!4928 thiss!1204))) (and (= (currentBit!9243 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9248 thiss!1204) (size!4442 (buf!4928 thiss!1204)))))))))

(assert (=> b!196426 d!66481))

(assert (=> b!196431 d!66455))

(assert (=> b!196431 d!66457))

(declare-fun d!66483 () Bool)

(declare-datatypes ((tuple2!17008 0))(
  ( (tuple2!17009 (_1!9149 Bool) (_2!9149 BitStream!7992)) )
))
(declare-fun lt!305635 () tuple2!17008)

(declare-fun readBit!0 (BitStream!7992) tuple2!17008)

(assert (=> d!66483 (= lt!305635 (readBit!0 (readerFrom!0 (_2!9141 lt!305536) (currentBit!9243 thiss!1204) (currentByte!9248 thiss!1204))))))

(assert (=> d!66483 (= (readBitPure!0 (readerFrom!0 (_2!9141 lt!305536) (currentBit!9243 thiss!1204) (currentByte!9248 thiss!1204))) (tuple2!16995 (_2!9149 lt!305635) (_1!9149 lt!305635)))))

(declare-fun bs!16518 () Bool)

(assert (= bs!16518 d!66483))

(assert (=> bs!16518 m!303855))

(declare-fun m!303937 () Bool)

(assert (=> bs!16518 m!303937))

(assert (=> b!196432 d!66483))

(declare-fun d!66487 () Bool)

(declare-fun e!135049 () Bool)

(assert (=> d!66487 e!135049))

(declare-fun res!164437 () Bool)

(assert (=> d!66487 (=> (not res!164437) (not e!135049))))

(assert (=> d!66487 (= res!164437 (invariant!0 (currentBit!9243 (_2!9141 lt!305536)) (currentByte!9248 (_2!9141 lt!305536)) (size!4442 (buf!4928 (_2!9141 lt!305536)))))))

(assert (=> d!66487 (= (readerFrom!0 (_2!9141 lt!305536) (currentBit!9243 thiss!1204) (currentByte!9248 thiss!1204)) (BitStream!7993 (buf!4928 (_2!9141 lt!305536)) (currentByte!9248 thiss!1204) (currentBit!9243 thiss!1204)))))

(declare-fun b!196516 () Bool)

(assert (=> b!196516 (= e!135049 (invariant!0 (currentBit!9243 thiss!1204) (currentByte!9248 thiss!1204) (size!4442 (buf!4928 (_2!9141 lt!305536)))))))

(assert (= (and d!66487 res!164437) b!196516))

(assert (=> d!66487 m!303901))

(declare-fun m!303939 () Bool)

(assert (=> b!196516 m!303939))

(assert (=> b!196432 d!66487))

(declare-fun d!66489 () Bool)

(declare-fun e!135050 () Bool)

(assert (=> d!66489 e!135050))

(declare-fun res!164438 () Bool)

(assert (=> d!66489 (=> (not res!164438) (not e!135050))))

(declare-fun lt!305638 () (_ BitVec 64))

(declare-fun lt!305637 () (_ BitVec 64))

(declare-fun lt!305636 () (_ BitVec 64))

(assert (=> d!66489 (= res!164438 (= lt!305637 (bvsub lt!305638 lt!305636)))))

(assert (=> d!66489 (or (= (bvand lt!305638 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!305636 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!305638 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!305638 lt!305636) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66489 (= lt!305636 (remainingBits!0 ((_ sign_extend 32) (size!4442 (buf!4928 (_2!9141 lt!305534)))) ((_ sign_extend 32) (currentByte!9248 (_2!9141 lt!305534))) ((_ sign_extend 32) (currentBit!9243 (_2!9141 lt!305534)))))))

(declare-fun lt!305639 () (_ BitVec 64))

(declare-fun lt!305640 () (_ BitVec 64))

(assert (=> d!66489 (= lt!305638 (bvmul lt!305639 lt!305640))))

(assert (=> d!66489 (or (= lt!305639 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!305640 (bvsdiv (bvmul lt!305639 lt!305640) lt!305639)))))

(assert (=> d!66489 (= lt!305640 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66489 (= lt!305639 ((_ sign_extend 32) (size!4442 (buf!4928 (_2!9141 lt!305534)))))))

(assert (=> d!66489 (= lt!305637 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9248 (_2!9141 lt!305534))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9243 (_2!9141 lt!305534)))))))

(assert (=> d!66489 (invariant!0 (currentBit!9243 (_2!9141 lt!305534)) (currentByte!9248 (_2!9141 lt!305534)) (size!4442 (buf!4928 (_2!9141 lt!305534))))))

(assert (=> d!66489 (= (bitIndex!0 (size!4442 (buf!4928 (_2!9141 lt!305534))) (currentByte!9248 (_2!9141 lt!305534)) (currentBit!9243 (_2!9141 lt!305534))) lt!305637)))

(declare-fun b!196517 () Bool)

(declare-fun res!164439 () Bool)

(assert (=> b!196517 (=> (not res!164439) (not e!135050))))

(assert (=> b!196517 (= res!164439 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!305637))))

(declare-fun b!196518 () Bool)

(declare-fun lt!305641 () (_ BitVec 64))

(assert (=> b!196518 (= e!135050 (bvsle lt!305637 (bvmul lt!305641 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!196518 (or (= lt!305641 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!305641 #b0000000000000000000000000000000000000000000000000000000000001000) lt!305641)))))

(assert (=> b!196518 (= lt!305641 ((_ sign_extend 32) (size!4442 (buf!4928 (_2!9141 lt!305534)))))))

(assert (= (and d!66489 res!164438) b!196517))

(assert (= (and b!196517 res!164439) b!196518))

(declare-fun m!303941 () Bool)

(assert (=> d!66489 m!303941))

(assert (=> d!66489 m!303859))

(assert (=> b!196430 d!66489))

(declare-fun d!66491 () Bool)

(declare-fun res!164453 () Bool)

(declare-fun e!135059 () Bool)

(assert (=> d!66491 (=> (not res!164453) (not e!135059))))

(assert (=> d!66491 (= res!164453 (= (size!4442 (buf!4928 thiss!1204)) (size!4442 (buf!4928 (_2!9141 lt!305534)))))))

(assert (=> d!66491 (= (isPrefixOf!0 thiss!1204 (_2!9141 lt!305534)) e!135059)))

(declare-fun b!196531 () Bool)

(declare-fun res!164452 () Bool)

(assert (=> b!196531 (=> (not res!164452) (not e!135059))))

(assert (=> b!196531 (= res!164452 (bvsle (bitIndex!0 (size!4442 (buf!4928 thiss!1204)) (currentByte!9248 thiss!1204) (currentBit!9243 thiss!1204)) (bitIndex!0 (size!4442 (buf!4928 (_2!9141 lt!305534))) (currentByte!9248 (_2!9141 lt!305534)) (currentBit!9243 (_2!9141 lt!305534)))))))

(declare-fun b!196532 () Bool)

(declare-fun e!135058 () Bool)

(assert (=> b!196532 (= e!135059 e!135058)))

(declare-fun res!164454 () Bool)

(assert (=> b!196532 (=> res!164454 e!135058)))

(assert (=> b!196532 (= res!164454 (= (size!4442 (buf!4928 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!196533 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10075 array!10075 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!196533 (= e!135058 (arrayBitRangesEq!0 (buf!4928 thiss!1204) (buf!4928 (_2!9141 lt!305534)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4442 (buf!4928 thiss!1204)) (currentByte!9248 thiss!1204) (currentBit!9243 thiss!1204))))))

(assert (= (and d!66491 res!164453) b!196531))

(assert (= (and b!196531 res!164452) b!196532))

(assert (= (and b!196532 (not res!164454)) b!196533))

(assert (=> b!196531 m!303843))

(assert (=> b!196531 m!303829))

(assert (=> b!196533 m!303843))

(assert (=> b!196533 m!303843))

(declare-fun m!303945 () Bool)

(assert (=> b!196533 m!303945))

(assert (=> b!196430 d!66491))

(declare-fun d!66495 () Bool)

(assert (=> d!66495 (isPrefixOf!0 thiss!1204 (_2!9141 lt!305534))))

(declare-fun lt!305662 () Unit!13883)

(declare-fun choose!30 (BitStream!7992 BitStream!7992 BitStream!7992) Unit!13883)

(assert (=> d!66495 (= lt!305662 (choose!30 thiss!1204 (_2!9141 lt!305536) (_2!9141 lt!305534)))))

(assert (=> d!66495 (isPrefixOf!0 thiss!1204 (_2!9141 lt!305536))))

(assert (=> d!66495 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9141 lt!305536) (_2!9141 lt!305534)) lt!305662)))

(declare-fun bs!16519 () Bool)

(assert (= bs!16519 d!66495))

(assert (=> bs!16519 m!303831))

(declare-fun m!303947 () Bool)

(assert (=> bs!16519 m!303947))

(assert (=> bs!16519 m!303845))

(assert (=> b!196430 d!66495))

(declare-fun b!196705 () Bool)

(declare-fun e!135157 () Bool)

(declare-fun lt!306212 () tuple2!16994)

(declare-fun lt!306168 () tuple2!16994)

(assert (=> b!196705 (= e!135157 (= (_2!9142 lt!306212) (_2!9142 lt!306168)))))

(declare-fun b!196706 () Bool)

(declare-fun e!135164 () Bool)

(declare-fun e!135162 () Bool)

(assert (=> b!196706 (= e!135164 e!135162)))

(declare-fun res!164598 () Bool)

(assert (=> b!196706 (=> (not res!164598) (not e!135162))))

(declare-datatypes ((tuple2!17014 0))(
  ( (tuple2!17015 (_1!9152 BitStream!7992) (_2!9152 (_ BitVec 64))) )
))
(declare-fun lt!306191 () tuple2!17014)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!196706 (= res!164598 (= (_2!9152 lt!306191) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-datatypes ((tuple2!17016 0))(
  ( (tuple2!17017 (_1!9153 BitStream!7992) (_2!9153 BitStream!7992)) )
))
(declare-fun lt!306222 () tuple2!17016)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7992 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17014)

(assert (=> b!196706 (= lt!306191 (readNBitsLSBFirstsLoopPure!0 (_1!9153 lt!306222) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!306223 () Unit!13883)

(declare-fun lt!306170 () Unit!13883)

(assert (=> b!196706 (= lt!306223 lt!306170)))

(declare-fun lt!306179 () tuple2!16992)

(declare-fun lt!306196 () (_ BitVec 64))

(assert (=> b!196706 (validate_offset_bits!1 ((_ sign_extend 32) (size!4442 (buf!4928 (_2!9141 lt!306179)))) ((_ sign_extend 32) (currentByte!9248 (_2!9141 lt!305536))) ((_ sign_extend 32) (currentBit!9243 (_2!9141 lt!305536))) lt!306196)))

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7992 array!10075 (_ BitVec 64)) Unit!13883)

(assert (=> b!196706 (= lt!306170 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9141 lt!305536) (buf!4928 (_2!9141 lt!306179)) lt!306196))))

(declare-fun e!135163 () Bool)

(assert (=> b!196706 e!135163))

(declare-fun res!164604 () Bool)

(assert (=> b!196706 (=> (not res!164604) (not e!135163))))

(assert (=> b!196706 (= res!164604 (and (= (size!4442 (buf!4928 (_2!9141 lt!305536))) (size!4442 (buf!4928 (_2!9141 lt!306179)))) (bvsge lt!306196 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!196706 (= lt!306196 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!196706 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(declare-fun reader!0 (BitStream!7992 BitStream!7992) tuple2!17016)

(assert (=> b!196706 (= lt!306222 (reader!0 (_2!9141 lt!305536) (_2!9141 lt!306179)))))

(declare-fun b!196707 () Bool)

(declare-fun lt!306175 () tuple2!16994)

(declare-fun lt!306216 () tuple2!16992)

(assert (=> b!196707 (= lt!306175 (readBitPure!0 (readerFrom!0 (_2!9141 lt!306216) (currentBit!9243 (_2!9141 lt!305536)) (currentByte!9248 (_2!9141 lt!305536)))))))

(declare-fun lt!306189 () Bool)

(declare-fun res!164597 () Bool)

(assert (=> b!196707 (= res!164597 (and (= (_2!9142 lt!306175) lt!306189) (= (_1!9142 lt!306175) (_2!9141 lt!306216))))))

(declare-fun e!135156 () Bool)

(assert (=> b!196707 (=> (not res!164597) (not e!135156))))

(declare-fun e!135160 () Bool)

(assert (=> b!196707 (= e!135160 e!135156)))

(declare-fun b!196708 () Bool)

(declare-fun res!164596 () Bool)

(assert (=> b!196708 (= res!164596 (= (bitIndex!0 (size!4442 (buf!4928 (_2!9141 lt!306216))) (currentByte!9248 (_2!9141 lt!306216)) (currentBit!9243 (_2!9141 lt!306216))) (bvadd (bitIndex!0 (size!4442 (buf!4928 (_2!9141 lt!305536))) (currentByte!9248 (_2!9141 lt!305536)) (currentBit!9243 (_2!9141 lt!305536))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!196708 (=> (not res!164596) (not e!135160))))

(declare-fun b!196709 () Bool)

(declare-fun res!164600 () Bool)

(assert (=> b!196709 (=> (not res!164600) (not e!135164))))

(declare-fun lt!306202 () (_ BitVec 64))

(declare-fun lt!306211 () (_ BitVec 64))

(assert (=> b!196709 (= res!164600 (= (bitIndex!0 (size!4442 (buf!4928 (_2!9141 lt!306179))) (currentByte!9248 (_2!9141 lt!306179)) (currentBit!9243 (_2!9141 lt!306179))) (bvsub lt!306202 lt!306211)))))

(assert (=> b!196709 (or (= (bvand lt!306202 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!306211 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!306202 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!306202 lt!306211) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!196709 (= lt!306211 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!306192 () (_ BitVec 64))

(declare-fun lt!306218 () (_ BitVec 64))

(assert (=> b!196709 (= lt!306202 (bvadd lt!306192 lt!306218))))

(assert (=> b!196709 (or (not (= (bvand lt!306192 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!306218 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!306192 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!306192 lt!306218) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!196709 (= lt!306218 ((_ sign_extend 32) nBits!348))))

(assert (=> b!196709 (= lt!306192 (bitIndex!0 (size!4442 (buf!4928 (_2!9141 lt!305536))) (currentByte!9248 (_2!9141 lt!305536)) (currentBit!9243 (_2!9141 lt!305536))))))

(declare-fun call!3092 () Bool)

(declare-fun c!9792 () Bool)

(declare-fun bm!3089 () Bool)

(assert (=> bm!3089 (= call!3092 (isPrefixOf!0 (_2!9141 lt!305536) (ite c!9792 (_2!9141 lt!305536) (_2!9141 lt!306216))))))

(declare-fun b!196710 () Bool)

(assert (=> b!196710 (= e!135162 (= (_1!9152 lt!306191) (_2!9153 lt!306222)))))

(declare-fun b!196711 () Bool)

(declare-fun res!164605 () Bool)

(assert (=> b!196711 (= res!164605 call!3092)))

(assert (=> b!196711 (=> (not res!164605) (not e!135160))))

(declare-fun b!196712 () Bool)

(declare-fun e!135158 () tuple2!16992)

(declare-fun Unit!13907 () Unit!13883)

(assert (=> b!196712 (= e!135158 (tuple2!16993 Unit!13907 (_2!9141 lt!305536)))))

(declare-fun lt!306193 () Unit!13883)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7992) Unit!13883)

(assert (=> b!196712 (= lt!306193 (lemmaIsPrefixRefl!0 (_2!9141 lt!305536)))))

(assert (=> b!196712 call!3092))

(declare-fun lt!306195 () Unit!13883)

(assert (=> b!196712 (= lt!306195 lt!306193)))

(declare-fun b!196713 () Bool)

(declare-fun lt!306217 () tuple2!16992)

(assert (=> b!196713 (= e!135158 (tuple2!16993 (_1!9141 lt!306217) (_2!9141 lt!306217)))))

(assert (=> b!196713 (= lt!306189 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!196713 (= lt!306216 (appendBit!0 (_2!9141 lt!305536) lt!306189))))

(declare-fun res!164594 () Bool)

(assert (=> b!196713 (= res!164594 (= (size!4442 (buf!4928 (_2!9141 lt!305536))) (size!4442 (buf!4928 (_2!9141 lt!306216)))))))

(assert (=> b!196713 (=> (not res!164594) (not e!135160))))

(assert (=> b!196713 e!135160))

(declare-fun lt!306184 () tuple2!16992)

(assert (=> b!196713 (= lt!306184 lt!306216)))

(assert (=> b!196713 (= lt!306217 (appendBitsLSBFirstLoopTR!0 (_2!9141 lt!306184) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!306215 () Unit!13883)

(assert (=> b!196713 (= lt!306215 (lemmaIsPrefixTransitive!0 (_2!9141 lt!305536) (_2!9141 lt!306184) (_2!9141 lt!306217)))))

(assert (=> b!196713 (isPrefixOf!0 (_2!9141 lt!305536) (_2!9141 lt!306217))))

(declare-fun lt!306172 () Unit!13883)

(assert (=> b!196713 (= lt!306172 lt!306215)))

(assert (=> b!196713 (invariant!0 (currentBit!9243 (_2!9141 lt!305536)) (currentByte!9248 (_2!9141 lt!305536)) (size!4442 (buf!4928 (_2!9141 lt!306184))))))

(declare-fun lt!306200 () BitStream!7992)

(assert (=> b!196713 (= lt!306200 (BitStream!7993 (buf!4928 (_2!9141 lt!306184)) (currentByte!9248 (_2!9141 lt!305536)) (currentBit!9243 (_2!9141 lt!305536))))))

(assert (=> b!196713 (invariant!0 (currentBit!9243 lt!306200) (currentByte!9248 lt!306200) (size!4442 (buf!4928 (_2!9141 lt!306217))))))

(declare-fun lt!306178 () BitStream!7992)

(assert (=> b!196713 (= lt!306178 (BitStream!7993 (buf!4928 (_2!9141 lt!306217)) (currentByte!9248 lt!306200) (currentBit!9243 lt!306200)))))

(assert (=> b!196713 (= lt!306212 (readBitPure!0 lt!306200))))

(assert (=> b!196713 (= lt!306168 (readBitPure!0 lt!306178))))

(declare-fun lt!306214 () Unit!13883)

(declare-fun readBitPrefixLemma!0 (BitStream!7992 BitStream!7992) Unit!13883)

(assert (=> b!196713 (= lt!306214 (readBitPrefixLemma!0 lt!306200 (_2!9141 lt!306217)))))

(declare-fun res!164602 () Bool)

(assert (=> b!196713 (= res!164602 (= (bitIndex!0 (size!4442 (buf!4928 (_1!9142 lt!306212))) (currentByte!9248 (_1!9142 lt!306212)) (currentBit!9243 (_1!9142 lt!306212))) (bitIndex!0 (size!4442 (buf!4928 (_1!9142 lt!306168))) (currentByte!9248 (_1!9142 lt!306168)) (currentBit!9243 (_1!9142 lt!306168)))))))

(assert (=> b!196713 (=> (not res!164602) (not e!135157))))

(assert (=> b!196713 e!135157))

(declare-fun lt!306182 () Unit!13883)

(assert (=> b!196713 (= lt!306182 lt!306214)))

(declare-fun lt!306187 () tuple2!17016)

(assert (=> b!196713 (= lt!306187 (reader!0 (_2!9141 lt!305536) (_2!9141 lt!306217)))))

(declare-fun lt!306169 () tuple2!17016)

(assert (=> b!196713 (= lt!306169 (reader!0 (_2!9141 lt!306184) (_2!9141 lt!306217)))))

(declare-fun lt!306219 () tuple2!16994)

(assert (=> b!196713 (= lt!306219 (readBitPure!0 (_1!9153 lt!306187)))))

(assert (=> b!196713 (= (_2!9142 lt!306219) lt!306189)))

(declare-fun lt!306181 () Unit!13883)

(declare-fun Unit!13909 () Unit!13883)

(assert (=> b!196713 (= lt!306181 Unit!13909)))

(declare-fun lt!306174 () (_ BitVec 64))

(assert (=> b!196713 (= lt!306174 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!306171 () (_ BitVec 64))

(assert (=> b!196713 (= lt!306171 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!306208 () Unit!13883)

(assert (=> b!196713 (= lt!306208 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9141 lt!305536) (buf!4928 (_2!9141 lt!306217)) lt!306171))))

(assert (=> b!196713 (validate_offset_bits!1 ((_ sign_extend 32) (size!4442 (buf!4928 (_2!9141 lt!306217)))) ((_ sign_extend 32) (currentByte!9248 (_2!9141 lt!305536))) ((_ sign_extend 32) (currentBit!9243 (_2!9141 lt!305536))) lt!306171)))

(declare-fun lt!306204 () Unit!13883)

(assert (=> b!196713 (= lt!306204 lt!306208)))

(declare-fun lt!306190 () tuple2!17014)

(assert (=> b!196713 (= lt!306190 (readNBitsLSBFirstsLoopPure!0 (_1!9153 lt!306187) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!306174))))

(declare-fun lt!306180 () (_ BitVec 64))

(assert (=> b!196713 (= lt!306180 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!306198 () Unit!13883)

(assert (=> b!196713 (= lt!306198 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9141 lt!306184) (buf!4928 (_2!9141 lt!306217)) lt!306180))))

(assert (=> b!196713 (validate_offset_bits!1 ((_ sign_extend 32) (size!4442 (buf!4928 (_2!9141 lt!306217)))) ((_ sign_extend 32) (currentByte!9248 (_2!9141 lt!306184))) ((_ sign_extend 32) (currentBit!9243 (_2!9141 lt!306184))) lt!306180)))

(declare-fun lt!306176 () Unit!13883)

(assert (=> b!196713 (= lt!306176 lt!306198)))

(declare-fun lt!306210 () tuple2!17014)

(assert (=> b!196713 (= lt!306210 (readNBitsLSBFirstsLoopPure!0 (_1!9153 lt!306169) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!306174 (ite (_2!9142 lt!306219) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!306186 () tuple2!17014)

(assert (=> b!196713 (= lt!306186 (readNBitsLSBFirstsLoopPure!0 (_1!9153 lt!306187) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!306174))))

(declare-fun c!9793 () Bool)

(assert (=> b!196713 (= c!9793 (_2!9142 (readBitPure!0 (_1!9153 lt!306187))))))

(declare-fun e!135161 () (_ BitVec 64))

(declare-fun lt!306207 () tuple2!17014)

(declare-fun withMovedBitIndex!0 (BitStream!7992 (_ BitVec 64)) BitStream!7992)

(assert (=> b!196713 (= lt!306207 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9153 lt!306187) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!306174 e!135161)))))

(declare-fun lt!306201 () Unit!13883)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7992 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13883)

(assert (=> b!196713 (= lt!306201 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9153 lt!306187) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!306174))))

(assert (=> b!196713 (and (= (_2!9152 lt!306186) (_2!9152 lt!306207)) (= (_1!9152 lt!306186) (_1!9152 lt!306207)))))

(declare-fun lt!306177 () Unit!13883)

(assert (=> b!196713 (= lt!306177 lt!306201)))

(assert (=> b!196713 (= (_1!9153 lt!306187) (withMovedBitIndex!0 (_2!9153 lt!306187) (bvsub (bitIndex!0 (size!4442 (buf!4928 (_2!9141 lt!305536))) (currentByte!9248 (_2!9141 lt!305536)) (currentBit!9243 (_2!9141 lt!305536))) (bitIndex!0 (size!4442 (buf!4928 (_2!9141 lt!306217))) (currentByte!9248 (_2!9141 lt!306217)) (currentBit!9243 (_2!9141 lt!306217))))))))

(declare-fun lt!306173 () Unit!13883)

(declare-fun Unit!13911 () Unit!13883)

(assert (=> b!196713 (= lt!306173 Unit!13911)))

(assert (=> b!196713 (= (_1!9153 lt!306169) (withMovedBitIndex!0 (_2!9153 lt!306169) (bvsub (bitIndex!0 (size!4442 (buf!4928 (_2!9141 lt!306184))) (currentByte!9248 (_2!9141 lt!306184)) (currentBit!9243 (_2!9141 lt!306184))) (bitIndex!0 (size!4442 (buf!4928 (_2!9141 lt!306217))) (currentByte!9248 (_2!9141 lt!306217)) (currentBit!9243 (_2!9141 lt!306217))))))))

(declare-fun lt!306213 () Unit!13883)

(declare-fun Unit!13912 () Unit!13883)

(assert (=> b!196713 (= lt!306213 Unit!13912)))

(assert (=> b!196713 (= (bitIndex!0 (size!4442 (buf!4928 (_2!9141 lt!305536))) (currentByte!9248 (_2!9141 lt!305536)) (currentBit!9243 (_2!9141 lt!305536))) (bvsub (bitIndex!0 (size!4442 (buf!4928 (_2!9141 lt!306184))) (currentByte!9248 (_2!9141 lt!306184)) (currentBit!9243 (_2!9141 lt!306184))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!306185 () Unit!13883)

(declare-fun Unit!13913 () Unit!13883)

(assert (=> b!196713 (= lt!306185 Unit!13913)))

(assert (=> b!196713 (= (_2!9152 lt!306190) (_2!9152 lt!306210))))

(declare-fun lt!306167 () Unit!13883)

(declare-fun Unit!13914 () Unit!13883)

(assert (=> b!196713 (= lt!306167 Unit!13914)))

(assert (=> b!196713 (invariant!0 (currentBit!9243 (_2!9141 lt!306217)) (currentByte!9248 (_2!9141 lt!306217)) (size!4442 (buf!4928 (_2!9141 lt!306217))))))

(declare-fun lt!306199 () Unit!13883)

(declare-fun Unit!13915 () Unit!13883)

(assert (=> b!196713 (= lt!306199 Unit!13915)))

(assert (=> b!196713 (= (size!4442 (buf!4928 (_2!9141 lt!305536))) (size!4442 (buf!4928 (_2!9141 lt!306217))))))

(declare-fun lt!306166 () Unit!13883)

(declare-fun Unit!13916 () Unit!13883)

(assert (=> b!196713 (= lt!306166 Unit!13916)))

(assert (=> b!196713 (= (bitIndex!0 (size!4442 (buf!4928 (_2!9141 lt!306217))) (currentByte!9248 (_2!9141 lt!306217)) (currentBit!9243 (_2!9141 lt!306217))) (bvsub (bvadd (bitIndex!0 (size!4442 (buf!4928 (_2!9141 lt!305536))) (currentByte!9248 (_2!9141 lt!305536)) (currentBit!9243 (_2!9141 lt!305536))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!306183 () Unit!13883)

(declare-fun Unit!13917 () Unit!13883)

(assert (=> b!196713 (= lt!306183 Unit!13917)))

(declare-fun lt!306220 () Unit!13883)

(declare-fun Unit!13918 () Unit!13883)

(assert (=> b!196713 (= lt!306220 Unit!13918)))

(declare-fun lt!306197 () tuple2!17016)

(assert (=> b!196713 (= lt!306197 (reader!0 (_2!9141 lt!305536) (_2!9141 lt!306217)))))

(declare-fun lt!306194 () (_ BitVec 64))

(assert (=> b!196713 (= lt!306194 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!306221 () Unit!13883)

(assert (=> b!196713 (= lt!306221 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9141 lt!305536) (buf!4928 (_2!9141 lt!306217)) lt!306194))))

(assert (=> b!196713 (validate_offset_bits!1 ((_ sign_extend 32) (size!4442 (buf!4928 (_2!9141 lt!306217)))) ((_ sign_extend 32) (currentByte!9248 (_2!9141 lt!305536))) ((_ sign_extend 32) (currentBit!9243 (_2!9141 lt!305536))) lt!306194)))

(declare-fun lt!306206 () Unit!13883)

(assert (=> b!196713 (= lt!306206 lt!306221)))

(declare-fun lt!306209 () tuple2!17014)

(assert (=> b!196713 (= lt!306209 (readNBitsLSBFirstsLoopPure!0 (_1!9153 lt!306197) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!164599 () Bool)

(assert (=> b!196713 (= res!164599 (= (_2!9152 lt!306209) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun e!135159 () Bool)

(assert (=> b!196713 (=> (not res!164599) (not e!135159))))

(assert (=> b!196713 e!135159))

(declare-fun lt!306188 () Unit!13883)

(declare-fun Unit!13919 () Unit!13883)

(assert (=> b!196713 (= lt!306188 Unit!13919)))

(declare-fun d!66497 () Bool)

(assert (=> d!66497 e!135164))

(declare-fun res!164603 () Bool)

(assert (=> d!66497 (=> (not res!164603) (not e!135164))))

(assert (=> d!66497 (= res!164603 (invariant!0 (currentBit!9243 (_2!9141 lt!306179)) (currentByte!9248 (_2!9141 lt!306179)) (size!4442 (buf!4928 (_2!9141 lt!306179)))))))

(assert (=> d!66497 (= lt!306179 e!135158)))

(assert (=> d!66497 (= c!9792 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!66497 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!66497 (= (appendBitsLSBFirstLoopTR!0 (_2!9141 lt!305536) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!306179)))

(declare-fun b!196714 () Bool)

(declare-fun res!164601 () Bool)

(assert (=> b!196714 (=> (not res!164601) (not e!135164))))

(assert (=> b!196714 (= res!164601 (isPrefixOf!0 (_2!9141 lt!305536) (_2!9141 lt!306179)))))

(declare-fun b!196715 () Bool)

(assert (=> b!196715 (= e!135163 (validate_offset_bits!1 ((_ sign_extend 32) (size!4442 (buf!4928 (_2!9141 lt!305536)))) ((_ sign_extend 32) (currentByte!9248 (_2!9141 lt!305536))) ((_ sign_extend 32) (currentBit!9243 (_2!9141 lt!305536))) lt!306196))))

(declare-fun b!196716 () Bool)

(assert (=> b!196716 (= e!135161 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!196717 () Bool)

(assert (=> b!196717 (= e!135156 (= (bitIndex!0 (size!4442 (buf!4928 (_1!9142 lt!306175))) (currentByte!9248 (_1!9142 lt!306175)) (currentBit!9243 (_1!9142 lt!306175))) (bitIndex!0 (size!4442 (buf!4928 (_2!9141 lt!306216))) (currentByte!9248 (_2!9141 lt!306216)) (currentBit!9243 (_2!9141 lt!306216)))))))

(declare-fun b!196718 () Bool)

(assert (=> b!196718 (= e!135161 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!196719 () Bool)

(assert (=> b!196719 (= e!135159 (= (_1!9152 lt!306209) (_2!9153 lt!306197)))))

(declare-fun b!196720 () Bool)

(declare-fun res!164595 () Bool)

(assert (=> b!196720 (=> (not res!164595) (not e!135164))))

(assert (=> b!196720 (= res!164595 (= (size!4442 (buf!4928 (_2!9141 lt!305536))) (size!4442 (buf!4928 (_2!9141 lt!306179)))))))

(assert (= (and d!66497 c!9792) b!196712))

(assert (= (and d!66497 (not c!9792)) b!196713))

(assert (= (and b!196713 res!164594) b!196708))

(assert (= (and b!196708 res!164596) b!196711))

(assert (= (and b!196711 res!164605) b!196707))

(assert (= (and b!196707 res!164597) b!196717))

(assert (= (and b!196713 res!164602) b!196705))

(assert (= (and b!196713 c!9793) b!196716))

(assert (= (and b!196713 (not c!9793)) b!196718))

(assert (= (and b!196713 res!164599) b!196719))

(assert (= (or b!196712 b!196711) bm!3089))

(assert (= (and d!66497 res!164603) b!196720))

(assert (= (and b!196720 res!164595) b!196709))

(assert (= (and b!196709 res!164600) b!196714))

(assert (= (and b!196714 res!164601) b!196706))

(assert (= (and b!196706 res!164604) b!196715))

(assert (= (and b!196706 res!164598) b!196710))

(declare-fun m!304173 () Bool)

(assert (=> b!196712 m!304173))

(declare-fun m!304175 () Bool)

(assert (=> b!196707 m!304175))

(assert (=> b!196707 m!304175))

(declare-fun m!304177 () Bool)

(assert (=> b!196707 m!304177))

(declare-fun m!304179 () Bool)

(assert (=> b!196717 m!304179))

(declare-fun m!304181 () Bool)

(assert (=> b!196717 m!304181))

(assert (=> b!196708 m!304181))

(assert (=> b!196708 m!303841))

(declare-fun m!304183 () Bool)

(assert (=> b!196709 m!304183))

(assert (=> b!196709 m!303841))

(declare-fun m!304185 () Bool)

(assert (=> bm!3089 m!304185))

(declare-fun m!304189 () Bool)

(assert (=> b!196713 m!304189))

(declare-fun m!304193 () Bool)

(assert (=> b!196713 m!304193))

(declare-fun m!304197 () Bool)

(assert (=> b!196713 m!304197))

(declare-fun m!304199 () Bool)

(assert (=> b!196713 m!304199))

(declare-fun m!304203 () Bool)

(assert (=> b!196713 m!304203))

(declare-fun m!304205 () Bool)

(assert (=> b!196713 m!304205))

(declare-fun m!304209 () Bool)

(assert (=> b!196713 m!304209))

(declare-fun m!304211 () Bool)

(assert (=> b!196713 m!304211))

(declare-fun m!304213 () Bool)

(assert (=> b!196713 m!304213))

(declare-fun m!304217 () Bool)

(assert (=> b!196713 m!304217))

(declare-fun m!304221 () Bool)

(assert (=> b!196713 m!304221))

(declare-fun m!304223 () Bool)

(assert (=> b!196713 m!304223))

(declare-fun m!304225 () Bool)

(assert (=> b!196713 m!304225))

(declare-fun m!304227 () Bool)

(assert (=> b!196713 m!304227))

(declare-fun m!304229 () Bool)

(assert (=> b!196713 m!304229))

(declare-fun m!304231 () Bool)

(assert (=> b!196713 m!304231))

(declare-fun m!304233 () Bool)

(assert (=> b!196713 m!304233))

(declare-fun m!304235 () Bool)

(assert (=> b!196713 m!304235))

(assert (=> b!196713 m!303841))

(declare-fun m!304237 () Bool)

(assert (=> b!196713 m!304237))

(declare-fun m!304239 () Bool)

(assert (=> b!196713 m!304239))

(declare-fun m!304241 () Bool)

(assert (=> b!196713 m!304241))

(declare-fun m!304243 () Bool)

(assert (=> b!196713 m!304243))

(declare-fun m!304245 () Bool)

(assert (=> b!196713 m!304245))

(assert (=> b!196713 m!304233))

(declare-fun m!304247 () Bool)

(assert (=> b!196713 m!304247))

(declare-fun m!304249 () Bool)

(assert (=> b!196713 m!304249))

(declare-fun m!304251 () Bool)

(assert (=> b!196713 m!304251))

(declare-fun m!304253 () Bool)

(assert (=> b!196713 m!304253))

(declare-fun m!304255 () Bool)

(assert (=> b!196713 m!304255))

(declare-fun m!304257 () Bool)

(assert (=> b!196713 m!304257))

(declare-fun m!304259 () Bool)

(assert (=> b!196713 m!304259))

(declare-fun m!304261 () Bool)

(assert (=> b!196713 m!304261))

(declare-fun m!304263 () Bool)

(assert (=> b!196713 m!304263))

(declare-fun m!304265 () Bool)

(assert (=> b!196713 m!304265))

(declare-fun m!304267 () Bool)

(assert (=> b!196706 m!304267))

(declare-fun m!304269 () Bool)

(assert (=> b!196706 m!304269))

(declare-fun m!304271 () Bool)

(assert (=> b!196706 m!304271))

(declare-fun m!304273 () Bool)

(assert (=> b!196706 m!304273))

(assert (=> b!196706 m!304209))

(assert (=> b!196706 m!304265))

(declare-fun m!304275 () Bool)

(assert (=> d!66497 m!304275))

(declare-fun m!304277 () Bool)

(assert (=> b!196715 m!304277))

(declare-fun m!304279 () Bool)

(assert (=> b!196714 m!304279))

(assert (=> b!196430 d!66497))

(declare-fun d!66537 () Bool)

(declare-fun res!164615 () Bool)

(declare-fun e!135170 () Bool)

(assert (=> d!66537 (=> (not res!164615) (not e!135170))))

(assert (=> d!66537 (= res!164615 (= (size!4442 (buf!4928 thiss!1204)) (size!4442 (buf!4928 (_2!9141 lt!305536)))))))

(assert (=> d!66537 (= (isPrefixOf!0 thiss!1204 (_2!9141 lt!305536)) e!135170)))

(declare-fun b!196731 () Bool)

(declare-fun res!164614 () Bool)

(assert (=> b!196731 (=> (not res!164614) (not e!135170))))

(assert (=> b!196731 (= res!164614 (bvsle (bitIndex!0 (size!4442 (buf!4928 thiss!1204)) (currentByte!9248 thiss!1204) (currentBit!9243 thiss!1204)) (bitIndex!0 (size!4442 (buf!4928 (_2!9141 lt!305536))) (currentByte!9248 (_2!9141 lt!305536)) (currentBit!9243 (_2!9141 lt!305536)))))))

(declare-fun b!196732 () Bool)

(declare-fun e!135169 () Bool)

(assert (=> b!196732 (= e!135170 e!135169)))

(declare-fun res!164616 () Bool)

(assert (=> b!196732 (=> res!164616 e!135169)))

(assert (=> b!196732 (= res!164616 (= (size!4442 (buf!4928 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!196733 () Bool)

(assert (=> b!196733 (= e!135169 (arrayBitRangesEq!0 (buf!4928 thiss!1204) (buf!4928 (_2!9141 lt!305536)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4442 (buf!4928 thiss!1204)) (currentByte!9248 thiss!1204) (currentBit!9243 thiss!1204))))))

(assert (= (and d!66537 res!164615) b!196731))

(assert (= (and b!196731 res!164614) b!196732))

(assert (= (and b!196732 (not res!164616)) b!196733))

(assert (=> b!196731 m!303843))

(assert (=> b!196731 m!303841))

(assert (=> b!196733 m!303843))

(assert (=> b!196733 m!303843))

(declare-fun m!304281 () Bool)

(assert (=> b!196733 m!304281))

(assert (=> b!196425 d!66537))

(declare-fun d!66539 () Bool)

(assert (=> d!66539 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9243 thiss!1204) (currentByte!9248 thiss!1204) (size!4442 (buf!4928 thiss!1204))))))

(declare-fun bs!16523 () Bool)

(assert (= bs!16523 d!66539))

(assert (=> bs!16523 m!303839))

(assert (=> start!41764 d!66539))

(check-sat (not d!66477) (not b!196533) (not b!196715) (not b!196733) (not b!196713) (not b!196731) (not d!66487) (not b!196714) (not d!66489) (not d!66459) (not b!196531) (not d!66455) (not d!66457) (not b!196513) (not bm!3089) (not b!196709) (not b!196512) (not d!66449) (not d!66539) (not b!196707) (not b!196708) (not b!196511) (not b!196706) (not d!66483) (not d!66495) (not b!196510) (not d!66497) (not b!196516) (not b!196712) (not b!196717))
