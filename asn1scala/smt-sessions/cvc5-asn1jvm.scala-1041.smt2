; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29800 () Bool)

(assert start!29800)

(declare-fun b!153511 () Bool)

(declare-fun res!128564 () Bool)

(declare-fun e!102948 () Bool)

(assert (=> b!153511 (=> (not res!128564) (not e!102948))))

(declare-datatypes ((array!6911 0))(
  ( (array!6912 (arr!3941 (Array (_ BitVec 32) (_ BitVec 8))) (size!3118 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5494 0))(
  ( (BitStream!5495 (buf!3621 array!6911) (currentByte!6613 (_ BitVec 32)) (currentBit!6608 (_ BitVec 32))) )
))
(declare-fun bs2!18 () BitStream!5494)

(declare-fun lt!239806 () (_ BitVec 32))

(declare-fun bs1!10 () BitStream!5494)

(declare-fun arrayRangesEq!380 (array!6911 array!6911 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!153511 (= res!128564 (arrayRangesEq!380 (buf!3621 bs1!10) (buf!3621 bs2!18) #b00000000000000000000000000000000 lt!239806))))

(declare-fun b!153512 () Bool)

(declare-fun res!128561 () Bool)

(declare-fun e!102945 () Bool)

(assert (=> b!153512 (=> (not res!128561) (not e!102945))))

(declare-fun lt!239801 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!6911 array!6911 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!153512 (= res!128561 (arrayBitRangesEq!0 (buf!3621 bs1!10) (buf!3621 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!239801))))

(declare-fun b!153513 () Bool)

(declare-datatypes ((tuple2!13624 0))(
  ( (tuple2!13625 (_1!7202 BitStream!5494) (_2!7202 (_ BitVec 8))) )
))
(declare-fun lt!239804 () tuple2!13624)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!153513 (= e!102948 (not (invariant!0 (currentBit!6608 (_1!7202 lt!239804)) (currentByte!6613 (_1!7202 lt!239804)) (size!3118 (buf!3621 (_1!7202 lt!239804))))))))

(assert (=> b!153513 (= (select (arr!3941 (buf!3621 bs1!10)) (currentByte!6613 bs1!10)) (select (arr!3941 (buf!3621 bs2!18)) (currentByte!6613 bs1!10)))))

(declare-datatypes ((Unit!9691 0))(
  ( (Unit!9692) )
))
(declare-fun lt!239802 () Unit!9691)

(declare-fun arrayRangesEqImpliesEq!21 (array!6911 array!6911 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9691)

(assert (=> b!153513 (= lt!239802 (arrayRangesEqImpliesEq!21 (buf!3621 bs1!10) (buf!3621 bs2!18) #b00000000000000000000000000000000 (currentByte!6613 bs1!10) lt!239806))))

(declare-fun b!153514 () Bool)

(declare-fun e!102946 () Bool)

(declare-fun array_inv!2907 (array!6911) Bool)

(assert (=> b!153514 (= e!102946 (array_inv!2907 (buf!3621 bs1!10)))))

(declare-fun b!153515 () Bool)

(assert (=> b!153515 (= e!102945 e!102948)))

(declare-fun res!128560 () Bool)

(assert (=> b!153515 (=> (not res!128560) (not e!102948))))

(assert (=> b!153515 (= res!128560 (and (bvsle #b00000000000000000000000000000000 lt!239806) (bvsle lt!239806 (size!3118 (buf!3621 bs1!10))) (bvsle #b00000000000000000000000000000000 (currentByte!6613 bs1!10)) (bvslt (currentByte!6613 bs1!10) lt!239806)))))

(declare-fun lt!239803 () (_ BitVec 64))

(assert (=> b!153515 (= lt!239806 ((_ extract 31 0) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bvsdiv lt!239803 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!239805 () tuple2!13624)

(declare-fun readBytePure!0 (BitStream!5494) tuple2!13624)

(assert (=> b!153515 (= lt!239805 (readBytePure!0 (BitStream!5495 (buf!3621 bs2!18) (currentByte!6613 bs1!10) (currentBit!6608 bs1!10))))))

(assert (=> b!153515 (= lt!239804 (readBytePure!0 bs1!10))))

(declare-fun b!153516 () Bool)

(declare-fun e!102944 () Bool)

(assert (=> b!153516 (= e!102944 (array_inv!2907 (buf!3621 bs2!18)))))

(declare-fun b!153517 () Bool)

(declare-fun e!102943 () Bool)

(assert (=> b!153517 (= e!102943 e!102945)))

(declare-fun res!128563 () Bool)

(assert (=> b!153517 (=> (not res!128563) (not e!102945))))

(assert (=> b!153517 (= res!128563 (bvsle lt!239801 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3118 (buf!3621 bs1!10))))))))

(assert (=> b!153517 (= lt!239801 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!239803))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!153517 (= lt!239803 (bitIndex!0 (size!3118 (buf!3621 bs1!10)) (currentByte!6613 bs1!10) (currentBit!6608 bs1!10)))))

(declare-fun res!128565 () Bool)

(assert (=> start!29800 (=> (not res!128565) (not e!102943))))

(assert (=> start!29800 (= res!128565 (= (size!3118 (buf!3621 bs1!10)) (size!3118 (buf!3621 bs2!18))))))

(assert (=> start!29800 e!102943))

(declare-fun inv!12 (BitStream!5494) Bool)

(assert (=> start!29800 (and (inv!12 bs1!10) e!102946)))

(assert (=> start!29800 (and (inv!12 bs2!18) e!102944)))

(declare-fun b!153518 () Bool)

(declare-fun res!128562 () Bool)

(assert (=> b!153518 (=> (not res!128562) (not e!102945))))

(assert (=> b!153518 (= res!128562 (bvsle lt!239801 (bitIndex!0 (size!3118 (buf!3621 bs2!18)) (currentByte!6613 bs2!18) (currentBit!6608 bs2!18))))))

(assert (= (and start!29800 res!128565) b!153517))

(assert (= (and b!153517 res!128563) b!153518))

(assert (= (and b!153518 res!128562) b!153512))

(assert (= (and b!153512 res!128561) b!153515))

(assert (= (and b!153515 res!128560) b!153511))

(assert (= (and b!153511 res!128564) b!153513))

(assert (= start!29800 b!153514))

(assert (= start!29800 b!153516))

(declare-fun m!239311 () Bool)

(assert (=> b!153511 m!239311))

(declare-fun m!239313 () Bool)

(assert (=> start!29800 m!239313))

(declare-fun m!239315 () Bool)

(assert (=> start!29800 m!239315))

(declare-fun m!239317 () Bool)

(assert (=> b!153515 m!239317))

(declare-fun m!239319 () Bool)

(assert (=> b!153515 m!239319))

(declare-fun m!239321 () Bool)

(assert (=> b!153517 m!239321))

(declare-fun m!239323 () Bool)

(assert (=> b!153513 m!239323))

(declare-fun m!239325 () Bool)

(assert (=> b!153513 m!239325))

(declare-fun m!239327 () Bool)

(assert (=> b!153513 m!239327))

(declare-fun m!239329 () Bool)

(assert (=> b!153513 m!239329))

(declare-fun m!239331 () Bool)

(assert (=> b!153514 m!239331))

(declare-fun m!239333 () Bool)

(assert (=> b!153512 m!239333))

(declare-fun m!239335 () Bool)

(assert (=> b!153516 m!239335))

(declare-fun m!239337 () Bool)

(assert (=> b!153518 m!239337))

(push 1)

(assert (not b!153513))

(assert (not b!153518))

(assert (not start!29800))

(assert (not b!153515))

(assert (not b!153514))

(assert (not b!153517))

(assert (not b!153511))

(assert (not b!153516))

(assert (not b!153512))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!50462 () Bool)

(assert (=> d!50462 (= (invariant!0 (currentBit!6608 (_1!7202 lt!239804)) (currentByte!6613 (_1!7202 lt!239804)) (size!3118 (buf!3621 (_1!7202 lt!239804)))) (and (bvsge (currentBit!6608 (_1!7202 lt!239804)) #b00000000000000000000000000000000) (bvslt (currentBit!6608 (_1!7202 lt!239804)) #b00000000000000000000000000001000) (bvsge (currentByte!6613 (_1!7202 lt!239804)) #b00000000000000000000000000000000) (or (bvslt (currentByte!6613 (_1!7202 lt!239804)) (size!3118 (buf!3621 (_1!7202 lt!239804)))) (and (= (currentBit!6608 (_1!7202 lt!239804)) #b00000000000000000000000000000000) (= (currentByte!6613 (_1!7202 lt!239804)) (size!3118 (buf!3621 (_1!7202 lt!239804))))))))))

(assert (=> b!153513 d!50462))

(declare-fun d!50464 () Bool)

(assert (=> d!50464 (and (bvsge (currentByte!6613 bs1!10) #b00000000000000000000000000000000) (bvslt (currentByte!6613 bs1!10) (size!3118 (buf!3621 bs1!10))) (bvslt (currentByte!6613 bs1!10) (size!3118 (buf!3621 bs2!18))) (= (select (arr!3941 (buf!3621 bs1!10)) (currentByte!6613 bs1!10)) (select (arr!3941 (buf!3621 bs2!18)) (currentByte!6613 bs1!10))))))

(declare-fun lt!239876 () Unit!9691)

(declare-fun choose!105 (array!6911 array!6911 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9691)

(assert (=> d!50464 (= lt!239876 (choose!105 (buf!3621 bs1!10) (buf!3621 bs2!18) #b00000000000000000000000000000000 (currentByte!6613 bs1!10) lt!239806))))

(assert (=> d!50464 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 lt!239806))))

(assert (=> d!50464 (= (arrayRangesEqImpliesEq!21 (buf!3621 bs1!10) (buf!3621 bs2!18) #b00000000000000000000000000000000 (currentByte!6613 bs1!10) lt!239806) lt!239876)))

(declare-fun bs!12352 () Bool)

(assert (= bs!12352 d!50464))

(assert (=> bs!12352 m!239325))

(assert (=> bs!12352 m!239327))

(declare-fun m!239415 () Bool)

(assert (=> bs!12352 m!239415))

(assert (=> b!153513 d!50464))

(declare-fun d!50466 () Bool)

(declare-fun e!103021 () Bool)

(assert (=> d!50466 e!103021))

(declare-fun res!128635 () Bool)

(assert (=> d!50466 (=> (not res!128635) (not e!103021))))

(declare-fun lt!239898 () (_ BitVec 64))

(declare-fun lt!239899 () (_ BitVec 64))

(declare-fun lt!239902 () (_ BitVec 64))

(assert (=> d!50466 (= res!128635 (= lt!239902 (bvsub lt!239898 lt!239899)))))

(assert (=> d!50466 (or (= (bvand lt!239898 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!239899 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!239898 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!239898 lt!239899) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!50466 (= lt!239899 (remainingBits!0 ((_ sign_extend 32) (size!3118 (buf!3621 bs2!18))) ((_ sign_extend 32) (currentByte!6613 bs2!18)) ((_ sign_extend 32) (currentBit!6608 bs2!18))))))

(declare-fun lt!239901 () (_ BitVec 64))

(declare-fun lt!239903 () (_ BitVec 64))

(assert (=> d!50466 (= lt!239898 (bvmul lt!239901 lt!239903))))

(assert (=> d!50466 (or (= lt!239901 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!239903 (bvsdiv (bvmul lt!239901 lt!239903) lt!239901)))))

(assert (=> d!50466 (= lt!239903 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!50466 (= lt!239901 ((_ sign_extend 32) (size!3118 (buf!3621 bs2!18))))))

(assert (=> d!50466 (= lt!239902 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6613 bs2!18)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6608 bs2!18))))))

(assert (=> d!50466 (invariant!0 (currentBit!6608 bs2!18) (currentByte!6613 bs2!18) (size!3118 (buf!3621 bs2!18)))))

(assert (=> d!50466 (= (bitIndex!0 (size!3118 (buf!3621 bs2!18)) (currentByte!6613 bs2!18) (currentBit!6608 bs2!18)) lt!239902)))

(declare-fun b!153606 () Bool)

(declare-fun res!128636 () Bool)

(assert (=> b!153606 (=> (not res!128636) (not e!103021))))

(assert (=> b!153606 (= res!128636 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!239902))))

(declare-fun b!153607 () Bool)

(declare-fun lt!239900 () (_ BitVec 64))

(assert (=> b!153607 (= e!103021 (bvsle lt!239902 (bvmul lt!239900 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!153607 (or (= lt!239900 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!239900 #b0000000000000000000000000000000000000000000000000000000000001000) lt!239900)))))

(assert (=> b!153607 (= lt!239900 ((_ sign_extend 32) (size!3118 (buf!3621 bs2!18))))))

(assert (= (and d!50466 res!128635) b!153606))

(assert (= (and b!153606 res!128636) b!153607))

(declare-fun m!239433 () Bool)

(assert (=> d!50466 m!239433))

(declare-fun m!239435 () Bool)

(assert (=> d!50466 m!239435))

(assert (=> b!153518 d!50466))

(declare-fun d!50468 () Bool)

(assert (=> d!50468 (= (array_inv!2907 (buf!3621 bs1!10)) (bvsge (size!3118 (buf!3621 bs1!10)) #b00000000000000000000000000000000))))

(assert (=> b!153514 d!50468))

(declare-fun d!50470 () Bool)

(assert (=> d!50470 (= (array_inv!2907 (buf!3621 bs2!18)) (bvsge (size!3118 (buf!3621 bs2!18)) #b00000000000000000000000000000000))))

(assert (=> b!153516 d!50470))

(declare-fun d!50472 () Bool)

(declare-datatypes ((tuple2!13632 0))(
  ( (tuple2!13633 (_1!7207 (_ BitVec 8)) (_2!7207 BitStream!5494)) )
))
(declare-fun lt!239906 () tuple2!13632)

(declare-fun readByte!0 (BitStream!5494) tuple2!13632)

(assert (=> d!50472 (= lt!239906 (readByte!0 (BitStream!5495 (buf!3621 bs2!18) (currentByte!6613 bs1!10) (currentBit!6608 bs1!10))))))

(assert (=> d!50472 (= (readBytePure!0 (BitStream!5495 (buf!3621 bs2!18) (currentByte!6613 bs1!10) (currentBit!6608 bs1!10))) (tuple2!13625 (_2!7207 lt!239906) (_1!7207 lt!239906)))))

(declare-fun bs!12353 () Bool)

(assert (= bs!12353 d!50472))

(declare-fun m!239437 () Bool)

(assert (=> bs!12353 m!239437))

(assert (=> b!153515 d!50472))

(declare-fun d!50474 () Bool)

(declare-fun lt!239907 () tuple2!13632)

(assert (=> d!50474 (= lt!239907 (readByte!0 bs1!10))))

(assert (=> d!50474 (= (readBytePure!0 bs1!10) (tuple2!13625 (_2!7207 lt!239907) (_1!7207 lt!239907)))))

(declare-fun bs!12354 () Bool)

(assert (= bs!12354 d!50474))

(declare-fun m!239439 () Bool)

(assert (=> bs!12354 m!239439))

(assert (=> b!153515 d!50474))

(declare-fun d!50476 () Bool)

(assert (=> d!50476 (= (inv!12 bs1!10) (invariant!0 (currentBit!6608 bs1!10) (currentByte!6613 bs1!10) (size!3118 (buf!3621 bs1!10))))))

(declare-fun bs!12355 () Bool)

(assert (= bs!12355 d!50476))

(declare-fun m!239441 () Bool)

(assert (=> bs!12355 m!239441))

(assert (=> start!29800 d!50476))

(declare-fun d!50478 () Bool)

(assert (=> d!50478 (= (inv!12 bs2!18) (invariant!0 (currentBit!6608 bs2!18) (currentByte!6613 bs2!18) (size!3118 (buf!3621 bs2!18))))))

(declare-fun bs!12356 () Bool)

(assert (= bs!12356 d!50478))

(assert (=> bs!12356 m!239435))

(assert (=> start!29800 d!50478))

(declare-fun d!50480 () Bool)

(declare-fun e!103022 () Bool)

(assert (=> d!50480 e!103022))

(declare-fun res!128637 () Bool)

(assert (=> d!50480 (=> (not res!128637) (not e!103022))))

(declare-fun lt!239908 () (_ BitVec 64))

(declare-fun lt!239912 () (_ BitVec 64))

(declare-fun lt!239909 () (_ BitVec 64))

(assert (=> d!50480 (= res!128637 (= lt!239912 (bvsub lt!239908 lt!239909)))))

(assert (=> d!50480 (or (= (bvand lt!239908 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!239909 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!239908 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!239908 lt!239909) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!50480 (= lt!239909 (remainingBits!0 ((_ sign_extend 32) (size!3118 (buf!3621 bs1!10))) ((_ sign_extend 32) (currentByte!6613 bs1!10)) ((_ sign_extend 32) (currentBit!6608 bs1!10))))))

(declare-fun lt!239911 () (_ BitVec 64))

(declare-fun lt!239913 () (_ BitVec 64))

(assert (=> d!50480 (= lt!239908 (bvmul lt!239911 lt!239913))))

(assert (=> d!50480 (or (= lt!239911 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!239913 (bvsdiv (bvmul lt!239911 lt!239913) lt!239911)))))

(assert (=> d!50480 (= lt!239913 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!50480 (= lt!239911 ((_ sign_extend 32) (size!3118 (buf!3621 bs1!10))))))

(assert (=> d!50480 (= lt!239912 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6613 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6608 bs1!10))))))

(assert (=> d!50480 (invariant!0 (currentBit!6608 bs1!10) (currentByte!6613 bs1!10) (size!3118 (buf!3621 bs1!10)))))

(assert (=> d!50480 (= (bitIndex!0 (size!3118 (buf!3621 bs1!10)) (currentByte!6613 bs1!10) (currentBit!6608 bs1!10)) lt!239912)))

(declare-fun b!153608 () Bool)

(declare-fun res!128638 () Bool)

(assert (=> b!153608 (=> (not res!128638) (not e!103022))))

(assert (=> b!153608 (= res!128638 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!239912))))

(declare-fun b!153609 () Bool)

(declare-fun lt!239910 () (_ BitVec 64))

(assert (=> b!153609 (= e!103022 (bvsle lt!239912 (bvmul lt!239910 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!153609 (or (= lt!239910 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!239910 #b0000000000000000000000000000000000000000000000000000000000001000) lt!239910)))))

(assert (=> b!153609 (= lt!239910 ((_ sign_extend 32) (size!3118 (buf!3621 bs1!10))))))

(assert (= (and d!50480 res!128637) b!153608))

(assert (= (and b!153608 res!128638) b!153609))

(declare-fun m!239443 () Bool)

(assert (=> d!50480 m!239443))

(assert (=> d!50480 m!239441))

(assert (=> b!153517 d!50480))

(declare-fun b!153624 () Bool)

(declare-fun e!103036 () Bool)

(declare-fun e!103035 () Bool)

(assert (=> b!153624 (= e!103036 e!103035)))

(declare-fun res!128650 () Bool)

(assert (=> b!153624 (=> (not res!128650) (not e!103035))))

(declare-fun e!103038 () Bool)

(assert (=> b!153624 (= res!128650 e!103038)))

(declare-fun res!128652 () Bool)

(assert (=> b!153624 (=> res!128652 e!103038)))

(declare-datatypes ((tuple4!176 0))(
  ( (tuple4!177 (_1!7208 (_ BitVec 32)) (_2!7208 (_ BitVec 32)) (_3!391 (_ BitVec 32)) (_4!88 (_ BitVec 32))) )
))
(declare-fun lt!239922 () tuple4!176)

(assert (=> b!153624 (= res!128652 (bvsge (_1!7208 lt!239922) (_2!7208 lt!239922)))))

(declare-fun lt!239921 () (_ BitVec 32))

(assert (=> b!153624 (= lt!239921 ((_ extract 31 0) (bvsrem lt!239801 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!239920 () (_ BitVec 32))

(assert (=> b!153624 (= lt!239920 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!176)

(assert (=> b!153624 (= lt!239922 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!239801))))

(declare-fun b!153625 () Bool)

(declare-fun res!128649 () Bool)

(assert (=> b!153625 (= res!128649 (= lt!239921 #b00000000000000000000000000000000))))

(declare-fun e!103037 () Bool)

(assert (=> b!153625 (=> res!128649 e!103037)))

(declare-fun e!103040 () Bool)

(assert (=> b!153625 (= e!103040 e!103037)))

(declare-fun b!153626 () Bool)

(declare-fun e!103039 () Bool)

(assert (=> b!153626 (= e!103035 e!103039)))

(declare-fun c!8190 () Bool)

(assert (=> b!153626 (= c!8190 (= (_3!391 lt!239922) (_4!88 lt!239922)))))

(declare-fun b!153627 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!153627 (= e!103037 (byteRangesEq!0 (select (arr!3941 (buf!3621 bs1!10)) (_4!88 lt!239922)) (select (arr!3941 (buf!3621 bs2!18)) (_4!88 lt!239922)) #b00000000000000000000000000000000 lt!239921))))

(declare-fun b!153628 () Bool)

(declare-fun call!2174 () Bool)

(assert (=> b!153628 (= e!103039 call!2174)))

(declare-fun bm!2171 () Bool)

(assert (=> bm!2171 (= call!2174 (byteRangesEq!0 (select (arr!3941 (buf!3621 bs1!10)) (_3!391 lt!239922)) (select (arr!3941 (buf!3621 bs2!18)) (_3!391 lt!239922)) lt!239920 (ite c!8190 lt!239921 #b00000000000000000000000000001000)))))

(declare-fun d!50482 () Bool)

(declare-fun res!128653 () Bool)

(assert (=> d!50482 (=> res!128653 e!103036)))

(assert (=> d!50482 (= res!128653 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!239801))))

(assert (=> d!50482 (= (arrayBitRangesEq!0 (buf!3621 bs1!10) (buf!3621 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!239801) e!103036)))

(declare-fun b!153629 () Bool)

(assert (=> b!153629 (= e!103038 (arrayRangesEq!380 (buf!3621 bs1!10) (buf!3621 bs2!18) (_1!7208 lt!239922) (_2!7208 lt!239922)))))

(declare-fun b!153630 () Bool)

(assert (=> b!153630 (= e!103039 e!103040)))

(declare-fun res!128651 () Bool)

(assert (=> b!153630 (= res!128651 call!2174)))

(assert (=> b!153630 (=> (not res!128651) (not e!103040))))

(assert (= (and d!50482 (not res!128653)) b!153624))

(assert (= (and b!153624 (not res!128652)) b!153629))

(assert (= (and b!153624 res!128650) b!153626))

(assert (= (and b!153626 c!8190) b!153628))

(assert (= (and b!153626 (not c!8190)) b!153630))

(assert (= (and b!153630 res!128651) b!153625))

(assert (= (and b!153625 (not res!128649)) b!153627))

(assert (= (or b!153628 b!153630) bm!2171))

(declare-fun m!239445 () Bool)

(assert (=> b!153624 m!239445))

(declare-fun m!239447 () Bool)

(assert (=> b!153627 m!239447))

(declare-fun m!239449 () Bool)

(assert (=> b!153627 m!239449))

(assert (=> b!153627 m!239447))

(assert (=> b!153627 m!239449))

(declare-fun m!239451 () Bool)

(assert (=> b!153627 m!239451))

(declare-fun m!239453 () Bool)

(assert (=> bm!2171 m!239453))

(declare-fun m!239455 () Bool)

(assert (=> bm!2171 m!239455))

(assert (=> bm!2171 m!239453))

(assert (=> bm!2171 m!239455))

(declare-fun m!239457 () Bool)

(assert (=> bm!2171 m!239457))

(declare-fun m!239459 () Bool)

(assert (=> b!153629 m!239459))

(assert (=> b!153512 d!50482))

(declare-fun d!50484 () Bool)

(declare-fun res!128658 () Bool)

(declare-fun e!103045 () Bool)

(assert (=> d!50484 (=> res!128658 e!103045)))

(assert (=> d!50484 (= res!128658 (= #b00000000000000000000000000000000 lt!239806))))

(assert (=> d!50484 (= (arrayRangesEq!380 (buf!3621 bs1!10) (buf!3621 bs2!18) #b00000000000000000000000000000000 lt!239806) e!103045)))

(declare-fun b!153635 () Bool)

(declare-fun e!103046 () Bool)

(assert (=> b!153635 (= e!103045 e!103046)))

(declare-fun res!128659 () Bool)

(assert (=> b!153635 (=> (not res!128659) (not e!103046))))

(assert (=> b!153635 (= res!128659 (= (select (arr!3941 (buf!3621 bs1!10)) #b00000000000000000000000000000000) (select (arr!3941 (buf!3621 bs2!18)) #b00000000000000000000000000000000)))))

(declare-fun b!153636 () Bool)

(assert (=> b!153636 (= e!103046 (arrayRangesEq!380 (buf!3621 bs1!10) (buf!3621 bs2!18) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!239806))))

(assert (= (and d!50484 (not res!128658)) b!153635))

(assert (= (and b!153635 res!128659) b!153636))

(declare-fun m!239461 () Bool)

(assert (=> b!153635 m!239461))

(declare-fun m!239463 () Bool)

(assert (=> b!153635 m!239463))

(declare-fun m!239465 () Bool)

(assert (=> b!153636 m!239465))

(assert (=> b!153511 d!50484))

(push 1)

(assert (not d!50464))

(assert (not d!50480))

(assert (not d!50466))

(assert (not b!153629))

(assert (not d!50478))

(assert (not d!50476))

(assert (not bm!2171))

(assert (not d!50474))

(assert (not d!50472))

(assert (not b!153627))

(assert (not b!153624))

(assert (not b!153636))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!50558 () Bool)

(assert (=> d!50558 (= (remainingBits!0 ((_ sign_extend 32) (size!3118 (buf!3621 bs1!10))) ((_ sign_extend 32) (currentByte!6613 bs1!10)) ((_ sign_extend 32) (currentBit!6608 bs1!10))) (bvsub (bvmul ((_ sign_extend 32) (size!3118 (buf!3621 bs1!10))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6613 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6608 bs1!10)))))))

(assert (=> d!50480 d!50558))

(declare-fun d!50560 () Bool)

(assert (=> d!50560 (= (invariant!0 (currentBit!6608 bs1!10) (currentByte!6613 bs1!10) (size!3118 (buf!3621 bs1!10))) (and (bvsge (currentBit!6608 bs1!10) #b00000000000000000000000000000000) (bvslt (currentBit!6608 bs1!10) #b00000000000000000000000000001000) (bvsge (currentByte!6613 bs1!10) #b00000000000000000000000000000000) (or (bvslt (currentByte!6613 bs1!10) (size!3118 (buf!3621 bs1!10))) (and (= (currentBit!6608 bs1!10) #b00000000000000000000000000000000) (= (currentByte!6613 bs1!10) (size!3118 (buf!3621 bs1!10)))))))))

(assert (=> d!50480 d!50560))

(assert (=> d!50476 d!50560))

(declare-fun d!50562 () Bool)

(declare-fun res!128715 () Bool)

(declare-fun e!103099 () Bool)

(assert (=> d!50562 (=> res!128715 e!103099)))

(assert (=> d!50562 (= res!128715 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!239806))))

(assert (=> d!50562 (= (arrayRangesEq!380 (buf!3621 bs1!10) (buf!3621 bs2!18) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!239806) e!103099)))

(declare-fun b!153696 () Bool)

(declare-fun e!103100 () Bool)

(assert (=> b!153696 (= e!103099 e!103100)))

(declare-fun res!128716 () Bool)

(assert (=> b!153696 (=> (not res!128716) (not e!103100))))

(assert (=> b!153696 (= res!128716 (= (select (arr!3941 (buf!3621 bs1!10)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!3941 (buf!3621 bs2!18)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!153697 () Bool)

(assert (=> b!153697 (= e!103100 (arrayRangesEq!380 (buf!3621 bs1!10) (buf!3621 bs2!18) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!239806))))

(assert (= (and d!50562 (not res!128715)) b!153696))

(assert (= (and b!153696 res!128716) b!153697))

(declare-fun m!239575 () Bool)

(assert (=> b!153696 m!239575))

(declare-fun m!239577 () Bool)

(assert (=> b!153696 m!239577))

(declare-fun m!239579 () Bool)

(assert (=> b!153697 m!239579))

(assert (=> b!153636 d!50562))

(declare-fun d!50564 () Bool)

(assert (=> d!50564 (= (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!239801) (tuple4!177 ((_ extract 31 0) (bvadd (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv lt!239801 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv lt!239801 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!153624 d!50564))

(declare-fun d!50566 () Bool)

(assert (=> d!50566 (= (remainingBits!0 ((_ sign_extend 32) (size!3118 (buf!3621 bs2!18))) ((_ sign_extend 32) (currentByte!6613 bs2!18)) ((_ sign_extend 32) (currentBit!6608 bs2!18))) (bvsub (bvmul ((_ sign_extend 32) (size!3118 (buf!3621 bs2!18))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6613 bs2!18)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6608 bs2!18)))))))

(assert (=> d!50466 d!50566))

(declare-fun d!50568 () Bool)

(assert (=> d!50568 (= (invariant!0 (currentBit!6608 bs2!18) (currentByte!6613 bs2!18) (size!3118 (buf!3621 bs2!18))) (and (bvsge (currentBit!6608 bs2!18) #b00000000000000000000000000000000) (bvslt (currentBit!6608 bs2!18) #b00000000000000000000000000001000) (bvsge (currentByte!6613 bs2!18) #b00000000000000000000000000000000) (or (bvslt (currentByte!6613 bs2!18) (size!3118 (buf!3621 bs2!18))) (and (= (currentBit!6608 bs2!18) #b00000000000000000000000000000000) (= (currentByte!6613 bs2!18) (size!3118 (buf!3621 bs2!18)))))))))

(assert (=> d!50466 d!50568))

(declare-fun d!50570 () Bool)

(declare-fun res!128717 () Bool)

(declare-fun e!103101 () Bool)

(assert (=> d!50570 (=> res!128717 e!103101)))

(assert (=> d!50570 (= res!128717 (= (_1!7208 lt!239922) (_2!7208 lt!239922)))))

(assert (=> d!50570 (= (arrayRangesEq!380 (buf!3621 bs1!10) (buf!3621 bs2!18) (_1!7208 lt!239922) (_2!7208 lt!239922)) e!103101)))

(declare-fun b!153698 () Bool)

(declare-fun e!103102 () Bool)

(assert (=> b!153698 (= e!103101 e!103102)))

(declare-fun res!128718 () Bool)

(assert (=> b!153698 (=> (not res!128718) (not e!103102))))

(assert (=> b!153698 (= res!128718 (= (select (arr!3941 (buf!3621 bs1!10)) (_1!7208 lt!239922)) (select (arr!3941 (buf!3621 bs2!18)) (_1!7208 lt!239922))))))

(declare-fun b!153699 () Bool)

(assert (=> b!153699 (= e!103102 (arrayRangesEq!380 (buf!3621 bs1!10) (buf!3621 bs2!18) (bvadd (_1!7208 lt!239922) #b00000000000000000000000000000001) (_2!7208 lt!239922)))))

(assert (= (and d!50570 (not res!128717)) b!153698))

(assert (= (and b!153698 res!128718) b!153699))

(declare-fun m!239581 () Bool)

(assert (=> b!153698 m!239581))

(declare-fun m!239583 () Bool)

(assert (=> b!153698 m!239583))

(declare-fun m!239585 () Bool)

(assert (=> b!153699 m!239585))

(assert (=> b!153629 d!50570))

(assert (=> d!50478 d!50568))

(declare-fun d!50572 () Bool)

(assert (=> d!50572 (= (byteRangesEq!0 (select (arr!3941 (buf!3621 bs1!10)) (_4!88 lt!239922)) (select (arr!3941 (buf!3621 bs2!18)) (_4!88 lt!239922)) #b00000000000000000000000000000000 lt!239921) (or (= #b00000000000000000000000000000000 lt!239921) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!3941 (buf!3621 bs1!10)) (_4!88 lt!239922))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!239921))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!3941 (buf!3621 bs2!18)) (_4!88 lt!239922))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!239921))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!12368 () Bool)

(assert (= bs!12368 d!50572))

(declare-fun m!239587 () Bool)

(assert (=> bs!12368 m!239587))

(declare-fun m!239589 () Bool)

(assert (=> bs!12368 m!239589))

(assert (=> b!153627 d!50572))

(declare-fun d!50574 () Bool)

(assert (=> d!50574 (= (byteRangesEq!0 (select (arr!3941 (buf!3621 bs1!10)) (_3!391 lt!239922)) (select (arr!3941 (buf!3621 bs2!18)) (_3!391 lt!239922)) lt!239920 (ite c!8190 lt!239921 #b00000000000000000000000000001000)) (or (= lt!239920 (ite c!8190 lt!239921 #b00000000000000000000000000001000)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!3941 (buf!3621 bs1!10)) (_3!391 lt!239922))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!8190 lt!239921 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!239920)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!3941 (buf!3621 bs2!18)) (_3!391 lt!239922))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!8190 lt!239921 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!239920)))) #b00000000000000000000000011111111))))))

(declare-fun bs!12369 () Bool)

(assert (= bs!12369 d!50574))

(declare-fun m!239591 () Bool)

(assert (=> bs!12369 m!239591))

(declare-fun m!239593 () Bool)

(assert (=> bs!12369 m!239593))

(assert (=> bm!2171 d!50574))

(declare-fun lt!240038 () (_ BitVec 8))

(declare-fun lt!240034 () (_ BitVec 8))

(declare-fun d!50576 () Bool)

(assert (=> d!50576 (= lt!240034 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3941 (buf!3621 (BitStream!5495 (buf!3621 bs2!18) (currentByte!6613 bs1!10) (currentBit!6608 bs1!10)))) (currentByte!6613 (BitStream!5495 (buf!3621 bs2!18) (currentByte!6613 bs1!10) (currentBit!6608 bs1!10))))) ((_ sign_extend 24) lt!240038))))))

(assert (=> d!50576 (= lt!240038 ((_ extract 7 0) (currentBit!6608 (BitStream!5495 (buf!3621 bs2!18) (currentByte!6613 bs1!10) (currentBit!6608 bs1!10)))))))

(declare-fun e!103108 () Bool)

(assert (=> d!50576 e!103108))

(declare-fun res!128724 () Bool)

(assert (=> d!50576 (=> (not res!128724) (not e!103108))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!50576 (= res!128724 (validate_offset_bits!1 ((_ sign_extend 32) (size!3118 (buf!3621 (BitStream!5495 (buf!3621 bs2!18) (currentByte!6613 bs1!10) (currentBit!6608 bs1!10))))) ((_ sign_extend 32) (currentByte!6613 (BitStream!5495 (buf!3621 bs2!18) (currentByte!6613 bs1!10) (currentBit!6608 bs1!10)))) ((_ sign_extend 32) (currentBit!6608 (BitStream!5495 (buf!3621 bs2!18) (currentByte!6613 bs1!10) (currentBit!6608 bs1!10)))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!13640 0))(
  ( (tuple2!13641 (_1!7213 Unit!9691) (_2!7213 (_ BitVec 8))) )
))
(declare-fun Unit!9713 () Unit!9691)

(declare-fun Unit!9714 () Unit!9691)

(assert (=> d!50576 (= (readByte!0 (BitStream!5495 (buf!3621 bs2!18) (currentByte!6613 bs1!10) (currentBit!6608 bs1!10))) (tuple2!13633 (_2!7213 (ite (bvsgt ((_ sign_extend 24) lt!240038) #b00000000000000000000000000000000) (tuple2!13641 Unit!9713 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!240034) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3941 (buf!3621 (BitStream!5495 (buf!3621 bs2!18) (currentByte!6613 bs1!10) (currentBit!6608 bs1!10)))) (bvadd (currentByte!6613 (BitStream!5495 (buf!3621 bs2!18) (currentByte!6613 bs1!10) (currentBit!6608 bs1!10))) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!240038)))))))) (tuple2!13641 Unit!9714 lt!240034))) (BitStream!5495 (buf!3621 (BitStream!5495 (buf!3621 bs2!18) (currentByte!6613 bs1!10) (currentBit!6608 bs1!10))) (bvadd (currentByte!6613 (BitStream!5495 (buf!3621 bs2!18) (currentByte!6613 bs1!10) (currentBit!6608 bs1!10))) #b00000000000000000000000000000001) (currentBit!6608 (BitStream!5495 (buf!3621 bs2!18) (currentByte!6613 bs1!10) (currentBit!6608 bs1!10))))))))

(declare-fun b!153704 () Bool)

(declare-fun e!103107 () Bool)

(assert (=> b!153704 (= e!103108 e!103107)))

(declare-fun res!128725 () Bool)

(assert (=> b!153704 (=> (not res!128725) (not e!103107))))

(declare-fun lt!240033 () tuple2!13632)

(assert (=> b!153704 (= res!128725 (= (buf!3621 (_2!7207 lt!240033)) (buf!3621 (BitStream!5495 (buf!3621 bs2!18) (currentByte!6613 bs1!10) (currentBit!6608 bs1!10)))))))

(declare-fun lt!240036 () (_ BitVec 8))

(declare-fun lt!240037 () (_ BitVec 8))

(declare-fun Unit!9715 () Unit!9691)

(declare-fun Unit!9716 () Unit!9691)

(assert (=> b!153704 (= lt!240033 (tuple2!13633 (_2!7213 (ite (bvsgt ((_ sign_extend 24) lt!240036) #b00000000000000000000000000000000) (tuple2!13641 Unit!9715 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!240037) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3941 (buf!3621 (BitStream!5495 (buf!3621 bs2!18) (currentByte!6613 bs1!10) (currentBit!6608 bs1!10)))) (bvadd (currentByte!6613 (BitStream!5495 (buf!3621 bs2!18) (currentByte!6613 bs1!10) (currentBit!6608 bs1!10))) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!240036)))))))) (tuple2!13641 Unit!9716 lt!240037))) (BitStream!5495 (buf!3621 (BitStream!5495 (buf!3621 bs2!18) (currentByte!6613 bs1!10) (currentBit!6608 bs1!10))) (bvadd (currentByte!6613 (BitStream!5495 (buf!3621 bs2!18) (currentByte!6613 bs1!10) (currentBit!6608 bs1!10))) #b00000000000000000000000000000001) (currentBit!6608 (BitStream!5495 (buf!3621 bs2!18) (currentByte!6613 bs1!10) (currentBit!6608 bs1!10))))))))

(assert (=> b!153704 (= lt!240037 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3941 (buf!3621 (BitStream!5495 (buf!3621 bs2!18) (currentByte!6613 bs1!10) (currentBit!6608 bs1!10)))) (currentByte!6613 (BitStream!5495 (buf!3621 bs2!18) (currentByte!6613 bs1!10) (currentBit!6608 bs1!10))))) ((_ sign_extend 24) lt!240036))))))

(assert (=> b!153704 (= lt!240036 ((_ extract 7 0) (currentBit!6608 (BitStream!5495 (buf!3621 bs2!18) (currentByte!6613 bs1!10) (currentBit!6608 bs1!10)))))))

(declare-fun b!153705 () Bool)

(declare-fun lt!240035 () (_ BitVec 64))

(declare-fun lt!240039 () (_ BitVec 64))

(assert (=> b!153705 (= e!103107 (= (bitIndex!0 (size!3118 (buf!3621 (_2!7207 lt!240033))) (currentByte!6613 (_2!7207 lt!240033)) (currentBit!6608 (_2!7207 lt!240033))) (bvadd lt!240035 lt!240039)))))

(assert (=> b!153705 (or (not (= (bvand lt!240035 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!240039 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!240035 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!240035 lt!240039) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!153705 (= lt!240039 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!153705 (= lt!240035 (bitIndex!0 (size!3118 (buf!3621 (BitStream!5495 (buf!3621 bs2!18) (currentByte!6613 bs1!10) (currentBit!6608 bs1!10)))) (currentByte!6613 (BitStream!5495 (buf!3621 bs2!18) (currentByte!6613 bs1!10) (currentBit!6608 bs1!10))) (currentBit!6608 (BitStream!5495 (buf!3621 bs2!18) (currentByte!6613 bs1!10) (currentBit!6608 bs1!10)))))))

(assert (= (and d!50576 res!128724) b!153704))

(assert (= (and b!153704 res!128725) b!153705))

(declare-fun m!239595 () Bool)

(assert (=> d!50576 m!239595))

(declare-fun m!239597 () Bool)

(assert (=> d!50576 m!239597))

(declare-fun m!239599 () Bool)

(assert (=> d!50576 m!239599))

(assert (=> b!153704 m!239599))

(assert (=> b!153704 m!239595))

(declare-fun m!239601 () Bool)

(assert (=> b!153705 m!239601))

(declare-fun m!239603 () Bool)

(assert (=> b!153705 m!239603))

(assert (=> d!50472 d!50576))

(declare-fun d!50578 () Bool)

(assert (=> d!50578 (= (select (arr!3941 (buf!3621 bs1!10)) (currentByte!6613 bs1!10)) (select (arr!3941 (buf!3621 bs2!18)) (currentByte!6613 bs1!10)))))

(assert (=> d!50578 true))

(declare-fun _$12!63 () Unit!9691)

(assert (=> d!50578 (= (choose!105 (buf!3621 bs1!10) (buf!3621 bs2!18) #b00000000000000000000000000000000 (currentByte!6613 bs1!10) lt!239806) _$12!63)))

(declare-fun bs!12370 () Bool)

(assert (= bs!12370 d!50578))

(assert (=> bs!12370 m!239325))

(assert (=> bs!12370 m!239327))

(assert (=> d!50464 d!50578))

(declare-fun d!50580 () Bool)

(declare-fun lt!240041 () (_ BitVec 8))

(declare-fun lt!240045 () (_ BitVec 8))

(assert (=> d!50580 (= lt!240041 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3941 (buf!3621 bs1!10)) (currentByte!6613 bs1!10))) ((_ sign_extend 24) lt!240045))))))

(assert (=> d!50580 (= lt!240045 ((_ extract 7 0) (currentBit!6608 bs1!10)))))

(declare-fun e!103110 () Bool)

(assert (=> d!50580 e!103110))

(declare-fun res!128726 () Bool)

(assert (=> d!50580 (=> (not res!128726) (not e!103110))))

(assert (=> d!50580 (= res!128726 (validate_offset_bits!1 ((_ sign_extend 32) (size!3118 (buf!3621 bs1!10))) ((_ sign_extend 32) (currentByte!6613 bs1!10)) ((_ sign_extend 32) (currentBit!6608 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun Unit!9717 () Unit!9691)

(declare-fun Unit!9718 () Unit!9691)

(assert (=> d!50580 (= (readByte!0 bs1!10) (tuple2!13633 (_2!7213 (ite (bvsgt ((_ sign_extend 24) lt!240045) #b00000000000000000000000000000000) (tuple2!13641 Unit!9717 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!240041) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3941 (buf!3621 bs1!10)) (bvadd (currentByte!6613 bs1!10) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!240045)))))))) (tuple2!13641 Unit!9718 lt!240041))) (BitStream!5495 (buf!3621 bs1!10) (bvadd (currentByte!6613 bs1!10) #b00000000000000000000000000000001) (currentBit!6608 bs1!10))))))

(declare-fun b!153706 () Bool)

(declare-fun e!103109 () Bool)

(assert (=> b!153706 (= e!103110 e!103109)))

(declare-fun res!128727 () Bool)

(assert (=> b!153706 (=> (not res!128727) (not e!103109))))

(declare-fun lt!240040 () tuple2!13632)

(assert (=> b!153706 (= res!128727 (= (buf!3621 (_2!7207 lt!240040)) (buf!3621 bs1!10)))))

(declare-fun lt!240044 () (_ BitVec 8))

(declare-fun lt!240043 () (_ BitVec 8))

(declare-fun Unit!9719 () Unit!9691)

(declare-fun Unit!9720 () Unit!9691)

(assert (=> b!153706 (= lt!240040 (tuple2!13633 (_2!7213 (ite (bvsgt ((_ sign_extend 24) lt!240043) #b00000000000000000000000000000000) (tuple2!13641 Unit!9719 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!240044) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3941 (buf!3621 bs1!10)) (bvadd (currentByte!6613 bs1!10) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!240043)))))))) (tuple2!13641 Unit!9720 lt!240044))) (BitStream!5495 (buf!3621 bs1!10) (bvadd (currentByte!6613 bs1!10) #b00000000000000000000000000000001) (currentBit!6608 bs1!10))))))

(assert (=> b!153706 (= lt!240044 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3941 (buf!3621 bs1!10)) (currentByte!6613 bs1!10))) ((_ sign_extend 24) lt!240043))))))

(assert (=> b!153706 (= lt!240043 ((_ extract 7 0) (currentBit!6608 bs1!10)))))

(declare-fun lt!240042 () (_ BitVec 64))

(declare-fun b!153707 () Bool)

(declare-fun lt!240046 () (_ BitVec 64))

(assert (=> b!153707 (= e!103109 (= (bitIndex!0 (size!3118 (buf!3621 (_2!7207 lt!240040))) (currentByte!6613 (_2!7207 lt!240040)) (currentBit!6608 (_2!7207 lt!240040))) (bvadd lt!240042 lt!240046)))))

(assert (=> b!153707 (or (not (= (bvand lt!240042 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!240046 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!240042 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!240042 lt!240046) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!153707 (= lt!240046 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!153707 (= lt!240042 (bitIndex!0 (size!3118 (buf!3621 bs1!10)) (currentByte!6613 bs1!10) (currentBit!6608 bs1!10)))))

(assert (= (and d!50580 res!128726) b!153706))

(assert (= (and b!153706 res!128727) b!153707))

(assert (=> d!50580 m!239325))

(declare-fun m!239605 () Bool)

(assert (=> d!50580 m!239605))

(declare-fun m!239607 () Bool)

(assert (=> d!50580 m!239607))

(assert (=> b!153706 m!239607))

(assert (=> b!153706 m!239325))

(declare-fun m!239609 () Bool)

(assert (=> b!153707 m!239609))

(assert (=> b!153707 m!239321))

(assert (=> d!50474 d!50580))

(push 1)

(assert (not d!50576))

(assert (not b!153697))

(assert (not b!153705))

(assert (not b!153707))

(assert (not b!153699))

(assert (not d!50580))

(check-sat)

(pop 1)

(push 1)

(check-sat)

