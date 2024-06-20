; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23908 () Bool)

(assert start!23908)

(declare-fun b!120862 () Bool)

(declare-fun e!79143 () Bool)

(declare-datatypes ((array!5368 0))(
  ( (array!5369 (arr!3022 (Array (_ BitVec 32) (_ BitVec 8))) (size!2429 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4332 0))(
  ( (BitStream!4333 (buf!2863 array!5368) (currentByte!5548 (_ BitVec 32)) (currentBit!5543 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4332)

(declare-datatypes ((Unit!7449 0))(
  ( (Unit!7450) )
))
(declare-datatypes ((tuple2!10128 0))(
  ( (tuple2!10129 (_1!5329 Unit!7449) (_2!5329 BitStream!4332)) )
))
(declare-fun lt!188704 () tuple2!10128)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!120862 (= e!79143 (invariant!0 (currentBit!5543 thiss!1305) (currentByte!5548 thiss!1305) (size!2429 (buf!2863 (_2!5329 lt!188704)))))))

(declare-fun b!120863 () Bool)

(declare-fun res!100071 () Bool)

(declare-fun e!79137 () Bool)

(assert (=> b!120863 (=> (not res!100071) (not e!79137))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!120863 (= res!100071 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!120864 () Bool)

(declare-fun e!79138 () Bool)

(declare-datatypes ((tuple2!10130 0))(
  ( (tuple2!10131 (_1!5330 BitStream!4332) (_2!5330 Bool)) )
))
(declare-fun lt!188705 () tuple2!10130)

(declare-fun lt!188700 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!120864 (= e!79138 (= (bitIndex!0 (size!2429 (buf!2863 (_1!5330 lt!188705))) (currentByte!5548 (_1!5330 lt!188705)) (currentBit!5543 (_1!5330 lt!188705))) lt!188700))))

(declare-fun b!120865 () Bool)

(declare-fun e!79141 () Bool)

(declare-fun lt!188709 () (_ BitVec 64))

(declare-fun lt!188698 () (_ BitVec 64))

(assert (=> b!120865 (= e!79141 (= lt!188709 (bvsub lt!188698 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-datatypes ((tuple2!10132 0))(
  ( (tuple2!10133 (_1!5331 BitStream!4332) (_2!5331 BitStream!4332)) )
))
(declare-fun lt!188702 () tuple2!10132)

(declare-fun lt!188716 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!4332 (_ BitVec 64)) BitStream!4332)

(assert (=> b!120865 (= (_1!5331 lt!188702) (withMovedBitIndex!0 (_2!5331 lt!188702) (bvsub lt!188698 lt!188716)))))

(declare-fun lt!188712 () tuple2!10128)

(assert (=> b!120865 (= lt!188698 (bitIndex!0 (size!2429 (buf!2863 (_2!5329 lt!188712))) (currentByte!5548 (_2!5329 lt!188712)) (currentBit!5543 (_2!5329 lt!188712))))))

(declare-fun lt!188695 () tuple2!10132)

(assert (=> b!120865 (= (_1!5331 lt!188695) (withMovedBitIndex!0 (_2!5331 lt!188695) (bvsub lt!188709 lt!188716)))))

(assert (=> b!120865 (= lt!188716 (bitIndex!0 (size!2429 (buf!2863 (_2!5329 lt!188704))) (currentByte!5548 (_2!5329 lt!188704)) (currentBit!5543 (_2!5329 lt!188704))))))

(assert (=> b!120865 (= lt!188709 (bitIndex!0 (size!2429 (buf!2863 thiss!1305)) (currentByte!5548 thiss!1305) (currentBit!5543 thiss!1305)))))

(declare-datatypes ((tuple2!10134 0))(
  ( (tuple2!10135 (_1!5332 BitStream!4332) (_2!5332 (_ BitVec 64))) )
))
(declare-fun lt!188718 () tuple2!10134)

(declare-fun lt!188721 () tuple2!10134)

(assert (=> b!120865 (and (= (_2!5332 lt!188718) (_2!5332 lt!188721)) (= (_1!5332 lt!188718) (_1!5332 lt!188721)))))

(declare-fun lt!188717 () (_ BitVec 64))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun lt!188713 () Unit!7449)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4332 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!7449)

(assert (=> b!120865 (= lt!188713 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5331 lt!188695) nBits!396 i!615 lt!188717))))

(declare-fun lt!188715 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4332 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!10134)

(assert (=> b!120865 (= lt!188721 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!5331 lt!188695) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!188715))))

(declare-fun res!100076 () Bool)

(declare-fun e!79142 () Bool)

(assert (=> start!23908 (=> (not res!100076) (not e!79142))))

(assert (=> start!23908 (= res!100076 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!23908 e!79142))

(assert (=> start!23908 true))

(declare-fun e!79145 () Bool)

(declare-fun inv!12 (BitStream!4332) Bool)

(assert (=> start!23908 (and (inv!12 thiss!1305) e!79145)))

(declare-fun b!120866 () Bool)

(assert (=> b!120866 (= e!79137 (not e!79141))))

(declare-fun res!100074 () Bool)

(assert (=> b!120866 (=> res!100074 e!79141)))

(assert (=> b!120866 (= res!100074 (not (= (_1!5332 (readNLeastSignificantBitsLoopPure!0 (_1!5331 lt!188702) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!188715)) (_2!5331 lt!188702))))))

(declare-fun lt!188707 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!120866 (validate_offset_bits!1 ((_ sign_extend 32) (size!2429 (buf!2863 (_2!5329 lt!188704)))) ((_ sign_extend 32) (currentByte!5548 (_2!5329 lt!188712))) ((_ sign_extend 32) (currentBit!5543 (_2!5329 lt!188712))) lt!188707)))

(declare-fun lt!188706 () Unit!7449)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4332 array!5368 (_ BitVec 64)) Unit!7449)

