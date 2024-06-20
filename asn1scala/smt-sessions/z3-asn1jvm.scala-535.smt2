; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15656 () Bool)

(assert start!15656)

(declare-fun b!79253 () Bool)

(declare-fun e!52020 () Bool)

(declare-fun e!52018 () Bool)

(assert (=> b!79253 (= e!52020 (not e!52018))))

(declare-fun res!65605 () Bool)

(assert (=> b!79253 (=> res!65605 e!52018)))

(declare-datatypes ((array!3384 0))(
  ( (array!3385 (arr!2164 (Array (_ BitVec 32) (_ BitVec 8))) (size!1563 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2688 0))(
  ( (BitStream!2689 (buf!1953 array!3384) (currentByte!3824 (_ BitVec 32)) (currentBit!3819 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!5211 0))(
  ( (Unit!5212) )
))
(declare-datatypes ((tuple2!7074 0))(
  ( (tuple2!7075 (_1!3674 Unit!5211) (_2!3674 BitStream!2688)) )
))
(declare-fun lt!126126 () tuple2!7074)

(declare-fun thiss!1107 () BitStream!2688)

(assert (=> b!79253 (= res!65605 (not (= (size!1563 (buf!1953 (_2!3674 lt!126126))) (size!1563 (buf!1953 thiss!1107)))))))

(declare-fun e!52016 () Bool)

(assert (=> b!79253 e!52016))

(declare-fun res!65607 () Bool)

(assert (=> b!79253 (=> (not res!65607) (not e!52016))))

(assert (=> b!79253 (= res!65607 (= (size!1563 (buf!1953 thiss!1107)) (size!1563 (buf!1953 (_2!3674 lt!126126)))))))

(declare-fun lt!126121 () Bool)

(declare-fun appendBit!0 (BitStream!2688 Bool) tuple2!7074)

(assert (=> b!79253 (= lt!126126 (appendBit!0 thiss!1107 lt!126121))))

(declare-fun b!215 () (_ BitVec 8))

(declare-fun bitNr!1 () (_ BitVec 32))

(assert (=> b!79253 (= lt!126121 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) b!215))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) bitNr!1))) #b00000000000000000000000000000000)))))

(declare-fun b!79254 () Bool)

(declare-fun e!52019 () Bool)

(declare-fun array_inv!1409 (array!3384) Bool)

(assert (=> b!79254 (= e!52019 (array_inv!1409 (buf!1953 thiss!1107)))))

(declare-fun b!79255 () Bool)

(declare-fun e!52017 () Bool)

(declare-datatypes ((tuple2!7076 0))(
  ( (tuple2!7077 (_1!3675 BitStream!2688) (_2!3675 Bool)) )
))
(declare-fun lt!126125 () tuple2!7076)

(declare-fun lt!126120 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!79255 (= e!52017 (= (bitIndex!0 (size!1563 (buf!1953 (_1!3675 lt!126125))) (currentByte!3824 (_1!3675 lt!126125)) (currentBit!3819 (_1!3675 lt!126125))) lt!126120))))

(declare-fun b!79256 () Bool)

(declare-fun res!65606 () Bool)

(assert (=> b!79256 (=> (not res!65606) (not e!52020))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!79256 (= res!65606 (validate_offset_bit!0 ((_ sign_extend 32) (size!1563 (buf!1953 thiss!1107))) ((_ sign_extend 32) (currentByte!3824 thiss!1107)) ((_ sign_extend 32) (currentBit!3819 thiss!1107))))))

(declare-fun b!79257 () Bool)

(declare-fun e!52014 () Bool)

(assert (=> b!79257 (= e!52016 e!52014)))

(declare-fun res!65604 () Bool)

(assert (=> b!79257 (=> (not res!65604) (not e!52014))))

(declare-fun lt!126123 () (_ BitVec 64))

(assert (=> b!79257 (= res!65604 (= lt!126120 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!126123)))))

(assert (=> b!79257 (= lt!126120 (bitIndex!0 (size!1563 (buf!1953 (_2!3674 lt!126126))) (currentByte!3824 (_2!3674 lt!126126)) (currentBit!3819 (_2!3674 lt!126126))))))

