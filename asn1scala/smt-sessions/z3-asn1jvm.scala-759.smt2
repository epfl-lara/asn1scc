; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21750 () Bool)

(assert start!21750)

(declare-fun b!110040 () Bool)

(declare-fun res!90830 () Bool)

(declare-fun e!72134 () Bool)

(assert (=> b!110040 (=> (not res!90830) (not e!72134))))

(declare-datatypes ((array!5008 0))(
  ( (array!5009 (arr!2872 (Array (_ BitVec 32) (_ BitVec 8))) (size!2279 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4032 0))(
  ( (BitStream!4033 (buf!2673 array!5008) (currentByte!5215 (_ BitVec 32)) (currentBit!5210 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4032)

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!110040 (= res!90830 (validate_offset_bits!1 ((_ sign_extend 32) (size!2279 (buf!2673 thiss!1305))) ((_ sign_extend 32) (currentByte!5215 thiss!1305)) ((_ sign_extend 32) (currentBit!5210 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!110041 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!110041 (= e!72134 (not (invariant!0 (currentBit!5210 thiss!1305) (currentByte!5215 thiss!1305) (size!2279 (buf!2673 thiss!1305)))))))

(declare-fun isPrefixOf!0 (BitStream!4032 BitStream!4032) Bool)

(assert (=> b!110041 (isPrefixOf!0 thiss!1305 thiss!1305)))

(declare-datatypes ((Unit!6723 0))(
  ( (Unit!6724) )
))
(declare-fun lt!166922 () Unit!6723)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4032) Unit!6723)

(assert (=> b!110041 (= lt!166922 (lemmaIsPrefixRefl!0 thiss!1305))))

(declare-fun b!110042 () Bool)

(declare-fun e!72132 () Bool)

(declare-fun array_inv!2081 (array!5008) Bool)

(assert (=> b!110042 (= e!72132 (array_inv!2081 (buf!2673 thiss!1305)))))

(declare-fun b!110043 () Bool)

(declare-fun res!90831 () Bool)

(assert (=> b!110043 (=> (not res!90831) (not e!72134))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!110043 (= res!90831 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!110044 () Bool)

(declare-fun res!90832 () Bool)

(assert (=> b!110044 (=> (not res!90832) (not e!72134))))

(assert (=> b!110044 (= res!90832 (bvsge i!615 nBits!396))))

(declare-fun res!90829 () Bool)

(assert (=> start!21750 (=> (not res!90829) (not e!72134))))

(assert (=> start!21750 (= res!90829 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21750 e!72134))

(assert (=> start!21750 true))

(declare-fun inv!12 (BitStream!4032) Bool)

(assert (=> start!21750 (and (inv!12 thiss!1305) e!72132)))

(assert (= (and start!21750 res!90829) b!110040))

(assert (= (and b!110040 res!90830) b!110043))

(assert (= (and b!110043 res!90831) b!110044))

(assert (= (and b!110044 res!90832) b!110041))

(assert (= start!21750 b!110042))

(declare-fun m!163645 () Bool)

(assert (=> b!110041 m!163645))

(declare-fun m!163647 () Bool)

(assert (=> b!110041 m!163647))

(declare-fun m!163649 () Bool)

(assert (=> b!110041 m!163649))

(declare-fun m!163651 () Bool)

(assert (=> b!110042 m!163651))

(declare-fun m!163653 () Bool)

(assert (=> b!110040 m!163653))

(declare-fun m!163655 () Bool)

(assert (=> b!110043 m!163655))

(declare-fun m!163657 () Bool)

(assert (=> start!21750 m!163657))

(check-sat (not b!110041) (not b!110042) (not b!110043) (not start!21750) (not b!110040))
(check-sat)
(get-model)

(declare-fun d!34650 () Bool)

(assert (=> d!34650 (= (invariant!0 (currentBit!5210 thiss!1305) (currentByte!5215 thiss!1305) (size!2279 (buf!2673 thiss!1305))) (and (bvsge (currentBit!5210 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5210 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5215 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5215 thiss!1305) (size!2279 (buf!2673 thiss!1305))) (and (= (currentBit!5210 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5215 thiss!1305) (size!2279 (buf!2673 thiss!1305)))))))))

(assert (=> b!110041 d!34650))

(declare-fun d!34652 () Bool)

(declare-fun res!90853 () Bool)

(declare-fun e!72149 () Bool)

(assert (=> d!34652 (=> (not res!90853) (not e!72149))))

(assert (=> d!34652 (= res!90853 (= (size!2279 (buf!2673 thiss!1305)) (size!2279 (buf!2673 thiss!1305))))))

(assert (=> d!34652 (= (isPrefixOf!0 thiss!1305 thiss!1305) e!72149)))

(declare-fun b!110066 () Bool)

(declare-fun res!90851 () Bool)

(assert (=> b!110066 (=> (not res!90851) (not e!72149))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!110066 (= res!90851 (bvsle (bitIndex!0 (size!2279 (buf!2673 thiss!1305)) (currentByte!5215 thiss!1305) (currentBit!5210 thiss!1305)) (bitIndex!0 (size!2279 (buf!2673 thiss!1305)) (currentByte!5215 thiss!1305) (currentBit!5210 thiss!1305))))))

(declare-fun b!110067 () Bool)

(declare-fun e!72148 () Bool)

(assert (=> b!110067 (= e!72149 e!72148)))

(declare-fun res!90852 () Bool)

(assert (=> b!110067 (=> res!90852 e!72148)))

(assert (=> b!110067 (= res!90852 (= (size!2279 (buf!2673 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!110068 () Bool)

(declare-fun arrayBitRangesEq!0 (array!5008 array!5008 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!110068 (= e!72148 (arrayBitRangesEq!0 (buf!2673 thiss!1305) (buf!2673 thiss!1305) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2279 (buf!2673 thiss!1305)) (currentByte!5215 thiss!1305) (currentBit!5210 thiss!1305))))))

(assert (= (and d!34652 res!90853) b!110066))

(assert (= (and b!110066 res!90851) b!110067))

(assert (= (and b!110067 (not res!90852)) b!110068))

(declare-fun m!163677 () Bool)

(assert (=> b!110066 m!163677))

(assert (=> b!110066 m!163677))

(assert (=> b!110068 m!163677))

(assert (=> b!110068 m!163677))

(declare-fun m!163679 () Bool)

(assert (=> b!110068 m!163679))

(assert (=> b!110041 d!34652))

(declare-fun d!34678 () Bool)

(assert (=> d!34678 (isPrefixOf!0 thiss!1305 thiss!1305)))

(declare-fun lt!166928 () Unit!6723)

(declare-fun choose!11 (BitStream!4032) Unit!6723)

(assert (=> d!34678 (= lt!166928 (choose!11 thiss!1305))))

(assert (=> d!34678 (= (lemmaIsPrefixRefl!0 thiss!1305) lt!166928)))

(declare-fun bs!8470 () Bool)

(assert (= bs!8470 d!34678))

(assert (=> bs!8470 m!163647))

(declare-fun m!163681 () Bool)

(assert (=> bs!8470 m!163681))

(assert (=> b!110041 d!34678))

(declare-fun d!34680 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!34680 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2279 (buf!2673 thiss!1305))) ((_ sign_extend 32) (currentByte!5215 thiss!1305)) ((_ sign_extend 32) (currentBit!5210 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2279 (buf!2673 thiss!1305))) ((_ sign_extend 32) (currentByte!5215 thiss!1305)) ((_ sign_extend 32) (currentBit!5210 thiss!1305))) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun bs!8471 () Bool)

(assert (= bs!8471 d!34680))

(declare-fun m!163683 () Bool)

(assert (=> bs!8471 m!163683))

(assert (=> b!110040 d!34680))

(declare-fun d!34682 () Bool)

(assert (=> d!34682 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!110043 d!34682))

(declare-fun d!34684 () Bool)

(assert (=> d!34684 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5210 thiss!1305) (currentByte!5215 thiss!1305) (size!2279 (buf!2673 thiss!1305))))))

(declare-fun bs!8472 () Bool)

(assert (= bs!8472 d!34684))

(assert (=> bs!8472 m!163645))

(assert (=> start!21750 d!34684))

(declare-fun d!34688 () Bool)

(assert (=> d!34688 (= (array_inv!2081 (buf!2673 thiss!1305)) (bvsge (size!2279 (buf!2673 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!110042 d!34688))

(check-sat (not b!110066) (not d!34678) (not d!34680) (not d!34684) (not b!110068))
(check-sat)
