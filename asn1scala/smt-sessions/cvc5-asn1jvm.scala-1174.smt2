; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33218 () Bool)

(assert start!33218)

(declare-fun b!160770 () Bool)

(declare-fun e!110392 () Bool)

(declare-fun e!110390 () Bool)

(assert (=> b!160770 (= e!110392 (not e!110390))))

(declare-fun res!134033 () Bool)

(assert (=> b!160770 (=> res!134033 e!110390)))

(declare-fun lt!253114 () (_ BitVec 32))

(assert (=> b!160770 (= res!134033 (bvsle lt!253114 #b00000000000000000000000000000000))))

(declare-fun e!110391 () Bool)

(assert (=> b!160770 e!110391))

(declare-fun res!134031 () Bool)

(assert (=> b!160770 (=> res!134031 e!110391)))

(declare-datatypes ((array!7853 0))(
  ( (array!7854 (arr!4456 (Array (_ BitVec 32) (_ BitVec 8))) (size!3535 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6238 0))(
  ( (BitStream!6239 (buf!3993 array!7853) (currentByte!7395 (_ BitVec 32)) (currentBit!7390 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6238)

(assert (=> b!160770 (= res!134031 (bvsge (currentByte!7395 thiss!1602) (size!3535 (buf!3993 thiss!1602))))))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!253116 () (_ BitVec 8))

(declare-fun lt!253115 () (_ BitVec 8))

(assert (=> b!160770 (= lt!253115 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253116) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253114))))))

(declare-fun lt!253117 () (_ BitVec 32))

(assert (=> b!160770 (= lt!253116 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4456 (buf!3993 thiss!1602)) (currentByte!7395 thiss!1602))) lt!253117)))))

(declare-fun lt!253119 () (_ BitVec 32))

(assert (=> b!160770 (= lt!253117 ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!253119))))))))

(assert (=> b!160770 (= lt!253119 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253114))))))

(assert (=> b!160770 (= lt!253114 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7390 thiss!1602))))))

(declare-fun b!160772 () Bool)

(declare-fun lt!253118 () (_ BitVec 8))

(declare-fun inv!12 (BitStream!6238) Bool)

