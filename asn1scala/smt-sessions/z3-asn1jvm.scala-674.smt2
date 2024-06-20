; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18904 () Bool)

(assert start!18904)

(declare-fun b!94290 () Bool)

(declare-fun res!77708 () Bool)

(declare-fun e!61879 () Bool)

(assert (=> b!94290 (=> (not res!77708) (not e!61879))))

(declare-fun nBits!484 () (_ BitVec 64))

(declare-datatypes ((array!4412 0))(
  ( (array!4413 (arr!2617 (Array (_ BitVec 32) (_ BitVec 8))) (size!2006 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3522 0))(
  ( (BitStream!3523 (buf!2370 array!4412) (currentByte!4727 (_ BitVec 32)) (currentBit!4722 (_ BitVec 32))) )
))
(declare-fun bitStream1!8 () BitStream!3522)

(declare-datatypes ((List!867 0))(
  ( (Nil!864) (Cons!863 (h!982 Bool) (t!1617 List!867)) )
))
(declare-fun listBits!13 () List!867)

(declare-fun thiss!1534 () BitStream!3522)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!3522 BitStream!3522 (_ BitVec 64)) List!867)

(assert (=> b!94290 (= res!77708 (= listBits!13 (bitStreamReadBitsIntoList!0 thiss!1534 bitStream1!8 nBits!484)))))

(declare-fun b!94291 () Bool)

(declare-fun res!77713 () Bool)

(assert (=> b!94291 (=> (not res!77713) (not e!61879))))

(declare-fun base!8 () BitStream!3522)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!94291 (= res!77713 (bvslt (bitIndex!0 (size!2006 (buf!2370 base!8)) (currentByte!4727 base!8) (currentBit!4722 base!8)) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484)))))

(declare-fun b!94292 () Bool)

(declare-fun e!61880 () Bool)

(declare-fun array_inv!1826 (array!4412) Bool)

(assert (=> b!94292 (= e!61880 (array_inv!1826 (buf!2370 thiss!1534)))))

(declare-fun b!94293 () Bool)

(declare-fun res!77714 () Bool)

(assert (=> b!94293 (=> (not res!77714) (not e!61879))))

(declare-fun bitStream2!8 () BitStream!3522)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!94293 (= res!77714 (validate_offset_bits!1 ((_ sign_extend 32) (size!2006 (buf!2370 bitStream2!8))) ((_ sign_extend 32) (currentByte!4727 bitStream2!8)) ((_ sign_extend 32) (currentBit!4722 bitStream2!8)) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!94294 () Bool)

(declare-fun e!61873 () Bool)

(assert (=> b!94294 (= e!61873 (array_inv!1826 (buf!2370 bitStream2!8)))))

(declare-fun b!94295 () Bool)

(declare-fun res!77717 () Bool)

(assert (=> b!94295 (=> (not res!77717) (not e!61879))))

(assert (=> b!94295 (= res!77717 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!2006 (buf!2370 bitStream1!8)) (currentByte!4727 bitStream1!8) (currentBit!4722 bitStream1!8))) (bitIndex!0 (size!2006 (buf!2370 bitStream2!8)) (currentByte!4727 bitStream2!8) (currentBit!4722 bitStream2!8))))))

(declare-fun b!94296 () Bool)

(declare-fun res!77710 () Bool)

(assert (=> b!94296 (=> (not res!77710) (not e!61879))))

(declare-fun isPrefixOf!0 (BitStream!3522 BitStream!3522) Bool)

