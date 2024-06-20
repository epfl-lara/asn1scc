; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53096 () Bool)

(assert start!53096)

(declare-fun b!245947 () Bool)

(declare-fun e!170389 () Bool)

(declare-fun e!170385 () Bool)

(assert (=> b!245947 (= e!170389 e!170385)))

(declare-fun res!205700 () Bool)

(assert (=> b!245947 (=> (not res!205700) (not e!170385))))

(declare-fun lt!383748 () (_ BitVec 64))

(declare-fun lt!383754 () (_ BitVec 64))

(assert (=> b!245947 (= res!205700 (= lt!383748 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!383754)))))

(declare-datatypes ((array!13424 0))(
  ( (array!13425 (arr!6871 (Array (_ BitVec 32) (_ BitVec 8))) (size!5884 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10690 0))(
  ( (BitStream!10691 (buf!6365 array!13424) (currentByte!11761 (_ BitVec 32)) (currentBit!11756 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!17880 0))(
  ( (Unit!17881) )
))
(declare-datatypes ((tuple2!21084 0))(
  ( (tuple2!21085 (_1!11464 Unit!17880) (_2!11464 BitStream!10690)) )
))
(declare-fun lt!383744 () tuple2!21084)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!245947 (= lt!383748 (bitIndex!0 (size!5884 (buf!6365 (_2!11464 lt!383744))) (currentByte!11761 (_2!11464 lt!383744)) (currentBit!11756 (_2!11464 lt!383744))))))

(declare-fun thiss!1005 () BitStream!10690)

(assert (=> b!245947 (= lt!383754 (bitIndex!0 (size!5884 (buf!6365 thiss!1005)) (currentByte!11761 thiss!1005) (currentBit!11756 thiss!1005)))))

(declare-fun b!245948 () Bool)

(declare-fun e!170392 () Bool)

(declare-fun lt!383764 () tuple2!21084)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!245948 (= e!170392 (invariant!0 (currentBit!11756 thiss!1005) (currentByte!11761 thiss!1005) (size!5884 (buf!6365 (_2!11464 lt!383764)))))))

(declare-fun b!245950 () Bool)

(declare-fun e!170383 () Bool)

(declare-datatypes ((tuple2!21086 0))(
  ( (tuple2!21087 (_1!11465 BitStream!10690) (_2!11465 Bool)) )
))
(declare-fun lt!383743 () tuple2!21086)

(declare-fun lt!383763 () tuple2!21086)

(assert (=> b!245950 (= e!170383 (= (_2!11465 lt!383743) (_2!11465 lt!383763)))))

(declare-fun b!245951 () Bool)

(declare-fun res!205707 () Bool)

(declare-fun e!170382 () Bool)

