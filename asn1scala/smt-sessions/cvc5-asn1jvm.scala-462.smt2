; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!12882 () Bool)

(assert start!12882)

(declare-fun res!54838 () Bool)

(declare-fun e!43459 () Bool)

(assert (=> start!12882 (=> (not res!54838) (not e!43459))))

(declare-datatypes ((array!2848 0))(
  ( (array!2849 (arr!1877 (Array (_ BitVec 32) (_ BitVec 8))) (size!1313 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2848)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!12882 (= res!54838 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1313 srcBuffer!2))))))))

(assert (=> start!12882 e!43459))

(assert (=> start!12882 true))

(declare-fun array_inv!1189 (array!2848) Bool)

(assert (=> start!12882 (array_inv!1189 srcBuffer!2)))

(declare-datatypes ((BitStream!2260 0))(
  ( (BitStream!2261 (buf!1694 array!2848) (currentByte!3366 (_ BitVec 32)) (currentBit!3361 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2260)

(declare-fun e!43462 () Bool)

(declare-fun inv!12 (BitStream!2260) Bool)

(assert (=> start!12882 (and (inv!12 thiss!1379) e!43462)))

(declare-fun b!66144 () Bool)

(declare-fun e!43463 () Bool)

(declare-fun e!43457 () Bool)

(assert (=> b!66144 (= e!43463 e!43457)))

(declare-fun res!54846 () Bool)

(assert (=> b!66144 (=> res!54846 e!43457)))

(declare-datatypes ((Unit!4463 0))(
  ( (Unit!4464) )
))
(declare-datatypes ((tuple2!5856 0))(
  ( (tuple2!5857 (_1!3039 Unit!4463) (_2!3039 BitStream!2260)) )
))
(declare-fun lt!104935 () tuple2!5856)

(declare-fun lt!104927 () tuple2!5856)

(assert (=> b!66144 (= res!54846 (not (= (size!1313 (buf!1694 (_2!3039 lt!104935))) (size!1313 (buf!1694 (_2!3039 lt!104927))))))))

(declare-fun lt!104934 () (_ BitVec 64))

(declare-fun lt!104943 () (_ BitVec 64))

(assert (=> b!66144 (= lt!104934 (bvsub (bvsub lt!104943 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!104936 () (_ BitVec 64))

(assert (=> b!66144 (= lt!104943 (bvadd lt!104936 to!314))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!66144 (= lt!104936 (bitIndex!0 (size!1313 (buf!1694 (_2!3039 lt!104935))) (currentByte!3366 (_2!3039 lt!104935)) (currentBit!3361 (_2!3039 lt!104935))))))

(assert (=> b!66144 (= (size!1313 (buf!1694 (_2!3039 lt!104927))) (size!1313 (buf!1694 thiss!1379)))))

(declare-fun b!66145 () Bool)

(declare-fun res!54848 () Bool)

(assert (=> b!66145 (=> res!54848 e!43463)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!66145 (= res!54848 (not (invariant!0 (currentBit!3361 (_2!3039 lt!104927)) (currentByte!3366 (_2!3039 lt!104927)) (size!1313 (buf!1694 (_2!3039 lt!104927))))))))

(declare-fun b!66146 () Bool)

(declare-fun e!43456 () Bool)

(assert (=> b!66146 (= e!43456 e!43463)))

(declare-fun res!54851 () Bool)

(assert (=> b!66146 (=> res!54851 e!43463)))

(declare-fun lt!104925 () (_ BitVec 64))

(assert (=> b!66146 (= res!54851 (not (= lt!104934 (bvsub (bvadd lt!104925 to!314) i!635))))))

(assert (=> b!66146 (= lt!104934 (bitIndex!0 (size!1313 (buf!1694 (_2!3039 lt!104927))) (currentByte!3366 (_2!3039 lt!104927)) (currentBit!3361 (_2!3039 lt!104927))))))

(declare-fun b!66147 () Bool)

(declare-fun e!43451 () Bool)

(declare-fun e!43452 () Bool)

(assert (=> b!66147 (= e!43451 e!43452)))

(declare-fun res!54845 () Bool)

(assert (=> b!66147 (=> res!54845 e!43452)))

(declare-fun isPrefixOf!0 (BitStream!2260 BitStream!2260) Bool)

(assert (=> b!66147 (= res!54845 (not (isPrefixOf!0 thiss!1379 (_2!3039 lt!104935))))))

(declare-fun lt!104938 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!66147 (validate_offset_bits!1 ((_ sign_extend 32) (size!1313 (buf!1694 (_2!3039 lt!104935)))) ((_ sign_extend 32) (currentByte!3366 (_2!3039 lt!104935))) ((_ sign_extend 32) (currentBit!3361 (_2!3039 lt!104935))) lt!104938)))

(assert (=> b!66147 (= lt!104938 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!104937 () Unit!4463)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2260 BitStream!2260 (_ BitVec 64) (_ BitVec 64)) Unit!4463)

(assert (=> b!66147 (= lt!104937 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3039 lt!104935) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2260 (_ BitVec 8) (_ BitVec 32)) tuple2!5856)

(assert (=> b!66147 (= lt!104935 (appendBitFromByte!0 thiss!1379 (select (arr!1877 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!66148 () Bool)

(declare-fun e!43458 () Bool)

(declare-fun e!43461 () Bool)

(assert (=> b!66148 (= e!43458 e!43461)))

(declare-fun res!54847 () Bool)

(assert (=> b!66148 (=> res!54847 e!43461)))

(declare-datatypes ((List!705 0))(
  ( (Nil!702) (Cons!701 (h!820 Bool) (t!1455 List!705)) )
))
(declare-fun lt!104930 () List!705)

(declare-fun lt!104939 () List!705)

(assert (=> b!66148 (= res!54847 (not (= lt!104930 lt!104939)))))

(assert (=> b!66148 (= lt!104939 lt!104930)))

(declare-fun lt!104928 () List!705)

(declare-fun tail!309 (List!705) List!705)

(assert (=> b!66148 (= lt!104930 (tail!309 lt!104928))))

(declare-fun lt!104932 () Unit!4463)

(declare-datatypes ((tuple2!5858 0))(
  ( (tuple2!5859 (_1!3040 BitStream!2260) (_2!3040 BitStream!2260)) )
))
(declare-fun lt!104931 () tuple2!5858)

(declare-fun lt!104942 () tuple2!5858)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2260 BitStream!2260 BitStream!2260 BitStream!2260 (_ BitVec 64) List!705) Unit!4463)

(assert (=> b!66148 (= lt!104932 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3039 lt!104927) (_2!3039 lt!104927) (_1!3040 lt!104942) (_1!3040 lt!104931) (bvsub to!314 i!635) lt!104928))))

(declare-fun b!66149 () Bool)

(declare-fun res!54843 () Bool)

(assert (=> b!66149 (=> res!54843 e!43463)))

(assert (=> b!66149 (= res!54843 (not (= (size!1313 (buf!1694 thiss!1379)) (size!1313 (buf!1694 (_2!3039 lt!104927))))))))

(declare-fun b!66150 () Bool)

(declare-fun res!54839 () Bool)

(assert (=> b!66150 (=> res!54839 e!43457)))

(assert (=> b!66150 (= res!54839 (not (invariant!0 (currentBit!3361 (_2!3039 lt!104935)) (currentByte!3366 (_2!3039 lt!104935)) (size!1313 (buf!1694 (_2!3039 lt!104927))))))))

(declare-fun b!66151 () Bool)

(declare-fun e!43450 () Bool)

(declare-fun e!43454 () Bool)

(assert (=> b!66151 (= e!43450 e!43454)))

(declare-fun res!54841 () Bool)

(assert (=> b!66151 (=> res!54841 e!43454)))

(declare-fun lt!104944 () Bool)

(declare-fun head!524 (List!705) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2260 array!2848 (_ BitVec 64) (_ BitVec 64)) List!705)

(assert (=> b!66151 (= res!54841 (not (= (head!524 (byteArrayBitContentToList!0 (_2!3039 lt!104927) srcBuffer!2 i!635 (bvsub to!314 i!635))) lt!104944)))))

(declare-fun bitAt!0 (array!2848 (_ BitVec 64)) Bool)

(assert (=> b!66151 (= lt!104944 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun b!66152 () Bool)

(assert (=> b!66152 (= e!43457 e!43458)))

(declare-fun res!54854 () Bool)

(assert (=> b!66152 (=> res!54854 e!43458)))

(assert (=> b!66152 (= res!54854 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2260 BitStream!2260 (_ BitVec 64)) List!705)

(assert (=> b!66152 (= lt!104939 (bitStreamReadBitsIntoList!0 (_2!3039 lt!104927) (_1!3040 lt!104931) lt!104938))))

(assert (=> b!66152 (= lt!104928 (bitStreamReadBitsIntoList!0 (_2!3039 lt!104927) (_1!3040 lt!104942) (bvsub to!314 i!635)))))

(assert (=> b!66152 (validate_offset_bits!1 ((_ sign_extend 32) (size!1313 (buf!1694 (_2!3039 lt!104927)))) ((_ sign_extend 32) (currentByte!3366 (_2!3039 lt!104935))) ((_ sign_extend 32) (currentBit!3361 (_2!3039 lt!104935))) lt!104938)))

(declare-fun lt!104941 () Unit!4463)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2260 array!2848 (_ BitVec 64)) Unit!4463)

(assert (=> b!66152 (= lt!104941 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3039 lt!104935) (buf!1694 (_2!3039 lt!104927)) lt!104938))))

(declare-fun reader!0 (BitStream!2260 BitStream!2260) tuple2!5858)

(assert (=> b!66152 (= lt!104931 (reader!0 (_2!3039 lt!104935) (_2!3039 lt!104927)))))

(assert (=> b!66152 (validate_offset_bits!1 ((_ sign_extend 32) (size!1313 (buf!1694 (_2!3039 lt!104927)))) ((_ sign_extend 32) (currentByte!3366 thiss!1379)) ((_ sign_extend 32) (currentBit!3361 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!104924 () Unit!4463)

(assert (=> b!66152 (= lt!104924 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1694 (_2!3039 lt!104927)) (bvsub to!314 i!635)))))

(assert (=> b!66152 (= lt!104942 (reader!0 thiss!1379 (_2!3039 lt!104927)))))

(declare-fun b!66153 () Bool)

(declare-fun res!54853 () Bool)

(assert (=> b!66153 (=> res!54853 e!43458)))

(declare-fun length!333 (List!705) Int)

(assert (=> b!66153 (= res!54853 (<= (length!333 lt!104928) 0))))

(declare-fun b!66154 () Bool)

(assert (=> b!66154 (= e!43452 e!43456)))

(declare-fun res!54840 () Bool)

(assert (=> b!66154 (=> res!54840 e!43456)))

(assert (=> b!66154 (= res!54840 (not (isPrefixOf!0 (_2!3039 lt!104935) (_2!3039 lt!104927))))))

(assert (=> b!66154 (isPrefixOf!0 thiss!1379 (_2!3039 lt!104927))))

(declare-fun lt!104923 () Unit!4463)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2260 BitStream!2260 BitStream!2260) Unit!4463)

(assert (=> b!66154 (= lt!104923 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3039 lt!104935) (_2!3039 lt!104927)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2260 array!2848 (_ BitVec 64) (_ BitVec 64)) tuple2!5856)

(assert (=> b!66154 (= lt!104927 (appendBitsMSBFirstLoop!0 (_2!3039 lt!104935) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!43455 () Bool)

(assert (=> b!66154 e!43455))

(declare-fun res!54855 () Bool)

(assert (=> b!66154 (=> (not res!54855) (not e!43455))))

(assert (=> b!66154 (= res!54855 (validate_offset_bits!1 ((_ sign_extend 32) (size!1313 (buf!1694 (_2!3039 lt!104935)))) ((_ sign_extend 32) (currentByte!3366 thiss!1379)) ((_ sign_extend 32) (currentBit!3361 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!104929 () Unit!4463)

(assert (=> b!66154 (= lt!104929 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1694 (_2!3039 lt!104935)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!104922 () tuple2!5858)

(assert (=> b!66154 (= lt!104922 (reader!0 thiss!1379 (_2!3039 lt!104935)))))

(declare-fun lt!104926 () (_ BitVec 64))

(declare-fun b!66155 () Bool)

(assert (=> b!66155 (= e!43454 (or (not (= lt!104926 (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!104926 (bvand lt!104943 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!66155 (= lt!104926 (bvand lt!104936 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!66156 () Bool)

(declare-fun res!54850 () Bool)

(assert (=> b!66156 (=> res!54850 e!43450)))

(declare-fun lt!104933 () Bool)

(assert (=> b!66156 (= res!54850 (not (= (head!524 lt!104928) lt!104933)))))

(declare-fun b!66157 () Bool)

(declare-fun res!54852 () Bool)

(assert (=> b!66157 (=> (not res!54852) (not e!43459))))

(assert (=> b!66157 (= res!54852 (validate_offset_bits!1 ((_ sign_extend 32) (size!1313 (buf!1694 thiss!1379))) ((_ sign_extend 32) (currentByte!3366 thiss!1379)) ((_ sign_extend 32) (currentBit!3361 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!66158 () Bool)

(declare-fun res!54842 () Bool)

(assert (=> b!66158 (=> res!54842 e!43454)))

(assert (=> b!66158 (= res!54842 (not (= (bitAt!0 (buf!1694 (_2!3039 lt!104935)) lt!104925) lt!104944)))))

(declare-fun b!66159 () Bool)

(assert (=> b!66159 (= e!43459 (not e!43451))))

(declare-fun res!54844 () Bool)

(assert (=> b!66159 (=> res!54844 e!43451)))

(assert (=> b!66159 (= res!54844 (bvsge i!635 to!314))))

(assert (=> b!66159 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!104940 () Unit!4463)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2260) Unit!4463)

(assert (=> b!66159 (= lt!104940 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!66159 (= lt!104925 (bitIndex!0 (size!1313 (buf!1694 thiss!1379)) (currentByte!3366 thiss!1379) (currentBit!3361 thiss!1379)))))

(declare-fun b!66160 () Bool)

(assert (=> b!66160 (= e!43462 (array_inv!1189 (buf!1694 thiss!1379)))))

(declare-fun b!66161 () Bool)

(declare-fun res!54849 () Bool)

(assert (=> b!66161 (=> res!54849 e!43457)))

(assert (=> b!66161 (= res!54849 (not (invariant!0 (currentBit!3361 (_2!3039 lt!104935)) (currentByte!3366 (_2!3039 lt!104935)) (size!1313 (buf!1694 (_2!3039 lt!104935))))))))

(declare-fun b!66162 () Bool)

(assert (=> b!66162 (= e!43461 e!43450)))

(declare-fun res!54837 () Bool)

(assert (=> b!66162 (=> res!54837 e!43450)))

(assert (=> b!66162 (= res!54837 (not (= lt!104933 (bitAt!0 (buf!1694 (_1!3040 lt!104931)) lt!104925))))))

(assert (=> b!66162 (= lt!104933 (bitAt!0 (buf!1694 (_1!3040 lt!104942)) lt!104925))))

(declare-fun b!66163 () Bool)

(assert (=> b!66163 (= e!43455 (= (head!524 (byteArrayBitContentToList!0 (_2!3039 lt!104935) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!524 (bitStreamReadBitsIntoList!0 (_2!3039 lt!104935) (_1!3040 lt!104922) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and start!12882 res!54838) b!66157))

(assert (= (and b!66157 res!54852) b!66159))

(assert (= (and b!66159 (not res!54844)) b!66147))

(assert (= (and b!66147 (not res!54845)) b!66154))

(assert (= (and b!66154 res!54855) b!66163))

(assert (= (and b!66154 (not res!54840)) b!66146))

(assert (= (and b!66146 (not res!54851)) b!66145))

(assert (= (and b!66145 (not res!54848)) b!66149))

(assert (= (and b!66149 (not res!54843)) b!66144))

(assert (= (and b!66144 (not res!54846)) b!66161))

(assert (= (and b!66161 (not res!54849)) b!66150))

(assert (= (and b!66150 (not res!54839)) b!66152))

(assert (= (and b!66152 (not res!54854)) b!66153))

(assert (= (and b!66153 (not res!54853)) b!66148))

(assert (= (and b!66148 (not res!54847)) b!66162))

(assert (= (and b!66162 (not res!54837)) b!66156))

(assert (= (and b!66156 (not res!54850)) b!66151))

(assert (= (and b!66151 (not res!54841)) b!66158))

(assert (= (and b!66158 (not res!54842)) b!66155))

(assert (= start!12882 b!66160))

(declare-fun m!105073 () Bool)

(assert (=> b!66162 m!105073))

(declare-fun m!105075 () Bool)

(assert (=> b!66162 m!105075))

(declare-fun m!105077 () Bool)

(assert (=> b!66147 m!105077))

(declare-fun m!105079 () Bool)

(assert (=> b!66147 m!105079))

(declare-fun m!105081 () Bool)

(assert (=> b!66147 m!105081))

(assert (=> b!66147 m!105077))

(declare-fun m!105083 () Bool)

(assert (=> b!66147 m!105083))

(declare-fun m!105085 () Bool)

(assert (=> b!66147 m!105085))

(declare-fun m!105087 () Bool)

(assert (=> b!66152 m!105087))

(declare-fun m!105089 () Bool)

(assert (=> b!66152 m!105089))

(declare-fun m!105091 () Bool)

(assert (=> b!66152 m!105091))

(declare-fun m!105093 () Bool)

(assert (=> b!66152 m!105093))

(declare-fun m!105095 () Bool)

(assert (=> b!66152 m!105095))

(declare-fun m!105097 () Bool)

(assert (=> b!66152 m!105097))

(declare-fun m!105099 () Bool)

(assert (=> b!66152 m!105099))

(declare-fun m!105101 () Bool)

(assert (=> b!66152 m!105101))

(declare-fun m!105103 () Bool)

(assert (=> b!66158 m!105103))

(declare-fun m!105105 () Bool)

(assert (=> b!66154 m!105105))

(declare-fun m!105107 () Bool)

(assert (=> b!66154 m!105107))

(declare-fun m!105109 () Bool)

(assert (=> b!66154 m!105109))

(declare-fun m!105111 () Bool)

(assert (=> b!66154 m!105111))

(declare-fun m!105113 () Bool)

(assert (=> b!66154 m!105113))

(declare-fun m!105115 () Bool)

(assert (=> b!66154 m!105115))

(declare-fun m!105117 () Bool)

(assert (=> b!66154 m!105117))

(declare-fun m!105119 () Bool)

(assert (=> b!66163 m!105119))

(assert (=> b!66163 m!105119))

(declare-fun m!105121 () Bool)

(assert (=> b!66163 m!105121))

(declare-fun m!105123 () Bool)

(assert (=> b!66163 m!105123))

(assert (=> b!66163 m!105123))

(declare-fun m!105125 () Bool)

(assert (=> b!66163 m!105125))

(declare-fun m!105127 () Bool)

(assert (=> b!66153 m!105127))

(declare-fun m!105129 () Bool)

(assert (=> b!66145 m!105129))

(declare-fun m!105131 () Bool)

(assert (=> b!66150 m!105131))

(declare-fun m!105133 () Bool)

(assert (=> start!12882 m!105133))

(declare-fun m!105135 () Bool)

(assert (=> start!12882 m!105135))

(declare-fun m!105137 () Bool)

(assert (=> b!66151 m!105137))

(assert (=> b!66151 m!105137))

(declare-fun m!105139 () Bool)

(assert (=> b!66151 m!105139))

(declare-fun m!105141 () Bool)

(assert (=> b!66151 m!105141))

(declare-fun m!105143 () Bool)

(assert (=> b!66156 m!105143))

(declare-fun m!105145 () Bool)

(assert (=> b!66157 m!105145))

(declare-fun m!105147 () Bool)

(assert (=> b!66146 m!105147))

(declare-fun m!105149 () Bool)

(assert (=> b!66161 m!105149))

(declare-fun m!105151 () Bool)

(assert (=> b!66148 m!105151))

(declare-fun m!105153 () Bool)

(assert (=> b!66148 m!105153))

(declare-fun m!105155 () Bool)

(assert (=> b!66160 m!105155))

(declare-fun m!105157 () Bool)

(assert (=> b!66144 m!105157))

(declare-fun m!105159 () Bool)

(assert (=> b!66159 m!105159))

(declare-fun m!105161 () Bool)

(assert (=> b!66159 m!105161))

(declare-fun m!105163 () Bool)

(assert (=> b!66159 m!105163))

(push 1)

(assert (not b!66162))

(assert (not b!66146))

(assert (not b!66147))

(assert (not b!66156))

(assert (not start!12882))

(assert (not b!66150))

(assert (not b!66148))

(assert (not b!66152))

(assert (not b!66144))

(assert (not b!66154))

(assert (not b!66161))

(assert (not b!66163))

(assert (not b!66157))

(assert (not b!66159))

(assert (not b!66153))

(assert (not b!66151))

(assert (not b!66145))

(assert (not b!66160))

(assert (not b!66158))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!66368 () Bool)

(declare-fun res!55019 () Bool)

(declare-fun e!43590 () Bool)

(assert (=> b!66368 (=> (not res!55019) (not e!43590))))

(declare-fun lt!105291 () tuple2!5858)

(assert (=> b!66368 (= res!55019 (isPrefixOf!0 (_2!3040 lt!105291) (_2!3039 lt!104927)))))

(declare-fun d!20808 () Bool)

(assert (=> d!20808 e!43590))

(declare-fun res!55020 () Bool)

(assert (=> d!20808 (=> (not res!55020) (not e!43590))))

(assert (=> d!20808 (= res!55020 (isPrefixOf!0 (_1!3040 lt!105291) (_2!3040 lt!105291)))))

(declare-fun lt!105290 () BitStream!2260)

(assert (=> d!20808 (= lt!105291 (tuple2!5859 lt!105290 (_2!3039 lt!104927)))))

(declare-fun lt!105302 () Unit!4463)

(declare-fun lt!105293 () Unit!4463)

(assert (=> d!20808 (= lt!105302 lt!105293)))

(assert (=> d!20808 (isPrefixOf!0 lt!105290 (_2!3039 lt!104927))))

(assert (=> d!20808 (= lt!105293 (lemmaIsPrefixTransitive!0 lt!105290 (_2!3039 lt!104927) (_2!3039 lt!104927)))))

(declare-fun lt!105306 () Unit!4463)

(declare-fun lt!105295 () Unit!4463)

(assert (=> d!20808 (= lt!105306 lt!105295)))

(assert (=> d!20808 (isPrefixOf!0 lt!105290 (_2!3039 lt!104927))))

(assert (=> d!20808 (= lt!105295 (lemmaIsPrefixTransitive!0 lt!105290 (_2!3039 lt!104935) (_2!3039 lt!104927)))))

(declare-fun lt!105304 () Unit!4463)

(declare-fun e!43591 () Unit!4463)

(assert (=> d!20808 (= lt!105304 e!43591)))

(declare-fun c!4813 () Bool)

(assert (=> d!20808 (= c!4813 (not (= (size!1313 (buf!1694 (_2!3039 lt!104935))) #b00000000000000000000000000000000)))))

(declare-fun lt!105300 () Unit!4463)

(declare-fun lt!105288 () Unit!4463)

(assert (=> d!20808 (= lt!105300 lt!105288)))

(assert (=> d!20808 (isPrefixOf!0 (_2!3039 lt!104927) (_2!3039 lt!104927))))

(assert (=> d!20808 (= lt!105288 (lemmaIsPrefixRefl!0 (_2!3039 lt!104927)))))

(declare-fun lt!105294 () Unit!4463)

(declare-fun lt!105292 () Unit!4463)

(assert (=> d!20808 (= lt!105294 lt!105292)))

(assert (=> d!20808 (= lt!105292 (lemmaIsPrefixRefl!0 (_2!3039 lt!104927)))))

(declare-fun lt!105305 () Unit!4463)

(declare-fun lt!105298 () Unit!4463)

(assert (=> d!20808 (= lt!105305 lt!105298)))

(assert (=> d!20808 (isPrefixOf!0 lt!105290 lt!105290)))

(assert (=> d!20808 (= lt!105298 (lemmaIsPrefixRefl!0 lt!105290))))

(declare-fun lt!105303 () Unit!4463)

(declare-fun lt!105301 () Unit!4463)

(assert (=> d!20808 (= lt!105303 lt!105301)))

(assert (=> d!20808 (isPrefixOf!0 (_2!3039 lt!104935) (_2!3039 lt!104935))))

(assert (=> d!20808 (= lt!105301 (lemmaIsPrefixRefl!0 (_2!3039 lt!104935)))))

(assert (=> d!20808 (= lt!105290 (BitStream!2261 (buf!1694 (_2!3039 lt!104927)) (currentByte!3366 (_2!3039 lt!104935)) (currentBit!3361 (_2!3039 lt!104935))))))

(assert (=> d!20808 (isPrefixOf!0 (_2!3039 lt!104935) (_2!3039 lt!104927))))

(assert (=> d!20808 (= (reader!0 (_2!3039 lt!104935) (_2!3039 lt!104927)) lt!105291)))

(declare-fun b!66369 () Bool)

(declare-fun lt!105299 () Unit!4463)

(assert (=> b!66369 (= e!43591 lt!105299)))

(declare-fun lt!105289 () (_ BitVec 64))

(assert (=> b!66369 (= lt!105289 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!105297 () (_ BitVec 64))

(assert (=> b!66369 (= lt!105297 (bitIndex!0 (size!1313 (buf!1694 (_2!3039 lt!104935))) (currentByte!3366 (_2!3039 lt!104935)) (currentBit!3361 (_2!3039 lt!104935))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2848 array!2848 (_ BitVec 64) (_ BitVec 64)) Unit!4463)

(assert (=> b!66369 (= lt!105299 (arrayBitRangesEqSymmetric!0 (buf!1694 (_2!3039 lt!104935)) (buf!1694 (_2!3039 lt!104927)) lt!105289 lt!105297))))

(declare-fun arrayBitRangesEq!0 (array!2848 array!2848 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!66369 (arrayBitRangesEq!0 (buf!1694 (_2!3039 lt!104927)) (buf!1694 (_2!3039 lt!104935)) lt!105289 lt!105297)))

(declare-fun b!66370 () Bool)

(declare-fun res!55018 () Bool)

(assert (=> b!66370 (=> (not res!55018) (not e!43590))))

(assert (=> b!66370 (= res!55018 (isPrefixOf!0 (_1!3040 lt!105291) (_2!3039 lt!104935)))))

(declare-fun b!66371 () Bool)

(declare-fun Unit!4479 () Unit!4463)

(assert (=> b!66371 (= e!43591 Unit!4479)))

(declare-fun b!66372 () Bool)

(declare-fun lt!105296 () (_ BitVec 64))

(declare-fun lt!105307 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!2260 (_ BitVec 64)) BitStream!2260)

(assert (=> b!66372 (= e!43590 (= (_1!3040 lt!105291) (withMovedBitIndex!0 (_2!3040 lt!105291) (bvsub lt!105296 lt!105307))))))

(assert (=> b!66372 (or (= (bvand lt!105296 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!105307 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!105296 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!105296 lt!105307) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!66372 (= lt!105307 (bitIndex!0 (size!1313 (buf!1694 (_2!3039 lt!104927))) (currentByte!3366 (_2!3039 lt!104927)) (currentBit!3361 (_2!3039 lt!104927))))))

(assert (=> b!66372 (= lt!105296 (bitIndex!0 (size!1313 (buf!1694 (_2!3039 lt!104935))) (currentByte!3366 (_2!3039 lt!104935)) (currentBit!3361 (_2!3039 lt!104935))))))

(assert (= (and d!20808 c!4813) b!66369))

(assert (= (and d!20808 (not c!4813)) b!66371))

(assert (= (and d!20808 res!55020) b!66370))

(assert (= (and b!66370 res!55018) b!66368))

(assert (= (and b!66368 res!55019) b!66372))

(declare-fun m!105481 () Bool)

(assert (=> b!66368 m!105481))

(declare-fun m!105483 () Bool)

(assert (=> b!66370 m!105483))

(declare-fun m!105485 () Bool)

(assert (=> d!20808 m!105485))

(declare-fun m!105487 () Bool)

(assert (=> d!20808 m!105487))

(declare-fun m!105489 () Bool)

(assert (=> d!20808 m!105489))

(declare-fun m!105491 () Bool)

(assert (=> d!20808 m!105491))

(assert (=> d!20808 m!105105))

(declare-fun m!105493 () Bool)

(assert (=> d!20808 m!105493))

(declare-fun m!105495 () Bool)

(assert (=> d!20808 m!105495))

(declare-fun m!105497 () Bool)

(assert (=> d!20808 m!105497))

(declare-fun m!105499 () Bool)

(assert (=> d!20808 m!105499))

(declare-fun m!105501 () Bool)

(assert (=> d!20808 m!105501))

(declare-fun m!105503 () Bool)

(assert (=> d!20808 m!105503))

(assert (=> b!66369 m!105157))

(declare-fun m!105505 () Bool)

(assert (=> b!66369 m!105505))

(declare-fun m!105507 () Bool)

(assert (=> b!66369 m!105507))

(declare-fun m!105509 () Bool)

(assert (=> b!66372 m!105509))

(assert (=> b!66372 m!105147))

(assert (=> b!66372 m!105157))

(assert (=> b!66152 d!20808))

(declare-fun d!20822 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!20822 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1313 (buf!1694 (_2!3039 lt!104927)))) ((_ sign_extend 32) (currentByte!3366 thiss!1379)) ((_ sign_extend 32) (currentBit!3361 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1313 (buf!1694 (_2!3039 lt!104927)))) ((_ sign_extend 32) (currentByte!3366 thiss!1379)) ((_ sign_extend 32) (currentBit!3361 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5068 () Bool)

(assert (= bs!5068 d!20822))

(declare-fun m!105511 () Bool)

(assert (=> bs!5068 m!105511))

(assert (=> b!66152 d!20822))

(declare-fun b!66373 () Bool)

(declare-fun res!55022 () Bool)

(declare-fun e!43592 () Bool)

(assert (=> b!66373 (=> (not res!55022) (not e!43592))))

(declare-fun lt!105311 () tuple2!5858)

(assert (=> b!66373 (= res!55022 (isPrefixOf!0 (_2!3040 lt!105311) (_2!3039 lt!104927)))))

(declare-fun d!20824 () Bool)

(assert (=> d!20824 e!43592))

(declare-fun res!55023 () Bool)

(assert (=> d!20824 (=> (not res!55023) (not e!43592))))

(assert (=> d!20824 (= res!55023 (isPrefixOf!0 (_1!3040 lt!105311) (_2!3040 lt!105311)))))

(declare-fun lt!105310 () BitStream!2260)

(assert (=> d!20824 (= lt!105311 (tuple2!5859 lt!105310 (_2!3039 lt!104927)))))

(declare-fun lt!105322 () Unit!4463)

(declare-fun lt!105313 () Unit!4463)

(assert (=> d!20824 (= lt!105322 lt!105313)))

(assert (=> d!20824 (isPrefixOf!0 lt!105310 (_2!3039 lt!104927))))

(assert (=> d!20824 (= lt!105313 (lemmaIsPrefixTransitive!0 lt!105310 (_2!3039 lt!104927) (_2!3039 lt!104927)))))

(declare-fun lt!105326 () Unit!4463)

(declare-fun lt!105315 () Unit!4463)

(assert (=> d!20824 (= lt!105326 lt!105315)))

(assert (=> d!20824 (isPrefixOf!0 lt!105310 (_2!3039 lt!104927))))

(assert (=> d!20824 (= lt!105315 (lemmaIsPrefixTransitive!0 lt!105310 thiss!1379 (_2!3039 lt!104927)))))

(declare-fun lt!105324 () Unit!4463)

(declare-fun e!43593 () Unit!4463)

(assert (=> d!20824 (= lt!105324 e!43593)))

(declare-fun c!4814 () Bool)

(assert (=> d!20824 (= c!4814 (not (= (size!1313 (buf!1694 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!105320 () Unit!4463)

(declare-fun lt!105308 () Unit!4463)

(assert (=> d!20824 (= lt!105320 lt!105308)))

(assert (=> d!20824 (isPrefixOf!0 (_2!3039 lt!104927) (_2!3039 lt!104927))))

(assert (=> d!20824 (= lt!105308 (lemmaIsPrefixRefl!0 (_2!3039 lt!104927)))))

(declare-fun lt!105314 () Unit!4463)

(declare-fun lt!105312 () Unit!4463)

(assert (=> d!20824 (= lt!105314 lt!105312)))

(assert (=> d!20824 (= lt!105312 (lemmaIsPrefixRefl!0 (_2!3039 lt!104927)))))

(declare-fun lt!105325 () Unit!4463)

(declare-fun lt!105318 () Unit!4463)

(assert (=> d!20824 (= lt!105325 lt!105318)))

(assert (=> d!20824 (isPrefixOf!0 lt!105310 lt!105310)))

(assert (=> d!20824 (= lt!105318 (lemmaIsPrefixRefl!0 lt!105310))))

(declare-fun lt!105323 () Unit!4463)

(declare-fun lt!105321 () Unit!4463)

(assert (=> d!20824 (= lt!105323 lt!105321)))

(assert (=> d!20824 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!20824 (= lt!105321 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!20824 (= lt!105310 (BitStream!2261 (buf!1694 (_2!3039 lt!104927)) (currentByte!3366 thiss!1379) (currentBit!3361 thiss!1379)))))

(assert (=> d!20824 (isPrefixOf!0 thiss!1379 (_2!3039 lt!104927))))

(assert (=> d!20824 (= (reader!0 thiss!1379 (_2!3039 lt!104927)) lt!105311)))

(declare-fun b!66374 () Bool)

(declare-fun lt!105319 () Unit!4463)

(assert (=> b!66374 (= e!43593 lt!105319)))

(declare-fun lt!105309 () (_ BitVec 64))

(assert (=> b!66374 (= lt!105309 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!105317 () (_ BitVec 64))

(assert (=> b!66374 (= lt!105317 (bitIndex!0 (size!1313 (buf!1694 thiss!1379)) (currentByte!3366 thiss!1379) (currentBit!3361 thiss!1379)))))

(assert (=> b!66374 (= lt!105319 (arrayBitRangesEqSymmetric!0 (buf!1694 thiss!1379) (buf!1694 (_2!3039 lt!104927)) lt!105309 lt!105317))))

(assert (=> b!66374 (arrayBitRangesEq!0 (buf!1694 (_2!3039 lt!104927)) (buf!1694 thiss!1379) lt!105309 lt!105317)))

(declare-fun b!66375 () Bool)

(declare-fun res!55021 () Bool)

(assert (=> b!66375 (=> (not res!55021) (not e!43592))))

(assert (=> b!66375 (= res!55021 (isPrefixOf!0 (_1!3040 lt!105311) thiss!1379))))

(declare-fun b!66376 () Bool)

(declare-fun Unit!4480 () Unit!4463)

(assert (=> b!66376 (= e!43593 Unit!4480)))

(declare-fun b!66377 () Bool)

(declare-fun lt!105327 () (_ BitVec 64))

(declare-fun lt!105316 () (_ BitVec 64))

(assert (=> b!66377 (= e!43592 (= (_1!3040 lt!105311) (withMovedBitIndex!0 (_2!3040 lt!105311) (bvsub lt!105316 lt!105327))))))

(assert (=> b!66377 (or (= (bvand lt!105316 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!105327 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!105316 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!105316 lt!105327) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!66377 (= lt!105327 (bitIndex!0 (size!1313 (buf!1694 (_2!3039 lt!104927))) (currentByte!3366 (_2!3039 lt!104927)) (currentBit!3361 (_2!3039 lt!104927))))))

(assert (=> b!66377 (= lt!105316 (bitIndex!0 (size!1313 (buf!1694 thiss!1379)) (currentByte!3366 thiss!1379) (currentBit!3361 thiss!1379)))))

(assert (= (and d!20824 c!4814) b!66374))

(assert (= (and d!20824 (not c!4814)) b!66376))

(assert (= (and d!20824 res!55023) b!66375))

(assert (= (and b!66375 res!55021) b!66373))

(assert (= (and b!66373 res!55022) b!66377))

(declare-fun m!105513 () Bool)

(assert (=> b!66373 m!105513))

(declare-fun m!105515 () Bool)

(assert (=> b!66375 m!105515))

(assert (=> d!20824 m!105485))

(assert (=> d!20824 m!105161))

(declare-fun m!105517 () Bool)

(assert (=> d!20824 m!105517))

(declare-fun m!105519 () Bool)

(assert (=> d!20824 m!105519))

(assert (=> d!20824 m!105107))

(declare-fun m!105521 () Bool)

(assert (=> d!20824 m!105521))

(assert (=> d!20824 m!105159))

(declare-fun m!105523 () Bool)

(assert (=> d!20824 m!105523))

(declare-fun m!105525 () Bool)

(assert (=> d!20824 m!105525))

(declare-fun m!105527 () Bool)

(assert (=> d!20824 m!105527))

(assert (=> d!20824 m!105503))

(assert (=> b!66374 m!105163))

(declare-fun m!105529 () Bool)

(assert (=> b!66374 m!105529))

(declare-fun m!105531 () Bool)

(assert (=> b!66374 m!105531))

(declare-fun m!105533 () Bool)

(assert (=> b!66377 m!105533))

(assert (=> b!66377 m!105147))

(assert (=> b!66377 m!105163))

(assert (=> b!66152 d!20824))

(declare-datatypes ((tuple2!5876 0))(
  ( (tuple2!5877 (_1!3049 List!705) (_2!3049 BitStream!2260)) )
))
(declare-fun e!43599 () tuple2!5876)

(declare-fun b!66387 () Bool)

(declare-datatypes ((tuple2!5878 0))(
  ( (tuple2!5879 (_1!3050 Bool) (_2!3050 BitStream!2260)) )
))
(declare-fun lt!105334 () tuple2!5878)

(declare-fun lt!105335 () (_ BitVec 64))

(assert (=> b!66387 (= e!43599 (tuple2!5877 (Cons!701 (_1!3050 lt!105334) (bitStreamReadBitsIntoList!0 (_2!3039 lt!104927) (_2!3050 lt!105334) (bvsub lt!104938 lt!105335))) (_2!3050 lt!105334)))))

(declare-fun readBit!0 (BitStream!2260) tuple2!5878)

(assert (=> b!66387 (= lt!105334 (readBit!0 (_1!3040 lt!104931)))))

(assert (=> b!66387 (= lt!105335 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!66388 () Bool)

(declare-fun e!43598 () Bool)

(declare-fun lt!105336 () List!705)

(declare-fun isEmpty!208 (List!705) Bool)

(assert (=> b!66388 (= e!43598 (isEmpty!208 lt!105336))))

(declare-fun b!66386 () Bool)

(assert (=> b!66386 (= e!43599 (tuple2!5877 Nil!702 (_1!3040 lt!104931)))))

(declare-fun b!66389 () Bool)

(assert (=> b!66389 (= e!43598 (> (length!333 lt!105336) 0))))

(declare-fun d!20826 () Bool)

(assert (=> d!20826 e!43598))

(declare-fun c!4820 () Bool)

(assert (=> d!20826 (= c!4820 (= lt!104938 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!20826 (= lt!105336 (_1!3049 e!43599))))

(declare-fun c!4819 () Bool)

(assert (=> d!20826 (= c!4819 (= lt!104938 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!20826 (bvsge lt!104938 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!20826 (= (bitStreamReadBitsIntoList!0 (_2!3039 lt!104927) (_1!3040 lt!104931) lt!104938) lt!105336)))

(assert (= (and d!20826 c!4819) b!66386))

(assert (= (and d!20826 (not c!4819)) b!66387))

(assert (= (and d!20826 c!4820) b!66388))

(assert (= (and d!20826 (not c!4820)) b!66389))

(declare-fun m!105535 () Bool)

(assert (=> b!66387 m!105535))

(declare-fun m!105537 () Bool)

(assert (=> b!66387 m!105537))

(declare-fun m!105539 () Bool)

(assert (=> b!66388 m!105539))

(declare-fun m!105541 () Bool)

(assert (=> b!66389 m!105541))

(assert (=> b!66152 d!20826))

(declare-fun e!43601 () tuple2!5876)

(declare-fun b!66391 () Bool)

(declare-fun lt!105338 () (_ BitVec 64))

(declare-fun lt!105337 () tuple2!5878)

(assert (=> b!66391 (= e!43601 (tuple2!5877 (Cons!701 (_1!3050 lt!105337) (bitStreamReadBitsIntoList!0 (_2!3039 lt!104927) (_2!3050 lt!105337) (bvsub (bvsub to!314 i!635) lt!105338))) (_2!3050 lt!105337)))))

(assert (=> b!66391 (= lt!105337 (readBit!0 (_1!3040 lt!104942)))))

(assert (=> b!66391 (= lt!105338 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!66392 () Bool)

(declare-fun e!43600 () Bool)

(declare-fun lt!105339 () List!705)

(assert (=> b!66392 (= e!43600 (isEmpty!208 lt!105339))))

(declare-fun b!66390 () Bool)

(assert (=> b!66390 (= e!43601 (tuple2!5877 Nil!702 (_1!3040 lt!104942)))))

(declare-fun b!66393 () Bool)

(assert (=> b!66393 (= e!43600 (> (length!333 lt!105339) 0))))

(declare-fun d!20828 () Bool)

(assert (=> d!20828 e!43600))

(declare-fun c!4822 () Bool)

(assert (=> d!20828 (= c!4822 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!20828 (= lt!105339 (_1!3049 e!43601))))

(declare-fun c!4821 () Bool)

(assert (=> d!20828 (= c!4821 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!20828 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!20828 (= (bitStreamReadBitsIntoList!0 (_2!3039 lt!104927) (_1!3040 lt!104942) (bvsub to!314 i!635)) lt!105339)))

(assert (= (and d!20828 c!4821) b!66390))

(assert (= (and d!20828 (not c!4821)) b!66391))

(assert (= (and d!20828 c!4822) b!66392))

(assert (= (and d!20828 (not c!4822)) b!66393))

(declare-fun m!105543 () Bool)

(assert (=> b!66391 m!105543))

(declare-fun m!105545 () Bool)

(assert (=> b!66391 m!105545))

(declare-fun m!105547 () Bool)

(assert (=> b!66392 m!105547))

(declare-fun m!105549 () Bool)

(assert (=> b!66393 m!105549))

(assert (=> b!66152 d!20828))

(declare-fun d!20830 () Bool)

(assert (=> d!20830 (validate_offset_bits!1 ((_ sign_extend 32) (size!1313 (buf!1694 (_2!3039 lt!104927)))) ((_ sign_extend 32) (currentByte!3366 (_2!3039 lt!104935))) ((_ sign_extend 32) (currentBit!3361 (_2!3039 lt!104935))) lt!104938)))

(declare-fun lt!105342 () Unit!4463)

(declare-fun choose!9 (BitStream!2260 array!2848 (_ BitVec 64) BitStream!2260) Unit!4463)

(assert (=> d!20830 (= lt!105342 (choose!9 (_2!3039 lt!104935) (buf!1694 (_2!3039 lt!104927)) lt!104938 (BitStream!2261 (buf!1694 (_2!3039 lt!104927)) (currentByte!3366 (_2!3039 lt!104935)) (currentBit!3361 (_2!3039 lt!104935)))))))

(assert (=> d!20830 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3039 lt!104935) (buf!1694 (_2!3039 lt!104927)) lt!104938) lt!105342)))

(declare-fun bs!5069 () Bool)

(assert (= bs!5069 d!20830))

(assert (=> bs!5069 m!105087))

(declare-fun m!105551 () Bool)

(assert (=> bs!5069 m!105551))

(assert (=> b!66152 d!20830))

(declare-fun d!20832 () Bool)

(assert (=> d!20832 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1313 (buf!1694 (_2!3039 lt!104927)))) ((_ sign_extend 32) (currentByte!3366 (_2!3039 lt!104935))) ((_ sign_extend 32) (currentBit!3361 (_2!3039 lt!104935))) lt!104938) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1313 (buf!1694 (_2!3039 lt!104927)))) ((_ sign_extend 32) (currentByte!3366 (_2!3039 lt!104935))) ((_ sign_extend 32) (currentBit!3361 (_2!3039 lt!104935)))) lt!104938))))

(declare-fun bs!5070 () Bool)

(assert (= bs!5070 d!20832))

(declare-fun m!105553 () Bool)

(assert (=> bs!5070 m!105553))

(assert (=> b!66152 d!20832))

(declare-fun d!20834 () Bool)

(assert (=> d!20834 (validate_offset_bits!1 ((_ sign_extend 32) (size!1313 (buf!1694 (_2!3039 lt!104927)))) ((_ sign_extend 32) (currentByte!3366 thiss!1379)) ((_ sign_extend 32) (currentBit!3361 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!105343 () Unit!4463)

(assert (=> d!20834 (= lt!105343 (choose!9 thiss!1379 (buf!1694 (_2!3039 lt!104927)) (bvsub to!314 i!635) (BitStream!2261 (buf!1694 (_2!3039 lt!104927)) (currentByte!3366 thiss!1379) (currentBit!3361 thiss!1379))))))

(assert (=> d!20834 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1694 (_2!3039 lt!104927)) (bvsub to!314 i!635)) lt!105343)))

(declare-fun bs!5071 () Bool)

(assert (= bs!5071 d!20834))

(assert (=> bs!5071 m!105091))

(declare-fun m!105555 () Bool)

(assert (=> bs!5071 m!105555))

(assert (=> b!66152 d!20834))

(declare-fun d!20836 () Bool)

(assert (=> d!20836 (= (head!524 (byteArrayBitContentToList!0 (_2!3039 lt!104935) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!820 (byteArrayBitContentToList!0 (_2!3039 lt!104935) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!66163 d!20836))

(declare-fun d!20838 () Bool)

(declare-fun c!4827 () Bool)

(assert (=> d!20838 (= c!4827 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!43608 () List!705)

(assert (=> d!20838 (= (byteArrayBitContentToList!0 (_2!3039 lt!104935) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!43608)))

(declare-fun b!66408 () Bool)

(assert (=> b!66408 (= e!43608 Nil!702)))

(declare-fun b!66409 () Bool)

(assert (=> b!66409 (= e!43608 (Cons!701 (not (= (bvand ((_ sign_extend 24) (select (arr!1877 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!3039 lt!104935) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!20838 c!4827) b!66408))

(assert (= (and d!20838 (not c!4827)) b!66409))

(assert (=> b!66409 m!105077))

(declare-fun m!105557 () Bool)

(assert (=> b!66409 m!105557))

(declare-fun m!105559 () Bool)

(assert (=> b!66409 m!105559))

(assert (=> b!66163 d!20838))

(declare-fun d!20840 () Bool)

(assert (=> d!20840 (= (head!524 (bitStreamReadBitsIntoList!0 (_2!3039 lt!104935) (_1!3040 lt!104922) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!820 (bitStreamReadBitsIntoList!0 (_2!3039 lt!104935) (_1!3040 lt!104922) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!66163 d!20840))

(declare-fun lt!105384 () tuple2!5878)

(declare-fun lt!105385 () (_ BitVec 64))

(declare-fun e!43610 () tuple2!5876)

(declare-fun b!66411 () Bool)

(assert (=> b!66411 (= e!43610 (tuple2!5877 (Cons!701 (_1!3050 lt!105384) (bitStreamReadBitsIntoList!0 (_2!3039 lt!104935) (_2!3050 lt!105384) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!105385))) (_2!3050 lt!105384)))))

(assert (=> b!66411 (= lt!105384 (readBit!0 (_1!3040 lt!104922)))))

(assert (=> b!66411 (= lt!105385 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!66412 () Bool)

(declare-fun e!43609 () Bool)

(declare-fun lt!105386 () List!705)

(assert (=> b!66412 (= e!43609 (isEmpty!208 lt!105386))))

(declare-fun b!66410 () Bool)

(assert (=> b!66410 (= e!43610 (tuple2!5877 Nil!702 (_1!3040 lt!104922)))))

(declare-fun b!66413 () Bool)

(assert (=> b!66413 (= e!43609 (> (length!333 lt!105386) 0))))

(declare-fun d!20842 () Bool)

(assert (=> d!20842 e!43609))

(declare-fun c!4829 () Bool)

(assert (=> d!20842 (= c!4829 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!20842 (= lt!105386 (_1!3049 e!43610))))

(declare-fun c!4828 () Bool)

(assert (=> d!20842 (= c!4828 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!20842 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!20842 (= (bitStreamReadBitsIntoList!0 (_2!3039 lt!104935) (_1!3040 lt!104922) #b0000000000000000000000000000000000000000000000000000000000000001) lt!105386)))

(assert (= (and d!20842 c!4828) b!66410))

(assert (= (and d!20842 (not c!4828)) b!66411))

(assert (= (and d!20842 c!4829) b!66412))

(assert (= (and d!20842 (not c!4829)) b!66413))

(declare-fun m!105561 () Bool)

(assert (=> b!66411 m!105561))

(declare-fun m!105563 () Bool)

(assert (=> b!66411 m!105563))

(declare-fun m!105565 () Bool)

(assert (=> b!66412 m!105565))

(declare-fun m!105567 () Bool)

(assert (=> b!66413 m!105567))

(assert (=> b!66163 d!20842))

(declare-fun d!20844 () Bool)

(declare-fun size!1317 (List!705) Int)

(assert (=> d!20844 (= (length!333 lt!104928) (size!1317 lt!104928))))

(declare-fun bs!5072 () Bool)

(assert (= bs!5072 d!20844))

(declare-fun m!105569 () Bool)

(assert (=> bs!5072 m!105569))

(assert (=> b!66153 d!20844))

(declare-fun d!20846 () Bool)

(declare-fun e!43700 () Bool)

(assert (=> d!20846 e!43700))

(declare-fun res!55153 () Bool)

(assert (=> d!20846 (=> (not res!55153) (not e!43700))))

(declare-fun lt!105821 () tuple2!5856)

(declare-fun lt!105816 () (_ BitVec 64))

(assert (=> d!20846 (= res!55153 (= (bitIndex!0 (size!1313 (buf!1694 (_2!3039 lt!105821))) (currentByte!3366 (_2!3039 lt!105821)) (currentBit!3361 (_2!3039 lt!105821))) (bvsub lt!105816 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!20846 (or (= (bvand lt!105816 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!105816 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!105816 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!105828 () (_ BitVec 64))

(assert (=> d!20846 (= lt!105816 (bvadd lt!105828 to!314))))

(assert (=> d!20846 (or (not (= (bvand lt!105828 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!105828 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!105828 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!20846 (= lt!105828 (bitIndex!0 (size!1313 (buf!1694 (_2!3039 lt!104935))) (currentByte!3366 (_2!3039 lt!104935)) (currentBit!3361 (_2!3039 lt!104935))))))

(declare-fun e!43698 () tuple2!5856)

(assert (=> d!20846 (= lt!105821 e!43698)))

(declare-fun c!4855 () Bool)

(assert (=> d!20846 (= c!4855 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!105813 () Unit!4463)

(declare-fun lt!105818 () Unit!4463)

(assert (=> d!20846 (= lt!105813 lt!105818)))

(assert (=> d!20846 (isPrefixOf!0 (_2!3039 lt!104935) (_2!3039 lt!104935))))

(assert (=> d!20846 (= lt!105818 (lemmaIsPrefixRefl!0 (_2!3039 lt!104935)))))

(declare-fun lt!105805 () (_ BitVec 64))

(assert (=> d!20846 (= lt!105805 (bitIndex!0 (size!1313 (buf!1694 (_2!3039 lt!104935))) (currentByte!3366 (_2!3039 lt!104935)) (currentBit!3361 (_2!3039 lt!104935))))))

(assert (=> d!20846 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!20846 (= (appendBitsMSBFirstLoop!0 (_2!3039 lt!104935) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!105821)))

(declare-fun lt!105835 () tuple2!5856)

(declare-fun bm!847 () Bool)

(declare-fun call!850 () tuple2!5858)

(assert (=> bm!847 (= call!850 (reader!0 (_2!3039 lt!104935) (ite c!4855 (_2!3039 lt!105835) (_2!3039 lt!104935))))))

(declare-fun b!66588 () Bool)

(declare-fun e!43699 () Bool)

(declare-fun lt!105831 () (_ BitVec 64))

(assert (=> b!66588 (= e!43699 (validate_offset_bits!1 ((_ sign_extend 32) (size!1313 (buf!1694 (_2!3039 lt!104935)))) ((_ sign_extend 32) (currentByte!3366 (_2!3039 lt!104935))) ((_ sign_extend 32) (currentBit!3361 (_2!3039 lt!104935))) lt!105831))))

(declare-fun b!66589 () Bool)

(declare-fun lt!105820 () tuple2!5856)

(declare-fun Unit!4482 () Unit!4463)

(assert (=> b!66589 (= e!43698 (tuple2!5857 Unit!4482 (_2!3039 lt!105820)))))

(assert (=> b!66589 (= lt!105835 (appendBitFromByte!0 (_2!3039 lt!104935) (select (arr!1877 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!105827 () (_ BitVec 64))

(assert (=> b!66589 (= lt!105827 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!105842 () (_ BitVec 64))

(assert (=> b!66589 (= lt!105842 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!105806 () Unit!4463)

(assert (=> b!66589 (= lt!105806 (validateOffsetBitsIneqLemma!0 (_2!3039 lt!104935) (_2!3039 lt!105835) lt!105827 lt!105842))))

(assert (=> b!66589 (validate_offset_bits!1 ((_ sign_extend 32) (size!1313 (buf!1694 (_2!3039 lt!105835)))) ((_ sign_extend 32) (currentByte!3366 (_2!3039 lt!105835))) ((_ sign_extend 32) (currentBit!3361 (_2!3039 lt!105835))) (bvsub lt!105827 lt!105842))))

(declare-fun lt!105825 () Unit!4463)

(assert (=> b!66589 (= lt!105825 lt!105806)))

(declare-fun lt!105809 () tuple2!5858)

(assert (=> b!66589 (= lt!105809 call!850)))

(declare-fun lt!105826 () (_ BitVec 64))

(assert (=> b!66589 (= lt!105826 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!105837 () Unit!4463)

(assert (=> b!66589 (= lt!105837 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3039 lt!104935) (buf!1694 (_2!3039 lt!105835)) lt!105826))))

(assert (=> b!66589 (validate_offset_bits!1 ((_ sign_extend 32) (size!1313 (buf!1694 (_2!3039 lt!105835)))) ((_ sign_extend 32) (currentByte!3366 (_2!3039 lt!104935))) ((_ sign_extend 32) (currentBit!3361 (_2!3039 lt!104935))) lt!105826)))

(declare-fun lt!105834 () Unit!4463)

(assert (=> b!66589 (= lt!105834 lt!105837)))

(assert (=> b!66589 (= (head!524 (byteArrayBitContentToList!0 (_2!3039 lt!105835) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!524 (bitStreamReadBitsIntoList!0 (_2!3039 lt!105835) (_1!3040 lt!105809) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!105840 () Unit!4463)

(declare-fun Unit!4484 () Unit!4463)

(assert (=> b!66589 (= lt!105840 Unit!4484)))

(assert (=> b!66589 (= lt!105820 (appendBitsMSBFirstLoop!0 (_2!3039 lt!105835) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!105817 () Unit!4463)

(assert (=> b!66589 (= lt!105817 (lemmaIsPrefixTransitive!0 (_2!3039 lt!104935) (_2!3039 lt!105835) (_2!3039 lt!105820)))))

(assert (=> b!66589 (isPrefixOf!0 (_2!3039 lt!104935) (_2!3039 lt!105820))))

(declare-fun lt!105810 () Unit!4463)

(assert (=> b!66589 (= lt!105810 lt!105817)))

(assert (=> b!66589 (= (size!1313 (buf!1694 (_2!3039 lt!105820))) (size!1313 (buf!1694 (_2!3039 lt!104935))))))

(declare-fun lt!105814 () Unit!4463)

(declare-fun Unit!4485 () Unit!4463)

(assert (=> b!66589 (= lt!105814 Unit!4485)))

(assert (=> b!66589 (= (bitIndex!0 (size!1313 (buf!1694 (_2!3039 lt!105820))) (currentByte!3366 (_2!3039 lt!105820)) (currentBit!3361 (_2!3039 lt!105820))) (bvsub (bvadd (bitIndex!0 (size!1313 (buf!1694 (_2!3039 lt!104935))) (currentByte!3366 (_2!3039 lt!104935)) (currentBit!3361 (_2!3039 lt!104935))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!105815 () Unit!4463)

(declare-fun Unit!4486 () Unit!4463)

(assert (=> b!66589 (= lt!105815 Unit!4486)))

(assert (=> b!66589 (= (bitIndex!0 (size!1313 (buf!1694 (_2!3039 lt!105820))) (currentByte!3366 (_2!3039 lt!105820)) (currentBit!3361 (_2!3039 lt!105820))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1313 (buf!1694 (_2!3039 lt!105835))) (currentByte!3366 (_2!3039 lt!105835)) (currentBit!3361 (_2!3039 lt!105835))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!105822 () Unit!4463)

(declare-fun Unit!4487 () Unit!4463)

(assert (=> b!66589 (= lt!105822 Unit!4487)))

(declare-fun lt!105832 () tuple2!5858)

(assert (=> b!66589 (= lt!105832 (reader!0 (_2!3039 lt!104935) (_2!3039 lt!105820)))))

(declare-fun lt!105819 () (_ BitVec 64))

(assert (=> b!66589 (= lt!105819 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!105830 () Unit!4463)

(assert (=> b!66589 (= lt!105830 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3039 lt!104935) (buf!1694 (_2!3039 lt!105820)) lt!105819))))

(assert (=> b!66589 (validate_offset_bits!1 ((_ sign_extend 32) (size!1313 (buf!1694 (_2!3039 lt!105820)))) ((_ sign_extend 32) (currentByte!3366 (_2!3039 lt!104935))) ((_ sign_extend 32) (currentBit!3361 (_2!3039 lt!104935))) lt!105819)))

(declare-fun lt!105836 () Unit!4463)

(assert (=> b!66589 (= lt!105836 lt!105830)))

(declare-fun lt!105807 () tuple2!5858)

(assert (=> b!66589 (= lt!105807 (reader!0 (_2!3039 lt!105835) (_2!3039 lt!105820)))))

(declare-fun lt!105823 () (_ BitVec 64))

(assert (=> b!66589 (= lt!105823 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!105841 () Unit!4463)

(assert (=> b!66589 (= lt!105841 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3039 lt!105835) (buf!1694 (_2!3039 lt!105820)) lt!105823))))

(assert (=> b!66589 (validate_offset_bits!1 ((_ sign_extend 32) (size!1313 (buf!1694 (_2!3039 lt!105820)))) ((_ sign_extend 32) (currentByte!3366 (_2!3039 lt!105835))) ((_ sign_extend 32) (currentBit!3361 (_2!3039 lt!105835))) lt!105823)))

(declare-fun lt!105808 () Unit!4463)

(assert (=> b!66589 (= lt!105808 lt!105841)))

(declare-fun lt!105824 () List!705)

(assert (=> b!66589 (= lt!105824 (byteArrayBitContentToList!0 (_2!3039 lt!105820) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!105829 () List!705)

(assert (=> b!66589 (= lt!105829 (byteArrayBitContentToList!0 (_2!3039 lt!105820) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!105812 () List!705)

(assert (=> b!66589 (= lt!105812 (bitStreamReadBitsIntoList!0 (_2!3039 lt!105820) (_1!3040 lt!105832) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!105833 () List!705)

(assert (=> b!66589 (= lt!105833 (bitStreamReadBitsIntoList!0 (_2!3039 lt!105820) (_1!3040 lt!105807) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!105846 () (_ BitVec 64))

(assert (=> b!66589 (= lt!105846 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!105839 () Unit!4463)

(assert (=> b!66589 (= lt!105839 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3039 lt!105820) (_2!3039 lt!105820) (_1!3040 lt!105832) (_1!3040 lt!105807) lt!105846 lt!105812))))

(assert (=> b!66589 (= (bitStreamReadBitsIntoList!0 (_2!3039 lt!105820) (_1!3040 lt!105807) (bvsub lt!105846 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!309 lt!105812))))

(declare-fun lt!105845 () Unit!4463)

(assert (=> b!66589 (= lt!105845 lt!105839)))

(declare-fun lt!105811 () Unit!4463)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2848 array!2848 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4463)

(assert (=> b!66589 (= lt!105811 (arrayBitRangesEqImpliesEq!0 (buf!1694 (_2!3039 lt!105835)) (buf!1694 (_2!3039 lt!105820)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!105805 (bitIndex!0 (size!1313 (buf!1694 (_2!3039 lt!105835))) (currentByte!3366 (_2!3039 lt!105835)) (currentBit!3361 (_2!3039 lt!105835)))))))

(assert (=> b!66589 (= (bitAt!0 (buf!1694 (_2!3039 lt!105835)) lt!105805) (bitAt!0 (buf!1694 (_2!3039 lt!105820)) lt!105805))))

(declare-fun lt!105843 () Unit!4463)

(assert (=> b!66589 (= lt!105843 lt!105811)))

(declare-fun b!66590 () Bool)

(declare-fun res!55156 () Bool)

(assert (=> b!66590 (=> (not res!55156) (not e!43700))))

(assert (=> b!66590 (= res!55156 (= (size!1313 (buf!1694 (_2!3039 lt!104935))) (size!1313 (buf!1694 (_2!3039 lt!105821)))))))

(declare-fun b!66591 () Bool)

(declare-fun res!55155 () Bool)

(assert (=> b!66591 (=> (not res!55155) (not e!43700))))

(assert (=> b!66591 (= res!55155 (= (size!1313 (buf!1694 (_2!3039 lt!105821))) (size!1313 (buf!1694 (_2!3039 lt!104935)))))))

(declare-fun b!66592 () Bool)

(declare-fun lt!105803 () tuple2!5858)

(assert (=> b!66592 (= e!43700 (= (bitStreamReadBitsIntoList!0 (_2!3039 lt!105821) (_1!3040 lt!105803) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!3039 lt!105821) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!66592 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!66592 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!105838 () Unit!4463)

(declare-fun lt!105844 () Unit!4463)

(assert (=> b!66592 (= lt!105838 lt!105844)))

(assert (=> b!66592 (validate_offset_bits!1 ((_ sign_extend 32) (size!1313 (buf!1694 (_2!3039 lt!105821)))) ((_ sign_extend 32) (currentByte!3366 (_2!3039 lt!104935))) ((_ sign_extend 32) (currentBit!3361 (_2!3039 lt!104935))) lt!105831)))

(assert (=> b!66592 (= lt!105844 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3039 lt!104935) (buf!1694 (_2!3039 lt!105821)) lt!105831))))

(assert (=> b!66592 e!43699))

(declare-fun res!55154 () Bool)

(assert (=> b!66592 (=> (not res!55154) (not e!43699))))

(assert (=> b!66592 (= res!55154 (and (= (size!1313 (buf!1694 (_2!3039 lt!104935))) (size!1313 (buf!1694 (_2!3039 lt!105821)))) (bvsge lt!105831 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!66592 (= lt!105831 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!66592 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!66592 (= lt!105803 (reader!0 (_2!3039 lt!104935) (_2!3039 lt!105821)))))

(declare-fun b!66593 () Bool)

(declare-fun res!55157 () Bool)

(assert (=> b!66593 (=> (not res!55157) (not e!43700))))

(assert (=> b!66593 (= res!55157 (isPrefixOf!0 (_2!3039 lt!104935) (_2!3039 lt!105821)))))

(declare-fun b!66594 () Bool)

(declare-fun res!55152 () Bool)

(assert (=> b!66594 (=> (not res!55152) (not e!43700))))

(assert (=> b!66594 (= res!55152 (invariant!0 (currentBit!3361 (_2!3039 lt!105821)) (currentByte!3366 (_2!3039 lt!105821)) (size!1313 (buf!1694 (_2!3039 lt!105821)))))))

(declare-fun b!66595 () Bool)

(declare-fun Unit!4488 () Unit!4463)

(assert (=> b!66595 (= e!43698 (tuple2!5857 Unit!4488 (_2!3039 lt!104935)))))

(assert (=> b!66595 (= (size!1313 (buf!1694 (_2!3039 lt!104935))) (size!1313 (buf!1694 (_2!3039 lt!104935))))))

(declare-fun lt!105804 () Unit!4463)

(declare-fun Unit!4489 () Unit!4463)

(assert (=> b!66595 (= lt!105804 Unit!4489)))

(declare-fun checkByteArrayBitContent!0 (BitStream!2260 array!2848 array!2848 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!5884 0))(
  ( (tuple2!5885 (_1!3053 array!2848) (_2!3053 BitStream!2260)) )
))
(declare-fun readBits!0 (BitStream!2260 (_ BitVec 64)) tuple2!5884)

(assert (=> b!66595 (checkByteArrayBitContent!0 (_2!3039 lt!104935) srcBuffer!2 (_1!3053 (readBits!0 (_1!3040 call!850) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (= (and d!20846 c!4855) b!66589))

(assert (= (and d!20846 (not c!4855)) b!66595))

(assert (= (or b!66589 b!66595) bm!847))

(assert (= (and d!20846 res!55153) b!66594))

(assert (= (and b!66594 res!55152) b!66590))

(assert (= (and b!66590 res!55156) b!66593))

(assert (= (and b!66593 res!55157) b!66591))

(assert (= (and b!66591 res!55155) b!66592))

(assert (= (and b!66592 res!55154) b!66588))

(declare-fun m!105877 () Bool)

(assert (=> b!66594 m!105877))

(declare-fun m!105879 () Bool)

(assert (=> b!66595 m!105879))

(declare-fun m!105881 () Bool)

(assert (=> b!66595 m!105881))

(declare-fun m!105883 () Bool)

(assert (=> b!66588 m!105883))

(declare-fun m!105885 () Bool)

(assert (=> b!66593 m!105885))

(declare-fun m!105887 () Bool)

(assert (=> b!66592 m!105887))

(declare-fun m!105889 () Bool)

(assert (=> b!66592 m!105889))

(declare-fun m!105891 () Bool)

(assert (=> b!66592 m!105891))

(declare-fun m!105893 () Bool)

(assert (=> b!66592 m!105893))

(declare-fun m!105895 () Bool)

(assert (=> b!66592 m!105895))

(declare-fun m!105897 () Bool)

(assert (=> d!20846 m!105897))

(assert (=> d!20846 m!105157))

(assert (=> d!20846 m!105495))

(assert (=> d!20846 m!105487))

(declare-fun m!105899 () Bool)

(assert (=> b!66589 m!105899))

(declare-fun m!105901 () Bool)

(assert (=> b!66589 m!105901))

(declare-fun m!105903 () Bool)

(assert (=> b!66589 m!105903))

(declare-fun m!105905 () Bool)

(assert (=> b!66589 m!105905))

(declare-fun m!105907 () Bool)

(assert (=> b!66589 m!105907))

(declare-fun m!105909 () Bool)

(assert (=> b!66589 m!105909))

(declare-fun m!105911 () Bool)

(assert (=> b!66589 m!105911))

(declare-fun m!105913 () Bool)

(assert (=> b!66589 m!105913))

(declare-fun m!105915 () Bool)

(assert (=> b!66589 m!105915))

(declare-fun m!105917 () Bool)

(assert (=> b!66589 m!105917))

(declare-fun m!105919 () Bool)

(assert (=> b!66589 m!105919))

(declare-fun m!105921 () Bool)

(assert (=> b!66589 m!105921))

(assert (=> b!66589 m!105919))

(declare-fun m!105923 () Bool)

(assert (=> b!66589 m!105923))

(declare-fun m!105925 () Bool)

(assert (=> b!66589 m!105925))

(declare-fun m!105927 () Bool)

(assert (=> b!66589 m!105927))

(declare-fun m!105929 () Bool)

(assert (=> b!66589 m!105929))

(assert (=> b!66589 m!105157))

(declare-fun m!105931 () Bool)

(assert (=> b!66589 m!105931))

(declare-fun m!105933 () Bool)

(assert (=> b!66589 m!105933))

(assert (=> b!66589 m!105921))

(declare-fun m!105935 () Bool)

(assert (=> b!66589 m!105935))

(declare-fun m!105937 () Bool)

(assert (=> b!66589 m!105937))

(declare-fun m!105939 () Bool)

(assert (=> b!66589 m!105939))

(assert (=> b!66589 m!105907))

(declare-fun m!105941 () Bool)

(assert (=> b!66589 m!105941))

(declare-fun m!105943 () Bool)

(assert (=> b!66589 m!105943))

(declare-fun m!105945 () Bool)

(assert (=> b!66589 m!105945))

(declare-fun m!105947 () Bool)

(assert (=> b!66589 m!105947))

(declare-fun m!105949 () Bool)

(assert (=> b!66589 m!105949))

(declare-fun m!105951 () Bool)

(assert (=> b!66589 m!105951))

(declare-fun m!105953 () Bool)

(assert (=> b!66589 m!105953))

(assert (=> b!66589 m!105945))

(declare-fun m!105955 () Bool)

(assert (=> b!66589 m!105955))

(declare-fun m!105957 () Bool)

(assert (=> b!66589 m!105957))

(declare-fun m!105959 () Bool)

(assert (=> b!66589 m!105959))

(declare-fun m!105961 () Bool)

(assert (=> bm!847 m!105961))

(assert (=> b!66154 d!20846))

(declare-fun d!20950 () Bool)

(assert (=> d!20950 (isPrefixOf!0 thiss!1379 (_2!3039 lt!104927))))

(declare-fun lt!105849 () Unit!4463)

(declare-fun choose!30 (BitStream!2260 BitStream!2260 BitStream!2260) Unit!4463)

(assert (=> d!20950 (= lt!105849 (choose!30 thiss!1379 (_2!3039 lt!104935) (_2!3039 lt!104927)))))

(assert (=> d!20950 (isPrefixOf!0 thiss!1379 (_2!3039 lt!104935))))

(assert (=> d!20950 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3039 lt!104935) (_2!3039 lt!104927)) lt!105849)))

(declare-fun bs!5092 () Bool)

(assert (= bs!5092 d!20950))

(assert (=> bs!5092 m!105107))

(declare-fun m!105963 () Bool)

(assert (=> bs!5092 m!105963))

(assert (=> bs!5092 m!105081))

(assert (=> b!66154 d!20950))

(declare-fun d!20952 () Bool)

(declare-fun res!55165 () Bool)

(declare-fun e!43705 () Bool)

(assert (=> d!20952 (=> (not res!55165) (not e!43705))))

(assert (=> d!20952 (= res!55165 (= (size!1313 (buf!1694 (_2!3039 lt!104935))) (size!1313 (buf!1694 (_2!3039 lt!104927)))))))

(assert (=> d!20952 (= (isPrefixOf!0 (_2!3039 lt!104935) (_2!3039 lt!104927)) e!43705)))

(declare-fun b!66602 () Bool)

(declare-fun res!55164 () Bool)

(assert (=> b!66602 (=> (not res!55164) (not e!43705))))

(assert (=> b!66602 (= res!55164 (bvsle (bitIndex!0 (size!1313 (buf!1694 (_2!3039 lt!104935))) (currentByte!3366 (_2!3039 lt!104935)) (currentBit!3361 (_2!3039 lt!104935))) (bitIndex!0 (size!1313 (buf!1694 (_2!3039 lt!104927))) (currentByte!3366 (_2!3039 lt!104927)) (currentBit!3361 (_2!3039 lt!104927)))))))

(declare-fun b!66603 () Bool)

(declare-fun e!43706 () Bool)

(assert (=> b!66603 (= e!43705 e!43706)))

(declare-fun res!55166 () Bool)

(assert (=> b!66603 (=> res!55166 e!43706)))

(assert (=> b!66603 (= res!55166 (= (size!1313 (buf!1694 (_2!3039 lt!104935))) #b00000000000000000000000000000000))))

(declare-fun b!66604 () Bool)

(assert (=> b!66604 (= e!43706 (arrayBitRangesEq!0 (buf!1694 (_2!3039 lt!104935)) (buf!1694 (_2!3039 lt!104927)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1313 (buf!1694 (_2!3039 lt!104935))) (currentByte!3366 (_2!3039 lt!104935)) (currentBit!3361 (_2!3039 lt!104935)))))))

(assert (= (and d!20952 res!55165) b!66602))

(assert (= (and b!66602 res!55164) b!66603))

(assert (= (and b!66603 (not res!55166)) b!66604))

(assert (=> b!66602 m!105157))

(assert (=> b!66602 m!105147))

(assert (=> b!66604 m!105157))

(assert (=> b!66604 m!105157))

(declare-fun m!105965 () Bool)

(assert (=> b!66604 m!105965))

(assert (=> b!66154 d!20952))

(declare-fun b!66605 () Bool)

(declare-fun res!55168 () Bool)

(declare-fun e!43707 () Bool)

(assert (=> b!66605 (=> (not res!55168) (not e!43707))))

(declare-fun lt!105853 () tuple2!5858)

(assert (=> b!66605 (= res!55168 (isPrefixOf!0 (_2!3040 lt!105853) (_2!3039 lt!104935)))))

(declare-fun d!20954 () Bool)

(assert (=> d!20954 e!43707))

(declare-fun res!55169 () Bool)

(assert (=> d!20954 (=> (not res!55169) (not e!43707))))

(assert (=> d!20954 (= res!55169 (isPrefixOf!0 (_1!3040 lt!105853) (_2!3040 lt!105853)))))

(declare-fun lt!105852 () BitStream!2260)

(assert (=> d!20954 (= lt!105853 (tuple2!5859 lt!105852 (_2!3039 lt!104935)))))

(declare-fun lt!105864 () Unit!4463)

(declare-fun lt!105855 () Unit!4463)

(assert (=> d!20954 (= lt!105864 lt!105855)))

(assert (=> d!20954 (isPrefixOf!0 lt!105852 (_2!3039 lt!104935))))

(assert (=> d!20954 (= lt!105855 (lemmaIsPrefixTransitive!0 lt!105852 (_2!3039 lt!104935) (_2!3039 lt!104935)))))

(declare-fun lt!105868 () Unit!4463)

(declare-fun lt!105857 () Unit!4463)

(assert (=> d!20954 (= lt!105868 lt!105857)))

(assert (=> d!20954 (isPrefixOf!0 lt!105852 (_2!3039 lt!104935))))

(assert (=> d!20954 (= lt!105857 (lemmaIsPrefixTransitive!0 lt!105852 thiss!1379 (_2!3039 lt!104935)))))

(declare-fun lt!105866 () Unit!4463)

(declare-fun e!43708 () Unit!4463)

(assert (=> d!20954 (= lt!105866 e!43708)))

(declare-fun c!4856 () Bool)

(assert (=> d!20954 (= c!4856 (not (= (size!1313 (buf!1694 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!105862 () Unit!4463)

(declare-fun lt!105850 () Unit!4463)

(assert (=> d!20954 (= lt!105862 lt!105850)))

(assert (=> d!20954 (isPrefixOf!0 (_2!3039 lt!104935) (_2!3039 lt!104935))))

(assert (=> d!20954 (= lt!105850 (lemmaIsPrefixRefl!0 (_2!3039 lt!104935)))))

(declare-fun lt!105856 () Unit!4463)

(declare-fun lt!105854 () Unit!4463)

(assert (=> d!20954 (= lt!105856 lt!105854)))

(assert (=> d!20954 (= lt!105854 (lemmaIsPrefixRefl!0 (_2!3039 lt!104935)))))

(declare-fun lt!105867 () Unit!4463)

(declare-fun lt!105860 () Unit!4463)

(assert (=> d!20954 (= lt!105867 lt!105860)))

(assert (=> d!20954 (isPrefixOf!0 lt!105852 lt!105852)))

(assert (=> d!20954 (= lt!105860 (lemmaIsPrefixRefl!0 lt!105852))))

(declare-fun lt!105865 () Unit!4463)

(declare-fun lt!105863 () Unit!4463)

(assert (=> d!20954 (= lt!105865 lt!105863)))

(assert (=> d!20954 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!20954 (= lt!105863 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!20954 (= lt!105852 (BitStream!2261 (buf!1694 (_2!3039 lt!104935)) (currentByte!3366 thiss!1379) (currentBit!3361 thiss!1379)))))

(assert (=> d!20954 (isPrefixOf!0 thiss!1379 (_2!3039 lt!104935))))

(assert (=> d!20954 (= (reader!0 thiss!1379 (_2!3039 lt!104935)) lt!105853)))

(declare-fun b!66606 () Bool)

(declare-fun lt!105861 () Unit!4463)

(assert (=> b!66606 (= e!43708 lt!105861)))

(declare-fun lt!105851 () (_ BitVec 64))

(assert (=> b!66606 (= lt!105851 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!105859 () (_ BitVec 64))

(assert (=> b!66606 (= lt!105859 (bitIndex!0 (size!1313 (buf!1694 thiss!1379)) (currentByte!3366 thiss!1379) (currentBit!3361 thiss!1379)))))

(assert (=> b!66606 (= lt!105861 (arrayBitRangesEqSymmetric!0 (buf!1694 thiss!1379) (buf!1694 (_2!3039 lt!104935)) lt!105851 lt!105859))))

(assert (=> b!66606 (arrayBitRangesEq!0 (buf!1694 (_2!3039 lt!104935)) (buf!1694 thiss!1379) lt!105851 lt!105859)))

(declare-fun b!66607 () Bool)

(declare-fun res!55167 () Bool)

(assert (=> b!66607 (=> (not res!55167) (not e!43707))))

(assert (=> b!66607 (= res!55167 (isPrefixOf!0 (_1!3040 lt!105853) thiss!1379))))

(declare-fun b!66608 () Bool)

(declare-fun Unit!4490 () Unit!4463)

(assert (=> b!66608 (= e!43708 Unit!4490)))

(declare-fun lt!105869 () (_ BitVec 64))

(declare-fun b!66609 () Bool)

(declare-fun lt!105858 () (_ BitVec 64))

(assert (=> b!66609 (= e!43707 (= (_1!3040 lt!105853) (withMovedBitIndex!0 (_2!3040 lt!105853) (bvsub lt!105858 lt!105869))))))

(assert (=> b!66609 (or (= (bvand lt!105858 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!105869 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!105858 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!105858 lt!105869) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!66609 (= lt!105869 (bitIndex!0 (size!1313 (buf!1694 (_2!3039 lt!104935))) (currentByte!3366 (_2!3039 lt!104935)) (currentBit!3361 (_2!3039 lt!104935))))))

(assert (=> b!66609 (= lt!105858 (bitIndex!0 (size!1313 (buf!1694 thiss!1379)) (currentByte!3366 thiss!1379) (currentBit!3361 thiss!1379)))))

(assert (= (and d!20954 c!4856) b!66606))

(assert (= (and d!20954 (not c!4856)) b!66608))

(assert (= (and d!20954 res!55169) b!66607))

(assert (= (and b!66607 res!55167) b!66605))

(assert (= (and b!66605 res!55168) b!66609))

(declare-fun m!105967 () Bool)

(assert (=> b!66605 m!105967))

(declare-fun m!105969 () Bool)

(assert (=> b!66607 m!105969))

(assert (=> d!20954 m!105495))

(assert (=> d!20954 m!105161))

(declare-fun m!105971 () Bool)

(assert (=> d!20954 m!105971))

(declare-fun m!105973 () Bool)

(assert (=> d!20954 m!105973))

(assert (=> d!20954 m!105081))

(declare-fun m!105975 () Bool)

(assert (=> d!20954 m!105975))

(assert (=> d!20954 m!105159))

(declare-fun m!105977 () Bool)

(assert (=> d!20954 m!105977))

(declare-fun m!105979 () Bool)

(assert (=> d!20954 m!105979))

(declare-fun m!105981 () Bool)

(assert (=> d!20954 m!105981))

(assert (=> d!20954 m!105487))

(assert (=> b!66606 m!105163))

(declare-fun m!105983 () Bool)

(assert (=> b!66606 m!105983))

(declare-fun m!105985 () Bool)

(assert (=> b!66606 m!105985))

(declare-fun m!105987 () Bool)

(assert (=> b!66609 m!105987))

(assert (=> b!66609 m!105157))

(assert (=> b!66609 m!105163))

(assert (=> b!66154 d!20954))

(declare-fun d!20956 () Bool)

(declare-fun res!55171 () Bool)

(declare-fun e!43709 () Bool)

(assert (=> d!20956 (=> (not res!55171) (not e!43709))))

(assert (=> d!20956 (= res!55171 (= (size!1313 (buf!1694 thiss!1379)) (size!1313 (buf!1694 (_2!3039 lt!104927)))))))

(assert (=> d!20956 (= (isPrefixOf!0 thiss!1379 (_2!3039 lt!104927)) e!43709)))

(declare-fun b!66610 () Bool)

(declare-fun res!55170 () Bool)

(assert (=> b!66610 (=> (not res!55170) (not e!43709))))

(assert (=> b!66610 (= res!55170 (bvsle (bitIndex!0 (size!1313 (buf!1694 thiss!1379)) (currentByte!3366 thiss!1379) (currentBit!3361 thiss!1379)) (bitIndex!0 (size!1313 (buf!1694 (_2!3039 lt!104927))) (currentByte!3366 (_2!3039 lt!104927)) (currentBit!3361 (_2!3039 lt!104927)))))))

(declare-fun b!66611 () Bool)

(declare-fun e!43710 () Bool)

(assert (=> b!66611 (= e!43709 e!43710)))

(declare-fun res!55172 () Bool)

(assert (=> b!66611 (=> res!55172 e!43710)))

(assert (=> b!66611 (= res!55172 (= (size!1313 (buf!1694 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!66612 () Bool)

(assert (=> b!66612 (= e!43710 (arrayBitRangesEq!0 (buf!1694 thiss!1379) (buf!1694 (_2!3039 lt!104927)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1313 (buf!1694 thiss!1379)) (currentByte!3366 thiss!1379) (currentBit!3361 thiss!1379))))))

(assert (= (and d!20956 res!55171) b!66610))

(assert (= (and b!66610 res!55170) b!66611))

(assert (= (and b!66611 (not res!55172)) b!66612))

(assert (=> b!66610 m!105163))

(assert (=> b!66610 m!105147))

(assert (=> b!66612 m!105163))

(assert (=> b!66612 m!105163))

(declare-fun m!105989 () Bool)

(assert (=> b!66612 m!105989))

(assert (=> b!66154 d!20956))

(declare-fun d!20958 () Bool)

(assert (=> d!20958 (validate_offset_bits!1 ((_ sign_extend 32) (size!1313 (buf!1694 (_2!3039 lt!104935)))) ((_ sign_extend 32) (currentByte!3366 thiss!1379)) ((_ sign_extend 32) (currentBit!3361 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!105870 () Unit!4463)

(assert (=> d!20958 (= lt!105870 (choose!9 thiss!1379 (buf!1694 (_2!3039 lt!104935)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2261 (buf!1694 (_2!3039 lt!104935)) (currentByte!3366 thiss!1379) (currentBit!3361 thiss!1379))))))

(assert (=> d!20958 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1694 (_2!3039 lt!104935)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!105870)))

(declare-fun bs!5093 () Bool)

(assert (= bs!5093 d!20958))

(assert (=> bs!5093 m!105115))

(declare-fun m!105991 () Bool)

(assert (=> bs!5093 m!105991))

(assert (=> b!66154 d!20958))

(declare-fun d!20960 () Bool)

(assert (=> d!20960 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1313 (buf!1694 (_2!3039 lt!104935)))) ((_ sign_extend 32) (currentByte!3366 thiss!1379)) ((_ sign_extend 32) (currentBit!3361 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1313 (buf!1694 (_2!3039 lt!104935)))) ((_ sign_extend 32) (currentByte!3366 thiss!1379)) ((_ sign_extend 32) (currentBit!3361 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!5094 () Bool)

(assert (= bs!5094 d!20960))

(declare-fun m!105993 () Bool)

(assert (=> bs!5094 m!105993))

(assert (=> b!66154 d!20960))

(declare-fun d!20962 () Bool)

(declare-fun e!43713 () Bool)

(assert (=> d!20962 e!43713))

(declare-fun res!55177 () Bool)

(assert (=> d!20962 (=> (not res!55177) (not e!43713))))

(declare-fun lt!105885 () (_ BitVec 64))

(declare-fun lt!105887 () (_ BitVec 64))

(declare-fun lt!105883 () (_ BitVec 64))

(assert (=> d!20962 (= res!55177 (= lt!105887 (bvsub lt!105885 lt!105883)))))

(assert (=> d!20962 (or (= (bvand lt!105885 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!105883 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!105885 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!105885 lt!105883) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!20962 (= lt!105883 (remainingBits!0 ((_ sign_extend 32) (size!1313 (buf!1694 (_2!3039 lt!104935)))) ((_ sign_extend 32) (currentByte!3366 (_2!3039 lt!104935))) ((_ sign_extend 32) (currentBit!3361 (_2!3039 lt!104935)))))))

(declare-fun lt!105886 () (_ BitVec 64))

(declare-fun lt!105888 () (_ BitVec 64))

(assert (=> d!20962 (= lt!105885 (bvmul lt!105886 lt!105888))))

(assert (=> d!20962 (or (= lt!105886 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!105888 (bvsdiv (bvmul lt!105886 lt!105888) lt!105886)))))

(assert (=> d!20962 (= lt!105888 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!20962 (= lt!105886 ((_ sign_extend 32) (size!1313 (buf!1694 (_2!3039 lt!104935)))))))

(assert (=> d!20962 (= lt!105887 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3366 (_2!3039 lt!104935))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3361 (_2!3039 lt!104935)))))))

(assert (=> d!20962 (invariant!0 (currentBit!3361 (_2!3039 lt!104935)) (currentByte!3366 (_2!3039 lt!104935)) (size!1313 (buf!1694 (_2!3039 lt!104935))))))

(assert (=> d!20962 (= (bitIndex!0 (size!1313 (buf!1694 (_2!3039 lt!104935))) (currentByte!3366 (_2!3039 lt!104935)) (currentBit!3361 (_2!3039 lt!104935))) lt!105887)))

(declare-fun b!66617 () Bool)

(declare-fun res!55178 () Bool)

(assert (=> b!66617 (=> (not res!55178) (not e!43713))))

(assert (=> b!66617 (= res!55178 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!105887))))

(declare-fun b!66618 () Bool)

(declare-fun lt!105884 () (_ BitVec 64))

(assert (=> b!66618 (= e!43713 (bvsle lt!105887 (bvmul lt!105884 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!66618 (or (= lt!105884 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!105884 #b0000000000000000000000000000000000000000000000000000000000001000) lt!105884)))))

(assert (=> b!66618 (= lt!105884 ((_ sign_extend 32) (size!1313 (buf!1694 (_2!3039 lt!104935)))))))

(assert (= (and d!20962 res!55177) b!66617))

(assert (= (and b!66617 res!55178) b!66618))

(declare-fun m!105995 () Bool)

(assert (=> d!20962 m!105995))

(assert (=> d!20962 m!105149))

(assert (=> b!66144 d!20962))

(declare-fun d!20964 () Bool)

(assert (=> d!20964 (= (head!524 lt!104928) (h!820 lt!104928))))

(assert (=> b!66156 d!20964))

(declare-fun d!20966 () Bool)

(assert (=> d!20966 (= (invariant!0 (currentBit!3361 (_2!3039 lt!104927)) (currentByte!3366 (_2!3039 lt!104927)) (size!1313 (buf!1694 (_2!3039 lt!104927)))) (and (bvsge (currentBit!3361 (_2!3039 lt!104927)) #b00000000000000000000000000000000) (bvslt (currentBit!3361 (_2!3039 lt!104927)) #b00000000000000000000000000001000) (bvsge (currentByte!3366 (_2!3039 lt!104927)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3366 (_2!3039 lt!104927)) (size!1313 (buf!1694 (_2!3039 lt!104927)))) (and (= (currentBit!3361 (_2!3039 lt!104927)) #b00000000000000000000000000000000) (= (currentByte!3366 (_2!3039 lt!104927)) (size!1313 (buf!1694 (_2!3039 lt!104927))))))))))

(assert (=> b!66145 d!20966))

(declare-fun d!20968 () Bool)

(declare-fun e!43714 () Bool)

(assert (=> d!20968 e!43714))

(declare-fun res!55179 () Bool)

(assert (=> d!20968 (=> (not res!55179) (not e!43714))))

(declare-fun lt!105893 () (_ BitVec 64))

(declare-fun lt!105891 () (_ BitVec 64))

(declare-fun lt!105889 () (_ BitVec 64))

(assert (=> d!20968 (= res!55179 (= lt!105893 (bvsub lt!105891 lt!105889)))))

(assert (=> d!20968 (or (= (bvand lt!105891 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!105889 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!105891 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!105891 lt!105889) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!20968 (= lt!105889 (remainingBits!0 ((_ sign_extend 32) (size!1313 (buf!1694 (_2!3039 lt!104927)))) ((_ sign_extend 32) (currentByte!3366 (_2!3039 lt!104927))) ((_ sign_extend 32) (currentBit!3361 (_2!3039 lt!104927)))))))

(declare-fun lt!105892 () (_ BitVec 64))

(declare-fun lt!105894 () (_ BitVec 64))

(assert (=> d!20968 (= lt!105891 (bvmul lt!105892 lt!105894))))

(assert (=> d!20968 (or (= lt!105892 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!105894 (bvsdiv (bvmul lt!105892 lt!105894) lt!105892)))))

(assert (=> d!20968 (= lt!105894 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!20968 (= lt!105892 ((_ sign_extend 32) (size!1313 (buf!1694 (_2!3039 lt!104927)))))))

(assert (=> d!20968 (= lt!105893 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3366 (_2!3039 lt!104927))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3361 (_2!3039 lt!104927)))))))

(assert (=> d!20968 (invariant!0 (currentBit!3361 (_2!3039 lt!104927)) (currentByte!3366 (_2!3039 lt!104927)) (size!1313 (buf!1694 (_2!3039 lt!104927))))))

(assert (=> d!20968 (= (bitIndex!0 (size!1313 (buf!1694 (_2!3039 lt!104927))) (currentByte!3366 (_2!3039 lt!104927)) (currentBit!3361 (_2!3039 lt!104927))) lt!105893)))

(declare-fun b!66619 () Bool)

(declare-fun res!55180 () Bool)

(assert (=> b!66619 (=> (not res!55180) (not e!43714))))

(assert (=> b!66619 (= res!55180 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!105893))))

(declare-fun b!66620 () Bool)

(declare-fun lt!105890 () (_ BitVec 64))

(assert (=> b!66620 (= e!43714 (bvsle lt!105893 (bvmul lt!105890 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!66620 (or (= lt!105890 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!105890 #b0000000000000000000000000000000000000000000000000000000000001000) lt!105890)))))

(assert (=> b!66620 (= lt!105890 ((_ sign_extend 32) (size!1313 (buf!1694 (_2!3039 lt!104927)))))))

(assert (= (and d!20968 res!55179) b!66619))

(assert (= (and b!66619 res!55180) b!66620))

(declare-fun m!105997 () Bool)

(assert (=> d!20968 m!105997))

(assert (=> d!20968 m!105129))

(assert (=> b!66146 d!20968))

(declare-fun d!20970 () Bool)

(assert (=> d!20970 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1313 (buf!1694 thiss!1379))) ((_ sign_extend 32) (currentByte!3366 thiss!1379)) ((_ sign_extend 32) (currentBit!3361 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1313 (buf!1694 thiss!1379))) ((_ sign_extend 32) (currentByte!3366 thiss!1379)) ((_ sign_extend 32) (currentBit!3361 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5095 () Bool)

(assert (= bs!5095 d!20970))

(declare-fun m!105999 () Bool)

(assert (=> bs!5095 m!105999))

(assert (=> b!66157 d!20970))

(declare-fun d!20972 () Bool)

(assert (=> d!20972 (= (bitAt!0 (buf!1694 (_2!3039 lt!104935)) lt!104925) (not (= (bvand ((_ sign_extend 24) (select (arr!1877 (buf!1694 (_2!3039 lt!104935))) ((_ extract 31 0) (bvsdiv lt!104925 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!104925 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5096 () Bool)

(assert (= bs!5096 d!20972))

(declare-fun m!106001 () Bool)

(assert (=> bs!5096 m!106001))

(declare-fun m!106003 () Bool)

(assert (=> bs!5096 m!106003))

(assert (=> b!66158 d!20972))

(declare-fun d!20974 () Bool)

(declare-fun res!55182 () Bool)

(declare-fun e!43715 () Bool)

(assert (=> d!20974 (=> (not res!55182) (not e!43715))))

(assert (=> d!20974 (= res!55182 (= (size!1313 (buf!1694 thiss!1379)) (size!1313 (buf!1694 (_2!3039 lt!104935)))))))

(assert (=> d!20974 (= (isPrefixOf!0 thiss!1379 (_2!3039 lt!104935)) e!43715)))

(declare-fun b!66621 () Bool)

(declare-fun res!55181 () Bool)

(assert (=> b!66621 (=> (not res!55181) (not e!43715))))

(assert (=> b!66621 (= res!55181 (bvsle (bitIndex!0 (size!1313 (buf!1694 thiss!1379)) (currentByte!3366 thiss!1379) (currentBit!3361 thiss!1379)) (bitIndex!0 (size!1313 (buf!1694 (_2!3039 lt!104935))) (currentByte!3366 (_2!3039 lt!104935)) (currentBit!3361 (_2!3039 lt!104935)))))))

(declare-fun b!66622 () Bool)

(declare-fun e!43716 () Bool)

(assert (=> b!66622 (= e!43715 e!43716)))

(declare-fun res!55183 () Bool)

(assert (=> b!66622 (=> res!55183 e!43716)))

(assert (=> b!66622 (= res!55183 (= (size!1313 (buf!1694 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!66623 () Bool)

(assert (=> b!66623 (= e!43716 (arrayBitRangesEq!0 (buf!1694 thiss!1379) (buf!1694 (_2!3039 lt!104935)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1313 (buf!1694 thiss!1379)) (currentByte!3366 thiss!1379) (currentBit!3361 thiss!1379))))))

(assert (= (and d!20974 res!55182) b!66621))

(assert (= (and b!66621 res!55181) b!66622))

(assert (= (and b!66622 (not res!55183)) b!66623))

(assert (=> b!66621 m!105163))

(assert (=> b!66621 m!105157))

(assert (=> b!66623 m!105163))

(assert (=> b!66623 m!105163))

(declare-fun m!106005 () Bool)

(assert (=> b!66623 m!106005))

(assert (=> b!66147 d!20974))

(declare-fun d!20976 () Bool)

(assert (=> d!20976 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1313 (buf!1694 (_2!3039 lt!104935)))) ((_ sign_extend 32) (currentByte!3366 (_2!3039 lt!104935))) ((_ sign_extend 32) (currentBit!3361 (_2!3039 lt!104935))) lt!104938) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1313 (buf!1694 (_2!3039 lt!104935)))) ((_ sign_extend 32) (currentByte!3366 (_2!3039 lt!104935))) ((_ sign_extend 32) (currentBit!3361 (_2!3039 lt!104935)))) lt!104938))))

(declare-fun bs!5097 () Bool)

(assert (= bs!5097 d!20976))

(assert (=> bs!5097 m!105995))

(assert (=> b!66147 d!20976))

(declare-fun d!20978 () Bool)

(declare-fun e!43719 () Bool)

(assert (=> d!20978 e!43719))

(declare-fun res!55186 () Bool)

(assert (=> d!20978 (=> (not res!55186) (not e!43719))))

(assert (=> d!20978 (= res!55186 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!105897 () Unit!4463)

(declare-fun choose!27 (BitStream!2260 BitStream!2260 (_ BitVec 64) (_ BitVec 64)) Unit!4463)

(assert (=> d!20978 (= lt!105897 (choose!27 thiss!1379 (_2!3039 lt!104935) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!20978 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!20978 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3039 lt!104935) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!105897)))

(declare-fun b!66626 () Bool)

(assert (=> b!66626 (= e!43719 (validate_offset_bits!1 ((_ sign_extend 32) (size!1313 (buf!1694 (_2!3039 lt!104935)))) ((_ sign_extend 32) (currentByte!3366 (_2!3039 lt!104935))) ((_ sign_extend 32) (currentBit!3361 (_2!3039 lt!104935))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!20978 res!55186) b!66626))

(declare-fun m!106007 () Bool)

(assert (=> d!20978 m!106007))

(declare-fun m!106009 () Bool)

(assert (=> b!66626 m!106009))

(assert (=> b!66147 d!20978))

(declare-fun b!66648 () Bool)

(declare-fun res!55205 () Bool)

(declare-fun e!43731 () Bool)

(assert (=> b!66648 (=> (not res!55205) (not e!43731))))

(declare-fun lt!106005 () tuple2!5856)

(assert (=> b!66648 (= res!55205 (= (bitIndex!0 (size!1313 (buf!1694 (_2!3039 lt!106005))) (currentByte!3366 (_2!3039 lt!106005)) (currentBit!3361 (_2!3039 lt!106005))) (bvadd (bitIndex!0 (size!1313 (buf!1694 thiss!1379)) (currentByte!3366 thiss!1379) (currentBit!3361 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!66650 () Bool)

(declare-fun e!43733 () Bool)

(declare-datatypes ((tuple2!5890 0))(
  ( (tuple2!5891 (_1!3056 BitStream!2260) (_2!3056 Bool)) )
))
(declare-fun lt!106007 () tuple2!5890)

(declare-fun lt!106008 () tuple2!5856)

(assert (=> b!66650 (= e!43733 (= (bitIndex!0 (size!1313 (buf!1694 (_1!3056 lt!106007))) (currentByte!3366 (_1!3056 lt!106007)) (currentBit!3361 (_1!3056 lt!106007))) (bitIndex!0 (size!1313 (buf!1694 (_2!3039 lt!106008))) (currentByte!3366 (_2!3039 lt!106008)) (currentBit!3361 (_2!3039 lt!106008)))))))

(declare-fun b!66651 () Bool)

(declare-fun res!55207 () Bool)

(declare-fun e!43730 () Bool)

(assert (=> b!66651 (=> (not res!55207) (not e!43730))))

(assert (=> b!66651 (= res!55207 (isPrefixOf!0 thiss!1379 (_2!3039 lt!106008)))))

(declare-fun b!66652 () Bool)

(declare-fun e!43732 () Bool)

(assert (=> b!66652 (= e!43731 e!43732)))

(declare-fun res!55206 () Bool)

(assert (=> b!66652 (=> (not res!55206) (not e!43732))))

(declare-fun lt!106004 () tuple2!5890)

(declare-fun lt!106000 () Bool)

(assert (=> b!66652 (= res!55206 (and (= (_2!3056 lt!106004) lt!106000) (= (_1!3056 lt!106004) (_2!3039 lt!106005))))))

(declare-fun readBitPure!0 (BitStream!2260) tuple2!5890)

(declare-fun readerFrom!0 (BitStream!2260 (_ BitVec 32) (_ BitVec 32)) BitStream!2260)

(assert (=> b!66652 (= lt!106004 (readBitPure!0 (readerFrom!0 (_2!3039 lt!106005) (currentBit!3361 thiss!1379) (currentByte!3366 thiss!1379))))))

(declare-fun b!66653 () Bool)

(declare-fun res!55204 () Bool)

(assert (=> b!66653 (=> (not res!55204) (not e!43730))))

(declare-fun lt!105999 () (_ BitVec 64))

(declare-fun lt!106002 () (_ BitVec 64))

(assert (=> b!66653 (= res!55204 (= (bitIndex!0 (size!1313 (buf!1694 (_2!3039 lt!106008))) (currentByte!3366 (_2!3039 lt!106008)) (currentBit!3361 (_2!3039 lt!106008))) (bvadd lt!105999 lt!106002)))))

(assert (=> b!66653 (or (not (= (bvand lt!105999 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!106002 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!105999 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!105999 lt!106002) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!66653 (= lt!106002 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!66653 (= lt!105999 (bitIndex!0 (size!1313 (buf!1694 thiss!1379)) (currentByte!3366 thiss!1379) (currentBit!3361 thiss!1379)))))

(declare-fun b!66649 () Bool)

(assert (=> b!66649 (= e!43732 (= (bitIndex!0 (size!1313 (buf!1694 (_1!3056 lt!106004))) (currentByte!3366 (_1!3056 lt!106004)) (currentBit!3361 (_1!3056 lt!106004))) (bitIndex!0 (size!1313 (buf!1694 (_2!3039 lt!106005))) (currentByte!3366 (_2!3039 lt!106005)) (currentBit!3361 (_2!3039 lt!106005)))))))

(declare-fun d!20980 () Bool)

(assert (=> d!20980 e!43730))

(declare-fun res!55209 () Bool)

(assert (=> d!20980 (=> (not res!55209) (not e!43730))))

(assert (=> d!20980 (= res!55209 (= (size!1313 (buf!1694 (_2!3039 lt!106008))) (size!1313 (buf!1694 thiss!1379))))))

(declare-fun lt!106001 () (_ BitVec 8))

(declare-fun lt!106009 () array!2848)

(assert (=> d!20980 (= lt!106001 (select (arr!1877 lt!106009) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!20980 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1313 lt!106009)))))

(assert (=> d!20980 (= lt!106009 (array!2849 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!106003 () tuple2!5856)

(assert (=> d!20980 (= lt!106008 (tuple2!5857 (_1!3039 lt!106003) (_2!3039 lt!106003)))))

(assert (=> d!20980 (= lt!106003 lt!106005)))

(assert (=> d!20980 e!43731))

(declare-fun res!55210 () Bool)

(assert (=> d!20980 (=> (not res!55210) (not e!43731))))

(assert (=> d!20980 (= res!55210 (= (size!1313 (buf!1694 thiss!1379)) (size!1313 (buf!1694 (_2!3039 lt!106005)))))))

(declare-fun appendBit!0 (BitStream!2260 Bool) tuple2!5856)

(assert (=> d!20980 (= lt!106005 (appendBit!0 thiss!1379 lt!106000))))

(assert (=> d!20980 (= lt!106000 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1877 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!20980 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!20980 (= (appendBitFromByte!0 thiss!1379 (select (arr!1877 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!106008)))

(declare-fun b!66654 () Bool)

(assert (=> b!66654 (= e!43730 e!43733)))

(declare-fun res!55203 () Bool)

(assert (=> b!66654 (=> (not res!55203) (not e!43733))))

(assert (=> b!66654 (= res!55203 (and (= (_2!3056 lt!106007) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1877 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!106001)) #b00000000000000000000000000000000))) (= (_1!3056 lt!106007) (_2!3039 lt!106008))))))

(declare-fun lt!106006 () tuple2!5884)

(declare-fun lt!105998 () BitStream!2260)

(assert (=> b!66654 (= lt!106006 (readBits!0 lt!105998 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!66654 (= lt!106007 (readBitPure!0 lt!105998))))

(assert (=> b!66654 (= lt!105998 (readerFrom!0 (_2!3039 lt!106008) (currentBit!3361 thiss!1379) (currentByte!3366 thiss!1379)))))

(declare-fun b!66655 () Bool)

(declare-fun res!55208 () Bool)

(assert (=> b!66655 (=> (not res!55208) (not e!43731))))

(assert (=> b!66655 (= res!55208 (isPrefixOf!0 thiss!1379 (_2!3039 lt!106005)))))

(assert (= (and d!20980 res!55210) b!66648))

(assert (= (and b!66648 res!55205) b!66655))

(assert (= (and b!66655 res!55208) b!66652))

(assert (= (and b!66652 res!55206) b!66649))

(assert (= (and d!20980 res!55209) b!66653))

(assert (= (and b!66653 res!55204) b!66651))

(assert (= (and b!66651 res!55207) b!66654))

(assert (= (and b!66654 res!55203) b!66650))

(declare-fun m!106011 () Bool)

(assert (=> b!66655 m!106011))

(declare-fun m!106013 () Bool)

(assert (=> d!20980 m!106013))

(declare-fun m!106015 () Bool)

(assert (=> d!20980 m!106015))

(assert (=> d!20980 m!105557))

(declare-fun m!106017 () Bool)

(assert (=> b!66650 m!106017))

(declare-fun m!106019 () Bool)

(assert (=> b!66650 m!106019))

(assert (=> b!66653 m!106019))

(assert (=> b!66653 m!105163))

(declare-fun m!106021 () Bool)

(assert (=> b!66648 m!106021))

(assert (=> b!66648 m!105163))

(declare-fun m!106023 () Bool)

(assert (=> b!66654 m!106023))

(declare-fun m!106025 () Bool)

(assert (=> b!66654 m!106025))

(declare-fun m!106027 () Bool)

(assert (=> b!66654 m!106027))

(declare-fun m!106029 () Bool)

(assert (=> b!66649 m!106029))

(assert (=> b!66649 m!106021))

(declare-fun m!106031 () Bool)

(assert (=> b!66652 m!106031))

(assert (=> b!66652 m!106031))

(declare-fun m!106033 () Bool)

(assert (=> b!66652 m!106033))

(declare-fun m!106035 () Bool)

(assert (=> b!66651 m!106035))

(assert (=> b!66147 d!20980))

(declare-fun d!20982 () Bool)

(assert (=> d!20982 (= (tail!309 lt!104928) (t!1455 lt!104928))))

(assert (=> b!66148 d!20982))

(declare-fun d!20984 () Bool)

(declare-fun e!43740 () Bool)

(assert (=> d!20984 e!43740))

(declare-fun res!55225 () Bool)

(assert (=> d!20984 (=> (not res!55225) (not e!43740))))

(declare-fun lt!106027 () (_ BitVec 64))

(assert (=> d!20984 (= res!55225 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!106027 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!106027) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!20984 (= lt!106027 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!106026 () Unit!4463)

(declare-fun choose!42 (BitStream!2260 BitStream!2260 BitStream!2260 BitStream!2260 (_ BitVec 64) List!705) Unit!4463)

(assert (=> d!20984 (= lt!106026 (choose!42 (_2!3039 lt!104927) (_2!3039 lt!104927) (_1!3040 lt!104942) (_1!3040 lt!104931) (bvsub to!314 i!635) lt!104928))))

(assert (=> d!20984 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!20984 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3039 lt!104927) (_2!3039 lt!104927) (_1!3040 lt!104942) (_1!3040 lt!104931) (bvsub to!314 i!635) lt!104928) lt!106026)))

(declare-fun b!66670 () Bool)

(assert (=> b!66670 (= e!43740 (= (bitStreamReadBitsIntoList!0 (_2!3039 lt!104927) (_1!3040 lt!104931) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!309 lt!104928)))))

(assert (= (and d!20984 res!55225) b!66670))

(declare-fun m!106037 () Bool)

(assert (=> d!20984 m!106037))

(declare-fun m!106039 () Bool)

(assert (=> b!66670 m!106039))

(assert (=> b!66670 m!105151))

(assert (=> b!66148 d!20984))

(declare-fun d!20986 () Bool)

(declare-fun res!55227 () Bool)

(declare-fun e!43741 () Bool)

(assert (=> d!20986 (=> (not res!55227) (not e!43741))))

(assert (=> d!20986 (= res!55227 (= (size!1313 (buf!1694 thiss!1379)) (size!1313 (buf!1694 thiss!1379))))))

(assert (=> d!20986 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!43741)))

(declare-fun b!66671 () Bool)

(declare-fun res!55226 () Bool)

(assert (=> b!66671 (=> (not res!55226) (not e!43741))))

(assert (=> b!66671 (= res!55226 (bvsle (bitIndex!0 (size!1313 (buf!1694 thiss!1379)) (currentByte!3366 thiss!1379) (currentBit!3361 thiss!1379)) (bitIndex!0 (size!1313 (buf!1694 thiss!1379)) (currentByte!3366 thiss!1379) (currentBit!3361 thiss!1379))))))

(declare-fun b!66672 () Bool)

(declare-fun e!43742 () Bool)

(assert (=> b!66672 (= e!43741 e!43742)))

(declare-fun res!55228 () Bool)

(assert (=> b!66672 (=> res!55228 e!43742)))

(assert (=> b!66672 (= res!55228 (= (size!1313 (buf!1694 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!66673 () Bool)

(assert (=> b!66673 (= e!43742 (arrayBitRangesEq!0 (buf!1694 thiss!1379) (buf!1694 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1313 (buf!1694 thiss!1379)) (currentByte!3366 thiss!1379) (currentBit!3361 thiss!1379))))))

(assert (= (and d!20986 res!55227) b!66671))

(assert (= (and b!66671 res!55226) b!66672))

(assert (= (and b!66672 (not res!55228)) b!66673))

(assert (=> b!66671 m!105163))

(assert (=> b!66671 m!105163))

(assert (=> b!66673 m!105163))

(assert (=> b!66673 m!105163))

(declare-fun m!106041 () Bool)

(assert (=> b!66673 m!106041))

(assert (=> b!66159 d!20986))

(declare-fun d!20988 () Bool)

(assert (=> d!20988 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!106030 () Unit!4463)

(declare-fun choose!11 (BitStream!2260) Unit!4463)

(assert (=> d!20988 (= lt!106030 (choose!11 thiss!1379))))

(assert (=> d!20988 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!106030)))

(declare-fun bs!5099 () Bool)

(assert (= bs!5099 d!20988))

(assert (=> bs!5099 m!105159))

(declare-fun m!106043 () Bool)

(assert (=> bs!5099 m!106043))

(assert (=> b!66159 d!20988))

(declare-fun d!20990 () Bool)

(declare-fun e!43743 () Bool)

(assert (=> d!20990 e!43743))

(declare-fun res!55229 () Bool)

(assert (=> d!20990 (=> (not res!55229) (not e!43743))))

(declare-fun lt!106031 () (_ BitVec 64))

(declare-fun lt!106035 () (_ BitVec 64))

(declare-fun lt!106033 () (_ BitVec 64))

(assert (=> d!20990 (= res!55229 (= lt!106035 (bvsub lt!106033 lt!106031)))))

(assert (=> d!20990 (or (= (bvand lt!106033 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!106031 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!106033 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!106033 lt!106031) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!20990 (= lt!106031 (remainingBits!0 ((_ sign_extend 32) (size!1313 (buf!1694 thiss!1379))) ((_ sign_extend 32) (currentByte!3366 thiss!1379)) ((_ sign_extend 32) (currentBit!3361 thiss!1379))))))

(declare-fun lt!106034 () (_ BitVec 64))

(declare-fun lt!106036 () (_ BitVec 64))

(assert (=> d!20990 (= lt!106033 (bvmul lt!106034 lt!106036))))

(assert (=> d!20990 (or (= lt!106034 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!106036 (bvsdiv (bvmul lt!106034 lt!106036) lt!106034)))))

(assert (=> d!20990 (= lt!106036 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!20990 (= lt!106034 ((_ sign_extend 32) (size!1313 (buf!1694 thiss!1379))))))

(assert (=> d!20990 (= lt!106035 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3366 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3361 thiss!1379))))))

(assert (=> d!20990 (invariant!0 (currentBit!3361 thiss!1379) (currentByte!3366 thiss!1379) (size!1313 (buf!1694 thiss!1379)))))

(assert (=> d!20990 (= (bitIndex!0 (size!1313 (buf!1694 thiss!1379)) (currentByte!3366 thiss!1379) (currentBit!3361 thiss!1379)) lt!106035)))

(declare-fun b!66674 () Bool)

(declare-fun res!55230 () Bool)

(assert (=> b!66674 (=> (not res!55230) (not e!43743))))

(assert (=> b!66674 (= res!55230 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!106035))))

(declare-fun b!66675 () Bool)

(declare-fun lt!106032 () (_ BitVec 64))

(assert (=> b!66675 (= e!43743 (bvsle lt!106035 (bvmul lt!106032 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!66675 (or (= lt!106032 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!106032 #b0000000000000000000000000000000000000000000000000000000000001000) lt!106032)))))

(assert (=> b!66675 (= lt!106032 ((_ sign_extend 32) (size!1313 (buf!1694 thiss!1379))))))

(assert (= (and d!20990 res!55229) b!66674))

(assert (= (and b!66674 res!55230) b!66675))

(assert (=> d!20990 m!105999))

(declare-fun m!106045 () Bool)

(assert (=> d!20990 m!106045))

(assert (=> b!66159 d!20990))

(declare-fun d!20992 () Bool)

(assert (=> d!20992 (= (array_inv!1189 srcBuffer!2) (bvsge (size!1313 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!12882 d!20992))

(declare-fun d!20994 () Bool)

(assert (=> d!20994 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3361 thiss!1379) (currentByte!3366 thiss!1379) (size!1313 (buf!1694 thiss!1379))))))

(declare-fun bs!5100 () Bool)

(assert (= bs!5100 d!20994))

(assert (=> bs!5100 m!106045))

(assert (=> start!12882 d!20994))

(declare-fun d!20996 () Bool)

(assert (=> d!20996 (= (array_inv!1189 (buf!1694 thiss!1379)) (bvsge (size!1313 (buf!1694 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!66160 d!20996))

(declare-fun d!20998 () Bool)

(assert (=> d!20998 (= (invariant!0 (currentBit!3361 (_2!3039 lt!104935)) (currentByte!3366 (_2!3039 lt!104935)) (size!1313 (buf!1694 (_2!3039 lt!104927)))) (and (bvsge (currentBit!3361 (_2!3039 lt!104935)) #b00000000000000000000000000000000) (bvslt (currentBit!3361 (_2!3039 lt!104935)) #b00000000000000000000000000001000) (bvsge (currentByte!3366 (_2!3039 lt!104935)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3366 (_2!3039 lt!104935)) (size!1313 (buf!1694 (_2!3039 lt!104927)))) (and (= (currentBit!3361 (_2!3039 lt!104935)) #b00000000000000000000000000000000) (= (currentByte!3366 (_2!3039 lt!104935)) (size!1313 (buf!1694 (_2!3039 lt!104927))))))))))

(assert (=> b!66150 d!20998))

(declare-fun d!21000 () Bool)

(assert (=> d!21000 (= (invariant!0 (currentBit!3361 (_2!3039 lt!104935)) (currentByte!3366 (_2!3039 lt!104935)) (size!1313 (buf!1694 (_2!3039 lt!104935)))) (and (bvsge (currentBit!3361 (_2!3039 lt!104935)) #b00000000000000000000000000000000) (bvslt (currentBit!3361 (_2!3039 lt!104935)) #b00000000000000000000000000001000) (bvsge (currentByte!3366 (_2!3039 lt!104935)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3366 (_2!3039 lt!104935)) (size!1313 (buf!1694 (_2!3039 lt!104935)))) (and (= (currentBit!3361 (_2!3039 lt!104935)) #b00000000000000000000000000000000) (= (currentByte!3366 (_2!3039 lt!104935)) (size!1313 (buf!1694 (_2!3039 lt!104935))))))))))

(assert (=> b!66161 d!21000))

(declare-fun d!21002 () Bool)

(assert (=> d!21002 (= (bitAt!0 (buf!1694 (_1!3040 lt!104931)) lt!104925) (not (= (bvand ((_ sign_extend 24) (select (arr!1877 (buf!1694 (_1!3040 lt!104931))) ((_ extract 31 0) (bvsdiv lt!104925 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!104925 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5101 () Bool)

(assert (= bs!5101 d!21002))

(declare-fun m!106047 () Bool)

(assert (=> bs!5101 m!106047))

(assert (=> bs!5101 m!106003))

(assert (=> b!66162 d!21002))

(declare-fun d!21004 () Bool)

(assert (=> d!21004 (= (bitAt!0 (buf!1694 (_1!3040 lt!104942)) lt!104925) (not (= (bvand ((_ sign_extend 24) (select (arr!1877 (buf!1694 (_1!3040 lt!104942))) ((_ extract 31 0) (bvsdiv lt!104925 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!104925 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5102 () Bool)

(assert (= bs!5102 d!21004))

(declare-fun m!106049 () Bool)

(assert (=> bs!5102 m!106049))

(assert (=> bs!5102 m!106003))

(assert (=> b!66162 d!21004))

(declare-fun d!21006 () Bool)

(assert (=> d!21006 (= (head!524 (byteArrayBitContentToList!0 (_2!3039 lt!104927) srcBuffer!2 i!635 (bvsub to!314 i!635))) (h!820 (byteArrayBitContentToList!0 (_2!3039 lt!104927) srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(assert (=> b!66151 d!21006))

(declare-fun d!21008 () Bool)

(declare-fun c!4859 () Bool)

(assert (=> d!21008 (= c!4859 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!43744 () List!705)

(assert (=> d!21008 (= (byteArrayBitContentToList!0 (_2!3039 lt!104927) srcBuffer!2 i!635 (bvsub to!314 i!635)) e!43744)))

(declare-fun b!66676 () Bool)

(assert (=> b!66676 (= e!43744 Nil!702)))

(declare-fun b!66677 () Bool)

(assert (=> b!66677 (= e!43744 (Cons!701 (not (= (bvand ((_ sign_extend 24) (select (arr!1877 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!3039 lt!104927) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!21008 c!4859) b!66676))

(assert (= (and d!21008 (not c!4859)) b!66677))

(assert (=> b!66677 m!105077))

(assert (=> b!66677 m!105557))

(declare-fun m!106051 () Bool)

(assert (=> b!66677 m!106051))

(assert (=> b!66151 d!21008))

(declare-fun d!21010 () Bool)

(assert (=> d!21010 (= (bitAt!0 srcBuffer!2 i!635) (not (= (bvand ((_ sign_extend 24) (select (arr!1877 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5103 () Bool)

(assert (= bs!5103 d!21010))

(assert (=> bs!5103 m!105077))

(assert (=> bs!5103 m!105557))

(assert (=> b!66151 d!21010))

(push 1)

(assert (not d!20962))

(assert (not b!66652))

(assert (not b!66610))

(assert (not b!66391))

(assert (not b!66673))

(assert (not d!20970))

(assert (not d!20808))

(assert (not b!66411))

(assert (not d!20832))

(assert (not b!66368))

(assert (not b!66648))

(assert (not d!20960))

(assert (not b!66373))

(assert (not b!66393))

(assert (not b!66609))

(assert (not b!66372))

(assert (not d!20978))

(assert (not b!66412))

(assert (not d!20830))

(assert (not b!66375))

(assert (not b!66602))

(assert (not b!66605))

(assert (not bm!847))

(assert (not d!20958))

(assert (not b!66670))

(assert (not b!66649))

(assert (not d!20990))

(assert (not b!66653))

(assert (not b!66377))

(assert (not d!20968))

(assert (not b!66604))

(assert (not d!20844))

(assert (not b!66626))

(assert (not b!66409))

(assert (not b!66369))

(assert (not b!66671))

(assert (not b!66592))

(assert (not d!20950))

(assert (not b!66388))

(assert (not b!66606))

(assert (not b!66589))

(assert (not d!20834))

(assert (not d!20976))

(assert (not d!20980))

(assert (not b!66607))

(assert (not b!66621))

(assert (not b!66374))

(assert (not b!66413))

(assert (not b!66594))

(assert (not d!20822))

(assert (not d!20846))

(assert (not d!20994))

(assert (not d!20988))

(assert (not b!66677))

(assert (not b!66654))

(assert (not b!66650))

(assert (not b!66593))

(assert (not b!66389))

(assert (not b!66595))

(assert (not b!66370))

(assert (not d!20954))

(assert (not b!66392))

(assert (not b!66612))

(assert (not b!66387))

(assert (not b!66655))

(assert (not d!20824))

(assert (not b!66623))

(assert (not b!66588))

(assert (not d!20984))

(assert (not b!66651))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

