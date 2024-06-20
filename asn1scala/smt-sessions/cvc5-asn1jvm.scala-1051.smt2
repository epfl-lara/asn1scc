; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30094 () Bool)

(assert start!30094)

(declare-fun b!154413 () Bool)

(declare-fun e!103802 () Bool)

(declare-datatypes ((array!6989 0))(
  ( (array!6990 (arr!3971 (Array (_ BitVec 32) (_ BitVec 8))) (size!3148 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5554 0))(
  ( (BitStream!5555 (buf!3651 array!6989) (currentByte!6673 (_ BitVec 32)) (currentBit!6668 (_ BitVec 32))) )
))
(declare-fun bs1!10 () BitStream!5554)

(declare-fun array_inv!2937 (array!6989) Bool)

(assert (=> b!154413 (= e!103802 (array_inv!2937 (buf!3651 bs1!10)))))

(declare-fun b!154414 () Bool)

(declare-fun res!129237 () Bool)

(declare-fun e!103801 () Bool)

(assert (=> b!154414 (=> (not res!129237) (not e!103801))))

(declare-fun lt!240772 () (_ BitVec 64))

(declare-fun bs2!18 () BitStream!5554)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!154414 (= res!129237 (bvsle lt!240772 (bitIndex!0 (size!3148 (buf!3651 bs2!18)) (currentByte!6673 bs2!18) (currentBit!6668 bs2!18))))))

(declare-fun b!154415 () Bool)

(declare-fun res!129234 () Bool)

(assert (=> b!154415 (=> (not res!129234) (not e!103801))))

(declare-fun arrayBitRangesEq!0 (array!6989 array!6989 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!154415 (= res!129234 (arrayBitRangesEq!0 (buf!3651 bs1!10) (buf!3651 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!240772))))

(declare-fun res!129236 () Bool)

(declare-fun e!103800 () Bool)

(assert (=> start!30094 (=> (not res!129236) (not e!103800))))

(assert (=> start!30094 (= res!129236 (= (size!3148 (buf!3651 bs1!10)) (size!3148 (buf!3651 bs2!18))))))

(assert (=> start!30094 e!103800))

(declare-fun inv!12 (BitStream!5554) Bool)

(assert (=> start!30094 (and (inv!12 bs1!10) e!103802)))

(declare-fun e!103803 () Bool)

(assert (=> start!30094 (and (inv!12 bs2!18) e!103803)))

(declare-fun b!154416 () Bool)

(assert (=> b!154416 (= e!103800 e!103801)))

(declare-fun res!129235 () Bool)

(assert (=> b!154416 (=> (not res!129235) (not e!103801))))

(assert (=> b!154416 (= res!129235 (bvsle lt!240772 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3148 (buf!3651 bs1!10))))))))

(declare-fun lt!240773 () (_ BitVec 64))

(assert (=> b!154416 (= lt!240772 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!240773))))

(assert (=> b!154416 (= lt!240773 (bitIndex!0 (size!3148 (buf!3651 bs1!10)) (currentByte!6673 bs1!10) (currentBit!6668 bs1!10)))))

(declare-fun b!154417 () Bool)

