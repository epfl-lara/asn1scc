; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53122 () Bool)

(assert start!53122)

(declare-fun b!246610 () Bool)

(declare-fun e!170850 () Bool)

(declare-fun e!170854 () Bool)

(assert (=> b!246610 (= e!170850 e!170854)))

(declare-fun res!206321 () Bool)

(assert (=> b!246610 (=> (not res!206321) (not e!170854))))

(declare-datatypes ((array!13450 0))(
  ( (array!13451 (arr!6884 (Array (_ BitVec 32) (_ BitVec 8))) (size!5897 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10716 0))(
  ( (BitStream!10717 (buf!6378 array!13450) (currentByte!11774 (_ BitVec 32)) (currentBit!11769 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!21162 0))(
  ( (tuple2!21163 (_1!11503 BitStream!10716) (_2!11503 Bool)) )
))
(declare-fun lt!384694 () tuple2!21162)

(declare-datatypes ((Unit!17906 0))(
  ( (Unit!17907) )
))
(declare-datatypes ((tuple2!21164 0))(
  ( (tuple2!21165 (_1!11504 Unit!17906) (_2!11504 BitStream!10716)) )
))
(declare-fun lt!384681 () tuple2!21164)

(declare-fun bit!26 () Bool)

(assert (=> b!246610 (= res!206321 (and (= (_2!11503 lt!384694) bit!26) (= (_1!11503 lt!384694) (_2!11504 lt!384681))))))

(declare-fun thiss!1005 () BitStream!10716)

(declare-fun readBitPure!0 (BitStream!10716) tuple2!21162)

(declare-fun readerFrom!0 (BitStream!10716 (_ BitVec 32) (_ BitVec 32)) BitStream!10716)

(assert (=> b!246610 (= lt!384694 (readBitPure!0 (readerFrom!0 (_2!11504 lt!384681) (currentBit!11769 thiss!1005) (currentByte!11774 thiss!1005))))))

(declare-fun b!246611 () Bool)

(declare-fun e!170855 () Bool)

(declare-fun e!170852 () Bool)

(assert (=> b!246611 (= e!170855 (not e!170852))))

(declare-fun res!206319 () Bool)

(assert (=> b!246611 (=> res!206319 e!170852)))

(declare-fun lt!384698 () tuple2!21162)

(declare-datatypes ((tuple2!21166 0))(
  ( (tuple2!21167 (_1!11505 BitStream!10716) (_2!11505 BitStream!10716)) )
))
(declare-fun lt!384699 () tuple2!21166)

(assert (=> b!246611 (= res!206319 (not (= (_1!11503 lt!384698) (_2!11505 lt!384699))))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun checkBitsLoopPure!0 (BitStream!10716 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21162)

(assert (=> b!246611 (= lt!384698 (checkBitsLoopPure!0 (_1!11505 lt!384699) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!384692 () tuple2!21164)

(declare-fun lt!384693 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!246611 (validate_offset_bits!1 ((_ sign_extend 32) (size!5897 (buf!6378 (_2!11504 lt!384692)))) ((_ sign_extend 32) (currentByte!11774 (_2!11504 lt!384681))) ((_ sign_extend 32) (currentBit!11769 (_2!11504 lt!384681))) lt!384693)))

(declare-fun lt!384685 () Unit!17906)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10716 array!13450 (_ BitVec 64)) Unit!17906)

(assert (=> b!246611 (= lt!384685 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11504 lt!384681) (buf!6378 (_2!11504 lt!384692)) lt!384693))))

(declare-fun lt!384679 () tuple2!21166)

(declare-fun lt!384695 () tuple2!21162)

(assert (=> b!246611 (= lt!384695 (checkBitsLoopPure!0 (_1!11505 lt!384679) nBits!297 bit!26 from!289))))

(assert (=> b!246611 (validate_offset_bits!1 ((_ sign_extend 32) (size!5897 (buf!6378 (_2!11504 lt!384692)))) ((_ sign_extend 32) (currentByte!11774 thiss!1005)) ((_ sign_extend 32) (currentBit!11769 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!384697 () Unit!17906)

(assert (=> b!246611 (= lt!384697 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6378 (_2!11504 lt!384692)) (bvsub nBits!297 from!289)))))

(assert (=> b!246611 (= (_2!11503 (readBitPure!0 (_1!11505 lt!384679))) bit!26)))

(declare-fun reader!0 (BitStream!10716 BitStream!10716) tuple2!21166)

(assert (=> b!246611 (= lt!384699 (reader!0 (_2!11504 lt!384681) (_2!11504 lt!384692)))))

(assert (=> b!246611 (= lt!384679 (reader!0 thiss!1005 (_2!11504 lt!384692)))))

(declare-fun e!170861 () Bool)

(assert (=> b!246611 e!170861))

(declare-fun res!206329 () Bool)

(assert (=> b!246611 (=> (not res!206329) (not e!170861))))

(declare-fun lt!384702 () tuple2!21162)

(declare-fun lt!384683 () tuple2!21162)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!246611 (= res!206329 (= (bitIndex!0 (size!5897 (buf!6378 (_1!11503 lt!384702))) (currentByte!11774 (_1!11503 lt!384702)) (currentBit!11769 (_1!11503 lt!384702))) (bitIndex!0 (size!5897 (buf!6378 (_1!11503 lt!384683))) (currentByte!11774 (_1!11503 lt!384683)) (currentBit!11769 (_1!11503 lt!384683)))))))

(declare-fun lt!384682 () Unit!17906)

(declare-fun lt!384688 () BitStream!10716)

(declare-fun readBitPrefixLemma!0 (BitStream!10716 BitStream!10716) Unit!17906)

(assert (=> b!246611 (= lt!384682 (readBitPrefixLemma!0 lt!384688 (_2!11504 lt!384692)))))

(assert (=> b!246611 (= lt!384683 (readBitPure!0 (BitStream!10717 (buf!6378 (_2!11504 lt!384692)) (currentByte!11774 thiss!1005) (currentBit!11769 thiss!1005))))))

(assert (=> b!246611 (= lt!384702 (readBitPure!0 lt!384688))))

(assert (=> b!246611 (= lt!384688 (BitStream!10717 (buf!6378 (_2!11504 lt!384681)) (currentByte!11774 thiss!1005) (currentBit!11769 thiss!1005)))))

(declare-fun e!170859 () Bool)

(assert (=> b!246611 e!170859))

(declare-fun res!206327 () Bool)

(assert (=> b!246611 (=> (not res!206327) (not e!170859))))

(declare-fun isPrefixOf!0 (BitStream!10716 BitStream!10716) Bool)

(assert (=> b!246611 (= res!206327 (isPrefixOf!0 thiss!1005 (_2!11504 lt!384692)))))

(declare-fun lt!384691 () Unit!17906)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10716 BitStream!10716 BitStream!10716) Unit!17906)

(assert (=> b!246611 (= lt!384691 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11504 lt!384681) (_2!11504 lt!384692)))))

