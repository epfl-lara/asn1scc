; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!12120 () Bool)

(assert start!12120)

(declare-fun b!61742 () Bool)

(declare-fun e!41101 () Bool)

(declare-datatypes ((array!2779 0))(
  ( (array!2780 (arr!1832 (Array (_ BitVec 32) (_ BitVec 8))) (size!1268 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2212 0))(
  ( (BitStream!2213 (buf!1649 array!2779) (currentByte!3279 (_ BitVec 32)) (currentBit!3274 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2212)

(declare-fun array_inv!1165 (array!2779) Bool)

(assert (=> b!61742 (= e!41101 (array_inv!1165 (buf!1649 thiss!1379)))))

(declare-fun b!61743 () Bool)

(declare-fun res!51413 () Bool)

(declare-fun e!41099 () Bool)

(assert (=> b!61743 (=> res!51413 e!41099)))

(declare-datatypes ((tuple2!5594 0))(
  ( (tuple2!5595 (_1!2908 BitStream!2212) (_2!2908 BitStream!2212)) )
))
(declare-fun lt!96778 () tuple2!5594)

(declare-datatypes ((Unit!4207 0))(
  ( (Unit!4208) )
))
(declare-datatypes ((tuple2!5596 0))(
  ( (tuple2!5597 (_1!2909 Unit!4207) (_2!2909 BitStream!2212)) )
))
(declare-fun lt!96766 () tuple2!5596)

(declare-fun isPrefixOf!0 (BitStream!2212 BitStream!2212) Bool)

(assert (=> b!61743 (= res!51413 (not (isPrefixOf!0 (_1!2908 lt!96778) (_2!2909 lt!96766))))))

(declare-fun b!61744 () Bool)

(declare-fun e!41096 () Bool)

(declare-fun e!41097 () Bool)

(assert (=> b!61744 (= e!41096 e!41097)))

(declare-fun res!51424 () Bool)

(assert (=> b!61744 (=> res!51424 e!41097)))

(declare-fun lt!96764 () tuple2!5596)

(assert (=> b!61744 (= res!51424 (not (isPrefixOf!0 (_2!2909 lt!96764) (_2!2909 lt!96766))))))

(assert (=> b!61744 (isPrefixOf!0 thiss!1379 (_2!2909 lt!96766))))

(declare-fun lt!96775 () Unit!4207)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2212 BitStream!2212 BitStream!2212) Unit!4207)

(assert (=> b!61744 (= lt!96775 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2909 lt!96764) (_2!2909 lt!96766)))))

(declare-fun srcBuffer!2 () array!2779)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2212 array!2779 (_ BitVec 64) (_ BitVec 64)) tuple2!5596)

