; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29654 () Bool)

(assert start!29654)

(declare-fun b!152850 () Bool)

(declare-fun res!128088 () Bool)

(declare-fun e!102347 () Bool)

(assert (=> b!152850 (=> (not res!128088) (not e!102347))))

(declare-fun lt!239290 () (_ BitVec 64))

(declare-datatypes ((array!6858 0))(
  ( (array!6859 (arr!3919 (Array (_ BitVec 32) (_ BitVec 8))) (size!3096 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5450 0))(
  ( (BitStream!5451 (buf!3599 array!6858) (currentByte!6573 (_ BitVec 32)) (currentBit!6568 (_ BitVec 32))) )
))
(declare-fun bs2!18 () BitStream!5450)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!152850 (= res!128088 (bvsle lt!239290 (bitIndex!0 (size!3096 (buf!3599 bs2!18)) (currentByte!6573 bs2!18) (currentBit!6568 bs2!18))))))

(declare-fun b!152851 () Bool)

(declare-fun bs1!10 () BitStream!5450)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!152851 (= e!102347 (not (validate_offset_byte!0 ((_ sign_extend 32) (size!3096 (buf!3599 bs1!10))) ((_ sign_extend 32) (currentByte!6573 bs1!10)) ((_ sign_extend 32) (currentBit!6568 bs1!10)))))))

(declare-fun b!152852 () Bool)

(declare-fun e!102348 () Bool)

(assert (=> b!152852 (= e!102348 e!102347)))

(declare-fun res!128086 () Bool)

(assert (=> b!152852 (=> (not res!128086) (not e!102347))))

(assert (=> b!152852 (= res!128086 (bvsle lt!239290 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3096 (buf!3599 bs1!10))))))))

(assert (=> b!152852 (= lt!239290 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3096 (buf!3599 bs1!10)) (currentByte!6573 bs1!10) (currentBit!6568 bs1!10))))))

(declare-fun res!128085 () Bool)

(assert (=> start!29654 (=> (not res!128085) (not e!102348))))

(assert (=> start!29654 (= res!128085 (= (size!3096 (buf!3599 bs1!10)) (size!3096 (buf!3599 bs2!18))))))

(assert (=> start!29654 e!102348))

(declare-fun e!102350 () Bool)

(declare-fun inv!12 (BitStream!5450) Bool)

(assert (=> start!29654 (and (inv!12 bs1!10) e!102350)))

(declare-fun e!102346 () Bool)

(assert (=> start!29654 (and (inv!12 bs2!18) e!102346)))

(declare-fun b!152853 () Bool)

(declare-fun array_inv!2885 (array!6858) Bool)

(assert (=> b!152853 (= e!102350 (array_inv!2885 (buf!3599 bs1!10)))))

(declare-fun b!152854 () Bool)

(declare-fun res!128087 () Bool)

(assert (=> b!152854 (=> (not res!128087) (not e!102347))))

(declare-fun arrayBitRangesEq!0 (array!6858 array!6858 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!152854 (= res!128087 (arrayBitRangesEq!0 (buf!3599 bs1!10) (buf!3599 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!239290))))

(declare-fun b!152855 () Bool)

(assert (=> b!152855 (= e!102346 (array_inv!2885 (buf!3599 bs2!18)))))

(assert (= (and start!29654 res!128085) b!152852))

(assert (= (and b!152852 res!128086) b!152850))

(assert (= (and b!152850 res!128088) b!152854))

(assert (= (and b!152854 res!128087) b!152851))

(assert (= start!29654 b!152853))

(assert (= start!29654 b!152855))

(declare-fun m!238677 () Bool)

(assert (=> b!152851 m!238677))

(declare-fun m!238679 () Bool)

(assert (=> b!152852 m!238679))

(declare-fun m!238681 () Bool)

(assert (=> b!152853 m!238681))

(declare-fun m!238683 () Bool)

(assert (=> b!152855 m!238683))

(declare-fun m!238685 () Bool)

(assert (=> b!152854 m!238685))

(declare-fun m!238687 () Bool)

(assert (=> b!152850 m!238687))

(declare-fun m!238689 () Bool)

(assert (=> start!29654 m!238689))

(declare-fun m!238691 () Bool)

(assert (=> start!29654 m!238691))

(push 1)

(assert (not b!152855))

(assert (not b!152853))

(assert (not b!152851))

(assert (not b!152850))

(assert (not start!29654))

(assert (not b!152852))

(assert (not b!152854))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!50272 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!50272 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3096 (buf!3599 bs1!10))) ((_ sign_extend 32) (currentByte!6573 bs1!10)) ((_ sign_extend 32) (currentBit!6568 bs1!10))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3096 (buf!3599 bs1!10))) ((_ sign_extend 32) (currentByte!6573 bs1!10)) ((_ sign_extend 32) (currentBit!6568 bs1!10))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!12290 () Bool)

