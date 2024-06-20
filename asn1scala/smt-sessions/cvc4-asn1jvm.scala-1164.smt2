; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32918 () Bool)

(assert start!32918)

(declare-fun res!133880 () Bool)

(declare-fun e!110073 () Bool)

(assert (=> start!32918 (=> (not res!133880) (not e!110073))))

(declare-datatypes ((array!7773 0))(
  ( (array!7774 (arr!4428 (Array (_ BitVec 32) (_ BitVec 8))) (size!3507 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6182 0))(
  ( (BitStream!6183 (buf!3965 array!7773) (currentByte!7305 (_ BitVec 32)) (currentBit!7300 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6182)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32918 (= res!133880 (validate_offset_byte!0 ((_ sign_extend 32) (size!3507 (buf!3965 thiss!1602))) ((_ sign_extend 32) (currentByte!7305 thiss!1602)) ((_ sign_extend 32) (currentBit!7300 thiss!1602))))))

(assert (=> start!32918 e!110073))

(declare-fun e!110072 () Bool)

(declare-fun inv!12 (BitStream!6182) Bool)

(assert (=> start!32918 (and (inv!12 thiss!1602) e!110072)))

(assert (=> start!32918 true))

(declare-fun b!160535 () Bool)

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!253001 () (_ BitVec 8))

(declare-fun lt!253002 () (_ BitVec 32))

(assert (=> b!160535 (= e!110073 (not (inv!12 (BitStream!6183 (array!7774 (store (store (arr!4428 (buf!3965 thiss!1602)) (currentByte!7305 thiss!1602) lt!253001) (currentByte!7305 thiss!1602) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253001) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253002)))) (size!3507 (buf!3965 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7305 thiss!1602)) (currentBit!7300 thiss!1602)))))))

(assert (=> b!160535 (= lt!253001 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4428 (buf!3965 thiss!1602)) (currentByte!7305 thiss!1602))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253002)))))))))))))

(assert (=> b!160535 (= lt!253002 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7300 thiss!1602))))))

(declare-fun b!160536 () Bool)

(declare-fun array_inv!3254 (array!7773) Bool)

(assert (=> b!160536 (= e!110072 (array_inv!3254 (buf!3965 thiss!1602)))))

(assert (= (and start!32918 res!133880) b!160535))

(assert (= start!32918 b!160536))

(declare-fun m!253503 () Bool)

(assert (=> start!32918 m!253503))

(declare-fun m!253505 () Bool)

(assert (=> start!32918 m!253505))

(declare-fun m!253507 () Bool)

(assert (=> b!160535 m!253507))

(declare-fun m!253509 () Bool)

(assert (=> b!160535 m!253509))

(declare-fun m!253511 () Bool)

(assert (=> b!160535 m!253511))

(declare-fun m!253513 () Bool)

(assert (=> b!160535 m!253513))

(declare-fun m!253515 () Bool)

(assert (=> b!160535 m!253515))

(declare-fun m!253517 () Bool)

(assert (=> b!160536 m!253517))

(push 1)

(assert (not start!32918))

(assert (not b!160535))

(assert (not b!160536))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54377 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!54377 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3507 (buf!3965 thiss!1602))) ((_ sign_extend 32) (currentByte!7305 thiss!1602)) ((_ sign_extend 32) (currentBit!7300 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3507 (buf!3965 thiss!1602))) ((_ sign_extend 32) (currentByte!7305 thiss!1602)) ((_ sign_extend 32) (currentBit!7300 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13492 () Bool)

(assert (= bs!13492 d!54377))

(declare-fun m!253531 () Bool)

(assert (=> bs!13492 m!253531))

(assert (=> start!32918 d!54377))

(declare-fun d!54379 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!54379 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7300 thiss!1602) (currentByte!7305 thiss!1602) (size!3507 (buf!3965 thiss!1602))))))

(declare-fun bs!13493 () Bool)

(assert (= bs!13493 d!54379))

