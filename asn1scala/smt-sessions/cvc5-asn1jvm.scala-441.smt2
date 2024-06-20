; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11838 () Bool)

(assert start!11838)

(declare-fun b!59202 () Bool)

(declare-fun res!49253 () Bool)

(declare-fun e!39366 () Bool)

(assert (=> b!59202 (=> res!49253 e!39366)))

(declare-datatypes ((array!2695 0))(
  ( (array!2696 (arr!1787 (Array (_ BitVec 32) (_ BitVec 8))) (size!1223 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2134 0))(
  ( (BitStream!2135 (buf!1604 array!2695) (currentByte!3222 (_ BitVec 32)) (currentBit!3217 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!4069 0))(
  ( (Unit!4070) )
))
(declare-datatypes ((tuple2!5390 0))(
  ( (tuple2!5391 (_1!2806 Unit!4069) (_2!2806 BitStream!2134)) )
))
(declare-fun lt!93003 () tuple2!5390)

(declare-fun lt!93004 () tuple2!5390)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!59202 (= res!49253 (not (invariant!0 (currentBit!3217 (_2!2806 lt!93003)) (currentByte!3222 (_2!2806 lt!93003)) (size!1223 (buf!1604 (_2!2806 lt!93004))))))))

(declare-fun b!59203 () Bool)

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> b!59203 (= e!39366 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!93000 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!59203 (validate_offset_bits!1 ((_ sign_extend 32) (size!1223 (buf!1604 (_2!2806 lt!93004)))) ((_ sign_extend 32) (currentByte!3222 (_2!2806 lt!93003))) ((_ sign_extend 32) (currentBit!3217 (_2!2806 lt!93003))) lt!93000)))

(declare-fun lt!93006 () Unit!4069)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2134 array!2695 (_ BitVec 64)) Unit!4069)

(assert (=> b!59203 (= lt!93006 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2806 lt!93003) (buf!1604 (_2!2806 lt!93004)) lt!93000))))

(declare-datatypes ((tuple2!5392 0))(
  ( (tuple2!5393 (_1!2807 BitStream!2134) (_2!2807 BitStream!2134)) )
))
(declare-fun lt!92998 () tuple2!5392)

(declare-fun reader!0 (BitStream!2134 BitStream!2134) tuple2!5392)

(assert (=> b!59203 (= lt!92998 (reader!0 (_2!2806 lt!93003) (_2!2806 lt!93004)))))

(declare-fun thiss!1379 () BitStream!2134)

