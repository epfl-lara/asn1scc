; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54098 () Bool)

(assert start!54098)

(declare-fun b!252334 () Bool)

(declare-fun e!174860 () Bool)

(declare-fun e!174853 () Bool)

(assert (=> b!252334 (= e!174860 e!174853)))

(declare-fun res!211399 () Bool)

(assert (=> b!252334 (=> (not res!211399) (not e!174853))))

(declare-datatypes ((array!13722 0))(
  ( (array!13723 (arr!7007 (Array (_ BitVec 32) (_ BitVec 8))) (size!6020 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10962 0))(
  ( (BitStream!10963 (buf!6522 array!13722) (currentByte!11977 (_ BitVec 32)) (currentBit!11972 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!18188 0))(
  ( (Unit!18189) )
))
(declare-datatypes ((tuple2!21690 0))(
  ( (tuple2!21691 (_1!11773 Unit!18188) (_2!11773 BitStream!10962)) )
))
(declare-fun lt!391946 () tuple2!21690)

(declare-fun lt!391938 () (_ BitVec 64))

(declare-fun lt!391951 () tuple2!21690)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!252334 (= res!211399 (= (bitIndex!0 (size!6020 (buf!6522 (_2!11773 lt!391946))) (currentByte!11977 (_2!11773 lt!391946)) (currentBit!11972 (_2!11773 lt!391946))) (bvadd (bitIndex!0 (size!6020 (buf!6522 (_2!11773 lt!391951))) (currentByte!11977 (_2!11773 lt!391951)) (currentBit!11972 (_2!11773 lt!391951))) lt!391938)))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> b!252334 (= lt!391938 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!252335 () Bool)

(declare-fun e!174854 () Bool)

(declare-fun e!174851 () Bool)

(assert (=> b!252335 (= e!174854 e!174851)))

(declare-fun res!211405 () Bool)

(assert (=> b!252335 (=> (not res!211405) (not e!174851))))

(declare-datatypes ((tuple2!21692 0))(
  ( (tuple2!21693 (_1!11774 BitStream!10962) (_2!11774 Bool)) )
))
(declare-fun lt!391937 () tuple2!21692)

(declare-fun bit!26 () Bool)

(assert (=> b!252335 (= res!211405 (and (= (_2!11774 lt!391937) bit!26) (= (_1!11774 lt!391937) (_2!11773 lt!391951))))))

(declare-fun thiss!1005 () BitStream!10962)

(declare-fun readBitPure!0 (BitStream!10962) tuple2!21692)

(declare-fun readerFrom!0 (BitStream!10962 (_ BitVec 32) (_ BitVec 32)) BitStream!10962)

(assert (=> b!252335 (= lt!391937 (readBitPure!0 (readerFrom!0 (_2!11773 lt!391951) (currentBit!11972 thiss!1005) (currentByte!11977 thiss!1005))))))

(declare-fun b!252336 () Bool)

(declare-fun e!174856 () Bool)

(assert (=> b!252336 (= e!174856 e!174854)))

(declare-fun res!211396 () Bool)

(assert (=> b!252336 (=> (not res!211396) (not e!174854))))

(declare-fun lt!391941 () (_ BitVec 64))

(declare-fun lt!391942 () (_ BitVec 64))

(assert (=> b!252336 (= res!211396 (= lt!391941 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!391942)))))

(assert (=> b!252336 (= lt!391941 (bitIndex!0 (size!6020 (buf!6522 (_2!11773 lt!391951))) (currentByte!11977 (_2!11773 lt!391951)) (currentBit!11972 (_2!11773 lt!391951))))))

(assert (=> b!252336 (= lt!391942 (bitIndex!0 (size!6020 (buf!6522 thiss!1005)) (currentByte!11977 thiss!1005) (currentBit!11972 thiss!1005)))))

(declare-fun res!211407 () Bool)

(declare-fun e!174858 () Bool)

(assert (=> start!54098 (=> (not res!211407) (not e!174858))))

(assert (=> start!54098 (= res!211407 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!54098 e!174858))

(assert (=> start!54098 true))

(declare-fun e!174855 () Bool)

(declare-fun inv!12 (BitStream!10962) Bool)

(assert (=> start!54098 (and (inv!12 thiss!1005) e!174855)))

(declare-fun b!252337 () Bool)

(declare-fun res!211402 () Bool)

(assert (=> b!252337 (=> (not res!211402) (not e!174853))))

(declare-fun isPrefixOf!0 (BitStream!10962 BitStream!10962) Bool)

(assert (=> b!252337 (= res!211402 (isPrefixOf!0 (_2!11773 lt!391951) (_2!11773 lt!391946)))))

(declare-fun b!252338 () Bool)

(declare-fun array_inv!5761 (array!13722) Bool)

(assert (=> b!252338 (= e!174855 (array_inv!5761 (buf!6522 thiss!1005)))))

(declare-fun b!252339 () Bool)

(declare-fun lt!391943 () tuple2!21692)

(declare-datatypes ((tuple2!21694 0))(
  ( (tuple2!21695 (_1!11775 BitStream!10962) (_2!11775 BitStream!10962)) )
))
(declare-fun lt!391952 () tuple2!21694)

(assert (=> b!252339 (= e!174853 (not (or (not (_2!11774 lt!391943)) (not (= (_1!11774 lt!391943) (_2!11775 lt!391952))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10962 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21692)

(assert (=> b!252339 (= lt!391943 (checkBitsLoopPure!0 (_1!11775 lt!391952) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!252339 (validate_offset_bits!1 ((_ sign_extend 32) (size!6020 (buf!6522 (_2!11773 lt!391946)))) ((_ sign_extend 32) (currentByte!11977 (_2!11773 lt!391951))) ((_ sign_extend 32) (currentBit!11972 (_2!11773 lt!391951))) lt!391938)))

(declare-fun lt!391939 () Unit!18188)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10962 array!13722 (_ BitVec 64)) Unit!18188)

(assert (=> b!252339 (= lt!391939 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11773 lt!391951) (buf!6522 (_2!11773 lt!391946)) lt!391938))))

(declare-fun reader!0 (BitStream!10962 BitStream!10962) tuple2!21694)

(assert (=> b!252339 (= lt!391952 (reader!0 (_2!11773 lt!391951) (_2!11773 lt!391946)))))

(declare-fun b!252340 () Bool)

(assert (=> b!252340 (= e!174858 (not true))))

(declare-fun lt!391945 () tuple2!21694)

(declare-fun lt!391953 () tuple2!21692)

(assert (=> b!252340 (= lt!391953 (checkBitsLoopPure!0 (_1!11775 lt!391945) nBits!297 bit!26 from!289))))

(assert (=> b!252340 (validate_offset_bits!1 ((_ sign_extend 32) (size!6020 (buf!6522 (_2!11773 lt!391946)))) ((_ sign_extend 32) (currentByte!11977 thiss!1005)) ((_ sign_extend 32) (currentBit!11972 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!391949 () Unit!18188)

(assert (=> b!252340 (= lt!391949 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6522 (_2!11773 lt!391946)) (bvsub nBits!297 from!289)))))

(assert (=> b!252340 (= (_2!11774 (readBitPure!0 (_1!11775 lt!391945))) bit!26)))

(declare-fun lt!391935 () tuple2!21694)

(assert (=> b!252340 (= lt!391935 (reader!0 (_2!11773 lt!391951) (_2!11773 lt!391946)))))

(assert (=> b!252340 (= lt!391945 (reader!0 thiss!1005 (_2!11773 lt!391946)))))

(declare-fun e!174852 () Bool)

(assert (=> b!252340 e!174852))

(declare-fun res!211400 () Bool)

(assert (=> b!252340 (=> (not res!211400) (not e!174852))))

(declare-fun lt!391940 () tuple2!21692)

(declare-fun lt!391950 () tuple2!21692)

(assert (=> b!252340 (= res!211400 (= (bitIndex!0 (size!6020 (buf!6522 (_1!11774 lt!391940))) (currentByte!11977 (_1!11774 lt!391940)) (currentBit!11972 (_1!11774 lt!391940))) (bitIndex!0 (size!6020 (buf!6522 (_1!11774 lt!391950))) (currentByte!11977 (_1!11774 lt!391950)) (currentBit!11972 (_1!11774 lt!391950)))))))

(declare-fun lt!391936 () Unit!18188)

(declare-fun lt!391944 () BitStream!10962)

(declare-fun readBitPrefixLemma!0 (BitStream!10962 BitStream!10962) Unit!18188)

(assert (=> b!252340 (= lt!391936 (readBitPrefixLemma!0 lt!391944 (_2!11773 lt!391946)))))

(assert (=> b!252340 (= lt!391950 (readBitPure!0 (BitStream!10963 (buf!6522 (_2!11773 lt!391946)) (currentByte!11977 thiss!1005) (currentBit!11972 thiss!1005))))))

(assert (=> b!252340 (= lt!391940 (readBitPure!0 lt!391944))))

(assert (=> b!252340 (= lt!391944 (BitStream!10963 (buf!6522 (_2!11773 lt!391951)) (currentByte!11977 thiss!1005) (currentBit!11972 thiss!1005)))))

(declare-fun e!174859 () Bool)

(assert (=> b!252340 e!174859))

(declare-fun res!211404 () Bool)

(assert (=> b!252340 (=> (not res!211404) (not e!174859))))

(assert (=> b!252340 (= res!211404 (isPrefixOf!0 thiss!1005 (_2!11773 lt!391946)))))

(declare-fun lt!391948 () Unit!18188)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10962 BitStream!10962 BitStream!10962) Unit!18188)

(assert (=> b!252340 (= lt!391948 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11773 lt!391951) (_2!11773 lt!391946)))))

(assert (=> b!252340 e!174860))

(declare-fun res!211398 () Bool)

(assert (=> b!252340 (=> (not res!211398) (not e!174860))))

(assert (=> b!252340 (= res!211398 (= (size!6020 (buf!6522 (_2!11773 lt!391951))) (size!6020 (buf!6522 (_2!11773 lt!391946)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10962 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21690)

(assert (=> b!252340 (= lt!391946 (appendNBitsLoop!0 (_2!11773 lt!391951) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!252340 (validate_offset_bits!1 ((_ sign_extend 32) (size!6020 (buf!6522 (_2!11773 lt!391951)))) ((_ sign_extend 32) (currentByte!11977 (_2!11773 lt!391951))) ((_ sign_extend 32) (currentBit!11972 (_2!11773 lt!391951))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!391947 () Unit!18188)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10962 BitStream!10962 (_ BitVec 64) (_ BitVec 64)) Unit!18188)

(assert (=> b!252340 (= lt!391947 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11773 lt!391951) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!252340 e!174856))

(declare-fun res!211397 () Bool)

(assert (=> b!252340 (=> (not res!211397) (not e!174856))))

(assert (=> b!252340 (= res!211397 (= (size!6020 (buf!6522 thiss!1005)) (size!6020 (buf!6522 (_2!11773 lt!391951)))))))

(declare-fun appendBit!0 (BitStream!10962 Bool) tuple2!21690)

(assert (=> b!252340 (= lt!391951 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!252341 () Bool)

(declare-fun res!211403 () Bool)

(assert (=> b!252341 (=> (not res!211403) (not e!174854))))

(assert (=> b!252341 (= res!211403 (isPrefixOf!0 thiss!1005 (_2!11773 lt!391951)))))

(declare-fun b!252342 () Bool)

(declare-fun res!211406 () Bool)

(assert (=> b!252342 (=> (not res!211406) (not e!174858))))

(assert (=> b!252342 (= res!211406 (bvslt from!289 nBits!297))))

(declare-fun b!252343 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!252343 (= e!174859 (invariant!0 (currentBit!11972 thiss!1005) (currentByte!11977 thiss!1005) (size!6020 (buf!6522 (_2!11773 lt!391946)))))))

(declare-fun b!252344 () Bool)

(declare-fun res!211401 () Bool)

(assert (=> b!252344 (=> (not res!211401) (not e!174858))))

(assert (=> b!252344 (= res!211401 (validate_offset_bits!1 ((_ sign_extend 32) (size!6020 (buf!6522 thiss!1005))) ((_ sign_extend 32) (currentByte!11977 thiss!1005)) ((_ sign_extend 32) (currentBit!11972 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!252345 () Bool)

(assert (=> b!252345 (= e!174851 (= (bitIndex!0 (size!6020 (buf!6522 (_1!11774 lt!391937))) (currentByte!11977 (_1!11774 lt!391937)) (currentBit!11972 (_1!11774 lt!391937))) lt!391941))))

(declare-fun b!252346 () Bool)

(assert (=> b!252346 (= e!174852 (= (_2!11774 lt!391940) (_2!11774 lt!391950)))))

(declare-fun b!252347 () Bool)

(declare-fun res!211395 () Bool)

(assert (=> b!252347 (=> (not res!211395) (not e!174859))))

(assert (=> b!252347 (= res!211395 (invariant!0 (currentBit!11972 thiss!1005) (currentByte!11977 thiss!1005) (size!6020 (buf!6522 (_2!11773 lt!391951)))))))

(assert (= (and start!54098 res!211407) b!252344))

(assert (= (and b!252344 res!211401) b!252342))

(assert (= (and b!252342 res!211406) b!252340))

(assert (= (and b!252340 res!211397) b!252336))

(assert (= (and b!252336 res!211396) b!252341))

(assert (= (and b!252341 res!211403) b!252335))

(assert (= (and b!252335 res!211405) b!252345))

(assert (= (and b!252340 res!211398) b!252334))

(assert (= (and b!252334 res!211399) b!252337))

(assert (= (and b!252337 res!211402) b!252339))

(assert (= (and b!252340 res!211404) b!252347))

(assert (= (and b!252347 res!211395) b!252343))

(assert (= (and b!252340 res!211400) b!252346))

(assert (= start!54098 b!252338))

(declare-fun m!379647 () Bool)

(assert (=> b!252334 m!379647))

(declare-fun m!379649 () Bool)

(assert (=> b!252334 m!379649))

(assert (=> b!252336 m!379649))

(declare-fun m!379651 () Bool)

(assert (=> b!252336 m!379651))

(declare-fun m!379653 () Bool)

(assert (=> b!252340 m!379653))

(declare-fun m!379655 () Bool)

(assert (=> b!252340 m!379655))

(declare-fun m!379657 () Bool)

(assert (=> b!252340 m!379657))

(declare-fun m!379659 () Bool)

(assert (=> b!252340 m!379659))

(declare-fun m!379661 () Bool)

(assert (=> b!252340 m!379661))

(declare-fun m!379663 () Bool)

(assert (=> b!252340 m!379663))

(declare-fun m!379665 () Bool)

(assert (=> b!252340 m!379665))

(declare-fun m!379667 () Bool)

(assert (=> b!252340 m!379667))

(declare-fun m!379669 () Bool)

(assert (=> b!252340 m!379669))

(declare-fun m!379671 () Bool)

(assert (=> b!252340 m!379671))

(declare-fun m!379673 () Bool)

(assert (=> b!252340 m!379673))

(declare-fun m!379675 () Bool)

(assert (=> b!252340 m!379675))

(declare-fun m!379677 () Bool)

(assert (=> b!252340 m!379677))

(declare-fun m!379679 () Bool)

(assert (=> b!252340 m!379679))

(declare-fun m!379681 () Bool)

(assert (=> b!252340 m!379681))

(declare-fun m!379683 () Bool)

(assert (=> b!252340 m!379683))

(declare-fun m!379685 () Bool)

(assert (=> b!252340 m!379685))

(declare-fun m!379687 () Bool)

(assert (=> b!252347 m!379687))

(declare-fun m!379689 () Bool)

(assert (=> start!54098 m!379689))

(declare-fun m!379691 () Bool)

(assert (=> b!252339 m!379691))

(declare-fun m!379693 () Bool)

(assert (=> b!252339 m!379693))

(declare-fun m!379695 () Bool)

(assert (=> b!252339 m!379695))

(assert (=> b!252339 m!379669))

(declare-fun m!379697 () Bool)

(assert (=> b!252338 m!379697))

(declare-fun m!379699 () Bool)

(assert (=> b!252341 m!379699))

(declare-fun m!379701 () Bool)

(assert (=> b!252335 m!379701))

(assert (=> b!252335 m!379701))

(declare-fun m!379703 () Bool)

(assert (=> b!252335 m!379703))

(declare-fun m!379705 () Bool)

(assert (=> b!252337 m!379705))

(declare-fun m!379707 () Bool)

(assert (=> b!252345 m!379707))

(declare-fun m!379709 () Bool)

(assert (=> b!252343 m!379709))

(declare-fun m!379711 () Bool)

(assert (=> b!252344 m!379711))

(check-sat (not b!252334) (not b!252337) (not b!252344) (not b!252347) (not b!252340) (not start!54098) (not b!252335) (not b!252338) (not b!252341) (not b!252343) (not b!252336) (not b!252345) (not b!252339))
