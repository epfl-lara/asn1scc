; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39746 () Bool)

(assert start!39746)

(declare-fun b!180416 () Bool)

(declare-fun e!125389 () Bool)

(declare-datatypes ((array!9680 0))(
  ( (array!9681 (arr!5200 (Array (_ BitVec 32) (_ BitVec 8))) (size!4270 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7648 0))(
  ( (BitStream!7649 (buf!4713 array!9680) (currentByte!8923 (_ BitVec 32)) (currentBit!8918 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15566 0))(
  ( (tuple2!15567 (_1!8428 BitStream!7648) (_2!8428 Bool)) )
))
(declare-fun lt!276540 () tuple2!15566)

(declare-fun lt!276550 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!180416 (= e!125389 (= (bitIndex!0 (size!4270 (buf!4713 (_1!8428 lt!276540))) (currentByte!8923 (_1!8428 lt!276540)) (currentBit!8918 (_1!8428 lt!276540))) lt!276550))))

(declare-fun b!180417 () Bool)

(declare-fun e!125383 () Bool)

(declare-fun e!125385 () Bool)

(assert (=> b!180417 (= e!125383 e!125385)))

(declare-fun res!149806 () Bool)

(assert (=> b!180417 (=> (not res!149806) (not e!125385))))

(declare-fun lt!276541 () (_ BitVec 64))

(assert (=> b!180417 (= res!149806 (= lt!276550 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!276541)))))

(declare-datatypes ((Unit!12959 0))(
  ( (Unit!12960) )
))
(declare-datatypes ((tuple2!15568 0))(
  ( (tuple2!15569 (_1!8429 Unit!12959) (_2!8429 BitStream!7648)) )
))
(declare-fun lt!276539 () tuple2!15568)

(assert (=> b!180417 (= lt!276550 (bitIndex!0 (size!4270 (buf!4713 (_2!8429 lt!276539))) (currentByte!8923 (_2!8429 lt!276539)) (currentBit!8918 (_2!8429 lt!276539))))))

(declare-fun thiss!1204 () BitStream!7648)

(assert (=> b!180417 (= lt!276541 (bitIndex!0 (size!4270 (buf!4713 thiss!1204)) (currentByte!8923 thiss!1204) (currentBit!8918 thiss!1204)))))

(declare-fun b!180418 () Bool)

(declare-fun e!125387 () Bool)

(declare-fun e!125386 () Bool)

(assert (=> b!180418 (= e!125387 e!125386)))

(declare-fun res!149807 () Bool)

(assert (=> b!180418 (=> res!149807 e!125386)))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun lt!276542 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun lt!276543 () (_ BitVec 64))

(assert (=> b!180418 (= res!149807 (not (= lt!276543 (bvsub (bvsub (bvadd lt!276542 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun lt!276534 () tuple2!15568)

(assert (=> b!180418 (= lt!276543 (bitIndex!0 (size!4270 (buf!4713 (_2!8429 lt!276534))) (currentByte!8923 (_2!8429 lt!276534)) (currentBit!8918 (_2!8429 lt!276534))))))

(declare-fun isPrefixOf!0 (BitStream!7648 BitStream!7648) Bool)

(assert (=> b!180418 (isPrefixOf!0 thiss!1204 (_2!8429 lt!276534))))

(declare-fun lt!276545 () Unit!12959)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7648 BitStream!7648 BitStream!7648) Unit!12959)

(assert (=> b!180418 (= lt!276545 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8429 lt!276539) (_2!8429 lt!276534)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7648 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15568)

(assert (=> b!180418 (= lt!276534 (appendBitsLSBFirstLoopTR!0 (_2!8429 lt!276539) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun res!149813 () Bool)

(declare-fun e!125388 () Bool)

(assert (=> start!39746 (=> (not res!149813) (not e!125388))))

(assert (=> start!39746 (= res!149813 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39746 e!125388))

(assert (=> start!39746 true))

(declare-fun e!125392 () Bool)

(declare-fun inv!12 (BitStream!7648) Bool)

(assert (=> start!39746 (and (inv!12 thiss!1204) e!125392)))

(declare-fun b!180419 () Bool)

(declare-fun res!149816 () Bool)

(assert (=> b!180419 (=> res!149816 e!125386)))

(assert (=> b!180419 (= res!149816 (not (isPrefixOf!0 (_2!8429 lt!276539) (_2!8429 lt!276534))))))

(declare-fun b!180420 () Bool)

(declare-fun res!149805 () Bool)

(declare-fun e!125384 () Bool)

(assert (=> b!180420 (=> (not res!149805) (not e!125384))))

(assert (=> b!180420 (= res!149805 (not (= i!590 nBits!348)))))

(declare-fun b!180421 () Bool)

(declare-fun res!149803 () Bool)

(assert (=> b!180421 (=> (not res!149803) (not e!125385))))

(assert (=> b!180421 (= res!149803 (isPrefixOf!0 thiss!1204 (_2!8429 lt!276539)))))

(declare-fun b!180422 () Bool)

(declare-fun res!149817 () Bool)

(assert (=> b!180422 (=> res!149817 e!125386)))

(declare-fun lt!276536 () (_ BitVec 64))

(assert (=> b!180422 (= res!149817 (or (not (= (size!4270 (buf!4713 (_2!8429 lt!276534))) (size!4270 (buf!4713 thiss!1204)))) (not (= lt!276543 (bvsub (bvadd lt!276536 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!180423 () Bool)

(declare-fun e!125382 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!180423 (= e!125382 (invariant!0 (currentBit!8918 thiss!1204) (currentByte!8923 thiss!1204) (size!4270 (buf!4713 (_2!8429 lt!276534)))))))

(declare-fun b!180424 () Bool)

(declare-fun e!125391 () Bool)

(declare-fun lt!276537 () tuple2!15566)

(declare-fun lt!276538 () tuple2!15566)

(assert (=> b!180424 (= e!125391 (= (_2!8428 lt!276537) (_2!8428 lt!276538)))))

(declare-fun b!180425 () Bool)

(declare-fun res!149814 () Bool)

(assert (=> b!180425 (=> res!149814 e!125386)))

(assert (=> b!180425 (= res!149814 (not (invariant!0 (currentBit!8918 (_2!8429 lt!276534)) (currentByte!8923 (_2!8429 lt!276534)) (size!4270 (buf!4713 (_2!8429 lt!276534))))))))

(declare-fun b!180426 () Bool)

(assert (=> b!180426 (= e!125388 e!125384)))

(declare-fun res!149815 () Bool)

(assert (=> b!180426 (=> (not res!149815) (not e!125384))))

(declare-fun lt!276548 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!180426 (= res!149815 (validate_offset_bits!1 ((_ sign_extend 32) (size!4270 (buf!4713 thiss!1204))) ((_ sign_extend 32) (currentByte!8923 thiss!1204)) ((_ sign_extend 32) (currentBit!8918 thiss!1204)) lt!276548))))

(assert (=> b!180426 (= lt!276548 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!180427 () Bool)

(assert (=> b!180427 (= e!125384 (not e!125387))))

(declare-fun res!149804 () Bool)

(assert (=> b!180427 (=> res!149804 e!125387)))

(assert (=> b!180427 (= res!149804 (not (= lt!276542 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!276536))))))

(assert (=> b!180427 (= lt!276542 (bitIndex!0 (size!4270 (buf!4713 (_2!8429 lt!276539))) (currentByte!8923 (_2!8429 lt!276539)) (currentBit!8918 (_2!8429 lt!276539))))))

(assert (=> b!180427 (= lt!276536 (bitIndex!0 (size!4270 (buf!4713 thiss!1204)) (currentByte!8923 thiss!1204) (currentBit!8918 thiss!1204)))))

(assert (=> b!180427 e!125383))

(declare-fun res!149812 () Bool)

(assert (=> b!180427 (=> (not res!149812) (not e!125383))))

(assert (=> b!180427 (= res!149812 (= (size!4270 (buf!4713 thiss!1204)) (size!4270 (buf!4713 (_2!8429 lt!276539)))))))

(declare-fun lt!276544 () Bool)

(declare-fun appendBit!0 (BitStream!7648 Bool) tuple2!15568)

(assert (=> b!180427 (= lt!276539 (appendBit!0 thiss!1204 lt!276544))))

(assert (=> b!180427 (= lt!276544 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!180428 () Bool)

(declare-fun array_inv!4011 (array!9680) Bool)

(assert (=> b!180428 (= e!125392 (array_inv!4011 (buf!4713 thiss!1204)))))

(declare-fun b!180429 () Bool)

(assert (=> b!180429 (= e!125385 e!125389)))

(declare-fun res!149810 () Bool)

(assert (=> b!180429 (=> (not res!149810) (not e!125389))))

(assert (=> b!180429 (= res!149810 (and (= (_2!8428 lt!276540) lt!276544) (= (_1!8428 lt!276540) (_2!8429 lt!276539))))))

(declare-fun readBitPure!0 (BitStream!7648) tuple2!15566)

(declare-fun readerFrom!0 (BitStream!7648 (_ BitVec 32) (_ BitVec 32)) BitStream!7648)

(assert (=> b!180429 (= lt!276540 (readBitPure!0 (readerFrom!0 (_2!8429 lt!276539) (currentBit!8918 thiss!1204) (currentByte!8923 thiss!1204))))))

(declare-fun b!180430 () Bool)

(declare-datatypes ((tuple2!15570 0))(
  ( (tuple2!15571 (_1!8430 BitStream!7648) (_2!8430 BitStream!7648)) )
))
(declare-fun lt!276535 () tuple2!15570)

(assert (=> b!180430 (= e!125386 (validate_offset_bits!1 ((_ sign_extend 32) (size!4270 (buf!4713 (_1!8430 lt!276535)))) ((_ sign_extend 32) (currentByte!8923 (_1!8430 lt!276535))) ((_ sign_extend 32) (currentBit!8918 (_1!8430 lt!276535))) lt!276548))))

(assert (=> b!180430 (validate_offset_bits!1 ((_ sign_extend 32) (size!4270 (buf!4713 (_2!8429 lt!276534)))) ((_ sign_extend 32) (currentByte!8923 thiss!1204)) ((_ sign_extend 32) (currentBit!8918 thiss!1204)) lt!276548)))

(declare-fun lt!276547 () Unit!12959)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7648 array!9680 (_ BitVec 64)) Unit!12959)

(assert (=> b!180430 (= lt!276547 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4713 (_2!8429 lt!276534)) lt!276548))))

(assert (=> b!180430 (= (_2!8428 (readBitPure!0 (_1!8430 lt!276535))) lt!276544)))

(declare-fun lt!276551 () tuple2!15570)

(declare-fun reader!0 (BitStream!7648 BitStream!7648) tuple2!15570)

(assert (=> b!180430 (= lt!276551 (reader!0 (_2!8429 lt!276539) (_2!8429 lt!276534)))))

(assert (=> b!180430 (= lt!276535 (reader!0 thiss!1204 (_2!8429 lt!276534)))))

(assert (=> b!180430 e!125391))

(declare-fun res!149808 () Bool)

(assert (=> b!180430 (=> (not res!149808) (not e!125391))))

(assert (=> b!180430 (= res!149808 (= (bitIndex!0 (size!4270 (buf!4713 (_1!8428 lt!276537))) (currentByte!8923 (_1!8428 lt!276537)) (currentBit!8918 (_1!8428 lt!276537))) (bitIndex!0 (size!4270 (buf!4713 (_1!8428 lt!276538))) (currentByte!8923 (_1!8428 lt!276538)) (currentBit!8918 (_1!8428 lt!276538)))))))

(declare-fun lt!276546 () Unit!12959)

(declare-fun lt!276549 () BitStream!7648)

(declare-fun readBitPrefixLemma!0 (BitStream!7648 BitStream!7648) Unit!12959)

(assert (=> b!180430 (= lt!276546 (readBitPrefixLemma!0 lt!276549 (_2!8429 lt!276534)))))

(assert (=> b!180430 (= lt!276538 (readBitPure!0 (BitStream!7649 (buf!4713 (_2!8429 lt!276534)) (currentByte!8923 thiss!1204) (currentBit!8918 thiss!1204))))))

(assert (=> b!180430 (= lt!276537 (readBitPure!0 lt!276549))))

(assert (=> b!180430 e!125382))

(declare-fun res!149811 () Bool)

(assert (=> b!180430 (=> (not res!149811) (not e!125382))))

(assert (=> b!180430 (= res!149811 (invariant!0 (currentBit!8918 thiss!1204) (currentByte!8923 thiss!1204) (size!4270 (buf!4713 (_2!8429 lt!276539)))))))

(assert (=> b!180430 (= lt!276549 (BitStream!7649 (buf!4713 (_2!8429 lt!276539)) (currentByte!8923 thiss!1204) (currentBit!8918 thiss!1204)))))

(declare-fun b!180431 () Bool)

(declare-fun res!149802 () Bool)

(assert (=> b!180431 (=> res!149802 e!125386)))

(assert (=> b!180431 (= res!149802 (not (isPrefixOf!0 thiss!1204 (_2!8429 lt!276539))))))

(declare-fun b!180432 () Bool)

(declare-fun res!149809 () Bool)

(assert (=> b!180432 (=> (not res!149809) (not e!125384))))

(assert (=> b!180432 (= res!149809 (invariant!0 (currentBit!8918 thiss!1204) (currentByte!8923 thiss!1204) (size!4270 (buf!4713 thiss!1204))))))

(assert (= (and start!39746 res!149813) b!180426))

(assert (= (and b!180426 res!149815) b!180432))

(assert (= (and b!180432 res!149809) b!180420))

(assert (= (and b!180420 res!149805) b!180427))

(assert (= (and b!180427 res!149812) b!180417))

(assert (= (and b!180417 res!149806) b!180421))

(assert (= (and b!180421 res!149803) b!180429))

(assert (= (and b!180429 res!149810) b!180416))

(assert (= (and b!180427 (not res!149804)) b!180418))

(assert (= (and b!180418 (not res!149807)) b!180425))

(assert (= (and b!180425 (not res!149814)) b!180422))

(assert (= (and b!180422 (not res!149817)) b!180419))

(assert (= (and b!180419 (not res!149816)) b!180431))

(assert (= (and b!180431 (not res!149802)) b!180430))

(assert (= (and b!180430 res!149811) b!180423))

(assert (= (and b!180430 res!149808) b!180424))

(assert (= start!39746 b!180428))

(declare-fun m!280825 () Bool)

(assert (=> b!180431 m!280825))

(declare-fun m!280827 () Bool)

(assert (=> b!180432 m!280827))

(declare-fun m!280829 () Bool)

(assert (=> b!180430 m!280829))

(declare-fun m!280831 () Bool)

(assert (=> b!180430 m!280831))

(declare-fun m!280833 () Bool)

(assert (=> b!180430 m!280833))

(declare-fun m!280835 () Bool)

(assert (=> b!180430 m!280835))

(declare-fun m!280837 () Bool)

(assert (=> b!180430 m!280837))

(declare-fun m!280839 () Bool)

(assert (=> b!180430 m!280839))

(declare-fun m!280841 () Bool)

(assert (=> b!180430 m!280841))

(declare-fun m!280843 () Bool)

(assert (=> b!180430 m!280843))

(declare-fun m!280845 () Bool)

(assert (=> b!180430 m!280845))

(declare-fun m!280847 () Bool)

(assert (=> b!180430 m!280847))

(declare-fun m!280849 () Bool)

(assert (=> b!180430 m!280849))

(declare-fun m!280851 () Bool)

(assert (=> b!180430 m!280851))

(declare-fun m!280853 () Bool)

(assert (=> b!180426 m!280853))

(declare-fun m!280855 () Bool)

(assert (=> b!180416 m!280855))

(declare-fun m!280857 () Bool)

(assert (=> b!180423 m!280857))

(declare-fun m!280859 () Bool)

(assert (=> b!180417 m!280859))

(declare-fun m!280861 () Bool)

(assert (=> b!180417 m!280861))

(declare-fun m!280863 () Bool)

(assert (=> b!180418 m!280863))

(declare-fun m!280865 () Bool)

(assert (=> b!180418 m!280865))

(declare-fun m!280867 () Bool)

(assert (=> b!180418 m!280867))

(declare-fun m!280869 () Bool)

(assert (=> b!180418 m!280869))

(declare-fun m!280871 () Bool)

(assert (=> b!180419 m!280871))

(assert (=> b!180427 m!280859))

(assert (=> b!180427 m!280861))

(declare-fun m!280873 () Bool)

(assert (=> b!180427 m!280873))

(declare-fun m!280875 () Bool)

(assert (=> start!39746 m!280875))

(declare-fun m!280877 () Bool)

(assert (=> b!180428 m!280877))

(declare-fun m!280879 () Bool)

(assert (=> b!180429 m!280879))

(assert (=> b!180429 m!280879))

(declare-fun m!280881 () Bool)

(assert (=> b!180429 m!280881))

(assert (=> b!180421 m!280825))

(declare-fun m!280883 () Bool)

(assert (=> b!180425 m!280883))

(push 1)

(assert (not b!180416))

(assert (not b!180427))

(assert (not b!180419))

(assert (not b!180417))

(assert (not b!180428))

(assert (not b!180426))

(assert (not b!180423))

(assert (not b!180421))

(assert (not b!180418))

(assert (not b!180425))

(assert (not b!180432))

(assert (not b!180429))

(assert (not b!180431))

(assert (not start!39746))

(assert (not b!180430))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!62875 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!62875 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4270 (buf!4713 (_1!8430 lt!276535)))) ((_ sign_extend 32) (currentByte!8923 (_1!8430 lt!276535))) ((_ sign_extend 32) (currentBit!8918 (_1!8430 lt!276535))) lt!276548) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4270 (buf!4713 (_1!8430 lt!276535)))) ((_ sign_extend 32) (currentByte!8923 (_1!8430 lt!276535))) ((_ sign_extend 32) (currentBit!8918 (_1!8430 lt!276535)))) lt!276548))))

(declare-fun bs!15676 () Bool)

(assert (= bs!15676 d!62875))

(declare-fun m!281127 () Bool)

(assert (=> bs!15676 m!281127))

(assert (=> b!180430 d!62875))

(declare-fun d!62877 () Bool)

(declare-datatypes ((tuple2!15586 0))(
  ( (tuple2!15587 (_1!8438 Bool) (_2!8438 BitStream!7648)) )
))
(declare-fun lt!276826 () tuple2!15586)

(declare-fun readBit!0 (BitStream!7648) tuple2!15586)

(assert (=> d!62877 (= lt!276826 (readBit!0 lt!276549))))

(assert (=> d!62877 (= (readBitPure!0 lt!276549) (tuple2!15567 (_2!8438 lt!276826) (_1!8438 lt!276826)))))

(declare-fun bs!15677 () Bool)

(assert (= bs!15677 d!62877))

(declare-fun m!281129 () Bool)

(assert (=> bs!15677 m!281129))

(assert (=> b!180430 d!62877))

(declare-fun b!180615 () Bool)

(declare-fun res!149984 () Bool)

(declare-fun e!125501 () Bool)

(assert (=> b!180615 (=> (not res!149984) (not e!125501))))

(declare-fun lt!276869 () tuple2!15570)

(assert (=> b!180615 (= res!149984 (isPrefixOf!0 (_2!8430 lt!276869) (_2!8429 lt!276534)))))

(declare-fun b!180616 () Bool)

(declare-fun res!149983 () Bool)

(assert (=> b!180616 (=> (not res!149983) (not e!125501))))

(assert (=> b!180616 (= res!149983 (isPrefixOf!0 (_1!8430 lt!276869) thiss!1204))))

(declare-fun b!180617 () Bool)

(declare-fun e!125502 () Unit!12959)

(declare-fun lt!276877 () Unit!12959)

(assert (=> b!180617 (= e!125502 lt!276877)))

(declare-fun lt!276871 () (_ BitVec 64))

(assert (=> b!180617 (= lt!276871 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!276867 () (_ BitVec 64))

(assert (=> b!180617 (= lt!276867 (bitIndex!0 (size!4270 (buf!4713 thiss!1204)) (currentByte!8923 thiss!1204) (currentBit!8918 thiss!1204)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!9680 array!9680 (_ BitVec 64) (_ BitVec 64)) Unit!12959)

(assert (=> b!180617 (= lt!276877 (arrayBitRangesEqSymmetric!0 (buf!4713 thiss!1204) (buf!4713 (_2!8429 lt!276534)) lt!276871 lt!276867))))

(declare-fun arrayBitRangesEq!0 (array!9680 array!9680 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!180617 (arrayBitRangesEq!0 (buf!4713 (_2!8429 lt!276534)) (buf!4713 thiss!1204) lt!276871 lt!276867)))

(declare-fun d!62879 () Bool)

(assert (=> d!62879 e!125501))

(declare-fun res!149982 () Bool)

(assert (=> d!62879 (=> (not res!149982) (not e!125501))))

(assert (=> d!62879 (= res!149982 (isPrefixOf!0 (_1!8430 lt!276869) (_2!8430 lt!276869)))))

(declare-fun lt!276878 () BitStream!7648)

(assert (=> d!62879 (= lt!276869 (tuple2!15571 lt!276878 (_2!8429 lt!276534)))))

(declare-fun lt!276876 () Unit!12959)

(declare-fun lt!276875 () Unit!12959)

(assert (=> d!62879 (= lt!276876 lt!276875)))

(assert (=> d!62879 (isPrefixOf!0 lt!276878 (_2!8429 lt!276534))))

(assert (=> d!62879 (= lt!276875 (lemmaIsPrefixTransitive!0 lt!276878 (_2!8429 lt!276534) (_2!8429 lt!276534)))))

(declare-fun lt!276872 () Unit!12959)

(declare-fun lt!276884 () Unit!12959)

(assert (=> d!62879 (= lt!276872 lt!276884)))

(assert (=> d!62879 (isPrefixOf!0 lt!276878 (_2!8429 lt!276534))))

(assert (=> d!62879 (= lt!276884 (lemmaIsPrefixTransitive!0 lt!276878 thiss!1204 (_2!8429 lt!276534)))))

(declare-fun lt!276885 () Unit!12959)

(assert (=> d!62879 (= lt!276885 e!125502)))

(declare-fun c!9313 () Bool)

(assert (=> d!62879 (= c!9313 (not (= (size!4270 (buf!4713 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!276882 () Unit!12959)

(declare-fun lt!276879 () Unit!12959)

(assert (=> d!62879 (= lt!276882 lt!276879)))

(assert (=> d!62879 (isPrefixOf!0 (_2!8429 lt!276534) (_2!8429 lt!276534))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7648) Unit!12959)

(assert (=> d!62879 (= lt!276879 (lemmaIsPrefixRefl!0 (_2!8429 lt!276534)))))

(declare-fun lt!276873 () Unit!12959)

(declare-fun lt!276881 () Unit!12959)

(assert (=> d!62879 (= lt!276873 lt!276881)))

(assert (=> d!62879 (= lt!276881 (lemmaIsPrefixRefl!0 (_2!8429 lt!276534)))))

(declare-fun lt!276874 () Unit!12959)

(declare-fun lt!276868 () Unit!12959)

(assert (=> d!62879 (= lt!276874 lt!276868)))

(assert (=> d!62879 (isPrefixOf!0 lt!276878 lt!276878)))

(assert (=> d!62879 (= lt!276868 (lemmaIsPrefixRefl!0 lt!276878))))

(declare-fun lt!276870 () Unit!12959)

(declare-fun lt!276880 () Unit!12959)

(assert (=> d!62879 (= lt!276870 lt!276880)))

(assert (=> d!62879 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!62879 (= lt!276880 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!62879 (= lt!276878 (BitStream!7649 (buf!4713 (_2!8429 lt!276534)) (currentByte!8923 thiss!1204) (currentBit!8918 thiss!1204)))))

(assert (=> d!62879 (isPrefixOf!0 thiss!1204 (_2!8429 lt!276534))))

(assert (=> d!62879 (= (reader!0 thiss!1204 (_2!8429 lt!276534)) lt!276869)))

(declare-fun b!180618 () Bool)

(declare-fun lt!276883 () (_ BitVec 64))

(declare-fun lt!276886 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!7648 (_ BitVec 64)) BitStream!7648)

(assert (=> b!180618 (= e!125501 (= (_1!8430 lt!276869) (withMovedBitIndex!0 (_2!8430 lt!276869) (bvsub lt!276883 lt!276886))))))

(assert (=> b!180618 (or (= (bvand lt!276883 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!276886 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!276883 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!276883 lt!276886) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!180618 (= lt!276886 (bitIndex!0 (size!4270 (buf!4713 (_2!8429 lt!276534))) (currentByte!8923 (_2!8429 lt!276534)) (currentBit!8918 (_2!8429 lt!276534))))))

(assert (=> b!180618 (= lt!276883 (bitIndex!0 (size!4270 (buf!4713 thiss!1204)) (currentByte!8923 thiss!1204) (currentBit!8918 thiss!1204)))))

(declare-fun b!180619 () Bool)

(declare-fun Unit!12965 () Unit!12959)

(assert (=> b!180619 (= e!125502 Unit!12965)))

(assert (= (and d!62879 c!9313) b!180617))

(assert (= (and d!62879 (not c!9313)) b!180619))

(assert (= (and d!62879 res!149982) b!180616))

(assert (= (and b!180616 res!149983) b!180615))

(assert (= (and b!180615 res!149984) b!180618))

(declare-fun m!281131 () Bool)

(assert (=> b!180616 m!281131))

(declare-fun m!281133 () Bool)

(assert (=> d!62879 m!281133))

(declare-fun m!281135 () Bool)

(assert (=> d!62879 m!281135))

(declare-fun m!281137 () Bool)

(assert (=> d!62879 m!281137))

(declare-fun m!281139 () Bool)

(assert (=> d!62879 m!281139))

(declare-fun m!281141 () Bool)

(assert (=> d!62879 m!281141))

(assert (=> d!62879 m!280865))

(declare-fun m!281143 () Bool)

(assert (=> d!62879 m!281143))

(declare-fun m!281145 () Bool)

(assert (=> d!62879 m!281145))

(declare-fun m!281147 () Bool)

(assert (=> d!62879 m!281147))

(declare-fun m!281149 () Bool)

(assert (=> d!62879 m!281149))

(declare-fun m!281151 () Bool)

(assert (=> d!62879 m!281151))

(declare-fun m!281153 () Bool)

(assert (=> b!180615 m!281153))

(declare-fun m!281155 () Bool)

(assert (=> b!180618 m!281155))

(assert (=> b!180618 m!280863))

(assert (=> b!180618 m!280861))

(assert (=> b!180617 m!280861))

(declare-fun m!281157 () Bool)

(assert (=> b!180617 m!281157))

(declare-fun m!281159 () Bool)

(assert (=> b!180617 m!281159))

(assert (=> b!180430 d!62879))

(declare-fun b!180620 () Bool)

(declare-fun res!149987 () Bool)

(declare-fun e!125503 () Bool)

(assert (=> b!180620 (=> (not res!149987) (not e!125503))))

(declare-fun lt!276889 () tuple2!15570)

(assert (=> b!180620 (= res!149987 (isPrefixOf!0 (_2!8430 lt!276889) (_2!8429 lt!276534)))))

(declare-fun b!180621 () Bool)

(declare-fun res!149986 () Bool)

(assert (=> b!180621 (=> (not res!149986) (not e!125503))))

(assert (=> b!180621 (= res!149986 (isPrefixOf!0 (_1!8430 lt!276889) (_2!8429 lt!276539)))))

(declare-fun b!180622 () Bool)

(declare-fun e!125504 () Unit!12959)

(declare-fun lt!276897 () Unit!12959)

(assert (=> b!180622 (= e!125504 lt!276897)))

(declare-fun lt!276891 () (_ BitVec 64))

(assert (=> b!180622 (= lt!276891 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!276887 () (_ BitVec 64))

(assert (=> b!180622 (= lt!276887 (bitIndex!0 (size!4270 (buf!4713 (_2!8429 lt!276539))) (currentByte!8923 (_2!8429 lt!276539)) (currentBit!8918 (_2!8429 lt!276539))))))

(assert (=> b!180622 (= lt!276897 (arrayBitRangesEqSymmetric!0 (buf!4713 (_2!8429 lt!276539)) (buf!4713 (_2!8429 lt!276534)) lt!276891 lt!276887))))

(assert (=> b!180622 (arrayBitRangesEq!0 (buf!4713 (_2!8429 lt!276534)) (buf!4713 (_2!8429 lt!276539)) lt!276891 lt!276887)))

(declare-fun d!62881 () Bool)

(assert (=> d!62881 e!125503))

(declare-fun res!149985 () Bool)

(assert (=> d!62881 (=> (not res!149985) (not e!125503))))

(assert (=> d!62881 (= res!149985 (isPrefixOf!0 (_1!8430 lt!276889) (_2!8430 lt!276889)))))

(declare-fun lt!276898 () BitStream!7648)

(assert (=> d!62881 (= lt!276889 (tuple2!15571 lt!276898 (_2!8429 lt!276534)))))

(declare-fun lt!276896 () Unit!12959)

(declare-fun lt!276895 () Unit!12959)

(assert (=> d!62881 (= lt!276896 lt!276895)))

(assert (=> d!62881 (isPrefixOf!0 lt!276898 (_2!8429 lt!276534))))

(assert (=> d!62881 (= lt!276895 (lemmaIsPrefixTransitive!0 lt!276898 (_2!8429 lt!276534) (_2!8429 lt!276534)))))

(declare-fun lt!276892 () Unit!12959)

(declare-fun lt!276904 () Unit!12959)

(assert (=> d!62881 (= lt!276892 lt!276904)))

(assert (=> d!62881 (isPrefixOf!0 lt!276898 (_2!8429 lt!276534))))

(assert (=> d!62881 (= lt!276904 (lemmaIsPrefixTransitive!0 lt!276898 (_2!8429 lt!276539) (_2!8429 lt!276534)))))

(declare-fun lt!276905 () Unit!12959)

(assert (=> d!62881 (= lt!276905 e!125504)))

(declare-fun c!9314 () Bool)

(assert (=> d!62881 (= c!9314 (not (= (size!4270 (buf!4713 (_2!8429 lt!276539))) #b00000000000000000000000000000000)))))

(declare-fun lt!276902 () Unit!12959)

(declare-fun lt!276899 () Unit!12959)

(assert (=> d!62881 (= lt!276902 lt!276899)))

(assert (=> d!62881 (isPrefixOf!0 (_2!8429 lt!276534) (_2!8429 lt!276534))))

(assert (=> d!62881 (= lt!276899 (lemmaIsPrefixRefl!0 (_2!8429 lt!276534)))))

(declare-fun lt!276893 () Unit!12959)

(declare-fun lt!276901 () Unit!12959)

(assert (=> d!62881 (= lt!276893 lt!276901)))

(assert (=> d!62881 (= lt!276901 (lemmaIsPrefixRefl!0 (_2!8429 lt!276534)))))

(declare-fun lt!276894 () Unit!12959)

(declare-fun lt!276888 () Unit!12959)

(assert (=> d!62881 (= lt!276894 lt!276888)))

(assert (=> d!62881 (isPrefixOf!0 lt!276898 lt!276898)))

(assert (=> d!62881 (= lt!276888 (lemmaIsPrefixRefl!0 lt!276898))))

(declare-fun lt!276890 () Unit!12959)

(declare-fun lt!276900 () Unit!12959)

(assert (=> d!62881 (= lt!276890 lt!276900)))

(assert (=> d!62881 (isPrefixOf!0 (_2!8429 lt!276539) (_2!8429 lt!276539))))

(assert (=> d!62881 (= lt!276900 (lemmaIsPrefixRefl!0 (_2!8429 lt!276539)))))

(assert (=> d!62881 (= lt!276898 (BitStream!7649 (buf!4713 (_2!8429 lt!276534)) (currentByte!8923 (_2!8429 lt!276539)) (currentBit!8918 (_2!8429 lt!276539))))))

(assert (=> d!62881 (isPrefixOf!0 (_2!8429 lt!276539) (_2!8429 lt!276534))))

(assert (=> d!62881 (= (reader!0 (_2!8429 lt!276539) (_2!8429 lt!276534)) lt!276889)))

(declare-fun b!180623 () Bool)

(declare-fun lt!276903 () (_ BitVec 64))

(declare-fun lt!276906 () (_ BitVec 64))

(assert (=> b!180623 (= e!125503 (= (_1!8430 lt!276889) (withMovedBitIndex!0 (_2!8430 lt!276889) (bvsub lt!276903 lt!276906))))))

(assert (=> b!180623 (or (= (bvand lt!276903 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!276906 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!276903 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!276903 lt!276906) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!180623 (= lt!276906 (bitIndex!0 (size!4270 (buf!4713 (_2!8429 lt!276534))) (currentByte!8923 (_2!8429 lt!276534)) (currentBit!8918 (_2!8429 lt!276534))))))

(assert (=> b!180623 (= lt!276903 (bitIndex!0 (size!4270 (buf!4713 (_2!8429 lt!276539))) (currentByte!8923 (_2!8429 lt!276539)) (currentBit!8918 (_2!8429 lt!276539))))))

(declare-fun b!180624 () Bool)

(declare-fun Unit!12967 () Unit!12959)

(assert (=> b!180624 (= e!125504 Unit!12967)))

(assert (= (and d!62881 c!9314) b!180622))

(assert (= (and d!62881 (not c!9314)) b!180624))

(assert (= (and d!62881 res!149985) b!180621))

(assert (= (and b!180621 res!149986) b!180620))

(assert (= (and b!180620 res!149987) b!180623))

(declare-fun m!281161 () Bool)

(assert (=> b!180621 m!281161))

(declare-fun m!281163 () Bool)

(assert (=> d!62881 m!281163))

(declare-fun m!281165 () Bool)

(assert (=> d!62881 m!281165))

(declare-fun m!281167 () Bool)

(assert (=> d!62881 m!281167))

(declare-fun m!281169 () Bool)

(assert (=> d!62881 m!281169))

(declare-fun m!281171 () Bool)

(assert (=> d!62881 m!281171))

(assert (=> d!62881 m!280871))

(assert (=> d!62881 m!281143))

(assert (=> d!62881 m!281145))

(declare-fun m!281173 () Bool)

(assert (=> d!62881 m!281173))

(declare-fun m!281175 () Bool)

(assert (=> d!62881 m!281175))

(declare-fun m!281177 () Bool)

(assert (=> d!62881 m!281177))

(declare-fun m!281179 () Bool)

(assert (=> b!180620 m!281179))

(declare-fun m!281181 () Bool)

(assert (=> b!180623 m!281181))

(assert (=> b!180623 m!280863))

(assert (=> b!180623 m!280859))

(assert (=> b!180622 m!280859))

(declare-fun m!281183 () Bool)

(assert (=> b!180622 m!281183))

(declare-fun m!281185 () Bool)

(assert (=> b!180622 m!281185))

(assert (=> b!180430 d!62881))

(declare-fun d!62883 () Bool)

(assert (=> d!62883 (= (invariant!0 (currentBit!8918 thiss!1204) (currentByte!8923 thiss!1204) (size!4270 (buf!4713 (_2!8429 lt!276539)))) (and (bvsge (currentBit!8918 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!8918 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!8923 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!8923 thiss!1204) (size!4270 (buf!4713 (_2!8429 lt!276539)))) (and (= (currentBit!8918 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!8923 thiss!1204) (size!4270 (buf!4713 (_2!8429 lt!276539))))))))))

(assert (=> b!180430 d!62883))

(declare-fun d!62885 () Bool)

(declare-fun lt!276907 () tuple2!15586)

(assert (=> d!62885 (= lt!276907 (readBit!0 (_1!8430 lt!276535)))))

(assert (=> d!62885 (= (readBitPure!0 (_1!8430 lt!276535)) (tuple2!15567 (_2!8438 lt!276907) (_1!8438 lt!276907)))))

(declare-fun bs!15678 () Bool)

(assert (= bs!15678 d!62885))

(declare-fun m!281187 () Bool)

(assert (=> bs!15678 m!281187))

(assert (=> b!180430 d!62885))

(declare-fun d!62887 () Bool)

(declare-fun e!125507 () Bool)

(assert (=> d!62887 e!125507))

(declare-fun res!149990 () Bool)

(assert (=> d!62887 (=> (not res!149990) (not e!125507))))

(declare-fun lt!276919 () tuple2!15566)

(declare-fun lt!276917 () tuple2!15566)

(assert (=> d!62887 (= res!149990 (= (bitIndex!0 (size!4270 (buf!4713 (_1!8428 lt!276919))) (currentByte!8923 (_1!8428 lt!276919)) (currentBit!8918 (_1!8428 lt!276919))) (bitIndex!0 (size!4270 (buf!4713 (_1!8428 lt!276917))) (currentByte!8923 (_1!8428 lt!276917)) (currentBit!8918 (_1!8428 lt!276917)))))))

(declare-fun lt!276916 () BitStream!7648)

(declare-fun lt!276918 () Unit!12959)

(declare-fun choose!50 (BitStream!7648 BitStream!7648 BitStream!7648 tuple2!15566 tuple2!15566 BitStream!7648 Bool tuple2!15566 tuple2!15566 BitStream!7648 Bool) Unit!12959)

(assert (=> d!62887 (= lt!276918 (choose!50 lt!276549 (_2!8429 lt!276534) lt!276916 lt!276919 (tuple2!15567 (_1!8428 lt!276919) (_2!8428 lt!276919)) (_1!8428 lt!276919) (_2!8428 lt!276919) lt!276917 (tuple2!15567 (_1!8428 lt!276917) (_2!8428 lt!276917)) (_1!8428 lt!276917) (_2!8428 lt!276917)))))

(assert (=> d!62887 (= lt!276917 (readBitPure!0 lt!276916))))

(assert (=> d!62887 (= lt!276919 (readBitPure!0 lt!276549))))

(assert (=> d!62887 (= lt!276916 (BitStream!7649 (buf!4713 (_2!8429 lt!276534)) (currentByte!8923 lt!276549) (currentBit!8918 lt!276549)))))

(assert (=> d!62887 (invariant!0 (currentBit!8918 lt!276549) (currentByte!8923 lt!276549) (size!4270 (buf!4713 (_2!8429 lt!276534))))))

(assert (=> d!62887 (= (readBitPrefixLemma!0 lt!276549 (_2!8429 lt!276534)) lt!276918)))

(declare-fun b!180627 () Bool)

(assert (=> b!180627 (= e!125507 (= (_2!8428 lt!276919) (_2!8428 lt!276917)))))

(assert (= (and d!62887 res!149990) b!180627))

(declare-fun m!281189 () Bool)

(assert (=> d!62887 m!281189))

(declare-fun m!281191 () Bool)

(assert (=> d!62887 m!281191))

(declare-fun m!281193 () Bool)

(assert (=> d!62887 m!281193))

(assert (=> d!62887 m!280847))

(declare-fun m!281195 () Bool)

(assert (=> d!62887 m!281195))

(declare-fun m!281197 () Bool)

(assert (=> d!62887 m!281197))

(assert (=> b!180430 d!62887))

(declare-fun d!62889 () Bool)

(assert (=> d!62889 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4270 (buf!4713 (_2!8429 lt!276534)))) ((_ sign_extend 32) (currentByte!8923 thiss!1204)) ((_ sign_extend 32) (currentBit!8918 thiss!1204)) lt!276548) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4270 (buf!4713 (_2!8429 lt!276534)))) ((_ sign_extend 32) (currentByte!8923 thiss!1204)) ((_ sign_extend 32) (currentBit!8918 thiss!1204))) lt!276548))))

(declare-fun bs!15679 () Bool)

(assert (= bs!15679 d!62889))

(declare-fun m!281199 () Bool)

(assert (=> bs!15679 m!281199))

(assert (=> b!180430 d!62889))

(declare-fun d!62891 () Bool)

(declare-fun e!125510 () Bool)

(assert (=> d!62891 e!125510))

(declare-fun res!149996 () Bool)

(assert (=> d!62891 (=> (not res!149996) (not e!125510))))

(declare-fun lt!276935 () (_ BitVec 64))

(declare-fun lt!276936 () (_ BitVec 64))

(declare-fun lt!276934 () (_ BitVec 64))

(assert (=> d!62891 (= res!149996 (= lt!276935 (bvsub lt!276934 lt!276936)))))

(assert (=> d!62891 (or (= (bvand lt!276934 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!276936 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!276934 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!276934 lt!276936) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62891 (= lt!276936 (remainingBits!0 ((_ sign_extend 32) (size!4270 (buf!4713 (_1!8428 lt!276537)))) ((_ sign_extend 32) (currentByte!8923 (_1!8428 lt!276537))) ((_ sign_extend 32) (currentBit!8918 (_1!8428 lt!276537)))))))

(declare-fun lt!276933 () (_ BitVec 64))

(declare-fun lt!276932 () (_ BitVec 64))

(assert (=> d!62891 (= lt!276934 (bvmul lt!276933 lt!276932))))

(assert (=> d!62891 (or (= lt!276933 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!276932 (bvsdiv (bvmul lt!276933 lt!276932) lt!276933)))))

(assert (=> d!62891 (= lt!276932 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62891 (= lt!276933 ((_ sign_extend 32) (size!4270 (buf!4713 (_1!8428 lt!276537)))))))

(assert (=> d!62891 (= lt!276935 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8923 (_1!8428 lt!276537))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8918 (_1!8428 lt!276537)))))))

(assert (=> d!62891 (invariant!0 (currentBit!8918 (_1!8428 lt!276537)) (currentByte!8923 (_1!8428 lt!276537)) (size!4270 (buf!4713 (_1!8428 lt!276537))))))

(assert (=> d!62891 (= (bitIndex!0 (size!4270 (buf!4713 (_1!8428 lt!276537))) (currentByte!8923 (_1!8428 lt!276537)) (currentBit!8918 (_1!8428 lt!276537))) lt!276935)))

(declare-fun b!180632 () Bool)

(declare-fun res!149995 () Bool)

(assert (=> b!180632 (=> (not res!149995) (not e!125510))))

(assert (=> b!180632 (= res!149995 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!276935))))

(declare-fun b!180633 () Bool)

(declare-fun lt!276937 () (_ BitVec 64))

(assert (=> b!180633 (= e!125510 (bvsle lt!276935 (bvmul lt!276937 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!180633 (or (= lt!276937 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!276937 #b0000000000000000000000000000000000000000000000000000000000001000) lt!276937)))))

(assert (=> b!180633 (= lt!276937 ((_ sign_extend 32) (size!4270 (buf!4713 (_1!8428 lt!276537)))))))

(assert (= (and d!62891 res!149996) b!180632))

(assert (= (and b!180632 res!149995) b!180633))

(declare-fun m!281201 () Bool)

(assert (=> d!62891 m!281201))

(declare-fun m!281203 () Bool)

(assert (=> d!62891 m!281203))

(assert (=> b!180430 d!62891))

(declare-fun d!62893 () Bool)

(declare-fun e!125511 () Bool)

(assert (=> d!62893 e!125511))

(declare-fun res!149998 () Bool)

(assert (=> d!62893 (=> (not res!149998) (not e!125511))))

(declare-fun lt!276942 () (_ BitVec 64))

(declare-fun lt!276941 () (_ BitVec 64))

(declare-fun lt!276940 () (_ BitVec 64))

(assert (=> d!62893 (= res!149998 (= lt!276941 (bvsub lt!276940 lt!276942)))))

(assert (=> d!62893 (or (= (bvand lt!276940 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!276942 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!276940 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!276940 lt!276942) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62893 (= lt!276942 (remainingBits!0 ((_ sign_extend 32) (size!4270 (buf!4713 (_1!8428 lt!276538)))) ((_ sign_extend 32) (currentByte!8923 (_1!8428 lt!276538))) ((_ sign_extend 32) (currentBit!8918 (_1!8428 lt!276538)))))))

(declare-fun lt!276939 () (_ BitVec 64))

(declare-fun lt!276938 () (_ BitVec 64))

(assert (=> d!62893 (= lt!276940 (bvmul lt!276939 lt!276938))))

(assert (=> d!62893 (or (= lt!276939 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!276938 (bvsdiv (bvmul lt!276939 lt!276938) lt!276939)))))

(assert (=> d!62893 (= lt!276938 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62893 (= lt!276939 ((_ sign_extend 32) (size!4270 (buf!4713 (_1!8428 lt!276538)))))))

(assert (=> d!62893 (= lt!276941 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8923 (_1!8428 lt!276538))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8918 (_1!8428 lt!276538)))))))

(assert (=> d!62893 (invariant!0 (currentBit!8918 (_1!8428 lt!276538)) (currentByte!8923 (_1!8428 lt!276538)) (size!4270 (buf!4713 (_1!8428 lt!276538))))))

(assert (=> d!62893 (= (bitIndex!0 (size!4270 (buf!4713 (_1!8428 lt!276538))) (currentByte!8923 (_1!8428 lt!276538)) (currentBit!8918 (_1!8428 lt!276538))) lt!276941)))

(declare-fun b!180634 () Bool)

(declare-fun res!149997 () Bool)

(assert (=> b!180634 (=> (not res!149997) (not e!125511))))

(assert (=> b!180634 (= res!149997 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!276941))))

(declare-fun b!180635 () Bool)

(declare-fun lt!276943 () (_ BitVec 64))

(assert (=> b!180635 (= e!125511 (bvsle lt!276941 (bvmul lt!276943 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!180635 (or (= lt!276943 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!276943 #b0000000000000000000000000000000000000000000000000000000000001000) lt!276943)))))

(assert (=> b!180635 (= lt!276943 ((_ sign_extend 32) (size!4270 (buf!4713 (_1!8428 lt!276538)))))))

(assert (= (and d!62893 res!149998) b!180634))

(assert (= (and b!180634 res!149997) b!180635))

(declare-fun m!281205 () Bool)

(assert (=> d!62893 m!281205))

(declare-fun m!281207 () Bool)

(assert (=> d!62893 m!281207))

(assert (=> b!180430 d!62893))

(declare-fun d!62895 () Bool)

(assert (=> d!62895 (validate_offset_bits!1 ((_ sign_extend 32) (size!4270 (buf!4713 (_2!8429 lt!276534)))) ((_ sign_extend 32) (currentByte!8923 thiss!1204)) ((_ sign_extend 32) (currentBit!8918 thiss!1204)) lt!276548)))

(declare-fun lt!276946 () Unit!12959)

(declare-fun choose!9 (BitStream!7648 array!9680 (_ BitVec 64) BitStream!7648) Unit!12959)

(assert (=> d!62895 (= lt!276946 (choose!9 thiss!1204 (buf!4713 (_2!8429 lt!276534)) lt!276548 (BitStream!7649 (buf!4713 (_2!8429 lt!276534)) (currentByte!8923 thiss!1204) (currentBit!8918 thiss!1204))))))

(assert (=> d!62895 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4713 (_2!8429 lt!276534)) lt!276548) lt!276946)))

(declare-fun bs!15680 () Bool)

(assert (= bs!15680 d!62895))

(assert (=> bs!15680 m!280829))

(declare-fun m!281209 () Bool)

(assert (=> bs!15680 m!281209))

(assert (=> b!180430 d!62895))

(declare-fun d!62897 () Bool)

(declare-fun lt!276947 () tuple2!15586)

(assert (=> d!62897 (= lt!276947 (readBit!0 (BitStream!7649 (buf!4713 (_2!8429 lt!276534)) (currentByte!8923 thiss!1204) (currentBit!8918 thiss!1204))))))

(assert (=> d!62897 (= (readBitPure!0 (BitStream!7649 (buf!4713 (_2!8429 lt!276534)) (currentByte!8923 thiss!1204) (currentBit!8918 thiss!1204))) (tuple2!15567 (_2!8438 lt!276947) (_1!8438 lt!276947)))))

(declare-fun bs!15681 () Bool)

(assert (= bs!15681 d!62897))

(declare-fun m!281211 () Bool)

(assert (=> bs!15681 m!281211))

(assert (=> b!180430 d!62897))

(declare-fun d!62899 () Bool)

(declare-fun res!150005 () Bool)

(declare-fun e!125517 () Bool)

(assert (=> d!62899 (=> (not res!150005) (not e!125517))))

(assert (=> d!62899 (= res!150005 (= (size!4270 (buf!4713 thiss!1204)) (size!4270 (buf!4713 (_2!8429 lt!276539)))))))

(assert (=> d!62899 (= (isPrefixOf!0 thiss!1204 (_2!8429 lt!276539)) e!125517)))

(declare-fun b!180642 () Bool)

(declare-fun res!150007 () Bool)

(assert (=> b!180642 (=> (not res!150007) (not e!125517))))

(assert (=> b!180642 (= res!150007 (bvsle (bitIndex!0 (size!4270 (buf!4713 thiss!1204)) (currentByte!8923 thiss!1204) (currentBit!8918 thiss!1204)) (bitIndex!0 (size!4270 (buf!4713 (_2!8429 lt!276539))) (currentByte!8923 (_2!8429 lt!276539)) (currentBit!8918 (_2!8429 lt!276539)))))))

(declare-fun b!180643 () Bool)

(declare-fun e!125516 () Bool)

(assert (=> b!180643 (= e!125517 e!125516)))

(declare-fun res!150006 () Bool)

(assert (=> b!180643 (=> res!150006 e!125516)))

(assert (=> b!180643 (= res!150006 (= (size!4270 (buf!4713 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!180644 () Bool)

(assert (=> b!180644 (= e!125516 (arrayBitRangesEq!0 (buf!4713 thiss!1204) (buf!4713 (_2!8429 lt!276539)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4270 (buf!4713 thiss!1204)) (currentByte!8923 thiss!1204) (currentBit!8918 thiss!1204))))))

(assert (= (and d!62899 res!150005) b!180642))

(assert (= (and b!180642 res!150007) b!180643))

(assert (= (and b!180643 (not res!150006)) b!180644))

(assert (=> b!180642 m!280861))

(assert (=> b!180642 m!280859))

(assert (=> b!180644 m!280861))

(assert (=> b!180644 m!280861))

(declare-fun m!281213 () Bool)

(assert (=> b!180644 m!281213))

(assert (=> b!180431 d!62899))

(assert (=> b!180421 d!62899))

(declare-fun d!62901 () Bool)

(assert (=> d!62901 (= (invariant!0 (currentBit!8918 thiss!1204) (currentByte!8923 thiss!1204) (size!4270 (buf!4713 thiss!1204))) (and (bvsge (currentBit!8918 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!8918 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!8923 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!8923 thiss!1204) (size!4270 (buf!4713 thiss!1204))) (and (= (currentBit!8918 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!8923 thiss!1204) (size!4270 (buf!4713 thiss!1204)))))))))

(assert (=> b!180432 d!62901))

(declare-fun d!62903 () Bool)

(assert (=> d!62903 (= (invariant!0 (currentBit!8918 thiss!1204) (currentByte!8923 thiss!1204) (size!4270 (buf!4713 (_2!8429 lt!276534)))) (and (bvsge (currentBit!8918 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!8918 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!8923 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!8923 thiss!1204) (size!4270 (buf!4713 (_2!8429 lt!276534)))) (and (= (currentBit!8918 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!8923 thiss!1204) (size!4270 (buf!4713 (_2!8429 lt!276534))))))))))

(assert (=> b!180423 d!62903))

(declare-fun d!62905 () Bool)

(assert (=> d!62905 (= (invariant!0 (currentBit!8918 (_2!8429 lt!276534)) (currentByte!8923 (_2!8429 lt!276534)) (size!4270 (buf!4713 (_2!8429 lt!276534)))) (and (bvsge (currentBit!8918 (_2!8429 lt!276534)) #b00000000000000000000000000000000) (bvslt (currentBit!8918 (_2!8429 lt!276534)) #b00000000000000000000000000001000) (bvsge (currentByte!8923 (_2!8429 lt!276534)) #b00000000000000000000000000000000) (or (bvslt (currentByte!8923 (_2!8429 lt!276534)) (size!4270 (buf!4713 (_2!8429 lt!276534)))) (and (= (currentBit!8918 (_2!8429 lt!276534)) #b00000000000000000000000000000000) (= (currentByte!8923 (_2!8429 lt!276534)) (size!4270 (buf!4713 (_2!8429 lt!276534))))))))))

(assert (=> b!180425 d!62905))

(declare-fun d!62907 () Bool)

(assert (=> d!62907 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4270 (buf!4713 thiss!1204))) ((_ sign_extend 32) (currentByte!8923 thiss!1204)) ((_ sign_extend 32) (currentBit!8918 thiss!1204)) lt!276548) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4270 (buf!4713 thiss!1204))) ((_ sign_extend 32) (currentByte!8923 thiss!1204)) ((_ sign_extend 32) (currentBit!8918 thiss!1204))) lt!276548))))

(declare-fun bs!15682 () Bool)

(assert (= bs!15682 d!62907))

(declare-fun m!281215 () Bool)

(assert (=> bs!15682 m!281215))

(assert (=> b!180426 d!62907))

(declare-fun d!62909 () Bool)

(declare-fun e!125518 () Bool)

(assert (=> d!62909 e!125518))

(declare-fun res!150009 () Bool)

(assert (=> d!62909 (=> (not res!150009) (not e!125518))))

(declare-fun lt!276951 () (_ BitVec 64))

(declare-fun lt!276952 () (_ BitVec 64))

(declare-fun lt!276950 () (_ BitVec 64))

(assert (=> d!62909 (= res!150009 (= lt!276951 (bvsub lt!276950 lt!276952)))))

(assert (=> d!62909 (or (= (bvand lt!276950 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!276952 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!276950 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!276950 lt!276952) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62909 (= lt!276952 (remainingBits!0 ((_ sign_extend 32) (size!4270 (buf!4713 (_2!8429 lt!276539)))) ((_ sign_extend 32) (currentByte!8923 (_2!8429 lt!276539))) ((_ sign_extend 32) (currentBit!8918 (_2!8429 lt!276539)))))))

(declare-fun lt!276949 () (_ BitVec 64))

(declare-fun lt!276948 () (_ BitVec 64))

(assert (=> d!62909 (= lt!276950 (bvmul lt!276949 lt!276948))))

(assert (=> d!62909 (or (= lt!276949 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!276948 (bvsdiv (bvmul lt!276949 lt!276948) lt!276949)))))

(assert (=> d!62909 (= lt!276948 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62909 (= lt!276949 ((_ sign_extend 32) (size!4270 (buf!4713 (_2!8429 lt!276539)))))))

(assert (=> d!62909 (= lt!276951 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8923 (_2!8429 lt!276539))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8918 (_2!8429 lt!276539)))))))

(assert (=> d!62909 (invariant!0 (currentBit!8918 (_2!8429 lt!276539)) (currentByte!8923 (_2!8429 lt!276539)) (size!4270 (buf!4713 (_2!8429 lt!276539))))))

(assert (=> d!62909 (= (bitIndex!0 (size!4270 (buf!4713 (_2!8429 lt!276539))) (currentByte!8923 (_2!8429 lt!276539)) (currentBit!8918 (_2!8429 lt!276539))) lt!276951)))

(declare-fun b!180645 () Bool)

(declare-fun res!150008 () Bool)

(assert (=> b!180645 (=> (not res!150008) (not e!125518))))

(assert (=> b!180645 (= res!150008 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!276951))))

(declare-fun b!180646 () Bool)

(declare-fun lt!276953 () (_ BitVec 64))

(assert (=> b!180646 (= e!125518 (bvsle lt!276951 (bvmul lt!276953 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!180646 (or (= lt!276953 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!276953 #b0000000000000000000000000000000000000000000000000000000000001000) lt!276953)))))

(assert (=> b!180646 (= lt!276953 ((_ sign_extend 32) (size!4270 (buf!4713 (_2!8429 lt!276539)))))))

(assert (= (and d!62909 res!150009) b!180645))

(assert (= (and b!180645 res!150008) b!180646))

(declare-fun m!281217 () Bool)

(assert (=> d!62909 m!281217))

(declare-fun m!281219 () Bool)

(assert (=> d!62909 m!281219))

(assert (=> b!180427 d!62909))

(declare-fun d!62911 () Bool)

(declare-fun e!125519 () Bool)

(assert (=> d!62911 e!125519))

(declare-fun res!150011 () Bool)

(assert (=> d!62911 (=> (not res!150011) (not e!125519))))

(declare-fun lt!276957 () (_ BitVec 64))

(declare-fun lt!276956 () (_ BitVec 64))

(declare-fun lt!276958 () (_ BitVec 64))

(assert (=> d!62911 (= res!150011 (= lt!276957 (bvsub lt!276956 lt!276958)))))

(assert (=> d!62911 (or (= (bvand lt!276956 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!276958 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!276956 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!276956 lt!276958) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62911 (= lt!276958 (remainingBits!0 ((_ sign_extend 32) (size!4270 (buf!4713 thiss!1204))) ((_ sign_extend 32) (currentByte!8923 thiss!1204)) ((_ sign_extend 32) (currentBit!8918 thiss!1204))))))

(declare-fun lt!276955 () (_ BitVec 64))

(declare-fun lt!276954 () (_ BitVec 64))

(assert (=> d!62911 (= lt!276956 (bvmul lt!276955 lt!276954))))

(assert (=> d!62911 (or (= lt!276955 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!276954 (bvsdiv (bvmul lt!276955 lt!276954) lt!276955)))))

(assert (=> d!62911 (= lt!276954 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62911 (= lt!276955 ((_ sign_extend 32) (size!4270 (buf!4713 thiss!1204))))))

(assert (=> d!62911 (= lt!276957 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8923 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8918 thiss!1204))))))

(assert (=> d!62911 (invariant!0 (currentBit!8918 thiss!1204) (currentByte!8923 thiss!1204) (size!4270 (buf!4713 thiss!1204)))))

(assert (=> d!62911 (= (bitIndex!0 (size!4270 (buf!4713 thiss!1204)) (currentByte!8923 thiss!1204) (currentBit!8918 thiss!1204)) lt!276957)))

(declare-fun b!180647 () Bool)

(declare-fun res!150010 () Bool)

(assert (=> b!180647 (=> (not res!150010) (not e!125519))))

(assert (=> b!180647 (= res!150010 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!276957))))

(declare-fun b!180648 () Bool)

(declare-fun lt!276959 () (_ BitVec 64))

(assert (=> b!180648 (= e!125519 (bvsle lt!276957 (bvmul lt!276959 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!180648 (or (= lt!276959 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!276959 #b0000000000000000000000000000000000000000000000000000000000001000) lt!276959)))))

(assert (=> b!180648 (= lt!276959 ((_ sign_extend 32) (size!4270 (buf!4713 thiss!1204))))))

(assert (= (and d!62911 res!150011) b!180647))

(assert (= (and b!180647 res!150010) b!180648))

(assert (=> d!62911 m!281215))

(assert (=> d!62911 m!280827))

(assert (=> b!180427 d!62911))

(declare-fun b!180661 () Bool)

(declare-fun e!125525 () Bool)

(declare-fun lt!276970 () tuple2!15566)

(declare-fun lt!276968 () tuple2!15568)

(assert (=> b!180661 (= e!125525 (= (bitIndex!0 (size!4270 (buf!4713 (_1!8428 lt!276970))) (currentByte!8923 (_1!8428 lt!276970)) (currentBit!8918 (_1!8428 lt!276970))) (bitIndex!0 (size!4270 (buf!4713 (_2!8429 lt!276968))) (currentByte!8923 (_2!8429 lt!276968)) (currentBit!8918 (_2!8429 lt!276968)))))))

(declare-fun b!180659 () Bool)

(declare-fun res!150023 () Bool)

(declare-fun e!125524 () Bool)

(assert (=> b!180659 (=> (not res!150023) (not e!125524))))

(assert (=> b!180659 (= res!150023 (isPrefixOf!0 thiss!1204 (_2!8429 lt!276968)))))

(declare-fun b!180658 () Bool)

(declare-fun res!150020 () Bool)

(assert (=> b!180658 (=> (not res!150020) (not e!125524))))

(declare-fun lt!276971 () (_ BitVec 64))

(declare-fun lt!276969 () (_ BitVec 64))

(assert (=> b!180658 (= res!150020 (= (bitIndex!0 (size!4270 (buf!4713 (_2!8429 lt!276968))) (currentByte!8923 (_2!8429 lt!276968)) (currentBit!8918 (_2!8429 lt!276968))) (bvadd lt!276969 lt!276971)))))

(assert (=> b!180658 (or (not (= (bvand lt!276969 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!276971 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!276969 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!276969 lt!276971) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!180658 (= lt!276971 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!180658 (= lt!276969 (bitIndex!0 (size!4270 (buf!4713 thiss!1204)) (currentByte!8923 thiss!1204) (currentBit!8918 thiss!1204)))))

(declare-fun b!180660 () Bool)

(assert (=> b!180660 (= e!125524 e!125525)))

(declare-fun res!150022 () Bool)

(assert (=> b!180660 (=> (not res!150022) (not e!125525))))

(assert (=> b!180660 (= res!150022 (and (= (_2!8428 lt!276970) lt!276544) (= (_1!8428 lt!276970) (_2!8429 lt!276968))))))

(assert (=> b!180660 (= lt!276970 (readBitPure!0 (readerFrom!0 (_2!8429 lt!276968) (currentBit!8918 thiss!1204) (currentByte!8923 thiss!1204))))))

(declare-fun d!62913 () Bool)

(assert (=> d!62913 e!125524))

(declare-fun res!150021 () Bool)

(assert (=> d!62913 (=> (not res!150021) (not e!125524))))

(assert (=> d!62913 (= res!150021 (= (size!4270 (buf!4713 thiss!1204)) (size!4270 (buf!4713 (_2!8429 lt!276968)))))))

(declare-fun choose!16 (BitStream!7648 Bool) tuple2!15568)

(assert (=> d!62913 (= lt!276968 (choose!16 thiss!1204 lt!276544))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!62913 (validate_offset_bit!0 ((_ sign_extend 32) (size!4270 (buf!4713 thiss!1204))) ((_ sign_extend 32) (currentByte!8923 thiss!1204)) ((_ sign_extend 32) (currentBit!8918 thiss!1204)))))

(assert (=> d!62913 (= (appendBit!0 thiss!1204 lt!276544) lt!276968)))

(assert (= (and d!62913 res!150021) b!180658))

(assert (= (and b!180658 res!150020) b!180659))

(assert (= (and b!180659 res!150023) b!180660))

(assert (= (and b!180660 res!150022) b!180661))

(declare-fun m!281221 () Bool)

(assert (=> b!180658 m!281221))

(assert (=> b!180658 m!280861))

(declare-fun m!281223 () Bool)

(assert (=> b!180661 m!281223))

(assert (=> b!180661 m!281221))

(declare-fun m!281225 () Bool)

(assert (=> b!180660 m!281225))

(assert (=> b!180660 m!281225))

(declare-fun m!281227 () Bool)

(assert (=> b!180660 m!281227))

(declare-fun m!281229 () Bool)

(assert (=> b!180659 m!281229))

(declare-fun m!281231 () Bool)

(assert (=> d!62913 m!281231))

(declare-fun m!281233 () Bool)

(assert (=> d!62913 m!281233))

(assert (=> b!180427 d!62913))

(declare-fun d!62915 () Bool)

(declare-fun e!125526 () Bool)

(assert (=> d!62915 e!125526))

(declare-fun res!150025 () Bool)

(assert (=> d!62915 (=> (not res!150025) (not e!125526))))

(declare-fun lt!276975 () (_ BitVec 64))

(declare-fun lt!276974 () (_ BitVec 64))

(declare-fun lt!276976 () (_ BitVec 64))

(assert (=> d!62915 (= res!150025 (= lt!276975 (bvsub lt!276974 lt!276976)))))

(assert (=> d!62915 (or (= (bvand lt!276974 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!276976 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!276974 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!276974 lt!276976) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62915 (= lt!276976 (remainingBits!0 ((_ sign_extend 32) (size!4270 (buf!4713 (_1!8428 lt!276540)))) ((_ sign_extend 32) (currentByte!8923 (_1!8428 lt!276540))) ((_ sign_extend 32) (currentBit!8918 (_1!8428 lt!276540)))))))

(declare-fun lt!276973 () (_ BitVec 64))

(declare-fun lt!276972 () (_ BitVec 64))

(assert (=> d!62915 (= lt!276974 (bvmul lt!276973 lt!276972))))

(assert (=> d!62915 (or (= lt!276973 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!276972 (bvsdiv (bvmul lt!276973 lt!276972) lt!276973)))))

(assert (=> d!62915 (= lt!276972 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62915 (= lt!276973 ((_ sign_extend 32) (size!4270 (buf!4713 (_1!8428 lt!276540)))))))

(assert (=> d!62915 (= lt!276975 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8923 (_1!8428 lt!276540))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8918 (_1!8428 lt!276540)))))))

(assert (=> d!62915 (invariant!0 (currentBit!8918 (_1!8428 lt!276540)) (currentByte!8923 (_1!8428 lt!276540)) (size!4270 (buf!4713 (_1!8428 lt!276540))))))

(assert (=> d!62915 (= (bitIndex!0 (size!4270 (buf!4713 (_1!8428 lt!276540))) (currentByte!8923 (_1!8428 lt!276540)) (currentBit!8918 (_1!8428 lt!276540))) lt!276975)))

(declare-fun b!180662 () Bool)

(declare-fun res!150024 () Bool)

(assert (=> b!180662 (=> (not res!150024) (not e!125526))))

(assert (=> b!180662 (= res!150024 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!276975))))

(declare-fun b!180663 () Bool)

(declare-fun lt!276977 () (_ BitVec 64))

(assert (=> b!180663 (= e!125526 (bvsle lt!276975 (bvmul lt!276977 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!180663 (or (= lt!276977 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!276977 #b0000000000000000000000000000000000000000000000000000000000001000) lt!276977)))))

(assert (=> b!180663 (= lt!276977 ((_ sign_extend 32) (size!4270 (buf!4713 (_1!8428 lt!276540)))))))

(assert (= (and d!62915 res!150025) b!180662))

(assert (= (and b!180662 res!150024) b!180663))

(declare-fun m!281235 () Bool)

(assert (=> d!62915 m!281235))

(declare-fun m!281237 () Bool)

(assert (=> d!62915 m!281237))

(assert (=> b!180416 d!62915))

(assert (=> b!180417 d!62909))

(assert (=> b!180417 d!62911))

(declare-fun d!62917 () Bool)

(assert (=> d!62917 (= (inv!12 thiss!1204) (invariant!0 (currentBit!8918 thiss!1204) (currentByte!8923 thiss!1204) (size!4270 (buf!4713 thiss!1204))))))

(declare-fun bs!15683 () Bool)

(assert (= bs!15683 d!62917))

(assert (=> bs!15683 m!280827))

(assert (=> start!39746 d!62917))

(declare-fun d!62919 () Bool)

(assert (=> d!62919 (= (array_inv!4011 (buf!4713 thiss!1204)) (bvsge (size!4270 (buf!4713 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!180428 d!62919))

(declare-fun d!62921 () Bool)

(declare-fun lt!276978 () tuple2!15586)

(assert (=> d!62921 (= lt!276978 (readBit!0 (readerFrom!0 (_2!8429 lt!276539) (currentBit!8918 thiss!1204) (currentByte!8923 thiss!1204))))))

(assert (=> d!62921 (= (readBitPure!0 (readerFrom!0 (_2!8429 lt!276539) (currentBit!8918 thiss!1204) (currentByte!8923 thiss!1204))) (tuple2!15567 (_2!8438 lt!276978) (_1!8438 lt!276978)))))

(declare-fun bs!15684 () Bool)

(assert (= bs!15684 d!62921))

(assert (=> bs!15684 m!280879))

(declare-fun m!281239 () Bool)

(assert (=> bs!15684 m!281239))

(assert (=> b!180429 d!62921))

(declare-fun d!62923 () Bool)

(declare-fun e!125529 () Bool)

(assert (=> d!62923 e!125529))

(declare-fun res!150029 () Bool)

(assert (=> d!62923 (=> (not res!150029) (not e!125529))))

(assert (=> d!62923 (= res!150029 (invariant!0 (currentBit!8918 (_2!8429 lt!276539)) (currentByte!8923 (_2!8429 lt!276539)) (size!4270 (buf!4713 (_2!8429 lt!276539)))))))

(assert (=> d!62923 (= (readerFrom!0 (_2!8429 lt!276539) (currentBit!8918 thiss!1204) (currentByte!8923 thiss!1204)) (BitStream!7649 (buf!4713 (_2!8429 lt!276539)) (currentByte!8923 thiss!1204) (currentBit!8918 thiss!1204)))))

(declare-fun b!180666 () Bool)

(assert (=> b!180666 (= e!125529 (invariant!0 (currentBit!8918 thiss!1204) (currentByte!8923 thiss!1204) (size!4270 (buf!4713 (_2!8429 lt!276539)))))))

(assert (= (and d!62923 res!150029) b!180666))

(assert (=> d!62923 m!281219))

(assert (=> b!180666 m!280833))

(assert (=> b!180429 d!62923))

(declare-fun d!62925 () Bool)

(declare-fun e!125530 () Bool)

(assert (=> d!62925 e!125530))

(declare-fun res!150031 () Bool)

(assert (=> d!62925 (=> (not res!150031) (not e!125530))))

(declare-fun lt!276983 () (_ BitVec 64))

(declare-fun lt!276981 () (_ BitVec 64))

(declare-fun lt!276982 () (_ BitVec 64))

(assert (=> d!62925 (= res!150031 (= lt!276982 (bvsub lt!276981 lt!276983)))))

(assert (=> d!62925 (or (= (bvand lt!276981 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!276983 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!276981 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!276981 lt!276983) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62925 (= lt!276983 (remainingBits!0 ((_ sign_extend 32) (size!4270 (buf!4713 (_2!8429 lt!276534)))) ((_ sign_extend 32) (currentByte!8923 (_2!8429 lt!276534))) ((_ sign_extend 32) (currentBit!8918 (_2!8429 lt!276534)))))))

(declare-fun lt!276980 () (_ BitVec 64))

(declare-fun lt!276979 () (_ BitVec 64))

(assert (=> d!62925 (= lt!276981 (bvmul lt!276980 lt!276979))))

(assert (=> d!62925 (or (= lt!276980 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!276979 (bvsdiv (bvmul lt!276980 lt!276979) lt!276980)))))

(assert (=> d!62925 (= lt!276979 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62925 (= lt!276980 ((_ sign_extend 32) (size!4270 (buf!4713 (_2!8429 lt!276534)))))))

(assert (=> d!62925 (= lt!276982 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8923 (_2!8429 lt!276534))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8918 (_2!8429 lt!276534)))))))

(assert (=> d!62925 (invariant!0 (currentBit!8918 (_2!8429 lt!276534)) (currentByte!8923 (_2!8429 lt!276534)) (size!4270 (buf!4713 (_2!8429 lt!276534))))))

(assert (=> d!62925 (= (bitIndex!0 (size!4270 (buf!4713 (_2!8429 lt!276534))) (currentByte!8923 (_2!8429 lt!276534)) (currentBit!8918 (_2!8429 lt!276534))) lt!276982)))

(declare-fun b!180667 () Bool)

(declare-fun res!150030 () Bool)

(assert (=> b!180667 (=> (not res!150030) (not e!125530))))

(assert (=> b!180667 (= res!150030 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!276982))))

(declare-fun b!180668 () Bool)

(declare-fun lt!276984 () (_ BitVec 64))

(assert (=> b!180668 (= e!125530 (bvsle lt!276982 (bvmul lt!276984 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!180668 (or (= lt!276984 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!276984 #b0000000000000000000000000000000000000000000000000000000000001000) lt!276984)))))

(assert (=> b!180668 (= lt!276984 ((_ sign_extend 32) (size!4270 (buf!4713 (_2!8429 lt!276534)))))))

(assert (= (and d!62925 res!150031) b!180667))

(assert (= (and b!180667 res!150030) b!180668))

(declare-fun m!281241 () Bool)

(assert (=> d!62925 m!281241))

(assert (=> d!62925 m!280883))

(assert (=> b!180418 d!62925))

(declare-fun d!62927 () Bool)

(declare-fun res!150032 () Bool)

(declare-fun e!125532 () Bool)

(assert (=> d!62927 (=> (not res!150032) (not e!125532))))

(assert (=> d!62927 (= res!150032 (= (size!4270 (buf!4713 thiss!1204)) (size!4270 (buf!4713 (_2!8429 lt!276534)))))))

(assert (=> d!62927 (= (isPrefixOf!0 thiss!1204 (_2!8429 lt!276534)) e!125532)))

(declare-fun b!180669 () Bool)

(declare-fun res!150034 () Bool)

(assert (=> b!180669 (=> (not res!150034) (not e!125532))))

(assert (=> b!180669 (= res!150034 (bvsle (bitIndex!0 (size!4270 (buf!4713 thiss!1204)) (currentByte!8923 thiss!1204) (currentBit!8918 thiss!1204)) (bitIndex!0 (size!4270 (buf!4713 (_2!8429 lt!276534))) (currentByte!8923 (_2!8429 lt!276534)) (currentBit!8918 (_2!8429 lt!276534)))))))

(declare-fun b!180670 () Bool)

(declare-fun e!125531 () Bool)

(assert (=> b!180670 (= e!125532 e!125531)))

(declare-fun res!150033 () Bool)

(assert (=> b!180670 (=> res!150033 e!125531)))

(assert (=> b!180670 (= res!150033 (= (size!4270 (buf!4713 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!180671 () Bool)

(assert (=> b!180671 (= e!125531 (arrayBitRangesEq!0 (buf!4713 thiss!1204) (buf!4713 (_2!8429 lt!276534)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4270 (buf!4713 thiss!1204)) (currentByte!8923 thiss!1204) (currentBit!8918 thiss!1204))))))

(assert (= (and d!62927 res!150032) b!180669))

(assert (= (and b!180669 res!150034) b!180670))

(assert (= (and b!180670 (not res!150033)) b!180671))

(assert (=> b!180669 m!280861))

(assert (=> b!180669 m!280863))

(assert (=> b!180671 m!280861))

(assert (=> b!180671 m!280861))

(declare-fun m!281243 () Bool)

(assert (=> b!180671 m!281243))

(assert (=> b!180418 d!62927))

(declare-fun d!62929 () Bool)

(assert (=> d!62929 (isPrefixOf!0 thiss!1204 (_2!8429 lt!276534))))

(declare-fun lt!276987 () Unit!12959)

(declare-fun choose!30 (BitStream!7648 BitStream!7648 BitStream!7648) Unit!12959)

(assert (=> d!62929 (= lt!276987 (choose!30 thiss!1204 (_2!8429 lt!276539) (_2!8429 lt!276534)))))

(assert (=> d!62929 (isPrefixOf!0 thiss!1204 (_2!8429 lt!276539))))

(assert (=> d!62929 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8429 lt!276539) (_2!8429 lt!276534)) lt!276987)))

(declare-fun bs!15685 () Bool)

(assert (= bs!15685 d!62929))

(assert (=> bs!15685 m!280865))

(declare-fun m!281245 () Bool)

(assert (=> bs!15685 m!281245))

(assert (=> bs!15685 m!280825))

(assert (=> b!180418 d!62929))

(declare-fun b!180767 () Bool)

(declare-fun res!150112 () Bool)

(declare-fun lt!277343 () tuple2!15568)

(assert (=> b!180767 (= res!150112 (= (bitIndex!0 (size!4270 (buf!4713 (_2!8429 lt!277343))) (currentByte!8923 (_2!8429 lt!277343)) (currentBit!8918 (_2!8429 lt!277343))) (bvadd (bitIndex!0 (size!4270 (buf!4713 (_2!8429 lt!276539))) (currentByte!8923 (_2!8429 lt!276539)) (currentBit!8918 (_2!8429 lt!276539))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun e!125589 () Bool)

(assert (=> b!180767 (=> (not res!150112) (not e!125589))))

(declare-fun b!180768 () Bool)

(declare-fun res!150114 () Bool)

(declare-fun e!125588 () Bool)

(assert (=> b!180768 (=> (not res!150114) (not e!125588))))

(declare-fun lt!277326 () tuple2!15568)

(assert (=> b!180768 (= res!150114 (= (size!4270 (buf!4713 (_2!8429 lt!276539))) (size!4270 (buf!4713 (_2!8429 lt!277326)))))))

(declare-fun b!180769 () Bool)

(declare-fun e!125590 () Bool)

(declare-datatypes ((tuple2!15588 0))(
  ( (tuple2!15589 (_1!8439 BitStream!7648) (_2!8439 (_ BitVec 64))) )
))
(declare-fun lt!277313 () tuple2!15588)

(declare-fun lt!277323 () tuple2!15570)

(assert (=> b!180769 (= e!125590 (= (_1!8439 lt!277313) (_2!8430 lt!277323)))))

(declare-fun d!62931 () Bool)

(assert (=> d!62931 e!125588))

(declare-fun res!150111 () Bool)

(assert (=> d!62931 (=> (not res!150111) (not e!125588))))

(assert (=> d!62931 (= res!150111 (invariant!0 (currentBit!8918 (_2!8429 lt!277326)) (currentByte!8923 (_2!8429 lt!277326)) (size!4270 (buf!4713 (_2!8429 lt!277326)))))))

(declare-fun e!125587 () tuple2!15568)

(assert (=> d!62931 (= lt!277326 e!125587)))

(declare-fun c!9326 () Bool)

(assert (=> d!62931 (= c!9326 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!62931 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!62931 (= (appendBitsLSBFirstLoopTR!0 (_2!8429 lt!276539) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!277326)))

(declare-fun b!180770 () Bool)

(declare-fun e!125595 () Bool)

(declare-fun lt!277306 () tuple2!15588)

(declare-fun lt!277316 () tuple2!15570)

(assert (=> b!180770 (= e!125595 (= (_1!8439 lt!277306) (_2!8430 lt!277316)))))

(declare-fun b!180771 () Bool)

(declare-fun lt!277321 () tuple2!15568)

(assert (=> b!180771 (= e!125587 (tuple2!15569 (_1!8429 lt!277321) (_2!8429 lt!277321)))))

(declare-fun lt!277333 () Bool)

(assert (=> b!180771 (= lt!277333 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!180771 (= lt!277343 (appendBit!0 (_2!8429 lt!276539) lt!277333))))

(declare-fun res!150117 () Bool)

(assert (=> b!180771 (= res!150117 (= (size!4270 (buf!4713 (_2!8429 lt!276539))) (size!4270 (buf!4713 (_2!8429 lt!277343)))))))

(assert (=> b!180771 (=> (not res!150117) (not e!125589))))

(assert (=> b!180771 e!125589))

(declare-fun lt!277339 () tuple2!15568)

(assert (=> b!180771 (= lt!277339 lt!277343)))

(assert (=> b!180771 (= lt!277321 (appendBitsLSBFirstLoopTR!0 (_2!8429 lt!277339) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!277293 () Unit!12959)

(assert (=> b!180771 (= lt!277293 (lemmaIsPrefixTransitive!0 (_2!8429 lt!276539) (_2!8429 lt!277339) (_2!8429 lt!277321)))))

(declare-fun call!2942 () Bool)

(assert (=> b!180771 call!2942))

(declare-fun lt!277324 () Unit!12959)

(assert (=> b!180771 (= lt!277324 lt!277293)))

(assert (=> b!180771 (invariant!0 (currentBit!8918 (_2!8429 lt!276539)) (currentByte!8923 (_2!8429 lt!276539)) (size!4270 (buf!4713 (_2!8429 lt!277339))))))

(declare-fun lt!277292 () BitStream!7648)

(assert (=> b!180771 (= lt!277292 (BitStream!7649 (buf!4713 (_2!8429 lt!277339)) (currentByte!8923 (_2!8429 lt!276539)) (currentBit!8918 (_2!8429 lt!276539))))))

(assert (=> b!180771 (invariant!0 (currentBit!8918 lt!277292) (currentByte!8923 lt!277292) (size!4270 (buf!4713 (_2!8429 lt!277321))))))

(declare-fun lt!277311 () BitStream!7648)

(assert (=> b!180771 (= lt!277311 (BitStream!7649 (buf!4713 (_2!8429 lt!277321)) (currentByte!8923 lt!277292) (currentBit!8918 lt!277292)))))

(declare-fun lt!277294 () tuple2!15566)

(assert (=> b!180771 (= lt!277294 (readBitPure!0 lt!277292))))

(declare-fun lt!277305 () tuple2!15566)

(assert (=> b!180771 (= lt!277305 (readBitPure!0 lt!277311))))

(declare-fun lt!277341 () Unit!12959)

(assert (=> b!180771 (= lt!277341 (readBitPrefixLemma!0 lt!277292 (_2!8429 lt!277321)))))

(declare-fun res!150116 () Bool)

(assert (=> b!180771 (= res!150116 (= (bitIndex!0 (size!4270 (buf!4713 (_1!8428 lt!277294))) (currentByte!8923 (_1!8428 lt!277294)) (currentBit!8918 (_1!8428 lt!277294))) (bitIndex!0 (size!4270 (buf!4713 (_1!8428 lt!277305))) (currentByte!8923 (_1!8428 lt!277305)) (currentBit!8918 (_1!8428 lt!277305)))))))

(declare-fun e!125594 () Bool)

(assert (=> b!180771 (=> (not res!150116) (not e!125594))))

(assert (=> b!180771 e!125594))

(declare-fun lt!277310 () Unit!12959)

(assert (=> b!180771 (= lt!277310 lt!277341)))

(declare-fun lt!277338 () tuple2!15570)

(assert (=> b!180771 (= lt!277338 (reader!0 (_2!8429 lt!276539) (_2!8429 lt!277321)))))

(declare-fun lt!277314 () tuple2!15570)

(assert (=> b!180771 (= lt!277314 (reader!0 (_2!8429 lt!277339) (_2!8429 lt!277321)))))

(declare-fun lt!277297 () tuple2!15566)

(assert (=> b!180771 (= lt!277297 (readBitPure!0 (_1!8430 lt!277338)))))

(assert (=> b!180771 (= (_2!8428 lt!277297) lt!277333)))

(declare-fun lt!277304 () Unit!12959)

(declare-fun Unit!12969 () Unit!12959)

(assert (=> b!180771 (= lt!277304 Unit!12969)))

(declare-fun lt!277322 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!180771 (= lt!277322 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!277308 () (_ BitVec 64))

(assert (=> b!180771 (= lt!277308 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!277295 () Unit!12959)

(assert (=> b!180771 (= lt!277295 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8429 lt!276539) (buf!4713 (_2!8429 lt!277321)) lt!277308))))

(assert (=> b!180771 (validate_offset_bits!1 ((_ sign_extend 32) (size!4270 (buf!4713 (_2!8429 lt!277321)))) ((_ sign_extend 32) (currentByte!8923 (_2!8429 lt!276539))) ((_ sign_extend 32) (currentBit!8918 (_2!8429 lt!276539))) lt!277308)))

(declare-fun lt!277331 () Unit!12959)

(assert (=> b!180771 (= lt!277331 lt!277295)))

(declare-fun lt!277329 () tuple2!15588)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7648 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!15588)

(assert (=> b!180771 (= lt!277329 (readNBitsLSBFirstsLoopPure!0 (_1!8430 lt!277338) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!277322))))

(declare-fun lt!277299 () (_ BitVec 64))

(assert (=> b!180771 (= lt!277299 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!277334 () Unit!12959)

(assert (=> b!180771 (= lt!277334 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8429 lt!277339) (buf!4713 (_2!8429 lt!277321)) lt!277299))))

(assert (=> b!180771 (validate_offset_bits!1 ((_ sign_extend 32) (size!4270 (buf!4713 (_2!8429 lt!277321)))) ((_ sign_extend 32) (currentByte!8923 (_2!8429 lt!277339))) ((_ sign_extend 32) (currentBit!8918 (_2!8429 lt!277339))) lt!277299)))

(declare-fun lt!277318 () Unit!12959)

(assert (=> b!180771 (= lt!277318 lt!277334)))

(declare-fun lt!277300 () tuple2!15588)

(assert (=> b!180771 (= lt!277300 (readNBitsLSBFirstsLoopPure!0 (_1!8430 lt!277314) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!277322 (ite (_2!8428 lt!277297) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!277289 () tuple2!15588)

(assert (=> b!180771 (= lt!277289 (readNBitsLSBFirstsLoopPure!0 (_1!8430 lt!277338) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!277322))))

(declare-fun c!9325 () Bool)

(assert (=> b!180771 (= c!9325 (_2!8428 (readBitPure!0 (_1!8430 lt!277338))))))

(declare-fun lt!277303 () tuple2!15588)

(declare-fun e!125591 () (_ BitVec 64))

(assert (=> b!180771 (= lt!277303 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8430 lt!277338) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!277322 e!125591)))))

(declare-fun lt!277291 () Unit!12959)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7648 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!12959)

(assert (=> b!180771 (= lt!277291 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8430 lt!277338) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!277322))))

(assert (=> b!180771 (and (= (_2!8439 lt!277289) (_2!8439 lt!277303)) (= (_1!8439 lt!277289) (_1!8439 lt!277303)))))

(declare-fun lt!277335 () Unit!12959)

(assert (=> b!180771 (= lt!277335 lt!277291)))

(assert (=> b!180771 (= (_1!8430 lt!277338) (withMovedBitIndex!0 (_2!8430 lt!277338) (bvsub (bitIndex!0 (size!4270 (buf!4713 (_2!8429 lt!276539))) (currentByte!8923 (_2!8429 lt!276539)) (currentBit!8918 (_2!8429 lt!276539))) (bitIndex!0 (size!4270 (buf!4713 (_2!8429 lt!277321))) (currentByte!8923 (_2!8429 lt!277321)) (currentBit!8918 (_2!8429 lt!277321))))))))

(declare-fun lt!277307 () Unit!12959)

(declare-fun Unit!12971 () Unit!12959)

(assert (=> b!180771 (= lt!277307 Unit!12971)))

(assert (=> b!180771 (= (_1!8430 lt!277314) (withMovedBitIndex!0 (_2!8430 lt!277314) (bvsub (bitIndex!0 (size!4270 (buf!4713 (_2!8429 lt!277339))) (currentByte!8923 (_2!8429 lt!277339)) (currentBit!8918 (_2!8429 lt!277339))) (bitIndex!0 (size!4270 (buf!4713 (_2!8429 lt!277321))) (currentByte!8923 (_2!8429 lt!277321)) (currentBit!8918 (_2!8429 lt!277321))))))))

(declare-fun lt!277342 () Unit!12959)

(declare-fun Unit!12972 () Unit!12959)

(assert (=> b!180771 (= lt!277342 Unit!12972)))

(assert (=> b!180771 (= (bitIndex!0 (size!4270 (buf!4713 (_2!8429 lt!276539))) (currentByte!8923 (_2!8429 lt!276539)) (currentBit!8918 (_2!8429 lt!276539))) (bvsub (bitIndex!0 (size!4270 (buf!4713 (_2!8429 lt!277339))) (currentByte!8923 (_2!8429 lt!277339)) (currentBit!8918 (_2!8429 lt!277339))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!277325 () Unit!12959)

(declare-fun Unit!12973 () Unit!12959)

(assert (=> b!180771 (= lt!277325 Unit!12973)))

(assert (=> b!180771 (= (_2!8439 lt!277329) (_2!8439 lt!277300))))

(declare-fun lt!277332 () Unit!12959)

(declare-fun Unit!12974 () Unit!12959)

(assert (=> b!180771 (= lt!277332 Unit!12974)))

(assert (=> b!180771 (invariant!0 (currentBit!8918 (_2!8429 lt!277321)) (currentByte!8923 (_2!8429 lt!277321)) (size!4270 (buf!4713 (_2!8429 lt!277321))))))

(declare-fun lt!277327 () Unit!12959)

(declare-fun Unit!12975 () Unit!12959)

(assert (=> b!180771 (= lt!277327 Unit!12975)))

(assert (=> b!180771 (= (size!4270 (buf!4713 (_2!8429 lt!276539))) (size!4270 (buf!4713 (_2!8429 lt!277321))))))

(declare-fun lt!277290 () Unit!12959)

(declare-fun Unit!12977 () Unit!12959)

(assert (=> b!180771 (= lt!277290 Unit!12977)))

(assert (=> b!180771 (= (bitIndex!0 (size!4270 (buf!4713 (_2!8429 lt!277321))) (currentByte!8923 (_2!8429 lt!277321)) (currentBit!8918 (_2!8429 lt!277321))) (bvsub (bvadd (bitIndex!0 (size!4270 (buf!4713 (_2!8429 lt!276539))) (currentByte!8923 (_2!8429 lt!276539)) (currentBit!8918 (_2!8429 lt!276539))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!277328 () Unit!12959)

(declare-fun Unit!12978 () Unit!12959)

(assert (=> b!180771 (= lt!277328 Unit!12978)))

(declare-fun lt!277315 () Unit!12959)

(declare-fun Unit!12979 () Unit!12959)

(assert (=> b!180771 (= lt!277315 Unit!12979)))

(assert (=> b!180771 (= lt!277316 (reader!0 (_2!8429 lt!276539) (_2!8429 lt!277321)))))

(declare-fun lt!277302 () (_ BitVec 64))

(assert (=> b!180771 (= lt!277302 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!277336 () Unit!12959)

(assert (=> b!180771 (= lt!277336 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8429 lt!276539) (buf!4713 (_2!8429 lt!277321)) lt!277302))))

(assert (=> b!180771 (validate_offset_bits!1 ((_ sign_extend 32) (size!4270 (buf!4713 (_2!8429 lt!277321)))) ((_ sign_extend 32) (currentByte!8923 (_2!8429 lt!276539))) ((_ sign_extend 32) (currentBit!8918 (_2!8429 lt!276539))) lt!277302)))

(declare-fun lt!277344 () Unit!12959)

(assert (=> b!180771 (= lt!277344 lt!277336)))

(assert (=> b!180771 (= lt!277306 (readNBitsLSBFirstsLoopPure!0 (_1!8430 lt!277316) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!150118 () Bool)

(assert (=> b!180771 (= res!150118 (= (_2!8439 lt!277306) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!180771 (=> (not res!150118) (not e!125595))))

(assert (=> b!180771 e!125595))

(declare-fun lt!277296 () Unit!12959)

(declare-fun Unit!12980 () Unit!12959)

(assert (=> b!180771 (= lt!277296 Unit!12980)))

(declare-fun b!180772 () Bool)

(declare-fun Unit!12981 () Unit!12959)

(assert (=> b!180772 (= e!125587 (tuple2!15569 Unit!12981 (_2!8429 lt!276539)))))

(declare-fun lt!277298 () Unit!12959)

(assert (=> b!180772 (= lt!277298 (lemmaIsPrefixRefl!0 (_2!8429 lt!276539)))))

(assert (=> b!180772 call!2942))

(declare-fun lt!277317 () Unit!12959)

(assert (=> b!180772 (= lt!277317 lt!277298)))

(declare-fun bm!2939 () Bool)

(assert (=> bm!2939 (= call!2942 (isPrefixOf!0 (_2!8429 lt!276539) (ite c!9326 (_2!8429 lt!276539) (_2!8429 lt!277321))))))

(declare-fun b!180773 () Bool)

(declare-fun res!150115 () Bool)

(assert (=> b!180773 (=> (not res!150115) (not e!125588))))

(assert (=> b!180773 (= res!150115 (isPrefixOf!0 (_2!8429 lt!276539) (_2!8429 lt!277326)))))

(declare-fun b!180774 () Bool)

(declare-fun lt!277312 () tuple2!15566)

(assert (=> b!180774 (= lt!277312 (readBitPure!0 (readerFrom!0 (_2!8429 lt!277343) (currentBit!8918 (_2!8429 lt!276539)) (currentByte!8923 (_2!8429 lt!276539)))))))

(declare-fun res!150119 () Bool)

(assert (=> b!180774 (= res!150119 (and (= (_2!8428 lt!277312) lt!277333) (= (_1!8428 lt!277312) (_2!8429 lt!277343))))))

(declare-fun e!125593 () Bool)

(assert (=> b!180774 (=> (not res!150119) (not e!125593))))

(assert (=> b!180774 (= e!125589 e!125593)))

(declare-fun b!180775 () Bool)

(assert (=> b!180775 (= e!125588 e!125590)))

(declare-fun res!150121 () Bool)

(assert (=> b!180775 (=> (not res!150121) (not e!125590))))

(assert (=> b!180775 (= res!150121 (= (_2!8439 lt!277313) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!180775 (= lt!277313 (readNBitsLSBFirstsLoopPure!0 (_1!8430 lt!277323) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!277301 () Unit!12959)

(declare-fun lt!277330 () Unit!12959)

(assert (=> b!180775 (= lt!277301 lt!277330)))

(declare-fun lt!277319 () (_ BitVec 64))

(assert (=> b!180775 (validate_offset_bits!1 ((_ sign_extend 32) (size!4270 (buf!4713 (_2!8429 lt!277326)))) ((_ sign_extend 32) (currentByte!8923 (_2!8429 lt!276539))) ((_ sign_extend 32) (currentBit!8918 (_2!8429 lt!276539))) lt!277319)))

(assert (=> b!180775 (= lt!277330 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8429 lt!276539) (buf!4713 (_2!8429 lt!277326)) lt!277319))))

(declare-fun e!125592 () Bool)

(assert (=> b!180775 e!125592))

(declare-fun res!150113 () Bool)

(assert (=> b!180775 (=> (not res!150113) (not e!125592))))

(assert (=> b!180775 (= res!150113 (and (= (size!4270 (buf!4713 (_2!8429 lt!276539))) (size!4270 (buf!4713 (_2!8429 lt!277326)))) (bvsge lt!277319 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!180775 (= lt!277319 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!180775 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!180775 (= lt!277323 (reader!0 (_2!8429 lt!276539) (_2!8429 lt!277326)))))

(declare-fun b!180776 () Bool)

(assert (=> b!180776 (= e!125591 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!180777 () Bool)

(assert (=> b!180777 (= e!125592 (validate_offset_bits!1 ((_ sign_extend 32) (size!4270 (buf!4713 (_2!8429 lt!276539)))) ((_ sign_extend 32) (currentByte!8923 (_2!8429 lt!276539))) ((_ sign_extend 32) (currentBit!8918 (_2!8429 lt!276539))) lt!277319))))

(declare-fun b!180778 () Bool)

(declare-fun res!150110 () Bool)

(assert (=> b!180778 (= res!150110 (isPrefixOf!0 (_2!8429 lt!276539) (_2!8429 lt!277343)))))

(assert (=> b!180778 (=> (not res!150110) (not e!125589))))

(declare-fun b!180779 () Bool)

(assert (=> b!180779 (= e!125594 (= (_2!8428 lt!277294) (_2!8428 lt!277305)))))

(declare-fun b!180780 () Bool)

(declare-fun res!150120 () Bool)

(assert (=> b!180780 (=> (not res!150120) (not e!125588))))

(declare-fun lt!277337 () (_ BitVec 64))

(declare-fun lt!277309 () (_ BitVec 64))

(assert (=> b!180780 (= res!150120 (= (bitIndex!0 (size!4270 (buf!4713 (_2!8429 lt!277326))) (currentByte!8923 (_2!8429 lt!277326)) (currentBit!8918 (_2!8429 lt!277326))) (bvsub lt!277337 lt!277309)))))

(assert (=> b!180780 (or (= (bvand lt!277337 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!277309 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!277337 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!277337 lt!277309) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!180780 (= lt!277309 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!277320 () (_ BitVec 64))

(declare-fun lt!277340 () (_ BitVec 64))

(assert (=> b!180780 (= lt!277337 (bvadd lt!277320 lt!277340))))

(assert (=> b!180780 (or (not (= (bvand lt!277320 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!277340 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!277320 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!277320 lt!277340) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!180780 (= lt!277340 ((_ sign_extend 32) nBits!348))))

(assert (=> b!180780 (= lt!277320 (bitIndex!0 (size!4270 (buf!4713 (_2!8429 lt!276539))) (currentByte!8923 (_2!8429 lt!276539)) (currentBit!8918 (_2!8429 lt!276539))))))

(declare-fun b!180781 () Bool)

(assert (=> b!180781 (= e!125591 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!180782 () Bool)

(assert (=> b!180782 (= e!125593 (= (bitIndex!0 (size!4270 (buf!4713 (_1!8428 lt!277312))) (currentByte!8923 (_1!8428 lt!277312)) (currentBit!8918 (_1!8428 lt!277312))) (bitIndex!0 (size!4270 (buf!4713 (_2!8429 lt!277343))) (currentByte!8923 (_2!8429 lt!277343)) (currentBit!8918 (_2!8429 lt!277343)))))))

(assert (= (and d!62931 c!9326) b!180772))

(assert (= (and d!62931 (not c!9326)) b!180771))

(assert (= (and b!180771 res!150117) b!180767))

(assert (= (and b!180767 res!150112) b!180778))

(assert (= (and b!180778 res!150110) b!180774))

(assert (= (and b!180774 res!150119) b!180782))

(assert (= (and b!180771 res!150116) b!180779))

(assert (= (and b!180771 c!9325) b!180776))

(assert (= (and b!180771 (not c!9325)) b!180781))

(assert (= (and b!180771 res!150118) b!180770))

(assert (= (or b!180772 b!180771) bm!2939))

(assert (= (and d!62931 res!150111) b!180768))

(assert (= (and b!180768 res!150114) b!180780))

(assert (= (and b!180780 res!150120) b!180773))

(assert (= (and b!180773 res!150115) b!180775))

(assert (= (and b!180775 res!150113) b!180777))

(assert (= (and b!180775 res!150121) b!180769))

(declare-fun m!281253 () Bool)

(assert (=> b!180782 m!281253))

(declare-fun m!281255 () Bool)

(assert (=> b!180782 m!281255))

(declare-fun m!281257 () Bool)

(assert (=> b!180771 m!281257))

(declare-fun m!281259 () Bool)

(assert (=> b!180771 m!281259))

(declare-fun m!281261 () Bool)

(assert (=> b!180771 m!281261))

(declare-fun m!281263 () Bool)

(assert (=> b!180771 m!281263))

(declare-fun m!281267 () Bool)

(assert (=> b!180771 m!281267))

(declare-fun m!281269 () Bool)

(assert (=> b!180771 m!281269))

(declare-fun m!281271 () Bool)

(assert (=> b!180771 m!281271))

(declare-fun m!281275 () Bool)

(assert (=> b!180771 m!281275))

(declare-fun m!281279 () Bool)

(assert (=> b!180771 m!281279))

(declare-fun m!281285 () Bool)

(assert (=> b!180771 m!281285))

(assert (=> b!180771 m!281261))

(declare-fun m!281291 () Bool)

(assert (=> b!180771 m!281291))

(declare-fun m!281295 () Bool)

(assert (=> b!180771 m!281295))

(assert (=> b!180771 m!280859))

(declare-fun m!281299 () Bool)

(assert (=> b!180771 m!281299))

(declare-fun m!281301 () Bool)

(assert (=> b!180771 m!281301))

(declare-fun m!281307 () Bool)

(assert (=> b!180771 m!281307))

(declare-fun m!281309 () Bool)

(assert (=> b!180771 m!281309))

(declare-fun m!281313 () Bool)

(assert (=> b!180771 m!281313))

(declare-fun m!281319 () Bool)

(assert (=> b!180771 m!281319))

(declare-fun m!281321 () Bool)

(assert (=> b!180771 m!281321))

(declare-fun m!281325 () Bool)

(assert (=> b!180771 m!281325))

(declare-fun m!281327 () Bool)

(assert (=> b!180771 m!281327))

(declare-fun m!281333 () Bool)

(assert (=> b!180771 m!281333))

(declare-fun m!281337 () Bool)

(assert (=> b!180771 m!281337))

(declare-fun m!281339 () Bool)

(assert (=> b!180771 m!281339))

(declare-fun m!281343 () Bool)

(assert (=> b!180771 m!281343))

(declare-fun m!281347 () Bool)

(assert (=> b!180771 m!281347))

(declare-fun m!281351 () Bool)

(assert (=> b!180771 m!281351))

(declare-fun m!281353 () Bool)

(assert (=> b!180771 m!281353))

(declare-fun m!281357 () Bool)

(assert (=> b!180771 m!281357))

(declare-fun m!281361 () Bool)

(assert (=> b!180771 m!281361))

(declare-fun m!281367 () Bool)

(assert (=> b!180771 m!281367))

(declare-fun m!281369 () Bool)

(assert (=> b!180771 m!281369))

(declare-fun m!281373 () Bool)

(assert (=> b!180778 m!281373))

(declare-fun m!281375 () Bool)

(assert (=> b!180774 m!281375))

(assert (=> b!180774 m!281375))

(declare-fun m!281379 () Bool)

(assert (=> b!180774 m!281379))

(declare-fun m!281381 () Bool)

(assert (=> b!180780 m!281381))

(assert (=> b!180780 m!280859))

(declare-fun m!281385 () Bool)

(assert (=> bm!2939 m!281385))

(assert (=> b!180772 m!281165))

(assert (=> b!180775 m!281313))

(assert (=> b!180775 m!281321))

(declare-fun m!281389 () Bool)

(assert (=> b!180775 m!281389))

(declare-fun m!281393 () Bool)

(assert (=> b!180775 m!281393))

(declare-fun m!281395 () Bool)

(assert (=> b!180775 m!281395))

(declare-fun m!281399 () Bool)

(assert (=> b!180775 m!281399))

(assert (=> b!180767 m!281255))

(assert (=> b!180767 m!280859))

(declare-fun m!281403 () Bool)

(assert (=> b!180773 m!281403))

(declare-fun m!281407 () Bool)

(assert (=> d!62931 m!281407))

(declare-fun m!281409 () Bool)

(assert (=> b!180777 m!281409))

(assert (=> b!180418 d!62931))

(declare-fun d!62943 () Bool)

(declare-fun res!150122 () Bool)

(declare-fun e!125597 () Bool)

(assert (=> d!62943 (=> (not res!150122) (not e!125597))))

(assert (=> d!62943 (= res!150122 (= (size!4270 (buf!4713 (_2!8429 lt!276539))) (size!4270 (buf!4713 (_2!8429 lt!276534)))))))

(assert (=> d!62943 (= (isPrefixOf!0 (_2!8429 lt!276539) (_2!8429 lt!276534)) e!125597)))

(declare-fun b!180783 () Bool)

(declare-fun res!150124 () Bool)

(assert (=> b!180783 (=> (not res!150124) (not e!125597))))

(assert (=> b!180783 (= res!150124 (bvsle (bitIndex!0 (size!4270 (buf!4713 (_2!8429 lt!276539))) (currentByte!8923 (_2!8429 lt!276539)) (currentBit!8918 (_2!8429 lt!276539))) (bitIndex!0 (size!4270 (buf!4713 (_2!8429 lt!276534))) (currentByte!8923 (_2!8429 lt!276534)) (currentBit!8918 (_2!8429 lt!276534)))))))

(declare-fun b!180784 () Bool)

(declare-fun e!125596 () Bool)

(assert (=> b!180784 (= e!125597 e!125596)))

(declare-fun res!150123 () Bool)

(assert (=> b!180784 (=> res!150123 e!125596)))

(assert (=> b!180784 (= res!150123 (= (size!4270 (buf!4713 (_2!8429 lt!276539))) #b00000000000000000000000000000000))))

(declare-fun b!180785 () Bool)

(assert (=> b!180785 (= e!125596 (arrayBitRangesEq!0 (buf!4713 (_2!8429 lt!276539)) (buf!4713 (_2!8429 lt!276534)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4270 (buf!4713 (_2!8429 lt!276539))) (currentByte!8923 (_2!8429 lt!276539)) (currentBit!8918 (_2!8429 lt!276539)))))))

(assert (= (and d!62943 res!150122) b!180783))

(assert (= (and b!180783 res!150124) b!180784))

(assert (= (and b!180784 (not res!150123)) b!180785))

(assert (=> b!180783 m!280859))

(assert (=> b!180783 m!280863))

(assert (=> b!180785 m!280859))

(assert (=> b!180785 m!280859))

(declare-fun m!281437 () Bool)

(assert (=> b!180785 m!281437))

(assert (=> b!180419 d!62943))

(push 1)

(assert (not b!180669))

(assert (not b!180771))

(assert (not b!180642))

(assert (not b!180616))

(assert (not d!62877))

(assert (not b!180615))

(assert (not b!180660))

(assert (not b!180785))

(assert (not b!180659))

(assert (not b!180666))

(assert (not d!62921))

(assert (not d!62931))

(assert (not b!180772))

(assert (not d!62879))

(assert (not d!62893))

(assert (not d!62915))

(assert (not d!62875))

(assert (not b!180622))

(assert (not b!180623))

(assert (not b!180783))

(assert (not d!62907))

(assert (not d!62917))

(assert (not d!62897))

(assert (not d!62911))

(assert (not b!180620))

(assert (not b!180773))

(assert (not b!180644))

(assert (not b!180658))

(assert (not b!180621))

(assert (not d!62885))

(assert (not d!62895))

(assert (not d!62887))

(assert (not d!62891))

(assert (not d!62913))

(assert (not b!180671))

(assert (not d!62881))

(assert (not b!180661))

(assert (not d!62929))

(assert (not d!62925))

(assert (not d!62923))

(assert (not d!62889))

(assert (not b!180618))

(assert (not b!180780))

(assert (not b!180775))

(assert (not bm!2939))

(assert (not b!180778))

(assert (not b!180767))

(assert (not d!62909))

(assert (not b!180617))

(assert (not b!180777))

(assert (not b!180782))

(assert (not b!180774))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

