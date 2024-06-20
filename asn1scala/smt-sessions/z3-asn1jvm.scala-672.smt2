; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18802 () Bool)

(assert start!18802)

(declare-fun b!93789 () Bool)

(declare-fun res!77357 () Bool)

(declare-fun e!61588 () Bool)

(assert (=> b!93789 (=> (not res!77357) (not e!61588))))

(declare-datatypes ((array!4394 0))(
  ( (array!4395 (arr!2611 (Array (_ BitVec 32) (_ BitVec 8))) (size!1994 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3510 0))(
  ( (BitStream!3511 (buf!2364 array!4394) (currentByte!4706 (_ BitVec 32)) (currentBit!4701 (_ BitVec 32))) )
))
(declare-fun bitStream2!8 () BitStream!3510)

(declare-fun nBits!484 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!93789 (= res!77357 (validate_offset_bits!1 ((_ sign_extend 32) (size!1994 (buf!2364 bitStream2!8))) ((_ sign_extend 32) (currentByte!4706 bitStream2!8)) ((_ sign_extend 32) (currentBit!4701 bitStream2!8)) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!93790 () Bool)

(declare-fun res!77356 () Bool)

(assert (=> b!93790 (=> (not res!77356) (not e!61588))))

(declare-fun bitStream1!8 () BitStream!3510)

(assert (=> b!93790 (= res!77356 (validate_offset_bits!1 ((_ sign_extend 32) (size!1994 (buf!2364 bitStream1!8))) ((_ sign_extend 32) (currentByte!4706 bitStream1!8)) ((_ sign_extend 32) (currentBit!4701 bitStream1!8)) nBits!484))))

(declare-fun b!93791 () Bool)

(declare-fun e!61589 () Bool)

(declare-fun base!8 () BitStream!3510)

(declare-fun array_inv!1820 (array!4394) Bool)

(assert (=> b!93791 (= e!61589 (array_inv!1820 (buf!2364 base!8)))))

(declare-fun b!93792 () Bool)

(declare-fun res!77354 () Bool)

(assert (=> b!93792 (=> (not res!77354) (not e!61588))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!93792 (= res!77354 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!1994 (buf!2364 bitStream1!8)) (currentByte!4706 bitStream1!8) (currentBit!4701 bitStream1!8))) (bitIndex!0 (size!1994 (buf!2364 bitStream2!8)) (currentByte!4706 bitStream2!8) (currentBit!4701 bitStream2!8))))))

(declare-fun b!93793 () Bool)

(declare-fun res!77352 () Bool)

(assert (=> b!93793 (=> (not res!77352) (not e!61588))))

(declare-fun isPrefixOf!0 (BitStream!3510 BitStream!3510) Bool)

