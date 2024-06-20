; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26342 () Bool)

(assert start!26342)

(declare-fun b!134588 () Bool)

(declare-fun e!89294 () Bool)

(declare-fun e!89292 () Bool)

(assert (=> b!134588 (= e!89294 e!89292)))

(declare-fun res!111854 () Bool)

(assert (=> b!134588 (=> (not res!111854) (not e!89292))))

(declare-datatypes ((array!6142 0))(
  ( (array!6143 (arr!3444 (Array (_ BitVec 32) (_ BitVec 8))) (size!2779 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4822 0))(
  ( (BitStream!4823 (buf!3172 array!6142) (currentByte!5969 (_ BitVec 32)) (currentBit!5964 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!8396 0))(
  ( (Unit!8397) )
))
(declare-datatypes ((tuple2!11628 0))(
  ( (tuple2!11629 (_1!6130 Unit!8396) (_2!6130 BitStream!4822)) )
))
(declare-fun lt!208743 () tuple2!11628)

(declare-fun lt!208747 () (_ BitVec 64))

(declare-fun lt!208753 () tuple2!11628)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!134588 (= res!111854 (= (bitIndex!0 (size!2779 (buf!3172 (_2!6130 lt!208743))) (currentByte!5969 (_2!6130 lt!208743)) (currentBit!5964 (_2!6130 lt!208743))) (bvadd (bitIndex!0 (size!2779 (buf!3172 (_2!6130 lt!208753))) (currentByte!5969 (_2!6130 lt!208753)) (currentBit!5964 (_2!6130 lt!208753))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!208747))))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun from!447 () (_ BitVec 32))

(assert (=> b!134588 (= lt!208747 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!134589 () Bool)

(declare-fun res!111851 () Bool)

(declare-fun e!89295 () Bool)

(assert (=> b!134589 (=> (not res!111851) (not e!89295))))

(assert (=> b!134589 (= res!111851 (bvslt from!447 to!404))))

(declare-fun b!134590 () Bool)

(declare-fun res!111859 () Bool)

(declare-fun e!89298 () Bool)

(assert (=> b!134590 (=> (not res!111859) (not e!89298))))

(declare-fun thiss!1634 () BitStream!4822)

(assert (=> b!134590 (= res!111859 (= (bitIndex!0 (size!2779 (buf!3172 (_2!6130 lt!208753))) (currentByte!5969 (_2!6130 lt!208753)) (currentBit!5964 (_2!6130 lt!208753))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2779 (buf!3172 thiss!1634)) (currentByte!5969 thiss!1634) (currentBit!5964 thiss!1634)))))))

(declare-fun b!134591 () Bool)

(declare-fun res!111852 () Bool)

(assert (=> b!134591 (=> (not res!111852) (not e!89292))))

(declare-fun isPrefixOf!0 (BitStream!4822 BitStream!4822) Bool)

(assert (=> b!134591 (= res!111852 (isPrefixOf!0 (_2!6130 lt!208753) (_2!6130 lt!208743)))))

(declare-fun b!134592 () Bool)

(declare-fun res!111855 () Bool)

(assert (=> b!134592 (=> (not res!111855) (not e!89298))))

(assert (=> b!134592 (= res!111855 (isPrefixOf!0 thiss!1634 (_2!6130 lt!208753)))))

(declare-fun b!134593 () Bool)

(assert (=> b!134593 (= e!89295 (not true))))

(declare-datatypes ((tuple2!11630 0))(
  ( (tuple2!11631 (_1!6131 BitStream!4822) (_2!6131 array!6142)) )
))
(declare-fun lt!208749 () tuple2!11630)

(declare-fun lt!208760 () tuple2!11630)

(declare-fun arrayRangesEq!182 (array!6142 array!6142 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!134593 (arrayRangesEq!182 (_2!6131 lt!208749) (_2!6131 lt!208760) #b00000000000000000000000000000000 to!404)))

(declare-datatypes ((tuple2!11632 0))(
  ( (tuple2!11633 (_1!6132 BitStream!4822) (_2!6132 BitStream!4822)) )
))
(declare-fun lt!208761 () tuple2!11632)

(declare-fun arr!237 () array!6142)

(declare-fun lt!208754 () Unit!8396)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!4822 array!6142 (_ BitVec 32) (_ BitVec 32)) Unit!8396)

(assert (=> b!134593 (= lt!208754 (readByteArrayLoopArrayPrefixLemma!0 (_1!6132 lt!208761) arr!237 from!447 to!404))))

(declare-fun lt!208758 () array!6142)

(declare-fun readByteArrayLoopPure!0 (BitStream!4822 array!6142 (_ BitVec 32) (_ BitVec 32)) tuple2!11630)

(declare-fun withMovedByteIndex!0 (BitStream!4822 (_ BitVec 32)) BitStream!4822)

(assert (=> b!134593 (= lt!208760 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6132 lt!208761) #b00000000000000000000000000000001) lt!208758 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!208755 () tuple2!11632)

(declare-fun lt!208739 () tuple2!11630)

(assert (=> b!134593 (= lt!208739 (readByteArrayLoopPure!0 (_1!6132 lt!208755) lt!208758 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-datatypes ((tuple2!11634 0))(
  ( (tuple2!11635 (_1!6133 BitStream!4822) (_2!6133 (_ BitVec 8))) )
))
(declare-fun lt!208741 () tuple2!11634)

(assert (=> b!134593 (= lt!208758 (array!6143 (store (arr!3444 arr!237) from!447 (_2!6133 lt!208741)) (size!2779 arr!237)))))

(declare-fun lt!208762 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!134593 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2779 (buf!3172 (_2!6130 lt!208743)))) ((_ sign_extend 32) (currentByte!5969 (_2!6130 lt!208753))) ((_ sign_extend 32) (currentBit!5964 (_2!6130 lt!208753))) lt!208762)))

(declare-fun lt!208756 () Unit!8396)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4822 array!6142 (_ BitVec 32)) Unit!8396)

(assert (=> b!134593 (= lt!208756 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6130 lt!208753) (buf!3172 (_2!6130 lt!208743)) lt!208762))))

(assert (=> b!134593 (= (_1!6131 lt!208749) (_2!6132 lt!208761))))

(assert (=> b!134593 (= lt!208749 (readByteArrayLoopPure!0 (_1!6132 lt!208761) arr!237 from!447 to!404))))

(assert (=> b!134593 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2779 (buf!3172 (_2!6130 lt!208743)))) ((_ sign_extend 32) (currentByte!5969 thiss!1634)) ((_ sign_extend 32) (currentBit!5964 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!208748 () Unit!8396)

(assert (=> b!134593 (= lt!208748 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3172 (_2!6130 lt!208743)) (bvsub to!404 from!447)))))