(assert (= bs!12290 d!50272))

(declare-fun m!238697 () Bool)

(assert (=> bs!12290 m!238697))

(assert (=> b!152851 d!50272))

(declare-fun d!50274 () Bool)

(declare-fun e!102387 () Bool)

(assert (=> d!50274 e!102387))

(declare-fun res!128125 () Bool)

(assert (=> d!50274 (=> (not res!128125) (not e!102387))))

(declare-fun lt!239340 () (_ BitVec 64))

(declare-fun lt!239339 () (_ BitVec 64))

(declare-fun lt!239336 () (_ BitVec 64))

(assert (=> d!50274 (= res!128125 (= lt!239339 (bvsub lt!239336 lt!239340)))))

(assert (=> d!50274 (or (= (bvand lt!239336 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!239340 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!239336 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!239336 lt!239340) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!50274 (= lt!239340 (remainingBits!0 ((_ sign_extend 32) (size!3096 (buf!3599 bs2!18))) ((_ sign_extend 32) (currentByte!6573 bs2!18)) ((_ sign_extend 32) (currentBit!6568 bs2!18))))))

(declare-fun lt!239338 () (_ BitVec 64))

(declare-fun lt!239341 () (_ BitVec 64))

(assert (=> d!50274 (= lt!239336 (bvmul lt!239338 lt!239341))))

(assert (=> d!50274 (or (= lt!239338 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!239341 (bvsdiv (bvmul lt!239338 lt!239341) lt!239338)))))

(assert (=> d!50274 (= lt!239341 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!50274 (= lt!239338 ((_ sign_extend 32) (size!3096 (buf!3599 bs2!18))))))

(assert (=> d!50274 (= lt!239339 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6573 bs2!18)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6568 bs2!18))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!50274 (invariant!0 (currentBit!6568 bs2!18) (currentByte!6573 bs2!18) (size!3096 (buf!3599 bs2!18)))))

(assert (=> d!50274 (= (bitIndex!0 (size!3096 (buf!3599 bs2!18)) (currentByte!6573 bs2!18) (currentBit!6568 bs2!18)) lt!239339)))

(declare-fun b!152901 () Bool)

(declare-fun res!128124 () Bool)

(assert (=> b!152901 (=> (not res!128124) (not e!102387))))

(assert (=> b!152901 (= res!128124 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!239339))))

(declare-fun b!152902 () Bool)

(declare-fun lt!239337 () (_ BitVec 64))