(declare-fun m!253533 () Bool)

(assert (=> bs!13493 m!253533))

(assert (=> start!32918 d!54379))

(declare-fun d!54381 () Bool)

(assert (=> d!54381 (= (inv!12 (BitStream!6183 (array!7774 (store (store (arr!4428 (buf!3965 thiss!1602)) (currentByte!7305 thiss!1602) lt!253001) (currentByte!7305 thiss!1602) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253001) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253002)))) (size!3507 (buf!3965 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7305 thiss!1602)) (currentBit!7300 thiss!1602))) (invariant!0 (currentBit!7300 (BitStream!6183 (array!7774 (store (store (arr!4428 (buf!3965 thiss!1602)) (currentByte!7305 thiss!1602) lt!253001) (currentByte!7305 thiss!1602) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253001) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253002)))) (size!3507 (buf!3965 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7305 thiss!1602)) (currentBit!7300 thiss!1602))) (currentByte!7305 (BitStream!6183 (array!7774 (store (store (arr!4428 (buf!3965 thiss!1602)) (currentByte!7305 thiss!1602) lt!253001) (currentByte!7305 thiss!1602) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253001) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253002)))) (size!3507 (buf!3965 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7305 thiss!1602)) (currentBit!7300 thiss!1602))) (size!3507 (buf!3965 (BitStream!6183 (array!7774 (store (store (arr!4428 (buf!3965 thiss!1602)) (currentByte!7305 thiss!1602) lt!253001) (currentByte!7305 thiss!1602) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253001) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253002)))) (size!3507 (buf!3965 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7305 thiss!1602)) (currentBit!7300 thiss!1602))))))))

(declare-fun bs!13494 () Bool)

(assert (= bs!13494 d!54381))

(declare-fun m!253535 () Bool)

(assert (=> bs!13494 m!253535))

(assert (=> b!160535 d!54381))

(declare-fun d!54383 () Bool)