(assert (=> b!93793 (= res!77352 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(declare-fun b!93794 () Bool)

(declare-fun e!61585 () Bool)

(declare-fun thiss!1534 () BitStream!3510)

(assert (=> b!93794 (= e!61585 (array_inv!1820 (buf!2364 thiss!1534)))))

(declare-fun b!93795 () Bool)

(declare-fun res!77360 () Bool)

(assert (=> b!93795 (=> (not res!77360) (not e!61588))))

(assert (=> b!93795 (= res!77360 (isPrefixOf!0 bitStream2!8 base!8))))

(declare-fun res!77355 () Bool)

(assert (=> start!18802 (=> (not res!77355) (not e!61588))))

(assert (=> start!18802 (= res!77355 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!18802 e!61588))

(assert (=> start!18802 true))

(declare-fun e!61592 () Bool)

(declare-fun inv!12 (BitStream!3510) Bool)

(assert (=> start!18802 (and (inv!12 bitStream1!8) e!61592)))

(declare-fun e!61590 () Bool)

(assert (=> start!18802 (and (inv!12 bitStream2!8) e!61590)))

(assert (=> start!18802 (and (inv!12 base!8) e!61589)))

(assert (=> start!18802 (and (inv!12 thiss!1534) e!61585)))

(declare-fun b!93796 () Bool)

(declare-fun res!77358 () Bool)

(assert (=> b!93796 (=> (not res!77358) (not e!61588))))

(declare-datatypes ((List!861 0))(
  ( (Nil!858) (Cons!857 (h!976 Bool) (t!1611 List!861)) )
))
(declare-fun listBits!13 () List!861)

(declare-fun length!452 (List!861) Int)

(assert (=> b!93796 (= res!77358 (> (length!452 listBits!13) 0))))

(declare-fun b!93797 () Bool)

(assert (=> b!93797 (= e!61590 (array_inv!1820 (buf!2364 bitStream2!8)))))

(declare-fun b!93798 () Bool)

(declare-fun res!77359 () Bool)

(assert (=> b!93798 (=> (not res!77359) (not e!61588))))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!3510 BitStream!3510 (_ BitVec 64)) List!861)

(assert (=> b!93798 (= res!77359 (= listBits!13 (bitStreamReadBitsIntoList!0 thiss!1534 bitStream1!8 nBits!484)))))

(declare-fun b!93799 () Bool)

(assert (=> b!93799 (= e!61588 (and (= nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001) (= listBits!13 Nil!858)))))

(declare-fun b!93800 () Bool)

(declare-fun res!77351 () Bool)

(assert (=> b!93800 (=> (not res!77351) (not e!61588))))

(assert (=> b!93800 (= res!77351 (and (= (buf!2364 bitStream1!8) (buf!2364 bitStream2!8)) (= (buf!2364 bitStream1!8) (buf!2364 base!8))))))

(declare-fun b!93801 () Bool)

(declare-fun res!77353 () Bool)

(assert (=> b!93801 (=> (not res!77353) (not e!61588))))

(assert (=> b!93801 (= res!77353 (bvslt (bitIndex!0 (size!1994 (buf!2364 base!8)) (currentByte!4706 base!8) (currentBit!4701 base!8)) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484)))))

(declare-fun b!93802 () Bool)

(declare-fun res!77361 () Bool)

(assert (=> b!93802 (=> (not res!77361) (not e!61588))))

(assert (=> b!93802 (= res!77361 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun b!93803 () Bool)

(assert (=> b!93803 (= e!61592 (array_inv!1820 (buf!2364 bitStream1!8)))))

(assert (= (and start!18802 res!77355) b!93796))

(assert (= (and b!93796 res!77358) b!93802))

(assert (= (and b!93802 res!77361) b!93795))

(assert (= (and b!93795 res!77360) b!93793))

(assert (= (and b!93793 res!77352) b!93800))

(assert (= (and b!93800 res!77351) b!93801))

(assert (= (and b!93801 res!77353) b!93792))

(assert (= (and b!93792 res!77354) b!93790))

(assert (= (and b!93790 res!77356) b!93789))

(assert (= (and b!93789 res!77357) b!93798))

(assert (= (and b!93798 res!77359) b!93799))

(assert (= start!18802 b!93803))

(assert (= start!18802 b!93797))

(assert (= start!18802 b!93791))

(assert (= start!18802 b!93794))

(declare-fun m!137513 () Bool)

(assert (=> b!93798 m!137513))

(declare-fun m!137515 () Bool)

(assert (=> b!93790 m!137515))

(declare-fun m!137517 () Bool)

(assert (=> start!18802 m!137517))

(declare-fun m!137519 () Bool)

(assert (=> start!18802 m!137519))

(declare-fun m!137521 () Bool)

(assert (=> start!18802 m!137521))

(declare-fun m!137523 () Bool)

(assert (=> start!18802 m!137523))

(declare-fun m!137525 () Bool)

(assert (=> b!93793 m!137525))

(declare-fun m!137527 () Bool)

(assert (=> b!93789 m!137527))

(declare-fun m!137529 () Bool)

(assert (=> b!93803 m!137529))

(declare-fun m!137531 () Bool)

(assert (=> b!93794 m!137531))

(declare-fun m!137533 () Bool)

(assert (=> b!93801 m!137533))

(declare-fun m!137535 () Bool)

(assert (=> b!93791 m!137535))

(declare-fun m!137537 () Bool)

(assert (=> b!93797 m!137537))

(declare-fun m!137539 () Bool)

(assert (=> b!93792 m!137539))

(declare-fun m!137541 () Bool)

(assert (=> b!93792 m!137541))

(declare-fun m!137543 () Bool)

(assert (=> b!93796 m!137543))

(declare-fun m!137545 () Bool)

(assert (=> b!93802 m!137545))

(declare-fun m!137547 () Bool)

(assert (=> b!93795 m!137547))

(check-sat (not b!93801) (not b!93792) (not b!93789) (not start!18802) (not b!93795) (not b!93798) (not b!93802) (not b!93794) (not b!93796) (not b!93793) (not b!93791) (not b!93797) (not b!93790) (not b!93803))
(check-sat)
(get-model)

(declare-fun d!29098 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!29098 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1994 (buf!2364 bitStream2!8))) ((_ sign_extend 32) (currentByte!4706 bitStream2!8)) ((_ sign_extend 32) (currentBit!4701 bitStream2!8)) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1994 (buf!2364 bitStream2!8))) ((_ sign_extend 32) (currentByte!4706 bitStream2!8)) ((_ sign_extend 32) (currentBit!4701 bitStream2!8))) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!7166 () Bool)

