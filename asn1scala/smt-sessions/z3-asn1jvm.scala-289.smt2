; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5716 () Bool)

(assert start!5716)

(declare-fun b!24672 () Bool)

(declare-fun res!21312 () Bool)

(declare-fun e!16846 () Bool)

(assert (=> b!24672 (=> res!21312 e!16846)))

(declare-datatypes ((array!1639 0))(
  ( (array!1640 (arr!1161 (Array (_ BitVec 32) (_ BitVec 8))) (size!705 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1242 0))(
  ( (BitStream!1243 (buf!1026 array!1639) (currentByte!2339 (_ BitVec 32)) (currentBit!2334 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!2053 0))(
  ( (Unit!2054) )
))
(declare-datatypes ((tuple2!2802 0))(
  ( (tuple2!2803 (_1!1488 Unit!2053) (_2!1488 BitStream!1242)) )
))
(declare-fun lt!35157 () tuple2!2802)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!24672 (= res!21312 (not (invariant!0 (currentBit!2334 (_2!1488 lt!35157)) (currentByte!2339 (_2!1488 lt!35157)) (size!705 (buf!1026 (_2!1488 lt!35157))))))))

(declare-fun e!16839 () Bool)

(declare-datatypes ((tuple2!2804 0))(
  ( (tuple2!2805 (_1!1489 BitStream!1242) (_2!1489 BitStream!1242)) )
))
(declare-fun lt!35155 () tuple2!2804)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun lt!35148 () tuple2!2802)

(declare-fun srcBuffer!2 () array!1639)

(declare-fun b!24673 () Bool)

(declare-datatypes ((List!322 0))(
  ( (Nil!319) (Cons!318 (h!437 Bool) (t!1072 List!322)) )
))
(declare-fun head!159 (List!322) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1242 array!1639 (_ BitVec 64) (_ BitVec 64)) List!322)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1242 BitStream!1242 (_ BitVec 64)) List!322)

