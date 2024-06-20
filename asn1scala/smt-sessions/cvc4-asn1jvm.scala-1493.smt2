; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41292 () Bool)

(assert start!41292)

(declare-fun b!192887 () Bool)

(declare-fun e!132860 () Bool)

(declare-datatypes ((array!9966 0))(
  ( (array!9967 (arr!5325 (Array (_ BitVec 32) (_ BitVec 8))) (size!4395 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7898 0))(
  ( (BitStream!7899 (buf!4875 array!9966) (currentByte!9159 (_ BitVec 32)) (currentBit!9154 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!16692 0))(
  ( (tuple2!16693 (_1!8991 BitStream!7898) (_2!8991 Bool)) )
))
(declare-fun lt!299678 () tuple2!16692)

(declare-fun lt!299670 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!192887 (= e!132860 (= (bitIndex!0 (size!4395 (buf!4875 (_1!8991 lt!299678))) (currentByte!9159 (_1!8991 lt!299678)) (currentBit!9154 (_1!8991 lt!299678))) lt!299670))))

(declare-fun b!192888 () Bool)

(declare-fun e!132865 () Bool)

(declare-fun e!132861 () Bool)

(assert (=> b!192888 (= e!132865 e!132861)))

(declare-fun res!161160 () Bool)

(assert (=> b!192888 (=> (not res!161160) (not e!132861))))

(declare-fun thiss!1204 () BitStream!7898)

(declare-fun lt!299680 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!192888 (= res!161160 (validate_offset_bits!1 ((_ sign_extend 32) (size!4395 (buf!4875 thiss!1204))) ((_ sign_extend 32) (currentByte!9159 thiss!1204)) ((_ sign_extend 32) (currentBit!9154 thiss!1204)) lt!299680))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!192888 (= lt!299680 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!192889 () Bool)

(declare-fun e!132862 () Bool)

(declare-fun e!132854 () Bool)

(assert (=> b!192889 (= e!132862 e!132854)))

(declare-fun res!161143 () Bool)

(assert (=> b!192889 (=> res!161143 e!132854)))

(declare-datatypes ((tuple2!16694 0))(
  ( (tuple2!16695 (_1!8992 BitStream!7898) (_2!8992 BitStream!7898)) )
))
(declare-fun lt!299672 () tuple2!16694)

(declare-fun lt!299688 () BitStream!7898)

(assert (=> b!192889 (= res!161143 (not (= (_1!8992 lt!299672) lt!299688)))))

(declare-fun e!132853 () Bool)

(assert (=> b!192889 e!132853))

(declare-fun res!161164 () Bool)

(assert (=> b!192889 (=> (not res!161164) (not e!132853))))

(declare-datatypes ((tuple2!16696 0))(
  ( (tuple2!16697 (_1!8993 BitStream!7898) (_2!8993 (_ BitVec 64))) )
))
(declare-fun lt!299687 () tuple2!16696)

(declare-fun lt!299668 () tuple2!16696)

(assert (=> b!192889 (= res!161164 (and (= (_2!8993 lt!299687) (_2!8993 lt!299668)) (= (_1!8993 lt!299687) (_1!8993 lt!299668))))))

(declare-fun lt!299686 () tuple2!16694)

(declare-fun lt!299682 () (_ BitVec 64))

(declare-datatypes ((Unit!13667 0))(
  ( (Unit!13668) )
))
(declare-fun lt!299681 () Unit!13667)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7898 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13667)

(assert (=> b!192889 (= lt!299681 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8992 lt!299686) nBits!348 i!590 lt!299682))))

(declare-fun lt!299683 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7898 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16696)

(assert (=> b!192889 (= lt!299668 (readNBitsLSBFirstsLoopPure!0 lt!299688 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!299683))))

(declare-fun withMovedBitIndex!0 (BitStream!7898 (_ BitVec 64)) BitStream!7898)

(assert (=> b!192889 (= lt!299688 (withMovedBitIndex!0 (_1!8992 lt!299686) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!192890 () Bool)

(declare-fun e!132864 () Bool)

(declare-fun e!132856 () Bool)

(assert (=> b!192890 (= e!132864 e!132856)))

(declare-fun res!161155 () Bool)

(assert (=> b!192890 (=> res!161155 e!132856)))

(declare-fun lt!299690 () (_ BitVec 64))

(declare-fun lt!299667 () (_ BitVec 64))

(assert (=> b!192890 (= res!161155 (not (= lt!299667 (bvsub (bvsub (bvadd lt!299690 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-datatypes ((tuple2!16698 0))(
  ( (tuple2!16699 (_1!8994 Unit!13667) (_2!8994 BitStream!7898)) )
))
(declare-fun lt!299694 () tuple2!16698)

(assert (=> b!192890 (= lt!299667 (bitIndex!0 (size!4395 (buf!4875 (_2!8994 lt!299694))) (currentByte!9159 (_2!8994 lt!299694)) (currentBit!9154 (_2!8994 lt!299694))))))

(declare-fun isPrefixOf!0 (BitStream!7898 BitStream!7898) Bool)

(assert (=> b!192890 (isPrefixOf!0 thiss!1204 (_2!8994 lt!299694))))

(declare-fun lt!299677 () tuple2!16698)

(declare-fun lt!299674 () Unit!13667)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7898 BitStream!7898 BitStream!7898) Unit!13667)

(assert (=> b!192890 (= lt!299674 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8994 lt!299677) (_2!8994 lt!299694)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7898 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!16698)

(assert (=> b!192890 (= lt!299694 (appendBitsLSBFirstLoopTR!0 (_2!8994 lt!299677) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!192891 () Bool)

(declare-fun res!161156 () Bool)

(assert (=> b!192891 (=> res!161156 e!132854)))

(assert (=> b!192891 (= res!161156 (not (= (bitIndex!0 (size!4395 (buf!4875 (_1!8993 lt!299687))) (currentByte!9159 (_1!8993 lt!299687)) (currentBit!9154 (_1!8993 lt!299687))) (bitIndex!0 (size!4395 (buf!4875 (_2!8992 lt!299686))) (currentByte!9159 (_2!8992 lt!299686)) (currentBit!9154 (_2!8992 lt!299686))))))))

(declare-fun b!192892 () Bool)

(assert (=> b!192892 (= e!132854 true)))

(declare-fun e!132858 () Bool)

(assert (=> b!192892 e!132858))

(declare-fun res!161147 () Bool)

(assert (=> b!192892 (=> (not res!161147) (not e!132858))))

(assert (=> b!192892 (= res!161147 (= (size!4395 (buf!4875 thiss!1204)) (size!4395 (buf!4875 (_2!8994 lt!299694)))))))

(declare-fun b!192893 () Bool)

(declare-fun res!161166 () Bool)

(assert (=> b!192893 (=> (not res!161166) (not e!132853))))

(declare-fun lt!299673 () (_ BitVec 64))

(assert (=> b!192893 (= res!161166 (= (_1!8992 lt!299686) (withMovedBitIndex!0 (_2!8992 lt!299686) (bvsub lt!299673 lt!299667))))))

(declare-fun b!192894 () Bool)

(declare-fun res!161163 () Bool)

(assert (=> b!192894 (=> res!161163 e!132856)))

(assert (=> b!192894 (= res!161163 (not (isPrefixOf!0 thiss!1204 (_2!8994 lt!299677))))))

(declare-fun b!192895 () Bool)

(declare-fun res!161151 () Bool)

(assert (=> b!192895 (=> res!161151 e!132856)))

(assert (=> b!192895 (= res!161151 (or (not (= (size!4395 (buf!4875 (_2!8994 lt!299694))) (size!4395 (buf!4875 thiss!1204)))) (not (= lt!299667 (bvsub (bvadd lt!299673 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!192896 () Bool)

(declare-fun res!161146 () Bool)

(assert (=> b!192896 (=> (not res!161146) (not e!132853))))

(assert (=> b!192896 (= res!161146 (= (_1!8992 lt!299672) (withMovedBitIndex!0 (_2!8992 lt!299672) (bvsub lt!299690 lt!299667))))))

(declare-fun b!192897 () Bool)

(declare-fun res!161152 () Bool)

(assert (=> b!192897 (=> res!161152 e!132856)))

(assert (=> b!192897 (= res!161152 (not (isPrefixOf!0 (_2!8994 lt!299677) (_2!8994 lt!299694))))))

(declare-fun b!192898 () Bool)

(declare-fun res!161144 () Bool)

(assert (=> b!192898 (=> (not res!161144) (not e!132861))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!192898 (= res!161144 (invariant!0 (currentBit!9154 thiss!1204) (currentByte!9159 thiss!1204) (size!4395 (buf!4875 thiss!1204))))))

(declare-fun b!192899 () Bool)

(assert (=> b!192899 (= e!132861 (not e!132864))))

(declare-fun res!161159 () Bool)

(assert (=> b!192899 (=> res!161159 e!132864)))

(assert (=> b!192899 (= res!161159 (not (= lt!299690 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!299673))))))

(assert (=> b!192899 (= lt!299690 (bitIndex!0 (size!4395 (buf!4875 (_2!8994 lt!299677))) (currentByte!9159 (_2!8994 lt!299677)) (currentBit!9154 (_2!8994 lt!299677))))))

(assert (=> b!192899 (= lt!299673 (bitIndex!0 (size!4395 (buf!4875 thiss!1204)) (currentByte!9159 thiss!1204) (currentBit!9154 thiss!1204)))))

(declare-fun e!132866 () Bool)

(assert (=> b!192899 e!132866))

(declare-fun res!161150 () Bool)

(assert (=> b!192899 (=> (not res!161150) (not e!132866))))

(assert (=> b!192899 (= res!161150 (= (size!4395 (buf!4875 thiss!1204)) (size!4395 (buf!4875 (_2!8994 lt!299677)))))))

(declare-fun lt!299693 () Bool)

(declare-fun appendBit!0 (BitStream!7898 Bool) tuple2!16698)

(assert (=> b!192899 (= lt!299677 (appendBit!0 thiss!1204 lt!299693))))

(declare-fun lt!299676 () (_ BitVec 64))

(assert (=> b!192899 (= lt!299693 (not (= (bvand v!189 lt!299676) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!192899 (= lt!299676 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!192900 () Bool)

(assert (=> b!192900 (= e!132858 (= (_1!8993 lt!299687) (_2!8992 lt!299686)))))

(declare-fun b!192901 () Bool)

(declare-fun res!161162 () Bool)

(assert (=> b!192901 (=> (not res!161162) (not e!132858))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!192901 (= res!161162 (= (_2!8993 lt!299687) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun b!192902 () Bool)

(declare-fun res!161148 () Bool)

(declare-fun e!132855 () Bool)

(assert (=> b!192902 (=> (not res!161148) (not e!132855))))

(assert (=> b!192902 (= res!161148 (isPrefixOf!0 thiss!1204 (_2!8994 lt!299677)))))

(declare-fun b!192903 () Bool)

(assert (=> b!192903 (= e!132856 e!132862)))

(declare-fun res!161154 () Bool)

(assert (=> b!192903 (=> res!161154 e!132862)))

(declare-fun lt!299671 () tuple2!16696)

(assert (=> b!192903 (= res!161154 (not (= (_1!8993 lt!299671) (_2!8992 lt!299672))))))

(assert (=> b!192903 (= lt!299671 (readNBitsLSBFirstsLoopPure!0 (_1!8992 lt!299672) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!299683))))

(declare-fun lt!299692 () (_ BitVec 64))

(assert (=> b!192903 (validate_offset_bits!1 ((_ sign_extend 32) (size!4395 (buf!4875 (_2!8994 lt!299694)))) ((_ sign_extend 32) (currentByte!9159 (_2!8994 lt!299677))) ((_ sign_extend 32) (currentBit!9154 (_2!8994 lt!299677))) lt!299692)))

(declare-fun lt!299689 () Unit!13667)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7898 array!9966 (_ BitVec 64)) Unit!13667)

(assert (=> b!192903 (= lt!299689 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8994 lt!299677) (buf!4875 (_2!8994 lt!299694)) lt!299692))))

(assert (=> b!192903 (= lt!299692 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!299669 () tuple2!16692)

(assert (=> b!192903 (= lt!299683 (bvor lt!299682 (ite (_2!8991 lt!299669) lt!299676 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!192903 (= lt!299687 (readNBitsLSBFirstsLoopPure!0 (_1!8992 lt!299686) nBits!348 i!590 lt!299682))))

(assert (=> b!192903 (validate_offset_bits!1 ((_ sign_extend 32) (size!4395 (buf!4875 (_2!8994 lt!299694)))) ((_ sign_extend 32) (currentByte!9159 thiss!1204)) ((_ sign_extend 32) (currentBit!9154 thiss!1204)) lt!299680)))

(declare-fun lt!299691 () Unit!13667)

(assert (=> b!192903 (= lt!299691 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4875 (_2!8994 lt!299694)) lt!299680))))

(assert (=> b!192903 (= lt!299682 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!192903 (= (_2!8991 lt!299669) lt!299693)))

(declare-fun readBitPure!0 (BitStream!7898) tuple2!16692)

(assert (=> b!192903 (= lt!299669 (readBitPure!0 (_1!8992 lt!299686)))))

(declare-fun reader!0 (BitStream!7898 BitStream!7898) tuple2!16694)

(assert (=> b!192903 (= lt!299672 (reader!0 (_2!8994 lt!299677) (_2!8994 lt!299694)))))

(assert (=> b!192903 (= lt!299686 (reader!0 thiss!1204 (_2!8994 lt!299694)))))

(declare-fun e!132859 () Bool)

(assert (=> b!192903 e!132859))

(declare-fun res!161158 () Bool)

(assert (=> b!192903 (=> (not res!161158) (not e!132859))))

(declare-fun lt!299684 () tuple2!16692)

(declare-fun lt!299679 () tuple2!16692)

(assert (=> b!192903 (= res!161158 (= (bitIndex!0 (size!4395 (buf!4875 (_1!8991 lt!299684))) (currentByte!9159 (_1!8991 lt!299684)) (currentBit!9154 (_1!8991 lt!299684))) (bitIndex!0 (size!4395 (buf!4875 (_1!8991 lt!299679))) (currentByte!9159 (_1!8991 lt!299679)) (currentBit!9154 (_1!8991 lt!299679)))))))

(declare-fun lt!299685 () Unit!13667)

(declare-fun lt!299695 () BitStream!7898)

(declare-fun readBitPrefixLemma!0 (BitStream!7898 BitStream!7898) Unit!13667)

(assert (=> b!192903 (= lt!299685 (readBitPrefixLemma!0 lt!299695 (_2!8994 lt!299694)))))

(assert (=> b!192903 (= lt!299679 (readBitPure!0 (BitStream!7899 (buf!4875 (_2!8994 lt!299694)) (currentByte!9159 thiss!1204) (currentBit!9154 thiss!1204))))))

(assert (=> b!192903 (= lt!299684 (readBitPure!0 lt!299695))))

(declare-fun e!132852 () Bool)

(assert (=> b!192903 e!132852))

(declare-fun res!161149 () Bool)

(assert (=> b!192903 (=> (not res!161149) (not e!132852))))

(assert (=> b!192903 (= res!161149 (invariant!0 (currentBit!9154 thiss!1204) (currentByte!9159 thiss!1204) (size!4395 (buf!4875 (_2!8994 lt!299677)))))))

(assert (=> b!192903 (= lt!299695 (BitStream!7899 (buf!4875 (_2!8994 lt!299677)) (currentByte!9159 thiss!1204) (currentBit!9154 thiss!1204)))))

(declare-fun b!192904 () Bool)

(assert (=> b!192904 (= e!132855 e!132860)))

(declare-fun res!161145 () Bool)

(assert (=> b!192904 (=> (not res!161145) (not e!132860))))

(assert (=> b!192904 (= res!161145 (and (= (_2!8991 lt!299678) lt!299693) (= (_1!8991 lt!299678) (_2!8994 lt!299677))))))

(declare-fun readerFrom!0 (BitStream!7898 (_ BitVec 32) (_ BitVec 32)) BitStream!7898)

(assert (=> b!192904 (= lt!299678 (readBitPure!0 (readerFrom!0 (_2!8994 lt!299677) (currentBit!9154 thiss!1204) (currentByte!9159 thiss!1204))))))

(declare-fun b!192905 () Bool)

(assert (=> b!192905 (= e!132852 (invariant!0 (currentBit!9154 thiss!1204) (currentByte!9159 thiss!1204) (size!4395 (buf!4875 (_2!8994 lt!299694)))))))

(declare-fun res!161165 () Bool)

(assert (=> start!41292 (=> (not res!161165) (not e!132865))))

(assert (=> start!41292 (= res!161165 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!41292 e!132865))

(assert (=> start!41292 true))

(declare-fun e!132863 () Bool)

(declare-fun inv!12 (BitStream!7898) Bool)

(assert (=> start!41292 (and (inv!12 thiss!1204) e!132863)))

(declare-fun b!192906 () Bool)

(declare-fun res!161153 () Bool)

(assert (=> b!192906 (=> res!161153 e!132856)))

(assert (=> b!192906 (= res!161153 (not (invariant!0 (currentBit!9154 (_2!8994 lt!299694)) (currentByte!9159 (_2!8994 lt!299694)) (size!4395 (buf!4875 (_2!8994 lt!299694))))))))

(declare-fun b!192907 () Bool)

(assert (=> b!192907 (= e!132866 e!132855)))

(declare-fun res!161157 () Bool)

(assert (=> b!192907 (=> (not res!161157) (not e!132855))))

(declare-fun lt!299675 () (_ BitVec 64))

(assert (=> b!192907 (= res!161157 (= lt!299670 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!299675)))))

(assert (=> b!192907 (= lt!299670 (bitIndex!0 (size!4395 (buf!4875 (_2!8994 lt!299677))) (currentByte!9159 (_2!8994 lt!299677)) (currentBit!9154 (_2!8994 lt!299677))))))

(assert (=> b!192907 (= lt!299675 (bitIndex!0 (size!4395 (buf!4875 thiss!1204)) (currentByte!9159 thiss!1204) (currentBit!9154 thiss!1204)))))

(declare-fun b!192908 () Bool)

(assert (=> b!192908 (= e!132853 (and (= lt!299673 (bvsub lt!299690 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!8992 lt!299672) lt!299688)) (= (_2!8993 lt!299687) (_2!8993 lt!299671)))))))

(declare-fun b!192909 () Bool)

(declare-fun res!161161 () Bool)

(assert (=> b!192909 (=> (not res!161161) (not e!132861))))

(assert (=> b!192909 (= res!161161 (not (= i!590 nBits!348)))))

(declare-fun b!192910 () Bool)

(declare-fun array_inv!4136 (array!9966) Bool)

(assert (=> b!192910 (= e!132863 (array_inv!4136 (buf!4875 thiss!1204)))))

(declare-fun b!192911 () Bool)

(assert (=> b!192911 (= e!132859 (= (_2!8991 lt!299684) (_2!8991 lt!299679)))))

(assert (= (and start!41292 res!161165) b!192888))

(assert (= (and b!192888 res!161160) b!192898))

(assert (= (and b!192898 res!161144) b!192909))

(assert (= (and b!192909 res!161161) b!192899))

(assert (= (and b!192899 res!161150) b!192907))

(assert (= (and b!192907 res!161157) b!192902))

(assert (= (and b!192902 res!161148) b!192904))

(assert (= (and b!192904 res!161145) b!192887))

(assert (= (and b!192899 (not res!161159)) b!192890))

(assert (= (and b!192890 (not res!161155)) b!192906))

(assert (= (and b!192906 (not res!161153)) b!192895))

(assert (= (and b!192895 (not res!161151)) b!192897))

(assert (= (and b!192897 (not res!161152)) b!192894))

(assert (= (and b!192894 (not res!161163)) b!192903))

(assert (= (and b!192903 res!161149) b!192905))

(assert (= (and b!192903 res!161158) b!192911))

(assert (= (and b!192903 (not res!161154)) b!192889))

(assert (= (and b!192889 res!161164) b!192893))

(assert (= (and b!192893 res!161166) b!192896))

(assert (= (and b!192896 res!161146) b!192908))

(assert (= (and b!192889 (not res!161143)) b!192891))

(assert (= (and b!192891 (not res!161156)) b!192892))

(assert (= (and b!192892 res!161147) b!192901))

(assert (= (and b!192901 res!161162) b!192900))

(assert (= start!41292 b!192910))

(declare-fun m!299111 () Bool)

(assert (=> b!192902 m!299111))

(declare-fun m!299113 () Bool)

(assert (=> b!192901 m!299113))

(declare-fun m!299115 () Bool)

(assert (=> b!192907 m!299115))

(declare-fun m!299117 () Bool)

(assert (=> b!192907 m!299117))

(declare-fun m!299119 () Bool)

(assert (=> b!192893 m!299119))

(declare-fun m!299121 () Bool)

(assert (=> b!192910 m!299121))

(assert (=> b!192894 m!299111))

(declare-fun m!299123 () Bool)

(assert (=> b!192889 m!299123))

(declare-fun m!299125 () Bool)

(assert (=> b!192889 m!299125))

(declare-fun m!299127 () Bool)

(assert (=> b!192889 m!299127))

(declare-fun m!299129 () Bool)

(assert (=> b!192888 m!299129))

(declare-fun m!299131 () Bool)

(assert (=> b!192890 m!299131))

(declare-fun m!299133 () Bool)

(assert (=> b!192890 m!299133))

(declare-fun m!299135 () Bool)

(assert (=> b!192890 m!299135))

(declare-fun m!299137 () Bool)

(assert (=> b!192890 m!299137))

(declare-fun m!299139 () Bool)

(assert (=> start!41292 m!299139))

(declare-fun m!299141 () Bool)

(assert (=> b!192891 m!299141))

(declare-fun m!299143 () Bool)

(assert (=> b!192891 m!299143))

(declare-fun m!299145 () Bool)

(assert (=> b!192906 m!299145))

(declare-fun m!299147 () Bool)

(assert (=> b!192903 m!299147))

(declare-fun m!299149 () Bool)

(assert (=> b!192903 m!299149))

(declare-fun m!299151 () Bool)

(assert (=> b!192903 m!299151))

(declare-fun m!299153 () Bool)

(assert (=> b!192903 m!299153))

(declare-fun m!299155 () Bool)

(assert (=> b!192903 m!299155))

(declare-fun m!299157 () Bool)

(assert (=> b!192903 m!299157))

(declare-fun m!299159 () Bool)

(assert (=> b!192903 m!299159))

(declare-fun m!299161 () Bool)

(assert (=> b!192903 m!299161))

(declare-fun m!299163 () Bool)

(assert (=> b!192903 m!299163))

(declare-fun m!299165 () Bool)

(assert (=> b!192903 m!299165))

(declare-fun m!299167 () Bool)

(assert (=> b!192903 m!299167))

(declare-fun m!299169 () Bool)

(assert (=> b!192903 m!299169))

(declare-fun m!299171 () Bool)

(assert (=> b!192903 m!299171))

(declare-fun m!299173 () Bool)

(assert (=> b!192903 m!299173))

(declare-fun m!299175 () Bool)

(assert (=> b!192903 m!299175))

(declare-fun m!299177 () Bool)

(assert (=> b!192903 m!299177))

(assert (=> b!192899 m!299115))

(assert (=> b!192899 m!299117))

(declare-fun m!299179 () Bool)

(assert (=> b!192899 m!299179))

(declare-fun m!299181 () Bool)

(assert (=> b!192905 m!299181))

(declare-fun m!299183 () Bool)

(assert (=> b!192887 m!299183))

(declare-fun m!299185 () Bool)

(assert (=> b!192898 m!299185))

(declare-fun m!299187 () Bool)

(assert (=> b!192904 m!299187))

(assert (=> b!192904 m!299187))

(declare-fun m!299189 () Bool)

(assert (=> b!192904 m!299189))

(declare-fun m!299191 () Bool)

(assert (=> b!192897 m!299191))

(declare-fun m!299193 () Bool)

(assert (=> b!192896 m!299193))

(push 1)

(assert (not b!192891))

(assert (not b!192889))

(assert (not b!192903))

(assert (not b!192898))

(assert (not b!192902))

(assert (not b!192904))

(assert (not start!41292))

(assert (not b!192906))

(assert (not b!192907))

(assert (not b!192887))

(assert (not b!192893))

(assert (not b!192896))

(assert (not b!192905))

(assert (not b!192897))

(assert (not b!192901))

(assert (not b!192899))

(assert (not b!192888))

(assert (not b!192894))

(assert (not b!192910))

(assert (not b!192890))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

