; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44814 () Bool)

(assert start!44814)

(declare-fun b!214769 () Bool)

(declare-fun e!146179 () Bool)

(declare-fun e!146186 () Bool)

(assert (=> b!214769 (= e!146179 e!146186)))

(declare-fun res!180605 () Bool)

(assert (=> b!214769 (=> res!180605 e!146186)))

(declare-datatypes ((array!10577 0))(
  ( (array!10578 (arr!5575 (Array (_ BitVec 32) (_ BitVec 8))) (size!4645 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8398 0))(
  ( (BitStream!8399 (buf!5180 array!10577) (currentByte!9758 (_ BitVec 32)) (currentBit!9753 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!18386 0))(
  ( (tuple2!18387 (_1!9848 BitStream!8398) (_2!9848 BitStream!8398)) )
))
(declare-fun lt!339363 () tuple2!18386)

(declare-fun lt!339358 () BitStream!8398)

(assert (=> b!214769 (= res!180605 (not (= (_1!9848 lt!339363) lt!339358)))))

(declare-fun e!146181 () Bool)

(assert (=> b!214769 e!146181))

(declare-fun res!180600 () Bool)

(assert (=> b!214769 (=> (not res!180600) (not e!146181))))

(declare-datatypes ((tuple2!18388 0))(
  ( (tuple2!18389 (_1!9849 BitStream!8398) (_2!9849 (_ BitVec 64))) )
))
(declare-fun lt!339353 () tuple2!18388)

(declare-fun lt!339346 () tuple2!18388)

(assert (=> b!214769 (= res!180600 (and (= (_2!9849 lt!339353) (_2!9849 lt!339346)) (= (_1!9849 lt!339353) (_1!9849 lt!339346))))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun lt!339361 () tuple2!18386)

(declare-fun lt!339343 () (_ BitVec 64))

(declare-datatypes ((Unit!15274 0))(
  ( (Unit!15275) )
))
(declare-fun lt!339364 () Unit!15274)

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8398 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!15274)

(assert (=> b!214769 (= lt!339364 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9848 lt!339361) nBits!348 i!590 lt!339343))))

(declare-fun lt!339370 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8398 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18388)

(assert (=> b!214769 (= lt!339346 (readNBitsLSBFirstsLoopPure!0 lt!339358 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!339370))))

(declare-fun withMovedBitIndex!0 (BitStream!8398 (_ BitVec 64)) BitStream!8398)

(assert (=> b!214769 (= lt!339358 (withMovedBitIndex!0 (_1!9848 lt!339361) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!214770 () Bool)

(declare-fun res!180592 () Bool)

(declare-fun e!146187 () Bool)

(assert (=> b!214770 (=> (not res!180592) (not e!146187))))

(declare-fun thiss!1204 () BitStream!8398)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!214770 (= res!180592 (invariant!0 (currentBit!9753 thiss!1204) (currentByte!9758 thiss!1204) (size!4645 (buf!5180 thiss!1204))))))

(declare-fun b!214771 () Bool)

(declare-fun e!146182 () Bool)

(declare-datatypes ((tuple2!18390 0))(
  ( (tuple2!18391 (_1!9850 BitStream!8398) (_2!9850 Bool)) )
))
(declare-fun lt!339347 () tuple2!18390)

(declare-fun lt!339344 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!214771 (= e!146182 (= (bitIndex!0 (size!4645 (buf!5180 (_1!9850 lt!339347))) (currentByte!9758 (_1!9850 lt!339347)) (currentBit!9753 (_1!9850 lt!339347))) lt!339344))))

(declare-fun b!214772 () Bool)

(declare-fun res!180609 () Bool)

(declare-fun e!146184 () Bool)

(assert (=> b!214772 (=> res!180609 e!146184)))

(declare-datatypes ((tuple2!18392 0))(
  ( (tuple2!18393 (_1!9851 Unit!15274) (_2!9851 BitStream!8398)) )
))
(declare-fun lt!339354 () tuple2!18392)

(declare-fun lt!339355 () (_ BitVec 64))

(declare-fun lt!339359 () (_ BitVec 64))

(assert (=> b!214772 (= res!180609 (or (not (= (size!4645 (buf!5180 (_2!9851 lt!339354))) (size!4645 (buf!5180 thiss!1204)))) (not (= lt!339359 (bvsub (bvadd lt!339355 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!214773 () Bool)

(assert (=> b!214773 (= e!146184 e!146179)))

(declare-fun res!180602 () Bool)

(assert (=> b!214773 (=> res!180602 e!146179)))

(declare-fun lt!339362 () tuple2!18388)

(assert (=> b!214773 (= res!180602 (not (= (_1!9849 lt!339362) (_2!9848 lt!339363))))))

(assert (=> b!214773 (= lt!339362 (readNBitsLSBFirstsLoopPure!0 (_1!9848 lt!339363) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!339370))))

(declare-fun lt!339368 () tuple2!18392)

(declare-fun lt!339365 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!214773 (validate_offset_bits!1 ((_ sign_extend 32) (size!4645 (buf!5180 (_2!9851 lt!339354)))) ((_ sign_extend 32) (currentByte!9758 (_2!9851 lt!339368))) ((_ sign_extend 32) (currentBit!9753 (_2!9851 lt!339368))) lt!339365)))

(declare-fun lt!339351 () Unit!15274)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8398 array!10577 (_ BitVec 64)) Unit!15274)

(assert (=> b!214773 (= lt!339351 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9851 lt!339368) (buf!5180 (_2!9851 lt!339354)) lt!339365))))

(assert (=> b!214773 (= lt!339365 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!339367 () tuple2!18390)

(declare-fun lt!339349 () (_ BitVec 64))

(assert (=> b!214773 (= lt!339370 (bvor lt!339343 (ite (_2!9850 lt!339367) lt!339349 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!214773 (= lt!339353 (readNBitsLSBFirstsLoopPure!0 (_1!9848 lt!339361) nBits!348 i!590 lt!339343))))

(declare-fun lt!339360 () (_ BitVec 64))

(assert (=> b!214773 (validate_offset_bits!1 ((_ sign_extend 32) (size!4645 (buf!5180 (_2!9851 lt!339354)))) ((_ sign_extend 32) (currentByte!9758 thiss!1204)) ((_ sign_extend 32) (currentBit!9753 thiss!1204)) lt!339360)))

(declare-fun lt!339357 () Unit!15274)

(assert (=> b!214773 (= lt!339357 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5180 (_2!9851 lt!339354)) lt!339360))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!214773 (= lt!339343 (bvand v!189 (onesLSBLong!0 i!590)))))

(declare-fun lt!339369 () Bool)

(assert (=> b!214773 (= (_2!9850 lt!339367) lt!339369)))

(declare-fun readBitPure!0 (BitStream!8398) tuple2!18390)

(assert (=> b!214773 (= lt!339367 (readBitPure!0 (_1!9848 lt!339361)))))

(declare-fun reader!0 (BitStream!8398 BitStream!8398) tuple2!18386)

(assert (=> b!214773 (= lt!339363 (reader!0 (_2!9851 lt!339368) (_2!9851 lt!339354)))))

(assert (=> b!214773 (= lt!339361 (reader!0 thiss!1204 (_2!9851 lt!339354)))))

(declare-fun e!146174 () Bool)

(assert (=> b!214773 e!146174))

(declare-fun res!180607 () Bool)

(assert (=> b!214773 (=> (not res!180607) (not e!146174))))

(declare-fun lt!339352 () tuple2!18390)

(declare-fun lt!339366 () tuple2!18390)

(assert (=> b!214773 (= res!180607 (= (bitIndex!0 (size!4645 (buf!5180 (_1!9850 lt!339352))) (currentByte!9758 (_1!9850 lt!339352)) (currentBit!9753 (_1!9850 lt!339352))) (bitIndex!0 (size!4645 (buf!5180 (_1!9850 lt!339366))) (currentByte!9758 (_1!9850 lt!339366)) (currentBit!9753 (_1!9850 lt!339366)))))))

(declare-fun lt!339371 () Unit!15274)

(declare-fun lt!339356 () BitStream!8398)

(declare-fun readBitPrefixLemma!0 (BitStream!8398 BitStream!8398) Unit!15274)

(assert (=> b!214773 (= lt!339371 (readBitPrefixLemma!0 lt!339356 (_2!9851 lt!339354)))))

(assert (=> b!214773 (= lt!339366 (readBitPure!0 (BitStream!8399 (buf!5180 (_2!9851 lt!339354)) (currentByte!9758 thiss!1204) (currentBit!9753 thiss!1204))))))

(assert (=> b!214773 (= lt!339352 (readBitPure!0 lt!339356))))

(declare-fun e!146183 () Bool)

(assert (=> b!214773 e!146183))

(declare-fun res!180596 () Bool)

(assert (=> b!214773 (=> (not res!180596) (not e!146183))))

(assert (=> b!214773 (= res!180596 (invariant!0 (currentBit!9753 thiss!1204) (currentByte!9758 thiss!1204) (size!4645 (buf!5180 (_2!9851 lt!339368)))))))

(assert (=> b!214773 (= lt!339356 (BitStream!8399 (buf!5180 (_2!9851 lt!339368)) (currentByte!9758 thiss!1204) (currentBit!9753 thiss!1204)))))

(declare-fun b!214774 () Bool)

(assert (=> b!214774 (= e!146186 true)))

(assert (=> b!214774 (= (size!4645 (buf!5180 thiss!1204)) (size!4645 (buf!5180 (_2!9851 lt!339354))))))

(declare-fun b!214775 () Bool)

(declare-fun res!180608 () Bool)

(declare-fun e!146180 () Bool)

(assert (=> b!214775 (=> (not res!180608) (not e!146180))))

(declare-fun isPrefixOf!0 (BitStream!8398 BitStream!8398) Bool)

(assert (=> b!214775 (= res!180608 (isPrefixOf!0 thiss!1204 (_2!9851 lt!339368)))))

(declare-fun b!214776 () Bool)

(declare-fun e!146178 () Bool)

(assert (=> b!214776 (= e!146187 (not e!146178))))

(declare-fun res!180604 () Bool)

(assert (=> b!214776 (=> res!180604 e!146178)))

(declare-fun lt!339348 () (_ BitVec 64))

(assert (=> b!214776 (= res!180604 (not (= lt!339348 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!339355))))))

(assert (=> b!214776 (= lt!339348 (bitIndex!0 (size!4645 (buf!5180 (_2!9851 lt!339368))) (currentByte!9758 (_2!9851 lt!339368)) (currentBit!9753 (_2!9851 lt!339368))))))

(assert (=> b!214776 (= lt!339355 (bitIndex!0 (size!4645 (buf!5180 thiss!1204)) (currentByte!9758 thiss!1204) (currentBit!9753 thiss!1204)))))

(declare-fun e!146176 () Bool)

(assert (=> b!214776 e!146176))

(declare-fun res!180599 () Bool)

(assert (=> b!214776 (=> (not res!180599) (not e!146176))))

(assert (=> b!214776 (= res!180599 (= (size!4645 (buf!5180 thiss!1204)) (size!4645 (buf!5180 (_2!9851 lt!339368)))))))

(declare-fun appendBit!0 (BitStream!8398 Bool) tuple2!18392)

(assert (=> b!214776 (= lt!339368 (appendBit!0 thiss!1204 lt!339369))))

(assert (=> b!214776 (= lt!339369 (not (= (bvand v!189 lt!339349) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!214776 (= lt!339349 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!214777 () Bool)

(assert (=> b!214777 (= e!146174 (= (_2!9850 lt!339352) (_2!9850 lt!339366)))))

(declare-fun b!214778 () Bool)

(declare-fun res!180593 () Bool)

(assert (=> b!214778 (=> res!180593 e!146186)))

(assert (=> b!214778 (= res!180593 (not (= (bitIndex!0 (size!4645 (buf!5180 (_1!9849 lt!339353))) (currentByte!9758 (_1!9849 lt!339353)) (currentBit!9753 (_1!9849 lt!339353))) (bitIndex!0 (size!4645 (buf!5180 (_2!9848 lt!339361))) (currentByte!9758 (_2!9848 lt!339361)) (currentBit!9753 (_2!9848 lt!339361))))))))

(declare-fun b!214779 () Bool)

(declare-fun res!180601 () Bool)

(assert (=> b!214779 (=> (not res!180601) (not e!146187))))

(assert (=> b!214779 (= res!180601 (not (= i!590 nBits!348)))))

(declare-fun b!214780 () Bool)

(declare-fun res!180606 () Bool)

(assert (=> b!214780 (=> res!180606 e!146184)))

(assert (=> b!214780 (= res!180606 (not (isPrefixOf!0 (_2!9851 lt!339368) (_2!9851 lt!339354))))))

(declare-fun b!214781 () Bool)

(assert (=> b!214781 (= e!146180 e!146182)))

(declare-fun res!180603 () Bool)

(assert (=> b!214781 (=> (not res!180603) (not e!146182))))

(assert (=> b!214781 (= res!180603 (and (= (_2!9850 lt!339347) lt!339369) (= (_1!9850 lt!339347) (_2!9851 lt!339368))))))

(declare-fun readerFrom!0 (BitStream!8398 (_ BitVec 32) (_ BitVec 32)) BitStream!8398)

(assert (=> b!214781 (= lt!339347 (readBitPure!0 (readerFrom!0 (_2!9851 lt!339368) (currentBit!9753 thiss!1204) (currentByte!9758 thiss!1204))))))

(declare-fun b!214782 () Bool)

(assert (=> b!214782 (= e!146178 e!146184)))

(declare-fun res!180598 () Bool)

(assert (=> b!214782 (=> res!180598 e!146184)))

(assert (=> b!214782 (= res!180598 (not (= lt!339359 (bvsub (bvsub (bvadd lt!339348 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!214782 (= lt!339359 (bitIndex!0 (size!4645 (buf!5180 (_2!9851 lt!339354))) (currentByte!9758 (_2!9851 lt!339354)) (currentBit!9753 (_2!9851 lt!339354))))))

(assert (=> b!214782 (isPrefixOf!0 thiss!1204 (_2!9851 lt!339354))))

(declare-fun lt!339345 () Unit!15274)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8398 BitStream!8398 BitStream!8398) Unit!15274)

(assert (=> b!214782 (= lt!339345 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9851 lt!339368) (_2!9851 lt!339354)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8398 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!18392)

(assert (=> b!214782 (= lt!339354 (appendBitsLSBFirstLoopTR!0 (_2!9851 lt!339368) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun res!180594 () Bool)

(declare-fun e!146177 () Bool)

(assert (=> start!44814 (=> (not res!180594) (not e!146177))))

(assert (=> start!44814 (= res!180594 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!44814 e!146177))

(assert (=> start!44814 true))

(declare-fun e!146185 () Bool)

(declare-fun inv!12 (BitStream!8398) Bool)

(assert (=> start!44814 (and (inv!12 thiss!1204) e!146185)))

(declare-fun b!214783 () Bool)

(declare-fun array_inv!4386 (array!10577) Bool)

(assert (=> b!214783 (= e!146185 (array_inv!4386 (buf!5180 thiss!1204)))))

(declare-fun b!214784 () Bool)

(assert (=> b!214784 (= e!146177 e!146187)))

(declare-fun res!180595 () Bool)

(assert (=> b!214784 (=> (not res!180595) (not e!146187))))

(assert (=> b!214784 (= res!180595 (validate_offset_bits!1 ((_ sign_extend 32) (size!4645 (buf!5180 thiss!1204))) ((_ sign_extend 32) (currentByte!9758 thiss!1204)) ((_ sign_extend 32) (currentBit!9753 thiss!1204)) lt!339360))))

(assert (=> b!214784 (= lt!339360 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!214785 () Bool)

(declare-fun res!180590 () Bool)

(assert (=> b!214785 (=> (not res!180590) (not e!146181))))

(assert (=> b!214785 (= res!180590 (= (_1!9848 lt!339363) (withMovedBitIndex!0 (_2!9848 lt!339363) (bvsub lt!339348 lt!339359))))))

(declare-fun b!214786 () Bool)

(declare-fun res!180591 () Bool)

(assert (=> b!214786 (=> res!180591 e!146184)))

(assert (=> b!214786 (= res!180591 (not (isPrefixOf!0 thiss!1204 (_2!9851 lt!339368))))))

(declare-fun b!214787 () Bool)

(assert (=> b!214787 (= e!146183 (invariant!0 (currentBit!9753 thiss!1204) (currentByte!9758 thiss!1204) (size!4645 (buf!5180 (_2!9851 lt!339354)))))))

(declare-fun b!214788 () Bool)

(assert (=> b!214788 (= e!146181 (and (= lt!339355 (bvsub lt!339348 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!9848 lt!339363) lt!339358)) (= (_2!9849 lt!339353) (_2!9849 lt!339362)))))))

(declare-fun b!214789 () Bool)

(assert (=> b!214789 (= e!146176 e!146180)))

(declare-fun res!180610 () Bool)

(assert (=> b!214789 (=> (not res!180610) (not e!146180))))

(declare-fun lt!339350 () (_ BitVec 64))

(assert (=> b!214789 (= res!180610 (= lt!339344 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!339350)))))

(assert (=> b!214789 (= lt!339344 (bitIndex!0 (size!4645 (buf!5180 (_2!9851 lt!339368))) (currentByte!9758 (_2!9851 lt!339368)) (currentBit!9753 (_2!9851 lt!339368))))))

(assert (=> b!214789 (= lt!339350 (bitIndex!0 (size!4645 (buf!5180 thiss!1204)) (currentByte!9758 thiss!1204) (currentBit!9753 thiss!1204)))))

(declare-fun b!214790 () Bool)

(declare-fun res!180611 () Bool)

(assert (=> b!214790 (=> res!180611 e!146184)))

(assert (=> b!214790 (= res!180611 (not (invariant!0 (currentBit!9753 (_2!9851 lt!339354)) (currentByte!9758 (_2!9851 lt!339354)) (size!4645 (buf!5180 (_2!9851 lt!339354))))))))

(declare-fun b!214791 () Bool)

(declare-fun res!180597 () Bool)

(assert (=> b!214791 (=> (not res!180597) (not e!146181))))

(assert (=> b!214791 (= res!180597 (= (_1!9848 lt!339361) (withMovedBitIndex!0 (_2!9848 lt!339361) (bvsub lt!339355 lt!339359))))))

(assert (= (and start!44814 res!180594) b!214784))

(assert (= (and b!214784 res!180595) b!214770))

(assert (= (and b!214770 res!180592) b!214779))

(assert (= (and b!214779 res!180601) b!214776))

(assert (= (and b!214776 res!180599) b!214789))

(assert (= (and b!214789 res!180610) b!214775))

(assert (= (and b!214775 res!180608) b!214781))

(assert (= (and b!214781 res!180603) b!214771))

(assert (= (and b!214776 (not res!180604)) b!214782))

(assert (= (and b!214782 (not res!180598)) b!214790))

(assert (= (and b!214790 (not res!180611)) b!214772))

(assert (= (and b!214772 (not res!180609)) b!214780))

(assert (= (and b!214780 (not res!180606)) b!214786))

(assert (= (and b!214786 (not res!180591)) b!214773))

(assert (= (and b!214773 res!180596) b!214787))

(assert (= (and b!214773 res!180607) b!214777))

(assert (= (and b!214773 (not res!180602)) b!214769))

(assert (= (and b!214769 res!180600) b!214791))

(assert (= (and b!214791 res!180597) b!214785))

(assert (= (and b!214785 res!180590) b!214788))

(assert (= (and b!214769 (not res!180605)) b!214778))

(assert (= (and b!214778 (not res!180593)) b!214774))

(assert (= start!44814 b!214783))

(declare-fun m!330885 () Bool)

(assert (=> b!214773 m!330885))

(declare-fun m!330887 () Bool)

(assert (=> b!214773 m!330887))

(declare-fun m!330889 () Bool)

(assert (=> b!214773 m!330889))

(declare-fun m!330891 () Bool)

(assert (=> b!214773 m!330891))

(declare-fun m!330893 () Bool)

(assert (=> b!214773 m!330893))

(declare-fun m!330895 () Bool)

(assert (=> b!214773 m!330895))

(declare-fun m!330897 () Bool)

(assert (=> b!214773 m!330897))

(declare-fun m!330899 () Bool)

(assert (=> b!214773 m!330899))

(declare-fun m!330901 () Bool)

(assert (=> b!214773 m!330901))

(declare-fun m!330903 () Bool)

(assert (=> b!214773 m!330903))

(declare-fun m!330905 () Bool)

(assert (=> b!214773 m!330905))

(declare-fun m!330907 () Bool)

(assert (=> b!214773 m!330907))

(declare-fun m!330909 () Bool)

(assert (=> b!214773 m!330909))

(declare-fun m!330911 () Bool)

(assert (=> b!214773 m!330911))

(declare-fun m!330913 () Bool)

(assert (=> b!214773 m!330913))

(declare-fun m!330915 () Bool)

(assert (=> b!214773 m!330915))

(declare-fun m!330917 () Bool)

(assert (=> b!214781 m!330917))

(assert (=> b!214781 m!330917))

(declare-fun m!330919 () Bool)

(assert (=> b!214781 m!330919))

(declare-fun m!330921 () Bool)

(assert (=> b!214790 m!330921))

(declare-fun m!330923 () Bool)

(assert (=> b!214783 m!330923))

(declare-fun m!330925 () Bool)

(assert (=> b!214771 m!330925))

(declare-fun m!330927 () Bool)

(assert (=> b!214770 m!330927))

(declare-fun m!330929 () Bool)

(assert (=> b!214786 m!330929))

(assert (=> b!214775 m!330929))

(declare-fun m!330931 () Bool)

(assert (=> b!214776 m!330931))

(declare-fun m!330933 () Bool)

(assert (=> b!214776 m!330933))

(declare-fun m!330935 () Bool)

(assert (=> b!214776 m!330935))

(declare-fun m!330937 () Bool)

(assert (=> b!214791 m!330937))

(declare-fun m!330939 () Bool)

(assert (=> b!214780 m!330939))

(assert (=> b!214789 m!330931))

(assert (=> b!214789 m!330933))

(declare-fun m!330941 () Bool)

(assert (=> b!214787 m!330941))

(declare-fun m!330943 () Bool)

(assert (=> b!214769 m!330943))

(declare-fun m!330945 () Bool)

(assert (=> b!214769 m!330945))

(declare-fun m!330947 () Bool)

(assert (=> b!214769 m!330947))

(declare-fun m!330949 () Bool)

(assert (=> b!214785 m!330949))

(declare-fun m!330951 () Bool)

(assert (=> b!214778 m!330951))

(declare-fun m!330953 () Bool)

(assert (=> b!214778 m!330953))

(declare-fun m!330955 () Bool)

(assert (=> b!214784 m!330955))

(declare-fun m!330957 () Bool)

(assert (=> b!214782 m!330957))

(declare-fun m!330959 () Bool)

(assert (=> b!214782 m!330959))

(declare-fun m!330961 () Bool)

(assert (=> b!214782 m!330961))

(declare-fun m!330963 () Bool)

(assert (=> b!214782 m!330963))

(declare-fun m!330965 () Bool)

(assert (=> start!44814 m!330965))

(push 1)

(assert (not start!44814))

(assert (not b!214778))

(assert (not b!214769))

(assert (not b!214790))

(assert (not b!214784))

(assert (not b!214786))

(assert (not b!214771))

(assert (not b!214782))

(assert (not b!214775))

(assert (not b!214789))

(assert (not b!214787))

(assert (not b!214773))

(assert (not b!214776))

(assert (not b!214785))

(assert (not b!214783))

(assert (not b!214780))

(assert (not b!214781))

(assert (not b!214770))

(assert (not b!214791))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

