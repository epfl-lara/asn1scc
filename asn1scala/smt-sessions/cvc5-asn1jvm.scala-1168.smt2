; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33050 () Bool)

(assert start!33050)

(declare-fun res!133913 () Bool)

(declare-fun e!110165 () Bool)

(assert (=> start!33050 (=> (not res!133913) (not e!110165))))

(declare-datatypes ((array!7805 0))(
  ( (array!7806 (arr!4438 (Array (_ BitVec 32) (_ BitVec 8))) (size!3517 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6202 0))(
  ( (BitStream!6203 (buf!3975 array!7805) (currentByte!7347 (_ BitVec 32)) (currentBit!7342 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6202)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33050 (= res!133913 (validate_offset_byte!0 ((_ sign_extend 32) (size!3517 (buf!3975 thiss!1602))) ((_ sign_extend 32) (currentByte!7347 thiss!1602)) ((_ sign_extend 32) (currentBit!7342 thiss!1602))))))

(assert (=> start!33050 e!110165))

(declare-fun e!110163 () Bool)

(declare-fun inv!12 (BitStream!6202) Bool)

(assert (=> start!33050 (and (inv!12 thiss!1602) e!110163)))

(assert (=> start!33050 true))

(declare-fun b!160597 () Bool)

(declare-fun e!110164 () Bool)

(assert (=> b!160597 (= e!110165 e!110164)))

(declare-fun res!133912 () Bool)

(assert (=> b!160597 (=> (not res!133912) (not e!110164))))

(assert (=> b!160597 (= res!133912 (bvslt (currentByte!7347 thiss!1602) (size!3517 (buf!3975 thiss!1602))))))

(declare-fun lt!253005 () (_ BitVec 32))

(assert (=> b!160597 (= lt!253005 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7342 thiss!1602))))))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun b!160598 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!160598 (= e!110164 (not (byteRangesEq!0 (select (arr!4438 (buf!3975 thiss!1602)) (currentByte!7347 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4438 (buf!3975 thiss!1602)) (currentByte!7347 thiss!1602))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253005))))))))))) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253005))) #b00000000000000000000000000000000 (currentBit!7342 thiss!1602))))))

(declare-fun b!160599 () Bool)

(declare-fun array_inv!3264 (array!7805) Bool)

(assert (=> b!160599 (= e!110163 (array_inv!3264 (buf!3975 thiss!1602)))))

(assert (= (and start!33050 res!133913) b!160597))

(assert (= (and b!160597 res!133912) b!160598))

(assert (= start!33050 b!160599))

(declare-fun m!253627 () Bool)

(assert (=> start!33050 m!253627))

(declare-fun m!253629 () Bool)

(assert (=> start!33050 m!253629))

(declare-fun m!253631 () Bool)

(assert (=> b!160598 m!253631))

(declare-fun m!253633 () Bool)

(assert (=> b!160598 m!253633))

(assert (=> b!160598 m!253631))

(declare-fun m!253635 () Bool)

(assert (=> b!160598 m!253635))

(declare-fun m!253637 () Bool)

(assert (=> b!160599 m!253637))

(push 1)

(assert (not start!33050))

(assert (not b!160598))

(assert (not b!160599))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54499 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!54499 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3517 (buf!3975 thiss!1602))) ((_ sign_extend 32) (currentByte!7347 thiss!1602)) ((_ sign_extend 32) (currentBit!7342 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3517 (buf!3975 thiss!1602))) ((_ sign_extend 32) (currentByte!7347 thiss!1602)) ((_ sign_extend 32) (currentBit!7342 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13527 () Bool)

(assert (= bs!13527 d!54499))

(declare-fun m!253667 () Bool)

(assert (=> bs!13527 m!253667))

(assert (=> start!33050 d!54499))

(declare-fun d!54501 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!54501 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7342 thiss!1602) (currentByte!7347 thiss!1602) (size!3517 (buf!3975 thiss!1602))))))

(declare-fun bs!13528 () Bool)

(assert (= bs!13528 d!54501))

(declare-fun m!253669 () Bool)

(assert (=> bs!13528 m!253669))

(assert (=> start!33050 d!54501))

(declare-fun d!54503 () Bool)

(assert (=> d!54503 (= (byteRangesEq!0 (select (arr!4438 (buf!3975 thiss!1602)) (currentByte!7347 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4438 (buf!3975 thiss!1602)) (currentByte!7347 thiss!1602))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253005))))))))))) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253005))) #b00000000000000000000000000000000 (currentBit!7342 thiss!1602)) (or (= #b00000000000000000000000000000000 (currentBit!7342 thiss!1602)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4438 (buf!3975 thiss!1602)) (currentByte!7347 thiss!1602))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7342 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4438 (buf!3975 thiss!1602)) (currentByte!7347 thiss!1602))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253005))))))))))) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253005)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7342 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13530 () Bool)

(assert (= bs!13530 d!54503))

(declare-fun m!253675 () Bool)

(assert (=> bs!13530 m!253675))

(declare-fun m!253677 () Bool)

(assert (=> bs!13530 m!253677))

(assert (=> b!160598 d!54503))

(declare-fun d!54507 () Bool)

(assert (=> d!54507 (= (array_inv!3264 (buf!3975 thiss!1602)) (bvsge (size!3517 (buf!3975 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!160599 d!54507))

(push 1)

(assert (not d!54501))

(assert (not d!54499))

(check-sat)

(pop 1)

(push 1)

(check-sat)

