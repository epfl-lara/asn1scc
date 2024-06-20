; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33096 () Bool)

(assert start!33096)

(declare-fun b!160705 () Bool)

(declare-fun e!110304 () Bool)

(declare-datatypes ((array!7830 0))(
  ( (array!7831 (arr!4449 (Array (_ BitVec 32) (_ BitVec 8))) (size!3528 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6224 0))(
  ( (BitStream!6225 (buf!3986 array!7830) (currentByte!7361 (_ BitVec 32)) (currentBit!7356 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6224)

(declare-fun lt!253081 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!160705 (= e!110304 (byteRangesEq!0 (select (arr!4449 (buf!3986 thiss!1602)) (currentByte!7361 thiss!1602)) lt!253081 #b00000000000000000000000000000000 (currentBit!7356 thiss!1602)))))

(declare-fun res!133988 () Bool)

(declare-fun e!110303 () Bool)

(assert (=> start!33096 (=> (not res!133988) (not e!110303))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33096 (= res!133988 (validate_offset_byte!0 ((_ sign_extend 32) (size!3528 (buf!3986 thiss!1602))) ((_ sign_extend 32) (currentByte!7361 thiss!1602)) ((_ sign_extend 32) (currentBit!7356 thiss!1602))))))

(assert (=> start!33096 e!110303))

(declare-fun e!110307 () Bool)

(declare-fun inv!12 (BitStream!6224) Bool)

(assert (=> start!33096 (and (inv!12 thiss!1602) e!110307)))

(assert (=> start!33096 true))

(declare-fun lt!253083 () (_ BitVec 8))

(declare-fun e!110306 () Bool)

(declare-fun lt!253080 () (_ BitVec 32))

(declare-fun b!160706 () Bool)

(assert (=> b!160706 (= e!110306 (inv!12 (BitStream!6225 (array!7831 (store (store (store (arr!4449 (buf!3986 thiss!1602)) (currentByte!7361 thiss!1602) lt!253083) (currentByte!7361 thiss!1602) lt!253081) (bvadd #b00000000000000000000000000000001 (currentByte!7361 thiss!1602)) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4449 (buf!3986 thiss!1602)) (currentByte!7361 thiss!1602) lt!253083) (currentByte!7361 thiss!1602) lt!253081) (bvadd #b00000000000000000000000000000001 (currentByte!7361 thiss!1602)))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot lt!253080)))))) (size!3528 (buf!3986 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7361 thiss!1602)) (currentBit!7356 thiss!1602))))))

(declare-fun b!160704 () Bool)

(assert (=> b!160704 (= e!110303 (not e!110306))))

(declare-fun res!133987 () Bool)

(assert (=> b!160704 (=> res!133987 e!110306)))

(declare-fun lt!253082 () (_ BitVec 32))

(assert (=> b!160704 (= res!133987 (bvsle lt!253082 #b00000000000000000000000000000000))))

(assert (=> b!160704 e!110304))

(declare-fun res!133986 () Bool)

(assert (=> b!160704 (=> res!133986 e!110304)))

(assert (=> b!160704 (= res!133986 (bvsge (currentByte!7361 thiss!1602) (size!3528 (buf!3986 thiss!1602))))))

(declare-fun v!222 () (_ BitVec 8))

(assert (=> b!160704 (= lt!253081 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253083) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253082))))))

(assert (=> b!160704 (= lt!253083 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4449 (buf!3986 thiss!1602)) (currentByte!7361 thiss!1602))) lt!253080)))))

(assert (=> b!160704 (= lt!253080 ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253082)))))))))))

(assert (=> b!160704 (= lt!253082 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7356 thiss!1602))))))

(declare-fun b!160707 () Bool)

(declare-fun array_inv!3275 (array!7830) Bool)

(assert (=> b!160707 (= e!110307 (array_inv!3275 (buf!3986 thiss!1602)))))

(assert (= (and start!33096 res!133988) b!160704))

(assert (= (and b!160704 (not res!133986)) b!160705))

(assert (= (and b!160704 (not res!133987)) b!160706))

(assert (= start!33096 b!160707))

(declare-fun m!253803 () Bool)

(assert (=> b!160707 m!253803))

(declare-fun m!253805 () Bool)

(assert (=> b!160706 m!253805))

(declare-fun m!253807 () Bool)

(assert (=> b!160706 m!253807))

(declare-fun m!253809 () Bool)

(assert (=> b!160706 m!253809))

(declare-fun m!253811 () Bool)

(assert (=> b!160706 m!253811))

(declare-fun m!253813 () Bool)

(assert (=> b!160706 m!253813))

(declare-fun m!253815 () Bool)

(assert (=> b!160704 m!253815))

(declare-fun m!253817 () Bool)

(assert (=> b!160704 m!253817))

(declare-fun m!253819 () Bool)

(assert (=> start!33096 m!253819))

(declare-fun m!253821 () Bool)

(assert (=> start!33096 m!253821))

(assert (=> b!160705 m!253815))

(assert (=> b!160705 m!253815))

(declare-fun m!253823 () Bool)

(assert (=> b!160705 m!253823))

(push 1)

(assert (not b!160705))

(assert (not b!160706))

(assert (not start!33096))

(assert (not b!160707))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54535 () Bool)

