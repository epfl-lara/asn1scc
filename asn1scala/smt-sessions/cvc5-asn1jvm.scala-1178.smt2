; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33350 () Bool)

(assert start!33350)

(declare-fun res!134110 () Bool)

(declare-fun e!110541 () Bool)

(assert (=> start!33350 (=> (not res!134110) (not e!110541))))

(declare-datatypes ((array!7886 0))(
  ( (array!7887 (arr!4468 (Array (_ BitVec 32) (_ BitVec 8))) (size!3547 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6262 0))(
  ( (BitStream!6263 (buf!4005 array!7886) (currentByte!7434 (_ BitVec 32)) (currentBit!7429 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6262)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33350 (= res!134110 (validate_offset_byte!0 ((_ sign_extend 32) (size!3547 (buf!4005 thiss!1602))) ((_ sign_extend 32) (currentByte!7434 thiss!1602)) ((_ sign_extend 32) (currentBit!7429 thiss!1602))))))

(assert (=> start!33350 e!110541))

(declare-fun e!110543 () Bool)

(declare-fun inv!12 (BitStream!6262) Bool)

(assert (=> start!33350 (and (inv!12 thiss!1602) e!110543)))

(assert (=> start!33350 true))

(declare-fun b!160885 () Bool)

(declare-datatypes ((Unit!10958 0))(
  ( (Unit!10959) )
))
(declare-datatypes ((tuple3!822 0))(
  ( (tuple3!823 (_1!7762 Unit!10958) (_2!7762 (_ BitVec 8)) (_3!528 BitStream!6262)) )
))
(declare-fun lt!253208 () tuple3!822)

(assert (=> b!160885 (= e!110541 (not (or (= (bvand (currentByte!7434 (_3!528 lt!253208)) #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand (currentByte!7434 (_3!528 lt!253208)) #b10000000000000000000000000000000) (bvand (bvsub (currentByte!7434 (_3!528 lt!253208)) #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))))

(declare-fun lt!253213 () (_ BitVec 8))

(declare-fun lt!253214 () (_ BitVec 32))

(declare-fun lt!253209 () (_ BitVec 8))

(declare-fun lt!253210 () (_ BitVec 32))

(declare-fun lt!253212 () array!7886)

(declare-fun lt!253211 () (_ BitVec 32))

(declare-fun lt!253215 () (_ BitVec 8))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun Unit!10960 () Unit!10958)

(declare-fun Unit!10961 () Unit!10958)

(assert (=> b!160885 (= lt!253208 (ite (bvsgt lt!253210 #b00000000000000000000000000000000) (let ((bdg!9533 ((_ extract 7 0) (bvnot lt!253211)))) (let ((bdg!9534 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4468 (buf!4005 thiss!1602)) (currentByte!7434 thiss!1602) lt!253215) (currentByte!7434 thiss!1602) lt!253213) (bvadd #b00000000000000000000000000000001 (currentByte!7434 thiss!1602)))) ((_ sign_extend 24) bdg!9533))))) (tuple3!823 Unit!10960 bdg!9533 (BitStream!6263 (array!7887 (store (arr!4468 (array!7887 (store (arr!4468 lt!253212) (bvadd #b00000000000000000000000000000001 (currentByte!7434 thiss!1602)) bdg!9534) (size!3547 lt!253212))) (bvadd #b00000000000000000000000000000001 (currentByte!7434 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9534) (bvshl ((_ sign_extend 24) v!222) lt!253214)))) (size!3547 (array!7887 (store (arr!4468 lt!253212) (bvadd #b00000000000000000000000000000001 (currentByte!7434 thiss!1602)) bdg!9534) (size!3547 lt!253212)))) (bvadd #b00000000000000000000000000000001 (currentByte!7434 thiss!1602)) (currentBit!7429 thiss!1602))))) (tuple3!823 Unit!10961 lt!253209 (BitStream!6263 lt!253212 (bvadd #b00000000000000000000000000000001 (currentByte!7434 thiss!1602)) (currentBit!7429 thiss!1602)))))))

(declare-fun e!110544 () Bool)

(assert (=> b!160885 e!110544))

(declare-fun res!134111 () Bool)

(assert (=> b!160885 (=> res!134111 e!110544)))

(assert (=> b!160885 (= res!134111 (bvsge (currentByte!7434 thiss!1602) (size!3547 (buf!4005 thiss!1602))))))

(assert (=> b!160885 (= lt!253212 (array!7887 (store (store (arr!4468 (buf!4005 thiss!1602)) (currentByte!7434 thiss!1602) lt!253215) (currentByte!7434 thiss!1602) lt!253213) (size!3547 (buf!4005 thiss!1602))))))

(assert (=> b!160885 (= lt!253213 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253215) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253210))))))

(assert (=> b!160885 (= lt!253215 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4468 (buf!4005 thiss!1602)) (currentByte!7434 thiss!1602))) lt!253211)))))

(assert (=> b!160885 (= lt!253211 ((_ sign_extend 24) lt!253209))))

(assert (=> b!160885 (= lt!253209 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!253214)))))))

(assert (=> b!160885 (= lt!253214 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253210))))))

(assert (=> b!160885 (= lt!253210 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7429 thiss!1602))))))

