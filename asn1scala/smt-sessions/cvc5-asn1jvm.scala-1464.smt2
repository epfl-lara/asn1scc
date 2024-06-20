; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40196 () Bool)

(assert start!40196)

(declare-fun b!183849 () Bool)

(declare-fun e!127426 () Bool)

(declare-fun e!127421 () Bool)

(assert (=> b!183849 (= e!127426 e!127421)))

(declare-fun res!152903 () Bool)

(assert (=> b!183849 (=> (not res!152903) (not e!127421))))

(declare-fun lt!282863 () Bool)

(declare-datatypes ((array!9764 0))(
  ( (array!9765 (arr!5236 (Array (_ BitVec 32) (_ BitVec 8))) (size!4306 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7720 0))(
  ( (BitStream!7721 (buf!4761 array!9764) (currentByte!8995 (_ BitVec 32)) (currentBit!8990 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15884 0))(
  ( (tuple2!15885 (_1!8587 BitStream!7720) (_2!8587 Bool)) )
))
(declare-fun lt!282873 () tuple2!15884)

(declare-datatypes ((Unit!13187 0))(
  ( (Unit!13188) )
))
(declare-datatypes ((tuple2!15886 0))(
  ( (tuple2!15887 (_1!8588 Unit!13187) (_2!8588 BitStream!7720)) )
))
(declare-fun lt!282878 () tuple2!15886)

(assert (=> b!183849 (= res!152903 (and (= (_2!8587 lt!282873) lt!282863) (= (_1!8587 lt!282873) (_2!8588 lt!282878))))))

(declare-fun thiss!1204 () BitStream!7720)

(declare-fun readBitPure!0 (BitStream!7720) tuple2!15884)

(declare-fun readerFrom!0 (BitStream!7720 (_ BitVec 32) (_ BitVec 32)) BitStream!7720)

(assert (=> b!183849 (= lt!282873 (readBitPure!0 (readerFrom!0 (_2!8588 lt!282878) (currentBit!8990 thiss!1204) (currentByte!8995 thiss!1204))))))

(declare-fun b!183850 () Bool)

(declare-fun e!127425 () Bool)

(declare-fun lt!282854 () tuple2!15886)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!183850 (= e!127425 (invariant!0 (currentBit!8990 thiss!1204) (currentByte!8995 thiss!1204) (size!4306 (buf!4761 (_2!8588 lt!282854)))))))

(declare-fun b!183851 () Bool)

(declare-fun res!152904 () Bool)

(declare-fun e!127415 () Bool)

(assert (=> b!183851 (=> res!152904 e!127415)))

(declare-datatypes ((tuple2!15888 0))(
  ( (tuple2!15889 (_1!8589 BitStream!7720) (_2!8589 BitStream!7720)) )
))
(declare-fun lt!282860 () tuple2!15888)

(declare-fun lt!282877 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!183851 (= res!152904 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!4306 (buf!4761 (_1!8589 lt!282860)))) ((_ sign_extend 32) (currentByte!8995 (_1!8589 lt!282860))) ((_ sign_extend 32) (currentBit!8990 (_1!8589 lt!282860))) lt!282877)))))

(declare-fun res!152893 () Bool)

(declare-fun e!127418 () Bool)

(assert (=> start!40196 (=> (not res!152893) (not e!127418))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!40196 (= res!152893 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!40196 e!127418))

(assert (=> start!40196 true))

(declare-fun e!127424 () Bool)

(declare-fun inv!12 (BitStream!7720) Bool)

(assert (=> start!40196 (and (inv!12 thiss!1204) e!127424)))

(declare-fun b!183852 () Bool)

(assert (=> b!183852 (= e!127415 true)))

(declare-fun lt!282857 () (_ BitVec 64))

(declare-datatypes ((tuple2!15890 0))(
  ( (tuple2!15891 (_1!8590 BitStream!7720) (_2!8590 (_ BitVec 64))) )
))
(declare-fun lt!282861 () tuple2!15890)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7720 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!15890)

(declare-fun withMovedBitIndex!0 (BitStream!7720 (_ BitVec 64)) BitStream!7720)

(assert (=> b!183852 (= lt!282861 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8589 lt!282860) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!282857))))

(declare-fun b!183853 () Bool)

(declare-fun res!152890 () Bool)

(declare-fun e!127422 () Bool)

(assert (=> b!183853 (=> (not res!152890) (not e!127422))))

