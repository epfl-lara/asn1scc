; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!9154 () Bool)

(assert start!9154)

(declare-fun b!45286 () Bool)

(declare-fun e!30132 () Bool)

(declare-datatypes ((array!2259 0))(
  ( (array!2260 (arr!1533 (Array (_ BitVec 32) (_ BitVec 8))) (size!1016 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1776 0))(
  ( (BitStream!1777 (buf!1365 array!2259) (currentByte!2858 (_ BitVec 32)) (currentBit!2853 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1776)

(declare-fun array_inv!941 (array!2259) Bool)

(assert (=> b!45286 (= e!30132 (array_inv!941 (buf!1365 thiss!1379)))))

(declare-fun b!45287 () Bool)

(declare-fun res!38293 () Bool)

(declare-fun e!30129 () Bool)

(assert (=> b!45287 (=> res!38293 e!30129)))

(declare-datatypes ((Unit!3222 0))(
  ( (Unit!3223) )
))
(declare-datatypes ((tuple2!4420 0))(
  ( (tuple2!4421 (_1!2303 Unit!3222) (_2!2303 BitStream!1776)) )
))
(declare-fun lt!69601 () tuple2!4420)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!45287 (= res!38293 (not (invariant!0 (currentBit!2853 (_2!2303 lt!69601)) (currentByte!2858 (_2!2303 lt!69601)) (size!1016 (buf!1365 (_2!2303 lt!69601))))))))

(declare-fun b!45288 () Bool)

(declare-fun res!38297 () Bool)

(declare-fun e!30124 () Bool)

(assert (=> b!45288 (=> res!38297 e!30124)))

(declare-fun lt!69603 () tuple2!4420)

(assert (=> b!45288 (= res!38297 (not (= (size!1016 (buf!1365 thiss!1379)) (size!1016 (buf!1365 (_2!2303 lt!69603))))))))

(declare-fun b!45289 () Bool)

(declare-datatypes ((tuple2!4422 0))(
  ( (tuple2!4423 (_1!2304 BitStream!1776) (_2!2304 BitStream!1776)) )
))
(declare-fun lt!69604 () tuple2!4422)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun e!30134 () Bool)

(declare-fun srcBuffer!2 () array!2259)

(declare-datatypes ((List!529 0))(
  ( (Nil!526) (Cons!525 (h!644 Bool) (t!1279 List!529)) )
))
(declare-fun head!348 (List!529) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1776 array!2259 (_ BitVec 64) (_ BitVec 64)) List!529)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1776 BitStream!1776 (_ BitVec 64)) List!529)

