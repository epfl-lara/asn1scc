; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52470 () Bool)

(assert start!52470)

(declare-fun b!241887 () Bool)

(declare-fun e!167683 () Bool)

(declare-fun e!167682 () Bool)

(assert (=> b!241887 (= e!167683 e!167682)))

(declare-fun res!201949 () Bool)

(assert (=> b!241887 (=> (not res!201949) (not e!167682))))

(declare-fun bit!26 () Bool)

(declare-datatypes ((array!13281 0))(
  ( (array!13282 (arr!6807 (Array (_ BitVec 32) (_ BitVec 8))) (size!5820 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10562 0))(
  ( (BitStream!10563 (buf!6286 array!13281) (currentByte!11649 (_ BitVec 32)) (currentBit!11644 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!20670 0))(
  ( (tuple2!20671 (_1!11257 BitStream!10562) (_2!11257 Bool)) )
))
(declare-fun lt!377327 () tuple2!20670)

(declare-datatypes ((Unit!17723 0))(
  ( (Unit!17724) )
))
(declare-datatypes ((tuple2!20672 0))(
  ( (tuple2!20673 (_1!11258 Unit!17723) (_2!11258 BitStream!10562)) )
))
(declare-fun lt!377321 () tuple2!20672)

(assert (=> b!241887 (= res!201949 (and (= (_2!11257 lt!377327) bit!26) (= (_1!11257 lt!377327) (_2!11258 lt!377321))))))

(declare-fun thiss!1005 () BitStream!10562)

(declare-fun readBitPure!0 (BitStream!10562) tuple2!20670)

(declare-fun readerFrom!0 (BitStream!10562 (_ BitVec 32) (_ BitVec 32)) BitStream!10562)

(assert (=> b!241887 (= lt!377327 (readBitPure!0 (readerFrom!0 (_2!11258 lt!377321) (currentBit!11644 thiss!1005) (currentByte!11649 thiss!1005))))))

(declare-fun b!241888 () Bool)

(declare-fun res!201951 () Bool)

(declare-fun e!167684 () Bool)

(assert (=> b!241888 (=> (not res!201951) (not e!167684))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(assert (=> b!241888 (= res!201951 (bvslt from!289 nBits!297))))

(declare-fun res!201955 () Bool)

(assert (=> start!52470 (=> (not res!201955) (not e!167684))))

(assert (=> start!52470 (= res!201955 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52470 e!167684))

(assert (=> start!52470 true))

(declare-fun e!167689 () Bool)

(declare-fun inv!12 (BitStream!10562) Bool)

(assert (=> start!52470 (and (inv!12 thiss!1005) e!167689)))

(declare-fun b!241889 () Bool)

(declare-fun lt!377326 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!241889 (= e!167682 (= (bitIndex!0 (size!5820 (buf!6286 (_1!11257 lt!377327))) (currentByte!11649 (_1!11257 lt!377327)) (currentBit!11644 (_1!11257 lt!377327))) lt!377326))))

(declare-fun b!241890 () Bool)

(declare-fun e!167690 () Bool)

(assert (=> b!241890 (= e!167690 e!167683)))

(declare-fun res!201952 () Bool)

(assert (=> b!241890 (=> (not res!201952) (not e!167683))))

(declare-fun lt!377330 () (_ BitVec 64))

(assert (=> b!241890 (= res!201952 (= lt!377326 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!377330)))))

(assert (=> b!241890 (= lt!377326 (bitIndex!0 (size!5820 (buf!6286 (_2!11258 lt!377321))) (currentByte!11649 (_2!11258 lt!377321)) (currentBit!11644 (_2!11258 lt!377321))))))

(assert (=> b!241890 (= lt!377330 (bitIndex!0 (size!5820 (buf!6286 thiss!1005)) (currentByte!11649 thiss!1005) (currentBit!11644 thiss!1005)))))

(declare-fun b!241891 () Bool)

(declare-fun e!167687 () Bool)

(declare-fun e!167685 () Bool)

(assert (=> b!241891 (= e!167687 e!167685)))

(declare-fun res!201957 () Bool)

(assert (=> b!241891 (=> (not res!201957) (not e!167685))))

(declare-fun lt!377329 () (_ BitVec 64))

(declare-fun lt!377322 () tuple2!20672)

(assert (=> b!241891 (= res!201957 (= (bitIndex!0 (size!5820 (buf!6286 (_2!11258 lt!377322))) (currentByte!11649 (_2!11258 lt!377322)) (currentBit!11644 (_2!11258 lt!377322))) (bvadd (bitIndex!0 (size!5820 (buf!6286 (_2!11258 lt!377321))) (currentByte!11649 (_2!11258 lt!377321)) (currentBit!11644 (_2!11258 lt!377321))) lt!377329)))))

(assert (=> b!241891 (= lt!377329 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!241892 () Bool)

(declare-fun e!167686 () Bool)

(assert (=> b!241892 (= e!167684 (not e!167686))))

(declare-fun res!201954 () Bool)

(assert (=> b!241892 (=> res!201954 e!167686)))

(declare-fun isPrefixOf!0 (BitStream!10562 BitStream!10562) Bool)

(assert (=> b!241892 (= res!201954 (not (isPrefixOf!0 thiss!1005 (_2!11258 lt!377321))))))

(assert (=> b!241892 e!167687))

(declare-fun res!201948 () Bool)

(assert (=> b!241892 (=> (not res!201948) (not e!167687))))

(assert (=> b!241892 (= res!201948 (= (size!5820 (buf!6286 (_2!11258 lt!377321))) (size!5820 (buf!6286 (_2!11258 lt!377322)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10562 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20672)

(assert (=> b!241892 (= lt!377322 (appendNBitsLoop!0 (_2!11258 lt!377321) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!241892 (validate_offset_bits!1 ((_ sign_extend 32) (size!5820 (buf!6286 (_2!11258 lt!377321)))) ((_ sign_extend 32) (currentByte!11649 (_2!11258 lt!377321))) ((_ sign_extend 32) (currentBit!11644 (_2!11258 lt!377321))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!377325 () Unit!17723)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10562 BitStream!10562 (_ BitVec 64) (_ BitVec 64)) Unit!17723)

(assert (=> b!241892 (= lt!377325 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11258 lt!377321) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!241892 e!167690))

(declare-fun res!201953 () Bool)

(assert (=> b!241892 (=> (not res!201953) (not e!167690))))

(assert (=> b!241892 (= res!201953 (= (size!5820 (buf!6286 thiss!1005)) (size!5820 (buf!6286 (_2!11258 lt!377321)))))))

(declare-fun appendBit!0 (BitStream!10562 Bool) tuple2!20672)

(assert (=> b!241892 (= lt!377321 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!241893 () Bool)

(declare-fun lt!377331 () tuple2!20670)

(declare-datatypes ((tuple2!20674 0))(
  ( (tuple2!20675 (_1!11259 BitStream!10562) (_2!11259 BitStream!10562)) )
))
(declare-fun lt!377324 () tuple2!20674)

(assert (=> b!241893 (= e!167685 (not (or (not (_2!11257 lt!377331)) (not (= (_1!11257 lt!377331) (_2!11259 lt!377324))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10562 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20670)

(assert (=> b!241893 (= lt!377331 (checkBitsLoopPure!0 (_1!11259 lt!377324) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!241893 (validate_offset_bits!1 ((_ sign_extend 32) (size!5820 (buf!6286 (_2!11258 lt!377322)))) ((_ sign_extend 32) (currentByte!11649 (_2!11258 lt!377321))) ((_ sign_extend 32) (currentBit!11644 (_2!11258 lt!377321))) lt!377329)))

(declare-fun lt!377328 () Unit!17723)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10562 array!13281 (_ BitVec 64)) Unit!17723)

(assert (=> b!241893 (= lt!377328 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11258 lt!377321) (buf!6286 (_2!11258 lt!377322)) lt!377329))))

(declare-fun reader!0 (BitStream!10562 BitStream!10562) tuple2!20674)

(assert (=> b!241893 (= lt!377324 (reader!0 (_2!11258 lt!377321) (_2!11258 lt!377322)))))

(declare-fun b!241894 () Bool)

(declare-fun res!201956 () Bool)

(assert (=> b!241894 (=> (not res!201956) (not e!167685))))

(assert (=> b!241894 (= res!201956 (isPrefixOf!0 (_2!11258 lt!377321) (_2!11258 lt!377322)))))

(declare-fun b!241895 () Bool)

(declare-fun res!201947 () Bool)

(assert (=> b!241895 (=> (not res!201947) (not e!167684))))

(assert (=> b!241895 (= res!201947 (validate_offset_bits!1 ((_ sign_extend 32) (size!5820 (buf!6286 thiss!1005))) ((_ sign_extend 32) (currentByte!11649 thiss!1005)) ((_ sign_extend 32) (currentBit!11644 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!241896 () Bool)

(declare-fun array_inv!5561 (array!13281) Bool)

(assert (=> b!241896 (= e!167689 (array_inv!5561 (buf!6286 thiss!1005)))))

(declare-fun b!241897 () Bool)

(declare-fun res!201950 () Bool)

(assert (=> b!241897 (=> (not res!201950) (not e!167683))))

(assert (=> b!241897 (= res!201950 (isPrefixOf!0 thiss!1005 (_2!11258 lt!377321)))))

(declare-fun b!241898 () Bool)

(assert (=> b!241898 (= e!167686 true)))

(declare-fun lt!377323 () Bool)

(assert (=> b!241898 (= lt!377323 (isPrefixOf!0 (_2!11258 lt!377321) (_2!11258 lt!377322)))))

(assert (= (and start!52470 res!201955) b!241895))

(assert (= (and b!241895 res!201947) b!241888))

(assert (= (and b!241888 res!201951) b!241892))

(assert (= (and b!241892 res!201953) b!241890))

(assert (= (and b!241890 res!201952) b!241897))

(assert (= (and b!241897 res!201950) b!241887))

(assert (= (and b!241887 res!201949) b!241889))

(assert (= (and b!241892 res!201948) b!241891))

(assert (= (and b!241891 res!201957) b!241894))

(assert (= (and b!241894 res!201956) b!241893))

(assert (= (and b!241892 (not res!201954)) b!241898))

(assert (= start!52470 b!241896))

(declare-fun m!364557 () Bool)

(assert (=> b!241891 m!364557))

(declare-fun m!364559 () Bool)

(assert (=> b!241891 m!364559))

(assert (=> b!241890 m!364559))

(declare-fun m!364561 () Bool)

(assert (=> b!241890 m!364561))

(declare-fun m!364563 () Bool)

(assert (=> b!241897 m!364563))

(declare-fun m!364565 () Bool)

(assert (=> b!241893 m!364565))

(declare-fun m!364567 () Bool)

(assert (=> b!241893 m!364567))

(declare-fun m!364569 () Bool)

(assert (=> b!241893 m!364569))

(declare-fun m!364571 () Bool)

(assert (=> b!241893 m!364571))

(declare-fun m!364573 () Bool)

(assert (=> b!241894 m!364573))

(declare-fun m!364575 () Bool)

(assert (=> b!241889 m!364575))

(declare-fun m!364577 () Bool)

(assert (=> b!241896 m!364577))

(declare-fun m!364579 () Bool)

(assert (=> start!52470 m!364579))

(declare-fun m!364581 () Bool)

(assert (=> b!241892 m!364581))

(declare-fun m!364583 () Bool)

(assert (=> b!241892 m!364583))

(declare-fun m!364585 () Bool)

(assert (=> b!241892 m!364585))

(declare-fun m!364587 () Bool)

(assert (=> b!241892 m!364587))

(assert (=> b!241892 m!364563))

(declare-fun m!364589 () Bool)

(assert (=> b!241895 m!364589))

(assert (=> b!241898 m!364573))

(declare-fun m!364591 () Bool)

(assert (=> b!241887 m!364591))

(assert (=> b!241887 m!364591))

(declare-fun m!364593 () Bool)

(assert (=> b!241887 m!364593))

(push 1)

