; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14358 () Bool)

(assert start!14358)

(declare-datatypes ((array!3046 0))(
  ( (array!3047 (arr!2018 (Array (_ BitVec 32) (_ BitVec 8))) (size!1424 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!3046)

(declare-datatypes ((BitStream!2422 0))(
  ( (BitStream!2423 (buf!1805 array!3046) (currentByte!3549 (_ BitVec 32)) (currentBit!3544 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2422)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun e!48741 () Bool)

(declare-fun b!74489 () Bool)

(declare-datatypes ((tuple2!6438 0))(
  ( (tuple2!6439 (_1!3333 array!3046) (_2!3333 BitStream!2422)) )
))
(declare-fun lt!119761 () tuple2!6438)

(declare-fun checkByteArrayBitContent!0 (BitStream!2422 array!3046 array!3046 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!74489 (= e!48741 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3333 lt!119761) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)))))

(declare-fun b!74490 () Bool)

(declare-fun e!48746 () Bool)

(assert (=> b!74490 (= e!48746 e!48741)))

(declare-fun res!61571 () Bool)

(assert (=> b!74490 (=> res!61571 e!48741)))

(assert (=> b!74490 (= res!61571 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun readBits!0 (BitStream!2422 (_ BitVec 64)) tuple2!6438)

(declare-datatypes ((tuple2!6440 0))(
  ( (tuple2!6441 (_1!3334 BitStream!2422) (_2!3334 BitStream!2422)) )
))
(declare-fun reader!0 (BitStream!2422 BitStream!2422) tuple2!6440)

(assert (=> b!74490 (= lt!119761 (readBits!0 (_1!3334 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!74491 () Bool)

(declare-fun res!61575 () Bool)

(declare-fun e!48742 () Bool)

(assert (=> b!74491 (=> (not res!61575) (not e!48742))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!74491 (= res!61575 (validate_offset_bits!1 ((_ sign_extend 32) (size!1424 (buf!1805 thiss!1379))) ((_ sign_extend 32) (currentByte!3549 thiss!1379)) ((_ sign_extend 32) (currentBit!3544 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!61572 () Bool)

(assert (=> start!14358 (=> (not res!61572) (not e!48742))))

(assert (=> start!14358 (= res!61572 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1424 srcBuffer!2))))))))

(assert (=> start!14358 e!48742))

(assert (=> start!14358 true))

(declare-fun array_inv!1270 (array!3046) Bool)

(assert (=> start!14358 (array_inv!1270 srcBuffer!2)))

(declare-fun e!48744 () Bool)

(declare-fun inv!12 (BitStream!2422) Bool)

(assert (=> start!14358 (and (inv!12 thiss!1379) e!48744)))

(declare-fun b!74492 () Bool)

(assert (=> b!74492 (= e!48742 (not e!48746))))

(declare-fun res!61573 () Bool)

(assert (=> b!74492 (=> res!61573 e!48746)))

(declare-fun lt!119759 () (_ BitVec 64))

(assert (=> b!74492 (= res!61573 (or (bvslt i!635 to!314) (not (= lt!119759 (bvsub (bvadd lt!119759 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!2422 BitStream!2422) Bool)

(assert (=> b!74492 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!4925 0))(
  ( (Unit!4926) )
))
(declare-fun lt!119760 () Unit!4925)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2422) Unit!4925)

(assert (=> b!74492 (= lt!119760 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!74492 (= lt!119759 (bitIndex!0 (size!1424 (buf!1805 thiss!1379)) (currentByte!3549 thiss!1379) (currentBit!3544 thiss!1379)))))

(declare-fun b!74493 () Bool)

(declare-fun res!61574 () Bool)

(assert (=> b!74493 (=> res!61574 e!48746)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!74493 (= res!61574 (not (invariant!0 (currentBit!3544 thiss!1379) (currentByte!3549 thiss!1379) (size!1424 (buf!1805 thiss!1379)))))))

(declare-fun b!74494 () Bool)

(assert (=> b!74494 (= e!48744 (array_inv!1270 (buf!1805 thiss!1379)))))

(assert (= (and start!14358 res!61572) b!74491))

(assert (= (and b!74491 res!61575) b!74492))

(assert (= (and b!74492 (not res!61573)) b!74493))

(assert (= (and b!74493 (not res!61574)) b!74490))

(assert (= (and b!74490 (not res!61571)) b!74489))

(assert (= start!14358 b!74494))

(declare-fun m!119479 () Bool)

(assert (=> b!74490 m!119479))

(declare-fun m!119481 () Bool)

(assert (=> b!74490 m!119481))

(declare-fun m!119483 () Bool)

(assert (=> b!74493 m!119483))

(declare-fun m!119485 () Bool)

(assert (=> b!74492 m!119485))

(declare-fun m!119487 () Bool)

(assert (=> b!74492 m!119487))

(declare-fun m!119489 () Bool)

(assert (=> b!74492 m!119489))

(declare-fun m!119491 () Bool)

(assert (=> b!74489 m!119491))

(declare-fun m!119493 () Bool)

(assert (=> start!14358 m!119493))

(declare-fun m!119495 () Bool)

(assert (=> start!14358 m!119495))

(declare-fun m!119497 () Bool)

(assert (=> b!74491 m!119497))

(declare-fun m!119499 () Bool)

(assert (=> b!74494 m!119499))

(push 1)

(assert (not b!74491))

(assert (not b!74493))

(assert (not b!74494))

(assert (not b!74492))

(assert (not start!14358))

(assert (not b!74490))

(assert (not b!74489))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!23658 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!23658 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1424 (buf!1805 thiss!1379))) ((_ sign_extend 32) (currentByte!3549 thiss!1379)) ((_ sign_extend 32) (currentBit!3544 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1424 (buf!1805 thiss!1379))) ((_ sign_extend 32) (currentByte!3549 thiss!1379)) ((_ sign_extend 32) (currentBit!3544 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5699 () Bool)

(assert (= bs!5699 d!23658))

(declare-fun m!119549 () Bool)

(assert (=> bs!5699 m!119549))

(assert (=> b!74491 d!23658))

(declare-fun d!23660 () Bool)

(declare-fun res!61628 () Bool)

(declare-fun e!48796 () Bool)

(assert (=> d!23660 (=> (not res!61628) (not e!48796))))

(assert (=> d!23660 (= res!61628 (= (size!1424 (buf!1805 thiss!1379)) (size!1424 (buf!1805 thiss!1379))))))

(assert (=> d!23660 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!48796)))

(declare-fun b!74552 () Bool)

(declare-fun res!61627 () Bool)

(assert (=> b!74552 (=> (not res!61627) (not e!48796))))

(assert (=> b!74552 (= res!61627 (bvsle (bitIndex!0 (size!1424 (buf!1805 thiss!1379)) (currentByte!3549 thiss!1379) (currentBit!3544 thiss!1379)) (bitIndex!0 (size!1424 (buf!1805 thiss!1379)) (currentByte!3549 thiss!1379) (currentBit!3544 thiss!1379))))))

(declare-fun b!74553 () Bool)

(declare-fun e!48797 () Bool)

(assert (=> b!74553 (= e!48796 e!48797)))

(declare-fun res!61629 () Bool)

(assert (=> b!74553 (=> res!61629 e!48797)))

(assert (=> b!74553 (= res!61629 (= (size!1424 (buf!1805 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!74554 () Bool)

(declare-fun arrayBitRangesEq!0 (array!3046 array!3046 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!74554 (= e!48797 (arrayBitRangesEq!0 (buf!1805 thiss!1379) (buf!1805 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1424 (buf!1805 thiss!1379)) (currentByte!3549 thiss!1379) (currentBit!3544 thiss!1379))))))

(assert (= (and d!23660 res!61628) b!74552))

(assert (= (and b!74552 res!61627) b!74553))

(assert (= (and b!74553 (not res!61629)) b!74554))

(assert (=> b!74552 m!119489))

(assert (=> b!74552 m!119489))

(assert (=> b!74554 m!119489))

(assert (=> b!74554 m!119489))

(declare-fun m!119553 () Bool)

(assert (=> b!74554 m!119553))

(assert (=> b!74492 d!23660))

(declare-fun d!23666 () Bool)

(assert (=> d!23666 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!119803 () Unit!4925)

(declare-fun choose!11 (BitStream!2422) Unit!4925)

(assert (=> d!23666 (= lt!119803 (choose!11 thiss!1379))))

(assert (=> d!23666 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!119803)))

(declare-fun bs!5701 () Bool)

(assert (= bs!5701 d!23666))

(assert (=> bs!5701 m!119485))

(declare-fun m!119555 () Bool)

(assert (=> bs!5701 m!119555))

(assert (=> b!74492 d!23666))

(declare-fun d!23668 () Bool)

(declare-fun e!48818 () Bool)

(assert (=> d!23668 e!48818))

(declare-fun res!61656 () Bool)

(assert (=> d!23668 (=> (not res!61656) (not e!48818))))

(declare-fun lt!119820 () (_ BitVec 64))

(declare-fun lt!119816 () (_ BitVec 64))

(declare-fun lt!119817 () (_ BitVec 64))

(assert (=> d!23668 (= res!61656 (= lt!119817 (bvsub lt!119820 lt!119816)))))

(assert (=> d!23668 (or (= (bvand lt!119820 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!119816 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!119820 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!119820 lt!119816) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!23668 (= lt!119816 (remainingBits!0 ((_ sign_extend 32) (size!1424 (buf!1805 thiss!1379))) ((_ sign_extend 32) (currentByte!3549 thiss!1379)) ((_ sign_extend 32) (currentBit!3544 thiss!1379))))))

(declare-fun lt!119819 () (_ BitVec 64))

(declare-fun lt!119818 () (_ BitVec 64))

(assert (=> d!23668 (= lt!119820 (bvmul lt!119819 lt!119818))))

(assert (=> d!23668 (or (= lt!119819 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!119818 (bvsdiv (bvmul lt!119819 lt!119818) lt!119819)))))

(assert (=> d!23668 (= lt!119818 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!23668 (= lt!119819 ((_ sign_extend 32) (size!1424 (buf!1805 thiss!1379))))))

(assert (=> d!23668 (= lt!119817 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3549 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3544 thiss!1379))))))

(assert (=> d!23668 (invariant!0 (currentBit!3544 thiss!1379) (currentByte!3549 thiss!1379) (size!1424 (buf!1805 thiss!1379)))))

(assert (=> d!23668 (= (bitIndex!0 (size!1424 (buf!1805 thiss!1379)) (currentByte!3549 thiss!1379) (currentBit!3544 thiss!1379)) lt!119817)))

(declare-fun b!74580 () Bool)

(declare-fun res!61655 () Bool)

(assert (=> b!74580 (=> (not res!61655) (not e!48818))))

(assert (=> b!74580 (= res!61655 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!119817))))

(declare-fun b!74581 () Bool)

(declare-fun lt!119821 () (_ BitVec 64))

(assert (=> b!74581 (= e!48818 (bvsle lt!119817 (bvmul lt!119821 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!74581 (or (= lt!119821 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!119821 #b0000000000000000000000000000000000000000000000000000000000001000) lt!119821)))))

(assert (=> b!74581 (= lt!119821 ((_ sign_extend 32) (size!1424 (buf!1805 thiss!1379))))))

(assert (= (and d!23668 res!61656) b!74580))

(assert (= (and b!74580 res!61655) b!74581))

(assert (=> d!23668 m!119549))

(assert (=> d!23668 m!119483))

(assert (=> b!74492 d!23668))

(declare-fun d!23680 () Bool)

(declare-fun e!48827 () Bool)

(assert (=> d!23680 e!48827))

(declare-fun res!61691 () Bool)

(assert (=> d!23680 (=> (not res!61691) (not e!48827))))

(declare-fun lt!119890 () tuple2!6438)

(assert (=> d!23680 (= res!61691 (= (buf!1805 (_2!3333 lt!119890)) (buf!1805 (_1!3334 (reader!0 thiss!1379 thiss!1379)))))))

(declare-datatypes ((tuple3!192 0))(
  ( (tuple3!193 (_1!3340 Unit!4925) (_2!3340 BitStream!2422) (_3!115 array!3046)) )
))
(declare-fun lt!119889 () tuple3!192)

(assert (=> d!23680 (= lt!119890 (tuple2!6439 (_3!115 lt!119889) (_2!3340 lt!119889)))))

(declare-fun readBitsLoop!0 (BitStream!2422 (_ BitVec 64) array!3046 (_ BitVec 64) (_ BitVec 64)) tuple3!192)

(assert (=> d!23680 (= lt!119889 (readBitsLoop!0 (_1!3334 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635) (array!3047 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)))))

(assert (=> d!23680 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)) (bvsle (bvsub to!314 i!635) #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!23680 (= (readBits!0 (_1!3334 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)) lt!119890)))

(declare-fun b!74613 () Bool)

(declare-fun res!61688 () Bool)

(assert (=> b!74613 (=> (not res!61688) (not e!48827))))

(declare-fun lt!119892 () (_ BitVec 64))

(assert (=> b!74613 (= res!61688 (= (bvadd lt!119892 (bvsub to!314 i!635)) (bitIndex!0 (size!1424 (buf!1805 (_2!3333 lt!119890))) (currentByte!3549 (_2!3333 lt!119890)) (currentBit!3544 (_2!3333 lt!119890)))))))

(assert (=> b!74613 (or (not (= (bvand lt!119892 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!119892 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!119892 (bvsub to!314 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!74613 (= lt!119892 (bitIndex!0 (size!1424 (buf!1805 (_1!3334 (reader!0 thiss!1379 thiss!1379)))) (currentByte!3549 (_1!3334 (reader!0 thiss!1379 thiss!1379))) (currentBit!3544 (_1!3334 (reader!0 thiss!1379 thiss!1379)))))))

(declare-fun b!74614 () Bool)

(declare-fun res!61690 () Bool)

(assert (=> b!74614 (=> (not res!61690) (not e!48827))))

(assert (=> b!74614 (= res!61690 (bvsle (currentByte!3549 (_1!3334 (reader!0 thiss!1379 thiss!1379))) (currentByte!3549 (_2!3333 lt!119890))))))

(declare-fun b!74615 () Bool)

(declare-fun res!61689 () Bool)

(assert (=> b!74615 (=> (not res!61689) (not e!48827))))

(assert (=> b!74615 (= res!61689 (invariant!0 (currentBit!3544 (_2!3333 lt!119890)) (currentByte!3549 (_2!3333 lt!119890)) (size!1424 (buf!1805 (_2!3333 lt!119890)))))))

(declare-fun b!74616 () Bool)

(declare-datatypes ((List!769 0))(
  ( (Nil!766) (Cons!765 (h!884 Bool) (t!1519 List!769)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!2422 array!3046 (_ BitVec 64) (_ BitVec 64)) List!769)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2422 BitStream!2422 (_ BitVec 64)) List!769)

(assert (=> b!74616 (= e!48827 (= (byteArrayBitContentToList!0 (_2!3333 lt!119890) (_1!3333 lt!119890) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)) (bitStreamReadBitsIntoList!0 (_2!3333 lt!119890) (_1!3334 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635))))))

(declare-fun b!74617 () Bool)

(declare-fun res!61692 () Bool)

(assert (=> b!74617 (=> (not res!61692) (not e!48827))))

(declare-fun lt!119888 () (_ BitVec 64))

(assert (=> b!74617 (= res!61692 (= (size!1424 (_1!3333 lt!119890)) ((_ extract 31 0) lt!119888)))))

(assert (=> b!74617 (and (bvslt lt!119888 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!119888 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!119896 () (_ BitVec 64))

(declare-fun lt!119895 () (_ BitVec 64))

(assert (=> b!74617 (= lt!119888 (bvsdiv lt!119896 lt!119895))))

(assert (=> b!74617 (and (not (= lt!119895 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!119896 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!119895 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!74617 (= lt!119895 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!119893 () (_ BitVec 64))

(declare-fun lt!119891 () (_ BitVec 64))

(assert (=> b!74617 (= lt!119896 (bvsub lt!119893 lt!119891))))

(assert (=> b!74617 (or (= (bvand lt!119893 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!119891 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!119893 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!119893 lt!119891) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!74617 (= lt!119891 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!119894 () (_ BitVec 64))

(assert (=> b!74617 (= lt!119893 (bvadd (bvsub to!314 i!635) lt!119894))))

(assert (=> b!74617 (or (not (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!119894 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd (bvsub to!314 i!635) lt!119894) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!74617 (= lt!119894 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (= (and d!23680 res!61691) b!74613))

(assert (= (and b!74613 res!61688) b!74615))

(assert (= (and b!74615 res!61689) b!74617))

(assert (= (and b!74617 res!61692) b!74614))

(assert (= (and b!74614 res!61690) b!74616))

(declare-fun m!119595 () Bool)

(assert (=> d!23680 m!119595))

(declare-fun m!119597 () Bool)

(assert (=> b!74613 m!119597))

(declare-fun m!119599 () Bool)

(assert (=> b!74613 m!119599))

(declare-fun m!119601 () Bool)

(assert (=> b!74615 m!119601))

(declare-fun m!119603 () Bool)

(assert (=> b!74616 m!119603))

(declare-fun m!119605 () Bool)

(assert (=> b!74616 m!119605))

(assert (=> b!74490 d!23680))

(declare-fun b!74658 () Bool)

(declare-fun res!61725 () Bool)

(declare-fun e!48841 () Bool)

(assert (=> b!74658 (=> (not res!61725) (not e!48841))))

(declare-fun lt!120038 () tuple2!6440)

(assert (=> b!74658 (= res!61725 (isPrefixOf!0 (_2!3334 lt!120038) thiss!1379))))

(declare-fun b!74659 () Bool)

(declare-fun e!48842 () Unit!4925)

(declare-fun lt!120043 () Unit!4925)

(assert (=> b!74659 (= e!48842 lt!120043)))

(declare-fun lt!120040 () (_ BitVec 64))

(assert (=> b!74659 (= lt!120040 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!120026 () (_ BitVec 64))

(assert (=> b!74659 (= lt!120026 (bitIndex!0 (size!1424 (buf!1805 thiss!1379)) (currentByte!3549 thiss!1379) (currentBit!3544 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!3046 array!3046 (_ BitVec 64) (_ BitVec 64)) Unit!4925)

(assert (=> b!74659 (= lt!120043 (arrayBitRangesEqSymmetric!0 (buf!1805 thiss!1379) (buf!1805 thiss!1379) lt!120040 lt!120026))))

(assert (=> b!74659 (arrayBitRangesEq!0 (buf!1805 thiss!1379) (buf!1805 thiss!1379) lt!120040 lt!120026)))

(declare-fun d!23690 () Bool)

(assert (=> d!23690 e!48841))

(declare-fun res!61724 () Bool)

(assert (=> d!23690 (=> (not res!61724) (not e!48841))))

(assert (=> d!23690 (= res!61724 (isPrefixOf!0 (_1!3334 lt!120038) (_2!3334 lt!120038)))))

(declare-fun lt!120035 () BitStream!2422)

(assert (=> d!23690 (= lt!120038 (tuple2!6441 lt!120035 thiss!1379))))

(declare-fun lt!120039 () Unit!4925)

(declare-fun lt!120024 () Unit!4925)

(assert (=> d!23690 (= lt!120039 lt!120024)))

(assert (=> d!23690 (isPrefixOf!0 lt!120035 thiss!1379)))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2422 BitStream!2422 BitStream!2422) Unit!4925)

(assert (=> d!23690 (= lt!120024 (lemmaIsPrefixTransitive!0 lt!120035 thiss!1379 thiss!1379))))

(declare-fun lt!120034 () Unit!4925)

(declare-fun lt!120029 () Unit!4925)

(assert (=> d!23690 (= lt!120034 lt!120029)))

(assert (=> d!23690 (isPrefixOf!0 lt!120035 thiss!1379)))

(assert (=> d!23690 (= lt!120029 (lemmaIsPrefixTransitive!0 lt!120035 thiss!1379 thiss!1379))))

(declare-fun lt!120031 () Unit!4925)

(assert (=> d!23690 (= lt!120031 e!48842)))

(declare-fun c!5469 () Bool)

(assert (=> d!23690 (= c!5469 (not (= (size!1424 (buf!1805 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!120041 () Unit!4925)

(declare-fun lt!120027 () Unit!4925)

(assert (=> d!23690 (= lt!120041 lt!120027)))

(assert (=> d!23690 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!23690 (= lt!120027 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!120030 () Unit!4925)

(declare-fun lt!120042 () Unit!4925)

(assert (=> d!23690 (= lt!120030 lt!120042)))

(assert (=> d!23690 (= lt!120042 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!120028 () Unit!4925)

(declare-fun lt!120037 () Unit!4925)

(assert (=> d!23690 (= lt!120028 lt!120037)))

(assert (=> d!23690 (isPrefixOf!0 lt!120035 lt!120035)))

(assert (=> d!23690 (= lt!120037 (lemmaIsPrefixRefl!0 lt!120035))))

(declare-fun lt!120036 () Unit!4925)

(declare-fun lt!120033 () Unit!4925)

(assert (=> d!23690 (= lt!120036 lt!120033)))

(assert (=> d!23690 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!23690 (= lt!120033 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!23690 (= lt!120035 (BitStream!2423 (buf!1805 thiss!1379) (currentByte!3549 thiss!1379) (currentBit!3544 thiss!1379)))))

(assert (=> d!23690 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!23690 (= (reader!0 thiss!1379 thiss!1379) lt!120038)))

(declare-fun b!74660 () Bool)

(declare-fun Unit!4932 () Unit!4925)

(assert (=> b!74660 (= e!48842 Unit!4932)))

(declare-fun b!74661 () Bool)

(declare-fun lt!120032 () (_ BitVec 64))

(declare-fun lt!120025 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!2422 (_ BitVec 64)) BitStream!2422)

(assert (=> b!74661 (= e!48841 (= (_1!3334 lt!120038) (withMovedBitIndex!0 (_2!3334 lt!120038) (bvsub lt!120032 lt!120025))))))

(assert (=> b!74661 (or (= (bvand lt!120032 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!120025 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!120032 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!120032 lt!120025) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!74661 (= lt!120025 (bitIndex!0 (size!1424 (buf!1805 thiss!1379)) (currentByte!3549 thiss!1379) (currentBit!3544 thiss!1379)))))

(assert (=> b!74661 (= lt!120032 (bitIndex!0 (size!1424 (buf!1805 thiss!1379)) (currentByte!3549 thiss!1379) (currentBit!3544 thiss!1379)))))

(declare-fun b!74662 () Bool)

(declare-fun res!61723 () Bool)

(assert (=> b!74662 (=> (not res!61723) (not e!48841))))

(assert (=> b!74662 (= res!61723 (isPrefixOf!0 (_1!3334 lt!120038) thiss!1379))))

(assert (= (and d!23690 c!5469) b!74659))

(assert (= (and d!23690 (not c!5469)) b!74660))

(assert (= (and d!23690 res!61724) b!74662))

(assert (= (and b!74662 res!61723) b!74658))

(assert (= (and b!74658 res!61725) b!74661))

(declare-fun m!119639 () Bool)

(assert (=> d!23690 m!119639))

(declare-fun m!119641 () Bool)

(assert (=> d!23690 m!119641))

(declare-fun m!119643 () Bool)

(assert (=> d!23690 m!119643))

(declare-fun m!119645 () Bool)

(assert (=> d!23690 m!119645))

(assert (=> d!23690 m!119485))

(assert (=> d!23690 m!119487))

(declare-fun m!119647 () Bool)

(assert (=> d!23690 m!119647))

(assert (=> d!23690 m!119487))

(assert (=> d!23690 m!119485))

(assert (=> d!23690 m!119485))

(assert (=> d!23690 m!119641))

(assert (=> b!74659 m!119489))

(declare-fun m!119649 () Bool)

(assert (=> b!74659 m!119649))

(declare-fun m!119651 () Bool)

(assert (=> b!74659 m!119651))

(declare-fun m!119653 () Bool)

(assert (=> b!74658 m!119653))

(declare-fun m!119655 () Bool)

(assert (=> b!74662 m!119655))

(declare-fun m!119657 () Bool)

(assert (=> b!74661 m!119657))

(assert (=> b!74661 m!119489))

(assert (=> b!74661 m!119489))

(assert (=> b!74490 d!23690))

(declare-fun d!23700 () Bool)

(assert (=> d!23700 (= (array_inv!1270 (buf!1805 thiss!1379)) (bvsge (size!1424 (buf!1805 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!74494 d!23700))

(declare-fun d!23702 () Bool)

(declare-fun res!61736 () Bool)

(declare-fun e!48851 () Bool)

(assert (=> d!23702 (=> res!61736 e!48851)))

(assert (=> d!23702 (= res!61736 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23702 (= (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3333 lt!119761) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)) e!48851)))

(declare-fun b!74677 () Bool)

(declare-fun e!48852 () Bool)

(assert (=> b!74677 (= e!48851 e!48852)))

(declare-fun res!61737 () Bool)

(assert (=> b!74677 (=> (not res!61737) (not e!48852))))

(assert (=> b!74677 (= res!61737 (not (not (= (not (= (bvand ((_ sign_extend 24) (select (arr!2018 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (not (= (bvand ((_ sign_extend 24) (select (arr!2018 (_1!3333 lt!119761)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000))))))))

(declare-fun b!74678 () Bool)

(assert (=> b!74678 (= e!48852 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3333 lt!119761) (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!23702 (not res!61736)) b!74677))

(assert (= (and b!74677 res!61737) b!74678))

(declare-fun m!119659 () Bool)

(assert (=> b!74677 m!119659))

(declare-fun m!119661 () Bool)

(assert (=> b!74677 m!119661))

(declare-fun m!119663 () Bool)

(assert (=> b!74677 m!119663))

(declare-fun m!119665 () Bool)

(assert (=> b!74677 m!119665))

(declare-fun m!119667 () Bool)

(assert (=> b!74678 m!119667))

(assert (=> b!74489 d!23702))

(declare-fun d!23704 () Bool)

(assert (=> d!23704 (= (array_inv!1270 srcBuffer!2) (bvsge (size!1424 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!14358 d!23704))

(declare-fun d!23706 () Bool)

(assert (=> d!23706 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3544 thiss!1379) (currentByte!3549 thiss!1379) (size!1424 (buf!1805 thiss!1379))))))

(declare-fun bs!5706 () Bool)

(assert (= bs!5706 d!23706))

(assert (=> bs!5706 m!119483))

(assert (=> start!14358 d!23706))

(declare-fun d!23708 () Bool)

(assert (=> d!23708 (= (invariant!0 (currentBit!3544 thiss!1379) (currentByte!3549 thiss!1379) (size!1424 (buf!1805 thiss!1379))) (and (bvsge (currentBit!3544 thiss!1379) #b00000000000000000000000000000000) (bvslt (currentBit!3544 thiss!1379) #b00000000000000000000000000001000) (bvsge (currentByte!3549 thiss!1379) #b00000000000000000000000000000000) (or (bvslt (currentByte!3549 thiss!1379) (size!1424 (buf!1805 thiss!1379))) (and (= (currentBit!3544 thiss!1379) #b00000000000000000000000000000000) (= (currentByte!3549 thiss!1379) (size!1424 (buf!1805 thiss!1379)))))))))

(assert (=> b!74493 d!23708))

(push 1)

(assert (not d!23690))

(assert (not b!74662))

(assert (not b!74615))

(assert (not b!74554))

(assert (not b!74552))

(assert (not b!74661))

(assert (not d!23680))

(assert (not d!23706))

(assert (not d!23658))

(assert (not d!23668))

(assert (not b!74613))

(assert (not b!74658))

(assert (not d!23666))

(assert (not b!74678))

(assert (not b!74659))

(assert (not b!74616))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

