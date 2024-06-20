; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37160 () Bool)

(assert start!37160)

(declare-fun lt!261919 () (_ BitVec 64))

(declare-fun lt!261922 () (_ BitVec 64))

(declare-fun nBits!600 () (_ BitVec 32))

(declare-fun e!117491 () Bool)

(declare-fun b!168964 () Bool)

(assert (=> b!168964 (= e!117491 (and (= lt!261919 (bvand ((_ sign_extend 32) nBits!600) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!261919 (bvand (bvadd lt!261922 ((_ sign_extend 32) nBits!600)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!168964 (= lt!261919 (bvand lt!261922 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((array!8884 0))(
  ( (array!8885 (arr!4854 (Array (_ BitVec 32) (_ BitVec 8))) (size!3933 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7022 0))(
  ( (BitStream!7023 (buf!4385 array!8884) (currentByte!8357 (_ BitVec 32)) (currentBit!8352 (_ BitVec 32))) )
))
(declare-fun thiss!1894 () BitStream!7022)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!168964 (= lt!261922 (bitIndex!0 (size!3933 (buf!4385 thiss!1894)) (currentByte!8357 thiss!1894) (currentBit!8352 thiss!1894)))))

(declare-fun res!140531 () Bool)

(assert (=> start!37160 (=> (not res!140531) (not e!117491))))

(assert (=> start!37160 (= res!140531 (and (bvsge nBits!600 #b00000000000000000000000000000001) (bvslt nBits!600 #b00000000000000000000000000001000)))))

(assert (=> start!37160 e!117491))

(assert (=> start!37160 true))

(declare-fun e!117490 () Bool)

(declare-fun inv!12 (BitStream!7022) Bool)

(assert (=> start!37160 (and (inv!12 thiss!1894) e!117490)))

(declare-datatypes ((Unit!11765 0))(
  ( (Unit!11766) )
))
(declare-datatypes ((tuple3!970 0))(
  ( (tuple3!971 (_1!7937 Unit!11765) (_2!7937 (_ BitVec 8)) (_3!611 BitStream!7022)) )
))
(declare-fun e!117489 () tuple3!970)

(declare-fun lt!261920 () (_ BitVec 32))

(declare-fun b!168965 () Bool)

(declare-fun Unit!11767 () Unit!11765)

(assert (=> b!168965 (= e!117489 (tuple3!971 Unit!11767 ((_ extract 7 0) (bvand ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4854 (buf!4385 thiss!1894)) (currentByte!8357 thiss!1894))) lt!261920))) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4854 (buf!4385 thiss!1894)) (bvadd #b00000000000000000000000000000001 (currentByte!8357 thiss!1894)))) #b00000000000000000000000011111111) (bvsub #b00000000000000000000000000001000 lt!261920))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!600)))) (BitStream!7023 (buf!4385 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8357 thiss!1894)) lt!261920)))))

(assert (=> b!168965 (= lt!261920 (bvsub (bvadd (currentBit!8352 thiss!1894) nBits!600) #b00000000000000000000000000001000))))

(declare-fun b!168966 () Bool)

(declare-fun array_inv!3674 (array!8884) Bool)

(assert (=> b!168966 (= e!117490 (array_inv!3674 (buf!4385 thiss!1894)))))

(declare-fun b!168967 () Bool)

(declare-fun res!140529 () Bool)

(assert (=> b!168967 (=> (not res!140529) (not e!117491))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!168967 (= res!140529 (validate_offset_bits!1 ((_ sign_extend 32) (size!3933 (buf!4385 thiss!1894))) ((_ sign_extend 32) (currentByte!8357 thiss!1894)) ((_ sign_extend 32) (currentBit!8352 thiss!1894)) ((_ sign_extend 32) nBits!600)))))

(declare-fun b!168968 () Bool)

(declare-fun res!140530 () Bool)

(assert (=> b!168968 (=> (not res!140530) (not e!117491))))

(assert (=> b!168968 (= res!140530 (= (buf!4385 (_3!611 e!117489)) (buf!4385 thiss!1894)))))

(declare-fun c!8714 () Bool)

(assert (=> b!168968 (= c!8714 (bvsle (bvadd (currentBit!8352 thiss!1894) nBits!600) #b00000000000000000000000000001000))))

(declare-datatypes ((tuple2!14652 0))(
  ( (tuple2!14653 (_1!7938 Unit!11765) (_2!7938 BitStream!7022)) )
))
(declare-fun lt!261921 () tuple2!14652)

(declare-fun b!168969 () Bool)

(assert (=> b!168969 (= e!117489 (tuple3!971 (_1!7938 lt!261921) ((_ extract 7 0) (bvand (bvlshr ((_ sign_extend 24) (select (arr!4854 (buf!4385 thiss!1894)) (currentByte!8357 thiss!1894))) (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!8352 thiss!1894) nBits!600))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!600)))) (_2!7938 lt!261921)))))

(declare-fun moveBitIndex!0 (BitStream!7022 (_ BitVec 64)) tuple2!14652)

(assert (=> b!168969 (= lt!261921 (moveBitIndex!0 thiss!1894 ((_ sign_extend 32) nBits!600)))))

(assert (= (and start!37160 res!140531) b!168967))

(assert (= (and b!168967 res!140529) b!168968))

(assert (= (and b!168968 c!8714) b!168969))

(assert (= (and b!168968 (not c!8714)) b!168965))

(assert (= (and b!168968 res!140530) b!168964))

(assert (= start!37160 b!168966))

(declare-fun m!268541 () Bool)

(assert (=> b!168964 m!268541))

(declare-fun m!268543 () Bool)

(assert (=> b!168966 m!268543))

(declare-fun m!268545 () Bool)

(assert (=> b!168969 m!268545))

(declare-fun m!268547 () Bool)

(assert (=> b!168969 m!268547))

(declare-fun m!268549 () Bool)

(assert (=> b!168969 m!268549))

(assert (=> b!168965 m!268545))

(declare-fun m!268551 () Bool)

(assert (=> b!168965 m!268551))

(assert (=> b!168965 m!268547))

(declare-fun m!268553 () Bool)

(assert (=> b!168967 m!268553))

(declare-fun m!268555 () Bool)

(assert (=> start!37160 m!268555))

(push 1)

(assert (not b!168964))

(assert (not b!168969))

(assert (not b!168967))

(assert (not start!37160))

(assert (not b!168966))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!59723 () Bool)

(declare-fun e!117495 () Bool)

(assert (=> d!59723 e!117495))

(declare-fun res!140537 () Bool)

(assert (=> d!59723 (=> (not res!140537) (not e!117495))))

(declare-fun lt!261939 () (_ BitVec 64))

(declare-fun lt!261942 () (_ BitVec 64))

(declare-fun lt!261938 () (_ BitVec 64))

(assert (=> d!59723 (= res!140537 (= lt!261938 (bvsub lt!261942 lt!261939)))))

(assert (=> d!59723 (or (= (bvand lt!261942 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!261939 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!261942 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!261942 lt!261939) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!59723 (= lt!261939 (remainingBits!0 ((_ sign_extend 32) (size!3933 (buf!4385 thiss!1894))) ((_ sign_extend 32) (currentByte!8357 thiss!1894)) ((_ sign_extend 32) (currentBit!8352 thiss!1894))))))

(declare-fun lt!261940 () (_ BitVec 64))

(declare-fun lt!261941 () (_ BitVec 64))

(assert (=> d!59723 (= lt!261942 (bvmul lt!261940 lt!261941))))

(assert (=> d!59723 (or (= lt!261940 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!261941 (bvsdiv (bvmul lt!261940 lt!261941) lt!261940)))))

(assert (=> d!59723 (= lt!261941 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!59723 (= lt!261940 ((_ sign_extend 32) (size!3933 (buf!4385 thiss!1894))))))

(assert (=> d!59723 (= lt!261938 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8357 thiss!1894)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8352 thiss!1894))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!59723 (invariant!0 (currentBit!8352 thiss!1894) (currentByte!8357 thiss!1894) (size!3933 (buf!4385 thiss!1894)))))

(assert (=> d!59723 (= (bitIndex!0 (size!3933 (buf!4385 thiss!1894)) (currentByte!8357 thiss!1894) (currentBit!8352 thiss!1894)) lt!261938)))

(declare-fun b!168974 () Bool)

(declare-fun res!140536 () Bool)

(assert (=> b!168974 (=> (not res!140536) (not e!117495))))

(assert (=> b!168974 (= res!140536 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!261938))))

(declare-fun b!168975 () Bool)

(declare-fun lt!261937 () (_ BitVec 64))

(assert (=> b!168975 (= e!117495 (bvsle lt!261938 (bvmul lt!261937 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!168975 (or (= lt!261937 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!261937 #b0000000000000000000000000000000000000000000000000000000000001000) lt!261937)))))

(assert (=> b!168975 (= lt!261937 ((_ sign_extend 32) (size!3933 (buf!4385 thiss!1894))))))

(assert (= (and d!59723 res!140537) b!168974))

(assert (= (and b!168974 res!140536) b!168975))

(declare-fun m!268559 () Bool)

(assert (=> d!59723 m!268559))

(declare-fun m!268561 () Bool)

(assert (=> d!59723 m!268561))

(assert (=> b!168964 d!59723))

(declare-fun d!59729 () Bool)

(declare-fun lt!262022 () (_ BitVec 32))

(assert (=> d!59729 (= lt!262022 ((_ extract 31 0) (bvsrem ((_ sign_extend 32) nBits!600) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!262020 () (_ BitVec 32))

(assert (=> d!59729 (= lt!262020 ((_ extract 31 0) (bvsdiv ((_ sign_extend 32) nBits!600) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!117517 () Bool)

(assert (=> d!59729 e!117517))

(declare-fun res!140564 () Bool)

(assert (=> d!59729 (=> (not res!140564) (not e!117517))))

(declare-fun moveBitIndexPrecond!0 (BitStream!7022 (_ BitVec 64)) Bool)

(assert (=> d!59729 (= res!140564 (moveBitIndexPrecond!0 thiss!1894 ((_ sign_extend 32) nBits!600)))))

(declare-fun Unit!11777 () Unit!11765)

(declare-fun Unit!11778 () Unit!11765)

(declare-fun Unit!11779 () Unit!11765)

(assert (=> d!59729 (= (moveBitIndex!0 thiss!1894 ((_ sign_extend 32) nBits!600)) (ite (bvslt (bvadd (currentBit!8352 thiss!1894) lt!262022) #b00000000000000000000000000000000) (tuple2!14653 Unit!11777 (BitStream!7023 (buf!4385 thiss!1894) (bvsub (bvadd (currentByte!8357 thiss!1894) lt!262020) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!262022 (currentBit!8352 thiss!1894)))) (ite (bvsge (bvadd (currentBit!8352 thiss!1894) lt!262022) #b00000000000000000000000000001000) (tuple2!14653 Unit!11778 (BitStream!7023 (buf!4385 thiss!1894) (bvadd (currentByte!8357 thiss!1894) lt!262020 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!8352 thiss!1894) lt!262022) #b00000000000000000000000000001000))) (tuple2!14653 Unit!11779 (BitStream!7023 (buf!4385 thiss!1894) (bvadd (currentByte!8357 thiss!1894) lt!262020) (bvadd (currentBit!8352 thiss!1894) lt!262022))))))))

(declare-fun b!169002 () Bool)

(declare-fun e!117516 () Bool)

(assert (=> b!169002 (= e!117517 e!117516)))

(declare-fun res!140565 () Bool)

(assert (=> b!169002 (=> (not res!140565) (not e!117516))))

(declare-fun lt!262024 () tuple2!14652)

(declare-fun lt!262023 () (_ BitVec 64))

(assert (=> b!169002 (= res!140565 (= (bvadd lt!262023 ((_ sign_extend 32) nBits!600)) (bitIndex!0 (size!3933 (buf!4385 (_2!7938 lt!262024))) (currentByte!8357 (_2!7938 lt!262024)) (currentBit!8352 (_2!7938 lt!262024)))))))

(assert (=> b!169002 (or (not (= (bvand lt!262023 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand ((_ sign_extend 32) nBits!600) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!262023 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!262023 ((_ sign_extend 32) nBits!600)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!169002 (= lt!262023 (bitIndex!0 (size!3933 (buf!4385 thiss!1894)) (currentByte!8357 thiss!1894) (currentBit!8352 thiss!1894)))))

(declare-fun lt!262021 () (_ BitVec 32))

(declare-fun lt!262019 () (_ BitVec 32))

(declare-fun Unit!11783 () Unit!11765)

(declare-fun Unit!11784 () Unit!11765)

(declare-fun Unit!11785 () Unit!11765)

(assert (=> b!169002 (= lt!262024 (ite (bvslt (bvadd (currentBit!8352 thiss!1894) lt!262021) #b00000000000000000000000000000000) (tuple2!14653 Unit!11783 (BitStream!7023 (buf!4385 thiss!1894) (bvsub (bvadd (currentByte!8357 thiss!1894) lt!262019) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!262021 (currentBit!8352 thiss!1894)))) (ite (bvsge (bvadd (currentBit!8352 thiss!1894) lt!262021) #b00000000000000000000000000001000) (tuple2!14653 Unit!11784 (BitStream!7023 (buf!4385 thiss!1894) (bvadd (currentByte!8357 thiss!1894) lt!262019 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!8352 thiss!1894) lt!262021) #b00000000000000000000000000001000))) (tuple2!14653 Unit!11785 (BitStream!7023 (buf!4385 thiss!1894) (bvadd (currentByte!8357 thiss!1894) lt!262019) (bvadd (currentBit!8352 thiss!1894) lt!262021))))))))

(assert (=> b!169002 (= lt!262021 ((_ extract 31 0) (bvsrem ((_ sign_extend 32) nBits!600) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!169002 (= lt!262019 ((_ extract 31 0) (bvsdiv ((_ sign_extend 32) nBits!600) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!169003 () Bool)

(assert (=> b!169003 (= e!117516 (and (= (size!3933 (buf!4385 thiss!1894)) (size!3933 (buf!4385 (_2!7938 lt!262024)))) (= (buf!4385 thiss!1894) (buf!4385 (_2!7938 lt!262024)))))))

(assert (= (and d!59729 res!140564) b!169002))

(assert (= (and b!169002 res!140565) b!169003))

(declare-fun m!268573 () Bool)

(assert (=> d!59729 m!268573))

(declare-fun m!268575 () Bool)

(assert (=> b!169002 m!268575))

(assert (=> b!169002 m!268541))

(assert (=> b!168969 d!59729))

(declare-fun d!59745 () Bool)

(assert (=> d!59745 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3933 (buf!4385 thiss!1894))) ((_ sign_extend 32) (currentByte!8357 thiss!1894)) ((_ sign_extend 32) (currentBit!8352 thiss!1894)) ((_ sign_extend 32) nBits!600)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3933 (buf!4385 thiss!1894))) ((_ sign_extend 32) (currentByte!8357 thiss!1894)) ((_ sign_extend 32) (currentBit!8352 thiss!1894))) ((_ sign_extend 32) nBits!600)))))

(declare-fun bs!14814 () Bool)

(assert (= bs!14814 d!59745))

(assert (=> bs!14814 m!268559))

(assert (=> b!168967 d!59745))

(declare-fun d!59747 () Bool)

(assert (=> d!59747 (= (inv!12 thiss!1894) (invariant!0 (currentBit!8352 thiss!1894) (currentByte!8357 thiss!1894) (size!3933 (buf!4385 thiss!1894))))))

(declare-fun bs!14815 () Bool)

(assert (= bs!14815 d!59747))

(assert (=> bs!14815 m!268561))

(assert (=> start!37160 d!59747))

(declare-fun d!59751 () Bool)

(assert (=> d!59751 (= (array_inv!3674 (buf!4385 thiss!1894)) (bvsge (size!3933 (buf!4385 thiss!1894)) #b00000000000000000000000000000000))))

(assert (=> b!168966 d!59751))

(push 1)

(assert (not d!59723))

(assert (not d!59745))

(assert (not d!59729))

(assert (not d!59747))

(assert (not b!169002))

(check-sat)

(pop 1)

(push 1)

(check-sat)

