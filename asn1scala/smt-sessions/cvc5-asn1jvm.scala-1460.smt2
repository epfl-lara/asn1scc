; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40070 () Bool)

(assert start!40070)

(declare-fun b!182742 () Bool)

(declare-fun res!151887 () Bool)

(declare-fun e!126798 () Bool)

(assert (=> b!182742 (=> (not res!151887) (not e!126798))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!182742 (= res!151887 (not (= i!590 nBits!348)))))

(declare-fun lt!280955 () (_ BitVec 64))

(declare-fun lt!280946 () (_ BitVec 64))

(declare-fun b!182743 () Bool)

(declare-fun e!126797 () Bool)

(declare-datatypes ((array!9737 0))(
  ( (array!9738 (arr!5224 (Array (_ BitVec 32) (_ BitVec 8))) (size!4294 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7696 0))(
  ( (BitStream!7697 (buf!4746 array!9737) (currentByte!8974 (_ BitVec 32)) (currentBit!8969 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15776 0))(
  ( (tuple2!15777 (_1!8533 BitStream!7696) (_2!8533 Bool)) )
))
(declare-fun lt!280933 () tuple2!15776)

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!182743 (= e!126797 (= (bvand (bvor lt!280946 (ite (_2!8533 lt!280933) lt!280955 #b0000000000000000000000000000000000000000000000000000000000000000)) (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!182744 () Bool)

(declare-fun res!151890 () Bool)

(assert (=> b!182744 (=> res!151890 e!126797)))

(declare-datatypes ((tuple2!15778 0))(
  ( (tuple2!15779 (_1!8534 BitStream!7696) (_2!8534 BitStream!7696)) )
))
(declare-fun lt!280953 () tuple2!15778)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!182744 (= res!151890 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!4294 (buf!4746 (_1!8534 lt!280953)))) ((_ sign_extend 32) (currentByte!8974 (_1!8534 lt!280953))) ((_ sign_extend 32) (currentBit!8969 (_1!8534 lt!280953))) ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))))

(declare-fun b!182745 () Bool)

(declare-fun e!126796 () Bool)

(assert (=> b!182745 (= e!126796 e!126798)))

(declare-fun res!151880 () Bool)

(assert (=> b!182745 (=> (not res!151880) (not e!126798))))

(declare-fun thiss!1204 () BitStream!7696)

(declare-fun lt!280952 () (_ BitVec 64))

(assert (=> b!182745 (= res!151880 (validate_offset_bits!1 ((_ sign_extend 32) (size!4294 (buf!4746 thiss!1204))) ((_ sign_extend 32) (currentByte!8974 thiss!1204)) ((_ sign_extend 32) (currentBit!8969 thiss!1204)) lt!280952))))

(assert (=> b!182745 (= lt!280952 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!182746 () Bool)

(declare-fun e!126795 () Bool)

(assert (=> b!182746 (= e!126795 e!126797)))

(declare-fun res!151883 () Bool)

(assert (=> b!182746 (=> res!151883 e!126797)))

(assert (=> b!182746 (= res!151883 (or (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!590)) (bvsgt (bvadd #b00000000000000000000000000000001 i!590) nBits!348)))))

(declare-datatypes ((Unit!13124 0))(
  ( (Unit!13125) )
))
(declare-datatypes ((tuple2!15780 0))(
  ( (tuple2!15781 (_1!8535 Unit!13124) (_2!8535 BitStream!7696)) )
))
(declare-fun lt!280947 () tuple2!15780)

(declare-fun lt!280945 () tuple2!15780)

(declare-fun lt!280949 () (_ BitVec 64))

(assert (=> b!182746 (validate_offset_bits!1 ((_ sign_extend 32) (size!4294 (buf!4746 (_2!8535 lt!280947)))) ((_ sign_extend 32) (currentByte!8974 (_2!8535 lt!280945))) ((_ sign_extend 32) (currentBit!8969 (_2!8535 lt!280945))) lt!280949)))

(declare-fun lt!280936 () Unit!13124)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7696 array!9737 (_ BitVec 64)) Unit!13124)

(assert (=> b!182746 (= lt!280936 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8535 lt!280945) (buf!4746 (_2!8535 lt!280947)) lt!280949))))

(assert (=> b!182746 (= lt!280949 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!280935 () tuple2!15778)

(declare-datatypes ((tuple2!15782 0))(
  ( (tuple2!15783 (_1!8536 BitStream!7696) (_2!8536 (_ BitVec 64))) )
))
(declare-fun lt!280944 () tuple2!15782)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7696 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!15782)

(assert (=> b!182746 (= lt!280944 (readNBitsLSBFirstsLoopPure!0 (_1!8534 lt!280935) nBits!348 i!590 lt!280946))))

(assert (=> b!182746 (validate_offset_bits!1 ((_ sign_extend 32) (size!4294 (buf!4746 (_2!8535 lt!280947)))) ((_ sign_extend 32) (currentByte!8974 thiss!1204)) ((_ sign_extend 32) (currentBit!8969 thiss!1204)) lt!280952)))

(declare-fun lt!280940 () Unit!13124)

(assert (=> b!182746 (= lt!280940 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4746 (_2!8535 lt!280947)) lt!280952))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!182746 (= lt!280946 (bvand v!189 (onesLSBLong!0 i!590)))))

(declare-fun lt!280941 () Bool)

(assert (=> b!182746 (= (_2!8533 lt!280933) lt!280941)))

(declare-fun readBitPure!0 (BitStream!7696) tuple2!15776)

(assert (=> b!182746 (= lt!280933 (readBitPure!0 (_1!8534 lt!280935)))))

(declare-fun reader!0 (BitStream!7696 BitStream!7696) tuple2!15778)

(assert (=> b!182746 (= lt!280953 (reader!0 (_2!8535 lt!280945) (_2!8535 lt!280947)))))

(assert (=> b!182746 (= lt!280935 (reader!0 thiss!1204 (_2!8535 lt!280947)))))

(declare-fun e!126793 () Bool)

(assert (=> b!182746 e!126793))

(declare-fun res!151885 () Bool)

(assert (=> b!182746 (=> (not res!151885) (not e!126793))))

(declare-fun lt!280943 () tuple2!15776)

(declare-fun lt!280937 () tuple2!15776)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!182746 (= res!151885 (= (bitIndex!0 (size!4294 (buf!4746 (_1!8533 lt!280943))) (currentByte!8974 (_1!8533 lt!280943)) (currentBit!8969 (_1!8533 lt!280943))) (bitIndex!0 (size!4294 (buf!4746 (_1!8533 lt!280937))) (currentByte!8974 (_1!8533 lt!280937)) (currentBit!8969 (_1!8533 lt!280937)))))))

(declare-fun lt!280948 () Unit!13124)

(declare-fun lt!280939 () BitStream!7696)

(declare-fun readBitPrefixLemma!0 (BitStream!7696 BitStream!7696) Unit!13124)

(assert (=> b!182746 (= lt!280948 (readBitPrefixLemma!0 lt!280939 (_2!8535 lt!280947)))))

(assert (=> b!182746 (= lt!280937 (readBitPure!0 (BitStream!7697 (buf!4746 (_2!8535 lt!280947)) (currentByte!8974 thiss!1204) (currentBit!8969 thiss!1204))))))

(assert (=> b!182746 (= lt!280943 (readBitPure!0 lt!280939))))

(declare-fun e!126792 () Bool)

(assert (=> b!182746 e!126792))

(declare-fun res!151888 () Bool)

(assert (=> b!182746 (=> (not res!151888) (not e!126792))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!182746 (= res!151888 (invariant!0 (currentBit!8969 thiss!1204) (currentByte!8974 thiss!1204) (size!4294 (buf!4746 (_2!8535 lt!280945)))))))

(assert (=> b!182746 (= lt!280939 (BitStream!7697 (buf!4746 (_2!8535 lt!280945)) (currentByte!8974 thiss!1204) (currentBit!8969 thiss!1204)))))

(declare-fun b!182747 () Bool)

(assert (=> b!182747 (= e!126792 (invariant!0 (currentBit!8969 thiss!1204) (currentByte!8974 thiss!1204) (size!4294 (buf!4746 (_2!8535 lt!280947)))))))

(declare-fun res!151882 () Bool)

(assert (=> start!40070 (=> (not res!151882) (not e!126796))))

(assert (=> start!40070 (= res!151882 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!40070 e!126796))

(assert (=> start!40070 true))

(declare-fun e!126799 () Bool)

(declare-fun inv!12 (BitStream!7696) Bool)

(assert (=> start!40070 (and (inv!12 thiss!1204) e!126799)))

(declare-fun b!182748 () Bool)

(declare-fun res!151881 () Bool)

(assert (=> b!182748 (=> res!151881 e!126795)))

(assert (=> b!182748 (= res!151881 (not (invariant!0 (currentBit!8969 (_2!8535 lt!280947)) (currentByte!8974 (_2!8535 lt!280947)) (size!4294 (buf!4746 (_2!8535 lt!280947))))))))

(declare-fun b!182749 () Bool)

(declare-fun e!126790 () Bool)

(declare-fun e!126788 () Bool)

(assert (=> b!182749 (= e!126790 e!126788)))

(declare-fun res!151876 () Bool)

(assert (=> b!182749 (=> (not res!151876) (not e!126788))))

(declare-fun lt!280951 () tuple2!15776)

(assert (=> b!182749 (= res!151876 (and (= (_2!8533 lt!280951) lt!280941) (= (_1!8533 lt!280951) (_2!8535 lt!280945))))))

(declare-fun readerFrom!0 (BitStream!7696 (_ BitVec 32) (_ BitVec 32)) BitStream!7696)

(assert (=> b!182749 (= lt!280951 (readBitPure!0 (readerFrom!0 (_2!8535 lt!280945) (currentBit!8969 thiss!1204) (currentByte!8974 thiss!1204))))))

(declare-fun b!182750 () Bool)

(declare-fun e!126794 () Bool)

(assert (=> b!182750 (= e!126794 e!126790)))

(declare-fun res!151889 () Bool)

(assert (=> b!182750 (=> (not res!151889) (not e!126790))))

(declare-fun lt!280934 () (_ BitVec 64))

(declare-fun lt!280942 () (_ BitVec 64))

(assert (=> b!182750 (= res!151889 (= lt!280934 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!280942)))))

(assert (=> b!182750 (= lt!280934 (bitIndex!0 (size!4294 (buf!4746 (_2!8535 lt!280945))) (currentByte!8974 (_2!8535 lt!280945)) (currentBit!8969 (_2!8535 lt!280945))))))

(assert (=> b!182750 (= lt!280942 (bitIndex!0 (size!4294 (buf!4746 thiss!1204)) (currentByte!8974 thiss!1204) (currentBit!8969 thiss!1204)))))

(declare-fun b!182751 () Bool)

(declare-fun res!151886 () Bool)

(assert (=> b!182751 (=> (not res!151886) (not e!126798))))

(assert (=> b!182751 (= res!151886 (invariant!0 (currentBit!8969 thiss!1204) (currentByte!8974 thiss!1204) (size!4294 (buf!4746 thiss!1204))))))

(declare-fun b!182752 () Bool)

(declare-fun e!126791 () Bool)

(assert (=> b!182752 (= e!126798 (not e!126791))))

(declare-fun res!151884 () Bool)

(assert (=> b!182752 (=> res!151884 e!126791)))

(declare-fun lt!280938 () (_ BitVec 64))

(declare-fun lt!280932 () (_ BitVec 64))

(assert (=> b!182752 (= res!151884 (not (= lt!280938 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!280932))))))

(assert (=> b!182752 (= lt!280938 (bitIndex!0 (size!4294 (buf!4746 (_2!8535 lt!280945))) (currentByte!8974 (_2!8535 lt!280945)) (currentBit!8969 (_2!8535 lt!280945))))))

(assert (=> b!182752 (= lt!280932 (bitIndex!0 (size!4294 (buf!4746 thiss!1204)) (currentByte!8974 thiss!1204) (currentBit!8969 thiss!1204)))))

(assert (=> b!182752 e!126794))

(declare-fun res!151892 () Bool)

(assert (=> b!182752 (=> (not res!151892) (not e!126794))))

(assert (=> b!182752 (= res!151892 (= (size!4294 (buf!4746 thiss!1204)) (size!4294 (buf!4746 (_2!8535 lt!280945)))))))

(declare-fun appendBit!0 (BitStream!7696 Bool) tuple2!15780)

(assert (=> b!182752 (= lt!280945 (appendBit!0 thiss!1204 lt!280941))))

(assert (=> b!182752 (= lt!280941 (not (= (bvand v!189 lt!280955) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!182752 (= lt!280955 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!182753 () Bool)

(declare-fun res!151891 () Bool)

(assert (=> b!182753 (=> res!151891 e!126795)))

(declare-fun isPrefixOf!0 (BitStream!7696 BitStream!7696) Bool)

(assert (=> b!182753 (= res!151891 (not (isPrefixOf!0 (_2!8535 lt!280945) (_2!8535 lt!280947))))))

(declare-fun b!182754 () Bool)

(declare-fun array_inv!4035 (array!9737) Bool)

(assert (=> b!182754 (= e!126799 (array_inv!4035 (buf!4746 thiss!1204)))))

(declare-fun b!182755 () Bool)

(assert (=> b!182755 (= e!126791 e!126795)))

(declare-fun res!151878 () Bool)

(assert (=> b!182755 (=> res!151878 e!126795)))

(declare-fun lt!280950 () (_ BitVec 64))

(assert (=> b!182755 (= res!151878 (not (= lt!280950 (bvsub (bvsub (bvadd lt!280938 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!182755 (= lt!280950 (bitIndex!0 (size!4294 (buf!4746 (_2!8535 lt!280947))) (currentByte!8974 (_2!8535 lt!280947)) (currentBit!8969 (_2!8535 lt!280947))))))

(assert (=> b!182755 (isPrefixOf!0 thiss!1204 (_2!8535 lt!280947))))

(declare-fun lt!280954 () Unit!13124)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7696 BitStream!7696 BitStream!7696) Unit!13124)

(assert (=> b!182755 (= lt!280954 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8535 lt!280945) (_2!8535 lt!280947)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7696 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15780)

(assert (=> b!182755 (= lt!280947 (appendBitsLSBFirstLoopTR!0 (_2!8535 lt!280945) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!182756 () Bool)

(declare-fun res!151877 () Bool)

(assert (=> b!182756 (=> res!151877 e!126795)))

(assert (=> b!182756 (= res!151877 (not (isPrefixOf!0 thiss!1204 (_2!8535 lt!280945))))))

(declare-fun b!182757 () Bool)

(declare-fun res!151879 () Bool)

(assert (=> b!182757 (=> (not res!151879) (not e!126790))))

(assert (=> b!182757 (= res!151879 (isPrefixOf!0 thiss!1204 (_2!8535 lt!280945)))))

(declare-fun b!182758 () Bool)

(assert (=> b!182758 (= e!126793 (= (_2!8533 lt!280943) (_2!8533 lt!280937)))))

(declare-fun b!182759 () Bool)

(declare-fun res!151893 () Bool)

(assert (=> b!182759 (=> res!151893 e!126795)))

(assert (=> b!182759 (= res!151893 (or (not (= (size!4294 (buf!4746 (_2!8535 lt!280947))) (size!4294 (buf!4746 thiss!1204)))) (not (= lt!280950 (bvsub (bvadd lt!280932 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!182760 () Bool)

(assert (=> b!182760 (= e!126788 (= (bitIndex!0 (size!4294 (buf!4746 (_1!8533 lt!280951))) (currentByte!8974 (_1!8533 lt!280951)) (currentBit!8969 (_1!8533 lt!280951))) lt!280934))))

(assert (= (and start!40070 res!151882) b!182745))

(assert (= (and b!182745 res!151880) b!182751))

(assert (= (and b!182751 res!151886) b!182742))

(assert (= (and b!182742 res!151887) b!182752))

(assert (= (and b!182752 res!151892) b!182750))

(assert (= (and b!182750 res!151889) b!182757))

(assert (= (and b!182757 res!151879) b!182749))

(assert (= (and b!182749 res!151876) b!182760))

(assert (= (and b!182752 (not res!151884)) b!182755))

(assert (= (and b!182755 (not res!151878)) b!182748))

(assert (= (and b!182748 (not res!151881)) b!182759))

(assert (= (and b!182759 (not res!151893)) b!182753))

(assert (= (and b!182753 (not res!151891)) b!182756))

(assert (= (and b!182756 (not res!151877)) b!182746))

(assert (= (and b!182746 res!151888) b!182747))

(assert (= (and b!182746 res!151885) b!182758))

(assert (= (and b!182746 (not res!151883)) b!182744))

(assert (= (and b!182744 (not res!151890)) b!182743))

(assert (= start!40070 b!182754))

(declare-fun m!284293 () Bool)

(assert (=> b!182747 m!284293))

(declare-fun m!284295 () Bool)

(assert (=> b!182756 m!284295))

(declare-fun m!284297 () Bool)

(assert (=> b!182752 m!284297))

(declare-fun m!284299 () Bool)

(assert (=> b!182752 m!284299))

(declare-fun m!284301 () Bool)

(assert (=> b!182752 m!284301))

(declare-fun m!284303 () Bool)

(assert (=> b!182749 m!284303))

(assert (=> b!182749 m!284303))

(declare-fun m!284305 () Bool)

(assert (=> b!182749 m!284305))

(declare-fun m!284307 () Bool)

(assert (=> b!182755 m!284307))

(declare-fun m!284309 () Bool)

(assert (=> b!182755 m!284309))

(declare-fun m!284311 () Bool)

(assert (=> b!182755 m!284311))

(declare-fun m!284313 () Bool)

(assert (=> b!182755 m!284313))

(declare-fun m!284315 () Bool)

(assert (=> b!182746 m!284315))

(declare-fun m!284317 () Bool)

(assert (=> b!182746 m!284317))

(declare-fun m!284319 () Bool)

(assert (=> b!182746 m!284319))

(declare-fun m!284321 () Bool)

(assert (=> b!182746 m!284321))

(declare-fun m!284323 () Bool)

(assert (=> b!182746 m!284323))

(declare-fun m!284325 () Bool)

(assert (=> b!182746 m!284325))

(declare-fun m!284327 () Bool)

(assert (=> b!182746 m!284327))

(declare-fun m!284329 () Bool)

(assert (=> b!182746 m!284329))

(declare-fun m!284331 () Bool)

(assert (=> b!182746 m!284331))

(declare-fun m!284333 () Bool)

(assert (=> b!182746 m!284333))

(declare-fun m!284335 () Bool)

(assert (=> b!182746 m!284335))

(declare-fun m!284337 () Bool)

(assert (=> b!182746 m!284337))

(declare-fun m!284339 () Bool)

(assert (=> b!182746 m!284339))

(declare-fun m!284341 () Bool)

(assert (=> b!182746 m!284341))

(declare-fun m!284343 () Bool)

(assert (=> b!182746 m!284343))

(declare-fun m!284345 () Bool)

(assert (=> b!182760 m!284345))

(declare-fun m!284347 () Bool)

(assert (=> b!182753 m!284347))

(declare-fun m!284349 () Bool)

(assert (=> start!40070 m!284349))

(declare-fun m!284351 () Bool)

(assert (=> b!182743 m!284351))

(declare-fun m!284353 () Bool)

(assert (=> b!182754 m!284353))

(declare-fun m!284355 () Bool)

(assert (=> b!182744 m!284355))

(assert (=> b!182757 m!284295))

(declare-fun m!284357 () Bool)

(assert (=> b!182745 m!284357))

(declare-fun m!284359 () Bool)

(assert (=> b!182748 m!284359))

(assert (=> b!182750 m!284297))

(assert (=> b!182750 m!284299))

(declare-fun m!284361 () Bool)

(assert (=> b!182751 m!284361))

(push 1)

(assert (not b!182744))

(assert (not b!182747))

(assert (not b!182749))

(assert (not b!182743))

(assert (not b!182745))

(assert (not b!182753))

(assert (not b!182757))

(assert (not b!182760))

(assert (not b!182746))

(assert (not b!182756))

(assert (not b!182750))

(assert (not b!182754))

(assert (not b!182751))

(assert (not b!182752))

(assert (not b!182748))

(assert (not b!182755))

(assert (not start!40070))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!63421 () Bool)

(assert (=> d!63421 (= (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 (bvadd #b00000000000000000000000000000001 i!590))) (ite (= (bvsub #b00000000000000000000000001000000 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000 (bvshl #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub #b00000000000000000000000001000000 (bvadd #b00000000000000000000000000000001 i!590)))))))))

(assert (=> b!182743 d!63421))

(declare-fun d!63423 () Bool)

(assert (=> d!63423 (= (inv!12 thiss!1204) (invariant!0 (currentBit!8969 thiss!1204) (currentByte!8974 thiss!1204) (size!4294 (buf!4746 thiss!1204))))))

(declare-fun bs!15792 () Bool)

(assert (= bs!15792 d!63423))

(assert (=> bs!15792 m!284361))

(assert (=> start!40070 d!63423))

(declare-fun d!63425 () Bool)

(assert (=> d!63425 (= (array_inv!4035 (buf!4746 thiss!1204)) (bvsge (size!4294 (buf!4746 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!182754 d!63425))

(declare-fun d!63427 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!63427 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4294 (buf!4746 (_1!8534 lt!280953)))) ((_ sign_extend 32) (currentByte!8974 (_1!8534 lt!280953))) ((_ sign_extend 32) (currentBit!8969 (_1!8534 lt!280953))) ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4294 (buf!4746 (_1!8534 lt!280953)))) ((_ sign_extend 32) (currentByte!8974 (_1!8534 lt!280953))) ((_ sign_extend 32) (currentBit!8969 (_1!8534 lt!280953)))) ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun bs!15793 () Bool)

(assert (= bs!15793 d!63427))

(declare-fun m!284509 () Bool)

(assert (=> bs!15793 m!284509))

(assert (=> b!182744 d!63427))

(declare-fun d!63429 () Bool)

(declare-fun e!126883 () Bool)

(assert (=> d!63429 e!126883))

(declare-fun res!152022 () Bool)

(assert (=> d!63429 (=> (not res!152022) (not e!126883))))

(declare-fun lt!281137 () (_ BitVec 64))

(declare-fun lt!281133 () (_ BitVec 64))

(declare-fun lt!281135 () (_ BitVec 64))

(assert (=> d!63429 (= res!152022 (= lt!281135 (bvsub lt!281133 lt!281137)))))

(assert (=> d!63429 (or (= (bvand lt!281133 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!281137 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!281133 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!281133 lt!281137) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63429 (= lt!281137 (remainingBits!0 ((_ sign_extend 32) (size!4294 (buf!4746 (_2!8535 lt!280947)))) ((_ sign_extend 32) (currentByte!8974 (_2!8535 lt!280947))) ((_ sign_extend 32) (currentBit!8969 (_2!8535 lt!280947)))))))

(declare-fun lt!281134 () (_ BitVec 64))

(declare-fun lt!281138 () (_ BitVec 64))

(assert (=> d!63429 (= lt!281133 (bvmul lt!281134 lt!281138))))

(assert (=> d!63429 (or (= lt!281134 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!281138 (bvsdiv (bvmul lt!281134 lt!281138) lt!281134)))))

(assert (=> d!63429 (= lt!281138 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63429 (= lt!281134 ((_ sign_extend 32) (size!4294 (buf!4746 (_2!8535 lt!280947)))))))

(assert (=> d!63429 (= lt!281135 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8974 (_2!8535 lt!280947))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8969 (_2!8535 lt!280947)))))))

(assert (=> d!63429 (invariant!0 (currentBit!8969 (_2!8535 lt!280947)) (currentByte!8974 (_2!8535 lt!280947)) (size!4294 (buf!4746 (_2!8535 lt!280947))))))

(assert (=> d!63429 (= (bitIndex!0 (size!4294 (buf!4746 (_2!8535 lt!280947))) (currentByte!8974 (_2!8535 lt!280947)) (currentBit!8969 (_2!8535 lt!280947))) lt!281135)))

(declare-fun b!182894 () Bool)

(declare-fun res!152021 () Bool)

(assert (=> b!182894 (=> (not res!152021) (not e!126883))))

(assert (=> b!182894 (= res!152021 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!281135))))

(declare-fun b!182895 () Bool)

(declare-fun lt!281136 () (_ BitVec 64))

(assert (=> b!182895 (= e!126883 (bvsle lt!281135 (bvmul lt!281136 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!182895 (or (= lt!281136 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!281136 #b0000000000000000000000000000000000000000000000000000000000001000) lt!281136)))))

(assert (=> b!182895 (= lt!281136 ((_ sign_extend 32) (size!4294 (buf!4746 (_2!8535 lt!280947)))))))

(assert (= (and d!63429 res!152022) b!182894))

(assert (= (and b!182894 res!152021) b!182895))

(declare-fun m!284511 () Bool)

(assert (=> d!63429 m!284511))

(assert (=> d!63429 m!284359))

(assert (=> b!182755 d!63429))

(declare-fun d!63431 () Bool)

(declare-fun res!152031 () Bool)

(declare-fun e!126888 () Bool)

(assert (=> d!63431 (=> (not res!152031) (not e!126888))))

(assert (=> d!63431 (= res!152031 (= (size!4294 (buf!4746 thiss!1204)) (size!4294 (buf!4746 (_2!8535 lt!280947)))))))

(assert (=> d!63431 (= (isPrefixOf!0 thiss!1204 (_2!8535 lt!280947)) e!126888)))

(declare-fun b!182902 () Bool)

(declare-fun res!152029 () Bool)

(assert (=> b!182902 (=> (not res!152029) (not e!126888))))

(assert (=> b!182902 (= res!152029 (bvsle (bitIndex!0 (size!4294 (buf!4746 thiss!1204)) (currentByte!8974 thiss!1204) (currentBit!8969 thiss!1204)) (bitIndex!0 (size!4294 (buf!4746 (_2!8535 lt!280947))) (currentByte!8974 (_2!8535 lt!280947)) (currentBit!8969 (_2!8535 lt!280947)))))))

(declare-fun b!182903 () Bool)

(declare-fun e!126889 () Bool)

(assert (=> b!182903 (= e!126888 e!126889)))

(declare-fun res!152030 () Bool)

(assert (=> b!182903 (=> res!152030 e!126889)))

(assert (=> b!182903 (= res!152030 (= (size!4294 (buf!4746 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!182904 () Bool)

(declare-fun arrayBitRangesEq!0 (array!9737 array!9737 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!182904 (= e!126889 (arrayBitRangesEq!0 (buf!4746 thiss!1204) (buf!4746 (_2!8535 lt!280947)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4294 (buf!4746 thiss!1204)) (currentByte!8974 thiss!1204) (currentBit!8969 thiss!1204))))))

(assert (= (and d!63431 res!152031) b!182902))

(assert (= (and b!182902 res!152029) b!182903))

(assert (= (and b!182903 (not res!152030)) b!182904))

(assert (=> b!182902 m!284299))

(assert (=> b!182902 m!284307))

(assert (=> b!182904 m!284299))

(assert (=> b!182904 m!284299))

(declare-fun m!284513 () Bool)

(assert (=> b!182904 m!284513))

(assert (=> b!182755 d!63431))

(declare-fun d!63433 () Bool)

(assert (=> d!63433 (isPrefixOf!0 thiss!1204 (_2!8535 lt!280947))))

(declare-fun lt!281141 () Unit!13124)

(declare-fun choose!30 (BitStream!7696 BitStream!7696 BitStream!7696) Unit!13124)

(assert (=> d!63433 (= lt!281141 (choose!30 thiss!1204 (_2!8535 lt!280945) (_2!8535 lt!280947)))))

(assert (=> d!63433 (isPrefixOf!0 thiss!1204 (_2!8535 lt!280945))))

(assert (=> d!63433 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8535 lt!280945) (_2!8535 lt!280947)) lt!281141)))

(declare-fun bs!15794 () Bool)

(assert (= bs!15794 d!63433))

(assert (=> bs!15794 m!284309))

(declare-fun m!284515 () Bool)

(assert (=> bs!15794 m!284515))

(assert (=> bs!15794 m!284295))

(assert (=> b!182755 d!63433))

(declare-fun b!183058 () Bool)

(declare-fun lt!281628 () tuple2!15776)

(declare-fun lt!281608 () tuple2!15780)

(assert (=> b!183058 (= lt!281628 (readBitPure!0 (readerFrom!0 (_2!8535 lt!281608) (currentBit!8969 (_2!8535 lt!280945)) (currentByte!8974 (_2!8535 lt!280945)))))))

(declare-fun lt!281640 () Bool)

(declare-fun res!152164 () Bool)

(assert (=> b!183058 (= res!152164 (and (= (_2!8533 lt!281628) lt!281640) (= (_1!8533 lt!281628) (_2!8535 lt!281608))))))

(declare-fun e!126976 () Bool)

(assert (=> b!183058 (=> (not res!152164) (not e!126976))))

(declare-fun e!126977 () Bool)

(assert (=> b!183058 (= e!126977 e!126976)))

(declare-fun b!183059 () Bool)

(declare-fun e!126982 () Bool)

(declare-fun lt!281595 () tuple2!15782)

(declare-fun lt!281633 () tuple2!15778)

(assert (=> b!183059 (= e!126982 (= (_1!8536 lt!281595) (_2!8534 lt!281633)))))

(declare-fun b!183060 () Bool)

(declare-fun e!126981 () Bool)

(declare-fun lt!281637 () tuple2!15782)

(declare-fun lt!281631 () tuple2!15778)

(assert (=> b!183060 (= e!126981 (= (_1!8536 lt!281637) (_2!8534 lt!281631)))))

(declare-fun b!183061 () Bool)

(declare-fun res!152165 () Bool)

(assert (=> b!183061 (= res!152165 (= (bitIndex!0 (size!4294 (buf!4746 (_2!8535 lt!281608))) (currentByte!8974 (_2!8535 lt!281608)) (currentBit!8969 (_2!8535 lt!281608))) (bvadd (bitIndex!0 (size!4294 (buf!4746 (_2!8535 lt!280945))) (currentByte!8974 (_2!8535 lt!280945)) (currentBit!8969 (_2!8535 lt!280945))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!183061 (=> (not res!152165) (not e!126977))))

(declare-fun b!183062 () Bool)

(declare-fun e!126980 () tuple2!15780)

(declare-fun lt!281622 () tuple2!15780)

(assert (=> b!183062 (= e!126980 (tuple2!15781 (_1!8535 lt!281622) (_2!8535 lt!281622)))))

(assert (=> b!183062 (= lt!281640 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!183062 (= lt!281608 (appendBit!0 (_2!8535 lt!280945) lt!281640))))

(declare-fun res!152166 () Bool)

(assert (=> b!183062 (= res!152166 (= (size!4294 (buf!4746 (_2!8535 lt!280945))) (size!4294 (buf!4746 (_2!8535 lt!281608)))))))

(assert (=> b!183062 (=> (not res!152166) (not e!126977))))

(assert (=> b!183062 e!126977))

(declare-fun lt!281648 () tuple2!15780)

(assert (=> b!183062 (= lt!281648 lt!281608)))

(assert (=> b!183062 (= lt!281622 (appendBitsLSBFirstLoopTR!0 (_2!8535 lt!281648) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!281629 () Unit!13124)

(assert (=> b!183062 (= lt!281629 (lemmaIsPrefixTransitive!0 (_2!8535 lt!280945) (_2!8535 lt!281648) (_2!8535 lt!281622)))))

(assert (=> b!183062 (isPrefixOf!0 (_2!8535 lt!280945) (_2!8535 lt!281622))))

(declare-fun lt!281617 () Unit!13124)

(assert (=> b!183062 (= lt!281617 lt!281629)))

(assert (=> b!183062 (invariant!0 (currentBit!8969 (_2!8535 lt!280945)) (currentByte!8974 (_2!8535 lt!280945)) (size!4294 (buf!4746 (_2!8535 lt!281648))))))

(declare-fun lt!281599 () BitStream!7696)

(assert (=> b!183062 (= lt!281599 (BitStream!7697 (buf!4746 (_2!8535 lt!281648)) (currentByte!8974 (_2!8535 lt!280945)) (currentBit!8969 (_2!8535 lt!280945))))))

(assert (=> b!183062 (invariant!0 (currentBit!8969 lt!281599) (currentByte!8974 lt!281599) (size!4294 (buf!4746 (_2!8535 lt!281622))))))

(declare-fun lt!281620 () BitStream!7696)

(assert (=> b!183062 (= lt!281620 (BitStream!7697 (buf!4746 (_2!8535 lt!281622)) (currentByte!8974 lt!281599) (currentBit!8969 lt!281599)))))

(declare-fun lt!281605 () tuple2!15776)

(assert (=> b!183062 (= lt!281605 (readBitPure!0 lt!281599))))

(declare-fun lt!281644 () tuple2!15776)

(assert (=> b!183062 (= lt!281644 (readBitPure!0 lt!281620))))

(declare-fun lt!281634 () Unit!13124)

(assert (=> b!183062 (= lt!281634 (readBitPrefixLemma!0 lt!281599 (_2!8535 lt!281622)))))

(declare-fun res!152159 () Bool)

(assert (=> b!183062 (= res!152159 (= (bitIndex!0 (size!4294 (buf!4746 (_1!8533 lt!281605))) (currentByte!8974 (_1!8533 lt!281605)) (currentBit!8969 (_1!8533 lt!281605))) (bitIndex!0 (size!4294 (buf!4746 (_1!8533 lt!281644))) (currentByte!8974 (_1!8533 lt!281644)) (currentBit!8969 (_1!8533 lt!281644)))))))

(declare-fun e!126979 () Bool)

(assert (=> b!183062 (=> (not res!152159) (not e!126979))))

(assert (=> b!183062 e!126979))

(declare-fun lt!281615 () Unit!13124)

(assert (=> b!183062 (= lt!281615 lt!281634)))

(declare-fun lt!281600 () tuple2!15778)

(assert (=> b!183062 (= lt!281600 (reader!0 (_2!8535 lt!280945) (_2!8535 lt!281622)))))

(declare-fun lt!281594 () tuple2!15778)

(assert (=> b!183062 (= lt!281594 (reader!0 (_2!8535 lt!281648) (_2!8535 lt!281622)))))

(declare-fun lt!281643 () tuple2!15776)

(assert (=> b!183062 (= lt!281643 (readBitPure!0 (_1!8534 lt!281600)))))

(assert (=> b!183062 (= (_2!8533 lt!281643) lt!281640)))

(declare-fun lt!281645 () Unit!13124)

(declare-fun Unit!13143 () Unit!13124)

(assert (=> b!183062 (= lt!281645 Unit!13143)))

(declare-fun lt!281593 () (_ BitVec 64))

(assert (=> b!183062 (= lt!281593 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!281596 () (_ BitVec 64))

(assert (=> b!183062 (= lt!281596 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!281627 () Unit!13124)

(assert (=> b!183062 (= lt!281627 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8535 lt!280945) (buf!4746 (_2!8535 lt!281622)) lt!281596))))

(assert (=> b!183062 (validate_offset_bits!1 ((_ sign_extend 32) (size!4294 (buf!4746 (_2!8535 lt!281622)))) ((_ sign_extend 32) (currentByte!8974 (_2!8535 lt!280945))) ((_ sign_extend 32) (currentBit!8969 (_2!8535 lt!280945))) lt!281596)))

(declare-fun lt!281602 () Unit!13124)

(assert (=> b!183062 (= lt!281602 lt!281627)))

(declare-fun lt!281639 () tuple2!15782)

(assert (=> b!183062 (= lt!281639 (readNBitsLSBFirstsLoopPure!0 (_1!8534 lt!281600) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!281593))))

(declare-fun lt!281613 () (_ BitVec 64))

(assert (=> b!183062 (= lt!281613 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!281638 () Unit!13124)

(assert (=> b!183062 (= lt!281638 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8535 lt!281648) (buf!4746 (_2!8535 lt!281622)) lt!281613))))

(assert (=> b!183062 (validate_offset_bits!1 ((_ sign_extend 32) (size!4294 (buf!4746 (_2!8535 lt!281622)))) ((_ sign_extend 32) (currentByte!8974 (_2!8535 lt!281648))) ((_ sign_extend 32) (currentBit!8969 (_2!8535 lt!281648))) lt!281613)))

(declare-fun lt!281626 () Unit!13124)

(assert (=> b!183062 (= lt!281626 lt!281638)))

(declare-fun lt!281621 () tuple2!15782)

(assert (=> b!183062 (= lt!281621 (readNBitsLSBFirstsLoopPure!0 (_1!8534 lt!281594) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!281593 (ite (_2!8533 lt!281643) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!281609 () tuple2!15782)

(assert (=> b!183062 (= lt!281609 (readNBitsLSBFirstsLoopPure!0 (_1!8534 lt!281600) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!281593))))

(declare-fun c!9412 () Bool)

(assert (=> b!183062 (= c!9412 (_2!8533 (readBitPure!0 (_1!8534 lt!281600))))))

(declare-fun e!126978 () (_ BitVec 64))

(declare-fun lt!281610 () tuple2!15782)

(declare-fun withMovedBitIndex!0 (BitStream!7696 (_ BitVec 64)) BitStream!7696)

(assert (=> b!183062 (= lt!281610 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8534 lt!281600) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!281593 e!126978)))))

(declare-fun lt!281614 () Unit!13124)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7696 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13124)

(assert (=> b!183062 (= lt!281614 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8534 lt!281600) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!281593))))

(assert (=> b!183062 (and (= (_2!8536 lt!281609) (_2!8536 lt!281610)) (= (_1!8536 lt!281609) (_1!8536 lt!281610)))))

(declare-fun lt!281641 () Unit!13124)

(assert (=> b!183062 (= lt!281641 lt!281614)))

(assert (=> b!183062 (= (_1!8534 lt!281600) (withMovedBitIndex!0 (_2!8534 lt!281600) (bvsub (bitIndex!0 (size!4294 (buf!4746 (_2!8535 lt!280945))) (currentByte!8974 (_2!8535 lt!280945)) (currentBit!8969 (_2!8535 lt!280945))) (bitIndex!0 (size!4294 (buf!4746 (_2!8535 lt!281622))) (currentByte!8974 (_2!8535 lt!281622)) (currentBit!8969 (_2!8535 lt!281622))))))))

(declare-fun lt!281607 () Unit!13124)

(declare-fun Unit!13144 () Unit!13124)

(assert (=> b!183062 (= lt!281607 Unit!13144)))

(assert (=> b!183062 (= (_1!8534 lt!281594) (withMovedBitIndex!0 (_2!8534 lt!281594) (bvsub (bitIndex!0 (size!4294 (buf!4746 (_2!8535 lt!281648))) (currentByte!8974 (_2!8535 lt!281648)) (currentBit!8969 (_2!8535 lt!281648))) (bitIndex!0 (size!4294 (buf!4746 (_2!8535 lt!281622))) (currentByte!8974 (_2!8535 lt!281622)) (currentBit!8969 (_2!8535 lt!281622))))))))

(declare-fun lt!281642 () Unit!13124)

(declare-fun Unit!13145 () Unit!13124)

(assert (=> b!183062 (= lt!281642 Unit!13145)))

(assert (=> b!183062 (= (bitIndex!0 (size!4294 (buf!4746 (_2!8535 lt!280945))) (currentByte!8974 (_2!8535 lt!280945)) (currentBit!8969 (_2!8535 lt!280945))) (bvsub (bitIndex!0 (size!4294 (buf!4746 (_2!8535 lt!281648))) (currentByte!8974 (_2!8535 lt!281648)) (currentBit!8969 (_2!8535 lt!281648))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!281647 () Unit!13124)

(declare-fun Unit!13146 () Unit!13124)

(assert (=> b!183062 (= lt!281647 Unit!13146)))

(assert (=> b!183062 (= (_2!8536 lt!281639) (_2!8536 lt!281621))))

(declare-fun lt!281635 () Unit!13124)

(declare-fun Unit!13147 () Unit!13124)

(assert (=> b!183062 (= lt!281635 Unit!13147)))

(assert (=> b!183062 (invariant!0 (currentBit!8969 (_2!8535 lt!281622)) (currentByte!8974 (_2!8535 lt!281622)) (size!4294 (buf!4746 (_2!8535 lt!281622))))))

(declare-fun lt!281606 () Unit!13124)

(declare-fun Unit!13148 () Unit!13124)

(assert (=> b!183062 (= lt!281606 Unit!13148)))

(assert (=> b!183062 (= (size!4294 (buf!4746 (_2!8535 lt!280945))) (size!4294 (buf!4746 (_2!8535 lt!281622))))))

(declare-fun lt!281632 () Unit!13124)

(declare-fun Unit!13149 () Unit!13124)

(assert (=> b!183062 (= lt!281632 Unit!13149)))

(assert (=> b!183062 (= (bitIndex!0 (size!4294 (buf!4746 (_2!8535 lt!281622))) (currentByte!8974 (_2!8535 lt!281622)) (currentBit!8969 (_2!8535 lt!281622))) (bvsub (bvadd (bitIndex!0 (size!4294 (buf!4746 (_2!8535 lt!280945))) (currentByte!8974 (_2!8535 lt!280945)) (currentBit!8969 (_2!8535 lt!280945))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!281612 () Unit!13124)

(declare-fun Unit!13150 () Unit!13124)

(assert (=> b!183062 (= lt!281612 Unit!13150)))

(declare-fun lt!281616 () Unit!13124)

(declare-fun Unit!13151 () Unit!13124)

(assert (=> b!183062 (= lt!281616 Unit!13151)))

(assert (=> b!183062 (= lt!281631 (reader!0 (_2!8535 lt!280945) (_2!8535 lt!281622)))))

(declare-fun lt!281611 () (_ BitVec 64))

(assert (=> b!183062 (= lt!281611 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!281623 () Unit!13124)

(assert (=> b!183062 (= lt!281623 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8535 lt!280945) (buf!4746 (_2!8535 lt!281622)) lt!281611))))

(assert (=> b!183062 (validate_offset_bits!1 ((_ sign_extend 32) (size!4294 (buf!4746 (_2!8535 lt!281622)))) ((_ sign_extend 32) (currentByte!8974 (_2!8535 lt!280945))) ((_ sign_extend 32) (currentBit!8969 (_2!8535 lt!280945))) lt!281611)))

(declare-fun lt!281598 () Unit!13124)

(assert (=> b!183062 (= lt!281598 lt!281623)))

(assert (=> b!183062 (= lt!281637 (readNBitsLSBFirstsLoopPure!0 (_1!8534 lt!281631) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!152162 () Bool)

(assert (=> b!183062 (= res!152162 (= (_2!8536 lt!281637) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!183062 (=> (not res!152162) (not e!126981))))

(assert (=> b!183062 e!126981))

(declare-fun lt!281601 () Unit!13124)

(declare-fun Unit!13152 () Unit!13124)

(assert (=> b!183062 (= lt!281601 Unit!13152)))

(declare-fun b!183063 () Bool)

(assert (=> b!183063 (= e!126978 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun d!63435 () Bool)

(declare-fun e!126983 () Bool)

(assert (=> d!63435 e!126983))

(declare-fun res!152158 () Bool)

(assert (=> d!63435 (=> (not res!152158) (not e!126983))))

(declare-fun lt!281624 () tuple2!15780)

(assert (=> d!63435 (= res!152158 (invariant!0 (currentBit!8969 (_2!8535 lt!281624)) (currentByte!8974 (_2!8535 lt!281624)) (size!4294 (buf!4746 (_2!8535 lt!281624)))))))

(assert (=> d!63435 (= lt!281624 e!126980)))

(declare-fun c!9411 () Bool)

(assert (=> d!63435 (= c!9411 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!63435 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!63435 (= (appendBitsLSBFirstLoopTR!0 (_2!8535 lt!280945) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!281624)))

(declare-fun b!183064 () Bool)

(assert (=> b!183064 (= e!126979 (= (_2!8533 lt!281605) (_2!8533 lt!281644)))))

(declare-fun b!183065 () Bool)

(declare-fun res!152161 () Bool)

(assert (=> b!183065 (=> (not res!152161) (not e!126983))))

(assert (=> b!183065 (= res!152161 (isPrefixOf!0 (_2!8535 lt!280945) (_2!8535 lt!281624)))))

(declare-fun b!183066 () Bool)

(assert (=> b!183066 (= e!126978 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!183067 () Bool)

(declare-fun Unit!13153 () Unit!13124)

(assert (=> b!183067 (= e!126980 (tuple2!15781 Unit!13153 (_2!8535 lt!280945)))))

(declare-fun lt!281636 () Unit!13124)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7696) Unit!13124)

(assert (=> b!183067 (= lt!281636 (lemmaIsPrefixRefl!0 (_2!8535 lt!280945)))))

(declare-fun call!2969 () Bool)

(assert (=> b!183067 call!2969))

(declare-fun lt!281603 () Unit!13124)

(assert (=> b!183067 (= lt!281603 lt!281636)))

(declare-fun bm!2966 () Bool)

(assert (=> bm!2966 (= call!2969 (isPrefixOf!0 (_2!8535 lt!280945) (ite c!9411 (_2!8535 lt!280945) (_2!8535 lt!281608))))))

(declare-fun b!183068 () Bool)

(declare-fun e!126984 () Bool)

(declare-fun lt!281630 () (_ BitVec 64))

(assert (=> b!183068 (= e!126984 (validate_offset_bits!1 ((_ sign_extend 32) (size!4294 (buf!4746 (_2!8535 lt!280945)))) ((_ sign_extend 32) (currentByte!8974 (_2!8535 lt!280945))) ((_ sign_extend 32) (currentBit!8969 (_2!8535 lt!280945))) lt!281630))))

(declare-fun b!183069 () Bool)

(declare-fun res!152169 () Bool)

(assert (=> b!183069 (=> (not res!152169) (not e!126983))))

(declare-fun lt!281625 () (_ BitVec 64))

(declare-fun lt!281604 () (_ BitVec 64))

(assert (=> b!183069 (= res!152169 (= (bitIndex!0 (size!4294 (buf!4746 (_2!8535 lt!281624))) (currentByte!8974 (_2!8535 lt!281624)) (currentBit!8969 (_2!8535 lt!281624))) (bvsub lt!281604 lt!281625)))))

(assert (=> b!183069 (or (= (bvand lt!281604 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!281625 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!281604 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!281604 lt!281625) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!183069 (= lt!281625 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!281618 () (_ BitVec 64))

(declare-fun lt!281597 () (_ BitVec 64))

(assert (=> b!183069 (= lt!281604 (bvadd lt!281618 lt!281597))))

(assert (=> b!183069 (or (not (= (bvand lt!281618 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!281597 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!281618 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!281618 lt!281597) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!183069 (= lt!281597 ((_ sign_extend 32) nBits!348))))

(assert (=> b!183069 (= lt!281618 (bitIndex!0 (size!4294 (buf!4746 (_2!8535 lt!280945))) (currentByte!8974 (_2!8535 lt!280945)) (currentBit!8969 (_2!8535 lt!280945))))))

(declare-fun b!183070 () Bool)

(declare-fun res!152160 () Bool)

(assert (=> b!183070 (= res!152160 call!2969)))

(assert (=> b!183070 (=> (not res!152160) (not e!126977))))

(declare-fun b!183071 () Bool)

(assert (=> b!183071 (= e!126983 e!126982)))

(declare-fun res!152167 () Bool)

(assert (=> b!183071 (=> (not res!152167) (not e!126982))))

(assert (=> b!183071 (= res!152167 (= (_2!8536 lt!281595) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!183071 (= lt!281595 (readNBitsLSBFirstsLoopPure!0 (_1!8534 lt!281633) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!281646 () Unit!13124)

(declare-fun lt!281619 () Unit!13124)

(assert (=> b!183071 (= lt!281646 lt!281619)))

(assert (=> b!183071 (validate_offset_bits!1 ((_ sign_extend 32) (size!4294 (buf!4746 (_2!8535 lt!281624)))) ((_ sign_extend 32) (currentByte!8974 (_2!8535 lt!280945))) ((_ sign_extend 32) (currentBit!8969 (_2!8535 lt!280945))) lt!281630)))

(assert (=> b!183071 (= lt!281619 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8535 lt!280945) (buf!4746 (_2!8535 lt!281624)) lt!281630))))

(assert (=> b!183071 e!126984))

(declare-fun res!152163 () Bool)

(assert (=> b!183071 (=> (not res!152163) (not e!126984))))

(assert (=> b!183071 (= res!152163 (and (= (size!4294 (buf!4746 (_2!8535 lt!280945))) (size!4294 (buf!4746 (_2!8535 lt!281624)))) (bvsge lt!281630 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!183071 (= lt!281630 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!183071 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!183071 (= lt!281633 (reader!0 (_2!8535 lt!280945) (_2!8535 lt!281624)))))

(declare-fun b!183072 () Bool)

(declare-fun res!152168 () Bool)

(assert (=> b!183072 (=> (not res!152168) (not e!126983))))

(assert (=> b!183072 (= res!152168 (= (size!4294 (buf!4746 (_2!8535 lt!280945))) (size!4294 (buf!4746 (_2!8535 lt!281624)))))))

(declare-fun b!183073 () Bool)

(assert (=> b!183073 (= e!126976 (= (bitIndex!0 (size!4294 (buf!4746 (_1!8533 lt!281628))) (currentByte!8974 (_1!8533 lt!281628)) (currentBit!8969 (_1!8533 lt!281628))) (bitIndex!0 (size!4294 (buf!4746 (_2!8535 lt!281608))) (currentByte!8974 (_2!8535 lt!281608)) (currentBit!8969 (_2!8535 lt!281608)))))))

(assert (= (and d!63435 c!9411) b!183067))

(assert (= (and d!63435 (not c!9411)) b!183062))

(assert (= (and b!183062 res!152166) b!183061))

(assert (= (and b!183061 res!152165) b!183070))

(assert (= (and b!183070 res!152160) b!183058))

(assert (= (and b!183058 res!152164) b!183073))

(assert (= (and b!183062 res!152159) b!183064))

(assert (= (and b!183062 c!9412) b!183063))

(assert (= (and b!183062 (not c!9412)) b!183066))

(assert (= (and b!183062 res!152162) b!183060))

(assert (= (or b!183067 b!183070) bm!2966))

(assert (= (and d!63435 res!152158) b!183072))

(assert (= (and b!183072 res!152168) b!183069))

(assert (= (and b!183069 res!152169) b!183065))

(assert (= (and b!183065 res!152161) b!183071))

(assert (= (and b!183071 res!152163) b!183068))

(assert (= (and b!183071 res!152167) b!183059))

(declare-fun m!284741 () Bool)

(assert (=> b!183069 m!284741))

(assert (=> b!183069 m!284297))

(declare-fun m!284743 () Bool)

(assert (=> bm!2966 m!284743))

(declare-fun m!284745 () Bool)

(assert (=> b!183071 m!284745))

(declare-fun m!284747 () Bool)

(assert (=> b!183071 m!284747))

(declare-fun m!284749 () Bool)

(assert (=> b!183071 m!284749))

(declare-fun m!284751 () Bool)

(assert (=> b!183071 m!284751))

(declare-fun m!284753 () Bool)

(assert (=> b!183071 m!284753))

(declare-fun m!284755 () Bool)

(assert (=> b!183071 m!284755))

(declare-fun m!284757 () Bool)

(assert (=> b!183067 m!284757))

(declare-fun m!284759 () Bool)

(assert (=> b!183065 m!284759))

(declare-fun m!284761 () Bool)

(assert (=> d!63435 m!284761))

(declare-fun m!284763 () Bool)

(assert (=> b!183058 m!284763))

(assert (=> b!183058 m!284763))

(declare-fun m!284765 () Bool)

(assert (=> b!183058 m!284765))

(declare-fun m!284767 () Bool)

(assert (=> b!183061 m!284767))

(assert (=> b!183061 m!284297))

(declare-fun m!284769 () Bool)

(assert (=> b!183062 m!284769))

(declare-fun m!284771 () Bool)

(assert (=> b!183062 m!284771))

(assert (=> b!183062 m!284297))

(declare-fun m!284773 () Bool)

(assert (=> b!183062 m!284773))

(declare-fun m!284775 () Bool)

(assert (=> b!183062 m!284775))

(declare-fun m!284777 () Bool)

(assert (=> b!183062 m!284777))

(declare-fun m!284779 () Bool)

(assert (=> b!183062 m!284779))

(declare-fun m!284781 () Bool)

(assert (=> b!183062 m!284781))

(declare-fun m!284783 () Bool)

(assert (=> b!183062 m!284783))

(declare-fun m!284785 () Bool)

(assert (=> b!183062 m!284785))

(declare-fun m!284787 () Bool)

(assert (=> b!183062 m!284787))

(declare-fun m!284789 () Bool)

(assert (=> b!183062 m!284789))

(declare-fun m!284791 () Bool)

(assert (=> b!183062 m!284791))

(declare-fun m!284793 () Bool)

(assert (=> b!183062 m!284793))

(declare-fun m!284795 () Bool)

(assert (=> b!183062 m!284795))

(declare-fun m!284797 () Bool)

(assert (=> b!183062 m!284797))

(declare-fun m!284799 () Bool)

(assert (=> b!183062 m!284799))

(declare-fun m!284801 () Bool)

(assert (=> b!183062 m!284801))

(declare-fun m!284803 () Bool)

(assert (=> b!183062 m!284803))

(declare-fun m!284805 () Bool)

(assert (=> b!183062 m!284805))

(assert (=> b!183062 m!284791))

(declare-fun m!284807 () Bool)

(assert (=> b!183062 m!284807))

(assert (=> b!183062 m!284751))

(declare-fun m!284809 () Bool)

(assert (=> b!183062 m!284809))

(declare-fun m!284811 () Bool)

(assert (=> b!183062 m!284811))

(declare-fun m!284813 () Bool)

(assert (=> b!183062 m!284813))

(declare-fun m!284815 () Bool)

(assert (=> b!183062 m!284815))

(assert (=> b!183062 m!284753))

(declare-fun m!284817 () Bool)

(assert (=> b!183062 m!284817))

(declare-fun m!284819 () Bool)

(assert (=> b!183062 m!284819))

(declare-fun m!284821 () Bool)

(assert (=> b!183062 m!284821))

(declare-fun m!284823 () Bool)

(assert (=> b!183062 m!284823))

(declare-fun m!284825 () Bool)

(assert (=> b!183062 m!284825))

(declare-fun m!284827 () Bool)

(assert (=> b!183062 m!284827))

(declare-fun m!284829 () Bool)

(assert (=> b!183062 m!284829))

(declare-fun m!284831 () Bool)

(assert (=> b!183068 m!284831))

(declare-fun m!284833 () Bool)

(assert (=> b!183073 m!284833))

(assert (=> b!183073 m!284767))

(assert (=> b!182755 d!63435))

(declare-fun d!63509 () Bool)

(assert (=> d!63509 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4294 (buf!4746 thiss!1204))) ((_ sign_extend 32) (currentByte!8974 thiss!1204)) ((_ sign_extend 32) (currentBit!8969 thiss!1204)) lt!280952) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4294 (buf!4746 thiss!1204))) ((_ sign_extend 32) (currentByte!8974 thiss!1204)) ((_ sign_extend 32) (currentBit!8969 thiss!1204))) lt!280952))))

(declare-fun bs!15808 () Bool)

(assert (= bs!15808 d!63509))

(declare-fun m!284835 () Bool)

(assert (=> bs!15808 m!284835))

(assert (=> b!182745 d!63509))

(declare-fun d!63511 () Bool)

(declare-fun res!152172 () Bool)

(declare-fun e!126985 () Bool)

(assert (=> d!63511 (=> (not res!152172) (not e!126985))))

(assert (=> d!63511 (= res!152172 (= (size!4294 (buf!4746 thiss!1204)) (size!4294 (buf!4746 (_2!8535 lt!280945)))))))

(assert (=> d!63511 (= (isPrefixOf!0 thiss!1204 (_2!8535 lt!280945)) e!126985)))

(declare-fun b!183074 () Bool)

(declare-fun res!152170 () Bool)

(assert (=> b!183074 (=> (not res!152170) (not e!126985))))

(assert (=> b!183074 (= res!152170 (bvsle (bitIndex!0 (size!4294 (buf!4746 thiss!1204)) (currentByte!8974 thiss!1204) (currentBit!8969 thiss!1204)) (bitIndex!0 (size!4294 (buf!4746 (_2!8535 lt!280945))) (currentByte!8974 (_2!8535 lt!280945)) (currentBit!8969 (_2!8535 lt!280945)))))))

(declare-fun b!183075 () Bool)

(declare-fun e!126986 () Bool)

(assert (=> b!183075 (= e!126985 e!126986)))

(declare-fun res!152171 () Bool)

(assert (=> b!183075 (=> res!152171 e!126986)))

(assert (=> b!183075 (= res!152171 (= (size!4294 (buf!4746 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!183076 () Bool)

(assert (=> b!183076 (= e!126986 (arrayBitRangesEq!0 (buf!4746 thiss!1204) (buf!4746 (_2!8535 lt!280945)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4294 (buf!4746 thiss!1204)) (currentByte!8974 thiss!1204) (currentBit!8969 thiss!1204))))))

(assert (= (and d!63511 res!152172) b!183074))

(assert (= (and b!183074 res!152170) b!183075))

(assert (= (and b!183075 (not res!152171)) b!183076))

(assert (=> b!183074 m!284299))

(assert (=> b!183074 m!284297))

(assert (=> b!183076 m!284299))

(assert (=> b!183076 m!284299))

(declare-fun m!284837 () Bool)

(assert (=> b!183076 m!284837))

(assert (=> b!182756 d!63511))

(declare-fun d!63513 () Bool)

(declare-fun e!126987 () Bool)

(assert (=> d!63513 e!126987))

(declare-fun res!152174 () Bool)

(assert (=> d!63513 (=> (not res!152174) (not e!126987))))

(declare-fun lt!281649 () (_ BitVec 64))

(declare-fun lt!281653 () (_ BitVec 64))

(declare-fun lt!281651 () (_ BitVec 64))

(assert (=> d!63513 (= res!152174 (= lt!281651 (bvsub lt!281649 lt!281653)))))

(assert (=> d!63513 (or (= (bvand lt!281649 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!281653 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!281649 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!281649 lt!281653) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63513 (= lt!281653 (remainingBits!0 ((_ sign_extend 32) (size!4294 (buf!4746 (_1!8533 lt!280943)))) ((_ sign_extend 32) (currentByte!8974 (_1!8533 lt!280943))) ((_ sign_extend 32) (currentBit!8969 (_1!8533 lt!280943)))))))

(declare-fun lt!281650 () (_ BitVec 64))

(declare-fun lt!281654 () (_ BitVec 64))

(assert (=> d!63513 (= lt!281649 (bvmul lt!281650 lt!281654))))

(assert (=> d!63513 (or (= lt!281650 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!281654 (bvsdiv (bvmul lt!281650 lt!281654) lt!281650)))))

(assert (=> d!63513 (= lt!281654 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63513 (= lt!281650 ((_ sign_extend 32) (size!4294 (buf!4746 (_1!8533 lt!280943)))))))

(assert (=> d!63513 (= lt!281651 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8974 (_1!8533 lt!280943))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8969 (_1!8533 lt!280943)))))))

(assert (=> d!63513 (invariant!0 (currentBit!8969 (_1!8533 lt!280943)) (currentByte!8974 (_1!8533 lt!280943)) (size!4294 (buf!4746 (_1!8533 lt!280943))))))

(assert (=> d!63513 (= (bitIndex!0 (size!4294 (buf!4746 (_1!8533 lt!280943))) (currentByte!8974 (_1!8533 lt!280943)) (currentBit!8969 (_1!8533 lt!280943))) lt!281651)))

(declare-fun b!183077 () Bool)

(declare-fun res!152173 () Bool)

(assert (=> b!183077 (=> (not res!152173) (not e!126987))))

(assert (=> b!183077 (= res!152173 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!281651))))

(declare-fun b!183078 () Bool)

(declare-fun lt!281652 () (_ BitVec 64))

(assert (=> b!183078 (= e!126987 (bvsle lt!281651 (bvmul lt!281652 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!183078 (or (= lt!281652 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!281652 #b0000000000000000000000000000000000000000000000000000000000001000) lt!281652)))))

(assert (=> b!183078 (= lt!281652 ((_ sign_extend 32) (size!4294 (buf!4746 (_1!8533 lt!280943)))))))

(assert (= (and d!63513 res!152174) b!183077))

(assert (= (and b!183077 res!152173) b!183078))

(declare-fun m!284839 () Bool)

(assert (=> d!63513 m!284839))

(declare-fun m!284841 () Bool)

(assert (=> d!63513 m!284841))

(assert (=> b!182746 d!63513))

(declare-fun d!63515 () Bool)

(assert (=> d!63515 (= (invariant!0 (currentBit!8969 thiss!1204) (currentByte!8974 thiss!1204) (size!4294 (buf!4746 (_2!8535 lt!280945)))) (and (bvsge (currentBit!8969 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!8969 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!8974 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!8974 thiss!1204) (size!4294 (buf!4746 (_2!8535 lt!280945)))) (and (= (currentBit!8969 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!8974 thiss!1204) (size!4294 (buf!4746 (_2!8535 lt!280945))))))))))

(assert (=> b!182746 d!63515))

(declare-fun d!63517 () Bool)

(assert (=> d!63517 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!182746 d!63517))

(declare-fun b!183101 () Bool)

(declare-fun e!126998 () Unit!13124)

(declare-fun lt!281740 () Unit!13124)

(assert (=> b!183101 (= e!126998 lt!281740)))

(declare-fun lt!281739 () (_ BitVec 64))

(assert (=> b!183101 (= lt!281739 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!281734 () (_ BitVec 64))

(assert (=> b!183101 (= lt!281734 (bitIndex!0 (size!4294 (buf!4746 thiss!1204)) (currentByte!8974 thiss!1204) (currentBit!8969 thiss!1204)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!9737 array!9737 (_ BitVec 64) (_ BitVec 64)) Unit!13124)

(assert (=> b!183101 (= lt!281740 (arrayBitRangesEqSymmetric!0 (buf!4746 thiss!1204) (buf!4746 (_2!8535 lt!280947)) lt!281739 lt!281734))))

(assert (=> b!183101 (arrayBitRangesEq!0 (buf!4746 (_2!8535 lt!280947)) (buf!4746 thiss!1204) lt!281739 lt!281734)))

(declare-fun b!183102 () Bool)

(declare-fun Unit!13154 () Unit!13124)

(assert (=> b!183102 (= e!126998 Unit!13154)))

(declare-fun d!63519 () Bool)

(declare-fun e!126999 () Bool)

(assert (=> d!63519 e!126999))

(declare-fun res!152191 () Bool)

(assert (=> d!63519 (=> (not res!152191) (not e!126999))))

(declare-fun lt!281735 () tuple2!15778)

(assert (=> d!63519 (= res!152191 (isPrefixOf!0 (_1!8534 lt!281735) (_2!8534 lt!281735)))))

(declare-fun lt!281730 () BitStream!7696)

(assert (=> d!63519 (= lt!281735 (tuple2!15779 lt!281730 (_2!8535 lt!280947)))))

(declare-fun lt!281727 () Unit!13124)

(declare-fun lt!281736 () Unit!13124)

(assert (=> d!63519 (= lt!281727 lt!281736)))

(assert (=> d!63519 (isPrefixOf!0 lt!281730 (_2!8535 lt!280947))))

(assert (=> d!63519 (= lt!281736 (lemmaIsPrefixTransitive!0 lt!281730 (_2!8535 lt!280947) (_2!8535 lt!280947)))))

(declare-fun lt!281737 () Unit!13124)

(declare-fun lt!281725 () Unit!13124)

(assert (=> d!63519 (= lt!281737 lt!281725)))

(assert (=> d!63519 (isPrefixOf!0 lt!281730 (_2!8535 lt!280947))))

(assert (=> d!63519 (= lt!281725 (lemmaIsPrefixTransitive!0 lt!281730 thiss!1204 (_2!8535 lt!280947)))))

(declare-fun lt!281729 () Unit!13124)

(assert (=> d!63519 (= lt!281729 e!126998)))

(declare-fun c!9417 () Bool)

(assert (=> d!63519 (= c!9417 (not (= (size!4294 (buf!4746 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!281726 () Unit!13124)

(declare-fun lt!281738 () Unit!13124)

(assert (=> d!63519 (= lt!281726 lt!281738)))

(assert (=> d!63519 (isPrefixOf!0 (_2!8535 lt!280947) (_2!8535 lt!280947))))

(assert (=> d!63519 (= lt!281738 (lemmaIsPrefixRefl!0 (_2!8535 lt!280947)))))

(declare-fun lt!281721 () Unit!13124)

(declare-fun lt!281723 () Unit!13124)

(assert (=> d!63519 (= lt!281721 lt!281723)))

(assert (=> d!63519 (= lt!281723 (lemmaIsPrefixRefl!0 (_2!8535 lt!280947)))))

(declare-fun lt!281728 () Unit!13124)

(declare-fun lt!281722 () Unit!13124)

(assert (=> d!63519 (= lt!281728 lt!281722)))

(assert (=> d!63519 (isPrefixOf!0 lt!281730 lt!281730)))

(assert (=> d!63519 (= lt!281722 (lemmaIsPrefixRefl!0 lt!281730))))

(declare-fun lt!281724 () Unit!13124)

(declare-fun lt!281733 () Unit!13124)

(assert (=> d!63519 (= lt!281724 lt!281733)))

(assert (=> d!63519 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!63519 (= lt!281733 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!63519 (= lt!281730 (BitStream!7697 (buf!4746 (_2!8535 lt!280947)) (currentByte!8974 thiss!1204) (currentBit!8969 thiss!1204)))))

(assert (=> d!63519 (isPrefixOf!0 thiss!1204 (_2!8535 lt!280947))))

(assert (=> d!63519 (= (reader!0 thiss!1204 (_2!8535 lt!280947)) lt!281735)))

(declare-fun lt!281731 () (_ BitVec 64))

(declare-fun b!183103 () Bool)

(declare-fun lt!281732 () (_ BitVec 64))

(assert (=> b!183103 (= e!126999 (= (_1!8534 lt!281735) (withMovedBitIndex!0 (_2!8534 lt!281735) (bvsub lt!281732 lt!281731))))))

(assert (=> b!183103 (or (= (bvand lt!281732 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!281731 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!281732 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!281732 lt!281731) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!183103 (= lt!281731 (bitIndex!0 (size!4294 (buf!4746 (_2!8535 lt!280947))) (currentByte!8974 (_2!8535 lt!280947)) (currentBit!8969 (_2!8535 lt!280947))))))

(assert (=> b!183103 (= lt!281732 (bitIndex!0 (size!4294 (buf!4746 thiss!1204)) (currentByte!8974 thiss!1204) (currentBit!8969 thiss!1204)))))

(declare-fun b!183104 () Bool)

(declare-fun res!152190 () Bool)

(assert (=> b!183104 (=> (not res!152190) (not e!126999))))

(assert (=> b!183104 (= res!152190 (isPrefixOf!0 (_2!8534 lt!281735) (_2!8535 lt!280947)))))

(declare-fun b!183105 () Bool)

(declare-fun res!152189 () Bool)

(assert (=> b!183105 (=> (not res!152189) (not e!126999))))

(assert (=> b!183105 (= res!152189 (isPrefixOf!0 (_1!8534 lt!281735) thiss!1204))))

(assert (= (and d!63519 c!9417) b!183101))

(assert (= (and d!63519 (not c!9417)) b!183102))

(assert (= (and d!63519 res!152191) b!183105))

(assert (= (and b!183105 res!152189) b!183104))

(assert (= (and b!183104 res!152190) b!183103))

(declare-fun m!284843 () Bool)

(assert (=> b!183105 m!284843))

(declare-fun m!284845 () Bool)

(assert (=> d!63519 m!284845))

(declare-fun m!284847 () Bool)

(assert (=> d!63519 m!284847))

(declare-fun m!284849 () Bool)

(assert (=> d!63519 m!284849))

(assert (=> d!63519 m!284309))

(declare-fun m!284851 () Bool)

(assert (=> d!63519 m!284851))

(declare-fun m!284853 () Bool)

(assert (=> d!63519 m!284853))

(declare-fun m!284855 () Bool)

(assert (=> d!63519 m!284855))

(declare-fun m!284857 () Bool)

(assert (=> d!63519 m!284857))

(declare-fun m!284859 () Bool)

(assert (=> d!63519 m!284859))

(declare-fun m!284861 () Bool)

(assert (=> d!63519 m!284861))

(declare-fun m!284863 () Bool)

(assert (=> d!63519 m!284863))

(declare-fun m!284865 () Bool)

(assert (=> b!183103 m!284865))

(assert (=> b!183103 m!284307))

(assert (=> b!183103 m!284299))

(assert (=> b!183101 m!284299))

(declare-fun m!284867 () Bool)

(assert (=> b!183101 m!284867))

(declare-fun m!284869 () Bool)

(assert (=> b!183101 m!284869))

(declare-fun m!284871 () Bool)

(assert (=> b!183104 m!284871))

(assert (=> b!182746 d!63519))

(declare-fun d!63521 () Bool)

(declare-datatypes ((tuple2!15806 0))(
  ( (tuple2!15807 (_1!8548 (_ BitVec 64)) (_2!8548 BitStream!7696)) )
))
(declare-fun lt!281783 () tuple2!15806)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!7696 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!15806)

(assert (=> d!63521 (= lt!281783 (readNBitsLSBFirstsLoop!0 (_1!8534 lt!280935) nBits!348 i!590 lt!280946))))

(assert (=> d!63521 (= (readNBitsLSBFirstsLoopPure!0 (_1!8534 lt!280935) nBits!348 i!590 lt!280946) (tuple2!15783 (_2!8548 lt!281783) (_1!8548 lt!281783)))))

(declare-fun bs!15809 () Bool)

(assert (= bs!15809 d!63521))

(declare-fun m!284873 () Bool)

(assert (=> bs!15809 m!284873))

(assert (=> b!182746 d!63521))

(declare-fun d!63523 () Bool)

(declare-datatypes ((tuple2!15808 0))(
  ( (tuple2!15809 (_1!8549 Bool) (_2!8549 BitStream!7696)) )
))
(declare-fun lt!281814 () tuple2!15808)

(declare-fun readBit!0 (BitStream!7696) tuple2!15808)

(assert (=> d!63523 (= lt!281814 (readBit!0 lt!280939))))

(assert (=> d!63523 (= (readBitPure!0 lt!280939) (tuple2!15777 (_2!8549 lt!281814) (_1!8549 lt!281814)))))

(declare-fun bs!15810 () Bool)

(assert (= bs!15810 d!63523))

(declare-fun m!284875 () Bool)

(assert (=> bs!15810 m!284875))

(assert (=> b!182746 d!63523))

(declare-fun d!63525 () Bool)

(assert (=> d!63525 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4294 (buf!4746 (_2!8535 lt!280947)))) ((_ sign_extend 32) (currentByte!8974 thiss!1204)) ((_ sign_extend 32) (currentBit!8969 thiss!1204)) lt!280952) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4294 (buf!4746 (_2!8535 lt!280947)))) ((_ sign_extend 32) (currentByte!8974 thiss!1204)) ((_ sign_extend 32) (currentBit!8969 thiss!1204))) lt!280952))))

(declare-fun bs!15811 () Bool)

(assert (= bs!15811 d!63525))

(declare-fun m!284877 () Bool)

(assert (=> bs!15811 m!284877))

(assert (=> b!182746 d!63525))

(declare-fun d!63527 () Bool)

(declare-fun e!127014 () Bool)

(assert (=> d!63527 e!127014))

(declare-fun res!152210 () Bool)

(assert (=> d!63527 (=> (not res!152210) (not e!127014))))

(declare-fun lt!281841 () tuple2!15776)

(declare-fun lt!281842 () tuple2!15776)

(assert (=> d!63527 (= res!152210 (= (bitIndex!0 (size!4294 (buf!4746 (_1!8533 lt!281841))) (currentByte!8974 (_1!8533 lt!281841)) (currentBit!8969 (_1!8533 lt!281841))) (bitIndex!0 (size!4294 (buf!4746 (_1!8533 lt!281842))) (currentByte!8974 (_1!8533 lt!281842)) (currentBit!8969 (_1!8533 lt!281842)))))))

(declare-fun lt!281843 () Unit!13124)

(declare-fun lt!281844 () BitStream!7696)

(declare-fun choose!50 (BitStream!7696 BitStream!7696 BitStream!7696 tuple2!15776 tuple2!15776 BitStream!7696 Bool tuple2!15776 tuple2!15776 BitStream!7696 Bool) Unit!13124)

(assert (=> d!63527 (= lt!281843 (choose!50 lt!280939 (_2!8535 lt!280947) lt!281844 lt!281841 (tuple2!15777 (_1!8533 lt!281841) (_2!8533 lt!281841)) (_1!8533 lt!281841) (_2!8533 lt!281841) lt!281842 (tuple2!15777 (_1!8533 lt!281842) (_2!8533 lt!281842)) (_1!8533 lt!281842) (_2!8533 lt!281842)))))

(assert (=> d!63527 (= lt!281842 (readBitPure!0 lt!281844))))

(assert (=> d!63527 (= lt!281841 (readBitPure!0 lt!280939))))

(assert (=> d!63527 (= lt!281844 (BitStream!7697 (buf!4746 (_2!8535 lt!280947)) (currentByte!8974 lt!280939) (currentBit!8969 lt!280939)))))

(assert (=> d!63527 (invariant!0 (currentBit!8969 lt!280939) (currentByte!8974 lt!280939) (size!4294 (buf!4746 (_2!8535 lt!280947))))))

(assert (=> d!63527 (= (readBitPrefixLemma!0 lt!280939 (_2!8535 lt!280947)) lt!281843)))

(declare-fun b!183128 () Bool)

(assert (=> b!183128 (= e!127014 (= (_2!8533 lt!281841) (_2!8533 lt!281842)))))

(assert (= (and d!63527 res!152210) b!183128))

(declare-fun m!284879 () Bool)

(assert (=> d!63527 m!284879))

(declare-fun m!284881 () Bool)

(assert (=> d!63527 m!284881))

(assert (=> d!63527 m!284319))

(declare-fun m!284883 () Bool)

(assert (=> d!63527 m!284883))

(declare-fun m!284885 () Bool)

(assert (=> d!63527 m!284885))

(declare-fun m!284887 () Bool)

(assert (=> d!63527 m!284887))

(assert (=> b!182746 d!63527))

(declare-fun d!63529 () Bool)

(declare-fun e!127015 () Bool)

(assert (=> d!63529 e!127015))

(declare-fun res!152212 () Bool)

(assert (=> d!63529 (=> (not res!152212) (not e!127015))))

(declare-fun lt!281845 () (_ BitVec 64))

(declare-fun lt!281847 () (_ BitVec 64))

(declare-fun lt!281849 () (_ BitVec 64))

(assert (=> d!63529 (= res!152212 (= lt!281847 (bvsub lt!281845 lt!281849)))))

(assert (=> d!63529 (or (= (bvand lt!281845 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!281849 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!281845 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!281845 lt!281849) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63529 (= lt!281849 (remainingBits!0 ((_ sign_extend 32) (size!4294 (buf!4746 (_1!8533 lt!280937)))) ((_ sign_extend 32) (currentByte!8974 (_1!8533 lt!280937))) ((_ sign_extend 32) (currentBit!8969 (_1!8533 lt!280937)))))))

(declare-fun lt!281846 () (_ BitVec 64))

(declare-fun lt!281850 () (_ BitVec 64))

(assert (=> d!63529 (= lt!281845 (bvmul lt!281846 lt!281850))))

(assert (=> d!63529 (or (= lt!281846 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!281850 (bvsdiv (bvmul lt!281846 lt!281850) lt!281846)))))

(assert (=> d!63529 (= lt!281850 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63529 (= lt!281846 ((_ sign_extend 32) (size!4294 (buf!4746 (_1!8533 lt!280937)))))))

(assert (=> d!63529 (= lt!281847 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8974 (_1!8533 lt!280937))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8969 (_1!8533 lt!280937)))))))

(assert (=> d!63529 (invariant!0 (currentBit!8969 (_1!8533 lt!280937)) (currentByte!8974 (_1!8533 lt!280937)) (size!4294 (buf!4746 (_1!8533 lt!280937))))))

(assert (=> d!63529 (= (bitIndex!0 (size!4294 (buf!4746 (_1!8533 lt!280937))) (currentByte!8974 (_1!8533 lt!280937)) (currentBit!8969 (_1!8533 lt!280937))) lt!281847)))

(declare-fun b!183129 () Bool)

(declare-fun res!152211 () Bool)

(assert (=> b!183129 (=> (not res!152211) (not e!127015))))

(assert (=> b!183129 (= res!152211 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!281847))))

(declare-fun b!183130 () Bool)

(declare-fun lt!281848 () (_ BitVec 64))

(assert (=> b!183130 (= e!127015 (bvsle lt!281847 (bvmul lt!281848 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!183130 (or (= lt!281848 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!281848 #b0000000000000000000000000000000000000000000000000000000000001000) lt!281848)))))

(assert (=> b!183130 (= lt!281848 ((_ sign_extend 32) (size!4294 (buf!4746 (_1!8533 lt!280937)))))))

(assert (= (and d!63529 res!152212) b!183129))

(assert (= (and b!183129 res!152211) b!183130))

(declare-fun m!284889 () Bool)

(assert (=> d!63529 m!284889))

(declare-fun m!284891 () Bool)

(assert (=> d!63529 m!284891))

(assert (=> b!182746 d!63529))

(declare-fun d!63531 () Bool)

(assert (=> d!63531 (validate_offset_bits!1 ((_ sign_extend 32) (size!4294 (buf!4746 (_2!8535 lt!280947)))) ((_ sign_extend 32) (currentByte!8974 thiss!1204)) ((_ sign_extend 32) (currentBit!8969 thiss!1204)) lt!280952)))

(declare-fun lt!281853 () Unit!13124)

(declare-fun choose!9 (BitStream!7696 array!9737 (_ BitVec 64) BitStream!7696) Unit!13124)

(assert (=> d!63531 (= lt!281853 (choose!9 thiss!1204 (buf!4746 (_2!8535 lt!280947)) lt!280952 (BitStream!7697 (buf!4746 (_2!8535 lt!280947)) (currentByte!8974 thiss!1204) (currentBit!8969 thiss!1204))))))

(assert (=> d!63531 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4746 (_2!8535 lt!280947)) lt!280952) lt!281853)))

(declare-fun bs!15812 () Bool)

(assert (= bs!15812 d!63531))

(assert (=> bs!15812 m!284337))

(declare-fun m!284893 () Bool)

(assert (=> bs!15812 m!284893))

(assert (=> b!182746 d!63531))

(declare-fun d!63533 () Bool)

(declare-fun lt!281854 () tuple2!15808)

(assert (=> d!63533 (= lt!281854 (readBit!0 (BitStream!7697 (buf!4746 (_2!8535 lt!280947)) (currentByte!8974 thiss!1204) (currentBit!8969 thiss!1204))))))

(assert (=> d!63533 (= (readBitPure!0 (BitStream!7697 (buf!4746 (_2!8535 lt!280947)) (currentByte!8974 thiss!1204) (currentBit!8969 thiss!1204))) (tuple2!15777 (_2!8549 lt!281854) (_1!8549 lt!281854)))))

(declare-fun bs!15813 () Bool)

(assert (= bs!15813 d!63533))

(declare-fun m!284895 () Bool)

(assert (=> bs!15813 m!284895))

(assert (=> b!182746 d!63533))

(declare-fun d!63535 () Bool)

(assert (=> d!63535 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4294 (buf!4746 (_2!8535 lt!280947)))) ((_ sign_extend 32) (currentByte!8974 (_2!8535 lt!280945))) ((_ sign_extend 32) (currentBit!8969 (_2!8535 lt!280945))) lt!280949) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4294 (buf!4746 (_2!8535 lt!280947)))) ((_ sign_extend 32) (currentByte!8974 (_2!8535 lt!280945))) ((_ sign_extend 32) (currentBit!8969 (_2!8535 lt!280945)))) lt!280949))))

(declare-fun bs!15814 () Bool)

(assert (= bs!15814 d!63535))

(declare-fun m!284897 () Bool)

(assert (=> bs!15814 m!284897))

(assert (=> b!182746 d!63535))

(declare-fun b!183131 () Bool)

(declare-fun e!127016 () Unit!13124)

(declare-fun lt!281874 () Unit!13124)

(assert (=> b!183131 (= e!127016 lt!281874)))

(declare-fun lt!281873 () (_ BitVec 64))

(assert (=> b!183131 (= lt!281873 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!281868 () (_ BitVec 64))

(assert (=> b!183131 (= lt!281868 (bitIndex!0 (size!4294 (buf!4746 (_2!8535 lt!280945))) (currentByte!8974 (_2!8535 lt!280945)) (currentBit!8969 (_2!8535 lt!280945))))))

(assert (=> b!183131 (= lt!281874 (arrayBitRangesEqSymmetric!0 (buf!4746 (_2!8535 lt!280945)) (buf!4746 (_2!8535 lt!280947)) lt!281873 lt!281868))))

(assert (=> b!183131 (arrayBitRangesEq!0 (buf!4746 (_2!8535 lt!280947)) (buf!4746 (_2!8535 lt!280945)) lt!281873 lt!281868)))

(declare-fun b!183132 () Bool)

(declare-fun Unit!13156 () Unit!13124)

(assert (=> b!183132 (= e!127016 Unit!13156)))

(declare-fun d!63537 () Bool)

(declare-fun e!127017 () Bool)

(assert (=> d!63537 e!127017))

(declare-fun res!152215 () Bool)

(assert (=> d!63537 (=> (not res!152215) (not e!127017))))

(declare-fun lt!281869 () tuple2!15778)

(assert (=> d!63537 (= res!152215 (isPrefixOf!0 (_1!8534 lt!281869) (_2!8534 lt!281869)))))

(declare-fun lt!281864 () BitStream!7696)

(assert (=> d!63537 (= lt!281869 (tuple2!15779 lt!281864 (_2!8535 lt!280947)))))

(declare-fun lt!281861 () Unit!13124)

(declare-fun lt!281870 () Unit!13124)

(assert (=> d!63537 (= lt!281861 lt!281870)))

(assert (=> d!63537 (isPrefixOf!0 lt!281864 (_2!8535 lt!280947))))

(assert (=> d!63537 (= lt!281870 (lemmaIsPrefixTransitive!0 lt!281864 (_2!8535 lt!280947) (_2!8535 lt!280947)))))

(declare-fun lt!281871 () Unit!13124)

(declare-fun lt!281859 () Unit!13124)

(assert (=> d!63537 (= lt!281871 lt!281859)))

(assert (=> d!63537 (isPrefixOf!0 lt!281864 (_2!8535 lt!280947))))

(assert (=> d!63537 (= lt!281859 (lemmaIsPrefixTransitive!0 lt!281864 (_2!8535 lt!280945) (_2!8535 lt!280947)))))

(declare-fun lt!281863 () Unit!13124)

(assert (=> d!63537 (= lt!281863 e!127016)))

(declare-fun c!9420 () Bool)

(assert (=> d!63537 (= c!9420 (not (= (size!4294 (buf!4746 (_2!8535 lt!280945))) #b00000000000000000000000000000000)))))

(declare-fun lt!281860 () Unit!13124)

(declare-fun lt!281872 () Unit!13124)

(assert (=> d!63537 (= lt!281860 lt!281872)))

(assert (=> d!63537 (isPrefixOf!0 (_2!8535 lt!280947) (_2!8535 lt!280947))))

(assert (=> d!63537 (= lt!281872 (lemmaIsPrefixRefl!0 (_2!8535 lt!280947)))))

(declare-fun lt!281855 () Unit!13124)

(declare-fun lt!281857 () Unit!13124)

(assert (=> d!63537 (= lt!281855 lt!281857)))

(assert (=> d!63537 (= lt!281857 (lemmaIsPrefixRefl!0 (_2!8535 lt!280947)))))

(declare-fun lt!281862 () Unit!13124)

(declare-fun lt!281856 () Unit!13124)

(assert (=> d!63537 (= lt!281862 lt!281856)))

(assert (=> d!63537 (isPrefixOf!0 lt!281864 lt!281864)))

(assert (=> d!63537 (= lt!281856 (lemmaIsPrefixRefl!0 lt!281864))))

(declare-fun lt!281858 () Unit!13124)

(declare-fun lt!281867 () Unit!13124)

(assert (=> d!63537 (= lt!281858 lt!281867)))

(assert (=> d!63537 (isPrefixOf!0 (_2!8535 lt!280945) (_2!8535 lt!280945))))

(assert (=> d!63537 (= lt!281867 (lemmaIsPrefixRefl!0 (_2!8535 lt!280945)))))

(assert (=> d!63537 (= lt!281864 (BitStream!7697 (buf!4746 (_2!8535 lt!280947)) (currentByte!8974 (_2!8535 lt!280945)) (currentBit!8969 (_2!8535 lt!280945))))))

(assert (=> d!63537 (isPrefixOf!0 (_2!8535 lt!280945) (_2!8535 lt!280947))))

(assert (=> d!63537 (= (reader!0 (_2!8535 lt!280945) (_2!8535 lt!280947)) lt!281869)))

(declare-fun lt!281866 () (_ BitVec 64))

(declare-fun lt!281865 () (_ BitVec 64))

(declare-fun b!183133 () Bool)

(assert (=> b!183133 (= e!127017 (= (_1!8534 lt!281869) (withMovedBitIndex!0 (_2!8534 lt!281869) (bvsub lt!281866 lt!281865))))))

(assert (=> b!183133 (or (= (bvand lt!281866 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!281865 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!281866 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!281866 lt!281865) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!183133 (= lt!281865 (bitIndex!0 (size!4294 (buf!4746 (_2!8535 lt!280947))) (currentByte!8974 (_2!8535 lt!280947)) (currentBit!8969 (_2!8535 lt!280947))))))

(assert (=> b!183133 (= lt!281866 (bitIndex!0 (size!4294 (buf!4746 (_2!8535 lt!280945))) (currentByte!8974 (_2!8535 lt!280945)) (currentBit!8969 (_2!8535 lt!280945))))))

(declare-fun b!183134 () Bool)

(declare-fun res!152214 () Bool)

(assert (=> b!183134 (=> (not res!152214) (not e!127017))))

(assert (=> b!183134 (= res!152214 (isPrefixOf!0 (_2!8534 lt!281869) (_2!8535 lt!280947)))))

(declare-fun b!183135 () Bool)

(declare-fun res!152213 () Bool)

(assert (=> b!183135 (=> (not res!152213) (not e!127017))))

(assert (=> b!183135 (= res!152213 (isPrefixOf!0 (_1!8534 lt!281869) (_2!8535 lt!280945)))))

(assert (= (and d!63537 c!9420) b!183131))

(assert (= (and d!63537 (not c!9420)) b!183132))

(assert (= (and d!63537 res!152215) b!183135))

(assert (= (and b!183135 res!152213) b!183134))

(assert (= (and b!183134 res!152214) b!183133))

(declare-fun m!284899 () Bool)

(assert (=> b!183135 m!284899))

(declare-fun m!284901 () Bool)

(assert (=> d!63537 m!284901))

(declare-fun m!284903 () Bool)

(assert (=> d!63537 m!284903))

(declare-fun m!284905 () Bool)

(assert (=> d!63537 m!284905))

(assert (=> d!63537 m!284347))

(assert (=> d!63537 m!284851))

(declare-fun m!284907 () Bool)

(assert (=> d!63537 m!284907))

(declare-fun m!284909 () Bool)

(assert (=> d!63537 m!284909))

(declare-fun m!284911 () Bool)

(assert (=> d!63537 m!284911))

(assert (=> d!63537 m!284859))

(assert (=> d!63537 m!284757))

(declare-fun m!284913 () Bool)

(assert (=> d!63537 m!284913))

(declare-fun m!284915 () Bool)

(assert (=> b!183133 m!284915))

(assert (=> b!183133 m!284307))

(assert (=> b!183133 m!284297))

(assert (=> b!183131 m!284297))

(declare-fun m!284917 () Bool)

(assert (=> b!183131 m!284917))

(declare-fun m!284919 () Bool)

(assert (=> b!183131 m!284919))

(declare-fun m!284921 () Bool)

(assert (=> b!183134 m!284921))

(assert (=> b!182746 d!63537))

(declare-fun d!63539 () Bool)

(declare-fun lt!281875 () tuple2!15808)

(assert (=> d!63539 (= lt!281875 (readBit!0 (_1!8534 lt!280935)))))

(assert (=> d!63539 (= (readBitPure!0 (_1!8534 lt!280935)) (tuple2!15777 (_2!8549 lt!281875) (_1!8549 lt!281875)))))

(declare-fun bs!15815 () Bool)

(assert (= bs!15815 d!63539))

(declare-fun m!284923 () Bool)

(assert (=> bs!15815 m!284923))

(assert (=> b!182746 d!63539))

(declare-fun d!63541 () Bool)

(assert (=> d!63541 (validate_offset_bits!1 ((_ sign_extend 32) (size!4294 (buf!4746 (_2!8535 lt!280947)))) ((_ sign_extend 32) (currentByte!8974 (_2!8535 lt!280945))) ((_ sign_extend 32) (currentBit!8969 (_2!8535 lt!280945))) lt!280949)))

(declare-fun lt!281876 () Unit!13124)

(assert (=> d!63541 (= lt!281876 (choose!9 (_2!8535 lt!280945) (buf!4746 (_2!8535 lt!280947)) lt!280949 (BitStream!7697 (buf!4746 (_2!8535 lt!280947)) (currentByte!8974 (_2!8535 lt!280945)) (currentBit!8969 (_2!8535 lt!280945)))))))

(assert (=> d!63541 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8535 lt!280945) (buf!4746 (_2!8535 lt!280947)) lt!280949) lt!281876)))

(declare-fun bs!15816 () Bool)

(assert (= bs!15816 d!63541))

(assert (=> bs!15816 m!284325))

(declare-fun m!284925 () Bool)

(assert (=> bs!15816 m!284925))

(assert (=> b!182746 d!63541))

(assert (=> b!182757 d!63511))

(declare-fun d!63543 () Bool)

(assert (=> d!63543 (= (invariant!0 (currentBit!8969 thiss!1204) (currentByte!8974 thiss!1204) (size!4294 (buf!4746 (_2!8535 lt!280947)))) (and (bvsge (currentBit!8969 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!8969 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!8974 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!8974 thiss!1204) (size!4294 (buf!4746 (_2!8535 lt!280947)))) (and (= (currentBit!8969 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!8974 thiss!1204) (size!4294 (buf!4746 (_2!8535 lt!280947))))))))))

(assert (=> b!182747 d!63543))

(declare-fun d!63545 () Bool)

(assert (=> d!63545 (= (invariant!0 (currentBit!8969 (_2!8535 lt!280947)) (currentByte!8974 (_2!8535 lt!280947)) (size!4294 (buf!4746 (_2!8535 lt!280947)))) (and (bvsge (currentBit!8969 (_2!8535 lt!280947)) #b00000000000000000000000000000000) (bvslt (currentBit!8969 (_2!8535 lt!280947)) #b00000000000000000000000000001000) (bvsge (currentByte!8974 (_2!8535 lt!280947)) #b00000000000000000000000000000000) (or (bvslt (currentByte!8974 (_2!8535 lt!280947)) (size!4294 (buf!4746 (_2!8535 lt!280947)))) (and (= (currentBit!8969 (_2!8535 lt!280947)) #b00000000000000000000000000000000) (= (currentByte!8974 (_2!8535 lt!280947)) (size!4294 (buf!4746 (_2!8535 lt!280947))))))))))

(assert (=> b!182748 d!63545))

(declare-fun d!63547 () Bool)

(declare-fun lt!281877 () tuple2!15808)

(assert (=> d!63547 (= lt!281877 (readBit!0 (readerFrom!0 (_2!8535 lt!280945) (currentBit!8969 thiss!1204) (currentByte!8974 thiss!1204))))))

(assert (=> d!63547 (= (readBitPure!0 (readerFrom!0 (_2!8535 lt!280945) (currentBit!8969 thiss!1204) (currentByte!8974 thiss!1204))) (tuple2!15777 (_2!8549 lt!281877) (_1!8549 lt!281877)))))

(declare-fun bs!15817 () Bool)

(assert (= bs!15817 d!63547))

(assert (=> bs!15817 m!284303))

(declare-fun m!284927 () Bool)

(assert (=> bs!15817 m!284927))

(assert (=> b!182749 d!63547))

(declare-fun d!63549 () Bool)

(declare-fun e!127029 () Bool)

(assert (=> d!63549 e!127029))

(declare-fun res!152231 () Bool)

(assert (=> d!63549 (=> (not res!152231) (not e!127029))))

(assert (=> d!63549 (= res!152231 (invariant!0 (currentBit!8969 (_2!8535 lt!280945)) (currentByte!8974 (_2!8535 lt!280945)) (size!4294 (buf!4746 (_2!8535 lt!280945)))))))

(assert (=> d!63549 (= (readerFrom!0 (_2!8535 lt!280945) (currentBit!8969 thiss!1204) (currentByte!8974 thiss!1204)) (BitStream!7697 (buf!4746 (_2!8535 lt!280945)) (currentByte!8974 thiss!1204) (currentBit!8969 thiss!1204)))))

(declare-fun b!183154 () Bool)

(assert (=> b!183154 (= e!127029 (invariant!0 (currentBit!8969 thiss!1204) (currentByte!8974 thiss!1204) (size!4294 (buf!4746 (_2!8535 lt!280945)))))))

(assert (= (and d!63549 res!152231) b!183154))

(declare-fun m!284929 () Bool)

(assert (=> d!63549 m!284929))

(assert (=> b!183154 m!284321))

(assert (=> b!182749 d!63549))

(declare-fun d!63551 () Bool)

(declare-fun e!127030 () Bool)

(assert (=> d!63551 e!127030))

(declare-fun res!152233 () Bool)

(assert (=> d!63551 (=> (not res!152233) (not e!127030))))

(declare-fun lt!281934 () (_ BitVec 64))

(declare-fun lt!281936 () (_ BitVec 64))

(declare-fun lt!281938 () (_ BitVec 64))

(assert (=> d!63551 (= res!152233 (= lt!281936 (bvsub lt!281934 lt!281938)))))

(assert (=> d!63551 (or (= (bvand lt!281934 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!281938 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!281934 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!281934 lt!281938) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63551 (= lt!281938 (remainingBits!0 ((_ sign_extend 32) (size!4294 (buf!4746 (_1!8533 lt!280951)))) ((_ sign_extend 32) (currentByte!8974 (_1!8533 lt!280951))) ((_ sign_extend 32) (currentBit!8969 (_1!8533 lt!280951)))))))

(declare-fun lt!281935 () (_ BitVec 64))

(declare-fun lt!281939 () (_ BitVec 64))

(assert (=> d!63551 (= lt!281934 (bvmul lt!281935 lt!281939))))

(assert (=> d!63551 (or (= lt!281935 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!281939 (bvsdiv (bvmul lt!281935 lt!281939) lt!281935)))))

(assert (=> d!63551 (= lt!281939 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63551 (= lt!281935 ((_ sign_extend 32) (size!4294 (buf!4746 (_1!8533 lt!280951)))))))

(assert (=> d!63551 (= lt!281936 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8974 (_1!8533 lt!280951))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8969 (_1!8533 lt!280951)))))))

(assert (=> d!63551 (invariant!0 (currentBit!8969 (_1!8533 lt!280951)) (currentByte!8974 (_1!8533 lt!280951)) (size!4294 (buf!4746 (_1!8533 lt!280951))))))

(assert (=> d!63551 (= (bitIndex!0 (size!4294 (buf!4746 (_1!8533 lt!280951))) (currentByte!8974 (_1!8533 lt!280951)) (currentBit!8969 (_1!8533 lt!280951))) lt!281936)))

(declare-fun b!183155 () Bool)

(declare-fun res!152232 () Bool)

(assert (=> b!183155 (=> (not res!152232) (not e!127030))))

(assert (=> b!183155 (= res!152232 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!281936))))

(declare-fun b!183156 () Bool)

(declare-fun lt!281937 () (_ BitVec 64))

(assert (=> b!183156 (= e!127030 (bvsle lt!281936 (bvmul lt!281937 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!183156 (or (= lt!281937 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!281937 #b0000000000000000000000000000000000000000000000000000000000001000) lt!281937)))))

(assert (=> b!183156 (= lt!281937 ((_ sign_extend 32) (size!4294 (buf!4746 (_1!8533 lt!280951)))))))

(assert (= (and d!63551 res!152233) b!183155))

(assert (= (and b!183155 res!152232) b!183156))

(declare-fun m!284931 () Bool)

(assert (=> d!63551 m!284931))

(declare-fun m!284933 () Bool)

(assert (=> d!63551 m!284933))

(assert (=> b!182760 d!63551))

(declare-fun d!63553 () Bool)

(declare-fun e!127031 () Bool)

(assert (=> d!63553 e!127031))

(declare-fun res!152235 () Bool)

(assert (=> d!63553 (=> (not res!152235) (not e!127031))))

(declare-fun lt!281942 () (_ BitVec 64))

(declare-fun lt!281944 () (_ BitVec 64))

(declare-fun lt!281940 () (_ BitVec 64))

(assert (=> d!63553 (= res!152235 (= lt!281942 (bvsub lt!281940 lt!281944)))))

(assert (=> d!63553 (or (= (bvand lt!281940 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!281944 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!281940 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!281940 lt!281944) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63553 (= lt!281944 (remainingBits!0 ((_ sign_extend 32) (size!4294 (buf!4746 (_2!8535 lt!280945)))) ((_ sign_extend 32) (currentByte!8974 (_2!8535 lt!280945))) ((_ sign_extend 32) (currentBit!8969 (_2!8535 lt!280945)))))))

(declare-fun lt!281941 () (_ BitVec 64))

(declare-fun lt!281945 () (_ BitVec 64))

(assert (=> d!63553 (= lt!281940 (bvmul lt!281941 lt!281945))))

(assert (=> d!63553 (or (= lt!281941 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!281945 (bvsdiv (bvmul lt!281941 lt!281945) lt!281941)))))

(assert (=> d!63553 (= lt!281945 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63553 (= lt!281941 ((_ sign_extend 32) (size!4294 (buf!4746 (_2!8535 lt!280945)))))))

(assert (=> d!63553 (= lt!281942 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8974 (_2!8535 lt!280945))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8969 (_2!8535 lt!280945)))))))

(assert (=> d!63553 (invariant!0 (currentBit!8969 (_2!8535 lt!280945)) (currentByte!8974 (_2!8535 lt!280945)) (size!4294 (buf!4746 (_2!8535 lt!280945))))))

(assert (=> d!63553 (= (bitIndex!0 (size!4294 (buf!4746 (_2!8535 lt!280945))) (currentByte!8974 (_2!8535 lt!280945)) (currentBit!8969 (_2!8535 lt!280945))) lt!281942)))

(declare-fun b!183157 () Bool)

(declare-fun res!152234 () Bool)

(assert (=> b!183157 (=> (not res!152234) (not e!127031))))

(assert (=> b!183157 (= res!152234 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!281942))))

(declare-fun b!183158 () Bool)

(declare-fun lt!281943 () (_ BitVec 64))

(assert (=> b!183158 (= e!127031 (bvsle lt!281942 (bvmul lt!281943 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!183158 (or (= lt!281943 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!281943 #b0000000000000000000000000000000000000000000000000000000000001000) lt!281943)))))

(assert (=> b!183158 (= lt!281943 ((_ sign_extend 32) (size!4294 (buf!4746 (_2!8535 lt!280945)))))))

(assert (= (and d!63553 res!152235) b!183157))

(assert (= (and b!183157 res!152234) b!183158))

(declare-fun m!284935 () Bool)

(assert (=> d!63553 m!284935))

(assert (=> d!63553 m!284929))

(assert (=> b!182750 d!63553))

(declare-fun d!63555 () Bool)

(declare-fun e!127032 () Bool)

(assert (=> d!63555 e!127032))

(declare-fun res!152237 () Bool)

(assert (=> d!63555 (=> (not res!152237) (not e!127032))))

(declare-fun lt!281946 () (_ BitVec 64))

(declare-fun lt!281950 () (_ BitVec 64))

(declare-fun lt!281948 () (_ BitVec 64))

(assert (=> d!63555 (= res!152237 (= lt!281948 (bvsub lt!281946 lt!281950)))))

(assert (=> d!63555 (or (= (bvand lt!281946 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!281950 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!281946 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!281946 lt!281950) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63555 (= lt!281950 (remainingBits!0 ((_ sign_extend 32) (size!4294 (buf!4746 thiss!1204))) ((_ sign_extend 32) (currentByte!8974 thiss!1204)) ((_ sign_extend 32) (currentBit!8969 thiss!1204))))))

(declare-fun lt!281947 () (_ BitVec 64))

(declare-fun lt!281951 () (_ BitVec 64))

(assert (=> d!63555 (= lt!281946 (bvmul lt!281947 lt!281951))))

(assert (=> d!63555 (or (= lt!281947 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!281951 (bvsdiv (bvmul lt!281947 lt!281951) lt!281947)))))

(assert (=> d!63555 (= lt!281951 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63555 (= lt!281947 ((_ sign_extend 32) (size!4294 (buf!4746 thiss!1204))))))

(assert (=> d!63555 (= lt!281948 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8974 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8969 thiss!1204))))))

(assert (=> d!63555 (invariant!0 (currentBit!8969 thiss!1204) (currentByte!8974 thiss!1204) (size!4294 (buf!4746 thiss!1204)))))

(assert (=> d!63555 (= (bitIndex!0 (size!4294 (buf!4746 thiss!1204)) (currentByte!8974 thiss!1204) (currentBit!8969 thiss!1204)) lt!281948)))

(declare-fun b!183159 () Bool)

(declare-fun res!152236 () Bool)

(assert (=> b!183159 (=> (not res!152236) (not e!127032))))

(assert (=> b!183159 (= res!152236 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!281948))))

(declare-fun b!183160 () Bool)

(declare-fun lt!281949 () (_ BitVec 64))

(assert (=> b!183160 (= e!127032 (bvsle lt!281948 (bvmul lt!281949 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!183160 (or (= lt!281949 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!281949 #b0000000000000000000000000000000000000000000000000000000000001000) lt!281949)))))

(assert (=> b!183160 (= lt!281949 ((_ sign_extend 32) (size!4294 (buf!4746 thiss!1204))))))

(assert (= (and d!63555 res!152237) b!183159))

(assert (= (and b!183159 res!152236) b!183160))

(assert (=> d!63555 m!284835))

(assert (=> d!63555 m!284361))

(assert (=> b!182750 d!63555))

(declare-fun d!63557 () Bool)

(assert (=> d!63557 (= (invariant!0 (currentBit!8969 thiss!1204) (currentByte!8974 thiss!1204) (size!4294 (buf!4746 thiss!1204))) (and (bvsge (currentBit!8969 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!8969 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!8974 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!8974 thiss!1204) (size!4294 (buf!4746 thiss!1204))) (and (= (currentBit!8969 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!8974 thiss!1204) (size!4294 (buf!4746 thiss!1204)))))))))

(assert (=> b!182751 d!63557))

(assert (=> b!182752 d!63553))

(assert (=> b!182752 d!63555))

(declare-fun b!183190 () Bool)

(declare-fun e!127049 () Bool)

(declare-fun lt!281999 () tuple2!15776)

(declare-fun lt!282000 () tuple2!15780)

(assert (=> b!183190 (= e!127049 (= (bitIndex!0 (size!4294 (buf!4746 (_1!8533 lt!281999))) (currentByte!8974 (_1!8533 lt!281999)) (currentBit!8969 (_1!8533 lt!281999))) (bitIndex!0 (size!4294 (buf!4746 (_2!8535 lt!282000))) (currentByte!8974 (_2!8535 lt!282000)) (currentBit!8969 (_2!8535 lt!282000)))))))

(declare-fun d!63559 () Bool)

(declare-fun e!127048 () Bool)

(assert (=> d!63559 e!127048))

(declare-fun res!152263 () Bool)

(assert (=> d!63559 (=> (not res!152263) (not e!127048))))

(assert (=> d!63559 (= res!152263 (= (size!4294 (buf!4746 thiss!1204)) (size!4294 (buf!4746 (_2!8535 lt!282000)))))))

(declare-fun choose!16 (BitStream!7696 Bool) tuple2!15780)

(assert (=> d!63559 (= lt!282000 (choose!16 thiss!1204 lt!280941))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!63559 (validate_offset_bit!0 ((_ sign_extend 32) (size!4294 (buf!4746 thiss!1204))) ((_ sign_extend 32) (currentByte!8974 thiss!1204)) ((_ sign_extend 32) (currentBit!8969 thiss!1204)))))

(assert (=> d!63559 (= (appendBit!0 thiss!1204 lt!280941) lt!282000)))

(declare-fun b!183187 () Bool)

(declare-fun res!152264 () Bool)

(assert (=> b!183187 (=> (not res!152264) (not e!127048))))

(declare-fun lt!281998 () (_ BitVec 64))

(declare-fun lt!281997 () (_ BitVec 64))

(assert (=> b!183187 (= res!152264 (= (bitIndex!0 (size!4294 (buf!4746 (_2!8535 lt!282000))) (currentByte!8974 (_2!8535 lt!282000)) (currentBit!8969 (_2!8535 lt!282000))) (bvadd lt!281998 lt!281997)))))

(assert (=> b!183187 (or (not (= (bvand lt!281998 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!281997 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!281998 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!281998 lt!281997) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!183187 (= lt!281997 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!183187 (= lt!281998 (bitIndex!0 (size!4294 (buf!4746 thiss!1204)) (currentByte!8974 thiss!1204) (currentBit!8969 thiss!1204)))))

(declare-fun b!183189 () Bool)

(assert (=> b!183189 (= e!127048 e!127049)))

(declare-fun res!152266 () Bool)

(assert (=> b!183189 (=> (not res!152266) (not e!127049))))

(assert (=> b!183189 (= res!152266 (and (= (_2!8533 lt!281999) lt!280941) (= (_1!8533 lt!281999) (_2!8535 lt!282000))))))

(assert (=> b!183189 (= lt!281999 (readBitPure!0 (readerFrom!0 (_2!8535 lt!282000) (currentBit!8969 thiss!1204) (currentByte!8974 thiss!1204))))))

(declare-fun b!183188 () Bool)

(declare-fun res!152265 () Bool)

(assert (=> b!183188 (=> (not res!152265) (not e!127048))))

(assert (=> b!183188 (= res!152265 (isPrefixOf!0 thiss!1204 (_2!8535 lt!282000)))))

(assert (= (and d!63559 res!152263) b!183187))

(assert (= (and b!183187 res!152264) b!183188))

(assert (= (and b!183188 res!152265) b!183189))

(assert (= (and b!183189 res!152266) b!183190))

(declare-fun m!285061 () Bool)

(assert (=> b!183189 m!285061))

(assert (=> b!183189 m!285061))

(declare-fun m!285063 () Bool)

(assert (=> b!183189 m!285063))

(declare-fun m!285065 () Bool)

(assert (=> d!63559 m!285065))

(declare-fun m!285067 () Bool)

(assert (=> d!63559 m!285067))

(declare-fun m!285069 () Bool)

(assert (=> b!183187 m!285069))

(assert (=> b!183187 m!284299))

(declare-fun m!285071 () Bool)

(assert (=> b!183190 m!285071))

(assert (=> b!183190 m!285069))

(declare-fun m!285073 () Bool)

(assert (=> b!183188 m!285073))

(assert (=> b!182752 d!63559))

(declare-fun d!63585 () Bool)

(declare-fun res!152269 () Bool)

(declare-fun e!127050 () Bool)

(assert (=> d!63585 (=> (not res!152269) (not e!127050))))

(assert (=> d!63585 (= res!152269 (= (size!4294 (buf!4746 (_2!8535 lt!280945))) (size!4294 (buf!4746 (_2!8535 lt!280947)))))))

(assert (=> d!63585 (= (isPrefixOf!0 (_2!8535 lt!280945) (_2!8535 lt!280947)) e!127050)))

(declare-fun b!183191 () Bool)

(declare-fun res!152267 () Bool)

(assert (=> b!183191 (=> (not res!152267) (not e!127050))))

(assert (=> b!183191 (= res!152267 (bvsle (bitIndex!0 (size!4294 (buf!4746 (_2!8535 lt!280945))) (currentByte!8974 (_2!8535 lt!280945)) (currentBit!8969 (_2!8535 lt!280945))) (bitIndex!0 (size!4294 (buf!4746 (_2!8535 lt!280947))) (currentByte!8974 (_2!8535 lt!280947)) (currentBit!8969 (_2!8535 lt!280947)))))))

(declare-fun b!183192 () Bool)

(declare-fun e!127051 () Bool)

(assert (=> b!183192 (= e!127050 e!127051)))

(declare-fun res!152268 () Bool)

(assert (=> b!183192 (=> res!152268 e!127051)))

(assert (=> b!183192 (= res!152268 (= (size!4294 (buf!4746 (_2!8535 lt!280945))) #b00000000000000000000000000000000))))

(declare-fun b!183193 () Bool)

(assert (=> b!183193 (= e!127051 (arrayBitRangesEq!0 (buf!4746 (_2!8535 lt!280945)) (buf!4746 (_2!8535 lt!280947)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4294 (buf!4746 (_2!8535 lt!280945))) (currentByte!8974 (_2!8535 lt!280945)) (currentBit!8969 (_2!8535 lt!280945)))))))

(assert (= (and d!63585 res!152269) b!183191))

(assert (= (and b!183191 res!152267) b!183192))

(assert (= (and b!183192 (not res!152268)) b!183193))

(assert (=> b!183191 m!284297))

(assert (=> b!183191 m!284307))

(assert (=> b!183193 m!284297))

(assert (=> b!183193 m!284297))

(declare-fun m!285075 () Bool)

(assert (=> b!183193 m!285075))

(assert (=> b!182753 d!63585))

(push 1)

(assert (not b!183103))

(assert (not d!63427))

(assert (not b!183188))

(assert (not d!63521))

(assert (not b!183133))

(assert (not b!183101))

(assert (not d!63539))

(assert (not d!63519))

(assert (not b!183071))

(assert (not d!63535))

(assert (not b!183104))

(assert (not d!63529))

(assert (not b!183062))

(assert (not b!183131))

(assert (not bm!2966))

(assert (not d!63435))

(assert (not b!183189))

(assert (not d!63537))

(assert (not d!63553))

(assert (not b!183076))

(assert (not b!183074))

(assert (not b!183105))

(assert (not b!183134))

(assert (not d!63531))

(assert (not d!63527))

(assert (not d!63429))

(assert (not d!63551))

(assert (not b!183135))

(assert (not b!183191))

(assert (not d!63555))

(assert (not d!63513))

(assert (not d!63549))

(assert (not b!183067))

(assert (not b!183187))

(assert (not b!183068))

(assert (not b!182904))

(assert (not b!182902))

(assert (not d!63523))

(assert (not d!63547))

(assert (not b!183154))

(assert (not d!63509))

(assert (not b!183058))

(assert (not b!183073))

(assert (not b!183065))

(assert (not d!63423))

(assert (not d!63541))

(assert (not b!183193))

(assert (not b!183061))

(assert (not b!183069))

(assert (not d!63433))

(assert (not d!63533))

(assert (not d!63559))

(assert (not d!63525))

(assert (not b!183190))

(check-sat)

(pop 1)

(push 1)

(check-sat)

