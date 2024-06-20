; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68842 () Bool)

(assert start!68842)

(declare-fun b!310694 () Bool)

(declare-fun e!223220 () Bool)

(declare-datatypes ((array!18928 0))(
  ( (array!18929 (arr!9296 (Array (_ BitVec 32) (_ BitVec 8))) (size!8213 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13536 0))(
  ( (BitStream!13537 (buf!7829 array!18928) (currentByte!14402 (_ BitVec 32)) (currentBit!14397 (_ BitVec 32))) )
))
(declare-fun bitStream!19 () BitStream!13536)

(declare-fun array_inv!7768 (array!18928) Bool)

(assert (=> b!310694 (= e!223220 (array_inv!7768 (buf!7829 bitStream!19)))))

(declare-fun b!310695 () Bool)

(declare-fun res!254707 () Bool)

(declare-fun e!223221 () Bool)

(assert (=> b!310695 (=> (not res!254707) (not e!223221))))

(declare-fun nBits!480 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!310695 (= res!254707 (validate_offset_bits!1 ((_ sign_extend 32) (size!8213 (buf!7829 bitStream!19))) ((_ sign_extend 32) (currentByte!14402 bitStream!19)) ((_ sign_extend 32) (currentBit!14397 bitStream!19)) nBits!480))))

(declare-fun b!310696 () Bool)

(declare-fun res!254705 () Bool)

(assert (=> b!310696 (=> (not res!254705) (not e!223221))))

(assert (=> b!310696 (= res!254705 (not (= nBits!480 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!310697 () Bool)

(declare-fun e!223222 () Bool)

(declare-datatypes ((tuple2!23404 0))(
  ( (tuple2!23405 (_1!13295 Bool) (_2!13295 BitStream!13536)) )
))
(declare-fun lt!440487 () tuple2!23404)

(assert (=> b!310697 (= e!223222 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!8213 (buf!7829 (_2!13295 lt!440487)))) ((_ sign_extend 32) (currentByte!14402 (_2!13295 lt!440487))) ((_ sign_extend 32) (currentBit!14397 (_2!13295 lt!440487))) (bvsub nBits!480 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!310698 () Bool)

(assert (=> b!310698 (= e!223221 e!223222)))

(declare-fun res!254706 () Bool)

(assert (=> b!310698 (=> (not res!254706) (not e!223222))))

(assert (=> b!310698 (= res!254706 (bvsge (bvsub nBits!480 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun readBit!0 (BitStream!13536) tuple2!23404)

(assert (=> b!310698 (= lt!440487 (readBit!0 bitStream!19))))

(declare-fun res!254704 () Bool)

(assert (=> start!68842 (=> (not res!254704) (not e!223221))))

(assert (=> start!68842 (= res!254704 (bvsge nBits!480 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!68842 e!223221))

(assert (=> start!68842 true))

(declare-fun inv!12 (BitStream!13536) Bool)

(assert (=> start!68842 (and (inv!12 bitStream!19) e!223220)))

(assert (= (and start!68842 res!254704) b!310695))

(assert (= (and b!310695 res!254707) b!310696))

(assert (= (and b!310696 res!254705) b!310698))

(assert (= (and b!310698 res!254706) b!310697))

(assert (= start!68842 b!310694))

(declare-fun m!448469 () Bool)

(assert (=> start!68842 m!448469))

(declare-fun m!448471 () Bool)

(assert (=> b!310695 m!448471))

(declare-fun m!448473 () Bool)

(assert (=> b!310698 m!448473))

(declare-fun m!448475 () Bool)

(assert (=> b!310697 m!448475))

(declare-fun m!448477 () Bool)

(assert (=> b!310694 m!448477))

(check-sat (not b!310698) (not b!310697) (not start!68842) (not b!310695) (not b!310694))
(check-sat)
(get-model)

(declare-fun d!102838 () Bool)

(assert (=> d!102838 (= (array_inv!7768 (buf!7829 bitStream!19)) (bvsge (size!8213 (buf!7829 bitStream!19)) #b00000000000000000000000000000000))))

(assert (=> b!310694 d!102838))

(declare-fun d!102844 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!102844 (= (inv!12 bitStream!19) (invariant!0 (currentBit!14397 bitStream!19) (currentByte!14402 bitStream!19) (size!8213 (buf!7829 bitStream!19))))))

(declare-fun bs!26623 () Bool)

(assert (= bs!26623 d!102844))

(declare-fun m!448495 () Bool)

(assert (=> bs!26623 m!448495))

(assert (=> start!68842 d!102844))

(declare-fun d!102848 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!102848 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8213 (buf!7829 bitStream!19))) ((_ sign_extend 32) (currentByte!14402 bitStream!19)) ((_ sign_extend 32) (currentBit!14397 bitStream!19)) nBits!480) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8213 (buf!7829 bitStream!19))) ((_ sign_extend 32) (currentByte!14402 bitStream!19)) ((_ sign_extend 32) (currentBit!14397 bitStream!19))) nBits!480))))

(declare-fun bs!26624 () Bool)

(assert (= bs!26624 d!102848))

(declare-fun m!448497 () Bool)

(assert (=> bs!26624 m!448497))

(assert (=> b!310695 d!102848))

(declare-fun d!102852 () Bool)

(declare-fun e!223254 () Bool)

(assert (=> d!102852 e!223254))

(declare-fun res!254726 () Bool)

(assert (=> d!102852 (=> (not res!254726) (not e!223254))))

(declare-datatypes ((Unit!21507 0))(
  ( (Unit!21508) )
))
(declare-datatypes ((tuple2!23408 0))(
  ( (tuple2!23409 (_1!13297 Unit!21507) (_2!13297 BitStream!13536)) )
))
(declare-fun increaseBitIndex!0 (BitStream!13536) tuple2!23408)

(assert (=> d!102852 (= res!254726 (= (buf!7829 (_2!13297 (increaseBitIndex!0 bitStream!19))) (buf!7829 bitStream!19)))))

(declare-fun lt!440533 () Bool)

(assert (=> d!102852 (= lt!440533 (not (= (bvand ((_ sign_extend 24) (select (arr!9296 (buf!7829 bitStream!19)) (currentByte!14402 bitStream!19))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14397 bitStream!19)))) #b00000000000000000000000000000000)))))

(declare-fun lt!440539 () tuple2!23404)

(assert (=> d!102852 (= lt!440539 (tuple2!23405 (not (= (bvand ((_ sign_extend 24) (select (arr!9296 (buf!7829 bitStream!19)) (currentByte!14402 bitStream!19))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14397 bitStream!19)))) #b00000000000000000000000000000000)) (_2!13297 (increaseBitIndex!0 bitStream!19))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!102852 (validate_offset_bit!0 ((_ sign_extend 32) (size!8213 (buf!7829 bitStream!19))) ((_ sign_extend 32) (currentByte!14402 bitStream!19)) ((_ sign_extend 32) (currentBit!14397 bitStream!19)))))

(assert (=> d!102852 (= (readBit!0 bitStream!19) lt!440539)))

(declare-fun b!310720 () Bool)

(declare-fun lt!440535 () (_ BitVec 64))

(declare-fun lt!440538 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!310720 (= e!223254 (= (bitIndex!0 (size!8213 (buf!7829 (_2!13297 (increaseBitIndex!0 bitStream!19)))) (currentByte!14402 (_2!13297 (increaseBitIndex!0 bitStream!19))) (currentBit!14397 (_2!13297 (increaseBitIndex!0 bitStream!19)))) (bvadd lt!440538 lt!440535)))))

(assert (=> b!310720 (or (not (= (bvand lt!440538 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!440535 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!440538 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!440538 lt!440535) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!310720 (= lt!440535 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!310720 (= lt!440538 (bitIndex!0 (size!8213 (buf!7829 bitStream!19)) (currentByte!14402 bitStream!19) (currentBit!14397 bitStream!19)))))

(declare-fun lt!440537 () Bool)

(assert (=> b!310720 (= lt!440537 (not (= (bvand ((_ sign_extend 24) (select (arr!9296 (buf!7829 bitStream!19)) (currentByte!14402 bitStream!19))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14397 bitStream!19)))) #b00000000000000000000000000000000)))))

(declare-fun lt!440534 () Bool)

(assert (=> b!310720 (= lt!440534 (not (= (bvand ((_ sign_extend 24) (select (arr!9296 (buf!7829 bitStream!19)) (currentByte!14402 bitStream!19))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14397 bitStream!19)))) #b00000000000000000000000000000000)))))

(declare-fun lt!440536 () Bool)

(assert (=> b!310720 (= lt!440536 (not (= (bvand ((_ sign_extend 24) (select (arr!9296 (buf!7829 bitStream!19)) (currentByte!14402 bitStream!19))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14397 bitStream!19)))) #b00000000000000000000000000000000)))))

(assert (= (and d!102852 res!254726) b!310720))

(declare-fun m!448501 () Bool)

(assert (=> d!102852 m!448501))

(declare-fun m!448503 () Bool)

(assert (=> d!102852 m!448503))

(declare-fun m!448505 () Bool)

(assert (=> d!102852 m!448505))

(declare-fun m!448507 () Bool)

(assert (=> d!102852 m!448507))

(declare-fun m!448509 () Bool)

(assert (=> b!310720 m!448509))

(assert (=> b!310720 m!448501))

(assert (=> b!310720 m!448503))

(declare-fun m!448511 () Bool)

(assert (=> b!310720 m!448511))

(assert (=> b!310720 m!448505))

(assert (=> b!310698 d!102852))

(declare-fun d!102858 () Bool)

(assert (=> d!102858 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8213 (buf!7829 (_2!13295 lt!440487)))) ((_ sign_extend 32) (currentByte!14402 (_2!13295 lt!440487))) ((_ sign_extend 32) (currentBit!14397 (_2!13295 lt!440487))) (bvsub nBits!480 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8213 (buf!7829 (_2!13295 lt!440487)))) ((_ sign_extend 32) (currentByte!14402 (_2!13295 lt!440487))) ((_ sign_extend 32) (currentBit!14397 (_2!13295 lt!440487)))) (bvsub nBits!480 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!26626 () Bool)

(assert (= bs!26626 d!102858))

(declare-fun m!448513 () Bool)

(assert (=> bs!26626 m!448513))

(assert (=> b!310697 d!102858))

(check-sat (not d!102852) (not d!102848) (not d!102858) (not d!102844) (not b!310720))
(check-sat)
(get-model)

(declare-fun d!102866 () Bool)

(declare-fun e!223259 () Bool)

(assert (=> d!102866 e!223259))

(declare-fun res!254734 () Bool)

(assert (=> d!102866 (=> (not res!254734) (not e!223259))))

(declare-fun lt!440567 () (_ BitVec 64))

(declare-fun lt!440566 () (_ BitVec 64))

(declare-fun lt!440568 () (_ BitVec 64))

(assert (=> d!102866 (= res!254734 (= lt!440566 (bvsub lt!440568 lt!440567)))))

(assert (=> d!102866 (or (= (bvand lt!440568 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!440567 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!440568 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!440568 lt!440567) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!102866 (= lt!440567 (remainingBits!0 ((_ sign_extend 32) (size!8213 (buf!7829 (_2!13297 (increaseBitIndex!0 bitStream!19))))) ((_ sign_extend 32) (currentByte!14402 (_2!13297 (increaseBitIndex!0 bitStream!19)))) ((_ sign_extend 32) (currentBit!14397 (_2!13297 (increaseBitIndex!0 bitStream!19))))))))

(declare-fun lt!440570 () (_ BitVec 64))

(declare-fun lt!440571 () (_ BitVec 64))

(assert (=> d!102866 (= lt!440568 (bvmul lt!440570 lt!440571))))

(assert (=> d!102866 (or (= lt!440570 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!440571 (bvsdiv (bvmul lt!440570 lt!440571) lt!440570)))))

(assert (=> d!102866 (= lt!440571 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!102866 (= lt!440570 ((_ sign_extend 32) (size!8213 (buf!7829 (_2!13297 (increaseBitIndex!0 bitStream!19))))))))

(assert (=> d!102866 (= lt!440566 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14402 (_2!13297 (increaseBitIndex!0 bitStream!19)))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14397 (_2!13297 (increaseBitIndex!0 bitStream!19))))))))

(assert (=> d!102866 (invariant!0 (currentBit!14397 (_2!13297 (increaseBitIndex!0 bitStream!19))) (currentByte!14402 (_2!13297 (increaseBitIndex!0 bitStream!19))) (size!8213 (buf!7829 (_2!13297 (increaseBitIndex!0 bitStream!19)))))))

(assert (=> d!102866 (= (bitIndex!0 (size!8213 (buf!7829 (_2!13297 (increaseBitIndex!0 bitStream!19)))) (currentByte!14402 (_2!13297 (increaseBitIndex!0 bitStream!19))) (currentBit!14397 (_2!13297 (increaseBitIndex!0 bitStream!19)))) lt!440566)))

(declare-fun b!310727 () Bool)

(declare-fun res!254733 () Bool)

(assert (=> b!310727 (=> (not res!254733) (not e!223259))))

(assert (=> b!310727 (= res!254733 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!440566))))

(declare-fun b!310728 () Bool)

(declare-fun lt!440569 () (_ BitVec 64))

(assert (=> b!310728 (= e!223259 (bvsle lt!440566 (bvmul lt!440569 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!310728 (or (= lt!440569 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!440569 #b0000000000000000000000000000000000000000000000000000000000001000) lt!440569)))))

(assert (=> b!310728 (= lt!440569 ((_ sign_extend 32) (size!8213 (buf!7829 (_2!13297 (increaseBitIndex!0 bitStream!19))))))))

(assert (= (and d!102866 res!254734) b!310727))

(assert (= (and b!310727 res!254733) b!310728))

(declare-fun m!448543 () Bool)

(assert (=> d!102866 m!448543))

(declare-fun m!448545 () Bool)

(assert (=> d!102866 m!448545))

(assert (=> b!310720 d!102866))

(declare-fun d!102868 () Bool)

(declare-fun e!223262 () Bool)

(assert (=> d!102868 e!223262))

(declare-fun res!254739 () Bool)

(assert (=> d!102868 (=> (not res!254739) (not e!223262))))

(declare-fun lt!440585 () (_ BitVec 64))

(declare-fun lt!440586 () (_ BitVec 64))

(declare-fun lt!440582 () tuple2!23408)

(assert (=> d!102868 (= res!254739 (= (bvadd lt!440585 lt!440586) (bitIndex!0 (size!8213 (buf!7829 (_2!13297 lt!440582))) (currentByte!14402 (_2!13297 lt!440582)) (currentBit!14397 (_2!13297 lt!440582)))))))

(assert (=> d!102868 (or (not (= (bvand lt!440585 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!440586 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!440585 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!440585 lt!440586) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!102868 (= lt!440586 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!102868 (= lt!440585 (bitIndex!0 (size!8213 (buf!7829 bitStream!19)) (currentByte!14402 bitStream!19) (currentBit!14397 bitStream!19)))))

(declare-fun Unit!21513 () Unit!21507)

(declare-fun Unit!21514 () Unit!21507)

(assert (=> d!102868 (= lt!440582 (ite (bvslt (currentBit!14397 bitStream!19) #b00000000000000000000000000000111) (tuple2!23409 Unit!21513 (BitStream!13537 (buf!7829 bitStream!19) (currentByte!14402 bitStream!19) (bvadd (currentBit!14397 bitStream!19) #b00000000000000000000000000000001))) (tuple2!23409 Unit!21514 (BitStream!13537 (buf!7829 bitStream!19) (bvadd (currentByte!14402 bitStream!19) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (=> d!102868 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!8213 (buf!7829 bitStream!19))) ((_ sign_extend 32) (currentByte!14402 bitStream!19)) ((_ sign_extend 32) (currentBit!14397 bitStream!19))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!102868 (= (increaseBitIndex!0 bitStream!19) lt!440582)))

(declare-fun b!310733 () Bool)

(declare-fun res!254740 () Bool)

(assert (=> b!310733 (=> (not res!254740) (not e!223262))))

(declare-fun lt!440583 () (_ BitVec 64))

(declare-fun lt!440584 () (_ BitVec 64))

(assert (=> b!310733 (= res!254740 (= (bvsub lt!440583 lt!440584) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!310733 (or (= (bvand lt!440583 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!440584 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!440583 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!440583 lt!440584) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!310733 (= lt!440584 (remainingBits!0 ((_ sign_extend 32) (size!8213 (buf!7829 (_2!13297 lt!440582)))) ((_ sign_extend 32) (currentByte!14402 (_2!13297 lt!440582))) ((_ sign_extend 32) (currentBit!14397 (_2!13297 lt!440582)))))))

(assert (=> b!310733 (= lt!440583 (remainingBits!0 ((_ sign_extend 32) (size!8213 (buf!7829 bitStream!19))) ((_ sign_extend 32) (currentByte!14402 bitStream!19)) ((_ sign_extend 32) (currentBit!14397 bitStream!19))))))

(declare-fun b!310734 () Bool)

(assert (=> b!310734 (= e!223262 (= (size!8213 (buf!7829 bitStream!19)) (size!8213 (buf!7829 (_2!13297 lt!440582)))))))

(assert (= (and d!102868 res!254739) b!310733))

(assert (= (and b!310733 res!254740) b!310734))

(declare-fun m!448547 () Bool)

(assert (=> d!102868 m!448547))

(assert (=> d!102868 m!448509))

(assert (=> d!102868 m!448497))

(declare-fun m!448549 () Bool)

(assert (=> b!310733 m!448549))

(assert (=> b!310733 m!448497))

(assert (=> b!310720 d!102868))

(declare-fun d!102874 () Bool)

(declare-fun e!223263 () Bool)

(assert (=> d!102874 e!223263))

(declare-fun res!254742 () Bool)

(assert (=> d!102874 (=> (not res!254742) (not e!223263))))

(declare-fun lt!440589 () (_ BitVec 64))

(declare-fun lt!440588 () (_ BitVec 64))

(declare-fun lt!440587 () (_ BitVec 64))

(assert (=> d!102874 (= res!254742 (= lt!440587 (bvsub lt!440589 lt!440588)))))

(assert (=> d!102874 (or (= (bvand lt!440589 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!440588 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!440589 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!440589 lt!440588) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!102874 (= lt!440588 (remainingBits!0 ((_ sign_extend 32) (size!8213 (buf!7829 bitStream!19))) ((_ sign_extend 32) (currentByte!14402 bitStream!19)) ((_ sign_extend 32) (currentBit!14397 bitStream!19))))))

(declare-fun lt!440591 () (_ BitVec 64))

(declare-fun lt!440592 () (_ BitVec 64))

(assert (=> d!102874 (= lt!440589 (bvmul lt!440591 lt!440592))))

(assert (=> d!102874 (or (= lt!440591 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!440592 (bvsdiv (bvmul lt!440591 lt!440592) lt!440591)))))

(assert (=> d!102874 (= lt!440592 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!102874 (= lt!440591 ((_ sign_extend 32) (size!8213 (buf!7829 bitStream!19))))))

(assert (=> d!102874 (= lt!440587 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14402 bitStream!19)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14397 bitStream!19))))))

(assert (=> d!102874 (invariant!0 (currentBit!14397 bitStream!19) (currentByte!14402 bitStream!19) (size!8213 (buf!7829 bitStream!19)))))

(assert (=> d!102874 (= (bitIndex!0 (size!8213 (buf!7829 bitStream!19)) (currentByte!14402 bitStream!19) (currentBit!14397 bitStream!19)) lt!440587)))

(declare-fun b!310735 () Bool)

(declare-fun res!254741 () Bool)

(assert (=> b!310735 (=> (not res!254741) (not e!223263))))

(assert (=> b!310735 (= res!254741 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!440587))))

(declare-fun b!310736 () Bool)

(declare-fun lt!440590 () (_ BitVec 64))

(assert (=> b!310736 (= e!223263 (bvsle lt!440587 (bvmul lt!440590 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!310736 (or (= lt!440590 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!440590 #b0000000000000000000000000000000000000000000000000000000000001000) lt!440590)))))

(assert (=> b!310736 (= lt!440590 ((_ sign_extend 32) (size!8213 (buf!7829 bitStream!19))))))

(assert (= (and d!102874 res!254742) b!310735))

(assert (= (and b!310735 res!254741) b!310736))

(assert (=> d!102874 m!448497))

(assert (=> d!102874 m!448495))

(assert (=> b!310720 d!102874))

(declare-fun d!102876 () Bool)

(assert (=> d!102876 (= (remainingBits!0 ((_ sign_extend 32) (size!8213 (buf!7829 bitStream!19))) ((_ sign_extend 32) (currentByte!14402 bitStream!19)) ((_ sign_extend 32) (currentBit!14397 bitStream!19))) (bvsub (bvmul ((_ sign_extend 32) (size!8213 (buf!7829 bitStream!19))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!14402 bitStream!19)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14397 bitStream!19)))))))

(assert (=> d!102848 d!102876))

(declare-fun d!102880 () Bool)

(assert (=> d!102880 (= (invariant!0 (currentBit!14397 bitStream!19) (currentByte!14402 bitStream!19) (size!8213 (buf!7829 bitStream!19))) (and (bvsge (currentBit!14397 bitStream!19) #b00000000000000000000000000000000) (bvslt (currentBit!14397 bitStream!19) #b00000000000000000000000000001000) (bvsge (currentByte!14402 bitStream!19) #b00000000000000000000000000000000) (or (bvslt (currentByte!14402 bitStream!19) (size!8213 (buf!7829 bitStream!19))) (and (= (currentBit!14397 bitStream!19) #b00000000000000000000000000000000) (= (currentByte!14402 bitStream!19) (size!8213 (buf!7829 bitStream!19)))))))))

(assert (=> d!102844 d!102880))

(assert (=> d!102852 d!102868))

(declare-fun d!102882 () Bool)

(assert (=> d!102882 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!8213 (buf!7829 bitStream!19))) ((_ sign_extend 32) (currentByte!14402 bitStream!19)) ((_ sign_extend 32) (currentBit!14397 bitStream!19))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8213 (buf!7829 bitStream!19))) ((_ sign_extend 32) (currentByte!14402 bitStream!19)) ((_ sign_extend 32) (currentBit!14397 bitStream!19))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!26629 () Bool)

(assert (= bs!26629 d!102882))

(assert (=> bs!26629 m!448497))

(assert (=> d!102852 d!102882))

(declare-fun d!102884 () Bool)

(assert (=> d!102884 (= (remainingBits!0 ((_ sign_extend 32) (size!8213 (buf!7829 (_2!13295 lt!440487)))) ((_ sign_extend 32) (currentByte!14402 (_2!13295 lt!440487))) ((_ sign_extend 32) (currentBit!14397 (_2!13295 lt!440487)))) (bvsub (bvmul ((_ sign_extend 32) (size!8213 (buf!7829 (_2!13295 lt!440487)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!14402 (_2!13295 lt!440487))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14397 (_2!13295 lt!440487))))))))

(assert (=> d!102858 d!102884))

(check-sat (not d!102874) (not d!102882) (not d!102868) (not d!102866) (not b!310733))
(check-sat)
