; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!13522 () Bool)

(assert start!13522)

(declare-fun res!57318 () Bool)

(declare-fun e!45299 () Bool)

(assert (=> start!13522 (=> (not res!57318) (not e!45299))))

(declare-datatypes ((array!2903 0))(
  ( (array!2904 (arr!1927 (Array (_ BitVec 32) (_ BitVec 8))) (size!1348 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2903)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!13522 (= res!57318 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1348 srcBuffer!2))))))))

(assert (=> start!13522 e!45299))

(assert (=> start!13522 true))

(declare-fun array_inv!1209 (array!2903) Bool)

(assert (=> start!13522 (array_inv!1209 srcBuffer!2)))

(declare-datatypes ((BitStream!2300 0))(
  ( (BitStream!2301 (buf!1729 array!2903) (currentByte!3431 (_ BitVec 32)) (currentBit!3426 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2300)

(declare-fun e!45296 () Bool)

(declare-fun inv!12 (BitStream!2300) Bool)

(assert (=> start!13522 (and (inv!12 thiss!1379) e!45296)))

(declare-fun b!69348 () Bool)

(declare-fun e!45300 () Bool)

(declare-fun e!45293 () Bool)

(assert (=> b!69348 (= e!45300 e!45293)))

(declare-fun res!57307 () Bool)

(assert (=> b!69348 (=> res!57307 e!45293)))

(declare-fun lt!111200 () Bool)

(declare-datatypes ((Unit!4653 0))(
  ( (Unit!4654) )
))
(declare-datatypes ((tuple2!6056 0))(
  ( (tuple2!6057 (_1!3139 Unit!4653) (_2!3139 BitStream!2300)) )
))
(declare-fun lt!111204 () tuple2!6056)

(declare-datatypes ((List!725 0))(
  ( (Nil!722) (Cons!721 (h!840 Bool) (t!1475 List!725)) )
))
(declare-fun head!544 (List!725) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2300 array!2903 (_ BitVec 64) (_ BitVec 64)) List!725)

(assert (=> b!69348 (= res!57307 (not (= (head!544 (byteArrayBitContentToList!0 (_2!3139 lt!111204) srcBuffer!2 i!635 (bvsub to!314 i!635))) lt!111200)))))

(declare-fun bitAt!0 (array!2903 (_ BitVec 64)) Bool)

(assert (=> b!69348 (= lt!111200 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun b!69349 () Bool)

(assert (=> b!69349 (= e!45296 (array_inv!1209 (buf!1729 thiss!1379)))))

(declare-fun b!69350 () Bool)

(declare-fun res!57306 () Bool)

(declare-fun e!45294 () Bool)

(assert (=> b!69350 (=> res!57306 e!45294)))

(declare-fun lt!111209 () tuple2!6056)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!69350 (= res!57306 (not (invariant!0 (currentBit!3426 (_2!3139 lt!111209)) (currentByte!3431 (_2!3139 lt!111209)) (size!1348 (buf!1729 (_2!3139 lt!111204))))))))

(declare-fun b!69351 () Bool)

(declare-fun e!45303 () Bool)

(assert (=> b!69351 (= e!45303 e!45300)))

(declare-fun res!57312 () Bool)

(assert (=> b!69351 (=> res!57312 e!45300)))

(declare-datatypes ((tuple2!6058 0))(
  ( (tuple2!6059 (_1!3140 BitStream!2300) (_2!3140 BitStream!2300)) )
))
(declare-fun lt!111192 () tuple2!6058)

(declare-fun lt!111196 () Bool)

(declare-fun lt!111205 () (_ BitVec 64))

(assert (=> b!69351 (= res!57312 (not (= lt!111196 (bitAt!0 (buf!1729 (_1!3140 lt!111192)) lt!111205))))))

(declare-fun lt!111210 () tuple2!6058)

(assert (=> b!69351 (= lt!111196 (bitAt!0 (buf!1729 (_1!3140 lt!111210)) lt!111205))))

(declare-fun b!69352 () Bool)

(declare-fun res!57310 () Bool)

(declare-fun e!45302 () Bool)

(assert (=> b!69352 (=> res!57310 e!45302)))

(declare-fun lt!111191 () List!725)

(declare-fun length!353 (List!725) Int)

(assert (=> b!69352 (= res!57310 (<= (length!353 lt!111191) 0))))

(declare-fun b!69353 () Bool)

(declare-fun res!57311 () Bool)

(assert (=> b!69353 (=> res!57311 e!45300)))

(assert (=> b!69353 (= res!57311 (not (= (head!544 lt!111191) lt!111196)))))

(declare-fun b!69354 () Bool)

(declare-fun res!57322 () Bool)

(assert (=> b!69354 (=> res!57322 e!45294)))

(assert (=> b!69354 (= res!57322 (not (invariant!0 (currentBit!3426 (_2!3139 lt!111209)) (currentByte!3431 (_2!3139 lt!111209)) (size!1348 (buf!1729 (_2!3139 lt!111209))))))))

(declare-fun b!69355 () Bool)

(declare-fun lt!111208 () (_ BitVec 64))

(assert (=> b!69355 (= e!45293 (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 lt!111208) (bvsgt lt!111208 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1348 (buf!1729 (_2!3139 lt!111209)))))) (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!111205) (bvslt lt!111205 lt!111208))))))

(declare-fun b!69356 () Bool)

(declare-fun e!45292 () Bool)

(assert (=> b!69356 (= e!45299 (not e!45292))))

(declare-fun res!57324 () Bool)

(assert (=> b!69356 (=> res!57324 e!45292)))

(assert (=> b!69356 (= res!57324 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!2300 BitStream!2300) Bool)

(assert (=> b!69356 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!111194 () Unit!4653)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2300) Unit!4653)

(assert (=> b!69356 (= lt!111194 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!69356 (= lt!111205 (bitIndex!0 (size!1348 (buf!1729 thiss!1379)) (currentByte!3431 thiss!1379) (currentBit!3426 thiss!1379)))))

(declare-fun b!69357 () Bool)

(declare-fun e!45301 () Bool)

(declare-fun e!45295 () Bool)

(assert (=> b!69357 (= e!45301 e!45295)))

(declare-fun res!57323 () Bool)

(assert (=> b!69357 (=> res!57323 e!45295)))

(assert (=> b!69357 (= res!57323 (not (isPrefixOf!0 (_2!3139 lt!111209) (_2!3139 lt!111204))))))

(assert (=> b!69357 (isPrefixOf!0 thiss!1379 (_2!3139 lt!111204))))

(declare-fun lt!111201 () Unit!4653)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2300 BitStream!2300 BitStream!2300) Unit!4653)

(assert (=> b!69357 (= lt!111201 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3139 lt!111209) (_2!3139 lt!111204)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2300 array!2903 (_ BitVec 64) (_ BitVec 64)) tuple2!6056)

