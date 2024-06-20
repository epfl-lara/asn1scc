; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26738 () Bool)

(assert start!26738)

(declare-fun b!137828 () Bool)

(declare-fun res!114824 () Bool)

(declare-fun e!91636 () Bool)

(assert (=> b!137828 (=> (not res!114824) (not e!91636))))

(declare-datatypes ((array!6247 0))(
  ( (array!6248 (arr!3515 (Array (_ BitVec 32) (_ BitVec 8))) (size!2829 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4922 0))(
  ( (BitStream!4923 (buf!3236 array!6247) (currentByte!6043 (_ BitVec 32)) (currentBit!6038 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4922)

(declare-datatypes ((Unit!8605 0))(
  ( (Unit!8606) )
))
(declare-datatypes ((tuple2!12042 0))(
  ( (tuple2!12043 (_1!6344 Unit!8605) (_2!6344 BitStream!4922)) )
))
(declare-fun lt!214845 () tuple2!12042)

(declare-fun isPrefixOf!0 (BitStream!4922 BitStream!4922) Bool)

(assert (=> b!137828 (= res!114824 (isPrefixOf!0 thiss!1634 (_2!6344 lt!214845)))))

(declare-fun res!114822 () Bool)

(declare-fun e!91628 () Bool)

(assert (=> start!26738 (=> (not res!114822) (not e!91628))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun arr!237 () array!6247)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> start!26738 (= res!114822 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2829 arr!237))))))

(assert (=> start!26738 e!91628))

(assert (=> start!26738 true))

(declare-fun array_inv!2618 (array!6247) Bool)

(assert (=> start!26738 (array_inv!2618 arr!237)))

(declare-fun e!91627 () Bool)

(declare-fun inv!12 (BitStream!4922) Bool)

(assert (=> start!26738 (and (inv!12 thiss!1634) e!91627)))

(declare-fun b!137829 () Bool)

(declare-fun res!114816 () Bool)

(declare-fun e!91630 () Bool)

(assert (=> b!137829 (=> (not res!114816) (not e!91630))))

(declare-fun lt!214858 () tuple2!12042)

(assert (=> b!137829 (= res!114816 (isPrefixOf!0 (_2!6344 lt!214845) (_2!6344 lt!214858)))))

(declare-fun b!137830 () Bool)

(declare-fun e!91637 () Bool)

(declare-fun e!91631 () Bool)

(assert (=> b!137830 (= e!91637 e!91631)))

(declare-fun res!114821 () Bool)

(assert (=> b!137830 (=> res!114821 e!91631)))

(declare-fun lt!214857 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!137830 (= res!114821 (not (= (bitIndex!0 (size!2829 (buf!3236 (_2!6344 lt!214858))) (currentByte!6043 (_2!6344 lt!214858)) (currentBit!6038 (_2!6344 lt!214858))) (bvadd (bitIndex!0 (size!2829 (buf!3236 thiss!1634)) (currentByte!6043 thiss!1634) (currentBit!6038 thiss!1634)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!214857)))))))

(assert (=> b!137830 (= lt!214857 ((_ sign_extend 32) (bvsub to!404 from!447)))))

(declare-fun b!137831 () Bool)

(declare-fun res!114826 () Bool)

(assert (=> b!137831 (=> (not res!114826) (not e!91636))))

(assert (=> b!137831 (= res!114826 (= (bitIndex!0 (size!2829 (buf!3236 (_2!6344 lt!214845))) (currentByte!6043 (_2!6344 lt!214845)) (currentBit!6038 (_2!6344 lt!214845))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2829 (buf!3236 thiss!1634)) (currentByte!6043 thiss!1634) (currentBit!6038 thiss!1634)))))))

(declare-fun b!137832 () Bool)

(declare-fun e!91626 () Bool)

(assert (=> b!137832 (= e!91626 e!91637)))

(declare-fun res!114830 () Bool)

(assert (=> b!137832 (=> res!114830 e!91637)))

(assert (=> b!137832 (= res!114830 (not (= (size!2829 (buf!3236 thiss!1634)) (size!2829 (buf!3236 (_2!6344 lt!214858))))))))

