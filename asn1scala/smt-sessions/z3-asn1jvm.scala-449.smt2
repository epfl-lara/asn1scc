; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!11888 () Bool)

(assert start!11888)

(declare-fun b!60262 () Bool)

(declare-fun e!40194 () Bool)

(declare-datatypes ((array!2745 0))(
  ( (array!2746 (arr!1812 (Array (_ BitVec 32) (_ BitVec 8))) (size!1248 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2184 0))(
  ( (BitStream!2185 (buf!1629 array!2745) (currentByte!3247 (_ BitVec 32)) (currentBit!3242 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2184)

(declare-fun array_inv!1151 (array!2745) Bool)

(assert (=> b!60262 (= e!40194 (array_inv!1151 (buf!1629 thiss!1379)))))

(declare-fun b!60263 () Bool)

(declare-fun e!40199 () Bool)

(declare-fun e!40189 () Bool)

(assert (=> b!60263 (= e!40199 e!40189)))

(declare-fun res!50244 () Bool)

(assert (=> b!60263 (=> res!50244 e!40189)))

(declare-fun lt!94113 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!94120 () (_ BitVec 64))

(assert (=> b!60263 (= res!50244 (not (= lt!94113 (bvsub (bvadd lt!94120 to!314) i!635))))))

(declare-datatypes ((Unit!4119 0))(
  ( (Unit!4120) )
))
(declare-datatypes ((tuple2!5490 0))(
  ( (tuple2!5491 (_1!2856 Unit!4119) (_2!2856 BitStream!2184)) )
))
(declare-fun lt!94117 () tuple2!5490)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!60263 (= lt!94113 (bitIndex!0 (size!1248 (buf!1629 (_2!2856 lt!94117))) (currentByte!3247 (_2!2856 lt!94117)) (currentBit!3242 (_2!2856 lt!94117))))))

(declare-fun b!60264 () Bool)

(declare-fun e!40198 () Bool)

(declare-fun e!40193 () Bool)

(assert (=> b!60264 (= e!40198 e!40193)))

(declare-fun res!50235 () Bool)

(assert (=> b!60264 (=> res!50235 e!40193)))

(assert (=> b!60264 (= res!50235 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((List!667 0))(
  ( (Nil!664) (Cons!663 (h!782 Bool) (t!1417 List!667)) )
))
(declare-fun lt!94126 () List!667)

(declare-fun lt!94122 () (_ BitVec 64))

(declare-datatypes ((tuple2!5492 0))(
  ( (tuple2!5493 (_1!2857 BitStream!2184) (_2!2857 BitStream!2184)) )
))
(declare-fun lt!94115 () tuple2!5492)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2184 BitStream!2184 (_ BitVec 64)) List!667)

(assert (=> b!60264 (= lt!94126 (bitStreamReadBitsIntoList!0 (_2!2856 lt!94117) (_1!2857 lt!94115) lt!94122))))

(declare-fun lt!94121 () List!667)

(declare-fun lt!94119 () tuple2!5492)

(assert (=> b!60264 (= lt!94121 (bitStreamReadBitsIntoList!0 (_2!2856 lt!94117) (_1!2857 lt!94119) (bvsub to!314 i!635)))))

(declare-fun lt!94123 () tuple2!5490)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!60264 (validate_offset_bits!1 ((_ sign_extend 32) (size!1248 (buf!1629 (_2!2856 lt!94117)))) ((_ sign_extend 32) (currentByte!3247 (_2!2856 lt!94123))) ((_ sign_extend 32) (currentBit!3242 (_2!2856 lt!94123))) lt!94122)))

(declare-fun lt!94118 () Unit!4119)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2184 array!2745 (_ BitVec 64)) Unit!4119)

(assert (=> b!60264 (= lt!94118 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2856 lt!94123) (buf!1629 (_2!2856 lt!94117)) lt!94122))))

(declare-fun reader!0 (BitStream!2184 BitStream!2184) tuple2!5492)

(assert (=> b!60264 (= lt!94115 (reader!0 (_2!2856 lt!94123) (_2!2856 lt!94117)))))

