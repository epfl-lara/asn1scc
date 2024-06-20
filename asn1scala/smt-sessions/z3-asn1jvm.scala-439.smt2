; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!11828 () Bool)

(assert start!11828)

(declare-fun b!58992 () Bool)

(declare-fun e!39197 () Bool)

(declare-fun e!39194 () Bool)

(assert (=> b!58992 (= e!39197 (not e!39194))))

(declare-fun res!49051 () Bool)

(assert (=> b!58992 (=> res!49051 e!39194)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!58992 (= res!49051 (bvsge i!635 to!314))))

(declare-datatypes ((array!2685 0))(
  ( (array!2686 (arr!1782 (Array (_ BitVec 32) (_ BitVec 8))) (size!1218 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2124 0))(
  ( (BitStream!2125 (buf!1599 array!2685) (currentByte!3217 (_ BitVec 32)) (currentBit!3212 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2124)

(declare-fun isPrefixOf!0 (BitStream!2124 BitStream!2124) Bool)

(assert (=> b!58992 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!4059 0))(
  ( (Unit!4060) )
))
(declare-fun lt!92814 () Unit!4059)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2124) Unit!4059)

(assert (=> b!58992 (= lt!92814 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!92815 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!58992 (= lt!92815 (bitIndex!0 (size!1218 (buf!1599 thiss!1379)) (currentByte!3217 thiss!1379) (currentBit!3212 thiss!1379)))))

(declare-fun res!49058 () Bool)

(assert (=> start!11828 (=> (not res!49058) (not e!39197))))

(declare-fun srcBuffer!2 () array!2685)

(assert (=> start!11828 (= res!49058 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1218 srcBuffer!2))))))))

(assert (=> start!11828 e!39197))

(assert (=> start!11828 true))

(declare-fun array_inv!1121 (array!2685) Bool)

(assert (=> start!11828 (array_inv!1121 srcBuffer!2)))

(declare-fun e!39202 () Bool)

(declare-fun inv!12 (BitStream!2124) Bool)

(assert (=> start!11828 (and (inv!12 thiss!1379) e!39202)))

(declare-fun b!58993 () Bool)

(declare-fun e!39203 () Bool)

(declare-fun e!39193 () Bool)

(assert (=> b!58993 (= e!39203 e!39193)))

(declare-fun res!49052 () Bool)

(assert (=> b!58993 (=> res!49052 e!39193)))

(declare-datatypes ((tuple2!5370 0))(
  ( (tuple2!5371 (_1!2796 Unit!4059) (_2!2796 BitStream!2124)) )
))
(declare-fun lt!92819 () tuple2!5370)

(declare-fun lt!92818 () tuple2!5370)

(assert (=> b!58993 (= res!49052 (not (= (size!1218 (buf!1599 (_2!2796 lt!92819))) (size!1218 (buf!1599 (_2!2796 lt!92818))))))))

(declare-fun e!39199 () Bool)

(assert (=> b!58993 e!39199))

(declare-fun res!49057 () Bool)

(assert (=> b!58993 (=> (not res!49057) (not e!39199))))

(assert (=> b!58993 (= res!49057 (= (size!1218 (buf!1599 (_2!2796 lt!92818))) (size!1218 (buf!1599 thiss!1379))))))

(declare-fun b!58994 () Bool)

(declare-fun res!49050 () Bool)

(assert (=> b!58994 (=> res!49050 e!39203)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!58994 (= res!49050 (not (invariant!0 (currentBit!3212 (_2!2796 lt!92818)) (currentByte!3217 (_2!2796 lt!92818)) (size!1218 (buf!1599 (_2!2796 lt!92818))))))))

(declare-fun b!58995 () Bool)

(assert (=> b!58995 (= e!39193 true)))

(declare-datatypes ((tuple2!5372 0))(
  ( (tuple2!5373 (_1!2797 BitStream!2124) (_2!2797 BitStream!2124)) )
))
(declare-fun lt!92816 () tuple2!5372)

(declare-fun reader!0 (BitStream!2124 BitStream!2124) tuple2!5372)