(assert (=> b!134593 (= (_2!6133 lt!208741) (select (arr!3444 arr!237) from!447))))

(declare-fun readBytePure!0 (BitStream!4822) tuple2!11634)

(assert (=> b!134593 (= lt!208741 (readBytePure!0 (_1!6132 lt!208761)))))

(declare-fun reader!0 (BitStream!4822 BitStream!4822) tuple2!11632)

(assert (=> b!134593 (= lt!208755 (reader!0 (_2!6130 lt!208753) (_2!6130 lt!208743)))))

(assert (=> b!134593 (= lt!208761 (reader!0 thiss!1634 (_2!6130 lt!208743)))))

(declare-fun e!89293 () Bool)

(assert (=> b!134593 e!89293))

(declare-fun res!111850 () Bool)

(assert (=> b!134593 (=> (not res!111850) (not e!89293))))

(declare-fun lt!208744 () tuple2!11634)

(declare-fun lt!208746 () tuple2!11634)

(assert (=> b!134593 (= res!111850 (= (bitIndex!0 (size!2779 (buf!3172 (_1!6133 lt!208744))) (currentByte!5969 (_1!6133 lt!208744)) (currentBit!5964 (_1!6133 lt!208744))) (bitIndex!0 (size!2779 (buf!3172 (_1!6133 lt!208746))) (currentByte!5969 (_1!6133 lt!208746)) (currentBit!5964 (_1!6133 lt!208746)))))))

