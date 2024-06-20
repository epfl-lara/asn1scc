; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!11822 () Bool)

(assert start!11822)

(declare-fun b!58866 () Bool)

(declare-fun e!39102 () Bool)

(declare-fun e!39095 () Bool)

(assert (=> b!58866 (= e!39102 e!39095)))

(declare-fun res!48943 () Bool)

(assert (=> b!58866 (=> res!48943 e!39095)))

(declare-datatypes ((array!2679 0))(
  ( (array!2680 (arr!1779 (Array (_ BitVec 32) (_ BitVec 8))) (size!1215 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2118 0))(
  ( (BitStream!2119 (buf!1596 array!2679) (currentByte!3214 (_ BitVec 32)) (currentBit!3209 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!4053 0))(
  ( (Unit!4054) )
))
(declare-datatypes ((tuple2!5358 0))(
  ( (tuple2!5359 (_1!2790 Unit!4053) (_2!2790 BitStream!2118)) )
))
(declare-fun lt!92712 () tuple2!5358)

(declare-fun lt!92707 () tuple2!5358)

(assert (=> b!58866 (= res!48943 (not (= (size!1215 (buf!1596 (_2!2790 lt!92712))) (size!1215 (buf!1596 (_2!2790 lt!92707))))))))

(declare-fun e!39100 () Bool)

(assert (=> b!58866 e!39100))

(declare-fun res!48939 () Bool)

(assert (=> b!58866 (=> (not res!48939) (not e!39100))))

(declare-fun thiss!1379 () BitStream!2118)

(assert (=> b!58866 (= res!48939 (= (size!1215 (buf!1596 (_2!2790 lt!92707))) (size!1215 (buf!1596 thiss!1379))))))

(declare-fun b!58867 () Bool)

(declare-fun res!48944 () Bool)

(assert (=> b!58867 (=> res!48944 e!39102)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!58867 (= res!48944 (not (invariant!0 (currentBit!3209 (_2!2790 lt!92707)) (currentByte!3214 (_2!2790 lt!92707)) (size!1215 (buf!1596 (_2!2790 lt!92707))))))))

(declare-fun srcBuffer!2 () array!2679)

(declare-fun e!39094 () Bool)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun b!58868 () Bool)

(declare-datatypes ((tuple2!5360 0))(
  ( (tuple2!5361 (_1!2791 BitStream!2118) (_2!2791 BitStream!2118)) )
))
(declare-fun lt!92714 () tuple2!5360)

(declare-datatypes ((List!634 0))(
  ( (Nil!631) (Cons!630 (h!749 Bool) (t!1384 List!634)) )
))
(declare-fun head!453 (List!634) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2118 array!2679 (_ BitVec 64) (_ BitVec 64)) List!634)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2118 BitStream!2118 (_ BitVec 64)) List!634)