(assert (=> b!61744 (= lt!96766 (appendBitsMSBFirstLoop!0 (_2!2909 lt!96764) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!41095 () Bool)

(assert (=> b!61744 e!41095))

(declare-fun res!51423 () Bool)

(assert (=> b!61744 (=> (not res!51423) (not e!41095))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!61744 (= res!51423 (validate_offset_bits!1 ((_ sign_extend 32) (size!1268 (buf!1649 (_2!2909 lt!96764)))) ((_ sign_extend 32) (currentByte!3279 thiss!1379)) ((_ sign_extend 32) (currentBit!3274 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!96763 () Unit!4207)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2212 array!2779 (_ BitVec 64)) Unit!4207)

(assert (=> b!61744 (= lt!96763 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1649 (_2!2909 lt!96764)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!96769 () tuple2!5594)

(declare-fun reader!0 (BitStream!2212 BitStream!2212) tuple2!5594)

(assert (=> b!61744 (= lt!96769 (reader!0 thiss!1379 (_2!2909 lt!96764)))))

(declare-fun res!51425 () Bool)

(declare-fun e!41098 () Bool)

(assert (=> start!12120 (=> (not res!51425) (not e!41098))))

(assert (=> start!12120 (= res!51425 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1268 srcBuffer!2))))))))

(assert (=> start!12120 e!41098))

(assert (=> start!12120 true))

(assert (=> start!12120 (array_inv!1165 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2212) Bool)

(assert (=> start!12120 (and (inv!12 thiss!1379) e!41101)))

(declare-fun b!61745 () Bool)

(declare-fun e!41102 () Bool)

(assert (=> b!61745 (= e!41098 (not e!41102))))

(declare-fun res!51412 () Bool)

(assert (=> b!61745 (=> res!51412 e!41102)))

(assert (=> b!61745 (= res!51412 (bvsge i!635 to!314))))

(assert (=> b!61745 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!96765 () Unit!4207)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2212) Unit!4207)

(assert (=> b!61745 (= lt!96765 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!96767 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!61745 (= lt!96767 (bitIndex!0 (size!1268 (buf!1649 thiss!1379)) (currentByte!3279 thiss!1379) (currentBit!3274 thiss!1379)))))

(declare-fun b!61746 () Bool)

(declare-fun e!41103 () Bool)

(assert (=> b!61746 (= e!41103 e!41099)))

(declare-fun res!51419 () Bool)

(assert (=> b!61746 (=> res!51419 e!41099)))

(assert (=> b!61746 (= res!51419 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((List!681 0))(
  ( (Nil!678) (Cons!677 (h!796 Bool) (t!1431 List!681)) )
))
(declare-fun lt!96774 () List!681)

(declare-fun lt!96776 () (_ BitVec 64))

(declare-fun lt!96777 () tuple2!5594)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2212 BitStream!2212 (_ BitVec 64)) List!681)

(assert (=> b!61746 (= lt!96774 (bitStreamReadBitsIntoList!0 (_2!2909 lt!96766) (_1!2908 lt!96777) lt!96776))))

(declare-fun lt!96771 () List!681)

(assert (=> b!61746 (= lt!96771 (bitStreamReadBitsIntoList!0 (_2!2909 lt!96766) (_1!2908 lt!96778) (bvsub to!314 i!635)))))

(assert (=> b!61746 (validate_offset_bits!1 ((_ sign_extend 32) (size!1268 (buf!1649 (_2!2909 lt!96766)))) ((_ sign_extend 32) (currentByte!3279 (_2!2909 lt!96764))) ((_ sign_extend 32) (currentBit!3274 (_2!2909 lt!96764))) lt!96776)))

(declare-fun lt!96773 () Unit!4207)

(assert (=> b!61746 (= lt!96773 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2909 lt!96764) (buf!1649 (_2!2909 lt!96766)) lt!96776))))

(assert (=> b!61746 (= lt!96777 (reader!0 (_2!2909 lt!96764) (_2!2909 lt!96766)))))

(assert (=> b!61746 (validate_offset_bits!1 ((_ sign_extend 32) (size!1268 (buf!1649 (_2!2909 lt!96766)))) ((_ sign_extend 32) (currentByte!3279 thiss!1379)) ((_ sign_extend 32) (currentBit!3274 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!96770 () Unit!4207)

(assert (=> b!61746 (= lt!96770 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1649 (_2!2909 lt!96766)) (bvsub to!314 i!635)))))

(assert (=> b!61746 (= lt!96778 (reader!0 thiss!1379 (_2!2909 lt!96766)))))

(declare-fun b!61747 () Bool)

(declare-fun res!51426 () Bool)

(assert (=> b!61747 (=> res!51426 e!41103)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!61747 (= res!51426 (not (invariant!0 (currentBit!3274 (_2!2909 lt!96764)) (currentByte!3279 (_2!2909 lt!96764)) (size!1268 (buf!1649 (_2!2909 lt!96764))))))))

(declare-fun b!61748 () Bool)

(assert (=> b!61748 (= e!41102 e!41096)))

(declare-fun res!51416 () Bool)

(assert (=> b!61748 (=> res!51416 e!41096)))

(assert (=> b!61748 (= res!51416 (not (isPrefixOf!0 thiss!1379 (_2!2909 lt!96764))))))

(assert (=> b!61748 (validate_offset_bits!1 ((_ sign_extend 32) (size!1268 (buf!1649 (_2!2909 lt!96764)))) ((_ sign_extend 32) (currentByte!3279 (_2!2909 lt!96764))) ((_ sign_extend 32) (currentBit!3274 (_2!2909 lt!96764))) lt!96776)))

(assert (=> b!61748 (= lt!96776 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!96772 () Unit!4207)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2212 BitStream!2212 (_ BitVec 64) (_ BitVec 64)) Unit!4207)

(assert (=> b!61748 (= lt!96772 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2909 lt!96764) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2212 (_ BitVec 8) (_ BitVec 32)) tuple2!5596)

(assert (=> b!61748 (= lt!96764 (appendBitFromByte!0 thiss!1379 (select (arr!1832 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!61749 () Bool)

(declare-fun e!41105 () Bool)

(assert (=> b!61749 (= e!41097 e!41105)))

(declare-fun res!51414 () Bool)

(assert (=> b!61749 (=> res!51414 e!41105)))

(declare-fun lt!96768 () (_ BitVec 64))

(assert (=> b!61749 (= res!51414 (not (= lt!96768 (bvsub (bvadd lt!96767 to!314) i!635))))))

(assert (=> b!61749 (= lt!96768 (bitIndex!0 (size!1268 (buf!1649 (_2!2909 lt!96766))) (currentByte!3279 (_2!2909 lt!96766)) (currentBit!3274 (_2!2909 lt!96766))))))

(declare-fun b!61750 () Bool)

(declare-fun res!51422 () Bool)

(assert (=> b!61750 (=> res!51422 e!41103)))

(assert (=> b!61750 (= res!51422 (not (invariant!0 (currentBit!3274 (_2!2909 lt!96764)) (currentByte!3279 (_2!2909 lt!96764)) (size!1268 (buf!1649 (_2!2909 lt!96766))))))))

(declare-fun b!61751 () Bool)

(assert (=> b!61751 (= e!41105 e!41103)))

(declare-fun res!51410 () Bool)

(assert (=> b!61751 (=> res!51410 e!41103)))

(assert (=> b!61751 (= res!51410 (not (= (size!1268 (buf!1649 (_2!2909 lt!96764))) (size!1268 (buf!1649 (_2!2909 lt!96766))))))))

(declare-fun e!41100 () Bool)

(assert (=> b!61751 e!41100))

(declare-fun res!51417 () Bool)

(assert (=> b!61751 (=> (not res!51417) (not e!41100))))

(assert (=> b!61751 (= res!51417 (= (size!1268 (buf!1649 (_2!2909 lt!96766))) (size!1268 (buf!1649 thiss!1379))))))

(declare-fun b!61752 () Bool)

(declare-fun res!51420 () Bool)

(assert (=> b!61752 (=> (not res!51420) (not e!41098))))

(assert (=> b!61752 (= res!51420 (validate_offset_bits!1 ((_ sign_extend 32) (size!1268 (buf!1649 thiss!1379))) ((_ sign_extend 32) (currentByte!3279 thiss!1379)) ((_ sign_extend 32) (currentBit!3274 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!61753 () Bool)

(declare-fun head!500 (List!681) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2212 array!2779 (_ BitVec 64) (_ BitVec 64)) List!681)

(assert (=> b!61753 (= e!41095 (= (head!500 (byteArrayBitContentToList!0 (_2!2909 lt!96764) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!500 (bitStreamReadBitsIntoList!0 (_2!2909 lt!96764) (_1!2908 lt!96769) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!61754 () Bool)

(assert (=> b!61754 (= e!41100 (= lt!96768 (bvsub (bvsub (bvadd (bitIndex!0 (size!1268 (buf!1649 (_2!2909 lt!96764))) (currentByte!3279 (_2!2909 lt!96764)) (currentBit!3274 (_2!2909 lt!96764))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!61755 () Bool)

(declare-fun res!51421 () Bool)

(assert (=> b!61755 (=> res!51421 e!41105)))

(assert (=> b!61755 (= res!51421 (not (= (size!1268 (buf!1649 thiss!1379)) (size!1268 (buf!1649 (_2!2909 lt!96766))))))))

(declare-fun b!61756 () Bool)

(assert (=> b!61756 (= e!41099 (isPrefixOf!0 (_1!2908 lt!96778) (_1!2908 lt!96777)))))

(declare-fun b!61757 () Bool)

(declare-fun res!51415 () Bool)

(assert (=> b!61757 (=> res!51415 e!41105)))

(assert (=> b!61757 (= res!51415 (not (invariant!0 (currentBit!3274 (_2!2909 lt!96766)) (currentByte!3279 (_2!2909 lt!96766)) (size!1268 (buf!1649 (_2!2909 lt!96766))))))))

(declare-fun b!61758 () Bool)

(declare-fun res!51411 () Bool)

(assert (=> b!61758 (=> res!51411 e!41099)))

(assert (=> b!61758 (= res!51411 (not (isPrefixOf!0 (_1!2908 lt!96777) (_2!2909 lt!96766))))))

(declare-fun b!61759 () Bool)

(declare-fun res!51418 () Bool)

(assert (=> b!61759 (=> res!51418 e!41099)))

(declare-fun length!309 (List!681) Int)

(assert (=> b!61759 (= res!51418 (<= (length!309 lt!96771) 0))))

(assert (= (and start!12120 res!51425) b!61752))

(assert (= (and b!61752 res!51420) b!61745))

(assert (= (and b!61745 (not res!51412)) b!61748))

(assert (= (and b!61748 (not res!51416)) b!61744))

(assert (= (and b!61744 res!51423) b!61753))

(assert (= (and b!61744 (not res!51424)) b!61749))

(assert (= (and b!61749 (not res!51414)) b!61757))

(assert (= (and b!61757 (not res!51415)) b!61755))

(assert (= (and b!61755 (not res!51421)) b!61751))

(assert (= (and b!61751 res!51417) b!61754))

(assert (= (and b!61751 (not res!51410)) b!61747))

(assert (= (and b!61747 (not res!51426)) b!61750))

(assert (= (and b!61750 (not res!51422)) b!61746))

(assert (= (and b!61746 (not res!51419)) b!61759))

(assert (= (and b!61759 (not res!51418)) b!61743))

(assert (= (and b!61743 (not res!51413)) b!61758))

(assert (= (and b!61758 (not res!51411)) b!61756))

(assert (= start!12120 b!61742))

(declare-fun m!97549 () Bool)

(assert (=> b!61744 m!97549))

(declare-fun m!97551 () Bool)

(assert (=> b!61744 m!97551))

(declare-fun m!97553 () Bool)

(assert (=> b!61744 m!97553))

(declare-fun m!97555 () Bool)

(assert (=> b!61744 m!97555))

(declare-fun m!97557 () Bool)

(assert (=> b!61744 m!97557))

(declare-fun m!97559 () Bool)

(assert (=> b!61744 m!97559))

(declare-fun m!97561 () Bool)

(assert (=> b!61744 m!97561))

(declare-fun m!97563 () Bool)

(assert (=> b!61748 m!97563))

(declare-fun m!97565 () Bool)

(assert (=> b!61748 m!97565))

(declare-fun m!97567 () Bool)

(assert (=> b!61748 m!97567))

(declare-fun m!97569 () Bool)

(assert (=> b!61748 m!97569))

(assert (=> b!61748 m!97565))

(declare-fun m!97571 () Bool)

(assert (=> b!61748 m!97571))

(declare-fun m!97573 () Bool)

(assert (=> b!61754 m!97573))

(declare-fun m!97575 () Bool)

(assert (=> b!61745 m!97575))

(declare-fun m!97577 () Bool)

(assert (=> b!61745 m!97577))

(declare-fun m!97579 () Bool)

(assert (=> b!61745 m!97579))

(declare-fun m!97581 () Bool)

(assert (=> b!61742 m!97581))

(declare-fun m!97583 () Bool)

(assert (=> b!61757 m!97583))

(declare-fun m!97585 () Bool)

(assert (=> b!61756 m!97585))

(declare-fun m!97587 () Bool)

(assert (=> b!61753 m!97587))

(assert (=> b!61753 m!97587))

(declare-fun m!97589 () Bool)

(assert (=> b!61753 m!97589))

(declare-fun m!97591 () Bool)

(assert (=> b!61753 m!97591))

(assert (=> b!61753 m!97591))

(declare-fun m!97593 () Bool)

(assert (=> b!61753 m!97593))

(declare-fun m!97595 () Bool)

(assert (=> b!61746 m!97595))

(declare-fun m!97597 () Bool)

(assert (=> b!61746 m!97597))

(declare-fun m!97599 () Bool)

(assert (=> b!61746 m!97599))

(declare-fun m!97601 () Bool)

(assert (=> b!61746 m!97601))

(declare-fun m!97603 () Bool)

(assert (=> b!61746 m!97603))

(declare-fun m!97605 () Bool)

(assert (=> b!61746 m!97605))

(declare-fun m!97607 () Bool)

(assert (=> b!61746 m!97607))

(declare-fun m!97609 () Bool)

(assert (=> b!61746 m!97609))

(declare-fun m!97611 () Bool)

(assert (=> b!61750 m!97611))

(declare-fun m!97613 () Bool)

(assert (=> b!61749 m!97613))

(declare-fun m!97615 () Bool)

(assert (=> b!61752 m!97615))

(declare-fun m!97617 () Bool)

(assert (=> b!61743 m!97617))

(declare-fun m!97619 () Bool)

(assert (=> b!61747 m!97619))

(declare-fun m!97621 () Bool)

(assert (=> start!12120 m!97621))

(declare-fun m!97623 () Bool)

(assert (=> start!12120 m!97623))

(declare-fun m!97625 () Bool)

(assert (=> b!61759 m!97625))

(declare-fun m!97627 () Bool)

(assert (=> b!61758 m!97627))

(push 1)

(assert (not b!61757))

(assert (not b!61758))

(assert (not b!61756))

(assert (not b!61742))

(assert (not b!61744))

(assert (not b!61743))

(assert (not b!61752))

(assert (not b!61745))

(assert (not b!61747))

(assert (not b!61753))

(assert (not b!61749))

(assert (not b!61750))

(assert (not b!61746))

(assert (not b!61759))

(assert (not b!61748))

(assert (not start!12120))

(assert (not b!61754))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!19054 () Bool)

(assert (=> d!19054 (= (invariant!0 (currentBit!3274 (_2!2909 lt!96764)) (currentByte!3279 (_2!2909 lt!96764)) (size!1268 (buf!1649 (_2!2909 lt!96766)))) (and (bvsge (currentBit!3274 (_2!2909 lt!96764)) #b00000000000000000000000000000000) (bvslt (currentBit!3274 (_2!2909 lt!96764)) #b00000000000000000000000000001000) (bvsge (currentByte!3279 (_2!2909 lt!96764)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3279 (_2!2909 lt!96764)) (size!1268 (buf!1649 (_2!2909 lt!96766)))) (and (= (currentBit!3274 (_2!2909 lt!96764)) #b00000000000000000000000000000000) (= (currentByte!3279 (_2!2909 lt!96764)) (size!1268 (buf!1649 (_2!2909 lt!96766))))))))))

(assert (=> b!61750 d!19054))

(declare-fun d!19056 () Bool)

(assert (=> d!19056 (= (array_inv!1165 srcBuffer!2) (bvsge (size!1268 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!12120 d!19056))

(declare-fun d!19058 () Bool)

(assert (=> d!19058 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3274 thiss!1379) (currentByte!3279 thiss!1379) (size!1268 (buf!1649 thiss!1379))))))

(declare-fun bs!4750 () Bool)

(assert (= bs!4750 d!19058))

(declare-fun m!97793 () Bool)

(assert (=> bs!4750 m!97793))

(assert (=> start!12120 d!19058))

(declare-fun d!19060 () Bool)

(declare-fun e!41183 () Bool)

(assert (=> d!19060 e!41183))

(declare-fun res!51539 () Bool)

(assert (=> d!19060 (=> (not res!51539) (not e!41183))))

(declare-fun lt!96906 () (_ BitVec 64))

(declare-fun lt!96909 () (_ BitVec 64))

(declare-fun lt!96905 () (_ BitVec 64))

(assert (=> d!19060 (= res!51539 (= lt!96906 (bvsub lt!96905 lt!96909)))))

(assert (=> d!19060 (or (= (bvand lt!96905 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!96909 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!96905 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!96905 lt!96909) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!19060 (= lt!96909 (remainingBits!0 ((_ sign_extend 32) (size!1268 (buf!1649 (_2!2909 lt!96766)))) ((_ sign_extend 32) (currentByte!3279 (_2!2909 lt!96766))) ((_ sign_extend 32) (currentBit!3274 (_2!2909 lt!96766)))))))

(declare-fun lt!96910 () (_ BitVec 64))

(declare-fun lt!96908 () (_ BitVec 64))

(assert (=> d!19060 (= lt!96905 (bvmul lt!96910 lt!96908))))

(assert (=> d!19060 (or (= lt!96910 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!96908 (bvsdiv (bvmul lt!96910 lt!96908) lt!96910)))))

(assert (=> d!19060 (= lt!96908 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!19060 (= lt!96910 ((_ sign_extend 32) (size!1268 (buf!1649 (_2!2909 lt!96766)))))))

(assert (=> d!19060 (= lt!96906 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3279 (_2!2909 lt!96766))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3274 (_2!2909 lt!96766)))))))

(assert (=> d!19060 (invariant!0 (currentBit!3274 (_2!2909 lt!96766)) (currentByte!3279 (_2!2909 lt!96766)) (size!1268 (buf!1649 (_2!2909 lt!96766))))))

(assert (=> d!19060 (= (bitIndex!0 (size!1268 (buf!1649 (_2!2909 lt!96766))) (currentByte!3279 (_2!2909 lt!96766)) (currentBit!3274 (_2!2909 lt!96766))) lt!96906)))

(declare-fun b!61878 () Bool)

(declare-fun res!51540 () Bool)

(assert (=> b!61878 (=> (not res!51540) (not e!41183))))

(assert (=> b!61878 (= res!51540 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!96906))))

(declare-fun b!61879 () Bool)

(declare-fun lt!96907 () (_ BitVec 64))

(assert (=> b!61879 (= e!41183 (bvsle lt!96906 (bvmul lt!96907 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!61879 (or (= lt!96907 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!96907 #b0000000000000000000000000000000000000000000000000000000000001000) lt!96907)))))

(assert (=> b!61879 (= lt!96907 ((_ sign_extend 32) (size!1268 (buf!1649 (_2!2909 lt!96766)))))))

(assert (= (and d!19060 res!51539) b!61878))

(assert (= (and b!61878 res!51540) b!61879))

(declare-fun m!97795 () Bool)

(assert (=> d!19060 m!97795))

(assert (=> d!19060 m!97583))

(assert (=> b!61749 d!19060))

(declare-fun d!19062 () Bool)

(declare-fun size!1272 (List!681) Int)

(assert (=> d!19062 (= (length!309 lt!96771) (size!1272 lt!96771))))

(declare-fun bs!4751 () Bool)

(assert (= bs!4751 d!19062))

(declare-fun m!97797 () Bool)

(assert (=> bs!4751 m!97797))

(assert (=> b!61759 d!19062))

(declare-fun d!19064 () Bool)

(declare-fun res!51549 () Bool)

(declare-fun e!41189 () Bool)

(assert (=> d!19064 (=> (not res!51549) (not e!41189))))

(assert (=> d!19064 (= res!51549 (= (size!1268 (buf!1649 thiss!1379)) (size!1268 (buf!1649 (_2!2909 lt!96764)))))))

(assert (=> d!19064 (= (isPrefixOf!0 thiss!1379 (_2!2909 lt!96764)) e!41189)))

(declare-fun b!61886 () Bool)

(declare-fun res!51548 () Bool)

(assert (=> b!61886 (=> (not res!51548) (not e!41189))))

(assert (=> b!61886 (= res!51548 (bvsle (bitIndex!0 (size!1268 (buf!1649 thiss!1379)) (currentByte!3279 thiss!1379) (currentBit!3274 thiss!1379)) (bitIndex!0 (size!1268 (buf!1649 (_2!2909 lt!96764))) (currentByte!3279 (_2!2909 lt!96764)) (currentBit!3274 (_2!2909 lt!96764)))))))

(declare-fun b!61887 () Bool)

(declare-fun e!41188 () Bool)

(assert (=> b!61887 (= e!41189 e!41188)))

(declare-fun res!51547 () Bool)

(assert (=> b!61887 (=> res!51547 e!41188)))

(assert (=> b!61887 (= res!51547 (= (size!1268 (buf!1649 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!61888 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2779 array!2779 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!61888 (= e!41188 (arrayBitRangesEq!0 (buf!1649 thiss!1379) (buf!1649 (_2!2909 lt!96764)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1268 (buf!1649 thiss!1379)) (currentByte!3279 thiss!1379) (currentBit!3274 thiss!1379))))))

(assert (= (and d!19064 res!51549) b!61886))

(assert (= (and b!61886 res!51548) b!61887))

(assert (= (and b!61887 (not res!51547)) b!61888))

(assert (=> b!61886 m!97579))

(assert (=> b!61886 m!97573))

(assert (=> b!61888 m!97579))

(assert (=> b!61888 m!97579))

(declare-fun m!97799 () Bool)

(assert (=> b!61888 m!97799))

(assert (=> b!61748 d!19064))

(declare-fun d!19070 () Bool)

(assert (=> d!19070 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1268 (buf!1649 (_2!2909 lt!96764)))) ((_ sign_extend 32) (currentByte!3279 (_2!2909 lt!96764))) ((_ sign_extend 32) (currentBit!3274 (_2!2909 lt!96764))) lt!96776) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1268 (buf!1649 (_2!2909 lt!96764)))) ((_ sign_extend 32) (currentByte!3279 (_2!2909 lt!96764))) ((_ sign_extend 32) (currentBit!3274 (_2!2909 lt!96764)))) lt!96776))))

(declare-fun bs!4753 () Bool)

(assert (= bs!4753 d!19070))

(declare-fun m!97803 () Bool)

(assert (=> bs!4753 m!97803))

(assert (=> b!61748 d!19070))

(declare-fun d!19074 () Bool)

(declare-fun e!41192 () Bool)

(assert (=> d!19074 e!41192))

(declare-fun res!51552 () Bool)

(assert (=> d!19074 (=> (not res!51552) (not e!41192))))

(assert (=> d!19074 (= res!51552 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!96913 () Unit!4207)

(declare-fun choose!27 (BitStream!2212 BitStream!2212 (_ BitVec 64) (_ BitVec 64)) Unit!4207)

(assert (=> d!19074 (= lt!96913 (choose!27 thiss!1379 (_2!2909 lt!96764) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!19074 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!19074 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2909 lt!96764) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!96913)))

(declare-fun b!61891 () Bool)

(assert (=> b!61891 (= e!41192 (validate_offset_bits!1 ((_ sign_extend 32) (size!1268 (buf!1649 (_2!2909 lt!96764)))) ((_ sign_extend 32) (currentByte!3279 (_2!2909 lt!96764))) ((_ sign_extend 32) (currentBit!3274 (_2!2909 lt!96764))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!19074 res!51552) b!61891))

(declare-fun m!97807 () Bool)

(assert (=> d!19074 m!97807))

(declare-fun m!97809 () Bool)

(assert (=> b!61891 m!97809))

(assert (=> b!61748 d!19074))

(declare-fun b!61909 () Bool)

(declare-fun res!51571 () Bool)

(declare-fun e!41202 () Bool)

(assert (=> b!61909 (=> (not res!51571) (not e!41202))))

(declare-fun lt!96944 () (_ BitVec 64))

(declare-fun lt!96942 () tuple2!5596)

(declare-fun lt!96938 () (_ BitVec 64))

(assert (=> b!61909 (= res!51571 (= (bitIndex!0 (size!1268 (buf!1649 (_2!2909 lt!96942))) (currentByte!3279 (_2!2909 lt!96942)) (currentBit!3274 (_2!2909 lt!96942))) (bvadd lt!96944 lt!96938)))))

(assert (=> b!61909 (or (not (= (bvand lt!96944 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!96938 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!96944 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!96944 lt!96938) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!61909 (= lt!96938 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!61909 (= lt!96944 (bitIndex!0 (size!1268 (buf!1649 thiss!1379)) (currentByte!3279 thiss!1379) (currentBit!3274 thiss!1379)))))

(declare-fun b!61910 () Bool)

(declare-fun e!41201 () Bool)

(declare-fun e!41203 () Bool)

(assert (=> b!61910 (= e!41201 e!41203)))

(declare-fun res!51572 () Bool)

(assert (=> b!61910 (=> (not res!51572) (not e!41203))))

(declare-fun lt!96940 () Bool)

(declare-fun lt!96948 () tuple2!5596)

(declare-datatypes ((tuple2!5614 0))(
  ( (tuple2!5615 (_1!2918 BitStream!2212) (_2!2918 Bool)) )
))
(declare-fun lt!96941 () tuple2!5614)

(assert (=> b!61910 (= res!51572 (and (= (_2!2918 lt!96941) lt!96940) (= (_1!2918 lt!96941) (_2!2909 lt!96948))))))

(declare-fun readBitPure!0 (BitStream!2212) tuple2!5614)

(declare-fun readerFrom!0 (BitStream!2212 (_ BitVec 32) (_ BitVec 32)) BitStream!2212)

(assert (=> b!61910 (= lt!96941 (readBitPure!0 (readerFrom!0 (_2!2909 lt!96948) (currentBit!3274 thiss!1379) (currentByte!3279 thiss!1379))))))

(declare-fun b!61911 () Bool)

(assert (=> b!61911 (= e!41203 (= (bitIndex!0 (size!1268 (buf!1649 (_1!2918 lt!96941))) (currentByte!3279 (_1!2918 lt!96941)) (currentBit!3274 (_1!2918 lt!96941))) (bitIndex!0 (size!1268 (buf!1649 (_2!2909 lt!96948))) (currentByte!3279 (_2!2909 lt!96948)) (currentBit!3274 (_2!2909 lt!96948)))))))

(declare-fun d!19078 () Bool)

(assert (=> d!19078 e!41202))

(declare-fun res!51569 () Bool)

(assert (=> d!19078 (=> (not res!51569) (not e!41202))))

(assert (=> d!19078 (= res!51569 (= (size!1268 (buf!1649 (_2!2909 lt!96942))) (size!1268 (buf!1649 thiss!1379))))))

(declare-fun lt!96939 () (_ BitVec 8))

(declare-fun lt!96949 () array!2779)

(assert (=> d!19078 (= lt!96939 (select (arr!1832 lt!96949) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!19078 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1268 lt!96949)))))

(assert (=> d!19078 (= lt!96949 (array!2780 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!96946 () tuple2!5596)

(assert (=> d!19078 (= lt!96942 (tuple2!5597 (_1!2909 lt!96946) (_2!2909 lt!96946)))))

(assert (=> d!19078 (= lt!96946 lt!96948)))

(assert (=> d!19078 e!41201))

(declare-fun res!51573 () Bool)

(assert (=> d!19078 (=> (not res!51573) (not e!41201))))

(assert (=> d!19078 (= res!51573 (= (size!1268 (buf!1649 thiss!1379)) (size!1268 (buf!1649 (_2!2909 lt!96948)))))))

(declare-fun appendBit!0 (BitStream!2212 Bool) tuple2!5596)

(assert (=> d!19078 (= lt!96948 (appendBit!0 thiss!1379 lt!96940))))

(assert (=> d!19078 (= lt!96940 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1832 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!19078 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!19078 (= (appendBitFromByte!0 thiss!1379 (select (arr!1832 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!96942)))

(declare-fun b!61912 () Bool)

(declare-fun e!41204 () Bool)

(declare-fun lt!96943 () tuple2!5614)

(assert (=> b!61912 (= e!41204 (= (bitIndex!0 (size!1268 (buf!1649 (_1!2918 lt!96943))) (currentByte!3279 (_1!2918 lt!96943)) (currentBit!3274 (_1!2918 lt!96943))) (bitIndex!0 (size!1268 (buf!1649 (_2!2909 lt!96942))) (currentByte!3279 (_2!2909 lt!96942)) (currentBit!3274 (_2!2909 lt!96942)))))))

(declare-fun b!61913 () Bool)

(declare-fun res!51576 () Bool)

(assert (=> b!61913 (=> (not res!51576) (not e!41202))))

(assert (=> b!61913 (= res!51576 (isPrefixOf!0 thiss!1379 (_2!2909 lt!96942)))))

(declare-fun b!61914 () Bool)

(declare-fun res!51570 () Bool)

(assert (=> b!61914 (=> (not res!51570) (not e!41201))))

(assert (=> b!61914 (= res!51570 (= (bitIndex!0 (size!1268 (buf!1649 (_2!2909 lt!96948))) (currentByte!3279 (_2!2909 lt!96948)) (currentBit!3274 (_2!2909 lt!96948))) (bvadd (bitIndex!0 (size!1268 (buf!1649 thiss!1379)) (currentByte!3279 thiss!1379) (currentBit!3274 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!61915 () Bool)

(declare-fun res!51575 () Bool)

(assert (=> b!61915 (=> (not res!51575) (not e!41201))))

(assert (=> b!61915 (= res!51575 (isPrefixOf!0 thiss!1379 (_2!2909 lt!96948)))))

(declare-fun b!61916 () Bool)

(assert (=> b!61916 (= e!41202 e!41204)))

(declare-fun res!51574 () Bool)

(assert (=> b!61916 (=> (not res!51574) (not e!41204))))

(assert (=> b!61916 (= res!51574 (and (= (_2!2918 lt!96943) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1832 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!96939)) #b00000000000000000000000000000000))) (= (_1!2918 lt!96943) (_2!2909 lt!96942))))))

(declare-datatypes ((tuple2!5618 0))(
  ( (tuple2!5619 (_1!2920 array!2779) (_2!2920 BitStream!2212)) )
))
(declare-fun lt!96947 () tuple2!5618)

(declare-fun lt!96945 () BitStream!2212)

(declare-fun readBits!0 (BitStream!2212 (_ BitVec 64)) tuple2!5618)

(assert (=> b!61916 (= lt!96947 (readBits!0 lt!96945 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!61916 (= lt!96943 (readBitPure!0 lt!96945))))

(assert (=> b!61916 (= lt!96945 (readerFrom!0 (_2!2909 lt!96942) (currentBit!3274 thiss!1379) (currentByte!3279 thiss!1379)))))

(assert (= (and d!19078 res!51573) b!61914))

(assert (= (and b!61914 res!51570) b!61915))

(assert (= (and b!61915 res!51575) b!61910))

(assert (= (and b!61910 res!51572) b!61911))

(assert (= (and d!19078 res!51569) b!61909))

(assert (= (and b!61909 res!51571) b!61913))

(assert (= (and b!61913 res!51576) b!61916))

(assert (= (and b!61916 res!51574) b!61912))

(declare-fun m!97811 () Bool)

(assert (=> b!61912 m!97811))

(declare-fun m!97813 () Bool)

(assert (=> b!61912 m!97813))

(declare-fun m!97815 () Bool)

(assert (=> b!61913 m!97815))

(declare-fun m!97817 () Bool)

(assert (=> d!19078 m!97817))

(declare-fun m!97819 () Bool)

(assert (=> d!19078 m!97819))

(declare-fun m!97821 () Bool)

(assert (=> d!19078 m!97821))

(assert (=> b!61909 m!97813))

(assert (=> b!61909 m!97579))

(declare-fun m!97823 () Bool)

(assert (=> b!61911 m!97823))

(declare-fun m!97825 () Bool)

(assert (=> b!61911 m!97825))

(assert (=> b!61914 m!97825))

(assert (=> b!61914 m!97579))

(declare-fun m!97827 () Bool)

(assert (=> b!61915 m!97827))

(declare-fun m!97829 () Bool)

(assert (=> b!61916 m!97829))

(declare-fun m!97831 () Bool)

(assert (=> b!61916 m!97831))

(declare-fun m!97833 () Bool)

(assert (=> b!61916 m!97833))

(declare-fun m!97835 () Bool)

(assert (=> b!61910 m!97835))

(assert (=> b!61910 m!97835))

(declare-fun m!97837 () Bool)

(assert (=> b!61910 m!97837))

(assert (=> b!61748 d!19078))

(declare-fun d!19080 () Bool)

(declare-fun res!51579 () Bool)

(declare-fun e!41206 () Bool)

(assert (=> d!19080 (=> (not res!51579) (not e!41206))))

(assert (=> d!19080 (= res!51579 (= (size!1268 (buf!1649 (_1!2908 lt!96777))) (size!1268 (buf!1649 (_2!2909 lt!96766)))))))

(assert (=> d!19080 (= (isPrefixOf!0 (_1!2908 lt!96777) (_2!2909 lt!96766)) e!41206)))

(declare-fun b!61917 () Bool)

(declare-fun res!51578 () Bool)

(assert (=> b!61917 (=> (not res!51578) (not e!41206))))

(assert (=> b!61917 (= res!51578 (bvsle (bitIndex!0 (size!1268 (buf!1649 (_1!2908 lt!96777))) (currentByte!3279 (_1!2908 lt!96777)) (currentBit!3274 (_1!2908 lt!96777))) (bitIndex!0 (size!1268 (buf!1649 (_2!2909 lt!96766))) (currentByte!3279 (_2!2909 lt!96766)) (currentBit!3274 (_2!2909 lt!96766)))))))

(declare-fun b!61918 () Bool)

(declare-fun e!41205 () Bool)

(assert (=> b!61918 (= e!41206 e!41205)))

(declare-fun res!51577 () Bool)

(assert (=> b!61918 (=> res!51577 e!41205)))

(assert (=> b!61918 (= res!51577 (= (size!1268 (buf!1649 (_1!2908 lt!96777))) #b00000000000000000000000000000000))))

(declare-fun b!61919 () Bool)

(assert (=> b!61919 (= e!41205 (arrayBitRangesEq!0 (buf!1649 (_1!2908 lt!96777)) (buf!1649 (_2!2909 lt!96766)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1268 (buf!1649 (_1!2908 lt!96777))) (currentByte!3279 (_1!2908 lt!96777)) (currentBit!3274 (_1!2908 lt!96777)))))))

(assert (= (and d!19080 res!51579) b!61917))

(assert (= (and b!61917 res!51578) b!61918))

(assert (= (and b!61918 (not res!51577)) b!61919))

(declare-fun m!97839 () Bool)

(assert (=> b!61917 m!97839))

(assert (=> b!61917 m!97613))

(assert (=> b!61919 m!97839))

(assert (=> b!61919 m!97839))

(declare-fun m!97841 () Bool)

(assert (=> b!61919 m!97841))

(assert (=> b!61758 d!19080))

(declare-fun d!19082 () Bool)

(assert (=> d!19082 (= (invariant!0 (currentBit!3274 (_2!2909 lt!96764)) (currentByte!3279 (_2!2909 lt!96764)) (size!1268 (buf!1649 (_2!2909 lt!96764)))) (and (bvsge (currentBit!3274 (_2!2909 lt!96764)) #b00000000000000000000000000000000) (bvslt (currentBit!3274 (_2!2909 lt!96764)) #b00000000000000000000000000001000) (bvsge (currentByte!3279 (_2!2909 lt!96764)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3279 (_2!2909 lt!96764)) (size!1268 (buf!1649 (_2!2909 lt!96764)))) (and (= (currentBit!3274 (_2!2909 lt!96764)) #b00000000000000000000000000000000) (= (currentByte!3279 (_2!2909 lt!96764)) (size!1268 (buf!1649 (_2!2909 lt!96764))))))))))

(assert (=> b!61747 d!19082))

(declare-fun d!19084 () Bool)

(assert (=> d!19084 (= (invariant!0 (currentBit!3274 (_2!2909 lt!96766)) (currentByte!3279 (_2!2909 lt!96766)) (size!1268 (buf!1649 (_2!2909 lt!96766)))) (and (bvsge (currentBit!3274 (_2!2909 lt!96766)) #b00000000000000000000000000000000) (bvslt (currentBit!3274 (_2!2909 lt!96766)) #b00000000000000000000000000001000) (bvsge (currentByte!3279 (_2!2909 lt!96766)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3279 (_2!2909 lt!96766)) (size!1268 (buf!1649 (_2!2909 lt!96766)))) (and (= (currentBit!3274 (_2!2909 lt!96766)) #b00000000000000000000000000000000) (= (currentByte!3279 (_2!2909 lt!96766)) (size!1268 (buf!1649 (_2!2909 lt!96766))))))))))

(assert (=> b!61757 d!19084))

(declare-fun b!61930 () Bool)

(declare-fun res!51587 () Bool)

(declare-fun e!41212 () Bool)

(assert (=> b!61930 (=> (not res!51587) (not e!41212))))

(declare-fun lt!97005 () tuple2!5594)

(assert (=> b!61930 (= res!51587 (isPrefixOf!0 (_2!2908 lt!97005) (_2!2909 lt!96766)))))

(declare-fun d!19086 () Bool)

(assert (=> d!19086 e!41212))

(declare-fun res!51588 () Bool)

(assert (=> d!19086 (=> (not res!51588) (not e!41212))))

(assert (=> d!19086 (= res!51588 (isPrefixOf!0 (_1!2908 lt!97005) (_2!2908 lt!97005)))))

(declare-fun lt!96994 () BitStream!2212)

(assert (=> d!19086 (= lt!97005 (tuple2!5595 lt!96994 (_2!2909 lt!96766)))))

(declare-fun lt!97001 () Unit!4207)

(declare-fun lt!97003 () Unit!4207)

(assert (=> d!19086 (= lt!97001 lt!97003)))

(assert (=> d!19086 (isPrefixOf!0 lt!96994 (_2!2909 lt!96766))))

(assert (=> d!19086 (= lt!97003 (lemmaIsPrefixTransitive!0 lt!96994 (_2!2909 lt!96766) (_2!2909 lt!96766)))))

(declare-fun lt!96991 () Unit!4207)

(declare-fun lt!96997 () Unit!4207)

(assert (=> d!19086 (= lt!96991 lt!96997)))

(assert (=> d!19086 (isPrefixOf!0 lt!96994 (_2!2909 lt!96766))))

(assert (=> d!19086 (= lt!96997 (lemmaIsPrefixTransitive!0 lt!96994 (_2!2909 lt!96764) (_2!2909 lt!96766)))))

(declare-fun lt!96995 () Unit!4207)

(declare-fun e!41211 () Unit!4207)

(assert (=> d!19086 (= lt!96995 e!41211)))

(declare-fun c!4356 () Bool)

(assert (=> d!19086 (= c!4356 (not (= (size!1268 (buf!1649 (_2!2909 lt!96764))) #b00000000000000000000000000000000)))))

(declare-fun lt!97009 () Unit!4207)

(declare-fun lt!97006 () Unit!4207)

(assert (=> d!19086 (= lt!97009 lt!97006)))

(assert (=> d!19086 (isPrefixOf!0 (_2!2909 lt!96766) (_2!2909 lt!96766))))

(assert (=> d!19086 (= lt!97006 (lemmaIsPrefixRefl!0 (_2!2909 lt!96766)))))

(declare-fun lt!96998 () Unit!4207)

(declare-fun lt!96993 () Unit!4207)

(assert (=> d!19086 (= lt!96998 lt!96993)))

(assert (=> d!19086 (= lt!96993 (lemmaIsPrefixRefl!0 (_2!2909 lt!96766)))))

(declare-fun lt!96996 () Unit!4207)

(declare-fun lt!96992 () Unit!4207)

(assert (=> d!19086 (= lt!96996 lt!96992)))

(assert (=> d!19086 (isPrefixOf!0 lt!96994 lt!96994)))

(assert (=> d!19086 (= lt!96992 (lemmaIsPrefixRefl!0 lt!96994))))

(declare-fun lt!97004 () Unit!4207)

(declare-fun lt!96990 () Unit!4207)

(assert (=> d!19086 (= lt!97004 lt!96990)))

(assert (=> d!19086 (isPrefixOf!0 (_2!2909 lt!96764) (_2!2909 lt!96764))))

(assert (=> d!19086 (= lt!96990 (lemmaIsPrefixRefl!0 (_2!2909 lt!96764)))))

(assert (=> d!19086 (= lt!96994 (BitStream!2213 (buf!1649 (_2!2909 lt!96766)) (currentByte!3279 (_2!2909 lt!96764)) (currentBit!3274 (_2!2909 lt!96764))))))

(assert (=> d!19086 (isPrefixOf!0 (_2!2909 lt!96764) (_2!2909 lt!96766))))

(assert (=> d!19086 (= (reader!0 (_2!2909 lt!96764) (_2!2909 lt!96766)) lt!97005)))

(declare-fun b!61931 () Bool)

(declare-fun lt!97002 () Unit!4207)

(assert (=> b!61931 (= e!41211 lt!97002)))

(declare-fun lt!96999 () (_ BitVec 64))

(assert (=> b!61931 (= lt!96999 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!97000 () (_ BitVec 64))

(assert (=> b!61931 (= lt!97000 (bitIndex!0 (size!1268 (buf!1649 (_2!2909 lt!96764))) (currentByte!3279 (_2!2909 lt!96764)) (currentBit!3274 (_2!2909 lt!96764))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2779 array!2779 (_ BitVec 64) (_ BitVec 64)) Unit!4207)

(assert (=> b!61931 (= lt!97002 (arrayBitRangesEqSymmetric!0 (buf!1649 (_2!2909 lt!96764)) (buf!1649 (_2!2909 lt!96766)) lt!96999 lt!97000))))

(assert (=> b!61931 (arrayBitRangesEq!0 (buf!1649 (_2!2909 lt!96766)) (buf!1649 (_2!2909 lt!96764)) lt!96999 lt!97000)))

(declare-fun lt!97008 () (_ BitVec 64))

(declare-fun b!61932 () Bool)

(declare-fun lt!97007 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!2212 (_ BitVec 64)) BitStream!2212)

(assert (=> b!61932 (= e!41212 (= (_1!2908 lt!97005) (withMovedBitIndex!0 (_2!2908 lt!97005) (bvsub lt!97007 lt!97008))))))

(assert (=> b!61932 (or (= (bvand lt!97007 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!97008 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!97007 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!97007 lt!97008) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!61932 (= lt!97008 (bitIndex!0 (size!1268 (buf!1649 (_2!2909 lt!96766))) (currentByte!3279 (_2!2909 lt!96766)) (currentBit!3274 (_2!2909 lt!96766))))))

(assert (=> b!61932 (= lt!97007 (bitIndex!0 (size!1268 (buf!1649 (_2!2909 lt!96764))) (currentByte!3279 (_2!2909 lt!96764)) (currentBit!3274 (_2!2909 lt!96764))))))

(declare-fun b!61933 () Bool)

(declare-fun Unit!4230 () Unit!4207)

(assert (=> b!61933 (= e!41211 Unit!4230)))

(declare-fun b!61934 () Bool)

(declare-fun res!51586 () Bool)

(assert (=> b!61934 (=> (not res!51586) (not e!41212))))

(assert (=> b!61934 (= res!51586 (isPrefixOf!0 (_1!2908 lt!97005) (_2!2909 lt!96764)))))

(assert (= (and d!19086 c!4356) b!61931))

(assert (= (and d!19086 (not c!4356)) b!61933))

(assert (= (and d!19086 res!51588) b!61934))

(assert (= (and b!61934 res!51586) b!61930))

(assert (= (and b!61930 res!51587) b!61932))

(declare-fun m!97843 () Bool)

(assert (=> b!61932 m!97843))

(assert (=> b!61932 m!97613))

(assert (=> b!61932 m!97573))

(declare-fun m!97845 () Bool)

(assert (=> d!19086 m!97845))

(declare-fun m!97847 () Bool)

(assert (=> d!19086 m!97847))

(declare-fun m!97849 () Bool)

(assert (=> d!19086 m!97849))

(declare-fun m!97851 () Bool)

(assert (=> d!19086 m!97851))

(declare-fun m!97853 () Bool)

(assert (=> d!19086 m!97853))

(declare-fun m!97855 () Bool)

(assert (=> d!19086 m!97855))

(assert (=> d!19086 m!97561))

(declare-fun m!97857 () Bool)

(assert (=> d!19086 m!97857))

(declare-fun m!97859 () Bool)

(assert (=> d!19086 m!97859))

(declare-fun m!97861 () Bool)

(assert (=> d!19086 m!97861))

(declare-fun m!97863 () Bool)

(assert (=> d!19086 m!97863))

(assert (=> b!61931 m!97573))

(declare-fun m!97865 () Bool)

(assert (=> b!61931 m!97865))

(declare-fun m!97867 () Bool)

(assert (=> b!61931 m!97867))

(declare-fun m!97869 () Bool)

(assert (=> b!61934 m!97869))

(declare-fun m!97871 () Bool)

(assert (=> b!61930 m!97871))

(assert (=> b!61746 d!19086))

(declare-fun d!19088 () Bool)

(assert (=> d!19088 (validate_offset_bits!1 ((_ sign_extend 32) (size!1268 (buf!1649 (_2!2909 lt!96766)))) ((_ sign_extend 32) (currentByte!3279 thiss!1379)) ((_ sign_extend 32) (currentBit!3274 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!97012 () Unit!4207)

(declare-fun choose!9 (BitStream!2212 array!2779 (_ BitVec 64) BitStream!2212) Unit!4207)

(assert (=> d!19088 (= lt!97012 (choose!9 thiss!1379 (buf!1649 (_2!2909 lt!96766)) (bvsub to!314 i!635) (BitStream!2213 (buf!1649 (_2!2909 lt!96766)) (currentByte!3279 thiss!1379) (currentBit!3274 thiss!1379))))))

(assert (=> d!19088 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1649 (_2!2909 lt!96766)) (bvsub to!314 i!635)) lt!97012)))

(declare-fun bs!4755 () Bool)

(assert (= bs!4755 d!19088))

(assert (=> bs!4755 m!97607))

(declare-fun m!97873 () Bool)

(assert (=> bs!4755 m!97873))

(assert (=> b!61746 d!19088))

(declare-fun b!61947 () Bool)

(declare-datatypes ((tuple2!5620 0))(
  ( (tuple2!5621 (_1!2921 List!681) (_2!2921 BitStream!2212)) )
))
(declare-fun e!41220 () tuple2!5620)

(assert (=> b!61947 (= e!41220 (tuple2!5621 Nil!678 (_1!2908 lt!96777)))))

(declare-fun b!61948 () Bool)

(declare-fun lt!97077 () (_ BitVec 64))

(declare-datatypes ((tuple2!5622 0))(
  ( (tuple2!5623 (_1!2922 Bool) (_2!2922 BitStream!2212)) )
))
(declare-fun lt!97079 () tuple2!5622)

(assert (=> b!61948 (= e!41220 (tuple2!5621 (Cons!677 (_1!2922 lt!97079) (bitStreamReadBitsIntoList!0 (_2!2909 lt!96766) (_2!2922 lt!97079) (bvsub lt!96776 lt!97077))) (_2!2922 lt!97079)))))

(declare-fun readBit!0 (BitStream!2212) tuple2!5622)

(assert (=> b!61948 (= lt!97079 (readBit!0 (_1!2908 lt!96777)))))

(assert (=> b!61948 (= lt!97077 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!61949 () Bool)

(declare-fun e!41219 () Bool)

(declare-fun lt!97078 () List!681)

(declare-fun isEmpty!187 (List!681) Bool)

(assert (=> b!61949 (= e!41219 (isEmpty!187 lt!97078))))

(declare-fun b!61950 () Bool)

(assert (=> b!61950 (= e!41219 (> (length!309 lt!97078) 0))))

(declare-fun d!19090 () Bool)

(assert (=> d!19090 e!41219))

(declare-fun c!4363 () Bool)

(assert (=> d!19090 (= c!4363 (= lt!96776 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!19090 (= lt!97078 (_1!2921 e!41220))))

(declare-fun c!4364 () Bool)

(assert (=> d!19090 (= c!4364 (= lt!96776 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!19090 (bvsge lt!96776 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!19090 (= (bitStreamReadBitsIntoList!0 (_2!2909 lt!96766) (_1!2908 lt!96777) lt!96776) lt!97078)))

(assert (= (and d!19090 c!4364) b!61947))

(assert (= (and d!19090 (not c!4364)) b!61948))

(assert (= (and d!19090 c!4363) b!61949))

(assert (= (and d!19090 (not c!4363)) b!61950))

(declare-fun m!97875 () Bool)

(assert (=> b!61948 m!97875))

(declare-fun m!97877 () Bool)

(assert (=> b!61948 m!97877))

(declare-fun m!97879 () Bool)

(assert (=> b!61949 m!97879))

(declare-fun m!97881 () Bool)

(assert (=> b!61950 m!97881))

(assert (=> b!61746 d!19090))

(declare-fun d!19092 () Bool)

(assert (=> d!19092 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1268 (buf!1649 (_2!2909 lt!96766)))) ((_ sign_extend 32) (currentByte!3279 thiss!1379)) ((_ sign_extend 32) (currentBit!3274 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1268 (buf!1649 (_2!2909 lt!96766)))) ((_ sign_extend 32) (currentByte!3279 thiss!1379)) ((_ sign_extend 32) (currentBit!3274 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4756 () Bool)

(assert (= bs!4756 d!19092))

(declare-fun m!97883 () Bool)

(assert (=> bs!4756 m!97883))

(assert (=> b!61746 d!19092))

(declare-fun d!19094 () Bool)

(assert (=> d!19094 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1268 (buf!1649 (_2!2909 lt!96766)))) ((_ sign_extend 32) (currentByte!3279 (_2!2909 lt!96764))) ((_ sign_extend 32) (currentBit!3274 (_2!2909 lt!96764))) lt!96776) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1268 (buf!1649 (_2!2909 lt!96766)))) ((_ sign_extend 32) (currentByte!3279 (_2!2909 lt!96764))) ((_ sign_extend 32) (currentBit!3274 (_2!2909 lt!96764)))) lt!96776))))

(declare-fun bs!4757 () Bool)

(assert (= bs!4757 d!19094))

(declare-fun m!97885 () Bool)

(assert (=> bs!4757 m!97885))

(assert (=> b!61746 d!19094))

(declare-fun d!19096 () Bool)

(assert (=> d!19096 (validate_offset_bits!1 ((_ sign_extend 32) (size!1268 (buf!1649 (_2!2909 lt!96766)))) ((_ sign_extend 32) (currentByte!3279 (_2!2909 lt!96764))) ((_ sign_extend 32) (currentBit!3274 (_2!2909 lt!96764))) lt!96776)))

(declare-fun lt!97098 () Unit!4207)

(assert (=> d!19096 (= lt!97098 (choose!9 (_2!2909 lt!96764) (buf!1649 (_2!2909 lt!96766)) lt!96776 (BitStream!2213 (buf!1649 (_2!2909 lt!96766)) (currentByte!3279 (_2!2909 lt!96764)) (currentBit!3274 (_2!2909 lt!96764)))))))

(assert (=> d!19096 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2909 lt!96764) (buf!1649 (_2!2909 lt!96766)) lt!96776) lt!97098)))

(declare-fun bs!4758 () Bool)

(assert (= bs!4758 d!19096))

(assert (=> bs!4758 m!97597))

(declare-fun m!97887 () Bool)

(assert (=> bs!4758 m!97887))

(assert (=> b!61746 d!19096))

(declare-fun b!61951 () Bool)

(declare-fun res!51590 () Bool)

(declare-fun e!41222 () Bool)

(assert (=> b!61951 (=> (not res!51590) (not e!41222))))

(declare-fun lt!97114 () tuple2!5594)

(assert (=> b!61951 (= res!51590 (isPrefixOf!0 (_2!2908 lt!97114) (_2!2909 lt!96766)))))

(declare-fun d!19098 () Bool)

(assert (=> d!19098 e!41222))

(declare-fun res!51591 () Bool)

(assert (=> d!19098 (=> (not res!51591) (not e!41222))))

(assert (=> d!19098 (= res!51591 (isPrefixOf!0 (_1!2908 lt!97114) (_2!2908 lt!97114)))))

(declare-fun lt!97103 () BitStream!2212)

(assert (=> d!19098 (= lt!97114 (tuple2!5595 lt!97103 (_2!2909 lt!96766)))))

(declare-fun lt!97110 () Unit!4207)

(declare-fun lt!97112 () Unit!4207)

(assert (=> d!19098 (= lt!97110 lt!97112)))

(assert (=> d!19098 (isPrefixOf!0 lt!97103 (_2!2909 lt!96766))))

(assert (=> d!19098 (= lt!97112 (lemmaIsPrefixTransitive!0 lt!97103 (_2!2909 lt!96766) (_2!2909 lt!96766)))))

(declare-fun lt!97100 () Unit!4207)

(declare-fun lt!97106 () Unit!4207)

(assert (=> d!19098 (= lt!97100 lt!97106)))

(assert (=> d!19098 (isPrefixOf!0 lt!97103 (_2!2909 lt!96766))))

(assert (=> d!19098 (= lt!97106 (lemmaIsPrefixTransitive!0 lt!97103 thiss!1379 (_2!2909 lt!96766)))))

(declare-fun lt!97104 () Unit!4207)

(declare-fun e!41221 () Unit!4207)

(assert (=> d!19098 (= lt!97104 e!41221)))

(declare-fun c!4365 () Bool)

(assert (=> d!19098 (= c!4365 (not (= (size!1268 (buf!1649 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!97118 () Unit!4207)

(declare-fun lt!97115 () Unit!4207)

(assert (=> d!19098 (= lt!97118 lt!97115)))

(assert (=> d!19098 (isPrefixOf!0 (_2!2909 lt!96766) (_2!2909 lt!96766))))

(assert (=> d!19098 (= lt!97115 (lemmaIsPrefixRefl!0 (_2!2909 lt!96766)))))

(declare-fun lt!97107 () Unit!4207)

(declare-fun lt!97102 () Unit!4207)

(assert (=> d!19098 (= lt!97107 lt!97102)))

(assert (=> d!19098 (= lt!97102 (lemmaIsPrefixRefl!0 (_2!2909 lt!96766)))))

(declare-fun lt!97105 () Unit!4207)

(declare-fun lt!97101 () Unit!4207)

(assert (=> d!19098 (= lt!97105 lt!97101)))

(assert (=> d!19098 (isPrefixOf!0 lt!97103 lt!97103)))

(assert (=> d!19098 (= lt!97101 (lemmaIsPrefixRefl!0 lt!97103))))

(declare-fun lt!97113 () Unit!4207)

(declare-fun lt!97099 () Unit!4207)

(assert (=> d!19098 (= lt!97113 lt!97099)))

(assert (=> d!19098 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!19098 (= lt!97099 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!19098 (= lt!97103 (BitStream!2213 (buf!1649 (_2!2909 lt!96766)) (currentByte!3279 thiss!1379) (currentBit!3274 thiss!1379)))))

(assert (=> d!19098 (isPrefixOf!0 thiss!1379 (_2!2909 lt!96766))))

(assert (=> d!19098 (= (reader!0 thiss!1379 (_2!2909 lt!96766)) lt!97114)))

(declare-fun b!61952 () Bool)

(declare-fun lt!97111 () Unit!4207)

(assert (=> b!61952 (= e!41221 lt!97111)))

(declare-fun lt!97108 () (_ BitVec 64))

(assert (=> b!61952 (= lt!97108 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!97109 () (_ BitVec 64))

(assert (=> b!61952 (= lt!97109 (bitIndex!0 (size!1268 (buf!1649 thiss!1379)) (currentByte!3279 thiss!1379) (currentBit!3274 thiss!1379)))))

(assert (=> b!61952 (= lt!97111 (arrayBitRangesEqSymmetric!0 (buf!1649 thiss!1379) (buf!1649 (_2!2909 lt!96766)) lt!97108 lt!97109))))

(assert (=> b!61952 (arrayBitRangesEq!0 (buf!1649 (_2!2909 lt!96766)) (buf!1649 thiss!1379) lt!97108 lt!97109)))

(declare-fun lt!97117 () (_ BitVec 64))

(declare-fun lt!97116 () (_ BitVec 64))

(declare-fun b!61953 () Bool)

(assert (=> b!61953 (= e!41222 (= (_1!2908 lt!97114) (withMovedBitIndex!0 (_2!2908 lt!97114) (bvsub lt!97116 lt!97117))))))

(assert (=> b!61953 (or (= (bvand lt!97116 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!97117 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!97116 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!97116 lt!97117) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!61953 (= lt!97117 (bitIndex!0 (size!1268 (buf!1649 (_2!2909 lt!96766))) (currentByte!3279 (_2!2909 lt!96766)) (currentBit!3274 (_2!2909 lt!96766))))))

(assert (=> b!61953 (= lt!97116 (bitIndex!0 (size!1268 (buf!1649 thiss!1379)) (currentByte!3279 thiss!1379) (currentBit!3274 thiss!1379)))))

(declare-fun b!61954 () Bool)

(declare-fun Unit!4231 () Unit!4207)

(assert (=> b!61954 (= e!41221 Unit!4231)))

(declare-fun b!61955 () Bool)

(declare-fun res!51589 () Bool)

(assert (=> b!61955 (=> (not res!51589) (not e!41222))))

(assert (=> b!61955 (= res!51589 (isPrefixOf!0 (_1!2908 lt!97114) thiss!1379))))

(assert (= (and d!19098 c!4365) b!61952))

(assert (= (and d!19098 (not c!4365)) b!61954))

(assert (= (and d!19098 res!51591) b!61955))

(assert (= (and b!61955 res!51589) b!61951))

(assert (= (and b!61951 res!51590) b!61953))

(declare-fun m!97889 () Bool)

(assert (=> b!61953 m!97889))

(assert (=> b!61953 m!97613))

(assert (=> b!61953 m!97579))

(assert (=> d!19098 m!97845))

(declare-fun m!97891 () Bool)

(assert (=> d!19098 m!97891))

(declare-fun m!97893 () Bool)

(assert (=> d!19098 m!97893))

(assert (=> d!19098 m!97851))

(declare-fun m!97895 () Bool)

(assert (=> d!19098 m!97895))

(assert (=> d!19098 m!97577))

(assert (=> d!19098 m!97559))

(declare-fun m!97897 () Bool)

(assert (=> d!19098 m!97897))

(declare-fun m!97899 () Bool)

(assert (=> d!19098 m!97899))

(declare-fun m!97901 () Bool)

(assert (=> d!19098 m!97901))

(assert (=> d!19098 m!97575))

(assert (=> b!61952 m!97579))

(declare-fun m!97903 () Bool)

(assert (=> b!61952 m!97903))

(declare-fun m!97905 () Bool)

(assert (=> b!61952 m!97905))

(declare-fun m!97907 () Bool)

(assert (=> b!61955 m!97907))

(declare-fun m!97909 () Bool)

(assert (=> b!61951 m!97909))

(assert (=> b!61746 d!19098))

(declare-fun b!61956 () Bool)

(declare-fun e!41224 () tuple2!5620)

(assert (=> b!61956 (= e!41224 (tuple2!5621 Nil!678 (_1!2908 lt!96778)))))

(declare-fun lt!97121 () tuple2!5622)

(declare-fun lt!97119 () (_ BitVec 64))

(declare-fun b!61957 () Bool)

(assert (=> b!61957 (= e!41224 (tuple2!5621 (Cons!677 (_1!2922 lt!97121) (bitStreamReadBitsIntoList!0 (_2!2909 lt!96766) (_2!2922 lt!97121) (bvsub (bvsub to!314 i!635) lt!97119))) (_2!2922 lt!97121)))))

(assert (=> b!61957 (= lt!97121 (readBit!0 (_1!2908 lt!96778)))))

(assert (=> b!61957 (= lt!97119 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!61958 () Bool)

(declare-fun e!41223 () Bool)

(declare-fun lt!97120 () List!681)

(assert (=> b!61958 (= e!41223 (isEmpty!187 lt!97120))))

(declare-fun b!61959 () Bool)

(assert (=> b!61959 (= e!41223 (> (length!309 lt!97120) 0))))

(declare-fun d!19100 () Bool)

(assert (=> d!19100 e!41223))

(declare-fun c!4366 () Bool)

(assert (=> d!19100 (= c!4366 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!19100 (= lt!97120 (_1!2921 e!41224))))

(declare-fun c!4367 () Bool)

(assert (=> d!19100 (= c!4367 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!19100 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!19100 (= (bitStreamReadBitsIntoList!0 (_2!2909 lt!96766) (_1!2908 lt!96778) (bvsub to!314 i!635)) lt!97120)))

(assert (= (and d!19100 c!4367) b!61956))

(assert (= (and d!19100 (not c!4367)) b!61957))

(assert (= (and d!19100 c!4366) b!61958))

(assert (= (and d!19100 (not c!4366)) b!61959))

(declare-fun m!97911 () Bool)

(assert (=> b!61957 m!97911))

(declare-fun m!97913 () Bool)

(assert (=> b!61957 m!97913))

(declare-fun m!97915 () Bool)

(assert (=> b!61958 m!97915))

(declare-fun m!97917 () Bool)

(assert (=> b!61959 m!97917))

(assert (=> b!61746 d!19100))

(declare-fun d!19102 () Bool)

(declare-fun res!51594 () Bool)

(declare-fun e!41226 () Bool)

(assert (=> d!19102 (=> (not res!51594) (not e!41226))))

(assert (=> d!19102 (= res!51594 (= (size!1268 (buf!1649 (_1!2908 lt!96778))) (size!1268 (buf!1649 (_1!2908 lt!96777)))))))

(assert (=> d!19102 (= (isPrefixOf!0 (_1!2908 lt!96778) (_1!2908 lt!96777)) e!41226)))

(declare-fun b!61960 () Bool)

(declare-fun res!51593 () Bool)

(assert (=> b!61960 (=> (not res!51593) (not e!41226))))

(assert (=> b!61960 (= res!51593 (bvsle (bitIndex!0 (size!1268 (buf!1649 (_1!2908 lt!96778))) (currentByte!3279 (_1!2908 lt!96778)) (currentBit!3274 (_1!2908 lt!96778))) (bitIndex!0 (size!1268 (buf!1649 (_1!2908 lt!96777))) (currentByte!3279 (_1!2908 lt!96777)) (currentBit!3274 (_1!2908 lt!96777)))))))

(declare-fun b!61961 () Bool)

(declare-fun e!41225 () Bool)

(assert (=> b!61961 (= e!41226 e!41225)))

(declare-fun res!51592 () Bool)

(assert (=> b!61961 (=> res!51592 e!41225)))

(assert (=> b!61961 (= res!51592 (= (size!1268 (buf!1649 (_1!2908 lt!96778))) #b00000000000000000000000000000000))))

(declare-fun b!61962 () Bool)

(assert (=> b!61962 (= e!41225 (arrayBitRangesEq!0 (buf!1649 (_1!2908 lt!96778)) (buf!1649 (_1!2908 lt!96777)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1268 (buf!1649 (_1!2908 lt!96778))) (currentByte!3279 (_1!2908 lt!96778)) (currentBit!3274 (_1!2908 lt!96778)))))))

(assert (= (and d!19102 res!51594) b!61960))

(assert (= (and b!61960 res!51593) b!61961))

(assert (= (and b!61961 (not res!51592)) b!61962))

(declare-fun m!97919 () Bool)

(assert (=> b!61960 m!97919))

(assert (=> b!61960 m!97839))

(assert (=> b!61962 m!97919))

(assert (=> b!61962 m!97919))

(declare-fun m!97921 () Bool)

(assert (=> b!61962 m!97921))

(assert (=> b!61756 d!19102))

(declare-fun d!19104 () Bool)

(declare-fun res!51603 () Bool)

(declare-fun e!41230 () Bool)

(assert (=> d!19104 (=> (not res!51603) (not e!41230))))

(assert (=> d!19104 (= res!51603 (= (size!1268 (buf!1649 thiss!1379)) (size!1268 (buf!1649 thiss!1379))))))

(assert (=> d!19104 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!41230)))

(declare-fun b!61967 () Bool)

(declare-fun res!51600 () Bool)

(assert (=> b!61967 (=> (not res!51600) (not e!41230))))

(assert (=> b!61967 (= res!51600 (bvsle (bitIndex!0 (size!1268 (buf!1649 thiss!1379)) (currentByte!3279 thiss!1379) (currentBit!3274 thiss!1379)) (bitIndex!0 (size!1268 (buf!1649 thiss!1379)) (currentByte!3279 thiss!1379) (currentBit!3274 thiss!1379))))))

(declare-fun b!61968 () Bool)

(declare-fun e!41229 () Bool)

(assert (=> b!61968 (= e!41230 e!41229)))

(declare-fun res!51599 () Bool)

(assert (=> b!61968 (=> res!51599 e!41229)))

(assert (=> b!61968 (= res!51599 (= (size!1268 (buf!1649 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!61969 () Bool)

(assert (=> b!61969 (= e!41229 (arrayBitRangesEq!0 (buf!1649 thiss!1379) (buf!1649 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1268 (buf!1649 thiss!1379)) (currentByte!3279 thiss!1379) (currentBit!3274 thiss!1379))))))

(assert (= (and d!19104 res!51603) b!61967))

(assert (= (and b!61967 res!51600) b!61968))

(assert (= (and b!61968 (not res!51599)) b!61969))

(assert (=> b!61967 m!97579))

(assert (=> b!61967 m!97579))

(assert (=> b!61969 m!97579))

(assert (=> b!61969 m!97579))

(declare-fun m!97923 () Bool)

(assert (=> b!61969 m!97923))

(assert (=> b!61745 d!19104))

(declare-fun d!19106 () Bool)

(assert (=> d!19106 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!97136 () Unit!4207)

(declare-fun choose!11 (BitStream!2212) Unit!4207)

(assert (=> d!19106 (= lt!97136 (choose!11 thiss!1379))))

(assert (=> d!19106 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!97136)))

(declare-fun bs!4760 () Bool)

(assert (= bs!4760 d!19106))

(assert (=> bs!4760 m!97575))

(declare-fun m!97925 () Bool)

(assert (=> bs!4760 m!97925))

(assert (=> b!61745 d!19106))

(declare-fun d!19108 () Bool)

(declare-fun e!41233 () Bool)

(assert (=> d!19108 e!41233))

(declare-fun res!51610 () Bool)

(assert (=> d!19108 (=> (not res!51610) (not e!41233))))

(declare-fun lt!97141 () (_ BitVec 64))

(declare-fun lt!97138 () (_ BitVec 64))

(declare-fun lt!97137 () (_ BitVec 64))

(assert (=> d!19108 (= res!51610 (= lt!97138 (bvsub lt!97137 lt!97141)))))

(assert (=> d!19108 (or (= (bvand lt!97137 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!97141 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!97137 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!97137 lt!97141) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!19108 (= lt!97141 (remainingBits!0 ((_ sign_extend 32) (size!1268 (buf!1649 thiss!1379))) ((_ sign_extend 32) (currentByte!3279 thiss!1379)) ((_ sign_extend 32) (currentBit!3274 thiss!1379))))))

(declare-fun lt!97142 () (_ BitVec 64))

(declare-fun lt!97140 () (_ BitVec 64))

(assert (=> d!19108 (= lt!97137 (bvmul lt!97142 lt!97140))))

(assert (=> d!19108 (or (= lt!97142 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!97140 (bvsdiv (bvmul lt!97142 lt!97140) lt!97142)))))

(assert (=> d!19108 (= lt!97140 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!19108 (= lt!97142 ((_ sign_extend 32) (size!1268 (buf!1649 thiss!1379))))))

(assert (=> d!19108 (= lt!97138 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3279 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3274 thiss!1379))))))

(assert (=> d!19108 (invariant!0 (currentBit!3274 thiss!1379) (currentByte!3279 thiss!1379) (size!1268 (buf!1649 thiss!1379)))))

(assert (=> d!19108 (= (bitIndex!0 (size!1268 (buf!1649 thiss!1379)) (currentByte!3279 thiss!1379) (currentBit!3274 thiss!1379)) lt!97138)))

(declare-fun b!61978 () Bool)

(declare-fun res!51611 () Bool)

(assert (=> b!61978 (=> (not res!51611) (not e!41233))))

(assert (=> b!61978 (= res!51611 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!97138))))

(declare-fun b!61979 () Bool)

(declare-fun lt!97139 () (_ BitVec 64))

(assert (=> b!61979 (= e!41233 (bvsle lt!97138 (bvmul lt!97139 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!61979 (or (= lt!97139 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!97139 #b0000000000000000000000000000000000000000000000000000000000001000) lt!97139)))))

(assert (=> b!61979 (= lt!97139 ((_ sign_extend 32) (size!1268 (buf!1649 thiss!1379))))))

(assert (= (and d!19108 res!51610) b!61978))

(assert (= (and b!61978 res!51611) b!61979))

(declare-fun m!97927 () Bool)

(assert (=> d!19108 m!97927))

(assert (=> d!19108 m!97793))

(assert (=> b!61745 d!19108))

(declare-fun b!62224 () Bool)

(declare-fun e!41357 () Bool)

(declare-fun lt!97744 () tuple2!5594)

(declare-fun lt!97751 () tuple2!5596)

(assert (=> b!62224 (= e!41357 (= (bitStreamReadBitsIntoList!0 (_2!2909 lt!97751) (_1!2908 lt!97744) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2909 lt!97751) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!62224 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!62224 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!97771 () Unit!4207)

(declare-fun lt!97754 () Unit!4207)

(assert (=> b!62224 (= lt!97771 lt!97754)))

(declare-fun lt!97752 () (_ BitVec 64))

(assert (=> b!62224 (validate_offset_bits!1 ((_ sign_extend 32) (size!1268 (buf!1649 (_2!2909 lt!97751)))) ((_ sign_extend 32) (currentByte!3279 (_2!2909 lt!96764))) ((_ sign_extend 32) (currentBit!3274 (_2!2909 lt!96764))) lt!97752)))

(assert (=> b!62224 (= lt!97754 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2909 lt!96764) (buf!1649 (_2!2909 lt!97751)) lt!97752))))

(declare-fun e!41358 () Bool)

(assert (=> b!62224 e!41358))

(declare-fun res!51776 () Bool)

(assert (=> b!62224 (=> (not res!51776) (not e!41358))))

(assert (=> b!62224 (= res!51776 (and (= (size!1268 (buf!1649 (_2!2909 lt!96764))) (size!1268 (buf!1649 (_2!2909 lt!97751)))) (bvsge lt!97752 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!62224 (= lt!97752 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!62224 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!62224 (= lt!97744 (reader!0 (_2!2909 lt!96764) (_2!2909 lt!97751)))))

(declare-fun d!19110 () Bool)

(assert (=> d!19110 e!41357))

(declare-fun res!51774 () Bool)

(assert (=> d!19110 (=> (not res!51774) (not e!41357))))

(declare-fun lt!97765 () (_ BitVec 64))

(assert (=> d!19110 (= res!51774 (= (bitIndex!0 (size!1268 (buf!1649 (_2!2909 lt!97751))) (currentByte!3279 (_2!2909 lt!97751)) (currentBit!3274 (_2!2909 lt!97751))) (bvsub lt!97765 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!19110 (or (= (bvand lt!97765 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!97765 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!97765 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!97763 () (_ BitVec 64))

(assert (=> d!19110 (= lt!97765 (bvadd lt!97763 to!314))))

(assert (=> d!19110 (or (not (= (bvand lt!97763 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!97763 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!97763 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!19110 (= lt!97763 (bitIndex!0 (size!1268 (buf!1649 (_2!2909 lt!96764))) (currentByte!3279 (_2!2909 lt!96764)) (currentBit!3274 (_2!2909 lt!96764))))))

(declare-fun e!41356 () tuple2!5596)

(assert (=> d!19110 (= lt!97751 e!41356)))

(declare-fun c!4410 () Bool)

(assert (=> d!19110 (= c!4410 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!97780 () Unit!4207)

(declare-fun lt!97742 () Unit!4207)

(assert (=> d!19110 (= lt!97780 lt!97742)))

(assert (=> d!19110 (isPrefixOf!0 (_2!2909 lt!96764) (_2!2909 lt!96764))))

(assert (=> d!19110 (= lt!97742 (lemmaIsPrefixRefl!0 (_2!2909 lt!96764)))))

(declare-fun lt!97756 () (_ BitVec 64))

(assert (=> d!19110 (= lt!97756 (bitIndex!0 (size!1268 (buf!1649 (_2!2909 lt!96764))) (currentByte!3279 (_2!2909 lt!96764)) (currentBit!3274 (_2!2909 lt!96764))))))

(assert (=> d!19110 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!19110 (= (appendBitsMSBFirstLoop!0 (_2!2909 lt!96764) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!97751)))

(declare-fun b!62225 () Bool)

(assert (=> b!62225 (= e!41358 (validate_offset_bits!1 ((_ sign_extend 32) (size!1268 (buf!1649 (_2!2909 lt!96764)))) ((_ sign_extend 32) (currentByte!3279 (_2!2909 lt!96764))) ((_ sign_extend 32) (currentBit!3274 (_2!2909 lt!96764))) lt!97752))))

(declare-fun b!62226 () Bool)

(declare-fun res!51772 () Bool)

(assert (=> b!62226 (=> (not res!51772) (not e!41357))))

(assert (=> b!62226 (= res!51772 (invariant!0 (currentBit!3274 (_2!2909 lt!97751)) (currentByte!3279 (_2!2909 lt!97751)) (size!1268 (buf!1649 (_2!2909 lt!97751)))))))

(declare-fun b!62227 () Bool)

(declare-fun lt!97768 () tuple2!5596)

(declare-fun Unit!4233 () Unit!4207)

(assert (=> b!62227 (= e!41356 (tuple2!5597 Unit!4233 (_2!2909 lt!97768)))))

(declare-fun lt!97776 () tuple2!5596)

(assert (=> b!62227 (= lt!97776 (appendBitFromByte!0 (_2!2909 lt!96764) (select (arr!1832 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!97773 () (_ BitVec 64))

(assert (=> b!62227 (= lt!97773 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!97737 () (_ BitVec 64))

(assert (=> b!62227 (= lt!97737 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!97750 () Unit!4207)

(assert (=> b!62227 (= lt!97750 (validateOffsetBitsIneqLemma!0 (_2!2909 lt!96764) (_2!2909 lt!97776) lt!97773 lt!97737))))

(assert (=> b!62227 (validate_offset_bits!1 ((_ sign_extend 32) (size!1268 (buf!1649 (_2!2909 lt!97776)))) ((_ sign_extend 32) (currentByte!3279 (_2!2909 lt!97776))) ((_ sign_extend 32) (currentBit!3274 (_2!2909 lt!97776))) (bvsub lt!97773 lt!97737))))

(declare-fun lt!97748 () Unit!4207)

(assert (=> b!62227 (= lt!97748 lt!97750)))

(declare-fun lt!97747 () tuple2!5594)

(assert (=> b!62227 (= lt!97747 (reader!0 (_2!2909 lt!96764) (_2!2909 lt!97776)))))

(declare-fun lt!97772 () (_ BitVec 64))

(assert (=> b!62227 (= lt!97772 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!97739 () Unit!4207)

(assert (=> b!62227 (= lt!97739 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2909 lt!96764) (buf!1649 (_2!2909 lt!97776)) lt!97772))))

(assert (=> b!62227 (validate_offset_bits!1 ((_ sign_extend 32) (size!1268 (buf!1649 (_2!2909 lt!97776)))) ((_ sign_extend 32) (currentByte!3279 (_2!2909 lt!96764))) ((_ sign_extend 32) (currentBit!3274 (_2!2909 lt!96764))) lt!97772)))

(declare-fun lt!97757 () Unit!4207)

(assert (=> b!62227 (= lt!97757 lt!97739)))

(assert (=> b!62227 (= (head!500 (byteArrayBitContentToList!0 (_2!2909 lt!97776) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!500 (bitStreamReadBitsIntoList!0 (_2!2909 lt!97776) (_1!2908 lt!97747) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!97764 () Unit!4207)

(declare-fun Unit!4234 () Unit!4207)

(assert (=> b!62227 (= lt!97764 Unit!4234)))

(assert (=> b!62227 (= lt!97768 (appendBitsMSBFirstLoop!0 (_2!2909 lt!97776) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!97774 () Unit!4207)

(assert (=> b!62227 (= lt!97774 (lemmaIsPrefixTransitive!0 (_2!2909 lt!96764) (_2!2909 lt!97776) (_2!2909 lt!97768)))))

(assert (=> b!62227 (isPrefixOf!0 (_2!2909 lt!96764) (_2!2909 lt!97768))))

(declare-fun lt!97741 () Unit!4207)

(assert (=> b!62227 (= lt!97741 lt!97774)))

(assert (=> b!62227 (= (size!1268 (buf!1649 (_2!2909 lt!97768))) (size!1268 (buf!1649 (_2!2909 lt!96764))))))

(declare-fun lt!97767 () Unit!4207)

(declare-fun Unit!4235 () Unit!4207)

(assert (=> b!62227 (= lt!97767 Unit!4235)))

(assert (=> b!62227 (= (bitIndex!0 (size!1268 (buf!1649 (_2!2909 lt!97768))) (currentByte!3279 (_2!2909 lt!97768)) (currentBit!3274 (_2!2909 lt!97768))) (bvsub (bvadd (bitIndex!0 (size!1268 (buf!1649 (_2!2909 lt!96764))) (currentByte!3279 (_2!2909 lt!96764)) (currentBit!3274 (_2!2909 lt!96764))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!97769 () Unit!4207)

(declare-fun Unit!4236 () Unit!4207)

(assert (=> b!62227 (= lt!97769 Unit!4236)))

(assert (=> b!62227 (= (bitIndex!0 (size!1268 (buf!1649 (_2!2909 lt!97768))) (currentByte!3279 (_2!2909 lt!97768)) (currentBit!3274 (_2!2909 lt!97768))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1268 (buf!1649 (_2!2909 lt!97776))) (currentByte!3279 (_2!2909 lt!97776)) (currentBit!3274 (_2!2909 lt!97776))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!97762 () Unit!4207)

(declare-fun Unit!4237 () Unit!4207)

(assert (=> b!62227 (= lt!97762 Unit!4237)))

(declare-fun lt!97740 () tuple2!5594)

(assert (=> b!62227 (= lt!97740 (reader!0 (_2!2909 lt!96764) (_2!2909 lt!97768)))))

(declare-fun lt!97755 () (_ BitVec 64))

(assert (=> b!62227 (= lt!97755 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!97777 () Unit!4207)

(assert (=> b!62227 (= lt!97777 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2909 lt!96764) (buf!1649 (_2!2909 lt!97768)) lt!97755))))

(assert (=> b!62227 (validate_offset_bits!1 ((_ sign_extend 32) (size!1268 (buf!1649 (_2!2909 lt!97768)))) ((_ sign_extend 32) (currentByte!3279 (_2!2909 lt!96764))) ((_ sign_extend 32) (currentBit!3274 (_2!2909 lt!96764))) lt!97755)))

(declare-fun lt!97779 () Unit!4207)

(assert (=> b!62227 (= lt!97779 lt!97777)))

(declare-fun lt!97766 () tuple2!5594)

(declare-fun call!790 () tuple2!5594)

(assert (=> b!62227 (= lt!97766 call!790)))

(declare-fun lt!97759 () (_ BitVec 64))

(assert (=> b!62227 (= lt!97759 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!97743 () Unit!4207)

(assert (=> b!62227 (= lt!97743 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2909 lt!97776) (buf!1649 (_2!2909 lt!97768)) lt!97759))))

(assert (=> b!62227 (validate_offset_bits!1 ((_ sign_extend 32) (size!1268 (buf!1649 (_2!2909 lt!97768)))) ((_ sign_extend 32) (currentByte!3279 (_2!2909 lt!97776))) ((_ sign_extend 32) (currentBit!3274 (_2!2909 lt!97776))) lt!97759)))

(declare-fun lt!97760 () Unit!4207)

(assert (=> b!62227 (= lt!97760 lt!97743)))

(declare-fun lt!97738 () List!681)

(assert (=> b!62227 (= lt!97738 (byteArrayBitContentToList!0 (_2!2909 lt!97768) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!97746 () List!681)

(assert (=> b!62227 (= lt!97746 (byteArrayBitContentToList!0 (_2!2909 lt!97768) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!97758 () List!681)

(assert (=> b!62227 (= lt!97758 (bitStreamReadBitsIntoList!0 (_2!2909 lt!97768) (_1!2908 lt!97740) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!97778 () List!681)

(assert (=> b!62227 (= lt!97778 (bitStreamReadBitsIntoList!0 (_2!2909 lt!97768) (_1!2908 lt!97766) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!97761 () (_ BitVec 64))

(assert (=> b!62227 (= lt!97761 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!97749 () Unit!4207)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2212 BitStream!2212 BitStream!2212 BitStream!2212 (_ BitVec 64) List!681) Unit!4207)

(assert (=> b!62227 (= lt!97749 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2909 lt!97768) (_2!2909 lt!97768) (_1!2908 lt!97740) (_1!2908 lt!97766) lt!97761 lt!97758))))

(declare-fun tail!290 (List!681) List!681)

(assert (=> b!62227 (= (bitStreamReadBitsIntoList!0 (_2!2909 lt!97768) (_1!2908 lt!97766) (bvsub lt!97761 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!290 lt!97758))))

(declare-fun lt!97770 () Unit!4207)

(assert (=> b!62227 (= lt!97770 lt!97749)))

(declare-fun lt!97745 () Unit!4207)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2779 array!2779 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4207)

(assert (=> b!62227 (= lt!97745 (arrayBitRangesEqImpliesEq!0 (buf!1649 (_2!2909 lt!97776)) (buf!1649 (_2!2909 lt!97768)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!97756 (bitIndex!0 (size!1268 (buf!1649 (_2!2909 lt!97776))) (currentByte!3279 (_2!2909 lt!97776)) (currentBit!3274 (_2!2909 lt!97776)))))))

(declare-fun bitAt!0 (array!2779 (_ BitVec 64)) Bool)

(assert (=> b!62227 (= (bitAt!0 (buf!1649 (_2!2909 lt!97776)) lt!97756) (bitAt!0 (buf!1649 (_2!2909 lt!97768)) lt!97756))))

(declare-fun lt!97753 () Unit!4207)

(assert (=> b!62227 (= lt!97753 lt!97745)))

(declare-fun b!62228 () Bool)

(declare-fun res!51771 () Bool)

(assert (=> b!62228 (=> (not res!51771) (not e!41357))))

(assert (=> b!62228 (= res!51771 (= (size!1268 (buf!1649 (_2!2909 lt!97751))) (size!1268 (buf!1649 (_2!2909 lt!96764)))))))

(declare-fun bm!787 () Bool)

(assert (=> bm!787 (= call!790 (reader!0 (ite c!4410 (_2!2909 lt!97776) (_2!2909 lt!96764)) (ite c!4410 (_2!2909 lt!97768) (_2!2909 lt!96764))))))

(declare-fun b!62229 () Bool)

(declare-fun Unit!4238 () Unit!4207)

(assert (=> b!62229 (= e!41356 (tuple2!5597 Unit!4238 (_2!2909 lt!96764)))))

(assert (=> b!62229 (= (size!1268 (buf!1649 (_2!2909 lt!96764))) (size!1268 (buf!1649 (_2!2909 lt!96764))))))

(declare-fun lt!97775 () Unit!4207)

(declare-fun Unit!4239 () Unit!4207)

(assert (=> b!62229 (= lt!97775 Unit!4239)))

(declare-fun checkByteArrayBitContent!0 (BitStream!2212 array!2779 array!2779 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!62229 (checkByteArrayBitContent!0 (_2!2909 lt!96764) srcBuffer!2 (_1!2920 (readBits!0 (_1!2908 call!790) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!62230 () Bool)

(declare-fun res!51773 () Bool)

(assert (=> b!62230 (=> (not res!51773) (not e!41357))))

(assert (=> b!62230 (= res!51773 (isPrefixOf!0 (_2!2909 lt!96764) (_2!2909 lt!97751)))))

(declare-fun b!62231 () Bool)

(declare-fun res!51775 () Bool)

(assert (=> b!62231 (=> (not res!51775) (not e!41357))))

(assert (=> b!62231 (= res!51775 (= (size!1268 (buf!1649 (_2!2909 lt!96764))) (size!1268 (buf!1649 (_2!2909 lt!97751)))))))

(assert (= (and d!19110 c!4410) b!62227))

(assert (= (and d!19110 (not c!4410)) b!62229))

(assert (= (or b!62227 b!62229) bm!787))

(assert (= (and d!19110 res!51774) b!62226))

(assert (= (and b!62226 res!51772) b!62231))

(assert (= (and b!62231 res!51775) b!62230))

(assert (= (and b!62230 res!51773) b!62228))

(assert (= (and b!62228 res!51771) b!62224))

(assert (= (and b!62224 res!51776) b!62225))

(declare-fun m!98415 () Bool)

(assert (=> b!62230 m!98415))

(declare-fun m!98417 () Bool)

(assert (=> d!19110 m!98417))

(assert (=> d!19110 m!97573))

(assert (=> d!19110 m!97863))

(assert (=> d!19110 m!97855))

(declare-fun m!98419 () Bool)

(assert (=> b!62224 m!98419))

(declare-fun m!98421 () Bool)

(assert (=> b!62224 m!98421))

(declare-fun m!98423 () Bool)

(assert (=> b!62224 m!98423))

(declare-fun m!98425 () Bool)

(assert (=> b!62224 m!98425))

(declare-fun m!98427 () Bool)

(assert (=> b!62224 m!98427))

(declare-fun m!98429 () Bool)

(assert (=> b!62226 m!98429))

(declare-fun m!98431 () Bool)

(assert (=> b!62229 m!98431))

(declare-fun m!98433 () Bool)

(assert (=> b!62229 m!98433))

(declare-fun m!98435 () Bool)

(assert (=> b!62227 m!98435))

(declare-fun m!98437 () Bool)

(assert (=> b!62227 m!98437))

(declare-fun m!98439 () Bool)

(assert (=> b!62227 m!98439))

(declare-fun m!98441 () Bool)

(assert (=> b!62227 m!98441))

(declare-fun m!98443 () Bool)

(assert (=> b!62227 m!98443))

(declare-fun m!98445 () Bool)

(assert (=> b!62227 m!98445))

(assert (=> b!62227 m!97573))

(declare-fun m!98447 () Bool)

(assert (=> b!62227 m!98447))

(declare-fun m!98449 () Bool)

(assert (=> b!62227 m!98449))

(declare-fun m!98451 () Bool)

(assert (=> b!62227 m!98451))

(declare-fun m!98453 () Bool)

(assert (=> b!62227 m!98453))

(declare-fun m!98455 () Bool)

(assert (=> b!62227 m!98455))

(declare-fun m!98457 () Bool)

(assert (=> b!62227 m!98457))

(declare-fun m!98459 () Bool)

(assert (=> b!62227 m!98459))

(declare-fun m!98461 () Bool)

(assert (=> b!62227 m!98461))

(declare-fun m!98463 () Bool)

(assert (=> b!62227 m!98463))

(assert (=> b!62227 m!98437))

(declare-fun m!98465 () Bool)

(assert (=> b!62227 m!98465))

(declare-fun m!98467 () Bool)

(assert (=> b!62227 m!98467))

(declare-fun m!98469 () Bool)

(assert (=> b!62227 m!98469))

(declare-fun m!98471 () Bool)

(assert (=> b!62227 m!98471))

(declare-fun m!98473 () Bool)

(assert (=> b!62227 m!98473))

(assert (=> b!62227 m!98471))

(declare-fun m!98475 () Bool)

(assert (=> b!62227 m!98475))

(declare-fun m!98477 () Bool)

(assert (=> b!62227 m!98477))

(declare-fun m!98479 () Bool)

(assert (=> b!62227 m!98479))

(declare-fun m!98481 () Bool)

(assert (=> b!62227 m!98481))

(assert (=> b!62227 m!98443))

(declare-fun m!98483 () Bool)

(assert (=> b!62227 m!98483))

(declare-fun m!98485 () Bool)

(assert (=> b!62227 m!98485))

(declare-fun m!98487 () Bool)

(assert (=> b!62227 m!98487))

(declare-fun m!98489 () Bool)

(assert (=> b!62227 m!98489))

(declare-fun m!98491 () Bool)

(assert (=> b!62227 m!98491))

(assert (=> b!62227 m!98457))

(declare-fun m!98493 () Bool)

(assert (=> b!62227 m!98493))

(declare-fun m!98495 () Bool)

(assert (=> b!62227 m!98495))

(declare-fun m!98497 () Bool)

(assert (=> bm!787 m!98497))

(declare-fun m!98499 () Bool)

(assert (=> b!62225 m!98499))

(assert (=> b!61744 d!19110))

(declare-fun d!19244 () Bool)

(declare-fun res!51779 () Bool)

(declare-fun e!41360 () Bool)

(assert (=> d!19244 (=> (not res!51779) (not e!41360))))

(assert (=> d!19244 (= res!51779 (= (size!1268 (buf!1649 (_2!2909 lt!96764))) (size!1268 (buf!1649 (_2!2909 lt!96766)))))))

(assert (=> d!19244 (= (isPrefixOf!0 (_2!2909 lt!96764) (_2!2909 lt!96766)) e!41360)))

(declare-fun b!62232 () Bool)

(declare-fun res!51778 () Bool)

(assert (=> b!62232 (=> (not res!51778) (not e!41360))))

(assert (=> b!62232 (= res!51778 (bvsle (bitIndex!0 (size!1268 (buf!1649 (_2!2909 lt!96764))) (currentByte!3279 (_2!2909 lt!96764)) (currentBit!3274 (_2!2909 lt!96764))) (bitIndex!0 (size!1268 (buf!1649 (_2!2909 lt!96766))) (currentByte!3279 (_2!2909 lt!96766)) (currentBit!3274 (_2!2909 lt!96766)))))))

(declare-fun b!62233 () Bool)

(declare-fun e!41359 () Bool)

(assert (=> b!62233 (= e!41360 e!41359)))

(declare-fun res!51777 () Bool)

(assert (=> b!62233 (=> res!51777 e!41359)))

(assert (=> b!62233 (= res!51777 (= (size!1268 (buf!1649 (_2!2909 lt!96764))) #b00000000000000000000000000000000))))

(declare-fun b!62234 () Bool)

(assert (=> b!62234 (= e!41359 (arrayBitRangesEq!0 (buf!1649 (_2!2909 lt!96764)) (buf!1649 (_2!2909 lt!96766)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1268 (buf!1649 (_2!2909 lt!96764))) (currentByte!3279 (_2!2909 lt!96764)) (currentBit!3274 (_2!2909 lt!96764)))))))

(assert (= (and d!19244 res!51779) b!62232))

(assert (= (and b!62232 res!51778) b!62233))

(assert (= (and b!62233 (not res!51777)) b!62234))

(assert (=> b!62232 m!97573))

(assert (=> b!62232 m!97613))

(assert (=> b!62234 m!97573))

(assert (=> b!62234 m!97573))

(declare-fun m!98501 () Bool)

(assert (=> b!62234 m!98501))

(assert (=> b!61744 d!19244))

(declare-fun d!19246 () Bool)

(assert (=> d!19246 (validate_offset_bits!1 ((_ sign_extend 32) (size!1268 (buf!1649 (_2!2909 lt!96764)))) ((_ sign_extend 32) (currentByte!3279 thiss!1379)) ((_ sign_extend 32) (currentBit!3274 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!97781 () Unit!4207)

(assert (=> d!19246 (= lt!97781 (choose!9 thiss!1379 (buf!1649 (_2!2909 lt!96764)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2213 (buf!1649 (_2!2909 lt!96764)) (currentByte!3279 thiss!1379) (currentBit!3274 thiss!1379))))))

(assert (=> d!19246 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1649 (_2!2909 lt!96764)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!97781)))

(declare-fun bs!4784 () Bool)

(assert (= bs!4784 d!19246))

(assert (=> bs!4784 m!97549))

(declare-fun m!98503 () Bool)

(assert (=> bs!4784 m!98503))

(assert (=> b!61744 d!19246))

(declare-fun b!62235 () Bool)

(declare-fun res!51781 () Bool)

(declare-fun e!41362 () Bool)

(assert (=> b!62235 (=> (not res!51781) (not e!41362))))

(declare-fun lt!97797 () tuple2!5594)

(assert (=> b!62235 (= res!51781 (isPrefixOf!0 (_2!2908 lt!97797) (_2!2909 lt!96764)))))

(declare-fun d!19248 () Bool)

(assert (=> d!19248 e!41362))

(declare-fun res!51782 () Bool)

(assert (=> d!19248 (=> (not res!51782) (not e!41362))))

(assert (=> d!19248 (= res!51782 (isPrefixOf!0 (_1!2908 lt!97797) (_2!2908 lt!97797)))))

(declare-fun lt!97786 () BitStream!2212)

(assert (=> d!19248 (= lt!97797 (tuple2!5595 lt!97786 (_2!2909 lt!96764)))))

(declare-fun lt!97793 () Unit!4207)

(declare-fun lt!97795 () Unit!4207)

(assert (=> d!19248 (= lt!97793 lt!97795)))

(assert (=> d!19248 (isPrefixOf!0 lt!97786 (_2!2909 lt!96764))))

(assert (=> d!19248 (= lt!97795 (lemmaIsPrefixTransitive!0 lt!97786 (_2!2909 lt!96764) (_2!2909 lt!96764)))))

(declare-fun lt!97783 () Unit!4207)

(declare-fun lt!97789 () Unit!4207)

(assert (=> d!19248 (= lt!97783 lt!97789)))

(assert (=> d!19248 (isPrefixOf!0 lt!97786 (_2!2909 lt!96764))))

(assert (=> d!19248 (= lt!97789 (lemmaIsPrefixTransitive!0 lt!97786 thiss!1379 (_2!2909 lt!96764)))))

(declare-fun lt!97787 () Unit!4207)

(declare-fun e!41361 () Unit!4207)

(assert (=> d!19248 (= lt!97787 e!41361)))

(declare-fun c!4411 () Bool)

(assert (=> d!19248 (= c!4411 (not (= (size!1268 (buf!1649 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!97801 () Unit!4207)

(declare-fun lt!97798 () Unit!4207)

(assert (=> d!19248 (= lt!97801 lt!97798)))

(assert (=> d!19248 (isPrefixOf!0 (_2!2909 lt!96764) (_2!2909 lt!96764))))

(assert (=> d!19248 (= lt!97798 (lemmaIsPrefixRefl!0 (_2!2909 lt!96764)))))

(declare-fun lt!97790 () Unit!4207)

(declare-fun lt!97785 () Unit!4207)

(assert (=> d!19248 (= lt!97790 lt!97785)))

(assert (=> d!19248 (= lt!97785 (lemmaIsPrefixRefl!0 (_2!2909 lt!96764)))))

(declare-fun lt!97788 () Unit!4207)

(declare-fun lt!97784 () Unit!4207)

(assert (=> d!19248 (= lt!97788 lt!97784)))

(assert (=> d!19248 (isPrefixOf!0 lt!97786 lt!97786)))

(assert (=> d!19248 (= lt!97784 (lemmaIsPrefixRefl!0 lt!97786))))

(declare-fun lt!97796 () Unit!4207)

(declare-fun lt!97782 () Unit!4207)

(assert (=> d!19248 (= lt!97796 lt!97782)))

(assert (=> d!19248 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!19248 (= lt!97782 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!19248 (= lt!97786 (BitStream!2213 (buf!1649 (_2!2909 lt!96764)) (currentByte!3279 thiss!1379) (currentBit!3274 thiss!1379)))))

(assert (=> d!19248 (isPrefixOf!0 thiss!1379 (_2!2909 lt!96764))))

(assert (=> d!19248 (= (reader!0 thiss!1379 (_2!2909 lt!96764)) lt!97797)))

(declare-fun b!62236 () Bool)

(declare-fun lt!97794 () Unit!4207)

(assert (=> b!62236 (= e!41361 lt!97794)))

(declare-fun lt!97791 () (_ BitVec 64))

(assert (=> b!62236 (= lt!97791 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!97792 () (_ BitVec 64))

(assert (=> b!62236 (= lt!97792 (bitIndex!0 (size!1268 (buf!1649 thiss!1379)) (currentByte!3279 thiss!1379) (currentBit!3274 thiss!1379)))))

(assert (=> b!62236 (= lt!97794 (arrayBitRangesEqSymmetric!0 (buf!1649 thiss!1379) (buf!1649 (_2!2909 lt!96764)) lt!97791 lt!97792))))

(assert (=> b!62236 (arrayBitRangesEq!0 (buf!1649 (_2!2909 lt!96764)) (buf!1649 thiss!1379) lt!97791 lt!97792)))

(declare-fun lt!97799 () (_ BitVec 64))

(declare-fun lt!97800 () (_ BitVec 64))

(declare-fun b!62237 () Bool)

(assert (=> b!62237 (= e!41362 (= (_1!2908 lt!97797) (withMovedBitIndex!0 (_2!2908 lt!97797) (bvsub lt!97799 lt!97800))))))

(assert (=> b!62237 (or (= (bvand lt!97799 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!97800 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!97799 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!97799 lt!97800) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!62237 (= lt!97800 (bitIndex!0 (size!1268 (buf!1649 (_2!2909 lt!96764))) (currentByte!3279 (_2!2909 lt!96764)) (currentBit!3274 (_2!2909 lt!96764))))))

(assert (=> b!62237 (= lt!97799 (bitIndex!0 (size!1268 (buf!1649 thiss!1379)) (currentByte!3279 thiss!1379) (currentBit!3274 thiss!1379)))))

(declare-fun b!62238 () Bool)

(declare-fun Unit!4240 () Unit!4207)

(assert (=> b!62238 (= e!41361 Unit!4240)))

(declare-fun b!62239 () Bool)

(declare-fun res!51780 () Bool)

(assert (=> b!62239 (=> (not res!51780) (not e!41362))))

(assert (=> b!62239 (= res!51780 (isPrefixOf!0 (_1!2908 lt!97797) thiss!1379))))

(assert (= (and d!19248 c!4411) b!62236))

(assert (= (and d!19248 (not c!4411)) b!62238))

(assert (= (and d!19248 res!51782) b!62239))

(assert (= (and b!62239 res!51780) b!62235))

(assert (= (and b!62235 res!51781) b!62237))

(declare-fun m!98505 () Bool)

(assert (=> b!62237 m!98505))

(assert (=> b!62237 m!97573))

(assert (=> b!62237 m!97579))

(assert (=> d!19248 m!97855))

(declare-fun m!98507 () Bool)

(assert (=> d!19248 m!98507))

(declare-fun m!98509 () Bool)

(assert (=> d!19248 m!98509))

(assert (=> d!19248 m!97863))

(declare-fun m!98511 () Bool)

(assert (=> d!19248 m!98511))

(assert (=> d!19248 m!97577))

(assert (=> d!19248 m!97563))

(declare-fun m!98513 () Bool)

(assert (=> d!19248 m!98513))

(declare-fun m!98515 () Bool)

(assert (=> d!19248 m!98515))

(declare-fun m!98517 () Bool)

(assert (=> d!19248 m!98517))

(assert (=> d!19248 m!97575))

(assert (=> b!62236 m!97579))

(declare-fun m!98519 () Bool)

(assert (=> b!62236 m!98519))

(declare-fun m!98521 () Bool)

(assert (=> b!62236 m!98521))

(declare-fun m!98523 () Bool)

(assert (=> b!62239 m!98523))

(declare-fun m!98525 () Bool)

(assert (=> b!62235 m!98525))

(assert (=> b!61744 d!19248))

(declare-fun d!19250 () Bool)

(assert (=> d!19250 (isPrefixOf!0 thiss!1379 (_2!2909 lt!96766))))

(declare-fun lt!97828 () Unit!4207)

(declare-fun choose!30 (BitStream!2212 BitStream!2212 BitStream!2212) Unit!4207)

(assert (=> d!19250 (= lt!97828 (choose!30 thiss!1379 (_2!2909 lt!96764) (_2!2909 lt!96766)))))

(assert (=> d!19250 (isPrefixOf!0 thiss!1379 (_2!2909 lt!96764))))

(assert (=> d!19250 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2909 lt!96764) (_2!2909 lt!96766)) lt!97828)))

(declare-fun bs!4785 () Bool)

(assert (= bs!4785 d!19250))

(assert (=> bs!4785 m!97559))

(declare-fun m!98527 () Bool)

(assert (=> bs!4785 m!98527))

(assert (=> bs!4785 m!97563))

(assert (=> b!61744 d!19250))

(declare-fun d!19252 () Bool)

(declare-fun res!51801 () Bool)

(declare-fun e!41372 () Bool)

(assert (=> d!19252 (=> (not res!51801) (not e!41372))))

(assert (=> d!19252 (= res!51801 (= (size!1268 (buf!1649 thiss!1379)) (size!1268 (buf!1649 (_2!2909 lt!96766)))))))

(assert (=> d!19252 (= (isPrefixOf!0 thiss!1379 (_2!2909 lt!96766)) e!41372)))

(declare-fun b!62257 () Bool)

(declare-fun res!51800 () Bool)

(assert (=> b!62257 (=> (not res!51800) (not e!41372))))

(assert (=> b!62257 (= res!51800 (bvsle (bitIndex!0 (size!1268 (buf!1649 thiss!1379)) (currentByte!3279 thiss!1379) (currentBit!3274 thiss!1379)) (bitIndex!0 (size!1268 (buf!1649 (_2!2909 lt!96766))) (currentByte!3279 (_2!2909 lt!96766)) (currentBit!3274 (_2!2909 lt!96766)))))))

(declare-fun b!62258 () Bool)

(declare-fun e!41371 () Bool)

(assert (=> b!62258 (= e!41372 e!41371)))

(declare-fun res!51799 () Bool)

(assert (=> b!62258 (=> res!51799 e!41371)))

(assert (=> b!62258 (= res!51799 (= (size!1268 (buf!1649 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!62259 () Bool)

(assert (=> b!62259 (= e!41371 (arrayBitRangesEq!0 (buf!1649 thiss!1379) (buf!1649 (_2!2909 lt!96766)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1268 (buf!1649 thiss!1379)) (currentByte!3279 thiss!1379) (currentBit!3274 thiss!1379))))))

(assert (= (and d!19252 res!51801) b!62257))

(assert (= (and b!62257 res!51800) b!62258))

(assert (= (and b!62258 (not res!51799)) b!62259))

(assert (=> b!62257 m!97579))

(assert (=> b!62257 m!97613))

(assert (=> b!62259 m!97579))

(assert (=> b!62259 m!97579))

(declare-fun m!98529 () Bool)

(assert (=> b!62259 m!98529))

(assert (=> b!61744 d!19252))

(declare-fun d!19254 () Bool)

(assert (=> d!19254 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1268 (buf!1649 (_2!2909 lt!96764)))) ((_ sign_extend 32) (currentByte!3279 thiss!1379)) ((_ sign_extend 32) (currentBit!3274 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1268 (buf!1649 (_2!2909 lt!96764)))) ((_ sign_extend 32) (currentByte!3279 thiss!1379)) ((_ sign_extend 32) (currentBit!3274 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!4786 () Bool)

(assert (= bs!4786 d!19254))

(declare-fun m!98531 () Bool)

(assert (=> bs!4786 m!98531))

(assert (=> b!61744 d!19254))

(declare-fun d!19256 () Bool)

(declare-fun e!41373 () Bool)

(assert (=> d!19256 e!41373))

(declare-fun res!51802 () Bool)

(assert (=> d!19256 (=> (not res!51802) (not e!41373))))

(declare-fun lt!97830 () (_ BitVec 64))

(declare-fun lt!97829 () (_ BitVec 64))

(declare-fun lt!97833 () (_ BitVec 64))

(assert (=> d!19256 (= res!51802 (= lt!97830 (bvsub lt!97829 lt!97833)))))

(assert (=> d!19256 (or (= (bvand lt!97829 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!97833 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!97829 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!97829 lt!97833) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!19256 (= lt!97833 (remainingBits!0 ((_ sign_extend 32) (size!1268 (buf!1649 (_2!2909 lt!96764)))) ((_ sign_extend 32) (currentByte!3279 (_2!2909 lt!96764))) ((_ sign_extend 32) (currentBit!3274 (_2!2909 lt!96764)))))))

(declare-fun lt!97834 () (_ BitVec 64))

(declare-fun lt!97832 () (_ BitVec 64))

(assert (=> d!19256 (= lt!97829 (bvmul lt!97834 lt!97832))))

(assert (=> d!19256 (or (= lt!97834 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!97832 (bvsdiv (bvmul lt!97834 lt!97832) lt!97834)))))

(assert (=> d!19256 (= lt!97832 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!19256 (= lt!97834 ((_ sign_extend 32) (size!1268 (buf!1649 (_2!2909 lt!96764)))))))

(assert (=> d!19256 (= lt!97830 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3279 (_2!2909 lt!96764))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3274 (_2!2909 lt!96764)))))))

(assert (=> d!19256 (invariant!0 (currentBit!3274 (_2!2909 lt!96764)) (currentByte!3279 (_2!2909 lt!96764)) (size!1268 (buf!1649 (_2!2909 lt!96764))))))

(assert (=> d!19256 (= (bitIndex!0 (size!1268 (buf!1649 (_2!2909 lt!96764))) (currentByte!3279 (_2!2909 lt!96764)) (currentBit!3274 (_2!2909 lt!96764))) lt!97830)))

(declare-fun b!62260 () Bool)

(declare-fun res!51803 () Bool)

(assert (=> b!62260 (=> (not res!51803) (not e!41373))))

(assert (=> b!62260 (= res!51803 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!97830))))

(declare-fun b!62261 () Bool)

(declare-fun lt!97831 () (_ BitVec 64))

(assert (=> b!62261 (= e!41373 (bvsle lt!97830 (bvmul lt!97831 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!62261 (or (= lt!97831 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!97831 #b0000000000000000000000000000000000000000000000000000000000001000) lt!97831)))))

(assert (=> b!62261 (= lt!97831 ((_ sign_extend 32) (size!1268 (buf!1649 (_2!2909 lt!96764)))))))

(assert (= (and d!19256 res!51802) b!62260))

(assert (= (and b!62260 res!51803) b!62261))

(assert (=> d!19256 m!97803))

(assert (=> d!19256 m!97619))

(assert (=> b!61754 d!19256))

(declare-fun d!19258 () Bool)

(declare-fun res!51806 () Bool)

(declare-fun e!41375 () Bool)

(assert (=> d!19258 (=> (not res!51806) (not e!41375))))

(assert (=> d!19258 (= res!51806 (= (size!1268 (buf!1649 (_1!2908 lt!96778))) (size!1268 (buf!1649 (_2!2909 lt!96766)))))))

(assert (=> d!19258 (= (isPrefixOf!0 (_1!2908 lt!96778) (_2!2909 lt!96766)) e!41375)))

(declare-fun b!62262 () Bool)

(declare-fun res!51805 () Bool)

(assert (=> b!62262 (=> (not res!51805) (not e!41375))))

(assert (=> b!62262 (= res!51805 (bvsle (bitIndex!0 (size!1268 (buf!1649 (_1!2908 lt!96778))) (currentByte!3279 (_1!2908 lt!96778)) (currentBit!3274 (_1!2908 lt!96778))) (bitIndex!0 (size!1268 (buf!1649 (_2!2909 lt!96766))) (currentByte!3279 (_2!2909 lt!96766)) (currentBit!3274 (_2!2909 lt!96766)))))))

(declare-fun b!62263 () Bool)

(declare-fun e!41374 () Bool)

(assert (=> b!62263 (= e!41375 e!41374)))

(declare-fun res!51804 () Bool)

(assert (=> b!62263 (=> res!51804 e!41374)))

(assert (=> b!62263 (= res!51804 (= (size!1268 (buf!1649 (_1!2908 lt!96778))) #b00000000000000000000000000000000))))

(declare-fun b!62264 () Bool)

(assert (=> b!62264 (= e!41374 (arrayBitRangesEq!0 (buf!1649 (_1!2908 lt!96778)) (buf!1649 (_2!2909 lt!96766)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1268 (buf!1649 (_1!2908 lt!96778))) (currentByte!3279 (_1!2908 lt!96778)) (currentBit!3274 (_1!2908 lt!96778)))))))

(assert (= (and d!19258 res!51806) b!62262))

(assert (= (and b!62262 res!51805) b!62263))

(assert (= (and b!62263 (not res!51804)) b!62264))

(assert (=> b!62262 m!97919))

(assert (=> b!62262 m!97613))

(assert (=> b!62264 m!97919))

(assert (=> b!62264 m!97919))

(declare-fun m!98533 () Bool)

(assert (=> b!62264 m!98533))

(assert (=> b!61743 d!19258))

(declare-fun d!19260 () Bool)

(assert (=> d!19260 (= (head!500 (byteArrayBitContentToList!0 (_2!2909 lt!96764) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!796 (byteArrayBitContentToList!0 (_2!2909 lt!96764) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!61753 d!19260))

(declare-fun d!19262 () Bool)

(declare-fun c!4414 () Bool)

(assert (=> d!19262 (= c!4414 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!41382 () List!681)

(assert (=> d!19262 (= (byteArrayBitContentToList!0 (_2!2909 lt!96764) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!41382)))

(declare-fun b!62277 () Bool)

(assert (=> b!62277 (= e!41382 Nil!678)))

(declare-fun b!62278 () Bool)

(assert (=> b!62278 (= e!41382 (Cons!677 (not (= (bvand ((_ sign_extend 24) (select (arr!1832 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2909 lt!96764) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!19262 c!4414) b!62277))

(assert (= (and d!19262 (not c!4414)) b!62278))

(assert (=> b!62278 m!97565))

(assert (=> b!62278 m!97821))

(declare-fun m!98561 () Bool)

(assert (=> b!62278 m!98561))

(assert (=> b!61753 d!19262))

(declare-fun d!19270 () Bool)

(assert (=> d!19270 (= (head!500 (bitStreamReadBitsIntoList!0 (_2!2909 lt!96764) (_1!2908 lt!96769) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!796 (bitStreamReadBitsIntoList!0 (_2!2909 lt!96764) (_1!2908 lt!96769) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!61753 d!19270))

(declare-fun b!62281 () Bool)

(declare-fun e!41385 () tuple2!5620)

(assert (=> b!62281 (= e!41385 (tuple2!5621 Nil!678 (_1!2908 lt!96769)))))

(declare-fun lt!97855 () tuple2!5622)

(declare-fun lt!97853 () (_ BitVec 64))

(declare-fun b!62282 () Bool)

(assert (=> b!62282 (= e!41385 (tuple2!5621 (Cons!677 (_1!2922 lt!97855) (bitStreamReadBitsIntoList!0 (_2!2909 lt!96764) (_2!2922 lt!97855) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!97853))) (_2!2922 lt!97855)))))

(assert (=> b!62282 (= lt!97855 (readBit!0 (_1!2908 lt!96769)))))

(assert (=> b!62282 (= lt!97853 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!62283 () Bool)

(declare-fun e!41384 () Bool)

(declare-fun lt!97854 () List!681)

(assert (=> b!62283 (= e!41384 (isEmpty!187 lt!97854))))

(declare-fun b!62284 () Bool)

(assert (=> b!62284 (= e!41384 (> (length!309 lt!97854) 0))))

(declare-fun d!19272 () Bool)

(assert (=> d!19272 e!41384))

(declare-fun c!4415 () Bool)

(assert (=> d!19272 (= c!4415 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!19272 (= lt!97854 (_1!2921 e!41385))))

(declare-fun c!4416 () Bool)

(assert (=> d!19272 (= c!4416 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!19272 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!19272 (= (bitStreamReadBitsIntoList!0 (_2!2909 lt!96764) (_1!2908 lt!96769) #b0000000000000000000000000000000000000000000000000000000000000001) lt!97854)))

(assert (= (and d!19272 c!4416) b!62281))

(assert (= (and d!19272 (not c!4416)) b!62282))

(assert (= (and d!19272 c!4415) b!62283))

(assert (= (and d!19272 (not c!4415)) b!62284))

(declare-fun m!98565 () Bool)

(assert (=> b!62282 m!98565))

(declare-fun m!98567 () Bool)

(assert (=> b!62282 m!98567))

(declare-fun m!98569 () Bool)

(assert (=> b!62283 m!98569))

(declare-fun m!98571 () Bool)

(assert (=> b!62284 m!98571))

(assert (=> b!61753 d!19272))

(declare-fun d!19276 () Bool)

(assert (=> d!19276 (= (array_inv!1165 (buf!1649 thiss!1379)) (bvsge (size!1268 (buf!1649 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!61742 d!19276))

(declare-fun d!19278 () Bool)

(assert (=> d!19278 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1268 (buf!1649 thiss!1379))) ((_ sign_extend 32) (currentByte!3279 thiss!1379)) ((_ sign_extend 32) (currentBit!3274 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1268 (buf!1649 thiss!1379))) ((_ sign_extend 32) (currentByte!3279 thiss!1379)) ((_ sign_extend 32) (currentBit!3274 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4787 () Bool)

(assert (= bs!4787 d!19278))

(assert (=> bs!4787 m!97927))

(assert (=> b!61752 d!19278))

(push 1)

(assert (not d!19108))

(assert (not d!19074))

(assert (not b!62225))

(assert (not bm!787))

(assert (not b!61913))

(assert (not b!61916))

(assert (not b!62278))

(assert (not b!62227))

(assert (not b!61952))

(assert (not d!19254))

(assert (not d!19246))

(assert (not b!62257))

(assert (not b!61910))

(assert (not d!19078))

(assert (not b!61932))

(assert (not b!62226))

(assert (not b!61959))

(assert (not b!62236))

(assert (not b!62230))

(assert (not b!61909))

(assert (not b!61911))

(assert (not d!19256))

(assert (not d!19092))

(assert (not b!61969))

(assert (not d!19094))

(assert (not b!61948))

(assert (not d!19110))

(assert (not b!61962))

(assert (not b!61953))

(assert (not b!62224))

(assert (not d!19060))

(assert (not b!61951))

(assert (not b!61957))

(assert (not d!19096))

(assert (not b!61917))

(assert (not b!61914))

(assert (not b!62262))

(assert (not b!61919))

(assert (not b!61912))

(assert (not b!62232))

(assert (not b!61958))

(assert (not d!19278))

(assert (not b!62237))

(assert (not b!62264))

(assert (not d!19106))

(assert (not d!19248))

(assert (not d!19070))

(assert (not b!61949))

(assert (not b!61886))

(assert (not b!62235))

(assert (not b!61891))

(assert (not b!62234))

(assert (not b!61955))

(assert (not d!19086))

(assert (not b!62259))

(assert (not b!62282))

(assert (not b!61960))

(assert (not b!61950))

(assert (not b!62283))

(assert (not d!19098))

(assert (not d!19250))

(assert (not b!61930))

(assert (not b!61934))

(assert (not d!19058))

(assert (not d!19088))

(assert (not b!62229))

(assert (not b!61915))

(assert (not b!61967))

(assert (not b!61888))

(assert (not b!62239))

(assert (not b!61931))

(assert (not b!62284))

(assert (not d!19062))

(check-sat)

(pop 1)

(push 1)

(check-sat)

