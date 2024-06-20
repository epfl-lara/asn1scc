; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40072 () Bool)

(assert start!40072)

(declare-fun b!182799 () Bool)

(declare-fun res!151939 () Bool)

(declare-fun e!126832 () Bool)

(assert (=> b!182799 (=> res!151939 e!126832)))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-datatypes ((array!9739 0))(
  ( (array!9740 (arr!5225 (Array (_ BitVec 32) (_ BitVec 8))) (size!4295 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7698 0))(
  ( (BitStream!7699 (buf!4747 array!9739) (currentByte!8975 (_ BitVec 32)) (currentBit!8970 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15784 0))(
  ( (tuple2!15785 (_1!8537 BitStream!7698) (_2!8537 BitStream!7698)) )
))
(declare-fun lt!281011 () tuple2!15784)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!182799 (= res!151939 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!4295 (buf!4747 (_1!8537 lt!281011)))) ((_ sign_extend 32) (currentByte!8975 (_1!8537 lt!281011))) ((_ sign_extend 32) (currentBit!8970 (_1!8537 lt!281011))) ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))))

(declare-fun b!182800 () Bool)

(declare-fun e!126824 () Bool)

(declare-fun e!126830 () Bool)

(assert (=> b!182800 (= e!126824 e!126830)))

(declare-fun res!151934 () Bool)

(assert (=> b!182800 (=> (not res!151934) (not e!126830))))

(declare-fun lt!281007 () (_ BitVec 64))

(declare-fun lt!281015 () (_ BitVec 64))

(assert (=> b!182800 (= res!151934 (= lt!281007 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!281015)))))

(declare-datatypes ((Unit!13126 0))(
  ( (Unit!13127) )
))
(declare-datatypes ((tuple2!15786 0))(
  ( (tuple2!15787 (_1!8538 Unit!13126) (_2!8538 BitStream!7698)) )
))
(declare-fun lt!281006 () tuple2!15786)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!182800 (= lt!281007 (bitIndex!0 (size!4295 (buf!4747 (_2!8538 lt!281006))) (currentByte!8975 (_2!8538 lt!281006)) (currentBit!8970 (_2!8538 lt!281006))))))

(declare-fun thiss!1204 () BitStream!7698)

(assert (=> b!182800 (= lt!281015 (bitIndex!0 (size!4295 (buf!4747 thiss!1204)) (currentByte!8975 thiss!1204) (currentBit!8970 thiss!1204)))))

(declare-fun b!182802 () Bool)

(declare-fun e!126831 () Bool)

(declare-fun e!126835 () Bool)

(assert (=> b!182802 (= e!126831 e!126835)))

(declare-fun res!151933 () Bool)

(assert (=> b!182802 (=> (not res!151933) (not e!126835))))

(declare-fun lt!281009 () (_ BitVec 64))

(assert (=> b!182802 (= res!151933 (validate_offset_bits!1 ((_ sign_extend 32) (size!4295 (buf!4747 thiss!1204))) ((_ sign_extend 32) (currentByte!8975 thiss!1204)) ((_ sign_extend 32) (currentBit!8970 thiss!1204)) lt!281009))))

