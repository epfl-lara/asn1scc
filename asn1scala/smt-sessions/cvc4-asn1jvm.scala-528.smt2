; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15352 () Bool)

(assert start!15352)

(declare-fun b!78158 () Bool)

(declare-fun res!64567 () Bool)

(declare-fun e!51307 () Bool)

(assert (=> b!78158 (=> (not res!64567) (not e!51307))))

(declare-datatypes ((array!3329 0))(
  ( (array!3330 (arr!2144 (Array (_ BitVec 32) (_ BitVec 8))) (size!1543 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2648 0))(
  ( (BitStream!2649 (buf!1933 array!3329) (currentByte!3762 (_ BitVec 32)) (currentBit!3757 (_ BitVec 32))) )
))
(declare-fun thiss!1107 () BitStream!2648)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!78158 (= res!64567 (validate_offset_bit!0 ((_ sign_extend 32) (size!1543 (buf!1933 thiss!1107))) ((_ sign_extend 32) (currentByte!3762 thiss!1107)) ((_ sign_extend 32) (currentBit!3757 thiss!1107))))))

(declare-fun b!78159 () Bool)

(declare-fun e!51303 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!78159 (= e!51303 (invariant!0 (currentBit!3757 thiss!1107) (currentByte!3762 thiss!1107) (size!1543 (buf!1933 thiss!1107))))))

(declare-fun b!78160 () Bool)

(declare-fun e!51305 () Bool)

(declare-fun e!51306 () Bool)

(assert (=> b!78160 (= e!51305 e!51306)))

(declare-fun res!64573 () Bool)

(assert (=> b!78160 (=> (not res!64573) (not e!51306))))

(declare-datatypes ((Unit!5171 0))(
  ( (Unit!5172) )
))
(declare-datatypes ((tuple2!6964 0))(
  ( (tuple2!6965 (_1!3619 Unit!5171) (_2!3619 BitStream!2648)) )
))
(declare-fun lt!125100 () tuple2!6964)

(declare-fun lt!125098 () Bool)

(declare-datatypes ((tuple2!6966 0))(
  ( (tuple2!6967 (_1!3620 BitStream!2648) (_2!3620 Bool)) )
))
(declare-fun lt!125099 () tuple2!6966)

(assert (=> b!78160 (= res!64573 (and (= (_2!3620 lt!125099) lt!125098) (= (_1!3620 lt!125099) (_2!3619 lt!125100))))))

(declare-fun readBitPure!0 (BitStream!2648) tuple2!6966)

(declare-fun readerFrom!0 (BitStream!2648 (_ BitVec 32) (_ BitVec 32)) BitStream!2648)

(assert (=> b!78160 (= lt!125099 (readBitPure!0 (readerFrom!0 (_2!3619 lt!125100) (currentBit!3757 thiss!1107) (currentByte!3762 thiss!1107))))))

(declare-fun b!78161 () Bool)

(declare-fun e!51308 () Bool)

(declare-fun array_inv!1389 (array!3329) Bool)

(assert (=> b!78161 (= e!51308 (array_inv!1389 (buf!1933 thiss!1107)))))

(declare-fun res!64570 () Bool)

(assert (=> start!15352 (=> (not res!64570) (not e!51307))))

(declare-fun bitNr!1 () (_ BitVec 32))

