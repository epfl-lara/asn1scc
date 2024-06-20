; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30296 () Bool)

(assert start!30296)

(declare-fun b!155230 () Bool)

(declare-fun e!104514 () Bool)

(declare-datatypes ((array!7044 0))(
  ( (array!7045 (arr!3991 (Array (_ BitVec 32) (_ BitVec 8))) (size!3168 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5594 0))(
  ( (BitStream!5595 (buf!3671 array!7044) (currentByte!6710 (_ BitVec 32)) (currentBit!6705 (_ BitVec 32))) )
))
(declare-fun bs1!10 () BitStream!5594)

(declare-fun array_inv!2957 (array!7044) Bool)

(assert (=> b!155230 (= e!104514 (array_inv!2957 (buf!3671 bs1!10)))))

(declare-fun res!129844 () Bool)

(declare-fun e!104516 () Bool)

(assert (=> start!30296 (=> (not res!129844) (not e!104516))))

(declare-fun bs2!18 () BitStream!5594)

(assert (=> start!30296 (= res!129844 (= (size!3168 (buf!3671 bs1!10)) (size!3168 (buf!3671 bs2!18))))))

(assert (=> start!30296 e!104516))

(declare-fun inv!12 (BitStream!5594) Bool)

(assert (=> start!30296 (and (inv!12 bs1!10) e!104514)))

(declare-fun e!104512 () Bool)

(assert (=> start!30296 (and (inv!12 bs2!18) e!104512)))

(declare-fun b!155231 () Bool)

(declare-fun e!104511 () Bool)

(assert (=> b!155231 (= e!104516 e!104511)))

(declare-fun res!129843 () Bool)

(assert (=> b!155231 (=> (not res!129843) (not e!104511))))

(declare-fun lt!241622 () (_ BitVec 64))

(assert (=> b!155231 (= res!129843 (bvsle lt!241622 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3168 (buf!3671 bs1!10))))))))

(declare-fun lt!241621 () (_ BitVec 64))

(assert (=> b!155231 (= lt!241622 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!241621))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!155231 (= lt!241621 (bitIndex!0 (size!3168 (buf!3671 bs1!10)) (currentByte!6710 bs1!10) (currentBit!6705 bs1!10)))))

(declare-fun b!155232 () Bool)

(declare-fun lt!241625 () (_ BitVec 32))

(declare-fun e!104515 () Bool)