(assert (=> d!54383 (= (array_inv!3254 (buf!3965 thiss!1602)) (bvsge (size!3507 (buf!3965 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!160536 d!54383))

(push 1)

(assert (not d!54379))

(assert (not d!54377))

(assert (not d!54381))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54397 () Bool)

(assert (=> d!54397 (= (invariant!0 (currentBit!7300 thiss!1602) (currentByte!7305 thiss!1602) (size!3507 (buf!3965 thiss!1602))) (and (bvsge (currentBit!7300 thiss!1602) #b00000000000000000000000000000000) (bvslt (currentBit!7300 thiss!1602) #b00000000000000000000000000001000) (bvsge (currentByte!7305 thiss!1602) #b00000000000000000000000000000000) (or (bvslt (currentByte!7305 thiss!1602) (size!3507 (buf!3965 thiss!1602))) (and (= (currentBit!7300 thiss!1602) #b00000000000000000000000000000000) (= (currentByte!7305 thiss!1602) (size!3507 (buf!3965 thiss!1602)))))))))

(assert (=> d!54379 d!54397))

(declare-fun d!54399 () Bool)

(assert (=> d!54399 (= (remainingBits!0 ((_ sign_extend 32) (size!3507 (buf!3965 thiss!1602))) ((_ sign_extend 32) (currentByte!7305 thiss!1602)) ((_ sign_extend 32) (currentBit!7300 thiss!1602))) (bvsub (bvmul ((_ sign_extend 32) (size!3507 (buf!3965 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7305 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7300 thiss!1602)))))))

(assert (=> d!54377 d!54399))

(declare-fun d!54401 () Bool)

(assert (=> d!54401 (= (invariant!0 (currentBit!7300 (BitStream!6183 (array!7774 (store (store (arr!4428 (buf!3965 thiss!1602)) (currentByte!7305 thiss!1602) lt!253001) (currentByte!7305 thiss!1602) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253001) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253002)))) (size!3507 (buf!3965 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7305 thiss!1602)) (currentBit!7300 thiss!1602))) (currentByte!7305 (BitStream!6183 (array!7774 (store (store (arr!4428 (buf!3965 thiss!1602)) (currentByte!7305 thiss!1602) lt!253001) (currentByte!7305 thiss!1602) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253001) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253002)))) (size!3507 (buf!3965 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7305 thiss!1602)) (currentBit!7300 thiss!1602))) (size!3507 (buf!3965 (BitStream!6183 (array!7774 (store (store (arr!4428 (buf!3965 thiss!1602)) (currentByte!7305 thiss!1602) lt!253001) (currentByte!7305 thiss!1602) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253001) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253002)))) (size!3507 (buf!3965 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7305 thiss!1602)) (currentBit!7300 thiss!1602))))) (and (bvsge (currentBit!7300 (BitStream!6183 (array!7774 (store (store (arr!4428 (buf!3965 thiss!1602)) (currentByte!7305 thiss!1602) lt!253001) (currentByte!7305 thiss!1602) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253001) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253002)))) (size!3507 (buf!3965 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7305 thiss!1602)) (currentBit!7300 thiss!1602))) #b00000000000000000000000000000000) (bvslt (currentBit!7300 (BitStream!6183 (array!7774 (store (store (arr!4428 (buf!3965 thiss!1602)) (currentByte!7305 thiss!1602) lt!253001) (currentByte!7305 thiss!1602) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253001) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253002)))) (size!3507 (buf!3965 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7305 thiss!1602)) (currentBit!7300 thiss!1602))) #b00000000000000000000000000001000) (bvsge (currentByte!7305 (BitStream!6183 (array!7774 (store (store (arr!4428 (buf!3965 thiss!1602)) (currentByte!7305 thiss!1602) lt!253001) (currentByte!7305 thiss!1602) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253001) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253002)))) (size!3507 (buf!3965 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7305 thiss!1602)) (currentBit!7300 thiss!1602))) #b00000000000000000000000000000000) (or (bvslt (currentByte!7305 (BitStream!6183 (array!7774 (store (store (arr!4428 (buf!3965 thiss!1602)) (currentByte!7305 thiss!1602) lt!253001) (currentByte!7305 thiss!1602) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253001) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253002)))) (size!3507 (buf!3965 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7305 thiss!1602)) (currentBit!7300 thiss!1602))) (size!3507 (buf!3965 (BitStream!6183 (array!7774 (store (store (arr!4428 (buf!3965 thiss!1602)) (currentByte!7305 thiss!1602) lt!253001) (currentByte!7305 thiss!1602) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253001) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253002)))) (size!3507 (buf!3965 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7305 thiss!1602)) (currentBit!7300 thiss!1602))))) (and (= (currentBit!7300 (BitStream!6183 (array!7774 (store (store (arr!4428 (buf!3965 thiss!1602)) (currentByte!7305 thiss!1602) lt!253001) (currentByte!7305 thiss!1602) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253001) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253002)))) (size!3507 (buf!3965 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7305 thiss!1602)) (currentBit!7300 thiss!1602))) #b00000000000000000000000000000000) (= (currentByte!7305 (BitStream!6183 (array!7774 (store (store (arr!4428 (buf!3965 thiss!1602)) (currentByte!7305 thiss!1602) lt!253001) (currentByte!7305 thiss!1602) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253001) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253002)))) (size!3507 (buf!3965 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7305 thiss!1602)) (currentBit!7300 thiss!1602))) (size!3507 (buf!3965 (BitStream!6183 (array!7774 (store (store (arr!4428 (buf!3965 thiss!1602)) (currentByte!7305 thiss!1602) lt!253001) (currentByte!7305 thiss!1602) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253001) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253002)))) (size!3507 (buf!3965 thiss!1602))) (bvadd #b00000000000000000000000000000001 (currentByte!7305 thiss!1602)) (currentBit!7300 thiss!1602)))))))))))

(assert (=> d!54381 d!54401))

(push 1)

(check-sat)

(pop 1)

