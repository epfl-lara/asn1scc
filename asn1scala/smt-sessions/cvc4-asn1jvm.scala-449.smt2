; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11890 () Bool)

(assert start!11890)

(declare-fun b!60310 () Bool)

(declare-fun res!50283 () Bool)

(declare-fun e!40231 () Bool)

(assert (=> b!60310 (=> res!50283 e!40231)))

(declare-datatypes ((List!668 0))(
  ( (Nil!665) (Cons!664 (h!783 Bool) (t!1418 List!668)) )
))
(declare-fun lt!94173 () List!668)

(declare-fun length!296 (List!668) Int)

(assert (=> b!60310 (= res!50283 (<= (length!296 lt!94173) 0))))

(declare-fun b!60311 () Bool)

(declare-fun e!40224 () Bool)

(declare-fun e!40226 () Bool)

(assert (=> b!60311 (= e!40224 (not e!40226))))

(declare-fun res!50278 () Bool)

(assert (=> b!60311 (=> res!50278 e!40226)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!60311 (= res!50278 (bvsge i!635 to!314))))

(declare-datatypes ((array!2747 0))(
  ( (array!2748 (arr!1813 (Array (_ BitVec 32) (_ BitVec 8))) (size!1249 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2186 0))(
  ( (BitStream!2187 (buf!1630 array!2747) (currentByte!3248 (_ BitVec 32)) (currentBit!3243 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2186)

(declare-fun isPrefixOf!0 (BitStream!2186 BitStream!2186) Bool)

(assert (=> b!60311 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!4121 0))(
  ( (Unit!4122) )
))
(declare-fun lt!94163 () Unit!4121)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2186) Unit!4121)

(assert (=> b!60311 (= lt!94163 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!94169 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!60311 (= lt!94169 (bitIndex!0 (size!1249 (buf!1630 thiss!1379)) (currentByte!3248 thiss!1379) (currentBit!3243 thiss!1379)))))

(declare-fun b!60312 () Bool)

(assert (=> b!60312 (= e!40231 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!60313 () Bool)

(declare-fun e!40235 () Bool)

(declare-fun e!40228 () Bool)

(assert (=> b!60313 (= e!40235 e!40228)))

(declare-fun res!50289 () Bool)

(assert (=> b!60313 (=> res!50289 e!40228)))

(declare-datatypes ((tuple2!5494 0))(
  ( (tuple2!5495 (_1!2858 Unit!4121) (_2!2858 BitStream!2186)) )
))
(declare-fun lt!94174 () tuple2!5494)

(declare-fun lt!94170 () tuple2!5494)

(assert (=> b!60313 (= res!50289 (not (isPrefixOf!0 (_2!2858 lt!94174) (_2!2858 lt!94170))))))

(assert (=> b!60313 (isPrefixOf!0 thiss!1379 (_2!2858 lt!94170))))

(declare-fun lt!94164 () Unit!4121)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2186 BitStream!2186 BitStream!2186) Unit!4121)

(assert (=> b!60313 (= lt!94164 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2858 lt!94174) (_2!2858 lt!94170)))))

(declare-fun srcBuffer!2 () array!2747)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2186 array!2747 (_ BitVec 64) (_ BitVec 64)) tuple2!5494)

