; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33092 () Bool)

(assert start!33092)

(declare-fun res!133969 () Bool)

(declare-fun e!110274 () Bool)

(assert (=> start!33092 (=> (not res!133969) (not e!110274))))

(declare-datatypes ((array!7826 0))(
  ( (array!7827 (arr!4447 (Array (_ BitVec 32) (_ BitVec 8))) (size!3526 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6220 0))(
  ( (BitStream!6221 (buf!3984 array!7826) (currentByte!7359 (_ BitVec 32)) (currentBit!7354 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6220)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33092 (= res!133969 (validate_offset_byte!0 ((_ sign_extend 32) (size!3526 (buf!3984 thiss!1602))) ((_ sign_extend 32) (currentByte!7359 thiss!1602)) ((_ sign_extend 32) (currentBit!7354 thiss!1602))))))

(assert (=> start!33092 e!110274))

(declare-fun e!110275 () Bool)

(declare-fun inv!12 (BitStream!6220) Bool)

(assert (=> start!33092 (and (inv!12 thiss!1602) e!110275)))

(assert (=> start!33092 true))

(declare-fun b!160682 () Bool)

(declare-fun lt!253059 () (_ BitVec 8))

(declare-fun lt!253057 () (_ BitVec 8))

(declare-fun e!110276 () Bool)

(declare-fun lt!253058 () (_ BitVec 32))

(assert (=> b!160682 (= e!110276 (inv!12 (BitStream!6221 (array!7827 (store (store (store (arr!4447 (buf!3984 thiss!1602)) (currentByte!7359 thiss!1602) lt!253059) (currentByte!7359 thiss!1602) lt!253057) (bvadd #b00000000000000000000000000000001 (currentByte!7359 thiss!1602)) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4447 (buf!3984 thiss!1602)) (currentByte!7359 thiss!1602) lt!253059) (currentByte!7359 thiss!1602) lt!253057) (bvadd #b00000000000000000000000000000001 (currentByte!7359 thiss!1602)))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot lt!253058)))))) (size!3526 (buf!3984 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7359 thiss!1602)) (currentBit!7354 thiss!1602))))))

(declare-fun b!160681 () Bool)

(declare-fun e!110273 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!160681 (= e!110273 (byteRangesEq!0 (select (arr!4447 (buf!3984 thiss!1602)) (currentByte!7359 thiss!1602)) lt!253057 #b00000000000000000000000000000000 (currentBit!7354 thiss!1602)))))

(declare-fun b!160683 () Bool)

(declare-fun array_inv!3273 (array!7826) Bool)

(assert (=> b!160683 (= e!110275 (array_inv!3273 (buf!3984 thiss!1602)))))

(declare-fun b!160680 () Bool)

(assert (=> b!160680 (= e!110274 (not e!110276))))

(declare-fun res!133968 () Bool)

(assert (=> b!160680 (=> res!133968 e!110276)))

(declare-fun lt!253056 () (_ BitVec 32))

(assert (=> b!160680 (= res!133968 (bvsle lt!253056 #b00000000000000000000000000000000))))

(assert (=> b!160680 e!110273))

(declare-fun res!133970 () Bool)

(assert (=> b!160680 (=> res!133970 e!110273)))

(assert (=> b!160680 (= res!133970 (bvsge (currentByte!7359 thiss!1602) (size!3526 (buf!3984 thiss!1602))))))

(declare-fun v!222 () (_ BitVec 8))

(assert (=> b!160680 (= lt!253057 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253059) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253056))))))

(assert (=> b!160680 (= lt!253059 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4447 (buf!3984 thiss!1602)) (currentByte!7359 thiss!1602))) lt!253058)))))

(assert (=> b!160680 (= lt!253058 ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253056)))))))))))

(assert (=> b!160680 (= lt!253056 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7354 thiss!1602))))))

(assert (= (and start!33092 res!133969) b!160680))

(assert (= (and b!160680 (not res!133970)) b!160681))

(assert (= (and b!160680 (not res!133968)) b!160682))