(assert (=> b!154417 (= e!103801 (bvsge (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bvsdiv lt!240773 #b0000000000000000000000000000000000000000000000000000000000001000)) #b0000000000000000000000000000000010000000000000000000000000000000))))

(declare-datatypes ((tuple2!13678 0))(
  ( (tuple2!13679 (_1!7238 BitStream!5554) (_2!7238 (_ BitVec 8))) )
))
(declare-fun lt!240774 () tuple2!13678)

(declare-fun readBytePure!0 (BitStream!5554) tuple2!13678)

(assert (=> b!154417 (= lt!240774 (readBytePure!0 (BitStream!5555 (buf!3651 bs2!18) (currentByte!6673 bs1!10) (currentBit!6668 bs1!10))))))

(declare-fun lt!240775 () tuple2!13678)

(assert (=> b!154417 (= lt!240775 (readBytePure!0 bs1!10))))

(declare-fun b!154418 () Bool)

(assert (=> b!154418 (= e!103803 (array_inv!2937 (buf!3651 bs2!18)))))

(assert (= (and start!30094 res!129236) b!154416))

(assert (= (and b!154416 res!129235) b!154414))

(assert (= (and b!154414 res!129237) b!154415))

(assert (= (and b!154415 res!129234) b!154417))

(assert (= start!30094 b!154413))

(assert (= start!30094 b!154418))

(declare-fun m!240379 () Bool)

(assert (=> b!154416 m!240379))

(declare-fun m!240381 () Bool)

(assert (=> b!154413 m!240381))

(declare-fun m!240383 () Bool)

(assert (=> start!30094 m!240383))

(declare-fun m!240385 () Bool)

(assert (=> start!30094 m!240385))

(declare-fun m!240387 () Bool)

(assert (=> b!154417 m!240387))

(declare-fun m!240389 () Bool)

(assert (=> b!154417 m!240389))

(declare-fun m!240391 () Bool)

(assert (=> b!154415 m!240391))

(declare-fun m!240393 () Bool)

(assert (=> b!154414 m!240393))

(declare-fun m!240395 () Bool)

(assert (=> b!154418 m!240395))

(push 1)

(assert (not b!154414))

(assert (not start!30094))

(assert (not b!154416))

(assert (not b!154413))

(assert (not b!154418))

(assert (not b!154415))

(assert (not b!154417))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!50892 () Bool)

(declare-fun e!103854 () Bool)

(assert (=> d!50892 e!103854))

(declare-fun res!129277 () Bool)

(assert (=> d!50892 (=> (not res!129277) (not e!103854))))

(declare-fun lt!240823 () (_ BitVec 64))

(declare-fun lt!240822 () (_ BitVec 64))

(declare-fun lt!240819 () (_ BitVec 64))

(assert (=> d!50892 (= res!129277 (= lt!240819 (bvsub lt!240823 lt!240822)))))

(assert (=> d!50892 (or (= (bvand lt!240823 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!240822 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!240823 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!240823 lt!240822) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!50892 (= lt!240822 (remainingBits!0 ((_ sign_extend 32) (size!3148 (buf!3651 bs2!18))) ((_ sign_extend 32) (currentByte!6673 bs2!18)) ((_ sign_extend 32) (currentBit!6668 bs2!18))))))

(declare-fun lt!240818 () (_ BitVec 64))

(declare-fun lt!240821 () (_ BitVec 64))

(assert (=> d!50892 (= lt!240823 (bvmul lt!240818 lt!240821))))

(assert (=> d!50892 (or (= lt!240818 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!240821 (bvsdiv (bvmul lt!240818 lt!240821) lt!240818)))))

(assert (=> d!50892 (= lt!240821 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!50892 (= lt!240818 ((_ sign_extend 32) (size!3148 (buf!3651 bs2!18))))))

(assert (=> d!50892 (= lt!240819 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6673 bs2!18)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6668 bs2!18))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!50892 (invariant!0 (currentBit!6668 bs2!18) (currentByte!6673 bs2!18) (size!3148 (buf!3651 bs2!18)))))

(assert (=> d!50892 (= (bitIndex!0 (size!3148 (buf!3651 bs2!18)) (currentByte!6673 bs2!18) (currentBit!6668 bs2!18)) lt!240819)))

(declare-fun b!154473 () Bool)

(declare-fun res!129276 () Bool)

(assert (=> b!154473 (=> (not res!129276) (not e!103854))))

(assert (=> b!154473 (= res!129276 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!240819))))

(declare-fun b!154474 () Bool)

(declare-fun lt!240820 () (_ BitVec 64))

(assert (=> b!154474 (= e!103854 (bvsle lt!240819 (bvmul lt!240820 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!154474 (or (= lt!240820 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!240820 #b0000000000000000000000000000000000000000000000000000000000001000) lt!240820)))))

(assert (=> b!154474 (= lt!240820 ((_ sign_extend 32) (size!3148 (buf!3651 bs2!18))))))

(assert (= (and d!50892 res!129277) b!154473))

(assert (= (and b!154473 res!129276) b!154474))

(declare-fun m!240433 () Bool)

(assert (=> d!50892 m!240433))

(declare-fun m!240435 () Bool)

(assert (=> d!50892 m!240435))

(assert (=> b!154414 d!50892))

(declare-fun d!50894 () Bool)

(assert (=> d!50894 (= (array_inv!2937 (buf!3651 bs1!10)) (bvsge (size!3148 (buf!3651 bs1!10)) #b00000000000000000000000000000000))))

(assert (=> b!154413 d!50894))

(declare-fun d!50896 () Bool)

(declare-fun res!129311 () Bool)

(declare-fun e!103889 () Bool)

(assert (=> d!50896 (=> res!129311 e!103889)))

(assert (=> d!50896 (= res!129311 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!240772))))

(assert (=> d!50896 (= (arrayBitRangesEq!0 (buf!3651 bs1!10) (buf!3651 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!240772) e!103889)))

(declare-fun bm!2198 () Bool)

(declare-fun c!8219 () Bool)

(declare-fun call!2201 () Bool)

(declare-fun lt!240865 () (_ BitVec 32))

(declare-fun lt!240864 () (_ BitVec 32))

(declare-datatypes ((tuple4!194 0))(
  ( (tuple4!195 (_1!7242 (_ BitVec 32)) (_2!7242 (_ BitVec 32)) (_3!400 (_ BitVec 32)) (_4!97 (_ BitVec 32))) )
))
(declare-fun lt!240863 () tuple4!194)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!2198 (= call!2201 (byteRangesEq!0 (select (arr!3971 (buf!3651 bs1!10)) (_3!400 lt!240863)) (select (arr!3971 (buf!3651 bs2!18)) (_3!400 lt!240863)) lt!240865 (ite c!8219 lt!240864 #b00000000000000000000000000001000)))))

(declare-fun b!154517 () Bool)

(declare-fun res!129309 () Bool)

(assert (=> b!154517 (= res!129309 (= lt!240864 #b00000000000000000000000000000000))))

(declare-fun e!103887 () Bool)

(assert (=> b!154517 (=> res!129309 e!103887)))

(declare-fun e!103892 () Bool)

(assert (=> b!154517 (= e!103892 e!103887)))

(declare-fun b!154519 () Bool)

(assert (=> b!154519 (= e!103887 (byteRangesEq!0 (select (arr!3971 (buf!3651 bs1!10)) (_4!97 lt!240863)) (select (arr!3971 (buf!3651 bs2!18)) (_4!97 lt!240863)) #b00000000000000000000000000000000 lt!240864))))

(declare-fun b!154520 () Bool)

(declare-fun e!103888 () Bool)

(declare-fun arrayRangesEq!390 (array!6989 array!6989 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!154520 (= e!103888 (arrayRangesEq!390 (buf!3651 bs1!10) (buf!3651 bs2!18) (_1!7242 lt!240863) (_2!7242 lt!240863)))))

(declare-fun b!154521 () Bool)

(declare-fun e!103890 () Bool)

(assert (=> b!154521 (= e!103890 e!103892)))

(declare-fun res!129315 () Bool)

(assert (=> b!154521 (= res!129315 call!2201)))

(assert (=> b!154521 (=> (not res!129315) (not e!103892))))

(declare-fun b!154522 () Bool)

(assert (=> b!154522 (= e!103890 call!2201)))

(declare-fun b!154523 () Bool)

(declare-fun e!103894 () Bool)

(assert (=> b!154523 (= e!103894 e!103890)))

(assert (=> b!154523 (= c!8219 (= (_3!400 lt!240863) (_4!97 lt!240863)))))

(declare-fun b!154524 () Bool)

(assert (=> b!154524 (= e!103889 e!103894)))

(declare-fun res!129310 () Bool)

(assert (=> b!154524 (=> (not res!129310) (not e!103894))))

(assert (=> b!154524 (= res!129310 e!103888)))

(declare-fun res!129312 () Bool)

(assert (=> b!154524 (=> res!129312 e!103888)))

(assert (=> b!154524 (= res!129312 (bvsge (_1!7242 lt!240863) (_2!7242 lt!240863)))))

(assert (=> b!154524 (= lt!240864 ((_ extract 31 0) (bvsrem lt!240772 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!154524 (= lt!240865 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!194)

(assert (=> b!154524 (= lt!240863 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!240772))))

(assert (= (and d!50896 (not res!129311)) b!154524))

(assert (= (and b!154524 (not res!129312)) b!154520))

(assert (= (and b!154524 res!129310) b!154523))

(assert (= (and b!154523 c!8219) b!154522))

(assert (= (and b!154523 (not c!8219)) b!154521))

(assert (= (and b!154521 res!129315) b!154517))

(assert (= (and b!154517 (not res!129309)) b!154519))

(assert (= (or b!154522 b!154521) bm!2198))

(declare-fun m!240461 () Bool)

(assert (=> bm!2198 m!240461))

(declare-fun m!240463 () Bool)

(assert (=> bm!2198 m!240463))

(assert (=> bm!2198 m!240461))

(assert (=> bm!2198 m!240463))

(declare-fun m!240465 () Bool)

(assert (=> bm!2198 m!240465))

(declare-fun m!240467 () Bool)

(assert (=> b!154519 m!240467))

(declare-fun m!240469 () Bool)

(assert (=> b!154519 m!240469))

(assert (=> b!154519 m!240467))

(assert (=> b!154519 m!240469))

(declare-fun m!240471 () Bool)

(assert (=> b!154519 m!240471))

(declare-fun m!240473 () Bool)

(assert (=> b!154520 m!240473))

(declare-fun m!240475 () Bool)

(assert (=> b!154524 m!240475))

(assert (=> b!154415 d!50896))

(declare-fun d!50914 () Bool)

(assert (=> d!50914 (= (inv!12 bs1!10) (invariant!0 (currentBit!6668 bs1!10) (currentByte!6673 bs1!10) (size!3148 (buf!3651 bs1!10))))))

(declare-fun bs!12454 () Bool)

(assert (= bs!12454 d!50914))

(declare-fun m!240477 () Bool)

(assert (=> bs!12454 m!240477))

(assert (=> start!30094 d!50914))

(declare-fun d!50916 () Bool)

(assert (=> d!50916 (= (inv!12 bs2!18) (invariant!0 (currentBit!6668 bs2!18) (currentByte!6673 bs2!18) (size!3148 (buf!3651 bs2!18))))))

(declare-fun bs!12455 () Bool)

(assert (= bs!12455 d!50916))

(assert (=> bs!12455 m!240435))

(assert (=> start!30094 d!50916))

(declare-fun d!50918 () Bool)

(declare-fun e!103895 () Bool)

(assert (=> d!50918 e!103895))

(declare-fun res!129317 () Bool)

(assert (=> d!50918 (=> (not res!129317) (not e!103895))))

(declare-fun lt!240873 () (_ BitVec 64))

(declare-fun lt!240870 () (_ BitVec 64))

(declare-fun lt!240874 () (_ BitVec 64))

(assert (=> d!50918 (= res!129317 (= lt!240870 (bvsub lt!240874 lt!240873)))))

(assert (=> d!50918 (or (= (bvand lt!240874 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!240873 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!240874 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!240874 lt!240873) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!50918 (= lt!240873 (remainingBits!0 ((_ sign_extend 32) (size!3148 (buf!3651 bs1!10))) ((_ sign_extend 32) (currentByte!6673 bs1!10)) ((_ sign_extend 32) (currentBit!6668 bs1!10))))))

(declare-fun lt!240869 () (_ BitVec 64))

(declare-fun lt!240872 () (_ BitVec 64))

(assert (=> d!50918 (= lt!240874 (bvmul lt!240869 lt!240872))))

(assert (=> d!50918 (or (= lt!240869 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!240872 (bvsdiv (bvmul lt!240869 lt!240872) lt!240869)))))

(assert (=> d!50918 (= lt!240872 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!50918 (= lt!240869 ((_ sign_extend 32) (size!3148 (buf!3651 bs1!10))))))

(assert (=> d!50918 (= lt!240870 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6673 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6668 bs1!10))))))

(assert (=> d!50918 (invariant!0 (currentBit!6668 bs1!10) (currentByte!6673 bs1!10) (size!3148 (buf!3651 bs1!10)))))

(assert (=> d!50918 (= (bitIndex!0 (size!3148 (buf!3651 bs1!10)) (currentByte!6673 bs1!10) (currentBit!6668 bs1!10)) lt!240870)))

(declare-fun b!154525 () Bool)

(declare-fun res!129316 () Bool)

(assert (=> b!154525 (=> (not res!129316) (not e!103895))))

(assert (=> b!154525 (= res!129316 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!240870))))

(declare-fun b!154526 () Bool)

(declare-fun lt!240871 () (_ BitVec 64))

(assert (=> b!154526 (= e!103895 (bvsle lt!240870 (bvmul lt!240871 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!154526 (or (= lt!240871 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!240871 #b0000000000000000000000000000000000000000000000000000000000001000) lt!240871)))))

(assert (=> b!154526 (= lt!240871 ((_ sign_extend 32) (size!3148 (buf!3651 bs1!10))))))

(assert (= (and d!50918 res!129317) b!154525))

(assert (= (and b!154525 res!129316) b!154526))

(declare-fun m!240483 () Bool)

(assert (=> d!50918 m!240483))

(assert (=> d!50918 m!240477))

(assert (=> b!154416 d!50918))

(declare-fun d!50922 () Bool)

(assert (=> d!50922 (= (array_inv!2937 (buf!3651 bs2!18)) (bvsge (size!3148 (buf!3651 bs2!18)) #b00000000000000000000000000000000))))

(assert (=> b!154418 d!50922))

(declare-fun d!50924 () Bool)

(declare-datatypes ((tuple2!13686 0))(
  ( (tuple2!13687 (_1!7245 (_ BitVec 8)) (_2!7245 BitStream!5554)) )
))
(declare-fun lt!240881 () tuple2!13686)

(declare-fun readByte!0 (BitStream!5554) tuple2!13686)

(assert (=> d!50924 (= lt!240881 (readByte!0 (BitStream!5555 (buf!3651 bs2!18) (currentByte!6673 bs1!10) (currentBit!6668 bs1!10))))))

(assert (=> d!50924 (= (readBytePure!0 (BitStream!5555 (buf!3651 bs2!18) (currentByte!6673 bs1!10) (currentBit!6668 bs1!10))) (tuple2!13679 (_2!7245 lt!240881) (_1!7245 lt!240881)))))

(declare-fun bs!12458 () Bool)

(assert (= bs!12458 d!50924))

(declare-fun m!240501 () Bool)

(assert (=> bs!12458 m!240501))

(assert (=> b!154417 d!50924))

(declare-fun d!50932 () Bool)

(declare-fun lt!240882 () tuple2!13686)

(assert (=> d!50932 (= lt!240882 (readByte!0 bs1!10))))

(assert (=> d!50932 (= (readBytePure!0 bs1!10) (tuple2!13679 (_2!7245 lt!240882) (_1!7245 lt!240882)))))

(declare-fun bs!12459 () Bool)

(assert (= bs!12459 d!50932))

(declare-fun m!240503 () Bool)

(assert (=> bs!12459 m!240503))

(assert (=> b!154417 d!50932))

(push 1)

(assert (not d!50932))

(assert (not d!50916))

(assert (not d!50918))

(assert (not d!50924))

(assert (not b!154520))

(assert (not d!50892))

(assert (not b!154524))

(assert (not d!50914))

(assert (not bm!2198))

(assert (not b!154519))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

