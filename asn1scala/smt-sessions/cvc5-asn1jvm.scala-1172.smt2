; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33134 () Bool)

(assert start!33134)

(declare-fun res!133993 () Bool)

(declare-fun e!110319 () Bool)

(assert (=> start!33134 (=> (not res!133993) (not e!110319))))

(declare-datatypes ((array!7835 0))(
  ( (array!7836 (arr!4450 (Array (_ BitVec 32) (_ BitVec 8))) (size!3529 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6226 0))(
  ( (BitStream!6227 (buf!3987 array!7835) (currentByte!7371 (_ BitVec 32)) (currentBit!7366 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6226)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33134 (= res!133993 (validate_offset_byte!0 ((_ sign_extend 32) (size!3529 (buf!3987 thiss!1602))) ((_ sign_extend 32) (currentByte!7371 thiss!1602)) ((_ sign_extend 32) (currentBit!7366 thiss!1602))))))

(assert (=> start!33134 e!110319))

(declare-fun e!110317 () Bool)

(declare-fun inv!12 (BitStream!6226) Bool)

(assert (=> start!33134 (and (inv!12 thiss!1602) e!110317)))

(assert (=> start!33134 true))

(declare-fun b!160714 () Bool)

(declare-fun lt!253086 () (_ BitVec 32))

(assert (=> b!160714 (= e!110319 (not (or (bvsle lt!253086 #b00000000000000000000000000000000) (and (bvsge (bvadd #b00000000000000000000000000000001 (currentByte!7371 thiss!1602)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!7371 thiss!1602)) (size!3529 (buf!3987 thiss!1602)))))))))

(declare-fun e!110318 () Bool)

(assert (=> b!160714 e!110318))

(declare-fun res!133994 () Bool)

(assert (=> b!160714 (=> res!133994 e!110318)))

(assert (=> b!160714 (= res!133994 (bvsge (currentByte!7371 thiss!1602) (size!3529 (buf!3987 thiss!1602))))))

(assert (=> b!160714 (= lt!253086 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7366 thiss!1602))))))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun b!160715 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!160715 (= e!110318 (byteRangesEq!0 (select (arr!4450 (buf!3987 thiss!1602)) (currentByte!7371 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4450 (buf!3987 thiss!1602)) (currentByte!7371 thiss!1602))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253086))))))))))) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253086))) #b00000000000000000000000000000000 (currentBit!7366 thiss!1602)))))

(declare-fun b!160716 () Bool)

(declare-fun array_inv!3276 (array!7835) Bool)

(assert (=> b!160716 (= e!110317 (array_inv!3276 (buf!3987 thiss!1602)))))

(assert (= (and start!33134 res!133993) b!160714))

(assert (= (and b!160714 (not res!133994)) b!160715))

(assert (= start!33134 b!160716))

(declare-fun m!253855 () Bool)

(assert (=> start!33134 m!253855))

(declare-fun m!253857 () Bool)

(assert (=> start!33134 m!253857))

(declare-fun m!253859 () Bool)

(assert (=> b!160715 m!253859))

(declare-fun m!253861 () Bool)

(assert (=> b!160715 m!253861))

(assert (=> b!160715 m!253859))

(declare-fun m!253863 () Bool)

(assert (=> b!160715 m!253863))

(declare-fun m!253865 () Bool)

(assert (=> b!160716 m!253865))

(push 1)

(assert (not start!33134))

(assert (not b!160715))

(assert (not b!160716))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54581 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!54581 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3529 (buf!3987 thiss!1602))) ((_ sign_extend 32) (currentByte!7371 thiss!1602)) ((_ sign_extend 32) (currentBit!7366 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3529 (buf!3987 thiss!1602))) ((_ sign_extend 32) (currentByte!7371 thiss!1602)) ((_ sign_extend 32) (currentBit!7366 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13561 () Bool)

(assert (= bs!13561 d!54581))

(declare-fun m!253899 () Bool)

(assert (=> bs!13561 m!253899))

(assert (=> start!33134 d!54581))

(declare-fun d!54583 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!54583 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7366 thiss!1602) (currentByte!7371 thiss!1602) (size!3529 (buf!3987 thiss!1602))))))

(declare-fun bs!13562 () Bool)

(assert (= bs!13562 d!54583))

(declare-fun m!253901 () Bool)

(assert (=> bs!13562 m!253901))

(assert (=> start!33134 d!54583))

(declare-fun d!54585 () Bool)

(assert (=> d!54585 (= (byteRangesEq!0 (select (arr!4450 (buf!3987 thiss!1602)) (currentByte!7371 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4450 (buf!3987 thiss!1602)) (currentByte!7371 thiss!1602))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253086))))))))))) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253086))) #b00000000000000000000000000000000 (currentBit!7366 thiss!1602)) (or (= #b00000000000000000000000000000000 (currentBit!7366 thiss!1602)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4450 (buf!3987 thiss!1602)) (currentByte!7371 thiss!1602))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7366 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4450 (buf!3987 thiss!1602)) (currentByte!7371 thiss!1602))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253086))))))))))) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253086)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7366 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13563 () Bool)

(assert (= bs!13563 d!54585))

(declare-fun m!253903 () Bool)

(assert (=> bs!13563 m!253903))

(declare-fun m!253905 () Bool)

(assert (=> bs!13563 m!253905))

(assert (=> b!160715 d!54585))

(declare-fun d!54587 () Bool)

(assert (=> d!54587 (= (array_inv!3276 (buf!3987 thiss!1602)) (bvsge (size!3529 (buf!3987 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!160716 d!54587))

(push 1)

(assert (not d!54583))

(assert (not d!54581))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54601 () Bool)

(assert (=> d!54601 (= (invariant!0 (currentBit!7366 thiss!1602) (currentByte!7371 thiss!1602) (size!3529 (buf!3987 thiss!1602))) (and (bvsge (currentBit!7366 thiss!1602) #b00000000000000000000000000000000) (bvslt (currentBit!7366 thiss!1602) #b00000000000000000000000000001000) (bvsge (currentByte!7371 thiss!1602) #b00000000000000000000000000000000) (or (bvslt (currentByte!7371 thiss!1602) (size!3529 (buf!3987 thiss!1602))) (and (= (currentBit!7366 thiss!1602) #b00000000000000000000000000000000) (= (currentByte!7371 thiss!1602) (size!3529 (buf!3987 thiss!1602)))))))))

(assert (=> d!54583 d!54601))

(declare-fun d!54603 () Bool)

(assert (=> d!54603 (= (remainingBits!0 ((_ sign_extend 32) (size!3529 (buf!3987 thiss!1602))) ((_ sign_extend 32) (currentByte!7371 thiss!1602)) ((_ sign_extend 32) (currentBit!7366 thiss!1602))) (bvsub (bvmul ((_ sign_extend 32) (size!3529 (buf!3987 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7371 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7366 thiss!1602)))))))

(assert (=> d!54581 d!54603))

(push 1)

(check-sat)

(pop 1)

