; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45030 () Bool)

(assert start!45030)

(declare-fun lt!342776 () (_ BitVec 64))

(declare-fun lt!342779 () (_ BitVec 64))

(declare-fun e!147437 () Bool)

(declare-fun b!216764 () Bool)

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!216764 (= e!147437 (or (not (= lt!342776 (bvand ((_ sign_extend 32) nBits!348) #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!342776 (bvand lt!342779 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!342769 () (_ BitVec 64))

(assert (=> b!216764 (= lt!342776 (bvand lt!342769 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!147446 () Bool)

(assert (=> b!216764 e!147446))

(declare-fun res!182355 () Bool)

(assert (=> b!216764 (=> (not res!182355) (not e!147446))))

(declare-datatypes ((array!10604 0))(
  ( (array!10605 (arr!5587 (Array (_ BitVec 32) (_ BitVec 8))) (size!4657 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8422 0))(
  ( (BitStream!8423 (buf!5198 array!10604) (currentByte!9785 (_ BitVec 32)) (currentBit!9780 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8422)

(declare-datatypes ((Unit!15433 0))(
  ( (Unit!15434) )
))
(declare-datatypes ((tuple2!18494 0))(
  ( (tuple2!18495 (_1!9905 Unit!15433) (_2!9905 BitStream!8422)) )
))
(declare-fun lt!342780 () tuple2!18494)

(assert (=> b!216764 (= res!182355 (= (size!4657 (buf!5198 thiss!1204)) (size!4657 (buf!5198 (_2!9905 lt!342780)))))))

(declare-fun b!216765 () Bool)

(declare-fun e!147438 () Bool)

(declare-datatypes ((tuple2!18496 0))(
  ( (tuple2!18497 (_1!9906 BitStream!8422) (_2!9906 Bool)) )
))
(declare-fun lt!342774 () tuple2!18496)

(declare-fun lt!342770 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!216765 (= e!147438 (= (bitIndex!0 (size!4657 (buf!5198 (_1!9906 lt!342774))) (currentByte!9785 (_1!9906 lt!342774)) (currentBit!9780 (_1!9906 lt!342774))) lt!342770))))

(declare-fun b!216766 () Bool)

(declare-fun res!182378 () Bool)

(declare-fun e!147434 () Bool)

(assert (=> b!216766 (=> res!182378 e!147434)))

(assert (=> b!216766 (= res!182378 (not (= (size!4657 (buf!5198 (_2!9905 lt!342780))) (size!4657 (buf!5198 thiss!1204)))))))

(declare-fun b!216767 () Bool)

(declare-fun e!147444 () Bool)

(declare-fun e!147439 () Bool)

(assert (=> b!216767 (= e!147444 e!147439)))

(declare-fun res!182372 () Bool)

(assert (=> b!216767 (=> (not res!182372) (not e!147439))))

(declare-fun lt!342793 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!216767 (= res!182372 (validate_offset_bits!1 ((_ sign_extend 32) (size!4657 (buf!5198 thiss!1204))) ((_ sign_extend 32) (currentByte!9785 thiss!1204)) ((_ sign_extend 32) (currentBit!9780 thiss!1204)) lt!342793))))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!216767 (= lt!342793 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!216768 () Bool)

(declare-fun res!182363 () Bool)

(declare-fun e!147440 () Bool)

(assert (=> b!216768 (=> (not res!182363) (not e!147440))))

(declare-fun lt!342775 () tuple2!18494)

(declare-fun isPrefixOf!0 (BitStream!8422 BitStream!8422) Bool)

(assert (=> b!216768 (= res!182363 (isPrefixOf!0 thiss!1204 (_2!9905 lt!342775)))))

(declare-fun b!216769 () Bool)

(declare-fun res!182359 () Bool)

(declare-fun e!147442 () Bool)

(assert (=> b!216769 (=> (not res!182359) (not e!147442))))

(declare-fun lt!342796 () (_ BitVec 64))

(declare-datatypes ((tuple2!18498 0))(
  ( (tuple2!18499 (_1!9907 BitStream!8422) (_2!9907 BitStream!8422)) )
))
(declare-fun lt!342784 () tuple2!18498)

(declare-fun withMovedBitIndex!0 (BitStream!8422 (_ BitVec 64)) BitStream!8422)

(assert (=> b!216769 (= res!182359 (= (_1!9907 lt!342784) (withMovedBitIndex!0 (_2!9907 lt!342784) (bvsub lt!342769 lt!342796))))))

(declare-fun b!216770 () Bool)

(declare-fun e!147443 () Bool)

(assert (=> b!216770 (= e!147434 e!147443)))

(declare-fun res!182373 () Bool)

(assert (=> b!216770 (=> res!182373 e!147443)))

(assert (=> b!216770 (= res!182373 (not (= lt!342796 (bvsub lt!342779 ((_ sign_extend 32) i!590)))))))

(assert (=> b!216770 (= lt!342779 (bvadd lt!342769 ((_ sign_extend 32) nBits!348)))))

(declare-fun b!216771 () Bool)

(assert (=> b!216771 (= e!147440 e!147438)))

(declare-fun res!182370 () Bool)

(assert (=> b!216771 (=> (not res!182370) (not e!147438))))

(declare-fun lt!342791 () Bool)

(assert (=> b!216771 (= res!182370 (and (= (_2!9906 lt!342774) lt!342791) (= (_1!9906 lt!342774) (_2!9905 lt!342775))))))

(declare-fun readBitPure!0 (BitStream!8422) tuple2!18496)

(declare-fun readerFrom!0 (BitStream!8422 (_ BitVec 32) (_ BitVec 32)) BitStream!8422)

(assert (=> b!216771 (= lt!342774 (readBitPure!0 (readerFrom!0 (_2!9905 lt!342775) (currentBit!9780 thiss!1204) (currentByte!9785 thiss!1204))))))

(declare-fun b!216772 () Bool)

(declare-datatypes ((tuple2!18500 0))(
  ( (tuple2!18501 (_1!9908 BitStream!8422) (_2!9908 (_ BitVec 64))) )
))
(declare-fun lt!342787 () tuple2!18500)

(assert (=> b!216772 (= e!147446 (= (_1!9908 lt!342787) (_2!9907 lt!342784)))))

(declare-fun b!216773 () Bool)

(declare-fun res!182368 () Bool)

(assert (=> b!216773 (=> (not res!182368) (not e!147439))))

(assert (=> b!216773 (= res!182368 (not (= i!590 nBits!348)))))

(declare-fun res!182365 () Bool)

(assert (=> start!45030 (=> (not res!182365) (not e!147444))))

(assert (=> start!45030 (= res!182365 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!45030 e!147444))

(assert (=> start!45030 true))

(declare-fun e!147447 () Bool)

(declare-fun inv!12 (BitStream!8422) Bool)

(assert (=> start!45030 (and (inv!12 thiss!1204) e!147447)))

(declare-fun b!216774 () Bool)

(declare-fun e!147435 () Bool)

(assert (=> b!216774 (= e!147435 e!147434)))

(declare-fun res!182358 () Bool)

(assert (=> b!216774 (=> res!182358 e!147434)))

(declare-fun lt!342786 () (_ BitVec 64))

(assert (=> b!216774 (= res!182358 (not (= lt!342796 (bvsub (bvsub (bvadd lt!342786 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!216774 (= lt!342796 (bitIndex!0 (size!4657 (buf!5198 (_2!9905 lt!342780))) (currentByte!9785 (_2!9905 lt!342780)) (currentBit!9780 (_2!9905 lt!342780))))))

(assert (=> b!216774 (isPrefixOf!0 thiss!1204 (_2!9905 lt!342780))))

(declare-fun lt!342789 () Unit!15433)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8422 BitStream!8422 BitStream!8422) Unit!15433)

(assert (=> b!216774 (= lt!342789 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9905 lt!342775) (_2!9905 lt!342780)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8422 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!18494)

(assert (=> b!216774 (= lt!342780 (appendBitsLSBFirstLoopTR!0 (_2!9905 lt!342775) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!216775 () Bool)

(declare-fun e!147436 () Bool)

(assert (=> b!216775 (= e!147436 e!147440)))

(declare-fun res!182362 () Bool)

(assert (=> b!216775 (=> (not res!182362) (not e!147440))))

(declare-fun lt!342768 () (_ BitVec 64))

(assert (=> b!216775 (= res!182362 (= lt!342770 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!342768)))))

(assert (=> b!216775 (= lt!342770 (bitIndex!0 (size!4657 (buf!5198 (_2!9905 lt!342775))) (currentByte!9785 (_2!9905 lt!342775)) (currentBit!9780 (_2!9905 lt!342775))))))

(assert (=> b!216775 (= lt!342768 (bitIndex!0 (size!4657 (buf!5198 thiss!1204)) (currentByte!9785 thiss!1204) (currentBit!9780 thiss!1204)))))

(declare-fun b!216776 () Bool)

(declare-fun e!147433 () Bool)

(declare-fun lt!342772 () tuple2!18496)

(declare-fun lt!342797 () tuple2!18496)

(assert (=> b!216776 (= e!147433 (= (_2!9906 lt!342772) (_2!9906 lt!342797)))))

(declare-fun b!216777 () Bool)

(declare-fun res!182361 () Bool)

(assert (=> b!216777 (=> res!182361 e!147443)))

(assert (=> b!216777 (= res!182361 (not (isPrefixOf!0 thiss!1204 (_2!9905 lt!342775))))))

(declare-fun lt!342792 () tuple2!18500)

(declare-fun b!216778 () Bool)

(declare-fun lt!342773 () BitStream!8422)

(declare-fun lt!342783 () tuple2!18498)

(assert (=> b!216778 (= e!147442 (and (= lt!342769 (bvsub lt!342786 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!9907 lt!342783) lt!342773)) (= (_2!9908 lt!342787) (_2!9908 lt!342792)))))))

(declare-fun b!216779 () Bool)

(declare-fun array_inv!4398 (array!10604) Bool)

(assert (=> b!216779 (= e!147447 (array_inv!4398 (buf!5198 thiss!1204)))))

(declare-fun b!216780 () Bool)

(declare-fun e!147445 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!216780 (= e!147445 (invariant!0 (currentBit!9780 thiss!1204) (currentByte!9785 thiss!1204) (size!4657 (buf!5198 (_2!9905 lt!342780)))))))

(declare-fun b!216781 () Bool)

(declare-fun e!147432 () Bool)

(assert (=> b!216781 (= e!147432 e!147437)))

(declare-fun res!182375 () Bool)

(assert (=> b!216781 (=> res!182375 e!147437)))

(assert (=> b!216781 (= res!182375 (not (= (_1!9907 lt!342783) lt!342773)))))

(assert (=> b!216781 e!147442))

(declare-fun res!182354 () Bool)

(assert (=> b!216781 (=> (not res!182354) (not e!147442))))

(declare-fun lt!342790 () tuple2!18500)

(assert (=> b!216781 (= res!182354 (and (= (_2!9908 lt!342787) (_2!9908 lt!342790)) (= (_1!9908 lt!342787) (_1!9908 lt!342790))))))

(declare-fun lt!342771 () (_ BitVec 64))

(declare-fun lt!342794 () Unit!15433)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8422 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!15433)

(assert (=> b!216781 (= lt!342794 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9907 lt!342784) nBits!348 i!590 lt!342771))))

(declare-fun lt!342778 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8422 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18500)

(assert (=> b!216781 (= lt!342790 (readNBitsLSBFirstsLoopPure!0 lt!342773 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!342778))))

(assert (=> b!216781 (= lt!342773 (withMovedBitIndex!0 (_1!9907 lt!342784) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!216782 () Bool)

(declare-fun res!182376 () Bool)

(assert (=> b!216782 (=> (not res!182376) (not e!147439))))

(assert (=> b!216782 (= res!182376 (invariant!0 (currentBit!9780 thiss!1204) (currentByte!9785 thiss!1204) (size!4657 (buf!5198 thiss!1204))))))

(declare-fun b!216783 () Bool)

(declare-fun res!182367 () Bool)

(assert (=> b!216783 (=> res!182367 e!147434)))

(assert (=> b!216783 (= res!182367 (not (invariant!0 (currentBit!9780 (_2!9905 lt!342780)) (currentByte!9785 (_2!9905 lt!342780)) (size!4657 (buf!5198 (_2!9905 lt!342780))))))))

(declare-fun b!216784 () Bool)

(declare-fun res!182360 () Bool)

(assert (=> b!216784 (=> res!182360 e!147437)))

(assert (=> b!216784 (= res!182360 (not (= (bitIndex!0 (size!4657 (buf!5198 (_1!9908 lt!342787))) (currentByte!9785 (_1!9908 lt!342787)) (currentBit!9780 (_1!9908 lt!342787))) (bitIndex!0 (size!4657 (buf!5198 (_2!9907 lt!342784))) (currentByte!9785 (_2!9907 lt!342784)) (currentBit!9780 (_2!9907 lt!342784))))))))

(declare-fun b!216785 () Bool)

(assert (=> b!216785 (= e!147443 e!147432)))

(declare-fun res!182369 () Bool)

(assert (=> b!216785 (=> res!182369 e!147432)))

(assert (=> b!216785 (= res!182369 (not (= (_1!9908 lt!342792) (_2!9907 lt!342783))))))

(assert (=> b!216785 (= lt!342792 (readNBitsLSBFirstsLoopPure!0 (_1!9907 lt!342783) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!342778))))

(declare-fun lt!342788 () (_ BitVec 64))

(assert (=> b!216785 (validate_offset_bits!1 ((_ sign_extend 32) (size!4657 (buf!5198 (_2!9905 lt!342780)))) ((_ sign_extend 32) (currentByte!9785 (_2!9905 lt!342775))) ((_ sign_extend 32) (currentBit!9780 (_2!9905 lt!342775))) lt!342788)))

(declare-fun lt!342767 () Unit!15433)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8422 array!10604 (_ BitVec 64)) Unit!15433)

(assert (=> b!216785 (= lt!342767 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9905 lt!342775) (buf!5198 (_2!9905 lt!342780)) lt!342788))))

(assert (=> b!216785 (= lt!342788 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!342777 () tuple2!18496)

(declare-fun lt!342782 () (_ BitVec 64))

(assert (=> b!216785 (= lt!342778 (bvor lt!342771 (ite (_2!9906 lt!342777) lt!342782 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!216785 (= lt!342787 (readNBitsLSBFirstsLoopPure!0 (_1!9907 lt!342784) nBits!348 i!590 lt!342771))))

(assert (=> b!216785 (validate_offset_bits!1 ((_ sign_extend 32) (size!4657 (buf!5198 (_2!9905 lt!342780)))) ((_ sign_extend 32) (currentByte!9785 thiss!1204)) ((_ sign_extend 32) (currentBit!9780 thiss!1204)) lt!342793)))

(declare-fun lt!342781 () Unit!15433)

(assert (=> b!216785 (= lt!342781 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5198 (_2!9905 lt!342780)) lt!342793))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!216785 (= lt!342771 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!216785 (= (_2!9906 lt!342777) lt!342791)))

(assert (=> b!216785 (= lt!342777 (readBitPure!0 (_1!9907 lt!342784)))))

(declare-fun reader!0 (BitStream!8422 BitStream!8422) tuple2!18498)

(assert (=> b!216785 (= lt!342783 (reader!0 (_2!9905 lt!342775) (_2!9905 lt!342780)))))

(assert (=> b!216785 (= lt!342784 (reader!0 thiss!1204 (_2!9905 lt!342780)))))

(assert (=> b!216785 e!147433))

(declare-fun res!182366 () Bool)

(assert (=> b!216785 (=> (not res!182366) (not e!147433))))

(assert (=> b!216785 (= res!182366 (= (bitIndex!0 (size!4657 (buf!5198 (_1!9906 lt!342772))) (currentByte!9785 (_1!9906 lt!342772)) (currentBit!9780 (_1!9906 lt!342772))) (bitIndex!0 (size!4657 (buf!5198 (_1!9906 lt!342797))) (currentByte!9785 (_1!9906 lt!342797)) (currentBit!9780 (_1!9906 lt!342797)))))))

(declare-fun lt!342785 () Unit!15433)

(declare-fun lt!342795 () BitStream!8422)

(declare-fun readBitPrefixLemma!0 (BitStream!8422 BitStream!8422) Unit!15433)

(assert (=> b!216785 (= lt!342785 (readBitPrefixLemma!0 lt!342795 (_2!9905 lt!342780)))))

(assert (=> b!216785 (= lt!342797 (readBitPure!0 (BitStream!8423 (buf!5198 (_2!9905 lt!342780)) (currentByte!9785 thiss!1204) (currentBit!9780 thiss!1204))))))

(assert (=> b!216785 (= lt!342772 (readBitPure!0 lt!342795))))

(assert (=> b!216785 e!147445))

(declare-fun res!182364 () Bool)

(assert (=> b!216785 (=> (not res!182364) (not e!147445))))

(assert (=> b!216785 (= res!182364 (invariant!0 (currentBit!9780 thiss!1204) (currentByte!9785 thiss!1204) (size!4657 (buf!5198 (_2!9905 lt!342775)))))))

(assert (=> b!216785 (= lt!342795 (BitStream!8423 (buf!5198 (_2!9905 lt!342775)) (currentByte!9785 thiss!1204) (currentBit!9780 thiss!1204)))))

(declare-fun b!216786 () Bool)

(assert (=> b!216786 (= e!147439 (not e!147435))))

(declare-fun res!182377 () Bool)

(assert (=> b!216786 (=> res!182377 e!147435)))

(assert (=> b!216786 (= res!182377 (not (= lt!342786 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!342769))))))

(assert (=> b!216786 (= lt!342786 (bitIndex!0 (size!4657 (buf!5198 (_2!9905 lt!342775))) (currentByte!9785 (_2!9905 lt!342775)) (currentBit!9780 (_2!9905 lt!342775))))))

(assert (=> b!216786 (= lt!342769 (bitIndex!0 (size!4657 (buf!5198 thiss!1204)) (currentByte!9785 thiss!1204) (currentBit!9780 thiss!1204)))))

(assert (=> b!216786 e!147436))

(declare-fun res!182356 () Bool)

(assert (=> b!216786 (=> (not res!182356) (not e!147436))))

(assert (=> b!216786 (= res!182356 (= (size!4657 (buf!5198 thiss!1204)) (size!4657 (buf!5198 (_2!9905 lt!342775)))))))

(declare-fun appendBit!0 (BitStream!8422 Bool) tuple2!18494)

(assert (=> b!216786 (= lt!342775 (appendBit!0 thiss!1204 lt!342791))))

(assert (=> b!216786 (= lt!342791 (not (= (bvand v!189 lt!342782) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!216786 (= lt!342782 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!216787 () Bool)

(declare-fun res!182374 () Bool)

(assert (=> b!216787 (=> (not res!182374) (not e!147446))))

(assert (=> b!216787 (= res!182374 (= (_2!9908 lt!342787) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun b!216788 () Bool)

(declare-fun res!182371 () Bool)

(assert (=> b!216788 (=> res!182371 e!147443)))

(assert (=> b!216788 (= res!182371 (not (isPrefixOf!0 (_2!9905 lt!342775) (_2!9905 lt!342780))))))

(declare-fun b!216789 () Bool)

(declare-fun res!182357 () Bool)

(assert (=> b!216789 (=> (not res!182357) (not e!147442))))

(assert (=> b!216789 (= res!182357 (= (_1!9907 lt!342783) (withMovedBitIndex!0 (_2!9907 lt!342783) (bvsub lt!342786 lt!342796))))))

(assert (= (and start!45030 res!182365) b!216767))

(assert (= (and b!216767 res!182372) b!216782))

(assert (= (and b!216782 res!182376) b!216773))

(assert (= (and b!216773 res!182368) b!216786))

(assert (= (and b!216786 res!182356) b!216775))

(assert (= (and b!216775 res!182362) b!216768))

(assert (= (and b!216768 res!182363) b!216771))

(assert (= (and b!216771 res!182370) b!216765))

(assert (= (and b!216786 (not res!182377)) b!216774))

(assert (= (and b!216774 (not res!182358)) b!216783))

(assert (= (and b!216783 (not res!182367)) b!216766))

(assert (= (and b!216766 (not res!182378)) b!216770))

(assert (= (and b!216770 (not res!182373)) b!216788))

(assert (= (and b!216788 (not res!182371)) b!216777))

(assert (= (and b!216777 (not res!182361)) b!216785))

(assert (= (and b!216785 res!182364) b!216780))

(assert (= (and b!216785 res!182366) b!216776))

(assert (= (and b!216785 (not res!182369)) b!216781))

(assert (= (and b!216781 res!182354) b!216769))

(assert (= (and b!216769 res!182359) b!216789))

(assert (= (and b!216789 res!182357) b!216778))

(assert (= (and b!216781 (not res!182375)) b!216784))

(assert (= (and b!216784 (not res!182360)) b!216764))

(assert (= (and b!216764 res!182355) b!216787))

(assert (= (and b!216787 res!182374) b!216772))

(assert (= start!45030 b!216779))

(declare-fun m!334407 () Bool)

(assert (=> b!216779 m!334407))

(declare-fun m!334409 () Bool)

(assert (=> b!216768 m!334409))

(declare-fun m!334411 () Bool)

(assert (=> b!216775 m!334411))

(declare-fun m!334413 () Bool)

(assert (=> b!216775 m!334413))

(declare-fun m!334415 () Bool)

(assert (=> start!45030 m!334415))

(declare-fun m!334417 () Bool)

(assert (=> b!216767 m!334417))

(declare-fun m!334419 () Bool)

(assert (=> b!216783 m!334419))

(declare-fun m!334421 () Bool)

(assert (=> b!216789 m!334421))

(declare-fun m!334423 () Bool)

(assert (=> b!216788 m!334423))

(declare-fun m!334425 () Bool)

(assert (=> b!216781 m!334425))

(declare-fun m!334427 () Bool)

(assert (=> b!216781 m!334427))

(declare-fun m!334429 () Bool)

(assert (=> b!216781 m!334429))

(declare-fun m!334431 () Bool)

(assert (=> b!216784 m!334431))

(declare-fun m!334433 () Bool)

(assert (=> b!216784 m!334433))

(assert (=> b!216786 m!334411))

(assert (=> b!216786 m!334413))

(declare-fun m!334435 () Bool)

(assert (=> b!216786 m!334435))

(declare-fun m!334437 () Bool)

(assert (=> b!216765 m!334437))

(declare-fun m!334439 () Bool)

(assert (=> b!216780 m!334439))

(declare-fun m!334441 () Bool)

(assert (=> b!216769 m!334441))

(assert (=> b!216777 m!334409))

(declare-fun m!334443 () Bool)

(assert (=> b!216774 m!334443))

(declare-fun m!334445 () Bool)

(assert (=> b!216774 m!334445))

(declare-fun m!334447 () Bool)

(assert (=> b!216774 m!334447))

(declare-fun m!334449 () Bool)

(assert (=> b!216774 m!334449))

(declare-fun m!334451 () Bool)

(assert (=> b!216787 m!334451))

(declare-fun m!334453 () Bool)

(assert (=> b!216782 m!334453))

(declare-fun m!334455 () Bool)

(assert (=> b!216785 m!334455))

(declare-fun m!334457 () Bool)

(assert (=> b!216785 m!334457))

(declare-fun m!334459 () Bool)

(assert (=> b!216785 m!334459))

(declare-fun m!334461 () Bool)

(assert (=> b!216785 m!334461))

(declare-fun m!334463 () Bool)

(assert (=> b!216785 m!334463))

(declare-fun m!334465 () Bool)

(assert (=> b!216785 m!334465))

(declare-fun m!334467 () Bool)

(assert (=> b!216785 m!334467))

(declare-fun m!334469 () Bool)

(assert (=> b!216785 m!334469))

(declare-fun m!334471 () Bool)

(assert (=> b!216785 m!334471))

(declare-fun m!334473 () Bool)

(assert (=> b!216785 m!334473))

(declare-fun m!334475 () Bool)

(assert (=> b!216785 m!334475))

(declare-fun m!334477 () Bool)

(assert (=> b!216785 m!334477))

(declare-fun m!334479 () Bool)

(assert (=> b!216785 m!334479))

(declare-fun m!334481 () Bool)

(assert (=> b!216785 m!334481))

(declare-fun m!334483 () Bool)

(assert (=> b!216785 m!334483))

(declare-fun m!334485 () Bool)

(assert (=> b!216785 m!334485))

(declare-fun m!334487 () Bool)

(assert (=> b!216771 m!334487))

(assert (=> b!216771 m!334487))

(declare-fun m!334489 () Bool)

(assert (=> b!216771 m!334489))

(push 1)

(assert (not b!216787))

(assert (not b!216765))

(assert (not b!216788))

(assert (not b!216782))

(assert (not b!216774))

(assert (not b!216780))

(assert (not b!216777))

(assert (not b!216771))

(assert (not b!216789))

(assert (not b!216784))

(assert (not b!216781))

(assert (not b!216769))

(assert (not b!216783))

(assert (not b!216775))

(assert (not start!45030))

(assert (not b!216768))

(assert (not b!216785))

(assert (not b!216786))

(assert (not b!216779))

(assert (not b!216767))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!73557 () Bool)

(declare-fun e!147582 () Bool)

(assert (=> d!73557 e!147582))

(declare-fun res!182590 () Bool)

(assert (=> d!73557 (=> (not res!182590) (not e!147582))))

(declare-fun lt!343157 () BitStream!8422)

(declare-fun lt!343158 () (_ BitVec 64))

(assert (=> d!73557 (= res!182590 (= (bvadd lt!343158 (bvsub lt!342769 lt!342796)) (bitIndex!0 (size!4657 (buf!5198 lt!343157)) (currentByte!9785 lt!343157) (currentBit!9780 lt!343157))))))

(assert (=> d!73557 (or (not (= (bvand lt!343158 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!342769 lt!342796) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!343158 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!343158 (bvsub lt!342769 lt!342796)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73557 (= lt!343158 (bitIndex!0 (size!4657 (buf!5198 (_2!9907 lt!342784))) (currentByte!9785 (_2!9907 lt!342784)) (currentBit!9780 (_2!9907 lt!342784))))))

(declare-fun moveBitIndex!0 (BitStream!8422 (_ BitVec 64)) tuple2!18494)

(assert (=> d!73557 (= lt!343157 (_2!9905 (moveBitIndex!0 (_2!9907 lt!342784) (bvsub lt!342769 lt!342796))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!8422 (_ BitVec 64)) Bool)

(assert (=> d!73557 (moveBitIndexPrecond!0 (_2!9907 lt!342784) (bvsub lt!342769 lt!342796))))

(assert (=> d!73557 (= (withMovedBitIndex!0 (_2!9907 lt!342784) (bvsub lt!342769 lt!342796)) lt!343157)))

(declare-fun b!217015 () Bool)

(assert (=> b!217015 (= e!147582 (= (size!4657 (buf!5198 (_2!9907 lt!342784))) (size!4657 (buf!5198 lt!343157))))))

(assert (= (and d!73557 res!182590) b!217015))

(declare-fun m!334785 () Bool)

(assert (=> d!73557 m!334785))

(assert (=> d!73557 m!334433))

(declare-fun m!334787 () Bool)

(assert (=> d!73557 m!334787))

(declare-fun m!334789 () Bool)

(assert (=> d!73557 m!334789))

(assert (=> b!216769 d!73557))

(declare-fun d!73559 () Bool)

(declare-fun res!182597 () Bool)

(declare-fun e!147587 () Bool)

(assert (=> d!73559 (=> (not res!182597) (not e!147587))))

(assert (=> d!73559 (= res!182597 (= (size!4657 (buf!5198 thiss!1204)) (size!4657 (buf!5198 (_2!9905 lt!342775)))))))

(assert (=> d!73559 (= (isPrefixOf!0 thiss!1204 (_2!9905 lt!342775)) e!147587)))

(declare-fun b!217022 () Bool)

(declare-fun res!182598 () Bool)

(assert (=> b!217022 (=> (not res!182598) (not e!147587))))

(assert (=> b!217022 (= res!182598 (bvsle (bitIndex!0 (size!4657 (buf!5198 thiss!1204)) (currentByte!9785 thiss!1204) (currentBit!9780 thiss!1204)) (bitIndex!0 (size!4657 (buf!5198 (_2!9905 lt!342775))) (currentByte!9785 (_2!9905 lt!342775)) (currentBit!9780 (_2!9905 lt!342775)))))))

(declare-fun b!217023 () Bool)

(declare-fun e!147588 () Bool)

(assert (=> b!217023 (= e!147587 e!147588)))

(declare-fun res!182599 () Bool)

(assert (=> b!217023 (=> res!182599 e!147588)))

(assert (=> b!217023 (= res!182599 (= (size!4657 (buf!5198 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!217024 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10604 array!10604 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!217024 (= e!147588 (arrayBitRangesEq!0 (buf!5198 thiss!1204) (buf!5198 (_2!9905 lt!342775)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4657 (buf!5198 thiss!1204)) (currentByte!9785 thiss!1204) (currentBit!9780 thiss!1204))))))

(assert (= (and d!73559 res!182597) b!217022))

(assert (= (and b!217022 res!182598) b!217023))

(assert (= (and b!217023 (not res!182599)) b!217024))

(assert (=> b!217022 m!334413))

(assert (=> b!217022 m!334411))

(assert (=> b!217024 m!334413))

(assert (=> b!217024 m!334413))

(declare-fun m!334791 () Bool)

(assert (=> b!217024 m!334791))

(assert (=> b!216768 d!73559))

(declare-fun d!73561 () Bool)

(assert (=> d!73561 (= (array_inv!4398 (buf!5198 thiss!1204)) (bvsge (size!4657 (buf!5198 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!216779 d!73561))

(declare-fun d!73563 () Bool)

(declare-fun e!147589 () Bool)

(assert (=> d!73563 e!147589))

(declare-fun res!182600 () Bool)

(assert (=> d!73563 (=> (not res!182600) (not e!147589))))

(declare-fun lt!343160 () (_ BitVec 64))

(declare-fun lt!343159 () BitStream!8422)

(assert (=> d!73563 (= res!182600 (= (bvadd lt!343160 (bvsub lt!342786 lt!342796)) (bitIndex!0 (size!4657 (buf!5198 lt!343159)) (currentByte!9785 lt!343159) (currentBit!9780 lt!343159))))))

(assert (=> d!73563 (or (not (= (bvand lt!343160 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!342786 lt!342796) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!343160 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!343160 (bvsub lt!342786 lt!342796)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73563 (= lt!343160 (bitIndex!0 (size!4657 (buf!5198 (_2!9907 lt!342783))) (currentByte!9785 (_2!9907 lt!342783)) (currentBit!9780 (_2!9907 lt!342783))))))

(assert (=> d!73563 (= lt!343159 (_2!9905 (moveBitIndex!0 (_2!9907 lt!342783) (bvsub lt!342786 lt!342796))))))

(assert (=> d!73563 (moveBitIndexPrecond!0 (_2!9907 lt!342783) (bvsub lt!342786 lt!342796))))

(assert (=> d!73563 (= (withMovedBitIndex!0 (_2!9907 lt!342783) (bvsub lt!342786 lt!342796)) lt!343159)))

(declare-fun b!217025 () Bool)

(assert (=> b!217025 (= e!147589 (= (size!4657 (buf!5198 (_2!9907 lt!342783))) (size!4657 (buf!5198 lt!343159))))))

(assert (= (and d!73563 res!182600) b!217025))

(declare-fun m!334793 () Bool)

(assert (=> d!73563 m!334793))

(declare-fun m!334795 () Bool)

(assert (=> d!73563 m!334795))

(declare-fun m!334797 () Bool)

(assert (=> d!73563 m!334797))

(declare-fun m!334799 () Bool)

(assert (=> d!73563 m!334799))

(assert (=> b!216789 d!73563))

(declare-fun d!73565 () Bool)

(declare-fun res!182601 () Bool)

(declare-fun e!147590 () Bool)

(assert (=> d!73565 (=> (not res!182601) (not e!147590))))

(assert (=> d!73565 (= res!182601 (= (size!4657 (buf!5198 (_2!9905 lt!342775))) (size!4657 (buf!5198 (_2!9905 lt!342780)))))))

(assert (=> d!73565 (= (isPrefixOf!0 (_2!9905 lt!342775) (_2!9905 lt!342780)) e!147590)))

(declare-fun b!217026 () Bool)

(declare-fun res!182602 () Bool)

(assert (=> b!217026 (=> (not res!182602) (not e!147590))))

(assert (=> b!217026 (= res!182602 (bvsle (bitIndex!0 (size!4657 (buf!5198 (_2!9905 lt!342775))) (currentByte!9785 (_2!9905 lt!342775)) (currentBit!9780 (_2!9905 lt!342775))) (bitIndex!0 (size!4657 (buf!5198 (_2!9905 lt!342780))) (currentByte!9785 (_2!9905 lt!342780)) (currentBit!9780 (_2!9905 lt!342780)))))))

(declare-fun b!217027 () Bool)

(declare-fun e!147591 () Bool)

(assert (=> b!217027 (= e!147590 e!147591)))

(declare-fun res!182603 () Bool)

(assert (=> b!217027 (=> res!182603 e!147591)))

(assert (=> b!217027 (= res!182603 (= (size!4657 (buf!5198 (_2!9905 lt!342775))) #b00000000000000000000000000000000))))

(declare-fun b!217028 () Bool)

(assert (=> b!217028 (= e!147591 (arrayBitRangesEq!0 (buf!5198 (_2!9905 lt!342775)) (buf!5198 (_2!9905 lt!342780)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4657 (buf!5198 (_2!9905 lt!342775))) (currentByte!9785 (_2!9905 lt!342775)) (currentBit!9780 (_2!9905 lt!342775)))))))

(assert (= (and d!73565 res!182601) b!217026))

(assert (= (and b!217026 res!182602) b!217027))

(assert (= (and b!217027 (not res!182603)) b!217028))

(assert (=> b!217026 m!334411))

(assert (=> b!217026 m!334443))

(assert (=> b!217028 m!334411))

(assert (=> b!217028 m!334411))

(declare-fun m!334801 () Bool)

(assert (=> b!217028 m!334801))

(assert (=> b!216788 d!73565))

(declare-fun d!73567 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!73567 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4657 (buf!5198 thiss!1204))) ((_ sign_extend 32) (currentByte!9785 thiss!1204)) ((_ sign_extend 32) (currentBit!9780 thiss!1204)) lt!342793) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4657 (buf!5198 thiss!1204))) ((_ sign_extend 32) (currentByte!9785 thiss!1204)) ((_ sign_extend 32) (currentBit!9780 thiss!1204))) lt!342793))))

(declare-fun bs!17966 () Bool)

(assert (= bs!17966 d!73567))

(declare-fun m!334803 () Bool)

(assert (=> bs!17966 m!334803))

(assert (=> b!216767 d!73567))

(declare-fun d!73569 () Bool)

(assert (=> d!73569 (= (invariant!0 (currentBit!9780 thiss!1204) (currentByte!9785 thiss!1204) (size!4657 (buf!5198 thiss!1204))) (and (bvsge (currentBit!9780 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9780 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9785 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9785 thiss!1204) (size!4657 (buf!5198 thiss!1204))) (and (= (currentBit!9780 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9785 thiss!1204) (size!4657 (buf!5198 thiss!1204)))))))))

(assert (=> b!216782 d!73569))

(declare-fun d!73571 () Bool)

(declare-datatypes ((tuple2!18524 0))(
  ( (tuple2!18525 (_1!9920 Bool) (_2!9920 BitStream!8422)) )
))
(declare-fun lt!343163 () tuple2!18524)

(declare-fun readBit!0 (BitStream!8422) tuple2!18524)

(assert (=> d!73571 (= lt!343163 (readBit!0 (readerFrom!0 (_2!9905 lt!342775) (currentBit!9780 thiss!1204) (currentByte!9785 thiss!1204))))))

(assert (=> d!73571 (= (readBitPure!0 (readerFrom!0 (_2!9905 lt!342775) (currentBit!9780 thiss!1204) (currentByte!9785 thiss!1204))) (tuple2!18497 (_2!9920 lt!343163) (_1!9920 lt!343163)))))

(declare-fun bs!17967 () Bool)

(assert (= bs!17967 d!73571))

(assert (=> bs!17967 m!334487))

(declare-fun m!334805 () Bool)

(assert (=> bs!17967 m!334805))

(assert (=> b!216771 d!73571))

(declare-fun d!73573 () Bool)

(declare-fun e!147594 () Bool)

(assert (=> d!73573 e!147594))

(declare-fun res!182607 () Bool)

(assert (=> d!73573 (=> (not res!182607) (not e!147594))))

(assert (=> d!73573 (= res!182607 (invariant!0 (currentBit!9780 (_2!9905 lt!342775)) (currentByte!9785 (_2!9905 lt!342775)) (size!4657 (buf!5198 (_2!9905 lt!342775)))))))

(assert (=> d!73573 (= (readerFrom!0 (_2!9905 lt!342775) (currentBit!9780 thiss!1204) (currentByte!9785 thiss!1204)) (BitStream!8423 (buf!5198 (_2!9905 lt!342775)) (currentByte!9785 thiss!1204) (currentBit!9780 thiss!1204)))))

(declare-fun b!217031 () Bool)

(assert (=> b!217031 (= e!147594 (invariant!0 (currentBit!9780 thiss!1204) (currentByte!9785 thiss!1204) (size!4657 (buf!5198 (_2!9905 lt!342775)))))))

(assert (= (and d!73573 res!182607) b!217031))

(declare-fun m!334807 () Bool)

(assert (=> d!73573 m!334807))

(assert (=> b!217031 m!334483))

(assert (=> b!216771 d!73573))

(declare-fun d!73575 () Bool)

(declare-fun lt!343183 () tuple2!18500)

(declare-fun lt!343180 () tuple2!18500)

(assert (=> d!73575 (and (= (_2!9908 lt!343183) (_2!9908 lt!343180)) (= (_1!9908 lt!343183) (_1!9908 lt!343180)))))

(declare-fun lt!343182 () BitStream!8422)

(declare-fun lt!343181 () (_ BitVec 64))

(declare-fun lt!343179 () Bool)

(declare-fun lt!343184 () Unit!15433)

(declare-fun choose!56 (BitStream!8422 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!18500 tuple2!18500 BitStream!8422 (_ BitVec 64) Bool BitStream!8422 (_ BitVec 64) tuple2!18500 tuple2!18500 BitStream!8422 (_ BitVec 64)) Unit!15433)

(assert (=> d!73575 (= lt!343184 (choose!56 (_1!9907 lt!342784) nBits!348 i!590 lt!342771 lt!343183 (tuple2!18501 (_1!9908 lt!343183) (_2!9908 lt!343183)) (_1!9908 lt!343183) (_2!9908 lt!343183) lt!343179 lt!343182 lt!343181 lt!343180 (tuple2!18501 (_1!9908 lt!343180) (_2!9908 lt!343180)) (_1!9908 lt!343180) (_2!9908 lt!343180)))))

(assert (=> d!73575 (= lt!343180 (readNBitsLSBFirstsLoopPure!0 lt!343182 nBits!348 (bvadd i!590 #b00000000000000000000000000000001) lt!343181))))

(assert (=> d!73575 (= lt!343181 (bvor lt!342771 (ite lt!343179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73575 (= lt!343182 (withMovedBitIndex!0 (_1!9907 lt!342784) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!73575 (= lt!343179 (_2!9906 (readBitPure!0 (_1!9907 lt!342784))))))

(assert (=> d!73575 (= lt!343183 (readNBitsLSBFirstsLoopPure!0 (_1!9907 lt!342784) nBits!348 i!590 lt!342771))))

(assert (=> d!73575 (= (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9907 lt!342784) nBits!348 i!590 lt!342771) lt!343184)))

(declare-fun bs!17970 () Bool)

(assert (= bs!17970 d!73575))

(declare-fun m!334811 () Bool)

(assert (=> bs!17970 m!334811))

(assert (=> bs!17970 m!334429))

(assert (=> bs!17970 m!334481))

(assert (=> bs!17970 m!334475))

(declare-fun m!334813 () Bool)

(assert (=> bs!17970 m!334813))

(assert (=> b!216781 d!73575))

(declare-datatypes ((tuple2!18526 0))(
  ( (tuple2!18527 (_1!9921 (_ BitVec 64)) (_2!9921 BitStream!8422)) )
))
(declare-fun lt!343187 () tuple2!18526)

(declare-fun d!73581 () Bool)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!8422 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18526)

(assert (=> d!73581 (= lt!343187 (readNBitsLSBFirstsLoop!0 lt!342773 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!342778))))

(assert (=> d!73581 (= (readNBitsLSBFirstsLoopPure!0 lt!342773 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!342778) (tuple2!18501 (_2!9921 lt!343187) (_1!9921 lt!343187)))))

(declare-fun bs!17971 () Bool)

(assert (= bs!17971 d!73581))

(declare-fun m!334817 () Bool)

(assert (=> bs!17971 m!334817))

(assert (=> b!216781 d!73581))

(declare-fun d!73585 () Bool)

(declare-fun e!147598 () Bool)

(assert (=> d!73585 e!147598))

(declare-fun res!182612 () Bool)

(assert (=> d!73585 (=> (not res!182612) (not e!147598))))

(declare-fun lt!343189 () (_ BitVec 64))

(declare-fun lt!343188 () BitStream!8422)

(assert (=> d!73585 (= res!182612 (= (bvadd lt!343189 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4657 (buf!5198 lt!343188)) (currentByte!9785 lt!343188) (currentBit!9780 lt!343188))))))

(assert (=> d!73585 (or (not (= (bvand lt!343189 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!343189 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!343189 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73585 (= lt!343189 (bitIndex!0 (size!4657 (buf!5198 (_1!9907 lt!342784))) (currentByte!9785 (_1!9907 lt!342784)) (currentBit!9780 (_1!9907 lt!342784))))))

(assert (=> d!73585 (= lt!343188 (_2!9905 (moveBitIndex!0 (_1!9907 lt!342784) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!73585 (moveBitIndexPrecond!0 (_1!9907 lt!342784) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!73585 (= (withMovedBitIndex!0 (_1!9907 lt!342784) #b0000000000000000000000000000000000000000000000000000000000000001) lt!343188)))

(declare-fun b!217035 () Bool)

(assert (=> b!217035 (= e!147598 (= (size!4657 (buf!5198 (_1!9907 lt!342784))) (size!4657 (buf!5198 lt!343188))))))

(assert (= (and d!73585 res!182612) b!217035))

(declare-fun m!334819 () Bool)

(assert (=> d!73585 m!334819))

(declare-fun m!334821 () Bool)

(assert (=> d!73585 m!334821))

(declare-fun m!334823 () Bool)

(assert (=> d!73585 m!334823))

(declare-fun m!334825 () Bool)

(assert (=> d!73585 m!334825))

(assert (=> b!216781 d!73585))

(declare-fun d!73587 () Bool)

(assert (=> d!73587 (= (invariant!0 (currentBit!9780 thiss!1204) (currentByte!9785 thiss!1204) (size!4657 (buf!5198 (_2!9905 lt!342780)))) (and (bvsge (currentBit!9780 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9780 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9785 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9785 thiss!1204) (size!4657 (buf!5198 (_2!9905 lt!342780)))) (and (= (currentBit!9780 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9785 thiss!1204) (size!4657 (buf!5198 (_2!9905 lt!342780))))))))))

(assert (=> b!216780 d!73587))

(declare-fun d!73589 () Bool)

(declare-fun e!147604 () Bool)

(assert (=> d!73589 e!147604))

(declare-fun res!182620 () Bool)

(assert (=> d!73589 (=> (not res!182620) (not e!147604))))

(declare-fun lt!343219 () (_ BitVec 64))

(declare-fun lt!343221 () (_ BitVec 64))

(declare-fun lt!343222 () (_ BitVec 64))

(assert (=> d!73589 (= res!182620 (= lt!343222 (bvsub lt!343221 lt!343219)))))

(assert (=> d!73589 (or (= (bvand lt!343221 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!343219 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!343221 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!343221 lt!343219) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73589 (= lt!343219 (remainingBits!0 ((_ sign_extend 32) (size!4657 (buf!5198 (_2!9905 lt!342780)))) ((_ sign_extend 32) (currentByte!9785 (_2!9905 lt!342780))) ((_ sign_extend 32) (currentBit!9780 (_2!9905 lt!342780)))))))

(declare-fun lt!343217 () (_ BitVec 64))

(declare-fun lt!343220 () (_ BitVec 64))

(assert (=> d!73589 (= lt!343221 (bvmul lt!343217 lt!343220))))

(assert (=> d!73589 (or (= lt!343217 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!343220 (bvsdiv (bvmul lt!343217 lt!343220) lt!343217)))))

(assert (=> d!73589 (= lt!343220 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!73589 (= lt!343217 ((_ sign_extend 32) (size!4657 (buf!5198 (_2!9905 lt!342780)))))))

(assert (=> d!73589 (= lt!343222 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9785 (_2!9905 lt!342780))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9780 (_2!9905 lt!342780)))))))

(assert (=> d!73589 (invariant!0 (currentBit!9780 (_2!9905 lt!342780)) (currentByte!9785 (_2!9905 lt!342780)) (size!4657 (buf!5198 (_2!9905 lt!342780))))))

(assert (=> d!73589 (= (bitIndex!0 (size!4657 (buf!5198 (_2!9905 lt!342780))) (currentByte!9785 (_2!9905 lt!342780)) (currentBit!9780 (_2!9905 lt!342780))) lt!343222)))

(declare-fun b!217043 () Bool)

(declare-fun res!182621 () Bool)

(assert (=> b!217043 (=> (not res!182621) (not e!147604))))

(assert (=> b!217043 (= res!182621 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!343222))))

(declare-fun b!217044 () Bool)

(declare-fun lt!343218 () (_ BitVec 64))

(assert (=> b!217044 (= e!147604 (bvsle lt!343222 (bvmul lt!343218 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!217044 (or (= lt!343218 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!343218 #b0000000000000000000000000000000000000000000000000000000000001000) lt!343218)))))

(assert (=> b!217044 (= lt!343218 ((_ sign_extend 32) (size!4657 (buf!5198 (_2!9905 lt!342780)))))))

(assert (= (and d!73589 res!182620) b!217043))

(assert (= (and b!217043 res!182621) b!217044))

(declare-fun m!334839 () Bool)

(assert (=> d!73589 m!334839))

(assert (=> d!73589 m!334419))

(assert (=> b!216774 d!73589))

(declare-fun d!73595 () Bool)

(declare-fun res!182622 () Bool)

(declare-fun e!147605 () Bool)

(assert (=> d!73595 (=> (not res!182622) (not e!147605))))

(assert (=> d!73595 (= res!182622 (= (size!4657 (buf!5198 thiss!1204)) (size!4657 (buf!5198 (_2!9905 lt!342780)))))))

(assert (=> d!73595 (= (isPrefixOf!0 thiss!1204 (_2!9905 lt!342780)) e!147605)))

(declare-fun b!217045 () Bool)

(declare-fun res!182623 () Bool)

(assert (=> b!217045 (=> (not res!182623) (not e!147605))))

(assert (=> b!217045 (= res!182623 (bvsle (bitIndex!0 (size!4657 (buf!5198 thiss!1204)) (currentByte!9785 thiss!1204) (currentBit!9780 thiss!1204)) (bitIndex!0 (size!4657 (buf!5198 (_2!9905 lt!342780))) (currentByte!9785 (_2!9905 lt!342780)) (currentBit!9780 (_2!9905 lt!342780)))))))

(declare-fun b!217046 () Bool)

(declare-fun e!147606 () Bool)

(assert (=> b!217046 (= e!147605 e!147606)))

(declare-fun res!182624 () Bool)

(assert (=> b!217046 (=> res!182624 e!147606)))

(assert (=> b!217046 (= res!182624 (= (size!4657 (buf!5198 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!217047 () Bool)

(assert (=> b!217047 (= e!147606 (arrayBitRangesEq!0 (buf!5198 thiss!1204) (buf!5198 (_2!9905 lt!342780)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4657 (buf!5198 thiss!1204)) (currentByte!9785 thiss!1204) (currentBit!9780 thiss!1204))))))

(assert (= (and d!73595 res!182622) b!217045))

(assert (= (and b!217045 res!182623) b!217046))

(assert (= (and b!217046 (not res!182624)) b!217047))

(assert (=> b!217045 m!334413))

(assert (=> b!217045 m!334443))

(assert (=> b!217047 m!334413))

(assert (=> b!217047 m!334413))

(declare-fun m!334841 () Bool)

(assert (=> b!217047 m!334841))

(assert (=> b!216774 d!73595))

(declare-fun d!73597 () Bool)

(assert (=> d!73597 (isPrefixOf!0 thiss!1204 (_2!9905 lt!342780))))

(declare-fun lt!343225 () Unit!15433)

(declare-fun choose!30 (BitStream!8422 BitStream!8422 BitStream!8422) Unit!15433)

(assert (=> d!73597 (= lt!343225 (choose!30 thiss!1204 (_2!9905 lt!342775) (_2!9905 lt!342780)))))

(assert (=> d!73597 (isPrefixOf!0 thiss!1204 (_2!9905 lt!342775))))

(assert (=> d!73597 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9905 lt!342775) (_2!9905 lt!342780)) lt!343225)))

(declare-fun bs!17973 () Bool)

(assert (= bs!17973 d!73597))

(assert (=> bs!17973 m!334445))

(declare-fun m!334843 () Bool)

(assert (=> bs!17973 m!334843))

(assert (=> bs!17973 m!334409))

(assert (=> b!216774 d!73597))

(declare-fun b!217209 () Bool)

(declare-fun res!182767 () Bool)

(declare-fun e!147702 () Bool)

(assert (=> b!217209 (=> (not res!182767) (not e!147702))))

(declare-fun lt!343763 () tuple2!18494)

(assert (=> b!217209 (= res!182767 (= (size!4657 (buf!5198 (_2!9905 lt!342775))) (size!4657 (buf!5198 (_2!9905 lt!343763)))))))

(declare-fun b!217210 () Bool)

(declare-fun lt!343764 () tuple2!18496)

(declare-fun lt!343757 () tuple2!18494)

(assert (=> b!217210 (= lt!343764 (readBitPure!0 (readerFrom!0 (_2!9905 lt!343757) (currentBit!9780 (_2!9905 lt!342775)) (currentByte!9785 (_2!9905 lt!342775)))))))

(declare-fun lt!343787 () Bool)

(declare-fun res!182768 () Bool)

(assert (=> b!217210 (= res!182768 (and (= (_2!9906 lt!343764) lt!343787) (= (_1!9906 lt!343764) (_2!9905 lt!343757))))))

(declare-fun e!147705 () Bool)

(assert (=> b!217210 (=> (not res!182768) (not e!147705))))

(declare-fun e!147703 () Bool)

(assert (=> b!217210 (= e!147703 e!147705)))

(declare-fun b!217211 () Bool)

(declare-fun e!147698 () Bool)

(declare-fun lt!343773 () tuple2!18496)

(declare-fun lt!343790 () tuple2!18496)

(assert (=> b!217211 (= e!147698 (= (_2!9906 lt!343773) (_2!9906 lt!343790)))))

(declare-fun b!217212 () Bool)

(declare-fun e!147700 () tuple2!18494)

(declare-fun lt!343756 () tuple2!18494)

(assert (=> b!217212 (= e!147700 (tuple2!18495 (_1!9905 lt!343756) (_2!9905 lt!343756)))))

(assert (=> b!217212 (= lt!343787 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!217212 (= lt!343757 (appendBit!0 (_2!9905 lt!342775) lt!343787))))

(declare-fun res!182764 () Bool)

(assert (=> b!217212 (= res!182764 (= (size!4657 (buf!5198 (_2!9905 lt!342775))) (size!4657 (buf!5198 (_2!9905 lt!343757)))))))

(assert (=> b!217212 (=> (not res!182764) (not e!147703))))

(assert (=> b!217212 e!147703))

(declare-fun lt!343740 () tuple2!18494)

(assert (=> b!217212 (= lt!343740 lt!343757)))

(assert (=> b!217212 (= lt!343756 (appendBitsLSBFirstLoopTR!0 (_2!9905 lt!343740) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!343792 () Unit!15433)

(assert (=> b!217212 (= lt!343792 (lemmaIsPrefixTransitive!0 (_2!9905 lt!342775) (_2!9905 lt!343740) (_2!9905 lt!343756)))))

(assert (=> b!217212 (isPrefixOf!0 (_2!9905 lt!342775) (_2!9905 lt!343756))))

(declare-fun lt!343754 () Unit!15433)

(assert (=> b!217212 (= lt!343754 lt!343792)))

(assert (=> b!217212 (invariant!0 (currentBit!9780 (_2!9905 lt!342775)) (currentByte!9785 (_2!9905 lt!342775)) (size!4657 (buf!5198 (_2!9905 lt!343740))))))

(declare-fun lt!343785 () BitStream!8422)

(assert (=> b!217212 (= lt!343785 (BitStream!8423 (buf!5198 (_2!9905 lt!343740)) (currentByte!9785 (_2!9905 lt!342775)) (currentBit!9780 (_2!9905 lt!342775))))))

(assert (=> b!217212 (invariant!0 (currentBit!9780 lt!343785) (currentByte!9785 lt!343785) (size!4657 (buf!5198 (_2!9905 lt!343756))))))

(declare-fun lt!343753 () BitStream!8422)

(assert (=> b!217212 (= lt!343753 (BitStream!8423 (buf!5198 (_2!9905 lt!343756)) (currentByte!9785 lt!343785) (currentBit!9780 lt!343785)))))

(assert (=> b!217212 (= lt!343773 (readBitPure!0 lt!343785))))

(assert (=> b!217212 (= lt!343790 (readBitPure!0 lt!343753))))

(declare-fun lt!343784 () Unit!15433)

(assert (=> b!217212 (= lt!343784 (readBitPrefixLemma!0 lt!343785 (_2!9905 lt!343756)))))

(declare-fun res!182761 () Bool)

(assert (=> b!217212 (= res!182761 (= (bitIndex!0 (size!4657 (buf!5198 (_1!9906 lt!343773))) (currentByte!9785 (_1!9906 lt!343773)) (currentBit!9780 (_1!9906 lt!343773))) (bitIndex!0 (size!4657 (buf!5198 (_1!9906 lt!343790))) (currentByte!9785 (_1!9906 lt!343790)) (currentBit!9780 (_1!9906 lt!343790)))))))

(assert (=> b!217212 (=> (not res!182761) (not e!147698))))

(assert (=> b!217212 e!147698))

(declare-fun lt!343755 () Unit!15433)

(assert (=> b!217212 (= lt!343755 lt!343784)))

(declare-fun lt!343739 () tuple2!18498)

(assert (=> b!217212 (= lt!343739 (reader!0 (_2!9905 lt!342775) (_2!9905 lt!343756)))))

(declare-fun lt!343781 () tuple2!18498)

(assert (=> b!217212 (= lt!343781 (reader!0 (_2!9905 lt!343740) (_2!9905 lt!343756)))))

(declare-fun lt!343761 () tuple2!18496)

(assert (=> b!217212 (= lt!343761 (readBitPure!0 (_1!9907 lt!343739)))))

(assert (=> b!217212 (= (_2!9906 lt!343761) lt!343787)))

(declare-fun lt!343766 () Unit!15433)

(declare-fun Unit!15452 () Unit!15433)

(assert (=> b!217212 (= lt!343766 Unit!15452)))

(declare-fun lt!343783 () (_ BitVec 64))

(assert (=> b!217212 (= lt!343783 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!343775 () (_ BitVec 64))

(assert (=> b!217212 (= lt!343775 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!343759 () Unit!15433)

(assert (=> b!217212 (= lt!343759 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9905 lt!342775) (buf!5198 (_2!9905 lt!343756)) lt!343775))))

(assert (=> b!217212 (validate_offset_bits!1 ((_ sign_extend 32) (size!4657 (buf!5198 (_2!9905 lt!343756)))) ((_ sign_extend 32) (currentByte!9785 (_2!9905 lt!342775))) ((_ sign_extend 32) (currentBit!9780 (_2!9905 lt!342775))) lt!343775)))

(declare-fun lt!343762 () Unit!15433)

(assert (=> b!217212 (= lt!343762 lt!343759)))

(declare-fun lt!343746 () tuple2!18500)

(assert (=> b!217212 (= lt!343746 (readNBitsLSBFirstsLoopPure!0 (_1!9907 lt!343739) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!343783))))

(declare-fun lt!343767 () (_ BitVec 64))

(assert (=> b!217212 (= lt!343767 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!343778 () Unit!15433)

(assert (=> b!217212 (= lt!343778 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9905 lt!343740) (buf!5198 (_2!9905 lt!343756)) lt!343767))))

(assert (=> b!217212 (validate_offset_bits!1 ((_ sign_extend 32) (size!4657 (buf!5198 (_2!9905 lt!343756)))) ((_ sign_extend 32) (currentByte!9785 (_2!9905 lt!343740))) ((_ sign_extend 32) (currentBit!9780 (_2!9905 lt!343740))) lt!343767)))

(declare-fun lt!343745 () Unit!15433)

(assert (=> b!217212 (= lt!343745 lt!343778)))

(declare-fun lt!343741 () tuple2!18500)

(assert (=> b!217212 (= lt!343741 (readNBitsLSBFirstsLoopPure!0 (_1!9907 lt!343781) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!343783 (ite (_2!9906 lt!343761) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!343770 () tuple2!18500)

(assert (=> b!217212 (= lt!343770 (readNBitsLSBFirstsLoopPure!0 (_1!9907 lt!343739) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!343783))))

(declare-fun c!10618 () Bool)

(assert (=> b!217212 (= c!10618 (_2!9906 (readBitPure!0 (_1!9907 lt!343739))))))

(declare-fun lt!343742 () tuple2!18500)

(declare-fun e!147701 () (_ BitVec 64))

(assert (=> b!217212 (= lt!343742 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9907 lt!343739) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!343783 e!147701)))))

(declare-fun lt!343780 () Unit!15433)

(assert (=> b!217212 (= lt!343780 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9907 lt!343739) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!343783))))

(assert (=> b!217212 (and (= (_2!9908 lt!343770) (_2!9908 lt!343742)) (= (_1!9908 lt!343770) (_1!9908 lt!343742)))))

(declare-fun lt!343776 () Unit!15433)

(assert (=> b!217212 (= lt!343776 lt!343780)))

(assert (=> b!217212 (= (_1!9907 lt!343739) (withMovedBitIndex!0 (_2!9907 lt!343739) (bvsub (bitIndex!0 (size!4657 (buf!5198 (_2!9905 lt!342775))) (currentByte!9785 (_2!9905 lt!342775)) (currentBit!9780 (_2!9905 lt!342775))) (bitIndex!0 (size!4657 (buf!5198 (_2!9905 lt!343756))) (currentByte!9785 (_2!9905 lt!343756)) (currentBit!9780 (_2!9905 lt!343756))))))))

(declare-fun lt!343772 () Unit!15433)

(declare-fun Unit!15453 () Unit!15433)

(assert (=> b!217212 (= lt!343772 Unit!15453)))

(assert (=> b!217212 (= (_1!9907 lt!343781) (withMovedBitIndex!0 (_2!9907 lt!343781) (bvsub (bitIndex!0 (size!4657 (buf!5198 (_2!9905 lt!343740))) (currentByte!9785 (_2!9905 lt!343740)) (currentBit!9780 (_2!9905 lt!343740))) (bitIndex!0 (size!4657 (buf!5198 (_2!9905 lt!343756))) (currentByte!9785 (_2!9905 lt!343756)) (currentBit!9780 (_2!9905 lt!343756))))))))

(declare-fun lt!343747 () Unit!15433)

(declare-fun Unit!15454 () Unit!15433)

(assert (=> b!217212 (= lt!343747 Unit!15454)))

(assert (=> b!217212 (= (bitIndex!0 (size!4657 (buf!5198 (_2!9905 lt!342775))) (currentByte!9785 (_2!9905 lt!342775)) (currentBit!9780 (_2!9905 lt!342775))) (bvsub (bitIndex!0 (size!4657 (buf!5198 (_2!9905 lt!343740))) (currentByte!9785 (_2!9905 lt!343740)) (currentBit!9780 (_2!9905 lt!343740))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!343752 () Unit!15433)

(declare-fun Unit!15455 () Unit!15433)

(assert (=> b!217212 (= lt!343752 Unit!15455)))

(assert (=> b!217212 (= (_2!9908 lt!343746) (_2!9908 lt!343741))))

(declare-fun lt!343789 () Unit!15433)

(declare-fun Unit!15456 () Unit!15433)

(assert (=> b!217212 (= lt!343789 Unit!15456)))

(assert (=> b!217212 (invariant!0 (currentBit!9780 (_2!9905 lt!343756)) (currentByte!9785 (_2!9905 lt!343756)) (size!4657 (buf!5198 (_2!9905 lt!343756))))))

(declare-fun lt!343749 () Unit!15433)

(declare-fun Unit!15457 () Unit!15433)

(assert (=> b!217212 (= lt!343749 Unit!15457)))

(assert (=> b!217212 (= (size!4657 (buf!5198 (_2!9905 lt!342775))) (size!4657 (buf!5198 (_2!9905 lt!343756))))))

(declare-fun lt!343771 () Unit!15433)

(declare-fun Unit!15458 () Unit!15433)

(assert (=> b!217212 (= lt!343771 Unit!15458)))

(assert (=> b!217212 (= (bitIndex!0 (size!4657 (buf!5198 (_2!9905 lt!343756))) (currentByte!9785 (_2!9905 lt!343756)) (currentBit!9780 (_2!9905 lt!343756))) (bvsub (bvadd (bitIndex!0 (size!4657 (buf!5198 (_2!9905 lt!342775))) (currentByte!9785 (_2!9905 lt!342775)) (currentBit!9780 (_2!9905 lt!342775))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!343737 () Unit!15433)

(declare-fun Unit!15459 () Unit!15433)

(assert (=> b!217212 (= lt!343737 Unit!15459)))

(declare-fun lt!343744 () Unit!15433)

(declare-fun Unit!15461 () Unit!15433)

(assert (=> b!217212 (= lt!343744 Unit!15461)))

(declare-fun lt!343751 () tuple2!18498)

(assert (=> b!217212 (= lt!343751 (reader!0 (_2!9905 lt!342775) (_2!9905 lt!343756)))))

(declare-fun lt!343777 () (_ BitVec 64))

(assert (=> b!217212 (= lt!343777 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!343791 () Unit!15433)

(assert (=> b!217212 (= lt!343791 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9905 lt!342775) (buf!5198 (_2!9905 lt!343756)) lt!343777))))

(assert (=> b!217212 (validate_offset_bits!1 ((_ sign_extend 32) (size!4657 (buf!5198 (_2!9905 lt!343756)))) ((_ sign_extend 32) (currentByte!9785 (_2!9905 lt!342775))) ((_ sign_extend 32) (currentBit!9780 (_2!9905 lt!342775))) lt!343777)))

(declare-fun lt!343774 () Unit!15433)

(assert (=> b!217212 (= lt!343774 lt!343791)))

(declare-fun lt!343743 () tuple2!18500)

(assert (=> b!217212 (= lt!343743 (readNBitsLSBFirstsLoopPure!0 (_1!9907 lt!343751) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!182765 () Bool)

(assert (=> b!217212 (= res!182765 (= (_2!9908 lt!343743) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun e!147697 () Bool)

(assert (=> b!217212 (=> (not res!182765) (not e!147697))))

(assert (=> b!217212 e!147697))

(declare-fun lt!343748 () Unit!15433)

(declare-fun Unit!15462 () Unit!15433)

(assert (=> b!217212 (= lt!343748 Unit!15462)))

(declare-fun b!217213 () Bool)

(declare-fun Unit!15463 () Unit!15433)

(assert (=> b!217213 (= e!147700 (tuple2!18495 Unit!15463 (_2!9905 lt!342775)))))

(declare-fun lt!343782 () Unit!15433)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8422) Unit!15433)

(assert (=> b!217213 (= lt!343782 (lemmaIsPrefixRefl!0 (_2!9905 lt!342775)))))

(declare-fun call!3399 () Bool)

(assert (=> b!217213 call!3399))

(declare-fun lt!343738 () Unit!15433)

(assert (=> b!217213 (= lt!343738 lt!343782)))

(declare-fun b!217214 () Bool)

(declare-fun e!147699 () Bool)

(assert (=> b!217214 (= e!147702 e!147699)))

(declare-fun res!182763 () Bool)

(assert (=> b!217214 (=> (not res!182763) (not e!147699))))

(declare-fun lt!343788 () tuple2!18500)

(assert (=> b!217214 (= res!182763 (= (_2!9908 lt!343788) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun lt!343760 () tuple2!18498)

(assert (=> b!217214 (= lt!343788 (readNBitsLSBFirstsLoopPure!0 (_1!9907 lt!343760) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!343768 () Unit!15433)

(declare-fun lt!343765 () Unit!15433)

(assert (=> b!217214 (= lt!343768 lt!343765)))

(declare-fun lt!343750 () (_ BitVec 64))

(assert (=> b!217214 (validate_offset_bits!1 ((_ sign_extend 32) (size!4657 (buf!5198 (_2!9905 lt!343763)))) ((_ sign_extend 32) (currentByte!9785 (_2!9905 lt!342775))) ((_ sign_extend 32) (currentBit!9780 (_2!9905 lt!342775))) lt!343750)))

(assert (=> b!217214 (= lt!343765 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9905 lt!342775) (buf!5198 (_2!9905 lt!343763)) lt!343750))))

(declare-fun e!147704 () Bool)

(assert (=> b!217214 e!147704))

(declare-fun res!182760 () Bool)

(assert (=> b!217214 (=> (not res!182760) (not e!147704))))

(assert (=> b!217214 (= res!182760 (and (= (size!4657 (buf!5198 (_2!9905 lt!342775))) (size!4657 (buf!5198 (_2!9905 lt!343763)))) (bvsge lt!343750 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!217214 (= lt!343750 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!217214 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!217214 (= lt!343760 (reader!0 (_2!9905 lt!342775) (_2!9905 lt!343763)))))

(declare-fun b!217215 () Bool)

(assert (=> b!217215 (= e!147699 (= (_1!9908 lt!343788) (_2!9907 lt!343760)))))

(declare-fun b!217216 () Bool)

(assert (=> b!217216 (= e!147704 (validate_offset_bits!1 ((_ sign_extend 32) (size!4657 (buf!5198 (_2!9905 lt!342775)))) ((_ sign_extend 32) (currentByte!9785 (_2!9905 lt!342775))) ((_ sign_extend 32) (currentBit!9780 (_2!9905 lt!342775))) lt!343750))))

(declare-fun d!73599 () Bool)

(assert (=> d!73599 e!147702))

(declare-fun res!182759 () Bool)

(assert (=> d!73599 (=> (not res!182759) (not e!147702))))

(assert (=> d!73599 (= res!182759 (invariant!0 (currentBit!9780 (_2!9905 lt!343763)) (currentByte!9785 (_2!9905 lt!343763)) (size!4657 (buf!5198 (_2!9905 lt!343763)))))))

(assert (=> d!73599 (= lt!343763 e!147700)))

(declare-fun c!10617 () Bool)

(assert (=> d!73599 (= c!10617 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!73599 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!73599 (= (appendBitsLSBFirstLoopTR!0 (_2!9905 lt!342775) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!343763)))

(declare-fun b!217217 () Bool)

(declare-fun res!182762 () Bool)

(assert (=> b!217217 (= res!182762 (= (bitIndex!0 (size!4657 (buf!5198 (_2!9905 lt!343757))) (currentByte!9785 (_2!9905 lt!343757)) (currentBit!9780 (_2!9905 lt!343757))) (bvadd (bitIndex!0 (size!4657 (buf!5198 (_2!9905 lt!342775))) (currentByte!9785 (_2!9905 lt!342775)) (currentBit!9780 (_2!9905 lt!342775))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!217217 (=> (not res!182762) (not e!147703))))

(declare-fun b!217218 () Bool)

(assert (=> b!217218 (= e!147705 (= (bitIndex!0 (size!4657 (buf!5198 (_1!9906 lt!343764))) (currentByte!9785 (_1!9906 lt!343764)) (currentBit!9780 (_1!9906 lt!343764))) (bitIndex!0 (size!4657 (buf!5198 (_2!9905 lt!343757))) (currentByte!9785 (_2!9905 lt!343757)) (currentBit!9780 (_2!9905 lt!343757)))))))

(declare-fun b!217219 () Bool)

(declare-fun res!182766 () Bool)

(assert (=> b!217219 (=> (not res!182766) (not e!147702))))

(assert (=> b!217219 (= res!182766 (isPrefixOf!0 (_2!9905 lt!342775) (_2!9905 lt!343763)))))

(declare-fun b!217220 () Bool)

(assert (=> b!217220 (= e!147697 (= (_1!9908 lt!343743) (_2!9907 lt!343751)))))

(declare-fun b!217221 () Bool)

(declare-fun res!182757 () Bool)

(assert (=> b!217221 (=> (not res!182757) (not e!147702))))

(declare-fun lt!343758 () (_ BitVec 64))

(declare-fun lt!343779 () (_ BitVec 64))

(assert (=> b!217221 (= res!182757 (= (bitIndex!0 (size!4657 (buf!5198 (_2!9905 lt!343763))) (currentByte!9785 (_2!9905 lt!343763)) (currentBit!9780 (_2!9905 lt!343763))) (bvsub lt!343779 lt!343758)))))

(assert (=> b!217221 (or (= (bvand lt!343779 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!343758 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!343779 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!343779 lt!343758) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!217221 (= lt!343758 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!343786 () (_ BitVec 64))

(declare-fun lt!343769 () (_ BitVec 64))

(assert (=> b!217221 (= lt!343779 (bvadd lt!343786 lt!343769))))

(assert (=> b!217221 (or (not (= (bvand lt!343786 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!343769 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!343786 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!343786 lt!343769) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!217221 (= lt!343769 ((_ sign_extend 32) nBits!348))))

(assert (=> b!217221 (= lt!343786 (bitIndex!0 (size!4657 (buf!5198 (_2!9905 lt!342775))) (currentByte!9785 (_2!9905 lt!342775)) (currentBit!9780 (_2!9905 lt!342775))))))

(declare-fun bm!3396 () Bool)

(assert (=> bm!3396 (= call!3399 (isPrefixOf!0 (_2!9905 lt!342775) (ite c!10617 (_2!9905 lt!342775) (_2!9905 lt!343757))))))

(declare-fun b!217222 () Bool)

(declare-fun res!182758 () Bool)

(assert (=> b!217222 (= res!182758 call!3399)))

(assert (=> b!217222 (=> (not res!182758) (not e!147703))))

(declare-fun b!217223 () Bool)

(assert (=> b!217223 (= e!147701 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!217224 () Bool)

(assert (=> b!217224 (= e!147701 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (= (and d!73599 c!10617) b!217213))

(assert (= (and d!73599 (not c!10617)) b!217212))

(assert (= (and b!217212 res!182764) b!217217))

(assert (= (and b!217217 res!182762) b!217222))

(assert (= (and b!217222 res!182758) b!217210))

(assert (= (and b!217210 res!182768) b!217218))

(assert (= (and b!217212 res!182761) b!217211))

(assert (= (and b!217212 c!10618) b!217224))

(assert (= (and b!217212 (not c!10618)) b!217223))

(assert (= (and b!217212 res!182765) b!217220))

(assert (= (or b!217213 b!217222) bm!3396))

(assert (= (and d!73599 res!182759) b!217209))

(assert (= (and b!217209 res!182767) b!217221))

(assert (= (and b!217221 res!182757) b!217219))

(assert (= (and b!217219 res!182766) b!217214))

(assert (= (and b!217214 res!182760) b!217216))

(assert (= (and b!217214 res!182763) b!217215))

(declare-fun m!335111 () Bool)

(assert (=> b!217213 m!335111))

(declare-fun m!335113 () Bool)

(assert (=> d!73599 m!335113))

(declare-fun m!335115 () Bool)

(assert (=> b!217214 m!335115))

(assert (=> b!217214 m!334451))

(declare-fun m!335117 () Bool)

(assert (=> b!217214 m!335117))

(declare-fun m!335119 () Bool)

(assert (=> b!217214 m!335119))

(declare-fun m!335121 () Bool)

(assert (=> b!217214 m!335121))

(declare-fun m!335123 () Bool)

(assert (=> b!217214 m!335123))

(declare-fun m!335125 () Bool)

(assert (=> b!217216 m!335125))

(declare-fun m!335127 () Bool)

(assert (=> bm!3396 m!335127))

(declare-fun m!335129 () Bool)

(assert (=> b!217210 m!335129))

(assert (=> b!217210 m!335129))

(declare-fun m!335131 () Bool)

(assert (=> b!217210 m!335131))

(declare-fun m!335133 () Bool)

(assert (=> b!217218 m!335133))

(declare-fun m!335135 () Bool)

(assert (=> b!217218 m!335135))

(declare-fun m!335137 () Bool)

(assert (=> b!217219 m!335137))

(assert (=> b!217217 m!335135))

(assert (=> b!217217 m!334411))

(declare-fun m!335139 () Bool)

(assert (=> b!217221 m!335139))

(assert (=> b!217221 m!334411))

(declare-fun m!335141 () Bool)

(assert (=> b!217212 m!335141))

(declare-fun m!335143 () Bool)

(assert (=> b!217212 m!335143))

(declare-fun m!335145 () Bool)

(assert (=> b!217212 m!335145))

(declare-fun m!335147 () Bool)

(assert (=> b!217212 m!335147))

(assert (=> b!217212 m!334411))

(declare-fun m!335149 () Bool)

(assert (=> b!217212 m!335149))

(declare-fun m!335151 () Bool)

(assert (=> b!217212 m!335151))

(declare-fun m!335153 () Bool)

(assert (=> b!217212 m!335153))

(declare-fun m!335155 () Bool)

(assert (=> b!217212 m!335155))

(declare-fun m!335157 () Bool)

(assert (=> b!217212 m!335157))

(declare-fun m!335159 () Bool)

(assert (=> b!217212 m!335159))

(declare-fun m!335161 () Bool)

(assert (=> b!217212 m!335161))

(declare-fun m!335163 () Bool)

(assert (=> b!217212 m!335163))

(declare-fun m!335165 () Bool)

(assert (=> b!217212 m!335165))

(declare-fun m!335167 () Bool)

(assert (=> b!217212 m!335167))

(declare-fun m!335169 () Bool)

(assert (=> b!217212 m!335169))

(declare-fun m!335171 () Bool)

(assert (=> b!217212 m!335171))

(assert (=> b!217212 m!334451))

(declare-fun m!335173 () Bool)

(assert (=> b!217212 m!335173))

(declare-fun m!335175 () Bool)

(assert (=> b!217212 m!335175))

(declare-fun m!335177 () Bool)

(assert (=> b!217212 m!335177))

(declare-fun m!335179 () Bool)

(assert (=> b!217212 m!335179))

(declare-fun m!335181 () Bool)

(assert (=> b!217212 m!335181))

(declare-fun m!335183 () Bool)

(assert (=> b!217212 m!335183))

(declare-fun m!335185 () Bool)

(assert (=> b!217212 m!335185))

(declare-fun m!335187 () Bool)

(assert (=> b!217212 m!335187))

(declare-fun m!335189 () Bool)

(assert (=> b!217212 m!335189))

(assert (=> b!217212 m!335123))

(declare-fun m!335191 () Bool)

(assert (=> b!217212 m!335191))

(declare-fun m!335193 () Bool)

(assert (=> b!217212 m!335193))

(declare-fun m!335195 () Bool)

(assert (=> b!217212 m!335195))

(declare-fun m!335197 () Bool)

(assert (=> b!217212 m!335197))

(assert (=> b!217212 m!335153))

(declare-fun m!335199 () Bool)

(assert (=> b!217212 m!335199))

(declare-fun m!335201 () Bool)

(assert (=> b!217212 m!335201))

(assert (=> b!216774 d!73599))

(declare-fun e!147711 () Bool)

(declare-fun lt!343849 () (_ BitVec 64))

(declare-fun b!217235 () Bool)

(declare-fun lt!343848 () (_ BitVec 64))

(declare-fun lt!343844 () tuple2!18498)

(assert (=> b!217235 (= e!147711 (= (_1!9907 lt!343844) (withMovedBitIndex!0 (_2!9907 lt!343844) (bvsub lt!343849 lt!343848))))))

(assert (=> b!217235 (or (= (bvand lt!343849 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!343848 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!343849 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!343849 lt!343848) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!217235 (= lt!343848 (bitIndex!0 (size!4657 (buf!5198 (_2!9905 lt!342780))) (currentByte!9785 (_2!9905 lt!342780)) (currentBit!9780 (_2!9905 lt!342780))))))

(assert (=> b!217235 (= lt!343849 (bitIndex!0 (size!4657 (buf!5198 (_2!9905 lt!342775))) (currentByte!9785 (_2!9905 lt!342775)) (currentBit!9780 (_2!9905 lt!342775))))))

(declare-fun b!217236 () Bool)

(declare-fun e!147710 () Unit!15433)

(declare-fun lt!343835 () Unit!15433)

(assert (=> b!217236 (= e!147710 lt!343835)))

(declare-fun lt!343839 () (_ BitVec 64))

(assert (=> b!217236 (= lt!343839 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!343834 () (_ BitVec 64))

(assert (=> b!217236 (= lt!343834 (bitIndex!0 (size!4657 (buf!5198 (_2!9905 lt!342775))) (currentByte!9785 (_2!9905 lt!342775)) (currentBit!9780 (_2!9905 lt!342775))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!10604 array!10604 (_ BitVec 64) (_ BitVec 64)) Unit!15433)

(assert (=> b!217236 (= lt!343835 (arrayBitRangesEqSymmetric!0 (buf!5198 (_2!9905 lt!342775)) (buf!5198 (_2!9905 lt!342780)) lt!343839 lt!343834))))

(assert (=> b!217236 (arrayBitRangesEq!0 (buf!5198 (_2!9905 lt!342780)) (buf!5198 (_2!9905 lt!342775)) lt!343839 lt!343834)))

(declare-fun b!217237 () Bool)

(declare-fun res!182777 () Bool)

(assert (=> b!217237 (=> (not res!182777) (not e!147711))))

(assert (=> b!217237 (= res!182777 (isPrefixOf!0 (_2!9907 lt!343844) (_2!9905 lt!342780)))))

(declare-fun b!217239 () Bool)

(declare-fun Unit!15465 () Unit!15433)

(assert (=> b!217239 (= e!147710 Unit!15465)))

(declare-fun b!217238 () Bool)

(declare-fun res!182776 () Bool)

(assert (=> b!217238 (=> (not res!182776) (not e!147711))))

(assert (=> b!217238 (= res!182776 (isPrefixOf!0 (_1!9907 lt!343844) (_2!9905 lt!342775)))))

(declare-fun d!73687 () Bool)

(assert (=> d!73687 e!147711))

(declare-fun res!182775 () Bool)

(assert (=> d!73687 (=> (not res!182775) (not e!147711))))

(assert (=> d!73687 (= res!182775 (isPrefixOf!0 (_1!9907 lt!343844) (_2!9907 lt!343844)))))

(declare-fun lt!343841 () BitStream!8422)

(assert (=> d!73687 (= lt!343844 (tuple2!18499 lt!343841 (_2!9905 lt!342780)))))

(declare-fun lt!343837 () Unit!15433)

(declare-fun lt!343846 () Unit!15433)

(assert (=> d!73687 (= lt!343837 lt!343846)))

(assert (=> d!73687 (isPrefixOf!0 lt!343841 (_2!9905 lt!342780))))

(assert (=> d!73687 (= lt!343846 (lemmaIsPrefixTransitive!0 lt!343841 (_2!9905 lt!342780) (_2!9905 lt!342780)))))

(declare-fun lt!343833 () Unit!15433)

(declare-fun lt!343842 () Unit!15433)

(assert (=> d!73687 (= lt!343833 lt!343842)))

(assert (=> d!73687 (isPrefixOf!0 lt!343841 (_2!9905 lt!342780))))

(assert (=> d!73687 (= lt!343842 (lemmaIsPrefixTransitive!0 lt!343841 (_2!9905 lt!342775) (_2!9905 lt!342780)))))

(declare-fun lt!343840 () Unit!15433)

(assert (=> d!73687 (= lt!343840 e!147710)))

(declare-fun c!10621 () Bool)

(assert (=> d!73687 (= c!10621 (not (= (size!4657 (buf!5198 (_2!9905 lt!342775))) #b00000000000000000000000000000000)))))

(declare-fun lt!343843 () Unit!15433)

(declare-fun lt!343852 () Unit!15433)

(assert (=> d!73687 (= lt!343843 lt!343852)))

(assert (=> d!73687 (isPrefixOf!0 (_2!9905 lt!342780) (_2!9905 lt!342780))))

(assert (=> d!73687 (= lt!343852 (lemmaIsPrefixRefl!0 (_2!9905 lt!342780)))))

(declare-fun lt!343836 () Unit!15433)

(declare-fun lt!343838 () Unit!15433)

(assert (=> d!73687 (= lt!343836 lt!343838)))

(assert (=> d!73687 (= lt!343838 (lemmaIsPrefixRefl!0 (_2!9905 lt!342780)))))

(declare-fun lt!343851 () Unit!15433)

(declare-fun lt!343850 () Unit!15433)

(assert (=> d!73687 (= lt!343851 lt!343850)))

(assert (=> d!73687 (isPrefixOf!0 lt!343841 lt!343841)))

(assert (=> d!73687 (= lt!343850 (lemmaIsPrefixRefl!0 lt!343841))))

(declare-fun lt!343845 () Unit!15433)

(declare-fun lt!343847 () Unit!15433)

(assert (=> d!73687 (= lt!343845 lt!343847)))

(assert (=> d!73687 (isPrefixOf!0 (_2!9905 lt!342775) (_2!9905 lt!342775))))

(assert (=> d!73687 (= lt!343847 (lemmaIsPrefixRefl!0 (_2!9905 lt!342775)))))

(assert (=> d!73687 (= lt!343841 (BitStream!8423 (buf!5198 (_2!9905 lt!342780)) (currentByte!9785 (_2!9905 lt!342775)) (currentBit!9780 (_2!9905 lt!342775))))))

(assert (=> d!73687 (isPrefixOf!0 (_2!9905 lt!342775) (_2!9905 lt!342780))))

(assert (=> d!73687 (= (reader!0 (_2!9905 lt!342775) (_2!9905 lt!342780)) lt!343844)))

(assert (= (and d!73687 c!10621) b!217236))

(assert (= (and d!73687 (not c!10621)) b!217239))

(assert (= (and d!73687 res!182775) b!217238))

(assert (= (and b!217238 res!182776) b!217237))

(assert (= (and b!217237 res!182777) b!217235))

(declare-fun m!335203 () Bool)

(assert (=> b!217237 m!335203))

(declare-fun m!335205 () Bool)

(assert (=> d!73687 m!335205))

(declare-fun m!335207 () Bool)

(assert (=> d!73687 m!335207))

(declare-fun m!335209 () Bool)

(assert (=> d!73687 m!335209))

(declare-fun m!335211 () Bool)

(assert (=> d!73687 m!335211))

(declare-fun m!335213 () Bool)

(assert (=> d!73687 m!335213))

(assert (=> d!73687 m!334423))

(declare-fun m!335215 () Bool)

(assert (=> d!73687 m!335215))

(declare-fun m!335217 () Bool)

(assert (=> d!73687 m!335217))

(declare-fun m!335219 () Bool)

(assert (=> d!73687 m!335219))

(assert (=> d!73687 m!335111))

(declare-fun m!335221 () Bool)

(assert (=> d!73687 m!335221))

(assert (=> b!217236 m!334411))

(declare-fun m!335223 () Bool)

(assert (=> b!217236 m!335223))

(declare-fun m!335225 () Bool)

(assert (=> b!217236 m!335225))

(declare-fun m!335227 () Bool)

(assert (=> b!217235 m!335227))

(assert (=> b!217235 m!334443))

(assert (=> b!217235 m!334411))

(declare-fun m!335229 () Bool)

(assert (=> b!217238 m!335229))

(assert (=> b!216785 d!73687))

(declare-fun d!73689 () Bool)

(declare-fun e!147712 () Bool)

(assert (=> d!73689 e!147712))

(declare-fun res!182778 () Bool)

(assert (=> d!73689 (=> (not res!182778) (not e!147712))))

(declare-fun lt!343855 () (_ BitVec 64))

(declare-fun lt!343858 () (_ BitVec 64))

(declare-fun lt!343857 () (_ BitVec 64))

(assert (=> d!73689 (= res!182778 (= lt!343858 (bvsub lt!343857 lt!343855)))))

(assert (=> d!73689 (or (= (bvand lt!343857 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!343855 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!343857 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!343857 lt!343855) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73689 (= lt!343855 (remainingBits!0 ((_ sign_extend 32) (size!4657 (buf!5198 (_1!9906 lt!342772)))) ((_ sign_extend 32) (currentByte!9785 (_1!9906 lt!342772))) ((_ sign_extend 32) (currentBit!9780 (_1!9906 lt!342772)))))))

(declare-fun lt!343853 () (_ BitVec 64))

(declare-fun lt!343856 () (_ BitVec 64))

(assert (=> d!73689 (= lt!343857 (bvmul lt!343853 lt!343856))))

(assert (=> d!73689 (or (= lt!343853 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!343856 (bvsdiv (bvmul lt!343853 lt!343856) lt!343853)))))

(assert (=> d!73689 (= lt!343856 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!73689 (= lt!343853 ((_ sign_extend 32) (size!4657 (buf!5198 (_1!9906 lt!342772)))))))

(assert (=> d!73689 (= lt!343858 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9785 (_1!9906 lt!342772))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9780 (_1!9906 lt!342772)))))))

(assert (=> d!73689 (invariant!0 (currentBit!9780 (_1!9906 lt!342772)) (currentByte!9785 (_1!9906 lt!342772)) (size!4657 (buf!5198 (_1!9906 lt!342772))))))

(assert (=> d!73689 (= (bitIndex!0 (size!4657 (buf!5198 (_1!9906 lt!342772))) (currentByte!9785 (_1!9906 lt!342772)) (currentBit!9780 (_1!9906 lt!342772))) lt!343858)))

(declare-fun b!217240 () Bool)

(declare-fun res!182779 () Bool)

(assert (=> b!217240 (=> (not res!182779) (not e!147712))))

(assert (=> b!217240 (= res!182779 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!343858))))

(declare-fun b!217241 () Bool)

(declare-fun lt!343854 () (_ BitVec 64))

(assert (=> b!217241 (= e!147712 (bvsle lt!343858 (bvmul lt!343854 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!217241 (or (= lt!343854 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!343854 #b0000000000000000000000000000000000000000000000000000000000001000) lt!343854)))))

(assert (=> b!217241 (= lt!343854 ((_ sign_extend 32) (size!4657 (buf!5198 (_1!9906 lt!342772)))))))

(assert (= (and d!73689 res!182778) b!217240))

(assert (= (and b!217240 res!182779) b!217241))

(declare-fun m!335231 () Bool)

(assert (=> d!73689 m!335231))

(declare-fun m!335233 () Bool)

(assert (=> d!73689 m!335233))

(assert (=> b!216785 d!73689))

(declare-fun d!73691 () Bool)

(declare-fun e!147715 () Bool)

(assert (=> d!73691 e!147715))

(declare-fun res!182782 () Bool)

(assert (=> d!73691 (=> (not res!182782) (not e!147715))))

(declare-fun lt!343870 () tuple2!18496)

(declare-fun lt!343868 () tuple2!18496)

(assert (=> d!73691 (= res!182782 (= (bitIndex!0 (size!4657 (buf!5198 (_1!9906 lt!343870))) (currentByte!9785 (_1!9906 lt!343870)) (currentBit!9780 (_1!9906 lt!343870))) (bitIndex!0 (size!4657 (buf!5198 (_1!9906 lt!343868))) (currentByte!9785 (_1!9906 lt!343868)) (currentBit!9780 (_1!9906 lt!343868)))))))

(declare-fun lt!343869 () Unit!15433)

(declare-fun lt!343867 () BitStream!8422)

(declare-fun choose!50 (BitStream!8422 BitStream!8422 BitStream!8422 tuple2!18496 tuple2!18496 BitStream!8422 Bool tuple2!18496 tuple2!18496 BitStream!8422 Bool) Unit!15433)

(assert (=> d!73691 (= lt!343869 (choose!50 lt!342795 (_2!9905 lt!342780) lt!343867 lt!343870 (tuple2!18497 (_1!9906 lt!343870) (_2!9906 lt!343870)) (_1!9906 lt!343870) (_2!9906 lt!343870) lt!343868 (tuple2!18497 (_1!9906 lt!343868) (_2!9906 lt!343868)) (_1!9906 lt!343868) (_2!9906 lt!343868)))))

(assert (=> d!73691 (= lt!343868 (readBitPure!0 lt!343867))))

(assert (=> d!73691 (= lt!343870 (readBitPure!0 lt!342795))))

(assert (=> d!73691 (= lt!343867 (BitStream!8423 (buf!5198 (_2!9905 lt!342780)) (currentByte!9785 lt!342795) (currentBit!9780 lt!342795)))))

(assert (=> d!73691 (invariant!0 (currentBit!9780 lt!342795) (currentByte!9785 lt!342795) (size!4657 (buf!5198 (_2!9905 lt!342780))))))

(assert (=> d!73691 (= (readBitPrefixLemma!0 lt!342795 (_2!9905 lt!342780)) lt!343869)))

(declare-fun b!217244 () Bool)

(assert (=> b!217244 (= e!147715 (= (_2!9906 lt!343870) (_2!9906 lt!343868)))))

(assert (= (and d!73691 res!182782) b!217244))

(declare-fun m!335235 () Bool)

(assert (=> d!73691 m!335235))

(declare-fun m!335237 () Bool)

(assert (=> d!73691 m!335237))

(declare-fun m!335239 () Bool)

(assert (=> d!73691 m!335239))

(declare-fun m!335241 () Bool)

(assert (=> d!73691 m!335241))

(assert (=> d!73691 m!334473))

(declare-fun m!335243 () Bool)

(assert (=> d!73691 m!335243))

(assert (=> b!216785 d!73691))

(declare-fun b!217247 () Bool)

(declare-fun e!147717 () Bool)

(declare-fun lt!343884 () tuple2!18498)

(declare-fun lt!343889 () (_ BitVec 64))

(declare-fun lt!343888 () (_ BitVec 64))

(assert (=> b!217247 (= e!147717 (= (_1!9907 lt!343884) (withMovedBitIndex!0 (_2!9907 lt!343884) (bvsub lt!343889 lt!343888))))))

(assert (=> b!217247 (or (= (bvand lt!343889 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!343888 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!343889 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!343889 lt!343888) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!217247 (= lt!343888 (bitIndex!0 (size!4657 (buf!5198 (_2!9905 lt!342780))) (currentByte!9785 (_2!9905 lt!342780)) (currentBit!9780 (_2!9905 lt!342780))))))

(assert (=> b!217247 (= lt!343889 (bitIndex!0 (size!4657 (buf!5198 thiss!1204)) (currentByte!9785 thiss!1204) (currentBit!9780 thiss!1204)))))

(declare-fun b!217248 () Bool)

(declare-fun e!147716 () Unit!15433)

(declare-fun lt!343875 () Unit!15433)

(assert (=> b!217248 (= e!147716 lt!343875)))

(declare-fun lt!343879 () (_ BitVec 64))

(assert (=> b!217248 (= lt!343879 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!343874 () (_ BitVec 64))

(assert (=> b!217248 (= lt!343874 (bitIndex!0 (size!4657 (buf!5198 thiss!1204)) (currentByte!9785 thiss!1204) (currentBit!9780 thiss!1204)))))

(assert (=> b!217248 (= lt!343875 (arrayBitRangesEqSymmetric!0 (buf!5198 thiss!1204) (buf!5198 (_2!9905 lt!342780)) lt!343879 lt!343874))))

(assert (=> b!217248 (arrayBitRangesEq!0 (buf!5198 (_2!9905 lt!342780)) (buf!5198 thiss!1204) lt!343879 lt!343874)))

(declare-fun b!217249 () Bool)

(declare-fun res!182785 () Bool)

(assert (=> b!217249 (=> (not res!182785) (not e!147717))))

(assert (=> b!217249 (= res!182785 (isPrefixOf!0 (_2!9907 lt!343884) (_2!9905 lt!342780)))))

(declare-fun b!217251 () Bool)

(declare-fun Unit!15466 () Unit!15433)

(assert (=> b!217251 (= e!147716 Unit!15466)))

(declare-fun b!217250 () Bool)

(declare-fun res!182784 () Bool)

(assert (=> b!217250 (=> (not res!182784) (not e!147717))))

(assert (=> b!217250 (= res!182784 (isPrefixOf!0 (_1!9907 lt!343884) thiss!1204))))

(declare-fun d!73693 () Bool)

(assert (=> d!73693 e!147717))

(declare-fun res!182783 () Bool)

(assert (=> d!73693 (=> (not res!182783) (not e!147717))))

(assert (=> d!73693 (= res!182783 (isPrefixOf!0 (_1!9907 lt!343884) (_2!9907 lt!343884)))))

(declare-fun lt!343881 () BitStream!8422)

(assert (=> d!73693 (= lt!343884 (tuple2!18499 lt!343881 (_2!9905 lt!342780)))))

(declare-fun lt!343877 () Unit!15433)

(declare-fun lt!343886 () Unit!15433)

(assert (=> d!73693 (= lt!343877 lt!343886)))

(assert (=> d!73693 (isPrefixOf!0 lt!343881 (_2!9905 lt!342780))))

(assert (=> d!73693 (= lt!343886 (lemmaIsPrefixTransitive!0 lt!343881 (_2!9905 lt!342780) (_2!9905 lt!342780)))))

(declare-fun lt!343873 () Unit!15433)

(declare-fun lt!343882 () Unit!15433)

(assert (=> d!73693 (= lt!343873 lt!343882)))

(assert (=> d!73693 (isPrefixOf!0 lt!343881 (_2!9905 lt!342780))))

(assert (=> d!73693 (= lt!343882 (lemmaIsPrefixTransitive!0 lt!343881 thiss!1204 (_2!9905 lt!342780)))))

(declare-fun lt!343880 () Unit!15433)

(assert (=> d!73693 (= lt!343880 e!147716)))

(declare-fun c!10622 () Bool)

(assert (=> d!73693 (= c!10622 (not (= (size!4657 (buf!5198 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!343883 () Unit!15433)

(declare-fun lt!343892 () Unit!15433)

(assert (=> d!73693 (= lt!343883 lt!343892)))

(assert (=> d!73693 (isPrefixOf!0 (_2!9905 lt!342780) (_2!9905 lt!342780))))

(assert (=> d!73693 (= lt!343892 (lemmaIsPrefixRefl!0 (_2!9905 lt!342780)))))

(declare-fun lt!343876 () Unit!15433)

(declare-fun lt!343878 () Unit!15433)

(assert (=> d!73693 (= lt!343876 lt!343878)))

(assert (=> d!73693 (= lt!343878 (lemmaIsPrefixRefl!0 (_2!9905 lt!342780)))))

(declare-fun lt!343891 () Unit!15433)

(declare-fun lt!343890 () Unit!15433)

(assert (=> d!73693 (= lt!343891 lt!343890)))

(assert (=> d!73693 (isPrefixOf!0 lt!343881 lt!343881)))

(assert (=> d!73693 (= lt!343890 (lemmaIsPrefixRefl!0 lt!343881))))

(declare-fun lt!343885 () Unit!15433)

(declare-fun lt!343887 () Unit!15433)

(assert (=> d!73693 (= lt!343885 lt!343887)))

(assert (=> d!73693 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!73693 (= lt!343887 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!73693 (= lt!343881 (BitStream!8423 (buf!5198 (_2!9905 lt!342780)) (currentByte!9785 thiss!1204) (currentBit!9780 thiss!1204)))))

(assert (=> d!73693 (isPrefixOf!0 thiss!1204 (_2!9905 lt!342780))))

(assert (=> d!73693 (= (reader!0 thiss!1204 (_2!9905 lt!342780)) lt!343884)))

(assert (= (and d!73693 c!10622) b!217248))

(assert (= (and d!73693 (not c!10622)) b!217251))

(assert (= (and d!73693 res!182783) b!217250))

(assert (= (and b!217250 res!182784) b!217249))

(assert (= (and b!217249 res!182785) b!217247))

(declare-fun m!335245 () Bool)

(assert (=> b!217249 m!335245))

(declare-fun m!335247 () Bool)

(assert (=> d!73693 m!335247))

(assert (=> d!73693 m!335207))

(declare-fun m!335249 () Bool)

(assert (=> d!73693 m!335249))

(assert (=> d!73693 m!335211))

(declare-fun m!335251 () Bool)

(assert (=> d!73693 m!335251))

(assert (=> d!73693 m!334445))

(declare-fun m!335253 () Bool)

(assert (=> d!73693 m!335253))

(declare-fun m!335255 () Bool)

(assert (=> d!73693 m!335255))

(declare-fun m!335257 () Bool)

(assert (=> d!73693 m!335257))

(declare-fun m!335259 () Bool)

(assert (=> d!73693 m!335259))

(declare-fun m!335261 () Bool)

(assert (=> d!73693 m!335261))

(assert (=> b!217248 m!334413))

(declare-fun m!335263 () Bool)

(assert (=> b!217248 m!335263))

(declare-fun m!335265 () Bool)

(assert (=> b!217248 m!335265))

(declare-fun m!335267 () Bool)

(assert (=> b!217247 m!335267))

(assert (=> b!217247 m!334443))

(assert (=> b!217247 m!334413))

(declare-fun m!335269 () Bool)

(assert (=> b!217250 m!335269))

(assert (=> b!216785 d!73693))

(declare-fun d!73695 () Bool)

(declare-fun lt!343903 () tuple2!18524)

(assert (=> d!73695 (= lt!343903 (readBit!0 (BitStream!8423 (buf!5198 (_2!9905 lt!342780)) (currentByte!9785 thiss!1204) (currentBit!9780 thiss!1204))))))

(assert (=> d!73695 (= (readBitPure!0 (BitStream!8423 (buf!5198 (_2!9905 lt!342780)) (currentByte!9785 thiss!1204) (currentBit!9780 thiss!1204))) (tuple2!18497 (_2!9920 lt!343903) (_1!9920 lt!343903)))))

(declare-fun bs!17993 () Bool)

(assert (= bs!17993 d!73695))

(declare-fun m!335271 () Bool)

(assert (=> bs!17993 m!335271))

(assert (=> b!216785 d!73695))

(declare-fun d!73697 () Bool)

(declare-fun e!147722 () Bool)

(assert (=> d!73697 e!147722))

(declare-fun res!182790 () Bool)

(assert (=> d!73697 (=> (not res!182790) (not e!147722))))

(declare-fun lt!343908 () (_ BitVec 64))

(declare-fun lt!343909 () (_ BitVec 64))

(declare-fun lt!343906 () (_ BitVec 64))

(assert (=> d!73697 (= res!182790 (= lt!343909 (bvsub lt!343908 lt!343906)))))

(assert (=> d!73697 (or (= (bvand lt!343908 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!343906 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!343908 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!343908 lt!343906) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73697 (= lt!343906 (remainingBits!0 ((_ sign_extend 32) (size!4657 (buf!5198 (_1!9906 lt!342797)))) ((_ sign_extend 32) (currentByte!9785 (_1!9906 lt!342797))) ((_ sign_extend 32) (currentBit!9780 (_1!9906 lt!342797)))))))

(declare-fun lt!343904 () (_ BitVec 64))

(declare-fun lt!343907 () (_ BitVec 64))

(assert (=> d!73697 (= lt!343908 (bvmul lt!343904 lt!343907))))

(assert (=> d!73697 (or (= lt!343904 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!343907 (bvsdiv (bvmul lt!343904 lt!343907) lt!343904)))))

(assert (=> d!73697 (= lt!343907 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!73697 (= lt!343904 ((_ sign_extend 32) (size!4657 (buf!5198 (_1!9906 lt!342797)))))))

(assert (=> d!73697 (= lt!343909 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9785 (_1!9906 lt!342797))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9780 (_1!9906 lt!342797)))))))

(assert (=> d!73697 (invariant!0 (currentBit!9780 (_1!9906 lt!342797)) (currentByte!9785 (_1!9906 lt!342797)) (size!4657 (buf!5198 (_1!9906 lt!342797))))))

(assert (=> d!73697 (= (bitIndex!0 (size!4657 (buf!5198 (_1!9906 lt!342797))) (currentByte!9785 (_1!9906 lt!342797)) (currentBit!9780 (_1!9906 lt!342797))) lt!343909)))

(declare-fun b!217256 () Bool)

(declare-fun res!182791 () Bool)

(assert (=> b!217256 (=> (not res!182791) (not e!147722))))

(assert (=> b!217256 (= res!182791 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!343909))))

(declare-fun b!217257 () Bool)

(declare-fun lt!343905 () (_ BitVec 64))

(assert (=> b!217257 (= e!147722 (bvsle lt!343909 (bvmul lt!343905 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!217257 (or (= lt!343905 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!343905 #b0000000000000000000000000000000000000000000000000000000000001000) lt!343905)))))

(assert (=> b!217257 (= lt!343905 ((_ sign_extend 32) (size!4657 (buf!5198 (_1!9906 lt!342797)))))))

(assert (= (and d!73697 res!182790) b!217256))

(assert (= (and b!217256 res!182791) b!217257))

(declare-fun m!335273 () Bool)

(assert (=> d!73697 m!335273))

(declare-fun m!335275 () Bool)

(assert (=> d!73697 m!335275))

(assert (=> b!216785 d!73697))

(declare-fun d!73699 () Bool)

(assert (=> d!73699 (validate_offset_bits!1 ((_ sign_extend 32) (size!4657 (buf!5198 (_2!9905 lt!342780)))) ((_ sign_extend 32) (currentByte!9785 (_2!9905 lt!342775))) ((_ sign_extend 32) (currentBit!9780 (_2!9905 lt!342775))) lt!342788)))

(declare-fun lt!343932 () Unit!15433)

(declare-fun choose!9 (BitStream!8422 array!10604 (_ BitVec 64) BitStream!8422) Unit!15433)

(assert (=> d!73699 (= lt!343932 (choose!9 (_2!9905 lt!342775) (buf!5198 (_2!9905 lt!342780)) lt!342788 (BitStream!8423 (buf!5198 (_2!9905 lt!342780)) (currentByte!9785 (_2!9905 lt!342775)) (currentBit!9780 (_2!9905 lt!342775)))))))

(assert (=> d!73699 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9905 lt!342775) (buf!5198 (_2!9905 lt!342780)) lt!342788) lt!343932)))

(declare-fun bs!17994 () Bool)

(assert (= bs!17994 d!73699))

(assert (=> bs!17994 m!334455))

(declare-fun m!335277 () Bool)

(assert (=> bs!17994 m!335277))

(assert (=> b!216785 d!73699))

(declare-fun d!73701 () Bool)

(declare-fun lt!343935 () tuple2!18524)

(assert (=> d!73701 (= lt!343935 (readBit!0 (_1!9907 lt!342784)))))

(assert (=> d!73701 (= (readBitPure!0 (_1!9907 lt!342784)) (tuple2!18497 (_2!9920 lt!343935) (_1!9920 lt!343935)))))

(declare-fun bs!17995 () Bool)

(assert (= bs!17995 d!73701))

(declare-fun m!335279 () Bool)

(assert (=> bs!17995 m!335279))

(assert (=> b!216785 d!73701))

(declare-fun d!73703 () Bool)

(assert (=> d!73703 (validate_offset_bits!1 ((_ sign_extend 32) (size!4657 (buf!5198 (_2!9905 lt!342780)))) ((_ sign_extend 32) (currentByte!9785 thiss!1204)) ((_ sign_extend 32) (currentBit!9780 thiss!1204)) lt!342793)))

(declare-fun lt!343936 () Unit!15433)

(assert (=> d!73703 (= lt!343936 (choose!9 thiss!1204 (buf!5198 (_2!9905 lt!342780)) lt!342793 (BitStream!8423 (buf!5198 (_2!9905 lt!342780)) (currentByte!9785 thiss!1204) (currentBit!9780 thiss!1204))))))

(assert (=> d!73703 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5198 (_2!9905 lt!342780)) lt!342793) lt!343936)))

(declare-fun bs!17996 () Bool)

(assert (= bs!17996 d!73703))

(assert (=> bs!17996 m!334463))

(declare-fun m!335281 () Bool)

(assert (=> bs!17996 m!335281))

(assert (=> b!216785 d!73703))

(declare-fun d!73705 () Bool)

(declare-fun lt!343939 () tuple2!18524)

(assert (=> d!73705 (= lt!343939 (readBit!0 lt!342795))))

(assert (=> d!73705 (= (readBitPure!0 lt!342795) (tuple2!18497 (_2!9920 lt!343939) (_1!9920 lt!343939)))))

(declare-fun bs!17997 () Bool)

(assert (= bs!17997 d!73705))

(declare-fun m!335283 () Bool)

(assert (=> bs!17997 m!335283))

(assert (=> b!216785 d!73705))

(declare-fun d!73707 () Bool)

(assert (=> d!73707 (= (invariant!0 (currentBit!9780 thiss!1204) (currentByte!9785 thiss!1204) (size!4657 (buf!5198 (_2!9905 lt!342775)))) (and (bvsge (currentBit!9780 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9780 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9785 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9785 thiss!1204) (size!4657 (buf!5198 (_2!9905 lt!342775)))) (and (= (currentBit!9780 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9785 thiss!1204) (size!4657 (buf!5198 (_2!9905 lt!342775))))))))))

(assert (=> b!216785 d!73707))

(declare-fun d!73709 () Bool)

(assert (=> d!73709 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!216785 d!73709))

(declare-fun d!73711 () Bool)

(assert (=> d!73711 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4657 (buf!5198 (_2!9905 lt!342780)))) ((_ sign_extend 32) (currentByte!9785 (_2!9905 lt!342775))) ((_ sign_extend 32) (currentBit!9780 (_2!9905 lt!342775))) lt!342788) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4657 (buf!5198 (_2!9905 lt!342780)))) ((_ sign_extend 32) (currentByte!9785 (_2!9905 lt!342775))) ((_ sign_extend 32) (currentBit!9780 (_2!9905 lt!342775)))) lt!342788))))

(declare-fun bs!17998 () Bool)

(assert (= bs!17998 d!73711))

(declare-fun m!335285 () Bool)

(assert (=> bs!17998 m!335285))

(assert (=> b!216785 d!73711))

(declare-fun d!73713 () Bool)

(declare-fun lt!343944 () tuple2!18526)

(assert (=> d!73713 (= lt!343944 (readNBitsLSBFirstsLoop!0 (_1!9907 lt!342784) nBits!348 i!590 lt!342771))))

(assert (=> d!73713 (= (readNBitsLSBFirstsLoopPure!0 (_1!9907 lt!342784) nBits!348 i!590 lt!342771) (tuple2!18501 (_2!9921 lt!343944) (_1!9921 lt!343944)))))

(declare-fun bs!17999 () Bool)

(assert (= bs!17999 d!73713))

(declare-fun m!335287 () Bool)

(assert (=> bs!17999 m!335287))

(assert (=> b!216785 d!73713))

(declare-fun d!73715 () Bool)

(declare-fun lt!343947 () tuple2!18526)

(assert (=> d!73715 (= lt!343947 (readNBitsLSBFirstsLoop!0 (_1!9907 lt!342783) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!342778))))

(assert (=> d!73715 (= (readNBitsLSBFirstsLoopPure!0 (_1!9907 lt!342783) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!342778) (tuple2!18501 (_2!9921 lt!343947) (_1!9921 lt!343947)))))

(declare-fun bs!18000 () Bool)

(assert (= bs!18000 d!73715))

(declare-fun m!335289 () Bool)

(assert (=> bs!18000 m!335289))

(assert (=> b!216785 d!73715))

(declare-fun d!73717 () Bool)

(assert (=> d!73717 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4657 (buf!5198 (_2!9905 lt!342780)))) ((_ sign_extend 32) (currentByte!9785 thiss!1204)) ((_ sign_extend 32) (currentBit!9780 thiss!1204)) lt!342793) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4657 (buf!5198 (_2!9905 lt!342780)))) ((_ sign_extend 32) (currentByte!9785 thiss!1204)) ((_ sign_extend 32) (currentBit!9780 thiss!1204))) lt!342793))))

(declare-fun bs!18001 () Bool)

(assert (= bs!18001 d!73717))

(declare-fun m!335291 () Bool)

(assert (=> bs!18001 m!335291))

(assert (=> b!216785 d!73717))

(declare-fun d!73719 () Bool)

(declare-fun e!147727 () Bool)

(assert (=> d!73719 e!147727))

(declare-fun res!182798 () Bool)

(assert (=> d!73719 (=> (not res!182798) (not e!147727))))

(declare-fun lt!343959 () (_ BitVec 64))

(declare-fun lt!343956 () (_ BitVec 64))

(declare-fun lt!343958 () (_ BitVec 64))

(assert (=> d!73719 (= res!182798 (= lt!343959 (bvsub lt!343958 lt!343956)))))

(assert (=> d!73719 (or (= (bvand lt!343958 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!343956 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!343958 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!343958 lt!343956) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73719 (= lt!343956 (remainingBits!0 ((_ sign_extend 32) (size!4657 (buf!5198 (_1!9908 lt!342787)))) ((_ sign_extend 32) (currentByte!9785 (_1!9908 lt!342787))) ((_ sign_extend 32) (currentBit!9780 (_1!9908 lt!342787)))))))

(declare-fun lt!343954 () (_ BitVec 64))

(declare-fun lt!343957 () (_ BitVec 64))

(assert (=> d!73719 (= lt!343958 (bvmul lt!343954 lt!343957))))

(assert (=> d!73719 (or (= lt!343954 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!343957 (bvsdiv (bvmul lt!343954 lt!343957) lt!343954)))))

(assert (=> d!73719 (= lt!343957 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!73719 (= lt!343954 ((_ sign_extend 32) (size!4657 (buf!5198 (_1!9908 lt!342787)))))))

(assert (=> d!73719 (= lt!343959 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9785 (_1!9908 lt!342787))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9780 (_1!9908 lt!342787)))))))

(assert (=> d!73719 (invariant!0 (currentBit!9780 (_1!9908 lt!342787)) (currentByte!9785 (_1!9908 lt!342787)) (size!4657 (buf!5198 (_1!9908 lt!342787))))))

(assert (=> d!73719 (= (bitIndex!0 (size!4657 (buf!5198 (_1!9908 lt!342787))) (currentByte!9785 (_1!9908 lt!342787)) (currentBit!9780 (_1!9908 lt!342787))) lt!343959)))

(declare-fun b!217266 () Bool)

(declare-fun res!182799 () Bool)

(assert (=> b!217266 (=> (not res!182799) (not e!147727))))

(assert (=> b!217266 (= res!182799 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!343959))))

(declare-fun b!217267 () Bool)

(declare-fun lt!343955 () (_ BitVec 64))

(assert (=> b!217267 (= e!147727 (bvsle lt!343959 (bvmul lt!343955 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!217267 (or (= lt!343955 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!343955 #b0000000000000000000000000000000000000000000000000000000000001000) lt!343955)))))

(assert (=> b!217267 (= lt!343955 ((_ sign_extend 32) (size!4657 (buf!5198 (_1!9908 lt!342787)))))))

(assert (= (and d!73719 res!182798) b!217266))

(assert (= (and b!217266 res!182799) b!217267))

(declare-fun m!335293 () Bool)

(assert (=> d!73719 m!335293))

(declare-fun m!335295 () Bool)

(assert (=> d!73719 m!335295))

(assert (=> b!216784 d!73719))

(declare-fun d!73721 () Bool)

(declare-fun e!147728 () Bool)

(assert (=> d!73721 e!147728))

(declare-fun res!182800 () Bool)

(assert (=> d!73721 (=> (not res!182800) (not e!147728))))

(declare-fun lt!343964 () (_ BitVec 64))

(declare-fun lt!343966 () (_ BitVec 64))

(declare-fun lt!343967 () (_ BitVec 64))

(assert (=> d!73721 (= res!182800 (= lt!343967 (bvsub lt!343966 lt!343964)))))

(assert (=> d!73721 (or (= (bvand lt!343966 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!343964 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!343966 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!343966 lt!343964) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73721 (= lt!343964 (remainingBits!0 ((_ sign_extend 32) (size!4657 (buf!5198 (_2!9907 lt!342784)))) ((_ sign_extend 32) (currentByte!9785 (_2!9907 lt!342784))) ((_ sign_extend 32) (currentBit!9780 (_2!9907 lt!342784)))))))

(declare-fun lt!343962 () (_ BitVec 64))

(declare-fun lt!343965 () (_ BitVec 64))

(assert (=> d!73721 (= lt!343966 (bvmul lt!343962 lt!343965))))

(assert (=> d!73721 (or (= lt!343962 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!343965 (bvsdiv (bvmul lt!343962 lt!343965) lt!343962)))))

(assert (=> d!73721 (= lt!343965 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!73721 (= lt!343962 ((_ sign_extend 32) (size!4657 (buf!5198 (_2!9907 lt!342784)))))))

(assert (=> d!73721 (= lt!343967 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9785 (_2!9907 lt!342784))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9780 (_2!9907 lt!342784)))))))

(assert (=> d!73721 (invariant!0 (currentBit!9780 (_2!9907 lt!342784)) (currentByte!9785 (_2!9907 lt!342784)) (size!4657 (buf!5198 (_2!9907 lt!342784))))))

(assert (=> d!73721 (= (bitIndex!0 (size!4657 (buf!5198 (_2!9907 lt!342784))) (currentByte!9785 (_2!9907 lt!342784)) (currentBit!9780 (_2!9907 lt!342784))) lt!343967)))

(declare-fun b!217268 () Bool)

(declare-fun res!182801 () Bool)

(assert (=> b!217268 (=> (not res!182801) (not e!147728))))

(assert (=> b!217268 (= res!182801 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!343967))))

(declare-fun b!217269 () Bool)

(declare-fun lt!343963 () (_ BitVec 64))

(assert (=> b!217269 (= e!147728 (bvsle lt!343967 (bvmul lt!343963 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!217269 (or (= lt!343963 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!343963 #b0000000000000000000000000000000000000000000000000000000000001000) lt!343963)))))

(assert (=> b!217269 (= lt!343963 ((_ sign_extend 32) (size!4657 (buf!5198 (_2!9907 lt!342784)))))))

(assert (= (and d!73721 res!182800) b!217268))

(assert (= (and b!217268 res!182801) b!217269))

(declare-fun m!335297 () Bool)

(assert (=> d!73721 m!335297))

(declare-fun m!335299 () Bool)

(assert (=> d!73721 m!335299))

(assert (=> b!216784 d!73721))

(declare-fun d!73723 () Bool)

(assert (=> d!73723 (= (invariant!0 (currentBit!9780 (_2!9905 lt!342780)) (currentByte!9785 (_2!9905 lt!342780)) (size!4657 (buf!5198 (_2!9905 lt!342780)))) (and (bvsge (currentBit!9780 (_2!9905 lt!342780)) #b00000000000000000000000000000000) (bvslt (currentBit!9780 (_2!9905 lt!342780)) #b00000000000000000000000000001000) (bvsge (currentByte!9785 (_2!9905 lt!342780)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9785 (_2!9905 lt!342780)) (size!4657 (buf!5198 (_2!9905 lt!342780)))) (and (= (currentBit!9780 (_2!9905 lt!342780)) #b00000000000000000000000000000000) (= (currentByte!9785 (_2!9905 lt!342780)) (size!4657 (buf!5198 (_2!9905 lt!342780))))))))))

(assert (=> b!216783 d!73723))

(declare-fun d!73725 () Bool)

(assert (=> d!73725 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9780 thiss!1204) (currentByte!9785 thiss!1204) (size!4657 (buf!5198 thiss!1204))))))

(declare-fun bs!18002 () Bool)

(assert (= bs!18002 d!73725))

(assert (=> bs!18002 m!334453))

(assert (=> start!45030 d!73725))

(assert (=> b!216777 d!73559))

(declare-fun d!73727 () Bool)

(assert (=> d!73727 (= (onesLSBLong!0 nBits!348) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!348))))))

(assert (=> b!216787 d!73727))

(declare-fun d!73729 () Bool)

(declare-fun e!147731 () Bool)

(assert (=> d!73729 e!147731))

(declare-fun res!182802 () Bool)

(assert (=> d!73729 (=> (not res!182802) (not e!147731))))

(declare-fun lt!343988 () (_ BitVec 64))

(declare-fun lt!343989 () (_ BitVec 64))

(declare-fun lt!343986 () (_ BitVec 64))

(assert (=> d!73729 (= res!182802 (= lt!343989 (bvsub lt!343988 lt!343986)))))

(assert (=> d!73729 (or (= (bvand lt!343988 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!343986 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!343988 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!343988 lt!343986) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73729 (= lt!343986 (remainingBits!0 ((_ sign_extend 32) (size!4657 (buf!5198 (_2!9905 lt!342775)))) ((_ sign_extend 32) (currentByte!9785 (_2!9905 lt!342775))) ((_ sign_extend 32) (currentBit!9780 (_2!9905 lt!342775)))))))

(declare-fun lt!343984 () (_ BitVec 64))

(declare-fun lt!343987 () (_ BitVec 64))

(assert (=> d!73729 (= lt!343988 (bvmul lt!343984 lt!343987))))

(assert (=> d!73729 (or (= lt!343984 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!343987 (bvsdiv (bvmul lt!343984 lt!343987) lt!343984)))))

(assert (=> d!73729 (= lt!343987 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!73729 (= lt!343984 ((_ sign_extend 32) (size!4657 (buf!5198 (_2!9905 lt!342775)))))))

(assert (=> d!73729 (= lt!343989 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9785 (_2!9905 lt!342775))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9780 (_2!9905 lt!342775)))))))

(assert (=> d!73729 (invariant!0 (currentBit!9780 (_2!9905 lt!342775)) (currentByte!9785 (_2!9905 lt!342775)) (size!4657 (buf!5198 (_2!9905 lt!342775))))))

(assert (=> d!73729 (= (bitIndex!0 (size!4657 (buf!5198 (_2!9905 lt!342775))) (currentByte!9785 (_2!9905 lt!342775)) (currentBit!9780 (_2!9905 lt!342775))) lt!343989)))

(declare-fun b!217274 () Bool)

(declare-fun res!182803 () Bool)

(assert (=> b!217274 (=> (not res!182803) (not e!147731))))

(assert (=> b!217274 (= res!182803 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!343989))))

(declare-fun b!217275 () Bool)

(declare-fun lt!343985 () (_ BitVec 64))

(assert (=> b!217275 (= e!147731 (bvsle lt!343989 (bvmul lt!343985 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!217275 (or (= lt!343985 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!343985 #b0000000000000000000000000000000000000000000000000000000000001000) lt!343985)))))

(assert (=> b!217275 (= lt!343985 ((_ sign_extend 32) (size!4657 (buf!5198 (_2!9905 lt!342775)))))))

(assert (= (and d!73729 res!182802) b!217274))

(assert (= (and b!217274 res!182803) b!217275))

(declare-fun m!335301 () Bool)

(assert (=> d!73729 m!335301))

(assert (=> d!73729 m!334807))

(assert (=> b!216786 d!73729))

(declare-fun d!73731 () Bool)

(declare-fun e!147732 () Bool)

(assert (=> d!73731 e!147732))

(declare-fun res!182804 () Bool)

(assert (=> d!73731 (=> (not res!182804) (not e!147732))))

(declare-fun lt!343997 () (_ BitVec 64))

(declare-fun lt!343994 () (_ BitVec 64))

(declare-fun lt!343996 () (_ BitVec 64))

(assert (=> d!73731 (= res!182804 (= lt!343997 (bvsub lt!343996 lt!343994)))))

(assert (=> d!73731 (or (= (bvand lt!343996 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!343994 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!343996 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!343996 lt!343994) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73731 (= lt!343994 (remainingBits!0 ((_ sign_extend 32) (size!4657 (buf!5198 thiss!1204))) ((_ sign_extend 32) (currentByte!9785 thiss!1204)) ((_ sign_extend 32) (currentBit!9780 thiss!1204))))))

(declare-fun lt!343992 () (_ BitVec 64))

(declare-fun lt!343995 () (_ BitVec 64))

(assert (=> d!73731 (= lt!343996 (bvmul lt!343992 lt!343995))))

(assert (=> d!73731 (or (= lt!343992 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!343995 (bvsdiv (bvmul lt!343992 lt!343995) lt!343992)))))

(assert (=> d!73731 (= lt!343995 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!73731 (= lt!343992 ((_ sign_extend 32) (size!4657 (buf!5198 thiss!1204))))))

(assert (=> d!73731 (= lt!343997 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9785 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9780 thiss!1204))))))

(assert (=> d!73731 (invariant!0 (currentBit!9780 thiss!1204) (currentByte!9785 thiss!1204) (size!4657 (buf!5198 thiss!1204)))))

(assert (=> d!73731 (= (bitIndex!0 (size!4657 (buf!5198 thiss!1204)) (currentByte!9785 thiss!1204) (currentBit!9780 thiss!1204)) lt!343997)))

(declare-fun b!217276 () Bool)

(declare-fun res!182805 () Bool)

(assert (=> b!217276 (=> (not res!182805) (not e!147732))))

(assert (=> b!217276 (= res!182805 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!343997))))

(declare-fun b!217277 () Bool)

(declare-fun lt!343993 () (_ BitVec 64))

(assert (=> b!217277 (= e!147732 (bvsle lt!343997 (bvmul lt!343993 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!217277 (or (= lt!343993 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!343993 #b0000000000000000000000000000000000000000000000000000000000001000) lt!343993)))))

(assert (=> b!217277 (= lt!343993 ((_ sign_extend 32) (size!4657 (buf!5198 thiss!1204))))))

(assert (= (and d!73731 res!182804) b!217276))

(assert (= (and b!217276 res!182805) b!217277))

(assert (=> d!73731 m!334803))

(assert (=> d!73731 m!334453))

(assert (=> b!216786 d!73731))

(declare-fun b!217303 () Bool)

(declare-fun e!147745 () Bool)

(declare-fun e!147746 () Bool)

(assert (=> b!217303 (= e!147745 e!147746)))

(declare-fun res!182828 () Bool)

(assert (=> b!217303 (=> (not res!182828) (not e!147746))))

(declare-fun lt!344050 () tuple2!18496)

(declare-fun lt!344051 () tuple2!18494)

(assert (=> b!217303 (= res!182828 (and (= (_2!9906 lt!344050) lt!342791) (= (_1!9906 lt!344050) (_2!9905 lt!344051))))))

(assert (=> b!217303 (= lt!344050 (readBitPure!0 (readerFrom!0 (_2!9905 lt!344051) (currentBit!9780 thiss!1204) (currentByte!9785 thiss!1204))))))

(declare-fun d!73733 () Bool)

(assert (=> d!73733 e!147745))

(declare-fun res!182830 () Bool)

(assert (=> d!73733 (=> (not res!182830) (not e!147745))))

(assert (=> d!73733 (= res!182830 (= (size!4657 (buf!5198 thiss!1204)) (size!4657 (buf!5198 (_2!9905 lt!344051)))))))

(declare-fun choose!16 (BitStream!8422 Bool) tuple2!18494)

(assert (=> d!73733 (= lt!344051 (choose!16 thiss!1204 lt!342791))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!73733 (validate_offset_bit!0 ((_ sign_extend 32) (size!4657 (buf!5198 thiss!1204))) ((_ sign_extend 32) (currentByte!9785 thiss!1204)) ((_ sign_extend 32) (currentBit!9780 thiss!1204)))))

(assert (=> d!73733 (= (appendBit!0 thiss!1204 lt!342791) lt!344051)))

(declare-fun b!217302 () Bool)

(declare-fun res!182831 () Bool)

(assert (=> b!217302 (=> (not res!182831) (not e!147745))))

(assert (=> b!217302 (= res!182831 (isPrefixOf!0 thiss!1204 (_2!9905 lt!344051)))))

(declare-fun b!217304 () Bool)

(assert (=> b!217304 (= e!147746 (= (bitIndex!0 (size!4657 (buf!5198 (_1!9906 lt!344050))) (currentByte!9785 (_1!9906 lt!344050)) (currentBit!9780 (_1!9906 lt!344050))) (bitIndex!0 (size!4657 (buf!5198 (_2!9905 lt!344051))) (currentByte!9785 (_2!9905 lt!344051)) (currentBit!9780 (_2!9905 lt!344051)))))))

(declare-fun b!217301 () Bool)

(declare-fun res!182829 () Bool)

(assert (=> b!217301 (=> (not res!182829) (not e!147745))))

(declare-fun lt!344053 () (_ BitVec 64))

(declare-fun lt!344052 () (_ BitVec 64))

(assert (=> b!217301 (= res!182829 (= (bitIndex!0 (size!4657 (buf!5198 (_2!9905 lt!344051))) (currentByte!9785 (_2!9905 lt!344051)) (currentBit!9780 (_2!9905 lt!344051))) (bvadd lt!344053 lt!344052)))))

(assert (=> b!217301 (or (not (= (bvand lt!344053 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!344052 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!344053 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!344053 lt!344052) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!217301 (= lt!344052 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!217301 (= lt!344053 (bitIndex!0 (size!4657 (buf!5198 thiss!1204)) (currentByte!9785 thiss!1204) (currentBit!9780 thiss!1204)))))

(assert (= (and d!73733 res!182830) b!217301))

(assert (= (and b!217301 res!182829) b!217302))

(assert (= (and b!217302 res!182831) b!217303))

(assert (= (and b!217303 res!182828) b!217304))

(declare-fun m!335303 () Bool)

(assert (=> b!217302 m!335303))

(declare-fun m!335305 () Bool)

(assert (=> b!217301 m!335305))

(assert (=> b!217301 m!334413))

(declare-fun m!335307 () Bool)

(assert (=> d!73733 m!335307))

(declare-fun m!335309 () Bool)

(assert (=> d!73733 m!335309))

(declare-fun m!335311 () Bool)

(assert (=> b!217304 m!335311))

(assert (=> b!217304 m!335305))

(declare-fun m!335313 () Bool)

(assert (=> b!217303 m!335313))

(assert (=> b!217303 m!335313))

(declare-fun m!335315 () Bool)

(assert (=> b!217303 m!335315))

(assert (=> b!216786 d!73733))

(declare-fun d!73735 () Bool)

(declare-fun e!147747 () Bool)

(assert (=> d!73735 e!147747))

(declare-fun res!182832 () Bool)

(assert (=> d!73735 (=> (not res!182832) (not e!147747))))

(declare-fun lt!344056 () (_ BitVec 64))

(declare-fun lt!344059 () (_ BitVec 64))

(declare-fun lt!344058 () (_ BitVec 64))

(assert (=> d!73735 (= res!182832 (= lt!344059 (bvsub lt!344058 lt!344056)))))

(assert (=> d!73735 (or (= (bvand lt!344058 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!344056 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!344058 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!344058 lt!344056) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73735 (= lt!344056 (remainingBits!0 ((_ sign_extend 32) (size!4657 (buf!5198 (_1!9906 lt!342774)))) ((_ sign_extend 32) (currentByte!9785 (_1!9906 lt!342774))) ((_ sign_extend 32) (currentBit!9780 (_1!9906 lt!342774)))))))

(declare-fun lt!344054 () (_ BitVec 64))

(declare-fun lt!344057 () (_ BitVec 64))

(assert (=> d!73735 (= lt!344058 (bvmul lt!344054 lt!344057))))

(assert (=> d!73735 (or (= lt!344054 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!344057 (bvsdiv (bvmul lt!344054 lt!344057) lt!344054)))))

(assert (=> d!73735 (= lt!344057 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!73735 (= lt!344054 ((_ sign_extend 32) (size!4657 (buf!5198 (_1!9906 lt!342774)))))))

(assert (=> d!73735 (= lt!344059 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9785 (_1!9906 lt!342774))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9780 (_1!9906 lt!342774)))))))

(assert (=> d!73735 (invariant!0 (currentBit!9780 (_1!9906 lt!342774)) (currentByte!9785 (_1!9906 lt!342774)) (size!4657 (buf!5198 (_1!9906 lt!342774))))))

(assert (=> d!73735 (= (bitIndex!0 (size!4657 (buf!5198 (_1!9906 lt!342774))) (currentByte!9785 (_1!9906 lt!342774)) (currentBit!9780 (_1!9906 lt!342774))) lt!344059)))

(declare-fun b!217305 () Bool)

(declare-fun res!182833 () Bool)

(assert (=> b!217305 (=> (not res!182833) (not e!147747))))

(assert (=> b!217305 (= res!182833 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!344059))))

(declare-fun b!217306 () Bool)

(declare-fun lt!344055 () (_ BitVec 64))

(assert (=> b!217306 (= e!147747 (bvsle lt!344059 (bvmul lt!344055 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!217306 (or (= lt!344055 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!344055 #b0000000000000000000000000000000000000000000000000000000000001000) lt!344055)))))

(assert (=> b!217306 (= lt!344055 ((_ sign_extend 32) (size!4657 (buf!5198 (_1!9906 lt!342774)))))))

(assert (= (and d!73735 res!182832) b!217305))

(assert (= (and b!217305 res!182833) b!217306))

(declare-fun m!335317 () Bool)

(assert (=> d!73735 m!335317))

(declare-fun m!335319 () Bool)

(assert (=> d!73735 m!335319))

(assert (=> b!216765 d!73735))

(assert (=> b!216775 d!73729))

(assert (=> b!216775 d!73731))

(push 1)

(assert (not b!217024))

(assert (not d!73557))

(assert (not d!73597))

(assert (not b!217248))

(assert (not d!73573))

(assert (not b!217221))

(assert (not b!217235))

(assert (not d!73713))

(assert (not d!73589))

(assert (not d!73571))

(assert (not b!217213))

(assert (not b!217250))

(assert (not d!73721))

(assert (not b!217302))

(assert (not d!73691))

(assert (not b!217236))

(assert (not d!73733))

(assert (not d!73693))

(assert (not d!73703))

(assert (not b!217212))

(assert (not b!217026))

(assert (not b!217303))

(assert (not d!73575))

(assert (not b!217219))

(assert (not d!73687))

(assert (not d!73719))

(assert (not b!217031))

(assert (not d!73567))

(assert (not bm!3396))

(assert (not d!73689))

(assert (not d!73715))

(assert (not b!217217))

(assert (not d!73701))

(assert (not b!217028))

(assert (not d!73699))

(assert (not d!73705))

(assert (not b!217214))

(assert (not d!73735))

(assert (not d!73725))

(assert (not d!73563))

(assert (not b!217249))

(assert (not b!217237))

(assert (not b!217218))

(assert (not d!73729))

(assert (not d!73585))

(assert (not b!217247))

(assert (not d!73717))

(assert (not d!73711))

(assert (not b!217045))

(assert (not b!217238))

(assert (not b!217022))

(assert (not d!73697))

(assert (not d!73581))

(assert (not d!73731))

(assert (not d!73599))

(assert (not b!217216))

(assert (not d!73695))

(assert (not b!217210))

(assert (not b!217304))

(assert (not b!217047))

(assert (not b!217301))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