(assert (=> b!59203 (validate_offset_bits!1 ((_ sign_extend 32) (size!1223 (buf!1604 (_2!2806 lt!93004)))) ((_ sign_extend 32) (currentByte!3222 thiss!1379)) ((_ sign_extend 32) (currentBit!3217 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!92997 () Unit!4069)

(assert (=> b!59203 (= lt!92997 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1604 (_2!2806 lt!93004)) (bvsub to!314 i!635)))))

(declare-fun lt!93009 () tuple2!5392)

(assert (=> b!59203 (= lt!93009 (reader!0 thiss!1379 (_2!2806 lt!93004)))))

(declare-fun b!59204 () Bool)

(declare-fun e!39363 () Bool)

(assert (=> b!59204 (= e!39363 e!39366)))

(declare-fun res!49257 () Bool)

(assert (=> b!59204 (=> res!49257 e!39366)))

(assert (=> b!59204 (= res!49257 (not (= (size!1223 (buf!1604 (_2!2806 lt!93003))) (size!1223 (buf!1604 (_2!2806 lt!93004))))))))

(declare-fun e!39365 () Bool)

(assert (=> b!59204 e!39365))

(declare-fun res!49245 () Bool)

(assert (=> b!59204 (=> (not res!49245) (not e!39365))))

(assert (=> b!59204 (= res!49245 (= (size!1223 (buf!1604 (_2!2806 lt!93004))) (size!1223 (buf!1604 thiss!1379))))))

(declare-fun b!59205 () Bool)

(declare-fun lt!93008 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!59205 (= e!39365 (= lt!93008 (bvsub (bvsub (bvadd (bitIndex!0 (size!1223 (buf!1604 (_2!2806 lt!93003))) (currentByte!3222 (_2!2806 lt!93003)) (currentBit!3217 (_2!2806 lt!93003))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!59207 () Bool)

(declare-fun e!39364 () Bool)

(declare-fun e!39362 () Bool)

(assert (=> b!59207 (= e!39364 e!39362)))

(declare-fun res!49250 () Bool)

(assert (=> b!59207 (=> res!49250 e!39362)))

(declare-fun isPrefixOf!0 (BitStream!2134 BitStream!2134) Bool)

(assert (=> b!59207 (= res!49250 (not (isPrefixOf!0 (_2!2806 lt!93003) (_2!2806 lt!93004))))))

(assert (=> b!59207 (isPrefixOf!0 thiss!1379 (_2!2806 lt!93004))))

(declare-fun lt!93007 () Unit!4069)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2134 BitStream!2134 BitStream!2134) Unit!4069)

(assert (=> b!59207 (= lt!93007 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2806 lt!93003) (_2!2806 lt!93004)))))

(declare-fun srcBuffer!2 () array!2695)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2134 array!2695 (_ BitVec 64) (_ BitVec 64)) tuple2!5390)

(assert (=> b!59207 (= lt!93004 (appendBitsMSBFirstLoop!0 (_2!2806 lt!93003) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!39368 () Bool)

(assert (=> b!59207 e!39368))

(declare-fun res!49247 () Bool)

(assert (=> b!59207 (=> (not res!49247) (not e!39368))))

(assert (=> b!59207 (= res!49247 (validate_offset_bits!1 ((_ sign_extend 32) (size!1223 (buf!1604 (_2!2806 lt!93003)))) ((_ sign_extend 32) (currentByte!3222 thiss!1379)) ((_ sign_extend 32) (currentBit!3217 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!92999 () Unit!4069)

(assert (=> b!59207 (= lt!92999 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1604 (_2!2806 lt!93003)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!93005 () tuple2!5392)

(assert (=> b!59207 (= lt!93005 (reader!0 thiss!1379 (_2!2806 lt!93003)))))

(declare-fun b!59208 () Bool)

(declare-fun e!39361 () Bool)

(declare-fun array_inv!1126 (array!2695) Bool)

(assert (=> b!59208 (= e!39361 (array_inv!1126 (buf!1604 thiss!1379)))))

(declare-fun b!59209 () Bool)

(declare-fun res!49252 () Bool)

(declare-fun e!39360 () Bool)

(assert (=> b!59209 (=> (not res!49252) (not e!39360))))

(assert (=> b!59209 (= res!49252 (validate_offset_bits!1 ((_ sign_extend 32) (size!1223 (buf!1604 thiss!1379))) ((_ sign_extend 32) (currentByte!3222 thiss!1379)) ((_ sign_extend 32) (currentBit!3217 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!59210 () Bool)

(assert (=> b!59210 (= e!39362 e!39363)))

(declare-fun res!49254 () Bool)

(assert (=> b!59210 (=> res!49254 e!39363)))

(declare-fun lt!93001 () (_ BitVec 64))

(assert (=> b!59210 (= res!49254 (not (= lt!93008 (bvsub (bvadd lt!93001 to!314) i!635))))))

(assert (=> b!59210 (= lt!93008 (bitIndex!0 (size!1223 (buf!1604 (_2!2806 lt!93004))) (currentByte!3222 (_2!2806 lt!93004)) (currentBit!3217 (_2!2806 lt!93004))))))

(declare-fun b!59211 () Bool)

(declare-fun res!49249 () Bool)

(assert (=> b!59211 (=> res!49249 e!39366)))

(assert (=> b!59211 (= res!49249 (not (invariant!0 (currentBit!3217 (_2!2806 lt!93003)) (currentByte!3222 (_2!2806 lt!93003)) (size!1223 (buf!1604 (_2!2806 lt!93003))))))))

(declare-fun b!59212 () Bool)

(declare-fun e!39367 () Bool)

(assert (=> b!59212 (= e!39367 e!39364)))

(declare-fun res!49256 () Bool)

(assert (=> b!59212 (=> res!49256 e!39364)))

(assert (=> b!59212 (= res!49256 (not (isPrefixOf!0 thiss!1379 (_2!2806 lt!93003))))))

(assert (=> b!59212 (validate_offset_bits!1 ((_ sign_extend 32) (size!1223 (buf!1604 (_2!2806 lt!93003)))) ((_ sign_extend 32) (currentByte!3222 (_2!2806 lt!93003))) ((_ sign_extend 32) (currentBit!3217 (_2!2806 lt!93003))) lt!93000)))

(assert (=> b!59212 (= lt!93000 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!93002 () Unit!4069)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2134 BitStream!2134 (_ BitVec 64) (_ BitVec 64)) Unit!4069)

(assert (=> b!59212 (= lt!93002 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2806 lt!93003) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2134 (_ BitVec 8) (_ BitVec 32)) tuple2!5390)

(assert (=> b!59212 (= lt!93003 (appendBitFromByte!0 thiss!1379 (select (arr!1787 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun res!49248 () Bool)

(assert (=> start!11838 (=> (not res!49248) (not e!39360))))

(assert (=> start!11838 (= res!49248 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1223 srcBuffer!2))))))))

(assert (=> start!11838 e!39360))

(assert (=> start!11838 true))

(assert (=> start!11838 (array_inv!1126 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2134) Bool)

(assert (=> start!11838 (and (inv!12 thiss!1379) e!39361)))

(declare-fun b!59206 () Bool)

(declare-fun res!49251 () Bool)

(assert (=> b!59206 (=> res!49251 e!39363)))

(assert (=> b!59206 (= res!49251 (not (= (size!1223 (buf!1604 thiss!1379)) (size!1223 (buf!1604 (_2!2806 lt!93004))))))))

(declare-fun b!59213 () Bool)

(assert (=> b!59213 (= e!39360 (not e!39367))))

(declare-fun res!49246 () Bool)

(assert (=> b!59213 (=> res!49246 e!39367)))

(assert (=> b!59213 (= res!49246 (bvsge i!635 to!314))))

(assert (=> b!59213 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!93010 () Unit!4069)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2134) Unit!4069)

(assert (=> b!59213 (= lt!93010 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!59213 (= lt!93001 (bitIndex!0 (size!1223 (buf!1604 thiss!1379)) (currentByte!3222 thiss!1379) (currentBit!3217 thiss!1379)))))

(declare-fun b!59214 () Bool)

(declare-fun res!49255 () Bool)

(assert (=> b!59214 (=> res!49255 e!39363)))

(assert (=> b!59214 (= res!49255 (not (invariant!0 (currentBit!3217 (_2!2806 lt!93004)) (currentByte!3222 (_2!2806 lt!93004)) (size!1223 (buf!1604 (_2!2806 lt!93004))))))))

(declare-fun b!59215 () Bool)

(declare-datatypes ((List!642 0))(
  ( (Nil!639) (Cons!638 (h!757 Bool) (t!1392 List!642)) )
))
(declare-fun head!461 (List!642) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2134 array!2695 (_ BitVec 64) (_ BitVec 64)) List!642)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2134 BitStream!2134 (_ BitVec 64)) List!642)

(assert (=> b!59215 (= e!39368 (= (head!461 (byteArrayBitContentToList!0 (_2!2806 lt!93003) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!461 (bitStreamReadBitsIntoList!0 (_2!2806 lt!93003) (_1!2807 lt!93005) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and start!11838 res!49248) b!59209))

(assert (= (and b!59209 res!49252) b!59213))

(assert (= (and b!59213 (not res!49246)) b!59212))

(assert (= (and b!59212 (not res!49256)) b!59207))

(assert (= (and b!59207 res!49247) b!59215))

(assert (= (and b!59207 (not res!49250)) b!59210))

(assert (= (and b!59210 (not res!49254)) b!59214))

(assert (= (and b!59214 (not res!49255)) b!59206))

(assert (= (and b!59206 (not res!49251)) b!59204))

(assert (= (and b!59204 res!49245) b!59205))

(assert (= (and b!59204 (not res!49257)) b!59211))

(assert (= (and b!59211 (not res!49249)) b!59202))

(assert (= (and b!59202 (not res!49253)) b!59203))

(assert (= start!11838 b!59208))

(declare-fun m!93217 () Bool)

(assert (=> b!59210 m!93217))

(declare-fun m!93219 () Bool)

(assert (=> b!59207 m!93219))

(declare-fun m!93221 () Bool)

(assert (=> b!59207 m!93221))

(declare-fun m!93223 () Bool)

(assert (=> b!59207 m!93223))

(declare-fun m!93225 () Bool)

(assert (=> b!59207 m!93225))

(declare-fun m!93227 () Bool)

(assert (=> b!59207 m!93227))

(declare-fun m!93229 () Bool)

(assert (=> b!59207 m!93229))

(declare-fun m!93231 () Bool)

(assert (=> b!59207 m!93231))

(declare-fun m!93233 () Bool)

(assert (=> b!59214 m!93233))

(declare-fun m!93235 () Bool)

(assert (=> b!59205 m!93235))

(declare-fun m!93237 () Bool)

(assert (=> start!11838 m!93237))

(declare-fun m!93239 () Bool)

(assert (=> start!11838 m!93239))

(declare-fun m!93241 () Bool)

(assert (=> b!59215 m!93241))

(assert (=> b!59215 m!93241))

(declare-fun m!93243 () Bool)

(assert (=> b!59215 m!93243))

(declare-fun m!93245 () Bool)

(assert (=> b!59215 m!93245))

(assert (=> b!59215 m!93245))

(declare-fun m!93247 () Bool)

(assert (=> b!59215 m!93247))

(declare-fun m!93249 () Bool)

(assert (=> b!59213 m!93249))

(declare-fun m!93251 () Bool)

(assert (=> b!59213 m!93251))

(declare-fun m!93253 () Bool)

(assert (=> b!59213 m!93253))

(declare-fun m!93255 () Bool)

(assert (=> b!59212 m!93255))

(declare-fun m!93257 () Bool)

(assert (=> b!59212 m!93257))

(assert (=> b!59212 m!93255))

(declare-fun m!93259 () Bool)

(assert (=> b!59212 m!93259))

(declare-fun m!93261 () Bool)

(assert (=> b!59212 m!93261))

(declare-fun m!93263 () Bool)

(assert (=> b!59212 m!93263))

(declare-fun m!93265 () Bool)

(assert (=> b!59209 m!93265))

(declare-fun m!93267 () Bool)

(assert (=> b!59208 m!93267))

(declare-fun m!93269 () Bool)

(assert (=> b!59203 m!93269))

(declare-fun m!93271 () Bool)

(assert (=> b!59203 m!93271))

(declare-fun m!93273 () Bool)

(assert (=> b!59203 m!93273))

(declare-fun m!93275 () Bool)

(assert (=> b!59203 m!93275))

(declare-fun m!93277 () Bool)

(assert (=> b!59203 m!93277))

(declare-fun m!93279 () Bool)

(assert (=> b!59203 m!93279))

(declare-fun m!93281 () Bool)

(assert (=> b!59211 m!93281))

(declare-fun m!93283 () Bool)

(assert (=> b!59202 m!93283))

(push 1)

(assert (not b!59215))

(assert (not b!59210))

(assert (not b!59208))

(assert (not b!59207))

(assert (not b!59212))

(assert (not b!59209))

(assert (not b!59202))

(assert (not b!59205))

(assert (not b!59214))

(assert (not start!11838))

(assert (not b!59203))

(assert (not b!59211))

(assert (not b!59213))

(check-sat)

(pop 1)

(push 1)

(check-sat)