(assert (=> b!60264 (validate_offset_bits!1 ((_ sign_extend 32) (size!1248 (buf!1629 (_2!2856 lt!94117)))) ((_ sign_extend 32) (currentByte!3247 thiss!1379)) ((_ sign_extend 32) (currentBit!3242 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!94112 () Unit!4119)

(assert (=> b!60264 (= lt!94112 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1629 (_2!2856 lt!94117)) (bvsub to!314 i!635)))))

(assert (=> b!60264 (= lt!94119 (reader!0 thiss!1379 (_2!2856 lt!94117)))))

(declare-fun b!60265 () Bool)

(declare-fun e!40196 () Bool)

(assert (=> b!60265 (= e!40196 e!40199)))

(declare-fun res!50236 () Bool)

(assert (=> b!60265 (=> res!50236 e!40199)))

(declare-fun isPrefixOf!0 (BitStream!2184 BitStream!2184) Bool)

(assert (=> b!60265 (= res!50236 (not (isPrefixOf!0 (_2!2856 lt!94123) (_2!2856 lt!94117))))))

(assert (=> b!60265 (isPrefixOf!0 thiss!1379 (_2!2856 lt!94117))))

(declare-fun lt!94116 () Unit!4119)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2184 BitStream!2184 BitStream!2184) Unit!4119)

(assert (=> b!60265 (= lt!94116 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2856 lt!94123) (_2!2856 lt!94117)))))

(declare-fun srcBuffer!2 () array!2745)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2184 array!2745 (_ BitVec 64) (_ BitVec 64)) tuple2!5490)