(assert (=> b!45289 (= e!30134 (= (head!348 (byteArrayBitContentToList!0 (_2!2303 lt!69601) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!348 (bitStreamReadBitsIntoList!0 (_2!2303 lt!69601) (_1!2304 lt!69604) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!45291 () Bool)

(declare-fun res!38287 () Bool)

(assert (=> b!45291 (=> res!38287 e!30124)))

(assert (=> b!45291 (= res!38287 (not (invariant!0 (currentBit!2853 (_2!2303 lt!69603)) (currentByte!2858 (_2!2303 lt!69603)) (size!1016 (buf!1365 (_2!2303 lt!69603))))))))

(declare-fun b!45292 () Bool)

(declare-fun e!30128 () Bool)

(declare-fun e!30131 () Bool)

(assert (=> b!45292 (= e!30128 (not e!30131))))

(declare-fun res!38295 () Bool)

(assert (=> b!45292 (=> res!38295 e!30131)))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!45292 (= res!38295 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1776 BitStream!1776) Bool)

(assert (=> b!45292 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!69605 () Unit!3222)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1776) Unit!3222)

(assert (=> b!45292 (= lt!69605 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!69607 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!45292 (= lt!69607 (bitIndex!0 (size!1016 (buf!1365 thiss!1379)) (currentByte!2858 thiss!1379) (currentBit!2853 thiss!1379)))))

(declare-fun b!45293 () Bool)

(assert (=> b!45293 (= e!30124 e!30129)))

(declare-fun res!38298 () Bool)

(assert (=> b!45293 (=> res!38298 e!30129)))

(assert (=> b!45293 (= res!38298 (not (= (size!1016 (buf!1365 (_2!2303 lt!69601))) (size!1016 (buf!1365 (_2!2303 lt!69603))))))))

(declare-fun e!30127 () Bool)

(assert (=> b!45293 e!30127))

(declare-fun res!38289 () Bool)

(assert (=> b!45293 (=> (not res!38289) (not e!30127))))

(assert (=> b!45293 (= res!38289 (= (size!1016 (buf!1365 (_2!2303 lt!69603))) (size!1016 (buf!1365 thiss!1379))))))

(declare-fun b!45294 () Bool)

(declare-fun e!30125 () Bool)

(assert (=> b!45294 (= e!30131 e!30125)))

(declare-fun res!38291 () Bool)

(assert (=> b!45294 (=> res!38291 e!30125)))

(assert (=> b!45294 (= res!38291 (not (isPrefixOf!0 thiss!1379 (_2!2303 lt!69601))))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!45294 (validate_offset_bits!1 ((_ sign_extend 32) (size!1016 (buf!1365 (_2!2303 lt!69601)))) ((_ sign_extend 32) (currentByte!2858 (_2!2303 lt!69601))) ((_ sign_extend 32) (currentBit!2853 (_2!2303 lt!69601))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!69602 () Unit!3222)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1776 BitStream!1776 (_ BitVec 64) (_ BitVec 64)) Unit!3222)

(assert (=> b!45294 (= lt!69602 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2303 lt!69601) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1776 (_ BitVec 8) (_ BitVec 32)) tuple2!4420)

(assert (=> b!45294 (= lt!69601 (appendBitFromByte!0 thiss!1379 (select (arr!1533 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!45295 () Bool)

(declare-fun e!30130 () Bool)

(assert (=> b!45295 (= e!30125 e!30130)))

(declare-fun res!38294 () Bool)

(assert (=> b!45295 (=> res!38294 e!30130)))

(assert (=> b!45295 (= res!38294 (not (isPrefixOf!0 (_2!2303 lt!69601) (_2!2303 lt!69603))))))

(assert (=> b!45295 (isPrefixOf!0 thiss!1379 (_2!2303 lt!69603))))

(declare-fun lt!69599 () Unit!3222)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1776 BitStream!1776 BitStream!1776) Unit!3222)

(assert (=> b!45295 (= lt!69599 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2303 lt!69601) (_2!2303 lt!69603)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1776 array!2259 (_ BitVec 64) (_ BitVec 64)) tuple2!4420)

(assert (=> b!45295 (= lt!69603 (appendBitsMSBFirstLoop!0 (_2!2303 lt!69601) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!45295 e!30134))

(declare-fun res!38288 () Bool)

(assert (=> b!45295 (=> (not res!38288) (not e!30134))))

(assert (=> b!45295 (= res!38288 (validate_offset_bits!1 ((_ sign_extend 32) (size!1016 (buf!1365 (_2!2303 lt!69601)))) ((_ sign_extend 32) (currentByte!2858 thiss!1379)) ((_ sign_extend 32) (currentBit!2853 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!69606 () Unit!3222)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1776 array!2259 (_ BitVec 64)) Unit!3222)

(assert (=> b!45295 (= lt!69606 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1365 (_2!2303 lt!69601)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1776 BitStream!1776) tuple2!4422)

(assert (=> b!45295 (= lt!69604 (reader!0 thiss!1379 (_2!2303 lt!69601)))))

(declare-fun b!45290 () Bool)

(declare-fun lt!69600 () (_ BitVec 64))

(assert (=> b!45290 (= e!30127 (= lt!69600 (bvsub (bvsub (bvadd (bitIndex!0 (size!1016 (buf!1365 (_2!2303 lt!69601))) (currentByte!2858 (_2!2303 lt!69601)) (currentBit!2853 (_2!2303 lt!69601))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun res!38290 () Bool)

(assert (=> start!9154 (=> (not res!38290) (not e!30128))))

(assert (=> start!9154 (= res!38290 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1016 srcBuffer!2))))))))

(assert (=> start!9154 e!30128))

(assert (=> start!9154 true))

(assert (=> start!9154 (array_inv!941 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1776) Bool)

(assert (=> start!9154 (and (inv!12 thiss!1379) e!30132)))

(declare-fun b!45296 () Bool)

(declare-fun res!38292 () Bool)

(assert (=> b!45296 (=> (not res!38292) (not e!30128))))

(assert (=> b!45296 (= res!38292 (validate_offset_bits!1 ((_ sign_extend 32) (size!1016 (buf!1365 thiss!1379))) ((_ sign_extend 32) (currentByte!2858 thiss!1379)) ((_ sign_extend 32) (currentBit!2853 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!45297 () Bool)

(assert (=> b!45297 (= e!30130 e!30124)))

(declare-fun res!38296 () Bool)

(assert (=> b!45297 (=> res!38296 e!30124)))

(assert (=> b!45297 (= res!38296 (not (= lt!69600 (bvsub (bvadd lt!69607 to!314) i!635))))))

(assert (=> b!45297 (= lt!69600 (bitIndex!0 (size!1016 (buf!1365 (_2!2303 lt!69603))) (currentByte!2858 (_2!2303 lt!69603)) (currentBit!2853 (_2!2303 lt!69603))))))

(declare-fun b!45298 () Bool)

(assert (=> b!45298 (= e!30129 (invariant!0 (currentBit!2853 (_2!2303 lt!69601)) (currentByte!2858 (_2!2303 lt!69601)) (size!1016 (buf!1365 (_2!2303 lt!69603)))))))

(assert (= (and start!9154 res!38290) b!45296))

(assert (= (and b!45296 res!38292) b!45292))

(assert (= (and b!45292 (not res!38295)) b!45294))

(assert (= (and b!45294 (not res!38291)) b!45295))

(assert (= (and b!45295 res!38288) b!45289))

(assert (= (and b!45295 (not res!38294)) b!45297))

(assert (= (and b!45297 (not res!38296)) b!45291))

(assert (= (and b!45291 (not res!38287)) b!45288))

(assert (= (and b!45288 (not res!38297)) b!45293))

(assert (= (and b!45293 res!38289) b!45290))

(assert (= (and b!45293 (not res!38298)) b!45287))

(assert (= (and b!45287 (not res!38293)) b!45298))

(assert (= start!9154 b!45286))

(declare-fun m!69087 () Bool)

(assert (=> b!45297 m!69087))

(declare-fun m!69089 () Bool)

(assert (=> b!45296 m!69089))

(declare-fun m!69091 () Bool)

(assert (=> b!45298 m!69091))

(declare-fun m!69093 () Bool)

(assert (=> b!45291 m!69093))

(declare-fun m!69095 () Bool)

(assert (=> b!45292 m!69095))

(declare-fun m!69097 () Bool)

(assert (=> b!45292 m!69097))

(declare-fun m!69099 () Bool)

(assert (=> b!45292 m!69099))

(declare-fun m!69101 () Bool)

(assert (=> b!45286 m!69101))

(declare-fun m!69103 () Bool)

(assert (=> b!45295 m!69103))

(declare-fun m!69105 () Bool)

(assert (=> b!45295 m!69105))

(declare-fun m!69107 () Bool)

(assert (=> b!45295 m!69107))

(declare-fun m!69109 () Bool)

(assert (=> b!45295 m!69109))

(declare-fun m!69111 () Bool)

(assert (=> b!45295 m!69111))

(declare-fun m!69113 () Bool)

(assert (=> b!45295 m!69113))

(declare-fun m!69115 () Bool)

(assert (=> b!45295 m!69115))

(declare-fun m!69117 () Bool)

(assert (=> b!45289 m!69117))

(assert (=> b!45289 m!69117))

(declare-fun m!69119 () Bool)

(assert (=> b!45289 m!69119))

(declare-fun m!69121 () Bool)

(assert (=> b!45289 m!69121))

(assert (=> b!45289 m!69121))

(declare-fun m!69123 () Bool)

(assert (=> b!45289 m!69123))

(declare-fun m!69125 () Bool)

(assert (=> b!45290 m!69125))

(declare-fun m!69127 () Bool)

(assert (=> b!45287 m!69127))

(declare-fun m!69129 () Bool)

(assert (=> b!45294 m!69129))

(declare-fun m!69131 () Bool)

(assert (=> b!45294 m!69131))

(declare-fun m!69133 () Bool)

(assert (=> b!45294 m!69133))

(assert (=> b!45294 m!69131))

(declare-fun m!69135 () Bool)

(assert (=> b!45294 m!69135))

(declare-fun m!69137 () Bool)

(assert (=> b!45294 m!69137))

(declare-fun m!69139 () Bool)

(assert (=> start!9154 m!69139))

(declare-fun m!69141 () Bool)

(assert (=> start!9154 m!69141))

(check-sat (not b!45298) (not b!45289) (not b!45294) (not b!45291) (not b!45286) (not b!45287) (not b!45296) (not b!45295) (not b!45292) (not start!9154) (not b!45297) (not b!45290))