(declare-fun arrayRangesEq!406 (array!7044 array!7044 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!155232 (= e!104515 (not (arrayRangesEq!406 (buf!3671 bs1!10) (buf!3671 bs2!18) #b00000000000000000000000000000000 lt!241625)))))

(declare-fun b!155233 () Bool)

(declare-fun res!129845 () Bool)

(assert (=> b!155233 (=> (not res!129845) (not e!104511))))

(assert (=> b!155233 (= res!129845 (bvsle lt!241622 (bitIndex!0 (size!3168 (buf!3671 bs2!18)) (currentByte!6710 bs2!18) (currentBit!6705 bs2!18))))))

(declare-fun b!155234 () Bool)

(assert (=> b!155234 (= e!104511 e!104515)))

(declare-fun res!129846 () Bool)

(assert (=> b!155234 (=> (not res!129846) (not e!104515))))

(assert (=> b!155234 (= res!129846 (and (bvsle #b00000000000000000000000000000000 lt!241625) (bvsle lt!241625 (size!3168 (buf!3671 bs1!10))) (bvsle #b00000000000000000000000000000000 (currentByte!6710 bs1!10)) (bvslt (currentByte!6710 bs1!10) lt!241625)))))

(assert (=> b!155234 (= lt!241625 ((_ extract 31 0) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bvsdiv lt!241621 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-datatypes ((tuple2!13750 0))(
  ( (tuple2!13751 (_1!7289 BitStream!5594) (_2!7289 (_ BitVec 8))) )
))
(declare-fun lt!241623 () tuple2!13750)

(declare-fun readBytePure!0 (BitStream!5594) tuple2!13750)

(assert (=> b!155234 (= lt!241623 (readBytePure!0 (BitStream!5595 (buf!3671 bs2!18) (currentByte!6710 bs1!10) (currentBit!6705 bs1!10))))))

(declare-fun lt!241624 () tuple2!13750)

(assert (=> b!155234 (= lt!241624 (readBytePure!0 bs1!10))))

(declare-fun b!155235 () Bool)

(assert (=> b!155235 (= e!104512 (array_inv!2957 (buf!3671 bs2!18)))))

(declare-fun b!155236 () Bool)

(declare-fun res!129842 () Bool)

(assert (=> b!155236 (=> (not res!129842) (not e!104511))))

(declare-fun arrayBitRangesEq!0 (array!7044 array!7044 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!155236 (= res!129842 (arrayBitRangesEq!0 (buf!3671 bs1!10) (buf!3671 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!241622))))

(assert (= (and start!30296 res!129844) b!155231))

(assert (= (and b!155231 res!129843) b!155233))

(assert (= (and b!155233 res!129845) b!155236))

(assert (= (and b!155236 res!129842) b!155234))

(assert (= (and b!155234 res!129846) b!155232))

(assert (= start!30296 b!155230))

(assert (= start!30296 b!155235))

(declare-fun m!241195 () Bool)

(assert (=> start!30296 m!241195))

(declare-fun m!241197 () Bool)

(assert (=> start!30296 m!241197))

(declare-fun m!241199 () Bool)

(assert (=> b!155233 m!241199))

(declare-fun m!241201 () Bool)

(assert (=> b!155236 m!241201))

(declare-fun m!241203 () Bool)

(assert (=> b!155234 m!241203))

(declare-fun m!241205 () Bool)

(assert (=> b!155234 m!241205))

(declare-fun m!241207 () Bool)

(assert (=> b!155235 m!241207))

(declare-fun m!241209 () Bool)

(assert (=> b!155232 m!241209))

(declare-fun m!241211 () Bool)

(assert (=> b!155230 m!241211))

(declare-fun m!241213 () Bool)

(assert (=> b!155231 m!241213))

(push 1)

(assert (not b!155232))

(assert (not b!155236))

(assert (not b!155233))

(assert (not b!155231))

(assert (not b!155230))

(assert (not b!155235))

(assert (not b!155234))

(assert (not start!30296))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!51232 () Bool)

(assert (=> d!51232 (= (array_inv!2957 (buf!3671 bs2!18)) (bvsge (size!3168 (buf!3671 bs2!18)) #b00000000000000000000000000000000))))

(assert (=> b!155235 d!51232))

(declare-fun d!51234 () Bool)

(assert (=> d!51234 (= (array_inv!2957 (buf!3671 bs1!10)) (bvsge (size!3168 (buf!3671 bs1!10)) #b00000000000000000000000000000000))))

(assert (=> b!155230 d!51234))

(declare-fun d!51236 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!51236 (= (inv!12 bs1!10) (invariant!0 (currentBit!6705 bs1!10) (currentByte!6710 bs1!10) (size!3168 (buf!3671 bs1!10))))))

(declare-fun bs!12540 () Bool)

(assert (= bs!12540 d!51236))

(declare-fun m!241283 () Bool)

(assert (=> bs!12540 m!241283))

(assert (=> start!30296 d!51236))

(declare-fun d!51238 () Bool)

(assert (=> d!51238 (= (inv!12 bs2!18) (invariant!0 (currentBit!6705 bs2!18) (currentByte!6710 bs2!18) (size!3168 (buf!3671 bs2!18))))))

(declare-fun bs!12541 () Bool)

(assert (= bs!12541 d!51238))

(declare-fun m!241285 () Bool)

(assert (=> bs!12541 m!241285))

(assert (=> start!30296 d!51238))

(declare-fun d!51240 () Bool)

(declare-datatypes ((tuple2!13756 0))(
  ( (tuple2!13757 (_1!7294 (_ BitVec 8)) (_2!7294 BitStream!5594)) )
))
(declare-fun lt!241702 () tuple2!13756)

(declare-fun readByte!0 (BitStream!5594) tuple2!13756)

(assert (=> d!51240 (= lt!241702 (readByte!0 (BitStream!5595 (buf!3671 bs2!18) (currentByte!6710 bs1!10) (currentBit!6705 bs1!10))))))

(assert (=> d!51240 (= (readBytePure!0 (BitStream!5595 (buf!3671 bs2!18) (currentByte!6710 bs1!10) (currentBit!6705 bs1!10))) (tuple2!13751 (_2!7294 lt!241702) (_1!7294 lt!241702)))))

(declare-fun bs!12542 () Bool)

(assert (= bs!12542 d!51240))

(declare-fun m!241287 () Bool)

(assert (=> bs!12542 m!241287))

(assert (=> b!155234 d!51240))

(declare-fun d!51242 () Bool)

(declare-fun lt!241703 () tuple2!13756)

(assert (=> d!51242 (= lt!241703 (readByte!0 bs1!10))))

(assert (=> d!51242 (= (readBytePure!0 bs1!10) (tuple2!13751 (_2!7294 lt!241703) (_1!7294 lt!241703)))))

(declare-fun bs!12543 () Bool)

(assert (= bs!12543 d!51242))

(declare-fun m!241289 () Bool)

(assert (=> bs!12543 m!241289))

(assert (=> b!155234 d!51242))

(declare-fun d!51244 () Bool)

(declare-fun res!129909 () Bool)

(declare-fun e!104577 () Bool)

(assert (=> d!51244 (=> res!129909 e!104577)))

(assert (=> d!51244 (= res!129909 (= #b00000000000000000000000000000000 lt!241625))))

(assert (=> d!51244 (= (arrayRangesEq!406 (buf!3671 bs1!10) (buf!3671 bs2!18) #b00000000000000000000000000000000 lt!241625) e!104577)))

(declare-fun b!155311 () Bool)

(declare-fun e!104578 () Bool)

(assert (=> b!155311 (= e!104577 e!104578)))

(declare-fun res!129910 () Bool)

(assert (=> b!155311 (=> (not res!129910) (not e!104578))))

(assert (=> b!155311 (= res!129910 (= (select (arr!3991 (buf!3671 bs1!10)) #b00000000000000000000000000000000) (select (arr!3991 (buf!3671 bs2!18)) #b00000000000000000000000000000000)))))

(declare-fun b!155312 () Bool)

(assert (=> b!155312 (= e!104578 (arrayRangesEq!406 (buf!3671 bs1!10) (buf!3671 bs2!18) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!241625))))

(assert (= (and d!51244 (not res!129909)) b!155311))

(assert (= (and b!155311 res!129910) b!155312))

(declare-fun m!241291 () Bool)

(assert (=> b!155311 m!241291))

(declare-fun m!241293 () Bool)

(assert (=> b!155311 m!241293))

(declare-fun m!241295 () Bool)

(assert (=> b!155312 m!241295))

(assert (=> b!155232 d!51244))

(declare-fun d!51246 () Bool)

(declare-fun e!104581 () Bool)

(assert (=> d!51246 e!104581))

(declare-fun res!129915 () Bool)

(assert (=> d!51246 (=> (not res!129915) (not e!104581))))

(declare-fun lt!241717 () (_ BitVec 64))

(declare-fun lt!241718 () (_ BitVec 64))

(declare-fun lt!241719 () (_ BitVec 64))

(assert (=> d!51246 (= res!129915 (= lt!241718 (bvsub lt!241717 lt!241719)))))

(assert (=> d!51246 (or (= (bvand lt!241717 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!241719 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!241717 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!241717 lt!241719) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!51246 (= lt!241719 (remainingBits!0 ((_ sign_extend 32) (size!3168 (buf!3671 bs2!18))) ((_ sign_extend 32) (currentByte!6710 bs2!18)) ((_ sign_extend 32) (currentBit!6705 bs2!18))))))

(declare-fun lt!241721 () (_ BitVec 64))

(declare-fun lt!241720 () (_ BitVec 64))

(assert (=> d!51246 (= lt!241717 (bvmul lt!241721 lt!241720))))

(assert (=> d!51246 (or (= lt!241721 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!241720 (bvsdiv (bvmul lt!241721 lt!241720) lt!241721)))))

(assert (=> d!51246 (= lt!241720 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!51246 (= lt!241721 ((_ sign_extend 32) (size!3168 (buf!3671 bs2!18))))))

(assert (=> d!51246 (= lt!241718 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6710 bs2!18)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6705 bs2!18))))))

(assert (=> d!51246 (invariant!0 (currentBit!6705 bs2!18) (currentByte!6710 bs2!18) (size!3168 (buf!3671 bs2!18)))))

(assert (=> d!51246 (= (bitIndex!0 (size!3168 (buf!3671 bs2!18)) (currentByte!6710 bs2!18) (currentBit!6705 bs2!18)) lt!241718)))

(declare-fun b!155317 () Bool)

(declare-fun res!129916 () Bool)

(assert (=> b!155317 (=> (not res!129916) (not e!104581))))

(assert (=> b!155317 (= res!129916 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!241718))))

(declare-fun b!155318 () Bool)

(declare-fun lt!241716 () (_ BitVec 64))

(assert (=> b!155318 (= e!104581 (bvsle lt!241718 (bvmul lt!241716 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!155318 (or (= lt!241716 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!241716 #b0000000000000000000000000000000000000000000000000000000000001000) lt!241716)))))

(assert (=> b!155318 (= lt!241716 ((_ sign_extend 32) (size!3168 (buf!3671 bs2!18))))))

(assert (= (and d!51246 res!129915) b!155317))

(assert (= (and b!155317 res!129916) b!155318))

(declare-fun m!241297 () Bool)

(assert (=> d!51246 m!241297))

(assert (=> d!51246 m!241285))

(assert (=> b!155233 d!51246))

(declare-fun d!51248 () Bool)

(declare-fun e!104582 () Bool)

(assert (=> d!51248 e!104582))

(declare-fun res!129917 () Bool)

(assert (=> d!51248 (=> (not res!129917) (not e!104582))))

(declare-fun lt!241723 () (_ BitVec 64))

(declare-fun lt!241725 () (_ BitVec 64))

(declare-fun lt!241724 () (_ BitVec 64))

(assert (=> d!51248 (= res!129917 (= lt!241724 (bvsub lt!241723 lt!241725)))))

(assert (=> d!51248 (or (= (bvand lt!241723 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!241725 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!241723 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!241723 lt!241725) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!51248 (= lt!241725 (remainingBits!0 ((_ sign_extend 32) (size!3168 (buf!3671 bs1!10))) ((_ sign_extend 32) (currentByte!6710 bs1!10)) ((_ sign_extend 32) (currentBit!6705 bs1!10))))))

(declare-fun lt!241727 () (_ BitVec 64))

(declare-fun lt!241726 () (_ BitVec 64))

(assert (=> d!51248 (= lt!241723 (bvmul lt!241727 lt!241726))))

(assert (=> d!51248 (or (= lt!241727 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!241726 (bvsdiv (bvmul lt!241727 lt!241726) lt!241727)))))

(assert (=> d!51248 (= lt!241726 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!51248 (= lt!241727 ((_ sign_extend 32) (size!3168 (buf!3671 bs1!10))))))

(assert (=> d!51248 (= lt!241724 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6710 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6705 bs1!10))))))

(assert (=> d!51248 (invariant!0 (currentBit!6705 bs1!10) (currentByte!6710 bs1!10) (size!3168 (buf!3671 bs1!10)))))

(assert (=> d!51248 (= (bitIndex!0 (size!3168 (buf!3671 bs1!10)) (currentByte!6710 bs1!10) (currentBit!6705 bs1!10)) lt!241724)))

(declare-fun b!155319 () Bool)

(declare-fun res!129918 () Bool)

(assert (=> b!155319 (=> (not res!129918) (not e!104582))))

(assert (=> b!155319 (= res!129918 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!241724))))

(declare-fun b!155320 () Bool)

(declare-fun lt!241722 () (_ BitVec 64))

(assert (=> b!155320 (= e!104582 (bvsle lt!241724 (bvmul lt!241722 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!155320 (or (= lt!241722 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!241722 #b0000000000000000000000000000000000000000000000000000000000001000) lt!241722)))))

(assert (=> b!155320 (= lt!241722 ((_ sign_extend 32) (size!3168 (buf!3671 bs1!10))))))

(assert (= (and d!51248 res!129917) b!155319))

(assert (= (and b!155319 res!129918) b!155320))

(declare-fun m!241299 () Bool)

(assert (=> d!51248 m!241299))

(assert (=> d!51248 m!241283))

(assert (=> b!155231 d!51248))

(declare-fun b!155335 () Bool)

(declare-fun e!104596 () Bool)

(declare-fun e!104599 () Bool)

(assert (=> b!155335 (= e!104596 e!104599)))

(declare-fun res!129929 () Bool)

(assert (=> b!155335 (=> (not res!129929) (not e!104599))))

(declare-fun e!104600 () Bool)

(assert (=> b!155335 (= res!129929 e!104600)))

(declare-fun res!129932 () Bool)

(assert (=> b!155335 (=> res!129932 e!104600)))

(declare-datatypes ((tuple4!226 0))(
  ( (tuple4!227 (_1!7295 (_ BitVec 32)) (_2!7295 (_ BitVec 32)) (_3!416 (_ BitVec 32)) (_4!113 (_ BitVec 32))) )
))
(declare-fun lt!241735 () tuple4!226)

(assert (=> b!155335 (= res!129932 (bvsge (_1!7295 lt!241735) (_2!7295 lt!241735)))))

(declare-fun lt!241734 () (_ BitVec 32))

(assert (=> b!155335 (= lt!241734 ((_ extract 31 0) (bvsrem lt!241622 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!241736 () (_ BitVec 32))

(assert (=> b!155335 (= lt!241736 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!226)

(assert (=> b!155335 (= lt!241735 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!241622))))

(declare-fun e!104597 () Bool)

(declare-fun b!155336 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!155336 (= e!104597 (byteRangesEq!0 (select (arr!3991 (buf!3671 bs1!10)) (_4!113 lt!241735)) (select (arr!3991 (buf!3671 bs2!18)) (_4!113 lt!241735)) #b00000000000000000000000000000000 lt!241734))))

(declare-fun b!155337 () Bool)

(declare-fun res!129933 () Bool)

(assert (=> b!155337 (= res!129933 (= lt!241734 #b00000000000000000000000000000000))))

(assert (=> b!155337 (=> res!129933 e!104597)))

(declare-fun e!104595 () Bool)

(assert (=> b!155337 (= e!104595 e!104597)))

(declare-fun bm!2246 () Bool)

(declare-fun c!8265 () Bool)

(declare-fun call!2249 () Bool)

(assert (=> bm!2246 (= call!2249 (byteRangesEq!0 (select (arr!3991 (buf!3671 bs1!10)) (_3!416 lt!241735)) (select (arr!3991 (buf!3671 bs2!18)) (_3!416 lt!241735)) lt!241736 (ite c!8265 lt!241734 #b00000000000000000000000000001000)))))

(declare-fun d!51250 () Bool)

(declare-fun res!129931 () Bool)

(assert (=> d!51250 (=> res!129931 e!104596)))

(assert (=> d!51250 (= res!129931 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!241622))))

(assert (=> d!51250 (= (arrayBitRangesEq!0 (buf!3671 bs1!10) (buf!3671 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!241622) e!104596)))

(declare-fun b!155338 () Bool)

(declare-fun e!104598 () Bool)

(assert (=> b!155338 (= e!104599 e!104598)))

(assert (=> b!155338 (= c!8265 (= (_3!416 lt!241735) (_4!113 lt!241735)))))

(declare-fun b!155339 () Bool)

(assert (=> b!155339 (= e!104598 call!2249)))

(declare-fun b!155340 () Bool)

(assert (=> b!155340 (= e!104600 (arrayRangesEq!406 (buf!3671 bs1!10) (buf!3671 bs2!18) (_1!7295 lt!241735) (_2!7295 lt!241735)))))

(declare-fun b!155341 () Bool)

(assert (=> b!155341 (= e!104598 e!104595)))

(declare-fun res!129930 () Bool)

(assert (=> b!155341 (= res!129930 call!2249)))

(assert (=> b!155341 (=> (not res!129930) (not e!104595))))

(assert (= (and d!51250 (not res!129931)) b!155335))

(assert (= (and b!155335 (not res!129932)) b!155340))

(assert (= (and b!155335 res!129929) b!155338))

(assert (= (and b!155338 c!8265) b!155339))

(assert (= (and b!155338 (not c!8265)) b!155341))

(assert (= (and b!155341 res!129930) b!155337))

(assert (= (and b!155337 (not res!129933)) b!155336))

(assert (= (or b!155339 b!155341) bm!2246))

(declare-fun m!241301 () Bool)

(assert (=> b!155335 m!241301))

(declare-fun m!241303 () Bool)

(assert (=> b!155336 m!241303))

(declare-fun m!241305 () Bool)

(assert (=> b!155336 m!241305))

(assert (=> b!155336 m!241303))

(assert (=> b!155336 m!241305))

(declare-fun m!241307 () Bool)

(assert (=> b!155336 m!241307))

(declare-fun m!241309 () Bool)

(assert (=> bm!2246 m!241309))

(declare-fun m!241311 () Bool)

(assert (=> bm!2246 m!241311))

(assert (=> bm!2246 m!241309))

(assert (=> bm!2246 m!241311))

(declare-fun m!241313 () Bool)

(assert (=> bm!2246 m!241313))

(declare-fun m!241315 () Bool)

(assert (=> b!155340 m!241315))

(assert (=> b!155236 d!51250))

(push 1)

(assert (not d!51236))

(assert (not bm!2246))

(assert (not d!51246))

(assert (not b!155312))

(assert (not d!51240))

(assert (not d!51238))

(assert (not b!155335))

(assert (not d!51248))

(assert (not d!51242))

(assert (not b!155336))

(assert (not b!155340))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun lt!241783 () (_ BitVec 8))

(declare-fun lt!241784 () (_ BitVec 8))

(declare-fun d!51274 () Bool)

(assert (=> d!51274 (= lt!241784 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3991 (buf!3671 (BitStream!5595 (buf!3671 bs2!18) (currentByte!6710 bs1!10) (currentBit!6705 bs1!10)))) (currentByte!6710 (BitStream!5595 (buf!3671 bs2!18) (currentByte!6710 bs1!10) (currentBit!6705 bs1!10))))) ((_ sign_extend 24) lt!241783))))))

(assert (=> d!51274 (= lt!241783 ((_ extract 7 0) (currentBit!6705 (BitStream!5595 (buf!3671 bs2!18) (currentByte!6710 bs1!10) (currentBit!6705 bs1!10)))))))

(declare-fun e!104618 () Bool)

(assert (=> d!51274 e!104618))

(declare-fun res!129953 () Bool)

(assert (=> d!51274 (=> (not res!129953) (not e!104618))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!51274 (= res!129953 (validate_offset_bits!1 ((_ sign_extend 32) (size!3168 (buf!3671 (BitStream!5595 (buf!3671 bs2!18) (currentByte!6710 bs1!10) (currentBit!6705 bs1!10))))) ((_ sign_extend 32) (currentByte!6710 (BitStream!5595 (buf!3671 bs2!18) (currentByte!6710 bs1!10) (currentBit!6705 bs1!10)))) ((_ sign_extend 32) (currentBit!6705 (BitStream!5595 (buf!3671 bs2!18) (currentByte!6710 bs1!10) (currentBit!6705 bs1!10)))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((Unit!9771 0))(
  ( (Unit!9772) )
))
(declare-datatypes ((tuple2!13760 0))(
  ( (tuple2!13761 (_1!7297 Unit!9771) (_2!7297 (_ BitVec 8))) )
))
(declare-fun Unit!9773 () Unit!9771)

(declare-fun Unit!9774 () Unit!9771)

(assert (=> d!51274 (= (readByte!0 (BitStream!5595 (buf!3671 bs2!18) (currentByte!6710 bs1!10) (currentBit!6705 bs1!10))) (tuple2!13757 (_2!7297 (ite (bvsgt ((_ sign_extend 24) lt!241783) #b00000000000000000000000000000000) (tuple2!13761 Unit!9773 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!241784) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3991 (buf!3671 (BitStream!5595 (buf!3671 bs2!18) (currentByte!6710 bs1!10) (currentBit!6705 bs1!10)))) (bvadd (currentByte!6710 (BitStream!5595 (buf!3671 bs2!18) (currentByte!6710 bs1!10) (currentBit!6705 bs1!10))) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!241783)))))))) (tuple2!13761 Unit!9774 lt!241784))) (BitStream!5595 (buf!3671 (BitStream!5595 (buf!3671 bs2!18) (currentByte!6710 bs1!10) (currentBit!6705 bs1!10))) (bvadd (currentByte!6710 (BitStream!5595 (buf!3671 bs2!18) (currentByte!6710 bs1!10) (currentBit!6705 bs1!10))) #b00000000000000000000000000000001) (currentBit!6705 (BitStream!5595 (buf!3671 bs2!18) (currentByte!6710 bs1!10) (currentBit!6705 bs1!10))))))))

(declare-fun b!155358 () Bool)

(declare-fun e!104617 () Bool)

(assert (=> b!155358 (= e!104618 e!104617)))

(declare-fun res!129952 () Bool)

(assert (=> b!155358 (=> (not res!129952) (not e!104617))))

(declare-fun lt!241782 () tuple2!13756)

(assert (=> b!155358 (= res!129952 (= (buf!3671 (_2!7294 lt!241782)) (buf!3671 (BitStream!5595 (buf!3671 bs2!18) (currentByte!6710 bs1!10) (currentBit!6705 bs1!10)))))))

(declare-fun lt!241785 () (_ BitVec 8))

(declare-fun lt!241781 () (_ BitVec 8))

(declare-fun Unit!9775 () Unit!9771)

(declare-fun Unit!9776 () Unit!9771)

(assert (=> b!155358 (= lt!241782 (tuple2!13757 (_2!7297 (ite (bvsgt ((_ sign_extend 24) lt!241785) #b00000000000000000000000000000000) (tuple2!13761 Unit!9775 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!241781) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3991 (buf!3671 (BitStream!5595 (buf!3671 bs2!18) (currentByte!6710 bs1!10) (currentBit!6705 bs1!10)))) (bvadd (currentByte!6710 (BitStream!5595 (buf!3671 bs2!18) (currentByte!6710 bs1!10) (currentBit!6705 bs1!10))) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!241785)))))))) (tuple2!13761 Unit!9776 lt!241781))) (BitStream!5595 (buf!3671 (BitStream!5595 (buf!3671 bs2!18) (currentByte!6710 bs1!10) (currentBit!6705 bs1!10))) (bvadd (currentByte!6710 (BitStream!5595 (buf!3671 bs2!18) (currentByte!6710 bs1!10) (currentBit!6705 bs1!10))) #b00000000000000000000000000000001) (currentBit!6705 (BitStream!5595 (buf!3671 bs2!18) (currentByte!6710 bs1!10) (currentBit!6705 bs1!10))))))))

(assert (=> b!155358 (= lt!241781 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3991 (buf!3671 (BitStream!5595 (buf!3671 bs2!18) (currentByte!6710 bs1!10) (currentBit!6705 bs1!10)))) (currentByte!6710 (BitStream!5595 (buf!3671 bs2!18) (currentByte!6710 bs1!10) (currentBit!6705 bs1!10))))) ((_ sign_extend 24) lt!241785))))))

(assert (=> b!155358 (= lt!241785 ((_ extract 7 0) (currentBit!6705 (BitStream!5595 (buf!3671 bs2!18) (currentByte!6710 bs1!10) (currentBit!6705 bs1!10)))))))

(declare-fun b!155359 () Bool)

(declare-fun lt!241780 () (_ BitVec 64))

(declare-fun lt!241779 () (_ BitVec 64))

(assert (=> b!155359 (= e!104617 (= (bitIndex!0 (size!3168 (buf!3671 (_2!7294 lt!241782))) (currentByte!6710 (_2!7294 lt!241782)) (currentBit!6705 (_2!7294 lt!241782))) (bvadd lt!241779 lt!241780)))))

(assert (=> b!155359 (or (not (= (bvand lt!241779 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!241780 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!241779 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!241779 lt!241780) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!155359 (= lt!241780 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!155359 (= lt!241779 (bitIndex!0 (size!3168 (buf!3671 (BitStream!5595 (buf!3671 bs2!18) (currentByte!6710 bs1!10) (currentBit!6705 bs1!10)))) (currentByte!6710 (BitStream!5595 (buf!3671 bs2!18) (currentByte!6710 bs1!10) (currentBit!6705 bs1!10))) (currentBit!6705 (BitStream!5595 (buf!3671 bs2!18) (currentByte!6710 bs1!10) (currentBit!6705 bs1!10)))))))

(assert (= (and d!51274 res!129953) b!155358))

(assert (= (and b!155358 res!129952) b!155359))

(declare-fun m!241355 () Bool)

(assert (=> d!51274 m!241355))

(declare-fun m!241357 () Bool)

(assert (=> d!51274 m!241357))

(declare-fun m!241359 () Bool)

(assert (=> d!51274 m!241359))

(assert (=> b!155358 m!241359))

(assert (=> b!155358 m!241355))

(declare-fun m!241361 () Bool)

(assert (=> b!155359 m!241361))

(declare-fun m!241363 () Bool)

(assert (=> b!155359 m!241363))

(assert (=> d!51240 d!51274))

(declare-fun d!51276 () Bool)

(assert (=> d!51276 (= (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!241622) (tuple4!227 ((_ extract 31 0) (bvadd (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv lt!241622 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv lt!241622 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!155335 d!51276))

(declare-fun d!51278 () Bool)

(assert (=> d!51278 (= (invariant!0 (currentBit!6705 bs2!18) (currentByte!6710 bs2!18) (size!3168 (buf!3671 bs2!18))) (and (bvsge (currentBit!6705 bs2!18) #b00000000000000000000000000000000) (bvslt (currentBit!6705 bs2!18) #b00000000000000000000000000001000) (bvsge (currentByte!6710 bs2!18) #b00000000000000000000000000000000) (or (bvslt (currentByte!6710 bs2!18) (size!3168 (buf!3671 bs2!18))) (and (= (currentBit!6705 bs2!18) #b00000000000000000000000000000000) (= (currentByte!6710 bs2!18) (size!3168 (buf!3671 bs2!18)))))))))

(assert (=> d!51238 d!51278))

(declare-fun d!51280 () Bool)

(declare-fun res!129954 () Bool)

(declare-fun e!104619 () Bool)

(assert (=> d!51280 (=> res!129954 e!104619)))

(assert (=> d!51280 (= res!129954 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!241625))))

(assert (=> d!51280 (= (arrayRangesEq!406 (buf!3671 bs1!10) (buf!3671 bs2!18) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!241625) e!104619)))

(declare-fun b!155360 () Bool)

(declare-fun e!104620 () Bool)

(assert (=> b!155360 (= e!104619 e!104620)))

(declare-fun res!129955 () Bool)

(assert (=> b!155360 (=> (not res!129955) (not e!104620))))

(assert (=> b!155360 (= res!129955 (= (select (arr!3991 (buf!3671 bs1!10)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!3991 (buf!3671 bs2!18)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!155361 () Bool)

(assert (=> b!155361 (= e!104620 (arrayRangesEq!406 (buf!3671 bs1!10) (buf!3671 bs2!18) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!241625))))

(assert (= (and d!51280 (not res!129954)) b!155360))

(assert (= (and b!155360 res!129955) b!155361))

(declare-fun m!241365 () Bool)

(assert (=> b!155360 m!241365))

(declare-fun m!241367 () Bool)

(assert (=> b!155360 m!241367))

(declare-fun m!241369 () Bool)

(assert (=> b!155361 m!241369))

(assert (=> b!155312 d!51280))

(declare-fun d!51282 () Bool)

(assert (=> d!51282 (= (byteRangesEq!0 (select (arr!3991 (buf!3671 bs1!10)) (_3!416 lt!241735)) (select (arr!3991 (buf!3671 bs2!18)) (_3!416 lt!241735)) lt!241736 (ite c!8265 lt!241734 #b00000000000000000000000000001000)) (or (= lt!241736 (ite c!8265 lt!241734 #b00000000000000000000000000001000)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!3991 (buf!3671 bs1!10)) (_3!416 lt!241735))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!8265 lt!241734 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!241736)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!3991 (buf!3671 bs2!18)) (_3!416 lt!241735))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!8265 lt!241734 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!241736)))) #b00000000000000000000000011111111))))))

(declare-fun bs!12546 () Bool)

(assert (= bs!12546 d!51282))

(declare-fun m!241371 () Bool)

(assert (=> bs!12546 m!241371))

(declare-fun m!241373 () Bool)

(assert (=> bs!12546 m!241373))

(assert (=> bm!2246 d!51282))

(declare-fun d!51284 () Bool)

(assert (=> d!51284 (= (invariant!0 (currentBit!6705 bs1!10) (currentByte!6710 bs1!10) (size!3168 (buf!3671 bs1!10))) (and (bvsge (currentBit!6705 bs1!10) #b00000000000000000000000000000000) (bvslt (currentBit!6705 bs1!10) #b00000000000000000000000000001000) (bvsge (currentByte!6710 bs1!10) #b00000000000000000000000000000000) (or (bvslt (currentByte!6710 bs1!10) (size!3168 (buf!3671 bs1!10))) (and (= (currentBit!6705 bs1!10) #b00000000000000000000000000000000) (= (currentByte!6710 bs1!10) (size!3168 (buf!3671 bs1!10)))))))))

(assert (=> d!51236 d!51284))

(declare-fun d!51286 () Bool)

(assert (=> d!51286 (= (byteRangesEq!0 (select (arr!3991 (buf!3671 bs1!10)) (_4!113 lt!241735)) (select (arr!3991 (buf!3671 bs2!18)) (_4!113 lt!241735)) #b00000000000000000000000000000000 lt!241734) (or (= #b00000000000000000000000000000000 lt!241734) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!3991 (buf!3671 bs1!10)) (_4!113 lt!241735))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!241734))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!3991 (buf!3671 bs2!18)) (_4!113 lt!241735))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!241734))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!12547 () Bool)

(assert (= bs!12547 d!51286))

(declare-fun m!241375 () Bool)

(assert (=> bs!12547 m!241375))

(declare-fun m!241377 () Bool)

(assert (=> bs!12547 m!241377))

(assert (=> b!155336 d!51286))

(declare-fun d!51288 () Bool)

(assert (=> d!51288 (= (remainingBits!0 ((_ sign_extend 32) (size!3168 (buf!3671 bs1!10))) ((_ sign_extend 32) (currentByte!6710 bs1!10)) ((_ sign_extend 32) (currentBit!6705 bs1!10))) (bvsub (bvmul ((_ sign_extend 32) (size!3168 (buf!3671 bs1!10))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6710 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6705 bs1!10)))))))

(assert (=> d!51248 d!51288))

(assert (=> d!51248 d!51284))

(declare-fun d!51290 () Bool)

(declare-fun res!129956 () Bool)

(declare-fun e!104621 () Bool)

(assert (=> d!51290 (=> res!129956 e!104621)))

(assert (=> d!51290 (= res!129956 (= (_1!7295 lt!241735) (_2!7295 lt!241735)))))

(assert (=> d!51290 (= (arrayRangesEq!406 (buf!3671 bs1!10) (buf!3671 bs2!18) (_1!7295 lt!241735) (_2!7295 lt!241735)) e!104621)))

(declare-fun b!155362 () Bool)

(declare-fun e!104622 () Bool)

(assert (=> b!155362 (= e!104621 e!104622)))

(declare-fun res!129957 () Bool)

(assert (=> b!155362 (=> (not res!129957) (not e!104622))))

(assert (=> b!155362 (= res!129957 (= (select (arr!3991 (buf!3671 bs1!10)) (_1!7295 lt!241735)) (select (arr!3991 (buf!3671 bs2!18)) (_1!7295 lt!241735))))))

(declare-fun b!155363 () Bool)

(assert (=> b!155363 (= e!104622 (arrayRangesEq!406 (buf!3671 bs1!10) (buf!3671 bs2!18) (bvadd (_1!7295 lt!241735) #b00000000000000000000000000000001) (_2!7295 lt!241735)))))

(assert (= (and d!51290 (not res!129956)) b!155362))

(assert (= (and b!155362 res!129957) b!155363))

(declare-fun m!241379 () Bool)

(assert (=> b!155362 m!241379))

(declare-fun m!241381 () Bool)

(assert (=> b!155362 m!241381))

(declare-fun m!241383 () Bool)

(assert (=> b!155363 m!241383))

(assert (=> b!155340 d!51290))

(declare-fun d!51292 () Bool)

(declare-fun lt!241791 () (_ BitVec 8))

(declare-fun lt!241790 () (_ BitVec 8))

(assert (=> d!51292 (= lt!241791 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3991 (buf!3671 bs1!10)) (currentByte!6710 bs1!10))) ((_ sign_extend 24) lt!241790))))))

(assert (=> d!51292 (= lt!241790 ((_ extract 7 0) (currentBit!6705 bs1!10)))))

(declare-fun e!104624 () Bool)

(assert (=> d!51292 e!104624))

(declare-fun res!129959 () Bool)

(assert (=> d!51292 (=> (not res!129959) (not e!104624))))

(assert (=> d!51292 (= res!129959 (validate_offset_bits!1 ((_ sign_extend 32) (size!3168 (buf!3671 bs1!10))) ((_ sign_extend 32) (currentByte!6710 bs1!10)) ((_ sign_extend 32) (currentBit!6705 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun Unit!9777 () Unit!9771)

(declare-fun Unit!9778 () Unit!9771)

(assert (=> d!51292 (= (readByte!0 bs1!10) (tuple2!13757 (_2!7297 (ite (bvsgt ((_ sign_extend 24) lt!241790) #b00000000000000000000000000000000) (tuple2!13761 Unit!9777 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!241791) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3991 (buf!3671 bs1!10)) (bvadd (currentByte!6710 bs1!10) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!241790)))))))) (tuple2!13761 Unit!9778 lt!241791))) (BitStream!5595 (buf!3671 bs1!10) (bvadd (currentByte!6710 bs1!10) #b00000000000000000000000000000001) (currentBit!6705 bs1!10))))))

(declare-fun b!155364 () Bool)

(declare-fun e!104623 () Bool)

(assert (=> b!155364 (= e!104624 e!104623)))

(declare-fun res!129958 () Bool)

(assert (=> b!155364 (=> (not res!129958) (not e!104623))))

(declare-fun lt!241789 () tuple2!13756)

(assert (=> b!155364 (= res!129958 (= (buf!3671 (_2!7294 lt!241789)) (buf!3671 bs1!10)))))

(declare-fun lt!241792 () (_ BitVec 8))

(declare-fun lt!241788 () (_ BitVec 8))

(declare-fun Unit!9779 () Unit!9771)

(declare-fun Unit!9780 () Unit!9771)

(assert (=> b!155364 (= lt!241789 (tuple2!13757 (_2!7297 (ite (bvsgt ((_ sign_extend 24) lt!241792) #b00000000000000000000000000000000) (tuple2!13761 Unit!9779 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!241788) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3991 (buf!3671 bs1!10)) (bvadd (currentByte!6710 bs1!10) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!241792)))))))) (tuple2!13761 Unit!9780 lt!241788))) (BitStream!5595 (buf!3671 bs1!10) (bvadd (currentByte!6710 bs1!10) #b00000000000000000000000000000001) (currentBit!6705 bs1!10))))))

(assert (=> b!155364 (= lt!241788 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3991 (buf!3671 bs1!10)) (currentByte!6710 bs1!10))) ((_ sign_extend 24) lt!241792))))))

(assert (=> b!155364 (= lt!241792 ((_ extract 7 0) (currentBit!6705 bs1!10)))))

(declare-fun b!155365 () Bool)

(declare-fun lt!241787 () (_ BitVec 64))

(declare-fun lt!241786 () (_ BitVec 64))

(assert (=> b!155365 (= e!104623 (= (bitIndex!0 (size!3168 (buf!3671 (_2!7294 lt!241789))) (currentByte!6710 (_2!7294 lt!241789)) (currentBit!6705 (_2!7294 lt!241789))) (bvadd lt!241786 lt!241787)))))

(assert (=> b!155365 (or (not (= (bvand lt!241786 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!241787 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!241786 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!241786 lt!241787) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!155365 (= lt!241787 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!155365 (= lt!241786 (bitIndex!0 (size!3168 (buf!3671 bs1!10)) (currentByte!6710 bs1!10) (currentBit!6705 bs1!10)))))

(assert (= (and d!51292 res!129959) b!155364))

(assert (= (and b!155364 res!129958) b!155365))

(declare-fun m!241385 () Bool)

(assert (=> d!51292 m!241385))

(declare-fun m!241387 () Bool)

(assert (=> d!51292 m!241387))

(declare-fun m!241389 () Bool)

(assert (=> d!51292 m!241389))

(assert (=> b!155364 m!241389))

(assert (=> b!155364 m!241385))

(declare-fun m!241391 () Bool)

(assert (=> b!155365 m!241391))

(assert (=> b!155365 m!241213))

(assert (=> d!51242 d!51292))

(declare-fun d!51294 () Bool)

(assert (=> d!51294 (= (remainingBits!0 ((_ sign_extend 32) (size!3168 (buf!3671 bs2!18))) ((_ sign_extend 32) (currentByte!6710 bs2!18)) ((_ sign_extend 32) (currentBit!6705 bs2!18))) (bvsub (bvmul ((_ sign_extend 32) (size!3168 (buf!3671 bs2!18))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6710 bs2!18)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6705 bs2!18)))))))

(assert (=> d!51246 d!51294))

(assert (=> d!51246 d!51278))

(push 1)

(assert (not b!155361))

(assert (not b!155365))

(assert (not b!155363))

(assert (not d!51292))

(assert (not d!51274))

(assert (not b!155359))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

