; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36778 () Bool)

(assert start!36778)

(declare-fun b!168487 () Bool)

(declare-fun res!140216 () Bool)

(declare-fun e!117062 () Bool)

(assert (=> b!168487 (=> (not res!140216) (not e!117062))))

(declare-datatypes ((array!8766 0))(
  ( (array!8767 (arr!4810 (Array (_ BitVec 32) (_ BitVec 8))) (size!3889 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6934 0))(
  ( (BitStream!6935 (buf!4341 array!8766) (currentByte!8229 (_ BitVec 32)) (currentBit!8224 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!11735 0))(
  ( (Unit!11736) )
))
(declare-datatypes ((tuple3!960 0))(
  ( (tuple3!961 (_1!7927 Unit!11735) (_2!7927 (_ BitVec 8)) (_3!606 BitStream!6934)) )
))
(declare-fun e!117060 () tuple3!960)

(declare-fun thiss!1894 () BitStream!6934)

(assert (=> b!168487 (= res!140216 (= (buf!4341 (_3!606 e!117060)) (buf!4341 thiss!1894)))))

(declare-fun c!8699 () Bool)

(declare-fun nBits!600 () (_ BitVec 32))

(assert (=> b!168487 (= c!8699 (bvsle (bvadd (currentBit!8224 thiss!1894) nBits!600) #b00000000000000000000000000001000))))

(declare-fun b!168488 () Bool)

(declare-datatypes ((tuple2!14642 0))(
  ( (tuple2!14643 (_1!7928 Unit!11735) (_2!7928 BitStream!6934)) )
))
(declare-fun lt!261820 () tuple2!14642)

(assert (=> b!168488 (= e!117060 (tuple3!961 (_1!7928 lt!261820) ((_ extract 7 0) (bvand (bvlshr ((_ sign_extend 24) (select (arr!4810 (buf!4341 thiss!1894)) (currentByte!8229 thiss!1894))) (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!8224 thiss!1894) nBits!600))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!600)))) (_2!7928 lt!261820)))))

(declare-fun moveBitIndex!0 (BitStream!6934 (_ BitVec 64)) tuple2!14642)

(assert (=> b!168488 (= lt!261820 (moveBitIndex!0 thiss!1894 ((_ sign_extend 32) nBits!600)))))

(declare-fun res!140215 () Bool)

(assert (=> start!36778 (=> (not res!140215) (not e!117062))))

(assert (=> start!36778 (= res!140215 (and (bvsge nBits!600 #b00000000000000000000000000000001) (bvslt nBits!600 #b00000000000000000000000000001000)))))

(assert (=> start!36778 e!117062))

(assert (=> start!36778 true))

(declare-fun e!117063 () Bool)

(declare-fun inv!12 (BitStream!6934) Bool)

(assert (=> start!36778 (and (inv!12 thiss!1894) e!117063)))

(declare-fun b!168489 () Bool)

(declare-fun res!140214 () Bool)

(assert (=> b!168489 (=> (not res!140214) (not e!117062))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!168489 (= res!140214 (validate_offset_bits!1 ((_ sign_extend 32) (size!3889 (buf!4341 thiss!1894))) ((_ sign_extend 32) (currentByte!8229 thiss!1894)) ((_ sign_extend 32) (currentBit!8224 thiss!1894)) ((_ sign_extend 32) nBits!600)))))

(declare-fun b!168490 () Bool)

(declare-fun array_inv!3630 (array!8766) Bool)

(assert (=> b!168490 (= e!117063 (array_inv!3630 (buf!4341 thiss!1894)))))

(declare-fun b!168491 () Bool)

(declare-fun lt!261819 () (_ BitVec 32))

(declare-fun Unit!11737 () Unit!11735)

(assert (=> b!168491 (= e!117060 (tuple3!961 Unit!11737 ((_ extract 7 0) (bvand ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4810 (buf!4341 thiss!1894)) (currentByte!8229 thiss!1894))) lt!261819))) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4810 (buf!4341 thiss!1894)) (bvadd #b00000000000000000000000000000001 (currentByte!8229 thiss!1894)))) #b00000000000000000000000011111111) (bvsub #b00000000000000000000000000001000 lt!261819))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!600)))) (BitStream!6935 (buf!4341 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8229 thiss!1894)) lt!261819)))))

(assert (=> b!168491 (= lt!261819 (bvsub (bvadd (currentBit!8224 thiss!1894) nBits!600) #b00000000000000000000000000001000))))

(declare-fun b!168492 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!168492 (= e!117062 (not (invariant!0 (currentBit!8224 thiss!1894) (currentByte!8229 thiss!1894) (size!3889 (buf!4341 thiss!1894)))))))

(assert (= (and start!36778 res!140215) b!168489))

(assert (= (and b!168489 res!140214) b!168487))

(assert (= (and b!168487 c!8699) b!168488))

(assert (= (and b!168487 (not c!8699)) b!168491))

(assert (= (and b!168487 res!140216) b!168492))

(assert (= start!36778 b!168490))

(declare-fun m!268071 () Bool)

(assert (=> b!168488 m!268071))

(declare-fun m!268073 () Bool)

(assert (=> b!168488 m!268073))

(declare-fun m!268075 () Bool)

(assert (=> b!168488 m!268075))

(declare-fun m!268077 () Bool)

(assert (=> b!168492 m!268077))

(declare-fun m!268079 () Bool)

(assert (=> b!168490 m!268079))

(declare-fun m!268081 () Bool)

(assert (=> start!36778 m!268081))

(assert (=> b!168491 m!268071))

(declare-fun m!268083 () Bool)

(assert (=> b!168491 m!268083))

(assert (=> b!168491 m!268073))

(declare-fun m!268085 () Bool)

(assert (=> b!168489 m!268085))

(push 1)

(assert (not b!168490))

(assert (not b!168492))

(assert (not b!168488))

(assert (not start!36778))

(assert (not b!168489))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!59367 () Bool)

(declare-fun lt!261868 () (_ BitVec 32))

(assert (=> d!59367 (= lt!261868 ((_ extract 31 0) (bvsrem ((_ sign_extend 32) nBits!600) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!261864 () (_ BitVec 32))

(assert (=> d!59367 (= lt!261864 ((_ extract 31 0) (bvsdiv ((_ sign_extend 32) nBits!600) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!117098 () Bool)

(assert (=> d!59367 e!117098))

(declare-fun res!140245 () Bool)

(assert (=> d!59367 (=> (not res!140245) (not e!117098))))

(declare-fun moveBitIndexPrecond!0 (BitStream!6934 (_ BitVec 64)) Bool)

(assert (=> d!59367 (= res!140245 (moveBitIndexPrecond!0 thiss!1894 ((_ sign_extend 32) nBits!600)))))

(declare-fun Unit!11747 () Unit!11735)

(declare-fun Unit!11748 () Unit!11735)

(declare-fun Unit!11749 () Unit!11735)

(assert (=> d!59367 (= (moveBitIndex!0 thiss!1894 ((_ sign_extend 32) nBits!600)) (ite (bvslt (bvadd (currentBit!8224 thiss!1894) lt!261868) #b00000000000000000000000000000000) (tuple2!14643 Unit!11747 (BitStream!6935 (buf!4341 thiss!1894) (bvsub (bvadd (currentByte!8229 thiss!1894) lt!261864) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!261868 (currentBit!8224 thiss!1894)))) (ite (bvsge (bvadd (currentBit!8224 thiss!1894) lt!261868) #b00000000000000000000000000001000) (tuple2!14643 Unit!11748 (BitStream!6935 (buf!4341 thiss!1894) (bvadd (currentByte!8229 thiss!1894) lt!261864 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!8224 thiss!1894) lt!261868) #b00000000000000000000000000001000))) (tuple2!14643 Unit!11749 (BitStream!6935 (buf!4341 thiss!1894) (bvadd (currentByte!8229 thiss!1894) lt!261864) (bvadd (currentBit!8224 thiss!1894) lt!261868))))))))

(declare-fun b!168539 () Bool)

(declare-fun e!117099 () Bool)

(assert (=> b!168539 (= e!117098 e!117099)))

(declare-fun res!140246 () Bool)

(assert (=> b!168539 (=> (not res!140246) (not e!117099))))

(declare-fun lt!261863 () (_ BitVec 64))

(declare-fun lt!261866 () tuple2!14642)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!168539 (= res!140246 (= (bvadd lt!261863 ((_ sign_extend 32) nBits!600)) (bitIndex!0 (size!3889 (buf!4341 (_2!7928 lt!261866))) (currentByte!8229 (_2!7928 lt!261866)) (currentBit!8224 (_2!7928 lt!261866)))))))

(assert (=> b!168539 (or (not (= (bvand lt!261863 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand ((_ sign_extend 32) nBits!600) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!261863 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!261863 ((_ sign_extend 32) nBits!600)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!168539 (= lt!261863 (bitIndex!0 (size!3889 (buf!4341 thiss!1894)) (currentByte!8229 thiss!1894) (currentBit!8224 thiss!1894)))))

(declare-fun lt!261865 () (_ BitVec 32))

(declare-fun lt!261867 () (_ BitVec 32))

(declare-fun Unit!11753 () Unit!11735)

(declare-fun Unit!11754 () Unit!11735)

(declare-fun Unit!11755 () Unit!11735)

(assert (=> b!168539 (= lt!261866 (ite (bvslt (bvadd (currentBit!8224 thiss!1894) lt!261867) #b00000000000000000000000000000000) (tuple2!14643 Unit!11753 (BitStream!6935 (buf!4341 thiss!1894) (bvsub (bvadd (currentByte!8229 thiss!1894) lt!261865) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!261867 (currentBit!8224 thiss!1894)))) (ite (bvsge (bvadd (currentBit!8224 thiss!1894) lt!261867) #b00000000000000000000000000001000) (tuple2!14643 Unit!11754 (BitStream!6935 (buf!4341 thiss!1894) (bvadd (currentByte!8229 thiss!1894) lt!261865 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!8224 thiss!1894) lt!261867) #b00000000000000000000000000001000))) (tuple2!14643 Unit!11755 (BitStream!6935 (buf!4341 thiss!1894) (bvadd (currentByte!8229 thiss!1894) lt!261865) (bvadd (currentBit!8224 thiss!1894) lt!261867))))))))

(assert (=> b!168539 (= lt!261867 ((_ extract 31 0) (bvsrem ((_ sign_extend 32) nBits!600) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!168539 (= lt!261865 ((_ extract 31 0) (bvsdiv ((_ sign_extend 32) nBits!600) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!168540 () Bool)

(assert (=> b!168540 (= e!117099 (and (= (size!3889 (buf!4341 thiss!1894)) (size!3889 (buf!4341 (_2!7928 lt!261866)))) (= (buf!4341 thiss!1894) (buf!4341 (_2!7928 lt!261866)))))))

(assert (= (and d!59367 res!140245) b!168539))

(assert (= (and b!168539 res!140246) b!168540))

(declare-fun m!268127 () Bool)

(assert (=> d!59367 m!268127))

(declare-fun m!268129 () Bool)

(assert (=> b!168539 m!268129))

(declare-fun m!268131 () Bool)

(assert (=> b!168539 m!268131))

(assert (=> b!168488 d!59367))

(declare-fun d!59387 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!59387 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3889 (buf!4341 thiss!1894))) ((_ sign_extend 32) (currentByte!8229 thiss!1894)) ((_ sign_extend 32) (currentBit!8224 thiss!1894)) ((_ sign_extend 32) nBits!600)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3889 (buf!4341 thiss!1894))) ((_ sign_extend 32) (currentByte!8229 thiss!1894)) ((_ sign_extend 32) (currentBit!8224 thiss!1894))) ((_ sign_extend 32) nBits!600)))))

(declare-fun bs!14705 () Bool)

(assert (= bs!14705 d!59387))

(declare-fun m!268133 () Bool)

(assert (=> bs!14705 m!268133))

(assert (=> b!168489 d!59387))

(declare-fun d!59389 () Bool)

(assert (=> d!59389 (= (invariant!0 (currentBit!8224 thiss!1894) (currentByte!8229 thiss!1894) (size!3889 (buf!4341 thiss!1894))) (and (bvsge (currentBit!8224 thiss!1894) #b00000000000000000000000000000000) (bvslt (currentBit!8224 thiss!1894) #b00000000000000000000000000001000) (bvsge (currentByte!8229 thiss!1894) #b00000000000000000000000000000000) (or (bvslt (currentByte!8229 thiss!1894) (size!3889 (buf!4341 thiss!1894))) (and (= (currentBit!8224 thiss!1894) #b00000000000000000000000000000000) (= (currentByte!8229 thiss!1894) (size!3889 (buf!4341 thiss!1894)))))))))

(assert (=> b!168492 d!59389))

(declare-fun d!59391 () Bool)

(assert (=> d!59391 (= (array_inv!3630 (buf!4341 thiss!1894)) (bvsge (size!3889 (buf!4341 thiss!1894)) #b00000000000000000000000000000000))))

(assert (=> b!168490 d!59391))

(declare-fun d!59393 () Bool)

(assert (=> d!59393 (= (inv!12 thiss!1894) (invariant!0 (currentBit!8224 thiss!1894) (currentByte!8229 thiss!1894) (size!3889 (buf!4341 thiss!1894))))))

(declare-fun bs!14706 () Bool)

(assert (= bs!14706 d!59393))

(assert (=> bs!14706 m!268077))

(assert (=> start!36778 d!59393))

(push 1)

(assert (not d!59387))

(assert (not d!59393))

(assert (not d!59367))

(assert (not b!168539))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

