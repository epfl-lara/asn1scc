; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44820 () Bool)

(assert start!44820)

(declare-fun b!214976 () Bool)

(declare-fun e!146302 () Bool)

(declare-fun e!146309 () Bool)

(assert (=> b!214976 (= e!146302 (not e!146309))))

(declare-fun res!180792 () Bool)

(assert (=> b!214976 (=> res!180792 e!146309)))

(declare-fun lt!339630 () (_ BitVec 64))

(declare-fun lt!339623 () (_ BitVec 64))

(assert (=> b!214976 (= res!180792 (not (= lt!339630 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!339623))))))

(declare-datatypes ((array!10583 0))(
  ( (array!10584 (arr!5578 (Array (_ BitVec 32) (_ BitVec 8))) (size!4648 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8404 0))(
  ( (BitStream!8405 (buf!5183 array!10583) (currentByte!9761 (_ BitVec 32)) (currentBit!9756 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!15280 0))(
  ( (Unit!15281) )
))
(declare-datatypes ((tuple2!18410 0))(
  ( (tuple2!18411 (_1!9860 Unit!15280) (_2!9860 BitStream!8404)) )
))
(declare-fun lt!339611 () tuple2!18410)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!214976 (= lt!339630 (bitIndex!0 (size!4648 (buf!5183 (_2!9860 lt!339611))) (currentByte!9761 (_2!9860 lt!339611)) (currentBit!9756 (_2!9860 lt!339611))))))

(declare-fun thiss!1204 () BitStream!8404)

(assert (=> b!214976 (= lt!339623 (bitIndex!0 (size!4648 (buf!5183 thiss!1204)) (currentByte!9761 thiss!1204) (currentBit!9756 thiss!1204)))))

(declare-fun e!146307 () Bool)

(assert (=> b!214976 e!146307))

(declare-fun res!180802 () Bool)

(assert (=> b!214976 (=> (not res!180802) (not e!146307))))

(assert (=> b!214976 (= res!180802 (= (size!4648 (buf!5183 thiss!1204)) (size!4648 (buf!5183 (_2!9860 lt!339611)))))))

(declare-fun lt!339626 () Bool)

(declare-fun appendBit!0 (BitStream!8404 Bool) tuple2!18410)

(assert (=> b!214976 (= lt!339611 (appendBit!0 thiss!1204 lt!339626))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun lt!339616 () (_ BitVec 64))

(assert (=> b!214976 (= lt!339626 (not (= (bvand v!189 lt!339616) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!214976 (= lt!339616 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!214977 () Bool)

(declare-fun e!146304 () Bool)

(declare-fun lt!339620 () (_ BitVec 64))

(assert (=> b!214977 (= e!146304 (bvsge lt!339620 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!339612 () tuple2!18410)

(assert (=> b!214977 (= (size!4648 (buf!5183 thiss!1204)) (size!4648 (buf!5183 (_2!9860 lt!339612))))))

(declare-fun b!214978 () Bool)

(declare-fun e!146301 () Bool)

(declare-datatypes ((tuple2!18412 0))(
  ( (tuple2!18413 (_1!9861 BitStream!8404) (_2!9861 Bool)) )
))
(declare-fun lt!339614 () tuple2!18412)

(declare-fun lt!339617 () tuple2!18412)

(assert (=> b!214978 (= e!146301 (= (_2!9861 lt!339614) (_2!9861 lt!339617)))))

(declare-fun b!214980 () Bool)

(declare-fun e!146306 () Bool)

(declare-fun array_inv!4389 (array!10583) Bool)

(assert (=> b!214980 (= e!146306 (array_inv!4389 (buf!5183 thiss!1204)))))

(declare-fun b!214981 () Bool)

(declare-fun res!180804 () Bool)

(declare-fun e!146311 () Bool)

(assert (=> b!214981 (=> (not res!180804) (not e!146311))))

(declare-fun isPrefixOf!0 (BitStream!8404 BitStream!8404) Bool)

(assert (=> b!214981 (= res!180804 (isPrefixOf!0 thiss!1204 (_2!9860 lt!339611)))))

(declare-fun b!214982 () Bool)

(declare-fun e!146300 () Bool)

(assert (=> b!214982 (= e!146311 e!146300)))

(declare-fun res!180791 () Bool)

(assert (=> b!214982 (=> (not res!180791) (not e!146300))))

(declare-fun lt!339619 () tuple2!18412)

(assert (=> b!214982 (= res!180791 (and (= (_2!9861 lt!339619) lt!339626) (= (_1!9861 lt!339619) (_2!9860 lt!339611))))))

(declare-fun readBitPure!0 (BitStream!8404) tuple2!18412)

(declare-fun readerFrom!0 (BitStream!8404 (_ BitVec 32) (_ BitVec 32)) BitStream!8404)

(assert (=> b!214982 (= lt!339619 (readBitPure!0 (readerFrom!0 (_2!9860 lt!339611) (currentBit!9756 thiss!1204) (currentByte!9761 thiss!1204))))))

(declare-fun b!214983 () Bool)

(declare-fun res!180799 () Bool)

(assert (=> b!214983 (=> res!180799 e!146304)))

(declare-datatypes ((tuple2!18414 0))(
  ( (tuple2!18415 (_1!9862 BitStream!8404) (_2!9862 (_ BitVec 64))) )
))
(declare-fun lt!339625 () tuple2!18414)

(declare-datatypes ((tuple2!18416 0))(
  ( (tuple2!18417 (_1!9863 BitStream!8404) (_2!9863 BitStream!8404)) )
))
(declare-fun lt!339610 () tuple2!18416)

(assert (=> b!214983 (= res!180799 (not (= (bitIndex!0 (size!4648 (buf!5183 (_1!9862 lt!339625))) (currentByte!9761 (_1!9862 lt!339625)) (currentBit!9756 (_1!9862 lt!339625))) (bitIndex!0 (size!4648 (buf!5183 (_2!9863 lt!339610))) (currentByte!9761 (_2!9863 lt!339610)) (currentBit!9756 (_2!9863 lt!339610))))))))

(declare-fun b!214984 () Bool)

(declare-fun e!146303 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!214984 (= e!146303 (invariant!0 (currentBit!9756 thiss!1204) (currentByte!9761 thiss!1204) (size!4648 (buf!5183 (_2!9860 lt!339612)))))))

(declare-fun b!214985 () Bool)

(declare-fun res!180808 () Bool)

(declare-fun e!146305 () Bool)

(assert (=> b!214985 (=> res!180808 e!146305)))

(declare-fun lt!339628 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!214985 (= res!180808 (or (not (= (size!4648 (buf!5183 (_2!9860 lt!339612))) (size!4648 (buf!5183 thiss!1204)))) (not (= lt!339628 (bvsub (bvadd lt!339623 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!214986 () Bool)

(declare-fun res!180806 () Bool)

(assert (=> b!214986 (=> res!180806 e!146305)))

(assert (=> b!214986 (= res!180806 (not (invariant!0 (currentBit!9756 (_2!9860 lt!339612)) (currentByte!9761 (_2!9860 lt!339612)) (size!4648 (buf!5183 (_2!9860 lt!339612))))))))

(declare-fun b!214987 () Bool)

(declare-fun res!180807 () Bool)

(assert (=> b!214987 (=> (not res!180807) (not e!146302))))

(assert (=> b!214987 (= res!180807 (invariant!0 (currentBit!9756 thiss!1204) (currentByte!9761 thiss!1204) (size!4648 (buf!5183 thiss!1204))))))

(declare-fun lt!339621 () tuple2!18416)

(declare-fun lt!339608 () BitStream!8404)

(declare-fun e!146310 () Bool)

(declare-fun b!214988 () Bool)

(declare-fun lt!339613 () tuple2!18414)

(assert (=> b!214988 (= e!146310 (and (= lt!339623 (bvsub lt!339630 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!9863 lt!339621) lt!339608)) (= (_2!9862 lt!339625) (_2!9862 lt!339613)))))))

(declare-fun b!214989 () Bool)

(declare-fun res!180790 () Bool)

(assert (=> b!214989 (=> res!180790 e!146305)))

(assert (=> b!214989 (= res!180790 (not (isPrefixOf!0 (_2!9860 lt!339611) (_2!9860 lt!339612))))))

(declare-fun b!214990 () Bool)

(declare-fun lt!339606 () (_ BitVec 64))

(assert (=> b!214990 (= e!146300 (= (bitIndex!0 (size!4648 (buf!5183 (_1!9861 lt!339619))) (currentByte!9761 (_1!9861 lt!339619)) (currentBit!9756 (_1!9861 lt!339619))) lt!339606))))

(declare-fun b!214991 () Bool)

(declare-fun e!146313 () Bool)

(assert (=> b!214991 (= e!146313 e!146302)))

(declare-fun res!180803 () Bool)

(assert (=> b!214991 (=> (not res!180803) (not e!146302))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!214991 (= res!180803 (validate_offset_bits!1 ((_ sign_extend 32) (size!4648 (buf!5183 thiss!1204))) ((_ sign_extend 32) (currentByte!9761 thiss!1204)) ((_ sign_extend 32) (currentBit!9756 thiss!1204)) lt!339620))))

(assert (=> b!214991 (= lt!339620 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!214992 () Bool)

(declare-fun e!146312 () Bool)

(assert (=> b!214992 (= e!146312 e!146304)))

(declare-fun res!180795 () Bool)

(assert (=> b!214992 (=> res!180795 e!146304)))

(assert (=> b!214992 (= res!180795 (not (= (_1!9863 lt!339621) lt!339608)))))

(assert (=> b!214992 e!146310))

(declare-fun res!180801 () Bool)

(assert (=> b!214992 (=> (not res!180801) (not e!146310))))

(declare-fun lt!339618 () tuple2!18414)

(assert (=> b!214992 (= res!180801 (and (= (_2!9862 lt!339625) (_2!9862 lt!339618)) (= (_1!9862 lt!339625) (_1!9862 lt!339618))))))

(declare-fun lt!339604 () Unit!15280)

(declare-fun lt!339631 () (_ BitVec 64))

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8404 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!15280)

(assert (=> b!214992 (= lt!339604 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9863 lt!339610) nBits!348 i!590 lt!339631))))

(declare-fun lt!339605 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8404 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18414)

(assert (=> b!214992 (= lt!339618 (readNBitsLSBFirstsLoopPure!0 lt!339608 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!339605))))

(declare-fun withMovedBitIndex!0 (BitStream!8404 (_ BitVec 64)) BitStream!8404)

(assert (=> b!214992 (= lt!339608 (withMovedBitIndex!0 (_1!9863 lt!339610) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!214993 () Bool)

(declare-fun res!180788 () Bool)

(assert (=> b!214993 (=> res!180788 e!146305)))

(assert (=> b!214993 (= res!180788 (not (isPrefixOf!0 thiss!1204 (_2!9860 lt!339611))))))

(declare-fun b!214994 () Bool)

(declare-fun res!180789 () Bool)

(assert (=> b!214994 (=> (not res!180789) (not e!146302))))

(assert (=> b!214994 (= res!180789 (not (= i!590 nBits!348)))))

(declare-fun b!214995 () Bool)

(assert (=> b!214995 (= e!146309 e!146305)))

(declare-fun res!180796 () Bool)

(assert (=> b!214995 (=> res!180796 e!146305)))

(assert (=> b!214995 (= res!180796 (not (= lt!339628 (bvsub (bvsub (bvadd lt!339630 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!214995 (= lt!339628 (bitIndex!0 (size!4648 (buf!5183 (_2!9860 lt!339612))) (currentByte!9761 (_2!9860 lt!339612)) (currentBit!9756 (_2!9860 lt!339612))))))

(assert (=> b!214995 (isPrefixOf!0 thiss!1204 (_2!9860 lt!339612))))

(declare-fun lt!339632 () Unit!15280)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8404 BitStream!8404 BitStream!8404) Unit!15280)

(assert (=> b!214995 (= lt!339632 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9860 lt!339611) (_2!9860 lt!339612)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8404 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!18410)

(assert (=> b!214995 (= lt!339612 (appendBitsLSBFirstLoopTR!0 (_2!9860 lt!339611) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!214996 () Bool)

(declare-fun res!180797 () Bool)

(assert (=> b!214996 (=> (not res!180797) (not e!146310))))

(assert (=> b!214996 (= res!180797 (= (_1!9863 lt!339610) (withMovedBitIndex!0 (_2!9863 lt!339610) (bvsub lt!339623 lt!339628))))))

(declare-fun b!214997 () Bool)

(assert (=> b!214997 (= e!146305 e!146312)))

(declare-fun res!180798 () Bool)

(assert (=> b!214997 (=> res!180798 e!146312)))

(assert (=> b!214997 (= res!180798 (not (= (_1!9862 lt!339613) (_2!9863 lt!339621))))))

(assert (=> b!214997 (= lt!339613 (readNBitsLSBFirstsLoopPure!0 (_1!9863 lt!339621) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!339605))))

(declare-fun lt!339609 () (_ BitVec 64))

(assert (=> b!214997 (validate_offset_bits!1 ((_ sign_extend 32) (size!4648 (buf!5183 (_2!9860 lt!339612)))) ((_ sign_extend 32) (currentByte!9761 (_2!9860 lt!339611))) ((_ sign_extend 32) (currentBit!9756 (_2!9860 lt!339611))) lt!339609)))

(declare-fun lt!339627 () Unit!15280)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8404 array!10583 (_ BitVec 64)) Unit!15280)

(assert (=> b!214997 (= lt!339627 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9860 lt!339611) (buf!5183 (_2!9860 lt!339612)) lt!339609))))

(assert (=> b!214997 (= lt!339609 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!339622 () tuple2!18412)

(assert (=> b!214997 (= lt!339605 (bvor lt!339631 (ite (_2!9861 lt!339622) lt!339616 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!214997 (= lt!339625 (readNBitsLSBFirstsLoopPure!0 (_1!9863 lt!339610) nBits!348 i!590 lt!339631))))

(assert (=> b!214997 (validate_offset_bits!1 ((_ sign_extend 32) (size!4648 (buf!5183 (_2!9860 lt!339612)))) ((_ sign_extend 32) (currentByte!9761 thiss!1204)) ((_ sign_extend 32) (currentBit!9756 thiss!1204)) lt!339620)))

(declare-fun lt!339607 () Unit!15280)

(assert (=> b!214997 (= lt!339607 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5183 (_2!9860 lt!339612)) lt!339620))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!214997 (= lt!339631 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!214997 (= (_2!9861 lt!339622) lt!339626)))

(assert (=> b!214997 (= lt!339622 (readBitPure!0 (_1!9863 lt!339610)))))

(declare-fun reader!0 (BitStream!8404 BitStream!8404) tuple2!18416)

(assert (=> b!214997 (= lt!339621 (reader!0 (_2!9860 lt!339611) (_2!9860 lt!339612)))))

(assert (=> b!214997 (= lt!339610 (reader!0 thiss!1204 (_2!9860 lt!339612)))))

(assert (=> b!214997 e!146301))

(declare-fun res!180809 () Bool)

(assert (=> b!214997 (=> (not res!180809) (not e!146301))))

(assert (=> b!214997 (= res!180809 (= (bitIndex!0 (size!4648 (buf!5183 (_1!9861 lt!339614))) (currentByte!9761 (_1!9861 lt!339614)) (currentBit!9756 (_1!9861 lt!339614))) (bitIndex!0 (size!4648 (buf!5183 (_1!9861 lt!339617))) (currentByte!9761 (_1!9861 lt!339617)) (currentBit!9756 (_1!9861 lt!339617)))))))

(declare-fun lt!339624 () Unit!15280)

(declare-fun lt!339615 () BitStream!8404)

(declare-fun readBitPrefixLemma!0 (BitStream!8404 BitStream!8404) Unit!15280)

(assert (=> b!214997 (= lt!339624 (readBitPrefixLemma!0 lt!339615 (_2!9860 lt!339612)))))

(assert (=> b!214997 (= lt!339617 (readBitPure!0 (BitStream!8405 (buf!5183 (_2!9860 lt!339612)) (currentByte!9761 thiss!1204) (currentBit!9756 thiss!1204))))))

(assert (=> b!214997 (= lt!339614 (readBitPure!0 lt!339615))))

(assert (=> b!214997 e!146303))

(declare-fun res!180800 () Bool)

(assert (=> b!214997 (=> (not res!180800) (not e!146303))))

(assert (=> b!214997 (= res!180800 (invariant!0 (currentBit!9756 thiss!1204) (currentByte!9761 thiss!1204) (size!4648 (buf!5183 (_2!9860 lt!339611)))))))

(assert (=> b!214997 (= lt!339615 (BitStream!8405 (buf!5183 (_2!9860 lt!339611)) (currentByte!9761 thiss!1204) (currentBit!9756 thiss!1204)))))

(declare-fun b!214998 () Bool)

(declare-fun res!180805 () Bool)

(assert (=> b!214998 (=> (not res!180805) (not e!146310))))

(assert (=> b!214998 (= res!180805 (= (_1!9863 lt!339621) (withMovedBitIndex!0 (_2!9863 lt!339621) (bvsub lt!339630 lt!339628))))))

(declare-fun b!214979 () Bool)

(assert (=> b!214979 (= e!146307 e!146311)))

(declare-fun res!180793 () Bool)

(assert (=> b!214979 (=> (not res!180793) (not e!146311))))

(declare-fun lt!339629 () (_ BitVec 64))

(assert (=> b!214979 (= res!180793 (= lt!339606 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!339629)))))

(assert (=> b!214979 (= lt!339606 (bitIndex!0 (size!4648 (buf!5183 (_2!9860 lt!339611))) (currentByte!9761 (_2!9860 lt!339611)) (currentBit!9756 (_2!9860 lt!339611))))))

(assert (=> b!214979 (= lt!339629 (bitIndex!0 (size!4648 (buf!5183 thiss!1204)) (currentByte!9761 thiss!1204) (currentBit!9756 thiss!1204)))))

(declare-fun res!180794 () Bool)

(assert (=> start!44820 (=> (not res!180794) (not e!146313))))

(assert (=> start!44820 (= res!180794 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!44820 e!146313))

(assert (=> start!44820 true))

(declare-fun inv!12 (BitStream!8404) Bool)

(assert (=> start!44820 (and (inv!12 thiss!1204) e!146306)))

(assert (= (and start!44820 res!180794) b!214991))

(assert (= (and b!214991 res!180803) b!214987))

(assert (= (and b!214987 res!180807) b!214994))

(assert (= (and b!214994 res!180789) b!214976))

(assert (= (and b!214976 res!180802) b!214979))

(assert (= (and b!214979 res!180793) b!214981))

(assert (= (and b!214981 res!180804) b!214982))

(assert (= (and b!214982 res!180791) b!214990))

(assert (= (and b!214976 (not res!180792)) b!214995))

(assert (= (and b!214995 (not res!180796)) b!214986))

(assert (= (and b!214986 (not res!180806)) b!214985))

(assert (= (and b!214985 (not res!180808)) b!214989))

(assert (= (and b!214989 (not res!180790)) b!214993))

(assert (= (and b!214993 (not res!180788)) b!214997))

(assert (= (and b!214997 res!180800) b!214984))

(assert (= (and b!214997 res!180809) b!214978))

(assert (= (and b!214997 (not res!180798)) b!214992))

(assert (= (and b!214992 res!180801) b!214996))

(assert (= (and b!214996 res!180797) b!214998))

(assert (= (and b!214998 res!180805) b!214988))

(assert (= (and b!214992 (not res!180795)) b!214983))

(assert (= (and b!214983 (not res!180799)) b!214977))

(assert (= start!44820 b!214980))

(declare-fun m!331131 () Bool)

(assert (=> b!214980 m!331131))

(declare-fun m!331133 () Bool)

(assert (=> b!214992 m!331133))

(declare-fun m!331135 () Bool)

(assert (=> b!214992 m!331135))

(declare-fun m!331137 () Bool)

(assert (=> b!214992 m!331137))

(declare-fun m!331139 () Bool)

(assert (=> b!214991 m!331139))

(declare-fun m!331141 () Bool)

(assert (=> b!214990 m!331141))

(declare-fun m!331143 () Bool)

(assert (=> b!214989 m!331143))

(declare-fun m!331145 () Bool)

(assert (=> b!214997 m!331145))

(declare-fun m!331147 () Bool)

(assert (=> b!214997 m!331147))

(declare-fun m!331149 () Bool)

(assert (=> b!214997 m!331149))

(declare-fun m!331151 () Bool)

(assert (=> b!214997 m!331151))

(declare-fun m!331153 () Bool)

(assert (=> b!214997 m!331153))

(declare-fun m!331155 () Bool)

(assert (=> b!214997 m!331155))

(declare-fun m!331157 () Bool)

(assert (=> b!214997 m!331157))

(declare-fun m!331159 () Bool)

(assert (=> b!214997 m!331159))

(declare-fun m!331161 () Bool)

(assert (=> b!214997 m!331161))

(declare-fun m!331163 () Bool)

(assert (=> b!214997 m!331163))

(declare-fun m!331165 () Bool)

(assert (=> b!214997 m!331165))

(declare-fun m!331167 () Bool)

(assert (=> b!214997 m!331167))

(declare-fun m!331169 () Bool)

(assert (=> b!214997 m!331169))

(declare-fun m!331171 () Bool)

(assert (=> b!214997 m!331171))

(declare-fun m!331173 () Bool)

(assert (=> b!214997 m!331173))

(declare-fun m!331175 () Bool)

(assert (=> b!214997 m!331175))

(declare-fun m!331177 () Bool)

(assert (=> b!214996 m!331177))

(declare-fun m!331179 () Bool)

(assert (=> b!214998 m!331179))

(declare-fun m!331181 () Bool)

(assert (=> b!214987 m!331181))

(declare-fun m!331183 () Bool)

(assert (=> start!44820 m!331183))

(declare-fun m!331185 () Bool)

(assert (=> b!214993 m!331185))

(declare-fun m!331187 () Bool)

(assert (=> b!214979 m!331187))

(declare-fun m!331189 () Bool)

(assert (=> b!214979 m!331189))

(declare-fun m!331191 () Bool)

(assert (=> b!214995 m!331191))

(declare-fun m!331193 () Bool)

(assert (=> b!214995 m!331193))

(declare-fun m!331195 () Bool)

(assert (=> b!214995 m!331195))

(declare-fun m!331197 () Bool)

(assert (=> b!214995 m!331197))

(declare-fun m!331199 () Bool)

(assert (=> b!214982 m!331199))

(assert (=> b!214982 m!331199))

(declare-fun m!331201 () Bool)

(assert (=> b!214982 m!331201))

(declare-fun m!331203 () Bool)

(assert (=> b!214986 m!331203))

(assert (=> b!214981 m!331185))

(declare-fun m!331205 () Bool)

(assert (=> b!214984 m!331205))

(declare-fun m!331207 () Bool)

(assert (=> b!214983 m!331207))

(declare-fun m!331209 () Bool)

(assert (=> b!214983 m!331209))

(assert (=> b!214976 m!331187))

(assert (=> b!214976 m!331189))

(declare-fun m!331211 () Bool)

(assert (=> b!214976 m!331211))

(push 1)

(assert (not b!214995))

(assert (not start!44820))

(assert (not b!214997))

(assert (not b!214981))

(assert (not b!214989))

(assert (not b!214993))

(assert (not b!214986))

(assert (not b!214987))

(assert (not b!214979))

(assert (not b!214991))

(assert (not b!214998))

(assert (not b!214982))

(assert (not b!214990))

(assert (not b!214976))

(assert (not b!214984))

(assert (not b!214996))

(assert (not b!214992))

(assert (not b!214980))

(assert (not b!214983))

(check-sat)

(pop 1)

(push 1)

(check-sat)

