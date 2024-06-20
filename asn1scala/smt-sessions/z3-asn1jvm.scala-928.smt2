; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26344 () Bool)

(assert start!26344)

(declare-datatypes ((array!6144 0))(
  ( (array!6145 (arr!3445 (Array (_ BitVec 32) (_ BitVec 8))) (size!2780 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4824 0))(
  ( (BitStream!4825 (buf!3173 array!6144) (currentByte!5970 (_ BitVec 32)) (currentBit!5965 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!11636 0))(
  ( (tuple2!11637 (_1!6134 BitStream!4824) (_2!6134 array!6144)) )
))
(declare-fun lt!208832 () tuple2!11636)

(declare-fun arr!237 () array!6144)

(declare-fun b!134629 () Bool)

(declare-fun to!404 () (_ BitVec 32))

(declare-fun e!89328 () Bool)

(declare-fun arrayRangesEq!183 (array!6144 array!6144 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!134629 (= e!89328 (not (arrayRangesEq!183 arr!237 (_2!6134 lt!208832) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!134630 () Bool)

(declare-fun e!89326 () Bool)

(assert (=> b!134630 (= e!89326 (not e!89328))))

(declare-fun res!111892 () Bool)

(assert (=> b!134630 (=> res!111892 e!89328)))

(declare-datatypes ((tuple2!11638 0))(
  ( (tuple2!11639 (_1!6135 BitStream!4824) (_2!6135 BitStream!4824)) )
))
(declare-fun lt!208834 () tuple2!11638)

(assert (=> b!134630 (= res!111892 (or (not (= (size!2780 (_2!6134 lt!208832)) (size!2780 arr!237))) (not (= (_1!6134 lt!208832) (_2!6135 lt!208834)))))))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun readByteArrayLoopPure!0 (BitStream!4824 array!6144 (_ BitVec 32) (_ BitVec 32)) tuple2!11636)

(assert (=> b!134630 (= lt!208832 (readByteArrayLoopPure!0 (_1!6135 lt!208834) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-datatypes ((Unit!8398 0))(
  ( (Unit!8399) )
))
(declare-datatypes ((tuple2!11640 0))(
  ( (tuple2!11641 (_1!6136 Unit!8398) (_2!6136 BitStream!4824)) )
))
(declare-fun lt!208822 () tuple2!11640)

(declare-fun lt!208816 () tuple2!11640)

(declare-fun lt!208815 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!134630 (validate_offset_bits!1 ((_ sign_extend 32) (size!2780 (buf!3173 (_2!6136 lt!208822)))) ((_ sign_extend 32) (currentByte!5970 (_2!6136 lt!208816))) ((_ sign_extend 32) (currentBit!5965 (_2!6136 lt!208816))) lt!208815)))

(declare-fun lt!208823 () Unit!8398)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4824 array!6144 (_ BitVec 64)) Unit!8398)

(assert (=> b!134630 (= lt!208823 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6136 lt!208816) (buf!3173 (_2!6136 lt!208822)) lt!208815))))

(declare-fun reader!0 (BitStream!4824 BitStream!4824) tuple2!11638)

(assert (=> b!134630 (= lt!208834 (reader!0 (_2!6136 lt!208816) (_2!6136 lt!208822)))))

(declare-fun b!134631 () Bool)

(declare-fun e!89331 () Bool)

(assert (=> b!134631 (= e!89331 (not true))))

(declare-fun lt!208817 () tuple2!11636)

(declare-fun lt!208830 () tuple2!11636)

(assert (=> b!134631 (arrayRangesEq!183 (_2!6134 lt!208817) (_2!6134 lt!208830) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!208828 () Unit!8398)

(declare-fun lt!208820 () tuple2!11638)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!4824 array!6144 (_ BitVec 32) (_ BitVec 32)) Unit!8398)

(assert (=> b!134631 (= lt!208828 (readByteArrayLoopArrayPrefixLemma!0 (_1!6135 lt!208820) arr!237 from!447 to!404))))

(declare-fun lt!208814 () array!6144)

(declare-fun withMovedByteIndex!0 (BitStream!4824 (_ BitVec 32)) BitStream!4824)

(assert (=> b!134631 (= lt!208830 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6135 lt!208820) #b00000000000000000000000000000001) lt!208814 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!208831 () tuple2!11636)

(declare-fun lt!208821 () tuple2!11638)

(assert (=> b!134631 (= lt!208831 (readByteArrayLoopPure!0 (_1!6135 lt!208821) lt!208814 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-datatypes ((tuple2!11642 0))(
  ( (tuple2!11643 (_1!6137 BitStream!4824) (_2!6137 (_ BitVec 8))) )
))
(declare-fun lt!208818 () tuple2!11642)

(assert (=> b!134631 (= lt!208814 (array!6145 (store (arr!3445 arr!237) from!447 (_2!6137 lt!208818)) (size!2780 arr!237)))))

(declare-fun lt!208824 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!134631 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2780 (buf!3173 (_2!6136 lt!208822)))) ((_ sign_extend 32) (currentByte!5970 (_2!6136 lt!208816))) ((_ sign_extend 32) (currentBit!5965 (_2!6136 lt!208816))) lt!208824)))

(declare-fun lt!208829 () Unit!8398)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4824 array!6144 (_ BitVec 32)) Unit!8398)

(assert (=> b!134631 (= lt!208829 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6136 lt!208816) (buf!3173 (_2!6136 lt!208822)) lt!208824))))

(assert (=> b!134631 (= (_1!6134 lt!208817) (_2!6135 lt!208820))))

(assert (=> b!134631 (= lt!208817 (readByteArrayLoopPure!0 (_1!6135 lt!208820) arr!237 from!447 to!404))))

(declare-fun thiss!1634 () BitStream!4824)

(assert (=> b!134631 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2780 (buf!3173 (_2!6136 lt!208822)))) ((_ sign_extend 32) (currentByte!5970 thiss!1634)) ((_ sign_extend 32) (currentBit!5965 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!208836 () Unit!8398)

(assert (=> b!134631 (= lt!208836 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3173 (_2!6136 lt!208822)) (bvsub to!404 from!447)))))

(assert (=> b!134631 (= (_2!6137 lt!208818) (select (arr!3445 arr!237) from!447))))

(declare-fun readBytePure!0 (BitStream!4824) tuple2!11642)

(assert (=> b!134631 (= lt!208818 (readBytePure!0 (_1!6135 lt!208820)))))

(assert (=> b!134631 (= lt!208821 (reader!0 (_2!6136 lt!208816) (_2!6136 lt!208822)))))

(assert (=> b!134631 (= lt!208820 (reader!0 thiss!1634 (_2!6136 lt!208822)))))

(declare-fun e!89322 () Bool)

(assert (=> b!134631 e!89322))

(declare-fun res!111890 () Bool)

(assert (=> b!134631 (=> (not res!111890) (not e!89322))))

(declare-fun lt!208819 () tuple2!11642)

(declare-fun lt!208833 () tuple2!11642)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!134631 (= res!111890 (= (bitIndex!0 (size!2780 (buf!3173 (_1!6137 lt!208819))) (currentByte!5970 (_1!6137 lt!208819)) (currentBit!5965 (_1!6137 lt!208819))) (bitIndex!0 (size!2780 (buf!3173 (_1!6137 lt!208833))) (currentByte!5970 (_1!6137 lt!208833)) (currentBit!5965 (_1!6137 lt!208833)))))))