(assert (=> b!160772 (= e!110390 (inv!12 (BitStream!6239 (array!7854 (store (store (store (store (arr!4456 (buf!3993 thiss!1602)) (currentByte!7395 thiss!1602) lt!253116) (currentByte!7395 thiss!1602) lt!253115) (bvadd #b00000000000000000000000000000001 (currentByte!7395 thiss!1602)) lt!253118) (bvadd #b00000000000000000000000000000001 (currentByte!7395 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253118) (bvshl ((_ sign_extend 24) v!222) lt!253119)))) (size!3535 (buf!3993 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7395 thiss!1602)) (currentBit!7390 thiss!1602))))))

(assert (=> b!160772 (= lt!253118 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4456 (buf!3993 thiss!1602)) (currentByte!7395 thiss!1602) lt!253116) (currentByte!7395 thiss!1602) lt!253115) (bvadd #b00000000000000000000000000000001 (currentByte!7395 thiss!1602)))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot lt!253117))))))))

(declare-fun res!134032 () Bool)

(assert (=> start!33218 (=> (not res!134032) (not e!110392))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33218 (= res!134032 (validate_offset_byte!0 ((_ sign_extend 32) (size!3535 (buf!3993 thiss!1602))) ((_ sign_extend 32) (currentByte!7395 thiss!1602)) ((_ sign_extend 32) (currentBit!7390 thiss!1602))))))

(assert (=> start!33218 e!110392))

(declare-fun e!110393 () Bool)

(assert (=> start!33218 (and (inv!12 thiss!1602) e!110393)))

(assert (=> start!33218 true))

(declare-fun b!160771 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!160771 (= e!110391 (byteRangesEq!0 (select (arr!4456 (buf!3993 thiss!1602)) (currentByte!7395 thiss!1602)) lt!253115 #b00000000000000000000000000000000 (currentBit!7390 thiss!1602)))))

(declare-fun b!160773 () Bool)

(declare-fun array_inv!3282 (array!7853) Bool)

(assert (=> b!160773 (= e!110393 (array_inv!3282 (buf!3993 thiss!1602)))))

(assert (= (and start!33218 res!134032) b!160770))

(assert (= (and b!160770 (not res!134031)) b!160771))

(assert (= (and b!160770 (not res!134033)) b!160772))

(assert (= start!33218 b!160773))

(declare-fun m!253975 () Bool)

(assert (=> b!160773 m!253975))

(declare-fun m!253977 () Bool)

(assert (=> b!160771 m!253977))

(assert (=> b!160771 m!253977))

(declare-fun m!253979 () Bool)

(assert (=> b!160771 m!253979))

(assert (=> b!160770 m!253977))

(declare-fun m!253981 () Bool)

(assert (=> b!160770 m!253981))

(declare-fun m!253983 () Bool)

(assert (=> b!160772 m!253983))

(declare-fun m!253985 () Bool)

(assert (=> b!160772 m!253985))

(declare-fun m!253987 () Bool)

(assert (=> b!160772 m!253987))

(declare-fun m!253989 () Bool)

(assert (=> b!160772 m!253989))

(declare-fun m!253991 () Bool)

(assert (=> b!160772 m!253991))

(declare-fun m!253993 () Bool)

(assert (=> b!160772 m!253993))

(declare-fun m!253995 () Bool)

(assert (=> start!33218 m!253995))

(declare-fun m!253997 () Bool)

(assert (=> start!33218 m!253997))

(push 1)

(assert (not start!33218))

(assert (not b!160772))

(assert (not b!160771))

(assert (not b!160773))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54659 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!54659 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3535 (buf!3993 thiss!1602))) ((_ sign_extend 32) (currentByte!7395 thiss!1602)) ((_ sign_extend 32) (currentBit!7390 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3535 (buf!3993 thiss!1602))) ((_ sign_extend 32) (currentByte!7395 thiss!1602)) ((_ sign_extend 32) (currentBit!7390 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13585 () Bool)

(assert (= bs!13585 d!54659))

(declare-fun m!254053 () Bool)

(assert (=> bs!13585 m!254053))

(assert (=> start!33218 d!54659))

(declare-fun d!54661 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!54661 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7390 thiss!1602) (currentByte!7395 thiss!1602) (size!3535 (buf!3993 thiss!1602))))))

(declare-fun bs!13587 () Bool)

(assert (= bs!13587 d!54661))

(declare-fun m!254059 () Bool)

(assert (=> bs!13587 m!254059))

(assert (=> start!33218 d!54661))

(declare-fun d!54663 () Bool)

(assert (=> d!54663 (= (inv!12 (BitStream!6239 (array!7854 (store (store (store (store (arr!4456 (buf!3993 thiss!1602)) (currentByte!7395 thiss!1602) lt!253116) (currentByte!7395 thiss!1602) lt!253115) (bvadd #b00000000000000000000000000000001 (currentByte!7395 thiss!1602)) lt!253118) (bvadd #b00000000000000000000000000000001 (currentByte!7395 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253118) (bvshl ((_ sign_extend 24) v!222) lt!253119)))) (size!3535 (buf!3993 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7395 thiss!1602)) (currentBit!7390 thiss!1602))) (invariant!0 (currentBit!7390 (BitStream!6239 (array!7854 (store (store (store (store (arr!4456 (buf!3993 thiss!1602)) (currentByte!7395 thiss!1602) lt!253116) (currentByte!7395 thiss!1602) lt!253115) (bvadd #b00000000000000000000000000000001 (currentByte!7395 thiss!1602)) lt!253118) (bvadd #b00000000000000000000000000000001 (currentByte!7395 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253118) (bvshl ((_ sign_extend 24) v!222) lt!253119)))) (size!3535 (buf!3993 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7395 thiss!1602)) (currentBit!7390 thiss!1602))) (currentByte!7395 (BitStream!6239 (array!7854 (store (store (store (store (arr!4456 (buf!3993 thiss!1602)) (currentByte!7395 thiss!1602) lt!253116) (currentByte!7395 thiss!1602) lt!253115) (bvadd #b00000000000000000000000000000001 (currentByte!7395 thiss!1602)) lt!253118) (bvadd #b00000000000000000000000000000001 (currentByte!7395 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253118) (bvshl ((_ sign_extend 24) v!222) lt!253119)))) (size!3535 (buf!3993 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7395 thiss!1602)) (currentBit!7390 thiss!1602))) (size!3535 (buf!3993 (BitStream!6239 (array!7854 (store (store (store (store (arr!4456 (buf!3993 thiss!1602)) (currentByte!7395 thiss!1602) lt!253116) (currentByte!7395 thiss!1602) lt!253115) (bvadd #b00000000000000000000000000000001 (currentByte!7395 thiss!1602)) lt!253118) (bvadd #b00000000000000000000000000000001 (currentByte!7395 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253118) (bvshl ((_ sign_extend 24) v!222) lt!253119)))) (size!3535 (buf!3993 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7395 thiss!1602)) (currentBit!7390 thiss!1602))))))))

(declare-fun bs!13588 () Bool)

(assert (= bs!13588 d!54663))

(declare-fun m!254061 () Bool)

(assert (=> bs!13588 m!254061))

(assert (=> b!160772 d!54663))

(declare-fun d!54665 () Bool)

(assert (=> d!54665 (= (byteRangesEq!0 (select (arr!4456 (buf!3993 thiss!1602)) (currentByte!7395 thiss!1602)) lt!253115 #b00000000000000000000000000000000 (currentBit!7390 thiss!1602)) (or (= #b00000000000000000000000000000000 (currentBit!7390 thiss!1602)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4456 (buf!3993 thiss!1602)) (currentByte!7395 thiss!1602))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7390 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!253115) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7390 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13589 () Bool)

(assert (= bs!13589 d!54665))

(declare-fun m!254063 () Bool)

(assert (=> bs!13589 m!254063))

(declare-fun m!254065 () Bool)

(assert (=> bs!13589 m!254065))

(assert (=> b!160771 d!54665))

(declare-fun d!54667 () Bool)

(assert (=> d!54667 (= (array_inv!3282 (buf!3993 thiss!1602)) (bvsge (size!3535 (buf!3993 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!160773 d!54667))

(push 1)

(assert (not d!54661))

(assert (not d!54663))

(assert (not d!54659))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54685 () Bool)

(assert (=> d!54685 (= (invariant!0 (currentBit!7390 thiss!1602) (currentByte!7395 thiss!1602) (size!3535 (buf!3993 thiss!1602))) (and (bvsge (currentBit!7390 thiss!1602) #b00000000000000000000000000000000) (bvslt (currentBit!7390 thiss!1602) #b00000000000000000000000000001000) (bvsge (currentByte!7395 thiss!1602) #b00000000000000000000000000000000) (or (bvslt (currentByte!7395 thiss!1602) (size!3535 (buf!3993 thiss!1602))) (and (= (currentBit!7390 thiss!1602) #b00000000000000000000000000000000) (= (currentByte!7395 thiss!1602) (size!3535 (buf!3993 thiss!1602)))))))))

(assert (=> d!54661 d!54685))

(declare-fun d!54687 () Bool)

(assert (=> d!54687 (= (invariant!0 (currentBit!7390 (BitStream!6239 (array!7854 (store (store (store (store (arr!4456 (buf!3993 thiss!1602)) (currentByte!7395 thiss!1602) lt!253116) (currentByte!7395 thiss!1602) lt!253115) (bvadd #b00000000000000000000000000000001 (currentByte!7395 thiss!1602)) lt!253118) (bvadd #b00000000000000000000000000000001 (currentByte!7395 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253118) (bvshl ((_ sign_extend 24) v!222) lt!253119)))) (size!3535 (buf!3993 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7395 thiss!1602)) (currentBit!7390 thiss!1602))) (currentByte!7395 (BitStream!6239 (array!7854 (store (store (store (store (arr!4456 (buf!3993 thiss!1602)) (currentByte!7395 thiss!1602) lt!253116) (currentByte!7395 thiss!1602) lt!253115) (bvadd #b00000000000000000000000000000001 (currentByte!7395 thiss!1602)) lt!253118) (bvadd #b00000000000000000000000000000001 (currentByte!7395 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253118) (bvshl ((_ sign_extend 24) v!222) lt!253119)))) (size!3535 (buf!3993 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7395 thiss!1602)) (currentBit!7390 thiss!1602))) (size!3535 (buf!3993 (BitStream!6239 (array!7854 (store (store (store (store (arr!4456 (buf!3993 thiss!1602)) (currentByte!7395 thiss!1602) lt!253116) (currentByte!7395 thiss!1602) lt!253115) (bvadd #b00000000000000000000000000000001 (currentByte!7395 thiss!1602)) lt!253118) (bvadd #b00000000000000000000000000000001 (currentByte!7395 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253118) (bvshl ((_ sign_extend 24) v!222) lt!253119)))) (size!3535 (buf!3993 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7395 thiss!1602)) (currentBit!7390 thiss!1602))))) (and (bvsge (currentBit!7390 (BitStream!6239 (array!7854 (store (store (store (store (arr!4456 (buf!3993 thiss!1602)) (currentByte!7395 thiss!1602) lt!253116) (currentByte!7395 thiss!1602) lt!253115) (bvadd #b00000000000000000000000000000001 (currentByte!7395 thiss!1602)) lt!253118) (bvadd #b00000000000000000000000000000001 (currentByte!7395 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253118) (bvshl ((_ sign_extend 24) v!222) lt!253119)))) (size!3535 (buf!3993 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7395 thiss!1602)) (currentBit!7390 thiss!1602))) #b00000000000000000000000000000000) (bvslt (currentBit!7390 (BitStream!6239 (array!7854 (store (store (store (store (arr!4456 (buf!3993 thiss!1602)) (currentByte!7395 thiss!1602) lt!253116) (currentByte!7395 thiss!1602) lt!253115) (bvadd #b00000000000000000000000000000001 (currentByte!7395 thiss!1602)) lt!253118) (bvadd #b00000000000000000000000000000001 (currentByte!7395 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253118) (bvshl ((_ sign_extend 24) v!222) lt!253119)))) (size!3535 (buf!3993 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7395 thiss!1602)) (currentBit!7390 thiss!1602))) #b00000000000000000000000000001000) (bvsge (currentByte!7395 (BitStream!6239 (array!7854 (store (store (store (store (arr!4456 (buf!3993 thiss!1602)) (currentByte!7395 thiss!1602) lt!253116) (currentByte!7395 thiss!1602) lt!253115) (bvadd #b00000000000000000000000000000001 (currentByte!7395 thiss!1602)) lt!253118) (bvadd #b00000000000000000000000000000001 (currentByte!7395 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253118) (bvshl ((_ sign_extend 24) v!222) lt!253119)))) (size!3535 (buf!3993 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7395 thiss!1602)) (currentBit!7390 thiss!1602))) #b00000000000000000000000000000000) (or (bvslt (currentByte!7395 (BitStream!6239 (array!7854 (store (store (store (store (arr!4456 (buf!3993 thiss!1602)) (currentByte!7395 thiss!1602) lt!253116) (currentByte!7395 thiss!1602) lt!253115) (bvadd #b00000000000000000000000000000001 (currentByte!7395 thiss!1602)) lt!253118) (bvadd #b00000000000000000000000000000001 (currentByte!7395 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253118) (bvshl ((_ sign_extend 24) v!222) lt!253119)))) (size!3535 (buf!3993 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7395 thiss!1602)) (currentBit!7390 thiss!1602))) (size!3535 (buf!3993 (BitStream!6239 (array!7854 (store (store (store (store (arr!4456 (buf!3993 thiss!1602)) (currentByte!7395 thiss!1602) lt!253116) (currentByte!7395 thiss!1602) lt!253115) (bvadd #b00000000000000000000000000000001 (currentByte!7395 thiss!1602)) lt!253118) (bvadd #b00000000000000000000000000000001 (currentByte!7395 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253118) (bvshl ((_ sign_extend 24) v!222) lt!253119)))) (size!3535 (buf!3993 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7395 thiss!1602)) (currentBit!7390 thiss!1602))))) (and (= (currentBit!7390 (BitStream!6239 (array!7854 (store (store (store (store (arr!4456 (buf!3993 thiss!1602)) (currentByte!7395 thiss!1602) lt!253116) (currentByte!7395 thiss!1602) lt!253115) (bvadd #b00000000000000000000000000000001 (currentByte!7395 thiss!1602)) lt!253118) (bvadd #b00000000000000000000000000000001 (currentByte!7395 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253118) (bvshl ((_ sign_extend 24) v!222) lt!253119)))) (size!3535 (buf!3993 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7395 thiss!1602)) (currentBit!7390 thiss!1602))) #b00000000000000000000000000000000) (= (currentByte!7395 (BitStream!6239 (array!7854 (store (store (store (store (arr!4456 (buf!3993 thiss!1602)) (currentByte!7395 thiss!1602) lt!253116) (currentByte!7395 thiss!1602) lt!253115) (bvadd #b00000000000000000000000000000001 (currentByte!7395 thiss!1602)) lt!253118) (bvadd #b00000000000000000000000000000001 (currentByte!7395 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253118) (bvshl ((_ sign_extend 24) v!222) lt!253119)))) (size!3535 (buf!3993 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7395 thiss!1602)) (currentBit!7390 thiss!1602))) (size!3535 (buf!3993 (BitStream!6239 (array!7854 (store (store (store (store (arr!4456 (buf!3993 thiss!1602)) (currentByte!7395 thiss!1602) lt!253116) (currentByte!7395 thiss!1602) lt!253115) (bvadd #b00000000000000000000000000000001 (currentByte!7395 thiss!1602)) lt!253118) (bvadd #b00000000000000000000000000000001 (currentByte!7395 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253118) (bvshl ((_ sign_extend 24) v!222) lt!253119)))) (size!3535 (buf!3993 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7395 thiss!1602)) (currentBit!7390 thiss!1602)))))))))))

(assert (=> d!54663 d!54687))

(declare-fun d!54689 () Bool)

(assert (=> d!54689 (= (remainingBits!0 ((_ sign_extend 32) (size!3535 (buf!3993 thiss!1602))) ((_ sign_extend 32) (currentByte!7395 thiss!1602)) ((_ sign_extend 32) (currentBit!7390 thiss!1602))) (bvsub (bvmul ((_ sign_extend 32) (size!3535 (buf!3993 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7395 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7390 thiss!1602)))))))

(assert (=> d!54659 d!54689))

(push 1)

(check-sat)

