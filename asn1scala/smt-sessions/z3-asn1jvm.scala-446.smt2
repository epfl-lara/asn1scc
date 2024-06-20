; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!11870 () Bool)

(assert start!11870)

(declare-fun b!59874 () Bool)

(declare-fun e!39890 () Bool)

(declare-fun e!39888 () Bool)

(assert (=> b!59874 (= e!39890 e!39888)))

(declare-fun res!49878 () Bool)

(assert (=> b!59874 (=> res!49878 e!39888)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!93683 () (_ BitVec 64))

(declare-fun lt!93693 () (_ BitVec 64))

(assert (=> b!59874 (= res!49878 (not (= lt!93683 (bvsub (bvadd lt!93693 to!314) i!635))))))

(declare-datatypes ((array!2727 0))(
  ( (array!2728 (arr!1803 (Array (_ BitVec 32) (_ BitVec 8))) (size!1239 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2166 0))(
  ( (BitStream!2167 (buf!1620 array!2727) (currentByte!3238 (_ BitVec 32)) (currentBit!3233 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!4101 0))(
  ( (Unit!4102) )
))
(declare-datatypes ((tuple2!5454 0))(
  ( (tuple2!5455 (_1!2838 Unit!4101) (_2!2838 BitStream!2166)) )
))
(declare-fun lt!93694 () tuple2!5454)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!59874 (= lt!93683 (bitIndex!0 (size!1239 (buf!1620 (_2!2838 lt!93694))) (currentByte!3238 (_2!2838 lt!93694)) (currentBit!3233 (_2!2838 lt!93694))))))

(declare-fun b!59875 () Bool)

(declare-fun e!39886 () Bool)

(assert (=> b!59875 (= e!39886 e!39890)))

(declare-fun res!49871 () Bool)

(assert (=> b!59875 (=> res!49871 e!39890)))

(declare-fun lt!93687 () tuple2!5454)

(declare-fun isPrefixOf!0 (BitStream!2166 BitStream!2166) Bool)

(assert (=> b!59875 (= res!49871 (not (isPrefixOf!0 (_2!2838 lt!93687) (_2!2838 lt!93694))))))

(declare-fun thiss!1379 () BitStream!2166)

(assert (=> b!59875 (isPrefixOf!0 thiss!1379 (_2!2838 lt!93694))))

(declare-fun lt!93695 () Unit!4101)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2166 BitStream!2166 BitStream!2166) Unit!4101)

(assert (=> b!59875 (= lt!93695 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2838 lt!93687) (_2!2838 lt!93694)))))

(declare-fun srcBuffer!2 () array!2727)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2166 array!2727 (_ BitVec 64) (_ BitVec 64)) tuple2!5454)

