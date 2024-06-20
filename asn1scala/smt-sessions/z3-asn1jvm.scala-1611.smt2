; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45684 () Bool)

(assert start!45684)

(declare-fun b!220941 () Bool)

(declare-fun e!150022 () Bool)

(declare-datatypes ((array!10797 0))(
  ( (array!10798 (arr!5672 (Array (_ BitVec 32) (_ BitVec 8))) (size!4742 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8592 0))(
  ( (BitStream!8593 (buf!5289 array!10797) (currentByte!9925 (_ BitVec 32)) (currentBit!9920 (_ BitVec 32))) )
))
(declare-fun bs!62 () BitStream!8592)

(declare-fun array_inv!4483 (array!10797) Bool)

(assert (=> b!220941 (= e!150022 (array_inv!4483 (buf!5289 bs!62)))))

(declare-fun res!186070 () Bool)

(declare-fun e!150021 () Bool)

(assert (=> start!45684 (=> (not res!186070) (not e!150021))))

(declare-fun i!541 () (_ BitVec 32))

(declare-fun nBits!265 () (_ BitVec 32))

(assert (=> start!45684 (= res!186070 (and (bvsle #b00000000000000000000000000000000 i!541) (bvslt i!541 nBits!265) (bvsle nBits!265 #b00000000000000000000000001000000)))))

(assert (=> start!45684 e!150021))

(assert (=> start!45684 true))

(declare-fun inv!12 (BitStream!8592) Bool)

(assert (=> start!45684 (and (inv!12 bs!62) e!150022)))

(declare-fun b!220942 () Bool)

(declare-datatypes ((tuple2!18960 0))(
  ( (tuple2!18961 (_1!10138 BitStream!8592) (_2!10138 (_ BitVec 64))) )
))
(declare-fun lt!348674 () tuple2!18960)

(declare-fun lt!348673 () tuple2!18960)

(assert (=> b!220942 (= e!150021 (or (not (= (_2!10138 lt!348674) (_2!10138 lt!348673))) (not (= (_1!10138 lt!348674) (_1!10138 lt!348673)))))))

(declare-fun e!150023 () (_ BitVec 64))

(declare-fun acc!113 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8592 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18960)

(declare-fun withMovedBitIndex!0 (BitStream!8592 (_ BitVec 64)) BitStream!8592)

(assert (=> b!220942 (= lt!348673 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!265 (bvadd #b00000000000000000000000000000001 i!541) (bvor acc!113 e!150023)))))

(declare-fun c!10700 () Bool)

(declare-datatypes ((tuple2!18962 0))(
  ( (tuple2!18963 (_1!10139 BitStream!8592) (_2!10139 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!8592) tuple2!18962)

(assert (=> b!220942 (= c!10700 (_2!10139 (readBitPure!0 bs!62)))))

(assert (=> b!220942 (= lt!348674 (readNBitsLSBFirstsLoopPure!0 bs!62 nBits!265 i!541 acc!113))))

(declare-fun b!220943 () Bool)

(assert (=> b!220943 (= e!150023 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!541)))))

(declare-fun b!220944 () Bool)

(assert (=> b!220944 (= e!150023 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!220945 () Bool)

(declare-fun res!186069 () Bool)

(assert (=> b!220945 (=> (not res!186069) (not e!150021))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!220945 (= res!186069 (validate_offset_bits!1 ((_ sign_extend 32) (size!4742 (buf!5289 bs!62))) ((_ sign_extend 32) (currentByte!9925 bs!62)) ((_ sign_extend 32) (currentBit!9920 bs!62)) ((_ sign_extend 32) (bvsub nBits!265 i!541))))))

(declare-fun b!220946 () Bool)

(declare-fun res!186068 () Bool)

(assert (=> b!220946 (=> (not res!186068) (not e!150021))))

(assert (=> b!220946 (= res!186068 (= (bvand acc!113 #b1111111111111111111111111111111111111111111111111111111111111111) acc!113))))

(declare-fun b!220947 () Bool)

(declare-fun res!186071 () Bool)

(assert (=> b!220947 (=> (not res!186071) (not e!150021))))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!220947 (= res!186071 (= (bvand acc!113 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!541))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!45684 res!186070) b!220945))

(assert (= (and b!220945 res!186069) b!220947))

(assert (= (and b!220947 res!186071) b!220946))

(assert (= (and b!220946 res!186068) b!220942))

(assert (= (and b!220942 c!10700) b!220943))

(assert (= (and b!220942 (not c!10700)) b!220944))

(assert (= start!45684 b!220941))

(declare-fun m!339587 () Bool)

(assert (=> start!45684 m!339587))

(declare-fun m!339589 () Bool)

(assert (=> b!220941 m!339589))

(declare-fun m!339591 () Bool)

(assert (=> b!220942 m!339591))

(assert (=> b!220942 m!339591))

(declare-fun m!339593 () Bool)

(assert (=> b!220942 m!339593))

(declare-fun m!339595 () Bool)

(assert (=> b!220942 m!339595))

(declare-fun m!339597 () Bool)

(assert (=> b!220942 m!339597))

(declare-fun m!339599 () Bool)

(assert (=> b!220947 m!339599))

(declare-fun m!339601 () Bool)

(assert (=> b!220945 m!339601))

(check-sat (not b!220942) (not b!220947) (not start!45684) (not b!220945) (not b!220941))
(check-sat)
(get-model)

(declare-fun d!74357 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!74357 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4742 (buf!5289 bs!62))) ((_ sign_extend 32) (currentByte!9925 bs!62)) ((_ sign_extend 32) (currentBit!9920 bs!62)) ((_ sign_extend 32) (bvsub nBits!265 i!541))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4742 (buf!5289 bs!62))) ((_ sign_extend 32) (currentByte!9925 bs!62)) ((_ sign_extend 32) (currentBit!9920 bs!62))) ((_ sign_extend 32) (bvsub nBits!265 i!541))))))

(declare-fun bs!18197 () Bool)

(assert (= bs!18197 d!74357))

(declare-fun m!339619 () Bool)

(assert (=> bs!18197 m!339619))

(assert (=> b!220945 d!74357))

(declare-fun d!74359 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!74359 (= (inv!12 bs!62) (invariant!0 (currentBit!9920 bs!62) (currentByte!9925 bs!62) (size!4742 (buf!5289 bs!62))))))

(declare-fun bs!18198 () Bool)

(assert (= bs!18198 d!74359))

(declare-fun m!339621 () Bool)

(assert (=> bs!18198 m!339621))

(assert (=> start!45684 d!74359))

(declare-fun d!74361 () Bool)

(assert (=> d!74361 (= (array_inv!4483 (buf!5289 bs!62)) (bvsge (size!4742 (buf!5289 bs!62)) #b00000000000000000000000000000000))))

(assert (=> b!220941 d!74361))

(declare-datatypes ((tuple2!18968 0))(
  ( (tuple2!18969 (_1!10142 (_ BitVec 64)) (_2!10142 BitStream!8592)) )
))
(declare-fun lt!348683 () tuple2!18968)

(declare-fun d!74363 () Bool)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!8592 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18968)

(assert (=> d!74363 (= lt!348683 (readNBitsLSBFirstsLoop!0 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!265 (bvadd #b00000000000000000000000000000001 i!541) (bvor acc!113 e!150023)))))

(assert (=> d!74363 (= (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!265 (bvadd #b00000000000000000000000000000001 i!541) (bvor acc!113 e!150023)) (tuple2!18961 (_2!10142 lt!348683) (_1!10142 lt!348683)))))

(declare-fun bs!18199 () Bool)

(assert (= bs!18199 d!74363))

(assert (=> bs!18199 m!339591))

(declare-fun m!339623 () Bool)

(assert (=> bs!18199 m!339623))

(assert (=> b!220942 d!74363))

(declare-fun d!74365 () Bool)

(declare-fun e!150039 () Bool)

(assert (=> d!74365 e!150039))

(declare-fun res!186086 () Bool)

(assert (=> d!74365 (=> (not res!186086) (not e!150039))))

(declare-fun lt!348689 () (_ BitVec 64))

(declare-fun lt!348688 () BitStream!8592)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> d!74365 (= res!186086 (= (bvadd lt!348689 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4742 (buf!5289 lt!348688)) (currentByte!9925 lt!348688) (currentBit!9920 lt!348688))))))

(assert (=> d!74365 (or (not (= (bvand lt!348689 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!348689 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!348689 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74365 (= lt!348689 (bitIndex!0 (size!4742 (buf!5289 bs!62)) (currentByte!9925 bs!62) (currentBit!9920 bs!62)))))

(declare-datatypes ((Unit!15613 0))(
  ( (Unit!15614) )
))
(declare-datatypes ((tuple2!18970 0))(
  ( (tuple2!18971 (_1!10143 Unit!15613) (_2!10143 BitStream!8592)) )
))
(declare-fun moveBitIndex!0 (BitStream!8592 (_ BitVec 64)) tuple2!18970)

(assert (=> d!74365 (= lt!348688 (_2!10143 (moveBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!8592 (_ BitVec 64)) Bool)

(assert (=> d!74365 (moveBitIndexPrecond!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!74365 (= (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001) lt!348688)))

(declare-fun b!220971 () Bool)

(assert (=> b!220971 (= e!150039 (= (size!4742 (buf!5289 bs!62)) (size!4742 (buf!5289 lt!348688))))))

(assert (= (and d!74365 res!186086) b!220971))

(declare-fun m!339627 () Bool)

(assert (=> d!74365 m!339627))

(declare-fun m!339629 () Bool)

(assert (=> d!74365 m!339629))

(declare-fun m!339631 () Bool)

(assert (=> d!74365 m!339631))

(declare-fun m!339633 () Bool)

(assert (=> d!74365 m!339633))

(assert (=> b!220942 d!74365))

(declare-fun d!74375 () Bool)

(declare-datatypes ((tuple2!18972 0))(
  ( (tuple2!18973 (_1!10144 Bool) (_2!10144 BitStream!8592)) )
))
(declare-fun lt!348694 () tuple2!18972)

(declare-fun readBit!0 (BitStream!8592) tuple2!18972)

(assert (=> d!74375 (= lt!348694 (readBit!0 bs!62))))

(assert (=> d!74375 (= (readBitPure!0 bs!62) (tuple2!18963 (_2!10144 lt!348694) (_1!10144 lt!348694)))))

(declare-fun bs!18201 () Bool)

(assert (= bs!18201 d!74375))

(declare-fun m!339635 () Bool)

(assert (=> bs!18201 m!339635))

(assert (=> b!220942 d!74375))

(declare-fun d!74377 () Bool)

(declare-fun lt!348696 () tuple2!18968)

(assert (=> d!74377 (= lt!348696 (readNBitsLSBFirstsLoop!0 bs!62 nBits!265 i!541 acc!113))))

(assert (=> d!74377 (= (readNBitsLSBFirstsLoopPure!0 bs!62 nBits!265 i!541 acc!113) (tuple2!18961 (_2!10142 lt!348696) (_1!10142 lt!348696)))))

(declare-fun bs!18202 () Bool)

(assert (= bs!18202 d!74377))

(declare-fun m!339637 () Bool)

(assert (=> bs!18202 m!339637))

(assert (=> b!220942 d!74377))

(declare-fun d!74379 () Bool)

(assert (=> d!74379 (= (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!541)) (ite (= (bvsub #b00000000000000000000000001000000 i!541) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000 (bvshl #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub #b00000000000000000000000001000000 i!541))))))))

(assert (=> b!220947 d!74379))

(check-sat (not d!74375) (not d!74359) (not d!74357) (not d!74363) (not d!74365) (not d!74377))
(check-sat)
(get-model)

(declare-fun b!220992 () Bool)

(declare-fun e!150054 () tuple2!18968)

(assert (=> b!220992 (= e!150054 (tuple2!18969 acc!113 bs!62))))

(declare-fun b!220993 () Bool)

(declare-fun e!150052 () Bool)

(declare-fun e!150053 () Bool)

(assert (=> b!220993 (= e!150052 e!150053)))

(declare-fun res!186107 () Bool)

(assert (=> b!220993 (=> res!186107 e!150053)))

(assert (=> b!220993 (= res!186107 (not (bvslt i!541 nBits!265)))))

(declare-fun b!220994 () Bool)

(declare-fun lt!348737 () tuple2!18968)

(assert (=> b!220994 (= e!150054 (tuple2!18969 (_1!10142 lt!348737) (_2!10142 lt!348737)))))

(declare-fun lt!348733 () tuple2!18972)

(assert (=> b!220994 (= lt!348733 (readBit!0 bs!62))))

(assert (=> b!220994 (= lt!348737 (readNBitsLSBFirstsLoop!0 (_2!10144 lt!348733) nBits!265 (bvadd i!541 #b00000000000000000000000000000001) (bvor acc!113 (ite (_1!10144 lt!348733) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!541)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!348732 () tuple2!18968)

(declare-fun lt!348735 () (_ BitVec 64))

(declare-fun b!220995 () Bool)

(assert (=> b!220995 (= e!150053 (= (= (bvand (bvlshr (_1!10142 lt!348732) lt!348735) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!10139 (readBitPure!0 bs!62))))))

(assert (=> b!220995 (and (bvsge lt!348735 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!348735 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!220995 (= lt!348735 ((_ sign_extend 32) i!541))))

(declare-fun b!220996 () Bool)

(declare-fun res!186104 () Bool)

(assert (=> b!220996 (=> (not res!186104) (not e!150052))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!220996 (= res!186104 (= (bvand (_1!10142 lt!348732) (onesLSBLong!0 nBits!265)) (_1!10142 lt!348732)))))

(declare-fun b!220997 () Bool)

(declare-fun res!186105 () Bool)

(assert (=> b!220997 (=> (not res!186105) (not e!150052))))

(assert (=> b!220997 (= res!186105 (= (bvand (_1!10142 lt!348732) (onesLSBLong!0 i!541)) (bvand acc!113 (onesLSBLong!0 i!541))))))

(declare-fun d!74405 () Bool)

(assert (=> d!74405 e!150052))

(declare-fun res!186103 () Bool)

(assert (=> d!74405 (=> (not res!186103) (not e!150052))))

(assert (=> d!74405 (= res!186103 (= (buf!5289 (_2!10142 lt!348732)) (buf!5289 bs!62)))))

(assert (=> d!74405 (= lt!348732 e!150054)))

(declare-fun c!10706 () Bool)

(assert (=> d!74405 (= c!10706 (= nBits!265 i!541))))

(assert (=> d!74405 (and (bvsle #b00000000000000000000000000000000 i!541) (bvsle i!541 nBits!265) (bvsle nBits!265 #b00000000000000000000000001000000))))

(assert (=> d!74405 (= (readNBitsLSBFirstsLoop!0 bs!62 nBits!265 i!541 acc!113) lt!348732)))

(declare-fun b!220998 () Bool)

(declare-fun res!186106 () Bool)

(assert (=> b!220998 (=> (not res!186106) (not e!150052))))

(declare-fun lt!348734 () (_ BitVec 64))

(declare-fun lt!348736 () (_ BitVec 64))

(assert (=> b!220998 (= res!186106 (= (bitIndex!0 (size!4742 (buf!5289 (_2!10142 lt!348732))) (currentByte!9925 (_2!10142 lt!348732)) (currentBit!9920 (_2!10142 lt!348732))) (bvadd lt!348736 lt!348734)))))

(assert (=> b!220998 (or (not (= (bvand lt!348736 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!348734 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!348736 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!348736 lt!348734) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!220998 (= lt!348734 ((_ sign_extend 32) (bvsub nBits!265 i!541)))))

(assert (=> b!220998 (or (= (bvand nBits!265 #b10000000000000000000000000000000) (bvand i!541 #b10000000000000000000000000000000)) (= (bvand nBits!265 #b10000000000000000000000000000000) (bvand (bvsub nBits!265 i!541) #b10000000000000000000000000000000)))))

(assert (=> b!220998 (= lt!348736 (bitIndex!0 (size!4742 (buf!5289 bs!62)) (currentByte!9925 bs!62) (currentBit!9920 bs!62)))))

(assert (= (and d!74405 c!10706) b!220992))

(assert (= (and d!74405 (not c!10706)) b!220994))

(assert (= (and d!74405 res!186103) b!220998))

(assert (= (and b!220998 res!186106) b!220997))

(assert (= (and b!220997 res!186105) b!220996))

(assert (= (and b!220996 res!186104) b!220993))

(assert (= (and b!220993 (not res!186107)) b!220995))

(assert (=> b!220994 m!339635))

(declare-fun m!339673 () Bool)

(assert (=> b!220994 m!339673))

(declare-fun m!339675 () Bool)

(assert (=> b!220997 m!339675))

(assert (=> b!220995 m!339595))

(declare-fun m!339677 () Bool)

(assert (=> b!220998 m!339677))

(assert (=> b!220998 m!339629))

(declare-fun m!339679 () Bool)

(assert (=> b!220996 m!339679))

(assert (=> d!74377 d!74405))

(declare-fun d!74407 () Bool)

(declare-fun e!150061 () Bool)

(assert (=> d!74407 e!150061))

(declare-fun res!186110 () Bool)

(assert (=> d!74407 (=> (not res!186110) (not e!150061))))

(declare-fun increaseBitIndex!0 (BitStream!8592) tuple2!18970)

(assert (=> d!74407 (= res!186110 (= (buf!5289 (_2!10143 (increaseBitIndex!0 bs!62))) (buf!5289 bs!62)))))

(declare-fun lt!348757 () Bool)

(assert (=> d!74407 (= lt!348757 (not (= (bvand ((_ sign_extend 24) (select (arr!5672 (buf!5289 bs!62)) (currentByte!9925 bs!62))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9920 bs!62)))) #b00000000000000000000000000000000)))))

(declare-fun lt!348754 () tuple2!18972)

(assert (=> d!74407 (= lt!348754 (tuple2!18973 (not (= (bvand ((_ sign_extend 24) (select (arr!5672 (buf!5289 bs!62)) (currentByte!9925 bs!62))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9920 bs!62)))) #b00000000000000000000000000000000)) (_2!10143 (increaseBitIndex!0 bs!62))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!74407 (validate_offset_bit!0 ((_ sign_extend 32) (size!4742 (buf!5289 bs!62))) ((_ sign_extend 32) (currentByte!9925 bs!62)) ((_ sign_extend 32) (currentBit!9920 bs!62)))))

(assert (=> d!74407 (= (readBit!0 bs!62) lt!348754)))

(declare-fun lt!348755 () (_ BitVec 64))

(declare-fun b!221001 () Bool)

(declare-fun lt!348753 () (_ BitVec 64))

(assert (=> b!221001 (= e!150061 (= (bitIndex!0 (size!4742 (buf!5289 (_2!10143 (increaseBitIndex!0 bs!62)))) (currentByte!9925 (_2!10143 (increaseBitIndex!0 bs!62))) (currentBit!9920 (_2!10143 (increaseBitIndex!0 bs!62)))) (bvadd lt!348753 lt!348755)))))

(assert (=> b!221001 (or (not (= (bvand lt!348753 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!348755 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!348753 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!348753 lt!348755) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!221001 (= lt!348755 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!221001 (= lt!348753 (bitIndex!0 (size!4742 (buf!5289 bs!62)) (currentByte!9925 bs!62) (currentBit!9920 bs!62)))))

(declare-fun lt!348752 () Bool)

(assert (=> b!221001 (= lt!348752 (not (= (bvand ((_ sign_extend 24) (select (arr!5672 (buf!5289 bs!62)) (currentByte!9925 bs!62))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9920 bs!62)))) #b00000000000000000000000000000000)))))

(declare-fun lt!348756 () Bool)

(assert (=> b!221001 (= lt!348756 (not (= (bvand ((_ sign_extend 24) (select (arr!5672 (buf!5289 bs!62)) (currentByte!9925 bs!62))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9920 bs!62)))) #b00000000000000000000000000000000)))))

(declare-fun lt!348758 () Bool)

(assert (=> b!221001 (= lt!348758 (not (= (bvand ((_ sign_extend 24) (select (arr!5672 (buf!5289 bs!62)) (currentByte!9925 bs!62))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9920 bs!62)))) #b00000000000000000000000000000000)))))

(assert (= (and d!74407 res!186110) b!221001))

(declare-fun m!339681 () Bool)

(assert (=> d!74407 m!339681))

(declare-fun m!339683 () Bool)

(assert (=> d!74407 m!339683))

(declare-fun m!339685 () Bool)

(assert (=> d!74407 m!339685))

(declare-fun m!339687 () Bool)

(assert (=> d!74407 m!339687))

(assert (=> b!221001 m!339685))

(assert (=> b!221001 m!339681))

(declare-fun m!339689 () Bool)

(assert (=> b!221001 m!339689))

(assert (=> b!221001 m!339683))

(assert (=> b!221001 m!339629))

(assert (=> d!74375 d!74407))

(declare-fun d!74409 () Bool)

(assert (=> d!74409 (= (invariant!0 (currentBit!9920 bs!62) (currentByte!9925 bs!62) (size!4742 (buf!5289 bs!62))) (and (bvsge (currentBit!9920 bs!62) #b00000000000000000000000000000000) (bvslt (currentBit!9920 bs!62) #b00000000000000000000000000001000) (bvsge (currentByte!9925 bs!62) #b00000000000000000000000000000000) (or (bvslt (currentByte!9925 bs!62) (size!4742 (buf!5289 bs!62))) (and (= (currentBit!9920 bs!62) #b00000000000000000000000000000000) (= (currentByte!9925 bs!62) (size!4742 (buf!5289 bs!62)))))))))

(assert (=> d!74359 d!74409))

(declare-fun d!74411 () Bool)

(assert (=> d!74411 (= (remainingBits!0 ((_ sign_extend 32) (size!4742 (buf!5289 bs!62))) ((_ sign_extend 32) (currentByte!9925 bs!62)) ((_ sign_extend 32) (currentBit!9920 bs!62))) (bvsub (bvmul ((_ sign_extend 32) (size!4742 (buf!5289 bs!62))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9925 bs!62)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9920 bs!62)))))))

(assert (=> d!74357 d!74411))

(declare-fun d!74415 () Bool)

(declare-fun e!150066 () Bool)

(assert (=> d!74415 e!150066))

(declare-fun res!186120 () Bool)

(assert (=> d!74415 (=> (not res!186120) (not e!150066))))

(declare-fun lt!348783 () (_ BitVec 64))

(declare-fun lt!348787 () (_ BitVec 64))

(declare-fun lt!348786 () (_ BitVec 64))

(assert (=> d!74415 (= res!186120 (= lt!348783 (bvsub lt!348787 lt!348786)))))

(assert (=> d!74415 (or (= (bvand lt!348787 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!348786 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!348787 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!348787 lt!348786) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74415 (= lt!348786 (remainingBits!0 ((_ sign_extend 32) (size!4742 (buf!5289 lt!348688))) ((_ sign_extend 32) (currentByte!9925 lt!348688)) ((_ sign_extend 32) (currentBit!9920 lt!348688))))))

(declare-fun lt!348784 () (_ BitVec 64))

(declare-fun lt!348785 () (_ BitVec 64))

(assert (=> d!74415 (= lt!348787 (bvmul lt!348784 lt!348785))))

(assert (=> d!74415 (or (= lt!348784 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!348785 (bvsdiv (bvmul lt!348784 lt!348785) lt!348784)))))

(assert (=> d!74415 (= lt!348785 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!74415 (= lt!348784 ((_ sign_extend 32) (size!4742 (buf!5289 lt!348688))))))

(assert (=> d!74415 (= lt!348783 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9925 lt!348688)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9920 lt!348688))))))

(assert (=> d!74415 (invariant!0 (currentBit!9920 lt!348688) (currentByte!9925 lt!348688) (size!4742 (buf!5289 lt!348688)))))

(assert (=> d!74415 (= (bitIndex!0 (size!4742 (buf!5289 lt!348688)) (currentByte!9925 lt!348688) (currentBit!9920 lt!348688)) lt!348783)))

(declare-fun b!221010 () Bool)

(declare-fun res!186119 () Bool)

(assert (=> b!221010 (=> (not res!186119) (not e!150066))))

(assert (=> b!221010 (= res!186119 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!348783))))

(declare-fun b!221011 () Bool)

(declare-fun lt!348788 () (_ BitVec 64))

(assert (=> b!221011 (= e!150066 (bvsle lt!348783 (bvmul lt!348788 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!221011 (or (= lt!348788 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!348788 #b0000000000000000000000000000000000000000000000000000000000001000) lt!348788)))))

(assert (=> b!221011 (= lt!348788 ((_ sign_extend 32) (size!4742 (buf!5289 lt!348688))))))

(assert (= (and d!74415 res!186120) b!221010))

(assert (= (and b!221010 res!186119) b!221011))

(declare-fun m!339691 () Bool)

(assert (=> d!74415 m!339691))

(declare-fun m!339693 () Bool)

(assert (=> d!74415 m!339693))

(assert (=> d!74365 d!74415))

(declare-fun d!74417 () Bool)

(declare-fun e!150067 () Bool)

(assert (=> d!74417 e!150067))

(declare-fun res!186122 () Bool)

(assert (=> d!74417 (=> (not res!186122) (not e!150067))))

(declare-fun lt!348792 () (_ BitVec 64))

(declare-fun lt!348789 () (_ BitVec 64))

(declare-fun lt!348793 () (_ BitVec 64))

(assert (=> d!74417 (= res!186122 (= lt!348789 (bvsub lt!348793 lt!348792)))))

(assert (=> d!74417 (or (= (bvand lt!348793 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!348792 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!348793 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!348793 lt!348792) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74417 (= lt!348792 (remainingBits!0 ((_ sign_extend 32) (size!4742 (buf!5289 bs!62))) ((_ sign_extend 32) (currentByte!9925 bs!62)) ((_ sign_extend 32) (currentBit!9920 bs!62))))))

(declare-fun lt!348790 () (_ BitVec 64))

(declare-fun lt!348791 () (_ BitVec 64))

(assert (=> d!74417 (= lt!348793 (bvmul lt!348790 lt!348791))))

(assert (=> d!74417 (or (= lt!348790 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!348791 (bvsdiv (bvmul lt!348790 lt!348791) lt!348790)))))

(assert (=> d!74417 (= lt!348791 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!74417 (= lt!348790 ((_ sign_extend 32) (size!4742 (buf!5289 bs!62))))))

(assert (=> d!74417 (= lt!348789 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9925 bs!62)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9920 bs!62))))))

(assert (=> d!74417 (invariant!0 (currentBit!9920 bs!62) (currentByte!9925 bs!62) (size!4742 (buf!5289 bs!62)))))

(assert (=> d!74417 (= (bitIndex!0 (size!4742 (buf!5289 bs!62)) (currentByte!9925 bs!62) (currentBit!9920 bs!62)) lt!348789)))

(declare-fun b!221012 () Bool)

(declare-fun res!186121 () Bool)

(assert (=> b!221012 (=> (not res!186121) (not e!150067))))

(assert (=> b!221012 (= res!186121 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!348789))))

(declare-fun b!221013 () Bool)

(declare-fun lt!348794 () (_ BitVec 64))

(assert (=> b!221013 (= e!150067 (bvsle lt!348789 (bvmul lt!348794 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!221013 (or (= lt!348794 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!348794 #b0000000000000000000000000000000000000000000000000000000000001000) lt!348794)))))

(assert (=> b!221013 (= lt!348794 ((_ sign_extend 32) (size!4742 (buf!5289 bs!62))))))

(assert (= (and d!74417 res!186122) b!221012))

(assert (= (and b!221012 res!186121) b!221013))

(assert (=> d!74417 m!339619))

(assert (=> d!74417 m!339621))

(assert (=> d!74365 d!74417))

(declare-fun d!74419 () Bool)

(declare-fun lt!348851 () (_ BitVec 32))

(assert (=> d!74419 (= lt!348851 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!348853 () (_ BitVec 32))

(assert (=> d!74419 (= lt!348853 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!150087 () Bool)

(assert (=> d!74419 e!150087))

(declare-fun res!186140 () Bool)

(assert (=> d!74419 (=> (not res!186140) (not e!150087))))

(assert (=> d!74419 (= res!186140 (moveBitIndexPrecond!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun Unit!15619 () Unit!15613)

(declare-fun Unit!15620 () Unit!15613)

(declare-fun Unit!15621 () Unit!15613)

(assert (=> d!74419 (= (moveBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001) (ite (bvslt (bvadd (currentBit!9920 bs!62) lt!348851) #b00000000000000000000000000000000) (tuple2!18971 Unit!15619 (BitStream!8593 (buf!5289 bs!62) (bvsub (bvadd (currentByte!9925 bs!62) lt!348853) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!348851 (currentBit!9920 bs!62)))) (ite (bvsge (bvadd (currentBit!9920 bs!62) lt!348851) #b00000000000000000000000000001000) (tuple2!18971 Unit!15620 (BitStream!8593 (buf!5289 bs!62) (bvadd (currentByte!9925 bs!62) lt!348853 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!9920 bs!62) lt!348851) #b00000000000000000000000000001000))) (tuple2!18971 Unit!15621 (BitStream!8593 (buf!5289 bs!62) (bvadd (currentByte!9925 bs!62) lt!348853) (bvadd (currentBit!9920 bs!62) lt!348851))))))))

(declare-fun b!221030 () Bool)

(declare-fun e!150086 () Bool)

(assert (=> b!221030 (= e!150087 e!150086)))

(declare-fun res!186139 () Bool)

(assert (=> b!221030 (=> (not res!186139) (not e!150086))))

(declare-fun lt!348854 () (_ BitVec 64))

(declare-fun lt!348855 () tuple2!18970)

(assert (=> b!221030 (= res!186139 (= (bvadd lt!348854 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4742 (buf!5289 (_2!10143 lt!348855))) (currentByte!9925 (_2!10143 lt!348855)) (currentBit!9920 (_2!10143 lt!348855)))))))

(assert (=> b!221030 (or (not (= (bvand lt!348854 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!348854 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!348854 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!221030 (= lt!348854 (bitIndex!0 (size!4742 (buf!5289 bs!62)) (currentByte!9925 bs!62) (currentBit!9920 bs!62)))))

(declare-fun lt!348852 () (_ BitVec 32))

(declare-fun lt!348856 () (_ BitVec 32))

(declare-fun Unit!15622 () Unit!15613)

(declare-fun Unit!15623 () Unit!15613)

(declare-fun Unit!15624 () Unit!15613)

(assert (=> b!221030 (= lt!348855 (ite (bvslt (bvadd (currentBit!9920 bs!62) lt!348852) #b00000000000000000000000000000000) (tuple2!18971 Unit!15622 (BitStream!8593 (buf!5289 bs!62) (bvsub (bvadd (currentByte!9925 bs!62) lt!348856) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!348852 (currentBit!9920 bs!62)))) (ite (bvsge (bvadd (currentBit!9920 bs!62) lt!348852) #b00000000000000000000000000001000) (tuple2!18971 Unit!15623 (BitStream!8593 (buf!5289 bs!62) (bvadd (currentByte!9925 bs!62) lt!348856 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!9920 bs!62) lt!348852) #b00000000000000000000000000001000))) (tuple2!18971 Unit!15624 (BitStream!8593 (buf!5289 bs!62) (bvadd (currentByte!9925 bs!62) lt!348856) (bvadd (currentBit!9920 bs!62) lt!348852))))))))

(assert (=> b!221030 (= lt!348852 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!221030 (= lt!348856 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!221031 () Bool)

(assert (=> b!221031 (= e!150086 (and (= (size!4742 (buf!5289 bs!62)) (size!4742 (buf!5289 (_2!10143 lt!348855)))) (= (buf!5289 bs!62) (buf!5289 (_2!10143 lt!348855)))))))

(assert (= (and d!74419 res!186140) b!221030))

(assert (= (and b!221030 res!186139) b!221031))

(assert (=> d!74419 m!339633))

(declare-fun m!339701 () Bool)

(assert (=> b!221030 m!339701))

(assert (=> b!221030 m!339629))

(assert (=> d!74365 d!74419))

(declare-fun d!74433 () Bool)

(declare-fun res!186147 () Bool)

(declare-fun e!150094 () Bool)

(assert (=> d!74433 (=> (not res!186147) (not e!150094))))

(assert (=> d!74433 (= res!186147 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!4742 (buf!5289 bs!62)))) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4742 (buf!5289 bs!62)))))))))

(assert (=> d!74433 (= (moveBitIndexPrecond!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001) e!150094)))

(declare-fun b!221040 () Bool)

(declare-fun lt!348869 () (_ BitVec 64))

(assert (=> b!221040 (= e!150094 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!348869) (bvsle lt!348869 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4742 (buf!5289 bs!62)))))))))

(assert (=> b!221040 (= lt!348869 (bvadd (bitIndex!0 (size!4742 (buf!5289 bs!62)) (currentByte!9925 bs!62) (currentBit!9920 bs!62)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (= (and d!74433 res!186147) b!221040))

(assert (=> b!221040 m!339629))

(assert (=> d!74365 d!74433))

(declare-fun e!150097 () tuple2!18968)

(declare-fun b!221041 () Bool)

(assert (=> b!221041 (= e!150097 (tuple2!18969 (bvor acc!113 e!150023) (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!221042 () Bool)

(declare-fun e!150095 () Bool)

(declare-fun e!150096 () Bool)

(assert (=> b!221042 (= e!150095 e!150096)))

(declare-fun res!186152 () Bool)

(assert (=> b!221042 (=> res!186152 e!150096)))

(assert (=> b!221042 (= res!186152 (not (bvslt (bvadd #b00000000000000000000000000000001 i!541) nBits!265)))))

(declare-fun b!221043 () Bool)

(declare-fun lt!348875 () tuple2!18968)

(assert (=> b!221043 (= e!150097 (tuple2!18969 (_1!10142 lt!348875) (_2!10142 lt!348875)))))

(declare-fun lt!348871 () tuple2!18972)

(assert (=> b!221043 (= lt!348871 (readBit!0 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!221043 (= lt!348875 (readNBitsLSBFirstsLoop!0 (_2!10144 lt!348871) nBits!265 (bvadd #b00000000000000000000000000000001 i!541 #b00000000000000000000000000000001) (bvor (bvor acc!113 e!150023) (ite (_1!10144 lt!348871) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!541))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!221044 () Bool)

(declare-fun lt!348873 () (_ BitVec 64))

(declare-fun lt!348870 () tuple2!18968)

(assert (=> b!221044 (= e!150096 (= (= (bvand (bvlshr (_1!10142 lt!348870) lt!348873) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!10139 (readBitPure!0 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)))))))

(assert (=> b!221044 (and (bvsge lt!348873 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!348873 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!221044 (= lt!348873 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!541)))))

(declare-fun b!221045 () Bool)

(declare-fun res!186149 () Bool)

(assert (=> b!221045 (=> (not res!186149) (not e!150095))))

(assert (=> b!221045 (= res!186149 (= (bvand (_1!10142 lt!348870) (onesLSBLong!0 nBits!265)) (_1!10142 lt!348870)))))

(declare-fun b!221046 () Bool)

(declare-fun res!186150 () Bool)

(assert (=> b!221046 (=> (not res!186150) (not e!150095))))

(assert (=> b!221046 (= res!186150 (= (bvand (_1!10142 lt!348870) (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!541))) (bvand (bvor acc!113 e!150023) (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!541)))))))

(declare-fun d!74441 () Bool)

(assert (=> d!74441 e!150095))

(declare-fun res!186148 () Bool)

(assert (=> d!74441 (=> (not res!186148) (not e!150095))))

(assert (=> d!74441 (= res!186148 (= (buf!5289 (_2!10142 lt!348870)) (buf!5289 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> d!74441 (= lt!348870 e!150097)))

(declare-fun c!10707 () Bool)

(assert (=> d!74441 (= c!10707 (= nBits!265 (bvadd #b00000000000000000000000000000001 i!541)))))

(assert (=> d!74441 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!541)) (bvsle (bvadd #b00000000000000000000000000000001 i!541) nBits!265) (bvsle nBits!265 #b00000000000000000000000001000000))))

(assert (=> d!74441 (= (readNBitsLSBFirstsLoop!0 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!265 (bvadd #b00000000000000000000000000000001 i!541) (bvor acc!113 e!150023)) lt!348870)))

(declare-fun b!221047 () Bool)

(declare-fun res!186151 () Bool)

(assert (=> b!221047 (=> (not res!186151) (not e!150095))))

(declare-fun lt!348872 () (_ BitVec 64))

(declare-fun lt!348874 () (_ BitVec 64))

(assert (=> b!221047 (= res!186151 (= (bitIndex!0 (size!4742 (buf!5289 (_2!10142 lt!348870))) (currentByte!9925 (_2!10142 lt!348870)) (currentBit!9920 (_2!10142 lt!348870))) (bvadd lt!348874 lt!348872)))))

(assert (=> b!221047 (or (not (= (bvand lt!348874 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!348872 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!348874 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!348874 lt!348872) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!221047 (= lt!348872 ((_ sign_extend 32) (bvsub nBits!265 (bvadd #b00000000000000000000000000000001 i!541))))))

(assert (=> b!221047 (or (= (bvand nBits!265 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!541) #b10000000000000000000000000000000)) (= (bvand nBits!265 #b10000000000000000000000000000000) (bvand (bvsub nBits!265 (bvadd #b00000000000000000000000000000001 i!541)) #b10000000000000000000000000000000)))))

(assert (=> b!221047 (= lt!348874 (bitIndex!0 (size!4742 (buf!5289 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))) (currentByte!9925 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)) (currentBit!9920 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!74441 c!10707) b!221041))

(assert (= (and d!74441 (not c!10707)) b!221043))

(assert (= (and d!74441 res!186148) b!221047))

(assert (= (and b!221047 res!186151) b!221046))

(assert (= (and b!221046 res!186150) b!221045))

(assert (= (and b!221045 res!186149) b!221042))

(assert (= (and b!221042 (not res!186152)) b!221044))

(assert (=> b!221043 m!339591))

(declare-fun m!339713 () Bool)

(assert (=> b!221043 m!339713))

(declare-fun m!339715 () Bool)

(assert (=> b!221043 m!339715))

(declare-fun m!339717 () Bool)

(assert (=> b!221046 m!339717))

(assert (=> b!221044 m!339591))

(declare-fun m!339719 () Bool)

(assert (=> b!221044 m!339719))

(declare-fun m!339721 () Bool)

(assert (=> b!221047 m!339721))

(declare-fun m!339723 () Bool)

(assert (=> b!221047 m!339723))

(assert (=> b!221045 m!339679))

(assert (=> d!74363 d!74441))

(check-sat (not b!221046) (not b!221040) (not b!221043) (not b!221045) (not b!221044) (not b!221047) (not d!74417) (not b!220996) (not b!221001) (not d!74419) (not b!220995) (not b!220998) (not d!74407) (not b!221030) (not b!220997) (not d!74415) (not b!220994))
(check-sat)
(get-model)

(declare-fun d!74465 () Bool)

(declare-fun e!150142 () Bool)

(assert (=> d!74465 e!150142))

(declare-fun res!186213 () Bool)

(assert (=> d!74465 (=> (not res!186213) (not e!150142))))

(assert (=> d!74465 (= res!186213 (= (buf!5289 (_2!10143 (increaseBitIndex!0 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)))) (buf!5289 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun lt!348995 () Bool)

(assert (=> d!74465 (= lt!348995 (not (= (bvand ((_ sign_extend 24) (select (arr!5672 (buf!5289 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))) (currentByte!9925 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9920 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))))) #b00000000000000000000000000000000)))))

(declare-fun lt!348992 () tuple2!18972)

(assert (=> d!74465 (= lt!348992 (tuple2!18973 (not (= (bvand ((_ sign_extend 24) (select (arr!5672 (buf!5289 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))) (currentByte!9925 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9920 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))))) #b00000000000000000000000000000000)) (_2!10143 (increaseBitIndex!0 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)))))))

(assert (=> d!74465 (validate_offset_bit!0 ((_ sign_extend 32) (size!4742 (buf!5289 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)))) ((_ sign_extend 32) (currentByte!9925 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))) ((_ sign_extend 32) (currentBit!9920 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> d!74465 (= (readBit!0 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)) lt!348992)))

(declare-fun lt!348991 () (_ BitVec 64))

(declare-fun b!221125 () Bool)

(declare-fun lt!348993 () (_ BitVec 64))

(assert (=> b!221125 (= e!150142 (= (bitIndex!0 (size!4742 (buf!5289 (_2!10143 (increaseBitIndex!0 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))))) (currentByte!9925 (_2!10143 (increaseBitIndex!0 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)))) (currentBit!9920 (_2!10143 (increaseBitIndex!0 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))))) (bvadd lt!348991 lt!348993)))))

(assert (=> b!221125 (or (not (= (bvand lt!348991 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!348993 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!348991 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!348991 lt!348993) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!221125 (= lt!348993 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!221125 (= lt!348991 (bitIndex!0 (size!4742 (buf!5289 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))) (currentByte!9925 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)) (currentBit!9920 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun lt!348990 () Bool)

(assert (=> b!221125 (= lt!348990 (not (= (bvand ((_ sign_extend 24) (select (arr!5672 (buf!5289 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))) (currentByte!9925 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9920 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))))) #b00000000000000000000000000000000)))))

(declare-fun lt!348994 () Bool)

(assert (=> b!221125 (= lt!348994 (not (= (bvand ((_ sign_extend 24) (select (arr!5672 (buf!5289 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))) (currentByte!9925 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9920 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))))) #b00000000000000000000000000000000)))))

(declare-fun lt!348996 () Bool)

(assert (=> b!221125 (= lt!348996 (not (= (bvand ((_ sign_extend 24) (select (arr!5672 (buf!5289 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))) (currentByte!9925 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9920 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))))) #b00000000000000000000000000000000)))))

(assert (= (and d!74465 res!186213) b!221125))

(assert (=> d!74465 m!339591))

(declare-fun m!339781 () Bool)

(assert (=> d!74465 m!339781))

(declare-fun m!339783 () Bool)

(assert (=> d!74465 m!339783))

(declare-fun m!339785 () Bool)

(assert (=> d!74465 m!339785))

(declare-fun m!339787 () Bool)

(assert (=> d!74465 m!339787))

(assert (=> b!221125 m!339785))

(assert (=> b!221125 m!339591))

(assert (=> b!221125 m!339781))

(declare-fun m!339789 () Bool)

(assert (=> b!221125 m!339789))

(assert (=> b!221125 m!339783))

(assert (=> b!221125 m!339723))

(assert (=> b!221043 d!74465))

(declare-fun b!221126 () Bool)

(declare-fun e!150145 () tuple2!18968)

(assert (=> b!221126 (= e!150145 (tuple2!18969 (bvor (bvor acc!113 e!150023) (ite (_1!10144 lt!348871) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!541))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_2!10144 lt!348871)))))

(declare-fun b!221127 () Bool)

(declare-fun e!150143 () Bool)

(declare-fun e!150144 () Bool)

(assert (=> b!221127 (= e!150143 e!150144)))

(declare-fun res!186218 () Bool)

(assert (=> b!221127 (=> res!186218 e!150144)))

(assert (=> b!221127 (= res!186218 (not (bvslt (bvadd #b00000000000000000000000000000001 i!541 #b00000000000000000000000000000001) nBits!265)))))

(declare-fun b!221128 () Bool)

(declare-fun lt!349002 () tuple2!18968)

(assert (=> b!221128 (= e!150145 (tuple2!18969 (_1!10142 lt!349002) (_2!10142 lt!349002)))))

(declare-fun lt!348998 () tuple2!18972)

(assert (=> b!221128 (= lt!348998 (readBit!0 (_2!10144 lt!348871)))))

(assert (=> b!221128 (= lt!349002 (readNBitsLSBFirstsLoop!0 (_2!10144 lt!348998) nBits!265 (bvadd #b00000000000000000000000000000001 i!541 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvor (bvor (bvor acc!113 e!150023) (ite (_1!10144 lt!348871) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!541))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite (_1!10144 lt!348998) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!541 #b00000000000000000000000000000001))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!221129 () Bool)

(declare-fun lt!348997 () tuple2!18968)

(declare-fun lt!349000 () (_ BitVec 64))

(assert (=> b!221129 (= e!150144 (= (= (bvand (bvlshr (_1!10142 lt!348997) lt!349000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!10139 (readBitPure!0 (_2!10144 lt!348871)))))))

(assert (=> b!221129 (and (bvsge lt!349000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!349000 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!221129 (= lt!349000 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!541 #b00000000000000000000000000000001)))))

(declare-fun b!221130 () Bool)

(declare-fun res!186215 () Bool)

(assert (=> b!221130 (=> (not res!186215) (not e!150143))))

(assert (=> b!221130 (= res!186215 (= (bvand (_1!10142 lt!348997) (onesLSBLong!0 nBits!265)) (_1!10142 lt!348997)))))

(declare-fun b!221131 () Bool)

(declare-fun res!186216 () Bool)

(assert (=> b!221131 (=> (not res!186216) (not e!150143))))

(assert (=> b!221131 (= res!186216 (= (bvand (_1!10142 lt!348997) (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!541 #b00000000000000000000000000000001))) (bvand (bvor (bvor acc!113 e!150023) (ite (_1!10144 lt!348871) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!541))) #b0000000000000000000000000000000000000000000000000000000000000000)) (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!541 #b00000000000000000000000000000001)))))))

(declare-fun d!74467 () Bool)

(assert (=> d!74467 e!150143))

(declare-fun res!186214 () Bool)

(assert (=> d!74467 (=> (not res!186214) (not e!150143))))

(assert (=> d!74467 (= res!186214 (= (buf!5289 (_2!10142 lt!348997)) (buf!5289 (_2!10144 lt!348871))))))

(assert (=> d!74467 (= lt!348997 e!150145)))

(declare-fun c!10716 () Bool)

(assert (=> d!74467 (= c!10716 (= nBits!265 (bvadd #b00000000000000000000000000000001 i!541 #b00000000000000000000000000000001)))))

(assert (=> d!74467 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!541 #b00000000000000000000000000000001)) (bvsle (bvadd #b00000000000000000000000000000001 i!541 #b00000000000000000000000000000001) nBits!265) (bvsle nBits!265 #b00000000000000000000000001000000))))

(assert (=> d!74467 (= (readNBitsLSBFirstsLoop!0 (_2!10144 lt!348871) nBits!265 (bvadd #b00000000000000000000000000000001 i!541 #b00000000000000000000000000000001) (bvor (bvor acc!113 e!150023) (ite (_1!10144 lt!348871) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!541))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!348997)))

(declare-fun b!221132 () Bool)

(declare-fun res!186217 () Bool)

(assert (=> b!221132 (=> (not res!186217) (not e!150143))))

(declare-fun lt!349001 () (_ BitVec 64))

(declare-fun lt!348999 () (_ BitVec 64))

(assert (=> b!221132 (= res!186217 (= (bitIndex!0 (size!4742 (buf!5289 (_2!10142 lt!348997))) (currentByte!9925 (_2!10142 lt!348997)) (currentBit!9920 (_2!10142 lt!348997))) (bvadd lt!349001 lt!348999)))))

(assert (=> b!221132 (or (not (= (bvand lt!349001 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!348999 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!349001 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!349001 lt!348999) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!221132 (= lt!348999 ((_ sign_extend 32) (bvsub nBits!265 (bvadd #b00000000000000000000000000000001 i!541 #b00000000000000000000000000000001))))))

(assert (=> b!221132 (or (= (bvand nBits!265 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!541 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!265 #b10000000000000000000000000000000) (bvand (bvsub nBits!265 (bvadd #b00000000000000000000000000000001 i!541 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!221132 (= lt!349001 (bitIndex!0 (size!4742 (buf!5289 (_2!10144 lt!348871))) (currentByte!9925 (_2!10144 lt!348871)) (currentBit!9920 (_2!10144 lt!348871))))))

(assert (= (and d!74467 c!10716) b!221126))

(assert (= (and d!74467 (not c!10716)) b!221128))

(assert (= (and d!74467 res!186214) b!221132))

(assert (= (and b!221132 res!186217) b!221131))

(assert (= (and b!221131 res!186216) b!221130))

(assert (= (and b!221130 res!186215) b!221127))

(assert (= (and b!221127 (not res!186218)) b!221129))

(declare-fun m!339791 () Bool)

(assert (=> b!221128 m!339791))

(declare-fun m!339793 () Bool)

(assert (=> b!221128 m!339793))

(declare-fun m!339795 () Bool)

(assert (=> b!221131 m!339795))

(declare-fun m!339797 () Bool)

(assert (=> b!221129 m!339797))

(declare-fun m!339799 () Bool)

(assert (=> b!221132 m!339799))

(declare-fun m!339801 () Bool)

(assert (=> b!221132 m!339801))

(assert (=> b!221130 m!339679))

(assert (=> b!221043 d!74467))

(declare-fun d!74469 () Bool)

(declare-fun lt!349003 () tuple2!18972)

(assert (=> d!74469 (= lt!349003 (readBit!0 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!74469 (= (readBitPure!0 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)) (tuple2!18963 (_2!10144 lt!349003) (_1!10144 lt!349003)))))

(declare-fun bs!18212 () Bool)

(assert (= bs!18212 d!74469))

(assert (=> bs!18212 m!339591))

(assert (=> bs!18212 m!339713))

(assert (=> b!221044 d!74469))

(assert (=> d!74417 d!74411))

(assert (=> d!74417 d!74409))

(declare-fun d!74471 () Bool)

(assert (=> d!74471 (= (onesLSBLong!0 nBits!265) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!265))))))

(assert (=> b!221045 d!74471))

(declare-fun d!74473 () Bool)

(declare-fun e!150146 () Bool)

(assert (=> d!74473 e!150146))

(declare-fun res!186220 () Bool)

(assert (=> d!74473 (=> (not res!186220) (not e!150146))))

(declare-fun lt!349007 () (_ BitVec 64))

(declare-fun lt!349004 () (_ BitVec 64))

(declare-fun lt!349008 () (_ BitVec 64))

(assert (=> d!74473 (= res!186220 (= lt!349004 (bvsub lt!349008 lt!349007)))))

(assert (=> d!74473 (or (= (bvand lt!349008 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!349007 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!349008 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!349008 lt!349007) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74473 (= lt!349007 (remainingBits!0 ((_ sign_extend 32) (size!4742 (buf!5289 (_2!10143 (increaseBitIndex!0 bs!62))))) ((_ sign_extend 32) (currentByte!9925 (_2!10143 (increaseBitIndex!0 bs!62)))) ((_ sign_extend 32) (currentBit!9920 (_2!10143 (increaseBitIndex!0 bs!62))))))))

(declare-fun lt!349005 () (_ BitVec 64))

(declare-fun lt!349006 () (_ BitVec 64))

(assert (=> d!74473 (= lt!349008 (bvmul lt!349005 lt!349006))))

(assert (=> d!74473 (or (= lt!349005 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!349006 (bvsdiv (bvmul lt!349005 lt!349006) lt!349005)))))

(assert (=> d!74473 (= lt!349006 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!74473 (= lt!349005 ((_ sign_extend 32) (size!4742 (buf!5289 (_2!10143 (increaseBitIndex!0 bs!62))))))))

(assert (=> d!74473 (= lt!349004 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9925 (_2!10143 (increaseBitIndex!0 bs!62)))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9920 (_2!10143 (increaseBitIndex!0 bs!62))))))))

(assert (=> d!74473 (invariant!0 (currentBit!9920 (_2!10143 (increaseBitIndex!0 bs!62))) (currentByte!9925 (_2!10143 (increaseBitIndex!0 bs!62))) (size!4742 (buf!5289 (_2!10143 (increaseBitIndex!0 bs!62)))))))

(assert (=> d!74473 (= (bitIndex!0 (size!4742 (buf!5289 (_2!10143 (increaseBitIndex!0 bs!62)))) (currentByte!9925 (_2!10143 (increaseBitIndex!0 bs!62))) (currentBit!9920 (_2!10143 (increaseBitIndex!0 bs!62)))) lt!349004)))

(declare-fun b!221133 () Bool)

(declare-fun res!186219 () Bool)

(assert (=> b!221133 (=> (not res!186219) (not e!150146))))

(assert (=> b!221133 (= res!186219 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!349004))))

(declare-fun b!221134 () Bool)

(declare-fun lt!349009 () (_ BitVec 64))

(assert (=> b!221134 (= e!150146 (bvsle lt!349004 (bvmul lt!349009 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!221134 (or (= lt!349009 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!349009 #b0000000000000000000000000000000000000000000000000000000000001000) lt!349009)))))

(assert (=> b!221134 (= lt!349009 ((_ sign_extend 32) (size!4742 (buf!5289 (_2!10143 (increaseBitIndex!0 bs!62))))))))

(assert (= (and d!74473 res!186220) b!221133))

(assert (= (and b!221133 res!186219) b!221134))

(declare-fun m!339803 () Bool)

(assert (=> d!74473 m!339803))

(declare-fun m!339805 () Bool)

(assert (=> d!74473 m!339805))

(assert (=> b!221001 d!74473))

(declare-fun d!74475 () Bool)

(declare-fun e!150149 () Bool)

(assert (=> d!74475 e!150149))

(declare-fun res!186225 () Bool)

(assert (=> d!74475 (=> (not res!186225) (not e!150149))))

(declare-fun lt!349022 () (_ BitVec 64))

(declare-fun lt!349020 () tuple2!18970)

(declare-fun lt!349021 () (_ BitVec 64))

(assert (=> d!74475 (= res!186225 (= (bvadd lt!349022 lt!349021) (bitIndex!0 (size!4742 (buf!5289 (_2!10143 lt!349020))) (currentByte!9925 (_2!10143 lt!349020)) (currentBit!9920 (_2!10143 lt!349020)))))))

(assert (=> d!74475 (or (not (= (bvand lt!349022 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!349021 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!349022 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!349022 lt!349021) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74475 (= lt!349021 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!74475 (= lt!349022 (bitIndex!0 (size!4742 (buf!5289 bs!62)) (currentByte!9925 bs!62) (currentBit!9920 bs!62)))))

(declare-fun Unit!15637 () Unit!15613)

(declare-fun Unit!15638 () Unit!15613)

(assert (=> d!74475 (= lt!349020 (ite (bvslt (currentBit!9920 bs!62) #b00000000000000000000000000000111) (tuple2!18971 Unit!15637 (BitStream!8593 (buf!5289 bs!62) (currentByte!9925 bs!62) (bvadd (currentBit!9920 bs!62) #b00000000000000000000000000000001))) (tuple2!18971 Unit!15638 (BitStream!8593 (buf!5289 bs!62) (bvadd (currentByte!9925 bs!62) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (=> d!74475 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!4742 (buf!5289 bs!62))) ((_ sign_extend 32) (currentByte!9925 bs!62)) ((_ sign_extend 32) (currentBit!9920 bs!62))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!74475 (= (increaseBitIndex!0 bs!62) lt!349020)))

(declare-fun b!221139 () Bool)

(declare-fun res!186226 () Bool)

(assert (=> b!221139 (=> (not res!186226) (not e!150149))))

(declare-fun lt!349023 () (_ BitVec 64))

(declare-fun lt!349024 () (_ BitVec 64))

(assert (=> b!221139 (= res!186226 (= (bvsub lt!349023 lt!349024) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!221139 (or (= (bvand lt!349023 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!349024 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!349023 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!349023 lt!349024) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!221139 (= lt!349024 (remainingBits!0 ((_ sign_extend 32) (size!4742 (buf!5289 (_2!10143 lt!349020)))) ((_ sign_extend 32) (currentByte!9925 (_2!10143 lt!349020))) ((_ sign_extend 32) (currentBit!9920 (_2!10143 lt!349020)))))))

(assert (=> b!221139 (= lt!349023 (remainingBits!0 ((_ sign_extend 32) (size!4742 (buf!5289 bs!62))) ((_ sign_extend 32) (currentByte!9925 bs!62)) ((_ sign_extend 32) (currentBit!9920 bs!62))))))

(declare-fun b!221140 () Bool)

(assert (=> b!221140 (= e!150149 (= (size!4742 (buf!5289 bs!62)) (size!4742 (buf!5289 (_2!10143 lt!349020)))))))

(assert (= (and d!74475 res!186225) b!221139))

(assert (= (and b!221139 res!186226) b!221140))

(declare-fun m!339807 () Bool)

(assert (=> d!74475 m!339807))

(assert (=> d!74475 m!339629))

(assert (=> d!74475 m!339619))

(declare-fun m!339809 () Bool)

(assert (=> b!221139 m!339809))

(assert (=> b!221139 m!339619))

(assert (=> b!221001 d!74475))

(assert (=> b!221001 d!74417))

(assert (=> d!74407 d!74475))

(declare-fun d!74477 () Bool)

(assert (=> d!74477 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!4742 (buf!5289 bs!62))) ((_ sign_extend 32) (currentByte!9925 bs!62)) ((_ sign_extend 32) (currentBit!9920 bs!62))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4742 (buf!5289 bs!62))) ((_ sign_extend 32) (currentByte!9925 bs!62)) ((_ sign_extend 32) (currentBit!9920 bs!62))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!18213 () Bool)

(assert (= bs!18213 d!74477))

(assert (=> bs!18213 m!339619))

(assert (=> d!74407 d!74477))

(declare-fun d!74479 () Bool)

(assert (=> d!74479 (= (onesLSBLong!0 i!541) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!541))))))

(assert (=> b!220997 d!74479))

(declare-fun d!74481 () Bool)

(declare-fun e!150150 () Bool)

(assert (=> d!74481 e!150150))

(declare-fun res!186228 () Bool)

(assert (=> d!74481 (=> (not res!186228) (not e!150150))))

(declare-fun lt!349028 () (_ BitVec 64))

(declare-fun lt!349029 () (_ BitVec 64))

(declare-fun lt!349025 () (_ BitVec 64))

(assert (=> d!74481 (= res!186228 (= lt!349025 (bvsub lt!349029 lt!349028)))))

(assert (=> d!74481 (or (= (bvand lt!349029 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!349028 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!349029 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!349029 lt!349028) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74481 (= lt!349028 (remainingBits!0 ((_ sign_extend 32) (size!4742 (buf!5289 (_2!10142 lt!348732)))) ((_ sign_extend 32) (currentByte!9925 (_2!10142 lt!348732))) ((_ sign_extend 32) (currentBit!9920 (_2!10142 lt!348732)))))))

(declare-fun lt!349026 () (_ BitVec 64))

(declare-fun lt!349027 () (_ BitVec 64))

(assert (=> d!74481 (= lt!349029 (bvmul lt!349026 lt!349027))))

(assert (=> d!74481 (or (= lt!349026 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!349027 (bvsdiv (bvmul lt!349026 lt!349027) lt!349026)))))

(assert (=> d!74481 (= lt!349027 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!74481 (= lt!349026 ((_ sign_extend 32) (size!4742 (buf!5289 (_2!10142 lt!348732)))))))

(assert (=> d!74481 (= lt!349025 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9925 (_2!10142 lt!348732))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9920 (_2!10142 lt!348732)))))))

(assert (=> d!74481 (invariant!0 (currentBit!9920 (_2!10142 lt!348732)) (currentByte!9925 (_2!10142 lt!348732)) (size!4742 (buf!5289 (_2!10142 lt!348732))))))

(assert (=> d!74481 (= (bitIndex!0 (size!4742 (buf!5289 (_2!10142 lt!348732))) (currentByte!9925 (_2!10142 lt!348732)) (currentBit!9920 (_2!10142 lt!348732))) lt!349025)))

(declare-fun b!221141 () Bool)

(declare-fun res!186227 () Bool)

(assert (=> b!221141 (=> (not res!186227) (not e!150150))))

(assert (=> b!221141 (= res!186227 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!349025))))

(declare-fun b!221142 () Bool)

(declare-fun lt!349030 () (_ BitVec 64))

(assert (=> b!221142 (= e!150150 (bvsle lt!349025 (bvmul lt!349030 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!221142 (or (= lt!349030 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!349030 #b0000000000000000000000000000000000000000000000000000000000001000) lt!349030)))))

(assert (=> b!221142 (= lt!349030 ((_ sign_extend 32) (size!4742 (buf!5289 (_2!10142 lt!348732)))))))

(assert (= (and d!74481 res!186228) b!221141))

(assert (= (and b!221141 res!186227) b!221142))

(declare-fun m!339811 () Bool)

(assert (=> d!74481 m!339811))

(declare-fun m!339813 () Bool)

(assert (=> d!74481 m!339813))

(assert (=> b!220998 d!74481))

(assert (=> b!220998 d!74417))

(assert (=> b!221040 d!74417))

(assert (=> b!220994 d!74407))

(declare-fun e!150153 () tuple2!18968)

(declare-fun b!221143 () Bool)

(assert (=> b!221143 (= e!150153 (tuple2!18969 (bvor acc!113 (ite (_1!10144 lt!348733) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!541)) #b0000000000000000000000000000000000000000000000000000000000000000)) (_2!10144 lt!348733)))))

(declare-fun b!221144 () Bool)

(declare-fun e!150151 () Bool)

(declare-fun e!150152 () Bool)

(assert (=> b!221144 (= e!150151 e!150152)))

(declare-fun res!186233 () Bool)

(assert (=> b!221144 (=> res!186233 e!150152)))

(assert (=> b!221144 (= res!186233 (not (bvslt (bvadd i!541 #b00000000000000000000000000000001) nBits!265)))))

(declare-fun b!221145 () Bool)

(declare-fun lt!349036 () tuple2!18968)

(assert (=> b!221145 (= e!150153 (tuple2!18969 (_1!10142 lt!349036) (_2!10142 lt!349036)))))

(declare-fun lt!349032 () tuple2!18972)

(assert (=> b!221145 (= lt!349032 (readBit!0 (_2!10144 lt!348733)))))

(assert (=> b!221145 (= lt!349036 (readNBitsLSBFirstsLoop!0 (_2!10144 lt!349032) nBits!265 (bvadd i!541 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvor (bvor acc!113 (ite (_1!10144 lt!348733) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!541)) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite (_1!10144 lt!349032) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd i!541 #b00000000000000000000000000000001))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!349031 () tuple2!18968)

(declare-fun b!221146 () Bool)

(declare-fun lt!349034 () (_ BitVec 64))

(assert (=> b!221146 (= e!150152 (= (= (bvand (bvlshr (_1!10142 lt!349031) lt!349034) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!10139 (readBitPure!0 (_2!10144 lt!348733)))))))

(assert (=> b!221146 (and (bvsge lt!349034 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!349034 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!221146 (= lt!349034 ((_ sign_extend 32) (bvadd i!541 #b00000000000000000000000000000001)))))

(declare-fun b!221147 () Bool)

(declare-fun res!186230 () Bool)

(assert (=> b!221147 (=> (not res!186230) (not e!150151))))

(assert (=> b!221147 (= res!186230 (= (bvand (_1!10142 lt!349031) (onesLSBLong!0 nBits!265)) (_1!10142 lt!349031)))))

(declare-fun b!221148 () Bool)

(declare-fun res!186231 () Bool)

(assert (=> b!221148 (=> (not res!186231) (not e!150151))))

(assert (=> b!221148 (= res!186231 (= (bvand (_1!10142 lt!349031) (onesLSBLong!0 (bvadd i!541 #b00000000000000000000000000000001))) (bvand (bvor acc!113 (ite (_1!10144 lt!348733) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!541)) #b0000000000000000000000000000000000000000000000000000000000000000)) (onesLSBLong!0 (bvadd i!541 #b00000000000000000000000000000001)))))))

(declare-fun d!74483 () Bool)

(assert (=> d!74483 e!150151))

(declare-fun res!186229 () Bool)

(assert (=> d!74483 (=> (not res!186229) (not e!150151))))

(assert (=> d!74483 (= res!186229 (= (buf!5289 (_2!10142 lt!349031)) (buf!5289 (_2!10144 lt!348733))))))

(assert (=> d!74483 (= lt!349031 e!150153)))

(declare-fun c!10717 () Bool)

(assert (=> d!74483 (= c!10717 (= nBits!265 (bvadd i!541 #b00000000000000000000000000000001)))))

(assert (=> d!74483 (and (bvsle #b00000000000000000000000000000000 (bvadd i!541 #b00000000000000000000000000000001)) (bvsle (bvadd i!541 #b00000000000000000000000000000001) nBits!265) (bvsle nBits!265 #b00000000000000000000000001000000))))

(assert (=> d!74483 (= (readNBitsLSBFirstsLoop!0 (_2!10144 lt!348733) nBits!265 (bvadd i!541 #b00000000000000000000000000000001) (bvor acc!113 (ite (_1!10144 lt!348733) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!541)) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!349031)))

(declare-fun b!221149 () Bool)

(declare-fun res!186232 () Bool)

(assert (=> b!221149 (=> (not res!186232) (not e!150151))))

(declare-fun lt!349033 () (_ BitVec 64))

(declare-fun lt!349035 () (_ BitVec 64))

(assert (=> b!221149 (= res!186232 (= (bitIndex!0 (size!4742 (buf!5289 (_2!10142 lt!349031))) (currentByte!9925 (_2!10142 lt!349031)) (currentBit!9920 (_2!10142 lt!349031))) (bvadd lt!349035 lt!349033)))))

(assert (=> b!221149 (or (not (= (bvand lt!349035 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!349033 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!349035 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!349035 lt!349033) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!221149 (= lt!349033 ((_ sign_extend 32) (bvsub nBits!265 (bvadd i!541 #b00000000000000000000000000000001))))))

(assert (=> b!221149 (or (= (bvand nBits!265 #b10000000000000000000000000000000) (bvand (bvadd i!541 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!265 #b10000000000000000000000000000000) (bvand (bvsub nBits!265 (bvadd i!541 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!221149 (= lt!349035 (bitIndex!0 (size!4742 (buf!5289 (_2!10144 lt!348733))) (currentByte!9925 (_2!10144 lt!348733)) (currentBit!9920 (_2!10144 lt!348733))))))

(assert (= (and d!74483 c!10717) b!221143))

(assert (= (and d!74483 (not c!10717)) b!221145))

(assert (= (and d!74483 res!186229) b!221149))

(assert (= (and b!221149 res!186232) b!221148))

(assert (= (and b!221148 res!186231) b!221147))

(assert (= (and b!221147 res!186230) b!221144))

(assert (= (and b!221144 (not res!186233)) b!221146))

(declare-fun m!339815 () Bool)

(assert (=> b!221145 m!339815))

(declare-fun m!339817 () Bool)

(assert (=> b!221145 m!339817))

(declare-fun m!339819 () Bool)

(assert (=> b!221148 m!339819))

(declare-fun m!339821 () Bool)

(assert (=> b!221146 m!339821))

(declare-fun m!339823 () Bool)

(assert (=> b!221149 m!339823))

(declare-fun m!339825 () Bool)

(assert (=> b!221149 m!339825))

(assert (=> b!221147 m!339679))

(assert (=> b!220994 d!74483))

(assert (=> b!220995 d!74375))

(assert (=> b!220996 d!74471))

(declare-fun d!74485 () Bool)

(assert (=> d!74485 (= (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!541)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvadd #b00000000000000000000000000000001 i!541)))))))

(assert (=> b!221046 d!74485))

(assert (=> d!74419 d!74433))

(declare-fun d!74487 () Bool)

(assert (=> d!74487 (= (remainingBits!0 ((_ sign_extend 32) (size!4742 (buf!5289 lt!348688))) ((_ sign_extend 32) (currentByte!9925 lt!348688)) ((_ sign_extend 32) (currentBit!9920 lt!348688))) (bvsub (bvmul ((_ sign_extend 32) (size!4742 (buf!5289 lt!348688))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9925 lt!348688)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9920 lt!348688)))))))

(assert (=> d!74415 d!74487))

(declare-fun d!74489 () Bool)

(assert (=> d!74489 (= (invariant!0 (currentBit!9920 lt!348688) (currentByte!9925 lt!348688) (size!4742 (buf!5289 lt!348688))) (and (bvsge (currentBit!9920 lt!348688) #b00000000000000000000000000000000) (bvslt (currentBit!9920 lt!348688) #b00000000000000000000000000001000) (bvsge (currentByte!9925 lt!348688) #b00000000000000000000000000000000) (or (bvslt (currentByte!9925 lt!348688) (size!4742 (buf!5289 lt!348688))) (and (= (currentBit!9920 lt!348688) #b00000000000000000000000000000000) (= (currentByte!9925 lt!348688) (size!4742 (buf!5289 lt!348688)))))))))

(assert (=> d!74415 d!74489))

(declare-fun d!74491 () Bool)

(declare-fun e!150154 () Bool)

(assert (=> d!74491 e!150154))

(declare-fun res!186235 () Bool)

(assert (=> d!74491 (=> (not res!186235) (not e!150154))))

(declare-fun lt!349041 () (_ BitVec 64))

(declare-fun lt!349037 () (_ BitVec 64))

(declare-fun lt!349040 () (_ BitVec 64))

(assert (=> d!74491 (= res!186235 (= lt!349037 (bvsub lt!349041 lt!349040)))))

(assert (=> d!74491 (or (= (bvand lt!349041 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!349040 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!349041 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!349041 lt!349040) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74491 (= lt!349040 (remainingBits!0 ((_ sign_extend 32) (size!4742 (buf!5289 (_2!10143 lt!348855)))) ((_ sign_extend 32) (currentByte!9925 (_2!10143 lt!348855))) ((_ sign_extend 32) (currentBit!9920 (_2!10143 lt!348855)))))))

(declare-fun lt!349038 () (_ BitVec 64))

(declare-fun lt!349039 () (_ BitVec 64))

(assert (=> d!74491 (= lt!349041 (bvmul lt!349038 lt!349039))))

(assert (=> d!74491 (or (= lt!349038 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!349039 (bvsdiv (bvmul lt!349038 lt!349039) lt!349038)))))

(assert (=> d!74491 (= lt!349039 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!74491 (= lt!349038 ((_ sign_extend 32) (size!4742 (buf!5289 (_2!10143 lt!348855)))))))

(assert (=> d!74491 (= lt!349037 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9925 (_2!10143 lt!348855))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9920 (_2!10143 lt!348855)))))))

(assert (=> d!74491 (invariant!0 (currentBit!9920 (_2!10143 lt!348855)) (currentByte!9925 (_2!10143 lt!348855)) (size!4742 (buf!5289 (_2!10143 lt!348855))))))

(assert (=> d!74491 (= (bitIndex!0 (size!4742 (buf!5289 (_2!10143 lt!348855))) (currentByte!9925 (_2!10143 lt!348855)) (currentBit!9920 (_2!10143 lt!348855))) lt!349037)))

(declare-fun b!221150 () Bool)

(declare-fun res!186234 () Bool)

(assert (=> b!221150 (=> (not res!186234) (not e!150154))))

(assert (=> b!221150 (= res!186234 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!349037))))

(declare-fun b!221151 () Bool)

(declare-fun lt!349042 () (_ BitVec 64))

(assert (=> b!221151 (= e!150154 (bvsle lt!349037 (bvmul lt!349042 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!221151 (or (= lt!349042 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!349042 #b0000000000000000000000000000000000000000000000000000000000001000) lt!349042)))))

(assert (=> b!221151 (= lt!349042 ((_ sign_extend 32) (size!4742 (buf!5289 (_2!10143 lt!348855)))))))

(assert (= (and d!74491 res!186235) b!221150))

(assert (= (and b!221150 res!186234) b!221151))

(declare-fun m!339827 () Bool)

(assert (=> d!74491 m!339827))

(declare-fun m!339829 () Bool)

(assert (=> d!74491 m!339829))

(assert (=> b!221030 d!74491))

(assert (=> b!221030 d!74417))

(declare-fun d!74493 () Bool)

(declare-fun e!150155 () Bool)

(assert (=> d!74493 e!150155))

(declare-fun res!186237 () Bool)

(assert (=> d!74493 (=> (not res!186237) (not e!150155))))

(declare-fun lt!349046 () (_ BitVec 64))

(declare-fun lt!349047 () (_ BitVec 64))

(declare-fun lt!349043 () (_ BitVec 64))

(assert (=> d!74493 (= res!186237 (= lt!349043 (bvsub lt!349047 lt!349046)))))

(assert (=> d!74493 (or (= (bvand lt!349047 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!349046 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!349047 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!349047 lt!349046) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74493 (= lt!349046 (remainingBits!0 ((_ sign_extend 32) (size!4742 (buf!5289 (_2!10142 lt!348870)))) ((_ sign_extend 32) (currentByte!9925 (_2!10142 lt!348870))) ((_ sign_extend 32) (currentBit!9920 (_2!10142 lt!348870)))))))

(declare-fun lt!349044 () (_ BitVec 64))

(declare-fun lt!349045 () (_ BitVec 64))

(assert (=> d!74493 (= lt!349047 (bvmul lt!349044 lt!349045))))

(assert (=> d!74493 (or (= lt!349044 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!349045 (bvsdiv (bvmul lt!349044 lt!349045) lt!349044)))))

(assert (=> d!74493 (= lt!349045 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!74493 (= lt!349044 ((_ sign_extend 32) (size!4742 (buf!5289 (_2!10142 lt!348870)))))))

(assert (=> d!74493 (= lt!349043 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9925 (_2!10142 lt!348870))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9920 (_2!10142 lt!348870)))))))

(assert (=> d!74493 (invariant!0 (currentBit!9920 (_2!10142 lt!348870)) (currentByte!9925 (_2!10142 lt!348870)) (size!4742 (buf!5289 (_2!10142 lt!348870))))))

(assert (=> d!74493 (= (bitIndex!0 (size!4742 (buf!5289 (_2!10142 lt!348870))) (currentByte!9925 (_2!10142 lt!348870)) (currentBit!9920 (_2!10142 lt!348870))) lt!349043)))

(declare-fun b!221152 () Bool)

(declare-fun res!186236 () Bool)

(assert (=> b!221152 (=> (not res!186236) (not e!150155))))

(assert (=> b!221152 (= res!186236 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!349043))))

(declare-fun b!221153 () Bool)

(declare-fun lt!349048 () (_ BitVec 64))

(assert (=> b!221153 (= e!150155 (bvsle lt!349043 (bvmul lt!349048 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!221153 (or (= lt!349048 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!349048 #b0000000000000000000000000000000000000000000000000000000000001000) lt!349048)))))

(assert (=> b!221153 (= lt!349048 ((_ sign_extend 32) (size!4742 (buf!5289 (_2!10142 lt!348870)))))))

(assert (= (and d!74493 res!186237) b!221152))

(assert (= (and b!221152 res!186236) b!221153))

(declare-fun m!339831 () Bool)

(assert (=> d!74493 m!339831))

(declare-fun m!339833 () Bool)

(assert (=> d!74493 m!339833))

(assert (=> b!221047 d!74493))

(declare-fun d!74495 () Bool)

(declare-fun e!150156 () Bool)

(assert (=> d!74495 e!150156))

(declare-fun res!186239 () Bool)

(assert (=> d!74495 (=> (not res!186239) (not e!150156))))

(declare-fun lt!349049 () (_ BitVec 64))

(declare-fun lt!349052 () (_ BitVec 64))

(declare-fun lt!349053 () (_ BitVec 64))

(assert (=> d!74495 (= res!186239 (= lt!349049 (bvsub lt!349053 lt!349052)))))

(assert (=> d!74495 (or (= (bvand lt!349053 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!349052 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!349053 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!349053 lt!349052) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74495 (= lt!349052 (remainingBits!0 ((_ sign_extend 32) (size!4742 (buf!5289 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)))) ((_ sign_extend 32) (currentByte!9925 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))) ((_ sign_extend 32) (currentBit!9920 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)))))))

(declare-fun lt!349050 () (_ BitVec 64))

(declare-fun lt!349051 () (_ BitVec 64))

(assert (=> d!74495 (= lt!349053 (bvmul lt!349050 lt!349051))))

(assert (=> d!74495 (or (= lt!349050 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!349051 (bvsdiv (bvmul lt!349050 lt!349051) lt!349050)))))

(assert (=> d!74495 (= lt!349051 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!74495 (= lt!349050 ((_ sign_extend 32) (size!4742 (buf!5289 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)))))))

(assert (=> d!74495 (= lt!349049 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9925 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9920 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)))))))

(assert (=> d!74495 (invariant!0 (currentBit!9920 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)) (currentByte!9925 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)) (size!4742 (buf!5289 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> d!74495 (= (bitIndex!0 (size!4742 (buf!5289 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))) (currentByte!9925 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)) (currentBit!9920 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))) lt!349049)))

(declare-fun b!221154 () Bool)

(declare-fun res!186238 () Bool)

(assert (=> b!221154 (=> (not res!186238) (not e!150156))))

(assert (=> b!221154 (= res!186238 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!349049))))

(declare-fun b!221155 () Bool)

(declare-fun lt!349054 () (_ BitVec 64))

(assert (=> b!221155 (= e!150156 (bvsle lt!349049 (bvmul lt!349054 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!221155 (or (= lt!349054 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!349054 #b0000000000000000000000000000000000000000000000000000000000001000) lt!349054)))))

(assert (=> b!221155 (= lt!349054 ((_ sign_extend 32) (size!4742 (buf!5289 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)))))))

(assert (= (and d!74495 res!186239) b!221154))

(assert (= (and b!221154 res!186238) b!221155))

(declare-fun m!339835 () Bool)

(assert (=> d!74495 m!339835))

(declare-fun m!339837 () Bool)

(assert (=> d!74495 m!339837))

(assert (=> b!221047 d!74495))

(check-sat (not b!221129) (not b!221139) (not b!221131) (not d!74491) (not d!74475) (not b!221149) (not b!221132) (not d!74473) (not d!74493) (not b!221125) (not b!221148) (not b!221130) (not b!221147) (not d!74481) (not b!221128) (not d!74469) (not b!221146) (not d!74465) (not d!74495) (not b!221145) (not d!74477))
(check-sat)