(assert (=> d!54535 (= (byteRangesEq!0 (select (arr!4449 (buf!3986 thiss!1602)) (currentByte!7361 thiss!1602)) lt!253081 #b00000000000000000000000000000000 (currentBit!7356 thiss!1602)) (or (= #b00000000000000000000000000000000 (currentBit!7356 thiss!1602)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4449 (buf!3986 thiss!1602)) (currentByte!7361 thiss!1602))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7356 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!253081) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7356 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13551 () Bool)

(assert (= bs!13551 d!54535))

(declare-fun m!253845 () Bool)

(assert (=> bs!13551 m!253845))

(declare-fun m!253847 () Bool)

(assert (=> bs!13551 m!253847))

(assert (=> b!160705 d!54535))

(declare-fun d!54545 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!54545 (= (inv!12 (BitStream!6225 (array!7831 (store (store (store (arr!4449 (buf!3986 thiss!1602)) (currentByte!7361 thiss!1602) lt!253083) (currentByte!7361 thiss!1602) lt!253081) (bvadd #b00000000000000000000000000000001 (currentByte!7361 thiss!1602)) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4449 (buf!3986 thiss!1602)) (currentByte!7361 thiss!1602) lt!253083) (currentByte!7361 thiss!1602) lt!253081) (bvadd #b00000000000000000000000000000001 (currentByte!7361 thiss!1602)))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot lt!253080)))))) (size!3528 (buf!3986 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7361 thiss!1602)) (currentBit!7356 thiss!1602))) (invariant!0 (currentBit!7356 (BitStream!6225 (array!7831 (store (store (store (arr!4449 (buf!3986 thiss!1602)) (currentByte!7361 thiss!1602) lt!253083) (currentByte!7361 thiss!1602) lt!253081) (bvadd #b00000000000000000000000000000001 (currentByte!7361 thiss!1602)) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4449 (buf!3986 thiss!1602)) (currentByte!7361 thiss!1602) lt!253083) (currentByte!7361 thiss!1602) lt!253081) (bvadd #b00000000000000000000000000000001 (currentByte!7361 thiss!1602)))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot lt!253080)))))) (size!3528 (buf!3986 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7361 thiss!1602)) (currentBit!7356 thiss!1602))) (currentByte!7361 (BitStream!6225 (array!7831 (store (store (store (arr!4449 (buf!3986 thiss!1602)) (currentByte!7361 thiss!1602) lt!253083) (currentByte!7361 thiss!1602) lt!253081) (bvadd #b00000000000000000000000000000001 (currentByte!7361 thiss!1602)) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4449 (buf!3986 thiss!1602)) (currentByte!7361 thiss!1602) lt!253083) (currentByte!7361 thiss!1602) lt!253081) (bvadd #b00000000000000000000000000000001 (currentByte!7361 thiss!1602)))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot lt!253080)))))) (size!3528 (buf!3986 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7361 thiss!1602)) (currentBit!7356 thiss!1602))) (size!3528 (buf!3986 (BitStream!6225 (array!7831 (store (store (store (arr!4449 (buf!3986 thiss!1602)) (currentByte!7361 thiss!1602) lt!253083) (currentByte!7361 thiss!1602) lt!253081) (bvadd #b00000000000000000000000000000001 (currentByte!7361 thiss!1602)) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4449 (buf!3986 thiss!1602)) (currentByte!7361 thiss!1602) lt!253083) (currentByte!7361 thiss!1602) lt!253081) (bvadd #b00000000000000000000000000000001 (currentByte!7361 thiss!1602)))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot lt!253080)))))) (size!3528 (buf!3986 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7361 thiss!1602)) (currentBit!7356 thiss!1602))))))))

(declare-fun bs!13552 () Bool)

(assert (= bs!13552 d!54545))

(declare-fun m!253849 () Bool)

(assert (=> bs!13552 m!253849))

(assert (=> b!160706 d!54545))

(declare-fun d!54547 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!54547 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3528 (buf!3986 thiss!1602))) ((_ sign_extend 32) (currentByte!7361 thiss!1602)) ((_ sign_extend 32) (currentBit!7356 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3528 (buf!3986 thiss!1602))) ((_ sign_extend 32) (currentByte!7361 thiss!1602)) ((_ sign_extend 32) (currentBit!7356 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13553 () Bool)

(assert (= bs!13553 d!54547))

(declare-fun m!253851 () Bool)

(assert (=> bs!13553 m!253851))

(assert (=> start!33096 d!54547))

(declare-fun d!54549 () Bool)

(assert (=> d!54549 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7356 thiss!1602) (currentByte!7361 thiss!1602) (size!3528 (buf!3986 thiss!1602))))))

(declare-fun bs!13554 () Bool)

(assert (= bs!13554 d!54549))

(declare-fun m!253853 () Bool)

(assert (=> bs!13554 m!253853))

(assert (=> start!33096 d!54549))

(declare-fun d!54551 () Bool)

(assert (=> d!54551 (= (array_inv!3275 (buf!3986 thiss!1602)) (bvsge (size!3528 (buf!3986 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!160707 d!54551))

(push 1)

(assert (not d!54549))

(assert (not d!54547))

(assert (not d!54545))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54565 () Bool)

(assert (=> d!54565 (= (invariant!0 (currentBit!7356 thiss!1602) (currentByte!7361 thiss!1602) (size!3528 (buf!3986 thiss!1602))) (and (bvsge (currentBit!7356 thiss!1602) #b00000000000000000000000000000000) (bvslt (currentBit!7356 thiss!1602) #b00000000000000000000000000001000) (bvsge (currentByte!7361 thiss!1602) #b00000000000000000000000000000000) (or (bvslt (currentByte!7361 thiss!1602) (size!3528 (buf!3986 thiss!1602))) (and (= (currentBit!7356 thiss!1602) #b00000000000000000000000000000000) (= (currentByte!7361 thiss!1602) (size!3528 (buf!3986 thiss!1602)))))))))

(assert (=> d!54549 d!54565))

(declare-fun d!54567 () Bool)

(assert (=> d!54567 (= (remainingBits!0 ((_ sign_extend 32) (size!3528 (buf!3986 thiss!1602))) ((_ sign_extend 32) (currentByte!7361 thiss!1602)) ((_ sign_extend 32) (currentBit!7356 thiss!1602))) (bvsub (bvmul ((_ sign_extend 32) (size!3528 (buf!3986 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7361 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7356 thiss!1602)))))))

(assert (=> d!54547 d!54567))

(declare-fun d!54569 () Bool)

(assert (=> d!54569 (= (invariant!0 (currentBit!7356 (BitStream!6225 (array!7831 (store (store (store (arr!4449 (buf!3986 thiss!1602)) (currentByte!7361 thiss!1602) lt!253083) (currentByte!7361 thiss!1602) lt!253081) (bvadd #b00000000000000000000000000000001 (currentByte!7361 thiss!1602)) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4449 (buf!3986 thiss!1602)) (currentByte!7361 thiss!1602) lt!253083) (currentByte!7361 thiss!1602) lt!253081) (bvadd #b00000000000000000000000000000001 (currentByte!7361 thiss!1602)))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot lt!253080)))))) (size!3528 (buf!3986 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7361 thiss!1602)) (currentBit!7356 thiss!1602))) (currentByte!7361 (BitStream!6225 (array!7831 (store (store (store (arr!4449 (buf!3986 thiss!1602)) (currentByte!7361 thiss!1602) lt!253083) (currentByte!7361 thiss!1602) lt!253081) (bvadd #b00000000000000000000000000000001 (currentByte!7361 thiss!1602)) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4449 (buf!3986 thiss!1602)) (currentByte!7361 thiss!1602) lt!253083) (currentByte!7361 thiss!1602) lt!253081) (bvadd #b00000000000000000000000000000001 (currentByte!7361 thiss!1602)))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot lt!253080)))))) (size!3528 (buf!3986 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7361 thiss!1602)) (currentBit!7356 thiss!1602))) (size!3528 (buf!3986 (BitStream!6225 (array!7831 (store (store (store (arr!4449 (buf!3986 thiss!1602)) (currentByte!7361 thiss!1602) lt!253083) (currentByte!7361 thiss!1602) lt!253081) (bvadd #b00000000000000000000000000000001 (currentByte!7361 thiss!1602)) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4449 (buf!3986 thiss!1602)) (currentByte!7361 thiss!1602) lt!253083) (currentByte!7361 thiss!1602) lt!253081) (bvadd #b00000000000000000000000000000001 (currentByte!7361 thiss!1602)))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot lt!253080)))))) (size!3528 (buf!3986 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7361 thiss!1602)) (currentBit!7356 thiss!1602))))) (and (bvsge (currentBit!7356 (BitStream!6225 (array!7831 (store (store (store (arr!4449 (buf!3986 thiss!1602)) (currentByte!7361 thiss!1602) lt!253083) (currentByte!7361 thiss!1602) lt!253081) (bvadd #b00000000000000000000000000000001 (currentByte!7361 thiss!1602)) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4449 (buf!3986 thiss!1602)) (currentByte!7361 thiss!1602) lt!253083) (currentByte!7361 thiss!1602) lt!253081) (bvadd #b00000000000000000000000000000001 (currentByte!7361 thiss!1602)))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot lt!253080)))))) (size!3528 (buf!3986 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7361 thiss!1602)) (currentBit!7356 thiss!1602))) #b00000000000000000000000000000000) (bvslt (currentBit!7356 (BitStream!6225 (array!7831 (store (store (store (arr!4449 (buf!3986 thiss!1602)) (currentByte!7361 thiss!1602) lt!253083) (currentByte!7361 thiss!1602) lt!253081) (bvadd #b00000000000000000000000000000001 (currentByte!7361 thiss!1602)) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4449 (buf!3986 thiss!1602)) (currentByte!7361 thiss!1602) lt!253083) (currentByte!7361 thiss!1602) lt!253081) (bvadd #b00000000000000000000000000000001 (currentByte!7361 thiss!1602)))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot lt!253080)))))) (size!3528 (buf!3986 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7361 thiss!1602)) (currentBit!7356 thiss!1602))) #b00000000000000000000000000001000) (bvsge (currentByte!7361 (BitStream!6225 (array!7831 (store (store (store (arr!4449 (buf!3986 thiss!1602)) (currentByte!7361 thiss!1602) lt!253083) (currentByte!7361 thiss!1602) lt!253081) (bvadd #b00000000000000000000000000000001 (currentByte!7361 thiss!1602)) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4449 (buf!3986 thiss!1602)) (currentByte!7361 thiss!1602) lt!253083) (currentByte!7361 thiss!1602) lt!253081) (bvadd #b00000000000000000000000000000001 (currentByte!7361 thiss!1602)))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot lt!253080)))))) (size!3528 (buf!3986 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7361 thiss!1602)) (currentBit!7356 thiss!1602))) #b00000000000000000000000000000000) (or (bvslt (currentByte!7361 (BitStream!6225 (array!7831 (store (store (store (arr!4449 (buf!3986 thiss!1602)) (currentByte!7361 thiss!1602) lt!253083) (currentByte!7361 thiss!1602) lt!253081) (bvadd #b00000000000000000000000000000001 (currentByte!7361 thiss!1602)) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4449 (buf!3986 thiss!1602)) (currentByte!7361 thiss!1602) lt!253083) (currentByte!7361 thiss!1602) lt!253081) (bvadd #b00000000000000000000000000000001 (currentByte!7361 thiss!1602)))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot lt!253080)))))) (size!3528 (buf!3986 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7361 thiss!1602)) (currentBit!7356 thiss!1602))) (size!3528 (buf!3986 (BitStream!6225 (array!7831 (store (store (store (arr!4449 (buf!3986 thiss!1602)) (currentByte!7361 thiss!1602) lt!253083) (currentByte!7361 thiss!1602) lt!253081) (bvadd #b00000000000000000000000000000001 (currentByte!7361 thiss!1602)) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4449 (buf!3986 thiss!1602)) (currentByte!7361 thiss!1602) lt!253083) (currentByte!7361 thiss!1602) lt!253081) (bvadd #b00000000000000000000000000000001 (currentByte!7361 thiss!1602)))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot lt!253080)))))) (size!3528 (buf!3986 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7361 thiss!1602)) (currentBit!7356 thiss!1602))))) (and (= (currentBit!7356 (BitStream!6225 (array!7831 (store (store (store (arr!4449 (buf!3986 thiss!1602)) (currentByte!7361 thiss!1602) lt!253083) (currentByte!7361 thiss!1602) lt!253081) (bvadd #b00000000000000000000000000000001 (currentByte!7361 thiss!1602)) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4449 (buf!3986 thiss!1602)) (currentByte!7361 thiss!1602) lt!253083) (currentByte!7361 thiss!1602) lt!253081) (bvadd #b00000000000000000000000000000001 (currentByte!7361 thiss!1602)))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot lt!253080)))))) (size!3528 (buf!3986 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7361 thiss!1602)) (currentBit!7356 thiss!1602))) #b00000000000000000000000000000000) (= (currentByte!7361 (BitStream!6225 (array!7831 (store (store (store (arr!4449 (buf!3986 thiss!1602)) (currentByte!7361 thiss!1602) lt!253083) (currentByte!7361 thiss!1602) lt!253081) (bvadd #b00000000000000000000000000000001 (currentByte!7361 thiss!1602)) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4449 (buf!3986 thiss!1602)) (currentByte!7361 thiss!1602) lt!253083) (currentByte!7361 thiss!1602) lt!253081) (bvadd #b00000000000000000000000000000001 (currentByte!7361 thiss!1602)))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot lt!253080)))))) (size!3528 (buf!3986 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7361 thiss!1602)) (currentBit!7356 thiss!1602))) (size!3528 (buf!3986 (BitStream!6225 (array!7831 (store (store (store (arr!4449 (buf!3986 thiss!1602)) (currentByte!7361 thiss!1602) lt!253083) (currentByte!7361 thiss!1602) lt!253081) (bvadd #b00000000000000000000000000000001 (currentByte!7361 thiss!1602)) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4449 (buf!3986 thiss!1602)) (currentByte!7361 thiss!1602) lt!253083) (currentByte!7361 thiss!1602) lt!253081) (bvadd #b00000000000000000000000000000001 (currentByte!7361 thiss!1602)))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot lt!253080)))))) (size!3528 (buf!3986 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7361 thiss!1602)) (currentBit!7356 thiss!1602)))))))))))

(assert (=> d!54545 d!54569))

(push 1)

(check-sat)

(pop 1)