(assert (=> b!59875 (= lt!93694 (appendBitsMSBFirstLoop!0 (_2!2838 lt!93687) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!39896 () Bool)

(assert (=> b!59875 e!39896))

(declare-fun res!49873 () Bool)

(assert (=> b!59875 (=> (not res!49873) (not e!39896))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!59875 (= res!49873 (validate_offset_bits!1 ((_ sign_extend 32) (size!1239 (buf!1620 (_2!2838 lt!93687)))) ((_ sign_extend 32) (currentByte!3238 thiss!1379)) ((_ sign_extend 32) (currentBit!3233 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!93686 () Unit!4101)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2166 array!2727 (_ BitVec 64)) Unit!4101)

(assert (=> b!59875 (= lt!93686 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1620 (_2!2838 lt!93687)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!5456 0))(
  ( (tuple2!5457 (_1!2839 BitStream!2166) (_2!2839 BitStream!2166)) )
))
(declare-fun lt!93697 () tuple2!5456)

(declare-fun reader!0 (BitStream!2166 BitStream!2166) tuple2!5456)

(assert (=> b!59875 (= lt!93697 (reader!0 thiss!1379 (_2!2838 lt!93687)))))

(declare-fun b!59876 () Bool)

(declare-fun e!39889 () Bool)

(assert (=> b!59876 (= e!39889 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((List!658 0))(
  ( (Nil!655) (Cons!654 (h!773 Bool) (t!1408 List!658)) )
))
(declare-fun lt!93688 () List!658)

(declare-fun lt!93684 () tuple2!5456)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2166 BitStream!2166 (_ BitVec 64)) List!658)

(assert (=> b!59876 (= lt!93688 (bitStreamReadBitsIntoList!0 (_2!2838 lt!93694) (_1!2839 lt!93684) (bvsub to!314 i!635)))))

(declare-fun lt!93689 () (_ BitVec 64))

(assert (=> b!59876 (validate_offset_bits!1 ((_ sign_extend 32) (size!1239 (buf!1620 (_2!2838 lt!93694)))) ((_ sign_extend 32) (currentByte!3238 (_2!2838 lt!93687))) ((_ sign_extend 32) (currentBit!3233 (_2!2838 lt!93687))) lt!93689)))

(declare-fun lt!93690 () Unit!4101)

(assert (=> b!59876 (= lt!93690 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2838 lt!93687) (buf!1620 (_2!2838 lt!93694)) lt!93689))))

(declare-fun lt!93696 () tuple2!5456)

(assert (=> b!59876 (= lt!93696 (reader!0 (_2!2838 lt!93687) (_2!2838 lt!93694)))))

(assert (=> b!59876 (validate_offset_bits!1 ((_ sign_extend 32) (size!1239 (buf!1620 (_2!2838 lt!93694)))) ((_ sign_extend 32) (currentByte!3238 thiss!1379)) ((_ sign_extend 32) (currentBit!3233 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!93691 () Unit!4101)

(assert (=> b!59876 (= lt!93691 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1620 (_2!2838 lt!93694)) (bvsub to!314 i!635)))))

(assert (=> b!59876 (= lt!93684 (reader!0 thiss!1379 (_2!2838 lt!93694)))))

(declare-fun b!59878 () Bool)

(declare-fun e!39893 () Bool)

(declare-fun e!39894 () Bool)

(assert (=> b!59878 (= e!39893 (not e!39894))))

(declare-fun res!49880 () Bool)

(assert (=> b!59878 (=> res!49880 e!39894)))

(assert (=> b!59878 (= res!49880 (bvsge i!635 to!314))))

(assert (=> b!59878 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!93685 () Unit!4101)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2166) Unit!4101)

(assert (=> b!59878 (= lt!93685 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!59878 (= lt!93693 (bitIndex!0 (size!1239 (buf!1620 thiss!1379)) (currentByte!3238 thiss!1379) (currentBit!3233 thiss!1379)))))

(declare-fun b!59879 () Bool)

(declare-fun res!49869 () Bool)

(assert (=> b!59879 (=> res!49869 e!39889)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!59879 (= res!49869 (not (invariant!0 (currentBit!3233 (_2!2838 lt!93687)) (currentByte!3238 (_2!2838 lt!93687)) (size!1239 (buf!1620 (_2!2838 lt!93687))))))))

(declare-fun e!39892 () Bool)

(declare-fun b!59880 () Bool)

(assert (=> b!59880 (= e!39892 (= lt!93683 (bvsub (bvsub (bvadd (bitIndex!0 (size!1239 (buf!1620 (_2!2838 lt!93687))) (currentByte!3238 (_2!2838 lt!93687)) (currentBit!3233 (_2!2838 lt!93687))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!59881 () Bool)

(declare-fun res!49870 () Bool)

(assert (=> b!59881 (=> res!49870 e!39889)))

(assert (=> b!59881 (= res!49870 (not (invariant!0 (currentBit!3233 (_2!2838 lt!93687)) (currentByte!3238 (_2!2838 lt!93687)) (size!1239 (buf!1620 (_2!2838 lt!93694))))))))

(declare-fun b!59882 () Bool)

(declare-fun head!477 (List!658) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2166 array!2727 (_ BitVec 64) (_ BitVec 64)) List!658)

(assert (=> b!59882 (= e!39896 (= (head!477 (byteArrayBitContentToList!0 (_2!2838 lt!93687) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!477 (bitStreamReadBitsIntoList!0 (_2!2838 lt!93687) (_1!2839 lt!93697) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!59883 () Bool)

(declare-fun res!49879 () Bool)

(assert (=> b!59883 (=> res!49879 e!39888)))

(assert (=> b!59883 (= res!49879 (not (= (size!1239 (buf!1620 thiss!1379)) (size!1239 (buf!1620 (_2!2838 lt!93694))))))))

(declare-fun b!59884 () Bool)

(declare-fun res!49872 () Bool)

(assert (=> b!59884 (=> (not res!49872) (not e!39893))))

(assert (=> b!59884 (= res!49872 (validate_offset_bits!1 ((_ sign_extend 32) (size!1239 (buf!1620 thiss!1379))) ((_ sign_extend 32) (currentByte!3238 thiss!1379)) ((_ sign_extend 32) (currentBit!3233 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!59885 () Bool)

(declare-fun e!39891 () Bool)

(declare-fun array_inv!1142 (array!2727) Bool)

(assert (=> b!59885 (= e!39891 (array_inv!1142 (buf!1620 thiss!1379)))))

(declare-fun b!59886 () Bool)

(assert (=> b!59886 (= e!39888 e!39889)))

(declare-fun res!49875 () Bool)

(assert (=> b!59886 (=> res!49875 e!39889)))

(assert (=> b!59886 (= res!49875 (not (= (size!1239 (buf!1620 (_2!2838 lt!93687))) (size!1239 (buf!1620 (_2!2838 lt!93694))))))))

(assert (=> b!59886 e!39892))

(declare-fun res!49876 () Bool)

(assert (=> b!59886 (=> (not res!49876) (not e!39892))))

(assert (=> b!59886 (= res!49876 (= (size!1239 (buf!1620 (_2!2838 lt!93694))) (size!1239 (buf!1620 thiss!1379))))))

(declare-fun b!59887 () Bool)

(assert (=> b!59887 (= e!39894 e!39886)))

(declare-fun res!49877 () Bool)

(assert (=> b!59887 (=> res!49877 e!39886)))

(assert (=> b!59887 (= res!49877 (not (isPrefixOf!0 thiss!1379 (_2!2838 lt!93687))))))

(assert (=> b!59887 (validate_offset_bits!1 ((_ sign_extend 32) (size!1239 (buf!1620 (_2!2838 lt!93687)))) ((_ sign_extend 32) (currentByte!3238 (_2!2838 lt!93687))) ((_ sign_extend 32) (currentBit!3233 (_2!2838 lt!93687))) lt!93689)))

(assert (=> b!59887 (= lt!93689 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!93692 () Unit!4101)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2166 BitStream!2166 (_ BitVec 64) (_ BitVec 64)) Unit!4101)

(assert (=> b!59887 (= lt!93692 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2838 lt!93687) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2166 (_ BitVec 8) (_ BitVec 32)) tuple2!5454)

(assert (=> b!59887 (= lt!93687 (appendBitFromByte!0 thiss!1379 (select (arr!1803 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun res!49874 () Bool)

(assert (=> start!11870 (=> (not res!49874) (not e!39893))))

(assert (=> start!11870 (= res!49874 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1239 srcBuffer!2))))))))

(assert (=> start!11870 e!39893))

(assert (=> start!11870 true))

(assert (=> start!11870 (array_inv!1142 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2166) Bool)

(assert (=> start!11870 (and (inv!12 thiss!1379) e!39891)))

(declare-fun b!59877 () Bool)

(declare-fun res!49881 () Bool)

(assert (=> b!59877 (=> res!49881 e!39888)))

(assert (=> b!59877 (= res!49881 (not (invariant!0 (currentBit!3233 (_2!2838 lt!93694)) (currentByte!3238 (_2!2838 lt!93694)) (size!1239 (buf!1620 (_2!2838 lt!93694))))))))

(assert (= (and start!11870 res!49874) b!59884))

(assert (= (and b!59884 res!49872) b!59878))

(assert (= (and b!59878 (not res!49880)) b!59887))

(assert (= (and b!59887 (not res!49877)) b!59875))

(assert (= (and b!59875 res!49873) b!59882))

(assert (= (and b!59875 (not res!49871)) b!59874))

(assert (= (and b!59874 (not res!49878)) b!59877))

(assert (= (and b!59877 (not res!49881)) b!59883))

(assert (= (and b!59883 (not res!49879)) b!59886))

(assert (= (and b!59886 res!49876) b!59880))

(assert (= (and b!59886 (not res!49875)) b!59879))

(assert (= (and b!59879 (not res!49869)) b!59881))

(assert (= (and b!59881 (not res!49870)) b!59876))

(assert (= start!11870 b!59885))

(declare-fun m!94307 () Bool)

(assert (=> start!11870 m!94307))

(declare-fun m!94309 () Bool)

(assert (=> start!11870 m!94309))

(declare-fun m!94311 () Bool)

(assert (=> b!59875 m!94311))

(declare-fun m!94313 () Bool)

(assert (=> b!59875 m!94313))

(declare-fun m!94315 () Bool)

(assert (=> b!59875 m!94315))

(declare-fun m!94317 () Bool)

(assert (=> b!59875 m!94317))

(declare-fun m!94319 () Bool)

(assert (=> b!59875 m!94319))

(declare-fun m!94321 () Bool)

(assert (=> b!59875 m!94321))

(declare-fun m!94323 () Bool)

(assert (=> b!59875 m!94323))

(declare-fun m!94325 () Bool)

(assert (=> b!59887 m!94325))

(declare-fun m!94327 () Bool)

(assert (=> b!59887 m!94327))

(assert (=> b!59887 m!94327))

(declare-fun m!94329 () Bool)

(assert (=> b!59887 m!94329))

(declare-fun m!94331 () Bool)

(assert (=> b!59887 m!94331))

(declare-fun m!94333 () Bool)

(assert (=> b!59887 m!94333))

(declare-fun m!94335 () Bool)

(assert (=> b!59885 m!94335))

(declare-fun m!94337 () Bool)

(assert (=> b!59882 m!94337))

(assert (=> b!59882 m!94337))

(declare-fun m!94339 () Bool)

(assert (=> b!59882 m!94339))

(declare-fun m!94341 () Bool)

(assert (=> b!59882 m!94341))

(assert (=> b!59882 m!94341))

(declare-fun m!94343 () Bool)

(assert (=> b!59882 m!94343))

(declare-fun m!94345 () Bool)

(assert (=> b!59881 m!94345))

(declare-fun m!94347 () Bool)

(assert (=> b!59880 m!94347))

(declare-fun m!94349 () Bool)

(assert (=> b!59878 m!94349))

(declare-fun m!94351 () Bool)

(assert (=> b!59878 m!94351))

(declare-fun m!94353 () Bool)

(assert (=> b!59878 m!94353))

(declare-fun m!94355 () Bool)

(assert (=> b!59876 m!94355))

(declare-fun m!94357 () Bool)

(assert (=> b!59876 m!94357))

(declare-fun m!94359 () Bool)

(assert (=> b!59876 m!94359))

(declare-fun m!94361 () Bool)

(assert (=> b!59876 m!94361))

(declare-fun m!94363 () Bool)

(assert (=> b!59876 m!94363))

(declare-fun m!94365 () Bool)

(assert (=> b!59876 m!94365))

(declare-fun m!94367 () Bool)

(assert (=> b!59876 m!94367))

(declare-fun m!94369 () Bool)

(assert (=> b!59874 m!94369))

(declare-fun m!94371 () Bool)

(assert (=> b!59877 m!94371))

(declare-fun m!94373 () Bool)

(assert (=> b!59879 m!94373))

(declare-fun m!94375 () Bool)

(assert (=> b!59884 m!94375))

(check-sat (not b!59881) (not b!59879) (not b!59887) (not b!59874) (not b!59882) (not b!59885) (not start!11870) (not b!59875) (not b!59877) (not b!59878) (not b!59880) (not b!59884) (not b!59876))
(check-sat)
