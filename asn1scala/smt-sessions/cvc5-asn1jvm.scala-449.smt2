; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11886 () Bool)

(assert start!11886)

(declare-fun b!60214 () Bool)

(declare-fun e!40157 () Bool)

(declare-fun e!40161 () Bool)

(assert (=> b!60214 (= e!40157 (not e!40161))))

(declare-fun res!50197 () Bool)

(assert (=> b!60214 (=> res!50197 e!40161)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!60214 (= res!50197 (bvsge i!635 to!314))))

(declare-datatypes ((array!2743 0))(
  ( (array!2744 (arr!1811 (Array (_ BitVec 32) (_ BitVec 8))) (size!1247 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2182 0))(
  ( (BitStream!2183 (buf!1628 array!2743) (currentByte!3246 (_ BitVec 32)) (currentBit!3241 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2182)

(declare-fun isPrefixOf!0 (BitStream!2182 BitStream!2182) Bool)

(assert (=> b!60214 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!4117 0))(
  ( (Unit!4118) )
))
(declare-fun lt!94077 () Unit!4117)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2182) Unit!4117)

(assert (=> b!60214 (= lt!94077 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!94078 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!60214 (= lt!94078 (bitIndex!0 (size!1247 (buf!1628 thiss!1379)) (currentByte!3246 thiss!1379) (currentBit!3241 thiss!1379)))))

(declare-fun b!60215 () Bool)

(declare-fun res!50198 () Bool)

(declare-fun e!40153 () Bool)

(assert (=> b!60215 (=> res!50198 e!40153)))

(declare-datatypes ((tuple2!5486 0))(
  ( (tuple2!5487 (_1!2854 Unit!4117) (_2!2854 BitStream!2182)) )
))
(declare-fun lt!94069 () tuple2!5486)

(declare-fun lt!94075 () tuple2!5486)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!60215 (= res!50198 (not (invariant!0 (currentBit!3241 (_2!2854 lt!94069)) (currentByte!3246 (_2!2854 lt!94069)) (size!1247 (buf!1628 (_2!2854 lt!94075))))))))

(declare-fun b!60216 () Bool)

(declare-fun e!40155 () Bool)

(declare-fun e!40158 () Bool)

(assert (=> b!60216 (= e!40155 e!40158)))

(declare-fun res!50186 () Bool)

(assert (=> b!60216 (=> res!50186 e!40158)))

(declare-fun lt!94072 () (_ BitVec 64))

(assert (=> b!60216 (= res!50186 (not (= lt!94072 (bvsub (bvadd lt!94078 to!314) i!635))))))

(assert (=> b!60216 (= lt!94072 (bitIndex!0 (size!1247 (buf!1628 (_2!2854 lt!94075))) (currentByte!3246 (_2!2854 lt!94075)) (currentBit!3241 (_2!2854 lt!94075))))))

(declare-fun b!60217 () Bool)

(declare-fun e!40160 () Bool)

(declare-fun array_inv!1150 (array!2743) Bool)

(assert (=> b!60217 (= e!40160 (array_inv!1150 (buf!1628 thiss!1379)))))

(declare-fun res!50193 () Bool)

(assert (=> start!11886 (=> (not res!50193) (not e!40157))))

(declare-fun srcBuffer!2 () array!2743)

(assert (=> start!11886 (= res!50193 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1247 srcBuffer!2))))))))

(assert (=> start!11886 e!40157))

(assert (=> start!11886 true))

(assert (=> start!11886 (array_inv!1150 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2182) Bool)

(assert (=> start!11886 (and (inv!12 thiss!1379) e!40160)))

(declare-fun b!60218 () Bool)

(declare-fun e!40154 () Bool)

(assert (=> b!60218 (= e!40154 e!40155)))

(declare-fun res!50196 () Bool)

(assert (=> b!60218 (=> res!50196 e!40155)))

(assert (=> b!60218 (= res!50196 (not (isPrefixOf!0 (_2!2854 lt!94069) (_2!2854 lt!94075))))))

(assert (=> b!60218 (isPrefixOf!0 thiss!1379 (_2!2854 lt!94075))))

(declare-fun lt!94067 () Unit!4117)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2182 BitStream!2182 BitStream!2182) Unit!4117)

(assert (=> b!60218 (= lt!94067 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2854 lt!94069) (_2!2854 lt!94075)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2182 array!2743 (_ BitVec 64) (_ BitVec 64)) tuple2!5486)

