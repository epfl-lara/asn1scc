; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6006 () Bool)

(assert start!6006)

(declare-fun b!28068 () Bool)

(declare-fun e!18919 () Bool)

(assert (=> b!28068 (= e!18919 true)))

(declare-fun lt!39562 () (_ BitVec 64))

(declare-datatypes ((array!1743 0))(
  ( (array!1744 (arr!1216 (Array (_ BitVec 32) (_ BitVec 8))) (size!754 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1340 0))(
  ( (BitStream!1341 (buf!1081 array!1743) (currentByte!2406 (_ BitVec 32)) (currentBit!2401 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!3046 0))(
  ( (tuple2!3047 (_1!1610 BitStream!1340) (_2!1610 BitStream!1340)) )
))
(declare-fun lt!39563 () tuple2!3046)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!28068 (= lt!39562 (bitIndex!0 (size!754 (buf!1081 (_1!1610 lt!39563))) (currentByte!2406 (_1!1610 lt!39563)) (currentBit!2401 (_1!1610 lt!39563))))))

(declare-fun lt!39552 () (_ BitVec 64))

(declare-fun lt!39557 () tuple2!3046)

(assert (=> b!28068 (= lt!39552 (bitIndex!0 (size!754 (buf!1081 (_1!1610 lt!39557))) (currentByte!2406 (_1!1610 lt!39557)) (currentBit!2401 (_1!1610 lt!39557))))))

(declare-fun b!28069 () Bool)

(declare-fun e!18920 () Bool)

(declare-fun e!18917 () Bool)

(assert (=> b!28069 (= e!18920 e!18917)))

(declare-fun res!24348 () Bool)

(assert (=> b!28069 (=> res!24348 e!18917)))

(declare-datatypes ((Unit!2211 0))(
  ( (Unit!2212) )
))
(declare-datatypes ((tuple2!3048 0))(
  ( (tuple2!3049 (_1!1611 Unit!2211) (_2!1611 BitStream!1340)) )
))
(declare-fun lt!39553 () tuple2!3048)

(declare-fun lt!39566 () tuple2!3048)

(declare-fun isPrefixOf!0 (BitStream!1340 BitStream!1340) Bool)

(assert (=> b!28069 (= res!24348 (not (isPrefixOf!0 (_2!1611 lt!39553) (_2!1611 lt!39566))))))

(declare-fun thiss!1379 () BitStream!1340)

(assert (=> b!28069 (isPrefixOf!0 thiss!1379 (_2!1611 lt!39566))))

(declare-fun lt!39567 () Unit!2211)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1340 BitStream!1340 BitStream!1340) Unit!2211)

(assert (=> b!28069 (= lt!39567 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1611 lt!39553) (_2!1611 lt!39566)))))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun srcBuffer!2 () array!1743)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1340 array!1743 (_ BitVec 64) (_ BitVec 64)) tuple2!3048)