(declare-fun lt!208825 () Unit!8398)

(declare-fun lt!208827 () BitStream!4824)

(declare-fun readBytePrefixLemma!0 (BitStream!4824 BitStream!4824) Unit!8398)

(assert (=> b!134631 (= lt!208825 (readBytePrefixLemma!0 lt!208827 (_2!6136 lt!208822)))))

(assert (=> b!134631 (= lt!208833 (readBytePure!0 (BitStream!4825 (buf!3173 (_2!6136 lt!208822)) (currentByte!5970 thiss!1634) (currentBit!5965 thiss!1634))))))

(assert (=> b!134631 (= lt!208819 (readBytePure!0 lt!208827))))

(assert (=> b!134631 (= lt!208827 (BitStream!4825 (buf!3173 (_2!6136 lt!208816)) (currentByte!5970 thiss!1634) (currentBit!5965 thiss!1634)))))

(declare-fun e!89330 () Bool)

(assert (=> b!134631 e!89330))

(declare-fun res!111894 () Bool)

(assert (=> b!134631 (=> (not res!111894) (not e!89330))))

(declare-fun isPrefixOf!0 (BitStream!4824 BitStream!4824) Bool)

(assert (=> b!134631 (= res!111894 (isPrefixOf!0 thiss!1634 (_2!6136 lt!208822)))))

