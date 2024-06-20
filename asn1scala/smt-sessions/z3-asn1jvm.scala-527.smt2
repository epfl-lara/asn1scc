; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15290 () Bool)

(assert start!15290)

(declare-fun b!77957 () Bool)

(declare-fun e!51161 () Bool)

(declare-fun e!51164 () Bool)

(assert (=> b!77957 (= e!51161 e!51164)))

(declare-fun res!64379 () Bool)

(assert (=> b!77957 (=> (not res!64379) (not e!51164))))

(declare-datatypes ((array!3318 0))(
  ( (array!3319 (arr!2140 (Array (_ BitVec 32) (_ BitVec 8))) (size!1539 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2640 0))(
  ( (BitStream!2641 (buf!1929 array!3318) (currentByte!3749 (_ BitVec 32)) (currentBit!3744 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!6942 0))(
  ( (tuple2!6943 (_1!3608 BitStream!2640) (_2!3608 Bool)) )
))
(declare-fun lt!124901 () tuple2!6942)

(declare-fun lt!124903 () Bool)

(declare-datatypes ((Unit!5163 0))(
  ( (Unit!5164) )
))
(declare-datatypes ((tuple2!6944 0))(
  ( (tuple2!6945 (_1!3609 Unit!5163) (_2!3609 BitStream!2640)) )
))
(declare-fun lt!124902 () tuple2!6944)

(assert (=> b!77957 (= res!64379 (and (= (_2!3608 lt!124901) lt!124903) (= (_1!3608 lt!124901) (_2!3609 lt!124902))))))

(declare-fun thiss!1107 () BitStream!2640)

(declare-fun readBitPure!0 (BitStream!2640) tuple2!6942)

(declare-fun readerFrom!0 (BitStream!2640 (_ BitVec 32) (_ BitVec 32)) BitStream!2640)

(assert (=> b!77957 (= lt!124901 (readBitPure!0 (readerFrom!0 (_2!3609 lt!124902) (currentBit!3744 thiss!1107) (currentByte!3749 thiss!1107))))))

(declare-fun b!77958 () Bool)

(declare-fun e!51160 () Bool)

(declare-fun array_inv!1385 (array!3318) Bool)

(assert (=> b!77958 (= e!51160 (array_inv!1385 (buf!1929 thiss!1107)))))

(declare-fun b!77959 () Bool)

(declare-fun e!51162 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!77959 (= e!51162 (invariant!0 (currentBit!3744 (_2!3609 lt!124902)) (currentByte!3749 (_2!3609 lt!124902)) (size!1539 (buf!1929 (_2!3609 lt!124902)))))))

(declare-fun b!77960 () Bool)

(declare-fun e!51159 () Bool)

(assert (=> b!77960 (= e!51159 (not e!51162))))

(declare-fun res!64381 () Bool)

(assert (=> b!77960 (=> res!64381 e!51162)))

(assert (=> b!77960 (= res!64381 (not (= (size!1539 (buf!1929 (_2!3609 lt!124902))) (size!1539 (buf!1929 thiss!1107)))))))

(declare-fun e!51163 () Bool)

(assert (=> b!77960 e!51163))

(declare-fun res!64384 () Bool)

(assert (=> b!77960 (=> (not res!64384) (not e!51163))))

(assert (=> b!77960 (= res!64384 (= (size!1539 (buf!1929 thiss!1107)) (size!1539 (buf!1929 (_2!3609 lt!124902)))))))

(declare-fun appendBit!0 (BitStream!2640 Bool) tuple2!6944)

(assert (=> b!77960 (= lt!124902 (appendBit!0 thiss!1107 lt!124903))))

(declare-fun b!215 () (_ BitVec 8))

(declare-fun bitNr!1 () (_ BitVec 32))

(assert (=> b!77960 (= lt!124903 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) b!215))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) bitNr!1))) #b00000000000000000000000000000000)))))

(declare-fun b!77961 () Bool)

(declare-fun lt!124904 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!77961 (= e!51164 (= (bitIndex!0 (size!1539 (buf!1929 (_1!3608 lt!124901))) (currentByte!3749 (_1!3608 lt!124901)) (currentBit!3744 (_1!3608 lt!124901))) lt!124904))))

