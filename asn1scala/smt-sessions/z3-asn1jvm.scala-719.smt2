; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20112 () Bool)

(assert start!20112)

(declare-fun b!100605 () Bool)

(declare-fun res!82619 () Bool)

(declare-fun e!65810 () Bool)

(assert (=> b!100605 (=> (not res!82619) (not e!65810))))

(declare-datatypes ((array!4730 0))(
  ( (array!4731 (arr!2752 (Array (_ BitVec 32) (_ BitVec 8))) (size!2159 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3792 0))(
  ( (BitStream!3793 (buf!2516 array!4730) (currentByte!4971 (_ BitVec 32)) (currentBit!4966 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!3792)

(declare-datatypes ((Unit!6166 0))(
  ( (Unit!6167) )
))
(declare-datatypes ((tuple2!8122 0))(
  ( (tuple2!8123 (_1!4316 Unit!6166) (_2!4316 BitStream!3792)) )
))
(declare-fun lt!145774 () tuple2!8122)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!100605 (= res!82619 (invariant!0 (currentBit!4966 thiss!1305) (currentByte!4971 thiss!1305) (size!2159 (buf!2516 (_2!4316 lt!145774)))))))

(declare-fun b!100606 () Bool)

(declare-fun e!65811 () Bool)

(declare-datatypes ((tuple2!8124 0))(
  ( (tuple2!8125 (_1!4317 BitStream!3792) (_2!4317 Bool)) )
))
(declare-fun lt!145773 () tuple2!8124)

(declare-fun lt!145780 () tuple2!8124)

(assert (=> b!100606 (= e!65811 (= (_2!4317 lt!145773) (_2!4317 lt!145780)))))

(declare-fun b!100607 () Bool)

(declare-fun e!65812 () Bool)

(declare-fun e!65813 () Bool)

(assert (=> b!100607 (= e!65812 e!65813)))

(declare-fun res!82620 () Bool)

(assert (=> b!100607 (=> (not res!82620) (not e!65813))))

(declare-fun lt!145775 () Bool)

(declare-fun lt!145779 () tuple2!8124)

(assert (=> b!100607 (= res!82620 (and (= (_2!4317 lt!145779) lt!145775) (= (_1!4317 lt!145779) (_2!4316 lt!145774))))))

(declare-fun readBitPure!0 (BitStream!3792) tuple2!8124)

(declare-fun readerFrom!0 (BitStream!3792 (_ BitVec 32) (_ BitVec 32)) BitStream!3792)

(assert (=> b!100607 (= lt!145779 (readBitPure!0 (readerFrom!0 (_2!4316 lt!145774) (currentBit!4966 thiss!1305) (currentByte!4971 thiss!1305))))))

(declare-fun b!100608 () Bool)

(declare-fun lt!145776 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!100608 (= e!65813 (= (bitIndex!0 (size!2159 (buf!2516 (_1!4317 lt!145779))) (currentByte!4971 (_1!4317 lt!145779)) (currentBit!4966 (_1!4317 lt!145779))) lt!145776))))

(declare-fun b!100609 () Bool)

(declare-fun e!65814 () Bool)

(declare-fun array_inv!1961 (array!4730) Bool)

(assert (=> b!100609 (= e!65814 (array_inv!1961 (buf!2516 thiss!1305)))))

(declare-fun b!100610 () Bool)

(declare-fun lt!145782 () tuple2!8122)

(assert (=> b!100610 (= e!65810 (invariant!0 (currentBit!4966 thiss!1305) (currentByte!4971 thiss!1305) (size!2159 (buf!2516 (_2!4316 lt!145782)))))))

(declare-fun b!100611 () Bool)

(declare-fun res!82622 () Bool)

(declare-fun e!65807 () Bool)

(assert (=> b!100611 (=> (not res!82622) (not e!65807))))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!100611 (= res!82622 (validate_offset_bits!1 ((_ sign_extend 32) (size!2159 (buf!2516 thiss!1305))) ((_ sign_extend 32) (currentByte!4971 thiss!1305)) ((_ sign_extend 32) (currentBit!4966 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun res!82626 () Bool)

(assert (=> start!20112 (=> (not res!82626) (not e!65807))))

(assert (=> start!20112 (= res!82626 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20112 e!65807))

(assert (=> start!20112 true))

(declare-fun inv!12 (BitStream!3792) Bool)

(assert (=> start!20112 (and (inv!12 thiss!1305) e!65814)))

(declare-fun b!100612 () Bool)

(declare-datatypes ((tuple2!8126 0))(
  ( (tuple2!8127 (_1!4318 BitStream!3792) (_2!4318 BitStream!3792)) )
))
(declare-fun lt!145771 () tuple2!8126)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!100612 (= e!65807 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!2159 (buf!2516 (_1!4318 lt!145771)))) ((_ sign_extend 32) (currentByte!4971 (_1!4318 lt!145771))) ((_ sign_extend 32) (currentBit!4966 (_1!4318 lt!145771))))))))

(declare-fun lt!145778 () tuple2!8126)

(declare-fun reader!0 (BitStream!3792 BitStream!3792) tuple2!8126)

(assert (=> b!100612 (= lt!145778 (reader!0 (_2!4316 lt!145774) (_2!4316 lt!145782)))))

(assert (=> b!100612 (= lt!145771 (reader!0 thiss!1305 (_2!4316 lt!145782)))))

(assert (=> b!100612 e!65811))

(declare-fun res!82621 () Bool)

(assert (=> b!100612 (=> (not res!82621) (not e!65811))))

(assert (=> b!100612 (= res!82621 (= (bitIndex!0 (size!2159 (buf!2516 (_1!4317 lt!145773))) (currentByte!4971 (_1!4317 lt!145773)) (currentBit!4966 (_1!4317 lt!145773))) (bitIndex!0 (size!2159 (buf!2516 (_1!4317 lt!145780))) (currentByte!4971 (_1!4317 lt!145780)) (currentBit!4966 (_1!4317 lt!145780)))))))

(declare-fun lt!145781 () Unit!6166)

(declare-fun lt!145777 () BitStream!3792)

(declare-fun readBitPrefixLemma!0 (BitStream!3792 BitStream!3792) Unit!6166)

(assert (=> b!100612 (= lt!145781 (readBitPrefixLemma!0 lt!145777 (_2!4316 lt!145782)))))

(assert (=> b!100612 (= lt!145780 (readBitPure!0 (BitStream!3793 (buf!2516 (_2!4316 lt!145782)) (currentByte!4971 thiss!1305) (currentBit!4966 thiss!1305))))))

(assert (=> b!100612 (= lt!145773 (readBitPure!0 lt!145777))))

(assert (=> b!100612 (= lt!145777 (BitStream!3793 (buf!2516 (_2!4316 lt!145774)) (currentByte!4971 thiss!1305) (currentBit!4966 thiss!1305)))))

(assert (=> b!100612 e!65810))

(declare-fun res!82618 () Bool)

(assert (=> b!100612 (=> (not res!82618) (not e!65810))))

(declare-fun isPrefixOf!0 (BitStream!3792 BitStream!3792) Bool)

(assert (=> b!100612 (= res!82618 (isPrefixOf!0 thiss!1305 (_2!4316 lt!145782)))))

(declare-fun lt!145772 () Unit!6166)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3792 BitStream!3792 BitStream!3792) Unit!6166)

(assert (=> b!100612 (= lt!145772 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4316 lt!145774) (_2!4316 lt!145782)))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3792 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8122)