(assert (=> b!60313 (= lt!94170 (appendBitsMSBFirstLoop!0 (_2!2858 lt!94174) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!40225 () Bool)

(assert (=> b!60313 e!40225))

(declare-fun res!50285 () Bool)

(assert (=> b!60313 (=> (not res!50285) (not e!40225))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!60313 (= res!50285 (validate_offset_bits!1 ((_ sign_extend 32) (size!1249 (buf!1630 (_2!2858 lt!94174)))) ((_ sign_extend 32) (currentByte!3248 thiss!1379)) ((_ sign_extend 32) (currentBit!3243 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!94168 () Unit!4121)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2186 array!2747 (_ BitVec 64)) Unit!4121)

(assert (=> b!60313 (= lt!94168 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1630 (_2!2858 lt!94174)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!5496 0))(
  ( (tuple2!5497 (_1!2859 BitStream!2186) (_2!2859 BitStream!2186)) )
))
(declare-fun lt!94161 () tuple2!5496)

(declare-fun reader!0 (BitStream!2186 BitStream!2186) tuple2!5496)

(assert (=> b!60313 (= lt!94161 (reader!0 thiss!1379 (_2!2858 lt!94174)))))

(declare-fun b!60314 () Bool)

(declare-fun res!50282 () Bool)

(declare-fun e!40229 () Bool)

(assert (=> b!60314 (=> res!50282 e!40229)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!60314 (= res!50282 (not (invariant!0 (currentBit!3243 (_2!2858 lt!94170)) (currentByte!3248 (_2!2858 lt!94170)) (size!1249 (buf!1630 (_2!2858 lt!94170))))))))

(declare-fun res!50284 () Bool)

(assert (=> start!11890 (=> (not res!50284) (not e!40224))))

(assert (=> start!11890 (= res!50284 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1249 srcBuffer!2))))))))

(assert (=> start!11890 e!40224))

(assert (=> start!11890 true))

(declare-fun array_inv!1152 (array!2747) Bool)

(assert (=> start!11890 (array_inv!1152 srcBuffer!2)))

(declare-fun e!40227 () Bool)

(declare-fun inv!12 (BitStream!2186) Bool)

(assert (=> start!11890 (and (inv!12 thiss!1379) e!40227)))

(declare-fun b!60315 () Bool)

(declare-fun res!50275 () Bool)

(assert (=> b!60315 (=> res!50275 e!40229)))

(assert (=> b!60315 (= res!50275 (not (= (size!1249 (buf!1630 thiss!1379)) (size!1249 (buf!1630 (_2!2858 lt!94170))))))))

(declare-fun b!60316 () Bool)

(declare-fun res!50281 () Bool)

(declare-fun e!40233 () Bool)

(assert (=> b!60316 (=> res!50281 e!40233)))

(assert (=> b!60316 (= res!50281 (not (invariant!0 (currentBit!3243 (_2!2858 lt!94174)) (currentByte!3248 (_2!2858 lt!94174)) (size!1249 (buf!1630 (_2!2858 lt!94170))))))))

(declare-fun b!60317 () Bool)

(declare-fun e!40234 () Bool)

(declare-fun lt!94166 () (_ BitVec 64))

(assert (=> b!60317 (= e!40234 (= lt!94166 (bvsub (bvsub (bvadd (bitIndex!0 (size!1249 (buf!1630 (_2!2858 lt!94174))) (currentByte!3248 (_2!2858 lt!94174)) (currentBit!3243 (_2!2858 lt!94174))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!60318 () Bool)

(declare-fun head!487 (List!668) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2186 array!2747 (_ BitVec 64) (_ BitVec 64)) List!668)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2186 BitStream!2186 (_ BitVec 64)) List!668)

(assert (=> b!60318 (= e!40225 (= (head!487 (byteArrayBitContentToList!0 (_2!2858 lt!94174) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!487 (bitStreamReadBitsIntoList!0 (_2!2858 lt!94174) (_1!2859 lt!94161) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!60319 () Bool)

(declare-fun res!50280 () Bool)

(assert (=> b!60319 (=> (not res!50280) (not e!40224))))

(assert (=> b!60319 (= res!50280 (validate_offset_bits!1 ((_ sign_extend 32) (size!1249 (buf!1630 thiss!1379))) ((_ sign_extend 32) (currentByte!3248 thiss!1379)) ((_ sign_extend 32) (currentBit!3243 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!60320 () Bool)

(assert (=> b!60320 (= e!40228 e!40229)))

(declare-fun res!50276 () Bool)

(assert (=> b!60320 (=> res!50276 e!40229)))

(assert (=> b!60320 (= res!50276 (not (= lt!94166 (bvsub (bvadd lt!94169 to!314) i!635))))))

(assert (=> b!60320 (= lt!94166 (bitIndex!0 (size!1249 (buf!1630 (_2!2858 lt!94170))) (currentByte!3248 (_2!2858 lt!94170)) (currentBit!3243 (_2!2858 lt!94170))))))

(declare-fun b!60321 () Bool)

(assert (=> b!60321 (= e!40229 e!40233)))

(declare-fun res!50288 () Bool)

(assert (=> b!60321 (=> res!50288 e!40233)))

(assert (=> b!60321 (= res!50288 (not (= (size!1249 (buf!1630 (_2!2858 lt!94174))) (size!1249 (buf!1630 (_2!2858 lt!94170))))))))

(assert (=> b!60321 e!40234))

(declare-fun res!50287 () Bool)

(assert (=> b!60321 (=> (not res!50287) (not e!40234))))

(assert (=> b!60321 (= res!50287 (= (size!1249 (buf!1630 (_2!2858 lt!94170))) (size!1249 (buf!1630 thiss!1379))))))

(declare-fun b!60322 () Bool)

(declare-fun res!50277 () Bool)

(assert (=> b!60322 (=> res!50277 e!40233)))

(assert (=> b!60322 (= res!50277 (not (invariant!0 (currentBit!3243 (_2!2858 lt!94174)) (currentByte!3248 (_2!2858 lt!94174)) (size!1249 (buf!1630 (_2!2858 lt!94174))))))))

(declare-fun b!60323 () Bool)

(assert (=> b!60323 (= e!40226 e!40235)))

(declare-fun res!50279 () Bool)

(assert (=> b!60323 (=> res!50279 e!40235)))

(assert (=> b!60323 (= res!50279 (not (isPrefixOf!0 thiss!1379 (_2!2858 lt!94174))))))

(declare-fun lt!94165 () (_ BitVec 64))

(assert (=> b!60323 (validate_offset_bits!1 ((_ sign_extend 32) (size!1249 (buf!1630 (_2!2858 lt!94174)))) ((_ sign_extend 32) (currentByte!3248 (_2!2858 lt!94174))) ((_ sign_extend 32) (currentBit!3243 (_2!2858 lt!94174))) lt!94165)))

(assert (=> b!60323 (= lt!94165 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!94172 () Unit!4121)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2186 BitStream!2186 (_ BitVec 64) (_ BitVec 64)) Unit!4121)

(assert (=> b!60323 (= lt!94172 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2858 lt!94174) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2186 (_ BitVec 8) (_ BitVec 32)) tuple2!5494)

(assert (=> b!60323 (= lt!94174 (appendBitFromByte!0 thiss!1379 (select (arr!1813 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!60324 () Bool)

(assert (=> b!60324 (= e!40227 (array_inv!1152 (buf!1630 thiss!1379)))))

(declare-fun b!60325 () Bool)

(assert (=> b!60325 (= e!40233 e!40231)))

(declare-fun res!50286 () Bool)

(assert (=> b!60325 (=> res!50286 e!40231)))

(assert (=> b!60325 (= res!50286 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!94171 () tuple2!5496)

(declare-fun lt!94162 () List!668)

(assert (=> b!60325 (= lt!94162 (bitStreamReadBitsIntoList!0 (_2!2858 lt!94170) (_1!2859 lt!94171) lt!94165))))

(declare-fun lt!94167 () tuple2!5496)

(assert (=> b!60325 (= lt!94173 (bitStreamReadBitsIntoList!0 (_2!2858 lt!94170) (_1!2859 lt!94167) (bvsub to!314 i!635)))))

(assert (=> b!60325 (validate_offset_bits!1 ((_ sign_extend 32) (size!1249 (buf!1630 (_2!2858 lt!94170)))) ((_ sign_extend 32) (currentByte!3248 (_2!2858 lt!94174))) ((_ sign_extend 32) (currentBit!3243 (_2!2858 lt!94174))) lt!94165)))

(declare-fun lt!94160 () Unit!4121)

(assert (=> b!60325 (= lt!94160 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2858 lt!94174) (buf!1630 (_2!2858 lt!94170)) lt!94165))))

(assert (=> b!60325 (= lt!94171 (reader!0 (_2!2858 lt!94174) (_2!2858 lt!94170)))))

(assert (=> b!60325 (validate_offset_bits!1 ((_ sign_extend 32) (size!1249 (buf!1630 (_2!2858 lt!94170)))) ((_ sign_extend 32) (currentByte!3248 thiss!1379)) ((_ sign_extend 32) (currentBit!3243 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!94159 () Unit!4121)

(assert (=> b!60325 (= lt!94159 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1630 (_2!2858 lt!94170)) (bvsub to!314 i!635)))))

(assert (=> b!60325 (= lt!94167 (reader!0 thiss!1379 (_2!2858 lt!94170)))))

(assert (= (and start!11890 res!50284) b!60319))

(assert (= (and b!60319 res!50280) b!60311))

(assert (= (and b!60311 (not res!50278)) b!60323))

(assert (= (and b!60323 (not res!50279)) b!60313))

(assert (= (and b!60313 res!50285) b!60318))

(assert (= (and b!60313 (not res!50289)) b!60320))

(assert (= (and b!60320 (not res!50276)) b!60314))

(assert (= (and b!60314 (not res!50282)) b!60315))

(assert (= (and b!60315 (not res!50275)) b!60321))

(assert (= (and b!60321 res!50287) b!60317))

(assert (= (and b!60321 (not res!50288)) b!60322))

(assert (= (and b!60322 (not res!50277)) b!60316))

(assert (= (and b!60316 (not res!50281)) b!60325))

(assert (= (and b!60325 (not res!50286)) b!60310))

(assert (= (and b!60310 (not res!50283)) b!60312))

(assert (= start!11890 b!60324))

(declare-fun m!95021 () Bool)

(assert (=> b!60316 m!95021))

(declare-fun m!95023 () Bool)

(assert (=> b!60319 m!95023))

(declare-fun m!95025 () Bool)

(assert (=> b!60322 m!95025))

(declare-fun m!95027 () Bool)

(assert (=> b!60325 m!95027))

(declare-fun m!95029 () Bool)

(assert (=> b!60325 m!95029))

(declare-fun m!95031 () Bool)

(assert (=> b!60325 m!95031))

(declare-fun m!95033 () Bool)

(assert (=> b!60325 m!95033))

(declare-fun m!95035 () Bool)

(assert (=> b!60325 m!95035))

(declare-fun m!95037 () Bool)

(assert (=> b!60325 m!95037))

(declare-fun m!95039 () Bool)

(assert (=> b!60325 m!95039))

(declare-fun m!95041 () Bool)

(assert (=> b!60325 m!95041))

(declare-fun m!95043 () Bool)

(assert (=> b!60311 m!95043))

(declare-fun m!95045 () Bool)

(assert (=> b!60311 m!95045))

(declare-fun m!95047 () Bool)

(assert (=> b!60311 m!95047))

(declare-fun m!95049 () Bool)

(assert (=> b!60318 m!95049))

(assert (=> b!60318 m!95049))

(declare-fun m!95051 () Bool)

(assert (=> b!60318 m!95051))

(declare-fun m!95053 () Bool)

(assert (=> b!60318 m!95053))

(assert (=> b!60318 m!95053))

(declare-fun m!95055 () Bool)

(assert (=> b!60318 m!95055))

(declare-fun m!95057 () Bool)

(assert (=> b!60313 m!95057))

(declare-fun m!95059 () Bool)

(assert (=> b!60313 m!95059))

(declare-fun m!95061 () Bool)

(assert (=> b!60313 m!95061))

(declare-fun m!95063 () Bool)

(assert (=> b!60313 m!95063))

(declare-fun m!95065 () Bool)

(assert (=> b!60313 m!95065))

(declare-fun m!95067 () Bool)

(assert (=> b!60313 m!95067))

(declare-fun m!95069 () Bool)

(assert (=> b!60313 m!95069))

(declare-fun m!95071 () Bool)

(assert (=> b!60310 m!95071))

(declare-fun m!95073 () Bool)

(assert (=> start!11890 m!95073))

(declare-fun m!95075 () Bool)

(assert (=> start!11890 m!95075))

(declare-fun m!95077 () Bool)

(assert (=> b!60317 m!95077))

(declare-fun m!95079 () Bool)

(assert (=> b!60323 m!95079))

(declare-fun m!95081 () Bool)

(assert (=> b!60323 m!95081))

(declare-fun m!95083 () Bool)

(assert (=> b!60323 m!95083))

(declare-fun m!95085 () Bool)

(assert (=> b!60323 m!95085))

(assert (=> b!60323 m!95079))

(declare-fun m!95087 () Bool)

(assert (=> b!60323 m!95087))

(declare-fun m!95089 () Bool)

(assert (=> b!60324 m!95089))

(declare-fun m!95091 () Bool)

(assert (=> b!60314 m!95091))

(declare-fun m!95093 () Bool)

(assert (=> b!60320 m!95093))

(push 1)

(assert (not b!60311))

(assert (not b!60320))

(assert (not b!60319))

(assert (not b!60324))

(assert (not b!60318))

(assert (not b!60314))

(assert (not b!60310))

(assert (not b!60323))

(assert (not start!11890))

(assert (not b!60316))

(assert (not b!60322))

(assert (not b!60313))

(assert (not b!60325))

(assert (not b!60317))

(check-sat)

(pop 1)

(push 1)

(check-sat)