(declare-fun b!77963 () Bool)

(declare-fun res!64378 () Bool)

(assert (=> b!77963 (=> (not res!64378) (not e!51161))))

(declare-fun isPrefixOf!0 (BitStream!2640 BitStream!2640) Bool)

(assert (=> b!77963 (= res!64378 (isPrefixOf!0 thiss!1107 (_2!3609 lt!124902)))))

(declare-fun b!77964 () Bool)

(assert (=> b!77964 (= e!51163 e!51161)))

(declare-fun res!64383 () Bool)

(assert (=> b!77964 (=> (not res!64383) (not e!51161))))

(declare-fun lt!124905 () (_ BitVec 64))

(assert (=> b!77964 (= res!64383 (= lt!124904 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!124905)))))

(assert (=> b!77964 (= lt!124904 (bitIndex!0 (size!1539 (buf!1929 (_2!3609 lt!124902))) (currentByte!3749 (_2!3609 lt!124902)) (currentBit!3744 (_2!3609 lt!124902))))))

(assert (=> b!77964 (= lt!124905 (bitIndex!0 (size!1539 (buf!1929 thiss!1107)) (currentByte!3749 thiss!1107) (currentBit!3744 thiss!1107)))))

(declare-fun res!64380 () Bool)

(assert (=> start!15290 (=> (not res!64380) (not e!51159))))