(assert (=> b!69357 (= lt!111204 (appendBitsMSBFirstLoop!0 (_2!3139 lt!111209) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!45304 () Bool)

(assert (=> b!69357 e!45304))

(declare-fun res!57309 () Bool)

(assert (=> b!69357 (=> (not res!57309) (not e!45304))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!69357 (= res!57309 (validate_offset_bits!1 ((_ sign_extend 32) (size!1348 (buf!1729 (_2!3139 lt!111209)))) ((_ sign_extend 32) (currentByte!3431 thiss!1379)) ((_ sign_extend 32) (currentBit!3426 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!111211 () Unit!4653)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2300 array!2903 (_ BitVec 64)) Unit!4653)

(assert (=> b!69357 (= lt!111211 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1729 (_2!3139 lt!111209)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!111195 () tuple2!6058)

(declare-fun reader!0 (BitStream!2300 BitStream!2300) tuple2!6058)

(assert (=> b!69357 (= lt!111195 (reader!0 thiss!1379 (_2!3139 lt!111209)))))

(declare-fun b!69358 () Bool)

(declare-fun res!57308 () Bool)

(declare-fun e!45298 () Bool)

(assert (=> b!69358 (=> res!57308 e!45298)))

(assert (=> b!69358 (= res!57308 (not (= (size!1348 (buf!1729 thiss!1379)) (size!1348 (buf!1729 (_2!3139 lt!111204))))))))

(declare-fun b!69359 () Bool)

(declare-fun res!57319 () Bool)

(assert (=> b!69359 (=> res!57319 e!45293)))

(assert (=> b!69359 (= res!57319 (not (= (bitAt!0 (buf!1729 (_2!3139 lt!111209)) lt!111205) lt!111200)))))

(declare-fun b!69360 () Bool)

(assert (=> b!69360 (= e!45292 e!45301)))

(declare-fun res!57315 () Bool)

(assert (=> b!69360 (=> res!57315 e!45301)))

(assert (=> b!69360 (= res!57315 (not (isPrefixOf!0 thiss!1379 (_2!3139 lt!111209))))))

(declare-fun lt!111207 () (_ BitVec 64))

(assert (=> b!69360 (validate_offset_bits!1 ((_ sign_extend 32) (size!1348 (buf!1729 (_2!3139 lt!111209)))) ((_ sign_extend 32) (currentByte!3431 (_2!3139 lt!111209))) ((_ sign_extend 32) (currentBit!3426 (_2!3139 lt!111209))) lt!111207)))

(assert (=> b!69360 (= lt!111207 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!111197 () Unit!4653)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2300 BitStream!2300 (_ BitVec 64) (_ BitVec 64)) Unit!4653)

(assert (=> b!69360 (= lt!111197 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3139 lt!111209) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2300 (_ BitVec 8) (_ BitVec 32)) tuple2!6056)

(assert (=> b!69360 (= lt!111209 (appendBitFromByte!0 thiss!1379 (select (arr!1927 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!69361 () Bool)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2300 BitStream!2300 (_ BitVec 64)) List!725)

(assert (=> b!69361 (= e!45304 (= (head!544 (byteArrayBitContentToList!0 (_2!3139 lt!111209) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!544 (bitStreamReadBitsIntoList!0 (_2!3139 lt!111209) (_1!3140 lt!111195) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!69362 () Bool)

(assert (=> b!69362 (= e!45294 e!45302)))

(declare-fun res!57320 () Bool)

(assert (=> b!69362 (=> res!57320 e!45302)))

(assert (=> b!69362 (= res!57320 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!111199 () List!725)

(assert (=> b!69362 (= lt!111199 (bitStreamReadBitsIntoList!0 (_2!3139 lt!111204) (_1!3140 lt!111192) lt!111207))))

(assert (=> b!69362 (= lt!111191 (bitStreamReadBitsIntoList!0 (_2!3139 lt!111204) (_1!3140 lt!111210) (bvsub to!314 i!635)))))

(assert (=> b!69362 (validate_offset_bits!1 ((_ sign_extend 32) (size!1348 (buf!1729 (_2!3139 lt!111204)))) ((_ sign_extend 32) (currentByte!3431 (_2!3139 lt!111209))) ((_ sign_extend 32) (currentBit!3426 (_2!3139 lt!111209))) lt!111207)))

(declare-fun lt!111206 () Unit!4653)

(assert (=> b!69362 (= lt!111206 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3139 lt!111209) (buf!1729 (_2!3139 lt!111204)) lt!111207))))

(assert (=> b!69362 (= lt!111192 (reader!0 (_2!3139 lt!111209) (_2!3139 lt!111204)))))

(assert (=> b!69362 (validate_offset_bits!1 ((_ sign_extend 32) (size!1348 (buf!1729 (_2!3139 lt!111204)))) ((_ sign_extend 32) (currentByte!3431 thiss!1379)) ((_ sign_extend 32) (currentBit!3426 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!111203 () Unit!4653)

(assert (=> b!69362 (= lt!111203 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1729 (_2!3139 lt!111204)) (bvsub to!314 i!635)))))

(assert (=> b!69362 (= lt!111210 (reader!0 thiss!1379 (_2!3139 lt!111204)))))

(declare-fun b!69363 () Bool)

(declare-fun res!57321 () Bool)

(assert (=> b!69363 (=> res!57321 e!45298)))

(assert (=> b!69363 (= res!57321 (not (invariant!0 (currentBit!3426 (_2!3139 lt!111204)) (currentByte!3431 (_2!3139 lt!111204)) (size!1348 (buf!1729 (_2!3139 lt!111204))))))))

(declare-fun b!69364 () Bool)

(assert (=> b!69364 (= e!45295 e!45298)))

(declare-fun res!57317 () Bool)

(assert (=> b!69364 (=> res!57317 e!45298)))

(declare-fun lt!111198 () (_ BitVec 64))

(assert (=> b!69364 (= res!57317 (not (= lt!111198 (bvsub (bvadd lt!111205 to!314) i!635))))))

(assert (=> b!69364 (= lt!111198 (bitIndex!0 (size!1348 (buf!1729 (_2!3139 lt!111204))) (currentByte!3431 (_2!3139 lt!111204)) (currentBit!3426 (_2!3139 lt!111204))))))

(declare-fun b!69365 () Bool)

(assert (=> b!69365 (= e!45302 e!45303)))

(declare-fun res!57316 () Bool)

(assert (=> b!69365 (=> res!57316 e!45303)))

(declare-fun lt!111202 () List!725)

(assert (=> b!69365 (= res!57316 (not (= lt!111202 lt!111199)))))

(assert (=> b!69365 (= lt!111199 lt!111202)))

(declare-fun tail!329 (List!725) List!725)

(assert (=> b!69365 (= lt!111202 (tail!329 lt!111191))))

(declare-fun lt!111193 () Unit!4653)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2300 BitStream!2300 BitStream!2300 BitStream!2300 (_ BitVec 64) List!725) Unit!4653)

(assert (=> b!69365 (= lt!111193 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3139 lt!111204) (_2!3139 lt!111204) (_1!3140 lt!111210) (_1!3140 lt!111192) (bvsub to!314 i!635) lt!111191))))

(declare-fun b!69366 () Bool)

(assert (=> b!69366 (= e!45298 e!45294)))

(declare-fun res!57313 () Bool)

(assert (=> b!69366 (=> res!57313 e!45294)))

(assert (=> b!69366 (= res!57313 (not (= (size!1348 (buf!1729 (_2!3139 lt!111209))) (size!1348 (buf!1729 (_2!3139 lt!111204))))))))

(assert (=> b!69366 (= lt!111198 (bvsub (bvsub (bvadd lt!111208 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!69366 (= lt!111208 (bitIndex!0 (size!1348 (buf!1729 (_2!3139 lt!111209))) (currentByte!3431 (_2!3139 lt!111209)) (currentBit!3426 (_2!3139 lt!111209))))))

(assert (=> b!69366 (= (size!1348 (buf!1729 (_2!3139 lt!111204))) (size!1348 (buf!1729 thiss!1379)))))

(declare-fun b!69367 () Bool)

(declare-fun res!57314 () Bool)

(assert (=> b!69367 (=> (not res!57314) (not e!45299))))

(assert (=> b!69367 (= res!57314 (validate_offset_bits!1 ((_ sign_extend 32) (size!1348 (buf!1729 thiss!1379))) ((_ sign_extend 32) (currentByte!3431 thiss!1379)) ((_ sign_extend 32) (currentBit!3426 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!13522 res!57318) b!69367))

(assert (= (and b!69367 res!57314) b!69356))

(assert (= (and b!69356 (not res!57324)) b!69360))

(assert (= (and b!69360 (not res!57315)) b!69357))

(assert (= (and b!69357 res!57309) b!69361))

(assert (= (and b!69357 (not res!57323)) b!69364))

(assert (= (and b!69364 (not res!57317)) b!69363))

(assert (= (and b!69363 (not res!57321)) b!69358))

(assert (= (and b!69358 (not res!57308)) b!69366))

(assert (= (and b!69366 (not res!57313)) b!69354))

(assert (= (and b!69354 (not res!57322)) b!69350))

(assert (= (and b!69350 (not res!57306)) b!69362))

(assert (= (and b!69362 (not res!57320)) b!69352))

(assert (= (and b!69352 (not res!57310)) b!69365))

(assert (= (and b!69365 (not res!57316)) b!69351))

(assert (= (and b!69351 (not res!57312)) b!69353))

(assert (= (and b!69353 (not res!57311)) b!69348))

(assert (= (and b!69348 (not res!57307)) b!69359))

(assert (= (and b!69359 (not res!57319)) b!69355))

(assert (= start!13522 b!69349))

(declare-fun m!110861 () Bool)

(assert (=> b!69364 m!110861))

(declare-fun m!110863 () Bool)

(assert (=> b!69360 m!110863))

(declare-fun m!110865 () Bool)

(assert (=> b!69360 m!110865))

(declare-fun m!110867 () Bool)

(assert (=> b!69360 m!110867))

(declare-fun m!110869 () Bool)

(assert (=> b!69360 m!110869))

(assert (=> b!69360 m!110863))

(declare-fun m!110871 () Bool)

(assert (=> b!69360 m!110871))

(declare-fun m!110873 () Bool)

(assert (=> b!69356 m!110873))

(declare-fun m!110875 () Bool)

(assert (=> b!69356 m!110875))

(declare-fun m!110877 () Bool)

(assert (=> b!69356 m!110877))

(declare-fun m!110879 () Bool)

(assert (=> b!69351 m!110879))

(declare-fun m!110881 () Bool)

(assert (=> b!69351 m!110881))

(declare-fun m!110883 () Bool)

(assert (=> b!69362 m!110883))

(declare-fun m!110885 () Bool)

(assert (=> b!69362 m!110885))

(declare-fun m!110887 () Bool)

(assert (=> b!69362 m!110887))

(declare-fun m!110889 () Bool)

(assert (=> b!69362 m!110889))

(declare-fun m!110891 () Bool)

(assert (=> b!69362 m!110891))

(declare-fun m!110893 () Bool)

(assert (=> b!69362 m!110893))

(declare-fun m!110895 () Bool)

(assert (=> b!69362 m!110895))

(declare-fun m!110897 () Bool)

(assert (=> b!69362 m!110897))

(declare-fun m!110899 () Bool)

(assert (=> b!69365 m!110899))

(declare-fun m!110901 () Bool)

(assert (=> b!69365 m!110901))

(declare-fun m!110903 () Bool)

(assert (=> b!69357 m!110903))

(declare-fun m!110905 () Bool)

(assert (=> b!69357 m!110905))

(declare-fun m!110907 () Bool)

(assert (=> b!69357 m!110907))

(declare-fun m!110909 () Bool)

(assert (=> b!69357 m!110909))

(declare-fun m!110911 () Bool)

(assert (=> b!69357 m!110911))

(declare-fun m!110913 () Bool)

(assert (=> b!69357 m!110913))

(declare-fun m!110915 () Bool)

(assert (=> b!69357 m!110915))

(declare-fun m!110917 () Bool)

(assert (=> b!69353 m!110917))

(declare-fun m!110919 () Bool)

(assert (=> b!69349 m!110919))

(declare-fun m!110921 () Bool)

(assert (=> b!69352 m!110921))

(declare-fun m!110923 () Bool)

(assert (=> b!69350 m!110923))

(declare-fun m!110925 () Bool)

(assert (=> b!69348 m!110925))

(assert (=> b!69348 m!110925))

(declare-fun m!110927 () Bool)

(assert (=> b!69348 m!110927))

(declare-fun m!110929 () Bool)

(assert (=> b!69348 m!110929))

(declare-fun m!110931 () Bool)

(assert (=> b!69366 m!110931))

(declare-fun m!110933 () Bool)

(assert (=> b!69367 m!110933))

(declare-fun m!110935 () Bool)

(assert (=> b!69361 m!110935))

(assert (=> b!69361 m!110935))

(declare-fun m!110937 () Bool)

(assert (=> b!69361 m!110937))

(declare-fun m!110939 () Bool)

(assert (=> b!69361 m!110939))

(assert (=> b!69361 m!110939))

(declare-fun m!110941 () Bool)

(assert (=> b!69361 m!110941))

(declare-fun m!110943 () Bool)

(assert (=> b!69363 m!110943))

(declare-fun m!110945 () Bool)

(assert (=> b!69354 m!110945))

(declare-fun m!110947 () Bool)

(assert (=> b!69359 m!110947))

(declare-fun m!110949 () Bool)

(assert (=> start!13522 m!110949))

(declare-fun m!110951 () Bool)

(assert (=> start!13522 m!110951))

(push 1)

(assert (not b!69366))

(assert (not b!69352))

(assert (not b!69362))

(assert (not b!69367))

(assert (not b!69361))

(assert (not b!69351))

(assert (not start!13522))

(assert (not b!69359))

(assert (not b!69353))

(assert (not b!69350))

(assert (not b!69356))

(assert (not b!69357))

(assert (not b!69365))

(assert (not b!69349))

(assert (not b!69360))

(assert (not b!69363))

(assert (not b!69354))

(assert (not b!69348))

(assert (not b!69364))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!22194 () Bool)

(assert (=> d!22194 (= (invariant!0 (currentBit!3426 (_2!3139 lt!111209)) (currentByte!3431 (_2!3139 lt!111209)) (size!1348 (buf!1729 (_2!3139 lt!111209)))) (and (bvsge (currentBit!3426 (_2!3139 lt!111209)) #b00000000000000000000000000000000) (bvslt (currentBit!3426 (_2!3139 lt!111209)) #b00000000000000000000000000001000) (bvsge (currentByte!3431 (_2!3139 lt!111209)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3431 (_2!3139 lt!111209)) (size!1348 (buf!1729 (_2!3139 lt!111209)))) (and (= (currentBit!3426 (_2!3139 lt!111209)) #b00000000000000000000000000000000) (= (currentByte!3431 (_2!3139 lt!111209)) (size!1348 (buf!1729 (_2!3139 lt!111209))))))))))

(assert (=> b!69354 d!22194))

(declare-fun d!22196 () Bool)

(assert (=> d!22196 (= (tail!329 lt!111191) (t!1475 lt!111191))))

(assert (=> b!69365 d!22196))

(declare-fun d!22198 () Bool)

(declare-fun e!45361 () Bool)

(assert (=> d!22198 e!45361))

(declare-fun res!57394 () Bool)

(assert (=> d!22198 (=> (not res!57394) (not e!45361))))

(declare-fun lt!111316 () (_ BitVec 64))

(assert (=> d!22198 (= res!57394 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!111316 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!111316) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!22198 (= lt!111316 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!111315 () Unit!4653)

(declare-fun choose!42 (BitStream!2300 BitStream!2300 BitStream!2300 BitStream!2300 (_ BitVec 64) List!725) Unit!4653)

(assert (=> d!22198 (= lt!111315 (choose!42 (_2!3139 lt!111204) (_2!3139 lt!111204) (_1!3140 lt!111210) (_1!3140 lt!111192) (bvsub to!314 i!635) lt!111191))))

(assert (=> d!22198 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!22198 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3139 lt!111204) (_2!3139 lt!111204) (_1!3140 lt!111210) (_1!3140 lt!111192) (bvsub to!314 i!635) lt!111191) lt!111315)))

(declare-fun b!69458 () Bool)

(assert (=> b!69458 (= e!45361 (= (bitStreamReadBitsIntoList!0 (_2!3139 lt!111204) (_1!3140 lt!111192) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!329 lt!111191)))))

(assert (= (and d!22198 res!57394) b!69458))

(declare-fun m!111045 () Bool)

(assert (=> d!22198 m!111045))

(declare-fun m!111047 () Bool)

(assert (=> b!69458 m!111047))

(assert (=> b!69458 m!110899))

(assert (=> b!69365 d!22198))

(declare-fun d!22200 () Bool)

(declare-fun e!45364 () Bool)

(assert (=> d!22200 e!45364))

(declare-fun res!57400 () Bool)

(assert (=> d!22200 (=> (not res!57400) (not e!45364))))

(declare-fun lt!111331 () (_ BitVec 64))

(declare-fun lt!111334 () (_ BitVec 64))

(declare-fun lt!111330 () (_ BitVec 64))

(assert (=> d!22200 (= res!57400 (= lt!111334 (bvsub lt!111330 lt!111331)))))

(assert (=> d!22200 (or (= (bvand lt!111330 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!111331 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!111330 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!111330 lt!111331) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!22200 (= lt!111331 (remainingBits!0 ((_ sign_extend 32) (size!1348 (buf!1729 (_2!3139 lt!111204)))) ((_ sign_extend 32) (currentByte!3431 (_2!3139 lt!111204))) ((_ sign_extend 32) (currentBit!3426 (_2!3139 lt!111204)))))))

(declare-fun lt!111332 () (_ BitVec 64))

(declare-fun lt!111333 () (_ BitVec 64))

(assert (=> d!22200 (= lt!111330 (bvmul lt!111332 lt!111333))))

(assert (=> d!22200 (or (= lt!111332 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!111333 (bvsdiv (bvmul lt!111332 lt!111333) lt!111332)))))

(assert (=> d!22200 (= lt!111333 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!22200 (= lt!111332 ((_ sign_extend 32) (size!1348 (buf!1729 (_2!3139 lt!111204)))))))

(assert (=> d!22200 (= lt!111334 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3431 (_2!3139 lt!111204))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3426 (_2!3139 lt!111204)))))))

(assert (=> d!22200 (invariant!0 (currentBit!3426 (_2!3139 lt!111204)) (currentByte!3431 (_2!3139 lt!111204)) (size!1348 (buf!1729 (_2!3139 lt!111204))))))

(assert (=> d!22200 (= (bitIndex!0 (size!1348 (buf!1729 (_2!3139 lt!111204))) (currentByte!3431 (_2!3139 lt!111204)) (currentBit!3426 (_2!3139 lt!111204))) lt!111334)))

(declare-fun b!69463 () Bool)

(declare-fun res!57399 () Bool)

(assert (=> b!69463 (=> (not res!57399) (not e!45364))))

(assert (=> b!69463 (= res!57399 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!111334))))

(declare-fun b!69464 () Bool)

(declare-fun lt!111329 () (_ BitVec 64))

(assert (=> b!69464 (= e!45364 (bvsle lt!111334 (bvmul lt!111329 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!69464 (or (= lt!111329 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!111329 #b0000000000000000000000000000000000000000000000000000000000001000) lt!111329)))))

(assert (=> b!69464 (= lt!111329 ((_ sign_extend 32) (size!1348 (buf!1729 (_2!3139 lt!111204)))))))

(assert (= (and d!22200 res!57400) b!69463))

(assert (= (and b!69463 res!57399) b!69464))

(declare-fun m!111049 () Bool)

(assert (=> d!22200 m!111049))

(assert (=> d!22200 m!110943))

(assert (=> b!69364 d!22200))

(declare-fun d!22202 () Bool)

(declare-fun e!45365 () Bool)

(assert (=> d!22202 e!45365))

(declare-fun res!57402 () Bool)

(assert (=> d!22202 (=> (not res!57402) (not e!45365))))

(declare-fun lt!111336 () (_ BitVec 64))

(declare-fun lt!111340 () (_ BitVec 64))

(declare-fun lt!111337 () (_ BitVec 64))

(assert (=> d!22202 (= res!57402 (= lt!111340 (bvsub lt!111336 lt!111337)))))

(assert (=> d!22202 (or (= (bvand lt!111336 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!111337 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!111336 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!111336 lt!111337) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!22202 (= lt!111337 (remainingBits!0 ((_ sign_extend 32) (size!1348 (buf!1729 (_2!3139 lt!111209)))) ((_ sign_extend 32) (currentByte!3431 (_2!3139 lt!111209))) ((_ sign_extend 32) (currentBit!3426 (_2!3139 lt!111209)))))))

(declare-fun lt!111338 () (_ BitVec 64))

(declare-fun lt!111339 () (_ BitVec 64))

(assert (=> d!22202 (= lt!111336 (bvmul lt!111338 lt!111339))))

(assert (=> d!22202 (or (= lt!111338 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!111339 (bvsdiv (bvmul lt!111338 lt!111339) lt!111338)))))

(assert (=> d!22202 (= lt!111339 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!22202 (= lt!111338 ((_ sign_extend 32) (size!1348 (buf!1729 (_2!3139 lt!111209)))))))

(assert (=> d!22202 (= lt!111340 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3431 (_2!3139 lt!111209))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3426 (_2!3139 lt!111209)))))))

(assert (=> d!22202 (invariant!0 (currentBit!3426 (_2!3139 lt!111209)) (currentByte!3431 (_2!3139 lt!111209)) (size!1348 (buf!1729 (_2!3139 lt!111209))))))

(assert (=> d!22202 (= (bitIndex!0 (size!1348 (buf!1729 (_2!3139 lt!111209))) (currentByte!3431 (_2!3139 lt!111209)) (currentBit!3426 (_2!3139 lt!111209))) lt!111340)))

(declare-fun b!69465 () Bool)

(declare-fun res!57401 () Bool)

(assert (=> b!69465 (=> (not res!57401) (not e!45365))))

(assert (=> b!69465 (= res!57401 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!111340))))

(declare-fun b!69466 () Bool)

(declare-fun lt!111335 () (_ BitVec 64))

(assert (=> b!69466 (= e!45365 (bvsle lt!111340 (bvmul lt!111335 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!69466 (or (= lt!111335 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!111335 #b0000000000000000000000000000000000000000000000000000000000001000) lt!111335)))))

(assert (=> b!69466 (= lt!111335 ((_ sign_extend 32) (size!1348 (buf!1729 (_2!3139 lt!111209)))))))

(assert (= (and d!22202 res!57402) b!69465))

(assert (= (and b!69465 res!57401) b!69466))

(declare-fun m!111051 () Bool)

(assert (=> d!22202 m!111051))

(assert (=> d!22202 m!110945))

(assert (=> b!69366 d!22202))

(declare-fun d!22204 () Bool)

(assert (=> d!22204 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1348 (buf!1729 (_2!3139 lt!111204)))) ((_ sign_extend 32) (currentByte!3431 (_2!3139 lt!111209))) ((_ sign_extend 32) (currentBit!3426 (_2!3139 lt!111209))) lt!111207) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1348 (buf!1729 (_2!3139 lt!111204)))) ((_ sign_extend 32) (currentByte!3431 (_2!3139 lt!111209))) ((_ sign_extend 32) (currentBit!3426 (_2!3139 lt!111209)))) lt!111207))))

(declare-fun bs!5342 () Bool)

(assert (= bs!5342 d!22204))

(declare-fun m!111053 () Bool)

(assert (=> bs!5342 m!111053))

(assert (=> b!69362 d!22204))

(declare-fun d!22206 () Bool)

(assert (=> d!22206 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1348 (buf!1729 (_2!3139 lt!111204)))) ((_ sign_extend 32) (currentByte!3431 thiss!1379)) ((_ sign_extend 32) (currentBit!3426 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1348 (buf!1729 (_2!3139 lt!111204)))) ((_ sign_extend 32) (currentByte!3431 thiss!1379)) ((_ sign_extend 32) (currentBit!3426 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5343 () Bool)

(assert (= bs!5343 d!22206))

(declare-fun m!111055 () Bool)

(assert (=> bs!5343 m!111055))

(assert (=> b!69362 d!22206))

(declare-fun d!22208 () Bool)

(assert (=> d!22208 (validate_offset_bits!1 ((_ sign_extend 32) (size!1348 (buf!1729 (_2!3139 lt!111204)))) ((_ sign_extend 32) (currentByte!3431 (_2!3139 lt!111209))) ((_ sign_extend 32) (currentBit!3426 (_2!3139 lt!111209))) lt!111207)))

(declare-fun lt!111343 () Unit!4653)

(declare-fun choose!9 (BitStream!2300 array!2903 (_ BitVec 64) BitStream!2300) Unit!4653)

(assert (=> d!22208 (= lt!111343 (choose!9 (_2!3139 lt!111209) (buf!1729 (_2!3139 lt!111204)) lt!111207 (BitStream!2301 (buf!1729 (_2!3139 lt!111204)) (currentByte!3431 (_2!3139 lt!111209)) (currentBit!3426 (_2!3139 lt!111209)))))))

(assert (=> d!22208 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3139 lt!111209) (buf!1729 (_2!3139 lt!111204)) lt!111207) lt!111343)))

(declare-fun bs!5344 () Bool)

(assert (= bs!5344 d!22208))

(assert (=> bs!5344 m!110889))

(declare-fun m!111057 () Bool)

(assert (=> bs!5344 m!111057))

(assert (=> b!69362 d!22208))

(declare-fun b!69478 () Bool)

(declare-fun e!45370 () Bool)

(declare-fun lt!111351 () List!725)

(assert (=> b!69478 (= e!45370 (> (length!353 lt!111351) 0))))

(declare-fun d!22210 () Bool)

(assert (=> d!22210 e!45370))

(declare-fun c!5139 () Bool)

(assert (=> d!22210 (= c!5139 (= lt!111207 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!6068 0))(
  ( (tuple2!6069 (_1!3145 List!725) (_2!3145 BitStream!2300)) )
))
(declare-fun e!45371 () tuple2!6068)

(assert (=> d!22210 (= lt!111351 (_1!3145 e!45371))))

(declare-fun c!5140 () Bool)

(assert (=> d!22210 (= c!5140 (= lt!111207 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!22210 (bvsge lt!111207 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!22210 (= (bitStreamReadBitsIntoList!0 (_2!3139 lt!111204) (_1!3140 lt!111192) lt!111207) lt!111351)))

(declare-fun b!69477 () Bool)

(declare-fun isEmpty!223 (List!725) Bool)

(assert (=> b!69477 (= e!45370 (isEmpty!223 lt!111351))))

(declare-fun b!69475 () Bool)

(assert (=> b!69475 (= e!45371 (tuple2!6069 Nil!722 (_1!3140 lt!111192)))))

(declare-fun b!69476 () Bool)

(declare-fun lt!111352 () (_ BitVec 64))

(declare-datatypes ((tuple2!6070 0))(
  ( (tuple2!6071 (_1!3146 Bool) (_2!3146 BitStream!2300)) )
))
(declare-fun lt!111350 () tuple2!6070)

(assert (=> b!69476 (= e!45371 (tuple2!6069 (Cons!721 (_1!3146 lt!111350) (bitStreamReadBitsIntoList!0 (_2!3139 lt!111204) (_2!3146 lt!111350) (bvsub lt!111207 lt!111352))) (_2!3146 lt!111350)))))

(declare-fun readBit!0 (BitStream!2300) tuple2!6070)

(assert (=> b!69476 (= lt!111350 (readBit!0 (_1!3140 lt!111192)))))

(assert (=> b!69476 (= lt!111352 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!22210 c!5140) b!69475))

(assert (= (and d!22210 (not c!5140)) b!69476))

(assert (= (and d!22210 c!5139) b!69477))

(assert (= (and d!22210 (not c!5139)) b!69478))

(declare-fun m!111059 () Bool)

(assert (=> b!69478 m!111059))

(declare-fun m!111061 () Bool)

(assert (=> b!69477 m!111061))

(declare-fun m!111063 () Bool)

(assert (=> b!69476 m!111063))

(declare-fun m!111065 () Bool)

(assert (=> b!69476 m!111065))

(assert (=> b!69362 d!22210))

(declare-fun b!69482 () Bool)

(declare-fun e!45372 () Bool)

(declare-fun lt!111354 () List!725)

(assert (=> b!69482 (= e!45372 (> (length!353 lt!111354) 0))))

(declare-fun d!22212 () Bool)

(assert (=> d!22212 e!45372))

(declare-fun c!5141 () Bool)

(assert (=> d!22212 (= c!5141 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!45373 () tuple2!6068)

(assert (=> d!22212 (= lt!111354 (_1!3145 e!45373))))

(declare-fun c!5142 () Bool)

(assert (=> d!22212 (= c!5142 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!22212 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!22212 (= (bitStreamReadBitsIntoList!0 (_2!3139 lt!111204) (_1!3140 lt!111210) (bvsub to!314 i!635)) lt!111354)))

(declare-fun b!69481 () Bool)

(assert (=> b!69481 (= e!45372 (isEmpty!223 lt!111354))))

(declare-fun b!69479 () Bool)

(assert (=> b!69479 (= e!45373 (tuple2!6069 Nil!722 (_1!3140 lt!111210)))))

(declare-fun lt!111353 () tuple2!6070)

(declare-fun b!69480 () Bool)

(declare-fun lt!111355 () (_ BitVec 64))

(assert (=> b!69480 (= e!45373 (tuple2!6069 (Cons!721 (_1!3146 lt!111353) (bitStreamReadBitsIntoList!0 (_2!3139 lt!111204) (_2!3146 lt!111353) (bvsub (bvsub to!314 i!635) lt!111355))) (_2!3146 lt!111353)))))

(assert (=> b!69480 (= lt!111353 (readBit!0 (_1!3140 lt!111210)))))

(assert (=> b!69480 (= lt!111355 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!22212 c!5142) b!69479))

(assert (= (and d!22212 (not c!5142)) b!69480))

(assert (= (and d!22212 c!5141) b!69481))

(assert (= (and d!22212 (not c!5141)) b!69482))

(declare-fun m!111067 () Bool)

(assert (=> b!69482 m!111067))

(declare-fun m!111069 () Bool)

(assert (=> b!69481 m!111069))

(declare-fun m!111071 () Bool)

(assert (=> b!69480 m!111071))

(declare-fun m!111073 () Bool)

(assert (=> b!69480 m!111073))

(assert (=> b!69362 d!22212))

(declare-fun b!69518 () Bool)

(declare-fun res!57435 () Bool)

(declare-fun e!45391 () Bool)

(assert (=> b!69518 (=> (not res!57435) (not e!45391))))

(declare-fun lt!111433 () tuple2!6058)

(assert (=> b!69518 (= res!57435 (isPrefixOf!0 (_2!3140 lt!111433) (_2!3139 lt!111204)))))

(declare-fun b!69519 () Bool)

(declare-fun lt!111436 () (_ BitVec 64))

(declare-fun lt!111435 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!2300 (_ BitVec 64)) BitStream!2300)

(assert (=> b!69519 (= e!45391 (= (_1!3140 lt!111433) (withMovedBitIndex!0 (_2!3140 lt!111433) (bvsub lt!111436 lt!111435))))))

(assert (=> b!69519 (or (= (bvand lt!111436 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!111435 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!111436 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!111436 lt!111435) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!69519 (= lt!111435 (bitIndex!0 (size!1348 (buf!1729 (_2!3139 lt!111204))) (currentByte!3431 (_2!3139 lt!111204)) (currentBit!3426 (_2!3139 lt!111204))))))

(assert (=> b!69519 (= lt!111436 (bitIndex!0 (size!1348 (buf!1729 thiss!1379)) (currentByte!3431 thiss!1379) (currentBit!3426 thiss!1379)))))

(declare-fun b!69520 () Bool)

(declare-fun res!57433 () Bool)

(assert (=> b!69520 (=> (not res!57433) (not e!45391))))

(assert (=> b!69520 (= res!57433 (isPrefixOf!0 (_1!3140 lt!111433) thiss!1379))))

(declare-fun d!22214 () Bool)

(assert (=> d!22214 e!45391))

(declare-fun res!57434 () Bool)

(assert (=> d!22214 (=> (not res!57434) (not e!45391))))

(assert (=> d!22214 (= res!57434 (isPrefixOf!0 (_1!3140 lt!111433) (_2!3140 lt!111433)))))

(declare-fun lt!111449 () BitStream!2300)

(assert (=> d!22214 (= lt!111433 (tuple2!6059 lt!111449 (_2!3139 lt!111204)))))

(declare-fun lt!111443 () Unit!4653)

(declare-fun lt!111437 () Unit!4653)

(assert (=> d!22214 (= lt!111443 lt!111437)))

(assert (=> d!22214 (isPrefixOf!0 lt!111449 (_2!3139 lt!111204))))

(assert (=> d!22214 (= lt!111437 (lemmaIsPrefixTransitive!0 lt!111449 (_2!3139 lt!111204) (_2!3139 lt!111204)))))

(declare-fun lt!111446 () Unit!4653)

(declare-fun lt!111441 () Unit!4653)

(assert (=> d!22214 (= lt!111446 lt!111441)))

(assert (=> d!22214 (isPrefixOf!0 lt!111449 (_2!3139 lt!111204))))

(assert (=> d!22214 (= lt!111441 (lemmaIsPrefixTransitive!0 lt!111449 thiss!1379 (_2!3139 lt!111204)))))

(declare-fun lt!111450 () Unit!4653)

(declare-fun e!45390 () Unit!4653)

(assert (=> d!22214 (= lt!111450 e!45390)))

(declare-fun c!5145 () Bool)

(assert (=> d!22214 (= c!5145 (not (= (size!1348 (buf!1729 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!111444 () Unit!4653)

(declare-fun lt!111442 () Unit!4653)

(assert (=> d!22214 (= lt!111444 lt!111442)))

(assert (=> d!22214 (isPrefixOf!0 (_2!3139 lt!111204) (_2!3139 lt!111204))))

(assert (=> d!22214 (= lt!111442 (lemmaIsPrefixRefl!0 (_2!3139 lt!111204)))))

(declare-fun lt!111448 () Unit!4653)

(declare-fun lt!111432 () Unit!4653)

(assert (=> d!22214 (= lt!111448 lt!111432)))

(assert (=> d!22214 (= lt!111432 (lemmaIsPrefixRefl!0 (_2!3139 lt!111204)))))

(declare-fun lt!111445 () Unit!4653)

(declare-fun lt!111439 () Unit!4653)

(assert (=> d!22214 (= lt!111445 lt!111439)))

(assert (=> d!22214 (isPrefixOf!0 lt!111449 lt!111449)))

(assert (=> d!22214 (= lt!111439 (lemmaIsPrefixRefl!0 lt!111449))))

(declare-fun lt!111451 () Unit!4653)

(declare-fun lt!111434 () Unit!4653)

(assert (=> d!22214 (= lt!111451 lt!111434)))

(assert (=> d!22214 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!22214 (= lt!111434 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!22214 (= lt!111449 (BitStream!2301 (buf!1729 (_2!3139 lt!111204)) (currentByte!3431 thiss!1379) (currentBit!3426 thiss!1379)))))

(assert (=> d!22214 (isPrefixOf!0 thiss!1379 (_2!3139 lt!111204))))

(assert (=> d!22214 (= (reader!0 thiss!1379 (_2!3139 lt!111204)) lt!111433)))

(declare-fun b!69521 () Bool)

(declare-fun lt!111438 () Unit!4653)

(assert (=> b!69521 (= e!45390 lt!111438)))

(declare-fun lt!111440 () (_ BitVec 64))

(assert (=> b!69521 (= lt!111440 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!111447 () (_ BitVec 64))

(assert (=> b!69521 (= lt!111447 (bitIndex!0 (size!1348 (buf!1729 thiss!1379)) (currentByte!3431 thiss!1379) (currentBit!3426 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2903 array!2903 (_ BitVec 64) (_ BitVec 64)) Unit!4653)

(assert (=> b!69521 (= lt!111438 (arrayBitRangesEqSymmetric!0 (buf!1729 thiss!1379) (buf!1729 (_2!3139 lt!111204)) lt!111440 lt!111447))))

(declare-fun arrayBitRangesEq!0 (array!2903 array!2903 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!69521 (arrayBitRangesEq!0 (buf!1729 (_2!3139 lt!111204)) (buf!1729 thiss!1379) lt!111440 lt!111447)))

(declare-fun b!69522 () Bool)

(declare-fun Unit!4665 () Unit!4653)

(assert (=> b!69522 (= e!45390 Unit!4665)))

(assert (= (and d!22214 c!5145) b!69521))

(assert (= (and d!22214 (not c!5145)) b!69522))

(assert (= (and d!22214 res!57434) b!69520))

(assert (= (and b!69520 res!57433) b!69518))

(assert (= (and b!69518 res!57435) b!69519))

(declare-fun m!111103 () Bool)

(assert (=> b!69520 m!111103))

(declare-fun m!111105 () Bool)

(assert (=> b!69519 m!111105))

(assert (=> b!69519 m!110861))

(assert (=> b!69519 m!110877))

(assert (=> b!69521 m!110877))

(declare-fun m!111107 () Bool)

(assert (=> b!69521 m!111107))

(declare-fun m!111109 () Bool)

(assert (=> b!69521 m!111109))

(declare-fun m!111111 () Bool)

(assert (=> b!69518 m!111111))

(declare-fun m!111113 () Bool)

(assert (=> d!22214 m!111113))

(declare-fun m!111115 () Bool)

(assert (=> d!22214 m!111115))

(declare-fun m!111117 () Bool)

(assert (=> d!22214 m!111117))

(declare-fun m!111119 () Bool)

(assert (=> d!22214 m!111119))

(assert (=> d!22214 m!110875))

(declare-fun m!111121 () Bool)

(assert (=> d!22214 m!111121))

(declare-fun m!111123 () Bool)

(assert (=> d!22214 m!111123))

(assert (=> d!22214 m!110905))

(declare-fun m!111125 () Bool)

(assert (=> d!22214 m!111125))

(assert (=> d!22214 m!110873))

(declare-fun m!111127 () Bool)

(assert (=> d!22214 m!111127))

(assert (=> b!69362 d!22214))

(declare-fun b!69523 () Bool)

(declare-fun res!57438 () Bool)

(declare-fun e!45393 () Bool)

(assert (=> b!69523 (=> (not res!57438) (not e!45393))))

(declare-fun lt!111453 () tuple2!6058)

(assert (=> b!69523 (= res!57438 (isPrefixOf!0 (_2!3140 lt!111453) (_2!3139 lt!111204)))))

(declare-fun b!69524 () Bool)

(declare-fun lt!111456 () (_ BitVec 64))

(declare-fun lt!111455 () (_ BitVec 64))

(assert (=> b!69524 (= e!45393 (= (_1!3140 lt!111453) (withMovedBitIndex!0 (_2!3140 lt!111453) (bvsub lt!111456 lt!111455))))))

(assert (=> b!69524 (or (= (bvand lt!111456 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!111455 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!111456 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!111456 lt!111455) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!69524 (= lt!111455 (bitIndex!0 (size!1348 (buf!1729 (_2!3139 lt!111204))) (currentByte!3431 (_2!3139 lt!111204)) (currentBit!3426 (_2!3139 lt!111204))))))

(assert (=> b!69524 (= lt!111456 (bitIndex!0 (size!1348 (buf!1729 (_2!3139 lt!111209))) (currentByte!3431 (_2!3139 lt!111209)) (currentBit!3426 (_2!3139 lt!111209))))))

(declare-fun b!69525 () Bool)

(declare-fun res!57436 () Bool)

(assert (=> b!69525 (=> (not res!57436) (not e!45393))))

(assert (=> b!69525 (= res!57436 (isPrefixOf!0 (_1!3140 lt!111453) (_2!3139 lt!111209)))))

(declare-fun d!22220 () Bool)

(assert (=> d!22220 e!45393))

(declare-fun res!57437 () Bool)

(assert (=> d!22220 (=> (not res!57437) (not e!45393))))

(assert (=> d!22220 (= res!57437 (isPrefixOf!0 (_1!3140 lt!111453) (_2!3140 lt!111453)))))

(declare-fun lt!111469 () BitStream!2300)

(assert (=> d!22220 (= lt!111453 (tuple2!6059 lt!111469 (_2!3139 lt!111204)))))

(declare-fun lt!111463 () Unit!4653)

(declare-fun lt!111457 () Unit!4653)

(assert (=> d!22220 (= lt!111463 lt!111457)))

(assert (=> d!22220 (isPrefixOf!0 lt!111469 (_2!3139 lt!111204))))

(assert (=> d!22220 (= lt!111457 (lemmaIsPrefixTransitive!0 lt!111469 (_2!3139 lt!111204) (_2!3139 lt!111204)))))

(declare-fun lt!111466 () Unit!4653)

(declare-fun lt!111461 () Unit!4653)

(assert (=> d!22220 (= lt!111466 lt!111461)))

(assert (=> d!22220 (isPrefixOf!0 lt!111469 (_2!3139 lt!111204))))

(assert (=> d!22220 (= lt!111461 (lemmaIsPrefixTransitive!0 lt!111469 (_2!3139 lt!111209) (_2!3139 lt!111204)))))

(declare-fun lt!111470 () Unit!4653)

(declare-fun e!45392 () Unit!4653)

(assert (=> d!22220 (= lt!111470 e!45392)))

(declare-fun c!5146 () Bool)

(assert (=> d!22220 (= c!5146 (not (= (size!1348 (buf!1729 (_2!3139 lt!111209))) #b00000000000000000000000000000000)))))

(declare-fun lt!111464 () Unit!4653)

(declare-fun lt!111462 () Unit!4653)

(assert (=> d!22220 (= lt!111464 lt!111462)))

(assert (=> d!22220 (isPrefixOf!0 (_2!3139 lt!111204) (_2!3139 lt!111204))))

(assert (=> d!22220 (= lt!111462 (lemmaIsPrefixRefl!0 (_2!3139 lt!111204)))))

(declare-fun lt!111468 () Unit!4653)

(declare-fun lt!111452 () Unit!4653)

(assert (=> d!22220 (= lt!111468 lt!111452)))

(assert (=> d!22220 (= lt!111452 (lemmaIsPrefixRefl!0 (_2!3139 lt!111204)))))

(declare-fun lt!111465 () Unit!4653)

(declare-fun lt!111459 () Unit!4653)

(assert (=> d!22220 (= lt!111465 lt!111459)))

(assert (=> d!22220 (isPrefixOf!0 lt!111469 lt!111469)))

(assert (=> d!22220 (= lt!111459 (lemmaIsPrefixRefl!0 lt!111469))))

(declare-fun lt!111471 () Unit!4653)

(declare-fun lt!111454 () Unit!4653)

(assert (=> d!22220 (= lt!111471 lt!111454)))

(assert (=> d!22220 (isPrefixOf!0 (_2!3139 lt!111209) (_2!3139 lt!111209))))

(assert (=> d!22220 (= lt!111454 (lemmaIsPrefixRefl!0 (_2!3139 lt!111209)))))

(assert (=> d!22220 (= lt!111469 (BitStream!2301 (buf!1729 (_2!3139 lt!111204)) (currentByte!3431 (_2!3139 lt!111209)) (currentBit!3426 (_2!3139 lt!111209))))))

(assert (=> d!22220 (isPrefixOf!0 (_2!3139 lt!111209) (_2!3139 lt!111204))))

(assert (=> d!22220 (= (reader!0 (_2!3139 lt!111209) (_2!3139 lt!111204)) lt!111453)))

(declare-fun b!69526 () Bool)

(declare-fun lt!111458 () Unit!4653)

(assert (=> b!69526 (= e!45392 lt!111458)))

(declare-fun lt!111460 () (_ BitVec 64))

(assert (=> b!69526 (= lt!111460 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!111467 () (_ BitVec 64))

(assert (=> b!69526 (= lt!111467 (bitIndex!0 (size!1348 (buf!1729 (_2!3139 lt!111209))) (currentByte!3431 (_2!3139 lt!111209)) (currentBit!3426 (_2!3139 lt!111209))))))

(assert (=> b!69526 (= lt!111458 (arrayBitRangesEqSymmetric!0 (buf!1729 (_2!3139 lt!111209)) (buf!1729 (_2!3139 lt!111204)) lt!111460 lt!111467))))

(assert (=> b!69526 (arrayBitRangesEq!0 (buf!1729 (_2!3139 lt!111204)) (buf!1729 (_2!3139 lt!111209)) lt!111460 lt!111467)))

(declare-fun b!69527 () Bool)

(declare-fun Unit!4666 () Unit!4653)

(assert (=> b!69527 (= e!45392 Unit!4666)))

(assert (= (and d!22220 c!5146) b!69526))

(assert (= (and d!22220 (not c!5146)) b!69527))

(assert (= (and d!22220 res!57437) b!69525))

(assert (= (and b!69525 res!57436) b!69523))

(assert (= (and b!69523 res!57438) b!69524))

(declare-fun m!111129 () Bool)

(assert (=> b!69525 m!111129))

(declare-fun m!111131 () Bool)

(assert (=> b!69524 m!111131))

(assert (=> b!69524 m!110861))

(assert (=> b!69524 m!110931))

(assert (=> b!69526 m!110931))

(declare-fun m!111133 () Bool)

(assert (=> b!69526 m!111133))

(declare-fun m!111135 () Bool)

(assert (=> b!69526 m!111135))

(declare-fun m!111137 () Bool)

(assert (=> b!69523 m!111137))

(declare-fun m!111139 () Bool)

(assert (=> d!22220 m!111139))

(declare-fun m!111141 () Bool)

(assert (=> d!22220 m!111141))

(assert (=> d!22220 m!111117))

(declare-fun m!111143 () Bool)

(assert (=> d!22220 m!111143))

(declare-fun m!111145 () Bool)

(assert (=> d!22220 m!111145))

(assert (=> d!22220 m!111121))

(declare-fun m!111147 () Bool)

(assert (=> d!22220 m!111147))

(assert (=> d!22220 m!110915))

(declare-fun m!111149 () Bool)

(assert (=> d!22220 m!111149))

(declare-fun m!111151 () Bool)

(assert (=> d!22220 m!111151))

(declare-fun m!111153 () Bool)

(assert (=> d!22220 m!111153))

(assert (=> b!69362 d!22220))

(declare-fun d!22222 () Bool)

(assert (=> d!22222 (validate_offset_bits!1 ((_ sign_extend 32) (size!1348 (buf!1729 (_2!3139 lt!111204)))) ((_ sign_extend 32) (currentByte!3431 thiss!1379)) ((_ sign_extend 32) (currentBit!3426 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!111475 () Unit!4653)

(assert (=> d!22222 (= lt!111475 (choose!9 thiss!1379 (buf!1729 (_2!3139 lt!111204)) (bvsub to!314 i!635) (BitStream!2301 (buf!1729 (_2!3139 lt!111204)) (currentByte!3431 thiss!1379) (currentBit!3426 thiss!1379))))))

(assert (=> d!22222 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1729 (_2!3139 lt!111204)) (bvsub to!314 i!635)) lt!111475)))

(declare-fun bs!5346 () Bool)

(assert (= bs!5346 d!22222))

(assert (=> bs!5346 m!110891))

(declare-fun m!111157 () Bool)

(assert (=> bs!5346 m!111157))

(assert (=> b!69362 d!22222))

(declare-fun d!22226 () Bool)

(assert (=> d!22226 (= (bitAt!0 (buf!1729 (_1!3140 lt!111192)) lt!111205) (not (= (bvand ((_ sign_extend 24) (select (arr!1927 (buf!1729 (_1!3140 lt!111192))) ((_ extract 31 0) (bvsdiv lt!111205 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!111205 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5347 () Bool)

(assert (= bs!5347 d!22226))

(declare-fun m!111161 () Bool)

(assert (=> bs!5347 m!111161))

(declare-fun m!111163 () Bool)

(assert (=> bs!5347 m!111163))

(assert (=> b!69351 d!22226))

(declare-fun d!22230 () Bool)

(assert (=> d!22230 (= (bitAt!0 (buf!1729 (_1!3140 lt!111210)) lt!111205) (not (= (bvand ((_ sign_extend 24) (select (arr!1927 (buf!1729 (_1!3140 lt!111210))) ((_ extract 31 0) (bvsdiv lt!111205 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!111205 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5348 () Bool)

(assert (= bs!5348 d!22230))

(declare-fun m!111165 () Bool)

(assert (=> bs!5348 m!111165))

(assert (=> bs!5348 m!111163))

(assert (=> b!69351 d!22230))

(declare-fun d!22232 () Bool)

(assert (=> d!22232 (= (head!544 lt!111191) (h!840 lt!111191))))

(assert (=> b!69353 d!22232))

(declare-fun d!22234 () Bool)

(declare-fun size!1350 (List!725) Int)

(assert (=> d!22234 (= (length!353 lt!111191) (size!1350 lt!111191))))

(declare-fun bs!5349 () Bool)

(assert (= bs!5349 d!22234))

(declare-fun m!111167 () Bool)

(assert (=> bs!5349 m!111167))

(assert (=> b!69352 d!22234))

(declare-fun d!22236 () Bool)

(assert (=> d!22236 (= (invariant!0 (currentBit!3426 (_2!3139 lt!111204)) (currentByte!3431 (_2!3139 lt!111204)) (size!1348 (buf!1729 (_2!3139 lt!111204)))) (and (bvsge (currentBit!3426 (_2!3139 lt!111204)) #b00000000000000000000000000000000) (bvslt (currentBit!3426 (_2!3139 lt!111204)) #b00000000000000000000000000001000) (bvsge (currentByte!3431 (_2!3139 lt!111204)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3431 (_2!3139 lt!111204)) (size!1348 (buf!1729 (_2!3139 lt!111204)))) (and (= (currentBit!3426 (_2!3139 lt!111204)) #b00000000000000000000000000000000) (= (currentByte!3431 (_2!3139 lt!111204)) (size!1348 (buf!1729 (_2!3139 lt!111204))))))))))

(assert (=> b!69363 d!22236))

(declare-fun d!22238 () Bool)

(assert (=> d!22238 (= (array_inv!1209 (buf!1729 thiss!1379)) (bvsge (size!1348 (buf!1729 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!69349 d!22238))

(declare-fun d!22240 () Bool)

(assert (=> d!22240 (= (head!544 (byteArrayBitContentToList!0 (_2!3139 lt!111204) srcBuffer!2 i!635 (bvsub to!314 i!635))) (h!840 (byteArrayBitContentToList!0 (_2!3139 lt!111204) srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(assert (=> b!69348 d!22240))

(declare-fun d!22242 () Bool)

(declare-fun c!5149 () Bool)

(assert (=> d!22242 (= c!5149 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!45398 () List!725)

(assert (=> d!22242 (= (byteArrayBitContentToList!0 (_2!3139 lt!111204) srcBuffer!2 i!635 (bvsub to!314 i!635)) e!45398)))

(declare-fun b!69535 () Bool)

(assert (=> b!69535 (= e!45398 Nil!722)))

(declare-fun b!69536 () Bool)

(assert (=> b!69536 (= e!45398 (Cons!721 (not (= (bvand ((_ sign_extend 24) (select (arr!1927 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!3139 lt!111204) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!22242 c!5149) b!69535))

(assert (= (and d!22242 (not c!5149)) b!69536))

(assert (=> b!69536 m!110863))

(declare-fun m!111169 () Bool)

(assert (=> b!69536 m!111169))

(declare-fun m!111171 () Bool)

(assert (=> b!69536 m!111171))

(assert (=> b!69348 d!22242))

(declare-fun d!22244 () Bool)

(assert (=> d!22244 (= (bitAt!0 srcBuffer!2 i!635) (not (= (bvand ((_ sign_extend 24) (select (arr!1927 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5350 () Bool)

(assert (= bs!5350 d!22244))

(assert (=> bs!5350 m!110863))

(assert (=> bs!5350 m!111169))

(assert (=> b!69348 d!22244))

(declare-fun d!22246 () Bool)

(assert (=> d!22246 (= (bitAt!0 (buf!1729 (_2!3139 lt!111209)) lt!111205) (not (= (bvand ((_ sign_extend 24) (select (arr!1927 (buf!1729 (_2!3139 lt!111209))) ((_ extract 31 0) (bvsdiv lt!111205 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!111205 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5351 () Bool)

(assert (= bs!5351 d!22246))

(declare-fun m!111173 () Bool)

(assert (=> bs!5351 m!111173))

(assert (=> bs!5351 m!111163))

(assert (=> b!69359 d!22246))

(declare-fun d!22248 () Bool)

(assert (=> d!22248 (= (invariant!0 (currentBit!3426 (_2!3139 lt!111209)) (currentByte!3431 (_2!3139 lt!111209)) (size!1348 (buf!1729 (_2!3139 lt!111204)))) (and (bvsge (currentBit!3426 (_2!3139 lt!111209)) #b00000000000000000000000000000000) (bvslt (currentBit!3426 (_2!3139 lt!111209)) #b00000000000000000000000000001000) (bvsge (currentByte!3431 (_2!3139 lt!111209)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3431 (_2!3139 lt!111209)) (size!1348 (buf!1729 (_2!3139 lt!111204)))) (and (= (currentBit!3426 (_2!3139 lt!111209)) #b00000000000000000000000000000000) (= (currentByte!3431 (_2!3139 lt!111209)) (size!1348 (buf!1729 (_2!3139 lt!111204))))))))))

(assert (=> b!69350 d!22248))

(declare-fun d!22250 () Bool)

(assert (=> d!22250 (= (head!544 (byteArrayBitContentToList!0 (_2!3139 lt!111209) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!840 (byteArrayBitContentToList!0 (_2!3139 lt!111209) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!69361 d!22250))

(declare-fun d!22252 () Bool)

(declare-fun c!5150 () Bool)

(assert (=> d!22252 (= c!5150 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!45399 () List!725)

(assert (=> d!22252 (= (byteArrayBitContentToList!0 (_2!3139 lt!111209) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!45399)))

(declare-fun b!69537 () Bool)

(assert (=> b!69537 (= e!45399 Nil!722)))

(declare-fun b!69538 () Bool)

(assert (=> b!69538 (= e!45399 (Cons!721 (not (= (bvand ((_ sign_extend 24) (select (arr!1927 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!3139 lt!111209) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!22252 c!5150) b!69537))

(assert (= (and d!22252 (not c!5150)) b!69538))

(assert (=> b!69538 m!110863))

(assert (=> b!69538 m!111169))

(declare-fun m!111175 () Bool)

(assert (=> b!69538 m!111175))

(assert (=> b!69361 d!22252))

(declare-fun d!22254 () Bool)

(assert (=> d!22254 (= (head!544 (bitStreamReadBitsIntoList!0 (_2!3139 lt!111209) (_1!3140 lt!111195) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!840 (bitStreamReadBitsIntoList!0 (_2!3139 lt!111209) (_1!3140 lt!111195) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!69361 d!22254))

(declare-fun b!69542 () Bool)

(declare-fun e!45400 () Bool)

(declare-fun lt!111477 () List!725)

(assert (=> b!69542 (= e!45400 (> (length!353 lt!111477) 0))))

(declare-fun d!22256 () Bool)

(assert (=> d!22256 e!45400))

(declare-fun c!5151 () Bool)

(assert (=> d!22256 (= c!5151 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!45401 () tuple2!6068)

(assert (=> d!22256 (= lt!111477 (_1!3145 e!45401))))

(declare-fun c!5152 () Bool)

(assert (=> d!22256 (= c!5152 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!22256 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!22256 (= (bitStreamReadBitsIntoList!0 (_2!3139 lt!111209) (_1!3140 lt!111195) #b0000000000000000000000000000000000000000000000000000000000000001) lt!111477)))

(declare-fun b!69541 () Bool)

(assert (=> b!69541 (= e!45400 (isEmpty!223 lt!111477))))

(declare-fun b!69539 () Bool)

(assert (=> b!69539 (= e!45401 (tuple2!6069 Nil!722 (_1!3140 lt!111195)))))

(declare-fun lt!111478 () (_ BitVec 64))

(declare-fun lt!111476 () tuple2!6070)

(declare-fun b!69540 () Bool)

(assert (=> b!69540 (= e!45401 (tuple2!6069 (Cons!721 (_1!3146 lt!111476) (bitStreamReadBitsIntoList!0 (_2!3139 lt!111209) (_2!3146 lt!111476) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!111478))) (_2!3146 lt!111476)))))

(assert (=> b!69540 (= lt!111476 (readBit!0 (_1!3140 lt!111195)))))

(assert (=> b!69540 (= lt!111478 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!22256 c!5152) b!69539))

(assert (= (and d!22256 (not c!5152)) b!69540))

(assert (= (and d!22256 c!5151) b!69541))

(assert (= (and d!22256 (not c!5151)) b!69542))

(declare-fun m!111177 () Bool)

(assert (=> b!69542 m!111177))

(declare-fun m!111179 () Bool)

(assert (=> b!69541 m!111179))

(declare-fun m!111181 () Bool)

(assert (=> b!69540 m!111181))

(declare-fun m!111183 () Bool)

(assert (=> b!69540 m!111183))

(assert (=> b!69361 d!22256))

(declare-fun d!22258 () Bool)

(declare-fun res!57450 () Bool)

(declare-fun e!45407 () Bool)

(assert (=> d!22258 (=> (not res!57450) (not e!45407))))

(assert (=> d!22258 (= res!57450 (= (size!1348 (buf!1729 thiss!1379)) (size!1348 (buf!1729 (_2!3139 lt!111209)))))))

(assert (=> d!22258 (= (isPrefixOf!0 thiss!1379 (_2!3139 lt!111209)) e!45407)))

(declare-fun b!69549 () Bool)

(declare-fun res!57449 () Bool)

(assert (=> b!69549 (=> (not res!57449) (not e!45407))))

(assert (=> b!69549 (= res!57449 (bvsle (bitIndex!0 (size!1348 (buf!1729 thiss!1379)) (currentByte!3431 thiss!1379) (currentBit!3426 thiss!1379)) (bitIndex!0 (size!1348 (buf!1729 (_2!3139 lt!111209))) (currentByte!3431 (_2!3139 lt!111209)) (currentBit!3426 (_2!3139 lt!111209)))))))

(declare-fun b!69550 () Bool)

(declare-fun e!45406 () Bool)

(assert (=> b!69550 (= e!45407 e!45406)))

(declare-fun res!57448 () Bool)

(assert (=> b!69550 (=> res!57448 e!45406)))

(assert (=> b!69550 (= res!57448 (= (size!1348 (buf!1729 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!69551 () Bool)

(assert (=> b!69551 (= e!45406 (arrayBitRangesEq!0 (buf!1729 thiss!1379) (buf!1729 (_2!3139 lt!111209)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1348 (buf!1729 thiss!1379)) (currentByte!3431 thiss!1379) (currentBit!3426 thiss!1379))))))

(assert (= (and d!22258 res!57450) b!69549))

(assert (= (and b!69549 res!57449) b!69550))

(assert (= (and b!69550 (not res!57448)) b!69551))

(assert (=> b!69549 m!110877))

(assert (=> b!69549 m!110931))

(assert (=> b!69551 m!110877))

(assert (=> b!69551 m!110877))

(declare-fun m!111185 () Bool)

(assert (=> b!69551 m!111185))

(assert (=> b!69360 d!22258))

(declare-fun d!22260 () Bool)

(assert (=> d!22260 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1348 (buf!1729 (_2!3139 lt!111209)))) ((_ sign_extend 32) (currentByte!3431 (_2!3139 lt!111209))) ((_ sign_extend 32) (currentBit!3426 (_2!3139 lt!111209))) lt!111207) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1348 (buf!1729 (_2!3139 lt!111209)))) ((_ sign_extend 32) (currentByte!3431 (_2!3139 lt!111209))) ((_ sign_extend 32) (currentBit!3426 (_2!3139 lt!111209)))) lt!111207))))

(declare-fun bs!5352 () Bool)

(assert (= bs!5352 d!22260))

(assert (=> bs!5352 m!111051))

(assert (=> b!69360 d!22260))

(declare-fun d!22262 () Bool)

(declare-fun e!45410 () Bool)

(assert (=> d!22262 e!45410))

(declare-fun res!57453 () Bool)

(assert (=> d!22262 (=> (not res!57453) (not e!45410))))

(assert (=> d!22262 (= res!57453 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!111481 () Unit!4653)

(declare-fun choose!27 (BitStream!2300 BitStream!2300 (_ BitVec 64) (_ BitVec 64)) Unit!4653)

(assert (=> d!22262 (= lt!111481 (choose!27 thiss!1379 (_2!3139 lt!111209) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!22262 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!22262 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3139 lt!111209) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!111481)))

(declare-fun b!69554 () Bool)

(assert (=> b!69554 (= e!45410 (validate_offset_bits!1 ((_ sign_extend 32) (size!1348 (buf!1729 (_2!3139 lt!111209)))) ((_ sign_extend 32) (currentByte!3431 (_2!3139 lt!111209))) ((_ sign_extend 32) (currentBit!3426 (_2!3139 lt!111209))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!22262 res!57453) b!69554))

(declare-fun m!111187 () Bool)

(assert (=> d!22262 m!111187))

(declare-fun m!111189 () Bool)

(assert (=> b!69554 m!111189))

(assert (=> b!69360 d!22262))

(declare-fun d!22264 () Bool)

(declare-fun e!45421 () Bool)

(assert (=> d!22264 e!45421))

(declare-fun res!57470 () Bool)

(assert (=> d!22264 (=> (not res!57470) (not e!45421))))

(declare-fun lt!111508 () tuple2!6056)

(assert (=> d!22264 (= res!57470 (= (size!1348 (buf!1729 (_2!3139 lt!111508))) (size!1348 (buf!1729 thiss!1379))))))

(declare-fun lt!111507 () (_ BitVec 8))

(declare-fun lt!111509 () array!2903)

(assert (=> d!22264 (= lt!111507 (select (arr!1927 lt!111509) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!22264 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1348 lt!111509)))))

(assert (=> d!22264 (= lt!111509 (array!2904 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!111506 () tuple2!6056)

(assert (=> d!22264 (= lt!111508 (tuple2!6057 (_1!3139 lt!111506) (_2!3139 lt!111506)))))

(declare-fun lt!111517 () tuple2!6056)

(assert (=> d!22264 (= lt!111506 lt!111517)))

(declare-fun e!45420 () Bool)

(assert (=> d!22264 e!45420))

(declare-fun res!57475 () Bool)

(assert (=> d!22264 (=> (not res!57475) (not e!45420))))

(assert (=> d!22264 (= res!57475 (= (size!1348 (buf!1729 thiss!1379)) (size!1348 (buf!1729 (_2!3139 lt!111517)))))))

(declare-fun lt!111512 () Bool)

(declare-fun appendBit!0 (BitStream!2300 Bool) tuple2!6056)

(assert (=> d!22264 (= lt!111517 (appendBit!0 thiss!1379 lt!111512))))

(assert (=> d!22264 (= lt!111512 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1927 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!22264 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!22264 (= (appendBitFromByte!0 thiss!1379 (select (arr!1927 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!111508)))

(declare-fun b!69572 () Bool)

(declare-fun res!57476 () Bool)

(assert (=> b!69572 (=> (not res!57476) (not e!45420))))

(assert (=> b!69572 (= res!57476 (isPrefixOf!0 thiss!1379 (_2!3139 lt!111517)))))

(declare-fun b!69573 () Bool)

(declare-fun res!57477 () Bool)

(assert (=> b!69573 (=> (not res!57477) (not e!45421))))

(assert (=> b!69573 (= res!57477 (isPrefixOf!0 thiss!1379 (_2!3139 lt!111508)))))

(declare-fun b!69574 () Bool)

(declare-fun e!45419 () Bool)

(assert (=> b!69574 (= e!45420 e!45419)))

(declare-fun res!57474 () Bool)

(assert (=> b!69574 (=> (not res!57474) (not e!45419))))

(declare-datatypes ((tuple2!6076 0))(
  ( (tuple2!6077 (_1!3149 BitStream!2300) (_2!3149 Bool)) )
))
(declare-fun lt!111510 () tuple2!6076)

(assert (=> b!69574 (= res!57474 (and (= (_2!3149 lt!111510) lt!111512) (= (_1!3149 lt!111510) (_2!3139 lt!111517))))))

(declare-fun readBitPure!0 (BitStream!2300) tuple2!6076)

(declare-fun readerFrom!0 (BitStream!2300 (_ BitVec 32) (_ BitVec 32)) BitStream!2300)

(assert (=> b!69574 (= lt!111510 (readBitPure!0 (readerFrom!0 (_2!3139 lt!111517) (currentBit!3426 thiss!1379) (currentByte!3431 thiss!1379))))))

(declare-fun b!69575 () Bool)

(declare-fun res!57471 () Bool)

(assert (=> b!69575 (=> (not res!57471) (not e!45420))))

(assert (=> b!69575 (= res!57471 (= (bitIndex!0 (size!1348 (buf!1729 (_2!3139 lt!111517))) (currentByte!3431 (_2!3139 lt!111517)) (currentBit!3426 (_2!3139 lt!111517))) (bvadd (bitIndex!0 (size!1348 (buf!1729 thiss!1379)) (currentByte!3431 thiss!1379) (currentBit!3426 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!69576 () Bool)

(assert (=> b!69576 (= e!45419 (= (bitIndex!0 (size!1348 (buf!1729 (_1!3149 lt!111510))) (currentByte!3431 (_1!3149 lt!111510)) (currentBit!3426 (_1!3149 lt!111510))) (bitIndex!0 (size!1348 (buf!1729 (_2!3139 lt!111517))) (currentByte!3431 (_2!3139 lt!111517)) (currentBit!3426 (_2!3139 lt!111517)))))))

(declare-fun b!69577 () Bool)

(declare-fun e!45422 () Bool)

(declare-fun lt!111513 () tuple2!6076)

(assert (=> b!69577 (= e!45422 (= (bitIndex!0 (size!1348 (buf!1729 (_1!3149 lt!111513))) (currentByte!3431 (_1!3149 lt!111513)) (currentBit!3426 (_1!3149 lt!111513))) (bitIndex!0 (size!1348 (buf!1729 (_2!3139 lt!111508))) (currentByte!3431 (_2!3139 lt!111508)) (currentBit!3426 (_2!3139 lt!111508)))))))

(declare-fun b!69578 () Bool)

(declare-fun res!57472 () Bool)

(assert (=> b!69578 (=> (not res!57472) (not e!45421))))

(declare-fun lt!111516 () (_ BitVec 64))

(declare-fun lt!111511 () (_ BitVec 64))

(assert (=> b!69578 (= res!57472 (= (bitIndex!0 (size!1348 (buf!1729 (_2!3139 lt!111508))) (currentByte!3431 (_2!3139 lt!111508)) (currentBit!3426 (_2!3139 lt!111508))) (bvadd lt!111511 lt!111516)))))

(assert (=> b!69578 (or (not (= (bvand lt!111511 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!111516 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!111511 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!111511 lt!111516) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!69578 (= lt!111516 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!69578 (= lt!111511 (bitIndex!0 (size!1348 (buf!1729 thiss!1379)) (currentByte!3431 thiss!1379) (currentBit!3426 thiss!1379)))))

(declare-fun b!69579 () Bool)

(assert (=> b!69579 (= e!45421 e!45422)))

(declare-fun res!57473 () Bool)

(assert (=> b!69579 (=> (not res!57473) (not e!45422))))

(assert (=> b!69579 (= res!57473 (and (= (_2!3149 lt!111513) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1927 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!111507)) #b00000000000000000000000000000000))) (= (_1!3149 lt!111513) (_2!3139 lt!111508))))))

(declare-datatypes ((tuple2!6078 0))(
  ( (tuple2!6079 (_1!3150 array!2903) (_2!3150 BitStream!2300)) )
))
(declare-fun lt!111514 () tuple2!6078)

(declare-fun lt!111515 () BitStream!2300)

(declare-fun readBits!0 (BitStream!2300 (_ BitVec 64)) tuple2!6078)

(assert (=> b!69579 (= lt!111514 (readBits!0 lt!111515 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!69579 (= lt!111513 (readBitPure!0 lt!111515))))

(assert (=> b!69579 (= lt!111515 (readerFrom!0 (_2!3139 lt!111508) (currentBit!3426 thiss!1379) (currentByte!3431 thiss!1379)))))

(assert (= (and d!22264 res!57475) b!69575))

(assert (= (and b!69575 res!57471) b!69572))

(assert (= (and b!69572 res!57476) b!69574))

(assert (= (and b!69574 res!57474) b!69576))

(assert (= (and d!22264 res!57470) b!69578))

(assert (= (and b!69578 res!57472) b!69573))

(assert (= (and b!69573 res!57477) b!69579))

(assert (= (and b!69579 res!57473) b!69577))

(declare-fun m!111191 () Bool)

(assert (=> b!69576 m!111191))

(declare-fun m!111193 () Bool)

(assert (=> b!69576 m!111193))

(declare-fun m!111195 () Bool)

(assert (=> b!69572 m!111195))

(declare-fun m!111197 () Bool)

(assert (=> d!22264 m!111197))

(declare-fun m!111199 () Bool)

(assert (=> d!22264 m!111199))

(assert (=> d!22264 m!111169))

(declare-fun m!111201 () Bool)

(assert (=> b!69573 m!111201))

(declare-fun m!111203 () Bool)

(assert (=> b!69574 m!111203))

(assert (=> b!69574 m!111203))

(declare-fun m!111205 () Bool)

(assert (=> b!69574 m!111205))

(declare-fun m!111207 () Bool)

(assert (=> b!69577 m!111207))

(declare-fun m!111209 () Bool)

(assert (=> b!69577 m!111209))

(declare-fun m!111211 () Bool)

(assert (=> b!69579 m!111211))

(declare-fun m!111213 () Bool)

(assert (=> b!69579 m!111213))

(declare-fun m!111215 () Bool)

(assert (=> b!69579 m!111215))

(assert (=> b!69575 m!111193))

(assert (=> b!69575 m!110877))

(assert (=> b!69578 m!111209))

(assert (=> b!69578 m!110877))

(assert (=> b!69360 d!22264))

(declare-fun d!22266 () Bool)

(assert (=> d!22266 (validate_offset_bits!1 ((_ sign_extend 32) (size!1348 (buf!1729 (_2!3139 lt!111209)))) ((_ sign_extend 32) (currentByte!3431 thiss!1379)) ((_ sign_extend 32) (currentBit!3426 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!111518 () Unit!4653)

(assert (=> d!22266 (= lt!111518 (choose!9 thiss!1379 (buf!1729 (_2!3139 lt!111209)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2301 (buf!1729 (_2!3139 lt!111209)) (currentByte!3431 thiss!1379) (currentBit!3426 thiss!1379))))))

(assert (=> d!22266 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1729 (_2!3139 lt!111209)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!111518)))

(declare-fun bs!5353 () Bool)

(assert (= bs!5353 d!22266))

(assert (=> bs!5353 m!110903))

(declare-fun m!111217 () Bool)

(assert (=> bs!5353 m!111217))

(assert (=> b!69357 d!22266))

(declare-fun d!22268 () Bool)

(assert (=> d!22268 (isPrefixOf!0 thiss!1379 (_2!3139 lt!111204))))

(declare-fun lt!111521 () Unit!4653)

(declare-fun choose!30 (BitStream!2300 BitStream!2300 BitStream!2300) Unit!4653)

(assert (=> d!22268 (= lt!111521 (choose!30 thiss!1379 (_2!3139 lt!111209) (_2!3139 lt!111204)))))

(assert (=> d!22268 (isPrefixOf!0 thiss!1379 (_2!3139 lt!111209))))

(assert (=> d!22268 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3139 lt!111209) (_2!3139 lt!111204)) lt!111521)))

(declare-fun bs!5354 () Bool)

(assert (= bs!5354 d!22268))

(assert (=> bs!5354 m!110905))

(declare-fun m!111219 () Bool)

(assert (=> bs!5354 m!111219))

(assert (=> bs!5354 m!110867))

(assert (=> b!69357 d!22268))

(declare-fun b!69686 () Bool)

(declare-fun res!57551 () Bool)

(declare-fun e!45468 () Bool)

(assert (=> b!69686 (=> (not res!57551) (not e!45468))))

(declare-fun lt!112009 () tuple2!6056)

(assert (=> b!69686 (= res!57551 (= (size!1348 (buf!1729 (_2!3139 lt!111209))) (size!1348 (buf!1729 (_2!3139 lt!112009)))))))

(declare-fun b!69688 () Bool)

(declare-fun res!57550 () Bool)

(assert (=> b!69688 (=> (not res!57550) (not e!45468))))

(assert (=> b!69688 (= res!57550 (invariant!0 (currentBit!3426 (_2!3139 lt!112009)) (currentByte!3431 (_2!3139 lt!112009)) (size!1348 (buf!1729 (_2!3139 lt!112009)))))))

(declare-fun b!69689 () Bool)

(declare-fun res!57553 () Bool)

(assert (=> b!69689 (=> (not res!57553) (not e!45468))))

(assert (=> b!69689 (= res!57553 (isPrefixOf!0 (_2!3139 lt!111209) (_2!3139 lt!112009)))))

(declare-fun lt!112003 () tuple2!6056)

(declare-fun bm!895 () Bool)

(declare-fun c!5170 () Bool)

(declare-fun call!898 () tuple2!6058)

(assert (=> bm!895 (= call!898 (reader!0 (_2!3139 lt!111209) (ite c!5170 (_2!3139 lt!112003) (_2!3139 lt!111209))))))

(declare-fun lt!112013 () tuple2!6058)

(declare-fun b!69690 () Bool)

(assert (=> b!69690 (= e!45468 (= (bitStreamReadBitsIntoList!0 (_2!3139 lt!112009) (_1!3140 lt!112013) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!3139 lt!112009) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!69690 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!69690 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!112008 () Unit!4653)

(declare-fun lt!112016 () Unit!4653)

(assert (=> b!69690 (= lt!112008 lt!112016)))

(declare-fun lt!112028 () (_ BitVec 64))

(assert (=> b!69690 (validate_offset_bits!1 ((_ sign_extend 32) (size!1348 (buf!1729 (_2!3139 lt!112009)))) ((_ sign_extend 32) (currentByte!3431 (_2!3139 lt!111209))) ((_ sign_extend 32) (currentBit!3426 (_2!3139 lt!111209))) lt!112028)))

(assert (=> b!69690 (= lt!112016 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3139 lt!111209) (buf!1729 (_2!3139 lt!112009)) lt!112028))))

(declare-fun e!45469 () Bool)

(assert (=> b!69690 e!45469))

(declare-fun res!57554 () Bool)

(assert (=> b!69690 (=> (not res!57554) (not e!45469))))

(assert (=> b!69690 (= res!57554 (and (= (size!1348 (buf!1729 (_2!3139 lt!111209))) (size!1348 (buf!1729 (_2!3139 lt!112009)))) (bvsge lt!112028 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!69690 (= lt!112028 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!69690 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!69690 (= lt!112013 (reader!0 (_2!3139 lt!111209) (_2!3139 lt!112009)))))

(declare-fun b!69691 () Bool)

(declare-fun e!45467 () tuple2!6056)

(declare-fun lt!112019 () tuple2!6056)

(declare-fun Unit!4677 () Unit!4653)

(assert (=> b!69691 (= e!45467 (tuple2!6057 Unit!4677 (_2!3139 lt!112019)))))

(assert (=> b!69691 (= lt!112003 (appendBitFromByte!0 (_2!3139 lt!111209) (select (arr!1927 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!111994 () (_ BitVec 64))

(assert (=> b!69691 (= lt!111994 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!112021 () (_ BitVec 64))

(assert (=> b!69691 (= lt!112021 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!111992 () Unit!4653)

(assert (=> b!69691 (= lt!111992 (validateOffsetBitsIneqLemma!0 (_2!3139 lt!111209) (_2!3139 lt!112003) lt!111994 lt!112021))))

(assert (=> b!69691 (validate_offset_bits!1 ((_ sign_extend 32) (size!1348 (buf!1729 (_2!3139 lt!112003)))) ((_ sign_extend 32) (currentByte!3431 (_2!3139 lt!112003))) ((_ sign_extend 32) (currentBit!3426 (_2!3139 lt!112003))) (bvsub lt!111994 lt!112021))))

(declare-fun lt!112018 () Unit!4653)

(assert (=> b!69691 (= lt!112018 lt!111992)))

(declare-fun lt!112026 () tuple2!6058)

(assert (=> b!69691 (= lt!112026 call!898)))

(declare-fun lt!112006 () (_ BitVec 64))

(assert (=> b!69691 (= lt!112006 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!111993 () Unit!4653)

(assert (=> b!69691 (= lt!111993 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3139 lt!111209) (buf!1729 (_2!3139 lt!112003)) lt!112006))))

(assert (=> b!69691 (validate_offset_bits!1 ((_ sign_extend 32) (size!1348 (buf!1729 (_2!3139 lt!112003)))) ((_ sign_extend 32) (currentByte!3431 (_2!3139 lt!111209))) ((_ sign_extend 32) (currentBit!3426 (_2!3139 lt!111209))) lt!112006)))

(declare-fun lt!111988 () Unit!4653)

(assert (=> b!69691 (= lt!111988 lt!111993)))

(assert (=> b!69691 (= (head!544 (byteArrayBitContentToList!0 (_2!3139 lt!112003) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!544 (bitStreamReadBitsIntoList!0 (_2!3139 lt!112003) (_1!3140 lt!112026) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!111999 () Unit!4653)

(declare-fun Unit!4678 () Unit!4653)

(assert (=> b!69691 (= lt!111999 Unit!4678)))

(assert (=> b!69691 (= lt!112019 (appendBitsMSBFirstLoop!0 (_2!3139 lt!112003) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!111989 () Unit!4653)

(assert (=> b!69691 (= lt!111989 (lemmaIsPrefixTransitive!0 (_2!3139 lt!111209) (_2!3139 lt!112003) (_2!3139 lt!112019)))))

(assert (=> b!69691 (isPrefixOf!0 (_2!3139 lt!111209) (_2!3139 lt!112019))))

(declare-fun lt!112023 () Unit!4653)

(assert (=> b!69691 (= lt!112023 lt!111989)))

(assert (=> b!69691 (= (size!1348 (buf!1729 (_2!3139 lt!112019))) (size!1348 (buf!1729 (_2!3139 lt!111209))))))

(declare-fun lt!112002 () Unit!4653)

(declare-fun Unit!4679 () Unit!4653)

(assert (=> b!69691 (= lt!112002 Unit!4679)))

(assert (=> b!69691 (= (bitIndex!0 (size!1348 (buf!1729 (_2!3139 lt!112019))) (currentByte!3431 (_2!3139 lt!112019)) (currentBit!3426 (_2!3139 lt!112019))) (bvsub (bvadd (bitIndex!0 (size!1348 (buf!1729 (_2!3139 lt!111209))) (currentByte!3431 (_2!3139 lt!111209)) (currentBit!3426 (_2!3139 lt!111209))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!112007 () Unit!4653)

(declare-fun Unit!4680 () Unit!4653)

(assert (=> b!69691 (= lt!112007 Unit!4680)))

(assert (=> b!69691 (= (bitIndex!0 (size!1348 (buf!1729 (_2!3139 lt!112019))) (currentByte!3431 (_2!3139 lt!112019)) (currentBit!3426 (_2!3139 lt!112019))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1348 (buf!1729 (_2!3139 lt!112003))) (currentByte!3431 (_2!3139 lt!112003)) (currentBit!3426 (_2!3139 lt!112003))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!112029 () Unit!4653)

(declare-fun Unit!4681 () Unit!4653)

(assert (=> b!69691 (= lt!112029 Unit!4681)))

(declare-fun lt!112022 () tuple2!6058)

(assert (=> b!69691 (= lt!112022 (reader!0 (_2!3139 lt!111209) (_2!3139 lt!112019)))))

(declare-fun lt!112031 () (_ BitVec 64))

(assert (=> b!69691 (= lt!112031 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!111998 () Unit!4653)

(assert (=> b!69691 (= lt!111998 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3139 lt!111209) (buf!1729 (_2!3139 lt!112019)) lt!112031))))

(assert (=> b!69691 (validate_offset_bits!1 ((_ sign_extend 32) (size!1348 (buf!1729 (_2!3139 lt!112019)))) ((_ sign_extend 32) (currentByte!3431 (_2!3139 lt!111209))) ((_ sign_extend 32) (currentBit!3426 (_2!3139 lt!111209))) lt!112031)))

(declare-fun lt!112012 () Unit!4653)

(assert (=> b!69691 (= lt!112012 lt!111998)))

(declare-fun lt!111996 () tuple2!6058)

(assert (=> b!69691 (= lt!111996 (reader!0 (_2!3139 lt!112003) (_2!3139 lt!112019)))))

(declare-fun lt!112014 () (_ BitVec 64))

(assert (=> b!69691 (= lt!112014 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!111990 () Unit!4653)

(assert (=> b!69691 (= lt!111990 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3139 lt!112003) (buf!1729 (_2!3139 lt!112019)) lt!112014))))

(assert (=> b!69691 (validate_offset_bits!1 ((_ sign_extend 32) (size!1348 (buf!1729 (_2!3139 lt!112019)))) ((_ sign_extend 32) (currentByte!3431 (_2!3139 lt!112003))) ((_ sign_extend 32) (currentBit!3426 (_2!3139 lt!112003))) lt!112014)))

(declare-fun lt!112027 () Unit!4653)

(assert (=> b!69691 (= lt!112027 lt!111990)))

(declare-fun lt!112005 () List!725)

(assert (=> b!69691 (= lt!112005 (byteArrayBitContentToList!0 (_2!3139 lt!112019) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!112024 () List!725)

(assert (=> b!69691 (= lt!112024 (byteArrayBitContentToList!0 (_2!3139 lt!112019) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!112010 () List!725)

(assert (=> b!69691 (= lt!112010 (bitStreamReadBitsIntoList!0 (_2!3139 lt!112019) (_1!3140 lt!112022) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!111991 () List!725)

(assert (=> b!69691 (= lt!111991 (bitStreamReadBitsIntoList!0 (_2!3139 lt!112019) (_1!3140 lt!111996) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!111995 () (_ BitVec 64))

(assert (=> b!69691 (= lt!111995 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!111997 () Unit!4653)

(assert (=> b!69691 (= lt!111997 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3139 lt!112019) (_2!3139 lt!112019) (_1!3140 lt!112022) (_1!3140 lt!111996) lt!111995 lt!112010))))

(assert (=> b!69691 (= (bitStreamReadBitsIntoList!0 (_2!3139 lt!112019) (_1!3140 lt!111996) (bvsub lt!111995 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!329 lt!112010))))

(declare-fun lt!112020 () Unit!4653)

(assert (=> b!69691 (= lt!112020 lt!111997)))

(declare-fun lt!112004 () Unit!4653)

(declare-fun lt!112015 () (_ BitVec 64))

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2903 array!2903 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4653)

(assert (=> b!69691 (= lt!112004 (arrayBitRangesEqImpliesEq!0 (buf!1729 (_2!3139 lt!112003)) (buf!1729 (_2!3139 lt!112019)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!112015 (bitIndex!0 (size!1348 (buf!1729 (_2!3139 lt!112003))) (currentByte!3431 (_2!3139 lt!112003)) (currentBit!3426 (_2!3139 lt!112003)))))))

(assert (=> b!69691 (= (bitAt!0 (buf!1729 (_2!3139 lt!112003)) lt!112015) (bitAt!0 (buf!1729 (_2!3139 lt!112019)) lt!112015))))

(declare-fun lt!112001 () Unit!4653)

(assert (=> b!69691 (= lt!112001 lt!112004)))

(declare-fun b!69692 () Bool)

(declare-fun res!57555 () Bool)

(assert (=> b!69692 (=> (not res!57555) (not e!45468))))

(assert (=> b!69692 (= res!57555 (= (size!1348 (buf!1729 (_2!3139 lt!112009))) (size!1348 (buf!1729 (_2!3139 lt!111209)))))))

(declare-fun b!69693 () Bool)

(declare-fun Unit!4682 () Unit!4653)

(assert (=> b!69693 (= e!45467 (tuple2!6057 Unit!4682 (_2!3139 lt!111209)))))

(assert (=> b!69693 (= (size!1348 (buf!1729 (_2!3139 lt!111209))) (size!1348 (buf!1729 (_2!3139 lt!111209))))))

(declare-fun lt!112011 () Unit!4653)

(declare-fun Unit!4683 () Unit!4653)

(assert (=> b!69693 (= lt!112011 Unit!4683)))

(declare-fun checkByteArrayBitContent!0 (BitStream!2300 array!2903 array!2903 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!69693 (checkByteArrayBitContent!0 (_2!3139 lt!111209) srcBuffer!2 (_1!3150 (readBits!0 (_1!3140 call!898) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!69687 () Bool)

(assert (=> b!69687 (= e!45469 (validate_offset_bits!1 ((_ sign_extend 32) (size!1348 (buf!1729 (_2!3139 lt!111209)))) ((_ sign_extend 32) (currentByte!3431 (_2!3139 lt!111209))) ((_ sign_extend 32) (currentBit!3426 (_2!3139 lt!111209))) lt!112028))))

(declare-fun d!22270 () Bool)

(assert (=> d!22270 e!45468))

(declare-fun res!57552 () Bool)

(assert (=> d!22270 (=> (not res!57552) (not e!45468))))

(declare-fun lt!112017 () (_ BitVec 64))

(assert (=> d!22270 (= res!57552 (= (bitIndex!0 (size!1348 (buf!1729 (_2!3139 lt!112009))) (currentByte!3431 (_2!3139 lt!112009)) (currentBit!3426 (_2!3139 lt!112009))) (bvsub lt!112017 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!22270 (or (= (bvand lt!112017 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!112017 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!112017 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!112000 () (_ BitVec 64))

(assert (=> d!22270 (= lt!112017 (bvadd lt!112000 to!314))))

(assert (=> d!22270 (or (not (= (bvand lt!112000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!112000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!112000 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!22270 (= lt!112000 (bitIndex!0 (size!1348 (buf!1729 (_2!3139 lt!111209))) (currentByte!3431 (_2!3139 lt!111209)) (currentBit!3426 (_2!3139 lt!111209))))))

(assert (=> d!22270 (= lt!112009 e!45467)))

(assert (=> d!22270 (= c!5170 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!112025 () Unit!4653)

(declare-fun lt!112030 () Unit!4653)

(assert (=> d!22270 (= lt!112025 lt!112030)))

(assert (=> d!22270 (isPrefixOf!0 (_2!3139 lt!111209) (_2!3139 lt!111209))))

(assert (=> d!22270 (= lt!112030 (lemmaIsPrefixRefl!0 (_2!3139 lt!111209)))))

(assert (=> d!22270 (= lt!112015 (bitIndex!0 (size!1348 (buf!1729 (_2!3139 lt!111209))) (currentByte!3431 (_2!3139 lt!111209)) (currentBit!3426 (_2!3139 lt!111209))))))

(assert (=> d!22270 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!22270 (= (appendBitsMSBFirstLoop!0 (_2!3139 lt!111209) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!112009)))

(assert (= (and d!22270 c!5170) b!69691))

(assert (= (and d!22270 (not c!5170)) b!69693))

(assert (= (or b!69691 b!69693) bm!895))

(assert (= (and d!22270 res!57552) b!69688))

(assert (= (and b!69688 res!57550) b!69686))

(assert (= (and b!69686 res!57551) b!69689))

(assert (= (and b!69689 res!57553) b!69692))

(assert (= (and b!69692 res!57555) b!69690))

(assert (= (and b!69690 res!57554) b!69687))

(declare-fun m!111507 () Bool)

(assert (=> d!22270 m!111507))

(assert (=> d!22270 m!110931))

(assert (=> d!22270 m!111151))

(assert (=> d!22270 m!111145))

(declare-fun m!111509 () Bool)

(assert (=> bm!895 m!111509))

(declare-fun m!111511 () Bool)

(assert (=> b!69690 m!111511))

(declare-fun m!111513 () Bool)

(assert (=> b!69690 m!111513))

(declare-fun m!111515 () Bool)

(assert (=> b!69690 m!111515))

(declare-fun m!111517 () Bool)

(assert (=> b!69690 m!111517))

(declare-fun m!111519 () Bool)

(assert (=> b!69690 m!111519))

(declare-fun m!111521 () Bool)

(assert (=> b!69688 m!111521))

(declare-fun m!111523 () Bool)

(assert (=> b!69689 m!111523))

(declare-fun m!111525 () Bool)

(assert (=> b!69687 m!111525))

(declare-fun m!111527 () Bool)

(assert (=> b!69691 m!111527))

(declare-fun m!111529 () Bool)

(assert (=> b!69691 m!111529))

(declare-fun m!111531 () Bool)

(assert (=> b!69691 m!111531))

(declare-fun m!111533 () Bool)

(assert (=> b!69691 m!111533))

(declare-fun m!111535 () Bool)

(assert (=> b!69691 m!111535))

(declare-fun m!111537 () Bool)

(assert (=> b!69691 m!111537))

(declare-fun m!111539 () Bool)

(assert (=> b!69691 m!111539))

(declare-fun m!111541 () Bool)

(assert (=> b!69691 m!111541))

(assert (=> b!69691 m!111541))

(declare-fun m!111543 () Bool)

(assert (=> b!69691 m!111543))

(declare-fun m!111545 () Bool)

(assert (=> b!69691 m!111545))

(declare-fun m!111547 () Bool)

(assert (=> b!69691 m!111547))

(declare-fun m!111549 () Bool)

(assert (=> b!69691 m!111549))

(declare-fun m!111551 () Bool)

(assert (=> b!69691 m!111551))

(declare-fun m!111553 () Bool)

(assert (=> b!69691 m!111553))

(declare-fun m!111555 () Bool)

(assert (=> b!69691 m!111555))

(declare-fun m!111557 () Bool)

(assert (=> b!69691 m!111557))

(declare-fun m!111559 () Bool)

(assert (=> b!69691 m!111559))

(declare-fun m!111561 () Bool)

(assert (=> b!69691 m!111561))

(assert (=> b!69691 m!111551))

(declare-fun m!111563 () Bool)

(assert (=> b!69691 m!111563))

(declare-fun m!111565 () Bool)

(assert (=> b!69691 m!111565))

(declare-fun m!111567 () Bool)

(assert (=> b!69691 m!111567))

(assert (=> b!69691 m!111567))

(declare-fun m!111569 () Bool)

(assert (=> b!69691 m!111569))

(assert (=> b!69691 m!111549))

(declare-fun m!111571 () Bool)

(assert (=> b!69691 m!111571))

(declare-fun m!111573 () Bool)

(assert (=> b!69691 m!111573))

(declare-fun m!111575 () Bool)

(assert (=> b!69691 m!111575))

(declare-fun m!111577 () Bool)

(assert (=> b!69691 m!111577))

(declare-fun m!111579 () Bool)

(assert (=> b!69691 m!111579))

(assert (=> b!69691 m!110931))

(declare-fun m!111581 () Bool)

(assert (=> b!69691 m!111581))

(declare-fun m!111583 () Bool)

(assert (=> b!69691 m!111583))

(declare-fun m!111585 () Bool)

(assert (=> b!69691 m!111585))

(declare-fun m!111587 () Bool)

(assert (=> b!69691 m!111587))

(declare-fun m!111589 () Bool)

(assert (=> b!69693 m!111589))

(declare-fun m!111591 () Bool)

(assert (=> b!69693 m!111591))

(assert (=> b!69357 d!22270))

(declare-fun d!22306 () Bool)

(declare-fun res!57564 () Bool)

(declare-fun e!45475 () Bool)

(assert (=> d!22306 (=> (not res!57564) (not e!45475))))

(assert (=> d!22306 (= res!57564 (= (size!1348 (buf!1729 thiss!1379)) (size!1348 (buf!1729 (_2!3139 lt!111204)))))))

(assert (=> d!22306 (= (isPrefixOf!0 thiss!1379 (_2!3139 lt!111204)) e!45475)))

(declare-fun b!69704 () Bool)

(declare-fun res!57563 () Bool)

(assert (=> b!69704 (=> (not res!57563) (not e!45475))))

(assert (=> b!69704 (= res!57563 (bvsle (bitIndex!0 (size!1348 (buf!1729 thiss!1379)) (currentByte!3431 thiss!1379) (currentBit!3426 thiss!1379)) (bitIndex!0 (size!1348 (buf!1729 (_2!3139 lt!111204))) (currentByte!3431 (_2!3139 lt!111204)) (currentBit!3426 (_2!3139 lt!111204)))))))

(declare-fun b!69705 () Bool)

(declare-fun e!45474 () Bool)

(assert (=> b!69705 (= e!45475 e!45474)))

(declare-fun res!57562 () Bool)

(assert (=> b!69705 (=> res!57562 e!45474)))

(assert (=> b!69705 (= res!57562 (= (size!1348 (buf!1729 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!69706 () Bool)

(assert (=> b!69706 (= e!45474 (arrayBitRangesEq!0 (buf!1729 thiss!1379) (buf!1729 (_2!3139 lt!111204)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1348 (buf!1729 thiss!1379)) (currentByte!3431 thiss!1379) (currentBit!3426 thiss!1379))))))

(assert (= (and d!22306 res!57564) b!69704))

(assert (= (and b!69704 res!57563) b!69705))

(assert (= (and b!69705 (not res!57562)) b!69706))

(assert (=> b!69704 m!110877))

(assert (=> b!69704 m!110861))

(assert (=> b!69706 m!110877))

(assert (=> b!69706 m!110877))

(declare-fun m!111593 () Bool)

(assert (=> b!69706 m!111593))

(assert (=> b!69357 d!22306))

(declare-fun d!22308 () Bool)

(assert (=> d!22308 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1348 (buf!1729 (_2!3139 lt!111209)))) ((_ sign_extend 32) (currentByte!3431 thiss!1379)) ((_ sign_extend 32) (currentBit!3426 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1348 (buf!1729 (_2!3139 lt!111209)))) ((_ sign_extend 32) (currentByte!3431 thiss!1379)) ((_ sign_extend 32) (currentBit!3426 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!5362 () Bool)

(assert (= bs!5362 d!22308))

(declare-fun m!111595 () Bool)

(assert (=> bs!5362 m!111595))

(assert (=> b!69357 d!22308))

(declare-fun b!69712 () Bool)

(declare-fun res!57570 () Bool)

(declare-fun e!45479 () Bool)

(assert (=> b!69712 (=> (not res!57570) (not e!45479))))

(declare-fun lt!112093 () tuple2!6058)

(assert (=> b!69712 (= res!57570 (isPrefixOf!0 (_2!3140 lt!112093) (_2!3139 lt!111209)))))

(declare-fun lt!112096 () (_ BitVec 64))

(declare-fun b!69713 () Bool)

(declare-fun lt!112095 () (_ BitVec 64))

(assert (=> b!69713 (= e!45479 (= (_1!3140 lt!112093) (withMovedBitIndex!0 (_2!3140 lt!112093) (bvsub lt!112096 lt!112095))))))

(assert (=> b!69713 (or (= (bvand lt!112096 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!112095 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!112096 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!112096 lt!112095) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!69713 (= lt!112095 (bitIndex!0 (size!1348 (buf!1729 (_2!3139 lt!111209))) (currentByte!3431 (_2!3139 lt!111209)) (currentBit!3426 (_2!3139 lt!111209))))))

(assert (=> b!69713 (= lt!112096 (bitIndex!0 (size!1348 (buf!1729 thiss!1379)) (currentByte!3431 thiss!1379) (currentBit!3426 thiss!1379)))))

(declare-fun b!69714 () Bool)

(declare-fun res!57568 () Bool)

(assert (=> b!69714 (=> (not res!57568) (not e!45479))))

(assert (=> b!69714 (= res!57568 (isPrefixOf!0 (_1!3140 lt!112093) thiss!1379))))

(declare-fun d!22310 () Bool)

(assert (=> d!22310 e!45479))

(declare-fun res!57569 () Bool)

(assert (=> d!22310 (=> (not res!57569) (not e!45479))))

(assert (=> d!22310 (= res!57569 (isPrefixOf!0 (_1!3140 lt!112093) (_2!3140 lt!112093)))))

(declare-fun lt!112109 () BitStream!2300)

(assert (=> d!22310 (= lt!112093 (tuple2!6059 lt!112109 (_2!3139 lt!111209)))))

(declare-fun lt!112103 () Unit!4653)

(declare-fun lt!112097 () Unit!4653)

(assert (=> d!22310 (= lt!112103 lt!112097)))

(assert (=> d!22310 (isPrefixOf!0 lt!112109 (_2!3139 lt!111209))))

(assert (=> d!22310 (= lt!112097 (lemmaIsPrefixTransitive!0 lt!112109 (_2!3139 lt!111209) (_2!3139 lt!111209)))))

(declare-fun lt!112106 () Unit!4653)

(declare-fun lt!112101 () Unit!4653)

(assert (=> d!22310 (= lt!112106 lt!112101)))

(assert (=> d!22310 (isPrefixOf!0 lt!112109 (_2!3139 lt!111209))))

(assert (=> d!22310 (= lt!112101 (lemmaIsPrefixTransitive!0 lt!112109 thiss!1379 (_2!3139 lt!111209)))))

(declare-fun lt!112110 () Unit!4653)

(declare-fun e!45478 () Unit!4653)

(assert (=> d!22310 (= lt!112110 e!45478)))

(declare-fun c!5174 () Bool)

(assert (=> d!22310 (= c!5174 (not (= (size!1348 (buf!1729 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!112104 () Unit!4653)

(declare-fun lt!112102 () Unit!4653)

(assert (=> d!22310 (= lt!112104 lt!112102)))

(assert (=> d!22310 (isPrefixOf!0 (_2!3139 lt!111209) (_2!3139 lt!111209))))

(assert (=> d!22310 (= lt!112102 (lemmaIsPrefixRefl!0 (_2!3139 lt!111209)))))

(declare-fun lt!112108 () Unit!4653)

(declare-fun lt!112092 () Unit!4653)

(assert (=> d!22310 (= lt!112108 lt!112092)))

(assert (=> d!22310 (= lt!112092 (lemmaIsPrefixRefl!0 (_2!3139 lt!111209)))))

(declare-fun lt!112105 () Unit!4653)

(declare-fun lt!112099 () Unit!4653)

(assert (=> d!22310 (= lt!112105 lt!112099)))

(assert (=> d!22310 (isPrefixOf!0 lt!112109 lt!112109)))

(assert (=> d!22310 (= lt!112099 (lemmaIsPrefixRefl!0 lt!112109))))

(declare-fun lt!112111 () Unit!4653)

(declare-fun lt!112094 () Unit!4653)

(assert (=> d!22310 (= lt!112111 lt!112094)))

(assert (=> d!22310 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!22310 (= lt!112094 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!22310 (= lt!112109 (BitStream!2301 (buf!1729 (_2!3139 lt!111209)) (currentByte!3431 thiss!1379) (currentBit!3426 thiss!1379)))))

(assert (=> d!22310 (isPrefixOf!0 thiss!1379 (_2!3139 lt!111209))))

(assert (=> d!22310 (= (reader!0 thiss!1379 (_2!3139 lt!111209)) lt!112093)))

(declare-fun b!69715 () Bool)

(declare-fun lt!112098 () Unit!4653)

(assert (=> b!69715 (= e!45478 lt!112098)))

(declare-fun lt!112100 () (_ BitVec 64))

(assert (=> b!69715 (= lt!112100 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!112107 () (_ BitVec 64))

(assert (=> b!69715 (= lt!112107 (bitIndex!0 (size!1348 (buf!1729 thiss!1379)) (currentByte!3431 thiss!1379) (currentBit!3426 thiss!1379)))))

(assert (=> b!69715 (= lt!112098 (arrayBitRangesEqSymmetric!0 (buf!1729 thiss!1379) (buf!1729 (_2!3139 lt!111209)) lt!112100 lt!112107))))

(assert (=> b!69715 (arrayBitRangesEq!0 (buf!1729 (_2!3139 lt!111209)) (buf!1729 thiss!1379) lt!112100 lt!112107)))

(declare-fun b!69716 () Bool)

(declare-fun Unit!4684 () Unit!4653)

(assert (=> b!69716 (= e!45478 Unit!4684)))

(assert (= (and d!22310 c!5174) b!69715))

(assert (= (and d!22310 (not c!5174)) b!69716))

(assert (= (and d!22310 res!57569) b!69714))

(assert (= (and b!69714 res!57568) b!69712))

(assert (= (and b!69712 res!57570) b!69713))

(declare-fun m!111621 () Bool)

(assert (=> b!69714 m!111621))

(declare-fun m!111623 () Bool)

(assert (=> b!69713 m!111623))

(assert (=> b!69713 m!110931))

(assert (=> b!69713 m!110877))

(assert (=> b!69715 m!110877))

(declare-fun m!111625 () Bool)

(assert (=> b!69715 m!111625))

(declare-fun m!111627 () Bool)

(assert (=> b!69715 m!111627))

(declare-fun m!111629 () Bool)

(assert (=> b!69712 m!111629))

(declare-fun m!111631 () Bool)

(assert (=> d!22310 m!111631))

(declare-fun m!111633 () Bool)

(assert (=> d!22310 m!111633))

(assert (=> d!22310 m!111145))

(declare-fun m!111635 () Bool)

(assert (=> d!22310 m!111635))

(assert (=> d!22310 m!110875))

(assert (=> d!22310 m!111151))

(declare-fun m!111637 () Bool)

(assert (=> d!22310 m!111637))

(assert (=> d!22310 m!110867))

(declare-fun m!111639 () Bool)

(assert (=> d!22310 m!111639))

(assert (=> d!22310 m!110873))

(declare-fun m!111641 () Bool)

(assert (=> d!22310 m!111641))

(assert (=> b!69357 d!22310))

(declare-fun d!22316 () Bool)

(declare-fun res!57573 () Bool)

(declare-fun e!45481 () Bool)

(assert (=> d!22316 (=> (not res!57573) (not e!45481))))

(assert (=> d!22316 (= res!57573 (= (size!1348 (buf!1729 (_2!3139 lt!111209))) (size!1348 (buf!1729 (_2!3139 lt!111204)))))))

(assert (=> d!22316 (= (isPrefixOf!0 (_2!3139 lt!111209) (_2!3139 lt!111204)) e!45481)))

(declare-fun b!69717 () Bool)

(declare-fun res!57572 () Bool)

(assert (=> b!69717 (=> (not res!57572) (not e!45481))))

(assert (=> b!69717 (= res!57572 (bvsle (bitIndex!0 (size!1348 (buf!1729 (_2!3139 lt!111209))) (currentByte!3431 (_2!3139 lt!111209)) (currentBit!3426 (_2!3139 lt!111209))) (bitIndex!0 (size!1348 (buf!1729 (_2!3139 lt!111204))) (currentByte!3431 (_2!3139 lt!111204)) (currentBit!3426 (_2!3139 lt!111204)))))))

(declare-fun b!69718 () Bool)

(declare-fun e!45480 () Bool)

(assert (=> b!69718 (= e!45481 e!45480)))

(declare-fun res!57571 () Bool)

(assert (=> b!69718 (=> res!57571 e!45480)))

(assert (=> b!69718 (= res!57571 (= (size!1348 (buf!1729 (_2!3139 lt!111209))) #b00000000000000000000000000000000))))

(declare-fun b!69719 () Bool)

(assert (=> b!69719 (= e!45480 (arrayBitRangesEq!0 (buf!1729 (_2!3139 lt!111209)) (buf!1729 (_2!3139 lt!111204)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1348 (buf!1729 (_2!3139 lt!111209))) (currentByte!3431 (_2!3139 lt!111209)) (currentBit!3426 (_2!3139 lt!111209)))))))

(assert (= (and d!22316 res!57573) b!69717))

(assert (= (and b!69717 res!57572) b!69718))

(assert (= (and b!69718 (not res!57571)) b!69719))

(assert (=> b!69717 m!110931))

(assert (=> b!69717 m!110861))

(assert (=> b!69719 m!110931))

(assert (=> b!69719 m!110931))

(declare-fun m!111643 () Bool)

(assert (=> b!69719 m!111643))

(assert (=> b!69357 d!22316))

(declare-fun d!22318 () Bool)

(declare-fun res!57576 () Bool)

(declare-fun e!45483 () Bool)

(assert (=> d!22318 (=> (not res!57576) (not e!45483))))

(assert (=> d!22318 (= res!57576 (= (size!1348 (buf!1729 thiss!1379)) (size!1348 (buf!1729 thiss!1379))))))

(assert (=> d!22318 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!45483)))

(declare-fun b!69720 () Bool)

(declare-fun res!57575 () Bool)

(assert (=> b!69720 (=> (not res!57575) (not e!45483))))

(assert (=> b!69720 (= res!57575 (bvsle (bitIndex!0 (size!1348 (buf!1729 thiss!1379)) (currentByte!3431 thiss!1379) (currentBit!3426 thiss!1379)) (bitIndex!0 (size!1348 (buf!1729 thiss!1379)) (currentByte!3431 thiss!1379) (currentBit!3426 thiss!1379))))))

(declare-fun b!69721 () Bool)

(declare-fun e!45482 () Bool)

(assert (=> b!69721 (= e!45483 e!45482)))

(declare-fun res!57574 () Bool)

(assert (=> b!69721 (=> res!57574 e!45482)))

(assert (=> b!69721 (= res!57574 (= (size!1348 (buf!1729 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!69722 () Bool)

(assert (=> b!69722 (= e!45482 (arrayBitRangesEq!0 (buf!1729 thiss!1379) (buf!1729 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1348 (buf!1729 thiss!1379)) (currentByte!3431 thiss!1379) (currentBit!3426 thiss!1379))))))

(assert (= (and d!22318 res!57576) b!69720))

(assert (= (and b!69720 res!57575) b!69721))

(assert (= (and b!69721 (not res!57574)) b!69722))

(assert (=> b!69720 m!110877))

(assert (=> b!69720 m!110877))

(assert (=> b!69722 m!110877))

(assert (=> b!69722 m!110877))

(declare-fun m!111645 () Bool)

(assert (=> b!69722 m!111645))

(assert (=> b!69356 d!22318))

(declare-fun d!22320 () Bool)

(assert (=> d!22320 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!112114 () Unit!4653)

(declare-fun choose!11 (BitStream!2300) Unit!4653)

(assert (=> d!22320 (= lt!112114 (choose!11 thiss!1379))))

(assert (=> d!22320 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!112114)))

(declare-fun bs!5365 () Bool)

(assert (= bs!5365 d!22320))

(assert (=> bs!5365 m!110873))

(declare-fun m!111647 () Bool)

(assert (=> bs!5365 m!111647))

(assert (=> b!69356 d!22320))

(declare-fun d!22322 () Bool)

(declare-fun e!45484 () Bool)

(assert (=> d!22322 e!45484))

(declare-fun res!57578 () Bool)

(assert (=> d!22322 (=> (not res!57578) (not e!45484))))

(declare-fun lt!112117 () (_ BitVec 64))

(declare-fun lt!112116 () (_ BitVec 64))

(declare-fun lt!112120 () (_ BitVec 64))

(assert (=> d!22322 (= res!57578 (= lt!112120 (bvsub lt!112116 lt!112117)))))

(assert (=> d!22322 (or (= (bvand lt!112116 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!112117 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!112116 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!112116 lt!112117) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!22322 (= lt!112117 (remainingBits!0 ((_ sign_extend 32) (size!1348 (buf!1729 thiss!1379))) ((_ sign_extend 32) (currentByte!3431 thiss!1379)) ((_ sign_extend 32) (currentBit!3426 thiss!1379))))))

(declare-fun lt!112118 () (_ BitVec 64))

(declare-fun lt!112119 () (_ BitVec 64))

(assert (=> d!22322 (= lt!112116 (bvmul lt!112118 lt!112119))))

(assert (=> d!22322 (or (= lt!112118 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!112119 (bvsdiv (bvmul lt!112118 lt!112119) lt!112118)))))

(assert (=> d!22322 (= lt!112119 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!22322 (= lt!112118 ((_ sign_extend 32) (size!1348 (buf!1729 thiss!1379))))))

(assert (=> d!22322 (= lt!112120 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3431 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3426 thiss!1379))))))

(assert (=> d!22322 (invariant!0 (currentBit!3426 thiss!1379) (currentByte!3431 thiss!1379) (size!1348 (buf!1729 thiss!1379)))))

(assert (=> d!22322 (= (bitIndex!0 (size!1348 (buf!1729 thiss!1379)) (currentByte!3431 thiss!1379) (currentBit!3426 thiss!1379)) lt!112120)))

(declare-fun b!69723 () Bool)

(declare-fun res!57577 () Bool)

(assert (=> b!69723 (=> (not res!57577) (not e!45484))))

(assert (=> b!69723 (= res!57577 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!112120))))

(declare-fun b!69724 () Bool)

(declare-fun lt!112115 () (_ BitVec 64))

(assert (=> b!69724 (= e!45484 (bvsle lt!112120 (bvmul lt!112115 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!69724 (or (= lt!112115 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!112115 #b0000000000000000000000000000000000000000000000000000000000001000) lt!112115)))))

(assert (=> b!69724 (= lt!112115 ((_ sign_extend 32) (size!1348 (buf!1729 thiss!1379))))))

(assert (= (and d!22322 res!57578) b!69723))

(assert (= (and b!69723 res!57577) b!69724))

(declare-fun m!111649 () Bool)

(assert (=> d!22322 m!111649))

(declare-fun m!111651 () Bool)

(assert (=> d!22322 m!111651))

(assert (=> b!69356 d!22322))

(declare-fun d!22324 () Bool)

(assert (=> d!22324 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1348 (buf!1729 thiss!1379))) ((_ sign_extend 32) (currentByte!3431 thiss!1379)) ((_ sign_extend 32) (currentBit!3426 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1348 (buf!1729 thiss!1379))) ((_ sign_extend 32) (currentByte!3431 thiss!1379)) ((_ sign_extend 32) (currentBit!3426 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5366 () Bool)

(assert (= bs!5366 d!22324))

(assert (=> bs!5366 m!111649))

(assert (=> b!69367 d!22324))

(declare-fun d!22326 () Bool)

(assert (=> d!22326 (= (array_inv!1209 srcBuffer!2) (bvsge (size!1348 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!13522 d!22326))

(declare-fun d!22328 () Bool)

(assert (=> d!22328 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3426 thiss!1379) (currentByte!3431 thiss!1379) (size!1348 (buf!1729 thiss!1379))))))

(declare-fun bs!5367 () Bool)

(assert (= bs!5367 d!22328))

(assert (=> bs!5367 m!111651))

(assert (=> start!13522 d!22328))

(push 1)

(assert (not b!69518))

(assert (not d!22220))

(assert (not b!69542))

(assert (not b!69540))

(assert (not b!69541))

(assert (not d!22202))

(assert (not b!69720))

(assert (not d!22266))

(assert (not b!69526))

(assert (not b!69480))

(assert (not b!69713))

(assert (not b!69549))

(assert (not b!69688))

(assert (not b!69458))

(assert (not b!69573))

(assert (not d!22322))

(assert (not d!22324))

(assert (not d!22234))

(assert (not d!22262))

(assert (not b!69577))

(assert (not b!69520))

(assert (not b!69572))

(assert (not d!22270))

(assert (not d!22198))

(assert (not bm!895))

(assert (not b!69524))

(assert (not b!69706))

(assert (not b!69704))

(assert (not d!22260))

(assert (not b!69482))

(assert (not b!69714))

(assert (not b!69525))

(assert (not b!69538))

(assert (not d!22328))

(assert (not b!69687))

(assert (not b!69717))

(assert (not b!69481))

(assert (not d!22200))

(assert (not b!69690))

(assert (not d!22206))

(assert (not b!69719))

(assert (not d!22204))

(assert (not b!69722))

(assert (not d!22208))

(assert (not b!69715))

(assert (not b!69551))

(assert (not b!69693))

(assert (not b!69575))

(assert (not b!69689))

(assert (not d!22268))

(assert (not b!69554))

(assert (not d!22222))

(assert (not b!69521))

(assert (not b!69712))

(assert (not b!69579))

(assert (not d!22308))

(assert (not b!69476))

(assert (not d!22310))

(assert (not d!22264))

(assert (not b!69578))

(assert (not b!69519))

(assert (not b!69576))

(assert (not b!69536))

(assert (not b!69574))

(assert (not d!22214))

(assert (not b!69691))

(assert (not b!69478))

(assert (not d!22320))

(assert (not b!69477))

(assert (not b!69523))

(check-sat)

(pop 1)

(push 1)

(check-sat)

