; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11824 () Bool)

(assert start!11824)

(declare-fun b!58908 () Bool)

(declare-fun res!48976 () Bool)

(declare-fun e!39132 () Bool)

(assert (=> b!58908 (=> res!48976 e!39132)))

(declare-datatypes ((array!2681 0))(
  ( (array!2682 (arr!1780 (Array (_ BitVec 32) (_ BitVec 8))) (size!1216 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2120 0))(
  ( (BitStream!2121 (buf!1597 array!2681) (currentByte!3215 (_ BitVec 32)) (currentBit!3210 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!4055 0))(
  ( (Unit!4056) )
))
(declare-datatypes ((tuple2!5362 0))(
  ( (tuple2!5363 (_1!2792 Unit!4055) (_2!2792 BitStream!2120)) )
))
(declare-fun lt!92746 () tuple2!5362)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!58908 (= res!48976 (not (invariant!0 (currentBit!3210 (_2!2792 lt!92746)) (currentByte!3215 (_2!2792 lt!92746)) (size!1216 (buf!1597 (_2!2792 lt!92746))))))))

(declare-fun b!58909 () Bool)

(declare-fun e!39127 () Bool)

(declare-fun e!39130 () Bool)

(assert (=> b!58909 (= e!39127 e!39130)))

(declare-fun res!48978 () Bool)

(assert (=> b!58909 (=> res!48978 e!39130)))

(declare-fun lt!92743 () tuple2!5362)

(declare-fun isPrefixOf!0 (BitStream!2120 BitStream!2120) Bool)

(assert (=> b!58909 (= res!48978 (not (isPrefixOf!0 (_2!2792 lt!92743) (_2!2792 lt!92746))))))

(declare-fun thiss!1379 () BitStream!2120)

(assert (=> b!58909 (isPrefixOf!0 thiss!1379 (_2!2792 lt!92746))))

(declare-fun lt!92749 () Unit!4055)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2120 BitStream!2120 BitStream!2120) Unit!4055)

(assert (=> b!58909 (= lt!92749 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2792 lt!92743) (_2!2792 lt!92746)))))

(declare-fun srcBuffer!2 () array!2681)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2120 array!2681 (_ BitVec 64) (_ BitVec 64)) tuple2!5362)

