; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30358 () Bool)

(assert start!30358)

(declare-fun b!155438 () Bool)

(declare-fun res!130022 () Bool)

(declare-fun e!104691 () Bool)

(assert (=> b!155438 (=> (not res!130022) (not e!104691))))

(declare-datatypes ((array!7053 0))(
  ( (array!7054 (arr!3994 (Array (_ BitVec 32) (_ BitVec 8))) (size!3171 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5600 0))(
  ( (BitStream!5601 (buf!3674 array!7053) (currentByte!6720 (_ BitVec 32)) (currentBit!6715 (_ BitVec 32))) )
))
(declare-fun bs2!18 () BitStream!5600)

(declare-fun bs1!10 () BitStream!5600)

(declare-fun lt!241845 () (_ BitVec 32))

(declare-fun arrayRangesEq!409 (array!7053 array!7053 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!155438 (= res!130022 (arrayRangesEq!409 (buf!3674 bs1!10) (buf!3674 bs2!18) #b00000000000000000000000000000000 lt!241845))))

(declare-fun b!155439 () Bool)

(declare-fun e!104695 () Bool)

(assert (=> b!155439 (= e!104695 e!104691)))

(declare-fun res!130019 () Bool)

(assert (=> b!155439 (=> (not res!130019) (not e!104691))))

(assert (=> b!155439 (= res!130019 (and (bvsle #b00000000000000000000000000000000 lt!241845) (bvsle lt!241845 (size!3171 (buf!3674 bs1!10))) (bvsle #b00000000000000000000000000000000 (currentByte!6720 bs1!10)) (bvslt (currentByte!6720 bs1!10) lt!241845)))))

(declare-fun lt!241846 () (_ BitVec 64))

(assert (=> b!155439 (= lt!241845 ((_ extract 31 0) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bvsdiv lt!241846 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-datatypes ((tuple2!13766 0))(
  ( (tuple2!13767 (_1!7300 BitStream!5600) (_2!7300 (_ BitVec 8))) )
))
(declare-fun lt!241841 () tuple2!13766)

(declare-fun readBytePure!0 (BitStream!5600) tuple2!13766)

(assert (=> b!155439 (= lt!241841 (readBytePure!0 (BitStream!5601 (buf!3674 bs2!18) (currentByte!6720 bs1!10) (currentBit!6715 bs1!10))))))

(declare-fun lt!241843 () tuple2!13766)

(assert (=> b!155439 (= lt!241843 (readBytePure!0 bs1!10))))

(declare-fun b!155440 () Bool)

(declare-fun e!104696 () Bool)

(declare-fun array_inv!2960 (array!7053) Bool)

(assert (=> b!155440 (= e!104696 (array_inv!2960 (buf!3674 bs1!10)))))

(declare-fun res!130017 () Bool)

(declare-fun e!104692 () Bool)

(assert (=> start!30358 (=> (not res!130017) (not e!104692))))

(assert (=> start!30358 (= res!130017 (= (size!3171 (buf!3674 bs1!10)) (size!3171 (buf!3674 bs2!18))))))

(assert (=> start!30358 e!104692))

(declare-fun inv!12 (BitStream!5600) Bool)

(assert (=> start!30358 (and (inv!12 bs1!10) e!104696)))

(declare-fun e!104690 () Bool)

(assert (=> start!30358 (and (inv!12 bs2!18) e!104690)))

(declare-fun b!155441 () Bool)

(declare-fun res!130018 () Bool)

(assert (=> b!155441 (=> (not res!130018) (not e!104695))))

(declare-fun lt!241844 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!7053 array!7053 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!155441 (= res!130018 (arrayBitRangesEq!0 (buf!3674 bs1!10) (buf!3674 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!241844))))

(declare-fun b!155442 () Bool)

(declare-fun e!104689 () Bool)

(assert (=> b!155442 (= e!104691 (not e!104689))))

(declare-fun res!130020 () Bool)

(assert (=> b!155442 (=> (not res!130020) (not e!104689))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!155442 (= res!130020 (= (bitIndex!0 (size!3171 (buf!3674 (_1!7300 lt!241843))) (currentByte!6720 (_1!7300 lt!241843)) (currentBit!6715 (_1!7300 lt!241843))) (bitIndex!0 (size!3171 (buf!3674 (_1!7300 lt!241841))) (currentByte!6720 (_1!7300 lt!241841)) (currentBit!6715 (_1!7300 lt!241841)))))))

(assert (=> b!155442 (= (select (arr!3994 (buf!3674 bs1!10)) (currentByte!6720 bs1!10)) (select (arr!3994 (buf!3674 bs2!18)) (currentByte!6720 bs1!10)))))

(declare-datatypes ((Unit!9785 0))(
  ( (Unit!9786) )
))
(declare-fun lt!241842 () Unit!9785)

(declare-fun arrayRangesEqImpliesEq!29 (array!7053 array!7053 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9785)

(assert (=> b!155442 (= lt!241842 (arrayRangesEqImpliesEq!29 (buf!3674 bs1!10) (buf!3674 bs2!18) #b00000000000000000000000000000000 (currentByte!6720 bs1!10) lt!241845))))

(declare-fun b!155443 () Bool)

(declare-fun res!130021 () Bool)

(assert (=> b!155443 (=> (not res!130021) (not e!104695))))

(assert (=> b!155443 (= res!130021 (bvsle lt!241844 (bitIndex!0 (size!3171 (buf!3674 bs2!18)) (currentByte!6720 bs2!18) (currentBit!6715 bs2!18))))))

(declare-fun b!155444 () Bool)

(assert (=> b!155444 (= e!104689 (= (_2!7300 lt!241843) (_2!7300 lt!241841)))))

(declare-fun b!155445 () Bool)

(assert (=> b!155445 (= e!104690 (array_inv!2960 (buf!3674 bs2!18)))))

(declare-fun b!155446 () Bool)

(assert (=> b!155446 (= e!104692 e!104695)))

(declare-fun res!130016 () Bool)

(assert (=> b!155446 (=> (not res!130016) (not e!104695))))

(assert (=> b!155446 (= res!130016 (bvsle lt!241844 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3171 (buf!3674 bs1!10))))))))

(assert (=> b!155446 (= lt!241844 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!241846))))

(assert (=> b!155446 (= lt!241846 (bitIndex!0 (size!3171 (buf!3674 bs1!10)) (currentByte!6720 bs1!10) (currentBit!6715 bs1!10)))))

(assert (= (and start!30358 res!130017) b!155446))

(assert (= (and b!155446 res!130016) b!155443))

(assert (= (and b!155443 res!130021) b!155441))

(assert (= (and b!155441 res!130018) b!155439))

(assert (= (and b!155439 res!130019) b!155438))

(assert (= (and b!155438 res!130022) b!155442))

(assert (= (and b!155442 res!130020) b!155444))

(assert (= start!30358 b!155440))

(assert (= start!30358 b!155445))

(declare-fun m!241453 () Bool)

(assert (=> b!155443 m!241453))

(declare-fun m!241455 () Bool)

(assert (=> b!155446 m!241455))

(declare-fun m!241457 () Bool)

(assert (=> b!155442 m!241457))

(declare-fun m!241459 () Bool)

(assert (=> b!155442 m!241459))

(declare-fun m!241461 () Bool)

(assert (=> b!155442 m!241461))

(declare-fun m!241463 () Bool)

(assert (=> b!155442 m!241463))

(declare-fun m!241465 () Bool)

(assert (=> b!155442 m!241465))

(declare-fun m!241467 () Bool)

(assert (=> b!155438 m!241467))

(declare-fun m!241469 () Bool)

(assert (=> b!155440 m!241469))

(declare-fun m!241471 () Bool)

(assert (=> b!155445 m!241471))

(declare-fun m!241473 () Bool)

(assert (=> b!155439 m!241473))

(declare-fun m!241475 () Bool)

(assert (=> b!155439 m!241475))

(declare-fun m!241477 () Bool)

(assert (=> b!155441 m!241477))

(declare-fun m!241479 () Bool)

(assert (=> start!30358 m!241479))

(declare-fun m!241481 () Bool)

(assert (=> start!30358 m!241481))

(push 1)

(assert (not b!155440))

(assert (not b!155446))

(assert (not b!155443))

(assert (not start!30358))

(assert (not b!155445))

(assert (not b!155438))

(assert (not b!155439))

(assert (not b!155442))

(assert (not b!155441))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!155510 () Bool)

(declare-fun res!130076 () Bool)

(declare-fun lt!241938 () (_ BitVec 32))

(assert (=> b!155510 (= res!130076 (= lt!241938 #b00000000000000000000000000000000))))

(declare-fun e!104747 () Bool)

(assert (=> b!155510 (=> res!130076 e!104747)))

(declare-fun e!104749 () Bool)

(assert (=> b!155510 (= e!104749 e!104747)))

(declare-datatypes ((tuple4!230 0))(
  ( (tuple4!231 (_1!7303 (_ BitVec 32)) (_2!7303 (_ BitVec 32)) (_3!418 (_ BitVec 32)) (_4!115 (_ BitVec 32))) )
))
(declare-fun lt!241939 () tuple4!230)

(declare-fun c!8271 () Bool)

(declare-fun bm!2252 () Bool)

(declare-fun lt!241940 () (_ BitVec 32))

(declare-fun call!2255 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!2252 (= call!2255 (byteRangesEq!0 (ite c!8271 (select (arr!3994 (buf!3674 bs1!10)) (_3!418 lt!241939)) (select (arr!3994 (buf!3674 bs1!10)) (_4!115 lt!241939))) (ite c!8271 (select (arr!3994 (buf!3674 bs2!18)) (_3!418 lt!241939)) (select (arr!3994 (buf!3674 bs2!18)) (_4!115 lt!241939))) (ite c!8271 lt!241940 #b00000000000000000000000000000000) lt!241938))))

(declare-fun b!155511 () Bool)

(declare-fun e!104744 () Bool)

(declare-fun e!104746 () Bool)

(assert (=> b!155511 (= e!104744 e!104746)))

(declare-fun res!130077 () Bool)

(assert (=> b!155511 (=> (not res!130077) (not e!104746))))

(declare-fun e!104748 () Bool)

(assert (=> b!155511 (= res!130077 e!104748)))

(declare-fun res!130080 () Bool)

(assert (=> b!155511 (=> res!130080 e!104748)))

(assert (=> b!155511 (= res!130080 (bvsge (_1!7303 lt!241939) (_2!7303 lt!241939)))))

(assert (=> b!155511 (= lt!241938 ((_ extract 31 0) (bvsrem lt!241844 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!155511 (= lt!241940 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!230)

(assert (=> b!155511 (= lt!241939 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!241844))))

(declare-fun b!155512 () Bool)

(declare-fun e!104745 () Bool)

(assert (=> b!155512 (= e!104745 call!2255)))

(declare-fun b!155513 () Bool)

(assert (=> b!155513 (= e!104745 e!104749)))

(declare-fun res!130079 () Bool)

(assert (=> b!155513 (= res!130079 (byteRangesEq!0 (select (arr!3994 (buf!3674 bs1!10)) (_3!418 lt!241939)) (select (arr!3994 (buf!3674 bs2!18)) (_3!418 lt!241939)) lt!241940 #b00000000000000000000000000001000))))

(assert (=> b!155513 (=> (not res!130079) (not e!104749))))

(declare-fun b!155514 () Bool)

(assert (=> b!155514 (= e!104748 (arrayRangesEq!409 (buf!3674 bs1!10) (buf!3674 bs2!18) (_1!7303 lt!241939) (_2!7303 lt!241939)))))

(declare-fun d!51326 () Bool)

(declare-fun res!130078 () Bool)

(assert (=> d!51326 (=> res!130078 e!104744)))

(assert (=> d!51326 (= res!130078 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!241844))))

(assert (=> d!51326 (= (arrayBitRangesEq!0 (buf!3674 bs1!10) (buf!3674 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!241844) e!104744)))

(declare-fun b!155515 () Bool)

(assert (=> b!155515 (= e!104747 call!2255)))

(declare-fun b!155516 () Bool)

(assert (=> b!155516 (= e!104746 e!104745)))

(assert (=> b!155516 (= c!8271 (= (_3!418 lt!241939) (_4!115 lt!241939)))))

(assert (= (and d!51326 (not res!130078)) b!155511))

(assert (= (and b!155511 (not res!130080)) b!155514))

(assert (= (and b!155511 res!130077) b!155516))

(assert (= (and b!155516 c!8271) b!155512))

(assert (= (and b!155516 (not c!8271)) b!155513))

(assert (= (and b!155513 res!130079) b!155510))

(assert (= (and b!155510 (not res!130076)) b!155515))

(assert (= (or b!155512 b!155515) bm!2252))

(declare-fun m!241541 () Bool)

(assert (=> bm!2252 m!241541))

(declare-fun m!241543 () Bool)

(assert (=> bm!2252 m!241543))

(declare-fun m!241545 () Bool)

(assert (=> bm!2252 m!241545))

(declare-fun m!241547 () Bool)

(assert (=> bm!2252 m!241547))

(declare-fun m!241549 () Bool)

(assert (=> bm!2252 m!241549))

(declare-fun m!241551 () Bool)

(assert (=> b!155511 m!241551))

(assert (=> b!155513 m!241549))

(assert (=> b!155513 m!241545))

(assert (=> b!155513 m!241549))

(assert (=> b!155513 m!241545))

(declare-fun m!241553 () Bool)

(assert (=> b!155513 m!241553))

(declare-fun m!241555 () Bool)

(assert (=> b!155514 m!241555))

(assert (=> b!155441 d!51326))

(declare-fun d!51336 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!51336 (= (inv!12 bs1!10) (invariant!0 (currentBit!6715 bs1!10) (currentByte!6720 bs1!10) (size!3171 (buf!3674 bs1!10))))))

(declare-fun bs!12557 () Bool)

(assert (= bs!12557 d!51336))

(declare-fun m!241557 () Bool)

(assert (=> bs!12557 m!241557))

(assert (=> start!30358 d!51336))

(declare-fun d!51338 () Bool)

(assert (=> d!51338 (= (inv!12 bs2!18) (invariant!0 (currentBit!6715 bs2!18) (currentByte!6720 bs2!18) (size!3171 (buf!3674 bs2!18))))))

(declare-fun bs!12558 () Bool)

(assert (= bs!12558 d!51338))

(declare-fun m!241559 () Bool)

(assert (=> bs!12558 m!241559))

(assert (=> start!30358 d!51338))

(declare-fun d!51340 () Bool)

(declare-fun e!104752 () Bool)

(assert (=> d!51340 e!104752))

(declare-fun res!130085 () Bool)

(assert (=> d!51340 (=> (not res!130085) (not e!104752))))

(declare-fun lt!241959 () (_ BitVec 64))

(declare-fun lt!241960 () (_ BitVec 64))

(declare-fun lt!241958 () (_ BitVec 64))

(assert (=> d!51340 (= res!130085 (= lt!241958 (bvsub lt!241959 lt!241960)))))

(assert (=> d!51340 (or (= (bvand lt!241959 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!241960 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!241959 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!241959 lt!241960) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!51340 (= lt!241960 (remainingBits!0 ((_ sign_extend 32) (size!3171 (buf!3674 (_1!7300 lt!241843)))) ((_ sign_extend 32) (currentByte!6720 (_1!7300 lt!241843))) ((_ sign_extend 32) (currentBit!6715 (_1!7300 lt!241843)))))))

(declare-fun lt!241962 () (_ BitVec 64))

(declare-fun lt!241961 () (_ BitVec 64))

(assert (=> d!51340 (= lt!241959 (bvmul lt!241962 lt!241961))))

(assert (=> d!51340 (or (= lt!241962 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!241961 (bvsdiv (bvmul lt!241962 lt!241961) lt!241962)))))

(assert (=> d!51340 (= lt!241961 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!51340 (= lt!241962 ((_ sign_extend 32) (size!3171 (buf!3674 (_1!7300 lt!241843)))))))

(assert (=> d!51340 (= lt!241958 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6720 (_1!7300 lt!241843))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6715 (_1!7300 lt!241843)))))))

(assert (=> d!51340 (invariant!0 (currentBit!6715 (_1!7300 lt!241843)) (currentByte!6720 (_1!7300 lt!241843)) (size!3171 (buf!3674 (_1!7300 lt!241843))))))

(assert (=> d!51340 (= (bitIndex!0 (size!3171 (buf!3674 (_1!7300 lt!241843))) (currentByte!6720 (_1!7300 lt!241843)) (currentBit!6715 (_1!7300 lt!241843))) lt!241958)))

(declare-fun b!155521 () Bool)

(declare-fun res!130086 () Bool)

(assert (=> b!155521 (=> (not res!130086) (not e!104752))))

(assert (=> b!155521 (= res!130086 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!241958))))

(declare-fun b!155522 () Bool)

(declare-fun lt!241957 () (_ BitVec 64))

(assert (=> b!155522 (= e!104752 (bvsle lt!241958 (bvmul lt!241957 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!155522 (or (= lt!241957 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!241957 #b0000000000000000000000000000000000000000000000000000000000001000) lt!241957)))))

(assert (=> b!155522 (= lt!241957 ((_ sign_extend 32) (size!3171 (buf!3674 (_1!7300 lt!241843)))))))

(assert (= (and d!51340 res!130085) b!155521))

(assert (= (and b!155521 res!130086) b!155522))

(declare-fun m!241567 () Bool)

(assert (=> d!51340 m!241567))

(declare-fun m!241569 () Bool)

(assert (=> d!51340 m!241569))

(assert (=> b!155442 d!51340))

(declare-fun d!51352 () Bool)

(declare-fun e!104753 () Bool)

(assert (=> d!51352 e!104753))

(declare-fun res!130087 () Bool)

(assert (=> d!51352 (=> (not res!130087) (not e!104753))))

(declare-fun lt!241964 () (_ BitVec 64))

(declare-fun lt!241965 () (_ BitVec 64))

(declare-fun lt!241966 () (_ BitVec 64))

(assert (=> d!51352 (= res!130087 (= lt!241964 (bvsub lt!241965 lt!241966)))))

(assert (=> d!51352 (or (= (bvand lt!241965 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!241966 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!241965 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!241965 lt!241966) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!51352 (= lt!241966 (remainingBits!0 ((_ sign_extend 32) (size!3171 (buf!3674 (_1!7300 lt!241841)))) ((_ sign_extend 32) (currentByte!6720 (_1!7300 lt!241841))) ((_ sign_extend 32) (currentBit!6715 (_1!7300 lt!241841)))))))

(declare-fun lt!241968 () (_ BitVec 64))

(declare-fun lt!241967 () (_ BitVec 64))

(assert (=> d!51352 (= lt!241965 (bvmul lt!241968 lt!241967))))

(assert (=> d!51352 (or (= lt!241968 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!241967 (bvsdiv (bvmul lt!241968 lt!241967) lt!241968)))))

(assert (=> d!51352 (= lt!241967 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!51352 (= lt!241968 ((_ sign_extend 32) (size!3171 (buf!3674 (_1!7300 lt!241841)))))))

(assert (=> d!51352 (= lt!241964 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6720 (_1!7300 lt!241841))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6715 (_1!7300 lt!241841)))))))

(assert (=> d!51352 (invariant!0 (currentBit!6715 (_1!7300 lt!241841)) (currentByte!6720 (_1!7300 lt!241841)) (size!3171 (buf!3674 (_1!7300 lt!241841))))))

(assert (=> d!51352 (= (bitIndex!0 (size!3171 (buf!3674 (_1!7300 lt!241841))) (currentByte!6720 (_1!7300 lt!241841)) (currentBit!6715 (_1!7300 lt!241841))) lt!241964)))

(declare-fun b!155523 () Bool)

(declare-fun res!130088 () Bool)

(assert (=> b!155523 (=> (not res!130088) (not e!104753))))

(assert (=> b!155523 (= res!130088 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!241964))))

(declare-fun b!155524 () Bool)

(declare-fun lt!241963 () (_ BitVec 64))

(assert (=> b!155524 (= e!104753 (bvsle lt!241964 (bvmul lt!241963 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!155524 (or (= lt!241963 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!241963 #b0000000000000000000000000000000000000000000000000000000000001000) lt!241963)))))

(assert (=> b!155524 (= lt!241963 ((_ sign_extend 32) (size!3171 (buf!3674 (_1!7300 lt!241841)))))))

(assert (= (and d!51352 res!130087) b!155523))

(assert (= (and b!155523 res!130088) b!155524))

(declare-fun m!241571 () Bool)

(assert (=> d!51352 m!241571))

(declare-fun m!241573 () Bool)

(assert (=> d!51352 m!241573))

(assert (=> b!155442 d!51352))

(declare-fun d!51354 () Bool)

(assert (=> d!51354 (and (bvsge (currentByte!6720 bs1!10) #b00000000000000000000000000000000) (bvslt (currentByte!6720 bs1!10) (size!3171 (buf!3674 bs1!10))) (bvslt (currentByte!6720 bs1!10) (size!3171 (buf!3674 bs2!18))) (= (select (arr!3994 (buf!3674 bs1!10)) (currentByte!6720 bs1!10)) (select (arr!3994 (buf!3674 bs2!18)) (currentByte!6720 bs1!10))))))

(declare-fun lt!241977 () Unit!9785)

(declare-fun choose!112 (array!7053 array!7053 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9785)

(assert (=> d!51354 (= lt!241977 (choose!112 (buf!3674 bs1!10) (buf!3674 bs2!18) #b00000000000000000000000000000000 (currentByte!6720 bs1!10) lt!241845))))

(assert (=> d!51354 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 lt!241845))))

(assert (=> d!51354 (= (arrayRangesEqImpliesEq!29 (buf!3674 bs1!10) (buf!3674 bs2!18) #b00000000000000000000000000000000 (currentByte!6720 bs1!10) lt!241845) lt!241977)))

(declare-fun bs!12563 () Bool)

(assert (= bs!12563 d!51354))

(assert (=> bs!12563 m!241461))

(assert (=> bs!12563 m!241457))

(declare-fun m!241575 () Bool)

(assert (=> bs!12563 m!241575))

(assert (=> b!155442 d!51354))

(declare-fun d!51356 () Bool)

(assert (=> d!51356 (= (array_inv!2960 (buf!3674 bs2!18)) (bvsge (size!3171 (buf!3674 bs2!18)) #b00000000000000000000000000000000))))

(assert (=> b!155445 d!51356))

(declare-fun d!51358 () Bool)

(assert (=> d!51358 (= (array_inv!2960 (buf!3674 bs1!10)) (bvsge (size!3171 (buf!3674 bs1!10)) #b00000000000000000000000000000000))))

(assert (=> b!155440 d!51358))

(declare-fun d!51360 () Bool)

(declare-fun e!104766 () Bool)

(assert (=> d!51360 e!104766))

(declare-fun res!130099 () Bool)

(assert (=> d!51360 (=> (not res!130099) (not e!104766))))

(declare-fun lt!241981 () (_ BitVec 64))

(declare-fun lt!241979 () (_ BitVec 64))

(declare-fun lt!241980 () (_ BitVec 64))

(assert (=> d!51360 (= res!130099 (= lt!241979 (bvsub lt!241980 lt!241981)))))

(assert (=> d!51360 (or (= (bvand lt!241980 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!241981 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!241980 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!241980 lt!241981) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!51360 (= lt!241981 (remainingBits!0 ((_ sign_extend 32) (size!3171 (buf!3674 bs1!10))) ((_ sign_extend 32) (currentByte!6720 bs1!10)) ((_ sign_extend 32) (currentBit!6715 bs1!10))))))

(declare-fun lt!241983 () (_ BitVec 64))

(declare-fun lt!241982 () (_ BitVec 64))

(assert (=> d!51360 (= lt!241980 (bvmul lt!241983 lt!241982))))

(assert (=> d!51360 (or (= lt!241983 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!241982 (bvsdiv (bvmul lt!241983 lt!241982) lt!241983)))))

(assert (=> d!51360 (= lt!241982 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!51360 (= lt!241983 ((_ sign_extend 32) (size!3171 (buf!3674 bs1!10))))))

(assert (=> d!51360 (= lt!241979 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6720 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6715 bs1!10))))))

(assert (=> d!51360 (invariant!0 (currentBit!6715 bs1!10) (currentByte!6720 bs1!10) (size!3171 (buf!3674 bs1!10)))))

(assert (=> d!51360 (= (bitIndex!0 (size!3171 (buf!3674 bs1!10)) (currentByte!6720 bs1!10) (currentBit!6715 bs1!10)) lt!241979)))

(declare-fun b!155539 () Bool)

(declare-fun res!130100 () Bool)

(assert (=> b!155539 (=> (not res!130100) (not e!104766))))

(assert (=> b!155539 (= res!130100 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!241979))))

(declare-fun b!155540 () Bool)

(declare-fun lt!241978 () (_ BitVec 64))

(assert (=> b!155540 (= e!104766 (bvsle lt!241979 (bvmul lt!241978 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!155540 (or (= lt!241978 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!241978 #b0000000000000000000000000000000000000000000000000000000000001000) lt!241978)))))

(assert (=> b!155540 (= lt!241978 ((_ sign_extend 32) (size!3171 (buf!3674 bs1!10))))))

(assert (= (and d!51360 res!130099) b!155539))

(assert (= (and b!155539 res!130100) b!155540))

(declare-fun m!241577 () Bool)

(assert (=> d!51360 m!241577))

(assert (=> d!51360 m!241557))

(assert (=> b!155446 d!51360))

(declare-fun d!51362 () Bool)

(declare-datatypes ((tuple2!13772 0))(
  ( (tuple2!13773 (_1!7306 (_ BitVec 8)) (_2!7306 BitStream!5600)) )
))
(declare-fun lt!241993 () tuple2!13772)

(declare-fun readByte!0 (BitStream!5600) tuple2!13772)

(assert (=> d!51362 (= lt!241993 (readByte!0 (BitStream!5601 (buf!3674 bs2!18) (currentByte!6720 bs1!10) (currentBit!6715 bs1!10))))))

(assert (=> d!51362 (= (readBytePure!0 (BitStream!5601 (buf!3674 bs2!18) (currentByte!6720 bs1!10) (currentBit!6715 bs1!10))) (tuple2!13767 (_2!7306 lt!241993) (_1!7306 lt!241993)))))

(declare-fun bs!12564 () Bool)

(assert (= bs!12564 d!51362))

(declare-fun m!241595 () Bool)

(assert (=> bs!12564 m!241595))

(assert (=> b!155439 d!51362))

(declare-fun d!51368 () Bool)

(declare-fun lt!241996 () tuple2!13772)

(assert (=> d!51368 (= lt!241996 (readByte!0 bs1!10))))

(assert (=> d!51368 (= (readBytePure!0 bs1!10) (tuple2!13767 (_2!7306 lt!241996) (_1!7306 lt!241996)))))

(declare-fun bs!12565 () Bool)

(assert (= bs!12565 d!51368))

(declare-fun m!241597 () Bool)

(assert (=> bs!12565 m!241597))

(assert (=> b!155439 d!51368))

(declare-fun d!51370 () Bool)

(declare-fun e!104774 () Bool)

(assert (=> d!51370 e!104774))

(declare-fun res!130108 () Bool)

(assert (=> d!51370 (=> (not res!130108) (not e!104774))))

(declare-fun lt!242000 () (_ BitVec 64))

(declare-fun lt!241999 () (_ BitVec 64))

(declare-fun lt!241998 () (_ BitVec 64))

(assert (=> d!51370 (= res!130108 (= lt!241998 (bvsub lt!241999 lt!242000)))))

(assert (=> d!51370 (or (= (bvand lt!241999 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!242000 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!241999 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!241999 lt!242000) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!51370 (= lt!242000 (remainingBits!0 ((_ sign_extend 32) (size!3171 (buf!3674 bs2!18))) ((_ sign_extend 32) (currentByte!6720 bs2!18)) ((_ sign_extend 32) (currentBit!6715 bs2!18))))))

(declare-fun lt!242002 () (_ BitVec 64))

(declare-fun lt!242001 () (_ BitVec 64))

(assert (=> d!51370 (= lt!241999 (bvmul lt!242002 lt!242001))))

(assert (=> d!51370 (or (= lt!242002 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!242001 (bvsdiv (bvmul lt!242002 lt!242001) lt!242002)))))

(assert (=> d!51370 (= lt!242001 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!51370 (= lt!242002 ((_ sign_extend 32) (size!3171 (buf!3674 bs2!18))))))

(assert (=> d!51370 (= lt!241998 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6720 bs2!18)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6715 bs2!18))))))

(assert (=> d!51370 (invariant!0 (currentBit!6715 bs2!18) (currentByte!6720 bs2!18) (size!3171 (buf!3674 bs2!18)))))

(assert (=> d!51370 (= (bitIndex!0 (size!3171 (buf!3674 bs2!18)) (currentByte!6720 bs2!18) (currentBit!6715 bs2!18)) lt!241998)))

(declare-fun b!155550 () Bool)

(declare-fun res!130109 () Bool)

(assert (=> b!155550 (=> (not res!130109) (not e!104774))))

(assert (=> b!155550 (= res!130109 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!241998))))

(declare-fun b!155551 () Bool)

(declare-fun lt!241997 () (_ BitVec 64))

(assert (=> b!155551 (= e!104774 (bvsle lt!241998 (bvmul lt!241997 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!155551 (or (= lt!241997 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!241997 #b0000000000000000000000000000000000000000000000000000000000001000) lt!241997)))))

(assert (=> b!155551 (= lt!241997 ((_ sign_extend 32) (size!3171 (buf!3674 bs2!18))))))

(assert (= (and d!51370 res!130108) b!155550))

(assert (= (and b!155550 res!130109) b!155551))

(declare-fun m!241601 () Bool)

(assert (=> d!51370 m!241601))

(assert (=> d!51370 m!241559))

(assert (=> b!155443 d!51370))

(declare-fun d!51374 () Bool)

(declare-fun res!130120 () Bool)

(declare-fun e!104785 () Bool)

(assert (=> d!51374 (=> res!130120 e!104785)))

(assert (=> d!51374 (= res!130120 (= #b00000000000000000000000000000000 lt!241845))))

(assert (=> d!51374 (= (arrayRangesEq!409 (buf!3674 bs1!10) (buf!3674 bs2!18) #b00000000000000000000000000000000 lt!241845) e!104785)))

(declare-fun b!155562 () Bool)

(declare-fun e!104786 () Bool)

(assert (=> b!155562 (= e!104785 e!104786)))

(declare-fun res!130121 () Bool)

(assert (=> b!155562 (=> (not res!130121) (not e!104786))))

(assert (=> b!155562 (= res!130121 (= (select (arr!3994 (buf!3674 bs1!10)) #b00000000000000000000000000000000) (select (arr!3994 (buf!3674 bs2!18)) #b00000000000000000000000000000000)))))

(declare-fun b!155563 () Bool)

(assert (=> b!155563 (= e!104786 (arrayRangesEq!409 (buf!3674 bs1!10) (buf!3674 bs2!18) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!241845))))

(assert (= (and d!51374 (not res!130120)) b!155562))

(assert (= (and b!155562 res!130121) b!155563))

(declare-fun m!241609 () Bool)

(assert (=> b!155562 m!241609))

(declare-fun m!241611 () Bool)

(assert (=> b!155562 m!241611))

(declare-fun m!241613 () Bool)

(assert (=> b!155563 m!241613))

(assert (=> b!155438 d!51374))

(push 1)

(assert (not b!155511))

(assert (not b!155514))

(assert (not d!51352))

(assert (not b!155513))

(assert (not d!51340))

(assert (not d!51354))

(assert (not b!155563))

(assert (not d!51338))

(assert (not d!51336))

(assert (not bm!2252))

(assert (not d!51362))

(assert (not d!51360))

(assert (not d!51370))

(assert (not d!51368))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!51426 () Bool)

(assert (=> d!51426 (= (invariant!0 (currentBit!6715 bs1!10) (currentByte!6720 bs1!10) (size!3171 (buf!3674 bs1!10))) (and (bvsge (currentBit!6715 bs1!10) #b00000000000000000000000000000000) (bvslt (currentBit!6715 bs1!10) #b00000000000000000000000000001000) (bvsge (currentByte!6720 bs1!10) #b00000000000000000000000000000000) (or (bvslt (currentByte!6720 bs1!10) (size!3171 (buf!3674 bs1!10))) (and (= (currentBit!6715 bs1!10) #b00000000000000000000000000000000) (= (currentByte!6720 bs1!10) (size!3171 (buf!3674 bs1!10)))))))))

(assert (=> d!51336 d!51426))

(declare-fun d!51428 () Bool)

(assert (=> d!51428 (= (byteRangesEq!0 (ite c!8271 (select (arr!3994 (buf!3674 bs1!10)) (_3!418 lt!241939)) (select (arr!3994 (buf!3674 bs1!10)) (_4!115 lt!241939))) (ite c!8271 (select (arr!3994 (buf!3674 bs2!18)) (_3!418 lt!241939)) (select (arr!3994 (buf!3674 bs2!18)) (_4!115 lt!241939))) (ite c!8271 lt!241940 #b00000000000000000000000000000000) lt!241938) (or (= (ite c!8271 lt!241940 #b00000000000000000000000000000000) lt!241938) (= (bvand (bvand (bvand ((_ sign_extend 24) (ite c!8271 (select (arr!3994 (buf!3674 bs1!10)) (_3!418 lt!241939)) (select (arr!3994 (buf!3674 bs1!10)) (_4!115 lt!241939)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!241938))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!8271 lt!241940 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (ite c!8271 (select (arr!3994 (buf!3674 bs2!18)) (_3!418 lt!241939)) (select (arr!3994 (buf!3674 bs2!18)) (_4!115 lt!241939)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!241938))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!8271 lt!241940 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111))))))

(declare-fun bs!12571 () Bool)

(assert (= bs!12571 d!51428))

(declare-fun m!241667 () Bool)

(assert (=> bs!12571 m!241667))

(declare-fun m!241669 () Bool)

(assert (=> bs!12571 m!241669))

(assert (=> bm!2252 d!51428))

(declare-fun d!51432 () Bool)

(assert (=> d!51432 (= (select (arr!3994 (buf!3674 bs1!10)) (currentByte!6720 bs1!10)) (select (arr!3994 (buf!3674 bs2!18)) (currentByte!6720 bs1!10)))))

(assert (=> d!51432 true))

(declare-fun _$12!81 () Unit!9785)

(assert (=> d!51432 (= (choose!112 (buf!3674 bs1!10) (buf!3674 bs2!18) #b00000000000000000000000000000000 (currentByte!6720 bs1!10) lt!241845) _$12!81)))

(declare-fun bs!12572 () Bool)

(assert (= bs!12572 d!51432))

(assert (=> bs!12572 m!241461))

(assert (=> bs!12572 m!241457))

(assert (=> d!51354 d!51432))

(declare-fun d!51434 () Bool)

(assert (=> d!51434 (= (invariant!0 (currentBit!6715 bs2!18) (currentByte!6720 bs2!18) (size!3171 (buf!3674 bs2!18))) (and (bvsge (currentBit!6715 bs2!18) #b00000000000000000000000000000000) (bvslt (currentBit!6715 bs2!18) #b00000000000000000000000000001000) (bvsge (currentByte!6720 bs2!18) #b00000000000000000000000000000000) (or (bvslt (currentByte!6720 bs2!18) (size!3171 (buf!3674 bs2!18))) (and (= (currentBit!6715 bs2!18) #b00000000000000000000000000000000) (= (currentByte!6720 bs2!18) (size!3171 (buf!3674 bs2!18)))))))))

(assert (=> d!51338 d!51434))

(declare-fun d!51436 () Bool)

(declare-fun lt!242076 () (_ BitVec 8))

(declare-fun lt!242077 () (_ BitVec 8))

(assert (=> d!51436 (= lt!242076 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3994 (buf!3674 bs1!10)) (currentByte!6720 bs1!10))) ((_ sign_extend 24) lt!242077))))))

(assert (=> d!51436 (= lt!242077 ((_ extract 7 0) (currentBit!6715 bs1!10)))))

(declare-fun e!104816 () Bool)

(assert (=> d!51436 e!104816))

(declare-fun res!130153 () Bool)

(assert (=> d!51436 (=> (not res!130153) (not e!104816))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!51436 (= res!130153 (validate_offset_bits!1 ((_ sign_extend 32) (size!3171 (buf!3674 bs1!10))) ((_ sign_extend 32) (currentByte!6720 bs1!10)) ((_ sign_extend 32) (currentBit!6715 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!13778 0))(
  ( (tuple2!13779 (_1!7309 Unit!9785) (_2!7309 (_ BitVec 8))) )
))
(declare-fun Unit!9799 () Unit!9785)

(declare-fun Unit!9800 () Unit!9785)

(assert (=> d!51436 (= (readByte!0 bs1!10) (tuple2!13773 (_2!7309 (ite (bvsgt ((_ sign_extend 24) lt!242077) #b00000000000000000000000000000000) (tuple2!13779 Unit!9799 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!242076) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3994 (buf!3674 bs1!10)) (bvadd (currentByte!6720 bs1!10) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!242077)))))))) (tuple2!13779 Unit!9800 lt!242076))) (BitStream!5601 (buf!3674 bs1!10) (bvadd (currentByte!6720 bs1!10) #b00000000000000000000000000000001) (currentBit!6715 bs1!10))))))

(declare-fun b!155592 () Bool)

(declare-fun e!104815 () Bool)

(assert (=> b!155592 (= e!104816 e!104815)))

(declare-fun res!130154 () Bool)

(assert (=> b!155592 (=> (not res!130154) (not e!104815))))

(declare-fun lt!242075 () tuple2!13772)

(assert (=> b!155592 (= res!130154 (= (buf!3674 (_2!7306 lt!242075)) (buf!3674 bs1!10)))))

(declare-fun lt!242073 () (_ BitVec 8))

(declare-fun lt!242079 () (_ BitVec 8))

(declare-fun Unit!9801 () Unit!9785)

(declare-fun Unit!9802 () Unit!9785)

(assert (=> b!155592 (= lt!242075 (tuple2!13773 (_2!7309 (ite (bvsgt ((_ sign_extend 24) lt!242079) #b00000000000000000000000000000000) (tuple2!13779 Unit!9801 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!242073) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3994 (buf!3674 bs1!10)) (bvadd (currentByte!6720 bs1!10) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!242079)))))))) (tuple2!13779 Unit!9802 lt!242073))) (BitStream!5601 (buf!3674 bs1!10) (bvadd (currentByte!6720 bs1!10) #b00000000000000000000000000000001) (currentBit!6715 bs1!10))))))

(assert (=> b!155592 (= lt!242073 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3994 (buf!3674 bs1!10)) (currentByte!6720 bs1!10))) ((_ sign_extend 24) lt!242079))))))

(assert (=> b!155592 (= lt!242079 ((_ extract 7 0) (currentBit!6715 bs1!10)))))

(declare-fun lt!242078 () (_ BitVec 64))

(declare-fun b!155593 () Bool)

(declare-fun lt!242074 () (_ BitVec 64))

(assert (=> b!155593 (= e!104815 (= (bitIndex!0 (size!3171 (buf!3674 (_2!7306 lt!242075))) (currentByte!6720 (_2!7306 lt!242075)) (currentBit!6715 (_2!7306 lt!242075))) (bvadd lt!242078 lt!242074)))))

(assert (=> b!155593 (or (not (= (bvand lt!242078 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!242074 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!242078 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!242078 lt!242074) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!155593 (= lt!242074 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!155593 (= lt!242078 (bitIndex!0 (size!3171 (buf!3674 bs1!10)) (currentByte!6720 bs1!10) (currentBit!6715 bs1!10)))))

(assert (= (and d!51436 res!130153) b!155592))

(assert (= (and b!155592 res!130154) b!155593))

(assert (=> d!51436 m!241461))

(declare-fun m!241691 () Bool)

(assert (=> d!51436 m!241691))

(declare-fun m!241693 () Bool)

(assert (=> d!51436 m!241693))

(assert (=> b!155592 m!241693))

(assert (=> b!155592 m!241461))

(declare-fun m!241695 () Bool)

(assert (=> b!155593 m!241695))

(assert (=> b!155593 m!241455))

(assert (=> d!51368 d!51436))

(declare-fun d!51450 () Bool)

(declare-fun res!130155 () Bool)

(declare-fun e!104817 () Bool)

(assert (=> d!51450 (=> res!130155 e!104817)))

(assert (=> d!51450 (= res!130155 (= (_1!7303 lt!241939) (_2!7303 lt!241939)))))

(assert (=> d!51450 (= (arrayRangesEq!409 (buf!3674 bs1!10) (buf!3674 bs2!18) (_1!7303 lt!241939) (_2!7303 lt!241939)) e!104817)))

(declare-fun b!155594 () Bool)

(declare-fun e!104818 () Bool)

(assert (=> b!155594 (= e!104817 e!104818)))

(declare-fun res!130156 () Bool)

(assert (=> b!155594 (=> (not res!130156) (not e!104818))))

(assert (=> b!155594 (= res!130156 (= (select (arr!3994 (buf!3674 bs1!10)) (_1!7303 lt!241939)) (select (arr!3994 (buf!3674 bs2!18)) (_1!7303 lt!241939))))))

(declare-fun b!155595 () Bool)

(assert (=> b!155595 (= e!104818 (arrayRangesEq!409 (buf!3674 bs1!10) (buf!3674 bs2!18) (bvadd (_1!7303 lt!241939) #b00000000000000000000000000000001) (_2!7303 lt!241939)))))

(assert (= (and d!51450 (not res!130155)) b!155594))

(assert (= (and b!155594 res!130156) b!155595))

(declare-fun m!241697 () Bool)

(assert (=> b!155594 m!241697))

(declare-fun m!241699 () Bool)

(assert (=> b!155594 m!241699))

(declare-fun m!241701 () Bool)

(assert (=> b!155595 m!241701))

(assert (=> b!155514 d!51450))

(declare-fun d!51452 () Bool)

(assert (=> d!51452 (= (remainingBits!0 ((_ sign_extend 32) (size!3171 (buf!3674 (_1!7300 lt!241841)))) ((_ sign_extend 32) (currentByte!6720 (_1!7300 lt!241841))) ((_ sign_extend 32) (currentBit!6715 (_1!7300 lt!241841)))) (bvsub (bvmul ((_ sign_extend 32) (size!3171 (buf!3674 (_1!7300 lt!241841)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6720 (_1!7300 lt!241841))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6715 (_1!7300 lt!241841))))))))

(assert (=> d!51352 d!51452))

(declare-fun d!51454 () Bool)

(assert (=> d!51454 (= (invariant!0 (currentBit!6715 (_1!7300 lt!241841)) (currentByte!6720 (_1!7300 lt!241841)) (size!3171 (buf!3674 (_1!7300 lt!241841)))) (and (bvsge (currentBit!6715 (_1!7300 lt!241841)) #b00000000000000000000000000000000) (bvslt (currentBit!6715 (_1!7300 lt!241841)) #b00000000000000000000000000001000) (bvsge (currentByte!6720 (_1!7300 lt!241841)) #b00000000000000000000000000000000) (or (bvslt (currentByte!6720 (_1!7300 lt!241841)) (size!3171 (buf!3674 (_1!7300 lt!241841)))) (and (= (currentBit!6715 (_1!7300 lt!241841)) #b00000000000000000000000000000000) (= (currentByte!6720 (_1!7300 lt!241841)) (size!3171 (buf!3674 (_1!7300 lt!241841))))))))))

(assert (=> d!51352 d!51454))

(declare-fun d!51456 () Bool)

(assert (=> d!51456 (= (byteRangesEq!0 (select (arr!3994 (buf!3674 bs1!10)) (_3!418 lt!241939)) (select (arr!3994 (buf!3674 bs2!18)) (_3!418 lt!241939)) lt!241940 #b00000000000000000000000000001000) (or (= lt!241940 #b00000000000000000000000000001000) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!3994 (buf!3674 bs1!10)) (_3!418 lt!241939))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!241940)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!3994 (buf!3674 bs2!18)) (_3!418 lt!241939))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!241940)))) #b00000000000000000000000011111111))))))

(declare-fun bs!12574 () Bool)

(assert (= bs!12574 d!51456))

(declare-fun m!241703 () Bool)

(assert (=> bs!12574 m!241703))

(declare-fun m!241705 () Bool)

(assert (=> bs!12574 m!241705))

(assert (=> b!155513 d!51456))

(declare-fun lt!242083 () (_ BitVec 8))

(declare-fun d!51458 () Bool)

(declare-fun lt!242084 () (_ BitVec 8))

(assert (=> d!51458 (= lt!242083 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3994 (buf!3674 (BitStream!5601 (buf!3674 bs2!18) (currentByte!6720 bs1!10) (currentBit!6715 bs1!10)))) (currentByte!6720 (BitStream!5601 (buf!3674 bs2!18) (currentByte!6720 bs1!10) (currentBit!6715 bs1!10))))) ((_ sign_extend 24) lt!242084))))))

(assert (=> d!51458 (= lt!242084 ((_ extract 7 0) (currentBit!6715 (BitStream!5601 (buf!3674 bs2!18) (currentByte!6720 bs1!10) (currentBit!6715 bs1!10)))))))

(declare-fun e!104820 () Bool)

(assert (=> d!51458 e!104820))

(declare-fun res!130157 () Bool)

(assert (=> d!51458 (=> (not res!130157) (not e!104820))))

(assert (=> d!51458 (= res!130157 (validate_offset_bits!1 ((_ sign_extend 32) (size!3171 (buf!3674 (BitStream!5601 (buf!3674 bs2!18) (currentByte!6720 bs1!10) (currentBit!6715 bs1!10))))) ((_ sign_extend 32) (currentByte!6720 (BitStream!5601 (buf!3674 bs2!18) (currentByte!6720 bs1!10) (currentBit!6715 bs1!10)))) ((_ sign_extend 32) (currentBit!6715 (BitStream!5601 (buf!3674 bs2!18) (currentByte!6720 bs1!10) (currentBit!6715 bs1!10)))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun Unit!9807 () Unit!9785)

(declare-fun Unit!9808 () Unit!9785)

(assert (=> d!51458 (= (readByte!0 (BitStream!5601 (buf!3674 bs2!18) (currentByte!6720 bs1!10) (currentBit!6715 bs1!10))) (tuple2!13773 (_2!7309 (ite (bvsgt ((_ sign_extend 24) lt!242084) #b00000000000000000000000000000000) (tuple2!13779 Unit!9807 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!242083) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3994 (buf!3674 (BitStream!5601 (buf!3674 bs2!18) (currentByte!6720 bs1!10) (currentBit!6715 bs1!10)))) (bvadd (currentByte!6720 (BitStream!5601 (buf!3674 bs2!18) (currentByte!6720 bs1!10) (currentBit!6715 bs1!10))) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!242084)))))))) (tuple2!13779 Unit!9808 lt!242083))) (BitStream!5601 (buf!3674 (BitStream!5601 (buf!3674 bs2!18) (currentByte!6720 bs1!10) (currentBit!6715 bs1!10))) (bvadd (currentByte!6720 (BitStream!5601 (buf!3674 bs2!18) (currentByte!6720 bs1!10) (currentBit!6715 bs1!10))) #b00000000000000000000000000000001) (currentBit!6715 (BitStream!5601 (buf!3674 bs2!18) (currentByte!6720 bs1!10) (currentBit!6715 bs1!10))))))))

(declare-fun b!155596 () Bool)

(declare-fun e!104819 () Bool)

(assert (=> b!155596 (= e!104820 e!104819)))

(declare-fun res!130158 () Bool)

(assert (=> b!155596 (=> (not res!130158) (not e!104819))))

(declare-fun lt!242082 () tuple2!13772)

(assert (=> b!155596 (= res!130158 (= (buf!3674 (_2!7306 lt!242082)) (buf!3674 (BitStream!5601 (buf!3674 bs2!18) (currentByte!6720 bs1!10) (currentBit!6715 bs1!10)))))))

(declare-fun lt!242080 () (_ BitVec 8))

(declare-fun lt!242086 () (_ BitVec 8))

(declare-fun Unit!9809 () Unit!9785)

(declare-fun Unit!9810 () Unit!9785)

(assert (=> b!155596 (= lt!242082 (tuple2!13773 (_2!7309 (ite (bvsgt ((_ sign_extend 24) lt!242086) #b00000000000000000000000000000000) (tuple2!13779 Unit!9809 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!242080) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3994 (buf!3674 (BitStream!5601 (buf!3674 bs2!18) (currentByte!6720 bs1!10) (currentBit!6715 bs1!10)))) (bvadd (currentByte!6720 (BitStream!5601 (buf!3674 bs2!18) (currentByte!6720 bs1!10) (currentBit!6715 bs1!10))) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!242086)))))))) (tuple2!13779 Unit!9810 lt!242080))) (BitStream!5601 (buf!3674 (BitStream!5601 (buf!3674 bs2!18) (currentByte!6720 bs1!10) (currentBit!6715 bs1!10))) (bvadd (currentByte!6720 (BitStream!5601 (buf!3674 bs2!18) (currentByte!6720 bs1!10) (currentBit!6715 bs1!10))) #b00000000000000000000000000000001) (currentBit!6715 (BitStream!5601 (buf!3674 bs2!18) (currentByte!6720 bs1!10) (currentBit!6715 bs1!10))))))))

(assert (=> b!155596 (= lt!242080 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3994 (buf!3674 (BitStream!5601 (buf!3674 bs2!18) (currentByte!6720 bs1!10) (currentBit!6715 bs1!10)))) (currentByte!6720 (BitStream!5601 (buf!3674 bs2!18) (currentByte!6720 bs1!10) (currentBit!6715 bs1!10))))) ((_ sign_extend 24) lt!242086))))))

(assert (=> b!155596 (= lt!242086 ((_ extract 7 0) (currentBit!6715 (BitStream!5601 (buf!3674 bs2!18) (currentByte!6720 bs1!10) (currentBit!6715 bs1!10)))))))

(declare-fun b!155597 () Bool)

(declare-fun lt!242085 () (_ BitVec 64))

(declare-fun lt!242081 () (_ BitVec 64))

(assert (=> b!155597 (= e!104819 (= (bitIndex!0 (size!3171 (buf!3674 (_2!7306 lt!242082))) (currentByte!6720 (_2!7306 lt!242082)) (currentBit!6715 (_2!7306 lt!242082))) (bvadd lt!242085 lt!242081)))))

(assert (=> b!155597 (or (not (= (bvand lt!242085 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!242081 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!242085 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!242085 lt!242081) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!155597 (= lt!242081 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!155597 (= lt!242085 (bitIndex!0 (size!3171 (buf!3674 (BitStream!5601 (buf!3674 bs2!18) (currentByte!6720 bs1!10) (currentBit!6715 bs1!10)))) (currentByte!6720 (BitStream!5601 (buf!3674 bs2!18) (currentByte!6720 bs1!10) (currentBit!6715 bs1!10))) (currentBit!6715 (BitStream!5601 (buf!3674 bs2!18) (currentByte!6720 bs1!10) (currentBit!6715 bs1!10)))))))

(assert (= (and d!51458 res!130157) b!155596))

(assert (= (and b!155596 res!130158) b!155597))

(declare-fun m!241707 () Bool)

(assert (=> d!51458 m!241707))

(declare-fun m!241709 () Bool)

(assert (=> d!51458 m!241709))

(declare-fun m!241711 () Bool)

(assert (=> d!51458 m!241711))

(assert (=> b!155596 m!241711))

(assert (=> b!155596 m!241707))

(declare-fun m!241713 () Bool)

(assert (=> b!155597 m!241713))

(declare-fun m!241715 () Bool)

(assert (=> b!155597 m!241715))

(assert (=> d!51362 d!51458))

(declare-fun d!51460 () Bool)

(assert (=> d!51460 (= (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!241844) (tuple4!231 ((_ extract 31 0) (bvadd (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv lt!241844 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv lt!241844 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!155511 d!51460))

(declare-fun d!51462 () Bool)

(declare-fun res!130159 () Bool)

(declare-fun e!104821 () Bool)

(assert (=> d!51462 (=> res!130159 e!104821)))

(assert (=> d!51462 (= res!130159 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!241845))))

(assert (=> d!51462 (= (arrayRangesEq!409 (buf!3674 bs1!10) (buf!3674 bs2!18) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!241845) e!104821)))

(declare-fun b!155598 () Bool)

(declare-fun e!104822 () Bool)

(assert (=> b!155598 (= e!104821 e!104822)))

(declare-fun res!130160 () Bool)

(assert (=> b!155598 (=> (not res!130160) (not e!104822))))

(assert (=> b!155598 (= res!130160 (= (select (arr!3994 (buf!3674 bs1!10)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!3994 (buf!3674 bs2!18)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!155599 () Bool)

(assert (=> b!155599 (= e!104822 (arrayRangesEq!409 (buf!3674 bs1!10) (buf!3674 bs2!18) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!241845))))

(assert (= (and d!51462 (not res!130159)) b!155598))

(assert (= (and b!155598 res!130160) b!155599))

(declare-fun m!241717 () Bool)

(assert (=> b!155598 m!241717))

(declare-fun m!241719 () Bool)

(assert (=> b!155598 m!241719))

(declare-fun m!241721 () Bool)

(assert (=> b!155599 m!241721))

(assert (=> b!155563 d!51462))

(declare-fun d!51464 () Bool)

(assert (=> d!51464 (= (remainingBits!0 ((_ sign_extend 32) (size!3171 (buf!3674 bs1!10))) ((_ sign_extend 32) (currentByte!6720 bs1!10)) ((_ sign_extend 32) (currentBit!6715 bs1!10))) (bvsub (bvmul ((_ sign_extend 32) (size!3171 (buf!3674 bs1!10))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6720 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6715 bs1!10)))))))

(assert (=> d!51360 d!51464))

(assert (=> d!51360 d!51426))

(declare-fun d!51466 () Bool)

(assert (=> d!51466 (= (remainingBits!0 ((_ sign_extend 32) (size!3171 (buf!3674 (_1!7300 lt!241843)))) ((_ sign_extend 32) (currentByte!6720 (_1!7300 lt!241843))) ((_ sign_extend 32) (currentBit!6715 (_1!7300 lt!241843)))) (bvsub (bvmul ((_ sign_extend 32) (size!3171 (buf!3674 (_1!7300 lt!241843)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6720 (_1!7300 lt!241843))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6715 (_1!7300 lt!241843))))))))

(assert (=> d!51340 d!51466))

(declare-fun d!51468 () Bool)

(assert (=> d!51468 (= (invariant!0 (currentBit!6715 (_1!7300 lt!241843)) (currentByte!6720 (_1!7300 lt!241843)) (size!3171 (buf!3674 (_1!7300 lt!241843)))) (and (bvsge (currentBit!6715 (_1!7300 lt!241843)) #b00000000000000000000000000000000) (bvslt (currentBit!6715 (_1!7300 lt!241843)) #b00000000000000000000000000001000) (bvsge (currentByte!6720 (_1!7300 lt!241843)) #b00000000000000000000000000000000) (or (bvslt (currentByte!6720 (_1!7300 lt!241843)) (size!3171 (buf!3674 (_1!7300 lt!241843)))) (and (= (currentBit!6715 (_1!7300 lt!241843)) #b00000000000000000000000000000000) (= (currentByte!6720 (_1!7300 lt!241843)) (size!3171 (buf!3674 (_1!7300 lt!241843))))))))))

(assert (=> d!51340 d!51468))

(declare-fun d!51470 () Bool)

(assert (=> d!51470 (= (remainingBits!0 ((_ sign_extend 32) (size!3171 (buf!3674 bs2!18))) ((_ sign_extend 32) (currentByte!6720 bs2!18)) ((_ sign_extend 32) (currentBit!6715 bs2!18))) (bvsub (bvmul ((_ sign_extend 32) (size!3171 (buf!3674 bs2!18))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6720 bs2!18)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6715 bs2!18)))))))

(assert (=> d!51370 d!51470))

(assert (=> d!51370 d!51434))

(push 1)

(assert (not d!51458))

(assert (not b!155597))

(assert (not d!51436))

(assert (not b!155595))

(assert (not b!155593))

(assert (not b!155599))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