(assert (=> start!15290 (= res!64380 (and (bvsge bitNr!1 #b00000000000000000000000000000000) (bvslt bitNr!1 #b00000000000000000000000000001000)))))

(assert (=> start!15290 e!51159))

(assert (=> start!15290 true))

(declare-fun inv!12 (BitStream!2640) Bool)

(assert (=> start!15290 (and (inv!12 thiss!1107) e!51160)))

(declare-fun b!77962 () Bool)

(declare-fun res!64382 () Bool)

(assert (=> b!77962 (=> (not res!64382) (not e!51159))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!77962 (= res!64382 (validate_offset_bit!0 ((_ sign_extend 32) (size!1539 (buf!1929 thiss!1107))) ((_ sign_extend 32) (currentByte!3749 thiss!1107)) ((_ sign_extend 32) (currentBit!3744 thiss!1107))))))

(assert (= (and start!15290 res!64380) b!77962))

(assert (= (and b!77962 res!64382) b!77960))

(assert (= (and b!77960 res!64384) b!77964))

(assert (= (and b!77964 res!64383) b!77963))

(assert (= (and b!77963 res!64378) b!77957))

(assert (= (and b!77957 res!64379) b!77961))

(assert (= (and b!77960 (not res!64381)) b!77959))

(assert (= start!15290 b!77958))

(declare-fun m!123579 () Bool)

(assert (=> start!15290 m!123579))

(declare-fun m!123581 () Bool)

(assert (=> b!77962 m!123581))

(declare-fun m!123583 () Bool)

(assert (=> b!77963 m!123583))

(declare-fun m!123585 () Bool)

(assert (=> b!77960 m!123585))

(declare-fun m!123587 () Bool)

(assert (=> b!77960 m!123587))

(declare-fun m!123589 () Bool)

(assert (=> b!77957 m!123589))

(assert (=> b!77957 m!123589))

(declare-fun m!123591 () Bool)

(assert (=> b!77957 m!123591))

(declare-fun m!123593 () Bool)

(assert (=> b!77961 m!123593))

(declare-fun m!123595 () Bool)

(assert (=> b!77964 m!123595))

(declare-fun m!123597 () Bool)

(assert (=> b!77964 m!123597))

(declare-fun m!123599 () Bool)

(assert (=> b!77958 m!123599))

(declare-fun m!123601 () Bool)

(assert (=> b!77959 m!123601))

(check-sat (not b!77958) (not b!77962) (not b!77963) (not b!77957) (not b!77961) (not start!15290) (not b!77959) (not b!77964) (not b!77960))
(check-sat)
(get-model)

(declare-fun d!24580 () Bool)

(declare-fun e!51189 () Bool)

(assert (=> d!24580 e!51189))

(declare-fun res!64410 () Bool)

(assert (=> d!24580 (=> (not res!64410) (not e!51189))))

(declare-fun lt!124937 () (_ BitVec 64))

(declare-fun lt!124935 () (_ BitVec 64))

(declare-fun lt!124938 () (_ BitVec 64))

(assert (=> d!24580 (= res!64410 (= lt!124937 (bvsub lt!124938 lt!124935)))))

(assert (=> d!24580 (or (= (bvand lt!124938 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!124935 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!124938 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!124938 lt!124935) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!24580 (= lt!124935 (remainingBits!0 ((_ sign_extend 32) (size!1539 (buf!1929 (_1!3608 lt!124901)))) ((_ sign_extend 32) (currentByte!3749 (_1!3608 lt!124901))) ((_ sign_extend 32) (currentBit!3744 (_1!3608 lt!124901)))))))

(declare-fun lt!124934 () (_ BitVec 64))

(declare-fun lt!124936 () (_ BitVec 64))

(assert (=> d!24580 (= lt!124938 (bvmul lt!124934 lt!124936))))

(assert (=> d!24580 (or (= lt!124934 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!124936 (bvsdiv (bvmul lt!124934 lt!124936) lt!124934)))))

(assert (=> d!24580 (= lt!124936 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24580 (= lt!124934 ((_ sign_extend 32) (size!1539 (buf!1929 (_1!3608 lt!124901)))))))

(assert (=> d!24580 (= lt!124937 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3749 (_1!3608 lt!124901))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3744 (_1!3608 lt!124901)))))))

(assert (=> d!24580 (invariant!0 (currentBit!3744 (_1!3608 lt!124901)) (currentByte!3749 (_1!3608 lt!124901)) (size!1539 (buf!1929 (_1!3608 lt!124901))))))

(assert (=> d!24580 (= (bitIndex!0 (size!1539 (buf!1929 (_1!3608 lt!124901))) (currentByte!3749 (_1!3608 lt!124901)) (currentBit!3744 (_1!3608 lt!124901))) lt!124937)))

(declare-fun b!77993 () Bool)

(declare-fun res!64411 () Bool)

(assert (=> b!77993 (=> (not res!64411) (not e!51189))))

(assert (=> b!77993 (= res!64411 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!124937))))

(declare-fun b!77994 () Bool)

(declare-fun lt!124933 () (_ BitVec 64))

(assert (=> b!77994 (= e!51189 (bvsle lt!124937 (bvmul lt!124933 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!77994 (or (= lt!124933 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!124933 #b0000000000000000000000000000000000000000000000000000000000001000) lt!124933)))))

(assert (=> b!77994 (= lt!124933 ((_ sign_extend 32) (size!1539 (buf!1929 (_1!3608 lt!124901)))))))

(assert (= (and d!24580 res!64410) b!77993))

(assert (= (and b!77993 res!64411) b!77994))

(declare-fun m!123627 () Bool)

(assert (=> d!24580 m!123627))

(declare-fun m!123629 () Bool)

(assert (=> d!24580 m!123629))

(assert (=> b!77961 d!24580))

(declare-fun d!24582 () Bool)

(declare-datatypes ((tuple2!6950 0))(
  ( (tuple2!6951 (_1!3612 Bool) (_2!3612 BitStream!2640)) )
))
(declare-fun lt!124941 () tuple2!6950)

(declare-fun readBit!0 (BitStream!2640) tuple2!6950)

(assert (=> d!24582 (= lt!124941 (readBit!0 (readerFrom!0 (_2!3609 lt!124902) (currentBit!3744 thiss!1107) (currentByte!3749 thiss!1107))))))

(assert (=> d!24582 (= (readBitPure!0 (readerFrom!0 (_2!3609 lt!124902) (currentBit!3744 thiss!1107) (currentByte!3749 thiss!1107))) (tuple2!6943 (_2!3612 lt!124941) (_1!3612 lt!124941)))))

(declare-fun bs!5976 () Bool)

(assert (= bs!5976 d!24582))

(assert (=> bs!5976 m!123589))

(declare-fun m!123631 () Bool)

(assert (=> bs!5976 m!123631))

(assert (=> b!77957 d!24582))

(declare-fun d!24584 () Bool)

(declare-fun e!51192 () Bool)

(assert (=> d!24584 e!51192))

(declare-fun res!64415 () Bool)

(assert (=> d!24584 (=> (not res!64415) (not e!51192))))

(assert (=> d!24584 (= res!64415 (invariant!0 (currentBit!3744 (_2!3609 lt!124902)) (currentByte!3749 (_2!3609 lt!124902)) (size!1539 (buf!1929 (_2!3609 lt!124902)))))))

(assert (=> d!24584 (= (readerFrom!0 (_2!3609 lt!124902) (currentBit!3744 thiss!1107) (currentByte!3749 thiss!1107)) (BitStream!2641 (buf!1929 (_2!3609 lt!124902)) (currentByte!3749 thiss!1107) (currentBit!3744 thiss!1107)))))

(declare-fun b!77997 () Bool)

(assert (=> b!77997 (= e!51192 (invariant!0 (currentBit!3744 thiss!1107) (currentByte!3749 thiss!1107) (size!1539 (buf!1929 (_2!3609 lt!124902)))))))

(assert (= (and d!24584 res!64415) b!77997))

(assert (=> d!24584 m!123601))

(declare-fun m!123633 () Bool)

(assert (=> b!77997 m!123633))

(assert (=> b!77957 d!24584))

(declare-fun d!24586 () Bool)

(assert (=> d!24586 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!1539 (buf!1929 thiss!1107))) ((_ sign_extend 32) (currentByte!3749 thiss!1107)) ((_ sign_extend 32) (currentBit!3744 thiss!1107))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1539 (buf!1929 thiss!1107))) ((_ sign_extend 32) (currentByte!3749 thiss!1107)) ((_ sign_extend 32) (currentBit!3744 thiss!1107))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!5977 () Bool)

(assert (= bs!5977 d!24586))

(declare-fun m!123635 () Bool)

(assert (=> bs!5977 m!123635))

(assert (=> b!77962 d!24586))

(declare-fun d!24588 () Bool)

(declare-fun e!51193 () Bool)

(assert (=> d!24588 e!51193))

(declare-fun res!64416 () Bool)

(assert (=> d!24588 (=> (not res!64416) (not e!51193))))

(declare-fun lt!124946 () (_ BitVec 64))

(declare-fun lt!124947 () (_ BitVec 64))

(declare-fun lt!124944 () (_ BitVec 64))

(assert (=> d!24588 (= res!64416 (= lt!124946 (bvsub lt!124947 lt!124944)))))

(assert (=> d!24588 (or (= (bvand lt!124947 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!124944 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!124947 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!124947 lt!124944) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24588 (= lt!124944 (remainingBits!0 ((_ sign_extend 32) (size!1539 (buf!1929 (_2!3609 lt!124902)))) ((_ sign_extend 32) (currentByte!3749 (_2!3609 lt!124902))) ((_ sign_extend 32) (currentBit!3744 (_2!3609 lt!124902)))))))

(declare-fun lt!124943 () (_ BitVec 64))

(declare-fun lt!124945 () (_ BitVec 64))

(assert (=> d!24588 (= lt!124947 (bvmul lt!124943 lt!124945))))

(assert (=> d!24588 (or (= lt!124943 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!124945 (bvsdiv (bvmul lt!124943 lt!124945) lt!124943)))))

(assert (=> d!24588 (= lt!124945 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24588 (= lt!124943 ((_ sign_extend 32) (size!1539 (buf!1929 (_2!3609 lt!124902)))))))

(assert (=> d!24588 (= lt!124946 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3749 (_2!3609 lt!124902))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3744 (_2!3609 lt!124902)))))))

(assert (=> d!24588 (invariant!0 (currentBit!3744 (_2!3609 lt!124902)) (currentByte!3749 (_2!3609 lt!124902)) (size!1539 (buf!1929 (_2!3609 lt!124902))))))

(assert (=> d!24588 (= (bitIndex!0 (size!1539 (buf!1929 (_2!3609 lt!124902))) (currentByte!3749 (_2!3609 lt!124902)) (currentBit!3744 (_2!3609 lt!124902))) lt!124946)))

(declare-fun b!77998 () Bool)

(declare-fun res!64417 () Bool)

(assert (=> b!77998 (=> (not res!64417) (not e!51193))))

(assert (=> b!77998 (= res!64417 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!124946))))

(declare-fun b!77999 () Bool)

(declare-fun lt!124942 () (_ BitVec 64))

(assert (=> b!77999 (= e!51193 (bvsle lt!124946 (bvmul lt!124942 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!77999 (or (= lt!124942 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!124942 #b0000000000000000000000000000000000000000000000000000000000001000) lt!124942)))))

(assert (=> b!77999 (= lt!124942 ((_ sign_extend 32) (size!1539 (buf!1929 (_2!3609 lt!124902)))))))

(assert (= (and d!24588 res!64416) b!77998))

(assert (= (and b!77998 res!64417) b!77999))

(declare-fun m!123637 () Bool)

(assert (=> d!24588 m!123637))

(assert (=> d!24588 m!123601))

(assert (=> b!77964 d!24588))

(declare-fun d!24590 () Bool)

(declare-fun e!51194 () Bool)

(assert (=> d!24590 e!51194))

(declare-fun res!64418 () Bool)

(assert (=> d!24590 (=> (not res!64418) (not e!51194))))

(declare-fun lt!124950 () (_ BitVec 64))

(declare-fun lt!124952 () (_ BitVec 64))

(declare-fun lt!124953 () (_ BitVec 64))

(assert (=> d!24590 (= res!64418 (= lt!124952 (bvsub lt!124953 lt!124950)))))

(assert (=> d!24590 (or (= (bvand lt!124953 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!124950 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!124953 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!124953 lt!124950) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24590 (= lt!124950 (remainingBits!0 ((_ sign_extend 32) (size!1539 (buf!1929 thiss!1107))) ((_ sign_extend 32) (currentByte!3749 thiss!1107)) ((_ sign_extend 32) (currentBit!3744 thiss!1107))))))

(declare-fun lt!124949 () (_ BitVec 64))

(declare-fun lt!124951 () (_ BitVec 64))

(assert (=> d!24590 (= lt!124953 (bvmul lt!124949 lt!124951))))

(assert (=> d!24590 (or (= lt!124949 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!124951 (bvsdiv (bvmul lt!124949 lt!124951) lt!124949)))))

(assert (=> d!24590 (= lt!124951 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24590 (= lt!124949 ((_ sign_extend 32) (size!1539 (buf!1929 thiss!1107))))))

(assert (=> d!24590 (= lt!124952 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3749 thiss!1107)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3744 thiss!1107))))))

(assert (=> d!24590 (invariant!0 (currentBit!3744 thiss!1107) (currentByte!3749 thiss!1107) (size!1539 (buf!1929 thiss!1107)))))

(assert (=> d!24590 (= (bitIndex!0 (size!1539 (buf!1929 thiss!1107)) (currentByte!3749 thiss!1107) (currentBit!3744 thiss!1107)) lt!124952)))

(declare-fun b!78000 () Bool)

(declare-fun res!64419 () Bool)

(assert (=> b!78000 (=> (not res!64419) (not e!51194))))

(assert (=> b!78000 (= res!64419 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!124952))))

(declare-fun b!78001 () Bool)

(declare-fun lt!124948 () (_ BitVec 64))

(assert (=> b!78001 (= e!51194 (bvsle lt!124952 (bvmul lt!124948 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!78001 (or (= lt!124948 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!124948 #b0000000000000000000000000000000000000000000000000000000000001000) lt!124948)))))

(assert (=> b!78001 (= lt!124948 ((_ sign_extend 32) (size!1539 (buf!1929 thiss!1107))))))

(assert (= (and d!24590 res!64418) b!78000))

(assert (= (and b!78000 res!64419) b!78001))

(assert (=> d!24590 m!123635))

(declare-fun m!123639 () Bool)

(assert (=> d!24590 m!123639))

(assert (=> b!77964 d!24590))

(declare-fun d!24592 () Bool)

(declare-fun res!64427 () Bool)

(declare-fun e!51199 () Bool)

(assert (=> d!24592 (=> (not res!64427) (not e!51199))))

(assert (=> d!24592 (= res!64427 (= (size!1539 (buf!1929 thiss!1107)) (size!1539 (buf!1929 (_2!3609 lt!124902)))))))

(assert (=> d!24592 (= (isPrefixOf!0 thiss!1107 (_2!3609 lt!124902)) e!51199)))

(declare-fun b!78008 () Bool)

(declare-fun res!64428 () Bool)

(assert (=> b!78008 (=> (not res!64428) (not e!51199))))

(assert (=> b!78008 (= res!64428 (bvsle (bitIndex!0 (size!1539 (buf!1929 thiss!1107)) (currentByte!3749 thiss!1107) (currentBit!3744 thiss!1107)) (bitIndex!0 (size!1539 (buf!1929 (_2!3609 lt!124902))) (currentByte!3749 (_2!3609 lt!124902)) (currentBit!3744 (_2!3609 lt!124902)))))))

(declare-fun b!78009 () Bool)

(declare-fun e!51200 () Bool)

(assert (=> b!78009 (= e!51199 e!51200)))

(declare-fun res!64426 () Bool)

(assert (=> b!78009 (=> res!64426 e!51200)))

(assert (=> b!78009 (= res!64426 (= (size!1539 (buf!1929 thiss!1107)) #b00000000000000000000000000000000))))

(declare-fun b!78010 () Bool)

(declare-fun arrayBitRangesEq!0 (array!3318 array!3318 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!78010 (= e!51200 (arrayBitRangesEq!0 (buf!1929 thiss!1107) (buf!1929 (_2!3609 lt!124902)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1539 (buf!1929 thiss!1107)) (currentByte!3749 thiss!1107) (currentBit!3744 thiss!1107))))))

(assert (= (and d!24592 res!64427) b!78008))

(assert (= (and b!78008 res!64428) b!78009))

(assert (= (and b!78009 (not res!64426)) b!78010))

(assert (=> b!78008 m!123597))

(assert (=> b!78008 m!123595))

(assert (=> b!78010 m!123597))

(assert (=> b!78010 m!123597))

(declare-fun m!123641 () Bool)

(assert (=> b!78010 m!123641))

(assert (=> b!77963 d!24592))

(declare-fun d!24596 () Bool)

(assert (=> d!24596 (= (inv!12 thiss!1107) (invariant!0 (currentBit!3744 thiss!1107) (currentByte!3749 thiss!1107) (size!1539 (buf!1929 thiss!1107))))))

(declare-fun bs!5979 () Bool)

(assert (= bs!5979 d!24596))

(assert (=> bs!5979 m!123639))

(assert (=> start!15290 d!24596))

(declare-fun d!24600 () Bool)

(assert (=> d!24600 (= (array_inv!1385 (buf!1929 thiss!1107)) (bvsge (size!1539 (buf!1929 thiss!1107)) #b00000000000000000000000000000000))))

(assert (=> b!77958 d!24600))

(declare-fun b!78033 () Bool)

(declare-fun res!64449 () Bool)

(declare-fun e!51213 () Bool)

(assert (=> b!78033 (=> (not res!64449) (not e!51213))))

(declare-fun lt!124973 () tuple2!6944)

(assert (=> b!78033 (= res!64449 (isPrefixOf!0 thiss!1107 (_2!3609 lt!124973)))))

(declare-fun b!78034 () Bool)

(declare-fun e!51212 () Bool)

(assert (=> b!78034 (= e!51213 e!51212)))

(declare-fun res!64451 () Bool)

(assert (=> b!78034 (=> (not res!64451) (not e!51212))))

(declare-fun lt!124974 () tuple2!6942)

(assert (=> b!78034 (= res!64451 (and (= (_2!3608 lt!124974) lt!124903) (= (_1!3608 lt!124974) (_2!3609 lt!124973))))))

(assert (=> b!78034 (= lt!124974 (readBitPure!0 (readerFrom!0 (_2!3609 lt!124973) (currentBit!3744 thiss!1107) (currentByte!3749 thiss!1107))))))

(declare-fun b!78032 () Bool)

(declare-fun res!64452 () Bool)

(assert (=> b!78032 (=> (not res!64452) (not e!51213))))

(declare-fun lt!124976 () (_ BitVec 64))

(declare-fun lt!124975 () (_ BitVec 64))

(assert (=> b!78032 (= res!64452 (= (bitIndex!0 (size!1539 (buf!1929 (_2!3609 lt!124973))) (currentByte!3749 (_2!3609 lt!124973)) (currentBit!3744 (_2!3609 lt!124973))) (bvadd lt!124976 lt!124975)))))

(assert (=> b!78032 (or (not (= (bvand lt!124976 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!124975 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!124976 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!124976 lt!124975) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!78032 (= lt!124975 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!78032 (= lt!124976 (bitIndex!0 (size!1539 (buf!1929 thiss!1107)) (currentByte!3749 thiss!1107) (currentBit!3744 thiss!1107)))))

(declare-fun b!78035 () Bool)

(assert (=> b!78035 (= e!51212 (= (bitIndex!0 (size!1539 (buf!1929 (_1!3608 lt!124974))) (currentByte!3749 (_1!3608 lt!124974)) (currentBit!3744 (_1!3608 lt!124974))) (bitIndex!0 (size!1539 (buf!1929 (_2!3609 lt!124973))) (currentByte!3749 (_2!3609 lt!124973)) (currentBit!3744 (_2!3609 lt!124973)))))))

(declare-fun d!24602 () Bool)

(assert (=> d!24602 e!51213))

(declare-fun res!64450 () Bool)

(assert (=> d!24602 (=> (not res!64450) (not e!51213))))

(assert (=> d!24602 (= res!64450 (= (size!1539 (buf!1929 thiss!1107)) (size!1539 (buf!1929 (_2!3609 lt!124973)))))))

(declare-fun choose!16 (BitStream!2640 Bool) tuple2!6944)

(assert (=> d!24602 (= lt!124973 (choose!16 thiss!1107 lt!124903))))

(assert (=> d!24602 (validate_offset_bit!0 ((_ sign_extend 32) (size!1539 (buf!1929 thiss!1107))) ((_ sign_extend 32) (currentByte!3749 thiss!1107)) ((_ sign_extend 32) (currentBit!3744 thiss!1107)))))

(assert (=> d!24602 (= (appendBit!0 thiss!1107 lt!124903) lt!124973)))

(assert (= (and d!24602 res!64450) b!78032))

(assert (= (and b!78032 res!64452) b!78033))

(assert (= (and b!78033 res!64449) b!78034))

(assert (= (and b!78034 res!64451) b!78035))

(declare-fun m!123649 () Bool)

(assert (=> b!78035 m!123649))

(declare-fun m!123651 () Bool)

(assert (=> b!78035 m!123651))

(assert (=> b!78032 m!123651))

(assert (=> b!78032 m!123597))

(declare-fun m!123653 () Bool)

(assert (=> d!24602 m!123653))

(assert (=> d!24602 m!123581))

(declare-fun m!123655 () Bool)

(assert (=> b!78034 m!123655))

(assert (=> b!78034 m!123655))

(declare-fun m!123657 () Bool)

(assert (=> b!78034 m!123657))

(declare-fun m!123659 () Bool)

(assert (=> b!78033 m!123659))

(assert (=> b!77960 d!24602))

(declare-fun d!24612 () Bool)

(assert (=> d!24612 (= (invariant!0 (currentBit!3744 (_2!3609 lt!124902)) (currentByte!3749 (_2!3609 lt!124902)) (size!1539 (buf!1929 (_2!3609 lt!124902)))) (and (bvsge (currentBit!3744 (_2!3609 lt!124902)) #b00000000000000000000000000000000) (bvslt (currentBit!3744 (_2!3609 lt!124902)) #b00000000000000000000000000001000) (bvsge (currentByte!3749 (_2!3609 lt!124902)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3749 (_2!3609 lt!124902)) (size!1539 (buf!1929 (_2!3609 lt!124902)))) (and (= (currentBit!3744 (_2!3609 lt!124902)) #b00000000000000000000000000000000) (= (currentByte!3749 (_2!3609 lt!124902)) (size!1539 (buf!1929 (_2!3609 lt!124902))))))))))

(assert (=> b!77959 d!24612))

(check-sat (not b!78034) (not d!24596) (not b!78008) (not b!78035) (not b!77997) (not d!24602) (not b!78010) (not d!24582) (not d!24584) (not d!24580) (not d!24588) (not b!78032) (not d!24590) (not d!24586) (not b!78033))