(assert (=> b!182802 (= lt!281009 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!182803 () Bool)

(declare-fun res!151947 () Bool)

(assert (=> b!182803 (=> (not res!151947) (not e!126830))))

(declare-fun isPrefixOf!0 (BitStream!7698 BitStream!7698) Bool)

(assert (=> b!182803 (= res!151947 (isPrefixOf!0 thiss!1204 (_2!8538 lt!281006)))))

(declare-fun b!182804 () Bool)

(declare-fun res!151946 () Bool)

(assert (=> b!182804 (=> (not res!151946) (not e!126835))))

(assert (=> b!182804 (= res!151946 (not (= i!590 nBits!348)))))

(declare-fun b!182805 () Bool)

(declare-fun e!126834 () Bool)

(declare-datatypes ((tuple2!15788 0))(
  ( (tuple2!15789 (_1!8539 BitStream!7698) (_2!8539 Bool)) )
))
(declare-fun lt!281025 () tuple2!15788)

(assert (=> b!182805 (= e!126834 (= (bitIndex!0 (size!4295 (buf!4747 (_1!8539 lt!281025))) (currentByte!8975 (_1!8539 lt!281025)) (currentBit!8970 (_1!8539 lt!281025))) lt!281007))))

(declare-fun b!182806 () Bool)

(declare-fun res!151945 () Bool)

(declare-fun e!126825 () Bool)

(assert (=> b!182806 (=> res!151945 e!126825)))

(declare-fun lt!281018 () tuple2!15786)

(declare-fun lt!281008 () (_ BitVec 64))

(declare-fun lt!281013 () (_ BitVec 64))

(assert (=> b!182806 (= res!151945 (or (not (= (size!4295 (buf!4747 (_2!8538 lt!281018))) (size!4295 (buf!4747 thiss!1204)))) (not (= lt!281008 (bvsub (bvadd lt!281013 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!182807 () Bool)

(declare-fun e!126827 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!182807 (= e!126827 (invariant!0 (currentBit!8970 thiss!1204) (currentByte!8975 thiss!1204) (size!4295 (buf!4747 (_2!8538 lt!281018)))))))

(declare-fun b!182808 () Bool)

(declare-fun e!126828 () Bool)

(declare-fun array_inv!4036 (array!9739) Bool)

(assert (=> b!182808 (= e!126828 (array_inv!4036 (buf!4747 thiss!1204)))))

(declare-fun b!182809 () Bool)

(declare-fun res!151936 () Bool)

(assert (=> b!182809 (=> res!151936 e!126825)))

(assert (=> b!182809 (= res!151936 (not (invariant!0 (currentBit!8970 (_2!8538 lt!281018)) (currentByte!8975 (_2!8538 lt!281018)) (size!4295 (buf!4747 (_2!8538 lt!281018))))))))

(declare-fun b!182810 () Bool)

(assert (=> b!182810 (= e!126830 e!126834)))

(declare-fun res!151944 () Bool)

(assert (=> b!182810 (=> (not res!151944) (not e!126834))))

(declare-fun lt!281010 () Bool)

(assert (=> b!182810 (= res!151944 (and (= (_2!8539 lt!281025) lt!281010) (= (_1!8539 lt!281025) (_2!8538 lt!281006))))))

(declare-fun readBitPure!0 (BitStream!7698) tuple2!15788)

(declare-fun readerFrom!0 (BitStream!7698 (_ BitVec 32) (_ BitVec 32)) BitStream!7698)

(assert (=> b!182810 (= lt!281025 (readBitPure!0 (readerFrom!0 (_2!8538 lt!281006) (currentBit!8970 thiss!1204) (currentByte!8975 thiss!1204))))))

(declare-fun b!182811 () Bool)

(assert (=> b!182811 (= e!126825 e!126832)))

(declare-fun res!151943 () Bool)

(assert (=> b!182811 (=> res!151943 e!126832)))

(assert (=> b!182811 (= res!151943 (or (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!590)) (bvsgt (bvadd #b00000000000000000000000000000001 i!590) nBits!348)))))

(declare-fun lt!281016 () (_ BitVec 64))

(assert (=> b!182811 (validate_offset_bits!1 ((_ sign_extend 32) (size!4295 (buf!4747 (_2!8538 lt!281018)))) ((_ sign_extend 32) (currentByte!8975 (_2!8538 lt!281006))) ((_ sign_extend 32) (currentBit!8970 (_2!8538 lt!281006))) lt!281016)))

(declare-fun lt!281020 () Unit!13126)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7698 array!9739 (_ BitVec 64)) Unit!13126)

(assert (=> b!182811 (= lt!281020 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8538 lt!281006) (buf!4747 (_2!8538 lt!281018)) lt!281016))))

(assert (=> b!182811 (= lt!281016 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!281014 () tuple2!15784)

(declare-datatypes ((tuple2!15790 0))(
  ( (tuple2!15791 (_1!8540 BitStream!7698) (_2!8540 (_ BitVec 64))) )
))
(declare-fun lt!281017 () tuple2!15790)

(declare-fun lt!281012 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7698 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!15790)

(assert (=> b!182811 (= lt!281017 (readNBitsLSBFirstsLoopPure!0 (_1!8537 lt!281014) nBits!348 i!590 lt!281012))))

(assert (=> b!182811 (validate_offset_bits!1 ((_ sign_extend 32) (size!4295 (buf!4747 (_2!8538 lt!281018)))) ((_ sign_extend 32) (currentByte!8975 thiss!1204)) ((_ sign_extend 32) (currentBit!8970 thiss!1204)) lt!281009)))

(declare-fun lt!281024 () Unit!13126)

(assert (=> b!182811 (= lt!281024 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4747 (_2!8538 lt!281018)) lt!281009))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!182811 (= lt!281012 (bvand v!189 (onesLSBLong!0 i!590)))))

(declare-fun lt!281021 () tuple2!15788)

(assert (=> b!182811 (= (_2!8539 lt!281021) lt!281010)))

(assert (=> b!182811 (= lt!281021 (readBitPure!0 (_1!8537 lt!281014)))))

(declare-fun reader!0 (BitStream!7698 BitStream!7698) tuple2!15784)

(assert (=> b!182811 (= lt!281011 (reader!0 (_2!8538 lt!281006) (_2!8538 lt!281018)))))

(assert (=> b!182811 (= lt!281014 (reader!0 thiss!1204 (_2!8538 lt!281018)))))

(declare-fun e!126826 () Bool)

(assert (=> b!182811 e!126826))

(declare-fun res!151938 () Bool)

(assert (=> b!182811 (=> (not res!151938) (not e!126826))))

(declare-fun lt!281022 () tuple2!15788)

(declare-fun lt!281026 () tuple2!15788)

(assert (=> b!182811 (= res!151938 (= (bitIndex!0 (size!4295 (buf!4747 (_1!8539 lt!281022))) (currentByte!8975 (_1!8539 lt!281022)) (currentBit!8970 (_1!8539 lt!281022))) (bitIndex!0 (size!4295 (buf!4747 (_1!8539 lt!281026))) (currentByte!8975 (_1!8539 lt!281026)) (currentBit!8970 (_1!8539 lt!281026)))))))

(declare-fun lt!281004 () Unit!13126)

(declare-fun lt!281019 () BitStream!7698)

(declare-fun readBitPrefixLemma!0 (BitStream!7698 BitStream!7698) Unit!13126)

(assert (=> b!182811 (= lt!281004 (readBitPrefixLemma!0 lt!281019 (_2!8538 lt!281018)))))

(assert (=> b!182811 (= lt!281026 (readBitPure!0 (BitStream!7699 (buf!4747 (_2!8538 lt!281018)) (currentByte!8975 thiss!1204) (currentBit!8970 thiss!1204))))))

(assert (=> b!182811 (= lt!281022 (readBitPure!0 lt!281019))))

(assert (=> b!182811 e!126827))

(declare-fun res!151932 () Bool)

(assert (=> b!182811 (=> (not res!151932) (not e!126827))))

(assert (=> b!182811 (= res!151932 (invariant!0 (currentBit!8970 thiss!1204) (currentByte!8975 thiss!1204) (size!4295 (buf!4747 (_2!8538 lt!281006)))))))

(assert (=> b!182811 (= lt!281019 (BitStream!7699 (buf!4747 (_2!8538 lt!281006)) (currentByte!8975 thiss!1204) (currentBit!8970 thiss!1204)))))

(declare-fun b!182812 () Bool)

(declare-fun e!126829 () Bool)

(assert (=> b!182812 (= e!126829 e!126825)))

(declare-fun res!151942 () Bool)

(assert (=> b!182812 (=> res!151942 e!126825)))

(declare-fun lt!281005 () (_ BitVec 64))

(assert (=> b!182812 (= res!151942 (not (= lt!281008 (bvsub (bvsub (bvadd lt!281005 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!182812 (= lt!281008 (bitIndex!0 (size!4295 (buf!4747 (_2!8538 lt!281018))) (currentByte!8975 (_2!8538 lt!281018)) (currentBit!8970 (_2!8538 lt!281018))))))

(assert (=> b!182812 (isPrefixOf!0 thiss!1204 (_2!8538 lt!281018))))

(declare-fun lt!281027 () Unit!13126)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7698 BitStream!7698 BitStream!7698) Unit!13126)

(assert (=> b!182812 (= lt!281027 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8538 lt!281006) (_2!8538 lt!281018)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7698 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15786)

(assert (=> b!182812 (= lt!281018 (appendBitsLSBFirstLoopTR!0 (_2!8538 lt!281006) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun res!151931 () Bool)

(assert (=> start!40072 (=> (not res!151931) (not e!126831))))

(assert (=> start!40072 (= res!151931 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!40072 e!126831))

(assert (=> start!40072 true))

(declare-fun inv!12 (BitStream!7698) Bool)

(assert (=> start!40072 (and (inv!12 thiss!1204) e!126828)))

(declare-fun b!182801 () Bool)

(declare-fun res!151940 () Bool)

(assert (=> b!182801 (=> (not res!151940) (not e!126835))))

(assert (=> b!182801 (= res!151940 (invariant!0 (currentBit!8970 thiss!1204) (currentByte!8975 thiss!1204) (size!4295 (buf!4747 thiss!1204))))))

(declare-fun lt!281023 () (_ BitVec 64))

(declare-fun b!182813 () Bool)

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!182813 (= e!126832 (= (bvand (bvor lt!281012 (ite (_2!8539 lt!281021) lt!281023 #b0000000000000000000000000000000000000000000000000000000000000000)) (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!182814 () Bool)

(declare-fun res!151935 () Bool)

(assert (=> b!182814 (=> res!151935 e!126825)))

(assert (=> b!182814 (= res!151935 (not (isPrefixOf!0 thiss!1204 (_2!8538 lt!281006))))))

(declare-fun b!182815 () Bool)

(assert (=> b!182815 (= e!126835 (not e!126829))))

(declare-fun res!151930 () Bool)

(assert (=> b!182815 (=> res!151930 e!126829)))

(assert (=> b!182815 (= res!151930 (not (= lt!281005 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!281013))))))

(assert (=> b!182815 (= lt!281005 (bitIndex!0 (size!4295 (buf!4747 (_2!8538 lt!281006))) (currentByte!8975 (_2!8538 lt!281006)) (currentBit!8970 (_2!8538 lt!281006))))))

(assert (=> b!182815 (= lt!281013 (bitIndex!0 (size!4295 (buf!4747 thiss!1204)) (currentByte!8975 thiss!1204) (currentBit!8970 thiss!1204)))))

(assert (=> b!182815 e!126824))

(declare-fun res!151941 () Bool)

(assert (=> b!182815 (=> (not res!151941) (not e!126824))))

(assert (=> b!182815 (= res!151941 (= (size!4295 (buf!4747 thiss!1204)) (size!4295 (buf!4747 (_2!8538 lt!281006)))))))

(declare-fun appendBit!0 (BitStream!7698 Bool) tuple2!15786)

(assert (=> b!182815 (= lt!281006 (appendBit!0 thiss!1204 lt!281010))))

(assert (=> b!182815 (= lt!281010 (not (= (bvand v!189 lt!281023) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!182815 (= lt!281023 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!182816 () Bool)

(declare-fun res!151937 () Bool)

(assert (=> b!182816 (=> res!151937 e!126825)))

(assert (=> b!182816 (= res!151937 (not (isPrefixOf!0 (_2!8538 lt!281006) (_2!8538 lt!281018))))))

(declare-fun b!182817 () Bool)

(assert (=> b!182817 (= e!126826 (= (_2!8539 lt!281022) (_2!8539 lt!281026)))))

(assert (= (and start!40072 res!151931) b!182802))

(assert (= (and b!182802 res!151933) b!182801))

(assert (= (and b!182801 res!151940) b!182804))

(assert (= (and b!182804 res!151946) b!182815))

(assert (= (and b!182815 res!151941) b!182800))

(assert (= (and b!182800 res!151934) b!182803))

(assert (= (and b!182803 res!151947) b!182810))

(assert (= (and b!182810 res!151944) b!182805))

(assert (= (and b!182815 (not res!151930)) b!182812))

(assert (= (and b!182812 (not res!151942)) b!182809))

(assert (= (and b!182809 (not res!151936)) b!182806))

(assert (= (and b!182806 (not res!151945)) b!182816))

(assert (= (and b!182816 (not res!151937)) b!182814))

(assert (= (and b!182814 (not res!151935)) b!182811))

(assert (= (and b!182811 res!151932) b!182807))

(assert (= (and b!182811 res!151938) b!182817))

(assert (= (and b!182811 (not res!151943)) b!182799))

(assert (= (and b!182799 (not res!151939)) b!182813))

(assert (= start!40072 b!182808))

(declare-fun m!284363 () Bool)

(assert (=> b!182807 m!284363))

(declare-fun m!284365 () Bool)

(assert (=> b!182808 m!284365))

(declare-fun m!284367 () Bool)

(assert (=> b!182813 m!284367))

(declare-fun m!284369 () Bool)

(assert (=> b!182811 m!284369))

(declare-fun m!284371 () Bool)

(assert (=> b!182811 m!284371))

(declare-fun m!284373 () Bool)

(assert (=> b!182811 m!284373))

(declare-fun m!284375 () Bool)

(assert (=> b!182811 m!284375))

(declare-fun m!284377 () Bool)

(assert (=> b!182811 m!284377))

(declare-fun m!284379 () Bool)

(assert (=> b!182811 m!284379))

(declare-fun m!284381 () Bool)

(assert (=> b!182811 m!284381))

(declare-fun m!284383 () Bool)

(assert (=> b!182811 m!284383))

(declare-fun m!284385 () Bool)

(assert (=> b!182811 m!284385))

(declare-fun m!284387 () Bool)

(assert (=> b!182811 m!284387))

(declare-fun m!284389 () Bool)

(assert (=> b!182811 m!284389))

(declare-fun m!284391 () Bool)

(assert (=> b!182811 m!284391))

(declare-fun m!284393 () Bool)

(assert (=> b!182811 m!284393))

(declare-fun m!284395 () Bool)

(assert (=> b!182811 m!284395))

(declare-fun m!284397 () Bool)

(assert (=> b!182811 m!284397))

(declare-fun m!284399 () Bool)

(assert (=> b!182814 m!284399))

(declare-fun m!284401 () Bool)

(assert (=> b!182802 m!284401))

(declare-fun m!284403 () Bool)

(assert (=> b!182816 m!284403))

(declare-fun m!284405 () Bool)

(assert (=> b!182815 m!284405))

(declare-fun m!284407 () Bool)

(assert (=> b!182815 m!284407))

(declare-fun m!284409 () Bool)

(assert (=> b!182815 m!284409))

(declare-fun m!284411 () Bool)

(assert (=> b!182801 m!284411))

(declare-fun m!284413 () Bool)

(assert (=> b!182805 m!284413))

(declare-fun m!284415 () Bool)

(assert (=> b!182810 m!284415))

(assert (=> b!182810 m!284415))

(declare-fun m!284417 () Bool)

(assert (=> b!182810 m!284417))

(assert (=> b!182803 m!284399))

(declare-fun m!284419 () Bool)

(assert (=> start!40072 m!284419))

(declare-fun m!284421 () Bool)

(assert (=> b!182812 m!284421))

(declare-fun m!284423 () Bool)

(assert (=> b!182812 m!284423))

(declare-fun m!284425 () Bool)

(assert (=> b!182812 m!284425))

(declare-fun m!284427 () Bool)

(assert (=> b!182812 m!284427))

(declare-fun m!284429 () Bool)

(assert (=> b!182799 m!284429))

(declare-fun m!284431 () Bool)

(assert (=> b!182809 m!284431))

(assert (=> b!182800 m!284405))

(assert (=> b!182800 m!284407))

(check-sat (not b!182811) (not b!182814) (not b!182805) (not b!182800) (not b!182801) (not b!182802) (not b!182813) (not b!182815) (not start!40072) (not b!182810) (not b!182808) (not b!182816) (not b!182803) (not b!182799) (not b!182812) (not b!182809) (not b!182807))
(check-sat)
(get-model)

(declare-fun d!63409 () Bool)

(assert (=> d!63409 (= (inv!12 thiss!1204) (invariant!0 (currentBit!8970 thiss!1204) (currentByte!8975 thiss!1204) (size!4295 (buf!4747 thiss!1204))))))

(declare-fun bs!15790 () Bool)

(assert (= bs!15790 d!63409))

(assert (=> bs!15790 m!284411))

(assert (=> start!40072 d!63409))

(declare-fun d!63411 () Bool)

(assert (=> d!63411 (= (invariant!0 (currentBit!8970 thiss!1204) (currentByte!8975 thiss!1204) (size!4295 (buf!4747 thiss!1204))) (and (bvsge (currentBit!8970 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!8970 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!8975 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!8975 thiss!1204) (size!4295 (buf!4747 thiss!1204))) (and (= (currentBit!8970 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!8975 thiss!1204) (size!4295 (buf!4747 thiss!1204)))))))))

(assert (=> b!182801 d!63411))

(declare-fun d!63413 () Bool)

(declare-fun e!126874 () Bool)

(assert (=> d!63413 e!126874))

(declare-fun res!152007 () Bool)

(assert (=> d!63413 (=> (not res!152007) (not e!126874))))

(declare-fun lt!281115 () (_ BitVec 64))

(declare-fun lt!281113 () (_ BitVec 64))

(declare-fun lt!281112 () (_ BitVec 64))

(assert (=> d!63413 (= res!152007 (= lt!281112 (bvsub lt!281113 lt!281115)))))

(assert (=> d!63413 (or (= (bvand lt!281113 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!281115 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!281113 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!281113 lt!281115) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!63413 (= lt!281115 (remainingBits!0 ((_ sign_extend 32) (size!4295 (buf!4747 (_2!8538 lt!281018)))) ((_ sign_extend 32) (currentByte!8975 (_2!8538 lt!281018))) ((_ sign_extend 32) (currentBit!8970 (_2!8538 lt!281018)))))))

(declare-fun lt!281116 () (_ BitVec 64))

(declare-fun lt!281117 () (_ BitVec 64))

(assert (=> d!63413 (= lt!281113 (bvmul lt!281116 lt!281117))))

(assert (=> d!63413 (or (= lt!281116 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!281117 (bvsdiv (bvmul lt!281116 lt!281117) lt!281116)))))

(assert (=> d!63413 (= lt!281117 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63413 (= lt!281116 ((_ sign_extend 32) (size!4295 (buf!4747 (_2!8538 lt!281018)))))))

(assert (=> d!63413 (= lt!281112 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8975 (_2!8538 lt!281018))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8970 (_2!8538 lt!281018)))))))

(assert (=> d!63413 (invariant!0 (currentBit!8970 (_2!8538 lt!281018)) (currentByte!8975 (_2!8538 lt!281018)) (size!4295 (buf!4747 (_2!8538 lt!281018))))))

(assert (=> d!63413 (= (bitIndex!0 (size!4295 (buf!4747 (_2!8538 lt!281018))) (currentByte!8975 (_2!8538 lt!281018)) (currentBit!8970 (_2!8538 lt!281018))) lt!281112)))

(declare-fun b!182879 () Bool)

(declare-fun res!152006 () Bool)

(assert (=> b!182879 (=> (not res!152006) (not e!126874))))

(assert (=> b!182879 (= res!152006 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!281112))))

(declare-fun b!182880 () Bool)

(declare-fun lt!281114 () (_ BitVec 64))

(assert (=> b!182880 (= e!126874 (bvsle lt!281112 (bvmul lt!281114 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!182880 (or (= lt!281114 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!281114 #b0000000000000000000000000000000000000000000000000000000000001000) lt!281114)))))

(assert (=> b!182880 (= lt!281114 ((_ sign_extend 32) (size!4295 (buf!4747 (_2!8538 lt!281018)))))))

(assert (= (and d!63413 res!152007) b!182879))

(assert (= (and b!182879 res!152006) b!182880))

(declare-fun m!284503 () Bool)

(assert (=> d!63413 m!284503))

(assert (=> d!63413 m!284431))

(assert (=> b!182812 d!63413))

(declare-fun d!63415 () Bool)

(declare-fun res!152014 () Bool)

(declare-fun e!126879 () Bool)

(assert (=> d!63415 (=> (not res!152014) (not e!126879))))

(assert (=> d!63415 (= res!152014 (= (size!4295 (buf!4747 thiss!1204)) (size!4295 (buf!4747 (_2!8538 lt!281018)))))))

(assert (=> d!63415 (= (isPrefixOf!0 thiss!1204 (_2!8538 lt!281018)) e!126879)))

(declare-fun b!182887 () Bool)

(declare-fun res!152015 () Bool)

(assert (=> b!182887 (=> (not res!152015) (not e!126879))))

(assert (=> b!182887 (= res!152015 (bvsle (bitIndex!0 (size!4295 (buf!4747 thiss!1204)) (currentByte!8975 thiss!1204) (currentBit!8970 thiss!1204)) (bitIndex!0 (size!4295 (buf!4747 (_2!8538 lt!281018))) (currentByte!8975 (_2!8538 lt!281018)) (currentBit!8970 (_2!8538 lt!281018)))))))

(declare-fun b!182888 () Bool)

(declare-fun e!126880 () Bool)

(assert (=> b!182888 (= e!126879 e!126880)))

(declare-fun res!152016 () Bool)

(assert (=> b!182888 (=> res!152016 e!126880)))

(assert (=> b!182888 (= res!152016 (= (size!4295 (buf!4747 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!182889 () Bool)

(declare-fun arrayBitRangesEq!0 (array!9739 array!9739 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!182889 (= e!126880 (arrayBitRangesEq!0 (buf!4747 thiss!1204) (buf!4747 (_2!8538 lt!281018)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4295 (buf!4747 thiss!1204)) (currentByte!8975 thiss!1204) (currentBit!8970 thiss!1204))))))

(assert (= (and d!63415 res!152014) b!182887))

(assert (= (and b!182887 res!152015) b!182888))

(assert (= (and b!182888 (not res!152016)) b!182889))

(assert (=> b!182887 m!284407))

(assert (=> b!182887 m!284421))

(assert (=> b!182889 m!284407))

(assert (=> b!182889 m!284407))

(declare-fun m!284505 () Bool)

(assert (=> b!182889 m!284505))

(assert (=> b!182812 d!63415))

(declare-fun d!63417 () Bool)

(assert (=> d!63417 (isPrefixOf!0 thiss!1204 (_2!8538 lt!281018))))

(declare-fun lt!281120 () Unit!13126)

(declare-fun choose!30 (BitStream!7698 BitStream!7698 BitStream!7698) Unit!13126)

(assert (=> d!63417 (= lt!281120 (choose!30 thiss!1204 (_2!8538 lt!281006) (_2!8538 lt!281018)))))

(assert (=> d!63417 (isPrefixOf!0 thiss!1204 (_2!8538 lt!281006))))

(assert (=> d!63417 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8538 lt!281006) (_2!8538 lt!281018)) lt!281120)))

(declare-fun bs!15791 () Bool)

(assert (= bs!15791 d!63417))

(assert (=> bs!15791 m!284423))

(declare-fun m!284507 () Bool)

(assert (=> bs!15791 m!284507))

(assert (=> bs!15791 m!284399))

(assert (=> b!182812 d!63417))

(declare-fun b!182955 () Bool)

(declare-fun e!126927 () Bool)

(declare-fun lt!281299 () tuple2!15790)

(declare-fun lt!281302 () tuple2!15784)

(assert (=> b!182955 (= e!126927 (= (_1!8540 lt!281299) (_2!8537 lt!281302)))))

(declare-fun b!182956 () Bool)

(declare-fun res!152086 () Bool)

(declare-fun e!126922 () Bool)

(assert (=> b!182956 (=> (not res!152086) (not e!126922))))

(declare-fun lt!281278 () (_ BitVec 64))

(declare-fun lt!281319 () tuple2!15786)

(declare-fun lt!281305 () (_ BitVec 64))

(assert (=> b!182956 (= res!152086 (= (bitIndex!0 (size!4295 (buf!4747 (_2!8538 lt!281319))) (currentByte!8975 (_2!8538 lt!281319)) (currentBit!8970 (_2!8538 lt!281319))) (bvsub lt!281305 lt!281278)))))

(assert (=> b!182956 (or (= (bvand lt!281305 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!281278 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!281305 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!281305 lt!281278) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!182956 (= lt!281278 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!281280 () (_ BitVec 64))

(declare-fun lt!281321 () (_ BitVec 64))

(assert (=> b!182956 (= lt!281305 (bvadd lt!281280 lt!281321))))

(assert (=> b!182956 (or (not (= (bvand lt!281280 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!281321 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!281280 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!281280 lt!281321) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!182956 (= lt!281321 ((_ sign_extend 32) nBits!348))))

(assert (=> b!182956 (= lt!281280 (bitIndex!0 (size!4295 (buf!4747 (_2!8538 lt!281006))) (currentByte!8975 (_2!8538 lt!281006)) (currentBit!8970 (_2!8538 lt!281006))))))

(declare-fun b!182957 () Bool)

(declare-fun res!152084 () Bool)

(declare-fun lt!281308 () tuple2!15786)

(assert (=> b!182957 (= res!152084 (= (bitIndex!0 (size!4295 (buf!4747 (_2!8538 lt!281308))) (currentByte!8975 (_2!8538 lt!281308)) (currentBit!8970 (_2!8538 lt!281308))) (bvadd (bitIndex!0 (size!4295 (buf!4747 (_2!8538 lt!281006))) (currentByte!8975 (_2!8538 lt!281006)) (currentBit!8970 (_2!8538 lt!281006))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun e!126923 () Bool)

(assert (=> b!182957 (=> (not res!152084) (not e!126923))))

(declare-fun b!182958 () Bool)

(declare-fun res!152076 () Bool)

(assert (=> b!182958 (= res!152076 (isPrefixOf!0 (_2!8538 lt!281006) (_2!8538 lt!281308)))))

(assert (=> b!182958 (=> (not res!152076) (not e!126923))))

(declare-fun b!182959 () Bool)

(declare-fun lt!281298 () tuple2!15788)

(assert (=> b!182959 (= lt!281298 (readBitPure!0 (readerFrom!0 (_2!8538 lt!281308) (currentBit!8970 (_2!8538 lt!281006)) (currentByte!8975 (_2!8538 lt!281006)))))))

(declare-fun res!152085 () Bool)

(declare-fun lt!281325 () Bool)

(assert (=> b!182959 (= res!152085 (and (= (_2!8539 lt!281298) lt!281325) (= (_1!8539 lt!281298) (_2!8538 lt!281308))))))

(declare-fun e!126925 () Bool)

(assert (=> b!182959 (=> (not res!152085) (not e!126925))))

(assert (=> b!182959 (= e!126923 e!126925)))

(declare-fun call!2966 () Bool)

(declare-fun bm!2963 () Bool)

(declare-fun c!9402 () Bool)

(declare-fun lt!281313 () tuple2!15786)

(assert (=> bm!2963 (= call!2966 (isPrefixOf!0 (_2!8538 lt!281006) (ite c!9402 (_2!8538 lt!281006) (_2!8538 lt!281313))))))

(declare-fun b!182960 () Bool)

(declare-fun res!152075 () Bool)

(assert (=> b!182960 (=> (not res!152075) (not e!126922))))

(assert (=> b!182960 (= res!152075 (= (size!4295 (buf!4747 (_2!8538 lt!281006))) (size!4295 (buf!4747 (_2!8538 lt!281319)))))))

(declare-fun b!182961 () Bool)

(declare-fun e!126928 () Bool)

(declare-fun lt!281312 () tuple2!15790)

(declare-fun lt!281300 () tuple2!15784)

(assert (=> b!182961 (= e!126928 (= (_1!8540 lt!281312) (_2!8537 lt!281300)))))

(declare-fun b!182962 () Bool)

(declare-fun e!126924 () tuple2!15786)

(declare-fun Unit!13130 () Unit!13126)

(assert (=> b!182962 (= e!126924 (tuple2!15787 Unit!13130 (_2!8538 lt!281006)))))

(declare-fun lt!281283 () Unit!13126)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7698) Unit!13126)

(assert (=> b!182962 (= lt!281283 (lemmaIsPrefixRefl!0 (_2!8538 lt!281006)))))

(assert (=> b!182962 call!2966))

(declare-fun lt!281288 () Unit!13126)

(assert (=> b!182962 (= lt!281288 lt!281283)))

(declare-fun b!182963 () Bool)

(assert (=> b!182963 (= e!126922 e!126927)))

(declare-fun res!152078 () Bool)

(assert (=> b!182963 (=> (not res!152078) (not e!126927))))

(assert (=> b!182963 (= res!152078 (= (_2!8540 lt!281299) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!182963 (= lt!281299 (readNBitsLSBFirstsLoopPure!0 (_1!8537 lt!281302) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!281322 () Unit!13126)

(declare-fun lt!281327 () Unit!13126)

(assert (=> b!182963 (= lt!281322 lt!281327)))

(declare-fun lt!281311 () (_ BitVec 64))

(assert (=> b!182963 (validate_offset_bits!1 ((_ sign_extend 32) (size!4295 (buf!4747 (_2!8538 lt!281319)))) ((_ sign_extend 32) (currentByte!8975 (_2!8538 lt!281006))) ((_ sign_extend 32) (currentBit!8970 (_2!8538 lt!281006))) lt!281311)))

(assert (=> b!182963 (= lt!281327 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8538 lt!281006) (buf!4747 (_2!8538 lt!281319)) lt!281311))))

(declare-fun e!126926 () Bool)

(assert (=> b!182963 e!126926))

(declare-fun res!152081 () Bool)

(assert (=> b!182963 (=> (not res!152081) (not e!126926))))

(assert (=> b!182963 (= res!152081 (and (= (size!4295 (buf!4747 (_2!8538 lt!281006))) (size!4295 (buf!4747 (_2!8538 lt!281319)))) (bvsge lt!281311 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!182963 (= lt!281311 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!182963 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!182963 (= lt!281302 (reader!0 (_2!8538 lt!281006) (_2!8538 lt!281319)))))

(declare-fun b!182964 () Bool)

(declare-fun e!126921 () (_ BitVec 64))

(assert (=> b!182964 (= e!126921 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun d!63419 () Bool)

(assert (=> d!63419 e!126922))

(declare-fun res!152080 () Bool)

(assert (=> d!63419 (=> (not res!152080) (not e!126922))))

(assert (=> d!63419 (= res!152080 (invariant!0 (currentBit!8970 (_2!8538 lt!281319)) (currentByte!8975 (_2!8538 lt!281319)) (size!4295 (buf!4747 (_2!8538 lt!281319)))))))

(assert (=> d!63419 (= lt!281319 e!126924)))

(assert (=> d!63419 (= c!9402 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!63419 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!63419 (= (appendBitsLSBFirstLoopTR!0 (_2!8538 lt!281006) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!281319)))

(declare-fun b!182965 () Bool)

(assert (=> b!182965 (= e!126924 (tuple2!15787 (_1!8538 lt!281313) (_2!8538 lt!281313)))))

(assert (=> b!182965 (= lt!281325 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!182965 (= lt!281308 (appendBit!0 (_2!8538 lt!281006) lt!281325))))

(declare-fun res!152079 () Bool)

(assert (=> b!182965 (= res!152079 (= (size!4295 (buf!4747 (_2!8538 lt!281006))) (size!4295 (buf!4747 (_2!8538 lt!281308)))))))

(assert (=> b!182965 (=> (not res!152079) (not e!126923))))

(assert (=> b!182965 e!126923))

(declare-fun lt!281310 () tuple2!15786)

(assert (=> b!182965 (= lt!281310 lt!281308)))

(assert (=> b!182965 (= lt!281313 (appendBitsLSBFirstLoopTR!0 (_2!8538 lt!281310) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!281318 () Unit!13126)

(assert (=> b!182965 (= lt!281318 (lemmaIsPrefixTransitive!0 (_2!8538 lt!281006) (_2!8538 lt!281310) (_2!8538 lt!281313)))))

(assert (=> b!182965 call!2966))

(declare-fun lt!281295 () Unit!13126)

(assert (=> b!182965 (= lt!281295 lt!281318)))

(assert (=> b!182965 (invariant!0 (currentBit!8970 (_2!8538 lt!281006)) (currentByte!8975 (_2!8538 lt!281006)) (size!4295 (buf!4747 (_2!8538 lt!281310))))))

(declare-fun lt!281291 () BitStream!7698)

(assert (=> b!182965 (= lt!281291 (BitStream!7699 (buf!4747 (_2!8538 lt!281310)) (currentByte!8975 (_2!8538 lt!281006)) (currentBit!8970 (_2!8538 lt!281006))))))

(assert (=> b!182965 (invariant!0 (currentBit!8970 lt!281291) (currentByte!8975 lt!281291) (size!4295 (buf!4747 (_2!8538 lt!281313))))))

(declare-fun lt!281303 () BitStream!7698)

(assert (=> b!182965 (= lt!281303 (BitStream!7699 (buf!4747 (_2!8538 lt!281313)) (currentByte!8975 lt!281291) (currentBit!8970 lt!281291)))))

(declare-fun lt!281289 () tuple2!15788)

(assert (=> b!182965 (= lt!281289 (readBitPure!0 lt!281291))))

(declare-fun lt!281324 () tuple2!15788)

(assert (=> b!182965 (= lt!281324 (readBitPure!0 lt!281303))))

(declare-fun lt!281328 () Unit!13126)

(assert (=> b!182965 (= lt!281328 (readBitPrefixLemma!0 lt!281291 (_2!8538 lt!281313)))))

(declare-fun res!152082 () Bool)

(assert (=> b!182965 (= res!152082 (= (bitIndex!0 (size!4295 (buf!4747 (_1!8539 lt!281289))) (currentByte!8975 (_1!8539 lt!281289)) (currentBit!8970 (_1!8539 lt!281289))) (bitIndex!0 (size!4295 (buf!4747 (_1!8539 lt!281324))) (currentByte!8975 (_1!8539 lt!281324)) (currentBit!8970 (_1!8539 lt!281324)))))))

(declare-fun e!126920 () Bool)

(assert (=> b!182965 (=> (not res!152082) (not e!126920))))

(assert (=> b!182965 e!126920))

(declare-fun lt!281304 () Unit!13126)

(assert (=> b!182965 (= lt!281304 lt!281328)))

(declare-fun lt!281282 () tuple2!15784)

(assert (=> b!182965 (= lt!281282 (reader!0 (_2!8538 lt!281006) (_2!8538 lt!281313)))))

(declare-fun lt!281317 () tuple2!15784)

(assert (=> b!182965 (= lt!281317 (reader!0 (_2!8538 lt!281310) (_2!8538 lt!281313)))))

(declare-fun lt!281285 () tuple2!15788)

(assert (=> b!182965 (= lt!281285 (readBitPure!0 (_1!8537 lt!281282)))))

(assert (=> b!182965 (= (_2!8539 lt!281285) lt!281325)))

(declare-fun lt!281294 () Unit!13126)

(declare-fun Unit!13131 () Unit!13126)

(assert (=> b!182965 (= lt!281294 Unit!13131)))

(declare-fun lt!281284 () (_ BitVec 64))

(assert (=> b!182965 (= lt!281284 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!281286 () (_ BitVec 64))

(assert (=> b!182965 (= lt!281286 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!281307 () Unit!13126)

(assert (=> b!182965 (= lt!281307 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8538 lt!281006) (buf!4747 (_2!8538 lt!281313)) lt!281286))))

(assert (=> b!182965 (validate_offset_bits!1 ((_ sign_extend 32) (size!4295 (buf!4747 (_2!8538 lt!281313)))) ((_ sign_extend 32) (currentByte!8975 (_2!8538 lt!281006))) ((_ sign_extend 32) (currentBit!8970 (_2!8538 lt!281006))) lt!281286)))

(declare-fun lt!281293 () Unit!13126)

(assert (=> b!182965 (= lt!281293 lt!281307)))

(declare-fun lt!281323 () tuple2!15790)

(assert (=> b!182965 (= lt!281323 (readNBitsLSBFirstsLoopPure!0 (_1!8537 lt!281282) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!281284))))

(declare-fun lt!281301 () (_ BitVec 64))

(assert (=> b!182965 (= lt!281301 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!281333 () Unit!13126)

(assert (=> b!182965 (= lt!281333 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8538 lt!281310) (buf!4747 (_2!8538 lt!281313)) lt!281301))))

(assert (=> b!182965 (validate_offset_bits!1 ((_ sign_extend 32) (size!4295 (buf!4747 (_2!8538 lt!281313)))) ((_ sign_extend 32) (currentByte!8975 (_2!8538 lt!281310))) ((_ sign_extend 32) (currentBit!8970 (_2!8538 lt!281310))) lt!281301)))

(declare-fun lt!281279 () Unit!13126)

(assert (=> b!182965 (= lt!281279 lt!281333)))

(declare-fun lt!281292 () tuple2!15790)

(assert (=> b!182965 (= lt!281292 (readNBitsLSBFirstsLoopPure!0 (_1!8537 lt!281317) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!281284 (ite (_2!8539 lt!281285) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!281331 () tuple2!15790)

(assert (=> b!182965 (= lt!281331 (readNBitsLSBFirstsLoopPure!0 (_1!8537 lt!281282) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!281284))))

(declare-fun c!9401 () Bool)

(assert (=> b!182965 (= c!9401 (_2!8539 (readBitPure!0 (_1!8537 lt!281282))))))

(declare-fun lt!281329 () tuple2!15790)

(declare-fun withMovedBitIndex!0 (BitStream!7698 (_ BitVec 64)) BitStream!7698)

(assert (=> b!182965 (= lt!281329 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8537 lt!281282) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!281284 e!126921)))))

(declare-fun lt!281320 () Unit!13126)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7698 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13126)

(assert (=> b!182965 (= lt!281320 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8537 lt!281282) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!281284))))

(assert (=> b!182965 (and (= (_2!8540 lt!281331) (_2!8540 lt!281329)) (= (_1!8540 lt!281331) (_1!8540 lt!281329)))))

(declare-fun lt!281314 () Unit!13126)

(assert (=> b!182965 (= lt!281314 lt!281320)))

(assert (=> b!182965 (= (_1!8537 lt!281282) (withMovedBitIndex!0 (_2!8537 lt!281282) (bvsub (bitIndex!0 (size!4295 (buf!4747 (_2!8538 lt!281006))) (currentByte!8975 (_2!8538 lt!281006)) (currentBit!8970 (_2!8538 lt!281006))) (bitIndex!0 (size!4295 (buf!4747 (_2!8538 lt!281313))) (currentByte!8975 (_2!8538 lt!281313)) (currentBit!8970 (_2!8538 lt!281313))))))))

(declare-fun lt!281287 () Unit!13126)

(declare-fun Unit!13132 () Unit!13126)

(assert (=> b!182965 (= lt!281287 Unit!13132)))

(assert (=> b!182965 (= (_1!8537 lt!281317) (withMovedBitIndex!0 (_2!8537 lt!281317) (bvsub (bitIndex!0 (size!4295 (buf!4747 (_2!8538 lt!281310))) (currentByte!8975 (_2!8538 lt!281310)) (currentBit!8970 (_2!8538 lt!281310))) (bitIndex!0 (size!4295 (buf!4747 (_2!8538 lt!281313))) (currentByte!8975 (_2!8538 lt!281313)) (currentBit!8970 (_2!8538 lt!281313))))))))

(declare-fun lt!281316 () Unit!13126)

(declare-fun Unit!13133 () Unit!13126)

(assert (=> b!182965 (= lt!281316 Unit!13133)))

(assert (=> b!182965 (= (bitIndex!0 (size!4295 (buf!4747 (_2!8538 lt!281006))) (currentByte!8975 (_2!8538 lt!281006)) (currentBit!8970 (_2!8538 lt!281006))) (bvsub (bitIndex!0 (size!4295 (buf!4747 (_2!8538 lt!281310))) (currentByte!8975 (_2!8538 lt!281310)) (currentBit!8970 (_2!8538 lt!281310))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!281332 () Unit!13126)

(declare-fun Unit!13134 () Unit!13126)

(assert (=> b!182965 (= lt!281332 Unit!13134)))

(assert (=> b!182965 (= (_2!8540 lt!281323) (_2!8540 lt!281292))))

(declare-fun lt!281296 () Unit!13126)

(declare-fun Unit!13135 () Unit!13126)

(assert (=> b!182965 (= lt!281296 Unit!13135)))

(assert (=> b!182965 (invariant!0 (currentBit!8970 (_2!8538 lt!281313)) (currentByte!8975 (_2!8538 lt!281313)) (size!4295 (buf!4747 (_2!8538 lt!281313))))))

(declare-fun lt!281290 () Unit!13126)

(declare-fun Unit!13136 () Unit!13126)

(assert (=> b!182965 (= lt!281290 Unit!13136)))

(assert (=> b!182965 (= (size!4295 (buf!4747 (_2!8538 lt!281006))) (size!4295 (buf!4747 (_2!8538 lt!281313))))))

(declare-fun lt!281309 () Unit!13126)

(declare-fun Unit!13137 () Unit!13126)

(assert (=> b!182965 (= lt!281309 Unit!13137)))

(assert (=> b!182965 (= (bitIndex!0 (size!4295 (buf!4747 (_2!8538 lt!281313))) (currentByte!8975 (_2!8538 lt!281313)) (currentBit!8970 (_2!8538 lt!281313))) (bvsub (bvadd (bitIndex!0 (size!4295 (buf!4747 (_2!8538 lt!281006))) (currentByte!8975 (_2!8538 lt!281006)) (currentBit!8970 (_2!8538 lt!281006))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!281326 () Unit!13126)

(declare-fun Unit!13138 () Unit!13126)

(assert (=> b!182965 (= lt!281326 Unit!13138)))

(declare-fun lt!281315 () Unit!13126)

(declare-fun Unit!13139 () Unit!13126)

(assert (=> b!182965 (= lt!281315 Unit!13139)))

(assert (=> b!182965 (= lt!281300 (reader!0 (_2!8538 lt!281006) (_2!8538 lt!281313)))))

(declare-fun lt!281306 () (_ BitVec 64))

(assert (=> b!182965 (= lt!281306 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!281281 () Unit!13126)

(assert (=> b!182965 (= lt!281281 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8538 lt!281006) (buf!4747 (_2!8538 lt!281313)) lt!281306))))

(assert (=> b!182965 (validate_offset_bits!1 ((_ sign_extend 32) (size!4295 (buf!4747 (_2!8538 lt!281313)))) ((_ sign_extend 32) (currentByte!8975 (_2!8538 lt!281006))) ((_ sign_extend 32) (currentBit!8970 (_2!8538 lt!281006))) lt!281306)))

(declare-fun lt!281297 () Unit!13126)

(assert (=> b!182965 (= lt!281297 lt!281281)))

(assert (=> b!182965 (= lt!281312 (readNBitsLSBFirstsLoopPure!0 (_1!8537 lt!281300) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!152077 () Bool)

(assert (=> b!182965 (= res!152077 (= (_2!8540 lt!281312) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!182965 (=> (not res!152077) (not e!126928))))

(assert (=> b!182965 e!126928))

(declare-fun lt!281330 () Unit!13126)

(declare-fun Unit!13140 () Unit!13126)

(assert (=> b!182965 (= lt!281330 Unit!13140)))

(declare-fun b!182966 () Bool)

(declare-fun res!152083 () Bool)

(assert (=> b!182966 (=> (not res!152083) (not e!126922))))

(assert (=> b!182966 (= res!152083 (isPrefixOf!0 (_2!8538 lt!281006) (_2!8538 lt!281319)))))

(declare-fun b!182967 () Bool)

(assert (=> b!182967 (= e!126926 (validate_offset_bits!1 ((_ sign_extend 32) (size!4295 (buf!4747 (_2!8538 lt!281006)))) ((_ sign_extend 32) (currentByte!8975 (_2!8538 lt!281006))) ((_ sign_extend 32) (currentBit!8970 (_2!8538 lt!281006))) lt!281311))))

(declare-fun b!182968 () Bool)

(assert (=> b!182968 (= e!126920 (= (_2!8539 lt!281289) (_2!8539 lt!281324)))))

(declare-fun b!182969 () Bool)

(assert (=> b!182969 (= e!126921 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!182970 () Bool)

(assert (=> b!182970 (= e!126925 (= (bitIndex!0 (size!4295 (buf!4747 (_1!8539 lt!281298))) (currentByte!8975 (_1!8539 lt!281298)) (currentBit!8970 (_1!8539 lt!281298))) (bitIndex!0 (size!4295 (buf!4747 (_2!8538 lt!281308))) (currentByte!8975 (_2!8538 lt!281308)) (currentBit!8970 (_2!8538 lt!281308)))))))

(assert (= (and d!63419 c!9402) b!182962))

(assert (= (and d!63419 (not c!9402)) b!182965))

(assert (= (and b!182965 res!152079) b!182957))

(assert (= (and b!182957 res!152084) b!182958))

(assert (= (and b!182958 res!152076) b!182959))

(assert (= (and b!182959 res!152085) b!182970))

(assert (= (and b!182965 res!152082) b!182968))

(assert (= (and b!182965 c!9401) b!182969))

(assert (= (and b!182965 (not c!9401)) b!182964))

(assert (= (and b!182965 res!152077) b!182961))

(assert (= (or b!182962 b!182965) bm!2963))

(assert (= (and d!63419 res!152080) b!182960))

(assert (= (and b!182960 res!152075) b!182956))

(assert (= (and b!182956 res!152086) b!182966))

(assert (= (and b!182966 res!152083) b!182963))

(assert (= (and b!182963 res!152081) b!182967))

(assert (= (and b!182963 res!152078) b!182955))

(declare-fun m!284527 () Bool)

(assert (=> b!182970 m!284527))

(declare-fun m!284529 () Bool)

(assert (=> b!182970 m!284529))

(declare-fun m!284531 () Bool)

(assert (=> b!182958 m!284531))

(declare-fun m!284533 () Bool)

(assert (=> d!63419 m!284533))

(declare-fun m!284535 () Bool)

(assert (=> b!182965 m!284535))

(declare-fun m!284537 () Bool)

(assert (=> b!182965 m!284537))

(declare-fun m!284539 () Bool)

(assert (=> b!182965 m!284539))

(declare-fun m!284541 () Bool)

(assert (=> b!182965 m!284541))

(declare-fun m!284543 () Bool)

(assert (=> b!182965 m!284543))

(declare-fun m!284545 () Bool)

(assert (=> b!182965 m!284545))

(declare-fun m!284547 () Bool)

(assert (=> b!182965 m!284547))

(declare-fun m!284549 () Bool)

(assert (=> b!182965 m!284549))

(declare-fun m!284551 () Bool)

(assert (=> b!182965 m!284551))

(assert (=> b!182965 m!284537))

(declare-fun m!284553 () Bool)

(assert (=> b!182965 m!284553))

(declare-fun m!284555 () Bool)

(assert (=> b!182965 m!284555))

(declare-fun m!284557 () Bool)

(assert (=> b!182965 m!284557))

(declare-fun m!284559 () Bool)

(assert (=> b!182965 m!284559))

(declare-fun m!284561 () Bool)

(assert (=> b!182965 m!284561))

(declare-fun m!284563 () Bool)

(assert (=> b!182965 m!284563))

(declare-fun m!284565 () Bool)

(assert (=> b!182965 m!284565))

(declare-fun m!284567 () Bool)

(assert (=> b!182965 m!284567))

(declare-fun m!284569 () Bool)

(assert (=> b!182965 m!284569))

(declare-fun m!284571 () Bool)

(assert (=> b!182965 m!284571))

(declare-fun m!284573 () Bool)

(assert (=> b!182965 m!284573))

(declare-fun m!284575 () Bool)

(assert (=> b!182965 m!284575))

(declare-fun m!284577 () Bool)

(assert (=> b!182965 m!284577))

(declare-fun m!284579 () Bool)

(assert (=> b!182965 m!284579))

(declare-fun m!284581 () Bool)

(assert (=> b!182965 m!284581))

(declare-fun m!284583 () Bool)

(assert (=> b!182965 m!284583))

(declare-fun m!284585 () Bool)

(assert (=> b!182965 m!284585))

(declare-fun m!284587 () Bool)

(assert (=> b!182965 m!284587))

(declare-fun m!284589 () Bool)

(assert (=> b!182965 m!284589))

(declare-fun m!284591 () Bool)

(assert (=> b!182965 m!284591))

(declare-fun m!284593 () Bool)

(assert (=> b!182965 m!284593))

(declare-fun m!284595 () Bool)

(assert (=> b!182965 m!284595))

(declare-fun m!284597 () Bool)

(assert (=> b!182965 m!284597))

(assert (=> b!182965 m!284405))

(declare-fun m!284599 () Bool)

(assert (=> b!182956 m!284599))

(assert (=> b!182956 m!284405))

(declare-fun m!284601 () Bool)

(assert (=> b!182963 m!284601))

(assert (=> b!182963 m!284547))

(declare-fun m!284603 () Bool)

(assert (=> b!182963 m!284603))

(declare-fun m!284605 () Bool)

(assert (=> b!182963 m!284605))

(declare-fun m!284607 () Bool)

(assert (=> b!182963 m!284607))

(assert (=> b!182963 m!284559))

(declare-fun m!284609 () Bool)

(assert (=> b!182966 m!284609))

(declare-fun m!284611 () Bool)

(assert (=> b!182967 m!284611))

(assert (=> b!182957 m!284529))

(assert (=> b!182957 m!284405))

(declare-fun m!284613 () Bool)

(assert (=> b!182962 m!284613))

(declare-fun m!284615 () Bool)

(assert (=> bm!2963 m!284615))

(declare-fun m!284617 () Bool)

(assert (=> b!182959 m!284617))

(assert (=> b!182959 m!284617))

(declare-fun m!284619 () Bool)

(assert (=> b!182959 m!284619))

(assert (=> b!182812 d!63419))

(declare-fun d!63451 () Bool)

(assert (=> d!63451 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4295 (buf!4747 thiss!1204))) ((_ sign_extend 32) (currentByte!8975 thiss!1204)) ((_ sign_extend 32) (currentBit!8970 thiss!1204)) lt!281009) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4295 (buf!4747 thiss!1204))) ((_ sign_extend 32) (currentByte!8975 thiss!1204)) ((_ sign_extend 32) (currentBit!8970 thiss!1204))) lt!281009))))

(declare-fun bs!15797 () Bool)

(assert (= bs!15797 d!63451))

(declare-fun m!284621 () Bool)

(assert (=> bs!15797 m!284621))

(assert (=> b!182802 d!63451))

(declare-fun d!63453 () Bool)

(assert (=> d!63453 (= (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 (bvadd #b00000000000000000000000000000001 i!590))) (ite (= (bvsub #b00000000000000000000000001000000 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000 (bvshl #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub #b00000000000000000000000001000000 (bvadd #b00000000000000000000000000000001 i!590)))))))))

(assert (=> b!182813 d!63453))

(declare-fun d!63455 () Bool)

(declare-fun res!152087 () Bool)

(declare-fun e!126929 () Bool)

(assert (=> d!63455 (=> (not res!152087) (not e!126929))))

(assert (=> d!63455 (= res!152087 (= (size!4295 (buf!4747 thiss!1204)) (size!4295 (buf!4747 (_2!8538 lt!281006)))))))

(assert (=> d!63455 (= (isPrefixOf!0 thiss!1204 (_2!8538 lt!281006)) e!126929)))

(declare-fun b!182971 () Bool)

(declare-fun res!152088 () Bool)

(assert (=> b!182971 (=> (not res!152088) (not e!126929))))

(assert (=> b!182971 (= res!152088 (bvsle (bitIndex!0 (size!4295 (buf!4747 thiss!1204)) (currentByte!8975 thiss!1204) (currentBit!8970 thiss!1204)) (bitIndex!0 (size!4295 (buf!4747 (_2!8538 lt!281006))) (currentByte!8975 (_2!8538 lt!281006)) (currentBit!8970 (_2!8538 lt!281006)))))))

(declare-fun b!182972 () Bool)

(declare-fun e!126930 () Bool)

(assert (=> b!182972 (= e!126929 e!126930)))

(declare-fun res!152089 () Bool)

(assert (=> b!182972 (=> res!152089 e!126930)))

(assert (=> b!182972 (= res!152089 (= (size!4295 (buf!4747 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!182973 () Bool)

(assert (=> b!182973 (= e!126930 (arrayBitRangesEq!0 (buf!4747 thiss!1204) (buf!4747 (_2!8538 lt!281006)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4295 (buf!4747 thiss!1204)) (currentByte!8975 thiss!1204) (currentBit!8970 thiss!1204))))))

(assert (= (and d!63455 res!152087) b!182971))

(assert (= (and b!182971 res!152088) b!182972))

(assert (= (and b!182972 (not res!152089)) b!182973))

(assert (=> b!182971 m!284407))

(assert (=> b!182971 m!284405))

(assert (=> b!182973 m!284407))

(assert (=> b!182973 m!284407))

(declare-fun m!284623 () Bool)

(assert (=> b!182973 m!284623))

(assert (=> b!182803 d!63455))

(assert (=> b!182814 d!63455))

(declare-fun d!63457 () Bool)

(declare-fun e!126931 () Bool)

(assert (=> d!63457 e!126931))

(declare-fun res!152091 () Bool)

(assert (=> d!63457 (=> (not res!152091) (not e!126931))))

(declare-fun lt!281335 () (_ BitVec 64))

(declare-fun lt!281334 () (_ BitVec 64))

(declare-fun lt!281337 () (_ BitVec 64))

(assert (=> d!63457 (= res!152091 (= lt!281334 (bvsub lt!281335 lt!281337)))))

(assert (=> d!63457 (or (= (bvand lt!281335 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!281337 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!281335 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!281335 lt!281337) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63457 (= lt!281337 (remainingBits!0 ((_ sign_extend 32) (size!4295 (buf!4747 (_2!8538 lt!281006)))) ((_ sign_extend 32) (currentByte!8975 (_2!8538 lt!281006))) ((_ sign_extend 32) (currentBit!8970 (_2!8538 lt!281006)))))))

(declare-fun lt!281338 () (_ BitVec 64))

(declare-fun lt!281339 () (_ BitVec 64))

(assert (=> d!63457 (= lt!281335 (bvmul lt!281338 lt!281339))))

(assert (=> d!63457 (or (= lt!281338 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!281339 (bvsdiv (bvmul lt!281338 lt!281339) lt!281338)))))

(assert (=> d!63457 (= lt!281339 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63457 (= lt!281338 ((_ sign_extend 32) (size!4295 (buf!4747 (_2!8538 lt!281006)))))))

(assert (=> d!63457 (= lt!281334 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8975 (_2!8538 lt!281006))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8970 (_2!8538 lt!281006)))))))

(assert (=> d!63457 (invariant!0 (currentBit!8970 (_2!8538 lt!281006)) (currentByte!8975 (_2!8538 lt!281006)) (size!4295 (buf!4747 (_2!8538 lt!281006))))))

(assert (=> d!63457 (= (bitIndex!0 (size!4295 (buf!4747 (_2!8538 lt!281006))) (currentByte!8975 (_2!8538 lt!281006)) (currentBit!8970 (_2!8538 lt!281006))) lt!281334)))

(declare-fun b!182974 () Bool)

(declare-fun res!152090 () Bool)

(assert (=> b!182974 (=> (not res!152090) (not e!126931))))

(assert (=> b!182974 (= res!152090 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!281334))))

(declare-fun b!182975 () Bool)

(declare-fun lt!281336 () (_ BitVec 64))

(assert (=> b!182975 (= e!126931 (bvsle lt!281334 (bvmul lt!281336 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!182975 (or (= lt!281336 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!281336 #b0000000000000000000000000000000000000000000000000000000000001000) lt!281336)))))

(assert (=> b!182975 (= lt!281336 ((_ sign_extend 32) (size!4295 (buf!4747 (_2!8538 lt!281006)))))))

(assert (= (and d!63457 res!152091) b!182974))

(assert (= (and b!182974 res!152090) b!182975))

(declare-fun m!284625 () Bool)

(assert (=> d!63457 m!284625))

(declare-fun m!284627 () Bool)

(assert (=> d!63457 m!284627))

(assert (=> b!182815 d!63457))

(declare-fun d!63459 () Bool)

(declare-fun e!126932 () Bool)

(assert (=> d!63459 e!126932))

(declare-fun res!152093 () Bool)

(assert (=> d!63459 (=> (not res!152093) (not e!126932))))

(declare-fun lt!281343 () (_ BitVec 64))

(declare-fun lt!281341 () (_ BitVec 64))

(declare-fun lt!281340 () (_ BitVec 64))

(assert (=> d!63459 (= res!152093 (= lt!281340 (bvsub lt!281341 lt!281343)))))

(assert (=> d!63459 (or (= (bvand lt!281341 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!281343 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!281341 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!281341 lt!281343) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63459 (= lt!281343 (remainingBits!0 ((_ sign_extend 32) (size!4295 (buf!4747 thiss!1204))) ((_ sign_extend 32) (currentByte!8975 thiss!1204)) ((_ sign_extend 32) (currentBit!8970 thiss!1204))))))

(declare-fun lt!281344 () (_ BitVec 64))

(declare-fun lt!281345 () (_ BitVec 64))

(assert (=> d!63459 (= lt!281341 (bvmul lt!281344 lt!281345))))

(assert (=> d!63459 (or (= lt!281344 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!281345 (bvsdiv (bvmul lt!281344 lt!281345) lt!281344)))))

(assert (=> d!63459 (= lt!281345 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63459 (= lt!281344 ((_ sign_extend 32) (size!4295 (buf!4747 thiss!1204))))))

(assert (=> d!63459 (= lt!281340 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8975 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8970 thiss!1204))))))

(assert (=> d!63459 (invariant!0 (currentBit!8970 thiss!1204) (currentByte!8975 thiss!1204) (size!4295 (buf!4747 thiss!1204)))))

(assert (=> d!63459 (= (bitIndex!0 (size!4295 (buf!4747 thiss!1204)) (currentByte!8975 thiss!1204) (currentBit!8970 thiss!1204)) lt!281340)))

(declare-fun b!182976 () Bool)

(declare-fun res!152092 () Bool)

(assert (=> b!182976 (=> (not res!152092) (not e!126932))))

(assert (=> b!182976 (= res!152092 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!281340))))

(declare-fun b!182977 () Bool)

(declare-fun lt!281342 () (_ BitVec 64))

(assert (=> b!182977 (= e!126932 (bvsle lt!281340 (bvmul lt!281342 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!182977 (or (= lt!281342 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!281342 #b0000000000000000000000000000000000000000000000000000000000001000) lt!281342)))))

(assert (=> b!182977 (= lt!281342 ((_ sign_extend 32) (size!4295 (buf!4747 thiss!1204))))))

(assert (= (and d!63459 res!152093) b!182976))

(assert (= (and b!182976 res!152092) b!182977))

(assert (=> d!63459 m!284621))

(assert (=> d!63459 m!284411))

(assert (=> b!182815 d!63459))

(declare-fun b!182988 () Bool)

(declare-fun res!152102 () Bool)

(declare-fun e!126938 () Bool)

(assert (=> b!182988 (=> (not res!152102) (not e!126938))))

(declare-fun lt!281356 () tuple2!15786)

(assert (=> b!182988 (= res!152102 (isPrefixOf!0 thiss!1204 (_2!8538 lt!281356)))))

(declare-fun b!182989 () Bool)

(declare-fun e!126937 () Bool)

(assert (=> b!182989 (= e!126938 e!126937)))

(declare-fun res!152103 () Bool)

(assert (=> b!182989 (=> (not res!152103) (not e!126937))))

(declare-fun lt!281354 () tuple2!15788)

(assert (=> b!182989 (= res!152103 (and (= (_2!8539 lt!281354) lt!281010) (= (_1!8539 lt!281354) (_2!8538 lt!281356))))))

(assert (=> b!182989 (= lt!281354 (readBitPure!0 (readerFrom!0 (_2!8538 lt!281356) (currentBit!8970 thiss!1204) (currentByte!8975 thiss!1204))))))

(declare-fun b!182987 () Bool)

(declare-fun res!152104 () Bool)

(assert (=> b!182987 (=> (not res!152104) (not e!126938))))

(declare-fun lt!281355 () (_ BitVec 64))

(declare-fun lt!281357 () (_ BitVec 64))

(assert (=> b!182987 (= res!152104 (= (bitIndex!0 (size!4295 (buf!4747 (_2!8538 lt!281356))) (currentByte!8975 (_2!8538 lt!281356)) (currentBit!8970 (_2!8538 lt!281356))) (bvadd lt!281355 lt!281357)))))

(assert (=> b!182987 (or (not (= (bvand lt!281355 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!281357 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!281355 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!281355 lt!281357) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!182987 (= lt!281357 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!182987 (= lt!281355 (bitIndex!0 (size!4295 (buf!4747 thiss!1204)) (currentByte!8975 thiss!1204) (currentBit!8970 thiss!1204)))))

(declare-fun d!63461 () Bool)

(assert (=> d!63461 e!126938))

(declare-fun res!152105 () Bool)

(assert (=> d!63461 (=> (not res!152105) (not e!126938))))

(assert (=> d!63461 (= res!152105 (= (size!4295 (buf!4747 thiss!1204)) (size!4295 (buf!4747 (_2!8538 lt!281356)))))))

(declare-fun choose!16 (BitStream!7698 Bool) tuple2!15786)

(assert (=> d!63461 (= lt!281356 (choose!16 thiss!1204 lt!281010))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!63461 (validate_offset_bit!0 ((_ sign_extend 32) (size!4295 (buf!4747 thiss!1204))) ((_ sign_extend 32) (currentByte!8975 thiss!1204)) ((_ sign_extend 32) (currentBit!8970 thiss!1204)))))

(assert (=> d!63461 (= (appendBit!0 thiss!1204 lt!281010) lt!281356)))

(declare-fun b!182990 () Bool)

(assert (=> b!182990 (= e!126937 (= (bitIndex!0 (size!4295 (buf!4747 (_1!8539 lt!281354))) (currentByte!8975 (_1!8539 lt!281354)) (currentBit!8970 (_1!8539 lt!281354))) (bitIndex!0 (size!4295 (buf!4747 (_2!8538 lt!281356))) (currentByte!8975 (_2!8538 lt!281356)) (currentBit!8970 (_2!8538 lt!281356)))))))

(assert (= (and d!63461 res!152105) b!182987))

(assert (= (and b!182987 res!152104) b!182988))

(assert (= (and b!182988 res!152102) b!182989))

(assert (= (and b!182989 res!152103) b!182990))

(declare-fun m!284629 () Bool)

(assert (=> b!182990 m!284629))

(declare-fun m!284631 () Bool)

(assert (=> b!182990 m!284631))

(declare-fun m!284633 () Bool)

(assert (=> b!182988 m!284633))

(declare-fun m!284635 () Bool)

(assert (=> b!182989 m!284635))

(assert (=> b!182989 m!284635))

(declare-fun m!284637 () Bool)

(assert (=> b!182989 m!284637))

(declare-fun m!284639 () Bool)

(assert (=> d!63461 m!284639))

(declare-fun m!284641 () Bool)

(assert (=> d!63461 m!284641))

(assert (=> b!182987 m!284631))

(assert (=> b!182987 m!284407))

(assert (=> b!182815 d!63461))

(declare-fun d!63463 () Bool)

(declare-fun e!126939 () Bool)

(assert (=> d!63463 e!126939))

(declare-fun res!152107 () Bool)

(assert (=> d!63463 (=> (not res!152107) (not e!126939))))

(declare-fun lt!281361 () (_ BitVec 64))

(declare-fun lt!281358 () (_ BitVec 64))

(declare-fun lt!281359 () (_ BitVec 64))

(assert (=> d!63463 (= res!152107 (= lt!281358 (bvsub lt!281359 lt!281361)))))

(assert (=> d!63463 (or (= (bvand lt!281359 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!281361 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!281359 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!281359 lt!281361) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63463 (= lt!281361 (remainingBits!0 ((_ sign_extend 32) (size!4295 (buf!4747 (_1!8539 lt!281025)))) ((_ sign_extend 32) (currentByte!8975 (_1!8539 lt!281025))) ((_ sign_extend 32) (currentBit!8970 (_1!8539 lt!281025)))))))

(declare-fun lt!281362 () (_ BitVec 64))

(declare-fun lt!281363 () (_ BitVec 64))

(assert (=> d!63463 (= lt!281359 (bvmul lt!281362 lt!281363))))

(assert (=> d!63463 (or (= lt!281362 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!281363 (bvsdiv (bvmul lt!281362 lt!281363) lt!281362)))))

(assert (=> d!63463 (= lt!281363 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63463 (= lt!281362 ((_ sign_extend 32) (size!4295 (buf!4747 (_1!8539 lt!281025)))))))

(assert (=> d!63463 (= lt!281358 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8975 (_1!8539 lt!281025))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8970 (_1!8539 lt!281025)))))))

(assert (=> d!63463 (invariant!0 (currentBit!8970 (_1!8539 lt!281025)) (currentByte!8975 (_1!8539 lt!281025)) (size!4295 (buf!4747 (_1!8539 lt!281025))))))

(assert (=> d!63463 (= (bitIndex!0 (size!4295 (buf!4747 (_1!8539 lt!281025))) (currentByte!8975 (_1!8539 lt!281025)) (currentBit!8970 (_1!8539 lt!281025))) lt!281358)))

(declare-fun b!182991 () Bool)

(declare-fun res!152106 () Bool)

(assert (=> b!182991 (=> (not res!152106) (not e!126939))))

(assert (=> b!182991 (= res!152106 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!281358))))

(declare-fun b!182992 () Bool)

(declare-fun lt!281360 () (_ BitVec 64))

(assert (=> b!182992 (= e!126939 (bvsle lt!281358 (bvmul lt!281360 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!182992 (or (= lt!281360 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!281360 #b0000000000000000000000000000000000000000000000000000000000001000) lt!281360)))))

(assert (=> b!182992 (= lt!281360 ((_ sign_extend 32) (size!4295 (buf!4747 (_1!8539 lt!281025)))))))

(assert (= (and d!63463 res!152107) b!182991))

(assert (= (and b!182991 res!152106) b!182992))

(declare-fun m!284643 () Bool)

(assert (=> d!63463 m!284643))

(declare-fun m!284645 () Bool)

(assert (=> d!63463 m!284645))

(assert (=> b!182805 d!63463))

(declare-fun d!63465 () Bool)

(declare-fun res!152108 () Bool)

(declare-fun e!126940 () Bool)

(assert (=> d!63465 (=> (not res!152108) (not e!126940))))

(assert (=> d!63465 (= res!152108 (= (size!4295 (buf!4747 (_2!8538 lt!281006))) (size!4295 (buf!4747 (_2!8538 lt!281018)))))))

(assert (=> d!63465 (= (isPrefixOf!0 (_2!8538 lt!281006) (_2!8538 lt!281018)) e!126940)))

(declare-fun b!182993 () Bool)

(declare-fun res!152109 () Bool)

(assert (=> b!182993 (=> (not res!152109) (not e!126940))))

(assert (=> b!182993 (= res!152109 (bvsle (bitIndex!0 (size!4295 (buf!4747 (_2!8538 lt!281006))) (currentByte!8975 (_2!8538 lt!281006)) (currentBit!8970 (_2!8538 lt!281006))) (bitIndex!0 (size!4295 (buf!4747 (_2!8538 lt!281018))) (currentByte!8975 (_2!8538 lt!281018)) (currentBit!8970 (_2!8538 lt!281018)))))))

(declare-fun b!182994 () Bool)

(declare-fun e!126941 () Bool)

(assert (=> b!182994 (= e!126940 e!126941)))

(declare-fun res!152110 () Bool)

(assert (=> b!182994 (=> res!152110 e!126941)))

(assert (=> b!182994 (= res!152110 (= (size!4295 (buf!4747 (_2!8538 lt!281006))) #b00000000000000000000000000000000))))

(declare-fun b!182995 () Bool)

(assert (=> b!182995 (= e!126941 (arrayBitRangesEq!0 (buf!4747 (_2!8538 lt!281006)) (buf!4747 (_2!8538 lt!281018)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4295 (buf!4747 (_2!8538 lt!281006))) (currentByte!8975 (_2!8538 lt!281006)) (currentBit!8970 (_2!8538 lt!281006)))))))

(assert (= (and d!63465 res!152108) b!182993))

(assert (= (and b!182993 res!152109) b!182994))

(assert (= (and b!182994 (not res!152110)) b!182995))

(assert (=> b!182993 m!284405))

(assert (=> b!182993 m!284421))

(assert (=> b!182995 m!284405))

(assert (=> b!182995 m!284405))

(declare-fun m!284647 () Bool)

(assert (=> b!182995 m!284647))

(assert (=> b!182816 d!63465))

(declare-fun d!63467 () Bool)

(assert (=> d!63467 (= (invariant!0 (currentBit!8970 thiss!1204) (currentByte!8975 thiss!1204) (size!4295 (buf!4747 (_2!8538 lt!281018)))) (and (bvsge (currentBit!8970 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!8970 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!8975 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!8975 thiss!1204) (size!4295 (buf!4747 (_2!8538 lt!281018)))) (and (= (currentBit!8970 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!8975 thiss!1204) (size!4295 (buf!4747 (_2!8538 lt!281018))))))))))

(assert (=> b!182807 d!63467))

(declare-fun d!63469 () Bool)

(assert (=> d!63469 (= (array_inv!4036 (buf!4747 thiss!1204)) (bvsge (size!4295 (buf!4747 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!182808 d!63469))

(declare-fun d!63471 () Bool)

(assert (=> d!63471 (= (invariant!0 (currentBit!8970 (_2!8538 lt!281018)) (currentByte!8975 (_2!8538 lt!281018)) (size!4295 (buf!4747 (_2!8538 lt!281018)))) (and (bvsge (currentBit!8970 (_2!8538 lt!281018)) #b00000000000000000000000000000000) (bvslt (currentBit!8970 (_2!8538 lt!281018)) #b00000000000000000000000000001000) (bvsge (currentByte!8975 (_2!8538 lt!281018)) #b00000000000000000000000000000000) (or (bvslt (currentByte!8975 (_2!8538 lt!281018)) (size!4295 (buf!4747 (_2!8538 lt!281018)))) (and (= (currentBit!8970 (_2!8538 lt!281018)) #b00000000000000000000000000000000) (= (currentByte!8975 (_2!8538 lt!281018)) (size!4295 (buf!4747 (_2!8538 lt!281018))))))))))

(assert (=> b!182809 d!63471))

(declare-fun d!63473 () Bool)

(assert (=> d!63473 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4295 (buf!4747 (_1!8537 lt!281011)))) ((_ sign_extend 32) (currentByte!8975 (_1!8537 lt!281011))) ((_ sign_extend 32) (currentBit!8970 (_1!8537 lt!281011))) ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4295 (buf!4747 (_1!8537 lt!281011)))) ((_ sign_extend 32) (currentByte!8975 (_1!8537 lt!281011))) ((_ sign_extend 32) (currentBit!8970 (_1!8537 lt!281011)))) ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun bs!15798 () Bool)

(assert (= bs!15798 d!63473))

(declare-fun m!284649 () Bool)

(assert (=> bs!15798 m!284649))

(assert (=> b!182799 d!63473))

(declare-fun d!63475 () Bool)

(declare-datatypes ((tuple2!15800 0))(
  ( (tuple2!15801 (_1!8545 Bool) (_2!8545 BitStream!7698)) )
))
(declare-fun lt!281366 () tuple2!15800)

(declare-fun readBit!0 (BitStream!7698) tuple2!15800)

(assert (=> d!63475 (= lt!281366 (readBit!0 (readerFrom!0 (_2!8538 lt!281006) (currentBit!8970 thiss!1204) (currentByte!8975 thiss!1204))))))

(assert (=> d!63475 (= (readBitPure!0 (readerFrom!0 (_2!8538 lt!281006) (currentBit!8970 thiss!1204) (currentByte!8975 thiss!1204))) (tuple2!15789 (_2!8545 lt!281366) (_1!8545 lt!281366)))))

(declare-fun bs!15799 () Bool)

(assert (= bs!15799 d!63475))

(assert (=> bs!15799 m!284415))

(declare-fun m!284651 () Bool)

(assert (=> bs!15799 m!284651))

(assert (=> b!182810 d!63475))

(declare-fun d!63477 () Bool)

(declare-fun e!126944 () Bool)

(assert (=> d!63477 e!126944))

(declare-fun res!152114 () Bool)

(assert (=> d!63477 (=> (not res!152114) (not e!126944))))

(assert (=> d!63477 (= res!152114 (invariant!0 (currentBit!8970 (_2!8538 lt!281006)) (currentByte!8975 (_2!8538 lt!281006)) (size!4295 (buf!4747 (_2!8538 lt!281006)))))))

(assert (=> d!63477 (= (readerFrom!0 (_2!8538 lt!281006) (currentBit!8970 thiss!1204) (currentByte!8975 thiss!1204)) (BitStream!7699 (buf!4747 (_2!8538 lt!281006)) (currentByte!8975 thiss!1204) (currentBit!8970 thiss!1204)))))

(declare-fun b!182998 () Bool)

(assert (=> b!182998 (= e!126944 (invariant!0 (currentBit!8970 thiss!1204) (currentByte!8975 thiss!1204) (size!4295 (buf!4747 (_2!8538 lt!281006)))))))

(assert (= (and d!63477 res!152114) b!182998))

(assert (=> d!63477 m!284627))

(assert (=> b!182998 m!284379))

(assert (=> b!182810 d!63477))

(assert (=> b!182800 d!63457))

(assert (=> b!182800 d!63459))

(declare-fun d!63479 () Bool)

(assert (=> d!63479 (validate_offset_bits!1 ((_ sign_extend 32) (size!4295 (buf!4747 (_2!8538 lt!281018)))) ((_ sign_extend 32) (currentByte!8975 (_2!8538 lt!281006))) ((_ sign_extend 32) (currentBit!8970 (_2!8538 lt!281006))) lt!281016)))

(declare-fun lt!281369 () Unit!13126)

(declare-fun choose!9 (BitStream!7698 array!9739 (_ BitVec 64) BitStream!7698) Unit!13126)

(assert (=> d!63479 (= lt!281369 (choose!9 (_2!8538 lt!281006) (buf!4747 (_2!8538 lt!281018)) lt!281016 (BitStream!7699 (buf!4747 (_2!8538 lt!281018)) (currentByte!8975 (_2!8538 lt!281006)) (currentBit!8970 (_2!8538 lt!281006)))))))

(assert (=> d!63479 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8538 lt!281006) (buf!4747 (_2!8538 lt!281018)) lt!281016) lt!281369)))

(declare-fun bs!15800 () Bool)

(assert (= bs!15800 d!63479))

(assert (=> bs!15800 m!284393))

(declare-fun m!284653 () Bool)

(assert (=> bs!15800 m!284653))

(assert (=> b!182811 d!63479))

(declare-fun d!63481 () Bool)

(declare-fun lt!281370 () tuple2!15800)

(assert (=> d!63481 (= lt!281370 (readBit!0 (BitStream!7699 (buf!4747 (_2!8538 lt!281018)) (currentByte!8975 thiss!1204) (currentBit!8970 thiss!1204))))))

(assert (=> d!63481 (= (readBitPure!0 (BitStream!7699 (buf!4747 (_2!8538 lt!281018)) (currentByte!8975 thiss!1204) (currentBit!8970 thiss!1204))) (tuple2!15789 (_2!8545 lt!281370) (_1!8545 lt!281370)))))

(declare-fun bs!15801 () Bool)

(assert (= bs!15801 d!63481))

(declare-fun m!284655 () Bool)

(assert (=> bs!15801 m!284655))

(assert (=> b!182811 d!63481))

(declare-fun d!63483 () Bool)

(assert (=> d!63483 (= (invariant!0 (currentBit!8970 thiss!1204) (currentByte!8975 thiss!1204) (size!4295 (buf!4747 (_2!8538 lt!281006)))) (and (bvsge (currentBit!8970 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!8970 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!8975 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!8975 thiss!1204) (size!4295 (buf!4747 (_2!8538 lt!281006)))) (and (= (currentBit!8970 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!8975 thiss!1204) (size!4295 (buf!4747 (_2!8538 lt!281006))))))))))

(assert (=> b!182811 d!63483))

(declare-fun d!63485 () Bool)

(declare-fun e!126947 () Bool)

(assert (=> d!63485 e!126947))

(declare-fun res!152117 () Bool)

(assert (=> d!63485 (=> (not res!152117) (not e!126947))))

(declare-fun lt!281381 () tuple2!15788)

(declare-fun lt!281380 () tuple2!15788)

(assert (=> d!63485 (= res!152117 (= (bitIndex!0 (size!4295 (buf!4747 (_1!8539 lt!281381))) (currentByte!8975 (_1!8539 lt!281381)) (currentBit!8970 (_1!8539 lt!281381))) (bitIndex!0 (size!4295 (buf!4747 (_1!8539 lt!281380))) (currentByte!8975 (_1!8539 lt!281380)) (currentBit!8970 (_1!8539 lt!281380)))))))

(declare-fun lt!281379 () Unit!13126)

(declare-fun lt!281382 () BitStream!7698)

(declare-fun choose!50 (BitStream!7698 BitStream!7698 BitStream!7698 tuple2!15788 tuple2!15788 BitStream!7698 Bool tuple2!15788 tuple2!15788 BitStream!7698 Bool) Unit!13126)

(assert (=> d!63485 (= lt!281379 (choose!50 lt!281019 (_2!8538 lt!281018) lt!281382 lt!281381 (tuple2!15789 (_1!8539 lt!281381) (_2!8539 lt!281381)) (_1!8539 lt!281381) (_2!8539 lt!281381) lt!281380 (tuple2!15789 (_1!8539 lt!281380) (_2!8539 lt!281380)) (_1!8539 lt!281380) (_2!8539 lt!281380)))))

(assert (=> d!63485 (= lt!281380 (readBitPure!0 lt!281382))))

(assert (=> d!63485 (= lt!281381 (readBitPure!0 lt!281019))))

(assert (=> d!63485 (= lt!281382 (BitStream!7699 (buf!4747 (_2!8538 lt!281018)) (currentByte!8975 lt!281019) (currentBit!8970 lt!281019)))))

(assert (=> d!63485 (invariant!0 (currentBit!8970 lt!281019) (currentByte!8975 lt!281019) (size!4295 (buf!4747 (_2!8538 lt!281018))))))

(assert (=> d!63485 (= (readBitPrefixLemma!0 lt!281019 (_2!8538 lt!281018)) lt!281379)))

(declare-fun b!183001 () Bool)

(assert (=> b!183001 (= e!126947 (= (_2!8539 lt!281381) (_2!8539 lt!281380)))))

(assert (= (and d!63485 res!152117) b!183001))

(declare-fun m!284657 () Bool)

(assert (=> d!63485 m!284657))

(declare-fun m!284659 () Bool)

(assert (=> d!63485 m!284659))

(declare-fun m!284661 () Bool)

(assert (=> d!63485 m!284661))

(declare-fun m!284663 () Bool)

(assert (=> d!63485 m!284663))

(assert (=> d!63485 m!284397))

(declare-fun m!284665 () Bool)

(assert (=> d!63485 m!284665))

(assert (=> b!182811 d!63485))

(declare-fun d!63487 () Bool)

(declare-fun e!126953 () Bool)

(assert (=> d!63487 e!126953))

(declare-fun res!152124 () Bool)

(assert (=> d!63487 (=> (not res!152124) (not e!126953))))

(declare-fun lt!281425 () tuple2!15784)

(assert (=> d!63487 (= res!152124 (isPrefixOf!0 (_1!8537 lt!281425) (_2!8537 lt!281425)))))

(declare-fun lt!281431 () BitStream!7698)

(assert (=> d!63487 (= lt!281425 (tuple2!15785 lt!281431 (_2!8538 lt!281018)))))

(declare-fun lt!281440 () Unit!13126)

(declare-fun lt!281430 () Unit!13126)

(assert (=> d!63487 (= lt!281440 lt!281430)))

(assert (=> d!63487 (isPrefixOf!0 lt!281431 (_2!8538 lt!281018))))

(assert (=> d!63487 (= lt!281430 (lemmaIsPrefixTransitive!0 lt!281431 (_2!8538 lt!281018) (_2!8538 lt!281018)))))

(declare-fun lt!281424 () Unit!13126)

(declare-fun lt!281437 () Unit!13126)

(assert (=> d!63487 (= lt!281424 lt!281437)))

(assert (=> d!63487 (isPrefixOf!0 lt!281431 (_2!8538 lt!281018))))

(assert (=> d!63487 (= lt!281437 (lemmaIsPrefixTransitive!0 lt!281431 thiss!1204 (_2!8538 lt!281018)))))

(declare-fun lt!281423 () Unit!13126)

(declare-fun e!126952 () Unit!13126)

(assert (=> d!63487 (= lt!281423 e!126952)))

(declare-fun c!9405 () Bool)

(assert (=> d!63487 (= c!9405 (not (= (size!4295 (buf!4747 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!281435 () Unit!13126)

(declare-fun lt!281426 () Unit!13126)

(assert (=> d!63487 (= lt!281435 lt!281426)))

(assert (=> d!63487 (isPrefixOf!0 (_2!8538 lt!281018) (_2!8538 lt!281018))))

(assert (=> d!63487 (= lt!281426 (lemmaIsPrefixRefl!0 (_2!8538 lt!281018)))))

(declare-fun lt!281428 () Unit!13126)

(declare-fun lt!281438 () Unit!13126)

(assert (=> d!63487 (= lt!281428 lt!281438)))

(assert (=> d!63487 (= lt!281438 (lemmaIsPrefixRefl!0 (_2!8538 lt!281018)))))

(declare-fun lt!281433 () Unit!13126)

(declare-fun lt!281436 () Unit!13126)

(assert (=> d!63487 (= lt!281433 lt!281436)))

(assert (=> d!63487 (isPrefixOf!0 lt!281431 lt!281431)))

(assert (=> d!63487 (= lt!281436 (lemmaIsPrefixRefl!0 lt!281431))))

(declare-fun lt!281441 () Unit!13126)

(declare-fun lt!281434 () Unit!13126)

(assert (=> d!63487 (= lt!281441 lt!281434)))

(assert (=> d!63487 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!63487 (= lt!281434 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!63487 (= lt!281431 (BitStream!7699 (buf!4747 (_2!8538 lt!281018)) (currentByte!8975 thiss!1204) (currentBit!8970 thiss!1204)))))

(assert (=> d!63487 (isPrefixOf!0 thiss!1204 (_2!8538 lt!281018))))

(assert (=> d!63487 (= (reader!0 thiss!1204 (_2!8538 lt!281018)) lt!281425)))

(declare-fun b!183012 () Bool)

(declare-fun Unit!13141 () Unit!13126)

(assert (=> b!183012 (= e!126952 Unit!13141)))

(declare-fun b!183013 () Bool)

(declare-fun lt!281429 () Unit!13126)

(assert (=> b!183013 (= e!126952 lt!281429)))

(declare-fun lt!281427 () (_ BitVec 64))

(assert (=> b!183013 (= lt!281427 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!281432 () (_ BitVec 64))

(assert (=> b!183013 (= lt!281432 (bitIndex!0 (size!4295 (buf!4747 thiss!1204)) (currentByte!8975 thiss!1204) (currentBit!8970 thiss!1204)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!9739 array!9739 (_ BitVec 64) (_ BitVec 64)) Unit!13126)

(assert (=> b!183013 (= lt!281429 (arrayBitRangesEqSymmetric!0 (buf!4747 thiss!1204) (buf!4747 (_2!8538 lt!281018)) lt!281427 lt!281432))))

(assert (=> b!183013 (arrayBitRangesEq!0 (buf!4747 (_2!8538 lt!281018)) (buf!4747 thiss!1204) lt!281427 lt!281432)))

(declare-fun lt!281439 () (_ BitVec 64))

(declare-fun lt!281442 () (_ BitVec 64))

(declare-fun b!183014 () Bool)

(assert (=> b!183014 (= e!126953 (= (_1!8537 lt!281425) (withMovedBitIndex!0 (_2!8537 lt!281425) (bvsub lt!281439 lt!281442))))))

(assert (=> b!183014 (or (= (bvand lt!281439 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!281442 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!281439 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!281439 lt!281442) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!183014 (= lt!281442 (bitIndex!0 (size!4295 (buf!4747 (_2!8538 lt!281018))) (currentByte!8975 (_2!8538 lt!281018)) (currentBit!8970 (_2!8538 lt!281018))))))

(assert (=> b!183014 (= lt!281439 (bitIndex!0 (size!4295 (buf!4747 thiss!1204)) (currentByte!8975 thiss!1204) (currentBit!8970 thiss!1204)))))

(declare-fun b!183015 () Bool)

(declare-fun res!152126 () Bool)

(assert (=> b!183015 (=> (not res!152126) (not e!126953))))

(assert (=> b!183015 (= res!152126 (isPrefixOf!0 (_2!8537 lt!281425) (_2!8538 lt!281018)))))

(declare-fun b!183016 () Bool)

(declare-fun res!152125 () Bool)

(assert (=> b!183016 (=> (not res!152125) (not e!126953))))

(assert (=> b!183016 (= res!152125 (isPrefixOf!0 (_1!8537 lt!281425) thiss!1204))))

(assert (= (and d!63487 c!9405) b!183013))

(assert (= (and d!63487 (not c!9405)) b!183012))

(assert (= (and d!63487 res!152124) b!183016))

(assert (= (and b!183016 res!152125) b!183015))

(assert (= (and b!183015 res!152126) b!183014))

(assert (=> b!183013 m!284407))

(declare-fun m!284667 () Bool)

(assert (=> b!183013 m!284667))

(declare-fun m!284669 () Bool)

(assert (=> b!183013 m!284669))

(declare-fun m!284671 () Bool)

(assert (=> b!183015 m!284671))

(declare-fun m!284673 () Bool)

(assert (=> d!63487 m!284673))

(declare-fun m!284675 () Bool)

(assert (=> d!63487 m!284675))

(declare-fun m!284677 () Bool)

(assert (=> d!63487 m!284677))

(declare-fun m!284679 () Bool)

(assert (=> d!63487 m!284679))

(declare-fun m!284681 () Bool)

(assert (=> d!63487 m!284681))

(declare-fun m!284683 () Bool)

(assert (=> d!63487 m!284683))

(assert (=> d!63487 m!284423))

(declare-fun m!284685 () Bool)

(assert (=> d!63487 m!284685))

(declare-fun m!284687 () Bool)

(assert (=> d!63487 m!284687))

(declare-fun m!284689 () Bool)

(assert (=> d!63487 m!284689))

(declare-fun m!284691 () Bool)

(assert (=> d!63487 m!284691))

(declare-fun m!284693 () Bool)

(assert (=> b!183014 m!284693))

(assert (=> b!183014 m!284421))

(assert (=> b!183014 m!284407))

(declare-fun m!284695 () Bool)

(assert (=> b!183016 m!284695))

(assert (=> b!182811 d!63487))

(declare-fun d!63489 () Bool)

(declare-fun e!126955 () Bool)

(assert (=> d!63489 e!126955))

(declare-fun res!152127 () Bool)

(assert (=> d!63489 (=> (not res!152127) (not e!126955))))

(declare-fun lt!281445 () tuple2!15784)

(assert (=> d!63489 (= res!152127 (isPrefixOf!0 (_1!8537 lt!281445) (_2!8537 lt!281445)))))

(declare-fun lt!281451 () BitStream!7698)

(assert (=> d!63489 (= lt!281445 (tuple2!15785 lt!281451 (_2!8538 lt!281018)))))

(declare-fun lt!281460 () Unit!13126)

(declare-fun lt!281450 () Unit!13126)

(assert (=> d!63489 (= lt!281460 lt!281450)))

(assert (=> d!63489 (isPrefixOf!0 lt!281451 (_2!8538 lt!281018))))

(assert (=> d!63489 (= lt!281450 (lemmaIsPrefixTransitive!0 lt!281451 (_2!8538 lt!281018) (_2!8538 lt!281018)))))

(declare-fun lt!281444 () Unit!13126)

(declare-fun lt!281457 () Unit!13126)

(assert (=> d!63489 (= lt!281444 lt!281457)))

(assert (=> d!63489 (isPrefixOf!0 lt!281451 (_2!8538 lt!281018))))

(assert (=> d!63489 (= lt!281457 (lemmaIsPrefixTransitive!0 lt!281451 (_2!8538 lt!281006) (_2!8538 lt!281018)))))

(declare-fun lt!281443 () Unit!13126)

(declare-fun e!126954 () Unit!13126)

(assert (=> d!63489 (= lt!281443 e!126954)))

(declare-fun c!9406 () Bool)

(assert (=> d!63489 (= c!9406 (not (= (size!4295 (buf!4747 (_2!8538 lt!281006))) #b00000000000000000000000000000000)))))

(declare-fun lt!281455 () Unit!13126)

(declare-fun lt!281446 () Unit!13126)

(assert (=> d!63489 (= lt!281455 lt!281446)))

(assert (=> d!63489 (isPrefixOf!0 (_2!8538 lt!281018) (_2!8538 lt!281018))))

(assert (=> d!63489 (= lt!281446 (lemmaIsPrefixRefl!0 (_2!8538 lt!281018)))))

(declare-fun lt!281448 () Unit!13126)

(declare-fun lt!281458 () Unit!13126)

(assert (=> d!63489 (= lt!281448 lt!281458)))

(assert (=> d!63489 (= lt!281458 (lemmaIsPrefixRefl!0 (_2!8538 lt!281018)))))

(declare-fun lt!281453 () Unit!13126)

(declare-fun lt!281456 () Unit!13126)

(assert (=> d!63489 (= lt!281453 lt!281456)))

(assert (=> d!63489 (isPrefixOf!0 lt!281451 lt!281451)))

(assert (=> d!63489 (= lt!281456 (lemmaIsPrefixRefl!0 lt!281451))))

(declare-fun lt!281461 () Unit!13126)

(declare-fun lt!281454 () Unit!13126)

(assert (=> d!63489 (= lt!281461 lt!281454)))

(assert (=> d!63489 (isPrefixOf!0 (_2!8538 lt!281006) (_2!8538 lt!281006))))

(assert (=> d!63489 (= lt!281454 (lemmaIsPrefixRefl!0 (_2!8538 lt!281006)))))

(assert (=> d!63489 (= lt!281451 (BitStream!7699 (buf!4747 (_2!8538 lt!281018)) (currentByte!8975 (_2!8538 lt!281006)) (currentBit!8970 (_2!8538 lt!281006))))))

(assert (=> d!63489 (isPrefixOf!0 (_2!8538 lt!281006) (_2!8538 lt!281018))))

(assert (=> d!63489 (= (reader!0 (_2!8538 lt!281006) (_2!8538 lt!281018)) lt!281445)))

(declare-fun b!183017 () Bool)

(declare-fun Unit!13142 () Unit!13126)

(assert (=> b!183017 (= e!126954 Unit!13142)))

(declare-fun b!183018 () Bool)

(declare-fun lt!281449 () Unit!13126)

(assert (=> b!183018 (= e!126954 lt!281449)))

(declare-fun lt!281447 () (_ BitVec 64))

(assert (=> b!183018 (= lt!281447 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!281452 () (_ BitVec 64))

(assert (=> b!183018 (= lt!281452 (bitIndex!0 (size!4295 (buf!4747 (_2!8538 lt!281006))) (currentByte!8975 (_2!8538 lt!281006)) (currentBit!8970 (_2!8538 lt!281006))))))

(assert (=> b!183018 (= lt!281449 (arrayBitRangesEqSymmetric!0 (buf!4747 (_2!8538 lt!281006)) (buf!4747 (_2!8538 lt!281018)) lt!281447 lt!281452))))

(assert (=> b!183018 (arrayBitRangesEq!0 (buf!4747 (_2!8538 lt!281018)) (buf!4747 (_2!8538 lt!281006)) lt!281447 lt!281452)))

(declare-fun b!183019 () Bool)

(declare-fun lt!281462 () (_ BitVec 64))

(declare-fun lt!281459 () (_ BitVec 64))

(assert (=> b!183019 (= e!126955 (= (_1!8537 lt!281445) (withMovedBitIndex!0 (_2!8537 lt!281445) (bvsub lt!281459 lt!281462))))))

(assert (=> b!183019 (or (= (bvand lt!281459 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!281462 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!281459 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!281459 lt!281462) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!183019 (= lt!281462 (bitIndex!0 (size!4295 (buf!4747 (_2!8538 lt!281018))) (currentByte!8975 (_2!8538 lt!281018)) (currentBit!8970 (_2!8538 lt!281018))))))

(assert (=> b!183019 (= lt!281459 (bitIndex!0 (size!4295 (buf!4747 (_2!8538 lt!281006))) (currentByte!8975 (_2!8538 lt!281006)) (currentBit!8970 (_2!8538 lt!281006))))))

(declare-fun b!183020 () Bool)

(declare-fun res!152129 () Bool)

(assert (=> b!183020 (=> (not res!152129) (not e!126955))))

(assert (=> b!183020 (= res!152129 (isPrefixOf!0 (_2!8537 lt!281445) (_2!8538 lt!281018)))))

(declare-fun b!183021 () Bool)

(declare-fun res!152128 () Bool)

(assert (=> b!183021 (=> (not res!152128) (not e!126955))))

(assert (=> b!183021 (= res!152128 (isPrefixOf!0 (_1!8537 lt!281445) (_2!8538 lt!281006)))))

(assert (= (and d!63489 c!9406) b!183018))

(assert (= (and d!63489 (not c!9406)) b!183017))

(assert (= (and d!63489 res!152127) b!183021))

(assert (= (and b!183021 res!152128) b!183020))

(assert (= (and b!183020 res!152129) b!183019))

(assert (=> b!183018 m!284405))

(declare-fun m!284697 () Bool)

(assert (=> b!183018 m!284697))

(declare-fun m!284699 () Bool)

(assert (=> b!183018 m!284699))

(declare-fun m!284701 () Bool)

(assert (=> b!183020 m!284701))

(declare-fun m!284703 () Bool)

(assert (=> d!63489 m!284703))

(assert (=> d!63489 m!284675))

(assert (=> d!63489 m!284677))

(declare-fun m!284705 () Bool)

(assert (=> d!63489 m!284705))

(declare-fun m!284707 () Bool)

(assert (=> d!63489 m!284707))

(declare-fun m!284709 () Bool)

(assert (=> d!63489 m!284709))

(assert (=> d!63489 m!284403))

(declare-fun m!284711 () Bool)

(assert (=> d!63489 m!284711))

(assert (=> d!63489 m!284613))

(declare-fun m!284713 () Bool)

(assert (=> d!63489 m!284713))

(declare-fun m!284715 () Bool)

(assert (=> d!63489 m!284715))

(declare-fun m!284717 () Bool)

(assert (=> b!183019 m!284717))

(assert (=> b!183019 m!284421))

(assert (=> b!183019 m!284405))

(declare-fun m!284719 () Bool)

(assert (=> b!183021 m!284719))

(assert (=> b!182811 d!63489))

(declare-fun d!63491 () Bool)

(declare-fun e!126956 () Bool)

(assert (=> d!63491 e!126956))

(declare-fun res!152131 () Bool)

(assert (=> d!63491 (=> (not res!152131) (not e!126956))))

(declare-fun lt!281466 () (_ BitVec 64))

(declare-fun lt!281463 () (_ BitVec 64))

(declare-fun lt!281464 () (_ BitVec 64))

(assert (=> d!63491 (= res!152131 (= lt!281463 (bvsub lt!281464 lt!281466)))))

(assert (=> d!63491 (or (= (bvand lt!281464 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!281466 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!281464 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!281464 lt!281466) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63491 (= lt!281466 (remainingBits!0 ((_ sign_extend 32) (size!4295 (buf!4747 (_1!8539 lt!281026)))) ((_ sign_extend 32) (currentByte!8975 (_1!8539 lt!281026))) ((_ sign_extend 32) (currentBit!8970 (_1!8539 lt!281026)))))))

(declare-fun lt!281467 () (_ BitVec 64))

(declare-fun lt!281468 () (_ BitVec 64))

(assert (=> d!63491 (= lt!281464 (bvmul lt!281467 lt!281468))))

(assert (=> d!63491 (or (= lt!281467 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!281468 (bvsdiv (bvmul lt!281467 lt!281468) lt!281467)))))

(assert (=> d!63491 (= lt!281468 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63491 (= lt!281467 ((_ sign_extend 32) (size!4295 (buf!4747 (_1!8539 lt!281026)))))))

(assert (=> d!63491 (= lt!281463 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8975 (_1!8539 lt!281026))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8970 (_1!8539 lt!281026)))))))

(assert (=> d!63491 (invariant!0 (currentBit!8970 (_1!8539 lt!281026)) (currentByte!8975 (_1!8539 lt!281026)) (size!4295 (buf!4747 (_1!8539 lt!281026))))))

(assert (=> d!63491 (= (bitIndex!0 (size!4295 (buf!4747 (_1!8539 lt!281026))) (currentByte!8975 (_1!8539 lt!281026)) (currentBit!8970 (_1!8539 lt!281026))) lt!281463)))

(declare-fun b!183022 () Bool)

(declare-fun res!152130 () Bool)

(assert (=> b!183022 (=> (not res!152130) (not e!126956))))

(assert (=> b!183022 (= res!152130 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!281463))))

(declare-fun b!183023 () Bool)

(declare-fun lt!281465 () (_ BitVec 64))

(assert (=> b!183023 (= e!126956 (bvsle lt!281463 (bvmul lt!281465 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!183023 (or (= lt!281465 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!281465 #b0000000000000000000000000000000000000000000000000000000000001000) lt!281465)))))

(assert (=> b!183023 (= lt!281465 ((_ sign_extend 32) (size!4295 (buf!4747 (_1!8539 lt!281026)))))))

(assert (= (and d!63491 res!152131) b!183022))

(assert (= (and b!183022 res!152130) b!183023))

(declare-fun m!284721 () Bool)

(assert (=> d!63491 m!284721))

(declare-fun m!284723 () Bool)

(assert (=> d!63491 m!284723))

(assert (=> b!182811 d!63491))

(declare-fun d!63493 () Bool)

(declare-fun lt!281469 () tuple2!15800)

(assert (=> d!63493 (= lt!281469 (readBit!0 (_1!8537 lt!281014)))))

(assert (=> d!63493 (= (readBitPure!0 (_1!8537 lt!281014)) (tuple2!15789 (_2!8545 lt!281469) (_1!8545 lt!281469)))))

(declare-fun bs!15802 () Bool)

(assert (= bs!15802 d!63493))

(declare-fun m!284725 () Bool)

(assert (=> bs!15802 m!284725))

(assert (=> b!182811 d!63493))

(declare-fun d!63495 () Bool)

(declare-fun lt!281470 () tuple2!15800)

(assert (=> d!63495 (= lt!281470 (readBit!0 lt!281019))))

(assert (=> d!63495 (= (readBitPure!0 lt!281019) (tuple2!15789 (_2!8545 lt!281470) (_1!8545 lt!281470)))))

(declare-fun bs!15803 () Bool)

(assert (= bs!15803 d!63495))

(declare-fun m!284727 () Bool)

(assert (=> bs!15803 m!284727))

(assert (=> b!182811 d!63495))

(declare-fun d!63497 () Bool)

(assert (=> d!63497 (validate_offset_bits!1 ((_ sign_extend 32) (size!4295 (buf!4747 (_2!8538 lt!281018)))) ((_ sign_extend 32) (currentByte!8975 thiss!1204)) ((_ sign_extend 32) (currentBit!8970 thiss!1204)) lt!281009)))

(declare-fun lt!281471 () Unit!13126)

(assert (=> d!63497 (= lt!281471 (choose!9 thiss!1204 (buf!4747 (_2!8538 lt!281018)) lt!281009 (BitStream!7699 (buf!4747 (_2!8538 lt!281018)) (currentByte!8975 thiss!1204) (currentBit!8970 thiss!1204))))))

(assert (=> d!63497 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4747 (_2!8538 lt!281018)) lt!281009) lt!281471)))

(declare-fun bs!15804 () Bool)

(assert (= bs!15804 d!63497))

(assert (=> bs!15804 m!284381))

(declare-fun m!284729 () Bool)

(assert (=> bs!15804 m!284729))

(assert (=> b!182811 d!63497))

(declare-fun d!63499 () Bool)

(assert (=> d!63499 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4295 (buf!4747 (_2!8538 lt!281018)))) ((_ sign_extend 32) (currentByte!8975 thiss!1204)) ((_ sign_extend 32) (currentBit!8970 thiss!1204)) lt!281009) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4295 (buf!4747 (_2!8538 lt!281018)))) ((_ sign_extend 32) (currentByte!8975 thiss!1204)) ((_ sign_extend 32) (currentBit!8970 thiss!1204))) lt!281009))))

(declare-fun bs!15805 () Bool)

(assert (= bs!15805 d!63499))

(declare-fun m!284731 () Bool)

(assert (=> bs!15805 m!284731))

(assert (=> b!182811 d!63499))

(declare-fun d!63501 () Bool)

(assert (=> d!63501 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!182811 d!63501))

(declare-fun d!63503 () Bool)

(assert (=> d!63503 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4295 (buf!4747 (_2!8538 lt!281018)))) ((_ sign_extend 32) (currentByte!8975 (_2!8538 lt!281006))) ((_ sign_extend 32) (currentBit!8970 (_2!8538 lt!281006))) lt!281016) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4295 (buf!4747 (_2!8538 lt!281018)))) ((_ sign_extend 32) (currentByte!8975 (_2!8538 lt!281006))) ((_ sign_extend 32) (currentBit!8970 (_2!8538 lt!281006)))) lt!281016))))

(declare-fun bs!15806 () Bool)

(assert (= bs!15806 d!63503))

(declare-fun m!284733 () Bool)

(assert (=> bs!15806 m!284733))

(assert (=> b!182811 d!63503))

(declare-fun d!63505 () Bool)

(declare-fun e!126957 () Bool)

(assert (=> d!63505 e!126957))

(declare-fun res!152133 () Bool)

(assert (=> d!63505 (=> (not res!152133) (not e!126957))))

(declare-fun lt!281472 () (_ BitVec 64))

(declare-fun lt!281473 () (_ BitVec 64))

(declare-fun lt!281475 () (_ BitVec 64))

(assert (=> d!63505 (= res!152133 (= lt!281472 (bvsub lt!281473 lt!281475)))))

(assert (=> d!63505 (or (= (bvand lt!281473 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!281475 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!281473 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!281473 lt!281475) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63505 (= lt!281475 (remainingBits!0 ((_ sign_extend 32) (size!4295 (buf!4747 (_1!8539 lt!281022)))) ((_ sign_extend 32) (currentByte!8975 (_1!8539 lt!281022))) ((_ sign_extend 32) (currentBit!8970 (_1!8539 lt!281022)))))))

(declare-fun lt!281476 () (_ BitVec 64))

(declare-fun lt!281477 () (_ BitVec 64))

(assert (=> d!63505 (= lt!281473 (bvmul lt!281476 lt!281477))))

(assert (=> d!63505 (or (= lt!281476 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!281477 (bvsdiv (bvmul lt!281476 lt!281477) lt!281476)))))

(assert (=> d!63505 (= lt!281477 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63505 (= lt!281476 ((_ sign_extend 32) (size!4295 (buf!4747 (_1!8539 lt!281022)))))))

(assert (=> d!63505 (= lt!281472 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8975 (_1!8539 lt!281022))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8970 (_1!8539 lt!281022)))))))

(assert (=> d!63505 (invariant!0 (currentBit!8970 (_1!8539 lt!281022)) (currentByte!8975 (_1!8539 lt!281022)) (size!4295 (buf!4747 (_1!8539 lt!281022))))))

(assert (=> d!63505 (= (bitIndex!0 (size!4295 (buf!4747 (_1!8539 lt!281022))) (currentByte!8975 (_1!8539 lt!281022)) (currentBit!8970 (_1!8539 lt!281022))) lt!281472)))

(declare-fun b!183024 () Bool)

(declare-fun res!152132 () Bool)

(assert (=> b!183024 (=> (not res!152132) (not e!126957))))

(assert (=> b!183024 (= res!152132 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!281472))))

(declare-fun b!183025 () Bool)

(declare-fun lt!281474 () (_ BitVec 64))

(assert (=> b!183025 (= e!126957 (bvsle lt!281472 (bvmul lt!281474 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!183025 (or (= lt!281474 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!281474 #b0000000000000000000000000000000000000000000000000000000000001000) lt!281474)))))

(assert (=> b!183025 (= lt!281474 ((_ sign_extend 32) (size!4295 (buf!4747 (_1!8539 lt!281022)))))))

(assert (= (and d!63505 res!152133) b!183024))

(assert (= (and b!183024 res!152132) b!183025))

(declare-fun m!284735 () Bool)

(assert (=> d!63505 m!284735))

(declare-fun m!284737 () Bool)

(assert (=> d!63505 m!284737))

(assert (=> b!182811 d!63505))

(declare-datatypes ((tuple2!15802 0))(
  ( (tuple2!15803 (_1!8546 (_ BitVec 64)) (_2!8546 BitStream!7698)) )
))
(declare-fun lt!281480 () tuple2!15802)

(declare-fun d!63507 () Bool)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!7698 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!15802)

(assert (=> d!63507 (= lt!281480 (readNBitsLSBFirstsLoop!0 (_1!8537 lt!281014) nBits!348 i!590 lt!281012))))

(assert (=> d!63507 (= (readNBitsLSBFirstsLoopPure!0 (_1!8537 lt!281014) nBits!348 i!590 lt!281012) (tuple2!15791 (_2!8546 lt!281480) (_1!8546 lt!281480)))))

(declare-fun bs!15807 () Bool)

(assert (= bs!15807 d!63507))

(declare-fun m!284739 () Bool)

(assert (=> bs!15807 m!284739))

(assert (=> b!182811 d!63507))

(check-sat (not b!183016) (not d!63417) (not d!63413) (not d!63459) (not d!63489) (not b!182990) (not b!182966) (not b!182962) (not b!183020) (not d!63481) (not b!182963) (not b!182889) (not b!183021) (not d!63505) (not b!183019) (not d!63497) (not d!63485) (not b!182987) (not d!63409) (not d!63461) (not b!182959) (not d!63499) (not b!182971) (not d!63477) (not d!63473) (not b!182988) (not b!182973) (not b!182989) (not b!183013) (not b!183015) (not b!182970) (not b!182958) (not d!63507) (not d!63479) (not d!63487) (not d!63457) (not b!182998) (not b!182965) (not d!63451) (not d!63491) (not b!182887) (not b!182967) (not d!63503) (not d!63419) (not b!182957) (not b!183014) (not b!182956) (not bm!2963) (not d!63495) (not b!182993) (not d!63463) (not b!182995) (not d!63475) (not b!183018) (not d!63493))
(check-sat)