(assert (=> b!60265 (= lt!94117 (appendBitsMSBFirstLoop!0 (_2!2856 lt!94123) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!40191 () Bool)

(assert (=> b!60265 e!40191))

(declare-fun res!50243 () Bool)

(assert (=> b!60265 (=> (not res!50243) (not e!40191))))

(assert (=> b!60265 (= res!50243 (validate_offset_bits!1 ((_ sign_extend 32) (size!1248 (buf!1629 (_2!2856 lt!94123)))) ((_ sign_extend 32) (currentByte!3247 thiss!1379)) ((_ sign_extend 32) (currentBit!3242 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!94124 () Unit!4119)

(assert (=> b!60265 (= lt!94124 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1629 (_2!2856 lt!94123)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!94114 () tuple2!5492)

(assert (=> b!60265 (= lt!94114 (reader!0 thiss!1379 (_2!2856 lt!94123)))))

(declare-fun b!60266 () Bool)

(declare-fun res!50230 () Bool)

(assert (=> b!60266 (=> res!50230 e!40189)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!60266 (= res!50230 (not (invariant!0 (currentBit!3242 (_2!2856 lt!94117)) (currentByte!3247 (_2!2856 lt!94117)) (size!1248 (buf!1629 (_2!2856 lt!94117))))))))

(declare-fun b!60267 () Bool)

(declare-fun res!50238 () Bool)

(assert (=> b!60267 (=> res!50238 e!40193)))

(declare-fun length!295 (List!667) Int)

(assert (=> b!60267 (= res!50238 (<= (length!295 lt!94121) 0))))

(declare-fun b!60268 () Bool)

(declare-fun res!50233 () Bool)

(assert (=> b!60268 (=> res!50233 e!40198)))

(assert (=> b!60268 (= res!50233 (not (invariant!0 (currentBit!3242 (_2!2856 lt!94123)) (currentByte!3247 (_2!2856 lt!94123)) (size!1248 (buf!1629 (_2!2856 lt!94123))))))))

(declare-fun res!50239 () Bool)

(declare-fun e!40197 () Bool)

(assert (=> start!11888 (=> (not res!50239) (not e!40197))))

(assert (=> start!11888 (= res!50239 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1248 srcBuffer!2))))))))

(assert (=> start!11888 e!40197))

(assert (=> start!11888 true))

(assert (=> start!11888 (array_inv!1151 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2184) Bool)

(assert (=> start!11888 (and (inv!12 thiss!1379) e!40194)))

(declare-fun b!60269 () Bool)

(declare-fun e!40190 () Bool)

(assert (=> b!60269 (= e!40190 (= lt!94113 (bvsub (bvsub (bvadd (bitIndex!0 (size!1248 (buf!1629 (_2!2856 lt!94123))) (currentByte!3247 (_2!2856 lt!94123)) (currentBit!3242 (_2!2856 lt!94123))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!60270 () Bool)

(declare-fun e!40195 () Bool)

(assert (=> b!60270 (= e!40197 (not e!40195))))

(declare-fun res!50237 () Bool)

(assert (=> b!60270 (=> res!50237 e!40195)))

(assert (=> b!60270 (= res!50237 (bvsge i!635 to!314))))

(assert (=> b!60270 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!94125 () Unit!4119)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2184) Unit!4119)

(assert (=> b!60270 (= lt!94125 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!60270 (= lt!94120 (bitIndex!0 (size!1248 (buf!1629 thiss!1379)) (currentByte!3247 thiss!1379) (currentBit!3242 thiss!1379)))))

(declare-fun b!60271 () Bool)

(declare-fun head!486 (List!667) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2184 array!2745 (_ BitVec 64) (_ BitVec 64)) List!667)

(assert (=> b!60271 (= e!40191 (= (head!486 (byteArrayBitContentToList!0 (_2!2856 lt!94123) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!486 (bitStreamReadBitsIntoList!0 (_2!2856 lt!94123) (_1!2857 lt!94114) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!60272 () Bool)

(assert (=> b!60272 (= e!40195 e!40196)))

(declare-fun res!50242 () Bool)

(assert (=> b!60272 (=> res!50242 e!40196)))

(assert (=> b!60272 (= res!50242 (not (isPrefixOf!0 thiss!1379 (_2!2856 lt!94123))))))

(assert (=> b!60272 (validate_offset_bits!1 ((_ sign_extend 32) (size!1248 (buf!1629 (_2!2856 lt!94123)))) ((_ sign_extend 32) (currentByte!3247 (_2!2856 lt!94123))) ((_ sign_extend 32) (currentBit!3242 (_2!2856 lt!94123))) lt!94122)))

(assert (=> b!60272 (= lt!94122 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!94111 () Unit!4119)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2184 BitStream!2184 (_ BitVec 64) (_ BitVec 64)) Unit!4119)

(assert (=> b!60272 (= lt!94111 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2856 lt!94123) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2184 (_ BitVec 8) (_ BitVec 32)) tuple2!5490)

(assert (=> b!60272 (= lt!94123 (appendBitFromByte!0 thiss!1379 (select (arr!1812 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!60273 () Bool)

(assert (=> b!60273 (= e!40189 e!40198)))

(declare-fun res!50241 () Bool)

(assert (=> b!60273 (=> res!50241 e!40198)))

(assert (=> b!60273 (= res!50241 (not (= (size!1248 (buf!1629 (_2!2856 lt!94123))) (size!1248 (buf!1629 (_2!2856 lt!94117))))))))

(assert (=> b!60273 e!40190))

(declare-fun res!50231 () Bool)

(assert (=> b!60273 (=> (not res!50231) (not e!40190))))

(assert (=> b!60273 (= res!50231 (= (size!1248 (buf!1629 (_2!2856 lt!94117))) (size!1248 (buf!1629 thiss!1379))))))

(declare-fun b!60274 () Bool)

(assert (=> b!60274 (= e!40193 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!60275 () Bool)

(declare-fun res!50232 () Bool)

(assert (=> b!60275 (=> (not res!50232) (not e!40197))))

(assert (=> b!60275 (= res!50232 (validate_offset_bits!1 ((_ sign_extend 32) (size!1248 (buf!1629 thiss!1379))) ((_ sign_extend 32) (currentByte!3247 thiss!1379)) ((_ sign_extend 32) (currentBit!3242 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!60276 () Bool)

(declare-fun res!50234 () Bool)

(assert (=> b!60276 (=> res!50234 e!40198)))

(assert (=> b!60276 (= res!50234 (not (invariant!0 (currentBit!3242 (_2!2856 lt!94123)) (currentByte!3247 (_2!2856 lt!94123)) (size!1248 (buf!1629 (_2!2856 lt!94117))))))))

(declare-fun b!60277 () Bool)

(declare-fun res!50240 () Bool)

(assert (=> b!60277 (=> res!50240 e!40189)))

(assert (=> b!60277 (= res!50240 (not (= (size!1248 (buf!1629 thiss!1379)) (size!1248 (buf!1629 (_2!2856 lt!94117))))))))

(assert (= (and start!11888 res!50239) b!60275))

(assert (= (and b!60275 res!50232) b!60270))

(assert (= (and b!60270 (not res!50237)) b!60272))

(assert (= (and b!60272 (not res!50242)) b!60265))

(assert (= (and b!60265 res!50243) b!60271))

(assert (= (and b!60265 (not res!50236)) b!60263))

(assert (= (and b!60263 (not res!50244)) b!60266))

(assert (= (and b!60266 (not res!50230)) b!60277))

(assert (= (and b!60277 (not res!50240)) b!60273))

(assert (= (and b!60273 res!50231) b!60269))

(assert (= (and b!60273 (not res!50241)) b!60268))

(assert (= (and b!60268 (not res!50233)) b!60276))

(assert (= (and b!60276 (not res!50234)) b!60264))

(assert (= (and b!60264 (not res!50235)) b!60267))

(assert (= (and b!60267 (not res!50238)) b!60274))

(assert (= start!11888 b!60262))

(declare-fun m!94947 () Bool)

(assert (=> b!60267 m!94947))

(declare-fun m!94949 () Bool)

(assert (=> b!60263 m!94949))

(declare-fun m!94951 () Bool)

(assert (=> b!60272 m!94951))

(declare-fun m!94953 () Bool)

(assert (=> b!60272 m!94953))

(declare-fun m!94955 () Bool)

(assert (=> b!60272 m!94955))

(assert (=> b!60272 m!94951))

(declare-fun m!94957 () Bool)

(assert (=> b!60272 m!94957))

(declare-fun m!94959 () Bool)

(assert (=> b!60272 m!94959))

(declare-fun m!94961 () Bool)

(assert (=> b!60276 m!94961))

(declare-fun m!94963 () Bool)

(assert (=> b!60262 m!94963))

(declare-fun m!94965 () Bool)

(assert (=> b!60269 m!94965))

(declare-fun m!94967 () Bool)

(assert (=> b!60268 m!94967))

(declare-fun m!94969 () Bool)

(assert (=> b!60270 m!94969))

(declare-fun m!94971 () Bool)

(assert (=> b!60270 m!94971))

(declare-fun m!94973 () Bool)

(assert (=> b!60270 m!94973))

(declare-fun m!94975 () Bool)

(assert (=> b!60266 m!94975))

(declare-fun m!94977 () Bool)

(assert (=> b!60271 m!94977))

(assert (=> b!60271 m!94977))

(declare-fun m!94979 () Bool)

(assert (=> b!60271 m!94979))

(declare-fun m!94981 () Bool)

(assert (=> b!60271 m!94981))

(assert (=> b!60271 m!94981))

(declare-fun m!94983 () Bool)

(assert (=> b!60271 m!94983))

(declare-fun m!94985 () Bool)

(assert (=> start!11888 m!94985))

(declare-fun m!94987 () Bool)

(assert (=> start!11888 m!94987))

(declare-fun m!94989 () Bool)

(assert (=> b!60264 m!94989))

(declare-fun m!94991 () Bool)

(assert (=> b!60264 m!94991))

(declare-fun m!94993 () Bool)

(assert (=> b!60264 m!94993))

(declare-fun m!94995 () Bool)

(assert (=> b!60264 m!94995))

(declare-fun m!94997 () Bool)

(assert (=> b!60264 m!94997))

(declare-fun m!94999 () Bool)

(assert (=> b!60264 m!94999))

(declare-fun m!95001 () Bool)

(assert (=> b!60264 m!95001))

(declare-fun m!95003 () Bool)

(assert (=> b!60264 m!95003))

(declare-fun m!95005 () Bool)

(assert (=> b!60275 m!95005))

(declare-fun m!95007 () Bool)

(assert (=> b!60265 m!95007))

(declare-fun m!95009 () Bool)

(assert (=> b!60265 m!95009))

(declare-fun m!95011 () Bool)

(assert (=> b!60265 m!95011))

(declare-fun m!95013 () Bool)

(assert (=> b!60265 m!95013))

(declare-fun m!95015 () Bool)

(assert (=> b!60265 m!95015))

(declare-fun m!95017 () Bool)

(assert (=> b!60265 m!95017))

(declare-fun m!95019 () Bool)

(assert (=> b!60265 m!95019))

(check-sat (not start!11888) (not b!60265) (not b!60263) (not b!60266) (not b!60276) (not b!60264) (not b!60262) (not b!60267) (not b!60271) (not b!60269) (not b!60270) (not b!60275) (not b!60268) (not b!60272))
(check-sat)
