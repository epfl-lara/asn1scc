; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50410 () Bool)

(assert start!50410)

(declare-fun b!236297 () Bool)

(declare-fun res!197496 () Bool)

(declare-fun e!163363 () Bool)

(assert (=> b!236297 (=> (not res!197496) (not e!163363))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!236297 (= res!197496 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(declare-fun b!236298 () Bool)

(declare-fun res!197494 () Bool)

(assert (=> b!236298 (=> (not res!197494) (not e!163363))))

(declare-fun i!752 () (_ BitVec 32))

(assert (=> b!236298 (= res!197494 (not (= nBits!581 i!752)))))

(declare-fun b!236299 () Bool)

(declare-fun e!163362 () Bool)

(assert (=> b!236299 (= e!163363 e!163362)))

(declare-fun res!197492 () Bool)

(assert (=> b!236299 (=> (not res!197492) (not e!163362))))

(assert (=> b!236299 (= res!197492 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!752)) (bvsle (bvadd #b00000000000000000000000000000001 i!752) nBits!581)))))

(declare-datatypes ((array!12525 0))(
  ( (array!12526 (arr!6488 (Array (_ BitVec 32) (_ BitVec 8))) (size!5501 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9966 0))(
  ( (BitStream!9967 (buf!5976 array!12525) (currentByte!11105 (_ BitVec 32)) (currentBit!11100 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!19930 0))(
  ( (tuple2!19931 (_1!10869 Bool) (_2!10869 BitStream!9966)) )
))
(declare-fun lt!371583 () tuple2!19930)

(declare-fun thiss!1830 () BitStream!9966)

(declare-fun readBit!0 (BitStream!9966) tuple2!19930)

(assert (=> b!236299 (= lt!371583 (readBit!0 thiss!1830))))

(declare-fun res!197491 () Bool)

(assert (=> start!50410 (=> (not res!197491) (not e!163363))))

(assert (=> start!50410 (= res!197491 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50410 e!163363))

(assert (=> start!50410 true))

(declare-fun e!163364 () Bool)

(declare-fun inv!12 (BitStream!9966) Bool)

(assert (=> start!50410 (and (inv!12 thiss!1830) e!163364)))

(declare-fun b!236300 () Bool)

(declare-fun res!197495 () Bool)

(assert (=> b!236300 (=> (not res!197495) (not e!163363))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!236300 (= res!197495 (validate_offset_bits!1 ((_ sign_extend 32) (size!5501 (buf!5976 thiss!1830))) ((_ sign_extend 32) (currentByte!11105 thiss!1830)) ((_ sign_extend 32) (currentBit!11100 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun b!236301 () Bool)

(assert (=> b!236301 (= e!163362 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!5501 (buf!5976 (_2!10869 lt!371583)))) ((_ sign_extend 32) (currentByte!11105 (_2!10869 lt!371583))) ((_ sign_extend 32) (currentBit!11100 (_2!10869 lt!371583))) ((_ sign_extend 32) (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752))))))))

(declare-fun b!236302 () Bool)

(declare-fun array_inv!5242 (array!12525) Bool)

(assert (=> b!236302 (= e!163364 (array_inv!5242 (buf!5976 thiss!1830)))))

(declare-fun b!236303 () Bool)

(declare-fun res!197493 () Bool)

(assert (=> b!236303 (=> (not res!197493) (not e!163363))))

(assert (=> b!236303 (= res!197493 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!50410 res!197491) b!236300))

(assert (= (and b!236300 res!197495) b!236303))

(assert (= (and b!236303 res!197493) b!236297))

(assert (= (and b!236297 res!197496) b!236298))

(assert (= (and b!236298 res!197494) b!236299))

(assert (= (and b!236299 res!197492) b!236301))

(assert (= start!50410 b!236302))

(declare-fun m!358835 () Bool)

(assert (=> start!50410 m!358835))

(declare-fun m!358837 () Bool)

(assert (=> b!236302 m!358837))

(declare-fun m!358839 () Bool)

(assert (=> b!236300 m!358839))

(declare-fun m!358841 () Bool)

(assert (=> b!236299 m!358841))

(declare-fun m!358843 () Bool)

(assert (=> b!236303 m!358843))

(declare-fun m!358845 () Bool)

(assert (=> b!236297 m!358845))

(declare-fun m!358847 () Bool)

(assert (=> b!236301 m!358847))

(check-sat (not b!236303) (not b!236300) (not b!236297) (not b!236301) (not b!236302) (not b!236299) (not start!50410))
(check-sat)
(get-model)

(declare-fun d!79730 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!79730 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5501 (buf!5976 thiss!1830))) ((_ sign_extend 32) (currentByte!11105 thiss!1830)) ((_ sign_extend 32) (currentBit!11100 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5501 (buf!5976 thiss!1830))) ((_ sign_extend 32) (currentByte!11105 thiss!1830)) ((_ sign_extend 32) (currentBit!11100 thiss!1830))) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun bs!19913 () Bool)

(assert (= bs!19913 d!79730))

(declare-fun m!358863 () Bool)

(assert (=> bs!19913 m!358863))

(assert (=> b!236300 d!79730))

(declare-fun d!79732 () Bool)

(declare-fun e!163394 () Bool)

(assert (=> d!79732 e!163394))

(declare-fun res!197520 () Bool)

(assert (=> d!79732 (=> (not res!197520) (not e!163394))))

(declare-datatypes ((Unit!17353 0))(
  ( (Unit!17354) )
))
(declare-datatypes ((tuple2!19936 0))(
  ( (tuple2!19937 (_1!10872 Unit!17353) (_2!10872 BitStream!9966)) )
))
(declare-fun increaseBitIndex!0 (BitStream!9966) tuple2!19936)

(assert (=> d!79732 (= res!197520 (= (buf!5976 (_2!10872 (increaseBitIndex!0 thiss!1830))) (buf!5976 thiss!1830)))))

(declare-fun lt!371622 () Bool)

(assert (=> d!79732 (= lt!371622 (not (= (bvand ((_ sign_extend 24) (select (arr!6488 (buf!5976 thiss!1830)) (currentByte!11105 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11100 thiss!1830)))) #b00000000000000000000000000000000)))))

(declare-fun lt!371625 () tuple2!19930)

(assert (=> d!79732 (= lt!371625 (tuple2!19931 (not (= (bvand ((_ sign_extend 24) (select (arr!6488 (buf!5976 thiss!1830)) (currentByte!11105 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11100 thiss!1830)))) #b00000000000000000000000000000000)) (_2!10872 (increaseBitIndex!0 thiss!1830))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!79732 (validate_offset_bit!0 ((_ sign_extend 32) (size!5501 (buf!5976 thiss!1830))) ((_ sign_extend 32) (currentByte!11105 thiss!1830)) ((_ sign_extend 32) (currentBit!11100 thiss!1830)))))

(assert (=> d!79732 (= (readBit!0 thiss!1830) lt!371625)))

(declare-fun lt!371626 () (_ BitVec 64))

(declare-fun b!236330 () Bool)

(declare-fun lt!371627 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!236330 (= e!163394 (= (bitIndex!0 (size!5501 (buf!5976 (_2!10872 (increaseBitIndex!0 thiss!1830)))) (currentByte!11105 (_2!10872 (increaseBitIndex!0 thiss!1830))) (currentBit!11100 (_2!10872 (increaseBitIndex!0 thiss!1830)))) (bvadd lt!371627 lt!371626)))))

(assert (=> b!236330 (or (not (= (bvand lt!371627 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!371626 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!371627 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!371627 lt!371626) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!236330 (= lt!371626 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!236330 (= lt!371627 (bitIndex!0 (size!5501 (buf!5976 thiss!1830)) (currentByte!11105 thiss!1830) (currentBit!11100 thiss!1830)))))

(declare-fun lt!371623 () Bool)

(assert (=> b!236330 (= lt!371623 (not (= (bvand ((_ sign_extend 24) (select (arr!6488 (buf!5976 thiss!1830)) (currentByte!11105 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11100 thiss!1830)))) #b00000000000000000000000000000000)))))

(declare-fun lt!371624 () Bool)

(assert (=> b!236330 (= lt!371624 (not (= (bvand ((_ sign_extend 24) (select (arr!6488 (buf!5976 thiss!1830)) (currentByte!11105 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11100 thiss!1830)))) #b00000000000000000000000000000000)))))

(declare-fun lt!371628 () Bool)

(assert (=> b!236330 (= lt!371628 (not (= (bvand ((_ sign_extend 24) (select (arr!6488 (buf!5976 thiss!1830)) (currentByte!11105 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11100 thiss!1830)))) #b00000000000000000000000000000000)))))

(assert (= (and d!79732 res!197520) b!236330))

(declare-fun m!358885 () Bool)

(assert (=> d!79732 m!358885))

(declare-fun m!358887 () Bool)

(assert (=> d!79732 m!358887))

(declare-fun m!358889 () Bool)

(assert (=> d!79732 m!358889))

(declare-fun m!358891 () Bool)

(assert (=> d!79732 m!358891))

(assert (=> b!236330 m!358889))

(assert (=> b!236330 m!358885))

(declare-fun m!358893 () Bool)

(assert (=> b!236330 m!358893))

(assert (=> b!236330 m!358887))

(declare-fun m!358895 () Bool)

(assert (=> b!236330 m!358895))

(assert (=> b!236299 d!79732))

(declare-fun d!79750 () Bool)

(assert (=> d!79750 (= (onesLSBLong!0 (bvsub nBits!581 i!752)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!581 i!752)))))))

(assert (=> b!236303 d!79750))

(declare-fun d!79752 () Bool)

(assert (=> d!79752 (= (array_inv!5242 (buf!5976 thiss!1830)) (bvsge (size!5501 (buf!5976 thiss!1830)) #b00000000000000000000000000000000))))

(assert (=> b!236302 d!79752))

(declare-fun d!79754 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!79754 (= (inv!12 thiss!1830) (invariant!0 (currentBit!11100 thiss!1830) (currentByte!11105 thiss!1830) (size!5501 (buf!5976 thiss!1830))))))

(declare-fun bs!19918 () Bool)

(assert (= bs!19918 d!79754))

(declare-fun m!358897 () Bool)

(assert (=> bs!19918 m!358897))

(assert (=> start!50410 d!79754))

(declare-fun d!79756 () Bool)

(assert (=> d!79756 (= (onesLSBLong!0 nBits!581) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!581))))))

(assert (=> b!236297 d!79756))

(declare-fun d!79758 () Bool)

(assert (=> d!79758 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5501 (buf!5976 (_2!10869 lt!371583)))) ((_ sign_extend 32) (currentByte!11105 (_2!10869 lt!371583))) ((_ sign_extend 32) (currentBit!11100 (_2!10869 lt!371583))) ((_ sign_extend 32) (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752)))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5501 (buf!5976 (_2!10869 lt!371583)))) ((_ sign_extend 32) (currentByte!11105 (_2!10869 lt!371583))) ((_ sign_extend 32) (currentBit!11100 (_2!10869 lt!371583)))) ((_ sign_extend 32) (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752)))))))

(declare-fun bs!19919 () Bool)

(assert (= bs!19919 d!79758))

(declare-fun m!358899 () Bool)

(assert (=> bs!19919 m!358899))

(assert (=> b!236301 d!79758))

(check-sat (not d!79730) (not d!79758) (not d!79754) (not b!236330) (not d!79732))
(check-sat)
(get-model)

(declare-fun d!79768 () Bool)

(assert (=> d!79768 (= (remainingBits!0 ((_ sign_extend 32) (size!5501 (buf!5976 (_2!10869 lt!371583)))) ((_ sign_extend 32) (currentByte!11105 (_2!10869 lt!371583))) ((_ sign_extend 32) (currentBit!11100 (_2!10869 lt!371583)))) (bvsub (bvmul ((_ sign_extend 32) (size!5501 (buf!5976 (_2!10869 lt!371583)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11105 (_2!10869 lt!371583))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11100 (_2!10869 lt!371583))))))))

(assert (=> d!79758 d!79768))

(declare-fun d!79770 () Bool)

(declare-fun e!163400 () Bool)

(assert (=> d!79770 e!163400))

(declare-fun res!197529 () Bool)

(assert (=> d!79770 (=> (not res!197529) (not e!163400))))

(declare-fun lt!371667 () (_ BitVec 64))

(declare-fun lt!371663 () (_ BitVec 64))

(declare-fun lt!371664 () (_ BitVec 64))

(assert (=> d!79770 (= res!197529 (= lt!371664 (bvsub lt!371667 lt!371663)))))

(assert (=> d!79770 (or (= (bvand lt!371667 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!371663 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!371667 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!371667 lt!371663) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!79770 (= lt!371663 (remainingBits!0 ((_ sign_extend 32) (size!5501 (buf!5976 (_2!10872 (increaseBitIndex!0 thiss!1830))))) ((_ sign_extend 32) (currentByte!11105 (_2!10872 (increaseBitIndex!0 thiss!1830)))) ((_ sign_extend 32) (currentBit!11100 (_2!10872 (increaseBitIndex!0 thiss!1830))))))))

(declare-fun lt!371666 () (_ BitVec 64))

(declare-fun lt!371665 () (_ BitVec 64))

(assert (=> d!79770 (= lt!371667 (bvmul lt!371666 lt!371665))))

(assert (=> d!79770 (or (= lt!371666 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!371665 (bvsdiv (bvmul lt!371666 lt!371665) lt!371666)))))

(assert (=> d!79770 (= lt!371665 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!79770 (= lt!371666 ((_ sign_extend 32) (size!5501 (buf!5976 (_2!10872 (increaseBitIndex!0 thiss!1830))))))))

(assert (=> d!79770 (= lt!371664 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11105 (_2!10872 (increaseBitIndex!0 thiss!1830)))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11100 (_2!10872 (increaseBitIndex!0 thiss!1830))))))))

(assert (=> d!79770 (invariant!0 (currentBit!11100 (_2!10872 (increaseBitIndex!0 thiss!1830))) (currentByte!11105 (_2!10872 (increaseBitIndex!0 thiss!1830))) (size!5501 (buf!5976 (_2!10872 (increaseBitIndex!0 thiss!1830)))))))

(assert (=> d!79770 (= (bitIndex!0 (size!5501 (buf!5976 (_2!10872 (increaseBitIndex!0 thiss!1830)))) (currentByte!11105 (_2!10872 (increaseBitIndex!0 thiss!1830))) (currentBit!11100 (_2!10872 (increaseBitIndex!0 thiss!1830)))) lt!371664)))

(declare-fun b!236338 () Bool)

(declare-fun res!197528 () Bool)

(assert (=> b!236338 (=> (not res!197528) (not e!163400))))

(assert (=> b!236338 (= res!197528 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!371664))))

(declare-fun b!236339 () Bool)

(declare-fun lt!371662 () (_ BitVec 64))

(assert (=> b!236339 (= e!163400 (bvsle lt!371664 (bvmul lt!371662 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!236339 (or (= lt!371662 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!371662 #b0000000000000000000000000000000000000000000000000000000000001000) lt!371662)))))

(assert (=> b!236339 (= lt!371662 ((_ sign_extend 32) (size!5501 (buf!5976 (_2!10872 (increaseBitIndex!0 thiss!1830))))))))

(assert (= (and d!79770 res!197529) b!236338))

(assert (= (and b!236338 res!197528) b!236339))

(declare-fun m!358917 () Bool)

(assert (=> d!79770 m!358917))

(declare-fun m!358919 () Bool)

(assert (=> d!79770 m!358919))

(assert (=> b!236330 d!79770))

(declare-fun d!79772 () Bool)

(declare-fun e!163403 () Bool)

(assert (=> d!79772 e!163403))

(declare-fun res!197535 () Bool)

(assert (=> d!79772 (=> (not res!197535) (not e!163403))))

(declare-fun lt!371678 () tuple2!19936)

(declare-fun lt!371681 () (_ BitVec 64))

(declare-fun lt!371680 () (_ BitVec 64))

(assert (=> d!79772 (= res!197535 (= (bvadd lt!371680 lt!371681) (bitIndex!0 (size!5501 (buf!5976 (_2!10872 lt!371678))) (currentByte!11105 (_2!10872 lt!371678)) (currentBit!11100 (_2!10872 lt!371678)))))))

(assert (=> d!79772 (or (not (= (bvand lt!371680 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!371681 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!371680 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!371680 lt!371681) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!79772 (= lt!371681 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!79772 (= lt!371680 (bitIndex!0 (size!5501 (buf!5976 thiss!1830)) (currentByte!11105 thiss!1830) (currentBit!11100 thiss!1830)))))

(declare-fun Unit!17357 () Unit!17353)

(declare-fun Unit!17358 () Unit!17353)

(assert (=> d!79772 (= lt!371678 (ite (bvslt (currentBit!11100 thiss!1830) #b00000000000000000000000000000111) (tuple2!19937 Unit!17357 (BitStream!9967 (buf!5976 thiss!1830) (currentByte!11105 thiss!1830) (bvadd (currentBit!11100 thiss!1830) #b00000000000000000000000000000001))) (tuple2!19937 Unit!17358 (BitStream!9967 (buf!5976 thiss!1830) (bvadd (currentByte!11105 thiss!1830) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (=> d!79772 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!5501 (buf!5976 thiss!1830))) ((_ sign_extend 32) (currentByte!11105 thiss!1830)) ((_ sign_extend 32) (currentBit!11100 thiss!1830))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!79772 (= (increaseBitIndex!0 thiss!1830) lt!371678)))

(declare-fun b!236344 () Bool)

(declare-fun res!197534 () Bool)

(assert (=> b!236344 (=> (not res!197534) (not e!163403))))

(declare-fun lt!371682 () (_ BitVec 64))

(declare-fun lt!371679 () (_ BitVec 64))

(assert (=> b!236344 (= res!197534 (= (bvsub lt!371682 lt!371679) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!236344 (or (= (bvand lt!371682 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!371679 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!371682 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!371682 lt!371679) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!236344 (= lt!371679 (remainingBits!0 ((_ sign_extend 32) (size!5501 (buf!5976 (_2!10872 lt!371678)))) ((_ sign_extend 32) (currentByte!11105 (_2!10872 lt!371678))) ((_ sign_extend 32) (currentBit!11100 (_2!10872 lt!371678)))))))

(assert (=> b!236344 (= lt!371682 (remainingBits!0 ((_ sign_extend 32) (size!5501 (buf!5976 thiss!1830))) ((_ sign_extend 32) (currentByte!11105 thiss!1830)) ((_ sign_extend 32) (currentBit!11100 thiss!1830))))))

(declare-fun b!236345 () Bool)

(assert (=> b!236345 (= e!163403 (= (size!5501 (buf!5976 thiss!1830)) (size!5501 (buf!5976 (_2!10872 lt!371678)))))))

(assert (= (and d!79772 res!197535) b!236344))

(assert (= (and b!236344 res!197534) b!236345))

(declare-fun m!358921 () Bool)

(assert (=> d!79772 m!358921))

(assert (=> d!79772 m!358893))

(assert (=> d!79772 m!358863))

(declare-fun m!358923 () Bool)

(assert (=> b!236344 m!358923))

(assert (=> b!236344 m!358863))

(assert (=> b!236330 d!79772))

(declare-fun d!79778 () Bool)

(declare-fun e!163404 () Bool)

(assert (=> d!79778 e!163404))

(declare-fun res!197537 () Bool)

(assert (=> d!79778 (=> (not res!197537) (not e!163404))))

(declare-fun lt!371684 () (_ BitVec 64))

(declare-fun lt!371688 () (_ BitVec 64))

(declare-fun lt!371685 () (_ BitVec 64))

(assert (=> d!79778 (= res!197537 (= lt!371685 (bvsub lt!371688 lt!371684)))))

(assert (=> d!79778 (or (= (bvand lt!371688 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!371684 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!371688 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!371688 lt!371684) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!79778 (= lt!371684 (remainingBits!0 ((_ sign_extend 32) (size!5501 (buf!5976 thiss!1830))) ((_ sign_extend 32) (currentByte!11105 thiss!1830)) ((_ sign_extend 32) (currentBit!11100 thiss!1830))))))

(declare-fun lt!371687 () (_ BitVec 64))

(declare-fun lt!371686 () (_ BitVec 64))

(assert (=> d!79778 (= lt!371688 (bvmul lt!371687 lt!371686))))

(assert (=> d!79778 (or (= lt!371687 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!371686 (bvsdiv (bvmul lt!371687 lt!371686) lt!371687)))))

(assert (=> d!79778 (= lt!371686 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!79778 (= lt!371687 ((_ sign_extend 32) (size!5501 (buf!5976 thiss!1830))))))

(assert (=> d!79778 (= lt!371685 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11105 thiss!1830)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11100 thiss!1830))))))

(assert (=> d!79778 (invariant!0 (currentBit!11100 thiss!1830) (currentByte!11105 thiss!1830) (size!5501 (buf!5976 thiss!1830)))))

(assert (=> d!79778 (= (bitIndex!0 (size!5501 (buf!5976 thiss!1830)) (currentByte!11105 thiss!1830) (currentBit!11100 thiss!1830)) lt!371685)))

(declare-fun b!236346 () Bool)

(declare-fun res!197536 () Bool)

(assert (=> b!236346 (=> (not res!197536) (not e!163404))))

(assert (=> b!236346 (= res!197536 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!371685))))

(declare-fun b!236347 () Bool)

(declare-fun lt!371683 () (_ BitVec 64))

(assert (=> b!236347 (= e!163404 (bvsle lt!371685 (bvmul lt!371683 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!236347 (or (= lt!371683 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!371683 #b0000000000000000000000000000000000000000000000000000000000001000) lt!371683)))))

(assert (=> b!236347 (= lt!371683 ((_ sign_extend 32) (size!5501 (buf!5976 thiss!1830))))))

(assert (= (and d!79778 res!197537) b!236346))

(assert (= (and b!236346 res!197536) b!236347))

(assert (=> d!79778 m!358863))

(assert (=> d!79778 m!358897))

(assert (=> b!236330 d!79778))

(declare-fun d!79780 () Bool)

(assert (=> d!79780 (= (invariant!0 (currentBit!11100 thiss!1830) (currentByte!11105 thiss!1830) (size!5501 (buf!5976 thiss!1830))) (and (bvsge (currentBit!11100 thiss!1830) #b00000000000000000000000000000000) (bvslt (currentBit!11100 thiss!1830) #b00000000000000000000000000001000) (bvsge (currentByte!11105 thiss!1830) #b00000000000000000000000000000000) (or (bvslt (currentByte!11105 thiss!1830) (size!5501 (buf!5976 thiss!1830))) (and (= (currentBit!11100 thiss!1830) #b00000000000000000000000000000000) (= (currentByte!11105 thiss!1830) (size!5501 (buf!5976 thiss!1830)))))))))

(assert (=> d!79754 d!79780))

(assert (=> d!79732 d!79772))

(declare-fun d!79782 () Bool)

(assert (=> d!79782 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!5501 (buf!5976 thiss!1830))) ((_ sign_extend 32) (currentByte!11105 thiss!1830)) ((_ sign_extend 32) (currentBit!11100 thiss!1830))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5501 (buf!5976 thiss!1830))) ((_ sign_extend 32) (currentByte!11105 thiss!1830)) ((_ sign_extend 32) (currentBit!11100 thiss!1830))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!19922 () Bool)

(assert (= bs!19922 d!79782))

(assert (=> bs!19922 m!358863))

(assert (=> d!79732 d!79782))

(declare-fun d!79784 () Bool)

(assert (=> d!79784 (= (remainingBits!0 ((_ sign_extend 32) (size!5501 (buf!5976 thiss!1830))) ((_ sign_extend 32) (currentByte!11105 thiss!1830)) ((_ sign_extend 32) (currentBit!11100 thiss!1830))) (bvsub (bvmul ((_ sign_extend 32) (size!5501 (buf!5976 thiss!1830))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11105 thiss!1830)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11100 thiss!1830)))))))

(assert (=> d!79730 d!79784))

(check-sat (not b!236344) (not d!79782) (not d!79772) (not d!79770) (not d!79778))
(check-sat)