(declare-fun lt!208752 () Unit!8396)

(declare-fun lt!208757 () BitStream!4822)

(declare-fun readBytePrefixLemma!0 (BitStream!4822 BitStream!4822) Unit!8396)

(assert (=> b!134593 (= lt!208752 (readBytePrefixLemma!0 lt!208757 (_2!6130 lt!208743)))))

(assert (=> b!134593 (= lt!208746 (readBytePure!0 (BitStream!4823 (buf!3172 (_2!6130 lt!208743)) (currentByte!5969 thiss!1634) (currentBit!5964 thiss!1634))))))

(assert (=> b!134593 (= lt!208744 (readBytePure!0 lt!208757))))

(assert (=> b!134593 (= lt!208757 (BitStream!4823 (buf!3172 (_2!6130 lt!208753)) (currentByte!5969 thiss!1634) (currentBit!5964 thiss!1634)))))

(declare-fun e!89297 () Bool)

(assert (=> b!134593 e!89297))

(declare-fun res!111858 () Bool)

(assert (=> b!134593 (=> (not res!111858) (not e!89297))))

(assert (=> b!134593 (= res!111858 (isPrefixOf!0 thiss!1634 (_2!6130 lt!208743)))))

(declare-fun lt!208742 () Unit!8396)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4822 BitStream!4822 BitStream!4822) Unit!8396)

(assert (=> b!134593 (= lt!208742 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6130 lt!208753) (_2!6130 lt!208743)))))

(assert (=> b!134593 e!89294))

(declare-fun res!111861 () Bool)

(assert (=> b!134593 (=> (not res!111861) (not e!89294))))