(assert (= start!33092 b!160683))

(declare-fun m!253759 () Bool)

(assert (=> b!160682 m!253759))

(declare-fun m!253761 () Bool)

(assert (=> b!160682 m!253761))

(declare-fun m!253763 () Bool)

(assert (=> b!160682 m!253763))

(declare-fun m!253765 () Bool)

(assert (=> b!160682 m!253765))

(declare-fun m!253767 () Bool)

(assert (=> b!160682 m!253767))

(declare-fun m!253769 () Bool)

(assert (=> b!160681 m!253769))

(assert (=> b!160681 m!253769))

(declare-fun m!253771 () Bool)

(assert (=> b!160681 m!253771))

(declare-fun m!253773 () Bool)

(assert (=> start!33092 m!253773))

(declare-fun m!253775 () Bool)

(assert (=> start!33092 m!253775))

(declare-fun m!253777 () Bool)

(assert (=> b!160683 m!253777))

(assert (=> b!160680 m!253769))

(declare-fun m!253779 () Bool)

(assert (=> b!160680 m!253779))

(push 1)

(assert (not b!160681))

(assert (not b!160682))

(assert (not start!33092))

(assert (not b!160683))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54531 () Bool)

(assert (=> d!54531 (= (byteRangesEq!0 (select (arr!4447 (buf!3984 thiss!1602)) (currentByte!7359 thiss!1602)) lt!253057 #b00000000000000000000000000000000 (currentBit!7354 thiss!1602)) (or (= #b00000000000000000000000000000000 (currentBit!7354 thiss!1602)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4447 (buf!3984 thiss!1602)) (currentByte!7359 thiss!1602))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7354 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!253057) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7354 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13547 () Bool)

(assert (= bs!13547 d!54531))

(declare-fun m!253835 () Bool)

(assert (=> bs!13547 m!253835))

(declare-fun m!253837 () Bool)

(assert (=> bs!13547 m!253837))

(assert (=> b!160681 d!54531))

(declare-fun d!54537 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!54537 (= (inv!12 (BitStream!6221 (array!7827 (store (store (store (arr!4447 (buf!3984 thiss!1602)) (currentByte!7359 thiss!1602) lt!253059) (currentByte!7359 thiss!1602) lt!253057) (bvadd #b00000000000000000000000000000001 (currentByte!7359 thiss!1602)) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4447 (buf!3984 thiss!1602)) (currentByte!7359 thiss!1602) lt!253059) (currentByte!7359 thiss!1602) lt!253057) (bvadd #b00000000000000000000000000000001 (currentByte!7359 thiss!1602)))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot lt!253058)))))) (size!3526 (buf!3984 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7359 thiss!1602)) (currentBit!7354 thiss!1602))) (invariant!0 (currentBit!7354 (BitStream!6221 (array!7827 (store (store (store (arr!4447 (buf!3984 thiss!1602)) (currentByte!7359 thiss!1602) lt!253059) (currentByte!7359 thiss!1602) lt!253057) (bvadd #b00000000000000000000000000000001 (currentByte!7359 thiss!1602)) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4447 (buf!3984 thiss!1602)) (currentByte!7359 thiss!1602) lt!253059) (currentByte!7359 thiss!1602) lt!253057) (bvadd #b00000000000000000000000000000001 (currentByte!7359 thiss!1602)))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot lt!253058)))))) (size!3526 (buf!3984 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7359 thiss!1602)) (currentBit!7354 thiss!1602))) (currentByte!7359 (BitStream!6221 (array!7827 (store (store (store (arr!4447 (buf!3984 thiss!1602)) (currentByte!7359 thiss!1602) lt!253059) (currentByte!7359 thiss!1602) lt!253057) (bvadd #b00000000000000000000000000000001 (currentByte!7359 thiss!1602)) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4447 (buf!3984 thiss!1602)) (currentByte!7359 thiss!1602) lt!253059) (currentByte!7359 thiss!1602) lt!253057) (bvadd #b00000000000000000000000000000001 (currentByte!7359 thiss!1602)))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot lt!253058)))))) (size!3526 (buf!3984 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7359 thiss!1602)) (currentBit!7354 thiss!1602))) (size!3526 (buf!3984 (BitStream!6221 (array!7827 (store (store (store (arr!4447 (buf!3984 thiss!1602)) (currentByte!7359 thiss!1602) lt!253059) (currentByte!7359 thiss!1602) lt!253057) (bvadd #b00000000000000000000000000000001 (currentByte!7359 thiss!1602)) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4447 (buf!3984 thiss!1602)) (currentByte!7359 thiss!1602) lt!253059) (currentByte!7359 thiss!1602) lt!253057) (bvadd #b00000000000000000000000000000001 (currentByte!7359 thiss!1602)))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot lt!253058)))))) (size!3526 (buf!3984 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7359 thiss!1602)) (currentBit!7354 thiss!1602))))))))

(declare-fun bs!13548 () Bool)

(assert (= bs!13548 d!54537))

(declare-fun m!253839 () Bool)

(assert (=> bs!13548 m!253839))

(assert (=> b!160682 d!54537))

(declare-fun d!54539 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!54539 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3526 (buf!3984 thiss!1602))) ((_ sign_extend 32) (currentByte!7359 thiss!1602)) ((_ sign_extend 32) (currentBit!7354 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3526 (buf!3984 thiss!1602))) ((_ sign_extend 32) (currentByte!7359 thiss!1602)) ((_ sign_extend 32) (currentBit!7354 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13549 () Bool)

(assert (= bs!13549 d!54539))

(declare-fun m!253841 () Bool)

(assert (=> bs!13549 m!253841))

(assert (=> start!33092 d!54539))

(declare-fun d!54541 () Bool)

(assert (=> d!54541 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7354 thiss!1602) (currentByte!7359 thiss!1602) (size!3526 (buf!3984 thiss!1602))))))

(declare-fun bs!13550 () Bool)

(assert (= bs!13550 d!54541))

(declare-fun m!253843 () Bool)

(assert (=> bs!13550 m!253843))

(assert (=> start!33092 d!54541))

(declare-fun d!54543 () Bool)

(assert (=> d!54543 (= (array_inv!3273 (buf!3984 thiss!1602)) (bvsge (size!3526 (buf!3984 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!160683 d!54543))

(push 1)

(assert (not d!54539))

(assert (not d!54541))

(assert (not d!54537))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54559 () Bool)

(assert (=> d!54559 (= (remainingBits!0 ((_ sign_extend 32) (size!3526 (buf!3984 thiss!1602))) ((_ sign_extend 32) (currentByte!7359 thiss!1602)) ((_ sign_extend 32) (currentBit!7354 thiss!1602))) (bvsub (bvmul ((_ sign_extend 32) (size!3526 (buf!3984 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7359 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7354 thiss!1602)))))))

(assert (=> d!54539 d!54559))

(declare-fun d!54561 () Bool)

(assert (=> d!54561 (= (invariant!0 (currentBit!7354 thiss!1602) (currentByte!7359 thiss!1602) (size!3526 (buf!3984 thiss!1602))) (and (bvsge (currentBit!7354 thiss!1602) #b00000000000000000000000000000000) (bvslt (currentBit!7354 thiss!1602) #b00000000000000000000000000001000) (bvsge (currentByte!7359 thiss!1602) #b00000000000000000000000000000000) (or (bvslt (currentByte!7359 thiss!1602) (size!3526 (buf!3984 thiss!1602))) (and (= (currentBit!7354 thiss!1602) #b00000000000000000000000000000000) (= (currentByte!7359 thiss!1602) (size!3526 (buf!3984 thiss!1602)))))))))

(assert (=> d!54541 d!54561))

(declare-fun d!54563 () Bool)

(assert (=> d!54563 (= (invariant!0 (currentBit!7354 (BitStream!6221 (array!7827 (store (store (store (arr!4447 (buf!3984 thiss!1602)) (currentByte!7359 thiss!1602) lt!253059) (currentByte!7359 thiss!1602) lt!253057) (bvadd #b00000000000000000000000000000001 (currentByte!7359 thiss!1602)) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4447 (buf!3984 thiss!1602)) (currentByte!7359 thiss!1602) lt!253059) (currentByte!7359 thiss!1602) lt!253057) (bvadd #b00000000000000000000000000000001 (currentByte!7359 thiss!1602)))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot lt!253058)))))) (size!3526 (buf!3984 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7359 thiss!1602)) (currentBit!7354 thiss!1602))) (currentByte!7359 (BitStream!6221 (array!7827 (store (store (store (arr!4447 (buf!3984 thiss!1602)) (currentByte!7359 thiss!1602) lt!253059) (currentByte!7359 thiss!1602) lt!253057) (bvadd #b00000000000000000000000000000001 (currentByte!7359 thiss!1602)) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4447 (buf!3984 thiss!1602)) (currentByte!7359 thiss!1602) lt!253059) (currentByte!7359 thiss!1602) lt!253057) (bvadd #b00000000000000000000000000000001 (currentByte!7359 thiss!1602)))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot lt!253058)))))) (size!3526 (buf!3984 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7359 thiss!1602)) (currentBit!7354 thiss!1602))) (size!3526 (buf!3984 (BitStream!6221 (array!7827 (store (store (store (arr!4447 (buf!3984 thiss!1602)) (currentByte!7359 thiss!1602) lt!253059) (currentByte!7359 thiss!1602) lt!253057) (bvadd #b00000000000000000000000000000001 (currentByte!7359 thiss!1602)) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4447 (buf!3984 thiss!1602)) (currentByte!7359 thiss!1602) lt!253059) (currentByte!7359 thiss!1602) lt!253057) (bvadd #b00000000000000000000000000000001 (currentByte!7359 thiss!1602)))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot lt!253058)))))) (size!3526 (buf!3984 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7359 thiss!1602)) (currentBit!7354 thiss!1602))))) (and (bvsge (currentBit!7354 (BitStream!6221 (array!7827 (store (store (store (arr!4447 (buf!3984 thiss!1602)) (currentByte!7359 thiss!1602) lt!253059) (currentByte!7359 thiss!1602) lt!253057) (bvadd #b00000000000000000000000000000001 (currentByte!7359 thiss!1602)) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4447 (buf!3984 thiss!1602)) (currentByte!7359 thiss!1602) lt!253059) (currentByte!7359 thiss!1602) lt!253057) (bvadd #b00000000000000000000000000000001 (currentByte!7359 thiss!1602)))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot lt!253058)))))) (size!3526 (buf!3984 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7359 thiss!1602)) (currentBit!7354 thiss!1602))) #b00000000000000000000000000000000) (bvslt (currentBit!7354 (BitStream!6221 (array!7827 (store (store (store (arr!4447 (buf!3984 thiss!1602)) (currentByte!7359 thiss!1602) lt!253059) (currentByte!7359 thiss!1602) lt!253057) (bvadd #b00000000000000000000000000000001 (currentByte!7359 thiss!1602)) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4447 (buf!3984 thiss!1602)) (currentByte!7359 thiss!1602) lt!253059) (currentByte!7359 thiss!1602) lt!253057) (bvadd #b00000000000000000000000000000001 (currentByte!7359 thiss!1602)))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot lt!253058)))))) (size!3526 (buf!3984 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7359 thiss!1602)) (currentBit!7354 thiss!1602))) #b00000000000000000000000000001000) (bvsge (currentByte!7359 (BitStream!6221 (array!7827 (store (store (store (arr!4447 (buf!3984 thiss!1602)) (currentByte!7359 thiss!1602) lt!253059) (currentByte!7359 thiss!1602) lt!253057) (bvadd #b00000000000000000000000000000001 (currentByte!7359 thiss!1602)) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4447 (buf!3984 thiss!1602)) (currentByte!7359 thiss!1602) lt!253059) (currentByte!7359 thiss!1602) lt!253057) (bvadd #b00000000000000000000000000000001 (currentByte!7359 thiss!1602)))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot lt!253058)))))) (size!3526 (buf!3984 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7359 thiss!1602)) (currentBit!7354 thiss!1602))) #b00000000000000000000000000000000) (or (bvslt (currentByte!7359 (BitStream!6221 (array!7827 (store (store (store (arr!4447 (buf!3984 thiss!1602)) (currentByte!7359 thiss!1602) lt!253059) (currentByte!7359 thiss!1602) lt!253057) (bvadd #b00000000000000000000000000000001 (currentByte!7359 thiss!1602)) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4447 (buf!3984 thiss!1602)) (currentByte!7359 thiss!1602) lt!253059) (currentByte!7359 thiss!1602) lt!253057) (bvadd #b00000000000000000000000000000001 (currentByte!7359 thiss!1602)))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot lt!253058)))))) (size!3526 (buf!3984 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7359 thiss!1602)) (currentBit!7354 thiss!1602))) (size!3526 (buf!3984 (BitStream!6221 (array!7827 (store (store (store (arr!4447 (buf!3984 thiss!1602)) (currentByte!7359 thiss!1602) lt!253059) (currentByte!7359 thiss!1602) lt!253057) (bvadd #b00000000000000000000000000000001 (currentByte!7359 thiss!1602)) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4447 (buf!3984 thiss!1602)) (currentByte!7359 thiss!1602) lt!253059) (currentByte!7359 thiss!1602) lt!253057) (bvadd #b00000000000000000000000000000001 (currentByte!7359 thiss!1602)))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot lt!253058)))))) (size!3526 (buf!3984 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7359 thiss!1602)) (currentBit!7354 thiss!1602))))) (and (= (currentBit!7354 (BitStream!6221 (array!7827 (store (store (store (arr!4447 (buf!3984 thiss!1602)) (currentByte!7359 thiss!1602) lt!253059) (currentByte!7359 thiss!1602) lt!253057) (bvadd #b00000000000000000000000000000001 (currentByte!7359 thiss!1602)) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4447 (buf!3984 thiss!1602)) (currentByte!7359 thiss!1602) lt!253059) (currentByte!7359 thiss!1602) lt!253057) (bvadd #b00000000000000000000000000000001 (currentByte!7359 thiss!1602)))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot lt!253058)))))) (size!3526 (buf!3984 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7359 thiss!1602)) (currentBit!7354 thiss!1602))) #b00000000000000000000000000000000) (= (currentByte!7359 (BitStream!6221 (array!7827 (store (store (store (arr!4447 (buf!3984 thiss!1602)) (currentByte!7359 thiss!1602) lt!253059) (currentByte!7359 thiss!1602) lt!253057) (bvadd #b00000000000000000000000000000001 (currentByte!7359 thiss!1602)) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4447 (buf!3984 thiss!1602)) (currentByte!7359 thiss!1602) lt!253059) (currentByte!7359 thiss!1602) lt!253057) (bvadd #b00000000000000000000000000000001 (currentByte!7359 thiss!1602)))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot lt!253058)))))) (size!3526 (buf!3984 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7359 thiss!1602)) (currentBit!7354 thiss!1602))) (size!3526 (buf!3984 (BitStream!6221 (array!7827 (store (store (store (arr!4447 (buf!3984 thiss!1602)) (currentByte!7359 thiss!1602) lt!253059) (currentByte!7359 thiss!1602) lt!253057) (bvadd #b00000000000000000000000000000001 (currentByte!7359 thiss!1602)) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4447 (buf!3984 thiss!1602)) (currentByte!7359 thiss!1602) lt!253059) (currentByte!7359 thiss!1602) lt!253057) (bvadd #b00000000000000000000000000000001 (currentByte!7359 thiss!1602)))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot lt!253058)))))) (size!3526 (buf!3984 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7359 thiss!1602)) (currentBit!7354 thiss!1602)))))))))))

(assert (=> d!54537 d!54563))

(push 1)

(check-sat)