(declare-fun lt!208837 () Unit!8398)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4824 BitStream!4824 BitStream!4824) Unit!8398)

(assert (=> b!134631 (= lt!208837 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6136 lt!208816) (_2!6136 lt!208822)))))

(declare-fun e!89329 () Bool)

(assert (=> b!134631 e!89329))

(declare-fun res!111895 () Bool)

(assert (=> b!134631 (=> (not res!111895) (not e!89329))))

(assert (=> b!134631 (= res!111895 (= (size!2780 (buf!3173 (_2!6136 lt!208816))) (size!2780 (buf!3173 (_2!6136 lt!208822)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4824 array!6144 (_ BitVec 32) (_ BitVec 32)) tuple2!11640)

(assert (=> b!134631 (= lt!208822 (appendByteArrayLoop!0 (_2!6136 lt!208816) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!134631 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2780 (buf!3173 (_2!6136 lt!208816)))) ((_ sign_extend 32) (currentByte!5970 (_2!6136 lt!208816))) ((_ sign_extend 32) (currentBit!5965 (_2!6136 lt!208816))) lt!208824)))

(assert (=> b!134631 (= lt!208824 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!208813 () Unit!8398)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4824 BitStream!4824 (_ BitVec 64) (_ BitVec 32)) Unit!8398)

(assert (=> b!134631 (= lt!208813 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6136 lt!208816) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(declare-fun e!89327 () Bool)

(assert (=> b!134631 e!89327))

(declare-fun res!111893 () Bool)

(assert (=> b!134631 (=> (not res!111893) (not e!89327))))

(assert (=> b!134631 (= res!111893 (= (size!2780 (buf!3173 thiss!1634)) (size!2780 (buf!3173 (_2!6136 lt!208816)))))))

(declare-fun appendByte!0 (BitStream!4824 (_ BitVec 8)) tuple2!11640)

(assert (=> b!134631 (= lt!208816 (appendByte!0 thiss!1634 (select (arr!3445 arr!237) from!447)))))

(declare-fun b!134632 () Bool)

(declare-fun res!111891 () Bool)

(assert (=> b!134632 (=> (not res!111891) (not e!89331))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!134632 (= res!111891 (invariant!0 (currentBit!5965 thiss!1634) (currentByte!5970 thiss!1634) (size!2780 (buf!3173 thiss!1634))))))

(declare-fun b!134633 () Bool)

(declare-fun res!111899 () Bool)

(assert (=> b!134633 (=> (not res!111899) (not e!89327))))

(assert (=> b!134633 (= res!111899 (isPrefixOf!0 thiss!1634 (_2!6136 lt!208816)))))

(declare-fun b!134634 () Bool)

(declare-fun e!89325 () Bool)

(declare-fun array_inv!2569 (array!6144) Bool)

(assert (=> b!134634 (= e!89325 (array_inv!2569 (buf!3173 thiss!1634)))))

(declare-fun res!111898 () Bool)

(assert (=> start!26344 (=> (not res!111898) (not e!89331))))

(assert (=> start!26344 (= res!111898 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2780 arr!237))))))

(assert (=> start!26344 e!89331))

(assert (=> start!26344 true))

(assert (=> start!26344 (array_inv!2569 arr!237)))

(declare-fun inv!12 (BitStream!4824) Bool)

(assert (=> start!26344 (and (inv!12 thiss!1634) e!89325)))

(declare-fun lt!208835 () tuple2!11642)

(declare-fun lt!208826 () tuple2!11638)

(declare-fun b!134635 () Bool)

(assert (=> b!134635 (= e!89327 (and (= (_2!6137 lt!208835) (select (arr!3445 arr!237) from!447)) (= (_1!6137 lt!208835) (_2!6135 lt!208826))))))

(assert (=> b!134635 (= lt!208835 (readBytePure!0 (_1!6135 lt!208826)))))

(assert (=> b!134635 (= lt!208826 (reader!0 thiss!1634 (_2!6136 lt!208816)))))

(declare-fun b!134636 () Bool)

(declare-fun res!111900 () Bool)

(assert (=> b!134636 (=> (not res!111900) (not e!89331))))

(assert (=> b!134636 (= res!111900 (bvslt from!447 to!404))))

(declare-fun b!134637 () Bool)

(declare-fun res!111896 () Bool)

(assert (=> b!134637 (=> (not res!111896) (not e!89326))))

(assert (=> b!134637 (= res!111896 (isPrefixOf!0 (_2!6136 lt!208816) (_2!6136 lt!208822)))))

(declare-fun b!134638 () Bool)

(declare-fun res!111897 () Bool)

(assert (=> b!134638 (=> (not res!111897) (not e!89327))))

(assert (=> b!134638 (= res!111897 (= (bitIndex!0 (size!2780 (buf!3173 (_2!6136 lt!208816))) (currentByte!5970 (_2!6136 lt!208816)) (currentBit!5965 (_2!6136 lt!208816))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2780 (buf!3173 thiss!1634)) (currentByte!5970 thiss!1634) (currentBit!5965 thiss!1634)))))))

