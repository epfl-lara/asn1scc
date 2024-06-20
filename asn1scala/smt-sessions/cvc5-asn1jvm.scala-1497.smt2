; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41312 () Bool)

(assert start!41312)

(declare-fun e!133302 () Bool)

(declare-datatypes ((array!9986 0))(
  ( (array!9987 (arr!5335 (Array (_ BitVec 32) (_ BitVec 8))) (size!4405 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7918 0))(
  ( (BitStream!7919 (buf!4885 array!9986) (currentByte!9169 (_ BitVec 32)) (currentBit!9164 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!16772 0))(
  ( (tuple2!16773 (_1!9031 BitStream!7918) (_2!9031 BitStream!7918)) )
))
(declare-fun lt!300556 () tuple2!16772)

(declare-fun lt!300542 () BitStream!7918)

(declare-fun lt!300562 () (_ BitVec 64))

(declare-fun lt!300543 () (_ BitVec 64))

(declare-fun b!193637 () Bool)

(declare-datatypes ((tuple2!16774 0))(
  ( (tuple2!16775 (_1!9032 BitStream!7918) (_2!9032 (_ BitVec 64))) )
))
(declare-fun lt!300545 () tuple2!16774)

(declare-fun lt!300563 () tuple2!16774)

(assert (=> b!193637 (= e!133302 (and (= lt!300543 (bvsub lt!300562 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!9031 lt!300556) lt!300542)) (= (_2!9032 lt!300563) (_2!9032 lt!300545)))))))

(declare-fun b!193638 () Bool)

(declare-fun e!133315 () Bool)

(declare-datatypes ((tuple2!16776 0))(
  ( (tuple2!16777 (_1!9033 BitStream!7918) (_2!9033 Bool)) )
))
(declare-fun lt!300548 () tuple2!16776)

(declare-fun lt!300538 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!193638 (= e!133315 (= (bitIndex!0 (size!4405 (buf!4885 (_1!9033 lt!300548))) (currentByte!9169 (_1!9033 lt!300548)) (currentBit!9164 (_1!9033 lt!300548))) lt!300538))))

(declare-fun b!193639 () Bool)

(declare-fun e!133306 () Bool)

(declare-fun e!133311 () Bool)

(assert (=> b!193639 (= e!133306 (not e!133311))))

(declare-fun res!161884 () Bool)

(assert (=> b!193639 (=> res!161884 e!133311)))

(assert (=> b!193639 (= res!161884 (not (= lt!300562 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!300543))))))

(declare-datatypes ((Unit!13687 0))(
  ( (Unit!13688) )
))
(declare-datatypes ((tuple2!16778 0))(
  ( (tuple2!16779 (_1!9034 Unit!13687) (_2!9034 BitStream!7918)) )
))
(declare-fun lt!300564 () tuple2!16778)

(assert (=> b!193639 (= lt!300562 (bitIndex!0 (size!4405 (buf!4885 (_2!9034 lt!300564))) (currentByte!9169 (_2!9034 lt!300564)) (currentBit!9164 (_2!9034 lt!300564))))))

(declare-fun thiss!1204 () BitStream!7918)

(assert (=> b!193639 (= lt!300543 (bitIndex!0 (size!4405 (buf!4885 thiss!1204)) (currentByte!9169 thiss!1204) (currentBit!9164 thiss!1204)))))

(declare-fun e!133304 () Bool)

(assert (=> b!193639 e!133304))

(declare-fun res!161869 () Bool)

(assert (=> b!193639 (=> (not res!161869) (not e!133304))))

(assert (=> b!193639 (= res!161869 (= (size!4405 (buf!4885 thiss!1204)) (size!4405 (buf!4885 (_2!9034 lt!300564)))))))

(declare-fun lt!300544 () Bool)

(declare-fun appendBit!0 (BitStream!7918 Bool) tuple2!16778)

