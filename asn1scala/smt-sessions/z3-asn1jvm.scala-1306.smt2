; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37158 () Bool)

(assert start!37158)

(declare-fun res!140520 () Bool)

(declare-fun e!117479 () Bool)

(assert (=> start!37158 (=> (not res!140520) (not e!117479))))

(declare-fun nBits!600 () (_ BitVec 32))

(assert (=> start!37158 (= res!140520 (and (bvsge nBits!600 #b00000000000000000000000000000001) (bvslt nBits!600 #b00000000000000000000000000001000)))))

(assert (=> start!37158 e!117479))

(assert (=> start!37158 true))

(declare-datatypes ((array!8882 0))(
  ( (array!8883 (arr!4853 (Array (_ BitVec 32) (_ BitVec 8))) (size!3932 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7020 0))(
  ( (BitStream!7021 (buf!4384 array!8882) (currentByte!8356 (_ BitVec 32)) (currentBit!8351 (_ BitVec 32))) )
))
(declare-fun thiss!1894 () BitStream!7020)

(declare-fun e!117477 () Bool)

(declare-fun inv!12 (BitStream!7020) Bool)

(assert (=> start!37158 (and (inv!12 thiss!1894) e!117477)))

(declare-fun b!168946 () Bool)

(declare-fun lt!261910 () (_ BitVec 64))

(declare-fun lt!261908 () (_ BitVec 64))

(assert (=> b!168946 (= e!117479 (and (= lt!261908 (bvand ((_ sign_extend 32) nBits!600) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!261908 (bvand (bvadd lt!261910 ((_ sign_extend 32) nBits!600)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!168946 (= lt!261908 (bvand lt!261910 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!168946 (= lt!261910 (bitIndex!0 (size!3932 (buf!4384 thiss!1894)) (currentByte!8356 thiss!1894) (currentBit!8351 thiss!1894)))))

(declare-fun b!168947 () Bool)

(declare-fun res!140522 () Bool)

(assert (=> b!168947 (=> (not res!140522) (not e!117479))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!168947 (= res!140522 (validate_offset_bits!1 ((_ sign_extend 32) (size!3932 (buf!4384 thiss!1894))) ((_ sign_extend 32) (currentByte!8356 thiss!1894)) ((_ sign_extend 32) (currentBit!8351 thiss!1894)) ((_ sign_extend 32) nBits!600)))))

(declare-fun b!168948 () Bool)

(declare-fun array_inv!3673 (array!8882) Bool)

(assert (=> b!168948 (= e!117477 (array_inv!3673 (buf!4384 thiss!1894)))))

(declare-fun b!168949 () Bool)

(declare-fun res!140521 () Bool)

(assert (=> b!168949 (=> (not res!140521) (not e!117479))))

(declare-datatypes ((Unit!11762 0))(
  ( (Unit!11763) )
))
(declare-datatypes ((tuple3!968 0))(
  ( (tuple3!969 (_1!7935 Unit!11762) (_2!7935 (_ BitVec 8)) (_3!610 BitStream!7020)) )
))
(declare-fun e!117478 () tuple3!968)

(assert (=> b!168949 (= res!140521 (= (buf!4384 (_3!610 e!117478)) (buf!4384 thiss!1894)))))

(declare-fun c!8711 () Bool)

(assert (=> b!168949 (= c!8711 (bvsle (bvadd (currentBit!8351 thiss!1894) nBits!600) #b00000000000000000000000000001000))))

(declare-fun b!168950 () Bool)

(declare-datatypes ((tuple2!14650 0))(
  ( (tuple2!14651 (_1!7936 Unit!11762) (_2!7936 BitStream!7020)) )
))
(declare-fun lt!261907 () tuple2!14650)

(assert (=> b!168950 (= e!117478 (tuple3!969 (_1!7936 lt!261907) ((_ extract 7 0) (bvand (bvlshr ((_ sign_extend 24) (select (arr!4853 (buf!4384 thiss!1894)) (currentByte!8356 thiss!1894))) (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!8351 thiss!1894) nBits!600))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!600)))) (_2!7936 lt!261907)))))

(declare-fun moveBitIndex!0 (BitStream!7020 (_ BitVec 64)) tuple2!14650)

(assert (=> b!168950 (= lt!261907 (moveBitIndex!0 thiss!1894 ((_ sign_extend 32) nBits!600)))))

(declare-fun b!168951 () Bool)

(declare-fun lt!261909 () (_ BitVec 32))

(declare-fun Unit!11764 () Unit!11762)

(assert (=> b!168951 (= e!117478 (tuple3!969 Unit!11764 ((_ extract 7 0) (bvand ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4853 (buf!4384 thiss!1894)) (currentByte!8356 thiss!1894))) lt!261909))) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4853 (buf!4384 thiss!1894)) (bvadd #b00000000000000000000000000000001 (currentByte!8356 thiss!1894)))) #b00000000000000000000000011111111) (bvsub #b00000000000000000000000000001000 lt!261909))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!600)))) (BitStream!7021 (buf!4384 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8356 thiss!1894)) lt!261909)))))

(assert (=> b!168951 (= lt!261909 (bvsub (bvadd (currentBit!8351 thiss!1894) nBits!600) #b00000000000000000000000000001000))))

(assert (= (and start!37158 res!140520) b!168947))

(assert (= (and b!168947 res!140522) b!168949))

(assert (= (and b!168949 c!8711) b!168950))

(assert (= (and b!168949 (not c!8711)) b!168951))

(assert (= (and b!168949 res!140521) b!168946))

(assert (= start!37158 b!168948))

(declare-fun m!268525 () Bool)

(assert (=> b!168950 m!268525))

(declare-fun m!268527 () Bool)

(assert (=> b!168950 m!268527))

(declare-fun m!268529 () Bool)

(assert (=> b!168950 m!268529))

(declare-fun m!268531 () Bool)

(assert (=> start!37158 m!268531))

(declare-fun m!268533 () Bool)

(assert (=> b!168948 m!268533))

(assert (=> b!168951 m!268525))

(declare-fun m!268535 () Bool)

(assert (=> b!168951 m!268535))

(assert (=> b!168951 m!268527))

(declare-fun m!268537 () Bool)

(assert (=> b!168946 m!268537))

(declare-fun m!268539 () Bool)

(assert (=> b!168947 m!268539))

(check-sat (not start!37158) (not b!168950) (not b!168948) (not b!168947) (not b!168946))
(check-sat)
(get-model)

(declare-fun d!59725 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!59725 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3932 (buf!4384 thiss!1894))) ((_ sign_extend 32) (currentByte!8356 thiss!1894)) ((_ sign_extend 32) (currentBit!8351 thiss!1894)) ((_ sign_extend 32) nBits!600)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3932 (buf!4384 thiss!1894))) ((_ sign_extend 32) (currentByte!8356 thiss!1894)) ((_ sign_extend 32) (currentBit!8351 thiss!1894))) ((_ sign_extend 32) nBits!600)))))

(declare-fun bs!14811 () Bool)

(assert (= bs!14811 d!59725))

(declare-fun m!268557 () Bool)

(assert (=> bs!14811 m!268557))

(assert (=> b!168947 d!59725))

(declare-fun d!59727 () Bool)

(declare-fun e!117500 () Bool)

(assert (=> d!59727 e!117500))

(declare-fun res!140545 () Bool)

(assert (=> d!59727 (=> (not res!140545) (not e!117500))))

(declare-fun lt!261959 () (_ BitVec 64))

(declare-fun lt!261963 () (_ BitVec 64))

(declare-fun lt!261961 () (_ BitVec 64))

(assert (=> d!59727 (= res!140545 (= lt!261963 (bvsub lt!261959 lt!261961)))))

(assert (=> d!59727 (or (= (bvand lt!261959 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!261961 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!261959 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!261959 lt!261961) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!59727 (= lt!261961 (remainingBits!0 ((_ sign_extend 32) (size!3932 (buf!4384 thiss!1894))) ((_ sign_extend 32) (currentByte!8356 thiss!1894)) ((_ sign_extend 32) (currentBit!8351 thiss!1894))))))

(declare-fun lt!261964 () (_ BitVec 64))

(declare-fun lt!261962 () (_ BitVec 64))

(assert (=> d!59727 (= lt!261959 (bvmul lt!261964 lt!261962))))

(assert (=> d!59727 (or (= lt!261964 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!261962 (bvsdiv (bvmul lt!261964 lt!261962) lt!261964)))))

(assert (=> d!59727 (= lt!261962 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!59727 (= lt!261964 ((_ sign_extend 32) (size!3932 (buf!4384 thiss!1894))))))

(assert (=> d!59727 (= lt!261963 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8356 thiss!1894)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8351 thiss!1894))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!59727 (invariant!0 (currentBit!8351 thiss!1894) (currentByte!8356 thiss!1894) (size!3932 (buf!4384 thiss!1894)))))

(assert (=> d!59727 (= (bitIndex!0 (size!3932 (buf!4384 thiss!1894)) (currentByte!8356 thiss!1894) (currentBit!8351 thiss!1894)) lt!261963)))

(declare-fun b!168982 () Bool)

(declare-fun res!140544 () Bool)

(assert (=> b!168982 (=> (not res!140544) (not e!117500))))

(assert (=> b!168982 (= res!140544 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!261963))))

(declare-fun b!168983 () Bool)

(declare-fun lt!261960 () (_ BitVec 64))

(assert (=> b!168983 (= e!117500 (bvsle lt!261963 (bvmul lt!261960 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!168983 (or (= lt!261960 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!261960 #b0000000000000000000000000000000000000000000000000000000000001000) lt!261960)))))

(assert (=> b!168983 (= lt!261960 ((_ sign_extend 32) (size!3932 (buf!4384 thiss!1894))))))

(assert (= (and d!59727 res!140545) b!168982))

(assert (= (and b!168982 res!140544) b!168983))

(assert (=> d!59727 m!268557))

(declare-fun m!268563 () Bool)

(assert (=> d!59727 m!268563))

(assert (=> b!168946 d!59727))

(declare-fun d!59731 () Bool)

(declare-fun lt!262030 () (_ BitVec 32))

(assert (=> d!59731 (= lt!262030 ((_ extract 31 0) (bvsrem ((_ sign_extend 32) nBits!600) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!262026 () (_ BitVec 32))

(assert (=> d!59731 (= lt!262026 ((_ extract 31 0) (bvsdiv ((_ sign_extend 32) nBits!600) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!117519 () Bool)

(assert (=> d!59731 e!117519))

(declare-fun res!140567 () Bool)

(assert (=> d!59731 (=> (not res!140567) (not e!117519))))

(declare-fun moveBitIndexPrecond!0 (BitStream!7020 (_ BitVec 64)) Bool)

(assert (=> d!59731 (= res!140567 (moveBitIndexPrecond!0 thiss!1894 ((_ sign_extend 32) nBits!600)))))

(declare-fun Unit!11774 () Unit!11762)

(declare-fun Unit!11775 () Unit!11762)

(declare-fun Unit!11776 () Unit!11762)

(assert (=> d!59731 (= (moveBitIndex!0 thiss!1894 ((_ sign_extend 32) nBits!600)) (ite (bvslt (bvadd (currentBit!8351 thiss!1894) lt!262030) #b00000000000000000000000000000000) (tuple2!14651 Unit!11774 (BitStream!7021 (buf!4384 thiss!1894) (bvsub (bvadd (currentByte!8356 thiss!1894) lt!262026) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!262030 (currentBit!8351 thiss!1894)))) (ite (bvsge (bvadd (currentBit!8351 thiss!1894) lt!262030) #b00000000000000000000000000001000) (tuple2!14651 Unit!11775 (BitStream!7021 (buf!4384 thiss!1894) (bvadd (currentByte!8356 thiss!1894) lt!262026 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!8351 thiss!1894) lt!262030) #b00000000000000000000000000001000))) (tuple2!14651 Unit!11776 (BitStream!7021 (buf!4384 thiss!1894) (bvadd (currentByte!8356 thiss!1894) lt!262026) (bvadd (currentBit!8351 thiss!1894) lt!262030))))))))

(declare-fun b!169004 () Bool)

(declare-fun e!117518 () Bool)

(assert (=> b!169004 (= e!117519 e!117518)))

(declare-fun res!140566 () Bool)

(assert (=> b!169004 (=> (not res!140566) (not e!117518))))

(declare-fun lt!262029 () tuple2!14650)

(declare-fun lt!262028 () (_ BitVec 64))

(assert (=> b!169004 (= res!140566 (= (bvadd lt!262028 ((_ sign_extend 32) nBits!600)) (bitIndex!0 (size!3932 (buf!4384 (_2!7936 lt!262029))) (currentByte!8356 (_2!7936 lt!262029)) (currentBit!8351 (_2!7936 lt!262029)))))))

(assert (=> b!169004 (or (not (= (bvand lt!262028 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand ((_ sign_extend 32) nBits!600) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!262028 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!262028 ((_ sign_extend 32) nBits!600)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!169004 (= lt!262028 (bitIndex!0 (size!3932 (buf!4384 thiss!1894)) (currentByte!8356 thiss!1894) (currentBit!8351 thiss!1894)))))

(declare-fun lt!262027 () (_ BitVec 32))

(declare-fun lt!262025 () (_ BitVec 32))

(declare-fun Unit!11780 () Unit!11762)

(declare-fun Unit!11781 () Unit!11762)

(declare-fun Unit!11782 () Unit!11762)

(assert (=> b!169004 (= lt!262029 (ite (bvslt (bvadd (currentBit!8351 thiss!1894) lt!262027) #b00000000000000000000000000000000) (tuple2!14651 Unit!11780 (BitStream!7021 (buf!4384 thiss!1894) (bvsub (bvadd (currentByte!8356 thiss!1894) lt!262025) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!262027 (currentBit!8351 thiss!1894)))) (ite (bvsge (bvadd (currentBit!8351 thiss!1894) lt!262027) #b00000000000000000000000000001000) (tuple2!14651 Unit!11781 (BitStream!7021 (buf!4384 thiss!1894) (bvadd (currentByte!8356 thiss!1894) lt!262025 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!8351 thiss!1894) lt!262027) #b00000000000000000000000000001000))) (tuple2!14651 Unit!11782 (BitStream!7021 (buf!4384 thiss!1894) (bvadd (currentByte!8356 thiss!1894) lt!262025) (bvadd (currentBit!8351 thiss!1894) lt!262027))))))))

(assert (=> b!169004 (= lt!262027 ((_ extract 31 0) (bvsrem ((_ sign_extend 32) nBits!600) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!169004 (= lt!262025 ((_ extract 31 0) (bvsdiv ((_ sign_extend 32) nBits!600) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!169005 () Bool)

(assert (=> b!169005 (= e!117518 (and (= (size!3932 (buf!4384 thiss!1894)) (size!3932 (buf!4384 (_2!7936 lt!262029)))) (= (buf!4384 thiss!1894) (buf!4384 (_2!7936 lt!262029)))))))

(assert (= (and d!59731 res!140567) b!169004))

(assert (= (and b!169004 res!140566) b!169005))

(declare-fun m!268577 () Bool)

(assert (=> d!59731 m!268577))

(declare-fun m!268579 () Bool)

(assert (=> b!169004 m!268579))

(assert (=> b!169004 m!268537))

(assert (=> b!168950 d!59731))

(declare-fun d!59749 () Bool)

(assert (=> d!59749 (= (inv!12 thiss!1894) (invariant!0 (currentBit!8351 thiss!1894) (currentByte!8356 thiss!1894) (size!3932 (buf!4384 thiss!1894))))))

(declare-fun bs!14816 () Bool)

(assert (= bs!14816 d!59749))

(assert (=> bs!14816 m!268563))

(assert (=> start!37158 d!59749))

(declare-fun d!59753 () Bool)

(assert (=> d!59753 (= (array_inv!3673 (buf!4384 thiss!1894)) (bvsge (size!3932 (buf!4384 thiss!1894)) #b00000000000000000000000000000000))))

(assert (=> b!168948 d!59753))

(check-sat (not d!59749) (not d!59727) (not b!169004) (not d!59725) (not d!59731))
