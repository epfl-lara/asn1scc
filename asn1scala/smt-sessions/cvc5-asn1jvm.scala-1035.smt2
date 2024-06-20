; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29728 () Bool)

(assert start!29728)

(declare-fun b!153096 () Bool)

(declare-fun res!128273 () Bool)

(declare-fun e!102554 () Bool)

(assert (=> b!153096 (=> (not res!128273) (not e!102554))))

(declare-fun lt!239524 () (_ BitVec 64))

(declare-datatypes ((array!6872 0))(
  ( (array!6873 (arr!3923 (Array (_ BitVec 32) (_ BitVec 8))) (size!3100 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5458 0))(
  ( (BitStream!5459 (buf!3603 array!6872) (currentByte!6589 (_ BitVec 32)) (currentBit!6584 (_ BitVec 32))) )
))
(declare-fun bs2!18 () BitStream!5458)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!153096 (= res!128273 (bvsle lt!239524 (bitIndex!0 (size!3100 (buf!3603 bs2!18)) (currentByte!6589 bs2!18) (currentBit!6584 bs2!18))))))

(declare-fun b!153097 () Bool)

(declare-fun e!102555 () Bool)

(declare-fun array_inv!2889 (array!6872) Bool)

(assert (=> b!153097 (= e!102555 (array_inv!2889 (buf!3603 bs2!18)))))

(declare-fun b!153098 () Bool)

(declare-fun res!128272 () Bool)

(assert (=> b!153098 (=> (not res!128272) (not e!102554))))

(declare-fun bs1!10 () BitStream!5458)

(declare-fun arrayBitRangesEq!0 (array!6872 array!6872 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!153098 (= res!128272 (arrayBitRangesEq!0 (buf!3603 bs1!10) (buf!3603 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!239524))))

(declare-fun b!153099 () Bool)

(declare-fun e!102553 () Bool)

(assert (=> b!153099 (= e!102553 e!102554)))

(declare-fun res!128274 () Bool)

(assert (=> b!153099 (=> (not res!128274) (not e!102554))))

(assert (=> b!153099 (= res!128274 (bvsle lt!239524 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3100 (buf!3603 bs1!10))))))))

(assert (=> b!153099 (= lt!239524 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3100 (buf!3603 bs1!10)) (currentByte!6589 bs1!10) (currentBit!6584 bs1!10))))))

(declare-fun b!153101 () Bool)

(declare-fun e!102552 () Bool)

(assert (=> b!153101 (= e!102552 (array_inv!2889 (buf!3603 bs1!10)))))

(declare-fun res!128271 () Bool)

(assert (=> start!29728 (=> (not res!128271) (not e!102553))))

(assert (=> start!29728 (= res!128271 (= (size!3100 (buf!3603 bs1!10)) (size!3100 (buf!3603 bs2!18))))))

(assert (=> start!29728 e!102553))

(declare-fun inv!12 (BitStream!5458) Bool)

(assert (=> start!29728 (and (inv!12 bs1!10) e!102552)))

(assert (=> start!29728 (and (inv!12 bs2!18) e!102555)))

(declare-fun b!153100 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!153100 (= e!102554 (not (invariant!0 (currentBit!6584 bs1!10) (currentByte!6589 bs1!10) (size!3100 (buf!3603 bs1!10)))))))

(declare-datatypes ((tuple2!13582 0))(
  ( (tuple2!13583 (_1!7178 BitStream!5458) (_2!7178 (_ BitVec 8))) )
))
(declare-fun lt!239522 () tuple2!13582)

(declare-fun readBytePure!0 (BitStream!5458) tuple2!13582)

(assert (=> b!153100 (= lt!239522 (readBytePure!0 (BitStream!5459 (buf!3603 bs2!18) (currentByte!6589 bs1!10) (currentBit!6584 bs1!10))))))

(declare-fun lt!239523 () tuple2!13582)

(assert (=> b!153100 (= lt!239523 (readBytePure!0 bs1!10))))

(assert (= (and start!29728 res!128271) b!153099))

(assert (= (and b!153099 res!128274) b!153096))

(assert (= (and b!153096 res!128273) b!153098))

