; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20220 () Bool)

(assert start!20220)

(declare-fun b!101241 () Bool)

(declare-fun e!66195 () Bool)

(declare-fun e!66193 () Bool)

(assert (=> b!101241 (= e!66195 e!66193)))

(declare-fun res!83171 () Bool)

(assert (=> b!101241 (=> (not res!83171) (not e!66193))))

(declare-fun lt!146989 () (_ BitVec 64))

(declare-fun lt!146997 () (_ BitVec 64))

(assert (=> b!101241 (= res!83171 (= lt!146989 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!146997)))))

(declare-datatypes ((array!4751 0))(
  ( (array!4752 (arr!2761 (Array (_ BitVec 32) (_ BitVec 8))) (size!2168 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3810 0))(
  ( (BitStream!3811 (buf!2525 array!4751) (currentByte!4992 (_ BitVec 32)) (currentBit!4987 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!6208 0))(
  ( (Unit!6209) )
))
(declare-datatypes ((tuple2!8188 0))(
  ( (tuple2!8189 (_1!4349 Unit!6208) (_2!4349 BitStream!3810)) )
))
(declare-fun lt!146999 () tuple2!8188)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!101241 (= lt!146989 (bitIndex!0 (size!2168 (buf!2525 (_2!4349 lt!146999))) (currentByte!4992 (_2!4349 lt!146999)) (currentBit!4987 (_2!4349 lt!146999))))))

(declare-fun thiss!1305 () BitStream!3810)

(assert (=> b!101241 (= lt!146997 (bitIndex!0 (size!2168 (buf!2525 thiss!1305)) (currentByte!4992 thiss!1305) (currentBit!4987 thiss!1305)))))

(declare-fun b!101242 () Bool)

(declare-fun res!83172 () Bool)

(declare-fun e!66196 () Bool)

(assert (=> b!101242 (=> (not res!83172) (not e!66196))))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!101242 (= res!83172 (validate_offset_bits!1 ((_ sign_extend 32) (size!2168 (buf!2525 thiss!1305))) ((_ sign_extend 32) (currentByte!4992 thiss!1305)) ((_ sign_extend 32) (currentBit!4987 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!101243 () Bool)

(declare-fun e!66198 () Bool)

(declare-datatypes ((tuple2!8190 0))(
  ( (tuple2!8191 (_1!4350 BitStream!3810) (_2!4350 Bool)) )
))
(declare-fun lt!146990 () tuple2!8190)

(declare-fun lt!146995 () tuple2!8190)

(assert (=> b!101243 (= e!66198 (= (_2!4350 lt!146990) (_2!4350 lt!146995)))))

(declare-fun res!83170 () Bool)

(assert (=> start!20220 (=> (not res!83170) (not e!66196))))

(assert (=> start!20220 (= res!83170 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20220 e!66196))

(assert (=> start!20220 true))

(declare-fun e!66194 () Bool)

(declare-fun inv!12 (BitStream!3810) Bool)

(assert (=> start!20220 (and (inv!12 thiss!1305) e!66194)))

(declare-fun b!101244 () Bool)

(declare-fun res!83177 () Bool)

(assert (=> b!101244 (=> (not res!83177) (not e!66196))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!101244 (= res!83177 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!101245 () Bool)

(declare-fun e!66191 () Bool)

(declare-fun lt!147000 () tuple2!8188)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!101245 (= e!66191 (invariant!0 (currentBit!4987 thiss!1305) (currentByte!4992 thiss!1305) (size!2168 (buf!2525 (_2!4349 lt!147000)))))))

(declare-fun b!101246 () Bool)

(declare-fun res!83167 () Bool)

(assert (=> b!101246 (=> (not res!83167) (not e!66193))))

(declare-fun isPrefixOf!0 (BitStream!3810 BitStream!3810) Bool)

(assert (=> b!101246 (= res!83167 (isPrefixOf!0 thiss!1305 (_2!4349 lt!146999)))))

(declare-fun b!101247 () Bool)

(assert (=> b!101247 (= e!66196 (not true))))

(declare-datatypes ((tuple2!8192 0))(
  ( (tuple2!8193 (_1!4351 BitStream!3810) (_2!4351 BitStream!3810)) )
))
(declare-fun lt!146996 () tuple2!8192)

(declare-fun lt!147001 () Bool)

(declare-fun readBitPure!0 (BitStream!3810) tuple2!8190)

(assert (=> b!101247 (= (_2!4350 (readBitPure!0 (_1!4351 lt!146996))) lt!147001)))

(declare-fun lt!146991 () tuple2!8192)

(declare-fun reader!0 (BitStream!3810 BitStream!3810) tuple2!8192)

(assert (=> b!101247 (= lt!146991 (reader!0 (_2!4349 lt!146999) (_2!4349 lt!147000)))))

(assert (=> b!101247 (= lt!146996 (reader!0 thiss!1305 (_2!4349 lt!147000)))))

(assert (=> b!101247 e!66198))

(declare-fun res!83173 () Bool)

(assert (=> b!101247 (=> (not res!83173) (not e!66198))))

(assert (=> b!101247 (= res!83173 (= (bitIndex!0 (size!2168 (buf!2525 (_1!4350 lt!146990))) (currentByte!4992 (_1!4350 lt!146990)) (currentBit!4987 (_1!4350 lt!146990))) (bitIndex!0 (size!2168 (buf!2525 (_1!4350 lt!146995))) (currentByte!4992 (_1!4350 lt!146995)) (currentBit!4987 (_1!4350 lt!146995)))))))

(declare-fun lt!146994 () Unit!6208)

(declare-fun lt!146993 () BitStream!3810)

(declare-fun readBitPrefixLemma!0 (BitStream!3810 BitStream!3810) Unit!6208)

(assert (=> b!101247 (= lt!146994 (readBitPrefixLemma!0 lt!146993 (_2!4349 lt!147000)))))

(assert (=> b!101247 (= lt!146995 (readBitPure!0 (BitStream!3811 (buf!2525 (_2!4349 lt!147000)) (currentByte!4992 thiss!1305) (currentBit!4987 thiss!1305))))))

(assert (=> b!101247 (= lt!146990 (readBitPure!0 lt!146993))))

(assert (=> b!101247 (= lt!146993 (BitStream!3811 (buf!2525 (_2!4349 lt!146999)) (currentByte!4992 thiss!1305) (currentBit!4987 thiss!1305)))))

(assert (=> b!101247 e!66191))

(declare-fun res!83176 () Bool)

(assert (=> b!101247 (=> (not res!83176) (not e!66191))))

(assert (=> b!101247 (= res!83176 (isPrefixOf!0 thiss!1305 (_2!4349 lt!147000)))))

(declare-fun lt!146992 () Unit!6208)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3810 BitStream!3810 BitStream!3810) Unit!6208)

(assert (=> b!101247 (= lt!146992 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4349 lt!146999) (_2!4349 lt!147000)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3810 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8188)

(assert (=> b!101247 (= lt!147000 (appendNLeastSignificantBitsLoop!0 (_2!4349 lt!146999) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!101247 e!66195))

(declare-fun res!83174 () Bool)

(assert (=> b!101247 (=> (not res!83174) (not e!66195))))

(assert (=> b!101247 (= res!83174 (= (size!2168 (buf!2525 thiss!1305)) (size!2168 (buf!2525 (_2!4349 lt!146999)))))))

(declare-fun appendBit!0 (BitStream!3810 Bool) tuple2!8188)

(assert (=> b!101247 (= lt!146999 (appendBit!0 thiss!1305 lt!147001))))

(assert (=> b!101247 (= lt!147001 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!101248 () Bool)

(declare-fun res!83175 () Bool)

(assert (=> b!101248 (=> (not res!83175) (not e!66191))))

(assert (=> b!101248 (= res!83175 (invariant!0 (currentBit!4987 thiss!1305) (currentByte!4992 thiss!1305) (size!2168 (buf!2525 (_2!4349 lt!146999)))))))

(declare-fun b!101249 () Bool)

(declare-fun res!83168 () Bool)

(assert (=> b!101249 (=> (not res!83168) (not e!66196))))

(assert (=> b!101249 (= res!83168 (bvslt i!615 nBits!396))))

(declare-fun b!101250 () Bool)

(declare-fun e!66197 () Bool)

(assert (=> b!101250 (= e!66193 e!66197)))

(declare-fun res!83169 () Bool)

(assert (=> b!101250 (=> (not res!83169) (not e!66197))))

(declare-fun lt!146998 () tuple2!8190)

(assert (=> b!101250 (= res!83169 (and (= (_2!4350 lt!146998) lt!147001) (= (_1!4350 lt!146998) (_2!4349 lt!146999))))))

(declare-fun readerFrom!0 (BitStream!3810 (_ BitVec 32) (_ BitVec 32)) BitStream!3810)

(assert (=> b!101250 (= lt!146998 (readBitPure!0 (readerFrom!0 (_2!4349 lt!146999) (currentBit!4987 thiss!1305) (currentByte!4992 thiss!1305))))))

(declare-fun b!101251 () Bool)

(declare-fun array_inv!1970 (array!4751) Bool)

(assert (=> b!101251 (= e!66194 (array_inv!1970 (buf!2525 thiss!1305)))))

(declare-fun b!101252 () Bool)

(assert (=> b!101252 (= e!66197 (= (bitIndex!0 (size!2168 (buf!2525 (_1!4350 lt!146998))) (currentByte!4992 (_1!4350 lt!146998)) (currentBit!4987 (_1!4350 lt!146998))) lt!146989))))

(assert (= (and start!20220 res!83170) b!101242))

(assert (= (and b!101242 res!83172) b!101244))

(assert (= (and b!101244 res!83177) b!101249))

(assert (= (and b!101249 res!83168) b!101247))

(assert (= (and b!101247 res!83174) b!101241))

(assert (= (and b!101241 res!83171) b!101246))

(assert (= (and b!101246 res!83167) b!101250))

(assert (= (and b!101250 res!83169) b!101252))

(assert (= (and b!101247 res!83176) b!101248))

(assert (= (and b!101248 res!83175) b!101245))

(assert (= (and b!101247 res!83173) b!101243))

(assert (= start!20220 b!101251))

(declare-fun m!147259 () Bool)

(assert (=> b!101242 m!147259))

(declare-fun m!147261 () Bool)

(assert (=> b!101246 m!147261))

(declare-fun m!147263 () Bool)

(assert (=> b!101248 m!147263))

(declare-fun m!147265 () Bool)

(assert (=> b!101245 m!147265))

(declare-fun m!147267 () Bool)

(assert (=> b!101244 m!147267))

(declare-fun m!147269 () Bool)

(assert (=> b!101252 m!147269))

(declare-fun m!147271 () Bool)

(assert (=> b!101247 m!147271))

(declare-fun m!147273 () Bool)

(assert (=> b!101247 m!147273))

(declare-fun m!147275 () Bool)

(assert (=> b!101247 m!147275))

(declare-fun m!147277 () Bool)

(assert (=> b!101247 m!147277))

(declare-fun m!147279 () Bool)

(assert (=> b!101247 m!147279))

(declare-fun m!147281 () Bool)

(assert (=> b!101247 m!147281))

(declare-fun m!147283 () Bool)

(assert (=> b!101247 m!147283))

(declare-fun m!147285 () Bool)

(assert (=> b!101247 m!147285))

(declare-fun m!147287 () Bool)

(assert (=> b!101247 m!147287))

(declare-fun m!147289 () Bool)

(assert (=> b!101247 m!147289))

(declare-fun m!147291 () Bool)

(assert (=> b!101247 m!147291))

(declare-fun m!147293 () Bool)

(assert (=> b!101247 m!147293))

(declare-fun m!147295 () Bool)

(assert (=> b!101251 m!147295))

(declare-fun m!147297 () Bool)

(assert (=> b!101250 m!147297))

(assert (=> b!101250 m!147297))

(declare-fun m!147299 () Bool)

(assert (=> b!101250 m!147299))

(declare-fun m!147301 () Bool)

(assert (=> b!101241 m!147301))

(declare-fun m!147303 () Bool)

(assert (=> b!101241 m!147303))

(declare-fun m!147305 () Bool)

(assert (=> start!20220 m!147305))

(check-sat (not b!101251) (not b!101247) (not b!101242) (not b!101248) (not b!101250) (not b!101245) (not b!101241) (not b!101252) (not start!20220) (not b!101244) (not b!101246))
