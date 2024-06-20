; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30210 () Bool)

(assert start!30210)

(declare-fun b!154908 () Bool)

(declare-fun e!104230 () Bool)

(declare-fun lt!241269 () (_ BitVec 32))

(declare-datatypes ((array!7024 0))(
  ( (array!7025 (arr!3984 (Array (_ BitVec 32) (_ BitVec 8))) (size!3161 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5580 0))(
  ( (BitStream!5581 (buf!3664 array!7024) (currentByte!6695 (_ BitVec 32)) (currentBit!6690 (_ BitVec 32))) )
))
(declare-fun bs1!10 () BitStream!5580)

(assert (=> b!154908 (= e!104230 (and (bvsle #b00000000000000000000000000000000 lt!241269) (bvsgt lt!241269 (size!3161 (buf!3664 bs1!10)))))))

(declare-fun lt!241266 () (_ BitVec 64))

(assert (=> b!154908 (= lt!241269 ((_ extract 31 0) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bvsdiv lt!241266 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-datatypes ((tuple2!13722 0))(
  ( (tuple2!13723 (_1!7269 BitStream!5580) (_2!7269 (_ BitVec 8))) )
))
(declare-fun lt!241268 () tuple2!13722)

(declare-fun bs2!18 () BitStream!5580)

(declare-fun readBytePure!0 (BitStream!5580) tuple2!13722)

(assert (=> b!154908 (= lt!241268 (readBytePure!0 (BitStream!5581 (buf!3664 bs2!18) (currentByte!6695 bs1!10) (currentBit!6690 bs1!10))))))

(declare-fun lt!241270 () tuple2!13722)

(assert (=> b!154908 (= lt!241270 (readBytePure!0 bs1!10))))

(declare-fun b!154909 () Bool)

(declare-fun e!104231 () Bool)

(declare-fun array_inv!2950 (array!7024) Bool)

(assert (=> b!154909 (= e!104231 (array_inv!2950 (buf!3664 bs2!18)))))

(declare-fun b!154910 () Bool)

(declare-fun e!104232 () Bool)

(assert (=> b!154910 (= e!104232 (array_inv!2950 (buf!3664 bs1!10)))))

(declare-fun b!154911 () Bool)

(declare-fun e!104235 () Bool)

(assert (=> b!154911 (= e!104235 e!104230)))

(declare-fun res!129599 () Bool)

(assert (=> b!154911 (=> (not res!129599) (not e!104230))))

(declare-fun lt!241267 () (_ BitVec 64))

(assert (=> b!154911 (= res!129599 (bvsle lt!241267 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3161 (buf!3664 bs1!10))))))))

(assert (=> b!154911 (= lt!241267 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!241266))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!154911 (= lt!241266 (bitIndex!0 (size!3161 (buf!3664 bs1!10)) (currentByte!6695 bs1!10) (currentBit!6690 bs1!10)))))

(declare-fun b!154912 () Bool)

(declare-fun res!129597 () Bool)

(assert (=> b!154912 (=> (not res!129597) (not e!104230))))

(assert (=> b!154912 (= res!129597 (bvsle lt!241267 (bitIndex!0 (size!3161 (buf!3664 bs2!18)) (currentByte!6695 bs2!18) (currentBit!6690 bs2!18))))))

(declare-fun b!154913 () Bool)

(declare-fun res!129600 () Bool)

(assert (=> b!154913 (=> (not res!129600) (not e!104230))))

(declare-fun arrayBitRangesEq!0 (array!7024 array!7024 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!154913 (= res!129600 (arrayBitRangesEq!0 (buf!3664 bs1!10) (buf!3664 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!241267))))

(declare-fun res!129598 () Bool)

(assert (=> start!30210 (=> (not res!129598) (not e!104235))))

(assert (=> start!30210 (= res!129598 (= (size!3161 (buf!3664 bs1!10)) (size!3161 (buf!3664 bs2!18))))))

(assert (=> start!30210 e!104235))

(declare-fun inv!12 (BitStream!5580) Bool)

(assert (=> start!30210 (and (inv!12 bs1!10) e!104232)))

(assert (=> start!30210 (and (inv!12 bs2!18) e!104231)))

(assert (= (and start!30210 res!129598) b!154911))

(assert (= (and b!154911 res!129599) b!154912))

(assert (= (and b!154912 res!129597) b!154913))

(assert (= (and b!154913 res!129600) b!154908))

(assert (= start!30210 b!154910))

(assert (= start!30210 b!154909))

(declare-fun m!240865 () Bool)

(assert (=> b!154912 m!240865))

(declare-fun m!240867 () Bool)

(assert (=> b!154911 m!240867))

(declare-fun m!240869 () Bool)

(assert (=> b!154910 m!240869))

(declare-fun m!240871 () Bool)

(assert (=> b!154909 m!240871))

(declare-fun m!240873 () Bool)

(assert (=> b!154908 m!240873))

(declare-fun m!240875 () Bool)

(assert (=> b!154908 m!240875))

(declare-fun m!240877 () Bool)

(assert (=> start!30210 m!240877))

(declare-fun m!240879 () Bool)

(assert (=> start!30210 m!240879))

(declare-fun m!240881 () Bool)

(assert (=> b!154913 m!240881))

(check-sat (not b!154908) (not b!154909) (not b!154911) (not b!154910) (not start!30210) (not b!154913) (not b!154912))
(check-sat)
(get-model)

(declare-fun d!51060 () Bool)

(declare-fun res!129626 () Bool)

(declare-fun e!104266 () Bool)

(assert (=> d!51060 (=> res!129626 e!104266)))

(assert (=> d!51060 (= res!129626 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!241267))))

(assert (=> d!51060 (= (arrayBitRangesEq!0 (buf!3664 bs1!10) (buf!3664 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!241267) e!104266)))

(declare-fun b!154946 () Bool)

(declare-fun e!104269 () Bool)

(declare-fun call!2225 () Bool)

(assert (=> b!154946 (= e!104269 call!2225)))

(declare-fun lt!241293 () (_ BitVec 32))

(declare-fun bm!2222 () Bool)

(declare-fun c!8241 () Bool)

(declare-datatypes ((tuple4!210 0))(
  ( (tuple4!211 (_1!7271 (_ BitVec 32)) (_2!7271 (_ BitVec 32)) (_3!408 (_ BitVec 32)) (_4!105 (_ BitVec 32))) )
))
(declare-fun lt!241294 () tuple4!210)

(declare-fun lt!241292 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!2222 (= call!2225 (byteRangesEq!0 (ite c!8241 (select (arr!3984 (buf!3664 bs1!10)) (_3!408 lt!241294)) (select (arr!3984 (buf!3664 bs1!10)) (_4!105 lt!241294))) (ite c!8241 (select (arr!3984 (buf!3664 bs2!18)) (_3!408 lt!241294)) (select (arr!3984 (buf!3664 bs2!18)) (_4!105 lt!241294))) (ite c!8241 lt!241293 #b00000000000000000000000000000000) lt!241292))))

(declare-fun b!154947 () Bool)

(declare-fun e!104270 () Bool)

(assert (=> b!154947 (= e!104270 call!2225)))

(declare-fun e!104268 () Bool)

(declare-fun b!154948 () Bool)

(declare-fun arrayRangesEq!398 (array!7024 array!7024 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!154948 (= e!104268 (arrayRangesEq!398 (buf!3664 bs1!10) (buf!3664 bs2!18) (_1!7271 lt!241294) (_2!7271 lt!241294)))))

(declare-fun b!154949 () Bool)

(declare-fun e!104271 () Bool)

(assert (=> b!154949 (= e!104271 e!104270)))

(assert (=> b!154949 (= c!8241 (= (_3!408 lt!241294) (_4!105 lt!241294)))))

(declare-fun b!154950 () Bool)

(assert (=> b!154950 (= e!104266 e!104271)))

(declare-fun res!129625 () Bool)

(assert (=> b!154950 (=> (not res!129625) (not e!104271))))

(assert (=> b!154950 (= res!129625 e!104268)))

(declare-fun res!129624 () Bool)

(assert (=> b!154950 (=> res!129624 e!104268)))

(assert (=> b!154950 (= res!129624 (bvsge (_1!7271 lt!241294) (_2!7271 lt!241294)))))

(assert (=> b!154950 (= lt!241292 ((_ extract 31 0) (bvsrem lt!241267 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!154950 (= lt!241293 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!210)

(assert (=> b!154950 (= lt!241294 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!241267))))

(declare-fun b!154951 () Bool)

(declare-fun e!104267 () Bool)

(assert (=> b!154951 (= e!104270 e!104267)))

(declare-fun res!129623 () Bool)

(assert (=> b!154951 (= res!129623 (byteRangesEq!0 (select (arr!3984 (buf!3664 bs1!10)) (_3!408 lt!241294)) (select (arr!3984 (buf!3664 bs2!18)) (_3!408 lt!241294)) lt!241293 #b00000000000000000000000000001000))))

(assert (=> b!154951 (=> (not res!129623) (not e!104267))))

(declare-fun b!154952 () Bool)

(declare-fun res!129627 () Bool)

(assert (=> b!154952 (= res!129627 (= lt!241292 #b00000000000000000000000000000000))))

(assert (=> b!154952 (=> res!129627 e!104269)))

(assert (=> b!154952 (= e!104267 e!104269)))

(assert (= (and d!51060 (not res!129626)) b!154950))

(assert (= (and b!154950 (not res!129624)) b!154948))

(assert (= (and b!154950 res!129625) b!154949))

(assert (= (and b!154949 c!8241) b!154947))

(assert (= (and b!154949 (not c!8241)) b!154951))

(assert (= (and b!154951 res!129623) b!154952))

(assert (= (and b!154952 (not res!129627)) b!154946))

(assert (= (or b!154947 b!154946) bm!2222))

(declare-fun m!240905 () Bool)

(assert (=> bm!2222 m!240905))

(declare-fun m!240907 () Bool)

(assert (=> bm!2222 m!240907))

(declare-fun m!240909 () Bool)

(assert (=> bm!2222 m!240909))

(declare-fun m!240911 () Bool)

(assert (=> bm!2222 m!240911))

(declare-fun m!240913 () Bool)

(assert (=> bm!2222 m!240913))

(declare-fun m!240915 () Bool)

(assert (=> b!154948 m!240915))

(declare-fun m!240917 () Bool)

(assert (=> b!154950 m!240917))

(assert (=> b!154951 m!240913))

(assert (=> b!154951 m!240905))

(assert (=> b!154951 m!240913))

(assert (=> b!154951 m!240905))

(declare-fun m!240919 () Bool)

(assert (=> b!154951 m!240919))

(assert (=> b!154913 d!51060))

(declare-fun d!51070 () Bool)

(declare-datatypes ((tuple2!13726 0))(
  ( (tuple2!13727 (_1!7272 (_ BitVec 8)) (_2!7272 BitStream!5580)) )
))
(declare-fun lt!241297 () tuple2!13726)

(declare-fun readByte!0 (BitStream!5580) tuple2!13726)

(assert (=> d!51070 (= lt!241297 (readByte!0 (BitStream!5581 (buf!3664 bs2!18) (currentByte!6695 bs1!10) (currentBit!6690 bs1!10))))))

(assert (=> d!51070 (= (readBytePure!0 (BitStream!5581 (buf!3664 bs2!18) (currentByte!6695 bs1!10) (currentBit!6690 bs1!10))) (tuple2!13723 (_2!7272 lt!241297) (_1!7272 lt!241297)))))

(declare-fun bs!12502 () Bool)

(assert (= bs!12502 d!51070))

(declare-fun m!240921 () Bool)

(assert (=> bs!12502 m!240921))

(assert (=> b!154908 d!51070))

(declare-fun d!51072 () Bool)

(declare-fun lt!241298 () tuple2!13726)

(assert (=> d!51072 (= lt!241298 (readByte!0 bs1!10))))

(assert (=> d!51072 (= (readBytePure!0 bs1!10) (tuple2!13723 (_2!7272 lt!241298) (_1!7272 lt!241298)))))

(declare-fun bs!12503 () Bool)

(assert (= bs!12503 d!51072))

(declare-fun m!240923 () Bool)

(assert (=> bs!12503 m!240923))

(assert (=> b!154908 d!51072))

(declare-fun d!51074 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!51074 (= (inv!12 bs1!10) (invariant!0 (currentBit!6690 bs1!10) (currentByte!6695 bs1!10) (size!3161 (buf!3664 bs1!10))))))

(declare-fun bs!12504 () Bool)

(assert (= bs!12504 d!51074))

(declare-fun m!240925 () Bool)

(assert (=> bs!12504 m!240925))

(assert (=> start!30210 d!51074))

(declare-fun d!51076 () Bool)

(assert (=> d!51076 (= (inv!12 bs2!18) (invariant!0 (currentBit!6690 bs2!18) (currentByte!6695 bs2!18) (size!3161 (buf!3664 bs2!18))))))

(declare-fun bs!12505 () Bool)

(assert (= bs!12505 d!51076))

(declare-fun m!240927 () Bool)

(assert (=> bs!12505 m!240927))

(assert (=> start!30210 d!51076))

(declare-fun d!51078 () Bool)

(assert (=> d!51078 (= (array_inv!2950 (buf!3664 bs2!18)) (bvsge (size!3161 (buf!3664 bs2!18)) #b00000000000000000000000000000000))))

(assert (=> b!154909 d!51078))

(declare-fun d!51080 () Bool)

(assert (=> d!51080 (= (array_inv!2950 (buf!3664 bs1!10)) (bvsge (size!3161 (buf!3664 bs1!10)) #b00000000000000000000000000000000))))

(assert (=> b!154910 d!51080))

(declare-fun d!51082 () Bool)

(declare-fun e!104277 () Bool)

(assert (=> d!51082 e!104277))

(declare-fun res!129638 () Bool)

(assert (=> d!51082 (=> (not res!129638) (not e!104277))))

(declare-fun lt!241332 () (_ BitVec 64))

(declare-fun lt!241330 () (_ BitVec 64))

(declare-fun lt!241329 () (_ BitVec 64))

(assert (=> d!51082 (= res!129638 (= lt!241329 (bvsub lt!241330 lt!241332)))))

(assert (=> d!51082 (or (= (bvand lt!241330 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!241332 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!241330 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!241330 lt!241332) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!51082 (= lt!241332 (remainingBits!0 ((_ sign_extend 32) (size!3161 (buf!3664 bs1!10))) ((_ sign_extend 32) (currentByte!6695 bs1!10)) ((_ sign_extend 32) (currentBit!6690 bs1!10))))))

(declare-fun lt!241333 () (_ BitVec 64))

(declare-fun lt!241331 () (_ BitVec 64))

(assert (=> d!51082 (= lt!241330 (bvmul lt!241333 lt!241331))))

(assert (=> d!51082 (or (= lt!241333 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!241331 (bvsdiv (bvmul lt!241333 lt!241331) lt!241333)))))

(assert (=> d!51082 (= lt!241331 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!51082 (= lt!241333 ((_ sign_extend 32) (size!3161 (buf!3664 bs1!10))))))

(assert (=> d!51082 (= lt!241329 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6695 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6690 bs1!10))))))

(assert (=> d!51082 (invariant!0 (currentBit!6690 bs1!10) (currentByte!6695 bs1!10) (size!3161 (buf!3664 bs1!10)))))

(assert (=> d!51082 (= (bitIndex!0 (size!3161 (buf!3664 bs1!10)) (currentByte!6695 bs1!10) (currentBit!6690 bs1!10)) lt!241329)))

(declare-fun b!154963 () Bool)

(declare-fun res!129639 () Bool)

(assert (=> b!154963 (=> (not res!129639) (not e!104277))))

(assert (=> b!154963 (= res!129639 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!241329))))

(declare-fun b!154964 () Bool)

(declare-fun lt!241334 () (_ BitVec 64))

(assert (=> b!154964 (= e!104277 (bvsle lt!241329 (bvmul lt!241334 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!154964 (or (= lt!241334 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!241334 #b0000000000000000000000000000000000000000000000000000000000001000) lt!241334)))))

(assert (=> b!154964 (= lt!241334 ((_ sign_extend 32) (size!3161 (buf!3664 bs1!10))))))

(assert (= (and d!51082 res!129638) b!154963))

(assert (= (and b!154963 res!129639) b!154964))

(declare-fun m!240931 () Bool)

(assert (=> d!51082 m!240931))

(assert (=> d!51082 m!240925))

(assert (=> b!154911 d!51082))

(declare-fun d!51088 () Bool)

(declare-fun e!104280 () Bool)

(assert (=> d!51088 e!104280))

(declare-fun res!129642 () Bool)

(assert (=> d!51088 (=> (not res!129642) (not e!104280))))

(declare-fun lt!241342 () (_ BitVec 64))

(declare-fun lt!241344 () (_ BitVec 64))

(declare-fun lt!241341 () (_ BitVec 64))

(assert (=> d!51088 (= res!129642 (= lt!241341 (bvsub lt!241342 lt!241344)))))

(assert (=> d!51088 (or (= (bvand lt!241342 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!241344 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!241342 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!241342 lt!241344) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!51088 (= lt!241344 (remainingBits!0 ((_ sign_extend 32) (size!3161 (buf!3664 bs2!18))) ((_ sign_extend 32) (currentByte!6695 bs2!18)) ((_ sign_extend 32) (currentBit!6690 bs2!18))))))

(declare-fun lt!241345 () (_ BitVec 64))

(declare-fun lt!241343 () (_ BitVec 64))

(assert (=> d!51088 (= lt!241342 (bvmul lt!241345 lt!241343))))

(assert (=> d!51088 (or (= lt!241345 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!241343 (bvsdiv (bvmul lt!241345 lt!241343) lt!241345)))))

(assert (=> d!51088 (= lt!241343 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!51088 (= lt!241345 ((_ sign_extend 32) (size!3161 (buf!3664 bs2!18))))))

(assert (=> d!51088 (= lt!241341 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6695 bs2!18)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6690 bs2!18))))))

(assert (=> d!51088 (invariant!0 (currentBit!6690 bs2!18) (currentByte!6695 bs2!18) (size!3161 (buf!3664 bs2!18)))))

(assert (=> d!51088 (= (bitIndex!0 (size!3161 (buf!3664 bs2!18)) (currentByte!6695 bs2!18) (currentBit!6690 bs2!18)) lt!241341)))

(declare-fun b!154967 () Bool)

(declare-fun res!129643 () Bool)

(assert (=> b!154967 (=> (not res!129643) (not e!104280))))

(assert (=> b!154967 (= res!129643 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!241341))))

(declare-fun b!154968 () Bool)

(declare-fun lt!241346 () (_ BitVec 64))

(assert (=> b!154968 (= e!104280 (bvsle lt!241341 (bvmul lt!241346 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!154968 (or (= lt!241346 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!241346 #b0000000000000000000000000000000000000000000000000000000000001000) lt!241346)))))

(assert (=> b!154968 (= lt!241346 ((_ sign_extend 32) (size!3161 (buf!3664 bs2!18))))))

(assert (= (and d!51088 res!129642) b!154967))

(assert (= (and b!154967 res!129643) b!154968))

(declare-fun m!240933 () Bool)

(assert (=> d!51088 m!240933))

(assert (=> d!51088 m!240927))

(assert (=> b!154912 d!51088))

(check-sat (not d!51082) (not d!51088) (not d!51074) (not b!154948) (not b!154951) (not d!51070) (not d!51072) (not bm!2222) (not b!154950) (not d!51076))
(check-sat)