(assert (=> b!152902 (= e!102387 (bvsle lt!239339 (bvmul lt!239337 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!152902 (or (= lt!239337 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!239337 #b0000000000000000000000000000000000000000000000000000000000001000) lt!239337)))))

(assert (=> b!152902 (= lt!239337 ((_ sign_extend 32) (size!3096 (buf!3599 bs2!18))))))

(assert (= (and d!50274 res!128125) b!152901))

(assert (= (and b!152901 res!128124) b!152902))

(declare-fun m!238715 () Bool)

(assert (=> d!50274 m!238715))

(declare-fun m!238717 () Bool)

(assert (=> d!50274 m!238717))

(assert (=> b!152850 d!50274))

(declare-fun d!50278 () Bool)

(assert (=> d!50278 (= (array_inv!2885 (buf!3599 bs2!18)) (bvsge (size!3096 (buf!3599 bs2!18)) #b00000000000000000000000000000000))))

(assert (=> b!152855 d!50278))

(declare-fun b!152934 () Bool)

(declare-fun e!102414 () Bool)

(declare-fun call!2150 () Bool)

(assert (=> b!152934 (= e!102414 call!2150)))

(declare-datatypes ((tuple4!160 0))(
  ( (tuple4!161 (_1!7168 (_ BitVec 32)) (_2!7168 (_ BitVec 32)) (_3!383 (_ BitVec 32)) (_4!80 (_ BitVec 32))) )
))
(declare-fun lt!239383 () tuple4!160)

(declare-fun e!102412 () Bool)

(declare-fun b!152935 () Bool)

(declare-fun arrayRangesEq!373 (array!6858 array!6858 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!152935 (= e!102412 (arrayRangesEq!373 (buf!3599 bs1!10) (buf!3599 bs2!18) (_1!7168 lt!239383) (_2!7168 lt!239383)))))

(declare-fun b!152936 () Bool)

(declare-fun e!102416 () Bool)

(assert (=> b!152936 (= e!102414 e!102416)))

(declare-fun lt!239382 () (_ BitVec 32))

(declare-fun res!128153 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!152936 (= res!128153 (byteRangesEq!0 (select (arr!3919 (buf!3599 bs1!10)) (_3!383 lt!239383)) (select (arr!3919 (buf!3599 bs2!18)) (_3!383 lt!239383)) lt!239382 #b00000000000000000000000000001000))))

(assert (=> b!152936 (=> (not res!128153) (not e!102416))))

(declare-fun d!50280 () Bool)

(declare-fun res!128154 () Bool)

(declare-fun e!102413 () Bool)

(assert (=> d!50280 (=> res!128154 e!102413)))

(assert (=> d!50280 (= res!128154 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!239290))))

(assert (=> d!50280 (= (arrayBitRangesEq!0 (buf!3599 bs1!10) (buf!3599 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!239290) e!102413)))

(declare-fun b!152937 () Bool)

(declare-fun e!102415 () Bool)

(assert (=> b!152937 (= e!102413 e!102415)))

(declare-fun res!128151 () Bool)

(assert (=> b!152937 (=> (not res!128151) (not e!102415))))

(assert (=> b!152937 (= res!128151 e!102412)))

(declare-fun res!128152 () Bool)

(assert (=> b!152937 (=> res!128152 e!102412)))

(assert (=> b!152937 (= res!128152 (bvsge (_1!7168 lt!239383) (_2!7168 lt!239383)))))

(declare-fun lt!239381 () (_ BitVec 32))

(assert (=> b!152937 (= lt!239381 ((_ extract 31 0) (bvsrem lt!239290 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!152937 (= lt!239382 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!160)

(assert (=> b!152937 (= lt!239383 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!239290))))

(declare-fun b!152938 () Bool)

(declare-fun e!102411 () Bool)

(assert (=> b!152938 (= e!102411 call!2150)))

(declare-fun b!152939 () Bool)

(declare-fun res!128155 () Bool)

(assert (=> b!152939 (= res!128155 (= lt!239381 #b00000000000000000000000000000000))))

(assert (=> b!152939 (=> res!128155 e!102411)))

(assert (=> b!152939 (= e!102416 e!102411)))

(declare-fun b!152940 () Bool)

(assert (=> b!152940 (= e!102415 e!102414)))

(declare-fun c!8166 () Bool)

(assert (=> b!152940 (= c!8166 (= (_3!383 lt!239383) (_4!80 lt!239383)))))

(declare-fun bm!2147 () Bool)

(assert (=> bm!2147 (= call!2150 (byteRangesEq!0 (ite c!8166 (select (arr!3919 (buf!3599 bs1!10)) (_3!383 lt!239383)) (select (arr!3919 (buf!3599 bs1!10)) (_4!80 lt!239383))) (ite c!8166 (select (arr!3919 (buf!3599 bs2!18)) (_3!383 lt!239383)) (select (arr!3919 (buf!3599 bs2!18)) (_4!80 lt!239383))) (ite c!8166 lt!239382 #b00000000000000000000000000000000) lt!239381))))

(assert (= (and d!50280 (not res!128154)) b!152937))

(assert (= (and b!152937 (not res!128152)) b!152935))

(assert (= (and b!152937 res!128151) b!152940))

(assert (= (and b!152940 c!8166) b!152934))

(assert (= (and b!152940 (not c!8166)) b!152936))

(assert (= (and b!152936 res!128153) b!152939))

(assert (= (and b!152939 (not res!128155)) b!152938))

(assert (= (or b!152934 b!152938) bm!2147))

(declare-fun m!238747 () Bool)

(assert (=> b!152935 m!238747))

(declare-fun m!238749 () Bool)

(assert (=> b!152936 m!238749))

(declare-fun m!238751 () Bool)

(assert (=> b!152936 m!238751))

(assert (=> b!152936 m!238749))

(assert (=> b!152936 m!238751))

(declare-fun m!238753 () Bool)

(assert (=> b!152936 m!238753))

(declare-fun m!238755 () Bool)

(assert (=> b!152937 m!238755))

(assert (=> bm!2147 m!238751))

(assert (=> bm!2147 m!238749))

(declare-fun m!238757 () Bool)

(assert (=> bm!2147 m!238757))

(declare-fun m!238759 () Bool)

(assert (=> bm!2147 m!238759))

(declare-fun m!238761 () Bool)

(assert (=> bm!2147 m!238761))

(assert (=> b!152854 d!50280))

(declare-fun d!50300 () Bool)

(assert (=> d!50300 (= (array_inv!2885 (buf!3599 bs1!10)) (bvsge (size!3096 (buf!3599 bs1!10)) #b00000000000000000000000000000000))))

(assert (=> b!152853 d!50300))

(declare-fun d!50302 () Bool)

(assert (=> d!50302 (= (inv!12 bs1!10) (invariant!0 (currentBit!6568 bs1!10) (currentByte!6573 bs1!10) (size!3096 (buf!3599 bs1!10))))))

(declare-fun bs!12297 () Bool)

(assert (= bs!12297 d!50302))

(declare-fun m!238763 () Bool)

(assert (=> bs!12297 m!238763))

(assert (=> start!29654 d!50302))

(declare-fun d!50304 () Bool)

(assert (=> d!50304 (= (inv!12 bs2!18) (invariant!0 (currentBit!6568 bs2!18) (currentByte!6573 bs2!18) (size!3096 (buf!3599 bs2!18))))))

(declare-fun bs!12298 () Bool)

(assert (= bs!12298 d!50304))

(assert (=> bs!12298 m!238717))

(assert (=> start!29654 d!50304))

(declare-fun d!50306 () Bool)

(declare-fun e!102417 () Bool)

(assert (=> d!50306 e!102417))

(declare-fun res!128157 () Bool)

(assert (=> d!50306 (=> (not res!128157) (not e!102417))))

(declare-fun lt!239387 () (_ BitVec 64))

(declare-fun lt!239388 () (_ BitVec 64))

(declare-fun lt!239384 () (_ BitVec 64))

(assert (=> d!50306 (= res!128157 (= lt!239387 (bvsub lt!239384 lt!239388)))))

(assert (=> d!50306 (or (= (bvand lt!239384 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!239388 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!239384 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!239384 lt!239388) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!50306 (= lt!239388 (remainingBits!0 ((_ sign_extend 32) (size!3096 (buf!3599 bs1!10))) ((_ sign_extend 32) (currentByte!6573 bs1!10)) ((_ sign_extend 32) (currentBit!6568 bs1!10))))))

(declare-fun lt!239386 () (_ BitVec 64))

(declare-fun lt!239389 () (_ BitVec 64))

(assert (=> d!50306 (= lt!239384 (bvmul lt!239386 lt!239389))))

(assert (=> d!50306 (or (= lt!239386 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!239389 (bvsdiv (bvmul lt!239386 lt!239389) lt!239386)))))

(assert (=> d!50306 (= lt!239389 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!50306 (= lt!239386 ((_ sign_extend 32) (size!3096 (buf!3599 bs1!10))))))

(assert (=> d!50306 (= lt!239387 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6573 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6568 bs1!10))))))

(assert (=> d!50306 (invariant!0 (currentBit!6568 bs1!10) (currentByte!6573 bs1!10) (size!3096 (buf!3599 bs1!10)))))

(assert (=> d!50306 (= (bitIndex!0 (size!3096 (buf!3599 bs1!10)) (currentByte!6573 bs1!10) (currentBit!6568 bs1!10)) lt!239387)))

(declare-fun b!152941 () Bool)

(declare-fun res!128156 () Bool)

(assert (=> b!152941 (=> (not res!128156) (not e!102417))))

(assert (=> b!152941 (= res!128156 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!239387))))

(declare-fun b!152942 () Bool)

(declare-fun lt!239385 () (_ BitVec 64))

(assert (=> b!152942 (= e!102417 (bvsle lt!239387 (bvmul lt!239385 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!152942 (or (= lt!239385 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!239385 #b0000000000000000000000000000000000000000000000000000000000001000) lt!239385)))))

(assert (=> b!152942 (= lt!239385 ((_ sign_extend 32) (size!3096 (buf!3599 bs1!10))))))

(assert (= (and d!50306 res!128157) b!152941))

(assert (= (and b!152941 res!128156) b!152942))

(assert (=> d!50306 m!238697))

(assert (=> d!50306 m!238763))

(assert (=> b!152852 d!50306))

(push 1)

(assert (not d!50274))

(assert (not d!50302))

(assert (not d!50272))

(assert (not b!152935))

(assert (not d!50304))

(assert (not b!152936))

(assert (not bm!2147))

(assert (not d!50306))

(assert (not b!152937))

(check-sat)

(pop 1)

(push 1)

(check-sat)

