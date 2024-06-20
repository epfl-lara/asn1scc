; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53100 () Bool)

(assert start!53100)

(declare-fun b!246049 () Bool)

(declare-fun e!170464 () Bool)

(declare-fun e!170465 () Bool)

(assert (=> b!246049 (= e!170464 e!170465)))

(declare-fun res!205801 () Bool)

(assert (=> b!246049 (=> (not res!205801) (not e!170465))))

(declare-datatypes ((array!13428 0))(
  ( (array!13429 (arr!6873 (Array (_ BitVec 32) (_ BitVec 8))) (size!5886 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10694 0))(
  ( (BitStream!10695 (buf!6367 array!13428) (currentByte!11763 (_ BitVec 32)) (currentBit!11758 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!21096 0))(
  ( (tuple2!21097 (_1!11470 BitStream!10694) (_2!11470 Bool)) )
))
(declare-fun lt!383906 () tuple2!21096)

(declare-datatypes ((Unit!17884 0))(
  ( (Unit!17885) )
))
(declare-datatypes ((tuple2!21098 0))(
  ( (tuple2!21099 (_1!11471 Unit!17884) (_2!11471 BitStream!10694)) )
))
(declare-fun lt!383887 () tuple2!21098)

(declare-fun bit!26 () Bool)

(assert (=> b!246049 (= res!205801 (and (= (_2!11470 lt!383906) bit!26) (= (_1!11470 lt!383906) (_2!11471 lt!383887))))))

(declare-fun thiss!1005 () BitStream!10694)

(declare-fun readBitPure!0 (BitStream!10694) tuple2!21096)

(declare-fun readerFrom!0 (BitStream!10694 (_ BitVec 32) (_ BitVec 32)) BitStream!10694)

(assert (=> b!246049 (= lt!383906 (readBitPure!0 (readerFrom!0 (_2!11471 lt!383887) (currentBit!11758 thiss!1005) (currentByte!11763 thiss!1005))))))

(declare-fun res!205792 () Bool)

(declare-fun e!170459 () Bool)

(assert (=> start!53100 (=> (not res!205792) (not e!170459))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> start!53100 (= res!205792 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53100 e!170459))

(assert (=> start!53100 true))

(declare-fun e!170463 () Bool)

(declare-fun inv!12 (BitStream!10694) Bool)

(assert (=> start!53100 (and (inv!12 thiss!1005) e!170463)))

(declare-fun b!246050 () Bool)

(declare-fun e!170462 () Bool)

(declare-fun lt!383900 () tuple2!21096)

(declare-datatypes ((tuple2!21100 0))(
  ( (tuple2!21101 (_1!11472 BitStream!10694) (_2!11472 BitStream!10694)) )
))
(declare-fun lt!383895 () tuple2!21100)

(assert (=> b!246050 (= e!170462 (not (or (not (_2!11470 lt!383900)) (not (= (_1!11470 lt!383900) (_2!11472 lt!383895))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10694 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21096)

(assert (=> b!246050 (= lt!383900 (checkBitsLoopPure!0 (_1!11472 lt!383895) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!383898 () tuple2!21098)

(declare-fun lt!383890 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!246050 (validate_offset_bits!1 ((_ sign_extend 32) (size!5886 (buf!6367 (_2!11471 lt!383898)))) ((_ sign_extend 32) (currentByte!11763 (_2!11471 lt!383887))) ((_ sign_extend 32) (currentBit!11758 (_2!11471 lt!383887))) lt!383890)))

(declare-fun lt!383905 () Unit!17884)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10694 array!13428 (_ BitVec 64)) Unit!17884)

(assert (=> b!246050 (= lt!383905 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11471 lt!383887) (buf!6367 (_2!11471 lt!383898)) lt!383890))))

(declare-fun reader!0 (BitStream!10694 BitStream!10694) tuple2!21100)

(assert (=> b!246050 (= lt!383895 (reader!0 (_2!11471 lt!383887) (_2!11471 lt!383898)))))

(declare-fun b!246051 () Bool)

(declare-fun res!205798 () Bool)

(assert (=> b!246051 (=> (not res!205798) (not e!170464))))

(declare-fun isPrefixOf!0 (BitStream!10694 BitStream!10694) Bool)

(assert (=> b!246051 (= res!205798 (isPrefixOf!0 thiss!1005 (_2!11471 lt!383887)))))

(declare-fun b!246052 () Bool)

(declare-fun res!205788 () Bool)

(assert (=> b!246052 (=> (not res!205788) (not e!170459))))

(assert (=> b!246052 (= res!205788 (validate_offset_bits!1 ((_ sign_extend 32) (size!5886 (buf!6367 thiss!1005))) ((_ sign_extend 32) (currentByte!11763 thiss!1005)) ((_ sign_extend 32) (currentBit!11758 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!246053 () Bool)

(declare-fun res!205800 () Bool)

(declare-fun e!170460 () Bool)

(assert (=> b!246053 (=> res!205800 e!170460)))

(declare-fun lt!383897 () tuple2!21100)

(declare-fun lt!383910 () tuple2!21100)

(declare-fun withMovedBitIndex!0 (BitStream!10694 (_ BitVec 64)) BitStream!10694)

(assert (=> b!246053 (= res!205800 (not (= (_1!11472 lt!383897) (withMovedBitIndex!0 (_1!11472 lt!383910) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!246054 () Bool)

(declare-fun array_inv!5627 (array!13428) Bool)

(assert (=> b!246054 (= e!170463 (array_inv!5627 (buf!6367 thiss!1005)))))

(declare-fun b!246055 () Bool)

(declare-fun res!205799 () Bool)

(assert (=> b!246055 (=> (not res!205799) (not e!170459))))

(assert (=> b!246055 (= res!205799 (bvslt from!289 nBits!297))))

(declare-fun b!246056 () Bool)

(declare-fun e!170457 () Bool)

(assert (=> b!246056 (= e!170460 e!170457)))

(declare-fun res!205790 () Bool)

(assert (=> b!246056 (=> res!205790 e!170457)))

(assert (=> b!246056 (= res!205790 (not (= (size!5886 (buf!6367 thiss!1005)) (size!5886 (buf!6367 (_2!11471 lt!383898))))))))

(declare-fun lt!383907 () tuple2!21096)

(declare-fun lt!383896 () tuple2!21096)

(assert (=> b!246056 (and (= (_2!11470 lt!383907) (_2!11470 lt!383896)) (= (_1!11470 lt!383907) (_2!11472 lt!383910)))))

(declare-fun b!246057 () Bool)

(declare-fun e!170461 () Bool)

(assert (=> b!246057 (= e!170461 e!170462)))

(declare-fun res!205794 () Bool)

(assert (=> b!246057 (=> (not res!205794) (not e!170462))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!246057 (= res!205794 (= (bitIndex!0 (size!5886 (buf!6367 (_2!11471 lt!383898))) (currentByte!11763 (_2!11471 lt!383898)) (currentBit!11758 (_2!11471 lt!383898))) (bvadd (bitIndex!0 (size!5886 (buf!6367 (_2!11471 lt!383887))) (currentByte!11763 (_2!11471 lt!383887)) (currentBit!11758 (_2!11471 lt!383887))) lt!383890)))))

(assert (=> b!246057 (= lt!383890 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!246058 () Bool)

(assert (=> b!246058 (= e!170457 true)))

(declare-fun lt!383899 () (_ BitVec 64))

(assert (=> b!246058 (= lt!383899 (bitIndex!0 (size!5886 (buf!6367 (_2!11471 lt!383898))) (currentByte!11763 (_2!11471 lt!383898)) (currentBit!11758 (_2!11471 lt!383898))))))

(declare-fun lt!383902 () (_ BitVec 64))

(assert (=> b!246058 (= lt!383902 (bitIndex!0 (size!5886 (buf!6367 thiss!1005)) (currentByte!11763 thiss!1005) (currentBit!11758 thiss!1005)))))

(declare-fun b!246059 () Bool)

(assert (=> b!246059 (= e!170459 (not e!170460))))

(declare-fun res!205793 () Bool)

(assert (=> b!246059 (=> res!205793 e!170460)))

(assert (=> b!246059 (= res!205793 (not (= (_1!11470 lt!383896) (_2!11472 lt!383897))))))

(assert (=> b!246059 (= lt!383896 (checkBitsLoopPure!0 (_1!11472 lt!383897) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!383889 () (_ BitVec 64))

(assert (=> b!246059 (validate_offset_bits!1 ((_ sign_extend 32) (size!5886 (buf!6367 (_2!11471 lt!383898)))) ((_ sign_extend 32) (currentByte!11763 (_2!11471 lt!383887))) ((_ sign_extend 32) (currentBit!11758 (_2!11471 lt!383887))) lt!383889)))

(declare-fun lt!383892 () Unit!17884)

(assert (=> b!246059 (= lt!383892 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11471 lt!383887) (buf!6367 (_2!11471 lt!383898)) lt!383889))))

(assert (=> b!246059 (= lt!383907 (checkBitsLoopPure!0 (_1!11472 lt!383910) nBits!297 bit!26 from!289))))

(assert (=> b!246059 (validate_offset_bits!1 ((_ sign_extend 32) (size!5886 (buf!6367 (_2!11471 lt!383898)))) ((_ sign_extend 32) (currentByte!11763 thiss!1005)) ((_ sign_extend 32) (currentBit!11758 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!383909 () Unit!17884)

(assert (=> b!246059 (= lt!383909 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6367 (_2!11471 lt!383898)) (bvsub nBits!297 from!289)))))

(assert (=> b!246059 (= (_2!11470 (readBitPure!0 (_1!11472 lt!383910))) bit!26)))

(assert (=> b!246059 (= lt!383897 (reader!0 (_2!11471 lt!383887) (_2!11471 lt!383898)))))

(assert (=> b!246059 (= lt!383910 (reader!0 thiss!1005 (_2!11471 lt!383898)))))

(declare-fun e!170455 () Bool)

(assert (=> b!246059 e!170455))

(declare-fun res!205791 () Bool)

(assert (=> b!246059 (=> (not res!205791) (not e!170455))))

(declare-fun lt!383894 () tuple2!21096)

(declare-fun lt!383901 () tuple2!21096)

(assert (=> b!246059 (= res!205791 (= (bitIndex!0 (size!5886 (buf!6367 (_1!11470 lt!383894))) (currentByte!11763 (_1!11470 lt!383894)) (currentBit!11758 (_1!11470 lt!383894))) (bitIndex!0 (size!5886 (buf!6367 (_1!11470 lt!383901))) (currentByte!11763 (_1!11470 lt!383901)) (currentBit!11758 (_1!11470 lt!383901)))))))

(declare-fun lt!383904 () Unit!17884)

(declare-fun lt!383888 () BitStream!10694)

(declare-fun readBitPrefixLemma!0 (BitStream!10694 BitStream!10694) Unit!17884)

(assert (=> b!246059 (= lt!383904 (readBitPrefixLemma!0 lt!383888 (_2!11471 lt!383898)))))

(assert (=> b!246059 (= lt!383901 (readBitPure!0 (BitStream!10695 (buf!6367 (_2!11471 lt!383898)) (currentByte!11763 thiss!1005) (currentBit!11758 thiss!1005))))))

(assert (=> b!246059 (= lt!383894 (readBitPure!0 lt!383888))))

(assert (=> b!246059 (= lt!383888 (BitStream!10695 (buf!6367 (_2!11471 lt!383887)) (currentByte!11763 thiss!1005) (currentBit!11758 thiss!1005)))))

(declare-fun e!170456 () Bool)

(assert (=> b!246059 e!170456))

(declare-fun res!205797 () Bool)

(assert (=> b!246059 (=> (not res!205797) (not e!170456))))

(assert (=> b!246059 (= res!205797 (isPrefixOf!0 thiss!1005 (_2!11471 lt!383898)))))

(declare-fun lt!383893 () Unit!17884)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10694 BitStream!10694 BitStream!10694) Unit!17884)

(assert (=> b!246059 (= lt!383893 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11471 lt!383887) (_2!11471 lt!383898)))))

(assert (=> b!246059 e!170461))

(declare-fun res!205789 () Bool)

(assert (=> b!246059 (=> (not res!205789) (not e!170461))))

(assert (=> b!246059 (= res!205789 (= (size!5886 (buf!6367 (_2!11471 lt!383887))) (size!5886 (buf!6367 (_2!11471 lt!383898)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10694 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21098)

(assert (=> b!246059 (= lt!383898 (appendNBitsLoop!0 (_2!11471 lt!383887) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!246059 (validate_offset_bits!1 ((_ sign_extend 32) (size!5886 (buf!6367 (_2!11471 lt!383887)))) ((_ sign_extend 32) (currentByte!11763 (_2!11471 lt!383887))) ((_ sign_extend 32) (currentBit!11758 (_2!11471 lt!383887))) lt!383889)))

(assert (=> b!246059 (= lt!383889 (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!383908 () Unit!17884)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10694 BitStream!10694 (_ BitVec 64) (_ BitVec 64)) Unit!17884)

(assert (=> b!246059 (= lt!383908 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11471 lt!383887) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!170458 () Bool)

(assert (=> b!246059 e!170458))

(declare-fun res!205796 () Bool)

(assert (=> b!246059 (=> (not res!205796) (not e!170458))))

(assert (=> b!246059 (= res!205796 (= (size!5886 (buf!6367 thiss!1005)) (size!5886 (buf!6367 (_2!11471 lt!383887)))))))

(declare-fun appendBit!0 (BitStream!10694 Bool) tuple2!21098)

(assert (=> b!246059 (= lt!383887 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!246060 () Bool)

(declare-fun res!205802 () Bool)

(assert (=> b!246060 (=> (not res!205802) (not e!170456))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!246060 (= res!205802 (invariant!0 (currentBit!11758 thiss!1005) (currentByte!11763 thiss!1005) (size!5886 (buf!6367 (_2!11471 lt!383887)))))))

(declare-fun b!246061 () Bool)

(assert (=> b!246061 (= e!170458 e!170464)))

(declare-fun res!205795 () Bool)

(assert (=> b!246061 (=> (not res!205795) (not e!170464))))

(declare-fun lt!383903 () (_ BitVec 64))

(declare-fun lt!383891 () (_ BitVec 64))

(assert (=> b!246061 (= res!205795 (= lt!383903 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!383891)))))

(assert (=> b!246061 (= lt!383903 (bitIndex!0 (size!5886 (buf!6367 (_2!11471 lt!383887))) (currentByte!11763 (_2!11471 lt!383887)) (currentBit!11758 (_2!11471 lt!383887))))))

(assert (=> b!246061 (= lt!383891 (bitIndex!0 (size!5886 (buf!6367 thiss!1005)) (currentByte!11763 thiss!1005) (currentBit!11758 thiss!1005)))))

(declare-fun b!246062 () Bool)

(declare-fun res!205803 () Bool)

(assert (=> b!246062 (=> (not res!205803) (not e!170462))))

(assert (=> b!246062 (= res!205803 (isPrefixOf!0 (_2!11471 lt!383887) (_2!11471 lt!383898)))))

(declare-fun b!246063 () Bool)

(assert (=> b!246063 (= e!170456 (invariant!0 (currentBit!11758 thiss!1005) (currentByte!11763 thiss!1005) (size!5886 (buf!6367 (_2!11471 lt!383898)))))))

(declare-fun b!246064 () Bool)

(assert (=> b!246064 (= e!170465 (= (bitIndex!0 (size!5886 (buf!6367 (_1!11470 lt!383906))) (currentByte!11763 (_1!11470 lt!383906)) (currentBit!11758 (_1!11470 lt!383906))) lt!383903))))

(declare-fun b!246065 () Bool)

(assert (=> b!246065 (= e!170455 (= (_2!11470 lt!383894) (_2!11470 lt!383901)))))

(assert (= (and start!53100 res!205792) b!246052))

(assert (= (and b!246052 res!205788) b!246055))

(assert (= (and b!246055 res!205799) b!246059))

(assert (= (and b!246059 res!205796) b!246061))

(assert (= (and b!246061 res!205795) b!246051))

(assert (= (and b!246051 res!205798) b!246049))

(assert (= (and b!246049 res!205801) b!246064))

(assert (= (and b!246059 res!205789) b!246057))

(assert (= (and b!246057 res!205794) b!246062))

(assert (= (and b!246062 res!205803) b!246050))

(assert (= (and b!246059 res!205797) b!246060))

(assert (= (and b!246060 res!205802) b!246063))

(assert (= (and b!246059 res!205791) b!246065))

(assert (= (and b!246059 (not res!205793)) b!246053))

(assert (= (and b!246053 (not res!205800)) b!246056))

(assert (= (and b!246056 (not res!205790)) b!246058))

(assert (= start!53100 b!246054))

(declare-fun m!371109 () Bool)

(assert (=> b!246054 m!371109))

(declare-fun m!371111 () Bool)

(assert (=> start!53100 m!371111))

(declare-fun m!371113 () Bool)

(assert (=> b!246062 m!371113))

(declare-fun m!371115 () Bool)

(assert (=> b!246049 m!371115))

(assert (=> b!246049 m!371115))

(declare-fun m!371117 () Bool)

(assert (=> b!246049 m!371117))

(declare-fun m!371119 () Bool)

(assert (=> b!246051 m!371119))

(declare-fun m!371121 () Bool)

(assert (=> b!246057 m!371121))

(declare-fun m!371123 () Bool)

(assert (=> b!246057 m!371123))

(declare-fun m!371125 () Bool)

(assert (=> b!246052 m!371125))

(declare-fun m!371127 () Bool)

(assert (=> b!246059 m!371127))

(declare-fun m!371129 () Bool)

(assert (=> b!246059 m!371129))

(declare-fun m!371131 () Bool)

(assert (=> b!246059 m!371131))

(declare-fun m!371133 () Bool)

(assert (=> b!246059 m!371133))

(declare-fun m!371135 () Bool)

(assert (=> b!246059 m!371135))

(declare-fun m!371137 () Bool)

(assert (=> b!246059 m!371137))

(declare-fun m!371139 () Bool)

(assert (=> b!246059 m!371139))

(declare-fun m!371141 () Bool)

(assert (=> b!246059 m!371141))

(declare-fun m!371143 () Bool)

(assert (=> b!246059 m!371143))

(declare-fun m!371145 () Bool)

(assert (=> b!246059 m!371145))

(declare-fun m!371147 () Bool)

(assert (=> b!246059 m!371147))

(declare-fun m!371149 () Bool)

(assert (=> b!246059 m!371149))

(declare-fun m!371151 () Bool)

(assert (=> b!246059 m!371151))

(declare-fun m!371153 () Bool)

(assert (=> b!246059 m!371153))

(declare-fun m!371155 () Bool)

(assert (=> b!246059 m!371155))

(declare-fun m!371157 () Bool)

(assert (=> b!246059 m!371157))

(declare-fun m!371159 () Bool)

(assert (=> b!246059 m!371159))

(declare-fun m!371161 () Bool)

(assert (=> b!246059 m!371161))

(declare-fun m!371163 () Bool)

(assert (=> b!246059 m!371163))

(declare-fun m!371165 () Bool)

(assert (=> b!246059 m!371165))

(assert (=> b!246061 m!371123))

(declare-fun m!371167 () Bool)

(assert (=> b!246061 m!371167))

(declare-fun m!371169 () Bool)

(assert (=> b!246063 m!371169))

(declare-fun m!371171 () Bool)

(assert (=> b!246064 m!371171))

(declare-fun m!371173 () Bool)

(assert (=> b!246060 m!371173))

(declare-fun m!371175 () Bool)

(assert (=> b!246053 m!371175))

(assert (=> b!246058 m!371121))

(assert (=> b!246058 m!371167))

(declare-fun m!371177 () Bool)

(assert (=> b!246050 m!371177))

(declare-fun m!371179 () Bool)

(assert (=> b!246050 m!371179))

(declare-fun m!371181 () Bool)

(assert (=> b!246050 m!371181))

(assert (=> b!246050 m!371163))

(push 1)

(assert (not b!246059))

(assert (not b!246053))

(assert (not b!246064))

(assert (not b!246052))

(assert (not b!246051))

(assert (not b!246054))

(assert (not b!246063))

(assert (not b!246058))

(assert (not b!246060))

(assert (not b!246062))

(assert (not b!246057))

(assert (not b!246061))

(assert (not b!246049))

(assert (not start!53100))

(assert (not b!246050))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

