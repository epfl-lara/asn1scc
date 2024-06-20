; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39840 () Bool)

(assert start!39840)

(declare-fun b!181033 () Bool)

(declare-fun res!150346 () Bool)

(declare-fun e!125755 () Bool)

(assert (=> b!181033 (=> res!150346 e!125755)))

(declare-fun lt!277817 () (_ BitVec 64))

(declare-fun lt!277813 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-datatypes ((array!9693 0))(
  ( (array!9694 (arr!5205 (Array (_ BitVec 32) (_ BitVec 8))) (size!4275 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7658 0))(
  ( (BitStream!7659 (buf!4721 array!9693) (currentByte!8937 (_ BitVec 32)) (currentBit!8932 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7658)

(declare-datatypes ((Unit!13008 0))(
  ( (Unit!13009) )
))
(declare-datatypes ((tuple2!15608 0))(
  ( (tuple2!15609 (_1!8449 Unit!13008) (_2!8449 BitStream!7658)) )
))
(declare-fun lt!277805 () tuple2!15608)

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!181033 (= res!150346 (or (not (= (size!4275 (buf!4721 (_2!8449 lt!277805))) (size!4275 (buf!4721 thiss!1204)))) (not (= lt!277813 (bvsub (bvadd lt!277817 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!181034 () Bool)

(declare-fun e!125756 () Bool)

(declare-datatypes ((tuple2!15610 0))(
  ( (tuple2!15611 (_1!8450 BitStream!7658) (_2!8450 Bool)) )
))
(declare-fun lt!277814 () tuple2!15610)

(declare-fun lt!277812 () tuple2!15610)

(assert (=> b!181034 (= e!125756 (= (_2!8450 lt!277814) (_2!8450 lt!277812)))))

(declare-fun b!181035 () Bool)

(declare-fun e!125752 () Bool)

(declare-fun e!125758 () Bool)

(assert (=> b!181035 (= e!125752 e!125758)))

(declare-fun res!150360 () Bool)

(assert (=> b!181035 (=> (not res!150360) (not e!125758))))

(declare-fun lt!277801 () Bool)

(declare-fun lt!277802 () tuple2!15608)

(declare-fun lt!277809 () tuple2!15610)

(assert (=> b!181035 (= res!150360 (and (= (_2!8450 lt!277809) lt!277801) (= (_1!8450 lt!277809) (_2!8449 lt!277802))))))

(declare-fun readBitPure!0 (BitStream!7658) tuple2!15610)

(declare-fun readerFrom!0 (BitStream!7658 (_ BitVec 32) (_ BitVec 32)) BitStream!7658)

(assert (=> b!181035 (= lt!277809 (readBitPure!0 (readerFrom!0 (_2!8449 lt!277802) (currentBit!8932 thiss!1204) (currentByte!8937 thiss!1204))))))

(declare-fun b!181036 () Bool)

(declare-fun e!125761 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!181036 (= e!125761 (invariant!0 (currentBit!8932 thiss!1204) (currentByte!8937 thiss!1204) (size!4275 (buf!4721 (_2!8449 lt!277805)))))))

(declare-fun b!181037 () Bool)

(declare-fun e!125751 () Bool)

(declare-fun e!125759 () Bool)

(assert (=> b!181037 (= e!125751 e!125759)))

(declare-fun res!150358 () Bool)

(assert (=> b!181037 (=> (not res!150358) (not e!125759))))

(declare-fun lt!277804 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!181037 (= res!150358 (validate_offset_bits!1 ((_ sign_extend 32) (size!4275 (buf!4721 thiss!1204))) ((_ sign_extend 32) (currentByte!8937 thiss!1204)) ((_ sign_extend 32) (currentBit!8932 thiss!1204)) lt!277804))))

(assert (=> b!181037 (= lt!277804 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!181039 () Bool)

(declare-fun res!150356 () Bool)

(assert (=> b!181039 (=> res!150356 e!125755)))

(assert (=> b!181039 (= res!150356 (not (invariant!0 (currentBit!8932 (_2!8449 lt!277805)) (currentByte!8937 (_2!8449 lt!277805)) (size!4275 (buf!4721 (_2!8449 lt!277805))))))))

(declare-fun b!181040 () Bool)

(declare-fun e!125757 () Bool)

(assert (=> b!181040 (= e!125757 e!125755)))

(declare-fun res!150350 () Bool)

(assert (=> b!181040 (=> res!150350 e!125755)))

(declare-fun lt!277800 () (_ BitVec 64))

(assert (=> b!181040 (= res!150350 (not (= lt!277813 (bvsub (bvsub (bvadd lt!277800 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!181040 (= lt!277813 (bitIndex!0 (size!4275 (buf!4721 (_2!8449 lt!277805))) (currentByte!8937 (_2!8449 lt!277805)) (currentBit!8932 (_2!8449 lt!277805))))))

(declare-fun isPrefixOf!0 (BitStream!7658 BitStream!7658) Bool)

(assert (=> b!181040 (isPrefixOf!0 thiss!1204 (_2!8449 lt!277805))))

(declare-fun lt!277810 () Unit!13008)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7658 BitStream!7658 BitStream!7658) Unit!13008)

(assert (=> b!181040 (= lt!277810 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8449 lt!277802) (_2!8449 lt!277805)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7658 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15608)

(assert (=> b!181040 (= lt!277805 (appendBitsLSBFirstLoopTR!0 (_2!8449 lt!277802) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!181041 () Bool)

(declare-fun lt!277808 () (_ BitVec 64))

(assert (=> b!181041 (= e!125758 (= (bitIndex!0 (size!4275 (buf!4721 (_1!8450 lt!277809))) (currentByte!8937 (_1!8450 lt!277809)) (currentBit!8932 (_1!8450 lt!277809))) lt!277808))))

(declare-fun b!181042 () Bool)

(declare-fun e!125753 () Bool)

(assert (=> b!181042 (= e!125755 e!125753)))

(declare-fun res!150348 () Bool)

(assert (=> b!181042 (=> res!150348 e!125753)))

(declare-datatypes ((tuple2!15612 0))(
  ( (tuple2!15613 (_1!8451 BitStream!7658) (_2!8451 BitStream!7658)) )
))
(declare-fun lt!277803 () tuple2!15612)

(assert (=> b!181042 (= res!150348 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!4275 (buf!4721 (_1!8451 lt!277803)))) ((_ sign_extend 32) (currentByte!8937 (_1!8451 lt!277803))) ((_ sign_extend 32) (currentBit!8932 (_1!8451 lt!277803))) lt!277804)))))

(assert (=> b!181042 (validate_offset_bits!1 ((_ sign_extend 32) (size!4275 (buf!4721 (_2!8449 lt!277805)))) ((_ sign_extend 32) (currentByte!8937 thiss!1204)) ((_ sign_extend 32) (currentBit!8932 thiss!1204)) lt!277804)))

(declare-fun lt!277807 () Unit!13008)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7658 array!9693 (_ BitVec 64)) Unit!13008)

(assert (=> b!181042 (= lt!277807 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4721 (_2!8449 lt!277805)) lt!277804))))

(assert (=> b!181042 (= (_2!8450 (readBitPure!0 (_1!8451 lt!277803))) lt!277801)))

(declare-fun lt!277815 () tuple2!15612)

(declare-fun reader!0 (BitStream!7658 BitStream!7658) tuple2!15612)

(assert (=> b!181042 (= lt!277815 (reader!0 (_2!8449 lt!277802) (_2!8449 lt!277805)))))

(assert (=> b!181042 (= lt!277803 (reader!0 thiss!1204 (_2!8449 lt!277805)))))

(assert (=> b!181042 e!125756))

(declare-fun res!150357 () Bool)

(assert (=> b!181042 (=> (not res!150357) (not e!125756))))

(assert (=> b!181042 (= res!150357 (= (bitIndex!0 (size!4275 (buf!4721 (_1!8450 lt!277814))) (currentByte!8937 (_1!8450 lt!277814)) (currentBit!8932 (_1!8450 lt!277814))) (bitIndex!0 (size!4275 (buf!4721 (_1!8450 lt!277812))) (currentByte!8937 (_1!8450 lt!277812)) (currentBit!8932 (_1!8450 lt!277812)))))))

(declare-fun lt!277806 () Unit!13008)

(declare-fun lt!277811 () BitStream!7658)

(declare-fun readBitPrefixLemma!0 (BitStream!7658 BitStream!7658) Unit!13008)

(assert (=> b!181042 (= lt!277806 (readBitPrefixLemma!0 lt!277811 (_2!8449 lt!277805)))))

(assert (=> b!181042 (= lt!277812 (readBitPure!0 (BitStream!7659 (buf!4721 (_2!8449 lt!277805)) (currentByte!8937 thiss!1204) (currentBit!8932 thiss!1204))))))

(assert (=> b!181042 (= lt!277814 (readBitPure!0 lt!277811))))

(assert (=> b!181042 e!125761))

(declare-fun res!150359 () Bool)

(assert (=> b!181042 (=> (not res!150359) (not e!125761))))

(assert (=> b!181042 (= res!150359 (invariant!0 (currentBit!8932 thiss!1204) (currentByte!8937 thiss!1204) (size!4275 (buf!4721 (_2!8449 lt!277802)))))))

(assert (=> b!181042 (= lt!277811 (BitStream!7659 (buf!4721 (_2!8449 lt!277802)) (currentByte!8937 thiss!1204) (currentBit!8932 thiss!1204)))))

(declare-fun b!181043 () Bool)

(declare-fun res!150344 () Bool)

(assert (=> b!181043 (=> res!150344 e!125755)))

(assert (=> b!181043 (= res!150344 (not (isPrefixOf!0 thiss!1204 (_2!8449 lt!277802))))))

(declare-fun b!181044 () Bool)

(declare-fun res!150351 () Bool)

(assert (=> b!181044 (=> res!150351 e!125755)))

(assert (=> b!181044 (= res!150351 (not (isPrefixOf!0 (_2!8449 lt!277802) (_2!8449 lt!277805))))))

(declare-fun b!181045 () Bool)

(declare-fun res!150347 () Bool)

(assert (=> b!181045 (=> (not res!150347) (not e!125752))))

(assert (=> b!181045 (= res!150347 (isPrefixOf!0 thiss!1204 (_2!8449 lt!277802)))))

(declare-fun b!181046 () Bool)

(declare-fun e!125754 () Bool)

(declare-fun array_inv!4016 (array!9693) Bool)

(assert (=> b!181046 (= e!125754 (array_inv!4016 (buf!4721 thiss!1204)))))

(declare-fun res!150355 () Bool)

(assert (=> start!39840 (=> (not res!150355) (not e!125751))))

(assert (=> start!39840 (= res!150355 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39840 e!125751))

(assert (=> start!39840 true))

(declare-fun inv!12 (BitStream!7658) Bool)

(assert (=> start!39840 (and (inv!12 thiss!1204) e!125754)))

(declare-fun b!181038 () Bool)

(declare-fun res!150345 () Bool)

(assert (=> b!181038 (=> (not res!150345) (not e!125759))))

(assert (=> b!181038 (= res!150345 (not (= i!590 nBits!348)))))

(declare-fun b!181047 () Bool)

(assert (=> b!181047 (= e!125759 (not e!125757))))

(declare-fun res!150352 () Bool)

(assert (=> b!181047 (=> res!150352 e!125757)))

(assert (=> b!181047 (= res!150352 (not (= lt!277800 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!277817))))))

(assert (=> b!181047 (= lt!277800 (bitIndex!0 (size!4275 (buf!4721 (_2!8449 lt!277802))) (currentByte!8937 (_2!8449 lt!277802)) (currentBit!8932 (_2!8449 lt!277802))))))

(assert (=> b!181047 (= lt!277817 (bitIndex!0 (size!4275 (buf!4721 thiss!1204)) (currentByte!8937 thiss!1204) (currentBit!8932 thiss!1204)))))

(declare-fun e!125750 () Bool)

(assert (=> b!181047 e!125750))

(declare-fun res!150354 () Bool)

(assert (=> b!181047 (=> (not res!150354) (not e!125750))))

(assert (=> b!181047 (= res!150354 (= (size!4275 (buf!4721 thiss!1204)) (size!4275 (buf!4721 (_2!8449 lt!277802)))))))

(declare-fun appendBit!0 (BitStream!7658 Bool) tuple2!15608)

(assert (=> b!181047 (= lt!277802 (appendBit!0 thiss!1204 lt!277801))))

(assert (=> b!181047 (= lt!277801 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!181048 () Bool)

(assert (=> b!181048 (= e!125750 e!125752)))

(declare-fun res!150349 () Bool)

(assert (=> b!181048 (=> (not res!150349) (not e!125752))))

(declare-fun lt!277816 () (_ BitVec 64))

(assert (=> b!181048 (= res!150349 (= lt!277808 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!277816)))))

(assert (=> b!181048 (= lt!277808 (bitIndex!0 (size!4275 (buf!4721 (_2!8449 lt!277802))) (currentByte!8937 (_2!8449 lt!277802)) (currentBit!8932 (_2!8449 lt!277802))))))

(assert (=> b!181048 (= lt!277816 (bitIndex!0 (size!4275 (buf!4721 thiss!1204)) (currentByte!8937 thiss!1204) (currentBit!8932 thiss!1204)))))

(declare-fun b!181049 () Bool)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!181049 (= e!125753 (= (bvand (bvand v!189 (onesLSBLong!0 i!590)) (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!181050 () Bool)

(declare-fun res!150353 () Bool)

(assert (=> b!181050 (=> (not res!150353) (not e!125759))))

(assert (=> b!181050 (= res!150353 (invariant!0 (currentBit!8932 thiss!1204) (currentByte!8937 thiss!1204) (size!4275 (buf!4721 thiss!1204))))))

(assert (= (and start!39840 res!150355) b!181037))

(assert (= (and b!181037 res!150358) b!181050))

(assert (= (and b!181050 res!150353) b!181038))

(assert (= (and b!181038 res!150345) b!181047))

(assert (= (and b!181047 res!150354) b!181048))

(assert (= (and b!181048 res!150349) b!181045))

(assert (= (and b!181045 res!150347) b!181035))

(assert (= (and b!181035 res!150360) b!181041))

(assert (= (and b!181047 (not res!150352)) b!181040))

(assert (= (and b!181040 (not res!150350)) b!181039))

(assert (= (and b!181039 (not res!150356)) b!181033))

(assert (= (and b!181033 (not res!150346)) b!181044))

(assert (= (and b!181044 (not res!150351)) b!181043))

(assert (= (and b!181043 (not res!150344)) b!181042))

(assert (= (and b!181042 res!150359) b!181036))

(assert (= (and b!181042 res!150357) b!181034))

(assert (= (and b!181042 (not res!150348)) b!181049))

(assert (= start!39840 b!181046))

(declare-fun m!281775 () Bool)

(assert (=> b!181041 m!281775))

(declare-fun m!281777 () Bool)

(assert (=> start!39840 m!281777))

(declare-fun m!281779 () Bool)

(assert (=> b!181036 m!281779))

(declare-fun m!281781 () Bool)

(assert (=> b!181046 m!281781))

(declare-fun m!281783 () Bool)

(assert (=> b!181049 m!281783))

(declare-fun m!281785 () Bool)

(assert (=> b!181049 m!281785))

(declare-fun m!281787 () Bool)

(assert (=> b!181045 m!281787))

(declare-fun m!281789 () Bool)

(assert (=> b!181035 m!281789))

(assert (=> b!181035 m!281789))

(declare-fun m!281791 () Bool)

(assert (=> b!181035 m!281791))

(declare-fun m!281793 () Bool)

(assert (=> b!181039 m!281793))

(declare-fun m!281795 () Bool)

(assert (=> b!181042 m!281795))

(declare-fun m!281797 () Bool)

(assert (=> b!181042 m!281797))

(declare-fun m!281799 () Bool)

(assert (=> b!181042 m!281799))

(declare-fun m!281801 () Bool)

(assert (=> b!181042 m!281801))

(declare-fun m!281803 () Bool)

(assert (=> b!181042 m!281803))

(declare-fun m!281805 () Bool)

(assert (=> b!181042 m!281805))

(declare-fun m!281807 () Bool)

(assert (=> b!181042 m!281807))

(declare-fun m!281809 () Bool)

(assert (=> b!181042 m!281809))

(declare-fun m!281811 () Bool)

(assert (=> b!181042 m!281811))

(declare-fun m!281813 () Bool)

(assert (=> b!181042 m!281813))

(declare-fun m!281815 () Bool)

(assert (=> b!181042 m!281815))

(declare-fun m!281817 () Bool)

(assert (=> b!181042 m!281817))

(declare-fun m!281819 () Bool)

(assert (=> b!181048 m!281819))

(declare-fun m!281821 () Bool)

(assert (=> b!181048 m!281821))

(declare-fun m!281823 () Bool)

(assert (=> b!181037 m!281823))

(declare-fun m!281825 () Bool)

(assert (=> b!181050 m!281825))

(declare-fun m!281827 () Bool)

(assert (=> b!181040 m!281827))

(declare-fun m!281829 () Bool)

(assert (=> b!181040 m!281829))

(declare-fun m!281831 () Bool)

(assert (=> b!181040 m!281831))

(declare-fun m!281833 () Bool)

(assert (=> b!181040 m!281833))

(declare-fun m!281835 () Bool)

(assert (=> b!181044 m!281835))

(assert (=> b!181047 m!281819))

(assert (=> b!181047 m!281821))

(declare-fun m!281837 () Bool)

(assert (=> b!181047 m!281837))

(assert (=> b!181043 m!281787))

(push 1)

(assert (not b!181049))

(assert (not b!181043))

(assert (not b!181039))

(assert (not b!181037))

(assert (not b!181045))

(assert (not b!181044))

(assert (not b!181040))

(assert (not b!181047))

(assert (not b!181041))

(assert (not b!181050))

(assert (not b!181042))

(assert (not start!39840))

(assert (not b!181048))

(assert (not b!181036))

(assert (not b!181035))

(assert (not b!181046))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!63059 () Bool)

(assert (=> d!63059 (= (invariant!0 (currentBit!8932 (_2!8449 lt!277805)) (currentByte!8937 (_2!8449 lt!277805)) (size!4275 (buf!4721 (_2!8449 lt!277805)))) (and (bvsge (currentBit!8932 (_2!8449 lt!277805)) #b00000000000000000000000000000000) (bvslt (currentBit!8932 (_2!8449 lt!277805)) #b00000000000000000000000000001000) (bvsge (currentByte!8937 (_2!8449 lt!277805)) #b00000000000000000000000000000000) (or (bvslt (currentByte!8937 (_2!8449 lt!277805)) (size!4275 (buf!4721 (_2!8449 lt!277805)))) (and (= (currentBit!8932 (_2!8449 lt!277805)) #b00000000000000000000000000000000) (= (currentByte!8937 (_2!8449 lt!277805)) (size!4275 (buf!4721 (_2!8449 lt!277805))))))))))

(assert (=> b!181039 d!63059))

(declare-fun d!63061 () Bool)

(assert (=> d!63061 (= (invariant!0 (currentBit!8932 thiss!1204) (currentByte!8937 thiss!1204) (size!4275 (buf!4721 thiss!1204))) (and (bvsge (currentBit!8932 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!8932 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!8937 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!8937 thiss!1204) (size!4275 (buf!4721 thiss!1204))) (and (= (currentBit!8932 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!8937 thiss!1204) (size!4275 (buf!4721 thiss!1204)))))))))

(assert (=> b!181050 d!63061))

(declare-fun d!63063 () Bool)

(declare-fun e!125811 () Bool)

(assert (=> d!63063 e!125811))

(declare-fun res!150442 () Bool)

(assert (=> d!63063 (=> (not res!150442) (not e!125811))))

(declare-fun lt!278039 () (_ BitVec 64))

(declare-fun lt!278035 () (_ BitVec 64))

(declare-fun lt!278038 () (_ BitVec 64))

(assert (=> d!63063 (= res!150442 (= lt!278039 (bvsub lt!278038 lt!278035)))))

(assert (=> d!63063 (or (= (bvand lt!278038 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!278035 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!278038 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!278038 lt!278035) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!63063 (= lt!278035 (remainingBits!0 ((_ sign_extend 32) (size!4275 (buf!4721 (_2!8449 lt!277805)))) ((_ sign_extend 32) (currentByte!8937 (_2!8449 lt!277805))) ((_ sign_extend 32) (currentBit!8932 (_2!8449 lt!277805)))))))

(declare-fun lt!278040 () (_ BitVec 64))

(declare-fun lt!278036 () (_ BitVec 64))

(assert (=> d!63063 (= lt!278038 (bvmul lt!278040 lt!278036))))

(assert (=> d!63063 (or (= lt!278040 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!278036 (bvsdiv (bvmul lt!278040 lt!278036) lt!278040)))))

(assert (=> d!63063 (= lt!278036 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63063 (= lt!278040 ((_ sign_extend 32) (size!4275 (buf!4721 (_2!8449 lt!277805)))))))

(assert (=> d!63063 (= lt!278039 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8937 (_2!8449 lt!277805))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8932 (_2!8449 lt!277805)))))))

(assert (=> d!63063 (invariant!0 (currentBit!8932 (_2!8449 lt!277805)) (currentByte!8937 (_2!8449 lt!277805)) (size!4275 (buf!4721 (_2!8449 lt!277805))))))

(assert (=> d!63063 (= (bitIndex!0 (size!4275 (buf!4721 (_2!8449 lt!277805))) (currentByte!8937 (_2!8449 lt!277805)) (currentBit!8932 (_2!8449 lt!277805))) lt!278039)))

(declare-fun b!181140 () Bool)

(declare-fun res!150443 () Bool)

(assert (=> b!181140 (=> (not res!150443) (not e!125811))))

(assert (=> b!181140 (= res!150443 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!278039))))

(declare-fun b!181141 () Bool)

(declare-fun lt!278037 () (_ BitVec 64))

(assert (=> b!181141 (= e!125811 (bvsle lt!278039 (bvmul lt!278037 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!181141 (or (= lt!278037 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!278037 #b0000000000000000000000000000000000000000000000000000000000001000) lt!278037)))))

(assert (=> b!181141 (= lt!278037 ((_ sign_extend 32) (size!4275 (buf!4721 (_2!8449 lt!277805)))))))

(assert (= (and d!63063 res!150442) b!181140))

(assert (= (and b!181140 res!150443) b!181141))

(declare-fun m!281971 () Bool)

(assert (=> d!63063 m!281971))

(assert (=> d!63063 m!281793))

(assert (=> b!181040 d!63063))

(declare-fun d!63075 () Bool)

(declare-fun res!150456 () Bool)

(declare-fun e!125819 () Bool)

(assert (=> d!63075 (=> (not res!150456) (not e!125819))))

(assert (=> d!63075 (= res!150456 (= (size!4275 (buf!4721 thiss!1204)) (size!4275 (buf!4721 (_2!8449 lt!277805)))))))

(assert (=> d!63075 (= (isPrefixOf!0 thiss!1204 (_2!8449 lt!277805)) e!125819)))

(declare-fun b!181153 () Bool)

(declare-fun res!150455 () Bool)

(assert (=> b!181153 (=> (not res!150455) (not e!125819))))

(assert (=> b!181153 (= res!150455 (bvsle (bitIndex!0 (size!4275 (buf!4721 thiss!1204)) (currentByte!8937 thiss!1204) (currentBit!8932 thiss!1204)) (bitIndex!0 (size!4275 (buf!4721 (_2!8449 lt!277805))) (currentByte!8937 (_2!8449 lt!277805)) (currentBit!8932 (_2!8449 lt!277805)))))))

(declare-fun b!181154 () Bool)

(declare-fun e!125820 () Bool)

(assert (=> b!181154 (= e!125819 e!125820)))

(declare-fun res!150457 () Bool)

(assert (=> b!181154 (=> res!150457 e!125820)))

(assert (=> b!181154 (= res!150457 (= (size!4275 (buf!4721 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!181155 () Bool)

(declare-fun arrayBitRangesEq!0 (array!9693 array!9693 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!181155 (= e!125820 (arrayBitRangesEq!0 (buf!4721 thiss!1204) (buf!4721 (_2!8449 lt!277805)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4275 (buf!4721 thiss!1204)) (currentByte!8937 thiss!1204) (currentBit!8932 thiss!1204))))))

(assert (= (and d!63075 res!150456) b!181153))

(assert (= (and b!181153 res!150455) b!181154))

(assert (= (and b!181154 (not res!150457)) b!181155))

(assert (=> b!181153 m!281821))

(assert (=> b!181153 m!281827))

(assert (=> b!181155 m!281821))

(assert (=> b!181155 m!281821))

(declare-fun m!281995 () Bool)

(assert (=> b!181155 m!281995))

(assert (=> b!181040 d!63075))

(declare-fun d!63090 () Bool)

(assert (=> d!63090 (isPrefixOf!0 thiss!1204 (_2!8449 lt!277805))))

(declare-fun lt!278062 () Unit!13008)

(declare-fun choose!30 (BitStream!7658 BitStream!7658 BitStream!7658) Unit!13008)

(assert (=> d!63090 (= lt!278062 (choose!30 thiss!1204 (_2!8449 lt!277802) (_2!8449 lt!277805)))))

(assert (=> d!63090 (isPrefixOf!0 thiss!1204 (_2!8449 lt!277802))))

(assert (=> d!63090 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8449 lt!277802) (_2!8449 lt!277805)) lt!278062)))

(declare-fun bs!15714 () Bool)

(assert (= bs!15714 d!63090))

(assert (=> bs!15714 m!281829))

(declare-fun m!281999 () Bool)

(assert (=> bs!15714 m!281999))

(assert (=> bs!15714 m!281787))

(assert (=> b!181040 d!63090))

(declare-fun b!181318 () Bool)

(declare-fun lt!278581 () tuple2!15610)

(declare-fun lt!278584 () tuple2!15608)

(assert (=> b!181318 (= lt!278581 (readBitPure!0 (readerFrom!0 (_2!8449 lt!278584) (currentBit!8932 (_2!8449 lt!277802)) (currentByte!8937 (_2!8449 lt!277802)))))))

(declare-fun lt!278589 () Bool)

(declare-fun res!150590 () Bool)

(assert (=> b!181318 (= res!150590 (and (= (_2!8450 lt!278581) lt!278589) (= (_1!8450 lt!278581) (_2!8449 lt!278584))))))

(declare-fun e!125918 () Bool)

(assert (=> b!181318 (=> (not res!150590) (not e!125918))))

(declare-fun e!125917 () Bool)

(assert (=> b!181318 (= e!125917 e!125918)))

(declare-fun b!181319 () Bool)

(declare-fun e!125911 () (_ BitVec 64))

(assert (=> b!181319 (= e!125911 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!181320 () Bool)

(assert (=> b!181320 (= e!125911 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!181321 () Bool)

(declare-fun res!150594 () Bool)

(assert (=> b!181321 (= res!150594 (= (bitIndex!0 (size!4275 (buf!4721 (_2!8449 lt!278584))) (currentByte!8937 (_2!8449 lt!278584)) (currentBit!8932 (_2!8449 lt!278584))) (bvadd (bitIndex!0 (size!4275 (buf!4721 (_2!8449 lt!277802))) (currentByte!8937 (_2!8449 lt!277802)) (currentBit!8932 (_2!8449 lt!277802))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!181321 (=> (not res!150594) (not e!125917))))

(declare-fun b!181322 () Bool)

(assert (=> b!181322 (= e!125918 (= (bitIndex!0 (size!4275 (buf!4721 (_1!8450 lt!278581))) (currentByte!8937 (_1!8450 lt!278581)) (currentBit!8932 (_1!8450 lt!278581))) (bitIndex!0 (size!4275 (buf!4721 (_2!8449 lt!278584))) (currentByte!8937 (_2!8449 lt!278584)) (currentBit!8932 (_2!8449 lt!278584)))))))

(declare-fun b!181323 () Bool)

(declare-fun res!150595 () Bool)

(declare-fun e!125914 () Bool)

(assert (=> b!181323 (=> (not res!150595) (not e!125914))))

(declare-fun lt!278579 () tuple2!15608)

(assert (=> b!181323 (= res!150595 (isPrefixOf!0 (_2!8449 lt!277802) (_2!8449 lt!278579)))))

(declare-fun b!181324 () Bool)

(declare-fun res!150588 () Bool)

(assert (=> b!181324 (= res!150588 (isPrefixOf!0 (_2!8449 lt!277802) (_2!8449 lt!278584)))))

(assert (=> b!181324 (=> (not res!150588) (not e!125917))))

(declare-fun call!2953 () Bool)

(declare-fun c!9359 () Bool)

(declare-fun bm!2950 () Bool)

(declare-fun lt!278561 () tuple2!15608)

(assert (=> bm!2950 (= call!2953 (isPrefixOf!0 (_2!8449 lt!277802) (ite c!9359 (_2!8449 lt!277802) (_2!8449 lt!278561))))))

(declare-fun b!181325 () Bool)

(declare-fun e!125915 () Bool)

(declare-datatypes ((tuple2!15620 0))(
  ( (tuple2!15621 (_1!8455 BitStream!7658) (_2!8455 (_ BitVec 64))) )
))
(declare-fun lt!278565 () tuple2!15620)

(declare-fun lt!278599 () tuple2!15612)

(assert (=> b!181325 (= e!125915 (= (_1!8455 lt!278565) (_2!8451 lt!278599)))))

(declare-fun b!181326 () Bool)

(declare-fun e!125912 () tuple2!15608)

(assert (=> b!181326 (= e!125912 (tuple2!15609 (_1!8449 lt!278561) (_2!8449 lt!278561)))))

(assert (=> b!181326 (= lt!278589 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!181326 (= lt!278584 (appendBit!0 (_2!8449 lt!277802) lt!278589))))

(declare-fun res!150585 () Bool)

(assert (=> b!181326 (= res!150585 (= (size!4275 (buf!4721 (_2!8449 lt!277802))) (size!4275 (buf!4721 (_2!8449 lt!278584)))))))

(assert (=> b!181326 (=> (not res!150585) (not e!125917))))

(assert (=> b!181326 e!125917))

(declare-fun lt!278562 () tuple2!15608)

(assert (=> b!181326 (= lt!278562 lt!278584)))

(assert (=> b!181326 (= lt!278561 (appendBitsLSBFirstLoopTR!0 (_2!8449 lt!278562) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!278580 () Unit!13008)

(assert (=> b!181326 (= lt!278580 (lemmaIsPrefixTransitive!0 (_2!8449 lt!277802) (_2!8449 lt!278562) (_2!8449 lt!278561)))))

(assert (=> b!181326 call!2953))

(declare-fun lt!278596 () Unit!13008)

(assert (=> b!181326 (= lt!278596 lt!278580)))

(assert (=> b!181326 (invariant!0 (currentBit!8932 (_2!8449 lt!277802)) (currentByte!8937 (_2!8449 lt!277802)) (size!4275 (buf!4721 (_2!8449 lt!278562))))))

(declare-fun lt!278592 () BitStream!7658)

(assert (=> b!181326 (= lt!278592 (BitStream!7659 (buf!4721 (_2!8449 lt!278562)) (currentByte!8937 (_2!8449 lt!277802)) (currentBit!8932 (_2!8449 lt!277802))))))

(assert (=> b!181326 (invariant!0 (currentBit!8932 lt!278592) (currentByte!8937 lt!278592) (size!4275 (buf!4721 (_2!8449 lt!278561))))))

(declare-fun lt!278560 () BitStream!7658)

(assert (=> b!181326 (= lt!278560 (BitStream!7659 (buf!4721 (_2!8449 lt!278561)) (currentByte!8937 lt!278592) (currentBit!8932 lt!278592)))))

(declare-fun lt!278571 () tuple2!15610)

(assert (=> b!181326 (= lt!278571 (readBitPure!0 lt!278592))))

(declare-fun lt!278588 () tuple2!15610)

(assert (=> b!181326 (= lt!278588 (readBitPure!0 lt!278560))))

(declare-fun lt!278569 () Unit!13008)

(assert (=> b!181326 (= lt!278569 (readBitPrefixLemma!0 lt!278592 (_2!8449 lt!278561)))))

(declare-fun res!150584 () Bool)

(assert (=> b!181326 (= res!150584 (= (bitIndex!0 (size!4275 (buf!4721 (_1!8450 lt!278571))) (currentByte!8937 (_1!8450 lt!278571)) (currentBit!8932 (_1!8450 lt!278571))) (bitIndex!0 (size!4275 (buf!4721 (_1!8450 lt!278588))) (currentByte!8937 (_1!8450 lt!278588)) (currentBit!8932 (_1!8450 lt!278588)))))))

(declare-fun e!125916 () Bool)

(assert (=> b!181326 (=> (not res!150584) (not e!125916))))

(assert (=> b!181326 e!125916))

(declare-fun lt!278578 () Unit!13008)

(assert (=> b!181326 (= lt!278578 lt!278569)))

(declare-fun lt!278585 () tuple2!15612)

(assert (=> b!181326 (= lt!278585 (reader!0 (_2!8449 lt!277802) (_2!8449 lt!278561)))))

(declare-fun lt!278582 () tuple2!15612)

(assert (=> b!181326 (= lt!278582 (reader!0 (_2!8449 lt!278562) (_2!8449 lt!278561)))))

(declare-fun lt!278574 () tuple2!15610)

(assert (=> b!181326 (= lt!278574 (readBitPure!0 (_1!8451 lt!278585)))))

(assert (=> b!181326 (= (_2!8450 lt!278574) lt!278589)))

(declare-fun lt!278594 () Unit!13008)

(declare-fun Unit!13025 () Unit!13008)

(assert (=> b!181326 (= lt!278594 Unit!13025)))

(declare-fun lt!278612 () (_ BitVec 64))

(assert (=> b!181326 (= lt!278612 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!278608 () (_ BitVec 64))

(assert (=> b!181326 (= lt!278608 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!278566 () Unit!13008)

(assert (=> b!181326 (= lt!278566 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8449 lt!277802) (buf!4721 (_2!8449 lt!278561)) lt!278608))))

(assert (=> b!181326 (validate_offset_bits!1 ((_ sign_extend 32) (size!4275 (buf!4721 (_2!8449 lt!278561)))) ((_ sign_extend 32) (currentByte!8937 (_2!8449 lt!277802))) ((_ sign_extend 32) (currentBit!8932 (_2!8449 lt!277802))) lt!278608)))

(declare-fun lt!278598 () Unit!13008)

(assert (=> b!181326 (= lt!278598 lt!278566)))

(declare-fun lt!278611 () tuple2!15620)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7658 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!15620)

(assert (=> b!181326 (= lt!278611 (readNBitsLSBFirstsLoopPure!0 (_1!8451 lt!278585) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!278612))))

(declare-fun lt!278605 () (_ BitVec 64))

(assert (=> b!181326 (= lt!278605 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!278568 () Unit!13008)

(assert (=> b!181326 (= lt!278568 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8449 lt!278562) (buf!4721 (_2!8449 lt!278561)) lt!278605))))

(assert (=> b!181326 (validate_offset_bits!1 ((_ sign_extend 32) (size!4275 (buf!4721 (_2!8449 lt!278561)))) ((_ sign_extend 32) (currentByte!8937 (_2!8449 lt!278562))) ((_ sign_extend 32) (currentBit!8932 (_2!8449 lt!278562))) lt!278605)))

(declare-fun lt!278591 () Unit!13008)

(assert (=> b!181326 (= lt!278591 lt!278568)))

(declare-fun lt!278590 () tuple2!15620)

(assert (=> b!181326 (= lt!278590 (readNBitsLSBFirstsLoopPure!0 (_1!8451 lt!278582) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!278612 (ite (_2!8450 lt!278574) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!278577 () tuple2!15620)

(assert (=> b!181326 (= lt!278577 (readNBitsLSBFirstsLoopPure!0 (_1!8451 lt!278585) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!278612))))

(declare-fun c!9360 () Bool)

(assert (=> b!181326 (= c!9360 (_2!8450 (readBitPure!0 (_1!8451 lt!278585))))))

(declare-fun lt!278570 () tuple2!15620)

(declare-fun withMovedBitIndex!0 (BitStream!7658 (_ BitVec 64)) BitStream!7658)

(assert (=> b!181326 (= lt!278570 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8451 lt!278585) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!278612 e!125911)))))

(declare-fun lt!278607 () Unit!13008)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7658 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13008)

(assert (=> b!181326 (= lt!278607 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8451 lt!278585) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!278612))))

(assert (=> b!181326 (and (= (_2!8455 lt!278577) (_2!8455 lt!278570)) (= (_1!8455 lt!278577) (_1!8455 lt!278570)))))

(declare-fun lt!278564 () Unit!13008)

(assert (=> b!181326 (= lt!278564 lt!278607)))

(assert (=> b!181326 (= (_1!8451 lt!278585) (withMovedBitIndex!0 (_2!8451 lt!278585) (bvsub (bitIndex!0 (size!4275 (buf!4721 (_2!8449 lt!277802))) (currentByte!8937 (_2!8449 lt!277802)) (currentBit!8932 (_2!8449 lt!277802))) (bitIndex!0 (size!4275 (buf!4721 (_2!8449 lt!278561))) (currentByte!8937 (_2!8449 lt!278561)) (currentBit!8932 (_2!8449 lt!278561))))))))

(declare-fun lt!278614 () Unit!13008)

(declare-fun Unit!13029 () Unit!13008)

(assert (=> b!181326 (= lt!278614 Unit!13029)))

(assert (=> b!181326 (= (_1!8451 lt!278582) (withMovedBitIndex!0 (_2!8451 lt!278582) (bvsub (bitIndex!0 (size!4275 (buf!4721 (_2!8449 lt!278562))) (currentByte!8937 (_2!8449 lt!278562)) (currentBit!8932 (_2!8449 lt!278562))) (bitIndex!0 (size!4275 (buf!4721 (_2!8449 lt!278561))) (currentByte!8937 (_2!8449 lt!278561)) (currentBit!8932 (_2!8449 lt!278561))))))))

(declare-fun lt!278595 () Unit!13008)

(declare-fun Unit!13033 () Unit!13008)

(assert (=> b!181326 (= lt!278595 Unit!13033)))

(assert (=> b!181326 (= (bitIndex!0 (size!4275 (buf!4721 (_2!8449 lt!277802))) (currentByte!8937 (_2!8449 lt!277802)) (currentBit!8932 (_2!8449 lt!277802))) (bvsub (bitIndex!0 (size!4275 (buf!4721 (_2!8449 lt!278562))) (currentByte!8937 (_2!8449 lt!278562)) (currentBit!8932 (_2!8449 lt!278562))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!278593 () Unit!13008)

(declare-fun Unit!13036 () Unit!13008)

(assert (=> b!181326 (= lt!278593 Unit!13036)))

(assert (=> b!181326 (= (_2!8455 lt!278611) (_2!8455 lt!278590))))

(declare-fun lt!278606 () Unit!13008)

(declare-fun Unit!13038 () Unit!13008)

(assert (=> b!181326 (= lt!278606 Unit!13038)))

(assert (=> b!181326 (invariant!0 (currentBit!8932 (_2!8449 lt!278561)) (currentByte!8937 (_2!8449 lt!278561)) (size!4275 (buf!4721 (_2!8449 lt!278561))))))

(declare-fun lt!278573 () Unit!13008)

(declare-fun Unit!13039 () Unit!13008)

(assert (=> b!181326 (= lt!278573 Unit!13039)))

(assert (=> b!181326 (= (size!4275 (buf!4721 (_2!8449 lt!277802))) (size!4275 (buf!4721 (_2!8449 lt!278561))))))

(declare-fun lt!278575 () Unit!13008)

(declare-fun Unit!13040 () Unit!13008)

(assert (=> b!181326 (= lt!278575 Unit!13040)))

(assert (=> b!181326 (= (bitIndex!0 (size!4275 (buf!4721 (_2!8449 lt!278561))) (currentByte!8937 (_2!8449 lt!278561)) (currentBit!8932 (_2!8449 lt!278561))) (bvsub (bvadd (bitIndex!0 (size!4275 (buf!4721 (_2!8449 lt!277802))) (currentByte!8937 (_2!8449 lt!277802)) (currentBit!8932 (_2!8449 lt!277802))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!278613 () Unit!13008)

(declare-fun Unit!13042 () Unit!13008)

(assert (=> b!181326 (= lt!278613 Unit!13042)))

(declare-fun lt!278597 () Unit!13008)

(declare-fun Unit!13043 () Unit!13008)

(assert (=> b!181326 (= lt!278597 Unit!13043)))

(assert (=> b!181326 (= lt!278599 (reader!0 (_2!8449 lt!277802) (_2!8449 lt!278561)))))

(declare-fun lt!278603 () (_ BitVec 64))

(assert (=> b!181326 (= lt!278603 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!278601 () Unit!13008)

(assert (=> b!181326 (= lt!278601 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8449 lt!277802) (buf!4721 (_2!8449 lt!278561)) lt!278603))))

(assert (=> b!181326 (validate_offset_bits!1 ((_ sign_extend 32) (size!4275 (buf!4721 (_2!8449 lt!278561)))) ((_ sign_extend 32) (currentByte!8937 (_2!8449 lt!277802))) ((_ sign_extend 32) (currentBit!8932 (_2!8449 lt!277802))) lt!278603)))

(declare-fun lt!278609 () Unit!13008)

(assert (=> b!181326 (= lt!278609 lt!278601)))

(assert (=> b!181326 (= lt!278565 (readNBitsLSBFirstsLoopPure!0 (_1!8451 lt!278599) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!150589 () Bool)

(assert (=> b!181326 (= res!150589 (= (_2!8455 lt!278565) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!181326 (=> (not res!150589) (not e!125915))))

(assert (=> b!181326 e!125915))

(declare-fun lt!278567 () Unit!13008)

(declare-fun Unit!13044 () Unit!13008)

(assert (=> b!181326 (= lt!278567 Unit!13044)))

(declare-fun b!181328 () Bool)

(declare-fun e!125913 () Bool)

(declare-fun lt!278576 () (_ BitVec 64))

(assert (=> b!181328 (= e!125913 (validate_offset_bits!1 ((_ sign_extend 32) (size!4275 (buf!4721 (_2!8449 lt!277802)))) ((_ sign_extend 32) (currentByte!8937 (_2!8449 lt!277802))) ((_ sign_extend 32) (currentBit!8932 (_2!8449 lt!277802))) lt!278576))))

(declare-fun b!181329 () Bool)

(declare-fun e!125910 () Bool)

(assert (=> b!181329 (= e!125914 e!125910)))

(declare-fun res!150587 () Bool)

(assert (=> b!181329 (=> (not res!150587) (not e!125910))))

(declare-fun lt!278586 () tuple2!15620)

(assert (=> b!181329 (= res!150587 (= (_2!8455 lt!278586) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun lt!278587 () tuple2!15612)

(assert (=> b!181329 (= lt!278586 (readNBitsLSBFirstsLoopPure!0 (_1!8451 lt!278587) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!278602 () Unit!13008)

(declare-fun lt!278583 () Unit!13008)

(assert (=> b!181329 (= lt!278602 lt!278583)))

(assert (=> b!181329 (validate_offset_bits!1 ((_ sign_extend 32) (size!4275 (buf!4721 (_2!8449 lt!278579)))) ((_ sign_extend 32) (currentByte!8937 (_2!8449 lt!277802))) ((_ sign_extend 32) (currentBit!8932 (_2!8449 lt!277802))) lt!278576)))

(assert (=> b!181329 (= lt!278583 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8449 lt!277802) (buf!4721 (_2!8449 lt!278579)) lt!278576))))

(assert (=> b!181329 e!125913))

(declare-fun res!150593 () Bool)

(assert (=> b!181329 (=> (not res!150593) (not e!125913))))

(assert (=> b!181329 (= res!150593 (and (= (size!4275 (buf!4721 (_2!8449 lt!277802))) (size!4275 (buf!4721 (_2!8449 lt!278579)))) (bvsge lt!278576 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!181329 (= lt!278576 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!181329 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!181329 (= lt!278587 (reader!0 (_2!8449 lt!277802) (_2!8449 lt!278579)))))

(declare-fun b!181330 () Bool)

(declare-fun Unit!13046 () Unit!13008)

(assert (=> b!181330 (= e!125912 (tuple2!15609 Unit!13046 (_2!8449 lt!277802)))))

(declare-fun lt!278604 () Unit!13008)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7658) Unit!13008)

(assert (=> b!181330 (= lt!278604 (lemmaIsPrefixRefl!0 (_2!8449 lt!277802)))))

(assert (=> b!181330 call!2953))

(declare-fun lt!278559 () Unit!13008)

(assert (=> b!181330 (= lt!278559 lt!278604)))

(declare-fun b!181331 () Bool)

(assert (=> b!181331 (= e!125910 (= (_1!8455 lt!278586) (_2!8451 lt!278587)))))

(declare-fun b!181332 () Bool)

(assert (=> b!181332 (= e!125916 (= (_2!8450 lt!278571) (_2!8450 lt!278588)))))

(declare-fun b!181333 () Bool)

(declare-fun res!150586 () Bool)

(assert (=> b!181333 (=> (not res!150586) (not e!125914))))

(assert (=> b!181333 (= res!150586 (= (size!4275 (buf!4721 (_2!8449 lt!277802))) (size!4275 (buf!4721 (_2!8449 lt!278579)))))))

(declare-fun b!181327 () Bool)

(declare-fun res!150592 () Bool)

(assert (=> b!181327 (=> (not res!150592) (not e!125914))))

(declare-fun lt!278563 () (_ BitVec 64))

(declare-fun lt!278600 () (_ BitVec 64))

(assert (=> b!181327 (= res!150592 (= (bitIndex!0 (size!4275 (buf!4721 (_2!8449 lt!278579))) (currentByte!8937 (_2!8449 lt!278579)) (currentBit!8932 (_2!8449 lt!278579))) (bvsub lt!278563 lt!278600)))))

(assert (=> b!181327 (or (= (bvand lt!278563 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!278600 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!278563 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!278563 lt!278600) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!181327 (= lt!278600 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!278572 () (_ BitVec 64))

(declare-fun lt!278610 () (_ BitVec 64))

(assert (=> b!181327 (= lt!278563 (bvadd lt!278572 lt!278610))))

(assert (=> b!181327 (or (not (= (bvand lt!278572 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!278610 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!278572 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!278572 lt!278610) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!181327 (= lt!278610 ((_ sign_extend 32) nBits!348))))

(assert (=> b!181327 (= lt!278572 (bitIndex!0 (size!4275 (buf!4721 (_2!8449 lt!277802))) (currentByte!8937 (_2!8449 lt!277802)) (currentBit!8932 (_2!8449 lt!277802))))))

(declare-fun d!63093 () Bool)

(assert (=> d!63093 e!125914))

(declare-fun res!150591 () Bool)

(assert (=> d!63093 (=> (not res!150591) (not e!125914))))

(assert (=> d!63093 (= res!150591 (invariant!0 (currentBit!8932 (_2!8449 lt!278579)) (currentByte!8937 (_2!8449 lt!278579)) (size!4275 (buf!4721 (_2!8449 lt!278579)))))))

(assert (=> d!63093 (= lt!278579 e!125912)))

(assert (=> d!63093 (= c!9359 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!63093 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!63093 (= (appendBitsLSBFirstLoopTR!0 (_2!8449 lt!277802) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!278579)))

(assert (= (and d!63093 c!9359) b!181330))

(assert (= (and d!63093 (not c!9359)) b!181326))

(assert (= (and b!181326 res!150585) b!181321))

(assert (= (and b!181321 res!150594) b!181324))

(assert (= (and b!181324 res!150588) b!181318))

(assert (= (and b!181318 res!150590) b!181322))

(assert (= (and b!181326 res!150584) b!181332))

(assert (= (and b!181326 c!9360) b!181320))

(assert (= (and b!181326 (not c!9360)) b!181319))

(assert (= (and b!181326 res!150589) b!181325))

(assert (= (or b!181330 b!181326) bm!2950))

(assert (= (and d!63093 res!150591) b!181333))

(assert (= (and b!181333 res!150586) b!181327))

(assert (= (and b!181327 res!150592) b!181323))

(assert (= (and b!181323 res!150595) b!181329))

(assert (= (and b!181329 res!150593) b!181328))

(assert (= (and b!181329 res!150587) b!181331))

(declare-fun m!282181 () Bool)

(assert (=> b!181330 m!282181))

(declare-fun m!282183 () Bool)

(assert (=> b!181328 m!282183))

(declare-fun m!282185 () Bool)

(assert (=> b!181323 m!282185))

(declare-fun m!282187 () Bool)

(assert (=> b!181318 m!282187))

(assert (=> b!181318 m!282187))

(declare-fun m!282189 () Bool)

(assert (=> b!181318 m!282189))

(declare-fun m!282191 () Bool)

(assert (=> b!181321 m!282191))

(assert (=> b!181321 m!281819))

(declare-fun m!282193 () Bool)

(assert (=> b!181322 m!282193))

(assert (=> b!181322 m!282191))

(declare-fun m!282195 () Bool)

(assert (=> b!181324 m!282195))

(declare-fun m!282197 () Bool)

(assert (=> d!63093 m!282197))

(declare-fun m!282199 () Bool)

(assert (=> bm!2950 m!282199))

(declare-fun m!282201 () Bool)

(assert (=> b!181326 m!282201))

(declare-fun m!282203 () Bool)

(assert (=> b!181326 m!282203))

(declare-fun m!282205 () Bool)

(assert (=> b!181326 m!282205))

(declare-fun m!282207 () Bool)

(assert (=> b!181326 m!282207))

(assert (=> b!181326 m!281819))

(declare-fun m!282209 () Bool)

(assert (=> b!181326 m!282209))

(declare-fun m!282211 () Bool)

(assert (=> b!181326 m!282211))

(declare-fun m!282213 () Bool)

(assert (=> b!181326 m!282213))

(declare-fun m!282215 () Bool)

(assert (=> b!181326 m!282215))

(declare-fun m!282217 () Bool)

(assert (=> b!181326 m!282217))

(declare-fun m!282219 () Bool)

(assert (=> b!181326 m!282219))

(declare-fun m!282221 () Bool)

(assert (=> b!181326 m!282221))

(declare-fun m!282223 () Bool)

(assert (=> b!181326 m!282223))

(declare-fun m!282225 () Bool)

(assert (=> b!181326 m!282225))

(declare-fun m!282227 () Bool)

(assert (=> b!181326 m!282227))

(declare-fun m!282229 () Bool)

(assert (=> b!181326 m!282229))

(declare-fun m!282231 () Bool)

(assert (=> b!181326 m!282231))

(declare-fun m!282233 () Bool)

(assert (=> b!181326 m!282233))

(declare-fun m!282235 () Bool)

(assert (=> b!181326 m!282235))

(declare-fun m!282237 () Bool)

(assert (=> b!181326 m!282237))

(declare-fun m!282239 () Bool)

(assert (=> b!181326 m!282239))

(declare-fun m!282241 () Bool)

(assert (=> b!181326 m!282241))

(declare-fun m!282243 () Bool)

(assert (=> b!181326 m!282243))

(declare-fun m!282245 () Bool)

(assert (=> b!181326 m!282245))

(declare-fun m!282247 () Bool)

(assert (=> b!181326 m!282247))

(declare-fun m!282249 () Bool)

(assert (=> b!181326 m!282249))

(declare-fun m!282251 () Bool)

(assert (=> b!181326 m!282251))

(declare-fun m!282253 () Bool)

(assert (=> b!181326 m!282253))

(declare-fun m!282255 () Bool)

(assert (=> b!181326 m!282255))

(declare-fun m!282257 () Bool)

(assert (=> b!181326 m!282257))

(declare-fun m!282259 () Bool)

(assert (=> b!181326 m!282259))

(assert (=> b!181326 m!282219))

(declare-fun m!282261 () Bool)

(assert (=> b!181326 m!282261))

(declare-fun m!282263 () Bool)

(assert (=> b!181326 m!282263))

(assert (=> b!181329 m!282213))

(declare-fun m!282265 () Bool)

(assert (=> b!181329 m!282265))

(assert (=> b!181329 m!282245))

(declare-fun m!282267 () Bool)

(assert (=> b!181329 m!282267))

(declare-fun m!282269 () Bool)

(assert (=> b!181329 m!282269))

(declare-fun m!282271 () Bool)

(assert (=> b!181329 m!282271))

(declare-fun m!282273 () Bool)

(assert (=> b!181327 m!282273))

(assert (=> b!181327 m!281819))

(assert (=> b!181040 d!63093))

(declare-fun d!63139 () Bool)

(assert (=> d!63139 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!181049 d!63139))

(declare-fun d!63141 () Bool)

(assert (=> d!63141 (= (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!590)) (ite (= (bvsub #b00000000000000000000000001000000 i!590) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000 (bvshl #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub #b00000000000000000000000001000000 i!590))))))))

(assert (=> b!181049 d!63141))

(declare-fun d!63143 () Bool)

(declare-fun e!125919 () Bool)

(assert (=> d!63143 e!125919))

(declare-fun res!150596 () Bool)

(assert (=> d!63143 (=> (not res!150596) (not e!125919))))

(declare-fun lt!278619 () (_ BitVec 64))

(declare-fun lt!278615 () (_ BitVec 64))

(declare-fun lt!278618 () (_ BitVec 64))

(assert (=> d!63143 (= res!150596 (= lt!278619 (bvsub lt!278618 lt!278615)))))

(assert (=> d!63143 (or (= (bvand lt!278618 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!278615 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!278618 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!278618 lt!278615) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63143 (= lt!278615 (remainingBits!0 ((_ sign_extend 32) (size!4275 (buf!4721 (_2!8449 lt!277802)))) ((_ sign_extend 32) (currentByte!8937 (_2!8449 lt!277802))) ((_ sign_extend 32) (currentBit!8932 (_2!8449 lt!277802)))))))

(declare-fun lt!278620 () (_ BitVec 64))

(declare-fun lt!278616 () (_ BitVec 64))

(assert (=> d!63143 (= lt!278618 (bvmul lt!278620 lt!278616))))

(assert (=> d!63143 (or (= lt!278620 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!278616 (bvsdiv (bvmul lt!278620 lt!278616) lt!278620)))))

(assert (=> d!63143 (= lt!278616 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63143 (= lt!278620 ((_ sign_extend 32) (size!4275 (buf!4721 (_2!8449 lt!277802)))))))

(assert (=> d!63143 (= lt!278619 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8937 (_2!8449 lt!277802))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8932 (_2!8449 lt!277802)))))))

(assert (=> d!63143 (invariant!0 (currentBit!8932 (_2!8449 lt!277802)) (currentByte!8937 (_2!8449 lt!277802)) (size!4275 (buf!4721 (_2!8449 lt!277802))))))

(assert (=> d!63143 (= (bitIndex!0 (size!4275 (buf!4721 (_2!8449 lt!277802))) (currentByte!8937 (_2!8449 lt!277802)) (currentBit!8932 (_2!8449 lt!277802))) lt!278619)))

(declare-fun b!181334 () Bool)

(declare-fun res!150597 () Bool)

(assert (=> b!181334 (=> (not res!150597) (not e!125919))))

(assert (=> b!181334 (= res!150597 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!278619))))

(declare-fun b!181335 () Bool)

(declare-fun lt!278617 () (_ BitVec 64))

(assert (=> b!181335 (= e!125919 (bvsle lt!278619 (bvmul lt!278617 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!181335 (or (= lt!278617 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!278617 #b0000000000000000000000000000000000000000000000000000000000001000) lt!278617)))))

(assert (=> b!181335 (= lt!278617 ((_ sign_extend 32) (size!4275 (buf!4721 (_2!8449 lt!277802)))))))

(assert (= (and d!63143 res!150596) b!181334))

(assert (= (and b!181334 res!150597) b!181335))

(declare-fun m!282275 () Bool)

(assert (=> d!63143 m!282275))

(declare-fun m!282277 () Bool)

(assert (=> d!63143 m!282277))

(assert (=> b!181047 d!63143))

(declare-fun d!63145 () Bool)

(declare-fun e!125920 () Bool)

(assert (=> d!63145 e!125920))

(declare-fun res!150598 () Bool)

(assert (=> d!63145 (=> (not res!150598) (not e!125920))))

(declare-fun lt!278621 () (_ BitVec 64))

(declare-fun lt!278624 () (_ BitVec 64))

(declare-fun lt!278625 () (_ BitVec 64))

(assert (=> d!63145 (= res!150598 (= lt!278625 (bvsub lt!278624 lt!278621)))))

(assert (=> d!63145 (or (= (bvand lt!278624 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!278621 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!278624 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!278624 lt!278621) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63145 (= lt!278621 (remainingBits!0 ((_ sign_extend 32) (size!4275 (buf!4721 thiss!1204))) ((_ sign_extend 32) (currentByte!8937 thiss!1204)) ((_ sign_extend 32) (currentBit!8932 thiss!1204))))))

(declare-fun lt!278626 () (_ BitVec 64))

(declare-fun lt!278622 () (_ BitVec 64))

(assert (=> d!63145 (= lt!278624 (bvmul lt!278626 lt!278622))))

(assert (=> d!63145 (or (= lt!278626 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!278622 (bvsdiv (bvmul lt!278626 lt!278622) lt!278626)))))

(assert (=> d!63145 (= lt!278622 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63145 (= lt!278626 ((_ sign_extend 32) (size!4275 (buf!4721 thiss!1204))))))

(assert (=> d!63145 (= lt!278625 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8937 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8932 thiss!1204))))))

(assert (=> d!63145 (invariant!0 (currentBit!8932 thiss!1204) (currentByte!8937 thiss!1204) (size!4275 (buf!4721 thiss!1204)))))

(assert (=> d!63145 (= (bitIndex!0 (size!4275 (buf!4721 thiss!1204)) (currentByte!8937 thiss!1204) (currentBit!8932 thiss!1204)) lt!278625)))

(declare-fun b!181336 () Bool)

(declare-fun res!150599 () Bool)

(assert (=> b!181336 (=> (not res!150599) (not e!125920))))

(assert (=> b!181336 (= res!150599 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!278625))))

(declare-fun b!181337 () Bool)

(declare-fun lt!278623 () (_ BitVec 64))

(assert (=> b!181337 (= e!125920 (bvsle lt!278625 (bvmul lt!278623 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!181337 (or (= lt!278623 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!278623 #b0000000000000000000000000000000000000000000000000000000000001000) lt!278623)))))

(assert (=> b!181337 (= lt!278623 ((_ sign_extend 32) (size!4275 (buf!4721 thiss!1204))))))

(assert (= (and d!63145 res!150598) b!181336))

(assert (= (and b!181336 res!150599) b!181337))

(declare-fun m!282279 () Bool)

(assert (=> d!63145 m!282279))

(assert (=> d!63145 m!281825))

(assert (=> b!181047 d!63145))

(declare-fun b!181365 () Bool)

(declare-fun e!125934 () Bool)

(declare-fun e!125935 () Bool)

(assert (=> b!181365 (= e!125934 e!125935)))

(declare-fun res!150622 () Bool)

(assert (=> b!181365 (=> (not res!150622) (not e!125935))))

(declare-fun lt!278691 () tuple2!15610)

(declare-fun lt!278693 () tuple2!15608)

(assert (=> b!181365 (= res!150622 (and (= (_2!8450 lt!278691) lt!277801) (= (_1!8450 lt!278691) (_2!8449 lt!278693))))))

(assert (=> b!181365 (= lt!278691 (readBitPure!0 (readerFrom!0 (_2!8449 lt!278693) (currentBit!8932 thiss!1204) (currentByte!8937 thiss!1204))))))

(declare-fun b!181363 () Bool)

(declare-fun res!150623 () Bool)

(assert (=> b!181363 (=> (not res!150623) (not e!125934))))

(declare-fun lt!278694 () (_ BitVec 64))

(declare-fun lt!278692 () (_ BitVec 64))

(assert (=> b!181363 (= res!150623 (= (bitIndex!0 (size!4275 (buf!4721 (_2!8449 lt!278693))) (currentByte!8937 (_2!8449 lt!278693)) (currentBit!8932 (_2!8449 lt!278693))) (bvadd lt!278694 lt!278692)))))

(assert (=> b!181363 (or (not (= (bvand lt!278694 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!278692 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!278694 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!278694 lt!278692) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!181363 (= lt!278692 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!181363 (= lt!278694 (bitIndex!0 (size!4275 (buf!4721 thiss!1204)) (currentByte!8937 thiss!1204) (currentBit!8932 thiss!1204)))))

(declare-fun b!181366 () Bool)

(assert (=> b!181366 (= e!125935 (= (bitIndex!0 (size!4275 (buf!4721 (_1!8450 lt!278691))) (currentByte!8937 (_1!8450 lt!278691)) (currentBit!8932 (_1!8450 lt!278691))) (bitIndex!0 (size!4275 (buf!4721 (_2!8449 lt!278693))) (currentByte!8937 (_2!8449 lt!278693)) (currentBit!8932 (_2!8449 lt!278693)))))))

(declare-fun b!181364 () Bool)

(declare-fun res!150620 () Bool)

(assert (=> b!181364 (=> (not res!150620) (not e!125934))))

(assert (=> b!181364 (= res!150620 (isPrefixOf!0 thiss!1204 (_2!8449 lt!278693)))))

(declare-fun d!63147 () Bool)

(assert (=> d!63147 e!125934))

(declare-fun res!150621 () Bool)

(assert (=> d!63147 (=> (not res!150621) (not e!125934))))

(assert (=> d!63147 (= res!150621 (= (size!4275 (buf!4721 thiss!1204)) (size!4275 (buf!4721 (_2!8449 lt!278693)))))))

(declare-fun choose!16 (BitStream!7658 Bool) tuple2!15608)

(assert (=> d!63147 (= lt!278693 (choose!16 thiss!1204 lt!277801))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!63147 (validate_offset_bit!0 ((_ sign_extend 32) (size!4275 (buf!4721 thiss!1204))) ((_ sign_extend 32) (currentByte!8937 thiss!1204)) ((_ sign_extend 32) (currentBit!8932 thiss!1204)))))

(assert (=> d!63147 (= (appendBit!0 thiss!1204 lt!277801) lt!278693)))

(assert (= (and d!63147 res!150621) b!181363))

(assert (= (and b!181363 res!150623) b!181364))

(assert (= (and b!181364 res!150620) b!181365))

(assert (= (and b!181365 res!150622) b!181366))

(declare-fun m!282373 () Bool)

(assert (=> b!181365 m!282373))

(assert (=> b!181365 m!282373))

(declare-fun m!282375 () Bool)

(assert (=> b!181365 m!282375))

(declare-fun m!282377 () Bool)

(assert (=> b!181364 m!282377))

(declare-fun m!282379 () Bool)

(assert (=> b!181363 m!282379))

(assert (=> b!181363 m!281821))

(declare-fun m!282381 () Bool)

(assert (=> d!63147 m!282381))

(declare-fun m!282383 () Bool)

(assert (=> d!63147 m!282383))

(declare-fun m!282385 () Bool)

(assert (=> b!181366 m!282385))

(assert (=> b!181366 m!282379))

(assert (=> b!181047 d!63147))

(declare-fun d!63149 () Bool)

(assert (=> d!63149 (= (inv!12 thiss!1204) (invariant!0 (currentBit!8932 thiss!1204) (currentByte!8937 thiss!1204) (size!4275 (buf!4721 thiss!1204))))))

(declare-fun bs!15721 () Bool)

(assert (= bs!15721 d!63149))

(assert (=> bs!15721 m!281825))

(assert (=> start!39840 d!63149))

(declare-fun d!63151 () Bool)

(assert (=> d!63151 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4275 (buf!4721 thiss!1204))) ((_ sign_extend 32) (currentByte!8937 thiss!1204)) ((_ sign_extend 32) (currentBit!8932 thiss!1204)) lt!277804) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4275 (buf!4721 thiss!1204))) ((_ sign_extend 32) (currentByte!8937 thiss!1204)) ((_ sign_extend 32) (currentBit!8932 thiss!1204))) lt!277804))))

(declare-fun bs!15722 () Bool)

(assert (= bs!15722 d!63151))

(assert (=> bs!15722 m!282279))

(assert (=> b!181037 d!63151))

(assert (=> b!181048 d!63143))

(assert (=> b!181048 d!63145))

(declare-fun d!63153 () Bool)

(declare-datatypes ((tuple2!15624 0))(
  ( (tuple2!15625 (_1!8457 Bool) (_2!8457 BitStream!7658)) )
))
(declare-fun lt!278697 () tuple2!15624)

(declare-fun readBit!0 (BitStream!7658) tuple2!15624)

(assert (=> d!63153 (= lt!278697 (readBit!0 (readerFrom!0 (_2!8449 lt!277802) (currentBit!8932 thiss!1204) (currentByte!8937 thiss!1204))))))

(assert (=> d!63153 (= (readBitPure!0 (readerFrom!0 (_2!8449 lt!277802) (currentBit!8932 thiss!1204) (currentByte!8937 thiss!1204))) (tuple2!15611 (_2!8457 lt!278697) (_1!8457 lt!278697)))))

(declare-fun bs!15723 () Bool)

(assert (= bs!15723 d!63153))

(assert (=> bs!15723 m!281789))

(declare-fun m!282387 () Bool)

(assert (=> bs!15723 m!282387))

(assert (=> b!181035 d!63153))

(declare-fun d!63155 () Bool)

(declare-fun e!125938 () Bool)

(assert (=> d!63155 e!125938))

(declare-fun res!150627 () Bool)

(assert (=> d!63155 (=> (not res!150627) (not e!125938))))

(assert (=> d!63155 (= res!150627 (invariant!0 (currentBit!8932 (_2!8449 lt!277802)) (currentByte!8937 (_2!8449 lt!277802)) (size!4275 (buf!4721 (_2!8449 lt!277802)))))))

(assert (=> d!63155 (= (readerFrom!0 (_2!8449 lt!277802) (currentBit!8932 thiss!1204) (currentByte!8937 thiss!1204)) (BitStream!7659 (buf!4721 (_2!8449 lt!277802)) (currentByte!8937 thiss!1204) (currentBit!8932 thiss!1204)))))

(declare-fun b!181369 () Bool)

(assert (=> b!181369 (= e!125938 (invariant!0 (currentBit!8932 thiss!1204) (currentByte!8937 thiss!1204) (size!4275 (buf!4721 (_2!8449 lt!277802)))))))

(assert (= (and d!63155 res!150627) b!181369))

(assert (=> d!63155 m!282277))

(assert (=> b!181369 m!281805))

(assert (=> b!181035 d!63155))

(declare-fun d!63157 () Bool)

(assert (=> d!63157 (= (array_inv!4016 (buf!4721 thiss!1204)) (bvsge (size!4275 (buf!4721 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!181046 d!63157))

(declare-fun d!63159 () Bool)

(assert (=> d!63159 (= (invariant!0 (currentBit!8932 thiss!1204) (currentByte!8937 thiss!1204) (size!4275 (buf!4721 (_2!8449 lt!277805)))) (and (bvsge (currentBit!8932 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!8932 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!8937 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!8937 thiss!1204) (size!4275 (buf!4721 (_2!8449 lt!277805)))) (and (= (currentBit!8932 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!8937 thiss!1204) (size!4275 (buf!4721 (_2!8449 lt!277805))))))))))

(assert (=> b!181036 d!63159))

(declare-fun d!63161 () Bool)

(declare-fun res!150629 () Bool)

(declare-fun e!125939 () Bool)

(assert (=> d!63161 (=> (not res!150629) (not e!125939))))

(assert (=> d!63161 (= res!150629 (= (size!4275 (buf!4721 thiss!1204)) (size!4275 (buf!4721 (_2!8449 lt!277802)))))))

(assert (=> d!63161 (= (isPrefixOf!0 thiss!1204 (_2!8449 lt!277802)) e!125939)))

(declare-fun b!181370 () Bool)

(declare-fun res!150628 () Bool)

(assert (=> b!181370 (=> (not res!150628) (not e!125939))))

(assert (=> b!181370 (= res!150628 (bvsle (bitIndex!0 (size!4275 (buf!4721 thiss!1204)) (currentByte!8937 thiss!1204) (currentBit!8932 thiss!1204)) (bitIndex!0 (size!4275 (buf!4721 (_2!8449 lt!277802))) (currentByte!8937 (_2!8449 lt!277802)) (currentBit!8932 (_2!8449 lt!277802)))))))

(declare-fun b!181371 () Bool)

(declare-fun e!125940 () Bool)

(assert (=> b!181371 (= e!125939 e!125940)))

(declare-fun res!150630 () Bool)

(assert (=> b!181371 (=> res!150630 e!125940)))

(assert (=> b!181371 (= res!150630 (= (size!4275 (buf!4721 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!181372 () Bool)

(assert (=> b!181372 (= e!125940 (arrayBitRangesEq!0 (buf!4721 thiss!1204) (buf!4721 (_2!8449 lt!277802)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4275 (buf!4721 thiss!1204)) (currentByte!8937 thiss!1204) (currentBit!8932 thiss!1204))))))

(assert (= (and d!63161 res!150629) b!181370))

(assert (= (and b!181370 res!150628) b!181371))

(assert (= (and b!181371 (not res!150630)) b!181372))

(assert (=> b!181370 m!281821))

(assert (=> b!181370 m!281819))

(assert (=> b!181372 m!281821))

(assert (=> b!181372 m!281821))

(declare-fun m!282389 () Bool)

(assert (=> b!181372 m!282389))

(assert (=> b!181045 d!63161))

(assert (=> b!181043 d!63161))

(declare-fun d!63163 () Bool)

(declare-fun res!150632 () Bool)

(declare-fun e!125941 () Bool)

(assert (=> d!63163 (=> (not res!150632) (not e!125941))))

(assert (=> d!63163 (= res!150632 (= (size!4275 (buf!4721 (_2!8449 lt!277802))) (size!4275 (buf!4721 (_2!8449 lt!277805)))))))

(assert (=> d!63163 (= (isPrefixOf!0 (_2!8449 lt!277802) (_2!8449 lt!277805)) e!125941)))

(declare-fun b!181373 () Bool)

(declare-fun res!150631 () Bool)

(assert (=> b!181373 (=> (not res!150631) (not e!125941))))

(assert (=> b!181373 (= res!150631 (bvsle (bitIndex!0 (size!4275 (buf!4721 (_2!8449 lt!277802))) (currentByte!8937 (_2!8449 lt!277802)) (currentBit!8932 (_2!8449 lt!277802))) (bitIndex!0 (size!4275 (buf!4721 (_2!8449 lt!277805))) (currentByte!8937 (_2!8449 lt!277805)) (currentBit!8932 (_2!8449 lt!277805)))))))

(declare-fun b!181374 () Bool)

(declare-fun e!125942 () Bool)

(assert (=> b!181374 (= e!125941 e!125942)))

(declare-fun res!150633 () Bool)

(assert (=> b!181374 (=> res!150633 e!125942)))

(assert (=> b!181374 (= res!150633 (= (size!4275 (buf!4721 (_2!8449 lt!277802))) #b00000000000000000000000000000000))))

(declare-fun b!181375 () Bool)

(assert (=> b!181375 (= e!125942 (arrayBitRangesEq!0 (buf!4721 (_2!8449 lt!277802)) (buf!4721 (_2!8449 lt!277805)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4275 (buf!4721 (_2!8449 lt!277802))) (currentByte!8937 (_2!8449 lt!277802)) (currentBit!8932 (_2!8449 lt!277802)))))))

(assert (= (and d!63163 res!150632) b!181373))

(assert (= (and b!181373 res!150631) b!181374))

(assert (= (and b!181374 (not res!150633)) b!181375))

(assert (=> b!181373 m!281819))

(assert (=> b!181373 m!281827))

(assert (=> b!181375 m!281819))

(assert (=> b!181375 m!281819))

(declare-fun m!282391 () Bool)

(assert (=> b!181375 m!282391))

(assert (=> b!181044 d!63163))

(declare-fun d!63165 () Bool)

(declare-fun lt!278698 () tuple2!15624)

(assert (=> d!63165 (= lt!278698 (readBit!0 (_1!8451 lt!277803)))))

(assert (=> d!63165 (= (readBitPure!0 (_1!8451 lt!277803)) (tuple2!15611 (_2!8457 lt!278698) (_1!8457 lt!278698)))))

(declare-fun bs!15724 () Bool)

(assert (= bs!15724 d!63165))

(declare-fun m!282393 () Bool)

(assert (=> bs!15724 m!282393))

(assert (=> b!181042 d!63165))

(declare-fun d!63167 () Bool)

(declare-fun e!125943 () Bool)

(assert (=> d!63167 e!125943))

(declare-fun res!150634 () Bool)

(assert (=> d!63167 (=> (not res!150634) (not e!125943))))

(declare-fun lt!278703 () (_ BitVec 64))

(declare-fun lt!278699 () (_ BitVec 64))

(declare-fun lt!278702 () (_ BitVec 64))

(assert (=> d!63167 (= res!150634 (= lt!278703 (bvsub lt!278702 lt!278699)))))

(assert (=> d!63167 (or (= (bvand lt!278702 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!278699 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!278702 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!278702 lt!278699) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63167 (= lt!278699 (remainingBits!0 ((_ sign_extend 32) (size!4275 (buf!4721 (_1!8450 lt!277814)))) ((_ sign_extend 32) (currentByte!8937 (_1!8450 lt!277814))) ((_ sign_extend 32) (currentBit!8932 (_1!8450 lt!277814)))))))

(declare-fun lt!278704 () (_ BitVec 64))

(declare-fun lt!278700 () (_ BitVec 64))

(assert (=> d!63167 (= lt!278702 (bvmul lt!278704 lt!278700))))

(assert (=> d!63167 (or (= lt!278704 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!278700 (bvsdiv (bvmul lt!278704 lt!278700) lt!278704)))))

(assert (=> d!63167 (= lt!278700 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63167 (= lt!278704 ((_ sign_extend 32) (size!4275 (buf!4721 (_1!8450 lt!277814)))))))

(assert (=> d!63167 (= lt!278703 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8937 (_1!8450 lt!277814))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8932 (_1!8450 lt!277814)))))))

(assert (=> d!63167 (invariant!0 (currentBit!8932 (_1!8450 lt!277814)) (currentByte!8937 (_1!8450 lt!277814)) (size!4275 (buf!4721 (_1!8450 lt!277814))))))

(assert (=> d!63167 (= (bitIndex!0 (size!4275 (buf!4721 (_1!8450 lt!277814))) (currentByte!8937 (_1!8450 lt!277814)) (currentBit!8932 (_1!8450 lt!277814))) lt!278703)))

(declare-fun b!181376 () Bool)

(declare-fun res!150635 () Bool)

(assert (=> b!181376 (=> (not res!150635) (not e!125943))))

(assert (=> b!181376 (= res!150635 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!278703))))

(declare-fun b!181377 () Bool)

(declare-fun lt!278701 () (_ BitVec 64))

(assert (=> b!181377 (= e!125943 (bvsle lt!278703 (bvmul lt!278701 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!181377 (or (= lt!278701 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!278701 #b0000000000000000000000000000000000000000000000000000000000001000) lt!278701)))))

(assert (=> b!181377 (= lt!278701 ((_ sign_extend 32) (size!4275 (buf!4721 (_1!8450 lt!277814)))))))

(assert (= (and d!63167 res!150634) b!181376))

(assert (= (and b!181376 res!150635) b!181377))

(declare-fun m!282395 () Bool)

(assert (=> d!63167 m!282395))

(declare-fun m!282397 () Bool)

(assert (=> d!63167 m!282397))

(assert (=> b!181042 d!63167))

(declare-fun d!63169 () Bool)

(declare-fun e!125946 () Bool)

(assert (=> d!63169 e!125946))

(declare-fun res!150638 () Bool)

(assert (=> d!63169 (=> (not res!150638) (not e!125946))))

(declare-fun lt!278716 () tuple2!15610)

(declare-fun lt!278713 () tuple2!15610)

(assert (=> d!63169 (= res!150638 (= (bitIndex!0 (size!4275 (buf!4721 (_1!8450 lt!278716))) (currentByte!8937 (_1!8450 lt!278716)) (currentBit!8932 (_1!8450 lt!278716))) (bitIndex!0 (size!4275 (buf!4721 (_1!8450 lt!278713))) (currentByte!8937 (_1!8450 lt!278713)) (currentBit!8932 (_1!8450 lt!278713)))))))

(declare-fun lt!278714 () Unit!13008)

(declare-fun lt!278715 () BitStream!7658)

(declare-fun choose!50 (BitStream!7658 BitStream!7658 BitStream!7658 tuple2!15610 tuple2!15610 BitStream!7658 Bool tuple2!15610 tuple2!15610 BitStream!7658 Bool) Unit!13008)

(assert (=> d!63169 (= lt!278714 (choose!50 lt!277811 (_2!8449 lt!277805) lt!278715 lt!278716 (tuple2!15611 (_1!8450 lt!278716) (_2!8450 lt!278716)) (_1!8450 lt!278716) (_2!8450 lt!278716) lt!278713 (tuple2!15611 (_1!8450 lt!278713) (_2!8450 lt!278713)) (_1!8450 lt!278713) (_2!8450 lt!278713)))))

(assert (=> d!63169 (= lt!278713 (readBitPure!0 lt!278715))))

(assert (=> d!63169 (= lt!278716 (readBitPure!0 lt!277811))))

(assert (=> d!63169 (= lt!278715 (BitStream!7659 (buf!4721 (_2!8449 lt!277805)) (currentByte!8937 lt!277811) (currentBit!8932 lt!277811)))))

(assert (=> d!63169 (invariant!0 (currentBit!8932 lt!277811) (currentByte!8937 lt!277811) (size!4275 (buf!4721 (_2!8449 lt!277805))))))

(assert (=> d!63169 (= (readBitPrefixLemma!0 lt!277811 (_2!8449 lt!277805)) lt!278714)))

(declare-fun b!181380 () Bool)

(assert (=> b!181380 (= e!125946 (= (_2!8450 lt!278716) (_2!8450 lt!278713)))))

(assert (= (and d!63169 res!150638) b!181380))

(declare-fun m!282399 () Bool)

(assert (=> d!63169 m!282399))

(declare-fun m!282401 () Bool)

(assert (=> d!63169 m!282401))

(assert (=> d!63169 m!281809))

(declare-fun m!282403 () Bool)

(assert (=> d!63169 m!282403))

(declare-fun m!282405 () Bool)

(assert (=> d!63169 m!282405))

(declare-fun m!282407 () Bool)

(assert (=> d!63169 m!282407))

(assert (=> b!181042 d!63169))

(declare-fun d!63171 () Bool)

(declare-fun lt!278717 () tuple2!15624)

(assert (=> d!63171 (= lt!278717 (readBit!0 (BitStream!7659 (buf!4721 (_2!8449 lt!277805)) (currentByte!8937 thiss!1204) (currentBit!8932 thiss!1204))))))

(assert (=> d!63171 (= (readBitPure!0 (BitStream!7659 (buf!4721 (_2!8449 lt!277805)) (currentByte!8937 thiss!1204) (currentBit!8932 thiss!1204))) (tuple2!15611 (_2!8457 lt!278717) (_1!8457 lt!278717)))))

(declare-fun bs!15725 () Bool)

(assert (= bs!15725 d!63171))

(declare-fun m!282409 () Bool)

(assert (=> bs!15725 m!282409))

(assert (=> b!181042 d!63171))

(declare-fun d!63173 () Bool)

(assert (=> d!63173 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4275 (buf!4721 (_1!8451 lt!277803)))) ((_ sign_extend 32) (currentByte!8937 (_1!8451 lt!277803))) ((_ sign_extend 32) (currentBit!8932 (_1!8451 lt!277803))) lt!277804) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4275 (buf!4721 (_1!8451 lt!277803)))) ((_ sign_extend 32) (currentByte!8937 (_1!8451 lt!277803))) ((_ sign_extend 32) (currentBit!8932 (_1!8451 lt!277803)))) lt!277804))))

(declare-fun bs!15726 () Bool)

(assert (= bs!15726 d!63173))

(declare-fun m!282411 () Bool)

(assert (=> bs!15726 m!282411))

(assert (=> b!181042 d!63173))

(declare-fun b!181391 () Bool)

(declare-fun res!150647 () Bool)

(declare-fun e!125951 () Bool)

(assert (=> b!181391 (=> (not res!150647) (not e!125951))))

(declare-fun lt!278760 () tuple2!15612)

(assert (=> b!181391 (= res!150647 (isPrefixOf!0 (_1!8451 lt!278760) (_2!8449 lt!277802)))))

(declare-fun lt!278772 () (_ BitVec 64))

(declare-fun lt!278767 () (_ BitVec 64))

(declare-fun b!181393 () Bool)

(assert (=> b!181393 (= e!125951 (= (_1!8451 lt!278760) (withMovedBitIndex!0 (_2!8451 lt!278760) (bvsub lt!278767 lt!278772))))))

(assert (=> b!181393 (or (= (bvand lt!278767 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!278772 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!278767 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!278767 lt!278772) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!181393 (= lt!278772 (bitIndex!0 (size!4275 (buf!4721 (_2!8449 lt!277805))) (currentByte!8937 (_2!8449 lt!277805)) (currentBit!8932 (_2!8449 lt!277805))))))

(assert (=> b!181393 (= lt!278767 (bitIndex!0 (size!4275 (buf!4721 (_2!8449 lt!277802))) (currentByte!8937 (_2!8449 lt!277802)) (currentBit!8932 (_2!8449 lt!277802))))))

(declare-fun b!181394 () Bool)

(declare-fun res!150646 () Bool)

(assert (=> b!181394 (=> (not res!150646) (not e!125951))))

(assert (=> b!181394 (= res!150646 (isPrefixOf!0 (_2!8451 lt!278760) (_2!8449 lt!277805)))))

(declare-fun b!181395 () Bool)

(declare-fun e!125952 () Unit!13008)

(declare-fun Unit!13047 () Unit!13008)

(assert (=> b!181395 (= e!125952 Unit!13047)))

(declare-fun d!63175 () Bool)

(assert (=> d!63175 e!125951))

(declare-fun res!150645 () Bool)

(assert (=> d!63175 (=> (not res!150645) (not e!125951))))

(assert (=> d!63175 (= res!150645 (isPrefixOf!0 (_1!8451 lt!278760) (_2!8451 lt!278760)))))

(declare-fun lt!278762 () BitStream!7658)

(assert (=> d!63175 (= lt!278760 (tuple2!15613 lt!278762 (_2!8449 lt!277805)))))

(declare-fun lt!278761 () Unit!13008)

(declare-fun lt!278776 () Unit!13008)

(assert (=> d!63175 (= lt!278761 lt!278776)))

(assert (=> d!63175 (isPrefixOf!0 lt!278762 (_2!8449 lt!277805))))

(assert (=> d!63175 (= lt!278776 (lemmaIsPrefixTransitive!0 lt!278762 (_2!8449 lt!277805) (_2!8449 lt!277805)))))

(declare-fun lt!278769 () Unit!13008)

(declare-fun lt!278774 () Unit!13008)

(assert (=> d!63175 (= lt!278769 lt!278774)))

(assert (=> d!63175 (isPrefixOf!0 lt!278762 (_2!8449 lt!277805))))

(assert (=> d!63175 (= lt!278774 (lemmaIsPrefixTransitive!0 lt!278762 (_2!8449 lt!277802) (_2!8449 lt!277805)))))

(declare-fun lt!278765 () Unit!13008)

(assert (=> d!63175 (= lt!278765 e!125952)))

(declare-fun c!9365 () Bool)

(assert (=> d!63175 (= c!9365 (not (= (size!4275 (buf!4721 (_2!8449 lt!277802))) #b00000000000000000000000000000000)))))

(declare-fun lt!278764 () Unit!13008)

(declare-fun lt!278758 () Unit!13008)

(assert (=> d!63175 (= lt!278764 lt!278758)))

(assert (=> d!63175 (isPrefixOf!0 (_2!8449 lt!277805) (_2!8449 lt!277805))))

(assert (=> d!63175 (= lt!278758 (lemmaIsPrefixRefl!0 (_2!8449 lt!277805)))))

(declare-fun lt!278777 () Unit!13008)

(declare-fun lt!278775 () Unit!13008)

(assert (=> d!63175 (= lt!278777 lt!278775)))

(assert (=> d!63175 (= lt!278775 (lemmaIsPrefixRefl!0 (_2!8449 lt!277805)))))

(declare-fun lt!278759 () Unit!13008)

(declare-fun lt!278771 () Unit!13008)

(assert (=> d!63175 (= lt!278759 lt!278771)))

(assert (=> d!63175 (isPrefixOf!0 lt!278762 lt!278762)))

(assert (=> d!63175 (= lt!278771 (lemmaIsPrefixRefl!0 lt!278762))))

(declare-fun lt!278763 () Unit!13008)

(declare-fun lt!278768 () Unit!13008)

(assert (=> d!63175 (= lt!278763 lt!278768)))

(assert (=> d!63175 (isPrefixOf!0 (_2!8449 lt!277802) (_2!8449 lt!277802))))

(assert (=> d!63175 (= lt!278768 (lemmaIsPrefixRefl!0 (_2!8449 lt!277802)))))

(assert (=> d!63175 (= lt!278762 (BitStream!7659 (buf!4721 (_2!8449 lt!277805)) (currentByte!8937 (_2!8449 lt!277802)) (currentBit!8932 (_2!8449 lt!277802))))))

(assert (=> d!63175 (isPrefixOf!0 (_2!8449 lt!277802) (_2!8449 lt!277805))))

(assert (=> d!63175 (= (reader!0 (_2!8449 lt!277802) (_2!8449 lt!277805)) lt!278760)))

(declare-fun b!181392 () Bool)

(declare-fun lt!278766 () Unit!13008)

(assert (=> b!181392 (= e!125952 lt!278766)))

(declare-fun lt!278770 () (_ BitVec 64))

(assert (=> b!181392 (= lt!278770 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!278773 () (_ BitVec 64))

(assert (=> b!181392 (= lt!278773 (bitIndex!0 (size!4275 (buf!4721 (_2!8449 lt!277802))) (currentByte!8937 (_2!8449 lt!277802)) (currentBit!8932 (_2!8449 lt!277802))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!9693 array!9693 (_ BitVec 64) (_ BitVec 64)) Unit!13008)

(assert (=> b!181392 (= lt!278766 (arrayBitRangesEqSymmetric!0 (buf!4721 (_2!8449 lt!277802)) (buf!4721 (_2!8449 lt!277805)) lt!278770 lt!278773))))

(assert (=> b!181392 (arrayBitRangesEq!0 (buf!4721 (_2!8449 lt!277805)) (buf!4721 (_2!8449 lt!277802)) lt!278770 lt!278773)))

(assert (= (and d!63175 c!9365) b!181392))

(assert (= (and d!63175 (not c!9365)) b!181395))

(assert (= (and d!63175 res!150645) b!181391))

(assert (= (and b!181391 res!150647) b!181394))

(assert (= (and b!181394 res!150646) b!181393))

(declare-fun m!282413 () Bool)

(assert (=> b!181391 m!282413))

(declare-fun m!282415 () Bool)

(assert (=> d!63175 m!282415))

(declare-fun m!282417 () Bool)

(assert (=> d!63175 m!282417))

(declare-fun m!282419 () Bool)

(assert (=> d!63175 m!282419))

(assert (=> d!63175 m!282181))

(assert (=> d!63175 m!281835))

(declare-fun m!282421 () Bool)

(assert (=> d!63175 m!282421))

(declare-fun m!282423 () Bool)

(assert (=> d!63175 m!282423))

(declare-fun m!282425 () Bool)

(assert (=> d!63175 m!282425))

(declare-fun m!282427 () Bool)

(assert (=> d!63175 m!282427))

(declare-fun m!282429 () Bool)

(assert (=> d!63175 m!282429))

(declare-fun m!282431 () Bool)

(assert (=> d!63175 m!282431))

(declare-fun m!282433 () Bool)

(assert (=> b!181393 m!282433))

(assert (=> b!181393 m!281827))

(assert (=> b!181393 m!281819))

(assert (=> b!181392 m!281819))

(declare-fun m!282435 () Bool)

(assert (=> b!181392 m!282435))

(declare-fun m!282437 () Bool)

(assert (=> b!181392 m!282437))

(declare-fun m!282439 () Bool)

(assert (=> b!181394 m!282439))

(assert (=> b!181042 d!63175))

(declare-fun d!63177 () Bool)

(declare-fun lt!278778 () tuple2!15624)

(assert (=> d!63177 (= lt!278778 (readBit!0 lt!277811))))

(assert (=> d!63177 (= (readBitPure!0 lt!277811) (tuple2!15611 (_2!8457 lt!278778) (_1!8457 lt!278778)))))

(declare-fun bs!15727 () Bool)

(assert (= bs!15727 d!63177))

(declare-fun m!282441 () Bool)

(assert (=> bs!15727 m!282441))

(assert (=> b!181042 d!63177))

(declare-fun d!63179 () Bool)

(assert (=> d!63179 (validate_offset_bits!1 ((_ sign_extend 32) (size!4275 (buf!4721 (_2!8449 lt!277805)))) ((_ sign_extend 32) (currentByte!8937 thiss!1204)) ((_ sign_extend 32) (currentBit!8932 thiss!1204)) lt!277804)))

(declare-fun lt!278781 () Unit!13008)

(declare-fun choose!9 (BitStream!7658 array!9693 (_ BitVec 64) BitStream!7658) Unit!13008)

(assert (=> d!63179 (= lt!278781 (choose!9 thiss!1204 (buf!4721 (_2!8449 lt!277805)) lt!277804 (BitStream!7659 (buf!4721 (_2!8449 lt!277805)) (currentByte!8937 thiss!1204) (currentBit!8932 thiss!1204))))))

(assert (=> d!63179 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4721 (_2!8449 lt!277805)) lt!277804) lt!278781)))

(declare-fun bs!15728 () Bool)

(assert (= bs!15728 d!63179))

(assert (=> bs!15728 m!281799))

(declare-fun m!282443 () Bool)

(assert (=> bs!15728 m!282443))

(assert (=> b!181042 d!63179))

(declare-fun d!63181 () Bool)

(assert (=> d!63181 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4275 (buf!4721 (_2!8449 lt!277805)))) ((_ sign_extend 32) (currentByte!8937 thiss!1204)) ((_ sign_extend 32) (currentBit!8932 thiss!1204)) lt!277804) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4275 (buf!4721 (_2!8449 lt!277805)))) ((_ sign_extend 32) (currentByte!8937 thiss!1204)) ((_ sign_extend 32) (currentBit!8932 thiss!1204))) lt!277804))))

(declare-fun bs!15729 () Bool)

(assert (= bs!15729 d!63181))

(declare-fun m!282445 () Bool)

(assert (=> bs!15729 m!282445))

(assert (=> b!181042 d!63181))

(declare-fun b!181396 () Bool)

(declare-fun res!150650 () Bool)

(declare-fun e!125953 () Bool)

(assert (=> b!181396 (=> (not res!150650) (not e!125953))))

(declare-fun lt!278784 () tuple2!15612)

(assert (=> b!181396 (= res!150650 (isPrefixOf!0 (_1!8451 lt!278784) thiss!1204))))

(declare-fun lt!278796 () (_ BitVec 64))

(declare-fun lt!278791 () (_ BitVec 64))

(declare-fun b!181398 () Bool)

(assert (=> b!181398 (= e!125953 (= (_1!8451 lt!278784) (withMovedBitIndex!0 (_2!8451 lt!278784) (bvsub lt!278791 lt!278796))))))

(assert (=> b!181398 (or (= (bvand lt!278791 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!278796 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!278791 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!278791 lt!278796) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!181398 (= lt!278796 (bitIndex!0 (size!4275 (buf!4721 (_2!8449 lt!277805))) (currentByte!8937 (_2!8449 lt!277805)) (currentBit!8932 (_2!8449 lt!277805))))))

(assert (=> b!181398 (= lt!278791 (bitIndex!0 (size!4275 (buf!4721 thiss!1204)) (currentByte!8937 thiss!1204) (currentBit!8932 thiss!1204)))))

(declare-fun b!181399 () Bool)

(declare-fun res!150649 () Bool)

(assert (=> b!181399 (=> (not res!150649) (not e!125953))))

(assert (=> b!181399 (= res!150649 (isPrefixOf!0 (_2!8451 lt!278784) (_2!8449 lt!277805)))))

(declare-fun b!181400 () Bool)

(declare-fun e!125954 () Unit!13008)

(declare-fun Unit!13048 () Unit!13008)

(assert (=> b!181400 (= e!125954 Unit!13048)))

(declare-fun d!63183 () Bool)

(assert (=> d!63183 e!125953))

(declare-fun res!150648 () Bool)

(assert (=> d!63183 (=> (not res!150648) (not e!125953))))

(assert (=> d!63183 (= res!150648 (isPrefixOf!0 (_1!8451 lt!278784) (_2!8451 lt!278784)))))

(declare-fun lt!278786 () BitStream!7658)

(assert (=> d!63183 (= lt!278784 (tuple2!15613 lt!278786 (_2!8449 lt!277805)))))

(declare-fun lt!278785 () Unit!13008)

(declare-fun lt!278800 () Unit!13008)

(assert (=> d!63183 (= lt!278785 lt!278800)))

(assert (=> d!63183 (isPrefixOf!0 lt!278786 (_2!8449 lt!277805))))

(assert (=> d!63183 (= lt!278800 (lemmaIsPrefixTransitive!0 lt!278786 (_2!8449 lt!277805) (_2!8449 lt!277805)))))

(declare-fun lt!278793 () Unit!13008)

(declare-fun lt!278798 () Unit!13008)

(assert (=> d!63183 (= lt!278793 lt!278798)))

(assert (=> d!63183 (isPrefixOf!0 lt!278786 (_2!8449 lt!277805))))

(assert (=> d!63183 (= lt!278798 (lemmaIsPrefixTransitive!0 lt!278786 thiss!1204 (_2!8449 lt!277805)))))

(declare-fun lt!278789 () Unit!13008)

(assert (=> d!63183 (= lt!278789 e!125954)))

(declare-fun c!9366 () Bool)

(assert (=> d!63183 (= c!9366 (not (= (size!4275 (buf!4721 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!278788 () Unit!13008)

(declare-fun lt!278782 () Unit!13008)

(assert (=> d!63183 (= lt!278788 lt!278782)))

(assert (=> d!63183 (isPrefixOf!0 (_2!8449 lt!277805) (_2!8449 lt!277805))))

(assert (=> d!63183 (= lt!278782 (lemmaIsPrefixRefl!0 (_2!8449 lt!277805)))))

(declare-fun lt!278801 () Unit!13008)

(declare-fun lt!278799 () Unit!13008)

(assert (=> d!63183 (= lt!278801 lt!278799)))

(assert (=> d!63183 (= lt!278799 (lemmaIsPrefixRefl!0 (_2!8449 lt!277805)))))

(declare-fun lt!278783 () Unit!13008)

(declare-fun lt!278795 () Unit!13008)

(assert (=> d!63183 (= lt!278783 lt!278795)))

(assert (=> d!63183 (isPrefixOf!0 lt!278786 lt!278786)))

(assert (=> d!63183 (= lt!278795 (lemmaIsPrefixRefl!0 lt!278786))))

(declare-fun lt!278787 () Unit!13008)

(declare-fun lt!278792 () Unit!13008)

(assert (=> d!63183 (= lt!278787 lt!278792)))

(assert (=> d!63183 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!63183 (= lt!278792 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!63183 (= lt!278786 (BitStream!7659 (buf!4721 (_2!8449 lt!277805)) (currentByte!8937 thiss!1204) (currentBit!8932 thiss!1204)))))

(assert (=> d!63183 (isPrefixOf!0 thiss!1204 (_2!8449 lt!277805))))

(assert (=> d!63183 (= (reader!0 thiss!1204 (_2!8449 lt!277805)) lt!278784)))

(declare-fun b!181397 () Bool)

(declare-fun lt!278790 () Unit!13008)

(assert (=> b!181397 (= e!125954 lt!278790)))

(declare-fun lt!278794 () (_ BitVec 64))

(assert (=> b!181397 (= lt!278794 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!278797 () (_ BitVec 64))

(assert (=> b!181397 (= lt!278797 (bitIndex!0 (size!4275 (buf!4721 thiss!1204)) (currentByte!8937 thiss!1204) (currentBit!8932 thiss!1204)))))

(assert (=> b!181397 (= lt!278790 (arrayBitRangesEqSymmetric!0 (buf!4721 thiss!1204) (buf!4721 (_2!8449 lt!277805)) lt!278794 lt!278797))))

(assert (=> b!181397 (arrayBitRangesEq!0 (buf!4721 (_2!8449 lt!277805)) (buf!4721 thiss!1204) lt!278794 lt!278797)))

(assert (= (and d!63183 c!9366) b!181397))

(assert (= (and d!63183 (not c!9366)) b!181400))

(assert (= (and d!63183 res!150648) b!181396))

(assert (= (and b!181396 res!150650) b!181399))

(assert (= (and b!181399 res!150649) b!181398))

(declare-fun m!282447 () Bool)

(assert (=> b!181396 m!282447))

(declare-fun m!282449 () Bool)

(assert (=> d!63183 m!282449))

(declare-fun m!282451 () Bool)

(assert (=> d!63183 m!282451))

(assert (=> d!63183 m!282419))

(declare-fun m!282453 () Bool)

(assert (=> d!63183 m!282453))

(assert (=> d!63183 m!281829))

(declare-fun m!282455 () Bool)

(assert (=> d!63183 m!282455))

(declare-fun m!282457 () Bool)

(assert (=> d!63183 m!282457))

(declare-fun m!282459 () Bool)

(assert (=> d!63183 m!282459))

(declare-fun m!282461 () Bool)

(assert (=> d!63183 m!282461))

(declare-fun m!282463 () Bool)

(assert (=> d!63183 m!282463))

(assert (=> d!63183 m!282431))

(declare-fun m!282465 () Bool)

(assert (=> b!181398 m!282465))

(assert (=> b!181398 m!281827))

(assert (=> b!181398 m!281821))

(assert (=> b!181397 m!281821))

(declare-fun m!282467 () Bool)

(assert (=> b!181397 m!282467))

(declare-fun m!282469 () Bool)

(assert (=> b!181397 m!282469))

(declare-fun m!282471 () Bool)

(assert (=> b!181399 m!282471))

(assert (=> b!181042 d!63183))

(declare-fun d!63185 () Bool)

(assert (=> d!63185 (= (invariant!0 (currentBit!8932 thiss!1204) (currentByte!8937 thiss!1204) (size!4275 (buf!4721 (_2!8449 lt!277802)))) (and (bvsge (currentBit!8932 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!8932 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!8937 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!8937 thiss!1204) (size!4275 (buf!4721 (_2!8449 lt!277802)))) (and (= (currentBit!8932 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!8937 thiss!1204) (size!4275 (buf!4721 (_2!8449 lt!277802))))))))))

(assert (=> b!181042 d!63185))

(declare-fun d!63187 () Bool)

(declare-fun e!125955 () Bool)

(assert (=> d!63187 e!125955))

(declare-fun res!150651 () Bool)

(assert (=> d!63187 (=> (not res!150651) (not e!125955))))

(declare-fun lt!278806 () (_ BitVec 64))

(declare-fun lt!278802 () (_ BitVec 64))

(declare-fun lt!278805 () (_ BitVec 64))

(assert (=> d!63187 (= res!150651 (= lt!278806 (bvsub lt!278805 lt!278802)))))

(assert (=> d!63187 (or (= (bvand lt!278805 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!278802 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!278805 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!278805 lt!278802) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63187 (= lt!278802 (remainingBits!0 ((_ sign_extend 32) (size!4275 (buf!4721 (_1!8450 lt!277812)))) ((_ sign_extend 32) (currentByte!8937 (_1!8450 lt!277812))) ((_ sign_extend 32) (currentBit!8932 (_1!8450 lt!277812)))))))

(declare-fun lt!278807 () (_ BitVec 64))

(declare-fun lt!278803 () (_ BitVec 64))

(assert (=> d!63187 (= lt!278805 (bvmul lt!278807 lt!278803))))

(assert (=> d!63187 (or (= lt!278807 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!278803 (bvsdiv (bvmul lt!278807 lt!278803) lt!278807)))))

(assert (=> d!63187 (= lt!278803 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63187 (= lt!278807 ((_ sign_extend 32) (size!4275 (buf!4721 (_1!8450 lt!277812)))))))

(assert (=> d!63187 (= lt!278806 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8937 (_1!8450 lt!277812))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8932 (_1!8450 lt!277812)))))))

(assert (=> d!63187 (invariant!0 (currentBit!8932 (_1!8450 lt!277812)) (currentByte!8937 (_1!8450 lt!277812)) (size!4275 (buf!4721 (_1!8450 lt!277812))))))

(assert (=> d!63187 (= (bitIndex!0 (size!4275 (buf!4721 (_1!8450 lt!277812))) (currentByte!8937 (_1!8450 lt!277812)) (currentBit!8932 (_1!8450 lt!277812))) lt!278806)))

(declare-fun b!181401 () Bool)

(declare-fun res!150652 () Bool)

(assert (=> b!181401 (=> (not res!150652) (not e!125955))))

(assert (=> b!181401 (= res!150652 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!278806))))

(declare-fun b!181402 () Bool)

(declare-fun lt!278804 () (_ BitVec 64))

(assert (=> b!181402 (= e!125955 (bvsle lt!278806 (bvmul lt!278804 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!181402 (or (= lt!278804 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!278804 #b0000000000000000000000000000000000000000000000000000000000001000) lt!278804)))))

(assert (=> b!181402 (= lt!278804 ((_ sign_extend 32) (size!4275 (buf!4721 (_1!8450 lt!277812)))))))

(assert (= (and d!63187 res!150651) b!181401))

(assert (= (and b!181401 res!150652) b!181402))

(declare-fun m!282473 () Bool)

(assert (=> d!63187 m!282473))

(declare-fun m!282475 () Bool)

(assert (=> d!63187 m!282475))

(assert (=> b!181042 d!63187))

(declare-fun d!63189 () Bool)

(declare-fun e!125956 () Bool)

(assert (=> d!63189 e!125956))

(declare-fun res!150653 () Bool)

(assert (=> d!63189 (=> (not res!150653) (not e!125956))))

(declare-fun lt!278812 () (_ BitVec 64))

(declare-fun lt!278808 () (_ BitVec 64))

(declare-fun lt!278811 () (_ BitVec 64))

(assert (=> d!63189 (= res!150653 (= lt!278812 (bvsub lt!278811 lt!278808)))))

(assert (=> d!63189 (or (= (bvand lt!278811 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!278808 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!278811 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!278811 lt!278808) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63189 (= lt!278808 (remainingBits!0 ((_ sign_extend 32) (size!4275 (buf!4721 (_1!8450 lt!277809)))) ((_ sign_extend 32) (currentByte!8937 (_1!8450 lt!277809))) ((_ sign_extend 32) (currentBit!8932 (_1!8450 lt!277809)))))))

(declare-fun lt!278813 () (_ BitVec 64))

(declare-fun lt!278809 () (_ BitVec 64))

(assert (=> d!63189 (= lt!278811 (bvmul lt!278813 lt!278809))))

(assert (=> d!63189 (or (= lt!278813 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!278809 (bvsdiv (bvmul lt!278813 lt!278809) lt!278813)))))

(assert (=> d!63189 (= lt!278809 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63189 (= lt!278813 ((_ sign_extend 32) (size!4275 (buf!4721 (_1!8450 lt!277809)))))))

(assert (=> d!63189 (= lt!278812 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8937 (_1!8450 lt!277809))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8932 (_1!8450 lt!277809)))))))

(assert (=> d!63189 (invariant!0 (currentBit!8932 (_1!8450 lt!277809)) (currentByte!8937 (_1!8450 lt!277809)) (size!4275 (buf!4721 (_1!8450 lt!277809))))))

(assert (=> d!63189 (= (bitIndex!0 (size!4275 (buf!4721 (_1!8450 lt!277809))) (currentByte!8937 (_1!8450 lt!277809)) (currentBit!8932 (_1!8450 lt!277809))) lt!278812)))

(declare-fun b!181403 () Bool)

(declare-fun res!150654 () Bool)

(assert (=> b!181403 (=> (not res!150654) (not e!125956))))

(assert (=> b!181403 (= res!150654 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!278812))))

(declare-fun b!181404 () Bool)

(declare-fun lt!278810 () (_ BitVec 64))

(assert (=> b!181404 (= e!125956 (bvsle lt!278812 (bvmul lt!278810 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!181404 (or (= lt!278810 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!278810 #b0000000000000000000000000000000000000000000000000000000000001000) lt!278810)))))

(assert (=> b!181404 (= lt!278810 ((_ sign_extend 32) (size!4275 (buf!4721 (_1!8450 lt!277809)))))))

(assert (= (and d!63189 res!150653) b!181403))

(assert (= (and b!181403 res!150654) b!181404))

(declare-fun m!282477 () Bool)

(assert (=> d!63189 m!282477))

(declare-fun m!282479 () Bool)

(assert (=> d!63189 m!282479))

(assert (=> b!181041 d!63189))

(push 1)

(assert (not d!63183))

(assert (not b!181372))

(assert (not b!181370))

(assert (not b!181394))

(assert (not b!181392))

(assert (not d!63143))

(assert (not b!181369))

(assert (not d!63145))

(assert (not b!181155))

(assert (not d!63171))

(assert (not b!181366))

(assert (not b!181365))

(assert (not d!63093))

(assert (not b!181330))

(assert (not d!63151))

(assert (not d!63187))

(assert (not b!181398))

(assert (not bm!2950))

(assert (not b!181393))

(assert (not b!181375))

(assert (not d!63155))

(assert (not d!63173))

(assert (not b!181321))

(assert (not d!63181))

(assert (not b!181329))

(assert (not d!63175))

(assert (not d!63063))

(assert (not d!63090))

(assert (not b!181364))

(assert (not d!63189))

(assert (not b!181323))

(assert (not d!63153))

(assert (not b!181318))

(assert (not b!181326))

(assert (not b!181322))

(assert (not b!181363))

(assert (not d!63179))

(assert (not b!181324))

(assert (not d!63147))

(assert (not d!63169))

(assert (not b!181396))

(assert (not b!181327))

(assert (not b!181399))

(assert (not d!63149))

(assert (not b!181373))

(assert (not d!63177))

(assert (not b!181328))

(assert (not d!63167))

(assert (not b!181397))

(assert (not b!181391))

(assert (not d!63165))

(assert (not b!181153))

(check-sat)

(pop 1)

(push 1)

(check-sat)