(declare-fun b!160886 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!160886 (= e!110544 (byteRangesEq!0 (select (arr!4468 (buf!4005 thiss!1602)) (currentByte!7434 thiss!1602)) lt!253213 #b00000000000000000000000000000000 (currentBit!7429 thiss!1602)))))

(declare-fun b!160887 () Bool)

(declare-fun array_inv!3294 (array!7886) Bool)

(assert (=> b!160887 (= e!110543 (array_inv!3294 (buf!4005 thiss!1602)))))

(assert (= (and start!33350 res!134110) b!160885))

(assert (= (and b!160885 (not res!134111)) b!160886))

(assert (= start!33350 b!160887))

(declare-fun m!254233 () Bool)

(assert (=> start!33350 m!254233))

(declare-fun m!254235 () Bool)

(assert (=> start!33350 m!254235))

(declare-fun m!254237 () Bool)

(assert (=> b!160885 m!254237))

(declare-fun m!254239 () Bool)

(assert (=> b!160885 m!254239))

(declare-fun m!254241 () Bool)

(assert (=> b!160885 m!254241))

(declare-fun m!254243 () Bool)

(assert (=> b!160885 m!254243))

(declare-fun m!254245 () Bool)

(assert (=> b!160885 m!254245))

(declare-fun m!254247 () Bool)

(assert (=> b!160885 m!254247))

(declare-fun m!254249 () Bool)

(assert (=> b!160885 m!254249))

(assert (=> b!160886 m!254247))

(assert (=> b!160886 m!254247))

(declare-fun m!254251 () Bool)

(assert (=> b!160886 m!254251))

(declare-fun m!254253 () Bool)

(assert (=> b!160887 m!254253))

(push 1)

(assert (not b!160886))

(assert (not start!33350))

(assert (not b!160887))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54777 () Bool)

(assert (=> d!54777 (= (byteRangesEq!0 (select (arr!4468 (buf!4005 thiss!1602)) (currentByte!7434 thiss!1602)) lt!253213 #b00000000000000000000000000000000 (currentBit!7429 thiss!1602)) (or (= #b00000000000000000000000000000000 (currentBit!7429 thiss!1602)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4468 (buf!4005 thiss!1602)) (currentByte!7434 thiss!1602))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7429 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!253213) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7429 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13624 () Bool)

(assert (= bs!13624 d!54777))

(declare-fun m!254299 () Bool)

(assert (=> bs!13624 m!254299))

(declare-fun m!254301 () Bool)

(assert (=> bs!13624 m!254301))

(assert (=> b!160886 d!54777))

(declare-fun d!54779 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!54779 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3547 (buf!4005 thiss!1602))) ((_ sign_extend 32) (currentByte!7434 thiss!1602)) ((_ sign_extend 32) (currentBit!7429 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3547 (buf!4005 thiss!1602))) ((_ sign_extend 32) (currentByte!7434 thiss!1602)) ((_ sign_extend 32) (currentBit!7429 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13625 () Bool)

(assert (= bs!13625 d!54779))

(declare-fun m!254303 () Bool)

(assert (=> bs!13625 m!254303))

(assert (=> start!33350 d!54779))

(declare-fun d!54781 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!54781 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7429 thiss!1602) (currentByte!7434 thiss!1602) (size!3547 (buf!4005 thiss!1602))))))

(declare-fun bs!13626 () Bool)

(assert (= bs!13626 d!54781))

(declare-fun m!254305 () Bool)

(assert (=> bs!13626 m!254305))

(assert (=> start!33350 d!54781))

(declare-fun d!54783 () Bool)

(assert (=> d!54783 (= (array_inv!3294 (buf!4005 thiss!1602)) (bvsge (size!3547 (buf!4005 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!160887 d!54783))

(push 1)

(assert (not d!54781))

(assert (not d!54779))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54803 () Bool)

(assert (=> d!54803 (= (invariant!0 (currentBit!7429 thiss!1602) (currentByte!7434 thiss!1602) (size!3547 (buf!4005 thiss!1602))) (and (bvsge (currentBit!7429 thiss!1602) #b00000000000000000000000000000000) (bvslt (currentBit!7429 thiss!1602) #b00000000000000000000000000001000) (bvsge (currentByte!7434 thiss!1602) #b00000000000000000000000000000000) (or (bvslt (currentByte!7434 thiss!1602) (size!3547 (buf!4005 thiss!1602))) (and (= (currentBit!7429 thiss!1602) #b00000000000000000000000000000000) (= (currentByte!7434 thiss!1602) (size!3547 (buf!4005 thiss!1602)))))))))

(assert (=> d!54781 d!54803))

(declare-fun d!54807 () Bool)

(assert (=> d!54807 (= (remainingBits!0 ((_ sign_extend 32) (size!3547 (buf!4005 thiss!1602))) ((_ sign_extend 32) (currentByte!7434 thiss!1602)) ((_ sign_extend 32) (currentBit!7429 thiss!1602))) (bvsub (bvmul ((_ sign_extend 32) (size!3547 (buf!4005 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7434 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7429 thiss!1602)))))))

(assert (=> d!54779 d!54807))

(push 1)

(check-sat)

(pop 1)