(assert (=> b!28069 (= lt!39566 (appendBitsMSBFirstLoop!0 (_2!1611 lt!39553) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!18925 () Bool)

(assert (=> b!28069 e!18925))

(declare-fun res!24346 () Bool)

(assert (=> b!28069 (=> (not res!24346) (not e!18925))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!28069 (= res!24346 (validate_offset_bits!1 ((_ sign_extend 32) (size!754 (buf!1081 (_2!1611 lt!39553)))) ((_ sign_extend 32) (currentByte!2406 thiss!1379)) ((_ sign_extend 32) (currentBit!2401 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!39561 () Unit!2211)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1340 array!1743 (_ BitVec 64)) Unit!2211)

(assert (=> b!28069 (= lt!39561 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1081 (_2!1611 lt!39553)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!39556 () tuple2!3046)

(declare-fun reader!0 (BitStream!1340 BitStream!1340) tuple2!3046)

(assert (=> b!28069 (= lt!39556 (reader!0 thiss!1379 (_2!1611 lt!39553)))))

(declare-fun b!28070 () Bool)

(declare-fun e!18922 () Bool)

(assert (=> b!28070 (= e!18922 e!18919)))

(declare-fun res!24337 () Bool)

(assert (=> b!28070 (=> res!24337 e!18919)))

(assert (=> b!28070 (= res!24337 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!39551 () (_ BitVec 64))

(declare-datatypes ((List!371 0))(
  ( (Nil!368) (Cons!367 (h!486 Bool) (t!1121 List!371)) )
))
(declare-fun lt!39555 () List!371)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1340 BitStream!1340 (_ BitVec 64)) List!371)

(assert (=> b!28070 (= lt!39555 (bitStreamReadBitsIntoList!0 (_2!1611 lt!39566) (_1!1610 lt!39563) lt!39551))))

(declare-fun lt!39560 () List!371)

(assert (=> b!28070 (= lt!39560 (bitStreamReadBitsIntoList!0 (_2!1611 lt!39566) (_1!1610 lt!39557) (bvsub to!314 i!635)))))

(assert (=> b!28070 (validate_offset_bits!1 ((_ sign_extend 32) (size!754 (buf!1081 (_2!1611 lt!39566)))) ((_ sign_extend 32) (currentByte!2406 (_2!1611 lt!39553))) ((_ sign_extend 32) (currentBit!2401 (_2!1611 lt!39553))) lt!39551)))

(declare-fun lt!39564 () Unit!2211)

(assert (=> b!28070 (= lt!39564 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1611 lt!39553) (buf!1081 (_2!1611 lt!39566)) lt!39551))))

(assert (=> b!28070 (= lt!39563 (reader!0 (_2!1611 lt!39553) (_2!1611 lt!39566)))))

(assert (=> b!28070 (validate_offset_bits!1 ((_ sign_extend 32) (size!754 (buf!1081 (_2!1611 lt!39566)))) ((_ sign_extend 32) (currentByte!2406 thiss!1379)) ((_ sign_extend 32) (currentBit!2401 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!39554 () Unit!2211)

(assert (=> b!28070 (= lt!39554 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1081 (_2!1611 lt!39566)) (bvsub to!314 i!635)))))

(assert (=> b!28070 (= lt!39557 (reader!0 thiss!1379 (_2!1611 lt!39566)))))

(declare-fun b!28071 () Bool)

(declare-fun res!24340 () Bool)

(assert (=> b!28071 (=> res!24340 e!18919)))

(declare-fun length!97 (List!371) Int)

(assert (=> b!28071 (= res!24340 (<= (length!97 lt!39560) 0))))

(declare-fun b!28072 () Bool)

(declare-fun res!24349 () Bool)

(assert (=> b!28072 (=> res!24349 e!18922)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!28072 (= res!24349 (not (invariant!0 (currentBit!2401 (_2!1611 lt!39553)) (currentByte!2406 (_2!1611 lt!39553)) (size!754 (buf!1081 (_2!1611 lt!39566))))))))

(declare-fun b!28073 () Bool)

(declare-fun res!24344 () Bool)

(assert (=> b!28073 (=> res!24344 e!18919)))

(assert (=> b!28073 (= res!24344 (not (isPrefixOf!0 (_1!1610 lt!39563) (_2!1611 lt!39566))))))

(declare-fun b!28074 () Bool)

(declare-fun head!208 (List!371) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1340 array!1743 (_ BitVec 64) (_ BitVec 64)) List!371)

(assert (=> b!28074 (= e!18925 (= (head!208 (byteArrayBitContentToList!0 (_2!1611 lt!39553) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!208 (bitStreamReadBitsIntoList!0 (_2!1611 lt!39553) (_1!1610 lt!39556) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun res!24334 () Bool)

(declare-fun e!18927 () Bool)

(assert (=> start!6006 (=> (not res!24334) (not e!18927))))

(assert (=> start!6006 (= res!24334 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!754 srcBuffer!2))))))))

(assert (=> start!6006 e!18927))

(assert (=> start!6006 true))

(declare-fun array_inv!723 (array!1743) Bool)

(assert (=> start!6006 (array_inv!723 srcBuffer!2)))

(declare-fun e!18918 () Bool)

(declare-fun inv!12 (BitStream!1340) Bool)

(assert (=> start!6006 (and (inv!12 thiss!1379) e!18918)))

(declare-fun b!28075 () Bool)

(declare-fun res!24336 () Bool)

(declare-fun e!18921 () Bool)

(assert (=> b!28075 (=> res!24336 e!18921)))

(assert (=> b!28075 (= res!24336 (not (= (size!754 (buf!1081 thiss!1379)) (size!754 (buf!1081 (_2!1611 lt!39566))))))))

(declare-fun b!28076 () Bool)

(assert (=> b!28076 (= e!18917 e!18921)))

(declare-fun res!24342 () Bool)

(assert (=> b!28076 (=> res!24342 e!18921)))

(declare-fun lt!39565 () (_ BitVec 64))

(declare-fun lt!39558 () (_ BitVec 64))

(assert (=> b!28076 (= res!24342 (not (= lt!39558 (bvsub (bvadd lt!39565 to!314) i!635))))))

(assert (=> b!28076 (= lt!39558 (bitIndex!0 (size!754 (buf!1081 (_2!1611 lt!39566))) (currentByte!2406 (_2!1611 lt!39566)) (currentBit!2401 (_2!1611 lt!39566))))))

(declare-fun b!28077 () Bool)

(assert (=> b!28077 (= e!18918 (array_inv!723 (buf!1081 thiss!1379)))))

(declare-fun b!28078 () Bool)

(assert (=> b!28078 (= e!18921 e!18922)))

(declare-fun res!24350 () Bool)

(assert (=> b!28078 (=> res!24350 e!18922)))

(assert (=> b!28078 (= res!24350 (not (= (size!754 (buf!1081 (_2!1611 lt!39553))) (size!754 (buf!1081 (_2!1611 lt!39566))))))))

(declare-fun e!18926 () Bool)

(assert (=> b!28078 e!18926))

(declare-fun res!24345 () Bool)

(assert (=> b!28078 (=> (not res!24345) (not e!18926))))

(assert (=> b!28078 (= res!24345 (= (size!754 (buf!1081 (_2!1611 lt!39566))) (size!754 (buf!1081 thiss!1379))))))

(declare-fun b!28079 () Bool)

(declare-fun e!18923 () Bool)

(assert (=> b!28079 (= e!18927 (not e!18923))))

(declare-fun res!24347 () Bool)

(assert (=> b!28079 (=> res!24347 e!18923)))

(assert (=> b!28079 (= res!24347 (bvsge i!635 to!314))))

(assert (=> b!28079 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!39568 () Unit!2211)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1340) Unit!2211)

(assert (=> b!28079 (= lt!39568 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!28079 (= lt!39565 (bitIndex!0 (size!754 (buf!1081 thiss!1379)) (currentByte!2406 thiss!1379) (currentBit!2401 thiss!1379)))))

(declare-fun b!28080 () Bool)

(declare-fun res!24335 () Bool)

(assert (=> b!28080 (=> res!24335 e!18919)))

(assert (=> b!28080 (= res!24335 (not (isPrefixOf!0 (_1!1610 lt!39557) (_2!1611 lt!39566))))))

(declare-fun b!28081 () Bool)

(declare-fun res!24341 () Bool)

(assert (=> b!28081 (=> res!24341 e!18922)))

(assert (=> b!28081 (= res!24341 (not (invariant!0 (currentBit!2401 (_2!1611 lt!39553)) (currentByte!2406 (_2!1611 lt!39553)) (size!754 (buf!1081 (_2!1611 lt!39553))))))))

(declare-fun b!28082 () Bool)

(assert (=> b!28082 (= e!18926 (= lt!39558 (bvsub (bvsub (bvadd (bitIndex!0 (size!754 (buf!1081 (_2!1611 lt!39553))) (currentByte!2406 (_2!1611 lt!39553)) (currentBit!2401 (_2!1611 lt!39553))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!28083 () Bool)

(declare-fun res!24343 () Bool)

(assert (=> b!28083 (=> res!24343 e!18919)))

(assert (=> b!28083 (= res!24343 (not (isPrefixOf!0 (_1!1610 lt!39557) (_1!1610 lt!39563))))))

(declare-fun b!28084 () Bool)

(assert (=> b!28084 (= e!18923 e!18920)))

(declare-fun res!24339 () Bool)

(assert (=> b!28084 (=> res!24339 e!18920)))

(assert (=> b!28084 (= res!24339 (not (isPrefixOf!0 thiss!1379 (_2!1611 lt!39553))))))

(assert (=> b!28084 (validate_offset_bits!1 ((_ sign_extend 32) (size!754 (buf!1081 (_2!1611 lt!39553)))) ((_ sign_extend 32) (currentByte!2406 (_2!1611 lt!39553))) ((_ sign_extend 32) (currentBit!2401 (_2!1611 lt!39553))) lt!39551)))

(assert (=> b!28084 (= lt!39551 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!39559 () Unit!2211)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1340 BitStream!1340 (_ BitVec 64) (_ BitVec 64)) Unit!2211)

(assert (=> b!28084 (= lt!39559 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1611 lt!39553) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1340 (_ BitVec 8) (_ BitVec 32)) tuple2!3048)

(assert (=> b!28084 (= lt!39553 (appendBitFromByte!0 thiss!1379 (select (arr!1216 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!28085 () Bool)

(declare-fun res!24338 () Bool)

(assert (=> b!28085 (=> res!24338 e!18921)))

(assert (=> b!28085 (= res!24338 (not (invariant!0 (currentBit!2401 (_2!1611 lt!39566)) (currentByte!2406 (_2!1611 lt!39566)) (size!754 (buf!1081 (_2!1611 lt!39566))))))))

(declare-fun b!28086 () Bool)

(declare-fun res!24333 () Bool)

(assert (=> b!28086 (=> res!24333 e!18919)))

(assert (=> b!28086 (= res!24333 (or (not (= (buf!1081 (_1!1610 lt!39557)) (buf!1081 (_1!1610 lt!39563)))) (not (= (buf!1081 (_1!1610 lt!39557)) (buf!1081 (_2!1611 lt!39566)))) (bvsge lt!39558 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 (bvsub to!314 i!635)))))))

(declare-fun b!28087 () Bool)

(declare-fun res!24351 () Bool)

(assert (=> b!28087 (=> (not res!24351) (not e!18927))))

(assert (=> b!28087 (= res!24351 (validate_offset_bits!1 ((_ sign_extend 32) (size!754 (buf!1081 thiss!1379))) ((_ sign_extend 32) (currentByte!2406 thiss!1379)) ((_ sign_extend 32) (currentBit!2401 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!6006 res!24334) b!28087))

(assert (= (and b!28087 res!24351) b!28079))

(assert (= (and b!28079 (not res!24347)) b!28084))

(assert (= (and b!28084 (not res!24339)) b!28069))

(assert (= (and b!28069 res!24346) b!28074))

(assert (= (and b!28069 (not res!24348)) b!28076))

(assert (= (and b!28076 (not res!24342)) b!28085))

(assert (= (and b!28085 (not res!24338)) b!28075))

(assert (= (and b!28075 (not res!24336)) b!28078))

(assert (= (and b!28078 res!24345) b!28082))

(assert (= (and b!28078 (not res!24350)) b!28081))

(assert (= (and b!28081 (not res!24341)) b!28072))

(assert (= (and b!28072 (not res!24349)) b!28070))

(assert (= (and b!28070 (not res!24337)) b!28071))

(assert (= (and b!28071 (not res!24340)) b!28080))

(assert (= (and b!28080 (not res!24335)) b!28073))

(assert (= (and b!28073 (not res!24344)) b!28083))

(assert (= (and b!28083 (not res!24343)) b!28086))

(assert (= (and b!28086 (not res!24333)) b!28068))

(assert (= start!6006 b!28077))

(declare-fun m!40197 () Bool)

(assert (=> b!28083 m!40197))

(declare-fun m!40199 () Bool)

(assert (=> b!28087 m!40199))

(declare-fun m!40201 () Bool)

(assert (=> b!28081 m!40201))

(declare-fun m!40203 () Bool)

(assert (=> b!28080 m!40203))

(declare-fun m!40205 () Bool)

(assert (=> b!28074 m!40205))

(assert (=> b!28074 m!40205))

(declare-fun m!40207 () Bool)

(assert (=> b!28074 m!40207))

(declare-fun m!40209 () Bool)

(assert (=> b!28074 m!40209))

(assert (=> b!28074 m!40209))

(declare-fun m!40211 () Bool)

(assert (=> b!28074 m!40211))

(declare-fun m!40213 () Bool)

(assert (=> b!28076 m!40213))

(declare-fun m!40215 () Bool)

(assert (=> b!28070 m!40215))

(declare-fun m!40217 () Bool)

(assert (=> b!28070 m!40217))

(declare-fun m!40219 () Bool)

(assert (=> b!28070 m!40219))

(declare-fun m!40221 () Bool)

(assert (=> b!28070 m!40221))

(declare-fun m!40223 () Bool)

(assert (=> b!28070 m!40223))

(declare-fun m!40225 () Bool)

(assert (=> b!28070 m!40225))

(declare-fun m!40227 () Bool)

(assert (=> b!28070 m!40227))

(declare-fun m!40229 () Bool)

(assert (=> b!28070 m!40229))

(declare-fun m!40231 () Bool)

(assert (=> b!28084 m!40231))

(declare-fun m!40233 () Bool)

(assert (=> b!28084 m!40233))

(declare-fun m!40235 () Bool)

(assert (=> b!28084 m!40235))

(declare-fun m!40237 () Bool)

(assert (=> b!28084 m!40237))

(assert (=> b!28084 m!40233))

(declare-fun m!40239 () Bool)

(assert (=> b!28084 m!40239))

(declare-fun m!40241 () Bool)

(assert (=> b!28085 m!40241))

(declare-fun m!40243 () Bool)

(assert (=> b!28071 m!40243))

(declare-fun m!40245 () Bool)

(assert (=> b!28069 m!40245))

(declare-fun m!40247 () Bool)

(assert (=> b!28069 m!40247))

(declare-fun m!40249 () Bool)

(assert (=> b!28069 m!40249))

(declare-fun m!40251 () Bool)

(assert (=> b!28069 m!40251))

(declare-fun m!40253 () Bool)

(assert (=> b!28069 m!40253))

(declare-fun m!40255 () Bool)

(assert (=> b!28069 m!40255))

(declare-fun m!40257 () Bool)

(assert (=> b!28069 m!40257))

(declare-fun m!40259 () Bool)

(assert (=> b!28079 m!40259))

(declare-fun m!40261 () Bool)

(assert (=> b!28079 m!40261))

(declare-fun m!40263 () Bool)

(assert (=> b!28079 m!40263))

(declare-fun m!40265 () Bool)

(assert (=> b!28072 m!40265))

(declare-fun m!40267 () Bool)

(assert (=> start!6006 m!40267))

(declare-fun m!40269 () Bool)

(assert (=> start!6006 m!40269))

(declare-fun m!40271 () Bool)

(assert (=> b!28082 m!40271))

(declare-fun m!40273 () Bool)

(assert (=> b!28068 m!40273))

(declare-fun m!40275 () Bool)

(assert (=> b!28068 m!40275))

(declare-fun m!40277 () Bool)

(assert (=> b!28077 m!40277))

(declare-fun m!40279 () Bool)

(assert (=> b!28073 m!40279))

(push 1)

(assert (not b!28070))

(assert (not b!28087))

(assert (not b!28084))

(assert (not b!28073))

(assert (not b!28068))

(assert (not b!28071))

(assert (not b!28077))

(assert (not b!28076))

(assert (not b!28082))

(assert (not b!28080))

(assert (not b!28081))

(assert (not b!28083))

(assert (not b!28079))

(assert (not b!28074))

(assert (not start!6006))

(assert (not b!28069))

(assert (not b!28072))

(assert (not b!28085))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