(assert (=> b!245951 (=> (not res!205707) (not e!170382))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(assert (=> b!245951 (= res!205707 (bvslt from!289 nBits!297))))

(declare-fun b!245952 () Bool)

(declare-fun e!170391 () Bool)

(assert (=> b!245952 (= e!170385 e!170391)))

(declare-fun res!205695 () Bool)

(assert (=> b!245952 (=> (not res!205695) (not e!170391))))

(declare-fun bit!26 () Bool)

(declare-fun lt!383753 () tuple2!21086)

(assert (=> b!245952 (= res!205695 (and (= (_2!11465 lt!383753) bit!26) (= (_1!11465 lt!383753) (_2!11464 lt!383744))))))

(declare-fun readBitPure!0 (BitStream!10690) tuple2!21086)

(declare-fun readerFrom!0 (BitStream!10690 (_ BitVec 32) (_ BitVec 32)) BitStream!10690)

(assert (=> b!245952 (= lt!383753 (readBitPure!0 (readerFrom!0 (_2!11464 lt!383744) (currentBit!11756 thiss!1005) (currentByte!11761 thiss!1005))))))

(declare-fun b!245953 () Bool)

(declare-fun e!170384 () Bool)

(declare-fun e!170386 () Bool)

(assert (=> b!245953 (= e!170384 e!170386)))

(declare-fun res!205705 () Bool)

(assert (=> b!245953 (=> (not res!205705) (not e!170386))))

(declare-fun lt!383757 () (_ BitVec 64))

(assert (=> b!245953 (= res!205705 (= (bitIndex!0 (size!5884 (buf!6365 (_2!11464 lt!383764))) (currentByte!11761 (_2!11464 lt!383764)) (currentBit!11756 (_2!11464 lt!383764))) (bvadd (bitIndex!0 (size!5884 (buf!6365 (_2!11464 lt!383744))) (currentByte!11761 (_2!11464 lt!383744)) (currentBit!11756 (_2!11464 lt!383744))) lt!383757)))))

(assert (=> b!245953 (= lt!383757 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!245954 () Bool)

(assert (=> b!245954 (= e!170391 (= (bitIndex!0 (size!5884 (buf!6365 (_1!11465 lt!383753))) (currentByte!11761 (_1!11465 lt!383753)) (currentBit!11756 (_1!11465 lt!383753))) lt!383748))))

(declare-fun b!245955 () Bool)

(declare-fun res!205706 () Bool)

(declare-fun e!170388 () Bool)

(assert (=> b!245955 (=> res!205706 e!170388)))

(declare-datatypes ((tuple2!21088 0))(
  ( (tuple2!21089 (_1!11466 BitStream!10690) (_2!11466 BitStream!10690)) )
))
(declare-fun lt!383762 () tuple2!21088)

(declare-fun lt!383759 () tuple2!21088)

(declare-fun withMovedBitIndex!0 (BitStream!10690 (_ BitVec 64)) BitStream!10690)

(assert (=> b!245955 (= res!205706 (not (= (_1!11466 lt!383762) (withMovedBitIndex!0 (_1!11466 lt!383759) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!245956 () Bool)

(declare-fun lt!383761 () tuple2!21086)

(declare-fun lt!383752 () tuple2!21088)

(assert (=> b!245956 (= e!170386 (not (or (not (_2!11465 lt!383761)) (not (= (_1!11465 lt!383761) (_2!11466 lt!383752))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10690 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21086)

(assert (=> b!245956 (= lt!383761 (checkBitsLoopPure!0 (_1!11466 lt!383752) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!245956 (validate_offset_bits!1 ((_ sign_extend 32) (size!5884 (buf!6365 (_2!11464 lt!383764)))) ((_ sign_extend 32) (currentByte!11761 (_2!11464 lt!383744))) ((_ sign_extend 32) (currentBit!11756 (_2!11464 lt!383744))) lt!383757)))

(declare-fun lt!383751 () Unit!17880)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10690 array!13424 (_ BitVec 64)) Unit!17880)

(assert (=> b!245956 (= lt!383751 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11464 lt!383744) (buf!6365 (_2!11464 lt!383764)) lt!383757))))

(declare-fun reader!0 (BitStream!10690 BitStream!10690) tuple2!21088)

(assert (=> b!245956 (= lt!383752 (reader!0 (_2!11464 lt!383744) (_2!11464 lt!383764)))))

(declare-fun b!245957 () Bool)

(declare-fun res!205694 () Bool)

(assert (=> b!245957 (=> (not res!205694) (not e!170385))))

(declare-fun isPrefixOf!0 (BitStream!10690 BitStream!10690) Bool)

(assert (=> b!245957 (= res!205694 (isPrefixOf!0 thiss!1005 (_2!11464 lt!383744)))))

(declare-fun b!245958 () Bool)

(declare-fun res!205692 () Bool)

(assert (=> b!245958 (=> (not res!205692) (not e!170392))))

(assert (=> b!245958 (= res!205692 (invariant!0 (currentBit!11756 thiss!1005) (currentByte!11761 thiss!1005) (size!5884 (buf!6365 (_2!11464 lt!383744)))))))

(declare-fun b!245959 () Bool)

(declare-fun e!170393 () Bool)

(assert (=> b!245959 (= e!170393 true)))

(declare-fun lt!383758 () (_ BitVec 64))

(assert (=> b!245959 (= lt!383758 (bitIndex!0 (size!5884 (buf!6365 (_2!11464 lt!383764))) (currentByte!11761 (_2!11464 lt!383764)) (currentBit!11756 (_2!11464 lt!383764))))))

(declare-fun lt!383766 () (_ BitVec 64))

(assert (=> b!245959 (= lt!383766 (bitIndex!0 (size!5884 (buf!6365 thiss!1005)) (currentByte!11761 thiss!1005) (currentBit!11756 thiss!1005)))))

(declare-fun b!245960 () Bool)

(assert (=> b!245960 (= e!170388 e!170393)))

(declare-fun res!205703 () Bool)

(assert (=> b!245960 (=> res!205703 e!170393)))

(assert (=> b!245960 (= res!205703 (not (= (size!5884 (buf!6365 thiss!1005)) (size!5884 (buf!6365 (_2!11464 lt!383764))))))))

(declare-fun lt!383745 () tuple2!21086)

(declare-fun lt!383765 () tuple2!21086)

(assert (=> b!245960 (and (= (_2!11465 lt!383745) (_2!11465 lt!383765)) (= (_1!11465 lt!383745) (_2!11466 lt!383759)))))

(declare-fun b!245961 () Bool)

(declare-fun res!205699 () Bool)

(assert (=> b!245961 (=> (not res!205699) (not e!170386))))

(assert (=> b!245961 (= res!205699 (isPrefixOf!0 (_2!11464 lt!383744) (_2!11464 lt!383764)))))

(declare-fun b!245949 () Bool)

(declare-fun res!205704 () Bool)

(assert (=> b!245949 (=> (not res!205704) (not e!170382))))

(assert (=> b!245949 (= res!205704 (validate_offset_bits!1 ((_ sign_extend 32) (size!5884 (buf!6365 thiss!1005))) ((_ sign_extend 32) (currentByte!11761 thiss!1005)) ((_ sign_extend 32) (currentBit!11756 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun res!205697 () Bool)

(assert (=> start!53096 (=> (not res!205697) (not e!170382))))

(assert (=> start!53096 (= res!205697 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53096 e!170382))

(assert (=> start!53096 true))

(declare-fun e!170390 () Bool)

(declare-fun inv!12 (BitStream!10690) Bool)

(assert (=> start!53096 (and (inv!12 thiss!1005) e!170390)))

(declare-fun b!245962 () Bool)

(declare-fun array_inv!5625 (array!13424) Bool)

(assert (=> b!245962 (= e!170390 (array_inv!5625 (buf!6365 thiss!1005)))))

(declare-fun b!245963 () Bool)

(assert (=> b!245963 (= e!170382 (not e!170388))))

(declare-fun res!205693 () Bool)

(assert (=> b!245963 (=> res!205693 e!170388)))

(assert (=> b!245963 (= res!205693 (not (= (_1!11465 lt!383765) (_2!11466 lt!383762))))))

(assert (=> b!245963 (= lt!383765 (checkBitsLoopPure!0 (_1!11466 lt!383762) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!383755 () (_ BitVec 64))

(assert (=> b!245963 (validate_offset_bits!1 ((_ sign_extend 32) (size!5884 (buf!6365 (_2!11464 lt!383764)))) ((_ sign_extend 32) (currentByte!11761 (_2!11464 lt!383744))) ((_ sign_extend 32) (currentBit!11756 (_2!11464 lt!383744))) lt!383755)))

(declare-fun lt!383756 () Unit!17880)

(assert (=> b!245963 (= lt!383756 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11464 lt!383744) (buf!6365 (_2!11464 lt!383764)) lt!383755))))

(assert (=> b!245963 (= lt!383745 (checkBitsLoopPure!0 (_1!11466 lt!383759) nBits!297 bit!26 from!289))))

(assert (=> b!245963 (validate_offset_bits!1 ((_ sign_extend 32) (size!5884 (buf!6365 (_2!11464 lt!383764)))) ((_ sign_extend 32) (currentByte!11761 thiss!1005)) ((_ sign_extend 32) (currentBit!11756 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!383746 () Unit!17880)

(assert (=> b!245963 (= lt!383746 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6365 (_2!11464 lt!383764)) (bvsub nBits!297 from!289)))))

(assert (=> b!245963 (= (_2!11465 (readBitPure!0 (_1!11466 lt!383759))) bit!26)))

(assert (=> b!245963 (= lt!383762 (reader!0 (_2!11464 lt!383744) (_2!11464 lt!383764)))))

(assert (=> b!245963 (= lt!383759 (reader!0 thiss!1005 (_2!11464 lt!383764)))))

(assert (=> b!245963 e!170383))

(declare-fun res!205702 () Bool)

(assert (=> b!245963 (=> (not res!205702) (not e!170383))))

(assert (=> b!245963 (= res!205702 (= (bitIndex!0 (size!5884 (buf!6365 (_1!11465 lt!383743))) (currentByte!11761 (_1!11465 lt!383743)) (currentBit!11756 (_1!11465 lt!383743))) (bitIndex!0 (size!5884 (buf!6365 (_1!11465 lt!383763))) (currentByte!11761 (_1!11465 lt!383763)) (currentBit!11756 (_1!11465 lt!383763)))))))

(declare-fun lt!383749 () Unit!17880)

(declare-fun lt!383750 () BitStream!10690)

(declare-fun readBitPrefixLemma!0 (BitStream!10690 BitStream!10690) Unit!17880)

(assert (=> b!245963 (= lt!383749 (readBitPrefixLemma!0 lt!383750 (_2!11464 lt!383764)))))

(assert (=> b!245963 (= lt!383763 (readBitPure!0 (BitStream!10691 (buf!6365 (_2!11464 lt!383764)) (currentByte!11761 thiss!1005) (currentBit!11756 thiss!1005))))))

(assert (=> b!245963 (= lt!383743 (readBitPure!0 lt!383750))))

(assert (=> b!245963 (= lt!383750 (BitStream!10691 (buf!6365 (_2!11464 lt!383744)) (currentByte!11761 thiss!1005) (currentBit!11756 thiss!1005)))))

(assert (=> b!245963 e!170392))

(declare-fun res!205696 () Bool)

(assert (=> b!245963 (=> (not res!205696) (not e!170392))))

(assert (=> b!245963 (= res!205696 (isPrefixOf!0 thiss!1005 (_2!11464 lt!383764)))))

(declare-fun lt!383760 () Unit!17880)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10690 BitStream!10690 BitStream!10690) Unit!17880)

(assert (=> b!245963 (= lt!383760 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11464 lt!383744) (_2!11464 lt!383764)))))

(assert (=> b!245963 e!170384))

(declare-fun res!205701 () Bool)

(assert (=> b!245963 (=> (not res!205701) (not e!170384))))

(assert (=> b!245963 (= res!205701 (= (size!5884 (buf!6365 (_2!11464 lt!383744))) (size!5884 (buf!6365 (_2!11464 lt!383764)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10690 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21084)

(assert (=> b!245963 (= lt!383764 (appendNBitsLoop!0 (_2!11464 lt!383744) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!245963 (validate_offset_bits!1 ((_ sign_extend 32) (size!5884 (buf!6365 (_2!11464 lt!383744)))) ((_ sign_extend 32) (currentByte!11761 (_2!11464 lt!383744))) ((_ sign_extend 32) (currentBit!11756 (_2!11464 lt!383744))) lt!383755)))

(assert (=> b!245963 (= lt!383755 (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!383747 () Unit!17880)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10690 BitStream!10690 (_ BitVec 64) (_ BitVec 64)) Unit!17880)

(assert (=> b!245963 (= lt!383747 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11464 lt!383744) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!245963 e!170389))

(declare-fun res!205698 () Bool)

(assert (=> b!245963 (=> (not res!205698) (not e!170389))))

(assert (=> b!245963 (= res!205698 (= (size!5884 (buf!6365 thiss!1005)) (size!5884 (buf!6365 (_2!11464 lt!383744)))))))

(declare-fun appendBit!0 (BitStream!10690 Bool) tuple2!21084)

(assert (=> b!245963 (= lt!383744 (appendBit!0 thiss!1005 bit!26))))

(assert (= (and start!53096 res!205697) b!245949))

(assert (= (and b!245949 res!205704) b!245951))

(assert (= (and b!245951 res!205707) b!245963))

(assert (= (and b!245963 res!205698) b!245947))

(assert (= (and b!245947 res!205700) b!245957))

(assert (= (and b!245957 res!205694) b!245952))

(assert (= (and b!245952 res!205695) b!245954))

(assert (= (and b!245963 res!205701) b!245953))

(assert (= (and b!245953 res!205705) b!245961))

(assert (= (and b!245961 res!205699) b!245956))

(assert (= (and b!245963 res!205696) b!245958))

(assert (= (and b!245958 res!205692) b!245948))

(assert (= (and b!245963 res!205702) b!245950))

(assert (= (and b!245963 (not res!205693)) b!245955))

(assert (= (and b!245955 (not res!205706)) b!245960))

(assert (= (and b!245960 (not res!205703)) b!245959))

(assert (= start!53096 b!245962))

(declare-fun m!370961 () Bool)

(assert (=> b!245955 m!370961))

(declare-fun m!370963 () Bool)

(assert (=> b!245949 m!370963))

(declare-fun m!370965 () Bool)

(assert (=> b!245947 m!370965))

(declare-fun m!370967 () Bool)

(assert (=> b!245947 m!370967))

(declare-fun m!370969 () Bool)

(assert (=> b!245948 m!370969))

(declare-fun m!370971 () Bool)

(assert (=> b!245956 m!370971))

(declare-fun m!370973 () Bool)

(assert (=> b!245956 m!370973))

(declare-fun m!370975 () Bool)

(assert (=> b!245956 m!370975))

(declare-fun m!370977 () Bool)

(assert (=> b!245956 m!370977))

(declare-fun m!370979 () Bool)

(assert (=> b!245963 m!370979))

(declare-fun m!370981 () Bool)

(assert (=> b!245963 m!370981))

(declare-fun m!370983 () Bool)

(assert (=> b!245963 m!370983))

(declare-fun m!370985 () Bool)

(assert (=> b!245963 m!370985))

(declare-fun m!370987 () Bool)

(assert (=> b!245963 m!370987))

(assert (=> b!245963 m!370977))

(declare-fun m!370989 () Bool)

(assert (=> b!245963 m!370989))

(declare-fun m!370991 () Bool)

(assert (=> b!245963 m!370991))

(declare-fun m!370993 () Bool)

(assert (=> b!245963 m!370993))

(declare-fun m!370995 () Bool)

(assert (=> b!245963 m!370995))

(declare-fun m!370997 () Bool)

(assert (=> b!245963 m!370997))

(declare-fun m!370999 () Bool)

(assert (=> b!245963 m!370999))

(declare-fun m!371001 () Bool)

(assert (=> b!245963 m!371001))

(declare-fun m!371003 () Bool)

(assert (=> b!245963 m!371003))

(declare-fun m!371005 () Bool)

(assert (=> b!245963 m!371005))

(declare-fun m!371007 () Bool)

(assert (=> b!245963 m!371007))

(declare-fun m!371009 () Bool)

(assert (=> b!245963 m!371009))

(declare-fun m!371011 () Bool)

(assert (=> b!245963 m!371011))

(declare-fun m!371013 () Bool)

(assert (=> b!245963 m!371013))

(declare-fun m!371015 () Bool)

(assert (=> b!245963 m!371015))

(declare-fun m!371017 () Bool)

(assert (=> start!53096 m!371017))

(declare-fun m!371019 () Bool)

(assert (=> b!245952 m!371019))

(assert (=> b!245952 m!371019))

(declare-fun m!371021 () Bool)

(assert (=> b!245952 m!371021))

(declare-fun m!371023 () Bool)

(assert (=> b!245961 m!371023))

(declare-fun m!371025 () Bool)

(assert (=> b!245953 m!371025))

(assert (=> b!245953 m!370965))

(declare-fun m!371027 () Bool)

(assert (=> b!245957 m!371027))

(assert (=> b!245959 m!371025))

(assert (=> b!245959 m!370967))

(declare-fun m!371029 () Bool)

(assert (=> b!245958 m!371029))

(declare-fun m!371031 () Bool)

(assert (=> b!245954 m!371031))

(declare-fun m!371033 () Bool)

(assert (=> b!245962 m!371033))

(push 1)

(assert (not b!245962))

(assert (not b!245961))

(assert (not b!245955))

(assert (not b!245959))

(assert (not start!53096))

(assert (not b!245957))

(assert (not b!245963))