(assert (=> b!134593 (= res!111861 (= (size!2779 (buf!3172 (_2!6130 lt!208753))) (size!2779 (buf!3172 (_2!6130 lt!208743)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4822 array!6142 (_ BitVec 32) (_ BitVec 32)) tuple2!11628)

(assert (=> b!134593 (= lt!208743 (appendByteArrayLoop!0 (_2!6130 lt!208753) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!134593 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2779 (buf!3172 (_2!6130 lt!208753)))) ((_ sign_extend 32) (currentByte!5969 (_2!6130 lt!208753))) ((_ sign_extend 32) (currentBit!5964 (_2!6130 lt!208753))) lt!208762)))

(assert (=> b!134593 (= lt!208762 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!208745 () Unit!8396)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4822 BitStream!4822 (_ BitVec 64) (_ BitVec 32)) Unit!8396)

(assert (=> b!134593 (= lt!208745 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6130 lt!208753) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!134593 e!89298))

(declare-fun res!111857 () Bool)

(assert (=> b!134593 (=> (not res!111857) (not e!89298))))

(assert (=> b!134593 (= res!111857 (= (size!2779 (buf!3172 thiss!1634)) (size!2779 (buf!3172 (_2!6130 lt!208753)))))))

(declare-fun appendByte!0 (BitStream!4822 (_ BitVec 8)) tuple2!11628)

(assert (=> b!134593 (= lt!208753 (appendByte!0 thiss!1634 (select (arr!3444 arr!237) from!447)))))

(declare-fun b!134594 () Bool)

(declare-fun lt!208740 () tuple2!11630)

(declare-fun e!89296 () Bool)

(assert (=> b!134594 (= e!89296 (not (arrayRangesEq!182 arr!237 (_2!6131 lt!208740) #b00000000000000000000000000000000 to!404)))))

(declare-fun res!111853 () Bool)

(assert (=> start!26342 (=> (not res!111853) (not e!89295))))

(assert (=> start!26342 (= res!111853 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2779 arr!237))))))

(assert (=> start!26342 e!89295))

(assert (=> start!26342 true))

(declare-fun array_inv!2568 (array!6142) Bool)

(assert (=> start!26342 (array_inv!2568 arr!237)))

(declare-fun e!89301 () Bool)

(declare-fun inv!12 (BitStream!4822) Bool)

(assert (=> start!26342 (and (inv!12 thiss!1634) e!89301)))

(declare-fun b!134587 () Bool)

(declare-fun res!111860 () Bool)

(assert (=> b!134587 (=> (not res!111860) (not e!89295))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!134587 (= res!111860 (invariant!0 (currentBit!5964 thiss!1634) (currentByte!5969 thiss!1634) (size!2779 (buf!3172 thiss!1634))))))

(declare-fun b!134595 () Bool)

(assert (=> b!134595 (= e!89297 (invariant!0 (currentBit!5964 thiss!1634) (currentByte!5969 thiss!1634) (size!2779 (buf!3172 (_2!6130 lt!208753)))))))

(declare-fun b!134596 () Bool)

(assert (=> b!134596 (= e!89292 (not e!89296))))

(declare-fun res!111849 () Bool)

(assert (=> b!134596 (=> res!111849 e!89296)))

(declare-fun lt!208750 () tuple2!11632)

(assert (=> b!134596 (= res!111849 (or (not (= (size!2779 (_2!6131 lt!208740)) (size!2779 arr!237))) (not (= (_1!6131 lt!208740) (_2!6132 lt!208750)))))))

(assert (=> b!134596 (= lt!208740 (readByteArrayLoopPure!0 (_1!6132 lt!208750) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!134596 (validate_offset_bits!1 ((_ sign_extend 32) (size!2779 (buf!3172 (_2!6130 lt!208743)))) ((_ sign_extend 32) (currentByte!5969 (_2!6130 lt!208753))) ((_ sign_extend 32) (currentBit!5964 (_2!6130 lt!208753))) lt!208747)))

(declare-fun lt!208738 () Unit!8396)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4822 array!6142 (_ BitVec 64)) Unit!8396)

(assert (=> b!134596 (= lt!208738 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6130 lt!208753) (buf!3172 (_2!6130 lt!208743)) lt!208747))))

(assert (=> b!134596 (= lt!208750 (reader!0 (_2!6130 lt!208753) (_2!6130 lt!208743)))))

(declare-fun b!134597 () Bool)

(declare-fun lt!208751 () tuple2!11634)

(declare-fun lt!208759 () tuple2!11632)

(assert (=> b!134597 (= e!89298 (and (= (_2!6133 lt!208751) (select (arr!3444 arr!237) from!447)) (= (_1!6133 lt!208751) (_2!6132 lt!208759))))))

(assert (=> b!134597 (= lt!208751 (readBytePure!0 (_1!6132 lt!208759)))))

(assert (=> b!134597 (= lt!208759 (reader!0 thiss!1634 (_2!6130 lt!208753)))))

(declare-fun b!134598 () Bool)

(declare-fun res!111856 () Bool)

(assert (=> b!134598 (=> (not res!111856) (not e!89295))))

(assert (=> b!134598 (= res!111856 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2779 (buf!3172 thiss!1634))) ((_ sign_extend 32) (currentByte!5969 thiss!1634)) ((_ sign_extend 32) (currentBit!5964 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!134599 () Bool)

(assert (=> b!134599 (= e!89293 (= (_2!6133 lt!208744) (_2!6133 lt!208746)))))

(declare-fun b!134600 () Bool)

(assert (=> b!134600 (= e!89301 (array_inv!2568 (buf!3172 thiss!1634)))))

(assert (= (and start!26342 res!111853) b!134598))

(assert (= (and b!134598 res!111856) b!134589))

(assert (= (and b!134589 res!111851) b!134587))

(assert (= (and b!134587 res!111860) b!134593))

(assert (= (and b!134593 res!111857) b!134590))

(assert (= (and b!134590 res!111859) b!134592))

(assert (= (and b!134592 res!111855) b!134597))

(assert (= (and b!134593 res!111861) b!134588))

(assert (= (and b!134588 res!111854) b!134591))

(assert (= (and b!134591 res!111852) b!134596))

(assert (= (and b!134596 (not res!111849)) b!134594))

(assert (= (and b!134593 res!111858) b!134595))

(assert (= (and b!134593 res!111850) b!134599))

(assert (= start!26342 b!134600))

(declare-fun m!204883 () Bool)

(assert (=> b!134588 m!204883))

(declare-fun m!204885 () Bool)

(assert (=> b!134588 m!204885))

(declare-fun m!204887 () Bool)

(assert (=> b!134591 m!204887))

(assert (=> b!134590 m!204885))

(declare-fun m!204889 () Bool)

(assert (=> b!134590 m!204889))

(declare-fun m!204891 () Bool)

(assert (=> b!134595 m!204891))

(declare-fun m!204893 () Bool)

(assert (=> b!134594 m!204893))

(declare-fun m!204895 () Bool)

(assert (=> b!134600 m!204895))

(declare-fun m!204897 () Bool)

(assert (=> b!134598 m!204897))

(declare-fun m!204899 () Bool)

(assert (=> b!134596 m!204899))

(declare-fun m!204901 () Bool)

(assert (=> b!134596 m!204901))

(declare-fun m!204903 () Bool)

(assert (=> b!134596 m!204903))

(declare-fun m!204905 () Bool)

(assert (=> b!134596 m!204905))

(declare-fun m!204907 () Bool)

(assert (=> b!134592 m!204907))

(declare-fun m!204909 () Bool)

(assert (=> b!134587 m!204909))

(declare-fun m!204911 () Bool)

(assert (=> b!134597 m!204911))

(declare-fun m!204913 () Bool)

(assert (=> b!134597 m!204913))

(declare-fun m!204915 () Bool)

(assert (=> b!134597 m!204915))

(declare-fun m!204917 () Bool)

(assert (=> b!134593 m!204917))

(declare-fun m!204919 () Bool)

(assert (=> b!134593 m!204919))

(declare-fun m!204921 () Bool)

(assert (=> b!134593 m!204921))

(declare-fun m!204923 () Bool)

(assert (=> b!134593 m!204923))

(declare-fun m!204925 () Bool)

(assert (=> b!134593 m!204925))

(assert (=> b!134593 m!204905))

(declare-fun m!204927 () Bool)

(assert (=> b!134593 m!204927))

(declare-fun m!204929 () Bool)

(assert (=> b!134593 m!204929))

(declare-fun m!204931 () Bool)

(assert (=> b!134593 m!204931))

(declare-fun m!204933 () Bool)

(assert (=> b!134593 m!204933))

(declare-fun m!204935 () Bool)

(assert (=> b!134593 m!204935))

(declare-fun m!204937 () Bool)

(assert (=> b!134593 m!204937))

(assert (=> b!134593 m!204911))

(declare-fun m!204939 () Bool)

(assert (=> b!134593 m!204939))

(declare-fun m!204941 () Bool)

(assert (=> b!134593 m!204941))

(declare-fun m!204943 () Bool)

(assert (=> b!134593 m!204943))

(declare-fun m!204945 () Bool)

(assert (=> b!134593 m!204945))

(assert (=> b!134593 m!204939))

(declare-fun m!204947 () Bool)

(assert (=> b!134593 m!204947))

(declare-fun m!204949 () Bool)

(assert (=> b!134593 m!204949))

(declare-fun m!204951 () Bool)

(assert (=> b!134593 m!204951))

(declare-fun m!204953 () Bool)

(assert (=> b!134593 m!204953))

(declare-fun m!204955 () Bool)

(assert (=> b!134593 m!204955))

(declare-fun m!204957 () Bool)

(assert (=> b!134593 m!204957))

(declare-fun m!204959 () Bool)

(assert (=> b!134593 m!204959))

(declare-fun m!204961 () Bool)

(assert (=> b!134593 m!204961))

(assert (=> b!134593 m!204911))

(declare-fun m!204963 () Bool)

(assert (=> b!134593 m!204963))

(declare-fun m!204965 () Bool)

(assert (=> start!26342 m!204965))

(declare-fun m!204967 () Bool)

(assert (=> start!26342 m!204967))

(push 1)

(assert (not b!134597))

(assert (not b!134600))

(assert (not b!134595))

(assert (not start!26342))

(assert (not b!134598))

(assert (not b!134590))

(assert (not b!134591))

(assert (not b!134592))

(assert (not b!134588))

(assert (not b!134596))

(assert (not b!134587))

(assert (not b!134594))

(assert (not b!134593))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

