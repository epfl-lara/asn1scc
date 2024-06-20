; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37192 () Bool)

(assert start!37192)

(declare-fun b!169018 () Bool)

(declare-fun e!117533 () Bool)

(declare-fun e!117530 () Bool)

(assert (=> b!169018 (= e!117533 e!117530)))

(declare-fun res!140574 () Bool)

(assert (=> b!169018 (=> res!140574 e!117530)))

(declare-datatypes ((array!8889 0))(
  ( (array!8890 (arr!4855 (Array (_ BitVec 32) (_ BitVec 8))) (size!3934 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7024 0))(
  ( (BitStream!7025 (buf!4386 array!8889) (currentByte!8364 (_ BitVec 32)) (currentBit!8359 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!11786 0))(
  ( (Unit!11787) )
))
(declare-datatypes ((tuple3!972 0))(
  ( (tuple3!973 (_1!7939 Unit!11786) (_2!7939 (_ BitVec 8)) (_3!612 BitStream!7024)) )
))
(declare-fun lt!262039 () tuple3!972)

(declare-fun thiss!1894 () BitStream!7024)

(assert (=> b!169018 (= res!140574 (not (= (buf!4386 (_3!612 lt!262039)) (buf!4386 thiss!1894))))))

(declare-fun e!117531 () tuple3!972)

(assert (=> b!169018 (= lt!262039 e!117531)))

(declare-fun c!8717 () Bool)

(declare-fun nBits!600 () (_ BitVec 32))

(assert (=> b!169018 (= c!8717 (bvsle (bvadd (currentBit!8359 thiss!1894) nBits!600) #b00000000000000000000000000001000))))

(declare-fun b!169020 () Bool)

(declare-fun res!140575 () Bool)

(assert (=> b!169020 (=> (not res!140575) (not e!117533))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!169020 (= res!140575 (validate_offset_bits!1 ((_ sign_extend 32) (size!3934 (buf!4386 thiss!1894))) ((_ sign_extend 32) (currentByte!8364 thiss!1894)) ((_ sign_extend 32) (currentBit!8359 thiss!1894)) ((_ sign_extend 32) nBits!600)))))

(declare-fun b!169021 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!169021 (= e!117530 (not (= (bitIndex!0 (size!3934 (buf!4386 (_3!612 lt!262039))) (currentByte!8364 (_3!612 lt!262039)) (currentBit!8359 (_3!612 lt!262039))) (bvadd (bitIndex!0 (size!3934 (buf!4386 thiss!1894)) (currentByte!8364 thiss!1894) (currentBit!8359 thiss!1894)) ((_ sign_extend 32) nBits!600)))))))

(declare-fun b!169022 () Bool)

(declare-datatypes ((tuple2!14654 0))(
  ( (tuple2!14655 (_1!7940 Unit!11786) (_2!7940 BitStream!7024)) )
))
(declare-fun lt!262038 () tuple2!14654)

(assert (=> b!169022 (= e!117531 (tuple3!973 (_1!7940 lt!262038) ((_ extract 7 0) (bvand (bvlshr ((_ sign_extend 24) (select (arr!4855 (buf!4386 thiss!1894)) (currentByte!8364 thiss!1894))) (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!8359 thiss!1894) nBits!600))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!600)))) (_2!7940 lt!262038)))))

(declare-fun moveBitIndex!0 (BitStream!7024 (_ BitVec 64)) tuple2!14654)

(assert (=> b!169022 (= lt!262038 (moveBitIndex!0 thiss!1894 ((_ sign_extend 32) nBits!600)))))

(declare-fun lt!262037 () (_ BitVec 32))

(declare-fun b!169023 () Bool)

(declare-fun Unit!11788 () Unit!11786)

(assert (=> b!169023 (= e!117531 (tuple3!973 Unit!11788 ((_ extract 7 0) (bvand ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4855 (buf!4386 thiss!1894)) (currentByte!8364 thiss!1894))) lt!262037))) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4855 (buf!4386 thiss!1894)) (bvadd #b00000000000000000000000000000001 (currentByte!8364 thiss!1894)))) #b00000000000000000000000011111111) (bvsub #b00000000000000000000000000001000 lt!262037))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!600)))) (BitStream!7025 (buf!4386 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8364 thiss!1894)) lt!262037)))))

(assert (=> b!169023 (= lt!262037 (bvsub (bvadd (currentBit!8359 thiss!1894) nBits!600) #b00000000000000000000000000001000))))

(declare-fun res!140576 () Bool)

(assert (=> start!37192 (=> (not res!140576) (not e!117533))))

(assert (=> start!37192 (= res!140576 (and (bvsge nBits!600 #b00000000000000000000000000000001) (bvslt nBits!600 #b00000000000000000000000000001000)))))

(assert (=> start!37192 e!117533))

(assert (=> start!37192 true))

(declare-fun e!117534 () Bool)

(declare-fun inv!12 (BitStream!7024) Bool)

(assert (=> start!37192 (and (inv!12 thiss!1894) e!117534)))

(declare-fun b!169019 () Bool)

(declare-fun array_inv!3675 (array!8889) Bool)

(assert (=> b!169019 (= e!117534 (array_inv!3675 (buf!4386 thiss!1894)))))

(assert (= (and start!37192 res!140576) b!169020))

(assert (= (and b!169020 res!140575) b!169018))

(assert (= (and b!169018 c!8717) b!169022))

(assert (= (and b!169018 (not c!8717)) b!169023))

(assert (= (and b!169018 (not res!140574)) b!169021))

(assert (= start!37192 b!169019))

(declare-fun m!268581 () Bool)

(assert (=> b!169023 m!268581))

(declare-fun m!268583 () Bool)

(assert (=> b!169023 m!268583))

(declare-fun m!268585 () Bool)

(assert (=> b!169023 m!268585))

(assert (=> b!169022 m!268581))

(assert (=> b!169022 m!268585))

(declare-fun m!268587 () Bool)

(assert (=> b!169022 m!268587))

(declare-fun m!268589 () Bool)

(assert (=> start!37192 m!268589))

(declare-fun m!268591 () Bool)

(assert (=> b!169019 m!268591))

(declare-fun m!268593 () Bool)

(assert (=> b!169021 m!268593))

(declare-fun m!268595 () Bool)

(assert (=> b!169021 m!268595))

(declare-fun m!268597 () Bool)

(assert (=> b!169020 m!268597))

(push 1)

(assert (not b!169020))

(assert (not b!169021))

(assert (not b!169019))

(assert (not b!169022))

(assert (not start!37192))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!59757 () Bool)

(declare-fun e!117567 () Bool)

(assert (=> d!59757 e!117567))

(declare-fun res!140600 () Bool)

(assert (=> d!59757 (=> (not res!140600) (not e!117567))))

(declare-fun lt!262074 () (_ BitVec 64))

(declare-fun lt!262072 () (_ BitVec 64))

(declare-fun lt!262073 () (_ BitVec 64))

(assert (=> d!59757 (= res!140600 (= lt!262072 (bvsub lt!262074 lt!262073)))))

(assert (=> d!59757 (or (= (bvand lt!262074 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!262073 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!262074 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!262074 lt!262073) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!59757 (= lt!262073 (remainingBits!0 ((_ sign_extend 32) (size!3934 (buf!4386 (_3!612 lt!262039)))) ((_ sign_extend 32) (currentByte!8364 (_3!612 lt!262039))) ((_ sign_extend 32) (currentBit!8359 (_3!612 lt!262039)))))))

(declare-fun lt!262075 () (_ BitVec 64))

(declare-fun lt!262071 () (_ BitVec 64))

(assert (=> d!59757 (= lt!262074 (bvmul lt!262075 lt!262071))))

(assert (=> d!59757 (or (= lt!262075 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!262071 (bvsdiv (bvmul lt!262075 lt!262071) lt!262075)))))

(assert (=> d!59757 (= lt!262071 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!59757 (= lt!262075 ((_ sign_extend 32) (size!3934 (buf!4386 (_3!612 lt!262039)))))))

(assert (=> d!59757 (= lt!262072 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8364 (_3!612 lt!262039))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8359 (_3!612 lt!262039)))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!59757 (invariant!0 (currentBit!8359 (_3!612 lt!262039)) (currentByte!8364 (_3!612 lt!262039)) (size!3934 (buf!4386 (_3!612 lt!262039))))))

(assert (=> d!59757 (= (bitIndex!0 (size!3934 (buf!4386 (_3!612 lt!262039))) (currentByte!8364 (_3!612 lt!262039)) (currentBit!8359 (_3!612 lt!262039))) lt!262072)))

(declare-fun b!169064 () Bool)

(declare-fun res!140599 () Bool)

(assert (=> b!169064 (=> (not res!140599) (not e!117567))))

(assert (=> b!169064 (= res!140599 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!262072))))

(declare-fun b!169065 () Bool)

(declare-fun lt!262070 () (_ BitVec 64))

(assert (=> b!169065 (= e!117567 (bvsle lt!262072 (bvmul lt!262070 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!169065 (or (= lt!262070 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!262070 #b0000000000000000000000000000000000000000000000000000000000001000) lt!262070)))))

(assert (=> b!169065 (= lt!262070 ((_ sign_extend 32) (size!3934 (buf!4386 (_3!612 lt!262039)))))))

(assert (= (and d!59757 res!140600) b!169064))

(assert (= (and b!169064 res!140599) b!169065))

(declare-fun m!268635 () Bool)

(assert (=> d!59757 m!268635))

(declare-fun m!268637 () Bool)

(assert (=> d!59757 m!268637))

(assert (=> b!169021 d!59757))

(declare-fun d!59759 () Bool)

(declare-fun e!117568 () Bool)

(assert (=> d!59759 e!117568))

(declare-fun res!140602 () Bool)

(assert (=> d!59759 (=> (not res!140602) (not e!117568))))

(declare-fun lt!262078 () (_ BitVec 64))

(declare-fun lt!262079 () (_ BitVec 64))

(declare-fun lt!262080 () (_ BitVec 64))

(assert (=> d!59759 (= res!140602 (= lt!262078 (bvsub lt!262080 lt!262079)))))

(assert (=> d!59759 (or (= (bvand lt!262080 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!262079 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!262080 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!262080 lt!262079) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!59759 (= lt!262079 (remainingBits!0 ((_ sign_extend 32) (size!3934 (buf!4386 thiss!1894))) ((_ sign_extend 32) (currentByte!8364 thiss!1894)) ((_ sign_extend 32) (currentBit!8359 thiss!1894))))))

(declare-fun lt!262081 () (_ BitVec 64))

(declare-fun lt!262077 () (_ BitVec 64))

(assert (=> d!59759 (= lt!262080 (bvmul lt!262081 lt!262077))))

(assert (=> d!59759 (or (= lt!262081 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!262077 (bvsdiv (bvmul lt!262081 lt!262077) lt!262081)))))

(assert (=> d!59759 (= lt!262077 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!59759 (= lt!262081 ((_ sign_extend 32) (size!3934 (buf!4386 thiss!1894))))))

(assert (=> d!59759 (= lt!262078 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8364 thiss!1894)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8359 thiss!1894))))))

(assert (=> d!59759 (invariant!0 (currentBit!8359 thiss!1894) (currentByte!8364 thiss!1894) (size!3934 (buf!4386 thiss!1894)))))

(assert (=> d!59759 (= (bitIndex!0 (size!3934 (buf!4386 thiss!1894)) (currentByte!8364 thiss!1894) (currentBit!8359 thiss!1894)) lt!262078)))

(declare-fun b!169066 () Bool)

(declare-fun res!140601 () Bool)

(assert (=> b!169066 (=> (not res!140601) (not e!117568))))

(assert (=> b!169066 (= res!140601 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!262078))))

(declare-fun b!169067 () Bool)

(declare-fun lt!262076 () (_ BitVec 64))

(assert (=> b!169067 (= e!117568 (bvsle lt!262078 (bvmul lt!262076 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!169067 (or (= lt!262076 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!262076 #b0000000000000000000000000000000000000000000000000000000000001000) lt!262076)))))

(assert (=> b!169067 (= lt!262076 ((_ sign_extend 32) (size!3934 (buf!4386 thiss!1894))))))

(assert (= (and d!59759 res!140602) b!169066))

(assert (= (and b!169066 res!140601) b!169067))

(declare-fun m!268639 () Bool)

(assert (=> d!59759 m!268639))

(declare-fun m!268641 () Bool)

(assert (=> d!59759 m!268641))

(assert (=> b!169021 d!59759))

(declare-fun d!59761 () Bool)

(assert (=> d!59761 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3934 (buf!4386 thiss!1894))) ((_ sign_extend 32) (currentByte!8364 thiss!1894)) ((_ sign_extend 32) (currentBit!8359 thiss!1894)) ((_ sign_extend 32) nBits!600)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3934 (buf!4386 thiss!1894))) ((_ sign_extend 32) (currentByte!8364 thiss!1894)) ((_ sign_extend 32) (currentBit!8359 thiss!1894))) ((_ sign_extend 32) nBits!600)))))

(declare-fun bs!14820 () Bool)

(assert (= bs!14820 d!59761))

(assert (=> bs!14820 m!268639))

(assert (=> b!169020 d!59761))

(declare-fun d!59763 () Bool)

(assert (=> d!59763 (= (inv!12 thiss!1894) (invariant!0 (currentBit!8359 thiss!1894) (currentByte!8364 thiss!1894) (size!3934 (buf!4386 thiss!1894))))))

(declare-fun bs!14821 () Bool)

(assert (= bs!14821 d!59763))

(assert (=> bs!14821 m!268641))

(assert (=> start!37192 d!59763))

(declare-fun d!59765 () Bool)

(assert (=> d!59765 (= (array_inv!3675 (buf!4386 thiss!1894)) (bvsge (size!3934 (buf!4386 thiss!1894)) #b00000000000000000000000000000000))))

(assert (=> b!169019 d!59765))

(declare-fun d!59767 () Bool)

(declare-fun lt!262108 () (_ BitVec 32))

(assert (=> d!59767 (= lt!262108 ((_ extract 31 0) (bvsrem ((_ sign_extend 32) nBits!600) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!262110 () (_ BitVec 32))

(assert (=> d!59767 (= lt!262110 ((_ extract 31 0) (bvsdiv ((_ sign_extend 32) nBits!600) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!117577 () Bool)

(assert (=> d!59767 e!117577))

(declare-fun res!140611 () Bool)

(assert (=> d!59767 (=> (not res!140611) (not e!117577))))

(declare-fun moveBitIndexPrecond!0 (BitStream!7024 (_ BitVec 64)) Bool)

(assert (=> d!59767 (= res!140611 (moveBitIndexPrecond!0 thiss!1894 ((_ sign_extend 32) nBits!600)))))

(declare-fun Unit!11795 () Unit!11786)

(declare-fun Unit!11796 () Unit!11786)

(declare-fun Unit!11797 () Unit!11786)

(assert (=> d!59767 (= (moveBitIndex!0 thiss!1894 ((_ sign_extend 32) nBits!600)) (ite (bvslt (bvadd (currentBit!8359 thiss!1894) lt!262108) #b00000000000000000000000000000000) (tuple2!14655 Unit!11795 (BitStream!7025 (buf!4386 thiss!1894) (bvsub (bvadd (currentByte!8364 thiss!1894) lt!262110) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!262108 (currentBit!8359 thiss!1894)))) (ite (bvsge (bvadd (currentBit!8359 thiss!1894) lt!262108) #b00000000000000000000000000001000) (tuple2!14655 Unit!11796 (BitStream!7025 (buf!4386 thiss!1894) (bvadd (currentByte!8364 thiss!1894) lt!262110 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!8359 thiss!1894) lt!262108) #b00000000000000000000000000001000))) (tuple2!14655 Unit!11797 (BitStream!7025 (buf!4386 thiss!1894) (bvadd (currentByte!8364 thiss!1894) lt!262110) (bvadd (currentBit!8359 thiss!1894) lt!262108))))))))

(declare-fun b!169076 () Bool)

(declare-fun e!117578 () Bool)

(assert (=> b!169076 (= e!117577 e!117578)))

(declare-fun res!140612 () Bool)

(assert (=> b!169076 (=> (not res!140612) (not e!117578))))

(declare-fun lt!262107 () tuple2!14654)

(declare-fun lt!262106 () (_ BitVec 64))

(assert (=> b!169076 (= res!140612 (= (bvadd lt!262106 ((_ sign_extend 32) nBits!600)) (bitIndex!0 (size!3934 (buf!4386 (_2!7940 lt!262107))) (currentByte!8364 (_2!7940 lt!262107)) (currentBit!8359 (_2!7940 lt!262107)))))))

(assert (=> b!169076 (or (not (= (bvand lt!262106 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand ((_ sign_extend 32) nBits!600) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!262106 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!262106 ((_ sign_extend 32) nBits!600)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!169076 (= lt!262106 (bitIndex!0 (size!3934 (buf!4386 thiss!1894)) (currentByte!8364 thiss!1894) (currentBit!8359 thiss!1894)))))

(declare-fun lt!262111 () (_ BitVec 32))

(declare-fun lt!262109 () (_ BitVec 32))

(declare-fun Unit!11798 () Unit!11786)

(declare-fun Unit!11799 () Unit!11786)

(declare-fun Unit!11800 () Unit!11786)

(assert (=> b!169076 (= lt!262107 (ite (bvslt (bvadd (currentBit!8359 thiss!1894) lt!262109) #b00000000000000000000000000000000) (tuple2!14655 Unit!11798 (BitStream!7025 (buf!4386 thiss!1894) (bvsub (bvadd (currentByte!8364 thiss!1894) lt!262111) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!262109 (currentBit!8359 thiss!1894)))) (ite (bvsge (bvadd (currentBit!8359 thiss!1894) lt!262109) #b00000000000000000000000000001000) (tuple2!14655 Unit!11799 (BitStream!7025 (buf!4386 thiss!1894) (bvadd (currentByte!8364 thiss!1894) lt!262111 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!8359 thiss!1894) lt!262109) #b00000000000000000000000000001000))) (tuple2!14655 Unit!11800 (BitStream!7025 (buf!4386 thiss!1894) (bvadd (currentByte!8364 thiss!1894) lt!262111) (bvadd (currentBit!8359 thiss!1894) lt!262109))))))))

(assert (=> b!169076 (= lt!262109 ((_ extract 31 0) (bvsrem ((_ sign_extend 32) nBits!600) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!169076 (= lt!262111 ((_ extract 31 0) (bvsdiv ((_ sign_extend 32) nBits!600) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!169077 () Bool)

(assert (=> b!169077 (= e!117578 (and (= (size!3934 (buf!4386 thiss!1894)) (size!3934 (buf!4386 (_2!7940 lt!262107)))) (= (buf!4386 thiss!1894) (buf!4386 (_2!7940 lt!262107)))))))

(assert (= (and d!59767 res!140611) b!169076))

(assert (= (and b!169076 res!140612) b!169077))

(declare-fun m!268645 () Bool)

(assert (=> d!59767 m!268645))

(declare-fun m!268647 () Bool)

(assert (=> b!169076 m!268647))

(assert (=> b!169076 m!268595))

(assert (=> b!169022 d!59767))

(push 1)

(assert (not d!59761))

(assert (not b!169076))

(assert (not d!59767))

(assert (not d!59759))

(assert (not d!59757))

(assert (not d!59763))

(check-sat)

(pop 1)

(push 1)

(check-sat)