(assert (=> start!15352 (= res!64570 (and (bvsge bitNr!1 #b00000000000000000000000000000000) (bvslt bitNr!1 #b00000000000000000000000000001000)))))

(assert (=> start!15352 e!51307))

(assert (=> start!15352 true))

(declare-fun inv!12 (BitStream!2648) Bool)

(assert (=> start!15352 (and (inv!12 thiss!1107) e!51308)))

(declare-fun b!78162 () Bool)

(declare-fun res!64572 () Bool)

(assert (=> b!78162 (=> (not res!64572) (not e!51305))))

(declare-fun isPrefixOf!0 (BitStream!2648 BitStream!2648) Bool)

(assert (=> b!78162 (= res!64572 (isPrefixOf!0 thiss!1107 (_2!3619 lt!125100)))))

(declare-fun b!78163 () Bool)

(declare-fun lt!125096 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!78163 (= e!51306 (= (bitIndex!0 (size!1543 (buf!1933 (_1!3620 lt!125099))) (currentByte!3762 (_1!3620 lt!125099)) (currentBit!3757 (_1!3620 lt!125099))) lt!125096))))

(declare-fun b!78164 () Bool)

(declare-fun e!51304 () Bool)

(assert (=> b!78164 (= e!51304 e!51305)))

(declare-fun res!64568 () Bool)

(assert (=> b!78164 (=> (not res!64568) (not e!51305))))

(declare-fun lt!125097 () (_ BitVec 64))

(assert (=> b!78164 (= res!64568 (= lt!125096 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!125097)))))

(assert (=> b!78164 (= lt!125096 (bitIndex!0 (size!1543 (buf!1933 (_2!3619 lt!125100))) (currentByte!3762 (_2!3619 lt!125100)) (currentBit!3757 (_2!3619 lt!125100))))))

(assert (=> b!78164 (= lt!125097 (bitIndex!0 (size!1543 (buf!1933 thiss!1107)) (currentByte!3762 thiss!1107) (currentBit!3757 thiss!1107)))))

(declare-fun b!78165 () Bool)

(assert (=> b!78165 (= e!51307 (not e!51303))))

(declare-fun res!64571 () Bool)

(assert (=> b!78165 (=> res!64571 e!51303)))

(assert (=> b!78165 (= res!64571 (not (= (size!1543 (buf!1933 (_2!3619 lt!125100))) (size!1543 (buf!1933 thiss!1107)))))))

(assert (=> b!78165 e!51304))

(declare-fun res!64569 () Bool)

(assert (=> b!78165 (=> (not res!64569) (not e!51304))))

(assert (=> b!78165 (= res!64569 (= (size!1543 (buf!1933 thiss!1107)) (size!1543 (buf!1933 (_2!3619 lt!125100)))))))

(declare-fun appendBit!0 (BitStream!2648 Bool) tuple2!6964)

(assert (=> b!78165 (= lt!125100 (appendBit!0 thiss!1107 lt!125098))))

(declare-fun b!215 () (_ BitVec 8))

(assert (=> b!78165 (= lt!125098 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) b!215))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) bitNr!1))) #b00000000000000000000000000000000)))))

(assert (= (and start!15352 res!64570) b!78158))

(assert (= (and b!78158 res!64567) b!78165))

(assert (= (and b!78165 res!64569) b!78164))

(assert (= (and b!78164 res!64568) b!78162))

(assert (= (and b!78162 res!64572) b!78160))

(assert (= (and b!78160 res!64573) b!78163))

(assert (= (and b!78165 (not res!64571)) b!78159))

(assert (= start!15352 b!78161))

(declare-fun m!123759 () Bool)

(assert (=> b!78165 m!123759))

(declare-fun m!123761 () Bool)

(assert (=> b!78165 m!123761))

(declare-fun m!123763 () Bool)

(assert (=> b!78160 m!123763))

(assert (=> b!78160 m!123763))

(declare-fun m!123765 () Bool)

(assert (=> b!78160 m!123765))

(declare-fun m!123767 () Bool)

(assert (=> b!78164 m!123767))

(declare-fun m!123769 () Bool)

(assert (=> b!78164 m!123769))

(declare-fun m!123771 () Bool)

(assert (=> b!78159 m!123771))

(declare-fun m!123773 () Bool)

(assert (=> b!78162 m!123773))

(declare-fun m!123775 () Bool)

(assert (=> start!15352 m!123775))

(declare-fun m!123777 () Bool)

(assert (=> b!78158 m!123777))

(declare-fun m!123779 () Bool)

(assert (=> b!78163 m!123779))

(declare-fun m!123781 () Bool)

