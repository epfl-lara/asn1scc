; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!10018 () Bool)

(assert start!10018)

(declare-fun b!50694 () Bool)

(declare-fun res!42455 () Bool)

(declare-fun e!33502 () Bool)

(assert (=> b!50694 (=> res!42455 e!33502)))

(declare-datatypes ((array!2340 0))(
  ( (array!2341 (arr!1593 (Array (_ BitVec 32) (_ BitVec 8))) (size!1064 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1842 0))(
  ( (BitStream!1843 (buf!1419 array!2340) (currentByte!2942 (_ BitVec 32)) (currentBit!2937 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1842)

(declare-datatypes ((Unit!3503 0))(
  ( (Unit!3504) )
))
(declare-datatypes ((tuple2!4672 0))(
  ( (tuple2!4673 (_1!2441 Unit!3503) (_2!2441 BitStream!1842)) )
))
(declare-fun lt!78552 () tuple2!4672)

(assert (=> b!50694 (= res!42455 (not (= (size!1064 (buf!1419 thiss!1379)) (size!1064 (buf!1419 (_2!2441 lt!78552))))))))

(declare-fun b!50695 () Bool)

(declare-fun e!33512 () Bool)

(declare-fun lt!78548 () Bool)

(declare-fun lt!78545 () Bool)

(assert (=> b!50695 (= e!33512 (= lt!78548 lt!78545))))

(declare-fun lt!78543 () Bool)

(assert (=> b!50695 (= lt!78543 lt!78548)))

(declare-fun lt!78556 () (_ BitVec 64))

(declare-fun bitAt!0 (array!2340 (_ BitVec 64)) Bool)

(assert (=> b!50695 (= lt!78548 (bitAt!0 (buf!1419 (_2!2441 lt!78552)) lt!78556))))

(declare-fun lt!78539 () tuple2!4672)

(declare-fun lt!78536 () (_ BitVec 64))

(declare-fun lt!78541 () Unit!3503)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2340 array!2340 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!3503)

(assert (=> b!50695 (= lt!78541 (arrayBitRangesEqImpliesEq!0 (buf!1419 (_2!2441 lt!78539)) (buf!1419 (_2!2441 lt!78552)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!78556 lt!78536))))

(declare-fun srcBuffer!2 () array!2340)

(declare-fun b!50696 () Bool)

(declare-fun i!635 () (_ BitVec 64))

(declare-datatypes ((tuple2!4674 0))(
  ( (tuple2!4675 (_1!2442 BitStream!1842) (_2!2442 BitStream!1842)) )
))
(declare-fun lt!78555 () tuple2!4674)

(declare-fun e!33505 () Bool)

(declare-datatypes ((List!562 0))(
  ( (Nil!559) (Cons!558 (h!677 Bool) (t!1312 List!562)) )
))
(declare-fun head!381 (List!562) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1842 array!2340 (_ BitVec 64) (_ BitVec 64)) List!562)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1842 BitStream!1842 (_ BitVec 64)) List!562)

(assert (=> b!50696 (= e!33505 (= (head!381 (byteArrayBitContentToList!0 (_2!2441 lt!78539) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!381 (bitStreamReadBitsIntoList!0 (_2!2441 lt!78539) (_1!2442 lt!78555) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!50697 () Bool)

(declare-fun e!33510 () Bool)

(declare-fun e!33506 () Bool)

(assert (=> b!50697 (= e!33510 e!33506)))

(declare-fun res!42466 () Bool)

(assert (=> b!50697 (=> res!42466 e!33506)))

(declare-fun isPrefixOf!0 (BitStream!1842 BitStream!1842) Bool)

(assert (=> b!50697 (= res!42466 (not (isPrefixOf!0 thiss!1379 (_2!2441 lt!78539))))))

(declare-fun lt!78550 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!50697 (validate_offset_bits!1 ((_ sign_extend 32) (size!1064 (buf!1419 (_2!2441 lt!78539)))) ((_ sign_extend 32) (currentByte!2942 (_2!2441 lt!78539))) ((_ sign_extend 32) (currentBit!2937 (_2!2441 lt!78539))) lt!78550)))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!50697 (= lt!78550 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!78542 () Unit!3503)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1842 BitStream!1842 (_ BitVec 64) (_ BitVec 64)) Unit!3503)

(assert (=> b!50697 (= lt!78542 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2441 lt!78539) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1842 (_ BitVec 8) (_ BitVec 32)) tuple2!4672)

(assert (=> b!50697 (= lt!78539 (appendBitFromByte!0 thiss!1379 (select (arr!1593 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!50698 () Bool)

(declare-fun e!33499 () Bool)

(assert (=> b!50698 (= e!33499 e!33502)))

(declare-fun res!42465 () Bool)

(assert (=> b!50698 (=> res!42465 e!33502)))

(declare-fun lt!78534 () (_ BitVec 64))

(assert (=> b!50698 (= res!42465 (not (= lt!78534 (bvsub (bvadd lt!78556 to!314) i!635))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!50698 (= lt!78534 (bitIndex!0 (size!1064 (buf!1419 (_2!2441 lt!78552))) (currentByte!2942 (_2!2441 lt!78552)) (currentBit!2937 (_2!2441 lt!78552))))))

(declare-fun b!50699 () Bool)

(declare-fun res!42460 () Bool)

(declare-fun e!33508 () Bool)

(assert (=> b!50699 (=> (not res!42460) (not e!33508))))

(assert (=> b!50699 (= res!42460 (validate_offset_bits!1 ((_ sign_extend 32) (size!1064 (buf!1419 thiss!1379))) ((_ sign_extend 32) (currentByte!2942 thiss!1379)) ((_ sign_extend 32) (currentBit!2937 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!50700 () Bool)

(declare-fun res!42471 () Bool)

(declare-fun e!33503 () Bool)

(assert (=> b!50700 (=> res!42471 e!33503)))

(declare-fun lt!78546 () List!562)

(declare-fun length!257 (List!562) Int)

(assert (=> b!50700 (= res!42471 (<= (length!257 lt!78546) 0))))

(declare-fun res!42468 () Bool)

(assert (=> start!10018 (=> (not res!42468) (not e!33508))))

(assert (=> start!10018 (= res!42468 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1064 srcBuffer!2))))))))

(assert (=> start!10018 e!33508))

(assert (=> start!10018 true))

(declare-fun array_inv!974 (array!2340) Bool)

(assert (=> start!10018 (array_inv!974 srcBuffer!2)))

(declare-fun e!33507 () Bool)

(declare-fun inv!12 (BitStream!1842) Bool)

(assert (=> start!10018 (and (inv!12 thiss!1379) e!33507)))

(declare-fun b!50701 () Bool)

(declare-fun e!33504 () Bool)

(assert (=> b!50701 (= e!33503 e!33504)))

(declare-fun res!42467 () Bool)

(assert (=> b!50701 (=> res!42467 e!33504)))

(declare-fun lt!78553 () List!562)

(declare-fun lt!78537 () List!562)

(assert (=> b!50701 (= res!42467 (not (= lt!78553 lt!78537)))))

(assert (=> b!50701 (= lt!78537 lt!78553)))

(declare-fun tail!248 (List!562) List!562)

(assert (=> b!50701 (= lt!78553 (tail!248 lt!78546))))

(declare-fun lt!78540 () tuple2!4674)

(declare-fun lt!78535 () tuple2!4674)

(declare-fun lt!78549 () Unit!3503)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1842 BitStream!1842 BitStream!1842 BitStream!1842 (_ BitVec 64) List!562) Unit!3503)

(assert (=> b!50701 (= lt!78549 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2441 lt!78552) (_2!2441 lt!78552) (_1!2442 lt!78540) (_1!2442 lt!78535) (bvsub to!314 i!635) lt!78546))))

(declare-fun b!50702 () Bool)

(declare-fun res!42462 () Bool)

(assert (=> b!50702 (=> res!42462 e!33502)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!50702 (= res!42462 (not (invariant!0 (currentBit!2937 (_2!2441 lt!78552)) (currentByte!2942 (_2!2441 lt!78552)) (size!1064 (buf!1419 (_2!2441 lt!78552))))))))

(declare-fun b!50703 () Bool)

(assert (=> b!50703 (= e!33508 (not e!33510))))

(declare-fun res!42456 () Bool)

(assert (=> b!50703 (=> res!42456 e!33510)))

(assert (=> b!50703 (= res!42456 (bvsge i!635 to!314))))

(assert (=> b!50703 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!78533 () Unit!3503)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1842) Unit!3503)

(assert (=> b!50703 (= lt!78533 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!50703 (= lt!78556 (bitIndex!0 (size!1064 (buf!1419 thiss!1379)) (currentByte!2942 thiss!1379) (currentBit!2937 thiss!1379)))))

(declare-fun b!50704 () Bool)

(assert (=> b!50704 (= e!33507 (array_inv!974 (buf!1419 thiss!1379)))))

(declare-fun b!50705 () Bool)

(declare-fun e!33500 () Bool)

(assert (=> b!50705 (= e!33502 e!33500)))

(declare-fun res!42463 () Bool)

(assert (=> b!50705 (=> res!42463 e!33500)))

(assert (=> b!50705 (= res!42463 (not (= (size!1064 (buf!1419 (_2!2441 lt!78539))) (size!1064 (buf!1419 (_2!2441 lt!78552))))))))

(assert (=> b!50705 (= lt!78534 (bvsub (bvsub (bvadd lt!78536 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!50705 (= lt!78536 (bitIndex!0 (size!1064 (buf!1419 (_2!2441 lt!78539))) (currentByte!2942 (_2!2441 lt!78539)) (currentBit!2937 (_2!2441 lt!78539))))))

(assert (=> b!50705 (= (size!1064 (buf!1419 (_2!2441 lt!78552))) (size!1064 (buf!1419 thiss!1379)))))

(declare-fun b!50706 () Bool)

(declare-fun res!42464 () Bool)

(assert (=> b!50706 (=> res!42464 e!33500)))

(assert (=> b!50706 (= res!42464 (not (invariant!0 (currentBit!2937 (_2!2441 lt!78539)) (currentByte!2942 (_2!2441 lt!78539)) (size!1064 (buf!1419 (_2!2441 lt!78552))))))))

(declare-fun b!50707 () Bool)

(declare-fun e!33498 () Bool)

(declare-fun e!33511 () Bool)

(assert (=> b!50707 (= e!33498 e!33511)))

(declare-fun res!42454 () Bool)

(assert (=> b!50707 (=> res!42454 e!33511)))

(assert (=> b!50707 (= res!42454 (not (= (head!381 (byteArrayBitContentToList!0 (_2!2441 lt!78552) srcBuffer!2 i!635 (bvsub to!314 i!635))) lt!78545)))))

(assert (=> b!50707 (= lt!78545 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun b!50708 () Bool)

(assert (=> b!50708 (= e!33504 e!33498)))

(declare-fun res!42453 () Bool)

(assert (=> b!50708 (=> res!42453 e!33498)))

(declare-fun lt!78538 () Bool)

(assert (=> b!50708 (= res!42453 (not (= lt!78538 (bitAt!0 (buf!1419 (_1!2442 lt!78535)) lt!78556))))))

(assert (=> b!50708 (= lt!78538 (bitAt!0 (buf!1419 (_1!2442 lt!78540)) lt!78556))))

(declare-fun b!50709 () Bool)

(assert (=> b!50709 (= e!33500 e!33503)))

(declare-fun res!42461 () Bool)

(assert (=> b!50709 (=> res!42461 e!33503)))

(assert (=> b!50709 (= res!42461 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!50709 (= lt!78537 (bitStreamReadBitsIntoList!0 (_2!2441 lt!78552) (_1!2442 lt!78535) lt!78550))))

(assert (=> b!50709 (= lt!78546 (bitStreamReadBitsIntoList!0 (_2!2441 lt!78552) (_1!2442 lt!78540) (bvsub to!314 i!635)))))

(assert (=> b!50709 (validate_offset_bits!1 ((_ sign_extend 32) (size!1064 (buf!1419 (_2!2441 lt!78552)))) ((_ sign_extend 32) (currentByte!2942 (_2!2441 lt!78539))) ((_ sign_extend 32) (currentBit!2937 (_2!2441 lt!78539))) lt!78550)))

(declare-fun lt!78554 () Unit!3503)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1842 array!2340 (_ BitVec 64)) Unit!3503)

(assert (=> b!50709 (= lt!78554 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2441 lt!78539) (buf!1419 (_2!2441 lt!78552)) lt!78550))))

(declare-fun reader!0 (BitStream!1842 BitStream!1842) tuple2!4674)

(assert (=> b!50709 (= lt!78535 (reader!0 (_2!2441 lt!78539) (_2!2441 lt!78552)))))

(assert (=> b!50709 (validate_offset_bits!1 ((_ sign_extend 32) (size!1064 (buf!1419 (_2!2441 lt!78552)))) ((_ sign_extend 32) (currentByte!2942 thiss!1379)) ((_ sign_extend 32) (currentBit!2937 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!78551 () Unit!3503)

(assert (=> b!50709 (= lt!78551 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1419 (_2!2441 lt!78552)) (bvsub to!314 i!635)))))

(assert (=> b!50709 (= lt!78540 (reader!0 thiss!1379 (_2!2441 lt!78552)))))

(declare-fun b!50710 () Bool)

(declare-fun res!42470 () Bool)

(assert (=> b!50710 (=> res!42470 e!33500)))

(assert (=> b!50710 (= res!42470 (not (invariant!0 (currentBit!2937 (_2!2441 lt!78539)) (currentByte!2942 (_2!2441 lt!78539)) (size!1064 (buf!1419 (_2!2441 lt!78539))))))))

(declare-fun b!50711 () Bool)

(assert (=> b!50711 (= e!33511 e!33512)))

(declare-fun res!42459 () Bool)

(assert (=> b!50711 (=> res!42459 e!33512)))

(assert (=> b!50711 (= res!42459 (not (= lt!78543 lt!78545)))))

(assert (=> b!50711 (= lt!78543 (bitAt!0 (buf!1419 (_2!2441 lt!78539)) lt!78556))))

(declare-fun b!50712 () Bool)

(assert (=> b!50712 (= e!33506 e!33499)))

(declare-fun res!42457 () Bool)

(assert (=> b!50712 (=> res!42457 e!33499)))

(assert (=> b!50712 (= res!42457 (not (isPrefixOf!0 (_2!2441 lt!78539) (_2!2441 lt!78552))))))

(assert (=> b!50712 (isPrefixOf!0 thiss!1379 (_2!2441 lt!78552))))

(declare-fun lt!78547 () Unit!3503)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1842 BitStream!1842 BitStream!1842) Unit!3503)

(assert (=> b!50712 (= lt!78547 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2441 lt!78539) (_2!2441 lt!78552)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1842 array!2340 (_ BitVec 64) (_ BitVec 64)) tuple2!4672)

(assert (=> b!50712 (= lt!78552 (appendBitsMSBFirstLoop!0 (_2!2441 lt!78539) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!50712 e!33505))

(declare-fun res!42458 () Bool)

(assert (=> b!50712 (=> (not res!42458) (not e!33505))))

(assert (=> b!50712 (= res!42458 (validate_offset_bits!1 ((_ sign_extend 32) (size!1064 (buf!1419 (_2!2441 lt!78539)))) ((_ sign_extend 32) (currentByte!2942 thiss!1379)) ((_ sign_extend 32) (currentBit!2937 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!78544 () Unit!3503)

(assert (=> b!50712 (= lt!78544 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1419 (_2!2441 lt!78539)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!50712 (= lt!78555 (reader!0 thiss!1379 (_2!2441 lt!78539)))))

(declare-fun b!50713 () Bool)

(declare-fun res!42469 () Bool)

(assert (=> b!50713 (=> res!42469 e!33498)))

(assert (=> b!50713 (= res!42469 (not (= (head!381 lt!78546) lt!78538)))))

(assert (= (and start!10018 res!42468) b!50699))

(assert (= (and b!50699 res!42460) b!50703))

(assert (= (and b!50703 (not res!42456)) b!50697))

(assert (= (and b!50697 (not res!42466)) b!50712))

(assert (= (and b!50712 res!42458) b!50696))

(assert (= (and b!50712 (not res!42457)) b!50698))

(assert (= (and b!50698 (not res!42465)) b!50702))

(assert (= (and b!50702 (not res!42462)) b!50694))

(assert (= (and b!50694 (not res!42455)) b!50705))

(assert (= (and b!50705 (not res!42463)) b!50710))

(assert (= (and b!50710 (not res!42470)) b!50706))

(assert (= (and b!50706 (not res!42464)) b!50709))

(assert (= (and b!50709 (not res!42461)) b!50700))

(assert (= (and b!50700 (not res!42471)) b!50701))

(assert (= (and b!50701 (not res!42467)) b!50708))

(assert (= (and b!50708 (not res!42453)) b!50713))

(assert (= (and b!50713 (not res!42469)) b!50707))

(assert (= (and b!50707 (not res!42454)) b!50711))

(assert (= (and b!50711 (not res!42459)) b!50695))

(assert (= start!10018 b!50704))

(declare-fun m!79755 () Bool)

(assert (=> b!50712 m!79755))

(declare-fun m!79757 () Bool)

(assert (=> b!50712 m!79757))

(declare-fun m!79759 () Bool)

(assert (=> b!50712 m!79759))

(declare-fun m!79761 () Bool)

(assert (=> b!50712 m!79761))

(declare-fun m!79763 () Bool)

(assert (=> b!50712 m!79763))

(declare-fun m!79765 () Bool)

(assert (=> b!50712 m!79765))

(declare-fun m!79767 () Bool)

(assert (=> b!50712 m!79767))

(declare-fun m!79769 () Bool)

(assert (=> b!50699 m!79769))

(declare-fun m!79771 () Bool)

(assert (=> b!50695 m!79771))

(declare-fun m!79773 () Bool)

(assert (=> b!50695 m!79773))

(declare-fun m!79775 () Bool)

(assert (=> b!50705 m!79775))

(declare-fun m!79777 () Bool)

(assert (=> b!50708 m!79777))

(declare-fun m!79779 () Bool)

(assert (=> b!50708 m!79779))

(declare-fun m!79781 () Bool)

(assert (=> b!50713 m!79781))

(declare-fun m!79783 () Bool)

(assert (=> b!50709 m!79783))

(declare-fun m!79785 () Bool)

(assert (=> b!50709 m!79785))

(declare-fun m!79787 () Bool)

(assert (=> b!50709 m!79787))

(declare-fun m!79789 () Bool)

(assert (=> b!50709 m!79789))

(declare-fun m!79791 () Bool)

(assert (=> b!50709 m!79791))

(declare-fun m!79793 () Bool)

(assert (=> b!50709 m!79793))

(declare-fun m!79795 () Bool)

(assert (=> b!50709 m!79795))

(declare-fun m!79797 () Bool)

(assert (=> b!50709 m!79797))

(declare-fun m!79799 () Bool)

(assert (=> b!50706 m!79799))

(declare-fun m!79801 () Bool)

(assert (=> b!50696 m!79801))

(assert (=> b!50696 m!79801))

(declare-fun m!79803 () Bool)

(assert (=> b!50696 m!79803))

(declare-fun m!79805 () Bool)

(assert (=> b!50696 m!79805))

(assert (=> b!50696 m!79805))

(declare-fun m!79807 () Bool)

(assert (=> b!50696 m!79807))

(declare-fun m!79809 () Bool)

(assert (=> b!50698 m!79809))

(declare-fun m!79811 () Bool)

(assert (=> start!10018 m!79811))

(declare-fun m!79813 () Bool)

(assert (=> start!10018 m!79813))

(declare-fun m!79815 () Bool)

(assert (=> b!50700 m!79815))

(declare-fun m!79817 () Bool)

(assert (=> b!50711 m!79817))

(declare-fun m!79819 () Bool)

(assert (=> b!50703 m!79819))

(declare-fun m!79821 () Bool)

(assert (=> b!50703 m!79821))

(declare-fun m!79823 () Bool)

(assert (=> b!50703 m!79823))

(declare-fun m!79825 () Bool)

(assert (=> b!50702 m!79825))

(declare-fun m!79827 () Bool)

(assert (=> b!50697 m!79827))

(declare-fun m!79829 () Bool)

(assert (=> b!50697 m!79829))

(declare-fun m!79831 () Bool)

(assert (=> b!50697 m!79831))

(assert (=> b!50697 m!79829))

(declare-fun m!79833 () Bool)

(assert (=> b!50697 m!79833))

(declare-fun m!79835 () Bool)

(assert (=> b!50697 m!79835))

(declare-fun m!79837 () Bool)

(assert (=> b!50707 m!79837))

(assert (=> b!50707 m!79837))

(declare-fun m!79839 () Bool)

(assert (=> b!50707 m!79839))

(declare-fun m!79841 () Bool)

(assert (=> b!50707 m!79841))

(declare-fun m!79843 () Bool)

(assert (=> b!50710 m!79843))

(declare-fun m!79845 () Bool)

(assert (=> b!50704 m!79845))

(declare-fun m!79847 () Bool)

(assert (=> b!50701 m!79847))

(declare-fun m!79849 () Bool)

(assert (=> b!50701 m!79849))

(check-sat (not b!50699) (not b!50708) (not b!50704) (not b!50709) (not b!50701) (not b!50707) (not b!50706) (not b!50705) (not b!50710) (not b!50696) (not b!50700) (not b!50713) (not b!50711) (not b!50712) (not b!50697) (not b!50695) (not start!10018) (not b!50703) (not b!50702) (not b!50698))
