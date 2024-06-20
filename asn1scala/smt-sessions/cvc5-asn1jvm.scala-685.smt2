; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19220 () Bool)

(assert start!19220)

(declare-fun b!96302 () Bool)

(declare-fun res!79164 () Bool)

(declare-fun e!63073 () Bool)

(assert (=> b!96302 (=> (not res!79164) (not e!63073))))

(declare-datatypes ((array!4491 0))(
  ( (array!4492 (arr!2649 (Array (_ BitVec 32) (_ BitVec 8))) (size!2053 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3586 0))(
  ( (BitStream!3587 (buf!2402 array!4491) (currentByte!4790 (_ BitVec 32)) (currentBit!4785 (_ BitVec 32))) )
))
(declare-fun bitStream1!8 () BitStream!3586)

(declare-fun nBits!484 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!96302 (= res!79164 (validate_offset_bits!1 ((_ sign_extend 32) (size!2053 (buf!2402 bitStream1!8))) ((_ sign_extend 32) (currentByte!4790 bitStream1!8)) ((_ sign_extend 32) (currentBit!4785 bitStream1!8)) nBits!484))))

(declare-fun res!79165 () Bool)

(assert (=> start!19220 (=> (not res!79165) (not e!63073))))

(assert (=> start!19220 (= res!79165 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!19220 e!63073))

(assert (=> start!19220 true))

(declare-fun e!63081 () Bool)

(declare-fun inv!12 (BitStream!3586) Bool)

(assert (=> start!19220 (and (inv!12 bitStream1!8) e!63081)))

(declare-fun bitStream2!8 () BitStream!3586)

(declare-fun e!63078 () Bool)

(assert (=> start!19220 (and (inv!12 bitStream2!8) e!63078)))

(declare-fun base!8 () BitStream!3586)

(declare-fun e!63079 () Bool)

(assert (=> start!19220 (and (inv!12 base!8) e!63079)))

(declare-fun thiss!1534 () BitStream!3586)

(declare-fun e!63076 () Bool)

(assert (=> start!19220 (and (inv!12 thiss!1534) e!63076)))

(declare-fun b!96303 () Bool)

(declare-fun res!79168 () Bool)

(assert (=> b!96303 (=> (not res!79168) (not e!63073))))

(declare-fun isPrefixOf!0 (BitStream!3586 BitStream!3586) Bool)

(assert (=> b!96303 (= res!79168 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(declare-fun b!96304 () Bool)

(declare-fun array_inv!1858 (array!4491) Bool)

(assert (=> b!96304 (= e!63076 (array_inv!1858 (buf!2402 thiss!1534)))))

(declare-fun b!96305 () Bool)

(declare-fun res!79169 () Bool)

(assert (=> b!96305 (=> (not res!79169) (not e!63073))))

(assert (=> b!96305 (= res!79169 (and (= (buf!2402 bitStream1!8) (buf!2402 bitStream2!8)) (= (buf!2402 bitStream1!8) (buf!2402 base!8))))))

(declare-fun b!96306 () Bool)

(declare-fun res!79161 () Bool)

(assert (=> b!96306 (=> (not res!79161) (not e!63073))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!96306 (= res!79161 (bvslt (bitIndex!0 (size!2053 (buf!2402 base!8)) (currentByte!4790 base!8) (currentBit!4785 base!8)) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484)))))

(declare-fun b!96307 () Bool)

(declare-datatypes ((List!899 0))(
  ( (Nil!896) (Cons!895 (h!1014 Bool) (t!1649 List!899)) )
))
(declare-fun listBits!13 () List!899)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!3586 BitStream!3586 (_ BitVec 64)) List!899)

(declare-fun tail!375 (List!899) List!899)

(assert (=> b!96307 (= e!63073 (not (= (bitStreamReadBitsIntoList!0 thiss!1534 bitStream2!8 (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!375 listBits!13))))))

(declare-fun b!96308 () Bool)

(declare-fun res!79160 () Bool)

(assert (=> b!96308 (=> (not res!79160) (not e!63073))))

(declare-fun length!490 (List!899) Int)

(assert (=> b!96308 (= res!79160 (> (length!490 listBits!13) 0))))

(declare-fun b!96309 () Bool)

(declare-fun res!79166 () Bool)

(assert (=> b!96309 (=> (not res!79166) (not e!63073))))

(assert (=> b!96309 (= res!79166 (validate_offset_bits!1 ((_ sign_extend 32) (size!2053 (buf!2402 bitStream2!8))) ((_ sign_extend 32) (currentByte!4790 bitStream2!8)) ((_ sign_extend 32) (currentBit!4785 bitStream2!8)) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!96310 () Bool)

(declare-fun res!79163 () Bool)

(assert (=> b!96310 (=> (not res!79163) (not e!63073))))

(assert (=> b!96310 (= res!79163 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!2053 (buf!2402 bitStream1!8)) (currentByte!4790 bitStream1!8) (currentBit!4785 bitStream1!8))) (bitIndex!0 (size!2053 (buf!2402 bitStream2!8)) (currentByte!4790 bitStream2!8) (currentBit!4785 bitStream2!8))))))

(declare-fun b!96311 () Bool)

(assert (=> b!96311 (= e!63081 (array_inv!1858 (buf!2402 bitStream1!8)))))

(declare-fun b!96312 () Bool)

(declare-fun res!79162 () Bool)

(assert (=> b!96312 (=> (not res!79162) (not e!63073))))

(assert (=> b!96312 (= res!79162 (isPrefixOf!0 bitStream2!8 base!8))))

(declare-fun b!96313 () Bool)

(assert (=> b!96313 (= e!63079 (array_inv!1858 (buf!2402 base!8)))))

(declare-fun b!96314 () Bool)

(declare-fun res!79159 () Bool)

(assert (=> b!96314 (=> (not res!79159) (not e!63073))))

(declare-datatypes ((tuple2!7724 0))(
  ( (tuple2!7725 (_1!4111 BitStream!3586) (_2!4111 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!3586) tuple2!7724)

(declare-fun head!596 (List!899) Bool)

(assert (=> b!96314 (= res!79159 (= (_2!4111 (readBitPure!0 bitStream1!8)) (head!596 listBits!13)))))

(declare-fun b!96315 () Bool)

(assert (=> b!96315 (= e!63078 (array_inv!1858 (buf!2402 bitStream2!8)))))

(declare-fun b!96316 () Bool)

(declare-fun res!79171 () Bool)

(assert (=> b!96316 (=> (not res!79171) (not e!63073))))

(assert (=> b!96316 (= res!79171 (not (= nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!96317 () Bool)

(declare-fun res!79170 () Bool)

(assert (=> b!96317 (=> (not res!79170) (not e!63073))))

(assert (=> b!96317 (= res!79170 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun b!96318 () Bool)

(declare-fun res!79167 () Bool)

(assert (=> b!96318 (=> (not res!79167) (not e!63073))))

(assert (=> b!96318 (= res!79167 (= listBits!13 (bitStreamReadBitsIntoList!0 thiss!1534 bitStream1!8 nBits!484)))))

(assert (= (and start!19220 res!79165) b!96308))

(assert (= (and b!96308 res!79160) b!96317))

(assert (= (and b!96317 res!79170) b!96312))

(assert (= (and b!96312 res!79162) b!96303))

(assert (= (and b!96303 res!79168) b!96305))

(assert (= (and b!96305 res!79169) b!96306))

(assert (= (and b!96306 res!79161) b!96310))

(assert (= (and b!96310 res!79163) b!96302))

(assert (= (and b!96302 res!79164) b!96309))

(assert (= (and b!96309 res!79166) b!96318))

(assert (= (and b!96318 res!79167) b!96316))

(assert (= (and b!96316 res!79171) b!96314))

(assert (= (and b!96314 res!79159) b!96307))

(assert (= start!19220 b!96311))

(assert (= start!19220 b!96315))

(assert (= start!19220 b!96313))

(assert (= start!19220 b!96304))

(declare-fun m!139639 () Bool)

(assert (=> b!96310 m!139639))

(declare-fun m!139641 () Bool)

(assert (=> b!96310 m!139641))

(declare-fun m!139643 () Bool)

(assert (=> b!96317 m!139643))

(declare-fun m!139645 () Bool)

(assert (=> b!96311 m!139645))

(declare-fun m!139647 () Bool)

(assert (=> b!96309 m!139647))

(declare-fun m!139649 () Bool)

(assert (=> b!96307 m!139649))

(declare-fun m!139651 () Bool)

(assert (=> b!96307 m!139651))

(declare-fun m!139653 () Bool)

(assert (=> b!96303 m!139653))

(declare-fun m!139655 () Bool)

(assert (=> b!96318 m!139655))

(declare-fun m!139657 () Bool)

(assert (=> b!96302 m!139657))

(declare-fun m!139659 () Bool)

(assert (=> b!96312 m!139659))

(declare-fun m!139661 () Bool)

(assert (=> b!96308 m!139661))

(declare-fun m!139663 () Bool)

(assert (=> b!96304 m!139663))

(declare-fun m!139665 () Bool)

(assert (=> b!96313 m!139665))

(declare-fun m!139667 () Bool)

(assert (=> b!96306 m!139667))

(declare-fun m!139669 () Bool)

(assert (=> b!96315 m!139669))

(declare-fun m!139671 () Bool)

(assert (=> start!19220 m!139671))

(declare-fun m!139673 () Bool)

(assert (=> start!19220 m!139673))

(declare-fun m!139675 () Bool)

(assert (=> start!19220 m!139675))

(declare-fun m!139677 () Bool)

(assert (=> start!19220 m!139677))

(declare-fun m!139679 () Bool)

(assert (=> b!96314 m!139679))

(declare-fun m!139681 () Bool)

(assert (=> b!96314 m!139681))

(push 1)

(assert (not b!96317))

(assert (not b!96304))

(assert (not b!96307))

(assert (not b!96313))

(assert (not b!96303))

(assert (not b!96308))

(assert (not b!96312))

(assert (not b!96314))

(assert (not b!96306))

(assert (not b!96302))

(assert (not b!96315))

(assert (not b!96318))

(assert (not b!96310))

(assert (not start!19220))

(assert (not b!96311))

(assert (not b!96309))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!29972 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!29972 (= (inv!12 bitStream1!8) (invariant!0 (currentBit!4785 bitStream1!8) (currentByte!4790 bitStream1!8) (size!2053 (buf!2402 bitStream1!8))))))

(declare-fun bs!7357 () Bool)

(assert (= bs!7357 d!29972))

(declare-fun m!139781 () Bool)

(assert (=> bs!7357 m!139781))

(assert (=> start!19220 d!29972))

(declare-fun d!29974 () Bool)

(assert (=> d!29974 (= (inv!12 bitStream2!8) (invariant!0 (currentBit!4785 bitStream2!8) (currentByte!4790 bitStream2!8) (size!2053 (buf!2402 bitStream2!8))))))

(declare-fun bs!7358 () Bool)

(assert (= bs!7358 d!29974))

(declare-fun m!139783 () Bool)

(assert (=> bs!7358 m!139783))

(assert (=> start!19220 d!29974))

(declare-fun d!29976 () Bool)

(assert (=> d!29976 (= (inv!12 base!8) (invariant!0 (currentBit!4785 base!8) (currentByte!4790 base!8) (size!2053 (buf!2402 base!8))))))

(declare-fun bs!7359 () Bool)

(assert (= bs!7359 d!29976))

(declare-fun m!139785 () Bool)

(assert (=> bs!7359 m!139785))

(assert (=> start!19220 d!29976))

(declare-fun d!29978 () Bool)

(assert (=> d!29978 (= (inv!12 thiss!1534) (invariant!0 (currentBit!4785 thiss!1534) (currentByte!4790 thiss!1534) (size!2053 (buf!2402 thiss!1534))))))

(declare-fun bs!7360 () Bool)

(assert (= bs!7360 d!29978))

(declare-fun m!139787 () Bool)

(assert (=> bs!7360 m!139787))

(assert (=> start!19220 d!29978))

(declare-fun d!29980 () Bool)

(declare-fun size!2057 (List!899) Int)

(assert (=> d!29980 (= (length!490 listBits!13) (size!2057 listBits!13))))

(declare-fun bs!7361 () Bool)

(assert (= bs!7361 d!29980))

(declare-fun m!139789 () Bool)

(assert (=> bs!7361 m!139789))

(assert (=> b!96308 d!29980))

(declare-fun b!96451 () Bool)

(declare-datatypes ((tuple2!7734 0))(
  ( (tuple2!7735 (_1!4116 List!899) (_2!4116 BitStream!3586)) )
))
(declare-fun e!63152 () tuple2!7734)

(assert (=> b!96451 (= e!63152 (tuple2!7735 Nil!896 bitStream2!8))))

(declare-fun b!96454 () Bool)

(declare-fun e!63151 () Bool)

(declare-fun lt!139471 () List!899)

(assert (=> b!96454 (= e!63151 (> (length!490 lt!139471) 0))))

(declare-fun d!29982 () Bool)

(assert (=> d!29982 e!63151))

(declare-fun c!6050 () Bool)

(assert (=> d!29982 (= c!6050 (= (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!29982 (= lt!139471 (_1!4116 e!63152))))

(declare-fun c!6051 () Bool)

(assert (=> d!29982 (= c!6051 (= (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!29982 (bvsge (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!29982 (= (bitStreamReadBitsIntoList!0 thiss!1534 bitStream2!8 (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)) lt!139471)))

(declare-fun b!96452 () Bool)

(declare-datatypes ((tuple2!7736 0))(
  ( (tuple2!7737 (_1!4117 Bool) (_2!4117 BitStream!3586)) )
))
(declare-fun lt!139470 () tuple2!7736)

(declare-fun lt!139472 () (_ BitVec 64))

(assert (=> b!96452 (= e!63152 (tuple2!7735 (Cons!895 (_1!4117 lt!139470) (bitStreamReadBitsIntoList!0 thiss!1534 (_2!4117 lt!139470) (bvsub (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001) lt!139472))) (_2!4117 lt!139470)))))

(declare-fun readBit!0 (BitStream!3586) tuple2!7736)

(assert (=> b!96452 (= lt!139470 (readBit!0 bitStream2!8))))

(assert (=> b!96452 (= lt!139472 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!96453 () Bool)

(declare-fun isEmpty!266 (List!899) Bool)

(assert (=> b!96453 (= e!63151 (isEmpty!266 lt!139471))))

(assert (= (and d!29982 c!6051) b!96451))

(assert (= (and d!29982 (not c!6051)) b!96452))

(assert (= (and d!29982 c!6050) b!96453))

(assert (= (and d!29982 (not c!6050)) b!96454))

(declare-fun m!139803 () Bool)

(assert (=> b!96454 m!139803))

(declare-fun m!139805 () Bool)

(assert (=> b!96452 m!139805))

(declare-fun m!139807 () Bool)

(assert (=> b!96452 m!139807))

(declare-fun m!139809 () Bool)

(assert (=> b!96453 m!139809))

(assert (=> b!96307 d!29982))

(declare-fun d!30000 () Bool)

(assert (=> d!30000 (= (tail!375 listBits!13) (t!1649 listBits!13))))

(assert (=> b!96307 d!30000))

(declare-fun b!96455 () Bool)

(declare-fun e!63154 () tuple2!7734)

(assert (=> b!96455 (= e!63154 (tuple2!7735 Nil!896 bitStream1!8))))

(declare-fun b!96458 () Bool)

(declare-fun e!63153 () Bool)

(declare-fun lt!139474 () List!899)

(assert (=> b!96458 (= e!63153 (> (length!490 lt!139474) 0))))

(declare-fun d!30006 () Bool)

(assert (=> d!30006 e!63153))

(declare-fun c!6052 () Bool)

(assert (=> d!30006 (= c!6052 (= nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!30006 (= lt!139474 (_1!4116 e!63154))))

(declare-fun c!6053 () Bool)

(assert (=> d!30006 (= c!6053 (= nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!30006 (bvsge nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!30006 (= (bitStreamReadBitsIntoList!0 thiss!1534 bitStream1!8 nBits!484) lt!139474)))

(declare-fun lt!139475 () (_ BitVec 64))

(declare-fun lt!139473 () tuple2!7736)

(declare-fun b!96456 () Bool)

(assert (=> b!96456 (= e!63154 (tuple2!7735 (Cons!895 (_1!4117 lt!139473) (bitStreamReadBitsIntoList!0 thiss!1534 (_2!4117 lt!139473) (bvsub nBits!484 lt!139475))) (_2!4117 lt!139473)))))

(assert (=> b!96456 (= lt!139473 (readBit!0 bitStream1!8))))

(assert (=> b!96456 (= lt!139475 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!96457 () Bool)

(assert (=> b!96457 (= e!63153 (isEmpty!266 lt!139474))))

(assert (= (and d!30006 c!6053) b!96455))

(assert (= (and d!30006 (not c!6053)) b!96456))

(assert (= (and d!30006 c!6052) b!96457))

(assert (= (and d!30006 (not c!6052)) b!96458))

(declare-fun m!139813 () Bool)

(assert (=> b!96458 m!139813))

(declare-fun m!139815 () Bool)

(assert (=> b!96456 m!139815))

(declare-fun m!139817 () Bool)

(assert (=> b!96456 m!139817))

(declare-fun m!139819 () Bool)

(assert (=> b!96457 m!139819))

(assert (=> b!96318 d!30006))

(declare-fun d!30010 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!30010 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2053 (buf!2402 bitStream2!8))) ((_ sign_extend 32) (currentByte!4790 bitStream2!8)) ((_ sign_extend 32) (currentBit!4785 bitStream2!8)) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2053 (buf!2402 bitStream2!8))) ((_ sign_extend 32) (currentByte!4790 bitStream2!8)) ((_ sign_extend 32) (currentBit!4785 bitStream2!8))) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!7366 () Bool)

(assert (= bs!7366 d!30010))

(declare-fun m!139821 () Bool)

(assert (=> bs!7366 m!139821))

(assert (=> b!96309 d!30010))

(declare-fun d!30012 () Bool)

(assert (=> d!30012 (= (array_inv!1858 (buf!2402 bitStream2!8)) (bvsge (size!2053 (buf!2402 bitStream2!8)) #b00000000000000000000000000000000))))

(assert (=> b!96315 d!30012))

(declare-fun d!30014 () Bool)

(declare-fun res!79283 () Bool)

(declare-fun e!63171 () Bool)

(assert (=> d!30014 (=> (not res!79283) (not e!63171))))

(assert (=> d!30014 (= res!79283 (= (size!2053 (buf!2402 bitStream1!8)) (size!2053 (buf!2402 base!8))))))

(assert (=> d!30014 (= (isPrefixOf!0 bitStream1!8 base!8) e!63171)))

(declare-fun b!96484 () Bool)

(declare-fun res!79282 () Bool)

(assert (=> b!96484 (=> (not res!79282) (not e!63171))))

(assert (=> b!96484 (= res!79282 (bvsle (bitIndex!0 (size!2053 (buf!2402 bitStream1!8)) (currentByte!4790 bitStream1!8) (currentBit!4785 bitStream1!8)) (bitIndex!0 (size!2053 (buf!2402 base!8)) (currentByte!4790 base!8) (currentBit!4785 base!8))))))

(declare-fun b!96485 () Bool)

(declare-fun e!63172 () Bool)

(assert (=> b!96485 (= e!63171 e!63172)))

(declare-fun res!79281 () Bool)

(assert (=> b!96485 (=> res!79281 e!63172)))

(assert (=> b!96485 (= res!79281 (= (size!2053 (buf!2402 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!96486 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4491 array!4491 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!96486 (= e!63172 (arrayBitRangesEq!0 (buf!2402 bitStream1!8) (buf!2402 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2053 (buf!2402 bitStream1!8)) (currentByte!4790 bitStream1!8) (currentBit!4785 bitStream1!8))))))

(assert (= (and d!30014 res!79283) b!96484))

(assert (= (and b!96484 res!79282) b!96485))

(assert (= (and b!96485 (not res!79281)) b!96486))

(assert (=> b!96484 m!139639))

(assert (=> b!96484 m!139667))

(assert (=> b!96486 m!139639))

(assert (=> b!96486 m!139639))

(declare-fun m!139837 () Bool)

(assert (=> b!96486 m!139837))

(assert (=> b!96317 d!30014))

(declare-fun d!30024 () Bool)

(declare-fun e!63179 () Bool)

(assert (=> d!30024 e!63179))

(declare-fun res!79297 () Bool)

(assert (=> d!30024 (=> (not res!79297) (not e!63179))))

(declare-fun lt!139520 () (_ BitVec 64))

(declare-fun lt!139515 () (_ BitVec 64))

(declare-fun lt!139516 () (_ BitVec 64))

(assert (=> d!30024 (= res!79297 (= lt!139516 (bvsub lt!139520 lt!139515)))))

(assert (=> d!30024 (or (= (bvand lt!139520 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!139515 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!139520 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!139520 lt!139515) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!30024 (= lt!139515 (remainingBits!0 ((_ sign_extend 32) (size!2053 (buf!2402 base!8))) ((_ sign_extend 32) (currentByte!4790 base!8)) ((_ sign_extend 32) (currentBit!4785 base!8))))))

(declare-fun lt!139518 () (_ BitVec 64))

(declare-fun lt!139517 () (_ BitVec 64))

(assert (=> d!30024 (= lt!139520 (bvmul lt!139518 lt!139517))))

(assert (=> d!30024 (or (= lt!139518 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!139517 (bvsdiv (bvmul lt!139518 lt!139517) lt!139518)))))

(assert (=> d!30024 (= lt!139517 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!30024 (= lt!139518 ((_ sign_extend 32) (size!2053 (buf!2402 base!8))))))

(assert (=> d!30024 (= lt!139516 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4790 base!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4785 base!8))))))

(assert (=> d!30024 (invariant!0 (currentBit!4785 base!8) (currentByte!4790 base!8) (size!2053 (buf!2402 base!8)))))

(assert (=> d!30024 (= (bitIndex!0 (size!2053 (buf!2402 base!8)) (currentByte!4790 base!8) (currentBit!4785 base!8)) lt!139516)))

(declare-fun b!96499 () Bool)

(declare-fun res!79296 () Bool)

(assert (=> b!96499 (=> (not res!79296) (not e!63179))))

(assert (=> b!96499 (= res!79296 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!139516))))

(declare-fun b!96500 () Bool)

(declare-fun lt!139519 () (_ BitVec 64))

(assert (=> b!96500 (= e!63179 (bvsle lt!139516 (bvmul lt!139519 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!96500 (or (= lt!139519 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!139519 #b0000000000000000000000000000000000000000000000000000000000001000) lt!139519)))))

(assert (=> b!96500 (= lt!139519 ((_ sign_extend 32) (size!2053 (buf!2402 base!8))))))

(assert (= (and d!30024 res!79297) b!96499))

(assert (= (and b!96499 res!79296) b!96500))

(declare-fun m!139853 () Bool)

(assert (=> d!30024 m!139853))

(assert (=> d!30024 m!139785))

(assert (=> b!96306 d!30024))

(declare-fun d!30046 () Bool)

(assert (=> d!30046 (= (array_inv!1858 (buf!2402 base!8)) (bvsge (size!2053 (buf!2402 base!8)) #b00000000000000000000000000000000))))

(assert (=> b!96313 d!30046))

(declare-fun d!30048 () Bool)

(assert (=> d!30048 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2053 (buf!2402 bitStream1!8))) ((_ sign_extend 32) (currentByte!4790 bitStream1!8)) ((_ sign_extend 32) (currentBit!4785 bitStream1!8)) nBits!484) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2053 (buf!2402 bitStream1!8))) ((_ sign_extend 32) (currentByte!4790 bitStream1!8)) ((_ sign_extend 32) (currentBit!4785 bitStream1!8))) nBits!484))))

(declare-fun bs!7375 () Bool)

(assert (= bs!7375 d!30048))

(declare-fun m!139855 () Bool)

(assert (=> bs!7375 m!139855))

(assert (=> b!96302 d!30048))

(declare-fun d!30050 () Bool)

(assert (=> d!30050 (= (array_inv!1858 (buf!2402 thiss!1534)) (bvsge (size!2053 (buf!2402 thiss!1534)) #b00000000000000000000000000000000))))

(assert (=> b!96304 d!30050))

(declare-fun d!30052 () Bool)

(declare-fun res!79300 () Bool)

(declare-fun e!63180 () Bool)

(assert (=> d!30052 (=> (not res!79300) (not e!63180))))

(assert (=> d!30052 (= res!79300 (= (size!2053 (buf!2402 bitStream1!8)) (size!2053 (buf!2402 bitStream2!8))))))

(assert (=> d!30052 (= (isPrefixOf!0 bitStream1!8 bitStream2!8) e!63180)))

(declare-fun b!96501 () Bool)

(declare-fun res!79299 () Bool)

(assert (=> b!96501 (=> (not res!79299) (not e!63180))))

(assert (=> b!96501 (= res!79299 (bvsle (bitIndex!0 (size!2053 (buf!2402 bitStream1!8)) (currentByte!4790 bitStream1!8) (currentBit!4785 bitStream1!8)) (bitIndex!0 (size!2053 (buf!2402 bitStream2!8)) (currentByte!4790 bitStream2!8) (currentBit!4785 bitStream2!8))))))

(declare-fun b!96502 () Bool)

(declare-fun e!63181 () Bool)

(assert (=> b!96502 (= e!63180 e!63181)))

(declare-fun res!79298 () Bool)

(assert (=> b!96502 (=> res!79298 e!63181)))

(assert (=> b!96502 (= res!79298 (= (size!2053 (buf!2402 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!96503 () Bool)

(assert (=> b!96503 (= e!63181 (arrayBitRangesEq!0 (buf!2402 bitStream1!8) (buf!2402 bitStream2!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2053 (buf!2402 bitStream1!8)) (currentByte!4790 bitStream1!8) (currentBit!4785 bitStream1!8))))))

(assert (= (and d!30052 res!79300) b!96501))

(assert (= (and b!96501 res!79299) b!96502))

(assert (= (and b!96502 (not res!79298)) b!96503))

(assert (=> b!96501 m!139639))

(assert (=> b!96501 m!139641))

(assert (=> b!96503 m!139639))

(assert (=> b!96503 m!139639))

(declare-fun m!139857 () Bool)

(assert (=> b!96503 m!139857))

(assert (=> b!96303 d!30052))

(declare-fun d!30054 () Bool)

(declare-fun lt!139529 () tuple2!7736)

(assert (=> d!30054 (= lt!139529 (readBit!0 bitStream1!8))))

(assert (=> d!30054 (= (readBitPure!0 bitStream1!8) (tuple2!7725 (_2!4117 lt!139529) (_1!4117 lt!139529)))))

(declare-fun bs!7376 () Bool)

(assert (= bs!7376 d!30054))

(assert (=> bs!7376 m!139817))

(assert (=> b!96314 d!30054))

(declare-fun d!30056 () Bool)

(assert (=> d!30056 (= (head!596 listBits!13) (h!1014 listBits!13))))

(assert (=> b!96314 d!30056))

(declare-fun d!30058 () Bool)

(declare-fun e!63186 () Bool)

(assert (=> d!30058 e!63186))

(declare-fun res!79302 () Bool)

(assert (=> d!30058 (=> (not res!79302) (not e!63186))))

(declare-fun lt!139535 () (_ BitVec 64))

(declare-fun lt!139530 () (_ BitVec 64))

(declare-fun lt!139531 () (_ BitVec 64))

(assert (=> d!30058 (= res!79302 (= lt!139531 (bvsub lt!139535 lt!139530)))))

(assert (=> d!30058 (or (= (bvand lt!139535 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!139530 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!139535 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!139535 lt!139530) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!30058 (= lt!139530 (remainingBits!0 ((_ sign_extend 32) (size!2053 (buf!2402 bitStream1!8))) ((_ sign_extend 32) (currentByte!4790 bitStream1!8)) ((_ sign_extend 32) (currentBit!4785 bitStream1!8))))))

(declare-fun lt!139533 () (_ BitVec 64))

(declare-fun lt!139532 () (_ BitVec 64))

(assert (=> d!30058 (= lt!139535 (bvmul lt!139533 lt!139532))))

(assert (=> d!30058 (or (= lt!139533 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!139532 (bvsdiv (bvmul lt!139533 lt!139532) lt!139533)))))

(assert (=> d!30058 (= lt!139532 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!30058 (= lt!139533 ((_ sign_extend 32) (size!2053 (buf!2402 bitStream1!8))))))

(assert (=> d!30058 (= lt!139531 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4790 bitStream1!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4785 bitStream1!8))))))

(assert (=> d!30058 (invariant!0 (currentBit!4785 bitStream1!8) (currentByte!4790 bitStream1!8) (size!2053 (buf!2402 bitStream1!8)))))

(assert (=> d!30058 (= (bitIndex!0 (size!2053 (buf!2402 bitStream1!8)) (currentByte!4790 bitStream1!8) (currentBit!4785 bitStream1!8)) lt!139531)))

(declare-fun b!96512 () Bool)

(declare-fun res!79301 () Bool)

(assert (=> b!96512 (=> (not res!79301) (not e!63186))))

(assert (=> b!96512 (= res!79301 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!139531))))

(declare-fun b!96513 () Bool)

(declare-fun lt!139534 () (_ BitVec 64))

(assert (=> b!96513 (= e!63186 (bvsle lt!139531 (bvmul lt!139534 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!96513 (or (= lt!139534 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!139534 #b0000000000000000000000000000000000000000000000000000000000001000) lt!139534)))))

(assert (=> b!96513 (= lt!139534 ((_ sign_extend 32) (size!2053 (buf!2402 bitStream1!8))))))

(assert (= (and d!30058 res!79302) b!96512))

(assert (= (and b!96512 res!79301) b!96513))

(assert (=> d!30058 m!139855))

(assert (=> d!30058 m!139781))

(assert (=> b!96310 d!30058))

(declare-fun d!30060 () Bool)

(declare-fun e!63187 () Bool)

(assert (=> d!30060 e!63187))

(declare-fun res!79304 () Bool)

(assert (=> d!30060 (=> (not res!79304) (not e!63187))))

(declare-fun lt!139541 () (_ BitVec 64))

(declare-fun lt!139537 () (_ BitVec 64))

(declare-fun lt!139536 () (_ BitVec 64))

(assert (=> d!30060 (= res!79304 (= lt!139537 (bvsub lt!139541 lt!139536)))))

(assert (=> d!30060 (or (= (bvand lt!139541 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!139536 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!139541 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!139541 lt!139536) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!30060 (= lt!139536 (remainingBits!0 ((_ sign_extend 32) (size!2053 (buf!2402 bitStream2!8))) ((_ sign_extend 32) (currentByte!4790 bitStream2!8)) ((_ sign_extend 32) (currentBit!4785 bitStream2!8))))))

(declare-fun lt!139539 () (_ BitVec 64))

(declare-fun lt!139538 () (_ BitVec 64))

(assert (=> d!30060 (= lt!139541 (bvmul lt!139539 lt!139538))))

(assert (=> d!30060 (or (= lt!139539 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!139538 (bvsdiv (bvmul lt!139539 lt!139538) lt!139539)))))

(assert (=> d!30060 (= lt!139538 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!30060 (= lt!139539 ((_ sign_extend 32) (size!2053 (buf!2402 bitStream2!8))))))

(assert (=> d!30060 (= lt!139537 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4790 bitStream2!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4785 bitStream2!8))))))

(assert (=> d!30060 (invariant!0 (currentBit!4785 bitStream2!8) (currentByte!4790 bitStream2!8) (size!2053 (buf!2402 bitStream2!8)))))

(assert (=> d!30060 (= (bitIndex!0 (size!2053 (buf!2402 bitStream2!8)) (currentByte!4790 bitStream2!8) (currentBit!4785 bitStream2!8)) lt!139537)))

(declare-fun b!96514 () Bool)

(declare-fun res!79303 () Bool)

(assert (=> b!96514 (=> (not res!79303) (not e!63187))))

(assert (=> b!96514 (= res!79303 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!139537))))

(declare-fun b!96515 () Bool)

(declare-fun lt!139540 () (_ BitVec 64))

(assert (=> b!96515 (= e!63187 (bvsle lt!139537 (bvmul lt!139540 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!96515 (or (= lt!139540 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!139540 #b0000000000000000000000000000000000000000000000000000000000001000) lt!139540)))))

(assert (=> b!96515 (= lt!139540 ((_ sign_extend 32) (size!2053 (buf!2402 bitStream2!8))))))

(assert (= (and d!30060 res!79304) b!96514))

(assert (= (and b!96514 res!79303) b!96515))

(assert (=> d!30060 m!139821))

(assert (=> d!30060 m!139783))

(assert (=> b!96310 d!30060))

(declare-fun d!30062 () Bool)

(declare-fun res!79307 () Bool)

(declare-fun e!63188 () Bool)

(assert (=> d!30062 (=> (not res!79307) (not e!63188))))

(assert (=> d!30062 (= res!79307 (= (size!2053 (buf!2402 bitStream2!8)) (size!2053 (buf!2402 base!8))))))

(assert (=> d!30062 (= (isPrefixOf!0 bitStream2!8 base!8) e!63188)))

(declare-fun b!96516 () Bool)

(declare-fun res!79306 () Bool)

(assert (=> b!96516 (=> (not res!79306) (not e!63188))))

(assert (=> b!96516 (= res!79306 (bvsle (bitIndex!0 (size!2053 (buf!2402 bitStream2!8)) (currentByte!4790 bitStream2!8) (currentBit!4785 bitStream2!8)) (bitIndex!0 (size!2053 (buf!2402 base!8)) (currentByte!4790 base!8) (currentBit!4785 base!8))))))

(declare-fun b!96517 () Bool)

(declare-fun e!63189 () Bool)

(assert (=> b!96517 (= e!63188 e!63189)))

(declare-fun res!79305 () Bool)

(assert (=> b!96517 (=> res!79305 e!63189)))

(assert (=> b!96517 (= res!79305 (= (size!2053 (buf!2402 bitStream2!8)) #b00000000000000000000000000000000))))

(declare-fun b!96518 () Bool)

(assert (=> b!96518 (= e!63189 (arrayBitRangesEq!0 (buf!2402 bitStream2!8) (buf!2402 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2053 (buf!2402 bitStream2!8)) (currentByte!4790 bitStream2!8) (currentBit!4785 bitStream2!8))))))

(assert (= (and d!30062 res!79307) b!96516))

(assert (= (and b!96516 res!79306) b!96517))

(assert (= (and b!96517 (not res!79305)) b!96518))

(assert (=> b!96516 m!139641))

(assert (=> b!96516 m!139667))

(assert (=> b!96518 m!139641))

(assert (=> b!96518 m!139641))

(declare-fun m!139859 () Bool)

(assert (=> b!96518 m!139859))

(assert (=> b!96312 d!30062))

(declare-fun d!30064 () Bool)

(assert (=> d!30064 (= (array_inv!1858 (buf!2402 bitStream1!8)) (bvsge (size!2053 (buf!2402 bitStream1!8)) #b00000000000000000000000000000000))))

(assert (=> b!96311 d!30064))

(push 1)

(assert (not d!30010))

(assert (not d!29974))

(assert (not d!30024))

(assert (not b!96503))

(assert (not d!29972))

(assert (not b!96458))

(assert (not d!30048))

(assert (not d!30058))

(assert (not d!30054))

(assert (not b!96501))

(assert (not d!29980))

(assert (not b!96454))

(assert (not d!30060))

(assert (not b!96484))

(assert (not b!96457))

(assert (not d!29978))

(assert (not d!29976))

(assert (not b!96486))

(assert (not b!96453))

(assert (not b!96518))

(assert (not b!96452))

(assert (not b!96456))

(assert (not b!96516))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!30282 () Bool)

(assert (=> d!30282 (= (remainingBits!0 ((_ sign_extend 32) (size!2053 (buf!2402 bitStream2!8))) ((_ sign_extend 32) (currentByte!4790 bitStream2!8)) ((_ sign_extend 32) (currentBit!4785 bitStream2!8))) (bvsub (bvmul ((_ sign_extend 32) (size!2053 (buf!2402 bitStream2!8))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4790 bitStream2!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4785 bitStream2!8)))))))

(assert (=> d!30060 d!30282))

(declare-fun d!30284 () Bool)

(assert (=> d!30284 (= (invariant!0 (currentBit!4785 bitStream2!8) (currentByte!4790 bitStream2!8) (size!2053 (buf!2402 bitStream2!8))) (and (bvsge (currentBit!4785 bitStream2!8) #b00000000000000000000000000000000) (bvslt (currentBit!4785 bitStream2!8) #b00000000000000000000000000001000) (bvsge (currentByte!4790 bitStream2!8) #b00000000000000000000000000000000) (or (bvslt (currentByte!4790 bitStream2!8) (size!2053 (buf!2402 bitStream2!8))) (and (= (currentBit!4785 bitStream2!8) #b00000000000000000000000000000000) (= (currentByte!4790 bitStream2!8) (size!2053 (buf!2402 bitStream2!8)))))))))

(assert (=> d!30060 d!30284))

(declare-fun d!30286 () Bool)

(assert (=> d!30286 (= (length!490 lt!139471) (size!2057 lt!139471))))

(declare-fun bs!7404 () Bool)

(assert (= bs!7404 d!30286))

(declare-fun m!140269 () Bool)

(assert (=> bs!7404 m!140269))

(assert (=> b!96454 d!30286))

(declare-fun b!96740 () Bool)

(declare-fun e!63358 () Bool)

(declare-fun e!63360 () Bool)

(assert (=> b!96740 (= e!63358 e!63360)))

(declare-fun c!6104 () Bool)

(declare-datatypes ((tuple4!60 0))(
  ( (tuple4!61 (_1!4124 (_ BitVec 32)) (_2!4124 (_ BitVec 32)) (_3!251 (_ BitVec 32)) (_4!30 (_ BitVec 32))) )
))
(declare-fun lt!139777 () tuple4!60)

(assert (=> b!96740 (= c!6104 (= (_3!251 lt!139777) (_4!30 lt!139777)))))

(declare-fun b!96741 () Bool)

(declare-fun e!63361 () Bool)

(assert (=> b!96741 (= e!63361 e!63358)))

(declare-fun res!79444 () Bool)

(assert (=> b!96741 (=> (not res!79444) (not e!63358))))

(declare-fun e!63357 () Bool)

(assert (=> b!96741 (= res!79444 e!63357)))

(declare-fun res!79445 () Bool)

(assert (=> b!96741 (=> res!79445 e!63357)))

(assert (=> b!96741 (= res!79445 (bvsge (_1!4124 lt!139777) (_2!4124 lt!139777)))))

(declare-fun lt!139779 () (_ BitVec 32))

(assert (=> b!96741 (= lt!139779 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!2053 (buf!2402 bitStream2!8)) (currentByte!4790 bitStream2!8) (currentBit!4785 bitStream2!8)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!139778 () (_ BitVec 32))

(assert (=> b!96741 (= lt!139778 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!60)

(assert (=> b!96741 (= lt!139777 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2053 (buf!2402 bitStream2!8)) (currentByte!4790 bitStream2!8) (currentBit!4785 bitStream2!8))))))

(declare-fun b!96742 () Bool)

(declare-fun e!63359 () Bool)

(declare-fun call!1182 () Bool)

(assert (=> b!96742 (= e!63359 call!1182)))

(declare-fun b!96743 () Bool)

(declare-fun res!79442 () Bool)

(assert (=> b!96743 (= res!79442 (= lt!139779 #b00000000000000000000000000000000))))

(assert (=> b!96743 (=> res!79442 e!63359)))

(declare-fun e!63362 () Bool)

(assert (=> b!96743 (= e!63362 e!63359)))

(declare-fun b!96744 () Bool)

(declare-fun arrayRangesEq!31 (array!4491 array!4491 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!96744 (= e!63357 (arrayRangesEq!31 (buf!2402 bitStream2!8) (buf!2402 base!8) (_1!4124 lt!139777) (_2!4124 lt!139777)))))

(declare-fun b!96745 () Bool)

(assert (=> b!96745 (= e!63360 call!1182)))

(declare-fun bm!1179 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!1179 (= call!1182 (byteRangesEq!0 (ite c!6104 (select (arr!2649 (buf!2402 bitStream2!8)) (_3!251 lt!139777)) (select (arr!2649 (buf!2402 bitStream2!8)) (_4!30 lt!139777))) (ite c!6104 (select (arr!2649 (buf!2402 base!8)) (_3!251 lt!139777)) (select (arr!2649 (buf!2402 base!8)) (_4!30 lt!139777))) (ite c!6104 lt!139778 #b00000000000000000000000000000000) lt!139779))))

(declare-fun d!30288 () Bool)

(declare-fun res!79441 () Bool)

(assert (=> d!30288 (=> res!79441 e!63361)))

(assert (=> d!30288 (= res!79441 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2053 (buf!2402 bitStream2!8)) (currentByte!4790 bitStream2!8) (currentBit!4785 bitStream2!8))))))

(assert (=> d!30288 (= (arrayBitRangesEq!0 (buf!2402 bitStream2!8) (buf!2402 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2053 (buf!2402 bitStream2!8)) (currentByte!4790 bitStream2!8) (currentBit!4785 bitStream2!8))) e!63361)))

(declare-fun b!96746 () Bool)

(assert (=> b!96746 (= e!63360 e!63362)))

(declare-fun res!79443 () Bool)

(assert (=> b!96746 (= res!79443 (byteRangesEq!0 (select (arr!2649 (buf!2402 bitStream2!8)) (_3!251 lt!139777)) (select (arr!2649 (buf!2402 base!8)) (_3!251 lt!139777)) lt!139778 #b00000000000000000000000000001000))))

(assert (=> b!96746 (=> (not res!79443) (not e!63362))))

(assert (= (and d!30288 (not res!79441)) b!96741))

(assert (= (and b!96741 (not res!79445)) b!96744))

(assert (= (and b!96741 res!79444) b!96740))

(assert (= (and b!96740 c!6104) b!96745))

(assert (= (and b!96740 (not c!6104)) b!96746))

(assert (= (and b!96746 res!79443) b!96743))

(assert (= (and b!96743 (not res!79442)) b!96742))

(assert (= (or b!96745 b!96742) bm!1179))

(assert (=> b!96741 m!139641))

(declare-fun m!140271 () Bool)

(assert (=> b!96741 m!140271))

(declare-fun m!140273 () Bool)

(assert (=> b!96744 m!140273))

(declare-fun m!140275 () Bool)

(assert (=> bm!1179 m!140275))

(declare-fun m!140277 () Bool)

(assert (=> bm!1179 m!140277))

(declare-fun m!140279 () Bool)

(assert (=> bm!1179 m!140279))

(declare-fun m!140281 () Bool)

(assert (=> bm!1179 m!140281))

(declare-fun m!140283 () Bool)

(assert (=> bm!1179 m!140283))

(assert (=> b!96746 m!140275))

(assert (=> b!96746 m!140277))

(assert (=> b!96746 m!140275))

(assert (=> b!96746 m!140277))

(declare-fun m!140285 () Bool)

(assert (=> b!96746 m!140285))

(assert (=> b!96518 d!30288))

(assert (=> b!96518 d!30060))

(declare-fun d!30290 () Bool)

(assert (=> d!30290 (= (invariant!0 (currentBit!4785 bitStream1!8) (currentByte!4790 bitStream1!8) (size!2053 (buf!2402 bitStream1!8))) (and (bvsge (currentBit!4785 bitStream1!8) #b00000000000000000000000000000000) (bvslt (currentBit!4785 bitStream1!8) #b00000000000000000000000000001000) (bvsge (currentByte!4790 bitStream1!8) #b00000000000000000000000000000000) (or (bvslt (currentByte!4790 bitStream1!8) (size!2053 (buf!2402 bitStream1!8))) (and (= (currentBit!4785 bitStream1!8) #b00000000000000000000000000000000) (= (currentByte!4790 bitStream1!8) (size!2053 (buf!2402 bitStream1!8)))))))))

(assert (=> d!29972 d!30290))

(declare-fun b!96747 () Bool)

(declare-fun e!63364 () tuple2!7734)

(assert (=> b!96747 (= e!63364 (tuple2!7735 Nil!896 (_2!4117 lt!139470)))))

(declare-fun b!96750 () Bool)

(declare-fun e!63363 () Bool)

(declare-fun lt!139781 () List!899)

(assert (=> b!96750 (= e!63363 (> (length!490 lt!139781) 0))))

(declare-fun d!30292 () Bool)

(assert (=> d!30292 e!63363))

(declare-fun c!6105 () Bool)

(assert (=> d!30292 (= c!6105 (= (bvsub (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001) lt!139472) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!30292 (= lt!139781 (_1!4116 e!63364))))

(declare-fun c!6106 () Bool)

(assert (=> d!30292 (= c!6106 (= (bvsub (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001) lt!139472) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!30292 (bvsge (bvsub (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001) lt!139472) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!30292 (= (bitStreamReadBitsIntoList!0 thiss!1534 (_2!4117 lt!139470) (bvsub (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001) lt!139472)) lt!139781)))

(declare-fun b!96748 () Bool)

(declare-fun lt!139780 () tuple2!7736)

(declare-fun lt!139782 () (_ BitVec 64))

(assert (=> b!96748 (= e!63364 (tuple2!7735 (Cons!895 (_1!4117 lt!139780) (bitStreamReadBitsIntoList!0 thiss!1534 (_2!4117 lt!139780) (bvsub (bvsub (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001) lt!139472) lt!139782))) (_2!4117 lt!139780)))))

(assert (=> b!96748 (= lt!139780 (readBit!0 (_2!4117 lt!139470)))))

(assert (=> b!96748 (= lt!139782 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!96749 () Bool)

(assert (=> b!96749 (= e!63363 (isEmpty!266 lt!139781))))

(assert (= (and d!30292 c!6106) b!96747))

(assert (= (and d!30292 (not c!6106)) b!96748))

(assert (= (and d!30292 c!6105) b!96749))

(assert (= (and d!30292 (not c!6105)) b!96750))

(declare-fun m!140287 () Bool)

(assert (=> b!96750 m!140287))

(declare-fun m!140289 () Bool)

(assert (=> b!96748 m!140289))

(declare-fun m!140291 () Bool)

(assert (=> b!96748 m!140291))

(declare-fun m!140293 () Bool)

(assert (=> b!96749 m!140293))

(assert (=> b!96452 d!30292))

(declare-fun d!30294 () Bool)

(declare-fun e!63371 () Bool)

(assert (=> d!30294 e!63371))

(declare-fun res!79448 () Bool)

(assert (=> d!30294 (=> (not res!79448) (not e!63371))))

(declare-datatypes ((Unit!5864 0))(
  ( (Unit!5865) )
))
(declare-datatypes ((tuple2!7746 0))(
  ( (tuple2!7747 (_1!4125 Unit!5864) (_2!4125 BitStream!3586)) )
))
(declare-fun increaseBitIndex!0 (BitStream!3586) tuple2!7746)

(assert (=> d!30294 (= res!79448 (= (buf!2402 (_2!4125 (increaseBitIndex!0 bitStream2!8))) (buf!2402 bitStream2!8)))))

(declare-fun lt!139799 () Bool)

(assert (=> d!30294 (= lt!139799 (not (= (bvand ((_ sign_extend 24) (select (arr!2649 (buf!2402 bitStream2!8)) (currentByte!4790 bitStream2!8))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!4785 bitStream2!8)))) #b00000000000000000000000000000000)))))

(declare-fun lt!139803 () tuple2!7736)

(assert (=> d!30294 (= lt!139803 (tuple2!7737 (not (= (bvand ((_ sign_extend 24) (select (arr!2649 (buf!2402 bitStream2!8)) (currentByte!4790 bitStream2!8))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!4785 bitStream2!8)))) #b00000000000000000000000000000000)) (_2!4125 (increaseBitIndex!0 bitStream2!8))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!30294 (validate_offset_bit!0 ((_ sign_extend 32) (size!2053 (buf!2402 bitStream2!8))) ((_ sign_extend 32) (currentByte!4790 bitStream2!8)) ((_ sign_extend 32) (currentBit!4785 bitStream2!8)))))

(assert (=> d!30294 (= (readBit!0 bitStream2!8) lt!139803)))

(declare-fun b!96753 () Bool)

(declare-fun lt!139802 () (_ BitVec 64))

(declare-fun lt!139797 () (_ BitVec 64))

(assert (=> b!96753 (= e!63371 (= (bitIndex!0 (size!2053 (buf!2402 (_2!4125 (increaseBitIndex!0 bitStream2!8)))) (currentByte!4790 (_2!4125 (increaseBitIndex!0 bitStream2!8))) (currentBit!4785 (_2!4125 (increaseBitIndex!0 bitStream2!8)))) (bvadd lt!139797 lt!139802)))))

(assert (=> b!96753 (or (not (= (bvand lt!139797 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!139802 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!139797 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!139797 lt!139802) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!96753 (= lt!139802 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!96753 (= lt!139797 (bitIndex!0 (size!2053 (buf!2402 bitStream2!8)) (currentByte!4790 bitStream2!8) (currentBit!4785 bitStream2!8)))))

(declare-fun lt!139800 () Bool)

(assert (=> b!96753 (= lt!139800 (not (= (bvand ((_ sign_extend 24) (select (arr!2649 (buf!2402 bitStream2!8)) (currentByte!4790 bitStream2!8))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!4785 bitStream2!8)))) #b00000000000000000000000000000000)))))

(declare-fun lt!139798 () Bool)

(assert (=> b!96753 (= lt!139798 (not (= (bvand ((_ sign_extend 24) (select (arr!2649 (buf!2402 bitStream2!8)) (currentByte!4790 bitStream2!8))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!4785 bitStream2!8)))) #b00000000000000000000000000000000)))))

(declare-fun lt!139801 () Bool)

(assert (=> b!96753 (= lt!139801 (not (= (bvand ((_ sign_extend 24) (select (arr!2649 (buf!2402 bitStream2!8)) (currentByte!4790 bitStream2!8))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!4785 bitStream2!8)))) #b00000000000000000000000000000000)))))

(assert (= (and d!30294 res!79448) b!96753))

(declare-fun m!140295 () Bool)

(assert (=> d!30294 m!140295))

(declare-fun m!140297 () Bool)

(assert (=> d!30294 m!140297))

(declare-fun m!140299 () Bool)

(assert (=> d!30294 m!140299))

(declare-fun m!140301 () Bool)

(assert (=> d!30294 m!140301))

(assert (=> b!96753 m!140299))

(assert (=> b!96753 m!139641))

(assert (=> b!96753 m!140295))

(declare-fun m!140303 () Bool)

(assert (=> b!96753 m!140303))

(assert (=> b!96753 m!140297))

(assert (=> b!96452 d!30294))

(declare-fun d!30296 () Bool)

(assert (=> d!30296 (= (isEmpty!266 lt!139471) (is-Nil!896 lt!139471))))

(assert (=> b!96453 d!30296))

(assert (=> b!96516 d!30060))

(assert (=> b!96516 d!30024))

(declare-fun d!30298 () Bool)

(assert (=> d!30298 (= (invariant!0 (currentBit!4785 thiss!1534) (currentByte!4790 thiss!1534) (size!2053 (buf!2402 thiss!1534))) (and (bvsge (currentBit!4785 thiss!1534) #b00000000000000000000000000000000) (bvslt (currentBit!4785 thiss!1534) #b00000000000000000000000000001000) (bvsge (currentByte!4790 thiss!1534) #b00000000000000000000000000000000) (or (bvslt (currentByte!4790 thiss!1534) (size!2053 (buf!2402 thiss!1534))) (and (= (currentBit!4785 thiss!1534) #b00000000000000000000000000000000) (= (currentByte!4790 thiss!1534) (size!2053 (buf!2402 thiss!1534)))))))))

(assert (=> d!29978 d!30298))

(declare-fun b!96754 () Bool)

(declare-fun e!63373 () Bool)

(declare-fun e!63375 () Bool)

(assert (=> b!96754 (= e!63373 e!63375)))

(declare-fun c!6107 () Bool)

(declare-fun lt!139804 () tuple4!60)

(assert (=> b!96754 (= c!6107 (= (_3!251 lt!139804) (_4!30 lt!139804)))))

(declare-fun b!96755 () Bool)

(declare-fun e!63376 () Bool)

(assert (=> b!96755 (= e!63376 e!63373)))

(declare-fun res!79452 () Bool)

(assert (=> b!96755 (=> (not res!79452) (not e!63373))))

(declare-fun e!63372 () Bool)

(assert (=> b!96755 (= res!79452 e!63372)))

(declare-fun res!79453 () Bool)

(assert (=> b!96755 (=> res!79453 e!63372)))

(assert (=> b!96755 (= res!79453 (bvsge (_1!4124 lt!139804) (_2!4124 lt!139804)))))

(declare-fun lt!139806 () (_ BitVec 32))

(assert (=> b!96755 (= lt!139806 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!2053 (buf!2402 bitStream1!8)) (currentByte!4790 bitStream1!8) (currentBit!4785 bitStream1!8)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!139805 () (_ BitVec 32))

(assert (=> b!96755 (= lt!139805 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!96755 (= lt!139804 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2053 (buf!2402 bitStream1!8)) (currentByte!4790 bitStream1!8) (currentBit!4785 bitStream1!8))))))

(declare-fun b!96756 () Bool)

(declare-fun e!63374 () Bool)

(declare-fun call!1183 () Bool)

(assert (=> b!96756 (= e!63374 call!1183)))

(declare-fun b!96757 () Bool)

(declare-fun res!79450 () Bool)

(assert (=> b!96757 (= res!79450 (= lt!139806 #b00000000000000000000000000000000))))

(assert (=> b!96757 (=> res!79450 e!63374)))

(declare-fun e!63377 () Bool)

(assert (=> b!96757 (= e!63377 e!63374)))

(declare-fun b!96758 () Bool)

(assert (=> b!96758 (= e!63372 (arrayRangesEq!31 (buf!2402 bitStream1!8) (buf!2402 bitStream2!8) (_1!4124 lt!139804) (_2!4124 lt!139804)))))

(declare-fun b!96759 () Bool)

(assert (=> b!96759 (= e!63375 call!1183)))

(declare-fun bm!1180 () Bool)

(assert (=> bm!1180 (= call!1183 (byteRangesEq!0 (ite c!6107 (select (arr!2649 (buf!2402 bitStream1!8)) (_3!251 lt!139804)) (select (arr!2649 (buf!2402 bitStream1!8)) (_4!30 lt!139804))) (ite c!6107 (select (arr!2649 (buf!2402 bitStream2!8)) (_3!251 lt!139804)) (select (arr!2649 (buf!2402 bitStream2!8)) (_4!30 lt!139804))) (ite c!6107 lt!139805 #b00000000000000000000000000000000) lt!139806))))

(declare-fun d!30300 () Bool)

(declare-fun res!79449 () Bool)

(assert (=> d!30300 (=> res!79449 e!63376)))

(assert (=> d!30300 (= res!79449 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2053 (buf!2402 bitStream1!8)) (currentByte!4790 bitStream1!8) (currentBit!4785 bitStream1!8))))))

(assert (=> d!30300 (= (arrayBitRangesEq!0 (buf!2402 bitStream1!8) (buf!2402 bitStream2!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2053 (buf!2402 bitStream1!8)) (currentByte!4790 bitStream1!8) (currentBit!4785 bitStream1!8))) e!63376)))

(declare-fun b!96760 () Bool)

(assert (=> b!96760 (= e!63375 e!63377)))

(declare-fun res!79451 () Bool)

(assert (=> b!96760 (= res!79451 (byteRangesEq!0 (select (arr!2649 (buf!2402 bitStream1!8)) (_3!251 lt!139804)) (select (arr!2649 (buf!2402 bitStream2!8)) (_3!251 lt!139804)) lt!139805 #b00000000000000000000000000001000))))

(assert (=> b!96760 (=> (not res!79451) (not e!63377))))

(assert (= (and d!30300 (not res!79449)) b!96755))

(assert (= (and b!96755 (not res!79453)) b!96758))

(assert (= (and b!96755 res!79452) b!96754))

(assert (= (and b!96754 c!6107) b!96759))

(assert (= (and b!96754 (not c!6107)) b!96760))

(assert (= (and b!96760 res!79451) b!96757))

(assert (= (and b!96757 (not res!79450)) b!96756))

(assert (= (or b!96759 b!96756) bm!1180))

(assert (=> b!96755 m!139639))

(declare-fun m!140305 () Bool)

(assert (=> b!96755 m!140305))

(declare-fun m!140307 () Bool)

(assert (=> b!96758 m!140307))

(declare-fun m!140309 () Bool)

(assert (=> bm!1180 m!140309))

(declare-fun m!140311 () Bool)

(assert (=> bm!1180 m!140311))

(declare-fun m!140313 () Bool)

(assert (=> bm!1180 m!140313))

(declare-fun m!140315 () Bool)

(assert (=> bm!1180 m!140315))

(declare-fun m!140317 () Bool)

(assert (=> bm!1180 m!140317))

(assert (=> b!96760 m!140309))

(assert (=> b!96760 m!140311))

(assert (=> b!96760 m!140309))

(assert (=> b!96760 m!140311))

(declare-fun m!140319 () Bool)

(assert (=> b!96760 m!140319))

(assert (=> b!96503 d!30300))

(assert (=> b!96503 d!30058))

(declare-fun d!30302 () Bool)

(declare-fun lt!139809 () Int)

(assert (=> d!30302 (>= lt!139809 0)))

(declare-fun e!63380 () Int)

(assert (=> d!30302 (= lt!139809 e!63380)))

(declare-fun c!6110 () Bool)

(assert (=> d!30302 (= c!6110 (is-Nil!896 listBits!13))))

(assert (=> d!30302 (= (size!2057 listBits!13) lt!139809)))

(declare-fun b!96765 () Bool)

(assert (=> b!96765 (= e!63380 0)))

(declare-fun b!96766 () Bool)

(assert (=> b!96766 (= e!63380 (+ 1 (size!2057 (t!1649 listBits!13))))))

(assert (= (and d!30302 c!6110) b!96765))

(assert (= (and d!30302 (not c!6110)) b!96766))

(declare-fun m!140321 () Bool)

(assert (=> b!96766 m!140321))

(assert (=> d!29980 d!30302))

(assert (=> b!96501 d!30058))

(assert (=> b!96501 d!30060))

(declare-fun d!30304 () Bool)

(declare-fun e!63381 () Bool)

(assert (=> d!30304 e!63381))

(declare-fun res!79454 () Bool)

(assert (=> d!30304 (=> (not res!79454) (not e!63381))))

(assert (=> d!30304 (= res!79454 (= (buf!2402 (_2!4125 (increaseBitIndex!0 bitStream1!8))) (buf!2402 bitStream1!8)))))

(declare-fun lt!139812 () Bool)

(assert (=> d!30304 (= lt!139812 (not (= (bvand ((_ sign_extend 24) (select (arr!2649 (buf!2402 bitStream1!8)) (currentByte!4790 bitStream1!8))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!4785 bitStream1!8)))) #b00000000000000000000000000000000)))))

(declare-fun lt!139816 () tuple2!7736)

(assert (=> d!30304 (= lt!139816 (tuple2!7737 (not (= (bvand ((_ sign_extend 24) (select (arr!2649 (buf!2402 bitStream1!8)) (currentByte!4790 bitStream1!8))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!4785 bitStream1!8)))) #b00000000000000000000000000000000)) (_2!4125 (increaseBitIndex!0 bitStream1!8))))))

(assert (=> d!30304 (validate_offset_bit!0 ((_ sign_extend 32) (size!2053 (buf!2402 bitStream1!8))) ((_ sign_extend 32) (currentByte!4790 bitStream1!8)) ((_ sign_extend 32) (currentBit!4785 bitStream1!8)))))

(assert (=> d!30304 (= (readBit!0 bitStream1!8) lt!139816)))

(declare-fun lt!139815 () (_ BitVec 64))

(declare-fun b!96767 () Bool)

(declare-fun lt!139810 () (_ BitVec 64))

(assert (=> b!96767 (= e!63381 (= (bitIndex!0 (size!2053 (buf!2402 (_2!4125 (increaseBitIndex!0 bitStream1!8)))) (currentByte!4790 (_2!4125 (increaseBitIndex!0 bitStream1!8))) (currentBit!4785 (_2!4125 (increaseBitIndex!0 bitStream1!8)))) (bvadd lt!139810 lt!139815)))))

(assert (=> b!96767 (or (not (= (bvand lt!139810 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!139815 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!139810 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!139810 lt!139815) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!96767 (= lt!139815 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!96767 (= lt!139810 (bitIndex!0 (size!2053 (buf!2402 bitStream1!8)) (currentByte!4790 bitStream1!8) (currentBit!4785 bitStream1!8)))))

(declare-fun lt!139813 () Bool)

(assert (=> b!96767 (= lt!139813 (not (= (bvand ((_ sign_extend 24) (select (arr!2649 (buf!2402 bitStream1!8)) (currentByte!4790 bitStream1!8))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!4785 bitStream1!8)))) #b00000000000000000000000000000000)))))

(declare-fun lt!139811 () Bool)

(assert (=> b!96767 (= lt!139811 (not (= (bvand ((_ sign_extend 24) (select (arr!2649 (buf!2402 bitStream1!8)) (currentByte!4790 bitStream1!8))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!4785 bitStream1!8)))) #b00000000000000000000000000000000)))))

(declare-fun lt!139814 () Bool)

(assert (=> b!96767 (= lt!139814 (not (= (bvand ((_ sign_extend 24) (select (arr!2649 (buf!2402 bitStream1!8)) (currentByte!4790 bitStream1!8))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!4785 bitStream1!8)))) #b00000000000000000000000000000000)))))

(assert (= (and d!30304 res!79454) b!96767))

(declare-fun m!140323 () Bool)

(assert (=> d!30304 m!140323))

(declare-fun m!140325 () Bool)

(assert (=> d!30304 m!140325))

(declare-fun m!140327 () Bool)

(assert (=> d!30304 m!140327))

(declare-fun m!140329 () Bool)

(assert (=> d!30304 m!140329))

(assert (=> b!96767 m!140327))

(assert (=> b!96767 m!139639))

(assert (=> b!96767 m!140323))

(declare-fun m!140331 () Bool)

(assert (=> b!96767 m!140331))

(assert (=> b!96767 m!140325))

(assert (=> d!30054 d!30304))

(assert (=> d!30010 d!30282))

(declare-fun d!30306 () Bool)

(assert (=> d!30306 (= (remainingBits!0 ((_ sign_extend 32) (size!2053 (buf!2402 base!8))) ((_ sign_extend 32) (currentByte!4790 base!8)) ((_ sign_extend 32) (currentBit!4785 base!8))) (bvsub (bvmul ((_ sign_extend 32) (size!2053 (buf!2402 base!8))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4790 base!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4785 base!8)))))))

(assert (=> d!30024 d!30306))

(declare-fun d!30308 () Bool)

(assert (=> d!30308 (= (invariant!0 (currentBit!4785 base!8) (currentByte!4790 base!8) (size!2053 (buf!2402 base!8))) (and (bvsge (currentBit!4785 base!8) #b00000000000000000000000000000000) (bvslt (currentBit!4785 base!8) #b00000000000000000000000000001000) (bvsge (currentByte!4790 base!8) #b00000000000000000000000000000000) (or (bvslt (currentByte!4790 base!8) (size!2053 (buf!2402 base!8))) (and (= (currentBit!4785 base!8) #b00000000000000000000000000000000) (= (currentByte!4790 base!8) (size!2053 (buf!2402 base!8)))))))))

(assert (=> d!30024 d!30308))

(assert (=> d!29974 d!30284))

(declare-fun d!30310 () Bool)

(assert (=> d!30310 (= (remainingBits!0 ((_ sign_extend 32) (size!2053 (buf!2402 bitStream1!8))) ((_ sign_extend 32) (currentByte!4790 bitStream1!8)) ((_ sign_extend 32) (currentBit!4785 bitStream1!8))) (bvsub (bvmul ((_ sign_extend 32) (size!2053 (buf!2402 bitStream1!8))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4790 bitStream1!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4785 bitStream1!8)))))))

(assert (=> d!30058 d!30310))

(assert (=> d!30058 d!30290))

(declare-fun d!30312 () Bool)

(assert (=> d!30312 (= (isEmpty!266 lt!139474) (is-Nil!896 lt!139474))))

(assert (=> b!96457 d!30312))

(declare-fun b!96768 () Bool)

(declare-fun e!63383 () Bool)

(declare-fun e!63385 () Bool)

(assert (=> b!96768 (= e!63383 e!63385)))

(declare-fun c!6111 () Bool)

(declare-fun lt!139817 () tuple4!60)

(assert (=> b!96768 (= c!6111 (= (_3!251 lt!139817) (_4!30 lt!139817)))))

(declare-fun b!96769 () Bool)

(declare-fun e!63386 () Bool)

(assert (=> b!96769 (= e!63386 e!63383)))

(declare-fun res!79458 () Bool)

(assert (=> b!96769 (=> (not res!79458) (not e!63383))))

(declare-fun e!63382 () Bool)

(assert (=> b!96769 (= res!79458 e!63382)))

(declare-fun res!79459 () Bool)

(assert (=> b!96769 (=> res!79459 e!63382)))

(assert (=> b!96769 (= res!79459 (bvsge (_1!4124 lt!139817) (_2!4124 lt!139817)))))

(declare-fun lt!139819 () (_ BitVec 32))

(assert (=> b!96769 (= lt!139819 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!2053 (buf!2402 bitStream1!8)) (currentByte!4790 bitStream1!8) (currentBit!4785 bitStream1!8)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!139818 () (_ BitVec 32))

(assert (=> b!96769 (= lt!139818 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!96769 (= lt!139817 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2053 (buf!2402 bitStream1!8)) (currentByte!4790 bitStream1!8) (currentBit!4785 bitStream1!8))))))

(declare-fun b!96770 () Bool)

(declare-fun e!63384 () Bool)

(declare-fun call!1184 () Bool)

(assert (=> b!96770 (= e!63384 call!1184)))

(declare-fun b!96771 () Bool)

(declare-fun res!79456 () Bool)

(assert (=> b!96771 (= res!79456 (= lt!139819 #b00000000000000000000000000000000))))

(assert (=> b!96771 (=> res!79456 e!63384)))

(declare-fun e!63387 () Bool)

(assert (=> b!96771 (= e!63387 e!63384)))

(declare-fun b!96772 () Bool)

(assert (=> b!96772 (= e!63382 (arrayRangesEq!31 (buf!2402 bitStream1!8) (buf!2402 base!8) (_1!4124 lt!139817) (_2!4124 lt!139817)))))

(declare-fun b!96773 () Bool)

(assert (=> b!96773 (= e!63385 call!1184)))

(declare-fun bm!1181 () Bool)

(assert (=> bm!1181 (= call!1184 (byteRangesEq!0 (ite c!6111 (select (arr!2649 (buf!2402 bitStream1!8)) (_3!251 lt!139817)) (select (arr!2649 (buf!2402 bitStream1!8)) (_4!30 lt!139817))) (ite c!6111 (select (arr!2649 (buf!2402 base!8)) (_3!251 lt!139817)) (select (arr!2649 (buf!2402 base!8)) (_4!30 lt!139817))) (ite c!6111 lt!139818 #b00000000000000000000000000000000) lt!139819))))

(declare-fun d!30314 () Bool)

(declare-fun res!79455 () Bool)

(assert (=> d!30314 (=> res!79455 e!63386)))

(assert (=> d!30314 (= res!79455 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2053 (buf!2402 bitStream1!8)) (currentByte!4790 bitStream1!8) (currentBit!4785 bitStream1!8))))))

(assert (=> d!30314 (= (arrayBitRangesEq!0 (buf!2402 bitStream1!8) (buf!2402 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2053 (buf!2402 bitStream1!8)) (currentByte!4790 bitStream1!8) (currentBit!4785 bitStream1!8))) e!63386)))

(declare-fun b!96774 () Bool)

(assert (=> b!96774 (= e!63385 e!63387)))

(declare-fun res!79457 () Bool)

(assert (=> b!96774 (= res!79457 (byteRangesEq!0 (select (arr!2649 (buf!2402 bitStream1!8)) (_3!251 lt!139817)) (select (arr!2649 (buf!2402 base!8)) (_3!251 lt!139817)) lt!139818 #b00000000000000000000000000001000))))

(assert (=> b!96774 (=> (not res!79457) (not e!63387))))

(assert (= (and d!30314 (not res!79455)) b!96769))

(assert (= (and b!96769 (not res!79459)) b!96772))

(assert (= (and b!96769 res!79458) b!96768))

(assert (= (and b!96768 c!6111) b!96773))

(assert (= (and b!96768 (not c!6111)) b!96774))

(assert (= (and b!96774 res!79457) b!96771))

(assert (= (and b!96771 (not res!79456)) b!96770))

(assert (= (or b!96773 b!96770) bm!1181))

(assert (=> b!96769 m!139639))

(assert (=> b!96769 m!140305))

(declare-fun m!140333 () Bool)

(assert (=> b!96772 m!140333))

(declare-fun m!140335 () Bool)

(assert (=> bm!1181 m!140335))

(declare-fun m!140337 () Bool)

(assert (=> bm!1181 m!140337))

(declare-fun m!140339 () Bool)

(assert (=> bm!1181 m!140339))

(declare-fun m!140341 () Bool)

(assert (=> bm!1181 m!140341))

(declare-fun m!140343 () Bool)

(assert (=> bm!1181 m!140343))

(assert (=> b!96774 m!140335))

(assert (=> b!96774 m!140337))

(assert (=> b!96774 m!140335))

(assert (=> b!96774 m!140337))

(declare-fun m!140345 () Bool)

(assert (=> b!96774 m!140345))

(assert (=> b!96486 d!30314))

(assert (=> b!96486 d!30058))

(declare-fun b!96775 () Bool)

(declare-fun e!63389 () tuple2!7734)

(assert (=> b!96775 (= e!63389 (tuple2!7735 Nil!896 (_2!4117 lt!139473)))))

(declare-fun b!96778 () Bool)

(declare-fun e!63388 () Bool)

(declare-fun lt!139821 () List!899)

(assert (=> b!96778 (= e!63388 (> (length!490 lt!139821) 0))))

(declare-fun d!30316 () Bool)

(assert (=> d!30316 e!63388))

(declare-fun c!6112 () Bool)

(assert (=> d!30316 (= c!6112 (= (bvsub nBits!484 lt!139475) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!30316 (= lt!139821 (_1!4116 e!63389))))

(declare-fun c!6113 () Bool)

(assert (=> d!30316 (= c!6113 (= (bvsub nBits!484 lt!139475) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!30316 (bvsge (bvsub nBits!484 lt!139475) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!30316 (= (bitStreamReadBitsIntoList!0 thiss!1534 (_2!4117 lt!139473) (bvsub nBits!484 lt!139475)) lt!139821)))

(declare-fun lt!139820 () tuple2!7736)

(declare-fun lt!139822 () (_ BitVec 64))

(declare-fun b!96776 () Bool)

(assert (=> b!96776 (= e!63389 (tuple2!7735 (Cons!895 (_1!4117 lt!139820) (bitStreamReadBitsIntoList!0 thiss!1534 (_2!4117 lt!139820) (bvsub (bvsub nBits!484 lt!139475) lt!139822))) (_2!4117 lt!139820)))))

(assert (=> b!96776 (= lt!139820 (readBit!0 (_2!4117 lt!139473)))))

(assert (=> b!96776 (= lt!139822 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!96777 () Bool)

(assert (=> b!96777 (= e!63388 (isEmpty!266 lt!139821))))

(assert (= (and d!30316 c!6113) b!96775))

(assert (= (and d!30316 (not c!6113)) b!96776))

(assert (= (and d!30316 c!6112) b!96777))

(assert (= (and d!30316 (not c!6112)) b!96778))

(declare-fun m!140347 () Bool)

(assert (=> b!96778 m!140347))

(declare-fun m!140349 () Bool)

(assert (=> b!96776 m!140349))

(declare-fun m!140351 () Bool)

(assert (=> b!96776 m!140351))

(declare-fun m!140353 () Bool)

(assert (=> b!96777 m!140353))

(assert (=> b!96456 d!30316))

(assert (=> b!96456 d!30304))

(declare-fun d!30318 () Bool)

(assert (=> d!30318 (= (length!490 lt!139474) (size!2057 lt!139474))))

(declare-fun bs!7405 () Bool)

(assert (= bs!7405 d!30318))

(declare-fun m!140355 () Bool)

(assert (=> bs!7405 m!140355))

(assert (=> b!96458 d!30318))

(assert (=> d!30048 d!30310))

(assert (=> b!96484 d!30058))

(assert (=> b!96484 d!30024))

(assert (=> d!29976 d!30308))

(push 1)

(assert (not d!30318))

(assert (not b!96749))

(assert (not b!96746))

(assert (not d!30286))

(assert (not b!96769))

(assert (not d!30294))

(assert (not b!96760))

(assert (not b!96772))

(assert (not b!96741))

(assert (not b!96753))

(assert (not bm!1180))

(assert (not b!96758))

(assert (not b!96778))

(assert (not b!96777))

(assert (not b!96748))

(assert (not d!30304))

(assert (not b!96774))

(assert (not b!96776))

(assert (not b!96750))

(assert (not bm!1181))

(assert (not bm!1179))

(assert (not b!96766))

(assert (not b!96755))

(assert (not b!96744))

(assert (not b!96767))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!30320 () Bool)

(declare-fun res!79464 () Bool)

(declare-fun e!63394 () Bool)

(assert (=> d!30320 (=> res!79464 e!63394)))

(assert (=> d!30320 (= res!79464 (= (_1!4124 lt!139817) (_2!4124 lt!139817)))))

(assert (=> d!30320 (= (arrayRangesEq!31 (buf!2402 bitStream1!8) (buf!2402 base!8) (_1!4124 lt!139817) (_2!4124 lt!139817)) e!63394)))

(declare-fun b!96783 () Bool)

(declare-fun e!63395 () Bool)

(assert (=> b!96783 (= e!63394 e!63395)))

(declare-fun res!79465 () Bool)

(assert (=> b!96783 (=> (not res!79465) (not e!63395))))

(assert (=> b!96783 (= res!79465 (= (select (arr!2649 (buf!2402 bitStream1!8)) (_1!4124 lt!139817)) (select (arr!2649 (buf!2402 base!8)) (_1!4124 lt!139817))))))

(declare-fun b!96784 () Bool)

(assert (=> b!96784 (= e!63395 (arrayRangesEq!31 (buf!2402 bitStream1!8) (buf!2402 base!8) (bvadd (_1!4124 lt!139817) #b00000000000000000000000000000001) (_2!4124 lt!139817)))))

(assert (= (and d!30320 (not res!79464)) b!96783))

(assert (= (and b!96783 res!79465) b!96784))

(declare-fun m!140357 () Bool)

(assert (=> b!96783 m!140357))

(declare-fun m!140359 () Bool)

(assert (=> b!96783 m!140359))

(declare-fun m!140361 () Bool)

(assert (=> b!96784 m!140361))

(assert (=> b!96772 d!30320))

(declare-fun b!96785 () Bool)

(declare-fun e!63397 () tuple2!7734)

(assert (=> b!96785 (= e!63397 (tuple2!7735 Nil!896 (_2!4117 lt!139780)))))

(declare-fun b!96788 () Bool)

(declare-fun e!63396 () Bool)

(declare-fun lt!139824 () List!899)

(assert (=> b!96788 (= e!63396 (> (length!490 lt!139824) 0))))

(declare-fun d!30322 () Bool)

(assert (=> d!30322 e!63396))

(declare-fun c!6114 () Bool)

(assert (=> d!30322 (= c!6114 (= (bvsub (bvsub (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001) lt!139472) lt!139782) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!30322 (= lt!139824 (_1!4116 e!63397))))

(declare-fun c!6115 () Bool)

(assert (=> d!30322 (= c!6115 (= (bvsub (bvsub (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001) lt!139472) lt!139782) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!30322 (bvsge (bvsub (bvsub (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001) lt!139472) lt!139782) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!30322 (= (bitStreamReadBitsIntoList!0 thiss!1534 (_2!4117 lt!139780) (bvsub (bvsub (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001) lt!139472) lt!139782)) lt!139824)))

(declare-fun lt!139825 () (_ BitVec 64))

(declare-fun lt!139823 () tuple2!7736)

(declare-fun b!96786 () Bool)

(assert (=> b!96786 (= e!63397 (tuple2!7735 (Cons!895 (_1!4117 lt!139823) (bitStreamReadBitsIntoList!0 thiss!1534 (_2!4117 lt!139823) (bvsub (bvsub (bvsub (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001) lt!139472) lt!139782) lt!139825))) (_2!4117 lt!139823)))))

(assert (=> b!96786 (= lt!139823 (readBit!0 (_2!4117 lt!139780)))))

(assert (=> b!96786 (= lt!139825 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!96787 () Bool)

(assert (=> b!96787 (= e!63396 (isEmpty!266 lt!139824))))

(assert (= (and d!30322 c!6115) b!96785))

(assert (= (and d!30322 (not c!6115)) b!96786))

(assert (= (and d!30322 c!6114) b!96787))

(assert (= (and d!30322 (not c!6114)) b!96788))

(declare-fun m!140363 () Bool)

(assert (=> b!96788 m!140363))

(declare-fun m!140365 () Bool)

(assert (=> b!96786 m!140365))

(declare-fun m!140367 () Bool)

(assert (=> b!96786 m!140367))

(declare-fun m!140369 () Bool)

(assert (=> b!96787 m!140369))

(assert (=> b!96748 d!30322))

(declare-fun d!30324 () Bool)

(declare-fun e!63398 () Bool)

(assert (=> d!30324 e!63398))

(declare-fun res!79466 () Bool)

(assert (=> d!30324 (=> (not res!79466) (not e!63398))))

(assert (=> d!30324 (= res!79466 (= (buf!2402 (_2!4125 (increaseBitIndex!0 (_2!4117 lt!139470)))) (buf!2402 (_2!4117 lt!139470))))))

(declare-fun lt!139828 () Bool)

(assert (=> d!30324 (= lt!139828 (not (= (bvand ((_ sign_extend 24) (select (arr!2649 (buf!2402 (_2!4117 lt!139470))) (currentByte!4790 (_2!4117 lt!139470)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!4785 (_2!4117 lt!139470))))) #b00000000000000000000000000000000)))))

(declare-fun lt!139832 () tuple2!7736)

(assert (=> d!30324 (= lt!139832 (tuple2!7737 (not (= (bvand ((_ sign_extend 24) (select (arr!2649 (buf!2402 (_2!4117 lt!139470))) (currentByte!4790 (_2!4117 lt!139470)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!4785 (_2!4117 lt!139470))))) #b00000000000000000000000000000000)) (_2!4125 (increaseBitIndex!0 (_2!4117 lt!139470)))))))

(assert (=> d!30324 (validate_offset_bit!0 ((_ sign_extend 32) (size!2053 (buf!2402 (_2!4117 lt!139470)))) ((_ sign_extend 32) (currentByte!4790 (_2!4117 lt!139470))) ((_ sign_extend 32) (currentBit!4785 (_2!4117 lt!139470))))))

(assert (=> d!30324 (= (readBit!0 (_2!4117 lt!139470)) lt!139832)))

(declare-fun lt!139826 () (_ BitVec 64))

(declare-fun lt!139831 () (_ BitVec 64))

(declare-fun b!96789 () Bool)

(assert (=> b!96789 (= e!63398 (= (bitIndex!0 (size!2053 (buf!2402 (_2!4125 (increaseBitIndex!0 (_2!4117 lt!139470))))) (currentByte!4790 (_2!4125 (increaseBitIndex!0 (_2!4117 lt!139470)))) (currentBit!4785 (_2!4125 (increaseBitIndex!0 (_2!4117 lt!139470))))) (bvadd lt!139826 lt!139831)))))

(assert (=> b!96789 (or (not (= (bvand lt!139826 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!139831 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!139826 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!139826 lt!139831) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!96789 (= lt!139831 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!96789 (= lt!139826 (bitIndex!0 (size!2053 (buf!2402 (_2!4117 lt!139470))) (currentByte!4790 (_2!4117 lt!139470)) (currentBit!4785 (_2!4117 lt!139470))))))

(declare-fun lt!139829 () Bool)

(assert (=> b!96789 (= lt!139829 (not (= (bvand ((_ sign_extend 24) (select (arr!2649 (buf!2402 (_2!4117 lt!139470))) (currentByte!4790 (_2!4117 lt!139470)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!4785 (_2!4117 lt!139470))))) #b00000000000000000000000000000000)))))

(declare-fun lt!139827 () Bool)

(assert (=> b!96789 (= lt!139827 (not (= (bvand ((_ sign_extend 24) (select (arr!2649 (buf!2402 (_2!4117 lt!139470))) (currentByte!4790 (_2!4117 lt!139470)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!4785 (_2!4117 lt!139470))))) #b00000000000000000000000000000000)))))

(declare-fun lt!139830 () Bool)

(assert (=> b!96789 (= lt!139830 (not (= (bvand ((_ sign_extend 24) (select (arr!2649 (buf!2402 (_2!4117 lt!139470))) (currentByte!4790 (_2!4117 lt!139470)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!4785 (_2!4117 lt!139470))))) #b00000000000000000000000000000000)))))

(assert (= (and d!30324 res!79466) b!96789))

(declare-fun m!140371 () Bool)

(assert (=> d!30324 m!140371))

(declare-fun m!140373 () Bool)

(assert (=> d!30324 m!140373))

(declare-fun m!140375 () Bool)

(assert (=> d!30324 m!140375))

(declare-fun m!140377 () Bool)

(assert (=> d!30324 m!140377))

(assert (=> b!96789 m!140375))

(declare-fun m!140379 () Bool)

(assert (=> b!96789 m!140379))

(assert (=> b!96789 m!140371))

(declare-fun m!140381 () Bool)

(assert (=> b!96789 m!140381))

(assert (=> b!96789 m!140373))

(assert (=> b!96748 d!30324))

(declare-fun d!30326 () Bool)

(assert (=> d!30326 (= (byteRangesEq!0 (select (arr!2649 (buf!2402 bitStream1!8)) (_3!251 lt!139817)) (select (arr!2649 (buf!2402 base!8)) (_3!251 lt!139817)) lt!139818 #b00000000000000000000000000001000) (or (= lt!139818 #b00000000000000000000000000001000) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!2649 (buf!2402 bitStream1!8)) (_3!251 lt!139817))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!139818)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!2649 (buf!2402 base!8)) (_3!251 lt!139817))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!139818)))) #b00000000000000000000000011111111))))))

(declare-fun bs!7406 () Bool)

(assert (= bs!7406 d!30326))

(declare-fun m!140383 () Bool)

(assert (=> bs!7406 m!140383))

(declare-fun m!140385 () Bool)

(assert (=> bs!7406 m!140385))

(assert (=> b!96774 d!30326))

(declare-fun d!30328 () Bool)

(assert (=> d!30328 (= (byteRangesEq!0 (ite c!6111 (select (arr!2649 (buf!2402 bitStream1!8)) (_3!251 lt!139817)) (select (arr!2649 (buf!2402 bitStream1!8)) (_4!30 lt!139817))) (ite c!6111 (select (arr!2649 (buf!2402 base!8)) (_3!251 lt!139817)) (select (arr!2649 (buf!2402 base!8)) (_4!30 lt!139817))) (ite c!6111 lt!139818 #b00000000000000000000000000000000) lt!139819) (or (= (ite c!6111 lt!139818 #b00000000000000000000000000000000) lt!139819) (= (bvand (bvand (bvand ((_ sign_extend 24) (ite c!6111 (select (arr!2649 (buf!2402 bitStream1!8)) (_3!251 lt!139817)) (select (arr!2649 (buf!2402 bitStream1!8)) (_4!30 lt!139817)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!139819))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!6111 lt!139818 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (ite c!6111 (select (arr!2649 (buf!2402 base!8)) (_3!251 lt!139817)) (select (arr!2649 (buf!2402 base!8)) (_4!30 lt!139817)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!139819))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!6111 lt!139818 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111))))))

(declare-fun bs!7407 () Bool)

(assert (= bs!7407 d!30328))

(declare-fun m!140387 () Bool)

(assert (=> bs!7407 m!140387))

(declare-fun m!140389 () Bool)

(assert (=> bs!7407 m!140389))

(assert (=> bm!1181 d!30328))

(declare-fun d!30330 () Bool)

(declare-fun e!63399 () Bool)

(assert (=> d!30330 e!63399))

(declare-fun res!79468 () Bool)

(assert (=> d!30330 (=> (not res!79468) (not e!63399))))

(declare-fun lt!139833 () (_ BitVec 64))

(declare-fun lt!139834 () (_ BitVec 64))

(declare-fun lt!139838 () (_ BitVec 64))

(assert (=> d!30330 (= res!79468 (= lt!139834 (bvsub lt!139838 lt!139833)))))

(assert (=> d!30330 (or (= (bvand lt!139838 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!139833 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!139838 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!139838 lt!139833) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!30330 (= lt!139833 (remainingBits!0 ((_ sign_extend 32) (size!2053 (buf!2402 (_2!4125 (increaseBitIndex!0 bitStream1!8))))) ((_ sign_extend 32) (currentByte!4790 (_2!4125 (increaseBitIndex!0 bitStream1!8)))) ((_ sign_extend 32) (currentBit!4785 (_2!4125 (increaseBitIndex!0 bitStream1!8))))))))

(declare-fun lt!139836 () (_ BitVec 64))

(declare-fun lt!139835 () (_ BitVec 64))

(assert (=> d!30330 (= lt!139838 (bvmul lt!139836 lt!139835))))

(assert (=> d!30330 (or (= lt!139836 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!139835 (bvsdiv (bvmul lt!139836 lt!139835) lt!139836)))))

(assert (=> d!30330 (= lt!139835 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!30330 (= lt!139836 ((_ sign_extend 32) (size!2053 (buf!2402 (_2!4125 (increaseBitIndex!0 bitStream1!8))))))))

(assert (=> d!30330 (= lt!139834 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4790 (_2!4125 (increaseBitIndex!0 bitStream1!8)))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4785 (_2!4125 (increaseBitIndex!0 bitStream1!8))))))))

(assert (=> d!30330 (invariant!0 (currentBit!4785 (_2!4125 (increaseBitIndex!0 bitStream1!8))) (currentByte!4790 (_2!4125 (increaseBitIndex!0 bitStream1!8))) (size!2053 (buf!2402 (_2!4125 (increaseBitIndex!0 bitStream1!8)))))))

(assert (=> d!30330 (= (bitIndex!0 (size!2053 (buf!2402 (_2!4125 (increaseBitIndex!0 bitStream1!8)))) (currentByte!4790 (_2!4125 (increaseBitIndex!0 bitStream1!8))) (currentBit!4785 (_2!4125 (increaseBitIndex!0 bitStream1!8)))) lt!139834)))

(declare-fun b!96790 () Bool)

(declare-fun res!79467 () Bool)

(assert (=> b!96790 (=> (not res!79467) (not e!63399))))

(assert (=> b!96790 (= res!79467 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!139834))))

(declare-fun b!96791 () Bool)

(declare-fun lt!139837 () (_ BitVec 64))

(assert (=> b!96791 (= e!63399 (bvsle lt!139834 (bvmul lt!139837 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!96791 (or (= lt!139837 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!139837 #b0000000000000000000000000000000000000000000000000000000000001000) lt!139837)))))

(assert (=> b!96791 (= lt!139837 ((_ sign_extend 32) (size!2053 (buf!2402 (_2!4125 (increaseBitIndex!0 bitStream1!8))))))))

(assert (= (and d!30330 res!79468) b!96790))

(assert (= (and b!96790 res!79467) b!96791))

(declare-fun m!140391 () Bool)

(assert (=> d!30330 m!140391))

(declare-fun m!140393 () Bool)

(assert (=> d!30330 m!140393))

(assert (=> b!96767 d!30330))

(declare-fun d!30332 () Bool)

(declare-fun e!63402 () Bool)

(assert (=> d!30332 e!63402))

(declare-fun res!79473 () Bool)

(assert (=> d!30332 (=> (not res!79473) (not e!63402))))

(declare-fun lt!139849 () (_ BitVec 64))

(declare-fun lt!139850 () (_ BitVec 64))

(declare-fun lt!139853 () tuple2!7746)

(assert (=> d!30332 (= res!79473 (= (bvadd lt!139849 lt!139850) (bitIndex!0 (size!2053 (buf!2402 (_2!4125 lt!139853))) (currentByte!4790 (_2!4125 lt!139853)) (currentBit!4785 (_2!4125 lt!139853)))))))

(assert (=> d!30332 (or (not (= (bvand lt!139849 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!139850 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!139849 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!139849 lt!139850) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!30332 (= lt!139850 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!30332 (= lt!139849 (bitIndex!0 (size!2053 (buf!2402 bitStream1!8)) (currentByte!4790 bitStream1!8) (currentBit!4785 bitStream1!8)))))

(declare-fun Unit!5866 () Unit!5864)

(declare-fun Unit!5867 () Unit!5864)

(assert (=> d!30332 (= lt!139853 (ite (bvslt (currentBit!4785 bitStream1!8) #b00000000000000000000000000000111) (tuple2!7747 Unit!5866 (BitStream!3587 (buf!2402 bitStream1!8) (currentByte!4790 bitStream1!8) (bvadd (currentBit!4785 bitStream1!8) #b00000000000000000000000000000001))) (tuple2!7747 Unit!5867 (BitStream!3587 (buf!2402 bitStream1!8) (bvadd (currentByte!4790 bitStream1!8) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (=> d!30332 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!2053 (buf!2402 bitStream1!8))) ((_ sign_extend 32) (currentByte!4790 bitStream1!8)) ((_ sign_extend 32) (currentBit!4785 bitStream1!8))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!30332 (= (increaseBitIndex!0 bitStream1!8) lt!139853)))

(declare-fun b!96796 () Bool)

(declare-fun res!79474 () Bool)

(assert (=> b!96796 (=> (not res!79474) (not e!63402))))

(declare-fun lt!139851 () (_ BitVec 64))

(declare-fun lt!139852 () (_ BitVec 64))

(assert (=> b!96796 (= res!79474 (= (bvsub lt!139851 lt!139852) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!96796 (or (= (bvand lt!139851 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!139852 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!139851 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!139851 lt!139852) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!96796 (= lt!139852 (remainingBits!0 ((_ sign_extend 32) (size!2053 (buf!2402 (_2!4125 lt!139853)))) ((_ sign_extend 32) (currentByte!4790 (_2!4125 lt!139853))) ((_ sign_extend 32) (currentBit!4785 (_2!4125 lt!139853)))))))

(assert (=> b!96796 (= lt!139851 (remainingBits!0 ((_ sign_extend 32) (size!2053 (buf!2402 bitStream1!8))) ((_ sign_extend 32) (currentByte!4790 bitStream1!8)) ((_ sign_extend 32) (currentBit!4785 bitStream1!8))))))

(declare-fun b!96797 () Bool)

(assert (=> b!96797 (= e!63402 (= (size!2053 (buf!2402 bitStream1!8)) (size!2053 (buf!2402 (_2!4125 lt!139853)))))))

(assert (= (and d!30332 res!79473) b!96796))

(assert (= (and b!96796 res!79474) b!96797))

(declare-fun m!140395 () Bool)

(assert (=> d!30332 m!140395))

(assert (=> d!30332 m!139639))

(assert (=> d!30332 m!139855))

(declare-fun m!140397 () Bool)

(assert (=> b!96796 m!140397))

(assert (=> b!96796 m!139855))

(assert (=> b!96767 d!30332))

(assert (=> b!96767 d!30058))

(declare-fun b!96798 () Bool)

(declare-fun e!63404 () tuple2!7734)

(assert (=> b!96798 (= e!63404 (tuple2!7735 Nil!896 (_2!4117 lt!139820)))))

(declare-fun b!96801 () Bool)

(declare-fun e!63403 () Bool)

(declare-fun lt!139855 () List!899)

(assert (=> b!96801 (= e!63403 (> (length!490 lt!139855) 0))))

(declare-fun d!30334 () Bool)

(assert (=> d!30334 e!63403))

(declare-fun c!6116 () Bool)

(assert (=> d!30334 (= c!6116 (= (bvsub (bvsub nBits!484 lt!139475) lt!139822) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!30334 (= lt!139855 (_1!4116 e!63404))))

(declare-fun c!6117 () Bool)

(assert (=> d!30334 (= c!6117 (= (bvsub (bvsub nBits!484 lt!139475) lt!139822) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!30334 (bvsge (bvsub (bvsub nBits!484 lt!139475) lt!139822) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!30334 (= (bitStreamReadBitsIntoList!0 thiss!1534 (_2!4117 lt!139820) (bvsub (bvsub nBits!484 lt!139475) lt!139822)) lt!139855)))

(declare-fun b!96799 () Bool)

(declare-fun lt!139856 () (_ BitVec 64))

(declare-fun lt!139854 () tuple2!7736)

(assert (=> b!96799 (= e!63404 (tuple2!7735 (Cons!895 (_1!4117 lt!139854) (bitStreamReadBitsIntoList!0 thiss!1534 (_2!4117 lt!139854) (bvsub (bvsub (bvsub nBits!484 lt!139475) lt!139822) lt!139856))) (_2!4117 lt!139854)))))

(assert (=> b!96799 (= lt!139854 (readBit!0 (_2!4117 lt!139820)))))

(assert (=> b!96799 (= lt!139856 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!96800 () Bool)

(assert (=> b!96800 (= e!63403 (isEmpty!266 lt!139855))))

(assert (= (and d!30334 c!6117) b!96798))

(assert (= (and d!30334 (not c!6117)) b!96799))

(assert (= (and d!30334 c!6116) b!96800))

(assert (= (and d!30334 (not c!6116)) b!96801))

(declare-fun m!140399 () Bool)

(assert (=> b!96801 m!140399))

(declare-fun m!140401 () Bool)

(assert (=> b!96799 m!140401))

(declare-fun m!140403 () Bool)

(assert (=> b!96799 m!140403))

(declare-fun m!140405 () Bool)

(assert (=> b!96800 m!140405))

(assert (=> b!96776 d!30334))

(declare-fun d!30336 () Bool)

(declare-fun e!63405 () Bool)

(assert (=> d!30336 e!63405))

(declare-fun res!79475 () Bool)

(assert (=> d!30336 (=> (not res!79475) (not e!63405))))

(assert (=> d!30336 (= res!79475 (= (buf!2402 (_2!4125 (increaseBitIndex!0 (_2!4117 lt!139473)))) (buf!2402 (_2!4117 lt!139473))))))

(declare-fun lt!139859 () Bool)

(assert (=> d!30336 (= lt!139859 (not (= (bvand ((_ sign_extend 24) (select (arr!2649 (buf!2402 (_2!4117 lt!139473))) (currentByte!4790 (_2!4117 lt!139473)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!4785 (_2!4117 lt!139473))))) #b00000000000000000000000000000000)))))

(declare-fun lt!139863 () tuple2!7736)

(assert (=> d!30336 (= lt!139863 (tuple2!7737 (not (= (bvand ((_ sign_extend 24) (select (arr!2649 (buf!2402 (_2!4117 lt!139473))) (currentByte!4790 (_2!4117 lt!139473)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!4785 (_2!4117 lt!139473))))) #b00000000000000000000000000000000)) (_2!4125 (increaseBitIndex!0 (_2!4117 lt!139473)))))))

(assert (=> d!30336 (validate_offset_bit!0 ((_ sign_extend 32) (size!2053 (buf!2402 (_2!4117 lt!139473)))) ((_ sign_extend 32) (currentByte!4790 (_2!4117 lt!139473))) ((_ sign_extend 32) (currentBit!4785 (_2!4117 lt!139473))))))

(assert (=> d!30336 (= (readBit!0 (_2!4117 lt!139473)) lt!139863)))

(declare-fun lt!139857 () (_ BitVec 64))

(declare-fun lt!139862 () (_ BitVec 64))

(declare-fun b!96802 () Bool)

(assert (=> b!96802 (= e!63405 (= (bitIndex!0 (size!2053 (buf!2402 (_2!4125 (increaseBitIndex!0 (_2!4117 lt!139473))))) (currentByte!4790 (_2!4125 (increaseBitIndex!0 (_2!4117 lt!139473)))) (currentBit!4785 (_2!4125 (increaseBitIndex!0 (_2!4117 lt!139473))))) (bvadd lt!139857 lt!139862)))))

(assert (=> b!96802 (or (not (= (bvand lt!139857 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!139862 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!139857 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!139857 lt!139862) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!96802 (= lt!139862 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!96802 (= lt!139857 (bitIndex!0 (size!2053 (buf!2402 (_2!4117 lt!139473))) (currentByte!4790 (_2!4117 lt!139473)) (currentBit!4785 (_2!4117 lt!139473))))))

(declare-fun lt!139860 () Bool)

(assert (=> b!96802 (= lt!139860 (not (= (bvand ((_ sign_extend 24) (select (arr!2649 (buf!2402 (_2!4117 lt!139473))) (currentByte!4790 (_2!4117 lt!139473)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!4785 (_2!4117 lt!139473))))) #b00000000000000000000000000000000)))))

(declare-fun lt!139858 () Bool)

(assert (=> b!96802 (= lt!139858 (not (= (bvand ((_ sign_extend 24) (select (arr!2649 (buf!2402 (_2!4117 lt!139473))) (currentByte!4790 (_2!4117 lt!139473)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!4785 (_2!4117 lt!139473))))) #b00000000000000000000000000000000)))))

(declare-fun lt!139861 () Bool)

(assert (=> b!96802 (= lt!139861 (not (= (bvand ((_ sign_extend 24) (select (arr!2649 (buf!2402 (_2!4117 lt!139473))) (currentByte!4790 (_2!4117 lt!139473)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!4785 (_2!4117 lt!139473))))) #b00000000000000000000000000000000)))))

(assert (= (and d!30336 res!79475) b!96802))

(declare-fun m!140407 () Bool)

(assert (=> d!30336 m!140407))

(declare-fun m!140409 () Bool)

(assert (=> d!30336 m!140409))

(declare-fun m!140411 () Bool)

(assert (=> d!30336 m!140411))

(declare-fun m!140413 () Bool)

(assert (=> d!30336 m!140413))

(assert (=> b!96802 m!140411))

(declare-fun m!140415 () Bool)

(assert (=> b!96802 m!140415))

(assert (=> b!96802 m!140407))

(declare-fun m!140417 () Bool)

(assert (=> b!96802 m!140417))

(assert (=> b!96802 m!140409))

(assert (=> b!96776 d!30336))

(declare-fun d!30338 () Bool)

(declare-fun lt!139864 () Int)

(assert (=> d!30338 (>= lt!139864 0)))

(declare-fun e!63406 () Int)

(assert (=> d!30338 (= lt!139864 e!63406)))

(declare-fun c!6118 () Bool)

(assert (=> d!30338 (= c!6118 (is-Nil!896 (t!1649 listBits!13)))))

(assert (=> d!30338 (= (size!2057 (t!1649 listBits!13)) lt!139864)))

(declare-fun b!96803 () Bool)

(assert (=> b!96803 (= e!63406 0)))

(declare-fun b!96804 () Bool)

(assert (=> b!96804 (= e!63406 (+ 1 (size!2057 (t!1649 (t!1649 listBits!13)))))))

(assert (= (and d!30338 c!6118) b!96803))

(assert (= (and d!30338 (not c!6118)) b!96804))

(declare-fun m!140419 () Bool)

(assert (=> b!96804 m!140419))

(assert (=> b!96766 d!30338))

(declare-fun d!30340 () Bool)

(assert (=> d!30340 (= (isEmpty!266 lt!139781) (is-Nil!896 lt!139781))))

(assert (=> b!96749 d!30340))

(declare-fun d!30342 () Bool)

(assert (=> d!30342 (= (length!490 lt!139821) (size!2057 lt!139821))))

(declare-fun bs!7408 () Bool)

(assert (= bs!7408 d!30342))

(declare-fun m!140421 () Bool)

(assert (=> bs!7408 m!140421))

(assert (=> b!96778 d!30342))

(declare-fun d!30344 () Bool)

(assert (=> d!30344 (= (length!490 lt!139781) (size!2057 lt!139781))))

(declare-fun bs!7409 () Bool)

(assert (= bs!7409 d!30344))

(declare-fun m!140423 () Bool)

(assert (=> bs!7409 m!140423))

(assert (=> b!96750 d!30344))

(declare-fun d!30346 () Bool)

(assert (=> d!30346 (= (isEmpty!266 lt!139821) (is-Nil!896 lt!139821))))

(assert (=> b!96777 d!30346))

(declare-fun d!30348 () Bool)

(declare-fun res!79476 () Bool)

(declare-fun e!63407 () Bool)

(assert (=> d!30348 (=> res!79476 e!63407)))

(assert (=> d!30348 (= res!79476 (= (_1!4124 lt!139777) (_2!4124 lt!139777)))))

(assert (=> d!30348 (= (arrayRangesEq!31 (buf!2402 bitStream2!8) (buf!2402 base!8) (_1!4124 lt!139777) (_2!4124 lt!139777)) e!63407)))

(declare-fun b!96805 () Bool)

(declare-fun e!63408 () Bool)

(assert (=> b!96805 (= e!63407 e!63408)))

(declare-fun res!79477 () Bool)

(assert (=> b!96805 (=> (not res!79477) (not e!63408))))

(assert (=> b!96805 (= res!79477 (= (select (arr!2649 (buf!2402 bitStream2!8)) (_1!4124 lt!139777)) (select (arr!2649 (buf!2402 base!8)) (_1!4124 lt!139777))))))

(declare-fun b!96806 () Bool)

(assert (=> b!96806 (= e!63408 (arrayRangesEq!31 (buf!2402 bitStream2!8) (buf!2402 base!8) (bvadd (_1!4124 lt!139777) #b00000000000000000000000000000001) (_2!4124 lt!139777)))))

(assert (= (and d!30348 (not res!79476)) b!96805))

(assert (= (and b!96805 res!79477) b!96806))

(declare-fun m!140425 () Bool)

(assert (=> b!96805 m!140425))

(declare-fun m!140427 () Bool)

(assert (=> b!96805 m!140427))

(declare-fun m!140429 () Bool)

(assert (=> b!96806 m!140429))

(assert (=> b!96744 d!30348))

(declare-fun d!30350 () Bool)

(assert (=> d!30350 (= (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2053 (buf!2402 bitStream1!8)) (currentByte!4790 bitStream1!8) (currentBit!4785 bitStream1!8))) (tuple4!61 ((_ extract 31 0) (bvadd (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!2053 (buf!2402 bitStream1!8)) (currentByte!4790 bitStream1!8) (currentBit!4785 bitStream1!8)) #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!2053 (buf!2402 bitStream1!8)) (currentByte!4790 bitStream1!8) (currentBit!4785 bitStream1!8)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!96755 d!30350))

(declare-fun d!30352 () Bool)

(assert (=> d!30352 (= (byteRangesEq!0 (ite c!6107 (select (arr!2649 (buf!2402 bitStream1!8)) (_3!251 lt!139804)) (select (arr!2649 (buf!2402 bitStream1!8)) (_4!30 lt!139804))) (ite c!6107 (select (arr!2649 (buf!2402 bitStream2!8)) (_3!251 lt!139804)) (select (arr!2649 (buf!2402 bitStream2!8)) (_4!30 lt!139804))) (ite c!6107 lt!139805 #b00000000000000000000000000000000) lt!139806) (or (= (ite c!6107 lt!139805 #b00000000000000000000000000000000) lt!139806) (= (bvand (bvand (bvand ((_ sign_extend 24) (ite c!6107 (select (arr!2649 (buf!2402 bitStream1!8)) (_3!251 lt!139804)) (select (arr!2649 (buf!2402 bitStream1!8)) (_4!30 lt!139804)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!139806))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!6107 lt!139805 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (ite c!6107 (select (arr!2649 (buf!2402 bitStream2!8)) (_3!251 lt!139804)) (select (arr!2649 (buf!2402 bitStream2!8)) (_4!30 lt!139804)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!139806))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!6107 lt!139805 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111))))))

(declare-fun bs!7410 () Bool)

(assert (= bs!7410 d!30352))

(declare-fun m!140431 () Bool)

(assert (=> bs!7410 m!140431))

(declare-fun m!140433 () Bool)

(assert (=> bs!7410 m!140433))

(assert (=> bm!1180 d!30352))

(assert (=> d!30304 d!30332))

(declare-fun d!30354 () Bool)

(assert (=> d!30354 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!2053 (buf!2402 bitStream1!8))) ((_ sign_extend 32) (currentByte!4790 bitStream1!8)) ((_ sign_extend 32) (currentBit!4785 bitStream1!8))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2053 (buf!2402 bitStream1!8))) ((_ sign_extend 32) (currentByte!4790 bitStream1!8)) ((_ sign_extend 32) (currentBit!4785 bitStream1!8))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!7411 () Bool)

(assert (= bs!7411 d!30354))

(assert (=> bs!7411 m!139855))

(assert (=> d!30304 d!30354))

(declare-fun d!30356 () Bool)

(assert (=> d!30356 (= (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2053 (buf!2402 bitStream2!8)) (currentByte!4790 bitStream2!8) (currentBit!4785 bitStream2!8))) (tuple4!61 ((_ extract 31 0) (bvadd (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!2053 (buf!2402 bitStream2!8)) (currentByte!4790 bitStream2!8) (currentBit!4785 bitStream2!8)) #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!2053 (buf!2402 bitStream2!8)) (currentByte!4790 bitStream2!8) (currentBit!4785 bitStream2!8)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!96741 d!30356))

(declare-fun d!30358 () Bool)

(declare-fun res!79478 () Bool)

(declare-fun e!63409 () Bool)

(assert (=> d!30358 (=> res!79478 e!63409)))

(assert (=> d!30358 (= res!79478 (= (_1!4124 lt!139804) (_2!4124 lt!139804)))))

(assert (=> d!30358 (= (arrayRangesEq!31 (buf!2402 bitStream1!8) (buf!2402 bitStream2!8) (_1!4124 lt!139804) (_2!4124 lt!139804)) e!63409)))

(declare-fun b!96807 () Bool)

(declare-fun e!63410 () Bool)

(assert (=> b!96807 (= e!63409 e!63410)))

(declare-fun res!79479 () Bool)

(assert (=> b!96807 (=> (not res!79479) (not e!63410))))

(assert (=> b!96807 (= res!79479 (= (select (arr!2649 (buf!2402 bitStream1!8)) (_1!4124 lt!139804)) (select (arr!2649 (buf!2402 bitStream2!8)) (_1!4124 lt!139804))))))

(declare-fun b!96808 () Bool)

(assert (=> b!96808 (= e!63410 (arrayRangesEq!31 (buf!2402 bitStream1!8) (buf!2402 bitStream2!8) (bvadd (_1!4124 lt!139804) #b00000000000000000000000000000001) (_2!4124 lt!139804)))))

(assert (= (and d!30358 (not res!79478)) b!96807))

(assert (= (and b!96807 res!79479) b!96808))

(declare-fun m!140435 () Bool)

(assert (=> b!96807 m!140435))

(declare-fun m!140437 () Bool)

(assert (=> b!96807 m!140437))

(declare-fun m!140439 () Bool)

(assert (=> b!96808 m!140439))

(assert (=> b!96758 d!30358))

(declare-fun d!30360 () Bool)

(assert (=> d!30360 (= (byteRangesEq!0 (select (arr!2649 (buf!2402 bitStream2!8)) (_3!251 lt!139777)) (select (arr!2649 (buf!2402 base!8)) (_3!251 lt!139777)) lt!139778 #b00000000000000000000000000001000) (or (= lt!139778 #b00000000000000000000000000001000) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!2649 (buf!2402 bitStream2!8)) (_3!251 lt!139777))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!139778)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!2649 (buf!2402 base!8)) (_3!251 lt!139777))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!139778)))) #b00000000000000000000000011111111))))))

(declare-fun bs!7412 () Bool)

(assert (= bs!7412 d!30360))

(assert (=> bs!7412 m!140383))

(declare-fun m!140441 () Bool)

(assert (=> bs!7412 m!140441))

(assert (=> b!96746 d!30360))

(declare-fun d!30362 () Bool)

(assert (=> d!30362 (= (byteRangesEq!0 (select (arr!2649 (buf!2402 bitStream1!8)) (_3!251 lt!139804)) (select (arr!2649 (buf!2402 bitStream2!8)) (_3!251 lt!139804)) lt!139805 #b00000000000000000000000000001000) (or (= lt!139805 #b00000000000000000000000000001000) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!2649 (buf!2402 bitStream1!8)) (_3!251 lt!139804))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!139805)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!2649 (buf!2402 bitStream2!8)) (_3!251 lt!139804))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!139805)))) #b00000000000000000000000011111111))))))

(declare-fun bs!7413 () Bool)

(assert (= bs!7413 d!30362))

(assert (=> bs!7413 m!140383))

(declare-fun m!140443 () Bool)

(assert (=> bs!7413 m!140443))

(assert (=> b!96760 d!30362))

(declare-fun d!30364 () Bool)

(declare-fun e!63411 () Bool)

(assert (=> d!30364 e!63411))

(declare-fun res!79481 () Bool)

(assert (=> d!30364 (=> (not res!79481) (not e!63411))))

(declare-fun lt!139866 () (_ BitVec 64))

(declare-fun lt!139870 () (_ BitVec 64))

(declare-fun lt!139865 () (_ BitVec 64))

(assert (=> d!30364 (= res!79481 (= lt!139866 (bvsub lt!139870 lt!139865)))))

(assert (=> d!30364 (or (= (bvand lt!139870 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!139865 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!139870 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!139870 lt!139865) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!30364 (= lt!139865 (remainingBits!0 ((_ sign_extend 32) (size!2053 (buf!2402 (_2!4125 (increaseBitIndex!0 bitStream2!8))))) ((_ sign_extend 32) (currentByte!4790 (_2!4125 (increaseBitIndex!0 bitStream2!8)))) ((_ sign_extend 32) (currentBit!4785 (_2!4125 (increaseBitIndex!0 bitStream2!8))))))))

(declare-fun lt!139868 () (_ BitVec 64))

(declare-fun lt!139867 () (_ BitVec 64))

(assert (=> d!30364 (= lt!139870 (bvmul lt!139868 lt!139867))))

(assert (=> d!30364 (or (= lt!139868 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!139867 (bvsdiv (bvmul lt!139868 lt!139867) lt!139868)))))

(assert (=> d!30364 (= lt!139867 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!30364 (= lt!139868 ((_ sign_extend 32) (size!2053 (buf!2402 (_2!4125 (increaseBitIndex!0 bitStream2!8))))))))

(assert (=> d!30364 (= lt!139866 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4790 (_2!4125 (increaseBitIndex!0 bitStream2!8)))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4785 (_2!4125 (increaseBitIndex!0 bitStream2!8))))))))

(assert (=> d!30364 (invariant!0 (currentBit!4785 (_2!4125 (increaseBitIndex!0 bitStream2!8))) (currentByte!4790 (_2!4125 (increaseBitIndex!0 bitStream2!8))) (size!2053 (buf!2402 (_2!4125 (increaseBitIndex!0 bitStream2!8)))))))

(assert (=> d!30364 (= (bitIndex!0 (size!2053 (buf!2402 (_2!4125 (increaseBitIndex!0 bitStream2!8)))) (currentByte!4790 (_2!4125 (increaseBitIndex!0 bitStream2!8))) (currentBit!4785 (_2!4125 (increaseBitIndex!0 bitStream2!8)))) lt!139866)))

(declare-fun b!96809 () Bool)

(declare-fun res!79480 () Bool)

(assert (=> b!96809 (=> (not res!79480) (not e!63411))))

(assert (=> b!96809 (= res!79480 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!139866))))

(declare-fun b!96810 () Bool)

(declare-fun lt!139869 () (_ BitVec 64))

(assert (=> b!96810 (= e!63411 (bvsle lt!139866 (bvmul lt!139869 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!96810 (or (= lt!139869 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!139869 #b0000000000000000000000000000000000000000000000000000000000001000) lt!139869)))))

(assert (=> b!96810 (= lt!139869 ((_ sign_extend 32) (size!2053 (buf!2402 (_2!4125 (increaseBitIndex!0 bitStream2!8))))))))

(assert (= (and d!30364 res!79481) b!96809))

(assert (= (and b!96809 res!79480) b!96810))

(declare-fun m!140445 () Bool)

(assert (=> d!30364 m!140445))

(declare-fun m!140447 () Bool)

(assert (=> d!30364 m!140447))

(assert (=> b!96753 d!30364))

(declare-fun d!30366 () Bool)

(declare-fun e!63412 () Bool)

(assert (=> d!30366 e!63412))

(declare-fun res!79482 () Bool)

(assert (=> d!30366 (=> (not res!79482) (not e!63412))))

(declare-fun lt!139872 () (_ BitVec 64))

(declare-fun lt!139875 () tuple2!7746)

(declare-fun lt!139871 () (_ BitVec 64))

(assert (=> d!30366 (= res!79482 (= (bvadd lt!139871 lt!139872) (bitIndex!0 (size!2053 (buf!2402 (_2!4125 lt!139875))) (currentByte!4790 (_2!4125 lt!139875)) (currentBit!4785 (_2!4125 lt!139875)))))))

(assert (=> d!30366 (or (not (= (bvand lt!139871 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!139872 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!139871 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!139871 lt!139872) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!30366 (= lt!139872 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!30366 (= lt!139871 (bitIndex!0 (size!2053 (buf!2402 bitStream2!8)) (currentByte!4790 bitStream2!8) (currentBit!4785 bitStream2!8)))))

(declare-fun Unit!5868 () Unit!5864)

(declare-fun Unit!5869 () Unit!5864)

(assert (=> d!30366 (= lt!139875 (ite (bvslt (currentBit!4785 bitStream2!8) #b00000000000000000000000000000111) (tuple2!7747 Unit!5868 (BitStream!3587 (buf!2402 bitStream2!8) (currentByte!4790 bitStream2!8) (bvadd (currentBit!4785 bitStream2!8) #b00000000000000000000000000000001))) (tuple2!7747 Unit!5869 (BitStream!3587 (buf!2402 bitStream2!8) (bvadd (currentByte!4790 bitStream2!8) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (=> d!30366 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!2053 (buf!2402 bitStream2!8))) ((_ sign_extend 32) (currentByte!4790 bitStream2!8)) ((_ sign_extend 32) (currentBit!4785 bitStream2!8))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!30366 (= (increaseBitIndex!0 bitStream2!8) lt!139875)))

(declare-fun b!96811 () Bool)

(declare-fun res!79483 () Bool)

(assert (=> b!96811 (=> (not res!79483) (not e!63412))))

(declare-fun lt!139873 () (_ BitVec 64))

(declare-fun lt!139874 () (_ BitVec 64))

(assert (=> b!96811 (= res!79483 (= (bvsub lt!139873 lt!139874) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!96811 (or (= (bvand lt!139873 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!139874 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!139873 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!139873 lt!139874) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!96811 (= lt!139874 (remainingBits!0 ((_ sign_extend 32) (size!2053 (buf!2402 (_2!4125 lt!139875)))) ((_ sign_extend 32) (currentByte!4790 (_2!4125 lt!139875))) ((_ sign_extend 32) (currentBit!4785 (_2!4125 lt!139875)))))))

(assert (=> b!96811 (= lt!139873 (remainingBits!0 ((_ sign_extend 32) (size!2053 (buf!2402 bitStream2!8))) ((_ sign_extend 32) (currentByte!4790 bitStream2!8)) ((_ sign_extend 32) (currentBit!4785 bitStream2!8))))))

(declare-fun b!96812 () Bool)

(assert (=> b!96812 (= e!63412 (= (size!2053 (buf!2402 bitStream2!8)) (size!2053 (buf!2402 (_2!4125 lt!139875)))))))

(assert (= (and d!30366 res!79482) b!96811))

(assert (= (and b!96811 res!79483) b!96812))

(declare-fun m!140449 () Bool)

(assert (=> d!30366 m!140449))

(assert (=> d!30366 m!139641))

(assert (=> d!30366 m!139821))

(declare-fun m!140451 () Bool)

(assert (=> b!96811 m!140451))

(assert (=> b!96811 m!139821))

(assert (=> b!96753 d!30366))

(assert (=> b!96753 d!30060))

(declare-fun d!30368 () Bool)

(declare-fun lt!139876 () Int)

(assert (=> d!30368 (>= lt!139876 0)))

(declare-fun e!63413 () Int)

(assert (=> d!30368 (= lt!139876 e!63413)))

(declare-fun c!6119 () Bool)

(assert (=> d!30368 (= c!6119 (is-Nil!896 lt!139471))))

(assert (=> d!30368 (= (size!2057 lt!139471) lt!139876)))

(declare-fun b!96813 () Bool)

(assert (=> b!96813 (= e!63413 0)))

(declare-fun b!96814 () Bool)

(assert (=> b!96814 (= e!63413 (+ 1 (size!2057 (t!1649 lt!139471))))))

(assert (= (and d!30368 c!6119) b!96813))

(assert (= (and d!30368 (not c!6119)) b!96814))

(declare-fun m!140453 () Bool)

(assert (=> b!96814 m!140453))

(assert (=> d!30286 d!30368))

(assert (=> d!30294 d!30366))

(declare-fun d!30370 () Bool)

(assert (=> d!30370 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!2053 (buf!2402 bitStream2!8))) ((_ sign_extend 32) (currentByte!4790 bitStream2!8)) ((_ sign_extend 32) (currentBit!4785 bitStream2!8))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2053 (buf!2402 bitStream2!8))) ((_ sign_extend 32) (currentByte!4790 bitStream2!8)) ((_ sign_extend 32) (currentBit!4785 bitStream2!8))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!7414 () Bool)

(assert (= bs!7414 d!30370))

(assert (=> bs!7414 m!139821))

(assert (=> d!30294 d!30370))

(declare-fun d!30372 () Bool)

(declare-fun lt!139877 () Int)

(assert (=> d!30372 (>= lt!139877 0)))

(declare-fun e!63414 () Int)

(assert (=> d!30372 (= lt!139877 e!63414)))

(declare-fun c!6120 () Bool)

(assert (=> d!30372 (= c!6120 (is-Nil!896 lt!139474))))

(assert (=> d!30372 (= (size!2057 lt!139474) lt!139877)))

(declare-fun b!96815 () Bool)

(assert (=> b!96815 (= e!63414 0)))

(declare-fun b!96816 () Bool)

(assert (=> b!96816 (= e!63414 (+ 1 (size!2057 (t!1649 lt!139474))))))

(assert (= (and d!30372 c!6120) b!96815))

(assert (= (and d!30372 (not c!6120)) b!96816))

(declare-fun m!140455 () Bool)

(assert (=> b!96816 m!140455))

(assert (=> d!30318 d!30372))

(declare-fun d!30374 () Bool)

(assert (=> d!30374 (= (byteRangesEq!0 (ite c!6104 (select (arr!2649 (buf!2402 bitStream2!8)) (_3!251 lt!139777)) (select (arr!2649 (buf!2402 bitStream2!8)) (_4!30 lt!139777))) (ite c!6104 (select (arr!2649 (buf!2402 base!8)) (_3!251 lt!139777)) (select (arr!2649 (buf!2402 base!8)) (_4!30 lt!139777))) (ite c!6104 lt!139778 #b00000000000000000000000000000000) lt!139779) (or (= (ite c!6104 lt!139778 #b00000000000000000000000000000000) lt!139779) (= (bvand (bvand (bvand ((_ sign_extend 24) (ite c!6104 (select (arr!2649 (buf!2402 bitStream2!8)) (_3!251 lt!139777)) (select (arr!2649 (buf!2402 bitStream2!8)) (_4!30 lt!139777)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!139779))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!6104 lt!139778 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (ite c!6104 (select (arr!2649 (buf!2402 base!8)) (_3!251 lt!139777)) (select (arr!2649 (buf!2402 base!8)) (_4!30 lt!139777)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!139779))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!6104 lt!139778 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111))))))

(declare-fun bs!7415 () Bool)

(assert (= bs!7415 d!30374))

(declare-fun m!140457 () Bool)

(assert (=> bs!7415 m!140457))

(declare-fun m!140459 () Bool)

(assert (=> bs!7415 m!140459))

(assert (=> bm!1179 d!30374))

(assert (=> b!96769 d!30350))

(push 1)

(assert (not d!30324))

(assert (not b!96808))

(assert (not d!30366))

(assert (not d!30364))

(assert (not b!96814))

(assert (not d!30344))

(assert (not b!96787))

(assert (not b!96788))

(assert (not b!96806))

(assert (not b!96804))

(assert (not b!96816))

(assert (not d!30330))

(assert (not b!96802))

(assert (not d!30354))

(assert (not b!96789))

(assert (not d!30342))

(assert (not b!96799))

(assert (not b!96796))

(assert (not b!96800))

(assert (not d!30332))

(assert (not b!96784))

(assert (not b!96801))

(assert (not d!30370))

(assert (not d!30336))

(assert (not b!96811))

(assert (not b!96786))

(check-sat)

(pop 1)

(push 1)

(check-sat)