(assert (= (and b!153098 res!128272) b!153100))

(assert (= start!29728 b!153101))

(assert (= start!29728 b!153097))

(declare-fun m!238903 () Bool)

(assert (=> b!153100 m!238903))

(declare-fun m!238905 () Bool)

(assert (=> b!153100 m!238905))

(declare-fun m!238907 () Bool)

(assert (=> b!153100 m!238907))

(declare-fun m!238909 () Bool)

(assert (=> b!153101 m!238909))

(declare-fun m!238911 () Bool)

(assert (=> b!153096 m!238911))

(declare-fun m!238913 () Bool)

(assert (=> start!29728 m!238913))

(declare-fun m!238915 () Bool)

(assert (=> start!29728 m!238915))

(declare-fun m!238917 () Bool)

(assert (=> b!153099 m!238917))

(declare-fun m!238919 () Bool)

(assert (=> b!153097 m!238919))

(declare-fun m!238921 () Bool)

(assert (=> b!153098 m!238921))

(push 1)

(assert (not b!153099))

(assert (not start!29728))

(assert (not b!153096))

(assert (not b!153100))

(assert (not b!153098))

(assert (not b!153097))

(assert (not b!153101))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!50378 () Bool)

(declare-fun e!102598 () Bool)

(assert (=> d!50378 e!102598))

(declare-fun res!128312 () Bool)

(assert (=> d!50378 (=> (not res!128312) (not e!102598))))

(declare-fun lt!239586 () (_ BitVec 64))

(declare-fun lt!239585 () (_ BitVec 64))

(declare-fun lt!239583 () (_ BitVec 64))

(assert (=> d!50378 (= res!128312 (= lt!239586 (bvsub lt!239585 lt!239583)))))

(assert (=> d!50378 (or (= (bvand lt!239585 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!239583 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!239585 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!239585 lt!239583) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!50378 (= lt!239583 (remainingBits!0 ((_ sign_extend 32) (size!3100 (buf!3603 bs2!18))) ((_ sign_extend 32) (currentByte!6589 bs2!18)) ((_ sign_extend 32) (currentBit!6584 bs2!18))))))

(declare-fun lt!239587 () (_ BitVec 64))

(declare-fun lt!239584 () (_ BitVec 64))

(assert (=> d!50378 (= lt!239585 (bvmul lt!239587 lt!239584))))

(assert (=> d!50378 (or (= lt!239587 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!239584 (bvsdiv (bvmul lt!239587 lt!239584) lt!239587)))))

(assert (=> d!50378 (= lt!239584 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!50378 (= lt!239587 ((_ sign_extend 32) (size!3100 (buf!3603 bs2!18))))))

(assert (=> d!50378 (= lt!239586 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6589 bs2!18)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6584 bs2!18))))))

(assert (=> d!50378 (invariant!0 (currentBit!6584 bs2!18) (currentByte!6589 bs2!18) (size!3100 (buf!3603 bs2!18)))))

(assert (=> d!50378 (= (bitIndex!0 (size!3100 (buf!3603 bs2!18)) (currentByte!6589 bs2!18) (currentBit!6584 bs2!18)) lt!239586)))

(declare-fun b!153150 () Bool)

(declare-fun res!128311 () Bool)

(assert (=> b!153150 (=> (not res!128311) (not e!102598))))

(assert (=> b!153150 (= res!128311 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!239586))))

(declare-fun b!153151 () Bool)

(declare-fun lt!239588 () (_ BitVec 64))