(assert (=> b!78161 m!123781))

(push 1)

(assert (not b!78162))

(assert (not b!78158))

(assert (not b!78160))

(assert (not start!15352))

(assert (not b!78159))

(assert (not b!78163))

(assert (not b!78164))

(assert (not b!78161))

(assert (not b!78165))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!24668 () Bool)

(declare-datatypes ((tuple2!6970 0))(
  ( (tuple2!6971 (_1!3622 Bool) (_2!3622 BitStream!2648)) )
))
(declare-fun lt!125115 () tuple2!6970)

(declare-fun readBit!0 (BitStream!2648) tuple2!6970)

(assert (=> d!24668 (= lt!125115 (readBit!0 (readerFrom!0 (_2!3619 lt!125100) (currentBit!3757 thiss!1107) (currentByte!3762 thiss!1107))))))

(assert (=> d!24668 (= (readBitPure!0 (readerFrom!0 (_2!3619 lt!125100) (currentBit!3757 thiss!1107) (currentByte!3762 thiss!1107))) (tuple2!6967 (_2!3622 lt!125115) (_1!3622 lt!125115)))))

(declare-fun bs!5992 () Bool)

(assert (= bs!5992 d!24668))

(assert (=> bs!5992 m!123763))

(declare-fun m!123803 () Bool)

(assert (=> bs!5992 m!123803))

(assert (=> b!78160 d!24668))

(declare-fun d!24670 () Bool)

(declare-fun e!51332 () Bool)

(assert (=> d!24670 e!51332))

(declare-fun res!64611 () Bool)

(assert (=> d!24670 (=> (not res!64611) (not e!51332))))

(assert (=> d!24670 (= res!64611 (invariant!0 (currentBit!3757 (_2!3619 lt!125100)) (currentByte!3762 (_2!3619 lt!125100)) (size!1543 (buf!1933 (_2!3619 lt!125100)))))))

(assert (=> d!24670 (= (readerFrom!0 (_2!3619 lt!125100) (currentBit!3757 thiss!1107) (currentByte!3762 thiss!1107)) (BitStream!2649 (buf!1933 (_2!3619 lt!125100)) (currentByte!3762 thiss!1107) (currentBit!3757 thiss!1107)))))

(declare-fun b!78203 () Bool)

(assert (=> b!78203 (= e!51332 (invariant!0 (currentBit!3757 thiss!1107) (currentByte!3762 thiss!1107) (size!1543 (buf!1933 (_2!3619 lt!125100)))))))

(assert (= (and d!24670 res!64611) b!78203))

(declare-fun m!123805 () Bool)

(assert (=> d!24670 m!123805))

(declare-fun m!123807 () Bool)

(assert (=> b!78203 m!123807))

(assert (=> b!78160 d!24670))

(declare-fun b!78236 () Bool)

(declare-fun res!64643 () Bool)

(declare-fun e!51349 () Bool)

(assert (=> b!78236 (=> (not res!64643) (not e!51349))))

(declare-fun lt!125171 () tuple2!6964)

(assert (=> b!78236 (= res!64643 (isPrefixOf!0 thiss!1107 (_2!3619 lt!125171)))))

(declare-fun b!78238 () Bool)

(declare-fun e!51350 () Bool)

(declare-fun lt!125170 () tuple2!6966)

(assert (=> b!78238 (= e!51350 (= (bitIndex!0 (size!1543 (buf!1933 (_1!3620 lt!125170))) (currentByte!3762 (_1!3620 lt!125170)) (currentBit!3757 (_1!3620 lt!125170))) (bitIndex!0 (size!1543 (buf!1933 (_2!3619 lt!125171))) (currentByte!3762 (_2!3619 lt!125171)) (currentBit!3757 (_2!3619 lt!125171)))))))

(declare-fun b!78235 () Bool)

(declare-fun res!64644 () Bool)

(assert (=> b!78235 (=> (not res!64644) (not e!51349))))

