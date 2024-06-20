; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8742 () Bool)

(assert start!8742)

(declare-fun b!43518 () Bool)

(declare-fun res!36933 () Bool)

(declare-fun e!29063 () Bool)

(assert (=> b!43518 (=> res!36933 e!29063)))

(declare-fun lt!65923 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-datatypes ((array!2219 0))(
  ( (array!2220 (arr!1507 (Array (_ BitVec 32) (_ BitVec 8))) (size!1002 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1748 0))(
  ( (BitStream!1749 (buf!1339 array!2219) (currentByte!2808 (_ BitVec 32)) (currentBit!2803 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!3098 0))(
  ( (Unit!3099) )
))
(declare-datatypes ((tuple2!4270 0))(
  ( (tuple2!4271 (_1!2228 Unit!3098) (_2!2228 BitStream!1748)) )
))
(declare-fun lt!65921 () tuple2!4270)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!43518 (= res!36933 (not (= (bitIndex!0 (size!1002 (buf!1339 (_2!2228 lt!65921))) (currentByte!2808 (_2!2228 lt!65921)) (currentBit!2803 (_2!2228 lt!65921))) (bvsub (bvadd lt!65923 to!314) i!635))))))

(declare-fun b!43519 () Bool)

(declare-fun e!29065 () Bool)

(declare-fun e!29068 () Bool)

(assert (=> b!43519 (= e!29065 e!29068)))

(declare-fun res!36936 () Bool)

(assert (=> b!43519 (=> res!36936 e!29068)))

(declare-fun thiss!1379 () BitStream!1748)

(declare-fun lt!65925 () tuple2!4270)

(declare-fun isPrefixOf!0 (BitStream!1748 BitStream!1748) Bool)

(assert (=> b!43519 (= res!36936 (not (isPrefixOf!0 thiss!1379 (_2!2228 lt!65925))))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!43519 (validate_offset_bits!1 ((_ sign_extend 32) (size!1002 (buf!1339 (_2!2228 lt!65925)))) ((_ sign_extend 32) (currentByte!2808 (_2!2228 lt!65925))) ((_ sign_extend 32) (currentBit!2803 (_2!2228 lt!65925))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!65920 () Unit!3098)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1748 BitStream!1748 (_ BitVec 64) (_ BitVec 64)) Unit!3098)

(assert (=> b!43519 (= lt!65920 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2228 lt!65925) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!2219)

(declare-fun appendBitFromByte!0 (BitStream!1748 (_ BitVec 8) (_ BitVec 32)) tuple2!4270)

(assert (=> b!43519 (= lt!65925 (appendBitFromByte!0 thiss!1379 (select (arr!1507 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!43520 () Bool)

(assert (=> b!43520 (= e!29068 e!29063)))

(declare-fun res!36937 () Bool)

(assert (=> b!43520 (=> res!36937 e!29063)))

(assert (=> b!43520 (= res!36937 (not (isPrefixOf!0 (_2!2228 lt!65925) (_2!2228 lt!65921))))))

(assert (=> b!43520 (isPrefixOf!0 thiss!1379 (_2!2228 lt!65921))))

(declare-fun lt!65919 () Unit!3098)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1748 BitStream!1748 BitStream!1748) Unit!3098)

(assert (=> b!43520 (= lt!65919 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2228 lt!65925) (_2!2228 lt!65921)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1748 array!2219 (_ BitVec 64) (_ BitVec 64)) tuple2!4270)

(assert (=> b!43520 (= lt!65921 (appendBitsMSBFirstLoop!0 (_2!2228 lt!65925) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!29064 () Bool)

(assert (=> b!43520 e!29064))

(declare-fun res!36935 () Bool)

(assert (=> b!43520 (=> (not res!36935) (not e!29064))))

(assert (=> b!43520 (= res!36935 (validate_offset_bits!1 ((_ sign_extend 32) (size!1002 (buf!1339 (_2!2228 lt!65925)))) ((_ sign_extend 32) (currentByte!2808 thiss!1379)) ((_ sign_extend 32) (currentBit!2803 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!65922 () Unit!3098)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1748 array!2219 (_ BitVec 64)) Unit!3098)

(assert (=> b!43520 (= lt!65922 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1339 (_2!2228 lt!65925)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!4272 0))(
  ( (tuple2!4273 (_1!2229 BitStream!1748) (_2!2229 BitStream!1748)) )
))
(declare-fun lt!65924 () tuple2!4272)

(declare-fun reader!0 (BitStream!1748 BitStream!1748) tuple2!4272)

(assert (=> b!43520 (= lt!65924 (reader!0 thiss!1379 (_2!2228 lt!65925)))))

(declare-fun res!36934 () Bool)

(declare-fun e!29066 () Bool)

(assert (=> start!8742 (=> (not res!36934) (not e!29066))))

(assert (=> start!8742 (= res!36934 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1002 srcBuffer!2))))))))

(assert (=> start!8742 e!29066))

(assert (=> start!8742 true))

(declare-fun array_inv!927 (array!2219) Bool)

(assert (=> start!8742 (array_inv!927 srcBuffer!2)))

(declare-fun e!29062 () Bool)

(declare-fun inv!12 (BitStream!1748) Bool)

(assert (=> start!8742 (and (inv!12 thiss!1379) e!29062)))

(declare-fun b!43521 () Bool)

(assert (=> b!43521 (= e!29066 (not e!29065))))

(declare-fun res!36938 () Bool)

(assert (=> b!43521 (=> res!36938 e!29065)))

(assert (=> b!43521 (= res!36938 (bvsge i!635 to!314))))

(assert (=> b!43521 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!65926 () Unit!3098)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1748) Unit!3098)

(assert (=> b!43521 (= lt!65926 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!43521 (= lt!65923 (bitIndex!0 (size!1002 (buf!1339 thiss!1379)) (currentByte!2808 thiss!1379) (currentBit!2803 thiss!1379)))))

(declare-fun b!43522 () Bool)

(declare-datatypes ((List!515 0))(
  ( (Nil!512) (Cons!511 (h!630 Bool) (t!1265 List!515)) )
))
(declare-fun head!334 (List!515) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1748 array!2219 (_ BitVec 64) (_ BitVec 64)) List!515)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1748 BitStream!1748 (_ BitVec 64)) List!515)

(assert (=> b!43522 (= e!29064 (= (head!334 (byteArrayBitContentToList!0 (_2!2228 lt!65925) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!334 (bitStreamReadBitsIntoList!0 (_2!2228 lt!65925) (_1!2229 lt!65924) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!43523 () Bool)

(assert (=> b!43523 (= e!29062 (array_inv!927 (buf!1339 thiss!1379)))))

(declare-fun b!43524 () Bool)

(declare-fun res!36939 () Bool)

(assert (=> b!43524 (=> (not res!36939) (not e!29066))))

(assert (=> b!43524 (= res!36939 (validate_offset_bits!1 ((_ sign_extend 32) (size!1002 (buf!1339 thiss!1379))) ((_ sign_extend 32) (currentByte!2808 thiss!1379)) ((_ sign_extend 32) (currentBit!2803 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!43525 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!43525 (= e!29063 (invariant!0 (currentBit!2803 (_2!2228 lt!65921)) (currentByte!2808 (_2!2228 lt!65921)) (size!1002 (buf!1339 (_2!2228 lt!65921)))))))

(assert (= (and start!8742 res!36934) b!43524))

(assert (= (and b!43524 res!36939) b!43521))

(assert (= (and b!43521 (not res!36938)) b!43519))

(assert (= (and b!43519 (not res!36936)) b!43520))

(assert (= (and b!43520 res!36935) b!43522))

(assert (= (and b!43520 (not res!36937)) b!43518))

(assert (= (and b!43518 (not res!36933)) b!43525))

(assert (= start!8742 b!43523))

(declare-fun m!66239 () Bool)

(assert (=> b!43524 m!66239))

(declare-fun m!66241 () Bool)

(assert (=> b!43525 m!66241))

(declare-fun m!66243 () Bool)

(assert (=> b!43520 m!66243))

(declare-fun m!66245 () Bool)

(assert (=> b!43520 m!66245))

(declare-fun m!66247 () Bool)

(assert (=> b!43520 m!66247))

(declare-fun m!66249 () Bool)

(assert (=> b!43520 m!66249))

(declare-fun m!66251 () Bool)

(assert (=> b!43520 m!66251))

(declare-fun m!66253 () Bool)

(assert (=> b!43520 m!66253))

(declare-fun m!66255 () Bool)

(assert (=> b!43520 m!66255))

(declare-fun m!66257 () Bool)

(assert (=> b!43523 m!66257))

(declare-fun m!66259 () Bool)

(assert (=> b!43519 m!66259))

(declare-fun m!66261 () Bool)

(assert (=> b!43519 m!66261))

(declare-fun m!66263 () Bool)

(assert (=> b!43519 m!66263))

(declare-fun m!66265 () Bool)

(assert (=> b!43519 m!66265))

(assert (=> b!43519 m!66261))

(declare-fun m!66267 () Bool)

(assert (=> b!43519 m!66267))

(declare-fun m!66269 () Bool)

(assert (=> b!43522 m!66269))

(assert (=> b!43522 m!66269))

(declare-fun m!66271 () Bool)

(assert (=> b!43522 m!66271))

(declare-fun m!66273 () Bool)

(assert (=> b!43522 m!66273))

(assert (=> b!43522 m!66273))

(declare-fun m!66275 () Bool)

(assert (=> b!43522 m!66275))

(declare-fun m!66277 () Bool)

(assert (=> b!43521 m!66277))

(declare-fun m!66279 () Bool)

(assert (=> b!43521 m!66279))

(declare-fun m!66281 () Bool)

(assert (=> b!43521 m!66281))

(declare-fun m!66283 () Bool)

(assert (=> start!8742 m!66283))

(declare-fun m!66285 () Bool)

(assert (=> start!8742 m!66285))

(declare-fun m!66287 () Bool)

(assert (=> b!43518 m!66287))

(push 1)

(assert (not b!43518))

(assert (not start!8742))

(assert (not b!43521))

(assert (not b!43519))

(assert (not b!43522))

(assert (not b!43525))

(assert (not b!43523))

(assert (not b!43524))

(assert (not b!43520))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!12632 () Bool)

(assert (=> d!12632 (= (invariant!0 (currentBit!2803 (_2!2228 lt!65921)) (currentByte!2808 (_2!2228 lt!65921)) (size!1002 (buf!1339 (_2!2228 lt!65921)))) (and (bvsge (currentBit!2803 (_2!2228 lt!65921)) #b00000000000000000000000000000000) (bvslt (currentBit!2803 (_2!2228 lt!65921)) #b00000000000000000000000000001000) (bvsge (currentByte!2808 (_2!2228 lt!65921)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2808 (_2!2228 lt!65921)) (size!1002 (buf!1339 (_2!2228 lt!65921)))) (and (= (currentBit!2803 (_2!2228 lt!65921)) #b00000000000000000000000000000000) (= (currentByte!2808 (_2!2228 lt!65921)) (size!1002 (buf!1339 (_2!2228 lt!65921))))))))))

(assert (=> b!43525 d!12632))

(declare-fun b!43586 () Bool)

(declare-fun lt!66018 () tuple2!4272)

(declare-fun e!29103 () Bool)

(declare-fun lt!66013 () (_ BitVec 64))

(declare-fun lt!66020 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!1748 (_ BitVec 64)) BitStream!1748)

(assert (=> b!43586 (= e!29103 (= (_1!2229 lt!66018) (withMovedBitIndex!0 (_2!2229 lt!66018) (bvsub lt!66020 lt!66013))))))

(assert (=> b!43586 (or (= (bvand lt!66020 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!66013 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!66020 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!66020 lt!66013) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!43586 (= lt!66013 (bitIndex!0 (size!1002 (buf!1339 (_2!2228 lt!65925))) (currentByte!2808 (_2!2228 lt!65925)) (currentBit!2803 (_2!2228 lt!65925))))))

(assert (=> b!43586 (= lt!66020 (bitIndex!0 (size!1002 (buf!1339 thiss!1379)) (currentByte!2808 thiss!1379) (currentBit!2803 thiss!1379)))))

(declare-fun b!43587 () Bool)

(declare-fun e!29102 () Unit!3098)

(declare-fun lt!66014 () Unit!3098)

(assert (=> b!43587 (= e!29102 lt!66014)))

(declare-fun lt!66019 () (_ BitVec 64))

(assert (=> b!43587 (= lt!66019 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66017 () (_ BitVec 64))

(assert (=> b!43587 (= lt!66017 (bitIndex!0 (size!1002 (buf!1339 thiss!1379)) (currentByte!2808 thiss!1379) (currentBit!2803 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2219 array!2219 (_ BitVec 64) (_ BitVec 64)) Unit!3098)

(assert (=> b!43587 (= lt!66014 (arrayBitRangesEqSymmetric!0 (buf!1339 thiss!1379) (buf!1339 (_2!2228 lt!65925)) lt!66019 lt!66017))))

(declare-fun arrayBitRangesEq!0 (array!2219 array!2219 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!43587 (arrayBitRangesEq!0 (buf!1339 (_2!2228 lt!65925)) (buf!1339 thiss!1379) lt!66019 lt!66017)))

(declare-fun d!12634 () Bool)

(assert (=> d!12634 e!29103))

(declare-fun res!36966 () Bool)

(assert (=> d!12634 (=> (not res!36966) (not e!29103))))

(assert (=> d!12634 (= res!36966 (isPrefixOf!0 (_1!2229 lt!66018) (_2!2229 lt!66018)))))

(declare-fun lt!66005 () BitStream!1748)

(assert (=> d!12634 (= lt!66018 (tuple2!4273 lt!66005 (_2!2228 lt!65925)))))

(declare-fun lt!66010 () Unit!3098)

(declare-fun lt!66011 () Unit!3098)

(assert (=> d!12634 (= lt!66010 lt!66011)))

(assert (=> d!12634 (isPrefixOf!0 lt!66005 (_2!2228 lt!65925))))

(assert (=> d!12634 (= lt!66011 (lemmaIsPrefixTransitive!0 lt!66005 (_2!2228 lt!65925) (_2!2228 lt!65925)))))

(declare-fun lt!66003 () Unit!3098)

(declare-fun lt!66015 () Unit!3098)

(assert (=> d!12634 (= lt!66003 lt!66015)))

(assert (=> d!12634 (isPrefixOf!0 lt!66005 (_2!2228 lt!65925))))

(assert (=> d!12634 (= lt!66015 (lemmaIsPrefixTransitive!0 lt!66005 thiss!1379 (_2!2228 lt!65925)))))

(declare-fun lt!66012 () Unit!3098)

(assert (=> d!12634 (= lt!66012 e!29102)))

(declare-fun c!2887 () Bool)

(assert (=> d!12634 (= c!2887 (not (= (size!1002 (buf!1339 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!66021 () Unit!3098)

(declare-fun lt!66016 () Unit!3098)

(assert (=> d!12634 (= lt!66021 lt!66016)))

(assert (=> d!12634 (isPrefixOf!0 (_2!2228 lt!65925) (_2!2228 lt!65925))))

(assert (=> d!12634 (= lt!66016 (lemmaIsPrefixRefl!0 (_2!2228 lt!65925)))))

(declare-fun lt!66004 () Unit!3098)

(declare-fun lt!66008 () Unit!3098)

(assert (=> d!12634 (= lt!66004 lt!66008)))

(assert (=> d!12634 (= lt!66008 (lemmaIsPrefixRefl!0 (_2!2228 lt!65925)))))

(declare-fun lt!66022 () Unit!3098)

(declare-fun lt!66007 () Unit!3098)

(assert (=> d!12634 (= lt!66022 lt!66007)))

(assert (=> d!12634 (isPrefixOf!0 lt!66005 lt!66005)))

(assert (=> d!12634 (= lt!66007 (lemmaIsPrefixRefl!0 lt!66005))))

(declare-fun lt!66006 () Unit!3098)

(declare-fun lt!66009 () Unit!3098)

(assert (=> d!12634 (= lt!66006 lt!66009)))

(assert (=> d!12634 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!12634 (= lt!66009 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!12634 (= lt!66005 (BitStream!1749 (buf!1339 (_2!2228 lt!65925)) (currentByte!2808 thiss!1379) (currentBit!2803 thiss!1379)))))

(assert (=> d!12634 (isPrefixOf!0 thiss!1379 (_2!2228 lt!65925))))

(assert (=> d!12634 (= (reader!0 thiss!1379 (_2!2228 lt!65925)) lt!66018)))

(declare-fun b!43588 () Bool)

(declare-fun res!36965 () Bool)

(assert (=> b!43588 (=> (not res!36965) (not e!29103))))

(assert (=> b!43588 (= res!36965 (isPrefixOf!0 (_1!2229 lt!66018) thiss!1379))))

(declare-fun b!43589 () Bool)

(declare-fun Unit!3108 () Unit!3098)

(assert (=> b!43589 (= e!29102 Unit!3108)))

(declare-fun b!43590 () Bool)

(declare-fun res!36964 () Bool)

(assert (=> b!43590 (=> (not res!36964) (not e!29103))))

(assert (=> b!43590 (= res!36964 (isPrefixOf!0 (_2!2229 lt!66018) (_2!2228 lt!65925)))))

(assert (= (and d!12634 c!2887) b!43587))

(assert (= (and d!12634 (not c!2887)) b!43589))

(assert (= (and d!12634 res!36966) b!43588))

(assert (= (and b!43588 res!36965) b!43590))

(assert (= (and b!43590 res!36964) b!43586))

(assert (=> b!43587 m!66281))

(declare-fun m!66319 () Bool)

(assert (=> b!43587 m!66319))

(declare-fun m!66321 () Bool)

(assert (=> b!43587 m!66321))

(declare-fun m!66323 () Bool)

(assert (=> d!12634 m!66323))

(assert (=> d!12634 m!66265))

(declare-fun m!66325 () Bool)

(assert (=> d!12634 m!66325))

(declare-fun m!66327 () Bool)

(assert (=> d!12634 m!66327))

(assert (=> d!12634 m!66277))

(declare-fun m!66329 () Bool)

(assert (=> d!12634 m!66329))

(declare-fun m!66331 () Bool)

(assert (=> d!12634 m!66331))

(declare-fun m!66333 () Bool)

(assert (=> d!12634 m!66333))

(declare-fun m!66335 () Bool)

(assert (=> d!12634 m!66335))

(assert (=> d!12634 m!66279))

(declare-fun m!66337 () Bool)

(assert (=> d!12634 m!66337))

(declare-fun m!66339 () Bool)

(assert (=> b!43586 m!66339))

(declare-fun m!66341 () Bool)

(assert (=> b!43586 m!66341))

(assert (=> b!43586 m!66281))

(declare-fun m!66343 () Bool)

(assert (=> b!43590 m!66343))

(declare-fun m!66345 () Bool)

(assert (=> b!43588 m!66345))

(assert (=> b!43520 d!12634))

(declare-fun d!12644 () Bool)

(declare-fun res!36979 () Bool)

(declare-fun e!29114 () Bool)

(assert (=> d!12644 (=> (not res!36979) (not e!29114))))

(assert (=> d!12644 (= res!36979 (= (size!1002 (buf!1339 thiss!1379)) (size!1002 (buf!1339 (_2!2228 lt!65921)))))))

(assert (=> d!12644 (= (isPrefixOf!0 thiss!1379 (_2!2228 lt!65921)) e!29114)))

(declare-fun b!43608 () Bool)

(declare-fun res!36980 () Bool)

(assert (=> b!43608 (=> (not res!36980) (not e!29114))))

(assert (=> b!43608 (= res!36980 (bvsle (bitIndex!0 (size!1002 (buf!1339 thiss!1379)) (currentByte!2808 thiss!1379) (currentBit!2803 thiss!1379)) (bitIndex!0 (size!1002 (buf!1339 (_2!2228 lt!65921))) (currentByte!2808 (_2!2228 lt!65921)) (currentBit!2803 (_2!2228 lt!65921)))))))

(declare-fun b!43609 () Bool)

(declare-fun e!29115 () Bool)

(assert (=> b!43609 (= e!29114 e!29115)))

(declare-fun res!36981 () Bool)

(assert (=> b!43609 (=> res!36981 e!29115)))

(assert (=> b!43609 (= res!36981 (= (size!1002 (buf!1339 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!43610 () Bool)

(assert (=> b!43610 (= e!29115 (arrayBitRangesEq!0 (buf!1339 thiss!1379) (buf!1339 (_2!2228 lt!65921)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1002 (buf!1339 thiss!1379)) (currentByte!2808 thiss!1379) (currentBit!2803 thiss!1379))))))

(assert (= (and d!12644 res!36979) b!43608))

(assert (= (and b!43608 res!36980) b!43609))

(assert (= (and b!43609 (not res!36981)) b!43610))

(assert (=> b!43608 m!66281))

(assert (=> b!43608 m!66287))

(assert (=> b!43610 m!66281))

(assert (=> b!43610 m!66281))

(declare-fun m!66355 () Bool)

(assert (=> b!43610 m!66355))

(assert (=> b!43520 d!12644))

(declare-fun b!43720 () Bool)

(declare-fun e!29168 () tuple2!4270)

(declare-fun Unit!3109 () Unit!3098)

(assert (=> b!43720 (= e!29168 (tuple2!4271 Unit!3109 (_2!2228 lt!65925)))))

(assert (=> b!43720 (= (size!1002 (buf!1339 (_2!2228 lt!65925))) (size!1002 (buf!1339 (_2!2228 lt!65925))))))

(declare-fun lt!66347 () Unit!3098)

(declare-fun Unit!3110 () Unit!3098)

(assert (=> b!43720 (= lt!66347 Unit!3110)))

(declare-fun call!513 () tuple2!4272)

(declare-fun checkByteArrayBitContent!0 (BitStream!1748 array!2219 array!2219 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!4282 0))(
  ( (tuple2!4283 (_1!2234 array!2219) (_2!2234 BitStream!1748)) )
))
(declare-fun readBits!0 (BitStream!1748 (_ BitVec 64)) tuple2!4282)

(assert (=> b!43720 (checkByteArrayBitContent!0 (_2!2228 lt!65925) srcBuffer!2 (_1!2234 (readBits!0 (_1!2229 call!513) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!66343 () tuple2!4272)

(declare-fun e!29169 () Bool)

(declare-fun lt!66342 () tuple2!4270)

(declare-fun b!43721 () Bool)

(assert (=> b!43721 (= e!29169 (= (bitStreamReadBitsIntoList!0 (_2!2228 lt!66342) (_1!2229 lt!66343) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2228 lt!66342) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!43721 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!43721 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!66377 () Unit!3098)

(declare-fun lt!66362 () Unit!3098)

(assert (=> b!43721 (= lt!66377 lt!66362)))

(declare-fun lt!66338 () (_ BitVec 64))

(assert (=> b!43721 (validate_offset_bits!1 ((_ sign_extend 32) (size!1002 (buf!1339 (_2!2228 lt!66342)))) ((_ sign_extend 32) (currentByte!2808 (_2!2228 lt!65925))) ((_ sign_extend 32) (currentBit!2803 (_2!2228 lt!65925))) lt!66338)))

(assert (=> b!43721 (= lt!66362 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2228 lt!65925) (buf!1339 (_2!2228 lt!66342)) lt!66338))))

(declare-fun e!29167 () Bool)

(assert (=> b!43721 e!29167))

(declare-fun res!37080 () Bool)

(assert (=> b!43721 (=> (not res!37080) (not e!29167))))

(assert (=> b!43721 (= res!37080 (and (= (size!1002 (buf!1339 (_2!2228 lt!65925))) (size!1002 (buf!1339 (_2!2228 lt!66342)))) (bvsge lt!66338 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!43721 (= lt!66338 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!43721 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!43721 (= lt!66343 (reader!0 (_2!2228 lt!65925) (_2!2228 lt!66342)))))

(declare-fun b!43722 () Bool)

(declare-fun res!37076 () Bool)

(assert (=> b!43722 (=> (not res!37076) (not e!29169))))

(assert (=> b!43722 (= res!37076 (isPrefixOf!0 (_2!2228 lt!65925) (_2!2228 lt!66342)))))

(declare-fun b!43723 () Bool)

(assert (=> b!43723 (= e!29167 (validate_offset_bits!1 ((_ sign_extend 32) (size!1002 (buf!1339 (_2!2228 lt!65925)))) ((_ sign_extend 32) (currentByte!2808 (_2!2228 lt!65925))) ((_ sign_extend 32) (currentBit!2803 (_2!2228 lt!65925))) lt!66338))))

(declare-fun c!2897 () Bool)

(declare-fun lt!66358 () tuple2!4270)

(declare-fun bm!510 () Bool)

(assert (=> bm!510 (= call!513 (reader!0 (_2!2228 lt!65925) (ite c!2897 (_2!2228 lt!66358) (_2!2228 lt!65925))))))

(declare-fun b!43725 () Bool)

(declare-fun res!37079 () Bool)

(assert (=> b!43725 (=> (not res!37079) (not e!29169))))

(assert (=> b!43725 (= res!37079 (invariant!0 (currentBit!2803 (_2!2228 lt!66342)) (currentByte!2808 (_2!2228 lt!66342)) (size!1002 (buf!1339 (_2!2228 lt!66342)))))))

(declare-fun b!43726 () Bool)

(declare-fun res!37077 () Bool)

(assert (=> b!43726 (=> (not res!37077) (not e!29169))))

(assert (=> b!43726 (= res!37077 (= (size!1002 (buf!1339 (_2!2228 lt!65925))) (size!1002 (buf!1339 (_2!2228 lt!66342)))))))

(declare-fun b!43727 () Bool)

(declare-fun Unit!3111 () Unit!3098)

(assert (=> b!43727 (= e!29168 (tuple2!4271 Unit!3111 (_2!2228 lt!66358)))))

(declare-fun lt!66365 () tuple2!4270)

(assert (=> b!43727 (= lt!66365 (appendBitFromByte!0 (_2!2228 lt!65925) (select (arr!1507 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!66348 () (_ BitVec 64))

(assert (=> b!43727 (= lt!66348 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!66371 () (_ BitVec 64))

(assert (=> b!43727 (= lt!66371 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!66364 () Unit!3098)

(assert (=> b!43727 (= lt!66364 (validateOffsetBitsIneqLemma!0 (_2!2228 lt!65925) (_2!2228 lt!66365) lt!66348 lt!66371))))

(assert (=> b!43727 (validate_offset_bits!1 ((_ sign_extend 32) (size!1002 (buf!1339 (_2!2228 lt!66365)))) ((_ sign_extend 32) (currentByte!2808 (_2!2228 lt!66365))) ((_ sign_extend 32) (currentBit!2803 (_2!2228 lt!66365))) (bvsub lt!66348 lt!66371))))

(declare-fun lt!66353 () Unit!3098)

(assert (=> b!43727 (= lt!66353 lt!66364)))

(declare-fun lt!66339 () tuple2!4272)

(assert (=> b!43727 (= lt!66339 (reader!0 (_2!2228 lt!65925) (_2!2228 lt!66365)))))

(declare-fun lt!66368 () (_ BitVec 64))

(assert (=> b!43727 (= lt!66368 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!66378 () Unit!3098)

(assert (=> b!43727 (= lt!66378 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2228 lt!65925) (buf!1339 (_2!2228 lt!66365)) lt!66368))))

(assert (=> b!43727 (validate_offset_bits!1 ((_ sign_extend 32) (size!1002 (buf!1339 (_2!2228 lt!66365)))) ((_ sign_extend 32) (currentByte!2808 (_2!2228 lt!65925))) ((_ sign_extend 32) (currentBit!2803 (_2!2228 lt!65925))) lt!66368)))

(declare-fun lt!66370 () Unit!3098)

(assert (=> b!43727 (= lt!66370 lt!66378)))

(assert (=> b!43727 (= (head!334 (byteArrayBitContentToList!0 (_2!2228 lt!66365) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!334 (bitStreamReadBitsIntoList!0 (_2!2228 lt!66365) (_1!2229 lt!66339) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!66360 () Unit!3098)

(declare-fun Unit!3112 () Unit!3098)

(assert (=> b!43727 (= lt!66360 Unit!3112)))

(assert (=> b!43727 (= lt!66358 (appendBitsMSBFirstLoop!0 (_2!2228 lt!66365) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!66337 () Unit!3098)

(assert (=> b!43727 (= lt!66337 (lemmaIsPrefixTransitive!0 (_2!2228 lt!65925) (_2!2228 lt!66365) (_2!2228 lt!66358)))))

(assert (=> b!43727 (isPrefixOf!0 (_2!2228 lt!65925) (_2!2228 lt!66358))))

(declare-fun lt!66355 () Unit!3098)

(assert (=> b!43727 (= lt!66355 lt!66337)))

(assert (=> b!43727 (= (size!1002 (buf!1339 (_2!2228 lt!66358))) (size!1002 (buf!1339 (_2!2228 lt!65925))))))

(declare-fun lt!66356 () Unit!3098)

(declare-fun Unit!3113 () Unit!3098)

(assert (=> b!43727 (= lt!66356 Unit!3113)))

(assert (=> b!43727 (= (bitIndex!0 (size!1002 (buf!1339 (_2!2228 lt!66358))) (currentByte!2808 (_2!2228 lt!66358)) (currentBit!2803 (_2!2228 lt!66358))) (bvsub (bvadd (bitIndex!0 (size!1002 (buf!1339 (_2!2228 lt!65925))) (currentByte!2808 (_2!2228 lt!65925)) (currentBit!2803 (_2!2228 lt!65925))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!66341 () Unit!3098)

(declare-fun Unit!3114 () Unit!3098)

(assert (=> b!43727 (= lt!66341 Unit!3114)))

(assert (=> b!43727 (= (bitIndex!0 (size!1002 (buf!1339 (_2!2228 lt!66358))) (currentByte!2808 (_2!2228 lt!66358)) (currentBit!2803 (_2!2228 lt!66358))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1002 (buf!1339 (_2!2228 lt!66365))) (currentByte!2808 (_2!2228 lt!66365)) (currentBit!2803 (_2!2228 lt!66365))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!66350 () Unit!3098)

(declare-fun Unit!3115 () Unit!3098)

(assert (=> b!43727 (= lt!66350 Unit!3115)))

(declare-fun lt!66379 () tuple2!4272)

(assert (=> b!43727 (= lt!66379 call!513)))

(declare-fun lt!66372 () (_ BitVec 64))

(assert (=> b!43727 (= lt!66372 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!66344 () Unit!3098)

(assert (=> b!43727 (= lt!66344 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2228 lt!65925) (buf!1339 (_2!2228 lt!66358)) lt!66372))))

(assert (=> b!43727 (validate_offset_bits!1 ((_ sign_extend 32) (size!1002 (buf!1339 (_2!2228 lt!66358)))) ((_ sign_extend 32) (currentByte!2808 (_2!2228 lt!65925))) ((_ sign_extend 32) (currentBit!2803 (_2!2228 lt!65925))) lt!66372)))

(declare-fun lt!66345 () Unit!3098)

(assert (=> b!43727 (= lt!66345 lt!66344)))

(declare-fun lt!66375 () tuple2!4272)

(assert (=> b!43727 (= lt!66375 (reader!0 (_2!2228 lt!66365) (_2!2228 lt!66358)))))

(declare-fun lt!66346 () (_ BitVec 64))

(assert (=> b!43727 (= lt!66346 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!66351 () Unit!3098)

(assert (=> b!43727 (= lt!66351 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2228 lt!66365) (buf!1339 (_2!2228 lt!66358)) lt!66346))))

(assert (=> b!43727 (validate_offset_bits!1 ((_ sign_extend 32) (size!1002 (buf!1339 (_2!2228 lt!66358)))) ((_ sign_extend 32) (currentByte!2808 (_2!2228 lt!66365))) ((_ sign_extend 32) (currentBit!2803 (_2!2228 lt!66365))) lt!66346)))

(declare-fun lt!66363 () Unit!3098)

(assert (=> b!43727 (= lt!66363 lt!66351)))

(declare-fun lt!66352 () List!515)

(assert (=> b!43727 (= lt!66352 (byteArrayBitContentToList!0 (_2!2228 lt!66358) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!66369 () List!515)

(assert (=> b!43727 (= lt!66369 (byteArrayBitContentToList!0 (_2!2228 lt!66358) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!66361 () List!515)

(assert (=> b!43727 (= lt!66361 (bitStreamReadBitsIntoList!0 (_2!2228 lt!66358) (_1!2229 lt!66379) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!66373 () List!515)

(assert (=> b!43727 (= lt!66373 (bitStreamReadBitsIntoList!0 (_2!2228 lt!66358) (_1!2229 lt!66375) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!66357 () (_ BitVec 64))

(assert (=> b!43727 (= lt!66357 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!66359 () Unit!3098)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1748 BitStream!1748 BitStream!1748 BitStream!1748 (_ BitVec 64) List!515) Unit!3098)

(assert (=> b!43727 (= lt!66359 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2228 lt!66358) (_2!2228 lt!66358) (_1!2229 lt!66379) (_1!2229 lt!66375) lt!66357 lt!66361))))

(declare-fun tail!209 (List!515) List!515)

(assert (=> b!43727 (= (bitStreamReadBitsIntoList!0 (_2!2228 lt!66358) (_1!2229 lt!66375) (bvsub lt!66357 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!209 lt!66361))))

(declare-fun lt!66367 () Unit!3098)

(assert (=> b!43727 (= lt!66367 lt!66359)))

(declare-fun lt!66366 () (_ BitVec 64))

(declare-fun lt!66380 () Unit!3098)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2219 array!2219 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!3098)

(assert (=> b!43727 (= lt!66380 (arrayBitRangesEqImpliesEq!0 (buf!1339 (_2!2228 lt!66365)) (buf!1339 (_2!2228 lt!66358)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!66366 (bitIndex!0 (size!1002 (buf!1339 (_2!2228 lt!66365))) (currentByte!2808 (_2!2228 lt!66365)) (currentBit!2803 (_2!2228 lt!66365)))))))

(declare-fun bitAt!0 (array!2219 (_ BitVec 64)) Bool)

(assert (=> b!43727 (= (bitAt!0 (buf!1339 (_2!2228 lt!66365)) lt!66366) (bitAt!0 (buf!1339 (_2!2228 lt!66358)) lt!66366))))

(declare-fun lt!66374 () Unit!3098)

(assert (=> b!43727 (= lt!66374 lt!66380)))

(declare-fun b!43724 () Bool)

(declare-fun res!37078 () Bool)

(assert (=> b!43724 (=> (not res!37078) (not e!29169))))

(assert (=> b!43724 (= res!37078 (= (size!1002 (buf!1339 (_2!2228 lt!66342))) (size!1002 (buf!1339 (_2!2228 lt!65925)))))))

(declare-fun d!12648 () Bool)

(assert (=> d!12648 e!29169))

(declare-fun res!37081 () Bool)

(assert (=> d!12648 (=> (not res!37081) (not e!29169))))

(declare-fun lt!66376 () (_ BitVec 64))

(assert (=> d!12648 (= res!37081 (= (bitIndex!0 (size!1002 (buf!1339 (_2!2228 lt!66342))) (currentByte!2808 (_2!2228 lt!66342)) (currentBit!2803 (_2!2228 lt!66342))) (bvsub lt!66376 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!12648 (or (= (bvand lt!66376 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!66376 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!66376 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!66349 () (_ BitVec 64))

(assert (=> d!12648 (= lt!66376 (bvadd lt!66349 to!314))))

(assert (=> d!12648 (or (not (= (bvand lt!66349 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!66349 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!66349 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!12648 (= lt!66349 (bitIndex!0 (size!1002 (buf!1339 (_2!2228 lt!65925))) (currentByte!2808 (_2!2228 lt!65925)) (currentBit!2803 (_2!2228 lt!65925))))))

(assert (=> d!12648 (= lt!66342 e!29168)))

(assert (=> d!12648 (= c!2897 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!66354 () Unit!3098)

(declare-fun lt!66340 () Unit!3098)

(assert (=> d!12648 (= lt!66354 lt!66340)))

(assert (=> d!12648 (isPrefixOf!0 (_2!2228 lt!65925) (_2!2228 lt!65925))))

(assert (=> d!12648 (= lt!66340 (lemmaIsPrefixRefl!0 (_2!2228 lt!65925)))))

(assert (=> d!12648 (= lt!66366 (bitIndex!0 (size!1002 (buf!1339 (_2!2228 lt!65925))) (currentByte!2808 (_2!2228 lt!65925)) (currentBit!2803 (_2!2228 lt!65925))))))

(assert (=> d!12648 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!12648 (= (appendBitsMSBFirstLoop!0 (_2!2228 lt!65925) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!66342)))

(assert (= (and d!12648 c!2897) b!43727))

(assert (= (and d!12648 (not c!2897)) b!43720))

(assert (= (or b!43727 b!43720) bm!510))

(assert (= (and d!12648 res!37081) b!43725))

(assert (= (and b!43725 res!37079) b!43726))

(assert (= (and b!43726 res!37077) b!43722))

(assert (= (and b!43722 res!37076) b!43724))

(assert (= (and b!43724 res!37078) b!43721))

(assert (= (and b!43721 res!37080) b!43723))

(declare-fun m!66455 () Bool)

(assert (=> b!43725 m!66455))

(declare-fun m!66457 () Bool)

(assert (=> b!43723 m!66457))

(declare-fun m!66459 () Bool)

(assert (=> b!43720 m!66459))

(declare-fun m!66461 () Bool)

(assert (=> b!43720 m!66461))

(declare-fun m!66463 () Bool)

(assert (=> d!12648 m!66463))

(assert (=> d!12648 m!66341))

(assert (=> d!12648 m!66327))

(assert (=> d!12648 m!66323))

(declare-fun m!66465 () Bool)

(assert (=> b!43727 m!66465))

(declare-fun m!66467 () Bool)

(assert (=> b!43727 m!66467))

(declare-fun m!66469 () Bool)

(assert (=> b!43727 m!66469))

(declare-fun m!66471 () Bool)

(assert (=> b!43727 m!66471))

(declare-fun m!66473 () Bool)

(assert (=> b!43727 m!66473))

(declare-fun m!66475 () Bool)

(assert (=> b!43727 m!66475))

(declare-fun m!66477 () Bool)

(assert (=> b!43727 m!66477))

(declare-fun m!66479 () Bool)

(assert (=> b!43727 m!66479))

(declare-fun m!66481 () Bool)

(assert (=> b!43727 m!66481))

(declare-fun m!66483 () Bool)

(assert (=> b!43727 m!66483))

(declare-fun m!66485 () Bool)

(assert (=> b!43727 m!66485))

(declare-fun m!66487 () Bool)

(assert (=> b!43727 m!66487))

(assert (=> b!43727 m!66341))

(declare-fun m!66489 () Bool)

(assert (=> b!43727 m!66489))

(declare-fun m!66491 () Bool)

(assert (=> b!43727 m!66491))

(declare-fun m!66493 () Bool)

(assert (=> b!43727 m!66493))

(declare-fun m!66495 () Bool)

(assert (=> b!43727 m!66495))

(declare-fun m!66497 () Bool)

(assert (=> b!43727 m!66497))

(declare-fun m!66499 () Bool)

(assert (=> b!43727 m!66499))

(declare-fun m!66501 () Bool)

(assert (=> b!43727 m!66501))

(assert (=> b!43727 m!66501))

(declare-fun m!66503 () Bool)

(assert (=> b!43727 m!66503))

(assert (=> b!43727 m!66497))

(declare-fun m!66505 () Bool)

(assert (=> b!43727 m!66505))

(declare-fun m!66507 () Bool)

(assert (=> b!43727 m!66507))

(declare-fun m!66509 () Bool)

(assert (=> b!43727 m!66509))

(declare-fun m!66511 () Bool)

(assert (=> b!43727 m!66511))

(declare-fun m!66513 () Bool)

(assert (=> b!43727 m!66513))

(declare-fun m!66515 () Bool)

(assert (=> b!43727 m!66515))

(declare-fun m!66517 () Bool)

(assert (=> b!43727 m!66517))

(declare-fun m!66519 () Bool)

(assert (=> b!43727 m!66519))

(declare-fun m!66521 () Bool)

(assert (=> b!43727 m!66521))

(assert (=> b!43727 m!66479))

(assert (=> b!43727 m!66499))

(declare-fun m!66523 () Bool)

(assert (=> b!43727 m!66523))

(declare-fun m!66525 () Bool)

(assert (=> b!43727 m!66525))

(declare-fun m!66527 () Bool)

(assert (=> bm!510 m!66527))

(declare-fun m!66529 () Bool)

(assert (=> b!43721 m!66529))

(declare-fun m!66531 () Bool)

(assert (=> b!43721 m!66531))

(declare-fun m!66533 () Bool)

(assert (=> b!43721 m!66533))

(declare-fun m!66535 () Bool)

(assert (=> b!43721 m!66535))

(declare-fun m!66537 () Bool)

(assert (=> b!43721 m!66537))

(declare-fun m!66539 () Bool)

(assert (=> b!43722 m!66539))

(assert (=> b!43520 d!12648))

(declare-fun d!12674 () Bool)

(assert (=> d!12674 (isPrefixOf!0 thiss!1379 (_2!2228 lt!65921))))

(declare-fun lt!66389 () Unit!3098)

(declare-fun choose!30 (BitStream!1748 BitStream!1748 BitStream!1748) Unit!3098)

(assert (=> d!12674 (= lt!66389 (choose!30 thiss!1379 (_2!2228 lt!65925) (_2!2228 lt!65921)))))

(assert (=> d!12674 (isPrefixOf!0 thiss!1379 (_2!2228 lt!65925))))

(assert (=> d!12674 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2228 lt!65925) (_2!2228 lt!65921)) lt!66389)))

(declare-fun bs!3395 () Bool)

(assert (= bs!3395 d!12674))

(assert (=> bs!3395 m!66247))

(declare-fun m!66541 () Bool)

(assert (=> bs!3395 m!66541))

(assert (=> bs!3395 m!66265))

(assert (=> b!43520 d!12674))

(declare-fun d!12676 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!12676 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1002 (buf!1339 (_2!2228 lt!65925)))) ((_ sign_extend 32) (currentByte!2808 thiss!1379)) ((_ sign_extend 32) (currentBit!2803 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1002 (buf!1339 (_2!2228 lt!65925)))) ((_ sign_extend 32) (currentByte!2808 thiss!1379)) ((_ sign_extend 32) (currentBit!2803 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!3396 () Bool)

(assert (= bs!3396 d!12676))

(declare-fun m!66543 () Bool)

(assert (=> bs!3396 m!66543))

(assert (=> b!43520 d!12676))

(declare-fun d!12678 () Bool)

(assert (=> d!12678 (validate_offset_bits!1 ((_ sign_extend 32) (size!1002 (buf!1339 (_2!2228 lt!65925)))) ((_ sign_extend 32) (currentByte!2808 thiss!1379)) ((_ sign_extend 32) (currentBit!2803 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!66436 () Unit!3098)

(declare-fun choose!9 (BitStream!1748 array!2219 (_ BitVec 64) BitStream!1748) Unit!3098)

(assert (=> d!12678 (= lt!66436 (choose!9 thiss!1379 (buf!1339 (_2!2228 lt!65925)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1749 (buf!1339 (_2!2228 lt!65925)) (currentByte!2808 thiss!1379) (currentBit!2803 thiss!1379))))))

(assert (=> d!12678 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1339 (_2!2228 lt!65925)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!66436)))

(declare-fun bs!3397 () Bool)

(assert (= bs!3397 d!12678))

(assert (=> bs!3397 m!66243))

(declare-fun m!66545 () Bool)

(assert (=> bs!3397 m!66545))

(assert (=> b!43520 d!12678))

(declare-fun d!12680 () Bool)

(declare-fun res!37090 () Bool)

(declare-fun e!29175 () Bool)

(assert (=> d!12680 (=> (not res!37090) (not e!29175))))

(assert (=> d!12680 (= res!37090 (= (size!1002 (buf!1339 (_2!2228 lt!65925))) (size!1002 (buf!1339 (_2!2228 lt!65921)))))))

(assert (=> d!12680 (= (isPrefixOf!0 (_2!2228 lt!65925) (_2!2228 lt!65921)) e!29175)))

(declare-fun b!43738 () Bool)

(declare-fun res!37091 () Bool)

(assert (=> b!43738 (=> (not res!37091) (not e!29175))))

(assert (=> b!43738 (= res!37091 (bvsle (bitIndex!0 (size!1002 (buf!1339 (_2!2228 lt!65925))) (currentByte!2808 (_2!2228 lt!65925)) (currentBit!2803 (_2!2228 lt!65925))) (bitIndex!0 (size!1002 (buf!1339 (_2!2228 lt!65921))) (currentByte!2808 (_2!2228 lt!65921)) (currentBit!2803 (_2!2228 lt!65921)))))))

(declare-fun b!43739 () Bool)

(declare-fun e!29176 () Bool)

(assert (=> b!43739 (= e!29175 e!29176)))

(declare-fun res!37092 () Bool)

(assert (=> b!43739 (=> res!37092 e!29176)))

(assert (=> b!43739 (= res!37092 (= (size!1002 (buf!1339 (_2!2228 lt!65925))) #b00000000000000000000000000000000))))

(declare-fun b!43740 () Bool)

(assert (=> b!43740 (= e!29176 (arrayBitRangesEq!0 (buf!1339 (_2!2228 lt!65925)) (buf!1339 (_2!2228 lt!65921)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1002 (buf!1339 (_2!2228 lt!65925))) (currentByte!2808 (_2!2228 lt!65925)) (currentBit!2803 (_2!2228 lt!65925)))))))

(assert (= (and d!12680 res!37090) b!43738))

(assert (= (and b!43738 res!37091) b!43739))

(assert (= (and b!43739 (not res!37092)) b!43740))

(assert (=> b!43738 m!66341))

(assert (=> b!43738 m!66287))

(assert (=> b!43740 m!66341))

(assert (=> b!43740 m!66341))

(declare-fun m!66547 () Bool)

(assert (=> b!43740 m!66547))

(assert (=> b!43520 d!12680))

(declare-fun d!12682 () Bool)

(declare-fun e!29179 () Bool)

(assert (=> d!12682 e!29179))

(declare-fun res!37097 () Bool)

(assert (=> d!12682 (=> (not res!37097) (not e!29179))))

(declare-fun lt!66454 () (_ BitVec 64))

(declare-fun lt!66453 () (_ BitVec 64))

(declare-fun lt!66457 () (_ BitVec 64))

(assert (=> d!12682 (= res!37097 (= lt!66453 (bvsub lt!66454 lt!66457)))))

(assert (=> d!12682 (or (= (bvand lt!66454 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!66457 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!66454 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!66454 lt!66457) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!12682 (= lt!66457 (remainingBits!0 ((_ sign_extend 32) (size!1002 (buf!1339 (_2!2228 lt!65921)))) ((_ sign_extend 32) (currentByte!2808 (_2!2228 lt!65921))) ((_ sign_extend 32) (currentBit!2803 (_2!2228 lt!65921)))))))

(declare-fun lt!66452 () (_ BitVec 64))

(declare-fun lt!66456 () (_ BitVec 64))

(assert (=> d!12682 (= lt!66454 (bvmul lt!66452 lt!66456))))

(assert (=> d!12682 (or (= lt!66452 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!66456 (bvsdiv (bvmul lt!66452 lt!66456) lt!66452)))))

(assert (=> d!12682 (= lt!66456 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!12682 (= lt!66452 ((_ sign_extend 32) (size!1002 (buf!1339 (_2!2228 lt!65921)))))))

(assert (=> d!12682 (= lt!66453 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2808 (_2!2228 lt!65921))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2803 (_2!2228 lt!65921)))))))

(assert (=> d!12682 (invariant!0 (currentBit!2803 (_2!2228 lt!65921)) (currentByte!2808 (_2!2228 lt!65921)) (size!1002 (buf!1339 (_2!2228 lt!65921))))))

(assert (=> d!12682 (= (bitIndex!0 (size!1002 (buf!1339 (_2!2228 lt!65921))) (currentByte!2808 (_2!2228 lt!65921)) (currentBit!2803 (_2!2228 lt!65921))) lt!66453)))

(declare-fun b!43745 () Bool)

(declare-fun res!37098 () Bool)

(assert (=> b!43745 (=> (not res!37098) (not e!29179))))

(assert (=> b!43745 (= res!37098 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!66453))))

(declare-fun b!43746 () Bool)

(declare-fun lt!66455 () (_ BitVec 64))

(assert (=> b!43746 (= e!29179 (bvsle lt!66453 (bvmul lt!66455 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!43746 (or (= lt!66455 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!66455 #b0000000000000000000000000000000000000000000000000000000000001000) lt!66455)))))

(assert (=> b!43746 (= lt!66455 ((_ sign_extend 32) (size!1002 (buf!1339 (_2!2228 lt!65921)))))))

(assert (= (and d!12682 res!37097) b!43745))

(assert (= (and b!43745 res!37098) b!43746))

(declare-fun m!66643 () Bool)

(assert (=> d!12682 m!66643))

(assert (=> d!12682 m!66241))

(assert (=> b!43518 d!12682))

(declare-fun d!12690 () Bool)

(declare-fun res!37099 () Bool)

(declare-fun e!29180 () Bool)

(assert (=> d!12690 (=> (not res!37099) (not e!29180))))

(assert (=> d!12690 (= res!37099 (= (size!1002 (buf!1339 thiss!1379)) (size!1002 (buf!1339 (_2!2228 lt!65925)))))))

(assert (=> d!12690 (= (isPrefixOf!0 thiss!1379 (_2!2228 lt!65925)) e!29180)))

(declare-fun b!43747 () Bool)

(declare-fun res!37100 () Bool)

(assert (=> b!43747 (=> (not res!37100) (not e!29180))))

(assert (=> b!43747 (= res!37100 (bvsle (bitIndex!0 (size!1002 (buf!1339 thiss!1379)) (currentByte!2808 thiss!1379) (currentBit!2803 thiss!1379)) (bitIndex!0 (size!1002 (buf!1339 (_2!2228 lt!65925))) (currentByte!2808 (_2!2228 lt!65925)) (currentBit!2803 (_2!2228 lt!65925)))))))

(declare-fun b!43748 () Bool)

(declare-fun e!29181 () Bool)

(assert (=> b!43748 (= e!29180 e!29181)))

(declare-fun res!37101 () Bool)

(assert (=> b!43748 (=> res!37101 e!29181)))

(assert (=> b!43748 (= res!37101 (= (size!1002 (buf!1339 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!43749 () Bool)

(assert (=> b!43749 (= e!29181 (arrayBitRangesEq!0 (buf!1339 thiss!1379) (buf!1339 (_2!2228 lt!65925)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1002 (buf!1339 thiss!1379)) (currentByte!2808 thiss!1379) (currentBit!2803 thiss!1379))))))

(assert (= (and d!12690 res!37099) b!43747))

(assert (= (and b!43747 res!37100) b!43748))

(assert (= (and b!43748 (not res!37101)) b!43749))

(assert (=> b!43747 m!66281))

(assert (=> b!43747 m!66341))

(assert (=> b!43749 m!66281))

(assert (=> b!43749 m!66281))

(declare-fun m!66645 () Bool)

(assert (=> b!43749 m!66645))

(assert (=> b!43519 d!12690))

(declare-fun d!12692 () Bool)

(assert (=> d!12692 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1002 (buf!1339 (_2!2228 lt!65925)))) ((_ sign_extend 32) (currentByte!2808 (_2!2228 lt!65925))) ((_ sign_extend 32) (currentBit!2803 (_2!2228 lt!65925))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1002 (buf!1339 (_2!2228 lt!65925)))) ((_ sign_extend 32) (currentByte!2808 (_2!2228 lt!65925))) ((_ sign_extend 32) (currentBit!2803 (_2!2228 lt!65925)))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!3400 () Bool)

(assert (= bs!3400 d!12692))

(declare-fun m!66647 () Bool)

(assert (=> bs!3400 m!66647))

(assert (=> b!43519 d!12692))

(declare-fun d!12694 () Bool)

(declare-fun e!29184 () Bool)

(assert (=> d!12694 e!29184))

(declare-fun res!37104 () Bool)

(assert (=> d!12694 (=> (not res!37104) (not e!29184))))

(assert (=> d!12694 (= res!37104 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!66460 () Unit!3098)

(declare-fun choose!27 (BitStream!1748 BitStream!1748 (_ BitVec 64) (_ BitVec 64)) Unit!3098)

(assert (=> d!12694 (= lt!66460 (choose!27 thiss!1379 (_2!2228 lt!65925) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!12694 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!12694 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2228 lt!65925) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!66460)))

(declare-fun b!43752 () Bool)

(assert (=> b!43752 (= e!29184 (validate_offset_bits!1 ((_ sign_extend 32) (size!1002 (buf!1339 (_2!2228 lt!65925)))) ((_ sign_extend 32) (currentByte!2808 (_2!2228 lt!65925))) ((_ sign_extend 32) (currentBit!2803 (_2!2228 lt!65925))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!12694 res!37104) b!43752))

(declare-fun m!66649 () Bool)

(assert (=> d!12694 m!66649))

(assert (=> b!43752 m!66263))

(assert (=> b!43519 d!12694))

(declare-fun b!43796 () Bool)

(declare-fun res!37144 () Bool)

(declare-fun e!29205 () Bool)

(assert (=> b!43796 (=> (not res!37144) (not e!29205))))

(declare-fun lt!66574 () (_ BitVec 64))

(declare-fun lt!66572 () (_ BitVec 64))

(declare-fun lt!66575 () tuple2!4270)

(assert (=> b!43796 (= res!37144 (= (bitIndex!0 (size!1002 (buf!1339 (_2!2228 lt!66575))) (currentByte!2808 (_2!2228 lt!66575)) (currentBit!2803 (_2!2228 lt!66575))) (bvadd lt!66572 lt!66574)))))

(assert (=> b!43796 (or (not (= (bvand lt!66572 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!66574 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!66572 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!66572 lt!66574) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!43796 (= lt!66574 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!43796 (= lt!66572 (bitIndex!0 (size!1002 (buf!1339 thiss!1379)) (currentByte!2808 thiss!1379) (currentBit!2803 thiss!1379)))))

(declare-fun b!43797 () Bool)

(declare-fun e!29206 () Bool)

(declare-fun e!29208 () Bool)

(assert (=> b!43797 (= e!29206 e!29208)))

(declare-fun res!37145 () Bool)

(assert (=> b!43797 (=> (not res!37145) (not e!29208))))

(declare-datatypes ((tuple2!4288 0))(
  ( (tuple2!4289 (_1!2237 BitStream!1748) (_2!2237 Bool)) )
))
(declare-fun lt!66579 () tuple2!4288)

(declare-fun lt!66578 () Bool)

(declare-fun lt!66583 () tuple2!4270)

(assert (=> b!43797 (= res!37145 (and (= (_2!2237 lt!66579) lt!66578) (= (_1!2237 lt!66579) (_2!2228 lt!66583))))))

(declare-fun readBitPure!0 (BitStream!1748) tuple2!4288)

(declare-fun readerFrom!0 (BitStream!1748 (_ BitVec 32) (_ BitVec 32)) BitStream!1748)

(assert (=> b!43797 (= lt!66579 (readBitPure!0 (readerFrom!0 (_2!2228 lt!66583) (currentBit!2803 thiss!1379) (currentByte!2808 thiss!1379))))))

(declare-fun b!43798 () Bool)

(declare-fun e!29207 () Bool)

(assert (=> b!43798 (= e!29205 e!29207)))

(declare-fun res!37148 () Bool)

(assert (=> b!43798 (=> (not res!37148) (not e!29207))))

(declare-fun lt!66576 () (_ BitVec 8))

(declare-fun lt!66573 () tuple2!4288)

(assert (=> b!43798 (= res!37148 (and (= (_2!2237 lt!66573) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1507 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!66576)) #b00000000000000000000000000000000))) (= (_1!2237 lt!66573) (_2!2228 lt!66575))))))

(declare-fun lt!66580 () tuple2!4282)

(declare-fun lt!66577 () BitStream!1748)

(assert (=> b!43798 (= lt!66580 (readBits!0 lt!66577 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!43798 (= lt!66573 (readBitPure!0 lt!66577))))

(assert (=> b!43798 (= lt!66577 (readerFrom!0 (_2!2228 lt!66575) (currentBit!2803 thiss!1379) (currentByte!2808 thiss!1379)))))

(declare-fun b!43799 () Bool)

(assert (=> b!43799 (= e!29208 (= (bitIndex!0 (size!1002 (buf!1339 (_1!2237 lt!66579))) (currentByte!2808 (_1!2237 lt!66579)) (currentBit!2803 (_1!2237 lt!66579))) (bitIndex!0 (size!1002 (buf!1339 (_2!2228 lt!66583))) (currentByte!2808 (_2!2228 lt!66583)) (currentBit!2803 (_2!2228 lt!66583)))))))

(declare-fun b!43800 () Bool)

(declare-fun res!37141 () Bool)

(assert (=> b!43800 (=> (not res!37141) (not e!29206))))

(assert (=> b!43800 (= res!37141 (= (bitIndex!0 (size!1002 (buf!1339 (_2!2228 lt!66583))) (currentByte!2808 (_2!2228 lt!66583)) (currentBit!2803 (_2!2228 lt!66583))) (bvadd (bitIndex!0 (size!1002 (buf!1339 thiss!1379)) (currentByte!2808 thiss!1379) (currentBit!2803 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!43801 () Bool)

(assert (=> b!43801 (= e!29207 (= (bitIndex!0 (size!1002 (buf!1339 (_1!2237 lt!66573))) (currentByte!2808 (_1!2237 lt!66573)) (currentBit!2803 (_1!2237 lt!66573))) (bitIndex!0 (size!1002 (buf!1339 (_2!2228 lt!66575))) (currentByte!2808 (_2!2228 lt!66575)) (currentBit!2803 (_2!2228 lt!66575)))))))

(declare-fun d!12696 () Bool)

(assert (=> d!12696 e!29205))

(declare-fun res!37143 () Bool)

(assert (=> d!12696 (=> (not res!37143) (not e!29205))))

(assert (=> d!12696 (= res!37143 (= (size!1002 (buf!1339 (_2!2228 lt!66575))) (size!1002 (buf!1339 thiss!1379))))))

(declare-fun lt!66582 () array!2219)

(assert (=> d!12696 (= lt!66576 (select (arr!1507 lt!66582) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!12696 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1002 lt!66582)))))

(assert (=> d!12696 (= lt!66582 (array!2220 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!66581 () tuple2!4270)

(assert (=> d!12696 (= lt!66575 (tuple2!4271 (_1!2228 lt!66581) (_2!2228 lt!66581)))))

(assert (=> d!12696 (= lt!66581 lt!66583)))

(assert (=> d!12696 e!29206))

(declare-fun res!37142 () Bool)

(assert (=> d!12696 (=> (not res!37142) (not e!29206))))

(assert (=> d!12696 (= res!37142 (= (size!1002 (buf!1339 thiss!1379)) (size!1002 (buf!1339 (_2!2228 lt!66583)))))))

(declare-fun appendBit!0 (BitStream!1748 Bool) tuple2!4270)

(assert (=> d!12696 (= lt!66583 (appendBit!0 thiss!1379 lt!66578))))

(assert (=> d!12696 (= lt!66578 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1507 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!12696 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!12696 (= (appendBitFromByte!0 thiss!1379 (select (arr!1507 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!66575)))

(declare-fun b!43802 () Bool)

(declare-fun res!37147 () Bool)

(assert (=> b!43802 (=> (not res!37147) (not e!29205))))

(assert (=> b!43802 (= res!37147 (isPrefixOf!0 thiss!1379 (_2!2228 lt!66575)))))

(declare-fun b!43803 () Bool)

(declare-fun res!37146 () Bool)

(assert (=> b!43803 (=> (not res!37146) (not e!29206))))

(assert (=> b!43803 (= res!37146 (isPrefixOf!0 thiss!1379 (_2!2228 lt!66583)))))

(assert (= (and d!12696 res!37142) b!43800))

(assert (= (and b!43800 res!37141) b!43803))

(assert (= (and b!43803 res!37146) b!43797))

(assert (= (and b!43797 res!37145) b!43799))

(assert (= (and d!12696 res!37143) b!43796))

(assert (= (and b!43796 res!37144) b!43802))

(assert (= (and b!43802 res!37147) b!43798))

(assert (= (and b!43798 res!37148) b!43801))

(declare-fun m!66679 () Bool)

(assert (=> d!12696 m!66679))

(declare-fun m!66681 () Bool)

(assert (=> d!12696 m!66681))

(declare-fun m!66683 () Bool)

(assert (=> d!12696 m!66683))

(declare-fun m!66685 () Bool)

(assert (=> b!43799 m!66685))

(declare-fun m!66687 () Bool)

(assert (=> b!43799 m!66687))

(declare-fun m!66689 () Bool)

(assert (=> b!43797 m!66689))

(assert (=> b!43797 m!66689))

(declare-fun m!66691 () Bool)

(assert (=> b!43797 m!66691))

(declare-fun m!66693 () Bool)

(assert (=> b!43801 m!66693))

(declare-fun m!66695 () Bool)

(assert (=> b!43801 m!66695))

(declare-fun m!66697 () Bool)

(assert (=> b!43802 m!66697))

(declare-fun m!66699 () Bool)

(assert (=> b!43803 m!66699))

(assert (=> b!43800 m!66687))

(assert (=> b!43800 m!66281))

(declare-fun m!66701 () Bool)

(assert (=> b!43798 m!66701))

(declare-fun m!66703 () Bool)

(assert (=> b!43798 m!66703))

(declare-fun m!66705 () Bool)

(assert (=> b!43798 m!66705))

(assert (=> b!43796 m!66695))

(assert (=> b!43796 m!66281))

(assert (=> b!43519 d!12696))

(declare-fun d!12706 () Bool)

(assert (=> d!12706 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1002 (buf!1339 thiss!1379))) ((_ sign_extend 32) (currentByte!2808 thiss!1379)) ((_ sign_extend 32) (currentBit!2803 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1002 (buf!1339 thiss!1379))) ((_ sign_extend 32) (currentByte!2808 thiss!1379)) ((_ sign_extend 32) (currentBit!2803 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!3403 () Bool)

(assert (= bs!3403 d!12706))

(declare-fun m!66707 () Bool)

(assert (=> bs!3403 m!66707))

(assert (=> b!43524 d!12706))

(declare-fun d!12708 () Bool)

(assert (=> d!12708 (= (head!334 (byteArrayBitContentToList!0 (_2!2228 lt!65925) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!630 (byteArrayBitContentToList!0 (_2!2228 lt!65925) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!43522 d!12708))

(declare-fun d!12710 () Bool)

(declare-fun c!2904 () Bool)

(assert (=> d!12710 (= c!2904 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!29211 () List!515)

(assert (=> d!12710 (= (byteArrayBitContentToList!0 (_2!2228 lt!65925) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!29211)))

(declare-fun b!43808 () Bool)

(assert (=> b!43808 (= e!29211 Nil!512)))

(declare-fun b!43809 () Bool)

(assert (=> b!43809 (= e!29211 (Cons!511 (not (= (bvand ((_ sign_extend 24) (select (arr!1507 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2228 lt!65925) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!12710 c!2904) b!43808))

(assert (= (and d!12710 (not c!2904)) b!43809))

(assert (=> b!43809 m!66261))

(assert (=> b!43809 m!66683))

(declare-fun m!66709 () Bool)

(assert (=> b!43809 m!66709))

(assert (=> b!43522 d!12710))

(declare-fun d!12712 () Bool)

(assert (=> d!12712 (= (head!334 (bitStreamReadBitsIntoList!0 (_2!2228 lt!65925) (_1!2229 lt!65924) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!630 (bitStreamReadBitsIntoList!0 (_2!2228 lt!65925) (_1!2229 lt!65924) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!43522 d!12712))

(declare-fun d!12714 () Bool)

(declare-fun e!29217 () Bool)

(assert (=> d!12714 e!29217))

(declare-fun c!2910 () Bool)

(assert (=> d!12714 (= c!2910 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!66591 () List!515)

(declare-datatypes ((tuple2!4294 0))(
  ( (tuple2!4295 (_1!2240 List!515) (_2!2240 BitStream!1748)) )
))
(declare-fun e!29216 () tuple2!4294)

(assert (=> d!12714 (= lt!66591 (_1!2240 e!29216))))

(declare-fun c!2909 () Bool)

(assert (=> d!12714 (= c!2909 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!12714 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!12714 (= (bitStreamReadBitsIntoList!0 (_2!2228 lt!65925) (_1!2229 lt!65924) #b0000000000000000000000000000000000000000000000000000000000000001) lt!66591)))

(declare-fun b!43819 () Bool)

(declare-datatypes ((tuple2!4296 0))(
  ( (tuple2!4297 (_1!2241 Bool) (_2!2241 BitStream!1748)) )
))
(declare-fun lt!66592 () tuple2!4296)

(declare-fun lt!66590 () (_ BitVec 64))

(assert (=> b!43819 (= e!29216 (tuple2!4295 (Cons!511 (_1!2241 lt!66592) (bitStreamReadBitsIntoList!0 (_2!2228 lt!65925) (_2!2241 lt!66592) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!66590))) (_2!2241 lt!66592)))))

(declare-fun readBit!0 (BitStream!1748) tuple2!4296)

(assert (=> b!43819 (= lt!66592 (readBit!0 (_1!2229 lt!65924)))))

(assert (=> b!43819 (= lt!66590 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!43821 () Bool)

(declare-fun length!219 (List!515) Int)

(assert (=> b!43821 (= e!29217 (> (length!219 lt!66591) 0))))

(declare-fun b!43818 () Bool)

(assert (=> b!43818 (= e!29216 (tuple2!4295 Nil!512 (_1!2229 lt!65924)))))

(declare-fun b!43820 () Bool)

(declare-fun isEmpty!121 (List!515) Bool)

(assert (=> b!43820 (= e!29217 (isEmpty!121 lt!66591))))

(assert (= (and d!12714 c!2909) b!43818))

(assert (= (and d!12714 (not c!2909)) b!43819))

(assert (= (and d!12714 c!2910) b!43820))

(assert (= (and d!12714 (not c!2910)) b!43821))

(declare-fun m!66711 () Bool)

(assert (=> b!43819 m!66711))

(declare-fun m!66713 () Bool)

(assert (=> b!43819 m!66713))

(declare-fun m!66715 () Bool)

(assert (=> b!43821 m!66715))

(declare-fun m!66717 () Bool)

(assert (=> b!43820 m!66717))

(assert (=> b!43522 d!12714))

(declare-fun d!12716 () Bool)

(assert (=> d!12716 (= (array_inv!927 (buf!1339 thiss!1379)) (bvsge (size!1002 (buf!1339 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!43523 d!12716))

(declare-fun d!12718 () Bool)

(assert (=> d!12718 (= (array_inv!927 srcBuffer!2) (bvsge (size!1002 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!8742 d!12718))

(declare-fun d!12720 () Bool)

(assert (=> d!12720 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2803 thiss!1379) (currentByte!2808 thiss!1379) (size!1002 (buf!1339 thiss!1379))))))

(declare-fun bs!3404 () Bool)

(assert (= bs!3404 d!12720))

(declare-fun m!66719 () Bool)

(assert (=> bs!3404 m!66719))

(assert (=> start!8742 d!12720))

(declare-fun d!12722 () Bool)

(declare-fun res!37149 () Bool)

(declare-fun e!29218 () Bool)

(assert (=> d!12722 (=> (not res!37149) (not e!29218))))

(assert (=> d!12722 (= res!37149 (= (size!1002 (buf!1339 thiss!1379)) (size!1002 (buf!1339 thiss!1379))))))

(assert (=> d!12722 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!29218)))

(declare-fun b!43822 () Bool)

(declare-fun res!37150 () Bool)

(assert (=> b!43822 (=> (not res!37150) (not e!29218))))

(assert (=> b!43822 (= res!37150 (bvsle (bitIndex!0 (size!1002 (buf!1339 thiss!1379)) (currentByte!2808 thiss!1379) (currentBit!2803 thiss!1379)) (bitIndex!0 (size!1002 (buf!1339 thiss!1379)) (currentByte!2808 thiss!1379) (currentBit!2803 thiss!1379))))))

(declare-fun b!43823 () Bool)

(declare-fun e!29219 () Bool)

(assert (=> b!43823 (= e!29218 e!29219)))

(declare-fun res!37151 () Bool)

(assert (=> b!43823 (=> res!37151 e!29219)))

(assert (=> b!43823 (= res!37151 (= (size!1002 (buf!1339 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!43824 () Bool)

(assert (=> b!43824 (= e!29219 (arrayBitRangesEq!0 (buf!1339 thiss!1379) (buf!1339 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1002 (buf!1339 thiss!1379)) (currentByte!2808 thiss!1379) (currentBit!2803 thiss!1379))))))

(assert (= (and d!12722 res!37149) b!43822))

(assert (= (and b!43822 res!37150) b!43823))

(assert (= (and b!43823 (not res!37151)) b!43824))

(assert (=> b!43822 m!66281))

(assert (=> b!43822 m!66281))

(assert (=> b!43824 m!66281))

(assert (=> b!43824 m!66281))

(declare-fun m!66721 () Bool)

(assert (=> b!43824 m!66721))

(assert (=> b!43521 d!12722))

(declare-fun d!12724 () Bool)

(assert (=> d!12724 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!66595 () Unit!3098)

(declare-fun choose!11 (BitStream!1748) Unit!3098)

(assert (=> d!12724 (= lt!66595 (choose!11 thiss!1379))))

(assert (=> d!12724 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!66595)))

(declare-fun bs!3406 () Bool)

(assert (= bs!3406 d!12724))

(assert (=> bs!3406 m!66277))

(declare-fun m!66723 () Bool)

(assert (=> bs!3406 m!66723))

(assert (=> b!43521 d!12724))

(declare-fun d!12726 () Bool)

(declare-fun e!29220 () Bool)

(assert (=> d!12726 e!29220))

(declare-fun res!37152 () Bool)

(assert (=> d!12726 (=> (not res!37152) (not e!29220))))

(declare-fun lt!66598 () (_ BitVec 64))

(declare-fun lt!66601 () (_ BitVec 64))

(declare-fun lt!66597 () (_ BitVec 64))

(assert (=> d!12726 (= res!37152 (= lt!66597 (bvsub lt!66598 lt!66601)))))

(assert (=> d!12726 (or (= (bvand lt!66598 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!66601 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!66598 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!66598 lt!66601) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!12726 (= lt!66601 (remainingBits!0 ((_ sign_extend 32) (size!1002 (buf!1339 thiss!1379))) ((_ sign_extend 32) (currentByte!2808 thiss!1379)) ((_ sign_extend 32) (currentBit!2803 thiss!1379))))))

(declare-fun lt!66596 () (_ BitVec 64))

(declare-fun lt!66600 () (_ BitVec 64))

(assert (=> d!12726 (= lt!66598 (bvmul lt!66596 lt!66600))))

(assert (=> d!12726 (or (= lt!66596 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!66600 (bvsdiv (bvmul lt!66596 lt!66600) lt!66596)))))

(assert (=> d!12726 (= lt!66600 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!12726 (= lt!66596 ((_ sign_extend 32) (size!1002 (buf!1339 thiss!1379))))))

(assert (=> d!12726 (= lt!66597 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2808 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2803 thiss!1379))))))

(assert (=> d!12726 (invariant!0 (currentBit!2803 thiss!1379) (currentByte!2808 thiss!1379) (size!1002 (buf!1339 thiss!1379)))))

(assert (=> d!12726 (= (bitIndex!0 (size!1002 (buf!1339 thiss!1379)) (currentByte!2808 thiss!1379) (currentBit!2803 thiss!1379)) lt!66597)))

(declare-fun b!43825 () Bool)

(declare-fun res!37153 () Bool)

(assert (=> b!43825 (=> (not res!37153) (not e!29220))))

(assert (=> b!43825 (= res!37153 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!66597))))

(declare-fun b!43826 () Bool)

(declare-fun lt!66599 () (_ BitVec 64))

(assert (=> b!43826 (= e!29220 (bvsle lt!66597 (bvmul lt!66599 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!43826 (or (= lt!66599 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!66599 #b0000000000000000000000000000000000000000000000000000000000001000) lt!66599)))))

(assert (=> b!43826 (= lt!66599 ((_ sign_extend 32) (size!1002 (buf!1339 thiss!1379))))))

(assert (= (and d!12726 res!37152) b!43825))

(assert (= (and b!43825 res!37153) b!43826))

(assert (=> d!12726 m!66707))

(assert (=> d!12726 m!66719))

(assert (=> b!43521 d!12726))

(push 1)

(assert (not d!12726))

(assert (not b!43799))

(assert (not b!43801))

(assert (not d!12706))

(assert (not d!12724))

(assert (not b!43588))

(assert (not b!43749))

(assert (not b!43727))

(assert (not b!43796))

(assert (not b!43797))

(assert (not b!43802))

(assert (not b!43819))

(assert (not b!43610))

(assert (not d!12648))

(assert (not b!43738))

(assert (not b!43725))

(assert (not d!12720))

(assert (not d!12692))

(assert (not b!43740))

(assert (not d!12676))

(assert (not b!43800))

(assert (not b!43809))

(assert (not d!12678))

(assert (not d!12634))

(assert (not b!43723))

(assert (not d!12682))

(assert (not d!12694))

(assert (not b!43586))

(assert (not b!43824))

(assert (not b!43822))

(assert (not bm!510))

(assert (not b!43722))

(assert (not b!43590))

(assert (not b!43587))

(assert (not b!43752))

(assert (not b!43821))

(assert (not b!43720))

(assert (not b!43798))

(assert (not b!43747))

(assert (not b!43820))

(assert (not b!43803))

(assert (not d!12696))

(assert (not d!12674))

(assert (not b!43721))

(assert (not b!43608))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

