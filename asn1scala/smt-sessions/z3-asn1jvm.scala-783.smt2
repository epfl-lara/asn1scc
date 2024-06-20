; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22460 () Bool)

(assert start!22460)

(declare-fun b!113647 () Bool)

(declare-fun e!74561 () Bool)

(declare-datatypes ((array!5167 0))(
  ( (array!5168 (arr!2941 (Array (_ BitVec 32) (_ BitVec 8))) (size!2348 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4170 0))(
  ( (BitStream!4171 (buf!2756 array!5167) (currentByte!5342 (_ BitVec 32)) (currentBit!5337 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!6981 0))(
  ( (Unit!6982) )
))
(declare-datatypes ((tuple2!9370 0))(
  ( (tuple2!9371 (_1!4947 Unit!6981) (_2!4947 BitStream!4170)) )
))
(declare-fun lt!172659 () tuple2!9370)

(declare-fun lt!172660 () tuple2!9370)

(assert (=> b!113647 (= e!74561 (not (= (size!2348 (buf!2756 (_2!4947 lt!172659))) (size!2348 (buf!2756 (_2!4947 lt!172660))))))))

(declare-fun e!74557 () Bool)

(assert (=> b!113647 e!74557))

(declare-fun res!93868 () Bool)

(assert (=> b!113647 (=> (not res!93868) (not e!74557))))

(declare-fun thiss!1305 () BitStream!4170)

(declare-fun isPrefixOf!0 (BitStream!4170 BitStream!4170) Bool)

(assert (=> b!113647 (= res!93868 (isPrefixOf!0 thiss!1305 (_2!4947 lt!172660)))))

(declare-fun lt!172658 () Unit!6981)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4170 BitStream!4170 BitStream!4170) Unit!6981)

(assert (=> b!113647 (= lt!172658 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4947 lt!172659) (_2!4947 lt!172660)))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4170 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9370)

(assert (=> b!113647 (= lt!172660 (appendNLeastSignificantBitsLoop!0 (_2!4947 lt!172659) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!74559 () Bool)

(assert (=> b!113647 e!74559))

(declare-fun res!93875 () Bool)

(assert (=> b!113647 (=> (not res!93875) (not e!74559))))

(assert (=> b!113647 (= res!93875 (= (size!2348 (buf!2756 thiss!1305)) (size!2348 (buf!2756 (_2!4947 lt!172659)))))))

(declare-fun lt!172663 () Bool)

(declare-fun appendBit!0 (BitStream!4170 Bool) tuple2!9370)

(assert (=> b!113647 (= lt!172659 (appendBit!0 thiss!1305 lt!172663))))

(assert (=> b!113647 (= lt!172663 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!113648 () Bool)

(declare-fun e!74558 () Bool)

(declare-datatypes ((tuple2!9372 0))(
  ( (tuple2!9373 (_1!4948 BitStream!4170) (_2!4948 Bool)) )
))
(declare-fun lt!172661 () tuple2!9372)

(declare-fun lt!172662 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!113648 (= e!74558 (= (bitIndex!0 (size!2348 (buf!2756 (_1!4948 lt!172661))) (currentByte!5342 (_1!4948 lt!172661)) (currentBit!5337 (_1!4948 lt!172661))) lt!172662))))

(declare-fun b!113649 () Bool)

(declare-fun res!93869 () Bool)

(assert (=> b!113649 (=> (not res!93869) (not e!74561))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!113649 (= res!93869 (validate_offset_bits!1 ((_ sign_extend 32) (size!2348 (buf!2756 thiss!1305))) ((_ sign_extend 32) (currentByte!5342 thiss!1305)) ((_ sign_extend 32) (currentBit!5337 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!113650 () Bool)

(declare-fun e!74556 () Bool)

(assert (=> b!113650 (= e!74559 e!74556)))

(declare-fun res!93872 () Bool)

(assert (=> b!113650 (=> (not res!93872) (not e!74556))))

(declare-fun lt!172664 () (_ BitVec 64))

(assert (=> b!113650 (= res!93872 (= lt!172662 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!172664)))))

(assert (=> b!113650 (= lt!172662 (bitIndex!0 (size!2348 (buf!2756 (_2!4947 lt!172659))) (currentByte!5342 (_2!4947 lt!172659)) (currentBit!5337 (_2!4947 lt!172659))))))

(assert (=> b!113650 (= lt!172664 (bitIndex!0 (size!2348 (buf!2756 thiss!1305)) (currentByte!5342 thiss!1305) (currentBit!5337 thiss!1305)))))

(declare-fun b!113651 () Bool)

(assert (=> b!113651 (= e!74556 e!74558)))

(declare-fun res!93873 () Bool)

(assert (=> b!113651 (=> (not res!93873) (not e!74558))))

(assert (=> b!113651 (= res!93873 (and (= (_2!4948 lt!172661) lt!172663) (= (_1!4948 lt!172661) (_2!4947 lt!172659))))))

(declare-fun readBitPure!0 (BitStream!4170) tuple2!9372)

(declare-fun readerFrom!0 (BitStream!4170 (_ BitVec 32) (_ BitVec 32)) BitStream!4170)

(assert (=> b!113651 (= lt!172661 (readBitPure!0 (readerFrom!0 (_2!4947 lt!172659) (currentBit!5337 thiss!1305) (currentByte!5342 thiss!1305))))))

(declare-fun b!113652 () Bool)

(declare-fun res!93867 () Bool)

(assert (=> b!113652 (=> (not res!93867) (not e!74556))))

(assert (=> b!113652 (= res!93867 (isPrefixOf!0 thiss!1305 (_2!4947 lt!172659)))))

(declare-fun b!113653 () Bool)

(declare-fun res!93874 () Bool)

(assert (=> b!113653 (=> (not res!93874) (not e!74561))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!113653 (= res!93874 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!113654 () Bool)

(declare-fun res!93870 () Bool)

(assert (=> b!113654 (=> (not res!93870) (not e!74561))))

(assert (=> b!113654 (= res!93870 (bvslt i!615 nBits!396))))

(declare-fun b!113655 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!113655 (= e!74557 (invariant!0 (currentBit!5337 thiss!1305) (currentByte!5342 thiss!1305) (size!2348 (buf!2756 (_2!4947 lt!172659)))))))

(declare-fun res!93871 () Bool)

(assert (=> start!22460 (=> (not res!93871) (not e!74561))))

(assert (=> start!22460 (= res!93871 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!22460 e!74561))

(assert (=> start!22460 true))

(declare-fun e!74562 () Bool)

(declare-fun inv!12 (BitStream!4170) Bool)

(assert (=> start!22460 (and (inv!12 thiss!1305) e!74562)))

(declare-fun b!113656 () Bool)

(declare-fun array_inv!2150 (array!5167) Bool)

(assert (=> b!113656 (= e!74562 (array_inv!2150 (buf!2756 thiss!1305)))))

(assert (= (and start!22460 res!93871) b!113649))

(assert (= (and b!113649 res!93869) b!113653))

(assert (= (and b!113653 res!93874) b!113654))

(assert (= (and b!113654 res!93870) b!113647))

(assert (= (and b!113647 res!93875) b!113650))

(assert (= (and b!113650 res!93872) b!113652))

(assert (= (and b!113652 res!93867) b!113651))

(assert (= (and b!113651 res!93873) b!113648))

(assert (= (and b!113647 res!93868) b!113655))

(assert (= start!22460 b!113656))

(declare-fun m!169777 () Bool)

(assert (=> b!113647 m!169777))

(declare-fun m!169779 () Bool)

(assert (=> b!113647 m!169779))

(declare-fun m!169781 () Bool)

(assert (=> b!113647 m!169781))

(declare-fun m!169783 () Bool)

(assert (=> b!113647 m!169783))

(declare-fun m!169785 () Bool)

(assert (=> b!113655 m!169785))

(declare-fun m!169787 () Bool)

(assert (=> start!22460 m!169787))

(declare-fun m!169789 () Bool)

(assert (=> b!113652 m!169789))

(declare-fun m!169791 () Bool)

(assert (=> b!113650 m!169791))

(declare-fun m!169793 () Bool)

(assert (=> b!113650 m!169793))

(declare-fun m!169795 () Bool)

(assert (=> b!113656 m!169795))

(declare-fun m!169797 () Bool)

(assert (=> b!113651 m!169797))

(assert (=> b!113651 m!169797))

(declare-fun m!169799 () Bool)

(assert (=> b!113651 m!169799))

(declare-fun m!169801 () Bool)

(assert (=> b!113653 m!169801))

(declare-fun m!169803 () Bool)

(assert (=> b!113648 m!169803))

(declare-fun m!169805 () Bool)

(assert (=> b!113649 m!169805))

(check-sat (not b!113651) (not b!113648) (not b!113656) (not start!22460) (not b!113653) (not b!113652) (not b!113647) (not b!113649) (not b!113655) (not b!113650))
(check-sat)
(get-model)

(declare-fun d!36486 () Bool)

(declare-datatypes ((tuple2!9378 0))(
  ( (tuple2!9379 (_1!4951 Bool) (_2!4951 BitStream!4170)) )
))
(declare-fun lt!172688 () tuple2!9378)

(declare-fun readBit!0 (BitStream!4170) tuple2!9378)

(assert (=> d!36486 (= lt!172688 (readBit!0 (readerFrom!0 (_2!4947 lt!172659) (currentBit!5337 thiss!1305) (currentByte!5342 thiss!1305))))))

(assert (=> d!36486 (= (readBitPure!0 (readerFrom!0 (_2!4947 lt!172659) (currentBit!5337 thiss!1305) (currentByte!5342 thiss!1305))) (tuple2!9373 (_2!4951 lt!172688) (_1!4951 lt!172688)))))

(declare-fun bs!8871 () Bool)

(assert (= bs!8871 d!36486))

(assert (=> bs!8871 m!169797))

(declare-fun m!169837 () Bool)

(assert (=> bs!8871 m!169837))

(assert (=> b!113651 d!36486))

(declare-fun d!36488 () Bool)

(declare-fun e!74586 () Bool)

(assert (=> d!36488 e!74586))

(declare-fun res!93906 () Bool)

(assert (=> d!36488 (=> (not res!93906) (not e!74586))))

(assert (=> d!36488 (= res!93906 (invariant!0 (currentBit!5337 (_2!4947 lt!172659)) (currentByte!5342 (_2!4947 lt!172659)) (size!2348 (buf!2756 (_2!4947 lt!172659)))))))

(assert (=> d!36488 (= (readerFrom!0 (_2!4947 lt!172659) (currentBit!5337 thiss!1305) (currentByte!5342 thiss!1305)) (BitStream!4171 (buf!2756 (_2!4947 lt!172659)) (currentByte!5342 thiss!1305) (currentBit!5337 thiss!1305)))))

(declare-fun b!113689 () Bool)

(assert (=> b!113689 (= e!74586 (invariant!0 (currentBit!5337 thiss!1305) (currentByte!5342 thiss!1305) (size!2348 (buf!2756 (_2!4947 lt!172659)))))))

(assert (= (and d!36488 res!93906) b!113689))

(declare-fun m!169839 () Bool)

(assert (=> d!36488 m!169839))

(assert (=> b!113689 m!169785))

(assert (=> b!113651 d!36488))

(declare-fun d!36490 () Bool)

(assert (=> d!36490 (= (array_inv!2150 (buf!2756 thiss!1305)) (bvsge (size!2348 (buf!2756 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!113656 d!36490))

(declare-fun d!36492 () Bool)

(assert (=> d!36492 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5337 thiss!1305) (currentByte!5342 thiss!1305) (size!2348 (buf!2756 thiss!1305))))))

(declare-fun bs!8872 () Bool)

(assert (= bs!8872 d!36492))

(declare-fun m!169841 () Bool)

(assert (=> bs!8872 m!169841))

(assert (=> start!22460 d!36492))

(declare-fun d!36494 () Bool)

(assert (=> d!36494 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!113653 d!36494))

(declare-fun d!36496 () Bool)

(declare-fun res!93913 () Bool)

(declare-fun e!74592 () Bool)

(assert (=> d!36496 (=> (not res!93913) (not e!74592))))

(assert (=> d!36496 (= res!93913 (= (size!2348 (buf!2756 thiss!1305)) (size!2348 (buf!2756 (_2!4947 lt!172660)))))))

(assert (=> d!36496 (= (isPrefixOf!0 thiss!1305 (_2!4947 lt!172660)) e!74592)))

(declare-fun b!113696 () Bool)

(declare-fun res!93915 () Bool)

(assert (=> b!113696 (=> (not res!93915) (not e!74592))))

(assert (=> b!113696 (= res!93915 (bvsle (bitIndex!0 (size!2348 (buf!2756 thiss!1305)) (currentByte!5342 thiss!1305) (currentBit!5337 thiss!1305)) (bitIndex!0 (size!2348 (buf!2756 (_2!4947 lt!172660))) (currentByte!5342 (_2!4947 lt!172660)) (currentBit!5337 (_2!4947 lt!172660)))))))

(declare-fun b!113697 () Bool)

(declare-fun e!74591 () Bool)

(assert (=> b!113697 (= e!74592 e!74591)))

(declare-fun res!93914 () Bool)

(assert (=> b!113697 (=> res!93914 e!74591)))

(assert (=> b!113697 (= res!93914 (= (size!2348 (buf!2756 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!113698 () Bool)

(declare-fun arrayBitRangesEq!0 (array!5167 array!5167 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!113698 (= e!74591 (arrayBitRangesEq!0 (buf!2756 thiss!1305) (buf!2756 (_2!4947 lt!172660)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2348 (buf!2756 thiss!1305)) (currentByte!5342 thiss!1305) (currentBit!5337 thiss!1305))))))

(assert (= (and d!36496 res!93913) b!113696))

(assert (= (and b!113696 res!93915) b!113697))

(assert (= (and b!113697 (not res!93914)) b!113698))

(assert (=> b!113696 m!169793))

(declare-fun m!169843 () Bool)

(assert (=> b!113696 m!169843))

(assert (=> b!113698 m!169793))

(assert (=> b!113698 m!169793))

(declare-fun m!169845 () Bool)

(assert (=> b!113698 m!169845))

(assert (=> b!113647 d!36496))

(declare-fun d!36498 () Bool)

(assert (=> d!36498 (isPrefixOf!0 thiss!1305 (_2!4947 lt!172660))))

(declare-fun lt!172691 () Unit!6981)

(declare-fun choose!30 (BitStream!4170 BitStream!4170 BitStream!4170) Unit!6981)

(assert (=> d!36498 (= lt!172691 (choose!30 thiss!1305 (_2!4947 lt!172659) (_2!4947 lt!172660)))))

(assert (=> d!36498 (isPrefixOf!0 thiss!1305 (_2!4947 lt!172659))))

(assert (=> d!36498 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4947 lt!172659) (_2!4947 lt!172660)) lt!172691)))

(declare-fun bs!8873 () Bool)

(assert (= bs!8873 d!36498))

(assert (=> bs!8873 m!169777))

(declare-fun m!169847 () Bool)

(assert (=> bs!8873 m!169847))

(assert (=> bs!8873 m!169789))

(assert (=> b!113647 d!36498))

(declare-fun b!113765 () Bool)

(declare-fun e!74639 () Bool)

(declare-fun lt!172856 () tuple2!9372)

(declare-fun lt!172852 () tuple2!9370)

(assert (=> b!113765 (= e!74639 (= (bitIndex!0 (size!2348 (buf!2756 (_1!4948 lt!172856))) (currentByte!5342 (_1!4948 lt!172856)) (currentBit!5337 (_1!4948 lt!172856))) (bitIndex!0 (size!2348 (buf!2756 (_2!4947 lt!172852))) (currentByte!5342 (_2!4947 lt!172852)) (currentBit!5337 (_2!4947 lt!172852)))))))

(declare-fun b!113766 () Bool)

(declare-fun e!74636 () tuple2!9370)

(declare-fun lt!172859 () Unit!6981)

(assert (=> b!113766 (= e!74636 (tuple2!9371 lt!172859 (_2!4947 lt!172659)))))

(declare-fun lt!172858 () BitStream!4170)

(assert (=> b!113766 (= lt!172858 (_2!4947 lt!172659))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4170) Unit!6981)

(assert (=> b!113766 (= lt!172859 (lemmaIsPrefixRefl!0 lt!172858))))

(declare-fun call!1451 () Bool)

(assert (=> b!113766 call!1451))

(declare-fun b!113767 () Bool)

(declare-fun e!74634 () Bool)

(declare-datatypes ((tuple2!9380 0))(
  ( (tuple2!9381 (_1!4952 BitStream!4170) (_2!4952 (_ BitVec 64))) )
))
(declare-fun lt!172846 () tuple2!9380)

(declare-datatypes ((tuple2!9382 0))(
  ( (tuple2!9383 (_1!4953 BitStream!4170) (_2!4953 BitStream!4170)) )
))
(declare-fun lt!172836 () tuple2!9382)

(assert (=> b!113767 (= e!74634 (and (= (_2!4952 lt!172846) v!199) (= (_1!4952 lt!172846) (_2!4953 lt!172836))))))

(declare-fun lt!172847 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4170 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9380)

(assert (=> b!113767 (= lt!172846 (readNLeastSignificantBitsLoopPure!0 (_1!4953 lt!172836) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!172847))))

(declare-fun lt!172834 () Unit!6981)

(declare-fun lt!172830 () Unit!6981)

(assert (=> b!113767 (= lt!172834 lt!172830)))

(declare-fun lt!172850 () tuple2!9370)

(declare-fun lt!172824 () (_ BitVec 64))

(assert (=> b!113767 (validate_offset_bits!1 ((_ sign_extend 32) (size!2348 (buf!2756 (_2!4947 lt!172850)))) ((_ sign_extend 32) (currentByte!5342 (_2!4947 lt!172659))) ((_ sign_extend 32) (currentBit!5337 (_2!4947 lt!172659))) lt!172824)))

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4170 array!5167 (_ BitVec 64)) Unit!6981)

(assert (=> b!113767 (= lt!172830 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4947 lt!172659) (buf!2756 (_2!4947 lt!172850)) lt!172824))))

(declare-fun e!74635 () Bool)

(assert (=> b!113767 e!74635))

(declare-fun res!93976 () Bool)

(assert (=> b!113767 (=> (not res!93976) (not e!74635))))

(assert (=> b!113767 (= res!93976 (and (= (size!2348 (buf!2756 (_2!4947 lt!172659))) (size!2348 (buf!2756 (_2!4947 lt!172850)))) (bvsge lt!172824 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!113767 (= lt!172824 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!113767 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!113767 (= lt!172847 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!113767 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(declare-fun reader!0 (BitStream!4170 BitStream!4170) tuple2!9382)

(assert (=> b!113767 (= lt!172836 (reader!0 (_2!4947 lt!172659) (_2!4947 lt!172850)))))

(declare-fun b!113768 () Bool)

(assert (=> b!113768 (= e!74635 (validate_offset_bits!1 ((_ sign_extend 32) (size!2348 (buf!2756 (_2!4947 lt!172659)))) ((_ sign_extend 32) (currentByte!5342 (_2!4947 lt!172659))) ((_ sign_extend 32) (currentBit!5337 (_2!4947 lt!172659))) lt!172824))))

(declare-fun b!113769 () Bool)

(declare-fun e!74637 () (_ BitVec 64))

(assert (=> b!113769 (= e!74637 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!113770 () Bool)

(declare-fun lt!172864 () tuple2!9370)

(declare-fun Unit!6985 () Unit!6981)

(assert (=> b!113770 (= e!74636 (tuple2!9371 Unit!6985 (_2!4947 lt!172864)))))

(declare-fun lt!172835 () Bool)

(assert (=> b!113770 (= lt!172835 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!113770 (= lt!172852 (appendBit!0 (_2!4947 lt!172659) lt!172835))))

(declare-fun res!93979 () Bool)

(assert (=> b!113770 (= res!93979 (= (size!2348 (buf!2756 (_2!4947 lt!172659))) (size!2348 (buf!2756 (_2!4947 lt!172852)))))))

(declare-fun e!74640 () Bool)

(assert (=> b!113770 (=> (not res!93979) (not e!74640))))

(assert (=> b!113770 e!74640))

(declare-fun lt!172866 () tuple2!9370)

(assert (=> b!113770 (= lt!172866 lt!172852)))

(assert (=> b!113770 (= lt!172864 (appendNLeastSignificantBitsLoop!0 (_2!4947 lt!172866) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!172861 () Unit!6981)

(assert (=> b!113770 (= lt!172861 (lemmaIsPrefixTransitive!0 (_2!4947 lt!172659) (_2!4947 lt!172866) (_2!4947 lt!172864)))))

(assert (=> b!113770 (isPrefixOf!0 (_2!4947 lt!172659) (_2!4947 lt!172864))))

(declare-fun lt!172844 () Unit!6981)

(assert (=> b!113770 (= lt!172844 lt!172861)))

(assert (=> b!113770 (invariant!0 (currentBit!5337 (_2!4947 lt!172659)) (currentByte!5342 (_2!4947 lt!172659)) (size!2348 (buf!2756 (_2!4947 lt!172866))))))

(declare-fun lt!172829 () BitStream!4170)

(assert (=> b!113770 (= lt!172829 (BitStream!4171 (buf!2756 (_2!4947 lt!172866)) (currentByte!5342 (_2!4947 lt!172659)) (currentBit!5337 (_2!4947 lt!172659))))))

(assert (=> b!113770 (invariant!0 (currentBit!5337 lt!172829) (currentByte!5342 lt!172829) (size!2348 (buf!2756 (_2!4947 lt!172864))))))

(declare-fun lt!172832 () BitStream!4170)

(assert (=> b!113770 (= lt!172832 (BitStream!4171 (buf!2756 (_2!4947 lt!172864)) (currentByte!5342 lt!172829) (currentBit!5337 lt!172829)))))

(declare-fun lt!172828 () tuple2!9372)

(assert (=> b!113770 (= lt!172828 (readBitPure!0 lt!172829))))

(declare-fun lt!172826 () tuple2!9372)

(assert (=> b!113770 (= lt!172826 (readBitPure!0 lt!172832))))

(declare-fun lt!172855 () Unit!6981)

(declare-fun readBitPrefixLemma!0 (BitStream!4170 BitStream!4170) Unit!6981)

(assert (=> b!113770 (= lt!172855 (readBitPrefixLemma!0 lt!172829 (_2!4947 lt!172864)))))

(declare-fun res!93982 () Bool)

(assert (=> b!113770 (= res!93982 (= (bitIndex!0 (size!2348 (buf!2756 (_1!4948 lt!172828))) (currentByte!5342 (_1!4948 lt!172828)) (currentBit!5337 (_1!4948 lt!172828))) (bitIndex!0 (size!2348 (buf!2756 (_1!4948 lt!172826))) (currentByte!5342 (_1!4948 lt!172826)) (currentBit!5337 (_1!4948 lt!172826)))))))

(declare-fun e!74638 () Bool)

(assert (=> b!113770 (=> (not res!93982) (not e!74638))))

(assert (=> b!113770 e!74638))

(declare-fun lt!172862 () Unit!6981)

(assert (=> b!113770 (= lt!172862 lt!172855)))

(declare-fun lt!172833 () tuple2!9382)

(assert (=> b!113770 (= lt!172833 (reader!0 (_2!4947 lt!172659) (_2!4947 lt!172864)))))

(declare-fun lt!172848 () tuple2!9382)

(assert (=> b!113770 (= lt!172848 (reader!0 (_2!4947 lt!172866) (_2!4947 lt!172864)))))

(declare-fun lt!172857 () tuple2!9372)

(assert (=> b!113770 (= lt!172857 (readBitPure!0 (_1!4953 lt!172833)))))

(assert (=> b!113770 (= (_2!4948 lt!172857) lt!172835)))

(declare-fun lt!172837 () Unit!6981)

(declare-fun Unit!6986 () Unit!6981)

(assert (=> b!113770 (= lt!172837 Unit!6986)))

(declare-fun lt!172841 () (_ BitVec 64))

(assert (=> b!113770 (= lt!172841 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!172827 () (_ BitVec 64))

(assert (=> b!113770 (= lt!172827 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!172845 () Unit!6981)

(assert (=> b!113770 (= lt!172845 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4947 lt!172659) (buf!2756 (_2!4947 lt!172864)) lt!172827))))

(assert (=> b!113770 (validate_offset_bits!1 ((_ sign_extend 32) (size!2348 (buf!2756 (_2!4947 lt!172864)))) ((_ sign_extend 32) (currentByte!5342 (_2!4947 lt!172659))) ((_ sign_extend 32) (currentBit!5337 (_2!4947 lt!172659))) lt!172827)))

(declare-fun lt!172839 () Unit!6981)

(assert (=> b!113770 (= lt!172839 lt!172845)))

(declare-fun lt!172831 () tuple2!9380)

(assert (=> b!113770 (= lt!172831 (readNLeastSignificantBitsLoopPure!0 (_1!4953 lt!172833) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!172841))))

(declare-fun lt!172840 () (_ BitVec 64))

(assert (=> b!113770 (= lt!172840 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!172854 () Unit!6981)

(assert (=> b!113770 (= lt!172854 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4947 lt!172866) (buf!2756 (_2!4947 lt!172864)) lt!172840))))

(assert (=> b!113770 (validate_offset_bits!1 ((_ sign_extend 32) (size!2348 (buf!2756 (_2!4947 lt!172864)))) ((_ sign_extend 32) (currentByte!5342 (_2!4947 lt!172866))) ((_ sign_extend 32) (currentBit!5337 (_2!4947 lt!172866))) lt!172840)))

(declare-fun lt!172868 () Unit!6981)

(assert (=> b!113770 (= lt!172868 lt!172854)))

(declare-fun lt!172853 () tuple2!9380)

(assert (=> b!113770 (= lt!172853 (readNLeastSignificantBitsLoopPure!0 (_1!4953 lt!172848) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!172841 (ite (_2!4948 lt!172857) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!172851 () tuple2!9380)

(assert (=> b!113770 (= lt!172851 (readNLeastSignificantBitsLoopPure!0 (_1!4953 lt!172833) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!172841))))

(declare-fun c!6894 () Bool)

(assert (=> b!113770 (= c!6894 (_2!4948 (readBitPure!0 (_1!4953 lt!172833))))))

(declare-fun lt!172849 () tuple2!9380)

(declare-fun withMovedBitIndex!0 (BitStream!4170 (_ BitVec 64)) BitStream!4170)

(assert (=> b!113770 (= lt!172849 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4953 lt!172833) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!172841 e!74637)))))

(declare-fun lt!172843 () Unit!6981)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4170 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6981)

(assert (=> b!113770 (= lt!172843 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4953 lt!172833) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!172841))))

(assert (=> b!113770 (and (= (_2!4952 lt!172851) (_2!4952 lt!172849)) (= (_1!4952 lt!172851) (_1!4952 lt!172849)))))

(declare-fun lt!172865 () Unit!6981)

(assert (=> b!113770 (= lt!172865 lt!172843)))

(assert (=> b!113770 (= (_1!4953 lt!172833) (withMovedBitIndex!0 (_2!4953 lt!172833) (bvsub (bitIndex!0 (size!2348 (buf!2756 (_2!4947 lt!172659))) (currentByte!5342 (_2!4947 lt!172659)) (currentBit!5337 (_2!4947 lt!172659))) (bitIndex!0 (size!2348 (buf!2756 (_2!4947 lt!172864))) (currentByte!5342 (_2!4947 lt!172864)) (currentBit!5337 (_2!4947 lt!172864))))))))

(declare-fun lt!172842 () Unit!6981)

(declare-fun Unit!6987 () Unit!6981)

(assert (=> b!113770 (= lt!172842 Unit!6987)))

(assert (=> b!113770 (= (_1!4953 lt!172848) (withMovedBitIndex!0 (_2!4953 lt!172848) (bvsub (bitIndex!0 (size!2348 (buf!2756 (_2!4947 lt!172866))) (currentByte!5342 (_2!4947 lt!172866)) (currentBit!5337 (_2!4947 lt!172866))) (bitIndex!0 (size!2348 (buf!2756 (_2!4947 lt!172864))) (currentByte!5342 (_2!4947 lt!172864)) (currentBit!5337 (_2!4947 lt!172864))))))))

(declare-fun lt!172860 () Unit!6981)

(declare-fun Unit!6988 () Unit!6981)

(assert (=> b!113770 (= lt!172860 Unit!6988)))

(assert (=> b!113770 (= (bitIndex!0 (size!2348 (buf!2756 (_2!4947 lt!172659))) (currentByte!5342 (_2!4947 lt!172659)) (currentBit!5337 (_2!4947 lt!172659))) (bvsub (bitIndex!0 (size!2348 (buf!2756 (_2!4947 lt!172866))) (currentByte!5342 (_2!4947 lt!172866)) (currentBit!5337 (_2!4947 lt!172866))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!172867 () Unit!6981)

(declare-fun Unit!6989 () Unit!6981)

(assert (=> b!113770 (= lt!172867 Unit!6989)))

(assert (=> b!113770 (= (_2!4952 lt!172831) (_2!4952 lt!172853))))

(declare-fun lt!172825 () Unit!6981)

(declare-fun Unit!6990 () Unit!6981)

(assert (=> b!113770 (= lt!172825 Unit!6990)))

(assert (=> b!113770 (= (_1!4952 lt!172831) (_2!4953 lt!172833))))

(declare-fun b!113771 () Bool)

(assert (=> b!113771 (= lt!172856 (readBitPure!0 (readerFrom!0 (_2!4947 lt!172852) (currentBit!5337 (_2!4947 lt!172659)) (currentByte!5342 (_2!4947 lt!172659)))))))

(declare-fun res!93984 () Bool)

(assert (=> b!113771 (= res!93984 (and (= (_2!4948 lt!172856) lt!172835) (= (_1!4948 lt!172856) (_2!4947 lt!172852))))))

(assert (=> b!113771 (=> (not res!93984) (not e!74639))))

(assert (=> b!113771 (= e!74640 e!74639)))

(declare-fun b!113772 () Bool)

(declare-fun res!93978 () Bool)

(assert (=> b!113772 (= res!93978 call!1451)))

(assert (=> b!113772 (=> (not res!93978) (not e!74640))))

(declare-fun c!6895 () Bool)

(declare-fun bm!1448 () Bool)

(assert (=> bm!1448 (= call!1451 (isPrefixOf!0 (ite c!6895 (_2!4947 lt!172659) lt!172858) (ite c!6895 (_2!4947 lt!172852) lt!172858)))))

(declare-fun b!113773 () Bool)

(declare-fun res!93983 () Bool)

(assert (=> b!113773 (= res!93983 (= (bitIndex!0 (size!2348 (buf!2756 (_2!4947 lt!172852))) (currentByte!5342 (_2!4947 lt!172852)) (currentBit!5337 (_2!4947 lt!172852))) (bvadd (bitIndex!0 (size!2348 (buf!2756 (_2!4947 lt!172659))) (currentByte!5342 (_2!4947 lt!172659)) (currentBit!5337 (_2!4947 lt!172659))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!113773 (=> (not res!93983) (not e!74640))))

(declare-fun d!36500 () Bool)

(assert (=> d!36500 e!74634))

(declare-fun res!93980 () Bool)

(assert (=> d!36500 (=> (not res!93980) (not e!74634))))

(assert (=> d!36500 (= res!93980 (= (size!2348 (buf!2756 (_2!4947 lt!172659))) (size!2348 (buf!2756 (_2!4947 lt!172850)))))))

(assert (=> d!36500 (= lt!172850 e!74636)))

(assert (=> d!36500 (= c!6895 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!36500 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!36500 (= (appendNLeastSignificantBitsLoop!0 (_2!4947 lt!172659) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!172850)))

(declare-fun b!113774 () Bool)

(assert (=> b!113774 (= e!74638 (= (_2!4948 lt!172828) (_2!4948 lt!172826)))))

(declare-fun b!113775 () Bool)

(assert (=> b!113775 (= e!74637 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun b!113776 () Bool)

(declare-fun res!93981 () Bool)

(assert (=> b!113776 (=> (not res!93981) (not e!74634))))

(declare-fun lt!172838 () (_ BitVec 64))

(declare-fun lt!172863 () (_ BitVec 64))

(assert (=> b!113776 (= res!93981 (= (bitIndex!0 (size!2348 (buf!2756 (_2!4947 lt!172850))) (currentByte!5342 (_2!4947 lt!172850)) (currentBit!5337 (_2!4947 lt!172850))) (bvadd lt!172863 lt!172838)))))

(assert (=> b!113776 (or (not (= (bvand lt!172863 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!172838 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!172863 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!172863 lt!172838) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!113776 (= lt!172838 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!113776 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!113776 (= lt!172863 (bitIndex!0 (size!2348 (buf!2756 (_2!4947 lt!172659))) (currentByte!5342 (_2!4947 lt!172659)) (currentBit!5337 (_2!4947 lt!172659))))))

(declare-fun b!113777 () Bool)

(declare-fun res!93977 () Bool)

(assert (=> b!113777 (=> (not res!93977) (not e!74634))))

(assert (=> b!113777 (= res!93977 (isPrefixOf!0 (_2!4947 lt!172659) (_2!4947 lt!172850)))))

(assert (= (and d!36500 c!6895) b!113770))

(assert (= (and d!36500 (not c!6895)) b!113766))

(assert (= (and b!113770 res!93979) b!113773))

(assert (= (and b!113773 res!93983) b!113772))

(assert (= (and b!113772 res!93978) b!113771))

(assert (= (and b!113771 res!93984) b!113765))

(assert (= (and b!113770 res!93982) b!113774))

(assert (= (and b!113770 c!6894) b!113775))

(assert (= (and b!113770 (not c!6894)) b!113769))

(assert (= (or b!113772 b!113766) bm!1448))

(assert (= (and d!36500 res!93980) b!113776))

(assert (= (and b!113776 res!93981) b!113777))

(assert (= (and b!113777 res!93977) b!113767))

(assert (= (and b!113767 res!93976) b!113768))

(declare-fun m!169885 () Bool)

(assert (=> bm!1448 m!169885))

(declare-fun m!169887 () Bool)

(assert (=> b!113773 m!169887))

(assert (=> b!113773 m!169791))

(declare-fun m!169889 () Bool)

(assert (=> b!113771 m!169889))

(assert (=> b!113771 m!169889))

(declare-fun m!169891 () Bool)

(assert (=> b!113771 m!169891))

(declare-fun m!169893 () Bool)

(assert (=> b!113770 m!169893))

(declare-fun m!169895 () Bool)

(assert (=> b!113770 m!169895))

(declare-fun m!169897 () Bool)

(assert (=> b!113770 m!169897))

(declare-fun m!169899 () Bool)

(assert (=> b!113770 m!169899))

(declare-fun m!169901 () Bool)

(assert (=> b!113770 m!169901))

(declare-fun m!169903 () Bool)

(assert (=> b!113770 m!169903))

(declare-fun m!169905 () Bool)

(assert (=> b!113770 m!169905))

(declare-fun m!169907 () Bool)

(assert (=> b!113770 m!169907))

(declare-fun m!169909 () Bool)

(assert (=> b!113770 m!169909))

(declare-fun m!169911 () Bool)

(assert (=> b!113770 m!169911))

(declare-fun m!169913 () Bool)

(assert (=> b!113770 m!169913))

(declare-fun m!169915 () Bool)

(assert (=> b!113770 m!169915))

(declare-fun m!169917 () Bool)

(assert (=> b!113770 m!169917))

(assert (=> b!113770 m!169893))

(declare-fun m!169919 () Bool)

(assert (=> b!113770 m!169919))

(declare-fun m!169921 () Bool)

(assert (=> b!113770 m!169921))

(declare-fun m!169923 () Bool)

(assert (=> b!113770 m!169923))

(declare-fun m!169925 () Bool)

(assert (=> b!113770 m!169925))

(declare-fun m!169927 () Bool)

(assert (=> b!113770 m!169927))

(declare-fun m!169929 () Bool)

(assert (=> b!113770 m!169929))

(declare-fun m!169931 () Bool)

(assert (=> b!113770 m!169931))

(assert (=> b!113770 m!169791))

(declare-fun m!169933 () Bool)

(assert (=> b!113770 m!169933))

(declare-fun m!169935 () Bool)

(assert (=> b!113770 m!169935))

(declare-fun m!169937 () Bool)

(assert (=> b!113770 m!169937))

(declare-fun m!169939 () Bool)

(assert (=> b!113770 m!169939))

(declare-fun m!169941 () Bool)

(assert (=> b!113770 m!169941))

(declare-fun m!169943 () Bool)

(assert (=> b!113770 m!169943))

(declare-fun m!169945 () Bool)

(assert (=> b!113770 m!169945))

(declare-fun m!169947 () Bool)

(assert (=> b!113770 m!169947))

(declare-fun m!169949 () Bool)

(assert (=> b!113765 m!169949))

(assert (=> b!113765 m!169887))

(declare-fun m!169951 () Bool)

(assert (=> b!113776 m!169951))

(assert (=> b!113776 m!169791))

(declare-fun m!169953 () Bool)

(assert (=> b!113767 m!169953))

(declare-fun m!169955 () Bool)

(assert (=> b!113767 m!169955))

(assert (=> b!113767 m!169915))

(declare-fun m!169957 () Bool)

(assert (=> b!113767 m!169957))

(declare-fun m!169959 () Bool)

(assert (=> b!113767 m!169959))

(declare-fun m!169961 () Bool)

(assert (=> b!113777 m!169961))

(declare-fun m!169963 () Bool)

(assert (=> b!113766 m!169963))

(declare-fun m!169965 () Bool)

(assert (=> b!113768 m!169965))

(assert (=> b!113647 d!36500))

(declare-fun d!36544 () Bool)

(declare-fun e!74646 () Bool)

(assert (=> d!36544 e!74646))

(declare-fun res!93994 () Bool)

(assert (=> d!36544 (=> (not res!93994) (not e!74646))))

(declare-fun lt!172879 () tuple2!9370)

(assert (=> d!36544 (= res!93994 (= (size!2348 (buf!2756 thiss!1305)) (size!2348 (buf!2756 (_2!4947 lt!172879)))))))

(declare-fun choose!16 (BitStream!4170 Bool) tuple2!9370)

(assert (=> d!36544 (= lt!172879 (choose!16 thiss!1305 lt!172663))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!36544 (validate_offset_bit!0 ((_ sign_extend 32) (size!2348 (buf!2756 thiss!1305))) ((_ sign_extend 32) (currentByte!5342 thiss!1305)) ((_ sign_extend 32) (currentBit!5337 thiss!1305)))))

(assert (=> d!36544 (= (appendBit!0 thiss!1305 lt!172663) lt!172879)))

(declare-fun b!113789 () Bool)

(declare-fun e!74645 () Bool)

(assert (=> b!113789 (= e!74646 e!74645)))

(declare-fun res!93995 () Bool)

(assert (=> b!113789 (=> (not res!93995) (not e!74645))))

(declare-fun lt!172877 () tuple2!9372)

(assert (=> b!113789 (= res!93995 (and (= (_2!4948 lt!172877) lt!172663) (= (_1!4948 lt!172877) (_2!4947 lt!172879))))))

(assert (=> b!113789 (= lt!172877 (readBitPure!0 (readerFrom!0 (_2!4947 lt!172879) (currentBit!5337 thiss!1305) (currentByte!5342 thiss!1305))))))

(declare-fun b!113788 () Bool)

(declare-fun res!93996 () Bool)

(assert (=> b!113788 (=> (not res!93996) (not e!74646))))

(assert (=> b!113788 (= res!93996 (isPrefixOf!0 thiss!1305 (_2!4947 lt!172879)))))

(declare-fun b!113790 () Bool)

(assert (=> b!113790 (= e!74645 (= (bitIndex!0 (size!2348 (buf!2756 (_1!4948 lt!172877))) (currentByte!5342 (_1!4948 lt!172877)) (currentBit!5337 (_1!4948 lt!172877))) (bitIndex!0 (size!2348 (buf!2756 (_2!4947 lt!172879))) (currentByte!5342 (_2!4947 lt!172879)) (currentBit!5337 (_2!4947 lt!172879)))))))

(declare-fun b!113787 () Bool)

(declare-fun res!93993 () Bool)

(assert (=> b!113787 (=> (not res!93993) (not e!74646))))

(declare-fun lt!172878 () (_ BitVec 64))

(declare-fun lt!172880 () (_ BitVec 64))

(assert (=> b!113787 (= res!93993 (= (bitIndex!0 (size!2348 (buf!2756 (_2!4947 lt!172879))) (currentByte!5342 (_2!4947 lt!172879)) (currentBit!5337 (_2!4947 lt!172879))) (bvadd lt!172880 lt!172878)))))

(assert (=> b!113787 (or (not (= (bvand lt!172880 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!172878 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!172880 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!172880 lt!172878) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!113787 (= lt!172878 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!113787 (= lt!172880 (bitIndex!0 (size!2348 (buf!2756 thiss!1305)) (currentByte!5342 thiss!1305) (currentBit!5337 thiss!1305)))))

(assert (= (and d!36544 res!93994) b!113787))

(assert (= (and b!113787 res!93993) b!113788))

(assert (= (and b!113788 res!93996) b!113789))

(assert (= (and b!113789 res!93995) b!113790))

(declare-fun m!169967 () Bool)

(assert (=> b!113788 m!169967))

(declare-fun m!169969 () Bool)

(assert (=> b!113790 m!169969))

(declare-fun m!169971 () Bool)

(assert (=> b!113790 m!169971))

(assert (=> b!113787 m!169971))

(assert (=> b!113787 m!169793))

(declare-fun m!169973 () Bool)

(assert (=> d!36544 m!169973))

(declare-fun m!169975 () Bool)

(assert (=> d!36544 m!169975))

(declare-fun m!169977 () Bool)

(assert (=> b!113789 m!169977))

(assert (=> b!113789 m!169977))

(declare-fun m!169979 () Bool)

(assert (=> b!113789 m!169979))

(assert (=> b!113647 d!36544))

(declare-fun d!36546 () Bool)

(declare-fun res!93997 () Bool)

(declare-fun e!74648 () Bool)

(assert (=> d!36546 (=> (not res!93997) (not e!74648))))

(assert (=> d!36546 (= res!93997 (= (size!2348 (buf!2756 thiss!1305)) (size!2348 (buf!2756 (_2!4947 lt!172659)))))))

(assert (=> d!36546 (= (isPrefixOf!0 thiss!1305 (_2!4947 lt!172659)) e!74648)))

(declare-fun b!113791 () Bool)

(declare-fun res!93999 () Bool)

(assert (=> b!113791 (=> (not res!93999) (not e!74648))))

(assert (=> b!113791 (= res!93999 (bvsle (bitIndex!0 (size!2348 (buf!2756 thiss!1305)) (currentByte!5342 thiss!1305) (currentBit!5337 thiss!1305)) (bitIndex!0 (size!2348 (buf!2756 (_2!4947 lt!172659))) (currentByte!5342 (_2!4947 lt!172659)) (currentBit!5337 (_2!4947 lt!172659)))))))

(declare-fun b!113792 () Bool)

(declare-fun e!74647 () Bool)

(assert (=> b!113792 (= e!74648 e!74647)))

(declare-fun res!93998 () Bool)

(assert (=> b!113792 (=> res!93998 e!74647)))

(assert (=> b!113792 (= res!93998 (= (size!2348 (buf!2756 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!113793 () Bool)

(assert (=> b!113793 (= e!74647 (arrayBitRangesEq!0 (buf!2756 thiss!1305) (buf!2756 (_2!4947 lt!172659)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2348 (buf!2756 thiss!1305)) (currentByte!5342 thiss!1305) (currentBit!5337 thiss!1305))))))

(assert (= (and d!36546 res!93997) b!113791))

(assert (= (and b!113791 res!93999) b!113792))

(assert (= (and b!113792 (not res!93998)) b!113793))

(assert (=> b!113791 m!169793))

(assert (=> b!113791 m!169791))

(assert (=> b!113793 m!169793))

(assert (=> b!113793 m!169793))

(declare-fun m!169981 () Bool)

(assert (=> b!113793 m!169981))

(assert (=> b!113652 d!36546))

(declare-fun d!36548 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!36548 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2348 (buf!2756 thiss!1305))) ((_ sign_extend 32) (currentByte!5342 thiss!1305)) ((_ sign_extend 32) (currentBit!5337 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2348 (buf!2756 thiss!1305))) ((_ sign_extend 32) (currentByte!5342 thiss!1305)) ((_ sign_extend 32) (currentBit!5337 thiss!1305))) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun bs!8880 () Bool)

(assert (= bs!8880 d!36548))

(declare-fun m!169983 () Bool)

(assert (=> bs!8880 m!169983))

(assert (=> b!113649 d!36548))

(declare-fun d!36550 () Bool)

(declare-fun e!74661 () Bool)

(assert (=> d!36550 e!74661))

(declare-fun res!94015 () Bool)

(assert (=> d!36550 (=> (not res!94015) (not e!74661))))

(declare-fun lt!172964 () (_ BitVec 64))

(declare-fun lt!172966 () (_ BitVec 64))

(declare-fun lt!172963 () (_ BitVec 64))

(assert (=> d!36550 (= res!94015 (= lt!172964 (bvsub lt!172966 lt!172963)))))

(assert (=> d!36550 (or (= (bvand lt!172966 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!172963 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!172966 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!172966 lt!172963) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36550 (= lt!172963 (remainingBits!0 ((_ sign_extend 32) (size!2348 (buf!2756 (_1!4948 lt!172661)))) ((_ sign_extend 32) (currentByte!5342 (_1!4948 lt!172661))) ((_ sign_extend 32) (currentBit!5337 (_1!4948 lt!172661)))))))

(declare-fun lt!172965 () (_ BitVec 64))

(declare-fun lt!172962 () (_ BitVec 64))

(assert (=> d!36550 (= lt!172966 (bvmul lt!172965 lt!172962))))

(assert (=> d!36550 (or (= lt!172965 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!172962 (bvsdiv (bvmul lt!172965 lt!172962) lt!172965)))))

(assert (=> d!36550 (= lt!172962 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!36550 (= lt!172965 ((_ sign_extend 32) (size!2348 (buf!2756 (_1!4948 lt!172661)))))))

(assert (=> d!36550 (= lt!172964 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5342 (_1!4948 lt!172661))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5337 (_1!4948 lt!172661)))))))

(assert (=> d!36550 (invariant!0 (currentBit!5337 (_1!4948 lt!172661)) (currentByte!5342 (_1!4948 lt!172661)) (size!2348 (buf!2756 (_1!4948 lt!172661))))))

(assert (=> d!36550 (= (bitIndex!0 (size!2348 (buf!2756 (_1!4948 lt!172661))) (currentByte!5342 (_1!4948 lt!172661)) (currentBit!5337 (_1!4948 lt!172661))) lt!172964)))

(declare-fun b!113816 () Bool)

(declare-fun res!94014 () Bool)

(assert (=> b!113816 (=> (not res!94014) (not e!74661))))

(assert (=> b!113816 (= res!94014 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!172964))))

(declare-fun b!113817 () Bool)

(declare-fun lt!172961 () (_ BitVec 64))

(assert (=> b!113817 (= e!74661 (bvsle lt!172964 (bvmul lt!172961 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!113817 (or (= lt!172961 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!172961 #b0000000000000000000000000000000000000000000000000000000000001000) lt!172961)))))

(assert (=> b!113817 (= lt!172961 ((_ sign_extend 32) (size!2348 (buf!2756 (_1!4948 lt!172661)))))))

(assert (= (and d!36550 res!94015) b!113816))

(assert (= (and b!113816 res!94014) b!113817))

(declare-fun m!169985 () Bool)

(assert (=> d!36550 m!169985))

(declare-fun m!169987 () Bool)

(assert (=> d!36550 m!169987))

(assert (=> b!113648 d!36550))

(declare-fun d!36552 () Bool)

(declare-fun e!74662 () Bool)

(assert (=> d!36552 e!74662))

(declare-fun res!94017 () Bool)

(assert (=> d!36552 (=> (not res!94017) (not e!74662))))

(declare-fun lt!172978 () (_ BitVec 64))

(declare-fun lt!172976 () (_ BitVec 64))

(declare-fun lt!172975 () (_ BitVec 64))

(assert (=> d!36552 (= res!94017 (= lt!172976 (bvsub lt!172978 lt!172975)))))

(assert (=> d!36552 (or (= (bvand lt!172978 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!172975 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!172978 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!172978 lt!172975) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36552 (= lt!172975 (remainingBits!0 ((_ sign_extend 32) (size!2348 (buf!2756 (_2!4947 lt!172659)))) ((_ sign_extend 32) (currentByte!5342 (_2!4947 lt!172659))) ((_ sign_extend 32) (currentBit!5337 (_2!4947 lt!172659)))))))

(declare-fun lt!172977 () (_ BitVec 64))

(declare-fun lt!172974 () (_ BitVec 64))

(assert (=> d!36552 (= lt!172978 (bvmul lt!172977 lt!172974))))

(assert (=> d!36552 (or (= lt!172977 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!172974 (bvsdiv (bvmul lt!172977 lt!172974) lt!172977)))))

(assert (=> d!36552 (= lt!172974 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!36552 (= lt!172977 ((_ sign_extend 32) (size!2348 (buf!2756 (_2!4947 lt!172659)))))))

(assert (=> d!36552 (= lt!172976 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5342 (_2!4947 lt!172659))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5337 (_2!4947 lt!172659)))))))

(assert (=> d!36552 (invariant!0 (currentBit!5337 (_2!4947 lt!172659)) (currentByte!5342 (_2!4947 lt!172659)) (size!2348 (buf!2756 (_2!4947 lt!172659))))))

(assert (=> d!36552 (= (bitIndex!0 (size!2348 (buf!2756 (_2!4947 lt!172659))) (currentByte!5342 (_2!4947 lt!172659)) (currentBit!5337 (_2!4947 lt!172659))) lt!172976)))

(declare-fun b!113818 () Bool)

(declare-fun res!94016 () Bool)

(assert (=> b!113818 (=> (not res!94016) (not e!74662))))

(assert (=> b!113818 (= res!94016 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!172976))))

(declare-fun b!113819 () Bool)

(declare-fun lt!172973 () (_ BitVec 64))

(assert (=> b!113819 (= e!74662 (bvsle lt!172976 (bvmul lt!172973 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!113819 (or (= lt!172973 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!172973 #b0000000000000000000000000000000000000000000000000000000000001000) lt!172973)))))

(assert (=> b!113819 (= lt!172973 ((_ sign_extend 32) (size!2348 (buf!2756 (_2!4947 lt!172659)))))))

(assert (= (and d!36552 res!94017) b!113818))

(assert (= (and b!113818 res!94016) b!113819))

(declare-fun m!169989 () Bool)

(assert (=> d!36552 m!169989))

(assert (=> d!36552 m!169839))

(assert (=> b!113650 d!36552))

(declare-fun d!36554 () Bool)

(declare-fun e!74663 () Bool)

(assert (=> d!36554 e!74663))

(declare-fun res!94019 () Bool)

(assert (=> d!36554 (=> (not res!94019) (not e!74663))))

(declare-fun lt!172982 () (_ BitVec 64))

(declare-fun lt!172984 () (_ BitVec 64))

(declare-fun lt!172981 () (_ BitVec 64))

(assert (=> d!36554 (= res!94019 (= lt!172982 (bvsub lt!172984 lt!172981)))))

(assert (=> d!36554 (or (= (bvand lt!172984 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!172981 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!172984 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!172984 lt!172981) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36554 (= lt!172981 (remainingBits!0 ((_ sign_extend 32) (size!2348 (buf!2756 thiss!1305))) ((_ sign_extend 32) (currentByte!5342 thiss!1305)) ((_ sign_extend 32) (currentBit!5337 thiss!1305))))))

(declare-fun lt!172983 () (_ BitVec 64))

(declare-fun lt!172980 () (_ BitVec 64))

(assert (=> d!36554 (= lt!172984 (bvmul lt!172983 lt!172980))))

(assert (=> d!36554 (or (= lt!172983 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!172980 (bvsdiv (bvmul lt!172983 lt!172980) lt!172983)))))

(assert (=> d!36554 (= lt!172980 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!36554 (= lt!172983 ((_ sign_extend 32) (size!2348 (buf!2756 thiss!1305))))))

(assert (=> d!36554 (= lt!172982 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5342 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5337 thiss!1305))))))

(assert (=> d!36554 (invariant!0 (currentBit!5337 thiss!1305) (currentByte!5342 thiss!1305) (size!2348 (buf!2756 thiss!1305)))))

(assert (=> d!36554 (= (bitIndex!0 (size!2348 (buf!2756 thiss!1305)) (currentByte!5342 thiss!1305) (currentBit!5337 thiss!1305)) lt!172982)))

(declare-fun b!113820 () Bool)

(declare-fun res!94018 () Bool)

(assert (=> b!113820 (=> (not res!94018) (not e!74663))))

(assert (=> b!113820 (= res!94018 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!172982))))

(declare-fun b!113821 () Bool)

(declare-fun lt!172979 () (_ BitVec 64))

(assert (=> b!113821 (= e!74663 (bvsle lt!172982 (bvmul lt!172979 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!113821 (or (= lt!172979 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!172979 #b0000000000000000000000000000000000000000000000000000000000001000) lt!172979)))))

(assert (=> b!113821 (= lt!172979 ((_ sign_extend 32) (size!2348 (buf!2756 thiss!1305))))))

(assert (= (and d!36554 res!94019) b!113820))

(assert (= (and b!113820 res!94018) b!113821))

(assert (=> d!36554 m!169983))

(assert (=> d!36554 m!169841))

(assert (=> b!113650 d!36554))

(declare-fun d!36556 () Bool)

(assert (=> d!36556 (= (invariant!0 (currentBit!5337 thiss!1305) (currentByte!5342 thiss!1305) (size!2348 (buf!2756 (_2!4947 lt!172659)))) (and (bvsge (currentBit!5337 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5337 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5342 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5342 thiss!1305) (size!2348 (buf!2756 (_2!4947 lt!172659)))) (and (= (currentBit!5337 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5342 thiss!1305) (size!2348 (buf!2756 (_2!4947 lt!172659))))))))))

(assert (=> b!113655 d!36556))

(check-sat (not b!113793) (not d!36554) (not b!113787) (not d!36548) (not b!113776) (not b!113698) (not b!113766) (not b!113791) (not d!36488) (not bm!1448) (not b!113789) (not d!36550) (not b!113773) (not d!36544) (not d!36552) (not b!113771) (not d!36492) (not d!36498) (not b!113689) (not b!113770) (not d!36486) (not b!113790) (not b!113777) (not b!113696) (not b!113765) (not b!113788) (not b!113767) (not b!113768))
