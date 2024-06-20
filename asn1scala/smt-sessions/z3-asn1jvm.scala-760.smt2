; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21798 () Bool)

(assert start!21798)

(declare-fun b!110112 () Bool)

(declare-fun res!90894 () Bool)

(declare-fun e!72177 () Bool)

(assert (=> b!110112 (=> (not res!90894) (not e!72177))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!110112 (= res!90894 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!110113 () Bool)

(declare-fun e!72179 () Bool)

(declare-datatypes ((array!5017 0))(
  ( (array!5018 (arr!2875 (Array (_ BitVec 32) (_ BitVec 8))) (size!2282 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4038 0))(
  ( (BitStream!4039 (buf!2676 array!5017) (currentByte!5224 (_ BitVec 32)) (currentBit!5219 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4038)

(declare-fun array_inv!2084 (array!5017) Bool)

(assert (=> b!110113 (= e!72179 (array_inv!2084 (buf!2676 thiss!1305)))))

(declare-fun b!110114 () Bool)

(declare-fun res!90892 () Bool)

(assert (=> b!110114 (=> (not res!90892) (not e!72177))))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!110114 (= res!90892 (bvsge i!615 nBits!396))))

(declare-fun b!110115 () Bool)

(declare-fun res!90893 () Bool)

(assert (=> b!110115 (=> (not res!90893) (not e!72177))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!110115 (= res!90893 (validate_offset_bits!1 ((_ sign_extend 32) (size!2282 (buf!2676 thiss!1305))) ((_ sign_extend 32) (currentByte!5224 thiss!1305)) ((_ sign_extend 32) (currentBit!5219 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun res!90895 () Bool)

(assert (=> start!21798 (=> (not res!90895) (not e!72177))))

(assert (=> start!21798 (= res!90895 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21798 e!72177))

(assert (=> start!21798 true))

(declare-fun inv!12 (BitStream!4038) Bool)

(assert (=> start!21798 (and (inv!12 thiss!1305) e!72179)))

(declare-fun b!110116 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!110116 (= e!72177 (not (invariant!0 (currentBit!5219 thiss!1305) (currentByte!5224 thiss!1305) (size!2282 (buf!2676 thiss!1305)))))))

(declare-fun isPrefixOf!0 (BitStream!4038 BitStream!4038) Bool)

(assert (=> b!110116 (isPrefixOf!0 thiss!1305 thiss!1305)))

(declare-datatypes ((Unit!6729 0))(
  ( (Unit!6730) )
))
(declare-fun lt!166940 () Unit!6729)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4038) Unit!6729)

(assert (=> b!110116 (= lt!166940 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (= (and start!21798 res!90895) b!110115))

(assert (= (and b!110115 res!90893) b!110112))

(assert (= (and b!110112 res!90894) b!110114))

(assert (= (and b!110114 res!90892) b!110116))

(assert (= start!21798 b!110113))

(declare-fun m!163711 () Bool)

(assert (=> b!110115 m!163711))

(declare-fun m!163713 () Bool)

(assert (=> b!110113 m!163713))

(declare-fun m!163715 () Bool)

(assert (=> b!110112 m!163715))

(declare-fun m!163717 () Bool)

(assert (=> start!21798 m!163717))

(declare-fun m!163719 () Bool)

(assert (=> b!110116 m!163719))

(declare-fun m!163721 () Bool)

(assert (=> b!110116 m!163721))

(declare-fun m!163723 () Bool)

(assert (=> b!110116 m!163723))

(check-sat (not b!110116) (not b!110113) (not b!110115) (not b!110112) (not start!21798))
(check-sat)
(get-model)

(declare-fun d!34694 () Bool)

(assert (=> d!34694 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!110112 d!34694))

(declare-fun d!34696 () Bool)

(assert (=> d!34696 (= (invariant!0 (currentBit!5219 thiss!1305) (currentByte!5224 thiss!1305) (size!2282 (buf!2676 thiss!1305))) (and (bvsge (currentBit!5219 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5219 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5224 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5224 thiss!1305) (size!2282 (buf!2676 thiss!1305))) (and (= (currentBit!5219 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5224 thiss!1305) (size!2282 (buf!2676 thiss!1305)))))))))

(assert (=> b!110116 d!34696))

(declare-fun d!34698 () Bool)

(declare-fun res!90918 () Bool)

(declare-fun e!72195 () Bool)

(assert (=> d!34698 (=> (not res!90918) (not e!72195))))

(assert (=> d!34698 (= res!90918 (= (size!2282 (buf!2676 thiss!1305)) (size!2282 (buf!2676 thiss!1305))))))

(assert (=> d!34698 (= (isPrefixOf!0 thiss!1305 thiss!1305) e!72195)))

(declare-fun b!110140 () Bool)

(declare-fun res!90920 () Bool)

(assert (=> b!110140 (=> (not res!90920) (not e!72195))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!110140 (= res!90920 (bvsle (bitIndex!0 (size!2282 (buf!2676 thiss!1305)) (currentByte!5224 thiss!1305) (currentBit!5219 thiss!1305)) (bitIndex!0 (size!2282 (buf!2676 thiss!1305)) (currentByte!5224 thiss!1305) (currentBit!5219 thiss!1305))))))

(declare-fun b!110141 () Bool)

(declare-fun e!72196 () Bool)

(assert (=> b!110141 (= e!72195 e!72196)))

(declare-fun res!90919 () Bool)

(assert (=> b!110141 (=> res!90919 e!72196)))

(assert (=> b!110141 (= res!90919 (= (size!2282 (buf!2676 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!110142 () Bool)

(declare-fun arrayBitRangesEq!0 (array!5017 array!5017 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!110142 (= e!72196 (arrayBitRangesEq!0 (buf!2676 thiss!1305) (buf!2676 thiss!1305) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2282 (buf!2676 thiss!1305)) (currentByte!5224 thiss!1305) (currentBit!5219 thiss!1305))))))

(assert (= (and d!34698 res!90918) b!110140))

(assert (= (and b!110140 res!90920) b!110141))

(assert (= (and b!110141 (not res!90919)) b!110142))

(declare-fun m!163741 () Bool)

(assert (=> b!110140 m!163741))

(assert (=> b!110140 m!163741))

(assert (=> b!110142 m!163741))

(assert (=> b!110142 m!163741))

(declare-fun m!163743 () Bool)

(assert (=> b!110142 m!163743))

(assert (=> b!110116 d!34698))

(declare-fun d!34716 () Bool)

(assert (=> d!34716 (isPrefixOf!0 thiss!1305 thiss!1305)))

(declare-fun lt!166946 () Unit!6729)

(declare-fun choose!11 (BitStream!4038) Unit!6729)

(assert (=> d!34716 (= lt!166946 (choose!11 thiss!1305))))

(assert (=> d!34716 (= (lemmaIsPrefixRefl!0 thiss!1305) lt!166946)))

(declare-fun bs!8483 () Bool)

(assert (= bs!8483 d!34716))

(assert (=> bs!8483 m!163721))

(declare-fun m!163749 () Bool)

(assert (=> bs!8483 m!163749))

(assert (=> b!110116 d!34716))

(declare-fun d!34720 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!34720 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2282 (buf!2676 thiss!1305))) ((_ sign_extend 32) (currentByte!5224 thiss!1305)) ((_ sign_extend 32) (currentBit!5219 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2282 (buf!2676 thiss!1305))) ((_ sign_extend 32) (currentByte!5224 thiss!1305)) ((_ sign_extend 32) (currentBit!5219 thiss!1305))) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun bs!8484 () Bool)

(assert (= bs!8484 d!34720))

(declare-fun m!163751 () Bool)

(assert (=> bs!8484 m!163751))

(assert (=> b!110115 d!34720))

(declare-fun d!34722 () Bool)

(assert (=> d!34722 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5219 thiss!1305) (currentByte!5224 thiss!1305) (size!2282 (buf!2676 thiss!1305))))))

(declare-fun bs!8486 () Bool)

(assert (= bs!8486 d!34722))

(assert (=> bs!8486 m!163719))

(assert (=> start!21798 d!34722))

(declare-fun d!34724 () Bool)

(assert (=> d!34724 (= (array_inv!2084 (buf!2676 thiss!1305)) (bvsge (size!2282 (buf!2676 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!110113 d!34724))

(check-sat (not d!34720) (not d!34716) (not b!110140) (not d!34722) (not b!110142))
(check-sat)
