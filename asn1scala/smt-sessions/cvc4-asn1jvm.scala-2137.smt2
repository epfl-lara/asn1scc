; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54106 () Bool)

(assert start!54106)

(declare-fun b!252502 () Bool)

(declare-fun e!174973 () Bool)

(declare-fun e!174976 () Bool)

(assert (=> b!252502 (= e!174973 e!174976)))

(declare-fun res!211562 () Bool)

(assert (=> b!252502 (=> (not res!211562) (not e!174976))))

(declare-datatypes ((array!13730 0))(
  ( (array!13731 (arr!7011 (Array (_ BitVec 32) (_ BitVec 8))) (size!6024 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10970 0))(
  ( (BitStream!10971 (buf!6526 array!13730) (currentByte!11981 (_ BitVec 32)) (currentBit!11976 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!18196 0))(
  ( (Unit!18197) )
))
(declare-datatypes ((tuple2!21714 0))(
  ( (tuple2!21715 (_1!11785 Unit!18196) (_2!11785 BitStream!10970)) )
))
(declare-fun lt!392173 () tuple2!21714)

(declare-fun lt!392179 () tuple2!21714)

(declare-fun lt!392180 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!252502 (= res!211562 (= (bitIndex!0 (size!6024 (buf!6526 (_2!11785 lt!392173))) (currentByte!11981 (_2!11785 lt!392173)) (currentBit!11976 (_2!11785 lt!392173))) (bvadd (bitIndex!0 (size!6024 (buf!6526 (_2!11785 lt!392179))) (currentByte!11981 (_2!11785 lt!392179)) (currentBit!11976 (_2!11785 lt!392179))) lt!392180)))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> b!252502 (= lt!392180 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!252503 () Bool)

(declare-fun e!174979 () Bool)

(declare-fun e!174975 () Bool)

(assert (=> b!252503 (= e!174979 e!174975)))

(declare-fun res!211559 () Bool)

(assert (=> b!252503 (=> (not res!211559) (not e!174975))))

(declare-fun lt!392171 () (_ BitVec 64))

(declare-fun lt!392174 () (_ BitVec 64))

(assert (=> b!252503 (= res!211559 (= lt!392171 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!392174)))))

(assert (=> b!252503 (= lt!392171 (bitIndex!0 (size!6024 (buf!6526 (_2!11785 lt!392179))) (currentByte!11981 (_2!11785 lt!392179)) (currentBit!11976 (_2!11785 lt!392179))))))

(declare-fun thiss!1005 () BitStream!10970)

(assert (=> b!252503 (= lt!392174 (bitIndex!0 (size!6024 (buf!6526 thiss!1005)) (currentByte!11981 thiss!1005) (currentBit!11976 thiss!1005)))))

(declare-fun b!252504 () Bool)

(declare-fun e!174978 () Bool)

(assert (=> b!252504 (= e!174978 (not true))))

(declare-datatypes ((tuple2!21716 0))(
  ( (tuple2!21717 (_1!11786 BitStream!10970) (_2!11786 BitStream!10970)) )
))
(declare-fun lt!392165 () tuple2!21716)

(declare-datatypes ((tuple2!21718 0))(
  ( (tuple2!21719 (_1!11787 BitStream!10970) (_2!11787 Bool)) )
))
(declare-fun lt!392178 () tuple2!21718)

(declare-fun bit!26 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!10970 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21718)

(assert (=> b!252504 (= lt!392178 (checkBitsLoopPure!0 (_1!11786 lt!392165) nBits!297 bit!26 from!289))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!252504 (validate_offset_bits!1 ((_ sign_extend 32) (size!6024 (buf!6526 (_2!11785 lt!392173)))) ((_ sign_extend 32) (currentByte!11981 thiss!1005)) ((_ sign_extend 32) (currentBit!11976 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!392170 () Unit!18196)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10970 array!13730 (_ BitVec 64)) Unit!18196)

(assert (=> b!252504 (= lt!392170 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6526 (_2!11785 lt!392173)) (bvsub nBits!297 from!289)))))

(declare-fun readBitPure!0 (BitStream!10970) tuple2!21718)

(assert (=> b!252504 (= (_2!11787 (readBitPure!0 (_1!11786 lt!392165))) bit!26)))

(declare-fun lt!392163 () tuple2!21716)

(declare-fun reader!0 (BitStream!10970 BitStream!10970) tuple2!21716)

(assert (=> b!252504 (= lt!392163 (reader!0 (_2!11785 lt!392179) (_2!11785 lt!392173)))))

(assert (=> b!252504 (= lt!392165 (reader!0 thiss!1005 (_2!11785 lt!392173)))))

(declare-fun e!174971 () Bool)

(assert (=> b!252504 e!174971))

(declare-fun res!211563 () Bool)

(assert (=> b!252504 (=> (not res!211563) (not e!174971))))

(declare-fun lt!392172 () tuple2!21718)

(declare-fun lt!392169 () tuple2!21718)

(assert (=> b!252504 (= res!211563 (= (bitIndex!0 (size!6024 (buf!6526 (_1!11787 lt!392172))) (currentByte!11981 (_1!11787 lt!392172)) (currentBit!11976 (_1!11787 lt!392172))) (bitIndex!0 (size!6024 (buf!6526 (_1!11787 lt!392169))) (currentByte!11981 (_1!11787 lt!392169)) (currentBit!11976 (_1!11787 lt!392169)))))))

(declare-fun lt!392167 () Unit!18196)

(declare-fun lt!392164 () BitStream!10970)

(declare-fun readBitPrefixLemma!0 (BitStream!10970 BitStream!10970) Unit!18196)

(assert (=> b!252504 (= lt!392167 (readBitPrefixLemma!0 lt!392164 (_2!11785 lt!392173)))))

(assert (=> b!252504 (= lt!392169 (readBitPure!0 (BitStream!10971 (buf!6526 (_2!11785 lt!392173)) (currentByte!11981 thiss!1005) (currentBit!11976 thiss!1005))))))

(assert (=> b!252504 (= lt!392172 (readBitPure!0 lt!392164))))

(assert (=> b!252504 (= lt!392164 (BitStream!10971 (buf!6526 (_2!11785 lt!392179)) (currentByte!11981 thiss!1005) (currentBit!11976 thiss!1005)))))

(declare-fun e!174972 () Bool)

(assert (=> b!252504 e!174972))

(declare-fun res!211558 () Bool)

(assert (=> b!252504 (=> (not res!211558) (not e!174972))))

(declare-fun isPrefixOf!0 (BitStream!10970 BitStream!10970) Bool)

(assert (=> b!252504 (= res!211558 (isPrefixOf!0 thiss!1005 (_2!11785 lt!392173)))))

(declare-fun lt!392166 () Unit!18196)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10970 BitStream!10970 BitStream!10970) Unit!18196)

(assert (=> b!252504 (= lt!392166 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11785 lt!392179) (_2!11785 lt!392173)))))