(assert (=> b!153151 (= e!102598 (bvsle lt!239586 (bvmul lt!239588 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!153151 (or (= lt!239588 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!239588 #b0000000000000000000000000000000000000000000000000000000000001000) lt!239588)))))

(assert (=> b!153151 (= lt!239588 ((_ sign_extend 32) (size!3100 (buf!3603 bs2!18))))))

(assert (= (and d!50378 res!128312) b!153150))

(assert (= (and b!153150 res!128311) b!153151))

(declare-fun m!238975 () Bool)

(assert (=> d!50378 m!238975))

(declare-fun m!238977 () Bool)

(assert (=> d!50378 m!238977))

(assert (=> b!153096 d!50378))

(declare-fun d!50392 () Bool)

(assert (=> d!50392 (= (array_inv!2889 (buf!3603 bs1!10)) (bvsge (size!3100 (buf!3603 bs1!10)) #b00000000000000000000000000000000))))

(assert (=> b!153101 d!50392))

(declare-fun d!50394 () Bool)

(assert (=> d!50394 (= (invariant!0 (currentBit!6584 bs1!10) (currentByte!6589 bs1!10) (size!3100 (buf!3603 bs1!10))) (and (bvsge (currentBit!6584 bs1!10) #b00000000000000000000000000000000) (bvslt (currentBit!6584 bs1!10) #b00000000000000000000000000001000) (bvsge (currentByte!6589 bs1!10) #b00000000000000000000000000000000) (or (bvslt (currentByte!6589 bs1!10) (size!3100 (buf!3603 bs1!10))) (and (= (currentBit!6584 bs1!10) #b00000000000000000000000000000000) (= (currentByte!6589 bs1!10) (size!3100 (buf!3603 bs1!10)))))))))

(assert (=> b!153100 d!50394))

(declare-fun d!50396 () Bool)

(declare-datatypes ((tuple2!13590 0))(
  ( (tuple2!13591 (_1!7182 (_ BitVec 8)) (_2!7182 BitStream!5458)) )
))
(declare-fun lt!239601 () tuple2!13590)

(declare-fun readByte!0 (BitStream!5458) tuple2!13590)

(assert (=> d!50396 (= lt!239601 (readByte!0 (BitStream!5459 (buf!3603 bs2!18) (currentByte!6589 bs1!10) (currentBit!6584 bs1!10))))))

(assert (=> d!50396 (= (readBytePure!0 (BitStream!5459 (buf!3603 bs2!18) (currentByte!6589 bs1!10) (currentBit!6584 bs1!10))) (tuple2!13583 (_2!7182 lt!239601) (_1!7182 lt!239601)))))

(declare-fun bs!12323 () Bool)

(assert (= bs!12323 d!50396))

(declare-fun m!238979 () Bool)

(assert (=> bs!12323 m!238979))

(assert (=> b!153100 d!50396))

(declare-fun d!50398 () Bool)

(declare-fun lt!239604 () tuple2!13590)

(assert (=> d!50398 (= lt!239604 (readByte!0 bs1!10))))

(assert (=> d!50398 (= (readBytePure!0 bs1!10) (tuple2!13583 (_2!7182 lt!239604) (_1!7182 lt!239604)))))

(declare-fun bs!12324 () Bool)

(assert (= bs!12324 d!50398))

(declare-fun m!238981 () Bool)

(assert (=> bs!12324 m!238981))

(assert (=> b!153100 d!50398))

(declare-fun d!50400 () Bool)

(declare-fun e!102601 () Bool)

(assert (=> d!50400 e!102601))

(declare-fun res!128318 () Bool)

(assert (=> d!50400 (=> (not res!128318) (not e!102601))))

(declare-fun lt!239608 () (_ BitVec 64))

(declare-fun lt!239607 () (_ BitVec 64))

(declare-fun lt!239605 () (_ BitVec 64))

(assert (=> d!50400 (= res!128318 (= lt!239608 (bvsub lt!239607 lt!239605)))))

(assert (=> d!50400 (or (= (bvand lt!239607 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!239605 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!239607 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!239607 lt!239605) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!50400 (= lt!239605 (remainingBits!0 ((_ sign_extend 32) (size!3100 (buf!3603 bs1!10))) ((_ sign_extend 32) (currentByte!6589 bs1!10)) ((_ sign_extend 32) (currentBit!6584 bs1!10))))))

(declare-fun lt!239609 () (_ BitVec 64))

(declare-fun lt!239606 () (_ BitVec 64))

(assert (=> d!50400 (= lt!239607 (bvmul lt!239609 lt!239606))))

(assert (=> d!50400 (or (= lt!239609 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!239606 (bvsdiv (bvmul lt!239609 lt!239606) lt!239609)))))

(assert (=> d!50400 (= lt!239606 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!50400 (= lt!239609 ((_ sign_extend 32) (size!3100 (buf!3603 bs1!10))))))

(assert (=> d!50400 (= lt!239608 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6589 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6584 bs1!10))))))

(assert (=> d!50400 (invariant!0 (currentBit!6584 bs1!10) (currentByte!6589 bs1!10) (size!3100 (buf!3603 bs1!10)))))

(assert (=> d!50400 (= (bitIndex!0 (size!3100 (buf!3603 bs1!10)) (currentByte!6589 bs1!10) (currentBit!6584 bs1!10)) lt!239608)))

(declare-fun b!153156 () Bool)

(declare-fun res!128317 () Bool)

(assert (=> b!153156 (=> (not res!128317) (not e!102601))))

(assert (=> b!153156 (= res!128317 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!239608))))

(declare-fun b!153157 () Bool)

(declare-fun lt!239610 () (_ BitVec 64))

(assert (=> b!153157 (= e!102601 (bvsle lt!239608 (bvmul lt!239610 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!153157 (or (= lt!239610 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!239610 #b0000000000000000000000000000000000000000000000000000000000001000) lt!239610)))))

(assert (=> b!153157 (= lt!239610 ((_ sign_extend 32) (size!3100 (buf!3603 bs1!10))))))

(assert (= (and d!50400 res!128318) b!153156))

(assert (= (and b!153156 res!128317) b!153157))

(declare-fun m!238983 () Bool)

(assert (=> d!50400 m!238983))

(assert (=> d!50400 m!238903))

(assert (=> b!153099 d!50400))

(declare-fun d!50402 () Bool)

(assert (=> d!50402 (= (inv!12 bs1!10) (invariant!0 (currentBit!6584 bs1!10) (currentByte!6589 bs1!10) (size!3100 (buf!3603 bs1!10))))))

(declare-fun bs!12325 () Bool)

(assert (= bs!12325 d!50402))

(assert (=> bs!12325 m!238903))

(assert (=> start!29728 d!50402))

(declare-fun d!50404 () Bool)

(assert (=> d!50404 (= (inv!12 bs2!18) (invariant!0 (currentBit!6584 bs2!18) (currentByte!6589 bs2!18) (size!3100 (buf!3603 bs2!18))))))

(declare-fun bs!12326 () Bool)

(assert (= bs!12326 d!50404))

(assert (=> bs!12326 m!238977))

(assert (=> start!29728 d!50404))

(declare-fun d!50406 () Bool)

(assert (=> d!50406 (= (array_inv!2889 (buf!3603 bs2!18)) (bvsge (size!3100 (buf!3603 bs2!18)) #b00000000000000000000000000000000))))

(assert (=> b!153097 d!50406))

(declare-fun c!8181 () Bool)

(declare-fun bm!2162 () Bool)

(declare-fun lt!239644 () (_ BitVec 32))

(declare-fun call!2165 () Bool)

(declare-fun lt!239642 () (_ BitVec 32))

(declare-datatypes ((tuple4!170 0))(
  ( (tuple4!171 (_1!7184 (_ BitVec 32)) (_2!7184 (_ BitVec 32)) (_3!388 (_ BitVec 32)) (_4!85 (_ BitVec 32))) )
))
(declare-fun lt!239643 () tuple4!170)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!2162 (= call!2165 (byteRangesEq!0 (select (arr!3923 (buf!3603 bs1!10)) (_3!388 lt!239643)) (select (arr!3923 (buf!3603 bs2!18)) (_3!388 lt!239643)) lt!239644 (ite c!8181 lt!239642 #b00000000000000000000000000001000)))))

(declare-fun b!153197 () Bool)

(declare-fun e!102636 () Bool)

(declare-fun e!102635 () Bool)

(assert (=> b!153197 (= e!102636 e!102635)))

(declare-fun res!128352 () Bool)

(assert (=> b!153197 (= res!128352 call!2165)))

(assert (=> b!153197 (=> (not res!128352) (not e!102635))))

(declare-fun d!50408 () Bool)

(declare-fun res!128350 () Bool)

(declare-fun e!102638 () Bool)

(assert (=> d!50408 (=> res!128350 e!102638)))

(assert (=> d!50408 (= res!128350 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!239524))))

(assert (=> d!50408 (= (arrayBitRangesEq!0 (buf!3603 bs1!10) (buf!3603 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!239524) e!102638)))

(declare-fun b!153198 () Bool)

(declare-fun e!102634 () Bool)

(assert (=> b!153198 (= e!102634 e!102636)))

(assert (=> b!153198 (= c!8181 (= (_3!388 lt!239643) (_4!85 lt!239643)))))

(declare-fun b!153199 () Bool)

(declare-fun e!102637 () Bool)

(declare-fun arrayRangesEq!378 (array!6872 array!6872 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!153199 (= e!102637 (arrayRangesEq!378 (buf!3603 bs1!10) (buf!3603 bs2!18) (_1!7184 lt!239643) (_2!7184 lt!239643)))))

(declare-fun b!153200 () Bool)

(assert (=> b!153200 (= e!102636 call!2165)))

(declare-fun b!153201 () Bool)

(assert (=> b!153201 (= e!102638 e!102634)))

(declare-fun res!128348 () Bool)

(assert (=> b!153201 (=> (not res!128348) (not e!102634))))

(assert (=> b!153201 (= res!128348 e!102637)))

(declare-fun res!128351 () Bool)

(assert (=> b!153201 (=> res!128351 e!102637)))

(assert (=> b!153201 (= res!128351 (bvsge (_1!7184 lt!239643) (_2!7184 lt!239643)))))

(assert (=> b!153201 (= lt!239642 ((_ extract 31 0) (bvsrem lt!239524 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!153201 (= lt!239644 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!170)

(assert (=> b!153201 (= lt!239643 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!239524))))

(declare-fun b!153202 () Bool)

(declare-fun res!128349 () Bool)

(assert (=> b!153202 (= res!128349 (= lt!239642 #b00000000000000000000000000000000))))

(declare-fun e!102639 () Bool)

(assert (=> b!153202 (=> res!128349 e!102639)))

(assert (=> b!153202 (= e!102635 e!102639)))

(declare-fun b!153203 () Bool)

(assert (=> b!153203 (= e!102639 (byteRangesEq!0 (select (arr!3923 (buf!3603 bs1!10)) (_4!85 lt!239643)) (select (arr!3923 (buf!3603 bs2!18)) (_4!85 lt!239643)) #b00000000000000000000000000000000 lt!239642))))

(assert (= (and d!50408 (not res!128350)) b!153201))

(assert (= (and b!153201 (not res!128351)) b!153199))

(assert (= (and b!153201 res!128348) b!153198))

(assert (= (and b!153198 c!8181) b!153200))

(assert (= (and b!153198 (not c!8181)) b!153197))

(assert (= (and b!153197 res!128352) b!153202))

(assert (= (and b!153202 (not res!128349)) b!153203))

(assert (= (or b!153200 b!153197) bm!2162))

(declare-fun m!239009 () Bool)

(assert (=> bm!2162 m!239009))

(declare-fun m!239011 () Bool)

(assert (=> bm!2162 m!239011))

(assert (=> bm!2162 m!239009))

(assert (=> bm!2162 m!239011))

(declare-fun m!239013 () Bool)

(assert (=> bm!2162 m!239013))

(declare-fun m!239015 () Bool)

(assert (=> b!153199 m!239015))

(declare-fun m!239017 () Bool)

(assert (=> b!153201 m!239017))

(declare-fun m!239019 () Bool)

(assert (=> b!153203 m!239019))

(declare-fun m!239021 () Bool)

(assert (=> b!153203 m!239021))

(assert (=> b!153203 m!239019))

(assert (=> b!153203 m!239021))

(declare-fun m!239023 () Bool)

(assert (=> b!153203 m!239023))

(assert (=> b!153098 d!50408))

(push 1)

(assert (not d!50398))

(assert (not d!50402))

(assert (not b!153199))

(assert (not bm!2162))

(assert (not b!153201))

(assert (not b!153203))

(assert (not d!50378))

(assert (not d!50400))

(assert (not d!50404))

(assert (not d!50396))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

