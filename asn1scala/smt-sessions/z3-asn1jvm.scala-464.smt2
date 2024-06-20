; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!13136 () Bool)

(assert start!13136)

(declare-fun res!55798 () Bool)

(declare-fun e!44160 () Bool)

(assert (=> start!13136 (=> (not res!55798) (not e!44160))))

(declare-datatypes ((array!2868 0))(
  ( (array!2869 (arr!1896 (Array (_ BitVec 32) (_ BitVec 8))) (size!1326 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2868)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!13136 (= res!55798 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1326 srcBuffer!2))))))))

(assert (=> start!13136 e!44160))

(assert (=> start!13136 true))

(declare-fun array_inv!1196 (array!2868) Bool)

(assert (=> start!13136 (array_inv!1196 srcBuffer!2)))

(declare-datatypes ((BitStream!2274 0))(
  ( (BitStream!2275 (buf!1707 array!2868) (currentByte!3391 (_ BitVec 32)) (currentBit!3386 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2274)

(declare-fun e!44161 () Bool)

(declare-fun inv!12 (BitStream!2274) Bool)

(assert (=> start!13136 (and (inv!12 thiss!1379) e!44161)))

(declare-fun b!67380 () Bool)

(declare-fun e!44153 () Bool)

(assert (=> b!67380 (= e!44160 (not e!44153))))

(declare-fun res!55794 () Bool)

(assert (=> b!67380 (=> res!55794 e!44153)))

(assert (=> b!67380 (= res!55794 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!2274 BitStream!2274) Bool)

(assert (=> b!67380 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!4537 0))(
  ( (Unit!4538) )
))
(declare-fun lt!107408 () Unit!4537)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2274) Unit!4537)

(assert (=> b!67380 (= lt!107408 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!107425 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!67380 (= lt!107425 (bitIndex!0 (size!1326 (buf!1707 thiss!1379)) (currentByte!3391 thiss!1379) (currentBit!3386 thiss!1379)))))

(declare-fun b!67381 () Bool)

(declare-fun res!55790 () Bool)

(assert (=> b!67381 (=> (not res!55790) (not e!44160))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!67381 (= res!55790 (validate_offset_bits!1 ((_ sign_extend 32) (size!1326 (buf!1707 thiss!1379))) ((_ sign_extend 32) (currentByte!3391 thiss!1379)) ((_ sign_extend 32) (currentBit!3386 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!67382 () Bool)

(declare-fun res!55786 () Bool)

(declare-fun e!44152 () Bool)

(assert (=> b!67382 (=> res!55786 e!44152)))

(declare-datatypes ((List!712 0))(
  ( (Nil!709) (Cons!708 (h!827 Bool) (t!1462 List!712)) )
))
(declare-fun lt!107405 () List!712)

(declare-fun lt!107407 () Bool)

(declare-fun head!531 (List!712) Bool)

(assert (=> b!67382 (= res!55786 (not (= (head!531 lt!107405) lt!107407)))))

(declare-fun b!67383 () Bool)

(declare-fun e!44164 () Bool)

(assert (=> b!67383 (= e!44164 e!44152)))

(declare-fun res!55799 () Bool)

(assert (=> b!67383 (=> res!55799 e!44152)))

(declare-datatypes ((tuple2!5932 0))(
  ( (tuple2!5933 (_1!3077 BitStream!2274) (_2!3077 BitStream!2274)) )
))
(declare-fun lt!107403 () tuple2!5932)

(declare-fun bitAt!0 (array!2868 (_ BitVec 64)) Bool)

(assert (=> b!67383 (= res!55799 (not (= lt!107407 (bitAt!0 (buf!1707 (_1!3077 lt!107403)) lt!107425))))))

(declare-fun lt!107404 () tuple2!5932)

(assert (=> b!67383 (= lt!107407 (bitAt!0 (buf!1707 (_1!3077 lt!107404)) lt!107425))))

(declare-fun b!67384 () Bool)

(declare-fun res!55782 () Bool)

(declare-fun e!44158 () Bool)

(assert (=> b!67384 (=> res!55782 e!44158)))

(declare-datatypes ((tuple2!5934 0))(
  ( (tuple2!5935 (_1!3078 Unit!4537) (_2!3078 BitStream!2274)) )
))
(declare-fun lt!107411 () tuple2!5934)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!67384 (= res!55782 (not (invariant!0 (currentBit!3386 (_2!3078 lt!107411)) (currentByte!3391 (_2!3078 lt!107411)) (size!1326 (buf!1707 (_2!3078 lt!107411))))))))

(declare-fun b!67385 () Bool)

(declare-fun res!55797 () Bool)

(declare-fun e!44155 () Bool)

(assert (=> b!67385 (=> res!55797 e!44155)))

(declare-fun lt!107418 () tuple2!5934)

(assert (=> b!67385 (= res!55797 (not (= (size!1326 (buf!1707 thiss!1379)) (size!1326 (buf!1707 (_2!3078 lt!107418))))))))

(declare-fun b!67386 () Bool)

(declare-fun res!55796 () Bool)

(assert (=> b!67386 (=> res!55796 e!44158)))

(assert (=> b!67386 (= res!55796 (not (invariant!0 (currentBit!3386 (_2!3078 lt!107411)) (currentByte!3391 (_2!3078 lt!107411)) (size!1326 (buf!1707 (_2!3078 lt!107418))))))))

(declare-fun b!67387 () Bool)

(declare-fun e!44162 () Bool)

(declare-fun e!44163 () Bool)

(assert (=> b!67387 (= e!44162 e!44163)))

(declare-fun res!55784 () Bool)

(assert (=> b!67387 (=> res!55784 e!44163)))

(assert (=> b!67387 (= res!55784 (not (isPrefixOf!0 (_2!3078 lt!107411) (_2!3078 lt!107418))))))

(assert (=> b!67387 (isPrefixOf!0 thiss!1379 (_2!3078 lt!107418))))

(declare-fun lt!107419 () Unit!4537)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2274 BitStream!2274 BitStream!2274) Unit!4537)

(assert (=> b!67387 (= lt!107419 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3078 lt!107411) (_2!3078 lt!107418)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2274 array!2868 (_ BitVec 64) (_ BitVec 64)) tuple2!5934)

(assert (=> b!67387 (= lt!107418 (appendBitsMSBFirstLoop!0 (_2!3078 lt!107411) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!44165 () Bool)

(assert (=> b!67387 e!44165))

(declare-fun res!55791 () Bool)

(assert (=> b!67387 (=> (not res!55791) (not e!44165))))

(assert (=> b!67387 (= res!55791 (validate_offset_bits!1 ((_ sign_extend 32) (size!1326 (buf!1707 (_2!3078 lt!107411)))) ((_ sign_extend 32) (currentByte!3391 thiss!1379)) ((_ sign_extend 32) (currentBit!3386 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!107423 () Unit!4537)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2274 array!2868 (_ BitVec 64)) Unit!4537)

(assert (=> b!67387 (= lt!107423 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1707 (_2!3078 lt!107411)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!107406 () tuple2!5932)

(declare-fun reader!0 (BitStream!2274 BitStream!2274) tuple2!5932)

(assert (=> b!67387 (= lt!107406 (reader!0 thiss!1379 (_2!3078 lt!107411)))))

(declare-fun b!67388 () Bool)

(declare-fun e!44157 () Bool)

(assert (=> b!67388 (= e!44158 e!44157)))

(declare-fun res!55789 () Bool)

(assert (=> b!67388 (=> res!55789 e!44157)))

(assert (=> b!67388 (= res!55789 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!107422 () List!712)

(declare-fun lt!107424 () (_ BitVec 64))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2274 BitStream!2274 (_ BitVec 64)) List!712)

(assert (=> b!67388 (= lt!107422 (bitStreamReadBitsIntoList!0 (_2!3078 lt!107418) (_1!3077 lt!107403) lt!107424))))

(assert (=> b!67388 (= lt!107405 (bitStreamReadBitsIntoList!0 (_2!3078 lt!107418) (_1!3077 lt!107404) (bvsub to!314 i!635)))))

(assert (=> b!67388 (validate_offset_bits!1 ((_ sign_extend 32) (size!1326 (buf!1707 (_2!3078 lt!107418)))) ((_ sign_extend 32) (currentByte!3391 (_2!3078 lt!107411))) ((_ sign_extend 32) (currentBit!3386 (_2!3078 lt!107411))) lt!107424)))

(declare-fun lt!107412 () Unit!4537)

(assert (=> b!67388 (= lt!107412 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3078 lt!107411) (buf!1707 (_2!3078 lt!107418)) lt!107424))))

(assert (=> b!67388 (= lt!107403 (reader!0 (_2!3078 lt!107411) (_2!3078 lt!107418)))))

(assert (=> b!67388 (validate_offset_bits!1 ((_ sign_extend 32) (size!1326 (buf!1707 (_2!3078 lt!107418)))) ((_ sign_extend 32) (currentByte!3391 thiss!1379)) ((_ sign_extend 32) (currentBit!3386 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!107421 () Unit!4537)

(assert (=> b!67388 (= lt!107421 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1707 (_2!3078 lt!107418)) (bvsub to!314 i!635)))))

(assert (=> b!67388 (= lt!107404 (reader!0 thiss!1379 (_2!3078 lt!107418)))))

(declare-fun b!67389 () Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2274 array!2868 (_ BitVec 64) (_ BitVec 64)) List!712)

(assert (=> b!67389 (= e!44165 (= (head!531 (byteArrayBitContentToList!0 (_2!3078 lt!107411) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!531 (bitStreamReadBitsIntoList!0 (_2!3078 lt!107411) (_1!3077 lt!107406) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!67390 () Bool)

(declare-fun res!55792 () Bool)

(assert (=> b!67390 (=> res!55792 e!44157)))

(declare-fun length!340 (List!712) Int)

(assert (=> b!67390 (= res!55792 (<= (length!340 lt!107405) 0))))

(declare-fun b!67391 () Bool)

(assert (=> b!67391 (= e!44161 (array_inv!1196 (buf!1707 thiss!1379)))))

(declare-fun b!67392 () Bool)

(assert (=> b!67392 (= e!44163 e!44155)))

(declare-fun res!55787 () Bool)

(assert (=> b!67392 (=> res!55787 e!44155)))

(declare-fun lt!107417 () (_ BitVec 64))

(assert (=> b!67392 (= res!55787 (not (= lt!107417 (bvsub (bvadd lt!107425 to!314) i!635))))))

(assert (=> b!67392 (= lt!107417 (bitIndex!0 (size!1326 (buf!1707 (_2!3078 lt!107418))) (currentByte!3391 (_2!3078 lt!107418)) (currentBit!3386 (_2!3078 lt!107418))))))

(declare-fun b!67393 () Bool)

(declare-fun res!55800 () Bool)

(declare-fun e!44159 () Bool)

(assert (=> b!67393 (=> res!55800 e!44159)))

(declare-fun lt!107413 () Bool)

(assert (=> b!67393 (= res!55800 (not (= (bitAt!0 (buf!1707 (_2!3078 lt!107411)) lt!107425) lt!107413)))))

(declare-fun b!67394 () Bool)

(assert (=> b!67394 (= e!44152 e!44159)))

(declare-fun res!55783 () Bool)

(assert (=> b!67394 (=> res!55783 e!44159)))

(assert (=> b!67394 (= res!55783 (not (= (head!531 (byteArrayBitContentToList!0 (_2!3078 lt!107418) srcBuffer!2 i!635 (bvsub to!314 i!635))) lt!107413)))))

(assert (=> b!67394 (= lt!107413 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun b!67395 () Bool)

(assert (=> b!67395 (= e!44157 e!44164)))

(declare-fun res!55785 () Bool)

(assert (=> b!67395 (=> res!55785 e!44164)))

(declare-fun lt!107409 () List!712)

(assert (=> b!67395 (= res!55785 (not (= lt!107409 lt!107422)))))

(assert (=> b!67395 (= lt!107422 lt!107409)))

(declare-fun tail!316 (List!712) List!712)

(assert (=> b!67395 (= lt!107409 (tail!316 lt!107405))))

(declare-fun lt!107416 () Unit!4537)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2274 BitStream!2274 BitStream!2274 BitStream!2274 (_ BitVec 64) List!712) Unit!4537)

(assert (=> b!67395 (= lt!107416 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3078 lt!107418) (_2!3078 lt!107418) (_1!3077 lt!107404) (_1!3077 lt!107403) (bvsub to!314 i!635) lt!107405))))

(declare-fun b!67396 () Bool)

(assert (=> b!67396 (= e!44155 e!44158)))

(declare-fun res!55793 () Bool)

(assert (=> b!67396 (=> res!55793 e!44158)))

(assert (=> b!67396 (= res!55793 (not (= (size!1326 (buf!1707 (_2!3078 lt!107411))) (size!1326 (buf!1707 (_2!3078 lt!107418))))))))

(declare-fun lt!107410 () (_ BitVec 64))

(assert (=> b!67396 (= lt!107417 lt!107410)))

(declare-fun lt!107420 () (_ BitVec 64))

(assert (=> b!67396 (= lt!107410 (bvsub lt!107420 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!67396 (= lt!107420 (bvsub (bvadd (bitIndex!0 (size!1326 (buf!1707 (_2!3078 lt!107411))) (currentByte!3391 (_2!3078 lt!107411)) (currentBit!3386 (_2!3078 lt!107411))) to!314) i!635))))

(assert (=> b!67396 (= (size!1326 (buf!1707 (_2!3078 lt!107418))) (size!1326 (buf!1707 thiss!1379)))))

(declare-fun b!67397 () Bool)

(declare-fun res!55795 () Bool)

(assert (=> b!67397 (=> res!55795 e!44155)))

(assert (=> b!67397 (= res!55795 (not (invariant!0 (currentBit!3386 (_2!3078 lt!107418)) (currentByte!3391 (_2!3078 lt!107418)) (size!1326 (buf!1707 (_2!3078 lt!107418))))))))

(declare-fun b!67398 () Bool)

(declare-fun lt!107415 () (_ BitVec 64))

(assert (=> b!67398 (= e!44159 (or (= lt!107415 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!107415 (bvand lt!107410 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!67398 (= lt!107415 (bvand lt!107420 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!67399 () Bool)

(assert (=> b!67399 (= e!44153 e!44162)))

(declare-fun res!55788 () Bool)

(assert (=> b!67399 (=> res!55788 e!44162)))

(assert (=> b!67399 (= res!55788 (not (isPrefixOf!0 thiss!1379 (_2!3078 lt!107411))))))

(assert (=> b!67399 (validate_offset_bits!1 ((_ sign_extend 32) (size!1326 (buf!1707 (_2!3078 lt!107411)))) ((_ sign_extend 32) (currentByte!3391 (_2!3078 lt!107411))) ((_ sign_extend 32) (currentBit!3386 (_2!3078 lt!107411))) lt!107424)))

(assert (=> b!67399 (= lt!107424 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!107414 () Unit!4537)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2274 BitStream!2274 (_ BitVec 64) (_ BitVec 64)) Unit!4537)

(assert (=> b!67399 (= lt!107414 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3078 lt!107411) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2274 (_ BitVec 8) (_ BitVec 32)) tuple2!5934)

(assert (=> b!67399 (= lt!107411 (appendBitFromByte!0 thiss!1379 (select (arr!1896 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (= (and start!13136 res!55798) b!67381))

(assert (= (and b!67381 res!55790) b!67380))

(assert (= (and b!67380 (not res!55794)) b!67399))

(assert (= (and b!67399 (not res!55788)) b!67387))

(assert (= (and b!67387 res!55791) b!67389))

(assert (= (and b!67387 (not res!55784)) b!67392))

(assert (= (and b!67392 (not res!55787)) b!67397))

(assert (= (and b!67397 (not res!55795)) b!67385))

(assert (= (and b!67385 (not res!55797)) b!67396))

(assert (= (and b!67396 (not res!55793)) b!67384))

(assert (= (and b!67384 (not res!55782)) b!67386))

(assert (= (and b!67386 (not res!55796)) b!67388))

(assert (= (and b!67388 (not res!55789)) b!67390))

(assert (= (and b!67390 (not res!55792)) b!67395))

(assert (= (and b!67395 (not res!55785)) b!67383))

(assert (= (and b!67383 (not res!55799)) b!67382))

(assert (= (and b!67382 (not res!55786)) b!67394))

(assert (= (and b!67394 (not res!55783)) b!67393))

(assert (= (and b!67393 (not res!55800)) b!67398))

(assert (= start!13136 b!67391))

(declare-fun m!107313 () Bool)

(assert (=> b!67392 m!107313))

(declare-fun m!107315 () Bool)

(assert (=> b!67387 m!107315))

(declare-fun m!107317 () Bool)

(assert (=> b!67387 m!107317))

(declare-fun m!107319 () Bool)

(assert (=> b!67387 m!107319))

(declare-fun m!107321 () Bool)

(assert (=> b!67387 m!107321))

(declare-fun m!107323 () Bool)

(assert (=> b!67387 m!107323))

(declare-fun m!107325 () Bool)

(assert (=> b!67387 m!107325))

(declare-fun m!107327 () Bool)

(assert (=> b!67387 m!107327))

(declare-fun m!107329 () Bool)

(assert (=> b!67381 m!107329))

(declare-fun m!107331 () Bool)

(assert (=> b!67380 m!107331))

(declare-fun m!107333 () Bool)

(assert (=> b!67380 m!107333))

(declare-fun m!107335 () Bool)

(assert (=> b!67380 m!107335))

(declare-fun m!107337 () Bool)

(assert (=> b!67386 m!107337))

(declare-fun m!107339 () Bool)

(assert (=> start!13136 m!107339))

(declare-fun m!107341 () Bool)

(assert (=> start!13136 m!107341))

(declare-fun m!107343 () Bool)

(assert (=> b!67384 m!107343))

(declare-fun m!107345 () Bool)

(assert (=> b!67390 m!107345))

(declare-fun m!107347 () Bool)

(assert (=> b!67399 m!107347))

(declare-fun m!107349 () Bool)

(assert (=> b!67399 m!107349))

(declare-fun m!107351 () Bool)

(assert (=> b!67399 m!107351))

(assert (=> b!67399 m!107347))

(declare-fun m!107353 () Bool)

(assert (=> b!67399 m!107353))

(declare-fun m!107355 () Bool)

(assert (=> b!67399 m!107355))

(declare-fun m!107357 () Bool)

(assert (=> b!67388 m!107357))

(declare-fun m!107359 () Bool)

(assert (=> b!67388 m!107359))

(declare-fun m!107361 () Bool)

(assert (=> b!67388 m!107361))

(declare-fun m!107363 () Bool)

(assert (=> b!67388 m!107363))

(declare-fun m!107365 () Bool)

(assert (=> b!67388 m!107365))

(declare-fun m!107367 () Bool)

(assert (=> b!67388 m!107367))

(declare-fun m!107369 () Bool)

(assert (=> b!67388 m!107369))

(declare-fun m!107371 () Bool)

(assert (=> b!67388 m!107371))

(declare-fun m!107373 () Bool)

(assert (=> b!67382 m!107373))

(declare-fun m!107375 () Bool)

(assert (=> b!67395 m!107375))

(declare-fun m!107377 () Bool)

(assert (=> b!67395 m!107377))

(declare-fun m!107379 () Bool)

(assert (=> b!67397 m!107379))

(declare-fun m!107381 () Bool)

(assert (=> b!67393 m!107381))

(declare-fun m!107383 () Bool)

(assert (=> b!67383 m!107383))

(declare-fun m!107385 () Bool)

(assert (=> b!67383 m!107385))

(declare-fun m!107387 () Bool)

(assert (=> b!67396 m!107387))

(declare-fun m!107389 () Bool)

(assert (=> b!67391 m!107389))

(declare-fun m!107391 () Bool)

(assert (=> b!67389 m!107391))

(assert (=> b!67389 m!107391))

(declare-fun m!107393 () Bool)

(assert (=> b!67389 m!107393))

(declare-fun m!107395 () Bool)

(assert (=> b!67389 m!107395))

(assert (=> b!67389 m!107395))

(declare-fun m!107397 () Bool)

(assert (=> b!67389 m!107397))

(declare-fun m!107399 () Bool)

(assert (=> b!67394 m!107399))

(assert (=> b!67394 m!107399))

(declare-fun m!107401 () Bool)

(assert (=> b!67394 m!107401))

(declare-fun m!107403 () Bool)

(assert (=> b!67394 m!107403))

(check-sat (not start!13136) (not b!67389) (not b!67386) (not b!67388) (not b!67396) (not b!67381) (not b!67397) (not b!67391) (not b!67394) (not b!67395) (not b!67390) (not b!67380) (not b!67392) (not b!67387) (not b!67382) (not b!67384) (not b!67383) (not b!67399) (not b!67393))
(check-sat)
(get-model)

(declare-fun d!21298 () Bool)

(assert (=> d!21298 (= (tail!316 lt!107405) (t!1462 lt!107405))))

(assert (=> b!67395 d!21298))

(declare-fun d!21300 () Bool)

(declare-fun e!44210 () Bool)

(assert (=> d!21300 e!44210))

(declare-fun res!55860 () Bool)

(assert (=> d!21300 (=> (not res!55860) (not e!44210))))

(declare-fun lt!107500 () (_ BitVec 64))

(assert (=> d!21300 (= res!55860 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!107500 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!107500) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!21300 (= lt!107500 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!107499 () Unit!4537)

(declare-fun choose!42 (BitStream!2274 BitStream!2274 BitStream!2274 BitStream!2274 (_ BitVec 64) List!712) Unit!4537)

(assert (=> d!21300 (= lt!107499 (choose!42 (_2!3078 lt!107418) (_2!3078 lt!107418) (_1!3077 lt!107404) (_1!3077 lt!107403) (bvsub to!314 i!635) lt!107405))))

(assert (=> d!21300 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!21300 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3078 lt!107418) (_2!3078 lt!107418) (_1!3077 lt!107404) (_1!3077 lt!107403) (bvsub to!314 i!635) lt!107405) lt!107499)))

(declare-fun b!67462 () Bool)

(assert (=> b!67462 (= e!44210 (= (bitStreamReadBitsIntoList!0 (_2!3078 lt!107418) (_1!3077 lt!107403) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!316 lt!107405)))))

(assert (= (and d!21300 res!55860) b!67462))

(declare-fun m!107497 () Bool)

(assert (=> d!21300 m!107497))

(declare-fun m!107499 () Bool)

(assert (=> b!67462 m!107499))

(assert (=> b!67462 m!107375))

(assert (=> b!67395 d!21300))

(declare-fun d!21302 () Bool)

(assert (=> d!21302 (= (array_inv!1196 srcBuffer!2) (bvsge (size!1326 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!13136 d!21302))

(declare-fun d!21304 () Bool)

(assert (=> d!21304 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3386 thiss!1379) (currentByte!3391 thiss!1379) (size!1326 (buf!1707 thiss!1379))))))

(declare-fun bs!5163 () Bool)

(assert (= bs!5163 d!21304))

(declare-fun m!107501 () Bool)

(assert (=> bs!5163 m!107501))

(assert (=> start!13136 d!21304))

(declare-fun d!21306 () Bool)

(declare-fun e!44213 () Bool)

(assert (=> d!21306 e!44213))

(declare-fun res!55866 () Bool)

(assert (=> d!21306 (=> (not res!55866) (not e!44213))))

(declare-fun lt!107513 () (_ BitVec 64))

(declare-fun lt!107514 () (_ BitVec 64))

(declare-fun lt!107518 () (_ BitVec 64))

(assert (=> d!21306 (= res!55866 (= lt!107514 (bvsub lt!107518 lt!107513)))))

(assert (=> d!21306 (or (= (bvand lt!107518 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!107513 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!107518 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!107518 lt!107513) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!21306 (= lt!107513 (remainingBits!0 ((_ sign_extend 32) (size!1326 (buf!1707 (_2!3078 lt!107411)))) ((_ sign_extend 32) (currentByte!3391 (_2!3078 lt!107411))) ((_ sign_extend 32) (currentBit!3386 (_2!3078 lt!107411)))))))

(declare-fun lt!107515 () (_ BitVec 64))

(declare-fun lt!107517 () (_ BitVec 64))

(assert (=> d!21306 (= lt!107518 (bvmul lt!107515 lt!107517))))

(assert (=> d!21306 (or (= lt!107515 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!107517 (bvsdiv (bvmul lt!107515 lt!107517) lt!107515)))))

(assert (=> d!21306 (= lt!107517 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!21306 (= lt!107515 ((_ sign_extend 32) (size!1326 (buf!1707 (_2!3078 lt!107411)))))))

(assert (=> d!21306 (= lt!107514 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3391 (_2!3078 lt!107411))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3386 (_2!3078 lt!107411)))))))

(assert (=> d!21306 (invariant!0 (currentBit!3386 (_2!3078 lt!107411)) (currentByte!3391 (_2!3078 lt!107411)) (size!1326 (buf!1707 (_2!3078 lt!107411))))))

(assert (=> d!21306 (= (bitIndex!0 (size!1326 (buf!1707 (_2!3078 lt!107411))) (currentByte!3391 (_2!3078 lt!107411)) (currentBit!3386 (_2!3078 lt!107411))) lt!107514)))

(declare-fun b!67467 () Bool)

(declare-fun res!55865 () Bool)

(assert (=> b!67467 (=> (not res!55865) (not e!44213))))

(assert (=> b!67467 (= res!55865 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!107514))))

(declare-fun b!67468 () Bool)

(declare-fun lt!107516 () (_ BitVec 64))

(assert (=> b!67468 (= e!44213 (bvsle lt!107514 (bvmul lt!107516 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!67468 (or (= lt!107516 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!107516 #b0000000000000000000000000000000000000000000000000000000000001000) lt!107516)))))

(assert (=> b!67468 (= lt!107516 ((_ sign_extend 32) (size!1326 (buf!1707 (_2!3078 lt!107411)))))))

(assert (= (and d!21306 res!55866) b!67467))

(assert (= (and b!67467 res!55865) b!67468))

(declare-fun m!107503 () Bool)

(assert (=> d!21306 m!107503))

(assert (=> d!21306 m!107343))

(assert (=> b!67396 d!21306))

(declare-fun d!21308 () Bool)

(assert (=> d!21308 (= (invariant!0 (currentBit!3386 (_2!3078 lt!107411)) (currentByte!3391 (_2!3078 lt!107411)) (size!1326 (buf!1707 (_2!3078 lt!107418)))) (and (bvsge (currentBit!3386 (_2!3078 lt!107411)) #b00000000000000000000000000000000) (bvslt (currentBit!3386 (_2!3078 lt!107411)) #b00000000000000000000000000001000) (bvsge (currentByte!3391 (_2!3078 lt!107411)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3391 (_2!3078 lt!107411)) (size!1326 (buf!1707 (_2!3078 lt!107418)))) (and (= (currentBit!3386 (_2!3078 lt!107411)) #b00000000000000000000000000000000) (= (currentByte!3391 (_2!3078 lt!107411)) (size!1326 (buf!1707 (_2!3078 lt!107418))))))))))

(assert (=> b!67386 d!21308))

(declare-fun d!21310 () Bool)

(assert (=> d!21310 (= (invariant!0 (currentBit!3386 (_2!3078 lt!107418)) (currentByte!3391 (_2!3078 lt!107418)) (size!1326 (buf!1707 (_2!3078 lt!107418)))) (and (bvsge (currentBit!3386 (_2!3078 lt!107418)) #b00000000000000000000000000000000) (bvslt (currentBit!3386 (_2!3078 lt!107418)) #b00000000000000000000000000001000) (bvsge (currentByte!3391 (_2!3078 lt!107418)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3391 (_2!3078 lt!107418)) (size!1326 (buf!1707 (_2!3078 lt!107418)))) (and (= (currentBit!3386 (_2!3078 lt!107418)) #b00000000000000000000000000000000) (= (currentByte!3391 (_2!3078 lt!107418)) (size!1326 (buf!1707 (_2!3078 lt!107418))))))))))

(assert (=> b!67397 d!21310))

(declare-fun d!21312 () Bool)

(assert (=> d!21312 (= (head!531 lt!107405) (h!827 lt!107405))))

(assert (=> b!67382 d!21312))

(declare-fun d!21314 () Bool)

(assert (=> d!21314 (= (bitAt!0 (buf!1707 (_2!3078 lt!107411)) lt!107425) (not (= (bvand ((_ sign_extend 24) (select (arr!1896 (buf!1707 (_2!3078 lt!107411))) ((_ extract 31 0) (bvsdiv lt!107425 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!107425 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5164 () Bool)

(assert (= bs!5164 d!21314))

(declare-fun m!107505 () Bool)

(assert (=> bs!5164 m!107505))

(declare-fun m!107507 () Bool)

(assert (=> bs!5164 m!107507))

(assert (=> b!67393 d!21314))

(declare-fun d!21316 () Bool)

(assert (=> d!21316 (= (bitAt!0 (buf!1707 (_1!3077 lt!107403)) lt!107425) (not (= (bvand ((_ sign_extend 24) (select (arr!1896 (buf!1707 (_1!3077 lt!107403))) ((_ extract 31 0) (bvsdiv lt!107425 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!107425 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5165 () Bool)

(assert (= bs!5165 d!21316))

(declare-fun m!107509 () Bool)

(assert (=> bs!5165 m!107509))

(assert (=> bs!5165 m!107507))

(assert (=> b!67383 d!21316))

(declare-fun d!21318 () Bool)

(assert (=> d!21318 (= (bitAt!0 (buf!1707 (_1!3077 lt!107404)) lt!107425) (not (= (bvand ((_ sign_extend 24) (select (arr!1896 (buf!1707 (_1!3077 lt!107404))) ((_ extract 31 0) (bvsdiv lt!107425 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!107425 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5166 () Bool)

(assert (= bs!5166 d!21318))

(declare-fun m!107511 () Bool)

(assert (=> bs!5166 m!107511))

(assert (=> bs!5166 m!107507))

(assert (=> b!67383 d!21318))

(declare-fun d!21320 () Bool)

(assert (=> d!21320 (= (head!531 (byteArrayBitContentToList!0 (_2!3078 lt!107418) srcBuffer!2 i!635 (bvsub to!314 i!635))) (h!827 (byteArrayBitContentToList!0 (_2!3078 lt!107418) srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(assert (=> b!67394 d!21320))

(declare-fun d!21322 () Bool)

(declare-fun c!4929 () Bool)

(assert (=> d!21322 (= c!4929 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!44216 () List!712)

(assert (=> d!21322 (= (byteArrayBitContentToList!0 (_2!3078 lt!107418) srcBuffer!2 i!635 (bvsub to!314 i!635)) e!44216)))

(declare-fun b!67473 () Bool)

(assert (=> b!67473 (= e!44216 Nil!709)))

(declare-fun b!67474 () Bool)

(assert (=> b!67474 (= e!44216 (Cons!708 (not (= (bvand ((_ sign_extend 24) (select (arr!1896 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!3078 lt!107418) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!21322 c!4929) b!67473))

(assert (= (and d!21322 (not c!4929)) b!67474))

(assert (=> b!67474 m!107347))

(declare-fun m!107513 () Bool)

(assert (=> b!67474 m!107513))

(declare-fun m!107515 () Bool)

(assert (=> b!67474 m!107515))

(assert (=> b!67394 d!21322))

(declare-fun d!21324 () Bool)

(assert (=> d!21324 (= (bitAt!0 srcBuffer!2 i!635) (not (= (bvand ((_ sign_extend 24) (select (arr!1896 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5167 () Bool)

(assert (= bs!5167 d!21324))

(assert (=> bs!5167 m!107347))

(assert (=> bs!5167 m!107513))

(assert (=> b!67394 d!21324))

(declare-fun d!21326 () Bool)

(assert (=> d!21326 (= (invariant!0 (currentBit!3386 (_2!3078 lt!107411)) (currentByte!3391 (_2!3078 lt!107411)) (size!1326 (buf!1707 (_2!3078 lt!107411)))) (and (bvsge (currentBit!3386 (_2!3078 lt!107411)) #b00000000000000000000000000000000) (bvslt (currentBit!3386 (_2!3078 lt!107411)) #b00000000000000000000000000001000) (bvsge (currentByte!3391 (_2!3078 lt!107411)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3391 (_2!3078 lt!107411)) (size!1326 (buf!1707 (_2!3078 lt!107411)))) (and (= (currentBit!3386 (_2!3078 lt!107411)) #b00000000000000000000000000000000) (= (currentByte!3391 (_2!3078 lt!107411)) (size!1326 (buf!1707 (_2!3078 lt!107411))))))))))

(assert (=> b!67384 d!21326))

(declare-fun d!21328 () Bool)

(declare-fun size!1328 (List!712) Int)

(assert (=> d!21328 (= (length!340 lt!107405) (size!1328 lt!107405))))

(declare-fun bs!5168 () Bool)

(assert (= bs!5168 d!21328))

(declare-fun m!107517 () Bool)

(assert (=> bs!5168 m!107517))

(assert (=> b!67390 d!21328))

(declare-fun d!21330 () Bool)

(declare-fun res!55874 () Bool)

(declare-fun e!44221 () Bool)

(assert (=> d!21330 (=> (not res!55874) (not e!44221))))

(assert (=> d!21330 (= res!55874 (= (size!1326 (buf!1707 thiss!1379)) (size!1326 (buf!1707 thiss!1379))))))

(assert (=> d!21330 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!44221)))

(declare-fun b!67481 () Bool)

(declare-fun res!55875 () Bool)

(assert (=> b!67481 (=> (not res!55875) (not e!44221))))

(assert (=> b!67481 (= res!55875 (bvsle (bitIndex!0 (size!1326 (buf!1707 thiss!1379)) (currentByte!3391 thiss!1379) (currentBit!3386 thiss!1379)) (bitIndex!0 (size!1326 (buf!1707 thiss!1379)) (currentByte!3391 thiss!1379) (currentBit!3386 thiss!1379))))))

(declare-fun b!67482 () Bool)

(declare-fun e!44222 () Bool)

(assert (=> b!67482 (= e!44221 e!44222)))

(declare-fun res!55873 () Bool)

(assert (=> b!67482 (=> res!55873 e!44222)))

(assert (=> b!67482 (= res!55873 (= (size!1326 (buf!1707 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!67483 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2868 array!2868 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!67483 (= e!44222 (arrayBitRangesEq!0 (buf!1707 thiss!1379) (buf!1707 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1326 (buf!1707 thiss!1379)) (currentByte!3391 thiss!1379) (currentBit!3386 thiss!1379))))))

(assert (= (and d!21330 res!55874) b!67481))

(assert (= (and b!67481 res!55875) b!67482))

(assert (= (and b!67482 (not res!55873)) b!67483))

(assert (=> b!67481 m!107335))

(assert (=> b!67481 m!107335))

(assert (=> b!67483 m!107335))

(assert (=> b!67483 m!107335))

(declare-fun m!107519 () Bool)

(assert (=> b!67483 m!107519))

(assert (=> b!67380 d!21330))

(declare-fun d!21332 () Bool)

(assert (=> d!21332 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!107521 () Unit!4537)

(declare-fun choose!11 (BitStream!2274) Unit!4537)

(assert (=> d!21332 (= lt!107521 (choose!11 thiss!1379))))

(assert (=> d!21332 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!107521)))

(declare-fun bs!5170 () Bool)

(assert (= bs!5170 d!21332))

(assert (=> bs!5170 m!107331))

(declare-fun m!107521 () Bool)

(assert (=> bs!5170 m!107521))

(assert (=> b!67380 d!21332))

(declare-fun d!21334 () Bool)

(declare-fun e!44223 () Bool)

(assert (=> d!21334 e!44223))

(declare-fun res!55877 () Bool)

(assert (=> d!21334 (=> (not res!55877) (not e!44223))))

(declare-fun lt!107523 () (_ BitVec 64))

(declare-fun lt!107527 () (_ BitVec 64))

(declare-fun lt!107522 () (_ BitVec 64))

(assert (=> d!21334 (= res!55877 (= lt!107523 (bvsub lt!107527 lt!107522)))))

(assert (=> d!21334 (or (= (bvand lt!107527 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!107522 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!107527 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!107527 lt!107522) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!21334 (= lt!107522 (remainingBits!0 ((_ sign_extend 32) (size!1326 (buf!1707 thiss!1379))) ((_ sign_extend 32) (currentByte!3391 thiss!1379)) ((_ sign_extend 32) (currentBit!3386 thiss!1379))))))

(declare-fun lt!107524 () (_ BitVec 64))

(declare-fun lt!107526 () (_ BitVec 64))

(assert (=> d!21334 (= lt!107527 (bvmul lt!107524 lt!107526))))

(assert (=> d!21334 (or (= lt!107524 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!107526 (bvsdiv (bvmul lt!107524 lt!107526) lt!107524)))))

(assert (=> d!21334 (= lt!107526 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!21334 (= lt!107524 ((_ sign_extend 32) (size!1326 (buf!1707 thiss!1379))))))

(assert (=> d!21334 (= lt!107523 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3391 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3386 thiss!1379))))))

(assert (=> d!21334 (invariant!0 (currentBit!3386 thiss!1379) (currentByte!3391 thiss!1379) (size!1326 (buf!1707 thiss!1379)))))

(assert (=> d!21334 (= (bitIndex!0 (size!1326 (buf!1707 thiss!1379)) (currentByte!3391 thiss!1379) (currentBit!3386 thiss!1379)) lt!107523)))

(declare-fun b!67484 () Bool)

(declare-fun res!55876 () Bool)

(assert (=> b!67484 (=> (not res!55876) (not e!44223))))

(assert (=> b!67484 (= res!55876 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!107523))))

(declare-fun b!67485 () Bool)

(declare-fun lt!107525 () (_ BitVec 64))

(assert (=> b!67485 (= e!44223 (bvsle lt!107523 (bvmul lt!107525 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!67485 (or (= lt!107525 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!107525 #b0000000000000000000000000000000000000000000000000000000000001000) lt!107525)))))

(assert (=> b!67485 (= lt!107525 ((_ sign_extend 32) (size!1326 (buf!1707 thiss!1379))))))

(assert (= (and d!21334 res!55877) b!67484))

(assert (= (and b!67484 res!55876) b!67485))

(declare-fun m!107523 () Bool)

(assert (=> d!21334 m!107523))

(assert (=> d!21334 m!107501))

(assert (=> b!67380 d!21334))

(declare-fun d!21336 () Bool)

(assert (=> d!21336 (= (array_inv!1196 (buf!1707 thiss!1379)) (bvsge (size!1326 (buf!1707 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!67391 d!21336))

(declare-fun d!21338 () Bool)

(assert (=> d!21338 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1326 (buf!1707 thiss!1379))) ((_ sign_extend 32) (currentByte!3391 thiss!1379)) ((_ sign_extend 32) (currentBit!3386 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1326 (buf!1707 thiss!1379))) ((_ sign_extend 32) (currentByte!3391 thiss!1379)) ((_ sign_extend 32) (currentBit!3386 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5171 () Bool)

(assert (= bs!5171 d!21338))

(assert (=> bs!5171 m!107523))

(assert (=> b!67381 d!21338))

(declare-fun d!21340 () Bool)

(declare-fun e!44224 () Bool)

(assert (=> d!21340 e!44224))

(declare-fun res!55879 () Bool)

(assert (=> d!21340 (=> (not res!55879) (not e!44224))))

(declare-fun lt!107533 () (_ BitVec 64))

(declare-fun lt!107529 () (_ BitVec 64))

(declare-fun lt!107528 () (_ BitVec 64))

(assert (=> d!21340 (= res!55879 (= lt!107529 (bvsub lt!107533 lt!107528)))))

(assert (=> d!21340 (or (= (bvand lt!107533 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!107528 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!107533 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!107533 lt!107528) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!21340 (= lt!107528 (remainingBits!0 ((_ sign_extend 32) (size!1326 (buf!1707 (_2!3078 lt!107418)))) ((_ sign_extend 32) (currentByte!3391 (_2!3078 lt!107418))) ((_ sign_extend 32) (currentBit!3386 (_2!3078 lt!107418)))))))

(declare-fun lt!107530 () (_ BitVec 64))

(declare-fun lt!107532 () (_ BitVec 64))

(assert (=> d!21340 (= lt!107533 (bvmul lt!107530 lt!107532))))

(assert (=> d!21340 (or (= lt!107530 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!107532 (bvsdiv (bvmul lt!107530 lt!107532) lt!107530)))))

(assert (=> d!21340 (= lt!107532 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!21340 (= lt!107530 ((_ sign_extend 32) (size!1326 (buf!1707 (_2!3078 lt!107418)))))))

(assert (=> d!21340 (= lt!107529 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3391 (_2!3078 lt!107418))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3386 (_2!3078 lt!107418)))))))

(assert (=> d!21340 (invariant!0 (currentBit!3386 (_2!3078 lt!107418)) (currentByte!3391 (_2!3078 lt!107418)) (size!1326 (buf!1707 (_2!3078 lt!107418))))))

(assert (=> d!21340 (= (bitIndex!0 (size!1326 (buf!1707 (_2!3078 lt!107418))) (currentByte!3391 (_2!3078 lt!107418)) (currentBit!3386 (_2!3078 lt!107418))) lt!107529)))

(declare-fun b!67486 () Bool)

(declare-fun res!55878 () Bool)

(assert (=> b!67486 (=> (not res!55878) (not e!44224))))

(assert (=> b!67486 (= res!55878 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!107529))))

(declare-fun b!67487 () Bool)

(declare-fun lt!107531 () (_ BitVec 64))

(assert (=> b!67487 (= e!44224 (bvsle lt!107529 (bvmul lt!107531 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!67487 (or (= lt!107531 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!107531 #b0000000000000000000000000000000000000000000000000000000000001000) lt!107531)))))

(assert (=> b!67487 (= lt!107531 ((_ sign_extend 32) (size!1326 (buf!1707 (_2!3078 lt!107418)))))))

(assert (= (and d!21340 res!55879) b!67486))

(assert (= (and b!67486 res!55878) b!67487))

(declare-fun m!107525 () Bool)

(assert (=> d!21340 m!107525))

(assert (=> d!21340 m!107379))

(assert (=> b!67392 d!21340))

(declare-fun d!21342 () Bool)

(declare-fun res!55881 () Bool)

(declare-fun e!44225 () Bool)

(assert (=> d!21342 (=> (not res!55881) (not e!44225))))

(assert (=> d!21342 (= res!55881 (= (size!1326 (buf!1707 thiss!1379)) (size!1326 (buf!1707 (_2!3078 lt!107418)))))))

(assert (=> d!21342 (= (isPrefixOf!0 thiss!1379 (_2!3078 lt!107418)) e!44225)))

(declare-fun b!67488 () Bool)

(declare-fun res!55882 () Bool)

(assert (=> b!67488 (=> (not res!55882) (not e!44225))))

(assert (=> b!67488 (= res!55882 (bvsle (bitIndex!0 (size!1326 (buf!1707 thiss!1379)) (currentByte!3391 thiss!1379) (currentBit!3386 thiss!1379)) (bitIndex!0 (size!1326 (buf!1707 (_2!3078 lt!107418))) (currentByte!3391 (_2!3078 lt!107418)) (currentBit!3386 (_2!3078 lt!107418)))))))

(declare-fun b!67489 () Bool)

(declare-fun e!44226 () Bool)

(assert (=> b!67489 (= e!44225 e!44226)))

(declare-fun res!55880 () Bool)

(assert (=> b!67489 (=> res!55880 e!44226)))

(assert (=> b!67489 (= res!55880 (= (size!1326 (buf!1707 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!67490 () Bool)

(assert (=> b!67490 (= e!44226 (arrayBitRangesEq!0 (buf!1707 thiss!1379) (buf!1707 (_2!3078 lt!107418)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1326 (buf!1707 thiss!1379)) (currentByte!3391 thiss!1379) (currentBit!3386 thiss!1379))))))

(assert (= (and d!21342 res!55881) b!67488))

(assert (= (and b!67488 res!55882) b!67489))

(assert (= (and b!67489 (not res!55880)) b!67490))

(assert (=> b!67488 m!107335))

(assert (=> b!67488 m!107313))

(assert (=> b!67490 m!107335))

(assert (=> b!67490 m!107335))

(declare-fun m!107527 () Bool)

(assert (=> b!67490 m!107527))

(assert (=> b!67387 d!21342))

(declare-fun d!21344 () Bool)

(assert (=> d!21344 (isPrefixOf!0 thiss!1379 (_2!3078 lt!107418))))

(declare-fun lt!107536 () Unit!4537)

(declare-fun choose!30 (BitStream!2274 BitStream!2274 BitStream!2274) Unit!4537)

(assert (=> d!21344 (= lt!107536 (choose!30 thiss!1379 (_2!3078 lt!107411) (_2!3078 lt!107418)))))

(assert (=> d!21344 (isPrefixOf!0 thiss!1379 (_2!3078 lt!107411))))

(assert (=> d!21344 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3078 lt!107411) (_2!3078 lt!107418)) lt!107536)))

(declare-fun bs!5172 () Bool)

(assert (= bs!5172 d!21344))

(assert (=> bs!5172 m!107315))

(declare-fun m!107529 () Bool)

(assert (=> bs!5172 m!107529))

(assert (=> bs!5172 m!107355))

(assert (=> b!67387 d!21344))

(declare-fun d!21346 () Bool)

(declare-fun res!55884 () Bool)

(declare-fun e!44227 () Bool)

(assert (=> d!21346 (=> (not res!55884) (not e!44227))))

(assert (=> d!21346 (= res!55884 (= (size!1326 (buf!1707 (_2!3078 lt!107411))) (size!1326 (buf!1707 (_2!3078 lt!107418)))))))

(assert (=> d!21346 (= (isPrefixOf!0 (_2!3078 lt!107411) (_2!3078 lt!107418)) e!44227)))

(declare-fun b!67491 () Bool)

(declare-fun res!55885 () Bool)

(assert (=> b!67491 (=> (not res!55885) (not e!44227))))

(assert (=> b!67491 (= res!55885 (bvsle (bitIndex!0 (size!1326 (buf!1707 (_2!3078 lt!107411))) (currentByte!3391 (_2!3078 lt!107411)) (currentBit!3386 (_2!3078 lt!107411))) (bitIndex!0 (size!1326 (buf!1707 (_2!3078 lt!107418))) (currentByte!3391 (_2!3078 lt!107418)) (currentBit!3386 (_2!3078 lt!107418)))))))

(declare-fun b!67492 () Bool)

(declare-fun e!44228 () Bool)

(assert (=> b!67492 (= e!44227 e!44228)))

(declare-fun res!55883 () Bool)

(assert (=> b!67492 (=> res!55883 e!44228)))

(assert (=> b!67492 (= res!55883 (= (size!1326 (buf!1707 (_2!3078 lt!107411))) #b00000000000000000000000000000000))))

(declare-fun b!67493 () Bool)

(assert (=> b!67493 (= e!44228 (arrayBitRangesEq!0 (buf!1707 (_2!3078 lt!107411)) (buf!1707 (_2!3078 lt!107418)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1326 (buf!1707 (_2!3078 lt!107411))) (currentByte!3391 (_2!3078 lt!107411)) (currentBit!3386 (_2!3078 lt!107411)))))))

(assert (= (and d!21346 res!55884) b!67491))

(assert (= (and b!67491 res!55885) b!67492))

(assert (= (and b!67492 (not res!55883)) b!67493))

(assert (=> b!67491 m!107387))

(assert (=> b!67491 m!107313))

(assert (=> b!67493 m!107387))

(assert (=> b!67493 m!107387))

(declare-fun m!107531 () Bool)

(assert (=> b!67493 m!107531))

(assert (=> b!67387 d!21346))

(declare-fun b!67631 () Bool)

(declare-fun e!44298 () Bool)

(declare-fun lt!107859 () (_ BitVec 64))

(assert (=> b!67631 (= e!44298 (validate_offset_bits!1 ((_ sign_extend 32) (size!1326 (buf!1707 (_2!3078 lt!107411)))) ((_ sign_extend 32) (currentByte!3391 (_2!3078 lt!107411))) ((_ sign_extend 32) (currentBit!3386 (_2!3078 lt!107411))) lt!107859))))

(declare-fun b!67632 () Bool)

(declare-fun e!44300 () tuple2!5934)

(declare-fun Unit!4541 () Unit!4537)

(assert (=> b!67632 (= e!44300 (tuple2!5935 Unit!4541 (_2!3078 lt!107411)))))

(assert (=> b!67632 (= (size!1326 (buf!1707 (_2!3078 lt!107411))) (size!1326 (buf!1707 (_2!3078 lt!107411))))))

(declare-fun lt!107851 () Unit!4537)

(declare-fun Unit!4542 () Unit!4537)

(assert (=> b!67632 (= lt!107851 Unit!4542)))

(declare-fun call!865 () tuple2!5932)

(declare-fun checkByteArrayBitContent!0 (BitStream!2274 array!2868 array!2868 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!5940 0))(
  ( (tuple2!5941 (_1!3081 array!2868) (_2!3081 BitStream!2274)) )
))
(declare-fun readBits!0 (BitStream!2274 (_ BitVec 64)) tuple2!5940)

(assert (=> b!67632 (checkByteArrayBitContent!0 (_2!3078 lt!107411) srcBuffer!2 (_1!3081 (readBits!0 (_1!3077 call!865) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!107843 () tuple2!5934)

(declare-fun c!4951 () Bool)

(declare-fun bm!862 () Bool)

(assert (=> bm!862 (= call!865 (reader!0 (_2!3078 lt!107411) (ite c!4951 (_2!3078 lt!107843) (_2!3078 lt!107411))))))

(declare-fun b!67633 () Bool)

(declare-fun res!55982 () Bool)

(declare-fun e!44299 () Bool)

(assert (=> b!67633 (=> (not res!55982) (not e!44299))))

(declare-fun lt!107869 () tuple2!5934)

(assert (=> b!67633 (= res!55982 (= (size!1326 (buf!1707 (_2!3078 lt!107869))) (size!1326 (buf!1707 (_2!3078 lt!107411)))))))

(declare-fun b!67634 () Bool)

(declare-fun res!55983 () Bool)

(assert (=> b!67634 (=> (not res!55983) (not e!44299))))

(assert (=> b!67634 (= res!55983 (= (size!1326 (buf!1707 (_2!3078 lt!107411))) (size!1326 (buf!1707 (_2!3078 lt!107869)))))))

(declare-fun b!67636 () Bool)

(declare-fun res!55980 () Bool)

(assert (=> b!67636 (=> (not res!55980) (not e!44299))))

(assert (=> b!67636 (= res!55980 (invariant!0 (currentBit!3386 (_2!3078 lt!107869)) (currentByte!3391 (_2!3078 lt!107869)) (size!1326 (buf!1707 (_2!3078 lt!107869)))))))

(declare-fun b!67637 () Bool)

(declare-fun res!55981 () Bool)

(assert (=> b!67637 (=> (not res!55981) (not e!44299))))

(assert (=> b!67637 (= res!55981 (isPrefixOf!0 (_2!3078 lt!107411) (_2!3078 lt!107869)))))

(declare-fun b!67638 () Bool)

(declare-fun lt!107841 () tuple2!5932)

(assert (=> b!67638 (= e!44299 (= (bitStreamReadBitsIntoList!0 (_2!3078 lt!107869) (_1!3077 lt!107841) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!3078 lt!107869) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!67638 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!67638 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!107839 () Unit!4537)

(declare-fun lt!107875 () Unit!4537)

(assert (=> b!67638 (= lt!107839 lt!107875)))

(assert (=> b!67638 (validate_offset_bits!1 ((_ sign_extend 32) (size!1326 (buf!1707 (_2!3078 lt!107869)))) ((_ sign_extend 32) (currentByte!3391 (_2!3078 lt!107411))) ((_ sign_extend 32) (currentBit!3386 (_2!3078 lt!107411))) lt!107859)))

(assert (=> b!67638 (= lt!107875 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3078 lt!107411) (buf!1707 (_2!3078 lt!107869)) lt!107859))))

(assert (=> b!67638 e!44298))

(declare-fun res!55984 () Bool)

(assert (=> b!67638 (=> (not res!55984) (not e!44298))))

(assert (=> b!67638 (= res!55984 (and (= (size!1326 (buf!1707 (_2!3078 lt!107411))) (size!1326 (buf!1707 (_2!3078 lt!107869)))) (bvsge lt!107859 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!67638 (= lt!107859 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!67638 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!67638 (= lt!107841 (reader!0 (_2!3078 lt!107411) (_2!3078 lt!107869)))))

(declare-fun b!67635 () Bool)

(declare-fun lt!107856 () tuple2!5934)

(declare-fun Unit!4543 () Unit!4537)

(assert (=> b!67635 (= e!44300 (tuple2!5935 Unit!4543 (_2!3078 lt!107856)))))

(assert (=> b!67635 (= lt!107843 (appendBitFromByte!0 (_2!3078 lt!107411) (select (arr!1896 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!107874 () (_ BitVec 64))

(assert (=> b!67635 (= lt!107874 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!107871 () (_ BitVec 64))

(assert (=> b!67635 (= lt!107871 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!107870 () Unit!4537)

(assert (=> b!67635 (= lt!107870 (validateOffsetBitsIneqLemma!0 (_2!3078 lt!107411) (_2!3078 lt!107843) lt!107874 lt!107871))))

(assert (=> b!67635 (validate_offset_bits!1 ((_ sign_extend 32) (size!1326 (buf!1707 (_2!3078 lt!107843)))) ((_ sign_extend 32) (currentByte!3391 (_2!3078 lt!107843))) ((_ sign_extend 32) (currentBit!3386 (_2!3078 lt!107843))) (bvsub lt!107874 lt!107871))))

(declare-fun lt!107857 () Unit!4537)

(assert (=> b!67635 (= lt!107857 lt!107870)))

(declare-fun lt!107848 () tuple2!5932)

(assert (=> b!67635 (= lt!107848 call!865)))

(declare-fun lt!107846 () (_ BitVec 64))

(assert (=> b!67635 (= lt!107846 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!107849 () Unit!4537)

(assert (=> b!67635 (= lt!107849 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3078 lt!107411) (buf!1707 (_2!3078 lt!107843)) lt!107846))))

(assert (=> b!67635 (validate_offset_bits!1 ((_ sign_extend 32) (size!1326 (buf!1707 (_2!3078 lt!107843)))) ((_ sign_extend 32) (currentByte!3391 (_2!3078 lt!107411))) ((_ sign_extend 32) (currentBit!3386 (_2!3078 lt!107411))) lt!107846)))

(declare-fun lt!107862 () Unit!4537)

(assert (=> b!67635 (= lt!107862 lt!107849)))

(assert (=> b!67635 (= (head!531 (byteArrayBitContentToList!0 (_2!3078 lt!107843) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!531 (bitStreamReadBitsIntoList!0 (_2!3078 lt!107843) (_1!3077 lt!107848) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!107838 () Unit!4537)

(declare-fun Unit!4544 () Unit!4537)

(assert (=> b!67635 (= lt!107838 Unit!4544)))

(assert (=> b!67635 (= lt!107856 (appendBitsMSBFirstLoop!0 (_2!3078 lt!107843) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!107864 () Unit!4537)

(assert (=> b!67635 (= lt!107864 (lemmaIsPrefixTransitive!0 (_2!3078 lt!107411) (_2!3078 lt!107843) (_2!3078 lt!107856)))))

(assert (=> b!67635 (isPrefixOf!0 (_2!3078 lt!107411) (_2!3078 lt!107856))))

(declare-fun lt!107840 () Unit!4537)

(assert (=> b!67635 (= lt!107840 lt!107864)))

(assert (=> b!67635 (= (size!1326 (buf!1707 (_2!3078 lt!107856))) (size!1326 (buf!1707 (_2!3078 lt!107411))))))

(declare-fun lt!107855 () Unit!4537)

(declare-fun Unit!4545 () Unit!4537)

(assert (=> b!67635 (= lt!107855 Unit!4545)))

(assert (=> b!67635 (= (bitIndex!0 (size!1326 (buf!1707 (_2!3078 lt!107856))) (currentByte!3391 (_2!3078 lt!107856)) (currentBit!3386 (_2!3078 lt!107856))) (bvsub (bvadd (bitIndex!0 (size!1326 (buf!1707 (_2!3078 lt!107411))) (currentByte!3391 (_2!3078 lt!107411)) (currentBit!3386 (_2!3078 lt!107411))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!107877 () Unit!4537)

(declare-fun Unit!4546 () Unit!4537)

(assert (=> b!67635 (= lt!107877 Unit!4546)))

(assert (=> b!67635 (= (bitIndex!0 (size!1326 (buf!1707 (_2!3078 lt!107856))) (currentByte!3391 (_2!3078 lt!107856)) (currentBit!3386 (_2!3078 lt!107856))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1326 (buf!1707 (_2!3078 lt!107843))) (currentByte!3391 (_2!3078 lt!107843)) (currentBit!3386 (_2!3078 lt!107843))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!107844 () Unit!4537)

(declare-fun Unit!4547 () Unit!4537)

(assert (=> b!67635 (= lt!107844 Unit!4547)))

(declare-fun lt!107880 () tuple2!5932)

(assert (=> b!67635 (= lt!107880 (reader!0 (_2!3078 lt!107411) (_2!3078 lt!107856)))))

(declare-fun lt!107879 () (_ BitVec 64))

(assert (=> b!67635 (= lt!107879 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!107863 () Unit!4537)

(assert (=> b!67635 (= lt!107863 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3078 lt!107411) (buf!1707 (_2!3078 lt!107856)) lt!107879))))

(assert (=> b!67635 (validate_offset_bits!1 ((_ sign_extend 32) (size!1326 (buf!1707 (_2!3078 lt!107856)))) ((_ sign_extend 32) (currentByte!3391 (_2!3078 lt!107411))) ((_ sign_extend 32) (currentBit!3386 (_2!3078 lt!107411))) lt!107879)))

(declare-fun lt!107854 () Unit!4537)

(assert (=> b!67635 (= lt!107854 lt!107863)))

(declare-fun lt!107852 () tuple2!5932)

(assert (=> b!67635 (= lt!107852 (reader!0 (_2!3078 lt!107843) (_2!3078 lt!107856)))))

(declare-fun lt!107853 () (_ BitVec 64))

(assert (=> b!67635 (= lt!107853 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!107872 () Unit!4537)

(assert (=> b!67635 (= lt!107872 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3078 lt!107843) (buf!1707 (_2!3078 lt!107856)) lt!107853))))

(assert (=> b!67635 (validate_offset_bits!1 ((_ sign_extend 32) (size!1326 (buf!1707 (_2!3078 lt!107856)))) ((_ sign_extend 32) (currentByte!3391 (_2!3078 lt!107843))) ((_ sign_extend 32) (currentBit!3386 (_2!3078 lt!107843))) lt!107853)))

(declare-fun lt!107876 () Unit!4537)

(assert (=> b!67635 (= lt!107876 lt!107872)))

(declare-fun lt!107850 () List!712)

(assert (=> b!67635 (= lt!107850 (byteArrayBitContentToList!0 (_2!3078 lt!107856) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!107868 () List!712)

(assert (=> b!67635 (= lt!107868 (byteArrayBitContentToList!0 (_2!3078 lt!107856) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!107847 () List!712)

(assert (=> b!67635 (= lt!107847 (bitStreamReadBitsIntoList!0 (_2!3078 lt!107856) (_1!3077 lt!107880) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!107866 () List!712)

(assert (=> b!67635 (= lt!107866 (bitStreamReadBitsIntoList!0 (_2!3078 lt!107856) (_1!3077 lt!107852) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!107845 () (_ BitVec 64))

(assert (=> b!67635 (= lt!107845 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!107867 () Unit!4537)

(assert (=> b!67635 (= lt!107867 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3078 lt!107856) (_2!3078 lt!107856) (_1!3077 lt!107880) (_1!3077 lt!107852) lt!107845 lt!107847))))

(assert (=> b!67635 (= (bitStreamReadBitsIntoList!0 (_2!3078 lt!107856) (_1!3077 lt!107852) (bvsub lt!107845 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!316 lt!107847))))

(declare-fun lt!107878 () Unit!4537)

(assert (=> b!67635 (= lt!107878 lt!107867)))

(declare-fun lt!107860 () (_ BitVec 64))

(declare-fun lt!107881 () Unit!4537)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2868 array!2868 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4537)

(assert (=> b!67635 (= lt!107881 (arrayBitRangesEqImpliesEq!0 (buf!1707 (_2!3078 lt!107843)) (buf!1707 (_2!3078 lt!107856)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!107860 (bitIndex!0 (size!1326 (buf!1707 (_2!3078 lt!107843))) (currentByte!3391 (_2!3078 lt!107843)) (currentBit!3386 (_2!3078 lt!107843)))))))

(assert (=> b!67635 (= (bitAt!0 (buf!1707 (_2!3078 lt!107843)) lt!107860) (bitAt!0 (buf!1707 (_2!3078 lt!107856)) lt!107860))))

(declare-fun lt!107873 () Unit!4537)

(assert (=> b!67635 (= lt!107873 lt!107881)))

(declare-fun d!21348 () Bool)

(assert (=> d!21348 e!44299))

(declare-fun res!55985 () Bool)

(assert (=> d!21348 (=> (not res!55985) (not e!44299))))

(declare-fun lt!107865 () (_ BitVec 64))

(assert (=> d!21348 (= res!55985 (= (bitIndex!0 (size!1326 (buf!1707 (_2!3078 lt!107869))) (currentByte!3391 (_2!3078 lt!107869)) (currentBit!3386 (_2!3078 lt!107869))) (bvsub lt!107865 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!21348 (or (= (bvand lt!107865 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!107865 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!107865 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!107842 () (_ BitVec 64))

(assert (=> d!21348 (= lt!107865 (bvadd lt!107842 to!314))))

(assert (=> d!21348 (or (not (= (bvand lt!107842 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!107842 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!107842 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!21348 (= lt!107842 (bitIndex!0 (size!1326 (buf!1707 (_2!3078 lt!107411))) (currentByte!3391 (_2!3078 lt!107411)) (currentBit!3386 (_2!3078 lt!107411))))))

(assert (=> d!21348 (= lt!107869 e!44300)))

(assert (=> d!21348 (= c!4951 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!107861 () Unit!4537)

(declare-fun lt!107858 () Unit!4537)

(assert (=> d!21348 (= lt!107861 lt!107858)))

(assert (=> d!21348 (isPrefixOf!0 (_2!3078 lt!107411) (_2!3078 lt!107411))))

(assert (=> d!21348 (= lt!107858 (lemmaIsPrefixRefl!0 (_2!3078 lt!107411)))))

(assert (=> d!21348 (= lt!107860 (bitIndex!0 (size!1326 (buf!1707 (_2!3078 lt!107411))) (currentByte!3391 (_2!3078 lt!107411)) (currentBit!3386 (_2!3078 lt!107411))))))

(assert (=> d!21348 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!21348 (= (appendBitsMSBFirstLoop!0 (_2!3078 lt!107411) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!107869)))

(assert (= (and d!21348 c!4951) b!67635))

(assert (= (and d!21348 (not c!4951)) b!67632))

(assert (= (or b!67635 b!67632) bm!862))

(assert (= (and d!21348 res!55985) b!67636))

(assert (= (and b!67636 res!55980) b!67634))

(assert (= (and b!67634 res!55983) b!67637))

(assert (= (and b!67637 res!55981) b!67633))

(assert (= (and b!67633 res!55982) b!67638))

(assert (= (and b!67638 res!55984) b!67631))

(declare-fun m!107711 () Bool)

(assert (=> d!21348 m!107711))

(assert (=> d!21348 m!107387))

(declare-fun m!107713 () Bool)

(assert (=> d!21348 m!107713))

(declare-fun m!107715 () Bool)

(assert (=> d!21348 m!107715))

(declare-fun m!107717 () Bool)

(assert (=> b!67631 m!107717))

(declare-fun m!107719 () Bool)

(assert (=> bm!862 m!107719))

(declare-fun m!107721 () Bool)

(assert (=> b!67638 m!107721))

(declare-fun m!107723 () Bool)

(assert (=> b!67638 m!107723))

(declare-fun m!107725 () Bool)

(assert (=> b!67638 m!107725))

(declare-fun m!107727 () Bool)

(assert (=> b!67638 m!107727))

(declare-fun m!107729 () Bool)

(assert (=> b!67638 m!107729))

(declare-fun m!107731 () Bool)

(assert (=> b!67637 m!107731))

(declare-fun m!107733 () Bool)

(assert (=> b!67636 m!107733))

(declare-fun m!107735 () Bool)

(assert (=> b!67635 m!107735))

(declare-fun m!107737 () Bool)

(assert (=> b!67635 m!107737))

(declare-fun m!107739 () Bool)

(assert (=> b!67635 m!107739))

(declare-fun m!107741 () Bool)

(assert (=> b!67635 m!107741))

(declare-fun m!107743 () Bool)

(assert (=> b!67635 m!107743))

(assert (=> b!67635 m!107741))

(declare-fun m!107745 () Bool)

(assert (=> b!67635 m!107745))

(declare-fun m!107747 () Bool)

(assert (=> b!67635 m!107747))

(declare-fun m!107749 () Bool)

(assert (=> b!67635 m!107749))

(declare-fun m!107751 () Bool)

(assert (=> b!67635 m!107751))

(declare-fun m!107753 () Bool)

(assert (=> b!67635 m!107753))

(declare-fun m!107755 () Bool)

(assert (=> b!67635 m!107755))

(declare-fun m!107757 () Bool)

(assert (=> b!67635 m!107757))

(declare-fun m!107759 () Bool)

(assert (=> b!67635 m!107759))

(declare-fun m!107761 () Bool)

(assert (=> b!67635 m!107761))

(declare-fun m!107763 () Bool)

(assert (=> b!67635 m!107763))

(declare-fun m!107765 () Bool)

(assert (=> b!67635 m!107765))

(declare-fun m!107767 () Bool)

(assert (=> b!67635 m!107767))

(declare-fun m!107769 () Bool)

(assert (=> b!67635 m!107769))

(declare-fun m!107771 () Bool)

(assert (=> b!67635 m!107771))

(declare-fun m!107773 () Bool)

(assert (=> b!67635 m!107773))

(assert (=> b!67635 m!107759))

(assert (=> b!67635 m!107751))

(declare-fun m!107775 () Bool)

(assert (=> b!67635 m!107775))

(declare-fun m!107777 () Bool)

(assert (=> b!67635 m!107777))

(declare-fun m!107779 () Bool)

(assert (=> b!67635 m!107779))

(declare-fun m!107781 () Bool)

(assert (=> b!67635 m!107781))

(declare-fun m!107783 () Bool)

(assert (=> b!67635 m!107783))

(declare-fun m!107785 () Bool)

(assert (=> b!67635 m!107785))

(assert (=> b!67635 m!107387))

(assert (=> b!67635 m!107779))

(declare-fun m!107787 () Bool)

(assert (=> b!67635 m!107787))

(declare-fun m!107789 () Bool)

(assert (=> b!67635 m!107789))

(declare-fun m!107791 () Bool)

(assert (=> b!67635 m!107791))

(declare-fun m!107793 () Bool)

(assert (=> b!67635 m!107793))

(declare-fun m!107795 () Bool)

(assert (=> b!67635 m!107795))

(declare-fun m!107797 () Bool)

(assert (=> b!67632 m!107797))

(declare-fun m!107799 () Bool)

(assert (=> b!67632 m!107799))

(assert (=> b!67387 d!21348))

(declare-fun d!21440 () Bool)

(assert (=> d!21440 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1326 (buf!1707 (_2!3078 lt!107411)))) ((_ sign_extend 32) (currentByte!3391 thiss!1379)) ((_ sign_extend 32) (currentBit!3386 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1326 (buf!1707 (_2!3078 lt!107411)))) ((_ sign_extend 32) (currentByte!3391 thiss!1379)) ((_ sign_extend 32) (currentBit!3386 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!5190 () Bool)

(assert (= bs!5190 d!21440))

(declare-fun m!107801 () Bool)

(assert (=> bs!5190 m!107801))

(assert (=> b!67387 d!21440))

(declare-fun d!21442 () Bool)

(assert (=> d!21442 (validate_offset_bits!1 ((_ sign_extend 32) (size!1326 (buf!1707 (_2!3078 lt!107411)))) ((_ sign_extend 32) (currentByte!3391 thiss!1379)) ((_ sign_extend 32) (currentBit!3386 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!107884 () Unit!4537)

(declare-fun choose!9 (BitStream!2274 array!2868 (_ BitVec 64) BitStream!2274) Unit!4537)

(assert (=> d!21442 (= lt!107884 (choose!9 thiss!1379 (buf!1707 (_2!3078 lt!107411)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2275 (buf!1707 (_2!3078 lt!107411)) (currentByte!3391 thiss!1379) (currentBit!3386 thiss!1379))))))

(assert (=> d!21442 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1707 (_2!3078 lt!107411)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!107884)))

(declare-fun bs!5191 () Bool)

(assert (= bs!5191 d!21442))

(assert (=> bs!5191 m!107319))

(declare-fun m!107803 () Bool)

(assert (=> bs!5191 m!107803))

(assert (=> b!67387 d!21442))

(declare-fun b!67649 () Bool)

(declare-fun res!55993 () Bool)

(declare-fun e!44306 () Bool)

(assert (=> b!67649 (=> (not res!55993) (not e!44306))))

(declare-fun lt!107941 () tuple2!5932)

(assert (=> b!67649 (= res!55993 (isPrefixOf!0 (_2!3077 lt!107941) (_2!3078 lt!107411)))))

(declare-fun lt!107925 () (_ BitVec 64))

(declare-fun b!67650 () Bool)

(declare-fun lt!107930 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!2274 (_ BitVec 64)) BitStream!2274)

(assert (=> b!67650 (= e!44306 (= (_1!3077 lt!107941) (withMovedBitIndex!0 (_2!3077 lt!107941) (bvsub lt!107925 lt!107930))))))

(assert (=> b!67650 (or (= (bvand lt!107925 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!107930 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!107925 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!107925 lt!107930) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!67650 (= lt!107930 (bitIndex!0 (size!1326 (buf!1707 (_2!3078 lt!107411))) (currentByte!3391 (_2!3078 lt!107411)) (currentBit!3386 (_2!3078 lt!107411))))))

(assert (=> b!67650 (= lt!107925 (bitIndex!0 (size!1326 (buf!1707 thiss!1379)) (currentByte!3391 thiss!1379) (currentBit!3386 thiss!1379)))))

(declare-fun b!67651 () Bool)

(declare-fun res!55994 () Bool)

(assert (=> b!67651 (=> (not res!55994) (not e!44306))))

(assert (=> b!67651 (= res!55994 (isPrefixOf!0 (_1!3077 lt!107941) thiss!1379))))

(declare-fun b!67652 () Bool)

(declare-fun e!44305 () Unit!4537)

(declare-fun lt!107937 () Unit!4537)

(assert (=> b!67652 (= e!44305 lt!107937)))

(declare-fun lt!107932 () (_ BitVec 64))

(assert (=> b!67652 (= lt!107932 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107944 () (_ BitVec 64))

(assert (=> b!67652 (= lt!107944 (bitIndex!0 (size!1326 (buf!1707 thiss!1379)) (currentByte!3391 thiss!1379) (currentBit!3386 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2868 array!2868 (_ BitVec 64) (_ BitVec 64)) Unit!4537)

(assert (=> b!67652 (= lt!107937 (arrayBitRangesEqSymmetric!0 (buf!1707 thiss!1379) (buf!1707 (_2!3078 lt!107411)) lt!107932 lt!107944))))

(assert (=> b!67652 (arrayBitRangesEq!0 (buf!1707 (_2!3078 lt!107411)) (buf!1707 thiss!1379) lt!107932 lt!107944)))

(declare-fun d!21444 () Bool)

(assert (=> d!21444 e!44306))

(declare-fun res!55992 () Bool)

(assert (=> d!21444 (=> (not res!55992) (not e!44306))))

(assert (=> d!21444 (= res!55992 (isPrefixOf!0 (_1!3077 lt!107941) (_2!3077 lt!107941)))))

(declare-fun lt!107929 () BitStream!2274)

(assert (=> d!21444 (= lt!107941 (tuple2!5933 lt!107929 (_2!3078 lt!107411)))))

(declare-fun lt!107936 () Unit!4537)

(declare-fun lt!107933 () Unit!4537)

(assert (=> d!21444 (= lt!107936 lt!107933)))

(assert (=> d!21444 (isPrefixOf!0 lt!107929 (_2!3078 lt!107411))))

(assert (=> d!21444 (= lt!107933 (lemmaIsPrefixTransitive!0 lt!107929 (_2!3078 lt!107411) (_2!3078 lt!107411)))))

(declare-fun lt!107939 () Unit!4537)

(declare-fun lt!107942 () Unit!4537)

(assert (=> d!21444 (= lt!107939 lt!107942)))

(assert (=> d!21444 (isPrefixOf!0 lt!107929 (_2!3078 lt!107411))))

(assert (=> d!21444 (= lt!107942 (lemmaIsPrefixTransitive!0 lt!107929 thiss!1379 (_2!3078 lt!107411)))))

(declare-fun lt!107928 () Unit!4537)

(assert (=> d!21444 (= lt!107928 e!44305)))

(declare-fun c!4954 () Bool)

(assert (=> d!21444 (= c!4954 (not (= (size!1326 (buf!1707 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!107935 () Unit!4537)

(declare-fun lt!107927 () Unit!4537)

(assert (=> d!21444 (= lt!107935 lt!107927)))

(assert (=> d!21444 (isPrefixOf!0 (_2!3078 lt!107411) (_2!3078 lt!107411))))

(assert (=> d!21444 (= lt!107927 (lemmaIsPrefixRefl!0 (_2!3078 lt!107411)))))

(declare-fun lt!107931 () Unit!4537)

(declare-fun lt!107934 () Unit!4537)

(assert (=> d!21444 (= lt!107931 lt!107934)))

(assert (=> d!21444 (= lt!107934 (lemmaIsPrefixRefl!0 (_2!3078 lt!107411)))))

(declare-fun lt!107938 () Unit!4537)

(declare-fun lt!107926 () Unit!4537)

(assert (=> d!21444 (= lt!107938 lt!107926)))

(assert (=> d!21444 (isPrefixOf!0 lt!107929 lt!107929)))

(assert (=> d!21444 (= lt!107926 (lemmaIsPrefixRefl!0 lt!107929))))

(declare-fun lt!107943 () Unit!4537)

(declare-fun lt!107940 () Unit!4537)

(assert (=> d!21444 (= lt!107943 lt!107940)))

(assert (=> d!21444 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!21444 (= lt!107940 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!21444 (= lt!107929 (BitStream!2275 (buf!1707 (_2!3078 lt!107411)) (currentByte!3391 thiss!1379) (currentBit!3386 thiss!1379)))))

(assert (=> d!21444 (isPrefixOf!0 thiss!1379 (_2!3078 lt!107411))))

(assert (=> d!21444 (= (reader!0 thiss!1379 (_2!3078 lt!107411)) lt!107941)))

(declare-fun b!67653 () Bool)

(declare-fun Unit!4548 () Unit!4537)

(assert (=> b!67653 (= e!44305 Unit!4548)))

(assert (= (and d!21444 c!4954) b!67652))

(assert (= (and d!21444 (not c!4954)) b!67653))

(assert (= (and d!21444 res!55992) b!67651))

(assert (= (and b!67651 res!55994) b!67649))

(assert (= (and b!67649 res!55993) b!67650))

(declare-fun m!107805 () Bool)

(assert (=> b!67650 m!107805))

(assert (=> b!67650 m!107387))

(assert (=> b!67650 m!107335))

(assert (=> b!67652 m!107335))

(declare-fun m!107807 () Bool)

(assert (=> b!67652 m!107807))

(declare-fun m!107809 () Bool)

(assert (=> b!67652 m!107809))

(declare-fun m!107811 () Bool)

(assert (=> b!67649 m!107811))

(declare-fun m!107813 () Bool)

(assert (=> b!67651 m!107813))

(declare-fun m!107815 () Bool)

(assert (=> d!21444 m!107815))

(declare-fun m!107817 () Bool)

(assert (=> d!21444 m!107817))

(assert (=> d!21444 m!107333))

(declare-fun m!107819 () Bool)

(assert (=> d!21444 m!107819))

(assert (=> d!21444 m!107355))

(assert (=> d!21444 m!107713))

(assert (=> d!21444 m!107331))

(declare-fun m!107821 () Bool)

(assert (=> d!21444 m!107821))

(assert (=> d!21444 m!107715))

(declare-fun m!107823 () Bool)

(assert (=> d!21444 m!107823))

(declare-fun m!107825 () Bool)

(assert (=> d!21444 m!107825))

(assert (=> b!67387 d!21444))

(declare-fun d!21446 () Bool)

(declare-fun e!44311 () Bool)

(assert (=> d!21446 e!44311))

(declare-fun c!4959 () Bool)

(assert (=> d!21446 (= c!4959 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!107953 () List!712)

(declare-datatypes ((tuple2!5942 0))(
  ( (tuple2!5943 (_1!3082 List!712) (_2!3082 BitStream!2274)) )
))
(declare-fun e!44312 () tuple2!5942)

(assert (=> d!21446 (= lt!107953 (_1!3082 e!44312))))

(declare-fun c!4960 () Bool)

(assert (=> d!21446 (= c!4960 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!21446 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!21446 (= (bitStreamReadBitsIntoList!0 (_2!3078 lt!107418) (_1!3077 lt!107404) (bvsub to!314 i!635)) lt!107953)))

(declare-fun b!67664 () Bool)

(declare-fun isEmpty!213 (List!712) Bool)

(assert (=> b!67664 (= e!44311 (isEmpty!213 lt!107953))))

(declare-fun b!67663 () Bool)

(declare-fun lt!107952 () (_ BitVec 64))

(declare-datatypes ((tuple2!5944 0))(
  ( (tuple2!5945 (_1!3083 Bool) (_2!3083 BitStream!2274)) )
))
(declare-fun lt!107951 () tuple2!5944)

(assert (=> b!67663 (= e!44312 (tuple2!5943 (Cons!708 (_1!3083 lt!107951) (bitStreamReadBitsIntoList!0 (_2!3078 lt!107418) (_2!3083 lt!107951) (bvsub (bvsub to!314 i!635) lt!107952))) (_2!3083 lt!107951)))))

(declare-fun readBit!0 (BitStream!2274) tuple2!5944)

(assert (=> b!67663 (= lt!107951 (readBit!0 (_1!3077 lt!107404)))))

(assert (=> b!67663 (= lt!107952 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!67665 () Bool)

(assert (=> b!67665 (= e!44311 (> (length!340 lt!107953) 0))))

(declare-fun b!67662 () Bool)

(assert (=> b!67662 (= e!44312 (tuple2!5943 Nil!709 (_1!3077 lt!107404)))))

(assert (= (and d!21446 c!4960) b!67662))

(assert (= (and d!21446 (not c!4960)) b!67663))

(assert (= (and d!21446 c!4959) b!67664))

(assert (= (and d!21446 (not c!4959)) b!67665))

(declare-fun m!107827 () Bool)

(assert (=> b!67664 m!107827))

(declare-fun m!107829 () Bool)

(assert (=> b!67663 m!107829))

(declare-fun m!107831 () Bool)

(assert (=> b!67663 m!107831))

(declare-fun m!107833 () Bool)

(assert (=> b!67665 m!107833))

(assert (=> b!67388 d!21446))

(declare-fun d!21448 () Bool)

(assert (=> d!21448 (validate_offset_bits!1 ((_ sign_extend 32) (size!1326 (buf!1707 (_2!3078 lt!107418)))) ((_ sign_extend 32) (currentByte!3391 (_2!3078 lt!107411))) ((_ sign_extend 32) (currentBit!3386 (_2!3078 lt!107411))) lt!107424)))

(declare-fun lt!107954 () Unit!4537)

(assert (=> d!21448 (= lt!107954 (choose!9 (_2!3078 lt!107411) (buf!1707 (_2!3078 lt!107418)) lt!107424 (BitStream!2275 (buf!1707 (_2!3078 lt!107418)) (currentByte!3391 (_2!3078 lt!107411)) (currentBit!3386 (_2!3078 lt!107411)))))))

(assert (=> d!21448 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3078 lt!107411) (buf!1707 (_2!3078 lt!107418)) lt!107424) lt!107954)))

(declare-fun bs!5192 () Bool)

(assert (= bs!5192 d!21448))

(assert (=> bs!5192 m!107367))

(declare-fun m!107835 () Bool)

(assert (=> bs!5192 m!107835))

(assert (=> b!67388 d!21448))

(declare-fun d!21450 () Bool)

(declare-fun e!44313 () Bool)

(assert (=> d!21450 e!44313))

(declare-fun c!4961 () Bool)

(assert (=> d!21450 (= c!4961 (= lt!107424 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!107957 () List!712)

(declare-fun e!44314 () tuple2!5942)

(assert (=> d!21450 (= lt!107957 (_1!3082 e!44314))))

(declare-fun c!4962 () Bool)

(assert (=> d!21450 (= c!4962 (= lt!107424 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!21450 (bvsge lt!107424 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!21450 (= (bitStreamReadBitsIntoList!0 (_2!3078 lt!107418) (_1!3077 lt!107403) lt!107424) lt!107957)))

(declare-fun b!67668 () Bool)

(assert (=> b!67668 (= e!44313 (isEmpty!213 lt!107957))))

(declare-fun b!67667 () Bool)

(declare-fun lt!107956 () (_ BitVec 64))

(declare-fun lt!107955 () tuple2!5944)

(assert (=> b!67667 (= e!44314 (tuple2!5943 (Cons!708 (_1!3083 lt!107955) (bitStreamReadBitsIntoList!0 (_2!3078 lt!107418) (_2!3083 lt!107955) (bvsub lt!107424 lt!107956))) (_2!3083 lt!107955)))))

(assert (=> b!67667 (= lt!107955 (readBit!0 (_1!3077 lt!107403)))))

(assert (=> b!67667 (= lt!107956 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!67669 () Bool)

(assert (=> b!67669 (= e!44313 (> (length!340 lt!107957) 0))))

(declare-fun b!67666 () Bool)

(assert (=> b!67666 (= e!44314 (tuple2!5943 Nil!709 (_1!3077 lt!107403)))))

(assert (= (and d!21450 c!4962) b!67666))

(assert (= (and d!21450 (not c!4962)) b!67667))

(assert (= (and d!21450 c!4961) b!67668))

(assert (= (and d!21450 (not c!4961)) b!67669))

(declare-fun m!107837 () Bool)

(assert (=> b!67668 m!107837))

(declare-fun m!107839 () Bool)

(assert (=> b!67667 m!107839))

(declare-fun m!107841 () Bool)

(assert (=> b!67667 m!107841))

(declare-fun m!107843 () Bool)

(assert (=> b!67669 m!107843))

(assert (=> b!67388 d!21450))

(declare-fun d!21452 () Bool)

(assert (=> d!21452 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1326 (buf!1707 (_2!3078 lt!107418)))) ((_ sign_extend 32) (currentByte!3391 thiss!1379)) ((_ sign_extend 32) (currentBit!3386 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1326 (buf!1707 (_2!3078 lt!107418)))) ((_ sign_extend 32) (currentByte!3391 thiss!1379)) ((_ sign_extend 32) (currentBit!3386 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5193 () Bool)

(assert (= bs!5193 d!21452))

(declare-fun m!107845 () Bool)

(assert (=> bs!5193 m!107845))

(assert (=> b!67388 d!21452))

(declare-fun b!67670 () Bool)

(declare-fun res!55996 () Bool)

(declare-fun e!44316 () Bool)

(assert (=> b!67670 (=> (not res!55996) (not e!44316))))

(declare-fun lt!107974 () tuple2!5932)

(assert (=> b!67670 (= res!55996 (isPrefixOf!0 (_2!3077 lt!107974) (_2!3078 lt!107418)))))

(declare-fun lt!107963 () (_ BitVec 64))

(declare-fun b!67671 () Bool)

(declare-fun lt!107958 () (_ BitVec 64))

(assert (=> b!67671 (= e!44316 (= (_1!3077 lt!107974) (withMovedBitIndex!0 (_2!3077 lt!107974) (bvsub lt!107958 lt!107963))))))

(assert (=> b!67671 (or (= (bvand lt!107958 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!107963 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!107958 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!107958 lt!107963) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!67671 (= lt!107963 (bitIndex!0 (size!1326 (buf!1707 (_2!3078 lt!107418))) (currentByte!3391 (_2!3078 lt!107418)) (currentBit!3386 (_2!3078 lt!107418))))))

(assert (=> b!67671 (= lt!107958 (bitIndex!0 (size!1326 (buf!1707 thiss!1379)) (currentByte!3391 thiss!1379) (currentBit!3386 thiss!1379)))))

(declare-fun b!67672 () Bool)

(declare-fun res!55997 () Bool)

(assert (=> b!67672 (=> (not res!55997) (not e!44316))))

(assert (=> b!67672 (= res!55997 (isPrefixOf!0 (_1!3077 lt!107974) thiss!1379))))

(declare-fun b!67673 () Bool)

(declare-fun e!44315 () Unit!4537)

(declare-fun lt!107970 () Unit!4537)

(assert (=> b!67673 (= e!44315 lt!107970)))

(declare-fun lt!107965 () (_ BitVec 64))

(assert (=> b!67673 (= lt!107965 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107977 () (_ BitVec 64))

(assert (=> b!67673 (= lt!107977 (bitIndex!0 (size!1326 (buf!1707 thiss!1379)) (currentByte!3391 thiss!1379) (currentBit!3386 thiss!1379)))))

(assert (=> b!67673 (= lt!107970 (arrayBitRangesEqSymmetric!0 (buf!1707 thiss!1379) (buf!1707 (_2!3078 lt!107418)) lt!107965 lt!107977))))

(assert (=> b!67673 (arrayBitRangesEq!0 (buf!1707 (_2!3078 lt!107418)) (buf!1707 thiss!1379) lt!107965 lt!107977)))

(declare-fun d!21454 () Bool)

(assert (=> d!21454 e!44316))

(declare-fun res!55995 () Bool)

(assert (=> d!21454 (=> (not res!55995) (not e!44316))))

(assert (=> d!21454 (= res!55995 (isPrefixOf!0 (_1!3077 lt!107974) (_2!3077 lt!107974)))))

(declare-fun lt!107962 () BitStream!2274)

(assert (=> d!21454 (= lt!107974 (tuple2!5933 lt!107962 (_2!3078 lt!107418)))))

(declare-fun lt!107969 () Unit!4537)

(declare-fun lt!107966 () Unit!4537)

(assert (=> d!21454 (= lt!107969 lt!107966)))

(assert (=> d!21454 (isPrefixOf!0 lt!107962 (_2!3078 lt!107418))))

(assert (=> d!21454 (= lt!107966 (lemmaIsPrefixTransitive!0 lt!107962 (_2!3078 lt!107418) (_2!3078 lt!107418)))))

(declare-fun lt!107972 () Unit!4537)

(declare-fun lt!107975 () Unit!4537)

(assert (=> d!21454 (= lt!107972 lt!107975)))

(assert (=> d!21454 (isPrefixOf!0 lt!107962 (_2!3078 lt!107418))))

(assert (=> d!21454 (= lt!107975 (lemmaIsPrefixTransitive!0 lt!107962 thiss!1379 (_2!3078 lt!107418)))))

(declare-fun lt!107961 () Unit!4537)

(assert (=> d!21454 (= lt!107961 e!44315)))

(declare-fun c!4963 () Bool)

(assert (=> d!21454 (= c!4963 (not (= (size!1326 (buf!1707 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!107968 () Unit!4537)

(declare-fun lt!107960 () Unit!4537)

(assert (=> d!21454 (= lt!107968 lt!107960)))

(assert (=> d!21454 (isPrefixOf!0 (_2!3078 lt!107418) (_2!3078 lt!107418))))

(assert (=> d!21454 (= lt!107960 (lemmaIsPrefixRefl!0 (_2!3078 lt!107418)))))

(declare-fun lt!107964 () Unit!4537)

(declare-fun lt!107967 () Unit!4537)

(assert (=> d!21454 (= lt!107964 lt!107967)))

(assert (=> d!21454 (= lt!107967 (lemmaIsPrefixRefl!0 (_2!3078 lt!107418)))))

(declare-fun lt!107971 () Unit!4537)

(declare-fun lt!107959 () Unit!4537)

(assert (=> d!21454 (= lt!107971 lt!107959)))

(assert (=> d!21454 (isPrefixOf!0 lt!107962 lt!107962)))

(assert (=> d!21454 (= lt!107959 (lemmaIsPrefixRefl!0 lt!107962))))

(declare-fun lt!107976 () Unit!4537)

(declare-fun lt!107973 () Unit!4537)

(assert (=> d!21454 (= lt!107976 lt!107973)))

(assert (=> d!21454 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!21454 (= lt!107973 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!21454 (= lt!107962 (BitStream!2275 (buf!1707 (_2!3078 lt!107418)) (currentByte!3391 thiss!1379) (currentBit!3386 thiss!1379)))))

(assert (=> d!21454 (isPrefixOf!0 thiss!1379 (_2!3078 lt!107418))))

(assert (=> d!21454 (= (reader!0 thiss!1379 (_2!3078 lt!107418)) lt!107974)))

(declare-fun b!67674 () Bool)

(declare-fun Unit!4549 () Unit!4537)

(assert (=> b!67674 (= e!44315 Unit!4549)))

(assert (= (and d!21454 c!4963) b!67673))

(assert (= (and d!21454 (not c!4963)) b!67674))

(assert (= (and d!21454 res!55995) b!67672))

(assert (= (and b!67672 res!55997) b!67670))

(assert (= (and b!67670 res!55996) b!67671))

(declare-fun m!107847 () Bool)

(assert (=> b!67671 m!107847))

(assert (=> b!67671 m!107313))

(assert (=> b!67671 m!107335))

(assert (=> b!67673 m!107335))

(declare-fun m!107849 () Bool)

(assert (=> b!67673 m!107849))

(declare-fun m!107851 () Bool)

(assert (=> b!67673 m!107851))

(declare-fun m!107853 () Bool)

(assert (=> b!67670 m!107853))

(declare-fun m!107855 () Bool)

(assert (=> b!67672 m!107855))

(declare-fun m!107857 () Bool)

(assert (=> d!21454 m!107857))

(declare-fun m!107859 () Bool)

(assert (=> d!21454 m!107859))

(assert (=> d!21454 m!107333))

(declare-fun m!107861 () Bool)

(assert (=> d!21454 m!107861))

(assert (=> d!21454 m!107315))

(declare-fun m!107863 () Bool)

(assert (=> d!21454 m!107863))

(assert (=> d!21454 m!107331))

(declare-fun m!107865 () Bool)

(assert (=> d!21454 m!107865))

(declare-fun m!107867 () Bool)

(assert (=> d!21454 m!107867))

(declare-fun m!107869 () Bool)

(assert (=> d!21454 m!107869))

(declare-fun m!107871 () Bool)

(assert (=> d!21454 m!107871))

(assert (=> b!67388 d!21454))

(declare-fun d!21456 () Bool)

(assert (=> d!21456 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1326 (buf!1707 (_2!3078 lt!107418)))) ((_ sign_extend 32) (currentByte!3391 (_2!3078 lt!107411))) ((_ sign_extend 32) (currentBit!3386 (_2!3078 lt!107411))) lt!107424) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1326 (buf!1707 (_2!3078 lt!107418)))) ((_ sign_extend 32) (currentByte!3391 (_2!3078 lt!107411))) ((_ sign_extend 32) (currentBit!3386 (_2!3078 lt!107411)))) lt!107424))))

(declare-fun bs!5194 () Bool)

(assert (= bs!5194 d!21456))

(declare-fun m!107873 () Bool)

(assert (=> bs!5194 m!107873))

(assert (=> b!67388 d!21456))

(declare-fun d!21458 () Bool)

(assert (=> d!21458 (validate_offset_bits!1 ((_ sign_extend 32) (size!1326 (buf!1707 (_2!3078 lt!107418)))) ((_ sign_extend 32) (currentByte!3391 thiss!1379)) ((_ sign_extend 32) (currentBit!3386 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!107978 () Unit!4537)

(assert (=> d!21458 (= lt!107978 (choose!9 thiss!1379 (buf!1707 (_2!3078 lt!107418)) (bvsub to!314 i!635) (BitStream!2275 (buf!1707 (_2!3078 lt!107418)) (currentByte!3391 thiss!1379) (currentBit!3386 thiss!1379))))))

(assert (=> d!21458 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1707 (_2!3078 lt!107418)) (bvsub to!314 i!635)) lt!107978)))

(declare-fun bs!5195 () Bool)

(assert (= bs!5195 d!21458))

(assert (=> bs!5195 m!107369))

(declare-fun m!107875 () Bool)

(assert (=> bs!5195 m!107875))

(assert (=> b!67388 d!21458))

(declare-fun b!67675 () Bool)

(declare-fun res!55999 () Bool)

(declare-fun e!44318 () Bool)

(assert (=> b!67675 (=> (not res!55999) (not e!44318))))

(declare-fun lt!107995 () tuple2!5932)

(assert (=> b!67675 (= res!55999 (isPrefixOf!0 (_2!3077 lt!107995) (_2!3078 lt!107418)))))

(declare-fun lt!107979 () (_ BitVec 64))

(declare-fun lt!107984 () (_ BitVec 64))

(declare-fun b!67676 () Bool)

(assert (=> b!67676 (= e!44318 (= (_1!3077 lt!107995) (withMovedBitIndex!0 (_2!3077 lt!107995) (bvsub lt!107979 lt!107984))))))

(assert (=> b!67676 (or (= (bvand lt!107979 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!107984 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!107979 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!107979 lt!107984) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!67676 (= lt!107984 (bitIndex!0 (size!1326 (buf!1707 (_2!3078 lt!107418))) (currentByte!3391 (_2!3078 lt!107418)) (currentBit!3386 (_2!3078 lt!107418))))))

(assert (=> b!67676 (= lt!107979 (bitIndex!0 (size!1326 (buf!1707 (_2!3078 lt!107411))) (currentByte!3391 (_2!3078 lt!107411)) (currentBit!3386 (_2!3078 lt!107411))))))

(declare-fun b!67677 () Bool)

(declare-fun res!56000 () Bool)

(assert (=> b!67677 (=> (not res!56000) (not e!44318))))

(assert (=> b!67677 (= res!56000 (isPrefixOf!0 (_1!3077 lt!107995) (_2!3078 lt!107411)))))

(declare-fun b!67678 () Bool)

(declare-fun e!44317 () Unit!4537)

(declare-fun lt!107991 () Unit!4537)

(assert (=> b!67678 (= e!44317 lt!107991)))

(declare-fun lt!107986 () (_ BitVec 64))

(assert (=> b!67678 (= lt!107986 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107998 () (_ BitVec 64))

(assert (=> b!67678 (= lt!107998 (bitIndex!0 (size!1326 (buf!1707 (_2!3078 lt!107411))) (currentByte!3391 (_2!3078 lt!107411)) (currentBit!3386 (_2!3078 lt!107411))))))

(assert (=> b!67678 (= lt!107991 (arrayBitRangesEqSymmetric!0 (buf!1707 (_2!3078 lt!107411)) (buf!1707 (_2!3078 lt!107418)) lt!107986 lt!107998))))

(assert (=> b!67678 (arrayBitRangesEq!0 (buf!1707 (_2!3078 lt!107418)) (buf!1707 (_2!3078 lt!107411)) lt!107986 lt!107998)))

(declare-fun d!21460 () Bool)

(assert (=> d!21460 e!44318))

(declare-fun res!55998 () Bool)

(assert (=> d!21460 (=> (not res!55998) (not e!44318))))

(assert (=> d!21460 (= res!55998 (isPrefixOf!0 (_1!3077 lt!107995) (_2!3077 lt!107995)))))

(declare-fun lt!107983 () BitStream!2274)

(assert (=> d!21460 (= lt!107995 (tuple2!5933 lt!107983 (_2!3078 lt!107418)))))

(declare-fun lt!107990 () Unit!4537)

(declare-fun lt!107987 () Unit!4537)

(assert (=> d!21460 (= lt!107990 lt!107987)))

(assert (=> d!21460 (isPrefixOf!0 lt!107983 (_2!3078 lt!107418))))

(assert (=> d!21460 (= lt!107987 (lemmaIsPrefixTransitive!0 lt!107983 (_2!3078 lt!107418) (_2!3078 lt!107418)))))

(declare-fun lt!107993 () Unit!4537)

(declare-fun lt!107996 () Unit!4537)

(assert (=> d!21460 (= lt!107993 lt!107996)))

(assert (=> d!21460 (isPrefixOf!0 lt!107983 (_2!3078 lt!107418))))

(assert (=> d!21460 (= lt!107996 (lemmaIsPrefixTransitive!0 lt!107983 (_2!3078 lt!107411) (_2!3078 lt!107418)))))

(declare-fun lt!107982 () Unit!4537)

(assert (=> d!21460 (= lt!107982 e!44317)))

(declare-fun c!4964 () Bool)

(assert (=> d!21460 (= c!4964 (not (= (size!1326 (buf!1707 (_2!3078 lt!107411))) #b00000000000000000000000000000000)))))

(declare-fun lt!107989 () Unit!4537)

(declare-fun lt!107981 () Unit!4537)

(assert (=> d!21460 (= lt!107989 lt!107981)))

(assert (=> d!21460 (isPrefixOf!0 (_2!3078 lt!107418) (_2!3078 lt!107418))))

(assert (=> d!21460 (= lt!107981 (lemmaIsPrefixRefl!0 (_2!3078 lt!107418)))))

(declare-fun lt!107985 () Unit!4537)

(declare-fun lt!107988 () Unit!4537)

(assert (=> d!21460 (= lt!107985 lt!107988)))

(assert (=> d!21460 (= lt!107988 (lemmaIsPrefixRefl!0 (_2!3078 lt!107418)))))

(declare-fun lt!107992 () Unit!4537)

(declare-fun lt!107980 () Unit!4537)

(assert (=> d!21460 (= lt!107992 lt!107980)))

(assert (=> d!21460 (isPrefixOf!0 lt!107983 lt!107983)))

(assert (=> d!21460 (= lt!107980 (lemmaIsPrefixRefl!0 lt!107983))))

(declare-fun lt!107997 () Unit!4537)

(declare-fun lt!107994 () Unit!4537)

(assert (=> d!21460 (= lt!107997 lt!107994)))

(assert (=> d!21460 (isPrefixOf!0 (_2!3078 lt!107411) (_2!3078 lt!107411))))

(assert (=> d!21460 (= lt!107994 (lemmaIsPrefixRefl!0 (_2!3078 lt!107411)))))

(assert (=> d!21460 (= lt!107983 (BitStream!2275 (buf!1707 (_2!3078 lt!107418)) (currentByte!3391 (_2!3078 lt!107411)) (currentBit!3386 (_2!3078 lt!107411))))))

(assert (=> d!21460 (isPrefixOf!0 (_2!3078 lt!107411) (_2!3078 lt!107418))))

(assert (=> d!21460 (= (reader!0 (_2!3078 lt!107411) (_2!3078 lt!107418)) lt!107995)))

(declare-fun b!67679 () Bool)

(declare-fun Unit!4550 () Unit!4537)

(assert (=> b!67679 (= e!44317 Unit!4550)))

(assert (= (and d!21460 c!4964) b!67678))

(assert (= (and d!21460 (not c!4964)) b!67679))

(assert (= (and d!21460 res!55998) b!67677))

(assert (= (and b!67677 res!56000) b!67675))

(assert (= (and b!67675 res!55999) b!67676))

(declare-fun m!107877 () Bool)

(assert (=> b!67676 m!107877))

(assert (=> b!67676 m!107313))

(assert (=> b!67676 m!107387))

(assert (=> b!67678 m!107387))

(declare-fun m!107879 () Bool)

(assert (=> b!67678 m!107879))

(declare-fun m!107881 () Bool)

(assert (=> b!67678 m!107881))

(declare-fun m!107883 () Bool)

(assert (=> b!67675 m!107883))

(declare-fun m!107885 () Bool)

(assert (=> b!67677 m!107885))

(declare-fun m!107887 () Bool)

(assert (=> d!21460 m!107887))

(declare-fun m!107889 () Bool)

(assert (=> d!21460 m!107889))

(assert (=> d!21460 m!107715))

(declare-fun m!107891 () Bool)

(assert (=> d!21460 m!107891))

(assert (=> d!21460 m!107325))

(assert (=> d!21460 m!107863))

(assert (=> d!21460 m!107713))

(declare-fun m!107893 () Bool)

(assert (=> d!21460 m!107893))

(assert (=> d!21460 m!107867))

(declare-fun m!107895 () Bool)

(assert (=> d!21460 m!107895))

(declare-fun m!107897 () Bool)

(assert (=> d!21460 m!107897))

(assert (=> b!67388 d!21460))

(declare-fun d!21462 () Bool)

(declare-fun res!56002 () Bool)

(declare-fun e!44319 () Bool)

(assert (=> d!21462 (=> (not res!56002) (not e!44319))))

(assert (=> d!21462 (= res!56002 (= (size!1326 (buf!1707 thiss!1379)) (size!1326 (buf!1707 (_2!3078 lt!107411)))))))

(assert (=> d!21462 (= (isPrefixOf!0 thiss!1379 (_2!3078 lt!107411)) e!44319)))

(declare-fun b!67680 () Bool)

(declare-fun res!56003 () Bool)

(assert (=> b!67680 (=> (not res!56003) (not e!44319))))

(assert (=> b!67680 (= res!56003 (bvsle (bitIndex!0 (size!1326 (buf!1707 thiss!1379)) (currentByte!3391 thiss!1379) (currentBit!3386 thiss!1379)) (bitIndex!0 (size!1326 (buf!1707 (_2!3078 lt!107411))) (currentByte!3391 (_2!3078 lt!107411)) (currentBit!3386 (_2!3078 lt!107411)))))))

(declare-fun b!67681 () Bool)

(declare-fun e!44320 () Bool)

(assert (=> b!67681 (= e!44319 e!44320)))

(declare-fun res!56001 () Bool)

(assert (=> b!67681 (=> res!56001 e!44320)))

(assert (=> b!67681 (= res!56001 (= (size!1326 (buf!1707 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!67682 () Bool)

(assert (=> b!67682 (= e!44320 (arrayBitRangesEq!0 (buf!1707 thiss!1379) (buf!1707 (_2!3078 lt!107411)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1326 (buf!1707 thiss!1379)) (currentByte!3391 thiss!1379) (currentBit!3386 thiss!1379))))))

(assert (= (and d!21462 res!56002) b!67680))

(assert (= (and b!67680 res!56003) b!67681))

(assert (= (and b!67681 (not res!56001)) b!67682))

(assert (=> b!67680 m!107335))

(assert (=> b!67680 m!107387))

(assert (=> b!67682 m!107335))

(assert (=> b!67682 m!107335))

(declare-fun m!107899 () Bool)

(assert (=> b!67682 m!107899))

(assert (=> b!67399 d!21462))

(declare-fun d!21464 () Bool)

(assert (=> d!21464 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1326 (buf!1707 (_2!3078 lt!107411)))) ((_ sign_extend 32) (currentByte!3391 (_2!3078 lt!107411))) ((_ sign_extend 32) (currentBit!3386 (_2!3078 lt!107411))) lt!107424) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1326 (buf!1707 (_2!3078 lt!107411)))) ((_ sign_extend 32) (currentByte!3391 (_2!3078 lt!107411))) ((_ sign_extend 32) (currentBit!3386 (_2!3078 lt!107411)))) lt!107424))))

(declare-fun bs!5196 () Bool)

(assert (= bs!5196 d!21464))

(assert (=> bs!5196 m!107503))

(assert (=> b!67399 d!21464))

(declare-fun d!21466 () Bool)

(declare-fun e!44323 () Bool)

(assert (=> d!21466 e!44323))

(declare-fun res!56006 () Bool)

(assert (=> d!21466 (=> (not res!56006) (not e!44323))))

(assert (=> d!21466 (= res!56006 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!108001 () Unit!4537)

(declare-fun choose!27 (BitStream!2274 BitStream!2274 (_ BitVec 64) (_ BitVec 64)) Unit!4537)

(assert (=> d!21466 (= lt!108001 (choose!27 thiss!1379 (_2!3078 lt!107411) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!21466 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!21466 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3078 lt!107411) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!108001)))

(declare-fun b!67685 () Bool)

(assert (=> b!67685 (= e!44323 (validate_offset_bits!1 ((_ sign_extend 32) (size!1326 (buf!1707 (_2!3078 lt!107411)))) ((_ sign_extend 32) (currentByte!3391 (_2!3078 lt!107411))) ((_ sign_extend 32) (currentBit!3386 (_2!3078 lt!107411))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!21466 res!56006) b!67685))

(declare-fun m!107901 () Bool)

(assert (=> d!21466 m!107901))

(declare-fun m!107903 () Bool)

(assert (=> b!67685 m!107903))

(assert (=> b!67399 d!21466))

(declare-fun b!67703 () Bool)

(declare-fun res!56025 () Bool)

(declare-fun e!44335 () Bool)

(assert (=> b!67703 (=> (not res!56025) (not e!44335))))

(declare-fun lt!108027 () tuple2!5934)

(assert (=> b!67703 (= res!56025 (isPrefixOf!0 thiss!1379 (_2!3078 lt!108027)))))

(declare-fun b!67704 () Bool)

(declare-fun res!56030 () Bool)

(declare-fun e!44334 () Bool)

(assert (=> b!67704 (=> (not res!56030) (not e!44334))))

(declare-fun lt!108033 () (_ BitVec 64))

(declare-fun lt!108037 () tuple2!5934)

(declare-fun lt!108031 () (_ BitVec 64))

(assert (=> b!67704 (= res!56030 (= (bitIndex!0 (size!1326 (buf!1707 (_2!3078 lt!108037))) (currentByte!3391 (_2!3078 lt!108037)) (currentBit!3386 (_2!3078 lt!108037))) (bvadd lt!108033 lt!108031)))))

(assert (=> b!67704 (or (not (= (bvand lt!108033 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!108031 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!108033 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!108033 lt!108031) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!67704 (= lt!108031 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!67704 (= lt!108033 (bitIndex!0 (size!1326 (buf!1707 thiss!1379)) (currentByte!3391 thiss!1379) (currentBit!3386 thiss!1379)))))

(declare-fun b!67705 () Bool)

(declare-fun res!56028 () Bool)

(assert (=> b!67705 (=> (not res!56028) (not e!44335))))

(assert (=> b!67705 (= res!56028 (= (bitIndex!0 (size!1326 (buf!1707 (_2!3078 lt!108027))) (currentByte!3391 (_2!3078 lt!108027)) (currentBit!3386 (_2!3078 lt!108027))) (bvadd (bitIndex!0 (size!1326 (buf!1707 thiss!1379)) (currentByte!3391 thiss!1379) (currentBit!3386 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!67706 () Bool)

(declare-fun e!44332 () Bool)

(assert (=> b!67706 (= e!44334 e!44332)))

(declare-fun res!56026 () Bool)

(assert (=> b!67706 (=> (not res!56026) (not e!44332))))

(declare-datatypes ((tuple2!5946 0))(
  ( (tuple2!5947 (_1!3084 BitStream!2274) (_2!3084 Bool)) )
))
(declare-fun lt!108028 () tuple2!5946)

(declare-fun lt!108030 () (_ BitVec 8))

(assert (=> b!67706 (= res!56026 (and (= (_2!3084 lt!108028) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1896 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!108030)) #b00000000000000000000000000000000))) (= (_1!3084 lt!108028) (_2!3078 lt!108037))))))

(declare-fun lt!108026 () tuple2!5940)

(declare-fun lt!108032 () BitStream!2274)

(assert (=> b!67706 (= lt!108026 (readBits!0 lt!108032 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!2274) tuple2!5946)

(assert (=> b!67706 (= lt!108028 (readBitPure!0 lt!108032))))

(declare-fun readerFrom!0 (BitStream!2274 (_ BitVec 32) (_ BitVec 32)) BitStream!2274)

(assert (=> b!67706 (= lt!108032 (readerFrom!0 (_2!3078 lt!108037) (currentBit!3386 thiss!1379) (currentByte!3391 thiss!1379)))))

(declare-fun b!67707 () Bool)

(declare-fun e!44333 () Bool)

(declare-fun lt!108036 () tuple2!5946)

(assert (=> b!67707 (= e!44333 (= (bitIndex!0 (size!1326 (buf!1707 (_1!3084 lt!108036))) (currentByte!3391 (_1!3084 lt!108036)) (currentBit!3386 (_1!3084 lt!108036))) (bitIndex!0 (size!1326 (buf!1707 (_2!3078 lt!108027))) (currentByte!3391 (_2!3078 lt!108027)) (currentBit!3386 (_2!3078 lt!108027)))))))

(declare-fun b!67708 () Bool)

(assert (=> b!67708 (= e!44332 (= (bitIndex!0 (size!1326 (buf!1707 (_1!3084 lt!108028))) (currentByte!3391 (_1!3084 lt!108028)) (currentBit!3386 (_1!3084 lt!108028))) (bitIndex!0 (size!1326 (buf!1707 (_2!3078 lt!108037))) (currentByte!3391 (_2!3078 lt!108037)) (currentBit!3386 (_2!3078 lt!108037)))))))

(declare-fun b!67709 () Bool)

(declare-fun res!56027 () Bool)

(assert (=> b!67709 (=> (not res!56027) (not e!44334))))

(assert (=> b!67709 (= res!56027 (isPrefixOf!0 thiss!1379 (_2!3078 lt!108037)))))

(declare-fun d!21468 () Bool)

(assert (=> d!21468 e!44334))

(declare-fun res!56024 () Bool)

(assert (=> d!21468 (=> (not res!56024) (not e!44334))))

(assert (=> d!21468 (= res!56024 (= (size!1326 (buf!1707 (_2!3078 lt!108037))) (size!1326 (buf!1707 thiss!1379))))))

(declare-fun lt!108035 () array!2868)

(assert (=> d!21468 (= lt!108030 (select (arr!1896 lt!108035) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!21468 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1326 lt!108035)))))

(assert (=> d!21468 (= lt!108035 (array!2869 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!108029 () tuple2!5934)

(assert (=> d!21468 (= lt!108037 (tuple2!5935 (_1!3078 lt!108029) (_2!3078 lt!108029)))))

(assert (=> d!21468 (= lt!108029 lt!108027)))

(assert (=> d!21468 e!44335))

(declare-fun res!56023 () Bool)

(assert (=> d!21468 (=> (not res!56023) (not e!44335))))

(assert (=> d!21468 (= res!56023 (= (size!1326 (buf!1707 thiss!1379)) (size!1326 (buf!1707 (_2!3078 lt!108027)))))))

(declare-fun lt!108034 () Bool)

(declare-fun appendBit!0 (BitStream!2274 Bool) tuple2!5934)

(assert (=> d!21468 (= lt!108027 (appendBit!0 thiss!1379 lt!108034))))

(assert (=> d!21468 (= lt!108034 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1896 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!21468 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!21468 (= (appendBitFromByte!0 thiss!1379 (select (arr!1896 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!108037)))

(declare-fun b!67710 () Bool)

(assert (=> b!67710 (= e!44335 e!44333)))

(declare-fun res!56029 () Bool)

(assert (=> b!67710 (=> (not res!56029) (not e!44333))))

(assert (=> b!67710 (= res!56029 (and (= (_2!3084 lt!108036) lt!108034) (= (_1!3084 lt!108036) (_2!3078 lt!108027))))))

(assert (=> b!67710 (= lt!108036 (readBitPure!0 (readerFrom!0 (_2!3078 lt!108027) (currentBit!3386 thiss!1379) (currentByte!3391 thiss!1379))))))

(assert (= (and d!21468 res!56023) b!67705))

(assert (= (and b!67705 res!56028) b!67703))

(assert (= (and b!67703 res!56025) b!67710))

(assert (= (and b!67710 res!56029) b!67707))

(assert (= (and d!21468 res!56024) b!67704))

(assert (= (and b!67704 res!56030) b!67709))

(assert (= (and b!67709 res!56027) b!67706))

(assert (= (and b!67706 res!56026) b!67708))

(declare-fun m!107905 () Bool)

(assert (=> b!67706 m!107905))

(declare-fun m!107907 () Bool)

(assert (=> b!67706 m!107907))

(declare-fun m!107909 () Bool)

(assert (=> b!67706 m!107909))

(declare-fun m!107911 () Bool)

(assert (=> b!67709 m!107911))

(declare-fun m!107913 () Bool)

(assert (=> b!67708 m!107913))

(declare-fun m!107915 () Bool)

(assert (=> b!67708 m!107915))

(declare-fun m!107917 () Bool)

(assert (=> b!67705 m!107917))

(assert (=> b!67705 m!107335))

(declare-fun m!107919 () Bool)

(assert (=> d!21468 m!107919))

(declare-fun m!107921 () Bool)

(assert (=> d!21468 m!107921))

(assert (=> d!21468 m!107513))

(declare-fun m!107923 () Bool)

(assert (=> b!67707 m!107923))

(assert (=> b!67707 m!107917))

(declare-fun m!107925 () Bool)

(assert (=> b!67710 m!107925))

(assert (=> b!67710 m!107925))

(declare-fun m!107927 () Bool)

(assert (=> b!67710 m!107927))

(declare-fun m!107929 () Bool)

(assert (=> b!67703 m!107929))

(assert (=> b!67704 m!107915))

(assert (=> b!67704 m!107335))

(assert (=> b!67399 d!21468))

(declare-fun d!21470 () Bool)

(assert (=> d!21470 (= (head!531 (byteArrayBitContentToList!0 (_2!3078 lt!107411) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!827 (byteArrayBitContentToList!0 (_2!3078 lt!107411) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!67389 d!21470))

(declare-fun d!21472 () Bool)

(declare-fun c!4965 () Bool)

(assert (=> d!21472 (= c!4965 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!44336 () List!712)

(assert (=> d!21472 (= (byteArrayBitContentToList!0 (_2!3078 lt!107411) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!44336)))

(declare-fun b!67711 () Bool)

(assert (=> b!67711 (= e!44336 Nil!709)))

(declare-fun b!67712 () Bool)

(assert (=> b!67712 (= e!44336 (Cons!708 (not (= (bvand ((_ sign_extend 24) (select (arr!1896 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!3078 lt!107411) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!21472 c!4965) b!67711))

(assert (= (and d!21472 (not c!4965)) b!67712))

(assert (=> b!67712 m!107347))

(assert (=> b!67712 m!107513))

(declare-fun m!107931 () Bool)

(assert (=> b!67712 m!107931))

(assert (=> b!67389 d!21472))

(declare-fun d!21474 () Bool)

(assert (=> d!21474 (= (head!531 (bitStreamReadBitsIntoList!0 (_2!3078 lt!107411) (_1!3077 lt!107406) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!827 (bitStreamReadBitsIntoList!0 (_2!3078 lt!107411) (_1!3077 lt!107406) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!67389 d!21474))

(declare-fun d!21476 () Bool)

(declare-fun e!44337 () Bool)

(assert (=> d!21476 e!44337))

(declare-fun c!4966 () Bool)

(assert (=> d!21476 (= c!4966 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!108040 () List!712)

(declare-fun e!44338 () tuple2!5942)

(assert (=> d!21476 (= lt!108040 (_1!3082 e!44338))))

(declare-fun c!4967 () Bool)

(assert (=> d!21476 (= c!4967 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!21476 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!21476 (= (bitStreamReadBitsIntoList!0 (_2!3078 lt!107411) (_1!3077 lt!107406) #b0000000000000000000000000000000000000000000000000000000000000001) lt!108040)))

(declare-fun b!67715 () Bool)

(assert (=> b!67715 (= e!44337 (isEmpty!213 lt!108040))))

(declare-fun b!67714 () Bool)

(declare-fun lt!108039 () (_ BitVec 64))

(declare-fun lt!108038 () tuple2!5944)

(assert (=> b!67714 (= e!44338 (tuple2!5943 (Cons!708 (_1!3083 lt!108038) (bitStreamReadBitsIntoList!0 (_2!3078 lt!107411) (_2!3083 lt!108038) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!108039))) (_2!3083 lt!108038)))))

(assert (=> b!67714 (= lt!108038 (readBit!0 (_1!3077 lt!107406)))))

(assert (=> b!67714 (= lt!108039 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!67716 () Bool)

(assert (=> b!67716 (= e!44337 (> (length!340 lt!108040) 0))))

(declare-fun b!67713 () Bool)

(assert (=> b!67713 (= e!44338 (tuple2!5943 Nil!709 (_1!3077 lt!107406)))))

(assert (= (and d!21476 c!4967) b!67713))

(assert (= (and d!21476 (not c!4967)) b!67714))

(assert (= (and d!21476 c!4966) b!67715))

(assert (= (and d!21476 (not c!4966)) b!67716))

(declare-fun m!107933 () Bool)

(assert (=> b!67715 m!107933))

(declare-fun m!107935 () Bool)

(assert (=> b!67714 m!107935))

(declare-fun m!107937 () Bool)

(assert (=> b!67714 m!107937))

(declare-fun m!107939 () Bool)

(assert (=> b!67716 m!107939))

(assert (=> b!67389 d!21476))

(check-sat (not b!67671) (not d!21466) (not b!67663) (not b!67714) (not b!67631) (not b!67636) (not b!67707) (not b!67709) (not d!21468) (not bm!862) (not d!21444) (not d!21442) (not b!67481) (not d!21452) (not b!67703) (not d!21440) (not b!67491) (not b!67635) (not b!67675) (not d!21300) (not b!67474) (not b!67490) (not b!67462) (not b!67715) (not b!67705) (not d!21348) (not d!21328) (not d!21338) (not b!67483) (not b!67650) (not b!67488) (not b!67669) (not b!67676) (not b!67670) (not b!67682) (not b!67673) (not b!67637) (not d!21448) (not d!21460) (not d!21332) (not b!67632) (not b!67708) (not b!67649) (not b!67638) (not b!67710) (not d!21458) (not b!67716) (not b!67652) (not b!67706) (not b!67667) (not b!67665) (not d!21340) (not b!67677) (not b!67712) (not b!67493) (not b!67704) (not d!21464) (not d!21344) (not d!21306) (not d!21454) (not b!67668) (not b!67672) (not b!67651) (not d!21304) (not b!67680) (not d!21456) (not b!67678) (not b!67664) (not b!67685) (not d!21334))