(assert (= bs!7166 d!29098))

(declare-fun m!137585 () Bool)

(assert (=> bs!7166 m!137585))

(assert (=> b!93789 d!29098))

(declare-fun b!93859 () Bool)

(declare-fun e!61626 () Bool)

(declare-fun lt!138488 () List!861)

(declare-fun isEmpty!247 (List!861) Bool)

(assert (=> b!93859 (= e!61626 (isEmpty!247 lt!138488))))

(declare-fun lt!138487 () (_ BitVec 64))

(declare-datatypes ((tuple2!7618 0))(
  ( (tuple2!7619 (_1!4056 List!861) (_2!4056 BitStream!3510)) )
))
(declare-fun e!61625 () tuple2!7618)

(declare-fun b!93858 () Bool)

(declare-datatypes ((tuple2!7620 0))(
  ( (tuple2!7621 (_1!4057 Bool) (_2!4057 BitStream!3510)) )
))
(declare-fun lt!138489 () tuple2!7620)

(assert (=> b!93858 (= e!61625 (tuple2!7619 (Cons!857 (_1!4057 lt!138489) (bitStreamReadBitsIntoList!0 thiss!1534 (_2!4057 lt!138489) (bvsub nBits!484 lt!138487))) (_2!4057 lt!138489)))))

(declare-fun readBit!0 (BitStream!3510) tuple2!7620)

(assert (=> b!93858 (= lt!138489 (readBit!0 bitStream1!8))))