(assert (=> b!193639 (= lt!300564 (appendBit!0 thiss!1204 lt!300544))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun lt!300558 () (_ BitVec 64))

(assert (=> b!193639 (= lt!300544 (not (= (bvand v!189 lt!300558) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!193639 (= lt!300558 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!193640 () Bool)

(declare-fun e!133303 () Bool)

(declare-fun e!133312 () Bool)

(assert (=> b!193640 (= e!133303 e!133312)))

(declare-fun res!161875 () Bool)

(assert (=> b!193640 (=> res!161875 e!133312)))

(assert (=> b!193640 (= res!161875 (not (= (_1!9032 lt!300545) (_2!9031 lt!300556))))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun lt!300539 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7918 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16774)

(assert (=> b!193640 (= lt!300545 (readNBitsLSBFirstsLoopPure!0 (_1!9031 lt!300556) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!300539))))

(declare-fun lt!300552 () tuple2!16778)

(declare-fun lt!300559 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!193640 (validate_offset_bits!1 ((_ sign_extend 32) (size!4405 (buf!4885 (_2!9034 lt!300552)))) ((_ sign_extend 32) (currentByte!9169 (_2!9034 lt!300564))) ((_ sign_extend 32) (currentBit!9164 (_2!9034 lt!300564))) lt!300559)))

(declare-fun lt!300565 () Unit!13687)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7918 array!9986 (_ BitVec 64)) Unit!13687)

(assert (=> b!193640 (= lt!300565 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9034 lt!300564) (buf!4885 (_2!9034 lt!300552)) lt!300559))))

(assert (=> b!193640 (= lt!300559 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!300551 () (_ BitVec 64))

(declare-fun lt!300555 () tuple2!16776)

(assert (=> b!193640 (= lt!300539 (bvor lt!300551 (ite (_2!9033 lt!300555) lt!300558 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!300553 () tuple2!16772)

(assert (=> b!193640 (= lt!300563 (readNBitsLSBFirstsLoopPure!0 (_1!9031 lt!300553) nBits!348 i!590 lt!300551))))

(declare-fun lt!300557 () (_ BitVec 64))

(assert (=> b!193640 (validate_offset_bits!1 ((_ sign_extend 32) (size!4405 (buf!4885 (_2!9034 lt!300552)))) ((_ sign_extend 32) (currentByte!9169 thiss!1204)) ((_ sign_extend 32) (currentBit!9164 thiss!1204)) lt!300557)))

(declare-fun lt!300546 () Unit!13687)

(assert (=> b!193640 (= lt!300546 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4885 (_2!9034 lt!300552)) lt!300557))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!193640 (= lt!300551 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!193640 (= (_2!9033 lt!300555) lt!300544)))

(declare-fun readBitPure!0 (BitStream!7918) tuple2!16776)

(assert (=> b!193640 (= lt!300555 (readBitPure!0 (_1!9031 lt!300553)))))

(declare-fun reader!0 (BitStream!7918 BitStream!7918) tuple2!16772)

(assert (=> b!193640 (= lt!300556 (reader!0 (_2!9034 lt!300564) (_2!9034 lt!300552)))))

(assert (=> b!193640 (= lt!300553 (reader!0 thiss!1204 (_2!9034 lt!300552)))))

(declare-fun e!133316 () Bool)

(assert (=> b!193640 e!133316))

(declare-fun res!161886 () Bool)

(assert (=> b!193640 (=> (not res!161886) (not e!133316))))

(declare-fun lt!300550 () tuple2!16776)

(declare-fun lt!300561 () tuple2!16776)

(assert (=> b!193640 (= res!161886 (= (bitIndex!0 (size!4405 (buf!4885 (_1!9033 lt!300550))) (currentByte!9169 (_1!9033 lt!300550)) (currentBit!9164 (_1!9033 lt!300550))) (bitIndex!0 (size!4405 (buf!4885 (_1!9033 lt!300561))) (currentByte!9169 (_1!9033 lt!300561)) (currentBit!9164 (_1!9033 lt!300561)))))))

(declare-fun lt!300540 () Unit!13687)

(declare-fun lt!300547 () BitStream!7918)

(declare-fun readBitPrefixLemma!0 (BitStream!7918 BitStream!7918) Unit!13687)

(assert (=> b!193640 (= lt!300540 (readBitPrefixLemma!0 lt!300547 (_2!9034 lt!300552)))))

(assert (=> b!193640 (= lt!300561 (readBitPure!0 (BitStream!7919 (buf!4885 (_2!9034 lt!300552)) (currentByte!9169 thiss!1204) (currentBit!9164 thiss!1204))))))

(assert (=> b!193640 (= lt!300550 (readBitPure!0 lt!300547))))

(declare-fun e!133305 () Bool)

(assert (=> b!193640 e!133305))

(declare-fun res!161879 () Bool)

(assert (=> b!193640 (=> (not res!161879) (not e!133305))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!193640 (= res!161879 (invariant!0 (currentBit!9164 thiss!1204) (currentByte!9169 thiss!1204) (size!4405 (buf!4885 (_2!9034 lt!300564)))))))

(assert (=> b!193640 (= lt!300547 (BitStream!7919 (buf!4885 (_2!9034 lt!300564)) (currentByte!9169 thiss!1204) (currentBit!9164 thiss!1204)))))

(declare-fun b!193641 () Bool)

(declare-fun res!161877 () Bool)

(declare-fun e!133313 () Bool)

(assert (=> b!193641 (=> (not res!161877) (not e!133313))))

(assert (=> b!193641 (= res!161877 (= (_2!9032 lt!300563) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun b!193642 () Bool)

(assert (=> b!193642 (= e!133313 (= (_1!9032 lt!300563) (_2!9031 lt!300553)))))

(declare-fun b!193643 () Bool)

(assert (=> b!193643 (= e!133311 e!133303)))

(declare-fun res!161885 () Bool)

(assert (=> b!193643 (=> res!161885 e!133303)))

(declare-fun lt!300537 () (_ BitVec 64))

(assert (=> b!193643 (= res!161885 (not (= lt!300537 (bvsub (bvsub (bvadd lt!300562 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!193643 (= lt!300537 (bitIndex!0 (size!4405 (buf!4885 (_2!9034 lt!300552))) (currentByte!9169 (_2!9034 lt!300552)) (currentBit!9164 (_2!9034 lt!300552))))))

(declare-fun isPrefixOf!0 (BitStream!7918 BitStream!7918) Bool)

(assert (=> b!193643 (isPrefixOf!0 thiss!1204 (_2!9034 lt!300552))))

(declare-fun lt!300541 () Unit!13687)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7918 BitStream!7918 BitStream!7918) Unit!13687)

(assert (=> b!193643 (= lt!300541 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9034 lt!300564) (_2!9034 lt!300552)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7918 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!16778)

(assert (=> b!193643 (= lt!300552 (appendBitsLSBFirstLoopTR!0 (_2!9034 lt!300564) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!193644 () Bool)

(declare-fun res!161863 () Bool)

(assert (=> b!193644 (=> res!161863 e!133303)))

(assert (=> b!193644 (= res!161863 (not (isPrefixOf!0 (_2!9034 lt!300564) (_2!9034 lt!300552))))))

(declare-fun b!193645 () Bool)

(declare-fun e!133308 () Bool)

(assert (=> b!193645 (= e!133312 e!133308)))

(declare-fun res!161874 () Bool)

(assert (=> b!193645 (=> res!161874 e!133308)))

(assert (=> b!193645 (= res!161874 (not (= (_1!9031 lt!300556) lt!300542)))))

(assert (=> b!193645 e!133302))

(declare-fun res!161876 () Bool)

(assert (=> b!193645 (=> (not res!161876) (not e!133302))))

(declare-fun lt!300560 () tuple2!16774)

(assert (=> b!193645 (= res!161876 (and (= (_2!9032 lt!300563) (_2!9032 lt!300560)) (= (_1!9032 lt!300563) (_1!9032 lt!300560))))))

(declare-fun lt!300549 () Unit!13687)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7918 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13687)

(assert (=> b!193645 (= lt!300549 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9031 lt!300553) nBits!348 i!590 lt!300551))))

(assert (=> b!193645 (= lt!300560 (readNBitsLSBFirstsLoopPure!0 lt!300542 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!300539))))

(declare-fun withMovedBitIndex!0 (BitStream!7918 (_ BitVec 64)) BitStream!7918)

(assert (=> b!193645 (= lt!300542 (withMovedBitIndex!0 (_1!9031 lt!300553) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!193646 () Bool)

(declare-fun res!161864 () Bool)

(assert (=> b!193646 (=> (not res!161864) (not e!133302))))

(assert (=> b!193646 (= res!161864 (= (_1!9031 lt!300556) (withMovedBitIndex!0 (_2!9031 lt!300556) (bvsub lt!300562 lt!300537))))))

(declare-fun b!193647 () Bool)

(assert (=> b!193647 (= e!133316 (= (_2!9033 lt!300550) (_2!9033 lt!300561)))))

(declare-fun b!193648 () Bool)

(declare-fun e!133314 () Bool)

(assert (=> b!193648 (= e!133304 e!133314)))

(declare-fun res!161872 () Bool)

(assert (=> b!193648 (=> (not res!161872) (not e!133314))))

(declare-fun lt!300554 () (_ BitVec 64))

(assert (=> b!193648 (= res!161872 (= lt!300538 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!300554)))))

(assert (=> b!193648 (= lt!300538 (bitIndex!0 (size!4405 (buf!4885 (_2!9034 lt!300564))) (currentByte!9169 (_2!9034 lt!300564)) (currentBit!9164 (_2!9034 lt!300564))))))

(assert (=> b!193648 (= lt!300554 (bitIndex!0 (size!4405 (buf!4885 thiss!1204)) (currentByte!9169 thiss!1204) (currentBit!9164 thiss!1204)))))

(declare-fun b!193649 () Bool)

(declare-fun res!161867 () Bool)

(assert (=> b!193649 (=> (not res!161867) (not e!133306))))

(assert (=> b!193649 (= res!161867 (invariant!0 (currentBit!9164 thiss!1204) (currentByte!9169 thiss!1204) (size!4405 (buf!4885 thiss!1204))))))

(declare-fun b!193650 () Bool)

(declare-fun e!133309 () Bool)

(declare-fun array_inv!4146 (array!9986) Bool)

(assert (=> b!193650 (= e!133309 (array_inv!4146 (buf!4885 thiss!1204)))))

(declare-fun b!193651 () Bool)

(declare-fun res!161880 () Bool)

(assert (=> b!193651 (=> res!161880 e!133303)))

(assert (=> b!193651 (= res!161880 (not (invariant!0 (currentBit!9164 (_2!9034 lt!300552)) (currentByte!9169 (_2!9034 lt!300552)) (size!4405 (buf!4885 (_2!9034 lt!300552))))))))

(declare-fun res!161882 () Bool)

(declare-fun e!133310 () Bool)

(assert (=> start!41312 (=> (not res!161882) (not e!133310))))

(assert (=> start!41312 (= res!161882 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!41312 e!133310))

(assert (=> start!41312 true))

(declare-fun inv!12 (BitStream!7918) Bool)

(assert (=> start!41312 (and (inv!12 thiss!1204) e!133309)))

(declare-fun b!193652 () Bool)

(declare-fun res!161873 () Bool)

(assert (=> b!193652 (=> res!161873 e!133303)))

(assert (=> b!193652 (= res!161873 (or (not (= (size!4405 (buf!4885 (_2!9034 lt!300552))) (size!4405 (buf!4885 thiss!1204)))) (not (= lt!300537 (bvsub (bvadd lt!300543 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!193653 () Bool)

(assert (=> b!193653 (= e!133305 (invariant!0 (currentBit!9164 thiss!1204) (currentByte!9169 thiss!1204) (size!4405 (buf!4885 (_2!9034 lt!300552)))))))

(declare-fun b!193654 () Bool)

(declare-fun res!161871 () Bool)

(assert (=> b!193654 (=> (not res!161871) (not e!133314))))

(assert (=> b!193654 (= res!161871 (isPrefixOf!0 thiss!1204 (_2!9034 lt!300564)))))

(declare-fun b!193655 () Bool)

(declare-fun res!161866 () Bool)

(assert (=> b!193655 (=> (not res!161866) (not e!133306))))

(assert (=> b!193655 (= res!161866 (not (= i!590 nBits!348)))))

(declare-fun b!193656 () Bool)

(declare-fun res!161883 () Bool)

(assert (=> b!193656 (=> (not res!161883) (not e!133302))))

(assert (=> b!193656 (= res!161883 (= (_1!9031 lt!300553) (withMovedBitIndex!0 (_2!9031 lt!300553) (bvsub lt!300543 lt!300537))))))

(declare-fun b!193657 () Bool)

(assert (=> b!193657 (= e!133314 e!133315)))

(declare-fun res!161868 () Bool)

(assert (=> b!193657 (=> (not res!161868) (not e!133315))))

(assert (=> b!193657 (= res!161868 (and (= (_2!9033 lt!300548) lt!300544) (= (_1!9033 lt!300548) (_2!9034 lt!300564))))))

(declare-fun readerFrom!0 (BitStream!7918 (_ BitVec 32) (_ BitVec 32)) BitStream!7918)

(assert (=> b!193657 (= lt!300548 (readBitPure!0 (readerFrom!0 (_2!9034 lt!300564) (currentBit!9164 thiss!1204) (currentByte!9169 thiss!1204))))))

(declare-fun b!193658 () Bool)

(declare-fun res!161881 () Bool)

(assert (=> b!193658 (=> res!161881 e!133303)))

(assert (=> b!193658 (= res!161881 (not (isPrefixOf!0 thiss!1204 (_2!9034 lt!300564))))))

(declare-fun b!193659 () Bool)

(assert (=> b!193659 (= e!133308 (validate_offset_bits!1 ((_ sign_extend 32) (size!4405 (buf!4885 (_1!9031 lt!300553)))) ((_ sign_extend 32) (currentByte!9169 (_1!9031 lt!300553))) ((_ sign_extend 32) (currentBit!9164 (_1!9031 lt!300553))) lt!300557))))

(assert (=> b!193659 e!133313))

(declare-fun res!161865 () Bool)

(assert (=> b!193659 (=> (not res!161865) (not e!133313))))

(assert (=> b!193659 (= res!161865 (= (size!4405 (buf!4885 thiss!1204)) (size!4405 (buf!4885 (_2!9034 lt!300552)))))))

(declare-fun b!193660 () Bool)

(declare-fun res!161878 () Bool)

(assert (=> b!193660 (=> res!161878 e!133308)))

(assert (=> b!193660 (= res!161878 (not (= (bitIndex!0 (size!4405 (buf!4885 (_1!9032 lt!300563))) (currentByte!9169 (_1!9032 lt!300563)) (currentBit!9164 (_1!9032 lt!300563))) (bitIndex!0 (size!4405 (buf!4885 (_2!9031 lt!300553))) (currentByte!9169 (_2!9031 lt!300553)) (currentBit!9164 (_2!9031 lt!300553))))))))

(declare-fun b!193661 () Bool)

(assert (=> b!193661 (= e!133310 e!133306)))

(declare-fun res!161870 () Bool)

(assert (=> b!193661 (=> (not res!161870) (not e!133306))))

(assert (=> b!193661 (= res!161870 (validate_offset_bits!1 ((_ sign_extend 32) (size!4405 (buf!4885 thiss!1204))) ((_ sign_extend 32) (currentByte!9169 thiss!1204)) ((_ sign_extend 32) (currentBit!9164 thiss!1204)) lt!300557))))

(assert (=> b!193661 (= lt!300557 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(assert (= (and start!41312 res!161882) b!193661))

(assert (= (and b!193661 res!161870) b!193649))

(assert (= (and b!193649 res!161867) b!193655))

(assert (= (and b!193655 res!161866) b!193639))

(assert (= (and b!193639 res!161869) b!193648))

(assert (= (and b!193648 res!161872) b!193654))

(assert (= (and b!193654 res!161871) b!193657))

(assert (= (and b!193657 res!161868) b!193638))

(assert (= (and b!193639 (not res!161884)) b!193643))

(assert (= (and b!193643 (not res!161885)) b!193651))

(assert (= (and b!193651 (not res!161880)) b!193652))

(assert (= (and b!193652 (not res!161873)) b!193644))

(assert (= (and b!193644 (not res!161863)) b!193658))

(assert (= (and b!193658 (not res!161881)) b!193640))

(assert (= (and b!193640 res!161879) b!193653))

(assert (= (and b!193640 res!161886) b!193647))

(assert (= (and b!193640 (not res!161875)) b!193645))

(assert (= (and b!193645 res!161876) b!193656))

(assert (= (and b!193656 res!161883) b!193646))

(assert (= (and b!193646 res!161864) b!193637))

(assert (= (and b!193645 (not res!161874)) b!193660))

(assert (= (and b!193660 (not res!161878)) b!193659))

(assert (= (and b!193659 res!161865) b!193641))

(assert (= (and b!193641 res!161877) b!193642))

(assert (= start!41312 b!193650))

(declare-fun m!299951 () Bool)

(assert (=> b!193653 m!299951))

(declare-fun m!299953 () Bool)

(assert (=> b!193657 m!299953))

(assert (=> b!193657 m!299953))

(declare-fun m!299955 () Bool)

(assert (=> b!193657 m!299955))

(declare-fun m!299957 () Bool)

(assert (=> b!193639 m!299957))

(declare-fun m!299959 () Bool)

(assert (=> b!193639 m!299959))

(declare-fun m!299961 () Bool)

(assert (=> b!193639 m!299961))

(declare-fun m!299963 () Bool)

(assert (=> b!193656 m!299963))

(declare-fun m!299965 () Bool)

(assert (=> b!193651 m!299965))

(declare-fun m!299967 () Bool)

(assert (=> b!193658 m!299967))

(declare-fun m!299969 () Bool)

(assert (=> b!193645 m!299969))

(declare-fun m!299971 () Bool)

(assert (=> b!193645 m!299971))

(declare-fun m!299973 () Bool)

(assert (=> b!193645 m!299973))

(declare-fun m!299975 () Bool)

(assert (=> b!193661 m!299975))

(declare-fun m!299977 () Bool)

(assert (=> b!193646 m!299977))

(declare-fun m!299979 () Bool)

(assert (=> b!193641 m!299979))

(declare-fun m!299981 () Bool)

(assert (=> b!193643 m!299981))

(declare-fun m!299983 () Bool)

(assert (=> b!193643 m!299983))

(declare-fun m!299985 () Bool)

(assert (=> b!193643 m!299985))

(declare-fun m!299987 () Bool)

(assert (=> b!193643 m!299987))

(declare-fun m!299989 () Bool)

(assert (=> b!193659 m!299989))

(declare-fun m!299991 () Bool)

(assert (=> b!193640 m!299991))

(declare-fun m!299993 () Bool)

(assert (=> b!193640 m!299993))

(declare-fun m!299995 () Bool)

(assert (=> b!193640 m!299995))

(declare-fun m!299997 () Bool)

(assert (=> b!193640 m!299997))

(declare-fun m!299999 () Bool)

(assert (=> b!193640 m!299999))

(declare-fun m!300001 () Bool)

(assert (=> b!193640 m!300001))

(declare-fun m!300003 () Bool)

(assert (=> b!193640 m!300003))

(declare-fun m!300005 () Bool)

(assert (=> b!193640 m!300005))

(declare-fun m!300007 () Bool)

(assert (=> b!193640 m!300007))

(declare-fun m!300009 () Bool)

(assert (=> b!193640 m!300009))

(declare-fun m!300011 () Bool)

(assert (=> b!193640 m!300011))

(declare-fun m!300013 () Bool)

(assert (=> b!193640 m!300013))

(declare-fun m!300015 () Bool)

(assert (=> b!193640 m!300015))

(declare-fun m!300017 () Bool)

(assert (=> b!193640 m!300017))

(declare-fun m!300019 () Bool)

(assert (=> b!193640 m!300019))

(declare-fun m!300021 () Bool)

(assert (=> b!193640 m!300021))

(declare-fun m!300023 () Bool)

(assert (=> b!193660 m!300023))

(declare-fun m!300025 () Bool)

(assert (=> b!193660 m!300025))

(assert (=> b!193654 m!299967))

(declare-fun m!300027 () Bool)

(assert (=> b!193650 m!300027))

(assert (=> b!193648 m!299957))

(assert (=> b!193648 m!299959))

(declare-fun m!300029 () Bool)

(assert (=> b!193644 m!300029))

(declare-fun m!300031 () Bool)

(assert (=> b!193649 m!300031))

(declare-fun m!300033 () Bool)

(assert (=> start!41312 m!300033))

(declare-fun m!300035 () Bool)

(assert (=> b!193638 m!300035))

(push 1)

(assert (not b!193639))

(assert (not b!193660))

(assert (not b!193661))

(assert (not b!193651))

(assert (not b!193648))

(assert (not b!193640))

(assert (not b!193644))

(assert (not b!193641))

(assert (not b!193657))

(assert (not b!193649))

(assert (not b!193646))

(assert (not b!193653))

(assert (not b!193656))

(assert (not b!193658))

(assert (not b!193645))

(assert (not b!193643))

(assert (not b!193654))

(assert (not b!193650))

(assert (not b!193659))

(assert (not start!41312))

(assert (not b!193638))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!65747 () Bool)

(declare-datatypes ((tuple2!16800 0))(
  ( (tuple2!16801 (_1!9045 (_ BitVec 64)) (_2!9045 BitStream!7918)) )
))
(declare-fun lt!300893 () tuple2!16800)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!7918 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16800)

(assert (=> d!65747 (= lt!300893 (readNBitsLSBFirstsLoop!0 (_1!9031 lt!300553) nBits!348 i!590 lt!300551))))

(assert (=> d!65747 (= (readNBitsLSBFirstsLoopPure!0 (_1!9031 lt!300553) nBits!348 i!590 lt!300551) (tuple2!16775 (_2!9045 lt!300893) (_1!9045 lt!300893)))))

(declare-fun bs!16357 () Bool)

(assert (= bs!16357 d!65747))

(declare-fun m!300323 () Bool)

(assert (=> bs!16357 m!300323))

(assert (=> b!193640 d!65747))

(declare-fun d!65749 () Bool)

(declare-datatypes ((tuple2!16802 0))(
  ( (tuple2!16803 (_1!9046 Bool) (_2!9046 BitStream!7918)) )
))
(declare-fun lt!300896 () tuple2!16802)

(declare-fun readBit!0 (BitStream!7918) tuple2!16802)

(assert (=> d!65749 (= lt!300896 (readBit!0 lt!300547))))

(assert (=> d!65749 (= (readBitPure!0 lt!300547) (tuple2!16777 (_2!9046 lt!300896) (_1!9046 lt!300896)))))

(declare-fun bs!16358 () Bool)

(assert (= bs!16358 d!65749))

(declare-fun m!300325 () Bool)

(assert (=> bs!16358 m!300325))

(assert (=> b!193640 d!65749))

(declare-fun b!193874 () Bool)

(declare-fun e!133441 () Unit!13687)

(declare-fun lt!300943 () Unit!13687)

(assert (=> b!193874 (= e!133441 lt!300943)))

(declare-fun lt!300952 () (_ BitVec 64))

(assert (=> b!193874 (= lt!300952 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!300947 () (_ BitVec 64))

(assert (=> b!193874 (= lt!300947 (bitIndex!0 (size!4405 (buf!4885 (_2!9034 lt!300564))) (currentByte!9169 (_2!9034 lt!300564)) (currentBit!9164 (_2!9034 lt!300564))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!9986 array!9986 (_ BitVec 64) (_ BitVec 64)) Unit!13687)

(assert (=> b!193874 (= lt!300943 (arrayBitRangesEqSymmetric!0 (buf!4885 (_2!9034 lt!300564)) (buf!4885 (_2!9034 lt!300552)) lt!300952 lt!300947))))

(declare-fun arrayBitRangesEq!0 (array!9986 array!9986 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!193874 (arrayBitRangesEq!0 (buf!4885 (_2!9034 lt!300552)) (buf!4885 (_2!9034 lt!300564)) lt!300952 lt!300947)))

(declare-fun e!133440 () Bool)

(declare-fun lt!300948 () tuple2!16772)

(declare-fun lt!300942 () (_ BitVec 64))

(declare-fun lt!300954 () (_ BitVec 64))

(declare-fun b!193875 () Bool)

(assert (=> b!193875 (= e!133440 (= (_1!9031 lt!300948) (withMovedBitIndex!0 (_2!9031 lt!300948) (bvsub lt!300954 lt!300942))))))

(assert (=> b!193875 (or (= (bvand lt!300954 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!300942 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!300954 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!300954 lt!300942) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!193875 (= lt!300942 (bitIndex!0 (size!4405 (buf!4885 (_2!9034 lt!300552))) (currentByte!9169 (_2!9034 lt!300552)) (currentBit!9164 (_2!9034 lt!300552))))))

(assert (=> b!193875 (= lt!300954 (bitIndex!0 (size!4405 (buf!4885 (_2!9034 lt!300564))) (currentByte!9169 (_2!9034 lt!300564)) (currentBit!9164 (_2!9034 lt!300564))))))

(declare-fun b!193876 () Bool)

(declare-fun Unit!13706 () Unit!13687)

(assert (=> b!193876 (= e!133441 Unit!13706)))

(declare-fun b!193877 () Bool)

(declare-fun res!162084 () Bool)

(assert (=> b!193877 (=> (not res!162084) (not e!133440))))

(assert (=> b!193877 (= res!162084 (isPrefixOf!0 (_1!9031 lt!300948) (_2!9034 lt!300564)))))

(declare-fun d!65751 () Bool)

(assert (=> d!65751 e!133440))

(declare-fun res!162082 () Bool)

(assert (=> d!65751 (=> (not res!162082) (not e!133440))))

(assert (=> d!65751 (= res!162082 (isPrefixOf!0 (_1!9031 lt!300948) (_2!9031 lt!300948)))))

(declare-fun lt!300946 () BitStream!7918)

(assert (=> d!65751 (= lt!300948 (tuple2!16773 lt!300946 (_2!9034 lt!300552)))))

(declare-fun lt!300940 () Unit!13687)

(declare-fun lt!300939 () Unit!13687)

(assert (=> d!65751 (= lt!300940 lt!300939)))

(assert (=> d!65751 (isPrefixOf!0 lt!300946 (_2!9034 lt!300552))))

(assert (=> d!65751 (= lt!300939 (lemmaIsPrefixTransitive!0 lt!300946 (_2!9034 lt!300552) (_2!9034 lt!300552)))))

(declare-fun lt!300955 () Unit!13687)

(declare-fun lt!300950 () Unit!13687)

(assert (=> d!65751 (= lt!300955 lt!300950)))

(assert (=> d!65751 (isPrefixOf!0 lt!300946 (_2!9034 lt!300552))))

(assert (=> d!65751 (= lt!300950 (lemmaIsPrefixTransitive!0 lt!300946 (_2!9034 lt!300564) (_2!9034 lt!300552)))))

(declare-fun lt!300941 () Unit!13687)

(assert (=> d!65751 (= lt!300941 e!133441)))

(declare-fun c!9686 () Bool)

(assert (=> d!65751 (= c!9686 (not (= (size!4405 (buf!4885 (_2!9034 lt!300564))) #b00000000000000000000000000000000)))))

(declare-fun lt!300937 () Unit!13687)

(declare-fun lt!300953 () Unit!13687)

(assert (=> d!65751 (= lt!300937 lt!300953)))

(assert (=> d!65751 (isPrefixOf!0 (_2!9034 lt!300552) (_2!9034 lt!300552))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7918) Unit!13687)

(assert (=> d!65751 (= lt!300953 (lemmaIsPrefixRefl!0 (_2!9034 lt!300552)))))

(declare-fun lt!300956 () Unit!13687)

(declare-fun lt!300951 () Unit!13687)

(assert (=> d!65751 (= lt!300956 lt!300951)))

(assert (=> d!65751 (= lt!300951 (lemmaIsPrefixRefl!0 (_2!9034 lt!300552)))))

(declare-fun lt!300944 () Unit!13687)

(declare-fun lt!300949 () Unit!13687)

(assert (=> d!65751 (= lt!300944 lt!300949)))

(assert (=> d!65751 (isPrefixOf!0 lt!300946 lt!300946)))

(assert (=> d!65751 (= lt!300949 (lemmaIsPrefixRefl!0 lt!300946))))

(declare-fun lt!300938 () Unit!13687)

(declare-fun lt!300945 () Unit!13687)

(assert (=> d!65751 (= lt!300938 lt!300945)))

(assert (=> d!65751 (isPrefixOf!0 (_2!9034 lt!300564) (_2!9034 lt!300564))))

(assert (=> d!65751 (= lt!300945 (lemmaIsPrefixRefl!0 (_2!9034 lt!300564)))))

(assert (=> d!65751 (= lt!300946 (BitStream!7919 (buf!4885 (_2!9034 lt!300552)) (currentByte!9169 (_2!9034 lt!300564)) (currentBit!9164 (_2!9034 lt!300564))))))

(assert (=> d!65751 (isPrefixOf!0 (_2!9034 lt!300564) (_2!9034 lt!300552))))

(assert (=> d!65751 (= (reader!0 (_2!9034 lt!300564) (_2!9034 lt!300552)) lt!300948)))

(declare-fun b!193878 () Bool)

(declare-fun res!162083 () Bool)

(assert (=> b!193878 (=> (not res!162083) (not e!133440))))

(assert (=> b!193878 (= res!162083 (isPrefixOf!0 (_2!9031 lt!300948) (_2!9034 lt!300552)))))

(assert (= (and d!65751 c!9686) b!193874))

(assert (= (and d!65751 (not c!9686)) b!193876))

(assert (= (and d!65751 res!162082) b!193877))

(assert (= (and b!193877 res!162084) b!193878))

(assert (= (and b!193878 res!162083) b!193875))

(declare-fun m!300327 () Bool)

(assert (=> b!193877 m!300327))

(declare-fun m!300329 () Bool)

(assert (=> d!65751 m!300329))

(declare-fun m!300331 () Bool)

(assert (=> d!65751 m!300331))

(declare-fun m!300333 () Bool)

(assert (=> d!65751 m!300333))

(assert (=> d!65751 m!300029))

(declare-fun m!300335 () Bool)

(assert (=> d!65751 m!300335))

(declare-fun m!300337 () Bool)

(assert (=> d!65751 m!300337))

(declare-fun m!300339 () Bool)

(assert (=> d!65751 m!300339))

(declare-fun m!300341 () Bool)

(assert (=> d!65751 m!300341))

(declare-fun m!300343 () Bool)

(assert (=> d!65751 m!300343))

(declare-fun m!300345 () Bool)

(assert (=> d!65751 m!300345))

(declare-fun m!300347 () Bool)

(assert (=> d!65751 m!300347))

(declare-fun m!300349 () Bool)

(assert (=> b!193875 m!300349))

(assert (=> b!193875 m!299981))

(assert (=> b!193875 m!299957))

(declare-fun m!300351 () Bool)

(assert (=> b!193878 m!300351))

(assert (=> b!193874 m!299957))

(declare-fun m!300353 () Bool)

(assert (=> b!193874 m!300353))

(declare-fun m!300355 () Bool)

(assert (=> b!193874 m!300355))

(assert (=> b!193640 d!65751))

(declare-fun d!65753 () Bool)

(declare-fun lt!300957 () tuple2!16802)

(assert (=> d!65753 (= lt!300957 (readBit!0 (_1!9031 lt!300553)))))

(assert (=> d!65753 (= (readBitPure!0 (_1!9031 lt!300553)) (tuple2!16777 (_2!9046 lt!300957) (_1!9046 lt!300957)))))

(declare-fun bs!16359 () Bool)

(assert (= bs!16359 d!65753))

(declare-fun m!300357 () Bool)

(assert (=> bs!16359 m!300357))

(assert (=> b!193640 d!65753))

(declare-fun d!65755 () Bool)

(declare-fun lt!300958 () tuple2!16800)

(assert (=> d!65755 (= lt!300958 (readNBitsLSBFirstsLoop!0 (_1!9031 lt!300556) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!300539))))

(assert (=> d!65755 (= (readNBitsLSBFirstsLoopPure!0 (_1!9031 lt!300556) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!300539) (tuple2!16775 (_2!9045 lt!300958) (_1!9045 lt!300958)))))

(declare-fun bs!16360 () Bool)

(assert (= bs!16360 d!65755))

(declare-fun m!300359 () Bool)

(assert (=> bs!16360 m!300359))

(assert (=> b!193640 d!65755))

(declare-fun d!65757 () Bool)

(assert (=> d!65757 (validate_offset_bits!1 ((_ sign_extend 32) (size!4405 (buf!4885 (_2!9034 lt!300552)))) ((_ sign_extend 32) (currentByte!9169 thiss!1204)) ((_ sign_extend 32) (currentBit!9164 thiss!1204)) lt!300557)))

(declare-fun lt!300961 () Unit!13687)

(declare-fun choose!9 (BitStream!7918 array!9986 (_ BitVec 64) BitStream!7918) Unit!13687)

(assert (=> d!65757 (= lt!300961 (choose!9 thiss!1204 (buf!4885 (_2!9034 lt!300552)) lt!300557 (BitStream!7919 (buf!4885 (_2!9034 lt!300552)) (currentByte!9169 thiss!1204) (currentBit!9164 thiss!1204))))))

(assert (=> d!65757 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4885 (_2!9034 lt!300552)) lt!300557) lt!300961)))

(declare-fun bs!16361 () Bool)

(assert (= bs!16361 d!65757))

(assert (=> bs!16361 m!299993))

(declare-fun m!300361 () Bool)

(assert (=> bs!16361 m!300361))

(assert (=> b!193640 d!65757))

(declare-fun d!65759 () Bool)

(declare-fun e!133444 () Bool)

(assert (=> d!65759 e!133444))

(declare-fun res!162090 () Bool)

(assert (=> d!65759 (=> (not res!162090) (not e!133444))))

(declare-fun lt!300977 () (_ BitVec 64))

(declare-fun lt!300975 () (_ BitVec 64))

(declare-fun lt!300979 () (_ BitVec 64))

(assert (=> d!65759 (= res!162090 (= lt!300977 (bvsub lt!300975 lt!300979)))))

(assert (=> d!65759 (or (= (bvand lt!300975 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!300979 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!300975 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!300975 lt!300979) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!65759 (= lt!300979 (remainingBits!0 ((_ sign_extend 32) (size!4405 (buf!4885 (_1!9033 lt!300561)))) ((_ sign_extend 32) (currentByte!9169 (_1!9033 lt!300561))) ((_ sign_extend 32) (currentBit!9164 (_1!9033 lt!300561)))))))

(declare-fun lt!300976 () (_ BitVec 64))

(declare-fun lt!300978 () (_ BitVec 64))

(assert (=> d!65759 (= lt!300975 (bvmul lt!300976 lt!300978))))

(assert (=> d!65759 (or (= lt!300976 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!300978 (bvsdiv (bvmul lt!300976 lt!300978) lt!300976)))))

(assert (=> d!65759 (= lt!300978 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65759 (= lt!300976 ((_ sign_extend 32) (size!4405 (buf!4885 (_1!9033 lt!300561)))))))

(assert (=> d!65759 (= lt!300977 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9169 (_1!9033 lt!300561))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9164 (_1!9033 lt!300561)))))))

(assert (=> d!65759 (invariant!0 (currentBit!9164 (_1!9033 lt!300561)) (currentByte!9169 (_1!9033 lt!300561)) (size!4405 (buf!4885 (_1!9033 lt!300561))))))

(assert (=> d!65759 (= (bitIndex!0 (size!4405 (buf!4885 (_1!9033 lt!300561))) (currentByte!9169 (_1!9033 lt!300561)) (currentBit!9164 (_1!9033 lt!300561))) lt!300977)))

(declare-fun b!193883 () Bool)

(declare-fun res!162089 () Bool)

(assert (=> b!193883 (=> (not res!162089) (not e!133444))))

(assert (=> b!193883 (= res!162089 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!300977))))

(declare-fun b!193884 () Bool)

(declare-fun lt!300974 () (_ BitVec 64))

(assert (=> b!193884 (= e!133444 (bvsle lt!300977 (bvmul lt!300974 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!193884 (or (= lt!300974 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!300974 #b0000000000000000000000000000000000000000000000000000000000001000) lt!300974)))))

(assert (=> b!193884 (= lt!300974 ((_ sign_extend 32) (size!4405 (buf!4885 (_1!9033 lt!300561)))))))

(assert (= (and d!65759 res!162090) b!193883))

(assert (= (and b!193883 res!162089) b!193884))

(declare-fun m!300363 () Bool)

(assert (=> d!65759 m!300363))

(declare-fun m!300365 () Bool)

(assert (=> d!65759 m!300365))

(assert (=> b!193640 d!65759))

(declare-fun d!65761 () Bool)

(declare-fun e!133445 () Bool)

(assert (=> d!65761 e!133445))

(declare-fun res!162092 () Bool)

(assert (=> d!65761 (=> (not res!162092) (not e!133445))))

(declare-fun lt!300985 () (_ BitVec 64))

(declare-fun lt!300981 () (_ BitVec 64))

(declare-fun lt!300983 () (_ BitVec 64))

(assert (=> d!65761 (= res!162092 (= lt!300983 (bvsub lt!300981 lt!300985)))))

(assert (=> d!65761 (or (= (bvand lt!300981 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!300985 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!300981 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!300981 lt!300985) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65761 (= lt!300985 (remainingBits!0 ((_ sign_extend 32) (size!4405 (buf!4885 (_1!9033 lt!300550)))) ((_ sign_extend 32) (currentByte!9169 (_1!9033 lt!300550))) ((_ sign_extend 32) (currentBit!9164 (_1!9033 lt!300550)))))))

(declare-fun lt!300982 () (_ BitVec 64))

(declare-fun lt!300984 () (_ BitVec 64))

(assert (=> d!65761 (= lt!300981 (bvmul lt!300982 lt!300984))))

(assert (=> d!65761 (or (= lt!300982 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!300984 (bvsdiv (bvmul lt!300982 lt!300984) lt!300982)))))

(assert (=> d!65761 (= lt!300984 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65761 (= lt!300982 ((_ sign_extend 32) (size!4405 (buf!4885 (_1!9033 lt!300550)))))))

(assert (=> d!65761 (= lt!300983 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9169 (_1!9033 lt!300550))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9164 (_1!9033 lt!300550)))))))

(assert (=> d!65761 (invariant!0 (currentBit!9164 (_1!9033 lt!300550)) (currentByte!9169 (_1!9033 lt!300550)) (size!4405 (buf!4885 (_1!9033 lt!300550))))))

(assert (=> d!65761 (= (bitIndex!0 (size!4405 (buf!4885 (_1!9033 lt!300550))) (currentByte!9169 (_1!9033 lt!300550)) (currentBit!9164 (_1!9033 lt!300550))) lt!300983)))

(declare-fun b!193885 () Bool)

(declare-fun res!162091 () Bool)

(assert (=> b!193885 (=> (not res!162091) (not e!133445))))

(assert (=> b!193885 (= res!162091 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!300983))))

(declare-fun b!193886 () Bool)

(declare-fun lt!300980 () (_ BitVec 64))

(assert (=> b!193886 (= e!133445 (bvsle lt!300983 (bvmul lt!300980 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!193886 (or (= lt!300980 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!300980 #b0000000000000000000000000000000000000000000000000000000000001000) lt!300980)))))

(assert (=> b!193886 (= lt!300980 ((_ sign_extend 32) (size!4405 (buf!4885 (_1!9033 lt!300550)))))))

(assert (= (and d!65761 res!162092) b!193885))

(assert (= (and b!193885 res!162091) b!193886))

(declare-fun m!300367 () Bool)

(assert (=> d!65761 m!300367))

(declare-fun m!300369 () Bool)

(assert (=> d!65761 m!300369))

(assert (=> b!193640 d!65761))

(declare-fun d!65763 () Bool)

(assert (=> d!65763 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!193640 d!65763))

(declare-fun d!65765 () Bool)

(assert (=> d!65765 (validate_offset_bits!1 ((_ sign_extend 32) (size!4405 (buf!4885 (_2!9034 lt!300552)))) ((_ sign_extend 32) (currentByte!9169 (_2!9034 lt!300564))) ((_ sign_extend 32) (currentBit!9164 (_2!9034 lt!300564))) lt!300559)))

(declare-fun lt!300986 () Unit!13687)

(assert (=> d!65765 (= lt!300986 (choose!9 (_2!9034 lt!300564) (buf!4885 (_2!9034 lt!300552)) lt!300559 (BitStream!7919 (buf!4885 (_2!9034 lt!300552)) (currentByte!9169 (_2!9034 lt!300564)) (currentBit!9164 (_2!9034 lt!300564)))))))

(assert (=> d!65765 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9034 lt!300564) (buf!4885 (_2!9034 lt!300552)) lt!300559) lt!300986)))

(declare-fun bs!16362 () Bool)

(assert (= bs!16362 d!65765))

(assert (=> bs!16362 m!300013))

(declare-fun m!300371 () Bool)

(assert (=> bs!16362 m!300371))

(assert (=> b!193640 d!65765))

(declare-fun d!65767 () Bool)

(assert (=> d!65767 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4405 (buf!4885 (_2!9034 lt!300552)))) ((_ sign_extend 32) (currentByte!9169 thiss!1204)) ((_ sign_extend 32) (currentBit!9164 thiss!1204)) lt!300557) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4405 (buf!4885 (_2!9034 lt!300552)))) ((_ sign_extend 32) (currentByte!9169 thiss!1204)) ((_ sign_extend 32) (currentBit!9164 thiss!1204))) lt!300557))))

(declare-fun bs!16363 () Bool)

(assert (= bs!16363 d!65767))

(declare-fun m!300373 () Bool)

(assert (=> bs!16363 m!300373))

(assert (=> b!193640 d!65767))

(declare-fun d!65769 () Bool)

(assert (=> d!65769 (= (invariant!0 (currentBit!9164 thiss!1204) (currentByte!9169 thiss!1204) (size!4405 (buf!4885 (_2!9034 lt!300564)))) (and (bvsge (currentBit!9164 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9164 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9169 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9169 thiss!1204) (size!4405 (buf!4885 (_2!9034 lt!300564)))) (and (= (currentBit!9164 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9169 thiss!1204) (size!4405 (buf!4885 (_2!9034 lt!300564))))))))))

(assert (=> b!193640 d!65769))

(declare-fun d!65771 () Bool)

(declare-fun lt!300987 () tuple2!16802)

(assert (=> d!65771 (= lt!300987 (readBit!0 (BitStream!7919 (buf!4885 (_2!9034 lt!300552)) (currentByte!9169 thiss!1204) (currentBit!9164 thiss!1204))))))

(assert (=> d!65771 (= (readBitPure!0 (BitStream!7919 (buf!4885 (_2!9034 lt!300552)) (currentByte!9169 thiss!1204) (currentBit!9164 thiss!1204))) (tuple2!16777 (_2!9046 lt!300987) (_1!9046 lt!300987)))))

(declare-fun bs!16364 () Bool)

(assert (= bs!16364 d!65771))

(declare-fun m!300375 () Bool)

(assert (=> bs!16364 m!300375))

(assert (=> b!193640 d!65771))

(declare-fun d!65773 () Bool)

(declare-fun e!133448 () Bool)

(assert (=> d!65773 e!133448))

(declare-fun res!162095 () Bool)

(assert (=> d!65773 (=> (not res!162095) (not e!133448))))

(declare-fun lt!300999 () tuple2!16776)

(declare-fun lt!300997 () tuple2!16776)

(assert (=> d!65773 (= res!162095 (= (bitIndex!0 (size!4405 (buf!4885 (_1!9033 lt!300999))) (currentByte!9169 (_1!9033 lt!300999)) (currentBit!9164 (_1!9033 lt!300999))) (bitIndex!0 (size!4405 (buf!4885 (_1!9033 lt!300997))) (currentByte!9169 (_1!9033 lt!300997)) (currentBit!9164 (_1!9033 lt!300997)))))))

(declare-fun lt!300998 () Unit!13687)

(declare-fun lt!300996 () BitStream!7918)

(declare-fun choose!50 (BitStream!7918 BitStream!7918 BitStream!7918 tuple2!16776 tuple2!16776 BitStream!7918 Bool tuple2!16776 tuple2!16776 BitStream!7918 Bool) Unit!13687)

(assert (=> d!65773 (= lt!300998 (choose!50 lt!300547 (_2!9034 lt!300552) lt!300996 lt!300999 (tuple2!16777 (_1!9033 lt!300999) (_2!9033 lt!300999)) (_1!9033 lt!300999) (_2!9033 lt!300999) lt!300997 (tuple2!16777 (_1!9033 lt!300997) (_2!9033 lt!300997)) (_1!9033 lt!300997) (_2!9033 lt!300997)))))

(assert (=> d!65773 (= lt!300997 (readBitPure!0 lt!300996))))

(assert (=> d!65773 (= lt!300999 (readBitPure!0 lt!300547))))

(assert (=> d!65773 (= lt!300996 (BitStream!7919 (buf!4885 (_2!9034 lt!300552)) (currentByte!9169 lt!300547) (currentBit!9164 lt!300547)))))

(assert (=> d!65773 (invariant!0 (currentBit!9164 lt!300547) (currentByte!9169 lt!300547) (size!4405 (buf!4885 (_2!9034 lt!300552))))))

(assert (=> d!65773 (= (readBitPrefixLemma!0 lt!300547 (_2!9034 lt!300552)) lt!300998)))

(declare-fun b!193889 () Bool)

(assert (=> b!193889 (= e!133448 (= (_2!9033 lt!300999) (_2!9033 lt!300997)))))

(assert (= (and d!65773 res!162095) b!193889))

(declare-fun m!300377 () Bool)

(assert (=> d!65773 m!300377))

(assert (=> d!65773 m!300019))

(declare-fun m!300379 () Bool)

(assert (=> d!65773 m!300379))

(declare-fun m!300381 () Bool)

(assert (=> d!65773 m!300381))

(declare-fun m!300383 () Bool)

(assert (=> d!65773 m!300383))

(declare-fun m!300385 () Bool)

(assert (=> d!65773 m!300385))

(assert (=> b!193640 d!65773))

(declare-fun d!65775 () Bool)

(assert (=> d!65775 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4405 (buf!4885 (_2!9034 lt!300552)))) ((_ sign_extend 32) (currentByte!9169 (_2!9034 lt!300564))) ((_ sign_extend 32) (currentBit!9164 (_2!9034 lt!300564))) lt!300559) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4405 (buf!4885 (_2!9034 lt!300552)))) ((_ sign_extend 32) (currentByte!9169 (_2!9034 lt!300564))) ((_ sign_extend 32) (currentBit!9164 (_2!9034 lt!300564)))) lt!300559))))

(declare-fun bs!16365 () Bool)

(assert (= bs!16365 d!65775))

(declare-fun m!300387 () Bool)

(assert (=> bs!16365 m!300387))

(assert (=> b!193640 d!65775))

(declare-fun b!193890 () Bool)

(declare-fun e!133450 () Unit!13687)

(declare-fun lt!301006 () Unit!13687)

(assert (=> b!193890 (= e!133450 lt!301006)))

(declare-fun lt!301015 () (_ BitVec 64))

(assert (=> b!193890 (= lt!301015 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!301010 () (_ BitVec 64))

(assert (=> b!193890 (= lt!301010 (bitIndex!0 (size!4405 (buf!4885 thiss!1204)) (currentByte!9169 thiss!1204) (currentBit!9164 thiss!1204)))))

(assert (=> b!193890 (= lt!301006 (arrayBitRangesEqSymmetric!0 (buf!4885 thiss!1204) (buf!4885 (_2!9034 lt!300552)) lt!301015 lt!301010))))

(assert (=> b!193890 (arrayBitRangesEq!0 (buf!4885 (_2!9034 lt!300552)) (buf!4885 thiss!1204) lt!301015 lt!301010)))

(declare-fun b!193891 () Bool)

(declare-fun lt!301011 () tuple2!16772)

(declare-fun lt!301017 () (_ BitVec 64))

(declare-fun e!133449 () Bool)

(declare-fun lt!301005 () (_ BitVec 64))

(assert (=> b!193891 (= e!133449 (= (_1!9031 lt!301011) (withMovedBitIndex!0 (_2!9031 lt!301011) (bvsub lt!301017 lt!301005))))))

(assert (=> b!193891 (or (= (bvand lt!301017 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!301005 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!301017 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!301017 lt!301005) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!193891 (= lt!301005 (bitIndex!0 (size!4405 (buf!4885 (_2!9034 lt!300552))) (currentByte!9169 (_2!9034 lt!300552)) (currentBit!9164 (_2!9034 lt!300552))))))

(assert (=> b!193891 (= lt!301017 (bitIndex!0 (size!4405 (buf!4885 thiss!1204)) (currentByte!9169 thiss!1204) (currentBit!9164 thiss!1204)))))

(declare-fun b!193892 () Bool)

(declare-fun Unit!13707 () Unit!13687)

(assert (=> b!193892 (= e!133450 Unit!13707)))

(declare-fun b!193893 () Bool)

(declare-fun res!162098 () Bool)

(assert (=> b!193893 (=> (not res!162098) (not e!133449))))

(assert (=> b!193893 (= res!162098 (isPrefixOf!0 (_1!9031 lt!301011) thiss!1204))))

(declare-fun d!65777 () Bool)

(assert (=> d!65777 e!133449))

(declare-fun res!162096 () Bool)

(assert (=> d!65777 (=> (not res!162096) (not e!133449))))

(assert (=> d!65777 (= res!162096 (isPrefixOf!0 (_1!9031 lt!301011) (_2!9031 lt!301011)))))

(declare-fun lt!301009 () BitStream!7918)

(assert (=> d!65777 (= lt!301011 (tuple2!16773 lt!301009 (_2!9034 lt!300552)))))

(declare-fun lt!301003 () Unit!13687)

(declare-fun lt!301002 () Unit!13687)

(assert (=> d!65777 (= lt!301003 lt!301002)))

(assert (=> d!65777 (isPrefixOf!0 lt!301009 (_2!9034 lt!300552))))

(assert (=> d!65777 (= lt!301002 (lemmaIsPrefixTransitive!0 lt!301009 (_2!9034 lt!300552) (_2!9034 lt!300552)))))

(declare-fun lt!301018 () Unit!13687)

(declare-fun lt!301013 () Unit!13687)

(assert (=> d!65777 (= lt!301018 lt!301013)))

(assert (=> d!65777 (isPrefixOf!0 lt!301009 (_2!9034 lt!300552))))

(assert (=> d!65777 (= lt!301013 (lemmaIsPrefixTransitive!0 lt!301009 thiss!1204 (_2!9034 lt!300552)))))

(declare-fun lt!301004 () Unit!13687)

(assert (=> d!65777 (= lt!301004 e!133450)))

(declare-fun c!9687 () Bool)

(assert (=> d!65777 (= c!9687 (not (= (size!4405 (buf!4885 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!301000 () Unit!13687)

(declare-fun lt!301016 () Unit!13687)

(assert (=> d!65777 (= lt!301000 lt!301016)))

(assert (=> d!65777 (isPrefixOf!0 (_2!9034 lt!300552) (_2!9034 lt!300552))))

(assert (=> d!65777 (= lt!301016 (lemmaIsPrefixRefl!0 (_2!9034 lt!300552)))))

(declare-fun lt!301019 () Unit!13687)

(declare-fun lt!301014 () Unit!13687)

(assert (=> d!65777 (= lt!301019 lt!301014)))

(assert (=> d!65777 (= lt!301014 (lemmaIsPrefixRefl!0 (_2!9034 lt!300552)))))

(declare-fun lt!301007 () Unit!13687)

(declare-fun lt!301012 () Unit!13687)

(assert (=> d!65777 (= lt!301007 lt!301012)))

(assert (=> d!65777 (isPrefixOf!0 lt!301009 lt!301009)))

(assert (=> d!65777 (= lt!301012 (lemmaIsPrefixRefl!0 lt!301009))))

(declare-fun lt!301001 () Unit!13687)

(declare-fun lt!301008 () Unit!13687)

(assert (=> d!65777 (= lt!301001 lt!301008)))

(assert (=> d!65777 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!65777 (= lt!301008 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!65777 (= lt!301009 (BitStream!7919 (buf!4885 (_2!9034 lt!300552)) (currentByte!9169 thiss!1204) (currentBit!9164 thiss!1204)))))

(assert (=> d!65777 (isPrefixOf!0 thiss!1204 (_2!9034 lt!300552))))

(assert (=> d!65777 (= (reader!0 thiss!1204 (_2!9034 lt!300552)) lt!301011)))

(declare-fun b!193894 () Bool)

(declare-fun res!162097 () Bool)

(assert (=> b!193894 (=> (not res!162097) (not e!133449))))

(assert (=> b!193894 (= res!162097 (isPrefixOf!0 (_2!9031 lt!301011) (_2!9034 lt!300552)))))

(assert (= (and d!65777 c!9687) b!193890))

(assert (= (and d!65777 (not c!9687)) b!193892))

(assert (= (and d!65777 res!162096) b!193893))

(assert (= (and b!193893 res!162098) b!193894))

(assert (= (and b!193894 res!162097) b!193891))

(declare-fun m!300389 () Bool)

(assert (=> b!193893 m!300389))

(declare-fun m!300391 () Bool)

(assert (=> d!65777 m!300391))

(declare-fun m!300393 () Bool)

(assert (=> d!65777 m!300393))

(declare-fun m!300395 () Bool)

(assert (=> d!65777 m!300395))

(assert (=> d!65777 m!299983))

(assert (=> d!65777 m!300335))

(declare-fun m!300397 () Bool)

(assert (=> d!65777 m!300397))

(assert (=> d!65777 m!300339))

(declare-fun m!300399 () Bool)

(assert (=> d!65777 m!300399))

(declare-fun m!300401 () Bool)

(assert (=> d!65777 m!300401))

(declare-fun m!300403 () Bool)

(assert (=> d!65777 m!300403))

(declare-fun m!300405 () Bool)

(assert (=> d!65777 m!300405))

(declare-fun m!300407 () Bool)

(assert (=> b!193891 m!300407))

(assert (=> b!193891 m!299981))

(assert (=> b!193891 m!299959))

(declare-fun m!300409 () Bool)

(assert (=> b!193894 m!300409))

(assert (=> b!193890 m!299959))

(declare-fun m!300411 () Bool)

(assert (=> b!193890 m!300411))

(declare-fun m!300413 () Bool)

(assert (=> b!193890 m!300413))

(assert (=> b!193640 d!65777))

(declare-fun d!65779 () Bool)

(assert (=> d!65779 (= (invariant!0 (currentBit!9164 (_2!9034 lt!300552)) (currentByte!9169 (_2!9034 lt!300552)) (size!4405 (buf!4885 (_2!9034 lt!300552)))) (and (bvsge (currentBit!9164 (_2!9034 lt!300552)) #b00000000000000000000000000000000) (bvslt (currentBit!9164 (_2!9034 lt!300552)) #b00000000000000000000000000001000) (bvsge (currentByte!9169 (_2!9034 lt!300552)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9169 (_2!9034 lt!300552)) (size!4405 (buf!4885 (_2!9034 lt!300552)))) (and (= (currentBit!9164 (_2!9034 lt!300552)) #b00000000000000000000000000000000) (= (currentByte!9169 (_2!9034 lt!300552)) (size!4405 (buf!4885 (_2!9034 lt!300552))))))))))

(assert (=> b!193651 d!65779))

(declare-fun d!65781 () Bool)

(assert (=> d!65781 (= (onesLSBLong!0 nBits!348) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!348))))))

(assert (=> b!193641 d!65781))

(declare-fun d!65783 () Bool)

(assert (=> d!65783 (= (invariant!0 (currentBit!9164 thiss!1204) (currentByte!9169 thiss!1204) (size!4405 (buf!4885 (_2!9034 lt!300552)))) (and (bvsge (currentBit!9164 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9164 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9169 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9169 thiss!1204) (size!4405 (buf!4885 (_2!9034 lt!300552)))) (and (= (currentBit!9164 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9169 thiss!1204) (size!4405 (buf!4885 (_2!9034 lt!300552))))))))))

(assert (=> b!193653 d!65783))

(declare-fun d!65785 () Bool)

(declare-fun e!133451 () Bool)

(assert (=> d!65785 e!133451))

(declare-fun res!162100 () Bool)

(assert (=> d!65785 (=> (not res!162100) (not e!133451))))

(declare-fun lt!301021 () (_ BitVec 64))

(declare-fun lt!301025 () (_ BitVec 64))

(declare-fun lt!301023 () (_ BitVec 64))

(assert (=> d!65785 (= res!162100 (= lt!301023 (bvsub lt!301021 lt!301025)))))

(assert (=> d!65785 (or (= (bvand lt!301021 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!301025 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!301021 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!301021 lt!301025) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65785 (= lt!301025 (remainingBits!0 ((_ sign_extend 32) (size!4405 (buf!4885 (_2!9034 lt!300564)))) ((_ sign_extend 32) (currentByte!9169 (_2!9034 lt!300564))) ((_ sign_extend 32) (currentBit!9164 (_2!9034 lt!300564)))))))

(declare-fun lt!301022 () (_ BitVec 64))

(declare-fun lt!301024 () (_ BitVec 64))

(assert (=> d!65785 (= lt!301021 (bvmul lt!301022 lt!301024))))

(assert (=> d!65785 (or (= lt!301022 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!301024 (bvsdiv (bvmul lt!301022 lt!301024) lt!301022)))))

(assert (=> d!65785 (= lt!301024 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65785 (= lt!301022 ((_ sign_extend 32) (size!4405 (buf!4885 (_2!9034 lt!300564)))))))

(assert (=> d!65785 (= lt!301023 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9169 (_2!9034 lt!300564))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9164 (_2!9034 lt!300564)))))))

(assert (=> d!65785 (invariant!0 (currentBit!9164 (_2!9034 lt!300564)) (currentByte!9169 (_2!9034 lt!300564)) (size!4405 (buf!4885 (_2!9034 lt!300564))))))

(assert (=> d!65785 (= (bitIndex!0 (size!4405 (buf!4885 (_2!9034 lt!300564))) (currentByte!9169 (_2!9034 lt!300564)) (currentBit!9164 (_2!9034 lt!300564))) lt!301023)))

(declare-fun b!193895 () Bool)

(declare-fun res!162099 () Bool)

(assert (=> b!193895 (=> (not res!162099) (not e!133451))))

(assert (=> b!193895 (= res!162099 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!301023))))

(declare-fun b!193896 () Bool)

(declare-fun lt!301020 () (_ BitVec 64))

(assert (=> b!193896 (= e!133451 (bvsle lt!301023 (bvmul lt!301020 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!193896 (or (= lt!301020 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!301020 #b0000000000000000000000000000000000000000000000000000000000001000) lt!301020)))))

(assert (=> b!193896 (= lt!301020 ((_ sign_extend 32) (size!4405 (buf!4885 (_2!9034 lt!300564)))))))

(assert (= (and d!65785 res!162100) b!193895))

(assert (= (and b!193895 res!162099) b!193896))

(declare-fun m!300415 () Bool)

(assert (=> d!65785 m!300415))

(declare-fun m!300417 () Bool)

(assert (=> d!65785 m!300417))

(assert (=> b!193648 d!65785))

(declare-fun d!65787 () Bool)

(declare-fun e!133452 () Bool)

(assert (=> d!65787 e!133452))

(declare-fun res!162102 () Bool)

(assert (=> d!65787 (=> (not res!162102) (not e!133452))))

(declare-fun lt!301029 () (_ BitVec 64))

(declare-fun lt!301031 () (_ BitVec 64))

(declare-fun lt!301027 () (_ BitVec 64))

(assert (=> d!65787 (= res!162102 (= lt!301029 (bvsub lt!301027 lt!301031)))))

(assert (=> d!65787 (or (= (bvand lt!301027 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!301031 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!301027 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!301027 lt!301031) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65787 (= lt!301031 (remainingBits!0 ((_ sign_extend 32) (size!4405 (buf!4885 thiss!1204))) ((_ sign_extend 32) (currentByte!9169 thiss!1204)) ((_ sign_extend 32) (currentBit!9164 thiss!1204))))))

(declare-fun lt!301028 () (_ BitVec 64))

(declare-fun lt!301030 () (_ BitVec 64))

(assert (=> d!65787 (= lt!301027 (bvmul lt!301028 lt!301030))))

(assert (=> d!65787 (or (= lt!301028 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!301030 (bvsdiv (bvmul lt!301028 lt!301030) lt!301028)))))

(assert (=> d!65787 (= lt!301030 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65787 (= lt!301028 ((_ sign_extend 32) (size!4405 (buf!4885 thiss!1204))))))

(assert (=> d!65787 (= lt!301029 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9169 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9164 thiss!1204))))))

(assert (=> d!65787 (invariant!0 (currentBit!9164 thiss!1204) (currentByte!9169 thiss!1204) (size!4405 (buf!4885 thiss!1204)))))

(assert (=> d!65787 (= (bitIndex!0 (size!4405 (buf!4885 thiss!1204)) (currentByte!9169 thiss!1204) (currentBit!9164 thiss!1204)) lt!301029)))

(declare-fun b!193897 () Bool)

(declare-fun res!162101 () Bool)

(assert (=> b!193897 (=> (not res!162101) (not e!133452))))

(assert (=> b!193897 (= res!162101 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!301029))))

(declare-fun b!193898 () Bool)

(declare-fun lt!301026 () (_ BitVec 64))

(assert (=> b!193898 (= e!133452 (bvsle lt!301029 (bvmul lt!301026 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!193898 (or (= lt!301026 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!301026 #b0000000000000000000000000000000000000000000000000000000000001000) lt!301026)))))

(assert (=> b!193898 (= lt!301026 ((_ sign_extend 32) (size!4405 (buf!4885 thiss!1204))))))

(assert (= (and d!65787 res!162102) b!193897))

(assert (= (and b!193897 res!162101) b!193898))

(declare-fun m!300419 () Bool)

(assert (=> d!65787 m!300419))

(assert (=> d!65787 m!300031))

(assert (=> b!193648 d!65787))

(declare-fun d!65789 () Bool)

(assert (=> d!65789 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4405 (buf!4885 (_1!9031 lt!300553)))) ((_ sign_extend 32) (currentByte!9169 (_1!9031 lt!300553))) ((_ sign_extend 32) (currentBit!9164 (_1!9031 lt!300553))) lt!300557) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4405 (buf!4885 (_1!9031 lt!300553)))) ((_ sign_extend 32) (currentByte!9169 (_1!9031 lt!300553))) ((_ sign_extend 32) (currentBit!9164 (_1!9031 lt!300553)))) lt!300557))))

(declare-fun bs!16366 () Bool)

(assert (= bs!16366 d!65789))

(declare-fun m!300421 () Bool)

(assert (=> bs!16366 m!300421))

(assert (=> b!193659 d!65789))

(declare-fun d!65791 () Bool)

(declare-fun e!133453 () Bool)

(assert (=> d!65791 e!133453))

(declare-fun res!162104 () Bool)

(assert (=> d!65791 (=> (not res!162104) (not e!133453))))

(declare-fun lt!301035 () (_ BitVec 64))

(declare-fun lt!301033 () (_ BitVec 64))

(declare-fun lt!301037 () (_ BitVec 64))

(assert (=> d!65791 (= res!162104 (= lt!301035 (bvsub lt!301033 lt!301037)))))

(assert (=> d!65791 (or (= (bvand lt!301033 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!301037 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!301033 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!301033 lt!301037) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65791 (= lt!301037 (remainingBits!0 ((_ sign_extend 32) (size!4405 (buf!4885 (_1!9033 lt!300548)))) ((_ sign_extend 32) (currentByte!9169 (_1!9033 lt!300548))) ((_ sign_extend 32) (currentBit!9164 (_1!9033 lt!300548)))))))

(declare-fun lt!301034 () (_ BitVec 64))

(declare-fun lt!301036 () (_ BitVec 64))

(assert (=> d!65791 (= lt!301033 (bvmul lt!301034 lt!301036))))

(assert (=> d!65791 (or (= lt!301034 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!301036 (bvsdiv (bvmul lt!301034 lt!301036) lt!301034)))))

(assert (=> d!65791 (= lt!301036 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65791 (= lt!301034 ((_ sign_extend 32) (size!4405 (buf!4885 (_1!9033 lt!300548)))))))

(assert (=> d!65791 (= lt!301035 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9169 (_1!9033 lt!300548))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9164 (_1!9033 lt!300548)))))))

(assert (=> d!65791 (invariant!0 (currentBit!9164 (_1!9033 lt!300548)) (currentByte!9169 (_1!9033 lt!300548)) (size!4405 (buf!4885 (_1!9033 lt!300548))))))

(assert (=> d!65791 (= (bitIndex!0 (size!4405 (buf!4885 (_1!9033 lt!300548))) (currentByte!9169 (_1!9033 lt!300548)) (currentBit!9164 (_1!9033 lt!300548))) lt!301035)))

(declare-fun b!193899 () Bool)

(declare-fun res!162103 () Bool)

(assert (=> b!193899 (=> (not res!162103) (not e!133453))))

(assert (=> b!193899 (= res!162103 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!301035))))

(declare-fun b!193900 () Bool)

(declare-fun lt!301032 () (_ BitVec 64))

(assert (=> b!193900 (= e!133453 (bvsle lt!301035 (bvmul lt!301032 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!193900 (or (= lt!301032 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!301032 #b0000000000000000000000000000000000000000000000000000000000001000) lt!301032)))))

(assert (=> b!193900 (= lt!301032 ((_ sign_extend 32) (size!4405 (buf!4885 (_1!9033 lt!300548)))))))

(assert (= (and d!65791 res!162104) b!193899))

(assert (= (and b!193899 res!162103) b!193900))

(declare-fun m!300423 () Bool)

(assert (=> d!65791 m!300423))

(declare-fun m!300425 () Bool)

(assert (=> d!65791 m!300425))

(assert (=> b!193638 d!65791))

(declare-fun d!65793 () Bool)

(assert (=> d!65793 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9164 thiss!1204) (currentByte!9169 thiss!1204) (size!4405 (buf!4885 thiss!1204))))))

(declare-fun bs!16367 () Bool)

(assert (= bs!16367 d!65793))

(assert (=> bs!16367 m!300031))

(assert (=> start!41312 d!65793))

(declare-fun d!65795 () Bool)

(assert (=> d!65795 (= (invariant!0 (currentBit!9164 thiss!1204) (currentByte!9169 thiss!1204) (size!4405 (buf!4885 thiss!1204))) (and (bvsge (currentBit!9164 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9164 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9169 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9169 thiss!1204) (size!4405 (buf!4885 thiss!1204))) (and (= (currentBit!9164 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9169 thiss!1204) (size!4405 (buf!4885 thiss!1204)))))))))

(assert (=> b!193649 d!65795))

(declare-fun d!65797 () Bool)

(declare-fun e!133454 () Bool)

(assert (=> d!65797 e!133454))

(declare-fun res!162106 () Bool)

(assert (=> d!65797 (=> (not res!162106) (not e!133454))))

(declare-fun lt!301039 () (_ BitVec 64))

(declare-fun lt!301041 () (_ BitVec 64))

(declare-fun lt!301043 () (_ BitVec 64))

(assert (=> d!65797 (= res!162106 (= lt!301041 (bvsub lt!301039 lt!301043)))))

(assert (=> d!65797 (or (= (bvand lt!301039 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!301043 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!301039 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!301039 lt!301043) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65797 (= lt!301043 (remainingBits!0 ((_ sign_extend 32) (size!4405 (buf!4885 (_1!9032 lt!300563)))) ((_ sign_extend 32) (currentByte!9169 (_1!9032 lt!300563))) ((_ sign_extend 32) (currentBit!9164 (_1!9032 lt!300563)))))))

(declare-fun lt!301040 () (_ BitVec 64))

(declare-fun lt!301042 () (_ BitVec 64))

(assert (=> d!65797 (= lt!301039 (bvmul lt!301040 lt!301042))))

(assert (=> d!65797 (or (= lt!301040 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!301042 (bvsdiv (bvmul lt!301040 lt!301042) lt!301040)))))

(assert (=> d!65797 (= lt!301042 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65797 (= lt!301040 ((_ sign_extend 32) (size!4405 (buf!4885 (_1!9032 lt!300563)))))))

(assert (=> d!65797 (= lt!301041 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9169 (_1!9032 lt!300563))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9164 (_1!9032 lt!300563)))))))

(assert (=> d!65797 (invariant!0 (currentBit!9164 (_1!9032 lt!300563)) (currentByte!9169 (_1!9032 lt!300563)) (size!4405 (buf!4885 (_1!9032 lt!300563))))))

(assert (=> d!65797 (= (bitIndex!0 (size!4405 (buf!4885 (_1!9032 lt!300563))) (currentByte!9169 (_1!9032 lt!300563)) (currentBit!9164 (_1!9032 lt!300563))) lt!301041)))

(declare-fun b!193901 () Bool)

(declare-fun res!162105 () Bool)

(assert (=> b!193901 (=> (not res!162105) (not e!133454))))

(assert (=> b!193901 (= res!162105 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!301041))))

(declare-fun b!193902 () Bool)

(declare-fun lt!301038 () (_ BitVec 64))

(assert (=> b!193902 (= e!133454 (bvsle lt!301041 (bvmul lt!301038 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!193902 (or (= lt!301038 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!301038 #b0000000000000000000000000000000000000000000000000000000000001000) lt!301038)))))

(assert (=> b!193902 (= lt!301038 ((_ sign_extend 32) (size!4405 (buf!4885 (_1!9032 lt!300563)))))))

(assert (= (and d!65797 res!162106) b!193901))

(assert (= (and b!193901 res!162105) b!193902))

(declare-fun m!300427 () Bool)

(assert (=> d!65797 m!300427))

(declare-fun m!300429 () Bool)

(assert (=> d!65797 m!300429))

(assert (=> b!193660 d!65797))

(declare-fun d!65799 () Bool)

(declare-fun e!133455 () Bool)

(assert (=> d!65799 e!133455))

(declare-fun res!162108 () Bool)

(assert (=> d!65799 (=> (not res!162108) (not e!133455))))

(declare-fun lt!301049 () (_ BitVec 64))

(declare-fun lt!301045 () (_ BitVec 64))

(declare-fun lt!301047 () (_ BitVec 64))

(assert (=> d!65799 (= res!162108 (= lt!301047 (bvsub lt!301045 lt!301049)))))

(assert (=> d!65799 (or (= (bvand lt!301045 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!301049 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!301045 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!301045 lt!301049) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65799 (= lt!301049 (remainingBits!0 ((_ sign_extend 32) (size!4405 (buf!4885 (_2!9031 lt!300553)))) ((_ sign_extend 32) (currentByte!9169 (_2!9031 lt!300553))) ((_ sign_extend 32) (currentBit!9164 (_2!9031 lt!300553)))))))

(declare-fun lt!301046 () (_ BitVec 64))

(declare-fun lt!301048 () (_ BitVec 64))

(assert (=> d!65799 (= lt!301045 (bvmul lt!301046 lt!301048))))

(assert (=> d!65799 (or (= lt!301046 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!301048 (bvsdiv (bvmul lt!301046 lt!301048) lt!301046)))))

(assert (=> d!65799 (= lt!301048 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65799 (= lt!301046 ((_ sign_extend 32) (size!4405 (buf!4885 (_2!9031 lt!300553)))))))

(assert (=> d!65799 (= lt!301047 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9169 (_2!9031 lt!300553))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9164 (_2!9031 lt!300553)))))))

(assert (=> d!65799 (invariant!0 (currentBit!9164 (_2!9031 lt!300553)) (currentByte!9169 (_2!9031 lt!300553)) (size!4405 (buf!4885 (_2!9031 lt!300553))))))

(assert (=> d!65799 (= (bitIndex!0 (size!4405 (buf!4885 (_2!9031 lt!300553))) (currentByte!9169 (_2!9031 lt!300553)) (currentBit!9164 (_2!9031 lt!300553))) lt!301047)))

(declare-fun b!193903 () Bool)

(declare-fun res!162107 () Bool)

(assert (=> b!193903 (=> (not res!162107) (not e!133455))))

(assert (=> b!193903 (= res!162107 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!301047))))

(declare-fun b!193904 () Bool)

(declare-fun lt!301044 () (_ BitVec 64))

(assert (=> b!193904 (= e!133455 (bvsle lt!301047 (bvmul lt!301044 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!193904 (or (= lt!301044 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!301044 #b0000000000000000000000000000000000000000000000000000000000001000) lt!301044)))))

(assert (=> b!193904 (= lt!301044 ((_ sign_extend 32) (size!4405 (buf!4885 (_2!9031 lt!300553)))))))

(assert (= (and d!65799 res!162108) b!193903))

(assert (= (and b!193903 res!162107) b!193904))

(declare-fun m!300431 () Bool)

(assert (=> d!65799 m!300431))

(declare-fun m!300433 () Bool)

(assert (=> d!65799 m!300433))

(assert (=> b!193660 d!65799))

(assert (=> b!193639 d!65785))

(assert (=> b!193639 d!65787))

(declare-fun b!193916 () Bool)

(declare-fun e!133461 () Bool)

(declare-fun e!133460 () Bool)

(assert (=> b!193916 (= e!133461 e!133460)))

(declare-fun res!162119 () Bool)

(assert (=> b!193916 (=> (not res!162119) (not e!133460))))

(declare-fun lt!301061 () tuple2!16778)

(declare-fun lt!301058 () tuple2!16776)

(assert (=> b!193916 (= res!162119 (and (= (_2!9033 lt!301058) lt!300544) (= (_1!9033 lt!301058) (_2!9034 lt!301061))))))

(assert (=> b!193916 (= lt!301058 (readBitPure!0 (readerFrom!0 (_2!9034 lt!301061) (currentBit!9164 thiss!1204) (currentByte!9169 thiss!1204))))))

(declare-fun b!193917 () Bool)

(assert (=> b!193917 (= e!133460 (= (bitIndex!0 (size!4405 (buf!4885 (_1!9033 lt!301058))) (currentByte!9169 (_1!9033 lt!301058)) (currentBit!9164 (_1!9033 lt!301058))) (bitIndex!0 (size!4405 (buf!4885 (_2!9034 lt!301061))) (currentByte!9169 (_2!9034 lt!301061)) (currentBit!9164 (_2!9034 lt!301061)))))))

(declare-fun b!193915 () Bool)

(declare-fun res!162120 () Bool)

(assert (=> b!193915 (=> (not res!162120) (not e!133461))))

(assert (=> b!193915 (= res!162120 (isPrefixOf!0 thiss!1204 (_2!9034 lt!301061)))))

(declare-fun d!65801 () Bool)

(assert (=> d!65801 e!133461))

(declare-fun res!162117 () Bool)

(assert (=> d!65801 (=> (not res!162117) (not e!133461))))

(assert (=> d!65801 (= res!162117 (= (size!4405 (buf!4885 thiss!1204)) (size!4405 (buf!4885 (_2!9034 lt!301061)))))))

(declare-fun choose!16 (BitStream!7918 Bool) tuple2!16778)

(assert (=> d!65801 (= lt!301061 (choose!16 thiss!1204 lt!300544))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!65801 (validate_offset_bit!0 ((_ sign_extend 32) (size!4405 (buf!4885 thiss!1204))) ((_ sign_extend 32) (currentByte!9169 thiss!1204)) ((_ sign_extend 32) (currentBit!9164 thiss!1204)))))

(assert (=> d!65801 (= (appendBit!0 thiss!1204 lt!300544) lt!301061)))

(declare-fun b!193914 () Bool)

(declare-fun res!162118 () Bool)

(assert (=> b!193914 (=> (not res!162118) (not e!133461))))

(declare-fun lt!301059 () (_ BitVec 64))

(declare-fun lt!301060 () (_ BitVec 64))

(assert (=> b!193914 (= res!162118 (= (bitIndex!0 (size!4405 (buf!4885 (_2!9034 lt!301061))) (currentByte!9169 (_2!9034 lt!301061)) (currentBit!9164 (_2!9034 lt!301061))) (bvadd lt!301060 lt!301059)))))

(assert (=> b!193914 (or (not (= (bvand lt!301060 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!301059 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!301060 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!301060 lt!301059) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!193914 (= lt!301059 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!193914 (= lt!301060 (bitIndex!0 (size!4405 (buf!4885 thiss!1204)) (currentByte!9169 thiss!1204) (currentBit!9164 thiss!1204)))))

(assert (= (and d!65801 res!162117) b!193914))

(assert (= (and b!193914 res!162118) b!193915))

(assert (= (and b!193915 res!162120) b!193916))

(assert (= (and b!193916 res!162119) b!193917))

(declare-fun m!300435 () Bool)

(assert (=> b!193917 m!300435))

(declare-fun m!300437 () Bool)

(assert (=> b!193917 m!300437))

(declare-fun m!300439 () Bool)

(assert (=> d!65801 m!300439))

(declare-fun m!300441 () Bool)

(assert (=> d!65801 m!300441))

(declare-fun m!300443 () Bool)

(assert (=> b!193915 m!300443))

(assert (=> b!193914 m!300437))

(assert (=> b!193914 m!299959))

(declare-fun m!300445 () Bool)

(assert (=> b!193916 m!300445))

(assert (=> b!193916 m!300445))

(declare-fun m!300447 () Bool)

(assert (=> b!193916 m!300447))

(assert (=> b!193639 d!65801))

(declare-fun d!65803 () Bool)

(assert (=> d!65803 (= (array_inv!4146 (buf!4885 thiss!1204)) (bvsge (size!4405 (buf!4885 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!193650 d!65803))

(declare-fun d!65805 () Bool)

(assert (=> d!65805 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4405 (buf!4885 thiss!1204))) ((_ sign_extend 32) (currentByte!9169 thiss!1204)) ((_ sign_extend 32) (currentBit!9164 thiss!1204)) lt!300557) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4405 (buf!4885 thiss!1204))) ((_ sign_extend 32) (currentByte!9169 thiss!1204)) ((_ sign_extend 32) (currentBit!9164 thiss!1204))) lt!300557))))

(declare-fun bs!16368 () Bool)

(assert (= bs!16368 d!65805))

(assert (=> bs!16368 m!300419))

(assert (=> b!193661 d!65805))

(declare-fun d!65807 () Bool)

(declare-fun e!133464 () Bool)

(assert (=> d!65807 e!133464))

(declare-fun res!162123 () Bool)

(assert (=> d!65807 (=> (not res!162123) (not e!133464))))

(declare-fun lt!301067 () (_ BitVec 64))

(declare-fun lt!301066 () BitStream!7918)

(assert (=> d!65807 (= res!162123 (= (bvadd lt!301067 (bvsub lt!300543 lt!300537)) (bitIndex!0 (size!4405 (buf!4885 lt!301066)) (currentByte!9169 lt!301066) (currentBit!9164 lt!301066))))))

(assert (=> d!65807 (or (not (= (bvand lt!301067 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!300543 lt!300537) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!301067 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!301067 (bvsub lt!300543 lt!300537)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65807 (= lt!301067 (bitIndex!0 (size!4405 (buf!4885 (_2!9031 lt!300553))) (currentByte!9169 (_2!9031 lt!300553)) (currentBit!9164 (_2!9031 lt!300553))))))

(declare-fun moveBitIndex!0 (BitStream!7918 (_ BitVec 64)) tuple2!16778)

(assert (=> d!65807 (= lt!301066 (_2!9034 (moveBitIndex!0 (_2!9031 lt!300553) (bvsub lt!300543 lt!300537))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!7918 (_ BitVec 64)) Bool)

(assert (=> d!65807 (moveBitIndexPrecond!0 (_2!9031 lt!300553) (bvsub lt!300543 lt!300537))))

(assert (=> d!65807 (= (withMovedBitIndex!0 (_2!9031 lt!300553) (bvsub lt!300543 lt!300537)) lt!301066)))

(declare-fun b!193920 () Bool)

(assert (=> b!193920 (= e!133464 (= (size!4405 (buf!4885 (_2!9031 lt!300553))) (size!4405 (buf!4885 lt!301066))))))

(assert (= (and d!65807 res!162123) b!193920))

(declare-fun m!300449 () Bool)

(assert (=> d!65807 m!300449))

(assert (=> d!65807 m!300025))

(declare-fun m!300451 () Bool)

(assert (=> d!65807 m!300451))

(declare-fun m!300453 () Bool)

(assert (=> d!65807 m!300453))

(assert (=> b!193656 d!65807))

(declare-fun d!65809 () Bool)

(declare-fun e!133465 () Bool)

(assert (=> d!65809 e!133465))

(declare-fun res!162124 () Bool)

(assert (=> d!65809 (=> (not res!162124) (not e!133465))))

(declare-fun lt!301068 () BitStream!7918)

(declare-fun lt!301069 () (_ BitVec 64))

(assert (=> d!65809 (= res!162124 (= (bvadd lt!301069 (bvsub lt!300562 lt!300537)) (bitIndex!0 (size!4405 (buf!4885 lt!301068)) (currentByte!9169 lt!301068) (currentBit!9164 lt!301068))))))

(assert (=> d!65809 (or (not (= (bvand lt!301069 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!300562 lt!300537) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!301069 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!301069 (bvsub lt!300562 lt!300537)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65809 (= lt!301069 (bitIndex!0 (size!4405 (buf!4885 (_2!9031 lt!300556))) (currentByte!9169 (_2!9031 lt!300556)) (currentBit!9164 (_2!9031 lt!300556))))))

(assert (=> d!65809 (= lt!301068 (_2!9034 (moveBitIndex!0 (_2!9031 lt!300556) (bvsub lt!300562 lt!300537))))))

(assert (=> d!65809 (moveBitIndexPrecond!0 (_2!9031 lt!300556) (bvsub lt!300562 lt!300537))))

(assert (=> d!65809 (= (withMovedBitIndex!0 (_2!9031 lt!300556) (bvsub lt!300562 lt!300537)) lt!301068)))

(declare-fun b!193921 () Bool)

(assert (=> b!193921 (= e!133465 (= (size!4405 (buf!4885 (_2!9031 lt!300556))) (size!4405 (buf!4885 lt!301068))))))

(assert (= (and d!65809 res!162124) b!193921))

(declare-fun m!300455 () Bool)

(assert (=> d!65809 m!300455))

(declare-fun m!300457 () Bool)

(assert (=> d!65809 m!300457))

(declare-fun m!300459 () Bool)

(assert (=> d!65809 m!300459))

(declare-fun m!300461 () Bool)

(assert (=> d!65809 m!300461))

(assert (=> b!193646 d!65809))

(declare-fun d!65811 () Bool)

(declare-fun lt!301070 () tuple2!16802)

(assert (=> d!65811 (= lt!301070 (readBit!0 (readerFrom!0 (_2!9034 lt!300564) (currentBit!9164 thiss!1204) (currentByte!9169 thiss!1204))))))

(assert (=> d!65811 (= (readBitPure!0 (readerFrom!0 (_2!9034 lt!300564) (currentBit!9164 thiss!1204) (currentByte!9169 thiss!1204))) (tuple2!16777 (_2!9046 lt!301070) (_1!9046 lt!301070)))))

(declare-fun bs!16369 () Bool)

(assert (= bs!16369 d!65811))

(assert (=> bs!16369 m!299953))

(declare-fun m!300463 () Bool)

(assert (=> bs!16369 m!300463))

(assert (=> b!193657 d!65811))

(declare-fun d!65813 () Bool)

(declare-fun e!133468 () Bool)

(assert (=> d!65813 e!133468))

(declare-fun res!162128 () Bool)

(assert (=> d!65813 (=> (not res!162128) (not e!133468))))

(assert (=> d!65813 (= res!162128 (invariant!0 (currentBit!9164 (_2!9034 lt!300564)) (currentByte!9169 (_2!9034 lt!300564)) (size!4405 (buf!4885 (_2!9034 lt!300564)))))))

(assert (=> d!65813 (= (readerFrom!0 (_2!9034 lt!300564) (currentBit!9164 thiss!1204) (currentByte!9169 thiss!1204)) (BitStream!7919 (buf!4885 (_2!9034 lt!300564)) (currentByte!9169 thiss!1204) (currentBit!9164 thiss!1204)))))

(declare-fun b!193924 () Bool)

(assert (=> b!193924 (= e!133468 (invariant!0 (currentBit!9164 thiss!1204) (currentByte!9169 thiss!1204) (size!4405 (buf!4885 (_2!9034 lt!300564)))))))

(assert (= (and d!65813 res!162128) b!193924))

(assert (=> d!65813 m!300417))

(assert (=> b!193924 m!300003))

(assert (=> b!193657 d!65813))

(declare-fun d!65815 () Bool)

(declare-fun res!162136 () Bool)

(declare-fun e!133474 () Bool)

(assert (=> d!65815 (=> (not res!162136) (not e!133474))))

(assert (=> d!65815 (= res!162136 (= (size!4405 (buf!4885 thiss!1204)) (size!4405 (buf!4885 (_2!9034 lt!300564)))))))

(assert (=> d!65815 (= (isPrefixOf!0 thiss!1204 (_2!9034 lt!300564)) e!133474)))

(declare-fun b!193931 () Bool)

(declare-fun res!162137 () Bool)

(assert (=> b!193931 (=> (not res!162137) (not e!133474))))

(assert (=> b!193931 (= res!162137 (bvsle (bitIndex!0 (size!4405 (buf!4885 thiss!1204)) (currentByte!9169 thiss!1204) (currentBit!9164 thiss!1204)) (bitIndex!0 (size!4405 (buf!4885 (_2!9034 lt!300564))) (currentByte!9169 (_2!9034 lt!300564)) (currentBit!9164 (_2!9034 lt!300564)))))))

(declare-fun b!193932 () Bool)

(declare-fun e!133473 () Bool)

(assert (=> b!193932 (= e!133474 e!133473)))

(declare-fun res!162135 () Bool)

(assert (=> b!193932 (=> res!162135 e!133473)))

(assert (=> b!193932 (= res!162135 (= (size!4405 (buf!4885 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!193933 () Bool)

(assert (=> b!193933 (= e!133473 (arrayBitRangesEq!0 (buf!4885 thiss!1204) (buf!4885 (_2!9034 lt!300564)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4405 (buf!4885 thiss!1204)) (currentByte!9169 thiss!1204) (currentBit!9164 thiss!1204))))))

(assert (= (and d!65815 res!162136) b!193931))

(assert (= (and b!193931 res!162137) b!193932))

(assert (= (and b!193932 (not res!162135)) b!193933))

(assert (=> b!193931 m!299959))

(assert (=> b!193931 m!299957))

(assert (=> b!193933 m!299959))

(assert (=> b!193933 m!299959))

(declare-fun m!300465 () Bool)

(assert (=> b!193933 m!300465))

(assert (=> b!193658 d!65815))

(declare-fun d!65817 () Bool)

(declare-fun e!133475 () Bool)

(assert (=> d!65817 e!133475))

(declare-fun res!162139 () Bool)

(assert (=> d!65817 (=> (not res!162139) (not e!133475))))

(declare-fun lt!301072 () (_ BitVec 64))

(declare-fun lt!301074 () (_ BitVec 64))

(declare-fun lt!301076 () (_ BitVec 64))

(assert (=> d!65817 (= res!162139 (= lt!301074 (bvsub lt!301072 lt!301076)))))

(assert (=> d!65817 (or (= (bvand lt!301072 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!301076 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!301072 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!301072 lt!301076) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65817 (= lt!301076 (remainingBits!0 ((_ sign_extend 32) (size!4405 (buf!4885 (_2!9034 lt!300552)))) ((_ sign_extend 32) (currentByte!9169 (_2!9034 lt!300552))) ((_ sign_extend 32) (currentBit!9164 (_2!9034 lt!300552)))))))

(declare-fun lt!301073 () (_ BitVec 64))

(declare-fun lt!301075 () (_ BitVec 64))

(assert (=> d!65817 (= lt!301072 (bvmul lt!301073 lt!301075))))

(assert (=> d!65817 (or (= lt!301073 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!301075 (bvsdiv (bvmul lt!301073 lt!301075) lt!301073)))))

(assert (=> d!65817 (= lt!301075 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65817 (= lt!301073 ((_ sign_extend 32) (size!4405 (buf!4885 (_2!9034 lt!300552)))))))

(assert (=> d!65817 (= lt!301074 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9169 (_2!9034 lt!300552))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9164 (_2!9034 lt!300552)))))))

(assert (=> d!65817 (invariant!0 (currentBit!9164 (_2!9034 lt!300552)) (currentByte!9169 (_2!9034 lt!300552)) (size!4405 (buf!4885 (_2!9034 lt!300552))))))

(assert (=> d!65817 (= (bitIndex!0 (size!4405 (buf!4885 (_2!9034 lt!300552))) (currentByte!9169 (_2!9034 lt!300552)) (currentBit!9164 (_2!9034 lt!300552))) lt!301074)))

(declare-fun b!193934 () Bool)

(declare-fun res!162138 () Bool)

(assert (=> b!193934 (=> (not res!162138) (not e!133475))))

(assert (=> b!193934 (= res!162138 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!301074))))

(declare-fun b!193935 () Bool)

(declare-fun lt!301071 () (_ BitVec 64))

(assert (=> b!193935 (= e!133475 (bvsle lt!301074 (bvmul lt!301071 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!193935 (or (= lt!301071 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!301071 #b0000000000000000000000000000000000000000000000000000000000001000) lt!301071)))))

(assert (=> b!193935 (= lt!301071 ((_ sign_extend 32) (size!4405 (buf!4885 (_2!9034 lt!300552)))))))

(assert (= (and d!65817 res!162139) b!193934))

(assert (= (and b!193934 res!162138) b!193935))

(declare-fun m!300467 () Bool)

(assert (=> d!65817 m!300467))

(assert (=> d!65817 m!299965))

(assert (=> b!193643 d!65817))

(declare-fun d!65819 () Bool)

(declare-fun res!162141 () Bool)

(declare-fun e!133477 () Bool)

(assert (=> d!65819 (=> (not res!162141) (not e!133477))))

(assert (=> d!65819 (= res!162141 (= (size!4405 (buf!4885 thiss!1204)) (size!4405 (buf!4885 (_2!9034 lt!300552)))))))

(assert (=> d!65819 (= (isPrefixOf!0 thiss!1204 (_2!9034 lt!300552)) e!133477)))

(declare-fun b!193936 () Bool)

(declare-fun res!162142 () Bool)

(assert (=> b!193936 (=> (not res!162142) (not e!133477))))

(assert (=> b!193936 (= res!162142 (bvsle (bitIndex!0 (size!4405 (buf!4885 thiss!1204)) (currentByte!9169 thiss!1204) (currentBit!9164 thiss!1204)) (bitIndex!0 (size!4405 (buf!4885 (_2!9034 lt!300552))) (currentByte!9169 (_2!9034 lt!300552)) (currentBit!9164 (_2!9034 lt!300552)))))))

(declare-fun b!193937 () Bool)

(declare-fun e!133476 () Bool)

(assert (=> b!193937 (= e!133477 e!133476)))

(declare-fun res!162140 () Bool)

(assert (=> b!193937 (=> res!162140 e!133476)))

(assert (=> b!193937 (= res!162140 (= (size!4405 (buf!4885 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!193938 () Bool)

(assert (=> b!193938 (= e!133476 (arrayBitRangesEq!0 (buf!4885 thiss!1204) (buf!4885 (_2!9034 lt!300552)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4405 (buf!4885 thiss!1204)) (currentByte!9169 thiss!1204) (currentBit!9164 thiss!1204))))))

(assert (= (and d!65819 res!162141) b!193936))

(assert (= (and b!193936 res!162142) b!193937))

(assert (= (and b!193937 (not res!162140)) b!193938))

(assert (=> b!193936 m!299959))

(assert (=> b!193936 m!299981))

(assert (=> b!193938 m!299959))

(assert (=> b!193938 m!299959))

(declare-fun m!300469 () Bool)

(assert (=> b!193938 m!300469))

(assert (=> b!193643 d!65819))

(declare-fun d!65821 () Bool)

(assert (=> d!65821 (isPrefixOf!0 thiss!1204 (_2!9034 lt!300552))))

(declare-fun lt!301079 () Unit!13687)

(declare-fun choose!30 (BitStream!7918 BitStream!7918 BitStream!7918) Unit!13687)

(assert (=> d!65821 (= lt!301079 (choose!30 thiss!1204 (_2!9034 lt!300564) (_2!9034 lt!300552)))))

(assert (=> d!65821 (isPrefixOf!0 thiss!1204 (_2!9034 lt!300564))))

(assert (=> d!65821 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9034 lt!300564) (_2!9034 lt!300552)) lt!301079)))

(declare-fun bs!16370 () Bool)

(assert (= bs!16370 d!65821))

(assert (=> bs!16370 m!299983))

(declare-fun m!300471 () Bool)

(assert (=> bs!16370 m!300471))

(assert (=> bs!16370 m!299967))

(assert (=> b!193643 d!65821))

(declare-fun d!65823 () Bool)

(declare-fun e!133586 () Bool)

(assert (=> d!65823 e!133586))

(declare-fun res!162302 () Bool)

(assert (=> d!65823 (=> (not res!162302) (not e!133586))))

(declare-fun lt!301651 () tuple2!16778)

(assert (=> d!65823 (= res!162302 (invariant!0 (currentBit!9164 (_2!9034 lt!301651)) (currentByte!9169 (_2!9034 lt!301651)) (size!4405 (buf!4885 (_2!9034 lt!301651)))))))

(declare-fun e!133584 () tuple2!16778)

(assert (=> d!65823 (= lt!301651 e!133584)))

(declare-fun c!9702 () Bool)

(assert (=> d!65823 (= c!9702 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!65823 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!65823 (= (appendBitsLSBFirstLoopTR!0 (_2!9034 lt!300564) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!301651)))

(declare-fun b!194121 () Bool)

(declare-fun lt!301638 () tuple2!16778)

(assert (=> b!194121 (= e!133584 (tuple2!16779 (_1!9034 lt!301638) (_2!9034 lt!301638)))))

(declare-fun lt!301647 () Bool)

(assert (=> b!194121 (= lt!301647 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!301671 () tuple2!16778)

(assert (=> b!194121 (= lt!301671 (appendBit!0 (_2!9034 lt!300564) lt!301647))))

(declare-fun res!162298 () Bool)

(assert (=> b!194121 (= res!162298 (= (size!4405 (buf!4885 (_2!9034 lt!300564))) (size!4405 (buf!4885 (_2!9034 lt!301671)))))))

(declare-fun e!133580 () Bool)

(assert (=> b!194121 (=> (not res!162298) (not e!133580))))

(assert (=> b!194121 e!133580))

(declare-fun lt!301662 () tuple2!16778)

(assert (=> b!194121 (= lt!301662 lt!301671)))

(assert (=> b!194121 (= lt!301638 (appendBitsLSBFirstLoopTR!0 (_2!9034 lt!301662) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!301673 () Unit!13687)

(assert (=> b!194121 (= lt!301673 (lemmaIsPrefixTransitive!0 (_2!9034 lt!300564) (_2!9034 lt!301662) (_2!9034 lt!301638)))))

(assert (=> b!194121 (isPrefixOf!0 (_2!9034 lt!300564) (_2!9034 lt!301638))))

(declare-fun lt!301669 () Unit!13687)

(assert (=> b!194121 (= lt!301669 lt!301673)))

(assert (=> b!194121 (invariant!0 (currentBit!9164 (_2!9034 lt!300564)) (currentByte!9169 (_2!9034 lt!300564)) (size!4405 (buf!4885 (_2!9034 lt!301662))))))

(declare-fun lt!301677 () BitStream!7918)

(assert (=> b!194121 (= lt!301677 (BitStream!7919 (buf!4885 (_2!9034 lt!301662)) (currentByte!9169 (_2!9034 lt!300564)) (currentBit!9164 (_2!9034 lt!300564))))))

(assert (=> b!194121 (invariant!0 (currentBit!9164 lt!301677) (currentByte!9169 lt!301677) (size!4405 (buf!4885 (_2!9034 lt!301638))))))

(declare-fun lt!301645 () BitStream!7918)

(assert (=> b!194121 (= lt!301645 (BitStream!7919 (buf!4885 (_2!9034 lt!301638)) (currentByte!9169 lt!301677) (currentBit!9164 lt!301677)))))

(declare-fun lt!301670 () tuple2!16776)

(assert (=> b!194121 (= lt!301670 (readBitPure!0 lt!301677))))

(declare-fun lt!301633 () tuple2!16776)

(assert (=> b!194121 (= lt!301633 (readBitPure!0 lt!301645))))

(declare-fun lt!301665 () Unit!13687)

(assert (=> b!194121 (= lt!301665 (readBitPrefixLemma!0 lt!301677 (_2!9034 lt!301638)))))

(declare-fun res!162305 () Bool)

(assert (=> b!194121 (= res!162305 (= (bitIndex!0 (size!4405 (buf!4885 (_1!9033 lt!301670))) (currentByte!9169 (_1!9033 lt!301670)) (currentBit!9164 (_1!9033 lt!301670))) (bitIndex!0 (size!4405 (buf!4885 (_1!9033 lt!301633))) (currentByte!9169 (_1!9033 lt!301633)) (currentBit!9164 (_1!9033 lt!301633)))))))

(declare-fun e!133583 () Bool)

(assert (=> b!194121 (=> (not res!162305) (not e!133583))))

(assert (=> b!194121 e!133583))

(declare-fun lt!301654 () Unit!13687)

(assert (=> b!194121 (= lt!301654 lt!301665)))

(declare-fun lt!301629 () tuple2!16772)

(assert (=> b!194121 (= lt!301629 (reader!0 (_2!9034 lt!300564) (_2!9034 lt!301638)))))

(declare-fun lt!301655 () tuple2!16772)

(assert (=> b!194121 (= lt!301655 (reader!0 (_2!9034 lt!301662) (_2!9034 lt!301638)))))

(declare-fun lt!301650 () tuple2!16776)

(assert (=> b!194121 (= lt!301650 (readBitPure!0 (_1!9031 lt!301629)))))

(assert (=> b!194121 (= (_2!9033 lt!301650) lt!301647)))

(declare-fun lt!301681 () Unit!13687)

(declare-fun Unit!13708 () Unit!13687)

(assert (=> b!194121 (= lt!301681 Unit!13708)))

(declare-fun lt!301667 () (_ BitVec 64))

(assert (=> b!194121 (= lt!301667 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!301657 () (_ BitVec 64))

(assert (=> b!194121 (= lt!301657 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!301641 () Unit!13687)

(assert (=> b!194121 (= lt!301641 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9034 lt!300564) (buf!4885 (_2!9034 lt!301638)) lt!301657))))

(assert (=> b!194121 (validate_offset_bits!1 ((_ sign_extend 32) (size!4405 (buf!4885 (_2!9034 lt!301638)))) ((_ sign_extend 32) (currentByte!9169 (_2!9034 lt!300564))) ((_ sign_extend 32) (currentBit!9164 (_2!9034 lt!300564))) lt!301657)))

(declare-fun lt!301642 () Unit!13687)

(assert (=> b!194121 (= lt!301642 lt!301641)))

(declare-fun lt!301628 () tuple2!16774)

(assert (=> b!194121 (= lt!301628 (readNBitsLSBFirstsLoopPure!0 (_1!9031 lt!301629) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!301667))))

(declare-fun lt!301663 () (_ BitVec 64))

(assert (=> b!194121 (= lt!301663 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!301639 () Unit!13687)

(assert (=> b!194121 (= lt!301639 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9034 lt!301662) (buf!4885 (_2!9034 lt!301638)) lt!301663))))

(assert (=> b!194121 (validate_offset_bits!1 ((_ sign_extend 32) (size!4405 (buf!4885 (_2!9034 lt!301638)))) ((_ sign_extend 32) (currentByte!9169 (_2!9034 lt!301662))) ((_ sign_extend 32) (currentBit!9164 (_2!9034 lt!301662))) lt!301663)))

(declare-fun lt!301678 () Unit!13687)

(assert (=> b!194121 (= lt!301678 lt!301639)))

(declare-fun lt!301636 () tuple2!16774)

(assert (=> b!194121 (= lt!301636 (readNBitsLSBFirstsLoopPure!0 (_1!9031 lt!301655) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!301667 (ite (_2!9033 lt!301650) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!301668 () tuple2!16774)

(assert (=> b!194121 (= lt!301668 (readNBitsLSBFirstsLoopPure!0 (_1!9031 lt!301629) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!301667))))

(declare-fun c!9703 () Bool)

(assert (=> b!194121 (= c!9703 (_2!9033 (readBitPure!0 (_1!9031 lt!301629))))))

(declare-fun lt!301675 () tuple2!16774)

(declare-fun e!133588 () (_ BitVec 64))

(assert (=> b!194121 (= lt!301675 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9031 lt!301629) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!301667 e!133588)))))

(declare-fun lt!301644 () Unit!13687)

(assert (=> b!194121 (= lt!301644 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9031 lt!301629) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!301667))))

(assert (=> b!194121 (and (= (_2!9032 lt!301668) (_2!9032 lt!301675)) (= (_1!9032 lt!301668) (_1!9032 lt!301675)))))

(declare-fun lt!301640 () Unit!13687)

(assert (=> b!194121 (= lt!301640 lt!301644)))

(assert (=> b!194121 (= (_1!9031 lt!301629) (withMovedBitIndex!0 (_2!9031 lt!301629) (bvsub (bitIndex!0 (size!4405 (buf!4885 (_2!9034 lt!300564))) (currentByte!9169 (_2!9034 lt!300564)) (currentBit!9164 (_2!9034 lt!300564))) (bitIndex!0 (size!4405 (buf!4885 (_2!9034 lt!301638))) (currentByte!9169 (_2!9034 lt!301638)) (currentBit!9164 (_2!9034 lt!301638))))))))

(declare-fun lt!301635 () Unit!13687)

(declare-fun Unit!13709 () Unit!13687)

(assert (=> b!194121 (= lt!301635 Unit!13709)))

(assert (=> b!194121 (= (_1!9031 lt!301655) (withMovedBitIndex!0 (_2!9031 lt!301655) (bvsub (bitIndex!0 (size!4405 (buf!4885 (_2!9034 lt!301662))) (currentByte!9169 (_2!9034 lt!301662)) (currentBit!9164 (_2!9034 lt!301662))) (bitIndex!0 (size!4405 (buf!4885 (_2!9034 lt!301638))) (currentByte!9169 (_2!9034 lt!301638)) (currentBit!9164 (_2!9034 lt!301638))))))))

(declare-fun lt!301626 () Unit!13687)

(declare-fun Unit!13710 () Unit!13687)

(assert (=> b!194121 (= lt!301626 Unit!13710)))

(assert (=> b!194121 (= (bitIndex!0 (size!4405 (buf!4885 (_2!9034 lt!300564))) (currentByte!9169 (_2!9034 lt!300564)) (currentBit!9164 (_2!9034 lt!300564))) (bvsub (bitIndex!0 (size!4405 (buf!4885 (_2!9034 lt!301662))) (currentByte!9169 (_2!9034 lt!301662)) (currentBit!9164 (_2!9034 lt!301662))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!301630 () Unit!13687)

(declare-fun Unit!13711 () Unit!13687)

(assert (=> b!194121 (= lt!301630 Unit!13711)))

(assert (=> b!194121 (= (_2!9032 lt!301628) (_2!9032 lt!301636))))

(declare-fun lt!301679 () Unit!13687)

(declare-fun Unit!13712 () Unit!13687)

(assert (=> b!194121 (= lt!301679 Unit!13712)))

(assert (=> b!194121 (invariant!0 (currentBit!9164 (_2!9034 lt!301638)) (currentByte!9169 (_2!9034 lt!301638)) (size!4405 (buf!4885 (_2!9034 lt!301638))))))

(declare-fun lt!301658 () Unit!13687)

(declare-fun Unit!13713 () Unit!13687)

(assert (=> b!194121 (= lt!301658 Unit!13713)))

(assert (=> b!194121 (= (size!4405 (buf!4885 (_2!9034 lt!300564))) (size!4405 (buf!4885 (_2!9034 lt!301638))))))

(declare-fun lt!301659 () Unit!13687)

(declare-fun Unit!13714 () Unit!13687)

(assert (=> b!194121 (= lt!301659 Unit!13714)))

(assert (=> b!194121 (= (bitIndex!0 (size!4405 (buf!4885 (_2!9034 lt!301638))) (currentByte!9169 (_2!9034 lt!301638)) (currentBit!9164 (_2!9034 lt!301638))) (bvsub (bvadd (bitIndex!0 (size!4405 (buf!4885 (_2!9034 lt!300564))) (currentByte!9169 (_2!9034 lt!300564)) (currentBit!9164 (_2!9034 lt!300564))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!301676 () Unit!13687)

(declare-fun Unit!13715 () Unit!13687)

(assert (=> b!194121 (= lt!301676 Unit!13715)))

(declare-fun lt!301646 () Unit!13687)

(declare-fun Unit!13716 () Unit!13687)

(assert (=> b!194121 (= lt!301646 Unit!13716)))

(declare-fun lt!301652 () tuple2!16772)

(assert (=> b!194121 (= lt!301652 (reader!0 (_2!9034 lt!300564) (_2!9034 lt!301638)))))

(declare-fun lt!301664 () (_ BitVec 64))

(assert (=> b!194121 (= lt!301664 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!301643 () Unit!13687)

(assert (=> b!194121 (= lt!301643 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9034 lt!300564) (buf!4885 (_2!9034 lt!301638)) lt!301664))))

(assert (=> b!194121 (validate_offset_bits!1 ((_ sign_extend 32) (size!4405 (buf!4885 (_2!9034 lt!301638)))) ((_ sign_extend 32) (currentByte!9169 (_2!9034 lt!300564))) ((_ sign_extend 32) (currentBit!9164 (_2!9034 lt!300564))) lt!301664)))

(declare-fun lt!301637 () Unit!13687)

(assert (=> b!194121 (= lt!301637 lt!301643)))

(declare-fun lt!301661 () tuple2!16774)

(assert (=> b!194121 (= lt!301661 (readNBitsLSBFirstsLoopPure!0 (_1!9031 lt!301652) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!162303 () Bool)

(assert (=> b!194121 (= res!162303 (= (_2!9032 lt!301661) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun e!133581 () Bool)

(assert (=> b!194121 (=> (not res!162303) (not e!133581))))

(assert (=> b!194121 e!133581))

(declare-fun lt!301627 () Unit!13687)

(declare-fun Unit!13717 () Unit!13687)

(assert (=> b!194121 (= lt!301627 Unit!13717)))

(declare-fun b!194122 () Bool)

(assert (=> b!194122 (= e!133583 (= (_2!9033 lt!301670) (_2!9033 lt!301633)))))

(declare-fun bm!3050 () Bool)

(declare-fun call!3053 () Bool)

(assert (=> bm!3050 (= call!3053 (isPrefixOf!0 (_2!9034 lt!300564) (ite c!9702 (_2!9034 lt!300564) (_2!9034 lt!301671))))))

(declare-fun b!194123 () Bool)

(declare-fun lt!301672 () tuple2!16776)

(assert (=> b!194123 (= lt!301672 (readBitPure!0 (readerFrom!0 (_2!9034 lt!301671) (currentBit!9164 (_2!9034 lt!300564)) (currentByte!9169 (_2!9034 lt!300564)))))))

(declare-fun res!162306 () Bool)

(assert (=> b!194123 (= res!162306 (and (= (_2!9033 lt!301672) lt!301647) (= (_1!9033 lt!301672) (_2!9034 lt!301671))))))

(declare-fun e!133587 () Bool)

(assert (=> b!194123 (=> (not res!162306) (not e!133587))))

(assert (=> b!194123 (= e!133580 e!133587)))

(declare-fun b!194124 () Bool)

(assert (=> b!194124 (= e!133588 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!194125 () Bool)

(assert (=> b!194125 (= e!133587 (= (bitIndex!0 (size!4405 (buf!4885 (_1!9033 lt!301672))) (currentByte!9169 (_1!9033 lt!301672)) (currentBit!9164 (_1!9033 lt!301672))) (bitIndex!0 (size!4405 (buf!4885 (_2!9034 lt!301671))) (currentByte!9169 (_2!9034 lt!301671)) (currentBit!9164 (_2!9034 lt!301671)))))))

(declare-fun b!194126 () Bool)

(declare-fun e!133582 () Bool)

(assert (=> b!194126 (= e!133586 e!133582)))

(declare-fun res!162297 () Bool)

(assert (=> b!194126 (=> (not res!162297) (not e!133582))))

(declare-fun lt!301660 () tuple2!16774)

(assert (=> b!194126 (= res!162297 (= (_2!9032 lt!301660) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun lt!301674 () tuple2!16772)

(assert (=> b!194126 (= lt!301660 (readNBitsLSBFirstsLoopPure!0 (_1!9031 lt!301674) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!301632 () Unit!13687)

(declare-fun lt!301634 () Unit!13687)

(assert (=> b!194126 (= lt!301632 lt!301634)))

(declare-fun lt!301656 () (_ BitVec 64))

(assert (=> b!194126 (validate_offset_bits!1 ((_ sign_extend 32) (size!4405 (buf!4885 (_2!9034 lt!301651)))) ((_ sign_extend 32) (currentByte!9169 (_2!9034 lt!300564))) ((_ sign_extend 32) (currentBit!9164 (_2!9034 lt!300564))) lt!301656)))

(assert (=> b!194126 (= lt!301634 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9034 lt!300564) (buf!4885 (_2!9034 lt!301651)) lt!301656))))

(declare-fun e!133585 () Bool)

(assert (=> b!194126 e!133585))

(declare-fun res!162296 () Bool)

(assert (=> b!194126 (=> (not res!162296) (not e!133585))))

(assert (=> b!194126 (= res!162296 (and (= (size!4405 (buf!4885 (_2!9034 lt!300564))) (size!4405 (buf!4885 (_2!9034 lt!301651)))) (bvsge lt!301656 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!194126 (= lt!301656 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!194126 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!194126 (= lt!301674 (reader!0 (_2!9034 lt!300564) (_2!9034 lt!301651)))))

(declare-fun b!194127 () Bool)

(assert (=> b!194127 (= e!133581 (= (_1!9032 lt!301661) (_2!9031 lt!301652)))))

(declare-fun b!194128 () Bool)

(declare-fun res!162300 () Bool)

(assert (=> b!194128 (=> (not res!162300) (not e!133586))))

(declare-fun lt!301666 () (_ BitVec 64))

(declare-fun lt!301649 () (_ BitVec 64))

(assert (=> b!194128 (= res!162300 (= (bitIndex!0 (size!4405 (buf!4885 (_2!9034 lt!301651))) (currentByte!9169 (_2!9034 lt!301651)) (currentBit!9164 (_2!9034 lt!301651))) (bvsub lt!301666 lt!301649)))))

(assert (=> b!194128 (or (= (bvand lt!301666 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!301649 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!301666 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!301666 lt!301649) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!194128 (= lt!301649 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!301653 () (_ BitVec 64))

(declare-fun lt!301648 () (_ BitVec 64))

(assert (=> b!194128 (= lt!301666 (bvadd lt!301653 lt!301648))))

(assert (=> b!194128 (or (not (= (bvand lt!301653 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!301648 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!301653 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!301653 lt!301648) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!194128 (= lt!301648 ((_ sign_extend 32) nBits!348))))

(assert (=> b!194128 (= lt!301653 (bitIndex!0 (size!4405 (buf!4885 (_2!9034 lt!300564))) (currentByte!9169 (_2!9034 lt!300564)) (currentBit!9164 (_2!9034 lt!300564))))))

(declare-fun b!194129 () Bool)

(assert (=> b!194129 (= e!133588 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!194130 () Bool)

(assert (=> b!194130 (= e!133582 (= (_1!9032 lt!301660) (_2!9031 lt!301674)))))

(declare-fun b!194131 () Bool)

(declare-fun Unit!13718 () Unit!13687)

(assert (=> b!194131 (= e!133584 (tuple2!16779 Unit!13718 (_2!9034 lt!300564)))))

(declare-fun lt!301631 () Unit!13687)

(assert (=> b!194131 (= lt!301631 (lemmaIsPrefixRefl!0 (_2!9034 lt!300564)))))

(assert (=> b!194131 call!3053))

(declare-fun lt!301680 () Unit!13687)

(assert (=> b!194131 (= lt!301680 lt!301631)))

(declare-fun b!194132 () Bool)

(declare-fun res!162301 () Bool)

(assert (=> b!194132 (= res!162301 (= (bitIndex!0 (size!4405 (buf!4885 (_2!9034 lt!301671))) (currentByte!9169 (_2!9034 lt!301671)) (currentBit!9164 (_2!9034 lt!301671))) (bvadd (bitIndex!0 (size!4405 (buf!4885 (_2!9034 lt!300564))) (currentByte!9169 (_2!9034 lt!300564)) (currentBit!9164 (_2!9034 lt!300564))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!194132 (=> (not res!162301) (not e!133580))))

(declare-fun b!194133 () Bool)

(declare-fun res!162295 () Bool)

(assert (=> b!194133 (=> (not res!162295) (not e!133586))))

(assert (=> b!194133 (= res!162295 (= (size!4405 (buf!4885 (_2!9034 lt!300564))) (size!4405 (buf!4885 (_2!9034 lt!301651)))))))

(declare-fun b!194134 () Bool)

(assert (=> b!194134 (= e!133585 (validate_offset_bits!1 ((_ sign_extend 32) (size!4405 (buf!4885 (_2!9034 lt!300564)))) ((_ sign_extend 32) (currentByte!9169 (_2!9034 lt!300564))) ((_ sign_extend 32) (currentBit!9164 (_2!9034 lt!300564))) lt!301656))))

(declare-fun b!194135 () Bool)

(declare-fun res!162299 () Bool)

(assert (=> b!194135 (=> (not res!162299) (not e!133586))))

(assert (=> b!194135 (= res!162299 (isPrefixOf!0 (_2!9034 lt!300564) (_2!9034 lt!301651)))))

(declare-fun b!194136 () Bool)

(declare-fun res!162304 () Bool)

(assert (=> b!194136 (= res!162304 call!3053)))

(assert (=> b!194136 (=> (not res!162304) (not e!133580))))

(assert (= (and d!65823 c!9702) b!194131))

(assert (= (and d!65823 (not c!9702)) b!194121))

(assert (= (and b!194121 res!162298) b!194132))

(assert (= (and b!194132 res!162301) b!194136))

(assert (= (and b!194136 res!162304) b!194123))

(assert (= (and b!194123 res!162306) b!194125))

(assert (= (and b!194121 res!162305) b!194122))

(assert (= (and b!194121 c!9703) b!194129))

(assert (= (and b!194121 (not c!9703)) b!194124))

(assert (= (and b!194121 res!162303) b!194127))

(assert (= (or b!194131 b!194136) bm!3050))

(assert (= (and d!65823 res!162302) b!194133))

(assert (= (and b!194133 res!162295) b!194128))

(assert (= (and b!194128 res!162300) b!194135))

(assert (= (and b!194135 res!162299) b!194126))

(assert (= (and b!194126 res!162296) b!194134))

(assert (= (and b!194126 res!162297) b!194130))

(declare-fun m!300771 () Bool)

(assert (=> b!194121 m!300771))

(declare-fun m!300773 () Bool)

(assert (=> b!194121 m!300773))

(declare-fun m!300775 () Bool)

(assert (=> b!194121 m!300775))

(declare-fun m!300777 () Bool)

(assert (=> b!194121 m!300777))

(declare-fun m!300779 () Bool)

(assert (=> b!194121 m!300779))

(declare-fun m!300781 () Bool)

(assert (=> b!194121 m!300781))

(declare-fun m!300783 () Bool)

(assert (=> b!194121 m!300783))

(assert (=> b!194121 m!299979))

(declare-fun m!300785 () Bool)

(assert (=> b!194121 m!300785))

(declare-fun m!300787 () Bool)

(assert (=> b!194121 m!300787))

(declare-fun m!300789 () Bool)

(assert (=> b!194121 m!300789))

(declare-fun m!300791 () Bool)

(assert (=> b!194121 m!300791))

(declare-fun m!300793 () Bool)

(assert (=> b!194121 m!300793))

(declare-fun m!300795 () Bool)

(assert (=> b!194121 m!300795))

(declare-fun m!300797 () Bool)

(assert (=> b!194121 m!300797))

(declare-fun m!300799 () Bool)

(assert (=> b!194121 m!300799))

(declare-fun m!300801 () Bool)

(assert (=> b!194121 m!300801))

(declare-fun m!300803 () Bool)

(assert (=> b!194121 m!300803))

(declare-fun m!300805 () Bool)

(assert (=> b!194121 m!300805))

(declare-fun m!300807 () Bool)

(assert (=> b!194121 m!300807))

(declare-fun m!300809 () Bool)

(assert (=> b!194121 m!300809))

(declare-fun m!300811 () Bool)

(assert (=> b!194121 m!300811))

(declare-fun m!300813 () Bool)

(assert (=> b!194121 m!300813))

(declare-fun m!300815 () Bool)

(assert (=> b!194121 m!300815))

(declare-fun m!300817 () Bool)

(assert (=> b!194121 m!300817))

(declare-fun m!300819 () Bool)

(assert (=> b!194121 m!300819))

(declare-fun m!300821 () Bool)

(assert (=> b!194121 m!300821))

(assert (=> b!194121 m!300779))

(declare-fun m!300823 () Bool)

(assert (=> b!194121 m!300823))

(declare-fun m!300825 () Bool)

(assert (=> b!194121 m!300825))

(declare-fun m!300827 () Bool)

(assert (=> b!194121 m!300827))

(declare-fun m!300829 () Bool)

(assert (=> b!194121 m!300829))

(assert (=> b!194121 m!299957))

(declare-fun m!300831 () Bool)

(assert (=> b!194121 m!300831))

(declare-fun m!300833 () Bool)

(assert (=> b!194121 m!300833))

(declare-fun m!300835 () Bool)

(assert (=> d!65823 m!300835))

(declare-fun m!300837 () Bool)

(assert (=> b!194123 m!300837))

(assert (=> b!194123 m!300837))

(declare-fun m!300839 () Bool)

(assert (=> b!194123 m!300839))

(declare-fun m!300841 () Bool)

(assert (=> b!194126 m!300841))

(assert (=> b!194126 m!300805))

(declare-fun m!300843 () Bool)

(assert (=> b!194126 m!300843))

(assert (=> b!194126 m!299979))

(declare-fun m!300845 () Bool)

(assert (=> b!194126 m!300845))

(declare-fun m!300847 () Bool)

(assert (=> b!194126 m!300847))

(declare-fun m!300849 () Bool)

(assert (=> b!194134 m!300849))

(assert (=> b!194131 m!300331))

(declare-fun m!300851 () Bool)

(assert (=> b!194135 m!300851))

(declare-fun m!300853 () Bool)

(assert (=> b!194128 m!300853))

(assert (=> b!194128 m!299957))

(declare-fun m!300855 () Bool)

(assert (=> b!194125 m!300855))

(declare-fun m!300857 () Bool)

(assert (=> b!194125 m!300857))

(assert (=> b!194132 m!300857))

(assert (=> b!194132 m!299957))

(declare-fun m!300859 () Bool)

(assert (=> bm!3050 m!300859))

(assert (=> b!193643 d!65823))

(assert (=> b!193654 d!65815))

(declare-fun d!65929 () Bool)

(declare-fun res!162308 () Bool)

(declare-fun e!133590 () Bool)

(assert (=> d!65929 (=> (not res!162308) (not e!133590))))

(assert (=> d!65929 (= res!162308 (= (size!4405 (buf!4885 (_2!9034 lt!300564))) (size!4405 (buf!4885 (_2!9034 lt!300552)))))))

(assert (=> d!65929 (= (isPrefixOf!0 (_2!9034 lt!300564) (_2!9034 lt!300552)) e!133590)))

(declare-fun b!194137 () Bool)

(declare-fun res!162309 () Bool)

(assert (=> b!194137 (=> (not res!162309) (not e!133590))))

(assert (=> b!194137 (= res!162309 (bvsle (bitIndex!0 (size!4405 (buf!4885 (_2!9034 lt!300564))) (currentByte!9169 (_2!9034 lt!300564)) (currentBit!9164 (_2!9034 lt!300564))) (bitIndex!0 (size!4405 (buf!4885 (_2!9034 lt!300552))) (currentByte!9169 (_2!9034 lt!300552)) (currentBit!9164 (_2!9034 lt!300552)))))))

(declare-fun b!194138 () Bool)

(declare-fun e!133589 () Bool)

(assert (=> b!194138 (= e!133590 e!133589)))

(declare-fun res!162307 () Bool)

(assert (=> b!194138 (=> res!162307 e!133589)))

(assert (=> b!194138 (= res!162307 (= (size!4405 (buf!4885 (_2!9034 lt!300564))) #b00000000000000000000000000000000))))

(declare-fun b!194139 () Bool)

(assert (=> b!194139 (= e!133589 (arrayBitRangesEq!0 (buf!4885 (_2!9034 lt!300564)) (buf!4885 (_2!9034 lt!300552)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4405 (buf!4885 (_2!9034 lt!300564))) (currentByte!9169 (_2!9034 lt!300564)) (currentBit!9164 (_2!9034 lt!300564)))))))

(assert (= (and d!65929 res!162308) b!194137))

(assert (= (and b!194137 res!162309) b!194138))

(assert (= (and b!194138 (not res!162307)) b!194139))

(assert (=> b!194137 m!299957))

(assert (=> b!194137 m!299981))

(assert (=> b!194139 m!299957))

(assert (=> b!194139 m!299957))

(declare-fun m!300861 () Bool)

(assert (=> b!194139 m!300861))

(assert (=> b!193644 d!65929))

(declare-fun d!65931 () Bool)

(declare-fun lt!301697 () tuple2!16774)

(declare-fun lt!301698 () tuple2!16774)

(assert (=> d!65931 (and (= (_2!9032 lt!301697) (_2!9032 lt!301698)) (= (_1!9032 lt!301697) (_1!9032 lt!301698)))))

(declare-fun lt!301696 () BitStream!7918)

(declare-fun lt!301694 () Bool)

(declare-fun lt!301699 () Unit!13687)

(declare-fun lt!301695 () (_ BitVec 64))

(declare-fun choose!56 (BitStream!7918 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!16774 tuple2!16774 BitStream!7918 (_ BitVec 64) Bool BitStream!7918 (_ BitVec 64) tuple2!16774 tuple2!16774 BitStream!7918 (_ BitVec 64)) Unit!13687)

(assert (=> d!65931 (= lt!301699 (choose!56 (_1!9031 lt!300553) nBits!348 i!590 lt!300551 lt!301697 (tuple2!16775 (_1!9032 lt!301697) (_2!9032 lt!301697)) (_1!9032 lt!301697) (_2!9032 lt!301697) lt!301694 lt!301696 lt!301695 lt!301698 (tuple2!16775 (_1!9032 lt!301698) (_2!9032 lt!301698)) (_1!9032 lt!301698) (_2!9032 lt!301698)))))

(assert (=> d!65931 (= lt!301698 (readNBitsLSBFirstsLoopPure!0 lt!301696 nBits!348 (bvadd i!590 #b00000000000000000000000000000001) lt!301695))))

(assert (=> d!65931 (= lt!301695 (bvor lt!300551 (ite lt!301694 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65931 (= lt!301696 (withMovedBitIndex!0 (_1!9031 lt!300553) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!65931 (= lt!301694 (_2!9033 (readBitPure!0 (_1!9031 lt!300553))))))

(assert (=> d!65931 (= lt!301697 (readNBitsLSBFirstsLoopPure!0 (_1!9031 lt!300553) nBits!348 i!590 lt!300551))))

(assert (=> d!65931 (= (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9031 lt!300553) nBits!348 i!590 lt!300551) lt!301699)))

(declare-fun bs!16391 () Bool)

(assert (= bs!16391 d!65931))

(declare-fun m!300863 () Bool)

(assert (=> bs!16391 m!300863))

(assert (=> bs!16391 m!300007))

(assert (=> bs!16391 m!299973))

(assert (=> bs!16391 m!299991))

(declare-fun m!300865 () Bool)

(assert (=> bs!16391 m!300865))

(assert (=> b!193645 d!65931))

(declare-fun lt!301700 () tuple2!16800)

(declare-fun d!65933 () Bool)

(assert (=> d!65933 (= lt!301700 (readNBitsLSBFirstsLoop!0 lt!300542 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!300539))))

(assert (=> d!65933 (= (readNBitsLSBFirstsLoopPure!0 lt!300542 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!300539) (tuple2!16775 (_2!9045 lt!301700) (_1!9045 lt!301700)))))

(declare-fun bs!16392 () Bool)

(assert (= bs!16392 d!65933))

(declare-fun m!300867 () Bool)

(assert (=> bs!16392 m!300867))

(assert (=> b!193645 d!65933))

(declare-fun d!65935 () Bool)

(declare-fun e!133591 () Bool)

(assert (=> d!65935 e!133591))

(declare-fun res!162310 () Bool)

(assert (=> d!65935 (=> (not res!162310) (not e!133591))))

(declare-fun lt!301702 () (_ BitVec 64))

(declare-fun lt!301701 () BitStream!7918)

(assert (=> d!65935 (= res!162310 (= (bvadd lt!301702 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4405 (buf!4885 lt!301701)) (currentByte!9169 lt!301701) (currentBit!9164 lt!301701))))))

(assert (=> d!65935 (or (not (= (bvand lt!301702 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!301702 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!301702 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65935 (= lt!301702 (bitIndex!0 (size!4405 (buf!4885 (_1!9031 lt!300553))) (currentByte!9169 (_1!9031 lt!300553)) (currentBit!9164 (_1!9031 lt!300553))))))

(assert (=> d!65935 (= lt!301701 (_2!9034 (moveBitIndex!0 (_1!9031 lt!300553) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!65935 (moveBitIndexPrecond!0 (_1!9031 lt!300553) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!65935 (= (withMovedBitIndex!0 (_1!9031 lt!300553) #b0000000000000000000000000000000000000000000000000000000000000001) lt!301701)))

(declare-fun b!194140 () Bool)

(assert (=> b!194140 (= e!133591 (= (size!4405 (buf!4885 (_1!9031 lt!300553))) (size!4405 (buf!4885 lt!301701))))))

(assert (= (and d!65935 res!162310) b!194140))

(declare-fun m!300869 () Bool)

(assert (=> d!65935 m!300869))

(declare-fun m!300871 () Bool)

(assert (=> d!65935 m!300871))

(declare-fun m!300873 () Bool)

(assert (=> d!65935 m!300873))

(declare-fun m!300875 () Bool)

(assert (=> d!65935 m!300875))

(assert (=> b!193645 d!65935))

(push 1)

(assert (not b!194139))

(assert (not d!65785))

(assert (not d!65747))

(assert (not b!193938))

(assert (not d!65791))

(assert (not bm!3050))

(assert (not b!193931))

(assert (not d!65787))

(assert (not b!193917))

(assert (not d!65749))

(assert (not b!193933))

(assert (not d!65759))

(assert (not d!65773))

(assert (not d!65807))

(assert (not d!65765))

(assert (not b!193924))

(assert (not d!65755))

(assert (not b!194132))

(assert (not d!65767))

(assert (not b!194126))

(assert (not d!65931))

(assert (not b!193914))

(assert (not d!65809))

(assert (not d!65751))

(assert (not d!65793))

(assert (not d!65771))

(assert (not d!65823))

(assert (not d!65811))

(assert (not d!65753))

(assert (not b!193915))

(assert (not d!65817))

(assert (not d!65935))

(assert (not d!65813))

(assert (not b!193874))

(assert (not b!193891))

(assert (not d!65821))

(assert (not b!194135))

(assert (not b!193893))

(assert (not b!193875))

(assert (not d!65757))

(assert (not d!65933))

(assert (not b!194131))

(assert (not b!193878))

(assert (not d!65797))

(assert (not b!194125))

(assert (not b!194128))

(assert (not b!193890))

(assert (not d!65775))

(assert (not b!194134))

(assert (not d!65801))

(assert (not b!193894))

(assert (not b!193877))

(assert (not d!65777))

(assert (not b!194121))

(assert (not d!65761))

(assert (not b!194123))

(assert (not d!65789))

(assert (not d!65805))

(assert (not b!193916))

(assert (not d!65799))

(assert (not b!193936))

(assert (not b!194137))

(check-sat)

(pop 1)

(push 1)

(check-sat)

