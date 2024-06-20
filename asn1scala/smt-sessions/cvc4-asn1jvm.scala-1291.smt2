; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36728 () Bool)

(assert start!36728)

(declare-fun b!168415 () Bool)

(declare-fun e!117008 () Bool)

(declare-datatypes ((array!8761 0))(
  ( (array!8762 (arr!4809 (Array (_ BitVec 32) (_ BitVec 8))) (size!3888 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6932 0))(
  ( (BitStream!6933 (buf!4340 array!8761) (currentByte!8216 (_ BitVec 32)) (currentBit!8211 (_ BitVec 32))) )
))
(declare-fun thiss!1894 () BitStream!6932)

(declare-fun array_inv!3629 (array!8761) Bool)

(assert (=> b!168415 (= e!117008 (array_inv!3629 (buf!4340 thiss!1894)))))

(declare-fun res!140155 () Bool)

(declare-fun e!117012 () Bool)

(assert (=> start!36728 (=> (not res!140155) (not e!117012))))

(declare-fun nBits!600 () (_ BitVec 32))

(assert (=> start!36728 (= res!140155 (and (bvsge nBits!600 #b00000000000000000000000000000001) (bvslt nBits!600 #b00000000000000000000000000001000)))))

(assert (=> start!36728 e!117012))

(assert (=> start!36728 true))

(declare-fun inv!12 (BitStream!6932) Bool)

(assert (=> start!36728 (and (inv!12 thiss!1894) e!117008)))

(declare-datatypes ((Unit!11714 0))(
  ( (Unit!11715) )
))
(declare-datatypes ((tuple3!958 0))(
  ( (tuple3!959 (_1!7925 Unit!11714) (_2!7925 (_ BitVec 8)) (_3!605 BitStream!6932)) )
))
(declare-fun e!117011 () tuple3!958)

(declare-fun b!168416 () Bool)

(declare-fun lt!261677 () (_ BitVec 32))

(declare-fun Unit!11716 () Unit!11714)

(assert (=> b!168416 (= e!117011 (tuple3!959 Unit!11716 ((_ extract 7 0) (bvand ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4809 (buf!4340 thiss!1894)) (currentByte!8216 thiss!1894))) lt!261677))) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4809 (buf!4340 thiss!1894)) (bvadd #b00000000000000000000000000000001 (currentByte!8216 thiss!1894)))) #b00000000000000000000000011111111) (bvsub #b00000000000000000000000000001000 lt!261677))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!600)))) (BitStream!6933 (buf!4340 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8216 thiss!1894)) lt!261677)))))

(assert (=> b!168416 (= lt!261677 (bvsub (bvadd (currentBit!8211 thiss!1894) nBits!600) #b00000000000000000000000000001000))))

(declare-fun b!168417 () Bool)

(declare-datatypes ((tuple2!14640 0))(
  ( (tuple2!14641 (_1!7926 Unit!11714) (_2!7926 BitStream!6932)) )
))
(declare-fun lt!261679 () tuple2!14640)

(assert (=> b!168417 (= e!117011 (tuple3!959 (_1!7926 lt!261679) ((_ extract 7 0) (bvand (bvlshr ((_ sign_extend 24) (select (arr!4809 (buf!4340 thiss!1894)) (currentByte!8216 thiss!1894))) (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!8211 thiss!1894) nBits!600))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!600)))) (_2!7926 lt!261679)))))

(declare-fun moveBitIndex!0 (BitStream!6932 (_ BitVec 64)) tuple2!14640)

(assert (=> b!168417 (= lt!261679 (moveBitIndex!0 thiss!1894 ((_ sign_extend 32) nBits!600)))))

(declare-fun b!168418 () Bool)

(declare-fun e!117010 () Bool)

(assert (=> b!168418 (= e!117012 e!117010)))

(declare-fun res!140156 () Bool)

(assert (=> b!168418 (=> (not res!140156) (not e!117010))))

(declare-fun lt!261678 () tuple3!958)

(assert (=> b!168418 (= res!140156 (= (buf!4340 (_3!605 lt!261678)) (buf!4340 thiss!1894)))))

(assert (=> b!168418 (= lt!261678 e!117011)))

(declare-fun c!8696 () Bool)

(assert (=> b!168418 (= c!8696 (bvsle (bvadd (currentBit!8211 thiss!1894) nBits!600) #b00000000000000000000000000001000))))

(declare-fun b!168419 () Bool)

(declare-fun res!140154 () Bool)

(assert (=> b!168419 (=> (not res!140154) (not e!117012))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!168419 (= res!140154 (validate_offset_bits!1 ((_ sign_extend 32) (size!3888 (buf!4340 thiss!1894))) ((_ sign_extend 32) (currentByte!8216 thiss!1894)) ((_ sign_extend 32) (currentBit!8211 thiss!1894)) ((_ sign_extend 32) nBits!600)))))

(declare-fun b!168420 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!168420 (= e!117010 (not (invariant!0 (currentBit!8211 (_3!605 lt!261678)) (currentByte!8216 (_3!605 lt!261678)) (size!3888 (buf!4340 (_3!605 lt!261678))))))))

(assert (= (and start!36728 res!140155) b!168419))

(assert (= (and b!168419 res!140154) b!168418))

(assert (= (and b!168418 c!8696) b!168417))

(assert (= (and b!168418 (not c!8696)) b!168416))

(assert (= (and b!168418 res!140156) b!168420))

(assert (= start!36728 b!168415))

(declare-fun m!268013 () Bool)

(assert (=> b!168416 m!268013))

(declare-fun m!268015 () Bool)

(assert (=> b!168416 m!268015))

(declare-fun m!268017 () Bool)

(assert (=> b!168416 m!268017))

(assert (=> b!168417 m!268013))

(assert (=> b!168417 m!268017))

(declare-fun m!268019 () Bool)

(assert (=> b!168417 m!268019))

(declare-fun m!268021 () Bool)

(assert (=> start!36728 m!268021))

(declare-fun m!268023 () Bool)

(assert (=> b!168420 m!268023))

(declare-fun m!268025 () Bool)

(assert (=> b!168415 m!268025))

(declare-fun m!268027 () Bool)

(assert (=> b!168419 m!268027))

(push 1)

(assert (not b!168415))

(assert (not b!168420))

(assert (not start!36728))

(assert (not b!168417))

(assert (not b!168419))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!59301 () Bool)

(assert (=> d!59301 (= (inv!12 thiss!1894) (invariant!0 (currentBit!8211 thiss!1894) (currentByte!8216 thiss!1894) (size!3888 (buf!4340 thiss!1894))))))

(declare-fun bs!14695 () Bool)

(assert (= bs!14695 d!59301))

(declare-fun m!268031 () Bool)

(assert (=> bs!14695 m!268031))

(assert (=> start!36728 d!59301))

(declare-fun d!59307 () Bool)

(declare-fun lt!261722 () (_ BitVec 32))

(assert (=> d!59307 (= lt!261722 ((_ extract 31 0) (bvsrem ((_ sign_extend 32) nBits!600) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!261725 () (_ BitVec 32))

(assert (=> d!59307 (= lt!261725 ((_ extract 31 0) (bvsdiv ((_ sign_extend 32) nBits!600) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!117027 () Bool)

(assert (=> d!59307 e!117027))

(declare-fun res!140172 () Bool)

(assert (=> d!59307 (=> (not res!140172) (not e!117027))))

(declare-fun moveBitIndexPrecond!0 (BitStream!6932 (_ BitVec 64)) Bool)

(assert (=> d!59307 (= res!140172 (moveBitIndexPrecond!0 thiss!1894 ((_ sign_extend 32) nBits!600)))))

(declare-fun Unit!11720 () Unit!11714)

(declare-fun Unit!11721 () Unit!11714)

(declare-fun Unit!11722 () Unit!11714)

(assert (=> d!59307 (= (moveBitIndex!0 thiss!1894 ((_ sign_extend 32) nBits!600)) (ite (bvslt (bvadd (currentBit!8211 thiss!1894) lt!261722) #b00000000000000000000000000000000) (tuple2!14641 Unit!11720 (BitStream!6933 (buf!4340 thiss!1894) (bvsub (bvadd (currentByte!8216 thiss!1894) lt!261725) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!261722 (currentBit!8211 thiss!1894)))) (ite (bvsge (bvadd (currentBit!8211 thiss!1894) lt!261722) #b00000000000000000000000000001000) (tuple2!14641 Unit!11721 (BitStream!6933 (buf!4340 thiss!1894) (bvadd (currentByte!8216 thiss!1894) lt!261725 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!8211 thiss!1894) lt!261722) #b00000000000000000000000000001000))) (tuple2!14641 Unit!11722 (BitStream!6933 (buf!4340 thiss!1894) (bvadd (currentByte!8216 thiss!1894) lt!261725) (bvadd (currentBit!8211 thiss!1894) lt!261722))))))))

(declare-fun b!168435 () Bool)

(declare-fun e!117028 () Bool)

(assert (=> b!168435 (= e!117027 e!117028)))

(declare-fun res!140171 () Bool)

(assert (=> b!168435 (=> (not res!140171) (not e!117028))))

(declare-fun lt!261723 () tuple2!14640)

(declare-fun lt!261726 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!168435 (= res!140171 (= (bvadd lt!261726 ((_ sign_extend 32) nBits!600)) (bitIndex!0 (size!3888 (buf!4340 (_2!7926 lt!261723))) (currentByte!8216 (_2!7926 lt!261723)) (currentBit!8211 (_2!7926 lt!261723)))))))

(assert (=> b!168435 (or (not (= (bvand lt!261726 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand ((_ sign_extend 32) nBits!600) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!261726 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!261726 ((_ sign_extend 32) nBits!600)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!168435 (= lt!261726 (bitIndex!0 (size!3888 (buf!4340 thiss!1894)) (currentByte!8216 thiss!1894) (currentBit!8211 thiss!1894)))))

(declare-fun lt!261724 () (_ BitVec 32))

(declare-fun lt!261727 () (_ BitVec 32))

(declare-fun Unit!11732 () Unit!11714)

(declare-fun Unit!11733 () Unit!11714)

(declare-fun Unit!11734 () Unit!11714)

(assert (=> b!168435 (= lt!261723 (ite (bvslt (bvadd (currentBit!8211 thiss!1894) lt!261727) #b00000000000000000000000000000000) (tuple2!14641 Unit!11732 (BitStream!6933 (buf!4340 thiss!1894) (bvsub (bvadd (currentByte!8216 thiss!1894) lt!261724) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!261727 (currentBit!8211 thiss!1894)))) (ite (bvsge (bvadd (currentBit!8211 thiss!1894) lt!261727) #b00000000000000000000000000001000) (tuple2!14641 Unit!11733 (BitStream!6933 (buf!4340 thiss!1894) (bvadd (currentByte!8216 thiss!1894) lt!261724 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!8211 thiss!1894) lt!261727) #b00000000000000000000000000001000))) (tuple2!14641 Unit!11734 (BitStream!6933 (buf!4340 thiss!1894) (bvadd (currentByte!8216 thiss!1894) lt!261724) (bvadd (currentBit!8211 thiss!1894) lt!261727))))))))

(assert (=> b!168435 (= lt!261727 ((_ extract 31 0) (bvsrem ((_ sign_extend 32) nBits!600) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!168435 (= lt!261724 ((_ extract 31 0) (bvsdiv ((_ sign_extend 32) nBits!600) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!168436 () Bool)

(assert (=> b!168436 (= e!117028 (and (= (size!3888 (buf!4340 thiss!1894)) (size!3888 (buf!4340 (_2!7926 lt!261723)))) (= (buf!4340 thiss!1894) (buf!4340 (_2!7926 lt!261723)))))))

(assert (= (and d!59307 res!140172) b!168435))

(assert (= (and b!168435 res!140171) b!168436))

(declare-fun m!268043 () Bool)

(assert (=> d!59307 m!268043))

(declare-fun m!268045 () Bool)

(assert (=> b!168435 m!268045))

(declare-fun m!268047 () Bool)

(assert (=> b!168435 m!268047))

(assert (=> b!168417 d!59307))

(declare-fun d!59325 () Bool)

(assert (=> d!59325 (= (invariant!0 (currentBit!8211 (_3!605 lt!261678)) (currentByte!8216 (_3!605 lt!261678)) (size!3888 (buf!4340 (_3!605 lt!261678)))) (and (bvsge (currentBit!8211 (_3!605 lt!261678)) #b00000000000000000000000000000000) (bvslt (currentBit!8211 (_3!605 lt!261678)) #b00000000000000000000000000001000) (bvsge (currentByte!8216 (_3!605 lt!261678)) #b00000000000000000000000000000000) (or (bvslt (currentByte!8216 (_3!605 lt!261678)) (size!3888 (buf!4340 (_3!605 lt!261678)))) (and (= (currentBit!8211 (_3!605 lt!261678)) #b00000000000000000000000000000000) (= (currentByte!8216 (_3!605 lt!261678)) (size!3888 (buf!4340 (_3!605 lt!261678))))))))))

(assert (=> b!168420 d!59325))

(declare-fun d!59331 () Bool)

(assert (=> d!59331 (= (array_inv!3629 (buf!4340 thiss!1894)) (bvsge (size!3888 (buf!4340 thiss!1894)) #b00000000000000000000000000000000))))

(assert (=> b!168415 d!59331))

(declare-fun d!59333 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!59333 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3888 (buf!4340 thiss!1894))) ((_ sign_extend 32) (currentByte!8216 thiss!1894)) ((_ sign_extend 32) (currentBit!8211 thiss!1894)) ((_ sign_extend 32) nBits!600)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3888 (buf!4340 thiss!1894))) ((_ sign_extend 32) (currentByte!8216 thiss!1894)) ((_ sign_extend 32) (currentBit!8211 thiss!1894))) ((_ sign_extend 32) nBits!600)))))

(declare-fun bs!14699 () Bool)

(assert (= bs!14699 d!59333))

(declare-fun m!268057 () Bool)

(assert (=> bs!14699 m!268057))

(assert (=> b!168419 d!59333))

(push 1)

(assert (not d!59333))

(assert (not d!59301))

(assert (not b!168435))

(assert (not d!59307))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!59353 () Bool)

(assert (=> d!59353 (= (remainingBits!0 ((_ sign_extend 32) (size!3888 (buf!4340 thiss!1894))) ((_ sign_extend 32) (currentByte!8216 thiss!1894)) ((_ sign_extend 32) (currentBit!8211 thiss!1894))) (bvsub (bvmul ((_ sign_extend 32) (size!3888 (buf!4340 thiss!1894))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!8216 thiss!1894)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8211 thiss!1894)))))))

(assert (=> d!59333 d!59353))

(declare-fun d!59357 () Bool)

(assert (=> d!59357 (= (invariant!0 (currentBit!8211 thiss!1894) (currentByte!8216 thiss!1894) (size!3888 (buf!4340 thiss!1894))) (and (bvsge (currentBit!8211 thiss!1894) #b00000000000000000000000000000000) (bvslt (currentBit!8211 thiss!1894) #b00000000000000000000000000001000) (bvsge (currentByte!8216 thiss!1894) #b00000000000000000000000000000000) (or (bvslt (currentByte!8216 thiss!1894) (size!3888 (buf!4340 thiss!1894))) (and (= (currentBit!8211 thiss!1894) #b00000000000000000000000000000000) (= (currentByte!8216 thiss!1894) (size!3888 (buf!4340 thiss!1894)))))))))

(assert (=> d!59301 d!59357))

(declare-fun d!59359 () Bool)

(declare-fun e!117047 () Bool)

(assert (=> d!59359 e!117047))

(declare-fun res!140202 () Bool)

(assert (=> d!59359 (=> (not res!140202) (not e!117047))))

(declare-fun lt!261803 () (_ BitVec 64))

(declare-fun lt!261800 () (_ BitVec 64))

(declare-fun lt!261801 () (_ BitVec 64))

(assert (=> d!59359 (= res!140202 (= lt!261803 (bvsub lt!261801 lt!261800)))))

(assert (=> d!59359 (or (= (bvand lt!261801 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!261800 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!261801 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!261801 lt!261800) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!59359 (= lt!261800 (remainingBits!0 ((_ sign_extend 32) (size!3888 (buf!4340 (_2!7926 lt!261723)))) ((_ sign_extend 32) (currentByte!8216 (_2!7926 lt!261723))) ((_ sign_extend 32) (currentBit!8211 (_2!7926 lt!261723)))))))

(declare-fun lt!261802 () (_ BitVec 64))

(declare-fun lt!261804 () (_ BitVec 64))

(assert (=> d!59359 (= lt!261801 (bvmul lt!261802 lt!261804))))

(assert (=> d!59359 (or (= lt!261802 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!261804 (bvsdiv (bvmul lt!261802 lt!261804) lt!261802)))))

(assert (=> d!59359 (= lt!261804 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!59359 (= lt!261802 ((_ sign_extend 32) (size!3888 (buf!4340 (_2!7926 lt!261723)))))))

(assert (=> d!59359 (= lt!261803 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8216 (_2!7926 lt!261723))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8211 (_2!7926 lt!261723)))))))

(assert (=> d!59359 (invariant!0 (currentBit!8211 (_2!7926 lt!261723)) (currentByte!8216 (_2!7926 lt!261723)) (size!3888 (buf!4340 (_2!7926 lt!261723))))))

(assert (=> d!59359 (= (bitIndex!0 (size!3888 (buf!4340 (_2!7926 lt!261723))) (currentByte!8216 (_2!7926 lt!261723)) (currentBit!8211 (_2!7926 lt!261723))) lt!261803)))

(declare-fun b!168467 () Bool)

(declare-fun res!140201 () Bool)

(assert (=> b!168467 (=> (not res!140201) (not e!117047))))

(assert (=> b!168467 (= res!140201 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!261803))))

(declare-fun b!168468 () Bool)

(declare-fun lt!261805 () (_ BitVec 64))

(assert (=> b!168468 (= e!117047 (bvsle lt!261803 (bvmul lt!261805 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!168468 (or (= lt!261805 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!261805 #b0000000000000000000000000000000000000000000000000000000000001000) lt!261805)))))

(assert (=> b!168468 (= lt!261805 ((_ sign_extend 32) (size!3888 (buf!4340 (_2!7926 lt!261723)))))))

(assert (= (and d!59359 res!140202) b!168467))

(assert (= (and b!168467 res!140201) b!168468))

(declare-fun m!268067 () Bool)

(assert (=> d!59359 m!268067))

(declare-fun m!268069 () Bool)

(assert (=> d!59359 m!268069))

(assert (=> b!168435 d!59359))

(declare-fun d!59361 () Bool)

(declare-fun e!117048 () Bool)

(assert (=> d!59361 e!117048))

(declare-fun res!140204 () Bool)

(assert (=> d!59361 (=> (not res!140204) (not e!117048))))

(declare-fun lt!261806 () (_ BitVec 64))

(declare-fun lt!261809 () (_ BitVec 64))

(declare-fun lt!261807 () (_ BitVec 64))

(assert (=> d!59361 (= res!140204 (= lt!261809 (bvsub lt!261807 lt!261806)))))

(assert (=> d!59361 (or (= (bvand lt!261807 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!261806 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!261807 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!261807 lt!261806) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!59361 (= lt!261806 (remainingBits!0 ((_ sign_extend 32) (size!3888 (buf!4340 thiss!1894))) ((_ sign_extend 32) (currentByte!8216 thiss!1894)) ((_ sign_extend 32) (currentBit!8211 thiss!1894))))))

(declare-fun lt!261808 () (_ BitVec 64))

(declare-fun lt!261810 () (_ BitVec 64))

(assert (=> d!59361 (= lt!261807 (bvmul lt!261808 lt!261810))))

(assert (=> d!59361 (or (= lt!261808 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!261810 (bvsdiv (bvmul lt!261808 lt!261810) lt!261808)))))

(assert (=> d!59361 (= lt!261810 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!59361 (= lt!261808 ((_ sign_extend 32) (size!3888 (buf!4340 thiss!1894))))))

(assert (=> d!59361 (= lt!261809 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8216 thiss!1894)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8211 thiss!1894))))))

(assert (=> d!59361 (invariant!0 (currentBit!8211 thiss!1894) (currentByte!8216 thiss!1894) (size!3888 (buf!4340 thiss!1894)))))

(assert (=> d!59361 (= (bitIndex!0 (size!3888 (buf!4340 thiss!1894)) (currentByte!8216 thiss!1894) (currentBit!8211 thiss!1894)) lt!261809)))

(declare-fun b!168469 () Bool)

(declare-fun res!140203 () Bool)

(assert (=> b!168469 (=> (not res!140203) (not e!117048))))

(assert (=> b!168469 (= res!140203 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!261809))))

(declare-fun b!168470 () Bool)

(declare-fun lt!261811 () (_ BitVec 64))

(assert (=> b!168470 (= e!117048 (bvsle lt!261809 (bvmul lt!261811 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!168470 (or (= lt!261811 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!261811 #b0000000000000000000000000000000000000000000000000000000000001000) lt!261811)))))

(assert (=> b!168470 (= lt!261811 ((_ sign_extend 32) (size!3888 (buf!4340 thiss!1894))))))

(assert (= (and d!59361 res!140204) b!168469))

(assert (= (and b!168469 res!140203) b!168470))

(assert (=> d!59361 m!268057))

(assert (=> d!59361 m!268031))

(assert (=> b!168435 d!59361))

(declare-fun d!59363 () Bool)

(declare-fun res!140207 () Bool)

(declare-fun e!117051 () Bool)

(assert (=> d!59363 (=> (not res!140207) (not e!117051))))

(assert (=> d!59363 (= res!140207 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!3888 (buf!4340 thiss!1894)))) ((_ sign_extend 32) nBits!600)) (bvsle ((_ sign_extend 32) nBits!600) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3888 (buf!4340 thiss!1894)))))))))

(assert (=> d!59363 (= (moveBitIndexPrecond!0 thiss!1894 ((_ sign_extend 32) nBits!600)) e!117051)))

(declare-fun b!168474 () Bool)

(declare-fun lt!261814 () (_ BitVec 64))

(assert (=> b!168474 (= e!117051 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!261814) (bvsle lt!261814 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3888 (buf!4340 thiss!1894)))))))))

(assert (=> b!168474 (= lt!261814 (bvadd (bitIndex!0 (size!3888 (buf!4340 thiss!1894)) (currentByte!8216 thiss!1894) (currentBit!8211 thiss!1894)) ((_ sign_extend 32) nBits!600)))))

(assert (= (and d!59363 res!140207) b!168474))

(assert (=> b!168474 m!268047))

(assert (=> d!59307 d!59363))

(push 1)

(assert (not d!59359))

(assert (not b!168474))

(assert (not d!59361))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