(declare-datatypes ((tuple2!12044 0))(
  ( (tuple2!12045 (_1!6345 BitStream!4922) (_2!6345 array!6247)) )
))
(declare-fun lt!214866 () tuple2!12044)

(declare-fun arrayRangesEq!232 (array!6247 array!6247 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!137832 (arrayRangesEq!232 arr!237 (_2!6345 lt!214866) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!214855 () tuple2!12044)

(declare-fun lt!214848 () Unit!8605)

(declare-fun arrayRangesEqTransitive!34 (array!6247 array!6247 array!6247 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8605)

(assert (=> b!137832 (= lt!214848 (arrayRangesEqTransitive!34 arr!237 (_2!6345 lt!214855) (_2!6345 lt!214866) #b00000000000000000000000000000000 to!404 to!404))))

(assert (=> b!137832 (arrayRangesEq!232 (_2!6345 lt!214855) (_2!6345 lt!214866) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!214846 () Unit!8605)

(declare-fun arrayRangesEqSymmetricLemma!45 (array!6247 array!6247 (_ BitVec 32) (_ BitVec 32)) Unit!8605)

(assert (=> b!137832 (= lt!214846 (arrayRangesEqSymmetricLemma!45 (_2!6345 lt!214866) (_2!6345 lt!214855) #b00000000000000000000000000000000 to!404))))

(declare-fun b!137833 () Bool)

(declare-fun e!91638 () Bool)

(assert (=> b!137833 (= e!91630 (not e!91638))))

(declare-fun res!114820 () Bool)

(assert (=> b!137833 (=> res!114820 e!91638)))

(declare-datatypes ((tuple2!12046 0))(
  ( (tuple2!12047 (_1!6346 BitStream!4922) (_2!6346 BitStream!4922)) )
))
(declare-fun lt!214840 () tuple2!12046)

(declare-fun lt!214854 () tuple2!12044)

(assert (=> b!137833 (= res!114820 (or (not (= (size!2829 (_2!6345 lt!214854)) (size!2829 arr!237))) (not (= (_1!6345 lt!214854) (_2!6346 lt!214840)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4922 array!6247 (_ BitVec 32) (_ BitVec 32)) tuple2!12044)

(assert (=> b!137833 (= lt!214854 (readByteArrayLoopPure!0 (_1!6346 lt!214840) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!214841 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!137833 (validate_offset_bits!1 ((_ sign_extend 32) (size!2829 (buf!3236 (_2!6344 lt!214858)))) ((_ sign_extend 32) (currentByte!6043 (_2!6344 lt!214845))) ((_ sign_extend 32) (currentBit!6038 (_2!6344 lt!214845))) lt!214841)))

(declare-fun lt!214862 () Unit!8605)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4922 array!6247 (_ BitVec 64)) Unit!8605)

(assert (=> b!137833 (= lt!214862 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6344 lt!214845) (buf!3236 (_2!6344 lt!214858)) lt!214841))))

(declare-fun reader!0 (BitStream!4922 BitStream!4922) tuple2!12046)

(assert (=> b!137833 (= lt!214840 (reader!0 (_2!6344 lt!214845) (_2!6344 lt!214858)))))

(declare-fun b!137834 () Bool)

(assert (=> b!137834 (= e!91628 (not e!91626))))

(declare-fun res!114828 () Bool)

(assert (=> b!137834 (=> res!114828 e!91626)))

(assert (=> b!137834 (= res!114828 (not (arrayRangesEq!232 (_2!6345 lt!214866) (_2!6345 lt!214855) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!214851 () tuple2!12044)

(assert (=> b!137834 (arrayRangesEq!232 (_2!6345 lt!214866) (_2!6345 lt!214851) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!214861 () tuple2!12046)

(declare-fun lt!214864 () Unit!8605)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!4922 array!6247 (_ BitVec 32) (_ BitVec 32)) Unit!8605)

(assert (=> b!137834 (= lt!214864 (readByteArrayLoopArrayPrefixLemma!0 (_1!6346 lt!214861) arr!237 from!447 to!404))))

(declare-fun lt!214849 () array!6247)

(declare-fun withMovedByteIndex!0 (BitStream!4922 (_ BitVec 32)) BitStream!4922)

(assert (=> b!137834 (= lt!214851 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6346 lt!214861) #b00000000000000000000000000000001) lt!214849 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!214838 () tuple2!12046)

(assert (=> b!137834 (= lt!214855 (readByteArrayLoopPure!0 (_1!6346 lt!214838) lt!214849 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-datatypes ((tuple2!12048 0))(
  ( (tuple2!12049 (_1!6347 BitStream!4922) (_2!6347 (_ BitVec 8))) )
))
(declare-fun lt!214859 () tuple2!12048)

(assert (=> b!137834 (= lt!214849 (array!6248 (store (arr!3515 arr!237) from!447 (_2!6347 lt!214859)) (size!2829 arr!237)))))

(declare-fun lt!214839 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!137834 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2829 (buf!3236 (_2!6344 lt!214858)))) ((_ sign_extend 32) (currentByte!6043 (_2!6344 lt!214845))) ((_ sign_extend 32) (currentBit!6038 (_2!6344 lt!214845))) lt!214839)))

(declare-fun lt!214850 () Unit!8605)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4922 array!6247 (_ BitVec 32)) Unit!8605)

(assert (=> b!137834 (= lt!214850 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6344 lt!214845) (buf!3236 (_2!6344 lt!214858)) lt!214839))))

(assert (=> b!137834 (= (_1!6345 lt!214866) (_2!6346 lt!214861))))

(assert (=> b!137834 (= lt!214866 (readByteArrayLoopPure!0 (_1!6346 lt!214861) arr!237 from!447 to!404))))

(assert (=> b!137834 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2829 (buf!3236 (_2!6344 lt!214858)))) ((_ sign_extend 32) (currentByte!6043 thiss!1634)) ((_ sign_extend 32) (currentBit!6038 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!214865 () Unit!8605)

(assert (=> b!137834 (= lt!214865 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3236 (_2!6344 lt!214858)) (bvsub to!404 from!447)))))

(assert (=> b!137834 (= (_2!6347 lt!214859) (select (arr!3515 arr!237) from!447))))

(declare-fun readBytePure!0 (BitStream!4922) tuple2!12048)

(assert (=> b!137834 (= lt!214859 (readBytePure!0 (_1!6346 lt!214861)))))

(assert (=> b!137834 (= lt!214838 (reader!0 (_2!6344 lt!214845) (_2!6344 lt!214858)))))

(assert (=> b!137834 (= lt!214861 (reader!0 thiss!1634 (_2!6344 lt!214858)))))

(declare-fun e!91629 () Bool)

(assert (=> b!137834 e!91629))

(declare-fun res!114823 () Bool)

(assert (=> b!137834 (=> (not res!114823) (not e!91629))))

(declare-fun lt!214852 () tuple2!12048)

(declare-fun lt!214856 () tuple2!12048)

(assert (=> b!137834 (= res!114823 (= (bitIndex!0 (size!2829 (buf!3236 (_1!6347 lt!214852))) (currentByte!6043 (_1!6347 lt!214852)) (currentBit!6038 (_1!6347 lt!214852))) (bitIndex!0 (size!2829 (buf!3236 (_1!6347 lt!214856))) (currentByte!6043 (_1!6347 lt!214856)) (currentBit!6038 (_1!6347 lt!214856)))))))

(declare-fun lt!214853 () Unit!8605)

(declare-fun lt!214863 () BitStream!4922)

(declare-fun readBytePrefixLemma!0 (BitStream!4922 BitStream!4922) Unit!8605)

(assert (=> b!137834 (= lt!214853 (readBytePrefixLemma!0 lt!214863 (_2!6344 lt!214858)))))

(assert (=> b!137834 (= lt!214856 (readBytePure!0 (BitStream!4923 (buf!3236 (_2!6344 lt!214858)) (currentByte!6043 thiss!1634) (currentBit!6038 thiss!1634))))))

(assert (=> b!137834 (= lt!214852 (readBytePure!0 lt!214863))))

(assert (=> b!137834 (= lt!214863 (BitStream!4923 (buf!3236 (_2!6344 lt!214845)) (currentByte!6043 thiss!1634) (currentBit!6038 thiss!1634)))))

(declare-fun e!91633 () Bool)

(assert (=> b!137834 e!91633))

(declare-fun res!114829 () Bool)

(assert (=> b!137834 (=> (not res!114829) (not e!91633))))

(assert (=> b!137834 (= res!114829 (isPrefixOf!0 thiss!1634 (_2!6344 lt!214858)))))

(declare-fun lt!214844 () Unit!8605)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4922 BitStream!4922 BitStream!4922) Unit!8605)

(assert (=> b!137834 (= lt!214844 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6344 lt!214845) (_2!6344 lt!214858)))))

(declare-fun e!91632 () Bool)

(assert (=> b!137834 e!91632))

(declare-fun res!114827 () Bool)

(assert (=> b!137834 (=> (not res!114827) (not e!91632))))

(assert (=> b!137834 (= res!114827 (= (size!2829 (buf!3236 (_2!6344 lt!214845))) (size!2829 (buf!3236 (_2!6344 lt!214858)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4922 array!6247 (_ BitVec 32) (_ BitVec 32)) tuple2!12042)

(assert (=> b!137834 (= lt!214858 (appendByteArrayLoop!0 (_2!6344 lt!214845) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!137834 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2829 (buf!3236 (_2!6344 lt!214845)))) ((_ sign_extend 32) (currentByte!6043 (_2!6344 lt!214845))) ((_ sign_extend 32) (currentBit!6038 (_2!6344 lt!214845))) lt!214839)))

(assert (=> b!137834 (= lt!214839 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!214843 () Unit!8605)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4922 BitStream!4922 (_ BitVec 64) (_ BitVec 32)) Unit!8605)

(assert (=> b!137834 (= lt!214843 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6344 lt!214845) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!137834 e!91636))

(declare-fun res!114831 () Bool)

(assert (=> b!137834 (=> (not res!114831) (not e!91636))))

(assert (=> b!137834 (= res!114831 (= (size!2829 (buf!3236 thiss!1634)) (size!2829 (buf!3236 (_2!6344 lt!214845)))))))

(declare-fun appendByte!0 (BitStream!4922 (_ BitVec 8)) tuple2!12042)

(assert (=> b!137834 (= lt!214845 (appendByte!0 thiss!1634 (select (arr!3515 arr!237) from!447)))))

(declare-fun b!137835 () Bool)

(assert (=> b!137835 (= e!91638 (not (arrayRangesEq!232 arr!237 (_2!6345 lt!214854) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!137836 () Bool)

(declare-fun res!114817 () Bool)

(assert (=> b!137836 (=> (not res!114817) (not e!91628))))

(assert (=> b!137836 (= res!114817 (bvslt from!447 to!404))))

(declare-fun b!137837 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!137837 (= e!91633 (invariant!0 (currentBit!6038 thiss!1634) (currentByte!6043 thiss!1634) (size!2829 (buf!3236 (_2!6344 lt!214845)))))))

(declare-fun lt!214847 () tuple2!12046)

(declare-fun b!137838 () Bool)

(declare-fun lt!214842 () tuple2!12048)

(assert (=> b!137838 (= e!91636 (and (= (_2!6347 lt!214842) (select (arr!3515 arr!237) from!447)) (= (_1!6347 lt!214842) (_2!6346 lt!214847))))))

(assert (=> b!137838 (= lt!214842 (readBytePure!0 (_1!6346 lt!214847)))))

(assert (=> b!137838 (= lt!214847 (reader!0 thiss!1634 (_2!6344 lt!214845)))))

(declare-fun b!137839 () Bool)

(declare-fun res!114818 () Bool)

(assert (=> b!137839 (=> (not res!114818) (not e!91628))))

(assert (=> b!137839 (= res!114818 (invariant!0 (currentBit!6038 thiss!1634) (currentByte!6043 thiss!1634) (size!2829 (buf!3236 thiss!1634))))))

(declare-fun b!137840 () Bool)

(declare-fun res!114819 () Bool)

(assert (=> b!137840 (=> (not res!114819) (not e!91628))))

(assert (=> b!137840 (= res!114819 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2829 (buf!3236 thiss!1634))) ((_ sign_extend 32) (currentByte!6043 thiss!1634)) ((_ sign_extend 32) (currentBit!6038 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!137841 () Bool)

(assert (=> b!137841 (= e!91632 e!91630)))

(declare-fun res!114825 () Bool)

(assert (=> b!137841 (=> (not res!114825) (not e!91630))))

(assert (=> b!137841 (= res!114825 (= (bitIndex!0 (size!2829 (buf!3236 (_2!6344 lt!214858))) (currentByte!6043 (_2!6344 lt!214858)) (currentBit!6038 (_2!6344 lt!214858))) (bvadd (bitIndex!0 (size!2829 (buf!3236 (_2!6344 lt!214845))) (currentByte!6043 (_2!6344 lt!214845)) (currentBit!6038 (_2!6344 lt!214845))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!214841))))))

(assert (=> b!137841 (= lt!214841 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!137842 () Bool)

(assert (=> b!137842 (= e!91627 (array_inv!2618 (buf!3236 thiss!1634)))))

(declare-fun b!137843 () Bool)

(assert (=> b!137843 (= e!91631 true)))

(assert (=> b!137843 (validate_offset_bits!1 ((_ sign_extend 32) (size!2829 (buf!3236 (_2!6344 lt!214858)))) ((_ sign_extend 32) (currentByte!6043 thiss!1634)) ((_ sign_extend 32) (currentBit!6038 thiss!1634)) lt!214857)))

(declare-fun lt!214860 () Unit!8605)

(assert (=> b!137843 (= lt!214860 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1634 (buf!3236 (_2!6344 lt!214858)) lt!214857))))

(declare-fun b!137844 () Bool)

(assert (=> b!137844 (= e!91629 (= (_2!6347 lt!214852) (_2!6347 lt!214856)))))

(assert (= (and start!26738 res!114822) b!137840))

(assert (= (and b!137840 res!114819) b!137836))

(assert (= (and b!137836 res!114817) b!137839))

(assert (= (and b!137839 res!114818) b!137834))

(assert (= (and b!137834 res!114831) b!137831))

(assert (= (and b!137831 res!114826) b!137828))

(assert (= (and b!137828 res!114824) b!137838))

(assert (= (and b!137834 res!114827) b!137841))

(assert (= (and b!137841 res!114825) b!137829))

(assert (= (and b!137829 res!114816) b!137833))

(assert (= (and b!137833 (not res!114820)) b!137835))

(assert (= (and b!137834 res!114829) b!137837))

(assert (= (and b!137834 res!114823) b!137844))

(assert (= (and b!137834 (not res!114828)) b!137832))

(assert (= (and b!137832 (not res!114830)) b!137830))

(assert (= (and b!137830 (not res!114821)) b!137843))

(assert (= start!26738 b!137842))

(declare-fun m!211735 () Bool)

(assert (=> b!137834 m!211735))

(declare-fun m!211737 () Bool)

(assert (=> b!137834 m!211737))

(declare-fun m!211739 () Bool)

(assert (=> b!137834 m!211739))

(declare-fun m!211741 () Bool)

(assert (=> b!137834 m!211741))

(declare-fun m!211743 () Bool)

(assert (=> b!137834 m!211743))

(declare-fun m!211745 () Bool)

(assert (=> b!137834 m!211745))

(declare-fun m!211747 () Bool)

(assert (=> b!137834 m!211747))

(declare-fun m!211749 () Bool)

(assert (=> b!137834 m!211749))

(declare-fun m!211751 () Bool)

(assert (=> b!137834 m!211751))

(declare-fun m!211753 () Bool)

(assert (=> b!137834 m!211753))

(declare-fun m!211755 () Bool)

(assert (=> b!137834 m!211755))

(declare-fun m!211757 () Bool)

(assert (=> b!137834 m!211757))

(declare-fun m!211759 () Bool)

(assert (=> b!137834 m!211759))

(declare-fun m!211761 () Bool)

(assert (=> b!137834 m!211761))

(declare-fun m!211763 () Bool)

(assert (=> b!137834 m!211763))

(declare-fun m!211765 () Bool)

(assert (=> b!137834 m!211765))

(declare-fun m!211767 () Bool)

(assert (=> b!137834 m!211767))

(declare-fun m!211769 () Bool)

(assert (=> b!137834 m!211769))

(declare-fun m!211771 () Bool)

(assert (=> b!137834 m!211771))

(declare-fun m!211773 () Bool)

(assert (=> b!137834 m!211773))

(declare-fun m!211775 () Bool)

(assert (=> b!137834 m!211775))

(assert (=> b!137834 m!211745))

(declare-fun m!211777 () Bool)

(assert (=> b!137834 m!211777))

(declare-fun m!211779 () Bool)

(assert (=> b!137834 m!211779))

(declare-fun m!211781 () Bool)

(assert (=> b!137834 m!211781))

(declare-fun m!211783 () Bool)

(assert (=> b!137834 m!211783))

(declare-fun m!211785 () Bool)

(assert (=> b!137834 m!211785))

(declare-fun m!211787 () Bool)

(assert (=> b!137834 m!211787))

(assert (=> b!137834 m!211757))

(declare-fun m!211789 () Bool)

(assert (=> b!137830 m!211789))

(declare-fun m!211791 () Bool)

(assert (=> b!137830 m!211791))

(declare-fun m!211793 () Bool)

(assert (=> b!137842 m!211793))

(declare-fun m!211795 () Bool)

(assert (=> b!137828 m!211795))

(declare-fun m!211797 () Bool)

(assert (=> b!137843 m!211797))

(declare-fun m!211799 () Bool)

(assert (=> b!137843 m!211799))

(assert (=> b!137838 m!211757))

(declare-fun m!211801 () Bool)

(assert (=> b!137838 m!211801))

(declare-fun m!211803 () Bool)

(assert (=> b!137838 m!211803))

(declare-fun m!211805 () Bool)

(assert (=> b!137837 m!211805))

(declare-fun m!211807 () Bool)

(assert (=> b!137839 m!211807))

(declare-fun m!211809 () Bool)

(assert (=> start!26738 m!211809))

(declare-fun m!211811 () Bool)

(assert (=> start!26738 m!211811))

(assert (=> b!137841 m!211789))

(declare-fun m!211813 () Bool)

(assert (=> b!137841 m!211813))

(declare-fun m!211815 () Bool)

(assert (=> b!137840 m!211815))

(declare-fun m!211817 () Bool)

(assert (=> b!137833 m!211817))

(declare-fun m!211819 () Bool)

(assert (=> b!137833 m!211819))

(declare-fun m!211821 () Bool)

(assert (=> b!137833 m!211821))

(assert (=> b!137833 m!211735))

(declare-fun m!211823 () Bool)

(assert (=> b!137835 m!211823))

(declare-fun m!211825 () Bool)

(assert (=> b!137832 m!211825))

(declare-fun m!211827 () Bool)

(assert (=> b!137832 m!211827))

(declare-fun m!211829 () Bool)

(assert (=> b!137832 m!211829))

(declare-fun m!211831 () Bool)

(assert (=> b!137832 m!211831))

(assert (=> b!137831 m!211813))

(assert (=> b!137831 m!211791))

(declare-fun m!211833 () Bool)

(assert (=> b!137829 m!211833))

(push 1)

(assert (not b!137840))

(assert (not start!26738))

(assert (not b!137841))

(assert (not b!137832))

(assert (not b!137843))

(assert (not b!137839))

(assert (not b!137833))

(assert (not b!137842))

(assert (not b!137829))

(assert (not b!137835))

(assert (not b!137828))

(assert (not b!137838))

(assert (not b!137830))

(assert (not b!137834))

(assert (not b!137837))

(assert (not b!137831))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