(assert (=> b!93858 (= lt!138487 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!93857 () Bool)

(assert (=> b!93857 (= e!61625 (tuple2!7619 Nil!858 bitStream1!8))))

(declare-fun d!29100 () Bool)

(assert (=> d!29100 e!61626))

(declare-fun c!5907 () Bool)

(assert (=> d!29100 (= c!5907 (= nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!29100 (= lt!138488 (_1!4056 e!61625))))

(declare-fun c!5906 () Bool)

(assert (=> d!29100 (= c!5906 (= nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!29100 (bvsge nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!29100 (= (bitStreamReadBitsIntoList!0 thiss!1534 bitStream1!8 nBits!484) lt!138488)))

(declare-fun b!93860 () Bool)

(assert (=> b!93860 (= e!61626 (> (length!452 lt!138488) 0))))

(assert (= (and d!29100 c!5906) b!93857))

(assert (= (and d!29100 (not c!5906)) b!93858))

(assert (= (and d!29100 c!5907) b!93859))

(assert (= (and d!29100 (not c!5907)) b!93860))

(declare-fun m!137587 () Bool)

(assert (=> b!93859 m!137587))

(declare-fun m!137589 () Bool)

(assert (=> b!93858 m!137589))

(declare-fun m!137591 () Bool)

(assert (=> b!93858 m!137591))

(declare-fun m!137593 () Bool)

(assert (=> b!93860 m!137593))

(assert (=> b!93798 d!29100))

(declare-fun d!29104 () Bool)

(assert (=> d!29104 (= (array_inv!1820 (buf!2364 bitStream1!8)) (bvsge (size!1994 (buf!2364 bitStream1!8)) #b00000000000000000000000000000000))))

(assert (=> b!93803 d!29104))

(declare-fun d!29106 () Bool)

(declare-fun e!61636 () Bool)

(assert (=> d!29106 e!61636))

(declare-fun res!77412 () Bool)

(assert (=> d!29106 (=> (not res!77412) (not e!61636))))

(declare-fun lt!138524 () (_ BitVec 64))

(declare-fun lt!138521 () (_ BitVec 64))

(declare-fun lt!138520 () (_ BitVec 64))

(assert (=> d!29106 (= res!77412 (= lt!138524 (bvsub lt!138521 lt!138520)))))

(assert (=> d!29106 (or (= (bvand lt!138521 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!138520 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!138521 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!138521 lt!138520) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!29106 (= lt!138520 (remainingBits!0 ((_ sign_extend 32) (size!1994 (buf!2364 bitStream1!8))) ((_ sign_extend 32) (currentByte!4706 bitStream1!8)) ((_ sign_extend 32) (currentBit!4701 bitStream1!8))))))

(declare-fun lt!138523 () (_ BitVec 64))

(declare-fun lt!138525 () (_ BitVec 64))

(assert (=> d!29106 (= lt!138521 (bvmul lt!138523 lt!138525))))

(assert (=> d!29106 (or (= lt!138523 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!138525 (bvsdiv (bvmul lt!138523 lt!138525) lt!138523)))))

(assert (=> d!29106 (= lt!138525 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!29106 (= lt!138523 ((_ sign_extend 32) (size!1994 (buf!2364 bitStream1!8))))))

(assert (=> d!29106 (= lt!138524 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4706 bitStream1!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4701 bitStream1!8))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!29106 (invariant!0 (currentBit!4701 bitStream1!8) (currentByte!4706 bitStream1!8) (size!1994 (buf!2364 bitStream1!8)))))

(assert (=> d!29106 (= (bitIndex!0 (size!1994 (buf!2364 bitStream1!8)) (currentByte!4706 bitStream1!8) (currentBit!4701 bitStream1!8)) lt!138524)))

(declare-fun b!93877 () Bool)

(declare-fun res!77411 () Bool)

(assert (=> b!93877 (=> (not res!77411) (not e!61636))))

(assert (=> b!93877 (= res!77411 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!138524))))

(declare-fun b!93878 () Bool)

(declare-fun lt!138522 () (_ BitVec 64))

(assert (=> b!93878 (= e!61636 (bvsle lt!138524 (bvmul lt!138522 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!93878 (or (= lt!138522 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!138522 #b0000000000000000000000000000000000000000000000000000000000001000) lt!138522)))))

(assert (=> b!93878 (= lt!138522 ((_ sign_extend 32) (size!1994 (buf!2364 bitStream1!8))))))

(assert (= (and d!29106 res!77412) b!93877))

(assert (= (and b!93877 res!77411) b!93878))

(declare-fun m!137603 () Bool)

(assert (=> d!29106 m!137603))

(declare-fun m!137605 () Bool)

(assert (=> d!29106 m!137605))

(assert (=> b!93792 d!29106))

(declare-fun d!29116 () Bool)

(declare-fun e!61637 () Bool)

(assert (=> d!29116 e!61637))

(declare-fun res!77414 () Bool)

(assert (=> d!29116 (=> (not res!77414) (not e!61637))))

(declare-fun lt!138527 () (_ BitVec 64))

(declare-fun lt!138526 () (_ BitVec 64))

(declare-fun lt!138530 () (_ BitVec 64))

(assert (=> d!29116 (= res!77414 (= lt!138530 (bvsub lt!138527 lt!138526)))))

(assert (=> d!29116 (or (= (bvand lt!138527 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!138526 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!138527 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!138527 lt!138526) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!29116 (= lt!138526 (remainingBits!0 ((_ sign_extend 32) (size!1994 (buf!2364 bitStream2!8))) ((_ sign_extend 32) (currentByte!4706 bitStream2!8)) ((_ sign_extend 32) (currentBit!4701 bitStream2!8))))))

(declare-fun lt!138529 () (_ BitVec 64))

(declare-fun lt!138531 () (_ BitVec 64))

(assert (=> d!29116 (= lt!138527 (bvmul lt!138529 lt!138531))))

(assert (=> d!29116 (or (= lt!138529 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!138531 (bvsdiv (bvmul lt!138529 lt!138531) lt!138529)))))

(assert (=> d!29116 (= lt!138531 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!29116 (= lt!138529 ((_ sign_extend 32) (size!1994 (buf!2364 bitStream2!8))))))

(assert (=> d!29116 (= lt!138530 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4706 bitStream2!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4701 bitStream2!8))))))

(assert (=> d!29116 (invariant!0 (currentBit!4701 bitStream2!8) (currentByte!4706 bitStream2!8) (size!1994 (buf!2364 bitStream2!8)))))

(assert (=> d!29116 (= (bitIndex!0 (size!1994 (buf!2364 bitStream2!8)) (currentByte!4706 bitStream2!8) (currentBit!4701 bitStream2!8)) lt!138530)))

(declare-fun b!93879 () Bool)

(declare-fun res!77413 () Bool)

(assert (=> b!93879 (=> (not res!77413) (not e!61637))))

(assert (=> b!93879 (= res!77413 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!138530))))

(declare-fun b!93880 () Bool)

(declare-fun lt!138528 () (_ BitVec 64))

(assert (=> b!93880 (= e!61637 (bvsle lt!138530 (bvmul lt!138528 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!93880 (or (= lt!138528 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!138528 #b0000000000000000000000000000000000000000000000000000000000001000) lt!138528)))))

(assert (=> b!93880 (= lt!138528 ((_ sign_extend 32) (size!1994 (buf!2364 bitStream2!8))))))

(assert (= (and d!29116 res!77414) b!93879))

(assert (= (and b!93879 res!77413) b!93880))

(assert (=> d!29116 m!137585))

(declare-fun m!137607 () Bool)

(assert (=> d!29116 m!137607))

(assert (=> b!93792 d!29116))

(declare-fun d!29120 () Bool)

(declare-fun res!77430 () Bool)

(declare-fun e!61646 () Bool)

(assert (=> d!29120 (=> (not res!77430) (not e!61646))))

(assert (=> d!29120 (= res!77430 (= (size!1994 (buf!2364 bitStream1!8)) (size!1994 (buf!2364 base!8))))))

(assert (=> d!29120 (= (isPrefixOf!0 bitStream1!8 base!8) e!61646)))

(declare-fun b!93894 () Bool)

(declare-fun res!77428 () Bool)

(assert (=> b!93894 (=> (not res!77428) (not e!61646))))

(assert (=> b!93894 (= res!77428 (bvsle (bitIndex!0 (size!1994 (buf!2364 bitStream1!8)) (currentByte!4706 bitStream1!8) (currentBit!4701 bitStream1!8)) (bitIndex!0 (size!1994 (buf!2364 base!8)) (currentByte!4706 base!8) (currentBit!4701 base!8))))))

(declare-fun b!93895 () Bool)

(declare-fun e!61647 () Bool)

(assert (=> b!93895 (= e!61646 e!61647)))

(declare-fun res!77429 () Bool)

(assert (=> b!93895 (=> res!77429 e!61647)))

(assert (=> b!93895 (= res!77429 (= (size!1994 (buf!2364 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!93896 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4394 array!4394 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!93896 (= e!61647 (arrayBitRangesEq!0 (buf!2364 bitStream1!8) (buf!2364 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1994 (buf!2364 bitStream1!8)) (currentByte!4706 bitStream1!8) (currentBit!4701 bitStream1!8))))))

(assert (= (and d!29120 res!77430) b!93894))

(assert (= (and b!93894 res!77428) b!93895))

(assert (= (and b!93895 (not res!77429)) b!93896))

(assert (=> b!93894 m!137539))

(assert (=> b!93894 m!137533))

(assert (=> b!93896 m!137539))

(assert (=> b!93896 m!137539))

(declare-fun m!137621 () Bool)

(assert (=> b!93896 m!137621))

(assert (=> b!93802 d!29120))

(declare-fun d!29136 () Bool)

(assert (=> d!29136 (= (array_inv!1820 (buf!2364 base!8)) (bvsge (size!1994 (buf!2364 base!8)) #b00000000000000000000000000000000))))

(assert (=> b!93791 d!29136))

(declare-fun d!29138 () Bool)

(declare-fun e!61648 () Bool)

(assert (=> d!29138 e!61648))

(declare-fun res!77432 () Bool)

(assert (=> d!29138 (=> (not res!77432) (not e!61648))))

(declare-fun lt!138544 () (_ BitVec 64))

(declare-fun lt!138548 () (_ BitVec 64))

(declare-fun lt!138545 () (_ BitVec 64))

(assert (=> d!29138 (= res!77432 (= lt!138548 (bvsub lt!138545 lt!138544)))))

(assert (=> d!29138 (or (= (bvand lt!138545 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!138544 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!138545 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!138545 lt!138544) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!29138 (= lt!138544 (remainingBits!0 ((_ sign_extend 32) (size!1994 (buf!2364 base!8))) ((_ sign_extend 32) (currentByte!4706 base!8)) ((_ sign_extend 32) (currentBit!4701 base!8))))))

(declare-fun lt!138547 () (_ BitVec 64))

(declare-fun lt!138549 () (_ BitVec 64))

(assert (=> d!29138 (= lt!138545 (bvmul lt!138547 lt!138549))))

(assert (=> d!29138 (or (= lt!138547 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!138549 (bvsdiv (bvmul lt!138547 lt!138549) lt!138547)))))

(assert (=> d!29138 (= lt!138549 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!29138 (= lt!138547 ((_ sign_extend 32) (size!1994 (buf!2364 base!8))))))

(assert (=> d!29138 (= lt!138548 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4706 base!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4701 base!8))))))

(assert (=> d!29138 (invariant!0 (currentBit!4701 base!8) (currentByte!4706 base!8) (size!1994 (buf!2364 base!8)))))

(assert (=> d!29138 (= (bitIndex!0 (size!1994 (buf!2364 base!8)) (currentByte!4706 base!8) (currentBit!4701 base!8)) lt!138548)))

(declare-fun b!93897 () Bool)

(declare-fun res!77431 () Bool)

(assert (=> b!93897 (=> (not res!77431) (not e!61648))))

(assert (=> b!93897 (= res!77431 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!138548))))

(declare-fun b!93898 () Bool)

(declare-fun lt!138546 () (_ BitVec 64))

(assert (=> b!93898 (= e!61648 (bvsle lt!138548 (bvmul lt!138546 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!93898 (or (= lt!138546 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!138546 #b0000000000000000000000000000000000000000000000000000000000001000) lt!138546)))))

(assert (=> b!93898 (= lt!138546 ((_ sign_extend 32) (size!1994 (buf!2364 base!8))))))

(assert (= (and d!29138 res!77432) b!93897))

(assert (= (and b!93897 res!77431) b!93898))

(declare-fun m!137623 () Bool)

(assert (=> d!29138 m!137623))

(declare-fun m!137625 () Bool)

(assert (=> d!29138 m!137625))

(assert (=> b!93801 d!29138))

(declare-fun d!29140 () Bool)

(assert (=> d!29140 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1994 (buf!2364 bitStream1!8))) ((_ sign_extend 32) (currentByte!4706 bitStream1!8)) ((_ sign_extend 32) (currentBit!4701 bitStream1!8)) nBits!484) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1994 (buf!2364 bitStream1!8))) ((_ sign_extend 32) (currentByte!4706 bitStream1!8)) ((_ sign_extend 32) (currentBit!4701 bitStream1!8))) nBits!484))))

(declare-fun bs!7171 () Bool)

(assert (= bs!7171 d!29140))

(assert (=> bs!7171 m!137603))

(assert (=> b!93790 d!29140))

(declare-fun d!29142 () Bool)

(declare-fun res!77439 () Bool)

(declare-fun e!61651 () Bool)

(assert (=> d!29142 (=> (not res!77439) (not e!61651))))

(assert (=> d!29142 (= res!77439 (= (size!1994 (buf!2364 bitStream2!8)) (size!1994 (buf!2364 base!8))))))

(assert (=> d!29142 (= (isPrefixOf!0 bitStream2!8 base!8) e!61651)))

(declare-fun b!93903 () Bool)

(declare-fun res!77437 () Bool)

(assert (=> b!93903 (=> (not res!77437) (not e!61651))))

(assert (=> b!93903 (= res!77437 (bvsle (bitIndex!0 (size!1994 (buf!2364 bitStream2!8)) (currentByte!4706 bitStream2!8) (currentBit!4701 bitStream2!8)) (bitIndex!0 (size!1994 (buf!2364 base!8)) (currentByte!4706 base!8) (currentBit!4701 base!8))))))

(declare-fun b!93904 () Bool)

(declare-fun e!61652 () Bool)

(assert (=> b!93904 (= e!61651 e!61652)))

(declare-fun res!77438 () Bool)

(assert (=> b!93904 (=> res!77438 e!61652)))

(assert (=> b!93904 (= res!77438 (= (size!1994 (buf!2364 bitStream2!8)) #b00000000000000000000000000000000))))

(declare-fun b!93905 () Bool)

(assert (=> b!93905 (= e!61652 (arrayBitRangesEq!0 (buf!2364 bitStream2!8) (buf!2364 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1994 (buf!2364 bitStream2!8)) (currentByte!4706 bitStream2!8) (currentBit!4701 bitStream2!8))))))

(assert (= (and d!29142 res!77439) b!93903))

(assert (= (and b!93903 res!77437) b!93904))

(assert (= (and b!93904 (not res!77438)) b!93905))

(assert (=> b!93903 m!137541))

(assert (=> b!93903 m!137533))

(assert (=> b!93905 m!137541))

(assert (=> b!93905 m!137541))

(declare-fun m!137627 () Bool)

(assert (=> b!93905 m!137627))

(assert (=> b!93795 d!29142))

(declare-fun d!29144 () Bool)

(assert (=> d!29144 (= (array_inv!1820 (buf!2364 thiss!1534)) (bvsge (size!1994 (buf!2364 thiss!1534)) #b00000000000000000000000000000000))))

(assert (=> b!93794 d!29144))

(declare-fun d!29146 () Bool)

(assert (=> d!29146 (= (inv!12 bitStream1!8) (invariant!0 (currentBit!4701 bitStream1!8) (currentByte!4706 bitStream1!8) (size!1994 (buf!2364 bitStream1!8))))))

(declare-fun bs!7172 () Bool)

(assert (= bs!7172 d!29146))

(assert (=> bs!7172 m!137605))

(assert (=> start!18802 d!29146))

(declare-fun d!29148 () Bool)

(assert (=> d!29148 (= (inv!12 bitStream2!8) (invariant!0 (currentBit!4701 bitStream2!8) (currentByte!4706 bitStream2!8) (size!1994 (buf!2364 bitStream2!8))))))

(declare-fun bs!7173 () Bool)

(assert (= bs!7173 d!29148))

(assert (=> bs!7173 m!137607))

(assert (=> start!18802 d!29148))

(declare-fun d!29150 () Bool)

(assert (=> d!29150 (= (inv!12 base!8) (invariant!0 (currentBit!4701 base!8) (currentByte!4706 base!8) (size!1994 (buf!2364 base!8))))))

(declare-fun bs!7174 () Bool)

(assert (= bs!7174 d!29150))

(assert (=> bs!7174 m!137625))

(assert (=> start!18802 d!29150))

(declare-fun d!29152 () Bool)

(assert (=> d!29152 (= (inv!12 thiss!1534) (invariant!0 (currentBit!4701 thiss!1534) (currentByte!4706 thiss!1534) (size!1994 (buf!2364 thiss!1534))))))

(declare-fun bs!7175 () Bool)

(assert (= bs!7175 d!29152))

(declare-fun m!137629 () Bool)

(assert (=> bs!7175 m!137629))

(assert (=> start!18802 d!29152))

(declare-fun d!29154 () Bool)

(declare-fun res!77444 () Bool)

(declare-fun e!61655 () Bool)

(assert (=> d!29154 (=> (not res!77444) (not e!61655))))

(assert (=> d!29154 (= res!77444 (= (size!1994 (buf!2364 bitStream1!8)) (size!1994 (buf!2364 bitStream2!8))))))

(assert (=> d!29154 (= (isPrefixOf!0 bitStream1!8 bitStream2!8) e!61655)))

(declare-fun b!93908 () Bool)

(declare-fun res!77442 () Bool)

(assert (=> b!93908 (=> (not res!77442) (not e!61655))))

(assert (=> b!93908 (= res!77442 (bvsle (bitIndex!0 (size!1994 (buf!2364 bitStream1!8)) (currentByte!4706 bitStream1!8) (currentBit!4701 bitStream1!8)) (bitIndex!0 (size!1994 (buf!2364 bitStream2!8)) (currentByte!4706 bitStream2!8) (currentBit!4701 bitStream2!8))))))

(declare-fun b!93909 () Bool)

(declare-fun e!61656 () Bool)

(assert (=> b!93909 (= e!61655 e!61656)))

(declare-fun res!77443 () Bool)

(assert (=> b!93909 (=> res!77443 e!61656)))

(assert (=> b!93909 (= res!77443 (= (size!1994 (buf!2364 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!93910 () Bool)

(assert (=> b!93910 (= e!61656 (arrayBitRangesEq!0 (buf!2364 bitStream1!8) (buf!2364 bitStream2!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1994 (buf!2364 bitStream1!8)) (currentByte!4706 bitStream1!8) (currentBit!4701 bitStream1!8))))))

(assert (= (and d!29154 res!77444) b!93908))

(assert (= (and b!93908 res!77442) b!93909))

(assert (= (and b!93909 (not res!77443)) b!93910))

(assert (=> b!93908 m!137539))

(assert (=> b!93908 m!137541))

(assert (=> b!93910 m!137539))

(assert (=> b!93910 m!137539))

(declare-fun m!137631 () Bool)

(assert (=> b!93910 m!137631))

(assert (=> b!93793 d!29154))

(declare-fun d!29156 () Bool)

(assert (=> d!29156 (= (array_inv!1820 (buf!2364 bitStream2!8)) (bvsge (size!1994 (buf!2364 bitStream2!8)) #b00000000000000000000000000000000))))

(assert (=> b!93797 d!29156))

(declare-fun d!29158 () Bool)

(declare-fun size!1997 (List!861) Int)

(assert (=> d!29158 (= (length!452 listBits!13) (size!1997 listBits!13))))

(declare-fun bs!7177 () Bool)

(assert (= bs!7177 d!29158))

(declare-fun m!137635 () Bool)

(assert (=> bs!7177 m!137635))

(assert (=> b!93796 d!29158))

(check-sat (not d!29106) (not b!93860) (not b!93905) (not d!29148) (not b!93903) (not d!29140) (not d!29150) (not d!29116) (not d!29158) (not d!29138) (not b!93894) (not b!93858) (not d!29146) (not b!93908) (not d!29152) (not b!93896) (not b!93859) (not d!29098) (not b!93910))
