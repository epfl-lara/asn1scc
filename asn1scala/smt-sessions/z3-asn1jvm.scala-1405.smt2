; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38652 () Bool)

(assert start!38652)

(declare-fun b!173896 () Bool)

(declare-fun e!121345 () Bool)

(declare-datatypes ((array!9360 0))(
  ( (array!9361 (arr!5060 (Array (_ BitVec 32) (_ BitVec 8))) (size!4130 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7368 0))(
  ( (BitStream!7369 (buf!4561 array!9360) (currentByte!8666 (_ BitVec 32)) (currentBit!8661 (_ BitVec 32))) )
))
(declare-fun thiss!1187 () BitStream!7368)

(declare-fun array_inv!3871 (array!9360) Bool)

(assert (=> b!173896 (= e!121345 (array_inv!3871 (buf!4561 thiss!1187)))))

(declare-fun b!173897 () Bool)

(declare-fun res!144018 () Bool)

(declare-fun e!121344 () Bool)

(assert (=> b!173897 (=> (not res!144018) (not e!121344))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!173897 (= res!144018 (invariant!0 (currentBit!8661 thiss!1187) (currentByte!8666 thiss!1187) (size!4130 (buf!4561 thiss!1187))))))

(declare-fun b!173898 () Bool)

(declare-fun e!121342 () Bool)

(declare-fun e!121343 () Bool)

(assert (=> b!173898 (= e!121342 e!121343)))

(declare-fun res!144017 () Bool)

(assert (=> b!173898 (=> (not res!144017) (not e!121343))))

(declare-datatypes ((Unit!12481 0))(
  ( (Unit!12482) )
))
(declare-datatypes ((tuple2!14982 0))(
  ( (tuple2!14983 (_1!8133 Unit!12481) (_2!8133 BitStream!7368)) )
))
(declare-fun lt!268081 () tuple2!14982)

(declare-fun lt!268082 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!173898 (= res!144017 (= (bitIndex!0 (size!4130 (buf!4561 (_2!8133 lt!268081))) (currentByte!8666 (_2!8133 lt!268081)) (currentBit!8661 (_2!8133 lt!268081))) lt!268082))))

(declare-fun lt!268080 () (_ BitVec 64))

(declare-fun nBits!340 () (_ BitVec 32))

(assert (=> b!173898 (= lt!268082 (bvadd lt!268080 ((_ sign_extend 32) nBits!340)))))

(assert (=> b!173898 (= lt!268080 (bitIndex!0 (size!4130 (buf!4561 thiss!1187)) (currentByte!8666 thiss!1187) (currentBit!8661 thiss!1187)))))

(declare-fun b!173899 () Bool)

(assert (=> b!173899 (= e!121344 e!121342)))

(declare-fun res!144015 () Bool)

(assert (=> b!173899 (=> (not res!144015) (not e!121342))))

(assert (=> b!173899 (= res!144015 (= (size!4130 (buf!4561 (_2!8133 lt!268081))) (size!4130 (buf!4561 thiss!1187))))))

(declare-fun v!186 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7368 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!14982)

(assert (=> b!173899 (= lt!268081 (appendBitsLSBFirstLoopTR!0 thiss!1187 v!186 nBits!340 #b00000000000000000000000000000000))))

(declare-fun b!173900 () Bool)

(assert (=> b!173900 (= e!121343 (and (= (size!4130 (buf!4561 thiss!1187)) (size!4130 (buf!4561 (_2!8133 lt!268081)))) (let ((bdg!10253 (bvand lt!268080 #b1000000000000000000000000000000000000000000000000000000000000000))) (and (= bdg!10253 (bvand ((_ sign_extend 32) nBits!340) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= bdg!10253 (bvand lt!268082 #b1000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!173901 () Bool)

(declare-fun res!144016 () Bool)

(assert (=> b!173901 (=> (not res!144016) (not e!121344))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!173901 (= res!144016 (validate_offset_bits!1 ((_ sign_extend 32) (size!4130 (buf!4561 thiss!1187))) ((_ sign_extend 32) (currentByte!8666 thiss!1187)) ((_ sign_extend 32) (currentBit!8661 thiss!1187)) ((_ sign_extend 32) nBits!340)))))

(declare-fun res!144014 () Bool)

(assert (=> start!38652 (=> (not res!144014) (not e!121344))))

(assert (=> start!38652 (= res!144014 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000)))))

(assert (=> start!38652 e!121344))

(assert (=> start!38652 true))

(declare-fun inv!12 (BitStream!7368) Bool)

(assert (=> start!38652 (and (inv!12 thiss!1187) e!121345)))

(assert (= (and start!38652 res!144014) b!173901))

(assert (= (and b!173901 res!144016) b!173897))

(assert (= (and b!173897 res!144018) b!173899))

(assert (= (and b!173899 res!144015) b!173898))

(assert (= (and b!173898 res!144017) b!173900))

(assert (= start!38652 b!173896))

(declare-fun m!273185 () Bool)

(assert (=> b!173899 m!273185))

(declare-fun m!273187 () Bool)

(assert (=> b!173901 m!273187))

(declare-fun m!273189 () Bool)

(assert (=> b!173897 m!273189))

(declare-fun m!273191 () Bool)

(assert (=> b!173896 m!273191))

(declare-fun m!273193 () Bool)

(assert (=> b!173898 m!273193))

(declare-fun m!273195 () Bool)

(assert (=> b!173898 m!273195))

(declare-fun m!273197 () Bool)

(assert (=> start!38652 m!273197))

(check-sat (not b!173899) (not b!173898) (not b!173896) (not b!173897) (not start!38652) (not b!173901))
(check-sat)
(get-model)

(declare-fun d!61345 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!61345 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4130 (buf!4561 thiss!1187))) ((_ sign_extend 32) (currentByte!8666 thiss!1187)) ((_ sign_extend 32) (currentBit!8661 thiss!1187)) ((_ sign_extend 32) nBits!340)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4130 (buf!4561 thiss!1187))) ((_ sign_extend 32) (currentByte!8666 thiss!1187)) ((_ sign_extend 32) (currentBit!8661 thiss!1187))) ((_ sign_extend 32) nBits!340)))))

(declare-fun bs!15285 () Bool)

(assert (= bs!15285 d!61345))

(declare-fun m!273213 () Bool)

(assert (=> bs!15285 m!273213))

(assert (=> b!173901 d!61345))

(declare-fun d!61347 () Bool)

(assert (=> d!61347 (= (array_inv!3871 (buf!4561 thiss!1187)) (bvsge (size!4130 (buf!4561 thiss!1187)) #b00000000000000000000000000000000))))

(assert (=> b!173896 d!61347))

(declare-fun d!61349 () Bool)

(declare-fun e!121441 () Bool)

(assert (=> d!61349 e!121441))

(declare-fun res!144146 () Bool)

(assert (=> d!61349 (=> (not res!144146) (not e!121441))))

(declare-fun lt!268616 () tuple2!14982)

(assert (=> d!61349 (= res!144146 (invariant!0 (currentBit!8661 (_2!8133 lt!268616)) (currentByte!8666 (_2!8133 lt!268616)) (size!4130 (buf!4561 (_2!8133 lt!268616)))))))

(declare-fun e!121448 () tuple2!14982)

(assert (=> d!61349 (= lt!268616 e!121448)))

(declare-fun c!9168 () Bool)

(assert (=> d!61349 (= c!9168 (= #b00000000000000000000000000000000 nBits!340))))

(assert (=> d!61349 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000))))

(assert (=> d!61349 (= (appendBitsLSBFirstLoopTR!0 thiss!1187 v!186 nBits!340 #b00000000000000000000000000000000) lt!268616)))

(declare-fun b!174064 () Bool)

(declare-fun res!144157 () Bool)

(assert (=> b!174064 (=> (not res!144157) (not e!121441))))

(assert (=> b!174064 (= res!144157 (= (size!4130 (buf!4561 thiss!1187)) (size!4130 (buf!4561 (_2!8133 lt!268616)))))))

(declare-fun b!174065 () Bool)

(declare-fun res!144154 () Bool)

(assert (=> b!174065 (=> (not res!144154) (not e!121441))))

(declare-fun lt!268600 () (_ BitVec 64))

(declare-fun lt!268608 () (_ BitVec 64))

(assert (=> b!174065 (= res!144154 (= (bitIndex!0 (size!4130 (buf!4561 (_2!8133 lt!268616))) (currentByte!8666 (_2!8133 lt!268616)) (currentBit!8661 (_2!8133 lt!268616))) (bvsub lt!268600 lt!268608)))))

(assert (=> b!174065 (or (= (bvand lt!268600 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!268608 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!268600 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!268600 lt!268608) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!174065 (= lt!268608 ((_ sign_extend 32) #b00000000000000000000000000000000))))

(declare-fun lt!268628 () (_ BitVec 64))

(declare-fun lt!268629 () (_ BitVec 64))

(assert (=> b!174065 (= lt!268600 (bvadd lt!268628 lt!268629))))

(assert (=> b!174065 (or (not (= (bvand lt!268628 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!268629 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!268628 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!268628 lt!268629) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!174065 (= lt!268629 ((_ sign_extend 32) nBits!340))))

(assert (=> b!174065 (= lt!268628 (bitIndex!0 (size!4130 (buf!4561 thiss!1187)) (currentByte!8666 thiss!1187) (currentBit!8661 thiss!1187)))))

(declare-fun b!174066 () Bool)

(declare-fun e!121442 () Bool)

(declare-fun lt!268589 () (_ BitVec 64))

(assert (=> b!174066 (= e!121442 (validate_offset_bits!1 ((_ sign_extend 32) (size!4130 (buf!4561 thiss!1187))) ((_ sign_extend 32) (currentByte!8666 thiss!1187)) ((_ sign_extend 32) (currentBit!8661 thiss!1187)) lt!268589))))

(declare-fun b!174067 () Bool)

(declare-fun e!121445 () Bool)

(declare-datatypes ((tuple2!14998 0))(
  ( (tuple2!14999 (_1!8141 BitStream!7368) (_2!8141 (_ BitVec 64))) )
))
(declare-fun lt!268615 () tuple2!14998)

(declare-datatypes ((tuple2!15000 0))(
  ( (tuple2!15001 (_1!8142 BitStream!7368) (_2!8142 BitStream!7368)) )
))
(declare-fun lt!268596 () tuple2!15000)

(assert (=> b!174067 (= e!121445 (= (_1!8141 lt!268615) (_2!8142 lt!268596)))))

(declare-fun b!174068 () Bool)

(declare-fun res!144155 () Bool)

(assert (=> b!174068 (=> (not res!144155) (not e!121441))))

(declare-fun isPrefixOf!0 (BitStream!7368 BitStream!7368) Bool)

(assert (=> b!174068 (= res!144155 (isPrefixOf!0 thiss!1187 (_2!8133 lt!268616)))))

(declare-fun b!174069 () Bool)

(declare-fun e!121444 () Bool)

(declare-datatypes ((tuple2!15002 0))(
  ( (tuple2!15003 (_1!8143 BitStream!7368) (_2!8143 Bool)) )
))
(declare-fun lt!268634 () tuple2!15002)

(declare-fun lt!268611 () tuple2!15002)

(assert (=> b!174069 (= e!121444 (= (_2!8143 lt!268634) (_2!8143 lt!268611)))))

(declare-fun b!174070 () Bool)

(declare-fun e!121443 () (_ BitVec 64))

(assert (=> b!174070 (= e!121443 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000)))))

(declare-fun lt!268613 () tuple2!14982)

(declare-fun call!2885 () Bool)

(declare-fun bm!2882 () Bool)

(assert (=> bm!2882 (= call!2885 (isPrefixOf!0 thiss!1187 (ite c!9168 thiss!1187 (_2!8133 lt!268613))))))

(declare-fun b!174071 () Bool)

(assert (=> b!174071 (= e!121443 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!174072 () Bool)

(declare-fun e!121447 () Bool)

(declare-fun lt!268593 () tuple2!15002)

(assert (=> b!174072 (= e!121447 (= (bitIndex!0 (size!4130 (buf!4561 (_1!8143 lt!268593))) (currentByte!8666 (_1!8143 lt!268593)) (currentBit!8661 (_1!8143 lt!268593))) (bitIndex!0 (size!4130 (buf!4561 (_2!8133 lt!268613))) (currentByte!8666 (_2!8133 lt!268613)) (currentBit!8661 (_2!8133 lt!268613)))))))

(declare-fun b!174073 () Bool)

(declare-fun readBitPure!0 (BitStream!7368) tuple2!15002)

(declare-fun readerFrom!0 (BitStream!7368 (_ BitVec 32) (_ BitVec 32)) BitStream!7368)

(assert (=> b!174073 (= lt!268593 (readBitPure!0 (readerFrom!0 (_2!8133 lt!268613) (currentBit!8661 thiss!1187) (currentByte!8666 thiss!1187))))))

(declare-fun res!144148 () Bool)

(declare-fun lt!268602 () Bool)

(assert (=> b!174073 (= res!144148 (and (= (_2!8143 lt!268593) lt!268602) (= (_1!8143 lt!268593) (_2!8133 lt!268613))))))

(assert (=> b!174073 (=> (not res!144148) (not e!121447))))

(declare-fun e!121449 () Bool)

(assert (=> b!174073 (= e!121449 e!121447)))

(declare-fun b!174074 () Bool)

(assert (=> b!174074 (= e!121441 e!121445)))

(declare-fun res!144151 () Bool)

(assert (=> b!174074 (=> (not res!144151) (not e!121445))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!174074 (= res!144151 (= (_2!8141 lt!268615) (bvand v!186 (onesLSBLong!0 nBits!340))))))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7368 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!14998)

(assert (=> b!174074 (= lt!268615 (readNBitsLSBFirstsLoopPure!0 (_1!8142 lt!268596) nBits!340 #b00000000000000000000000000000000 (bvand v!186 (onesLSBLong!0 #b00000000000000000000000000000000))))))

(declare-fun lt!268610 () Unit!12481)

(declare-fun lt!268642 () Unit!12481)

(assert (=> b!174074 (= lt!268610 lt!268642)))

(assert (=> b!174074 (validate_offset_bits!1 ((_ sign_extend 32) (size!4130 (buf!4561 (_2!8133 lt!268616)))) ((_ sign_extend 32) (currentByte!8666 thiss!1187)) ((_ sign_extend 32) (currentBit!8661 thiss!1187)) lt!268589)))

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7368 array!9360 (_ BitVec 64)) Unit!12481)

(assert (=> b!174074 (= lt!268642 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1187 (buf!4561 (_2!8133 lt!268616)) lt!268589))))

(assert (=> b!174074 e!121442))

(declare-fun res!144150 () Bool)

(assert (=> b!174074 (=> (not res!144150) (not e!121442))))

(assert (=> b!174074 (= res!144150 (and (= (size!4130 (buf!4561 thiss!1187)) (size!4130 (buf!4561 (_2!8133 lt!268616)))) (bvsge lt!268589 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!174074 (= lt!268589 ((_ sign_extend 32) (bvsub nBits!340 #b00000000000000000000000000000000)))))

(assert (=> b!174074 (or (= (bvand nBits!340 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!340 #b10000000000000000000000000000000) (bvand (bvsub nBits!340 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(declare-fun reader!0 (BitStream!7368 BitStream!7368) tuple2!15000)

(assert (=> b!174074 (= lt!268596 (reader!0 thiss!1187 (_2!8133 lt!268616)))))

(declare-fun b!174075 () Bool)

(declare-fun e!121446 () Bool)

(declare-fun lt!268599 () tuple2!14998)

(declare-fun lt!268594 () tuple2!15000)

(assert (=> b!174075 (= e!121446 (= (_1!8141 lt!268599) (_2!8142 lt!268594)))))

(declare-fun b!174076 () Bool)

(declare-fun res!144147 () Bool)

(assert (=> b!174076 (= res!144147 call!2885)))

(assert (=> b!174076 (=> (not res!144147) (not e!121449))))

(declare-fun b!174077 () Bool)

(declare-fun res!144149 () Bool)

(assert (=> b!174077 (= res!144149 (= (bitIndex!0 (size!4130 (buf!4561 (_2!8133 lt!268613))) (currentByte!8666 (_2!8133 lt!268613)) (currentBit!8661 (_2!8133 lt!268613))) (bvadd (bitIndex!0 (size!4130 (buf!4561 thiss!1187)) (currentByte!8666 thiss!1187) (currentBit!8661 thiss!1187)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!174077 (=> (not res!144149) (not e!121449))))

(declare-fun b!174078 () Bool)

(declare-fun Unit!12507 () Unit!12481)

(assert (=> b!174078 (= e!121448 (tuple2!14983 Unit!12507 thiss!1187))))

(declare-fun lt!268601 () Unit!12481)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7368) Unit!12481)

(assert (=> b!174078 (= lt!268601 (lemmaIsPrefixRefl!0 thiss!1187))))

(assert (=> b!174078 call!2885))

(declare-fun lt!268606 () Unit!12481)

(assert (=> b!174078 (= lt!268606 lt!268601)))

(declare-fun b!174079 () Bool)

(declare-fun lt!268638 () tuple2!14982)

(assert (=> b!174079 (= e!121448 (tuple2!14983 (_1!8133 lt!268638) (_2!8133 lt!268638)))))

(assert (=> b!174079 (= lt!268602 (not (= (bvand v!186 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun appendBit!0 (BitStream!7368 Bool) tuple2!14982)

(assert (=> b!174079 (= lt!268613 (appendBit!0 thiss!1187 lt!268602))))

(declare-fun res!144153 () Bool)

(assert (=> b!174079 (= res!144153 (= (size!4130 (buf!4561 thiss!1187)) (size!4130 (buf!4561 (_2!8133 lt!268613)))))))

(assert (=> b!174079 (=> (not res!144153) (not e!121449))))

(assert (=> b!174079 e!121449))

(declare-fun lt!268618 () tuple2!14982)

(assert (=> b!174079 (= lt!268618 lt!268613)))

(assert (=> b!174079 (= lt!268638 (appendBitsLSBFirstLoopTR!0 (_2!8133 lt!268618) v!186 nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!268595 () Unit!12481)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7368 BitStream!7368 BitStream!7368) Unit!12481)

(assert (=> b!174079 (= lt!268595 (lemmaIsPrefixTransitive!0 thiss!1187 (_2!8133 lt!268618) (_2!8133 lt!268638)))))

(assert (=> b!174079 (isPrefixOf!0 thiss!1187 (_2!8133 lt!268638))))

(declare-fun lt!268597 () Unit!12481)

(assert (=> b!174079 (= lt!268597 lt!268595)))

(assert (=> b!174079 (invariant!0 (currentBit!8661 thiss!1187) (currentByte!8666 thiss!1187) (size!4130 (buf!4561 (_2!8133 lt!268618))))))

(declare-fun lt!268624 () BitStream!7368)

(assert (=> b!174079 (= lt!268624 (BitStream!7369 (buf!4561 (_2!8133 lt!268618)) (currentByte!8666 thiss!1187) (currentBit!8661 thiss!1187)))))

(assert (=> b!174079 (invariant!0 (currentBit!8661 lt!268624) (currentByte!8666 lt!268624) (size!4130 (buf!4561 (_2!8133 lt!268638))))))

(declare-fun lt!268607 () BitStream!7368)

(assert (=> b!174079 (= lt!268607 (BitStream!7369 (buf!4561 (_2!8133 lt!268638)) (currentByte!8666 lt!268624) (currentBit!8661 lt!268624)))))

(assert (=> b!174079 (= lt!268634 (readBitPure!0 lt!268624))))

(assert (=> b!174079 (= lt!268611 (readBitPure!0 lt!268607))))

(declare-fun lt!268604 () Unit!12481)

(declare-fun readBitPrefixLemma!0 (BitStream!7368 BitStream!7368) Unit!12481)

(assert (=> b!174079 (= lt!268604 (readBitPrefixLemma!0 lt!268624 (_2!8133 lt!268638)))))

(declare-fun res!144156 () Bool)

(assert (=> b!174079 (= res!144156 (= (bitIndex!0 (size!4130 (buf!4561 (_1!8143 lt!268634))) (currentByte!8666 (_1!8143 lt!268634)) (currentBit!8661 (_1!8143 lt!268634))) (bitIndex!0 (size!4130 (buf!4561 (_1!8143 lt!268611))) (currentByte!8666 (_1!8143 lt!268611)) (currentBit!8661 (_1!8143 lt!268611)))))))

(assert (=> b!174079 (=> (not res!144156) (not e!121444))))

(assert (=> b!174079 e!121444))

(declare-fun lt!268635 () Unit!12481)

(assert (=> b!174079 (= lt!268635 lt!268604)))

(declare-fun lt!268633 () tuple2!15000)

(assert (=> b!174079 (= lt!268633 (reader!0 thiss!1187 (_2!8133 lt!268638)))))

(declare-fun lt!268636 () tuple2!15000)

(assert (=> b!174079 (= lt!268636 (reader!0 (_2!8133 lt!268618) (_2!8133 lt!268638)))))

(declare-fun lt!268630 () tuple2!15002)

(assert (=> b!174079 (= lt!268630 (readBitPure!0 (_1!8142 lt!268633)))))

(assert (=> b!174079 (= (_2!8143 lt!268630) lt!268602)))

(declare-fun lt!268640 () Unit!12481)

(declare-fun Unit!12508 () Unit!12481)

(assert (=> b!174079 (= lt!268640 Unit!12508)))

(declare-fun lt!268588 () (_ BitVec 64))

(assert (=> b!174079 (= lt!268588 (bvand v!186 (onesLSBLong!0 #b00000000000000000000000000000000)))))

(declare-fun lt!268621 () (_ BitVec 64))

(assert (=> b!174079 (= lt!268621 ((_ sign_extend 32) (bvsub nBits!340 #b00000000000000000000000000000000)))))

(declare-fun lt!268612 () Unit!12481)

(assert (=> b!174079 (= lt!268612 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1187 (buf!4561 (_2!8133 lt!268638)) lt!268621))))

(assert (=> b!174079 (validate_offset_bits!1 ((_ sign_extend 32) (size!4130 (buf!4561 (_2!8133 lt!268638)))) ((_ sign_extend 32) (currentByte!8666 thiss!1187)) ((_ sign_extend 32) (currentBit!8661 thiss!1187)) lt!268621)))

(declare-fun lt!268591 () Unit!12481)

(assert (=> b!174079 (= lt!268591 lt!268612)))

(declare-fun lt!268603 () tuple2!14998)

(assert (=> b!174079 (= lt!268603 (readNBitsLSBFirstsLoopPure!0 (_1!8142 lt!268633) nBits!340 #b00000000000000000000000000000000 lt!268588))))

(declare-fun lt!268620 () (_ BitVec 64))

(assert (=> b!174079 (= lt!268620 ((_ sign_extend 32) (bvsub (bvsub nBits!340 #b00000000000000000000000000000000) #b00000000000000000000000000000001)))))

(declare-fun lt!268627 () Unit!12481)

(assert (=> b!174079 (= lt!268627 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8133 lt!268618) (buf!4561 (_2!8133 lt!268638)) lt!268620))))

(assert (=> b!174079 (validate_offset_bits!1 ((_ sign_extend 32) (size!4130 (buf!4561 (_2!8133 lt!268638)))) ((_ sign_extend 32) (currentByte!8666 (_2!8133 lt!268618))) ((_ sign_extend 32) (currentBit!8661 (_2!8133 lt!268618))) lt!268620)))

(declare-fun lt!268625 () Unit!12481)

(assert (=> b!174079 (= lt!268625 lt!268627)))

(declare-fun lt!268641 () tuple2!14998)

(assert (=> b!174079 (= lt!268641 (readNBitsLSBFirstsLoopPure!0 (_1!8142 lt!268636) nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!268588 (ite (_2!8143 lt!268630) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!268605 () tuple2!14998)

(assert (=> b!174079 (= lt!268605 (readNBitsLSBFirstsLoopPure!0 (_1!8142 lt!268633) nBits!340 #b00000000000000000000000000000000 lt!268588))))

(declare-fun c!9167 () Bool)

(assert (=> b!174079 (= c!9167 (_2!8143 (readBitPure!0 (_1!8142 lt!268633))))))

(declare-fun lt!268619 () tuple2!14998)

(declare-fun withMovedBitIndex!0 (BitStream!7368 (_ BitVec 64)) BitStream!7368)

(assert (=> b!174079 (= lt!268619 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8142 lt!268633) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!268588 e!121443)))))

(declare-fun lt!268617 () Unit!12481)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7368 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!12481)

(assert (=> b!174079 (= lt!268617 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8142 lt!268633) nBits!340 #b00000000000000000000000000000000 lt!268588))))

(assert (=> b!174079 (and (= (_2!8141 lt!268605) (_2!8141 lt!268619)) (= (_1!8141 lt!268605) (_1!8141 lt!268619)))))

(declare-fun lt!268623 () Unit!12481)

(assert (=> b!174079 (= lt!268623 lt!268617)))

(assert (=> b!174079 (= (_1!8142 lt!268633) (withMovedBitIndex!0 (_2!8142 lt!268633) (bvsub (bitIndex!0 (size!4130 (buf!4561 thiss!1187)) (currentByte!8666 thiss!1187) (currentBit!8661 thiss!1187)) (bitIndex!0 (size!4130 (buf!4561 (_2!8133 lt!268638))) (currentByte!8666 (_2!8133 lt!268638)) (currentBit!8661 (_2!8133 lt!268638))))))))

(declare-fun lt!268626 () Unit!12481)

(declare-fun Unit!12509 () Unit!12481)

(assert (=> b!174079 (= lt!268626 Unit!12509)))

(assert (=> b!174079 (= (_1!8142 lt!268636) (withMovedBitIndex!0 (_2!8142 lt!268636) (bvsub (bitIndex!0 (size!4130 (buf!4561 (_2!8133 lt!268618))) (currentByte!8666 (_2!8133 lt!268618)) (currentBit!8661 (_2!8133 lt!268618))) (bitIndex!0 (size!4130 (buf!4561 (_2!8133 lt!268638))) (currentByte!8666 (_2!8133 lt!268638)) (currentBit!8661 (_2!8133 lt!268638))))))))

(declare-fun lt!268632 () Unit!12481)

(declare-fun Unit!12510 () Unit!12481)

(assert (=> b!174079 (= lt!268632 Unit!12510)))

(assert (=> b!174079 (= (bitIndex!0 (size!4130 (buf!4561 thiss!1187)) (currentByte!8666 thiss!1187) (currentBit!8661 thiss!1187)) (bvsub (bitIndex!0 (size!4130 (buf!4561 (_2!8133 lt!268618))) (currentByte!8666 (_2!8133 lt!268618)) (currentBit!8661 (_2!8133 lt!268618))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!268637 () Unit!12481)

(declare-fun Unit!12511 () Unit!12481)

(assert (=> b!174079 (= lt!268637 Unit!12511)))

(assert (=> b!174079 (= (_2!8141 lt!268603) (_2!8141 lt!268641))))

(declare-fun lt!268643 () Unit!12481)

(declare-fun Unit!12512 () Unit!12481)

(assert (=> b!174079 (= lt!268643 Unit!12512)))

(assert (=> b!174079 (invariant!0 (currentBit!8661 (_2!8133 lt!268638)) (currentByte!8666 (_2!8133 lt!268638)) (size!4130 (buf!4561 (_2!8133 lt!268638))))))

(declare-fun lt!268592 () Unit!12481)

(declare-fun Unit!12513 () Unit!12481)

(assert (=> b!174079 (= lt!268592 Unit!12513)))

(assert (=> b!174079 (= (size!4130 (buf!4561 thiss!1187)) (size!4130 (buf!4561 (_2!8133 lt!268638))))))

(declare-fun lt!268631 () Unit!12481)

(declare-fun Unit!12514 () Unit!12481)

(assert (=> b!174079 (= lt!268631 Unit!12514)))

(assert (=> b!174079 (= (bitIndex!0 (size!4130 (buf!4561 (_2!8133 lt!268638))) (currentByte!8666 (_2!8133 lt!268638)) (currentBit!8661 (_2!8133 lt!268638))) (bvsub (bvadd (bitIndex!0 (size!4130 (buf!4561 thiss!1187)) (currentByte!8666 thiss!1187) (currentBit!8661 thiss!1187)) ((_ sign_extend 32) nBits!340)) ((_ sign_extend 32) #b00000000000000000000000000000000)))))

(declare-fun lt!268590 () Unit!12481)

(declare-fun Unit!12515 () Unit!12481)

(assert (=> b!174079 (= lt!268590 Unit!12515)))

(declare-fun lt!268614 () Unit!12481)

(declare-fun Unit!12516 () Unit!12481)

(assert (=> b!174079 (= lt!268614 Unit!12516)))

(assert (=> b!174079 (= lt!268594 (reader!0 thiss!1187 (_2!8133 lt!268638)))))

(declare-fun lt!268622 () (_ BitVec 64))

(assert (=> b!174079 (= lt!268622 ((_ sign_extend 32) (bvsub nBits!340 #b00000000000000000000000000000000)))))

(declare-fun lt!268598 () Unit!12481)

(assert (=> b!174079 (= lt!268598 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1187 (buf!4561 (_2!8133 lt!268638)) lt!268622))))

(assert (=> b!174079 (validate_offset_bits!1 ((_ sign_extend 32) (size!4130 (buf!4561 (_2!8133 lt!268638)))) ((_ sign_extend 32) (currentByte!8666 thiss!1187)) ((_ sign_extend 32) (currentBit!8661 thiss!1187)) lt!268622)))

(declare-fun lt!268639 () Unit!12481)

(assert (=> b!174079 (= lt!268639 lt!268598)))

(assert (=> b!174079 (= lt!268599 (readNBitsLSBFirstsLoopPure!0 (_1!8142 lt!268594) nBits!340 #b00000000000000000000000000000000 (bvand v!186 (onesLSBLong!0 #b00000000000000000000000000000000))))))

(declare-fun res!144152 () Bool)

(assert (=> b!174079 (= res!144152 (= (_2!8141 lt!268599) (bvand v!186 (onesLSBLong!0 nBits!340))))))

(assert (=> b!174079 (=> (not res!144152) (not e!121446))))

(assert (=> b!174079 e!121446))

(declare-fun lt!268609 () Unit!12481)

(declare-fun Unit!12517 () Unit!12481)

(assert (=> b!174079 (= lt!268609 Unit!12517)))

(assert (= (and d!61349 c!9168) b!174078))

(assert (= (and d!61349 (not c!9168)) b!174079))

(assert (= (and b!174079 res!144153) b!174077))

(assert (= (and b!174077 res!144149) b!174076))

(assert (= (and b!174076 res!144147) b!174073))

(assert (= (and b!174073 res!144148) b!174072))

(assert (= (and b!174079 res!144156) b!174069))

(assert (= (and b!174079 c!9167) b!174070))

(assert (= (and b!174079 (not c!9167)) b!174071))

(assert (= (and b!174079 res!144152) b!174075))

(assert (= (or b!174078 b!174076) bm!2882))

(assert (= (and d!61349 res!144146) b!174064))

(assert (= (and b!174064 res!144157) b!174065))

(assert (= (and b!174065 res!144154) b!174068))

(assert (= (and b!174068 res!144155) b!174074))

(assert (= (and b!174074 res!144150) b!174066))

(assert (= (and b!174074 res!144151) b!174067))

(declare-fun m!273415 () Bool)

(assert (=> b!174072 m!273415))

(declare-fun m!273417 () Bool)

(assert (=> b!174072 m!273417))

(declare-fun m!273419 () Bool)

(assert (=> b!174068 m!273419))

(declare-fun m!273421 () Bool)

(assert (=> d!61349 m!273421))

(declare-fun m!273423 () Bool)

(assert (=> b!174074 m!273423))

(declare-fun m!273425 () Bool)

(assert (=> b!174074 m!273425))

(declare-fun m!273427 () Bool)

(assert (=> b!174074 m!273427))

(declare-fun m!273429 () Bool)

(assert (=> b!174074 m!273429))

(declare-fun m!273431 () Bool)

(assert (=> b!174074 m!273431))

(declare-fun m!273433 () Bool)

(assert (=> b!174074 m!273433))

(declare-fun m!273435 () Bool)

(assert (=> b!174078 m!273435))

(declare-fun m!273437 () Bool)

(assert (=> b!174066 m!273437))

(declare-fun m!273439 () Bool)

(assert (=> bm!2882 m!273439))

(assert (=> b!174077 m!273417))

(assert (=> b!174077 m!273195))

(declare-fun m!273441 () Bool)

(assert (=> b!174065 m!273441))

(assert (=> b!174065 m!273195))

(declare-fun m!273443 () Bool)

(assert (=> b!174079 m!273443))

(declare-fun m!273445 () Bool)

(assert (=> b!174079 m!273445))

(declare-fun m!273447 () Bool)

(assert (=> b!174079 m!273447))

(declare-fun m!273449 () Bool)

(assert (=> b!174079 m!273449))

(declare-fun m!273451 () Bool)

(assert (=> b!174079 m!273451))

(declare-fun m!273453 () Bool)

(assert (=> b!174079 m!273453))

(declare-fun m!273455 () Bool)

(assert (=> b!174079 m!273455))

(assert (=> b!174079 m!273429))

(declare-fun m!273457 () Bool)

(assert (=> b!174079 m!273457))

(declare-fun m!273459 () Bool)

(assert (=> b!174079 m!273459))

(declare-fun m!273461 () Bool)

(assert (=> b!174079 m!273461))

(declare-fun m!273463 () Bool)

(assert (=> b!174079 m!273463))

(declare-fun m!273465 () Bool)

(assert (=> b!174079 m!273465))

(assert (=> b!174079 m!273425))

(declare-fun m!273467 () Bool)

(assert (=> b!174079 m!273467))

(declare-fun m!273469 () Bool)

(assert (=> b!174079 m!273469))

(declare-fun m!273471 () Bool)

(assert (=> b!174079 m!273471))

(declare-fun m!273473 () Bool)

(assert (=> b!174079 m!273473))

(declare-fun m!273475 () Bool)

(assert (=> b!174079 m!273475))

(declare-fun m!273477 () Bool)

(assert (=> b!174079 m!273477))

(declare-fun m!273479 () Bool)

(assert (=> b!174079 m!273479))

(declare-fun m!273481 () Bool)

(assert (=> b!174079 m!273481))

(declare-fun m!273483 () Bool)

(assert (=> b!174079 m!273483))

(declare-fun m!273485 () Bool)

(assert (=> b!174079 m!273485))

(declare-fun m!273487 () Bool)

(assert (=> b!174079 m!273487))

(declare-fun m!273489 () Bool)

(assert (=> b!174079 m!273489))

(declare-fun m!273491 () Bool)

(assert (=> b!174079 m!273491))

(assert (=> b!174079 m!273195))

(declare-fun m!273493 () Bool)

(assert (=> b!174079 m!273493))

(declare-fun m!273495 () Bool)

(assert (=> b!174079 m!273495))

(declare-fun m!273497 () Bool)

(assert (=> b!174079 m!273497))

(declare-fun m!273499 () Bool)

(assert (=> b!174079 m!273499))

(assert (=> b!174079 m!273447))

(declare-fun m!273501 () Bool)

(assert (=> b!174079 m!273501))

(declare-fun m!273503 () Bool)

(assert (=> b!174079 m!273503))

(declare-fun m!273505 () Bool)

(assert (=> b!174073 m!273505))

(assert (=> b!174073 m!273505))

(declare-fun m!273507 () Bool)

(assert (=> b!174073 m!273507))

(assert (=> b!173899 d!61349))

(declare-fun d!61379 () Bool)

(declare-fun e!121452 () Bool)

(assert (=> d!61379 e!121452))

(declare-fun res!144162 () Bool)

(assert (=> d!61379 (=> (not res!144162) (not e!121452))))

(declare-fun lt!268658 () (_ BitVec 64))

(declare-fun lt!268656 () (_ BitVec 64))

(declare-fun lt!268659 () (_ BitVec 64))

(assert (=> d!61379 (= res!144162 (= lt!268658 (bvsub lt!268659 lt!268656)))))

(assert (=> d!61379 (or (= (bvand lt!268659 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!268656 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!268659 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!268659 lt!268656) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!61379 (= lt!268656 (remainingBits!0 ((_ sign_extend 32) (size!4130 (buf!4561 (_2!8133 lt!268081)))) ((_ sign_extend 32) (currentByte!8666 (_2!8133 lt!268081))) ((_ sign_extend 32) (currentBit!8661 (_2!8133 lt!268081)))))))

(declare-fun lt!268657 () (_ BitVec 64))

(declare-fun lt!268660 () (_ BitVec 64))

(assert (=> d!61379 (= lt!268659 (bvmul lt!268657 lt!268660))))

(assert (=> d!61379 (or (= lt!268657 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!268660 (bvsdiv (bvmul lt!268657 lt!268660) lt!268657)))))

(assert (=> d!61379 (= lt!268660 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!61379 (= lt!268657 ((_ sign_extend 32) (size!4130 (buf!4561 (_2!8133 lt!268081)))))))

(assert (=> d!61379 (= lt!268658 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8666 (_2!8133 lt!268081))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8661 (_2!8133 lt!268081)))))))

(assert (=> d!61379 (invariant!0 (currentBit!8661 (_2!8133 lt!268081)) (currentByte!8666 (_2!8133 lt!268081)) (size!4130 (buf!4561 (_2!8133 lt!268081))))))

(assert (=> d!61379 (= (bitIndex!0 (size!4130 (buf!4561 (_2!8133 lt!268081))) (currentByte!8666 (_2!8133 lt!268081)) (currentBit!8661 (_2!8133 lt!268081))) lt!268658)))

(declare-fun b!174084 () Bool)

(declare-fun res!144163 () Bool)

(assert (=> b!174084 (=> (not res!144163) (not e!121452))))

(assert (=> b!174084 (= res!144163 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!268658))))

(declare-fun b!174085 () Bool)

(declare-fun lt!268661 () (_ BitVec 64))

(assert (=> b!174085 (= e!121452 (bvsle lt!268658 (bvmul lt!268661 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!174085 (or (= lt!268661 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!268661 #b0000000000000000000000000000000000000000000000000000000000001000) lt!268661)))))

(assert (=> b!174085 (= lt!268661 ((_ sign_extend 32) (size!4130 (buf!4561 (_2!8133 lt!268081)))))))

(assert (= (and d!61379 res!144162) b!174084))

(assert (= (and b!174084 res!144163) b!174085))

(declare-fun m!273509 () Bool)

(assert (=> d!61379 m!273509))

(declare-fun m!273511 () Bool)

(assert (=> d!61379 m!273511))

(assert (=> b!173898 d!61379))

(declare-fun d!61381 () Bool)

(declare-fun e!121453 () Bool)

(assert (=> d!61381 e!121453))

(declare-fun res!144164 () Bool)

(assert (=> d!61381 (=> (not res!144164) (not e!121453))))

(declare-fun lt!268662 () (_ BitVec 64))

(declare-fun lt!268664 () (_ BitVec 64))

(declare-fun lt!268665 () (_ BitVec 64))

(assert (=> d!61381 (= res!144164 (= lt!268664 (bvsub lt!268665 lt!268662)))))

(assert (=> d!61381 (or (= (bvand lt!268665 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!268662 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!268665 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!268665 lt!268662) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!61381 (= lt!268662 (remainingBits!0 ((_ sign_extend 32) (size!4130 (buf!4561 thiss!1187))) ((_ sign_extend 32) (currentByte!8666 thiss!1187)) ((_ sign_extend 32) (currentBit!8661 thiss!1187))))))

(declare-fun lt!268663 () (_ BitVec 64))

(declare-fun lt!268666 () (_ BitVec 64))

(assert (=> d!61381 (= lt!268665 (bvmul lt!268663 lt!268666))))

(assert (=> d!61381 (or (= lt!268663 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!268666 (bvsdiv (bvmul lt!268663 lt!268666) lt!268663)))))

(assert (=> d!61381 (= lt!268666 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!61381 (= lt!268663 ((_ sign_extend 32) (size!4130 (buf!4561 thiss!1187))))))

(assert (=> d!61381 (= lt!268664 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8666 thiss!1187)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8661 thiss!1187))))))

(assert (=> d!61381 (invariant!0 (currentBit!8661 thiss!1187) (currentByte!8666 thiss!1187) (size!4130 (buf!4561 thiss!1187)))))

(assert (=> d!61381 (= (bitIndex!0 (size!4130 (buf!4561 thiss!1187)) (currentByte!8666 thiss!1187) (currentBit!8661 thiss!1187)) lt!268664)))

(declare-fun b!174086 () Bool)

(declare-fun res!144165 () Bool)

(assert (=> b!174086 (=> (not res!144165) (not e!121453))))

(assert (=> b!174086 (= res!144165 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!268664))))

(declare-fun b!174087 () Bool)

(declare-fun lt!268667 () (_ BitVec 64))

(assert (=> b!174087 (= e!121453 (bvsle lt!268664 (bvmul lt!268667 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!174087 (or (= lt!268667 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!268667 #b0000000000000000000000000000000000000000000000000000000000001000) lt!268667)))))

(assert (=> b!174087 (= lt!268667 ((_ sign_extend 32) (size!4130 (buf!4561 thiss!1187))))))

(assert (= (and d!61381 res!144164) b!174086))

(assert (= (and b!174086 res!144165) b!174087))

(assert (=> d!61381 m!273213))

(assert (=> d!61381 m!273189))

(assert (=> b!173898 d!61381))

(declare-fun d!61383 () Bool)

(assert (=> d!61383 (= (invariant!0 (currentBit!8661 thiss!1187) (currentByte!8666 thiss!1187) (size!4130 (buf!4561 thiss!1187))) (and (bvsge (currentBit!8661 thiss!1187) #b00000000000000000000000000000000) (bvslt (currentBit!8661 thiss!1187) #b00000000000000000000000000001000) (bvsge (currentByte!8666 thiss!1187) #b00000000000000000000000000000000) (or (bvslt (currentByte!8666 thiss!1187) (size!4130 (buf!4561 thiss!1187))) (and (= (currentBit!8661 thiss!1187) #b00000000000000000000000000000000) (= (currentByte!8666 thiss!1187) (size!4130 (buf!4561 thiss!1187)))))))))

(assert (=> b!173897 d!61383))

(declare-fun d!61385 () Bool)

(assert (=> d!61385 (= (inv!12 thiss!1187) (invariant!0 (currentBit!8661 thiss!1187) (currentByte!8666 thiss!1187) (size!4130 (buf!4561 thiss!1187))))))

(declare-fun bs!15290 () Bool)

(assert (= bs!15290 d!61385))

(assert (=> bs!15290 m!273189))

(assert (=> start!38652 d!61385))

(check-sat (not b!174065) (not b!174078) (not d!61349) (not b!174072) (not d!61379) (not b!174077) (not d!61345) (not b!174068) (not b!174074) (not b!174079) (not bm!2882) (not b!174066) (not d!61385) (not b!174073) (not d!61381))