(assert (=> b!60218 (= lt!94075 (appendBitsMSBFirstLoop!0 (_2!2854 lt!94069) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!40162 () Bool)

(assert (=> b!60218 e!40162))

(declare-fun res!50191 () Bool)

(assert (=> b!60218 (=> (not res!50191) (not e!40162))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!60218 (= res!50191 (validate_offset_bits!1 ((_ sign_extend 32) (size!1247 (buf!1628 (_2!2854 lt!94069)))) ((_ sign_extend 32) (currentByte!3246 thiss!1379)) ((_ sign_extend 32) (currentBit!3241 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!94066 () Unit!4117)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2182 array!2743 (_ BitVec 64)) Unit!4117)

(assert (=> b!60218 (= lt!94066 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1628 (_2!2854 lt!94069)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!5488 0))(
  ( (tuple2!5489 (_1!2855 BitStream!2182) (_2!2855 BitStream!2182)) )
))
(declare-fun lt!94064 () tuple2!5488)

(declare-fun reader!0 (BitStream!2182 BitStream!2182) tuple2!5488)

(assert (=> b!60218 (= lt!94064 (reader!0 thiss!1379 (_2!2854 lt!94069)))))

(declare-fun b!60219 () Bool)

(assert (=> b!60219 (= e!40161 e!40154)))

(declare-fun res!50187 () Bool)

(assert (=> b!60219 (=> res!50187 e!40154)))

(assert (=> b!60219 (= res!50187 (not (isPrefixOf!0 thiss!1379 (_2!2854 lt!94069))))))

(declare-fun lt!94070 () (_ BitVec 64))

(assert (=> b!60219 (validate_offset_bits!1 ((_ sign_extend 32) (size!1247 (buf!1628 (_2!2854 lt!94069)))) ((_ sign_extend 32) (currentByte!3246 (_2!2854 lt!94069))) ((_ sign_extend 32) (currentBit!3241 (_2!2854 lt!94069))) lt!94070)))

(assert (=> b!60219 (= lt!94070 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!94065 () Unit!4117)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2182 BitStream!2182 (_ BitVec 64) (_ BitVec 64)) Unit!4117)

(assert (=> b!60219 (= lt!94065 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2854 lt!94069) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2182 (_ BitVec 8) (_ BitVec 32)) tuple2!5486)

(assert (=> b!60219 (= lt!94069 (appendBitFromByte!0 thiss!1379 (select (arr!1811 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!60220 () Bool)

(declare-fun res!50192 () Bool)

(assert (=> b!60220 (=> (not res!50192) (not e!40157))))

(assert (=> b!60220 (= res!50192 (validate_offset_bits!1 ((_ sign_extend 32) (size!1247 (buf!1628 thiss!1379))) ((_ sign_extend 32) (currentByte!3246 thiss!1379)) ((_ sign_extend 32) (currentBit!3241 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!60221 () Bool)

(assert (=> b!60221 (= e!40158 e!40153)))

(declare-fun res!50189 () Bool)

(assert (=> b!60221 (=> res!50189 e!40153)))

(assert (=> b!60221 (= res!50189 (not (= (size!1247 (buf!1628 (_2!2854 lt!94069))) (size!1247 (buf!1628 (_2!2854 lt!94075))))))))

(declare-fun e!40156 () Bool)

(assert (=> b!60221 e!40156))

(declare-fun res!50194 () Bool)

(assert (=> b!60221 (=> (not res!50194) (not e!40156))))

(assert (=> b!60221 (= res!50194 (= (size!1247 (buf!1628 (_2!2854 lt!94075))) (size!1247 (buf!1628 thiss!1379))))))

(declare-fun b!60222 () Bool)

(declare-fun e!40152 () Bool)

(assert (=> b!60222 (= e!40152 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!60223 () Bool)

(assert (=> b!60223 (= e!40156 (= lt!94072 (bvsub (bvsub (bvadd (bitIndex!0 (size!1247 (buf!1628 (_2!2854 lt!94069))) (currentByte!3246 (_2!2854 lt!94069)) (currentBit!3241 (_2!2854 lt!94069))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!60224 () Bool)

(declare-fun res!50199 () Bool)

(assert (=> b!60224 (=> res!50199 e!40153)))

(assert (=> b!60224 (= res!50199 (not (invariant!0 (currentBit!3241 (_2!2854 lt!94069)) (currentByte!3246 (_2!2854 lt!94069)) (size!1247 (buf!1628 (_2!2854 lt!94069))))))))

(declare-fun b!60225 () Bool)

(declare-fun res!50188 () Bool)

(assert (=> b!60225 (=> res!50188 e!40152)))

(declare-datatypes ((List!666 0))(
  ( (Nil!663) (Cons!662 (h!781 Bool) (t!1416 List!666)) )
))
(declare-fun lt!94076 () List!666)

(declare-fun length!294 (List!666) Int)

(assert (=> b!60225 (= res!50188 (<= (length!294 lt!94076) 0))))

(declare-fun b!60226 () Bool)

(declare-fun res!50185 () Bool)

(assert (=> b!60226 (=> res!50185 e!40158)))

(assert (=> b!60226 (= res!50185 (not (= (size!1247 (buf!1628 thiss!1379)) (size!1247 (buf!1628 (_2!2854 lt!94075))))))))

(declare-fun b!60227 () Bool)

(declare-fun res!50190 () Bool)

(assert (=> b!60227 (=> res!50190 e!40158)))

(assert (=> b!60227 (= res!50190 (not (invariant!0 (currentBit!3241 (_2!2854 lt!94075)) (currentByte!3246 (_2!2854 lt!94075)) (size!1247 (buf!1628 (_2!2854 lt!94075))))))))

(declare-fun b!60228 () Bool)

(assert (=> b!60228 (= e!40153 e!40152)))

(declare-fun res!50195 () Bool)

(assert (=> b!60228 (=> res!50195 e!40152)))

(assert (=> b!60228 (= res!50195 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!94071 () List!666)

(declare-fun lt!94074 () tuple2!5488)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2182 BitStream!2182 (_ BitVec 64)) List!666)

(assert (=> b!60228 (= lt!94071 (bitStreamReadBitsIntoList!0 (_2!2854 lt!94075) (_1!2855 lt!94074) lt!94070))))

(declare-fun lt!94068 () tuple2!5488)

(assert (=> b!60228 (= lt!94076 (bitStreamReadBitsIntoList!0 (_2!2854 lt!94075) (_1!2855 lt!94068) (bvsub to!314 i!635)))))

(assert (=> b!60228 (validate_offset_bits!1 ((_ sign_extend 32) (size!1247 (buf!1628 (_2!2854 lt!94075)))) ((_ sign_extend 32) (currentByte!3246 (_2!2854 lt!94069))) ((_ sign_extend 32) (currentBit!3241 (_2!2854 lt!94069))) lt!94070)))

(declare-fun lt!94073 () Unit!4117)

(assert (=> b!60228 (= lt!94073 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2854 lt!94069) (buf!1628 (_2!2854 lt!94075)) lt!94070))))

(assert (=> b!60228 (= lt!94074 (reader!0 (_2!2854 lt!94069) (_2!2854 lt!94075)))))

(assert (=> b!60228 (validate_offset_bits!1 ((_ sign_extend 32) (size!1247 (buf!1628 (_2!2854 lt!94075)))) ((_ sign_extend 32) (currentByte!3246 thiss!1379)) ((_ sign_extend 32) (currentBit!3241 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!94063 () Unit!4117)

(assert (=> b!60228 (= lt!94063 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1628 (_2!2854 lt!94075)) (bvsub to!314 i!635)))))

(assert (=> b!60228 (= lt!94068 (reader!0 thiss!1379 (_2!2854 lt!94075)))))

(declare-fun b!60229 () Bool)

(declare-fun head!485 (List!666) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2182 array!2743 (_ BitVec 64) (_ BitVec 64)) List!666)

(assert (=> b!60229 (= e!40162 (= (head!485 (byteArrayBitContentToList!0 (_2!2854 lt!94069) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!485 (bitStreamReadBitsIntoList!0 (_2!2854 lt!94069) (_1!2855 lt!94064) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and start!11886 res!50193) b!60220))

(assert (= (and b!60220 res!50192) b!60214))

(assert (= (and b!60214 (not res!50197)) b!60219))

(assert (= (and b!60219 (not res!50187)) b!60218))

(assert (= (and b!60218 res!50191) b!60229))

(assert (= (and b!60218 (not res!50196)) b!60216))

(assert (= (and b!60216 (not res!50186)) b!60227))

(assert (= (and b!60227 (not res!50190)) b!60226))

(assert (= (and b!60226 (not res!50185)) b!60221))

(assert (= (and b!60221 res!50194) b!60223))

(assert (= (and b!60221 (not res!50189)) b!60224))

(assert (= (and b!60224 (not res!50199)) b!60215))

(assert (= (and b!60215 (not res!50198)) b!60228))

(assert (= (and b!60228 (not res!50195)) b!60225))

(assert (= (and b!60225 (not res!50188)) b!60222))

(assert (= start!11886 b!60217))

(declare-fun m!94873 () Bool)

(assert (=> b!60220 m!94873))

(declare-fun m!94875 () Bool)

(assert (=> b!60228 m!94875))

(declare-fun m!94877 () Bool)

(assert (=> b!60228 m!94877))

(declare-fun m!94879 () Bool)

(assert (=> b!60228 m!94879))

(declare-fun m!94881 () Bool)

(assert (=> b!60228 m!94881))

(declare-fun m!94883 () Bool)

(assert (=> b!60228 m!94883))

(declare-fun m!94885 () Bool)

(assert (=> b!60228 m!94885))

(declare-fun m!94887 () Bool)

(assert (=> b!60228 m!94887))

(declare-fun m!94889 () Bool)

(assert (=> b!60228 m!94889))

(declare-fun m!94891 () Bool)

(assert (=> b!60218 m!94891))

(declare-fun m!94893 () Bool)

(assert (=> b!60218 m!94893))

(declare-fun m!94895 () Bool)

(assert (=> b!60218 m!94895))

(declare-fun m!94897 () Bool)

(assert (=> b!60218 m!94897))

(declare-fun m!94899 () Bool)

(assert (=> b!60218 m!94899))

(declare-fun m!94901 () Bool)

(assert (=> b!60218 m!94901))

(declare-fun m!94903 () Bool)

(assert (=> b!60218 m!94903))

(declare-fun m!94905 () Bool)

(assert (=> b!60217 m!94905))

(declare-fun m!94907 () Bool)

(assert (=> b!60225 m!94907))

(declare-fun m!94909 () Bool)

(assert (=> b!60223 m!94909))

(declare-fun m!94911 () Bool)

(assert (=> b!60229 m!94911))

(assert (=> b!60229 m!94911))

(declare-fun m!94913 () Bool)

(assert (=> b!60229 m!94913))

(declare-fun m!94915 () Bool)

(assert (=> b!60229 m!94915))

(assert (=> b!60229 m!94915))

(declare-fun m!94917 () Bool)

(assert (=> b!60229 m!94917))

(declare-fun m!94919 () Bool)

(assert (=> b!60224 m!94919))

(declare-fun m!94921 () Bool)

(assert (=> b!60215 m!94921))

(declare-fun m!94923 () Bool)

(assert (=> b!60214 m!94923))

(declare-fun m!94925 () Bool)

(assert (=> b!60214 m!94925))

(declare-fun m!94927 () Bool)

(assert (=> b!60214 m!94927))

(declare-fun m!94929 () Bool)

(assert (=> b!60227 m!94929))

(declare-fun m!94931 () Bool)

(assert (=> b!60219 m!94931))

(declare-fun m!94933 () Bool)

(assert (=> b!60219 m!94933))

(assert (=> b!60219 m!94931))

(declare-fun m!94935 () Bool)

(assert (=> b!60219 m!94935))

(declare-fun m!94937 () Bool)

(assert (=> b!60219 m!94937))

(declare-fun m!94939 () Bool)

(assert (=> b!60219 m!94939))

(declare-fun m!94941 () Bool)

(assert (=> start!11886 m!94941))

(declare-fun m!94943 () Bool)

(assert (=> start!11886 m!94943))

(declare-fun m!94945 () Bool)

(assert (=> b!60216 m!94945))

(push 1)

(assert (not b!60216))

(assert (not b!60224))

(assert (not b!60219))

(assert (not b!60225))

(assert (not b!60228))

(assert (not b!60218))

(assert (not b!60220))

(assert (not start!11886))

(assert (not b!60223))

(assert (not b!60227))

(assert (not b!60229))

(assert (not b!60215))

(assert (not b!60214))

(assert (not b!60217))

(check-sat)

(pop 1)

(push 1)

(check-sat)