(assert (=> b!58909 (= lt!92746 (appendBitsMSBFirstLoop!0 (_2!2792 lt!92743) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!39129 () Bool)

(assert (=> b!58909 e!39129))

(declare-fun res!48980 () Bool)

(assert (=> b!58909 (=> (not res!48980) (not e!39129))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!58909 (= res!48980 (validate_offset_bits!1 ((_ sign_extend 32) (size!1216 (buf!1597 (_2!2792 lt!92743)))) ((_ sign_extend 32) (currentByte!3215 thiss!1379)) ((_ sign_extend 32) (currentBit!3210 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!92747 () Unit!4055)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2120 array!2681 (_ BitVec 64)) Unit!4055)

(assert (=> b!58909 (= lt!92747 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1597 (_2!2792 lt!92743)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!5364 0))(
  ( (tuple2!5365 (_1!2793 BitStream!2120) (_2!2793 BitStream!2120)) )
))
(declare-fun lt!92741 () tuple2!5364)

(declare-fun reader!0 (BitStream!2120 BitStream!2120) tuple2!5364)

(assert (=> b!58909 (= lt!92741 (reader!0 thiss!1379 (_2!2792 lt!92743)))))

(declare-fun b!58910 () Bool)

(assert (=> b!58910 (= e!39130 e!39132)))

(declare-fun res!48972 () Bool)

(assert (=> b!58910 (=> res!48972 e!39132)))

(declare-fun lt!92748 () (_ BitVec 64))

(declare-fun lt!92742 () (_ BitVec 64))

(assert (=> b!58910 (= res!48972 (not (= lt!92748 (bvsub (bvadd lt!92742 to!314) i!635))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!58910 (= lt!92748 (bitIndex!0 (size!1216 (buf!1597 (_2!2792 lt!92746))) (currentByte!3215 (_2!2792 lt!92746)) (currentBit!3210 (_2!2792 lt!92746))))))

(declare-fun e!39134 () Bool)

(declare-fun b!58911 () Bool)

(assert (=> b!58911 (= e!39134 (= lt!92748 (bvsub (bvsub (bvadd (bitIndex!0 (size!1216 (buf!1597 (_2!2792 lt!92743))) (currentByte!3215 (_2!2792 lt!92743)) (currentBit!3210 (_2!2792 lt!92743))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!58912 () Bool)

(declare-fun e!39136 () Bool)

(assert (=> b!58912 (= e!39132 e!39136)))

(declare-fun res!48974 () Bool)

(assert (=> b!58912 (=> res!48974 e!39136)))

(assert (=> b!58912 (= res!48974 (not (= (size!1216 (buf!1597 (_2!2792 lt!92743))) (size!1216 (buf!1597 (_2!2792 lt!92746))))))))

(assert (=> b!58912 e!39134))

(declare-fun res!48973 () Bool)

(assert (=> b!58912 (=> (not res!48973) (not e!39134))))

(assert (=> b!58912 (= res!48973 (= (size!1216 (buf!1597 (_2!2792 lt!92746))) (size!1216 (buf!1597 thiss!1379))))))

(declare-fun b!58913 () Bool)

(declare-fun e!39137 () Bool)

(assert (=> b!58913 (= e!39137 e!39127)))

(declare-fun res!48984 () Bool)

(assert (=> b!58913 (=> res!48984 e!39127)))

(assert (=> b!58913 (= res!48984 (not (isPrefixOf!0 thiss!1379 (_2!2792 lt!92743))))))

(assert (=> b!58913 (validate_offset_bits!1 ((_ sign_extend 32) (size!1216 (buf!1597 (_2!2792 lt!92743)))) ((_ sign_extend 32) (currentByte!3215 (_2!2792 lt!92743))) ((_ sign_extend 32) (currentBit!3210 (_2!2792 lt!92743))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!92752 () Unit!4055)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2120 BitStream!2120 (_ BitVec 64) (_ BitVec 64)) Unit!4055)

(assert (=> b!58913 (= lt!92752 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2792 lt!92743) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2120 (_ BitVec 8) (_ BitVec 32)) tuple2!5362)

(assert (=> b!58913 (= lt!92743 (appendBitFromByte!0 thiss!1379 (select (arr!1780 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!58914 () Bool)

(declare-fun e!39131 () Bool)

(assert (=> b!58914 (= e!39131 (not e!39137))))

(declare-fun res!48982 () Bool)

(assert (=> b!58914 (=> res!48982 e!39137)))

(assert (=> b!58914 (= res!48982 (bvsge i!635 to!314))))

(assert (=> b!58914 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!92745 () Unit!4055)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2120) Unit!4055)

(assert (=> b!58914 (= lt!92745 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!58914 (= lt!92742 (bitIndex!0 (size!1216 (buf!1597 thiss!1379)) (currentByte!3215 thiss!1379) (currentBit!3210 thiss!1379)))))

(declare-fun res!48975 () Bool)

(assert (=> start!11824 (=> (not res!48975) (not e!39131))))

(assert (=> start!11824 (= res!48975 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1216 srcBuffer!2))))))))

(assert (=> start!11824 e!39131))

(assert (=> start!11824 true))

(declare-fun array_inv!1119 (array!2681) Bool)

(assert (=> start!11824 (array_inv!1119 srcBuffer!2)))

(declare-fun e!39133 () Bool)

(declare-fun inv!12 (BitStream!2120) Bool)

(assert (=> start!11824 (and (inv!12 thiss!1379) e!39133)))

(declare-fun b!58915 () Bool)

(declare-fun res!48977 () Bool)

(assert (=> b!58915 (=> (not res!48977) (not e!39131))))

(assert (=> b!58915 (= res!48977 (validate_offset_bits!1 ((_ sign_extend 32) (size!1216 (buf!1597 thiss!1379))) ((_ sign_extend 32) (currentByte!3215 thiss!1379)) ((_ sign_extend 32) (currentBit!3210 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!58916 () Bool)

(declare-fun res!48979 () Bool)

(assert (=> b!58916 (=> res!48979 e!39136)))

(assert (=> b!58916 (= res!48979 (not (invariant!0 (currentBit!3210 (_2!2792 lt!92743)) (currentByte!3215 (_2!2792 lt!92743)) (size!1216 (buf!1597 (_2!2792 lt!92746))))))))

(declare-fun b!58917 () Bool)

(assert (=> b!58917 (= e!39136 true)))

(declare-fun lt!92744 () tuple2!5364)

(assert (=> b!58917 (= lt!92744 (reader!0 (_2!2792 lt!92743) (_2!2792 lt!92746)))))

(assert (=> b!58917 (validate_offset_bits!1 ((_ sign_extend 32) (size!1216 (buf!1597 (_2!2792 lt!92746)))) ((_ sign_extend 32) (currentByte!3215 thiss!1379)) ((_ sign_extend 32) (currentBit!3210 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!92751 () Unit!4055)

(assert (=> b!58917 (= lt!92751 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1597 (_2!2792 lt!92746)) (bvsub to!314 i!635)))))

(declare-fun lt!92750 () tuple2!5364)

(assert (=> b!58917 (= lt!92750 (reader!0 thiss!1379 (_2!2792 lt!92746)))))

(declare-fun b!58918 () Bool)

(assert (=> b!58918 (= e!39133 (array_inv!1119 (buf!1597 thiss!1379)))))

(declare-fun b!58919 () Bool)

(declare-fun res!48983 () Bool)

(assert (=> b!58919 (=> res!48983 e!39136)))

(assert (=> b!58919 (= res!48983 (not (invariant!0 (currentBit!3210 (_2!2792 lt!92743)) (currentByte!3215 (_2!2792 lt!92743)) (size!1216 (buf!1597 (_2!2792 lt!92743))))))))

(declare-fun b!58920 () Bool)

(declare-datatypes ((List!635 0))(
  ( (Nil!632) (Cons!631 (h!750 Bool) (t!1385 List!635)) )
))
(declare-fun head!454 (List!635) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2120 array!2681 (_ BitVec 64) (_ BitVec 64)) List!635)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2120 BitStream!2120 (_ BitVec 64)) List!635)

(assert (=> b!58920 (= e!39129 (= (head!454 (byteArrayBitContentToList!0 (_2!2792 lt!92743) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!454 (bitStreamReadBitsIntoList!0 (_2!2792 lt!92743) (_1!2793 lt!92741) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!58921 () Bool)

(declare-fun res!48981 () Bool)

(assert (=> b!58921 (=> res!48981 e!39132)))

(assert (=> b!58921 (= res!48981 (not (= (size!1216 (buf!1597 thiss!1379)) (size!1216 (buf!1597 (_2!2792 lt!92746))))))))

(assert (= (and start!11824 res!48975) b!58915))

(assert (= (and b!58915 res!48977) b!58914))

(assert (= (and b!58914 (not res!48982)) b!58913))

(assert (= (and b!58913 (not res!48984)) b!58909))

(assert (= (and b!58909 res!48980) b!58920))

(assert (= (and b!58909 (not res!48978)) b!58910))

(assert (= (and b!58910 (not res!48972)) b!58908))

(assert (= (and b!58908 (not res!48976)) b!58921))

(assert (= (and b!58921 (not res!48981)) b!58912))

(assert (= (and b!58912 res!48973) b!58911))

(assert (= (and b!58912 (not res!48974)) b!58919))

(assert (= (and b!58919 (not res!48983)) b!58916))

(assert (= (and b!58916 (not res!48979)) b!58917))

(assert (= start!11824 b!58918))

(declare-fun m!92769 () Bool)

(assert (=> b!58915 m!92769))

(declare-fun m!92771 () Bool)

(assert (=> b!58909 m!92771))

(declare-fun m!92773 () Bool)

(assert (=> b!58909 m!92773))

(declare-fun m!92775 () Bool)

(assert (=> b!58909 m!92775))

(declare-fun m!92777 () Bool)

(assert (=> b!58909 m!92777))

(declare-fun m!92779 () Bool)

(assert (=> b!58909 m!92779))

(declare-fun m!92781 () Bool)

(assert (=> b!58909 m!92781))

(declare-fun m!92783 () Bool)

(assert (=> b!58909 m!92783))

(declare-fun m!92785 () Bool)

(assert (=> b!58918 m!92785))

(declare-fun m!92787 () Bool)

(assert (=> b!58913 m!92787))

(declare-fun m!92789 () Bool)

(assert (=> b!58913 m!92789))

(assert (=> b!58913 m!92789))

(declare-fun m!92791 () Bool)

(assert (=> b!58913 m!92791))

(declare-fun m!92793 () Bool)

(assert (=> b!58913 m!92793))

(declare-fun m!92795 () Bool)

(assert (=> b!58913 m!92795))

(declare-fun m!92797 () Bool)

(assert (=> b!58919 m!92797))

(declare-fun m!92799 () Bool)

(assert (=> b!58910 m!92799))

(declare-fun m!92801 () Bool)

(assert (=> b!58920 m!92801))

(assert (=> b!58920 m!92801))

(declare-fun m!92803 () Bool)

(assert (=> b!58920 m!92803))

(declare-fun m!92805 () Bool)

(assert (=> b!58920 m!92805))

(assert (=> b!58920 m!92805))

(declare-fun m!92807 () Bool)

(assert (=> b!58920 m!92807))

(declare-fun m!92809 () Bool)

(assert (=> b!58917 m!92809))

(declare-fun m!92811 () Bool)

(assert (=> b!58917 m!92811))

(declare-fun m!92813 () Bool)

(assert (=> b!58917 m!92813))

(declare-fun m!92815 () Bool)

(assert (=> b!58917 m!92815))

(declare-fun m!92817 () Bool)

(assert (=> b!58914 m!92817))

(declare-fun m!92819 () Bool)

(assert (=> b!58914 m!92819))

(declare-fun m!92821 () Bool)

(assert (=> b!58914 m!92821))

(declare-fun m!92823 () Bool)

(assert (=> b!58908 m!92823))

(declare-fun m!92825 () Bool)

(assert (=> start!11824 m!92825))

(declare-fun m!92827 () Bool)

(assert (=> start!11824 m!92827))

(declare-fun m!92829 () Bool)

(assert (=> b!58911 m!92829))

(declare-fun m!92831 () Bool)

(assert (=> b!58916 m!92831))

(push 1)