(declare-fun b!134639 () Bool)

(assert (=> b!134639 (= e!89330 (invariant!0 (currentBit!5965 thiss!1634) (currentByte!5970 thiss!1634) (size!2780 (buf!3173 (_2!6136 lt!208816)))))))

(declare-fun b!134640 () Bool)

(assert (=> b!134640 (= e!89322 (= (_2!6137 lt!208819) (_2!6137 lt!208833)))))

(declare-fun b!134641 () Bool)

(declare-fun res!111888 () Bool)

(assert (=> b!134641 (=> (not res!111888) (not e!89331))))

(assert (=> b!134641 (= res!111888 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2780 (buf!3173 thiss!1634))) ((_ sign_extend 32) (currentByte!5970 thiss!1634)) ((_ sign_extend 32) (currentBit!5965 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!134642 () Bool)

(assert (=> b!134642 (= e!89329 e!89326)))

(declare-fun res!111889 () Bool)

(assert (=> b!134642 (=> (not res!111889) (not e!89326))))

(assert (=> b!134642 (= res!111889 (= (bitIndex!0 (size!2780 (buf!3173 (_2!6136 lt!208822))) (currentByte!5970 (_2!6136 lt!208822)) (currentBit!5965 (_2!6136 lt!208822))) (bvadd (bitIndex!0 (size!2780 (buf!3173 (_2!6136 lt!208816))) (currentByte!5970 (_2!6136 lt!208816)) (currentBit!5965 (_2!6136 lt!208816))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!208815))))))

(assert (=> b!134642 (= lt!208815 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (= (and start!26344 res!111898) b!134641))

(assert (= (and b!134641 res!111888) b!134636))

(assert (= (and b!134636 res!111900) b!134632))

(assert (= (and b!134632 res!111891) b!134631))

(assert (= (and b!134631 res!111893) b!134638))

(assert (= (and b!134638 res!111897) b!134633))

(assert (= (and b!134633 res!111899) b!134635))

(assert (= (and b!134631 res!111895) b!134642))

(assert (= (and b!134642 res!111889) b!134637))

(assert (= (and b!134637 res!111896) b!134630))

(assert (= (and b!134630 (not res!111892)) b!134629))

(assert (= (and b!134631 res!111894) b!134639))

(assert (= (and b!134631 res!111890) b!134640))

(assert (= start!26344 b!134634))

(declare-fun m!204969 () Bool)

(assert (=> b!134632 m!204969))

(declare-fun m!204971 () Bool)

(assert (=> b!134638 m!204971))

(declare-fun m!204973 () Bool)

(assert (=> b!134638 m!204973))

(declare-fun m!204975 () Bool)

(assert (=> b!134637 m!204975))

(declare-fun m!204977 () Bool)

(assert (=> start!26344 m!204977))

(declare-fun m!204979 () Bool)

(assert (=> start!26344 m!204979))

(declare-fun m!204981 () Bool)

(assert (=> b!134634 m!204981))

(declare-fun m!204983 () Bool)

(assert (=> b!134630 m!204983))

(declare-fun m!204985 () Bool)

(assert (=> b!134630 m!204985))

(declare-fun m!204987 () Bool)

(assert (=> b!134630 m!204987))

(declare-fun m!204989 () Bool)

(assert (=> b!134630 m!204989))

(declare-fun m!204991 () Bool)

(assert (=> b!134633 m!204991))

(declare-fun m!204993 () Bool)

(assert (=> b!134642 m!204993))

(assert (=> b!134642 m!204971))

(declare-fun m!204995 () Bool)

(assert (=> b!134631 m!204995))

(declare-fun m!204997 () Bool)

(assert (=> b!134631 m!204997))

(declare-fun m!204999 () Bool)

(assert (=> b!134631 m!204999))

(declare-fun m!205001 () Bool)

(assert (=> b!134631 m!205001))

(declare-fun m!205003 () Bool)

(assert (=> b!134631 m!205003))

(declare-fun m!205005 () Bool)

(assert (=> b!134631 m!205005))

(declare-fun m!205007 () Bool)

(assert (=> b!134631 m!205007))

(declare-fun m!205009 () Bool)

(assert (=> b!134631 m!205009))

(declare-fun m!205011 () Bool)

(assert (=> b!134631 m!205011))

(declare-fun m!205013 () Bool)

(assert (=> b!134631 m!205013))

(declare-fun m!205015 () Bool)

(assert (=> b!134631 m!205015))

(assert (=> b!134631 m!204999))

(declare-fun m!205017 () Bool)

(assert (=> b!134631 m!205017))

(declare-fun m!205019 () Bool)

(assert (=> b!134631 m!205019))

(declare-fun m!205021 () Bool)

(assert (=> b!134631 m!205021))

(declare-fun m!205023 () Bool)

(assert (=> b!134631 m!205023))

(declare-fun m!205025 () Bool)

(assert (=> b!134631 m!205025))

(declare-fun m!205027 () Bool)

(assert (=> b!134631 m!205027))

(declare-fun m!205029 () Bool)

(assert (=> b!134631 m!205029))

(declare-fun m!205031 () Bool)

(assert (=> b!134631 m!205031))

(declare-fun m!205033 () Bool)

(assert (=> b!134631 m!205033))

(declare-fun m!205035 () Bool)

(assert (=> b!134631 m!205035))

(assert (=> b!134631 m!204989))

(declare-fun m!205037 () Bool)

(assert (=> b!134631 m!205037))

(declare-fun m!205039 () Bool)

(assert (=> b!134631 m!205039))

(declare-fun m!205041 () Bool)

(assert (=> b!134631 m!205041))

(assert (=> b!134631 m!205023))

(declare-fun m!205043 () Bool)

(assert (=> b!134631 m!205043))

(declare-fun m!205045 () Bool)

(assert (=> b!134629 m!205045))

(assert (=> b!134635 m!205023))

(declare-fun m!205047 () Bool)

(assert (=> b!134635 m!205047))

(declare-fun m!205049 () Bool)

(assert (=> b!134635 m!205049))

(declare-fun m!205051 () Bool)

(assert (=> b!134639 m!205051))

(declare-fun m!205053 () Bool)

(assert (=> b!134641 m!205053))

(check-sat (not b!134638) (not b!134631) (not b!134637) (not start!26344) (not b!134642) (not b!134634) (not b!134633) (not b!134630) (not b!134641) (not b!134629) (not b!134635) (not b!134632) (not b!134639))
