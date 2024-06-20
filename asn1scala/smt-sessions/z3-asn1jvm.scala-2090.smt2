; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53098 () Bool)

(assert start!53098)

(declare-fun b!245998 () Bool)

(declare-fun res!205742 () Bool)

(declare-fun e!170427 () Bool)

(assert (=> b!245998 (=> (not res!205742) (not e!170427))))

(declare-datatypes ((array!13426 0))(
  ( (array!13427 (arr!6872 (Array (_ BitVec 32) (_ BitVec 8))) (size!5885 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10692 0))(
  ( (BitStream!10693 (buf!6366 array!13426) (currentByte!11762 (_ BitVec 32)) (currentBit!11757 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10692)

(declare-datatypes ((Unit!17882 0))(
  ( (Unit!17883) )
))
(declare-datatypes ((tuple2!21090 0))(
  ( (tuple2!21091 (_1!11467 Unit!17882) (_2!11467 BitStream!10692)) )
))
(declare-fun lt!383823 () tuple2!21090)

(declare-fun isPrefixOf!0 (BitStream!10692 BitStream!10692) Bool)

(assert (=> b!245998 (= res!205742 (isPrefixOf!0 thiss!1005 (_2!11467 lt!383823)))))

(declare-fun b!245999 () Bool)

(declare-fun res!205743 () Bool)

(declare-fun e!170421 () Bool)

(assert (=> b!245999 (=> (not res!205743) (not e!170421))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!245999 (= res!205743 (validate_offset_bits!1 ((_ sign_extend 32) (size!5885 (buf!6366 thiss!1005))) ((_ sign_extend 32) (currentByte!11762 thiss!1005)) ((_ sign_extend 32) (currentBit!11757 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!246000 () Bool)

(declare-fun e!170423 () Bool)

(declare-fun array_inv!5626 (array!13426) Bool)

(assert (=> b!246000 (= e!170423 (array_inv!5626 (buf!6366 thiss!1005)))))

(declare-fun b!246001 () Bool)

(declare-fun res!205745 () Bool)

(assert (=> b!246001 (=> (not res!205745) (not e!170421))))

(assert (=> b!246001 (= res!205745 (bvslt from!289 nBits!297))))

(declare-fun b!246002 () Bool)

(declare-fun e!170426 () Bool)

(assert (=> b!246002 (= e!170421 (not e!170426))))

(declare-fun res!205749 () Bool)

(assert (=> b!246002 (=> res!205749 e!170426)))

(declare-datatypes ((tuple2!21092 0))(
  ( (tuple2!21093 (_1!11468 BitStream!10692) (_2!11468 Bool)) )
))
(declare-fun lt!383835 () tuple2!21092)

(declare-datatypes ((tuple2!21094 0))(
  ( (tuple2!21095 (_1!11469 BitStream!10692) (_2!11469 BitStream!10692)) )
))
(declare-fun lt!383833 () tuple2!21094)

(assert (=> b!246002 (= res!205749 (not (= (_1!11468 lt!383835) (_2!11469 lt!383833))))))

(declare-fun bit!26 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!10692 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21092)

(assert (=> b!246002 (= lt!383835 (checkBitsLoopPure!0 (_1!11469 lt!383833) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!383834 () tuple2!21090)

(declare-fun lt!383836 () (_ BitVec 64))

(assert (=> b!246002 (validate_offset_bits!1 ((_ sign_extend 32) (size!5885 (buf!6366 (_2!11467 lt!383834)))) ((_ sign_extend 32) (currentByte!11762 (_2!11467 lt!383823))) ((_ sign_extend 32) (currentBit!11757 (_2!11467 lt!383823))) lt!383836)))

(declare-fun lt!383838 () Unit!17882)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10692 array!13426 (_ BitVec 64)) Unit!17882)

(assert (=> b!246002 (= lt!383838 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11467 lt!383823) (buf!6366 (_2!11467 lt!383834)) lt!383836))))

(declare-fun lt!383827 () tuple2!21094)

(declare-fun lt!383821 () tuple2!21092)

(assert (=> b!246002 (= lt!383821 (checkBitsLoopPure!0 (_1!11469 lt!383827) nBits!297 bit!26 from!289))))

(assert (=> b!246002 (validate_offset_bits!1 ((_ sign_extend 32) (size!5885 (buf!6366 (_2!11467 lt!383834)))) ((_ sign_extend 32) (currentByte!11762 thiss!1005)) ((_ sign_extend 32) (currentBit!11757 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!383825 () Unit!17882)

(assert (=> b!246002 (= lt!383825 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6366 (_2!11467 lt!383834)) (bvsub nBits!297 from!289)))))

(declare-fun readBitPure!0 (BitStream!10692) tuple2!21092)

(assert (=> b!246002 (= (_2!11468 (readBitPure!0 (_1!11469 lt!383827))) bit!26)))

(declare-fun reader!0 (BitStream!10692 BitStream!10692) tuple2!21094)

(assert (=> b!246002 (= lt!383833 (reader!0 (_2!11467 lt!383823) (_2!11467 lt!383834)))))

(assert (=> b!246002 (= lt!383827 (reader!0 thiss!1005 (_2!11467 lt!383834)))))

(declare-fun e!170424 () Bool)

(assert (=> b!246002 e!170424))

(declare-fun res!205744 () Bool)

(assert (=> b!246002 (=> (not res!205744) (not e!170424))))

(declare-fun lt!383815 () tuple2!21092)

(declare-fun lt!383819 () tuple2!21092)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!246002 (= res!205744 (= (bitIndex!0 (size!5885 (buf!6366 (_1!11468 lt!383815))) (currentByte!11762 (_1!11468 lt!383815)) (currentBit!11757 (_1!11468 lt!383815))) (bitIndex!0 (size!5885 (buf!6366 (_1!11468 lt!383819))) (currentByte!11762 (_1!11468 lt!383819)) (currentBit!11757 (_1!11468 lt!383819)))))))

(declare-fun lt!383837 () Unit!17882)

(declare-fun lt!383831 () BitStream!10692)

(declare-fun readBitPrefixLemma!0 (BitStream!10692 BitStream!10692) Unit!17882)

(assert (=> b!246002 (= lt!383837 (readBitPrefixLemma!0 lt!383831 (_2!11467 lt!383834)))))

(assert (=> b!246002 (= lt!383819 (readBitPure!0 (BitStream!10693 (buf!6366 (_2!11467 lt!383834)) (currentByte!11762 thiss!1005) (currentBit!11757 thiss!1005))))))

(assert (=> b!246002 (= lt!383815 (readBitPure!0 lt!383831))))

(assert (=> b!246002 (= lt!383831 (BitStream!10693 (buf!6366 (_2!11467 lt!383823)) (currentByte!11762 thiss!1005) (currentBit!11757 thiss!1005)))))

(declare-fun e!170422 () Bool)

(assert (=> b!246002 e!170422))

(declare-fun res!205753 () Bool)

(assert (=> b!246002 (=> (not res!205753) (not e!170422))))

(assert (=> b!246002 (= res!205753 (isPrefixOf!0 thiss!1005 (_2!11467 lt!383834)))))

(declare-fun lt!383818 () Unit!17882)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10692 BitStream!10692 BitStream!10692) Unit!17882)

(assert (=> b!246002 (= lt!383818 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11467 lt!383823) (_2!11467 lt!383834)))))

(declare-fun e!170425 () Bool)

(assert (=> b!246002 e!170425))

(declare-fun res!205752 () Bool)

(assert (=> b!246002 (=> (not res!205752) (not e!170425))))

(assert (=> b!246002 (= res!205752 (= (size!5885 (buf!6366 (_2!11467 lt!383823))) (size!5885 (buf!6366 (_2!11467 lt!383834)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10692 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21090)

(assert (=> b!246002 (= lt!383834 (appendNBitsLoop!0 (_2!11467 lt!383823) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!246002 (validate_offset_bits!1 ((_ sign_extend 32) (size!5885 (buf!6366 (_2!11467 lt!383823)))) ((_ sign_extend 32) (currentByte!11762 (_2!11467 lt!383823))) ((_ sign_extend 32) (currentBit!11757 (_2!11467 lt!383823))) lt!383836)))

(assert (=> b!246002 (= lt!383836 (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!383817 () Unit!17882)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10692 BitStream!10692 (_ BitVec 64) (_ BitVec 64)) Unit!17882)

(assert (=> b!246002 (= lt!383817 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11467 lt!383823) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!170428 () Bool)

(assert (=> b!246002 e!170428))

(declare-fun res!205740 () Bool)

(assert (=> b!246002 (=> (not res!205740) (not e!170428))))

(assert (=> b!246002 (= res!205740 (= (size!5885 (buf!6366 thiss!1005)) (size!5885 (buf!6366 (_2!11467 lt!383823)))))))

(declare-fun appendBit!0 (BitStream!10692 Bool) tuple2!21090)

(assert (=> b!246002 (= lt!383823 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!246003 () Bool)

(declare-fun e!170420 () Bool)

(assert (=> b!246003 (= e!170425 e!170420)))

(declare-fun res!205748 () Bool)

(assert (=> b!246003 (=> (not res!205748) (not e!170420))))

(declare-fun lt!383822 () (_ BitVec 64))

(assert (=> b!246003 (= res!205748 (= (bitIndex!0 (size!5885 (buf!6366 (_2!11467 lt!383834))) (currentByte!11762 (_2!11467 lt!383834)) (currentBit!11757 (_2!11467 lt!383834))) (bvadd (bitIndex!0 (size!5885 (buf!6366 (_2!11467 lt!383823))) (currentByte!11762 (_2!11467 lt!383823)) (currentBit!11757 (_2!11467 lt!383823))) lt!383822)))))

(assert (=> b!246003 (= lt!383822 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!246004 () Bool)

(declare-fun res!205754 () Bool)

(assert (=> b!246004 (=> res!205754 e!170426)))

(declare-fun withMovedBitIndex!0 (BitStream!10692 (_ BitVec 64)) BitStream!10692)

(assert (=> b!246004 (= res!205754 (not (= (_1!11469 lt!383833) (withMovedBitIndex!0 (_1!11469 lt!383827) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!246005 () Bool)

(declare-fun res!205751 () Bool)

(assert (=> b!246005 (=> (not res!205751) (not e!170420))))

(assert (=> b!246005 (= res!205751 (isPrefixOf!0 (_2!11467 lt!383823) (_2!11467 lt!383834)))))

(declare-fun b!246006 () Bool)

(declare-fun lt!383828 () tuple2!21092)

(declare-fun lt!383816 () tuple2!21094)

(assert (=> b!246006 (= e!170420 (not (or (not (_2!11468 lt!383828)) (not (= (_1!11468 lt!383828) (_2!11469 lt!383816))))))))

(assert (=> b!246006 (= lt!383828 (checkBitsLoopPure!0 (_1!11469 lt!383816) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!246006 (validate_offset_bits!1 ((_ sign_extend 32) (size!5885 (buf!6366 (_2!11467 lt!383834)))) ((_ sign_extend 32) (currentByte!11762 (_2!11467 lt!383823))) ((_ sign_extend 32) (currentBit!11757 (_2!11467 lt!383823))) lt!383822)))

(declare-fun lt!383820 () Unit!17882)

(assert (=> b!246006 (= lt!383820 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11467 lt!383823) (buf!6366 (_2!11467 lt!383834)) lt!383822))))

(assert (=> b!246006 (= lt!383816 (reader!0 (_2!11467 lt!383823) (_2!11467 lt!383834)))))

(declare-fun b!246007 () Bool)

(declare-fun e!170418 () Bool)

(assert (=> b!246007 (= e!170427 e!170418)))

(declare-fun res!205750 () Bool)

(assert (=> b!246007 (=> (not res!205750) (not e!170418))))

(declare-fun lt!383830 () tuple2!21092)

(assert (=> b!246007 (= res!205750 (and (= (_2!11468 lt!383830) bit!26) (= (_1!11468 lt!383830) (_2!11467 lt!383823))))))

(declare-fun readerFrom!0 (BitStream!10692 (_ BitVec 32) (_ BitVec 32)) BitStream!10692)

(assert (=> b!246007 (= lt!383830 (readBitPure!0 (readerFrom!0 (_2!11467 lt!383823) (currentBit!11757 thiss!1005) (currentByte!11762 thiss!1005))))))

(declare-fun res!205747 () Bool)

(assert (=> start!53098 (=> (not res!205747) (not e!170421))))

(assert (=> start!53098 (= res!205747 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53098 e!170421))

(assert (=> start!53098 true))

(declare-fun inv!12 (BitStream!10692) Bool)

(assert (=> start!53098 (and (inv!12 thiss!1005) e!170423)))

(declare-fun b!246008 () Bool)

(assert (=> b!246008 (= e!170424 (= (_2!11468 lt!383815) (_2!11468 lt!383819)))))

(declare-fun b!246009 () Bool)

(declare-fun e!170419 () Bool)

(assert (=> b!246009 (= e!170426 e!170419)))

(declare-fun res!205755 () Bool)

(assert (=> b!246009 (=> res!205755 e!170419)))

(assert (=> b!246009 (= res!205755 (not (= (size!5885 (buf!6366 thiss!1005)) (size!5885 (buf!6366 (_2!11467 lt!383834))))))))

(assert (=> b!246009 (and (= (_2!11468 lt!383821) (_2!11468 lt!383835)) (= (_1!11468 lt!383821) (_2!11469 lt!383827)))))

(declare-fun b!246010 () Bool)

(assert (=> b!246010 (= e!170428 e!170427)))

(declare-fun res!205746 () Bool)

(assert (=> b!246010 (=> (not res!205746) (not e!170427))))

(declare-fun lt!383824 () (_ BitVec 64))

(declare-fun lt!383829 () (_ BitVec 64))

(assert (=> b!246010 (= res!205746 (= lt!383824 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!383829)))))

(assert (=> b!246010 (= lt!383824 (bitIndex!0 (size!5885 (buf!6366 (_2!11467 lt!383823))) (currentByte!11762 (_2!11467 lt!383823)) (currentBit!11757 (_2!11467 lt!383823))))))

(assert (=> b!246010 (= lt!383829 (bitIndex!0 (size!5885 (buf!6366 thiss!1005)) (currentByte!11762 thiss!1005) (currentBit!11757 thiss!1005)))))

(declare-fun b!246011 () Bool)

(assert (=> b!246011 (= e!170418 (= (bitIndex!0 (size!5885 (buf!6366 (_1!11468 lt!383830))) (currentByte!11762 (_1!11468 lt!383830)) (currentBit!11757 (_1!11468 lt!383830))) lt!383824))))

(declare-fun b!246012 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!246012 (= e!170422 (invariant!0 (currentBit!11757 thiss!1005) (currentByte!11762 thiss!1005) (size!5885 (buf!6366 (_2!11467 lt!383834)))))))

(declare-fun b!246013 () Bool)

(assert (=> b!246013 (= e!170419 true)))

(declare-fun lt!383826 () (_ BitVec 64))

(assert (=> b!246013 (= lt!383826 (bitIndex!0 (size!5885 (buf!6366 (_2!11467 lt!383834))) (currentByte!11762 (_2!11467 lt!383834)) (currentBit!11757 (_2!11467 lt!383834))))))

(declare-fun lt!383832 () (_ BitVec 64))

(assert (=> b!246013 (= lt!383832 (bitIndex!0 (size!5885 (buf!6366 thiss!1005)) (currentByte!11762 thiss!1005) (currentBit!11757 thiss!1005)))))

(declare-fun b!246014 () Bool)

(declare-fun res!205741 () Bool)

(assert (=> b!246014 (=> (not res!205741) (not e!170422))))

(assert (=> b!246014 (= res!205741 (invariant!0 (currentBit!11757 thiss!1005) (currentByte!11762 thiss!1005) (size!5885 (buf!6366 (_2!11467 lt!383823)))))))

(assert (= (and start!53098 res!205747) b!245999))

(assert (= (and b!245999 res!205743) b!246001))

(assert (= (and b!246001 res!205745) b!246002))

(assert (= (and b!246002 res!205740) b!246010))

(assert (= (and b!246010 res!205746) b!245998))

(assert (= (and b!245998 res!205742) b!246007))

(assert (= (and b!246007 res!205750) b!246011))

(assert (= (and b!246002 res!205752) b!246003))

(assert (= (and b!246003 res!205748) b!246005))

(assert (= (and b!246005 res!205751) b!246006))

(assert (= (and b!246002 res!205753) b!246014))

(assert (= (and b!246014 res!205741) b!246012))

(assert (= (and b!246002 res!205744) b!246008))

(assert (= (and b!246002 (not res!205749)) b!246004))

(assert (= (and b!246004 (not res!205754)) b!246009))

(assert (= (and b!246009 (not res!205755)) b!246013))

(assert (= start!53098 b!246000))

(declare-fun m!371035 () Bool)

(assert (=> b!246010 m!371035))

(declare-fun m!371037 () Bool)

(assert (=> b!246010 m!371037))

(declare-fun m!371039 () Bool)

(assert (=> b!246004 m!371039))

(declare-fun m!371041 () Bool)

(assert (=> start!53098 m!371041))

(declare-fun m!371043 () Bool)

(assert (=> b!246007 m!371043))

(assert (=> b!246007 m!371043))

(declare-fun m!371045 () Bool)

(assert (=> b!246007 m!371045))

(declare-fun m!371047 () Bool)

(assert (=> b!245998 m!371047))

(declare-fun m!371049 () Bool)

(assert (=> b!246002 m!371049))

(declare-fun m!371051 () Bool)

(assert (=> b!246002 m!371051))

(declare-fun m!371053 () Bool)

(assert (=> b!246002 m!371053))

(declare-fun m!371055 () Bool)

(assert (=> b!246002 m!371055))

(declare-fun m!371057 () Bool)

(assert (=> b!246002 m!371057))

(declare-fun m!371059 () Bool)

(assert (=> b!246002 m!371059))

(declare-fun m!371061 () Bool)

(assert (=> b!246002 m!371061))

(declare-fun m!371063 () Bool)

(assert (=> b!246002 m!371063))

(declare-fun m!371065 () Bool)

(assert (=> b!246002 m!371065))

(declare-fun m!371067 () Bool)

(assert (=> b!246002 m!371067))

(declare-fun m!371069 () Bool)

(assert (=> b!246002 m!371069))

(declare-fun m!371071 () Bool)

(assert (=> b!246002 m!371071))

(declare-fun m!371073 () Bool)

(assert (=> b!246002 m!371073))

(declare-fun m!371075 () Bool)

(assert (=> b!246002 m!371075))

(declare-fun m!371077 () Bool)

(assert (=> b!246002 m!371077))

(declare-fun m!371079 () Bool)

(assert (=> b!246002 m!371079))

(declare-fun m!371081 () Bool)

(assert (=> b!246002 m!371081))

(declare-fun m!371083 () Bool)

(assert (=> b!246002 m!371083))

(declare-fun m!371085 () Bool)

(assert (=> b!246002 m!371085))

(declare-fun m!371087 () Bool)

(assert (=> b!246002 m!371087))

(declare-fun m!371089 () Bool)

(assert (=> b!246013 m!371089))

(assert (=> b!246013 m!371037))

(assert (=> b!246003 m!371089))

(assert (=> b!246003 m!371035))

(declare-fun m!371091 () Bool)

(assert (=> b!246014 m!371091))

(declare-fun m!371093 () Bool)

(assert (=> b!246011 m!371093))

(declare-fun m!371095 () Bool)

(assert (=> b!246012 m!371095))

(declare-fun m!371097 () Bool)

(assert (=> b!245999 m!371097))

(declare-fun m!371099 () Bool)

(assert (=> b!246000 m!371099))

(declare-fun m!371101 () Bool)

(assert (=> b!246006 m!371101))

(declare-fun m!371103 () Bool)

(assert (=> b!246006 m!371103))

(declare-fun m!371105 () Bool)

(assert (=> b!246006 m!371105))

(assert (=> b!246006 m!371065))

(declare-fun m!371107 () Bool)

(assert (=> b!246005 m!371107))

(check-sat (not b!246005) (not b!246010) (not b!246013) (not b!246000) (not b!246007) (not b!246004) (not b!246006) (not b!246003) (not b!246011) (not start!53098) (not b!246014) (not b!245999) (not b!246012) (not b!245998) (not b!246002))