(assert (=> b!183853 (= res!152890 (invariant!0 (currentBit!8990 thiss!1204) (currentByte!8995 thiss!1204) (size!4306 (buf!4761 thiss!1204))))))

(declare-fun b!183854 () Bool)

(declare-fun res!152898 () Bool)

(assert (=> b!183854 (=> res!152898 e!127415)))

(assert (=> b!183854 (= res!152898 (bvsge i!590 nBits!348))))

(declare-fun b!183855 () Bool)

(declare-fun e!127416 () Bool)

(declare-fun lt!282866 () tuple2!15884)

(declare-fun lt!282853 () tuple2!15884)

(assert (=> b!183855 (= e!127416 (= (_2!8587 lt!282866) (_2!8587 lt!282853)))))

(declare-fun b!183856 () Bool)

(declare-fun res!152905 () Bool)

(declare-fun e!127419 () Bool)

(assert (=> b!183856 (=> res!152905 e!127419)))

(declare-fun lt!282867 () (_ BitVec 64))

(declare-fun lt!282871 () (_ BitVec 64))

(assert (=> b!183856 (= res!152905 (or (not (= (size!4306 (buf!4761 (_2!8588 lt!282854))) (size!4306 (buf!4761 thiss!1204)))) (not (= lt!282867 (bvsub (bvadd lt!282871 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!183857 () Bool)

(declare-fun res!152907 () Bool)

(assert (=> b!183857 (=> res!152907 e!127415)))

(declare-fun lt!282862 () (_ BitVec 64))

(assert (=> b!183857 (= res!152907 (not (= (bvand lt!282862 #b1111111111111111111111111111111111111111111111111111111111111111) lt!282862)))))

(declare-fun b!183858 () Bool)

(assert (=> b!183858 (= e!127418 e!127422)))

(declare-fun res!152889 () Bool)

(assert (=> b!183858 (=> (not res!152889) (not e!127422))))

(assert (=> b!183858 (= res!152889 (validate_offset_bits!1 ((_ sign_extend 32) (size!4306 (buf!4761 thiss!1204))) ((_ sign_extend 32) (currentByte!8995 thiss!1204)) ((_ sign_extend 32) (currentBit!8990 thiss!1204)) lt!282877))))

(assert (=> b!183858 (= lt!282877 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!183859 () Bool)

(declare-fun res!152887 () Bool)

(assert (=> b!183859 (=> res!152887 e!127419)))

(assert (=> b!183859 (= res!152887 (not (invariant!0 (currentBit!8990 (_2!8588 lt!282854)) (currentByte!8995 (_2!8588 lt!282854)) (size!4306 (buf!4761 (_2!8588 lt!282854))))))))

(declare-fun b!183860 () Bool)

(declare-fun e!127417 () Bool)

(assert (=> b!183860 (= e!127417 e!127426)))

(declare-fun res!152891 () Bool)

(assert (=> b!183860 (=> (not res!152891) (not e!127426))))

(declare-fun lt!282858 () (_ BitVec 64))

(declare-fun lt!282876 () (_ BitVec 64))

(assert (=> b!183860 (= res!152891 (= lt!282858 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!282876)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!183860 (= lt!282858 (bitIndex!0 (size!4306 (buf!4761 (_2!8588 lt!282878))) (currentByte!8995 (_2!8588 lt!282878)) (currentBit!8990 (_2!8588 lt!282878))))))

(assert (=> b!183860 (= lt!282876 (bitIndex!0 (size!4306 (buf!4761 thiss!1204)) (currentByte!8995 thiss!1204) (currentBit!8990 thiss!1204)))))

(declare-fun b!183861 () Bool)

(assert (=> b!183861 (= e!127419 e!127415)))

(declare-fun res!152902 () Bool)

(assert (=> b!183861 (=> res!152902 e!127415)))

(declare-fun lt!282859 () tuple2!15888)

(assert (=> b!183861 (= res!152902 (not (= (_1!8590 (readNBitsLSBFirstsLoopPure!0 (_1!8589 lt!282859) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!282857)) (_2!8589 lt!282859))))))

(declare-fun lt!282855 () (_ BitVec 64))

(assert (=> b!183861 (validate_offset_bits!1 ((_ sign_extend 32) (size!4306 (buf!4761 (_2!8588 lt!282854)))) ((_ sign_extend 32) (currentByte!8995 (_2!8588 lt!282878))) ((_ sign_extend 32) (currentBit!8990 (_2!8588 lt!282878))) lt!282855)))

(declare-fun lt!282870 () Unit!13187)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7720 array!9764 (_ BitVec 64)) Unit!13187)

(assert (=> b!183861 (= lt!282870 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8588 lt!282878) (buf!4761 (_2!8588 lt!282854)) lt!282855))))

(assert (=> b!183861 (= lt!282855 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!282856 () tuple2!15884)

(declare-fun lt!282875 () (_ BitVec 64))

(assert (=> b!183861 (= lt!282857 (bvor lt!282862 (ite (_2!8587 lt!282856) lt!282875 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!282864 () tuple2!15890)

(assert (=> b!183861 (= lt!282864 (readNBitsLSBFirstsLoopPure!0 (_1!8589 lt!282860) nBits!348 i!590 lt!282862))))

(assert (=> b!183861 (validate_offset_bits!1 ((_ sign_extend 32) (size!4306 (buf!4761 (_2!8588 lt!282854)))) ((_ sign_extend 32) (currentByte!8995 thiss!1204)) ((_ sign_extend 32) (currentBit!8990 thiss!1204)) lt!282877)))

(declare-fun lt!282865 () Unit!13187)

(assert (=> b!183861 (= lt!282865 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4761 (_2!8588 lt!282854)) lt!282877))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!183861 (= lt!282862 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!183861 (= (_2!8587 lt!282856) lt!282863)))

(assert (=> b!183861 (= lt!282856 (readBitPure!0 (_1!8589 lt!282860)))))

(declare-fun reader!0 (BitStream!7720 BitStream!7720) tuple2!15888)

(assert (=> b!183861 (= lt!282859 (reader!0 (_2!8588 lt!282878) (_2!8588 lt!282854)))))

(assert (=> b!183861 (= lt!282860 (reader!0 thiss!1204 (_2!8588 lt!282854)))))

(assert (=> b!183861 e!127416))

(declare-fun res!152895 () Bool)

(assert (=> b!183861 (=> (not res!152895) (not e!127416))))

(assert (=> b!183861 (= res!152895 (= (bitIndex!0 (size!4306 (buf!4761 (_1!8587 lt!282866))) (currentByte!8995 (_1!8587 lt!282866)) (currentBit!8990 (_1!8587 lt!282866))) (bitIndex!0 (size!4306 (buf!4761 (_1!8587 lt!282853))) (currentByte!8995 (_1!8587 lt!282853)) (currentBit!8990 (_1!8587 lt!282853)))))))

(declare-fun lt!282872 () Unit!13187)

(declare-fun lt!282868 () BitStream!7720)

(declare-fun readBitPrefixLemma!0 (BitStream!7720 BitStream!7720) Unit!13187)

(assert (=> b!183861 (= lt!282872 (readBitPrefixLemma!0 lt!282868 (_2!8588 lt!282854)))))

(assert (=> b!183861 (= lt!282853 (readBitPure!0 (BitStream!7721 (buf!4761 (_2!8588 lt!282854)) (currentByte!8995 thiss!1204) (currentBit!8990 thiss!1204))))))

(assert (=> b!183861 (= lt!282866 (readBitPure!0 lt!282868))))

(assert (=> b!183861 e!127425))

(declare-fun res!152900 () Bool)

(assert (=> b!183861 (=> (not res!152900) (not e!127425))))

(assert (=> b!183861 (= res!152900 (invariant!0 (currentBit!8990 thiss!1204) (currentByte!8995 thiss!1204) (size!4306 (buf!4761 (_2!8588 lt!282878)))))))

(assert (=> b!183861 (= lt!282868 (BitStream!7721 (buf!4761 (_2!8588 lt!282878)) (currentByte!8995 thiss!1204) (currentBit!8990 thiss!1204)))))

(declare-fun b!183862 () Bool)

(declare-fun array_inv!4047 (array!9764) Bool)

(assert (=> b!183862 (= e!127424 (array_inv!4047 (buf!4761 thiss!1204)))))

(declare-fun b!183863 () Bool)

(assert (=> b!183863 (= e!127421 (= (bitIndex!0 (size!4306 (buf!4761 (_1!8587 lt!282873))) (currentByte!8995 (_1!8587 lt!282873)) (currentBit!8990 (_1!8587 lt!282873))) lt!282858))))

(declare-fun b!183864 () Bool)

(declare-fun e!127420 () Bool)

(assert (=> b!183864 (= e!127422 (not e!127420))))

(declare-fun res!152888 () Bool)

(assert (=> b!183864 (=> res!152888 e!127420)))

(declare-fun lt!282869 () (_ BitVec 64))

(assert (=> b!183864 (= res!152888 (not (= lt!282869 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!282871))))))

(assert (=> b!183864 (= lt!282869 (bitIndex!0 (size!4306 (buf!4761 (_2!8588 lt!282878))) (currentByte!8995 (_2!8588 lt!282878)) (currentBit!8990 (_2!8588 lt!282878))))))

(assert (=> b!183864 (= lt!282871 (bitIndex!0 (size!4306 (buf!4761 thiss!1204)) (currentByte!8995 thiss!1204) (currentBit!8990 thiss!1204)))))

(assert (=> b!183864 e!127417))

(declare-fun res!152894 () Bool)

(assert (=> b!183864 (=> (not res!152894) (not e!127417))))

(assert (=> b!183864 (= res!152894 (= (size!4306 (buf!4761 thiss!1204)) (size!4306 (buf!4761 (_2!8588 lt!282878)))))))

(declare-fun appendBit!0 (BitStream!7720 Bool) tuple2!15886)

(assert (=> b!183864 (= lt!282878 (appendBit!0 thiss!1204 lt!282863))))

(assert (=> b!183864 (= lt!282863 (not (= (bvand v!189 lt!282875) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!183864 (= lt!282875 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!183865 () Bool)

(declare-fun res!152901 () Bool)

(assert (=> b!183865 (=> res!152901 e!127415)))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!183865 (= res!152901 (not (= (bvand lt!282862 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!183866 () Bool)

(assert (=> b!183866 (= e!127420 e!127419)))

(declare-fun res!152906 () Bool)

(assert (=> b!183866 (=> res!152906 e!127419)))

(assert (=> b!183866 (= res!152906 (not (= lt!282867 (bvsub (bvsub (bvadd lt!282869 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!183866 (= lt!282867 (bitIndex!0 (size!4306 (buf!4761 (_2!8588 lt!282854))) (currentByte!8995 (_2!8588 lt!282854)) (currentBit!8990 (_2!8588 lt!282854))))))

(declare-fun isPrefixOf!0 (BitStream!7720 BitStream!7720) Bool)

(assert (=> b!183866 (isPrefixOf!0 thiss!1204 (_2!8588 lt!282854))))

(declare-fun lt!282874 () Unit!13187)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7720 BitStream!7720 BitStream!7720) Unit!13187)

(assert (=> b!183866 (= lt!282874 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8588 lt!282878) (_2!8588 lt!282854)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7720 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15886)

(assert (=> b!183866 (= lt!282854 (appendBitsLSBFirstLoopTR!0 (_2!8588 lt!282878) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!183867 () Bool)

(declare-fun res!152896 () Bool)

(assert (=> b!183867 (=> (not res!152896) (not e!127426))))

(assert (=> b!183867 (= res!152896 (isPrefixOf!0 thiss!1204 (_2!8588 lt!282878)))))

(declare-fun b!183868 () Bool)

(declare-fun res!152899 () Bool)

(assert (=> b!183868 (=> (not res!152899) (not e!127422))))

(assert (=> b!183868 (= res!152899 (not (= i!590 nBits!348)))))

(declare-fun b!183869 () Bool)

(declare-fun res!152892 () Bool)

(assert (=> b!183869 (=> res!152892 e!127419)))

(assert (=> b!183869 (= res!152892 (not (isPrefixOf!0 (_2!8588 lt!282878) (_2!8588 lt!282854))))))

(declare-fun b!183870 () Bool)

(declare-fun res!152897 () Bool)

(assert (=> b!183870 (=> res!152897 e!127419)))

(assert (=> b!183870 (= res!152897 (not (isPrefixOf!0 thiss!1204 (_2!8588 lt!282878))))))

(assert (= (and start!40196 res!152893) b!183858))

(assert (= (and b!183858 res!152889) b!183853))

(assert (= (and b!183853 res!152890) b!183868))

(assert (= (and b!183868 res!152899) b!183864))

(assert (= (and b!183864 res!152894) b!183860))

(assert (= (and b!183860 res!152891) b!183867))

(assert (= (and b!183867 res!152896) b!183849))

(assert (= (and b!183849 res!152903) b!183863))

(assert (= (and b!183864 (not res!152888)) b!183866))

(assert (= (and b!183866 (not res!152906)) b!183859))

(assert (= (and b!183859 (not res!152887)) b!183856))

(assert (= (and b!183856 (not res!152905)) b!183869))

(assert (= (and b!183869 (not res!152892)) b!183870))

(assert (= (and b!183870 (not res!152897)) b!183861))

(assert (= (and b!183861 res!152900) b!183850))

(assert (= (and b!183861 res!152895) b!183855))

(assert (= (and b!183861 (not res!152902)) b!183854))

(assert (= (and b!183854 (not res!152898)) b!183851))

(assert (= (and b!183851 (not res!152904)) b!183865))

(assert (= (and b!183865 (not res!152901)) b!183857))

(assert (= (and b!183857 (not res!152907)) b!183852))

(assert (= start!40196 b!183862))

(declare-fun m!285829 () Bool)

(assert (=> b!183858 m!285829))

(declare-fun m!285831 () Bool)

(assert (=> b!183851 m!285831))

(declare-fun m!285833 () Bool)

(assert (=> b!183850 m!285833))

(declare-fun m!285835 () Bool)

(assert (=> b!183864 m!285835))

(declare-fun m!285837 () Bool)

(assert (=> b!183864 m!285837))

(declare-fun m!285839 () Bool)

(assert (=> b!183864 m!285839))

(declare-fun m!285841 () Bool)

(assert (=> b!183863 m!285841))

(declare-fun m!285843 () Bool)

(assert (=> b!183869 m!285843))

(assert (=> b!183860 m!285835))

(assert (=> b!183860 m!285837))

(declare-fun m!285845 () Bool)

(assert (=> b!183861 m!285845))

(declare-fun m!285847 () Bool)

(assert (=> b!183861 m!285847))

(declare-fun m!285849 () Bool)

(assert (=> b!183861 m!285849))

(declare-fun m!285851 () Bool)

(assert (=> b!183861 m!285851))

(declare-fun m!285853 () Bool)

(assert (=> b!183861 m!285853))

(declare-fun m!285855 () Bool)

(assert (=> b!183861 m!285855))

(declare-fun m!285857 () Bool)

(assert (=> b!183861 m!285857))

(declare-fun m!285859 () Bool)

(assert (=> b!183861 m!285859))

(declare-fun m!285861 () Bool)

(assert (=> b!183861 m!285861))

(declare-fun m!285863 () Bool)

(assert (=> b!183861 m!285863))

(declare-fun m!285865 () Bool)

(assert (=> b!183861 m!285865))

(declare-fun m!285867 () Bool)

(assert (=> b!183861 m!285867))

(declare-fun m!285869 () Bool)

(assert (=> b!183861 m!285869))

(declare-fun m!285871 () Bool)

(assert (=> b!183861 m!285871))

(declare-fun m!285873 () Bool)

(assert (=> b!183861 m!285873))

(declare-fun m!285875 () Bool)

(assert (=> b!183861 m!285875))

(declare-fun m!285877 () Bool)

(assert (=> b!183867 m!285877))

(declare-fun m!285879 () Bool)

(assert (=> b!183865 m!285879))

(declare-fun m!285881 () Bool)

(assert (=> b!183849 m!285881))

(assert (=> b!183849 m!285881))

(declare-fun m!285883 () Bool)

(assert (=> b!183849 m!285883))

(declare-fun m!285885 () Bool)

(assert (=> b!183853 m!285885))

(declare-fun m!285887 () Bool)

(assert (=> b!183859 m!285887))

(declare-fun m!285889 () Bool)

(assert (=> b!183862 m!285889))

(declare-fun m!285891 () Bool)

(assert (=> b!183852 m!285891))

(assert (=> b!183852 m!285891))

(declare-fun m!285893 () Bool)

(assert (=> b!183852 m!285893))

(assert (=> b!183870 m!285877))

(declare-fun m!285895 () Bool)

(assert (=> b!183866 m!285895))

(declare-fun m!285897 () Bool)

(assert (=> b!183866 m!285897))

(declare-fun m!285899 () Bool)

(assert (=> b!183866 m!285899))

(declare-fun m!285901 () Bool)

(assert (=> b!183866 m!285901))

(declare-fun m!285903 () Bool)

(assert (=> start!40196 m!285903))

(push 1)