(assert (=> b!58995 (= lt!92816 (reader!0 (_2!2796 lt!92819) (_2!2796 lt!92818)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!58995 (validate_offset_bits!1 ((_ sign_extend 32) (size!1218 (buf!1599 (_2!2796 lt!92818)))) ((_ sign_extend 32) (currentByte!3217 thiss!1379)) ((_ sign_extend 32) (currentBit!3212 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!92824 () Unit!4059)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2124 array!2685 (_ BitVec 64)) Unit!4059)

(assert (=> b!58995 (= lt!92824 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1599 (_2!2796 lt!92818)) (bvsub to!314 i!635)))))

(declare-fun lt!92821 () tuple2!5372)

(assert (=> b!58995 (= lt!92821 (reader!0 thiss!1379 (_2!2796 lt!92818)))))

(declare-fun b!58996 () Bool)

(declare-fun res!49059 () Bool)

(assert (=> b!58996 (=> res!49059 e!39193)))

(assert (=> b!58996 (= res!49059 (not (invariant!0 (currentBit!3212 (_2!2796 lt!92819)) (currentByte!3217 (_2!2796 lt!92819)) (size!1218 (buf!1599 (_2!2796 lt!92818))))))))

(declare-fun b!58997 () Bool)

(declare-fun res!49062 () Bool)

(assert (=> b!58997 (=> res!49062 e!39203)))

(assert (=> b!58997 (= res!49062 (not (= (size!1218 (buf!1599 thiss!1379)) (size!1218 (buf!1599 (_2!2796 lt!92818))))))))

(declare-fun b!58998 () Bool)

(declare-fun e!39201 () Bool)

(assert (=> b!58998 (= e!39194 e!39201)))

(declare-fun res!49060 () Bool)

(assert (=> b!58998 (=> res!49060 e!39201)))

(assert (=> b!58998 (= res!49060 (not (isPrefixOf!0 thiss!1379 (_2!2796 lt!92819))))))

(assert (=> b!58998 (validate_offset_bits!1 ((_ sign_extend 32) (size!1218 (buf!1599 (_2!2796 lt!92819)))) ((_ sign_extend 32) (currentByte!3217 (_2!2796 lt!92819))) ((_ sign_extend 32) (currentBit!3212 (_2!2796 lt!92819))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!92817 () Unit!4059)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2124 BitStream!2124 (_ BitVec 64) (_ BitVec 64)) Unit!4059)

(assert (=> b!58998 (= lt!92817 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2796 lt!92819) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2124 (_ BitVec 8) (_ BitVec 32)) tuple2!5370)

(assert (=> b!58998 (= lt!92819 (appendBitFromByte!0 thiss!1379 (select (arr!1782 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!58999 () Bool)

(declare-fun e!39195 () Bool)

(declare-fun lt!92813 () tuple2!5372)

(declare-datatypes ((List!637 0))(
  ( (Nil!634) (Cons!633 (h!752 Bool) (t!1387 List!637)) )
))
(declare-fun head!456 (List!637) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2124 array!2685 (_ BitVec 64) (_ BitVec 64)) List!637)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2124 BitStream!2124 (_ BitVec 64)) List!637)

(assert (=> b!58999 (= e!39195 (= (head!456 (byteArrayBitContentToList!0 (_2!2796 lt!92819) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!456 (bitStreamReadBitsIntoList!0 (_2!2796 lt!92819) (_1!2797 lt!92813) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!59000 () Bool)

(declare-fun res!49055 () Bool)

(assert (=> b!59000 (=> res!49055 e!39193)))

(assert (=> b!59000 (= res!49055 (not (invariant!0 (currentBit!3212 (_2!2796 lt!92819)) (currentByte!3217 (_2!2796 lt!92819)) (size!1218 (buf!1599 (_2!2796 lt!92819))))))))

(declare-fun b!59001 () Bool)

(declare-fun e!39198 () Bool)

(assert (=> b!59001 (= e!39201 e!39198)))

(declare-fun res!49054 () Bool)

(assert (=> b!59001 (=> res!49054 e!39198)))

(assert (=> b!59001 (= res!49054 (not (isPrefixOf!0 (_2!2796 lt!92819) (_2!2796 lt!92818))))))

(assert (=> b!59001 (isPrefixOf!0 thiss!1379 (_2!2796 lt!92818))))

(declare-fun lt!92820 () Unit!4059)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2124 BitStream!2124 BitStream!2124) Unit!4059)

(assert (=> b!59001 (= lt!92820 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2796 lt!92819) (_2!2796 lt!92818)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2124 array!2685 (_ BitVec 64) (_ BitVec 64)) tuple2!5370)

(assert (=> b!59001 (= lt!92818 (appendBitsMSBFirstLoop!0 (_2!2796 lt!92819) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!59001 e!39195))

(declare-fun res!49053 () Bool)

(assert (=> b!59001 (=> (not res!49053) (not e!39195))))

(assert (=> b!59001 (= res!49053 (validate_offset_bits!1 ((_ sign_extend 32) (size!1218 (buf!1599 (_2!2796 lt!92819)))) ((_ sign_extend 32) (currentByte!3217 thiss!1379)) ((_ sign_extend 32) (currentBit!3212 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!92823 () Unit!4059)

(assert (=> b!59001 (= lt!92823 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1599 (_2!2796 lt!92819)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!59001 (= lt!92813 (reader!0 thiss!1379 (_2!2796 lt!92819)))))

(declare-fun b!59002 () Bool)

(assert (=> b!59002 (= e!39198 e!39203)))

(declare-fun res!49056 () Bool)

(assert (=> b!59002 (=> res!49056 e!39203)))

(declare-fun lt!92822 () (_ BitVec 64))

(assert (=> b!59002 (= res!49056 (not (= lt!92822 (bvsub (bvadd lt!92815 to!314) i!635))))))

(assert (=> b!59002 (= lt!92822 (bitIndex!0 (size!1218 (buf!1599 (_2!2796 lt!92818))) (currentByte!3217 (_2!2796 lt!92818)) (currentBit!3212 (_2!2796 lt!92818))))))

(declare-fun b!59003 () Bool)

(assert (=> b!59003 (= e!39202 (array_inv!1121 (buf!1599 thiss!1379)))))

(declare-fun b!59004 () Bool)

(declare-fun res!49061 () Bool)

(assert (=> b!59004 (=> (not res!49061) (not e!39197))))

(assert (=> b!59004 (= res!49061 (validate_offset_bits!1 ((_ sign_extend 32) (size!1218 (buf!1599 thiss!1379))) ((_ sign_extend 32) (currentByte!3217 thiss!1379)) ((_ sign_extend 32) (currentBit!3212 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!59005 () Bool)

(assert (=> b!59005 (= e!39199 (= lt!92822 (bvsub (bvsub (bvadd (bitIndex!0 (size!1218 (buf!1599 (_2!2796 lt!92819))) (currentByte!3217 (_2!2796 lt!92819)) (currentBit!3212 (_2!2796 lt!92819))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and start!11828 res!49058) b!59004))

(assert (= (and b!59004 res!49061) b!58992))

(assert (= (and b!58992 (not res!49051)) b!58998))

(assert (= (and b!58998 (not res!49060)) b!59001))

(assert (= (and b!59001 res!49053) b!58999))

(assert (= (and b!59001 (not res!49054)) b!59002))

(assert (= (and b!59002 (not res!49056)) b!58994))

(assert (= (and b!58994 (not res!49050)) b!58997))

(assert (= (and b!58997 (not res!49062)) b!58993))

(assert (= (and b!58993 res!49057) b!59005))

(assert (= (and b!58993 (not res!49052)) b!59000))

(assert (= (and b!59000 (not res!49055)) b!58996))

(assert (= (and b!58996 (not res!49059)) b!58995))

(assert (= start!11828 b!59003))

(declare-fun m!92897 () Bool)

(assert (=> b!59002 m!92897))

(declare-fun m!92899 () Bool)

(assert (=> start!11828 m!92899))

(declare-fun m!92901 () Bool)

(assert (=> start!11828 m!92901))

(declare-fun m!92903 () Bool)

(assert (=> b!59003 m!92903))

(declare-fun m!92905 () Bool)

(assert (=> b!59001 m!92905))

(declare-fun m!92907 () Bool)

(assert (=> b!59001 m!92907))

(declare-fun m!92909 () Bool)

(assert (=> b!59001 m!92909))

(declare-fun m!92911 () Bool)

(assert (=> b!59001 m!92911))

(declare-fun m!92913 () Bool)

(assert (=> b!59001 m!92913))

(declare-fun m!92915 () Bool)

(assert (=> b!59001 m!92915))

(declare-fun m!92917 () Bool)

(assert (=> b!59001 m!92917))

(declare-fun m!92919 () Bool)

(assert (=> b!58992 m!92919))

(declare-fun m!92921 () Bool)

(assert (=> b!58992 m!92921))

(declare-fun m!92923 () Bool)

(assert (=> b!58992 m!92923))

(declare-fun m!92925 () Bool)

(assert (=> b!59004 m!92925))

(declare-fun m!92927 () Bool)

(assert (=> b!58999 m!92927))

(assert (=> b!58999 m!92927))

(declare-fun m!92929 () Bool)

(assert (=> b!58999 m!92929))

(declare-fun m!92931 () Bool)

(assert (=> b!58999 m!92931))

(assert (=> b!58999 m!92931))

(declare-fun m!92933 () Bool)

(assert (=> b!58999 m!92933))

(declare-fun m!92935 () Bool)

(assert (=> b!58994 m!92935))

(declare-fun m!92937 () Bool)

(assert (=> b!58998 m!92937))

(declare-fun m!92939 () Bool)

(assert (=> b!58998 m!92939))

(declare-fun m!92941 () Bool)

(assert (=> b!58998 m!92941))

(assert (=> b!58998 m!92937))

(declare-fun m!92943 () Bool)

(assert (=> b!58998 m!92943))

(declare-fun m!92945 () Bool)

(assert (=> b!58998 m!92945))

(declare-fun m!92947 () Bool)

(assert (=> b!58996 m!92947))

(declare-fun m!92949 () Bool)

(assert (=> b!58995 m!92949))

(declare-fun m!92951 () Bool)

(assert (=> b!58995 m!92951))

(declare-fun m!92953 () Bool)

(assert (=> b!58995 m!92953))

(declare-fun m!92955 () Bool)

(assert (=> b!58995 m!92955))

(declare-fun m!92957 () Bool)

(assert (=> b!59005 m!92957))

(declare-fun m!92959 () Bool)

(assert (=> b!59000 m!92959))

(check-sat (not b!58998) (not b!59000) (not b!58995) (not b!59002) (not b!59001) (not b!59003) (not b!59005) (not start!11828) (not b!58994) (not b!58996) (not b!59004) (not b!58992) (not b!58999))
