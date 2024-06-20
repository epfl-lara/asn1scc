; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68844 () Bool)

(assert start!68844)

(declare-fun b!310709 () Bool)

(declare-fun res!254716 () Bool)

(declare-fun e!223232 () Bool)

(assert (=> b!310709 (=> (not res!254716) (not e!223232))))

(declare-datatypes ((array!18930 0))(
  ( (array!18931 (arr!9297 (Array (_ BitVec 32) (_ BitVec 8))) (size!8214 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13538 0))(
  ( (BitStream!13539 (buf!7830 array!18930) (currentByte!14403 (_ BitVec 32)) (currentBit!14398 (_ BitVec 32))) )
))
(declare-fun bitStream!19 () BitStream!13538)

(declare-fun nBits!480 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!310709 (= res!254716 (validate_offset_bits!1 ((_ sign_extend 32) (size!8214 (buf!7830 bitStream!19))) ((_ sign_extend 32) (currentByte!14403 bitStream!19)) ((_ sign_extend 32) (currentBit!14398 bitStream!19)) nBits!480))))

(declare-fun b!310710 () Bool)

(declare-fun e!223233 () Bool)

(declare-datatypes ((tuple2!23406 0))(
  ( (tuple2!23407 (_1!13296 Bool) (_2!13296 BitStream!13538)) )
))
(declare-fun lt!440490 () tuple2!23406)

(assert (=> b!310710 (= e!223233 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!8214 (buf!7830 (_2!13296 lt!440490)))) ((_ sign_extend 32) (currentByte!14403 (_2!13296 lt!440490))) ((_ sign_extend 32) (currentBit!14398 (_2!13296 lt!440490))) (bvsub nBits!480 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun res!254717 () Bool)

(assert (=> start!68844 (=> (not res!254717) (not e!223232))))

(assert (=> start!68844 (= res!254717 (bvsge nBits!480 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!68844 e!223232))

(assert (=> start!68844 true))

(declare-fun e!223234 () Bool)

(declare-fun inv!12 (BitStream!13538) Bool)

(assert (=> start!68844 (and (inv!12 bitStream!19) e!223234)))

(declare-fun b!310711 () Bool)

(declare-fun res!254718 () Bool)

(assert (=> b!310711 (=> (not res!254718) (not e!223232))))

(assert (=> b!310711 (= res!254718 (not (= nBits!480 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!310712 () Bool)

(declare-fun array_inv!7769 (array!18930) Bool)

(assert (=> b!310712 (= e!223234 (array_inv!7769 (buf!7830 bitStream!19)))))

(declare-fun b!310713 () Bool)

(assert (=> b!310713 (= e!223232 e!223233)))

(declare-fun res!254719 () Bool)

(assert (=> b!310713 (=> (not res!254719) (not e!223233))))

(assert (=> b!310713 (= res!254719 (bvsge (bvsub nBits!480 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun readBit!0 (BitStream!13538) tuple2!23406)

(assert (=> b!310713 (= lt!440490 (readBit!0 bitStream!19))))

(assert (= (and start!68844 res!254717) b!310709))

(assert (= (and b!310709 res!254716) b!310711))

(assert (= (and b!310711 res!254718) b!310713))

(assert (= (and b!310713 res!254719) b!310710))

(assert (= start!68844 b!310712))

(declare-fun m!448479 () Bool)

(assert (=> b!310713 m!448479))

(declare-fun m!448481 () Bool)

(assert (=> b!310710 m!448481))

(declare-fun m!448483 () Bool)

(assert (=> start!68844 m!448483))

(declare-fun m!448485 () Bool)

(assert (=> b!310709 m!448485))

(declare-fun m!448487 () Bool)

(assert (=> b!310712 m!448487))

(push 1)

(assert (not b!310712))

(assert (not b!310709))

(assert (not b!310713))

(assert (not start!68844))

(assert (not b!310710))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!102854 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!102854 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8214 (buf!7830 (_2!13296 lt!440490)))) ((_ sign_extend 32) (currentByte!14403 (_2!13296 lt!440490))) ((_ sign_extend 32) (currentBit!14398 (_2!13296 lt!440490))) (bvsub nBits!480 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8214 (buf!7830 (_2!13296 lt!440490)))) ((_ sign_extend 32) (currentByte!14403 (_2!13296 lt!440490))) ((_ sign_extend 32) (currentBit!14398 (_2!13296 lt!440490)))) (bvsub nBits!480 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!26625 () Bool)

(assert (= bs!26625 d!102854))

(declare-fun m!448499 () Bool)

(assert (=> bs!26625 m!448499))

(assert (=> b!310710 d!102854))

(declare-fun d!102856 () Bool)

(declare-fun e!223255 () Bool)

(assert (=> d!102856 e!223255))

(declare-fun res!254727 () Bool)

(assert (=> d!102856 (=> (not res!254727) (not e!223255))))

(declare-datatypes ((Unit!21509 0))(
  ( (Unit!21510) )
))
(declare-datatypes ((tuple2!23410 0))(
  ( (tuple2!23411 (_1!13298 Unit!21509) (_2!13298 BitStream!13538)) )
))
(declare-fun increaseBitIndex!0 (BitStream!13538) tuple2!23410)

(assert (=> d!102856 (= res!254727 (= (buf!7830 (_2!13298 (increaseBitIndex!0 bitStream!19))) (buf!7830 bitStream!19)))))

(declare-fun lt!440543 () Bool)

(assert (=> d!102856 (= lt!440543 (not (= (bvand ((_ sign_extend 24) (select (arr!9297 (buf!7830 bitStream!19)) (currentByte!14403 bitStream!19))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14398 bitStream!19)))) #b00000000000000000000000000000000)))))

(declare-fun lt!440540 () tuple2!23406)

(assert (=> d!102856 (= lt!440540 (tuple2!23407 (not (= (bvand ((_ sign_extend 24) (select (arr!9297 (buf!7830 bitStream!19)) (currentByte!14403 bitStream!19))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14398 bitStream!19)))) #b00000000000000000000000000000000)) (_2!13298 (increaseBitIndex!0 bitStream!19))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!102856 (validate_offset_bit!0 ((_ sign_extend 32) (size!8214 (buf!7830 bitStream!19))) ((_ sign_extend 32) (currentByte!14403 bitStream!19)) ((_ sign_extend 32) (currentBit!14398 bitStream!19)))))

(assert (=> d!102856 (= (readBit!0 bitStream!19) lt!440540)))

(declare-fun lt!440546 () (_ BitVec 64))

(declare-fun b!310721 () Bool)

(declare-fun lt!440545 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!310721 (= e!223255 (= (bitIndex!0 (size!8214 (buf!7830 (_2!13298 (increaseBitIndex!0 bitStream!19)))) (currentByte!14403 (_2!13298 (increaseBitIndex!0 bitStream!19))) (currentBit!14398 (_2!13298 (increaseBitIndex!0 bitStream!19)))) (bvadd lt!440546 lt!440545)))))

(assert (=> b!310721 (or (not (= (bvand lt!440546 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!440545 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!440546 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!440546 lt!440545) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!310721 (= lt!440545 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!310721 (= lt!440546 (bitIndex!0 (size!8214 (buf!7830 bitStream!19)) (currentByte!14403 bitStream!19) (currentBit!14398 bitStream!19)))))

(declare-fun lt!440544 () Bool)

(assert (=> b!310721 (= lt!440544 (not (= (bvand ((_ sign_extend 24) (select (arr!9297 (buf!7830 bitStream!19)) (currentByte!14403 bitStream!19))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14398 bitStream!19)))) #b00000000000000000000000000000000)))))

(declare-fun lt!440542 () Bool)

(assert (=> b!310721 (= lt!440542 (not (= (bvand ((_ sign_extend 24) (select (arr!9297 (buf!7830 bitStream!19)) (currentByte!14403 bitStream!19))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14398 bitStream!19)))) #b00000000000000000000000000000000)))))

(declare-fun lt!440541 () Bool)

(assert (=> b!310721 (= lt!440541 (not (= (bvand ((_ sign_extend 24) (select (arr!9297 (buf!7830 bitStream!19)) (currentByte!14403 bitStream!19))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14398 bitStream!19)))) #b00000000000000000000000000000000)))))

(assert (= (and d!102856 res!254727) b!310721))

(declare-fun m!448515 () Bool)

(assert (=> d!102856 m!448515))

(declare-fun m!448517 () Bool)

(assert (=> d!102856 m!448517))

(declare-fun m!448519 () Bool)

(assert (=> d!102856 m!448519))

(declare-fun m!448521 () Bool)

(assert (=> d!102856 m!448521))

(assert (=> b!310721 m!448519))

(assert (=> b!310721 m!448517))

(assert (=> b!310721 m!448515))

(declare-fun m!448523 () Bool)

(assert (=> b!310721 m!448523))

(declare-fun m!448525 () Bool)

(assert (=> b!310721 m!448525))

(assert (=> b!310713 d!102856))

(declare-fun d!102860 () Bool)

(assert (=> d!102860 (= (array_inv!7769 (buf!7830 bitStream!19)) (bvsge (size!8214 (buf!7830 bitStream!19)) #b00000000000000000000000000000000))))

(assert (=> b!310712 d!102860))

(declare-fun d!102862 () Bool)

(assert (=> d!102862 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8214 (buf!7830 bitStream!19))) ((_ sign_extend 32) (currentByte!14403 bitStream!19)) ((_ sign_extend 32) (currentBit!14398 bitStream!19)) nBits!480) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8214 (buf!7830 bitStream!19))) ((_ sign_extend 32) (currentByte!14403 bitStream!19)) ((_ sign_extend 32) (currentBit!14398 bitStream!19))) nBits!480))))

(declare-fun bs!26627 () Bool)

(assert (= bs!26627 d!102862))

(declare-fun m!448527 () Bool)

(assert (=> bs!26627 m!448527))

(assert (=> b!310709 d!102862))

(declare-fun d!102864 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!102864 (= (inv!12 bitStream!19) (invariant!0 (currentBit!14398 bitStream!19) (currentByte!14403 bitStream!19) (size!8214 (buf!7830 bitStream!19))))))

(declare-fun bs!26628 () Bool)

(assert (= bs!26628 d!102864))

(declare-fun m!448529 () Bool)

(assert (=> bs!26628 m!448529))

(assert (=> start!68844 d!102864))

(push 1)

(assert (not d!102854))

(assert (not d!102856))

(assert (not d!102862))

(assert (not d!102864))

(assert (not b!310721))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!102878 () Bool)

(declare-fun e!223269 () Bool)

(assert (=> d!102878 e!223269))

(declare-fun res!254753 () Bool)

(assert (=> d!102878 (=> (not res!254753) (not e!223269))))

(declare-fun lt!440625 () (_ BitVec 64))

(declare-fun lt!440623 () tuple2!23410)

(declare-fun lt!440622 () (_ BitVec 64))

(assert (=> d!102878 (= res!254753 (= (bvadd lt!440622 lt!440625) (bitIndex!0 (size!8214 (buf!7830 (_2!13298 lt!440623))) (currentByte!14403 (_2!13298 lt!440623)) (currentBit!14398 (_2!13298 lt!440623)))))))

(assert (=> d!102878 (or (not (= (bvand lt!440622 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!440625 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!440622 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!440622 lt!440625) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!102878 (= lt!440625 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!102878 (= lt!440622 (bitIndex!0 (size!8214 (buf!7830 bitStream!19)) (currentByte!14403 bitStream!19) (currentBit!14398 bitStream!19)))))

(declare-fun Unit!21515 () Unit!21509)

(declare-fun Unit!21516 () Unit!21509)

(assert (=> d!102878 (= lt!440623 (ite (bvslt (currentBit!14398 bitStream!19) #b00000000000000000000000000000111) (tuple2!23411 Unit!21515 (BitStream!13539 (buf!7830 bitStream!19) (currentByte!14403 bitStream!19) (bvadd (currentBit!14398 bitStream!19) #b00000000000000000000000000000001))) (tuple2!23411 Unit!21516 (BitStream!13539 (buf!7830 bitStream!19) (bvadd (currentByte!14403 bitStream!19) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (=> d!102878 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!8214 (buf!7830 bitStream!19))) ((_ sign_extend 32) (currentByte!14403 bitStream!19)) ((_ sign_extend 32) (currentBit!14398 bitStream!19))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!102878 (= (increaseBitIndex!0 bitStream!19) lt!440623)))

(declare-fun b!310747 () Bool)

(declare-fun res!254754 () Bool)

(assert (=> b!310747 (=> (not res!254754) (not e!223269))))

(declare-fun lt!440624 () (_ BitVec 64))

(declare-fun lt!440621 () (_ BitVec 64))

(assert (=> b!310747 (= res!254754 (= (bvsub lt!440624 lt!440621) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!310747 (or (= (bvand lt!440624 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!440621 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!440624 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!440624 lt!440621) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!310747 (= lt!440621 (remainingBits!0 ((_ sign_extend 32) (size!8214 (buf!7830 (_2!13298 lt!440623)))) ((_ sign_extend 32) (currentByte!14403 (_2!13298 lt!440623))) ((_ sign_extend 32) (currentBit!14398 (_2!13298 lt!440623)))))))

(assert (=> b!310747 (= lt!440624 (remainingBits!0 ((_ sign_extend 32) (size!8214 (buf!7830 bitStream!19))) ((_ sign_extend 32) (currentByte!14403 bitStream!19)) ((_ sign_extend 32) (currentBit!14398 bitStream!19))))))

(declare-fun b!310748 () Bool)

(assert (=> b!310748 (= e!223269 (= (size!8214 (buf!7830 bitStream!19)) (size!8214 (buf!7830 (_2!13298 lt!440623)))))))

(assert (= (and d!102878 res!254753) b!310747))

(assert (= (and b!310747 res!254754) b!310748))

(declare-fun m!448555 () Bool)

(assert (=> d!102878 m!448555))

(assert (=> d!102878 m!448523))

(assert (=> d!102878 m!448527))

(declare-fun m!448557 () Bool)

(assert (=> b!310747 m!448557))

(assert (=> b!310747 m!448527))

(assert (=> d!102856 d!102878))

(declare-fun d!102888 () Bool)

(assert (=> d!102888 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!8214 (buf!7830 bitStream!19))) ((_ sign_extend 32) (currentByte!14403 bitStream!19)) ((_ sign_extend 32) (currentBit!14398 bitStream!19))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8214 (buf!7830 bitStream!19))) ((_ sign_extend 32) (currentByte!14403 bitStream!19)) ((_ sign_extend 32) (currentBit!14398 bitStream!19))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!26630 () Bool)

(assert (= bs!26630 d!102888))

(assert (=> bs!26630 m!448527))

(assert (=> d!102856 d!102888))

(declare-fun d!102890 () Bool)

(assert (=> d!102890 (= (remainingBits!0 ((_ sign_extend 32) (size!8214 (buf!7830 (_2!13296 lt!440490)))) ((_ sign_extend 32) (currentByte!14403 (_2!13296 lt!440490))) ((_ sign_extend 32) (currentBit!14398 (_2!13296 lt!440490)))) (bvsub (bvmul ((_ sign_extend 32) (size!8214 (buf!7830 (_2!13296 lt!440490)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!14403 (_2!13296 lt!440490))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14398 (_2!13296 lt!440490))))))))

(assert (=> d!102854 d!102890))

(declare-fun d!102892 () Bool)

(declare-fun e!223274 () Bool)

(assert (=> d!102892 e!223274))

(declare-fun res!254764 () Bool)

(assert (=> d!102892 (=> (not res!254764) (not e!223274))))

(declare-fun lt!440650 () (_ BitVec 64))

(declare-fun lt!440649 () (_ BitVec 64))

(declare-fun lt!440648 () (_ BitVec 64))

(assert (=> d!102892 (= res!254764 (= lt!440648 (bvsub lt!440649 lt!440650)))))

(assert (=> d!102892 (or (= (bvand lt!440649 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!440650 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!440649 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!440649 lt!440650) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!102892 (= lt!440650 (remainingBits!0 ((_ sign_extend 32) (size!8214 (buf!7830 (_2!13298 (increaseBitIndex!0 bitStream!19))))) ((_ sign_extend 32) (currentByte!14403 (_2!13298 (increaseBitIndex!0 bitStream!19)))) ((_ sign_extend 32) (currentBit!14398 (_2!13298 (increaseBitIndex!0 bitStream!19))))))))

(declare-fun lt!440653 () (_ BitVec 64))

(declare-fun lt!440651 () (_ BitVec 64))

(assert (=> d!102892 (= lt!440649 (bvmul lt!440653 lt!440651))))

(assert (=> d!102892 (or (= lt!440653 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!440651 (bvsdiv (bvmul lt!440653 lt!440651) lt!440653)))))

(assert (=> d!102892 (= lt!440651 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!102892 (= lt!440653 ((_ sign_extend 32) (size!8214 (buf!7830 (_2!13298 (increaseBitIndex!0 bitStream!19))))))))

(assert (=> d!102892 (= lt!440648 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14403 (_2!13298 (increaseBitIndex!0 bitStream!19)))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14398 (_2!13298 (increaseBitIndex!0 bitStream!19))))))))

(assert (=> d!102892 (invariant!0 (currentBit!14398 (_2!13298 (increaseBitIndex!0 bitStream!19))) (currentByte!14403 (_2!13298 (increaseBitIndex!0 bitStream!19))) (size!8214 (buf!7830 (_2!13298 (increaseBitIndex!0 bitStream!19)))))))

(assert (=> d!102892 (= (bitIndex!0 (size!8214 (buf!7830 (_2!13298 (increaseBitIndex!0 bitStream!19)))) (currentByte!14403 (_2!13298 (increaseBitIndex!0 bitStream!19))) (currentBit!14398 (_2!13298 (increaseBitIndex!0 bitStream!19)))) lt!440648)))

(declare-fun b!310757 () Bool)

(declare-fun res!254763 () Bool)

(assert (=> b!310757 (=> (not res!254763) (not e!223274))))

(assert (=> b!310757 (= res!254763 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!440648))))

(declare-fun b!310758 () Bool)

(declare-fun lt!440652 () (_ BitVec 64))

(assert (=> b!310758 (= e!223274 (bvsle lt!440648 (bvmul lt!440652 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!310758 (or (= lt!440652 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!440652 #b0000000000000000000000000000000000000000000000000000000000001000) lt!440652)))))

(assert (=> b!310758 (= lt!440652 ((_ sign_extend 32) (size!8214 (buf!7830 (_2!13298 (increaseBitIndex!0 bitStream!19))))))))

(assert (= (and d!102892 res!254764) b!310757))

(assert (= (and b!310757 res!254763) b!310758))

(declare-fun m!448559 () Bool)

(assert (=> d!102892 m!448559))

(declare-fun m!448561 () Bool)

(assert (=> d!102892 m!448561))

(assert (=> b!310721 d!102892))

(assert (=> b!310721 d!102878))

(declare-fun d!102894 () Bool)

(declare-fun e!223275 () Bool)

(assert (=> d!102894 e!223275))

(declare-fun res!254766 () Bool)

(assert (=> d!102894 (=> (not res!254766) (not e!223275))))

(declare-fun lt!440656 () (_ BitVec 64))

(declare-fun lt!440655 () (_ BitVec 64))

(declare-fun lt!440654 () (_ BitVec 64))

(assert (=> d!102894 (= res!254766 (= lt!440654 (bvsub lt!440655 lt!440656)))))

(assert (=> d!102894 (or (= (bvand lt!440655 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!440656 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!440655 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!440655 lt!440656) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!102894 (= lt!440656 (remainingBits!0 ((_ sign_extend 32) (size!8214 (buf!7830 bitStream!19))) ((_ sign_extend 32) (currentByte!14403 bitStream!19)) ((_ sign_extend 32) (currentBit!14398 bitStream!19))))))

(declare-fun lt!440659 () (_ BitVec 64))

(declare-fun lt!440657 () (_ BitVec 64))

(assert (=> d!102894 (= lt!440655 (bvmul lt!440659 lt!440657))))

(assert (=> d!102894 (or (= lt!440659 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!440657 (bvsdiv (bvmul lt!440659 lt!440657) lt!440659)))))

(assert (=> d!102894 (= lt!440657 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!102894 (= lt!440659 ((_ sign_extend 32) (size!8214 (buf!7830 bitStream!19))))))

(assert (=> d!102894 (= lt!440654 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14403 bitStream!19)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14398 bitStream!19))))))

(assert (=> d!102894 (invariant!0 (currentBit!14398 bitStream!19) (currentByte!14403 bitStream!19) (size!8214 (buf!7830 bitStream!19)))))

(assert (=> d!102894 (= (bitIndex!0 (size!8214 (buf!7830 bitStream!19)) (currentByte!14403 bitStream!19) (currentBit!14398 bitStream!19)) lt!440654)))

(declare-fun b!310759 () Bool)

(declare-fun res!254765 () Bool)

(assert (=> b!310759 (=> (not res!254765) (not e!223275))))

(assert (=> b!310759 (= res!254765 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!440654))))

(declare-fun b!310760 () Bool)

(declare-fun lt!440658 () (_ BitVec 64))

(assert (=> b!310760 (= e!223275 (bvsle lt!440654 (bvmul lt!440658 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!310760 (or (= lt!440658 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!440658 #b0000000000000000000000000000000000000000000000000000000000001000) lt!440658)))))

(assert (=> b!310760 (= lt!440658 ((_ sign_extend 32) (size!8214 (buf!7830 bitStream!19))))))

(assert (= (and d!102894 res!254766) b!310759))

(assert (= (and b!310759 res!254765) b!310760))

(assert (=> d!102894 m!448527))

(assert (=> d!102894 m!448529))

(assert (=> b!310721 d!102894))

(declare-fun d!102896 () Bool)

(assert (=> d!102896 (= (invariant!0 (currentBit!14398 bitStream!19) (currentByte!14403 bitStream!19) (size!8214 (buf!7830 bitStream!19))) (and (bvsge (currentBit!14398 bitStream!19) #b00000000000000000000000000000000) (bvslt (currentBit!14398 bitStream!19) #b00000000000000000000000000001000) (bvsge (currentByte!14403 bitStream!19) #b00000000000000000000000000000000) (or (bvslt (currentByte!14403 bitStream!19) (size!8214 (buf!7830 bitStream!19))) (and (= (currentBit!14398 bitStream!19) #b00000000000000000000000000000000) (= (currentByte!14403 bitStream!19) (size!8214 (buf!7830 bitStream!19)))))))))

(assert (=> d!102864 d!102896))

(declare-fun d!102900 () Bool)

(assert (=> d!102900 (= (remainingBits!0 ((_ sign_extend 32) (size!8214 (buf!7830 bitStream!19))) ((_ sign_extend 32) (currentByte!14403 bitStream!19)) ((_ sign_extend 32) (currentBit!14398 bitStream!19))) (bvsub (bvmul ((_ sign_extend 32) (size!8214 (buf!7830 bitStream!19))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!14403 bitStream!19)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14398 bitStream!19)))))))

(assert (=> d!102862 d!102900))

(push 1)

(assert (not d!102888))

(assert (not d!102894))

(assert (not b!310747))

(assert (not d!102878))

(assert (not d!102892))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

