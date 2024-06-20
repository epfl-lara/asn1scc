; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40660 () Bool)

(assert start!40660)

(declare-fun b!187027 () Bool)

(declare-fun e!129361 () Bool)

(declare-datatypes ((array!9836 0))(
  ( (array!9837 (arr!5267 (Array (_ BitVec 32) (_ BitVec 8))) (size!4337 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7782 0))(
  ( (BitStream!7783 (buf!4803 array!9836) (currentByte!9059 (_ BitVec 32)) (currentBit!9054 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!16172 0))(
  ( (tuple2!16173 (_1!8731 BitStream!7782) (_2!8731 Bool)) )
))
(declare-fun lt!289378 () tuple2!16172)

(declare-fun lt!289368 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!187027 (= e!129361 (= (bitIndex!0 (size!4337 (buf!4803 (_1!8731 lt!289378))) (currentByte!9059 (_1!8731 lt!289378)) (currentBit!9054 (_1!8731 lt!289378))) lt!289368))))

(declare-fun b!187028 () Bool)

(declare-fun e!129358 () Bool)

(declare-fun e!129354 () Bool)

(assert (=> b!187028 (= e!129358 e!129354)))

(declare-fun res!155762 () Bool)

(assert (=> b!187028 (=> res!155762 e!129354)))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun lt!289384 () (_ BitVec 64))

(declare-fun lt!289393 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!187028 (= res!155762 (not (= lt!289384 (bvsub (bvsub (bvadd lt!289393 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-datatypes ((Unit!13369 0))(
  ( (Unit!13370) )
))
(declare-datatypes ((tuple2!16174 0))(
  ( (tuple2!16175 (_1!8732 Unit!13369) (_2!8732 BitStream!7782)) )
))
(declare-fun lt!289389 () tuple2!16174)

(assert (=> b!187028 (= lt!289384 (bitIndex!0 (size!4337 (buf!4803 (_2!8732 lt!289389))) (currentByte!9059 (_2!8732 lt!289389)) (currentBit!9054 (_2!8732 lt!289389))))))

(declare-fun thiss!1204 () BitStream!7782)

(declare-fun isPrefixOf!0 (BitStream!7782 BitStream!7782) Bool)

(assert (=> b!187028 (isPrefixOf!0 thiss!1204 (_2!8732 lt!289389))))

(declare-fun lt!289392 () tuple2!16174)

(declare-fun lt!289390 () Unit!13369)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7782 BitStream!7782 BitStream!7782) Unit!13369)

(assert (=> b!187028 (= lt!289390 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8732 lt!289392) (_2!8732 lt!289389)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7782 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!16174)

(assert (=> b!187028 (= lt!289389 (appendBitsLSBFirstLoopTR!0 (_2!8732 lt!289392) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!187029 () Bool)

(declare-fun e!129360 () Bool)

(declare-fun lt!289385 () (_ BitVec 64))

(assert (=> b!187029 (= e!129360 (= lt!289385 (bvsub lt!289393 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!187030 () Bool)

(declare-fun res!155756 () Bool)

(declare-fun e!129364 () Bool)

(assert (=> b!187030 (=> (not res!155756) (not e!129364))))

(assert (=> b!187030 (= res!155756 (not (= i!590 nBits!348)))))

(declare-fun b!187031 () Bool)

(declare-fun res!155755 () Bool)

(assert (=> b!187031 (=> res!155755 e!129354)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!187031 (= res!155755 (not (invariant!0 (currentBit!9054 (_2!8732 lt!289389)) (currentByte!9059 (_2!8732 lt!289389)) (size!4337 (buf!4803 (_2!8732 lt!289389))))))))

(declare-fun b!187032 () Bool)

(declare-fun res!155754 () Bool)

(assert (=> b!187032 (=> res!155754 e!129354)))

(assert (=> b!187032 (= res!155754 (or (not (= (size!4337 (buf!4803 (_2!8732 lt!289389))) (size!4337 (buf!4803 thiss!1204)))) (not (= lt!289384 (bvsub (bvadd lt!289385 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!187034 () Bool)

(declare-fun e!129365 () Bool)

(assert (=> b!187034 (= e!129365 e!129361)))

(declare-fun res!155752 () Bool)

(assert (=> b!187034 (=> (not res!155752) (not e!129361))))

(declare-fun lt!289375 () Bool)

(assert (=> b!187034 (= res!155752 (and (= (_2!8731 lt!289378) lt!289375) (= (_1!8731 lt!289378) (_2!8732 lt!289392))))))

(declare-fun readBitPure!0 (BitStream!7782) tuple2!16172)

(declare-fun readerFrom!0 (BitStream!7782 (_ BitVec 32) (_ BitVec 32)) BitStream!7782)

(assert (=> b!187034 (= lt!289378 (readBitPure!0 (readerFrom!0 (_2!8732 lt!289392) (currentBit!9054 thiss!1204) (currentByte!9059 thiss!1204))))))

(declare-fun b!187035 () Bool)

(declare-fun res!155760 () Bool)

(assert (=> b!187035 (=> res!155760 e!129354)))

(assert (=> b!187035 (= res!155760 (not (isPrefixOf!0 thiss!1204 (_2!8732 lt!289392))))))

(declare-fun b!187036 () Bool)

(declare-fun e!129362 () Bool)

(assert (=> b!187036 (= e!129354 e!129362)))

(declare-fun res!155761 () Bool)

(assert (=> b!187036 (=> res!155761 e!129362)))

(declare-fun lt!289387 () (_ BitVec 64))

(declare-datatypes ((tuple2!16176 0))(
  ( (tuple2!16177 (_1!8733 BitStream!7782) (_2!8733 BitStream!7782)) )
))
(declare-fun lt!289379 () tuple2!16176)

(declare-datatypes ((tuple2!16178 0))(
  ( (tuple2!16179 (_1!8734 BitStream!7782) (_2!8734 (_ BitVec 64))) )
))
(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7782 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16178)

(assert (=> b!187036 (= res!155761 (not (= (_1!8734 (readNBitsLSBFirstsLoopPure!0 (_1!8733 lt!289379) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!289387)) (_2!8733 lt!289379))))))

(declare-fun lt!289383 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!187036 (validate_offset_bits!1 ((_ sign_extend 32) (size!4337 (buf!4803 (_2!8732 lt!289389)))) ((_ sign_extend 32) (currentByte!9059 (_2!8732 lt!289392))) ((_ sign_extend 32) (currentBit!9054 (_2!8732 lt!289392))) lt!289383)))

(declare-fun lt!289382 () Unit!13369)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7782 array!9836 (_ BitVec 64)) Unit!13369)

(assert (=> b!187036 (= lt!289382 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8732 lt!289392) (buf!4803 (_2!8732 lt!289389)) lt!289383))))

(assert (=> b!187036 (= lt!289383 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!289367 () tuple2!16172)

(declare-fun lt!289391 () (_ BitVec 64))

(declare-fun lt!289371 () (_ BitVec 64))

(assert (=> b!187036 (= lt!289387 (bvor lt!289391 (ite (_2!8731 lt!289367) lt!289371 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!289380 () tuple2!16178)

(declare-fun lt!289373 () tuple2!16176)

(assert (=> b!187036 (= lt!289380 (readNBitsLSBFirstsLoopPure!0 (_1!8733 lt!289373) nBits!348 i!590 lt!289391))))

(declare-fun lt!289374 () (_ BitVec 64))

(assert (=> b!187036 (validate_offset_bits!1 ((_ sign_extend 32) (size!4337 (buf!4803 (_2!8732 lt!289389)))) ((_ sign_extend 32) (currentByte!9059 thiss!1204)) ((_ sign_extend 32) (currentBit!9054 thiss!1204)) lt!289374)))

(declare-fun lt!289370 () Unit!13369)

(assert (=> b!187036 (= lt!289370 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4803 (_2!8732 lt!289389)) lt!289374))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!187036 (= lt!289391 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!187036 (= (_2!8731 lt!289367) lt!289375)))

(assert (=> b!187036 (= lt!289367 (readBitPure!0 (_1!8733 lt!289373)))))

(declare-fun reader!0 (BitStream!7782 BitStream!7782) tuple2!16176)

(assert (=> b!187036 (= lt!289379 (reader!0 (_2!8732 lt!289392) (_2!8732 lt!289389)))))

(assert (=> b!187036 (= lt!289373 (reader!0 thiss!1204 (_2!8732 lt!289389)))))

(declare-fun e!129359 () Bool)

(assert (=> b!187036 e!129359))

(declare-fun res!155751 () Bool)

(assert (=> b!187036 (=> (not res!155751) (not e!129359))))

(declare-fun lt!289381 () tuple2!16172)

(declare-fun lt!289369 () tuple2!16172)

(assert (=> b!187036 (= res!155751 (= (bitIndex!0 (size!4337 (buf!4803 (_1!8731 lt!289381))) (currentByte!9059 (_1!8731 lt!289381)) (currentBit!9054 (_1!8731 lt!289381))) (bitIndex!0 (size!4337 (buf!4803 (_1!8731 lt!289369))) (currentByte!9059 (_1!8731 lt!289369)) (currentBit!9054 (_1!8731 lt!289369)))))))

(declare-fun lt!289372 () Unit!13369)

(declare-fun lt!289388 () BitStream!7782)

(declare-fun readBitPrefixLemma!0 (BitStream!7782 BitStream!7782) Unit!13369)

(assert (=> b!187036 (= lt!289372 (readBitPrefixLemma!0 lt!289388 (_2!8732 lt!289389)))))

(assert (=> b!187036 (= lt!289369 (readBitPure!0 (BitStream!7783 (buf!4803 (_2!8732 lt!289389)) (currentByte!9059 thiss!1204) (currentBit!9054 thiss!1204))))))

(assert (=> b!187036 (= lt!289381 (readBitPure!0 lt!289388))))

(declare-fun e!129357 () Bool)

(assert (=> b!187036 e!129357))

(declare-fun res!155748 () Bool)

(assert (=> b!187036 (=> (not res!155748) (not e!129357))))

(assert (=> b!187036 (= res!155748 (invariant!0 (currentBit!9054 thiss!1204) (currentByte!9059 thiss!1204) (size!4337 (buf!4803 (_2!8732 lt!289392)))))))

(assert (=> b!187036 (= lt!289388 (BitStream!7783 (buf!4803 (_2!8732 lt!289392)) (currentByte!9059 thiss!1204) (currentBit!9054 thiss!1204)))))

(declare-fun b!187037 () Bool)

(assert (=> b!187037 (= e!129364 (not e!129358))))

(declare-fun res!155759 () Bool)

(assert (=> b!187037 (=> res!155759 e!129358)))

(assert (=> b!187037 (= res!155759 (not (= lt!289393 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!289385))))))

(assert (=> b!187037 (= lt!289393 (bitIndex!0 (size!4337 (buf!4803 (_2!8732 lt!289392))) (currentByte!9059 (_2!8732 lt!289392)) (currentBit!9054 (_2!8732 lt!289392))))))

(assert (=> b!187037 (= lt!289385 (bitIndex!0 (size!4337 (buf!4803 thiss!1204)) (currentByte!9059 thiss!1204) (currentBit!9054 thiss!1204)))))

(declare-fun e!129356 () Bool)

(assert (=> b!187037 e!129356))

(declare-fun res!155757 () Bool)

(assert (=> b!187037 (=> (not res!155757) (not e!129356))))

(assert (=> b!187037 (= res!155757 (= (size!4337 (buf!4803 thiss!1204)) (size!4337 (buf!4803 (_2!8732 lt!289392)))))))

(declare-fun appendBit!0 (BitStream!7782 Bool) tuple2!16174)

(assert (=> b!187037 (= lt!289392 (appendBit!0 thiss!1204 lt!289375))))

(assert (=> b!187037 (= lt!289375 (not (= (bvand v!189 lt!289371) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!187037 (= lt!289371 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!187038 () Bool)

(assert (=> b!187038 (= e!129356 e!129365)))

(declare-fun res!155746 () Bool)

(assert (=> b!187038 (=> (not res!155746) (not e!129365))))

(declare-fun lt!289377 () (_ BitVec 64))

(assert (=> b!187038 (= res!155746 (= lt!289368 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!289377)))))

(assert (=> b!187038 (= lt!289368 (bitIndex!0 (size!4337 (buf!4803 (_2!8732 lt!289392))) (currentByte!9059 (_2!8732 lt!289392)) (currentBit!9054 (_2!8732 lt!289392))))))

(assert (=> b!187038 (= lt!289377 (bitIndex!0 (size!4337 (buf!4803 thiss!1204)) (currentByte!9059 thiss!1204) (currentBit!9054 thiss!1204)))))

(declare-fun b!187039 () Bool)

(declare-fun res!155764 () Bool)

(assert (=> b!187039 (=> (not res!155764) (not e!129360))))

(declare-fun withMovedBitIndex!0 (BitStream!7782 (_ BitVec 64)) BitStream!7782)

(assert (=> b!187039 (= res!155764 (= (_1!8733 lt!289373) (withMovedBitIndex!0 (_2!8733 lt!289373) (bvsub lt!289385 lt!289384))))))

(declare-fun b!187040 () Bool)

(declare-fun res!155763 () Bool)

(assert (=> b!187040 (=> (not res!155763) (not e!129364))))

(assert (=> b!187040 (= res!155763 (invariant!0 (currentBit!9054 thiss!1204) (currentByte!9059 thiss!1204) (size!4337 (buf!4803 thiss!1204))))))

(declare-fun b!187041 () Bool)

(assert (=> b!187041 (= e!129359 (= (_2!8731 lt!289381) (_2!8731 lt!289369)))))

(declare-fun b!187042 () Bool)

(declare-fun res!155745 () Bool)

(assert (=> b!187042 (=> (not res!155745) (not e!129365))))

(assert (=> b!187042 (= res!155745 (isPrefixOf!0 thiss!1204 (_2!8732 lt!289392)))))

(declare-fun res!155747 () Bool)

(declare-fun e!129355 () Bool)

(assert (=> start!40660 (=> (not res!155747) (not e!129355))))

(assert (=> start!40660 (= res!155747 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!40660 e!129355))

(assert (=> start!40660 true))

(declare-fun e!129363 () Bool)

(declare-fun inv!12 (BitStream!7782) Bool)

(assert (=> start!40660 (and (inv!12 thiss!1204) e!129363)))

(declare-fun b!187033 () Bool)

(declare-fun array_inv!4078 (array!9836) Bool)

(assert (=> b!187033 (= e!129363 (array_inv!4078 (buf!4803 thiss!1204)))))

(declare-fun b!187043 () Bool)

(declare-fun res!155750 () Bool)

(assert (=> b!187043 (=> res!155750 e!129354)))

(assert (=> b!187043 (= res!155750 (not (isPrefixOf!0 (_2!8732 lt!289392) (_2!8732 lt!289389))))))

(declare-fun b!187044 () Bool)

(declare-fun res!155758 () Bool)

(assert (=> b!187044 (=> (not res!155758) (not e!129360))))

(assert (=> b!187044 (= res!155758 (= (_1!8733 lt!289379) (withMovedBitIndex!0 (_2!8733 lt!289379) (bvsub lt!289393 lt!289384))))))

(declare-fun b!187045 () Bool)

(assert (=> b!187045 (= e!129357 (invariant!0 (currentBit!9054 thiss!1204) (currentByte!9059 thiss!1204) (size!4337 (buf!4803 (_2!8732 lt!289389)))))))

(declare-fun b!187046 () Bool)

(declare-fun moveBitIndexPrecond!0 (BitStream!7782 (_ BitVec 64)) Bool)

(assert (=> b!187046 (= e!129362 (moveBitIndexPrecond!0 (_1!8733 lt!289373) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!187046 e!129360))

(declare-fun res!155749 () Bool)

(assert (=> b!187046 (=> (not res!155749) (not e!129360))))

(declare-fun lt!289376 () tuple2!16178)

(assert (=> b!187046 (= res!155749 (and (= (_2!8734 lt!289380) (_2!8734 lt!289376)) (= (_1!8734 lt!289380) (_1!8734 lt!289376))))))

(declare-fun lt!289386 () Unit!13369)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7782 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13369)

(assert (=> b!187046 (= lt!289386 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8733 lt!289373) nBits!348 i!590 lt!289391))))

(assert (=> b!187046 (= lt!289376 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8733 lt!289373) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!289387))))

(declare-fun b!187047 () Bool)

(assert (=> b!187047 (= e!129355 e!129364)))

(declare-fun res!155753 () Bool)

(assert (=> b!187047 (=> (not res!155753) (not e!129364))))

(assert (=> b!187047 (= res!155753 (validate_offset_bits!1 ((_ sign_extend 32) (size!4337 (buf!4803 thiss!1204))) ((_ sign_extend 32) (currentByte!9059 thiss!1204)) ((_ sign_extend 32) (currentBit!9054 thiss!1204)) lt!289374))))

(assert (=> b!187047 (= lt!289374 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(assert (= (and start!40660 res!155747) b!187047))

(assert (= (and b!187047 res!155753) b!187040))

(assert (= (and b!187040 res!155763) b!187030))

(assert (= (and b!187030 res!155756) b!187037))

(assert (= (and b!187037 res!155757) b!187038))

(assert (= (and b!187038 res!155746) b!187042))

(assert (= (and b!187042 res!155745) b!187034))

(assert (= (and b!187034 res!155752) b!187027))

(assert (= (and b!187037 (not res!155759)) b!187028))

(assert (= (and b!187028 (not res!155762)) b!187031))

(assert (= (and b!187031 (not res!155755)) b!187032))

(assert (= (and b!187032 (not res!155754)) b!187043))

(assert (= (and b!187043 (not res!155750)) b!187035))

(assert (= (and b!187035 (not res!155760)) b!187036))

(assert (= (and b!187036 res!155748) b!187045))

(assert (= (and b!187036 res!155751) b!187041))

(assert (= (and b!187036 (not res!155761)) b!187046))

(assert (= (and b!187046 res!155749) b!187039))

(assert (= (and b!187039 res!155764) b!187044))

(assert (= (and b!187044 res!155758) b!187029))

(assert (= start!40660 b!187033))

(declare-fun m!290769 () Bool)

(assert (=> b!187028 m!290769))

(declare-fun m!290771 () Bool)

(assert (=> b!187028 m!290771))

(declare-fun m!290773 () Bool)

(assert (=> b!187028 m!290773))

(declare-fun m!290775 () Bool)

(assert (=> b!187028 m!290775))

(declare-fun m!290777 () Bool)

(assert (=> b!187046 m!290777))

(declare-fun m!290779 () Bool)

(assert (=> b!187046 m!290779))

(declare-fun m!290781 () Bool)

(assert (=> b!187046 m!290781))

(assert (=> b!187046 m!290781))

(declare-fun m!290783 () Bool)

(assert (=> b!187046 m!290783))

(declare-fun m!290785 () Bool)

(assert (=> b!187043 m!290785))

(declare-fun m!290787 () Bool)

(assert (=> b!187039 m!290787))

(declare-fun m!290789 () Bool)

(assert (=> start!40660 m!290789))

(declare-fun m!290791 () Bool)

(assert (=> b!187040 m!290791))

(declare-fun m!290793 () Bool)

(assert (=> b!187034 m!290793))

(assert (=> b!187034 m!290793))

(declare-fun m!290795 () Bool)

(assert (=> b!187034 m!290795))

(declare-fun m!290797 () Bool)

(assert (=> b!187044 m!290797))

(declare-fun m!290799 () Bool)

(assert (=> b!187037 m!290799))

(declare-fun m!290801 () Bool)

(assert (=> b!187037 m!290801))

(declare-fun m!290803 () Bool)

(assert (=> b!187037 m!290803))

(declare-fun m!290805 () Bool)

(assert (=> b!187033 m!290805))

(declare-fun m!290807 () Bool)

(assert (=> b!187042 m!290807))

(assert (=> b!187038 m!290799))

(assert (=> b!187038 m!290801))

(declare-fun m!290809 () Bool)

(assert (=> b!187045 m!290809))

(declare-fun m!290811 () Bool)

(assert (=> b!187027 m!290811))

(declare-fun m!290813 () Bool)

(assert (=> b!187036 m!290813))

(declare-fun m!290815 () Bool)

(assert (=> b!187036 m!290815))

(declare-fun m!290817 () Bool)

(assert (=> b!187036 m!290817))

(declare-fun m!290819 () Bool)

(assert (=> b!187036 m!290819))

(declare-fun m!290821 () Bool)

(assert (=> b!187036 m!290821))

(declare-fun m!290823 () Bool)

(assert (=> b!187036 m!290823))

(declare-fun m!290825 () Bool)

(assert (=> b!187036 m!290825))

(declare-fun m!290827 () Bool)

(assert (=> b!187036 m!290827))

(declare-fun m!290829 () Bool)

(assert (=> b!187036 m!290829))

(declare-fun m!290831 () Bool)

(assert (=> b!187036 m!290831))

(declare-fun m!290833 () Bool)

(assert (=> b!187036 m!290833))

(declare-fun m!290835 () Bool)

(assert (=> b!187036 m!290835))

(declare-fun m!290837 () Bool)

(assert (=> b!187036 m!290837))

(declare-fun m!290839 () Bool)

(assert (=> b!187036 m!290839))

(declare-fun m!290841 () Bool)

(assert (=> b!187036 m!290841))

(declare-fun m!290843 () Bool)

(assert (=> b!187036 m!290843))

(assert (=> b!187035 m!290807))

(declare-fun m!290845 () Bool)

(assert (=> b!187047 m!290845))

(declare-fun m!290847 () Bool)

(assert (=> b!187031 m!290847))

(check-sat (not b!187033) (not b!187044) (not b!187043) (not b!187036) (not b!187039) (not b!187035) (not b!187031) (not b!187028) (not b!187037) (not start!40660) (not b!187042) (not b!187040) (not b!187034) (not b!187045) (not b!187046) (not b!187038) (not b!187047) (not b!187027))
(check-sat)
(get-model)