(assert (=> b!120866 (= lt!188706 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5329 lt!188712) (buf!2863 (_2!5329 lt!188704)) lt!188707))))

(assert (=> b!120866 (= lt!188707 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!188697 () tuple2!10130)

(declare-fun lt!188701 () (_ BitVec 64))

(assert (=> b!120866 (= lt!188715 (bvor lt!188717 (ite (_2!5330 lt!188697) lt!188701 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!120866 (= lt!188718 (readNLeastSignificantBitsLoopPure!0 (_1!5331 lt!188695) nBits!396 i!615 lt!188717))))

(declare-fun lt!188714 () (_ BitVec 64))

(assert (=> b!120866 (validate_offset_bits!1 ((_ sign_extend 32) (size!2429 (buf!2863 (_2!5329 lt!188704)))) ((_ sign_extend 32) (currentByte!5548 thiss!1305)) ((_ sign_extend 32) (currentBit!5543 thiss!1305)) lt!188714)))

(declare-fun lt!188720 () Unit!7449)

(assert (=> b!120866 (= lt!188720 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2863 (_2!5329 lt!188704)) lt!188714))))

(assert (=> b!120866 (= lt!188717 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(declare-fun lt!188696 () Bool)

(assert (=> b!120866 (= (_2!5330 lt!188697) lt!188696)))

(declare-fun readBitPure!0 (BitStream!4332) tuple2!10130)

(assert (=> b!120866 (= lt!188697 (readBitPure!0 (_1!5331 lt!188695)))))

(declare-fun reader!0 (BitStream!4332 BitStream!4332) tuple2!10132)

(assert (=> b!120866 (= lt!188702 (reader!0 (_2!5329 lt!188712) (_2!5329 lt!188704)))))

(assert (=> b!120866 (= lt!188695 (reader!0 thiss!1305 (_2!5329 lt!188704)))))

(declare-fun e!79139 () Bool)

(assert (=> b!120866 e!79139))

(declare-fun res!100075 () Bool)

(assert (=> b!120866 (=> (not res!100075) (not e!79139))))

(declare-fun lt!188703 () tuple2!10130)

(declare-fun lt!188710 () tuple2!10130)

(assert (=> b!120866 (= res!100075 (= (bitIndex!0 (size!2429 (buf!2863 (_1!5330 lt!188703))) (currentByte!5548 (_1!5330 lt!188703)) (currentBit!5543 (_1!5330 lt!188703))) (bitIndex!0 (size!2429 (buf!2863 (_1!5330 lt!188710))) (currentByte!5548 (_1!5330 lt!188710)) (currentBit!5543 (_1!5330 lt!188710)))))))

(declare-fun lt!188708 () Unit!7449)

(declare-fun lt!188711 () BitStream!4332)

(declare-fun readBitPrefixLemma!0 (BitStream!4332 BitStream!4332) Unit!7449)

(assert (=> b!120866 (= lt!188708 (readBitPrefixLemma!0 lt!188711 (_2!5329 lt!188704)))))

(assert (=> b!120866 (= lt!188710 (readBitPure!0 (BitStream!4333 (buf!2863 (_2!5329 lt!188704)) (currentByte!5548 thiss!1305) (currentBit!5543 thiss!1305))))))

(assert (=> b!120866 (= lt!188703 (readBitPure!0 lt!188711))))

(assert (=> b!120866 (= lt!188711 (BitStream!4333 (buf!2863 (_2!5329 lt!188712)) (currentByte!5548 thiss!1305) (currentBit!5543 thiss!1305)))))

(assert (=> b!120866 e!79143))

(declare-fun res!100078 () Bool)

(assert (=> b!120866 (=> (not res!100078) (not e!79143))))

(declare-fun isPrefixOf!0 (BitStream!4332 BitStream!4332) Bool)

(assert (=> b!120866 (= res!100078 (isPrefixOf!0 thiss!1305 (_2!5329 lt!188704)))))

(declare-fun lt!188699 () Unit!7449)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4332 BitStream!4332 BitStream!4332) Unit!7449)

(assert (=> b!120866 (= lt!188699 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5329 lt!188712) (_2!5329 lt!188704)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4332 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!10128)

(assert (=> b!120866 (= lt!188704 (appendNLeastSignificantBitsLoop!0 (_2!5329 lt!188712) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!79140 () Bool)

(assert (=> b!120866 e!79140))

(declare-fun res!100073 () Bool)

(assert (=> b!120866 (=> (not res!100073) (not e!79140))))

(assert (=> b!120866 (= res!100073 (= (size!2429 (buf!2863 thiss!1305)) (size!2429 (buf!2863 (_2!5329 lt!188712)))))))

(declare-fun appendBit!0 (BitStream!4332 Bool) tuple2!10128)

(assert (=> b!120866 (= lt!188712 (appendBit!0 thiss!1305 lt!188696))))

(assert (=> b!120866 (= lt!188696 (not (= (bvand v!199 lt!188701) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!120866 (= lt!188701 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!120867 () Bool)

(declare-fun e!79146 () Bool)

(assert (=> b!120867 (= e!79140 e!79146)))

(declare-fun res!100072 () Bool)

(assert (=> b!120867 (=> (not res!100072) (not e!79146))))

(declare-fun lt!188719 () (_ BitVec 64))

(assert (=> b!120867 (= res!100072 (= lt!188700 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!188719)))))

(assert (=> b!120867 (= lt!188700 (bitIndex!0 (size!2429 (buf!2863 (_2!5329 lt!188712))) (currentByte!5548 (_2!5329 lt!188712)) (currentBit!5543 (_2!5329 lt!188712))))))

(assert (=> b!120867 (= lt!188719 (bitIndex!0 (size!2429 (buf!2863 thiss!1305)) (currentByte!5548 thiss!1305) (currentBit!5543 thiss!1305)))))

(declare-fun b!120868 () Bool)

(assert (=> b!120868 (= e!79142 e!79137)))

(declare-fun res!100069 () Bool)

(assert (=> b!120868 (=> (not res!100069) (not e!79137))))

(assert (=> b!120868 (= res!100069 (validate_offset_bits!1 ((_ sign_extend 32) (size!2429 (buf!2863 thiss!1305))) ((_ sign_extend 32) (currentByte!5548 thiss!1305)) ((_ sign_extend 32) (currentBit!5543 thiss!1305)) lt!188714))))

(assert (=> b!120868 (= lt!188714 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!120869 () Bool)

(assert (=> b!120869 (= e!79139 (= (_2!5330 lt!188703) (_2!5330 lt!188710)))))

(declare-fun b!120870 () Bool)

(declare-fun res!100080 () Bool)

(assert (=> b!120870 (=> (not res!100080) (not e!79137))))

(assert (=> b!120870 (= res!100080 (bvslt i!615 nBits!396))))

(declare-fun b!120871 () Bool)

(declare-fun res!100070 () Bool)

(assert (=> b!120871 (=> (not res!100070) (not e!79146))))

(assert (=> b!120871 (= res!100070 (isPrefixOf!0 thiss!1305 (_2!5329 lt!188712)))))

(declare-fun b!120872 () Bool)

(assert (=> b!120872 (= e!79146 e!79138)))

(declare-fun res!100077 () Bool)

(assert (=> b!120872 (=> (not res!100077) (not e!79138))))

(assert (=> b!120872 (= res!100077 (and (= (_2!5330 lt!188705) lt!188696) (= (_1!5330 lt!188705) (_2!5329 lt!188712))))))

(declare-fun readerFrom!0 (BitStream!4332 (_ BitVec 32) (_ BitVec 32)) BitStream!4332)

(assert (=> b!120872 (= lt!188705 (readBitPure!0 (readerFrom!0 (_2!5329 lt!188712) (currentBit!5543 thiss!1305) (currentByte!5548 thiss!1305))))))

(declare-fun b!120873 () Bool)

(declare-fun array_inv!2231 (array!5368) Bool)

(assert (=> b!120873 (= e!79145 (array_inv!2231 (buf!2863 thiss!1305)))))

(declare-fun b!120874 () Bool)

(declare-fun res!100079 () Bool)

(assert (=> b!120874 (=> (not res!100079) (not e!79143))))

(assert (=> b!120874 (= res!100079 (invariant!0 (currentBit!5543 thiss!1305) (currentByte!5548 thiss!1305) (size!2429 (buf!2863 (_2!5329 lt!188712)))))))

(assert (= (and start!23908 res!100076) b!120868))

(assert (= (and b!120868 res!100069) b!120863))

(assert (= (and b!120863 res!100071) b!120870))

(assert (= (and b!120870 res!100080) b!120866))

(assert (= (and b!120866 res!100073) b!120867))

(assert (= (and b!120867 res!100072) b!120871))

(assert (= (and b!120871 res!100070) b!120872))

(assert (= (and b!120872 res!100077) b!120864))

(assert (= (and b!120866 res!100078) b!120874))

(assert (= (and b!120874 res!100079) b!120862))

(assert (= (and b!120866 res!100075) b!120869))

(assert (= (and b!120866 (not res!100074)) b!120865))

(assert (= start!23908 b!120873))

(declare-fun m!182881 () Bool)

(assert (=> b!120864 m!182881))

(declare-fun m!182883 () Bool)

(assert (=> b!120871 m!182883))

(declare-fun m!182885 () Bool)

(assert (=> b!120863 m!182885))

(declare-fun m!182887 () Bool)

(assert (=> b!120867 m!182887))

(declare-fun m!182889 () Bool)

(assert (=> b!120867 m!182889))

(declare-fun m!182891 () Bool)

(assert (=> b!120872 m!182891))

(assert (=> b!120872 m!182891))

(declare-fun m!182893 () Bool)

(assert (=> b!120872 m!182893))

(declare-fun m!182895 () Bool)

(assert (=> b!120873 m!182895))

(declare-fun m!182897 () Bool)

(assert (=> b!120862 m!182897))

(declare-fun m!182899 () Bool)

(assert (=> b!120874 m!182899))

(declare-fun m!182901 () Bool)

(assert (=> start!23908 m!182901))

(declare-fun m!182903 () Bool)

(assert (=> b!120866 m!182903))

(declare-fun m!182905 () Bool)

(assert (=> b!120866 m!182905))

(declare-fun m!182907 () Bool)

(assert (=> b!120866 m!182907))

(declare-fun m!182909 () Bool)

(assert (=> b!120866 m!182909))

(declare-fun m!182911 () Bool)

(assert (=> b!120866 m!182911))

(declare-fun m!182913 () Bool)

(assert (=> b!120866 m!182913))

(declare-fun m!182915 () Bool)

(assert (=> b!120866 m!182915))

(declare-fun m!182917 () Bool)

(assert (=> b!120866 m!182917))

(declare-fun m!182919 () Bool)

(assert (=> b!120866 m!182919))

(declare-fun m!182921 () Bool)

(assert (=> b!120866 m!182921))

(declare-fun m!182923 () Bool)

(assert (=> b!120866 m!182923))

(declare-fun m!182925 () Bool)

(assert (=> b!120866 m!182925))

(declare-fun m!182927 () Bool)

(assert (=> b!120866 m!182927))

(declare-fun m!182929 () Bool)

(assert (=> b!120866 m!182929))

(declare-fun m!182931 () Bool)

(assert (=> b!120866 m!182931))

(declare-fun m!182933 () Bool)

(assert (=> b!120866 m!182933))

(declare-fun m!182935 () Bool)

(assert (=> b!120866 m!182935))

(declare-fun m!182937 () Bool)

(assert (=> b!120866 m!182937))

(declare-fun m!182939 () Bool)

(assert (=> b!120866 m!182939))

(declare-fun m!182941 () Bool)

(assert (=> b!120868 m!182941))

(declare-fun m!182943 () Bool)

(assert (=> b!120865 m!182943))

(declare-fun m!182945 () Bool)

(assert (=> b!120865 m!182945))

(declare-fun m!182947 () Bool)

(assert (=> b!120865 m!182947))

(assert (=> b!120865 m!182889))

(declare-fun m!182949 () Bool)

(assert (=> b!120865 m!182949))

(assert (=> b!120865 m!182945))

(declare-fun m!182951 () Bool)

(assert (=> b!120865 m!182951))

(assert (=> b!120865 m!182887))

(declare-fun m!182953 () Bool)

(assert (=> b!120865 m!182953))

(check-sat (not b!120871) (not start!23908) (not b!120865) (not b!120864) (not b!120862) (not b!120874) (not b!120867) (not b!120873) (not b!120863) (not b!120872) (not b!120866) (not b!120868))
(check-sat)