(assert (=> b!252504 e!174973))

(declare-fun res!211555 () Bool)

(assert (=> b!252504 (=> (not res!211555) (not e!174973))))

(assert (=> b!252504 (= res!211555 (= (size!6024 (buf!6526 (_2!11785 lt!392179))) (size!6024 (buf!6526 (_2!11785 lt!392173)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10970 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21714)

(assert (=> b!252504 (= lt!392173 (appendNBitsLoop!0 (_2!11785 lt!392179) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!252504 (validate_offset_bits!1 ((_ sign_extend 32) (size!6024 (buf!6526 (_2!11785 lt!392179)))) ((_ sign_extend 32) (currentByte!11981 (_2!11785 lt!392179))) ((_ sign_extend 32) (currentBit!11976 (_2!11785 lt!392179))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!392175 () Unit!18196)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10970 BitStream!10970 (_ BitVec 64) (_ BitVec 64)) Unit!18196)

(assert (=> b!252504 (= lt!392175 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11785 lt!392179) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!252504 e!174979))

(declare-fun res!211554 () Bool)

(assert (=> b!252504 (=> (not res!211554) (not e!174979))))

(assert (=> b!252504 (= res!211554 (= (size!6024 (buf!6526 thiss!1005)) (size!6024 (buf!6526 (_2!11785 lt!392179)))))))

(declare-fun appendBit!0 (BitStream!10970 Bool) tuple2!21714)

(assert (=> b!252504 (= lt!392179 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!252505 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!252505 (= e!174972 (invariant!0 (currentBit!11976 thiss!1005) (currentByte!11981 thiss!1005) (size!6024 (buf!6526 (_2!11785 lt!392173)))))))

(declare-fun b!252506 () Bool)

(declare-fun e!174974 () Bool)

(assert (=> b!252506 (= e!174975 e!174974)))

(declare-fun res!211557 () Bool)

(assert (=> b!252506 (=> (not res!211557) (not e!174974))))

(declare-fun lt!392176 () tuple2!21718)

(assert (=> b!252506 (= res!211557 (and (= (_2!11787 lt!392176) bit!26) (= (_1!11787 lt!392176) (_2!11785 lt!392179))))))

(declare-fun readerFrom!0 (BitStream!10970 (_ BitVec 32) (_ BitVec 32)) BitStream!10970)

(assert (=> b!252506 (= lt!392176 (readBitPure!0 (readerFrom!0 (_2!11785 lt!392179) (currentBit!11976 thiss!1005) (currentByte!11981 thiss!1005))))))

(declare-fun res!211553 () Bool)

(assert (=> start!54106 (=> (not res!211553) (not e!174978))))

(assert (=> start!54106 (= res!211553 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!54106 e!174978))

(assert (=> start!54106 true))

(declare-fun e!174980 () Bool)

(declare-fun inv!12 (BitStream!10970) Bool)

(assert (=> start!54106 (and (inv!12 thiss!1005) e!174980)))

(declare-fun b!252507 () Bool)

(declare-fun res!211560 () Bool)

(assert (=> b!252507 (=> (not res!211560) (not e!174975))))

(assert (=> b!252507 (= res!211560 (isPrefixOf!0 thiss!1005 (_2!11785 lt!392179)))))

(declare-fun b!252508 () Bool)

(declare-fun res!211552 () Bool)

(assert (=> b!252508 (=> (not res!211552) (not e!174978))))

(assert (=> b!252508 (= res!211552 (bvslt from!289 nBits!297))))

(declare-fun b!252509 () Bool)

(assert (=> b!252509 (= e!174974 (= (bitIndex!0 (size!6024 (buf!6526 (_1!11787 lt!392176))) (currentByte!11981 (_1!11787 lt!392176)) (currentBit!11976 (_1!11787 lt!392176))) lt!392171))))

(declare-fun b!252510 () Bool)

(declare-fun res!211561 () Bool)

(assert (=> b!252510 (=> (not res!211561) (not e!174978))))

(assert (=> b!252510 (= res!211561 (validate_offset_bits!1 ((_ sign_extend 32) (size!6024 (buf!6526 thiss!1005))) ((_ sign_extend 32) (currentByte!11981 thiss!1005)) ((_ sign_extend 32) (currentBit!11976 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!252511 () Bool)

(assert (=> b!252511 (= e!174971 (= (_2!11787 lt!392172) (_2!11787 lt!392169)))))

(declare-fun b!252512 () Bool)

(declare-fun res!211556 () Bool)

(assert (=> b!252512 (=> (not res!211556) (not e!174972))))

(assert (=> b!252512 (= res!211556 (invariant!0 (currentBit!11976 thiss!1005) (currentByte!11981 thiss!1005) (size!6024 (buf!6526 (_2!11785 lt!392179)))))))

(declare-fun b!252513 () Bool)

(declare-fun res!211551 () Bool)

(assert (=> b!252513 (=> (not res!211551) (not e!174976))))

(assert (=> b!252513 (= res!211551 (isPrefixOf!0 (_2!11785 lt!392179) (_2!11785 lt!392173)))))

(declare-fun b!252514 () Bool)

(declare-fun array_inv!5765 (array!13730) Bool)

(assert (=> b!252514 (= e!174980 (array_inv!5765 (buf!6526 thiss!1005)))))

(declare-fun b!252515 () Bool)

(declare-fun lt!392177 () tuple2!21718)

(declare-fun lt!392181 () tuple2!21716)

(assert (=> b!252515 (= e!174976 (not (or (not (_2!11787 lt!392177)) (not (= (_1!11787 lt!392177) (_2!11786 lt!392181))))))))

(assert (=> b!252515 (= lt!392177 (checkBitsLoopPure!0 (_1!11786 lt!392181) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!252515 (validate_offset_bits!1 ((_ sign_extend 32) (size!6024 (buf!6526 (_2!11785 lt!392173)))) ((_ sign_extend 32) (currentByte!11981 (_2!11785 lt!392179))) ((_ sign_extend 32) (currentBit!11976 (_2!11785 lt!392179))) lt!392180)))

(declare-fun lt!392168 () Unit!18196)

(assert (=> b!252515 (= lt!392168 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11785 lt!392179) (buf!6526 (_2!11785 lt!392173)) lt!392180))))

(assert (=> b!252515 (= lt!392181 (reader!0 (_2!11785 lt!392179) (_2!11785 lt!392173)))))

(assert (= (and start!54106 res!211553) b!252510))

(assert (= (and b!252510 res!211561) b!252508))

(assert (= (and b!252508 res!211552) b!252504))

(assert (= (and b!252504 res!211554) b!252503))

(assert (= (and b!252503 res!211559) b!252507))

(assert (= (and b!252507 res!211560) b!252506))

(assert (= (and b!252506 res!211557) b!252509))

(assert (= (and b!252504 res!211555) b!252502))

(assert (= (and b!252502 res!211562) b!252513))

(assert (= (and b!252513 res!211551) b!252515))

(assert (= (and b!252504 res!211558) b!252512))

(assert (= (and b!252512 res!211556) b!252505))

(assert (= (and b!252504 res!211563) b!252511))

(assert (= start!54106 b!252514))

(declare-fun m!379911 () Bool)

(assert (=> b!252514 m!379911))

(declare-fun m!379913 () Bool)

(assert (=> b!252513 m!379913))

(declare-fun m!379915 () Bool)

(assert (=> b!252512 m!379915))

(declare-fun m!379917 () Bool)

(assert (=> start!54106 m!379917))

(declare-fun m!379919 () Bool)

(assert (=> b!252515 m!379919))

(declare-fun m!379921 () Bool)

(assert (=> b!252515 m!379921))

(declare-fun m!379923 () Bool)

(assert (=> b!252515 m!379923))

(declare-fun m!379925 () Bool)

(assert (=> b!252515 m!379925))

(declare-fun m!379927 () Bool)

(assert (=> b!252506 m!379927))

(assert (=> b!252506 m!379927))

(declare-fun m!379929 () Bool)

(assert (=> b!252506 m!379929))

(declare-fun m!379931 () Bool)

(assert (=> b!252509 m!379931))

(declare-fun m!379933 () Bool)

(assert (=> b!252507 m!379933))

(declare-fun m!379935 () Bool)

(assert (=> b!252504 m!379935))

(declare-fun m!379937 () Bool)

(assert (=> b!252504 m!379937))

(declare-fun m!379939 () Bool)

(assert (=> b!252504 m!379939))

(declare-fun m!379941 () Bool)

(assert (=> b!252504 m!379941))

(declare-fun m!379943 () Bool)

(assert (=> b!252504 m!379943))

(declare-fun m!379945 () Bool)

(assert (=> b!252504 m!379945))

(declare-fun m!379947 () Bool)

(assert (=> b!252504 m!379947))

(declare-fun m!379949 () Bool)

(assert (=> b!252504 m!379949))

(declare-fun m!379951 () Bool)

(assert (=> b!252504 m!379951))

(declare-fun m!379953 () Bool)

(assert (=> b!252504 m!379953))

(declare-fun m!379955 () Bool)

(assert (=> b!252504 m!379955))

(declare-fun m!379957 () Bool)

(assert (=> b!252504 m!379957))

(declare-fun m!379959 () Bool)

(assert (=> b!252504 m!379959))

(assert (=> b!252504 m!379925))

(declare-fun m!379961 () Bool)

(assert (=> b!252504 m!379961))

(declare-fun m!379963 () Bool)

(assert (=> b!252504 m!379963))

(declare-fun m!379965 () Bool)

(assert (=> b!252504 m!379965))

(declare-fun m!379967 () Bool)

(assert (=> b!252510 m!379967))

(declare-fun m!379969 () Bool)

(assert (=> b!252505 m!379969))

(declare-fun m!379971 () Bool)

(assert (=> b!252503 m!379971))

(declare-fun m!379973 () Bool)

(assert (=> b!252503 m!379973))

(declare-fun m!379975 () Bool)

(assert (=> b!252502 m!379975))

(assert (=> b!252502 m!379971))

(push 1)

(assert (not b!252506))

(assert (not b!252512))

(assert (not b!252510))

(assert (not start!54106))

(assert (not b!252505))

(assert (not b!252507))

(assert (not b!252514))

(assert (not b!252504))

(assert (not b!252515))

(assert (not b!252502))

(assert (not b!252513))

(assert (not b!252509))

(assert (not b!252503))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

