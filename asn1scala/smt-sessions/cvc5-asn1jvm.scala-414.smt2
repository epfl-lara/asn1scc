; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10554 () Bool)

(assert start!10554)

(declare-fun b!52872 () Bool)

(declare-fun e!35205 () Bool)

(declare-fun e!35209 () Bool)

(assert (=> b!52872 (= e!35205 e!35209)))

(declare-fun res!44163 () Bool)

(assert (=> b!52872 (=> res!44163 e!35209)))

(declare-datatypes ((array!2497 0))(
  ( (array!2498 (arr!1676 (Array (_ BitVec 32) (_ BitVec 8))) (size!1140 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1972 0))(
  ( (BitStream!1973 (buf!1490 array!2497) (currentByte!3045 (_ BitVec 32)) (currentBit!3040 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1972)

(declare-datatypes ((Unit!3684 0))(
  ( (Unit!3685) )
))
(declare-datatypes ((tuple2!4810 0))(
  ( (tuple2!4811 (_1!2510 Unit!3684) (_2!2510 BitStream!1972)) )
))
(declare-fun lt!81918 () tuple2!4810)

(declare-fun isPrefixOf!0 (BitStream!1972 BitStream!1972) Bool)

(assert (=> b!52872 (= res!44163 (not (isPrefixOf!0 thiss!1379 (_2!2510 lt!81918))))))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!52872 (validate_offset_bits!1 ((_ sign_extend 32) (size!1140 (buf!1490 (_2!2510 lt!81918)))) ((_ sign_extend 32) (currentByte!3045 (_2!2510 lt!81918))) ((_ sign_extend 32) (currentBit!3040 (_2!2510 lt!81918))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!81916 () Unit!3684)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1972 BitStream!1972 (_ BitVec 64) (_ BitVec 64)) Unit!3684)

(assert (=> b!52872 (= lt!81916 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2510 lt!81918) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!2497)

(declare-fun appendBitFromByte!0 (BitStream!1972 (_ BitVec 8) (_ BitVec 32)) tuple2!4810)

(assert (=> b!52872 (= lt!81918 (appendBitFromByte!0 thiss!1379 (select (arr!1676 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!52873 () Bool)

(assert (=> b!52873 (= e!35209 (= (size!1140 (buf!1490 thiss!1379)) (size!1140 (buf!1490 (_2!2510 lt!81918)))))))

(declare-datatypes ((tuple2!4812 0))(
  ( (tuple2!4813 (_1!2511 BitStream!1972) (_2!2511 BitStream!1972)) )
))
(declare-fun lt!81917 () tuple2!4812)

(declare-fun reader!0 (BitStream!1972 BitStream!1972) tuple2!4812)

(assert (=> b!52873 (= lt!81917 (reader!0 thiss!1379 (_2!2510 lt!81918)))))

(declare-fun b!52874 () Bool)

(declare-fun e!35210 () Bool)

(assert (=> b!52874 (= e!35210 (not e!35205))))

(declare-fun res!44161 () Bool)

(assert (=> b!52874 (=> res!44161 e!35205)))

(assert (=> b!52874 (= res!44161 (bvsge i!635 to!314))))

(assert (=> b!52874 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!81915 () Unit!3684)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1972) Unit!3684)

(assert (=> b!52874 (= lt!81915 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!81919 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!52874 (= lt!81919 (bitIndex!0 (size!1140 (buf!1490 thiss!1379)) (currentByte!3045 thiss!1379) (currentBit!3040 thiss!1379)))))

(declare-fun b!52875 () Bool)

(declare-fun res!44160 () Bool)

(assert (=> b!52875 (=> (not res!44160) (not e!35210))))

(assert (=> b!52875 (= res!44160 (validate_offset_bits!1 ((_ sign_extend 32) (size!1140 (buf!1490 thiss!1379))) ((_ sign_extend 32) (currentByte!3045 thiss!1379)) ((_ sign_extend 32) (currentBit!3040 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!44162 () Bool)

(assert (=> start!10554 (=> (not res!44162) (not e!35210))))

(assert (=> start!10554 (= res!44162 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1140 srcBuffer!2))))))))

(assert (=> start!10554 e!35210))

(assert (=> start!10554 true))

(declare-fun array_inv!1045 (array!2497) Bool)

(assert (=> start!10554 (array_inv!1045 srcBuffer!2)))

(declare-fun e!35208 () Bool)

(declare-fun inv!12 (BitStream!1972) Bool)

(assert (=> start!10554 (and (inv!12 thiss!1379) e!35208)))

(declare-fun b!52876 () Bool)

(assert (=> b!52876 (= e!35208 (array_inv!1045 (buf!1490 thiss!1379)))))

(assert (= (and start!10554 res!44162) b!52875))

(assert (= (and b!52875 res!44160) b!52874))

(assert (= (and b!52874 (not res!44161)) b!52872))

(assert (= (and b!52872 (not res!44163)) b!52873))

(assert (= start!10554 b!52876))

(declare-fun m!83281 () Bool)

(assert (=> b!52872 m!83281))

(declare-fun m!83283 () Bool)

(assert (=> b!52872 m!83283))

(declare-fun m!83285 () Bool)

(assert (=> b!52872 m!83285))

(declare-fun m!83287 () Bool)

(assert (=> b!52872 m!83287))

(assert (=> b!52872 m!83281))

(declare-fun m!83289 () Bool)

(assert (=> b!52872 m!83289))

(declare-fun m!83291 () Bool)

(assert (=> start!10554 m!83291))

(declare-fun m!83293 () Bool)

(assert (=> start!10554 m!83293))

(declare-fun m!83295 () Bool)

(assert (=> b!52873 m!83295))

(declare-fun m!83297 () Bool)

(assert (=> b!52874 m!83297))

(declare-fun m!83299 () Bool)

(assert (=> b!52874 m!83299))

(declare-fun m!83301 () Bool)

(assert (=> b!52874 m!83301))

(declare-fun m!83303 () Bool)

(assert (=> b!52875 m!83303))

(declare-fun m!83305 () Bool)

(assert (=> b!52876 m!83305))

(push 1)

(assert (not b!52876))

(assert (not b!52874))

(assert (not b!52873))

(assert (not start!10554))

(assert (not b!52872))

(assert (not b!52875))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!16746 () Bool)

(assert (=> d!16746 (= (array_inv!1045 (buf!1490 thiss!1379)) (bvsge (size!1140 (buf!1490 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!52876 d!16746))

(declare-fun d!16750 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!16750 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1140 (buf!1490 thiss!1379))) ((_ sign_extend 32) (currentByte!3045 thiss!1379)) ((_ sign_extend 32) (currentBit!3040 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1140 (buf!1490 thiss!1379))) ((_ sign_extend 32) (currentByte!3045 thiss!1379)) ((_ sign_extend 32) (currentBit!3040 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4249 () Bool)

(assert (= bs!4249 d!16750))

(declare-fun m!83361 () Bool)

(assert (=> bs!4249 m!83361))

(assert (=> b!52875 d!16750))

(declare-fun d!16756 () Bool)

(assert (=> d!16756 (= (array_inv!1045 srcBuffer!2) (bvsge (size!1140 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!10554 d!16756))

(declare-fun d!16758 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!16758 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3040 thiss!1379) (currentByte!3045 thiss!1379) (size!1140 (buf!1490 thiss!1379))))))

(declare-fun bs!4251 () Bool)

(assert (= bs!4251 d!16758))

(declare-fun m!83365 () Bool)

(assert (=> bs!4251 m!83365))

(assert (=> start!10554 d!16758))

(declare-fun d!16764 () Bool)

(declare-fun res!44205 () Bool)

(declare-fun e!35258 () Bool)

(assert (=> d!16764 (=> (not res!44205) (not e!35258))))

(assert (=> d!16764 (= res!44205 (= (size!1140 (buf!1490 thiss!1379)) (size!1140 (buf!1490 thiss!1379))))))

(assert (=> d!16764 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!35258)))

(declare-fun b!52922 () Bool)

(declare-fun res!44203 () Bool)

(assert (=> b!52922 (=> (not res!44203) (not e!35258))))

(assert (=> b!52922 (= res!44203 (bvsle (bitIndex!0 (size!1140 (buf!1490 thiss!1379)) (currentByte!3045 thiss!1379) (currentBit!3040 thiss!1379)) (bitIndex!0 (size!1140 (buf!1490 thiss!1379)) (currentByte!3045 thiss!1379) (currentBit!3040 thiss!1379))))))

(declare-fun b!52923 () Bool)

(declare-fun e!35257 () Bool)

(assert (=> b!52923 (= e!35258 e!35257)))

(declare-fun res!44204 () Bool)

(assert (=> b!52923 (=> res!44204 e!35257)))

(assert (=> b!52923 (= res!44204 (= (size!1140 (buf!1490 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!52924 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2497 array!2497 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!52924 (= e!35257 (arrayBitRangesEq!0 (buf!1490 thiss!1379) (buf!1490 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1140 (buf!1490 thiss!1379)) (currentByte!3045 thiss!1379) (currentBit!3040 thiss!1379))))))

(assert (= (and d!16764 res!44205) b!52922))

(assert (= (and b!52922 res!44203) b!52923))

(assert (= (and b!52923 (not res!44204)) b!52924))

(assert (=> b!52922 m!83301))

(assert (=> b!52922 m!83301))

(assert (=> b!52924 m!83301))

(assert (=> b!52924 m!83301))

(declare-fun m!83371 () Bool)

(assert (=> b!52924 m!83371))

(assert (=> b!52874 d!16764))

(declare-fun d!16768 () Bool)

(assert (=> d!16768 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!81952 () Unit!3684)

(declare-fun choose!11 (BitStream!1972) Unit!3684)

(assert (=> d!16768 (= lt!81952 (choose!11 thiss!1379))))

(assert (=> d!16768 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!81952)))

(declare-fun bs!4254 () Bool)

(assert (= bs!4254 d!16768))

(assert (=> bs!4254 m!83297))

(declare-fun m!83375 () Bool)

(assert (=> bs!4254 m!83375))

(assert (=> b!52874 d!16768))

(declare-fun d!16772 () Bool)

(declare-fun e!35264 () Bool)

(assert (=> d!16772 e!35264))

(declare-fun res!44214 () Bool)

(assert (=> d!16772 (=> (not res!44214) (not e!35264))))

(declare-fun lt!81969 () (_ BitVec 64))

(declare-fun lt!81973 () (_ BitVec 64))

(declare-fun lt!81968 () (_ BitVec 64))

(assert (=> d!16772 (= res!44214 (= lt!81968 (bvsub lt!81969 lt!81973)))))

(assert (=> d!16772 (or (= (bvand lt!81969 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!81973 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!81969 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!81969 lt!81973) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!16772 (= lt!81973 (remainingBits!0 ((_ sign_extend 32) (size!1140 (buf!1490 thiss!1379))) ((_ sign_extend 32) (currentByte!3045 thiss!1379)) ((_ sign_extend 32) (currentBit!3040 thiss!1379))))))

(declare-fun lt!81971 () (_ BitVec 64))

(declare-fun lt!81972 () (_ BitVec 64))

(assert (=> d!16772 (= lt!81969 (bvmul lt!81971 lt!81972))))

(assert (=> d!16772 (or (= lt!81971 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!81972 (bvsdiv (bvmul lt!81971 lt!81972) lt!81971)))))

(assert (=> d!16772 (= lt!81972 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!16772 (= lt!81971 ((_ sign_extend 32) (size!1140 (buf!1490 thiss!1379))))))

(assert (=> d!16772 (= lt!81968 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3045 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3040 thiss!1379))))))

(assert (=> d!16772 (invariant!0 (currentBit!3040 thiss!1379) (currentByte!3045 thiss!1379) (size!1140 (buf!1490 thiss!1379)))))

(assert (=> d!16772 (= (bitIndex!0 (size!1140 (buf!1490 thiss!1379)) (currentByte!3045 thiss!1379) (currentBit!3040 thiss!1379)) lt!81968)))

(declare-fun b!52932 () Bool)

(declare-fun res!44213 () Bool)

(assert (=> b!52932 (=> (not res!44213) (not e!35264))))

(assert (=> b!52932 (= res!44213 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!81968))))

(declare-fun b!52933 () Bool)

(declare-fun lt!81970 () (_ BitVec 64))

(assert (=> b!52933 (= e!35264 (bvsle lt!81968 (bvmul lt!81970 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!52933 (or (= lt!81970 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!81970 #b0000000000000000000000000000000000000000000000000000000000001000) lt!81970)))))

(assert (=> b!52933 (= lt!81970 ((_ sign_extend 32) (size!1140 (buf!1490 thiss!1379))))))

(assert (= (and d!16772 res!44214) b!52932))

(assert (= (and b!52932 res!44213) b!52933))

(assert (=> d!16772 m!83361))

(assert (=> d!16772 m!83365))

(assert (=> b!52874 d!16772))

(declare-fun lt!82021 () (_ BitVec 64))

(declare-fun b!52945 () Bool)

(declare-fun lt!82018 () (_ BitVec 64))

(declare-fun lt!82033 () tuple2!4812)

(declare-fun e!35270 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!1972 (_ BitVec 64)) BitStream!1972)

(assert (=> b!52945 (= e!35270 (= (_1!2511 lt!82033) (withMovedBitIndex!0 (_2!2511 lt!82033) (bvsub lt!82018 lt!82021))))))

(assert (=> b!52945 (or (= (bvand lt!82018 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!82021 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!82018 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!82018 lt!82021) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!52945 (= lt!82021 (bitIndex!0 (size!1140 (buf!1490 (_2!2510 lt!81918))) (currentByte!3045 (_2!2510 lt!81918)) (currentBit!3040 (_2!2510 lt!81918))))))

(assert (=> b!52945 (= lt!82018 (bitIndex!0 (size!1140 (buf!1490 thiss!1379)) (currentByte!3045 thiss!1379) (currentBit!3040 thiss!1379)))))

(declare-fun b!52946 () Bool)

(declare-fun res!44222 () Bool)

(assert (=> b!52946 (=> (not res!44222) (not e!35270))))

(assert (=> b!52946 (= res!44222 (isPrefixOf!0 (_1!2511 lt!82033) thiss!1379))))

(declare-fun b!52947 () Bool)

(declare-fun e!35269 () Unit!3684)

(declare-fun Unit!3690 () Unit!3684)

(assert (=> b!52947 (= e!35269 Unit!3690)))

(declare-fun b!52948 () Bool)

(declare-fun res!44223 () Bool)

(assert (=> b!52948 (=> (not res!44223) (not e!35270))))

(assert (=> b!52948 (= res!44223 (isPrefixOf!0 (_2!2511 lt!82033) (_2!2510 lt!81918)))))

(declare-fun b!52944 () Bool)

(declare-fun lt!82017 () Unit!3684)

(assert (=> b!52944 (= e!35269 lt!82017)))

(declare-fun lt!82028 () (_ BitVec 64))

(assert (=> b!52944 (= lt!82028 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!82020 () (_ BitVec 64))

(assert (=> b!52944 (= lt!82020 (bitIndex!0 (size!1140 (buf!1490 thiss!1379)) (currentByte!3045 thiss!1379) (currentBit!3040 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2497 array!2497 (_ BitVec 64) (_ BitVec 64)) Unit!3684)

(assert (=> b!52944 (= lt!82017 (arrayBitRangesEqSymmetric!0 (buf!1490 thiss!1379) (buf!1490 (_2!2510 lt!81918)) lt!82028 lt!82020))))

(assert (=> b!52944 (arrayBitRangesEq!0 (buf!1490 (_2!2510 lt!81918)) (buf!1490 thiss!1379) lt!82028 lt!82020)))

(declare-fun d!16776 () Bool)

(assert (=> d!16776 e!35270))

(declare-fun res!44221 () Bool)

(assert (=> d!16776 (=> (not res!44221) (not e!35270))))

(assert (=> d!16776 (= res!44221 (isPrefixOf!0 (_1!2511 lt!82033) (_2!2511 lt!82033)))))

(declare-fun lt!82016 () BitStream!1972)

(assert (=> d!16776 (= lt!82033 (tuple2!4813 lt!82016 (_2!2510 lt!81918)))))

(declare-fun lt!82029 () Unit!3684)

(declare-fun lt!82022 () Unit!3684)

(assert (=> d!16776 (= lt!82029 lt!82022)))

(assert (=> d!16776 (isPrefixOf!0 lt!82016 (_2!2510 lt!81918))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1972 BitStream!1972 BitStream!1972) Unit!3684)

(assert (=> d!16776 (= lt!82022 (lemmaIsPrefixTransitive!0 lt!82016 (_2!2510 lt!81918) (_2!2510 lt!81918)))))

(declare-fun lt!82014 () Unit!3684)

(declare-fun lt!82015 () Unit!3684)

(assert (=> d!16776 (= lt!82014 lt!82015)))

(assert (=> d!16776 (isPrefixOf!0 lt!82016 (_2!2510 lt!81918))))

(assert (=> d!16776 (= lt!82015 (lemmaIsPrefixTransitive!0 lt!82016 thiss!1379 (_2!2510 lt!81918)))))

(declare-fun lt!82030 () Unit!3684)

(assert (=> d!16776 (= lt!82030 e!35269)))

(declare-fun c!3747 () Bool)

(assert (=> d!16776 (= c!3747 (not (= (size!1140 (buf!1490 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!82025 () Unit!3684)

(declare-fun lt!82024 () Unit!3684)

(assert (=> d!16776 (= lt!82025 lt!82024)))

(assert (=> d!16776 (isPrefixOf!0 (_2!2510 lt!81918) (_2!2510 lt!81918))))

(assert (=> d!16776 (= lt!82024 (lemmaIsPrefixRefl!0 (_2!2510 lt!81918)))))

(declare-fun lt!82031 () Unit!3684)

(declare-fun lt!82023 () Unit!3684)

(assert (=> d!16776 (= lt!82031 lt!82023)))

(assert (=> d!16776 (= lt!82023 (lemmaIsPrefixRefl!0 (_2!2510 lt!81918)))))

(declare-fun lt!82032 () Unit!3684)

(declare-fun lt!82027 () Unit!3684)

(assert (=> d!16776 (= lt!82032 lt!82027)))

(assert (=> d!16776 (isPrefixOf!0 lt!82016 lt!82016)))

(assert (=> d!16776 (= lt!82027 (lemmaIsPrefixRefl!0 lt!82016))))

(declare-fun lt!82026 () Unit!3684)

(declare-fun lt!82019 () Unit!3684)

(assert (=> d!16776 (= lt!82026 lt!82019)))

(assert (=> d!16776 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!16776 (= lt!82019 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!16776 (= lt!82016 (BitStream!1973 (buf!1490 (_2!2510 lt!81918)) (currentByte!3045 thiss!1379) (currentBit!3040 thiss!1379)))))

(assert (=> d!16776 (isPrefixOf!0 thiss!1379 (_2!2510 lt!81918))))

(assert (=> d!16776 (= (reader!0 thiss!1379 (_2!2510 lt!81918)) lt!82033)))

(assert (= (and d!16776 c!3747) b!52944))

(assert (= (and d!16776 (not c!3747)) b!52947))

(assert (= (and d!16776 res!44221) b!52946))

(assert (= (and b!52946 res!44222) b!52948))

(assert (= (and b!52948 res!44223) b!52945))

(declare-fun m!83379 () Bool)

(assert (=> b!52948 m!83379))

(declare-fun m!83381 () Bool)

(assert (=> b!52945 m!83381))

(declare-fun m!83383 () Bool)

(assert (=> b!52945 m!83383))

(assert (=> b!52945 m!83301))

(assert (=> b!52944 m!83301))

(declare-fun m!83385 () Bool)

(assert (=> b!52944 m!83385))

(declare-fun m!83387 () Bool)

(assert (=> b!52944 m!83387))

(declare-fun m!83389 () Bool)

(assert (=> d!16776 m!83389))

(declare-fun m!83391 () Bool)

(assert (=> d!16776 m!83391))

(declare-fun m!83393 () Bool)

(assert (=> d!16776 m!83393))

(assert (=> d!16776 m!83297))

(assert (=> d!16776 m!83299))

(declare-fun m!83395 () Bool)

(assert (=> d!16776 m!83395))

(assert (=> d!16776 m!83287))

(declare-fun m!83397 () Bool)

(assert (=> d!16776 m!83397))

(declare-fun m!83399 () Bool)

(assert (=> d!16776 m!83399))

(declare-fun m!83401 () Bool)

(assert (=> d!16776 m!83401))

(declare-fun m!83403 () Bool)

(assert (=> d!16776 m!83403))

(declare-fun m!83405 () Bool)

(assert (=> b!52946 m!83405))

(assert (=> b!52873 d!16776))

(declare-fun d!16782 () Bool)

(declare-fun res!44226 () Bool)

(declare-fun e!35272 () Bool)

(assert (=> d!16782 (=> (not res!44226) (not e!35272))))

(assert (=> d!16782 (= res!44226 (= (size!1140 (buf!1490 thiss!1379)) (size!1140 (buf!1490 (_2!2510 lt!81918)))))))

(assert (=> d!16782 (= (isPrefixOf!0 thiss!1379 (_2!2510 lt!81918)) e!35272)))

(declare-fun b!52949 () Bool)

(declare-fun res!44224 () Bool)

(assert (=> b!52949 (=> (not res!44224) (not e!35272))))

(assert (=> b!52949 (= res!44224 (bvsle (bitIndex!0 (size!1140 (buf!1490 thiss!1379)) (currentByte!3045 thiss!1379) (currentBit!3040 thiss!1379)) (bitIndex!0 (size!1140 (buf!1490 (_2!2510 lt!81918))) (currentByte!3045 (_2!2510 lt!81918)) (currentBit!3040 (_2!2510 lt!81918)))))))

(declare-fun b!52950 () Bool)

(declare-fun e!35271 () Bool)

(assert (=> b!52950 (= e!35272 e!35271)))

(declare-fun res!44225 () Bool)

(assert (=> b!52950 (=> res!44225 e!35271)))

(assert (=> b!52950 (= res!44225 (= (size!1140 (buf!1490 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!52951 () Bool)

(assert (=> b!52951 (= e!35271 (arrayBitRangesEq!0 (buf!1490 thiss!1379) (buf!1490 (_2!2510 lt!81918)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1140 (buf!1490 thiss!1379)) (currentByte!3045 thiss!1379) (currentBit!3040 thiss!1379))))))

(assert (= (and d!16782 res!44226) b!52949))

(assert (= (and b!52949 res!44224) b!52950))

(assert (= (and b!52950 (not res!44225)) b!52951))

(assert (=> b!52949 m!83301))

(assert (=> b!52949 m!83383))

(assert (=> b!52951 m!83301))

(assert (=> b!52951 m!83301))

(declare-fun m!83407 () Bool)

(assert (=> b!52951 m!83407))

(assert (=> b!52872 d!16782))

(declare-fun d!16784 () Bool)

(assert (=> d!16784 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1140 (buf!1490 (_2!2510 lt!81918)))) ((_ sign_extend 32) (currentByte!3045 (_2!2510 lt!81918))) ((_ sign_extend 32) (currentBit!3040 (_2!2510 lt!81918))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1140 (buf!1490 (_2!2510 lt!81918)))) ((_ sign_extend 32) (currentByte!3045 (_2!2510 lt!81918))) ((_ sign_extend 32) (currentBit!3040 (_2!2510 lt!81918)))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!4255 () Bool)

(assert (= bs!4255 d!16784))

(declare-fun m!83409 () Bool)

(assert (=> bs!4255 m!83409))

(assert (=> b!52872 d!16784))

(declare-fun d!16786 () Bool)

(declare-fun e!35275 () Bool)

(assert (=> d!16786 e!35275))

(declare-fun res!44229 () Bool)

(assert (=> d!16786 (=> (not res!44229) (not e!35275))))

(assert (=> d!16786 (= res!44229 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!82036 () Unit!3684)

(declare-fun choose!27 (BitStream!1972 BitStream!1972 (_ BitVec 64) (_ BitVec 64)) Unit!3684)

(assert (=> d!16786 (= lt!82036 (choose!27 thiss!1379 (_2!2510 lt!81918) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!16786 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!16786 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2510 lt!81918) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!82036)))

(declare-fun b!52954 () Bool)

(assert (=> b!52954 (= e!35275 (validate_offset_bits!1 ((_ sign_extend 32) (size!1140 (buf!1490 (_2!2510 lt!81918)))) ((_ sign_extend 32) (currentByte!3045 (_2!2510 lt!81918))) ((_ sign_extend 32) (currentBit!3040 (_2!2510 lt!81918))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!16786 res!44229) b!52954))

(declare-fun m!83411 () Bool)

(assert (=> d!16786 m!83411))

(assert (=> b!52954 m!83283))

(assert (=> b!52872 d!16786))

(declare-fun b!53052 () Bool)

(declare-fun e!35325 () Bool)

(declare-datatypes ((tuple2!4826 0))(
  ( (tuple2!4827 (_1!2518 BitStream!1972) (_2!2518 Bool)) )
))
(declare-fun lt!82247 () tuple2!4826)

(declare-fun lt!82251 () tuple2!4810)

(assert (=> b!53052 (= e!35325 (= (bitIndex!0 (size!1140 (buf!1490 (_1!2518 lt!82247))) (currentByte!3045 (_1!2518 lt!82247)) (currentBit!3040 (_1!2518 lt!82247))) (bitIndex!0 (size!1140 (buf!1490 (_2!2510 lt!82251))) (currentByte!3045 (_2!2510 lt!82251)) (currentBit!3040 (_2!2510 lt!82251)))))))

(declare-fun d!16788 () Bool)

(declare-fun e!35328 () Bool)

(assert (=> d!16788 e!35328))

(declare-fun res!44319 () Bool)

(assert (=> d!16788 (=> (not res!44319) (not e!35328))))

(assert (=> d!16788 (= res!44319 (= (size!1140 (buf!1490 (_2!2510 lt!82251))) (size!1140 (buf!1490 thiss!1379))))))

(declare-fun lt!82245 () (_ BitVec 8))

(declare-fun lt!82246 () array!2497)

(assert (=> d!16788 (= lt!82245 (select (arr!1676 lt!82246) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!16788 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1140 lt!82246)))))

(assert (=> d!16788 (= lt!82246 (array!2498 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!82243 () tuple2!4810)

(assert (=> d!16788 (= lt!82251 (tuple2!4811 (_1!2510 lt!82243) (_2!2510 lt!82243)))))

(declare-fun lt!82244 () tuple2!4810)

(assert (=> d!16788 (= lt!82243 lt!82244)))

(declare-fun e!35327 () Bool)

(assert (=> d!16788 e!35327))

(declare-fun res!44320 () Bool)

(assert (=> d!16788 (=> (not res!44320) (not e!35327))))

(assert (=> d!16788 (= res!44320 (= (size!1140 (buf!1490 thiss!1379)) (size!1140 (buf!1490 (_2!2510 lt!82244)))))))

(declare-fun lt!82252 () Bool)

(declare-fun appendBit!0 (BitStream!1972 Bool) tuple2!4810)

(assert (=> d!16788 (= lt!82244 (appendBit!0 thiss!1379 lt!82252))))

(assert (=> d!16788 (= lt!82252 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1676 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!16788 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!16788 (= (appendBitFromByte!0 thiss!1379 (select (arr!1676 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!82251)))

(declare-fun b!53053 () Bool)

(declare-fun res!44318 () Bool)

(assert (=> b!53053 (=> (not res!44318) (not e!35327))))

(assert (=> b!53053 (= res!44318 (isPrefixOf!0 thiss!1379 (_2!2510 lt!82244)))))

(declare-fun b!53054 () Bool)

(declare-fun res!44321 () Bool)

(assert (=> b!53054 (=> (not res!44321) (not e!35328))))

(assert (=> b!53054 (= res!44321 (isPrefixOf!0 thiss!1379 (_2!2510 lt!82251)))))

(declare-fun b!53055 () Bool)

(assert (=> b!53055 (= e!35328 e!35325)))

(declare-fun res!44317 () Bool)

(assert (=> b!53055 (=> (not res!44317) (not e!35325))))

(assert (=> b!53055 (= res!44317 (and (= (_2!2518 lt!82247) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1676 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!82245)) #b00000000000000000000000000000000))) (= (_1!2518 lt!82247) (_2!2510 lt!82251))))))

(declare-datatypes ((tuple2!4828 0))(
  ( (tuple2!4829 (_1!2519 array!2497) (_2!2519 BitStream!1972)) )
))
(declare-fun lt!82249 () tuple2!4828)

(declare-fun lt!82250 () BitStream!1972)

(declare-fun readBits!0 (BitStream!1972 (_ BitVec 64)) tuple2!4828)

(assert (=> b!53055 (= lt!82249 (readBits!0 lt!82250 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!1972) tuple2!4826)

(assert (=> b!53055 (= lt!82247 (readBitPure!0 lt!82250))))

(declare-fun readerFrom!0 (BitStream!1972 (_ BitVec 32) (_ BitVec 32)) BitStream!1972)

(assert (=> b!53055 (= lt!82250 (readerFrom!0 (_2!2510 lt!82251) (currentBit!3040 thiss!1379) (currentByte!3045 thiss!1379)))))

(declare-fun b!53056 () Bool)

(declare-fun res!44315 () Bool)

(assert (=> b!53056 (=> (not res!44315) (not e!35328))))

(declare-fun lt!82248 () (_ BitVec 64))

(declare-fun lt!82242 () (_ BitVec 64))

(assert (=> b!53056 (= res!44315 (= (bitIndex!0 (size!1140 (buf!1490 (_2!2510 lt!82251))) (currentByte!3045 (_2!2510 lt!82251)) (currentBit!3040 (_2!2510 lt!82251))) (bvadd lt!82242 lt!82248)))))

(assert (=> b!53056 (or (not (= (bvand lt!82242 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!82248 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!82242 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!82242 lt!82248) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!53056 (= lt!82248 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!53056 (= lt!82242 (bitIndex!0 (size!1140 (buf!1490 thiss!1379)) (currentByte!3045 thiss!1379) (currentBit!3040 thiss!1379)))))

(declare-fun b!53057 () Bool)

(declare-fun e!35326 () Bool)

(declare-fun lt!82253 () tuple2!4826)

(assert (=> b!53057 (= e!35326 (= (bitIndex!0 (size!1140 (buf!1490 (_1!2518 lt!82253))) (currentByte!3045 (_1!2518 lt!82253)) (currentBit!3040 (_1!2518 lt!82253))) (bitIndex!0 (size!1140 (buf!1490 (_2!2510 lt!82244))) (currentByte!3045 (_2!2510 lt!82244)) (currentBit!3040 (_2!2510 lt!82244)))))))

(declare-fun b!53058 () Bool)

(declare-fun res!44322 () Bool)

(assert (=> b!53058 (=> (not res!44322) (not e!35327))))

(assert (=> b!53058 (= res!44322 (= (bitIndex!0 (size!1140 (buf!1490 (_2!2510 lt!82244))) (currentByte!3045 (_2!2510 lt!82244)) (currentBit!3040 (_2!2510 lt!82244))) (bvadd (bitIndex!0 (size!1140 (buf!1490 thiss!1379)) (currentByte!3045 thiss!1379) (currentBit!3040 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!53059 () Bool)

(assert (=> b!53059 (= e!35327 e!35326)))

(declare-fun res!44316 () Bool)

(assert (=> b!53059 (=> (not res!44316) (not e!35326))))

(assert (=> b!53059 (= res!44316 (and (= (_2!2518 lt!82253) lt!82252) (= (_1!2518 lt!82253) (_2!2510 lt!82244))))))

(assert (=> b!53059 (= lt!82253 (readBitPure!0 (readerFrom!0 (_2!2510 lt!82244) (currentBit!3040 thiss!1379) (currentByte!3045 thiss!1379))))))

(assert (= (and d!16788 res!44320) b!53058))

(assert (= (and b!53058 res!44322) b!53053))

(assert (= (and b!53053 res!44318) b!53059))

(assert (= (and b!53059 res!44316) b!53057))

(assert (= (and d!16788 res!44319) b!53056))

(assert (= (and b!53056 res!44315) b!53054))

(assert (= (and b!53054 res!44321) b!53055))

(assert (= (and b!53055 res!44317) b!53052))

(declare-fun m!83509 () Bool)

(assert (=> b!53053 m!83509))

(declare-fun m!83513 () Bool)

(assert (=> b!53055 m!83513))

(declare-fun m!83515 () Bool)

(assert (=> b!53055 m!83515))

(declare-fun m!83517 () Bool)

(assert (=> b!53055 m!83517))

(declare-fun m!83521 () Bool)

(assert (=> b!53057 m!83521))

(declare-fun m!83523 () Bool)

(assert (=> b!53057 m!83523))

(declare-fun m!83525 () Bool)

(assert (=> b!53056 m!83525))

(assert (=> b!53056 m!83301))

(declare-fun m!83527 () Bool)

(assert (=> d!16788 m!83527))

(declare-fun m!83529 () Bool)

(assert (=> d!16788 m!83529))

(declare-fun m!83531 () Bool)

(assert (=> d!16788 m!83531))

(declare-fun m!83533 () Bool)

(assert (=> b!53054 m!83533))

(declare-fun m!83535 () Bool)

(assert (=> b!53052 m!83535))

(assert (=> b!53052 m!83525))

(declare-fun m!83537 () Bool)

(assert (=> b!53059 m!83537))

(assert (=> b!53059 m!83537))

(declare-fun m!83539 () Bool)

(assert (=> b!53059 m!83539))

(assert (=> b!53058 m!83523))

(assert (=> b!53058 m!83301))

(assert (=> b!52872 d!16788))

(push 1)

(assert (not d!16784))

(assert (not b!53059))

(assert (not b!53053))

(assert (not d!16768))

(assert (not b!53058))

(assert (not b!53054))

(assert (not b!52946))

(assert (not d!16750))

(assert (not b!52948))

(assert (not d!16772))

(assert (not d!16776))

(assert (not b!53055))

(assert (not d!16788))

(assert (not b!52944))

(assert (not b!53057))

(assert (not b!52951))

(assert (not b!53052))

(assert (not b!53056))

(assert (not b!52922))

(assert (not b!52954))

(assert (not b!52945))

(assert (not d!16758))

(assert (not b!52949))

(assert (not b!52924))

(assert (not d!16786))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