(declare-fun e!170851 () Bool)

(assert (=> b!246611 e!170851))

(declare-fun res!206328 () Bool)

(assert (=> b!246611 (=> (not res!206328) (not e!170851))))

(assert (=> b!246611 (= res!206328 (= (size!5897 (buf!6378 (_2!11504 lt!384681))) (size!5897 (buf!6378 (_2!11504 lt!384692)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10716 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21164)

(assert (=> b!246611 (= lt!384692 (appendNBitsLoop!0 (_2!11504 lt!384681) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!246611 (validate_offset_bits!1 ((_ sign_extend 32) (size!5897 (buf!6378 (_2!11504 lt!384681)))) ((_ sign_extend 32) (currentByte!11774 (_2!11504 lt!384681))) ((_ sign_extend 32) (currentBit!11769 (_2!11504 lt!384681))) lt!384693)))

(assert (=> b!246611 (= lt!384693 (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!384701 () Unit!17906)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10716 BitStream!10716 (_ BitVec 64) (_ BitVec 64)) Unit!17906)

(assert (=> b!246611 (= lt!384701 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11504 lt!384681) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!170853 () Bool)

(assert (=> b!246611 e!170853))

(declare-fun res!206324 () Bool)

(assert (=> b!246611 (=> (not res!206324) (not e!170853))))

(assert (=> b!246611 (= res!206324 (= (size!5897 (buf!6378 thiss!1005)) (size!5897 (buf!6378 (_2!11504 lt!384681)))))))

(declare-fun appendBit!0 (BitStream!10716 Bool) tuple2!21164)

(assert (=> b!246611 (= lt!384681 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!246612 () Bool)

(declare-fun res!206326 () Bool)

(assert (=> b!246612 (=> (not res!206326) (not e!170855))))

(assert (=> b!246612 (= res!206326 (bvslt from!289 nBits!297))))

(declare-fun b!246613 () Bool)

(declare-fun res!206318 () Bool)

(assert (=> b!246613 (=> (not res!206318) (not e!170855))))

(assert (=> b!246613 (= res!206318 (validate_offset_bits!1 ((_ sign_extend 32) (size!5897 (buf!6378 thiss!1005))) ((_ sign_extend 32) (currentByte!11774 thiss!1005)) ((_ sign_extend 32) (currentBit!11769 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!246614 () Bool)

(declare-fun e!170856 () Bool)

(declare-fun lt!384684 () tuple2!21162)

(declare-fun lt!384696 () tuple2!21166)

(assert (=> b!246614 (= e!170856 (not (or (not (_2!11503 lt!384684)) (not (= (_1!11503 lt!384684) (_2!11505 lt!384696))))))))

(assert (=> b!246614 (= lt!384684 (checkBitsLoopPure!0 (_1!11505 lt!384696) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!384686 () (_ BitVec 64))

(assert (=> b!246614 (validate_offset_bits!1 ((_ sign_extend 32) (size!5897 (buf!6378 (_2!11504 lt!384692)))) ((_ sign_extend 32) (currentByte!11774 (_2!11504 lt!384681))) ((_ sign_extend 32) (currentBit!11769 (_2!11504 lt!384681))) lt!384686)))

(declare-fun lt!384680 () Unit!17906)

(assert (=> b!246614 (= lt!384680 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11504 lt!384681) (buf!6378 (_2!11504 lt!384692)) lt!384686))))

(assert (=> b!246614 (= lt!384696 (reader!0 (_2!11504 lt!384681) (_2!11504 lt!384692)))))

(declare-fun b!246615 () Bool)

(assert (=> b!246615 (= e!170851 e!170856)))

(declare-fun res!206322 () Bool)

(assert (=> b!246615 (=> (not res!206322) (not e!170856))))

(assert (=> b!246615 (= res!206322 (= (bitIndex!0 (size!5897 (buf!6378 (_2!11504 lt!384692))) (currentByte!11774 (_2!11504 lt!384692)) (currentBit!11769 (_2!11504 lt!384692))) (bvadd (bitIndex!0 (size!5897 (buf!6378 (_2!11504 lt!384681))) (currentByte!11774 (_2!11504 lt!384681)) (currentBit!11769 (_2!11504 lt!384681))) lt!384686)))))

(assert (=> b!246615 (= lt!384686 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!246617 () Bool)

(declare-fun e!170858 () Bool)

(assert (=> b!246617 (= e!170858 true)))

(declare-fun lt!384687 () (_ BitVec 64))

(assert (=> b!246617 (= lt!384687 (bitIndex!0 (size!5897 (buf!6378 (_2!11504 lt!384692))) (currentByte!11774 (_2!11504 lt!384692)) (currentBit!11769 (_2!11504 lt!384692))))))

(declare-fun lt!384700 () (_ BitVec 64))

(assert (=> b!246617 (= lt!384700 (bitIndex!0 (size!5897 (buf!6378 thiss!1005)) (currentByte!11774 thiss!1005) (currentBit!11769 thiss!1005)))))

(declare-fun b!246618 () Bool)

(declare-fun res!206323 () Bool)

(assert (=> b!246618 (=> (not res!206323) (not e!170850))))

(assert (=> b!246618 (= res!206323 (isPrefixOf!0 thiss!1005 (_2!11504 lt!384681)))))

(declare-fun b!246619 () Bool)

(declare-fun res!206331 () Bool)

(assert (=> b!246619 (=> res!206331 e!170852)))

(declare-fun withMovedBitIndex!0 (BitStream!10716 (_ BitVec 64)) BitStream!10716)

(assert (=> b!246619 (= res!206331 (not (= (_1!11505 lt!384699) (withMovedBitIndex!0 (_1!11505 lt!384679) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!246620 () Bool)

(declare-fun lt!384690 () (_ BitVec 64))

(assert (=> b!246620 (= e!170854 (= (bitIndex!0 (size!5897 (buf!6378 (_1!11503 lt!384694))) (currentByte!11774 (_1!11503 lt!384694)) (currentBit!11769 (_1!11503 lt!384694))) lt!384690))))

(declare-fun b!246621 () Bool)

(declare-fun res!206330 () Bool)

(assert (=> b!246621 (=> (not res!206330) (not e!170859))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!246621 (= res!206330 (invariant!0 (currentBit!11769 thiss!1005) (currentByte!11774 thiss!1005) (size!5897 (buf!6378 (_2!11504 lt!384681)))))))

(declare-fun b!246622 () Bool)

(assert (=> b!246622 (= e!170852 e!170858)))

(declare-fun res!206316 () Bool)

(assert (=> b!246622 (=> res!206316 e!170858)))

(assert (=> b!246622 (= res!206316 (not (= (size!5897 (buf!6378 thiss!1005)) (size!5897 (buf!6378 (_2!11504 lt!384692))))))))

(assert (=> b!246622 (and (= (_2!11503 lt!384695) (_2!11503 lt!384698)) (= (_1!11503 lt!384695) (_2!11505 lt!384679)))))

(declare-fun b!246623 () Bool)

(declare-fun e!170857 () Bool)

(declare-fun array_inv!5638 (array!13450) Bool)

(assert (=> b!246623 (= e!170857 (array_inv!5638 (buf!6378 thiss!1005)))))

(declare-fun b!246624 () Bool)

(assert (=> b!246624 (= e!170853 e!170850)))

(declare-fun res!206325 () Bool)

(assert (=> b!246624 (=> (not res!206325) (not e!170850))))

(declare-fun lt!384689 () (_ BitVec 64))

(assert (=> b!246624 (= res!206325 (= lt!384690 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!384689)))))

(assert (=> b!246624 (= lt!384690 (bitIndex!0 (size!5897 (buf!6378 (_2!11504 lt!384681))) (currentByte!11774 (_2!11504 lt!384681)) (currentBit!11769 (_2!11504 lt!384681))))))

(assert (=> b!246624 (= lt!384689 (bitIndex!0 (size!5897 (buf!6378 thiss!1005)) (currentByte!11774 thiss!1005) (currentBit!11769 thiss!1005)))))

(declare-fun b!246616 () Bool)

(assert (=> b!246616 (= e!170859 (invariant!0 (currentBit!11769 thiss!1005) (currentByte!11774 thiss!1005) (size!5897 (buf!6378 (_2!11504 lt!384692)))))))

(declare-fun res!206320 () Bool)

(assert (=> start!53122 (=> (not res!206320) (not e!170855))))

(assert (=> start!53122 (= res!206320 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53122 e!170855))

(assert (=> start!53122 true))

(declare-fun inv!12 (BitStream!10716) Bool)

(assert (=> start!53122 (and (inv!12 thiss!1005) e!170857)))

(declare-fun b!246625 () Bool)

(declare-fun res!206317 () Bool)

(assert (=> b!246625 (=> (not res!206317) (not e!170856))))

(assert (=> b!246625 (= res!206317 (isPrefixOf!0 (_2!11504 lt!384681) (_2!11504 lt!384692)))))

(declare-fun b!246626 () Bool)

(assert (=> b!246626 (= e!170861 (= (_2!11503 lt!384702) (_2!11503 lt!384683)))))

(assert (= (and start!53122 res!206320) b!246613))

(assert (= (and b!246613 res!206318) b!246612))

(assert (= (and b!246612 res!206326) b!246611))

(assert (= (and b!246611 res!206324) b!246624))

(assert (= (and b!246624 res!206325) b!246618))

(assert (= (and b!246618 res!206323) b!246610))

(assert (= (and b!246610 res!206321) b!246620))

(assert (= (and b!246611 res!206328) b!246615))

(assert (= (and b!246615 res!206322) b!246625))

(assert (= (and b!246625 res!206317) b!246614))

(assert (= (and b!246611 res!206327) b!246621))

(assert (= (and b!246621 res!206330) b!246616))

(assert (= (and b!246611 res!206329) b!246626))

(assert (= (and b!246611 (not res!206319)) b!246619))

(assert (= (and b!246619 (not res!206331)) b!246622))

(assert (= (and b!246622 (not res!206316)) b!246617))

(assert (= start!53122 b!246623))

(declare-fun m!371923 () Bool)

(assert (=> b!246620 m!371923))

(declare-fun m!371925 () Bool)

(assert (=> b!246621 m!371925))

(declare-fun m!371927 () Bool)

(assert (=> b!246618 m!371927))

(declare-fun m!371929 () Bool)

(assert (=> start!53122 m!371929))

(declare-fun m!371931 () Bool)

(assert (=> b!246614 m!371931))

(declare-fun m!371933 () Bool)

(assert (=> b!246614 m!371933))

(declare-fun m!371935 () Bool)

(assert (=> b!246614 m!371935))

(declare-fun m!371937 () Bool)

(assert (=> b!246614 m!371937))

(declare-fun m!371939 () Bool)

(assert (=> b!246611 m!371939))

(declare-fun m!371941 () Bool)

(assert (=> b!246611 m!371941))

(declare-fun m!371943 () Bool)

(assert (=> b!246611 m!371943))

(assert (=> b!246611 m!371937))

(declare-fun m!371945 () Bool)

(assert (=> b!246611 m!371945))

(declare-fun m!371947 () Bool)

(assert (=> b!246611 m!371947))

(declare-fun m!371949 () Bool)

(assert (=> b!246611 m!371949))

(declare-fun m!371951 () Bool)

(assert (=> b!246611 m!371951))

(declare-fun m!371953 () Bool)

(assert (=> b!246611 m!371953))

(declare-fun m!371955 () Bool)

(assert (=> b!246611 m!371955))

(declare-fun m!371957 () Bool)

(assert (=> b!246611 m!371957))

(declare-fun m!371959 () Bool)

(assert (=> b!246611 m!371959))

(declare-fun m!371961 () Bool)

(assert (=> b!246611 m!371961))

(declare-fun m!371963 () Bool)

(assert (=> b!246611 m!371963))

(declare-fun m!371965 () Bool)

(assert (=> b!246611 m!371965))

(declare-fun m!371967 () Bool)

(assert (=> b!246611 m!371967))

(declare-fun m!371969 () Bool)

(assert (=> b!246611 m!371969))

(declare-fun m!371971 () Bool)

(assert (=> b!246611 m!371971))

(declare-fun m!371973 () Bool)

(assert (=> b!246611 m!371973))

(declare-fun m!371975 () Bool)

(assert (=> b!246611 m!371975))

(declare-fun m!371977 () Bool)

(assert (=> b!246625 m!371977))

(declare-fun m!371979 () Bool)

(assert (=> b!246615 m!371979))

(declare-fun m!371981 () Bool)

(assert (=> b!246615 m!371981))

(declare-fun m!371983 () Bool)

(assert (=> b!246613 m!371983))

(declare-fun m!371985 () Bool)

(assert (=> b!246616 m!371985))

(assert (=> b!246617 m!371979))

(declare-fun m!371987 () Bool)

(assert (=> b!246617 m!371987))

(declare-fun m!371989 () Bool)

(assert (=> b!246610 m!371989))

(assert (=> b!246610 m!371989))

(declare-fun m!371991 () Bool)

(assert (=> b!246610 m!371991))

(assert (=> b!246624 m!371981))

(assert (=> b!246624 m!371987))

(declare-fun m!371993 () Bool)

(assert (=> b!246623 m!371993))

(declare-fun m!371995 () Bool)

(assert (=> b!246619 m!371995))

(check-sat (not b!246625) (not b!246619) (not b!246616) (not start!53122) (not b!246621) (not b!246620) (not b!246624) (not b!246614) (not b!246610) (not b!246611) (not b!246623) (not b!246617) (not b!246618) (not b!246615) (not b!246613))
