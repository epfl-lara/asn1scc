; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19088 () Bool)

(assert start!19088)

(declare-fun b!95360 () Bool)

(declare-fun e!62503 () Bool)

(declare-datatypes ((array!4455 0))(
  ( (array!4456 (arr!2634 (Array (_ BitVec 32) (_ BitVec 8))) (size!2032 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3556 0))(
  ( (BitStream!3557 (buf!2387 array!4455) (currentByte!4762 (_ BitVec 32)) (currentBit!4757 (_ BitVec 32))) )
))
(declare-fun bitStream2!8 () BitStream!3556)

(declare-fun array_inv!1843 (array!4455) Bool)

(assert (=> b!95360 (= e!62503 (array_inv!1843 (buf!2387 bitStream2!8)))))

(declare-fun b!95361 () Bool)

(declare-fun res!78480 () Bool)

(declare-fun e!62505 () Bool)

(assert (=> b!95361 (=> (not res!78480) (not e!62505))))

(declare-fun bitStream1!8 () BitStream!3556)

(declare-fun base!8 () BitStream!3556)

(declare-fun isPrefixOf!0 (BitStream!3556 BitStream!3556) Bool)

(assert (=> b!95361 (= res!78480 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun b!95362 () Bool)

(declare-fun e!62502 () Bool)

(assert (=> b!95362 (= e!62502 (array_inv!1843 (buf!2387 bitStream1!8)))))

(declare-fun b!95363 () Bool)

(declare-fun e!62499 () Bool)

(assert (=> b!95363 (= e!62499 (array_inv!1843 (buf!2387 base!8)))))

(declare-fun b!95364 () Bool)

(declare-fun res!78478 () Bool)

(assert (=> b!95364 (=> (not res!78478) (not e!62505))))

(assert (=> b!95364 (= res!78478 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(declare-fun b!95365 () Bool)

(declare-fun res!78482 () Bool)

(assert (=> b!95365 (=> (not res!78482) (not e!62505))))

(assert (=> b!95365 (= res!78482 (isPrefixOf!0 bitStream2!8 base!8))))

(declare-fun b!95366 () Bool)

(declare-fun res!78481 () Bool)

(assert (=> b!95366 (=> (not res!78481) (not e!62505))))

(declare-fun nBits!484 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!95366 (= res!78481 (bvslt (bitIndex!0 (size!2032 (buf!2387 base!8)) (currentByte!4762 base!8) (currentBit!4757 base!8)) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484)))))

(declare-fun res!78477 () Bool)

(assert (=> start!19088 (=> (not res!78477) (not e!62505))))

(assert (=> start!19088 (= res!78477 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!19088 e!62505))

(assert (=> start!19088 true))

(declare-fun inv!12 (BitStream!3556) Bool)

(assert (=> start!19088 (and (inv!12 bitStream1!8) e!62502)))

(assert (=> start!19088 (and (inv!12 bitStream2!8) e!62503)))

(assert (=> start!19088 (and (inv!12 base!8) e!62499)))

(declare-fun b!95367 () Bool)

(declare-fun res!78479 () Bool)

(assert (=> b!95367 (=> (not res!78479) (not e!62505))))

(declare-datatypes ((List!884 0))(
  ( (Nil!881) (Cons!880 (h!999 Bool) (t!1634 List!884)) )
))
(declare-fun listBits!13 () List!884)

(declare-fun length!475 (List!884) Int)

(assert (=> b!95367 (= res!78479 (> (length!475 listBits!13) 0))))

(declare-fun b!95368 () Bool)

(declare-fun lt!139106 () (_ BitVec 64))

(declare-fun lt!139107 () (_ BitVec 64))

(assert (=> b!95368 (= e!62505 (and (= lt!139106 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= lt!139106 (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!139107) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!95368 (= lt!139106 (bvand lt!139107 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!95368 (= lt!139107 (bitIndex!0 (size!2032 (buf!2387 bitStream1!8)) (currentByte!4762 bitStream1!8) (currentBit!4757 bitStream1!8)))))

(declare-fun b!95369 () Bool)

(declare-fun res!78483 () Bool)

(assert (=> b!95369 (=> (not res!78483) (not e!62505))))

(assert (=> b!95369 (= res!78483 (and (= (buf!2387 bitStream1!8) (buf!2387 bitStream2!8)) (= (buf!2387 bitStream1!8) (buf!2387 base!8))))))

(assert (= (and start!19088 res!78477) b!95367))

(assert (= (and b!95367 res!78479) b!95361))

(assert (= (and b!95361 res!78480) b!95365))

(assert (= (and b!95365 res!78482) b!95364))

(assert (= (and b!95364 res!78478) b!95369))

(assert (= (and b!95369 res!78483) b!95366))

(assert (= (and b!95366 res!78481) b!95368))

(assert (= start!19088 b!95362))

(assert (= start!19088 b!95360))

(assert (= start!19088 b!95363))

(declare-fun m!138785 () Bool)

(assert (=> b!95367 m!138785))

(declare-fun m!138787 () Bool)

(assert (=> b!95368 m!138787))

(declare-fun m!138789 () Bool)

(assert (=> b!95360 m!138789))

(declare-fun m!138791 () Bool)

(assert (=> b!95363 m!138791))

(declare-fun m!138793 () Bool)

(assert (=> b!95361 m!138793))

(declare-fun m!138795 () Bool)

(assert (=> b!95362 m!138795))

(declare-fun m!138797 () Bool)

(assert (=> b!95365 m!138797))

(declare-fun m!138799 () Bool)

(assert (=> start!19088 m!138799))

(declare-fun m!138801 () Bool)

(assert (=> start!19088 m!138801))

(declare-fun m!138803 () Bool)

(assert (=> start!19088 m!138803))

(declare-fun m!138805 () Bool)

(assert (=> b!95364 m!138805))

(declare-fun m!138807 () Bool)

(assert (=> b!95366 m!138807))

(push 1)

(assert (not b!95367))

(assert (not b!95363))

(assert (not b!95365))

(assert (not b!95366))

(assert (not b!95360))

(assert (not b!95362))

(assert (not b!95361))

(assert (not b!95364))

(assert (not b!95368))

(assert (not start!19088))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!29696 () Bool)

(declare-fun res!78540 () Bool)

(declare-fun e!62556 () Bool)

(assert (=> d!29696 (=> (not res!78540) (not e!62556))))

(assert (=> d!29696 (= res!78540 (= (size!2032 (buf!2387 bitStream1!8)) (size!2032 (buf!2387 bitStream2!8))))))

(assert (=> d!29696 (= (isPrefixOf!0 bitStream1!8 bitStream2!8) e!62556)))

(declare-fun b!95442 () Bool)

(declare-fun res!78538 () Bool)

(assert (=> b!95442 (=> (not res!78538) (not e!62556))))

(assert (=> b!95442 (= res!78538 (bvsle (bitIndex!0 (size!2032 (buf!2387 bitStream1!8)) (currentByte!4762 bitStream1!8) (currentBit!4757 bitStream1!8)) (bitIndex!0 (size!2032 (buf!2387 bitStream2!8)) (currentByte!4762 bitStream2!8) (currentBit!4757 bitStream2!8))))))

(declare-fun b!95443 () Bool)

(declare-fun e!62555 () Bool)

(assert (=> b!95443 (= e!62556 e!62555)))

(declare-fun res!78539 () Bool)

(assert (=> b!95443 (=> res!78539 e!62555)))

(assert (=> b!95443 (= res!78539 (= (size!2032 (buf!2387 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!95444 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4455 array!4455 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!95444 (= e!62555 (arrayBitRangesEq!0 (buf!2387 bitStream1!8) (buf!2387 bitStream2!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2032 (buf!2387 bitStream1!8)) (currentByte!4762 bitStream1!8) (currentBit!4757 bitStream1!8))))))

(assert (= (and d!29696 res!78540) b!95442))

(assert (= (and b!95442 res!78538) b!95443))

(assert (= (and b!95443 (not res!78539)) b!95444))

(assert (=> b!95442 m!138787))

(declare-fun m!138865 () Bool)

(assert (=> b!95442 m!138865))

(assert (=> b!95444 m!138787))

(assert (=> b!95444 m!138787))

(declare-fun m!138867 () Bool)

(assert (=> b!95444 m!138867))

(assert (=> b!95364 d!29696))

(declare-fun d!29700 () Bool)

(assert (=> d!29700 (= (array_inv!1843 (buf!2387 base!8)) (bvsge (size!2032 (buf!2387 base!8)) #b00000000000000000000000000000000))))

(assert (=> b!95363 d!29700))

(declare-fun d!29702 () Bool)

(declare-fun e!62572 () Bool)

(assert (=> d!29702 e!62572))

(declare-fun res!78566 () Bool)

(assert (=> d!29702 (=> (not res!78566) (not e!62572))))

(declare-fun lt!139172 () (_ BitVec 64))

(declare-fun lt!139170 () (_ BitVec 64))

(declare-fun lt!139173 () (_ BitVec 64))

(assert (=> d!29702 (= res!78566 (= lt!139172 (bvsub lt!139173 lt!139170)))))

(assert (=> d!29702 (or (= (bvand lt!139173 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!139170 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!139173 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!139173 lt!139170) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!29702 (= lt!139170 (remainingBits!0 ((_ sign_extend 32) (size!2032 (buf!2387 bitStream1!8))) ((_ sign_extend 32) (currentByte!4762 bitStream1!8)) ((_ sign_extend 32) (currentBit!4757 bitStream1!8))))))

(declare-fun lt!139171 () (_ BitVec 64))

(declare-fun lt!139169 () (_ BitVec 64))

(assert (=> d!29702 (= lt!139173 (bvmul lt!139171 lt!139169))))

(assert (=> d!29702 (or (= lt!139171 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!139169 (bvsdiv (bvmul lt!139171 lt!139169) lt!139171)))))

(assert (=> d!29702 (= lt!139169 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!29702 (= lt!139171 ((_ sign_extend 32) (size!2032 (buf!2387 bitStream1!8))))))

(assert (=> d!29702 (= lt!139172 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4762 bitStream1!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4757 bitStream1!8))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!29702 (invariant!0 (currentBit!4757 bitStream1!8) (currentByte!4762 bitStream1!8) (size!2032 (buf!2387 bitStream1!8)))))

(assert (=> d!29702 (= (bitIndex!0 (size!2032 (buf!2387 bitStream1!8)) (currentByte!4762 bitStream1!8) (currentBit!4757 bitStream1!8)) lt!139172)))

(declare-fun b!95470 () Bool)

(declare-fun res!78567 () Bool)

(assert (=> b!95470 (=> (not res!78567) (not e!62572))))

(assert (=> b!95470 (= res!78567 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!139172))))

(declare-fun b!95471 () Bool)

(declare-fun lt!139168 () (_ BitVec 64))

(assert (=> b!95471 (= e!62572 (bvsle lt!139172 (bvmul lt!139168 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!95471 (or (= lt!139168 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!139168 #b0000000000000000000000000000000000000000000000000000000000001000) lt!139168)))))

(assert (=> b!95471 (= lt!139168 ((_ sign_extend 32) (size!2032 (buf!2387 bitStream1!8))))))

(assert (= (and d!29702 res!78566) b!95470))

(assert (= (and b!95470 res!78567) b!95471))

(declare-fun m!138881 () Bool)

(assert (=> d!29702 m!138881))

(declare-fun m!138883 () Bool)

(assert (=> d!29702 m!138883))

(assert (=> b!95368 d!29702))

(declare-fun d!29716 () Bool)

(assert (=> d!29716 (= (array_inv!1843 (buf!2387 bitStream1!8)) (bvsge (size!2032 (buf!2387 bitStream1!8)) #b00000000000000000000000000000000))))

(assert (=> b!95362 d!29716))

(declare-fun d!29718 () Bool)

(declare-fun size!2036 (List!884) Int)

(assert (=> d!29718 (= (length!475 listBits!13) (size!2036 listBits!13))))

(declare-fun bs!7308 () Bool)

(assert (= bs!7308 d!29718))

(declare-fun m!138885 () Bool)

(assert (=> bs!7308 m!138885))

(assert (=> b!95367 d!29718))

(declare-fun d!29720 () Bool)

(declare-fun res!78572 () Bool)

(declare-fun e!62575 () Bool)

(assert (=> d!29720 (=> (not res!78572) (not e!62575))))

(assert (=> d!29720 (= res!78572 (= (size!2032 (buf!2387 bitStream1!8)) (size!2032 (buf!2387 base!8))))))

(assert (=> d!29720 (= (isPrefixOf!0 bitStream1!8 base!8) e!62575)))

(declare-fun b!95474 () Bool)

(declare-fun res!78570 () Bool)

(assert (=> b!95474 (=> (not res!78570) (not e!62575))))

(assert (=> b!95474 (= res!78570 (bvsle (bitIndex!0 (size!2032 (buf!2387 bitStream1!8)) (currentByte!4762 bitStream1!8) (currentBit!4757 bitStream1!8)) (bitIndex!0 (size!2032 (buf!2387 base!8)) (currentByte!4762 base!8) (currentBit!4757 base!8))))))

(declare-fun b!95475 () Bool)

(declare-fun e!62574 () Bool)

(assert (=> b!95475 (= e!62575 e!62574)))

(declare-fun res!78571 () Bool)

(assert (=> b!95475 (=> res!78571 e!62574)))

(assert (=> b!95475 (= res!78571 (= (size!2032 (buf!2387 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!95476 () Bool)

(assert (=> b!95476 (= e!62574 (arrayBitRangesEq!0 (buf!2387 bitStream1!8) (buf!2387 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2032 (buf!2387 bitStream1!8)) (currentByte!4762 bitStream1!8) (currentBit!4757 bitStream1!8))))))

(assert (= (and d!29720 res!78572) b!95474))

(assert (= (and b!95474 res!78570) b!95475))

(assert (= (and b!95475 (not res!78571)) b!95476))

(assert (=> b!95474 m!138787))

(assert (=> b!95474 m!138807))

(assert (=> b!95476 m!138787))

(assert (=> b!95476 m!138787))

(declare-fun m!138891 () Bool)

(assert (=> b!95476 m!138891))

(assert (=> b!95361 d!29720))

(declare-fun d!29724 () Bool)

(declare-fun e!62576 () Bool)

(assert (=> d!29724 e!62576))

(declare-fun res!78573 () Bool)

(assert (=> d!29724 (=> (not res!78573) (not e!62576))))

(declare-fun lt!139182 () (_ BitVec 64))

(declare-fun lt!139184 () (_ BitVec 64))

(declare-fun lt!139185 () (_ BitVec 64))

(assert (=> d!29724 (= res!78573 (= lt!139184 (bvsub lt!139185 lt!139182)))))

(assert (=> d!29724 (or (= (bvand lt!139185 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!139182 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!139185 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!139185 lt!139182) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!29724 (= lt!139182 (remainingBits!0 ((_ sign_extend 32) (size!2032 (buf!2387 base!8))) ((_ sign_extend 32) (currentByte!4762 base!8)) ((_ sign_extend 32) (currentBit!4757 base!8))))))

(declare-fun lt!139183 () (_ BitVec 64))

(declare-fun lt!139181 () (_ BitVec 64))

(assert (=> d!29724 (= lt!139185 (bvmul lt!139183 lt!139181))))

(assert (=> d!29724 (or (= lt!139183 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!139181 (bvsdiv (bvmul lt!139183 lt!139181) lt!139183)))))

(assert (=> d!29724 (= lt!139181 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!29724 (= lt!139183 ((_ sign_extend 32) (size!2032 (buf!2387 base!8))))))

(assert (=> d!29724 (= lt!139184 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4762 base!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4757 base!8))))))

(assert (=> d!29724 (invariant!0 (currentBit!4757 base!8) (currentByte!4762 base!8) (size!2032 (buf!2387 base!8)))))

(assert (=> d!29724 (= (bitIndex!0 (size!2032 (buf!2387 base!8)) (currentByte!4762 base!8) (currentBit!4757 base!8)) lt!139184)))

(declare-fun b!95477 () Bool)

(declare-fun res!78574 () Bool)

(assert (=> b!95477 (=> (not res!78574) (not e!62576))))

(assert (=> b!95477 (= res!78574 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!139184))))

(declare-fun b!95478 () Bool)

(declare-fun lt!139180 () (_ BitVec 64))

(assert (=> b!95478 (= e!62576 (bvsle lt!139184 (bvmul lt!139180 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!95478 (or (= lt!139180 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!139180 #b0000000000000000000000000000000000000000000000000000000000001000) lt!139180)))))

(assert (=> b!95478 (= lt!139180 ((_ sign_extend 32) (size!2032 (buf!2387 base!8))))))

(assert (= (and d!29724 res!78573) b!95477))

(assert (= (and b!95477 res!78574) b!95478))

(declare-fun m!138893 () Bool)

(assert (=> d!29724 m!138893))

(declare-fun m!138895 () Bool)

(assert (=> d!29724 m!138895))

(assert (=> b!95366 d!29724))

(declare-fun d!29730 () Bool)

(assert (=> d!29730 (= (inv!12 bitStream1!8) (invariant!0 (currentBit!4757 bitStream1!8) (currentByte!4762 bitStream1!8) (size!2032 (buf!2387 bitStream1!8))))))

(declare-fun bs!7309 () Bool)

(assert (= bs!7309 d!29730))

(assert (=> bs!7309 m!138883))

(assert (=> start!19088 d!29730))

(declare-fun d!29732 () Bool)

(assert (=> d!29732 (= (inv!12 bitStream2!8) (invariant!0 (currentBit!4757 bitStream2!8) (currentByte!4762 bitStream2!8) (size!2032 (buf!2387 bitStream2!8))))))

(declare-fun bs!7310 () Bool)

(assert (= bs!7310 d!29732))

(declare-fun m!138897 () Bool)

(assert (=> bs!7310 m!138897))

(assert (=> start!19088 d!29732))

(declare-fun d!29734 () Bool)

(assert (=> d!29734 (= (inv!12 base!8) (invariant!0 (currentBit!4757 base!8) (currentByte!4762 base!8) (size!2032 (buf!2387 base!8))))))

(declare-fun bs!7311 () Bool)

(assert (= bs!7311 d!29734))

(assert (=> bs!7311 m!138895))

(assert (=> start!19088 d!29734))

(declare-fun d!29736 () Bool)

(assert (=> d!29736 (= (array_inv!1843 (buf!2387 bitStream2!8)) (bvsge (size!2032 (buf!2387 bitStream2!8)) #b00000000000000000000000000000000))))

(assert (=> b!95360 d!29736))

(declare-fun d!29738 () Bool)

(declare-fun res!78577 () Bool)

(declare-fun e!62578 () Bool)

(assert (=> d!29738 (=> (not res!78577) (not e!62578))))

(assert (=> d!29738 (= res!78577 (= (size!2032 (buf!2387 bitStream2!8)) (size!2032 (buf!2387 base!8))))))

(assert (=> d!29738 (= (isPrefixOf!0 bitStream2!8 base!8) e!62578)))

(declare-fun b!95479 () Bool)

(declare-fun res!78575 () Bool)

(assert (=> b!95479 (=> (not res!78575) (not e!62578))))

(assert (=> b!95479 (= res!78575 (bvsle (bitIndex!0 (size!2032 (buf!2387 bitStream2!8)) (currentByte!4762 bitStream2!8) (currentBit!4757 bitStream2!8)) (bitIndex!0 (size!2032 (buf!2387 base!8)) (currentByte!4762 base!8) (currentBit!4757 base!8))))))

(declare-fun b!95480 () Bool)

(declare-fun e!62577 () Bool)

(assert (=> b!95480 (= e!62578 e!62577)))

(declare-fun res!78576 () Bool)

(assert (=> b!95480 (=> res!78576 e!62577)))

(assert (=> b!95480 (= res!78576 (= (size!2032 (buf!2387 bitStream2!8)) #b00000000000000000000000000000000))))

(declare-fun b!95481 () Bool)

(assert (=> b!95481 (= e!62577 (arrayBitRangesEq!0 (buf!2387 bitStream2!8) (buf!2387 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2032 (buf!2387 bitStream2!8)) (currentByte!4762 bitStream2!8) (currentBit!4757 bitStream2!8))))))

(assert (= (and d!29738 res!78577) b!95479))

(assert (= (and b!95479 res!78575) b!95480))

(assert (= (and b!95480 (not res!78576)) b!95481))

(assert (=> b!95479 m!138865))

(assert (=> b!95479 m!138807))

(assert (=> b!95481 m!138865))

(assert (=> b!95481 m!138865))

(declare-fun m!138899 () Bool)

(assert (=> b!95481 m!138899))

(assert (=> b!95365 d!29738))

(push 1)

(assert (not b!95479))

(assert (not d!29732))

(assert (not d!29718))

(assert (not d!29734))

(assert (not d!29730))

(assert (not d!29724))

(assert (not b!95474))

(assert (not d!29702))

(assert (not b!95481))

(assert (not b!95476))

(assert (not b!95444))

(assert (not b!95442))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

