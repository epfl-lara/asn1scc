; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26614 () Bool)

(assert start!26614)

(declare-datatypes ((array!6209 0))(
  ( (array!6210 (arr!3491 (Array (_ BitVec 32) (_ BitVec 8))) (size!2811 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4886 0))(
  ( (BitStream!4887 (buf!3214 array!6209) (currentByte!6017 (_ BitVec 32)) (currentBit!6012 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!11894 0))(
  ( (tuple2!11895 (_1!6268 BitStream!4886) (_2!6268 array!6209)) )
))
(declare-fun lt!212822 () tuple2!11894)

(declare-fun e!90866 () Bool)

(declare-fun to!404 () (_ BitVec 32))

(declare-fun b!136769 () Bool)

(declare-fun arr!237 () array!6209)

(declare-fun arrayRangesEq!214 (array!6209 array!6209 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!136769 (= e!90866 (not (arrayRangesEq!214 arr!237 (_2!6268 lt!212822) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!136770 () Bool)

(declare-fun e!90864 () Bool)

(assert (=> b!136770 (= e!90864 (not e!90866))))

(declare-fun res!113844 () Bool)

(assert (=> b!136770 (=> res!113844 e!90866)))

(declare-datatypes ((tuple2!11896 0))(
  ( (tuple2!11897 (_1!6269 BitStream!4886) (_2!6269 BitStream!4886)) )
))
(declare-fun lt!212811 () tuple2!11896)

(assert (=> b!136770 (= res!113844 (or (not (= (size!2811 (_2!6268 lt!212822)) (size!2811 arr!237))) (not (= (_1!6268 lt!212822) (_2!6269 lt!212811)))))))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun readByteArrayLoopPure!0 (BitStream!4886 array!6209 (_ BitVec 32) (_ BitVec 32)) tuple2!11894)

(assert (=> b!136770 (= lt!212822 (readByteArrayLoopPure!0 (_1!6269 lt!212811) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-datatypes ((Unit!8563 0))(
  ( (Unit!8564) )
))
(declare-datatypes ((tuple2!11898 0))(
  ( (tuple2!11899 (_1!6270 Unit!8563) (_2!6270 BitStream!4886)) )
))
(declare-fun lt!212827 () tuple2!11898)

(declare-fun lt!212806 () tuple2!11898)

(declare-fun lt!212802 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!136770 (validate_offset_bits!1 ((_ sign_extend 32) (size!2811 (buf!3214 (_2!6270 lt!212827)))) ((_ sign_extend 32) (currentByte!6017 (_2!6270 lt!212806))) ((_ sign_extend 32) (currentBit!6012 (_2!6270 lt!212806))) lt!212802)))

(declare-fun lt!212815 () Unit!8563)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4886 array!6209 (_ BitVec 64)) Unit!8563)

(assert (=> b!136770 (= lt!212815 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6270 lt!212806) (buf!3214 (_2!6270 lt!212827)) lt!212802))))

(declare-fun reader!0 (BitStream!4886 BitStream!4886) tuple2!11896)

(assert (=> b!136770 (= lt!212811 (reader!0 (_2!6270 lt!212806) (_2!6270 lt!212827)))))

(declare-fun b!136771 () Bool)

(declare-fun e!90865 () Bool)

(declare-fun thiss!1634 () BitStream!4886)

(declare-fun array_inv!2600 (array!6209) Bool)

(assert (=> b!136771 (= e!90865 (array_inv!2600 (buf!3214 thiss!1634)))))

(declare-fun b!136772 () Bool)

(declare-fun e!90862 () Bool)

(declare-fun e!90872 () Bool)

(assert (=> b!136772 (= e!90862 e!90872)))

(declare-fun res!113845 () Bool)

(assert (=> b!136772 (=> res!113845 e!90872)))

(assert (=> b!136772 (= res!113845 (not (= (size!2811 (buf!3214 thiss!1634)) (size!2811 (buf!3214 (_2!6270 lt!212827))))))))

(declare-fun lt!212825 () tuple2!11894)

(assert (=> b!136772 (arrayRangesEq!214 arr!237 (_2!6268 lt!212825) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!212804 () Unit!8563)

(declare-fun lt!212813 () tuple2!11894)

(declare-fun arrayRangesEqTransitive!16 (array!6209 array!6209 array!6209 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8563)

(assert (=> b!136772 (= lt!212804 (arrayRangesEqTransitive!16 arr!237 (_2!6268 lt!212813) (_2!6268 lt!212825) #b00000000000000000000000000000000 to!404 to!404))))

(assert (=> b!136772 (arrayRangesEq!214 (_2!6268 lt!212813) (_2!6268 lt!212825) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!212821 () Unit!8563)

(declare-fun arrayRangesEqSymmetricLemma!27 (array!6209 array!6209 (_ BitVec 32) (_ BitVec 32)) Unit!8563)

(assert (=> b!136772 (= lt!212821 (arrayRangesEqSymmetricLemma!27 (_2!6268 lt!212825) (_2!6268 lt!212813) #b00000000000000000000000000000000 to!404))))

(declare-fun b!136773 () Bool)

(declare-fun e!90869 () Bool)

(assert (=> b!136773 (= e!90869 e!90864)))

(declare-fun res!113842 () Bool)

(assert (=> b!136773 (=> (not res!113842) (not e!90864))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!136773 (= res!113842 (= (bitIndex!0 (size!2811 (buf!3214 (_2!6270 lt!212827))) (currentByte!6017 (_2!6270 lt!212827)) (currentBit!6012 (_2!6270 lt!212827))) (bvadd (bitIndex!0 (size!2811 (buf!3214 (_2!6270 lt!212806))) (currentByte!6017 (_2!6270 lt!212806)) (currentBit!6012 (_2!6270 lt!212806))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!212802))))))

(assert (=> b!136773 (= lt!212802 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-datatypes ((tuple2!11900 0))(
  ( (tuple2!11901 (_1!6271 BitStream!4886) (_2!6271 (_ BitVec 8))) )
))
(declare-fun lt!212823 () tuple2!11900)

(declare-fun e!90868 () Bool)

(declare-fun b!136774 () Bool)

(declare-fun lt!212824 () tuple2!11896)

(assert (=> b!136774 (= e!90868 (and (= (_2!6271 lt!212823) (select (arr!3491 arr!237) from!447)) (= (_1!6271 lt!212823) (_2!6269 lt!212824))))))

(declare-fun readBytePure!0 (BitStream!4886) tuple2!11900)

(assert (=> b!136774 (= lt!212823 (readBytePure!0 (_1!6269 lt!212824)))))

(assert (=> b!136774 (= lt!212824 (reader!0 thiss!1634 (_2!6270 lt!212806)))))

(declare-fun b!136775 () Bool)

(declare-fun res!113833 () Bool)

(assert (=> b!136775 (=> (not res!113833) (not e!90864))))

(declare-fun isPrefixOf!0 (BitStream!4886 BitStream!4886) Bool)

(assert (=> b!136775 (= res!113833 (isPrefixOf!0 (_2!6270 lt!212806) (_2!6270 lt!212827)))))

(declare-fun b!136776 () Bool)

(declare-fun e!90863 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!136776 (= e!90863 (invariant!0 (currentBit!6012 thiss!1634) (currentByte!6017 thiss!1634) (size!2811 (buf!3214 (_2!6270 lt!212806)))))))

(declare-fun b!136777 () Bool)

(declare-fun res!113839 () Bool)

(declare-fun e!90871 () Bool)

(assert (=> b!136777 (=> (not res!113839) (not e!90871))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!136777 (= res!113839 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2811 (buf!3214 thiss!1634))) ((_ sign_extend 32) (currentByte!6017 thiss!1634)) ((_ sign_extend 32) (currentBit!6012 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun res!113836 () Bool)

(assert (=> start!26614 (=> (not res!113836) (not e!90871))))

(assert (=> start!26614 (= res!113836 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2811 arr!237))))))

(assert (=> start!26614 e!90871))

(assert (=> start!26614 true))

(assert (=> start!26614 (array_inv!2600 arr!237)))

(declare-fun inv!12 (BitStream!4886) Bool)

(assert (=> start!26614 (and (inv!12 thiss!1634) e!90865)))

(declare-fun b!136778 () Bool)

(assert (=> b!136778 (= e!90871 (not e!90862))))

(declare-fun res!113834 () Bool)

(assert (=> b!136778 (=> res!113834 e!90862)))

(assert (=> b!136778 (= res!113834 (not (arrayRangesEq!214 (_2!6268 lt!212825) (_2!6268 lt!212813) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!212814 () tuple2!11894)

(assert (=> b!136778 (arrayRangesEq!214 (_2!6268 lt!212825) (_2!6268 lt!212814) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!212808 () Unit!8563)

(declare-fun lt!212818 () tuple2!11896)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!4886 array!6209 (_ BitVec 32) (_ BitVec 32)) Unit!8563)

(assert (=> b!136778 (= lt!212808 (readByteArrayLoopArrayPrefixLemma!0 (_1!6269 lt!212818) arr!237 from!447 to!404))))

(declare-fun lt!212819 () array!6209)

(declare-fun withMovedByteIndex!0 (BitStream!4886 (_ BitVec 32)) BitStream!4886)

(assert (=> b!136778 (= lt!212814 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6269 lt!212818) #b00000000000000000000000000000001) lt!212819 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!212805 () tuple2!11896)

(assert (=> b!136778 (= lt!212813 (readByteArrayLoopPure!0 (_1!6269 lt!212805) lt!212819 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!212817 () tuple2!11900)

(assert (=> b!136778 (= lt!212819 (array!6210 (store (arr!3491 arr!237) from!447 (_2!6271 lt!212817)) (size!2811 arr!237)))))

(declare-fun lt!212820 () (_ BitVec 32))

(assert (=> b!136778 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2811 (buf!3214 (_2!6270 lt!212827)))) ((_ sign_extend 32) (currentByte!6017 (_2!6270 lt!212806))) ((_ sign_extend 32) (currentBit!6012 (_2!6270 lt!212806))) lt!212820)))

(declare-fun lt!212803 () Unit!8563)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4886 array!6209 (_ BitVec 32)) Unit!8563)

(assert (=> b!136778 (= lt!212803 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6270 lt!212806) (buf!3214 (_2!6270 lt!212827)) lt!212820))))

(assert (=> b!136778 (= (_1!6268 lt!212825) (_2!6269 lt!212818))))

(assert (=> b!136778 (= lt!212825 (readByteArrayLoopPure!0 (_1!6269 lt!212818) arr!237 from!447 to!404))))

(assert (=> b!136778 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2811 (buf!3214 (_2!6270 lt!212827)))) ((_ sign_extend 32) (currentByte!6017 thiss!1634)) ((_ sign_extend 32) (currentBit!6012 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!212812 () Unit!8563)

(assert (=> b!136778 (= lt!212812 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3214 (_2!6270 lt!212827)) (bvsub to!404 from!447)))))

(assert (=> b!136778 (= (_2!6271 lt!212817) (select (arr!3491 arr!237) from!447))))

(assert (=> b!136778 (= lt!212817 (readBytePure!0 (_1!6269 lt!212818)))))

(assert (=> b!136778 (= lt!212805 (reader!0 (_2!6270 lt!212806) (_2!6270 lt!212827)))))

(assert (=> b!136778 (= lt!212818 (reader!0 thiss!1634 (_2!6270 lt!212827)))))

(declare-fun e!90861 () Bool)

(assert (=> b!136778 e!90861))

(declare-fun res!113837 () Bool)

(assert (=> b!136778 (=> (not res!113837) (not e!90861))))

(declare-fun lt!212828 () tuple2!11900)

(declare-fun lt!212826 () tuple2!11900)

(assert (=> b!136778 (= res!113837 (= (bitIndex!0 (size!2811 (buf!3214 (_1!6271 lt!212828))) (currentByte!6017 (_1!6271 lt!212828)) (currentBit!6012 (_1!6271 lt!212828))) (bitIndex!0 (size!2811 (buf!3214 (_1!6271 lt!212826))) (currentByte!6017 (_1!6271 lt!212826)) (currentBit!6012 (_1!6271 lt!212826)))))))

(declare-fun lt!212816 () Unit!8563)

(declare-fun lt!212809 () BitStream!4886)

(declare-fun readBytePrefixLemma!0 (BitStream!4886 BitStream!4886) Unit!8563)

(assert (=> b!136778 (= lt!212816 (readBytePrefixLemma!0 lt!212809 (_2!6270 lt!212827)))))

(assert (=> b!136778 (= lt!212826 (readBytePure!0 (BitStream!4887 (buf!3214 (_2!6270 lt!212827)) (currentByte!6017 thiss!1634) (currentBit!6012 thiss!1634))))))

(assert (=> b!136778 (= lt!212828 (readBytePure!0 lt!212809))))

(assert (=> b!136778 (= lt!212809 (BitStream!4887 (buf!3214 (_2!6270 lt!212806)) (currentByte!6017 thiss!1634) (currentBit!6012 thiss!1634)))))

(assert (=> b!136778 e!90863))

(declare-fun res!113840 () Bool)

(assert (=> b!136778 (=> (not res!113840) (not e!90863))))

(assert (=> b!136778 (= res!113840 (isPrefixOf!0 thiss!1634 (_2!6270 lt!212827)))))

(declare-fun lt!212810 () Unit!8563)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4886 BitStream!4886 BitStream!4886) Unit!8563)

(assert (=> b!136778 (= lt!212810 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6270 lt!212806) (_2!6270 lt!212827)))))

(assert (=> b!136778 e!90869))

(declare-fun res!113841 () Bool)

(assert (=> b!136778 (=> (not res!113841) (not e!90869))))

(assert (=> b!136778 (= res!113841 (= (size!2811 (buf!3214 (_2!6270 lt!212806))) (size!2811 (buf!3214 (_2!6270 lt!212827)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4886 array!6209 (_ BitVec 32) (_ BitVec 32)) tuple2!11898)

(assert (=> b!136778 (= lt!212827 (appendByteArrayLoop!0 (_2!6270 lt!212806) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!136778 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2811 (buf!3214 (_2!6270 lt!212806)))) ((_ sign_extend 32) (currentByte!6017 (_2!6270 lt!212806))) ((_ sign_extend 32) (currentBit!6012 (_2!6270 lt!212806))) lt!212820)))

(assert (=> b!136778 (= lt!212820 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!212807 () Unit!8563)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4886 BitStream!4886 (_ BitVec 64) (_ BitVec 32)) Unit!8563)

(assert (=> b!136778 (= lt!212807 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6270 lt!212806) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!136778 e!90868))

(declare-fun res!113843 () Bool)

(assert (=> b!136778 (=> (not res!113843) (not e!90868))))

(assert (=> b!136778 (= res!113843 (= (size!2811 (buf!3214 thiss!1634)) (size!2811 (buf!3214 (_2!6270 lt!212806)))))))

(declare-fun appendByte!0 (BitStream!4886 (_ BitVec 8)) tuple2!11898)

(assert (=> b!136778 (= lt!212806 (appendByte!0 thiss!1634 (select (arr!3491 arr!237) from!447)))))

(declare-fun b!136779 () Bool)

(assert (=> b!136779 (= e!90872 (invariant!0 (currentBit!6012 (_2!6270 lt!212827)) (currentByte!6017 (_2!6270 lt!212827)) (size!2811 (buf!3214 (_2!6270 lt!212827)))))))

(declare-fun b!136780 () Bool)

(declare-fun res!113838 () Bool)

(assert (=> b!136780 (=> (not res!113838) (not e!90871))))

(assert (=> b!136780 (= res!113838 (bvslt from!447 to!404))))

(declare-fun b!136781 () Bool)

(declare-fun res!113831 () Bool)

(assert (=> b!136781 (=> (not res!113831) (not e!90868))))

(assert (=> b!136781 (= res!113831 (isPrefixOf!0 thiss!1634 (_2!6270 lt!212806)))))

(declare-fun b!136782 () Bool)

(assert (=> b!136782 (= e!90861 (= (_2!6271 lt!212828) (_2!6271 lt!212826)))))

(declare-fun b!136783 () Bool)

(declare-fun res!113835 () Bool)

(assert (=> b!136783 (=> (not res!113835) (not e!90871))))

(assert (=> b!136783 (= res!113835 (invariant!0 (currentBit!6012 thiss!1634) (currentByte!6017 thiss!1634) (size!2811 (buf!3214 thiss!1634))))))

(declare-fun b!136784 () Bool)

(declare-fun res!113832 () Bool)

(assert (=> b!136784 (=> (not res!113832) (not e!90868))))

(assert (=> b!136784 (= res!113832 (= (bitIndex!0 (size!2811 (buf!3214 (_2!6270 lt!212806))) (currentByte!6017 (_2!6270 lt!212806)) (currentBit!6012 (_2!6270 lt!212806))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2811 (buf!3214 thiss!1634)) (currentByte!6017 thiss!1634) (currentBit!6012 thiss!1634)))))))

(assert (= (and start!26614 res!113836) b!136777))

(assert (= (and b!136777 res!113839) b!136780))

(assert (= (and b!136780 res!113838) b!136783))

(assert (= (and b!136783 res!113835) b!136778))

(assert (= (and b!136778 res!113843) b!136784))

(assert (= (and b!136784 res!113832) b!136781))

(assert (= (and b!136781 res!113831) b!136774))

(assert (= (and b!136778 res!113841) b!136773))

(assert (= (and b!136773 res!113842) b!136775))

(assert (= (and b!136775 res!113833) b!136770))

(assert (= (and b!136770 (not res!113844)) b!136769))

(assert (= (and b!136778 res!113840) b!136776))

(assert (= (and b!136778 res!113837) b!136782))

(assert (= (and b!136778 (not res!113834)) b!136772))

(assert (= (and b!136772 (not res!113845)) b!136779))

(assert (= start!26614 b!136771))

(declare-fun m!209589 () Bool)

(assert (=> b!136778 m!209589))

(declare-fun m!209591 () Bool)

(assert (=> b!136778 m!209591))

(declare-fun m!209593 () Bool)

(assert (=> b!136778 m!209593))

(assert (=> b!136778 m!209591))

(declare-fun m!209595 () Bool)

(assert (=> b!136778 m!209595))

(declare-fun m!209597 () Bool)

(assert (=> b!136778 m!209597))

(declare-fun m!209599 () Bool)

(assert (=> b!136778 m!209599))

(declare-fun m!209601 () Bool)

(assert (=> b!136778 m!209601))

(declare-fun m!209603 () Bool)

(assert (=> b!136778 m!209603))

(declare-fun m!209605 () Bool)

(assert (=> b!136778 m!209605))

(declare-fun m!209607 () Bool)

(assert (=> b!136778 m!209607))

(declare-fun m!209609 () Bool)

(assert (=> b!136778 m!209609))

(declare-fun m!209611 () Bool)

(assert (=> b!136778 m!209611))

(declare-fun m!209613 () Bool)

(assert (=> b!136778 m!209613))

(declare-fun m!209615 () Bool)

(assert (=> b!136778 m!209615))

(declare-fun m!209617 () Bool)

(assert (=> b!136778 m!209617))

(assert (=> b!136778 m!209613))

(declare-fun m!209619 () Bool)

(assert (=> b!136778 m!209619))

(declare-fun m!209621 () Bool)

(assert (=> b!136778 m!209621))

(declare-fun m!209623 () Bool)

(assert (=> b!136778 m!209623))

(declare-fun m!209625 () Bool)

(assert (=> b!136778 m!209625))

(declare-fun m!209627 () Bool)

(assert (=> b!136778 m!209627))

(declare-fun m!209629 () Bool)

(assert (=> b!136778 m!209629))

(declare-fun m!209631 () Bool)

(assert (=> b!136778 m!209631))

(declare-fun m!209633 () Bool)

(assert (=> b!136778 m!209633))

(declare-fun m!209635 () Bool)

(assert (=> b!136778 m!209635))

(declare-fun m!209637 () Bool)

(assert (=> b!136778 m!209637))

(declare-fun m!209639 () Bool)

(assert (=> b!136778 m!209639))

(declare-fun m!209641 () Bool)

(assert (=> b!136778 m!209641))

(declare-fun m!209643 () Bool)

(assert (=> b!136776 m!209643))

(declare-fun m!209645 () Bool)

(assert (=> b!136773 m!209645))

(declare-fun m!209647 () Bool)

(assert (=> b!136773 m!209647))

(declare-fun m!209649 () Bool)

(assert (=> b!136775 m!209649))

(assert (=> b!136774 m!209613))

(declare-fun m!209651 () Bool)

(assert (=> b!136774 m!209651))

(declare-fun m!209653 () Bool)

(assert (=> b!136774 m!209653))

(declare-fun m!209655 () Bool)

(assert (=> b!136783 m!209655))

(declare-fun m!209657 () Bool)

(assert (=> b!136781 m!209657))

(declare-fun m!209659 () Bool)

(assert (=> start!26614 m!209659))

(declare-fun m!209661 () Bool)

(assert (=> start!26614 m!209661))

(declare-fun m!209663 () Bool)

(assert (=> b!136770 m!209663))

(declare-fun m!209665 () Bool)

(assert (=> b!136770 m!209665))

(declare-fun m!209667 () Bool)

(assert (=> b!136770 m!209667))

(assert (=> b!136770 m!209617))

(declare-fun m!209669 () Bool)

(assert (=> b!136779 m!209669))

(declare-fun m!209671 () Bool)

(assert (=> b!136772 m!209671))

(declare-fun m!209673 () Bool)

(assert (=> b!136772 m!209673))

(declare-fun m!209675 () Bool)

(assert (=> b!136772 m!209675))

(declare-fun m!209677 () Bool)

(assert (=> b!136772 m!209677))

(declare-fun m!209679 () Bool)

(assert (=> b!136769 m!209679))

(assert (=> b!136784 m!209647))

(declare-fun m!209681 () Bool)

(assert (=> b!136784 m!209681))

(declare-fun m!209683 () Bool)

(assert (=> b!136777 m!209683))

(declare-fun m!209685 () Bool)

(assert (=> b!136771 m!209685))

(push 1)

(assert (not b!136779))

(assert (not b!136776))

(assert (not b!136784))

(assert (not b!136770))

(assert (not b!136777))

(assert (not b!136775))

(assert (not b!136772))

(assert (not b!136783))

(assert (not b!136778))

(assert (not b!136769))

(assert (not b!136771))

(assert (not b!136774))

(assert (not b!136781))

(assert (not start!26614))

(assert (not b!136773))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!44119 () Bool)

(assert (=> d!44119 (= (array_inv!2600 (buf!3214 thiss!1634)) (bvsge (size!2811 (buf!3214 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!136771 d!44119))

(declare-fun d!44121 () Bool)

(declare-fun res!113869 () Bool)

(declare-fun e!90889 () Bool)

(assert (=> d!44121 (=> (not res!113869) (not e!90889))))

(assert (=> d!44121 (= res!113869 (= (size!2811 (buf!3214 thiss!1634)) (size!2811 (buf!3214 (_2!6270 lt!212806)))))))

(assert (=> d!44121 (= (isPrefixOf!0 thiss!1634 (_2!6270 lt!212806)) e!90889)))

(declare-fun b!136814 () Bool)

(declare-fun res!113868 () Bool)

(assert (=> b!136814 (=> (not res!113868) (not e!90889))))

(assert (=> b!136814 (= res!113868 (bvsle (bitIndex!0 (size!2811 (buf!3214 thiss!1634)) (currentByte!6017 thiss!1634) (currentBit!6012 thiss!1634)) (bitIndex!0 (size!2811 (buf!3214 (_2!6270 lt!212806))) (currentByte!6017 (_2!6270 lt!212806)) (currentBit!6012 (_2!6270 lt!212806)))))))

(declare-fun b!136815 () Bool)

(declare-fun e!90888 () Bool)

(assert (=> b!136815 (= e!90889 e!90888)))

(declare-fun res!113867 () Bool)

(assert (=> b!136815 (=> res!113867 e!90888)))

(assert (=> b!136815 (= res!113867 (= (size!2811 (buf!3214 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!136816 () Bool)

(declare-fun arrayBitRangesEq!0 (array!6209 array!6209 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!136816 (= e!90888 (arrayBitRangesEq!0 (buf!3214 thiss!1634) (buf!3214 (_2!6270 lt!212806)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2811 (buf!3214 thiss!1634)) (currentByte!6017 thiss!1634) (currentBit!6012 thiss!1634))))))

(assert (= (and d!44121 res!113869) b!136814))

(assert (= (and b!136814 res!113868) b!136815))

(assert (= (and b!136815 (not res!113867)) b!136816))

(assert (=> b!136814 m!209681))

(assert (=> b!136814 m!209647))

(assert (=> b!136816 m!209681))

(assert (=> b!136816 m!209681))

(declare-fun m!209769 () Bool)

(assert (=> b!136816 m!209769))

(assert (=> b!136781 d!44121))

(declare-datatypes ((tuple3!522 0))(
  ( (tuple3!523 (_1!6274 Unit!8563) (_2!6274 BitStream!4886) (_3!322 array!6209)) )
))
(declare-fun lt!212957 () tuple3!522)

(declare-fun d!44123 () Bool)

(declare-fun readByteArrayLoop!0 (BitStream!4886 array!6209 (_ BitVec 32) (_ BitVec 32)) tuple3!522)

(assert (=> d!44123 (= lt!212957 (readByteArrayLoop!0 (_1!6269 lt!212811) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!44123 (= (readByteArrayLoopPure!0 (_1!6269 lt!212811) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!11895 (_2!6274 lt!212957) (_3!322 lt!212957)))))

(declare-fun bs!10747 () Bool)

(assert (= bs!10747 d!44123))

(declare-fun m!209771 () Bool)

(assert (=> bs!10747 m!209771))

(assert (=> b!136770 d!44123))

(declare-fun d!44125 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!44125 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2811 (buf!3214 (_2!6270 lt!212827)))) ((_ sign_extend 32) (currentByte!6017 (_2!6270 lt!212806))) ((_ sign_extend 32) (currentBit!6012 (_2!6270 lt!212806))) lt!212802) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2811 (buf!3214 (_2!6270 lt!212827)))) ((_ sign_extend 32) (currentByte!6017 (_2!6270 lt!212806))) ((_ sign_extend 32) (currentBit!6012 (_2!6270 lt!212806)))) lt!212802))))

(declare-fun bs!10748 () Bool)

(assert (= bs!10748 d!44125))

(declare-fun m!209773 () Bool)

(assert (=> bs!10748 m!209773))

(assert (=> b!136770 d!44125))

(declare-fun d!44127 () Bool)

(assert (=> d!44127 (validate_offset_bits!1 ((_ sign_extend 32) (size!2811 (buf!3214 (_2!6270 lt!212827)))) ((_ sign_extend 32) (currentByte!6017 (_2!6270 lt!212806))) ((_ sign_extend 32) (currentBit!6012 (_2!6270 lt!212806))) lt!212802)))

(declare-fun lt!212965 () Unit!8563)

(declare-fun choose!9 (BitStream!4886 array!6209 (_ BitVec 64) BitStream!4886) Unit!8563)

(assert (=> d!44127 (= lt!212965 (choose!9 (_2!6270 lt!212806) (buf!3214 (_2!6270 lt!212827)) lt!212802 (BitStream!4887 (buf!3214 (_2!6270 lt!212827)) (currentByte!6017 (_2!6270 lt!212806)) (currentBit!6012 (_2!6270 lt!212806)))))))

(assert (=> d!44127 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6270 lt!212806) (buf!3214 (_2!6270 lt!212827)) lt!212802) lt!212965)))

(declare-fun bs!10749 () Bool)

(assert (= bs!10749 d!44127))

(assert (=> bs!10749 m!209665))

(declare-fun m!209787 () Bool)

(assert (=> bs!10749 m!209787))

(assert (=> b!136770 d!44127))

(declare-fun b!136836 () Bool)

(declare-fun res!113887 () Bool)

(declare-fun e!90898 () Bool)

(assert (=> b!136836 (=> (not res!113887) (not e!90898))))

(declare-fun lt!213007 () tuple2!11896)

(assert (=> b!136836 (= res!113887 (isPrefixOf!0 (_1!6269 lt!213007) (_2!6270 lt!212806)))))

(declare-fun d!44131 () Bool)

(assert (=> d!44131 e!90898))

(declare-fun res!113886 () Bool)

(assert (=> d!44131 (=> (not res!113886) (not e!90898))))

(assert (=> d!44131 (= res!113886 (isPrefixOf!0 (_1!6269 lt!213007) (_2!6269 lt!213007)))))

(declare-fun lt!213020 () BitStream!4886)

(assert (=> d!44131 (= lt!213007 (tuple2!11897 lt!213020 (_2!6270 lt!212827)))))

(declare-fun lt!213011 () Unit!8563)

(declare-fun lt!213010 () Unit!8563)

(assert (=> d!44131 (= lt!213011 lt!213010)))

(assert (=> d!44131 (isPrefixOf!0 lt!213020 (_2!6270 lt!212827))))

(assert (=> d!44131 (= lt!213010 (lemmaIsPrefixTransitive!0 lt!213020 (_2!6270 lt!212827) (_2!6270 lt!212827)))))

(declare-fun lt!213015 () Unit!8563)

(declare-fun lt!213013 () Unit!8563)

(assert (=> d!44131 (= lt!213015 lt!213013)))

(assert (=> d!44131 (isPrefixOf!0 lt!213020 (_2!6270 lt!212827))))

(assert (=> d!44131 (= lt!213013 (lemmaIsPrefixTransitive!0 lt!213020 (_2!6270 lt!212806) (_2!6270 lt!212827)))))

(declare-fun lt!213012 () Unit!8563)

(declare-fun e!90897 () Unit!8563)

(assert (=> d!44131 (= lt!213012 e!90897)))

(declare-fun c!7732 () Bool)

(assert (=> d!44131 (= c!7732 (not (= (size!2811 (buf!3214 (_2!6270 lt!212806))) #b00000000000000000000000000000000)))))

(declare-fun lt!213008 () Unit!8563)

(declare-fun lt!213006 () Unit!8563)

(assert (=> d!44131 (= lt!213008 lt!213006)))

(assert (=> d!44131 (isPrefixOf!0 (_2!6270 lt!212827) (_2!6270 lt!212827))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4886) Unit!8563)

(assert (=> d!44131 (= lt!213006 (lemmaIsPrefixRefl!0 (_2!6270 lt!212827)))))

(declare-fun lt!213019 () Unit!8563)

(declare-fun lt!213016 () Unit!8563)

(assert (=> d!44131 (= lt!213019 lt!213016)))

(assert (=> d!44131 (= lt!213016 (lemmaIsPrefixRefl!0 (_2!6270 lt!212827)))))

(declare-fun lt!213025 () Unit!8563)

(declare-fun lt!213014 () Unit!8563)

(assert (=> d!44131 (= lt!213025 lt!213014)))

(assert (=> d!44131 (isPrefixOf!0 lt!213020 lt!213020)))

(assert (=> d!44131 (= lt!213014 (lemmaIsPrefixRefl!0 lt!213020))))

(declare-fun lt!213022 () Unit!8563)

(declare-fun lt!213024 () Unit!8563)

(assert (=> d!44131 (= lt!213022 lt!213024)))

(assert (=> d!44131 (isPrefixOf!0 (_2!6270 lt!212806) (_2!6270 lt!212806))))

(assert (=> d!44131 (= lt!213024 (lemmaIsPrefixRefl!0 (_2!6270 lt!212806)))))

(assert (=> d!44131 (= lt!213020 (BitStream!4887 (buf!3214 (_2!6270 lt!212827)) (currentByte!6017 (_2!6270 lt!212806)) (currentBit!6012 (_2!6270 lt!212806))))))

(assert (=> d!44131 (isPrefixOf!0 (_2!6270 lt!212806) (_2!6270 lt!212827))))

(assert (=> d!44131 (= (reader!0 (_2!6270 lt!212806) (_2!6270 lt!212827)) lt!213007)))

(declare-fun b!136837 () Bool)

(declare-fun res!113885 () Bool)

(assert (=> b!136837 (=> (not res!113885) (not e!90898))))

(assert (=> b!136837 (= res!113885 (isPrefixOf!0 (_2!6269 lt!213007) (_2!6270 lt!212827)))))

(declare-fun b!136838 () Bool)

(declare-fun lt!213018 () Unit!8563)

(assert (=> b!136838 (= e!90897 lt!213018)))

(declare-fun lt!213009 () (_ BitVec 64))

(assert (=> b!136838 (= lt!213009 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!213023 () (_ BitVec 64))

(assert (=> b!136838 (= lt!213023 (bitIndex!0 (size!2811 (buf!3214 (_2!6270 lt!212806))) (currentByte!6017 (_2!6270 lt!212806)) (currentBit!6012 (_2!6270 lt!212806))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!6209 array!6209 (_ BitVec 64) (_ BitVec 64)) Unit!8563)

(assert (=> b!136838 (= lt!213018 (arrayBitRangesEqSymmetric!0 (buf!3214 (_2!6270 lt!212806)) (buf!3214 (_2!6270 lt!212827)) lt!213009 lt!213023))))

(assert (=> b!136838 (arrayBitRangesEq!0 (buf!3214 (_2!6270 lt!212827)) (buf!3214 (_2!6270 lt!212806)) lt!213009 lt!213023)))

(declare-fun b!136839 () Bool)

(declare-fun Unit!8567 () Unit!8563)

(assert (=> b!136839 (= e!90897 Unit!8567)))

(declare-fun b!136840 () Bool)

(declare-fun lt!213021 () (_ BitVec 64))

(declare-fun lt!213017 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!4886 (_ BitVec 64)) BitStream!4886)

(assert (=> b!136840 (= e!90898 (= (_1!6269 lt!213007) (withMovedBitIndex!0 (_2!6269 lt!213007) (bvsub lt!213017 lt!213021))))))

(assert (=> b!136840 (or (= (bvand lt!213017 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!213021 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!213017 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!213017 lt!213021) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!136840 (= lt!213021 (bitIndex!0 (size!2811 (buf!3214 (_2!6270 lt!212827))) (currentByte!6017 (_2!6270 lt!212827)) (currentBit!6012 (_2!6270 lt!212827))))))

(assert (=> b!136840 (= lt!213017 (bitIndex!0 (size!2811 (buf!3214 (_2!6270 lt!212806))) (currentByte!6017 (_2!6270 lt!212806)) (currentBit!6012 (_2!6270 lt!212806))))))

(assert (= (and d!44131 c!7732) b!136838))

(assert (= (and d!44131 (not c!7732)) b!136839))

(assert (= (and d!44131 res!113886) b!136836))

(assert (= (and b!136836 res!113887) b!136837))

(assert (= (and b!136837 res!113885) b!136840))

(declare-fun m!209789 () Bool)

(assert (=> b!136840 m!209789))

(assert (=> b!136840 m!209645))

(assert (=> b!136840 m!209647))

(assert (=> b!136838 m!209647))

(declare-fun m!209791 () Bool)

(assert (=> b!136838 m!209791))

(declare-fun m!209793 () Bool)

(assert (=> b!136838 m!209793))

(declare-fun m!209795 () Bool)

(assert (=> b!136837 m!209795))

(declare-fun m!209797 () Bool)

(assert (=> b!136836 m!209797))

(declare-fun m!209799 () Bool)

(assert (=> d!44131 m!209799))

(declare-fun m!209801 () Bool)

(assert (=> d!44131 m!209801))

(declare-fun m!209803 () Bool)

(assert (=> d!44131 m!209803))

(declare-fun m!209805 () Bool)

(assert (=> d!44131 m!209805))

(declare-fun m!209807 () Bool)

(assert (=> d!44131 m!209807))

(declare-fun m!209809 () Bool)

(assert (=> d!44131 m!209809))

(declare-fun m!209811 () Bool)

(assert (=> d!44131 m!209811))

(assert (=> d!44131 m!209649))

(declare-fun m!209813 () Bool)

(assert (=> d!44131 m!209813))

(declare-fun m!209815 () Bool)

(assert (=> d!44131 m!209815))

(declare-fun m!209817 () Bool)

(assert (=> d!44131 m!209817))

(assert (=> b!136770 d!44131))

(declare-fun d!44133 () Bool)

(assert (=> d!44133 (= (invariant!0 (currentBit!6012 (_2!6270 lt!212827)) (currentByte!6017 (_2!6270 lt!212827)) (size!2811 (buf!3214 (_2!6270 lt!212827)))) (and (bvsge (currentBit!6012 (_2!6270 lt!212827)) #b00000000000000000000000000000000) (bvslt (currentBit!6012 (_2!6270 lt!212827)) #b00000000000000000000000000001000) (bvsge (currentByte!6017 (_2!6270 lt!212827)) #b00000000000000000000000000000000) (or (bvslt (currentByte!6017 (_2!6270 lt!212827)) (size!2811 (buf!3214 (_2!6270 lt!212827)))) (and (= (currentBit!6012 (_2!6270 lt!212827)) #b00000000000000000000000000000000) (= (currentByte!6017 (_2!6270 lt!212827)) (size!2811 (buf!3214 (_2!6270 lt!212827))))))))))

(assert (=> b!136779 d!44133))

(declare-fun d!44135 () Bool)

(declare-fun res!113892 () Bool)

(declare-fun e!90903 () Bool)

(assert (=> d!44135 (=> res!113892 e!90903)))

(assert (=> d!44135 (= res!113892 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!44135 (= (arrayRangesEq!214 arr!237 (_2!6268 lt!212822) #b00000000000000000000000000000000 to!404) e!90903)))

(declare-fun b!136845 () Bool)

(declare-fun e!90904 () Bool)

(assert (=> b!136845 (= e!90903 e!90904)))

(declare-fun res!113893 () Bool)

(assert (=> b!136845 (=> (not res!113893) (not e!90904))))

(assert (=> b!136845 (= res!113893 (= (select (arr!3491 arr!237) #b00000000000000000000000000000000) (select (arr!3491 (_2!6268 lt!212822)) #b00000000000000000000000000000000)))))

(declare-fun b!136846 () Bool)

(assert (=> b!136846 (= e!90904 (arrayRangesEq!214 arr!237 (_2!6268 lt!212822) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!44135 (not res!113892)) b!136845))

(assert (= (and b!136845 res!113893) b!136846))

(declare-fun m!209819 () Bool)

(assert (=> b!136845 m!209819))

(declare-fun m!209821 () Bool)

(assert (=> b!136845 m!209821))

(declare-fun m!209823 () Bool)

(assert (=> b!136846 m!209823))

(assert (=> b!136769 d!44135))

(declare-fun b!136914 () Bool)

(declare-fun e!90949 () Bool)

(declare-fun lt!213146 () tuple2!11894)

(assert (=> b!136914 (= e!90949 (arrayRangesEq!214 arr!237 (_2!6268 lt!213146) #b00000000000000000000000000000000 to!404))))

(declare-fun d!44137 () Bool)

(declare-fun e!90951 () Bool)

(assert (=> d!44137 e!90951))

(declare-fun res!113963 () Bool)

(assert (=> d!44137 (=> (not res!113963) (not e!90951))))

(declare-fun lt!213149 () tuple2!11898)

(assert (=> d!44137 (= res!113963 (= (size!2811 (buf!3214 (_2!6270 lt!212806))) (size!2811 (buf!3214 (_2!6270 lt!213149)))))))

(declare-fun choose!64 (BitStream!4886 array!6209 (_ BitVec 32) (_ BitVec 32)) tuple2!11898)

(assert (=> d!44137 (= lt!213149 (choose!64 (_2!6270 lt!212806) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!44137 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!2811 arr!237)))))

(assert (=> d!44137 (= (appendByteArrayLoop!0 (_2!6270 lt!212806) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!213149)))

(declare-fun b!136915 () Bool)

(declare-fun e!90950 () Bool)

(declare-fun lt!213152 () (_ BitVec 64))

(assert (=> b!136915 (= e!90950 (validate_offset_bits!1 ((_ sign_extend 32) (size!2811 (buf!3214 (_2!6270 lt!212806)))) ((_ sign_extend 32) (currentByte!6017 (_2!6270 lt!212806))) ((_ sign_extend 32) (currentBit!6012 (_2!6270 lt!212806))) lt!213152))))

(declare-fun b!136916 () Bool)

(declare-fun res!113959 () Bool)

(assert (=> b!136916 (=> (not res!113959) (not e!90951))))

(declare-fun lt!213150 () (_ BitVec 64))

(declare-fun lt!213153 () (_ BitVec 64))

(assert (=> b!136916 (= res!113959 (= (bitIndex!0 (size!2811 (buf!3214 (_2!6270 lt!213149))) (currentByte!6017 (_2!6270 lt!213149)) (currentBit!6012 (_2!6270 lt!213149))) (bvadd lt!213153 lt!213150)))))

(assert (=> b!136916 (or (not (= (bvand lt!213153 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!213150 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!213153 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!213153 lt!213150) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!213147 () (_ BitVec 64))

(assert (=> b!136916 (= lt!213150 (bvmul lt!213147 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!136916 (or (= lt!213147 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!213147 #b0000000000000000000000000000000000000000000000000000000000001000) lt!213147)))))

(assert (=> b!136916 (= lt!213147 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!136916 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!136916 (= lt!213153 (bitIndex!0 (size!2811 (buf!3214 (_2!6270 lt!212806))) (currentByte!6017 (_2!6270 lt!212806)) (currentBit!6012 (_2!6270 lt!212806))))))

(declare-fun b!136917 () Bool)

(declare-fun res!113960 () Bool)

(assert (=> b!136917 (=> (not res!113960) (not e!90951))))

(assert (=> b!136917 (= res!113960 (isPrefixOf!0 (_2!6270 lt!212806) (_2!6270 lt!213149)))))

(declare-fun b!136918 () Bool)

(assert (=> b!136918 (= e!90951 e!90949)))

(declare-fun res!113961 () Bool)

(assert (=> b!136918 (=> (not res!113961) (not e!90949))))

(declare-fun lt!213154 () tuple2!11896)

(assert (=> b!136918 (= res!113961 (and (= (size!2811 (_2!6268 lt!213146)) (size!2811 arr!237)) (= (_1!6268 lt!213146) (_2!6269 lt!213154))))))

(assert (=> b!136918 (= lt!213146 (readByteArrayLoopPure!0 (_1!6269 lt!213154) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!213151 () Unit!8563)

(declare-fun lt!213148 () Unit!8563)

(assert (=> b!136918 (= lt!213151 lt!213148)))

(assert (=> b!136918 (validate_offset_bits!1 ((_ sign_extend 32) (size!2811 (buf!3214 (_2!6270 lt!213149)))) ((_ sign_extend 32) (currentByte!6017 (_2!6270 lt!212806))) ((_ sign_extend 32) (currentBit!6012 (_2!6270 lt!212806))) lt!213152)))

(assert (=> b!136918 (= lt!213148 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6270 lt!212806) (buf!3214 (_2!6270 lt!213149)) lt!213152))))

(assert (=> b!136918 e!90950))

(declare-fun res!113962 () Bool)

(assert (=> b!136918 (=> (not res!113962) (not e!90950))))

(assert (=> b!136918 (= res!113962 (and (= (size!2811 (buf!3214 (_2!6270 lt!212806))) (size!2811 (buf!3214 (_2!6270 lt!213149)))) (bvsge lt!213152 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!136918 (= lt!213152 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!136918 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!136918 (= lt!213154 (reader!0 (_2!6270 lt!212806) (_2!6270 lt!213149)))))

(assert (= (and d!44137 res!113963) b!136916))

(assert (= (and b!136916 res!113959) b!136917))

(assert (= (and b!136917 res!113960) b!136918))

(assert (= (and b!136918 res!113962) b!136915))

(assert (= (and b!136918 res!113961) b!136914))

(declare-fun m!209923 () Bool)

(assert (=> d!44137 m!209923))

(declare-fun m!209925 () Bool)

(assert (=> b!136918 m!209925))

(declare-fun m!209927 () Bool)

(assert (=> b!136918 m!209927))

(declare-fun m!209929 () Bool)

(assert (=> b!136918 m!209929))

(declare-fun m!209931 () Bool)

(assert (=> b!136918 m!209931))

(declare-fun m!209933 () Bool)

(assert (=> b!136914 m!209933))

(declare-fun m!209935 () Bool)

(assert (=> b!136917 m!209935))

(declare-fun m!209937 () Bool)

(assert (=> b!136915 m!209937))

(declare-fun m!209939 () Bool)

(assert (=> b!136916 m!209939))

(assert (=> b!136916 m!209647))

(assert (=> b!136778 d!44137))

(declare-fun d!44197 () Bool)

(declare-fun lt!213175 () tuple2!11894)

(declare-fun lt!213177 () tuple2!11894)

(assert (=> d!44197 (arrayRangesEq!214 (_2!6268 lt!213175) (_2!6268 lt!213177) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!213178 () Unit!8563)

(declare-fun lt!213176 () BitStream!4886)

(declare-fun choose!35 (BitStream!4886 array!6209 (_ BitVec 32) (_ BitVec 32) tuple2!11894 array!6209 BitStream!4886 tuple2!11894 array!6209) Unit!8563)

(assert (=> d!44197 (= lt!213178 (choose!35 (_1!6269 lt!212818) arr!237 from!447 to!404 lt!213175 (_2!6268 lt!213175) lt!213176 lt!213177 (_2!6268 lt!213177)))))

(assert (=> d!44197 (= lt!213177 (readByteArrayLoopPure!0 lt!213176 (array!6210 (store (arr!3491 arr!237) from!447 (_2!6271 (readBytePure!0 (_1!6269 lt!212818)))) (size!2811 arr!237)) (bvadd from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> d!44197 (= lt!213176 (withMovedByteIndex!0 (_1!6269 lt!212818) #b00000000000000000000000000000001))))

(assert (=> d!44197 (= lt!213175 (readByteArrayLoopPure!0 (_1!6269 lt!212818) arr!237 from!447 to!404))))

(assert (=> d!44197 (= (readByteArrayLoopArrayPrefixLemma!0 (_1!6269 lt!212818) arr!237 from!447 to!404) lt!213178)))

(declare-fun bs!10765 () Bool)

(assert (= bs!10765 d!44197))

(declare-fun m!209953 () Bool)

(assert (=> bs!10765 m!209953))

(declare-fun m!209955 () Bool)

(assert (=> bs!10765 m!209955))

(declare-fun m!209957 () Bool)

(assert (=> bs!10765 m!209957))

(assert (=> bs!10765 m!209591))

(assert (=> bs!10765 m!209641))

(declare-fun m!209959 () Bool)

(assert (=> bs!10765 m!209959))

(assert (=> bs!10765 m!209601))

(assert (=> b!136778 d!44197))

(declare-fun b!136928 () Bool)

(declare-fun res!113975 () Bool)

(declare-fun e!90960 () Bool)

(assert (=> b!136928 (=> (not res!113975) (not e!90960))))

(declare-fun lt!213180 () tuple2!11896)

(assert (=> b!136928 (= res!113975 (isPrefixOf!0 (_1!6269 lt!213180) thiss!1634))))

(declare-fun d!44209 () Bool)

(assert (=> d!44209 e!90960))

(declare-fun res!113974 () Bool)

(assert (=> d!44209 (=> (not res!113974) (not e!90960))))

(assert (=> d!44209 (= res!113974 (isPrefixOf!0 (_1!6269 lt!213180) (_2!6269 lt!213180)))))

(declare-fun lt!213193 () BitStream!4886)

(assert (=> d!44209 (= lt!213180 (tuple2!11897 lt!213193 (_2!6270 lt!212827)))))

(declare-fun lt!213184 () Unit!8563)

(declare-fun lt!213183 () Unit!8563)

(assert (=> d!44209 (= lt!213184 lt!213183)))

(assert (=> d!44209 (isPrefixOf!0 lt!213193 (_2!6270 lt!212827))))

(assert (=> d!44209 (= lt!213183 (lemmaIsPrefixTransitive!0 lt!213193 (_2!6270 lt!212827) (_2!6270 lt!212827)))))

(declare-fun lt!213188 () Unit!8563)

(declare-fun lt!213186 () Unit!8563)

(assert (=> d!44209 (= lt!213188 lt!213186)))

(assert (=> d!44209 (isPrefixOf!0 lt!213193 (_2!6270 lt!212827))))

(assert (=> d!44209 (= lt!213186 (lemmaIsPrefixTransitive!0 lt!213193 thiss!1634 (_2!6270 lt!212827)))))

(declare-fun lt!213185 () Unit!8563)

(declare-fun e!90959 () Unit!8563)

(assert (=> d!44209 (= lt!213185 e!90959)))

(declare-fun c!7734 () Bool)

(assert (=> d!44209 (= c!7734 (not (= (size!2811 (buf!3214 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!213181 () Unit!8563)

(declare-fun lt!213179 () Unit!8563)

(assert (=> d!44209 (= lt!213181 lt!213179)))

(assert (=> d!44209 (isPrefixOf!0 (_2!6270 lt!212827) (_2!6270 lt!212827))))

(assert (=> d!44209 (= lt!213179 (lemmaIsPrefixRefl!0 (_2!6270 lt!212827)))))

(declare-fun lt!213192 () Unit!8563)

(declare-fun lt!213189 () Unit!8563)

(assert (=> d!44209 (= lt!213192 lt!213189)))

(assert (=> d!44209 (= lt!213189 (lemmaIsPrefixRefl!0 (_2!6270 lt!212827)))))

(declare-fun lt!213198 () Unit!8563)

(declare-fun lt!213187 () Unit!8563)

(assert (=> d!44209 (= lt!213198 lt!213187)))

(assert (=> d!44209 (isPrefixOf!0 lt!213193 lt!213193)))

(assert (=> d!44209 (= lt!213187 (lemmaIsPrefixRefl!0 lt!213193))))

(declare-fun lt!213195 () Unit!8563)

(declare-fun lt!213197 () Unit!8563)

(assert (=> d!44209 (= lt!213195 lt!213197)))

(assert (=> d!44209 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!44209 (= lt!213197 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!44209 (= lt!213193 (BitStream!4887 (buf!3214 (_2!6270 lt!212827)) (currentByte!6017 thiss!1634) (currentBit!6012 thiss!1634)))))

(assert (=> d!44209 (isPrefixOf!0 thiss!1634 (_2!6270 lt!212827))))

(assert (=> d!44209 (= (reader!0 thiss!1634 (_2!6270 lt!212827)) lt!213180)))

(declare-fun b!136929 () Bool)

(declare-fun res!113973 () Bool)

(assert (=> b!136929 (=> (not res!113973) (not e!90960))))

(assert (=> b!136929 (= res!113973 (isPrefixOf!0 (_2!6269 lt!213180) (_2!6270 lt!212827)))))

(declare-fun b!136930 () Bool)

(declare-fun lt!213191 () Unit!8563)

(assert (=> b!136930 (= e!90959 lt!213191)))

(declare-fun lt!213182 () (_ BitVec 64))

(assert (=> b!136930 (= lt!213182 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!213196 () (_ BitVec 64))

(assert (=> b!136930 (= lt!213196 (bitIndex!0 (size!2811 (buf!3214 thiss!1634)) (currentByte!6017 thiss!1634) (currentBit!6012 thiss!1634)))))

(assert (=> b!136930 (= lt!213191 (arrayBitRangesEqSymmetric!0 (buf!3214 thiss!1634) (buf!3214 (_2!6270 lt!212827)) lt!213182 lt!213196))))

(assert (=> b!136930 (arrayBitRangesEq!0 (buf!3214 (_2!6270 lt!212827)) (buf!3214 thiss!1634) lt!213182 lt!213196)))

(declare-fun b!136931 () Bool)

(declare-fun Unit!8569 () Unit!8563)

(assert (=> b!136931 (= e!90959 Unit!8569)))

(declare-fun b!136932 () Bool)

(declare-fun lt!213190 () (_ BitVec 64))

(declare-fun lt!213194 () (_ BitVec 64))

(assert (=> b!136932 (= e!90960 (= (_1!6269 lt!213180) (withMovedBitIndex!0 (_2!6269 lt!213180) (bvsub lt!213190 lt!213194))))))

(assert (=> b!136932 (or (= (bvand lt!213190 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!213194 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!213190 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!213190 lt!213194) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!136932 (= lt!213194 (bitIndex!0 (size!2811 (buf!3214 (_2!6270 lt!212827))) (currentByte!6017 (_2!6270 lt!212827)) (currentBit!6012 (_2!6270 lt!212827))))))

(assert (=> b!136932 (= lt!213190 (bitIndex!0 (size!2811 (buf!3214 thiss!1634)) (currentByte!6017 thiss!1634) (currentBit!6012 thiss!1634)))))

(assert (= (and d!44209 c!7734) b!136930))

(assert (= (and d!44209 (not c!7734)) b!136931))

(assert (= (and d!44209 res!113974) b!136928))

(assert (= (and b!136928 res!113975) b!136929))

(assert (= (and b!136929 res!113973) b!136932))

(declare-fun m!209961 () Bool)

(assert (=> b!136932 m!209961))

(assert (=> b!136932 m!209645))

(assert (=> b!136932 m!209681))

(assert (=> b!136930 m!209681))

(declare-fun m!209963 () Bool)

(assert (=> b!136930 m!209963))

(declare-fun m!209965 () Bool)

(assert (=> b!136930 m!209965))

(declare-fun m!209967 () Bool)

(assert (=> b!136929 m!209967))

(declare-fun m!209969 () Bool)

(assert (=> b!136928 m!209969))

(declare-fun m!209971 () Bool)

(assert (=> d!44209 m!209971))

(declare-fun m!209973 () Bool)

(assert (=> d!44209 m!209973))

(declare-fun m!209975 () Bool)

(assert (=> d!44209 m!209975))

(declare-fun m!209977 () Bool)

(assert (=> d!44209 m!209977))

(declare-fun m!209979 () Bool)

(assert (=> d!44209 m!209979))

(declare-fun m!209981 () Bool)

(assert (=> d!44209 m!209981))

(declare-fun m!209983 () Bool)

(assert (=> d!44209 m!209983))

(assert (=> d!44209 m!209627))

(assert (=> d!44209 m!209813))

(assert (=> d!44209 m!209815))

(declare-fun m!209985 () Bool)

(assert (=> d!44209 m!209985))

(assert (=> b!136778 d!44209))

(declare-fun d!44211 () Bool)

(declare-fun e!90963 () Bool)

(assert (=> d!44211 e!90963))

(declare-fun res!113978 () Bool)

(assert (=> d!44211 (=> (not res!113978) (not e!90963))))

(assert (=> d!44211 (= res!113978 (and (or (let ((rhs!3151 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3151 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3151) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!44212 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!44212 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!44212 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3150 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3150 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3150) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!213206 () Unit!8563)

(declare-fun choose!57 (BitStream!4886 BitStream!4886 (_ BitVec 64) (_ BitVec 32)) Unit!8563)

(assert (=> d!44211 (= lt!213206 (choose!57 thiss!1634 (_2!6270 lt!212806) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> d!44211 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6270 lt!212806) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)) lt!213206)))

(declare-fun b!136935 () Bool)

(declare-fun lt!213207 () (_ BitVec 32))

(assert (=> b!136935 (= e!90963 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2811 (buf!3214 (_2!6270 lt!212806)))) ((_ sign_extend 32) (currentByte!6017 (_2!6270 lt!212806))) ((_ sign_extend 32) (currentBit!6012 (_2!6270 lt!212806))) (bvsub (bvsub to!404 from!447) lt!213207)))))

(assert (=> b!136935 (or (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand lt!213207 #b10000000000000000000000000000000)) (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!404 from!447) lt!213207) #b10000000000000000000000000000000)))))

(declare-fun lt!213205 () (_ BitVec 64))

(assert (=> b!136935 (= lt!213207 ((_ extract 31 0) lt!213205))))

(assert (=> b!136935 (and (bvslt lt!213205 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!213205 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!136935 (= lt!213205 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!44211 res!113978) b!136935))

(declare-fun m!209987 () Bool)

(assert (=> d!44211 m!209987))

(declare-fun m!209989 () Bool)

(assert (=> b!136935 m!209989))

(assert (=> b!136778 d!44211))

(declare-fun d!44214 () Bool)

(declare-fun lt!213208 () tuple3!522)

(assert (=> d!44214 (= lt!213208 (readByteArrayLoop!0 (_1!6269 lt!212805) lt!212819 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!44214 (= (readByteArrayLoopPure!0 (_1!6269 lt!212805) lt!212819 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!11895 (_2!6274 lt!213208) (_3!322 lt!213208)))))

(declare-fun bs!10766 () Bool)

(assert (= bs!10766 d!44214))

(declare-fun m!209991 () Bool)

(assert (=> bs!10766 m!209991))

(assert (=> b!136778 d!44214))

(declare-fun d!44216 () Bool)

(declare-fun res!113979 () Bool)

(declare-fun e!90964 () Bool)

(assert (=> d!44216 (=> res!113979 e!90964)))

(assert (=> d!44216 (= res!113979 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!44216 (= (arrayRangesEq!214 (_2!6268 lt!212825) (_2!6268 lt!212813) #b00000000000000000000000000000000 to!404) e!90964)))

(declare-fun b!136936 () Bool)

(declare-fun e!90965 () Bool)

(assert (=> b!136936 (= e!90964 e!90965)))

(declare-fun res!113980 () Bool)

(assert (=> b!136936 (=> (not res!113980) (not e!90965))))

(assert (=> b!136936 (= res!113980 (= (select (arr!3491 (_2!6268 lt!212825)) #b00000000000000000000000000000000) (select (arr!3491 (_2!6268 lt!212813)) #b00000000000000000000000000000000)))))

(declare-fun b!136937 () Bool)

(assert (=> b!136937 (= e!90965 (arrayRangesEq!214 (_2!6268 lt!212825) (_2!6268 lt!212813) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!44216 (not res!113979)) b!136936))

(assert (= (and b!136936 res!113980) b!136937))

(declare-fun m!209993 () Bool)

(assert (=> b!136936 m!209993))

(declare-fun m!209995 () Bool)

(assert (=> b!136936 m!209995))

(declare-fun m!209997 () Bool)

(assert (=> b!136937 m!209997))

(assert (=> b!136778 d!44216))

(declare-fun d!44218 () Bool)

(declare-fun moveByteIndex!0 (BitStream!4886 (_ BitVec 32)) tuple2!11898)

(assert (=> d!44218 (= (withMovedByteIndex!0 (_1!6269 lt!212818) #b00000000000000000000000000000001) (_2!6270 (moveByteIndex!0 (_1!6269 lt!212818) #b00000000000000000000000000000001)))))

(declare-fun bs!10767 () Bool)

(assert (= bs!10767 d!44218))

(declare-fun m!209999 () Bool)

(assert (=> bs!10767 m!209999))

(assert (=> b!136778 d!44218))

(assert (=> b!136778 d!44131))

(declare-fun d!44220 () Bool)

(declare-fun res!113981 () Bool)

(declare-fun e!90966 () Bool)

(assert (=> d!44220 (=> res!113981 e!90966)))

(assert (=> d!44220 (= res!113981 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!44220 (= (arrayRangesEq!214 (_2!6268 lt!212825) (_2!6268 lt!212814) #b00000000000000000000000000000000 to!404) e!90966)))

(declare-fun b!136938 () Bool)

(declare-fun e!90967 () Bool)

(assert (=> b!136938 (= e!90966 e!90967)))

(declare-fun res!113982 () Bool)

(assert (=> b!136938 (=> (not res!113982) (not e!90967))))

(assert (=> b!136938 (= res!113982 (= (select (arr!3491 (_2!6268 lt!212825)) #b00000000000000000000000000000000) (select (arr!3491 (_2!6268 lt!212814)) #b00000000000000000000000000000000)))))

(declare-fun b!136939 () Bool)

(assert (=> b!136939 (= e!90967 (arrayRangesEq!214 (_2!6268 lt!212825) (_2!6268 lt!212814) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!44220 (not res!113981)) b!136938))

(assert (= (and b!136938 res!113982) b!136939))

(assert (=> b!136938 m!209993))

(declare-fun m!210001 () Bool)

(assert (=> b!136938 m!210001))

(declare-fun m!210003 () Bool)

(assert (=> b!136939 m!210003))

(assert (=> b!136778 d!44220))

(declare-fun d!44222 () Bool)

(declare-datatypes ((tuple2!11904 0))(
  ( (tuple2!11905 (_1!6275 (_ BitVec 8)) (_2!6275 BitStream!4886)) )
))
(declare-fun lt!213211 () tuple2!11904)

(declare-fun readByte!0 (BitStream!4886) tuple2!11904)

(assert (=> d!44222 (= lt!213211 (readByte!0 (BitStream!4887 (buf!3214 (_2!6270 lt!212827)) (currentByte!6017 thiss!1634) (currentBit!6012 thiss!1634))))))

(assert (=> d!44222 (= (readBytePure!0 (BitStream!4887 (buf!3214 (_2!6270 lt!212827)) (currentByte!6017 thiss!1634) (currentBit!6012 thiss!1634))) (tuple2!11901 (_2!6275 lt!213211) (_1!6275 lt!213211)))))

(declare-fun bs!10768 () Bool)

(assert (= bs!10768 d!44222))

(declare-fun m!210005 () Bool)

(assert (=> bs!10768 m!210005))

(assert (=> b!136778 d!44222))

(declare-fun d!44224 () Bool)

(declare-fun e!90970 () Bool)

(assert (=> d!44224 e!90970))

(declare-fun res!113987 () Bool)

(assert (=> d!44224 (=> (not res!113987) (not e!90970))))

(declare-fun lt!213225 () (_ BitVec 64))

(declare-fun lt!213229 () (_ BitVec 64))

(declare-fun lt!213224 () (_ BitVec 64))

(assert (=> d!44224 (= res!113987 (= lt!213224 (bvsub lt!213229 lt!213225)))))

(assert (=> d!44224 (or (= (bvand lt!213229 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!213225 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!213229 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!213229 lt!213225) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!44224 (= lt!213225 (remainingBits!0 ((_ sign_extend 32) (size!2811 (buf!3214 (_1!6271 lt!212826)))) ((_ sign_extend 32) (currentByte!6017 (_1!6271 lt!212826))) ((_ sign_extend 32) (currentBit!6012 (_1!6271 lt!212826)))))))

(declare-fun lt!213228 () (_ BitVec 64))

(declare-fun lt!213226 () (_ BitVec 64))

(assert (=> d!44224 (= lt!213229 (bvmul lt!213228 lt!213226))))

(assert (=> d!44224 (or (= lt!213228 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!213226 (bvsdiv (bvmul lt!213228 lt!213226) lt!213228)))))

(assert (=> d!44224 (= lt!213226 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!44224 (= lt!213228 ((_ sign_extend 32) (size!2811 (buf!3214 (_1!6271 lt!212826)))))))

(assert (=> d!44224 (= lt!213224 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6017 (_1!6271 lt!212826))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6012 (_1!6271 lt!212826)))))))

(assert (=> d!44224 (invariant!0 (currentBit!6012 (_1!6271 lt!212826)) (currentByte!6017 (_1!6271 lt!212826)) (size!2811 (buf!3214 (_1!6271 lt!212826))))))

(assert (=> d!44224 (= (bitIndex!0 (size!2811 (buf!3214 (_1!6271 lt!212826))) (currentByte!6017 (_1!6271 lt!212826)) (currentBit!6012 (_1!6271 lt!212826))) lt!213224)))

(declare-fun b!136944 () Bool)

(declare-fun res!113988 () Bool)

(assert (=> b!136944 (=> (not res!113988) (not e!90970))))

(assert (=> b!136944 (= res!113988 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!213224))))

(declare-fun b!136945 () Bool)

(declare-fun lt!213227 () (_ BitVec 64))

(assert (=> b!136945 (= e!90970 (bvsle lt!213224 (bvmul lt!213227 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!136945 (or (= lt!213227 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!213227 #b0000000000000000000000000000000000000000000000000000000000001000) lt!213227)))))

(assert (=> b!136945 (= lt!213227 ((_ sign_extend 32) (size!2811 (buf!3214 (_1!6271 lt!212826)))))))

(assert (= (and d!44224 res!113987) b!136944))

(assert (= (and b!136944 res!113988) b!136945))

(declare-fun m!210007 () Bool)

(assert (=> d!44224 m!210007))

(declare-fun m!210009 () Bool)

(assert (=> d!44224 m!210009))

(assert (=> b!136778 d!44224))

(declare-fun d!44226 () Bool)

(assert (=> d!44226 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2811 (buf!3214 (_2!6270 lt!212827)))) ((_ sign_extend 32) (currentByte!6017 thiss!1634)) ((_ sign_extend 32) (currentBit!6012 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!213232 () Unit!8563)

(declare-fun choose!26 (BitStream!4886 array!6209 (_ BitVec 32) BitStream!4886) Unit!8563)

(assert (=> d!44226 (= lt!213232 (choose!26 thiss!1634 (buf!3214 (_2!6270 lt!212827)) (bvsub to!404 from!447) (BitStream!4887 (buf!3214 (_2!6270 lt!212827)) (currentByte!6017 thiss!1634) (currentBit!6012 thiss!1634))))))

(assert (=> d!44226 (= (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3214 (_2!6270 lt!212827)) (bvsub to!404 from!447)) lt!213232)))

(declare-fun bs!10769 () Bool)

(assert (= bs!10769 d!44226))

(assert (=> bs!10769 m!209621))

(declare-fun m!210011 () Bool)

(assert (=> bs!10769 m!210011))

(assert (=> b!136778 d!44226))

(declare-fun d!44228 () Bool)

(assert (=> d!44228 (isPrefixOf!0 thiss!1634 (_2!6270 lt!212827))))

(declare-fun lt!213235 () Unit!8563)

(declare-fun choose!30 (BitStream!4886 BitStream!4886 BitStream!4886) Unit!8563)

(assert (=> d!44228 (= lt!213235 (choose!30 thiss!1634 (_2!6270 lt!212806) (_2!6270 lt!212827)))))

(assert (=> d!44228 (isPrefixOf!0 thiss!1634 (_2!6270 lt!212806))))

(assert (=> d!44228 (= (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6270 lt!212806) (_2!6270 lt!212827)) lt!213235)))

(declare-fun bs!10770 () Bool)

(assert (= bs!10770 d!44228))

(assert (=> bs!10770 m!209627))

(declare-fun m!210013 () Bool)

(assert (=> bs!10770 m!210013))

(assert (=> bs!10770 m!209657))

(assert (=> b!136778 d!44228))

(declare-fun d!44230 () Bool)

(declare-fun lt!213236 () tuple2!11904)

(assert (=> d!44230 (= lt!213236 (readByte!0 (_1!6269 lt!212818)))))

(assert (=> d!44230 (= (readBytePure!0 (_1!6269 lt!212818)) (tuple2!11901 (_2!6275 lt!213236) (_1!6275 lt!213236)))))

(declare-fun bs!10771 () Bool)

(assert (= bs!10771 d!44230))

(declare-fun m!210015 () Bool)

(assert (=> bs!10771 m!210015))

(assert (=> b!136778 d!44230))

(declare-fun d!44232 () Bool)

(declare-fun lt!213237 () tuple3!522)

(assert (=> d!44232 (= lt!213237 (readByteArrayLoop!0 (withMovedByteIndex!0 (_1!6269 lt!212818) #b00000000000000000000000000000001) lt!212819 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!44232 (= (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6269 lt!212818) #b00000000000000000000000000000001) lt!212819 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!11895 (_2!6274 lt!213237) (_3!322 lt!213237)))))

(declare-fun bs!10772 () Bool)

(assert (= bs!10772 d!44232))

(assert (=> bs!10772 m!209591))

(declare-fun m!210017 () Bool)

(assert (=> bs!10772 m!210017))

(assert (=> b!136778 d!44232))

(declare-fun d!44234 () Bool)

(assert (=> d!44234 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2811 (buf!3214 (_2!6270 lt!212806)))) ((_ sign_extend 32) (currentByte!6017 (_2!6270 lt!212806))) ((_ sign_extend 32) (currentBit!6012 (_2!6270 lt!212806))) lt!212820) (bvsle ((_ sign_extend 32) lt!212820) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2811 (buf!3214 (_2!6270 lt!212806)))) ((_ sign_extend 32) (currentByte!6017 (_2!6270 lt!212806))) ((_ sign_extend 32) (currentBit!6012 (_2!6270 lt!212806)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10773 () Bool)

(assert (= bs!10773 d!44234))

(declare-fun m!210019 () Bool)

(assert (=> bs!10773 m!210019))

(assert (=> b!136778 d!44234))

(declare-fun d!44236 () Bool)

(declare-fun res!113991 () Bool)

(declare-fun e!90972 () Bool)

(assert (=> d!44236 (=> (not res!113991) (not e!90972))))

(assert (=> d!44236 (= res!113991 (= (size!2811 (buf!3214 thiss!1634)) (size!2811 (buf!3214 (_2!6270 lt!212827)))))))

(assert (=> d!44236 (= (isPrefixOf!0 thiss!1634 (_2!6270 lt!212827)) e!90972)))

(declare-fun b!136946 () Bool)

(declare-fun res!113990 () Bool)

(assert (=> b!136946 (=> (not res!113990) (not e!90972))))

(assert (=> b!136946 (= res!113990 (bvsle (bitIndex!0 (size!2811 (buf!3214 thiss!1634)) (currentByte!6017 thiss!1634) (currentBit!6012 thiss!1634)) (bitIndex!0 (size!2811 (buf!3214 (_2!6270 lt!212827))) (currentByte!6017 (_2!6270 lt!212827)) (currentBit!6012 (_2!6270 lt!212827)))))))

(declare-fun b!136947 () Bool)

(declare-fun e!90971 () Bool)

(assert (=> b!136947 (= e!90972 e!90971)))

(declare-fun res!113989 () Bool)

(assert (=> b!136947 (=> res!113989 e!90971)))

(assert (=> b!136947 (= res!113989 (= (size!2811 (buf!3214 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!136948 () Bool)

(assert (=> b!136948 (= e!90971 (arrayBitRangesEq!0 (buf!3214 thiss!1634) (buf!3214 (_2!6270 lt!212827)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2811 (buf!3214 thiss!1634)) (currentByte!6017 thiss!1634) (currentBit!6012 thiss!1634))))))

(assert (= (and d!44236 res!113991) b!136946))

(assert (= (and b!136946 res!113990) b!136947))

(assert (= (and b!136947 (not res!113989)) b!136948))

(assert (=> b!136946 m!209681))

(assert (=> b!136946 m!209645))

(assert (=> b!136948 m!209681))

(assert (=> b!136948 m!209681))

(declare-fun m!210021 () Bool)

(assert (=> b!136948 m!210021))

(assert (=> b!136778 d!44236))

(declare-fun d!44238 () Bool)

(declare-fun e!90975 () Bool)

(assert (=> d!44238 e!90975))

(declare-fun res!113994 () Bool)

(assert (=> d!44238 (=> (not res!113994) (not e!90975))))

(declare-fun lt!213246 () tuple2!11900)

(declare-fun lt!213248 () tuple2!11900)

(assert (=> d!44238 (= res!113994 (= (bitIndex!0 (size!2811 (buf!3214 (_1!6271 lt!213246))) (currentByte!6017 (_1!6271 lt!213246)) (currentBit!6012 (_1!6271 lt!213246))) (bitIndex!0 (size!2811 (buf!3214 (_1!6271 lt!213248))) (currentByte!6017 (_1!6271 lt!213248)) (currentBit!6012 (_1!6271 lt!213248)))))))

(declare-fun lt!213249 () BitStream!4886)

(declare-fun lt!213247 () Unit!8563)

(declare-fun choose!14 (BitStream!4886 BitStream!4886 BitStream!4886 tuple2!11900 tuple2!11900 BitStream!4886 (_ BitVec 8) tuple2!11900 tuple2!11900 BitStream!4886 (_ BitVec 8)) Unit!8563)

(assert (=> d!44238 (= lt!213247 (choose!14 lt!212809 (_2!6270 lt!212827) lt!213249 lt!213246 (tuple2!11901 (_1!6271 lt!213246) (_2!6271 lt!213246)) (_1!6271 lt!213246) (_2!6271 lt!213246) lt!213248 (tuple2!11901 (_1!6271 lt!213248) (_2!6271 lt!213248)) (_1!6271 lt!213248) (_2!6271 lt!213248)))))

(assert (=> d!44238 (= lt!213248 (readBytePure!0 lt!213249))))

(assert (=> d!44238 (= lt!213246 (readBytePure!0 lt!212809))))

(assert (=> d!44238 (= lt!213249 (BitStream!4887 (buf!3214 (_2!6270 lt!212827)) (currentByte!6017 lt!212809) (currentBit!6012 lt!212809)))))

(assert (=> d!44238 (= (readBytePrefixLemma!0 lt!212809 (_2!6270 lt!212827)) lt!213247)))

(declare-fun b!136951 () Bool)

(assert (=> b!136951 (= e!90975 (= (_2!6271 lt!213246) (_2!6271 lt!213248)))))

(assert (= (and d!44238 res!113994) b!136951))

(declare-fun m!210023 () Bool)

(assert (=> d!44238 m!210023))

(declare-fun m!210025 () Bool)

(assert (=> d!44238 m!210025))

(declare-fun m!210027 () Bool)

(assert (=> d!44238 m!210027))

(assert (=> d!44238 m!209639))

(declare-fun m!210029 () Bool)

(assert (=> d!44238 m!210029))

(assert (=> b!136778 d!44238))

(declare-fun d!44240 () Bool)

(assert (=> d!44240 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2811 (buf!3214 (_2!6270 lt!212827)))) ((_ sign_extend 32) (currentByte!6017 thiss!1634)) ((_ sign_extend 32) (currentBit!6012 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2811 (buf!3214 (_2!6270 lt!212827)))) ((_ sign_extend 32) (currentByte!6017 thiss!1634)) ((_ sign_extend 32) (currentBit!6012 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10774 () Bool)

(assert (= bs!10774 d!44240))

(declare-fun m!210031 () Bool)

(assert (=> bs!10774 m!210031))

(assert (=> b!136778 d!44240))

(declare-fun d!44242 () Bool)

(assert (=> d!44242 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2811 (buf!3214 (_2!6270 lt!212827)))) ((_ sign_extend 32) (currentByte!6017 (_2!6270 lt!212806))) ((_ sign_extend 32) (currentBit!6012 (_2!6270 lt!212806))) lt!212820) (bvsle ((_ sign_extend 32) lt!212820) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2811 (buf!3214 (_2!6270 lt!212827)))) ((_ sign_extend 32) (currentByte!6017 (_2!6270 lt!212806))) ((_ sign_extend 32) (currentBit!6012 (_2!6270 lt!212806)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10775 () Bool)

(assert (= bs!10775 d!44242))

(assert (=> bs!10775 m!209773))

(assert (=> b!136778 d!44242))

(declare-fun d!44244 () Bool)

(declare-fun lt!213250 () tuple2!11904)

(assert (=> d!44244 (= lt!213250 (readByte!0 lt!212809))))

(assert (=> d!44244 (= (readBytePure!0 lt!212809) (tuple2!11901 (_2!6275 lt!213250) (_1!6275 lt!213250)))))

(declare-fun bs!10776 () Bool)

(assert (= bs!10776 d!44244))

(declare-fun m!210033 () Bool)

(assert (=> bs!10776 m!210033))

(assert (=> b!136778 d!44244))

(declare-fun d!44246 () Bool)

(declare-fun e!90976 () Bool)

(assert (=> d!44246 e!90976))

(declare-fun res!113995 () Bool)

(assert (=> d!44246 (=> (not res!113995) (not e!90976))))

(declare-fun lt!213252 () (_ BitVec 64))

(declare-fun lt!213251 () (_ BitVec 64))

(declare-fun lt!213256 () (_ BitVec 64))

(assert (=> d!44246 (= res!113995 (= lt!213251 (bvsub lt!213256 lt!213252)))))

(assert (=> d!44246 (or (= (bvand lt!213256 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!213252 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!213256 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!213256 lt!213252) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!44246 (= lt!213252 (remainingBits!0 ((_ sign_extend 32) (size!2811 (buf!3214 (_1!6271 lt!212828)))) ((_ sign_extend 32) (currentByte!6017 (_1!6271 lt!212828))) ((_ sign_extend 32) (currentBit!6012 (_1!6271 lt!212828)))))))

(declare-fun lt!213255 () (_ BitVec 64))

(declare-fun lt!213253 () (_ BitVec 64))

(assert (=> d!44246 (= lt!213256 (bvmul lt!213255 lt!213253))))

(assert (=> d!44246 (or (= lt!213255 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!213253 (bvsdiv (bvmul lt!213255 lt!213253) lt!213255)))))

(assert (=> d!44246 (= lt!213253 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!44246 (= lt!213255 ((_ sign_extend 32) (size!2811 (buf!3214 (_1!6271 lt!212828)))))))

(assert (=> d!44246 (= lt!213251 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6017 (_1!6271 lt!212828))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6012 (_1!6271 lt!212828)))))))

(assert (=> d!44246 (invariant!0 (currentBit!6012 (_1!6271 lt!212828)) (currentByte!6017 (_1!6271 lt!212828)) (size!2811 (buf!3214 (_1!6271 lt!212828))))))

(assert (=> d!44246 (= (bitIndex!0 (size!2811 (buf!3214 (_1!6271 lt!212828))) (currentByte!6017 (_1!6271 lt!212828)) (currentBit!6012 (_1!6271 lt!212828))) lt!213251)))

(declare-fun b!136952 () Bool)

(declare-fun res!113996 () Bool)

(assert (=> b!136952 (=> (not res!113996) (not e!90976))))

(assert (=> b!136952 (= res!113996 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!213251))))

(declare-fun b!136953 () Bool)

(declare-fun lt!213254 () (_ BitVec 64))

(assert (=> b!136953 (= e!90976 (bvsle lt!213251 (bvmul lt!213254 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!136953 (or (= lt!213254 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!213254 #b0000000000000000000000000000000000000000000000000000000000001000) lt!213254)))))

(assert (=> b!136953 (= lt!213254 ((_ sign_extend 32) (size!2811 (buf!3214 (_1!6271 lt!212828)))))))

(assert (= (and d!44246 res!113995) b!136952))

(assert (= (and b!136952 res!113996) b!136953))

(declare-fun m!210035 () Bool)

(assert (=> d!44246 m!210035))

(declare-fun m!210037 () Bool)

(assert (=> d!44246 m!210037))

(assert (=> b!136778 d!44246))

(declare-fun d!44248 () Bool)

(assert (=> d!44248 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2811 (buf!3214 (_2!6270 lt!212827)))) ((_ sign_extend 32) (currentByte!6017 (_2!6270 lt!212806))) ((_ sign_extend 32) (currentBit!6012 (_2!6270 lt!212806))) lt!212820)))

(declare-fun lt!213257 () Unit!8563)

(assert (=> d!44248 (= lt!213257 (choose!26 (_2!6270 lt!212806) (buf!3214 (_2!6270 lt!212827)) lt!212820 (BitStream!4887 (buf!3214 (_2!6270 lt!212827)) (currentByte!6017 (_2!6270 lt!212806)) (currentBit!6012 (_2!6270 lt!212806)))))))

(assert (=> d!44248 (= (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6270 lt!212806) (buf!3214 (_2!6270 lt!212827)) lt!212820) lt!213257)))

(declare-fun bs!10777 () Bool)

(assert (= bs!10777 d!44248))

(assert (=> bs!10777 m!209597))

(declare-fun m!210039 () Bool)

(assert (=> bs!10777 m!210039))

(assert (=> b!136778 d!44248))

(declare-fun d!44250 () Bool)

(declare-fun e!90979 () Bool)

(assert (=> d!44250 e!90979))

(declare-fun res!114005 () Bool)

(assert (=> d!44250 (=> (not res!114005) (not e!90979))))

(declare-fun lt!213272 () tuple2!11898)

(assert (=> d!44250 (= res!114005 (= (size!2811 (buf!3214 thiss!1634)) (size!2811 (buf!3214 (_2!6270 lt!213272)))))))

(declare-fun choose!6 (BitStream!4886 (_ BitVec 8)) tuple2!11898)

(assert (=> d!44250 (= lt!213272 (choose!6 thiss!1634 (select (arr!3491 arr!237) from!447)))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!44250 (validate_offset_byte!0 ((_ sign_extend 32) (size!2811 (buf!3214 thiss!1634))) ((_ sign_extend 32) (currentByte!6017 thiss!1634)) ((_ sign_extend 32) (currentBit!6012 thiss!1634)))))

(assert (=> d!44250 (= (appendByte!0 thiss!1634 (select (arr!3491 arr!237) from!447)) lt!213272)))

(declare-fun b!136960 () Bool)

(declare-fun res!114003 () Bool)

(assert (=> b!136960 (=> (not res!114003) (not e!90979))))

(declare-fun lt!213271 () (_ BitVec 64))

(declare-fun lt!213269 () (_ BitVec 64))

(assert (=> b!136960 (= res!114003 (= (bitIndex!0 (size!2811 (buf!3214 (_2!6270 lt!213272))) (currentByte!6017 (_2!6270 lt!213272)) (currentBit!6012 (_2!6270 lt!213272))) (bvadd lt!213269 lt!213271)))))

(assert (=> b!136960 (or (not (= (bvand lt!213269 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!213271 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!213269 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!213269 lt!213271) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!136960 (= lt!213271 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!136960 (= lt!213269 (bitIndex!0 (size!2811 (buf!3214 thiss!1634)) (currentByte!6017 thiss!1634) (currentBit!6012 thiss!1634)))))

(declare-fun b!136961 () Bool)

(declare-fun res!114004 () Bool)

(assert (=> b!136961 (=> (not res!114004) (not e!90979))))

(assert (=> b!136961 (= res!114004 (isPrefixOf!0 thiss!1634 (_2!6270 lt!213272)))))

(declare-fun b!136962 () Bool)

(declare-fun lt!213268 () tuple2!11896)

(declare-fun lt!213270 () tuple2!11900)

(assert (=> b!136962 (= e!90979 (and (= (_2!6271 lt!213270) (select (arr!3491 arr!237) from!447)) (= (_1!6271 lt!213270) (_2!6269 lt!213268))))))

(assert (=> b!136962 (= lt!213270 (readBytePure!0 (_1!6269 lt!213268)))))

(assert (=> b!136962 (= lt!213268 (reader!0 thiss!1634 (_2!6270 lt!213272)))))

(assert (= (and d!44250 res!114005) b!136960))

(assert (= (and b!136960 res!114003) b!136961))

(assert (= (and b!136961 res!114004) b!136962))

(assert (=> d!44250 m!209613))

(declare-fun m!210041 () Bool)

(assert (=> d!44250 m!210041))

(declare-fun m!210043 () Bool)

(assert (=> d!44250 m!210043))

(declare-fun m!210045 () Bool)

(assert (=> b!136960 m!210045))

(assert (=> b!136960 m!209681))

(declare-fun m!210047 () Bool)

(assert (=> b!136961 m!210047))

(declare-fun m!210049 () Bool)

(assert (=> b!136962 m!210049))

(declare-fun m!210051 () Bool)

(assert (=> b!136962 m!210051))

(assert (=> b!136778 d!44250))

(declare-fun d!44252 () Bool)

(declare-fun lt!213273 () tuple3!522)

(assert (=> d!44252 (= lt!213273 (readByteArrayLoop!0 (_1!6269 lt!212818) arr!237 from!447 to!404))))

(assert (=> d!44252 (= (readByteArrayLoopPure!0 (_1!6269 lt!212818) arr!237 from!447 to!404) (tuple2!11895 (_2!6274 lt!213273) (_3!322 lt!213273)))))

(declare-fun bs!10778 () Bool)

(assert (= bs!10778 d!44252))

(declare-fun m!210053 () Bool)

(assert (=> bs!10778 m!210053))

(assert (=> b!136778 d!44252))

(declare-fun d!44254 () Bool)

(assert (=> d!44254 (= (invariant!0 (currentBit!6012 thiss!1634) (currentByte!6017 thiss!1634) (size!2811 (buf!3214 (_2!6270 lt!212806)))) (and (bvsge (currentBit!6012 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6012 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6017 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6017 thiss!1634) (size!2811 (buf!3214 (_2!6270 lt!212806)))) (and (= (currentBit!6012 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6017 thiss!1634) (size!2811 (buf!3214 (_2!6270 lt!212806))))))))))

(assert (=> b!136776 d!44254))

(declare-fun d!44256 () Bool)

(assert (=> d!44256 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2811 (buf!3214 thiss!1634))) ((_ sign_extend 32) (currentByte!6017 thiss!1634)) ((_ sign_extend 32) (currentBit!6012 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2811 (buf!3214 thiss!1634))) ((_ sign_extend 32) (currentByte!6017 thiss!1634)) ((_ sign_extend 32) (currentBit!6012 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10779 () Bool)

(assert (= bs!10779 d!44256))

(declare-fun m!210055 () Bool)

(assert (=> bs!10779 m!210055))

(assert (=> b!136777 d!44256))

(declare-fun d!44258 () Bool)

(declare-fun res!114008 () Bool)

(declare-fun e!90981 () Bool)

(assert (=> d!44258 (=> (not res!114008) (not e!90981))))

(assert (=> d!44258 (= res!114008 (= (size!2811 (buf!3214 (_2!6270 lt!212806))) (size!2811 (buf!3214 (_2!6270 lt!212827)))))))

(assert (=> d!44258 (= (isPrefixOf!0 (_2!6270 lt!212806) (_2!6270 lt!212827)) e!90981)))

(declare-fun b!136963 () Bool)

(declare-fun res!114007 () Bool)

(assert (=> b!136963 (=> (not res!114007) (not e!90981))))

(assert (=> b!136963 (= res!114007 (bvsle (bitIndex!0 (size!2811 (buf!3214 (_2!6270 lt!212806))) (currentByte!6017 (_2!6270 lt!212806)) (currentBit!6012 (_2!6270 lt!212806))) (bitIndex!0 (size!2811 (buf!3214 (_2!6270 lt!212827))) (currentByte!6017 (_2!6270 lt!212827)) (currentBit!6012 (_2!6270 lt!212827)))))))

(declare-fun b!136964 () Bool)

(declare-fun e!90980 () Bool)

(assert (=> b!136964 (= e!90981 e!90980)))

(declare-fun res!114006 () Bool)

(assert (=> b!136964 (=> res!114006 e!90980)))

(assert (=> b!136964 (= res!114006 (= (size!2811 (buf!3214 (_2!6270 lt!212806))) #b00000000000000000000000000000000))))

(declare-fun b!136965 () Bool)

(assert (=> b!136965 (= e!90980 (arrayBitRangesEq!0 (buf!3214 (_2!6270 lt!212806)) (buf!3214 (_2!6270 lt!212827)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2811 (buf!3214 (_2!6270 lt!212806))) (currentByte!6017 (_2!6270 lt!212806)) (currentBit!6012 (_2!6270 lt!212806)))))))

(assert (= (and d!44258 res!114008) b!136963))

(assert (= (and b!136963 res!114007) b!136964))

(assert (= (and b!136964 (not res!114006)) b!136965))

(assert (=> b!136963 m!209647))

(assert (=> b!136963 m!209645))

(assert (=> b!136965 m!209647))

(assert (=> b!136965 m!209647))

(declare-fun m!210057 () Bool)

(assert (=> b!136965 m!210057))

(assert (=> b!136775 d!44258))

(declare-fun d!44260 () Bool)

(assert (=> d!44260 (= (array_inv!2600 arr!237) (bvsge (size!2811 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!26614 d!44260))

(declare-fun d!44262 () Bool)

(assert (=> d!44262 (= (inv!12 thiss!1634) (invariant!0 (currentBit!6012 thiss!1634) (currentByte!6017 thiss!1634) (size!2811 (buf!3214 thiss!1634))))))

(declare-fun bs!10780 () Bool)

(assert (= bs!10780 d!44262))

(assert (=> bs!10780 m!209655))

(assert (=> start!26614 d!44262))

(declare-fun d!44264 () Bool)

(declare-fun e!90982 () Bool)

(assert (=> d!44264 e!90982))

(declare-fun res!114009 () Bool)

(assert (=> d!44264 (=> (not res!114009) (not e!90982))))

(declare-fun lt!213274 () (_ BitVec 64))

(declare-fun lt!213279 () (_ BitVec 64))

(declare-fun lt!213275 () (_ BitVec 64))

(assert (=> d!44264 (= res!114009 (= lt!213274 (bvsub lt!213279 lt!213275)))))

(assert (=> d!44264 (or (= (bvand lt!213279 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!213275 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!213279 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!213279 lt!213275) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!44264 (= lt!213275 (remainingBits!0 ((_ sign_extend 32) (size!2811 (buf!3214 (_2!6270 lt!212806)))) ((_ sign_extend 32) (currentByte!6017 (_2!6270 lt!212806))) ((_ sign_extend 32) (currentBit!6012 (_2!6270 lt!212806)))))))

(declare-fun lt!213278 () (_ BitVec 64))

(declare-fun lt!213276 () (_ BitVec 64))

(assert (=> d!44264 (= lt!213279 (bvmul lt!213278 lt!213276))))

(assert (=> d!44264 (or (= lt!213278 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!213276 (bvsdiv (bvmul lt!213278 lt!213276) lt!213278)))))

(assert (=> d!44264 (= lt!213276 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!44264 (= lt!213278 ((_ sign_extend 32) (size!2811 (buf!3214 (_2!6270 lt!212806)))))))

(assert (=> d!44264 (= lt!213274 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6017 (_2!6270 lt!212806))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6012 (_2!6270 lt!212806)))))))

(assert (=> d!44264 (invariant!0 (currentBit!6012 (_2!6270 lt!212806)) (currentByte!6017 (_2!6270 lt!212806)) (size!2811 (buf!3214 (_2!6270 lt!212806))))))

(assert (=> d!44264 (= (bitIndex!0 (size!2811 (buf!3214 (_2!6270 lt!212806))) (currentByte!6017 (_2!6270 lt!212806)) (currentBit!6012 (_2!6270 lt!212806))) lt!213274)))

(declare-fun b!136966 () Bool)

(declare-fun res!114010 () Bool)

(assert (=> b!136966 (=> (not res!114010) (not e!90982))))

(assert (=> b!136966 (= res!114010 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!213274))))

(declare-fun b!136967 () Bool)

(declare-fun lt!213277 () (_ BitVec 64))

(assert (=> b!136967 (= e!90982 (bvsle lt!213274 (bvmul lt!213277 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!136967 (or (= lt!213277 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!213277 #b0000000000000000000000000000000000000000000000000000000000001000) lt!213277)))))

(assert (=> b!136967 (= lt!213277 ((_ sign_extend 32) (size!2811 (buf!3214 (_2!6270 lt!212806)))))))

(assert (= (and d!44264 res!114009) b!136966))

(assert (= (and b!136966 res!114010) b!136967))

(assert (=> d!44264 m!210019))

(declare-fun m!210059 () Bool)

(assert (=> d!44264 m!210059))

(assert (=> b!136784 d!44264))

(declare-fun d!44266 () Bool)

(declare-fun e!90983 () Bool)

(assert (=> d!44266 e!90983))

(declare-fun res!114011 () Bool)

(assert (=> d!44266 (=> (not res!114011) (not e!90983))))

(declare-fun lt!213280 () (_ BitVec 64))

(declare-fun lt!213281 () (_ BitVec 64))

(declare-fun lt!213285 () (_ BitVec 64))

(assert (=> d!44266 (= res!114011 (= lt!213280 (bvsub lt!213285 lt!213281)))))

(assert (=> d!44266 (or (= (bvand lt!213285 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!213281 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!213285 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!213285 lt!213281) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!44266 (= lt!213281 (remainingBits!0 ((_ sign_extend 32) (size!2811 (buf!3214 thiss!1634))) ((_ sign_extend 32) (currentByte!6017 thiss!1634)) ((_ sign_extend 32) (currentBit!6012 thiss!1634))))))

(declare-fun lt!213284 () (_ BitVec 64))

(declare-fun lt!213282 () (_ BitVec 64))

(assert (=> d!44266 (= lt!213285 (bvmul lt!213284 lt!213282))))

(assert (=> d!44266 (or (= lt!213284 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!213282 (bvsdiv (bvmul lt!213284 lt!213282) lt!213284)))))

(assert (=> d!44266 (= lt!213282 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!44266 (= lt!213284 ((_ sign_extend 32) (size!2811 (buf!3214 thiss!1634))))))

(assert (=> d!44266 (= lt!213280 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6017 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6012 thiss!1634))))))

(assert (=> d!44266 (invariant!0 (currentBit!6012 thiss!1634) (currentByte!6017 thiss!1634) (size!2811 (buf!3214 thiss!1634)))))

(assert (=> d!44266 (= (bitIndex!0 (size!2811 (buf!3214 thiss!1634)) (currentByte!6017 thiss!1634) (currentBit!6012 thiss!1634)) lt!213280)))

(declare-fun b!136968 () Bool)

(declare-fun res!114012 () Bool)

(assert (=> b!136968 (=> (not res!114012) (not e!90983))))

(assert (=> b!136968 (= res!114012 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!213280))))

(declare-fun b!136969 () Bool)

(declare-fun lt!213283 () (_ BitVec 64))

(assert (=> b!136969 (= e!90983 (bvsle lt!213280 (bvmul lt!213283 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!136969 (or (= lt!213283 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!213283 #b0000000000000000000000000000000000000000000000000000000000001000) lt!213283)))))

(assert (=> b!136969 (= lt!213283 ((_ sign_extend 32) (size!2811 (buf!3214 thiss!1634))))))

(assert (= (and d!44266 res!114011) b!136968))

(assert (= (and b!136968 res!114012) b!136969))

(assert (=> d!44266 m!210055))

(assert (=> d!44266 m!209655))

(assert (=> b!136784 d!44266))

(declare-fun d!44268 () Bool)

(declare-fun lt!213286 () tuple2!11904)

(assert (=> d!44268 (= lt!213286 (readByte!0 (_1!6269 lt!212824)))))

(assert (=> d!44268 (= (readBytePure!0 (_1!6269 lt!212824)) (tuple2!11901 (_2!6275 lt!213286) (_1!6275 lt!213286)))))

(declare-fun bs!10781 () Bool)

(assert (= bs!10781 d!44268))

(declare-fun m!210061 () Bool)

(assert (=> bs!10781 m!210061))

(assert (=> b!136774 d!44268))

(declare-fun b!136970 () Bool)

(declare-fun res!114015 () Bool)

(declare-fun e!90985 () Bool)

(assert (=> b!136970 (=> (not res!114015) (not e!90985))))

(declare-fun lt!213288 () tuple2!11896)

(assert (=> b!136970 (= res!114015 (isPrefixOf!0 (_1!6269 lt!213288) thiss!1634))))

(declare-fun d!44270 () Bool)

(assert (=> d!44270 e!90985))

(declare-fun res!114014 () Bool)

(assert (=> d!44270 (=> (not res!114014) (not e!90985))))

(assert (=> d!44270 (= res!114014 (isPrefixOf!0 (_1!6269 lt!213288) (_2!6269 lt!213288)))))

(declare-fun lt!213301 () BitStream!4886)

(assert (=> d!44270 (= lt!213288 (tuple2!11897 lt!213301 (_2!6270 lt!212806)))))

(declare-fun lt!213292 () Unit!8563)

(declare-fun lt!213291 () Unit!8563)

(assert (=> d!44270 (= lt!213292 lt!213291)))

(assert (=> d!44270 (isPrefixOf!0 lt!213301 (_2!6270 lt!212806))))

(assert (=> d!44270 (= lt!213291 (lemmaIsPrefixTransitive!0 lt!213301 (_2!6270 lt!212806) (_2!6270 lt!212806)))))

(declare-fun lt!213296 () Unit!8563)

(declare-fun lt!213294 () Unit!8563)

(assert (=> d!44270 (= lt!213296 lt!213294)))

(assert (=> d!44270 (isPrefixOf!0 lt!213301 (_2!6270 lt!212806))))

(assert (=> d!44270 (= lt!213294 (lemmaIsPrefixTransitive!0 lt!213301 thiss!1634 (_2!6270 lt!212806)))))

(declare-fun lt!213293 () Unit!8563)

(declare-fun e!90984 () Unit!8563)

(assert (=> d!44270 (= lt!213293 e!90984)))

(declare-fun c!7735 () Bool)

(assert (=> d!44270 (= c!7735 (not (= (size!2811 (buf!3214 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!213289 () Unit!8563)

(declare-fun lt!213287 () Unit!8563)

(assert (=> d!44270 (= lt!213289 lt!213287)))

(assert (=> d!44270 (isPrefixOf!0 (_2!6270 lt!212806) (_2!6270 lt!212806))))

(assert (=> d!44270 (= lt!213287 (lemmaIsPrefixRefl!0 (_2!6270 lt!212806)))))

(declare-fun lt!213300 () Unit!8563)

(declare-fun lt!213297 () Unit!8563)

(assert (=> d!44270 (= lt!213300 lt!213297)))

(assert (=> d!44270 (= lt!213297 (lemmaIsPrefixRefl!0 (_2!6270 lt!212806)))))

(declare-fun lt!213306 () Unit!8563)

(declare-fun lt!213295 () Unit!8563)

(assert (=> d!44270 (= lt!213306 lt!213295)))

(assert (=> d!44270 (isPrefixOf!0 lt!213301 lt!213301)))

(assert (=> d!44270 (= lt!213295 (lemmaIsPrefixRefl!0 lt!213301))))

(declare-fun lt!213303 () Unit!8563)

(declare-fun lt!213305 () Unit!8563)

(assert (=> d!44270 (= lt!213303 lt!213305)))

(assert (=> d!44270 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!44270 (= lt!213305 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!44270 (= lt!213301 (BitStream!4887 (buf!3214 (_2!6270 lt!212806)) (currentByte!6017 thiss!1634) (currentBit!6012 thiss!1634)))))

(assert (=> d!44270 (isPrefixOf!0 thiss!1634 (_2!6270 lt!212806))))

(assert (=> d!44270 (= (reader!0 thiss!1634 (_2!6270 lt!212806)) lt!213288)))

(declare-fun b!136971 () Bool)

(declare-fun res!114013 () Bool)

(assert (=> b!136971 (=> (not res!114013) (not e!90985))))

(assert (=> b!136971 (= res!114013 (isPrefixOf!0 (_2!6269 lt!213288) (_2!6270 lt!212806)))))

(declare-fun b!136972 () Bool)

(declare-fun lt!213299 () Unit!8563)

(assert (=> b!136972 (= e!90984 lt!213299)))

(declare-fun lt!213290 () (_ BitVec 64))

(assert (=> b!136972 (= lt!213290 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!213304 () (_ BitVec 64))

(assert (=> b!136972 (= lt!213304 (bitIndex!0 (size!2811 (buf!3214 thiss!1634)) (currentByte!6017 thiss!1634) (currentBit!6012 thiss!1634)))))

(assert (=> b!136972 (= lt!213299 (arrayBitRangesEqSymmetric!0 (buf!3214 thiss!1634) (buf!3214 (_2!6270 lt!212806)) lt!213290 lt!213304))))

(assert (=> b!136972 (arrayBitRangesEq!0 (buf!3214 (_2!6270 lt!212806)) (buf!3214 thiss!1634) lt!213290 lt!213304)))

(declare-fun b!136973 () Bool)

(declare-fun Unit!8570 () Unit!8563)

(assert (=> b!136973 (= e!90984 Unit!8570)))

(declare-fun lt!213302 () (_ BitVec 64))

(declare-fun lt!213298 () (_ BitVec 64))

(declare-fun b!136974 () Bool)

(assert (=> b!136974 (= e!90985 (= (_1!6269 lt!213288) (withMovedBitIndex!0 (_2!6269 lt!213288) (bvsub lt!213298 lt!213302))))))

(assert (=> b!136974 (or (= (bvand lt!213298 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!213302 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!213298 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!213298 lt!213302) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!136974 (= lt!213302 (bitIndex!0 (size!2811 (buf!3214 (_2!6270 lt!212806))) (currentByte!6017 (_2!6270 lt!212806)) (currentBit!6012 (_2!6270 lt!212806))))))

(assert (=> b!136974 (= lt!213298 (bitIndex!0 (size!2811 (buf!3214 thiss!1634)) (currentByte!6017 thiss!1634) (currentBit!6012 thiss!1634)))))

(assert (= (and d!44270 c!7735) b!136972))

(assert (= (and d!44270 (not c!7735)) b!136973))

(assert (= (and d!44270 res!114014) b!136970))

(assert (= (and b!136970 res!114015) b!136971))

(assert (= (and b!136971 res!114013) b!136974))

(declare-fun m!210063 () Bool)

(assert (=> b!136974 m!210063))

(assert (=> b!136974 m!209647))

(assert (=> b!136974 m!209681))

(assert (=> b!136972 m!209681))

(declare-fun m!210065 () Bool)

(assert (=> b!136972 m!210065))

(declare-fun m!210067 () Bool)

(assert (=> b!136972 m!210067))

(declare-fun m!210069 () Bool)

(assert (=> b!136971 m!210069))

(declare-fun m!210071 () Bool)

(assert (=> b!136970 m!210071))

(declare-fun m!210073 () Bool)

(assert (=> d!44270 m!210073))

(declare-fun m!210075 () Bool)

(assert (=> d!44270 m!210075))

(declare-fun m!210077 () Bool)

(assert (=> d!44270 m!210077))

(declare-fun m!210079 () Bool)

(assert (=> d!44270 m!210079))

(assert (=> d!44270 m!209979))

(declare-fun m!210081 () Bool)

(assert (=> d!44270 m!210081))

(declare-fun m!210083 () Bool)

(assert (=> d!44270 m!210083))

(assert (=> d!44270 m!209657))

(assert (=> d!44270 m!209817))

(assert (=> d!44270 m!209807))

(assert (=> d!44270 m!209985))

(assert (=> b!136774 d!44270))

(declare-fun d!44272 () Bool)

(assert (=> d!44272 (= (invariant!0 (currentBit!6012 thiss!1634) (currentByte!6017 thiss!1634) (size!2811 (buf!3214 thiss!1634))) (and (bvsge (currentBit!6012 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6012 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6017 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6017 thiss!1634) (size!2811 (buf!3214 thiss!1634))) (and (= (currentBit!6012 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6017 thiss!1634) (size!2811 (buf!3214 thiss!1634)))))))))

(assert (=> b!136783 d!44272))

(declare-fun d!44274 () Bool)

(declare-fun res!114016 () Bool)

(declare-fun e!90986 () Bool)

(assert (=> d!44274 (=> res!114016 e!90986)))

(assert (=> d!44274 (= res!114016 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!44274 (= (arrayRangesEq!214 arr!237 (_2!6268 lt!212825) #b00000000000000000000000000000000 to!404) e!90986)))

(declare-fun b!136975 () Bool)

(declare-fun e!90987 () Bool)

(assert (=> b!136975 (= e!90986 e!90987)))

(declare-fun res!114017 () Bool)

(assert (=> b!136975 (=> (not res!114017) (not e!90987))))

(assert (=> b!136975 (= res!114017 (= (select (arr!3491 arr!237) #b00000000000000000000000000000000) (select (arr!3491 (_2!6268 lt!212825)) #b00000000000000000000000000000000)))))

(declare-fun b!136976 () Bool)

(assert (=> b!136976 (= e!90987 (arrayRangesEq!214 arr!237 (_2!6268 lt!212825) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!44274 (not res!114016)) b!136975))

(assert (= (and b!136975 res!114017) b!136976))

(assert (=> b!136975 m!209819))

(assert (=> b!136975 m!209993))

(declare-fun m!210085 () Bool)

(assert (=> b!136976 m!210085))

(assert (=> b!136772 d!44274))

(declare-fun d!44276 () Bool)

(assert (=> d!44276 (arrayRangesEq!214 arr!237 (_2!6268 lt!212825) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!213309 () Unit!8563)

(declare-fun choose!75 (array!6209 array!6209 array!6209 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8563)

(assert (=> d!44276 (= lt!213309 (choose!75 arr!237 (_2!6268 lt!212813) (_2!6268 lt!212825) #b00000000000000000000000000000000 to!404 to!404))))

(assert (=> d!44276 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 to!404) (bvsle to!404 to!404))))

(assert (=> d!44276 (= (arrayRangesEqTransitive!16 arr!237 (_2!6268 lt!212813) (_2!6268 lt!212825) #b00000000000000000000000000000000 to!404 to!404) lt!213309)))

(declare-fun bs!10782 () Bool)

(assert (= bs!10782 d!44276))

(assert (=> bs!10782 m!209671))

(declare-fun m!210087 () Bool)

(assert (=> bs!10782 m!210087))

(assert (=> b!136772 d!44276))

(declare-fun d!44278 () Bool)

(declare-fun res!114018 () Bool)

(declare-fun e!90988 () Bool)

(assert (=> d!44278 (=> res!114018 e!90988)))

(assert (=> d!44278 (= res!114018 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!44278 (= (arrayRangesEq!214 (_2!6268 lt!212813) (_2!6268 lt!212825) #b00000000000000000000000000000000 to!404) e!90988)))

(declare-fun b!136977 () Bool)

(declare-fun e!90989 () Bool)

(assert (=> b!136977 (= e!90988 e!90989)))

(declare-fun res!114019 () Bool)

(assert (=> b!136977 (=> (not res!114019) (not e!90989))))

(assert (=> b!136977 (= res!114019 (= (select (arr!3491 (_2!6268 lt!212813)) #b00000000000000000000000000000000) (select (arr!3491 (_2!6268 lt!212825)) #b00000000000000000000000000000000)))))

(declare-fun b!136978 () Bool)

(assert (=> b!136978 (= e!90989 (arrayRangesEq!214 (_2!6268 lt!212813) (_2!6268 lt!212825) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!44278 (not res!114018)) b!136977))

(assert (= (and b!136977 res!114019) b!136978))

(assert (=> b!136977 m!209995))

(assert (=> b!136977 m!209993))

(declare-fun m!210089 () Bool)

(assert (=> b!136978 m!210089))

(assert (=> b!136772 d!44278))

(declare-fun d!44280 () Bool)

(assert (=> d!44280 (arrayRangesEq!214 (_2!6268 lt!212813) (_2!6268 lt!212825) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!213312 () Unit!8563)

(declare-fun choose!76 (array!6209 array!6209 (_ BitVec 32) (_ BitVec 32)) Unit!8563)

(assert (=> d!44280 (= lt!213312 (choose!76 (_2!6268 lt!212825) (_2!6268 lt!212813) #b00000000000000000000000000000000 to!404))))

(assert (=> d!44280 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 to!404) (bvsle to!404 (size!2811 (_2!6268 lt!212825))))))

(assert (=> d!44280 (= (arrayRangesEqSymmetricLemma!27 (_2!6268 lt!212825) (_2!6268 lt!212813) #b00000000000000000000000000000000 to!404) lt!213312)))

(declare-fun bs!10783 () Bool)

(assert (= bs!10783 d!44280))

(assert (=> bs!10783 m!209675))

(declare-fun m!210091 () Bool)

(assert (=> bs!10783 m!210091))

(assert (=> b!136772 d!44280))

(declare-fun d!44282 () Bool)

(declare-fun e!90990 () Bool)

(assert (=> d!44282 e!90990))

(declare-fun res!114020 () Bool)

(assert (=> d!44282 (=> (not res!114020) (not e!90990))))

(declare-fun lt!213318 () (_ BitVec 64))

(declare-fun lt!213314 () (_ BitVec 64))

(declare-fun lt!213313 () (_ BitVec 64))

(assert (=> d!44282 (= res!114020 (= lt!213313 (bvsub lt!213318 lt!213314)))))

(assert (=> d!44282 (or (= (bvand lt!213318 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!213314 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!213318 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!213318 lt!213314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!44282 (= lt!213314 (remainingBits!0 ((_ sign_extend 32) (size!2811 (buf!3214 (_2!6270 lt!212827)))) ((_ sign_extend 32) (currentByte!6017 (_2!6270 lt!212827))) ((_ sign_extend 32) (currentBit!6012 (_2!6270 lt!212827)))))))

(declare-fun lt!213317 () (_ BitVec 64))

(declare-fun lt!213315 () (_ BitVec 64))

(assert (=> d!44282 (= lt!213318 (bvmul lt!213317 lt!213315))))

(assert (=> d!44282 (or (= lt!213317 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!213315 (bvsdiv (bvmul lt!213317 lt!213315) lt!213317)))))

(assert (=> d!44282 (= lt!213315 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!44282 (= lt!213317 ((_ sign_extend 32) (size!2811 (buf!3214 (_2!6270 lt!212827)))))))

(assert (=> d!44282 (= lt!213313 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6017 (_2!6270 lt!212827))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6012 (_2!6270 lt!212827)))))))

(assert (=> d!44282 (invariant!0 (currentBit!6012 (_2!6270 lt!212827)) (currentByte!6017 (_2!6270 lt!212827)) (size!2811 (buf!3214 (_2!6270 lt!212827))))))

(assert (=> d!44282 (= (bitIndex!0 (size!2811 (buf!3214 (_2!6270 lt!212827))) (currentByte!6017 (_2!6270 lt!212827)) (currentBit!6012 (_2!6270 lt!212827))) lt!213313)))

(declare-fun b!136979 () Bool)

(declare-fun res!114021 () Bool)

(assert (=> b!136979 (=> (not res!114021) (not e!90990))))

(assert (=> b!136979 (= res!114021 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!213313))))

(declare-fun b!136980 () Bool)

(declare-fun lt!213316 () (_ BitVec 64))

(assert (=> b!136980 (= e!90990 (bvsle lt!213313 (bvmul lt!213316 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!136980 (or (= lt!213316 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!213316 #b0000000000000000000000000000000000000000000000000000000000001000) lt!213316)))))

(assert (=> b!136980 (= lt!213316 ((_ sign_extend 32) (size!2811 (buf!3214 (_2!6270 lt!212827)))))))

(assert (= (and d!44282 res!114020) b!136979))

(assert (= (and b!136979 res!114021) b!136980))

(declare-fun m!210093 () Bool)

(assert (=> d!44282 m!210093))

(assert (=> d!44282 m!209669))

(assert (=> b!136773 d!44282))

(assert (=> b!136773 d!44264))

(push 1)

