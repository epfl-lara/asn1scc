; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54630 () Bool)

(assert start!54630)

(declare-fun b!255472 () Bool)

(declare-fun res!214141 () Bool)

(declare-fun e!176979 () Bool)

(assert (=> b!255472 (=> (not res!214141) (not e!176979))))

(declare-datatypes ((array!13777 0))(
  ( (array!13778 (arr!7030 (Array (_ BitVec 32) (_ BitVec 8))) (size!6043 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11008 0))(
  ( (BitStream!11009 (buf!6560 array!13777) (currentByte!12039 (_ BitVec 32)) (currentBit!12034 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!11008)

(declare-datatypes ((Unit!18294 0))(
  ( (Unit!18295) )
))
(declare-datatypes ((tuple2!21846 0))(
  ( (tuple2!21847 (_1!11857 Unit!18294) (_2!11857 BitStream!11008)) )
))
(declare-fun lt!396799 () tuple2!21846)

(declare-fun isPrefixOf!0 (BitStream!11008 BitStream!11008) Bool)

(assert (=> b!255472 (= res!214141 (isPrefixOf!0 thiss!1005 (_2!11857 lt!396799)))))

(declare-fun b!255473 () Bool)

(declare-fun e!176981 () Bool)

(declare-datatypes ((tuple2!21848 0))(
  ( (tuple2!21849 (_1!11858 BitStream!11008) (_2!11858 Bool)) )
))
(declare-fun lt!396793 () tuple2!21848)

(declare-fun lt!396789 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!255473 (= e!176981 (= (bitIndex!0 (size!6043 (buf!6560 (_1!11858 lt!396793))) (currentByte!12039 (_1!11858 lt!396793)) (currentBit!12034 (_1!11858 lt!396793))) lt!396789))))

(declare-fun b!255474 () Bool)

(declare-fun e!176984 () Bool)

(declare-fun lt!396800 () tuple2!21848)

(declare-fun lt!396792 () tuple2!21848)

(assert (=> b!255474 (= e!176984 (= (_2!11858 lt!396800) (_2!11858 lt!396792)))))

(declare-fun b!255475 () Bool)

(declare-fun e!176980 () Bool)

(declare-fun lt!396784 () tuple2!21846)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!255475 (= e!176980 (invariant!0 (currentBit!12034 thiss!1005) (currentByte!12039 thiss!1005) (size!6043 (buf!6560 (_2!11857 lt!396784)))))))

(declare-fun b!255476 () Bool)

(declare-fun e!176983 () Bool)

(assert (=> b!255476 (= e!176983 e!176979)))

(declare-fun res!214130 () Bool)

(assert (=> b!255476 (=> (not res!214130) (not e!176979))))

(declare-fun lt!396795 () (_ BitVec 64))

(assert (=> b!255476 (= res!214130 (= lt!396789 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!396795)))))

(assert (=> b!255476 (= lt!396789 (bitIndex!0 (size!6043 (buf!6560 (_2!11857 lt!396799))) (currentByte!12039 (_2!11857 lt!396799)) (currentBit!12034 (_2!11857 lt!396799))))))

(assert (=> b!255476 (= lt!396795 (bitIndex!0 (size!6043 (buf!6560 thiss!1005)) (currentByte!12039 thiss!1005) (currentBit!12034 thiss!1005)))))

(declare-fun b!255477 () Bool)

(declare-fun res!214136 () Bool)

(assert (=> b!255477 (=> (not res!214136) (not e!176980))))

(assert (=> b!255477 (= res!214136 (invariant!0 (currentBit!12034 thiss!1005) (currentByte!12039 thiss!1005) (size!6043 (buf!6560 (_2!11857 lt!396799)))))))

(declare-fun b!255478 () Bool)

(declare-fun e!176985 () Bool)

(declare-fun e!176982 () Bool)

(assert (=> b!255478 (= e!176985 e!176982)))

(declare-fun res!214142 () Bool)

(assert (=> b!255478 (=> res!214142 e!176982)))

(assert (=> b!255478 (= res!214142 (not (= (size!6043 (buf!6560 thiss!1005)) (size!6043 (buf!6560 (_2!11857 lt!396784))))))))

(declare-fun lt!396782 () tuple2!21848)

(declare-fun lt!396778 () tuple2!21848)

(declare-datatypes ((tuple2!21850 0))(
  ( (tuple2!21851 (_1!11859 BitStream!11008) (_2!11859 BitStream!11008)) )
))
(declare-fun lt!396785 () tuple2!21850)

(assert (=> b!255478 (and (= (_2!11858 lt!396782) (_2!11858 lt!396778)) (= (_1!11858 lt!396782) (_2!11859 lt!396785)))))

(declare-fun b!255479 () Bool)

(declare-fun e!176989 () Bool)

(declare-fun lt!396798 () tuple2!21848)

(declare-fun lt!396783 () tuple2!21850)

(assert (=> b!255479 (= e!176989 (not (or (not (_2!11858 lt!396798)) (not (= (_1!11858 lt!396798) (_2!11859 lt!396783))))))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun bit!26 () Bool)

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun checkBitsLoopPure!0 (BitStream!11008 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21848)

(assert (=> b!255479 (= lt!396798 (checkBitsLoopPure!0 (_1!11859 lt!396783) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!396791 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!255479 (validate_offset_bits!1 ((_ sign_extend 32) (size!6043 (buf!6560 (_2!11857 lt!396784)))) ((_ sign_extend 32) (currentByte!12039 (_2!11857 lt!396799))) ((_ sign_extend 32) (currentBit!12034 (_2!11857 lt!396799))) lt!396791)))

(declare-fun lt!396796 () Unit!18294)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!11008 array!13777 (_ BitVec 64)) Unit!18294)

(assert (=> b!255479 (= lt!396796 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11857 lt!396799) (buf!6560 (_2!11857 lt!396784)) lt!396791))))

(declare-fun reader!0 (BitStream!11008 BitStream!11008) tuple2!21850)

(assert (=> b!255479 (= lt!396783 (reader!0 (_2!11857 lt!396799) (_2!11857 lt!396784)))))

(declare-fun b!255480 () Bool)

(declare-fun res!214132 () Bool)

(declare-fun e!176990 () Bool)

(assert (=> b!255480 (=> (not res!214132) (not e!176990))))

(assert (=> b!255480 (= res!214132 (validate_offset_bits!1 ((_ sign_extend 32) (size!6043 (buf!6560 thiss!1005))) ((_ sign_extend 32) (currentByte!12039 thiss!1005)) ((_ sign_extend 32) (currentBit!12034 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!255481 () Bool)

(declare-fun res!214129 () Bool)

(assert (=> b!255481 (=> (not res!214129) (not e!176989))))

(assert (=> b!255481 (= res!214129 (isPrefixOf!0 (_2!11857 lt!396799) (_2!11857 lt!396784)))))

(declare-fun res!214128 () Bool)

(assert (=> start!54630 (=> (not res!214128) (not e!176990))))

(assert (=> start!54630 (= res!214128 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!54630 e!176990))

(assert (=> start!54630 true))

(declare-fun e!176987 () Bool)

(declare-fun inv!12 (BitStream!11008) Bool)

(assert (=> start!54630 (and (inv!12 thiss!1005) e!176987)))

(declare-fun b!255482 () Bool)

(declare-fun array_inv!5784 (array!13777) Bool)

(assert (=> b!255482 (= e!176987 (array_inv!5784 (buf!6560 thiss!1005)))))

(declare-fun b!255483 () Bool)

(assert (=> b!255483 (= e!176979 e!176981)))

(declare-fun res!214140 () Bool)

(assert (=> b!255483 (=> (not res!214140) (not e!176981))))

(assert (=> b!255483 (= res!214140 (and (= (_2!11858 lt!396793) bit!26) (= (_1!11858 lt!396793) (_2!11857 lt!396799))))))

(declare-fun readBitPure!0 (BitStream!11008) tuple2!21848)

(declare-fun readerFrom!0 (BitStream!11008 (_ BitVec 32) (_ BitVec 32)) BitStream!11008)

(assert (=> b!255483 (= lt!396793 (readBitPure!0 (readerFrom!0 (_2!11857 lt!396799) (currentBit!12034 thiss!1005) (currentByte!12039 thiss!1005))))))

(declare-fun b!255484 () Bool)

(declare-fun res!214138 () Bool)

(assert (=> b!255484 (=> (not res!214138) (not e!176990))))

(assert (=> b!255484 (= res!214138 (bvslt from!289 nBits!297))))

(declare-fun b!255485 () Bool)

(assert (=> b!255485 (= e!176990 (not e!176985))))

(declare-fun res!214137 () Bool)

(assert (=> b!255485 (=> res!214137 e!176985)))

(declare-fun lt!396794 () tuple2!21850)

(assert (=> b!255485 (= res!214137 (not (= (_1!11858 lt!396778) (_2!11859 lt!396794))))))

(assert (=> b!255485 (= lt!396778 (checkBitsLoopPure!0 (_1!11859 lt!396794) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!396781 () (_ BitVec 64))

(assert (=> b!255485 (validate_offset_bits!1 ((_ sign_extend 32) (size!6043 (buf!6560 (_2!11857 lt!396784)))) ((_ sign_extend 32) (currentByte!12039 (_2!11857 lt!396799))) ((_ sign_extend 32) (currentBit!12034 (_2!11857 lt!396799))) lt!396781)))

(declare-fun lt!396801 () Unit!18294)

(assert (=> b!255485 (= lt!396801 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11857 lt!396799) (buf!6560 (_2!11857 lt!396784)) lt!396781))))

(assert (=> b!255485 (= lt!396782 (checkBitsLoopPure!0 (_1!11859 lt!396785) nBits!297 bit!26 from!289))))

(assert (=> b!255485 (validate_offset_bits!1 ((_ sign_extend 32) (size!6043 (buf!6560 (_2!11857 lt!396784)))) ((_ sign_extend 32) (currentByte!12039 thiss!1005)) ((_ sign_extend 32) (currentBit!12034 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!396790 () Unit!18294)

(assert (=> b!255485 (= lt!396790 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6560 (_2!11857 lt!396784)) (bvsub nBits!297 from!289)))))

(assert (=> b!255485 (= (_2!11858 (readBitPure!0 (_1!11859 lt!396785))) bit!26)))

(assert (=> b!255485 (= lt!396794 (reader!0 (_2!11857 lt!396799) (_2!11857 lt!396784)))))

(assert (=> b!255485 (= lt!396785 (reader!0 thiss!1005 (_2!11857 lt!396784)))))

(assert (=> b!255485 e!176984))

(declare-fun res!214131 () Bool)

(assert (=> b!255485 (=> (not res!214131) (not e!176984))))

(assert (=> b!255485 (= res!214131 (= (bitIndex!0 (size!6043 (buf!6560 (_1!11858 lt!396800))) (currentByte!12039 (_1!11858 lt!396800)) (currentBit!12034 (_1!11858 lt!396800))) (bitIndex!0 (size!6043 (buf!6560 (_1!11858 lt!396792))) (currentByte!12039 (_1!11858 lt!396792)) (currentBit!12034 (_1!11858 lt!396792)))))))

(declare-fun lt!396788 () Unit!18294)

(declare-fun lt!396779 () BitStream!11008)

(declare-fun readBitPrefixLemma!0 (BitStream!11008 BitStream!11008) Unit!18294)

(assert (=> b!255485 (= lt!396788 (readBitPrefixLemma!0 lt!396779 (_2!11857 lt!396784)))))

(assert (=> b!255485 (= lt!396792 (readBitPure!0 (BitStream!11009 (buf!6560 (_2!11857 lt!396784)) (currentByte!12039 thiss!1005) (currentBit!12034 thiss!1005))))))

(assert (=> b!255485 (= lt!396800 (readBitPure!0 lt!396779))))

(assert (=> b!255485 (= lt!396779 (BitStream!11009 (buf!6560 (_2!11857 lt!396799)) (currentByte!12039 thiss!1005) (currentBit!12034 thiss!1005)))))

(assert (=> b!255485 e!176980))

(declare-fun res!214134 () Bool)

(assert (=> b!255485 (=> (not res!214134) (not e!176980))))

(assert (=> b!255485 (= res!214134 (isPrefixOf!0 thiss!1005 (_2!11857 lt!396784)))))

(declare-fun lt!396780 () Unit!18294)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!11008 BitStream!11008 BitStream!11008) Unit!18294)

(assert (=> b!255485 (= lt!396780 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11857 lt!396799) (_2!11857 lt!396784)))))

(declare-fun e!176986 () Bool)

(assert (=> b!255485 e!176986))

(declare-fun res!214133 () Bool)

(assert (=> b!255485 (=> (not res!214133) (not e!176986))))

(assert (=> b!255485 (= res!214133 (= (size!6043 (buf!6560 (_2!11857 lt!396799))) (size!6043 (buf!6560 (_2!11857 lt!396784)))))))

(declare-fun appendNBitsLoop!0 (BitStream!11008 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21846)

(assert (=> b!255485 (= lt!396784 (appendNBitsLoop!0 (_2!11857 lt!396799) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!255485 (validate_offset_bits!1 ((_ sign_extend 32) (size!6043 (buf!6560 (_2!11857 lt!396799)))) ((_ sign_extend 32) (currentByte!12039 (_2!11857 lt!396799))) ((_ sign_extend 32) (currentBit!12034 (_2!11857 lt!396799))) lt!396781)))

(assert (=> b!255485 (= lt!396781 (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!396786 () Unit!18294)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!11008 BitStream!11008 (_ BitVec 64) (_ BitVec 64)) Unit!18294)

(assert (=> b!255485 (= lt!396786 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11857 lt!396799) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!255485 e!176983))

(declare-fun res!214143 () Bool)

(assert (=> b!255485 (=> (not res!214143) (not e!176983))))

(assert (=> b!255485 (= res!214143 (= (size!6043 (buf!6560 thiss!1005)) (size!6043 (buf!6560 (_2!11857 lt!396799)))))))

(declare-fun appendBit!0 (BitStream!11008 Bool) tuple2!21846)

(assert (=> b!255485 (= lt!396799 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!255486 () Bool)

(assert (=> b!255486 (= e!176982 true)))

(declare-fun lt!396797 () (_ BitVec 64))

(assert (=> b!255486 (= lt!396797 (bitIndex!0 (size!6043 (buf!6560 (_2!11857 lt!396784))) (currentByte!12039 (_2!11857 lt!396784)) (currentBit!12034 (_2!11857 lt!396784))))))

(declare-fun lt!396787 () (_ BitVec 64))

(assert (=> b!255486 (= lt!396787 (bitIndex!0 (size!6043 (buf!6560 thiss!1005)) (currentByte!12039 thiss!1005) (currentBit!12034 thiss!1005)))))

(declare-fun b!255487 () Bool)

(assert (=> b!255487 (= e!176986 e!176989)))

(declare-fun res!214135 () Bool)

(assert (=> b!255487 (=> (not res!214135) (not e!176989))))

(assert (=> b!255487 (= res!214135 (= (bitIndex!0 (size!6043 (buf!6560 (_2!11857 lt!396784))) (currentByte!12039 (_2!11857 lt!396784)) (currentBit!12034 (_2!11857 lt!396784))) (bvadd (bitIndex!0 (size!6043 (buf!6560 (_2!11857 lt!396799))) (currentByte!12039 (_2!11857 lt!396799)) (currentBit!12034 (_2!11857 lt!396799))) lt!396791)))))

(assert (=> b!255487 (= lt!396791 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!255488 () Bool)

(declare-fun res!214139 () Bool)

(assert (=> b!255488 (=> res!214139 e!176985)))

(declare-fun withMovedBitIndex!0 (BitStream!11008 (_ BitVec 64)) BitStream!11008)

(assert (=> b!255488 (= res!214139 (not (= (_1!11859 lt!396794) (withMovedBitIndex!0 (_1!11859 lt!396785) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and start!54630 res!214128) b!255480))

(assert (= (and b!255480 res!214132) b!255484))

(assert (= (and b!255484 res!214138) b!255485))

(assert (= (and b!255485 res!214143) b!255476))

(assert (= (and b!255476 res!214130) b!255472))

(assert (= (and b!255472 res!214141) b!255483))

(assert (= (and b!255483 res!214140) b!255473))

(assert (= (and b!255485 res!214133) b!255487))

(assert (= (and b!255487 res!214135) b!255481))

(assert (= (and b!255481 res!214129) b!255479))

(assert (= (and b!255485 res!214134) b!255477))

(assert (= (and b!255477 res!214136) b!255475))

(assert (= (and b!255485 res!214131) b!255474))

(assert (= (and b!255485 (not res!214137)) b!255488))

(assert (= (and b!255488 (not res!214139)) b!255478))

(assert (= (and b!255478 (not res!214142)) b!255486))

(assert (= start!54630 b!255482))

(declare-fun m!384837 () Bool)

(assert (=> b!255487 m!384837))

(declare-fun m!384839 () Bool)

(assert (=> b!255487 m!384839))

(declare-fun m!384841 () Bool)

(assert (=> b!255472 m!384841))

(declare-fun m!384843 () Bool)

(assert (=> b!255488 m!384843))

(declare-fun m!384845 () Bool)

(assert (=> b!255480 m!384845))

(declare-fun m!384847 () Bool)

(assert (=> b!255475 m!384847))

(assert (=> b!255476 m!384839))

(declare-fun m!384849 () Bool)

(assert (=> b!255476 m!384849))

(declare-fun m!384851 () Bool)

(assert (=> b!255479 m!384851))

(declare-fun m!384853 () Bool)

(assert (=> b!255479 m!384853))

(declare-fun m!384855 () Bool)

(assert (=> b!255479 m!384855))

(declare-fun m!384857 () Bool)

(assert (=> b!255479 m!384857))

(declare-fun m!384859 () Bool)

(assert (=> start!54630 m!384859))

(declare-fun m!384861 () Bool)

(assert (=> b!255473 m!384861))

(declare-fun m!384863 () Bool)

(assert (=> b!255477 m!384863))

(assert (=> b!255486 m!384837))

(assert (=> b!255486 m!384849))

(declare-fun m!384865 () Bool)

(assert (=> b!255481 m!384865))

(declare-fun m!384867 () Bool)

(assert (=> b!255485 m!384867))

(declare-fun m!384869 () Bool)

(assert (=> b!255485 m!384869))

(declare-fun m!384871 () Bool)

(assert (=> b!255485 m!384871))

(declare-fun m!384873 () Bool)

(assert (=> b!255485 m!384873))

(declare-fun m!384875 () Bool)

(assert (=> b!255485 m!384875))

(declare-fun m!384877 () Bool)

(assert (=> b!255485 m!384877))

(declare-fun m!384879 () Bool)

(assert (=> b!255485 m!384879))

(declare-fun m!384881 () Bool)

(assert (=> b!255485 m!384881))

(declare-fun m!384883 () Bool)

(assert (=> b!255485 m!384883))

(assert (=> b!255485 m!384857))

(declare-fun m!384885 () Bool)

(assert (=> b!255485 m!384885))

(declare-fun m!384887 () Bool)

(assert (=> b!255485 m!384887))

(declare-fun m!384889 () Bool)

(assert (=> b!255485 m!384889))

(declare-fun m!384891 () Bool)

(assert (=> b!255485 m!384891))

(declare-fun m!384893 () Bool)

(assert (=> b!255485 m!384893))

(declare-fun m!384895 () Bool)

(assert (=> b!255485 m!384895))

(declare-fun m!384897 () Bool)

(assert (=> b!255485 m!384897))

(declare-fun m!384899 () Bool)

(assert (=> b!255485 m!384899))

(declare-fun m!384901 () Bool)

(assert (=> b!255485 m!384901))

(declare-fun m!384903 () Bool)

(assert (=> b!255485 m!384903))

(declare-fun m!384905 () Bool)

(assert (=> b!255482 m!384905))

(declare-fun m!384907 () Bool)

(assert (=> b!255483 m!384907))

(assert (=> b!255483 m!384907))

(declare-fun m!384909 () Bool)

(assert (=> b!255483 m!384909))

(push 1)

(assert (not b!255487))

(assert (not start!54630))

(assert (not b!255477))

(assert (not b!255479))

(assert (not b!255475))

