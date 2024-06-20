; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33222 () Bool)

(assert start!33222)

(declare-fun res!134050 () Bool)

(declare-fun e!110424 () Bool)

(assert (=> start!33222 (=> (not res!134050) (not e!110424))))

(declare-datatypes ((array!7857 0))(
  ( (array!7858 (arr!4458 (Array (_ BitVec 32) (_ BitVec 8))) (size!3537 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6242 0))(
  ( (BitStream!6243 (buf!3995 array!7857) (currentByte!7397 (_ BitVec 32)) (currentBit!7392 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6242)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33222 (= res!134050 (validate_offset_byte!0 ((_ sign_extend 32) (size!3537 (buf!3995 thiss!1602))) ((_ sign_extend 32) (currentByte!7397 thiss!1602)) ((_ sign_extend 32) (currentBit!7392 thiss!1602))))))

(assert (=> start!33222 e!110424))

(declare-fun e!110421 () Bool)

(declare-fun inv!12 (BitStream!6242) Bool)

(assert (=> start!33222 (and (inv!12 thiss!1602) e!110421)))

(assert (=> start!33222 true))

(declare-fun e!110420 () Bool)

(declare-fun v!222 () (_ BitVec 8))

(declare-fun b!160796 () Bool)

(declare-fun lt!253154 () (_ BitVec 8))

(declare-fun lt!253150 () (_ BitVec 32))

(declare-fun lt!253151 () (_ BitVec 8))

(declare-fun lt!253152 () (_ BitVec 8))

(assert (=> b!160796 (= e!110420 (inv!12 (BitStream!6243 (array!7858 (store (store (store (store (arr!4458 (buf!3995 thiss!1602)) (currentByte!7397 thiss!1602) lt!253154) (currentByte!7397 thiss!1602) lt!253152) (bvadd #b00000000000000000000000000000001 (currentByte!7397 thiss!1602)) lt!253151) (bvadd #b00000000000000000000000000000001 (currentByte!7397 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253151) (bvshl ((_ sign_extend 24) v!222) lt!253150)))) (size!3537 (buf!3995 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7397 thiss!1602)) (currentBit!7392 thiss!1602))))))

(declare-fun lt!253155 () (_ BitVec 32))

(assert (=> b!160796 (= lt!253151 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4458 (buf!3995 thiss!1602)) (currentByte!7397 thiss!1602) lt!253154) (currentByte!7397 thiss!1602) lt!253152) (bvadd #b00000000000000000000000000000001 (currentByte!7397 thiss!1602)))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot lt!253155))))))))

(declare-fun b!160797 () Bool)

(declare-fun array_inv!3284 (array!7857) Bool)

(assert (=> b!160797 (= e!110421 (array_inv!3284 (buf!3995 thiss!1602)))))

(declare-fun b!160795 () Bool)

(declare-fun e!110422 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!160795 (= e!110422 (byteRangesEq!0 (select (arr!4458 (buf!3995 thiss!1602)) (currentByte!7397 thiss!1602)) lt!253152 #b00000000000000000000000000000000 (currentBit!7392 thiss!1602)))))

(declare-fun b!160794 () Bool)

(assert (=> b!160794 (= e!110424 (not e!110420))))

(declare-fun res!134051 () Bool)

(assert (=> b!160794 (=> res!134051 e!110420)))

(declare-fun lt!253153 () (_ BitVec 32))

(assert (=> b!160794 (= res!134051 (bvsle lt!253153 #b00000000000000000000000000000000))))

(assert (=> b!160794 e!110422))

(declare-fun res!134049 () Bool)

(assert (=> b!160794 (=> res!134049 e!110422)))

(assert (=> b!160794 (= res!134049 (bvsge (currentByte!7397 thiss!1602) (size!3537 (buf!3995 thiss!1602))))))

(assert (=> b!160794 (= lt!253152 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253154) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253153))))))

(assert (=> b!160794 (= lt!253154 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4458 (buf!3995 thiss!1602)) (currentByte!7397 thiss!1602))) lt!253155)))))

(assert (=> b!160794 (= lt!253155 ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!253150))))))))

(assert (=> b!160794 (= lt!253150 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253153))))))

(assert (=> b!160794 (= lt!253153 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7392 thiss!1602))))))

(assert (= (and start!33222 res!134050) b!160794))

(assert (= (and b!160794 (not res!134049)) b!160795))

(assert (= (and b!160794 (not res!134051)) b!160796))

(assert (= start!33222 b!160797))

(declare-fun m!254023 () Bool)

(assert (=> b!160794 m!254023))

(declare-fun m!254025 () Bool)

(assert (=> b!160794 m!254025))

(declare-fun m!254027 () Bool)

(assert (=> b!160797 m!254027))

(assert (=> b!160795 m!254023))

(assert (=> b!160795 m!254023))

(declare-fun m!254029 () Bool)

(assert (=> b!160795 m!254029))

(declare-fun m!254031 () Bool)

(assert (=> b!160796 m!254031))

(declare-fun m!254033 () Bool)

(assert (=> b!160796 m!254033))

(declare-fun m!254035 () Bool)

(assert (=> b!160796 m!254035))

(declare-fun m!254037 () Bool)

(assert (=> b!160796 m!254037))

(declare-fun m!254039 () Bool)

(assert (=> b!160796 m!254039))

(declare-fun m!254041 () Bool)

(assert (=> b!160796 m!254041))

(declare-fun m!254043 () Bool)

(assert (=> start!33222 m!254043))

(declare-fun m!254045 () Bool)

(assert (=> start!33222 m!254045))

(push 1)

(assert (not b!160797))

(assert (not start!33222))

(assert (not b!160796))

(assert (not b!160795))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54669 () Bool)