(assert (=> b!100612 (= lt!145782 (appendNLeastSignificantBitsLoop!0 (_2!4316 lt!145774) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!65809 () Bool)

(assert (=> b!100612 e!65809))

(declare-fun res!82628 () Bool)

(assert (=> b!100612 (=> (not res!82628) (not e!65809))))

(assert (=> b!100612 (= res!82628 (= (size!2159 (buf!2516 thiss!1305)) (size!2159 (buf!2516 (_2!4316 lt!145774)))))))

(declare-fun appendBit!0 (BitStream!3792 Bool) tuple2!8122)

(assert (=> b!100612 (= lt!145774 (appendBit!0 thiss!1305 lt!145775))))

(assert (=> b!100612 (= lt!145775 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!100613 () Bool)

(declare-fun res!82625 () Bool)

(assert (=> b!100613 (=> (not res!82625) (not e!65812))))

(assert (=> b!100613 (= res!82625 (isPrefixOf!0 thiss!1305 (_2!4316 lt!145774)))))

(declare-fun b!100614 () Bool)

(declare-fun res!82623 () Bool)

(assert (=> b!100614 (=> (not res!82623) (not e!65807))))

(assert (=> b!100614 (= res!82623 (bvslt i!615 nBits!396))))

(declare-fun b!100615 () Bool)

(declare-fun res!82627 () Bool)

(assert (=> b!100615 (=> (not res!82627) (not e!65807))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!100615 (= res!82627 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!100616 () Bool)

(assert (=> b!100616 (= e!65809 e!65812)))

(declare-fun res!82624 () Bool)

(assert (=> b!100616 (=> (not res!82624) (not e!65812))))

(declare-fun lt!145783 () (_ BitVec 64))

(assert (=> b!100616 (= res!82624 (= lt!145776 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!145783)))))

(assert (=> b!100616 (= lt!145776 (bitIndex!0 (size!2159 (buf!2516 (_2!4316 lt!145774))) (currentByte!4971 (_2!4316 lt!145774)) (currentBit!4966 (_2!4316 lt!145774))))))

(assert (=> b!100616 (= lt!145783 (bitIndex!0 (size!2159 (buf!2516 thiss!1305)) (currentByte!4971 thiss!1305) (currentBit!4966 thiss!1305)))))

(assert (= (and start!20112 res!82626) b!100611))

(assert (= (and b!100611 res!82622) b!100615))

(assert (= (and b!100615 res!82627) b!100614))

(assert (= (and b!100614 res!82623) b!100612))

(assert (= (and b!100612 res!82628) b!100616))

(assert (= (and b!100616 res!82624) b!100613))

(assert (= (and b!100613 res!82625) b!100607))

(assert (= (and b!100607 res!82620) b!100608))

(assert (= (and b!100612 res!82618) b!100605))

(assert (= (and b!100605 res!82619) b!100610))

(assert (= (and b!100612 res!82621) b!100606))

(assert (= start!20112 b!100609))

(declare-fun m!146227 () Bool)

(assert (=> b!100610 m!146227))

(declare-fun m!146229 () Bool)

(assert (=> b!100615 m!146229))

(declare-fun m!146231 () Bool)

(assert (=> b!100609 m!146231))

(declare-fun m!146233 () Bool)

(assert (=> b!100608 m!146233))

(declare-fun m!146235 () Bool)

(assert (=> b!100611 m!146235))

(declare-fun m!146237 () Bool)

(assert (=> b!100605 m!146237))

(declare-fun m!146239 () Bool)

(assert (=> b!100612 m!146239))

(declare-fun m!146241 () Bool)

(assert (=> b!100612 m!146241))

(declare-fun m!146243 () Bool)

(assert (=> b!100612 m!146243))

(declare-fun m!146245 () Bool)

(assert (=> b!100612 m!146245))

(declare-fun m!146247 () Bool)

(assert (=> b!100612 m!146247))

(declare-fun m!146249 () Bool)

(assert (=> b!100612 m!146249))

(declare-fun m!146251 () Bool)

(assert (=> b!100612 m!146251))

(declare-fun m!146253 () Bool)

(assert (=> b!100612 m!146253))

(declare-fun m!146255 () Bool)

(assert (=> b!100612 m!146255))

(declare-fun m!146257 () Bool)

(assert (=> b!100612 m!146257))

(declare-fun m!146259 () Bool)

(assert (=> b!100612 m!146259))

(declare-fun m!146261 () Bool)

(assert (=> b!100612 m!146261))

(declare-fun m!146263 () Bool)

(assert (=> b!100613 m!146263))

(declare-fun m!146265 () Bool)

(assert (=> b!100616 m!146265))

(declare-fun m!146267 () Bool)

(assert (=> b!100616 m!146267))

(declare-fun m!146269 () Bool)

(assert (=> start!20112 m!146269))

(declare-fun m!146271 () Bool)

(assert (=> b!100607 m!146271))

(assert (=> b!100607 m!146271))

(declare-fun m!146273 () Bool)

(assert (=> b!100607 m!146273))

(check-sat (not b!100616) (not start!20112) (not b!100612) (not b!100611) (not b!100607) (not b!100610) (not b!100613) (not b!100615) (not b!100609) (not b!100608) (not b!100605))
(check-sat)
(get-model)

(declare-fun d!31520 () Bool)

(declare-datatypes ((tuple2!8138 0))(
  ( (tuple2!8139 (_1!4324 Bool) (_2!4324 BitStream!3792)) )
))
(declare-fun lt!145825 () tuple2!8138)

(declare-fun readBit!0 (BitStream!3792) tuple2!8138)

(assert (=> d!31520 (= lt!145825 (readBit!0 (readerFrom!0 (_2!4316 lt!145774) (currentBit!4966 thiss!1305) (currentByte!4971 thiss!1305))))))

(assert (=> d!31520 (= (readBitPure!0 (readerFrom!0 (_2!4316 lt!145774) (currentBit!4966 thiss!1305) (currentByte!4971 thiss!1305))) (tuple2!8125 (_2!4324 lt!145825) (_1!4324 lt!145825)))))

(declare-fun bs!7726 () Bool)

(assert (= bs!7726 d!31520))

(assert (=> bs!7726 m!146271))

(declare-fun m!146323 () Bool)

(assert (=> bs!7726 m!146323))

(assert (=> b!100607 d!31520))

(declare-fun d!31522 () Bool)

(declare-fun e!65841 () Bool)

(assert (=> d!31522 e!65841))

(declare-fun res!82665 () Bool)

(assert (=> d!31522 (=> (not res!82665) (not e!65841))))

(assert (=> d!31522 (= res!82665 (invariant!0 (currentBit!4966 (_2!4316 lt!145774)) (currentByte!4971 (_2!4316 lt!145774)) (size!2159 (buf!2516 (_2!4316 lt!145774)))))))

(assert (=> d!31522 (= (readerFrom!0 (_2!4316 lt!145774) (currentBit!4966 thiss!1305) (currentByte!4971 thiss!1305)) (BitStream!3793 (buf!2516 (_2!4316 lt!145774)) (currentByte!4971 thiss!1305) (currentBit!4966 thiss!1305)))))

(declare-fun b!100655 () Bool)

(assert (=> b!100655 (= e!65841 (invariant!0 (currentBit!4966 thiss!1305) (currentByte!4971 thiss!1305) (size!2159 (buf!2516 (_2!4316 lt!145774)))))))

(assert (= (and d!31522 res!82665) b!100655))

(declare-fun m!146325 () Bool)

(assert (=> d!31522 m!146325))

(assert (=> b!100655 m!146237))

(assert (=> b!100607 d!31522))

(declare-fun d!31524 () Bool)

(assert (=> d!31524 (= (array_inv!1961 (buf!2516 thiss!1305)) (bvsge (size!2159 (buf!2516 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!100609 d!31524))

(declare-fun d!31526 () Bool)

(declare-fun e!65844 () Bool)

(assert (=> d!31526 e!65844))

(declare-fun res!82670 () Bool)

(assert (=> d!31526 (=> (not res!82670) (not e!65844))))

(declare-fun lt!145842 () (_ BitVec 64))

(declare-fun lt!145843 () (_ BitVec 64))

(declare-fun lt!145841 () (_ BitVec 64))

(assert (=> d!31526 (= res!82670 (= lt!145843 (bvsub lt!145842 lt!145841)))))

(assert (=> d!31526 (or (= (bvand lt!145842 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!145841 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!145842 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!145842 lt!145841) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!31526 (= lt!145841 (remainingBits!0 ((_ sign_extend 32) (size!2159 (buf!2516 (_1!4317 lt!145779)))) ((_ sign_extend 32) (currentByte!4971 (_1!4317 lt!145779))) ((_ sign_extend 32) (currentBit!4966 (_1!4317 lt!145779)))))))

(declare-fun lt!145838 () (_ BitVec 64))

(declare-fun lt!145840 () (_ BitVec 64))

(assert (=> d!31526 (= lt!145842 (bvmul lt!145838 lt!145840))))

(assert (=> d!31526 (or (= lt!145838 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!145840 (bvsdiv (bvmul lt!145838 lt!145840) lt!145838)))))

(assert (=> d!31526 (= lt!145840 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!31526 (= lt!145838 ((_ sign_extend 32) (size!2159 (buf!2516 (_1!4317 lt!145779)))))))

(assert (=> d!31526 (= lt!145843 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4971 (_1!4317 lt!145779))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4966 (_1!4317 lt!145779)))))))

(assert (=> d!31526 (invariant!0 (currentBit!4966 (_1!4317 lt!145779)) (currentByte!4971 (_1!4317 lt!145779)) (size!2159 (buf!2516 (_1!4317 lt!145779))))))

(assert (=> d!31526 (= (bitIndex!0 (size!2159 (buf!2516 (_1!4317 lt!145779))) (currentByte!4971 (_1!4317 lt!145779)) (currentBit!4966 (_1!4317 lt!145779))) lt!145843)))

(declare-fun b!100660 () Bool)

(declare-fun res!82671 () Bool)

(assert (=> b!100660 (=> (not res!82671) (not e!65844))))

(assert (=> b!100660 (= res!82671 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!145843))))

(declare-fun b!100661 () Bool)

(declare-fun lt!145839 () (_ BitVec 64))

(assert (=> b!100661 (= e!65844 (bvsle lt!145843 (bvmul lt!145839 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!100661 (or (= lt!145839 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!145839 #b0000000000000000000000000000000000000000000000000000000000001000) lt!145839)))))

(assert (=> b!100661 (= lt!145839 ((_ sign_extend 32) (size!2159 (buf!2516 (_1!4317 lt!145779)))))))

(assert (= (and d!31526 res!82670) b!100660))

(assert (= (and b!100660 res!82671) b!100661))

(declare-fun m!146327 () Bool)

(assert (=> d!31526 m!146327))

(declare-fun m!146329 () Bool)

(assert (=> d!31526 m!146329))

(assert (=> b!100608 d!31526))

(declare-fun d!31528 () Bool)

(assert (=> d!31528 (= (invariant!0 (currentBit!4966 thiss!1305) (currentByte!4971 thiss!1305) (size!2159 (buf!2516 (_2!4316 lt!145774)))) (and (bvsge (currentBit!4966 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!4966 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!4971 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!4971 thiss!1305) (size!2159 (buf!2516 (_2!4316 lt!145774)))) (and (= (currentBit!4966 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!4971 thiss!1305) (size!2159 (buf!2516 (_2!4316 lt!145774))))))))))

(assert (=> b!100605 d!31528))

(declare-fun d!31530 () Bool)

(assert (=> d!31530 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!100615 d!31530))

(declare-fun d!31532 () Bool)

(declare-fun e!65845 () Bool)

(assert (=> d!31532 e!65845))

(declare-fun res!82672 () Bool)

(assert (=> d!31532 (=> (not res!82672) (not e!65845))))

(declare-fun lt!145849 () (_ BitVec 64))

(declare-fun lt!145847 () (_ BitVec 64))

(declare-fun lt!145848 () (_ BitVec 64))

(assert (=> d!31532 (= res!82672 (= lt!145849 (bvsub lt!145848 lt!145847)))))

(assert (=> d!31532 (or (= (bvand lt!145848 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!145847 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!145848 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!145848 lt!145847) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31532 (= lt!145847 (remainingBits!0 ((_ sign_extend 32) (size!2159 (buf!2516 (_2!4316 lt!145774)))) ((_ sign_extend 32) (currentByte!4971 (_2!4316 lt!145774))) ((_ sign_extend 32) (currentBit!4966 (_2!4316 lt!145774)))))))

(declare-fun lt!145844 () (_ BitVec 64))

(declare-fun lt!145846 () (_ BitVec 64))

(assert (=> d!31532 (= lt!145848 (bvmul lt!145844 lt!145846))))

(assert (=> d!31532 (or (= lt!145844 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!145846 (bvsdiv (bvmul lt!145844 lt!145846) lt!145844)))))

(assert (=> d!31532 (= lt!145846 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!31532 (= lt!145844 ((_ sign_extend 32) (size!2159 (buf!2516 (_2!4316 lt!145774)))))))

(assert (=> d!31532 (= lt!145849 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4971 (_2!4316 lt!145774))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4966 (_2!4316 lt!145774)))))))

(assert (=> d!31532 (invariant!0 (currentBit!4966 (_2!4316 lt!145774)) (currentByte!4971 (_2!4316 lt!145774)) (size!2159 (buf!2516 (_2!4316 lt!145774))))))

(assert (=> d!31532 (= (bitIndex!0 (size!2159 (buf!2516 (_2!4316 lt!145774))) (currentByte!4971 (_2!4316 lt!145774)) (currentBit!4966 (_2!4316 lt!145774))) lt!145849)))

(declare-fun b!100662 () Bool)

(declare-fun res!82673 () Bool)

(assert (=> b!100662 (=> (not res!82673) (not e!65845))))

(assert (=> b!100662 (= res!82673 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!145849))))

(declare-fun b!100663 () Bool)

(declare-fun lt!145845 () (_ BitVec 64))

(assert (=> b!100663 (= e!65845 (bvsle lt!145849 (bvmul lt!145845 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!100663 (or (= lt!145845 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!145845 #b0000000000000000000000000000000000000000000000000000000000001000) lt!145845)))))

(assert (=> b!100663 (= lt!145845 ((_ sign_extend 32) (size!2159 (buf!2516 (_2!4316 lt!145774)))))))

(assert (= (and d!31532 res!82672) b!100662))

(assert (= (and b!100662 res!82673) b!100663))

(declare-fun m!146331 () Bool)

(assert (=> d!31532 m!146331))

(assert (=> d!31532 m!146325))

(assert (=> b!100616 d!31532))

(declare-fun d!31534 () Bool)

(declare-fun e!65846 () Bool)

(assert (=> d!31534 e!65846))

(declare-fun res!82674 () Bool)

(assert (=> d!31534 (=> (not res!82674) (not e!65846))))

(declare-fun lt!145855 () (_ BitVec 64))

(declare-fun lt!145854 () (_ BitVec 64))

(declare-fun lt!145853 () (_ BitVec 64))

(assert (=> d!31534 (= res!82674 (= lt!145855 (bvsub lt!145854 lt!145853)))))

(assert (=> d!31534 (or (= (bvand lt!145854 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!145853 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!145854 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!145854 lt!145853) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31534 (= lt!145853 (remainingBits!0 ((_ sign_extend 32) (size!2159 (buf!2516 thiss!1305))) ((_ sign_extend 32) (currentByte!4971 thiss!1305)) ((_ sign_extend 32) (currentBit!4966 thiss!1305))))))

(declare-fun lt!145850 () (_ BitVec 64))

(declare-fun lt!145852 () (_ BitVec 64))

(assert (=> d!31534 (= lt!145854 (bvmul lt!145850 lt!145852))))

(assert (=> d!31534 (or (= lt!145850 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!145852 (bvsdiv (bvmul lt!145850 lt!145852) lt!145850)))))

(assert (=> d!31534 (= lt!145852 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!31534 (= lt!145850 ((_ sign_extend 32) (size!2159 (buf!2516 thiss!1305))))))

(assert (=> d!31534 (= lt!145855 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4971 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4966 thiss!1305))))))

(assert (=> d!31534 (invariant!0 (currentBit!4966 thiss!1305) (currentByte!4971 thiss!1305) (size!2159 (buf!2516 thiss!1305)))))

(assert (=> d!31534 (= (bitIndex!0 (size!2159 (buf!2516 thiss!1305)) (currentByte!4971 thiss!1305) (currentBit!4966 thiss!1305)) lt!145855)))

(declare-fun b!100664 () Bool)

(declare-fun res!82675 () Bool)

(assert (=> b!100664 (=> (not res!82675) (not e!65846))))

(assert (=> b!100664 (= res!82675 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!145855))))

(declare-fun b!100665 () Bool)

(declare-fun lt!145851 () (_ BitVec 64))

(assert (=> b!100665 (= e!65846 (bvsle lt!145855 (bvmul lt!145851 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!100665 (or (= lt!145851 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!145851 #b0000000000000000000000000000000000000000000000000000000000001000) lt!145851)))))

(assert (=> b!100665 (= lt!145851 ((_ sign_extend 32) (size!2159 (buf!2516 thiss!1305))))))

(assert (= (and d!31534 res!82674) b!100664))

(assert (= (and b!100664 res!82675) b!100665))

(declare-fun m!146333 () Bool)

(assert (=> d!31534 m!146333))

(declare-fun m!146335 () Bool)

(assert (=> d!31534 m!146335))

(assert (=> b!100616 d!31534))

(declare-fun d!31536 () Bool)

(declare-fun res!82683 () Bool)

(declare-fun e!65851 () Bool)

(assert (=> d!31536 (=> (not res!82683) (not e!65851))))

(assert (=> d!31536 (= res!82683 (= (size!2159 (buf!2516 thiss!1305)) (size!2159 (buf!2516 (_2!4316 lt!145774)))))))

(assert (=> d!31536 (= (isPrefixOf!0 thiss!1305 (_2!4316 lt!145774)) e!65851)))

(declare-fun b!100672 () Bool)

(declare-fun res!82682 () Bool)

(assert (=> b!100672 (=> (not res!82682) (not e!65851))))

(assert (=> b!100672 (= res!82682 (bvsle (bitIndex!0 (size!2159 (buf!2516 thiss!1305)) (currentByte!4971 thiss!1305) (currentBit!4966 thiss!1305)) (bitIndex!0 (size!2159 (buf!2516 (_2!4316 lt!145774))) (currentByte!4971 (_2!4316 lt!145774)) (currentBit!4966 (_2!4316 lt!145774)))))))

(declare-fun b!100673 () Bool)

(declare-fun e!65852 () Bool)

(assert (=> b!100673 (= e!65851 e!65852)))

(declare-fun res!82684 () Bool)

(assert (=> b!100673 (=> res!82684 e!65852)))

(assert (=> b!100673 (= res!82684 (= (size!2159 (buf!2516 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!100674 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4730 array!4730 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!100674 (= e!65852 (arrayBitRangesEq!0 (buf!2516 thiss!1305) (buf!2516 (_2!4316 lt!145774)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2159 (buf!2516 thiss!1305)) (currentByte!4971 thiss!1305) (currentBit!4966 thiss!1305))))))

(assert (= (and d!31536 res!82683) b!100672))

(assert (= (and b!100672 res!82682) b!100673))

(assert (= (and b!100673 (not res!82684)) b!100674))

(assert (=> b!100672 m!146267))

(assert (=> b!100672 m!146265))

(assert (=> b!100674 m!146267))

(assert (=> b!100674 m!146267))

(declare-fun m!146339 () Bool)

(assert (=> b!100674 m!146339))

(assert (=> b!100613 d!31536))

(declare-fun b!100813 () Bool)

(declare-fun e!65935 () Bool)

(declare-fun lt!146241 () (_ BitVec 64))

(assert (=> b!100813 (= e!65935 (validate_offset_bits!1 ((_ sign_extend 32) (size!2159 (buf!2516 (_2!4316 lt!145774)))) ((_ sign_extend 32) (currentByte!4971 (_2!4316 lt!145774))) ((_ sign_extend 32) (currentBit!4966 (_2!4316 lt!145774))) lt!146241))))

(declare-fun b!100814 () Bool)

(declare-fun e!65931 () tuple2!8122)

(declare-fun lt!146234 () Unit!6166)

(assert (=> b!100814 (= e!65931 (tuple2!8123 lt!146234 (_2!4316 lt!145774)))))

(declare-fun lt!146244 () BitStream!3792)

(assert (=> b!100814 (= lt!146244 (_2!4316 lt!145774))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!3792) Unit!6166)

(assert (=> b!100814 (= lt!146234 (lemmaIsPrefixRefl!0 lt!146244))))

(declare-fun call!1261 () Bool)

(assert (=> b!100814 call!1261))

(declare-fun b!100815 () Bool)

(declare-fun res!82798 () Bool)

(assert (=> b!100815 (= res!82798 call!1261)))

(declare-fun e!65934 () Bool)

(assert (=> b!100815 (=> (not res!82798) (not e!65934))))

(declare-fun b!100816 () Bool)

(declare-fun e!65932 () (_ BitVec 64))

(assert (=> b!100816 (= e!65932 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!100817 () Bool)

(declare-fun e!65929 () Bool)

(declare-fun lt!146263 () tuple2!8124)

(declare-fun lt!146254 () tuple2!8124)

(assert (=> b!100817 (= e!65929 (= (_2!4317 lt!146263) (_2!4317 lt!146254)))))

(declare-fun b!100818 () Bool)

(declare-fun lt!146233 () tuple2!8122)

(declare-fun Unit!6176 () Unit!6166)

(assert (=> b!100818 (= e!65931 (tuple2!8123 Unit!6176 (_2!4316 lt!146233)))))

(declare-fun lt!146269 () Bool)

(assert (=> b!100818 (= lt!146269 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!146249 () tuple2!8122)

(assert (=> b!100818 (= lt!146249 (appendBit!0 (_2!4316 lt!145774) lt!146269))))

(declare-fun res!82799 () Bool)

(assert (=> b!100818 (= res!82799 (= (size!2159 (buf!2516 (_2!4316 lt!145774))) (size!2159 (buf!2516 (_2!4316 lt!146249)))))))

(assert (=> b!100818 (=> (not res!82799) (not e!65934))))

(assert (=> b!100818 e!65934))

(declare-fun lt!146259 () tuple2!8122)

(assert (=> b!100818 (= lt!146259 lt!146249)))

(assert (=> b!100818 (= lt!146233 (appendNLeastSignificantBitsLoop!0 (_2!4316 lt!146259) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!146245 () Unit!6166)

(assert (=> b!100818 (= lt!146245 (lemmaIsPrefixTransitive!0 (_2!4316 lt!145774) (_2!4316 lt!146259) (_2!4316 lt!146233)))))

(assert (=> b!100818 (isPrefixOf!0 (_2!4316 lt!145774) (_2!4316 lt!146233))))

(declare-fun lt!146240 () Unit!6166)

(assert (=> b!100818 (= lt!146240 lt!146245)))

(assert (=> b!100818 (invariant!0 (currentBit!4966 (_2!4316 lt!145774)) (currentByte!4971 (_2!4316 lt!145774)) (size!2159 (buf!2516 (_2!4316 lt!146259))))))

(declare-fun lt!146262 () BitStream!3792)

(assert (=> b!100818 (= lt!146262 (BitStream!3793 (buf!2516 (_2!4316 lt!146259)) (currentByte!4971 (_2!4316 lt!145774)) (currentBit!4966 (_2!4316 lt!145774))))))

(assert (=> b!100818 (invariant!0 (currentBit!4966 lt!146262) (currentByte!4971 lt!146262) (size!2159 (buf!2516 (_2!4316 lt!146233))))))

(declare-fun lt!146268 () BitStream!3792)

(assert (=> b!100818 (= lt!146268 (BitStream!3793 (buf!2516 (_2!4316 lt!146233)) (currentByte!4971 lt!146262) (currentBit!4966 lt!146262)))))

(assert (=> b!100818 (= lt!146263 (readBitPure!0 lt!146262))))

(assert (=> b!100818 (= lt!146254 (readBitPure!0 lt!146268))))

(declare-fun lt!146273 () Unit!6166)

(assert (=> b!100818 (= lt!146273 (readBitPrefixLemma!0 lt!146262 (_2!4316 lt!146233)))))

(declare-fun res!82805 () Bool)

(assert (=> b!100818 (= res!82805 (= (bitIndex!0 (size!2159 (buf!2516 (_1!4317 lt!146263))) (currentByte!4971 (_1!4317 lt!146263)) (currentBit!4966 (_1!4317 lt!146263))) (bitIndex!0 (size!2159 (buf!2516 (_1!4317 lt!146254))) (currentByte!4971 (_1!4317 lt!146254)) (currentBit!4966 (_1!4317 lt!146254)))))))

(assert (=> b!100818 (=> (not res!82805) (not e!65929))))

(assert (=> b!100818 e!65929))

(declare-fun lt!146272 () Unit!6166)

(assert (=> b!100818 (= lt!146272 lt!146273)))

(declare-fun lt!146274 () tuple2!8126)

(assert (=> b!100818 (= lt!146274 (reader!0 (_2!4316 lt!145774) (_2!4316 lt!146233)))))

(declare-fun lt!146253 () tuple2!8126)

(assert (=> b!100818 (= lt!146253 (reader!0 (_2!4316 lt!146259) (_2!4316 lt!146233)))))

(declare-fun lt!146257 () tuple2!8124)

(assert (=> b!100818 (= lt!146257 (readBitPure!0 (_1!4318 lt!146274)))))

(assert (=> b!100818 (= (_2!4317 lt!146257) lt!146269)))

(declare-fun lt!146231 () Unit!6166)

(declare-fun Unit!6177 () Unit!6166)

(assert (=> b!100818 (= lt!146231 Unit!6177)))

(declare-fun lt!146232 () (_ BitVec 64))

(assert (=> b!100818 (= lt!146232 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!146238 () (_ BitVec 64))

(assert (=> b!100818 (= lt!146238 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!146266 () Unit!6166)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3792 array!4730 (_ BitVec 64)) Unit!6166)

(assert (=> b!100818 (= lt!146266 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4316 lt!145774) (buf!2516 (_2!4316 lt!146233)) lt!146238))))

(assert (=> b!100818 (validate_offset_bits!1 ((_ sign_extend 32) (size!2159 (buf!2516 (_2!4316 lt!146233)))) ((_ sign_extend 32) (currentByte!4971 (_2!4316 lt!145774))) ((_ sign_extend 32) (currentBit!4966 (_2!4316 lt!145774))) lt!146238)))

(declare-fun lt!146237 () Unit!6166)

(assert (=> b!100818 (= lt!146237 lt!146266)))

(declare-datatypes ((tuple2!8142 0))(
  ( (tuple2!8143 (_1!4326 BitStream!3792) (_2!4326 (_ BitVec 64))) )
))
(declare-fun lt!146247 () tuple2!8142)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3792 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8142)

(assert (=> b!100818 (= lt!146247 (readNLeastSignificantBitsLoopPure!0 (_1!4318 lt!146274) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!146232))))

(declare-fun lt!146256 () (_ BitVec 64))

(assert (=> b!100818 (= lt!146256 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!146251 () Unit!6166)

(assert (=> b!100818 (= lt!146251 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4316 lt!146259) (buf!2516 (_2!4316 lt!146233)) lt!146256))))

(assert (=> b!100818 (validate_offset_bits!1 ((_ sign_extend 32) (size!2159 (buf!2516 (_2!4316 lt!146233)))) ((_ sign_extend 32) (currentByte!4971 (_2!4316 lt!146259))) ((_ sign_extend 32) (currentBit!4966 (_2!4316 lt!146259))) lt!146256)))

(declare-fun lt!146252 () Unit!6166)

(assert (=> b!100818 (= lt!146252 lt!146251)))

(declare-fun lt!146271 () tuple2!8142)

(assert (=> b!100818 (= lt!146271 (readNLeastSignificantBitsLoopPure!0 (_1!4318 lt!146253) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!146232 (ite (_2!4317 lt!146257) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!146267 () tuple2!8142)

(assert (=> b!100818 (= lt!146267 (readNLeastSignificantBitsLoopPure!0 (_1!4318 lt!146274) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!146232))))

(declare-fun c!6311 () Bool)

(assert (=> b!100818 (= c!6311 (_2!4317 (readBitPure!0 (_1!4318 lt!146274))))))

(declare-fun lt!146275 () tuple2!8142)

(declare-fun withMovedBitIndex!0 (BitStream!3792 (_ BitVec 64)) BitStream!3792)

(assert (=> b!100818 (= lt!146275 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4318 lt!146274) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!146232 e!65932)))))

(declare-fun lt!146246 () Unit!6166)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!3792 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6166)

(assert (=> b!100818 (= lt!146246 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4318 lt!146274) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!146232))))

(assert (=> b!100818 (and (= (_2!4326 lt!146267) (_2!4326 lt!146275)) (= (_1!4326 lt!146267) (_1!4326 lt!146275)))))

(declare-fun lt!146239 () Unit!6166)

(assert (=> b!100818 (= lt!146239 lt!146246)))

(assert (=> b!100818 (= (_1!4318 lt!146274) (withMovedBitIndex!0 (_2!4318 lt!146274) (bvsub (bitIndex!0 (size!2159 (buf!2516 (_2!4316 lt!145774))) (currentByte!4971 (_2!4316 lt!145774)) (currentBit!4966 (_2!4316 lt!145774))) (bitIndex!0 (size!2159 (buf!2516 (_2!4316 lt!146233))) (currentByte!4971 (_2!4316 lt!146233)) (currentBit!4966 (_2!4316 lt!146233))))))))

(declare-fun lt!146264 () Unit!6166)

(declare-fun Unit!6179 () Unit!6166)

(assert (=> b!100818 (= lt!146264 Unit!6179)))

(assert (=> b!100818 (= (_1!4318 lt!146253) (withMovedBitIndex!0 (_2!4318 lt!146253) (bvsub (bitIndex!0 (size!2159 (buf!2516 (_2!4316 lt!146259))) (currentByte!4971 (_2!4316 lt!146259)) (currentBit!4966 (_2!4316 lt!146259))) (bitIndex!0 (size!2159 (buf!2516 (_2!4316 lt!146233))) (currentByte!4971 (_2!4316 lt!146233)) (currentBit!4966 (_2!4316 lt!146233))))))))

(declare-fun lt!146255 () Unit!6166)

(declare-fun Unit!6180 () Unit!6166)

(assert (=> b!100818 (= lt!146255 Unit!6180)))

(assert (=> b!100818 (= (bitIndex!0 (size!2159 (buf!2516 (_2!4316 lt!145774))) (currentByte!4971 (_2!4316 lt!145774)) (currentBit!4966 (_2!4316 lt!145774))) (bvsub (bitIndex!0 (size!2159 (buf!2516 (_2!4316 lt!146259))) (currentByte!4971 (_2!4316 lt!146259)) (currentBit!4966 (_2!4316 lt!146259))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!146265 () Unit!6166)

(declare-fun Unit!6181 () Unit!6166)

(assert (=> b!100818 (= lt!146265 Unit!6181)))

(assert (=> b!100818 (= (_2!4326 lt!146247) (_2!4326 lt!146271))))

(declare-fun lt!146243 () Unit!6166)

(declare-fun Unit!6182 () Unit!6166)

(assert (=> b!100818 (= lt!146243 Unit!6182)))

(assert (=> b!100818 (= (_1!4326 lt!146247) (_2!4318 lt!146274))))

(declare-fun d!31544 () Bool)

(declare-fun e!65933 () Bool)

(assert (=> d!31544 e!65933))

(declare-fun res!82803 () Bool)

(assert (=> d!31544 (=> (not res!82803) (not e!65933))))

(declare-fun lt!146236 () tuple2!8122)

(assert (=> d!31544 (= res!82803 (= (size!2159 (buf!2516 (_2!4316 lt!145774))) (size!2159 (buf!2516 (_2!4316 lt!146236)))))))

(assert (=> d!31544 (= lt!146236 e!65931)))

(declare-fun c!6310 () Bool)

(assert (=> d!31544 (= c!6310 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!31544 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!31544 (= (appendNLeastSignificantBitsLoop!0 (_2!4316 lt!145774) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!146236)))

(declare-fun b!100819 () Bool)

(declare-fun res!82802 () Bool)

(assert (=> b!100819 (=> (not res!82802) (not e!65933))))

(declare-fun lt!146242 () (_ BitVec 64))

(declare-fun lt!146250 () (_ BitVec 64))

(assert (=> b!100819 (= res!82802 (= (bitIndex!0 (size!2159 (buf!2516 (_2!4316 lt!146236))) (currentByte!4971 (_2!4316 lt!146236)) (currentBit!4966 (_2!4316 lt!146236))) (bvadd lt!146250 lt!146242)))))

(assert (=> b!100819 (or (not (= (bvand lt!146250 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!146242 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!146250 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!146250 lt!146242) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!100819 (= lt!146242 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!100819 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!100819 (= lt!146250 (bitIndex!0 (size!2159 (buf!2516 (_2!4316 lt!145774))) (currentByte!4971 (_2!4316 lt!145774)) (currentBit!4966 (_2!4316 lt!145774))))))

(declare-fun bm!1258 () Bool)

(assert (=> bm!1258 (= call!1261 (isPrefixOf!0 (ite c!6310 (_2!4316 lt!145774) lt!146244) (ite c!6310 (_2!4316 lt!146249) lt!146244)))))

(declare-fun b!100820 () Bool)

(declare-fun res!82800 () Bool)

(assert (=> b!100820 (=> (not res!82800) (not e!65933))))

(assert (=> b!100820 (= res!82800 (isPrefixOf!0 (_2!4316 lt!145774) (_2!4316 lt!146236)))))

(declare-fun b!100821 () Bool)

(assert (=> b!100821 (= e!65932 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun b!100822 () Bool)

(declare-fun e!65930 () Bool)

(declare-fun lt!146248 () tuple2!8124)

(assert (=> b!100822 (= e!65930 (= (bitIndex!0 (size!2159 (buf!2516 (_1!4317 lt!146248))) (currentByte!4971 (_1!4317 lt!146248)) (currentBit!4966 (_1!4317 lt!146248))) (bitIndex!0 (size!2159 (buf!2516 (_2!4316 lt!146249))) (currentByte!4971 (_2!4316 lt!146249)) (currentBit!4966 (_2!4316 lt!146249)))))))

(declare-fun lt!146258 () tuple2!8142)

(declare-fun b!100823 () Bool)

(declare-fun lt!146235 () tuple2!8126)

(assert (=> b!100823 (= e!65933 (and (= (_2!4326 lt!146258) v!199) (= (_1!4326 lt!146258) (_2!4318 lt!146235))))))

(declare-fun lt!146270 () (_ BitVec 64))

(assert (=> b!100823 (= lt!146258 (readNLeastSignificantBitsLoopPure!0 (_1!4318 lt!146235) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!146270))))

(declare-fun lt!146260 () Unit!6166)

(declare-fun lt!146261 () Unit!6166)

(assert (=> b!100823 (= lt!146260 lt!146261)))

(assert (=> b!100823 (validate_offset_bits!1 ((_ sign_extend 32) (size!2159 (buf!2516 (_2!4316 lt!146236)))) ((_ sign_extend 32) (currentByte!4971 (_2!4316 lt!145774))) ((_ sign_extend 32) (currentBit!4966 (_2!4316 lt!145774))) lt!146241)))

(assert (=> b!100823 (= lt!146261 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4316 lt!145774) (buf!2516 (_2!4316 lt!146236)) lt!146241))))

(assert (=> b!100823 e!65935))

(declare-fun res!82797 () Bool)

(assert (=> b!100823 (=> (not res!82797) (not e!65935))))

(assert (=> b!100823 (= res!82797 (and (= (size!2159 (buf!2516 (_2!4316 lt!145774))) (size!2159 (buf!2516 (_2!4316 lt!146236)))) (bvsge lt!146241 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!100823 (= lt!146241 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!100823 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!100823 (= lt!146270 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!100823 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!100823 (= lt!146235 (reader!0 (_2!4316 lt!145774) (_2!4316 lt!146236)))))

(declare-fun b!100824 () Bool)

(declare-fun res!82804 () Bool)

(assert (=> b!100824 (= res!82804 (= (bitIndex!0 (size!2159 (buf!2516 (_2!4316 lt!146249))) (currentByte!4971 (_2!4316 lt!146249)) (currentBit!4966 (_2!4316 lt!146249))) (bvadd (bitIndex!0 (size!2159 (buf!2516 (_2!4316 lt!145774))) (currentByte!4971 (_2!4316 lt!145774)) (currentBit!4966 (_2!4316 lt!145774))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!100824 (=> (not res!82804) (not e!65934))))

(declare-fun b!100825 () Bool)

(assert (=> b!100825 (= lt!146248 (readBitPure!0 (readerFrom!0 (_2!4316 lt!146249) (currentBit!4966 (_2!4316 lt!145774)) (currentByte!4971 (_2!4316 lt!145774)))))))

(declare-fun res!82801 () Bool)

(assert (=> b!100825 (= res!82801 (and (= (_2!4317 lt!146248) lt!146269) (= (_1!4317 lt!146248) (_2!4316 lt!146249))))))

(assert (=> b!100825 (=> (not res!82801) (not e!65930))))

(assert (=> b!100825 (= e!65934 e!65930)))

(assert (= (and d!31544 c!6310) b!100818))

(assert (= (and d!31544 (not c!6310)) b!100814))

(assert (= (and b!100818 res!82799) b!100824))

(assert (= (and b!100824 res!82804) b!100815))

(assert (= (and b!100815 res!82798) b!100825))

(assert (= (and b!100825 res!82801) b!100822))

(assert (= (and b!100818 res!82805) b!100817))

(assert (= (and b!100818 c!6311) b!100821))

(assert (= (and b!100818 (not c!6311)) b!100816))

(assert (= (or b!100815 b!100814) bm!1258))

(assert (= (and d!31544 res!82803) b!100819))

(assert (= (and b!100819 res!82802) b!100820))

(assert (= (and b!100820 res!82800) b!100823))

(assert (= (and b!100823 res!82797) b!100813))

(declare-fun m!146519 () Bool)

(assert (=> b!100814 m!146519))

(declare-fun m!146521 () Bool)

(assert (=> b!100824 m!146521))

(assert (=> b!100824 m!146265))

(declare-fun m!146523 () Bool)

(assert (=> b!100819 m!146523))

(assert (=> b!100819 m!146265))

(declare-fun m!146525 () Bool)

(assert (=> b!100818 m!146525))

(declare-fun m!146527 () Bool)

(assert (=> b!100818 m!146527))

(declare-fun m!146529 () Bool)

(assert (=> b!100818 m!146529))

(declare-fun m!146531 () Bool)

(assert (=> b!100818 m!146531))

(declare-fun m!146533 () Bool)

(assert (=> b!100818 m!146533))

(declare-fun m!146535 () Bool)

(assert (=> b!100818 m!146535))

(declare-fun m!146537 () Bool)

(assert (=> b!100818 m!146537))

(assert (=> b!100818 m!146265))

(declare-fun m!146539 () Bool)

(assert (=> b!100818 m!146539))

(declare-fun m!146541 () Bool)

(assert (=> b!100818 m!146541))

(assert (=> b!100818 m!146529))

(declare-fun m!146543 () Bool)

(assert (=> b!100818 m!146543))

(declare-fun m!146545 () Bool)

(assert (=> b!100818 m!146545))

(declare-fun m!146547 () Bool)

(assert (=> b!100818 m!146547))

(declare-fun m!146549 () Bool)

(assert (=> b!100818 m!146549))

(declare-fun m!146551 () Bool)

(assert (=> b!100818 m!146551))

(declare-fun m!146553 () Bool)

(assert (=> b!100818 m!146553))

(declare-fun m!146555 () Bool)

(assert (=> b!100818 m!146555))

(declare-fun m!146557 () Bool)

(assert (=> b!100818 m!146557))

(declare-fun m!146559 () Bool)

(assert (=> b!100818 m!146559))

(declare-fun m!146561 () Bool)

(assert (=> b!100818 m!146561))

(declare-fun m!146563 () Bool)

(assert (=> b!100818 m!146563))

(declare-fun m!146565 () Bool)

(assert (=> b!100818 m!146565))

(declare-fun m!146567 () Bool)

(assert (=> b!100818 m!146567))

(declare-fun m!146569 () Bool)

(assert (=> b!100818 m!146569))

(declare-fun m!146571 () Bool)

(assert (=> b!100818 m!146571))

(declare-fun m!146573 () Bool)

(assert (=> b!100818 m!146573))

(declare-fun m!146575 () Bool)

(assert (=> b!100818 m!146575))

(declare-fun m!146577 () Bool)

(assert (=> b!100818 m!146577))

(declare-fun m!146579 () Bool)

(assert (=> b!100818 m!146579))

(declare-fun m!146581 () Bool)

(assert (=> bm!1258 m!146581))

(declare-fun m!146583 () Bool)

(assert (=> b!100825 m!146583))

(assert (=> b!100825 m!146583))

(declare-fun m!146585 () Bool)

(assert (=> b!100825 m!146585))

(declare-fun m!146587 () Bool)

(assert (=> b!100822 m!146587))

(assert (=> b!100822 m!146521))

(declare-fun m!146589 () Bool)

(assert (=> b!100820 m!146589))

(declare-fun m!146591 () Bool)

(assert (=> b!100823 m!146591))

(assert (=> b!100823 m!146567))

(declare-fun m!146593 () Bool)

(assert (=> b!100823 m!146593))

(declare-fun m!146595 () Bool)

(assert (=> b!100823 m!146595))

(declare-fun m!146597 () Bool)

(assert (=> b!100823 m!146597))

(declare-fun m!146599 () Bool)

(assert (=> b!100813 m!146599))

(assert (=> b!100612 d!31544))

(declare-fun d!31592 () Bool)

(declare-fun lt!146308 () tuple2!8138)

(assert (=> d!31592 (= lt!146308 (readBit!0 (BitStream!3793 (buf!2516 (_2!4316 lt!145782)) (currentByte!4971 thiss!1305) (currentBit!4966 thiss!1305))))))

(assert (=> d!31592 (= (readBitPure!0 (BitStream!3793 (buf!2516 (_2!4316 lt!145782)) (currentByte!4971 thiss!1305) (currentBit!4966 thiss!1305))) (tuple2!8125 (_2!4324 lt!146308) (_1!4324 lt!146308)))))

(declare-fun bs!7735 () Bool)

(assert (= bs!7735 d!31592))

(declare-fun m!146601 () Bool)

(assert (=> bs!7735 m!146601))

(assert (=> b!100612 d!31592))

(declare-fun lt!146570 () (_ BitVec 64))

(declare-fun b!100906 () Bool)

(declare-fun e!65976 () Bool)

(declare-fun lt!146567 () tuple2!8126)

(declare-fun lt!146566 () (_ BitVec 64))

(assert (=> b!100906 (= e!65976 (= (_1!4318 lt!146567) (withMovedBitIndex!0 (_2!4318 lt!146567) (bvsub lt!146566 lt!146570))))))

(assert (=> b!100906 (or (= (bvand lt!146566 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!146570 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!146566 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!146566 lt!146570) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!100906 (= lt!146570 (bitIndex!0 (size!2159 (buf!2516 (_2!4316 lt!145782))) (currentByte!4971 (_2!4316 lt!145782)) (currentBit!4966 (_2!4316 lt!145782))))))

(assert (=> b!100906 (= lt!146566 (bitIndex!0 (size!2159 (buf!2516 thiss!1305)) (currentByte!4971 thiss!1305) (currentBit!4966 thiss!1305)))))

(declare-fun d!31594 () Bool)

(assert (=> d!31594 e!65976))

(declare-fun res!82864 () Bool)

(assert (=> d!31594 (=> (not res!82864) (not e!65976))))

(assert (=> d!31594 (= res!82864 (isPrefixOf!0 (_1!4318 lt!146567) (_2!4318 lt!146567)))))

(declare-fun lt!146561 () BitStream!3792)

(assert (=> d!31594 (= lt!146567 (tuple2!8127 lt!146561 (_2!4316 lt!145782)))))

(declare-fun lt!146576 () Unit!6166)

(declare-fun lt!146577 () Unit!6166)

(assert (=> d!31594 (= lt!146576 lt!146577)))

(assert (=> d!31594 (isPrefixOf!0 lt!146561 (_2!4316 lt!145782))))

(assert (=> d!31594 (= lt!146577 (lemmaIsPrefixTransitive!0 lt!146561 (_2!4316 lt!145782) (_2!4316 lt!145782)))))

(declare-fun lt!146575 () Unit!6166)

(declare-fun lt!146572 () Unit!6166)

(assert (=> d!31594 (= lt!146575 lt!146572)))

(assert (=> d!31594 (isPrefixOf!0 lt!146561 (_2!4316 lt!145782))))

(assert (=> d!31594 (= lt!146572 (lemmaIsPrefixTransitive!0 lt!146561 thiss!1305 (_2!4316 lt!145782)))))

(declare-fun lt!146562 () Unit!6166)

(declare-fun e!65977 () Unit!6166)

(assert (=> d!31594 (= lt!146562 e!65977)))

(declare-fun c!6324 () Bool)

(assert (=> d!31594 (= c!6324 (not (= (size!2159 (buf!2516 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!146571 () Unit!6166)

(declare-fun lt!146563 () Unit!6166)

(assert (=> d!31594 (= lt!146571 lt!146563)))

(assert (=> d!31594 (isPrefixOf!0 (_2!4316 lt!145782) (_2!4316 lt!145782))))

(assert (=> d!31594 (= lt!146563 (lemmaIsPrefixRefl!0 (_2!4316 lt!145782)))))

(declare-fun lt!146573 () Unit!6166)

(declare-fun lt!146558 () Unit!6166)

(assert (=> d!31594 (= lt!146573 lt!146558)))

(assert (=> d!31594 (= lt!146558 (lemmaIsPrefixRefl!0 (_2!4316 lt!145782)))))

(declare-fun lt!146568 () Unit!6166)

(declare-fun lt!146559 () Unit!6166)

(assert (=> d!31594 (= lt!146568 lt!146559)))

(assert (=> d!31594 (isPrefixOf!0 lt!146561 lt!146561)))

(assert (=> d!31594 (= lt!146559 (lemmaIsPrefixRefl!0 lt!146561))))

(declare-fun lt!146564 () Unit!6166)

(declare-fun lt!146565 () Unit!6166)

(assert (=> d!31594 (= lt!146564 lt!146565)))

(assert (=> d!31594 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!31594 (= lt!146565 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!31594 (= lt!146561 (BitStream!3793 (buf!2516 (_2!4316 lt!145782)) (currentByte!4971 thiss!1305) (currentBit!4966 thiss!1305)))))

(assert (=> d!31594 (isPrefixOf!0 thiss!1305 (_2!4316 lt!145782))))

(assert (=> d!31594 (= (reader!0 thiss!1305 (_2!4316 lt!145782)) lt!146567)))

(declare-fun b!100907 () Bool)

(declare-fun Unit!6185 () Unit!6166)

(assert (=> b!100907 (= e!65977 Unit!6185)))

(declare-fun b!100908 () Bool)

(declare-fun lt!146574 () Unit!6166)

(assert (=> b!100908 (= e!65977 lt!146574)))

(declare-fun lt!146569 () (_ BitVec 64))

(assert (=> b!100908 (= lt!146569 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!146560 () (_ BitVec 64))

(assert (=> b!100908 (= lt!146560 (bitIndex!0 (size!2159 (buf!2516 thiss!1305)) (currentByte!4971 thiss!1305) (currentBit!4966 thiss!1305)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!4730 array!4730 (_ BitVec 64) (_ BitVec 64)) Unit!6166)

(assert (=> b!100908 (= lt!146574 (arrayBitRangesEqSymmetric!0 (buf!2516 thiss!1305) (buf!2516 (_2!4316 lt!145782)) lt!146569 lt!146560))))

(assert (=> b!100908 (arrayBitRangesEq!0 (buf!2516 (_2!4316 lt!145782)) (buf!2516 thiss!1305) lt!146569 lt!146560)))

(declare-fun b!100909 () Bool)

(declare-fun res!82863 () Bool)

(assert (=> b!100909 (=> (not res!82863) (not e!65976))))

(assert (=> b!100909 (= res!82863 (isPrefixOf!0 (_1!4318 lt!146567) thiss!1305))))

(declare-fun b!100910 () Bool)

(declare-fun res!82865 () Bool)

(assert (=> b!100910 (=> (not res!82865) (not e!65976))))

(assert (=> b!100910 (= res!82865 (isPrefixOf!0 (_2!4318 lt!146567) (_2!4316 lt!145782)))))

(assert (= (and d!31594 c!6324) b!100908))

(assert (= (and d!31594 (not c!6324)) b!100907))

(assert (= (and d!31594 res!82864) b!100909))

(assert (= (and b!100909 res!82863) b!100910))

(assert (= (and b!100910 res!82865) b!100906))

(assert (=> b!100908 m!146267))

(declare-fun m!146761 () Bool)

(assert (=> b!100908 m!146761))

(declare-fun m!146763 () Bool)

(assert (=> b!100908 m!146763))

(declare-fun m!146765 () Bool)

(assert (=> b!100906 m!146765))

(declare-fun m!146767 () Bool)

(assert (=> b!100906 m!146767))

(assert (=> b!100906 m!146267))

(declare-fun m!146769 () Bool)

(assert (=> b!100909 m!146769))

(declare-fun m!146771 () Bool)

(assert (=> b!100910 m!146771))

(declare-fun m!146773 () Bool)

(assert (=> d!31594 m!146773))

(declare-fun m!146775 () Bool)

(assert (=> d!31594 m!146775))

(declare-fun m!146777 () Bool)

(assert (=> d!31594 m!146777))

(assert (=> d!31594 m!146241))

(declare-fun m!146779 () Bool)

(assert (=> d!31594 m!146779))

(declare-fun m!146781 () Bool)

(assert (=> d!31594 m!146781))

(declare-fun m!146783 () Bool)

(assert (=> d!31594 m!146783))

(declare-fun m!146785 () Bool)

(assert (=> d!31594 m!146785))

(declare-fun m!146787 () Bool)

(assert (=> d!31594 m!146787))

(declare-fun m!146789 () Bool)

(assert (=> d!31594 m!146789))

(declare-fun m!146791 () Bool)

(assert (=> d!31594 m!146791))

(assert (=> b!100612 d!31594))

(declare-fun d!31622 () Bool)

(declare-fun res!82867 () Bool)

(declare-fun e!65978 () Bool)

(assert (=> d!31622 (=> (not res!82867) (not e!65978))))

(assert (=> d!31622 (= res!82867 (= (size!2159 (buf!2516 thiss!1305)) (size!2159 (buf!2516 (_2!4316 lt!145782)))))))

(assert (=> d!31622 (= (isPrefixOf!0 thiss!1305 (_2!4316 lt!145782)) e!65978)))

(declare-fun b!100911 () Bool)

(declare-fun res!82866 () Bool)

(assert (=> b!100911 (=> (not res!82866) (not e!65978))))

(assert (=> b!100911 (= res!82866 (bvsle (bitIndex!0 (size!2159 (buf!2516 thiss!1305)) (currentByte!4971 thiss!1305) (currentBit!4966 thiss!1305)) (bitIndex!0 (size!2159 (buf!2516 (_2!4316 lt!145782))) (currentByte!4971 (_2!4316 lt!145782)) (currentBit!4966 (_2!4316 lt!145782)))))))

(declare-fun b!100912 () Bool)

(declare-fun e!65979 () Bool)

(assert (=> b!100912 (= e!65978 e!65979)))

(declare-fun res!82868 () Bool)

(assert (=> b!100912 (=> res!82868 e!65979)))

(assert (=> b!100912 (= res!82868 (= (size!2159 (buf!2516 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!100913 () Bool)

(assert (=> b!100913 (= e!65979 (arrayBitRangesEq!0 (buf!2516 thiss!1305) (buf!2516 (_2!4316 lt!145782)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2159 (buf!2516 thiss!1305)) (currentByte!4971 thiss!1305) (currentBit!4966 thiss!1305))))))

(assert (= (and d!31622 res!82867) b!100911))

(assert (= (and b!100911 res!82866) b!100912))

(assert (= (and b!100912 (not res!82868)) b!100913))

(assert (=> b!100911 m!146267))

(assert (=> b!100911 m!146767))

(assert (=> b!100913 m!146267))

(assert (=> b!100913 m!146267))

(declare-fun m!146793 () Bool)

(assert (=> b!100913 m!146793))

(assert (=> b!100612 d!31622))

(declare-fun b!100948 () Bool)

(declare-fun e!65996 () Bool)

(declare-fun e!65997 () Bool)

(assert (=> b!100948 (= e!65996 e!65997)))

(declare-fun res!82898 () Bool)

(assert (=> b!100948 (=> (not res!82898) (not e!65997))))

(declare-fun lt!146631 () tuple2!8122)

(declare-fun lt!146629 () tuple2!8124)

(assert (=> b!100948 (= res!82898 (and (= (_2!4317 lt!146629) lt!145775) (= (_1!4317 lt!146629) (_2!4316 lt!146631))))))

(assert (=> b!100948 (= lt!146629 (readBitPure!0 (readerFrom!0 (_2!4316 lt!146631) (currentBit!4966 thiss!1305) (currentByte!4971 thiss!1305))))))

(declare-fun b!100946 () Bool)

(declare-fun res!82897 () Bool)

(assert (=> b!100946 (=> (not res!82897) (not e!65996))))

(declare-fun lt!146628 () (_ BitVec 64))

(declare-fun lt!146630 () (_ BitVec 64))

(assert (=> b!100946 (= res!82897 (= (bitIndex!0 (size!2159 (buf!2516 (_2!4316 lt!146631))) (currentByte!4971 (_2!4316 lt!146631)) (currentBit!4966 (_2!4316 lt!146631))) (bvadd lt!146630 lt!146628)))))

(assert (=> b!100946 (or (not (= (bvand lt!146630 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!146628 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!146630 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!146630 lt!146628) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!100946 (= lt!146628 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!100946 (= lt!146630 (bitIndex!0 (size!2159 (buf!2516 thiss!1305)) (currentByte!4971 thiss!1305) (currentBit!4966 thiss!1305)))))

(declare-fun b!100947 () Bool)

(declare-fun res!82899 () Bool)

(assert (=> b!100947 (=> (not res!82899) (not e!65996))))

(assert (=> b!100947 (= res!82899 (isPrefixOf!0 thiss!1305 (_2!4316 lt!146631)))))

(declare-fun b!100949 () Bool)

(assert (=> b!100949 (= e!65997 (= (bitIndex!0 (size!2159 (buf!2516 (_1!4317 lt!146629))) (currentByte!4971 (_1!4317 lt!146629)) (currentBit!4966 (_1!4317 lt!146629))) (bitIndex!0 (size!2159 (buf!2516 (_2!4316 lt!146631))) (currentByte!4971 (_2!4316 lt!146631)) (currentBit!4966 (_2!4316 lt!146631)))))))

(declare-fun d!31624 () Bool)

(assert (=> d!31624 e!65996))

(declare-fun res!82900 () Bool)

(assert (=> d!31624 (=> (not res!82900) (not e!65996))))

(assert (=> d!31624 (= res!82900 (= (size!2159 (buf!2516 thiss!1305)) (size!2159 (buf!2516 (_2!4316 lt!146631)))))))

(declare-fun choose!16 (BitStream!3792 Bool) tuple2!8122)

(assert (=> d!31624 (= lt!146631 (choose!16 thiss!1305 lt!145775))))

(assert (=> d!31624 (validate_offset_bit!0 ((_ sign_extend 32) (size!2159 (buf!2516 thiss!1305))) ((_ sign_extend 32) (currentByte!4971 thiss!1305)) ((_ sign_extend 32) (currentBit!4966 thiss!1305)))))

(assert (=> d!31624 (= (appendBit!0 thiss!1305 lt!145775) lt!146631)))

(assert (= (and d!31624 res!82900) b!100946))

(assert (= (and b!100946 res!82897) b!100947))

(assert (= (and b!100947 res!82899) b!100948))

(assert (= (and b!100948 res!82898) b!100949))

(declare-fun m!146843 () Bool)

(assert (=> b!100948 m!146843))

(assert (=> b!100948 m!146843))

(declare-fun m!146845 () Bool)

(assert (=> b!100948 m!146845))

(declare-fun m!146847 () Bool)

(assert (=> b!100946 m!146847))

(assert (=> b!100946 m!146267))

(declare-fun m!146849 () Bool)

(assert (=> b!100949 m!146849))

(assert (=> b!100949 m!146847))

(declare-fun m!146851 () Bool)

(assert (=> b!100947 m!146851))

(declare-fun m!146853 () Bool)

(assert (=> d!31624 m!146853))

(declare-fun m!146855 () Bool)

(assert (=> d!31624 m!146855))

(assert (=> b!100612 d!31624))

(declare-fun d!31638 () Bool)

(declare-fun lt!146632 () tuple2!8138)

(assert (=> d!31638 (= lt!146632 (readBit!0 lt!145777))))

(assert (=> d!31638 (= (readBitPure!0 lt!145777) (tuple2!8125 (_2!4324 lt!146632) (_1!4324 lt!146632)))))

(declare-fun bs!7742 () Bool)

(assert (= bs!7742 d!31638))

(declare-fun m!146857 () Bool)

(assert (=> bs!7742 m!146857))

(assert (=> b!100612 d!31638))

(declare-fun d!31640 () Bool)

(declare-fun e!66002 () Bool)

(assert (=> d!31640 e!66002))

(declare-fun res!82906 () Bool)

(assert (=> d!31640 (=> (not res!82906) (not e!66002))))

(declare-fun lt!146654 () tuple2!8124)

(declare-fun lt!146652 () tuple2!8124)

(assert (=> d!31640 (= res!82906 (= (bitIndex!0 (size!2159 (buf!2516 (_1!4317 lt!146654))) (currentByte!4971 (_1!4317 lt!146654)) (currentBit!4966 (_1!4317 lt!146654))) (bitIndex!0 (size!2159 (buf!2516 (_1!4317 lt!146652))) (currentByte!4971 (_1!4317 lt!146652)) (currentBit!4966 (_1!4317 lt!146652)))))))

(declare-fun lt!146653 () Unit!6166)

(declare-fun lt!146651 () BitStream!3792)

(declare-fun choose!50 (BitStream!3792 BitStream!3792 BitStream!3792 tuple2!8124 tuple2!8124 BitStream!3792 Bool tuple2!8124 tuple2!8124 BitStream!3792 Bool) Unit!6166)

(assert (=> d!31640 (= lt!146653 (choose!50 lt!145777 (_2!4316 lt!145782) lt!146651 lt!146654 (tuple2!8125 (_1!4317 lt!146654) (_2!4317 lt!146654)) (_1!4317 lt!146654) (_2!4317 lt!146654) lt!146652 (tuple2!8125 (_1!4317 lt!146652) (_2!4317 lt!146652)) (_1!4317 lt!146652) (_2!4317 lt!146652)))))

(assert (=> d!31640 (= lt!146652 (readBitPure!0 lt!146651))))

(assert (=> d!31640 (= lt!146654 (readBitPure!0 lt!145777))))

(assert (=> d!31640 (= lt!146651 (BitStream!3793 (buf!2516 (_2!4316 lt!145782)) (currentByte!4971 lt!145777) (currentBit!4966 lt!145777)))))

(assert (=> d!31640 (invariant!0 (currentBit!4966 lt!145777) (currentByte!4971 lt!145777) (size!2159 (buf!2516 (_2!4316 lt!145782))))))

(assert (=> d!31640 (= (readBitPrefixLemma!0 lt!145777 (_2!4316 lt!145782)) lt!146653)))

(declare-fun b!100955 () Bool)

(assert (=> b!100955 (= e!66002 (= (_2!4317 lt!146654) (_2!4317 lt!146652)))))

(assert (= (and d!31640 res!82906) b!100955))

(declare-fun m!146873 () Bool)

(assert (=> d!31640 m!146873))

(declare-fun m!146875 () Bool)

(assert (=> d!31640 m!146875))

(declare-fun m!146877 () Bool)

(assert (=> d!31640 m!146877))

(declare-fun m!146879 () Bool)

(assert (=> d!31640 m!146879))

(declare-fun m!146881 () Bool)

(assert (=> d!31640 m!146881))

(assert (=> d!31640 m!146243))

(assert (=> b!100612 d!31640))

(declare-fun d!31648 () Bool)

(assert (=> d!31648 (isPrefixOf!0 thiss!1305 (_2!4316 lt!145782))))

(declare-fun lt!146657 () Unit!6166)

(declare-fun choose!30 (BitStream!3792 BitStream!3792 BitStream!3792) Unit!6166)

(assert (=> d!31648 (= lt!146657 (choose!30 thiss!1305 (_2!4316 lt!145774) (_2!4316 lt!145782)))))

(assert (=> d!31648 (isPrefixOf!0 thiss!1305 (_2!4316 lt!145774))))

(assert (=> d!31648 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4316 lt!145774) (_2!4316 lt!145782)) lt!146657)))

(declare-fun bs!7743 () Bool)

(assert (= bs!7743 d!31648))

(assert (=> bs!7743 m!146241))

(declare-fun m!146883 () Bool)

(assert (=> bs!7743 m!146883))

(assert (=> bs!7743 m!146263))

(assert (=> b!100612 d!31648))

(declare-fun d!31650 () Bool)

(assert (=> d!31650 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!2159 (buf!2516 (_1!4318 lt!145771)))) ((_ sign_extend 32) (currentByte!4971 (_1!4318 lt!145771))) ((_ sign_extend 32) (currentBit!4966 (_1!4318 lt!145771)))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2159 (buf!2516 (_1!4318 lt!145771)))) ((_ sign_extend 32) (currentByte!4971 (_1!4318 lt!145771))) ((_ sign_extend 32) (currentBit!4966 (_1!4318 lt!145771)))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!7744 () Bool)

(assert (= bs!7744 d!31650))

(declare-fun m!146885 () Bool)

(assert (=> bs!7744 m!146885))

(assert (=> b!100612 d!31650))

(declare-fun d!31652 () Bool)

(declare-fun e!66003 () Bool)

(assert (=> d!31652 e!66003))

(declare-fun res!82907 () Bool)

(assert (=> d!31652 (=> (not res!82907) (not e!66003))))

(declare-fun lt!146661 () (_ BitVec 64))

(declare-fun lt!146663 () (_ BitVec 64))

(declare-fun lt!146662 () (_ BitVec 64))

(assert (=> d!31652 (= res!82907 (= lt!146663 (bvsub lt!146662 lt!146661)))))

(assert (=> d!31652 (or (= (bvand lt!146662 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!146661 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!146662 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!146662 lt!146661) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31652 (= lt!146661 (remainingBits!0 ((_ sign_extend 32) (size!2159 (buf!2516 (_1!4317 lt!145773)))) ((_ sign_extend 32) (currentByte!4971 (_1!4317 lt!145773))) ((_ sign_extend 32) (currentBit!4966 (_1!4317 lt!145773)))))))

(declare-fun lt!146658 () (_ BitVec 64))

(declare-fun lt!146660 () (_ BitVec 64))

(assert (=> d!31652 (= lt!146662 (bvmul lt!146658 lt!146660))))

(assert (=> d!31652 (or (= lt!146658 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!146660 (bvsdiv (bvmul lt!146658 lt!146660) lt!146658)))))

(assert (=> d!31652 (= lt!146660 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!31652 (= lt!146658 ((_ sign_extend 32) (size!2159 (buf!2516 (_1!4317 lt!145773)))))))

(assert (=> d!31652 (= lt!146663 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4971 (_1!4317 lt!145773))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4966 (_1!4317 lt!145773)))))))

(assert (=> d!31652 (invariant!0 (currentBit!4966 (_1!4317 lt!145773)) (currentByte!4971 (_1!4317 lt!145773)) (size!2159 (buf!2516 (_1!4317 lt!145773))))))

(assert (=> d!31652 (= (bitIndex!0 (size!2159 (buf!2516 (_1!4317 lt!145773))) (currentByte!4971 (_1!4317 lt!145773)) (currentBit!4966 (_1!4317 lt!145773))) lt!146663)))

(declare-fun b!100956 () Bool)

(declare-fun res!82908 () Bool)

(assert (=> b!100956 (=> (not res!82908) (not e!66003))))

(assert (=> b!100956 (= res!82908 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!146663))))

(declare-fun b!100957 () Bool)

(declare-fun lt!146659 () (_ BitVec 64))

(assert (=> b!100957 (= e!66003 (bvsle lt!146663 (bvmul lt!146659 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!100957 (or (= lt!146659 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!146659 #b0000000000000000000000000000000000000000000000000000000000001000) lt!146659)))))

(assert (=> b!100957 (= lt!146659 ((_ sign_extend 32) (size!2159 (buf!2516 (_1!4317 lt!145773)))))))

(assert (= (and d!31652 res!82907) b!100956))

(assert (= (and b!100956 res!82908) b!100957))

(declare-fun m!146887 () Bool)

(assert (=> d!31652 m!146887))

(declare-fun m!146889 () Bool)

(assert (=> d!31652 m!146889))

(assert (=> b!100612 d!31652))

(declare-fun d!31654 () Bool)

(declare-fun e!66004 () Bool)

(assert (=> d!31654 e!66004))

(declare-fun res!82909 () Bool)

(assert (=> d!31654 (=> (not res!82909) (not e!66004))))

(declare-fun lt!146669 () (_ BitVec 64))

(declare-fun lt!146667 () (_ BitVec 64))

(declare-fun lt!146668 () (_ BitVec 64))

(assert (=> d!31654 (= res!82909 (= lt!146669 (bvsub lt!146668 lt!146667)))))

(assert (=> d!31654 (or (= (bvand lt!146668 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!146667 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!146668 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!146668 lt!146667) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31654 (= lt!146667 (remainingBits!0 ((_ sign_extend 32) (size!2159 (buf!2516 (_1!4317 lt!145780)))) ((_ sign_extend 32) (currentByte!4971 (_1!4317 lt!145780))) ((_ sign_extend 32) (currentBit!4966 (_1!4317 lt!145780)))))))

(declare-fun lt!146664 () (_ BitVec 64))

(declare-fun lt!146666 () (_ BitVec 64))

(assert (=> d!31654 (= lt!146668 (bvmul lt!146664 lt!146666))))

(assert (=> d!31654 (or (= lt!146664 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!146666 (bvsdiv (bvmul lt!146664 lt!146666) lt!146664)))))

(assert (=> d!31654 (= lt!146666 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!31654 (= lt!146664 ((_ sign_extend 32) (size!2159 (buf!2516 (_1!4317 lt!145780)))))))

(assert (=> d!31654 (= lt!146669 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4971 (_1!4317 lt!145780))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4966 (_1!4317 lt!145780)))))))

(assert (=> d!31654 (invariant!0 (currentBit!4966 (_1!4317 lt!145780)) (currentByte!4971 (_1!4317 lt!145780)) (size!2159 (buf!2516 (_1!4317 lt!145780))))))

(assert (=> d!31654 (= (bitIndex!0 (size!2159 (buf!2516 (_1!4317 lt!145780))) (currentByte!4971 (_1!4317 lt!145780)) (currentBit!4966 (_1!4317 lt!145780))) lt!146669)))

(declare-fun b!100958 () Bool)

(declare-fun res!82910 () Bool)

(assert (=> b!100958 (=> (not res!82910) (not e!66004))))

(assert (=> b!100958 (= res!82910 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!146669))))

(declare-fun b!100959 () Bool)

(declare-fun lt!146665 () (_ BitVec 64))

(assert (=> b!100959 (= e!66004 (bvsle lt!146669 (bvmul lt!146665 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!100959 (or (= lt!146665 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!146665 #b0000000000000000000000000000000000000000000000000000000000001000) lt!146665)))))

(assert (=> b!100959 (= lt!146665 ((_ sign_extend 32) (size!2159 (buf!2516 (_1!4317 lt!145780)))))))

(assert (= (and d!31654 res!82909) b!100958))

(assert (= (and b!100958 res!82910) b!100959))

(declare-fun m!146891 () Bool)

(assert (=> d!31654 m!146891))

(declare-fun m!146893 () Bool)

(assert (=> d!31654 m!146893))

(assert (=> b!100612 d!31654))

(declare-fun lt!146679 () tuple2!8126)

(declare-fun lt!146682 () (_ BitVec 64))

(declare-fun e!66005 () Bool)

(declare-fun b!100960 () Bool)

(declare-fun lt!146678 () (_ BitVec 64))

(assert (=> b!100960 (= e!66005 (= (_1!4318 lt!146679) (withMovedBitIndex!0 (_2!4318 lt!146679) (bvsub lt!146678 lt!146682))))))

(assert (=> b!100960 (or (= (bvand lt!146678 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!146682 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!146678 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!146678 lt!146682) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!100960 (= lt!146682 (bitIndex!0 (size!2159 (buf!2516 (_2!4316 lt!145782))) (currentByte!4971 (_2!4316 lt!145782)) (currentBit!4966 (_2!4316 lt!145782))))))

(assert (=> b!100960 (= lt!146678 (bitIndex!0 (size!2159 (buf!2516 (_2!4316 lt!145774))) (currentByte!4971 (_2!4316 lt!145774)) (currentBit!4966 (_2!4316 lt!145774))))))

(declare-fun d!31656 () Bool)

(assert (=> d!31656 e!66005))

(declare-fun res!82912 () Bool)

(assert (=> d!31656 (=> (not res!82912) (not e!66005))))

(assert (=> d!31656 (= res!82912 (isPrefixOf!0 (_1!4318 lt!146679) (_2!4318 lt!146679)))))

(declare-fun lt!146673 () BitStream!3792)

(assert (=> d!31656 (= lt!146679 (tuple2!8127 lt!146673 (_2!4316 lt!145782)))))

(declare-fun lt!146688 () Unit!6166)

(declare-fun lt!146689 () Unit!6166)

(assert (=> d!31656 (= lt!146688 lt!146689)))

(assert (=> d!31656 (isPrefixOf!0 lt!146673 (_2!4316 lt!145782))))

(assert (=> d!31656 (= lt!146689 (lemmaIsPrefixTransitive!0 lt!146673 (_2!4316 lt!145782) (_2!4316 lt!145782)))))

(declare-fun lt!146687 () Unit!6166)

(declare-fun lt!146684 () Unit!6166)

(assert (=> d!31656 (= lt!146687 lt!146684)))

(assert (=> d!31656 (isPrefixOf!0 lt!146673 (_2!4316 lt!145782))))

(assert (=> d!31656 (= lt!146684 (lemmaIsPrefixTransitive!0 lt!146673 (_2!4316 lt!145774) (_2!4316 lt!145782)))))

(declare-fun lt!146674 () Unit!6166)

(declare-fun e!66006 () Unit!6166)

(assert (=> d!31656 (= lt!146674 e!66006)))

(declare-fun c!6326 () Bool)

(assert (=> d!31656 (= c!6326 (not (= (size!2159 (buf!2516 (_2!4316 lt!145774))) #b00000000000000000000000000000000)))))

(declare-fun lt!146683 () Unit!6166)

(declare-fun lt!146675 () Unit!6166)

(assert (=> d!31656 (= lt!146683 lt!146675)))

(assert (=> d!31656 (isPrefixOf!0 (_2!4316 lt!145782) (_2!4316 lt!145782))))

(assert (=> d!31656 (= lt!146675 (lemmaIsPrefixRefl!0 (_2!4316 lt!145782)))))

(declare-fun lt!146685 () Unit!6166)

(declare-fun lt!146670 () Unit!6166)

(assert (=> d!31656 (= lt!146685 lt!146670)))

(assert (=> d!31656 (= lt!146670 (lemmaIsPrefixRefl!0 (_2!4316 lt!145782)))))

(declare-fun lt!146680 () Unit!6166)

(declare-fun lt!146671 () Unit!6166)

(assert (=> d!31656 (= lt!146680 lt!146671)))

(assert (=> d!31656 (isPrefixOf!0 lt!146673 lt!146673)))

(assert (=> d!31656 (= lt!146671 (lemmaIsPrefixRefl!0 lt!146673))))

(declare-fun lt!146676 () Unit!6166)

(declare-fun lt!146677 () Unit!6166)

(assert (=> d!31656 (= lt!146676 lt!146677)))

(assert (=> d!31656 (isPrefixOf!0 (_2!4316 lt!145774) (_2!4316 lt!145774))))

(assert (=> d!31656 (= lt!146677 (lemmaIsPrefixRefl!0 (_2!4316 lt!145774)))))

(assert (=> d!31656 (= lt!146673 (BitStream!3793 (buf!2516 (_2!4316 lt!145782)) (currentByte!4971 (_2!4316 lt!145774)) (currentBit!4966 (_2!4316 lt!145774))))))

(assert (=> d!31656 (isPrefixOf!0 (_2!4316 lt!145774) (_2!4316 lt!145782))))

(assert (=> d!31656 (= (reader!0 (_2!4316 lt!145774) (_2!4316 lt!145782)) lt!146679)))

(declare-fun b!100961 () Bool)

(declare-fun Unit!6192 () Unit!6166)

(assert (=> b!100961 (= e!66006 Unit!6192)))

(declare-fun b!100962 () Bool)

(declare-fun lt!146686 () Unit!6166)

(assert (=> b!100962 (= e!66006 lt!146686)))

(declare-fun lt!146681 () (_ BitVec 64))

(assert (=> b!100962 (= lt!146681 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!146672 () (_ BitVec 64))

(assert (=> b!100962 (= lt!146672 (bitIndex!0 (size!2159 (buf!2516 (_2!4316 lt!145774))) (currentByte!4971 (_2!4316 lt!145774)) (currentBit!4966 (_2!4316 lt!145774))))))

(assert (=> b!100962 (= lt!146686 (arrayBitRangesEqSymmetric!0 (buf!2516 (_2!4316 lt!145774)) (buf!2516 (_2!4316 lt!145782)) lt!146681 lt!146672))))

(assert (=> b!100962 (arrayBitRangesEq!0 (buf!2516 (_2!4316 lt!145782)) (buf!2516 (_2!4316 lt!145774)) lt!146681 lt!146672)))

(declare-fun b!100963 () Bool)

(declare-fun res!82911 () Bool)

(assert (=> b!100963 (=> (not res!82911) (not e!66005))))

(assert (=> b!100963 (= res!82911 (isPrefixOf!0 (_1!4318 lt!146679) (_2!4316 lt!145774)))))

(declare-fun b!100964 () Bool)

(declare-fun res!82913 () Bool)

(assert (=> b!100964 (=> (not res!82913) (not e!66005))))

(assert (=> b!100964 (= res!82913 (isPrefixOf!0 (_2!4318 lt!146679) (_2!4316 lt!145782)))))

(assert (= (and d!31656 c!6326) b!100962))

(assert (= (and d!31656 (not c!6326)) b!100961))

(assert (= (and d!31656 res!82912) b!100963))

(assert (= (and b!100963 res!82911) b!100964))

(assert (= (and b!100964 res!82913) b!100960))

(assert (=> b!100962 m!146265))

(declare-fun m!146895 () Bool)

(assert (=> b!100962 m!146895))

(declare-fun m!146897 () Bool)

(assert (=> b!100962 m!146897))

(declare-fun m!146899 () Bool)

(assert (=> b!100960 m!146899))

(assert (=> b!100960 m!146767))

(assert (=> b!100960 m!146265))

(declare-fun m!146901 () Bool)

(assert (=> b!100963 m!146901))

(declare-fun m!146903 () Bool)

(assert (=> b!100964 m!146903))

(declare-fun m!146905 () Bool)

(assert (=> d!31656 m!146905))

(declare-fun m!146907 () Bool)

(assert (=> d!31656 m!146907))

(declare-fun m!146909 () Bool)

(assert (=> d!31656 m!146909))

(declare-fun m!146911 () Bool)

(assert (=> d!31656 m!146911))

(declare-fun m!146913 () Bool)

(assert (=> d!31656 m!146913))

(assert (=> d!31656 m!146781))

(declare-fun m!146915 () Bool)

(assert (=> d!31656 m!146915))

(declare-fun m!146917 () Bool)

(assert (=> d!31656 m!146917))

(declare-fun m!146919 () Bool)

(assert (=> d!31656 m!146919))

(declare-fun m!146921 () Bool)

(assert (=> d!31656 m!146921))

(assert (=> d!31656 m!146791))

(assert (=> b!100612 d!31656))

(declare-fun d!31658 () Bool)

(assert (=> d!31658 (= (invariant!0 (currentBit!4966 thiss!1305) (currentByte!4971 thiss!1305) (size!2159 (buf!2516 (_2!4316 lt!145782)))) (and (bvsge (currentBit!4966 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!4966 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!4971 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!4971 thiss!1305) (size!2159 (buf!2516 (_2!4316 lt!145782)))) (and (= (currentBit!4966 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!4971 thiss!1305) (size!2159 (buf!2516 (_2!4316 lt!145782))))))))))

(assert (=> b!100610 d!31658))

(declare-fun d!31660 () Bool)

(assert (=> d!31660 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2159 (buf!2516 thiss!1305))) ((_ sign_extend 32) (currentByte!4971 thiss!1305)) ((_ sign_extend 32) (currentBit!4966 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2159 (buf!2516 thiss!1305))) ((_ sign_extend 32) (currentByte!4971 thiss!1305)) ((_ sign_extend 32) (currentBit!4966 thiss!1305))) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun bs!7745 () Bool)

(assert (= bs!7745 d!31660))

(assert (=> bs!7745 m!146333))

(assert (=> b!100611 d!31660))

(declare-fun d!31662 () Bool)

(assert (=> d!31662 (= (inv!12 thiss!1305) (invariant!0 (currentBit!4966 thiss!1305) (currentByte!4971 thiss!1305) (size!2159 (buf!2516 thiss!1305))))))

(declare-fun bs!7746 () Bool)

(assert (= bs!7746 d!31662))

(assert (=> bs!7746 m!146335))

(assert (=> start!20112 d!31662))

(check-sat (not b!100946) (not b!100910) (not d!31594) (not b!100948) (not d!31522) (not d!31624) (not b!100824) (not b!100825) (not b!100819) (not d!31648) (not b!100949) (not bm!1258) (not d!31662) (not d!31654) (not b!100913) (not b!100906) (not b!100909) (not b!100911) (not b!100908) (not d!31656) (not d!31650) (not d!31660) (not b!100818) (not b!100822) (not d!31532) (not b!100823) (not b!100962) (not b!100960) (not d!31640) (not b!100964) (not b!100820) (not b!100674) (not d!31520) (not b!100814) (not b!100813) (not b!100655) (not b!100947) (not d!31526) (not d!31534) (not b!100963) (not d!31592) (not b!100672) (not d!31652) (not d!31638))
(check-sat)
