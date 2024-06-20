; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15410 () Bool)

(assert start!15410)

(declare-fun b!78321 () Bool)

(declare-fun e!51405 () Bool)

(declare-fun e!51407 () Bool)

(assert (=> b!78321 (= e!51405 e!51407)))

(declare-fun res!64728 () Bool)

(assert (=> b!78321 (=> (not res!64728) (not e!51407))))

(declare-fun lt!125261 () Bool)

(declare-datatypes ((array!3336 0))(
  ( (array!3337 (arr!2146 (Array (_ BitVec 32) (_ BitVec 8))) (size!1545 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2652 0))(
  ( (BitStream!2653 (buf!1935 array!3336) (currentByte!3773 (_ BitVec 32)) (currentBit!3768 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!5175 0))(
  ( (Unit!5176) )
))
(declare-datatypes ((tuple2!6978 0))(
  ( (tuple2!6979 (_1!3626 Unit!5175) (_2!3626 BitStream!2652)) )
))
(declare-fun lt!125265 () tuple2!6978)

(declare-datatypes ((tuple2!6980 0))(
  ( (tuple2!6981 (_1!3627 BitStream!2652) (_2!3627 Bool)) )
))
(declare-fun lt!125262 () tuple2!6980)

(assert (=> b!78321 (= res!64728 (and (= (_2!3627 lt!125262) lt!125261) (= (_1!3627 lt!125262) (_2!3626 lt!125265))))))

(declare-fun thiss!1107 () BitStream!2652)

(declare-fun readBitPure!0 (BitStream!2652) tuple2!6980)

(declare-fun readerFrom!0 (BitStream!2652 (_ BitVec 32) (_ BitVec 32)) BitStream!2652)

(assert (=> b!78321 (= lt!125262 (readBitPure!0 (readerFrom!0 (_2!3626 lt!125265) (currentBit!3768 thiss!1107) (currentByte!3773 thiss!1107))))))

(declare-fun b!78322 () Bool)

(declare-fun res!64724 () Bool)

(declare-fun e!51410 () Bool)

(assert (=> b!78322 (=> (not res!64724) (not e!51410))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!78322 (= res!64724 (validate_offset_bit!0 ((_ sign_extend 32) (size!1545 (buf!1935 thiss!1107))) ((_ sign_extend 32) (currentByte!3773 thiss!1107)) ((_ sign_extend 32) (currentBit!3768 thiss!1107))))))

(declare-fun b!78323 () Bool)

(declare-fun res!64730 () Bool)

(assert (=> b!78323 (=> (not res!64730) (not e!51405))))

(declare-fun isPrefixOf!0 (BitStream!2652 BitStream!2652) Bool)

(assert (=> b!78323 (= res!64730 (isPrefixOf!0 thiss!1107 (_2!3626 lt!125265)))))

(declare-fun res!64726 () Bool)

(assert (=> start!15410 (=> (not res!64726) (not e!51410))))

(declare-fun bitNr!1 () (_ BitVec 32))

(assert (=> start!15410 (= res!64726 (and (bvsge bitNr!1 #b00000000000000000000000000000000) (bvslt bitNr!1 #b00000000000000000000000000001000)))))

(assert (=> start!15410 e!51410))

(assert (=> start!15410 true))

(declare-fun e!51406 () Bool)

(declare-fun inv!12 (BitStream!2652) Bool)

(assert (=> start!15410 (and (inv!12 thiss!1107) e!51406)))

(declare-fun b!78324 () Bool)

(declare-fun res!64725 () Bool)

(declare-fun e!51411 () Bool)

(assert (=> b!78324 (=> res!64725 e!51411)))

(assert (=> b!78324 (= res!64725 (not (isPrefixOf!0 thiss!1107 (_2!3626 lt!125265))))))

(declare-fun b!78325 () Bool)

(assert (=> b!78325 (= e!51410 (not e!51411))))

(declare-fun res!64729 () Bool)

(assert (=> b!78325 (=> res!64729 e!51411)))

(assert (=> b!78325 (= res!64729 (not (= (size!1545 (buf!1935 (_2!3626 lt!125265))) (size!1545 (buf!1935 thiss!1107)))))))

(declare-fun e!51409 () Bool)

(assert (=> b!78325 e!51409))

(declare-fun res!64732 () Bool)

(assert (=> b!78325 (=> (not res!64732) (not e!51409))))

(assert (=> b!78325 (= res!64732 (= (size!1545 (buf!1935 thiss!1107)) (size!1545 (buf!1935 (_2!3626 lt!125265)))))))

(declare-fun appendBit!0 (BitStream!2652 Bool) tuple2!6978)

(assert (=> b!78325 (= lt!125265 (appendBit!0 thiss!1107 lt!125261))))

(declare-fun b!215 () (_ BitVec 8))

(assert (=> b!78325 (= lt!125261 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) b!215))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) bitNr!1))) #b00000000000000000000000000000000)))))

(declare-fun b!78326 () Bool)

(declare-fun res!64727 () Bool)

(assert (=> b!78326 (=> res!64727 e!51411)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!78326 (= res!64727 (not (= (bitIndex!0 (size!1545 (buf!1935 (_2!3626 lt!125265))) (currentByte!3773 (_2!3626 lt!125265)) (currentBit!3768 (_2!3626 lt!125265))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!1545 (buf!1935 thiss!1107)) (currentByte!3773 thiss!1107) (currentBit!3768 thiss!1107))))))))

(declare-fun b!78327 () Bool)

(assert (=> b!78327 (= e!51409 e!51405)))

(declare-fun res!64731 () Bool)

(assert (=> b!78327 (=> (not res!64731) (not e!51405))))

(declare-fun lt!125263 () (_ BitVec 64))

(declare-fun lt!125264 () (_ BitVec 64))

(assert (=> b!78327 (= res!64731 (= lt!125263 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!125264)))))

(assert (=> b!78327 (= lt!125263 (bitIndex!0 (size!1545 (buf!1935 (_2!3626 lt!125265))) (currentByte!3773 (_2!3626 lt!125265)) (currentBit!3768 (_2!3626 lt!125265))))))

(assert (=> b!78327 (= lt!125264 (bitIndex!0 (size!1545 (buf!1935 thiss!1107)) (currentByte!3773 thiss!1107) (currentBit!3768 thiss!1107)))))

(declare-fun b!78328 () Bool)

(assert (=> b!78328 (= e!51407 (= (bitIndex!0 (size!1545 (buf!1935 (_1!3627 lt!125262))) (currentByte!3773 (_1!3627 lt!125262)) (currentBit!3768 (_1!3627 lt!125262))) lt!125263))))

(declare-fun b!78329 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!78329 (= e!51411 (invariant!0 (currentBit!3768 (_2!3626 lt!125265)) (currentByte!3773 (_2!3626 lt!125265)) (size!1545 (buf!1935 (_2!3626 lt!125265)))))))

(declare-fun b!78330 () Bool)

(declare-fun array_inv!1391 (array!3336) Bool)

(assert (=> b!78330 (= e!51406 (array_inv!1391 (buf!1935 thiss!1107)))))

(assert (= (and start!15410 res!64726) b!78322))

(assert (= (and b!78322 res!64724) b!78325))

(assert (= (and b!78325 res!64732) b!78327))

(assert (= (and b!78327 res!64731) b!78323))

(assert (= (and b!78323 res!64730) b!78321))

(assert (= (and b!78321 res!64728) b!78328))

(assert (= (and b!78325 (not res!64729)) b!78326))

(assert (= (and b!78326 (not res!64727)) b!78324))

(assert (= (and b!78324 (not res!64725)) b!78329))

(assert (= start!15410 b!78330))

(declare-fun m!123891 () Bool)

(assert (=> start!15410 m!123891))

(declare-fun m!123893 () Bool)

(assert (=> b!78323 m!123893))

(declare-fun m!123895 () Bool)

(assert (=> b!78330 m!123895))

(declare-fun m!123897 () Bool)

(assert (=> b!78325 m!123897))

(declare-fun m!123899 () Bool)

(assert (=> b!78325 m!123899))

(declare-fun m!123901 () Bool)

(assert (=> b!78321 m!123901))

(assert (=> b!78321 m!123901))

(declare-fun m!123903 () Bool)

(assert (=> b!78321 m!123903))

(declare-fun m!123905 () Bool)

(assert (=> b!78329 m!123905))

(declare-fun m!123907 () Bool)

(assert (=> b!78322 m!123907))

(declare-fun m!123909 () Bool)

(assert (=> b!78328 m!123909))

(assert (=> b!78324 m!123893))

(declare-fun m!123911 () Bool)

(assert (=> b!78327 m!123911))

(declare-fun m!123913 () Bool)

(assert (=> b!78327 m!123913))

(assert (=> b!78326 m!123911))

(assert (=> b!78326 m!123913))

(check-sat (not b!78325) (not b!78327) (not b!78329) (not b!78328) (not b!78321) (not b!78326) (not b!78323) (not start!15410) (not b!78322) (not b!78330) (not b!78324))
(check-sat)
(get-model)

(declare-fun d!24716 () Bool)

(assert (=> d!24716 (= (invariant!0 (currentBit!3768 (_2!3626 lt!125265)) (currentByte!3773 (_2!3626 lt!125265)) (size!1545 (buf!1935 (_2!3626 lt!125265)))) (and (bvsge (currentBit!3768 (_2!3626 lt!125265)) #b00000000000000000000000000000000) (bvslt (currentBit!3768 (_2!3626 lt!125265)) #b00000000000000000000000000001000) (bvsge (currentByte!3773 (_2!3626 lt!125265)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3773 (_2!3626 lt!125265)) (size!1545 (buf!1935 (_2!3626 lt!125265)))) (and (= (currentBit!3768 (_2!3626 lt!125265)) #b00000000000000000000000000000000) (= (currentByte!3773 (_2!3626 lt!125265)) (size!1545 (buf!1935 (_2!3626 lt!125265))))))))))

(assert (=> b!78329 d!24716))

(declare-fun d!24718 () Bool)

(declare-fun res!64766 () Bool)

(declare-fun e!51438 () Bool)

(assert (=> d!24718 (=> (not res!64766) (not e!51438))))

(assert (=> d!24718 (= res!64766 (= (size!1545 (buf!1935 thiss!1107)) (size!1545 (buf!1935 (_2!3626 lt!125265)))))))

(assert (=> d!24718 (= (isPrefixOf!0 thiss!1107 (_2!3626 lt!125265)) e!51438)))

(declare-fun b!78367 () Bool)

(declare-fun res!64768 () Bool)

(assert (=> b!78367 (=> (not res!64768) (not e!51438))))

(assert (=> b!78367 (= res!64768 (bvsle (bitIndex!0 (size!1545 (buf!1935 thiss!1107)) (currentByte!3773 thiss!1107) (currentBit!3768 thiss!1107)) (bitIndex!0 (size!1545 (buf!1935 (_2!3626 lt!125265))) (currentByte!3773 (_2!3626 lt!125265)) (currentBit!3768 (_2!3626 lt!125265)))))))

(declare-fun b!78368 () Bool)

(declare-fun e!51437 () Bool)

(assert (=> b!78368 (= e!51438 e!51437)))

(declare-fun res!64767 () Bool)

(assert (=> b!78368 (=> res!64767 e!51437)))

(assert (=> b!78368 (= res!64767 (= (size!1545 (buf!1935 thiss!1107)) #b00000000000000000000000000000000))))

(declare-fun b!78369 () Bool)

(declare-fun arrayBitRangesEq!0 (array!3336 array!3336 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!78369 (= e!51437 (arrayBitRangesEq!0 (buf!1935 thiss!1107) (buf!1935 (_2!3626 lt!125265)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1545 (buf!1935 thiss!1107)) (currentByte!3773 thiss!1107) (currentBit!3768 thiss!1107))))))

(assert (= (and d!24718 res!64766) b!78367))

(assert (= (and b!78367 res!64768) b!78368))

(assert (= (and b!78368 (not res!64767)) b!78369))

(assert (=> b!78367 m!123913))

(assert (=> b!78367 m!123911))

(assert (=> b!78369 m!123913))

(assert (=> b!78369 m!123913))

(declare-fun m!123939 () Bool)

(assert (=> b!78369 m!123939))

(assert (=> b!78324 d!24718))

(declare-fun d!24720 () Bool)

(assert (=> d!24720 (= (array_inv!1391 (buf!1935 thiss!1107)) (bvsge (size!1545 (buf!1935 thiss!1107)) #b00000000000000000000000000000000))))

(assert (=> b!78330 d!24720))

(declare-fun b!78379 () Bool)

(declare-fun res!64779 () Bool)

(declare-fun e!51443 () Bool)

(assert (=> b!78379 (=> (not res!64779) (not e!51443))))

(declare-fun lt!125289 () (_ BitVec 64))

(declare-fun lt!125291 () (_ BitVec 64))

(declare-fun lt!125292 () tuple2!6978)

(assert (=> b!78379 (= res!64779 (= (bitIndex!0 (size!1545 (buf!1935 (_2!3626 lt!125292))) (currentByte!3773 (_2!3626 lt!125292)) (currentBit!3768 (_2!3626 lt!125292))) (bvadd lt!125291 lt!125289)))))

(assert (=> b!78379 (or (not (= (bvand lt!125291 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!125289 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!125291 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!125291 lt!125289) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!78379 (= lt!125289 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!78379 (= lt!125291 (bitIndex!0 (size!1545 (buf!1935 thiss!1107)) (currentByte!3773 thiss!1107) (currentBit!3768 thiss!1107)))))

(declare-fun b!78380 () Bool)

(declare-fun res!64777 () Bool)

(assert (=> b!78380 (=> (not res!64777) (not e!51443))))

(assert (=> b!78380 (= res!64777 (isPrefixOf!0 thiss!1107 (_2!3626 lt!125292)))))

(declare-fun b!78381 () Bool)

(declare-fun e!51444 () Bool)

(assert (=> b!78381 (= e!51443 e!51444)))

(declare-fun res!64780 () Bool)

(assert (=> b!78381 (=> (not res!64780) (not e!51444))))

(declare-fun lt!125290 () tuple2!6980)

(assert (=> b!78381 (= res!64780 (and (= (_2!3627 lt!125290) lt!125261) (= (_1!3627 lt!125290) (_2!3626 lt!125292))))))

(assert (=> b!78381 (= lt!125290 (readBitPure!0 (readerFrom!0 (_2!3626 lt!125292) (currentBit!3768 thiss!1107) (currentByte!3773 thiss!1107))))))

(declare-fun b!78382 () Bool)

(assert (=> b!78382 (= e!51444 (= (bitIndex!0 (size!1545 (buf!1935 (_1!3627 lt!125290))) (currentByte!3773 (_1!3627 lt!125290)) (currentBit!3768 (_1!3627 lt!125290))) (bitIndex!0 (size!1545 (buf!1935 (_2!3626 lt!125292))) (currentByte!3773 (_2!3626 lt!125292)) (currentBit!3768 (_2!3626 lt!125292)))))))

(declare-fun d!24722 () Bool)

(assert (=> d!24722 e!51443))

(declare-fun res!64778 () Bool)

(assert (=> d!24722 (=> (not res!64778) (not e!51443))))

(assert (=> d!24722 (= res!64778 (= (size!1545 (buf!1935 thiss!1107)) (size!1545 (buf!1935 (_2!3626 lt!125292)))))))

(declare-fun choose!16 (BitStream!2652 Bool) tuple2!6978)

(assert (=> d!24722 (= lt!125292 (choose!16 thiss!1107 lt!125261))))

(assert (=> d!24722 (validate_offset_bit!0 ((_ sign_extend 32) (size!1545 (buf!1935 thiss!1107))) ((_ sign_extend 32) (currentByte!3773 thiss!1107)) ((_ sign_extend 32) (currentBit!3768 thiss!1107)))))

(assert (=> d!24722 (= (appendBit!0 thiss!1107 lt!125261) lt!125292)))

(assert (= (and d!24722 res!64778) b!78379))

(assert (= (and b!78379 res!64779) b!78380))

(assert (= (and b!78380 res!64777) b!78381))

(assert (= (and b!78381 res!64780) b!78382))

(declare-fun m!123941 () Bool)

(assert (=> d!24722 m!123941))

(assert (=> d!24722 m!123907))

(declare-fun m!123943 () Bool)

(assert (=> b!78382 m!123943))

(declare-fun m!123945 () Bool)

(assert (=> b!78382 m!123945))

(declare-fun m!123949 () Bool)

(assert (=> b!78380 m!123949))

(assert (=> b!78379 m!123945))

(assert (=> b!78379 m!123913))

(declare-fun m!123951 () Bool)

(assert (=> b!78381 m!123951))

(assert (=> b!78381 m!123951))

(declare-fun m!123953 () Bool)

(assert (=> b!78381 m!123953))

(assert (=> b!78325 d!24722))

(declare-fun d!24730 () Bool)

(declare-fun e!51450 () Bool)

(assert (=> d!24730 e!51450))

(declare-fun res!64790 () Bool)

(assert (=> d!24730 (=> (not res!64790) (not e!51450))))

(declare-fun lt!125309 () (_ BitVec 64))

(declare-fun lt!125308 () (_ BitVec 64))

(declare-fun lt!125313 () (_ BitVec 64))

(assert (=> d!24730 (= res!64790 (= lt!125313 (bvsub lt!125308 lt!125309)))))

(assert (=> d!24730 (or (= (bvand lt!125308 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!125309 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!125308 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!125308 lt!125309) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!24730 (= lt!125309 (remainingBits!0 ((_ sign_extend 32) (size!1545 (buf!1935 (_2!3626 lt!125265)))) ((_ sign_extend 32) (currentByte!3773 (_2!3626 lt!125265))) ((_ sign_extend 32) (currentBit!3768 (_2!3626 lt!125265)))))))

(declare-fun lt!125312 () (_ BitVec 64))

(declare-fun lt!125310 () (_ BitVec 64))

(assert (=> d!24730 (= lt!125308 (bvmul lt!125312 lt!125310))))

(assert (=> d!24730 (or (= lt!125312 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!125310 (bvsdiv (bvmul lt!125312 lt!125310) lt!125312)))))

(assert (=> d!24730 (= lt!125310 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24730 (= lt!125312 ((_ sign_extend 32) (size!1545 (buf!1935 (_2!3626 lt!125265)))))))

(assert (=> d!24730 (= lt!125313 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3773 (_2!3626 lt!125265))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3768 (_2!3626 lt!125265)))))))

(assert (=> d!24730 (invariant!0 (currentBit!3768 (_2!3626 lt!125265)) (currentByte!3773 (_2!3626 lt!125265)) (size!1545 (buf!1935 (_2!3626 lt!125265))))))

(assert (=> d!24730 (= (bitIndex!0 (size!1545 (buf!1935 (_2!3626 lt!125265))) (currentByte!3773 (_2!3626 lt!125265)) (currentBit!3768 (_2!3626 lt!125265))) lt!125313)))

(declare-fun b!78390 () Bool)

(declare-fun res!64789 () Bool)

(assert (=> b!78390 (=> (not res!64789) (not e!51450))))

(assert (=> b!78390 (= res!64789 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!125313))))

(declare-fun b!78391 () Bool)

(declare-fun lt!125311 () (_ BitVec 64))

(assert (=> b!78391 (= e!51450 (bvsle lt!125313 (bvmul lt!125311 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!78391 (or (= lt!125311 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!125311 #b0000000000000000000000000000000000000000000000000000000000001000) lt!125311)))))

(assert (=> b!78391 (= lt!125311 ((_ sign_extend 32) (size!1545 (buf!1935 (_2!3626 lt!125265)))))))

(assert (= (and d!24730 res!64790) b!78390))

(assert (= (and b!78390 res!64789) b!78391))

(declare-fun m!123957 () Bool)

(assert (=> d!24730 m!123957))

(assert (=> d!24730 m!123905))

(assert (=> b!78326 d!24730))

(declare-fun d!24736 () Bool)

(declare-fun e!51451 () Bool)

(assert (=> d!24736 e!51451))

(declare-fun res!64792 () Bool)

(assert (=> d!24736 (=> (not res!64792) (not e!51451))))

(declare-fun lt!125314 () (_ BitVec 64))

(declare-fun lt!125319 () (_ BitVec 64))

(declare-fun lt!125315 () (_ BitVec 64))

(assert (=> d!24736 (= res!64792 (= lt!125319 (bvsub lt!125314 lt!125315)))))

(assert (=> d!24736 (or (= (bvand lt!125314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!125315 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!125314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!125314 lt!125315) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24736 (= lt!125315 (remainingBits!0 ((_ sign_extend 32) (size!1545 (buf!1935 thiss!1107))) ((_ sign_extend 32) (currentByte!3773 thiss!1107)) ((_ sign_extend 32) (currentBit!3768 thiss!1107))))))

(declare-fun lt!125318 () (_ BitVec 64))

(declare-fun lt!125316 () (_ BitVec 64))

(assert (=> d!24736 (= lt!125314 (bvmul lt!125318 lt!125316))))

(assert (=> d!24736 (or (= lt!125318 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!125316 (bvsdiv (bvmul lt!125318 lt!125316) lt!125318)))))

(assert (=> d!24736 (= lt!125316 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24736 (= lt!125318 ((_ sign_extend 32) (size!1545 (buf!1935 thiss!1107))))))

(assert (=> d!24736 (= lt!125319 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3773 thiss!1107)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3768 thiss!1107))))))

(assert (=> d!24736 (invariant!0 (currentBit!3768 thiss!1107) (currentByte!3773 thiss!1107) (size!1545 (buf!1935 thiss!1107)))))

(assert (=> d!24736 (= (bitIndex!0 (size!1545 (buf!1935 thiss!1107)) (currentByte!3773 thiss!1107) (currentBit!3768 thiss!1107)) lt!125319)))

(declare-fun b!78392 () Bool)

(declare-fun res!64791 () Bool)

(assert (=> b!78392 (=> (not res!64791) (not e!51451))))

(assert (=> b!78392 (= res!64791 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!125319))))

(declare-fun b!78393 () Bool)

(declare-fun lt!125317 () (_ BitVec 64))

(assert (=> b!78393 (= e!51451 (bvsle lt!125319 (bvmul lt!125317 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!78393 (or (= lt!125317 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!125317 #b0000000000000000000000000000000000000000000000000000000000001000) lt!125317)))))

(assert (=> b!78393 (= lt!125317 ((_ sign_extend 32) (size!1545 (buf!1935 thiss!1107))))))

(assert (= (and d!24736 res!64792) b!78392))

(assert (= (and b!78392 res!64791) b!78393))

(declare-fun m!123959 () Bool)

(assert (=> d!24736 m!123959))

(declare-fun m!123961 () Bool)

(assert (=> d!24736 m!123961))

(assert (=> b!78326 d!24736))

(declare-fun d!24738 () Bool)

(declare-datatypes ((tuple2!6986 0))(
  ( (tuple2!6987 (_1!3630 Bool) (_2!3630 BitStream!2652)) )
))
(declare-fun lt!125358 () tuple2!6986)

(declare-fun readBit!0 (BitStream!2652) tuple2!6986)

(assert (=> d!24738 (= lt!125358 (readBit!0 (readerFrom!0 (_2!3626 lt!125265) (currentBit!3768 thiss!1107) (currentByte!3773 thiss!1107))))))

(assert (=> d!24738 (= (readBitPure!0 (readerFrom!0 (_2!3626 lt!125265) (currentBit!3768 thiss!1107) (currentByte!3773 thiss!1107))) (tuple2!6981 (_2!3630 lt!125358) (_1!3630 lt!125358)))))

(declare-fun bs!6001 () Bool)

(assert (= bs!6001 d!24738))

(assert (=> bs!6001 m!123901))

(declare-fun m!123967 () Bool)

(assert (=> bs!6001 m!123967))

(assert (=> b!78321 d!24738))

(declare-fun d!24742 () Bool)

(declare-fun e!51464 () Bool)

(assert (=> d!24742 e!51464))

(declare-fun res!64816 () Bool)

(assert (=> d!24742 (=> (not res!64816) (not e!51464))))

(assert (=> d!24742 (= res!64816 (invariant!0 (currentBit!3768 (_2!3626 lt!125265)) (currentByte!3773 (_2!3626 lt!125265)) (size!1545 (buf!1935 (_2!3626 lt!125265)))))))

(assert (=> d!24742 (= (readerFrom!0 (_2!3626 lt!125265) (currentBit!3768 thiss!1107) (currentByte!3773 thiss!1107)) (BitStream!2653 (buf!1935 (_2!3626 lt!125265)) (currentByte!3773 thiss!1107) (currentBit!3768 thiss!1107)))))

(declare-fun b!78416 () Bool)

(assert (=> b!78416 (= e!51464 (invariant!0 (currentBit!3768 thiss!1107) (currentByte!3773 thiss!1107) (size!1545 (buf!1935 (_2!3626 lt!125265)))))))

(assert (= (and d!24742 res!64816) b!78416))

(assert (=> d!24742 m!123905))

(declare-fun m!123985 () Bool)

(assert (=> b!78416 m!123985))

(assert (=> b!78321 d!24742))

(assert (=> b!78327 d!24730))

(assert (=> b!78327 d!24736))

(declare-fun d!24754 () Bool)

(assert (=> d!24754 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!1545 (buf!1935 thiss!1107))) ((_ sign_extend 32) (currentByte!3773 thiss!1107)) ((_ sign_extend 32) (currentBit!3768 thiss!1107))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1545 (buf!1935 thiss!1107))) ((_ sign_extend 32) (currentByte!3773 thiss!1107)) ((_ sign_extend 32) (currentBit!3768 thiss!1107))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!6002 () Bool)

(assert (= bs!6002 d!24754))

(assert (=> bs!6002 m!123959))

(assert (=> b!78322 d!24754))

(declare-fun d!24756 () Bool)

(assert (=> d!24756 (= (inv!12 thiss!1107) (invariant!0 (currentBit!3768 thiss!1107) (currentByte!3773 thiss!1107) (size!1545 (buf!1935 thiss!1107))))))

(declare-fun bs!6003 () Bool)

(assert (= bs!6003 d!24756))

(assert (=> bs!6003 m!123961))

(assert (=> start!15410 d!24756))

(declare-fun d!24758 () Bool)

(declare-fun e!51465 () Bool)

(assert (=> d!24758 e!51465))

(declare-fun res!64818 () Bool)

(assert (=> d!24758 (=> (not res!64818) (not e!51465))))

(declare-fun lt!125385 () (_ BitVec 64))

(declare-fun lt!125386 () (_ BitVec 64))

(declare-fun lt!125390 () (_ BitVec 64))

(assert (=> d!24758 (= res!64818 (= lt!125390 (bvsub lt!125385 lt!125386)))))

(assert (=> d!24758 (or (= (bvand lt!125385 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!125386 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!125385 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!125385 lt!125386) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24758 (= lt!125386 (remainingBits!0 ((_ sign_extend 32) (size!1545 (buf!1935 (_1!3627 lt!125262)))) ((_ sign_extend 32) (currentByte!3773 (_1!3627 lt!125262))) ((_ sign_extend 32) (currentBit!3768 (_1!3627 lt!125262)))))))

(declare-fun lt!125389 () (_ BitVec 64))

(declare-fun lt!125387 () (_ BitVec 64))

(assert (=> d!24758 (= lt!125385 (bvmul lt!125389 lt!125387))))

(assert (=> d!24758 (or (= lt!125389 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!125387 (bvsdiv (bvmul lt!125389 lt!125387) lt!125389)))))

(assert (=> d!24758 (= lt!125387 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24758 (= lt!125389 ((_ sign_extend 32) (size!1545 (buf!1935 (_1!3627 lt!125262)))))))

(assert (=> d!24758 (= lt!125390 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3773 (_1!3627 lt!125262))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3768 (_1!3627 lt!125262)))))))

(assert (=> d!24758 (invariant!0 (currentBit!3768 (_1!3627 lt!125262)) (currentByte!3773 (_1!3627 lt!125262)) (size!1545 (buf!1935 (_1!3627 lt!125262))))))

(assert (=> d!24758 (= (bitIndex!0 (size!1545 (buf!1935 (_1!3627 lt!125262))) (currentByte!3773 (_1!3627 lt!125262)) (currentBit!3768 (_1!3627 lt!125262))) lt!125390)))

(declare-fun b!78417 () Bool)

(declare-fun res!64817 () Bool)

(assert (=> b!78417 (=> (not res!64817) (not e!51465))))

(assert (=> b!78417 (= res!64817 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!125390))))

(declare-fun b!78418 () Bool)

(declare-fun lt!125388 () (_ BitVec 64))

(assert (=> b!78418 (= e!51465 (bvsle lt!125390 (bvmul lt!125388 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!78418 (or (= lt!125388 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!125388 #b0000000000000000000000000000000000000000000000000000000000001000) lt!125388)))))

(assert (=> b!78418 (= lt!125388 ((_ sign_extend 32) (size!1545 (buf!1935 (_1!3627 lt!125262)))))))

(assert (= (and d!24758 res!64818) b!78417))

(assert (= (and b!78417 res!64817) b!78418))

(declare-fun m!123989 () Bool)

(assert (=> d!24758 m!123989))

(declare-fun m!123991 () Bool)

(assert (=> d!24758 m!123991))

(assert (=> b!78328 d!24758))

(assert (=> b!78323 d!24718))

(check-sat (not d!24756) (not d!24738) (not d!24730) (not d!24722) (not b!78380) (not b!78416) (not b!78369) (not b!78379) (not d!24736) (not d!24754) (not b!78382) (not d!24758) (not b!78381) (not d!24742) (not b!78367))