(assert (=> b!79257 (= lt!126123 (bitIndex!0 (size!1563 (buf!1953 thiss!1107)) (currentByte!3824 thiss!1107) (currentBit!3819 thiss!1107)))))

(declare-fun res!65602 () Bool)

(assert (=> start!15656 (=> (not res!65602) (not e!52020))))

(assert (=> start!15656 (= res!65602 (and (bvsge bitNr!1 #b00000000000000000000000000000000) (bvslt bitNr!1 #b00000000000000000000000000001000)))))

(assert (=> start!15656 e!52020))

(assert (=> start!15656 true))

(declare-fun inv!12 (BitStream!2688) Bool)

(assert (=> start!15656 (and (inv!12 thiss!1107) e!52019)))

(declare-fun b!79258 () Bool)

(declare-fun res!65603 () Bool)

(assert (=> b!79258 (=> (not res!65603) (not e!52014))))

(declare-fun isPrefixOf!0 (BitStream!2688 BitStream!2688) Bool)

(assert (=> b!79258 (= res!65603 (isPrefixOf!0 thiss!1107 (_2!3674 lt!126126)))))

(declare-fun b!79259 () Bool)

(assert (=> b!79259 (= e!52014 e!52017)))

(declare-fun res!65608 () Bool)

(assert (=> b!79259 (=> (not res!65608) (not e!52017))))

(assert (=> b!79259 (= res!65608 (and (= (_2!3675 lt!126125) lt!126121) (= (_1!3675 lt!126125) (_2!3674 lt!126126))))))

(declare-fun readBitPure!0 (BitStream!2688) tuple2!7076)

(declare-fun readerFrom!0 (BitStream!2688 (_ BitVec 32) (_ BitVec 32)) BitStream!2688)

(assert (=> b!79259 (= lt!126125 (readBitPure!0 (readerFrom!0 (_2!3674 lt!126126) (currentBit!3819 thiss!1107) (currentByte!3824 thiss!1107))))))

(declare-fun b!79260 () Bool)

(declare-fun lt!126124 () (_ BitVec 64))

(declare-fun lt!126122 () (_ BitVec 64))

(assert (=> b!79260 (= e!52018 (or (not (= lt!126124 #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!126124 (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!126122) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!79260 (= lt!126124 (bvand lt!126122 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!79260 (= lt!126122 (bitIndex!0 (size!1563 (buf!1953 thiss!1107)) (currentByte!3824 thiss!1107) (currentBit!3819 thiss!1107)))))

(assert (= (and start!15656 res!65602) b!79256))

(assert (= (and b!79256 res!65606) b!79253))

(assert (= (and b!79253 res!65607) b!79257))

(assert (= (and b!79257 res!65604) b!79258))

(assert (= (and b!79258 res!65603) b!79259))

(assert (= (and b!79259 res!65608) b!79255))

(assert (= (and b!79253 (not res!65605)) b!79260))

(assert (= start!15656 b!79254))

(declare-fun m!124681 () Bool)

(assert (=> b!79256 m!124681))

(declare-fun m!124683 () Bool)

(assert (=> b!79255 m!124683))

(declare-fun m!124685 () Bool)

(assert (=> b!79253 m!124685))

(declare-fun m!124687 () Bool)

(assert (=> b!79253 m!124687))

(declare-fun m!124689 () Bool)

(assert (=> b!79254 m!124689))

(declare-fun m!124691 () Bool)

(assert (=> start!15656 m!124691))

(declare-fun m!124693 () Bool)

(assert (=> b!79260 m!124693))

(declare-fun m!124695 () Bool)

(assert (=> b!79257 m!124695))

(assert (=> b!79257 m!124693))

(declare-fun m!124697 () Bool)

(assert (=> b!79258 m!124697))

(declare-fun m!124699 () Bool)

(assert (=> b!79259 m!124699))

(assert (=> b!79259 m!124699))

(declare-fun m!124701 () Bool)

(assert (=> b!79259 m!124701))

(check-sat (not b!79259) (not b!79258) (not b!79257) (not b!79253) (not b!79255) (not b!79260) (not b!79254) (not b!79256) (not start!15656))
(check-sat)
(get-model)

(declare-fun d!25004 () Bool)

(assert (=> d!25004 (= (array_inv!1409 (buf!1953 thiss!1107)) (bvsge (size!1563 (buf!1953 thiss!1107)) #b00000000000000000000000000000000))))

(assert (=> b!79254 d!25004))

(declare-fun d!25006 () Bool)

(declare-datatypes ((tuple2!7082 0))(
  ( (tuple2!7083 (_1!3678 Bool) (_2!3678 BitStream!2688)) )
))
(declare-fun lt!126150 () tuple2!7082)

(declare-fun readBit!0 (BitStream!2688) tuple2!7082)

(assert (=> d!25006 (= lt!126150 (readBit!0 (readerFrom!0 (_2!3674 lt!126126) (currentBit!3819 thiss!1107) (currentByte!3824 thiss!1107))))))

(assert (=> d!25006 (= (readBitPure!0 (readerFrom!0 (_2!3674 lt!126126) (currentBit!3819 thiss!1107) (currentByte!3824 thiss!1107))) (tuple2!7077 (_2!3678 lt!126150) (_1!3678 lt!126150)))))

(declare-fun bs!6063 () Bool)

(assert (= bs!6063 d!25006))

(assert (=> bs!6063 m!124699))

(declare-fun m!124725 () Bool)

(assert (=> bs!6063 m!124725))

(assert (=> b!79259 d!25006))

(declare-fun d!25008 () Bool)

(declare-fun e!52044 () Bool)

(assert (=> d!25008 e!52044))

(declare-fun res!65633 () Bool)

(assert (=> d!25008 (=> (not res!65633) (not e!52044))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!25008 (= res!65633 (invariant!0 (currentBit!3819 (_2!3674 lt!126126)) (currentByte!3824 (_2!3674 lt!126126)) (size!1563 (buf!1953 (_2!3674 lt!126126)))))))

(assert (=> d!25008 (= (readerFrom!0 (_2!3674 lt!126126) (currentBit!3819 thiss!1107) (currentByte!3824 thiss!1107)) (BitStream!2689 (buf!1953 (_2!3674 lt!126126)) (currentByte!3824 thiss!1107) (currentBit!3819 thiss!1107)))))

(declare-fun b!79287 () Bool)

(assert (=> b!79287 (= e!52044 (invariant!0 (currentBit!3819 thiss!1107) (currentByte!3824 thiss!1107) (size!1563 (buf!1953 (_2!3674 lt!126126)))))))

(assert (= (and d!25008 res!65633) b!79287))

(declare-fun m!124727 () Bool)

(assert (=> d!25008 m!124727))

(declare-fun m!124729 () Bool)

(assert (=> b!79287 m!124729))

(assert (=> b!79259 d!25008))

(declare-fun d!25010 () Bool)

(declare-fun e!52047 () Bool)

(assert (=> d!25010 e!52047))

(declare-fun res!65638 () Bool)

(assert (=> d!25010 (=> (not res!65638) (not e!52047))))

(declare-fun lt!126166 () (_ BitVec 64))

(declare-fun lt!126165 () (_ BitVec 64))

(declare-fun lt!126168 () (_ BitVec 64))

(assert (=> d!25010 (= res!65638 (= lt!126165 (bvsub lt!126168 lt!126166)))))

(assert (=> d!25010 (or (= (bvand lt!126168 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!126166 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!126168 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!126168 lt!126166) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!25010 (= lt!126166 (remainingBits!0 ((_ sign_extend 32) (size!1563 (buf!1953 thiss!1107))) ((_ sign_extend 32) (currentByte!3824 thiss!1107)) ((_ sign_extend 32) (currentBit!3819 thiss!1107))))))

(declare-fun lt!126163 () (_ BitVec 64))

(declare-fun lt!126164 () (_ BitVec 64))

(assert (=> d!25010 (= lt!126168 (bvmul lt!126163 lt!126164))))

(assert (=> d!25010 (or (= lt!126163 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!126164 (bvsdiv (bvmul lt!126163 lt!126164) lt!126163)))))

(assert (=> d!25010 (= lt!126164 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!25010 (= lt!126163 ((_ sign_extend 32) (size!1563 (buf!1953 thiss!1107))))))

(assert (=> d!25010 (= lt!126165 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3824 thiss!1107)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3819 thiss!1107))))))

(assert (=> d!25010 (invariant!0 (currentBit!3819 thiss!1107) (currentByte!3824 thiss!1107) (size!1563 (buf!1953 thiss!1107)))))

(assert (=> d!25010 (= (bitIndex!0 (size!1563 (buf!1953 thiss!1107)) (currentByte!3824 thiss!1107) (currentBit!3819 thiss!1107)) lt!126165)))

(declare-fun b!79292 () Bool)

(declare-fun res!65639 () Bool)

(assert (=> b!79292 (=> (not res!65639) (not e!52047))))

(assert (=> b!79292 (= res!65639 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!126165))))

(declare-fun b!79293 () Bool)

(declare-fun lt!126167 () (_ BitVec 64))

(assert (=> b!79293 (= e!52047 (bvsle lt!126165 (bvmul lt!126167 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!79293 (or (= lt!126167 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!126167 #b0000000000000000000000000000000000000000000000000000000000001000) lt!126167)))))

(assert (=> b!79293 (= lt!126167 ((_ sign_extend 32) (size!1563 (buf!1953 thiss!1107))))))

(assert (= (and d!25010 res!65638) b!79292))

(assert (= (and b!79292 res!65639) b!79293))

(declare-fun m!124731 () Bool)

(assert (=> d!25010 m!124731))

(declare-fun m!124733 () Bool)

(assert (=> d!25010 m!124733))

(assert (=> b!79260 d!25010))

(declare-fun d!25012 () Bool)

(declare-fun e!52048 () Bool)

(assert (=> d!25012 e!52048))

(declare-fun res!65640 () Bool)

(assert (=> d!25012 (=> (not res!65640) (not e!52048))))

(declare-fun lt!126172 () (_ BitVec 64))

(declare-fun lt!126174 () (_ BitVec 64))

(declare-fun lt!126171 () (_ BitVec 64))

(assert (=> d!25012 (= res!65640 (= lt!126171 (bvsub lt!126174 lt!126172)))))

(assert (=> d!25012 (or (= (bvand lt!126174 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!126172 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!126174 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!126174 lt!126172) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!25012 (= lt!126172 (remainingBits!0 ((_ sign_extend 32) (size!1563 (buf!1953 (_1!3675 lt!126125)))) ((_ sign_extend 32) (currentByte!3824 (_1!3675 lt!126125))) ((_ sign_extend 32) (currentBit!3819 (_1!3675 lt!126125)))))))

(declare-fun lt!126169 () (_ BitVec 64))

(declare-fun lt!126170 () (_ BitVec 64))

(assert (=> d!25012 (= lt!126174 (bvmul lt!126169 lt!126170))))

(assert (=> d!25012 (or (= lt!126169 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!126170 (bvsdiv (bvmul lt!126169 lt!126170) lt!126169)))))

(assert (=> d!25012 (= lt!126170 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!25012 (= lt!126169 ((_ sign_extend 32) (size!1563 (buf!1953 (_1!3675 lt!126125)))))))

(assert (=> d!25012 (= lt!126171 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3824 (_1!3675 lt!126125))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3819 (_1!3675 lt!126125)))))))

(assert (=> d!25012 (invariant!0 (currentBit!3819 (_1!3675 lt!126125)) (currentByte!3824 (_1!3675 lt!126125)) (size!1563 (buf!1953 (_1!3675 lt!126125))))))

(assert (=> d!25012 (= (bitIndex!0 (size!1563 (buf!1953 (_1!3675 lt!126125))) (currentByte!3824 (_1!3675 lt!126125)) (currentBit!3819 (_1!3675 lt!126125))) lt!126171)))

(declare-fun b!79294 () Bool)

(declare-fun res!65641 () Bool)

(assert (=> b!79294 (=> (not res!65641) (not e!52048))))

(assert (=> b!79294 (= res!65641 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!126171))))

(declare-fun b!79295 () Bool)

(declare-fun lt!126173 () (_ BitVec 64))

(assert (=> b!79295 (= e!52048 (bvsle lt!126171 (bvmul lt!126173 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!79295 (or (= lt!126173 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!126173 #b0000000000000000000000000000000000000000000000000000000000001000) lt!126173)))))

(assert (=> b!79295 (= lt!126173 ((_ sign_extend 32) (size!1563 (buf!1953 (_1!3675 lt!126125)))))))

(assert (= (and d!25012 res!65640) b!79294))

(assert (= (and b!79294 res!65641) b!79295))

(declare-fun m!124735 () Bool)

(assert (=> d!25012 m!124735))

(declare-fun m!124737 () Bool)

(assert (=> d!25012 m!124737))

(assert (=> b!79255 d!25012))

(declare-fun d!25014 () Bool)

(declare-fun e!52049 () Bool)

(assert (=> d!25014 e!52049))

(declare-fun res!65642 () Bool)

(assert (=> d!25014 (=> (not res!65642) (not e!52049))))

(declare-fun lt!126177 () (_ BitVec 64))

(declare-fun lt!126178 () (_ BitVec 64))

(declare-fun lt!126180 () (_ BitVec 64))

(assert (=> d!25014 (= res!65642 (= lt!126177 (bvsub lt!126180 lt!126178)))))

(assert (=> d!25014 (or (= (bvand lt!126180 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!126178 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!126180 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!126180 lt!126178) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!25014 (= lt!126178 (remainingBits!0 ((_ sign_extend 32) (size!1563 (buf!1953 (_2!3674 lt!126126)))) ((_ sign_extend 32) (currentByte!3824 (_2!3674 lt!126126))) ((_ sign_extend 32) (currentBit!3819 (_2!3674 lt!126126)))))))

(declare-fun lt!126175 () (_ BitVec 64))

(declare-fun lt!126176 () (_ BitVec 64))

(assert (=> d!25014 (= lt!126180 (bvmul lt!126175 lt!126176))))

(assert (=> d!25014 (or (= lt!126175 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!126176 (bvsdiv (bvmul lt!126175 lt!126176) lt!126175)))))

(assert (=> d!25014 (= lt!126176 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!25014 (= lt!126175 ((_ sign_extend 32) (size!1563 (buf!1953 (_2!3674 lt!126126)))))))

(assert (=> d!25014 (= lt!126177 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3824 (_2!3674 lt!126126))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3819 (_2!3674 lt!126126)))))))

(assert (=> d!25014 (invariant!0 (currentBit!3819 (_2!3674 lt!126126)) (currentByte!3824 (_2!3674 lt!126126)) (size!1563 (buf!1953 (_2!3674 lt!126126))))))

(assert (=> d!25014 (= (bitIndex!0 (size!1563 (buf!1953 (_2!3674 lt!126126))) (currentByte!3824 (_2!3674 lt!126126)) (currentBit!3819 (_2!3674 lt!126126))) lt!126177)))

(declare-fun b!79296 () Bool)

(declare-fun res!65643 () Bool)

(assert (=> b!79296 (=> (not res!65643) (not e!52049))))

(assert (=> b!79296 (= res!65643 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!126177))))

(declare-fun b!79297 () Bool)

(declare-fun lt!126179 () (_ BitVec 64))

(assert (=> b!79297 (= e!52049 (bvsle lt!126177 (bvmul lt!126179 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!79297 (or (= lt!126179 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!126179 #b0000000000000000000000000000000000000000000000000000000000001000) lt!126179)))))

(assert (=> b!79297 (= lt!126179 ((_ sign_extend 32) (size!1563 (buf!1953 (_2!3674 lt!126126)))))))

(assert (= (and d!25014 res!65642) b!79296))

(assert (= (and b!79296 res!65643) b!79297))

(declare-fun m!124739 () Bool)

(assert (=> d!25014 m!124739))

(assert (=> d!25014 m!124727))

(assert (=> b!79257 d!25014))

(assert (=> b!79257 d!25010))

(declare-fun d!25016 () Bool)

(assert (=> d!25016 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!1563 (buf!1953 thiss!1107))) ((_ sign_extend 32) (currentByte!3824 thiss!1107)) ((_ sign_extend 32) (currentBit!3819 thiss!1107))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1563 (buf!1953 thiss!1107))) ((_ sign_extend 32) (currentByte!3824 thiss!1107)) ((_ sign_extend 32) (currentBit!3819 thiss!1107))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!6064 () Bool)

(assert (= bs!6064 d!25016))

(assert (=> bs!6064 m!124731))

(assert (=> b!79256 d!25016))

(declare-fun d!25018 () Bool)

(declare-fun res!65652 () Bool)

(declare-fun e!52055 () Bool)

(assert (=> d!25018 (=> (not res!65652) (not e!52055))))

(assert (=> d!25018 (= res!65652 (= (size!1563 (buf!1953 thiss!1107)) (size!1563 (buf!1953 (_2!3674 lt!126126)))))))

(assert (=> d!25018 (= (isPrefixOf!0 thiss!1107 (_2!3674 lt!126126)) e!52055)))

(declare-fun b!79304 () Bool)

(declare-fun res!65651 () Bool)

(assert (=> b!79304 (=> (not res!65651) (not e!52055))))

(assert (=> b!79304 (= res!65651 (bvsle (bitIndex!0 (size!1563 (buf!1953 thiss!1107)) (currentByte!3824 thiss!1107) (currentBit!3819 thiss!1107)) (bitIndex!0 (size!1563 (buf!1953 (_2!3674 lt!126126))) (currentByte!3824 (_2!3674 lt!126126)) (currentBit!3819 (_2!3674 lt!126126)))))))

(declare-fun b!79305 () Bool)

(declare-fun e!52054 () Bool)

(assert (=> b!79305 (= e!52055 e!52054)))

(declare-fun res!65650 () Bool)

(assert (=> b!79305 (=> res!65650 e!52054)))

(assert (=> b!79305 (= res!65650 (= (size!1563 (buf!1953 thiss!1107)) #b00000000000000000000000000000000))))

(declare-fun b!79306 () Bool)

(declare-fun arrayBitRangesEq!0 (array!3384 array!3384 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!79306 (= e!52054 (arrayBitRangesEq!0 (buf!1953 thiss!1107) (buf!1953 (_2!3674 lt!126126)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1563 (buf!1953 thiss!1107)) (currentByte!3824 thiss!1107) (currentBit!3819 thiss!1107))))))

(assert (= (and d!25018 res!65652) b!79304))

(assert (= (and b!79304 res!65651) b!79305))

(assert (= (and b!79305 (not res!65650)) b!79306))

(assert (=> b!79304 m!124693))

(assert (=> b!79304 m!124695))

(assert (=> b!79306 m!124693))

(assert (=> b!79306 m!124693))

(declare-fun m!124741 () Bool)

(assert (=> b!79306 m!124741))

(assert (=> b!79258 d!25018))

(declare-fun b!79340 () Bool)

(declare-fun e!52073 () Bool)

(declare-fun lt!126227 () tuple2!7076)

(declare-fun lt!126226 () tuple2!7074)

(assert (=> b!79340 (= e!52073 (= (bitIndex!0 (size!1563 (buf!1953 (_1!3675 lt!126227))) (currentByte!3824 (_1!3675 lt!126227)) (currentBit!3819 (_1!3675 lt!126227))) (bitIndex!0 (size!1563 (buf!1953 (_2!3674 lt!126226))) (currentByte!3824 (_2!3674 lt!126226)) (currentBit!3819 (_2!3674 lt!126226)))))))

(declare-fun b!79338 () Bool)

(declare-fun res!65686 () Bool)

(declare-fun e!52070 () Bool)

(assert (=> b!79338 (=> (not res!65686) (not e!52070))))

(assert (=> b!79338 (= res!65686 (isPrefixOf!0 thiss!1107 (_2!3674 lt!126226)))))

(declare-fun d!25022 () Bool)

(assert (=> d!25022 e!52070))

(declare-fun res!65683 () Bool)

(assert (=> d!25022 (=> (not res!65683) (not e!52070))))

(assert (=> d!25022 (= res!65683 (= (size!1563 (buf!1953 thiss!1107)) (size!1563 (buf!1953 (_2!3674 lt!126226)))))))

(declare-fun choose!16 (BitStream!2688 Bool) tuple2!7074)

(assert (=> d!25022 (= lt!126226 (choose!16 thiss!1107 lt!126121))))

(assert (=> d!25022 (validate_offset_bit!0 ((_ sign_extend 32) (size!1563 (buf!1953 thiss!1107))) ((_ sign_extend 32) (currentByte!3824 thiss!1107)) ((_ sign_extend 32) (currentBit!3819 thiss!1107)))))

(assert (=> d!25022 (= (appendBit!0 thiss!1107 lt!126121) lt!126226)))

(declare-fun b!79339 () Bool)

(assert (=> b!79339 (= e!52070 e!52073)))

(declare-fun res!65685 () Bool)

(assert (=> b!79339 (=> (not res!65685) (not e!52073))))

(assert (=> b!79339 (= res!65685 (and (= (_2!3675 lt!126227) lt!126121) (= (_1!3675 lt!126227) (_2!3674 lt!126226))))))

(assert (=> b!79339 (= lt!126227 (readBitPure!0 (readerFrom!0 (_2!3674 lt!126226) (currentBit!3819 thiss!1107) (currentByte!3824 thiss!1107))))))

(declare-fun b!79337 () Bool)

(declare-fun res!65681 () Bool)

(assert (=> b!79337 (=> (not res!65681) (not e!52070))))

(declare-fun lt!126228 () (_ BitVec 64))

(declare-fun lt!126225 () (_ BitVec 64))

(assert (=> b!79337 (= res!65681 (= (bitIndex!0 (size!1563 (buf!1953 (_2!3674 lt!126226))) (currentByte!3824 (_2!3674 lt!126226)) (currentBit!3819 (_2!3674 lt!126226))) (bvadd lt!126225 lt!126228)))))

(assert (=> b!79337 (or (not (= (bvand lt!126225 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!126228 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!126225 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!126225 lt!126228) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!79337 (= lt!126228 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!79337 (= lt!126225 (bitIndex!0 (size!1563 (buf!1953 thiss!1107)) (currentByte!3824 thiss!1107) (currentBit!3819 thiss!1107)))))

(assert (= (and d!25022 res!65683) b!79337))

(assert (= (and b!79337 res!65681) b!79338))

(assert (= (and b!79338 res!65686) b!79339))

(assert (= (and b!79339 res!65685) b!79340))

(declare-fun m!124763 () Bool)

(assert (=> d!25022 m!124763))

(assert (=> d!25022 m!124681))

(declare-fun m!124765 () Bool)

(assert (=> b!79337 m!124765))

(assert (=> b!79337 m!124693))

(declare-fun m!124767 () Bool)

(assert (=> b!79338 m!124767))

(declare-fun m!124769 () Bool)

(assert (=> b!79339 m!124769))

(assert (=> b!79339 m!124769))

(declare-fun m!124771 () Bool)

(assert (=> b!79339 m!124771))

(declare-fun m!124773 () Bool)

(assert (=> b!79340 m!124773))

(assert (=> b!79340 m!124765))

(assert (=> b!79253 d!25022))

(declare-fun d!25034 () Bool)

(assert (=> d!25034 (= (inv!12 thiss!1107) (invariant!0 (currentBit!3819 thiss!1107) (currentByte!3824 thiss!1107) (size!1563 (buf!1953 thiss!1107))))))

(declare-fun bs!6066 () Bool)

(assert (= bs!6066 d!25034))

(assert (=> bs!6066 m!124733))

(assert (=> start!15656 d!25034))

(check-sat (not b!79304) (not d!25006) (not d!25022) (not b!79287) (not b!79337) (not b!79339) (not d!25010) (not d!25012) (not b!79338) (not d!25034) (not d!25008) (not d!25016) (not d!25014) (not b!79306) (not b!79340))
