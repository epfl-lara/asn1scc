; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33220 () Bool)

(assert start!33220)

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!253133 () (_ BitVec 32))

(declare-fun lt!253134 () (_ BitVec 8))

(declare-datatypes ((array!7855 0))(
  ( (array!7856 (arr!4457 (Array (_ BitVec 32) (_ BitVec 8))) (size!3536 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6240 0))(
  ( (BitStream!6241 (buf!3994 array!7855) (currentByte!7396 (_ BitVec 32)) (currentBit!7391 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6240)

(declare-fun lt!253137 () (_ BitVec 8))

(declare-fun b!160784 () Bool)

(declare-fun lt!253135 () (_ BitVec 8))

(declare-fun e!110409 () Bool)

(declare-fun inv!12 (BitStream!6240) Bool)

(assert (=> b!160784 (= e!110409 (inv!12 (BitStream!6241 (array!7856 (store (store (store (store (arr!4457 (buf!3994 thiss!1602)) (currentByte!7396 thiss!1602) lt!253134) (currentByte!7396 thiss!1602) lt!253137) (bvadd #b00000000000000000000000000000001 (currentByte!7396 thiss!1602)) lt!253135) (bvadd #b00000000000000000000000000000001 (currentByte!7396 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253135) (bvshl ((_ sign_extend 24) v!222) lt!253133)))) (size!3536 (buf!3994 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7396 thiss!1602)) (currentBit!7391 thiss!1602))))))

(declare-fun lt!253136 () (_ BitVec 32))

(assert (=> b!160784 (= lt!253135 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4457 (buf!3994 thiss!1602)) (currentByte!7396 thiss!1602) lt!253134) (currentByte!7396 thiss!1602) lt!253137) (bvadd #b00000000000000000000000000000001 (currentByte!7396 thiss!1602)))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot lt!253136))))))))

(declare-fun b!160785 () Bool)

(declare-fun e!110407 () Bool)

(declare-fun array_inv!3283 (array!7855) Bool)

(assert (=> b!160785 (= e!110407 (array_inv!3283 (buf!3994 thiss!1602)))))

(declare-fun b!160783 () Bool)

(declare-fun e!110408 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!160783 (= e!110408 (byteRangesEq!0 (select (arr!4457 (buf!3994 thiss!1602)) (currentByte!7396 thiss!1602)) lt!253137 #b00000000000000000000000000000000 (currentBit!7391 thiss!1602)))))

(declare-fun b!160782 () Bool)

(declare-fun e!110406 () Bool)

(assert (=> b!160782 (= e!110406 (not e!110409))))

(declare-fun res!134042 () Bool)

(assert (=> b!160782 (=> res!134042 e!110409)))

(declare-fun lt!253132 () (_ BitVec 32))

(assert (=> b!160782 (= res!134042 (bvsle lt!253132 #b00000000000000000000000000000000))))

(assert (=> b!160782 e!110408))

(declare-fun res!134041 () Bool)

(assert (=> b!160782 (=> res!134041 e!110408)))

(assert (=> b!160782 (= res!134041 (bvsge (currentByte!7396 thiss!1602) (size!3536 (buf!3994 thiss!1602))))))

(assert (=> b!160782 (= lt!253137 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253134) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253132))))))

(assert (=> b!160782 (= lt!253134 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4457 (buf!3994 thiss!1602)) (currentByte!7396 thiss!1602))) lt!253136)))))

(assert (=> b!160782 (= lt!253136 ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!253133))))))))

(assert (=> b!160782 (= lt!253133 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253132))))))

(assert (=> b!160782 (= lt!253132 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7391 thiss!1602))))))

(declare-fun res!134040 () Bool)

(assert (=> start!33220 (=> (not res!134040) (not e!110406))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33220 (= res!134040 (validate_offset_byte!0 ((_ sign_extend 32) (size!3536 (buf!3994 thiss!1602))) ((_ sign_extend 32) (currentByte!7396 thiss!1602)) ((_ sign_extend 32) (currentBit!7391 thiss!1602))))))

(assert (=> start!33220 e!110406))

(assert (=> start!33220 (and (inv!12 thiss!1602) e!110407)))

(assert (=> start!33220 true))

(assert (= (and start!33220 res!134040) b!160782))

(assert (= (and b!160782 (not res!134041)) b!160783))

(assert (= (and b!160782 (not res!134042)) b!160784))

(assert (= start!33220 b!160785))

(declare-fun m!253999 () Bool)

(assert (=> b!160783 m!253999))

(assert (=> b!160783 m!253999))

(declare-fun m!254001 () Bool)

(assert (=> b!160783 m!254001))

(declare-fun m!254003 () Bool)

(assert (=> start!33220 m!254003))

(declare-fun m!254005 () Bool)

(assert (=> start!33220 m!254005))

(declare-fun m!254007 () Bool)

(assert (=> b!160785 m!254007))

(declare-fun m!254009 () Bool)

(assert (=> b!160784 m!254009))

(declare-fun m!254011 () Bool)

(assert (=> b!160784 m!254011))

(declare-fun m!254013 () Bool)

(assert (=> b!160784 m!254013))

(declare-fun m!254015 () Bool)

(assert (=> b!160784 m!254015))

(declare-fun m!254017 () Bool)

(assert (=> b!160784 m!254017))

(declare-fun m!254019 () Bool)

(assert (=> b!160784 m!254019))

(assert (=> b!160782 m!253999))

(declare-fun m!254021 () Bool)

(assert (=> b!160782 m!254021))

(check-sat (not b!160785) (not start!33220) (not b!160784) (not b!160783))
(check-sat)
(get-model)

(declare-fun d!54649 () Bool)

(assert (=> d!54649 (= (array_inv!3283 (buf!3994 thiss!1602)) (bvsge (size!3536 (buf!3994 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!160785 d!54649))

(declare-fun d!54651 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!54651 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3536 (buf!3994 thiss!1602))) ((_ sign_extend 32) (currentByte!7396 thiss!1602)) ((_ sign_extend 32) (currentBit!7391 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3536 (buf!3994 thiss!1602))) ((_ sign_extend 32) (currentByte!7396 thiss!1602)) ((_ sign_extend 32) (currentBit!7391 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13582 () Bool)

(assert (= bs!13582 d!54651))

(declare-fun m!254047 () Bool)

(assert (=> bs!13582 m!254047))

(assert (=> start!33220 d!54651))

(declare-fun d!54653 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!54653 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7391 thiss!1602) (currentByte!7396 thiss!1602) (size!3536 (buf!3994 thiss!1602))))))

(declare-fun bs!13583 () Bool)

(assert (= bs!13583 d!54653))

(declare-fun m!254049 () Bool)

(assert (=> bs!13583 m!254049))

(assert (=> start!33220 d!54653))

(declare-fun d!54655 () Bool)

(assert (=> d!54655 (= (inv!12 (BitStream!6241 (array!7856 (store (store (store (store (arr!4457 (buf!3994 thiss!1602)) (currentByte!7396 thiss!1602) lt!253134) (currentByte!7396 thiss!1602) lt!253137) (bvadd #b00000000000000000000000000000001 (currentByte!7396 thiss!1602)) lt!253135) (bvadd #b00000000000000000000000000000001 (currentByte!7396 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253135) (bvshl ((_ sign_extend 24) v!222) lt!253133)))) (size!3536 (buf!3994 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7396 thiss!1602)) (currentBit!7391 thiss!1602))) (invariant!0 (currentBit!7391 (BitStream!6241 (array!7856 (store (store (store (store (arr!4457 (buf!3994 thiss!1602)) (currentByte!7396 thiss!1602) lt!253134) (currentByte!7396 thiss!1602) lt!253137) (bvadd #b00000000000000000000000000000001 (currentByte!7396 thiss!1602)) lt!253135) (bvadd #b00000000000000000000000000000001 (currentByte!7396 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253135) (bvshl ((_ sign_extend 24) v!222) lt!253133)))) (size!3536 (buf!3994 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7396 thiss!1602)) (currentBit!7391 thiss!1602))) (currentByte!7396 (BitStream!6241 (array!7856 (store (store (store (store (arr!4457 (buf!3994 thiss!1602)) (currentByte!7396 thiss!1602) lt!253134) (currentByte!7396 thiss!1602) lt!253137) (bvadd #b00000000000000000000000000000001 (currentByte!7396 thiss!1602)) lt!253135) (bvadd #b00000000000000000000000000000001 (currentByte!7396 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253135) (bvshl ((_ sign_extend 24) v!222) lt!253133)))) (size!3536 (buf!3994 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7396 thiss!1602)) (currentBit!7391 thiss!1602))) (size!3536 (buf!3994 (BitStream!6241 (array!7856 (store (store (store (store (arr!4457 (buf!3994 thiss!1602)) (currentByte!7396 thiss!1602) lt!253134) (currentByte!7396 thiss!1602) lt!253137) (bvadd #b00000000000000000000000000000001 (currentByte!7396 thiss!1602)) lt!253135) (bvadd #b00000000000000000000000000000001 (currentByte!7396 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253135) (bvshl ((_ sign_extend 24) v!222) lt!253133)))) (size!3536 (buf!3994 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7396 thiss!1602)) (currentBit!7391 thiss!1602))))))))

(declare-fun bs!13584 () Bool)

(assert (= bs!13584 d!54655))

(declare-fun m!254051 () Bool)

(assert (=> bs!13584 m!254051))

(assert (=> b!160784 d!54655))

(declare-fun d!54657 () Bool)

(assert (=> d!54657 (= (byteRangesEq!0 (select (arr!4457 (buf!3994 thiss!1602)) (currentByte!7396 thiss!1602)) lt!253137 #b00000000000000000000000000000000 (currentBit!7391 thiss!1602)) (or (= #b00000000000000000000000000000000 (currentBit!7391 thiss!1602)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4457 (buf!3994 thiss!1602)) (currentByte!7396 thiss!1602))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7391 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!253137) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7391 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13586 () Bool)

(assert (= bs!13586 d!54657))

(declare-fun m!254055 () Bool)

(assert (=> bs!13586 m!254055))

(declare-fun m!254057 () Bool)

(assert (=> bs!13586 m!254057))

(assert (=> b!160783 d!54657))

(check-sat (not d!54655) (not d!54651) (not d!54653))
(check-sat)
(get-model)

(declare-fun d!54679 () Bool)

(assert (=> d!54679 (= (invariant!0 (currentBit!7391 (BitStream!6241 (array!7856 (store (store (store (store (arr!4457 (buf!3994 thiss!1602)) (currentByte!7396 thiss!1602) lt!253134) (currentByte!7396 thiss!1602) lt!253137) (bvadd #b00000000000000000000000000000001 (currentByte!7396 thiss!1602)) lt!253135) (bvadd #b00000000000000000000000000000001 (currentByte!7396 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253135) (bvshl ((_ sign_extend 24) v!222) lt!253133)))) (size!3536 (buf!3994 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7396 thiss!1602)) (currentBit!7391 thiss!1602))) (currentByte!7396 (BitStream!6241 (array!7856 (store (store (store (store (arr!4457 (buf!3994 thiss!1602)) (currentByte!7396 thiss!1602) lt!253134) (currentByte!7396 thiss!1602) lt!253137) (bvadd #b00000000000000000000000000000001 (currentByte!7396 thiss!1602)) lt!253135) (bvadd #b00000000000000000000000000000001 (currentByte!7396 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253135) (bvshl ((_ sign_extend 24) v!222) lt!253133)))) (size!3536 (buf!3994 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7396 thiss!1602)) (currentBit!7391 thiss!1602))) (size!3536 (buf!3994 (BitStream!6241 (array!7856 (store (store (store (store (arr!4457 (buf!3994 thiss!1602)) (currentByte!7396 thiss!1602) lt!253134) (currentByte!7396 thiss!1602) lt!253137) (bvadd #b00000000000000000000000000000001 (currentByte!7396 thiss!1602)) lt!253135) (bvadd #b00000000000000000000000000000001 (currentByte!7396 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253135) (bvshl ((_ sign_extend 24) v!222) lt!253133)))) (size!3536 (buf!3994 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7396 thiss!1602)) (currentBit!7391 thiss!1602))))) (and (bvsge (currentBit!7391 (BitStream!6241 (array!7856 (store (store (store (store (arr!4457 (buf!3994 thiss!1602)) (currentByte!7396 thiss!1602) lt!253134) (currentByte!7396 thiss!1602) lt!253137) (bvadd #b00000000000000000000000000000001 (currentByte!7396 thiss!1602)) lt!253135) (bvadd #b00000000000000000000000000000001 (currentByte!7396 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253135) (bvshl ((_ sign_extend 24) v!222) lt!253133)))) (size!3536 (buf!3994 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7396 thiss!1602)) (currentBit!7391 thiss!1602))) #b00000000000000000000000000000000) (bvslt (currentBit!7391 (BitStream!6241 (array!7856 (store (store (store (store (arr!4457 (buf!3994 thiss!1602)) (currentByte!7396 thiss!1602) lt!253134) (currentByte!7396 thiss!1602) lt!253137) (bvadd #b00000000000000000000000000000001 (currentByte!7396 thiss!1602)) lt!253135) (bvadd #b00000000000000000000000000000001 (currentByte!7396 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253135) (bvshl ((_ sign_extend 24) v!222) lt!253133)))) (size!3536 (buf!3994 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7396 thiss!1602)) (currentBit!7391 thiss!1602))) #b00000000000000000000000000001000) (bvsge (currentByte!7396 (BitStream!6241 (array!7856 (store (store (store (store (arr!4457 (buf!3994 thiss!1602)) (currentByte!7396 thiss!1602) lt!253134) (currentByte!7396 thiss!1602) lt!253137) (bvadd #b00000000000000000000000000000001 (currentByte!7396 thiss!1602)) lt!253135) (bvadd #b00000000000000000000000000000001 (currentByte!7396 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253135) (bvshl ((_ sign_extend 24) v!222) lt!253133)))) (size!3536 (buf!3994 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7396 thiss!1602)) (currentBit!7391 thiss!1602))) #b00000000000000000000000000000000) (or (bvslt (currentByte!7396 (BitStream!6241 (array!7856 (store (store (store (store (arr!4457 (buf!3994 thiss!1602)) (currentByte!7396 thiss!1602) lt!253134) (currentByte!7396 thiss!1602) lt!253137) (bvadd #b00000000000000000000000000000001 (currentByte!7396 thiss!1602)) lt!253135) (bvadd #b00000000000000000000000000000001 (currentByte!7396 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253135) (bvshl ((_ sign_extend 24) v!222) lt!253133)))) (size!3536 (buf!3994 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7396 thiss!1602)) (currentBit!7391 thiss!1602))) (size!3536 (buf!3994 (BitStream!6241 (array!7856 (store (store (store (store (arr!4457 (buf!3994 thiss!1602)) (currentByte!7396 thiss!1602) lt!253134) (currentByte!7396 thiss!1602) lt!253137) (bvadd #b00000000000000000000000000000001 (currentByte!7396 thiss!1602)) lt!253135) (bvadd #b00000000000000000000000000000001 (currentByte!7396 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253135) (bvshl ((_ sign_extend 24) v!222) lt!253133)))) (size!3536 (buf!3994 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7396 thiss!1602)) (currentBit!7391 thiss!1602))))) (and (= (currentBit!7391 (BitStream!6241 (array!7856 (store (store (store (store (arr!4457 (buf!3994 thiss!1602)) (currentByte!7396 thiss!1602) lt!253134) (currentByte!7396 thiss!1602) lt!253137) (bvadd #b00000000000000000000000000000001 (currentByte!7396 thiss!1602)) lt!253135) (bvadd #b00000000000000000000000000000001 (currentByte!7396 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253135) (bvshl ((_ sign_extend 24) v!222) lt!253133)))) (size!3536 (buf!3994 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7396 thiss!1602)) (currentBit!7391 thiss!1602))) #b00000000000000000000000000000000) (= (currentByte!7396 (BitStream!6241 (array!7856 (store (store (store (store (arr!4457 (buf!3994 thiss!1602)) (currentByte!7396 thiss!1602) lt!253134) (currentByte!7396 thiss!1602) lt!253137) (bvadd #b00000000000000000000000000000001 (currentByte!7396 thiss!1602)) lt!253135) (bvadd #b00000000000000000000000000000001 (currentByte!7396 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253135) (bvshl ((_ sign_extend 24) v!222) lt!253133)))) (size!3536 (buf!3994 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7396 thiss!1602)) (currentBit!7391 thiss!1602))) (size!3536 (buf!3994 (BitStream!6241 (array!7856 (store (store (store (store (arr!4457 (buf!3994 thiss!1602)) (currentByte!7396 thiss!1602) lt!253134) (currentByte!7396 thiss!1602) lt!253137) (bvadd #b00000000000000000000000000000001 (currentByte!7396 thiss!1602)) lt!253135) (bvadd #b00000000000000000000000000000001 (currentByte!7396 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253135) (bvshl ((_ sign_extend 24) v!222) lt!253133)))) (size!3536 (buf!3994 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7396 thiss!1602)) (currentBit!7391 thiss!1602)))))))))))

(assert (=> d!54655 d!54679))

(declare-fun d!54681 () Bool)

(assert (=> d!54681 (= (remainingBits!0 ((_ sign_extend 32) (size!3536 (buf!3994 thiss!1602))) ((_ sign_extend 32) (currentByte!7396 thiss!1602)) ((_ sign_extend 32) (currentBit!7391 thiss!1602))) (bvsub (bvmul ((_ sign_extend 32) (size!3536 (buf!3994 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7396 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7391 thiss!1602)))))))

(assert (=> d!54651 d!54681))

(declare-fun d!54683 () Bool)

(assert (=> d!54683 (= (invariant!0 (currentBit!7391 thiss!1602) (currentByte!7396 thiss!1602) (size!3536 (buf!3994 thiss!1602))) (and (bvsge (currentBit!7391 thiss!1602) #b00000000000000000000000000000000) (bvslt (currentBit!7391 thiss!1602) #b00000000000000000000000000001000) (bvsge (currentByte!7396 thiss!1602) #b00000000000000000000000000000000) (or (bvslt (currentByte!7396 thiss!1602) (size!3536 (buf!3994 thiss!1602))) (and (= (currentBit!7391 thiss!1602) #b00000000000000000000000000000000) (= (currentByte!7396 thiss!1602) (size!3536 (buf!3994 thiss!1602)))))))))

(assert (=> d!54653 d!54683))

(check-sat)
