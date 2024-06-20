; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29802 () Bool)

(assert start!29802)

(declare-fun b!153535 () Bool)

(declare-fun res!128579 () Bool)

(declare-fun e!102968 () Bool)

(assert (=> b!153535 (=> (not res!128579) (not e!102968))))

(declare-fun lt!239819 () (_ BitVec 64))

(declare-datatypes ((array!6913 0))(
  ( (array!6914 (arr!3942 (Array (_ BitVec 32) (_ BitVec 8))) (size!3119 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5496 0))(
  ( (BitStream!5497 (buf!3622 array!6913) (currentByte!6614 (_ BitVec 32)) (currentBit!6609 (_ BitVec 32))) )
))
(declare-fun bs1!10 () BitStream!5496)

(declare-fun bs2!18 () BitStream!5496)

(declare-fun arrayBitRangesEq!0 (array!6913 array!6913 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!153535 (= res!128579 (arrayBitRangesEq!0 (buf!3622 bs1!10) (buf!3622 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!239819))))

(declare-fun b!153536 () Bool)

(declare-fun e!102966 () Bool)

(declare-fun array_inv!2908 (array!6913) Bool)

(assert (=> b!153536 (= e!102966 (array_inv!2908 (buf!3622 bs2!18)))))

(declare-fun b!153537 () Bool)

(declare-fun res!128581 () Bool)

(declare-fun e!102965 () Bool)

(assert (=> b!153537 (=> (not res!128581) (not e!102965))))

(declare-fun lt!239822 () (_ BitVec 32))

(declare-fun arrayRangesEq!381 (array!6913 array!6913 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!153537 (= res!128581 (arrayRangesEq!381 (buf!3622 bs1!10) (buf!3622 bs2!18) #b00000000000000000000000000000000 lt!239822))))

(declare-fun b!153538 () Bool)

(declare-fun res!128580 () Bool)

(assert (=> b!153538 (=> (not res!128580) (not e!102968))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!153538 (= res!128580 (bvsle lt!239819 (bitIndex!0 (size!3119 (buf!3622 bs2!18)) (currentByte!6614 bs2!18) (currentBit!6609 bs2!18))))))

(declare-fun b!153539 () Bool)

(declare-datatypes ((tuple2!13626 0))(
  ( (tuple2!13627 (_1!7203 BitStream!5496) (_2!7203 (_ BitVec 8))) )
))
(declare-fun lt!239820 () tuple2!13626)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!153539 (= e!102965 (not (invariant!0 (currentBit!6609 (_1!7203 lt!239820)) (currentByte!6614 (_1!7203 lt!239820)) (size!3119 (buf!3622 (_1!7203 lt!239820))))))))

(assert (=> b!153539 (= (select (arr!3942 (buf!3622 bs1!10)) (currentByte!6614 bs1!10)) (select (arr!3942 (buf!3622 bs2!18)) (currentByte!6614 bs1!10)))))

(declare-datatypes ((Unit!9693 0))(
  ( (Unit!9694) )
))
(declare-fun lt!239824 () Unit!9693)

(declare-fun arrayRangesEqImpliesEq!22 (array!6913 array!6913 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9693)

(assert (=> b!153539 (= lt!239824 (arrayRangesEqImpliesEq!22 (buf!3622 bs1!10) (buf!3622 bs2!18) #b00000000000000000000000000000000 (currentByte!6614 bs1!10) lt!239822))))

(declare-fun b!153541 () Bool)

(declare-fun e!102967 () Bool)

(assert (=> b!153541 (= e!102967 e!102968)))

(declare-fun res!128582 () Bool)

(assert (=> b!153541 (=> (not res!128582) (not e!102968))))

(assert (=> b!153541 (= res!128582 (bvsle lt!239819 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3119 (buf!3622 bs1!10))))))))

(declare-fun lt!239821 () (_ BitVec 64))

(assert (=> b!153541 (= lt!239819 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!239821))))

(assert (=> b!153541 (= lt!239821 (bitIndex!0 (size!3119 (buf!3622 bs1!10)) (currentByte!6614 bs1!10) (currentBit!6609 bs1!10)))))

(declare-fun b!153542 () Bool)

(declare-fun e!102969 () Bool)

(assert (=> b!153542 (= e!102969 (array_inv!2908 (buf!3622 bs1!10)))))

(declare-fun b!153540 () Bool)

(assert (=> b!153540 (= e!102968 e!102965)))

(declare-fun res!128578 () Bool)

(assert (=> b!153540 (=> (not res!128578) (not e!102965))))

(assert (=> b!153540 (= res!128578 (and (bvsle #b00000000000000000000000000000000 lt!239822) (bvsle lt!239822 (size!3119 (buf!3622 bs1!10))) (bvsle #b00000000000000000000000000000000 (currentByte!6614 bs1!10)) (bvslt (currentByte!6614 bs1!10) lt!239822)))))

(assert (=> b!153540 (= lt!239822 ((_ extract 31 0) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bvsdiv lt!239821 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!239823 () tuple2!13626)

(declare-fun readBytePure!0 (BitStream!5496) tuple2!13626)

(assert (=> b!153540 (= lt!239823 (readBytePure!0 (BitStream!5497 (buf!3622 bs2!18) (currentByte!6614 bs1!10) (currentBit!6609 bs1!10))))))

(assert (=> b!153540 (= lt!239820 (readBytePure!0 bs1!10))))

(declare-fun res!128583 () Bool)

(assert (=> start!29802 (=> (not res!128583) (not e!102967))))

(assert (=> start!29802 (= res!128583 (= (size!3119 (buf!3622 bs1!10)) (size!3119 (buf!3622 bs2!18))))))

(assert (=> start!29802 e!102967))

(declare-fun inv!12 (BitStream!5496) Bool)

(assert (=> start!29802 (and (inv!12 bs1!10) e!102969)))

(assert (=> start!29802 (and (inv!12 bs2!18) e!102966)))

(assert (= (and start!29802 res!128583) b!153541))

(assert (= (and b!153541 res!128582) b!153538))

(assert (= (and b!153538 res!128580) b!153535))

(assert (= (and b!153535 res!128579) b!153540))

(assert (= (and b!153540 res!128578) b!153537))

(assert (= (and b!153537 res!128581) b!153539))

(assert (= start!29802 b!153542))

(assert (= start!29802 b!153536))

(declare-fun m!239339 () Bool)

(assert (=> start!29802 m!239339))

(declare-fun m!239341 () Bool)

(assert (=> start!29802 m!239341))

(declare-fun m!239343 () Bool)

(assert (=> b!153535 m!239343))

(declare-fun m!239345 () Bool)

(assert (=> b!153541 m!239345))

(declare-fun m!239347 () Bool)

(assert (=> b!153539 m!239347))

(declare-fun m!239349 () Bool)

(assert (=> b!153539 m!239349))

(declare-fun m!239351 () Bool)

(assert (=> b!153539 m!239351))

(declare-fun m!239353 () Bool)

(assert (=> b!153539 m!239353))

(declare-fun m!239355 () Bool)

(assert (=> b!153536 m!239355))

(declare-fun m!239357 () Bool)

(assert (=> b!153538 m!239357))

(declare-fun m!239359 () Bool)

(assert (=> b!153540 m!239359))

(declare-fun m!239361 () Bool)

(assert (=> b!153540 m!239361))

(declare-fun m!239363 () Bool)

(assert (=> b!153537 m!239363))

(declare-fun m!239365 () Bool)

(assert (=> b!153542 m!239365))

(check-sat (not b!153535) (not b!153541) (not b!153539) (not b!153540) (not b!153536) (not start!29802) (not b!153537) (not b!153542) (not b!153538))
(check-sat)
(get-model)

(declare-fun d!50438 () Bool)

(assert (=> d!50438 (= (array_inv!2908 (buf!3622 bs2!18)) (bvsge (size!3119 (buf!3622 bs2!18)) #b00000000000000000000000000000000))))

(assert (=> b!153536 d!50438))

(declare-fun d!50440 () Bool)

(assert (=> d!50440 (= (inv!12 bs1!10) (invariant!0 (currentBit!6609 bs1!10) (currentByte!6614 bs1!10) (size!3119 (buf!3622 bs1!10))))))

(declare-fun bs!12347 () Bool)

(assert (= bs!12347 d!50440))

(declare-fun m!239395 () Bool)

(assert (=> bs!12347 m!239395))

(assert (=> start!29802 d!50440))

(declare-fun d!50442 () Bool)

(assert (=> d!50442 (= (inv!12 bs2!18) (invariant!0 (currentBit!6609 bs2!18) (currentByte!6614 bs2!18) (size!3119 (buf!3622 bs2!18))))))

(declare-fun bs!12348 () Bool)

(assert (= bs!12348 d!50442))

(declare-fun m!239397 () Bool)

(assert (=> bs!12348 m!239397))

(assert (=> start!29802 d!50442))

(declare-fun d!50444 () Bool)

(declare-fun e!102993 () Bool)

(assert (=> d!50444 e!102993))

(declare-fun res!128607 () Bool)

(assert (=> d!50444 (=> (not res!128607) (not e!102993))))

(declare-fun lt!239855 () (_ BitVec 64))

(declare-fun lt!239856 () (_ BitVec 64))

(declare-fun lt!239860 () (_ BitVec 64))

(assert (=> d!50444 (= res!128607 (= lt!239855 (bvsub lt!239856 lt!239860)))))

(assert (=> d!50444 (or (= (bvand lt!239856 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!239860 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!239856 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!239856 lt!239860) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!50444 (= lt!239860 (remainingBits!0 ((_ sign_extend 32) (size!3119 (buf!3622 bs1!10))) ((_ sign_extend 32) (currentByte!6614 bs1!10)) ((_ sign_extend 32) (currentBit!6609 bs1!10))))))

(declare-fun lt!239857 () (_ BitVec 64))

(declare-fun lt!239859 () (_ BitVec 64))

(assert (=> d!50444 (= lt!239856 (bvmul lt!239857 lt!239859))))

(assert (=> d!50444 (or (= lt!239857 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!239859 (bvsdiv (bvmul lt!239857 lt!239859) lt!239857)))))

(assert (=> d!50444 (= lt!239859 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!50444 (= lt!239857 ((_ sign_extend 32) (size!3119 (buf!3622 bs1!10))))))

(assert (=> d!50444 (= lt!239855 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6614 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6609 bs1!10))))))

(assert (=> d!50444 (invariant!0 (currentBit!6609 bs1!10) (currentByte!6614 bs1!10) (size!3119 (buf!3622 bs1!10)))))

(assert (=> d!50444 (= (bitIndex!0 (size!3119 (buf!3622 bs1!10)) (currentByte!6614 bs1!10) (currentBit!6609 bs1!10)) lt!239855)))

(declare-fun b!153571 () Bool)

(declare-fun res!128606 () Bool)

(assert (=> b!153571 (=> (not res!128606) (not e!102993))))

(assert (=> b!153571 (= res!128606 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!239855))))

(declare-fun b!153572 () Bool)

(declare-fun lt!239858 () (_ BitVec 64))

(assert (=> b!153572 (= e!102993 (bvsle lt!239855 (bvmul lt!239858 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!153572 (or (= lt!239858 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!239858 #b0000000000000000000000000000000000000000000000000000000000001000) lt!239858)))))

(assert (=> b!153572 (= lt!239858 ((_ sign_extend 32) (size!3119 (buf!3622 bs1!10))))))

(assert (= (and d!50444 res!128607) b!153571))

(assert (= (and b!153571 res!128606) b!153572))

(declare-fun m!239399 () Bool)

(assert (=> d!50444 m!239399))

(assert (=> d!50444 m!239395))

(assert (=> b!153541 d!50444))

(declare-fun d!50446 () Bool)

(assert (=> d!50446 (= (array_inv!2908 (buf!3622 bs1!10)) (bvsge (size!3119 (buf!3622 bs1!10)) #b00000000000000000000000000000000))))

(assert (=> b!153542 d!50446))

(declare-fun d!50448 () Bool)

(declare-fun res!128612 () Bool)

(declare-fun e!102998 () Bool)

(assert (=> d!50448 (=> res!128612 e!102998)))

(assert (=> d!50448 (= res!128612 (= #b00000000000000000000000000000000 lt!239822))))

(assert (=> d!50448 (= (arrayRangesEq!381 (buf!3622 bs1!10) (buf!3622 bs2!18) #b00000000000000000000000000000000 lt!239822) e!102998)))

(declare-fun b!153577 () Bool)

(declare-fun e!102999 () Bool)

(assert (=> b!153577 (= e!102998 e!102999)))

(declare-fun res!128613 () Bool)

(assert (=> b!153577 (=> (not res!128613) (not e!102999))))

(assert (=> b!153577 (= res!128613 (= (select (arr!3942 (buf!3622 bs1!10)) #b00000000000000000000000000000000) (select (arr!3942 (buf!3622 bs2!18)) #b00000000000000000000000000000000)))))

(declare-fun b!153578 () Bool)

(assert (=> b!153578 (= e!102999 (arrayRangesEq!381 (buf!3622 bs1!10) (buf!3622 bs2!18) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!239822))))

(assert (= (and d!50448 (not res!128612)) b!153577))

(assert (= (and b!153577 res!128613) b!153578))

(declare-fun m!239401 () Bool)

(assert (=> b!153577 m!239401))

(declare-fun m!239403 () Bool)

(assert (=> b!153577 m!239403))

(declare-fun m!239405 () Bool)

(assert (=> b!153578 m!239405))

(assert (=> b!153537 d!50448))

(declare-fun d!50450 () Bool)

(assert (=> d!50450 (= (invariant!0 (currentBit!6609 (_1!7203 lt!239820)) (currentByte!6614 (_1!7203 lt!239820)) (size!3119 (buf!3622 (_1!7203 lt!239820)))) (and (bvsge (currentBit!6609 (_1!7203 lt!239820)) #b00000000000000000000000000000000) (bvslt (currentBit!6609 (_1!7203 lt!239820)) #b00000000000000000000000000001000) (bvsge (currentByte!6614 (_1!7203 lt!239820)) #b00000000000000000000000000000000) (or (bvslt (currentByte!6614 (_1!7203 lt!239820)) (size!3119 (buf!3622 (_1!7203 lt!239820)))) (and (= (currentBit!6609 (_1!7203 lt!239820)) #b00000000000000000000000000000000) (= (currentByte!6614 (_1!7203 lt!239820)) (size!3119 (buf!3622 (_1!7203 lt!239820))))))))))

(assert (=> b!153539 d!50450))

(declare-fun d!50452 () Bool)

(assert (=> d!50452 (and (bvsge (currentByte!6614 bs1!10) #b00000000000000000000000000000000) (bvslt (currentByte!6614 bs1!10) (size!3119 (buf!3622 bs1!10))) (bvslt (currentByte!6614 bs1!10) (size!3119 (buf!3622 bs2!18))) (= (select (arr!3942 (buf!3622 bs1!10)) (currentByte!6614 bs1!10)) (select (arr!3942 (buf!3622 bs2!18)) (currentByte!6614 bs1!10))))))

(declare-fun lt!239863 () Unit!9693)

(declare-fun choose!104 (array!6913 array!6913 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9693)

(assert (=> d!50452 (= lt!239863 (choose!104 (buf!3622 bs1!10) (buf!3622 bs2!18) #b00000000000000000000000000000000 (currentByte!6614 bs1!10) lt!239822))))

(assert (=> d!50452 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 lt!239822))))

(assert (=> d!50452 (= (arrayRangesEqImpliesEq!22 (buf!3622 bs1!10) (buf!3622 bs2!18) #b00000000000000000000000000000000 (currentByte!6614 bs1!10) lt!239822) lt!239863)))

(declare-fun bs!12349 () Bool)

(assert (= bs!12349 d!50452))

(assert (=> bs!12349 m!239349))

(assert (=> bs!12349 m!239351))

(declare-fun m!239407 () Bool)

(assert (=> bs!12349 m!239407))

(assert (=> b!153539 d!50452))

(declare-fun d!50454 () Bool)

(declare-fun e!103000 () Bool)

(assert (=> d!50454 e!103000))

(declare-fun res!128615 () Bool)

(assert (=> d!50454 (=> (not res!128615) (not e!103000))))

(declare-fun lt!239869 () (_ BitVec 64))

(declare-fun lt!239865 () (_ BitVec 64))

(declare-fun lt!239864 () (_ BitVec 64))

(assert (=> d!50454 (= res!128615 (= lt!239864 (bvsub lt!239865 lt!239869)))))

(assert (=> d!50454 (or (= (bvand lt!239865 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!239869 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!239865 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!239865 lt!239869) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!50454 (= lt!239869 (remainingBits!0 ((_ sign_extend 32) (size!3119 (buf!3622 bs2!18))) ((_ sign_extend 32) (currentByte!6614 bs2!18)) ((_ sign_extend 32) (currentBit!6609 bs2!18))))))

(declare-fun lt!239866 () (_ BitVec 64))

(declare-fun lt!239868 () (_ BitVec 64))

(assert (=> d!50454 (= lt!239865 (bvmul lt!239866 lt!239868))))

(assert (=> d!50454 (or (= lt!239866 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!239868 (bvsdiv (bvmul lt!239866 lt!239868) lt!239866)))))

(assert (=> d!50454 (= lt!239868 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!50454 (= lt!239866 ((_ sign_extend 32) (size!3119 (buf!3622 bs2!18))))))

(assert (=> d!50454 (= lt!239864 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6614 bs2!18)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6609 bs2!18))))))

(assert (=> d!50454 (invariant!0 (currentBit!6609 bs2!18) (currentByte!6614 bs2!18) (size!3119 (buf!3622 bs2!18)))))

(assert (=> d!50454 (= (bitIndex!0 (size!3119 (buf!3622 bs2!18)) (currentByte!6614 bs2!18) (currentBit!6609 bs2!18)) lt!239864)))

(declare-fun b!153579 () Bool)

(declare-fun res!128614 () Bool)

(assert (=> b!153579 (=> (not res!128614) (not e!103000))))

(assert (=> b!153579 (= res!128614 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!239864))))

(declare-fun b!153580 () Bool)

(declare-fun lt!239867 () (_ BitVec 64))

(assert (=> b!153580 (= e!103000 (bvsle lt!239864 (bvmul lt!239867 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!153580 (or (= lt!239867 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!239867 #b0000000000000000000000000000000000000000000000000000000000001000) lt!239867)))))

(assert (=> b!153580 (= lt!239867 ((_ sign_extend 32) (size!3119 (buf!3622 bs2!18))))))

(assert (= (and d!50454 res!128615) b!153579))

(assert (= (and b!153579 res!128614) b!153580))

(declare-fun m!239409 () Bool)

(assert (=> d!50454 m!239409))

(assert (=> d!50454 m!239397))

(assert (=> b!153538 d!50454))

(declare-fun d!50456 () Bool)

(declare-datatypes ((tuple2!13630 0))(
  ( (tuple2!13631 (_1!7205 (_ BitVec 8)) (_2!7205 BitStream!5496)) )
))
(declare-fun lt!239872 () tuple2!13630)

(declare-fun readByte!0 (BitStream!5496) tuple2!13630)

(assert (=> d!50456 (= lt!239872 (readByte!0 (BitStream!5497 (buf!3622 bs2!18) (currentByte!6614 bs1!10) (currentBit!6609 bs1!10))))))

(assert (=> d!50456 (= (readBytePure!0 (BitStream!5497 (buf!3622 bs2!18) (currentByte!6614 bs1!10) (currentBit!6609 bs1!10))) (tuple2!13627 (_2!7205 lt!239872) (_1!7205 lt!239872)))))

(declare-fun bs!12350 () Bool)

(assert (= bs!12350 d!50456))

(declare-fun m!239411 () Bool)

(assert (=> bs!12350 m!239411))

(assert (=> b!153540 d!50456))

(declare-fun d!50458 () Bool)

(declare-fun lt!239873 () tuple2!13630)

(assert (=> d!50458 (= lt!239873 (readByte!0 bs1!10))))

(assert (=> d!50458 (= (readBytePure!0 bs1!10) (tuple2!13627 (_2!7205 lt!239873) (_1!7205 lt!239873)))))

(declare-fun bs!12351 () Bool)

(assert (= bs!12351 d!50458))

(declare-fun m!239413 () Bool)

(assert (=> bs!12351 m!239413))

(assert (=> b!153540 d!50458))

(declare-fun b!153595 () Bool)

(declare-fun e!103015 () Bool)

(declare-fun e!103018 () Bool)

(assert (=> b!153595 (= e!103015 e!103018)))

(declare-fun c!8187 () Bool)

(declare-datatypes ((tuple4!174 0))(
  ( (tuple4!175 (_1!7206 (_ BitVec 32)) (_2!7206 (_ BitVec 32)) (_3!390 (_ BitVec 32)) (_4!87 (_ BitVec 32))) )
))
(declare-fun lt!239883 () tuple4!174)

(assert (=> b!153595 (= c!8187 (= (_3!390 lt!239883) (_4!87 lt!239883)))))

(declare-fun d!50460 () Bool)

(declare-fun res!128630 () Bool)

(declare-fun e!103017 () Bool)

(assert (=> d!50460 (=> res!128630 e!103017)))

(assert (=> d!50460 (= res!128630 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!239819))))

(assert (=> d!50460 (= (arrayBitRangesEq!0 (buf!3622 bs1!10) (buf!3622 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!239819) e!103017)))

(declare-fun b!153596 () Bool)

(declare-fun e!103016 () Bool)

(assert (=> b!153596 (= e!103018 e!103016)))

(declare-fun res!128629 () Bool)

(declare-fun lt!239885 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!153596 (= res!128629 (byteRangesEq!0 (select (arr!3942 (buf!3622 bs1!10)) (_3!390 lt!239883)) (select (arr!3942 (buf!3622 bs2!18)) (_3!390 lt!239883)) lt!239885 #b00000000000000000000000000001000))))

(assert (=> b!153596 (=> (not res!128629) (not e!103016))))

(declare-fun b!153597 () Bool)

(assert (=> b!153597 (= e!103017 e!103015)))

(declare-fun res!128628 () Bool)

(assert (=> b!153597 (=> (not res!128628) (not e!103015))))

(declare-fun e!103013 () Bool)

(assert (=> b!153597 (= res!128628 e!103013)))

(declare-fun res!128626 () Bool)

(assert (=> b!153597 (=> res!128626 e!103013)))

(assert (=> b!153597 (= res!128626 (bvsge (_1!7206 lt!239883) (_2!7206 lt!239883)))))

(declare-fun lt!239884 () (_ BitVec 32))

(assert (=> b!153597 (= lt!239884 ((_ extract 31 0) (bvsrem lt!239819 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!153597 (= lt!239885 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!174)

(assert (=> b!153597 (= lt!239883 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!239819))))

(declare-fun b!153598 () Bool)

(declare-fun e!103014 () Bool)

(declare-fun call!2171 () Bool)

(assert (=> b!153598 (= e!103014 call!2171)))

(declare-fun bm!2168 () Bool)

(assert (=> bm!2168 (= call!2171 (byteRangesEq!0 (ite c!8187 (select (arr!3942 (buf!3622 bs1!10)) (_3!390 lt!239883)) (select (arr!3942 (buf!3622 bs1!10)) (_4!87 lt!239883))) (ite c!8187 (select (arr!3942 (buf!3622 bs2!18)) (_3!390 lt!239883)) (select (arr!3942 (buf!3622 bs2!18)) (_4!87 lt!239883))) (ite c!8187 lt!239885 #b00000000000000000000000000000000) lt!239884))))

(declare-fun b!153599 () Bool)

(assert (=> b!153599 (= e!103013 (arrayRangesEq!381 (buf!3622 bs1!10) (buf!3622 bs2!18) (_1!7206 lt!239883) (_2!7206 lt!239883)))))

(declare-fun b!153600 () Bool)

(assert (=> b!153600 (= e!103018 call!2171)))

(declare-fun b!153601 () Bool)

(declare-fun res!128627 () Bool)

(assert (=> b!153601 (= res!128627 (= lt!239884 #b00000000000000000000000000000000))))

(assert (=> b!153601 (=> res!128627 e!103014)))

(assert (=> b!153601 (= e!103016 e!103014)))

(assert (= (and d!50460 (not res!128630)) b!153597))

(assert (= (and b!153597 (not res!128626)) b!153599))

(assert (= (and b!153597 res!128628) b!153595))

(assert (= (and b!153595 c!8187) b!153600))

(assert (= (and b!153595 (not c!8187)) b!153596))

(assert (= (and b!153596 res!128629) b!153601))

(assert (= (and b!153601 (not res!128627)) b!153598))

(assert (= (or b!153600 b!153598) bm!2168))

(declare-fun m!239417 () Bool)

(assert (=> b!153596 m!239417))

(declare-fun m!239419 () Bool)

(assert (=> b!153596 m!239419))

(assert (=> b!153596 m!239417))

(assert (=> b!153596 m!239419))

(declare-fun m!239421 () Bool)

(assert (=> b!153596 m!239421))

(declare-fun m!239423 () Bool)

(assert (=> b!153597 m!239423))

(assert (=> bm!2168 m!239417))

(declare-fun m!239425 () Bool)

(assert (=> bm!2168 m!239425))

(declare-fun m!239427 () Bool)

(assert (=> bm!2168 m!239427))

(declare-fun m!239429 () Bool)

(assert (=> bm!2168 m!239429))

(assert (=> bm!2168 m!239419))

(declare-fun m!239431 () Bool)

(assert (=> b!153599 m!239431))

(assert (=> b!153535 d!50460))

(check-sat (not b!153596) (not d!50440) (not bm!2168) (not b!153599) (not d!50456) (not d!50452) (not d!50444) (not d!50458) (not b!153597) (not b!153578) (not d!50454) (not d!50442))
(check-sat)
(get-model)

(declare-fun lt!239980 () (_ BitVec 8))

(declare-fun lt!239979 () (_ BitVec 8))

(declare-fun d!50510 () Bool)

(assert (=> d!50510 (= lt!239980 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3942 (buf!3622 (BitStream!5497 (buf!3622 bs2!18) (currentByte!6614 bs1!10) (currentBit!6609 bs1!10)))) (currentByte!6614 (BitStream!5497 (buf!3622 bs2!18) (currentByte!6614 bs1!10) (currentBit!6609 bs1!10))))) ((_ sign_extend 24) lt!239979))))))

(assert (=> d!50510 (= lt!239979 ((_ extract 7 0) (currentBit!6609 (BitStream!5497 (buf!3622 bs2!18) (currentByte!6614 bs1!10) (currentBit!6609 bs1!10)))))))

(declare-fun e!103080 () Bool)

(assert (=> d!50510 e!103080))

(declare-fun res!128695 () Bool)

(assert (=> d!50510 (=> (not res!128695) (not e!103080))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!50510 (= res!128695 (validate_offset_bits!1 ((_ sign_extend 32) (size!3119 (buf!3622 (BitStream!5497 (buf!3622 bs2!18) (currentByte!6614 bs1!10) (currentBit!6609 bs1!10))))) ((_ sign_extend 32) (currentByte!6614 (BitStream!5497 (buf!3622 bs2!18) (currentByte!6614 bs1!10) (currentBit!6609 bs1!10)))) ((_ sign_extend 32) (currentBit!6609 (BitStream!5497 (buf!3622 bs2!18) (currentByte!6614 bs1!10) (currentBit!6609 bs1!10)))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!13636 0))(
  ( (tuple2!13637 (_1!7211 Unit!9693) (_2!7211 (_ BitVec 8))) )
))
(declare-fun Unit!9697 () Unit!9693)

(declare-fun Unit!9698 () Unit!9693)

(assert (=> d!50510 (= (readByte!0 (BitStream!5497 (buf!3622 bs2!18) (currentByte!6614 bs1!10) (currentBit!6609 bs1!10))) (tuple2!13631 (_2!7211 (ite (bvsgt ((_ sign_extend 24) lt!239979) #b00000000000000000000000000000000) (tuple2!13637 Unit!9697 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!239980) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3942 (buf!3622 (BitStream!5497 (buf!3622 bs2!18) (currentByte!6614 bs1!10) (currentBit!6609 bs1!10)))) (bvadd (currentByte!6614 (BitStream!5497 (buf!3622 bs2!18) (currentByte!6614 bs1!10) (currentBit!6609 bs1!10))) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!239979)))))))) (tuple2!13637 Unit!9698 lt!239980))) (BitStream!5497 (buf!3622 (BitStream!5497 (buf!3622 bs2!18) (currentByte!6614 bs1!10) (currentBit!6609 bs1!10))) (bvadd (currentByte!6614 (BitStream!5497 (buf!3622 bs2!18) (currentByte!6614 bs1!10) (currentBit!6609 bs1!10))) #b00000000000000000000000000000001) (currentBit!6609 (BitStream!5497 (buf!3622 bs2!18) (currentByte!6614 bs1!10) (currentBit!6609 bs1!10))))))))

(declare-fun b!153676 () Bool)

(declare-fun e!103079 () Bool)

(assert (=> b!153676 (= e!103080 e!103079)))

(declare-fun res!128694 () Bool)

(assert (=> b!153676 (=> (not res!128694) (not e!103079))))

(declare-fun lt!239978 () tuple2!13630)

(assert (=> b!153676 (= res!128694 (= (buf!3622 (_2!7205 lt!239978)) (buf!3622 (BitStream!5497 (buf!3622 bs2!18) (currentByte!6614 bs1!10) (currentBit!6609 bs1!10)))))))

(declare-fun lt!239983 () (_ BitVec 8))

(declare-fun lt!239982 () (_ BitVec 8))

(declare-fun Unit!9699 () Unit!9693)

(declare-fun Unit!9700 () Unit!9693)

(assert (=> b!153676 (= lt!239978 (tuple2!13631 (_2!7211 (ite (bvsgt ((_ sign_extend 24) lt!239982) #b00000000000000000000000000000000) (tuple2!13637 Unit!9699 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!239983) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3942 (buf!3622 (BitStream!5497 (buf!3622 bs2!18) (currentByte!6614 bs1!10) (currentBit!6609 bs1!10)))) (bvadd (currentByte!6614 (BitStream!5497 (buf!3622 bs2!18) (currentByte!6614 bs1!10) (currentBit!6609 bs1!10))) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!239982)))))))) (tuple2!13637 Unit!9700 lt!239983))) (BitStream!5497 (buf!3622 (BitStream!5497 (buf!3622 bs2!18) (currentByte!6614 bs1!10) (currentBit!6609 bs1!10))) (bvadd (currentByte!6614 (BitStream!5497 (buf!3622 bs2!18) (currentByte!6614 bs1!10) (currentBit!6609 bs1!10))) #b00000000000000000000000000000001) (currentBit!6609 (BitStream!5497 (buf!3622 bs2!18) (currentByte!6614 bs1!10) (currentBit!6609 bs1!10))))))))

(assert (=> b!153676 (= lt!239983 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3942 (buf!3622 (BitStream!5497 (buf!3622 bs2!18) (currentByte!6614 bs1!10) (currentBit!6609 bs1!10)))) (currentByte!6614 (BitStream!5497 (buf!3622 bs2!18) (currentByte!6614 bs1!10) (currentBit!6609 bs1!10))))) ((_ sign_extend 24) lt!239982))))))

(assert (=> b!153676 (= lt!239982 ((_ extract 7 0) (currentBit!6609 (BitStream!5497 (buf!3622 bs2!18) (currentByte!6614 bs1!10) (currentBit!6609 bs1!10)))))))

(declare-fun lt!239981 () (_ BitVec 64))

(declare-fun b!153677 () Bool)

(declare-fun lt!239977 () (_ BitVec 64))

(assert (=> b!153677 (= e!103079 (= (bitIndex!0 (size!3119 (buf!3622 (_2!7205 lt!239978))) (currentByte!6614 (_2!7205 lt!239978)) (currentBit!6609 (_2!7205 lt!239978))) (bvadd lt!239977 lt!239981)))))

(assert (=> b!153677 (or (not (= (bvand lt!239977 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!239981 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!239977 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!239977 lt!239981) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!153677 (= lt!239981 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!153677 (= lt!239977 (bitIndex!0 (size!3119 (buf!3622 (BitStream!5497 (buf!3622 bs2!18) (currentByte!6614 bs1!10) (currentBit!6609 bs1!10)))) (currentByte!6614 (BitStream!5497 (buf!3622 bs2!18) (currentByte!6614 bs1!10) (currentBit!6609 bs1!10))) (currentBit!6609 (BitStream!5497 (buf!3622 bs2!18) (currentByte!6614 bs1!10) (currentBit!6609 bs1!10)))))))

(assert (= (and d!50510 res!128695) b!153676))

(assert (= (and b!153676 res!128694) b!153677))

(declare-fun m!239503 () Bool)

(assert (=> d!50510 m!239503))

(declare-fun m!239505 () Bool)

(assert (=> d!50510 m!239505))

(declare-fun m!239507 () Bool)

(assert (=> d!50510 m!239507))

(assert (=> b!153676 m!239507))

(assert (=> b!153676 m!239503))

(declare-fun m!239509 () Bool)

(assert (=> b!153677 m!239509))

(declare-fun m!239511 () Bool)

(assert (=> b!153677 m!239511))

(assert (=> d!50456 d!50510))

(declare-fun d!50512 () Bool)

(declare-fun lt!239987 () (_ BitVec 8))

(declare-fun lt!239986 () (_ BitVec 8))

(assert (=> d!50512 (= lt!239987 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3942 (buf!3622 bs1!10)) (currentByte!6614 bs1!10))) ((_ sign_extend 24) lt!239986))))))

(assert (=> d!50512 (= lt!239986 ((_ extract 7 0) (currentBit!6609 bs1!10)))))

(declare-fun e!103082 () Bool)

(assert (=> d!50512 e!103082))

(declare-fun res!128697 () Bool)

(assert (=> d!50512 (=> (not res!128697) (not e!103082))))

(assert (=> d!50512 (= res!128697 (validate_offset_bits!1 ((_ sign_extend 32) (size!3119 (buf!3622 bs1!10))) ((_ sign_extend 32) (currentByte!6614 bs1!10)) ((_ sign_extend 32) (currentBit!6609 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun Unit!9701 () Unit!9693)

(declare-fun Unit!9702 () Unit!9693)

(assert (=> d!50512 (= (readByte!0 bs1!10) (tuple2!13631 (_2!7211 (ite (bvsgt ((_ sign_extend 24) lt!239986) #b00000000000000000000000000000000) (tuple2!13637 Unit!9701 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!239987) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3942 (buf!3622 bs1!10)) (bvadd (currentByte!6614 bs1!10) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!239986)))))))) (tuple2!13637 Unit!9702 lt!239987))) (BitStream!5497 (buf!3622 bs1!10) (bvadd (currentByte!6614 bs1!10) #b00000000000000000000000000000001) (currentBit!6609 bs1!10))))))

(declare-fun b!153678 () Bool)

(declare-fun e!103081 () Bool)

(assert (=> b!153678 (= e!103082 e!103081)))

(declare-fun res!128696 () Bool)

(assert (=> b!153678 (=> (not res!128696) (not e!103081))))

(declare-fun lt!239985 () tuple2!13630)

(assert (=> b!153678 (= res!128696 (= (buf!3622 (_2!7205 lt!239985)) (buf!3622 bs1!10)))))

(declare-fun lt!239989 () (_ BitVec 8))

(declare-fun lt!239990 () (_ BitVec 8))

(declare-fun Unit!9703 () Unit!9693)

(declare-fun Unit!9704 () Unit!9693)

(assert (=> b!153678 (= lt!239985 (tuple2!13631 (_2!7211 (ite (bvsgt ((_ sign_extend 24) lt!239989) #b00000000000000000000000000000000) (tuple2!13637 Unit!9703 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!239990) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3942 (buf!3622 bs1!10)) (bvadd (currentByte!6614 bs1!10) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!239989)))))))) (tuple2!13637 Unit!9704 lt!239990))) (BitStream!5497 (buf!3622 bs1!10) (bvadd (currentByte!6614 bs1!10) #b00000000000000000000000000000001) (currentBit!6609 bs1!10))))))

(assert (=> b!153678 (= lt!239990 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3942 (buf!3622 bs1!10)) (currentByte!6614 bs1!10))) ((_ sign_extend 24) lt!239989))))))

(assert (=> b!153678 (= lt!239989 ((_ extract 7 0) (currentBit!6609 bs1!10)))))

(declare-fun lt!239984 () (_ BitVec 64))

(declare-fun b!153679 () Bool)

(declare-fun lt!239988 () (_ BitVec 64))

(assert (=> b!153679 (= e!103081 (= (bitIndex!0 (size!3119 (buf!3622 (_2!7205 lt!239985))) (currentByte!6614 (_2!7205 lt!239985)) (currentBit!6609 (_2!7205 lt!239985))) (bvadd lt!239984 lt!239988)))))

(assert (=> b!153679 (or (not (= (bvand lt!239984 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!239988 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!239984 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!239984 lt!239988) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!153679 (= lt!239988 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!153679 (= lt!239984 (bitIndex!0 (size!3119 (buf!3622 bs1!10)) (currentByte!6614 bs1!10) (currentBit!6609 bs1!10)))))

(assert (= (and d!50512 res!128697) b!153678))

(assert (= (and b!153678 res!128696) b!153679))

(assert (=> d!50512 m!239349))

(declare-fun m!239513 () Bool)

(assert (=> d!50512 m!239513))

(declare-fun m!239515 () Bool)

(assert (=> d!50512 m!239515))

(assert (=> b!153678 m!239515))

(assert (=> b!153678 m!239349))

(declare-fun m!239517 () Bool)

(assert (=> b!153679 m!239517))

(assert (=> b!153679 m!239345))

(assert (=> d!50458 d!50512))

(declare-fun d!50514 () Bool)

(assert (=> d!50514 (= (select (arr!3942 (buf!3622 bs1!10)) (currentByte!6614 bs1!10)) (select (arr!3942 (buf!3622 bs2!18)) (currentByte!6614 bs1!10)))))

(assert (=> d!50514 true))

(declare-fun _$12!57 () Unit!9693)

(assert (=> d!50514 (= (choose!104 (buf!3622 bs1!10) (buf!3622 bs2!18) #b00000000000000000000000000000000 (currentByte!6614 bs1!10) lt!239822) _$12!57)))

(declare-fun bs!12362 () Bool)

(assert (= bs!12362 d!50514))

(assert (=> bs!12362 m!239349))

(assert (=> bs!12362 m!239351))

(assert (=> d!50452 d!50514))

(declare-fun d!50516 () Bool)

(assert (=> d!50516 (= (invariant!0 (currentBit!6609 bs1!10) (currentByte!6614 bs1!10) (size!3119 (buf!3622 bs1!10))) (and (bvsge (currentBit!6609 bs1!10) #b00000000000000000000000000000000) (bvslt (currentBit!6609 bs1!10) #b00000000000000000000000000001000) (bvsge (currentByte!6614 bs1!10) #b00000000000000000000000000000000) (or (bvslt (currentByte!6614 bs1!10) (size!3119 (buf!3622 bs1!10))) (and (= (currentBit!6609 bs1!10) #b00000000000000000000000000000000) (= (currentByte!6614 bs1!10) (size!3119 (buf!3622 bs1!10)))))))))

(assert (=> d!50440 d!50516))

(declare-fun d!50518 () Bool)

(declare-fun res!128698 () Bool)

(declare-fun e!103083 () Bool)

(assert (=> d!50518 (=> res!128698 e!103083)))

(assert (=> d!50518 (= res!128698 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!239822))))

(assert (=> d!50518 (= (arrayRangesEq!381 (buf!3622 bs1!10) (buf!3622 bs2!18) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!239822) e!103083)))

(declare-fun b!153680 () Bool)

(declare-fun e!103084 () Bool)

(assert (=> b!153680 (= e!103083 e!103084)))

(declare-fun res!128699 () Bool)

(assert (=> b!153680 (=> (not res!128699) (not e!103084))))

(assert (=> b!153680 (= res!128699 (= (select (arr!3942 (buf!3622 bs1!10)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!3942 (buf!3622 bs2!18)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!153681 () Bool)

(assert (=> b!153681 (= e!103084 (arrayRangesEq!381 (buf!3622 bs1!10) (buf!3622 bs2!18) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!239822))))

(assert (= (and d!50518 (not res!128698)) b!153680))

(assert (= (and b!153680 res!128699) b!153681))

(declare-fun m!239519 () Bool)

(assert (=> b!153680 m!239519))

(declare-fun m!239521 () Bool)

(assert (=> b!153680 m!239521))

(declare-fun m!239523 () Bool)

(assert (=> b!153681 m!239523))

(assert (=> b!153578 d!50518))

(declare-fun d!50520 () Bool)

(assert (=> d!50520 (= (invariant!0 (currentBit!6609 bs2!18) (currentByte!6614 bs2!18) (size!3119 (buf!3622 bs2!18))) (and (bvsge (currentBit!6609 bs2!18) #b00000000000000000000000000000000) (bvslt (currentBit!6609 bs2!18) #b00000000000000000000000000001000) (bvsge (currentByte!6614 bs2!18) #b00000000000000000000000000000000) (or (bvslt (currentByte!6614 bs2!18) (size!3119 (buf!3622 bs2!18))) (and (= (currentBit!6609 bs2!18) #b00000000000000000000000000000000) (= (currentByte!6614 bs2!18) (size!3119 (buf!3622 bs2!18)))))))))

(assert (=> d!50442 d!50520))

(declare-fun d!50522 () Bool)

(declare-fun res!128700 () Bool)

(declare-fun e!103085 () Bool)

(assert (=> d!50522 (=> res!128700 e!103085)))

(assert (=> d!50522 (= res!128700 (= (_1!7206 lt!239883) (_2!7206 lt!239883)))))

(assert (=> d!50522 (= (arrayRangesEq!381 (buf!3622 bs1!10) (buf!3622 bs2!18) (_1!7206 lt!239883) (_2!7206 lt!239883)) e!103085)))

(declare-fun b!153682 () Bool)

(declare-fun e!103086 () Bool)

(assert (=> b!153682 (= e!103085 e!103086)))

(declare-fun res!128701 () Bool)

(assert (=> b!153682 (=> (not res!128701) (not e!103086))))

(assert (=> b!153682 (= res!128701 (= (select (arr!3942 (buf!3622 bs1!10)) (_1!7206 lt!239883)) (select (arr!3942 (buf!3622 bs2!18)) (_1!7206 lt!239883))))))

(declare-fun b!153683 () Bool)

(assert (=> b!153683 (= e!103086 (arrayRangesEq!381 (buf!3622 bs1!10) (buf!3622 bs2!18) (bvadd (_1!7206 lt!239883) #b00000000000000000000000000000001) (_2!7206 lt!239883)))))

(assert (= (and d!50522 (not res!128700)) b!153682))

(assert (= (and b!153682 res!128701) b!153683))

(declare-fun m!239525 () Bool)

(assert (=> b!153682 m!239525))

(declare-fun m!239527 () Bool)

(assert (=> b!153682 m!239527))

(declare-fun m!239529 () Bool)

(assert (=> b!153683 m!239529))

(assert (=> b!153599 d!50522))

(declare-fun d!50524 () Bool)

(assert (=> d!50524 (= (byteRangesEq!0 (ite c!8187 (select (arr!3942 (buf!3622 bs1!10)) (_3!390 lt!239883)) (select (arr!3942 (buf!3622 bs1!10)) (_4!87 lt!239883))) (ite c!8187 (select (arr!3942 (buf!3622 bs2!18)) (_3!390 lt!239883)) (select (arr!3942 (buf!3622 bs2!18)) (_4!87 lt!239883))) (ite c!8187 lt!239885 #b00000000000000000000000000000000) lt!239884) (or (= (ite c!8187 lt!239885 #b00000000000000000000000000000000) lt!239884) (= (bvand (bvand (bvand ((_ sign_extend 24) (ite c!8187 (select (arr!3942 (buf!3622 bs1!10)) (_3!390 lt!239883)) (select (arr!3942 (buf!3622 bs1!10)) (_4!87 lt!239883)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!239884))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!8187 lt!239885 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (ite c!8187 (select (arr!3942 (buf!3622 bs2!18)) (_3!390 lt!239883)) (select (arr!3942 (buf!3622 bs2!18)) (_4!87 lt!239883)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!239884))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!8187 lt!239885 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111))))))

(declare-fun bs!12363 () Bool)

(assert (= bs!12363 d!50524))

(declare-fun m!239531 () Bool)

(assert (=> bs!12363 m!239531))

(declare-fun m!239533 () Bool)

(assert (=> bs!12363 m!239533))

(assert (=> bm!2168 d!50524))

(declare-fun d!50526 () Bool)

(assert (=> d!50526 (= (byteRangesEq!0 (select (arr!3942 (buf!3622 bs1!10)) (_3!390 lt!239883)) (select (arr!3942 (buf!3622 bs2!18)) (_3!390 lt!239883)) lt!239885 #b00000000000000000000000000001000) (or (= lt!239885 #b00000000000000000000000000001000) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!3942 (buf!3622 bs1!10)) (_3!390 lt!239883))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!239885)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!3942 (buf!3622 bs2!18)) (_3!390 lt!239883))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!239885)))) #b00000000000000000000000011111111))))))

(declare-fun bs!12364 () Bool)

(assert (= bs!12364 d!50526))

(declare-fun m!239535 () Bool)

(assert (=> bs!12364 m!239535))

(declare-fun m!239537 () Bool)

(assert (=> bs!12364 m!239537))

(assert (=> b!153596 d!50526))

(declare-fun d!50528 () Bool)

(assert (=> d!50528 (= (remainingBits!0 ((_ sign_extend 32) (size!3119 (buf!3622 bs2!18))) ((_ sign_extend 32) (currentByte!6614 bs2!18)) ((_ sign_extend 32) (currentBit!6609 bs2!18))) (bvsub (bvmul ((_ sign_extend 32) (size!3119 (buf!3622 bs2!18))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6614 bs2!18)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6609 bs2!18)))))))

(assert (=> d!50454 d!50528))

(assert (=> d!50454 d!50520))

(declare-fun d!50530 () Bool)

(assert (=> d!50530 (= (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!239819) (tuple4!175 ((_ extract 31 0) (bvadd (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv lt!239819 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv lt!239819 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!153597 d!50530))

(declare-fun d!50532 () Bool)

(assert (=> d!50532 (= (remainingBits!0 ((_ sign_extend 32) (size!3119 (buf!3622 bs1!10))) ((_ sign_extend 32) (currentByte!6614 bs1!10)) ((_ sign_extend 32) (currentBit!6609 bs1!10))) (bvsub (bvmul ((_ sign_extend 32) (size!3119 (buf!3622 bs1!10))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6614 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6609 bs1!10)))))))

(assert (=> d!50444 d!50532))

(assert (=> d!50444 d!50516))

(check-sat (not b!153677) (not b!153679) (not b!153683) (not b!153681) (not d!50512) (not d!50510))
(check-sat)