(assert (=> d!54669 (= (array_inv!3284 (buf!3995 thiss!1602)) (bvsge (size!3537 (buf!3995 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!160797 d!54669))

(declare-fun d!54671 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!54671 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3537 (buf!3995 thiss!1602))) ((_ sign_extend 32) (currentByte!7397 thiss!1602)) ((_ sign_extend 32) (currentBit!7392 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3537 (buf!3995 thiss!1602))) ((_ sign_extend 32) (currentByte!7397 thiss!1602)) ((_ sign_extend 32) (currentBit!7392 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13590 () Bool)

(assert (= bs!13590 d!54671))

(declare-fun m!254067 () Bool)

(assert (=> bs!13590 m!254067))

(assert (=> start!33222 d!54671))

(declare-fun d!54673 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!54673 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7392 thiss!1602) (currentByte!7397 thiss!1602) (size!3537 (buf!3995 thiss!1602))))))

(declare-fun bs!13591 () Bool)

(assert (= bs!13591 d!54673))

(declare-fun m!254069 () Bool)

(assert (=> bs!13591 m!254069))

(assert (=> start!33222 d!54673))

(declare-fun d!54675 () Bool)

(assert (=> d!54675 (= (inv!12 (BitStream!6243 (array!7858 (store (store (store (store (arr!4458 (buf!3995 thiss!1602)) (currentByte!7397 thiss!1602) lt!253154) (currentByte!7397 thiss!1602) lt!253152) (bvadd #b00000000000000000000000000000001 (currentByte!7397 thiss!1602)) lt!253151) (bvadd #b00000000000000000000000000000001 (currentByte!7397 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253151) (bvshl ((_ sign_extend 24) v!222) lt!253150)))) (size!3537 (buf!3995 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7397 thiss!1602)) (currentBit!7392 thiss!1602))) (invariant!0 (currentBit!7392 (BitStream!6243 (array!7858 (store (store (store (store (arr!4458 (buf!3995 thiss!1602)) (currentByte!7397 thiss!1602) lt!253154) (currentByte!7397 thiss!1602) lt!253152) (bvadd #b00000000000000000000000000000001 (currentByte!7397 thiss!1602)) lt!253151) (bvadd #b00000000000000000000000000000001 (currentByte!7397 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253151) (bvshl ((_ sign_extend 24) v!222) lt!253150)))) (size!3537 (buf!3995 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7397 thiss!1602)) (currentBit!7392 thiss!1602))) (currentByte!7397 (BitStream!6243 (array!7858 (store (store (store (store (arr!4458 (buf!3995 thiss!1602)) (currentByte!7397 thiss!1602) lt!253154) (currentByte!7397 thiss!1602) lt!253152) (bvadd #b00000000000000000000000000000001 (currentByte!7397 thiss!1602)) lt!253151) (bvadd #b00000000000000000000000000000001 (currentByte!7397 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253151) (bvshl ((_ sign_extend 24) v!222) lt!253150)))) (size!3537 (buf!3995 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7397 thiss!1602)) (currentBit!7392 thiss!1602))) (size!3537 (buf!3995 (BitStream!6243 (array!7858 (store (store (store (store (arr!4458 (buf!3995 thiss!1602)) (currentByte!7397 thiss!1602) lt!253154) (currentByte!7397 thiss!1602) lt!253152) (bvadd #b00000000000000000000000000000001 (currentByte!7397 thiss!1602)) lt!253151) (bvadd #b00000000000000000000000000000001 (currentByte!7397 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253151) (bvshl ((_ sign_extend 24) v!222) lt!253150)))) (size!3537 (buf!3995 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7397 thiss!1602)) (currentBit!7392 thiss!1602))))))))

(declare-fun bs!13592 () Bool)

(assert (= bs!13592 d!54675))

(declare-fun m!254071 () Bool)

(assert (=> bs!13592 m!254071))

(assert (=> b!160796 d!54675))

(declare-fun d!54677 () Bool)

(assert (=> d!54677 (= (byteRangesEq!0 (select (arr!4458 (buf!3995 thiss!1602)) (currentByte!7397 thiss!1602)) lt!253152 #b00000000000000000000000000000000 (currentBit!7392 thiss!1602)) (or (= #b00000000000000000000000000000000 (currentBit!7392 thiss!1602)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4458 (buf!3995 thiss!1602)) (currentByte!7397 thiss!1602))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7392 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!253152) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7392 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13593 () Bool)

(assert (= bs!13593 d!54677))

(declare-fun m!254073 () Bool)

(assert (=> bs!13593 m!254073))

(declare-fun m!254075 () Bool)

(assert (=> bs!13593 m!254075))

(assert (=> b!160795 d!54677))

(push 1)

(assert (not d!54675))

(assert (not d!54671))

(assert (not d!54673))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54691 () Bool)

(assert (=> d!54691 (= (invariant!0 (currentBit!7392 (BitStream!6243 (array!7858 (store (store (store (store (arr!4458 (buf!3995 thiss!1602)) (currentByte!7397 thiss!1602) lt!253154) (currentByte!7397 thiss!1602) lt!253152) (bvadd #b00000000000000000000000000000001 (currentByte!7397 thiss!1602)) lt!253151) (bvadd #b00000000000000000000000000000001 (currentByte!7397 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253151) (bvshl ((_ sign_extend 24) v!222) lt!253150)))) (size!3537 (buf!3995 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7397 thiss!1602)) (currentBit!7392 thiss!1602))) (currentByte!7397 (BitStream!6243 (array!7858 (store (store (store (store (arr!4458 (buf!3995 thiss!1602)) (currentByte!7397 thiss!1602) lt!253154) (currentByte!7397 thiss!1602) lt!253152) (bvadd #b00000000000000000000000000000001 (currentByte!7397 thiss!1602)) lt!253151) (bvadd #b00000000000000000000000000000001 (currentByte!7397 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253151) (bvshl ((_ sign_extend 24) v!222) lt!253150)))) (size!3537 (buf!3995 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7397 thiss!1602)) (currentBit!7392 thiss!1602))) (size!3537 (buf!3995 (BitStream!6243 (array!7858 (store (store (store (store (arr!4458 (buf!3995 thiss!1602)) (currentByte!7397 thiss!1602) lt!253154) (currentByte!7397 thiss!1602) lt!253152) (bvadd #b00000000000000000000000000000001 (currentByte!7397 thiss!1602)) lt!253151) (bvadd #b00000000000000000000000000000001 (currentByte!7397 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253151) (bvshl ((_ sign_extend 24) v!222) lt!253150)))) (size!3537 (buf!3995 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7397 thiss!1602)) (currentBit!7392 thiss!1602))))) (and (bvsge (currentBit!7392 (BitStream!6243 (array!7858 (store (store (store (store (arr!4458 (buf!3995 thiss!1602)) (currentByte!7397 thiss!1602) lt!253154) (currentByte!7397 thiss!1602) lt!253152) (bvadd #b00000000000000000000000000000001 (currentByte!7397 thiss!1602)) lt!253151) (bvadd #b00000000000000000000000000000001 (currentByte!7397 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253151) (bvshl ((_ sign_extend 24) v!222) lt!253150)))) (size!3537 (buf!3995 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7397 thiss!1602)) (currentBit!7392 thiss!1602))) #b00000000000000000000000000000000) (bvslt (currentBit!7392 (BitStream!6243 (array!7858 (store (store (store (store (arr!4458 (buf!3995 thiss!1602)) (currentByte!7397 thiss!1602) lt!253154) (currentByte!7397 thiss!1602) lt!253152) (bvadd #b00000000000000000000000000000001 (currentByte!7397 thiss!1602)) lt!253151) (bvadd #b00000000000000000000000000000001 (currentByte!7397 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253151) (bvshl ((_ sign_extend 24) v!222) lt!253150)))) (size!3537 (buf!3995 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7397 thiss!1602)) (currentBit!7392 thiss!1602))) #b00000000000000000000000000001000) (bvsge (currentByte!7397 (BitStream!6243 (array!7858 (store (store (store (store (arr!4458 (buf!3995 thiss!1602)) (currentByte!7397 thiss!1602) lt!253154) (currentByte!7397 thiss!1602) lt!253152) (bvadd #b00000000000000000000000000000001 (currentByte!7397 thiss!1602)) lt!253151) (bvadd #b00000000000000000000000000000001 (currentByte!7397 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253151) (bvshl ((_ sign_extend 24) v!222) lt!253150)))) (size!3537 (buf!3995 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7397 thiss!1602)) (currentBit!7392 thiss!1602))) #b00000000000000000000000000000000) (or (bvslt (currentByte!7397 (BitStream!6243 (array!7858 (store (store (store (store (arr!4458 (buf!3995 thiss!1602)) (currentByte!7397 thiss!1602) lt!253154) (currentByte!7397 thiss!1602) lt!253152) (bvadd #b00000000000000000000000000000001 (currentByte!7397 thiss!1602)) lt!253151) (bvadd #b00000000000000000000000000000001 (currentByte!7397 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253151) (bvshl ((_ sign_extend 24) v!222) lt!253150)))) (size!3537 (buf!3995 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7397 thiss!1602)) (currentBit!7392 thiss!1602))) (size!3537 (buf!3995 (BitStream!6243 (array!7858 (store (store (store (store (arr!4458 (buf!3995 thiss!1602)) (currentByte!7397 thiss!1602) lt!253154) (currentByte!7397 thiss!1602) lt!253152) (bvadd #b00000000000000000000000000000001 (currentByte!7397 thiss!1602)) lt!253151) (bvadd #b00000000000000000000000000000001 (currentByte!7397 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253151) (bvshl ((_ sign_extend 24) v!222) lt!253150)))) (size!3537 (buf!3995 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7397 thiss!1602)) (currentBit!7392 thiss!1602))))) (and (= (currentBit!7392 (BitStream!6243 (array!7858 (store (store (store (store (arr!4458 (buf!3995 thiss!1602)) (currentByte!7397 thiss!1602) lt!253154) (currentByte!7397 thiss!1602) lt!253152) (bvadd #b00000000000000000000000000000001 (currentByte!7397 thiss!1602)) lt!253151) (bvadd #b00000000000000000000000000000001 (currentByte!7397 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253151) (bvshl ((_ sign_extend 24) v!222) lt!253150)))) (size!3537 (buf!3995 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7397 thiss!1602)) (currentBit!7392 thiss!1602))) #b00000000000000000000000000000000) (= (currentByte!7397 (BitStream!6243 (array!7858 (store (store (store (store (arr!4458 (buf!3995 thiss!1602)) (currentByte!7397 thiss!1602) lt!253154) (currentByte!7397 thiss!1602) lt!253152) (bvadd #b00000000000000000000000000000001 (currentByte!7397 thiss!1602)) lt!253151) (bvadd #b00000000000000000000000000000001 (currentByte!7397 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253151) (bvshl ((_ sign_extend 24) v!222) lt!253150)))) (size!3537 (buf!3995 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7397 thiss!1602)) (currentBit!7392 thiss!1602))) (size!3537 (buf!3995 (BitStream!6243 (array!7858 (store (store (store (store (arr!4458 (buf!3995 thiss!1602)) (currentByte!7397 thiss!1602) lt!253154) (currentByte!7397 thiss!1602) lt!253152) (bvadd #b00000000000000000000000000000001 (currentByte!7397 thiss!1602)) lt!253151) (bvadd #b00000000000000000000000000000001 (currentByte!7397 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253151) (bvshl ((_ sign_extend 24) v!222) lt!253150)))) (size!3537 (buf!3995 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7397 thiss!1602)) (currentBit!7392 thiss!1602)))))))))))

(assert (=> d!54675 d!54691))

(declare-fun d!54693 () Bool)

(assert (=> d!54693 (= (remainingBits!0 ((_ sign_extend 32) (size!3537 (buf!3995 thiss!1602))) ((_ sign_extend 32) (currentByte!7397 thiss!1602)) ((_ sign_extend 32) (currentBit!7392 thiss!1602))) (bvsub (bvmul ((_ sign_extend 32) (size!3537 (buf!3995 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7397 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7392 thiss!1602)))))))

(assert (=> d!54671 d!54693))

(declare-fun d!54695 () Bool)

(assert (=> d!54695 (= (invariant!0 (currentBit!7392 thiss!1602) (currentByte!7397 thiss!1602) (size!3537 (buf!3995 thiss!1602))) (and (bvsge (currentBit!7392 thiss!1602) #b00000000000000000000000000000000) (bvslt (currentBit!7392 thiss!1602) #b00000000000000000000000000001000) (bvsge (currentByte!7397 thiss!1602) #b00000000000000000000000000000000) (or (bvslt (currentByte!7397 thiss!1602) (size!3537 (buf!3995 thiss!1602))) (and (= (currentBit!7392 thiss!1602) #b00000000000000000000000000000000) (= (currentByte!7397 thiss!1602) (size!3537 (buf!3995 thiss!1602)))))))))

(assert (=> d!54673 d!54695))

(push 1)

(check-sat)

(pop 1)

