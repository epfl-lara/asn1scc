; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45686 () Bool)

(assert start!45686)

(declare-fun b!220962 () Bool)

(declare-fun res!186083 () Bool)

(declare-fun e!150035 () Bool)

(assert (=> b!220962 (=> (not res!186083) (not e!150035))))

(declare-fun acc!113 () (_ BitVec 64))

(assert (=> b!220962 (= res!186083 (= (bvand acc!113 #b1111111111111111111111111111111111111111111111111111111111111111) acc!113))))

(declare-fun b!220963 () Bool)

(declare-fun e!150033 () (_ BitVec 64))

(declare-fun i!541 () (_ BitVec 32))

(assert (=> b!220963 (= e!150033 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!541)))))

(declare-fun b!220964 () Bool)

(declare-fun res!186081 () Bool)

(assert (=> b!220964 (=> (not res!186081) (not e!150035))))

(declare-datatypes ((array!10799 0))(
  ( (array!10800 (arr!5673 (Array (_ BitVec 32) (_ BitVec 8))) (size!4743 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8594 0))(
  ( (BitStream!8595 (buf!5290 array!10799) (currentByte!9926 (_ BitVec 32)) (currentBit!9921 (_ BitVec 32))) )
))
(declare-fun bs!62 () BitStream!8594)

(declare-fun nBits!265 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!220964 (= res!186081 (validate_offset_bits!1 ((_ sign_extend 32) (size!4743 (buf!5290 bs!62))) ((_ sign_extend 32) (currentByte!9926 bs!62)) ((_ sign_extend 32) (currentBit!9921 bs!62)) ((_ sign_extend 32) (bvsub nBits!265 i!541))))))

(declare-fun b!220965 () Bool)

(declare-datatypes ((tuple2!18964 0))(
  ( (tuple2!18965 (_1!10140 BitStream!8594) (_2!10140 (_ BitVec 64))) )
))
(declare-fun lt!348679 () tuple2!18964)

(declare-fun lt!348680 () tuple2!18964)

(assert (=> b!220965 (= e!150035 (or (not (= (_2!10140 lt!348679) (_2!10140 lt!348680))) (not (= (_1!10140 lt!348679) (_1!10140 lt!348680)))))))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8594 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18964)

(declare-fun withMovedBitIndex!0 (BitStream!8594 (_ BitVec 64)) BitStream!8594)

(assert (=> b!220965 (= lt!348680 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!265 (bvadd #b00000000000000000000000000000001 i!541) (bvor acc!113 e!150033)))))

(declare-fun c!10703 () Bool)

(declare-datatypes ((tuple2!18966 0))(
  ( (tuple2!18967 (_1!10141 BitStream!8594) (_2!10141 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!8594) tuple2!18966)

(assert (=> b!220965 (= c!10703 (_2!10141 (readBitPure!0 bs!62)))))

(assert (=> b!220965 (= lt!348679 (readNBitsLSBFirstsLoopPure!0 bs!62 nBits!265 i!541 acc!113))))

(declare-fun res!186082 () Bool)

(assert (=> start!45686 (=> (not res!186082) (not e!150035))))

(assert (=> start!45686 (= res!186082 (and (bvsle #b00000000000000000000000000000000 i!541) (bvslt i!541 nBits!265) (bvsle nBits!265 #b00000000000000000000000001000000)))))

(assert (=> start!45686 e!150035))

(assert (=> start!45686 true))

(declare-fun e!150034 () Bool)

(declare-fun inv!12 (BitStream!8594) Bool)

(assert (=> start!45686 (and (inv!12 bs!62) e!150034)))

(declare-fun b!220966 () Bool)

(declare-fun res!186080 () Bool)

(assert (=> b!220966 (=> (not res!186080) (not e!150035))))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!220966 (= res!186080 (= (bvand acc!113 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!541))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!220967 () Bool)

(declare-fun array_inv!4484 (array!10799) Bool)

(assert (=> b!220967 (= e!150034 (array_inv!4484 (buf!5290 bs!62)))))

(declare-fun b!220968 () Bool)

(assert (=> b!220968 (= e!150033 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (= (and start!45686 res!186082) b!220964))

(assert (= (and b!220964 res!186081) b!220966))

(assert (= (and b!220966 res!186080) b!220962))

(assert (= (and b!220962 res!186083) b!220965))

(assert (= (and b!220965 c!10703) b!220963))

(assert (= (and b!220965 (not c!10703)) b!220968))

(assert (= start!45686 b!220967))

(declare-fun m!339603 () Bool)

(assert (=> start!45686 m!339603))

(declare-fun m!339605 () Bool)

(assert (=> b!220964 m!339605))

(declare-fun m!339607 () Bool)

(assert (=> b!220966 m!339607))

(declare-fun m!339609 () Bool)

(assert (=> b!220967 m!339609))

(declare-fun m!339611 () Bool)

(assert (=> b!220965 m!339611))

(assert (=> b!220965 m!339611))

(declare-fun m!339613 () Bool)

(assert (=> b!220965 m!339613))

(declare-fun m!339615 () Bool)

(assert (=> b!220965 m!339615))

(declare-fun m!339617 () Bool)

(assert (=> b!220965 m!339617))

(push 1)

(assert (not b!220964))

(assert (not b!220966))

(assert (not start!45686))

(assert (not b!220965))

(assert (not b!220967))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!74383 () Bool)

(declare-datatypes ((tuple2!18980 0))(
  ( (tuple2!18981 (_1!10148 (_ BitVec 64)) (_2!10148 BitStream!8594)) )
))
(declare-fun lt!348709 () tuple2!18980)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!8594 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18980)

(assert (=> d!74383 (= lt!348709 (readNBitsLSBFirstsLoop!0 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!265 (bvadd #b00000000000000000000000000000001 i!541) (bvor acc!113 e!150033)))))

(assert (=> d!74383 (= (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!265 (bvadd #b00000000000000000000000000000001 i!541) (bvor acc!113 e!150033)) (tuple2!18965 (_2!10148 lt!348709) (_1!10148 lt!348709)))))

(declare-fun bs!18206 () Bool)

(assert (= bs!18206 d!74383))

(assert (=> bs!18206 m!339611))

(declare-fun m!339653 () Bool)

(assert (=> bs!18206 m!339653))

(assert (=> b!220965 d!74383))

(declare-fun d!74391 () Bool)

(declare-fun e!150045 () Bool)

(assert (=> d!74391 e!150045))

(declare-fun res!186092 () Bool)

(assert (=> d!74391 (=> (not res!186092) (not e!150045))))

(declare-fun lt!348715 () (_ BitVec 64))

(declare-fun lt!348714 () BitStream!8594)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> d!74391 (= res!186092 (= (bvadd lt!348715 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4743 (buf!5290 lt!348714)) (currentByte!9926 lt!348714) (currentBit!9921 lt!348714))))))

(assert (=> d!74391 (or (not (= (bvand lt!348715 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!348715 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!348715 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74391 (= lt!348715 (bitIndex!0 (size!4743 (buf!5290 bs!62)) (currentByte!9926 bs!62) (currentBit!9921 bs!62)))))

(declare-datatypes ((Unit!15617 0))(
  ( (Unit!15618) )
))
(declare-datatypes ((tuple2!18982 0))(
  ( (tuple2!18983 (_1!10149 Unit!15617) (_2!10149 BitStream!8594)) )
))
(declare-fun moveBitIndex!0 (BitStream!8594 (_ BitVec 64)) tuple2!18982)

(assert (=> d!74391 (= lt!348714 (_2!10149 (moveBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!8594 (_ BitVec 64)) Bool)

(assert (=> d!74391 (moveBitIndexPrecond!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!74391 (= (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001) lt!348714)))

(declare-fun b!220977 () Bool)

(assert (=> b!220977 (= e!150045 (= (size!4743 (buf!5290 bs!62)) (size!4743 (buf!5290 lt!348714))))))

(assert (= (and d!74391 res!186092) b!220977))

(declare-fun m!339657 () Bool)

(assert (=> d!74391 m!339657))

(declare-fun m!339659 () Bool)

(assert (=> d!74391 m!339659))

(declare-fun m!339661 () Bool)

(assert (=> d!74391 m!339661))

(declare-fun m!339663 () Bool)

(assert (=> d!74391 m!339663))

(assert (=> b!220965 d!74391))

(declare-fun d!74393 () Bool)

(declare-datatypes ((tuple2!18984 0))(
  ( (tuple2!18985 (_1!10150 Bool) (_2!10150 BitStream!8594)) )
))
(declare-fun lt!348718 () tuple2!18984)

(declare-fun readBit!0 (BitStream!8594) tuple2!18984)

(assert (=> d!74393 (= lt!348718 (readBit!0 bs!62))))

(assert (=> d!74393 (= (readBitPure!0 bs!62) (tuple2!18967 (_2!10150 lt!348718) (_1!10150 lt!348718)))))

(declare-fun bs!18208 () Bool)

(assert (= bs!18208 d!74393))

(declare-fun m!339665 () Bool)

(assert (=> bs!18208 m!339665))

(assert (=> b!220965 d!74393))

(declare-fun d!74395 () Bool)

(declare-fun lt!348719 () tuple2!18980)

(assert (=> d!74395 (= lt!348719 (readNBitsLSBFirstsLoop!0 bs!62 nBits!265 i!541 acc!113))))

(assert (=> d!74395 (= (readNBitsLSBFirstsLoopPure!0 bs!62 nBits!265 i!541 acc!113) (tuple2!18965 (_2!10148 lt!348719) (_1!10148 lt!348719)))))

(declare-fun bs!18209 () Bool)

(assert (= bs!18209 d!74395))

(declare-fun m!339667 () Bool)

(assert (=> bs!18209 m!339667))

(assert (=> b!220965 d!74395))

(declare-fun d!74397 () Bool)

(assert (=> d!74397 (= (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!541)) (ite (= (bvsub #b00000000000000000000000001000000 i!541) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000 (bvshl #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub #b00000000000000000000000001000000 i!541))))))))

(assert (=> b!220966 d!74397))

(declare-fun d!74399 () Bool)

(assert (=> d!74399 (= (array_inv!4484 (buf!5290 bs!62)) (bvsge (size!4743 (buf!5290 bs!62)) #b00000000000000000000000000000000))))

(assert (=> b!220967 d!74399))

(declare-fun d!74401 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!74401 (= (inv!12 bs!62) (invariant!0 (currentBit!9921 bs!62) (currentByte!9926 bs!62) (size!4743 (buf!5290 bs!62))))))

(declare-fun bs!18210 () Bool)

(assert (= bs!18210 d!74401))

(declare-fun m!339669 () Bool)

(assert (=> bs!18210 m!339669))

(assert (=> start!45686 d!74401))

(declare-fun d!74403 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!74403 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4743 (buf!5290 bs!62))) ((_ sign_extend 32) (currentByte!9926 bs!62)) ((_ sign_extend 32) (currentBit!9921 bs!62)) ((_ sign_extend 32) (bvsub nBits!265 i!541))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4743 (buf!5290 bs!62))) ((_ sign_extend 32) (currentByte!9926 bs!62)) ((_ sign_extend 32) (currentBit!9921 bs!62))) ((_ sign_extend 32) (bvsub nBits!265 i!541))))))

(declare-fun bs!18211 () Bool)

(assert (= bs!18211 d!74403))

(declare-fun m!339671 () Bool)

(assert (=> bs!18211 m!339671))

(assert (=> b!220964 d!74403))

(push 1)

(assert (not d!74403))

(assert (not d!74393))

(assert (not d!74401))

(assert (not d!74395))

(assert (not d!74383))

(assert (not d!74391))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!74429 () Bool)

(declare-fun e!150088 () Bool)

(assert (=> d!74429 e!150088))

(declare-fun res!186141 () Bool)

(assert (=> d!74429 (=> (not res!186141) (not e!150088))))

(declare-fun increaseBitIndex!0 (BitStream!8594) tuple2!18982)

(assert (=> d!74429 (= res!186141 (= (buf!5290 (_2!10149 (increaseBitIndex!0 bs!62))) (buf!5290 bs!62)))))

(declare-fun lt!348857 () Bool)

(assert (=> d!74429 (= lt!348857 (not (= (bvand ((_ sign_extend 24) (select (arr!5673 (buf!5290 bs!62)) (currentByte!9926 bs!62))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9921 bs!62)))) #b00000000000000000000000000000000)))))

(declare-fun lt!348859 () tuple2!18984)

(assert (=> d!74429 (= lt!348859 (tuple2!18985 (not (= (bvand ((_ sign_extend 24) (select (arr!5673 (buf!5290 bs!62)) (currentByte!9926 bs!62))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9921 bs!62)))) #b00000000000000000000000000000000)) (_2!10149 (increaseBitIndex!0 bs!62))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!74429 (validate_offset_bit!0 ((_ sign_extend 32) (size!4743 (buf!5290 bs!62))) ((_ sign_extend 32) (currentByte!9926 bs!62)) ((_ sign_extend 32) (currentBit!9921 bs!62)))))

(assert (=> d!74429 (= (readBit!0 bs!62) lt!348859)))

(declare-fun lt!348862 () (_ BitVec 64))

(declare-fun lt!348860 () (_ BitVec 64))

(declare-fun b!221032 () Bool)

(assert (=> b!221032 (= e!150088 (= (bitIndex!0 (size!4743 (buf!5290 (_2!10149 (increaseBitIndex!0 bs!62)))) (currentByte!9926 (_2!10149 (increaseBitIndex!0 bs!62))) (currentBit!9921 (_2!10149 (increaseBitIndex!0 bs!62)))) (bvadd lt!348862 lt!348860)))))

(assert (=> b!221032 (or (not (= (bvand lt!348862 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!348860 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!348862 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!348862 lt!348860) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!221032 (= lt!348860 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!221032 (= lt!348862 (bitIndex!0 (size!4743 (buf!5290 bs!62)) (currentByte!9926 bs!62) (currentBit!9921 bs!62)))))

(declare-fun lt!348863 () Bool)

(assert (=> b!221032 (= lt!348863 (not (= (bvand ((_ sign_extend 24) (select (arr!5673 (buf!5290 bs!62)) (currentByte!9926 bs!62))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9921 bs!62)))) #b00000000000000000000000000000000)))))

(declare-fun lt!348858 () Bool)

(assert (=> b!221032 (= lt!348858 (not (= (bvand ((_ sign_extend 24) (select (arr!5673 (buf!5290 bs!62)) (currentByte!9926 bs!62))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9921 bs!62)))) #b00000000000000000000000000000000)))))

(declare-fun lt!348861 () Bool)

(assert (=> b!221032 (= lt!348861 (not (= (bvand ((_ sign_extend 24) (select (arr!5673 (buf!5290 bs!62)) (currentByte!9926 bs!62))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9921 bs!62)))) #b00000000000000000000000000000000)))))

(assert (= (and d!74429 res!186141) b!221032))

(declare-fun m!339703 () Bool)

(assert (=> d!74429 m!339703))

(declare-fun m!339705 () Bool)

(assert (=> d!74429 m!339705))

(declare-fun m!339707 () Bool)

(assert (=> d!74429 m!339707))

(declare-fun m!339709 () Bool)

(assert (=> d!74429 m!339709))

(assert (=> b!221032 m!339659))

(assert (=> b!221032 m!339705))

(assert (=> b!221032 m!339703))

(declare-fun m!339711 () Bool)

(assert (=> b!221032 m!339711))

(assert (=> b!221032 m!339707))

(assert (=> d!74393 d!74429))

(declare-fun d!74435 () Bool)

(assert (=> d!74435 (= (invariant!0 (currentBit!9921 bs!62) (currentByte!9926 bs!62) (size!4743 (buf!5290 bs!62))) (and (bvsge (currentBit!9921 bs!62) #b00000000000000000000000000000000) (bvslt (currentBit!9921 bs!62) #b00000000000000000000000000001000) (bvsge (currentByte!9926 bs!62) #b00000000000000000000000000000000) (or (bvslt (currentByte!9926 bs!62) (size!4743 (buf!5290 bs!62))) (and (= (currentBit!9921 bs!62) #b00000000000000000000000000000000) (= (currentByte!9926 bs!62) (size!4743 (buf!5290 bs!62)))))))))

(assert (=> d!74401 d!74435))

(declare-fun b!221065 () Bool)

(declare-fun res!186169 () Bool)

(declare-fun e!150113 () Bool)

(assert (=> b!221065 (=> (not res!186169) (not e!150113))))

(declare-fun lt!348911 () tuple2!18980)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!221065 (= res!186169 (= (bvand (_1!10148 lt!348911) (onesLSBLong!0 i!541)) (bvand acc!113 (onesLSBLong!0 i!541))))))

(declare-fun b!221066 () Bool)

(declare-fun res!186167 () Bool)

(assert (=> b!221066 (=> (not res!186167) (not e!150113))))

(assert (=> b!221066 (= res!186167 (= (bvand (_1!10148 lt!348911) (onesLSBLong!0 nBits!265)) (_1!10148 lt!348911)))))

(declare-fun e!150112 () Bool)

(declare-fun b!221067 () Bool)

(declare-fun lt!348909 () (_ BitVec 64))

(assert (=> b!221067 (= e!150112 (= (= (bvand (bvlshr (_1!10148 lt!348911) lt!348909) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!10141 (readBitPure!0 bs!62))))))

(assert (=> b!221067 (and (bvsge lt!348909 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!348909 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!221067 (= lt!348909 ((_ sign_extend 32) i!541))))

(declare-fun b!221068 () Bool)

(declare-fun e!150111 () tuple2!18980)

(declare-fun lt!348913 () tuple2!18980)

(assert (=> b!221068 (= e!150111 (tuple2!18981 (_1!10148 lt!348913) (_2!10148 lt!348913)))))

(declare-fun lt!348914 () tuple2!18984)

(assert (=> b!221068 (= lt!348914 (readBit!0 bs!62))))

(assert (=> b!221068 (= lt!348913 (readNBitsLSBFirstsLoop!0 (_2!10150 lt!348914) nBits!265 (bvadd i!541 #b00000000000000000000000000000001) (bvor acc!113 (ite (_1!10150 lt!348914) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!541)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!74437 () Bool)

(assert (=> d!74437 e!150113))

(declare-fun res!186168 () Bool)

(assert (=> d!74437 (=> (not res!186168) (not e!150113))))

(assert (=> d!74437 (= res!186168 (= (buf!5290 (_2!10148 lt!348911)) (buf!5290 bs!62)))))

(assert (=> d!74437 (= lt!348911 e!150111)))

(declare-fun c!10710 () Bool)

(assert (=> d!74437 (= c!10710 (= nBits!265 i!541))))

(assert (=> d!74437 (and (bvsle #b00000000000000000000000000000000 i!541) (bvsle i!541 nBits!265) (bvsle nBits!265 #b00000000000000000000000001000000))))

(assert (=> d!74437 (= (readNBitsLSBFirstsLoop!0 bs!62 nBits!265 i!541 acc!113) lt!348911)))

(declare-fun b!221069 () Bool)

(assert (=> b!221069 (= e!150111 (tuple2!18981 acc!113 bs!62))))

(declare-fun b!221070 () Bool)

(declare-fun res!186166 () Bool)

(assert (=> b!221070 (=> (not res!186166) (not e!150113))))

(declare-fun lt!348912 () (_ BitVec 64))

(declare-fun lt!348910 () (_ BitVec 64))

(assert (=> b!221070 (= res!186166 (= (bitIndex!0 (size!4743 (buf!5290 (_2!10148 lt!348911))) (currentByte!9926 (_2!10148 lt!348911)) (currentBit!9921 (_2!10148 lt!348911))) (bvadd lt!348912 lt!348910)))))

(assert (=> b!221070 (or (not (= (bvand lt!348912 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!348910 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!348912 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!348912 lt!348910) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!221070 (= lt!348910 ((_ sign_extend 32) (bvsub nBits!265 i!541)))))

(assert (=> b!221070 (or (= (bvand nBits!265 #b10000000000000000000000000000000) (bvand i!541 #b10000000000000000000000000000000)) (= (bvand nBits!265 #b10000000000000000000000000000000) (bvand (bvsub nBits!265 i!541) #b10000000000000000000000000000000)))))

(assert (=> b!221070 (= lt!348912 (bitIndex!0 (size!4743 (buf!5290 bs!62)) (currentByte!9926 bs!62) (currentBit!9921 bs!62)))))

(declare-fun b!221071 () Bool)

(assert (=> b!221071 (= e!150113 e!150112)))

(declare-fun res!186170 () Bool)

(assert (=> b!221071 (=> res!186170 e!150112)))

(assert (=> b!221071 (= res!186170 (not (bvslt i!541 nBits!265)))))

(assert (= (and d!74437 c!10710) b!221069))

(assert (= (and d!74437 (not c!10710)) b!221068))

(assert (= (and d!74437 res!186168) b!221070))

(assert (= (and b!221070 res!186166) b!221065))

(assert (= (and b!221065 res!186169) b!221066))

(assert (= (and b!221066 res!186167) b!221071))

(assert (= (and b!221071 (not res!186170)) b!221067))

(declare-fun m!339735 () Bool)

(assert (=> b!221070 m!339735))

(assert (=> b!221070 m!339659))

(declare-fun m!339737 () Bool)

(assert (=> b!221066 m!339737))

(declare-fun m!339739 () Bool)

(assert (=> b!221065 m!339739))

(assert (=> b!221068 m!339665))

(declare-fun m!339741 () Bool)

(assert (=> b!221068 m!339741))

(assert (=> b!221067 m!339615))

(assert (=> d!74395 d!74437))

(declare-fun b!221072 () Bool)

(declare-fun res!186174 () Bool)

(declare-fun e!150116 () Bool)

(assert (=> b!221072 (=> (not res!186174) (not e!150116))))

(declare-fun lt!348917 () tuple2!18980)

(assert (=> b!221072 (= res!186174 (= (bvand (_1!10148 lt!348917) (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!541))) (bvand (bvor acc!113 e!150033) (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!541)))))))

(declare-fun b!221073 () Bool)

(declare-fun res!186172 () Bool)

(assert (=> b!221073 (=> (not res!186172) (not e!150116))))

(assert (=> b!221073 (= res!186172 (= (bvand (_1!10148 lt!348917) (onesLSBLong!0 nBits!265)) (_1!10148 lt!348917)))))

(declare-fun b!221074 () Bool)

(declare-fun e!150115 () Bool)

(declare-fun lt!348915 () (_ BitVec 64))

(assert (=> b!221074 (= e!150115 (= (= (bvand (bvlshr (_1!10148 lt!348917) lt!348915) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!10141 (readBitPure!0 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)))))))

(assert (=> b!221074 (and (bvsge lt!348915 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!348915 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!221074 (= lt!348915 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!541)))))

(declare-fun b!221075 () Bool)

(declare-fun e!150114 () tuple2!18980)

(declare-fun lt!348919 () tuple2!18980)

(assert (=> b!221075 (= e!150114 (tuple2!18981 (_1!10148 lt!348919) (_2!10148 lt!348919)))))

(declare-fun lt!348920 () tuple2!18984)

(assert (=> b!221075 (= lt!348920 (readBit!0 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!221075 (= lt!348919 (readNBitsLSBFirstsLoop!0 (_2!10150 lt!348920) nBits!265 (bvadd #b00000000000000000000000000000001 i!541 #b00000000000000000000000000000001) (bvor (bvor acc!113 e!150033) (ite (_1!10150 lt!348920) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!541))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!74445 () Bool)

(assert (=> d!74445 e!150116))

(declare-fun res!186173 () Bool)

(assert (=> d!74445 (=> (not res!186173) (not e!150116))))

(assert (=> d!74445 (= res!186173 (= (buf!5290 (_2!10148 lt!348917)) (buf!5290 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> d!74445 (= lt!348917 e!150114)))

(declare-fun c!10711 () Bool)

(assert (=> d!74445 (= c!10711 (= nBits!265 (bvadd #b00000000000000000000000000000001 i!541)))))

(assert (=> d!74445 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!541)) (bvsle (bvadd #b00000000000000000000000000000001 i!541) nBits!265) (bvsle nBits!265 #b00000000000000000000000001000000))))

(assert (=> d!74445 (= (readNBitsLSBFirstsLoop!0 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!265 (bvadd #b00000000000000000000000000000001 i!541) (bvor acc!113 e!150033)) lt!348917)))

(declare-fun b!221076 () Bool)

(assert (=> b!221076 (= e!150114 (tuple2!18981 (bvor acc!113 e!150033) (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!221077 () Bool)

(declare-fun res!186171 () Bool)

(assert (=> b!221077 (=> (not res!186171) (not e!150116))))

(declare-fun lt!348918 () (_ BitVec 64))

(declare-fun lt!348916 () (_ BitVec 64))

(assert (=> b!221077 (= res!186171 (= (bitIndex!0 (size!4743 (buf!5290 (_2!10148 lt!348917))) (currentByte!9926 (_2!10148 lt!348917)) (currentBit!9921 (_2!10148 lt!348917))) (bvadd lt!348918 lt!348916)))))

(assert (=> b!221077 (or (not (= (bvand lt!348918 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!348916 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!348918 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!348918 lt!348916) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!221077 (= lt!348916 ((_ sign_extend 32) (bvsub nBits!265 (bvadd #b00000000000000000000000000000001 i!541))))))

(assert (=> b!221077 (or (= (bvand nBits!265 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!541) #b10000000000000000000000000000000)) (= (bvand nBits!265 #b10000000000000000000000000000000) (bvand (bvsub nBits!265 (bvadd #b00000000000000000000000000000001 i!541)) #b10000000000000000000000000000000)))))

(assert (=> b!221077 (= lt!348918 (bitIndex!0 (size!4743 (buf!5290 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))) (currentByte!9926 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)) (currentBit!9921 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!221078 () Bool)

(assert (=> b!221078 (= e!150116 e!150115)))

(declare-fun res!186175 () Bool)

(assert (=> b!221078 (=> res!186175 e!150115)))

(assert (=> b!221078 (= res!186175 (not (bvslt (bvadd #b00000000000000000000000000000001 i!541) nBits!265)))))

(assert (= (and d!74445 c!10711) b!221076))

(assert (= (and d!74445 (not c!10711)) b!221075))

(assert (= (and d!74445 res!186173) b!221077))

(assert (= (and b!221077 res!186171) b!221072))

(assert (= (and b!221072 res!186174) b!221073))

(assert (= (and b!221073 res!186172) b!221078))

(assert (= (and b!221078 (not res!186175)) b!221074))

(declare-fun m!339743 () Bool)

(assert (=> b!221077 m!339743))

(declare-fun m!339745 () Bool)

(assert (=> b!221077 m!339745))

(assert (=> b!221073 m!339737))

(declare-fun m!339747 () Bool)

(assert (=> b!221072 m!339747))

(assert (=> b!221075 m!339611))

(declare-fun m!339749 () Bool)

(assert (=> b!221075 m!339749))

(declare-fun m!339751 () Bool)

(assert (=> b!221075 m!339751))

(assert (=> b!221074 m!339611))

(declare-fun m!339753 () Bool)

(assert (=> b!221074 m!339753))

(assert (=> d!74383 d!74445))

(declare-fun d!74447 () Bool)

(declare-fun e!150119 () Bool)

(assert (=> d!74447 e!150119))

(declare-fun res!186181 () Bool)

(assert (=> d!74447 (=> (not res!186181) (not e!150119))))

(declare-fun lt!348935 () (_ BitVec 64))

(declare-fun lt!348938 () (_ BitVec 64))

(declare-fun lt!348936 () (_ BitVec 64))

(assert (=> d!74447 (= res!186181 (= lt!348936 (bvsub lt!348938 lt!348935)))))

(assert (=> d!74447 (or (= (bvand lt!348938 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!348935 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!348938 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!348938 lt!348935) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74447 (= lt!348935 (remainingBits!0 ((_ sign_extend 32) (size!4743 (buf!5290 lt!348714))) ((_ sign_extend 32) (currentByte!9926 lt!348714)) ((_ sign_extend 32) (currentBit!9921 lt!348714))))))

(declare-fun lt!348937 () (_ BitVec 64))

(declare-fun lt!348933 () (_ BitVec 64))

(assert (=> d!74447 (= lt!348938 (bvmul lt!348937 lt!348933))))

(assert (=> d!74447 (or (= lt!348937 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!348933 (bvsdiv (bvmul lt!348937 lt!348933) lt!348937)))))

(assert (=> d!74447 (= lt!348933 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!74447 (= lt!348937 ((_ sign_extend 32) (size!4743 (buf!5290 lt!348714))))))

(assert (=> d!74447 (= lt!348936 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9926 lt!348714)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9921 lt!348714))))))

(assert (=> d!74447 (invariant!0 (currentBit!9921 lt!348714) (currentByte!9926 lt!348714) (size!4743 (buf!5290 lt!348714)))))

(assert (=> d!74447 (= (bitIndex!0 (size!4743 (buf!5290 lt!348714)) (currentByte!9926 lt!348714) (currentBit!9921 lt!348714)) lt!348936)))

(declare-fun b!221083 () Bool)

(declare-fun res!186180 () Bool)

(assert (=> b!221083 (=> (not res!186180) (not e!150119))))

(assert (=> b!221083 (= res!186180 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!348936))))

(declare-fun b!221084 () Bool)

(declare-fun lt!348934 () (_ BitVec 64))

(assert (=> b!221084 (= e!150119 (bvsle lt!348936 (bvmul lt!348934 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!221084 (or (= lt!348934 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!348934 #b0000000000000000000000000000000000000000000000000000000000001000) lt!348934)))))

(assert (=> b!221084 (= lt!348934 ((_ sign_extend 32) (size!4743 (buf!5290 lt!348714))))))

(assert (= (and d!74447 res!186181) b!221083))

(assert (= (and b!221083 res!186180) b!221084))

(declare-fun m!339755 () Bool)

(assert (=> d!74447 m!339755))

(declare-fun m!339757 () Bool)

(assert (=> d!74447 m!339757))

(assert (=> d!74391 d!74447))

(declare-fun d!74449 () Bool)

(declare-fun e!150120 () Bool)

(assert (=> d!74449 e!150120))

(declare-fun res!186183 () Bool)

(assert (=> d!74449 (=> (not res!186183) (not e!150120))))

(declare-fun lt!348942 () (_ BitVec 64))

(declare-fun lt!348941 () (_ BitVec 64))

(declare-fun lt!348944 () (_ BitVec 64))

(assert (=> d!74449 (= res!186183 (= lt!348942 (bvsub lt!348944 lt!348941)))))

(assert (=> d!74449 (or (= (bvand lt!348944 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!348941 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!348944 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!348944 lt!348941) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74449 (= lt!348941 (remainingBits!0 ((_ sign_extend 32) (size!4743 (buf!5290 bs!62))) ((_ sign_extend 32) (currentByte!9926 bs!62)) ((_ sign_extend 32) (currentBit!9921 bs!62))))))

(declare-fun lt!348943 () (_ BitVec 64))

(declare-fun lt!348939 () (_ BitVec 64))

(assert (=> d!74449 (= lt!348944 (bvmul lt!348943 lt!348939))))

(assert (=> d!74449 (or (= lt!348943 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!348939 (bvsdiv (bvmul lt!348943 lt!348939) lt!348943)))))

(assert (=> d!74449 (= lt!348939 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!74449 (= lt!348943 ((_ sign_extend 32) (size!4743 (buf!5290 bs!62))))))

(assert (=> d!74449 (= lt!348942 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9926 bs!62)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9921 bs!62))))))

(assert (=> d!74449 (invariant!0 (currentBit!9921 bs!62) (currentByte!9926 bs!62) (size!4743 (buf!5290 bs!62)))))

(assert (=> d!74449 (= (bitIndex!0 (size!4743 (buf!5290 bs!62)) (currentByte!9926 bs!62) (currentBit!9921 bs!62)) lt!348942)))

(declare-fun b!221085 () Bool)

(declare-fun res!186182 () Bool)

(assert (=> b!221085 (=> (not res!186182) (not e!150120))))

(assert (=> b!221085 (= res!186182 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!348942))))

(declare-fun b!221086 () Bool)

(declare-fun lt!348940 () (_ BitVec 64))

(assert (=> b!221086 (= e!150120 (bvsle lt!348942 (bvmul lt!348940 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!221086 (or (= lt!348940 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!348940 #b0000000000000000000000000000000000000000000000000000000000001000) lt!348940)))))

(assert (=> b!221086 (= lt!348940 ((_ sign_extend 32) (size!4743 (buf!5290 bs!62))))))

(assert (= (and d!74449 res!186183) b!221085))

(assert (= (and b!221085 res!186182) b!221086))

(assert (=> d!74449 m!339671))

(assert (=> d!74449 m!339669))

(assert (=> d!74391 d!74449))

(declare-fun d!74451 () Bool)

(declare-fun lt!348982 () (_ BitVec 32))

(assert (=> d!74451 (= lt!348982 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!348986 () (_ BitVec 32))

(assert (=> d!74451 (= lt!348986 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!150138 () Bool)

(assert (=> d!74451 e!150138))

(declare-fun res!186209 () Bool)

(assert (=> d!74451 (=> (not res!186209) (not e!150138))))

(assert (=> d!74451 (= res!186209 (moveBitIndexPrecond!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun Unit!15631 () Unit!15617)

(declare-fun Unit!15632 () Unit!15617)

(declare-fun Unit!15633 () Unit!15617)

(assert (=> d!74451 (= (moveBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001) (ite (bvslt (bvadd (currentBit!9921 bs!62) lt!348982) #b00000000000000000000000000000000) (tuple2!18983 Unit!15631 (BitStream!8595 (buf!5290 bs!62) (bvsub (bvadd (currentByte!9926 bs!62) lt!348986) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!348982 (currentBit!9921 bs!62)))) (ite (bvsge (bvadd (currentBit!9921 bs!62) lt!348982) #b00000000000000000000000000001000) (tuple2!18983 Unit!15632 (BitStream!8595 (buf!5290 bs!62) (bvadd (currentByte!9926 bs!62) lt!348986 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!9921 bs!62) lt!348982) #b00000000000000000000000000001000))) (tuple2!18983 Unit!15633 (BitStream!8595 (buf!5290 bs!62) (bvadd (currentByte!9926 bs!62) lt!348986) (bvadd (currentBit!9921 bs!62) lt!348982))))))))

(declare-fun b!221119 () Bool)

(declare-fun e!150137 () Bool)

(assert (=> b!221119 (= e!150138 e!150137)))

(declare-fun res!186208 () Bool)

(assert (=> b!221119 (=> (not res!186208) (not e!150137))))

(declare-fun lt!348984 () (_ BitVec 64))

(declare-fun lt!348981 () tuple2!18982)

(assert (=> b!221119 (= res!186208 (= (bvadd lt!348984 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4743 (buf!5290 (_2!10149 lt!348981))) (currentByte!9926 (_2!10149 lt!348981)) (currentBit!9921 (_2!10149 lt!348981)))))))

(assert (=> b!221119 (or (not (= (bvand lt!348984 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!348984 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!348984 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!221119 (= lt!348984 (bitIndex!0 (size!4743 (buf!5290 bs!62)) (currentByte!9926 bs!62) (currentBit!9921 bs!62)))))

(declare-fun lt!348985 () (_ BitVec 32))

(declare-fun lt!348983 () (_ BitVec 32))

(declare-fun Unit!15634 () Unit!15617)

(declare-fun Unit!15635 () Unit!15617)

(declare-fun Unit!15636 () Unit!15617)

(assert (=> b!221119 (= lt!348981 (ite (bvslt (bvadd (currentBit!9921 bs!62) lt!348983) #b00000000000000000000000000000000) (tuple2!18983 Unit!15634 (BitStream!8595 (buf!5290 bs!62) (bvsub (bvadd (currentByte!9926 bs!62) lt!348985) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!348983 (currentBit!9921 bs!62)))) (ite (bvsge (bvadd (currentBit!9921 bs!62) lt!348983) #b00000000000000000000000000001000) (tuple2!18983 Unit!15635 (BitStream!8595 (buf!5290 bs!62) (bvadd (currentByte!9926 bs!62) lt!348985 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!9921 bs!62) lt!348983) #b00000000000000000000000000001000))) (tuple2!18983 Unit!15636 (BitStream!8595 (buf!5290 bs!62) (bvadd (currentByte!9926 bs!62) lt!348985) (bvadd (currentBit!9921 bs!62) lt!348983))))))))

(assert (=> b!221119 (= lt!348983 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!221119 (= lt!348985 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!221120 () Bool)

(assert (=> b!221120 (= e!150137 (and (= (size!4743 (buf!5290 bs!62)) (size!4743 (buf!5290 (_2!10149 lt!348981)))) (= (buf!5290 bs!62) (buf!5290 (_2!10149 lt!348981)))))))

(assert (= (and d!74451 res!186209) b!221119))

(assert (= (and b!221119 res!186208) b!221120))

(assert (=> d!74451 m!339663))

(declare-fun m!339779 () Bool)

(assert (=> b!221119 m!339779))

(assert (=> b!221119 m!339659))

(assert (=> d!74391 d!74451))

(declare-fun d!74461 () Bool)

(declare-fun res!186212 () Bool)

(declare-fun e!150141 () Bool)

(assert (=> d!74461 (=> (not res!186212) (not e!150141))))

(assert (=> d!74461 (= res!186212 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!4743 (buf!5290 bs!62)))) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4743 (buf!5290 bs!62)))))))))

(assert (=> d!74461 (= (moveBitIndexPrecond!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001) e!150141)))

(declare-fun b!221124 () Bool)

(declare-fun lt!348989 () (_ BitVec 64))

(assert (=> b!221124 (= e!150141 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!348989) (bvsle lt!348989 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4743 (buf!5290 bs!62)))))))))

(assert (=> b!221124 (= lt!348989 (bvadd (bitIndex!0 (size!4743 (buf!5290 bs!62)) (currentByte!9926 bs!62) (currentBit!9921 bs!62)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (= (and d!74461 res!186212) b!221124))

(assert (=> b!221124 m!339659))

(assert (=> d!74391 d!74461))

(declare-fun d!74463 () Bool)

(assert (=> d!74463 (= (remainingBits!0 ((_ sign_extend 32) (size!4743 (buf!5290 bs!62))) ((_ sign_extend 32) (currentByte!9926 bs!62)) ((_ sign_extend 32) (currentBit!9921 bs!62))) (bvsub (bvmul ((_ sign_extend 32) (size!4743 (buf!5290 bs!62))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9926 bs!62)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9921 bs!62)))))))

(assert (=> d!74403 d!74463))

(push 1)

(assert (not d!74429))

(assert (not b!221124))

(assert (not b!221032))

(assert (not b!221067))

(assert (not d!74447))

(assert (not b!221066))

(assert (not b!221065))

(assert (not d!74451))

(assert (not b!221068))

(assert (not b!221073))

(assert (not b!221070))

(assert (not b!221075))

(assert (not b!221077))

(assert (not d!74449))

(assert (not b!221072))

(assert (not b!221119))

(assert (not b!221074))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!74497 () Bool)

(declare-fun e!150157 () Bool)

(assert (=> d!74497 e!150157))

(declare-fun res!186240 () Bool)

(assert (=> d!74497 (=> (not res!186240) (not e!150157))))

(assert (=> d!74497 (= res!186240 (= (buf!5290 (_2!10149 (increaseBitIndex!0 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)))) (buf!5290 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun lt!349055 () Bool)

(assert (=> d!74497 (= lt!349055 (not (= (bvand ((_ sign_extend 24) (select (arr!5673 (buf!5290 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))) (currentByte!9926 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9921 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))))) #b00000000000000000000000000000000)))))

(declare-fun lt!349057 () tuple2!18984)

(assert (=> d!74497 (= lt!349057 (tuple2!18985 (not (= (bvand ((_ sign_extend 24) (select (arr!5673 (buf!5290 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))) (currentByte!9926 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9921 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))))) #b00000000000000000000000000000000)) (_2!10149 (increaseBitIndex!0 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)))))))

(assert (=> d!74497 (validate_offset_bit!0 ((_ sign_extend 32) (size!4743 (buf!5290 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)))) ((_ sign_extend 32) (currentByte!9926 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))) ((_ sign_extend 32) (currentBit!9921 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> d!74497 (= (readBit!0 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)) lt!349057)))

(declare-fun b!221156 () Bool)

(declare-fun lt!349058 () (_ BitVec 64))

(declare-fun lt!349060 () (_ BitVec 64))

(assert (=> b!221156 (= e!150157 (= (bitIndex!0 (size!4743 (buf!5290 (_2!10149 (increaseBitIndex!0 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))))) (currentByte!9926 (_2!10149 (increaseBitIndex!0 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)))) (currentBit!9921 (_2!10149 (increaseBitIndex!0 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))))) (bvadd lt!349060 lt!349058)))))

(assert (=> b!221156 (or (not (= (bvand lt!349060 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!349058 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!349060 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!349060 lt!349058) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!221156 (= lt!349058 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!221156 (= lt!349060 (bitIndex!0 (size!4743 (buf!5290 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))) (currentByte!9926 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)) (currentBit!9921 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun lt!349061 () Bool)

(assert (=> b!221156 (= lt!349061 (not (= (bvand ((_ sign_extend 24) (select (arr!5673 (buf!5290 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))) (currentByte!9926 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9921 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))))) #b00000000000000000000000000000000)))))

(declare-fun lt!349056 () Bool)

(assert (=> b!221156 (= lt!349056 (not (= (bvand ((_ sign_extend 24) (select (arr!5673 (buf!5290 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))) (currentByte!9926 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9921 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))))) #b00000000000000000000000000000000)))))

(declare-fun lt!349059 () Bool)

(assert (=> b!221156 (= lt!349059 (not (= (bvand ((_ sign_extend 24) (select (arr!5673 (buf!5290 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))) (currentByte!9926 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9921 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))))) #b00000000000000000000000000000000)))))

(assert (= (and d!74497 res!186240) b!221156))

(assert (=> d!74497 m!339611))

(declare-fun m!339839 () Bool)

(assert (=> d!74497 m!339839))

(declare-fun m!339841 () Bool)

(assert (=> d!74497 m!339841))

(declare-fun m!339843 () Bool)

(assert (=> d!74497 m!339843))

(declare-fun m!339845 () Bool)

(assert (=> d!74497 m!339845))

(assert (=> b!221156 m!339745))

(assert (=> b!221156 m!339841))

(assert (=> b!221156 m!339611))

(assert (=> b!221156 m!339839))

(declare-fun m!339847 () Bool)

(assert (=> b!221156 m!339847))

(assert (=> b!221156 m!339843))

(assert (=> b!221075 d!74497))

(declare-fun b!221157 () Bool)

(declare-fun res!186244 () Bool)

(declare-fun e!150160 () Bool)

(assert (=> b!221157 (=> (not res!186244) (not e!150160))))

(declare-fun lt!349064 () tuple2!18980)

(assert (=> b!221157 (= res!186244 (= (bvand (_1!10148 lt!349064) (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!541 #b00000000000000000000000000000001))) (bvand (bvor (bvor acc!113 e!150033) (ite (_1!10150 lt!348920) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!541))) #b0000000000000000000000000000000000000000000000000000000000000000)) (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!541 #b00000000000000000000000000000001)))))))

(declare-fun b!221158 () Bool)

(declare-fun res!186242 () Bool)

(assert (=> b!221158 (=> (not res!186242) (not e!150160))))

(assert (=> b!221158 (= res!186242 (= (bvand (_1!10148 lt!349064) (onesLSBLong!0 nBits!265)) (_1!10148 lt!349064)))))

(declare-fun b!221159 () Bool)

(declare-fun lt!349062 () (_ BitVec 64))

(declare-fun e!150159 () Bool)

(assert (=> b!221159 (= e!150159 (= (= (bvand (bvlshr (_1!10148 lt!349064) lt!349062) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!10141 (readBitPure!0 (_2!10150 lt!348920)))))))

(assert (=> b!221159 (and (bvsge lt!349062 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!349062 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!221159 (= lt!349062 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!541 #b00000000000000000000000000000001)))))

(declare-fun b!221160 () Bool)

(declare-fun e!150158 () tuple2!18980)

(declare-fun lt!349066 () tuple2!18980)

(assert (=> b!221160 (= e!150158 (tuple2!18981 (_1!10148 lt!349066) (_2!10148 lt!349066)))))

(declare-fun lt!349067 () tuple2!18984)

(assert (=> b!221160 (= lt!349067 (readBit!0 (_2!10150 lt!348920)))))

(assert (=> b!221160 (= lt!349066 (readNBitsLSBFirstsLoop!0 (_2!10150 lt!349067) nBits!265 (bvadd #b00000000000000000000000000000001 i!541 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvor (bvor (bvor acc!113 e!150033) (ite (_1!10150 lt!348920) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!541))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite (_1!10150 lt!349067) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!541 #b00000000000000000000000000000001))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!74499 () Bool)

(assert (=> d!74499 e!150160))

(declare-fun res!186243 () Bool)

(assert (=> d!74499 (=> (not res!186243) (not e!150160))))

(assert (=> d!74499 (= res!186243 (= (buf!5290 (_2!10148 lt!349064)) (buf!5290 (_2!10150 lt!348920))))))

(assert (=> d!74499 (= lt!349064 e!150158)))

(declare-fun c!10718 () Bool)

(assert (=> d!74499 (= c!10718 (= nBits!265 (bvadd #b00000000000000000000000000000001 i!541 #b00000000000000000000000000000001)))))

(assert (=> d!74499 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!541 #b00000000000000000000000000000001)) (bvsle (bvadd #b00000000000000000000000000000001 i!541 #b00000000000000000000000000000001) nBits!265) (bvsle nBits!265 #b00000000000000000000000001000000))))

(assert (=> d!74499 (= (readNBitsLSBFirstsLoop!0 (_2!10150 lt!348920) nBits!265 (bvadd #b00000000000000000000000000000001 i!541 #b00000000000000000000000000000001) (bvor (bvor acc!113 e!150033) (ite (_1!10150 lt!348920) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!541))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!349064)))

(declare-fun b!221161 () Bool)

(assert (=> b!221161 (= e!150158 (tuple2!18981 (bvor (bvor acc!113 e!150033) (ite (_1!10150 lt!348920) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!541))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_2!10150 lt!348920)))))

(declare-fun b!221162 () Bool)

(declare-fun res!186241 () Bool)

(assert (=> b!221162 (=> (not res!186241) (not e!150160))))

(declare-fun lt!349065 () (_ BitVec 64))

(declare-fun lt!349063 () (_ BitVec 64))

(assert (=> b!221162 (= res!186241 (= (bitIndex!0 (size!4743 (buf!5290 (_2!10148 lt!349064))) (currentByte!9926 (_2!10148 lt!349064)) (currentBit!9921 (_2!10148 lt!349064))) (bvadd lt!349065 lt!349063)))))

(assert (=> b!221162 (or (not (= (bvand lt!349065 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!349063 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!349065 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!349065 lt!349063) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!221162 (= lt!349063 ((_ sign_extend 32) (bvsub nBits!265 (bvadd #b00000000000000000000000000000001 i!541 #b00000000000000000000000000000001))))))

(assert (=> b!221162 (or (= (bvand nBits!265 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!541 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!265 #b10000000000000000000000000000000) (bvand (bvsub nBits!265 (bvadd #b00000000000000000000000000000001 i!541 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!221162 (= lt!349065 (bitIndex!0 (size!4743 (buf!5290 (_2!10150 lt!348920))) (currentByte!9926 (_2!10150 lt!348920)) (currentBit!9921 (_2!10150 lt!348920))))))

(declare-fun b!221163 () Bool)

(assert (=> b!221163 (= e!150160 e!150159)))

(declare-fun res!186245 () Bool)

(assert (=> b!221163 (=> res!186245 e!150159)))

(assert (=> b!221163 (= res!186245 (not (bvslt (bvadd #b00000000000000000000000000000001 i!541 #b00000000000000000000000000000001) nBits!265)))))

(assert (= (and d!74499 c!10718) b!221161))

(assert (= (and d!74499 (not c!10718)) b!221160))

(assert (= (and d!74499 res!186243) b!221162))

(assert (= (and b!221162 res!186241) b!221157))

(assert (= (and b!221157 res!186244) b!221158))

(assert (= (and b!221158 res!186242) b!221163))

(assert (= (and b!221163 (not res!186245)) b!221159))

(declare-fun m!339849 () Bool)

(assert (=> b!221162 m!339849))

(declare-fun m!339851 () Bool)

(assert (=> b!221162 m!339851))

(assert (=> b!221158 m!339737))

(declare-fun m!339853 () Bool)

(assert (=> b!221157 m!339853))

(declare-fun m!339855 () Bool)

(assert (=> b!221160 m!339855))

(declare-fun m!339857 () Bool)

(assert (=> b!221160 m!339857))

(declare-fun m!339859 () Bool)

(assert (=> b!221159 m!339859))

(assert (=> b!221075 d!74499))

(assert (=> b!221068 d!74429))

(declare-fun b!221164 () Bool)

(declare-fun res!186249 () Bool)

(declare-fun e!150163 () Bool)

(assert (=> b!221164 (=> (not res!186249) (not e!150163))))

(declare-fun lt!349070 () tuple2!18980)

(assert (=> b!221164 (= res!186249 (= (bvand (_1!10148 lt!349070) (onesLSBLong!0 (bvadd i!541 #b00000000000000000000000000000001))) (bvand (bvor acc!113 (ite (_1!10150 lt!348914) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!541)) #b0000000000000000000000000000000000000000000000000000000000000000)) (onesLSBLong!0 (bvadd i!541 #b00000000000000000000000000000001)))))))

(declare-fun b!221165 () Bool)

(declare-fun res!186247 () Bool)

(assert (=> b!221165 (=> (not res!186247) (not e!150163))))

(assert (=> b!221165 (= res!186247 (= (bvand (_1!10148 lt!349070) (onesLSBLong!0 nBits!265)) (_1!10148 lt!349070)))))

(declare-fun b!221166 () Bool)

(declare-fun lt!349068 () (_ BitVec 64))

(declare-fun e!150162 () Bool)

(assert (=> b!221166 (= e!150162 (= (= (bvand (bvlshr (_1!10148 lt!349070) lt!349068) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!10141 (readBitPure!0 (_2!10150 lt!348914)))))))

(assert (=> b!221166 (and (bvsge lt!349068 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!349068 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!221166 (= lt!349068 ((_ sign_extend 32) (bvadd i!541 #b00000000000000000000000000000001)))))

(declare-fun b!221167 () Bool)

(declare-fun e!150161 () tuple2!18980)

(declare-fun lt!349072 () tuple2!18980)

(assert (=> b!221167 (= e!150161 (tuple2!18981 (_1!10148 lt!349072) (_2!10148 lt!349072)))))

(declare-fun lt!349073 () tuple2!18984)

(assert (=> b!221167 (= lt!349073 (readBit!0 (_2!10150 lt!348914)))))

(assert (=> b!221167 (= lt!349072 (readNBitsLSBFirstsLoop!0 (_2!10150 lt!349073) nBits!265 (bvadd i!541 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvor (bvor acc!113 (ite (_1!10150 lt!348914) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!541)) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite (_1!10150 lt!349073) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd i!541 #b00000000000000000000000000000001))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!74501 () Bool)

(assert (=> d!74501 e!150163))

(declare-fun res!186248 () Bool)

(assert (=> d!74501 (=> (not res!186248) (not e!150163))))

(assert (=> d!74501 (= res!186248 (= (buf!5290 (_2!10148 lt!349070)) (buf!5290 (_2!10150 lt!348914))))))

(assert (=> d!74501 (= lt!349070 e!150161)))

(declare-fun c!10719 () Bool)

(assert (=> d!74501 (= c!10719 (= nBits!265 (bvadd i!541 #b00000000000000000000000000000001)))))

(assert (=> d!74501 (and (bvsle #b00000000000000000000000000000000 (bvadd i!541 #b00000000000000000000000000000001)) (bvsle (bvadd i!541 #b00000000000000000000000000000001) nBits!265) (bvsle nBits!265 #b00000000000000000000000001000000))))

(assert (=> d!74501 (= (readNBitsLSBFirstsLoop!0 (_2!10150 lt!348914) nBits!265 (bvadd i!541 #b00000000000000000000000000000001) (bvor acc!113 (ite (_1!10150 lt!348914) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!541)) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!349070)))

(declare-fun b!221168 () Bool)

(assert (=> b!221168 (= e!150161 (tuple2!18981 (bvor acc!113 (ite (_1!10150 lt!348914) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!541)) #b0000000000000000000000000000000000000000000000000000000000000000)) (_2!10150 lt!348914)))))

(declare-fun b!221169 () Bool)

(declare-fun res!186246 () Bool)

(assert (=> b!221169 (=> (not res!186246) (not e!150163))))

(declare-fun lt!349071 () (_ BitVec 64))

(declare-fun lt!349069 () (_ BitVec 64))

(assert (=> b!221169 (= res!186246 (= (bitIndex!0 (size!4743 (buf!5290 (_2!10148 lt!349070))) (currentByte!9926 (_2!10148 lt!349070)) (currentBit!9921 (_2!10148 lt!349070))) (bvadd lt!349071 lt!349069)))))

(assert (=> b!221169 (or (not (= (bvand lt!349071 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!349069 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!349071 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!349071 lt!349069) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!221169 (= lt!349069 ((_ sign_extend 32) (bvsub nBits!265 (bvadd i!541 #b00000000000000000000000000000001))))))

(assert (=> b!221169 (or (= (bvand nBits!265 #b10000000000000000000000000000000) (bvand (bvadd i!541 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!265 #b10000000000000000000000000000000) (bvand (bvsub nBits!265 (bvadd i!541 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!221169 (= lt!349071 (bitIndex!0 (size!4743 (buf!5290 (_2!10150 lt!348914))) (currentByte!9926 (_2!10150 lt!348914)) (currentBit!9921 (_2!10150 lt!348914))))))

(declare-fun b!221170 () Bool)

(assert (=> b!221170 (= e!150163 e!150162)))

(declare-fun res!186250 () Bool)

(assert (=> b!221170 (=> res!186250 e!150162)))

(assert (=> b!221170 (= res!186250 (not (bvslt (bvadd i!541 #b00000000000000000000000000000001) nBits!265)))))

(assert (= (and d!74501 c!10719) b!221168))

(assert (= (and d!74501 (not c!10719)) b!221167))

(assert (= (and d!74501 res!186248) b!221169))

(assert (= (and b!221169 res!186246) b!221164))

(assert (= (and b!221164 res!186249) b!221165))

(assert (= (and b!221165 res!186247) b!221170))

(assert (= (and b!221170 (not res!186250)) b!221166))

(declare-fun m!339861 () Bool)

(assert (=> b!221169 m!339861))

(declare-fun m!339863 () Bool)

(assert (=> b!221169 m!339863))

(assert (=> b!221165 m!339737))

(declare-fun m!339865 () Bool)

(assert (=> b!221164 m!339865))

(declare-fun m!339867 () Bool)

(assert (=> b!221167 m!339867))

(declare-fun m!339869 () Bool)

(assert (=> b!221167 m!339869))

(declare-fun m!339871 () Bool)

(assert (=> b!221166 m!339871))

(assert (=> b!221068 d!74501))

(declare-fun d!74503 () Bool)

(declare-fun e!150164 () Bool)

(assert (=> d!74503 e!150164))

(declare-fun res!186252 () Bool)

(assert (=> d!74503 (=> (not res!186252) (not e!150164))))

(declare-fun lt!349077 () (_ BitVec 64))

(declare-fun lt!349076 () (_ BitVec 64))

(declare-fun lt!349079 () (_ BitVec 64))

(assert (=> d!74503 (= res!186252 (= lt!349077 (bvsub lt!349079 lt!349076)))))

(assert (=> d!74503 (or (= (bvand lt!349079 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!349076 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!349079 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!349079 lt!349076) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74503 (= lt!349076 (remainingBits!0 ((_ sign_extend 32) (size!4743 (buf!5290 (_2!10149 (increaseBitIndex!0 bs!62))))) ((_ sign_extend 32) (currentByte!9926 (_2!10149 (increaseBitIndex!0 bs!62)))) ((_ sign_extend 32) (currentBit!9921 (_2!10149 (increaseBitIndex!0 bs!62))))))))

(declare-fun lt!349078 () (_ BitVec 64))

(declare-fun lt!349074 () (_ BitVec 64))

(assert (=> d!74503 (= lt!349079 (bvmul lt!349078 lt!349074))))

(assert (=> d!74503 (or (= lt!349078 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!349074 (bvsdiv (bvmul lt!349078 lt!349074) lt!349078)))))

(assert (=> d!74503 (= lt!349074 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!74503 (= lt!349078 ((_ sign_extend 32) (size!4743 (buf!5290 (_2!10149 (increaseBitIndex!0 bs!62))))))))

(assert (=> d!74503 (= lt!349077 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9926 (_2!10149 (increaseBitIndex!0 bs!62)))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9921 (_2!10149 (increaseBitIndex!0 bs!62))))))))

(assert (=> d!74503 (invariant!0 (currentBit!9921 (_2!10149 (increaseBitIndex!0 bs!62))) (currentByte!9926 (_2!10149 (increaseBitIndex!0 bs!62))) (size!4743 (buf!5290 (_2!10149 (increaseBitIndex!0 bs!62)))))))

(assert (=> d!74503 (= (bitIndex!0 (size!4743 (buf!5290 (_2!10149 (increaseBitIndex!0 bs!62)))) (currentByte!9926 (_2!10149 (increaseBitIndex!0 bs!62))) (currentBit!9921 (_2!10149 (increaseBitIndex!0 bs!62)))) lt!349077)))

(declare-fun b!221171 () Bool)

(declare-fun res!186251 () Bool)

(assert (=> b!221171 (=> (not res!186251) (not e!150164))))

(assert (=> b!221171 (= res!186251 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!349077))))

(declare-fun b!221172 () Bool)

(declare-fun lt!349075 () (_ BitVec 64))

(assert (=> b!221172 (= e!150164 (bvsle lt!349077 (bvmul lt!349075 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!221172 (or (= lt!349075 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!349075 #b0000000000000000000000000000000000000000000000000000000000001000) lt!349075)))))

(assert (=> b!221172 (= lt!349075 ((_ sign_extend 32) (size!4743 (buf!5290 (_2!10149 (increaseBitIndex!0 bs!62))))))))

(assert (= (and d!74503 res!186252) b!221171))

(assert (= (and b!221171 res!186251) b!221172))

(declare-fun m!339873 () Bool)

(assert (=> d!74503 m!339873))

(declare-fun m!339875 () Bool)

(assert (=> d!74503 m!339875))

(assert (=> b!221032 d!74503))

(declare-fun d!74505 () Bool)

(declare-fun e!150167 () Bool)

(assert (=> d!74505 e!150167))

(declare-fun res!186257 () Bool)

(assert (=> d!74505 (=> (not res!186257) (not e!150167))))

(declare-fun lt!349091 () (_ BitVec 64))

(declare-fun lt!349090 () tuple2!18982)

(declare-fun lt!349093 () (_ BitVec 64))

(assert (=> d!74505 (= res!186257 (= (bvadd lt!349093 lt!349091) (bitIndex!0 (size!4743 (buf!5290 (_2!10149 lt!349090))) (currentByte!9926 (_2!10149 lt!349090)) (currentBit!9921 (_2!10149 lt!349090)))))))

(assert (=> d!74505 (or (not (= (bvand lt!349093 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!349091 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!349093 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!349093 lt!349091) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74505 (= lt!349091 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!74505 (= lt!349093 (bitIndex!0 (size!4743 (buf!5290 bs!62)) (currentByte!9926 bs!62) (currentBit!9921 bs!62)))))

(declare-fun Unit!15639 () Unit!15617)

(declare-fun Unit!15640 () Unit!15617)

(assert (=> d!74505 (= lt!349090 (ite (bvslt (currentBit!9921 bs!62) #b00000000000000000000000000000111) (tuple2!18983 Unit!15639 (BitStream!8595 (buf!5290 bs!62) (currentByte!9926 bs!62) (bvadd (currentBit!9921 bs!62) #b00000000000000000000000000000001))) (tuple2!18983 Unit!15640 (BitStream!8595 (buf!5290 bs!62) (bvadd (currentByte!9926 bs!62) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (=> d!74505 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!4743 (buf!5290 bs!62))) ((_ sign_extend 32) (currentByte!9926 bs!62)) ((_ sign_extend 32) (currentBit!9921 bs!62))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!74505 (= (increaseBitIndex!0 bs!62) lt!349090)))

(declare-fun b!221177 () Bool)

(declare-fun res!186258 () Bool)

(assert (=> b!221177 (=> (not res!186258) (not e!150167))))

(declare-fun lt!349094 () (_ BitVec 64))

(declare-fun lt!349092 () (_ BitVec 64))

(assert (=> b!221177 (= res!186258 (= (bvsub lt!349094 lt!349092) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!221177 (or (= (bvand lt!349094 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!349092 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!349094 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!349094 lt!349092) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!221177 (= lt!349092 (remainingBits!0 ((_ sign_extend 32) (size!4743 (buf!5290 (_2!10149 lt!349090)))) ((_ sign_extend 32) (currentByte!9926 (_2!10149 lt!349090))) ((_ sign_extend 32) (currentBit!9921 (_2!10149 lt!349090)))))))

(assert (=> b!221177 (= lt!349094 (remainingBits!0 ((_ sign_extend 32) (size!4743 (buf!5290 bs!62))) ((_ sign_extend 32) (currentByte!9926 bs!62)) ((_ sign_extend 32) (currentBit!9921 bs!62))))))

(declare-fun b!221178 () Bool)

(assert (=> b!221178 (= e!150167 (= (size!4743 (buf!5290 bs!62)) (size!4743 (buf!5290 (_2!10149 lt!349090)))))))

(assert (= (and d!74505 res!186257) b!221177))

(assert (= (and b!221177 res!186258) b!221178))

(declare-fun m!339877 () Bool)

(assert (=> d!74505 m!339877))

(assert (=> d!74505 m!339659))

(assert (=> d!74505 m!339671))

(declare-fun m!339879 () Bool)

(assert (=> b!221177 m!339879))

(assert (=> b!221177 m!339671))

(assert (=> b!221032 d!74505))

(assert (=> b!221032 d!74449))

(declare-fun d!74507 () Bool)

(declare-fun e!150168 () Bool)

(assert (=> d!74507 e!150168))

(declare-fun res!186260 () Bool)

(assert (=> d!74507 (=> (not res!186260) (not e!150168))))

(declare-fun lt!349098 () (_ BitVec 64))

(declare-fun lt!349100 () (_ BitVec 64))

(declare-fun lt!349097 () (_ BitVec 64))

(assert (=> d!74507 (= res!186260 (= lt!349098 (bvsub lt!349100 lt!349097)))))

(assert (=> d!74507 (or (= (bvand lt!349100 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!349097 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!349100 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!349100 lt!349097) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74507 (= lt!349097 (remainingBits!0 ((_ sign_extend 32) (size!4743 (buf!5290 (_2!10148 lt!348917)))) ((_ sign_extend 32) (currentByte!9926 (_2!10148 lt!348917))) ((_ sign_extend 32) (currentBit!9921 (_2!10148 lt!348917)))))))

(declare-fun lt!349099 () (_ BitVec 64))

(declare-fun lt!349095 () (_ BitVec 64))

(assert (=> d!74507 (= lt!349100 (bvmul lt!349099 lt!349095))))

(assert (=> d!74507 (or (= lt!349099 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!349095 (bvsdiv (bvmul lt!349099 lt!349095) lt!349099)))))

(assert (=> d!74507 (= lt!349095 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!74507 (= lt!349099 ((_ sign_extend 32) (size!4743 (buf!5290 (_2!10148 lt!348917)))))))

(assert (=> d!74507 (= lt!349098 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9926 (_2!10148 lt!348917))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9921 (_2!10148 lt!348917)))))))

(assert (=> d!74507 (invariant!0 (currentBit!9921 (_2!10148 lt!348917)) (currentByte!9926 (_2!10148 lt!348917)) (size!4743 (buf!5290 (_2!10148 lt!348917))))))

(assert (=> d!74507 (= (bitIndex!0 (size!4743 (buf!5290 (_2!10148 lt!348917))) (currentByte!9926 (_2!10148 lt!348917)) (currentBit!9921 (_2!10148 lt!348917))) lt!349098)))

(declare-fun b!221179 () Bool)

(declare-fun res!186259 () Bool)

(assert (=> b!221179 (=> (not res!186259) (not e!150168))))

(assert (=> b!221179 (= res!186259 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!349098))))

(declare-fun b!221180 () Bool)

(declare-fun lt!349096 () (_ BitVec 64))

(assert (=> b!221180 (= e!150168 (bvsle lt!349098 (bvmul lt!349096 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!221180 (or (= lt!349096 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!349096 #b0000000000000000000000000000000000000000000000000000000000001000) lt!349096)))))

(assert (=> b!221180 (= lt!349096 ((_ sign_extend 32) (size!4743 (buf!5290 (_2!10148 lt!348917)))))))

(assert (= (and d!74507 res!186260) b!221179))

(assert (= (and b!221179 res!186259) b!221180))

(declare-fun m!339881 () Bool)

(assert (=> d!74507 m!339881))

(declare-fun m!339883 () Bool)

(assert (=> d!74507 m!339883))

(assert (=> b!221077 d!74507))

(declare-fun d!74509 () Bool)

(declare-fun e!150169 () Bool)

(assert (=> d!74509 e!150169))

(declare-fun res!186262 () Bool)

(assert (=> d!74509 (=> (not res!186262) (not e!150169))))

(declare-fun lt!349106 () (_ BitVec 64))

(declare-fun lt!349103 () (_ BitVec 64))

(declare-fun lt!349104 () (_ BitVec 64))

(assert (=> d!74509 (= res!186262 (= lt!349104 (bvsub lt!349106 lt!349103)))))

(assert (=> d!74509 (or (= (bvand lt!349106 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!349103 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!349106 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!349106 lt!349103) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74509 (= lt!349103 (remainingBits!0 ((_ sign_extend 32) (size!4743 (buf!5290 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)))) ((_ sign_extend 32) (currentByte!9926 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))) ((_ sign_extend 32) (currentBit!9921 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)))))))

(declare-fun lt!349105 () (_ BitVec 64))

(declare-fun lt!349101 () (_ BitVec 64))

(assert (=> d!74509 (= lt!349106 (bvmul lt!349105 lt!349101))))

(assert (=> d!74509 (or (= lt!349105 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!349101 (bvsdiv (bvmul lt!349105 lt!349101) lt!349105)))))

(assert (=> d!74509 (= lt!349101 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!74509 (= lt!349105 ((_ sign_extend 32) (size!4743 (buf!5290 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)))))))

(assert (=> d!74509 (= lt!349104 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9926 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9921 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)))))))

(assert (=> d!74509 (invariant!0 (currentBit!9921 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)) (currentByte!9926 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)) (size!4743 (buf!5290 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> d!74509 (= (bitIndex!0 (size!4743 (buf!5290 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))) (currentByte!9926 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)) (currentBit!9921 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))) lt!349104)))

(declare-fun b!221181 () Bool)

(declare-fun res!186261 () Bool)

(assert (=> b!221181 (=> (not res!186261) (not e!150169))))

(assert (=> b!221181 (= res!186261 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!349104))))

(declare-fun b!221182 () Bool)

(declare-fun lt!349102 () (_ BitVec 64))

(assert (=> b!221182 (= e!150169 (bvsle lt!349104 (bvmul lt!349102 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!221182 (or (= lt!349102 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!349102 #b0000000000000000000000000000000000000000000000000000000000001000) lt!349102)))))

(assert (=> b!221182 (= lt!349102 ((_ sign_extend 32) (size!4743 (buf!5290 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)))))))

(assert (= (and d!74509 res!186262) b!221181))

(assert (= (and b!221181 res!186261) b!221182))

(declare-fun m!339885 () Bool)

(assert (=> d!74509 m!339885))

(declare-fun m!339887 () Bool)

(assert (=> d!74509 m!339887))

(assert (=> b!221077 d!74509))

(declare-fun d!74511 () Bool)

(declare-fun e!150170 () Bool)

(assert (=> d!74511 e!150170))

(declare-fun res!186264 () Bool)

(assert (=> d!74511 (=> (not res!186264) (not e!150170))))

(declare-fun lt!349110 () (_ BitVec 64))

(declare-fun lt!349109 () (_ BitVec 64))

(declare-fun lt!349112 () (_ BitVec 64))

(assert (=> d!74511 (= res!186264 (= lt!349110 (bvsub lt!349112 lt!349109)))))

(assert (=> d!74511 (or (= (bvand lt!349112 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!349109 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!349112 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!349112 lt!349109) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74511 (= lt!349109 (remainingBits!0 ((_ sign_extend 32) (size!4743 (buf!5290 (_2!10148 lt!348911)))) ((_ sign_extend 32) (currentByte!9926 (_2!10148 lt!348911))) ((_ sign_extend 32) (currentBit!9921 (_2!10148 lt!348911)))))))

(declare-fun lt!349111 () (_ BitVec 64))

(declare-fun lt!349107 () (_ BitVec 64))

(assert (=> d!74511 (= lt!349112 (bvmul lt!349111 lt!349107))))

(assert (=> d!74511 (or (= lt!349111 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!349107 (bvsdiv (bvmul lt!349111 lt!349107) lt!349111)))))

(assert (=> d!74511 (= lt!349107 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!74511 (= lt!349111 ((_ sign_extend 32) (size!4743 (buf!5290 (_2!10148 lt!348911)))))))

(assert (=> d!74511 (= lt!349110 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9926 (_2!10148 lt!348911))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9921 (_2!10148 lt!348911)))))))

(assert (=> d!74511 (invariant!0 (currentBit!9921 (_2!10148 lt!348911)) (currentByte!9926 (_2!10148 lt!348911)) (size!4743 (buf!5290 (_2!10148 lt!348911))))))

(assert (=> d!74511 (= (bitIndex!0 (size!4743 (buf!5290 (_2!10148 lt!348911))) (currentByte!9926 (_2!10148 lt!348911)) (currentBit!9921 (_2!10148 lt!348911))) lt!349110)))

(declare-fun b!221183 () Bool)

(declare-fun res!186263 () Bool)

(assert (=> b!221183 (=> (not res!186263) (not e!150170))))

(assert (=> b!221183 (= res!186263 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!349110))))

(declare-fun b!221184 () Bool)

(declare-fun lt!349108 () (_ BitVec 64))

(assert (=> b!221184 (= e!150170 (bvsle lt!349110 (bvmul lt!349108 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!221184 (or (= lt!349108 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!349108 #b0000000000000000000000000000000000000000000000000000000000001000) lt!349108)))))

(assert (=> b!221184 (= lt!349108 ((_ sign_extend 32) (size!4743 (buf!5290 (_2!10148 lt!348911)))))))

(assert (= (and d!74511 res!186264) b!221183))

(assert (= (and b!221183 res!186263) b!221184))

(declare-fun m!339889 () Bool)

(assert (=> d!74511 m!339889))

(declare-fun m!339891 () Bool)

(assert (=> d!74511 m!339891))

(assert (=> b!221070 d!74511))

(assert (=> b!221070 d!74449))

(assert (=> b!221124 d!74449))

(declare-fun d!74513 () Bool)

(assert (=> d!74513 (= (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!541)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvadd #b00000000000000000000000000000001 i!541)))))))

(assert (=> b!221072 d!74513))

(declare-fun d!74515 () Bool)

(assert (=> d!74515 (= (onesLSBLong!0 i!541) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!541))))))

(assert (=> b!221065 d!74515))

(declare-fun d!74517 () Bool)

(declare-fun e!150171 () Bool)

(assert (=> d!74517 e!150171))

(declare-fun res!186266 () Bool)

(assert (=> d!74517 (=> (not res!186266) (not e!150171))))

(declare-fun lt!349116 () (_ BitVec 64))

(declare-fun lt!349118 () (_ BitVec 64))

(declare-fun lt!349115 () (_ BitVec 64))

(assert (=> d!74517 (= res!186266 (= lt!349116 (bvsub lt!349118 lt!349115)))))

(assert (=> d!74517 (or (= (bvand lt!349118 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!349115 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!349118 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!349118 lt!349115) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74517 (= lt!349115 (remainingBits!0 ((_ sign_extend 32) (size!4743 (buf!5290 (_2!10149 lt!348981)))) ((_ sign_extend 32) (currentByte!9926 (_2!10149 lt!348981))) ((_ sign_extend 32) (currentBit!9921 (_2!10149 lt!348981)))))))

(declare-fun lt!349117 () (_ BitVec 64))

(declare-fun lt!349113 () (_ BitVec 64))

(assert (=> d!74517 (= lt!349118 (bvmul lt!349117 lt!349113))))

(assert (=> d!74517 (or (= lt!349117 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!349113 (bvsdiv (bvmul lt!349117 lt!349113) lt!349117)))))

(assert (=> d!74517 (= lt!349113 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!74517 (= lt!349117 ((_ sign_extend 32) (size!4743 (buf!5290 (_2!10149 lt!348981)))))))

(assert (=> d!74517 (= lt!349116 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9926 (_2!10149 lt!348981))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9921 (_2!10149 lt!348981)))))))

(assert (=> d!74517 (invariant!0 (currentBit!9921 (_2!10149 lt!348981)) (currentByte!9926 (_2!10149 lt!348981)) (size!4743 (buf!5290 (_2!10149 lt!348981))))))

(assert (=> d!74517 (= (bitIndex!0 (size!4743 (buf!5290 (_2!10149 lt!348981))) (currentByte!9926 (_2!10149 lt!348981)) (currentBit!9921 (_2!10149 lt!348981))) lt!349116)))

(declare-fun b!221185 () Bool)

(declare-fun res!186265 () Bool)

(assert (=> b!221185 (=> (not res!186265) (not e!150171))))

(assert (=> b!221185 (= res!186265 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!349116))))

(declare-fun b!221186 () Bool)

(declare-fun lt!349114 () (_ BitVec 64))

(assert (=> b!221186 (= e!150171 (bvsle lt!349116 (bvmul lt!349114 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!221186 (or (= lt!349114 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!349114 #b0000000000000000000000000000000000000000000000000000000000001000) lt!349114)))))

(assert (=> b!221186 (= lt!349114 ((_ sign_extend 32) (size!4743 (buf!5290 (_2!10149 lt!348981)))))))

(assert (= (and d!74517 res!186266) b!221185))

(assert (= (and b!221185 res!186265) b!221186))

(declare-fun m!339893 () Bool)

(assert (=> d!74517 m!339893))

(declare-fun m!339895 () Bool)

(assert (=> d!74517 m!339895))

(assert (=> b!221119 d!74517))

(assert (=> b!221119 d!74449))

(declare-fun d!74519 () Bool)

(assert (=> d!74519 (= (onesLSBLong!0 nBits!265) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!265))))))

(assert (=> b!221073 d!74519))

(assert (=> b!221066 d!74519))

(assert (=> d!74429 d!74505))

(declare-fun d!74521 () Bool)

(assert (=> d!74521 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!4743 (buf!5290 bs!62))) ((_ sign_extend 32) (currentByte!9926 bs!62)) ((_ sign_extend 32) (currentBit!9921 bs!62))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4743 (buf!5290 bs!62))) ((_ sign_extend 32) (currentByte!9926 bs!62)) ((_ sign_extend 32) (currentBit!9921 bs!62))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!18214 () Bool)

(assert (= bs!18214 d!74521))

(assert (=> bs!18214 m!339671))

(assert (=> d!74429 d!74521))

(declare-fun d!74523 () Bool)

(declare-fun lt!349119 () tuple2!18984)

(assert (=> d!74523 (= lt!349119 (readBit!0 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!74523 (= (readBitPure!0 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)) (tuple2!18967 (_2!10150 lt!349119) (_1!10150 lt!349119)))))

(declare-fun bs!18215 () Bool)

(assert (= bs!18215 d!74523))

(assert (=> bs!18215 m!339611))

(assert (=> bs!18215 m!339749))

(assert (=> b!221074 d!74523))

(assert (=> b!221067 d!74393))

(assert (=> d!74451 d!74461))

(declare-fun d!74525 () Bool)

(assert (=> d!74525 (= (remainingBits!0 ((_ sign_extend 32) (size!4743 (buf!5290 lt!348714))) ((_ sign_extend 32) (currentByte!9926 lt!348714)) ((_ sign_extend 32) (currentBit!9921 lt!348714))) (bvsub (bvmul ((_ sign_extend 32) (size!4743 (buf!5290 lt!348714))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9926 lt!348714)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9921 lt!348714)))))))

(assert (=> d!74447 d!74525))

(declare-fun d!74527 () Bool)

(assert (=> d!74527 (= (invariant!0 (currentBit!9921 lt!348714) (currentByte!9926 lt!348714) (size!4743 (buf!5290 lt!348714))) (and (bvsge (currentBit!9921 lt!348714) #b00000000000000000000000000000000) (bvslt (currentBit!9921 lt!348714) #b00000000000000000000000000001000) (bvsge (currentByte!9926 lt!348714) #b00000000000000000000000000000000) (or (bvslt (currentByte!9926 lt!348714) (size!4743 (buf!5290 lt!348714))) (and (= (currentBit!9921 lt!348714) #b00000000000000000000000000000000) (= (currentByte!9926 lt!348714) (size!4743 (buf!5290 lt!348714)))))))))

(assert (=> d!74447 d!74527))

(assert (=> d!74449 d!74463))

(assert (=> d!74449 d!74435))

(push 1)

(assert (not d!74497))

(assert (not b!221162))

(assert (not b!221157))

(assert (not b!221156))

(assert (not d!74507))

(assert (not b!221164))

(assert (not d!74503))

(assert (not d!74511))

(assert (not b!221169))

(assert (not b!221166))

(assert (not b!221159))

(assert (not b!221160))

(assert (not d!74517))

(assert (not d!74509))

(assert (not b!221167))

(assert (not b!221165))

(assert (not d!74505))

(assert (not d!74523))

(assert (not b!221177))

(assert (not d!74521))

(assert (not b!221158))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