(declare-fun lt!125172 () (_ BitVec 64))

(declare-fun lt!125169 () (_ BitVec 64))

(assert (=> b!78235 (= res!64644 (= (bitIndex!0 (size!1543 (buf!1933 (_2!3619 lt!125171))) (currentByte!3762 (_2!3619 lt!125171)) (currentBit!3757 (_2!3619 lt!125171))) (bvadd lt!125172 lt!125169)))))

(assert (=> b!78235 (or (not (= (bvand lt!125172 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!125169 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!125172 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!125172 lt!125169) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!78235 (= lt!125169 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!78235 (= lt!125172 (bitIndex!0 (size!1543 (buf!1933 thiss!1107)) (currentByte!3762 thiss!1107) (currentBit!3757 thiss!1107)))))

(declare-fun b!78237 () Bool)

(assert (=> b!78237 (= e!51349 e!51350)))

(declare-fun res!64642 () Bool)

(assert (=> b!78237 (=> (not res!64642) (not e!51350))))

(assert (=> b!78237 (= res!64642 (and (= (_2!3620 lt!125170) lt!125098) (= (_1!3620 lt!125170) (_2!3619 lt!125171))))))

(assert (=> b!78237 (= lt!125170 (readBitPure!0 (readerFrom!0 (_2!3619 lt!125171) (currentBit!3757 thiss!1107) (currentByte!3762 thiss!1107))))))

(declare-fun d!24672 () Bool)

(assert (=> d!24672 e!51349))

(declare-fun res!64645 () Bool)

(assert (=> d!24672 (=> (not res!64645) (not e!51349))))

(assert (=> d!24672 (= res!64645 (= (size!1543 (buf!1933 thiss!1107)) (size!1543 (buf!1933 (_2!3619 lt!125171)))))))

(declare-fun choose!16 (BitStream!2648 Bool) tuple2!6964)

(assert (=> d!24672 (= lt!125171 (choose!16 thiss!1107 lt!125098))))

(assert (=> d!24672 (validate_offset_bit!0 ((_ sign_extend 32) (size!1543 (buf!1933 thiss!1107))) ((_ sign_extend 32) (currentByte!3762 thiss!1107)) ((_ sign_extend 32) (currentBit!3757 thiss!1107)))))

(assert (=> d!24672 (= (appendBit!0 thiss!1107 lt!125098) lt!125171)))

(assert (= (and d!24672 res!64645) b!78235))

(assert (= (and b!78235 res!64644) b!78236))

(assert (= (and b!78236 res!64643) b!78237))

(assert (= (and b!78237 res!64642) b!78238))

(declare-fun m!123833 () Bool)

(assert (=> b!78236 m!123833))

(declare-fun m!123835 () Bool)

(assert (=> d!24672 m!123835))

(assert (=> d!24672 m!123777))

(declare-fun m!123837 () Bool)

(assert (=> b!78237 m!123837))

(assert (=> b!78237 m!123837))

(declare-fun m!123839 () Bool)

(assert (=> b!78237 m!123839))

(declare-fun m!123841 () Bool)

(assert (=> b!78235 m!123841))

(assert (=> b!78235 m!123769))

(declare-fun m!123843 () Bool)

(assert (=> b!78238 m!123843))

(assert (=> b!78238 m!123841))

(assert (=> b!78165 d!24672))

(declare-fun d!24690 () Bool)

(assert (=> d!24690 (= (array_inv!1389 (buf!1933 thiss!1107)) (bvsge (size!1543 (buf!1933 thiss!1107)) #b00000000000000000000000000000000))))

(assert (=> b!78161 d!24690))

(declare-fun d!24692 () Bool)

(declare-fun res!64661 () Bool)

(declare-fun e!51360 () Bool)

(assert (=> d!24692 (=> (not res!64661) (not e!51360))))

(assert (=> d!24692 (= res!64661 (= (size!1543 (buf!1933 thiss!1107)) (size!1543 (buf!1933 (_2!3619 lt!125100)))))))

(assert (=> d!24692 (= (isPrefixOf!0 thiss!1107 (_2!3619 lt!125100)) e!51360)))

(declare-fun b!78253 () Bool)

(declare-fun res!64660 () Bool)

(assert (=> b!78253 (=> (not res!64660) (not e!51360))))

(assert (=> b!78253 (= res!64660 (bvsle (bitIndex!0 (size!1543 (buf!1933 thiss!1107)) (currentByte!3762 thiss!1107) (currentBit!3757 thiss!1107)) (bitIndex!0 (size!1543 (buf!1933 (_2!3619 lt!125100))) (currentByte!3762 (_2!3619 lt!125100)) (currentBit!3757 (_2!3619 lt!125100)))))))

(declare-fun b!78254 () Bool)

(declare-fun e!51359 () Bool)

(assert (=> b!78254 (= e!51360 e!51359)))

(declare-fun res!64662 () Bool)

(assert (=> b!78254 (=> res!64662 e!51359)))

(assert (=> b!78254 (= res!64662 (= (size!1543 (buf!1933 thiss!1107)) #b00000000000000000000000000000000))))

(declare-fun b!78255 () Bool)

(declare-fun arrayBitRangesEq!0 (array!3329 array!3329 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!78255 (= e!51359 (arrayBitRangesEq!0 (buf!1933 thiss!1107) (buf!1933 (_2!3619 lt!125100)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1543 (buf!1933 thiss!1107)) (currentByte!3762 thiss!1107) (currentBit!3757 thiss!1107))))))

(assert (= (and d!24692 res!64661) b!78253))

(assert (= (and b!78253 res!64660) b!78254))

(assert (= (and b!78254 (not res!64662)) b!78255))

(assert (=> b!78253 m!123769))

(assert (=> b!78253 m!123767))

(assert (=> b!78255 m!123769))

(assert (=> b!78255 m!123769))

(declare-fun m!123849 () Bool)

(assert (=> b!78255 m!123849))

(assert (=> b!78162 d!24692))

(declare-fun d!24698 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!24698 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!1543 (buf!1933 thiss!1107))) ((_ sign_extend 32) (currentByte!3762 thiss!1107)) ((_ sign_extend 32) (currentBit!3757 thiss!1107))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1543 (buf!1933 thiss!1107))) ((_ sign_extend 32) (currentByte!3762 thiss!1107)) ((_ sign_extend 32) (currentBit!3757 thiss!1107))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!5994 () Bool)

(assert (= bs!5994 d!24698))

(declare-fun m!123855 () Bool)

(assert (=> bs!5994 m!123855))

(assert (=> b!78158 d!24698))

(declare-fun d!24702 () Bool)

(declare-fun e!51367 () Bool)

(assert (=> d!24702 e!51367))

(declare-fun res!64674 () Bool)

(assert (=> d!24702 (=> (not res!64674) (not e!51367))))

(declare-fun lt!125223 () (_ BitVec 64))

(declare-fun lt!125221 () (_ BitVec 64))

(declare-fun lt!125222 () (_ BitVec 64))

(assert (=> d!24702 (= res!64674 (= lt!125223 (bvsub lt!125222 lt!125221)))))

(assert (=> d!24702 (or (= (bvand lt!125222 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!125221 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!125222 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!125222 lt!125221) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24702 (= lt!125221 (remainingBits!0 ((_ sign_extend 32) (size!1543 (buf!1933 (_1!3620 lt!125099)))) ((_ sign_extend 32) (currentByte!3762 (_1!3620 lt!125099))) ((_ sign_extend 32) (currentBit!3757 (_1!3620 lt!125099)))))))

(declare-fun lt!125219 () (_ BitVec 64))

(declare-fun lt!125220 () (_ BitVec 64))

(assert (=> d!24702 (= lt!125222 (bvmul lt!125219 lt!125220))))

(assert (=> d!24702 (or (= lt!125219 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!125220 (bvsdiv (bvmul lt!125219 lt!125220) lt!125219)))))

(assert (=> d!24702 (= lt!125220 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24702 (= lt!125219 ((_ sign_extend 32) (size!1543 (buf!1933 (_1!3620 lt!125099)))))))

(assert (=> d!24702 (= lt!125223 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3762 (_1!3620 lt!125099))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3757 (_1!3620 lt!125099)))))))

(assert (=> d!24702 (invariant!0 (currentBit!3757 (_1!3620 lt!125099)) (currentByte!3762 (_1!3620 lt!125099)) (size!1543 (buf!1933 (_1!3620 lt!125099))))))

(assert (=> d!24702 (= (bitIndex!0 (size!1543 (buf!1933 (_1!3620 lt!125099))) (currentByte!3762 (_1!3620 lt!125099)) (currentBit!3757 (_1!3620 lt!125099))) lt!125223)))

(declare-fun b!78265 () Bool)

(declare-fun res!64673 () Bool)

(assert (=> b!78265 (=> (not res!64673) (not e!51367))))

(assert (=> b!78265 (= res!64673 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!125223))))

(declare-fun b!78266 () Bool)

(declare-fun lt!125218 () (_ BitVec 64))

(assert (=> b!78266 (= e!51367 (bvsle lt!125223 (bvmul lt!125218 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!78266 (or (= lt!125218 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!125218 #b0000000000000000000000000000000000000000000000000000000000001000) lt!125218)))))

(assert (=> b!78266 (= lt!125218 ((_ sign_extend 32) (size!1543 (buf!1933 (_1!3620 lt!125099)))))))

(assert (= (and d!24702 res!64674) b!78265))

(assert (= (and b!78265 res!64673) b!78266))

(declare-fun m!123861 () Bool)

(assert (=> d!24702 m!123861))

(declare-fun m!123863 () Bool)

(assert (=> d!24702 m!123863))

(assert (=> b!78163 d!24702))

(declare-fun d!24706 () Bool)

(declare-fun e!51368 () Bool)

(assert (=> d!24706 e!51368))

(declare-fun res!64676 () Bool)

(assert (=> d!24706 (=> (not res!64676) (not e!51368))))

(declare-fun lt!125229 () (_ BitVec 64))

(declare-fun lt!125228 () (_ BitVec 64))

(declare-fun lt!125227 () (_ BitVec 64))

(assert (=> d!24706 (= res!64676 (= lt!125229 (bvsub lt!125228 lt!125227)))))

(assert (=> d!24706 (or (= (bvand lt!125228 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!125227 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!125228 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!125228 lt!125227) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24706 (= lt!125227 (remainingBits!0 ((_ sign_extend 32) (size!1543 (buf!1933 (_2!3619 lt!125100)))) ((_ sign_extend 32) (currentByte!3762 (_2!3619 lt!125100))) ((_ sign_extend 32) (currentBit!3757 (_2!3619 lt!125100)))))))

(declare-fun lt!125225 () (_ BitVec 64))

(declare-fun lt!125226 () (_ BitVec 64))

(assert (=> d!24706 (= lt!125228 (bvmul lt!125225 lt!125226))))

(assert (=> d!24706 (or (= lt!125225 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!125226 (bvsdiv (bvmul lt!125225 lt!125226) lt!125225)))))

(assert (=> d!24706 (= lt!125226 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24706 (= lt!125225 ((_ sign_extend 32) (size!1543 (buf!1933 (_2!3619 lt!125100)))))))

(assert (=> d!24706 (= lt!125229 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3762 (_2!3619 lt!125100))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3757 (_2!3619 lt!125100)))))))

(assert (=> d!24706 (invariant!0 (currentBit!3757 (_2!3619 lt!125100)) (currentByte!3762 (_2!3619 lt!125100)) (size!1543 (buf!1933 (_2!3619 lt!125100))))))

(assert (=> d!24706 (= (bitIndex!0 (size!1543 (buf!1933 (_2!3619 lt!125100))) (currentByte!3762 (_2!3619 lt!125100)) (currentBit!3757 (_2!3619 lt!125100))) lt!125229)))

(declare-fun b!78267 () Bool)

(declare-fun res!64675 () Bool)

(assert (=> b!78267 (=> (not res!64675) (not e!51368))))

(assert (=> b!78267 (= res!64675 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!125229))))

(declare-fun b!78268 () Bool)

(declare-fun lt!125224 () (_ BitVec 64))

(assert (=> b!78268 (= e!51368 (bvsle lt!125229 (bvmul lt!125224 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!78268 (or (= lt!125224 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!125224 #b0000000000000000000000000000000000000000000000000000000000001000) lt!125224)))))

(assert (=> b!78268 (= lt!125224 ((_ sign_extend 32) (size!1543 (buf!1933 (_2!3619 lt!125100)))))))

(assert (= (and d!24706 res!64676) b!78267))

(assert (= (and b!78267 res!64675) b!78268))

(declare-fun m!123865 () Bool)

(assert (=> d!24706 m!123865))

(assert (=> d!24706 m!123805))

(assert (=> b!78164 d!24706))

(declare-fun d!24708 () Bool)

(declare-fun e!51369 () Bool)

(assert (=> d!24708 e!51369))

(declare-fun res!64678 () Bool)

(assert (=> d!24708 (=> (not res!64678) (not e!51369))))

(declare-fun lt!125235 () (_ BitVec 64))

(declare-fun lt!125233 () (_ BitVec 64))

(declare-fun lt!125234 () (_ BitVec 64))

(assert (=> d!24708 (= res!64678 (= lt!125235 (bvsub lt!125234 lt!125233)))))

(assert (=> d!24708 (or (= (bvand lt!125234 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!125233 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!125234 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!125234 lt!125233) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24708 (= lt!125233 (remainingBits!0 ((_ sign_extend 32) (size!1543 (buf!1933 thiss!1107))) ((_ sign_extend 32) (currentByte!3762 thiss!1107)) ((_ sign_extend 32) (currentBit!3757 thiss!1107))))))

(declare-fun lt!125231 () (_ BitVec 64))

(declare-fun lt!125232 () (_ BitVec 64))

(assert (=> d!24708 (= lt!125234 (bvmul lt!125231 lt!125232))))

(assert (=> d!24708 (or (= lt!125231 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!125232 (bvsdiv (bvmul lt!125231 lt!125232) lt!125231)))))

(assert (=> d!24708 (= lt!125232 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24708 (= lt!125231 ((_ sign_extend 32) (size!1543 (buf!1933 thiss!1107))))))

(assert (=> d!24708 (= lt!125235 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3762 thiss!1107)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3757 thiss!1107))))))

(assert (=> d!24708 (invariant!0 (currentBit!3757 thiss!1107) (currentByte!3762 thiss!1107) (size!1543 (buf!1933 thiss!1107)))))

(assert (=> d!24708 (= (bitIndex!0 (size!1543 (buf!1933 thiss!1107)) (currentByte!3762 thiss!1107) (currentBit!3757 thiss!1107)) lt!125235)))

(declare-fun b!78269 () Bool)

(declare-fun res!64677 () Bool)

(assert (=> b!78269 (=> (not res!64677) (not e!51369))))

(assert (=> b!78269 (= res!64677 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!125235))))

(declare-fun b!78270 () Bool)

(declare-fun lt!125230 () (_ BitVec 64))

(assert (=> b!78270 (= e!51369 (bvsle lt!125235 (bvmul lt!125230 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!78270 (or (= lt!125230 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!125230 #b0000000000000000000000000000000000000000000000000000000000001000) lt!125230)))))

(assert (=> b!78270 (= lt!125230 ((_ sign_extend 32) (size!1543 (buf!1933 thiss!1107))))))

(assert (= (and d!24708 res!64678) b!78269))

(assert (= (and b!78269 res!64677) b!78270))