(assert (=> b!24673 (= e!16839 (= (head!159 (byteArrayBitContentToList!0 (_2!1488 lt!35148) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!159 (bitStreamReadBitsIntoList!0 (_2!1488 lt!35148) (_1!1489 lt!35155) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!24674 () Bool)

(declare-fun e!16843 () Bool)

(assert (=> b!24674 (= e!16846 e!16843)))

(declare-fun res!21314 () Bool)

(assert (=> b!24674 (=> res!21314 e!16843)))

(assert (=> b!24674 (= res!21314 (not (= (size!705 (buf!1026 (_2!1488 lt!35148))) (size!705 (buf!1026 (_2!1488 lt!35157))))))))

(declare-fun e!16845 () Bool)

(assert (=> b!24674 e!16845))

(declare-fun res!21311 () Bool)

(assert (=> b!24674 (=> (not res!21311) (not e!16845))))

(declare-fun thiss!1379 () BitStream!1242)

(assert (=> b!24674 (= res!21311 (= (size!705 (buf!1026 (_2!1488 lt!35157))) (size!705 (buf!1026 thiss!1379))))))

(declare-fun b!24675 () Bool)

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!35158 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!24675 (= e!16845 (= lt!35158 (bvsub (bvsub (bvadd (bitIndex!0 (size!705 (buf!1026 (_2!1488 lt!35148))) (currentByte!2339 (_2!1488 lt!35148)) (currentBit!2334 (_2!1488 lt!35148))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!24676 () Bool)

(declare-fun res!21310 () Bool)

(assert (=> b!24676 (=> res!21310 e!16846)))

(assert (=> b!24676 (= res!21310 (not (= (size!705 (buf!1026 thiss!1379)) (size!705 (buf!1026 (_2!1488 lt!35157))))))))

(declare-fun b!24677 () Bool)

(declare-fun e!16842 () Bool)

(declare-fun e!16841 () Bool)

(assert (=> b!24677 (= e!16842 (not e!16841))))

(declare-fun res!21316 () Bool)

(assert (=> b!24677 (=> res!21316 e!16841)))

(assert (=> b!24677 (= res!21316 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1242 BitStream!1242) Bool)

(assert (=> b!24677 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!35161 () Unit!2053)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1242) Unit!2053)

(assert (=> b!24677 (= lt!35161 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!35154 () (_ BitVec 64))

(assert (=> b!24677 (= lt!35154 (bitIndex!0 (size!705 (buf!1026 thiss!1379)) (currentByte!2339 thiss!1379) (currentBit!2334 thiss!1379)))))

(declare-fun b!24678 () Bool)

(declare-fun res!21317 () Bool)

(assert (=> b!24678 (=> res!21317 e!16843)))

(assert (=> b!24678 (= res!21317 (not (invariant!0 (currentBit!2334 (_2!1488 lt!35148)) (currentByte!2339 (_2!1488 lt!35148)) (size!705 (buf!1026 (_2!1488 lt!35157))))))))

(declare-fun res!21306 () Bool)

(assert (=> start!5716 (=> (not res!21306) (not e!16842))))

(assert (=> start!5716 (= res!21306 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!705 srcBuffer!2))))))))

(assert (=> start!5716 e!16842))

(assert (=> start!5716 true))

(declare-fun array_inv!674 (array!1639) Bool)

(assert (=> start!5716 (array_inv!674 srcBuffer!2)))

(declare-fun e!16844 () Bool)

(declare-fun inv!12 (BitStream!1242) Bool)

(assert (=> start!5716 (and (inv!12 thiss!1379) e!16844)))

(declare-fun b!24679 () Bool)

(declare-fun e!16837 () Bool)

(assert (=> b!24679 (= e!16837 e!16846)))

(declare-fun res!21308 () Bool)

(assert (=> b!24679 (=> res!21308 e!16846)))

(assert (=> b!24679 (= res!21308 (not (= lt!35158 (bvsub (bvadd lt!35154 to!314) i!635))))))

(assert (=> b!24679 (= lt!35158 (bitIndex!0 (size!705 (buf!1026 (_2!1488 lt!35157))) (currentByte!2339 (_2!1488 lt!35157)) (currentBit!2334 (_2!1488 lt!35157))))))

(declare-fun b!24680 () Bool)

(declare-fun e!16836 () Bool)

(assert (=> b!24680 (= e!16836 e!16837)))

(declare-fun res!21318 () Bool)

(assert (=> b!24680 (=> res!21318 e!16837)))

(assert (=> b!24680 (= res!21318 (not (isPrefixOf!0 (_2!1488 lt!35148) (_2!1488 lt!35157))))))

(assert (=> b!24680 (isPrefixOf!0 thiss!1379 (_2!1488 lt!35157))))

(declare-fun lt!35149 () Unit!2053)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1242 BitStream!1242 BitStream!1242) Unit!2053)

(assert (=> b!24680 (= lt!35149 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1488 lt!35148) (_2!1488 lt!35157)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1242 array!1639 (_ BitVec 64) (_ BitVec 64)) tuple2!2802)

(assert (=> b!24680 (= lt!35157 (appendBitsMSBFirstLoop!0 (_2!1488 lt!35148) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!24680 e!16839))

(declare-fun res!21307 () Bool)

(assert (=> b!24680 (=> (not res!21307) (not e!16839))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!24680 (= res!21307 (validate_offset_bits!1 ((_ sign_extend 32) (size!705 (buf!1026 (_2!1488 lt!35148)))) ((_ sign_extend 32) (currentByte!2339 thiss!1379)) ((_ sign_extend 32) (currentBit!2334 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!35156 () Unit!2053)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1242 array!1639 (_ BitVec 64)) Unit!2053)

(assert (=> b!24680 (= lt!35156 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1026 (_2!1488 lt!35148)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1242 BitStream!1242) tuple2!2804)

(assert (=> b!24680 (= lt!35155 (reader!0 thiss!1379 (_2!1488 lt!35148)))))

(declare-fun b!24681 () Bool)

(assert (=> b!24681 (= e!16841 e!16836)))

(declare-fun res!21315 () Bool)

(assert (=> b!24681 (=> res!21315 e!16836)))

(assert (=> b!24681 (= res!21315 (not (isPrefixOf!0 thiss!1379 (_2!1488 lt!35148))))))

(declare-fun lt!35151 () (_ BitVec 64))

(assert (=> b!24681 (validate_offset_bits!1 ((_ sign_extend 32) (size!705 (buf!1026 (_2!1488 lt!35148)))) ((_ sign_extend 32) (currentByte!2339 (_2!1488 lt!35148))) ((_ sign_extend 32) (currentBit!2334 (_2!1488 lt!35148))) lt!35151)))

(assert (=> b!24681 (= lt!35151 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!35152 () Unit!2053)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1242 BitStream!1242 (_ BitVec 64) (_ BitVec 64)) Unit!2053)

(assert (=> b!24681 (= lt!35152 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1488 lt!35148) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1242 (_ BitVec 8) (_ BitVec 32)) tuple2!2802)

(assert (=> b!24681 (= lt!35148 (appendBitFromByte!0 thiss!1379 (select (arr!1161 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!24682 () Bool)

(assert (=> b!24682 (= e!16843 true)))

(assert (=> b!24682 (validate_offset_bits!1 ((_ sign_extend 32) (size!705 (buf!1026 (_2!1488 lt!35157)))) ((_ sign_extend 32) (currentByte!2339 (_2!1488 lt!35148))) ((_ sign_extend 32) (currentBit!2334 (_2!1488 lt!35148))) lt!35151)))

(declare-fun lt!35160 () Unit!2053)

(assert (=> b!24682 (= lt!35160 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1488 lt!35148) (buf!1026 (_2!1488 lt!35157)) lt!35151))))

(declare-fun lt!35153 () tuple2!2804)

(assert (=> b!24682 (= lt!35153 (reader!0 (_2!1488 lt!35148) (_2!1488 lt!35157)))))

(assert (=> b!24682 (validate_offset_bits!1 ((_ sign_extend 32) (size!705 (buf!1026 (_2!1488 lt!35157)))) ((_ sign_extend 32) (currentByte!2339 thiss!1379)) ((_ sign_extend 32) (currentBit!2334 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!35150 () Unit!2053)

(assert (=> b!24682 (= lt!35150 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1026 (_2!1488 lt!35157)) (bvsub to!314 i!635)))))

(declare-fun lt!35159 () tuple2!2804)

(assert (=> b!24682 (= lt!35159 (reader!0 thiss!1379 (_2!1488 lt!35157)))))

(declare-fun b!24683 () Bool)

(assert (=> b!24683 (= e!16844 (array_inv!674 (buf!1026 thiss!1379)))))

(declare-fun b!24684 () Bool)

(declare-fun res!21313 () Bool)

(assert (=> b!24684 (=> (not res!21313) (not e!16842))))

(assert (=> b!24684 (= res!21313 (validate_offset_bits!1 ((_ sign_extend 32) (size!705 (buf!1026 thiss!1379))) ((_ sign_extend 32) (currentByte!2339 thiss!1379)) ((_ sign_extend 32) (currentBit!2334 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!24685 () Bool)

(declare-fun res!21309 () Bool)

(assert (=> b!24685 (=> res!21309 e!16843)))

(assert (=> b!24685 (= res!21309 (not (invariant!0 (currentBit!2334 (_2!1488 lt!35148)) (currentByte!2339 (_2!1488 lt!35148)) (size!705 (buf!1026 (_2!1488 lt!35148))))))))

(assert (= (and start!5716 res!21306) b!24684))

(assert (= (and b!24684 res!21313) b!24677))

(assert (= (and b!24677 (not res!21316)) b!24681))

(assert (= (and b!24681 (not res!21315)) b!24680))

(assert (= (and b!24680 res!21307) b!24673))

(assert (= (and b!24680 (not res!21318)) b!24679))

(assert (= (and b!24679 (not res!21308)) b!24672))

(assert (= (and b!24672 (not res!21312)) b!24676))

(assert (= (and b!24676 (not res!21310)) b!24674))

(assert (= (and b!24674 res!21311) b!24675))

(assert (= (and b!24674 (not res!21314)) b!24685))

(assert (= (and b!24685 (not res!21309)) b!24678))

(assert (= (and b!24678 (not res!21317)) b!24682))

(assert (= start!5716 b!24683))

(declare-fun m!34889 () Bool)

(assert (=> b!24681 m!34889))

(assert (=> b!24681 m!34889))

(declare-fun m!34891 () Bool)

(assert (=> b!24681 m!34891))

(declare-fun m!34893 () Bool)

(assert (=> b!24681 m!34893))

(declare-fun m!34895 () Bool)

(assert (=> b!24681 m!34895))

(declare-fun m!34897 () Bool)

(assert (=> b!24681 m!34897))

(declare-fun m!34899 () Bool)

(assert (=> b!24678 m!34899))

(declare-fun m!34901 () Bool)

(assert (=> b!24673 m!34901))

(assert (=> b!24673 m!34901))

(declare-fun m!34903 () Bool)

(assert (=> b!24673 m!34903))

(declare-fun m!34905 () Bool)

(assert (=> b!24673 m!34905))

(assert (=> b!24673 m!34905))

(declare-fun m!34907 () Bool)

(assert (=> b!24673 m!34907))

(declare-fun m!34909 () Bool)

(assert (=> b!24672 m!34909))

(declare-fun m!34911 () Bool)

(assert (=> b!24677 m!34911))

(declare-fun m!34913 () Bool)

(assert (=> b!24677 m!34913))

(declare-fun m!34915 () Bool)

(assert (=> b!24677 m!34915))

(declare-fun m!34917 () Bool)

(assert (=> b!24682 m!34917))

(declare-fun m!34919 () Bool)

(assert (=> b!24682 m!34919))

(declare-fun m!34921 () Bool)

(assert (=> b!24682 m!34921))

(declare-fun m!34923 () Bool)

(assert (=> b!24682 m!34923))

(declare-fun m!34925 () Bool)

(assert (=> b!24682 m!34925))

(declare-fun m!34927 () Bool)

(assert (=> b!24682 m!34927))

(declare-fun m!34929 () Bool)

(assert (=> b!24679 m!34929))

(declare-fun m!34931 () Bool)

(assert (=> start!5716 m!34931))

(declare-fun m!34933 () Bool)

(assert (=> start!5716 m!34933))

(declare-fun m!34935 () Bool)

(assert (=> b!24684 m!34935))

(declare-fun m!34937 () Bool)

(assert (=> b!24675 m!34937))

(declare-fun m!34939 () Bool)

(assert (=> b!24683 m!34939))

(declare-fun m!34941 () Bool)

(assert (=> b!24685 m!34941))

(declare-fun m!34943 () Bool)

(assert (=> b!24680 m!34943))

(declare-fun m!34945 () Bool)

(assert (=> b!24680 m!34945))

(declare-fun m!34947 () Bool)

(assert (=> b!24680 m!34947))

(declare-fun m!34949 () Bool)

(assert (=> b!24680 m!34949))

(declare-fun m!34951 () Bool)

(assert (=> b!24680 m!34951))

(declare-fun m!34953 () Bool)

(assert (=> b!24680 m!34953))

(declare-fun m!34955 () Bool)

(assert (=> b!24680 m!34955))

(check-sat (not b!24685) (not b!24677) (not b!24682) (not b!24673) (not b!24679) (not b!24675) (not b!24672) (not b!24680) (not b!24681) (not b!24678) (not b!24684) (not start!5716) (not b!24683))