(assert (=> b!94296 (= res!77710 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun b!94297 () Bool)

(declare-fun res!77709 () Bool)

(assert (=> b!94297 (=> (not res!77709) (not e!61879))))

(assert (=> b!94297 (= res!77709 (validate_offset_bits!1 ((_ sign_extend 32) (size!2006 (buf!2370 bitStream1!8))) ((_ sign_extend 32) (currentByte!4727 bitStream1!8)) ((_ sign_extend 32) (currentBit!4722 bitStream1!8)) nBits!484))))

(declare-fun b!94298 () Bool)

(declare-fun e!61877 () Bool)

(assert (=> b!94298 (= e!61877 (array_inv!1826 (buf!2370 base!8)))))

(declare-fun b!94299 () Bool)

(declare-fun e!61876 () Bool)

(assert (=> b!94299 (= e!61876 (array_inv!1826 (buf!2370 bitStream1!8)))))

(declare-fun res!77716 () Bool)

(assert (=> start!18904 (=> (not res!77716) (not e!61879))))

(assert (=> start!18904 (= res!77716 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!18904 e!61879))

(assert (=> start!18904 true))

(declare-fun inv!12 (BitStream!3522) Bool)

(assert (=> start!18904 (and (inv!12 bitStream1!8) e!61876)))

(assert (=> start!18904 (and (inv!12 bitStream2!8) e!61873)))

(assert (=> start!18904 (and (inv!12 base!8) e!61877)))

(assert (=> start!18904 (and (inv!12 thiss!1534) e!61880)))

(declare-fun b!94300 () Bool)

(declare-fun res!77718 () Bool)

(assert (=> b!94300 (=> (not res!77718) (not e!61879))))

(assert (=> b!94300 (= res!77718 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(declare-fun b!94301 () Bool)

(declare-fun res!77711 () Bool)

(assert (=> b!94301 (=> (not res!77711) (not e!61879))))

(declare-fun length!458 (List!867) Int)

(assert (=> b!94301 (= res!77711 (> (length!458 listBits!13) 0))))

(declare-fun b!94302 () Bool)

(declare-fun res!77715 () Bool)

(assert (=> b!94302 (=> (not res!77715) (not e!61879))))

(assert (=> b!94302 (= res!77715 (isPrefixOf!0 bitStream2!8 base!8))))

(declare-fun b!94303 () Bool)

(declare-fun res!77712 () Bool)

(assert (=> b!94303 (=> (not res!77712) (not e!61879))))

(assert (=> b!94303 (= res!77712 (and (= (buf!2370 bitStream1!8) (buf!2370 bitStream2!8)) (= (buf!2370 bitStream1!8) (buf!2370 base!8))))))

(declare-fun b!94304 () Bool)

(assert (=> b!94304 (= e!61879 (and (not (= nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)) (= listBits!13 Nil!864)))))

(assert (= (and start!18904 res!77716) b!94301))

(assert (= (and b!94301 res!77711) b!94296))

(assert (= (and b!94296 res!77710) b!94302))

(assert (= (and b!94302 res!77715) b!94300))

(assert (= (and b!94300 res!77718) b!94303))

(assert (= (and b!94303 res!77712) b!94291))

(assert (= (and b!94291 res!77713) b!94295))

(assert (= (and b!94295 res!77717) b!94297))

(assert (= (and b!94297 res!77709) b!94293))

(assert (= (and b!94293 res!77714) b!94290))

(assert (= (and b!94290 res!77708) b!94304))

(assert (= start!18904 b!94299))

(assert (= start!18904 b!94294))

(assert (= start!18904 b!94298))

(assert (= start!18904 b!94292))

(declare-fun m!137915 () Bool)

(assert (=> b!94299 m!137915))

(declare-fun m!137917 () Bool)

(assert (=> b!94295 m!137917))

(declare-fun m!137919 () Bool)

(assert (=> b!94295 m!137919))

(declare-fun m!137921 () Bool)

(assert (=> b!94290 m!137921))

(declare-fun m!137923 () Bool)

(assert (=> b!94296 m!137923))

(declare-fun m!137925 () Bool)

(assert (=> b!94294 m!137925))

(declare-fun m!137927 () Bool)

(assert (=> b!94291 m!137927))

(declare-fun m!137929 () Bool)

(assert (=> b!94300 m!137929))

(declare-fun m!137931 () Bool)

(assert (=> b!94297 m!137931))

(declare-fun m!137933 () Bool)

(assert (=> b!94292 m!137933))

(declare-fun m!137935 () Bool)

(assert (=> b!94298 m!137935))

(declare-fun m!137937 () Bool)

(assert (=> b!94293 m!137937))

(declare-fun m!137939 () Bool)

(assert (=> start!18904 m!137939))

(declare-fun m!137941 () Bool)

(assert (=> start!18904 m!137941))

(declare-fun m!137943 () Bool)

(assert (=> start!18904 m!137943))

(declare-fun m!137945 () Bool)

(assert (=> start!18904 m!137945))

(declare-fun m!137947 () Bool)

(assert (=> b!94301 m!137947))

(declare-fun m!137949 () Bool)

(assert (=> b!94302 m!137949))

(check-sat (not b!94291) (not b!94298) (not b!94290) (not b!94292) (not b!94301) (not b!94299) (not b!94300) (not b!94295) (not start!18904) (not b!94294) (not b!94302) (not b!94293) (not b!94296) (not b!94297))
(check-sat)
(get-model)

(declare-fun d!29324 () Bool)

(assert (=> d!29324 (= (array_inv!1826 (buf!2370 thiss!1534)) (bvsge (size!2006 (buf!2370 thiss!1534)) #b00000000000000000000000000000000))))

(assert (=> b!94292 d!29324))

(declare-fun d!29326 () Bool)

(declare-fun size!2008 (List!867) Int)

(assert (=> d!29326 (= (length!458 listBits!13) (size!2008 listBits!13))))

(declare-fun bs!7217 () Bool)

(assert (= bs!7217 d!29326))

(declare-fun m!137987 () Bool)

(assert (=> bs!7217 m!137987))

(assert (=> b!94301 d!29326))

(declare-fun d!29328 () Bool)

(declare-fun e!61911 () Bool)

(assert (=> d!29328 e!61911))

(declare-fun res!77756 () Bool)

(assert (=> d!29328 (=> (not res!77756) (not e!61911))))

(declare-fun lt!138729 () (_ BitVec 64))

(declare-fun lt!138731 () (_ BitVec 64))

(declare-fun lt!138732 () (_ BitVec 64))

(assert (=> d!29328 (= res!77756 (= lt!138732 (bvsub lt!138731 lt!138729)))))

(assert (=> d!29328 (or (= (bvand lt!138731 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!138729 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!138731 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!138731 lt!138729) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!29328 (= lt!138729 (remainingBits!0 ((_ sign_extend 32) (size!2006 (buf!2370 base!8))) ((_ sign_extend 32) (currentByte!4727 base!8)) ((_ sign_extend 32) (currentBit!4722 base!8))))))

(declare-fun lt!138730 () (_ BitVec 64))

(declare-fun lt!138728 () (_ BitVec 64))

(assert (=> d!29328 (= lt!138731 (bvmul lt!138730 lt!138728))))

(assert (=> d!29328 (or (= lt!138730 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!138728 (bvsdiv (bvmul lt!138730 lt!138728) lt!138730)))))

(assert (=> d!29328 (= lt!138728 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!29328 (= lt!138730 ((_ sign_extend 32) (size!2006 (buf!2370 base!8))))))

(assert (=> d!29328 (= lt!138732 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4727 base!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4722 base!8))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!29328 (invariant!0 (currentBit!4722 base!8) (currentByte!4727 base!8) (size!2006 (buf!2370 base!8)))))

(assert (=> d!29328 (= (bitIndex!0 (size!2006 (buf!2370 base!8)) (currentByte!4727 base!8) (currentBit!4722 base!8)) lt!138732)))

(declare-fun b!94354 () Bool)

(declare-fun res!77757 () Bool)

(assert (=> b!94354 (=> (not res!77757) (not e!61911))))

(assert (=> b!94354 (= res!77757 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!138732))))

(declare-fun b!94355 () Bool)

(declare-fun lt!138727 () (_ BitVec 64))

(assert (=> b!94355 (= e!61911 (bvsle lt!138732 (bvmul lt!138727 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!94355 (or (= lt!138727 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!138727 #b0000000000000000000000000000000000000000000000000000000000001000) lt!138727)))))

(assert (=> b!94355 (= lt!138727 ((_ sign_extend 32) (size!2006 (buf!2370 base!8))))))

(assert (= (and d!29328 res!77756) b!94354))

(assert (= (and b!94354 res!77757) b!94355))

(declare-fun m!137989 () Bool)

(assert (=> d!29328 m!137989))

(declare-fun m!137991 () Bool)

(assert (=> d!29328 m!137991))

(assert (=> b!94291 d!29328))

(declare-fun d!29330 () Bool)

(declare-fun res!77764 () Bool)

(declare-fun e!61917 () Bool)

(assert (=> d!29330 (=> (not res!77764) (not e!61917))))

(assert (=> d!29330 (= res!77764 (= (size!2006 (buf!2370 bitStream2!8)) (size!2006 (buf!2370 base!8))))))

(assert (=> d!29330 (= (isPrefixOf!0 bitStream2!8 base!8) e!61917)))

(declare-fun b!94362 () Bool)

(declare-fun res!77765 () Bool)

(assert (=> b!94362 (=> (not res!77765) (not e!61917))))

(assert (=> b!94362 (= res!77765 (bvsle (bitIndex!0 (size!2006 (buf!2370 bitStream2!8)) (currentByte!4727 bitStream2!8) (currentBit!4722 bitStream2!8)) (bitIndex!0 (size!2006 (buf!2370 base!8)) (currentByte!4727 base!8) (currentBit!4722 base!8))))))

(declare-fun b!94363 () Bool)

(declare-fun e!61916 () Bool)

(assert (=> b!94363 (= e!61917 e!61916)))

(declare-fun res!77766 () Bool)

(assert (=> b!94363 (=> res!77766 e!61916)))

(assert (=> b!94363 (= res!77766 (= (size!2006 (buf!2370 bitStream2!8)) #b00000000000000000000000000000000))))

(declare-fun b!94364 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4412 array!4412 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!94364 (= e!61916 (arrayBitRangesEq!0 (buf!2370 bitStream2!8) (buf!2370 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2006 (buf!2370 bitStream2!8)) (currentByte!4727 bitStream2!8) (currentBit!4722 bitStream2!8))))))

(assert (= (and d!29330 res!77764) b!94362))

(assert (= (and b!94362 res!77765) b!94363))

(assert (= (and b!94363 (not res!77766)) b!94364))

(assert (=> b!94362 m!137919))

(assert (=> b!94362 m!137927))

(assert (=> b!94364 m!137919))

(assert (=> b!94364 m!137919))

(declare-fun m!137993 () Bool)

(assert (=> b!94364 m!137993))

(assert (=> b!94302 d!29330))

(declare-fun d!29332 () Bool)

(declare-fun e!61918 () Bool)

(assert (=> d!29332 e!61918))

(declare-fun res!77767 () Bool)

(assert (=> d!29332 (=> (not res!77767) (not e!61918))))

(declare-fun lt!138738 () (_ BitVec 64))

(declare-fun lt!138737 () (_ BitVec 64))

(declare-fun lt!138735 () (_ BitVec 64))

(assert (=> d!29332 (= res!77767 (= lt!138738 (bvsub lt!138737 lt!138735)))))

(assert (=> d!29332 (or (= (bvand lt!138737 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!138735 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!138737 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!138737 lt!138735) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!29332 (= lt!138735 (remainingBits!0 ((_ sign_extend 32) (size!2006 (buf!2370 bitStream1!8))) ((_ sign_extend 32) (currentByte!4727 bitStream1!8)) ((_ sign_extend 32) (currentBit!4722 bitStream1!8))))))

(declare-fun lt!138736 () (_ BitVec 64))

(declare-fun lt!138734 () (_ BitVec 64))

(assert (=> d!29332 (= lt!138737 (bvmul lt!138736 lt!138734))))

(assert (=> d!29332 (or (= lt!138736 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!138734 (bvsdiv (bvmul lt!138736 lt!138734) lt!138736)))))

(assert (=> d!29332 (= lt!138734 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!29332 (= lt!138736 ((_ sign_extend 32) (size!2006 (buf!2370 bitStream1!8))))))

(assert (=> d!29332 (= lt!138738 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4727 bitStream1!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4722 bitStream1!8))))))

(assert (=> d!29332 (invariant!0 (currentBit!4722 bitStream1!8) (currentByte!4727 bitStream1!8) (size!2006 (buf!2370 bitStream1!8)))))

(assert (=> d!29332 (= (bitIndex!0 (size!2006 (buf!2370 bitStream1!8)) (currentByte!4727 bitStream1!8) (currentBit!4722 bitStream1!8)) lt!138738)))

(declare-fun b!94365 () Bool)

(declare-fun res!77768 () Bool)

(assert (=> b!94365 (=> (not res!77768) (not e!61918))))

(assert (=> b!94365 (= res!77768 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!138738))))

(declare-fun b!94366 () Bool)

(declare-fun lt!138733 () (_ BitVec 64))

(assert (=> b!94366 (= e!61918 (bvsle lt!138738 (bvmul lt!138733 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!94366 (or (= lt!138733 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!138733 #b0000000000000000000000000000000000000000000000000000000000001000) lt!138733)))))

(assert (=> b!94366 (= lt!138733 ((_ sign_extend 32) (size!2006 (buf!2370 bitStream1!8))))))

(assert (= (and d!29332 res!77767) b!94365))

(assert (= (and b!94365 res!77768) b!94366))

(declare-fun m!137995 () Bool)

(assert (=> d!29332 m!137995))

(declare-fun m!137997 () Bool)

(assert (=> d!29332 m!137997))

(assert (=> b!94295 d!29332))

(declare-fun d!29336 () Bool)

(declare-fun e!61919 () Bool)

(assert (=> d!29336 e!61919))

(declare-fun res!77769 () Bool)

(assert (=> d!29336 (=> (not res!77769) (not e!61919))))

(declare-fun lt!138741 () (_ BitVec 64))

(declare-fun lt!138744 () (_ BitVec 64))

(declare-fun lt!138743 () (_ BitVec 64))

(assert (=> d!29336 (= res!77769 (= lt!138744 (bvsub lt!138743 lt!138741)))))

(assert (=> d!29336 (or (= (bvand lt!138743 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!138741 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!138743 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!138743 lt!138741) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!29336 (= lt!138741 (remainingBits!0 ((_ sign_extend 32) (size!2006 (buf!2370 bitStream2!8))) ((_ sign_extend 32) (currentByte!4727 bitStream2!8)) ((_ sign_extend 32) (currentBit!4722 bitStream2!8))))))

(declare-fun lt!138742 () (_ BitVec 64))

(declare-fun lt!138740 () (_ BitVec 64))

(assert (=> d!29336 (= lt!138743 (bvmul lt!138742 lt!138740))))

(assert (=> d!29336 (or (= lt!138742 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!138740 (bvsdiv (bvmul lt!138742 lt!138740) lt!138742)))))

(assert (=> d!29336 (= lt!138740 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!29336 (= lt!138742 ((_ sign_extend 32) (size!2006 (buf!2370 bitStream2!8))))))

(assert (=> d!29336 (= lt!138744 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4727 bitStream2!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4722 bitStream2!8))))))

(assert (=> d!29336 (invariant!0 (currentBit!4722 bitStream2!8) (currentByte!4727 bitStream2!8) (size!2006 (buf!2370 bitStream2!8)))))

(assert (=> d!29336 (= (bitIndex!0 (size!2006 (buf!2370 bitStream2!8)) (currentByte!4727 bitStream2!8) (currentBit!4722 bitStream2!8)) lt!138744)))

(declare-fun b!94367 () Bool)

(declare-fun res!77770 () Bool)

(assert (=> b!94367 (=> (not res!77770) (not e!61919))))

(assert (=> b!94367 (= res!77770 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!138744))))

(declare-fun b!94368 () Bool)

(declare-fun lt!138739 () (_ BitVec 64))

(assert (=> b!94368 (= e!61919 (bvsle lt!138744 (bvmul lt!138739 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!94368 (or (= lt!138739 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!138739 #b0000000000000000000000000000000000000000000000000000000000001000) lt!138739)))))

(assert (=> b!94368 (= lt!138739 ((_ sign_extend 32) (size!2006 (buf!2370 bitStream2!8))))))

(assert (= (and d!29336 res!77769) b!94367))

(assert (= (and b!94367 res!77770) b!94368))

(declare-fun m!137999 () Bool)

(assert (=> d!29336 m!137999))

(declare-fun m!138001 () Bool)

(assert (=> d!29336 m!138001))

(assert (=> b!94295 d!29336))

(declare-fun d!29338 () Bool)

(assert (=> d!29338 (= (inv!12 bitStream1!8) (invariant!0 (currentBit!4722 bitStream1!8) (currentByte!4727 bitStream1!8) (size!2006 (buf!2370 bitStream1!8))))))

(declare-fun bs!7219 () Bool)

(assert (= bs!7219 d!29338))

(assert (=> bs!7219 m!137997))

(assert (=> start!18904 d!29338))

(declare-fun d!29342 () Bool)

(assert (=> d!29342 (= (inv!12 bitStream2!8) (invariant!0 (currentBit!4722 bitStream2!8) (currentByte!4727 bitStream2!8) (size!2006 (buf!2370 bitStream2!8))))))

(declare-fun bs!7220 () Bool)

(assert (= bs!7220 d!29342))

(assert (=> bs!7220 m!138001))

(assert (=> start!18904 d!29342))

(declare-fun d!29344 () Bool)

(assert (=> d!29344 (= (inv!12 base!8) (invariant!0 (currentBit!4722 base!8) (currentByte!4727 base!8) (size!2006 (buf!2370 base!8))))))

(declare-fun bs!7221 () Bool)

(assert (= bs!7221 d!29344))

(assert (=> bs!7221 m!137991))

(assert (=> start!18904 d!29344))

(declare-fun d!29346 () Bool)

(assert (=> d!29346 (= (inv!12 thiss!1534) (invariant!0 (currentBit!4722 thiss!1534) (currentByte!4727 thiss!1534) (size!2006 (buf!2370 thiss!1534))))))

(declare-fun bs!7222 () Bool)

(assert (= bs!7222 d!29346))

(declare-fun m!138005 () Bool)

(assert (=> bs!7222 m!138005))

(assert (=> start!18904 d!29346))

(declare-fun d!29348 () Bool)

(assert (=> d!29348 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2006 (buf!2370 bitStream2!8))) ((_ sign_extend 32) (currentByte!4727 bitStream2!8)) ((_ sign_extend 32) (currentBit!4722 bitStream2!8)) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2006 (buf!2370 bitStream2!8))) ((_ sign_extend 32) (currentByte!4727 bitStream2!8)) ((_ sign_extend 32) (currentBit!4722 bitStream2!8))) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!7223 () Bool)

(assert (= bs!7223 d!29348))

(assert (=> bs!7223 m!137999))

(assert (=> b!94293 d!29348))

(declare-fun d!29350 () Bool)

(assert (=> d!29350 (= (array_inv!1826 (buf!2370 bitStream2!8)) (bvsge (size!2006 (buf!2370 bitStream2!8)) #b00000000000000000000000000000000))))

(assert (=> b!94294 d!29350))

(declare-fun d!29352 () Bool)

(assert (=> d!29352 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2006 (buf!2370 bitStream1!8))) ((_ sign_extend 32) (currentByte!4727 bitStream1!8)) ((_ sign_extend 32) (currentBit!4722 bitStream1!8)) nBits!484) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2006 (buf!2370 bitStream1!8))) ((_ sign_extend 32) (currentByte!4727 bitStream1!8)) ((_ sign_extend 32) (currentBit!4722 bitStream1!8))) nBits!484))))

(declare-fun bs!7224 () Bool)

(assert (= bs!7224 d!29352))

(assert (=> bs!7224 m!137995))

(assert (=> b!94297 d!29352))

(declare-fun d!29354 () Bool)

(assert (=> d!29354 (= (array_inv!1826 (buf!2370 base!8)) (bvsge (size!2006 (buf!2370 base!8)) #b00000000000000000000000000000000))))

(assert (=> b!94298 d!29354))

(declare-fun d!29356 () Bool)

(declare-fun res!77771 () Bool)

(declare-fun e!61921 () Bool)

(assert (=> d!29356 (=> (not res!77771) (not e!61921))))

(assert (=> d!29356 (= res!77771 (= (size!2006 (buf!2370 bitStream1!8)) (size!2006 (buf!2370 base!8))))))

(assert (=> d!29356 (= (isPrefixOf!0 bitStream1!8 base!8) e!61921)))

(declare-fun b!94369 () Bool)

(declare-fun res!77772 () Bool)

(assert (=> b!94369 (=> (not res!77772) (not e!61921))))

(assert (=> b!94369 (= res!77772 (bvsle (bitIndex!0 (size!2006 (buf!2370 bitStream1!8)) (currentByte!4727 bitStream1!8) (currentBit!4722 bitStream1!8)) (bitIndex!0 (size!2006 (buf!2370 base!8)) (currentByte!4727 base!8) (currentBit!4722 base!8))))))

(declare-fun b!94370 () Bool)

(declare-fun e!61920 () Bool)

(assert (=> b!94370 (= e!61921 e!61920)))

(declare-fun res!77773 () Bool)

(assert (=> b!94370 (=> res!77773 e!61920)))

(assert (=> b!94370 (= res!77773 (= (size!2006 (buf!2370 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!94371 () Bool)

(assert (=> b!94371 (= e!61920 (arrayBitRangesEq!0 (buf!2370 bitStream1!8) (buf!2370 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2006 (buf!2370 bitStream1!8)) (currentByte!4727 bitStream1!8) (currentBit!4722 bitStream1!8))))))

(assert (= (and d!29356 res!77771) b!94369))

(assert (= (and b!94369 res!77772) b!94370))

(assert (= (and b!94370 (not res!77773)) b!94371))

(assert (=> b!94369 m!137917))

(assert (=> b!94369 m!137927))

(assert (=> b!94371 m!137917))

(assert (=> b!94371 m!137917))

(declare-fun m!138007 () Bool)

(assert (=> b!94371 m!138007))

(assert (=> b!94296 d!29356))

(declare-fun d!29358 () Bool)

(declare-fun res!77774 () Bool)

(declare-fun e!61923 () Bool)

(assert (=> d!29358 (=> (not res!77774) (not e!61923))))

(assert (=> d!29358 (= res!77774 (= (size!2006 (buf!2370 bitStream1!8)) (size!2006 (buf!2370 bitStream2!8))))))

(assert (=> d!29358 (= (isPrefixOf!0 bitStream1!8 bitStream2!8) e!61923)))

(declare-fun b!94372 () Bool)

(declare-fun res!77775 () Bool)

(assert (=> b!94372 (=> (not res!77775) (not e!61923))))

(assert (=> b!94372 (= res!77775 (bvsle (bitIndex!0 (size!2006 (buf!2370 bitStream1!8)) (currentByte!4727 bitStream1!8) (currentBit!4722 bitStream1!8)) (bitIndex!0 (size!2006 (buf!2370 bitStream2!8)) (currentByte!4727 bitStream2!8) (currentBit!4722 bitStream2!8))))))

(declare-fun b!94373 () Bool)

(declare-fun e!61922 () Bool)

(assert (=> b!94373 (= e!61923 e!61922)))

(declare-fun res!77776 () Bool)

(assert (=> b!94373 (=> res!77776 e!61922)))

(assert (=> b!94373 (= res!77776 (= (size!2006 (buf!2370 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!94374 () Bool)

(assert (=> b!94374 (= e!61922 (arrayBitRangesEq!0 (buf!2370 bitStream1!8) (buf!2370 bitStream2!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2006 (buf!2370 bitStream1!8)) (currentByte!4727 bitStream1!8) (currentBit!4722 bitStream1!8))))))

(assert (= (and d!29358 res!77774) b!94372))

(assert (= (and b!94372 res!77775) b!94373))

(assert (= (and b!94373 (not res!77776)) b!94374))

(assert (=> b!94372 m!137917))

(assert (=> b!94372 m!137919))

(assert (=> b!94374 m!137917))

(assert (=> b!94374 m!137917))

(declare-fun m!138009 () Bool)

(assert (=> b!94374 m!138009))

(assert (=> b!94300 d!29358))

(declare-fun b!94398 () Bool)

(declare-fun e!61937 () Bool)

(declare-fun lt!138753 () List!867)

(assert (=> b!94398 (= e!61937 (> (length!458 lt!138753) 0))))

(declare-fun d!29360 () Bool)

(assert (=> d!29360 e!61937))

(declare-fun c!5942 () Bool)

(assert (=> d!29360 (= c!5942 (= nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!7642 0))(
  ( (tuple2!7643 (_1!4068 List!867) (_2!4068 BitStream!3522)) )
))
(declare-fun e!61936 () tuple2!7642)

(assert (=> d!29360 (= lt!138753 (_1!4068 e!61936))))

(declare-fun c!5943 () Bool)

(assert (=> d!29360 (= c!5943 (= nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!29360 (bvsge nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!29360 (= (bitStreamReadBitsIntoList!0 thiss!1534 bitStream1!8 nBits!484) lt!138753)))

(declare-fun b!94396 () Bool)

(declare-fun lt!138752 () (_ BitVec 64))

(declare-datatypes ((tuple2!7644 0))(
  ( (tuple2!7645 (_1!4069 Bool) (_2!4069 BitStream!3522)) )
))
(declare-fun lt!138751 () tuple2!7644)

(assert (=> b!94396 (= e!61936 (tuple2!7643 (Cons!863 (_1!4069 lt!138751) (bitStreamReadBitsIntoList!0 thiss!1534 (_2!4069 lt!138751) (bvsub nBits!484 lt!138752))) (_2!4069 lt!138751)))))

(declare-fun readBit!0 (BitStream!3522) tuple2!7644)

(assert (=> b!94396 (= lt!138751 (readBit!0 bitStream1!8))))

(assert (=> b!94396 (= lt!138752 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!94397 () Bool)

(declare-fun isEmpty!253 (List!867) Bool)

(assert (=> b!94397 (= e!61937 (isEmpty!253 lt!138753))))

(declare-fun b!94395 () Bool)

(assert (=> b!94395 (= e!61936 (tuple2!7643 Nil!864 bitStream1!8))))

(assert (= (and d!29360 c!5943) b!94395))

(assert (= (and d!29360 (not c!5943)) b!94396))

(assert (= (and d!29360 c!5942) b!94397))

(assert (= (and d!29360 (not c!5942)) b!94398))

(declare-fun m!138015 () Bool)

(assert (=> b!94398 m!138015))

(declare-fun m!138017 () Bool)

(assert (=> b!94396 m!138017))

(declare-fun m!138019 () Bool)

(assert (=> b!94396 m!138019))

(declare-fun m!138021 () Bool)

(assert (=> b!94397 m!138021))

(assert (=> b!94290 d!29360))

(declare-fun d!29374 () Bool)

(assert (=> d!29374 (= (array_inv!1826 (buf!2370 bitStream1!8)) (bvsge (size!2006 (buf!2370 bitStream1!8)) #b00000000000000000000000000000000))))

(assert (=> b!94299 d!29374))

(check-sat (not d!29332) (not d!29336) (not b!94369) (not d!29326) (not b!94398) (not b!94374) (not b!94364) (not b!94396) (not b!94372) (not d!29338) (not b!94397) (not d!29344) (not d!29352) (not d!29346) (not b!94362) (not b!94371) (not d!29342) (not d!29348) (not d!29328))