(assert (=> b!58868 (= e!39094 (= (head!453 (byteArrayBitContentToList!0 (_2!2790 lt!92712) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!453 (bitStreamReadBitsIntoList!0 (_2!2790 lt!92712) (_1!2791 lt!92714) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun b!58869 () Bool)

(declare-fun lt!92705 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!58869 (= e!39100 (= lt!92705 (bvsub (bvsub (bvadd (bitIndex!0 (size!1215 (buf!1596 (_2!2790 lt!92712))) (currentByte!3214 (_2!2790 lt!92712)) (currentBit!3209 (_2!2790 lt!92712))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!58870 () Bool)

(declare-fun res!48936 () Bool)

(assert (=> b!58870 (=> res!48936 e!39095)))

(assert (=> b!58870 (= res!48936 (not (invariant!0 (currentBit!3209 (_2!2790 lt!92712)) (currentByte!3214 (_2!2790 lt!92712)) (size!1215 (buf!1596 (_2!2790 lt!92707))))))))

(declare-fun b!58871 () Bool)

(declare-fun res!48935 () Bool)

(assert (=> b!58871 (=> res!48935 e!39102)))

(assert (=> b!58871 (= res!48935 (not (= (size!1215 (buf!1596 thiss!1379)) (size!1215 (buf!1596 (_2!2790 lt!92707))))))))

(declare-fun res!48940 () Bool)

(declare-fun e!39104 () Bool)

(assert (=> start!11822 (=> (not res!48940) (not e!39104))))

(assert (=> start!11822 (= res!48940 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1215 srcBuffer!2))))))))

(assert (=> start!11822 e!39104))

(assert (=> start!11822 true))

(declare-fun array_inv!1118 (array!2679) Bool)

(assert (=> start!11822 (array_inv!1118 srcBuffer!2)))

(declare-fun e!39097 () Bool)

(declare-fun inv!12 (BitStream!2118) Bool)

(assert (=> start!11822 (and (inv!12 thiss!1379) e!39097)))

(declare-fun b!58872 () Bool)

(declare-fun res!48941 () Bool)

(assert (=> b!58872 (=> res!48941 e!39095)))

(assert (=> b!58872 (= res!48941 (not (invariant!0 (currentBit!3209 (_2!2790 lt!92712)) (currentByte!3214 (_2!2790 lt!92712)) (size!1215 (buf!1596 (_2!2790 lt!92712))))))))

(declare-fun b!58873 () Bool)

(assert (=> b!58873 (= e!39095 true)))

(declare-fun lt!92715 () tuple2!5360)

(declare-fun reader!0 (BitStream!2118 BitStream!2118) tuple2!5360)

(assert (=> b!58873 (= lt!92715 (reader!0 (_2!2790 lt!92712) (_2!2790 lt!92707)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!58873 (validate_offset_bits!1 ((_ sign_extend 32) (size!1215 (buf!1596 (_2!2790 lt!92707)))) ((_ sign_extend 32) (currentByte!3214 thiss!1379)) ((_ sign_extend 32) (currentBit!3209 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!92713 () Unit!4053)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2118 array!2679 (_ BitVec 64)) Unit!4053)

(assert (=> b!58873 (= lt!92713 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1596 (_2!2790 lt!92707)) (bvsub to!314 i!635)))))

(declare-fun lt!92709 () tuple2!5360)

(assert (=> b!58873 (= lt!92709 (reader!0 thiss!1379 (_2!2790 lt!92707)))))

(declare-fun b!58874 () Bool)

(declare-fun e!39096 () Bool)

(assert (=> b!58874 (= e!39104 (not e!39096))))

(declare-fun res!48937 () Bool)

(assert (=> b!58874 (=> res!48937 e!39096)))

(assert (=> b!58874 (= res!48937 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!2118 BitStream!2118) Bool)

(assert (=> b!58874 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!92716 () Unit!4053)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2118) Unit!4053)

(assert (=> b!58874 (= lt!92716 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!92706 () (_ BitVec 64))

(assert (=> b!58874 (= lt!92706 (bitIndex!0 (size!1215 (buf!1596 thiss!1379)) (currentByte!3214 thiss!1379) (currentBit!3209 thiss!1379)))))

(declare-fun b!58875 () Bool)

(declare-fun e!39101 () Bool)

(assert (=> b!58875 (= e!39096 e!39101)))

(declare-fun res!48934 () Bool)

(assert (=> b!58875 (=> res!48934 e!39101)))

(assert (=> b!58875 (= res!48934 (not (isPrefixOf!0 thiss!1379 (_2!2790 lt!92712))))))

(assert (=> b!58875 (validate_offset_bits!1 ((_ sign_extend 32) (size!1215 (buf!1596 (_2!2790 lt!92712)))) ((_ sign_extend 32) (currentByte!3214 (_2!2790 lt!92712))) ((_ sign_extend 32) (currentBit!3209 (_2!2790 lt!92712))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!92711 () Unit!4053)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2118 BitStream!2118 (_ BitVec 64) (_ BitVec 64)) Unit!4053)

(assert (=> b!58875 (= lt!92711 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2790 lt!92712) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2118 (_ BitVec 8) (_ BitVec 32)) tuple2!5358)

(assert (=> b!58875 (= lt!92712 (appendBitFromByte!0 thiss!1379 (select (arr!1779 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!58876 () Bool)

(assert (=> b!58876 (= e!39097 (array_inv!1118 (buf!1596 thiss!1379)))))

(declare-fun b!58877 () Bool)

(declare-fun e!39098 () Bool)

(assert (=> b!58877 (= e!39101 e!39098)))

(declare-fun res!48938 () Bool)

(assert (=> b!58877 (=> res!48938 e!39098)))

(assert (=> b!58877 (= res!48938 (not (isPrefixOf!0 (_2!2790 lt!92712) (_2!2790 lt!92707))))))

(assert (=> b!58877 (isPrefixOf!0 thiss!1379 (_2!2790 lt!92707))))

(declare-fun lt!92710 () Unit!4053)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2118 BitStream!2118 BitStream!2118) Unit!4053)

(assert (=> b!58877 (= lt!92710 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2790 lt!92712) (_2!2790 lt!92707)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2118 array!2679 (_ BitVec 64) (_ BitVec 64)) tuple2!5358)

(assert (=> b!58877 (= lt!92707 (appendBitsMSBFirstLoop!0 (_2!2790 lt!92712) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!58877 e!39094))

(declare-fun res!48945 () Bool)

(assert (=> b!58877 (=> (not res!48945) (not e!39094))))

(assert (=> b!58877 (= res!48945 (validate_offset_bits!1 ((_ sign_extend 32) (size!1215 (buf!1596 (_2!2790 lt!92712)))) ((_ sign_extend 32) (currentByte!3214 thiss!1379)) ((_ sign_extend 32) (currentBit!3209 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!92708 () Unit!4053)

(assert (=> b!58877 (= lt!92708 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1596 (_2!2790 lt!92712)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!58877 (= lt!92714 (reader!0 thiss!1379 (_2!2790 lt!92712)))))

(declare-fun b!58878 () Bool)

(declare-fun res!48933 () Bool)

(assert (=> b!58878 (=> (not res!48933) (not e!39104))))

(assert (=> b!58878 (= res!48933 (validate_offset_bits!1 ((_ sign_extend 32) (size!1215 (buf!1596 thiss!1379))) ((_ sign_extend 32) (currentByte!3214 thiss!1379)) ((_ sign_extend 32) (currentBit!3209 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!58879 () Bool)

(assert (=> b!58879 (= e!39098 e!39102)))

(declare-fun res!48942 () Bool)

(assert (=> b!58879 (=> res!48942 e!39102)))

(assert (=> b!58879 (= res!48942 (not (= lt!92705 (bvsub (bvadd lt!92706 to!314) i!635))))))

(assert (=> b!58879 (= lt!92705 (bitIndex!0 (size!1215 (buf!1596 (_2!2790 lt!92707))) (currentByte!3214 (_2!2790 lt!92707)) (currentBit!3209 (_2!2790 lt!92707))))))

(assert (= (and start!11822 res!48940) b!58878))

(assert (= (and b!58878 res!48933) b!58874))

(assert (= (and b!58874 (not res!48937)) b!58875))

(assert (= (and b!58875 (not res!48934)) b!58877))

(assert (= (and b!58877 res!48945) b!58868))

(assert (= (and b!58877 (not res!48938)) b!58879))

(assert (= (and b!58879 (not res!48942)) b!58867))

(assert (= (and b!58867 (not res!48944)) b!58871))

(assert (= (and b!58871 (not res!48935)) b!58866))

(assert (= (and b!58866 res!48939) b!58869))

(assert (= (and b!58866 (not res!48943)) b!58872))

(assert (= (and b!58872 (not res!48941)) b!58870))

(assert (= (and b!58870 (not res!48936)) b!58873))

(assert (= start!11822 b!58876))

(declare-fun m!92705 () Bool)

(assert (=> b!58877 m!92705))

(declare-fun m!92707 () Bool)

(assert (=> b!58877 m!92707))

(declare-fun m!92709 () Bool)

(assert (=> b!58877 m!92709))

(declare-fun m!92711 () Bool)

(assert (=> b!58877 m!92711))

(declare-fun m!92713 () Bool)

(assert (=> b!58877 m!92713))

(declare-fun m!92715 () Bool)

(assert (=> b!58877 m!92715))

(declare-fun m!92717 () Bool)

(assert (=> b!58877 m!92717))

(declare-fun m!92719 () Bool)

(assert (=> b!58875 m!92719))

(declare-fun m!92721 () Bool)

(assert (=> b!58875 m!92721))

(declare-fun m!92723 () Bool)

(assert (=> b!58875 m!92723))

(declare-fun m!92725 () Bool)

(assert (=> b!58875 m!92725))

(assert (=> b!58875 m!92721))

(declare-fun m!92727 () Bool)

(assert (=> b!58875 m!92727))

(declare-fun m!92729 () Bool)

(assert (=> b!58878 m!92729))

(declare-fun m!92731 () Bool)

(assert (=> b!58869 m!92731))

(declare-fun m!92733 () Bool)

(assert (=> b!58867 m!92733))

(declare-fun m!92735 () Bool)

(assert (=> b!58874 m!92735))

(declare-fun m!92737 () Bool)

(assert (=> b!58874 m!92737))

(declare-fun m!92739 () Bool)

(assert (=> b!58874 m!92739))

(declare-fun m!92741 () Bool)

(assert (=> start!11822 m!92741))

(declare-fun m!92743 () Bool)

(assert (=> start!11822 m!92743))

(declare-fun m!92745 () Bool)

(assert (=> b!58879 m!92745))

(declare-fun m!92747 () Bool)

(assert (=> b!58876 m!92747))

(declare-fun m!92749 () Bool)

(assert (=> b!58872 m!92749))

(declare-fun m!92751 () Bool)

(assert (=> b!58870 m!92751))

(declare-fun m!92753 () Bool)

(assert (=> b!58868 m!92753))

(assert (=> b!58868 m!92753))

(declare-fun m!92755 () Bool)

(assert (=> b!58868 m!92755))

(declare-fun m!92757 () Bool)

(assert (=> b!58868 m!92757))

(assert (=> b!58868 m!92757))

(declare-fun m!92759 () Bool)

(assert (=> b!58868 m!92759))

(declare-fun m!92761 () Bool)

(assert (=> b!58873 m!92761))

(declare-fun m!92763 () Bool)

(assert (=> b!58873 m!92763))

(declare-fun m!92765 () Bool)

(assert (=> b!58873 m!92765))

(declare-fun m!92767 () Bool)

(assert (=> b!58873 m!92767))

(check-sat (not b!58877) (not b!58870) (not b!58872) (not b!58867) (not b!58868) (not b!58869) (not b!58878) (not b!58875) (not start!11822) (not b!58879) (not b!58874) (not b!58876) (not b!58873))
